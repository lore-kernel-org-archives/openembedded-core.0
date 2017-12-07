Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 73C2F600BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 16:09:47 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z18so8034262wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Dec 2017 08:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0+agW0QF9NeUGc4vxwLWb6Te70DPPUUmg49Mo1CaRNU=;
	b=cEloU7ZnWnLY9JYYBmXHAqP7DqXYbZmpBc3QiFudc6A75CWZEZeZqqiblqtnOd8vYy
	uyf7NbhyIT+nn5dCKC4qpzjt/nijexg4lMaVZCWgnKLmCSgOS6Y9THfFUfShkS+/5A7G
	YQlHrTIJs9NmF/F+QZrADBbJf0Q7zhK7T5FzZXxDsuYYwKureWFKdprIKKc3fRprkhiA
	jyyI/y7TEjx9zoZ0hqHGIp/svQC2gEWMMVHxgtL3l1lf04ni99lDPykHwoNyz5cx+Oq7
	2nGzmBy0vmxErsQu7BBFB6nx5n1VnVQradw8R1h/hIM9zdjqW3nfEBpWclIvZ6Lzn0l2
	nUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0+agW0QF9NeUGc4vxwLWb6Te70DPPUUmg49Mo1CaRNU=;
	b=iJXLHxoPpCZ7R5sueZ5TCSEZ4VaFv7YLFf3MhsriV6+dineO4zPWSorPzm/RQ7Kuln
	V8LmUudzC8rbtf3za629H+ChtuBjS7bf7iNoQpsoOjku/Z/TLAUCOuNS/2sl6ppKd5Yl
	CRO2M9fDXYeB2YTxsTRbPdHSIV86meoxJWI2AIeSLnJnnOjztvue7qVP08b95Vb8cmod
	fNOaYA7cKKG42FxpQx2/i4xrk92nKnGGh6iAikSce4vGA+BE7GiGbeMdn/GP8bzVYJLt
	2yhduEVwYdoUOsj4HqxnBNVpuO183M5fuyp1/EgvrMIstDJb2MQyo2FkTL9Xqe7tiMba
	/fLA==
X-Gm-Message-State: AJaThX4Il5Uja3VlfDr9G3UHZoLOv0I7mhEZBPays/HYlyP37tgzT7M8
	hvVMTftRT72HyLEobUI+YRc4Qw8m
X-Google-Smtp-Source: AGs4zMaIjLEeIya/4QYFsizpxPhiSNKMke9Oq3JgqHkNjQWuY9Zysa4kN2/o6XhzmI08TBCDyAG9zQ==
X-Received: by 10.223.159.15 with SMTP id l15mr26733300wrf.155.1512662988277; 
	Thu, 07 Dec 2017 08:09:48 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	k135sm6061394wmd.45.2017.12.07.08.09.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 08:09:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Dec 2017 16:09:43 +0000
Message-Id: <20171207160943.20266-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] Revert "eudev: sync rules with systemd"
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
X-List-Received-Date: Thu, 07 Dec 2017 16:09:48 -0000

This is breaking input in qemu (and maybe more).

This reverts commit 915b99bb8faa29ce3d35c0d6a1e96fa9bcc5c6f1.

