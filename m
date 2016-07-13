Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A752F6E65F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 01:19:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6D1JjS6024255
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Jul 2016 18:19:45 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 12 Jul 2016 18:19:44 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 12 Jul 2016 21:19:34 -0400
Message-ID: <5df5ea503d13e2b18c9fafdf6828e0c51c5c7bc6.1468372600.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1468372600.git.bruce.ashfield@windriver.com>
References: <cover.1468372600.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] linux-yocto: powerclamp and gpio configuration changes
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
X-List-Received-Date: Wed, 13 Jul 2016 01:19:44 -0000
Content-Type: text/plain

Integrating the following commits to tweak the default configuration
for powerclamp and gpio:

   features/thermal: make INTEL_POWERCLAMP driver built as module
   gpio: disable Intel PMIC gpio

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 7f2e31d57884..0cba9871f9ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "dc71da8bddd86d34896d97291e0d84c29fe4806d"
-SRCREV_meta ?= "672a86bd4bac288b4cc222112d3826837181583b"
+SRCREV_meta ?= "cab4fec4b7ab0efae0f44c1ec1836c035a9b78fe"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 6bf0c119dc55..ba3612ca41cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3bdc347cc2087a0217e3acddccda5bb775cd570b"
-SRCREV_meta ?= "e775f4ed1e1358ce0647751e69cc54aa9d5d5d06"
+SRCREV_meta ?= "4800a400d5ace1d4332ee18b01ac1c680e454457"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 1ea77a4f8aa9..8852f08c5e00 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
-SRCREV_meta ?= "672a86bd4bac288b4cc222112d3826837181583b"
+SRCREV_meta ?= "cab4fec4b7ab0efae0f44c1ec1836c035a9b78fe"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 82297d2ae587..1592ef6cff96 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
-SRCREV_meta ?= "e775f4ed1e1358ce0647751e69cc54aa9d5d5d06"
+SRCREV_meta ?= "4800a400d5ace1d4332ee18b01ac1c680e454457"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 5004fb5d897d..50e10489e943 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
 SRCREV_machine_qemux86-64 ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
 SRCREV_machine_qemumips64 ?= "7d7a10a3c4465eca0e0879b3596da9b013ed3bb8"
 SRCREV_machine ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
-SRCREV_meta ?= "672a86bd4bac288b4cc222112d3826837181583b"
+SRCREV_meta ?= "cab4fec4b7ab0efae0f44c1ec1836c035a9b78fe"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 56fcf344e900..23fdc2f8cbe2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
 SRCREV_machine_qemux86-64 ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
 SRCREV_machine_qemumips64 ?= "f9bf508ee3fdccebe3554b968b43675cafe0a5a1"
 SRCREV_machine ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
-SRCREV_meta ?= "e775f4ed1e1358ce0647751e69cc54aa9d5d5d06"
+SRCREV_meta ?= "4800a400d5ace1d4332ee18b01ac1c680e454457"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


