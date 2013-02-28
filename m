Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1UB4Xz-0001A2-Lg for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 15:33:27 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2013 06:17:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,755,1355126400"; d="scan'208";a="293053895"
Received: from ema-vostro-460 (HELO localhost.localdomain) ([10.237.105.140])
	by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2013 06:16:59 -0800
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2013 16:21:40 +0200
Message-Id: <1362061300-8044-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] remake: added PV to git package recipe
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
X-List-Received-Date: Thu, 28 Feb 2013 14:33:38 -0000

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/recipes-devtools/remake/remake_git.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/remake/remake_git.bb b/meta/recipes-devtools/remake/remake_git.bb
index 42c4d48..85d9220 100644
--- a/meta/recipes-devtools/remake/remake_git.bb
+++ b/meta/recipes-devtools/remake/remake_git.bb
@@ -9,6 +9,8 @@ SRC_URI += "file://version-remake.texi.patch"
 SRCREV = "414d6e84121c6740ff5079370c905dea0f0e1ddb"
 S = "${WORKDIR}/git"
 
+PV = "3.81-dbg-0.7+git${SRCPV}"
+
 DEPENDS += "readline"
 PROVIDES += "make"
 
-- 
1.7.9.5



