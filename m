Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5ABB777F77
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 09:30:25 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id t26so96926330qtg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 02:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=O1aBTDbHQhLcYbMPA9BsIhCIIWndnKawOTpc8Rml6mg=;
	b=Noq6JW8Hn7rcMy4eu2B94KklVL6fNhoFxOaD8nTZ1abxE9wFlMTkzbJbomRChwO3Yd
	6qsItvZWwEmiGuGkDXPgrSRzxwcceJKTs5KLw2QkJBVcuWzwOPFudstmK5qr2s2oGg/v
	97iB6PDw+W3fdME+hCvLdQOX4FD50w+BXcEv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=O1aBTDbHQhLcYbMPA9BsIhCIIWndnKawOTpc8Rml6mg=;
	b=SqkYvEvXiP9ObVTtp+Ecr7196K29+SwfvzT+0WDuRCn+CtGPwoynZJ4ropD551o2PH
	9k3FyDQ9cgt6HlfdZmLPtDlwGNHQcct2d+CALrrN/OQ2LscFLulqvWYTVIXjzd6fVtA3
	0prFKMJkPPWALbt4tx1g2G4wJycRd7uhWxgtr6ET+Jegk2jXM/Z1RI+fXhTLzC9Oigzn
	kC2eZoazOoCgGxyqNxQJsMgrtDcOTeVH0fPYZaZ4Fkl9paw6R8olDF21GeTDTy3kMEd0
	zv2VWEe8NdXOxn/lCv49ypbY1wWV6z5MKGeqt5Xv/OF0pIj4nFjKvbajf4VSKXDZVlza
	x8NQ==
X-Gm-Message-State: AODbwcAgTLXYHlmRRhxztItc2w4g5G5tPq/b9shsf2qx8hlkSIH7iIT2
	X7LapcK10+byhqA024YnRA==
X-Received: by 10.200.34.60 with SMTP id o57mr20070465qto.41.1495445425927;
	Mon, 22 May 2017 02:30:25 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	n17sm11667604qtb.6.2017.05.22.02.30.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 May 2017 02:30:25 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 May 2017 11:30:01 +0200
Message-Id: <20170522093003.17711-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170522093003.17711-1-nicolas.dechesne@linaro.org>
References: <20170522093003.17711-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 1/3] android-tools: import from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 May 2017 09:30:25 -0000

Many development boards come with Android bootloaders nowadays (for example, all
Qualcomm based development boards to date). The android-tools provides many
Android specific tools which are useful when working with such boards. For
example, it is fairly common now to rely on fastboot to flash Android sparse
images onto these devices.

android-tools-native will provide all the needed tools to create Android sparse
images, as a standard OE image type, for example.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../android-tools-conf/android-gadget-setup        |  25 +++
 .../android-tools/android-tools-conf_1.0.bb        |  13 ++
 .../android-tools/android-tools/.gitignore         |  57 +++++++
 .../android-tools/android-tools/adb.mk             |  72 +++++++++
 .../android-tools/android-tools/adbd.mk            | 163 ++++++++++++++++++++
 .../android-tools/android-tools/ext4_utils.mk      | 103 +++++++++++++
 .../android-tools/android-tools/fastboot.mk        |  89 +++++++++++
 .../android-tools/android-tools/mkbootimg.mk       |  29 ++++
 .../android-tools/android-tools_5.1.1.r37.bb       | 168 +++++++++++++++++++++
 9 files changed, 719 insertions(+)
 create mode 100644 meta/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
 create mode 100644 meta/recipes-devtools/android-tools/android-tools-conf_1.0.bb
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/.gitignore
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/adb.mk
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/adbd.mk
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/ext4_utils.mk
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/fastboot.mk
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/mkbootimg.mk
 create mode 100644 meta/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb

