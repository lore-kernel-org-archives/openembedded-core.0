Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id A6E5E71994
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 12:02:08 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id o2so9517307ioe.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 04:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JvGLTlmOQcpjOruBSIJI/MhldD76mRhuMnLaXV6/hME=;
	b=Gi8NTDDb2ZwgIxfiojnx4SfwI7CpdNFwXaFsXHbARs4m79YB/xItqhPu5ecCMlkaFY
	tm/dTicWZHGpRfTNH0NXjesIWE/WtXQUvTv5P64m8YgOlCZhPU58LAX0l/YJpu3M7kMT
	VaSBN0/RbazS0YZ2KDaguK1Fr0Bz3dOY6P7Ep4jbE6297uoKTex6hq9ueLW1xc6ZM82J
	T49ZVgdIpB7wdUsD6k9zboICXygF+NNwO0v5twZatOH2d5Lvqg1d/KOj0YnBeoz7T8FO
	2I8d7OPWWZVLjMeBEdppGu2VaYTEiHzC7bKD1ZnWqBi5SiVazB6KS82/PYod7UDFghFk
	TdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JvGLTlmOQcpjOruBSIJI/MhldD76mRhuMnLaXV6/hME=;
	b=U8ms8xmwfkMSkbghtBoJ0fWuYkXT6wbviYist6Fds1ZzMkFnU5nJxk18ofU46DWmjo
	AvyffCV6V7anteTCVeHmQO3DWrUXMQa1YVjrOUwszD87sRHwxR6Tsu+/u+VM64oVsXgp
	C9CbUCn5QuGnWILan+FGVUG26qAfdrkS/4l6NNhXXU1wRio/eBaGp5LBWsxZhzqBLm1f
	2WtKK69gwhdFAbicrismVoARlGjRwBG/VL3EYtESD/r5EaIopXn05GNjbCKqUbiMBWCS
	TqSq9NnsyHxAll/robGQhzYqW3C6jSmwEY5rJywGqX45QKHZfdOKMfU4VDBnHh+gYU4V
	/zVQ==
X-Gm-Message-State: AKGB3mJ8pwvwqrayyGWpRNP0Qwcy3pPGGNAE4+bCz6YH/2+NsqG9Y9Fu
	tBQ/BR20WFMlupu1RimW+Vpew24CR5cfqY3I4CSMYA==
X-Google-Smtp-Source: ACJfBot9ohPtYIsp20qbnrdzGg/PrDlU1B0QGiiUfQUkWKJcL3TdREv0jaYrDRtb7vsHHq+epgORUghRkG08l/8jm1U=
X-Received: by 10.107.137.15 with SMTP id l15mr1191105iod.52.1513598529541;
	Mon, 18 Dec 2017 04:02:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Mon, 18 Dec 2017 04:01:49 -0800 (PST)
In-Reply-To: <1510898885-256081-2-git-send-email-hongxu.jia@windriver.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
	<1510898885-256081-2-git-send-email-hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Dec 2017 12:01:49 +0000
Message-ID: <CAJTo0LYbApWRsWnjTXsfJJ4p502FF-FXoVHO1=fu3o-5P2=dWQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
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
X-List-Received-Date: Mon, 18 Dec 2017 12:02:09 -0000
Content-Type: multipart/alternative; boundary="001a113ed3a6afaf8d05609c1ecc"

--001a113ed3a6afaf8d05609c1ecc
Content-Type: text/plain; charset="UTF-8"

We had to revert this because it meant that input devices didn't work in
qemu, which is quite a problem!

Ross

