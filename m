Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxrc-00050A-CN
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:48 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:21:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752339"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:39 -0800
Message-Id: <3009f3d568aa62cd534ff8340d4661e90d4d00c3.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 113/113] pseudo: ensure libs are included in package
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:49 -0000

[YOCTO #1868]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc    |    2 +-
 meta/recipes-devtools/pseudo/pseudo_1.2.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 0c7185b..c2a871b 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -9,7 +9,7 @@ SECTION = "base"
 LICENSE = "LGPL2.1"
 DEPENDS = "sqlite3"
 
-FILES_${PN} = "${libdir}/libpseudo.so ${bindir}/* ${localstatedir}/pseudo"
+FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo"
 FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
 PROVIDES += "virtual/fakeroot"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.2.bb
index 1d5fe1a..f2ebc22 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.2.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.2.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://oe-config.patch \
-- 
1.7.6.4



