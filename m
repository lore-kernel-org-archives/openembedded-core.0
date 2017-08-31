Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72A95783A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 19:31:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7VJV7ot032071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 31 Aug 2017 12:31:07 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 Aug 2017 12:31:06 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 31 Aug 2017 15:30:58 -0400
Message-ID: <c9224d0a2d7a48fa1c60c7c35041cc4c673ddaaa.1504207711.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1504207711.git.bruce.ashfield@windriver.com>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/4.10: fix aufs build
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
X-List-Received-Date: Thu, 31 Aug 2017 19:31:07 -0000
Content-Type: text/plain

The aufs patches were out of sync with the latest upstream and hence
didn't build against 4.10.

With this update, we are once again building and up to date with the
upstream repo.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index cc6e522b4b8e..d95a4f73019e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
-SRCREV_meta ?= "6ac2680ca4316fe111cddec37def7757843bbe86"
+SRCREV_machine ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
+SRCREV_meta ?= "416a2862c3bac3ecb641bf14e14c1d2c9c23ed96"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index b136bf095034..cb13f4fbdca7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.10.17"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
-SRCREV_meta ?= "6ac2680ca4316fe111cddec37def7757843bbe86"
+SRCREV_machine ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
+SRCREV_meta ?= "416a2862c3bac3ecb641bf14e14c1d2c9c23ed96"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index 4107891f6e8a..10b56cda77e7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4c652d50c67050422da4621cc6421ecb86b31c31"
-SRCREV_machine_qemuarm64 ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
-SRCREV_machine_qemumips ?= "0a632fa7f9615ad1b2488a300846a7e925e6591a"
-SRCREV_machine_qemuppc ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
-SRCREV_machine_qemux86 ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
-SRCREV_machine_qemux86-64 ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
-SRCREV_machine_qemumips64 ?= "75c22c1be83bf7894af78a36b3e3c5af08ce4d7b"
-SRCREV_machine ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
-SRCREV_meta ?= "6ac2680ca4316fe111cddec37def7757843bbe86"
+SRCREV_machine_qemuarm ?= "97253eca8592c9cba7c7665277e1118b048b9639"
+SRCREV_machine_qemuarm64 ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
+SRCREV_machine_qemumips ?= "52e935b59800868731e7620caf49cc257f1b9946"
+SRCREV_machine_qemuppc ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
+SRCREV_machine_qemux86 ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
+SRCREV_machine_qemux86-64 ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
+SRCREV_machine_qemumips64 ?= "7b6d7feb4b0143d6f9146784f6072ffd171dd7ba"
+SRCREV_machine ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
+SRCREV_meta ?= "416a2862c3bac3ecb641bf14e14c1d2c9c23ed96"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
-- 
2.5.0


