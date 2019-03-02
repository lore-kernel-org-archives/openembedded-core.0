Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4BB7B7C833
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 15:42:34 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q1so938467wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 07:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EDdYIDW7Ce6nSqNd4gtgqN2vmlEfcdWQ1OYQe1xFACk=;
	b=Ojh/r+FuOqwIT3LTq3vfhzSmkKqR62hV2Qq/yz2kbi82Wbem+c5yhqioiq/t5iNhmL
	UGYkRgpv4dEru4wPF7naHvehDLHRnBnuua25kdEMTyXqZIqj73ScTPYF4bHOtmG6g13S
	k9VYdE5NQcV8sc+nfpV/PJvoEwYTBTkyDWVgGjo6VWCgs8aUH5QUB68b8Mn/UnC1WPu5
	LJBnz+8/aMV52gJtjSkF1Y6NQoawz4IchzwtFGK9c58NceuQgf0UPjYAFDhHnDcKW168
	XgtwAIS2oZOqUNkV1irebP6H4By5kk0LlEzY2Lwn8buyguviRwZw8QAl96nUV8f3Yad8
	CNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EDdYIDW7Ce6nSqNd4gtgqN2vmlEfcdWQ1OYQe1xFACk=;
	b=hsk3BrzgHbLRy9tIF+1SIC0PDWXAoO7Ig5174v9ANLah2z/8YvT0OAcjcc71gVBh3i
	G1WV41P3pu5sGuL5XJsoQetpkCzPjrCHZqokG+PfJEWwIbt0BHge+7EzDIRrtpBaFaYU
	QLGpKbjRTvKet5DZEMMRS7no8a/QsEB07mD513g2HyPcBzzs15eCi8+z1IAFrH6s759c
	mXePpBlyWuy5pFOf3YxIa3vEZu/H6T5ZX+dKCdGo8skJdmBgsKw0PiKZtUokVpG2zyXp
	EK4nxWa/hR0gnCcwx0RF5moh2rY5ClXh2nPjPZyXyoV3dhY2agiiGyeILe9o4SqVfJg1
	Q7fA==
X-Gm-Message-State: APjAAAUdnu/8AUrJizXnKJ98d2zC14IrFgdC3jJ0p6hb+Tud/DPvhTkp
	AdbEQbx72Jmvk8gRJruFk3gFOUBDPHxcNVtf/Gk=
X-Google-Smtp-Source: APXvYqyaB1LbMJssdYjC2PKX1MWiBber40YT80Olq9IPBSXRLWmU1q8CL8oUOnjuAIyDv1Tk5oPm/J/uQTpp35gIHyM=
X-Received: by 2002:adf:e949:: with SMTP id m9mr3634940wrn.1.1551541355468;
	Sat, 02 Mar 2019 07:42:35 -0800 (PST)
MIME-Version: 1.0
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
	<1551479212-28944-2-git-send-email-trini@konsulko.com>
In-Reply-To: <1551479212-28944-2-git-send-email-trini@konsulko.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 2 Mar 2019 09:42:23 -0600
Message-ID: <CAJdd5GbuW6ZxyCwG_4_3SJXgW=_=Zzmqx5TNgbYvVbFGP6P0CA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] vim: Import version 8.1.0347
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
X-List-Received-Date: Sat, 02 Mar 2019 15:42:36 -0000
Content-Type: multipart/alternative; boundary="00000000000058d9f405831e5fbd"

--00000000000058d9f405831e5fbd
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 1, 2019, 4:27 PM Tom Rini <trini@konsulko.com> wrote:

> In order to have a stand-alone editor in oe-core, bring in vim from
> meta-openembedded/meta-oe.  This imports the recipes as of git commit:
> commit 7b48bd2be97408107c0dd3c74b1e28f042268457
> Author: Ovidiu Panait <ovidiu.panait@windriver.com>
> Date:   Fri Feb 1 10:07:20 2019 +0200
>
>     vim: Enable GUI support for x11 DISTRO_FEATURES
>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  meta/files/common-licenses/vim                     |  81 ++++++++++++++
>  ...0001-src-Makefile-improve-reproducibility.patch |  46 ++++++++
>  .../vim/files/disable_acl_header_check.patch       |  39 +++++++
>  .../vim-add-knob-whether-elf.h-are-checked.patch   |  42 +++++++
>  meta/recipes-support/vim/vim-tiny_8.1.0347.bb      |  15 +++
>  meta/recipes-support/vim/vim_8.1.0347.bb           | 121
> +++++++++++++++++++++
>  6 files changed, 344 insertions(+)
>  create mode 100644 meta/files/common-licenses/vim
>  create mode 100644
> meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
>  create mode 100644
> meta/recipes-support/vim/files/disable_acl_header_check.patch
>  create mode 100644
> meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
>  create mode 100644 meta/recipes-support/vim/vim-tiny_8.1.0347.bb
>  create mode 100644 meta/recipes-support/vim/vim_8.1.0347.bb



Someone should be added as the maintainer of these recipes?


