Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id CE2C47D419
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:33 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d22so7033139pls.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bA3sn8u+DsrUCwztYDtP7MsObcgpyU9f9RMIpctO6m8=;
	b=grj4M2dQv8RM0BeU10td03kqVPbFaSES1ZVnnT1rgGHToOjwlPCpdPrUg0mBgIukv1
	HbIadRimwaSQdyJHZuuWJ0RDGA0JrEyi29Lr5YkgKA8v+aSmeQiSel6+WFlP+J1M40wD
	jQVaqnaKdoz/zZGM6HfLKlYE9gOJ9xpMB8JKOpSO75doTeBt/LgMkKom7L3jZ4Ewfjjf
	k3JVwuLj1bMG37vZVcc5MPEPTre8BOZJq77bI8ruaElb3jBLINzsy60edzS4w17L7nQS
	WB7MOaJQu0Sp4iA6s9scX+gUOvruelJBEm3TVDnRTdIVESxwxJN0EAWGs8E9dc3EXt6Q
	AgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bA3sn8u+DsrUCwztYDtP7MsObcgpyU9f9RMIpctO6m8=;
	b=by2EAd2jU/zU0CqsHddzNsO1ltWdm5PGY7VGnHuPvxLXofr6w/fE8AQX/PMHeqZEQK
	pDxgWGsevVyIYlJbFVeSKWPCbbCtDegYxHLVgLM2B4JIK2HNiNz2wPgBh5wOe2J5R52J
	kFNCr8Z3jk+oZfbH7954dMeUrnm+mXalUoHk9aMCr9zZSpDfoI9Xz5N7DvdqG2tZm0Cq
	5HaM5AiU0xiJCvzrQz3vQ+YdeTCDci2Q33qRs/i+WVCOvzRxnVuCJ6ogWv+alndfxDIC
	HSsqeHBHHS8iv562u1q7WODUE8RHOi+XErIgDCh/gy/QjcRCHcZgSpxtlkwmb/ZDhY1c
	7SdQ==
X-Gm-Message-State: APjAAAWFiTBUAqzQkLb9FeLFtDQy9J1eDr3j5vsVZFF7b7sW8M1Z25hw
	4GTFmYRE3j0Nq30X25qqn8TIdur8aHA=
X-Google-Smtp-Source: APXvYqxN3pEzY/pK+LHrezPqINX7/flAnv7v6fkNueS+Ohv1QXS3w38WIZasrKmExjQRgzcwA0hHVQ==
X-Received: by 2002:a17:902:b497:: with SMTP id
	y23mr30600044plr.82.1570461094610; 
	Mon, 07 Oct 2019 08:11:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:11:03 -0700
Message-Id: <f5be8c8309a932cde507ba24d042880a922df0b6.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 26/26] linux-yocto/4.14: update to v4.14.143
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:34 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating to the latest 4.14 -stable. Lightly build and boot tested
on qemu*

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 4189fc8..0ed2900 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "82ac7b2b8048b537481bf16b8acda1cc9bfe9565"
-SRCREV_meta ?= "6a3254e7b370cbb86c1f73379dcf38885c1c69e0"
+SRCREV_machine ?= "72075349c6af55a7a6d024f0aa241711653fcb97"
+SRCREV_meta ?= "1bd749b7ce4240e83024b10fa4a4a6b9de5a5e5f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.79"
+LINUX_VERSION ?= "4.14.143"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 71f5c47..cb46307 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.79"
+LINUX_VERSION ?= "4.14.143"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6ce17eae5d962b30846a5258956246438d68d60a"
-SRCREV_meta ?= "6a3254e7b370cbb86c1f73379dcf38885c1c69e0"
+SRCREV_machine ?= "3d884bc92763f474cc0728d1feb0becad8ed37d5"
+SRCREV_meta ?= "1bd749b7ce4240e83024b10fa4a4a6b9de5a5e5f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 65b2444..4a92d27 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8752b8421efe8b5a478f17fbffacf4af974ec703"
-SRCREV_machine_qemuarm64 ?= "ac66474ba7f7e93d16ae3ea005f214113bb127c5"
-SRCREV_machine_qemumips ?= "ab031b267e2a79fcd48da5d10d503f4d065f4821"
-SRCREV_machine_qemuppc ?= "f47c3945e8dd230ea37771bcacc836245fc79d22"
-SRCREV_machine_qemux86 ?= "f1d93b219bde37a8a286cd18d6af2dcf0d02c1a8"
-SRCREV_machine_qemux86-64 ?= "f1d93b219bde37a8a286cd18d6af2dcf0d02c1a8"
-SRCREV_machine_qemumips64 ?= "8063a7258fc670a361fed85b858fabb237485f1c"
-SRCREV_machine ?= "f1d93b219bde37a8a286cd18d6af2dcf0d02c1a8"
-SRCREV_meta ?= "6a3254e7b370cbb86c1f73379dcf38885c1c69e0"
+SRCREV_machine_qemuarm ?= "bd85f4880bb890bf9c45ee6c2fd95f077d2bf67e"
+SRCREV_machine_qemuarm64 ?= "445a4787bd489eb6b3d5c172b9842dbe5a34d734"
+SRCREV_machine_qemumips ?= "3d07ac9aa6ca729674dfb763563202f18f9eedde"
+SRCREV_machine_qemuppc ?= "81ba8dbab3b1bfc371e539956be905809db0e41a"
+SRCREV_machine_qemux86 ?= "bc9d4b045fa0254d14ef3a667a200f02cb9af755"
+SRCREV_machine_qemux86-64 ?= "bc9d4b045fa0254d14ef3a667a200f02cb9af755"
+SRCREV_machine_qemumips64 ?= "3c4acadcbe2ee11043f7d0fce43a5181511d0935"
+SRCREV_machine ?= "bc9d4b045fa0254d14ef3a667a200f02cb9af755"
+SRCREV_meta ?= "1bd749b7ce4240e83024b10fa4a4a6b9de5a5e5f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.79"
+LINUX_VERSION ?= "4.14.143"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.7.4


