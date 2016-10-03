Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7D97199D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 05:54:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u935siYd015221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Oct 2016 22:54:44 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 2 Oct 2016 22:54:43 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 3 Oct 2016 01:54:33 -0400
Message-ID: <b9401a3fd1ba6d5e9392b5cbf6a50b7e9811b03a.1475473494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1475473494.git.bruce.ashfield@windriver.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/4.1/4.4: remove innappropriate standard/base patches
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
X-List-Received-Date: Mon, 03 Oct 2016 05:54:43 -0000
Content-Type: text/plain

Before standard/intel/* was created in the 4.1 and 4.4 kernel trees,
some patches were merged to standard/base to add features/support for
intel platforms.

While this isn't entirely bad, there have been some compile issues
reported in some configurations. Since we don't need these commits
on standard/base, we can relocate them to make standard/base upstream
clean.

This commit removes those patches from standard/base, and restores
then to the standard/intel/* branches.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 6 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 77f1f1bcfef4..ed7a916be948 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3389720cf9809d517de7188308132ef1ec066e55"
+SRCREV_machine ?= "71daecbcd3f3e8fa73aa036a5539722004e7759c"
 SRCREV_meta ?= "322fa5b2796bfcff7bfbbde1d76c73636ecf5857"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 5416ca499bc4..4fc3458b5fae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a1da5707fd13f31d25661b910c7377c8714c1123"
-SRCREV_meta ?= "170ed03a9d908e2abc8025cf9a62789ab15b3ece"
+SRCREV_machine ?= "6f27f97ed8466b5d7390e8fbb8696c13835a0b1f"
+SRCREV_meta ?= "d9f20333c42e024d42d633b3da2458f2e0d9c52a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index c57949b2aeb6..78600427b375 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.33"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0c7be943fb59eb9a8d1e57e1fb1aa20aed5fa9cb"
+SRCREV_machine ?= "a38cb202738a2b055ac216b3699cc9377edea45a"
 SRCREV_meta ?= "322fa5b2796bfcff7bfbbde1d76c73636ecf5857"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index e7e48adc4de3..7ca5d86dcd42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4.22"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0ef03dcfb96805e6bcf82989f1c8fed1b488d00a"
-SRCREV_meta ?= "170ed03a9d908e2abc8025cf9a62789ab15b3ece"
+SRCREV_machine ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
+SRCREV_meta ?= "d9f20333c42e024d42d633b3da2458f2e0d9c52a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index b2ebe8b26baa..413234b6d559 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a8169bc7216752813a0a8be7d77ec8fcf0d8850e"
-SRCREV_machine_qemuarm64 ?= "0c7be943fb59eb9a8d1e57e1fb1aa20aed5fa9cb"
-SRCREV_machine_qemumips ?= "d12861e340503a14614b655e77d8dcabadb18f8e"
-SRCREV_machine_qemuppc ?= "0e7c356e7c972e0f6f596d7d5f2621a3f68df8e4"
-SRCREV_machine_qemux86 ?= "0c7be943fb59eb9a8d1e57e1fb1aa20aed5fa9cb"
-SRCREV_machine_qemux86-64 ?= "0c7be943fb59eb9a8d1e57e1fb1aa20aed5fa9cb"
-SRCREV_machine_qemumips64 ?= "c14be1d25b733ff6ff47e8f255e8196cf9b3e8c9"
-SRCREV_machine ?= "0c7be943fb59eb9a8d1e57e1fb1aa20aed5fa9cb"
+SRCREV_machine_qemuarm ?= "89241b98386f752ab073d3ab5518cb69bacbd97e"
+SRCREV_machine_qemuarm64 ?= "a38cb202738a2b055ac216b3699cc9377edea45a"
+SRCREV_machine_qemumips ?= "e00505a0c07a352d1dd57adb8da1768863022979"
+SRCREV_machine_qemuppc ?= "d5ef1ced9d019d20d986e205bddc317961407188"
+SRCREV_machine_qemux86 ?= "a38cb202738a2b055ac216b3699cc9377edea45a"
+SRCREV_machine_qemux86-64 ?= "a38cb202738a2b055ac216b3699cc9377edea45a"
+SRCREV_machine_qemumips64 ?= "ac476ecd7a56288e3e8ed1ef3872554de661e823"
+SRCREV_machine ?= "a38cb202738a2b055ac216b3699cc9377edea45a"
 SRCREV_meta ?= "322fa5b2796bfcff7bfbbde1d76c73636ecf5857"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 5cafa9166a23..f2d07be2dc89 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "22a817dc851fac7ec9369c29b3a2803ec92781fb"
-SRCREV_machine_qemuarm64 ?= "0ef03dcfb96805e6bcf82989f1c8fed1b488d00a"
-SRCREV_machine_qemumips ?= "c1794372ab031297d1c4482d982e143386c247ea"
-SRCREV_machine_qemuppc ?= "0ef03dcfb96805e6bcf82989f1c8fed1b488d00a"
-SRCREV_machine_qemux86 ?= "0ef03dcfb96805e6bcf82989f1c8fed1b488d00a"
-SRCREV_machine_qemux86-64 ?= "0ef03dcfb96805e6bcf82989f1c8fed1b488d00a"
-SRCREV_machine_qemumips64 ?= "ab08db0be1aec0daa5ac134fe1abcd6eba47b275"
-SRCREV_machine ?= "0ef03dcfb96805e6bcf82989f1c8fed1b488d00a"
-SRCREV_meta ?= "170ed03a9d908e2abc8025cf9a62789ab15b3ece"
+SRCREV_machine_qemuarm ?= "de294849e02680399a6dd03fedcc03a69e9a6a04"
+SRCREV_machine_qemuarm64 ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
+SRCREV_machine_qemumips ?= "a41dd187e7d42be65780f25997eb890ead6cc7d9"
+SRCREV_machine_qemuppc ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
+SRCREV_machine_qemux86 ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
+SRCREV_machine_qemux86-64 ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
+SRCREV_machine_qemumips64 ?= "857685d23d1e8d8a8deb4198b139b95a5bb80825"
+SRCREV_machine ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
+SRCREV_meta ?= "d9f20333c42e024d42d633b3da2458f2e0d9c52a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


