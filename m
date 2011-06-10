Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUvDw-0001Os-Kt
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 08:29:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2011 23:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,345,1304319600"; d="scan'208";a="12490365"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2011 23:26:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 23:26:13 -0700
Message-Id: <27e9bee423a81742040abb3e08b4a8a64530ab3b.1307686602.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307686598.git.sgw@linux.intel.com>
References: <cover.1307686598.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307686598.git.sgw@linux.intel.com>
References: <cover.1307686598.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 1/4] ghostscript: update SRC_URI
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
X-List-Received-Date: Fri, 10 Jun 2011 06:29:40 -0000

From: Kang Kai <kai.kang@windriver.com>

Build ghostscript-native fails on a i686 machine because it can't get
the source objarch.h and soobjarch.h, and .h files are not needed for
native package, so update the SRC_URI to fix it.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../ghostscript/ghostscript_9.02.bb                |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
index e3d32dd..bee5684 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
@@ -15,17 +15,20 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d151214b3131251dfc9d858593acbd24"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "${PN}-native tiff jpeg fontconfig cups"
 DEPENDS_virtclass-native = ""
 
-SRC_URI = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.bz2 \
+SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.bz2"
+
+SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-prevent_recompiling.patch \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
            file://soobjarch.h \
            "
+SRC_URI_virtclass-native = "${SRC_URI_BASE}"
 
 SRC_URI[md5sum] = "f67151444bd56a7904579fc75a083dd6"
 SRC_URI[sha256sum] = "03ea2cad13a36f8f9160912012b79619a826e7148fada6d3531feb25409ee05a"
-- 
1.7.3.4



