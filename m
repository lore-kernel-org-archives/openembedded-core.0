Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBL-0001jA-GJ
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:35 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:05 -0700
Received: by mail-wg0-f43.google.com with SMTP id dr1so617826wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=DxkmL2ximdt0p2sNHFolltKeU2EdMKT+fC28aitEFbg=;
	b=d6SB9mFRPlXZXv7/cmJSi/cgdL15EhuRmuIV4EmuTxJEhvBW4Kvnvh2QKSafLKmV/d
	7Lx+yByTaTa9ovJG+9HdTMLbPCJRizgVt9Iw4x5VId/Jxr5u33+CVgwe6GaN8rZmEppe
	iTThv/CyYlsztleBfWoh0KeM3uv68G1XqSEjt3utiiq4/QPtPmjnKyeofWBAH7dbdagW
	8ITbnbb17jNVjGdtP548pFxkpkBNvWPKgboo1LS+VDPo0kUX5RQQXHAVk3zqoo1jVXEL
	ACncTV9yxX7+Er6jGG5kyVaYe1T+9+68ozgpReaJC1n1En189KMBhg+n89Nhg3XZcjoZ
	trsQ==
Received: by 10.180.106.130 with SMTP id gu2mr27118826wib.20.1347391145275;
	Tue, 11 Sep 2012 12:19:05 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:17:56 +0100
Message-Id: <1347391088-30390-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlQpWlmNtblH0GEWQEszzNJULmGx7BckZ+jU22tlEvCLdKAD5XialWysvuLy3F+xitzEPOw
Subject: [RFC 06/18] libx11: move keysymdefdir option to .inc
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:35 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb |    2 --
 meta/recipes-graphics/xorg-lib/libx11.inc           |    4 +++-
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb      |    2 --
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index dd9e7d9..9a7de33 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -25,6 +25,6 @@ DEPENDS += "libxcb bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
 
 FILESDIR = "${@os.path.dirname(d.getVar('FILE', True))}/libx11"
 
-EXTRA_OECONF += "--disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
+EXTRA_OECONF += "--disable-xlocale"
 CFLAGS += "-D_GNU_SOURCE"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
index 9e88d45..714b993 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
@@ -18,5 +18,3 @@ RPROVIDES_${PN}-locale = "libx11-locale"
 
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
 SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
-
-EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/"
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 22b26cc..a524c5f 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -9,7 +9,7 @@ require xorg-lib-common.inc
 inherit siteinfo
 
 PE = "1"
-INC_PR = "r3"
+INC_PR = "r4"
 
 PROVIDES = "virtual/libx11"
 
@@ -23,6 +23,8 @@ FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/X
 FILES_${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
 
+EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/"
+
 # Almost nothing uses XCMS
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
index 2e47899..0ba0f9b 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
@@ -5,8 +5,6 @@ PR = "${INC_PR}.0"
 
 BBCLASSEXTEND = "native nativesdk"
 
-EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11"
-
 DEPENDS += "util-macros xtrans libxdmcp libxau \
             bigreqsproto xproto xextproto xcmiscproto \
             xf86bigfontproto kbproto inputproto libxcb \
-- 
1.7.10



