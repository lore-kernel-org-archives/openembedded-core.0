Return-Path: <ismo.puustinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CFB1C607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 08:22:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 21 May 2015 01:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,467,1427785200"; d="scan'208";a="729483705"
Received: from ipuustin-mobl.ger.corp.intel.com (HELO
	ipuustin-mobl.fi.intel.com) ([10.237.68.151])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2015 01:22:08 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 11:21:30 +0300
Message-Id: <1432196500-13462-2-git-send-email-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
References: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
Subject: [PATCH 01/11] flac: do not mix single and double quotes.
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
X-List-Received-Date: Thu, 21 May 2015 08:22:11 -0000

---
 meta/recipes-multimedia/flac/flac_1.3.1.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/flac/flac_1.3.1.bb b/meta/recipes-multimedia/flac/flac_1.3.1.bb
index f25271f..69ca62d 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.1.bb
@@ -21,17 +21,17 @@ SRC_URI[sha256sum] = "4773c0099dba767d963fd92143263be338c48702172e8754b9bc5103ef
 
 inherit autotools gettext
 
-EXTRA_OECONF = "--disable-oggtest \
+EXTRA_OECONF = '--disable-oggtest \
                 --with-ogg-libraries=${STAGING_LIBDIR} \
                 --with-ogg-includes=${STAGING_INCDIR} \
                 --disable-xmms-plugin \
                 --without-libiconv-prefix \
                 ac_cv_prog_NASM="" \
-                "
+                '
 
-EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "altivec", " --enable-altivec", " --disable-altivec", d)}"
-EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "core2", " --enable-sse", "", d)}"
-EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "corei7", " --enable-sse", "", d)}"
+EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "altivec", " --enable-altivec", " --disable-altivec", d)}'
+EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "core2", " --enable-sse", "", d)}'
+EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "corei7", " --enable-sse", "", d)}'
 
 PACKAGES += "libflac libflac++ liboggflac liboggflac++"
 FILES_${PN} = "${bindir}/*"
-- 
2.1.0


