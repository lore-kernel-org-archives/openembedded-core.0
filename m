Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrJ-0004lf-AO
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:31 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752227"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:46 -0800
Message-Id: <0097e38935482cc3704e8f4712f0d986dcea4661.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 060/113] valgrind: add powerpc to the compatible host and add ${TCLIBC}-dbg in RRECOMMENDS
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:32 -0000

From: Zhenhua Luo <b19537@freescale.com>

    1. add powerpc into the compatible host list
    2. valgrind requires the non-stripped libraries of ${TCLIBC}, so add
       ${TCLIBC}-dbg into RRECOMMENDS_valgrind

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index 03cdd28..5f1757f 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
 SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
 
-COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|powerpc|ppc|powerpc64|ppc64).*-linux'
 
 inherit autotools
 
@@ -27,3 +27,5 @@ EXTRA_OEMAKE = "-w"
 PARALLEL_MAKE = ""
 
 FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
+
+RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
-- 
1.7.6.4



