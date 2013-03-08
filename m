Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UDzPC-0002Na-F7
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 16:41:13 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Mar 2013 07:22:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,809,1355126400"; d="scan'208";a="274152673"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 08 Mar 2013 07:23:46 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2013 17:23:44 +0200
Message-Id: <1362756224-26205-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] adt-installer: remove patches and .pc directories from the shipped tarball
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
X-List-Received-Date: Fri, 08 Mar 2013 15:41:31 -0000

The patches and .pc directories should not be shipped since the patches
were already applied. So, remove these 2 directories.

[YOCTO #3983]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
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



