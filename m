Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0812C7F26A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 17:24:45 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m29so384826pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 10:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bA3sn8u+DsrUCwztYDtP7MsObcgpyU9f9RMIpctO6m8=;
	b=hGMwIfGzltfM/I3tRZkTSu+Xl5m0y5c2XNnBKvdj02qGfRvneNlcD+T7I/ivvC8F82
	GxRvodVatbuHTtJUwVKzEGkZU4wywtFjK0K/FsDSauAWyIwFYjHKOgs6FnVBU8NAs4+4
	BmWEKMjJGonYy/PFoerv0nttxfd9q78tPfEACADe6giBSBPlsATgexfqZEbKq5BlPpjB
	LcN+hz5psHpuEZdYNi3xGav2skWnRkb7Okfl1oRYP8FAx/YF66mTW3Vmedv2w5olsA/8
	oHyKI+K+ufKEH9eGmPIoVyN3FcYBinElWB9BfcNFqoPCWLPyoK1JBJtGhQv+1sgsd9l4
	wfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bA3sn8u+DsrUCwztYDtP7MsObcgpyU9f9RMIpctO6m8=;
	b=kKMzHbHJ7xpUGHxacGVeflSvNa8OyTV5FRw+YVbW9/rfowBxf3flhvanS1GZNpf7rq
	84zrPgR5zKOA+fRxdML5yQYpR7RUpScKaQ1Eq4nRVlxQmstR55Pj2bZ2moSWWu+2xKwb
	Ch7cy7VXz3l6X89AgaEYc7oTrInGiAonj5cJ6+DOPNaO347xS9vNWEDPq3cutWE7KGi7
	DTP5AEICt3dBNvfJOifKkJ0J1t6ONGMOPGM0xJl1ilP+tYDcwiZFG3eGpcXcKzJh5XQq
	SjtXnGC0hsJSPTS74QCVWOSA3XUMPOdhgKeeAmty6hJLaZMMbI+IlomXknkzk+GaFkVW
	otBg==
X-Gm-Message-State: APjAAAWnj4r0PBFLnATyAXBJRD+aB8bdIZ5vWQ35WHcHPMFodcpwu3sL
	EtKYoztSbHrotRjkrTNrCohJHfCWe1U=
X-Google-Smtp-Source: APXvYqzSq97K1XC5UYMNUqAyLWXtlEh+osd0rbtgDRvNC9axsCopsfFBCPk5LRR/U+4F4+deRuQwkw==
X-Received: by 2002:a17:90a:6008:: with SMTP id y8mr338645pji.62.1568654685826;
	Mon, 16 Sep 2019 10:24:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac6a:3cec:ecd7:6ae1])
	by smtp.gmail.com with ESMTPSA id
	h70sm32972387pgc.36.2019.09.16.10.24.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Sep 2019 10:24:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 10:24:43 -0700
Message-Id: <1568654683-29797-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH] linux-yocto/4.14: update to v4.14.143
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
X-List-Received-Date: Mon, 16 Sep 2019 17:24:46 -0000

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


