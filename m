Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2B44E6F000
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 11:01:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2014 03:01:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,844,1384329600"; d="scan'208";a="455436519"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 14 Feb 2014 03:01:12 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2014 13:01:07 +0200
Message-Id: <db1e6488ef483ab76f7eca961b214bd8f8758b2e.1392375539.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392375539.git.laurentiu.palcu@intel.com>
References: <cover.1392375539.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392375539.git.laurentiu.palcu@intel.com>
References: <cover.1392375539.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/3] package_*.bbclass: remove references to the old bash indexing routines
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
X-List-Received-Date: Fri, 14 Feb 2014 11:01:38 -0000

Package indexing is done in python and package-index.bb uses the new
routines.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/package_deb.bbclass |    1 -
 meta/classes/package_ipk.bbclass |    1 -
 meta/classes/package_rpm.bbclass |    1 -
 3 files changed, 3 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index a0a31bd..b9d7978 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -309,6 +309,5 @@ do_package_write_deb[umask] = "022"
 addtask package_write_deb before do_package_write after do_packagedata do_package
 
 
-PACKAGEINDEXES += "[ ! -e ${DEPLOY_DIR_DEB} ] || package_update_index_deb;"
 PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 516ec4b..7cf2c8a 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -255,6 +255,5 @@ do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[umask] = "022"
 addtask package_write_ipk before do_package_write after do_packagedata do_package
 
-PACKAGEINDEXES += "[ ! -e ${DEPLOY_DIR_IPK} ] || package_update_index_ipk;"
 PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 82ea187..f267b8a 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -734,6 +734,5 @@ do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[umask] = "022"
 addtask package_write_rpm before do_package_write after do_packagedata do_package
 
-PACKAGEINDEXES += "[ ! -e ${DEPLOY_DIR_RPM} ] || package_update_index_rpm;"
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "createrepo-native:do_populate_sysroot"
-- 
1.7.9.5


