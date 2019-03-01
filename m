Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id 551807CDCE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 22:27:39 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x7so21312908eds.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2019 14:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Rc+Dk2XI04OkenOoDiXOzlk9syY+f84hXbQW901klvg=;
	b=Muadfp69yMcOEHVRqDXs0/WgypNe3RCrtiny5utplIKTfmO5kIETfp/5EmxHybDEiB
	hMb6yO2Ms5c245i8OcDGKnB6GQKVp3avEqHrtfcifOBM7+MStm/DjjSVAa9DoxdaQA2l
	aAogMY+tuC0BwHcdvZuEzwH/P/id3u2TaX1/VrVDvMCBo19ncvLhLCsi9WIN2tQo+zm6
	wv6Z185C40XpCzmDVjHYc/maq3c6rxulbF0ufRuunAVzSzmsH+UDeRTXtqW4KyUBB5iC
	0LoVNnd6cD0GB127zn4fXVvq23kW1fOV5xDNIl9kmd3b4kEn5BK4CVTqbqGSuvx2SNvQ
	Mu1g==
X-Gm-Message-State: APjAAAXStypOnAdmriwU+6MEqflkh0RYgwD8zjKAL+gSB1ZiCkMzP5gS
	LRZX1gu3IhcvJpq5Sc7/hAP48JI=
X-Google-Smtp-Source: APXvYqyXvjw+V89kb2L++4/Wn5y2V3DLNGfJGo4AbuzqpcpcT0BFE3E/Ybm6bHME1dAKSaDEtzwjSw==
X-Received: by 2002:a50:95ee:: with SMTP id x43mr5928422eda.288.1551479259466; 
	Fri, 01 Mar 2019 14:27:39 -0800 (PST)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-880D-118E-86C-E9FB-6784.dyn6.twc.com.
	[2606:a000:1401:880d:118e:86c:e9fb:6784])
	by smtp.gmail.com with ESMTPSA id e14sm6531657edd.9.2019.03.01.14.27.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Mar 2019 14:27:38 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2019 17:27:32 -0500
Message-Id: <1551479253-30042-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] vim: Remove as this is now in oe-core
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
X-List-Received-Date: Fri, 01 Mar 2019 22:27:39 -0000

Now that we have migrated this recipe to oe-core we need to drop it from
here.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
NOTE: Do not apply this until the series which imports vim into oe-core
itself has been applied.  This is being posted now so that I don't
forget about it.
---
 ...0001-src-Makefile-improve-reproducibility.patch |  46 --------
 .../vim/files/disable_acl_header_check.patch       |  39 -------
 .../vim-add-knob-whether-elf.h-are-checked.patch   |  42 -------
 meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb   |  15 ---
 meta-oe/recipes-support/vim/vim_8.1.0347.bb        | 121 ---------------------
 5 files changed, 263 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
 delete mode 100644 meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
 delete mode 100644 meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
 delete mode 100644 meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb
 delete mode 100644 meta-oe/recipes-support/vim/vim_8.1.0347.bb

