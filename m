Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UK3fo-0006g6-Oe
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 10:26:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Mar 2013 02:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,904,1355126400"; d="scan'208";a="307928988"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2013 02:09:36 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2013 11:09:35 +0200
Message-Id: <1364202575-6751-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH][for-danny] adt-installer: remove patches and .pc directories from the shipped tarball
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Mar 2013 09:26:51 -0000
X-List-Received-Date: Mon, 25 Mar 2013 09:26:51 -0000

The patches and .pc directories should not be shipped since the patches
were already applied. So, remove these 2 directories.

[YOCTO #3983]

(From OE-Core rev: c18a4bded48ed1f8fd39e1741beb2a3452ae43e3)

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../installer/adt-installer_1.0.bb                 |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 0cc3b33..88650ae 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -63,6 +63,7 @@ fakeroot do_populate_adt () {
 	sed -i -e 's#ADTREPO_URL#${ADTREPO}#' ${ADT_DIR}/opkg/conf/*.conf
 	cp -r trunk ${ADT_DIR}/opkg/build/
 	mv ${ADT_DIR}/opkg/build/trunk ${ADT_DIR}/opkg/build/opkg-svn
+	rm -rf ${ADT_DIR}/opkg/build/opkg-svn/patches ${ADT_DIR}/opkg/build/opkg-svn/.pc
 	cp -r scripts ${ADT_DIR}/
 	cp adt_installer ${ADT_DIR}
 	cp adt_installer.conf ${ADT_DIR}
-- 
1.7.9.5



