Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TWllW-0006pB-SI
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Nov 2012 11:24:47 +0100
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 09 Nov 2012 02:10:57 -0800
Received: by mail-wg0-f69.google.com with SMTP id 16so2644621wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2012 02:10:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=JUjLY22emoIjEHhVpZZ7nOOJondf0xq8dAdTx6RS1mg=;
	b=Uv+M63gM6bAad2MJE1bJNI69kC+1c3KK/ULYJVk8uuzeyx1vgnLPE0EinHgDxsrQ0N
	LmhpojeYrAJfXdG6L9cY1IMorR7lUh5bQpbS/YBZr9EG8glOvq/C36v+RLBNCOI5O9kr
	1OKJwNUnWcxmO+KUGOrYTyCpjboF8/U+bUxOFYpbrVx4eIsucnhMgzEWyXRvvfkM3mSX
	kMBJD8xygJEpEzPX2YUYVIK4fsO1AtACkBhXjPiqTgEiQdxkQ9ueFQuZU/2QR8kkXoNh
	p6ym5hZ1sCR6Um0Qsxj6ok/TjH8STXo6UzibTzqkjUhWEfR7ik5TG5rfAM+R4U/pZOZO
	H8lQ==
Received: by 10.216.197.205 with SMTP id t55mr4732273wen.156.1352455857735;
	Fri, 09 Nov 2012 02:10:57 -0800 (PST)
Received: by 10.216.197.205 with SMTP id t55mr4732254wen.156.1352455857436;
	Fri, 09 Nov 2012 02:10:57 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hf10sm1514085wib.0.2012.11.09.02.10.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Nov 2012 02:10:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2012 10:09:29 +0000
Message-Id: <154a30032b03a9ce269752adbf5bbec85205720e.1352455397.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1352455397.git.ross.burton@intel.com>
References: <cover.1352455397.git.ross.burton@intel.com>
In-Reply-To: <cover.1352455397.git.ross.burton@intel.com>
References: <cover.1352455397.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlfqKAkhhUdmw1rrti8ZSPM0dq571Z0nkOkuKGf+LT6IeI0SZ1j7ZHBdEm2zxk3Afd/L31a6NAhDBr0tROYh9NjV/3rHNJRL/lK71ibEVVqvqdBAN29j43pkb94/wfZGte2CXBIldKJXUrT+5rypDng+erOrFg2tDl7y+cXJr2RvELM8O4HxwXE/l4JI1n5E6woNQFv
Subject: [PATCH 2/2] meta: remove redundant _FOR_BUILD variables
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
X-List-Received-Date: Fri, 09 Nov 2012 10:24:47 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/binutils/binutils.inc    |    4 ++--
 meta/recipes-devtools/rpm/rpm_5.4.9.bb         |    1 -
 meta/recipes-extended/bash/bash.inc            |    1 -
 meta/recipes-gnome/gnome/metacity_2.30.3.bb    |    5 ++---
 meta/recipes-graphics/mutter/mutter.inc        |    5 ++---
 meta/recipes-graphics/xorg-lib/libx11.inc      |    8 ++------
 meta/recipes-kernel/systemtap/systemtap_git.bb |    4 ----
 meta/recipes-support/gmp/gmp_4.2.1.bb          |    2 --
 meta/recipes-support/gmp/gmp_5.0.5.bb          |    2 --
 9 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index ff64882..1e59296 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -76,9 +76,9 @@ export RANLIB_FOR_TARGET = "${TARGET_PREFIX}ranlib"
 export CC_FOR_HOST = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
 export CXX_FOR_HOST = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
 
+# autotools.bbclass sets the _FOR_BUILD variables, but for some reason we need
+# to unset LD_LIBRARY_PATH.
 export CC_FOR_BUILD = "LD_LIBRARY_PATH= ${BUILD_CC}"
-export CPP_FOR_BUILD = "${BUILD_CPP}"
-export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
 
 MULTIARCH := "${@bb.utils.contains("DISTRO_FEATURES", "multiarch", "yes", "no", d)}"
 do_configure[vardeps] += "MULTIARCH"
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 3268160..0721284 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -350,7 +350,6 @@ do_configure() {
 	    -e 's/pkg-config uuid/pkg-config ossp-uuid/g' -i configure
 
 	export varprefix=${localstatedir}
-	export CC_FOR_BUILD="${BUILD_CC}"
 	oe_runconf
 }
 
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index ae4b681..f1de931 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -9,7 +9,6 @@ inherit autotools gettext update-alternatives
 PARALLEL_MAKE = ""
 
 EXTRA_OECONF = "--enable-job-control"
-export CC_FOR_BUILD = "${BUILD_CC}"
 
 ALTERNATIVE_${PN} = "sh"
 ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