diff --git a/meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch b/meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
deleted file mode 100644
index 63a7b78f12f1..000000000000
--- a/meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 133ab27cdb17ca20ef6b0304cf30621d2bcbe757 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 31 Jan 2019 21:32:26 -0800
-Subject: [PATCH] src/Makefile: improve reproducibility
-
-Clear all_cflags, all_lflags, compiled_user
-and compiled_sys to avoid introducing build
-info to improve reproducibility as below:
-
-WARNING: vim-8.1.0347-r0 do_package_qa: QA Issue: File /work/core2-64-wrs-linux/vim/8.1.0347-r0/packages-split/vim/usr/bin/vim.vim in package contained reference to tmpdir [buildpaths]
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/Makefile | 14 ++++----------
- 1 file changed, 4 insertions(+), 10 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index f2fafa4dc..7148d4bd9 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -2845,16 +2845,10 @@ auto/pathdef.c: Makefile auto/config.mk
- 	-@echo '#include "vim.h"' >> $@
- 	-@echo 'char_u *default_vim_dir = (char_u *)"$(VIMRCLOC)";' | $(QUOTESED) >> $@
- 	-@echo 'char_u *default_vimruntime_dir = (char_u *)"$(VIMRUNTIMEDIR)";' | $(QUOTESED) >> $@
--	-@echo 'char_u *all_cflags = (char_u *)"$(CC) -c -I$(srcdir) $(ALL_CFLAGS)";' | $(QUOTESED) >>  $@
--	-@echo 'char_u *all_lflags = (char_u *)"$(CC) $(ALL_LIB_DIRS) $(LDFLAGS) -o $(VIMTARGET) $(ALL_LIBS) ";' | $(QUOTESED) >>  $@
--	-@echo 'char_u *compiled_user = (char_u *)"' | tr -d $(NL) >> $@
--	-@if test -n "$(COMPILEDBY)"; then \
--		echo "$(COMPILEDBY)" | tr -d $(NL) >> $@; \
--		else ((logname) 2>/dev/null || whoami) | tr -d $(NL) >> $@; fi
--	-@echo '";' >> $@
--	-@echo 'char_u *compiled_sys = (char_u *)"' | tr -d $(NL) >> $@
--	-@if test -z "$(COMPILEDBY)"; then hostname | tr -d $(NL) >> $@; fi
--	-@echo '";' >> $@
-+	-@echo 'char_u *all_cflags = (char_u *)"";' | $(QUOTESED) >>  $@
-+	-@echo 'char_u *all_lflags = (char_u *)"";' | $(QUOTESED) >>  $@
-+	-@echo 'char_u *compiled_user = (char_u *)"";' >> $@
-+	-@echo 'char_u *compiled_sys = (char_u *)"";' >> $@
- 	-@sh $(srcdir)/pathdef.sh
- 
- GUI_GTK_RES_INPUTS = \
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch b/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
deleted file mode 100644
index 4720003c252a..000000000000
--- a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5ed25c076a1fb1889a3c50dddf29f21850b59a13 Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com> 
-Date: Tue, 26 Jun 2018 17:29:09 +0800
-Subject: [PATCH] disable acl header check
-
-Don't check 'sys/acl.h' if acl support disabled for vim/vim-tiny.
-
-Upstream-Status: pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/configure.ac | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/configure.ac b/src/configure.ac
-index 107c170..0ee86ad 100644
---- a/src/configure.ac
-+++ b/src/configure.ac
-@@ -3220,7 +3220,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
- 	sys/systeminfo.h locale.h sys/stream.h termios.h \
- 	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
- 	utime.h sys/param.h libintl.h libgen.h \
--	util/debug.h util/msg18n.h frame.h sys/acl.h \
-+	util/debug.h util/msg18n.h frame.h \
- 	sys/access.h sys/sysinfo.h wchar.h wctype.h)
- 
- dnl sys/ptem.h depends on sys/stream.h on Solaris
-@@ -3848,6 +3848,7 @@ AC_ARG_ENABLE(acl,
- 	, [enable_acl="yes"])
- if test "$enable_acl" = "yes"; then
-   AC_MSG_RESULT(no)
-+  AC_CHECK_HEADERS(sys/acl.h)
-   AC_CHECK_LIB(posix1e, acl_get_file, [LIBS="$LIBS -lposix1e"],
- 	AC_CHECK_LIB(acl, acl_get_file, [LIBS="$LIBS -lacl"
- 		  AC_CHECK_LIB(attr, fgetxattr, LIBS="$LIBS -lattr",,)],,),)
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch b/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
deleted file mode 100644
index 37914d4cd9c1..000000000000
--- a/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 38de4bccdb8a861ffdd447f12fdab19d6d852c02 Mon Sep 17 00:00:00 2001
-From: Chong Lu <Chong.Lu@windriver.com>
-Date: Tue, 26 Jun 2018 17:34:15 +0800
-Subject: [PATCH] vim: add knob whether elf.h are checked
-
-Previously, it still was checked when there was no elf library in sysroots directory.
-Add knob to decide whether elf.h are checked or not.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/configure.ac | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/configure.ac b/src/configure.ac
-index 0ee86ad..64736f0 100644
---- a/src/configure.ac
-+++ b/src/configure.ac
-@@ -3192,11 +3192,18 @@ AC_TRY_COMPILE([#include <stdio.h>], [int x __attribute__((unused));],
- 	AC_MSG_RESULT(no))
- 
- dnl Checks for header files.
-+AC_MSG_CHECKING(whether or not to look for elf.h)
-+AC_ARG_ENABLE(elf-check,
-+        [  --enable-elf-check      If elfutils, check for elf.h [default=no]],
-+        , enable_elf_check="no")
-+AC_MSG_RESULT($enable_elf_check)
-+if test "x$enable_elf_check" != "xno"; then
- AC_CHECK_HEADER(elf.h, HAS_ELF=1)
- dnl AC_CHECK_HEADER(dwarf.h, SVR4=1)
- if test "$HAS_ELF" = 1; then
-   AC_CHECK_LIB(elf, main)
- fi
-+fi
- 
- AC_HEADER_DIRENT
- 
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb
deleted file mode 100644
index 8b1fb7b1158d..000000000000
--- a/meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require vim_${PV}.bb
-
-SUMMARY += " (with tiny features)"
-
-PROVIDES_remove = "xxd"
-ALTERNATIVE_${PN}_remove = "xxd"
-
-PACKAGECONFIG += "tiny"
-
-do_install() {
-    install -D -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
-}
-
-ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
diff --git a/meta-oe/recipes-support/vim/vim_8.1.0347.bb b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
deleted file mode 100644
index 070583158467..000000000000
--- a/meta-oe/recipes-support/vim/vim_8.1.0347.bb
+++ /dev/null
@@ -1,121 +0,0 @@
-SUMMARY = "Vi IMproved - enhanced vi editor"
-SECTION = "console/utils"
-
-PROVIDES = "xxd"
-DEPENDS = "ncurses gettext-native"
-# vimdiff doesn't like busybox diff
-RSUGGESTS_${PN} = "diffutils"
-LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
-
-SRC_URI = "git://github.com/vim/vim.git \
-           file://disable_acl_header_check.patch;patchdir=.. \
-           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
-           file://0001-src-Makefile-improve-reproducibility.patch;patchdir=.. \
-"
-SRCREV = "f1c118be93184e8e57e3e80b1b3383f464ed649e"
-
-S = "${WORKDIR}/git/src"
-
-VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
-
-inherit autotools-brokensep update-alternatives
-
-CLEANBROKEN = "1"
-
-# vim configure.in contains functions which got 'dropped' by autotools.bbclass
-do_configure () {
-    rm -f auto/*
-    touch auto/config.mk
-    aclocal
-    autoconf
-    oe_runconf
-    touch auto/configure
-    touch auto/config.mk auto/config.h
-}
-
-#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
-PACKAGECONFIG ??= ""
-PACKAGECONFIG += " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
-"
-
-PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
-PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
-PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
-PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
-PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
-
-EXTRA_OECONF = " \
-    --disable-gpm \
-    --disable-gtktest \
-    --disable-xim \
-    --disable-netbeans \
-    --with-tlib=ncurses \
-    ac_cv_small_wchar_t=no \
-    vim_cv_getcwd_broken=no \
-    vim_cv_memmove_handles_overlap=yes \
-    vim_cv_stat_ignores_slash=no \
-    vim_cv_terminfo=yes \
-    vim_cv_tgetent=non-zero \
-    vim_cv_toupper_broken=no \
-    vim_cv_tty_group=world \
-    STRIP=/bin/true \
-"
-
-do_install() {
-    autotools_do_install
-
-    # Work around file-rdeps picking up csh, awk, perl or python as a dep
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
-
-    # Install example vimrc from runtime files
-    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
-
-    # we use --with-features=big as default
-    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
-}
-
-PARALLEL_MAKEINST = ""
-
-PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
-FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
-FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
-FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
-FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
-FILES_${PN}-data = "${datadir}/${BPN}"
-FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
-FILES_${PN}-common = " \
-    ${datadir}/${BPN}/${VIMDIR}/*.vim \
-    ${datadir}/${BPN}/${VIMDIR}/autoload \
-    ${datadir}/${BPN}/${VIMDIR}/colors \
-    ${datadir}/${BPN}/${VIMDIR}/compiler \
-    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
-    ${datadir}/${BPN}/${VIMDIR}/indent \
-    ${datadir}/${BPN}/${VIMDIR}/keymap \
-    ${datadir}/${BPN}/${VIMDIR}/lang \
-    ${datadir}/${BPN}/${VIMDIR}/macros \
-    ${datadir}/${BPN}/${VIMDIR}/plugin \
-    ${datadir}/${BPN}/${VIMDIR}/print \
-    ${datadir}/${BPN}/${VIMDIR}/spell \
-    ${datadir}/icons \
-"
-
-RDEPENDS_${BPN} = "ncurses-terminfo-base"
-# Recommend that runtime data is installed along with vim
-RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
-
-ALTERNATIVE_${PN} = "vi vim xxd"
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
-ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
-ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
-ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
-ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
-
-BBCLASSEXTEND = "native"
-- 
2.7.4


