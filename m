Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R2TvD-0004vV-Px
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 22:13:04 +0200
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 53CFDA6152;
	Sat, 10 Sep 2011 22:07:55 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Sep 2011 22:07:46 +0200
Message-Id: <1315685266-16987-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1315685266-16987-1-git-send-email-eric@eukrea.com>
References: <1315685266-16987-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] qt4: update to latest version 4.7.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Sep 2011 20:13:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- 4.7.4 was release on the 1st of september, the changelog is available
here : http://qt.gitorious.org/+qt-developers/qt/releases/blobs/v4.7.4/di=
st/changes-4.7.4
and mostly contains bug fix.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   32 +++++-----
 meta/recipes-qt/qt4/qt-4.7.3.inc                   |   61 --------------=
----
 .../0001-Added-Openembedded-crossarch-option.patch |   47 --------------
 meta/recipes-qt/qt4/qt-4.7.3/g++.conf              |   60 --------------=
----
 .../qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch          |   31 ---------
 meta/recipes-qt/qt4/qt-4.7.3/linux.conf            |   66 --------------=
------
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |   61 ++++++++++++++=
++++
 .../0001-Added-Openembedded-crossarch-option.patch |   47 ++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.4/g++.conf              |   60 ++++++++++++++=
++++
 .../qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch          |   31 +++++++++
 meta/recipes-qt/qt4/qt-4.7.4/linux.conf            |   66 ++++++++++++++=
++++++
 meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb          |   10 ---
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |   10 +++
 meta/recipes-qt/qt4/qt4-native_4.7.3.bb            |   15 -----
 meta/recipes-qt/qt4/qt4-native_4.7.4.bb            |   15 +++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb   |    8 ---
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |    8 +++
 meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb          |   12 ----
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |   12 ++++
 19 files changed, 326 insertions(+), 326 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/qt-4.7.3.inc
 delete mode 100644 meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-=
crossarch-option.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-4.7.3/g++.conf
 delete mode 100644 meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-4.7.3/linux.conf
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4.inc
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-=
crossarch-option.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/g++.conf
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/linux.conf
 delete mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.7.3.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-native_4.7.4.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/c=
onf/distro/include/distro_tracking_fields.inc
index 6f1a462..599406b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3406,32 +3406,32 @@ RECIPE_LAST_UPDATE_pn-imake =3D "Nov 21, 2010"
 RECIPE_MAINTAINER_pn-imake =3D "Yu Ke <ke.yu@intel.com>"
=20
 RECIPE_STATUS_pn-qt4-tools-native =3D "green" # no update needed
-RECIPE_LATEST_VERSION_pn-qt4-tools-native =3D "4.7.3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native =3D "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native =3D "2011/05/04"
-RECIPE_LAST_UPDATE_pn-qt4-tools-native =3D "May 12, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-tools-native =3D "4.7.4"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native =3D "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native =3D "2011/09/01"
+RECIPE_LAST_UPDATE_pn-qt4-tools-native =3D "September 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-tools-native =3D "Paul Eggleton <paul.eggleton@=
linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-tools-native =3D "Mandriva=3Dlibqt4-devel Ubuntu=3D=
libqt4-dev"
=20
 RECIPE_STATUS_pn-qt4-tools-nativesdk =3D "green"
-RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk =3D "4.7.3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk =3D "2 mont=
hs"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk =3D "2011/05/04"
-RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk =3D "May 12, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk =3D "4.7.4"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk =3D "4 mont=
hs"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk =3D "2011/09/01"
+RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk =3D "September 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-tools-nativesdk =3D "Paul Eggleton <paul.egglet=
on@linux.intel.com>"
=20
 RECIPE_STATUS_pn-qt4-embedded =3D "green"
-RECIPE_LATEST_VERSION_pn-qt4-embedded =3D "4.7.3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded =3D "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded =3D "2011/05/04"
-RECIPE_LAST_UPDATE_pn-qt4-embedded =3D "May 12, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-embedded =3D "4.7.4"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded =3D "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded =3D "2011/09/01"
+RECIPE_LAST_UPDATE_pn-qt4-embedded =3D "September 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-embedded =3D "Paul Eggleton <paul.eggleton@linu=
x.intel.com>"
=20
 RECIPE_STATUS_pn-qt4-x11-free =3D "green"
-RECIPE_LATEST_VERSION_pn-qt4-x11-free =3D "4.7.3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free =3D "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free =3D "2011/05/04"
-RECIPE_LAST_UPDATE_pn-qt4-x11-free =3D "May 12, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-x11-free =3D "4.7.4"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free =3D "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free =3D "2011/09/01"
+RECIPE_LAST_UPDATE_pn-qt4-x11-free =3D "September 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-x11-free =3D "Paul Eggleton <paul.eggleton@linu=
x.intel.com"
 DISTRO_PN_ALIAS_pn-qt4-x11-free =3D "Ubuntu=3Dqt-x11-free Debian=3Dqt-x1=
