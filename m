Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TTpTM-0005ga-TW
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 08:45:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Nov 2012 00:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,691,1344236400"; d="scan'208";a="242812414"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.14.238])
	by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2012 00:32:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Nov 2012 00:32:11 -0700
Message-Id: <1351755131-22192-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] builder: Add password for user
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
X-List-Received-Date: Thu, 01 Nov 2012 07:45:54 -0000

This is needed to allow openssh to work correctly for the Eclipse
plugin to have access to the build appliance to view/modify recipes
and lauch builds

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 5c12c14..d46e960 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -18,7 +18,8 @@ inherit useradd
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --create-home \
                        --groups video,tty,audio \
-                       --user-group ${PN}"
+                       --user-group ${PN} \
+                       --password ${PN}"
 
 do_install () {
 	install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
-- 
1.7.7.6



