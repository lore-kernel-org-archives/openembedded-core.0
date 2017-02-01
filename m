Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A031B60620
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 15:30:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v11FUevZ000026
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Feb 2017 07:30:40 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 1 Feb 2017 07:30:39 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Feb 2017 10:30:28 -0500
Message-ID: <08441c279422235b12b04c7a7194068badacff24.1485962567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1485962567.git.bruce.ashfield@windriver.com>
References: <cover.1485962567.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] kernel-yocto/features: enable TPM
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
X-List-Received-Date: Wed, 01 Feb 2017 15:30:43 -0000
Content-Type: text/plain

Adding a feature fragment that enables a broad range of TPM
drivers. They service as a baseline for production kernels.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index c0ff503676ad..f76b590055ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9c4f52cb2bafd9657c51cef2166db2b73a95aaa9"
-SRCREV_meta ?= "3edb4de355873d32da9307a011adea2542bd05a7"
+SRCREV_meta ?= "ceb1eeb63f96e903a4caee1bad4dda238192fb6a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 1c26ef3ac97b..7b214e40531b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "628a985d1bb4d992b76c727afd373788bd496c90"
-SRCREV_meta ?= "78e8e39c7c73ab9d98864f492b1fd9658124d635"
+SRCREV_meta ?= "2adba5d7c1a6c0425b02b1a650e7a6c320ee3acf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 11b0dc9ea4b0..1f0406b30468 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "b62f29ac5c15d6333a13811db030d704b35ace8f"
-SRCREV_meta ?= "3edb4de355873d32da9307a011adea2542bd05a7"
+SRCREV_meta ?= "ceb1eeb63f96e903a4caee1bad4dda238192fb6a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 12a64887d677..12f19f313ab3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
-SRCREV_meta ?= "78e8e39c7c73ab9d98864f492b1fd9658124d635"
+SRCREV_meta ?= "2adba5d7c1a6c0425b02b1a650e7a6c320ee3acf"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 0ebd071463de..dba7a4aa115e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "9bcb4ea3fa107f1a8790c8c3408eb250e8d1d66e"
 SRCREV_machine_qemux86-64 ?= "9bcb4ea3fa107f1a8790c8c3408eb250e8d1d66e"
 SRCREV_machine_qemumips64 ?= "b90b544d7a5b004b635cf337b29e15294cb17553"
 SRCREV_machine ?= "9bcb4ea3fa107f1a8790c8c3408eb250e8d1d66e"
-SRCREV_meta ?= "3edb4de355873d32da9307a011adea2542bd05a7"
+SRCREV_meta ?= "ceb1eeb63f96e903a4caee1bad4dda238192fb6a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index b42603bad2c6..81a42489f53c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
 SRCREV_machine_qemux86-64 ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
 SRCREV_machine_qemumips64 ?= "303f51499cfe9f770c4a843a2042228897cea1b4"
 SRCREV_machine ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
-SRCREV_meta ?= "78e8e39c7c73ab9d98864f492b1fd9658124d635"
+SRCREV_meta ?= "2adba5d7c1a6c0425b02b1a650e7a6c320ee3acf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


