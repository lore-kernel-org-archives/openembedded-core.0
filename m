Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BFECF6B57C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010152"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:27 +0000
Message-Id: <bf8f4cbf919a864d55a991c4fa101fabe9fdc174.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 31/38] enchant: tidy up recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Dec 2013 22:30:29 -0000

* Move recipe definitions into logical order
* Fix spacing

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/enchant/enchant_1.6.0.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/enchant/enchant_1.6.0.bb b/meta/recipes-support/enchant/enchant_1.6.0.bb
index 68ca525..c40266e 100644
--- a/meta/recipes-support/enchant/enchant_1.6.0.bb
+++ b/meta/recipes-support/enchant/enchant_1.6.0.bb
@@ -1,12 +1,13 @@
 SUMMARY = "Enchant Spell checker API Library"
-SECTION     = "libs"
+SECTION = "libs"
 HOMEPAGE = "http://www.abisource.com/projects/enchant/"
 BUGTRACKER = "http://bugzilla.abisource.com/enter_bug.cgi?product=Enchant"
-LICENSE     = "LGPLv2.1+"
+
+LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=dfcbabf9131dc9a95febef6753a2958b \
                     file://src/enchant.h;beginline=1;endline=29;md5=8d881caa1d37523567e1d8f726675a18"
-DEPENDS     = "aspell glib-2.0"
-RDEPENDS_${PN}    = "aspell"
+
+DEPENDS = "aspell glib-2.0"
 
 inherit autotools pkgconfig
 
@@ -19,8 +20,11 @@ SRC_URI[sha256sum] = "2fac9e7be7e9424b2c5570d8affe568db39f7572c10ed48d4e13cddf03
 
 EXTRA_OECONF = "--with-aspell-prefix=${STAGING_DIR_HOST}${prefix} --enable-aspell --disable-binreloc"
 
+export CXXFLAGS += " -L${STAGING_LIBDIR} -lstdc++ "
+
 FILES_${PN} = "${bindir} ${libdir}/*${SOLIBS} ${datadir}/${BPN} ${libdir}/${BPN}/*.so"
 FILES_${PN}-dev += "${libdir}/${BPN}/*{SOLIBSDEV} ${libdir}/${BPN}/*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/*.a"
 
-export CXXFLAGS += " -L${STAGING_LIBDIR} -lstdc++ "
+RDEPENDS_${PN} += "aspell"
+
-- 
1.8.1.2