On 17 November 2017 at 06:08, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> - Add whitelist hd* devices
>
> - Backport latest rules from upstream
>
> - Fix formatting IDE storage does not trigger "change" uevents
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../eudev/0001-rules-whitelist-hd-devices.patch    |  33 ++++
>  .../udev/eudev/0002-rules-update.patch             | 196
> +++++++++++++++++++++
>  ...les-watch-metadata-changes-in-ide-devices.patch |  43 +++++
>  meta/recipes-core/udev/eudev_3.2.2.bb              |   3 +
>  4 files changed, 275 insertions(+)
>  create mode 100644 meta/recipes-core/udev/eudev/0001-rules-whitelist-hd-
> devices.patch
>  create mode 100644 meta/recipes-core/udev/eudev/0002-rules-update.patch
>  create mode 100644 meta/recipes-core/udev/eudev/
> 0003-rules-watch-metadata-changes-in-ide-devices.patch
>
> diff --git a/meta/recipes-core/udev/eudev/0001-rules-whitelist-hd-devices.patch
> b/meta/recipes-core/udev/eudev/0001-rules-whitelist-hd-devices.patch
> new file mode 100644
> index 0000000..1cc4332
> --- /dev/null
> +++ b/meta/recipes-core/udev/eudev/0001-rules-whitelist-hd-devices.patch
> @@ -0,0 +1,33 @@
> +From 676864191d1855ce23a31026b74c7f64b15e5062 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 9 Nov 2016 19:41:13 -0800
> +Subject: [PATCH 1/3] rules: whitelist hd* devices
> +
> +qemu by default emulates IDE and the linux-yocto kernel(s) use
> +CONFIG_IDE instead of the more modern libsata, so disks appear as
> +/dev/hd*. Patch rejected upstream because CONFIG_IDE is deprecated.
> +
> +Upstream-Status: Denied [https://github.com/systemd/systemd/pull/1276]
> +
> +Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + rules/60-persistent-storage.rules | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/rules/60-persistent-storage.rules
> b/rules/60-persistent-storage.rules
> +index 6f60ae9..bcd573a 100644
> +--- a/rules/60-persistent-storage.rules
> ++++ b/rules/60-persistent-storage.rules
> +@@ -7,7 +7,7 @@ ACTION=="remove", GOTO="persistent_storage_end"
> + ENV{UDEV_DISABLE_PERSISTENT_STORAGE_RULES_FLAG}=="1",
> GOTO="persistent_storage_end"
> +
> + SUBSYSTEM!="block", GOTO="persistent_storage_end"
> +-KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*
> |sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*",
> GOTO="persistent_storage_end"
> ++KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*
> |sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*|hd*",
> GOTO="persistent_storage_end"
> +
> + # ignore partitions that span the entire disk
> + TEST=="whole_disk", GOTO="persistent_storage_end"
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-core/udev/eudev/0002-rules-update.patch
> b/meta/recipes-core/udev/eudev/0002-rules-update.patch
> new file mode 100644
> index 0000000..7cc4d06
> --- /dev/null
> +++ b/meta/recipes-core/udev/eudev/0002-rules-update.patch
> @@ -0,0 +1,196 @@
> +From d29a20381bc6bd85e86bdc5b2adb48fa12ccd22a Mon Sep 17 00:00:00 2001
> +From: "Anthony G. Basile" <blueness@gentoo.org>
> +Date: Sun, 3 Sep 2017 13:20:33 -0400
> +Subject: [PATCH 2/3] rules: update
> +
> +Upstream-Status: Backport [https://github.com/gentoo/eudev/commit/
> 47367bc4df6f05a49cf4b5b0209153d77a9ade83]
> +
> +Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
> +---
> + rules/50-udev-default.rules       |  3 ++-
> + rules/60-block.rules              |  5 +----
> + rules/60-cdrom_id.rules           |  6 +++++-
> + rules/60-drm.rules                |  5 +++++
> + rules/60-evdev.rules              |  6 +++++-
> + rules/60-persistent-input.rules   |  2 ++
> + rules/60-persistent-storage.rules | 11 +++++++----
> + rules/60-sensor.rules             |  8 ++++++++
> + rules/78-sound-card.rules         |  7 +++++++
> + 9 files changed, 42 insertions(+), 11 deletions(-)
> +
> +diff --git a/rules/50-udev-default.rules b/rules/50-udev-default.rules
> +index e9eeb85..87438c0 100644
> +--- a/rules/50-udev-default.rules
> ++++ b/rules/50-udev-default.rules
> +@@ -11,7 +11,6 @@ SUBSYSTEM=="rtc", ATTR{hctosys}=="1", SYMLINK+="rtc"
> + SUBSYSTEM=="rtc", KERNEL=="rtc0", SYMLINK+="rtc",
> OPTIONS+="link_priority=-100"
> +
> + SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", IMPORT{builtin}="usb_id",
> IMPORT{builtin}="hwdb --subsystem=usb"
> +-SUBSYSTEM=="input", ENV{ID_INPUT}=="", IMPORT{builtin}="input_id"
> + ENV{MODALIAS}!="", IMPORT{builtin}="hwdb --subsystem=$env{SUBSYSTEM}"
> +
> + ACTION!="add", GOTO="default_end"
> +@@ -34,6 +33,8 @@ SUBSYSTEM=="video4linux", GROUP="video"
> + SUBSYSTEM=="graphics", GROUP="video"
> + SUBSYSTEM=="drm", GROUP="video"
> + SUBSYSTEM=="dvb", GROUP="video"
> ++SUBSYSTEM=="media", GROUP="video"
> ++SUBSYSTEM=="cec", GROUP="video"
> +
> + SUBSYSTEM=="sound", GROUP="audio", \
> +   OPTIONS+="static_node=snd/seq", OPTIONS+="static_node=snd/timer"
> +diff --git a/rules/60-block.rules b/rules/60-block.rules
> +index 5e38e12..343fc06 100644
> +--- a/rules/60-block.rules
> ++++ b/rules/60-block.rules
> +@@ -8,7 +8,4 @@ ACTION=="add", SUBSYSTEM=="module", KERNEL=="block",
> ATTR{parameters/events_dfl_
> + ACTION=="change", SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device",
> TEST=="block", ATTR{block/*/uevent}="change"
> +
> + # watch metadata changes, caused by tools closing the device node which
> was opened for writing
> +-ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*",
> OPTIONS+="watch"
> +-
> +-# set noop on solid state drives
> +-SUBSYSTEM=="block", ACTION=="add", ATTR{queue/rotational}=="0",
> ATTR{queue/scheduler}="noop"
> ++ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*",
> OPTIONS+="watch"
> +diff --git a/rules/60-cdrom_id.rules b/rules/60-cdrom_id.rules
> +index 5c3b52e..288f8ce 100644
> +--- a/rules/60-cdrom_id.rules
> ++++ b/rules/60-cdrom_id.rules
> +@@ -2,12 +2,16 @@
> +
> + ACTION=="remove", GOTO="cdrom_end"
> + SUBSYSTEM!="block", GOTO="cdrom_end"
> +-KERNEL!="sr[0-9]*|xvd*", GOTO="cdrom_end"
> ++KERNEL!="sr[0-9]*|vdisk*|xvd*", GOTO="cdrom_end"
> + ENV{DEVTYPE}!="disk", GOTO="cdrom_end"
> +
> + # unconditionally tag device as CDROM
> + KERNEL=="sr[0-9]*", ENV{ID_CDROM}="1"
> +
> ++# stop automatically any mount units bound to the device if the media
> eject
> ++# button is pressed.
> ++ENV{ID_CDROM}=="1", ENV{SYSTEMD_MOUNT_DEVICE_BOUND}="1"
> ++
> + # media eject button pressed
> + ENV{DISK_EJECT_REQUEST}=="?*", RUN+="cdrom_id --eject-media $devnode",
> GOTO="cdrom_end"
> +
> +diff --git a/rules/60-drm.rules b/rules/60-drm.rules
> +index 1ed3e44..f7f3435 100644
> +--- a/rules/60-drm.rules
> ++++ b/rules/60-drm.rules
> +@@ -1,3 +1,8 @@
> + # do not edit this file, it will be overwritten on update
> +
> + ACTION!="remove", SUBSYSTEM=="drm", SUBSYSTEMS=="pci|usb|platform",
> IMPORT{builtin}="path_id"
> ++
> ++# by-path
> ++ENV{ID_PATH}=="?*", KERNEL=="card*", SYMLINK+="dri/by-path/$env{ID_
> PATH}-card"
> ++ENV{ID_PATH}=="?*", KERNEL=="controlD*", SYMLINK+="dri/by-path/$env{ID_
> PATH}-control"
> ++ENV{ID_PATH}=="?*", KERNEL=="renderD*", SYMLINK+="dri/by-path/$env{ID_
> PATH}-render"
> +diff --git a/rules/60-evdev.rules b/rules/60-evdev.rules
> +index ade7e7f..e5e608a 100644
> +--- a/rules/60-evdev.rules
> ++++ b/rules/60-evdev.rules
> +@@ -8,10 +8,14 @@ IMPORT{builtin}="hwdb --subsystem=input
> --lookup-prefix=evdev:", \
> +   RUN{builtin}+="keyboard", GOTO="evdev_end"
> +
> + # AT keyboard matching by the machine's DMI data
> +-ENV{ID_INPUT_KEY}=="?*", DRIVERS=="atkbd", \
> ++DRIVERS=="atkbd", \
> +   IMPORT{builtin}="hwdb 'evdev:atkbd:$attr{[dmi/id]modalias}'", \
> +   RUN{builtin}+="keyboard", GOTO="evdev_end"
> +
> ++# device matching the input device name + properties + the machine's DMI
> data
> ++KERNELS=="input*", IMPORT{builtin}="hwdb 'evdev:name:$attr{name}:phys:$
> attr{phys}:ev:$attr{capabilities/ev}:$attr{[dmi/id]modalias}'", \
> ++  RUN{builtin}+="keyboard", GOTO="evdev_end"
> ++
> + # device matching the input device name and the machine's DMI data
> + KERNELS=="input*", IMPORT{builtin}="hwdb 'evdev:name:$attr{name}:$attr{[dmi/id]modalias}'",
> \
> +   RUN{builtin}+="keyboard", GOTO="evdev_end"
> +diff --git a/rules/60-persistent-input.rules b/rules/60-persistent-input.
> rules
> +index 607144b..91efbe7 100644
> +--- a/rules/60-persistent-input.rules
> ++++ b/rules/60-persistent-input.rules
> +@@ -3,6 +3,8 @@
> + ACTION=="remove", GOTO="persistent_input_end"
> + SUBSYSTEM!="input", GOTO="persistent_input_end"
> + SUBSYSTEMS=="bluetooth", ENV{ID_BUS}="bluetooth",
> GOTO="persistent_input_end"
> ++# Bluetooth devices don't always have the bluetooth subsystem
> ++ATTRS{id/bustype}=="0005", ENV{ID_BUS}="bluetooth",
> GOTO="persistent_input_end"
> + SUBSYSTEMS=="rmi4", ENV{ID_BUS}="rmi", GOTO="persistent_input_end"
> + SUBSYSTEMS=="serio", ENV{ID_BUS}="i8042", GOTO="persistent_input_end"
> +
> +diff --git a/rules/60-persistent-storage.rules
> b/rules/60-persistent-storage.rules
> +index bcd573a..63f472b 100644
> +--- a/rules/60-persistent-storage.rules
> ++++ b/rules/60-persistent-storage.rules
> +@@ -20,6 +20,7 @@ KERNEL=="nvme*[0-9]n*[0-9]", ATTR{wwid}=="?*",
> SYMLINK+="disk/by-id/nvme-$attr{w
> + KERNEL=="nvme*[0-9]n*[0-9]p*[0-9]", ENV{DEVTYPE}=="partition",
> ATTRS{wwid}=="?*", SYMLINK+="disk/by-id/nvme-$attr{wwid}-part%n"
> +
> + KERNEL=="nvme*[0-9]n*[0-9]", ENV{DEVTYPE}=="disk", ATTRS{serial}=="?*",
> ENV{ID_SERIAL_SHORT}="$attr{serial}"
> ++KERNEL=="nvme*[0-9]n*[0-9]", ENV{DEVTYPE}=="disk", ATTRS{wwid}=="?*",
> ENV{ID_WWN}="$attr{wwid}"
> + KERNEL=="nvme*[0-9]n*[0-9]", ENV{DEVTYPE}=="disk", ATTRS{model}=="?*",
> ENV{ID_SERIAL_SHORT}=="?*", ENV{ID_SERIAL}="$attr{model}_$env{ID_SERIAL_SHORT}",
> SYMLINK+="disk/by-id/nvme-$env{ID_SERIAL}"
> +
> + KERNEL=="nvme*[0-9]n*[0-9]p*[0-9]", ENV{DEVTYPE}=="partition",
> ATTRS{serial}=="?*", ENV{ID_SERIAL_SHORT}="$attr{serial}"
> +@@ -63,9 +64,14 @@ KERNEL=="msblk[0-9]p[0-9]|mspblk[0-9]p[0-9]",
> ENV{ID_NAME}=="?*", ENV{ID_SERIAL}
> +
> + # by-path
> + ENV{DEVTYPE}=="disk", DEVPATH!="*/virtual/*", IMPORT{builtin}="path_id"
> +-ENV{DEVTYPE}=="disk", ENV{ID_PATH}=="?*", SYMLINK+="disk/by-path/$env{
> ID_PATH}"
> ++KERNEL=="mmcblk[0-9]boot[0-9]", ENV{DEVTYPE}=="disk",
> ENV{ID_PATH}=="?*", SYMLINK+="disk/by-path/$env{ID_PATH}-boot%n"
> ++KERNEL!="mmcblk[0-9]boot[0-9]", ENV{DEVTYPE}=="disk",
> ENV{ID_PATH}=="?*", SYMLINK+="disk/by-path/$env{ID_PATH}"
> + ENV{DEVTYPE}=="partition", ENV{ID_PATH}=="?*",
> SYMLINK+="disk/by-path/$env{ID_PATH}-part%n"
> +
> ++# legacy virtio-pci by-path links (deprecated)
> ++KERNEL=="vd*[!0-9]", ENV{ID_PATH}=="pci-*",
> SYMLINK+="disk/by-path/virtio-$env{ID_PATH}"
> ++KERNEL=="vd*[0-9]", ENV{ID_PATH}=="pci-*", SYMLINK+="disk/by-path/virtio-
> $env{ID_PATH}-part%n"
> ++
> + # probe filesystem metadata of optical drives which have a media inserted
> + KERNEL=="sr*", ENV{DISK_EJECT_REQUEST}!="?*", ENV{ID_CDROM_MEDIA_TRACK_COUNT_DATA}=="?*",
> ENV{ID_CDROM_MEDIA_SESSION_LAST_OFFSET}=="?*", \
> +   IMPORT{builtin}="blkid --offset=$env{ID_CDROM_MEDIA_
> SESSION_LAST_OFFSET}"
> +@@ -88,7 +94,4 @@ ENV{DEVTYPE}=="partition",
> ENV{ID_WWN_WITH_EXTENSION}=="?*", SYMLINK+="disk/by-i
> + ENV{ID_PART_ENTRY_UUID}=="?*", SYMLINK+="disk/by-partuuid/$
> env{ID_PART_ENTRY_UUID}"
> + ENV{ID_PART_ENTRY_SCHEME}=="gpt", ENV{ID_PART_ENTRY_NAME}=="?*",
> SYMLINK+="disk/by-partlabel/$env{ID_PART_ENTRY_NAME}"
> +
> +-# add symlink to GPT root disk
> +-ENV{ID_PART_ENTRY_SCHEME}=="gpt", ENV{ID_PART_GPT_AUTO_ROOT}=="1",
> SYMLINK+="gpt-auto-root"
> +-
> + LABEL="persistent_storage_end"
> +diff --git a/rules/60-sensor.rules b/rules/60-sensor.rules
> +index 82e44f8..7ad2c36 100644
> +--- a/rules/60-sensor.rules
> ++++ b/rules/60-sensor.rules
> +@@ -7,4 +7,12 @@ SUBSYSTEM=="iio", KERNEL=="iio*", SUBSYSTEMS=="usb|i2c",
> \
> +   IMPORT{builtin}="hwdb 'sensor:modalias:$attr{modalias}:$attr{[dmi/id]modalias}'",
> \
> +   GOTO="sensor_end"
> +
> ++SUBSYSTEM=="input", ENV{ID_INPUT_ACCELEROMETER}=="1",
> SUBSYSTEMS=="acpi", \
> ++  IMPORT{builtin}="hwdb 'sensor:modalias:acpi:$attr{
> hid}:$attr{[dmi/id]modalias}'", \
> ++  GOTO="sensor_end"
> ++
> ++SUBSYSTEM=="input", ENV{ID_INPUT_ACCELEROMETER}=="1",
> SUBSYSTEMS=="platform", \
> ++  IMPORT{builtin}="hwdb 'sensor:modalias:platform:$id:$attr{[dmi/id]modalias}'",
> \
> ++  GOTO="sensor_end"
> ++
> + LABEL="sensor_end"
> +diff --git a/rules/78-sound-card.rules b/rules/78-sound-card.rules
> +index 04740e8..f2fc277 100644
> +--- a/rules/78-sound-card.rules
> ++++ b/rules/78-sound-card.rules
> +@@ -48,6 +48,13 @@ SUBSYSTEMS=="firewire", ATTRS{guid}=="?*", \
> + SUBSYSTEMS=="firewire", GOTO="skip_pci"
> +
> + SUBSYSTEMS=="pci", ENV{ID_BUS}="pci", ENV{ID_VENDOR_ID}="$attr{vendor}",
> ENV{ID_MODEL_ID}="$attr{device}"
> ++SUBSYSTEMS=="pci", GOTO="skip_pci"
> ++
> ++# If we reach here, the device nor any of its parents are
> USB/PCI/firewire bus devices.
> ++# If we now find a parent that is a platform device, assume that we're
> working with
> ++# an internal sound card.
> ++SUBSYSTEMS=="platform", ENV{SOUND_FORM_FACTOR}="internal",
> GOTO="sound_end"
> ++
> + LABEL="skip_pci"
> +
> + # Define ID_ID if ID_BUS and ID_SERIAL are set. This will work for both
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-core/udev/eudev/0003-rules-watch-
> metadata-changes-in-ide-devices.patch b/meta/recipes-core/udev/
> eudev/0003-rules-watch-metadata-changes-in-ide-devices.patch
> new file mode 100644
> index 0000000..17d698a
> --- /dev/null
> +++ b/meta/recipes-core/udev/eudev/0003-rules-watch-
> metadata-changes-in-ide-devices.patch
> @@ -0,0 +1,43 @@
> +From 8207d645582e96c56950674e104653d0cd552d60 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Fri, 17 Nov 2017 09:46:00 +0800
> +Subject: [PATCH] rules: watch metadata changes in ide devices
> +
> +Formatting IDE storage does not trigger "change" uevents. As a result
> +clients using udev API don't get any updates afterwards and get outdated
> +information about the device.
> +...
> +root@qemux86-64:~# mkfs.ext4 -F /dev/hda1
> +Creating filesystem with 262144 4k blocks and 65536 inodes
> +Filesystem UUID: 98791eb2-2bf3-47ad-b4d8-4cf7e914eee2
> +
> +root@qemux86-64:~# ls /dev/disk/by-uuid/98791eb2-
> 2bf3-47ad-b4d8-4cf7e914eee2
> +ls: cannot access '/dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2':
> No such file or directory
> +...
> +Include hd* in a match for watch option assignment.
> +
> +Upstream-Status: Denied
> +
> +qemu by default emulates IDE and the linux-yocto kernel(s) use
> +CONFIG_IDE instead of the more modern libsata, so disks appear as
> +/dev/hd*. A similar patch rejected by upstream because CONFIG_IDE
> +is deprecated.
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + rules/60-block.rules | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/rules/60-block.rules b/rules/60-block.rules
> +index 343fc06..b5237da 100644
> +--- a/rules/60-block.rules
> ++++ b/rules/60-block.rules
> +@@ -8,4 +8,4 @@ ACTION=="add", SUBSYSTEM=="module", KERNEL=="block",
> ATTR{parameters/events_dfl_
> + ACTION=="change", SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device",
> TEST=="block", ATTR{block/*/uevent}="change"
> +
> + # watch metadata changes, caused by tools closing the device node which
> was opened for writing
> +-ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*",
> OPTIONS+="watch"
> ++ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|hd*",
> OPTIONS+="watch"
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-core/udev/eudev_3.2.2.bb
> b/meta/recipes-core/udev/eudev_3.2.2.bb
> index 70e3568..5cee061 100644
> --- a/meta/recipes-core/udev/eudev_3.2.2.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.2.bb
> @@ -11,6 +11,9 @@ PROVIDES = "udev"
>  SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
>             file://0014-Revert-rules-remove-firmware-loading-rules.patch \
>             file://Revert-udev-remove-userspace-firmware-loading-suppor.patch
> \
> +           file://0001-rules-whitelist-hd-devices.patch \
> +           file://0002-rules-update.patch \
> +           file://0003-rules-watch-metadata-changes-in-ide-devices.patch
> \
>             file://devfs-udev.rules \
>             file://init \
>             file://links.conf \
> --
> 2.8.1
>
>

--001a113ed3a6afaf8d05609c1ecc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We had to revert this because it meant that input devices =
didn&#39;t work in qemu, which is quite a problem!<div><br><div>Ross</div><=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 17 =
November 2017 at 06:08, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mailto:=
hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">- Add whitelist hd* devic=
es<br>
<br>
- Backport latest rules from upstream<br>
<br>
- Fix formatting IDE storage does not trigger &quot;change&quot; uevents<br=
>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../eudev/0001-rules-<wbr>whitelist-hd-devices.patch=C2=A0 =C2=A0 |=
=C2=A0 33 ++++<br>
=C2=A0.../udev/eudev/0002-rules-<wbr>update.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 196 +++++++++++++++++++++<br>
=C2=A0...les-watch-metadata-changes-<wbr>in-ide-devices.patch |=C2=A0 43 ++=
+++<br>
=C2=A0meta/recipes-core/udev/<a href=3D"http://eudev_3.2.2.bb" rel=3D"noref=
errer" target=3D"_blank">eudev_<wbr>3.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A04 files changed, 275 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/udev/eudev/<wbr>0001-rules-white=
list-hd-<wbr>devices.patch<br>
=C2=A0create mode 100644 meta/recipes-core/udev/eudev/<wbr>0002-rules-updat=
e.patch<br>
=C2=A0create mode 100644 meta/recipes-core/udev/eudev/<wbr>0003-rules-watch=
-metadata-<wbr>changes-in-ide-devices.patch<br>
<br>
diff --git a/meta/recipes-core/udev/<wbr>eudev/0001-rules-whitelist-hd-<wbr=
>devices.patch b/meta/recipes-core/udev/<wbr>eudev/0001-rules-whitelist-hd-=
<wbr>devices.patch<br>
new file mode 100644<br>
index 0000000..1cc4332<br>
--- /dev/null<br>
+++ b/meta/recipes-core/udev/<wbr>eudev/0001-rules-whitelist-hd-<wbr>device=
s.patch<br>
@@ -0,0 +1,33 @@<br>
+From 676864191d1855ce23a31026b74c7f<wbr>64b15e5062 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Wed, 9 Nov 2016 19:41:13 -0800<br>
+Subject: [PATCH 1/3] rules: whitelist hd* devices<br>
+<br>
+qemu by default emulates IDE and the linux-yocto kernel(s) use<br>
+CONFIG_IDE instead of the more modern libsata, so disks appear as<br>
+/dev/hd*. Patch rejected upstream because CONFIG_IDE is deprecated.<br>
+<br>
+Upstream-Status: Denied [<a href=3D"https://github.com/systemd/systemd/pul=
l/1276" rel=3D"noreferrer" target=3D"_blank">https://github.com/systemd/<wb=
r>systemd/pull/1276</a>]<br>
+<br>
+Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.com">=
patrick.ohly@intel.com</a>&gt;<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
+---<br>
+ rules/60-persistent-storage.<wbr>rules | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/rules/60-persistent-storage.<wbr>rules b/rules/60-persistent-=
storage.<wbr>rules<br>
+index 6f60ae9..bcd573a 100644<br>
+--- a/rules/60-persistent-storage.<wbr>rules<br>
++++ b/rules/60-persistent-storage.<wbr>rules<br>
+@@ -7,7 +7,7 @@ ACTION=3D=3D&quot;remove&quot;, GOTO=3D&quot;persistent_st=
orage_end&quot;<br>
+ ENV{UDEV_DISABLE_PERSISTENT_<wbr>STORAGE_RULES_FLAG}=3D=3D&quot;1&quot;, =
GOTO=3D&quot;persistent_storage_end&quot;<br>
+<br>
+ SUBSYSTEM!=3D&quot;block&quot;, GOTO=3D&quot;persistent_storage_end&quot;=
<br>
+-KERNEL!=3D&quot;loop*|mmcblk*[0-9]|<wbr>msblk*[0-9]|mspblk*[0-9]|nvme*<wb=
r>|sd*|sr*|vd*|xvd*|bcache*|<wbr>cciss*|dasd*|ubd*|scm*|pmem*|<wbr>nbd*&quo=
t;, GOTO=3D&quot;persistent_storage_end&quot;<br>
++KERNEL!=3D&quot;loop*|mmcblk*[0-9]|<wbr>msblk*[0-9]|mspblk*[0-9]|nvme*<wb=
r>|sd*|sr*|vd*|xvd*|bcache*|<wbr>cciss*|dasd*|ubd*|scm*|pmem*|<wbr>nbd*|hd*=
&quot;, GOTO=3D&quot;persistent_storage_end&quot;<br>
+<br>
+ # ignore partitions that span the entire disk<br>
+ TEST=3D=3D&quot;whole_disk&quot;, GOTO=3D&quot;persistent_storage_end&quo=
t;<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-core/udev/<wbr>eudev/0002-rules-update.patch b/me=
ta/recipes-core/udev/<wbr>eudev/0002-rules-update.patch<br>
new file mode 100644<br>
index 0000000..7cc4d06<br>
--- /dev/null<br>
+++ b/meta/recipes-core/udev/<wbr>eudev/0002-rules-update.patch<br>
@@ -0,0 +1,196 @@<br>
+From d29a20381bc6bd85e86bdc5b2adb48<wbr>fa12ccd22a Mon Sep 17 00:00:00 200=
1<br>
+From: &quot;Anthony G. Basile&quot; &lt;<a href=3D"mailto:blueness@gentoo.=
org">blueness@gentoo.org</a>&gt;<br>
+Date: Sun, 3 Sep 2017 13:20:33 -0400<br>
+Subject: [PATCH 2/3] rules: update<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/gentoo/eudev/comm=
it/47367bc4df6f05a49cf4b5b0209153d77a9ade83" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/gentoo/<wbr>eudev/commit/<wbr>47367bc4df6f05a49cf=
4b5b0209153<wbr>d77a9ade83</a>]<br>
+<br>
+Signed-off-by: Anthony G. Basile &lt;<a href=3D"mailto:blueness@gentoo.org=
">blueness@gentoo.org</a>&gt;<br>
+---<br>
+ rules/50-udev-default.rules=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
+ rules/60-block.rules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 5 +----<br>
+ rules/60-cdrom_id.rules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6=
 +++++-<br>
+ rules/60-drm.rules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 5 +++++<br>
+ rules/60-evdev.rules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 6 +++++-<br>
+ rules/60-persistent-input.<wbr>rules=C2=A0 =C2=A0|=C2=A0 2 ++<br>
+ rules/60-persistent-storage.<wbr>rules | 11 +++++++----<br>
+ rules/60-sensor.rules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 8 ++++++++<br>
+ rules/78-sound-card.rules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 ++++=
+++<br>
+ 9 files changed, 42 insertions(+), 11 deletions(-)<br>
+<br>
+diff --git a/rules/50-udev-default.rules b/rules/50-udev-default.rules<br>
+index e9eeb85..87438c0 100644<br>
+--- a/rules/50-udev-default.rules<br>
++++ b/rules/50-udev-default.rules<br>
+@@ -11,7 +11,6 @@ SUBSYSTEM=3D=3D&quot;rtc&quot;, ATTR{hctosys}=3D=3D&quot=
;1&quot;, SYMLINK+=3D&quot;rtc&quot;<br>
+ SUBSYSTEM=3D=3D&quot;rtc&quot;, KERNEL=3D=3D&quot;rtc0&quot;, SYMLINK+=3D=
&quot;rtc&quot;, OPTIONS+=3D&quot;link_priority=3D-100&quot;<br>
+<br>
+ SUBSYSTEM=3D=3D&quot;usb&quot;, ENV{DEVTYPE}=3D=3D&quot;usb_device&quot;,=
 IMPORT{builtin}=3D&quot;usb_id&quot;, IMPORT{builtin}=3D&quot;hwdb --subsy=
stem=3Dusb&quot;<br>
+-SUBSYSTEM=3D=3D&quot;input&quot;, ENV{ID_INPUT}=3D=3D&quot;&quot;, IMPORT=
{builtin}=3D&quot;input_id&quot;<br>
+ ENV{MODALIAS}!=3D&quot;&quot;, IMPORT{builtin}=3D&quot;hwdb --subsystem=
=3D$env{SUBSYSTEM}&quot;<br>
+<br>
+ ACTION!=3D&quot;add&quot;, GOTO=3D&quot;default_end&quot;<br>
+@@ -34,6 +33,8 @@ SUBSYSTEM=3D=3D&quot;video4linux&quot;, GROUP=3D&quot;vi=
deo&quot;<br>
+ SUBSYSTEM=3D=3D&quot;graphics&quot;, GROUP=3D&quot;video&quot;<br>
+ SUBSYSTEM=3D=3D&quot;drm&quot;, GROUP=3D&quot;video&quot;<br>
+ SUBSYSTEM=3D=3D&quot;dvb&quot;, GROUP=3D&quot;video&quot;<br>
++SUBSYSTEM=3D=3D&quot;media&quot;, GROUP=3D&quot;video&quot;<br>
++SUBSYSTEM=3D=3D&quot;cec&quot;, GROUP=3D&quot;video&quot;<br>
+<br>
+ SUBSYSTEM=3D=3D&quot;sound&quot;, GROUP=3D&quot;audio&quot;, \<br>
+=C2=A0 =C2=A0OPTIONS+=3D&quot;static_node=3Dsnd/seq&quot;<wbr>, OPTIONS+=
=3D&quot;static_node=3Dsnd/<wbr>timer&quot;<br>
+diff --git a/rules/60-block.rules b/rules/60-block.rules<br>
+index 5e38e12..343fc06 100644<br>
+--- a/rules/60-block.rules<br>
++++ b/rules/60-block.rules<br>
+@@ -8,7 +8,4 @@ ACTION=3D=3D&quot;add&quot;, SUBSYSTEM=3D=3D&quot;module&q=
uot;, KERNEL=3D=3D&quot;block&quot;, ATTR{parameters/events_dfl_<br>
+ ACTION=3D=3D&quot;change&quot;, SUBSYSTEM=3D=3D&quot;scsi&quot;, ENV{DEVT=
YPE}=3D=3D&quot;scsi_device&quot;, TEST=3D=3D&quot;block&quot;, ATTR{block/=
*/uevent}=3D&quot;change&quot;<br>
+<br>
+ # watch metadata changes, caused by tools closing the device node which w=
as opened for writing<br>
+-ACTION!=3D&quot;remove&quot;, SUBSYSTEM=3D=3D&quot;block&quot;, KERNEL=3D=
=3D&quot;loop*|nvme*|sd*|vd*|<wbr>xvd*|pmem*&quot;, OPTIONS+=3D&quot;watch&=
quot;<br>
+-<br>
+-# set noop on solid state drives<br>
+-SUBSYSTEM=3D=3D&quot;block&quot;, ACTION=3D=3D&quot;add&quot;, ATTR{queue=
/rotational}=3D=3D&quot;0&quot;, ATTR{queue/scheduler}=3D&quot;noop&quot;<b=
r>
++ACTION!=3D&quot;remove&quot;, SUBSYSTEM=3D=3D&quot;block&quot;, KERNEL=3D=
=3D&quot;loop*|nvme*|sd*|vd*|<wbr>xvd*|pmem*|mmcblk*&quot;, OPTIONS+=3D&quo=
t;watch&quot;<br>
+diff --git a/rules/60-cdrom_id.rules b/rules/60-cdrom_id.rules<br>
+index 5c3b52e..288f8ce 100644<br>
+--- a/rules/60-cdrom_id.rules<br>
++++ b/rules/60-cdrom_id.rules<br>
+@@ -2,12 +2,16 @@<br>
+<br>
+ ACTION=3D=3D&quot;remove&quot;, GOTO=3D&quot;cdrom_end&quot;<br>
+ SUBSYSTEM!=3D&quot;block&quot;, GOTO=3D&quot;cdrom_end&quot;<br>
+-KERNEL!=3D&quot;sr[0-9]*|xvd*&quot;, GOTO=3D&quot;cdrom_end&quot;<br>
++KERNEL!=3D&quot;sr[0-9]*|vdisk*|<wbr>xvd*&quot;, GOTO=3D&quot;cdrom_end&q=
uot;<br>
+ ENV{DEVTYPE}!=3D&quot;disk&quot;, GOTO=3D&quot;cdrom_end&quot;<br>
+<br>
+ # unconditionally tag device as CDROM<br>
+ KERNEL=3D=3D&quot;sr[0-9]*&quot;, ENV{ID_CDROM}=3D&quot;1&quot;<br>
+<br>
++# stop automatically any mount units bound to the device if the media eje=
ct<br>
++# button is pressed.<br>
++ENV{ID_CDROM}=3D=3D&quot;1&quot;, ENV{SYSTEMD_MOUNT_DEVICE_<wbr>BOUND}=3D=
&quot;1&quot;<br>
++<br>
+ # media eject button pressed<br>
+ ENV{DISK_EJECT_REQUEST}=3D=3D&quot;?*&quot;, RUN+=3D&quot;cdrom_id --ejec=
t-media $devnode&quot;, GOTO=3D&quot;cdrom_end&quot;<br>
+<br>
+diff --git a/rules/60-drm.rules b/rules/60-drm.rules<br>
+index 1ed3e44..f7f3435 100644<br>
+--- a/rules/60-drm.rules<br>
++++ b/rules/60-drm.rules<br>
+@@ -1,3 +1,8 @@<br>
+ # do not edit this file, it will be overwritten on update<br>
+<br>
+ ACTION!=3D&quot;remove&quot;, SUBSYSTEM=3D=3D&quot;drm&quot;, SUBSYSTEMS=
=3D=3D&quot;pci|usb|platform&quot;<wbr>, IMPORT{builtin}=3D&quot;path_id&qu=
ot;<br>
++<br>
++# by-path<br>
++ENV{ID_PATH}=3D=3D&quot;?*&quot;, KERNEL=3D=3D&quot;card*&quot;, SYMLINK+=
=3D&quot;dri/by-path/$env{ID_<wbr>PATH}-card&quot;<br>
++ENV{ID_PATH}=3D=3D&quot;?*&quot;, KERNEL=3D=3D&quot;controlD*&quot;, SYML=
INK+=3D&quot;dri/by-path/$env{ID_<wbr>PATH}-control&quot;<br>
++ENV{ID_PATH}=3D=3D&quot;?*&quot;, KERNEL=3D=3D&quot;renderD*&quot;, SYMLI=
NK+=3D&quot;dri/by-path/$env{ID_<wbr>PATH}-render&quot;<br>
+diff --git a/rules/60-evdev.rules b/rules/60-evdev.rules<br>
+index ade7e7f..e5e608a 100644<br>
+--- a/rules/60-evdev.rules<br>
++++ b/rules/60-evdev.rules<br>
+@@ -8,10 +8,14 @@ IMPORT{builtin}=3D&quot;hwdb --subsystem=3Dinput --looku=
p-prefix=3Devdev:&quot;, \<br>
+=C2=A0 =C2=A0RUN{builtin}+=3D&quot;keyboard&quot;, GOTO=3D&quot;evdev_end&=
quot;<br>
+<br>
+ # AT keyboard matching by the machine&#39;s DMI data<br>
+-ENV{ID_INPUT_KEY}=3D=3D&quot;?*&quot;, DRIVERS=3D=3D&quot;atkbd&quot;, \<=
br>
++DRIVERS=3D=3D&quot;atkbd&quot;, \<br>
+=C2=A0 =C2=A0IMPORT{builtin}=3D&quot;hwdb &#39;evdev:atkbd:$attr{[dmi/id]<=
wbr>modalias}&#39;&quot;, \<br>
+=C2=A0 =C2=A0RUN{builtin}+=3D&quot;keyboard&quot;, GOTO=3D&quot;evdev_end&=
quot;<br>
+<br>
++# device matching the input device name + properties + the machine&#39;s =
DMI data<br>
++KERNELS=3D=3D&quot;input*&quot;, IMPORT{builtin}=3D&quot;hwdb &#39;evdev:=
name:$attr{name}:phys:$<wbr>attr{phys}:ev:$attr{<wbr>capabilities/ev}:$attr=
{[dmi/<wbr>id]modalias}&#39;&quot;, \<br>
++=C2=A0 RUN{builtin}+=3D&quot;keyboard&quot;, GOTO=3D&quot;evdev_end&quot;=
<br>
++<br>
+ # device matching the input device name and the machine&#39;s DMI data<br=
>
+ KERNELS=3D=3D&quot;input*&quot;, IMPORT{builtin}=3D&quot;hwdb &#39;evdev:=
name:$attr{name}:$attr{<wbr>[dmi/id]modalias}&#39;&quot;, \<br>
+=C2=A0 =C2=A0RUN{builtin}+=3D&quot;keyboard&quot;, GOTO=3D&quot;evdev_end&=
quot;<br>
+diff --git a/rules/60-persistent-input.<wbr>rules b/rules/60-persistent-in=
put.<wbr>rules<br>
+index 607144b..91efbe7 100644<br>
+--- a/rules/60-persistent-input.<wbr>rules<br>
++++ b/rules/60-persistent-input.<wbr>rules<br>
+@@ -3,6 +3,8 @@<br>
+ ACTION=3D=3D&quot;remove&quot;, GOTO=3D&quot;persistent_input_end&quot;<b=
r>
+ SUBSYSTEM!=3D&quot;input&quot;, GOTO=3D&quot;persistent_input_end&quot;<b=
r>
+ SUBSYSTEMS=3D=3D&quot;bluetooth&quot;, ENV{ID_BUS}=3D&quot;bluetooth&quot=
;, GOTO=3D&quot;persistent_input_end&quot;<br>
++# Bluetooth devices don&#39;t always have the bluetooth subsystem<br>
++ATTRS{id/bustype}=3D=3D&quot;0005&quot;, ENV{ID_BUS}=3D&quot;bluetooth&qu=
ot;, GOTO=3D&quot;persistent_input_end&quot;<br>
+ SUBSYSTEMS=3D=3D&quot;rmi4&quot;, ENV{ID_BUS}=3D&quot;rmi&quot;, GOTO=3D&=
quot;persistent_input_end&quot;<br>
+ SUBSYSTEMS=3D=3D&quot;serio&quot;, ENV{ID_BUS}=3D&quot;i8042&quot;, GOTO=
=3D&quot;persistent_input_end&quot;<br>
+<br>
+diff --git a/rules/60-persistent-storage.<wbr>rules b/rules/60-persistent-=
storage.<wbr>rules<br>
+index bcd573a..63f472b 100644<br>
+--- a/rules/60-persistent-storage.<wbr>rules<br>
++++ b/rules/60-persistent-storage.<wbr>rules<br>
+@@ -20,6 +20,7 @@ KERNEL=3D=3D&quot;nvme*[0-9]n*[0-9]&quot;, ATTR{wwid}=3D=
=3D&quot;?*&quot;, SYMLINK+=3D&quot;disk/by-id/nvme-$<wbr>attr{w<br>
+ KERNEL=3D=3D&quot;nvme*[0-9]n*[0-9]p*[<wbr>0-9]&quot;, ENV{DEVTYPE}=3D=3D=
&quot;partition&quot;, ATTRS{wwid}=3D=3D&quot;?*&quot;, SYMLINK+=3D&quot;di=
sk/by-id/nvme-$<wbr>attr{wwid}-part%n&quot;<br>
+<br>
+ KERNEL=3D=3D&quot;nvme*[0-9]n*[0-9]&quot;, ENV{DEVTYPE}=3D=3D&quot;disk&q=
uot;, ATTRS{serial}=3D=3D&quot;?*&quot;, ENV{ID_SERIAL_SHORT}=3D&quot;$attr=
{<wbr>serial}&quot;<br>
++KERNEL=3D=3D&quot;nvme*[0-9]n*[0-9]&quot;, ENV{DEVTYPE}=3D=3D&quot;disk&q=
uot;, ATTRS{wwid}=3D=3D&quot;?*&quot;, ENV{ID_WWN}=3D&quot;$attr{wwid}&quot=
;<br>
+ KERNEL=3D=3D&quot;nvme*[0-9]n*[0-9]&quot;, ENV{DEVTYPE}=3D=3D&quot;disk&q=
uot;, ATTRS{model}=3D=3D&quot;?*&quot;, ENV{ID_SERIAL_SHORT}=3D=3D&quot;?*&=
quot;, ENV{ID_SERIAL}=3D&quot;$attr{model}_$<wbr>env{ID_SERIAL_SHORT}&quot;=
, SYMLINK+=3D&quot;disk/by-id/nvme-$<wbr>env{ID_SERIAL}&quot;<br>
+<br>
+ KERNEL=3D=3D&quot;nvme*[0-9]n*[0-9]p*[<wbr>0-9]&quot;, ENV{DEVTYPE}=3D=3D=
&quot;partition&quot;, ATTRS{serial}=3D=3D&quot;?*&quot;, ENV{ID_SERIAL_SHO=
RT}=3D&quot;$attr{<wbr>serial}&quot;<br>
+@@ -63,9 +64,14 @@ KERNEL=3D=3D&quot;msblk[0-9]p[0-9]|<wbr>mspblk[0-9]p[0-=
9]&quot;, ENV{ID_NAME}=3D=3D&quot;?*&quot;, ENV{ID_SERIAL}<br>
+<br>
+ # by-path<br>
+ ENV{DEVTYPE}=3D=3D&quot;disk&quot;, DEVPATH!=3D&quot;*/virtual/*&quot;, I=
MPORT{builtin}=3D&quot;path_id&quot;<br>
+-ENV{DEVTYPE}=3D=3D&quot;disk&quot;, ENV{ID_PATH}=3D=3D&quot;?*&quot;, SYM=
LINK+=3D&quot;disk/by-path/$env{<wbr>ID_PATH}&quot;<br>
++KERNEL=3D=3D&quot;mmcblk[0-9]boot[0-<wbr>9]&quot;, ENV{DEVTYPE}=3D=3D&quo=
t;disk&quot;, ENV{ID_PATH}=3D=3D&quot;?*&quot;, SYMLINK+=3D&quot;disk/by-pa=
th/$env{<wbr>ID_PATH}-boot%n&quot;<br>
++KERNEL!=3D&quot;mmcblk[0-9]boot[0-<wbr>9]&quot;, ENV{DEVTYPE}=3D=3D&quot;=
disk&quot;, ENV{ID_PATH}=3D=3D&quot;?*&quot;, SYMLINK+=3D&quot;disk/by-path=
/$env{<wbr>ID_PATH}&quot;<br>
+ ENV{DEVTYPE}=3D=3D&quot;partition&quot;, ENV{ID_PATH}=3D=3D&quot;?*&quot;=
, SYMLINK+=3D&quot;disk/by-path/$env{<wbr>ID_PATH}-part%n&quot;<br>
+<br>
++# legacy virtio-pci by-path links (deprecated)<br>
++KERNEL=3D=3D&quot;vd*[!0-9]&quot;, ENV{ID_PATH}=3D=3D&quot;pci-*&quot;, S=
YMLINK+=3D&quot;disk/by-path/virtio-<wbr>$env{ID_PATH}&quot;<br>
++KERNEL=3D=3D&quot;vd*[0-9]&quot;, ENV{ID_PATH}=3D=3D&quot;pci-*&quot;, SY=
MLINK+=3D&quot;disk/by-path/virtio-<wbr>$env{ID_PATH}-part%n&quot;<br>
++<br>
+ # probe filesystem metadata of optical drives which have a media inserted=
<br>
+ KERNEL=3D=3D&quot;sr*&quot;, ENV{DISK_EJECT_REQUEST}!=3D&quot;?*&quot;, E=
NV{ID_CDROM_MEDIA_TRACK_<wbr>COUNT_DATA}=3D=3D&quot;?*&quot;, ENV{ID_CDROM_=
MEDIA_SESSION_<wbr>LAST_OFFSET}=3D=3D&quot;?*&quot;, \<br>
+=C2=A0 =C2=A0IMPORT{builtin}=3D&quot;blkid --offset=3D$env{ID_CDROM_MEDIA_=
<wbr>SESSION_LAST_OFFSET}&quot;<br>
+@@ -88,7 +94,4 @@ ENV{DEVTYPE}=3D=3D&quot;partition&quot;, ENV{ID_WWN_WITH=
_EXTENSION}=3D=3D&quot;?<wbr>*&quot;, SYMLINK+=3D&quot;disk/by-i<br>
+ ENV{ID_PART_ENTRY_UUID}=3D=3D&quot;?*&quot;, SYMLINK+=3D&quot;disk/by-par=
tuuid/$<wbr>env{ID_PART_ENTRY_UUID}&quot;<br>
+ ENV{ID_PART_ENTRY_SCHEME}=3D=3D&quot;<wbr>gpt&quot;, ENV{ID_PART_ENTRY_NA=
ME}=3D=3D&quot;?*&quot;, SYMLINK+=3D&quot;disk/by-partlabel/$<wbr>env{ID_PA=
RT_ENTRY_NAME}&quot;<br>
+<br>
+-# add symlink to GPT root disk<br>
+-ENV{ID_PART_ENTRY_SCHEME}=3D=3D&quot;<wbr>gpt&quot;, ENV{ID_PART_GPT_AUTO=
_ROOT}=3D=3D&quot;<wbr>1&quot;, SYMLINK+=3D&quot;gpt-auto-root&quot;<br>
+-<br>
+ LABEL=3D&quot;persistent_storage_end&quot;<br>
+diff --git a/rules/60-sensor.rules b/rules/60-sensor.rules<br>
+index 82e44f8..7ad2c36 100644<br>
+--- a/rules/60-sensor.rules<br>
++++ b/rules/60-sensor.rules<br>
+@@ -7,4 +7,12 @@ SUBSYSTEM=3D=3D&quot;iio&quot;, KERNEL=3D=3D&quot;iio*&qu=
ot;, SUBSYSTEMS=3D=3D&quot;usb|i2c&quot;, \<br>
+=C2=A0 =C2=A0IMPORT{builtin}=3D&quot;hwdb &#39;sensor:modalias:$attr{<wbr>=
modalias}:$attr{[dmi/id]<wbr>modalias}&#39;&quot;, \<br>
+=C2=A0 =C2=A0GOTO=3D&quot;sensor_end&quot;<br>
+<br>
++SUBSYSTEM=3D=3D&quot;input&quot;, ENV{ID_INPUT_ACCELEROMETER}=3D=3D&quot;=
<wbr>1&quot;, SUBSYSTEMS=3D=3D&quot;acpi&quot;, \<br>
++=C2=A0 IMPORT{builtin}=3D&quot;hwdb &#39;sensor:modalias:acpi:$attr{<wbr>=
hid}:$attr{[dmi/id]modalias}&#39;&quot;<wbr>, \<br>
++=C2=A0 GOTO=3D&quot;sensor_end&quot;<br>
++<br>
++SUBSYSTEM=3D=3D&quot;input&quot;, ENV{ID_INPUT_ACCELEROMETER}=3D=3D&quot;=
<wbr>1&quot;, SUBSYSTEMS=3D=3D&quot;platform&quot;, \<br>
++=C2=A0 IMPORT{builtin}=3D&quot;hwdb &#39;sensor:modalias:platform:$id:<wb=
r>$attr{[dmi/id]modalias}&#39;&quot;, \<br>
++=C2=A0 GOTO=3D&quot;sensor_end&quot;<br>
++<br>
+ LABEL=3D&quot;sensor_end&quot;<br>
+diff --git a/rules/78-sound-card.rules b/rules/78-sound-card.rules<br>
+index 04740e8..f2fc277 100644<br>
+--- a/rules/78-sound-card.rules<br>
++++ b/rules/78-sound-card.rules<br>
+@@ -48,6 +48,13 @@ SUBSYSTEMS=3D=3D&quot;firewire&quot;, ATTRS{guid}=3D=3D=
&quot;?*&quot;, \<br>
+ SUBSYSTEMS=3D=3D&quot;firewire&quot;, GOTO=3D&quot;skip_pci&quot;<br>
+<br>
+ SUBSYSTEMS=3D=3D&quot;pci&quot;, ENV{ID_BUS}=3D&quot;pci&quot;, ENV{ID_VE=
NDOR_ID}=3D&quot;$attr{<wbr>vendor}&quot;, ENV{ID_MODEL_ID}=3D&quot;$attr{<=
wbr>device}&quot;<br>
++SUBSYSTEMS=3D=3D&quot;pci&quot;, GOTO=3D&quot;skip_pci&quot;<br>
++<br>
++# If we reach here, the device nor any of its parents are USB/PCI/firewir=
e bus devices.<br>
++# If we now find a parent that is a platform device, assume that we&#39;r=
e working with<br>
++# an internal sound card.<br>
++SUBSYSTEMS=3D=3D&quot;platform&quot;, ENV{SOUND_FORM_FACTOR}=3D&quot;<wbr=
>internal&quot;, GOTO=3D&quot;sound_end&quot;<br>
++<br>
+ LABEL=3D&quot;skip_pci&quot;<br>
+<br>
+ # Define ID_ID if ID_BUS and ID_SERIAL are set. This will work for both<b=
r>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-core/udev/<wbr>eudev/0003-rules-watch-<wbr>metada=
ta-changes-in-ide-<wbr>devices.patch b/meta/recipes-core/udev/<wbr>eudev/00=
03-rules-watch-<wbr>metadata-changes-in-ide-<wbr>devices.patch<br>
new file mode 100644<br>
index 0000000..17d698a<br>
--- /dev/null<br>
+++ b/meta/recipes-core/udev/<wbr>eudev/0003-rules-watch-<wbr>metadata-chan=
ges-in-ide-<wbr>devices.patch<br>
@@ -0,0 +1,43 @@<br>
+From 8207d645582e96c56950674e104653<wbr>d0cd552d60 Mon Sep 17 00:00:00 200=
1<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Fri, 17 Nov 2017 09:46:00 +0800<br>
+Subject: [PATCH] rules: watch metadata changes in ide devices<br>
+<br>
+Formatting IDE storage does not trigger &quot;change&quot; uevents. As a r=
esult<br>
+clients using udev API don&#39;t get any updates afterwards and get outdat=
ed<br>
+information about the device.<br>
+...<br>
+root@qemux86-64:~# mkfs.ext4 -F /dev/hda1<br>
+Creating filesystem with 262144 4k blocks and 65536 inodes<br>
+Filesystem UUID: 98791eb2-2bf3-47ad-b4d8-<wbr>4cf7e914eee2<br>
+<br>
+root@qemux86-64:~# ls /dev/disk/by-uuid/98791eb2-<wbr>2bf3-47ad-b4d8-4cf7e=
914eee2<br>
+ls: cannot access &#39;/dev/disk/by-uuid/98791eb2-<wbr>2bf3-47ad-b4d8-4cf7=
e914eee2&#39;: No such file or directory<br>
+...<br>
+Include hd* in a match for watch option assignment.<br>
+<br>
+Upstream-Status: Denied<br>
+<br>
+qemu by default emulates IDE and the linux-yocto kernel(s) use<br>
+CONFIG_IDE instead of the more modern libsata, so disks appear as<br>
+/dev/hd*. A similar patch rejected by upstream because CONFIG_IDE<br>
+is deprecated.<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ rules/60-block.rules | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/rules/60-block.rules b/rules/60-block.rules<br>
+index 343fc06..b5237da 100644<br>
+--- a/rules/60-block.rules<br>
++++ b/rules/60-block.rules<br>
+@@ -8,4 +8,4 @@ ACTION=3D=3D&quot;add&quot;, SUBSYSTEM=3D=3D&quot;module&q=
uot;, KERNEL=3D=3D&quot;block&quot;, ATTR{parameters/events_dfl_<br>
+ ACTION=3D=3D&quot;change&quot;, SUBSYSTEM=3D=3D&quot;scsi&quot;, ENV{DEVT=
YPE}=3D=3D&quot;scsi_device&quot;, TEST=3D=3D&quot;block&quot;, ATTR{block/=
*/uevent}=3D&quot;change&quot;<br>
+<br>
+ # watch metadata changes, caused by tools closing the device node which w=
as opened for writing<br>
+-ACTION!=3D&quot;remove&quot;, SUBSYSTEM=3D=3D&quot;block&quot;, KERNEL=3D=
=3D&quot;loop*|nvme*|sd*|vd*|<wbr>xvd*|pmem*|mmcblk*&quot;, OPTIONS+=3D&quo=
t;watch&quot;<br>
++ACTION!=3D&quot;remove&quot;, SUBSYSTEM=3D=3D&quot;block&quot;, KERNEL=3D=
=3D&quot;loop*|nvme*|sd*|vd*|<wbr>xvd*|pmem*|mmcblk*|hd*&quot;, OPTIONS+=3D=
&quot;watch&quot;<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-core/udev/<a href=3D"http://eudev_3.2.2.bb" rel=
=3D"noreferrer" target=3D"_blank">eudev<wbr>_3.2.2.bb</a> b/meta/recipes-co=
re/udev/<a href=3D"http://eudev_3.2.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">eudev<wbr>_3.2.2.bb</a><br>
index 70e3568..5cee061 100644<br>
--- a/meta/recipes-core/udev/<a href=3D"http://eudev_3.2.2.bb" rel=3D"noref=
errer" target=3D"_blank">eudev<wbr>_3.2.2.bb</a><br>
+++ b/meta/recipes-core/udev/<a href=3D"http://eudev_3.2.2.bb" rel=3D"noref=
errer" target=3D"_blank">eudev<wbr>_3.2.2.bb</a><br>
@@ -11,6 +11,9 @@ PROVIDES =3D &quot;udev&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://dev.gentoo.org/~blueness/${BPN}/$=
{BP}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://dev.gentoo.org/~<w=
br>blueness/${BPN}/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0014-Revert-rules-<wbr>rem=
ove-firmware-loading-rules.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Revert-udev-remove-<wbr>us=
erspace-firmware-loading-<wbr>suppor.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-rules-whitelist-<wbr>=
hd-devices.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-rules-update.patch \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-rules-watch-<wbr>meta=
data-changes-in-ide-<wbr>devices.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://devfs-udev.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://init \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://links.conf \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
</font></span></blockquote></div><br></div>

--001a113ed3a6afaf8d05609c1ecc--
