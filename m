Return-Path: <fenixk19@mail.ru>
Received: from smtp27.mail.ru (smtp27.mail.ru [94.100.181.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8D260167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; 
	h=Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID;
	bh=3gx/BoMgS48w6VCtHylSP9ZbzdqqrW8ygckvHhcUOpI=; 
	b=A1+1dZCLL+bWgTy96jVkuGHQxt3ZoGt77d4VLvp0+ydHKMp0rewu8RBMU+6PyvgQ3urfG5j/dcWJwD+V6hSxodZniROB9oKsognEHuRyOsZukg1YqGlmGu0YTlZqlL4GvEAccHh/aO96Yk3lWVqEhs7G9FG5XK1OmqoZmmRgT6w=;
Received: from [83.179.31.115] (port=35761 helo=[0.0.0.0])
	by smtp27.mail.ru with esmtpa (envelope-from <fenixk19@mail.ru>)
	id 1XouQD-0007uW-56; Thu, 13 Nov 2014 16:26:50 +0300
Message-ID: <5464B191.5030101@mail.ru>
Date: Thu, 13 Nov 2014 16:26:41 +0300
From: Alexander Varnin <fenixk19@mail.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Yi Qingliang <niqingliang2003@gmail.com>
References: <54635D01.4060200@mail.ru>	<CADwFkYd=SXmPxRGS5c7YnOkSwGhagN1sGnsTBuQiamg04RjQog@mail.gmail.com>
	<CADwFkYfYuhm14dAniVRZbCzcMoS8FQWHVOfNupCktU-tQ9TtCw@mail.gmail.com>
In-Reply-To: <CADwFkYfYuhm14dAniVRZbCzcMoS8FQWHVOfNupCktU-tQ9TtCw@mail.gmail.com>
X-Spam: Not detected
X-Mras: Ok
Cc: openembedded-core@lists.openembedded.org
Subject: Re: need help in qt environment setup
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
X-List-Received-Date: Thu, 13 Nov 2014 13:26:52 -0000
X-Groupsio-MsgNum: 59632
Content-Type: multipart/mixed; boundary="------------020701010100050709080203"

--------------020701010100050709080203
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

13.11.2014 09:20, Yi Qingliang пишет:
> and then use '${OE_QMAKE_QMAKE}' but not 'qmake' directly.
>
> On Thu, Nov 13, 2014 at 2:18 PM, Yi Qingliang
> <niqingliang2003@gmail.com <mailto:niqingliang2003@gmail.com>> wrote:
>
>     mkdir -p recipes-qt/meta
>     touch meta-ide-qte-support.bb <http://meta-ide-qte-support.bb>
>
>     fill the meta-ide-qte-support.bb <http://meta-ide-qte-support.bb>
>     with following contents.
>     and 'bitbake meta-ide-qte-support' just like 'bitbake
>     meta-ide-support'.
>     GOOD LUCK!
>
>
>     CRIPTION = "Meta package for ensuring the build directory contains
>     all appropriate toolchain packages for using an IDE & QTE"
>     LICENSE = "MIT"
>     LIC_FILES_CHKSUM =
>     "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
>                        
>     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>
>     DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native
>     qemu-helper-native unfs3-native"
>     DEPENDS += "qt4-embedded"
>     PR = "r1"
>
>     inherit meta toolchain-scripts
>
>     QT_TOOLS_PREFIX = "${STAGING_DIR_NATIVE}${bindir}"
>
>     toolchain_create_tree_env_script_append() {
>         scriptori=${script}
>         script=${scriptori}-qte
>
>         rm -f $script
>         touch $script
>         cat $scriptori >> $script
>
>         # please follow the corresponding variables in qt4e.bbclass
>         echo 'export OE_QMAKE_LIBS_X11=""' >> $script
>         echo 'export OE_QMAKE_LIBS_QT="qt"' >> $script
>         echo 'export QT_DIR_NAME="qtopia"' >> $script
>         echo 'export QT_LIBINFIX="E"' >> $script
>
>         echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
>         echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
>         echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
>         echo 'export OE_QMAKE_CC="$CC"' >> $script
>         echo 'export OE_QMAKE_CXX="$CXX"' >> $script
>         echo 'export OE_QMAKE_LINK="$CXX"' >> $script
>         echo 'export OE_QMAKE_AR="$AR"' >> $script
>         echo 'export
>     OE_QMAKE_LIBDIR_QT=${STAGING_DIR_TARGET}${libdir}' >> $script
>         echo 'export
>     OE_QMAKE_INCDIR_QT=${STAGING_DIR_TARGET}${includedir}/${QT_DIR_NAME}'
>     >> $script
>         echo 'export OE_QMAKE_MOC=${QT_TOOLS_PREFIX}/moc4' >> $script
>         echo 'export OE_QMAKE_UIC=${QT_TOOLS_PREFIX}/uic4' >> $script
>         echo 'export OE_QMAKE_UIC3=${QT_TOOLS_PREFIX}/uic34' >> $script
>         echo 'export OE_QMAKE_RCC=${QT_TOOLS_PREFIX}/rcc4' >> $script
>         echo 'export
>     OE_QMAKE_QDBUSCPP2XML=${QT_TOOLS_PREFIX}/qdbuscpp2xml4' >> $script
>         echo 'export
>     OE_QMAKE_QDBUSXML2CPP=${QT_TOOLS_PREFIX}/qdbusxml2cpp4' >> $script
>         echo 'export
>     OE_QMAKE_QT_CONFIG=${STAGING_DIR_TARGET}${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri'
>     >> $script
>         echo 'export
>     QMAKESPEC=${STAGING_DIR_TARGET}${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++'
>     >> $script
>         echo 'export OE_QMAKE_QMAKE=${QT_TOOLS_PREFIX}/qmake2' >> $script
>
>         # make a symbolic link to mkspecs for compatibility with
>     Nokia's SDK
>         # and QTCreator
>         (cd ${QT_TOOLS_PREFIX}/..; ln -sf
>     ${STAGING_DIR_TARGET}/usr/share/${QT_DIR_NAME}/mkspecs mkspecs;)
>     }
>
>     do_populate_ide_support () {
>       toolchain_create_tree_env_script
>     }
>
>     do_populate_ide_support[nostamp] = "1"
>     do_populate_ide_support[recrdeptask] = "do_package_write"
>     addtask populate_ide_support before do_build after do_install
>
>


Thank you!

I used your suggestions and made it work for me with following differences:
- use of environment-setup.d folder (introduced with
457291f2ca084d1f43c0cca2175b448a22761887 and
e7b9e1df19062cfbcd72c90295829424cae6fbed commits) instead of appending
script.
- I created meta-ide-support.bbclass to avoid code duplication

Here is a draft patch attached of how I did it. I am ready to work on
upstream-suitable patch for this feature, if someone wants to hint me
how to do it properly.

--------------020701010100050709080203
Content-Type: text/x-diff;
 name="0001-recipes-qt-meta-ide-qte-support-recipe-introduced.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-recipes-qt-meta-ide-qte-support-recipe-introduced.patch"

From d83e00483b735db7e056f5683a5aaba60b16013e Mon Sep 17 00:00:00 2001
From: "A. Varnin" <fenixk19@mail.ru>
Date: Thu, 13 Nov 2014 16:18:20 +0300
Subject: [PATCH] recipes-qt: meta-ide-qte-support recipe introduced

meta-ide-qte-support is capable of generating environment-setup.d script for
application development evironment with QT(e) support

Signed-off-by: A. Varnin <fenixk19@mail.ru>
---
 meta/classes/meta-ide-support.bbclass        | 12 ++++++++
 meta/recipes-core/meta/meta-ide-support.bb   |  9 +-----
 meta/recipes-qt/meta/meta-ide-qte-support.bb | 45 ++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 8 deletions(-)
 create mode 100644 meta/classes/meta-ide-support.bbclass
 create mode 100644 meta/recipes-qt/meta/meta-ide-qte-support.bb

diff --git a/meta/classes/meta-ide-support.bbclass b/meta/classes/meta-ide-support.bbclass
new file mode 100644
index 0000000..16c759b
--- /dev/null
+++ b/meta/classes/meta-ide-support.bbclass
@@ -0,0 +1,12 @@
+
+DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native"
+
+inherit meta toolchain-scripts
+
+do_populate_ide_support () {
+  toolchain_create_tree_env_script
+}
+
+do_populate_ide_support[nostamp] = "1"
+addtask populate_ide_support before do_build after do_install
+
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 2f92912..b2e33a2 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -4,14 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native"
 PR = "r3"
 
-inherit meta toolchain-scripts
+inherit meta-ide-support
 
-do_populate_ide_support () {
-  toolchain_create_tree_env_script
-}
-
-do_populate_ide_support[nostamp] = "1"
-addtask populate_ide_support before do_build after do_install
diff --git a/meta/recipes-qt/meta/meta-ide-qte-support.bb b/meta/recipes-qt/meta/meta-ide-qte-support.bb
new file mode 100644
index 0000000..42b4210
--- /dev/null
+++ b/meta/recipes-qt/meta/meta-ide-qte-support.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Integrated Development Environment support"
+DESCRIPTION = "Meta package for ensuring the build directory contains all appropriate toolchain packages for using an IDE & QTE"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+inherit meta-ide-support
+
+DEPENDS += "qt4-embedded"
+PR = "r1"
+
+
+QT_TOOLS_PREFIX = "${STAGING_DIR_NATIVE}${bindir}"
+QT_DIR_NAME = "qtopia"
+
+
+toolchain_create_tree_env_script_append() {
+    mkdir -p ${STAGING_DIR_NATIVE}/environment-setup.d/
+    script=${STAGING_DIR_NATIVE}/environment-setup.d/${QT_DIR_NAME}.sh
+
+    echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' > $script
+    echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
+    echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
+    echo 'export OE_QMAKE_CC=$CC' >> $script
+    echo 'export OE_QMAKE_CXX=$CXX' >> $script
+    echo 'export OE_QMAKE_LINK=$CXX' >> $script
+    echo 'export OE_QMAKE_AR=$AR' >> $script
+    echo 'export OE_QMAKE_LIBDIR_QT=$OECORE_TARGET_SYSROOT${libdir}' >> $script
+    echo 'export OE_QMAKE_INCDIR_QT=$OECORE_TARGET_SYSROOT${includedir}/${QT_DIR_NAME}' >> $script
+    echo 'export OE_QMAKE_MOC=${QT_TOOLS_PREFIX}/moc4' >> $script
+    echo 'export OE_QMAKE_UIC=${QT_TOOLS_PREFIX}/uic4' >> $script
+    echo 'export OE_QMAKE_UIC3=${QT_TOOLS_PREFIX}/uic34' >> $script
+    echo 'export OE_QMAKE_RCC=${QT_TOOLS_PREFIX}/rcc4' >> $script
+    echo 'export OE_QMAKE_QDBUSCPP2XML=${QT_TOOLS_PREFIX}/qdbuscpp2xml4' >> $script
+    echo 'export OE_QMAKE_QDBUSXML2CPP=${QT_TOOLS_PREFIX}/qdbusxml2cpp4' >> $script
+    echo 'export OE_QMAKE_QT_CONFIG=$OECORE_TARGET_SYSROOT${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+    echo 'export QMAKESPEC=$OECORE_TARGET_SYSROOT${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
+    echo 'export OE_QMAKE_QMAKE=${QT_TOOLS_PREFIX}/qmake2' >> $script    
+    echo 'export QT_CONF_PATH=$OECORE_NATIVE_SYSROOT${sysconfdir}/qt.conf' >> $script
+
+    # make a symbolic link to mkspecs for compatibility with Qt SDK
+    # and Qt Creator
+    (cd ${STAGING_DIR_NATIVE}${bindir}/..; rm -f mkspecs; ln -s ${SDKTARGETSYSROOT}/usr/share/${QT_DIR_NAME}/mkspecs mkspecs;)
+}
+
-- 
1.9.1


--------------020701010100050709080203--
