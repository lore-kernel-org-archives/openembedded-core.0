Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6BD77F34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 01:26:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBJ1Qso5010322
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Dec 2017 17:26:54 -0800 (PST)
Received: from [128.224.162.151] (128.224.162.151) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 18 Dec 2017 17:26:47 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
	<1510898885-256081-2-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LYbApWRsWnjTXsfJJ4p502FF-FXoVHO1=fu3o-5P2=dWQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <712fa87d-c569-df58-81bf-b449dac0b26e@windriver.com>
Date: Tue, 19 Dec 2017 09:29:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYbApWRsWnjTXsfJJ4p502FF-FXoVHO1=fu3o-5P2=dWQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] eudev: sync rules with systemd
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
X-List-Received-Date: Tue, 19 Dec 2017 01:26:54 -0000
Content-Type: multipart/alternative;
	boundary="------------365012DCFD24AE4F0DBA85B5"
Content-Language: en-US

--------------365012DCFD24AE4F0DBA85B5
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年12月18日 20:01, Burton, Ross wrote:
> We had to revert this because it meant that input devices didn't work 
> in qemu, which is quite a problem!
>

OK, sorry for the inconvenience.

//Hongxu

> Ross
>
> On 17 November 2017 at 06:08, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     - Add whitelist hd* devices
>
>     - Backport latest rules from upstream
>
>     - Fix formatting IDE storage does not trigger "change" uevents
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      .../eudev/0001-rules-whitelist-hd-devices.patch    | 33 ++++
>      .../udev/eudev/0002-rules-update.patch             | 196
>     +++++++++++++++++++++
>      ...les-watch-metadata-changes-in-ide-devices.patch | 43 +++++
>      meta/recipes-core/udev/eudev_3.2.2.bb <http://eudev_3.2.2.bb>    
>             |   3 +
>      4 files changed, 275 insertions(+)
>      create mode 100644
>     meta/recipes-core/udev/eudev/0001-rules-whitelist-hd-devices.patch
>      create mode 100644
>     meta/recipes-core/udev/eudev/0002-rules-update.patch
>      create mode 100644
>     meta/recipes-core/udev/eudev/0003-rules-watch-metadata-changes-in-ide-devices.patch
>
>     diff --git
>     a/meta/recipes-core/udev/eudev/0001-rules-whitelist-hd-devices.patch
>     b/meta/recipes-core/udev/eudev/0001-rules-whitelist-hd-devices.patch
>     new file mode 100644
>     index 0000000..1cc4332
>     --- /dev/null
>     +++
>     b/meta/recipes-core/udev/eudev/0001-rules-whitelist-hd-devices.patch
>     @@ -0,0 +1,33 @@
>     +From 676864191d1855ce23a31026b74c7f64b15e5062 Mon Sep 17 00:00:00
>     2001
>     +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     +Date: Wed, 9 Nov 2016 19:41:13 -0800
>     +Subject: [PATCH 1/3] rules: whitelist hd* devices
>     +
>     +qemu by default emulates IDE and the linux-yocto kernel(s) use
>     +CONFIG_IDE instead of the more modern libsata, so disks appear as
>     +/dev/hd*. Patch rejected upstream because CONFIG_IDE is deprecated.
>     +
>     +Upstream-Status: Denied
>     [https://github.com/systemd/systemd/pull/1276
>     <https://github.com/systemd/systemd/pull/1276>]
>     +
>     +Signed-off-by: Patrick Ohly <patrick.ohly@intel.com
>     <mailto:patrick.ohly@intel.com>>
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +---
>     + rules/60-persistent-storage.rules | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/rules/60-persistent-storage.rules
>     b/rules/60-persistent-storage.rules
>     +index 6f60ae9..bcd573a 100644
>     +--- a/rules/60-persistent-storage.rules
>     ++++ b/rules/60-persistent-storage.rules
>     +@@ -7,7 +7,7 @@ ACTION=="remove", GOTO="persistent_storage_end"
>     + ENV{UDEV_DISABLE_PERSISTENT_STORAGE_RULES_FLAG}=="1",
>     GOTO="persistent_storage_end"
>     +
>     + SUBSYSTEM!="block", GOTO="persistent_storage_end"
>     +-KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*",
>     GOTO="persistent_storage_end"
>     ++KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*|hd*",
>     GOTO="persistent_storage_end"
>     +
>     + # ignore partitions that span the entire disk
>     + TEST=="whole_disk", GOTO="persistent_storage_end"
>     +--
>     +1.8.3.1
>     +
>     diff --git a/meta/recipes-core/udev/eudev/0002-rules-update.patch
>     b/meta/recipes-core/udev/eudev/0002-rules-update.patch
>     new file mode 100644
>     index 0000000..7cc4d06
>     --- /dev/null
>     +++ b/meta/recipes-core/udev/eudev/0002-rules-update.patch
>     @@ -0,0 +1,196 @@
>     +From d29a20381bc6bd85e86bdc5b2adb48fa12ccd22a Mon Sep 17 00:00:00
>     2001
>     +From: "Anthony G. Basile" <blueness@gentoo.org
>     <mailto:blueness@gentoo.org>>
>     +Date: Sun, 3 Sep 2017 13:20:33 -0400
>     +Subject: [PATCH 2/3] rules: update
>     +
>     +Upstream-Status: Backport
>     [https://github.com/gentoo/eudev/commit/47367bc4df6f05a49cf4b5b0209153d77a9ade83
>     <https://github.com/gentoo/eudev/commit/47367bc4df6f05a49cf4b5b0209153d77a9ade83>]
>     +
>     +Signed-off-by: Anthony G. Basile <blueness@gentoo.org
>     <mailto:blueness@gentoo.org>>
>     +---
>     + rules/50-udev-default.rules       |  3 ++-
>     + rules/60-block.rules              |  5 +----
>     + rules/60-cdrom_id.rules           |  6 +++++-
>     + rules/60-drm.rules                |  5 +++++
>     + rules/60-evdev.rules              |  6 +++++-
>     + rules/60-persistent-input.rules   |  2 ++
>     + rules/60-persistent-storage.rules | 11 +++++++----
>     + rules/60-sensor.rules             |  8 ++++++++
>     + rules/78-sound-card.rules         |  7 +++++++
>     + 9 files changed, 42 insertions(+), 11 deletions(-)
>     +
>     +diff --git a/rules/50-udev-default.rules
>     b/rules/50-udev-default.rules
>     +index e9eeb85..87438c0 100644
>     +--- a/rules/50-udev-default.rules
>     ++++ b/rules/50-udev-default.rules
>     +@@ -11,7 +11,6 @@ SUBSYSTEM=="rtc", ATTR{hctosys}=="1",
>     SYMLINK+="rtc"
>     + SUBSYSTEM=="rtc", KERNEL=="rtc0", SYMLINK+="rtc",
>     OPTIONS+="link_priority=-100"
>     +
>     + SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device",
>     IMPORT{builtin}="usb_id", IMPORT{builtin}="hwdb --subsystem=usb"
>     +-SUBSYSTEM=="input", ENV{ID_INPUT}=="", IMPORT{builtin}="input_id"
>     + ENV{MODALIAS}!="", IMPORT{builtin}="hwdb
>     --subsystem=$env{SUBSYSTEM}"
>     +
>     + ACTION!="add", GOTO="default_end"
>     +@@ -34,6 +33,8 @@ SUBSYSTEM=="video4linux", GROUP="video"
>     + SUBSYSTEM=="graphics", GROUP="video"
>     + SUBSYSTEM=="drm", GROUP="video"
>     + SUBSYSTEM=="dvb", GROUP="video"
>     ++SUBSYSTEM=="media", GROUP="video"
>     ++SUBSYSTEM=="cec", GROUP="video"
>     +
>     + SUBSYSTEM=="sound", GROUP="audio", \
>     +   OPTIONS+="static_node=snd/seq", OPTIONS+="static_node=snd/timer"
>     +diff --git a/rules/60-block.rules b/rules/60-block.rules
>     +index 5e38e12..343fc06 100644
>     +--- a/rules/60-block.rules
>     ++++ b/rules/60-block.rules
>     +@@ -8,7 +8,4 @@ ACTION=="add", SUBSYSTEM=="module",
>     KERNEL=="block", ATTR{parameters/events_dfl_
>     + ACTION=="change", SUBSYSTEM=="scsi",
>     ENV{DEVTYPE}=="scsi_device", TEST=="block",
>     ATTR{block/*/uevent}="change"
>     +
>     + # watch metadata changes, caused by tools closing the device
>     node which was opened for writing
>     +-ACTION!="remove", SUBSYSTEM=="block",
>     KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*", OPTIONS+="watch"
>     +-
>     +-# set noop on solid state drives
>     +-SUBSYSTEM=="block", ACTION=="add", ATTR{queue/rotational}=="0",
>     ATTR{queue/scheduler}="noop"
>     ++ACTION!="remove", SUBSYSTEM=="block",
>     KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*", OPTIONS+="watch"
>     +diff --git a/rules/60-cdrom_id.rules b/rules/60-cdrom_id.rules
>     +index 5c3b52e..288f8ce 100644
>     +--- a/rules/60-cdrom_id.rules
>     ++++ b/rules/60-cdrom_id.rules
>     +@@ -2,12 +2,16 @@
>     +
>     + ACTION=="remove", GOTO="cdrom_end"
>     + SUBSYSTEM!="block", GOTO="cdrom_end"
>     +-KERNEL!="sr[0-9]*|xvd*", GOTO="cdrom_end"
>     ++KERNEL!="sr[0-9]*|vdisk*|xvd*", GOTO="cdrom_end"
>     + ENV{DEVTYPE}!="disk", GOTO="cdrom_end"
>     +
>     + # unconditionally tag device as CDROM
>     + KERNEL=="sr[0-9]*", ENV{ID_CDROM}="1"
>     +
>     ++# stop automatically any mount units bound to the device if the
>     media eject
>     ++# button is pressed.
>     ++ENV{ID_CDROM}=="1", ENV{SYSTEMD_MOUNT_DEVICE_BOUND}="1"
>     ++
>     + # media eject button pressed
>     + ENV{DISK_EJECT_REQUEST}=="?*", RUN+="cdrom_id --eject-media
>     $devnode", GOTO="cdrom_end"
>     +
>     +diff --git a/rules/60-drm.rules b/rules/60-drm.rules
>     +index 1ed3e44..f7f3435 100644
>     +--- a/rules/60-drm.rules
>     ++++ b/rules/60-drm.rules
>     +@@ -1,3 +1,8 @@
>     + # do not edit this file, it will be overwritten on update
>     +
>     + ACTION!="remove", SUBSYSTEM=="drm",
>     SUBSYSTEMS=="pci|usb|platform", IMPORT{builtin}="path_id"
>     ++
>     ++# by-path
>     ++ENV{ID_PATH}=="?*", KERNEL=="card*",
>     SYMLINK+="dri/by-path/$env{ID_PATH}-card"
>     ++ENV{ID_PATH}=="?*", KERNEL=="controlD*",
>     SYMLINK+="dri/by-path/$env{ID_PATH}-control"
>     ++ENV{ID_PATH}=="?*", KERNEL=="renderD*",
>     SYMLINK+="dri/by-path/$env{ID_PATH}-render"
>     +diff --git a/rules/60-evdev.rules b/rules/60-evdev.rules
>     +index ade7e7f..e5e608a 100644
>     +--- a/rules/60-evdev.rules
>     ++++ b/rules/60-evdev.rules
>     +@@ -8,10 +8,14 @@ IMPORT{builtin}="hwdb --subsystem=input
>     --lookup-prefix=evdev:", \
>     +   RUN{builtin}+="keyboard", GOTO="evdev_end"
>     +
>     + # AT keyboard matching by the machine's DMI data
>     +-ENV{ID_INPUT_KEY}=="?*", DRIVERS=="atkbd", \
>     ++DRIVERS=="atkbd", \
>     +   IMPORT{builtin}="hwdb 'evdev:atkbd:$attr{[dmi/id]modalias}'", \
>     +   RUN{builtin}+="keyboard", GOTO="evdev_end"
>     +
>     ++# device matching the input device name + properties + the
>     machine's DMI data
>     ++KERNELS=="input*", IMPORT{builtin}="hwdb
>     'evdev:name:$attr{name}:phys:$attr{phys}:ev:$attr{capabilities/ev}:$attr{[dmi/id]modalias}'",
>     \
>     ++  RUN{builtin}+="keyboard", GOTO="evdev_end"
>     ++
>     + # device matching the input device name and the machine's DMI data
>     + KERNELS=="input*", IMPORT{builtin}="hwdb
>     'evdev:name:$attr{name}:$attr{[dmi/id]modalias}'", \
>     +   RUN{builtin}+="keyboard", GOTO="evdev_end"
>     +diff --git a/rules/60-persistent-input.rules
>     b/rules/60-persistent-input.rules
>     +index 607144b..91efbe7 100644
>     +--- a/rules/60-persistent-input.rules
>     ++++ b/rules/60-persistent-input.rules
>     +@@ -3,6 +3,8 @@
>     + ACTION=="remove", GOTO="persistent_input_end"
>     + SUBSYSTEM!="input", GOTO="persistent_input_end"
>     + SUBSYSTEMS=="bluetooth", ENV{ID_BUS}="bluetooth",
>     GOTO="persistent_input_end"
>     ++# Bluetooth devices don't always have the bluetooth subsystem
>     ++ATTRS{id/bustype}=="0005", ENV{ID_BUS}="bluetooth",
>     GOTO="persistent_input_end"
>     + SUBSYSTEMS=="rmi4", ENV{ID_BUS}="rmi", GOTO="persistent_input_end"
>     + SUBSYSTEMS=="serio", ENV{ID_BUS}="i8042",
>     GOTO="persistent_input_end"
>     +
>     +diff --git a/rules/60-persistent-storage.rules
>     b/rules/60-persistent-storage.rules
>     +index bcd573a..63f472b 100644
>     +--- a/rules/60-persistent-storage.rules
>     ++++ b/rules/60-persistent-storage.rules
>     +@@ -20,6 +20,7 @@ KERNEL=="nvme*[0-9]n*[0-9]", ATTR{wwid}=="?*",
>     SYMLINK+="disk/by-id/nvme-$attr{w
>     + KERNEL=="nvme*[0-9]n*[0-9]p*[0-9]", ENV{DEVTYPE}=="partition",
>     ATTRS{wwid}=="?*", SYMLINK+="disk/by-id/nvme-$attr{wwid}-part%n"
>     +
>     + KERNEL=="nvme*[0-9]n*[0-9]", ENV{DEVTYPE}=="disk",
>     ATTRS{serial}=="?*", ENV{ID_SERIAL_SHORT}="$attr{serial}"
>     ++KERNEL=="nvme*[0-9]n*[0-9]", ENV{DEVTYPE}=="disk",
>     ATTRS{wwid}=="?*", ENV{ID_WWN}="$attr{wwid}"
>     + KERNEL=="nvme*[0-9]n*[0-9]", ENV{DEVTYPE}=="disk",
>     ATTRS{model}=="?*", ENV{ID_SERIAL_SHORT}=="?*",
>     ENV{ID_SERIAL}="$attr{model}_$env{ID_SERIAL_SHORT}",
>     SYMLINK+="disk/by-id/nvme-$env{ID_SERIAL}"
>     +
>     + KERNEL=="nvme*[0-9]n*[0-9]p*[0-9]", ENV{DEVTYPE}=="partition",
>     ATTRS{serial}=="?*", ENV{ID_SERIAL_SHORT}="$attr{serial}"
>     +@@ -63,9 +64,14 @@ KERNEL=="msblk[0-9]p[0-9]|mspblk[0-9]p[0-9]",
>     ENV{ID_NAME}=="?*", ENV{ID_SERIAL}
>     +
>     + # by-path
>     + ENV{DEVTYPE}=="disk", DEVPATH!="*/virtual/*",
>     IMPORT{builtin}="path_id"
>     +-ENV{DEVTYPE}=="disk", ENV{ID_PATH}=="?*",
>     SYMLINK+="disk/by-path/$env{ID_PATH}"
>     ++KERNEL=="mmcblk[0-9]boot[0-9]", ENV{DEVTYPE}=="disk",
>     ENV{ID_PATH}=="?*", SYMLINK+="disk/by-path/$env{ID_PATH}-boot%n"
>     ++KERNEL!="mmcblk[0-9]boot[0-9]", ENV{DEVTYPE}=="disk",
>     ENV{ID_PATH}=="?*", SYMLINK+="disk/by-path/$env{ID_PATH}"
>     + ENV{DEVTYPE}=="partition", ENV{ID_PATH}=="?*",
>     SYMLINK+="disk/by-path/$env{ID_PATH}-part%n"
>     +
>     ++# legacy virtio-pci by-path links (deprecated)
>     ++KERNEL=="vd*[!0-9]", ENV{ID_PATH}=="pci-*",
>     SYMLINK+="disk/by-path/virtio-$env{ID_PATH}"
>     ++KERNEL=="vd*[0-9]", ENV{ID_PATH}=="pci-*",
>     SYMLINK+="disk/by-path/virtio-$env{ID_PATH}-part%n"
>     ++
>     + # probe filesystem metadata of optical drives which have a media
>     inserted
>     + KERNEL=="sr*", ENV{DISK_EJECT_REQUEST}!="?*",
>     ENV{ID_CDROM_MEDIA_TRACK_COUNT_DATA}=="?*",
>     ENV{ID_CDROM_MEDIA_SESSION_LAST_OFFSET}=="?*", \
>     +   IMPORT{builtin}="blkid
>     --offset=$env{ID_CDROM_MEDIA_SESSION_LAST_OFFSET}"
>     +@@ -88,7 +94,4 @@ ENV{DEVTYPE}=="partition",
>     ENV{ID_WWN_WITH_EXTENSION}=="?*", SYMLINK+="disk/by-i
>     + ENV{ID_PART_ENTRY_UUID}=="?*",
>     SYMLINK+="disk/by-partuuid/$env{ID_PART_ENTRY_UUID}"
>     + ENV{ID_PART_ENTRY_SCHEME}=="gpt", ENV{ID_PART_ENTRY_NAME}=="?*",
>     SYMLINK+="disk/by-partlabel/$env{ID_PART_ENTRY_NAME}"
>     +
>     +-# add symlink to GPT root disk
>     +-ENV{ID_PART_ENTRY_SCHEME}=="gpt",
>     ENV{ID_PART_GPT_AUTO_ROOT}=="1", SYMLINK+="gpt-auto-root"
>     +-
>     + LABEL="persistent_storage_end"
>     +diff --git a/rules/60-sensor.rules b/rules/60-sensor.rules
>     +index 82e44f8..7ad2c36 100644
>     +--- a/rules/60-sensor.rules
>     ++++ b/rules/60-sensor.rules
>     +@@ -7,4 +7,12 @@ SUBSYSTEM=="iio", KERNEL=="iio*",
>     SUBSYSTEMS=="usb|i2c", \
>     +   IMPORT{builtin}="hwdb
>     'sensor:modalias:$attr{modalias}:$attr{[dmi/id]modalias}'", \
>     +   GOTO="sensor_end"
>     +
>     ++SUBSYSTEM=="input", ENV{ID_INPUT_ACCELEROMETER}=="1",
>     SUBSYSTEMS=="acpi", \
>     ++  IMPORT{builtin}="hwdb
>     'sensor:modalias:acpi:$attr{hid}:$attr{[dmi/id]modalias}'", \
>     ++  GOTO="sensor_end"
>     ++
>     ++SUBSYSTEM=="input", ENV{ID_INPUT_ACCELEROMETER}=="1",
>     SUBSYSTEMS=="platform", \
>     ++  IMPORT{builtin}="hwdb
>     'sensor:modalias:platform:$id:$attr{[dmi/id]modalias}'", \
>     ++  GOTO="sensor_end"
>     ++
>     + LABEL="sensor_end"
>     +diff --git a/rules/78-sound-card.rules b/rules/78-sound-card.rules
>     +index 04740e8..f2fc277 100644
>     +--- a/rules/78-sound-card.rules
>     ++++ b/rules/78-sound-card.rules
>     +@@ -48,6 +48,13 @@ SUBSYSTEMS=="firewire", ATTRS{guid}=="?*", \
>     + SUBSYSTEMS=="firewire", GOTO="skip_pci"
>     +
>     + SUBSYSTEMS=="pci", ENV{ID_BUS}="pci",
>     ENV{ID_VENDOR_ID}="$attr{vendor}", ENV{ID_MODEL_ID}="$attr{device}"
>     ++SUBSYSTEMS=="pci", GOTO="skip_pci"
>     ++
>     ++# If we reach here, the device nor any of its parents are
>     USB/PCI/firewire bus devices.
>     ++# If we now find a parent that is a platform device, assume that
>     we're working with
>     ++# an internal sound card.
>     ++SUBSYSTEMS=="platform", ENV{SOUND_FORM_FACTOR}="internal",
>     GOTO="sound_end"
>     ++
>     + LABEL="skip_pci"
>     +
>     + # Define ID_ID if ID_BUS and ID_SERIAL are set. This will work
>     for both
>     +--
>     +1.8.3.1
>     +
>     diff --git
>     a/meta/recipes-core/udev/eudev/0003-rules-watch-metadata-changes-in-ide-devices.patch
>     b/meta/recipes-core/udev/eudev/0003-rules-watch-metadata-changes-in-ide-devices.patch
>     new file mode 100644
>     index 0000000..17d698a
>     --- /dev/null
>     +++
>     b/meta/recipes-core/udev/eudev/0003-rules-watch-metadata-changes-in-ide-devices.patch
>     @@ -0,0 +1,43 @@
>     +From 8207d645582e96c56950674e104653d0cd552d60 Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Date: Fri, 17 Nov 2017 09:46:00 +0800
>     +Subject: [PATCH] rules: watch metadata changes in ide devices
>     +
>     +Formatting IDE storage does not trigger "change" uevents. As a result
>     +clients using udev API don't get any updates afterwards and get
>     outdated
>     +information about the device.
>     +...
>     +root@qemux86-64:~# mkfs.ext4 -F /dev/hda1
>     +Creating filesystem with 262144 4k blocks and 65536 inodes
>     +Filesystem UUID: 98791eb2-2bf3-47ad-b4d8-4cf7e914eee2
>     +
>     +root@qemux86-64:~# ls
>     /dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2
>     +ls: cannot access
>     '/dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2': No such
>     file or directory
>     +...
>     +Include hd* in a match for watch option assignment.
>     +
>     +Upstream-Status: Denied
>     +
>     +qemu by default emulates IDE and the linux-yocto kernel(s) use
>     +CONFIG_IDE instead of the more modern libsata, so disks appear as
>     +/dev/hd*. A similar patch rejected by upstream because CONFIG_IDE
>     +is deprecated.
>     +
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + rules/60-block.rules | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/rules/60-block.rules b/rules/60-block.rules
>     +index 343fc06..b5237da 100644
>     +--- a/rules/60-block.rules
>     ++++ b/rules/60-block.rules
>     +@@ -8,4 +8,4 @@ ACTION=="add", SUBSYSTEM=="module",
>     KERNEL=="block", ATTR{parameters/events_dfl_
>     + ACTION=="change", SUBSYSTEM=="scsi",
>     ENV{DEVTYPE}=="scsi_device", TEST=="block",
>     ATTR{block/*/uevent}="change"
>     +
>     + # watch metadata changes, caused by tools closing the device
>     node which was opened for writing
>     +-ACTION!="remove", SUBSYSTEM=="block",
>     KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*", OPTIONS+="watch"
>     ++ACTION!="remove", SUBSYSTEM=="block",
>     KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|hd*", OPTIONS+="watch"
>     +--
>     +1.8.3.1
>     +
>     diff --git a/meta/recipes-core/udev/eudev_3.2.2.bb
>     <http://eudev_3.2.2.bb> b/meta/recipes-core/udev/eudev_3.2.2.bb
>     <http://eudev_3.2.2.bb>
>     index 70e3568..5cee061 100644
>     --- a/meta/recipes-core/udev/eudev_3.2.2.bb <http://eudev_3.2.2.bb>
>     +++ b/meta/recipes-core/udev/eudev_3.2.2.bb <http://eudev_3.2.2.bb>
>     @@ -11,6 +11,9 @@ PROVIDES = "udev"
>      SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz
>     <http://dev.gentoo.org/%7Eblueness/$%7BBPN%7D/$%7BBP%7D.tar.gz> \
>                
>     file://0014-Revert-rules-remove-firmware-loading-rules.patch \
>                
>     file://Revert-udev-remove-userspace-firmware-loading-suppor.patch \
>     +           file://0001-rules-whitelist-hd-devices.patch \
>     +           file://0002-rules-update.patch \
>     +         
>      file://0003-rules-watch-metadata-changes-in-ide-devices.patch \
>                 file://devfs-udev.rules \
>                 file://init \
>                 file://links.conf \
>     --
>     2.8.1
>
>


--------------365012DCFD24AE4F0DBA85B5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2017年12月18日 20:01, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LYbApWRsWnjTXsfJJ4p502FF-FXoVHO1=fu3o-5P2=dWQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">We had to revert this because it meant that input
        devices didn't work in qemu, which is quite a problem!
        <div><br>
        </div>
      </div>
    </blockquote>
    <br>
    OK, sorry for the inconvenience.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LYbApWRsWnjTXsfJJ4p502FF-FXoVHO1=fu3o-5P2=dWQ@mail.gmail.com">
      <div dir="ltr">
        <div>
          <div>Ross</div>
        </div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 17 November 2017 at 06:08, Hongxu
          Jia <span dir="ltr">&lt;<a
              href="mailto:hongxu.jia@windriver.com" target="_blank"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">- Add
            whitelist hd* devices<br>
            <br>
            - Backport latest rules from upstream<br>
            <br>
            - Fix formatting IDE storage does not trigger "change"
            uevents<br>
            <br>
            Signed-off-by: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            ---<br>
             .../eudev/0001-rules-<wbr>whitelist-hd-devices.patch    | 
            33 ++++<br>
             .../udev/eudev/0002-rules-<wbr>update.patch             |
            196 +++++++++++++++++++++<br>
             ...les-watch-metadata-changes-<wbr>in-ide-devices.patch | 
            43 +++++<br>
             meta/recipes-core/udev/<a href="http://eudev_3.2.2.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">eudev_<wbr>3.2.2.bb</a> 
                        |   3 +<br>
             4 files changed, 275 insertions(+)<br>
             create mode 100644 meta/recipes-core/udev/eudev/<wbr>0001-rules-whitelist-hd-<wbr>devices.patch<br>
             create mode 100644 meta/recipes-core/udev/eudev/<wbr>0002-rules-update.patch<br>
             create mode 100644 meta/recipes-core/udev/eudev/<wbr>0003-rules-watch-metadata-<wbr>changes-in-ide-devices.patch<br>
            <br>
            diff --git a/meta/recipes-core/udev/<wbr>eudev/0001-rules-whitelist-hd-<wbr>devices.patch
            b/meta/recipes-core/udev/<wbr>eudev/0001-rules-whitelist-hd-<wbr>devices.patch<br>
            new file mode 100644<br>
            index 0000000..1cc4332<br>
            --- /dev/null<br>
            +++ b/meta/recipes-core/udev/<wbr>eudev/0001-rules-whitelist-hd-<wbr>devices.patch<br>
            @@ -0,0 +1,33 @@<br>
            +From 676864191d1855ce23a31026b74c7f<wbr>64b15e5062 Mon Sep
            17 00:00:00 2001<br>
            +From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com"
              moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
            +Date: Wed, 9 Nov 2016 19:41:13 -0800<br>
            +Subject: [PATCH 1/3] rules: whitelist hd* devices<br>
            +<br>
            +qemu by default emulates IDE and the linux-yocto kernel(s)
            use<br>
            +CONFIG_IDE instead of the more modern libsata, so disks
            appear as<br>
            +/dev/hd*. Patch rejected upstream because CONFIG_IDE is
            deprecated.<br>
            +<br>
            +Upstream-Status: Denied [<a
              href="https://github.com/systemd/systemd/pull/1276"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/systemd/<wbr>systemd/pull/1276</a>]<br>
            +<br>
            +Signed-off-by: Patrick Ohly &lt;<a
              href="mailto:patrick.ohly@intel.com"
              moz-do-not-send="true">patrick.ohly@intel.com</a>&gt;<br>
            +Signed-off-by: Khem Raj &lt;<a
              href="mailto:raj.khem@gmail.com" moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
            +---<br>
            + rules/60-persistent-storage.<wbr>rules | 2 +-<br>
            + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
            +<br>
            +diff --git a/rules/60-persistent-storage.<wbr>rules
            b/rules/60-persistent-storage.<wbr>rules<br>
            +index 6f60ae9..bcd573a 100644<br>
            +--- a/rules/60-persistent-storage.<wbr>rules<br>
            ++++ b/rules/60-persistent-storage.<wbr>rules<br>
            +@@ -7,7 +7,7 @@ ACTION=="remove",
            GOTO="persistent_storage_end"<br>
            + ENV{UDEV_DISABLE_PERSISTENT_<wbr>STORAGE_RULES_FLAG}=="1",
            GOTO="persistent_storage_end"<br>
            +<br>
            + SUBSYSTEM!="block", GOTO="persistent_storage_end"<br>
            +-KERNEL!="loop*|mmcblk*[0-9]|<wbr>msblk*[0-9]|mspblk*[0-9]|nvme*<wbr>|sd*|sr*|vd*|xvd*|bcache*|<wbr>cciss*|dasd*|ubd*|scm*|pmem*|<wbr>nbd*",
            GOTO="persistent_storage_end"<br>
            ++KERNEL!="loop*|mmcblk*[0-9]|<wbr>msblk*[0-9]|mspblk*[0-9]|nvme*<wbr>|sd*|sr*|vd*|xvd*|bcache*|<wbr>cciss*|dasd*|ubd*|scm*|pmem*|<wbr>nbd*|hd*",
            GOTO="persistent_storage_end"<br>
            +<br>
            + # ignore partitions that span the entire disk<br>
            + TEST=="whole_disk", GOTO="persistent_storage_end"<br>
            +--<br>
            +1.8.3.1<br>
            +<br>
            diff --git a/meta/recipes-core/udev/<wbr>eudev/0002-rules-update.patch
            b/meta/recipes-core/udev/<wbr>eudev/0002-rules-update.patch<br>
            new file mode 100644<br>
            index 0000000..7cc4d06<br>
            --- /dev/null<br>
            +++ b/meta/recipes-core/udev/<wbr>eudev/0002-rules-update.patch<br>
            @@ -0,0 +1,196 @@<br>
            +From d29a20381bc6bd85e86bdc5b2adb48<wbr>fa12ccd22a Mon Sep
            17 00:00:00 2001<br>
            +From: "Anthony G. Basile" &lt;<a
              href="mailto:blueness@gentoo.org" moz-do-not-send="true">blueness@gentoo.org</a>&gt;<br>
            +Date: Sun, 3 Sep 2017 13:20:33 -0400<br>
            +Subject: [PATCH 2/3] rules: update<br>
            +<br>
            +Upstream-Status: Backport [<a
href="https://github.com/gentoo/eudev/commit/47367bc4df6f05a49cf4b5b0209153d77a9ade83"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/gentoo/<wbr>eudev/commit/<wbr>47367bc4df6f05a49cf4b5b0209153<wbr>d77a9ade83</a>]<br>
            +<br>
            +Signed-off-by: Anthony G. Basile &lt;<a
              href="mailto:blueness@gentoo.org" moz-do-not-send="true">blueness@gentoo.org</a>&gt;<br>
            +---<br>
            + rules/50-udev-default.rules       |  3 ++-<br>
            + rules/60-block.rules              |  5 +----<br>
            + rules/60-cdrom_id.rules           |  6 +++++-<br>
            + rules/60-drm.rules                |  5 +++++<br>
            + rules/60-evdev.rules              |  6 +++++-<br>
            + rules/60-persistent-input.<wbr>rules   |  2 ++<br>
            + rules/60-persistent-storage.<wbr>rules | 11 +++++++----<br>
            + rules/60-sensor.rules             |  8 ++++++++<br>
            + rules/78-sound-card.rules         |  7 +++++++<br>
            + 9 files changed, 42 insertions(+), 11 deletions(-)<br>
            +<br>
            +diff --git a/rules/50-udev-default.rules
            b/rules/50-udev-default.rules<br>
            +index e9eeb85..87438c0 100644<br>
            +--- a/rules/50-udev-default.rules<br>
            ++++ b/rules/50-udev-default.rules<br>
            +@@ -11,7 +11,6 @@ SUBSYSTEM=="rtc", ATTR{hctosys}=="1",
            SYMLINK+="rtc"<br>
            + SUBSYSTEM=="rtc", KERNEL=="rtc0", SYMLINK+="rtc",
            OPTIONS+="link_priority=-100"<br>
            +<br>
            + SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device",
            IMPORT{builtin}="usb_id", IMPORT{builtin}="hwdb
            --subsystem=usb"<br>
            +-SUBSYSTEM=="input", ENV{ID_INPUT}=="",
            IMPORT{builtin}="input_id"<br>
            + ENV{MODALIAS}!="", IMPORT{builtin}="hwdb
            --subsystem=$env{SUBSYSTEM}"<br>
            +<br>
            + ACTION!="add", GOTO="default_end"<br>
            +@@ -34,6 +33,8 @@ SUBSYSTEM=="video4linux", GROUP="video"<br>
            + SUBSYSTEM=="graphics", GROUP="video"<br>
            + SUBSYSTEM=="drm", GROUP="video"<br>
            + SUBSYSTEM=="dvb", GROUP="video"<br>
            ++SUBSYSTEM=="media", GROUP="video"<br>
            ++SUBSYSTEM=="cec", GROUP="video"<br>
            +<br>
            + SUBSYSTEM=="sound", GROUP="audio", \<br>
            +   OPTIONS+="static_node=snd/seq"<wbr>,
            OPTIONS+="static_node=snd/<wbr>timer"<br>
            +diff --git a/rules/60-block.rules b/rules/60-block.rules<br>
            +index 5e38e12..343fc06 100644<br>
            +--- a/rules/60-block.rules<br>
            ++++ b/rules/60-block.rules<br>
            +@@ -8,7 +8,4 @@ ACTION=="add", SUBSYSTEM=="module",
            KERNEL=="block", ATTR{parameters/events_dfl_<br>
            + ACTION=="change", SUBSYSTEM=="scsi",
            ENV{DEVTYPE}=="scsi_device", TEST=="block",
            ATTR{block/*/uevent}="change"<br>
            +<br>
            + # watch metadata changes, caused by tools closing the
            device node which was opened for writing<br>
            +-ACTION!="remove", SUBSYSTEM=="block",
            KERNEL=="loop*|nvme*|sd*|vd*|<wbr>xvd*|pmem*",
            OPTIONS+="watch"<br>
            +-<br>
            +-# set noop on solid state drives<br>
            +-SUBSYSTEM=="block", ACTION=="add",
            ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="noop"<br>
            ++ACTION!="remove", SUBSYSTEM=="block",
            KERNEL=="loop*|nvme*|sd*|vd*|<wbr>xvd*|pmem*|mmcblk*",
            OPTIONS+="watch"<br>
            +diff --git a/rules/60-cdrom_id.rules
            b/rules/60-cdrom_id.rules<br>
            +index 5c3b52e..288f8ce 100644<br>
            +--- a/rules/60-cdrom_id.rules<br>
            ++++ b/rules/60-cdrom_id.rules<br>
            +@@ -2,12 +2,16 @@<br>
            +<br>
            + ACTION=="remove", GOTO="cdrom_end"<br>
            + SUBSYSTEM!="block", GOTO="cdrom_end"<br>
            +-KERNEL!="sr[0-9]*|xvd*", GOTO="cdrom_end"<br>
            ++KERNEL!="sr[0-9]*|vdisk*|<wbr>xvd*", GOTO="cdrom_end"<br>
            + ENV{DEVTYPE}!="disk", GOTO="cdrom_end"<br>
            +<br>
            + # unconditionally tag device as CDROM<br>
            + KERNEL=="sr[0-9]*", ENV{ID_CDROM}="1"<br>
            +<br>
            ++# stop automatically any mount units bound to the device
            if the media eject<br>
            ++# button is pressed.<br>
            ++ENV{ID_CDROM}=="1", ENV{SYSTEMD_MOUNT_DEVICE_<wbr>BOUND}="1"<br>
            ++<br>
            + # media eject button pressed<br>
            + ENV{DISK_EJECT_REQUEST}=="?*", RUN+="cdrom_id
            --eject-media $devnode", GOTO="cdrom_end"<br>
            +<br>
            +diff --git a/rules/60-drm.rules b/rules/60-drm.rules<br>
            +index 1ed3e44..f7f3435 100644<br>
            +--- a/rules/60-drm.rules<br>
            ++++ b/rules/60-drm.rules<br>
            +@@ -1,3 +1,8 @@<br>
            + # do not edit this file, it will be overwritten on update<br>
            +<br>
            + ACTION!="remove", SUBSYSTEM=="drm",
            SUBSYSTEMS=="pci|usb|platform"<wbr>,
            IMPORT{builtin}="path_id"<br>
            ++<br>
            ++# by-path<br>
            ++ENV{ID_PATH}=="?*", KERNEL=="card*",
            SYMLINK+="dri/by-path/$env{ID_<wbr>PATH}-card"<br>
            ++ENV{ID_PATH}=="?*", KERNEL=="controlD*",
            SYMLINK+="dri/by-path/$env{ID_<wbr>PATH}-control"<br>
            ++ENV{ID_PATH}=="?*", KERNEL=="renderD*",
            SYMLINK+="dri/by-path/$env{ID_<wbr>PATH}-render"<br>
            +diff --git a/rules/60-evdev.rules b/rules/60-evdev.rules<br>
            +index ade7e7f..e5e608a 100644<br>
            +--- a/rules/60-evdev.rules<br>
            ++++ b/rules/60-evdev.rules<br>
            +@@ -8,10 +8,14 @@ IMPORT{builtin}="hwdb --subsystem=input
            --lookup-prefix=evdev:", \<br>
            +   RUN{builtin}+="keyboard", GOTO="evdev_end"<br>
            +<br>
            + # AT keyboard matching by the machine's DMI data<br>
            +-ENV{ID_INPUT_KEY}=="?*", DRIVERS=="atkbd", \<br>
            ++DRIVERS=="atkbd", \<br>
            +   IMPORT{builtin}="hwdb 'evdev:atkbd:$attr{[dmi/id]<wbr>modalias}'",
            \<br>
            +   RUN{builtin}+="keyboard", GOTO="evdev_end"<br>
            +<br>
            ++# device matching the input device name + properties + the
            machine's DMI data<br>
            ++KERNELS=="input*", IMPORT{builtin}="hwdb
            'evdev:name:$attr{name}:phys:$<wbr>attr{phys}:ev:$attr{<wbr>capabilities/ev}:$attr{[dmi/<wbr>id]modalias}'",
            \<br>
            ++  RUN{builtin}+="keyboard", GOTO="evdev_end"<br>
            ++<br>
            + # device matching the input device name and the machine's
            DMI data<br>
            + KERNELS=="input*", IMPORT{builtin}="hwdb
            'evdev:name:$attr{name}:$attr{<wbr>[dmi/id]modalias}'", \<br>
            +   RUN{builtin}+="keyboard", GOTO="evdev_end"<br>
            +diff --git a/rules/60-persistent-input.<wbr>rules
            b/rules/60-persistent-input.<wbr>rules<br>
            +index 607144b..91efbe7 100644<br>
            +--- a/rules/60-persistent-input.<wbr>rules<br>
            ++++ b/rules/60-persistent-input.<wbr>rules<br>
            +@@ -3,6 +3,8 @@<br>
            + ACTION=="remove", GOTO="persistent_input_end"<br>
            + SUBSYSTEM!="input", GOTO="persistent_input_end"<br>
            + SUBSYSTEMS=="bluetooth", ENV{ID_BUS}="bluetooth",
            GOTO="persistent_input_end"<br>
            ++# Bluetooth devices don't always have the bluetooth
            subsystem<br>
            ++ATTRS{id/bustype}=="0005", ENV{ID_BUS}="bluetooth",
            GOTO="persistent_input_end"<br>
            + SUBSYSTEMS=="rmi4", ENV{ID_BUS}="rmi",
            GOTO="persistent_input_end"<br>
            + SUBSYSTEMS=="serio", ENV{ID_BUS}="i8042",
            GOTO="persistent_input_end"<br>
            +<br>
            +diff --git a/rules/60-persistent-storage.<wbr>rules
            b/rules/60-persistent-storage.<wbr>rules<br>
            +index bcd573a..63f472b 100644<br>
            +--- a/rules/60-persistent-storage.<wbr>rules<br>
            ++++ b/rules/60-persistent-storage.<wbr>rules<br>
            +@@ -20,6 +20,7 @@ KERNEL=="nvme*[0-9]n*[0-9]",
            ATTR{wwid}=="?*", SYMLINK+="disk/by-id/nvme-$<wbr>attr{w<br>
            + KERNEL=="nvme*[0-9]n*[0-9]p*[<wbr>0-9]",
            ENV{DEVTYPE}=="partition", ATTRS{wwid}=="?*",
            SYMLINK+="disk/by-id/nvme-$<wbr>attr{wwid}-part%n"<br>
            +<br>
            + KERNEL=="nvme*[0-9]n*[0-9]", ENV{DEVTYPE}=="disk",
            ATTRS{serial}=="?*", ENV{ID_SERIAL_SHORT}="$attr{<wbr>serial}"<br>
            ++KERNEL=="nvme*[0-9]n*[0-9]", ENV{DEVTYPE}=="disk",
            ATTRS{wwid}=="?*", ENV{ID_WWN}="$attr{wwid}"<br>
            + KERNEL=="nvme*[0-9]n*[0-9]", ENV{DEVTYPE}=="disk",
            ATTRS{model}=="?*", ENV{ID_SERIAL_SHORT}=="?*",
            ENV{ID_SERIAL}="$attr{model}_$<wbr>env{ID_SERIAL_SHORT}",
            SYMLINK+="disk/by-id/nvme-$<wbr>env{ID_SERIAL}"<br>
            +<br>
            + KERNEL=="nvme*[0-9]n*[0-9]p*[<wbr>0-9]",
            ENV{DEVTYPE}=="partition", ATTRS{serial}=="?*",
            ENV{ID_SERIAL_SHORT}="$attr{<wbr>serial}"<br>
            +@@ -63,9 +64,14 @@ KERNEL=="msblk[0-9]p[0-9]|<wbr>mspblk[0-9]p[0-9]",
            ENV{ID_NAME}=="?*", ENV{ID_SERIAL}<br>
            +<br>
            + # by-path<br>
            + ENV{DEVTYPE}=="disk", DEVPATH!="*/virtual/*",
            IMPORT{builtin}="path_id"<br>
            +-ENV{DEVTYPE}=="disk", ENV{ID_PATH}=="?*",
            SYMLINK+="disk/by-path/$env{<wbr>ID_PATH}"<br>
            ++KERNEL=="mmcblk[0-9]boot[0-<wbr>9]", ENV{DEVTYPE}=="disk",
            ENV{ID_PATH}=="?*", SYMLINK+="disk/by-path/$env{<wbr>ID_PATH}-boot%n"<br>
            ++KERNEL!="mmcblk[0-9]boot[0-<wbr>9]", ENV{DEVTYPE}=="disk",
            ENV{ID_PATH}=="?*", SYMLINK+="disk/by-path/$env{<wbr>ID_PATH}"<br>
            + ENV{DEVTYPE}=="partition", ENV{ID_PATH}=="?*",
            SYMLINK+="disk/by-path/$env{<wbr>ID_PATH}-part%n"<br>
            +<br>
            ++# legacy virtio-pci by-path links (deprecated)<br>
            ++KERNEL=="vd*[!0-9]", ENV{ID_PATH}=="pci-*",
            SYMLINK+="disk/by-path/virtio-<wbr>$env{ID_PATH}"<br>
            ++KERNEL=="vd*[0-9]", ENV{ID_PATH}=="pci-*",
            SYMLINK+="disk/by-path/virtio-<wbr>$env{ID_PATH}-part%n"<br>
            ++<br>
            + # probe filesystem metadata of optical drives which have a
            media inserted<br>
            + KERNEL=="sr*", ENV{DISK_EJECT_REQUEST}!="?*",
            ENV{ID_CDROM_MEDIA_TRACK_<wbr>COUNT_DATA}=="?*",
            ENV{ID_CDROM_MEDIA_SESSION_<wbr>LAST_OFFSET}=="?*", \<br>
            +   IMPORT{builtin}="blkid --offset=$env{ID_CDROM_MEDIA_<wbr>SESSION_LAST_OFFSET}"<br>
            +@@ -88,7 +94,4 @@ ENV{DEVTYPE}=="partition",
            ENV{ID_WWN_WITH_EXTENSION}=="?<wbr>*", SYMLINK+="disk/by-i<br>
            + ENV{ID_PART_ENTRY_UUID}=="?*",
            SYMLINK+="disk/by-partuuid/$<wbr>env{ID_PART_ENTRY_UUID}"<br>
            + ENV{ID_PART_ENTRY_SCHEME}=="<wbr>gpt",
            ENV{ID_PART_ENTRY_NAME}=="?*", SYMLINK+="disk/by-partlabel/$<wbr>env{ID_PART_ENTRY_NAME}"<br>
            +<br>
            +-# add symlink to GPT root disk<br>
            +-ENV{ID_PART_ENTRY_SCHEME}=="<wbr>gpt",
            ENV{ID_PART_GPT_AUTO_ROOT}=="<wbr>1",
            SYMLINK+="gpt-auto-root"<br>
            +-<br>
            + LABEL="persistent_storage_end"<br>
            +diff --git a/rules/60-sensor.rules b/rules/60-sensor.rules<br>
            +index 82e44f8..7ad2c36 100644<br>
            +--- a/rules/60-sensor.rules<br>
            ++++ b/rules/60-sensor.rules<br>
            +@@ -7,4 +7,12 @@ SUBSYSTEM=="iio", KERNEL=="iio*",
            SUBSYSTEMS=="usb|i2c", \<br>
            +   IMPORT{builtin}="hwdb 'sensor:modalias:$attr{<wbr>modalias}:$attr{[dmi/id]<wbr>modalias}'",
            \<br>
            +   GOTO="sensor_end"<br>
            +<br>
            ++SUBSYSTEM=="input", ENV{ID_INPUT_ACCELEROMETER}=="<wbr>1",
            SUBSYSTEMS=="acpi", \<br>
            ++  IMPORT{builtin}="hwdb 'sensor:modalias:acpi:$attr{<wbr>hid}:$attr{[dmi/id]modalias}'"<wbr>,
            \<br>
            ++  GOTO="sensor_end"<br>
            ++<br>
            ++SUBSYSTEM=="input", ENV{ID_INPUT_ACCELEROMETER}=="<wbr>1",
            SUBSYSTEMS=="platform", \<br>
            ++  IMPORT{builtin}="hwdb 'sensor:modalias:platform:$id:<wbr>$attr{[dmi/id]modalias}'",
            \<br>
            ++  GOTO="sensor_end"<br>
            ++<br>
            + LABEL="sensor_end"<br>
            +diff --git a/rules/78-sound-card.rules
            b/rules/78-sound-card.rules<br>
            +index 04740e8..f2fc277 100644<br>
            +--- a/rules/78-sound-card.rules<br>
            ++++ b/rules/78-sound-card.rules<br>
            +@@ -48,6 +48,13 @@ SUBSYSTEMS=="firewire",
            ATTRS{guid}=="?*", \<br>
            + SUBSYSTEMS=="firewire", GOTO="skip_pci"<br>
            +<br>
            + SUBSYSTEMS=="pci", ENV{ID_BUS}="pci",
            ENV{ID_VENDOR_ID}="$attr{<wbr>vendor}",
            ENV{ID_MODEL_ID}="$attr{<wbr>device}"<br>
            ++SUBSYSTEMS=="pci", GOTO="skip_pci"<br>
            ++<br>
            ++# If we reach here, the device nor any of its parents are
            USB/PCI/firewire bus devices.<br>
            ++# If we now find a parent that is a platform device,
            assume that we're working with<br>
            ++# an internal sound card.<br>
            ++SUBSYSTEMS=="platform", ENV{SOUND_FORM_FACTOR}="<wbr>internal",
            GOTO="sound_end"<br>
            ++<br>
            + LABEL="skip_pci"<br>
            +<br>
            + # Define ID_ID if ID_BUS and ID_SERIAL are set. This will
            work for both<br>
            +--<br>
            +1.8.3.1<br>
            +<br>
            diff --git a/meta/recipes-core/udev/<wbr>eudev/0003-rules-watch-<wbr>metadata-changes-in-ide-<wbr>devices.patch
            b/meta/recipes-core/udev/<wbr>eudev/0003-rules-watch-<wbr>metadata-changes-in-ide-<wbr>devices.patch<br>
            new file mode 100644<br>
            index 0000000..17d698a<br>
            --- /dev/null<br>
            +++ b/meta/recipes-core/udev/<wbr>eudev/0003-rules-watch-<wbr>metadata-changes-in-ide-<wbr>devices.patch<br>
            @@ -0,0 +1,43 @@<br>
            +From 8207d645582e96c56950674e104653<wbr>d0cd552d60 Mon Sep
            17 00:00:00 2001<br>
            +From: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            +Date: Fri, 17 Nov 2017 09:46:00 +0800<br>
            +Subject: [PATCH] rules: watch metadata changes in ide
            devices<br>
            +<br>
            +Formatting IDE storage does not trigger "change" uevents.
            As a result<br>
            +clients using udev API don't get any updates afterwards and
            get outdated<br>
            +information about the device.<br>
            +...<br>
            +root@qemux86-64:~# mkfs.ext4 -F /dev/hda1<br>
            +Creating filesystem with 262144 4k blocks and 65536 inodes<br>
            +Filesystem UUID: 98791eb2-2bf3-47ad-b4d8-<wbr>4cf7e914eee2<br>
            +<br>
            +root@qemux86-64:~# ls /dev/disk/by-uuid/98791eb2-<wbr>2bf3-47ad-b4d8-4cf7e914eee2<br>
            +ls: cannot access '/dev/disk/by-uuid/98791eb2-<wbr>2bf3-47ad-b4d8-4cf7e914eee2':
            No such file or directory<br>
            +...<br>
            +Include hd* in a match for watch option assignment.<br>
            +<br>
            +Upstream-Status: Denied<br>
            +<br>
            +qemu by default emulates IDE and the linux-yocto kernel(s)
            use<br>
            +CONFIG_IDE instead of the more modern libsata, so disks
            appear as<br>
            +/dev/hd*. A similar patch rejected by upstream because
            CONFIG_IDE<br>
            +is deprecated.<br>
            +<br>
            +Signed-off-by: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            +---<br>
            + rules/60-block.rules | 2 +-<br>
            + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
            +<br>
            +diff --git a/rules/60-block.rules b/rules/60-block.rules<br>
            +index 343fc06..b5237da 100644<br>
            +--- a/rules/60-block.rules<br>
            ++++ b/rules/60-block.rules<br>
            +@@ -8,4 +8,4 @@ ACTION=="add", SUBSYSTEM=="module",
            KERNEL=="block", ATTR{parameters/events_dfl_<br>
            + ACTION=="change", SUBSYSTEM=="scsi",
            ENV{DEVTYPE}=="scsi_device", TEST=="block",
            ATTR{block/*/uevent}="change"<br>
            +<br>
            + # watch metadata changes, caused by tools closing the
            device node which was opened for writing<br>
            +-ACTION!="remove", SUBSYSTEM=="block",
            KERNEL=="loop*|nvme*|sd*|vd*|<wbr>xvd*|pmem*|mmcblk*",
            OPTIONS+="watch"<br>
            ++ACTION!="remove", SUBSYSTEM=="block",
            KERNEL=="loop*|nvme*|sd*|vd*|<wbr>xvd*|pmem*|mmcblk*|hd*",
            OPTIONS+="watch"<br>
            +--<br>
            +1.8.3.1<br>
            +<br>
            diff --git a/meta/recipes-core/udev/<a
              href="http://eudev_3.2.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">eudev<wbr>_3.2.2.bb</a>
            b/meta/recipes-core/udev/<a href="http://eudev_3.2.2.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">eudev<wbr>_3.2.2.bb</a><br>
            index 70e3568..5cee061 100644<br>
            --- a/meta/recipes-core/udev/<a href="http://eudev_3.2.2.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">eudev<wbr>_3.2.2.bb</a><br>
            +++ b/meta/recipes-core/udev/<a href="http://eudev_3.2.2.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">eudev<wbr>_3.2.2.bb</a><br>
            @@ -11,6 +11,9 @@ PROVIDES = "udev"<br>
             SRC_URI = "<a
              href="http://dev.gentoo.org/%7Eblueness/$%7BBPN%7D/$%7BBP%7D.tar.gz"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://dev.gentoo.org/~<wbr>blueness/${BPN}/${BP}.tar.gz</a>
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0014-Revert-rules">file://0014-Revert-rules</a>-<wbr>remove-firmware-loading-rules.<wbr>patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://Revert-udev-remove">file://Revert-udev-remove</a>-<wbr>userspace-firmware-loading-<wbr>suppor.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://0001-rules-whitelist">file://0001-rules-whitelist</a>-<wbr>hd-devices.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://0002-rules-update.patch">file://0002-rules-update.patch</a> \<br>
            +           <a class="moz-txt-link-freetext" href="file://0003-rules-watch">file://0003-rules-watch</a>-<wbr>metadata-changes-in-ide-<wbr>devices.patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://devfs-udev.rules">file://devfs-udev.rules</a> \<br>
                        <a class="moz-txt-link-freetext" href="file://init">file://init</a> \<br>
                        <a class="moz-txt-link-freetext" href="file://links.conf">file://links.conf</a> \<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.8.1<br>
                <br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------365012DCFD24AE4F0DBA85B5--
