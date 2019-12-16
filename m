Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB3F7F874
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 06:20:11 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id g4so2505263pjs.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 22:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=gs2x43ZN/3/pEokSOjJF6Zfk7bS45aCH4Zn2m2lps0I=;
	b=AC8/J3udKOgu1EWcoa4VjkjNVsKrGvGlxJI8Ega1ZFUlhyerpmu8h7EDMV92abOxAQ
	w59v+9F8mTCVQiBJ1dG8YaQ+czTpotPv1CZH0Mb16yl7mEhonUyDeIIsrLasNowrecSJ
	zqHuN/212ZRgQkD3P9Fcmxi+2rj+YTItUcGbPY6a+ljP8CSDQAlsViivU5UABxOs9Pb6
	oVsdUQfjMrsEb795Cs8VaM7/6WaEul9kxGVCTVr8V04/kSHkBjDK/obcGJyrf4IXCXJO
	QicOBVf1dGsIMBIztEr+4ir5k2D/pl9rjjE9/8z8kYZ4QTfeGIwMP4FfDa8Ev/ChslxY
	WkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gs2x43ZN/3/pEokSOjJF6Zfk7bS45aCH4Zn2m2lps0I=;
	b=alASwcJ+giXg11LHEsvGPG0U+7HyegOtFwNFtjaGBRFJQL1sSw0RGDJHkq/LG3XA/I
	UTPWqeakxqwAZqUyBnSZiZMy/jvRrGT7XnOQmgKDpDg+kF7Di3FqYfgMGad5m9MtlPTQ
	tDjzLi6zwVQ5AFnNeQLmXKz2dq54G7QGLMo+gEUAk7UDwS+a4A3Rdt5NaY5eijVZAhDo
	ZXAYqigEagUk/ORwkP/xUfODiwDDjt5atEsLTcWKzRCKruwnAh4V8RTqel+RA8651Bn+
	P6vb255LZdFm//4qjNGEcSrZG3SFNkQV1k8XxfFhMRH7/HndtxM2A8VAO6lgCowD4Bzm
	iBFQ==
X-Gm-Message-State: APjAAAVhFMLHHeXzF+6Cwj50yd8fAS5boBTYdOzBiGNJTGwI1XvRI59q
	3qj/u0UgaR5/NQ463pO+08zdFeT5jL0=
X-Google-Smtp-Source: APXvYqwb9GMgXa5Xj/C5RQl3cpLcvNUfJEhnEu86OTdhYYou/wrYfmawY4s52Mx3j2athqrNnRqZNg==
X-Received: by 2002:a17:902:fe98:: with SMTP id
	x24mr2068123plm.155.1576477212115; 
	Sun, 15 Dec 2019 22:20:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	h64sm17976858pje.2.2019.12.15.22.20.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 15 Dec 2019 22:20:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Dec 2019 22:20:10 -0800
Message-Id: <1576477210-3269-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH] linux-yocto/4.14: update to 4.14.154
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
X-List-Received-Date: Mon, 16 Dec 2019 06:20:11 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 0ed2900..de6f5c9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "72075349c6af55a7a6d024f0aa241711653fcb97"
-SRCREV_meta ?= "1bd749b7ce4240e83024b10fa4a4a6b9de5a5e5f"
+SRCREV_machine ?= "3aa9671ae072f45665e72591be5636522c8a6215"
+SRCREV_meta ?= "a889c43359ca8bee705601817c50edf3c209bc09"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.143"
+LINUX_VERSION ?= "4.14.154"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index cb46307..52c02ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.143"
+LINUX_VERSION ?= "4.14.154"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3d884bc92763f474cc0728d1feb0becad8ed37d5"
-SRCREV_meta ?= "1bd749b7ce4240e83024b10fa4a4a6b9de5a5e5f"
+SRCREV_machine ?= "38c3a6549d60a3b4a5ab0cb6a440929ba8502f7f"
+SRCREV_meta ?= "a889c43359ca8bee705601817c50edf3c209bc09"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 4a92d27..0048735 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bd85f4880bb890bf9c45ee6c2fd95f077d2bf67e"
-SRCREV_machine_qemuarm64 ?= "445a4787bd489eb6b3d5c172b9842dbe5a34d734"
-SRCREV_machine_qemumips ?= "3d07ac9aa6ca729674dfb763563202f18f9eedde"
-SRCREV_machine_qemuppc ?= "81ba8dbab3b1bfc371e539956be905809db0e41a"
-SRCREV_machine_qemux86 ?= "bc9d4b045fa0254d14ef3a667a200f02cb9af755"
-SRCREV_machine_qemux86-64 ?= "bc9d4b045fa0254d14ef3a667a200f02cb9af755"
-SRCREV_machine_qemumips64 ?= "3c4acadcbe2ee11043f7d0fce43a5181511d0935"
-SRCREV_machine ?= "bc9d4b045fa0254d14ef3a667a200f02cb9af755"
-SRCREV_meta ?= "1bd749b7ce4240e83024b10fa4a4a6b9de5a5e5f"
+SRCREV_machine_qemuarm ?= "e4e2990af921c2d1544d18efa5f7183f95289cd0"
+SRCREV_machine_qemuarm64 ?= "51c9e69ebef5d2d15dfbcdf098269d86e0e38317"
+SRCREV_machine_qemumips ?= "e70c76a3fe9cc785619d9e4c8e28cb4d4d76ecaf"
+SRCREV_machine_qemuppc ?= "6b6eab44d3a04294c233e0b47d6b7c6cbb6e9ffb"
+SRCREV_machine_qemux86 ?= "57278e88a6b0f7c6230f7429cab7e74229f2b7ce"
+SRCREV_machine_qemux86-64 ?= "57278e88a6b0f7c6230f7429cab7e74229f2b7ce"
+SRCREV_machine_qemumips64 ?= "4e099e87d223bfc1526543a5e4c5383cb2edda70"
+SRCREV_machine ?= "57278e88a6b0f7c6230f7429cab7e74229f2b7ce"
+SRCREV_meta ?= "a889c43359ca8bee705601817c50edf3c209bc09"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.143"
+LINUX_VERSION ?= "4.14.154"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.7.4


