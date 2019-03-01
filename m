Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5C8A27CDDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 22:27:02 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c55so21373111edb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2019 14:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uFnraS1+N+/vmTZRL8+eoPdAXn0wUi8aOJ+YpxPJzTU=;
	b=V+aCq6MA1yAgZVVY3oB4e/2fAMOcXlOj1yCk7LAxJH8+pXpkeUe0LUN1YVGAA+Gv0e
	1eQ/jJqF9xsBOPKAbIOmbiNrSChbeWq4JutCaSikwte6e033Q9bqHavS5uzlU6CkTIjw
	691/Ievc+ujIEc6SPEMyjv+8vZ947mAW7vgO9CdOQ3IiWJNwKq7vNDfUIfJWOuSy1oAK
	L9t6lip+rIR0p3p63+S0yEnvOplS/vCUxZUlZdi2OgtanpOFPHh8VS/By5i8bDxholPf
	pW702axoJx+GCQAVQBP7m3fQMkA2So+BeYP0VEL/mQSlf2fAKjAKnm95RQRntYzvgGdW
	LOjw==
X-Gm-Message-State: APjAAAUe+lv1AExkHjfb2MdhAVplRS8mxJNHPWQC23qIUEnqidLucWkh
	tg9SIjEXxoxeNjHLGWoQGb4nDQA=
X-Google-Smtp-Source: APXvYqzEo9l9Vf3z/6EedtWTA/Opop3lVFOtvKTa0HX2RaUBDbtavwIYTbV7XwRUIHGn0MKGsQTCGQ==
X-Received: by 2002:a17:906:3d69:: with SMTP id
	r9mr4568714ejf.92.1551479222274; 
	Fri, 01 Mar 2019 14:27:02 -0800 (PST)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-880D-118E-86C-E9FB-6784.dyn6.twc.com.
	[2606:a000:1401:880d:118e:86c:e9fb:6784])
	by smtp.gmail.com with ESMTPSA id
	x34sm6337645edm.70.2019.03.01.14.27.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Mar 2019 14:27:01 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2019 17:26:49 -0500
Message-Id: <1551479212-28944-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551479212-28944-1-git-send-email-trini@konsulko.com>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
Subject: [PATCH 1/4] vim: Import version 8.1.0347
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
X-List-Received-Date: Fri, 01 Mar 2019 22:27:02 -0000

In order to have a stand-alone editor in oe-core, bring in vim from
meta-openembedded/meta-oe.  This imports the recipes as of git commit:
commit 7b48bd2be97408107c0dd3c74b1e28f042268457
Author: Ovidiu Panait <ovidiu.panait@windriver.com>
Date:   Fri Feb 1 10:07:20 2019 +0200

    vim: Enable GUI support for x11 DISTRO_FEATURES

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/files/common-licenses/vim                     |  81 ++++++++++++++
 ...0001-src-Makefile-improve-reproducibility.patch |  46 ++++++++
 .../vim/files/disable_acl_header_check.patch       |  39 +++++++
 .../vim-add-knob-whether-elf.h-are-checked.patch   |  42 +++++++
 meta/recipes-support/vim/vim-tiny_8.1.0347.bb      |  15 +++
 meta/recipes-support/vim/vim_8.1.0347.bb           | 121 +++++++++++++++++++++
 6 files changed, 344 insertions(+)
 create mode 100644 meta/files/common-licenses/vim
 create mode 100644 meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
 create mode 100644 meta/recipes-support/vim/files/disable_acl_header_check.patch
 create mode 100644 meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
 create mode 100644 meta/recipes-support/vim/vim-tiny_8.1.0347.bb
 create mode 100644 meta/recipes-support/vim/vim_8.1.0347.bb

