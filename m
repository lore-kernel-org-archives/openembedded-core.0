Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C8BC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 20:52:00 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.2344.1651179114543313087
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 13:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WxRrcwyC;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id j6so11824065ejc.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 13:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/66n+4TdbkDe+3gCfiYP4kRu4NaNE0WZ0Pt7Cb3DOdk=;
        b=WxRrcwyCK19ZLBS1UCp89+U8eQgBLvk1s76lTiAvmBQtspmVDGMATy+IiTHBw1Xhdc
         /LNSqcEnuA4g9VyNU2NozJgCLMnroACH85m/V/EWxO3AVz/K1mncpqe8SzIHRZY3EHE0
         8ZELMSgqd06YEwvjNmq9dfOSXVlcNiH7ojwT8xiL8ahTeyuc5AADpGnx3czZsLaNgA8H
         XWfiQyz/lP+CZOT8axcYDJdoJKSlge+0sQXmXf7lEiDuhbnRVX4huq5/eggFMEozUj3Q
         C9bjdy9aVKY2rnqojrrN4OnN4D7+byQB3S6HTewCFd9t+5Q9ZFuyRSQ43XUzzaL9jwWt
         t/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/66n+4TdbkDe+3gCfiYP4kRu4NaNE0WZ0Pt7Cb3DOdk=;
        b=eWJ56N2Ps9ns8df3J7xMbpOLok0NWowot6S8mVVJKoE+9u180teCFeIiWC5W7Ol5lu
         u6JeU44OQGysb9pfMwVjYVrnMYFJPtCVgIfIdwmJ/If5+BtEx2G9eclq7QjIiSpxOofr
         kH3pBrY7/m0d7Rr/BBwhb4CS7AmXFXwEIJFOPLw4cIPUFA/h2FPA4Uez5A4boP5YC2c0
         Xtbs6FcbmcpB9I2aHysSsozJ/ROeMBvutlFd4QbZbqdAf2Rnsg4LZAKYqELMfEnybvbD
         Q265BEqBqQNNn2yiZUBhxf40lztHChR13EGmFYKOnUVR6SUCGThjPJRIc6Kc1v/ZOk84
         GBeg==
X-Gm-Message-State: AOAM530yac4wRrcIhBz9WAR1FK67rPsAyP5fMF6VWQMYew9GG16zy/rN
	gCzWg/XrplfjjpN73vg0TwcS9XeYGtc=
X-Google-Smtp-Source: 
 ABdhPJxEgpGnoc7kk9jmUDAPmckcQWwDeChOgRidLTGn7bBOTH+VuBWz92GCbePpY1Y+WKUOBJFqKw==
X-Received: by 2002:a17:906:c10d:b0:6ef:9503:3372 with SMTP id
 do13-20020a170906c10d00b006ef95033372mr33468761ejc.408.1651179112391;
        Thu, 28 Apr 2022 13:51:52 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 y13-20020aa7cccd000000b0042617ba639asm2080176edt.36.2022.04.28.13.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 13:51:51 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH] eudev: Remove unused files
Date: Thu, 28 Apr 2022 21:51:26 +0100
Message-Id: <20220428205125.2510-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 20:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164977

These files appear to have been first commented out from do_install in
14cba802f2dd ("udev: Add 141") and then removed completely in
54daad852fc3 ("udev: remove commented code from init script (no code
changes)").

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev/devfs-udev.rules | 108 ---------------
 meta/recipes-core/udev/eudev/links.conf       |  21 ---
 .../recipes-core/udev/eudev/permissions.rules | 131 ------------------
 meta/recipes-core/udev/eudev/run.rules        |  14 --
 meta/recipes-core/udev/eudev/udev.rules       | 116 ----------------
 meta/recipes-core/udev/eudev_3.2.10.bb        |   5 -
 6 files changed, 395 deletions(-)
 delete mode 100644 meta/recipes-core/udev/eudev/devfs-udev.rules
 delete mode 100644 meta/recipes-core/udev/eudev/links.conf
 delete mode 100644 meta/recipes-core/udev/eudev/permissions.rules
 delete mode 100644 meta/recipes-core/udev/eudev/run.rules
 delete mode 100644 meta/recipes-core/udev/eudev/udev.rules

