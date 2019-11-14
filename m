Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBC67F893
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 05:48:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2019 21:48:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; d="scan'208";a="194923456"
Received: from saininav-desk1.png.intel.com ([172.30.199.21])
	by orsmga007.jf.intel.com with ESMTP; 13 Nov 2019 21:48:16 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2019 13:51:55 +0800
Message-Id: <20191114055155.36015-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 2/2] libva-utils: upgrade 2.5.0 -> 2.6.0.pre1
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
X-List-Received-Date: Thu, 14 Nov 2019 05:48:16 -0000

Release details can be found here:
https://github.com/intel/libva-utils/releases/tag/2.6.0.pre1

Removed the patch which is not required anymore

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 ...ple-only-when-X11-backend-is-enabled.patch | 35 -------------------
 ...ils_2.5.0.bb => libva-utils_2.6.0.pre1.bb} |  9 ++---
 2 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-graphics/libva/libva-utils/0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch
 rename meta/recipes-graphics/libva/{libva-utils_2.5.0.bb => libva-utils_2.6.0.pre1.bb} (78%)

diff --git a/meta/recipes-graphics/libva/libva-utils/0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch b/meta/recipes-graphics/libva/libva-utils/0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch
deleted file mode 100644
index 01fb71913b..0000000000
--- a/meta/recipes-graphics/libva/libva-utils/0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8fc14e4bc81885b80c3072e549c2e6f59533d7ef Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Fri, 8 Feb 2019 11:45:55 +0800
-Subject: [PATCH] Build sfcsample only when X11 backend is enabled
-
-See: https://github.com/intel/libva-utils/pull/149, and
-https://github.com/intel/libva-utils/issues/150
-
-Upstream-Status: Submitted
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index d28175a..e294e25 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -24,10 +24,11 @@ ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
- 
- AUTOMAKE_OPTIONS = foreign
- 
--SUBDIRS = common decode encode vainfo videoprocess vendor/intel vendor/intel/sfcsample
-+SUBDIRS = common decode encode vainfo videoprocess vendor/intel
- 
- if USE_X11
- SUBDIRS += putsurface
-+SUBDIRS += vendor/intel/sfcsample
- else
- if USE_WAYLAND
- SUBDIRS += putsurface
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/libva/libva-utils_2.5.0.bb b/meta/recipes-graphics/libva/libva-utils_2.6.0.pre1.bb
similarity index 78%
rename from meta/recipes-graphics/libva/libva-utils_2.5.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.6.0.pre1.bb
index fc013d75c3..199b864d00 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.5.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.6.0.pre1.bb
@@ -14,12 +14,9 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2 \
-           file://0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch \
-           "
-
-SRC_URI[md5sum] = "c1fada26c286654859eff33b2562cb79"
-SRC_URI[sha256sum] = "9238c9d5110d60f935683390b8383fdac3507346384cd5f117a23c6db1d72a17"
+SRC_URI = "git://github.com/intel/libva-utils.git;protocol=https"
+SRCREV = "81b5929f2b71d0b657e6ef605a522edc3bcd3e80"
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
 
-- 
2.17.1


