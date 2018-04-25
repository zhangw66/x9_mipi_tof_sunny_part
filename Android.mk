LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES :=	\
        sample/spectreSampleCalc.cpp \
        sample/spectreSampleProcessing.cpp
					
LOCAL_C_INCLUDES := \
       $(LOCAL_PATH)/inc \
       $(LOCAL_PATH)/inc2

LOCAL_SHARED_LIBRARIES := 
	
LOCAL_STATIC_LIBRARIES :=
	
#LOCAL_LDFLAGS := -fPIE -pie
#LOCAL_LDFLAGS += -L$(LOCAL_PATH)/libs2  -lsimd -ljpeg
#LOCAL_CFLAGS += -fPIC -Wno-multichar -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -w
#LOCAL_CFLAGS += -DANDROID_NDK
	
LOCAL_LDLIBS += -llog
LOCAL_LDLIBS += -lz

DEBUG_READ_FILE_VAL=1
LOCAL_CPPFLAGS += -DTARGET_PLATFORM_ANDROID \
-DUSE_SUNNY_EEPROM_CALIBRATION_DATA \
-DDEBUG_READ_FILE=${DEBUG_READ_FILE_VAL} \
-std=c++0x -fexceptions -frtti -w 

LOCAL_LDFLAGS += \
-DANDROID \
-DBRIDGE_ENCLUSTRA_IMPLEMENTATION_LIBUSB \
-DBRIDGE_PMD_IMPLEMENTATION_LIBUSB \
-DBRIDGE_UVC_IMPLEMENTATION_LIBUVC \
-DROYALE_BRIDGE_ENCLUSTRA \
-DROYALE_BRIDGE_ENCLUSTRA_LIBUSB \
-DROYALE_BRIDGE_PMD \
-DROYALE_BRIDGE_PMD_LIBUSB \
-DROYALE_BRIDGE_UVC \
-DROYALE_BRIDGE_UVC_LIBUVC \
-DROYALE_TARGET_PLATFORM_ANDROID \
-DROYALE_VERSION_BUILD=0 \
-DROYALE_VERSION_MAJOR=2 \
-DROYALE_VERSION_MINOR=3 \
-DROYALE_VERSION_PATCH=0 \
-DRRFACCESSAPI_EXPORTS \
-DTARGET_PLATFORM_ANDROID \
-DTEST_UVC \
-DTEST_UVC_LIBUVC \
-DUSE_SPECTRE \
-DrrfReaderLib_EXPORTS \
-fexceptions \
-frtti \
-Wno-psabi \
-funwind-tables \
-finline-limit=64 \
-fsigned-char \
-no-canonical-prefixes \
-mfloat-abi=softfp \
-mfpu=vfpv3-d16 \
-fdata-sections \
-ffunction-sections \
-Wa,--noexecstack \
-fPIC \
-std=c++11 \
-ffast-math \
-DROYALE_USE_LOGGING \
-mthumb \
-fomit-frame-pointer \
-fno-strict-aliasing \
-Ofast \
-s \
-DNDEBUG \
-fPIC 

#APP_STL := gnustl_static
LOCAL_LDFLAGS += -L$(LOCAL_PATH)/libs  -lspectre3 -lspectre_calibration -lspectre_processing -lvideo

LOCAL_CPPFLAGS += -pie -fPIE
LOCAL_LDFLAGS += -pie -fPIE

LOCAL_MODULE_PATH = $(LOCAL_PATH)
LOCAL_MODULE_TAGS := debug
LOCAL_MODULE:= sunnySpectreProcessing
include $(BUILD_EXECUTABLE)
