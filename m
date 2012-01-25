Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Rq0VM-0002SE-Up
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 11:55:05 +0100
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 44BA54B0701
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 11:47:17 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2012 11:47:16 +0100
Message-Id: <1327488436-28526-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.5
MIME-Version: 1.0
Subject: [PATCH] qt4-tools-nativesdk-4.8.0: fix build
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
X-List-Received-Date: Wed, 25 Jan 2012 10:55:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

the build is actually failing because host g++ and ld are used to
compile and link

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/recipes-qt/qt4/files/configure-lflags.patch   |   18 --------------=
----
 .../recipes-qt/qt4/qt-4.7.4/configure-lflags.patch |   18 ++++++++++++++=
++++
 .../recipes-qt/qt4/qt-4.8.0/configure-lflags.patch |   18 ++++++++++++++=
++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |    8 ++++++--
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |    3 ++-
 5 files changed, 44 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/files/configure-lflags.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/configure-lflags.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch

diff --git a/meta/recipes-qt/qt4/files/configure-lflags.patch b/meta/reci=
pes-qt/qt4/files/configure-lflags.patch
deleted file mode 100644
index a8e5945..0000000
--- a/meta/recipes-qt/qt4/files/configure-lflags.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-qt4-tools-native: set LFLAGS to pick up zlib from staging
-
-Original Author: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
-Upstream-Status: Pending
-
-Index: qtopia-core-opensource-src-4.3.3/configure
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- qtopia-core-opensource-src-4.3.3.orig/configure	2008-01-14 08:53:51.=
000000000 +0000
-+++ qtopia-core-opensource-src-4.3.3/configure	2008-01-14 08:54:07.00000=
0000 +0000
-@@ -447,7 +447,7 @@
- # initalize variables
- #----------------------------------------------------------------------=
---------
-=20
--SYSTEM_VARIABLES=3D"CC CXX CFLAGS CXXFLAGS LDFLAGS"
-+SYSTEM_VARIABLES=3D"CC CXX CFLAGS CXXFLAGS LDFLAGS LFLAGS"
- for varname in $SYSTEM_VARIABLES; do
-     cmd=3D`echo \
- 'if [ -n "\$'${varname}'" ]; then
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/configure-lflags.patch b/meta/r=
ecipes-qt/qt4/qt-4.7.4/configure-lflags.patch
new file mode 100644
index 0000000..a8e5945
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/configure-lflags.patch
@@ -0,0 +1,18 @@
+qt4-tools-native: set LFLAGS to pick up zlib from staging
+
+Original Author: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
+Upstream-Status: Pending
+
+Index: qtopia-core-opensource-src-4.3.3/configure
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- qtopia-core-opensource-src-4.3.3.orig/configure	2008-01-14 08:53:51.=
000000000 +0000
++++ qtopia-core-opensource-src-4.3.3/configure	2008-01-14 08:54:07.00000=
0000 +0000
+@@ -447,7 +447,7 @@
+ # initalize variables
+ #----------------------------------------------------------------------=
---------
+=20
+-SYSTEM_VARIABLES=3D"CC CXX CFLAGS CXXFLAGS LDFLAGS"
++SYSTEM_VARIABLES=3D"CC CXX CFLAGS CXXFLAGS LDFLAGS LFLAGS"
+ for varname in $SYSTEM_VARIABLES; do
+     cmd=3D`echo \
+ 'if [ -n "\$'${varname}'" ]; then
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch b/meta/r=
ecipes-qt/qt4/qt-4.8.0/configure-lflags.patch
new file mode 100644
index 0000000..d74f7fd
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch
@@ -0,0 +1,18 @@
+qt4-tools-native: set LFLAGS to pick up zlib from staging
+
+Original Author: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
+Upstream-Status: Pending
+
+Index: qt-everywhere-opensource-src-4.8.0/configure
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- qt-everywhere-opensource-src-4.8.0.orig/configure
++++ qt-everywhere-opensource-src-4.8.0/configure
+@@ -611,7 +611,7 @@ fi
+ # initalize variables
+ #----------------------------------------------------------------------=
---------
+=20
+-SYSTEM_VARIABLES=3D"RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFL=
AGS"
++SYSTEM_VARIABLES=3D"RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFL=
AGS LFLAGS"
+ for varname in $SYSTEM_VARIABLES; do
+     qmakevarname=3D"${varname}"
+     # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-q=
t/qt4/qt4-tools-nativesdk.inc
index 275fdcc..796ad86 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -12,7 +12,6 @@ inherit nativesdk qmake2
=20
 SRC_URI =3D "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-=
src-${PV}.tar.gz \
            file://configure-lflags.patch \
-           file://compile.test-lflags.patch \
            file://qt-config.patch \
            file://qmake-exists-check.patch \
            file://configure-paths.patch \
@@ -51,12 +50,18 @@ EXTRA_OECONF =3D "-prefix ${prefix} \
 EXTRA_OEMAKE =3D " "
=20
 do_configure() {
+    # Avoid problems with Qt 4.8.0 configure setting QMAKE_LINK from LD =
(since we want the linker to be g++)
+    unset LD
+
     if [ ! -e mkspecs/${TARGET_OS}-oe-g++ ]; then
         ln -sf linux-g++ mkspecs/${TARGET_OS}-oe-g++
     fi
=20
     cp ../g++.conf mkspecs/common
     cp ../linux.conf mkspecs/common
+    # don't use host g++ even during configure
+    sed -i -e "s#g++#${CXX}#" mkspecs/common/g++-base.conf
+    sed -i -e "s#gcc#${CC}#" mkspecs/common/g++-base.conf
=20
     # first launch configure to get qmake compiled for the nativesdk
     (echo o; echo yes) | CC=3D"${CC}" CXX=3D"${CXX}" ./configure ${EXTRA=
_OECONF} || true
@@ -66,7 +71,6 @@ do_configure() {
     if [ ! -e bin/qmake ]; then
         ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
     fi
-
     (echo o; echo yes) | CC=3D"${CC}" CXX=3D"${CXX}" ./configure ${EXTRA=
_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
=20
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb b/meta/reci=
pes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
index 4c90d57..ea5e13d 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
@@ -3,7 +3,8 @@ require qt4-tools-nativesdk.inc
 PR =3D "${INC_PR}.0"
=20
 SRC_URI +=3D "file://blacklist-diginotar-certs.diff \
-            file://fix-qtbug-20925.patch"
+            file://fix-qtbug-20925.patch \
+            file://compile.test-lflags.patch "
=20
 SRC_URI[md5sum] =3D "9831cf1dfa8d0689a06c2c54c5c65aaf"
 SRC_URI[sha256sum] =3D "97195ebce8a46f9929fb971d9ae58326d011c4d54425389e=
6e936514f540221e"
--=20
1.7.7.5



