Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBE06612C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 13:06:10 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id o80so289432218wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 06:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OYT4Dmd5e91X/wpalT9/HHxnAxRh8rWdLBcOP4O+8ZY=;
	b=Hj6j2mk09apJmMT24Uyv1L/tR/cMupmyGqJ8DW4I5cdWfBEcmq4a3pr1JLMPMZCMtj
	COLA/w6i7kHIr7tqR362E9n0imDGWoW3EnzEy7ungzbAPe7QuwRqEGJDjKiaTZ2cIUkY
	R+NNHDABgrnuwDYK+Z+UtIiydQiQRQgOS4u8puTVF8fh7GThWonRkvIhn9QA5ecgekHn
	vHwT5HDED0ahzrfbi8Xb+x/rbUkBntZ1oQJL3+vzPpndaK9fy0vYDFbJAWXvnKdJup41
	+1HgVIq+BtoFG36kdzG2tivS8jhZWgBVpohSaWekj5sscTIGIi4ym+o7RG2ZWRT/fJDU
	9JHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OYT4Dmd5e91X/wpalT9/HHxnAxRh8rWdLBcOP4O+8ZY=;
	b=QqEccYoL2YmnPJ9cfVlORzl4IYISihgz2dshbz7ih3Ilt7MWvRUcdpa5rNX25Hi3OL
	Ktso+RrN2igCpbd7KDpBzcWonEn6lxFPiFwK8oO/658RXuBgsh8NAn7cRDc+r80PZIGX
	4fLkltWSsiYJqbrU13/ITrB27lAMkOojKl8Ih3f7SDUBQP1UMvLAz0CedlWEgnIqlygw
	ypR6sgNr2BaiqMv6HKweTGqFVXl+VZzjOauJR1D+f3dxR6CHoIh2ktQSH4yj9km6RLdb
	k8ZUeFs4WI222M8gEZsgOhWBqzNPdnePTU4kCJaxm29UCmcUMT2xEZhRA/4pZR/bwDwr
	hM7g==
X-Gm-Message-State: AEkoousmTdiG1DDjY6EHDwaTFppoaARMq9CPHbDdVB/0F+SBbJ3fv8MiyMgAjDasTsuLWF+m
X-Received: by 10.28.93.130 with SMTP id r124mr18275043wmb.92.1470143170109;
	Tue, 02 Aug 2016 06:06:10 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p23sm2986914wme.8.2016.08.02.06.06.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Aug 2016 06:06:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2016 14:06:06 +0100
Message-Id: <1470143166-16678-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] augeas: remove from oe-core
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
X-List-Received-Date: Tue, 02 Aug 2016 13:06:11 -0000

Nothing in oe-core uses this, so it's been moved to meta-oe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/distro_alias.inc          |  1 -
 meta/recipes-extended/augeas/augeas.inc            | 30 ----------------------
 ...need_charset_alias-when-building-for-musl.patch | 30 ----------------------
 .../augeas/add-missing-argz-conditional.patch      | 20 ---------------
 .../augeas/augeas/sepbuildfix.patch                | 22 ----------------
 meta/recipes-extended/augeas/augeas_1.4.0.bb       |  4 ---
 6 files changed, 107 deletions(-)
 delete mode 100644 meta/recipes-extended/augeas/augeas.inc
 delete mode 100644 meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-extended/augeas/augeas/add-missing-argz-conditional.patch
 delete mode 100644 meta/recipes-extended/augeas/augeas/sepbuildfix.patch
 delete mode 100644 meta/recipes-extended/augeas/augeas_1.4.0.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 8adafae..5948b75 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -13,7 +13,6 @@ DISTRO_PN_ALIAS_pn-alsa-state = "OE-Core"
 DISTRO_PN_ALIAS_pn-alsa-utils-alsaconf = "OE-Core"
 DISTRO_PN_ALIAS_pn-alsa-utils-scripts = "OE-Core"
 DISTRO_PN_ALIAS_pn-atk = "Fedora=atk OpenSuSE=atk"
-DISTRO_PN_ALIAS_pn-augeas = "Ubuntu=libaugeas0 Debian=libaugeas0"
 DISTRO_PN_ALIAS_pn-avahi-ui = "Ubuntu=avahi-discover Debian=avahi-discover"
 DISTRO_PN_ALIAS_pn-babeltrace = "OSPDT"
 DISTRO_PN_ALIAS_pn-bdwgc = "OSPDT"
diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
deleted file mode 100644
index 23d12ca..0000000
--- a/meta/recipes-extended/augeas/augeas.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Augeas configuration API"
-HOMEPAGE = "http://augeas.net/"
-BUGTRACKER = "https://fedorahosted.org/augeas/report/1"
-
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
-
-SRC_URI = "http://download.augeas.net/${BP}.tar.gz \
-           file://add-missing-argz-conditional.patch \
-           file://sepbuildfix.patch \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-          "
-
-DEPENDS = "readline libxml2"
-
-inherit autotools pkgconfig
-
-PACKAGES =+ "${PN}-lenses lib${BPN}"
-
-FILES_${PN}-lenses = "${datadir}/augeas/lenses"
-FILES_lib${BPN} = "${libdir}/lib*${SOLIBS}"
-
-RDEPENDS_lib${BPN} += "${PN}-lenses"
-RRECOMMENDS_lib${BPN} += "${PN}"
-
-LEAD_SONAME = "libaugeas.so"
-
-do_install_append() {
-	rm -fr ${D}${datadir}/vim
-}
diff --git a/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index 9a19876..0000000
--- a/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: augeas-1.2.0/gnulib/lib/Makefile.am
-===================================================================
---- augeas-1.2.0.orig/gnulib/lib/Makefile.am
-+++ augeas-1.2.0/gnulib/lib/Makefile.am
-@@ -463,7 +463,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/augeas/augeas/add-missing-argz-conditional.patch b/meta/recipes-extended/augeas/augeas/add-missing-argz-conditional.patch
deleted file mode 100644
index abbdbaa..0000000
--- a/meta/recipes-extended/augeas/augeas/add-missing-argz-conditional.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Add missing GL_GENERATE_ARGZ_H conditional
-
-- GL_GENERATE_ARGZ_H is used in gnulib/lib/Makefile.am
-
-Upstream-Status: Pending
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: augeas-1.0.0/configure.ac
-===================================================================
---- augeas-1.0.0.orig/configure.ac
-+++ augeas-1.0.0/configure.ac
-@@ -55,6 +55,8 @@ AC_ARG_WITH([failmalloc],
- 
- AM_CONDITIONAL([WITH_FAILMALLOC], [test x$with_failmalloc != xno])
- 
-+AM_CONDITIONAL([GL_GENERATE_ARGZ_H], [test -n "$ARGZ_H"])
-+
- dnl --enable-debug=(yes|no)
- AC_ARG_ENABLE([debug],
-               [AC_HELP_STRING([--enable-debug=no/yes],
diff --git a/meta/recipes-extended/augeas/augeas/sepbuildfix.patch b/meta/recipes-extended/augeas/augeas/sepbuildfix.patch
deleted file mode 100644
index b82a3ee..0000000
--- a/meta/recipes-extended/augeas/augeas/sepbuildfix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Ensure that builds in separate builddirs (${B} != ${S}) correctly install the 
-lenses files.
-
-Upstream-Status: Pending
-
-RP 2013/4/17
-
-Index: augeas-1.0.0/Makefile.am
-===================================================================
---- augeas-1.0.0.orig/Makefile.am	2012-11-02 15:20:11.000000000 +0000
-+++ augeas-1.0.0/Makefile.am	2013-04-17 10:36:24.033400125 +0000
-@@ -5,8 +5,8 @@
- lensdir=$(datadir)/augeas/lenses/dist
- lenstestdir=$(datadir)/augeas/lenses/dist/tests
- 
--dist_lens_DATA=$(wildcard lenses/*.aug)
--dist_lenstest_DATA=$(wildcard lenses/tests/*.aug)
-+dist_lens_DATA=$(wildcard $(top_srcdir)/lenses/*.aug)
-+dist_lenstest_DATA=$(wildcard $(top_srcdir)lenses/tests/*.aug)
- 
- EXTRA_DIST=augeas.spec build/aux/move-if-change Makefile.am HACKING
- 
diff --git a/meta/recipes-extended/augeas/augeas_1.4.0.bb b/meta/recipes-extended/augeas/augeas_1.4.0.bb
deleted file mode 100644
index 1064ad4..0000000
--- a/meta/recipes-extended/augeas/augeas_1.4.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require augeas.inc
-
-SRC_URI[md5sum] = "a2536a9c3d744dc09d234228fe4b0c93"
-SRC_URI[sha256sum] = "659fae7ac229029e60a869a3b88c616cfd51cf2fba286cdfe3af3a052cb35b30"
-- 
2.8.1


