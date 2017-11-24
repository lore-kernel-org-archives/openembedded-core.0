Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 536E271957
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 13:17:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Nov 2017 05:17:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,447,1505804400"; d="scan'208";a="11448280"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 24 Nov 2017 05:17:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Nov 2017 15:17:44 +0200
Message-Id: <20171124131744.40997-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH] meta-selftest: fix upstream version checks for devtool test recipes
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
X-List-Received-Date: Fri, 24 Nov 2017 13:17:21 -0000

So that they're reported correctly when checking 'universe' for
latest upstream versions.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb             | 1 +
 meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb       | 2 ++
 .../recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded        | 2 ++
 meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb         | 2 ++
 .../recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded          | 2 ++
 5 files changed, 9 insertions(+)

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
index e45ee9f60a0..fc3799590cc 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
@@ -6,6 +6,7 @@ DEPENDS = "libxres libxext virtual/libx11 ncurses"
 SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-0.4.tar.gz \
            file://readme.patch.gz \
            "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/xrestop-0.4"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
index 4049be292b4..333ecac7ed8 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
 SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz \
            file://0001-Add-a-note-line-to-the-quick-reference.patch"
+UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
+RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
 SRC_URI[md5sum] = "9365d86bd884222b4bf1039b5a9ed1bd"
 SRC_URI[sha256sum] = "681bcca9784bf3cb2207e68236d1f68e2aa7b80f999b5750dc77dcd756e81fbc"
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
index 42c070506df..9d94f671dbf 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
 SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz \
            file://0001-Add-a-note-line-to-the-quick-reference.patch"
+UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
+RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
 SRC_URI[md5sum] = "062bca5ff33df1dd09472e7fc3bbe332"
 SRC_URI[sha256sum] = "9dd45391806b0ed215abee4c5ac1597d018c386fe9c1f5afd2f6bc3b07fd82c3"
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 450636ef182..07b83276fb9 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -12,6 +12,8 @@ PV = "0.1+git${SRCPV}"
 PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/dbus-wait"
+UPSTREAM_CHECK_COMMITS = "1"
+RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
index 0d2e19e5a53..32ec4b14fa6 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
@@ -11,6 +11,8 @@ SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/dbus-wait"
+UPSTREAM_CHECK_COMMITS = "1"
+RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
 S = "${WORKDIR}/git"
 
-- 
2.15.0


