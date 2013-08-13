Return-Path: <cristiana.voicu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6047C6A9E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 07:38:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Aug 2013 00:38:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,867,1367996400"; d="scan'208";a="380078344"
Received: from unknown (HELO cvoicu-Vostro-460.rb.intel.com) ([10.237.105.72])
	by fmsmga001.fm.intel.com with ESMTP; 13 Aug 2013 00:36:26 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 10:39:26 +0300
Message-Id: <1376379566-13989-1-git-send-email-cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <06a01304db7ca6bc605947b809400868dfe72b67.1375969277.git.cristiana.voicu@intel.com>
References: <06a01304db7ca6bc605947b809400868dfe72b67.1375969277.git.cristiana.voicu@intel.com>
Subject: [PATCH_V3] systemtap: upgrade to 2.3
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
X-List-Received-Date: Tue, 13 Aug 2013 07:38:07 -0000

Disabled javac and jar.

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb  |    6 +++---
 meta/recipes-kernel/systemtap/systemtap_git.inc |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 4f60f6b..bcc826a 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -10,11 +10,11 @@ RDEPENDS_${PN} += "python bash"
 RDEPENDS_${PN}_class-native += "python-native"
 RDEPENDS_${PN}_class-nativesdk += "python-native"
 
-PR = "r1"
-
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
             --without-nss --without-avahi --without-dyninst \
-            --disable-server --disable-grapher "
+            --disable-server --disable-grapher \
+            ac_cv_prog_have_javac=no \
+            ac_cv_prog_have_jar=no "
 
 STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 7be6c2b..0632746 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,8 +1,8 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "addec813fed4c712d6ea752f6e4f23e602b87fad"
-PV = "2.1+git${SRCPV}"
+SRCREV = "e58138572ebddac9498b93c76770eeca7d45e3b1"
+PV = "2.3+git${SRCPV}"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=git \
            file://docproc-build-fix.patch \
-- 
1.7.9.5


