Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB7EF78560
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 15:03:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2RF3OiP024755
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Mar 2018 08:03:24 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Mar 2018 08:03:22 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Mar 2018 11:03:14 -0400
Message-ID: <7b2011186fc65b96d3479fc15eb87de4f87f2043.1522162765.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1522162765.git.bruce.ashfield@windriver.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] mpc8315e-rdb: fix broken ethernet
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
X-List-Received-Date: Tue, 27 Mar 2018 15:03:25 -0000
Content-Type: text/plain

Integrating the following commits to fix the ethernet on the mpc8315e-rdb:

  12f3957167b0 net: phy: realtek: Use the dummy stubs for MMD register access for rtl8211b
  c986bc511c18 net: phy: Add general dummy stubs for MMD register access

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 18 +++++++++---------
 6 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 8a6371625ee0..dc0832723472 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4832801a14130645d2251a368cba79d937a775ab"
-SRCREV_meta ?= "5f6c3e32365bffb1993c0c62abf2c5bb8916a57f"
+SRCREV_machine ?= "26443228033c81f99bf75e5b75eec662f39243b1"
+SRCREV_meta ?= "95cda8806311f4d922919e2eb6581bcb6d08e7f2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index 9f03c98cffad..457d5f0929ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_meta ?= "65e0a9654f69241d0e6b18162289dabec877039e"
+SRCREV_machine ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
+SRCREV_meta ?= "e09bcd01af6a000647f7d6ec9b864c6ff5ffac89"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 494d80aa4886..d3ac63898f7c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.14.24"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "09828ddd8d8c91b2d68afdcd8eb99a48e0253582"
-SRCREV_meta ?= "5f6c3e32365bffb1993c0c62abf2c5bb8916a57f"
+SRCREV_machine ?= "ff658b2ac6a54d40fcf17a9d5d8d854b80067d49"
+SRCREV_meta ?= "95cda8806311f4d922919e2eb6581bcb6d08e7f2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 6ec6371b7420..76f6cab95e92 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -18,8 +18,8 @@ SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
-SRCREV_machine ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_meta ?= "65e0a9654f69241d0e6b18162289dabec877039e"
+SRCREV_machine ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
+SRCREV_meta ?= "e09bcd01af6a000647f7d6ec9b864c6ff5ffac89"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index ba5e35625eba..13e465198c0b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bb61314e5c67a13c7da2217e434dfb20053a0203"
-SRCREV_machine_qemuarm64 ?= "eb7faf5b9bfe94ac2cb8e6a28e18fb39a8b720a7"
-SRCREV_machine_qemumips ?= "4bcebcabb514ba8f9b3f8f487f3595a5c2b5860f"
-SRCREV_machine_qemuppc ?= "3913c9c8dad1a3fef93d3d5721146ebe15dcc4d3"
-SRCREV_machine_qemux86 ?= "edc90f45a716ffe8e16cebaaf3b5db070af0280a"
-SRCREV_machine_qemux86-64 ?= "edc90f45a716ffe8e16cebaaf3b5db070af0280a"
-SRCREV_machine_qemumips64 ?= "6d7fbdbb7e466be645c34eed7bb2b532a9431a85"
-SRCREV_machine ?= "edc90f45a716ffe8e16cebaaf3b5db070af0280a"
-SRCREV_meta ?= "5f6c3e32365bffb1993c0c62abf2c5bb8916a57f"
+SRCREV_machine_qemuarm ?= "91bb6027a9a8aff1dd06f4fc4704b9c87c77a7c8"
+SRCREV_machine_qemuarm64 ?= "1665bf9e7532c6e9bd59d08c6dffa3819c621195"
+SRCREV_machine_qemumips ?= "9e29cfdcd4823d3dec0bb0d803b5e3be2bc73ffa"
+SRCREV_machine_qemuppc ?= "e22e4b39c0d97706f0298d8313e0a51ba22af65a"
+SRCREV_machine_qemux86 ?= "6ba0d6a225af558654be7619655b0c32ca866bc7"
+SRCREV_machine_qemux86-64 ?= "6ba0d6a225af558654be7619655b0c32ca866bc7"
+SRCREV_machine_qemumips64 ?= "d8c7e535a8dcc7b30213c628e4c4c98e56daad6b"
+SRCREV_machine ?= "6ba0d6a225af558654be7619655b0c32ca866bc7"
+SRCREV_meta ?= "95cda8806311f4d922919e2eb6581bcb6d08e7f2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 6bd578b931b2..056fd30e6ab9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.15/standard/base"
 KBRANCH_qemux86-64 ?= "v4.15/standard/base"
 KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c9e3d532f245dcb00a022b7fc468bdefdd9b3ec8"
-SRCREV_machine_qemuarm64 ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_machine_qemumips ?= "88e64d2a3f8f12f3fdc759921ec2067f1e730f97"
-SRCREV_machine_qemuppc ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_machine_qemux86 ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_machine_qemux86-64 ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_machine_qemumips64 ?= "38face5dfd94733484822f392f9469fed18cca7e"
-SRCREV_machine ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_meta ?= "65e0a9654f69241d0e6b18162289dabec877039e"
+SRCREV_machine_qemuarm ?= "8b07f34007acee0fc978cec49e2fcf63026ebd43"
+SRCREV_machine_qemuarm64 ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
+SRCREV_machine_qemumips ?= "d4b3984ac600d413a017e9890efbfc55948d6d0a"
+SRCREV_machine_qemuppc ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
+SRCREV_machine_qemux86 ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
+SRCREV_machine_qemux86-64 ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
+SRCREV_machine_qemumips64 ?= "77ae4b3b45eab133a5daf1e90828e5dfe62062e1"
+SRCREV_machine ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
+SRCREV_meta ?= "e09bcd01af6a000647f7d6ec9b864c6ff5ffac89"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-- 
2.5.0


