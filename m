Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EF96D76710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 20:18:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9NKIZpZ005660
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Oct 2015 13:18:35 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 23 Oct 2015 13:18:35 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 23 Oct 2015 16:18:28 -0400
Message-ID: <d01b7ae43ec1f88458e3eeae00cefda1ebc21b01.1445631234.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1445631234.git.bruce.ashfield@windriver.com>
References: <cover.1445631234.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto: axxia configuration updates
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
X-List-Received-Date: Fri, 23 Oct 2015 20:18:38 -0000
Content-Type: text/plain

Updating the configuration fragments for the Intel Axxia on the 3.14
and 4.1 kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 4d3d5c88df07..978dc186039d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -5,7 +5,7 @@ require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "8281915527ba8d79e59906c02f28e7aa11424723"
 SRCREV_machine_qemuppc ?= "5e7d372ebc327f28656fc972fab55605eea8aec3"
-SRCREV_meta ?= "3a09b38a9f5015c56d99d17aa7c2f200c566249b"
+SRCREV_meta ?= "060fa80b7996250001ee90c50a4978c8fdb87fc4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 32c9f86f2352..fe3eab5a555a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "8acaa791408f146069473a96e3d98bed8be86244"
-SRCREV_meta ?= "3d8f1378d07dbc052ca8a7c22297339ad7998b5e"
+SRCREV_meta ?= "d8bbf59771fb915fa71debc8591bf6c69d8fa49c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 412c817ff5ab..e13cb80ce51e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
-SRCREV_meta ?= "3a09b38a9f5015c56d99d17aa7c2f200c566249b"
+SRCREV_meta ?= "060fa80b7996250001ee90c50a4978c8fdb87fc4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index f289d37867a2..da12edb106df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
-SRCREV_meta ?= "3d8f1378d07dbc052ca8a7c22297339ad7998b5e"
+SRCREV_meta ?= "d8bbf59771fb915fa71debc8591bf6c69d8fa49c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 0a37cb6cf10d..1bd7d2ab1687 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "af1f7f586bd32d39c057f17606991b887eadb389"
 SRCREV_machine_qemux86-64 ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
 SRCREV_machine_qemumips64 ?= "a63d40b860a6d255005a541894d53729090b40ea"
 SRCREV_machine ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
-SRCREV_meta ?= "3a09b38a9f5015c56d99d17aa7c2f200c566249b"
+SRCREV_meta ?= "060fa80b7996250001ee90c50a4978c8fdb87fc4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};name=machine; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index e98f2dec1eb2..44c34ece8309 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
 SRCREV_machine_qemux86-64 ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
 SRCREV_machine_qemumips64 ?= "8458e792e2c595f48bc5b2924e20e844f2a96522"
 SRCREV_machine ?= "52a4a9f4a2b408ef3a0745372e44cc362832d86d"
-SRCREV_meta ?= "3d8f1378d07dbc052ca8a7c22297339ad7998b5e"
+SRCREV_meta ?= "d8bbf59771fb915fa71debc8591bf6c69d8fa49c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.1.0


