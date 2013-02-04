Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U2ISW-0004wh-MB
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:35:29 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Feb 2013 01:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="252243103"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 04 Feb 2013 01:19:38 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:20:15 +0200
Message-Id: <a5e7ef52306c84fa09a7be377d026d9b1caaf159.1359967266.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
Subject: [PATCH 01/10] enchant: use BPN instead of PN
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
X-List-Received-Date: Mon, 04 Feb 2013 09:35:29 -0000

- use BPN (PN includes mlprefix) to package all files
when building with multilib options

[YOCTO #3438]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-support/enchant/enchant_1.6.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/enchant/enchant_1.6.0.bb b/meta/recipes-support/enchant/enchant_1.6.0.bb
index 25178f5..c16a2a8 100644
--- a/meta/recipes-support/enchant/enchant_1.6.0.bb
+++ b/meta/recipes-support/enchant/enchant_1.6.0.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN}    = "aspell"
 
 inherit autotools pkgconfig
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.abisource.com/downloads/enchant/${PV}/enchant-${PV}.tar.gz"
 
@@ -19,8 +19,8 @@ SRC_URI[sha256sum] = "2fac9e7be7e9424b2c5570d8affe568db39f7572c10ed48d4e13cddf03
 
 EXTRA_OECONF = "--with-aspell-prefix=${STAGING_DIR_HOST}${prefix} --enable-aspell --disable-binreloc"
 
-FILES_${PN} = "${bindir} ${libdir}/*${SOLIBS} ${datadir}/${PN} ${libdir}/${PN}/*.so"
-FILES_${PN}-dev += "${libdir}/${PN}/*{SOLIBSDEV} ${libdir}/${PN}/*.la" 
-FILES_${PN}-staticdev += "${libdir}/${PN}/*.a" 
+FILES_${PN} = "${bindir} ${libdir}/*${SOLIBS} ${datadir}/${BPN} ${libdir}/${BPN}/*.so"
+FILES_${PN}-dev += "${libdir}/${BPN}/*{SOLIBSDEV} ${libdir}/${BPN}/*.la"
+FILES_${PN}-staticdev += "${libdir}/${BPN}/*.a"
 
 export CXXFLAGS += " -L${STAGING_LIBDIR} -lstdc++ "
-- 
1.7.11.7



