Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4261177A3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 08:55:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Apr 2017 01:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,229,1488873600"; d="scan'208";a="1122052354"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 21 Apr 2017 01:55:50 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 11:55:32 +0300
Message-Id: <20170421085532.5242-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] rpm: properly relocate additional native tools
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
X-List-Received-Date: Fri, 21 Apr 2017 08:55:52 -0000

These tools are not currently used for anything, but we should
still provide working versions of them.

[YOCTO #11400]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm_git.bb | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 96f71d5bb57..f31932ef55a 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -90,6 +90,36 @@ do_install_append_class-native() {
                 RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
                 MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
+
+        create_wrapper ${D}/${bindir}/rpm2archive \
+                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
+                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
+
+        create_wrapper ${D}/${bindir}/rpm2cpio \
+                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
+                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
+
+        create_wrapper ${D}/${bindir}/rpmdb \
+                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
+                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
+
+        create_wrapper ${D}/${bindir}/rpmgraph \
+                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
+                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
+
+        create_wrapper ${D}/${bindir}/rpmspec \
+                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
+                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
 
 
-- 
2.11.0