diff --git a/meta/recipes-core/udev/eudev/devfs-udev.rules b/meta/recipes-core/udev/eudev/devfs-udev.rules
deleted file mode 100644
index 0ba1ad4e7f0e..000000000000
--- a/meta/recipes-core/udev/eudev/devfs-udev.rules
+++ /dev/null
@@ -1,108 +0,0 @@
-# The use of these rules is not recommended or supported.
-# In a world where devices can come and go at any time, the devfs scheme
-# of simple device enumeration does not help _anything_. Just forget about
-# it. Use custom rules to name your device or look at the persistent device
-# naming scheme, which is implemented for disks and add your subsystem.
-
-# ide block devices
-BUS="ide", KERNEL="hd*", PROGRAM="/etc/udev/ide-devfs.sh %k %b %n", NAME="%k", SYMLINK="%c{1} %c{2}"
-
-# md block devices
-KERNEL="md[0-9]*", NAME="md/%n"
-
-# floppy devices
-KERNEL="fd[0-9]*", NAME="floppy/%n"
-
-# tty devices
-KERNEL="tty[0-9]*",    NAME="vc/%n", SYMLINK="%k"
-KERNEL="ttyS[0-9]*",   NAME="tts/%n", SYMLINK="%k"
-KERNEL="ttyUSB[0-9]*", NAME="tts/USB%n"
-
-# vc devices
-KERNEL="vcs",        NAME="vcc/0"
-KERNEL="vcs[0-9]*",  NAME="vcc/%n"
-KERNEL="vcsa",       NAME="vcc/a0"
-KERNEL="vcsa[0-9]*", NAME="vcc/a%n"
-
-# v4l devices
-KERNEL="video[0-9]*", NAME="v4l/video%n"
-KERNEL="radio[0-9]*", NAME="v4l/radio%n"
-KERNEL="vbi[0-9]*",   NAME="v4l/vbi%n"
-KERNEL="vtx[0-9]*",   NAME="v4l/vtx%n"
-
-# dm devices (ignore them)
-KERNEL="dm-[0-9]*", NAME=""
-
-# i2c devices
-KERNEL="i2c-[0-9]*", NAME="i2c/%n", SYMLINK="%k"
-
-# loop devices
-KERNEL="loop[0-9]*", NAME="loop/%n", SYMLINK="%k"
-
-# ramdisks
-KERNEL="ram[0-9]*", NAME="rd/%n", SYMLINK="%k"
-
-# framebuffer devices
-KERNEL="fb[0-9]*", NAME="fb/%n", SYMLINK="%k"
-
-# misc
-KERNEL="rtc",     NAME="misc/%k", SYMLINK="%k"
-KERNEL="psaux",   NAME="misc/%k", SYMLINK="%k"
-KERNEL="agpgart", NAME="misc/%k", SYMLINK="%k"
-KERNEL="rtc",     NAME="misc/%k", SYMLINK="%k"
-KERNEL="psaux",   NAME="misc/%k", SYMLINK="%k"
-KERNEL="uinput",  NAME="misc/%k", SYMLINK="%k"
-
-# alsa devices
-KERNEL="controlC[0-9]*", NAME="snd/%k"
-KERNEL="hw[CD0-9]*",     NAME="snd/%k"
-KERNEL="pcm[CD0-9cp]*",  NAME="snd/%k"
-KERNEL="midi[CD0-9]*",   NAME="snd/%k"
-KERNEL="timer",          NAME="snd/%k"
-KERNEL="seq",            NAME="snd/%k"
-
-# oss devices
-KERNEL="audio*",     NAME="sound/%k", SYMLINK="%k"
-KERNEL="dmmidi",     NAME="sound/%k", SYMLINK="%k"
-KERNEL="dsp*",       NAME="sound/%k", SYMLINK="%k"
-KERNEL="midi*",      NAME="sound/%k", SYMLINK="%k"
-KERNEL="mixer*",     NAME="sound/%k", SYMLINK="%k"
-KERNEL="sequencer*", NAME="sound/%k", SYMLINK="%k"
-
-# input devices
-KERNEL="mice",   NAME="input/%k"
-KERNEL="mouse*", NAME="input/%k"
-KERNEL="event*", NAME="input/%k"
-KERNEL="js*",    NAME="input/%k"
-KERNEL="ts*",	 NAME="input/%k"
-
-# USB devices
-KERNEL="hiddev*",	NAME="usb/%k"
-KERNEL="auer*",		NAME="usb/%k"
-KERNEL="legousbtower*",	NAME="usb/%k"
-KERNEL="dabusb*",	NAME="usb/%k"
-BUS="usb", KERNEL="lp[0-9]*",	NAME="usb/%k"
-
-# netlink devices
-KERNEL="route",		NAME="netlink/%k"
-KERNEL="skip",		NAME="netlink/%k"
-KERNEL="usersock",	NAME="netlink/%k"
-KERNEL="fwmonitor",	NAME="netlink/%k"
-KERNEL="tcpdiag",	NAME="netlink/%k"
-KERNEL="nflog",		NAME="netlink/%k"
-KERNEL="xfrm",		NAME="netlink/%k"
-KERNEL="arpd",		NAME="netlink/%k"
-KERNEL="route6",	NAME="netlink/%k"
-KERNEL="ip6_fw",	NAME="netlink/%k"
-KERNEL="dnrtmsg",	NAME="netlink/%k"
-KERNEL="tap*",		NAME="netlink/%k"
-
-# CAPI devices
-KERNEL="capi",		NAME="capi20", SYMLINK="isdn/capi20"
-KERNEL="capi*",		NAME="capi/%n"
-
-# Network devices
-KERNEL="tun",		NAME="net/%k"
-
-# raw devices
-KERNEL="raw[0-9]*",     NAME="raw/%k" 
diff --git a/meta/recipes-core/udev/eudev/links.conf b/meta/recipes-core/udev/eudev/links.conf
deleted file mode 100644
index 8fff922db6c0..000000000000
--- a/meta/recipes-core/udev/eudev/links.conf
+++ /dev/null
@@ -1,21 +0,0 @@
-# This file does not exist. Please do not ask the debian maintainer about it.
-# You may use it to do strange and wonderful things, at your risk.
-
-L fd		/proc/self/fd
-L stdin		/proc/self/fd/0
-L stdout	/proc/self/fd/1
-L stderr	/proc/self/fd/2
-L core		/proc/kcore
-L sndstat	/proc/asound/oss/sndstat
-L MAKEDEV	/sbin/MAKEDEV
-
-D pts
-D shm
-
-# Hic sunt leones.
-M ppp		c 108 0
-D loop
-M loop/0	b 7 0
-D net
-M net/tun	c 10 200
-
diff --git a/meta/recipes-core/udev/eudev/permissions.rules b/meta/recipes-core/udev/eudev/permissions.rules
deleted file mode 100644
index bfdff4f8ce05..000000000000
--- a/meta/recipes-core/udev/eudev/permissions.rules
+++ /dev/null
@@ -1,131 +0,0 @@
-ACTION!="add", GOTO="permissions_end"
-
-# workarounds needed to synchronize with sysfs
-# only needed for kernels < v2.6.18-rc1
-ENV{PHYSDEVPATH}!="?*", ENV{PHYSDEVBUS}=="?*",	WAIT_FOR_SYSFS="bus"
-SUBSYSTEM=="scsi", KERNEL=="[0-9]*:[0-9]*",	WAIT_FOR_SYSFS="ioerr_cnt"
-# only needed for kernels < 2.6.16
-SUBSYSTEM=="net",				WAIT_FOR_SYSFS="address"
-# only needed for kernels < 2.6.17
-SUBSYSTEM=="net", ENV{DRIVER}=="?*",		WAIT_FOR_SYSFS="device/driver"
-
-# devices needed to load the drivers providing them
-KERNEL=="tun",					OPTIONS+="ignore:remove"
-KERNEL=="ppp",					OPTIONS+="ignore:remove"
-KERNEL=="loop[0-9]*",				OPTIONS+="ignore:remove"
-
-# default permissions for block devices
-SUBSYSTEM=="block",				GROUP="disk"
-# the aacraid driver is broken and reports that disks removable (see #404927)
-SUBSYSTEM=="block", ATTRS{removable}=="1", \
-	DRIVERS!="aacraid",			GROUP="floppy"
-# all block devices on these buses are "removable"
-SUBSYSTEM=="block", SUBSYSTEMS=="usb|ieee1394|mmc|pcmcia", GROUP="floppy"
-
-# IDE devices
-KERNEL=="hd[a-z]|pcd[0-9]*", 			DRIVERS=="ide-cdrom|pcd", \
-	IMPORT{program}="cdrom_id --export $tempnode"
-ENV{ID_CDROM}=="?*",				GROUP="cdrom"
-KERNEL=="ht[0-9]*", 				GROUP="tape"
-KERNEL=="nht[0-9]*", 				GROUP="tape"
-
-# SCSI devices
-KERNEL=="sr[0-9]*", IMPORT{program}="cdrom_id --export $tempnode"
-SUBSYSTEMS=="scsi", ATTRS{type}=="1",				GROUP="tape"
-SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="HP",	GROUP="scanner"
-SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="Epson",	GROUP="scanner"
-SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="EPSON",	GROUP="scanner"
-SUBSYSTEMS=="scsi", ATTRS{type}=="4",				GROUP="cdrom"
-SUBSYSTEMS=="scsi", ATTRS{type}=="5",				GROUP="cdrom"
-SUBSYSTEMS=="scsi", ATTRS{type}=="6",				GROUP="scanner"
-SUBSYSTEMS=="scsi", ATTRS{type}=="8",				GROUP="tape"
-
-# USB devices
-KERNEL=="legousbtower*",	MODE="0666"
-KERNEL=="lp[0-9]*", SUBSYSTEMS=="usb",		GROUP="lp"
-
-# usbfs-like devices
-SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", \
-				MODE="0664"
-
-# iRiver music players
-SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device",	GROUP="plugdev", \
-	ATTRS{idVendor}=="4102", ATTRS{idProduct}=="10[01][135789]"
-
-# serial devices
-SUBSYSTEM=="tty",				GROUP="dialout"
-SUBSYSTEM=="capi",				GROUP="dialout"
-SUBSYSTEM=="slamr",				GROUP="dialout"
-SUBSYSTEM=="zaptel",				GROUP="dialout"
-
-# vc devices (all members of the tty subsystem)
-KERNEL=="ptmx",			MODE="0666",	GROUP="root"
-KERNEL=="console",		MODE="0600",	GROUP="root"
-KERNEL=="tty",			MODE="0666",	GROUP="root"
-KERNEL=="tty[0-9]*",				GROUP="root"
-KERNEL=="pty*",			MODE="0666",	GROUP="tty"
-
-# video devices
-SUBSYSTEM=="video4linux",			GROUP="video"
-SUBSYSTEM=="drm",				GROUP="video"
-SUBSYSTEM=="dvb",				GROUP="video"
-SUBSYSTEM=="em8300",				GROUP="video"
-SUBSYSTEM=="graphics",				GROUP="video"
-SUBSYSTEM=="nvidia",				GROUP="video"
-
-# misc devices
-KERNEL=="random",		MODE="0666"
-KERNEL=="urandom",		MODE="0666"
-KERNEL=="mem",			MODE="0640",	GROUP="kmem"
-KERNEL=="kmem",			MODE="0640",	GROUP="kmem"
-KERNEL=="port",			MODE="0640",	GROUP="kmem"
-KERNEL=="full",			MODE="0666"
-KERNEL=="null",			MODE="0666"
-KERNEL=="zero",			MODE="0666"
-KERNEL=="inotify",		MODE="0666"
-KERNEL=="sgi_fetchop",		MODE="0666"
-KERNEL=="sonypi",		MODE="0666"
-KERNEL=="agpgart",				GROUP="video"
-KERNEL=="nvram",				GROUP="nvram"
-KERNEL=="rtc|rtc[0-9]*",			GROUP="audio"
-KERNEL=="tpm*",			MODE="0600",	OWNER="tss", GROUP="tss"
-KERNEL=="fuse",					GROUP="fuse"
-KERNEL=="kqemu",		MODE="0666"
-KERNEL=="kvm",					GROUP="kvm"
-KERNEL=="tun",			MODE="0666",
-
-KERNEL=="cdemu[0-9]*",				GROUP="cdrom"
-KERNEL=="pktcdvd[0-9]*",			GROUP="cdrom"
-KERNEL=="pktcdvd",		MODE="0644"
-
-KERNEL=="uverbs*",				GROUP="rdma"
-KERNEL=="ucm*",					GROUP="rdma"
-KERNEL=="rdma_ucm",				GROUP="rdma"
-
-# printers and parallel devices
-SUBSYSTEM=="printer",				GROUP="lp"
-SUBSYSTEM=="ppdev",				GROUP="lp"
-KERNEL=="irlpt*",				GROUP="lp"
-KERNEL=="pt[0-9]*",				GROUP="tape"
-KERNEL=="pht[0-9]*",				GROUP="tape"
-
-# sound devices
-SUBSYSTEM=="sound",				GROUP="audio"
-
-# ieee1394 devices       
-KERNEL=="raw1394",				GROUP="disk"
-KERNEL=="dv1394*",				GROUP="video"
-KERNEL=="video1394*",				GROUP="video"
-
-# input devices
-KERNEL=="event[0-9]*", ATTRS{name}=="*dvb*|*DVB*|* IR *" \
-				MODE="0664",	GROUP="video"
-KERNEL=="js[0-9]*",		MODE="0664"
-KERNEL=="lirc[0-9]*",				GROUP="video"
-
-# AOE character devices
-SUBSYSTEM=="aoe",		MODE="0220",	GROUP="disk"
-SUBSYSTEM=="aoe", KERNEL=="err", MODE="0440"
-
-LABEL="permissions_end"
-
diff --git a/meta/recipes-core/udev/eudev/run.rules b/meta/recipes-core/udev/eudev/run.rules
deleted file mode 100644
index 75d71375bb02..000000000000
--- a/meta/recipes-core/udev/eudev/run.rules
+++ /dev/null
@@ -1,14 +0,0 @@
-# debugging monitor
-RUN+="socket:/org/kernel/udev/monitor"
-
-# run a command on remove events
-ACTION=="remove", ENV{REMOVE_CMD}!="", RUN+="$env{REMOVE_CMD}"
-
-# ignore the events generated by virtual consoles
-KERNEL=="ptmx",		OPTIONS+="last_rule"
-KERNEL=="console",	OPTIONS+="last_rule"
-KERNEL=="tty"	,	OPTIONS+="last_rule"
-KERNEL=="tty[0-9]*",	OPTIONS+="last_rule"
-KERNEL=="pty*",		OPTIONS+="last_rule"
-SUBSYSTEM=="vc",	OPTIONS+="last_rule"
-
diff --git a/meta/recipes-core/udev/eudev/udev.rules b/meta/recipes-core/udev/eudev/udev.rules
deleted file mode 100644
index a19d4a0bf65d..000000000000
--- a/meta/recipes-core/udev/eudev/udev.rules
+++ /dev/null
@@ -1,116 +0,0 @@
-# There are a number of modifiers that are allowed to be used in some
-# of the different fields. They provide the following subsitutions:
-#
-# %n the "kernel number" of the device.
-#    For example, 'sda3' has a "kernel number" of '3'
-# %e the smallest number for that name which does not matches an existing node
-# %k the kernel name for the device
-# %M the kernel major number for the device
-# %m the kernel minor number for the device
-# %b the bus id for the device
-# %c the string returned by the PROGRAM
-# %s{filename} the content of a sysfs attribute
-# %% the '%' char itself
-#
-
-# workaround for devices which do not report media changes
-SUBSYSTEMS=="ide", KERNEL=="hd[a-z]", ATTR{removable}=="1", \
-	ENV{ID_MODEL}=="IOMEGA_ZIP*",	NAME="%k", OPTIONS+="all_partitions"
-SUBSYSTEMS=="ide", KERNEL=="hd[a-z]", ATTRS{media}=="floppy", \
-	OPTIONS+="all_partitions"
-
-# SCSI devices
-SUBSYSTEMS=="scsi", KERNEL=="sr[0-9]*",	NAME="scd%n", SYMLINK+="sr%n"
-
-# USB devices
-SUBSYSTEMS=="usb", KERNEL=="auer[0-9]*",	NAME="usb/%k"
-SUBSYSTEMS=="usb", KERNEL=="cpad[0-9]*",	NAME="usb/%k"
-SUBSYSTEMS=="usb", KERNEL=="dabusb*",		NAME="usb/%k"
-SUBSYSTEMS=="usb", KERNEL=="hiddev*",		NAME="usb/%k"
-SUBSYSTEMS=="usb", KERNEL=="legousbtower*",	NAME="usb/%k"
-SUBSYSTEMS=="usb", KERNEL=="lp[0-9]*",		NAME="usb/%k"
-SUBSYSTEMS=="usb", KERNEL=="ttyUSB*", \
-	ATTRS{product}=="Palm Handheld*|Handspring Visor|palmOne Handheld", \
-					SYMLINK+="pilot"
-
-# usbfs-like devices
-SUBSYSTEM=="usb_device",	PROGRAM="/bin/sh -c 'K=%k; K=$${K#usbdev}; printf bus/usb/%%03i/%%03i $${K%%%%.*} $${K#*.}'", ACTION=="add", \
-				NAME="%c"
-SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device",	NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}"
-
-# serial devices
-KERNEL=="capi",			NAME="capi20", SYMLINK+="isdn/capi20"
-KERNEL=="capi[0-9]*",		NAME="capi/%n"
-
-# video devices
-KERNEL=="dvb*",			PROGRAM="/bin/sh -c 'K=%k; K=$${K#dvb}; printf dvb/adapter%%i/%%s $${K%%%%.*} $${K#*.}", ACTION=="add", \
-				NAME="%c"
-KERNEL=="card[0-9]*",		NAME="dri/%k"
-
-# misc devices
-KERNEL=="hw_random",		NAME="hwrng"
-KERNEL=="tun",			NAME="net/%k"
-KERNEL=="evtchn",		NAME="xen/%k"
-
-KERNEL=="cdemu[0-9]*",		NAME="cdemu/%n"
-KERNEL=="pktcdvd[0-9]*",	NAME="pktcdvd/%n"
-KERNEL=="pktcdvd",		NAME="pktcdvd/control"
-
-KERNEL=="cpu[0-9]*",		NAME="cpu/%n/cpuid"
-KERNEL=="msr[0-9]*",		NAME="cpu/%n/msr"
-KERNEL=="microcode",		NAME="cpu/microcode"
-
-KERNEL=="umad*",		NAME="infiniband/%k"
-KERNEL=="issm*",		NAME="infiniband/%k"
-KERNEL=="uverbs*",		NAME="infiniband/%k"
-KERNEL=="ucm*",			NAME="infiniband/%k"
-KERNEL=="rdma_ucm",		NAME="infiniband/%k"
-
-# ALSA devices
-KERNEL=="controlC[0-9]*",	NAME="snd/%k"
-KERNEL=="hwC[D0-9]*",		NAME="snd/%k"
-KERNEL=="pcmC[D0-9cp]*",	NAME="snd/%k"
-KERNEL=="midiC[D0-9]*",		NAME="snd/%k"
-KERNEL=="timer",		NAME="snd/%k"
-KERNEL=="seq",			NAME="snd/%k"
-
-# ieee1394 devices       
-KERNEL=="dv1394*",		NAME="dv1394/%n"
-KERNEL=="video1394*",		NAME="video1394/%n"
-
-# input devices
-KERNEL=="mice",			NAME="input/%k"
-KERNEL=="mouse[0-9]*",		NAME="input/%k"
-KERNEL=="event[0-9]*",		NAME="input/%k"
-KERNEL=="js[0-9]*",		NAME="input/%k"
-KERNEL=="ts[0-9]*",		NAME="input/%k"
-KERNEL=="uinput",		NAME="input/%k"
-
-# Zaptel
-KERNEL=="zapctl",		NAME="zap/ctl"
-KERNEL=="zaptimer",		NAME="zap/timer"
-KERNEL=="zapchannel",		NAME="zap/channel"
-KERNEL=="zappseudo",		NAME="zap/pseudo"
-KERNEL=="zap[0-9]*",		NAME="zap/%n"
-
-# AOE character devices
-SUBSYSTEM=="aoe", KERNEL=="discover",	NAME="etherd/%k"
-SUBSYSTEM=="aoe", KERNEL=="err",	NAME="etherd/%k"
-SUBSYSTEM=="aoe", KERNEL=="interfaces",	NAME="etherd/%k"
-SUBSYSTEM=="aoe", KERNEL=="revalidate",	NAME="etherd/%k"
-
-# device mapper creates its own device nodes, so ignore these
-KERNEL=="dm-[0-9]*",		OPTIONS+="ignore_device"
-KERNEL=="device-mapper",	NAME="mapper/control"
-
-KERNEL=="rfcomm[0-9]*", NAME="%k", GROUP="users", MODE="0660"
-
-# Firmware Helper
-ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
-
-# Samsung UARTS
-KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
-
-# MXC UARTs
-KERNEL=="ttymxc[0-4]",   NAME="ttymxc%n"
-
diff --git a/meta/recipes-core/udev/eudev_3.2.10.bb b/meta/recipes-core/udev/eudev_3.2.10.bb
index ccc66ae13131..b0536124920a 100644
--- a/meta/recipes-core/udev/eudev_3.2.10.bb
+++ b/meta/recipes-core/udev/eudev_3.2.10.bb
@@ -12,13 +12,8 @@ PROVIDES = "udev"
 SRC_URI = "https://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://Revert-udev-remove-userspace-firmware-loading-suppor.patch \
-           file://devfs-udev.rules \
            file://init \
-           file://links.conf \
            file://local.rules \
-           file://permissions.rules \
-           file://run.rules \
-           file://udev.rules \
 "
 
 SRC_URI[md5sum] = "60b135a189523f333cea5f71a3345c8d"
-- 
2.35.1


