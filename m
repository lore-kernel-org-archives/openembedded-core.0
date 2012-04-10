Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHVcU-0000u1-J2
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 09:36:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 00:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130584261"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 00:26:46 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:26:39 -0700
Message-Id: <2be224a3b308e273e3bbf58d15f5ab1ea767fba5.1334042473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL [v2] 12/14] at: Fix origin location of install pam.conf from from ${P} -> ${BP}
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
X-List-Received-Date: Tue, 10 Apr 2012 07:36:06 -0000

This patch changes P to BP to address where a file is installed
from when building with PAM enabled and using multi-lib.

[YOCTO #2224]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/at/at_3.1.13.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.13.bb b/meta/recipes-extended/at/at_3.1.13.bb
index bcc08aa..9af3569 100644
--- a/meta/recipes-extended/at/at_3.1.13.bb
+++ b/meta/recipes-extended/at/at_3.1.13.bb
@@ -11,7 +11,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://configure.patch \
@@ -56,7 +56,7 @@ do_install () {
 
 	for feature in ${DISTRO_FEATURES}; do
 		if [ "$feature" = "pam" ]; then
-			install -D -m 0644 ${WORKDIR}/${P}/pam.conf ${D}${sysconfdir}/pam.d/atd
+			install -D -m 0644 ${WORKDIR}/${BP}/pam.conf ${D}${sysconfdir}/pam.d/atd
 			break
 		fi
 	done
-- 
1.7.7.6



