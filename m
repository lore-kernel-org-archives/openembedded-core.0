Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE01B77E92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 19:31:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7VJV9Vc022230
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Aug 2017 12:31:09 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 Aug 2017 12:31:08 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 31 Aug 2017 15:31:00 -0400
Message-ID: <8fbdadda8026ff2e943eaad5c3063a3a39fc1ee4.1504207711.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1504207711.git.bruce.ashfield@windriver.com>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/4.10/4.9: fix BRCMFMAC_PROTO_MSGBUF warning
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
X-List-Received-Date: Thu, 31 Aug 2017 19:31:09 -0000
Content-Type: text/plain

The 4.10 and 4.9 kernels need a fix applied to 4.12 to deal with
a configuration warning:

  Author: Bruce Ashfield <bruce.ashfield@windriver.com>
  Date:   Fri Aug 18 17:03:27 2017 -0400

    wifi: drop BRCMFMAC_PROTO_MSGBUF, since it is selected

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index d95a4f73019e..17d819153e58 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
-SRCREV_meta ?= "416a2862c3bac3ecb641bf14e14c1d2c9c23ed96"
+SRCREV_meta ?= "ba11a3e8f1bc465c9de3cf00e8e60437db60e886"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 3eb31c951f9e..b939e6da079a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1fb4e1d1e3f727fc20963fc631a259665bd4665b"
-SRCREV_meta ?= "e8095d45e15f02ffc953312bb41a57554b25a439"
+SRCREV_meta ?= "0dd1939b20d55fec20e8c3d13088df3b9ca23ade"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index cb13f4fbdca7..7730da60fa62 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
-SRCREV_meta ?= "416a2862c3bac3ecb641bf14e14c1d2c9c23ed96"
+SRCREV_meta ?= "ba11a3e8f1bc465c9de3cf00e8e60437db60e886"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index fc961bcf3a5f..82ccb982572e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
-SRCREV_meta ?= "e8095d45e15f02ffc953312bb41a57554b25a439"
+SRCREV_meta ?= "0dd1939b20d55fec20e8c3d13088df3b9ca23ade"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index 10b56cda77e7..6e5c726b336e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
 SRCREV_machine_qemux86-64 ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
 SRCREV_machine_qemumips64 ?= "7b6d7feb4b0143d6f9146784f6072ffd171dd7ba"
 SRCREV_machine ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
-SRCREV_meta ?= "416a2862c3bac3ecb641bf14e14c1d2c9c23ed96"
+SRCREV_meta ?= "ba11a3e8f1bc465c9de3cf00e8e60437db60e886"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index f27a45961767..6021b224d0d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
 SRCREV_machine_qemux86-64 ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
 SRCREV_machine_qemumips64 ?= "7c9ce18e05e1d84df17e677b26133671ec0430f5"
 SRCREV_machine ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
-SRCREV_meta ?= "e8095d45e15f02ffc953312bb41a57554b25a439"
+SRCREV_meta ?= "0dd1939b20d55fec20e8c3d13088df3b9ca23ade"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


