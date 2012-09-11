Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBU-0001kd-FC
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:44 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:02 -0700
Received: by mail-wi0-f171.google.com with SMTP id hq4so3527991wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=1p3wM4aH1yy1ANJzw2voJFRkQXgIloy4RD9AqBHN1VE=;
	b=Sug1QxTloU7571D2D6vdgC+0k5ammPb82fqm3eHbIgKP/NkJO7E/Eb29LkEhPcFwuU
	6nob8xRVgWZzy6AHVS1grULnMrLBUXlvq+1TQeOsw1E1F7L3jIFf/0h2rgnpyd/sX9u3
	0jYCxxOj8dlSLliKzXbI8wpcvyzrvibvdjEqdFQlqzkQ+Ivi3bhtjeBKW5C981eW7zC2
	3288bALPdwAXIRKmAGVFAY0PR/FX3RCHvNFQgV6HLPe2seSenVSUmcmvCNwzCFoANcCM
	h8turu4axuygiFMXUW3jLVRqfY1z7LAtU+OopZDgxYtOGBeW2NIyOM+apBUBGQ0YOSWp
	I3fw==
Received: by 10.216.139.143 with SMTP id c15mr10643773wej.154.1347391150064;
	Tue, 11 Sep 2012 12:19:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:17:59 +0100
Message-Id: <1347391088-30390-9-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl1o41Ul4+JmY8hy8SIQt2OYRaS0ZZ1fNIB7um1Ssln7M581tsEpfkx/xpW/fy/FpFWC6HT
Subject: [RFC 09/18] libx11: refresh dependencies, and centralise into libx11.inc
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:44 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    3 ---
 meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb |    2 --
 meta/recipes-graphics/xorg-lib/libx11.inc           |    5 ++++-
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb      |    5 -----
 4 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index 04ee1b8..50000ab 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -18,9 +18,6 @@ RPROVIDES_${PN}-locale = "libx11-locale"
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
 SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
 
-DEPENDS += "libxcb bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
-            libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
-
 FILESDIR = "${@os.path.dirname(d.getVar('FILE', True))}/libx11"
 
 EXTRA_OECONF += "--disable-xlocale"
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
index 6550903..6619946 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
@@ -4,8 +4,6 @@ DESCRIPTION += " Support for XCMS is disabled in this version."
 
 PR = "${INC_PR}.0"
 
-DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
-
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://keysymdef_include.patch \
             file://makekeys_crosscompile.patch"
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 1e9f942..85fdbe7 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -11,7 +11,7 @@ inherit siteinfo
 FILESPATH = "${FILE_DIRNAME}/libx11"
 
 PE = "1"
-INC_PR = "r5"
+INC_PR = "r6"
 
 PROVIDES = "virtual/libx11"
 
@@ -19,6 +19,9 @@ XORG_PN = "libX11"
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
+DEPENDS += "xproto xextproto xtrans libxcb kbproto inputproto"
+DEPENDS += "xf86bigfontproto xproto-native"
+
 PACKAGES =+ "${PN}-xcb"
 
 FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
index 0ba0f9b..c138785 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
@@ -5,11 +5,6 @@ PR = "${INC_PR}.0"
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS += "util-macros xtrans libxdmcp libxau \
-            bigreqsproto xproto xextproto xcmiscproto \
-            xf86bigfontproto kbproto inputproto libxcb \
-            xproto-native"
-
 SRC_URI += " file://keysymdef_include.patch \
              file://x11_disable_makekeys.patch \
              file://makekeys_crosscompile.patch \
-- 
1.7.10



