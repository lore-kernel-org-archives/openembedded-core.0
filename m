Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id F2FE57F844
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:18 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id a33so24808632pgm.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZmfRYLvOydSTm6iYo+j94QE3ibrVN22nuFjBYJYEYBs=;
	b=cw0pOZAzwuMvu0odaGmtqM8mnJV7+BY670Oth6/98UfpeOTCgjvv2jVuW+6UEaibp5
	LjvDZYunoV+W9PTBF6/84fN9sQiUK42amRMhf3saOkSnKzWTp/Eu5o+TqYZ06bWV3Bfg
	fa9OMHFgQtMTi6b+qURhm3tkOdeqQ9PZXVRhv5gZUufPXjc8qjS5GEzMXepBveMNBkbg
	iUs+n1kItWbLVEW+t+UUsWr2MB4qsl35qv5jT0PzEhMc8ljiHQGQFwrwlPEiStJj2OXM
	LuSEBmaTrWvJKim/a6bCLWMHPo3SZSpvI964qlfM8u+LqbYAHyI7nG+dNPjjfQNUVMOu
	a1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZmfRYLvOydSTm6iYo+j94QE3ibrVN22nuFjBYJYEYBs=;
	b=hmaGN0FLhx3xLxfNuci7stNnj41O5fGgRUFNoWIoJFSC1VmM3LcuJ6RjmBdqmI70pz
	sNn15MzYlQka5kwGF4UnMm0jqf+g/Y/UC1eyT6oSwWezr9dRhwqGHo4dpbsUDiwstJnB
	YPV+eprK7sOsRRyHd2po0xeL4o4tgYaM6J8/r8JT5IRKHStTKQbtQTqOGmItJQO/VTFL
	e0QpCfeREzB/YZpGcZ42eHjfgzTYSrAI0kXYAcTBEWyYjTu/GV0A0BerXaxkK6PD36ZC
	+x3TPh+1vvVf/5QQSh7WBsJC8+HHM51FOAwHx5PmCBGRUHnf81Xnx6LkjTPn7pWjvZSI
	FoEg==
X-Gm-Message-State: APjAAAWqHJp3gqvSd0Ucw+Ti4xM3XZ8wwGyOpZo+hQDGoQs5Y/14auPk
	JP01gtkUtXQkmPRxMdms/S9igywukbw=
X-Google-Smtp-Source: APXvYqyAHA0SZ5wXq7SOkUgiyqmTNxJIHMLnHPH6/gg/Uc+QdiqbLSSdeydUrq1BY3ElP8xjzogt0A==
X-Received: by 2002:a63:6b07:: with SMTP id g7mr85183708pgc.243.1578155179928; 
	Sat, 04 Jan 2020 08:26:19 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:25:48 -0800
Message-Id: <1cc43cd87f603651e451087d50662cd694030c01.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 07/29] linux-yocto/5.2: update to v5.2.21
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:19 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    e91ef5bcdeda Linux 5.2.21

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 1f51f1505cdeec5cc464bbbc14f5514d7440a426)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 423331e19a..83b44a8c4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "55e3ee387b073d8d609e8899859561340d8b6911"
-SRCREV_meta ?= "bd0762cd138f1624b5a5f8669cfa3ac2b71cb87b"
+SRCREV_machine ?= "ab16819b1520191e73213bc0cd7a7433349efcca"
+SRCREV_meta ?= "57c5933eb4c46ddaeee331717360e68380724126"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.20"
+LINUX_VERSION ?= "5.2.21"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index f7239d0229..7ece6e0dce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.20"
+LINUX_VERSION ?= "5.2.21"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "501d680535903acc00808c36f2cc07f2dc725adc"
-SRCREV_machine ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_meta ?= "bd0762cd138f1624b5a5f8669cfa3ac2b71cb87b"
+SRCREV_machine_qemuarm ?= "1c68baaea976d9e28b5f2b445a90afb4865994c8"
+SRCREV_machine ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_meta ?= "57c5933eb4c46ddaeee331717360e68380724126"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 8f75f67c39..c7f601769f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fcbe51dfa0a763a07e4cd66204d6c0ba054663ce"
-SRCREV_machine_qemuarm64 ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_machine_qemumips ?= "9cad7bb8bcd3686f580a3363847ee9c9e86928b1"
-SRCREV_machine_qemuppc ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_machine_qemuriscv64 ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_machine_qemux86 ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_machine_qemux86-64 ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_machine_qemumips64 ?= "dc2be1a546e937374590ce3858b717489ded2c21"
-SRCREV_machine ?= "dd25a04fc5e2e4549fc9b86157a01e0c72b53b03"
-SRCREV_meta ?= "bd0762cd138f1624b5a5f8669cfa3ac2b71cb87b"
+SRCREV_machine_qemuarm ?= "fcd7089abefcf3025b6a49baa0604fb7215886ce"
+SRCREV_machine_qemuarm64 ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_machine_qemumips ?= "30bbc3b38f5caa851d01b37ab1cdd2dae75e9592"
+SRCREV_machine_qemuppc ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_machine_qemuriscv64 ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_machine_qemux86 ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_machine_qemux86-64 ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_machine_qemumips64 ?= "4dab38a25c5b32491b23cd95eca75a68f02b3339"
+SRCREV_machine ?= "30ecfd434ced3ee254e669b8af061cd1ab8155e7"
+SRCREV_meta ?= "57c5933eb4c46ddaeee331717360e68380724126"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.20"
+LINUX_VERSION ?= "5.2.21"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1


