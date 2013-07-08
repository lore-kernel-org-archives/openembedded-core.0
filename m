Return-Path: <radu.moisan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id AF45E6AF25
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 10:20:12 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jul 2013 03:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1019,1363158000"; d="scan'208";a="328132573"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 08 Jul 2013 03:20:12 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 13:21:58 +0300
Message-Id: <2cfb1b1edbba2e1109c906a2470e7957ea53549c.1373278823.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373278823.git.radu.moisan@intel.com>
References: <cover.1373278823.git.radu.moisan@intel.com>
In-Reply-To: <cover.1373278823.git.radu.moisan@intel.com>
References: <cover.1373278823.git.radu.moisan@intel.com>
Subject: [PATCH 3/9] rxvt-unicode: Upgrade to v9.18
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
X-List-Received-Date: Mon, 08 Jul 2013 10:20:12 -0000

do_configure was initially failing because could not stat aclocal.m4,
prepended ${S} so that it could find the file, however I don't know
the reasoning for do_configure_prepend in this recipe, it also builds
fine without it

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.17.bb => rxvt-unicode_9.18.bb} |    6 +++---
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.17 => rxvt-unicode-9.18}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.17 => rxvt-unicode-9.18}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.17 => rxvt-unicode-9.18}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.17.bb => rxvt-unicode_9.18.bb} (92%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.17/rxvt.desktop b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.18/rxvt.desktop
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.17/rxvt.desktop
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.18/rxvt.desktop
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.17/rxvt.png b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.18/rxvt.png
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.17/rxvt.png
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.18/rxvt.png
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.17/xwc.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.18/xwc.patch
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.17/xwc.patch
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.18/xwc.patch
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.17.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb
similarity index 92%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.17.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb
index 806e354..9a47617 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.17.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2
 	   file://rxvt.desktop \
 	   file://rxvt.png"
 
-SRC_URI[md5sum] = "1270432bdc7ce17dbb07d41a607081e0"
-SRC_URI[sha256sum] = "de017b2b2a1a7182aeada99f605da33cbee18d450e07a7fdabef48da446521e4"
+SRC_URI[md5sum] = "963ccc748fe5bca925e7b92c0404d68b"
+SRC_URI[sha256sum] = "87b72a43cac7c9362a984094c661a632ce1a829ad90f149142ab1953854b433f"
 
 inherit autotools update-alternatives
 
@@ -42,7 +42,7 @@ EXTRA_OECONF = "--enable-menubar --enable-xim \
 		--with-x=${STAGING_DIR_HOST}${prefix}"
 
 do_configure_prepend () {
-	cp aclocal.m4 acinclude.m4
+	cp ${S}/aclocal.m4 ${S}/acinclude.m4
 }
 
 do_compile_prepend () {
-- 
1.7.9.5


