Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SAwL2-0006eB-Jc
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 05:42:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Mar 2012 21:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="120759924"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2012 21:33:59 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 12:31:48 +0800
Message-Id: <c1505ead113c0bac42d2481bbd75e1bf367bbfd2.1332474082.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1332474081.git.lianhao.lu@intel.com>
References: <cover.1332474081.git.lianhao.lu@intel.com>
Subject: [PATCH 1/5] pseudo: package the var/pseudo directory.
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
X-List-Received-Date: Fri, 23 Mar 2012 04:42:56 -0000

Fixed the "not shipped" packaging warnings.

WARNING: For recipe pseudo-nativesdk, the following files/directories
were installed but not shipped in any package:
WARNING:   /opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/var
WARNING:
/opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/var/pseudo

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc    |    2 +-
 meta/recipes-devtools/pseudo/pseudo_1.2.bb |    2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index c2a871b..4a3ef6f 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -9,7 +9,7 @@ SECTION = "base"
 LICENSE = "LGPL2.1"
 DEPENDS = "sqlite3"
 
-FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo"
+FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
 FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
 PROVIDES += "virtual/fakeroot"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.2.bb
index 04bcbce..9f95bd7 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.2.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.2.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://oe-config.patch \
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 5ed8cf7..4f8c9d6 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,7 +2,7 @@ require pseudo.inc
 
 SRCREV = "17c2233f93692f79684792750001ee6d13e03925"
 PV = "1.2+git${SRCPV}"
-PR = "r20"
+PR = "r21"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.0.4



