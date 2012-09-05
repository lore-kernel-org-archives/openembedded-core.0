Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9HwA-0002QG-TG
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 17:54:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Sep 2012 08:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,374,1344236400"; d="scan'208";a="189215336"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by orsmga001.jf.intel.com with ESMTP; 05 Sep 2012 08:42:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 16:42:15 +0100
Message-Id: <1346859735-24001-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] classes/qmake_base: support linux-gnuspe/linux-uclibcspe TARGET_OS
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
X-List-Received-Date: Wed, 05 Sep 2012 15:54:43 -0000

Fix borrowed from OE-Classic. This should fix build failures during
do_configure of Qt applications with the p1022ds machine from
meta-fsl-ppc, for example.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/qmake_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
index d1008b6..fa1b5f0 100644
--- a/meta/classes/qmake_base.bbclass
+++ b/meta/classes/qmake_base.bbclass
@@ -48,7 +48,7 @@ addtask generate_qt_config_file after do_patch before do_configure
 
 qmake_base_do_configure() {
 	case ${QMAKESPEC} in
-	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibceabi-oe-g++)
+	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibceabi-oe-g++|*linux-gnuspe-oe-g++|*linux-uclibcspe-oe-g++)
 		;;
 	*-oe-g++)
 		die Unsupported target ${TARGET_OS} for oe-g++ qmake spec
-- 
1.7.9.5



