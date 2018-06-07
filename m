Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9184776086
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 02:09:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w57299s8022147
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Jun 2018 19:09:09 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 6 Jun 2018 19:09:08 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 6 Jun 2018 22:07:29 -0400
Message-ID: <79e803174d077412fcd8029a3fa877292b5d3698.1528336755.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1528336755.git.bruce.ashfield@windriver.com>
References: <cover.1528336755.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] linux-yocto: add kernel sample configuration fragment
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
X-List-Received-Date: Thu, 07 Jun 2018 02:09:08 -0000
Content-Type: text/plain

Add a fragment to the various kernels to support QA testing
of samples.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 39236d90d98a..4d4f19c15cae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "cc0ac94a962306ff5867e1d3c2988d2004f50c8c"
-SRCREV_meta ?= "b577f9a0bd658b9468080514f68b18fe37daff9c"
+SRCREV_meta ?= "53336e1b7d969f21d8214ec9ceeb48fba4f99372"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index c440d2fa9f2e..aa8571fecf33 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
-SRCREV_meta ?= "9bbc5bd75e5322bd80769802c5062b2f3f0d6c7d"
+SRCREV_meta ?= "45c256a5ca6f9478bce212fec19e2bc273472631"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 3171bb9d78a3..7250986271a7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -13,7 +13,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "f0905017bae82f733812b3e1a31abbf6d51f67c7"
-SRCREV_meta ?= "b577f9a0bd658b9468080514f68b18fe37daff9c"
+SRCREV_meta ?= "53336e1b7d969f21d8214ec9ceeb48fba4f99372"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index e6da0935d0ae..a809b7c0ab73 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
-SRCREV_meta ?= "9bbc5bd75e5322bd80769802c5062b2f3f0d6c7d"
+SRCREV_meta ?= "45c256a5ca6f9478bce212fec19e2bc273472631"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 1993ac788ac8..d9069154c38c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "ccd823982533ea9d36df09766f3a7d645b95ca7d"
 SRCREV_machine_qemux86-64 ?= "ccd823982533ea9d36df09766f3a7d645b95ca7d"
 SRCREV_machine_qemumips64 ?= "c50abb0247af8362692d6776139dfff03d754ff9"
 SRCREV_machine ?= "ccd823982533ea9d36df09766f3a7d645b95ca7d"
-SRCREV_meta ?= "b577f9a0bd658b9468080514f68b18fe37daff9c"
+SRCREV_meta ?= "53336e1b7d969f21d8214ec9ceeb48fba4f99372"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 0d82318bcf4c..77b9110cfb88 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
 SRCREV_machine_qemux86-64 ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
 SRCREV_machine_qemumips64 ?= "9435d73112c64ae058372322d8c7a41ae9e8c000"
 SRCREV_machine ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
-SRCREV_meta ?= "9bbc5bd75e5322bd80769802c5062b2f3f0d6c7d"
+SRCREV_meta ?= "45c256a5ca6f9478bce212fec19e2bc273472631"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-- 
2.5.0


