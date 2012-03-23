Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SAwL2-0006eA-SV
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 05:42:57 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Mar 2012 21:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="143705647"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2012 21:34:02 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 12:31:50 +0800
Message-Id: <d7edf24d711c1b3c111cce67d8605a80984bbb4b.1332474082.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <c1505ead113c0bac42d2481bbd75e1bf367bbfd2.1332474082.git.lianhao.lu@intel.com>
References: <c1505ead113c0bac42d2481bbd75e1bf367bbfd2.1332474082.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1332474081.git.lianhao.lu@intel.com>
References: <cover.1332474081.git.lianhao.lu@intel.com>
Subject: [PATCH 3/5] ncurses: ship clear/reset in package.
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
X-List-Received-Date: Fri, 23 Mar 2012 04:42:57 -0000

Fixed not shipped packaging warnings.

WARNING: For recipe ncurses-nativesdk, the following files/directories
were installed but not shipped in any package:
WARNING:
/opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/reset
WARNING:
/opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/clear

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 4d64f5e..ae99e2c 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r7"
+INC_PR = "r8"
 
 inherit autotools binconfig multilib_header
 
@@ -245,8 +245,8 @@ FILES_${PN}-tools = "\
   ${bindir}/infotocap \
   ${bindir}/captoinfo \
   ${bindir}/infocmp \
-  ${bindir}/clear.${PN} \
-  ${bindir}/reset.${PN} \
+  ${bindir}/clear${@['', '.${PN\x7d'][d.getVar('PN', 1) == 'ncurses']} \
+  ${bindir}/reset${@['', '.${PN\x7d'][d.getVar('PN', 1) == 'ncurses']} \
   ${bindir}/tack \
   ${bindir}/tabs \
 "
-- 
1.7.0.4



