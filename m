Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TjTuu-0003Cp-Gy
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 12:59:01 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1548051bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 03:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=MbE7iqw85GHRm9mBMRm2igJmDAb/9IUer7PP8AmtsLs=;
	b=ha/w1C/efSkkbqAzJQ6UnQXtzaaMSO97siOpb7uiB+3ZVbHQZygZPxcM3LRfmna56o
	rqg/dOjhixoehYp8fsnPEStC5VWFymmRxDzQFl7G43UOillhzNzGm5OI5k7cAfO2L57j
	hJ99Al3i7K6ps95Jd7lKEKMZCvGATzWI7H4RJHN9iLAIReeUhOERwcMenB13+fgYsG9N
	D0PgrJS0wDAbc5vVl3OcNVVu9VjyYV0XaTB8CJi4cs50T/vh2ArIaMB12j+buzlb+L73
	X0MJKMqK9VAUgJmXcmpEzcJVWAXFT47EWLTzMoWA6s+eK9VrdbPbkPEs8OoYm1KrMD6a
	XO/g==
Received: by 10.204.131.76 with SMTP id w12mr2602734bks.44.1355485464531;
	Fri, 14 Dec 2012 03:44:24 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id u3sm4109201bkw.9.2012.12.14.03.44.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 03:44:23 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjTgj-0008Q1-FS; Fri, 14 Dec 2012 13:44:21 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 13:44:20 +0200
Message-Id: <1355485460-32319-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gdk-pixbuf: update to upstream version 2.26.5
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
X-List-Received-Date: Fri, 14 Dec 2012 11:59:01 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../gdk-pixbuf-2.24.1/configure_nm.patch           |   21 --------------------
 .../configure_fix.patch                            |    0
 .../extending-libinstall-dependencies.patch        |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gdk-pixbuf_2.24.1.bb => gdk-pixbuf_2.26.5.bb} |   10 +++++-----
 5 files changed, 5 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_nm.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.1 => gdk-pixbuf-2.26.5}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.1 => gdk-pixbuf-2.26.5}/extending-libinstall-dependencies.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.1 => gdk-pixbuf-2.26.5}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.24.1.bb => gdk-pixbuf_2.26.5.bb} (95%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_nm.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_nm.patch
deleted file mode 100644
index 54f7c3a..0000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_nm.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Pick up ${NM} from the environment.
-
-Upstream-Status: Pending
-https://bugzilla.gnome.org/show_bug.cgi?id=671516
-
-Signed-off-by: James Limbouris <james@digitalmatter.com.au>
-
-Index: gdk-pixbuf-2.24.0/configure.ac
-===================================================================
-diff -uNr gdk-pixbuf-2.24.0/configure.ac gdk-pixbuf-2.24.0.mod/configure.ac
---- gdk-pixbuf-2.24.0/configure.ac	2011-08-27 11:27:52.000000000 +0800
-+++ gdk-pixbuf-2.24.0.mod/configure.ac	2012-02-28 14:48:36.481126410 +0800
-@@ -147,7 +147,7 @@
- AC_SYS_LARGEFILE
- 
- AM_PROG_AS
--AC_PATH_PROG(NM, nm, nm)
-+AC_CHECK_TOOLS(NM, [$NM nm], nm)
- 
- AC_MSG_CHECKING([for some Win32 platform])
- AS_CASE(["$host"],
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_fix.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/configure_fix.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_fix.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/configure_fix.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/extending-libinstall-dependencies.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/extending-libinstall-dependencies.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/extending-libinstall-dependencies.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/extending-libinstall-dependencies.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/hardcoded_libtool.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/hardcoded_libtool.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/hardcoded_libtool.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/hardcoded_libtool.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
similarity index 95%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
index 33a43be..5a9cd9b 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
@@ -11,17 +11,16 @@ SECTION = "libs"
 DEPENDS = "libpng glib-2.0 jpeg"
 DEPENDS_append_linuxstdbase = " virtual/libx11"
 
-SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${PV}.tar.xz \
-           file://configure_nm.patch \
+SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.26/gdk-pixbuf-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
            file://configure_fix.patch \
            file://extending-libinstall-dependencies.patch \
            "
 
-SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
-SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"
+SRC_URI[md5sum] = "339329e6d619ee3e1cb93979111b04c0"
+SRC_URI[sha256sum] = "77696fd163bca95a130a1883dbd78d0ae4d782de2fc85a9a38556d13681f5c84"
 
-PR = "r7"
+PR = "r0"
 
 inherit autotools pkgconfig gettext
 
@@ -43,6 +42,7 @@ FILES_${PN}-xlib = "${libdir}/*pixbuf_xlib*${SOLIBS}"
 ALLOW_EMPTY_${PN}-xlib = "1"
 
 FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
+	${bindir}/gdk-pixbuf-pixdata \
 	${libdir}/lib*.so.*"
 
 FILES_${PN}-dev += " \
-- 
1.7.10.4



