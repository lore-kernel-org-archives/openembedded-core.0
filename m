Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1UBPBm-0000pf-J4 for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 13:36:00 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Mar 2013 04:16:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,761,1355126400"; d="scan'208";a="269559647"
Received: from unknown (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2013 04:18:20 -0800
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2013 14:23:03 +0200
Message-Id: <1362140583-6058-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] remake: added PV to git package recipe
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
X-List-Received-Date: Fri, 01 Mar 2013 12:36:09 -0000

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/recipes-devtools/remake/remake_git.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/remake/remake_git.bb b/meta/recipes-devtools/remake/remake_git.bb
index 42c4d48..a7cf54e 100644
--- a/meta/recipes-devtools/remake/remake_git.bb
+++ b/meta/recipes-devtools/remake/remake_git.bb
@@ -9,6 +9,8 @@ SRC_URI += "file://version-remake.texi.patch"
 SRCREV = "414d6e84121c6740ff5079370c905dea0f0e1ddb"
 S = "${WORKDIR}/git"
 
+PV = "3.82+dbg-0.8+git${SRCPV}"
+
 DEPENDS += "readline"
 PROVIDES += "make"
 
-- 
1.7.9.5