diff --git a/meta/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup b/meta/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
new file mode 100644
index 0000000000..f7d9973722
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+# TODO enable the lines below once we have support for getprop
+# retrieve the product info from Android
+# manufacturer=$(getprop ro.product.manufacturer Android)
+# model=$(getprop ro.product.model Android)
+# serial=$(getprop ro.serialno 0123456789ABCDEF)
+
+manufacturer="$(cat /system/build.prop | grep -o 'ro.product.manufacturer=.*' | cut -d'=' -f 2)"
+model="$(cat /system/build.prop | grep -o 'ro.product.model=.*' | cut -d'=' -f 2)"
+# get the device serial number from /proc/cmdline directly(since we have no getprop on
+# GNU/Linux)
+serial="$(cat /proc/cmdline | sed 's/.*androidboot.serialno=//' | sed 's/ .*//')"
+
+echo $serial > /sys/class/android_usb/android0/iSerial
+echo $manufacturer > /sys/class/android_usb/android0/iManufacturer
+echo $model > /sys/class/android_usb/android0/iProduct
+
+echo "0" > /sys/class/android_usb/android0/enable
+echo "18d1" > /sys/class/android_usbid_usb/android0/idVendor
+echo "D002" > /sys/class/android_usb/android0/idProduct
+echo "adb" > /sys/class/android_usb/android0/functions
+echo "1" >  /sys/class/android_usb/android0/enable
+
+sleep 4
diff --git a/meta/recipes-devtools/android-tools/android-tools-conf_1.0.bb b/meta/recipes-devtools/android-tools/android-tools-conf_1.0.bb
new file mode 100644
index 0000000000..af98f92f05
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools-conf_1.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Different utilities from Android - corressponding configuration files"
+SECTION = "console/utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://android-gadget-setup"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/android-gadget-setup ${D}${bindir}
+}
diff --git a/meta/recipes-devtools/android-tools/android-tools/.gitignore b/meta/recipes-devtools/android-tools/android-tools/.gitignore
new file mode 100644
index 0000000000..b8a08f8248
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools/.gitignore
@@ -0,0 +1,57 @@
+*
+!.gitignore
+!*.indirectionsymlink
+!*.[ch]
+!*.mk
+!NOTICE
+!MODULE_LICENSE_*
+!/system/
+!/system/core/
+!/system/core/adb/
+!/system/core/fastboot/
+!/system/core/fs_mgr/
+!/system/core/fs_mgr/include/
+!/system/core/include/
+!/system/core/include/android/
+!/system/core/include/cutils/
+!/system/core/include/log/
+!/system/core/include/mincrypt/
+!/system/core/include/private/
+!/system/core/include/utils/
+!/system/core/include/zipfile/
+!/system/core/liblog/
+!/system/core/liblog/tests/
+!/system/core/libcutils/
+!/system/core/libmincrypt/
+!/system/core/libzipfile/
+!/system/core/libsparse/
+!/system/core/libsparse/include/
+!/system/core/libsparse/include/sparse/
+!/system/core/libsparse/simg_dump.py
+!/system/core/mkbootimg/
+!/system/extras/
+!/system/extras/ext4_utils/
+!/system/extras/ext4_utils/mkuserimg.sh
+!/system/extras/ext4_utils/test_ext4fixup
+!/system/extras/f2fs_utils/
+!/hardware/
+!/hardware/libhardware/
+!/hardware/libhardware/include/
+!/hardware/libhardware/include/hardware/
+!/external/
+!/external/libselinux/
+!/external/libselinux/include/
+!/external/libselinux/include/selinux/
+!/external/libselinux/src/
+!/external/f2fs-tools/
+!/external/f2fs-tools/include/
+!/external/f2fs-tools/lib/
+!/external/f2fs-tools/mkfs/
+!/build/
+!/build/core/
+!/build/core/version_defaults.mk
+!/build/core/combo/
+!/build/core/combo/include/
+!/build/core/combo/include/arch/
+!/build/core/combo/include/arch/linux-*/
+!/build/core/combo/include/arch/linux-*/AndroidConfig.h
diff --git a/meta/recipes-devtools/android-tools/android-tools/adb.mk b/meta/recipes-devtools/android-tools/android-tools/adb.mk
new file mode 100644
index 0000000000..0687c22c17
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools/adb.mk
@@ -0,0 +1,72 @@
+# Makefile for adb
+
+SRCDIR ?= $(S)
+
+VPATH += $(SRCDIR)/system/core/adb
+adb_SRC_FILES += adb.c
+adb_SRC_FILES += console.c
+adb_SRC_FILES += transport.c
+adb_SRC_FILES += transport_local.c
+adb_SRC_FILES += transport_usb.c
+adb_SRC_FILES += commandline.c
+adb_SRC_FILES += adb_client.c
+adb_SRC_FILES += adb_auth_host.c
+adb_SRC_FILES += sockets.c
+adb_SRC_FILES += services.c
+adb_SRC_FILES += file_sync_client.c
+adb_SRC_FILES += get_my_path_linux.c
+adb_SRC_FILES += usb_linux.c
+adb_SRC_FILES += usb_vendors.c
+adb_SRC_FILES += fdevent.c
+adb_OBJS := $(adb_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/libcutils
+libcutils_SRC_FILES += atomic.c
+libcutils_SRC_FILES += hashmap.c
+libcutils_SRC_FILES += native_handle.c
+libcutils_SRC_FILES += config_utils.c
+libcutils_SRC_FILES += cpu_info.c
+libcutils_SRC_FILES += load_file.c
+# libcutils_SRC_FILES += open_memstream.c
+# libcutils_SRC_FILES += strdup16to8.c
+# libcutils_SRC_FILES += strdup8to16.c
+# libcutils_SRC_FILES += record_stream.c
+# libcutils_SRC_FILES += process_name.c
+# libcutils_SRC_FILES += threads.c
+# libcutils_SRC_FILES += sched_policy.c
+# libcutils_SRC_FILES += iosched_policy.c
+libcutils_SRC_FILES += str_parms.c
+libcutils_SRC_FILES += fs.c
+libcutils_SRC_FILES += multiuser.c
+libcutils_SRC_FILES += socket_inaddr_any_server.c
+libcutils_SRC_FILES += socket_local_client.c
+libcutils_SRC_FILES += socket_local_server.c
+libcutils_SRC_FILES += socket_loopback_client.c
+libcutils_SRC_FILES += socket_loopback_server.c
+libcutils_SRC_FILES += socket_network_client.c
+libcutils_SRC_FILES += sockets.c
+libcutils_SRC_FILES += ashmem-host.c
+libcutils_SRC_FILES += dlmalloc_stubs.c
+libcutils_OBJS := $(libcutils_SRC_FILES:.c=.o)
+
+CFLAGS += -DANDROID
+CFLAGS += -DWORKAROUND_BUG6558362
+CFLAGS += -DADB_HOST=1
+CFLAGS += -D_XOPEN_SOURCE -D_GNU_SOURCE
+CFLAGS += -DANDROID_SMP=0
+CFLAGS += -I$(SRCDIR)/system/core/adb
+CFLAGS += -I$(SRCDIR)/system/core/include
+CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+
+LIBS += libcutils.a -lpthread -lcrypto
+
+all: adb
+
+adb: libcutils.a $(adb_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(adb_OBJS) $(LIBS)
+
+libcutils.a: $(libcutils_OBJS)
+	$(AR) rcs $@ $(libcutils_OBJS)
+
+clean:
+	$(RM) $(adb_OBJS) $(libcutils_OBJS) adb *.a
diff --git a/meta/recipes-devtools/android-tools/android-tools/adbd.mk b/meta/recipes-devtools/android-tools/android-tools/adbd.mk
new file mode 100644
index 0000000000..84cd06b109
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools/adbd.mk
@@ -0,0 +1,163 @@
+# Makefile for adbd
+
+SRCDIR ?= $(S)
+
+VPATH += $(SRCDIR)/system/core/adb
+adbd_SRC_FILES += adb.c
+adbd_SRC_FILES += fdevent.c
+adbd_SRC_FILES += transport.c
+adbd_SRC_FILES += transport_local.c
+adbd_SRC_FILES += transport_usb.c
+adbd_SRC_FILES += adb_auth_client.c
+adbd_SRC_FILES += sockets.c
+adbd_SRC_FILES += services.c
+adbd_SRC_FILES += file_sync_service.c
+adbd_SRC_FILES += jdwp_service.c
+adbd_SRC_FILES += framebuffer_service.c
+adbd_SRC_FILES += remount_service.c
+adbd_SRC_FILES += disable_verity_service.c
+adbd_SRC_FILES += usb_linux_client.c
+adbd_OBJS := $(adbd_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/liblog
+liblog_SRC_FILES += logd_write.c
+liblog_SRC_FILES += log_event_write.c
+liblog_SRC_FILES += logprint.c
+liblog_SRC_FILES += event_tag_map.c
+liblog_SRC_FILES += fake_log_device.c
+liblog_OBJS := $(liblog_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/fs_mgr
+fs_mgr_SRC_FILES += fs_mgr_fstab.c
+fs_mgr_OBJS := $(fs_mgr_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/libcutils
+libcutils_SRC_FILES += atomic.c
+libcutils_SRC_FILES += hashmap.c
+libcutils_SRC_FILES += native_handle.c
+libcutils_SRC_FILES += config_utils.c
+libcutils_SRC_FILES += cpu_info.c
+libcutils_SRC_FILES += load_file.c
+# libcutils_SRC_FILES += open_memstream.c
+# libcutils_SRC_FILES += strdup16to8.c
+# libcutils_SRC_FILES += strdup8to16.c
+# libcutils_SRC_FILES += record_stream.c
+# libcutils_SRC_FILES += process_name.c
+# libcutils_SRC_FILES += threads.c
+# libcutils_SRC_FILES += sched_policy.c
+# libcutils_SRC_FILES += iosched_policy.c
+libcutils_SRC_FILES += str_parms.c
+libcutils_SRC_FILES += fs.c
+libcutils_SRC_FILES += multiuser.c
+libcutils_SRC_FILES += socket_inaddr_any_server.c
+libcutils_SRC_FILES += socket_local_client.c
+libcutils_SRC_FILES += socket_local_server.c
+libcutils_SRC_FILES += socket_loopback_client.c
+libcutils_SRC_FILES += socket_loopback_server.c
+libcutils_SRC_FILES += socket_network_client.c
+libcutils_SRC_FILES += sockets.c
+libcutils_SRC_FILES += ashmem-host.c
+libcutils_SRC_FILES += dlmalloc_stubs.c
+libcutils_SRC_FILES += klog.c
+libcutils_SRC_FILES += properties.c
+libcutils_OBJS := $(libcutils_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/external/libselinux/src
+libselinux_SRC_FILES += booleans.c
+libselinux_SRC_FILES += canonicalize_context.c
+libselinux_SRC_FILES += disable.c
+libselinux_SRC_FILES += enabled.c
+libselinux_SRC_FILES += fgetfilecon.c
+libselinux_SRC_FILES += fsetfilecon.c
+libselinux_SRC_FILES += getenforce.c
+libselinux_SRC_FILES += getfilecon.c
+libselinux_SRC_FILES += getpeercon.c
+libselinux_SRC_FILES += lgetfilecon.c
+libselinux_SRC_FILES += load_policy.c
+libselinux_SRC_FILES += lsetfilecon.c
+libselinux_SRC_FILES += policyvers.c
+libselinux_SRC_FILES += procattr.c
+libselinux_SRC_FILES += setenforce.c
+libselinux_SRC_FILES += setfilecon.c
+libselinux_SRC_FILES += context.c
+libselinux_SRC_FILES += mapping.c
+libselinux_SRC_FILES += stringrep.c
+libselinux_SRC_FILES += compute_create.c
+libselinux_SRC_FILES += compute_av.c
+libselinux_SRC_FILES += avc.c
+libselinux_SRC_FILES += avc_internal.c
+libselinux_SRC_FILES += avc_sidtab.c
+libselinux_SRC_FILES += get_initial_context.c
+libselinux_SRC_FILES += checkAccess.c
+libselinux_SRC_FILES += sestatus.c
+libselinux_SRC_FILES += deny_unknown.c
+
+libselinux_SRC_FILES += callbacks.c
+libselinux_SRC_FILES += check_context.c
+libselinux_SRC_FILES += freecon.c
+libselinux_SRC_FILES += init.c
+libselinux_SRC_FILES += label.c
+libselinux_SRC_FILES += label_file.c
+libselinux_SRC_FILES += label_android_property.c
+libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/extras/ext4_utils
+libext4_utils_SRC_FILES += make_ext4fs.c
+libext4_utils_SRC_FILES += ext4fixup.c
+libext4_utils_SRC_FILES += ext4_utils.c
+libext4_utils_SRC_FILES += allocate.c
+libext4_utils_SRC_FILES += contents.c
+libext4_utils_SRC_FILES += extent.c
+libext4_utils_SRC_FILES += indirect.c
+libext4_utils_SRC_FILES += uuid.c
+libext4_utils_SRC_FILES += sha1.c
+libext4_utils_SRC_FILES += wipe.c
+libext4_utils_SRC_FILES += crc16.c
+libext4_utils_SRC_FILES += ext4_sb.c
+libext4_utils_OBJS := $(libext4_utils_SRC_FILES:.c=.o)
+
+CFLAGS += -std=gnu11
+CFLAGS += -DANDROID
+CFLAGS += -DADB_HOST=0
+CFLAGS += -D_XOPEN_SOURCE -D_GNU_SOURCE
+CFLAGS += -DALLOW_ADBD_ROOT=1
+CFLAGS += -DALLOW_ADBD_DISABLE_VERITY=1
+CFLAGS += -DPROP_NAME_MAX=32
+CFLAGS += -DPROP_VALUE_MAX=92
+CFLAGS += -DAUDITD_LOG_TAG=1003
+# CFLAGS += -DHOST
+CFLAGS += -DANDROID_SMP=0
+CFLAGS += -I$(SRCDIR)/system/core/adb
+CFLAGS += -I$(SRCDIR)/system/core/include
+CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
+CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
+CFLAGS += -I$(SRCDIR)/system/core/fs_mgr/include
+CFLAGS += -I$(SRCDIR)/hardware/libhardware/include
+CFLAGS += -I$(SRCDIR)/external/libselinux/include
+CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+
+LIBS += liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a -lpthread -lbsd -lpcre -lresolv -lcrypto
+
+all: adbd
+
+adbd: liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a $(adbd_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(adbd_OBJS) $(LIBS)
+
+liblog.a: $(liblog_OBJS)
+	$(AR) rcs $@ $(liblog_OBJS)
+
+libfs_mgr.a: $(fs_mgr_OBJS)
+	$(AR) rcs $@ $(fs_mgr_OBJS)
+
+libcutils.a: $(libcutils_OBJS)
+	$(AR) rcs $@ $(libcutils_OBJS)
+
+libselinux.a: $(libselinux_OBJS)
+	export CFLAGS="-DANDROID -DHOST"
+	$(AR) rcs $@ $(libselinux_OBJS)
+
+libext4_utils.a: $(libext4_utils_OBJS)
+	$(AR) rcs $@ $(libext4_utils_OBJS)
+
+clean:
+	$(RM) *.o *.a adbd
diff --git a/meta/recipes-devtools/android-tools/android-tools/ext4_utils.mk b/meta/recipes-devtools/android-tools/android-tools/ext4_utils.mk
new file mode 100644
index 0000000000..c18aa9c4d2
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools/ext4_utils.mk
@@ -0,0 +1,103 @@
+# Makefile for ext4_utils
+
+SRCDIR ?= $(S)
+
+VPATH += $(SRCDIR)/system/extras/ext4_utils
+make_ext4fs_SRC_FILES += make_ext4fs_main.c
+make_ext4fs_SRC_FILES += canned_fs_config.c
+make_ext4fs_OBJS := $(make_ext4fs_SRC_FILES:.c=.o)
+
+ext2simg_SRC_FILES += ext2simg.c
+ext2simg_OBJS := $(ext2simg_SRC_FILES:.c=.o)
+
+ext4fixup_SRC_FILES += ext4fixup_main.c
+ext4fixup_OBJS := $(ext4fixup_SRC_FILES:.c=.o)
+
+libext4_utils_SRC_FILES += make_ext4fs.c
+libext4_utils_SRC_FILES += ext4fixup.c
+libext4_utils_SRC_FILES += ext4_utils.c
+libext4_utils_SRC_FILES += allocate.c
+libext4_utils_SRC_FILES += contents.c
+libext4_utils_SRC_FILES += extent.c
+libext4_utils_SRC_FILES += indirect.c
+libext4_utils_SRC_FILES += uuid.c
+libext4_utils_SRC_FILES += sha1.c
+libext4_utils_SRC_FILES += wipe.c
+libext4_utils_SRC_FILES += crc16.c
+libext4_utils_SRC_FILES += ext4_sb.c
+libext4_utils_OBJS := $(libext4_utils_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/libsparse
+simg2img_SRC_FILES += simg2img.c
+simg2img_SRC_FILES += sparse_crc32.c
+simg2img_OBJS := $(simg2img_SRC_FILES:.c=.o)
+
+img2simg_SRC_FILES += img2simg.c
+img2simg_OBJS := $(img2simg_SRC_FILES:.c=.o)
+
+simg2simg_SRC_FILES += simg2simg.c
+simg2simg_SRC_FILES += sparse_crc32.c
+simg2simg_OBJS := $(simg2simg_SRC_FILES:.c=.o)
+
+libsparse_SRC_FILES += backed_block.c
+libsparse_SRC_FILES += output_file.c
+libsparse_SRC_FILES += sparse.c
+libsparse_SRC_FILES += sparse_crc32.c
+libsparse_SRC_FILES += sparse_err.c
+libsparse_SRC_FILES += sparse_read.c
+libsparse_OBJS := $(libsparse_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/external/libselinux/src
+libselinux_SRC_FILES += callbacks.c
+libselinux_SRC_FILES += check_context.c
+libselinux_SRC_FILES += freecon.c
+libselinux_SRC_FILES += init.c
+libselinux_SRC_FILES += label.c
+libselinux_SRC_FILES += label_file.c
+libselinux_SRC_FILES += label_android_property.c
+libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)
+
+CFLAGS += -DANDROID
+CFLAGS += -DHOST
+CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
+CFLAGS += -I$(SRCDIR)/system/core/include
+CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
+CFLAGS += -I$(SRCDIR)/external/libselinux/include
+CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+
+all: make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg
+
+make_ext4fs: libext4_utils.a libsparse.a libselinux.a $(make_ext4fs_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(make_ext4fs_OBJS) \
+		libext4_utils.a libsparse.a libselinux.a -lz -lpcre
+
+ext2simg: libext4_utils.a libselinux.a libsparse.a $(ext2simg_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(ext2simg_OBJS) \
+		libext4_utils.a libselinux.a libsparse.a -lz -lpcre
+
+ext4fixup: libext4_utils.a libsparse.a $(ext4fixup_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(ext4fixup_OBJS) libext4_utils.a libsparse.a -lz
+
+simg2img: libsparse.a $(simg2img_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(simg2img_OBJS) libsparse.a -lz
+
+img2simg: libsparse.a $(img2simg_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(img2simg_OBJS) libsparse.a -lz
+
+simg2simg: libsparse.a $(simg2simg_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(simg2simg_OBJS) libsparse.a -lz
+
+libext4_utils.a: $(libext4_utils_OBJS)
+	$(AR) rcs $@ $(libext4_utils_OBJS)
+
+libsparse.a: $(libsparse_OBJS)
+	$(AR) rcs $@ $(libsparse_OBJS)
+
+libselinux.a: $(libselinux_OBJS)
+	$(AR) rcs $@ $(libselinux_OBJS)
+
+clean:
+	$(RM) $(make_ext4fs_OBJS) $(ext2simg_OBJS) $(ext4fixup_OBJS) \
+		$(simg2img_OBJS) $(img2simg_OBJS) $(simg2simg_OBJS) \
+		$(libext4_utils_OBJS) $(libsparse_OBJS) $(libselinux_OBJS) \
+		make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg *.a
diff --git a/meta/recipes-devtools/android-tools/android-tools/fastboot.mk b/meta/recipes-devtools/android-tools/android-tools/fastboot.mk
new file mode 100644
index 0000000000..b9ba95f38a
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools/fastboot.mk
@@ -0,0 +1,89 @@
+# Makefile for fastboot
+
+SRCDIR ?= $(S)
+
+VPATH += $(SRCDIR)/system/core/fastboot
+fastboot_SRC_FILES += protocol.c
+fastboot_SRC_FILES += engine.c
+fastboot_SRC_FILES += bootimg.c
+fastboot_SRC_FILES += fastboot.c
+fastboot_SRC_FILES += util.c
+fastboot_SRC_FILES += fs.c
+fastboot_SRC_FILES += usb_linux.c
+fastboot_SRC_FILES += util_linux.c
+fastboot_OBJS := $(fastboot_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/libzipfile
+libzipfile_SRC_FILES += centraldir.c
+libzipfile_SRC_FILES += zipfile.c
+libzipfile_OBJS := $(libzipfile_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/extras/ext4_utils
+libext4_utils_SRC_FILES += make_ext4fs.c
+libext4_utils_SRC_FILES += ext4fixup.c
+libext4_utils_SRC_FILES += ext4_utils.c
+libext4_utils_SRC_FILES += allocate.c
+libext4_utils_SRC_FILES += contents.c
+libext4_utils_SRC_FILES += extent.c
+libext4_utils_SRC_FILES += indirect.c
+libext4_utils_SRC_FILES += uuid.c
+libext4_utils_SRC_FILES += sha1.c
+libext4_utils_SRC_FILES += wipe.c
+libext4_utils_SRC_FILES += crc16.c
+libext4_utils_SRC_FILES += ext4_sb.c
+libext4_utils_OBJS := $(libext4_utils_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/libsparse
+libsparse_SRC_FILES += backed_block.c
+libsparse_SRC_FILES += output_file.c
+libsparse_SRC_FILES += sparse.c
+libsparse_SRC_FILES += sparse_crc32.c
+libsparse_SRC_FILES += sparse_err.c
+libsparse_SRC_FILES += sparse_read.c
+libsparse_OBJS := $(libsparse_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/external/libselinux/src
+libselinux_SRC_FILES += callbacks.c
+libselinux_SRC_FILES += check_context.c
+libselinux_SRC_FILES += freecon.c
+libselinux_SRC_FILES += init.c
+libselinux_SRC_FILES += label.c
+libselinux_SRC_FILES += label_file.c
+libselinux_SRC_FILES += label_android_property.c
+libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)
+
+CFLAGS += -std=gnu11
+CFLAGS += -DANDROID
+# CFLAGS += -DUSE_F2FS
+CFLAGS += -DHOST
+CFLAGS += -I$(SRCDIR)/system/core/fastboot
+CFLAGS += -I$(SRCDIR)/system/core/include
+CFLAGS += -I$(SRCDIR)/system/core/mkbootimg
+CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
+CFLAGS += -I$(SRCDIR)/system/extras/f2fs_utils
+CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
+CFLAGS += -I$(SRCDIR)/external/libselinux/include
+CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+
+LIBS += libzipfile.a libext4_utils.a libsparse.a libselinux.a -lz -lpcre
+
+all: fastboot
+
+fastboot: libzipfile.a libext4_utils.a libsparse.a libselinux.a $(fastboot_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(fastboot_OBJS) $(LIBS)
+
+libzipfile.a: $(libzipfile_OBJS)
+	$(AR) rcs $@ $(libzipfile_OBJS)
+
+libext4_utils.a: $(libext4_utils_OBJS)
+	$(AR) rcs $@ $(libext4_utils_OBJS)
+
+libsparse.a: $(libsparse_OBJS)
+	$(AR) rcs $@ $(libsparse_OBJS)
+
+libselinux.a: $(libselinux_OBJS)
+	$(AR) rcs $@ $(libselinux_OBJS)
+
+clean:
+	$(RM) $(fastboot_OBJS) $(libzipfile_OBJS) $(libext4_utils_OBJS) \
+		$(libsparse_OBJS) $(libselinux_OBJS) fastboot *.a
diff --git a/meta/recipes-devtools/android-tools/android-tools/mkbootimg.mk b/meta/recipes-devtools/android-tools/android-tools/mkbootimg.mk
new file mode 100644
index 0000000000..519f609fd2
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools/mkbootimg.mk
@@ -0,0 +1,29 @@
+# Makefile for mkbootimg
+
+SRCDIR ?= $(S)
+
+VPATH += $(SRCDIR)/system/core/mkbootimg
+mkbootimg_SRC_FILES += mkbootimg.c
+mkbootimg_OBJS := $(mkbootimg_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/libmincrypt
+libmincrypt_SRC_FILES := dsa_sig.c p256.c p256_ec.c p256_ecdsa.c rsa.c sha.c sha256.c
+libmincrypt_OBJS := $(libmincrypt_SRC_FILES:.c=.o)
+
+CFLAGS += -DANDROID
+CFLAGS += -I$(SRCDIR)/system/core/mkbootimg
+CFLAGS += -I$(SRCDIR)/system/core/include
+CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+
+LIBS += libmincrypt.a
+
+all: mkbootimg
+
+mkbootimg: libmincrypt.a $(mkbootimg_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(mkbootimg_OBJS) $(LIBS)
+
+libmincrypt.a: $(libmincrypt_OBJS)
+	$(AR) rcs $@ $(libmincrypt_OBJS)
+
+clean:
+	$(RM) $(mkbootimg_OBJS) $(libmincrypt_OBJS) mkbootimg *.a
diff --git a/meta/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
new file mode 100644
index 0000000000..34fddcbda7
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -0,0 +1,168 @@
+DESCRIPTION = "Different utilities from Android"
+SECTION = "console/utils"
+LICENSE = "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM = " \
+    file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
+    file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+    file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378 \
+    file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
+"
+DEPENDS = "libbsd libpcre openssl zlib libcap"
+
+ANDROID_TAG = "android-5.1.1_r37"
+ANDROID_MIRROR = "android.googlesource.com"
+CORE_REPO = "${ANDROID_MIRROR}/platform/system/core"
+EXTRAS_REPO = "${ANDROID_MIRROR}/platform/system/extras"
+LIBHARDWARE_REPO = "${ANDROID_MIRROR}/platform/hardware/libhardware"
+LIBSELINUX_REPO = "${ANDROID_MIRROR}/platform/external/libselinux"
+BUILD_REPO = "${ANDROID_MIRROR}/platform/build"
+
+SRC_URI = " \
+    git://${CORE_REPO};name=core;protocol=https;nobranch=1;destsuffix=git/system/core;tag=${ANDROID_TAG} \
+    git://${EXTRAS_REPO};name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras;tag=${ANDROID_TAG} \
+    git://${LIBHARDWARE_REPO};name=libhardware;protocol=https;nobranch=1;destsuffix=git/hardware/libhardware;tag=${ANDROID_TAG} \
+    git://${LIBSELINUX_REPO};name=libselinux;protocol=https;nobranch=1;destsuffix=git/external/libselinux;tag=${ANDROID_TAG} \
+    git://${BUILD_REPO};name=build;protocol=https;nobranch=1;destsuffix=git/build;tag=${ANDROID_TAG} \
+    file://remove-selinux-android.patch \
+    file://use-capability.patch \
+    file://use-local-socket.patch \
+    file://preserve-ownership.patch \
+    file://mkbootimg-Add-dt-parameter-to-specify-DT-image.patch \
+    file://remove-bionic-android.patch \
+    file://define-shell-command.patch \
+    file://implicit-declaration-function-strlcat-strlcopy.patch \
+    file://fix-big-endian-build.patch \
+    file://android-tools-adbd.service \
+    file://.gitignore;subdir=git \
+    file://adb.mk;subdir=${BPN} \
+    file://adbd.mk;subdir=${BPN} \
+    file://ext4_utils.mk;subdir=${BPN} \
+    file://fastboot.mk;subdir=${BPN} \
+    file://mkbootimg.mk;subdir=${BPN} \
+"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/${BPN}"
+
+# http://errors.yoctoproject.org/Errors/Details/133881/
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "android-tools-adbd.service"
+
+# Get rid of files uneeded to build Android tools
+do_unpack_extra() {
+    cd ${S}
+    rm -rf \
+      system/core/.git \
+      system/extras/.git \
+      hardware/libhardware/.git \
+      external/libselinux/.git \
+      build/.git
+    git init
+    git add .
+    git commit -m \
+      "Initial import - committed ${ANDROID_TAG}"
+    git clean -fdx
+}
+
+addtask unpack_extra after do_unpack before do_patch
+
+# Find libbsd headers during native builds
+CC_append_class-native = " -I${STAGING_INCDIR}"
+CC_append_class-nativesdk = " -I${STAGING_INCDIR}"
+
+TOOLS = "adb fastboot ext4_utils mkbootimg adbd"
+
+# Adb needs sys/capability.h, which is not available for native*
+TOOLS_class-native = "fastboot ext4_utils mkbootimg"
+TOOLS_class-nativesdk = "fastboot ext4_utils mkbootimg"
+
+do_compile() {
+    # Setting both variables below causing our makefiles to not work with
+    # implicit make rules
+    unset CFLAGS
+    unset CPPFLAGS
+
+    export SRCDIR=${S}
+
+    case "${HOST_ARCH}" in
+      arm)
+        export android_arch=linux-arm
+      ;;
+      aarch64)
+        export android_arch=linux-arm64
+      ;;
+      mips|mipsel)
+        export android_arch=linux-mips
+      ;;
+      powerpc|powerpc64)
+        export android_arch=linux-ppc
+      ;;
+      i586|x86_64)
+        export android_arch=linux-x86
+      ;;
+    esac
+
+    for tool in ${TOOLS}; do
+      mkdir -p ${B}/${tool}
+      oe_runmake -f ${B}/${tool}.mk -C ${B}/${tool}
+    done
+}
+
+do_install() {
+    if echo ${TOOLS} | grep -q "ext4_utils" ; then
+        install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py ${D}${bindir}/simg_dump
+        install -D -p -m0755 ${S}/system/extras/ext4_utils/mkuserimg.sh ${D}${bindir}/mkuserimg
+
+        install -m0755 ${B}/ext4_utils/ext2simg ${D}${bindir}
+        install -m0755 ${B}/ext4_utils/ext4fixup ${D}${bindir}
+        install -m0755 ${B}/ext4_utils/img2simg ${D}${bindir}
+        install -m0755 ${B}/ext4_utils/make_ext4fs ${D}${bindir}
+        install -m0755 ${B}/ext4_utils/simg2img ${D}${bindir}
+        install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
+    fi
+
+    if echo ${TOOLS} | grep -q "adb " ; then
+        install -d ${D}${bindir}
+        install -m0755 ${B}/adb/adb ${D}${bindir}
+    fi
+
+    if echo ${TOOLS} | grep -q "adbd" ; then
+        install -d ${D}${bindir}
+        install -m0755 ${B}/adbd/adbd ${D}${bindir}
+    fi
+
+    # Outside the if statement to avoid errors during do_package
+    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
+      ${D}${systemd_unitdir}/system/android-tools-adbd.service
+
+    if echo ${TOOLS} | grep -q "fastboot" ; then
+        install -d ${D}${bindir}
+        install -m0755 ${B}/fastboot/fastboot ${D}${bindir}
+    fi
+
+    if echo ${TOOLS} | grep -q "mkbootimg" ; then
+        install -d ${D}${bindir}
+        install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
+    fi
+}
+
+PACKAGES += "${PN}-fstools"
+
+RDEPENDS_${BPN} = "${BPN}-conf bash"
+
+FILES_${PN}-fstools = "\
+    ${bindir}/ext2simg \
+    ${bindir}/ext4fixup \
+    ${bindir}/img2simg \
+    ${bindir}/make_ext4fs \
+    ${bindir}/simg2img \
+    ${bindir}/simg2simg \
+    ${bindir}/simg_dump \
+    ${bindir}/mkuserimg \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.11.0