diff --git a/meta/files/common-licenses/vim b/meta/files/common-licenses/vim
new file mode 100644
index 000000000000..4aa818eb248e
--- /dev/null
+++ b/meta/files/common-licenses/vim
@@ -0,0 +1,81 @@
+VIM LICENSE
+
+I)  There are no restrictions on distributing unmodified copies of Vim except
+    that they must include this license text.  You can also distribute
+    unmodified parts of Vim, likewise unrestricted except that they must
+    include this license text.  You are also allowed to include executables
+    that you made from the unmodified Vim sources, plus your own usage
+    examples and Vim scripts.
+
+II) It is allowed to distribute a modified (or extended) version of Vim,
+    including executables and/or source code, when the following four
+    conditions are met:
+    1) This license text must be included unmodified.
+    2) The modified Vim must be distributed in one of the following five ways:
+       a) If you make changes to Vim yourself, you must clearly describe in
+	  the distribution how to contact you.  When the maintainer asks you
+	  (in any way) for a copy of the modified Vim you distributed, you
+	  must make your changes, including source code, available to the
+	  maintainer without fee.  The maintainer reserves the right to
+	  include your changes in the official version of Vim.  What the
+	  maintainer will do with your changes and under what license they
+	  will be distributed is negotiable.  If there has been no negotiation
+	  then this license, or a later version, also applies to your changes.
+	  The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
+	  changes it will be announced in appropriate places (most likely
+	  vim.sf.net, www.vim.org and/or comp.editors).  When it is completely
+	  impossible to contact the maintainer, the obligation to send him
+	  your changes ceases.  Once the maintainer has confirmed that he has
+	  received your changes they will not have to be sent again.
+       b) If you have received a modified Vim that was distributed as
+	  mentioned under a) you are allowed to further distribute it
+	  unmodified, as mentioned at I).  If you make additional changes the
+	  text under a) applies to those changes.
+       c) Provide all the changes, including source code, with every copy of
+	  the modified Vim you distribute.  This may be done in the form of a
+	  context diff.  You can choose what license to use for new code you
+	  add.  The changes and their license must not restrict others from
+	  making their own changes to the official version of Vim.
+       d) When you have a modified Vim which includes changes as mentioned
+	  under c), you can distribute it without the source code for the
+	  changes if the following three conditions are met:
+	  - The license that applies to the changes permits you to distribute
+	    the changes to the Vim maintainer without fee or restriction, and
+	    permits the Vim maintainer to include the changes in the official
+	    version of Vim without fee or restriction.
+	  - You keep the changes for at least three years after last
+	    distributing the corresponding modified Vim.  When the maintainer
+	    or someone who you distributed the modified Vim to asks you (in
+	    any way) for the changes within this period, you must make them
+	    available to him.
+	  - You clearly describe in the distribution how to contact you.  This
+	    contact information must remain valid for at least three years
+	    after last distributing the corresponding modified Vim, or as long
+	    as possible.
+       e) When the GNU General Public License (GPL) applies to the changes,
+	  you can distribute the modified Vim under the GNU GPL version 2 or
+	  any later version.
+    3) A message must be added, at least in the output of the ":version"
+       command and in the intro screen, such that the user of the modified Vim
+       is able to see that it was modified.  When distributing as mentioned
+       under 2)e) adding the message is only required for as far as this does
+       not conflict with the license used for the changes.
+    4) The contact information as required under 2)a) and 2)d) must not be
+       removed or changed, except that the person himself can make
+       corrections.
+
+III) If you distribute a modified version of Vim, you are encouraged to use
+     the Vim license for your changes and make them available to the
+     maintainer, including the source code.  The preferred way to do this is
+     by e-mail or by uploading the files to a server and e-mailing the URL.
+     If the number of changes is small (e.g., a modified Makefile) e-mailing a
+     context diff will do.  The e-mail address to be used is
+     <maintainer@vim.org>
+
+IV)  It is not allowed to remove this license from the distribution of the Vim
+     sources, parts of it or from a modified version.  You may use this
+     license for previous Vim releases instead of the license that they came
+     with, at your option.
+
+===
+Read more about this license at http://vimdoc.sourceforge.net/htmldoc/uganda.html#license
diff --git a/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
new file mode 100644
index 000000000000..63a7b78f12f1
--- /dev/null
+++ b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
@@ -0,0 +1,46 @@
+From 133ab27cdb17ca20ef6b0304cf30621d2bcbe757 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 31 Jan 2019 21:32:26 -0800
+Subject: [PATCH] src/Makefile: improve reproducibility
+
+Clear all_cflags, all_lflags, compiled_user
+and compiled_sys to avoid introducing build
+info to improve reproducibility as below:
+
+WARNING: vim-8.1.0347-r0 do_package_qa: QA Issue: File /work/core2-64-wrs-linux/vim/8.1.0347-r0/packages-split/vim/usr/bin/vim.vim in package contained reference to tmpdir [buildpaths]
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/Makefile | 14 ++++----------
+ 1 file changed, 4 insertions(+), 10 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index f2fafa4dc..7148d4bd9 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -2845,16 +2845,10 @@ auto/pathdef.c: Makefile auto/config.mk
+ 	-@echo '#include "vim.h"' >> $@
+ 	-@echo 'char_u *default_vim_dir = (char_u *)"$(VIMRCLOC)";' | $(QUOTESED) >> $@
+ 	-@echo 'char_u *default_vimruntime_dir = (char_u *)"$(VIMRUNTIMEDIR)";' | $(QUOTESED) >> $@
+-	-@echo 'char_u *all_cflags = (char_u *)"$(CC) -c -I$(srcdir) $(ALL_CFLAGS)";' | $(QUOTESED) >>  $@
+-	-@echo 'char_u *all_lflags = (char_u *)"$(CC) $(ALL_LIB_DIRS) $(LDFLAGS) -o $(VIMTARGET) $(ALL_LIBS) ";' | $(QUOTESED) >>  $@
+-	-@echo 'char_u *compiled_user = (char_u *)"' | tr -d $(NL) >> $@
+-	-@if test -n "$(COMPILEDBY)"; then \
+-		echo "$(COMPILEDBY)" | tr -d $(NL) >> $@; \
+-		else ((logname) 2>/dev/null || whoami) | tr -d $(NL) >> $@; fi
+-	-@echo '";' >> $@
+-	-@echo 'char_u *compiled_sys = (char_u *)"' | tr -d $(NL) >> $@
+-	-@if test -z "$(COMPILEDBY)"; then hostname | tr -d $(NL) >> $@; fi
+-	-@echo '";' >> $@
++	-@echo 'char_u *all_cflags = (char_u *)"";' | $(QUOTESED) >>  $@
++	-@echo 'char_u *all_lflags = (char_u *)"";' | $(QUOTESED) >>  $@
++	-@echo 'char_u *compiled_user = (char_u *)"";' >> $@
++	-@echo 'char_u *compiled_sys = (char_u *)"";' >> $@
+ 	-@sh $(srcdir)/pathdef.sh
+ 
+ GUI_GTK_RES_INPUTS = \
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/vim/files/disable_acl_header_check.patch b/meta/recipes-support/vim/files/disable_acl_header_check.patch
new file mode 100644
index 000000000000..4720003c252a
--- /dev/null
+++ b/meta/recipes-support/vim/files/disable_acl_header_check.patch
@@ -0,0 +1,39 @@
+From 5ed25c076a1fb1889a3c50dddf29f21850b59a13 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com> 
+Date: Tue, 26 Jun 2018 17:29:09 +0800
+Subject: [PATCH] disable acl header check
+
+Don't check 'sys/acl.h' if acl support disabled for vim/vim-tiny.
+
+Upstream-Status: pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/configure.ac b/src/configure.ac
+index 107c170..0ee86ad 100644
+--- a/src/configure.ac
++++ b/src/configure.ac
+@@ -3220,7 +3220,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
+ 	sys/systeminfo.h locale.h sys/stream.h termios.h \
+ 	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
+ 	utime.h sys/param.h libintl.h libgen.h \
+-	util/debug.h util/msg18n.h frame.h sys/acl.h \
++	util/debug.h util/msg18n.h frame.h \
+ 	sys/access.h sys/sysinfo.h wchar.h wctype.h)
+ 
+ dnl sys/ptem.h depends on sys/stream.h on Solaris
+@@ -3848,6 +3848,7 @@ AC_ARG_ENABLE(acl,
+ 	, [enable_acl="yes"])
+ if test "$enable_acl" = "yes"; then
+   AC_MSG_RESULT(no)
++  AC_CHECK_HEADERS(sys/acl.h)
+   AC_CHECK_LIB(posix1e, acl_get_file, [LIBS="$LIBS -lposix1e"],
+ 	AC_CHECK_LIB(acl, acl_get_file, [LIBS="$LIBS -lacl"
+ 		  AC_CHECK_LIB(attr, fgetxattr, LIBS="$LIBS -lattr",,)],,),)
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch b/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
new file mode 100644
index 000000000000..37914d4cd9c1
--- /dev/null
+++ b/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
@@ -0,0 +1,42 @@
+From 38de4bccdb8a861ffdd447f12fdab19d6d852c02 Mon Sep 17 00:00:00 2001
+From: Chong Lu <Chong.Lu@windriver.com>
+Date: Tue, 26 Jun 2018 17:34:15 +0800
+Subject: [PATCH] vim: add knob whether elf.h are checked
+
+Previously, it still was checked when there was no elf library in sysroots directory.
+Add knob to decide whether elf.h are checked or not.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/configure.ac | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/configure.ac b/src/configure.ac
+index 0ee86ad..64736f0 100644
+--- a/src/configure.ac
++++ b/src/configure.ac
+@@ -3192,11 +3192,18 @@ AC_TRY_COMPILE([#include <stdio.h>], [int x __attribute__((unused));],
+ 	AC_MSG_RESULT(no))
+ 
+ dnl Checks for header files.
++AC_MSG_CHECKING(whether or not to look for elf.h)
++AC_ARG_ENABLE(elf-check,
++        [  --enable-elf-check      If elfutils, check for elf.h [default=no]],
++        , enable_elf_check="no")
++AC_MSG_RESULT($enable_elf_check)
++if test "x$enable_elf_check" != "xno"; then
+ AC_CHECK_HEADER(elf.h, HAS_ELF=1)
+ dnl AC_CHECK_HEADER(dwarf.h, SVR4=1)
+ if test "$HAS_ELF" = 1; then
+   AC_CHECK_LIB(elf, main)
+ fi
++fi
+ 
+ AC_HEADER_DIRENT
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/vim/vim-tiny_8.1.0347.bb b/meta/recipes-support/vim/vim-tiny_8.1.0347.bb
new file mode 100644
index 000000000000..8b1fb7b1158d
--- /dev/null
+++ b/meta/recipes-support/vim/vim-tiny_8.1.0347.bb
@@ -0,0 +1,15 @@
+require vim_${PV}.bb
+
+SUMMARY += " (with tiny features)"
+
+PROVIDES_remove = "xxd"
+ALTERNATIVE_${PN}_remove = "xxd"
+
+PACKAGECONFIG += "tiny"
+
+do_install() {
+    install -D -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
+}
+
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
diff --git a/meta/recipes-support/vim/vim_8.1.0347.bb b/meta/recipes-support/vim/vim_8.1.0347.bb
new file mode 100644
index 000000000000..070583158467
--- /dev/null
+++ b/meta/recipes-support/vim/vim_8.1.0347.bb
@@ -0,0 +1,121 @@
+SUMMARY = "Vi IMproved - enhanced vi editor"
+SECTION = "console/utils"
+
+PROVIDES = "xxd"
+DEPENDS = "ncurses gettext-native"
+# vimdiff doesn't like busybox diff
+RSUGGESTS_${PN} = "diffutils"
+LICENSE = "vim"
+LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
+
+SRC_URI = "git://github.com/vim/vim.git \
+           file://disable_acl_header_check.patch;patchdir=.. \
+           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
+           file://0001-src-Makefile-improve-reproducibility.patch;patchdir=.. \
+"
+SRCREV = "f1c118be93184e8e57e3e80b1b3383f464ed649e"
+
+S = "${WORKDIR}/git/src"
+
+VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
+
+inherit autotools-brokensep update-alternatives
+
+CLEANBROKEN = "1"
+
+# vim configure.in contains functions which got 'dropped' by autotools.bbclass
+do_configure () {
+    rm -f auto/*
+    touch auto/config.mk
+    aclocal
+    autoconf
+    oe_runconf
+    touch auto/configure
+    touch auto/config.mk auto/config.h
+}
+
+#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
+PACKAGECONFIG ??= ""
+PACKAGECONFIG += " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
+"
+
+PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
+PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
+PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
+PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
+
+EXTRA_OECONF = " \
+    --disable-gpm \
+    --disable-gtktest \
+    --disable-xim \
+    --disable-netbeans \
+    --with-tlib=ncurses \
+    ac_cv_small_wchar_t=no \
+    vim_cv_getcwd_broken=no \
+    vim_cv_memmove_handles_overlap=yes \
+    vim_cv_stat_ignores_slash=no \
+    vim_cv_terminfo=yes \
+    vim_cv_tgetent=non-zero \
+    vim_cv_toupper_broken=no \
+    vim_cv_tty_group=world \
+    STRIP=/bin/true \
+"
+
+do_install() {
+    autotools_do_install
+
+    # Work around file-rdeps picking up csh, awk, perl or python as a dep
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
+
+    # Install example vimrc from runtime files
+    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
+
+    # we use --with-features=big as default
+    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
+}
+
+PARALLEL_MAKEINST = ""
+
+PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
+FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
+FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
+FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
+FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
+FILES_${PN}-data = "${datadir}/${BPN}"
+FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
+FILES_${PN}-common = " \
+    ${datadir}/${BPN}/${VIMDIR}/*.vim \
+    ${datadir}/${BPN}/${VIMDIR}/autoload \
+    ${datadir}/${BPN}/${VIMDIR}/colors \
+    ${datadir}/${BPN}/${VIMDIR}/compiler \
+    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
+    ${datadir}/${BPN}/${VIMDIR}/indent \
+    ${datadir}/${BPN}/${VIMDIR}/keymap \
+    ${datadir}/${BPN}/${VIMDIR}/lang \
+    ${datadir}/${BPN}/${VIMDIR}/macros \
+    ${datadir}/${BPN}/${VIMDIR}/plugin \
+    ${datadir}/${BPN}/${VIMDIR}/print \
+    ${datadir}/${BPN}/${VIMDIR}/spell \
+    ${datadir}/icons \
+"
+
+RDEPENDS_${BPN} = "ncurses-terminfo-base"
+# Recommend that runtime data is installed along with vim
+RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
+
+ALTERNATIVE_${PN} = "vi vim xxd"
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
+ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
+ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
+ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
+ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


