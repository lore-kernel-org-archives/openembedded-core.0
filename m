Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id A18437F250
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:46 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id q12so302050pff.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bA3sn8u+DsrUCwztYDtP7MsObcgpyU9f9RMIpctO6m8=;
	b=W+8nO8rFwufwgY4JyvonuSUy0Kbmn4023DDx1Y9iDr1A5DxNNBh5zHKXcszUS+wrJO
	uEbHzSZt6mloVsDZpbRIctclqYKRIV9k7iVV6+Gq7cTv9MycigRwgryQYgQs1AIUOp2/
	z8nUpl0zusjg89DDLRDkPDhnw0QE5gcrJIA61jglIQN3JRQKpv0sk0dsro6insettSRJ
	h/ArHm/71wH5nvFG9dkvLFMSrkPRdvvX2FpjulnPg2BySc1n2Re2AE4j6iawoIFjmbP+
	V03nPz0Eq4RsR+3PjFN61E3vDw0h51oNhoNmr1D5hHmNa0SFYFQrKl13Aq2/VhDrkQyE
	l4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bA3sn8u+DsrUCwztYDtP7MsObcgpyU9f9RMIpctO6m8=;
	b=iKYM4GKepSnRb8KwvKtIjiHFrJkwJr9z+nypZghCPbZJiO+s4peLm0O8VHhaU4Oaqy
	MGnjbZRgsZFvNZVGa+GDbCIa4FLbQj16f15aZ9BlT3zRAMpFdnvPkQCefZOYCwUYDQ6Y
	faJoW83DllF/F4+3I2F6/NKSgx1xVg4yzD8YsuMC13zEHI6TQD0hSy9WnRFiP6zzr7Wk
	H7ESZdxtKeRCDQ+hStm3bbs/+BI7fzYbD4EO5XtsJjdFsh/2p9d1knWC/sAR3P9fWMwO
	E6vkqnn+0z1nhU9qu65N2U/buv46JmE71SHkEifyZaEDSun6IM40WPX0NlfGsP48isaA
	GAnQ==
X-Gm-Message-State: APjAAAWzAaUpM8xLspgZmPDdB54RWtexQFVz8oaDx5zSbNDMmIP8b4xb
	ZN2AChOc5FDGJW0vqfjLZ7HkGFZ4W+Y=
X-Google-Smtp-Source: APXvYqwBgoSoR97rc2UIMiEsM9fWbQRi7sZIDsmlyI0f9oqDtOcyw3y7tC6yVVr2vGbcFppXYrjzSQ==
X-Received: by 2002:a17:90a:e64a:: with SMTP id
	ep10mr490222pjb.59.1569294827746; 
	Mon, 23 Sep 2019 20:13:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:13:20 -0700
Message-Id: <83522ac0fecb1697abaa5108513f5906f80d748a.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 24/24] linux-yocto/4.14: update to v4.14.143
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:47 -0000

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


