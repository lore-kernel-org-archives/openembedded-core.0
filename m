Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EAEB16B0E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 13:12:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2013 06:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="400415442"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.58])
	by orsmga001.jf.intel.com with ESMTP; 29 Oct 2013 06:12:45 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2013 15:14:05 +0200
Message-Id: <1383052445-3099-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] shared-mime-info: upgrade to 1.2
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
X-List-Received-Date: Tue, 29 Oct 2013 13:12:45 -0000

Adapted parallelmake.patch to the new Makefile.am.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../shared-mime-info/shared-mime-info/parallelmake.patch             | 4 ++--
 .../{shared-mime-info_1.1.bb => shared-mime-info_1.2.bb}             | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_1.1.bb => shared-mime-info_1.2.bb} (41%)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
index 82ab1d2..84c4d03 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
@@ -18,12 +18,12 @@ Index: shared-mime-info-1.0/Makefile.am
 @@ -1,5 +1,3 @@
 -SUBDIRS=. po
 -
- INCLUDES = $(ALL_CFLAGS)
+ AM_CPPFLAGS = $(ALL_CFLAGS)
  
  packagesdir = $(datadir)/mime/packages
 @@ -72,8 +70,7 @@ uninstall-hook:
  
- all: check create-pot
+ all: $(defaultmakedeps)
  
 -create-pot:
 -	$(AM_V_GEN) $(MAKE) -C po shared-mime-info.pot
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.1.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.2.bb
similarity index 41%
rename from meta/recipes-support/shared-mime-info/shared-mime-info_1.1.bb
rename to meta/recipes-support/shared-mime-info/shared-mime-info_1.2.bb
index 301cf27..11fd6de 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.1.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.2.bb
@@ -1,8 +1,7 @@
 require shared-mime-info.inc
-PR = "r0"
 
-SRC_URI[md5sum] = "12ba00bf1cb2e69bfba73127e708e833"
-SRC_URI[sha256sum] = "184d094b157a9ec2607ad26a1a1837e6e07f3fcbeb38d8b6d412906156f9e06c"
+SRC_URI[md5sum] = "8f90f3f2b8478fa47e70678d34013f99"
+SRC_URI[sha256sum] = "a5516ae241b95a948a6749b1cbf65dc20c3bb563a73cc7bedb7065933788bb78"
 
 SRC_URI =+ "file://parallelmake.patch \
 	    file://install-data-hook.patch"
-- 
1.8.3.2