1-free"
=20
diff --git a/meta/recipes-qt/qt4/qt-4.7.3.inc b/meta/recipes-qt/qt4/qt-4.=
7.3.inc
deleted file mode 100644
index a5b8b05..0000000
--- a/meta/recipes-qt/qt4/qt-4.7.3.inc
+++ /dev/null
@@ -1,61 +0,0 @@
-LICENSE =3D "LGPLv2.1 | GPLv3"
-LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3Dfbc093901857fcd118f065f9=
00982c24 \
-                    file://LICENSE.GPL3;md5=3Dbabc5b6b77441da277f5c06b2e=
547720 \
-                    file://LGPL_EXCEPTION.txt;md5=3D411080a56ff917a5a1aa=
08c98acae354"
-
-FILESPATH =3D. "${FILE_DIRNAME}/qt-${PV}:"
-
-SRC_URI =3D "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-=
src-${PV}.tar.gz \
-           file://0004-no-qmake.patch \
-           file://hack-out-pg2-4.7.0.patch \
-           file://0006-freetype-host-includes.patch \
-           file://0008-qt-lib-infix.patch \
-           file://0009-support-2bpp.patch \
-           file://0001-Added-Openembedded-crossarch-option.patch \
-           file://blacklist-diginotar-certs.diff \
-           file://g++.conf \
-           file://linux.conf \
-           "
-
-SRC_URI[md5sum] =3D "49b96eefb1224cc529af6fe5608654fe"
-SRC_URI[sha256sum] =3D "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956=
e328c2991905937e"
-
-S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-FILES_${QT_BASE_NAME}-tools                +=3D "${bindir}/qml"
-
-do_configure_prepend() {
-    for pro in $(find ${S} -name "*.pro") ; do
-        sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $=
pro
-    done
-
-    sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
-    sed -i \
-    -e /QMAKE_MOC\ /d \
-    -e /QMAKE_UIC\ /d \
-    -e /QMAKE_UIC3\ /d \
-    -e /QMAKE_RCC\ /d \
-    ${S}/configure
-}
-
-do_configure_append() {
-    sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makef=
ile
-}
-
-QT_GLFLAGS ?=3D ""
-QT_CONFIG_FLAGS +=3D " -xmlpatterns -no-rpath -qt3support -reduce-reloca=
tions -silent ${QT_GLFLAGS}"
-
-do_compile() {
-    # Fixup missing wsegl header in some SGX SDKs
-    if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
-        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/Q=
WSWSEGL/
-    fi
-
-    unset CFLAGS CXXFLAGS
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrelease
-
-    oe_runmake ${EXTRA_ENV}
-}
diff --git a/meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-crossar=
ch-option.patch b/meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-cr=
ossarch-option.patch
deleted file mode 100644
index f302c5b..0000000
--- a/meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-crossarch-opti=
on.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From b1ba119f6a824dc01bd42ee00dba4a1653867b72 Mon Sep 17 00:00:00 2001
-From: Matthias G=C3=BCnther <matgnt@gmail.com>
-Date: Wed, 12 May 2010 16:52:45 +0200
-Subject: [PATCH 1/9] Added Openembedded "-crossarch" option
-
-Original Author: Michael Lauer <mickey@vanille-media.de>
-Upstream-Status: Pending
-
----
- configure |    7 ++++++-
- 1 files changed, 6 insertions(+), 1 deletions(-)
-
-diff --git a/configure b/configure
-index facd192..9d15136 100755
---- a/configure
-+++ b/configure
-@@ -954,7 +954,7 @@ while [ "$#" -gt 0 ]; do
-         shift
-         VAL=3D$1
-         ;;
--    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-=
bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-=
nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config=
)
-+    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-=
bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-=
nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config=
|-crossarch)
-         VAR=3D`echo $1 | sed "s,^-\(.*\),\1,"`
-         shift
-         VAL=3D"$1"
-@@ -1443,6 +1443,9 @@ while [ "$#" -gt 0 ]; do
-     xplatform)
-         XPLATFORM=3D"$VAL"
-         ;;
-+	crossarch)
-+		CROSSARCH=3D"$VAL"
-+		;;
-     debug-and-release)
-         if [ "$VAL" =3D "yes" ] || [ "$VAL" =3D "no" ]; then
-             CFG_DEBUG_RELEASE=3D"$VAL"
-@@ -2918,6 +2921,8 @@ elif [ "$PLATFORM_MAC" =3D "yes" ] || [ -z "$CFG_A=
RCH" ]; then
-     CFG_ARCH=3D$CFG_HOST_ARCH
- fi
-=20
-+CFG_ARCH=3D"$CROSSARCH"
-+
- if [ -d "$relpath/src/corelib/arch/$CFG_ARCH" ]; then
-     if [ "$OPT_VERBOSE" =3D "yes" ]; then
-         echo "    '$CFG_ARCH' is supported"
---=20
-1.7.0.4
-
diff --git a/meta/recipes-qt/qt4/qt-4.7.3/g++.conf b/meta/recipes-qt/qt4/=
qt-4.7.3/g++.conf
deleted file mode 100644
index 80f925c..0000000
--- a/meta/recipes-qt/qt4/qt-4.7.3/g++.conf
+++ /dev/null
@@ -1,60 +0,0 @@
-#
-# qmake configuration for common gcc
-#
-
-QMAKE_CC       =3D $(OE_QMAKE_CC)
-QMAKE_CFLAGS       +=3D -pipe $(OE_QMAKE_CFLAGS)
-QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO +=3D $(OE_QMAKE_CFLAGS)
-QMAKE_CFLAGS_DEPS	+=3D -M
-QMAKE_CFLAGS_WARN_ON	+=3D -Wall -W
-QMAKE_CFLAGS_WARN_OFF	+=3D -w
-QMAKE_CFLAGS_RELEASE	+=3D
-QMAKE_CFLAGS_DEBUG	+=3D -g
-QMAKE_CFLAGS_SHLIB	+=3D -fPIC
-QMAKE_CFLAGS_STATIC_LIB	+=3D -fPIC
-QMAKE_CFLAGS_YACC	+=3D -Wno-unused -Wno-parentheses
-QMAKE_CFLAGS_HIDESYMS   +=3D -fvisibility=3Dhidden
-QMAKE_CFLAGS_PRECOMPILE +=3D -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAK=
E_PCH_OUTPUT}
-QMAKE_CFLAGS_USE_PRECOMPILE +=3D -include ${QMAKE_PCH_OUTPUT_BASE}
-
-QMAKE_CXX      =3D $(OE_QMAKE_CXX)
-QMAKE_CXXFLAGS     +=3D $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS)
-QMAKE_CXXFLAGS_DEPS	+=3D $$QMAKE_CFLAGS_DEPS
-QMAKE_CXXFLAGS_WARN_ON	+=3D $$QMAKE_CFLAGS_WARN_ON
-QMAKE_CXXFLAGS_WARN_OFF	+=3D $$QMAKE_CFLAGS_WARN_OFF
-QMAKE_CXXFLAGS_RELEASE	+=3D $$QMAKE_CFLAGS_RELEASE
-QMAKE_CXXFLAGS_RELEASE_WITH_DEBUGINFO +=3D $$QMAKE_CFLAGS_RELEASE_WITH_D=
EBUGINFO
-QMAKE_CXXFLAGS_DEBUG	+=3D $$QMAKE_CFLAGS_DEBUG
-QMAKE_CXXFLAGS_SHLIB	+=3D $$QMAKE_CFLAGS_SHLIB
-QMAKE_CXXFLAGS_STATIC_LIB +=3D $$QMAKE_CFLAGS_STATIC_LIB
-QMAKE_CXXFLAGS_YACC	+=3D $$QMAKE_CFLAGS_YACC
-QMAKE_CXXFLAGS_HIDESYMS +=3D $$QMAKE_CFLAGS_HIDESYMS -fvisibility-inline=
s-hidden
-QMAKE_CXXFLAGS_PRECOMPILE +=3D -x c++-header -c ${QMAKE_PCH_INPUT} -o ${=
QMAKE_PCH_OUTPUT}
-QMAKE_CXXFLAGS_USE_PRECOMPILE =3D $$QMAKE_CFLAGS_USE_PRECOMPILE
-
-QMAKE_LINK     =3D $(OE_QMAKE_LINK)
-QMAKE_LINK_SHLIB   =3D $(OE_QMAKE_LINK)
-QMAKE_LINK_C		=3D $(OE_QMAKE_LINK)
-QMAKE_LINK_C_SHLIB	=3D $(OE_QMAKE_LINK)
-QMAKE_LFLAGS       +=3D $(OE_QMAKE_LDFLAGS)
-QMAKE_LFLAGS_RELEASE	+=3D
-QMAKE_LFLAGS_DEBUG	+=3D
-QMAKE_LFLAGS_APP	+=3D
-QMAKE_LFLAGS_SHLIB	+=3D -shared
-QMAKE_LFLAGS_PLUGIN	+=3D $$QMAKE_LFLAGS_SHLIB
-QMAKE_LFLAGS_SONAME	+=3D -Wl,-soname,
-QMAKE_LFLAGS_THREAD	+=3D
-QMAKE_LFLAGS_NOUNDEF	+=3D -Wl,--no-undefined
-QMAKE_LFLAGS_RPATH        =3D -Wl,-rpath-link,
-
-QMAKE_PCH_OUTPUT_EXT    =3D .gch
-
-# -Bsymbolic-functions (ld) support
-QMAKE_LFLAGS_BSYMBOLIC_FUNC =3D -Wl,-Bsymbolic-functions
-QMAKE_LFLAGS_DYNAMIC_LIST =3D -Wl,--dynamic-list,
-
-# some linking helper...
-CONFIG +=3D rpath_libdirs
-
-# for the SDK
-isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $(OE_QMAKE_QT_CONFIG)
diff --git a/meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch b/meta=
/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
deleted file mode 100644
index 39c5f4a..0000000
--- a/meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Hack to not use the pg_config of the host system which will add /usr/inc=
lude
-
-pg_config is a native binary so using that when cross compiling
-will always fail.  The commented out fix would do, but for OE
-our -platform and -xplatform is the same so we are actually not
-really cross compiling. Just comment out the test, we are passing
-the location to the postgres headers and if they are okay we
-will pad.
-
-Original Author: Holger Hans Peter Freyther <zecke@selfish.org>
-Upstream-Status: Inappropriate [configuration]
-
-Index: qt-everywhere-opensource-src-4.7.0/configure
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- qt-everywhere-opensource-src-4.7.0.orig/configure	2010-09-22 15:43:5=
1.191162141 -0400
-+++ qt-everywhere-opensource-src-4.7.0/configure	2010-09-22 15:44:35.179=
981232 -0400
-@@ -4921,10 +4921,10 @@
-         psql)
-             if [ "$CFG_SQL_psql" !=3D "no" ]; then
-                 # Be careful not to use native pg_config when cross bui=
lding.
--                if [ "$XPLATFORM_MINGW" !=3D "yes" ] && "$WHICH" pg_con=
fig >/dev/null 2>&1; then
--                    QT_CFLAGS_PSQL=3D`pg_config --includedir 2>/dev/nul=
l`
--                    QT_LFLAGS_PSQL=3D`pg_config --libdir 2>/dev/null`
--                fi
-+#                if [ "$XPLATFORM_MINGW" !=3D "yes" ] && "$WHICH" pg_co=
nfig >/dev/null 2>&1; then
-+#                    QT_CFLAGS_PSQL=3D`pg_config --includedir 2>/dev/nu=
ll`
-+#                    QT_LFLAGS_PSQL=3D`pg_config --libdir 2>/dev/null`
-+#                fi
-                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL=3D"-I$QT_CFL=
AGS_PSQL"
-                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL=3D"-L$QT_LFL=
AGS_PSQL"
-                 # But, respect PSQL_LIBS if set
diff --git a/meta/recipes-qt/qt4/qt-4.7.3/linux.conf b/meta/recipes-qt/qt=
4/qt-4.7.3/linux.conf
deleted file mode 100644
index a541355..0000000
--- a/meta/recipes-qt/qt4/qt-4.7.3/linux.conf
+++ /dev/null
@@ -1,66 +0,0 @@
-#
-# qmake configuration for common linux
-#
-
-QMAKE_CFLAGS_THREAD	+=3D -D_REENTRANT
-QMAKE_CXXFLAGS_THREAD	+=3D $$QMAKE_CFLAGS_THREAD
-
-QMAKE_INCDIR          =3D
-QMAKE_LIBDIR          =3D
-QMAKE_INCDIR_X11      =3D
-QMAKE_LIBDIR_X11      =3D
-QMAKE_INCDIR_QT       =3D $(OE_QMAKE_INCDIR_QT)
-QMAKE_LIBDIR_QT       =3D $(OE_QMAKE_LIBDIR_QT)
-QMAKE_INCDIR_OPENGL   =3D
-QMAKE_LIBDIR_OPENGL   =3D
-QMAKE_INCDIR_OPENGL_ES1 =3D $$QMAKE_INCDIR_OPENGL
-QMAKE_LIBDIR_OPENGL_ES1 =3D $$QMAKE_LIBDIR_OPENGL
-QMAKE_INCDIR_OPENGL_ES2 =3D $$QMAKE_INCDIR_OPENGL
-QMAKE_LIBDIR_OPENGL_ES2 =3D $$QMAKE_LIBDIR_OPENGL
-QMAKE_INCDIR_EGL      =3D
-QMAKE_LIBDIR_EGL      =3D
-QMAKE_INCDIR_OPENVG   =3D
-QMAKE_LIBDIR_OPENVG   =3D
-
-
-QMAKE_LIBS            =3D
-QMAKE_LIBS_DYNLOAD    =3D -ldl
-QMAKE_LIBS_X11        =3D $(OE_QMAKE_LIBS_X11)
-QMAKE_LIBS_X11SM      =3D $(OE_QMAKE_LIBS_X11SM)
-QMAKE_LIBS_NIS        =3D -lnsl
-QMAKE_LIBS_EGL        =3D -lEGL
-QMAKE_LIBS_OPENGL     =3D -lGLU -lGL
-QMAKE_LIBS_OPENGL_QT  =3D -lGL
-QMAKE_LIBS_OPENGL_ES1 =3D -lGLES_CM
-QMAKE_LIBS_OPENGL_ES2 =3D -lGLESv2
-QMAKE_LIBS_OPENVG     =3D -lOpenVG
-QMAKE_LIBS_THREAD     =3D -lpthread
-
-QMAKE_MOC             =3D $(OE_QMAKE_MOC)
-QMAKE_UIC             =3D $(OE_QMAKE_UIC)
-QMAKE_UIC3            =3D $(OE_QMAKE_UIC3)
-QMAKE_RCC             =3D $(OE_QMAKE_RCC)
-QMAKE_QDBUSCPP2XML    =3D $(OE_QMAKE_QDBUSCPP2XML)
-QMAKE_QDBUSXML2CPP    =3D $(OE_QMAKE_QDBUSXML2CPP)
-
-QMAKE_AR              =3D $(OE_QMAKE_AR) cqs
-QMAKE_OBJCOPY         =3D objcopy
-QMAKE_RANLIB          =3D
-
-QMAKE_TAR             =3D tar -cf
-QMAKE_GZIP            =3D gzip -9f
-
-QMAKE_COPY            =3D cp -f
-QMAKE_COPY_FILE       =3D $(COPY)
-QMAKE_COPY_DIR        =3D $(COPY) -r
-QMAKE_MOVE            =3D mv -f
-QMAKE_DEL_FILE        =3D rm -f
-QMAKE_DEL_DIR         =3D rmdir
-QMAKE_STRIP           =3D $(OE_QMAKE_STRIP)
-QMAKE_STRIPFLAGS_LIB +=3D --strip-unneeded
-QMAKE_CHK_DIR_EXISTS  =3D test -d
-QMAKE_MKDIR           =3D mkdir -p
-QMAKE_INSTALL_FILE    =3D install -m 644 -p
-QMAKE_INSTALL_PROGRAM =3D install -m 755 -p
-
-include(unix.conf)
diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.=
7.4.inc
new file mode 100644
index 0000000..ac5da9f
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -0,0 +1,61 @@
+LICENSE =3D "LGPLv2.1 | GPLv3"
+LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3Dfbc093901857fcd118f065f9=
00982c24 \
+                    file://LICENSE.GPL3;md5=3Dbabc5b6b77441da277f5c06b2e=
547720 \
+                    file://LGPL_EXCEPTION.txt;md5=3D411080a56ff917a5a1aa=
08c98acae354"
+
+FILESPATH =3D. "${FILE_DIRNAME}/qt-${PV}:"
+
+SRC_URI =3D "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-=
src-${PV}.tar.gz \
+           file://0004-no-qmake.patch \
+           file://hack-out-pg2-4.7.0.patch \
+           file://0006-freetype-host-includes.patch \
+           file://0008-qt-lib-infix.patch \
+           file://0009-support-2bpp.patch \
+           file://0001-Added-Openembedded-crossarch-option.patch \
+           file://blacklist-diginotar-certs.diff \
+           file://g++.conf \
+           file://linux.conf \
+           "
+
+SRC_URI[md5sum] =3D "ddf7d83f912cf1283aa066368464fa22"
+SRC_URI[sha256sum] =3D "321247297648eebd4f1d0195addf51eeb9f1dcf538a78bf3=
c67d11dadbc40faf"
+
+S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
+
+FILES_${QT_BASE_NAME}-tools                +=3D "${bindir}/qml"
+
+do_configure_prepend() {
+    for pro in $(find ${S} -name "*.pro") ; do
+        sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $=
pro
+    done
+
+    sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
+    sed -i \
+    -e /QMAKE_MOC\ /d \
+    -e /QMAKE_UIC\ /d \
+    -e /QMAKE_UIC3\ /d \
+    -e /QMAKE_RCC\ /d \
+    ${S}/configure
+}
+
+do_configure_append() {
+    sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makef=
ile
+}
+
+QT_GLFLAGS ?=3D ""
+QT_CONFIG_FLAGS +=3D " -xmlpatterns -no-rpath -qt3support -reduce-reloca=
tions -silent ${QT_GLFLAGS}"
+
+do_compile() {
+    # Fixup missing wsegl header in some SGX SDKs
+    if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
+        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/Q=
WSWSEGL/
+    fi
+
+    unset CFLAGS CXXFLAGS
+    install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
+    install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
+    install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
+    install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrelease
+
+    oe_runmake ${EXTRA_ENV}
+}
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-crossar=
ch-option.patch b/meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-cr=
ossarch-option.patch
new file mode 100644
index 0000000..f302c5b
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-crossarch-opti=
on.patch
@@ -0,0 +1,47 @@
+From b1ba119f6a824dc01bd42ee00dba4a1653867b72 Mon Sep 17 00:00:00 2001
+From: Matthias G=C3=BCnther <matgnt@gmail.com>
+Date: Wed, 12 May 2010 16:52:45 +0200
+Subject: [PATCH 1/9] Added Openembedded "-crossarch" option
+
+Original Author: Michael Lauer <mickey@vanille-media.de>
+Upstream-Status: Pending
+
+---
+ configure |    7 ++++++-
+ 1 files changed, 6 insertions(+), 1 deletions(-)
+
+diff --git a/configure b/configure
+index facd192..9d15136 100755
+--- a/configure
++++ b/configure
+@@ -954,7 +954,7 @@ while [ "$#" -gt 0 ]; do
+         shift
+         VAL=3D$1
+         ;;
+-    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-=
bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-=
nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config=
)
++    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-=
bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-=
nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config=
|-crossarch)
+         VAR=3D`echo $1 | sed "s,^-\(.*\),\1,"`
+         shift
+         VAL=3D"$1"
+@@ -1443,6 +1443,9 @@ while [ "$#" -gt 0 ]; do
+     xplatform)
+         XPLATFORM=3D"$VAL"
+         ;;
++	crossarch)
++		CROSSARCH=3D"$VAL"
++		;;
+     debug-and-release)
+         if [ "$VAL" =3D "yes" ] || [ "$VAL" =3D "no" ]; then
+             CFG_DEBUG_RELEASE=3D"$VAL"
+@@ -2918,6 +2921,8 @@ elif [ "$PLATFORM_MAC" =3D "yes" ] || [ -z "$CFG_A=
RCH" ]; then
+     CFG_ARCH=3D$CFG_HOST_ARCH
+ fi
+=20
++CFG_ARCH=3D"$CROSSARCH"
++
+ if [ -d "$relpath/src/corelib/arch/$CFG_ARCH" ]; then
+     if [ "$OPT_VERBOSE" =3D "yes" ]; then
+         echo "    '$CFG_ARCH' is supported"
+--=20
+1.7.0.4
+
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/g++.conf b/meta/recipes-qt/qt4/=
qt-4.7.4/g++.conf
new file mode 100644
index 0000000..80f925c
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/g++.conf
@@ -0,0 +1,60 @@
+#
+# qmake configuration for common gcc
+#
+
+QMAKE_CC       =3D $(OE_QMAKE_CC)
+QMAKE_CFLAGS       +=3D -pipe $(OE_QMAKE_CFLAGS)
+QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO +=3D $(OE_QMAKE_CFLAGS)
+QMAKE_CFLAGS_DEPS	+=3D -M
+QMAKE_CFLAGS_WARN_ON	+=3D -Wall -W
+QMAKE_CFLAGS_WARN_OFF	+=3D -w
+QMAKE_CFLAGS_RELEASE	+=3D
+QMAKE_CFLAGS_DEBUG	+=3D -g
+QMAKE_CFLAGS_SHLIB	+=3D -fPIC
+QMAKE_CFLAGS_STATIC_LIB	+=3D -fPIC
+QMAKE_CFLAGS_YACC	+=3D -Wno-unused -Wno-parentheses
+QMAKE_CFLAGS_HIDESYMS   +=3D -fvisibility=3Dhidden
+QMAKE_CFLAGS_PRECOMPILE +=3D -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAK=
E_PCH_OUTPUT}
+QMAKE_CFLAGS_USE_PRECOMPILE +=3D -include ${QMAKE_PCH_OUTPUT_BASE}
+
+QMAKE_CXX      =3D $(OE_QMAKE_CXX)
+QMAKE_CXXFLAGS     +=3D $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS)
+QMAKE_CXXFLAGS_DEPS	+=3D $$QMAKE_CFLAGS_DEPS
+QMAKE_CXXFLAGS_WARN_ON	+=3D $$QMAKE_CFLAGS_WARN_ON
+QMAKE_CXXFLAGS_WARN_OFF	+=3D $$QMAKE_CFLAGS_WARN_OFF
+QMAKE_CXXFLAGS_RELEASE	+=3D $$QMAKE_CFLAGS_RELEASE
+QMAKE_CXXFLAGS_RELEASE_WITH_DEBUGINFO +=3D $$QMAKE_CFLAGS_RELEASE_WITH_D=
EBUGINFO
+QMAKE_CXXFLAGS_DEBUG	+=3D $$QMAKE_CFLAGS_DEBUG
+QMAKE_CXXFLAGS_SHLIB	+=3D $$QMAKE_CFLAGS_SHLIB
+QMAKE_CXXFLAGS_STATIC_LIB +=3D $$QMAKE_CFLAGS_STATIC_LIB
+QMAKE_CXXFLAGS_YACC	+=3D $$QMAKE_CFLAGS_YACC
+QMAKE_CXXFLAGS_HIDESYMS +=3D $$QMAKE_CFLAGS_HIDESYMS -fvisibility-inline=
s-hidden
+QMAKE_CXXFLAGS_PRECOMPILE +=3D -x c++-header -c ${QMAKE_PCH_INPUT} -o ${=
QMAKE_PCH_OUTPUT}
+QMAKE_CXXFLAGS_USE_PRECOMPILE =3D $$QMAKE_CFLAGS_USE_PRECOMPILE
+
+QMAKE_LINK     =3D $(OE_QMAKE_LINK)
+QMAKE_LINK_SHLIB   =3D $(OE_QMAKE_LINK)
+QMAKE_LINK_C		=3D $(OE_QMAKE_LINK)
+QMAKE_LINK_C_SHLIB	=3D $(OE_QMAKE_LINK)
+QMAKE_LFLAGS       +=3D $(OE_QMAKE_LDFLAGS)
+QMAKE_LFLAGS_RELEASE	+=3D
+QMAKE_LFLAGS_DEBUG	+=3D
+QMAKE_LFLAGS_APP	+=3D
+QMAKE_LFLAGS_SHLIB	+=3D -shared
+QMAKE_LFLAGS_PLUGIN	+=3D $$QMAKE_LFLAGS_SHLIB
+QMAKE_LFLAGS_SONAME	+=3D -Wl,-soname,
+QMAKE_LFLAGS_THREAD	+=3D
+QMAKE_LFLAGS_NOUNDEF	+=3D -Wl,--no-undefined
+QMAKE_LFLAGS_RPATH        =3D -Wl,-rpath-link,
+
+QMAKE_PCH_OUTPUT_EXT    =3D .gch
+
+# -Bsymbolic-functions (ld) support
+QMAKE_LFLAGS_BSYMBOLIC_FUNC =3D -Wl,-Bsymbolic-functions
+QMAKE_LFLAGS_DYNAMIC_LIST =3D -Wl,--dynamic-list,
+
+# some linking helper...
+CONFIG +=3D rpath_libdirs
+
+# for the SDK
+isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $(OE_QMAKE_QT_CONFIG)
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch b/meta=
/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch
new file mode 100644
index 0000000..39c5f4a
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch
@@ -0,0 +1,31 @@
+Hack to not use the pg_config of the host system which will add /usr/inc=
lude
+
+pg_config is a native binary so using that when cross compiling
+will always fail.  The commented out fix would do, but for OE
+our -platform and -xplatform is the same so we are actually not
+really cross compiling. Just comment out the test, we are passing
+the location to the postgres headers and if they are okay we
+will pad.
+
+Original Author: Holger Hans Peter Freyther <zecke@selfish.org>
+Upstream-Status: Inappropriate [configuration]
+
+Index: qt-everywhere-opensource-src-4.7.0/configure
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- qt-everywhere-opensource-src-4.7.0.orig/configure	2010-09-22 15:43:5=
1.191162141 -0400
++++ qt-everywhere-opensource-src-4.7.0/configure	2010-09-22 15:44:35.179=
981232 -0400
+@@ -4921,10 +4921,10 @@
+         psql)
+             if [ "$CFG_SQL_psql" !=3D "no" ]; then
+                 # Be careful not to use native pg_config when cross bui=
lding.
+-                if [ "$XPLATFORM_MINGW" !=3D "yes" ] && "$WHICH" pg_con=
fig >/dev/null 2>&1; then
+-                    QT_CFLAGS_PSQL=3D`pg_config --includedir 2>/dev/nul=
l`
+-                    QT_LFLAGS_PSQL=3D`pg_config --libdir 2>/dev/null`
+-                fi
++#                if [ "$XPLATFORM_MINGW" !=3D "yes" ] && "$WHICH" pg_co=
nfig >/dev/null 2>&1; then
++#                    QT_CFLAGS_PSQL=3D`pg_config --includedir 2>/dev/nu=
ll`
++#                    QT_LFLAGS_PSQL=3D`pg_config --libdir 2>/dev/null`
++#                fi
+                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL=3D"-I$QT_CFL=
AGS_PSQL"
+                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL=3D"-L$QT_LFL=
AGS_PSQL"
+                 # But, respect PSQL_LIBS if set
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/linux.conf b/meta/recipes-qt/qt=
4/qt-4.7.4/linux.conf
new file mode 100644
index 0000000..a541355
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/linux.conf
@@ -0,0 +1,66 @@
+#
+# qmake configuration for common linux
+#
+
+QMAKE_CFLAGS_THREAD	+=3D -D_REENTRANT
+QMAKE_CXXFLAGS_THREAD	+=3D $$QMAKE_CFLAGS_THREAD
+
+QMAKE_INCDIR          =3D
+QMAKE_LIBDIR          =3D
+QMAKE_INCDIR_X11      =3D
+QMAKE_LIBDIR_X11      =3D
+QMAKE_INCDIR_QT       =3D $(OE_QMAKE_INCDIR_QT)
+QMAKE_LIBDIR_QT       =3D $(OE_QMAKE_LIBDIR_QT)
+QMAKE_INCDIR_OPENGL   =3D
+QMAKE_LIBDIR_OPENGL   =3D
+QMAKE_INCDIR_OPENGL_ES1 =3D $$QMAKE_INCDIR_OPENGL
+QMAKE_LIBDIR_OPENGL_ES1 =3D $$QMAKE_LIBDIR_OPENGL
+QMAKE_INCDIR_OPENGL_ES2 =3D $$QMAKE_INCDIR_OPENGL
+QMAKE_LIBDIR_OPENGL_ES2 =3D $$QMAKE_LIBDIR_OPENGL
+QMAKE_INCDIR_EGL      =3D
+QMAKE_LIBDIR_EGL      =3D
+QMAKE_INCDIR_OPENVG   =3D
+QMAKE_LIBDIR_OPENVG   =3D
+
+
+QMAKE_LIBS            =3D
+QMAKE_LIBS_DYNLOAD    =3D -ldl
+QMAKE_LIBS_X11        =3D $(OE_QMAKE_LIBS_X11)
+QMAKE_LIBS_X11SM      =3D $(OE_QMAKE_LIBS_X11SM)
+QMAKE_LIBS_NIS        =3D -lnsl
+QMAKE_LIBS_EGL        =3D -lEGL
+QMAKE_LIBS_OPENGL     =3D -lGLU -lGL
+QMAKE_LIBS_OPENGL_QT  =3D -lGL
+QMAKE_LIBS_OPENGL_ES1 =3D -lGLES_CM
+QMAKE_LIBS_OPENGL_ES2 =3D -lGLESv2
+QMAKE_LIBS_OPENVG     =3D -lOpenVG
+QMAKE_LIBS_THREAD     =3D -lpthread
+
+QMAKE_MOC             =3D $(OE_QMAKE_MOC)
+QMAKE_UIC             =3D $(OE_QMAKE_UIC)
+QMAKE_UIC3            =3D $(OE_QMAKE_UIC3)
+QMAKE_RCC             =3D $(OE_QMAKE_RCC)
+QMAKE_QDBUSCPP2XML    =3D $(OE_QMAKE_QDBUSCPP2XML)
+QMAKE_QDBUSXML2CPP    =3D $(OE_QMAKE_QDBUSXML2CPP)
+
+QMAKE_AR              =3D $(OE_QMAKE_AR) cqs
+QMAKE_OBJCOPY         =3D objcopy
+QMAKE_RANLIB          =3D
+
+QMAKE_TAR             =3D tar -cf
+QMAKE_GZIP            =3D gzip -9f
+
+QMAKE_COPY            =3D cp -f
+QMAKE_COPY_FILE       =3D $(COPY)
+QMAKE_COPY_DIR        =3D $(COPY) -r
+QMAKE_MOVE            =3D mv -f
+QMAKE_DEL_FILE        =3D rm -f
+QMAKE_DEL_DIR         =3D rmdir
+QMAKE_STRIP           =3D $(OE_QMAKE_STRIP)
+QMAKE_STRIPFLAGS_LIB +=3D --strip-unneeded
+QMAKE_CHK_DIR_EXISTS  =3D test -d
+QMAKE_MKDIR           =3D mkdir -p
+QMAKE_INSTALL_FILE    =3D install -m 644 -p
+QMAKE_INSTALL_PROGRAM =3D install -m 755 -p
+
+include(unix.conf)
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb b/meta/recipes-qt/=
qt4/qt4-embedded_4.7.3.bb
deleted file mode 100644
index c3f6713..0000000
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require qt-${PV}.inc
-require qt4-embedded.inc
-
-PR =3D "${INC_PR}.1"
-
-QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
-
-QT_CONFIG_FLAGS +=3D " \
- -exceptions \
-"
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb b/meta/recipes-qt/=
qt4/qt4-embedded_4.7.4.bb
new file mode 100644
index 0000000..c3f6713
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
@@ -0,0 +1,10 @@
+require qt-${PV}.inc
+require qt4-embedded.inc
+
+PR =3D "${INC_PR}.1"
+
+QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
+
+QT_CONFIG_FLAGS +=3D " \
+ -exceptions \
+"
diff --git a/meta/recipes-qt/qt4/qt4-native_4.7.3.bb b/meta/recipes-qt/qt=
4/qt4-native_4.7.3.bb
deleted file mode 100644
index e90a7ba..0000000
--- a/meta/recipes-qt/qt4/qt4-native_4.7.3.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require qt4-native.inc
-
-PR =3D "${INC_PR}.1"
-
-SRC_URI +=3D "file://blacklist-diginotar-certs.diff"
-
-# Find the g++.conf/linux.conf in the right directory.
-FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qt-${PV}:"
-
-EXTRA_OECONF +=3D " -no-fast -silent -no-rpath"
-
-TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] =3D "49b96eefb1224cc529af6fe5608654fe"
-SRC_URI[sha256sum] =3D "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956=
e328c2991905937e"
diff --git a/meta/recipes-qt/qt4/qt4-native_4.7.4.bb b/meta/recipes-qt/qt=
4/qt4-native_4.7.4.bb
new file mode 100644
index 0000000..ffa5f2a
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-native_4.7.4.bb
@@ -0,0 +1,15 @@
+require qt4-native.inc
+
+PR =3D "${INC_PR}.1"
+
+SRC_URI +=3D "file://blacklist-diginotar-certs.diff"
+
+# Find the g++.conf/linux.conf in the right directory.
+FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qt-${PV}:"
+
+EXTRA_OECONF +=3D " -no-fast -silent -no-rpath"
+
+TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
+
+SRC_URI[md5sum] =3D "ddf7d83f912cf1283aa066368464fa22"
+SRC_URI[sha256sum] =3D "321247297648eebd4f1d0195addf51eeb9f1dcf538a78bf3=
c67d11dadbc40faf"
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb b/meta/reci=
pes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
deleted file mode 100644
index e2a4539..0000000
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require qt4-tools-nativesdk.inc
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI +=3D "file://blacklist-diginotar-certs.diff"
-
-SRC_URI[md5sum] =3D "49b96eefb1224cc529af6fe5608654fe"
-SRC_URI[sha256sum] =3D "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956=
e328c2991905937e"
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb b/meta/reci=
pes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
new file mode 100644
index 0000000..9d95eeb
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
@@ -0,0 +1,8 @@
+require qt4-tools-nativesdk.inc
+
+PR =3D "${INC_PR}.0"
+
+SRC_URI +=3D "file://blacklist-diginotar-certs.diff"
+
+SRC_URI[md5sum] =3D "ddf7d83f912cf1283aa066368464fa22"
+SRC_URI[sha256sum] =3D "321247297648eebd4f1d0195addf51eeb9f1dcf538a78bf3=
c67d11dadbc40faf"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb b/meta/recipes-qt/=
qt4/qt4-x11-free_4.7.3.bb
deleted file mode 100644
index 75c6314..0000000
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require qt4-x11-free.inc
-require qt-${PV}.inc
-
-PR =3D "${INC_PR}.1"
-
-QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
-
-QT_CONFIG_FLAGS +=3D " \
- -no-embedded \
- -xrandr \
- -x11"
-
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb b/meta/recipes-qt/=
qt4/qt4-x11-free_4.7.4.bb
new file mode 100644
index 0000000..75c6314
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
@@ -0,0 +1,12 @@
+require qt4-x11-free.inc
+require qt-${PV}.inc
+
+PR =3D "${INC_PR}.1"
+
+QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
+
+QT_CONFIG_FLAGS +=3D " \
+ -no-embedded \
+ -xrandr \
+ -x11"
+
--=20
1.7.6



