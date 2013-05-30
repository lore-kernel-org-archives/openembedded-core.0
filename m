Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 608046A4B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:14 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id z11so256606wgg.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=mFDml45NFCVczI8k2/Ht2AhmRBy/XDvdmU53hmoxcjE=;
	b=GZRW4LGBa1Hpon8C8cG9ZIC/AwFWwq+mdRQC52DWXkkHN8gm0z3CDKKkEjReIKR7j2
	XODpFatpTdxmth1ft/VHW5k4PeNeGLUVzvqjbb9kbMidQWuP/PClQggtKFrXGlaF9fuC
	O44Vh1SuDic9Dj2pr7MAHCxUXmMTZhlFJeP0QXq1PwiE1rqgBTg6NewnkEXYqIJfHun/
	Il68wD9ZiZgl9khaaxueLepVgTybuTWJSW0qAxI96YwM3s7g8a9NFCo4J/PqkTNBHdk9
	n+37N7khVdUVowxx4u4+ODkxqoLiplm6BjqM5o2ivBQdXxNjI7xUVLrWxnI7uICQ0cAi
	m/hQ==
X-Received: by 10.194.59.72 with SMTP id x8mr4860253wjq.49.1369922175089;
	Thu, 30 May 2013 06:56:15 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:38 +0100
Message-Id: <22e0a87c5884adff2aa356bc6f02d9cb49ee2376.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQma+HhvTIcFSFs0P4vWDZseXrVFd0xPE/Jp3YnkwG9/dXhw6mtCFp0wdo7oW96514ND1QP1
Subject: [PATCH 04/14] gdk-pixbuf: upgrade to 2.28.1
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
X-List-Received-Date: Thu, 30 May 2013 13:56:14 -0000

Something along the lines of pngversion.patch was merged upstream, so drop that
patch.

Also use the new trim_version() function for a future-proof SRC_URI.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch  |   23 --------------------
 .../configure_fix.patch                            |    0
 .../extending-libinstall-dependencies.patch        |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} |   11 +++++-----
 5 files changed, 5 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/extending-libinstall-dependencies.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} (89%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
deleted file mode 100644
index 2e7d5af..0000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-We now have libpng 1.6. If we build libpng12 as well as libpng 1.6, the 1.2 version gets 
-preferred which is not desirable and does not give deterministic builds.
-
-We really do want to use libpng since the item in DEPENDS will provide this so
-manipulate the search list so the one we DEPEND on gets chosen.
-
-RP 2013/4/13
-
-Upstream-Status: Pending [worth discussing at least]
-
-Index: gdk-pixbuf-2.26.5/configure.ac
-===================================================================
---- gdk-pixbuf-2.26.5.orig/configure.ac	2013-03-26 15:45:16.594820303 +0000
-+++ gdk-pixbuf-2.26.5/configure.ac	2013-04-13 10:15:19.241433789 +0000
-@@ -588,7 +588,7 @@
- 
- dnl Test for libpng
-   if test x$with_libpng != xno && test -z "$LIBPNG"; then
--    for l in libpng15 libpng14 libpng12 libpng13 libpng10 libpng ; do
-+    for l in libpng libpng15 libpng14 libpng12 libpng13 libpng10 ; do
-       AC_MSG_CHECKING(for $l)
-       if $PKG_CONFIG --exists $l ; then
-         AC_MSG_RESULT(yes)
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/configure_fix.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/configure_fix.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/configure_fix.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/configure_fix.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/extending-libinstall-dependencies.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/extending-libinstall-dependencies.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/extending-libinstall-dependencies.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/extending-libinstall-dependencies.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/hardcoded_libtool.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/hardcoded_libtool.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/hardcoded_libtool.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/hardcoded_libtool.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb
similarity index 89%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb
index b85bbaf..4bf2eb6 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb
@@ -11,17 +11,16 @@ SECTION = "libs"
 DEPENDS = "libpng glib-2.0 jpeg"
 DEPENDS_append_linuxstdbase = " virtual/libx11"
 
-SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.26/gdk-pixbuf-${PV}.tar.xz \
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
            file://configure_fix.patch \
            file://extending-libinstall-dependencies.patch \
-           file://pngversion.patch \
            "
 
-SRC_URI[md5sum] = "339329e6d619ee3e1cb93979111b04c0"
-SRC_URI[sha256sum] = "77696fd163bca95a130a1883dbd78d0ae4d782de2fc85a9a38556d13681f5c84"
-
-PR = "r1"
+SRC_URI[md5sum] = "5c71cce316d08c559fc5970aa60754ab"
+SRC_URI[sha256sum] = "bea0b743fdb5c3c8e23210f73623ec5f18f9ead2522942897fe739d80b50c2bb"
 
 inherit autotools pkgconfig gettext pixbufcache
 
-- 
1.7.10.4


