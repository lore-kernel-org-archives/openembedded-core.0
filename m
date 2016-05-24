Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C12196067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 15:54:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4OFs5jl018815
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 May 2016 08:54:05 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 24 May 2016 08:54:04 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 24 May 2016 11:54:00 -0400
Message-ID: <9b8c7e9d3b8d8fa06c2bdb2cfb7c8e47af2667a3.1464105119.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1464105119.git.bruce.ashfield@windriver.com>
References: <cover.1464105119.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/4.4: integrate v4.4.11
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
X-List-Received-Date: Tue, 24 May 2016 15:54:05 -0000
Content-Type: text/plain

Updating to the korg stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index edf68c21db7c..f57ead8ef34a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7ef3fe56827bd9c20021e3a52bc36ebd4c6b2ce3"
-SRCREV_meta ?= "fca9cc2483de4e7b981dc01122521c74e06fcc6a"
+SRCREV_machine ?= "bf2fbe7f2cdf44fc69e50fefbfdd58d41a03733a"
+SRCREV_meta ?= "6ec93aaa70f838b551f58b91d0c6ffeff6f6094b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.10"
+LINUX_VERSION ?= "4.4.11"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index e66dd40931c3..da88451b760f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.10"
+LINUX_VERSION ?= "4.4.11"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
-SRCREV_meta ?= "fca9cc2483de4e7b981dc01122521c74e06fcc6a"
+SRCREV_machine ?= "628bf627561c6285d99fb978e11d4c15fc29324b"
+SRCREV_meta ?= "6ec93aaa70f838b551f58b91d0c6ffeff6f6094b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 31e5caaaa92b..4306bf8be98a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1d343b327d97843de4a32fda9015bc87a46dea9b"
-SRCREV_machine_qemuarm64 ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
-SRCREV_machine_qemumips ?= "f89dd8336dcb0b7bf0291aee7ee33531564ea3b5"
-SRCREV_machine_qemuppc ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
-SRCREV_machine_qemux86 ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
-SRCREV_machine_qemux86-64 ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
-SRCREV_machine_qemumips64 ?= "5faa3c8de491435842024b24b6a95fccdbe3f72a"
-SRCREV_machine ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
-SRCREV_meta ?= "fca9cc2483de4e7b981dc01122521c74e06fcc6a"
+SRCREV_machine_qemuarm ?= "97c21d0b5ffa8eb1cb27a6f81b52ec53182ae087"
+SRCREV_machine_qemuarm64 ?= "628bf627561c6285d99fb978e11d4c15fc29324b"
+SRCREV_machine_qemumips ?= "8763860e4da46b3cb1551e09d9ca46eedd2dd91a"
+SRCREV_machine_qemuppc ?= "628bf627561c6285d99fb978e11d4c15fc29324b"
+SRCREV_machine_qemux86 ?= "628bf627561c6285d99fb978e11d4c15fc29324b"
+SRCREV_machine_qemux86-64 ?= "628bf627561c6285d99fb978e11d4c15fc29324b"
+SRCREV_machine_qemumips64 ?= "8974d9741cbcb21bf50ab49a6257e5773415fa5f"
+SRCREV_machine ?= "628bf627561c6285d99fb978e11d4c15fc29324b"
+SRCREV_meta ?= "6ec93aaa70f838b551f58b91d0c6ffeff6f6094b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.10"
+LINUX_VERSION ?= "4.4.11"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


