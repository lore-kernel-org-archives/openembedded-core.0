Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 83AB76E4CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 14:11:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2014 06:12:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,505,1389772800"; d="scan'208";a="477667101"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2014 06:11:53 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 16:14:41 +0200
Message-Id: <aadecbcae2ffb2f8585b815aa42fef9c870d218b.1392819236.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392819236.git.cristian.iorga@intel.com>
References: <cover.1392819236.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1392819236.git.cristian.iorga@intel.com>
References: <cover.1392819236.git.cristian.iorga@intel.com>
Subject: [PATCH 1/8] libvorbis: upgrade to 1.3.4
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
X-List-Received-Date: Wed, 19 Feb 2014 14:12:02 -0000

- Updated website;
- Cleaned up bugtracker web address;
- Removed PR;
- Switched to ${BP} variable;
- removed obsolete_automake_macros.patch,
included in upstream;

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libvorbis-1.3.3/obsolete_automake_macros.patch        | 15 ---------------
 .../libvorbis/{libvorbis_1.3.3.bb => libvorbis_1.3.4.bb}  | 14 +++++---------
 2 files changed, 5 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis-1.3.3/obsolete_automake_macros.patch
 rename meta/recipes-multimedia/libvorbis/{libvorbis_1.3.3.bb => libvorbis_1.3.4.bb} (66%)

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis-1.3.3/obsolete_automake_macros.patch b/meta/recipes-multimedia/libvorbis/libvorbis-1.3.3/obsolete_automake_macros.patch
deleted file mode 100644
index 211d949..0000000
--- a/meta/recipes-multimedia/libvorbis/libvorbis-1.3.3/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted [https://trac.xiph.org/ticket/1919]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd libvorbis-1.3.3/configure.ac libvorbis-1.3.3/configure.ac
---- libvorbis-1.3.3/configure.ac	2012-02-04 00:00:34.000000000 +0200
-+++ libvorbis-1.3.3/configure.ac	2013-01-03 08:41:34.718676342 +0200
-@@ -13,7 +13,7 @@
-
- AM_INIT_AUTOMAKE($PACKAGE_NAME,$PACKAGE_VERSION)
- AM_MAINTAINER_MODE
--AM_CONFIG_HEADER([config.h])
-+AC_CONFIG_HEADERS([config.h])
-
- dnl Add parameters for aclocal
- AC_SUBST(ACLOCAL_AMFLAGS, "-I m4")
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb
similarity index 66%
rename from meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb
rename to meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb
index 1df3bb5..0788c94 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.4.bb
@@ -2,22 +2,18 @@ SUMMARY = "Ogg Vorbis Audio Codec"
 DESCRIPTION = "Ogg Vorbis is a high-quality lossy audio codec \
 that is free of intellectual property restrictions. libvorbis \
 is the main vorbis codec library."
-HOMEPAGE = "http://xiph.org/"
-BUGTRACKER = "https://trac.xiph.org/newticket"
+HOMEPAGE = "http://www.vorbis.com/"
+BUGTRACKER = "https://trac.xiph.org"
 SECTION = "libs"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ca77c6c3ea4d29cb68dce8ef5ab0d897 \
                     file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=d1c1d138863d6315131193d4046d81cb"
 DEPENDS = "libogg"
 
-PR = "r1"
+SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz"
 
-SRC_URI = "http://downloads.xiph.org/releases/vorbis/libvorbis-${PV}.tar.gz \
-           file://obsolete_automake_macros.patch \
-"
-
-SRC_URI[md5sum] = "6b1a36f0d72332fae5130688e65efe1f"
-SRC_URI[sha256sum] = "6d747efe7ac4ad249bf711527882cef79fb61d9194c45b5ca5498aa60f290762"
+SRC_URI[md5sum] = "55f2288055e44754275a17c9a2497391"
+SRC_URI[sha256sum] = "2f05497d29195dc23ee952a24ee3973a74e6277569c4c2eca0ec5968e541f372"
 
 inherit autotools pkgconfig
 
-- 
1.8.3.2


