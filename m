Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF8771B27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0IDsh6e020840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 18 Jan 2017 05:54:43 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 05:54:42 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jan 2017 08:54:27 -0500
Message-ID: <f24431c2816ab4e3c12571c96863d7deb2a86809.1484747560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1484747560.git.bruce.ashfield@windriver.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/14] linux-yocto/4.8: update to -rt10
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:43 -0000
Content-Type: text/plain

Paul Gortmaker has updated 4.8 to the latest -rt release. This
integrates those changes to standard/preempt-rt/*. As usual the
branches are kept fast forward, and a clean copy of the patches
can be found on standard/preempt-rt/rebase.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 702d41bac15f..c0ff503676ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8fddffd5588e14ad3bb5297dbc5b9c4a1047238c"
-SRCREV_meta ?= "7b320e0a54be4b2d9bbaf4eb6165532e3954ad3e"
+SRCREV_machine ?= "9c4f52cb2bafd9657c51cef2166db2b73a95aaa9"
+SRCREV_meta ?= "3edb4de355873d32da9307a011adea2542bd05a7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 89b601696728..11b0dc9ea4b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "b62f29ac5c15d6333a13811db030d704b35ace8f"
-SRCREV_meta ?= "7b320e0a54be4b2d9bbaf4eb6165532e3954ad3e"
+SRCREV_meta ?= "3edb4de355873d32da9307a011adea2542bd05a7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index a81128a0b950..0ebd071463de 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "9bcb4ea3fa107f1a8790c8c3408eb250e8d1d66e"
 SRCREV_machine_qemux86-64 ?= "9bcb4ea3fa107f1a8790c8c3408eb250e8d1d66e"
 SRCREV_machine_qemumips64 ?= "b90b544d7a5b004b635cf337b29e15294cb17553"
 SRCREV_machine ?= "9bcb4ea3fa107f1a8790c8c3408eb250e8d1d66e"
-SRCREV_meta ?= "7b320e0a54be4b2d9bbaf4eb6165532e3954ad3e"
+SRCREV_meta ?= "3edb4de355873d32da9307a011adea2542bd05a7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-- 
2.5.0


