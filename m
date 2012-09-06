Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T9kHr-0008EG-Ue
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 00:11:00 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Sep 2012 14:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,381,1344236400"; d="scan'208";a="142354287"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.76])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Sep 2012 14:58:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 14:58:33 -0700
Message-Id: <1346968713-16778-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] matchbox-session: Should have high ALTERNATIE_PRIORITY than mini-x-session
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
X-List-Received-Date: Thu, 06 Sep 2012 22:11:00 -0000

By having a high priority it will be installed instead of the mini-x-session
when both are in a give set of packagegroups, as it stands now the
mini-x-session is installed by default on sato which is wrong!

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../matchbox-session/matchbox-session_0.1.bb       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index f4be279..b9e83a5 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -11,13 +11,13 @@ RCONFLICTS_${PN} = "matchbox-common"
 SRC_URI = "file://matchbox-session"
 S = "${WORKDIR}"
 
-PR = "r3"
+PR = "r4"
 
 inherit update-alternatives
 
 ALTERNATIVE_${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/matchbox-session"
-ALTERNATIVE_PRIORITY = "10"
+ALTERNATIVE_PRIORITY = "100"
 
 do_install() {
 	install -d ${D}/${bindir}
-- 
1.7.7.6