>
> diff --git a/meta/files/common-licenses/vim
> b/meta/files/common-licenses/vim
> new file mode 100644
> index 000000000000..4aa818eb248e
> --- /dev/null
> +++ b/meta/files/common-licenses/vim
> @@ -0,0 +1,81 @@
> +VIM LICENSE
> +
> +I)  There are no restrictions on distributing unmodified copies of Vim
> except
> +    that they must include this license text.  You can also distribute
> +    unmodified parts of Vim, likewise unrestricted except that they must
> +    include this license text.  You are also allowed to include
> executables
> +    that you made from the unmodified Vim sources, plus your own usage
> +    examples and Vim scripts.
> +
> +II) It is allowed to distribute a modified (or extended) version of Vim,
> +    including executables and/or source code, when the following four
> +    conditions are met:
> +    1) This license text must be included unmodified.
> +    2) The modified Vim must be distributed in one of the following five
> ways:
> +       a) If you make changes to Vim yourself, you must clearly describe
> in
> +         the distribution how to contact you.  When the maintainer asks
> you
> +         (in any way) for a copy of the modified Vim you distributed, you
> +         must make your changes, including source code, available to the
> +         maintainer without fee.  The maintainer reserves the right to
> +         include your changes in the official version of Vim.  What the
> +         maintainer will do with your changes and under what license they
> +         will be distributed is negotiable.  If there has been no
> negotiation
> +         then this license, or a later version, also applies to your
> changes.
> +         The current maintainer is Bram Moolenaar <Bram@vim.org>.  If
> this
> +         changes it will be announced in appropriate places (most likely
> +         vim.sf.net, www.vim.org and/or comp.editors).  When it is
> completely
> +         impossible to contact the maintainer, the obligation to send him
> +         your changes ceases.  Once the maintainer has confirmed that he
> has
> +         received your changes they will not have to be sent again.
> +       b) If you have received a modified Vim that was distributed as
> +         mentioned under a) you are allowed to further distribute it
> +         unmodified, as mentioned at I).  If you make additional changes
> the
> +         text under a) applies to those changes.
> +       c) Provide all the changes, including source code, with every copy
> of
> +         the modified Vim you distribute.  This may be done in the form
> of a
> +         context diff.  You can choose what license to use for new code
> you
> +         add.  The changes and their license must not restrict others from
> +         making their own changes to the official version of Vim.
> +       d) When you have a modified Vim which includes changes as mentioned
> +         under c), you can distribute it without the source code for the
> +         changes if the following three conditions are met:
> +         - The license that applies to the changes permits you to
> distribute
> +           the changes to the Vim maintainer without fee or restriction,
> and
> +           permits the Vim maintainer to include the changes in the
> official
> +           version of Vim without fee or restriction.
> +         - You keep the changes for at least three years after last
> +           distributing the corresponding modified Vim.  When the
> maintainer
> +           or someone who you distributed the modified Vim to asks you (in
> +           any way) for the changes within this period, you must make them
> +           available to him.
> +         - You clearly describe in the distribution how to contact you.
> This
> +           contact information must remain valid for at least three years
> +           after last distributing the corresponding modified Vim, or as
> long
> +           as possible.
> +       e) When the GNU General Public License (GPL) applies to the
> changes,
> +         you can distribute the modified Vim under the GNU GPL version 2
> or
> +         any later version.
> +    3) A message must be added, at least in the output of the ":version"
> +       command and in the intro screen, such that the user of the
> modified Vim
> +       is able to see that it was modified.  When distributing as
> mentioned
> +       under 2)e) adding the message is only required for as far as this
> does
> +       not conflict with the license used for the changes.
> +    4) The contact information as required under 2)a) and 2)d) must not be
> +       removed or changed, except that the person himself can make
> +       corrections.
> +
> +III) If you distribute a modified version of Vim, you are encouraged to
> use
> +     the Vim license for your changes and make them available to the
> +     maintainer, including the source code.  The preferred way to do this
> is
> +     by e-mail or by uploading the files to a server and e-mailing the
> URL.
> +     If the number of changes is small (e.g., a modified Makefile)
> e-mailing a
> +     context diff will do.  The e-mail address to be used is
> +     <maintainer@vim.org>
> +
> +IV)  It is not allowed to remove this license from the distribution of
> the Vim
> +     sources, parts of it or from a modified version.  You may use this
> +     license for previous Vim releases instead of the license that they
> came
> +     with, at your option.
> +
> +===
> +Read more about this license at
> http://vimdoc.sourceforge.net/htmldoc/uganda.html#license
> diff --git
> a/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
> b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
> new file mode 100644
> index 000000000000..63a7b78f12f1
> --- /dev/null
> +++
> b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
> @@ -0,0 +1,46 @@
> +From 133ab27cdb17ca20ef6b0304cf30621d2bcbe757 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Thu, 31 Jan 2019 21:32:26 -0800
> +Subject: [PATCH] src/Makefile: improve reproducibility
> +
> +Clear all_cflags, all_lflags, compiled_user
> +and compiled_sys to avoid introducing build
> +info to improve reproducibility as below:
> +
> +WARNING: vim-8.1.0347-r0 do_package_qa: QA Issue: File
> /work/core2-64-wrs-linux/vim/8.1.0347-r0/packages-split/vim/usr/bin/vim.vim
> in package contained reference to tmpdir [buildpaths]
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + src/Makefile | 14 ++++----------
> + 1 file changed, 4 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index f2fafa4dc..7148d4bd9 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -2845,16 +2845,10 @@ auto/pathdef.c: Makefile auto/config.mk
> +       -@echo '#include "vim.h"' >> $@
> +       -@echo 'char_u *default_vim_dir = (char_u *)"$(VIMRCLOC)";' |
> $(QUOTESED) >> $@
> +       -@echo 'char_u *default_vimruntime_dir = (char_u
> *)"$(VIMRUNTIMEDIR)";' | $(QUOTESED) >> $@
> +-      -@echo 'char_u *all_cflags = (char_u *)"$(CC) -c -I$(srcdir)
> $(ALL_CFLAGS)";' | $(QUOTESED) >>  $@
> +-      -@echo 'char_u *all_lflags = (char_u *)"$(CC) $(ALL_LIB_DIRS)
> $(LDFLAGS) -o $(VIMTARGET) $(ALL_LIBS) ";' | $(QUOTESED) >>  $@
> +-      -@echo 'char_u *compiled_user = (char_u *)"' | tr -d $(NL) >> $@
> +-      -@if test -n "$(COMPILEDBY)"; then \
> +-              echo "$(COMPILEDBY)" | tr -d $(NL) >> $@; \
> +-              else ((logname) 2>/dev/null || whoami) | tr -d $(NL) >>
> $@; fi
> +-      -@echo '";' >> $@
> +-      -@echo 'char_u *compiled_sys = (char_u *)"' | tr -d $(NL) >> $@
> +-      -@if test -z "$(COMPILEDBY)"; then hostname | tr -d $(NL) >> $@; fi
> +-      -@echo '";' >> $@
> ++      -@echo 'char_u *all_cflags = (char_u *)"";' | $(QUOTESED) >>  $@
> ++      -@echo 'char_u *all_lflags = (char_u *)"";' | $(QUOTESED) >>  $@
> ++      -@echo 'char_u *compiled_user = (char_u *)"";' >> $@
> ++      -@echo 'char_u *compiled_sys = (char_u *)"";' >> $@
> +       -@sh $(srcdir)/pathdef.sh
> +
> + GUI_GTK_RES_INPUTS = \
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-support/vim/files/disable_acl_header_check.patch
> b/meta/recipes-support/vim/files/disable_acl_header_check.patch
> new file mode 100644
> index 000000000000..4720003c252a
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/disable_acl_header_check.patch
> @@ -0,0 +1,39 @@
> +From 5ed25c076a1fb1889a3c50dddf29f21850b59a13 Mon Sep 17 00:00:00 2001
> +From: Wenzong Fan <wenzong.fan@windriver.com>
> +Date: Tue, 26 Jun 2018 17:29:09 +0800
> +Subject: [PATCH] disable acl header check
> +
> +Don't check 'sys/acl.h' if acl support disabled for vim/vim-tiny.
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/configure.ac | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/configure.ac b/src/configure.ac
> +index 107c170..0ee86ad 100644
> +--- a/src/configure.ac
> ++++ b/src/configure.ac
> +@@ -3220,7 +3220,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
> +       sys/systeminfo.h locale.h sys/stream.h termios.h \
> +       libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
> +       utime.h sys/param.h libintl.h libgen.h \
> +-      util/debug.h util/msg18n.h frame.h sys/acl.h \
> ++      util/debug.h util/msg18n.h frame.h \
> +       sys/access.h sys/sysinfo.h wchar.h wctype.h)
> +
> + dnl sys/ptem.h depends on sys/stream.h on Solaris
> +@@ -3848,6 +3848,7 @@ AC_ARG_ENABLE(acl,
> +       , [enable_acl="yes"])
> + if test "$enable_acl" = "yes"; then
> +   AC_MSG_RESULT(no)
> ++  AC_CHECK_HEADERS(sys/acl.h)
> +   AC_CHECK_LIB(posix1e, acl_get_file, [LIBS="$LIBS -lposix1e"],
> +       AC_CHECK_LIB(acl, acl_get_file, [LIBS="$LIBS -lacl"
> +                 AC_CHECK_LIB(attr, fgetxattr, LIBS="$LIBS
> -lattr",,)],,),)
> +--
> +2.7.4
> +
> diff --git
> a/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
> b/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
> new file mode 100644
> index 000000000000..37914d4cd9c1
> --- /dev/null
> +++
> b/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
> @@ -0,0 +1,42 @@
> +From 38de4bccdb8a861ffdd447f12fdab19d6d852c02 Mon Sep 17 00:00:00 2001
> +From: Chong Lu <Chong.Lu@windriver.com>
> +Date: Tue, 26 Jun 2018 17:34:15 +0800
> +Subject: [PATCH] vim: add knob whether elf.h are checked
> +
> +Previously, it still was checked when there was no elf library in
> sysroots directory.
> +Add knob to decide whether elf.h are checked or not.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/configure.ac | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/src/configure.ac b/src/configure.ac
> +index 0ee86ad..64736f0 100644
> +--- a/src/configure.ac
> ++++ b/src/configure.ac
> +@@ -3192,11 +3192,18 @@ AC_TRY_COMPILE([#include <stdio.h>], [int x
> __attribute__((unused));],
> +       AC_MSG_RESULT(no))
> +
> + dnl Checks for header files.
> ++AC_MSG_CHECKING(whether or not to look for elf.h)
> ++AC_ARG_ENABLE(elf-check,
> ++        [  --enable-elf-check      If elfutils, check for elf.h
> [default=no]],
> ++        , enable_elf_check="no")
> ++AC_MSG_RESULT($enable_elf_check)
> ++if test "x$enable_elf_check" != "xno"; then
> + AC_CHECK_HEADER(elf.h, HAS_ELF=1)
> + dnl AC_CHECK_HEADER(dwarf.h, SVR4=1)
> + if test "$HAS_ELF" = 1; then
> +   AC_CHECK_LIB(elf, main)
> + fi
> ++fi
> +
> + AC_HEADER_DIRENT
> +
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-support/vim/vim-tiny_8.1.0347.bb
> b/meta/recipes-support/vim/vim-tiny_8.1.0347.bb
> new file mode 100644
> index 000000000000..8b1fb7b1158d
> --- /dev/null
> +++ b/meta/recipes-support/vim/vim-tiny_8.1.0347.bb
> @@ -0,0 +1,15 @@
> +require vim_${PV}.bb
> +
> +SUMMARY += " (with tiny features)"
> +
> +PROVIDES_remove = "xxd"
> +ALTERNATIVE_${PN}_remove = "xxd"
> +
> +PACKAGECONFIG += "tiny"
> +
> +do_install() {
> +    install -D -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
> +}
> +
> +ALTERNATIVE_PRIORITY = "90"
> +ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
> diff --git a/meta/recipes-support/vim/vim_8.1.0347.bb
> b/meta/recipes-support/vim/vim_8.1.0347.bb
> new file mode 100644
> index 000000000000..070583158467
> --- /dev/null
> +++ b/meta/recipes-support/vim/vim_8.1.0347.bb
> @@ -0,0 +1,121 @@
> +SUMMARY = "Vi IMproved - enhanced vi editor"
> +SECTION = "console/utils"
> +
> +PROVIDES = "xxd"
> +DEPENDS = "ncurses gettext-native"
> +# vimdiff doesn't like busybox diff
> +RSUGGESTS_${PN} = "diffutils"
> +LICENSE = "vim"
> +LIC_FILES_CHKSUM =
> "file://../runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
> +
> +SRC_URI = "git://github.com/vim/vim.git \
> +           file://disable_acl_header_check.patch;patchdir=.. \
> +
>  file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
> +
>  file://0001-src-Makefile-improve-reproducibility.patch;patchdir=.. \
> +"
> +SRCREV = "f1c118be93184e8e57e3e80b1b3383f464ed649e"
> +
> +S = "${WORKDIR}/git/src"
> +
> +VIMDIR =
> "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
> +
> +inherit autotools-brokensep update-alternatives
> +
> +CLEANBROKEN = "1"
> +
> +# vim configure.in contains functions which got 'dropped' by
> autotools.bbclass
> +do_configure () {
> +    rm -f auto/*
> +    touch auto/config.mk
> +    aclocal
> +    autoconf
> +    oe_runconf
> +    touch auto/configure
> +    touch auto/config.mk auto/config.h
> +}
> +
> +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG += " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
> +"
> +
> +PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
> +PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
> +PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
> +PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
> +PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
> +
> +EXTRA_OECONF = " \
> +    --disable-gpm \
> +    --disable-gtktest \
> +    --disable-xim \
> +    --disable-netbeans \
> +    --with-tlib=ncurses \
> +    ac_cv_small_wchar_t=no \
> +    vim_cv_getcwd_broken=no \
> +    vim_cv_memmove_handles_overlap=yes \
> +    vim_cv_stat_ignores_slash=no \
> +    vim_cv_terminfo=yes \
> +    vim_cv_tgetent=non-zero \
> +    vim_cv_toupper_broken=no \
> +    vim_cv_tty_group=world \
> +    STRIP=/bin/true \
> +"
> +
> +do_install() {
> +    autotools_do_install
> +
> +    # Work around file-rdeps picking up csh, awk, perl or python as a dep
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
> +
> +    # Install example vimrc from runtime files
> +    install -m 0644 ../runtime/vimrc_example.vim
> ${D}/${datadir}/${BPN}/vimrc
> +
> +    # we use --with-features=big as default
> +    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
> +}
> +
> +PARALLEL_MAKEINST = ""
> +
> +PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc
> ${PN}-tools"
> +FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
> +FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
> +FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor
> ${bindir}/${BPN}tutor"
> +FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
> +FILES_${PN}-data = "${datadir}/${BPN}"
> +FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
> +FILES_${PN}-common = " \
> +    ${datadir}/${BPN}/${VIMDIR}/*.vim \
> +    ${datadir}/${BPN}/${VIMDIR}/autoload \
> +    ${datadir}/${BPN}/${VIMDIR}/colors \
> +    ${datadir}/${BPN}/${VIMDIR}/compiler \
> +    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
> +    ${datadir}/${BPN}/${VIMDIR}/indent \
> +    ${datadir}/${BPN}/${VIMDIR}/keymap \
> +    ${datadir}/${BPN}/${VIMDIR}/lang \
> +    ${datadir}/${BPN}/${VIMDIR}/macros \
> +    ${datadir}/${BPN}/${VIMDIR}/plugin \
> +    ${datadir}/${BPN}/${VIMDIR}/print \
> +    ${datadir}/${BPN}/${VIMDIR}/spell \
> +    ${datadir}/icons \
> +"
> +
> +RDEPENDS_${BPN} = "ncurses-terminfo-base"
> +# Recommend that runtime data is installed along with vim
> +RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc
> ${PN}-common"
> +
> +ALTERNATIVE_${PN} = "vi vim xxd"
> +ALTERNATIVE_PRIORITY = "100"
> +ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
> +ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
> +ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
> +ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
> +ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000058d9f405831e5fbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 1, 2019, 4:27 PM Tom Rini &lt;<a href=3D"m=
ailto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">In order to have a stand-alone editor in oe-core, =
bring in vim from<br>
meta-openembedded/meta-oe.=C2=A0 This imports the recipes as of git commit:=
<br>
commit 7b48bd2be97408107c0dd3c74b1e28f042268457<br>
Author: Ovidiu Panait &lt;<a href=3D"mailto:ovidiu.panait@windriver.com" ta=
rget=3D"_blank" rel=3D"noreferrer">ovidiu.panait@windriver.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Fri Feb 1 10:07:20 2019 +0200<br>
<br>
=C2=A0 =C2=A0 vim: Enable GUI support for x11 DISTRO_FEATURES<br>
<br>
Signed-off-by: Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com" target=3D=
"_blank" rel=3D"noreferrer">trini@konsulko.com</a>&gt;<br>
---<br>
=C2=A0meta/files/common-licenses/vim=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 81 ++++++++++++++<br>
=C2=A0...0001-src-Makefile-improve-reproducibility.patch |=C2=A0 46 +++++++=
+<br>
=C2=A0.../vim/files/disable_acl_header_check.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 39 +++++++<br>
=C2=A0.../vim-add-knob-whether-elf.h-are-checked.patch=C2=A0 =C2=A0|=C2=A0 =
42 +++++++<br>
=C2=A0meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.0347.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">vim-tiny_8.1.0347.bb</a>=C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 15 +++<br>
=C2=A0meta/recipes-support/vim/<a href=3D"http://vim_8.1.0347.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">vim_8.1.0347.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 121 +++++++++++++++++++++<br>
=C2=A06 files changed, 344 insertions(+)<br>
=C2=A0create mode 100644 meta/files/common-licenses/vim<br>
=C2=A0create mode 100644 meta/recipes-support/vim/files/0001-src-Makefile-i=
mprove-reproducibility.patch<br>
=C2=A0create mode 100644 meta/recipes-support/vim/files/disable_acl_header_=
check.patch<br>
=C2=A0create mode 100644 meta/recipes-support/vim/files/vim-add-knob-whethe=
r-elf.h-are-checked.patch<br>
=C2=A0create mode 100644 meta/recipes-support/vim/<a href=3D"http://vim-tin=
y_8.1.0347.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">vim-tiny_8.1=
.0347.bb</a><br>
=C2=A0create mode 100644 meta/recipes-support/vim/<a href=3D"http://vim_8.1=
.0347.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">vim_8.1.0347.bb</=
a></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Someone should be added as the maintainer of thes=
e recipes?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
diff --git a/meta/files/common-licenses/vim b/meta/files/common-licenses/vi=
m<br>
new file mode 100644<br>
index 000000000000..4aa818eb248e<br>
--- /dev/null<br>
+++ b/meta/files/common-licenses/vim<br>
@@ -0,0 +1,81 @@<br>
+VIM LICENSE<br>
+<br>
+I)=C2=A0 There are no restrictions on distributing unmodified copies of Vi=
m except<br>
+=C2=A0 =C2=A0 that they must include this license text.=C2=A0 You can also=
 distribute<br>
+=C2=A0 =C2=A0 unmodified parts of Vim, likewise unrestricted except that t=
hey must<br>
+=C2=A0 =C2=A0 include this license text.=C2=A0 You are also allowed to inc=
lude executables<br>
+=C2=A0 =C2=A0 that you made from the unmodified Vim sources, plus your own=
 usage<br>
+=C2=A0 =C2=A0 examples and Vim scripts.<br>
+<br>
+II) It is allowed to distribute a modified (or extended) version of Vim,<b=
r>
+=C2=A0 =C2=A0 including executables and/or source code, when the following=
 four<br>
+=C2=A0 =C2=A0 conditions are met:<br>
+=C2=A0 =C2=A0 1) This license text must be included unmodified.<br>
+=C2=A0 =C2=A0 2) The modified Vim must be distributed in one of the follow=
ing five ways:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0a) If you make changes to Vim yourself, you mus=
t clearly describe in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the distribution how to contact you.=C2=
=A0 When the maintainer asks you<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(in any way) for a copy of the modified =
Vim you distributed, you<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0must make your changes, including source=
 code, available to the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maintainer without fee.=C2=A0 The mainta=
iner reserves the right to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include your changes in the official ver=
sion of Vim.=C2=A0 What the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maintainer will do with your changes and=
 under what license they<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be distributed is negotiable.=C2=A0=
 If there has been no negotiation<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then this license, or a later version, a=
lso applies to your changes.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The current maintainer is Bram Moolenaar=
 &lt;<a href=3D"mailto:Bram@vim.org" target=3D"_blank" rel=3D"noreferrer">B=
ram@vim.org</a>&gt;.=C2=A0 If this<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0changes it will be announced in appropri=
ate places (most likely<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://vim.sf.net" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">vim.sf.net</a>, <a href=3D"http://www=
.vim.org" rel=3D"noreferrer noreferrer" target=3D"_blank">www.vim.org</a> a=
nd/or comp.editors).=C2=A0 When it is completely<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0impossible to contact the maintainer, th=
e obligation to send him<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0your changes ceases.=C2=A0 Once the main=
tainer has confirmed that he has<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0received your changes they will not have=
 to be sent again.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b) If you have received a modified Vim that was=
 distributed as<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mentioned under a) you are allowed to fu=
rther distribute it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unmodified, as mentioned at I).=C2=A0 If=
 you make additional changes the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0text under a) applies to those changes.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0c) Provide all the changes, including source co=
de, with every copy of<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the modified Vim you distribute.=C2=A0 T=
his may be done in the form of a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0context diff.=C2=A0 You can choose what =
license to use for new code you<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add.=C2=A0 The changes and their license=
 must not restrict others from<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0making their own changes to the official=
 version of Vim.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d) When you have a modified Vim which includes =
changes as mentioned<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0under c), you can distribute it without =
the source code for the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0changes if the following three condition=
s are met:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- The license that applies to the change=
s permits you to distribute<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the changes to the Vim maintainer=
 without fee or restriction, and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0permits the Vim maintainer to inc=
lude the changes in the official<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version of Vim without fee or res=
triction.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- You keep the changes for at least thre=
e years after last<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0distributing the corresponding mo=
dified Vim.=C2=A0 When the maintainer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0or someone who you distributed th=
e modified Vim to asks you (in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0any way) for the changes within t=
his period, you must make them<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0available to him.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- You clearly describe in the distributi=
on how to contact you.=C2=A0 This<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0contact information must remain v=
alid for at least three years<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0after last distributing the corre=
sponding modified Vim, or as long<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as possible.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0e) When the GNU General Public License (GPL) ap=
plies to the changes,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0you can distribute the modified Vim unde=
r the GNU GPL version 2 or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0any later version.<br>
+=C2=A0 =C2=A0 3) A message must be added, at least in the output of the &q=
uot;:version&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0command and in the intro screen, such that the =
user of the modified Vim<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0is able to see that it was modified.=C2=A0 When=
 distributing as mentioned<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0under 2)e) adding the message is only required =
for as far as this does<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0not conflict with the license used for the chan=
ges.<br>
+=C2=A0 =C2=A0 4) The contact information as required under 2)a) and 2)d) m=
ust not be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0removed or changed, except that the person hims=
elf can make<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0corrections.<br>
+<br>
+III) If you distribute a modified version of Vim, you are encouraged to us=
e<br>
+=C2=A0 =C2=A0 =C2=A0the Vim license for your changes and make them availab=
le to the<br>
+=C2=A0 =C2=A0 =C2=A0maintainer, including the source code.=C2=A0 The prefe=
rred way to do this is<br>
+=C2=A0 =C2=A0 =C2=A0by e-mail or by uploading the files to a server and e-=
mailing the URL.<br>
+=C2=A0 =C2=A0 =C2=A0If the number of changes is small (e.g., a modified Ma=
kefile) e-mailing a<br>
+=C2=A0 =C2=A0 =C2=A0context diff will do.=C2=A0 The e-mail address to be u=
sed is<br>
+=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:maintainer@vim.org" target=3D"_b=
lank" rel=3D"noreferrer">maintainer@vim.org</a>&gt;<br>
+<br>
+IV)=C2=A0 It is not allowed to remove this license from the distribution o=
f the Vim<br>
+=C2=A0 =C2=A0 =C2=A0sources, parts of it or from a modified version.=C2=A0=
 You may use this<br>
+=C2=A0 =C2=A0 =C2=A0license for previous Vim releases instead of the licen=
se that they came<br>
+=C2=A0 =C2=A0 =C2=A0with, at your option.<br>
+<br>
+=3D=3D=3D<br>
+Read more about this license at <a href=3D"http://vimdoc.sourceforge.net/h=
tmldoc/uganda.html#license" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>http://vimdoc.sourceforge.net/htmldoc/uganda.html#license</a><br>
diff --git a/meta/recipes-support/vim/files/0001-src-Makefile-improve-repro=
ducibility.patch b/meta/recipes-support/vim/files/0001-src-Makefile-improve=
-reproducibility.patch<br>
new file mode 100644<br>
index 000000000000..63a7b78f12f1<br>
--- /dev/null<br>
+++ b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibil=
ity.patch<br>
@@ -0,0 +1,46 @@<br>
+From 133ab27cdb17ca20ef6b0304cf30621d2bcbe757 Mon Sep 17 00:00:00 2001<br>
+From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_=
blank" rel=3D"noreferrer">mingli.yu@windriver.com</a>&gt;<br>
+Date: Thu, 31 Jan 2019 21:32:26 -0800<br>
+Subject: [PATCH] src/Makefile: improve reproducibility<br>
+<br>
+Clear all_cflags, all_lflags, compiled_user<br>
+and compiled_sys to avoid introducing build<br>
+info to improve reproducibility as below:<br>
+<br>
+WARNING: vim-8.1.0347-r0 do_package_qa: QA Issue: File /work/core2-64-wrs-=
linux/vim/8.1.0347-r0/packages-split/vim/usr/bin/vim.vim in package contain=
ed reference to tmpdir [buildpaths]<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank" rel=3D"noreferrer">mingli.yu@windriver.com</a>&gt;<br>
+---<br>
+ src/Makefile | 14 ++++----------<br>
+ 1 file changed, 4 insertions(+), 10 deletions(-)<br>
+<br>
+diff --git a/src/Makefile b/src/Makefile<br>
+index f2fafa4dc..7148d4bd9 100644<br>
+--- a/src/Makefile<br>
++++ b/src/Makefile<br>
+@@ -2845,16 +2845,10 @@ auto/pathdef.c: Makefile auto/<a href=3D"http://co=
nfig.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">config.mk</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-@echo &#39;#include &quot;vim.h&quot;&#39; &gt=
;&gt; $@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-@echo &#39;char_u *default_vim_dir =3D (char_u=
 *)&quot;$(VIMRCLOC)&quot;;&#39; | $(QUOTESED) &gt;&gt; $@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-@echo &#39;char_u *default_vimruntime_dir =3D =
(char_u *)&quot;$(VIMRUNTIMEDIR)&quot;;&#39; | $(QUOTESED) &gt;&gt; $@<br>
+-=C2=A0 =C2=A0 =C2=A0 -@echo &#39;char_u *all_cflags =3D (char_u *)&quot;$=
(CC) -c -I$(srcdir) $(ALL_CFLAGS)&quot;;&#39; | $(QUOTESED) &gt;&gt;=C2=A0 =
$@<br>
+-=C2=A0 =C2=A0 =C2=A0 -@echo &#39;char_u *all_lflags =3D (char_u *)&quot;$=
(CC) $(ALL_LIB_DIRS) $(LDFLAGS) -o $(VIMTARGET) $(ALL_LIBS) &quot;;&#39; | =
$(QUOTESED) &gt;&gt;=C2=A0 $@<br>
+-=C2=A0 =C2=A0 =C2=A0 -@echo &#39;char_u *compiled_user =3D (char_u *)&quo=
t;&#39; | tr -d $(NL) &gt;&gt; $@<br>
+-=C2=A0 =C2=A0 =C2=A0 -@if test -n &quot;$(COMPILEDBY)&quot;; then \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$(COMPILEDBY)=
&quot; | tr -d $(NL) &gt;&gt; $@; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else ((logname) 2&gt;/de=
v/null || whoami) | tr -d $(NL) &gt;&gt; $@; fi<br>
+-=C2=A0 =C2=A0 =C2=A0 -@echo &#39;&quot;;&#39; &gt;&gt; $@<br>
+-=C2=A0 =C2=A0 =C2=A0 -@echo &#39;char_u *compiled_sys =3D (char_u *)&quot=
;&#39; | tr -d $(NL) &gt;&gt; $@<br>
+-=C2=A0 =C2=A0 =C2=A0 -@if test -z &quot;$(COMPILEDBY)&quot;; then hostnam=
e | tr -d $(NL) &gt;&gt; $@; fi<br>
+-=C2=A0 =C2=A0 =C2=A0 -@echo &#39;&quot;;&#39; &gt;&gt; $@<br>
++=C2=A0 =C2=A0 =C2=A0 -@echo &#39;char_u *all_cflags =3D (char_u *)&quot;&=
quot;;&#39; | $(QUOTESED) &gt;&gt;=C2=A0 $@<br>
++=C2=A0 =C2=A0 =C2=A0 -@echo &#39;char_u *all_lflags =3D (char_u *)&quot;&=
quot;;&#39; | $(QUOTESED) &gt;&gt;=C2=A0 $@<br>
++=C2=A0 =C2=A0 =C2=A0 -@echo &#39;char_u *compiled_user =3D (char_u *)&quo=
t;&quot;;&#39; &gt;&gt; $@<br>
++=C2=A0 =C2=A0 =C2=A0 -@echo &#39;char_u *compiled_sys =3D (char_u *)&quot=
;&quot;;&#39; &gt;&gt; $@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-@sh $(srcdir)/pathdef.sh<br>
+ <br>
+ GUI_GTK_RES_INPUTS =3D \<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-support/vim/files/disable_acl_header_check.patch =
b/meta/recipes-support/vim/files/disable_acl_header_check.patch<br>
new file mode 100644<br>
index 000000000000..4720003c252a<br>
--- /dev/null<br>
+++ b/meta/recipes-support/vim/files/disable_acl_header_check.patch<br>
@@ -0,0 +1,39 @@<br>
+From 5ed25c076a1fb1889a3c50dddf29f21850b59a13 Mon Sep 17 00:00:00 2001<br>
+From: Wenzong Fan &lt;<a href=3D"mailto:wenzong.fan@windriver.com" target=
=3D"_blank" rel=3D"noreferrer">wenzong.fan@windriver.com</a>&gt; <br>
+Date: Tue, 26 Jun 2018 17:29:09 +0800<br>
+Subject: [PATCH] disable acl header check<br>
+<br>
+Don&#39;t check &#39;sys/acl.h&#39; if acl support disabled for vim/vim-ti=
ny.<br>
+<br>
+Upstream-Status: pending<br>
+<br>
+Signed-off-by: Wenzong Fan &lt;<a href=3D"mailto:wenzong.fan@windriver.com=
" target=3D"_blank" rel=3D"noreferrer">wenzong.fan@windriver.com</a>&gt;<br=
>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank" rel=3D"noreferrer">changqing.li@windriver.com</a>&gt;=
<br>
+---<br>
+ src/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" target=
=3D"_blank">configure.ac</a> | 3 ++-<br>
+ 1 file changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/<a href=3D"http://configure.ac" rel=3D"noreferrer norefer=
rer" target=3D"_blank">configure.ac</a> b/src/<a href=3D"http://configure.a=
c" rel=3D"noreferrer noreferrer" target=3D"_blank">configure.ac</a><br>
+index 107c170..0ee86ad 100644<br>
+--- a/src/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
++++ b/src/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
+@@ -3220,7 +3220,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sys/systeminfo.h locale.h sys/stream.h termios.=
h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libc.h sys/statfs.h poll.h sys/poll.h pwd.h \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0utime.h sys/param.h libintl.h libgen.h \<br>
+-=C2=A0 =C2=A0 =C2=A0 util/debug.h util/msg18n.h frame.h sys/acl.h \<br>
++=C2=A0 =C2=A0 =C2=A0 util/debug.h util/msg18n.h frame.h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sys/access.h sys/sysinfo.h wchar.h wctype.h)<br=
>
+ <br>
+ dnl sys/ptem.h depends on sys/stream.h on Solaris<br>
+@@ -3848,6 +3848,7 @@ AC_ARG_ENABLE(acl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0, [enable_acl=3D&quot;yes&quot;])<br>
+ if test &quot;$enable_acl&quot; =3D &quot;yes&quot;; then<br>
+=C2=A0 =C2=A0AC_MSG_RESULT(no)<br>
++=C2=A0 AC_CHECK_HEADERS(sys/acl.h)<br>
+=C2=A0 =C2=A0AC_CHECK_LIB(posix1e, acl_get_file, [LIBS=3D&quot;$LIBS -lpos=
ix1e&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_LIB(acl, acl_get_file, [LIBS=3D&quot;$=
LIBS -lacl&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_LIB=
(attr, fgetxattr, LIBS=3D&quot;$LIBS -lattr&quot;,,)],,),)<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-=
checked.patch b/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-a=
re-checked.patch<br>
new file mode 100644<br>
index 000000000000..37914d4cd9c1<br>
--- /dev/null<br>
+++ b/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked=
.patch<br>
@@ -0,0 +1,42 @@<br>
+From 38de4bccdb8a861ffdd447f12fdab19d6d852c02 Mon Sep 17 00:00:00 2001<br>
+From: Chong Lu &lt;<a href=3D"mailto:Chong.Lu@windriver.com" target=3D"_bl=
ank" rel=3D"noreferrer">Chong.Lu@windriver.com</a>&gt;<br>
+Date: Tue, 26 Jun 2018 17:34:15 +0800<br>
+Subject: [PATCH] vim: add knob whether elf.h are checked<br>
+<br>
+Previously, it still was checked when there was no elf library in sysroots=
 directory.<br>
+Add knob to decide whether elf.h are checked or not.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Chong Lu &lt;<a href=3D"mailto:Chong.Lu@windriver.com" targ=
et=3D"_blank" rel=3D"noreferrer">Chong.Lu@windriver.com</a>&gt;<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank" rel=3D"noreferrer">changqing.li@windriver.com</a>&gt;=
<br>
+---<br>
+ src/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" target=
=3D"_blank">configure.ac</a> | 7 +++++++<br>
+ 1 file changed, 7 insertions(+)<br>
+<br>
+diff --git a/src/<a href=3D"http://configure.ac" rel=3D"noreferrer norefer=
rer" target=3D"_blank">configure.ac</a> b/src/<a href=3D"http://configure.a=
c" rel=3D"noreferrer noreferrer" target=3D"_blank">configure.ac</a><br>
+index 0ee86ad..64736f0 100644<br>
+--- a/src/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
++++ b/src/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
+@@ -3192,11 +3192,18 @@ AC_TRY_COMPILE([#include &lt;stdio.h&gt;], [int x =
__attribute__((unused));],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT(no))<br>
+ <br>
+ dnl Checks for header files.<br>
++AC_MSG_CHECKING(whether or not to look for elf.h)<br>
++AC_ARG_ENABLE(elf-check,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 [=C2=A0 --enable-elf-check=C2=A0 =C2=A0 =C2=
=A0 If elfutils, check for elf.h [default=3Dno]],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 , enable_elf_check=3D&quot;no&quot;)<br>
++AC_MSG_RESULT($enable_elf_check)<br>
++if test &quot;x$enable_elf_check&quot; !=3D &quot;xno&quot;; then<br>
+ AC_CHECK_HEADER(elf.h, HAS_ELF=3D1)<br>
+ dnl AC_CHECK_HEADER(dwarf.h, SVR4=3D1)<br>
+ if test &quot;$HAS_ELF&quot; =3D 1; then<br>
+=C2=A0 =C2=A0AC_CHECK_LIB(elf, main)<br>
+ fi<br>
++fi<br>
+ <br>
+ AC_HEADER_DIRENT<br>
+ <br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.0347.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">vim-tiny_8.1.0347.bb</a>=
 b/meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.0347.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">vim-tiny_8.1.0347.bb</a><br>
new file mode 100644<br>
index 000000000000..8b1fb7b1158d<br>
--- /dev/null<br>
+++ b/meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.0347.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">vim-tiny_8.1.0347.bb</a><br>
@@ -0,0 +1,15 @@<br>
+require vim_${PV}.bb<br>
+<br>
+SUMMARY +=3D &quot; (with tiny features)&quot;<br>
+<br>
+PROVIDES_remove =3D &quot;xxd&quot;<br>
+ALTERNATIVE_${PN}_remove =3D &quot;xxd&quot;<br>
+<br>
+PACKAGECONFIG +=3D &quot;tiny&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -D -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny<br>
+}<br>
+<br>
+ALTERNATIVE_PRIORITY =3D &quot;90&quot;<br>
+ALTERNATIVE_TARGET =3D &quot;${bindir}/vim.tiny&quot;<br>
diff --git a/meta/recipes-support/vim/<a href=3D"http://vim_8.1.0347.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">vim_8.1.0347.bb</a> b/meta/re=
cipes-support/vim/<a href=3D"http://vim_8.1.0347.bb" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">vim_8.1.0347.bb</a><br>
new file mode 100644<br>
index 000000000000..070583158467<br>
--- /dev/null<br>
+++ b/meta/recipes-support/vim/<a href=3D"http://vim_8.1.0347.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">vim_8.1.0347.bb</a><br>
@@ -0,0 +1,121 @@<br>
+SUMMARY =3D &quot;Vi IMproved - enhanced vi editor&quot;<br>
+SECTION =3D &quot;console/utils&quot;<br>
+<br>
+PROVIDES =3D &quot;xxd&quot;<br>
+DEPENDS =3D &quot;ncurses gettext-native&quot;<br>
+# vimdiff doesn&#39;t like busybox diff<br>
+RSUGGESTS_${PN} =3D &quot;diffutils&quot;<br>
+LICENSE =3D &quot;vim&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://../runtime/doc/uganda.txt;endline=3D287;=
md5=3Df1f82b42360005c70b8c19b0ef493f72&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/vim/vim.git" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">github.com/vim/vim.git</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable_acl_header_check.p=
atch;patchdir=3D.. \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://vim-add-knob-whether-elf.h=
-are-checked.patch;patchdir=3D.. \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-src-Makefile-improve-=
reproducibility.patch;patchdir=3D.. \<br>
+&quot;<br>
+SRCREV =3D &quot;f1c118be93184e8e57e3e80b1b3383f464ed649e&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git/src&quot;<br>
+<br>
+VIMDIR =3D &quot;vim${@d.getVar(&#39;PV&#39;).split(&#39;.&#39;)[0]}${@d.g=
etVar(&#39;PV&#39;).split(&#39;.&#39;)[1]}&quot;<br>
+<br>
+inherit autotools-brokensep update-alternatives<br>
+<br>
+CLEANBROKEN =3D &quot;1&quot;<br>
+<br>
+# vim <a href=3D"http://configure.in" rel=3D"noreferrer noreferrer" target=
=3D"_blank">configure.in</a> contains functions which got &#39;dropped&#39;=
 by autotools.bbclass<br>
+do_configure () {<br>
+=C2=A0 =C2=A0 rm -f auto/*<br>
+=C2=A0 =C2=A0 touch auto/<a href=3D"http://config.mk" rel=3D"noreferrer no=
referrer" target=3D"_blank">config.mk</a><br>
+=C2=A0 =C2=A0 aclocal<br>
+=C2=A0 =C2=A0 autoconf<br>
+=C2=A0 =C2=A0 oe_runconf<br>
+=C2=A0 =C2=A0 touch auto/configure<br>
+=C2=A0 =C2=A0 touch auto/<a href=3D"http://config.mk" rel=3D"noreferrer no=
referrer" target=3D"_blank">config.mk</a> auto/config.h<br>
+}<br>
+<br>
+#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;acl selin=
ux&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39=
;, &#39;x11 gtkgui&#39;, &#39;&#39;, d)} \<br>
+&quot;<br>
+<br>
+PACKAGECONFIG[gtkgui] =3D &quot;--enable-gui=3Dgtk2,--enable-gui=3Dno,gtk+=
,&quot;<br>
+PACKAGECONFIG[acl] =3D &quot;--enable-acl,--disable-acl,acl,&quot;<br>
+PACKAGECONFIG[x11] =3D &quot;--with-x,--without-x,xt,&quot;<br>
+PACKAGECONFIG[tiny] =3D &quot;--with-features=3Dtiny,--with-features=3Dbig=
,,&quot;<br>
+PACKAGECONFIG[selinux] =3D &quot;--enable-selinux,--disable-selinux,libsel=
inux,&quot;<br>
+PACKAGECONFIG[elfutils] =3D &quot;--enable-elf-check,,elfutils,&quot;<br>
+<br>
+EXTRA_OECONF =3D &quot; \<br>
+=C2=A0 =C2=A0 --disable-gpm \<br>
+=C2=A0 =C2=A0 --disable-gtktest \<br>
+=C2=A0 =C2=A0 --disable-xim \<br>
+=C2=A0 =C2=A0 --disable-netbeans \<br>
+=C2=A0 =C2=A0 --with-tlib=3Dncurses \<br>
+=C2=A0 =C2=A0 ac_cv_small_wchar_t=3Dno \<br>
+=C2=A0 =C2=A0 vim_cv_getcwd_broken=3Dno \<br>
+=C2=A0 =C2=A0 vim_cv_memmove_handles_overlap=3Dyes \<br>
+=C2=A0 =C2=A0 vim_cv_stat_ignores_slash=3Dno \<br>
+=C2=A0 =C2=A0 vim_cv_terminfo=3Dyes \<br>
+=C2=A0 =C2=A0 vim_cv_tgetent=3Dnon-zero \<br>
+=C2=A0 =C2=A0 vim_cv_toupper_broken=3Dno \<br>
+=C2=A0 =C2=A0 vim_cv_tty_group=3Dworld \<br>
+=C2=A0 =C2=A0 STRIP=3D/bin/true \<br>
+&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 autotools_do_install<br>
+<br>
+=C2=A0 =C2=A0 # Work around file-rdeps picking up csh, awk, perl or python=
 as a dep<br>
+=C2=A0 =C2=A0 chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132<br>
+=C2=A0 =C2=A0 chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk<br>
+=C2=A0 =C2=A0 chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl<br>
+=C2=A0 =C2=A0 chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py<br>
+<br>
+=C2=A0 =C2=A0 # Install example vimrc from runtime files<br>
+=C2=A0 =C2=A0 install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}=
/${BPN}/vimrc<br>
+<br>
+=C2=A0 =C2=A0 # we use --with-features=3Dbig as default<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}<br>
+}<br>
+<br>
+PARALLEL_MAKEINST =3D &quot;&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}=
-vimrc ${PN}-tools&quot;<br>
+FILES_${PN}-syntax =3D &quot;${datadir}/${BPN}/${VIMDIR}/syntax&quot;<br>
+FILES_${PN}-help =3D &quot;${datadir}/${BPN}/${VIMDIR}/doc&quot;<br>
+FILES_${PN}-tutor =3D &quot;${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${=
BPN}tutor&quot;<br>
+FILES_${PN}-vimrc =3D &quot;${datadir}/${BPN}/vimrc&quot;<br>
+FILES_${PN}-data =3D &quot;${datadir}/${BPN}&quot;<br>
+FILES_${PN}-tools =3D &quot;${datadir}/${BPN}/${VIMDIR}/tools&quot;<br>
+FILES_${PN}-common =3D &quot; \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/*.vim \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/autoload \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/colors \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/compiler \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/ftplugin \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/indent \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/keymap \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/lang \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/macros \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/plugin \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/print \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/spell \<br>
+=C2=A0 =C2=A0 ${datadir}/icons \<br>
+&quot;<br>
+<br>
+RDEPENDS_${BPN} =3D &quot;ncurses-terminfo-base&quot;<br>
+# Recommend that runtime data is installed along with vim<br>
+RRECOMMENDS_${BPN} =3D &quot;${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vim=
rc ${PN}-common&quot;<br>
+<br>
+ALTERNATIVE_${PN} =3D &quot;vi vim xxd&quot;<br>
+ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
+ALTERNATIVE_TARGET =3D &quot;${bindir}/${BPN}.${BPN}&quot;<br>
+ALTERNATIVE_LINK_NAME[vi] =3D &quot;${base_bindir}/vi&quot;<br>
+ALTERNATIVE_LINK_NAME[vim] =3D &quot;${bindir}/vim&quot;<br>
+ALTERNATIVE_TARGET[xxd] =3D &quot;${bindir}/xxd&quot;<br>
+ALTERNATIVE_LINK_NAME[xxd] =3D &quot;${bindir}/xxd&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--00000000000058d9f405831e5fbd--
