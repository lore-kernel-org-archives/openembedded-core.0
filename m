Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UPUci-0002fw-3Y
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 11:13:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Apr 2013 01:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,437,1363158000"; d="scan'208";a="283560803"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 09 Apr 2013 01:56:30 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 11:56:28 +0300
Message-Id: <1365497788-10827-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] rpm: fix RDEPENDS
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
X-List-Received-Date: Tue, 09 Apr 2013 09:14:14 -0000

The rpm-postinsts runtime dependency was overwritten.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index c7d21e8..7d2cba4 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -226,8 +226,6 @@ FILES_${PN} =  "${bindir}/rpm \
 		/var/cache/rpm \
 		"
 
-RDEPENDS_${PN} += "${PN}-postinsts"
-
 FILES_${PN}-dbg += "${libdir}/rpm/.debug \
 		${libdir}/rpm/bin/.debug \
 		"
@@ -311,7 +309,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 		${libdir}/rpm/vpkg-provides2.sh \
 		${libdir}/rpm/perfile_rpmdeps.sh \
 		"
-RDEPENDS_${PN} = "base-files"
+RDEPENDS_${PN} = "base-files ${PN}-postinsts"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}-build = "file"
 
-- 
1.7.9.5