diff --git a/meta/recipes-gnome/gnome/metacity_2.30.3.bb b/meta/recipes-gnome/gnome/metacity_2.30.3.bb
index 3524f0e..5b996d2 100644
--- a/meta/recipes-gnome/gnome/metacity_2.30.3.bb
+++ b/meta/recipes-gnome/gnome/metacity_2.30.3.bb
@@ -23,9 +23,8 @@ EXTRA_OECONF += "--disable-verbose \
 do_configure_prepend() {
 	sed -i -e 's:$ZENITY:$NOZENITY:g' -e 's:-Werror::g' ${S}/configure.in
 }
-export CC_FOR_BUILD = "${BUILD_CC}"
-export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS} -I${STAGING_LIBDIR_NATIVE}/glib-2.0/include -I${STAGING_INCDIR_NATIVE}/glib-2.0 -I${STAGING_INCDIR_NATIVE}/glib-2.0/include -I${STAGING_INCDIR_NATIVE}"
-export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS} -L${STAGING_LIBDIR_NATIVE} -lglib-2.0"
+CFLAGS_FOR_BUILD += "-I${STAGING_LIBDIR_NATIVE}/glib-2.0/include -I${STAGING_INCDIR_NATIVE}/glib-2.0 -I${STAGING_INCDIR_NATIVE}/glib-2.0/include -I${STAGING_INCDIR_NATIVE}"
+LDFLAGS_FOR_BUILD += "-L${STAGING_LIBDIR_NATIVE} -lglib-2.0"
 
 FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
 
diff --git a/meta/recipes-graphics/mutter/mutter.inc b/meta/recipes-graphics/mutter/mutter.inc
index da78827..942349f 100644
--- a/meta/recipes-graphics/mutter/mutter.inc
+++ b/meta/recipes-graphics/mutter/mutter.inc
@@ -20,9 +20,8 @@ EXTRA_OECONF += "--disable-verbose	\
 FILES_${PN} += "${datadir}/themes ${libdir}/mutter/plugins/*.so ${datadir}/gnome/wm-properties/"
 FILES_${PN}-dbg += "${libdir}/mutter/plugins/.debug/*"
 
-export CC_FOR_BUILD = "${BUILD_CC}"
-export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE}/glib-2.0 -I${STAGING_INCDIR_NATIVE}/glib-2.0/include"
-export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS} -L${STAGING_LIBDIR_NATIVE} -lglib-2.0"
+CFLAGS_FOR_BUILD += "-I${STAGING_INCDIR_NATIVE}/glib-2.0 -I${STAGING_INCDIR_NATIVE}/glib-2.0/include"
+LDFLAGS_FOR_BUILD += "-L${STAGING_LIBDIR_NATIVE} -lglib-2.0"
 
 do_configure_prepend () {
         echo "EXTRA_DIST=" > ${S}/gnome-doc-utils.make
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 71e74f7..e0fce3e 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -30,12 +30,8 @@ EXTRA_OEMAKE += 'CWARNFLAGS=""'
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
 
-# src/util/makekeys needs to be compiled natively, so tell it what compiler to
-# use.
-export CC_FOR_BUILD = "${BUILD_CC}"
-export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS} -D_GNU_SOURCE"
-export CPPFLAGS_FOR_BUILD = "${BUILD_CPPFLAGS}"
-export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
+# src/util/makekeys is built natively but needs -D_GNU_SOURCE defined.
+CPPFLAGS_FOR_BUILD += "-D_GNU_SOURCE"
 
 PACKAGES =+ "${PN}-xcb"
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 9e88ee9..a490a2e 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -8,10 +8,6 @@ DEPENDS_class-nativesdk = "nativesdk-elfutils nativesdk-sqlite3 nativesdk-gettex
 
 PR = "r0"
 
-export CC_FOR_BUILD = "${BUILD_CC}"
-export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
-export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
-
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
             --without-nss --without-avahi \
             --disable-server --disable-grapher "
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index 1f86a65..49ee59b 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -16,6 +16,4 @@ SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
 SRC_URI[sha256sum] = "d07ffcb37eecec35c5ec72516d10b35fdf6e6fef1fcf1dcd37e30b8cbf8bf941"
 
-export CC_FOR_BUILD = "${BUILD_CC}"
-
 inherit autotools
diff --git a/meta/recipes-support/gmp/gmp_5.0.5.bb b/meta/recipes-support/gmp/gmp_5.0.5.bb
index 2058868..d91340c 100644
--- a/meta/recipes-support/gmp/gmp_5.0.5.bb
+++ b/meta/recipes-support/gmp/gmp_5.0.5.bb
@@ -8,7 +8,5 @@ SRC_URI_append = " file://use-includedir.patch \
                    file://gmp_fix_for_automake-1.12.patch \
                    "
 
-export CC_FOR_BUILD = "${BUILD_CC}"
-
 SRC_URI[md5sum] = "041487d25e9c230b0c42b106361055fe"
 SRC_URI[sha256sum] = "1f588aaccc41bb9aed946f9fe38521c26d8b290d003c5df807f65690f2aadec9"
-- 
1.7.10



