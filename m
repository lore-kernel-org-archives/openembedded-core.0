Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F9BE731D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 16:57:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6RGvCEL010380
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jul 2016 09:57:12 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jul 2016 09:57:11 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Jul 2016 12:57:05 -0400
Message-ID: <009dfcea9c78b09da41ed2502482b1e116772c78.1469638333.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1469638333.git.bruce.ashfield@windriver.com>
References: <cover.1469638333.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/4.1: bump to v4.1.28
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
X-List-Received-Date: Wed, 27 Jul 2016 16:57:15 -0000
Content-Type: text/plain

Updating the 4.1 kernel to the korg -stable release

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index b9b6773a4e8b..3be43fe238ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "04614e9e02701c6a4254d7cc040d72d24bad3d8c"
-SRCREV_meta ?= "cab4fec4b7ab0efae0f44c1ec1836c035a9b78fe"
+SRCREV_machine ?= "cb1593933f5defcebb668a1ca655a24394b9c27e"
+SRCREV_meta ?= "98729aff41208eed09dc232254d7a1305237fdbe"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.27"
+LINUX_VERSION ?= "4.1.28"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 9a95c159622b..41a0bb089a61 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.27"
+LINUX_VERSION ?= "4.1.28"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "73bd4dd4a46970e4a599d3d02d60e40ab37b4498"
-SRCREV_meta ?= "cab4fec4b7ab0efae0f44c1ec1836c035a9b78fe"
+SRCREV_machine ?= "846e0a90dd228d07272bf5b246aab405ec6941f8"
+SRCREV_meta ?= "98729aff41208eed09dc232254d7a1305237fdbe"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 1931943b8e5d..248faf892e9c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c29bbcccfcecbf840e60ddf8c16eb5f34d991eb1"
-SRCREV_machine_qemuarm64 ?= "73bd4dd4a46970e4a599d3d02d60e40ab37b4498"
-SRCREV_machine_qemumips ?= "aba568f531b31b2f802d1c08f4821177a0354da7"
-SRCREV_machine_qemuppc ?= "73bd4dd4a46970e4a599d3d02d60e40ab37b4498"
-SRCREV_machine_qemux86 ?= "73bd4dd4a46970e4a599d3d02d60e40ab37b4498"
-SRCREV_machine_qemux86-64 ?= "73bd4dd4a46970e4a599d3d02d60e40ab37b4498"
-SRCREV_machine_qemumips64 ?= "a65235597cef00d9a77def57622ac2dc31bb850e"
-SRCREV_machine ?= "73bd4dd4a46970e4a599d3d02d60e40ab37b4498"
-SRCREV_meta ?= "cab4fec4b7ab0efae0f44c1ec1836c035a9b78fe"
+SRCREV_machine_qemuarm ?= "aa956be29cf5247a0870728b177ae056bc9f62be"
+SRCREV_machine_qemuarm64 ?= "846e0a90dd228d07272bf5b246aab405ec6941f8"
+SRCREV_machine_qemumips ?= "931c8308f3327ea0a882349321989be6db3b22a9"
+SRCREV_machine_qemuppc ?= "846e0a90dd228d07272bf5b246aab405ec6941f8"
+SRCREV_machine_qemux86 ?= "846e0a90dd228d07272bf5b246aab405ec6941f8"
+SRCREV_machine_qemux86-64 ?= "846e0a90dd228d07272bf5b246aab405ec6941f8"
+SRCREV_machine_qemumips64 ?= "33eebd8a461ae8c619ece37a1de02e48893e0b12"
+SRCREV_machine ?= "846e0a90dd228d07272bf5b246aab405ec6941f8"
+SRCREV_meta ?= "98729aff41208eed09dc232254d7a1305237fdbe"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.27"
+LINUX_VERSION ?= "4.1.28"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


