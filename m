Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvcUM-0006yL-KI
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:56:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 14:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,265,1312182000"; d="scan'208";a="43970269"
Received: from unknown (HELO swold-MOBL.lan) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 14:52:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 14:51:54 -0700
Message-Id: <d951b29b1e99d4a64e54cfafd0d76abd7c6c7dc0.1314043945.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/19] at: fix RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Mon, 22 Aug 2011 21:56:59 -0000

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



