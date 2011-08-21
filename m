Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvGI1-0000hM-7K
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 00:14:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Aug 2011 15:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40049276"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.3])
	by orsmga002.jf.intel.com with ESMTP; 21 Aug 2011 15:10:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Aug 2011 15:09:58 -0700
Message-Id: <1610f15772a61d465d8804b3c5cac02541e467ac.1313964401.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313964401.git.sgw@linux.intel.com>
References: <cover.1313964401.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313964401.git.sgw@linux.intel.com>
References: <cover.1313964401.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] at: fix RDEPENDS -> RDEPENDS_${PN}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Aug 2011 22:14:45 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/at/at_3.1.12.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.12.bb b/meta/recipes-extended/at/at_3.1.12.bb
index baf15df..30fdb68 100644
--- a/meta/recipes-extended/at/at_3.1.12.bb
+++ b/meta/recipes-extended/at/at_3.1.12.bb
@@ -6,7 +6,7 @@ LICENSE="GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 DEPENDS = "flex initscripts \
 	${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-RDEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
+RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 
 RCONFLICTS_${PN} = "atd"
-- 
1.7.6