[ YOCTO #12403 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../eudev/0001-rules-whitelist-hd-devices.patch    |  33 ----
 .../udev/eudev/0002-rules-update.patch             | 196 ---------------------
 ...les-watch-metadata-changes-in-ide-devices.patch |  43 -----
 meta/recipes-core/udev/eudev_3.2.2.bb              |   3 -
 4 files changed, 275 deletions(-)
 delete mode 100644 meta/recipes-core/udev/eudev/0001-rules-whitelist-hd-devices.patch
 delete mode 100644 meta/recipes-core/udev/eudev/0002-rules-update.patch
 delete mode 100644 meta/recipes-core/udev/eudev/0003-rules-watch-metadata-changes-in-ide-devices.patch

diff --git a/meta/recipes-core/udev/eudev/0001-rules-whitelist-hd-devices.patch b/meta/recipes-core/udev/eudev/0001-rules-whitelist-hd-devices.patch
deleted file mode 100644
index 1cc4332e850..00000000000
--- a/meta/recipes-core/udev/eudev/0001-rules-whitelist-hd-devices.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 676864191d1855ce23a31026b74c7f64b15e5062 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Nov 2016 19:41:13 -0800
-Subject: [PATCH 1/3] rules: whitelist hd* devices
-
-qemu by default emulates IDE and the linux-yocto kernel(s) use
-CONFIG_IDE instead of the more modern libsata, so disks appear as
-/dev/hd*. Patch rejected upstream because CONFIG_IDE is deprecated.
-
-Upstream-Status: Denied [https://github.com/systemd/systemd/pull/1276]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- rules/60-persistent-storage.rules | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rules/60-persistent-storage.rules b/rules/60-persistent-storage.rules
-index 6f60ae9..bcd573a 100644
---- a/rules/60-persistent-storage.rules
-+++ b/rules/60-persistent-storage.rules
-@@ -7,7 +7,7 @@ ACTION=="remove", GOTO="persistent_storage_end"
- ENV{UDEV_DISABLE_PERSISTENT_STORAGE_RULES_FLAG}=="1", GOTO="persistent_storage_end"
- 
- SUBSYSTEM!="block", GOTO="persistent_storage_end"
--KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*", GOTO="persistent_storage_end"
-+KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*|hd*", GOTO="persistent_storage_end"
- 
- # ignore partitions that span the entire disk
- TEST=="whole_disk", GOTO="persistent_storage_end"
--- 
-1.8.3.1
-
diff --git a/meta/recipes-core/udev/eudev/0002-rules-update.patch b/meta/recipes-core/udev/eudev/0002-rules-update.patch
deleted file mode 100644
index 7cc4d06d731..00000000000
--- a/meta/recipes-core/udev/eudev/0002-rules-update.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-From d29a20381bc6bd85e86bdc5b2adb48fa12ccd22a Mon Sep 17 00:00:00 2001
-From: "Anthony G. Basile" <blueness@gentoo.org>
-Date: Sun, 3 Sep 2017 13:20:33 -0400
-Subject: [PATCH 2/3] rules: update
-
-Upstream-Status: Backport [https://github.com/gentoo/eudev/commit/47367bc4df6f05a49cf4b5b0209153d77a9ade83]
-
-Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
----
- rules/50-udev-default.rules       |  3 ++-
- rules/60-block.rules              |  5 +----
- rules/60-cdrom_id.rules           |  6 +++++-
- rules/60-drm.rules                |  5 +++++
- rules/60-evdev.rules              |  6 +++++-
- rules/60-persistent-input.rules   |  2 ++
- rules/60-persistent-storage.rules | 11 +++++++----
- rules/60-sensor.rules             |  8 ++++++++
- rules/78-sound-card.rules         |  7 +++++++
- 9 files changed, 42 insertions(+), 11 deletions(-)
-
-diff --git a/rules/50-udev-default.rules b/rules/50-udev-default.rules
-index e9eeb85..87438c0 100644
---- a/rules/50-udev-default.rules
-+++ b/rules/50-udev-default.rules
-@@ -11,7 +11,6 @@ SUBSYSTEM=="rtc", ATTR{hctosys}=="1", SYMLINK+="rtc"
- SUBSYSTEM=="rtc", KERNEL=="rtc0", SYMLINK+="rtc", OPTIONS+="link_priority=-100"
- 
- SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", IMPORT{builtin}="usb_id", IMPORT{builtin}="hwdb --subsystem=usb"
--SUBSYSTEM=="input", ENV{ID_INPUT}=="", IMPORT{builtin}="input_id"
- ENV{MODALIAS}!="", IMPORT{builtin}="hwdb --subsystem=$env{SUBSYSTEM}"
- 
- ACTION!="add", GOTO="default_end"
-@@ -34,6 +33,8 @@ SUBSYSTEM=="video4linux", GROUP="video"
- SUBSYSTEM=="graphics", GROUP="video"
- SUBSYSTEM=="drm", GROUP="video"
- SUBSYSTEM=="dvb", GROUP="video"
-+SUBSYSTEM=="media", GROUP="video"
-+SUBSYSTEM=="cec", GROUP="video"
- 
- SUBSYSTEM=="sound", GROUP="audio", \
-   OPTIONS+="static_node=snd/seq", OPTIONS+="static_node=snd/timer"
-diff --git a/rules/60-block.rules b/rules/60-block.rules
-index 5e38e12..343fc06 100644
---- a/rules/60-block.rules
-+++ b/rules/60-block.rules
-@@ -8,7 +8,4 @@ ACTION=="add", SUBSYSTEM=="module", KERNEL=="block", ATTR{parameters/events_dfl_
- ACTION=="change", SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device", TEST=="block", ATTR{block/*/uevent}="change"
- 
- # watch metadata changes, caused by tools closing the device node which was opened for writing
--ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*", OPTIONS+="watch"
--
--# set noop on solid state drives
--SUBSYSTEM=="block", ACTION=="add", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="noop"
-+ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*", OPTIONS+="watch"
-diff --git a/rules/60-cdrom_id.rules b/rules/60-cdrom_id.rules
-index 5c3b52e..288f8ce 100644
---- a/rules/60-cdrom_id.rules
-+++ b/rules/60-cdrom_id.rules
-@@ -2,12 +2,16 @@
- 
- ACTION=="remove", GOTO="cdrom_end"
- SUBSYSTEM!="block", GOTO="cdrom_end"
--KERNEL!="sr[0-9]*|xvd*", GOTO="cdrom_end"
-+KERNEL!="sr[0-9]*|vdisk*|xvd*", GOTO="cdrom_end"
- ENV{DEVTYPE}!="disk", GOTO="cdrom_end"
- 
- # unconditionally tag device as CDROM
- KERNEL=="sr[0-9]*", ENV{ID_CDROM}="1"
- 
-+# stop automatically any mount units bound to the device if the media eject
-+# button is pressed.
-+ENV{ID_CDROM}=="1", ENV{SYSTEMD_MOUNT_DEVICE_BOUND}="1"
-+
- # media eject button pressed
- ENV{DISK_EJECT_REQUEST}=="?*", RUN+="cdrom_id --eject-media $devnode", GOTO="cdrom_end"
- 
-diff --git a/rules/60-drm.rules b/rules/60-drm.rules
-index 1ed3e44..f7f3435 100644
---- a/rules/60-drm.rules
-+++ b/rules/60-drm.rules
-@@ -1,3 +1,8 @@
- # do not edit this file, it will be overwritten on update
- 
- ACTION!="remove", SUBSYSTEM=="drm", SUBSYSTEMS=="pci|usb|platform", IMPORT{builtin}="path_id"
-+
-+# by-path
-+ENV{ID_PATH}=="?*", KERNEL=="card*", SYMLINK+="dri/by-path/$env{ID_PATH}-card"
-+ENV{ID_PATH}=="?*", KERNEL=="controlD*", SYMLINK+="dri/by-path/$env{ID_PATH}-control"
-+ENV{ID_PATH}=="?*", KERNEL=="renderD*", SYMLINK+="dri/by-path/$env{ID_PATH}-render"
-diff --git a/rules/60-evdev.rules b/rules/60-evdev.rules
-index ade7e7f..e5e608a 100644
---- a/rules/60-evdev.rules
-+++ b/rules/60-evdev.rules
-@@ -8,10 +8,14 @@ IMPORT{builtin}="hwdb --subsystem=input --lookup-prefix=evdev:", \
-   RUN{builtin}+="keyboard", GOTO="evdev_end"
- 
- # AT keyboard matching by the machine's DMI data
--ENV{ID_INPUT_KEY}=="?*", DRIVERS=="atkbd", \
-+DRIVERS=="atkbd", \
-   IMPORT{builtin}="hwdb 'evdev:atkbd:$attr{[dmi/id]modalias}'", \
-   RUN{builtin}+="keyboard", GOTO="evdev_end"
- 
-+# device matching the input device name + properties + the machine's DMI data
-+KERNELS=="input*", IMPORT{builtin}="hwdb 'evdev:name:$attr{name}:phys:$attr{phys}:ev:$attr{capabilities/ev}:$attr{[dmi/id]modalias}'", \
-+  RUN{builtin}+="keyboard", GOTO="evdev_end"
-+
- # device matching the input device name and the machine's DMI data
- KERNELS=="input*", IMPORT{builtin}="hwdb 'evdev:name:$attr{name}:$attr{[dmi/id]modalias}'", \
-   RUN{builtin}+="keyboard", GOTO="evdev_end"
-diff --git a/rules/60-persistent-input.rules b/rules/60-persistent-input.rules
-index 607144b..91efbe7 100644
---- a/rules/60-persistent-input.rules
-+++ b/rules/60-persistent-input.rules
-@@ -3,6 +3,8 @@
- ACTION=="remove", GOTO="persistent_input_end"
- SUBSYSTEM!="input", GOTO="persistent_input_end"
- SUBSYSTEMS=="bluetooth", ENV{ID_BUS}="bluetooth", GOTO="persistent_input_end"
-+# Bluetooth devices don't always have the bluetooth subsystem
-+ATTRS{id/bustype}=="0005", ENV{ID_BUS}="bluetooth", GOTO="persistent_input_end"
- SUBSYSTEMS=="rmi4", ENV{ID_BUS}="rmi", GOTO="persistent_input_end"
- SUBSYSTEMS=="serio", ENV{ID_BUS}="i8042", GOTO="persistent_input_end"
- 
-diff --git a/rules/60-persistent-storage.rules b/rules/60-persistent-storage.rules
-index bcd573a..63f472b 100644
---- a/rules/60-persistent-storage.rules
-+++ b/rules/60-persistent-storage.rules
-@@ -20,6 +20,7 @@ KERNEL=="nvme*[0-9]n*[0-9]", ATTR{wwid}=="?*", SYMLINK+="disk/by-id/nvme-$attr{w
- KERNEL=="nvme*[0-9]n*[0-9]p*[0-9]", ENV{DEVTYPE}=="partition", ATTRS{wwid}=="?*", SYMLINK+="disk/by-id/nvme-$attr{wwid}-part%n"
- 
- KERNEL=="nvme*[0-9]n*[0-9]", ENV{DEVTYPE}=="disk", ATTRS{serial}=="?*", ENV{ID_SERIAL_SHORT}="$attr{serial}"
-+KERNEL=="nvme*[0-9]n*[0-9]", ENV{DEVTYPE}=="disk", ATTRS{wwid}=="?*", ENV{ID_WWN}="$attr{wwid}"
- KERNEL=="nvme*[0-9]n*[0-9]", ENV{DEVTYPE}=="disk", ATTRS{model}=="?*", ENV{ID_SERIAL_SHORT}=="?*", ENV{ID_SERIAL}="$attr{model}_$env{ID_SERIAL_SHORT}", SYMLINK+="disk/by-id/nvme-$env{ID_SERIAL}"
- 
- KERNEL=="nvme*[0-9]n*[0-9]p*[0-9]", ENV{DEVTYPE}=="partition", ATTRS{serial}=="?*", ENV{ID_SERIAL_SHORT}="$attr{serial}"
-@@ -63,9 +64,14 @@ KERNEL=="msblk[0-9]p[0-9]|mspblk[0-9]p[0-9]", ENV{ID_NAME}=="?*", ENV{ID_SERIAL}
- 
- # by-path
- ENV{DEVTYPE}=="disk", DEVPATH!="*/virtual/*", IMPORT{builtin}="path_id"
--ENV{DEVTYPE}=="disk", ENV{ID_PATH}=="?*", SYMLINK+="disk/by-path/$env{ID_PATH}"
-+KERNEL=="mmcblk[0-9]boot[0-9]", ENV{DEVTYPE}=="disk", ENV{ID_PATH}=="?*", SYMLINK+="disk/by-path/$env{ID_PATH}-boot%n"
-+KERNEL!="mmcblk[0-9]boot[0-9]", ENV{DEVTYPE}=="disk", ENV{ID_PATH}=="?*", SYMLINK+="disk/by-path/$env{ID_PATH}"
- ENV{DEVTYPE}=="partition", ENV{ID_PATH}=="?*", SYMLINK+="disk/by-path/$env{ID_PATH}-part%n"
- 
-+# legacy virtio-pci by-path links (deprecated)
-+KERNEL=="vd*[!0-9]", ENV{ID_PATH}=="pci-*", SYMLINK+="disk/by-path/virtio-$env{ID_PATH}"
-+KERNEL=="vd*[0-9]", ENV{ID_PATH}=="pci-*", SYMLINK+="disk/by-path/virtio-$env{ID_PATH}-part%n"
-+
- # probe filesystem metadata of optical drives which have a media inserted
- KERNEL=="sr*", ENV{DISK_EJECT_REQUEST}!="?*", ENV{ID_CDROM_MEDIA_TRACK_COUNT_DATA}=="?*", ENV{ID_CDROM_MEDIA_SESSION_LAST_OFFSET}=="?*", \
-   IMPORT{builtin}="blkid --offset=$env{ID_CDROM_MEDIA_SESSION_LAST_OFFSET}"
-@@ -88,7 +94,4 @@ ENV{DEVTYPE}=="partition", ENV{ID_WWN_WITH_EXTENSION}=="?*", SYMLINK+="disk/by-i
- ENV{ID_PART_ENTRY_UUID}=="?*", SYMLINK+="disk/by-partuuid/$env{ID_PART_ENTRY_UUID}"
- ENV{ID_PART_ENTRY_SCHEME}=="gpt", ENV{ID_PART_ENTRY_NAME}=="?*", SYMLINK+="disk/by-partlabel/$env{ID_PART_ENTRY_NAME}"
- 
--# add symlink to GPT root disk
--ENV{ID_PART_ENTRY_SCHEME}=="gpt", ENV{ID_PART_GPT_AUTO_ROOT}=="1", SYMLINK+="gpt-auto-root"
--
- LABEL="persistent_storage_end"
-diff --git a/rules/60-sensor.rules b/rules/60-sensor.rules
-index 82e44f8..7ad2c36 100644
---- a/rules/60-sensor.rules
-+++ b/rules/60-sensor.rules
-@@ -7,4 +7,12 @@ SUBSYSTEM=="iio", KERNEL=="iio*", SUBSYSTEMS=="usb|i2c", \
-   IMPORT{builtin}="hwdb 'sensor:modalias:$attr{modalias}:$attr{[dmi/id]modalias}'", \
-   GOTO="sensor_end"
- 
-+SUBSYSTEM=="input", ENV{ID_INPUT_ACCELEROMETER}=="1", SUBSYSTEMS=="acpi", \
-+  IMPORT{builtin}="hwdb 'sensor:modalias:acpi:$attr{hid}:$attr{[dmi/id]modalias}'", \
-+  GOTO="sensor_end"
-+
-+SUBSYSTEM=="input", ENV{ID_INPUT_ACCELEROMETER}=="1", SUBSYSTEMS=="platform", \
-+  IMPORT{builtin}="hwdb 'sensor:modalias:platform:$id:$attr{[dmi/id]modalias}'", \
-+  GOTO="sensor_end"
-+
- LABEL="sensor_end"
-diff --git a/rules/78-sound-card.rules b/rules/78-sound-card.rules
-index 04740e8..f2fc277 100644
---- a/rules/78-sound-card.rules
-+++ b/rules/78-sound-card.rules
-@@ -48,6 +48,13 @@ SUBSYSTEMS=="firewire", ATTRS{guid}=="?*", \
- SUBSYSTEMS=="firewire", GOTO="skip_pci"
- 
- SUBSYSTEMS=="pci", ENV{ID_BUS}="pci", ENV{ID_VENDOR_ID}="$attr{vendor}", ENV{ID_MODEL_ID}="$attr{device}"
-+SUBSYSTEMS=="pci", GOTO="skip_pci"
-+
-+# If we reach here, the device nor any of its parents are USB/PCI/firewire bus devices.
-+# If we now find a parent that is a platform device, assume that we're working with
-+# an internal sound card.
-+SUBSYSTEMS=="platform", ENV{SOUND_FORM_FACTOR}="internal", GOTO="sound_end"
-+
- LABEL="skip_pci"
- 
- # Define ID_ID if ID_BUS and ID_SERIAL are set. This will work for both
--- 
-1.8.3.1
-
diff --git a/meta/recipes-core/udev/eudev/0003-rules-watch-metadata-changes-in-ide-devices.patch b/meta/recipes-core/udev/eudev/0003-rules-watch-metadata-changes-in-ide-devices.patch
deleted file mode 100644
index 17d698a06cf..00000000000
--- a/meta/recipes-core/udev/eudev/0003-rules-watch-metadata-changes-in-ide-devices.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 8207d645582e96c56950674e104653d0cd552d60 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 17 Nov 2017 09:46:00 +0800
-Subject: [PATCH] rules: watch metadata changes in ide devices
-
-Formatting IDE storage does not trigger "change" uevents. As a result
-clients using udev API don't get any updates afterwards and get outdated
-information about the device.
-...
-root@qemux86-64:~# mkfs.ext4 -F /dev/hda1
-Creating filesystem with 262144 4k blocks and 65536 inodes
-Filesystem UUID: 98791eb2-2bf3-47ad-b4d8-4cf7e914eee2
-
-root@qemux86-64:~# ls /dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2
-ls: cannot access '/dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2': No such file or directory
-...
-Include hd* in a match for watch option assignment.
-
-Upstream-Status: Denied
-
-qemu by default emulates IDE and the linux-yocto kernel(s) use
-CONFIG_IDE instead of the more modern libsata, so disks appear as
-/dev/hd*. A similar patch rejected by upstream because CONFIG_IDE
-is deprecated.
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- rules/60-block.rules | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rules/60-block.rules b/rules/60-block.rules
-index 343fc06..b5237da 100644
---- a/rules/60-block.rules
-+++ b/rules/60-block.rules
-@@ -8,4 +8,4 @@ ACTION=="add", SUBSYSTEM=="module", KERNEL=="block", ATTR{parameters/events_dfl_
- ACTION=="change", SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device", TEST=="block", ATTR{block/*/uevent}="change"
- 
- # watch metadata changes, caused by tools closing the device node which was opened for writing
--ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*", OPTIONS+="watch"
-+ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|hd*", OPTIONS+="watch"
--- 
-1.8.3.1
-
diff --git a/meta/recipes-core/udev/eudev_3.2.2.bb b/meta/recipes-core/udev/eudev_3.2.2.bb
index 5cee06120c0..70e3568dc26 100644
--- a/meta/recipes-core/udev/eudev_3.2.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.2.bb
@@ -11,9 +11,6 @@ PROVIDES = "udev"
 SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://Revert-udev-remove-userspace-firmware-loading-suppor.patch \
-           file://0001-rules-whitelist-hd-devices.patch \
-           file://0002-rules-update.patch \
-           file://0003-rules-watch-metadata-changes-in-ide-devices.patch \
            file://devfs-udev.rules \
            file://init \
            file://links.conf \
-- 
2.11.0


