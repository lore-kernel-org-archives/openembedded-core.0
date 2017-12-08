Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id BEEFB78555
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 17:06:01 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id x28so6277883ita.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Dec 2017 09:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=iXPNPsfACgW41pXjynM1oo4eGPIQB/YoJNMYn2lKY2E=;
	b=zUWTIjgYLx31rfKWGh7XuQckc010fF2BnkZ8QIGhntzWZ6wOZmY1vlgKyZyOADf3nQ
	1GuIiVdryYWurLboGK2OR51LR0OTE8PuGYQY1cE1iWhFYxkgGlQ/MeQHG5/oW5shysCO
	iPf20RwTnzsxJmyXNuRhg6MlRw1GyxcSbdjFUe9B1t4yFtKXpBeDWp1w/yscN4cD2sgl
	QpinvwIjLGIlVY/n3uFjfB0XIPm9E86VnEPCU5/nDSivlWFkz/xSnVFTLhzzQq5GnFNb
	Z3T8gy6kfyqaVwKh6WGz2E98tmoYoLvx8F3/xoUR0TABr4XcAE5eT8Yx+FdeLM7xOvzk
	AmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=iXPNPsfACgW41pXjynM1oo4eGPIQB/YoJNMYn2lKY2E=;
	b=cXoWk2Jk2JeiBlDyTgmqCijUlMZqozAkovTHeu1WUGYachVRuBcIpVy6hOg5AkTBx+
	Cpqmp7LFGb5ZiYHP6nUeuzSMt9+FbX/hw8CAyxOyemsqWd8V3wy38D4V8+USzzHV7H5u
	e+2cnFsuiA+gBvp4BJUTkeAGgmor6hGUgIeLcDSnOwWKLp4MwyiQ5wPsDiTtB52m1Sz/
	gnFBQf27OldJaT0nSbyzklg64xNNnfzX1yNw+quez452kLXF7rya2PaJ/42xNRE7wrXY
	CokwqNlnvQi3gN+OKyACw73K8TpG9KVYwVW8wB1QZOzT7JMSYYujp4rfuGVllj1xUt9N
	5uIQ==
X-Gm-Message-State: AKGB3mIPqLUaTRgkCVPcgoF8m3EZtNHzyBvEK0PI6PXbpcjwac/DfKQN
	3nYLbBTZim0plpXEw1Tg7mg69m4dMuJ+iurDoOa5uA==
X-Google-Smtp-Source: AGs4zMYjP0gdsffggk7vgFrFJbcWoB+t6TKdxkaUwmF29hqAvaunNgsSlYfWR9JHi1NTNRL6y4nE+RBoB2CPUWvhFQg=
X-Received: by 10.36.80.148 with SMTP id m142mr6982147itb.6.1512752762049;
	Fri, 08 Dec 2017 09:06:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Fri, 8 Dec 2017 09:05:41 -0800 (PST)
In-Reply-To: <20171208164454.7802-1-ross.burton@intel.com>
References: <20171208164454.7802-1-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Dec 2017 17:05:41 +0000
Message-ID: <CAJTo0La3_94Rg1LXJ9N81Ss4yoFvm3b3unJ5xt6-wc4p4-BFyQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lrzsz: remove
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
X-List-Received-Date: Fri, 08 Dec 2017 17:06:02 -0000
Content-Type: multipart/alternative; boundary="001a114387b803f12c055fd73392"

--001a114387b803f12c055fd73392
Content-Type: text/plain; charset="UTF-8"

I've had people from the past suggest that this is still useful for deeply
embedded environments where a serial line is the only form of
communication, so I'm retracting this and will instead clean up
dependencies so it doesn't end up in all images.

Ross

On 8 December 2017 at 16:44, Ross Burton <ross.burton@intel.com> wrote:

> It's been a long time since anyone wanted to do a ZMODEM transfer over a
> serial
> line and this upstream hasn't been touched in almost two decades.
>
> Let's remove it from oe-core, if there are niches where ZMODEM is still
> useful
> then it can go to another layer.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/distro/include/maintainers.inc           |     1 -
>  .../recipes-bsp/lrzsz/lrzsz-0.12.20/acdefine.patch |    19 -
>  .../lrzsz/lrzsz-0.12.20/autotools.patch            |    39 -
>  meta/recipes-bsp/lrzsz/lrzsz-0.12.20/gettext.patch | 21884
> -------------------
>  .../lrzsz/lrzsz-0.12.20/lrzsz-check-locale.h.patch |    32 -
>  .../lrzsz_fix_for_automake-1.12.patch              |    49 -
>  .../recipes-bsp/lrzsz/lrzsz-0.12.20/makefile.patch |    22 -
>  meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |    48 -
>  .../packagegroups/packagegroup-base.bb             |     3 +-
>  .../packagegroup-core-tools-testapps.bb            |     1 -
>  .../packagegroups/packagegroup-self-hosted.bb      |     1 -
>  .../packagegroups/packagegroup-core-lsb.bb         |     1 -
>  12 files changed, 1 insertion(+), 22099 deletions(-)
>  delete mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/acdefine.patch
>  delete mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools.patch
>  delete mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/gettext.patch
>  delete mode 100644 meta/recipes-bsp/lrzsz/lrzsz-
> 0.12.20/lrzsz-check-locale.h.patch
>  delete mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_
> automake-1.12.patch
>  delete mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/makefile.patch
>  delete mode 100644 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 856a6b763bf..c5cab6cee31 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -460,7 +460,6 @@ RECIPE_MAINTAINER_pn-linux-yocto-rt = "Bruce Ashfield
> <bruce.ashfield@windriver.
>  RECIPE_MAINTAINER_pn-linux-yocto-tiny = "Bruce Ashfield <
> bruce.ashfield@windriver.com>"
>  RECIPE_MAINTAINER_pn-llvm = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-logrotate = "Robert Yang <liezhi.yang@windriver.com
> >"
> -RECIPE_MAINTAINER_pn-lrzsz = "Maxin B. John <maxin.john@intel.com>"
>  RECIPE_MAINTAINER_pn-lsb = "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER_pn-lsbinitscripts = "Ross Burton <ross.burton@intel.com
> >"
>  RECIPE_MAINTAINER_pn-lsbtest = "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/acdefine.patch
> b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/acdefine.patch
> deleted file mode 100644
> index 682cf416e22..00000000000
> --- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/acdefine.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Add a description to the AC_DEFINE for LOCALEDIR so that it appears in
> config.h
> -and silences a fatal warning.
> -
> -Upstream-Status:Pending
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/configure.in b/configure.in
> -index c10460c..aa20263 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -258,7 +258,7 @@ AC_SUBST(LIBS)
> -
> - AM_GNU_GETTEXT
> -
> --AC_DEFINE_UNQUOTED(LOCALEDIR,"$prefix/$DATADIRNAME")
> -+AC_DEFINE_UNQUOTED(LOCALEDIR,"$prefix/$DATADIRNAME",[locale directory])
> -
> - AC_OUTPUT([Makefile intl/Makefile lib/Makefile testsuite/Makefile
> m4/Makefile \
> - man/Makefile po/Makefile.in src/Makefile debian/rules Specfile systype \
> diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools.patch
> b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools.patch
> deleted file mode 100644
> index 394519855e1..00000000000
> --- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> ---- lrzsz-0.12.20/acinclude.m4~autotools       1998-12-27
> 17:08:59.000000000 -0500
> -+++ lrzsz-0.12.20/acinclude.m4 2004-05-09 22:26:19.000000000 -0400
> -@@ -1,12 +1,11 @@
> - dnl AC_REPLACE_GNU_GETOPT
> --AC_DEFUN(AC_REPLACE_GNU_GETOPT,
> --[AC_CHECK_FUNC(getopt_long, , [LIBOBJS="$LIBOBJS getopt1.o getopt.o"])
> --AC_SUBST(LIBOBJS)dnl
> --])
> -+AC_DEFUN([AC_REPLACE_GNU_GETOPT],
> -+[AC_CHECK_FUNC(getopt_long, , [AC_LIBOBJ([getopt1])
> -+AC_LIBOBJ([getopt])dnl])])
> -
> - dnl
> - dnl taken from taylor uucp
> --AC_DEFUN(LRZSZ_ERRNO_DECL,[
> -+AC_DEFUN([LRZSZ_ERRNO_DECL],[
> - AC_MSG_CHECKING(for errno declaration)
> - AC_CACHE_VAL(lrzsz_cv_decl_errno,
> - [AC_TRY_COMPILE([#include <errno.h>], [int i = errno; errno = 1;],
> -@@ -23,7 +21,7 @@
> - ])
> -
> - dnl LRZSZ_TYPE_SPEED_T
> --AC_DEFUN(LRZSZ_TYPE_SPEED_T,[
> -+AC_DEFUN([LRZSZ_TYPE_SPEED_T],[
> - AC_REQUIRE([AC_HEADER_STDC])dnl
> - AC_REQUIRE([LRZSZ_HEADERS_TERM_IO])dnl
> - AC_MSG_CHECKING(for speed_t)
> -@@ -61,7 +59,7 @@
> - fi
> - ])
> -
> --AC_DEFUN(lrzsz_HEADER_SYS_SELECT,
> -+AC_DEFUN([lrzsz_HEADER_SYS_SELECT],
> - [AC_CACHE_CHECK([whether sys/time.h and sys/select.h may both be
> included],
> -   lrzsz_cv_header_sys_select,
> - [AC_TRY_COMPILE([#include <sys/types.h>
> diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/gettext.patch
> b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/gettext.patch
> deleted file mode 100644
> index 1a24a1f05e7..00000000000
> --- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/gettext.patch
> +++ /dev/null
> @@ -1,21884 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> ---- lrzsz-0.12.20.safe/ABOUT-NLS       1998-04-26 09:22:30.000000000 -0400
> -+++ lrzsz-0.12.20/ABOUT-NLS    2004-09-12 14:40:34.323752952 -0400
> -@@ -1,14 +1,14 @@
> - Notes on the Free Translation Project
> - *************************************
> -
> --   Free software is going international!  The Free Translation Project
> --is a way to get maintainers of free software, translators, and users all
> -+Free software is going international!  The Free Translation Project is
> -+a way to get maintainers of free software, translators, and users all
> - together, so that will gradually become able to speak many languages.
> - A few packages already provide translations for their messages.
> -
> -    If you found this `ABOUT-NLS' file inside a distribution, you may
> - assume that the distributed package does use GNU `gettext' internally,
> --itself available at your nearest GNU archive site.  But you do *not*
> -+itself available at your nearest GNU archive site.  But you do _not_
> - need to install GNU `gettext' prior to configuring, installing or using
> - this package with messages translated.
> -
> -@@ -22,10 +22,10 @@
> - `gettext' which is used.  The information can be found in the
> - `intl/VERSION' file, in internationalized packages.
> -
> --One advise in advance
> --=====================
> -+Quick configuration advice
> -+==========================
> -
> --   If you want to exploit the full power of internationalization, you
> -+If you want to exploit the full power of internationalization, you
> - should configure it using
> -
> -      ./configure --with-included-gettext
> -@@ -34,42 +34,40 @@
> - package, despite the existence of internationalizing capabilities in the
> - operating system where this package is being installed.  So far, only
> - the `gettext' implementation in the GNU C library version 2 provides as
> --many features (such as locale alias or message inheritance) as the
> --implementation here.  It is also not possible to offer this additional
> --functionality on top of a `catgets' implementation.  Future versions of
> --GNU `gettext' will very likely convey even more functionality.  So it
> --might be a good idea to change to GNU `gettext' as soon as possible.
> -+many features (such as locale alias, message inheritance, automatic
> -+charset conversion or plural form handling) as the implementation here.
> -+It is also not possible to offer this additional functionality on top
> -+of a `catgets' implementation.  Future versions of GNU `gettext' will
> -+very likely convey even more functionality.  So it might be a good idea
> -+to change to GNU `gettext' as soon as possible.
> -
> --   So you need not provide this option if you are using GNU libc 2 or
> -+   So you need _not_ provide this option if you are using GNU libc 2 or
> - you have installed a recent copy of the GNU gettext package with the
> - included `libintl'.
> -
> - INSTALL Matters
> - ===============
> -
> --   Some packages are "localizable" when properly installed; the
> --programs they contain can be made to speak your own native language.
> --Most such packages use GNU `gettext'.  Other packages have their own
> --ways to internationalization, predating GNU `gettext'.
> -+Some packages are "localizable" when properly installed; the programs
> -+they contain can be made to speak your own native language.  Most such
> -+packages use GNU `gettext'.  Other packages have their own ways to
> -+internationalization, predating GNU `gettext'.
> -
> -    By default, this package will be installed to allow translation of
> --messages.  It will automatically detect whether the system provides
> --usable `catgets' (if using this is selected by the installer) or
> --`gettext' functions.  If neither is available, the GNU `gettext' own
> -+messages.  It will automatically detect whether the system already
> -+provides the GNU `gettext' functions.  If not, the GNU `gettext' own
> - library will be used.  This library is wholly contained within this
> - package, usually in the `intl/' subdirectory, so prior installation of
> --the GNU `gettext' package is *not* required.  Installers may use
> -+the GNU `gettext' package is _not_ required.  Installers may use
> - special options at configuration time for changing the default
> - behaviour.  The commands:
> -
> -      ./configure --with-included-gettext
> --     ./configure --with-catgets
> -      ./configure --disable-nls
> -
> --will respectively bypass any pre-existing `catgets' or `gettext' to use
> --the internationalizing routines provided within this package, enable
> --the use of the `catgets' functions (if found on the locale system), or
> --else, *totally* disable translation of messages.
> -+will respectively bypass any pre-existing `gettext' to use the
> -+internationalizing routines provided within this package, or else,
> -+_totally_ disable translation of messages.
> -
> -    When you already have GNU `gettext' installed on your system and run
> - configure without an option for your new package, `configure' will
> -@@ -83,18 +81,10 @@
> -
> - to prevent auto-detection.
> -
> --   By default the configuration process will not test for the `catgets'
> --function and therefore they will not be used.  The reasons are already
> --given above: the emulation on top of `catgets' cannot provide all the
> --extensions provided by the GNU `gettext' library.  If you nevertheless
> --want to use the `catgets' functions use
> --
> --     ./configure --with-catgets
> --
> --to enable the test for `catgets' (this causes no harm if `catgets' is
> --not available on your system).  If you really select this option we
> --would like to hear about the reasons because we cannot think of any
> --good one ourself.
> -+   The configuration process will not test for the `catgets' function
> -+and therefore it will not be used.  The reason is that even an
> -+emulation of `gettext' on top of `catgets' could not provide all the
> -+extensions of the GNU `gettext' library.
> -
> -    Internationalized packages have usually many `po/LL.po' files, where
> - LL gives an ISO 639 two-letter code identifying the language.  Unless
> -@@ -108,57 +98,73 @@
> - Using This Package
> - ==================
> -
> --   As a user, if your language has been installed for this package, you
> -+As a user, if your language has been installed for this package, you
> - only have to set the `LANG' environment variable to the appropriate
> --ISO 639 `LL' two-letter code prior to using the programs in the
> --package.  For example, let's suppose that you speak German.  At the
> --shell prompt, merely execute `setenv LANG de' (in `csh'),
> --`export LANG; LANG=de' (in `sh') or `export LANG=de' (in `bash').  This
> --can be done from your `.login' or `.profile' file, once and for all.
> -+`LL_CC' combination.  Here `LL' is an ISO 639 two-letter language code,
> -+and `CC' is an ISO 3166 two-letter country code.  For example, let's
> -+suppose that you speak German and live in Germany.  At the shell
> -+prompt, merely execute `setenv LANG de_DE' (in `csh'),
> -+`export LANG; LANG=de_DE' (in `sh') or `export LANG=de_DE' (in `bash').
> -+This can be done from your `.login' or `.profile' file, once and for
> -+all.
> -
> --   An operating system might already offer message localization for
> --many of its programs, while other programs have been installed locally
> --with the full capabilities of GNU `gettext'.  Just using `gettext'
> --extended syntax for `LANG' would break proper localization of already
> --available operating system programs.  In this case, users should set
> --both `LANGUAGE' and `LANG' variables in their environment, as programs
> --using GNU `gettext' give preference to `LANGUAGE'.  For example, some
> --Swedish users would rather read translations in German than English for
> --when Swedish is not available.  This is easily accomplished by setting
> --`LANGUAGE' to `sv:de' while leaving `LANG' to `sv'.
> -+   You might think that the country code specification is redundant.
> -+But in fact, some languages have dialects in different countries.  For
> -+example, `de_AT' is used for Austria, and `pt_BR' for Brazil.  The
> -+country code serves to distinguish the dialects.
> -+
> -+   The locale naming convention of `LL_CC', with `LL' denoting the
> -+language and `CC' denoting the country, is the one use on systems based
> -+on GNU libc.  On other systems, some variations of this scheme are
> -+used, such as `LL' or `LL_CC.ENCODING'.  You can get the list of
> -+locales supported by your system for your country by running the command
> -+`locale -a | grep '^LL''.
> -+
> -+   Not all programs have translations for all languages.  By default, an
> -+English message is shown in place of a nonexistent translation.  If you
> -+understand other languages, you can set up a priority list of languages.
> -+This is done through a different environment variable, called
> -+`LANGUAGE'.  GNU `gettext' gives preference to `LANGUAGE' over `LANG'
> -+for the purpose of message handling, but you still need to have `LANG'
> -+set to the primary language; this is required by other parts of the
> -+system libraries.  For example, some Swedish users who would rather
> -+read translations in German than English for when Swedish is not
> -+available, set `LANGUAGE' to `sv:de' while leaving `LANG' to `sv_SE'.
> -+
> -+   Special advice for Norwegian users: The language code for Norwegian
> -+bokma*l changed from `no' to `nb' recently (in 2003).  During the
> -+transition period, while some message catalogs for this language are
> -+installed under `nb' and some older ones under `no', it's recommended
> -+for Norwegian users to set `LANGUAGE' to `nb:no' so that both newer and
> -+older translations are used.
> -+
> -+   In the `LANGUAGE' environment variable, but not in the `LANG'
> -+environment variable, `LL_CC' combinations can be abbreviated as `LL'
> -+to denote the language's main dialect.  For example, `de' is equivalent
> -+to `de_DE' (German as spoken in Germany), and `pt' to `pt_PT'
> -+(Portuguese as spoken in Portugal) in this context.
> -
> - Translating Teams
> - =================
> -
> --   For the Free Translation Project to be a success, we need interested
> -+For the Free Translation Project to be a success, we need interested
> - people who like their own language and write it well, and who are also
> - able to synergize with other translators speaking the same language.
> --Each translation team has its own mailing list, courtesy of Linux
> --International.  You may reach your translation team at the address
> --`LL@li.org', replacing LL by the two-letter ISO 639 code for your
> --language.  Language codes are *not* the same as the country codes given
> --in ISO 3166.  The following translation teams exist, as of August 1997:
> --
> --     Chinese `zh', Czech `cs', Danish `da', Dutch `nl', English `en',
> --     Esperanto `eo', Finnish `fi', French `fr', German `de', Hungarian
> --     `hu', Irish `ga', Italian `it', Indonesian `id', Japanese `ja',
> --     Korean `ko', Latin `la', Norwegian `no', Persian `fa', Polish
> --     `pl', Portuguese `pt', Russian `ru', Slovenian `sl', Spanish `es',
> --     Swedish `sv', and Turkish `tr'.
> --
> --For example, you may reach the Chinese translation team by writing to
> --`zh@li.org'.
> -+Each translation team has its own mailing list.  The up-to-date list of
> -+teams can be found at the Free Translation Project's homepage,
> -+`http://www.iro.umontreal.ca/contrib/po/HTML/', in the "National teams"
> -+area.
> -
> --   If you'd like to volunteer to *work* at translating messages, you
> -+   If you'd like to volunteer to _work_ at translating messages, you
> - should become a member of the translating team for your own language.
> --The subscribing address is *not* the same as the list itself, it has
> -+The subscribing address is _not_ the same as the list itself, it has
> - `-request' appended.  For example, speakers of Swedish can send a
> - message to `sv-request@li.org', having this message body:
> -
> -      subscribe
> -
> -    Keep in mind that team members are expected to participate
> --*actively* in translations, or at solving translational difficulties,
> -+_actively_ in translations, or at solving translational difficulties,
> - rather than merely lurking around.  If your team does not exist yet and
> - you want to start one, or if you are unsure about what to do or how to
> - get started, please write to `translation@iro.umontreal.ca' to reach the
> -@@ -171,43 +177,559 @@
> - Available Packages
> - ==================
> -
> --   Languages are not equally supported in all packages.  The following
> --matrix shows the current state of internationalization, as of August
> --1997.  The matrix shows, in regard of each package, for which languages
> --PO files have been submitted to translation coordination.
> -+Languages are not equally supported in all packages.  The following
> -+matrix shows the current state of internationalization, as of January
> -+2004.  The matrix shows, in regard of each package, for which languages
> -+PO files have been submitted to translation coordination, with a
> -+translation percentage of at least 50%.
> -
> --     Ready PO files    cs da de en es fi fr it ja ko nl no pl pt sl sv
> --                     .-------------------------------------------------.
> --     bash            |       []          []          []
> |  3
> --     bison           |       []          []          []
> |  3
> --     clisp           |       [] [] []    []
> |  4
> --     cpio            |       []    []    []          []    []
> |  5
> --     diffutils       |       []    []    []                []       []
> |  5
> --     enscript        |       []    [] [] []          []          []
> |  6
> --     fileutils       | []    []    []    []       [] []    [] [] [] [] |
> 10
> --     findutils       |       []    []    [] []    [] []    []       []
> |  8
> --     flex            |             []    []       []                []
> |  4
> --     gcal            |       []          []          []    []       []
> |  5
> --     gettext         |       []    []    []       [] [] [] [] [] [] [] |
> 11
> --     grep            |       []    []    []       [] [] [] []    [] []
> |  9
> --     hello           |       []    []    []       [] [] [] [] [] [] [] |
> 10
> --     id-utils        |       []          []                []
> |  3
> --     indent          |    [] []                   []       []
> |  4
> --     libc            |       []    []    []       [] []    []       []
> |  7
> --     m4              |       []          []    []    []             []
> |  5
> --     make            |       []    []    []       [] []    []
> |  6
> --     music           |                   []                []
> |  2
> --     ptx             |       []    []    []          [] [] [] []    []
> |  8
> --     recode          |    [] []    []    []          []    [] [] [] []
> |  9
> --     sh-utils        |       []          []          [] [] [] []    []
> |  7
> --     sharutils       |       []    []    []          []             []
> |  5
> --     tar             |       []          [] []    [] [] [] [] [] [] [] |
> 10
> --     texinfo         |                   []
> |  1
> --     textutils       | []    []    []    []       [] [] [] []       []
> |  9
> --     wdiff           | []    []    []    []          [] [] []       []
> |  8
> --                     `-------------------------------------------------'
> --       16 languages    cs da de en es fi fr it ja ko nl no pl pt sl sv
> --       27 packages      3  2 24  1 17  1 26  2  1 11 20  9 19  7  7 17
> 167
> -+     Ready PO files       af am ar az be bg bs ca cs da de el en en_GB
> eo es
> -+                        +-----------------------------
> -----------------------+
> -+     a2ps               |             []             [] [] []
>     |
> -+     aegis              |                               ()
>      |
> -+     ant-phone          |                               ()
>      |
> -+     anubis             |
>     |
> -+     ap-utils           |
>     |
> -+     aspell             |             []
>      |
> -+     bash               |                      []       []
>  [] [] |
> -+     batchelor          |
>     |
> -+     bfd                |                            []
>  [] |
> -+     binutils           |                            []
>  [] |
> -+     bison              |                            [] []
>   [] |
> -+     bluez-pin          | []                      []
>  []    |
> -+     clisp              |
>     |
> -+     clisp              |                               []    []
>   [] |
> -+     console-tools      |                         []    []
>      |
> -+     coreutils          |                      []    [] []
>   [] |
> -+     cpio               |                            [] []
>   [] |
> -+     darkstat           |                []          ()
>  [] |
> -+     diffutils          |                      [] [] [] [] []
> [] [] |
> -+     e2fsprogs          |                         []    []
>   [] |
> -+     enscript           |                      []    [] []        []
>      |
> -+     error              |                      []    [] []        []
>   [] |
> -+     fetchmail          |                      [] () [] [] []
>  [] |
> -+     fileutils          |                            [] []
>   [] |
> -+     findutils          |             []       []    [] [] []
> [] [] |
> -+     flex               |                      []    [] []
>   [] |
> -+     fslint             |
>     |
> -+     gas                |
>  [] |
> -+     gawk               |                      []    [] []
>   [] |
> -+     gbiff              |                               []
>      |
> -+     gcal               |                      []
>     |
> -+     gcc                |                            []
>  [] |
> -+     gettext            |             []       []    [] []
>   [] |
> -+     gettext-examples   | []                   []       []
>   [] |
> -+     gettext-runtime    |             []       []    [] []
>   [] |
> -+     gettext-tools      |                      []       []
>   [] |
> -+     gimp-print         |                         [] [] []        []
>   [] |
> -+     gliv               |
>     |
> -+     glunarclock        |                            [] []
>      |
> -+     gnubiff            |                               []
>      |
> -+     gnucash            |                         []    ()        []
>   [] |
> -+     gnucash-glossary   |                            [] ()
>   [] |
> -+     gnupg              |                      [] ()    [] []
> [] [] |
> -+     gpe-aerial         |                         []
>      |
> -+     gpe-beam           |                         []    []
>      |
> -+     gpe-calendar       |                         []    []
>      |
> -+     gpe-clock          |                         []    []
>      |
> -+     gpe-conf           |                         []    []
>      |
> -+     gpe-contacts       |                         []    []
>      |
> -+     gpe-edit           |                         []
>      |
> -+     gpe-go             |                         []
>      |
> -+     gpe-login          |                         []    []
>      |
> -+     gpe-ownerinfo      |                         []    []
>      |
> -+     gpe-sketchbook     |                         []    []
>      |
> -+     gpe-su             |                         []    []
>      |
> -+     gpe-taskmanager    |                         []    []
>      |
> -+     gpe-timesheet      |                         []
>      |
> -+     gpe-today          |                         []    []
>      |
> -+     gpe-todo           |                         []    []
>      |
> -+     gphoto2            |                         [] [] []
>   [] |
> -+     gprof              |                            [] []
>   [] |
> -+     gpsdrive           |                               ()    ()
>   () |
> -+     gramadoir          |                               []
>      |
> -+     grep               |             [] []    []       [] []
>  [] |
> -+     gretl              |
>  [] |
> -+     gtick              | []                            ()
>      |
> -+     hello              |                      []    [] [] []
> [] [] |
> -+     id-utils           |                            [] []
>      |
> -+     indent             |                      []       []
>  [] [] |
> -+     iso_3166           |          []    [] [] [] [] [] [] []
> [] [] |
> -+     iso_3166_1         |                      [] [] [] [] []
>  [] |
> -+     iso_3166_2         |
>     |
> -+     iso_3166_3         |                               []
>      |
> -+     iso_4217           |                      []    [] []
>   [] |
> -+     iso_639            |
>     |
> -+     jpilot             |                         [] []
>  [] |
> -+     jtag               |
>     |
> -+     jwhois             |
>  [] |
> -+     kbd                |                         [] [] [] []
>  [] |
> -+     latrine            |                               ()
>      |
> -+     ld                 |                            []
>  [] |
> -+     libc               |                      [] [] [] [] []
>  [] |
> -+     libgpewidget       |                         []    []
>      |
> -+     libiconv           |                      []    [] []
>  [] [] |
> -+     lifelines          |                            [] ()
>      |
> -+     lilypond           |                               []
>      |
> -+     lingoteach         |
>     |
> -+     lingoteach_lessons |                               ()
>   () |
> -+     lynx               |                      [] [] [] []
>      |
> -+     m4                 |                         [] [] [] []
>     |
> -+     mailutils          |                      []
>  [] |
> -+     make               |                            [] []
>   [] |
> -+     man-db             |                      [] () [] []
>   () |
> -+     minicom            |                         []    []
>   [] |
> -+     mysecretdiary      |                            [] []
>   [] |
> -+     nano               |                      [] () [] []
>   [] |
> -+     nano_1_0           |                      [] () [] []
>   [] |
> -+     opcodes            |
>  [] |
> -+     parted             |                      [] [] [] []
>   [] |
> -+     ptx                |                      []    [] []
>  [] [] |
> -+     python             |
>     |
> -+     radius             |
>  [] |
> -+     recode             |             []       []    [] [] []
> [] [] |
> -+     rpm                |                         [] []
>     |
> -+     screem             |
>     |
> -+     scrollkeeper       |             []       [] [] [] []
>   [] |
> -+     sed                | []                   []    [] []
>  [] [] |
> -+     sh-utils           |                            [] []
>   [] |
> -+     shared-mime-info   |
>     |
> -+     sharutils          |                      [] [] [] [] []
>  [] |
> -+     silky              |                               ()
>      |
> -+     skencil            |                            [] ()
>   [] |
> -+     sketch             |                            [] ()
>   [] |
> -+     soundtracker       |                            [] []
>   [] |
> -+     sp                 |                               []
>      |
> -+     tar                |                         [] [] []
>   [] |
> -+     texinfo            |                            [] []
>  []    |
> -+     textutils          |                      []    [] []
>   [] |
> -+     tin                |                               ()        ()
>      |
> -+     tp-robot           |
>     |
> -+     tuxpaint           |                      [] [] [] [] []     []
>   [] |
> -+     unicode-han-tra... |
>     |
> -+     unicode-transla... |
>     |
> -+     util-linux         |                      [] [] [] []
>   [] |
> -+     vorbis-tools       |             []          [] []
>  [] |
> -+     wastesedge         |                               ()
>      |
> -+     wdiff              |                      []    [] []
>   [] |
> -+     wget               |                []    []    [] [] []
>  [] |
> -+     xchat              |                      []       [] []
>  [] |
> -+     xfree86_xkb_xml    |                         [] []
>     |
> -+     xpad               |
>  [] |
> -+                        +-----------------------------
> -----------------------+
> -+                          af am ar az be bg bs ca cs da de el en en_GB
> eo es
> -+                           4  0  0  1  9  4  1 40 41 60 78 17  1   5
>  13 68
> -+
> -+                          et eu fa fi fr ga gl he hr hu id is it ja ko lg
> -+                        +-----------------------------
> --------------------+
> -+     a2ps               | []       [] []                      ()    ()
>   |
> -+     aegis              |
>  |
> -+     ant-phone          |             []
>   |
> -+     anubis             |             []
>   |
> -+     ap-utils           |             []
>   |
> -+     aspell             |             [] []
>  |
> -+     bash               |             []             []
>  |
> -+     batchelor          |             [] []
>  |
> -+     bfd                |             []
>   |
> -+     binutils           |             []                         []
>  |
> -+     bison              | []          []                []    []
>   |
> -+     bluez-pin          |          [] [] []          [] []
>   |
> -+     clisp              |
>  |
> -+     clisp              |             []
>   |
> -+     console-tools      |
>  |
> -+     coreutils          | []       [] [] []                   [] []
>  |
> -+     cpio               |             []    []       []             []
>   |
> -+     darkstat           |             () []          [] []
>   |
> -+     diffutils          |          [] []    [] []    [] []       []
>  |
> -+     e2fsprogs          |
>  |
> -+     enscript           |             []          []
>   |
> -+     error              |          [] [] []          []
>  |
> -+     fetchmail          |                                        []
>  |
> -+     fileutils          | []          [] []          []       [] []
>  |
> -+     findutils          | []       [] [] [] []    [] [] []    [] [] []
>   |
> -+     flex               |             [] []                         []
>   |
> -+     fslint             |             []
>   |
> -+     gas                |             []
>   |
> -+     gawk               |             []       []                []
>  |
> -+     gbiff              |             []
>   |
> -+     gcal               |             []
>   |
> -+     gcc                |             []
>   |
> -+     gettext            |             []                         [] []
>   |
> -+     gettext-examples   |             []                         []
>  |
> -+     gettext-runtime    |          [] []                []       [] []
>   |
> -+     gettext-tools      |             []                         [] []
>   |
> -+     gimp-print         |             []                         []
>  |
> -+     gliv               |             ()
>   |
> -+     glunarclock        |          []    [] []       []
>  |
> -+     gnubiff            |             []
>   |
> -+     gnucash            |             ()                      []
>   |
> -+     gnucash-glossary   |                                     []
>   |
> -+     gnupg              | []       [] []    []          []    [] []
>  |
> -+     gpe-aerial         |             []
>   |
> -+     gpe-beam           |             []
>   |
> -+     gpe-calendar       |             []             [] []
>   |
> -+     gpe-clock          |             []
>   |
> -+     gpe-conf           |             []
>   |
> -+     gpe-contacts       |             []             []
>  |
> -+     gpe-edit           |             []                []
>   |
> -+     gpe-go             |             []
>   |
> -+     gpe-login          |             []             []
>  |
> -+     gpe-ownerinfo      |             []             [] []
>   |
> -+     gpe-sketchbook     |             []
>   |
> -+     gpe-su             |             []
>   |
> -+     gpe-taskmanager    |             []
>   |
> -+     gpe-timesheet      |             [] []             []
>   |
> -+     gpe-today          |             [] []
>  |
> -+     gpe-todo           |             []                []
>   |
> -+     gphoto2            |             []             []          []
>  |
> -+     gprof              |             []                []
>   |
> -+     gpsdrive           |             ()                      () ()
>  |
> -+     gramadoir          |             [] []
>  |
> -+     grep               | []       [] [] [] [] [] [] [] []    [] []
>  |
> -+     gretl              |             []                      []
>   |
> -+     gtick              |          [] [] []
>  |
> -+     hello              | []    [] [] [] [] [] [] [] [] []    [] [] []
>   |
> -+     id-utils           |             []             [] []    []
>   |
> -+     indent             | []       [] [] [] []       [] []    [] []
>  |
> -+     iso_3166           |    []       [] []       [] [] []    []
>   |
> -+     iso_3166_1         |    []       [] []          [] []
>   |
> -+     iso_3166_2         |
>  |
> -+     iso_3166_3         |
>  |
> -+     iso_4217           | []          []    []       []       [] []
>  |
> -+     iso_639            |
>  |
> -+     jpilot             |             []                         ()
>  |
> -+     jtag               |             []
>   |
> -+     jwhois             |             []             [] []    []
>   |
> -+     kbd                |             []
>   |
> -+     latrine            |             []
>   |
> -+     ld                 |             []
>   |
> -+     libc               |          [] []    []       []          [] []
>   |
> -+     libgpewidget       |             [] []          [] []
>   |
> -+     libiconv           | []       [] [] [] []    [] [] []    []
>   |
> -+     lifelines          |             ()
>   |
> -+     lilypond           |             []
>   |
> -+     lingoteach         |             []                []
>   |
> -+     lingoteach_lessons |
>  |
> -+     lynx               | []                         []       [] []
>  |
> -+     m4                 |             []    []          []       []
>  |
> -+     mailutils          |
>  |
> -+     make               |             []    [] [] []             [] []
>   |
> -+     man-db             |                                     () ()
>  |
> -+     minicom            |          [] []             []          []
>  |
> -+     mysecretdiary      |             []                []
>   |
> -+     nano               |             []    []          []    []
>   |
> -+     nano_1_0           |             []    []          []    []
>   |
> -+     opcodes            |             []
>   |
> -+     parted             |             []    []                   []
>  |
> -+     ptx                | []       [] [] [] []       [] []
>   |
> -+     python             |
>  |
> -+     radius             |             []
>   |
> -+     recode             |             []    [] []    [] []    []
>   |
> -+     rpm                |             []                            []
>   |
> -+     screem             |
>  |
> -+     scrollkeeper       |                            []
>  |
> -+     sed                | []       [] [] [] []       [] []    [] []
>  |
> -+     sh-utils           | []       [] [] []          []       [] []
>  |
> -+     shared-mime-info   |          [] []             []
>  |
> -+     sharutils          | []          []    []       []          []
>  |
> -+     silky              |          () []             ()       ()
>   |
> -+     skencil            |             []
>   |
> -+     sketch             |             []
>   |
> -+     soundtracker       |             []                      []
>   |
> -+     sp                 |             []                         ()
>  |
> -+     tar                | []       [] []    []    [] [] []    [] []
>  |
> -+     texinfo            |             []       [] []             []
>  |
> -+     textutils          |             [] [] []       []          [] []
>   |
> -+     tin                | []          ()
>   |
> -+     tp-robot           |             []
>   |
> -+     tuxpaint           |          [] []       []    [] [] [] [] [] []
>   |
> -+     unicode-han-tra... |
>  |
> -+     unicode-transla... |             [] []
>  |
> -+     util-linux         | []       [] []             []       () []
>  |
> -+     vorbis-tools       |             []
>   |
> -+     wastesedge         |             ()
>   |
> -+     wdiff              | []          [] [] []       [] []
>   |
> -+     wget               | []       [] []    []    [] []          []
>  |
> -+     xchat              | []       [] []
>   |
> -+     xfree86_xkb_xml    |             []             []
>  |
> -+     xpad               |             [] []
>  |
> -+                        +-----------------------------
> --------------------+
> -+                          et eu fa fi fr ga gl he hr hu id is it ja ko lg
> -+                          22  2  1 26 106 28 24  8 10 41 33  1 26 33 12
> 0
> -+
> -+                          lt lv mk mn ms mt nb nl nn no nso pl pt pt_BR
> ro ru
> -+                        +-----------------------------
> ------------------------+
> -+     a2ps               |             []       []    ()     ()     []
>  [] [] |
> -+     aegis              |                      ()
>  () () |
> -+     ant-phone          |                      []
>  []    |
> -+     anubis             |             []    [] []           []
> [] [] |
> -+     ap-utils           |                      []           ()
> []    |
> -+     aspell             |                      []
>      |
> -+     bash               |                                          []
>  [] [] |
> -+     batchelor          |
>  []    |
> -+     bfd                |
>  []    |
> -+     binutils           |
>   [] |
> -+     bison              |             []       []                  []
>  [] [] |
> -+     bluez-pin          |                      []           []
> []    |
> -+     clisp              |
>      |
> -+     clisp              |                      []
>      |
> -+     console-tools      |
>   [] |
> -+     coreutils          |                                   []
>    [] |
> -+     cpio               |                      []           []     []
>  [] [] |
> -+     darkstat           |             []       []                  []
>  []    |
> -+     diffutils          |             []       []           []     []
>  [] [] |
> -+     e2fsprogs          |                                   []
>       |
> -+     enscript           |                      []                  []
>  [] [] |
> -+     error              |                      []                  []
>  []    |
> -+     fetchmail          |                      []           []     ()
>   [] |
> -+     fileutils          |                                   []
> [] [] |
> -+     findutils          |                      []           []     []
>  [] [] |
> -+     flex               |                                   []     []
>  [] [] |
> -+     fslint             |                      []
>  []    |
> -+     gas                |
>      |
> -+     gawk               |                                   []     []
>  []    |
> -+     gbiff              |                      []
>  []    |
> -+     gcal               |
>      |
> -+     gcc                |
>      |
> -+     gettext            |                                   []
> [] [] |
> -+     gettext-examples   |                      []           []
> []    |
> -+     gettext-runtime    |                      []           []
> [] [] |
> -+     gettext-tools      |                                   []
> []    |
> -+     gimp-print         |                      []
>      |
> -+     gliv               |                      []                  []
>  []    |
> -+     glunarclock        |             []       []
>  [] [] |
> -+     gnubiff            |                      []
>      |
> -+     gnucash            |                      []              []  ()
>   [] |
> -+     gnucash-glossary   |                      []              []
>      |
> -+     gnupg              |
>  []    |
> -+     gpe-aerial         |                      []              []
>  [] [] |
> -+     gpe-beam           |                      []              []
>  [] [] |
> -+     gpe-calendar       |                      []              []
>  [] [] |
> -+     gpe-clock          |                      []              []
>  [] [] |
> -+     gpe-conf           |                      []              []
>  [] [] |
> -+     gpe-contacts       |                      []              []
>  [] [] |
> -+     gpe-edit           |                      []              []
>  [] [] |
> -+     gpe-go             |                      []
>  [] [] |
> -+     gpe-login          |                      []              []
>  [] [] |
> -+     gpe-ownerinfo      |                      []              []
>  [] [] |
> -+     gpe-sketchbook     |                      []              []
>  [] [] |
> -+     gpe-su             |                      []              []
>  [] [] |
> -+     gpe-taskmanager    |                      []              []
>  [] [] |
> -+     gpe-timesheet      |                      []              []
>  [] [] |
> -+     gpe-today          |                      []              []
>  [] [] |
> -+     gpe-todo           |                      []              []
>  [] [] |
> -+     gphoto2            |
>  []    |
> -+     gprof              |                                          []
>  []    |
> -+     gpsdrive           |                      ()    ()
>  []    |
> -+     gramadoir          |                      ()
>  []    |
> -+     grep               |                                   [] []  []
>  [] [] |
> -+     gretl              |
>      |
> -+     gtick              |                      []
>  [] [] |
> -+     hello              |    []       []    [] [] [] []     []     []
>  [] [] |
> -+     id-utils           |                      []                  []
>  [] [] |
> -+     indent             |                      []                  []
>  [] [] |
> -+     iso_3166           |          []                [] []
>       |
> -+     iso_3166_1         |                      []    []
>      |
> -+     iso_3166_2         |
>      |
> -+     iso_3166_3         |                      []
>      |
> -+     iso_4217           |          []          [] [] []     [] []  []
>   [] |
> -+     iso_639            |          []
>      |
> -+     jpilot             |                      ()    ()
>      |
> -+     jtag               |
>      |
> -+     jwhois             |                      []           []     []
>  [] () |
> -+     kbd                |                      []           []
> []    |
> -+     latrine            |
>  []    |
> -+     ld                 |
>      |
> -+     libc               |                   []       []     []     []
>      |
> -+     libgpewidget       |                      []              []
>  []    |
> -+     libiconv           |                      []           []     []
>  [] [] |
> -+     lifelines          |
>      |
> -+     lilypond           |
>      |
> -+     lingoteach         |
>      |
> -+     lingoteach_lessons |
>      |
> -+     lynx               |                      []                  []
>   [] |
> -+     m4                 |                      []           []     []
>  [] [] |
> -+     mailutils          |                                   []
> [] [] |
> -+     make               |                      []           []     []
>   [] |
> -+     man-db             |
>  []    |
> -+     minicom            |                                   []     []
>  [] [] |
> -+     mysecretdiary      |                      []                  []
>  []    |
> -+     nano               |             []       []           []
> [] [] |
> -+     nano_1_0           |             []    []    []        []
> [] [] |
> -+     opcodes            |                      []
>  []    |
> -+     parted             |                         []        [] []  []
>      |
> -+     ptx                |                   [] []    []     [] []  []
>  [] [] |
> -+     python             |
>      |
> -+     radius             |                                   []
>    [] |
> -+     recode             |                                   []     []
>  [] [] |
> -+     rpm                |                                   [] []
>   [] |
> -+     screem             |
>      |
> -+     scrollkeeper       |                   [] []           []
> [] [] |
> -+     sed                |                                   []     []
>  []    |
> -+     sh-utils           |                   []
>    [] |
> -+     shared-mime-info   |                      [] []
>       |
> -+     sharutils          |                      []
>   [] |
> -+     silky              |
>   () |
> -+     skencil            |                                      []  []
>      |
> -+     sketch             |                                      []  []
>      |
> -+     soundtracker       |
>      |
> -+     sp                 |
>      |
> -+     tar                |             []    []       []     []     []
>  []    |
> -+     texinfo            |                   []              []
> [] [] |
> -+     textutils          |                   []
>    [] |
> -+     tin                |
>      |
> -+     tp-robot           |                      []
>      |
> -+     tuxpaint           | []          []       [] []        [] []  []
>  []    |
> -+     unicode-han-tra... |
>      |
> -+     unicode-transla... |
>      |
> -+     util-linux         |                      []                  []
>   [] |
> -+     vorbis-tools       |                      []
>  [] [] |
> -+     wastesedge         |
>      |
> -+     wdiff              |             []                    []     []
>  [] [] |
> -+     wget               |                                   []
> [] [] |
> -+     xchat              |    []                []
>   [] |
> -+     xfree86_xkb_xml    |                      []
>   [] |
> -+     xpad               |                      []
>  []    |
> -+                        +-----------------------------
> ------------------------+
> -+                          lt lv mk mn ms mt nb nl nn no nso pl pt pt_BR
> ro ru
> -+                           1  2  0  3 12  0 10 69  6  7  1  40 26  36
>  76 63
> -+
> -+                          sk sl sr sv ta th tr uk ven vi wa xh zh_CN
> zh_TW zu
> -+                        +-----------------------------
> ------------------------+
> -+     a2ps               |    []    []       [] []
>      | 16
> -+     aegis              |
>      |  0
> -+     ant-phone          |
>      |  3
> -+     anubis             |                   [] []
>      |  9
> -+     ap-utils           |                      ()
>      |  3
> -+     aspell             |
>      |  4
> -+     bash               |
>      |  9
> -+     batchelor          |
>      |  3
> -+     bfd                |          []       []
>       |  6
> -+     binutils           |          []       []                  []
>       |  8
> -+     bison              |          []       []
>       | 14
> -+     bluez-pin          | []       []                    []
>      | 14
> -+     clisp              |
>      |  0
> -+     clisp              |
>      |  5
> -+     console-tools      |
>      |  3
> -+     coreutils          |    []    []       []
> []      | 16
> -+     cpio               |          []                           []
>       | 14
> -+     darkstat           | []    [] []                           ()
> ()      | 12
> -+     diffutils          |          []       []
> []      | 23
> -+     e2fsprogs          |          []       []
>       |  6
> -+     enscript           |          []       []
>       | 12
> -+     error              | []                []
> []      | 15
> -+     fetchmail          | []                []
>       | 11
> -+     fileutils          |    []    []       []                  []
> []      | 17
> -+     findutils          | [] [] [] []       []                  []
>       | 29
> -+     flex               |          []       []
>       | 13
> -+     fslint             |
>      |  3
> -+     gas                |                   []
>       |  3
> -+     gawk               |          []       []
>       | 12
> -+     gbiff              |
>      |  4
> -+     gcal               |          []       []
>       |  4
> -+     gcc                |                   []
>       |  4
> -+     gettext            | [] []    []       []
> []      | 16
> -+     gettext-examples   | []    [] []       []                  []
>       | 14
> -+     gettext-runtime    | [] [] [] []       [] []               []
> []      | 22
> -+     gettext-tools      | [] [] [] []       []                  []
>       | 14
> -+     gimp-print         | []       []
>      | 10
> -+     gliv               |
>      |  3
> -+     glunarclock        |       [] []                    []
>      | 13
> -+     gnubiff            |
>      |  3
> -+     gnucash            | []
> []      |  9
> -+     gnucash-glossary   | []       []
>  []      |  8
> -+     gnupg              | []       []       []
> []      | 17
> -+     gpe-aerial         |          []
>      |  7
> -+     gpe-beam           |          []
>      |  8
> -+     gpe-calendar       | []       []                    []
>  []      | 13
> -+     gpe-clock          | []    [] []
>      | 10
> -+     gpe-conf           | []       []
>      |  9
> -+     gpe-contacts       | []       []
>  []      | 11
> -+     gpe-edit           | []    [] []                    []
>  []      | 12
> -+     gpe-go             |
>      |  5
> -+     gpe-login          | []    [] []                    []
>  []      | 13
> -+     gpe-ownerinfo      | []    [] []
>  []      | 13
> -+     gpe-sketchbook     | []       []
>      |  9
> -+     gpe-su             | []    [] []
>      | 10
> -+     gpe-taskmanager    | []    [] []
>      | 10
> -+     gpe-timesheet      | []    [] []
>  []      | 12
> -+     gpe-today          | []    [] []                    []
>  []      | 13
> -+     gpe-todo           | []       []                    []
>  []      | 12
> -+     gphoto2            | []       []                           []
>       | 11
> -+     gprof              |          []       []
>       |  9
> -+     gpsdrive           | []       []
>      |  3
> -+     gramadoir          | []
>       |  5
> -+     grep               |    [] []          [] []
>      | 26
> -+     gretl              |
>      |  3
> -+     gtick              |
>      |  7
> -+     hello              | []    [] []       [] []
>      | 34
> -+     id-utils           |          []       []
>       | 12
> -+     indent             | []    [] []       []
>       | 21
> -+     iso_3166           | [] [] [] []       []    []     []
>      | 27
> -+     iso_3166_1         | [] []             []
>       | 16
> -+     iso_3166_2         |
>      |  0
> -+     iso_3166_3         |
>      |  2
> -+     iso_4217           | [] []    []       [] []               []
>       | 24
> -+     iso_639            |
>      |  1
> -+     jpilot             |          []       []        []        []
> []      |  9
> -+     jtag               | []
>       |  2
> -+     jwhois             |          ()       []
> []      | 11
> -+     kbd                |          []       []
>       | 11
> -+     latrine            |
>      |  2
> -+     ld                 |          []       []
>       |  5
> -+     libc               | []       []       []                  []
>       | 20
> -+     libgpewidget       | []    [] []                    []
>      | 13
> -+     libiconv           | [] [] [] []       [] []        []     []
>       | 27
> -+     lifelines          |          []
>      |  2
> -+     lilypond           |          []
>      |  3
> -+     lingoteach         |
>      |  2
> -+     lingoteach_lessons |                                       ()
>       |  0
> -+     lynx               |          []       [] []
>      | 14
> -+     m4                 |          []                           []
>       | 15
> -+     mailutils          |
>      |  5
> -+     make               |          []       []                  []
>       | 16
> -+     man-db             |          []
>      |  5
> -+     minicom            |
>      | 11
> -+     mysecretdiary      |          []       []
>       | 10
> -+     nano               |       [] []       [] []
>      | 17
> -+     nano_1_0           |          []       [] []
>      | 17
> -+     opcodes            |          []       []
>       |  6
> -+     parted             |          []       []                  []
>       | 15
> -+     ptx                |          []       []
>       | 22
> -+     python             |
>      |  0
> -+     radius             |
>      |  4
> -+     recode             |    []    []       []
>       | 20
> -+     rpm                |          []       []
>       |  9
> -+     screem             |          []                           []
>       |  2
> -+     scrollkeeper       | []    [] []
>      | 15
> -+     sed                | [] [] [] []       [] []
>      | 24
> -+     sh-utils           |    []             []
>       | 14
> -+     shared-mime-info   |       [] []
>      |  7
> -+     sharutils          |       [] []       []
> []      | 17
> -+     silky              | ()
>       |  3
> -+     skencil            |          []
>      |  6
> -+     sketch             |          []
>      |  6
> -+     soundtracker       | []       []
>      |  7
> -+     sp                 |                   []
>       |  3
> -+     tar                | [] []    []       []                  []
>       | 24
> -+     texinfo            |          []       []                  []
>       | 14
> -+     textutils          |    []    []       []
> []      | 16
> -+     tin                |
>      |  1
> -+     tp-robot           |
>      |  2
> -+     tuxpaint           | []       []       []           []     []
>       | 29
> -+     unicode-han-tra... |
>      |  0
> -+     unicode-transla... |
>      |  2
> -+     util-linux         |          []       []
>       | 15
> -+     vorbis-tools       |
>      |  8
> -+     wastesedge         |
>      |  0
> -+     wdiff              | []       []       []
>       | 18
> -+     wget               | [] [] [] []       [] []               []
> []      | 24
> -+     xchat              | [] [] [] []                           []
>       | 15
> -+     xfree86_xkb_xml    | []    []          [] []               []
>       | 11
> -+     xpad               |
>      |  5
> -+                        +-----------------------------
> ------------------------+
> -+       63 teams           sk sl sr sv ta th tr uk ven vi wa xh zh_CN
> zh_TW zu
> -+      131 domains         47 19 28 83  0  0 59 13  1   1 11  0  22
> 22    0  1373
> -
> -    Some counters in the preceding matrix are higher than the number of
> - visible blocks let us expect.  This is because a few extra PO files are
> -@@ -220,6 +742,27 @@
> - lag between the mere existence a PO file and its wide availability in a
> - distribution.
> -
> --   If August 1997 seems to be old, you may fetch a more recent copy of
> --this `ABOUT-NLS' file on most GNU archive sites.
> -+   If January 2004 seems to be old, you may fetch a more recent copy of
> -+this `ABOUT-NLS' file on most GNU archive sites.  The most up-to-date
> -+matrix with full percentage details can be found at
> -+`http://www.iro.umontreal.ca/contrib/po/HTML/matrix.html'.
> -+
> -+Using `gettext' in new packages
> -+===============================
> -+
> -+If you are writing a freely available program and want to
> -+internationalize it you are welcome to use GNU `gettext' in your
> -+package.  Of course you have to respect the GNU Library General Public
> -+License which covers the use of the GNU `gettext' library.  This means
> -+in particular that even non-free programs can use `libintl' as a shared
> -+library, whereas only free software can use `libintl' as a static
> -+library or use modified versions of `libintl'.
> -+
> -+   Once the sources are changed appropriately and the setup can handle
> -+the use of `gettext' the only thing missing are the translations.  The
> -+Free Translation Project is also available for packages which are not
> -+developed inside the GNU project.  Therefore the information given above
> -+applies also for every other Free Software Project.  Contact
> -+`translation@iro.umontreal.ca' to make the `.pot' files available to
> -+the translation teams.
> -
> ---- lrzsz-0.12.20.safe/ChangeLog       1998-12-29 17:49:56.000000000 -0500
> -+++ lrzsz-0.12.20/ChangeLog    2004-09-12 14:40:35.846521456 -0400
> -@@ -1,3 +1,11 @@
> -+2004-09-12  gettextize  <bug-gnu-gettext@gnu.org>
> -+
> -+      * Makefile.am (ACLOCAL_AMFLAGS): New variable.
> -+      (EXTRA_DIST): Add config.rpath.
> -+      * configure.in (AC_OUTPUT): Add m4/Makefile.
> -+      (AC_OUTPUT): Remove command that created po/Makefile.
> -+      (AC_LINK_FILES): Remove invocation.
> -+
> - 1998-12-29    Uwe Ohse  <uwe@ohse.de>
> -
> -       * src/lrz.c: removed stpcpy call.
> ---- lrzsz-0.12.20.safe/config.rpath    1969-12-31 19:00:00.000000000
> -0500
> -+++ lrzsz-0.12.20/config.rpath 2004-09-12 14:40:34.329752040 -0400
> -@@ -0,0 +1,548 @@
> -+#! /bin/sh
> -+# Output a system dependent set of variables, describing how to set the
> -+# run time search path of shared libraries in an executable.
> -+#
> -+#   Copyright 1996-2003 Free Software Foundation, Inc.
> -+#   Taken from GNU libtool, 2001
> -+#   Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
> -+#
> -+#   This program is free software; you can redistribute it and/or modify
> -+#   it under the terms of the GNU General Public License as published by
> -+#   the Free Software Foundation; either version 2 of the License, or
> -+#   (at your option) any later version.
> -+#
> -+#   This program is distributed in the hope that it will be useful, but
> -+#   WITHOUT ANY WARRANTY; without even the implied warranty of
> -+#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+#   General Public License for more details.
> -+#
> -+#   You should have received a copy of the GNU General Public License
> -+#   along with this program; if not, write to the Free Software
> -+#   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
> 02111-1307, USA.
> -+#
> -+#   As a special exception to the GNU General Public License, if you
> -+#   distribute this file as part of a program that contains a
> -+#   configuration script generated by Autoconf, you may include it under
> -+#   the same distribution terms that you use for the rest of that
> program.
> -+#
> -+# The first argument passed to this file is the canonical host
> specification,
> -+#    CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM
> -+# or
> -+#    CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM
> -+# The environment variables CC, GCC, LDFLAGS, LD, with_gnu_ld
> -+# should be set by the caller.
> -+#
> -+# The set of defined variables is at the end of this script.
> -+
> -+# Known limitations:
> -+# - On IRIX 6.5 with CC="cc", the run time search patch must not be
> longer
> -+#   than 256 bytes, otherwise the compiler driver will dump core. The
> only
> -+#   known workaround is to choose shorter directory names for the build
> -+#   directory and/or the installation directory.
> -+
> -+# All known linkers require a `.a' archive for static linking (except
> M$VC,
> -+# which needs '.lib').
> -+libext=a
> -+shrext=.so
> -+
> -+host="$1"
> -+host_cpu=`echo "$host" | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
> -+host_vendor=`echo "$host" | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\2/'`
> -+host_os=`echo "$host" | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
> -+
> -+# Code taken from libtool.m4's AC_LIBTOOL_PROG_COMPILER_PIC.
> -+
> -+wl=
> -+if test "$GCC" = yes; then
> -+  wl='-Wl,'
> -+else
> -+  case "$host_os" in
> -+    aix*)
> -+      wl='-Wl,'
> -+      ;;
> -+    mingw* | pw32* | os2*)
> -+      ;;
> -+    hpux9* | hpux10* | hpux11*)
> -+      wl='-Wl,'
> -+      ;;
> -+    irix5* | irix6* | nonstopux*)
> -+      wl='-Wl,'
> -+      ;;
> -+    newsos6)
> -+      ;;
> -+    linux*)
> -+      case $CC in
> -+        icc|ecc)
> -+          wl='-Wl,'
> -+          ;;
> -+        ccc)
> -+          wl='-Wl,'
> -+          ;;
> -+      esac
> -+      ;;
> -+    osf3* | osf4* | osf5*)
> -+      wl='-Wl,'
> -+      ;;
> -+    sco3.2v5*)
> -+      ;;
> -+    solaris*)
> -+      wl='-Wl,'
> -+      ;;
> -+    sunos4*)
> -+      wl='-Qoption ld '
> -+      ;;
> -+    sysv4 | sysv4.2uw2* | sysv4.3* | sysv5*)
> -+      wl='-Wl,'
> -+      ;;
> -+    sysv4*MP*)
> -+      ;;
> -+    uts4*)
> -+      ;;
> -+  esac
> -+fi
> -+
> -+# Code taken from libtool.m4's AC_LIBTOOL_PROG_LD_SHLIBS.
> -+
> -+hardcode_libdir_flag_spec=
> -+hardcode_libdir_separator=
> -+hardcode_direct=no
> -+hardcode_minus_L=no
> -+
> -+case "$host_os" in
> -+  cygwin* | mingw* | pw32*)
> -+    # FIXME: the MSVC++ port hasn't been tested in a loooong time
> -+    # When not using gcc, we currently assume that we are using
> -+    # Microsoft Visual C++.
> -+    if test "$GCC" != yes; then
> -+      with_gnu_ld=no
> -+    fi
> -+    ;;
> -+  openbsd*)
> -+    with_gnu_ld=no
> -+    ;;
> -+esac
> -+
> -+ld_shlibs=yes
> -+if test "$with_gnu_ld" = yes; then
> -+  case "$host_os" in
> -+    aix3* | aix4* | aix5*)
> -+      # On AIX/PPC, the GNU linker is very broken
> -+      if test "$host_cpu" != ia64; then
> -+        ld_shlibs=no
> -+      fi
> -+      ;;
> -+    amigaos*)
> -+      hardcode_libdir_flag_spec='-L$libdir'
> -+      hardcode_minus_L=yes
> -+      # Samuel A. Falvo II <kc5tja@dolphin.openprojects.net> reports
> -+      # that the semantics of dynamic libraries on AmigaOS, at least up
> -+      # to version 4, is to share data among multiple programs linked
> -+      # with the same dynamic library.  Since this doesn't match the
> -+      # behavior of shared libraries on other platforms, we can use
> -+      # them.
> -+      ld_shlibs=no
> -+      ;;
> -+    beos*)
> -+      if $LD --help 2>&1 | grep ': supported targets:.* elf' >
> /dev/null; then
> -+        :
> -+      else
> -+        ld_shlibs=no
> -+      fi
> -+      ;;
> -+    cygwin* | mingw* | pw32*)
> -+      # hardcode_libdir_flag_spec is actually meaningless, as there is
> -+      # no search path for DLLs.
> -+      hardcode_libdir_flag_spec='-L$libdir'
> -+      if $LD --help 2>&1 | grep 'auto-import' > /dev/null; then
> -+        :
> -+      else
> -+        ld_shlibs=no
> -+      fi
> -+      ;;
> -+    netbsd*)
> -+      ;;
> -+    solaris* | sysv5*)
> -+      if $LD -v 2>&1 | grep 'BFD 2\.8' > /dev/null; then
> -+        ld_shlibs=no
> -+      elif $LD --help 2>&1 | grep ': supported targets:.* elf' >
> /dev/null; then
> -+        :
> -+      else
> -+        ld_shlibs=no
> -+      fi
> -+      ;;
> -+    sunos4*)
> -+      hardcode_direct=yes
> -+      ;;
> -+    *)
> -+      if $LD --help 2>&1 | grep ': supported targets:.* elf' >
> /dev/null; then
> -+        :
> -+      else
> -+        ld_shlibs=no
> -+      fi
> -+      ;;
> -+  esac
> -+  if test "$ld_shlibs" = yes; then
> -+    # Unlike libtool, we use -rpath here, not --rpath, since the
> documented
> -+    # option of GNU ld is called -rpath, not --rpath.
> -+    hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
> -+  fi
> -+else
> -+  case "$host_os" in
> -+    aix3*)
> -+      # Note: this linker hardcodes the directories in LIBPATH if there
> -+      # are no directories specified by -L.
> -+      hardcode_minus_L=yes
> -+      if test "$GCC" = yes; then
> -+        # Neither direct hardcoding nor static linking is supported with
> a
> -+        # broken collect2.
> -+        hardcode_direct=unsupported
> -+      fi
> -+      ;;
> -+    aix4* | aix5*)
> -+      if test "$host_cpu" = ia64; then
> -+        # On IA64, the linker does run time linking by default, so we
> don't
> -+        # have to do anything special.
> -+        aix_use_runtimelinking=no
> -+      else
> -+        aix_use_runtimelinking=no
> -+        # Test if we are trying to use run time linking or normal
> -+        # AIX style linking. If -brtl is somewhere in LDFLAGS, we
> -+        # need to do runtime linking.
> -+        case $host_os in aix4.[23]|aix4.[23].*|aix5*)
> -+          for ld_flag in $LDFLAGS; do
> -+            if (test $ld_flag = "-brtl" || test $ld_flag = "-Wl,-brtl");
> then
> -+              aix_use_runtimelinking=yes
> -+              break
> -+            fi
> -+          done
> -+        esac
> -+      fi
> -+      hardcode_direct=yes
> -+      hardcode_libdir_separator=':'
> -+      if test "$GCC" = yes; then
> -+        case $host_os in aix4.[012]|aix4.[012].*)
> -+          collect2name=`${CC} -print-prog-name=collect2`
> -+          if test -f "$collect2name" && \
> -+            strings "$collect2name" | grep resolve_lib_name >/dev/null
> -+          then
> -+            # We have reworked collect2
> -+            hardcode_direct=yes
> -+          else
> -+            # We have old collect2
> -+            hardcode_direct=unsupported
> -+            hardcode_minus_L=yes
> -+            hardcode_libdir_flag_spec='-L$libdir'
> -+            hardcode_libdir_separator=
> -+          fi
> -+        esac
> -+      fi
> -+      # Begin _LT_AC_SYS_LIBPATH_AIX.
> -+      echo 'int main () { return 0; }' > conftest.c
> -+      ${CC} ${LDFLAGS} conftest.c -o conftest
> -+      aix_libpath=`dump -H conftest 2>/dev/null | sed -n -e '/Import
> File Strings/,/^$/ { /^0/ { s/^0  *\(.*\)$/\1/; p; }
> -+}'`
> -+      if test -z "$aix_libpath"; then
> -+        aix_libpath=`dump -HX64 conftest 2>/dev/null | sed -n -e
> '/Import File Strings/,/^$/ { /^0/ { s/^0  *\(.*\)$/\1/; p; }
> -+}'`
> -+      fi
> -+      if test -z "$aix_libpath"; then
> -+        aix_libpath="/usr/lib:/lib"
> -+      fi
> -+      rm -f conftest.c conftest
> -+      # End _LT_AC_SYS_LIBPATH_AIX.
> -+      if test "$aix_use_runtimelinking" = yes; then
> -+        hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_
> libpath"
> -+      else
> -+        if test "$host_cpu" = ia64; then
> -+          hardcode_libdir_flag_spec='${wl}-R $libdir:/usr/lib:/lib'
> -+        else
> -+          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_
> libpath"
> -+        fi
> -+      fi
> -+      ;;
> -+    amigaos*)
> -+      hardcode_libdir_flag_spec='-L$libdir'
> -+      hardcode_minus_L=yes
> -+      # see comment about different semantics on the GNU ld section
> -+      ld_shlibs=no
> -+      ;;
> -+    bsdi4*)
> -+      ;;
> -+    cygwin* | mingw* | pw32*)
> -+      # When not using gcc, we currently assume that we are using
> -+      # Microsoft Visual C++.
> -+      # hardcode_libdir_flag_spec is actually meaningless, as there is
> -+      # no search path for DLLs.
> -+      hardcode_libdir_flag_spec=' '
> -+      libext=lib
> -+      ;;
> -+    darwin* | rhapsody*)
> -+      if $CC -v 2>&1 | grep 'Apple' >/dev/null ; then
> -+        hardcode_direct=no
> -+      fi
> -+      ;;
> -+    dgux*)
> -+      hardcode_libdir_flag_spec='-L$libdir'
> -+      ;;
> -+    freebsd1*)
> -+      ld_shlibs=no
> -+      ;;
> -+    freebsd2.2*)
> -+      hardcode_libdir_flag_spec='-R$libdir'
> -+      hardcode_direct=yes
> -+      ;;
> -+    freebsd2*)
> -+      hardcode_direct=yes
> -+      hardcode_minus_L=yes
> -+      ;;
> -+    freebsd*)
> -+      hardcode_libdir_flag_spec='-R$libdir'
> -+      hardcode_direct=yes
> -+      ;;
> -+    hpux9*)
> -+      hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
> -+      hardcode_libdir_separator=:
> -+      hardcode_direct=yes
> -+      # hardcode_minus_L: Not really in the search PATH,
> -+      # but as the default location of the library.
> -+      hardcode_minus_L=yes
> -+      ;;
> -+    hpux10* | hpux11*)
> -+      if test "$with_gnu_ld" = no; then
> -+        case "$host_cpu" in
> -+          hppa*64*)
> -+            hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
> -+            hardcode_libdir_separator=:
> -+            hardcode_direct=no
> -+            ;;
> -+          ia64*)
> -+            hardcode_libdir_flag_spec='-L$libdir'
> -+            hardcode_direct=no
> -+            # hardcode_minus_L: Not really in the search PATH,
> -+            # but as the default location of the library.
> -+            hardcode_minus_L=yes
> -+            ;;
> -+          *)
> -+            hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
> -+            hardcode_libdir_separator=:
> -+            hardcode_direct=yes
> -+            # hardcode_minus_L: Not really in the search PATH,
> -+            # but as the default location of the library.
> -+            hardcode_minus_L=yes
> -+            ;;
> -+        esac
> -+      fi
> -+      ;;
> -+    irix5* | irix6* | nonstopux*)
> -+      hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
> -+      hardcode_libdir_separator=:
> -+      ;;
> -+    netbsd*)
> -+      hardcode_libdir_flag_spec='-R$libdir'
> -+      hardcode_direct=yes
> -+      ;;
> -+    newsos6)
> -+      hardcode_direct=yes
> -+      hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
> -+      hardcode_libdir_separator=:
> -+      ;;
> -+    openbsd*)
> -+      hardcode_direct=yes
> -+      if test -z "`echo __ELF__ | $CC -E - | grep __ELF__`" || test
> "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
> -+        hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
> -+      else
> -+        case "$host_os" in
> -+          openbsd[01].* | openbsd2.[0-7] | openbsd2.[0-7].*)
> -+            hardcode_libdir_flag_spec='-R$libdir'
> -+            ;;
> -+          *)
> -+            hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
> -+            ;;
> -+        esac
> -+      fi
> -+      ;;
> -+    os2*)
> -+      hardcode_libdir_flag_spec='-L$libdir'
> -+      hardcode_minus_L=yes
> -+      ;;
> -+    osf3*)
> -+      hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
> -+      hardcode_libdir_separator=:
> -+      ;;
> -+    osf4* | osf5*)
> -+      if test "$GCC" = yes; then
> -+        hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
> -+      else
> -+        # Both cc and cxx compiler support -rpath directly
> -+        hardcode_libdir_flag_spec='-rpath $libdir'
> -+      fi
> -+      hardcode_libdir_separator=:
> -+      ;;
> -+    sco3.2v5*)
> -+      ;;
> -+    solaris*)
> -+      hardcode_libdir_flag_spec='-R$libdir'
> -+      ;;
> -+    sunos4*)
> -+      hardcode_libdir_flag_spec='-L$libdir'
> -+      hardcode_direct=yes
> -+      hardcode_minus_L=yes
> -+      ;;
> -+    sysv4)
> -+      case $host_vendor in
> -+        sni)
> -+          hardcode_direct=yes # is this really true???
> -+          ;;
> -+        siemens)
> -+          hardcode_direct=no
> -+          ;;
> -+        motorola)
> -+          hardcode_direct=no #Motorola manual says yes, but my tests say
> they lie
> -+          ;;
> -+      esac
> -+      ;;
> -+    sysv4.3*)
> -+      ;;
> -+    sysv4*MP*)
> -+      if test -d /usr/nec; then
> -+        ld_shlibs=yes
> -+      fi
> -+      ;;
> -+    sysv4.2uw2*)
> -+      hardcode_direct=yes
> -+      hardcode_minus_L=no
> -+      ;;
> -+    sysv5OpenUNIX8* | sysv5UnixWare7* |  sysv5uw[78]* | unixware7*)
> -+      ;;
> -+    sysv5*)
> -+      hardcode_libdir_flag_spec=
> -+      ;;
> -+    uts4*)
> -+      hardcode_libdir_flag_spec='-L$libdir'
> -+      ;;
> -+    *)
> -+      ld_shlibs=no
> -+      ;;
> -+  esac
> -+fi
> -+
> -+# Check dynamic linker characteristics
> -+# Code taken from libtool.m4's AC_LIBTOOL_SYS_DYNAMIC_LINKER.
> -+libname_spec='lib$name'
> -+case "$host_os" in
> -+  aix3*)
> -+    ;;
> -+  aix4* | aix5*)
> -+    ;;
> -+  amigaos*)
> -+    ;;
> -+  beos*)
> -+    ;;
> -+  bsdi4*)
> -+    ;;
> -+  cygwin* | mingw* | pw32*)
> -+    shrext=.dll
> -+    ;;
> -+  darwin* | rhapsody*)
> -+    shrext=.dylib
> -+    ;;
> -+  dgux*)
> -+    ;;
> -+  freebsd1*)
> -+    ;;
> -+  freebsd*)
> -+    ;;
> -+  gnu*)
> -+    ;;
> -+  hpux9* | hpux10* | hpux11*)
> -+    case "$host_cpu" in
> -+      ia64*)
> -+        shrext=.so
> -+        ;;
> -+      hppa*64*)
> -+        shrext=.sl
> -+        ;;
> -+      *)
> -+        shrext=.sl
> -+        ;;
> -+    esac
> -+    ;;
> -+  irix5* | irix6* | nonstopux*)
> -+    case "$host_os" in
> -+      irix5* | nonstopux*)
> -+        libsuff= shlibsuff=
> -+        ;;
> -+      *)
> -+        case $LD in
> -+          *-32|*"-32 "|*-melf32bsmip|*"-melf32bsmip ") libsuff=
> shlibsuff= ;;
> -+          *-n32|*"-n32 "|*-melf32bmipn32|*"-melf32bmipn32 ") libsuff=32
> shlibsuff=N32 ;;
> -+          *-64|*"-64 "|*-melf64bmip|*"-melf64bmip ") libsuff=64
> shlibsuff=64 ;;
> -+          *) libsuff= shlibsuff= ;;
> -+        esac
> -+        ;;
> -+    esac
> -+    ;;
> -+  linux*oldld* | linux*aout* | linux*coff*)
> -+    ;;
> -+  linux*)
> -+    ;;
> -+  netbsd*)
> -+    ;;
> -+  newsos6)
> -+    ;;
> -+  nto-qnx)
> -+    ;;
> -+  openbsd*)
> -+    ;;
> -+  os2*)
> -+    libname_spec='$name'
> -+    shrext=.dll
> -+    ;;
> -+  osf3* | osf4* | osf5*)
> -+    ;;
> -+  sco3.2v5*)
> -+    ;;
> -+  solaris*)
> -+    ;;
> -+  sunos4*)
> -+    ;;
> -+  sysv4 | sysv4.2uw2* | sysv4.3* | sysv5*)
> -+    ;;
> -+  sysv4*MP*)
> -+    ;;
> -+  uts4*)
> -+    ;;
> -+esac
> -+
> -+sed_quote_subst='s/\(["`$\\]\)/\\\1/g'
> -+escaped_wl=`echo "X$wl" | sed -e 's/^X//' -e "$sed_quote_subst"`
> -+shlibext=`echo "$shrext" | sed -e 's,^\.,,'`
> -+escaped_hardcode_libdir_flag_spec=`echo "X$hardcode_libdir_flag_spec" |
> sed -e 's/^X//' -e "$sed_quote_subst"`
> -+
> -+sed -e 's/^\([a-zA-Z0-9_]*\)=/acl_cv_\1=/' <<EOF
> -+
> -+# How to pass a linker flag through the compiler.
> -+wl="$escaped_wl"
> -+
> -+# Static library suffix (normally "a").
> -+libext="$libext"
> -+
> -+# Shared library suffix (normally "so").
> -+shlibext="$shlibext"
> -+
> -+# Flag to hardcode \$libdir into a binary during linking.
> -+# This must work even if \$libdir does not exist.
> -+hardcode_libdir_flag_spec="$escaped_hardcode_libdir_flag_spec"
> -+
> -+# Whether we need a single -rpath flag with a separated argument.
> -+hardcode_libdir_separator="$hardcode_libdir_separator"
> -+
> -+# Set to yes if using DIR/libNAME.so during linking hardcodes DIR into
> the
> -+# resulting binary.
> -+hardcode_direct="$hardcode_direct"
> -+
> -+# Set to yes if using the -LDIR flag during linking hardcodes DIR into
> the
> -+# resulting binary.
> -+hardcode_minus_L="$hardcode_minus_L"
> -+
> -+EOF
> ---- lrzsz-0.12.20.safe/configure.in    2004-09-12 14:39:55.161706488
> -0400
> -+++ lrzsz-0.12.20/configure.in 2004-09-12 14:40:35.816526016 -0400
> -@@ -260,11 +260,10 @@
> - AM_GNU_GETTEXT
> -
> - AC_DEFINE_UNQUOTED(LOCALEDIR,"$prefix/$DATADIRNAME")
> --AC_LINK_FILES($nls_cv_header_libgt, $nls_cv_header_intl)
> -
> --AC_OUTPUT([Makefile intl/Makefile lib/Makefile testsuite/Makefile \
> -+AC_OUTPUT([Makefile intl/Makefile lib/Makefile testsuite/Makefile
> m4/Makefile \
> - man/Makefile po/Makefile.in src/Makefile debian/rules Specfile systype \
> - src/lrzszbug],
> --[sed -e "/POTFILES =/r po/POTFILES" po/Makefile.in > po/Makefile;
> -+[
> - chmod +x debian/rules;
> - test -z "$CONFIG_HEADERS" || echo timestamp > stamp-h])
> ---- lrzsz-0.12.20.safe/intl/bindtextdom.c      1998-04-26
> 09:22:36.000000000 -0400
> -+++ lrzsz-0.12.20/intl/bindtextdom.c   2004-09-12 14:40:34.343749912
> -0400
> -@@ -1,59 +1,75 @@
> - /* Implementation of the bindtextdomain(3) function
> --   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
> -+   Copyright (C) 1995-1998, 2000-2003 Free Software Foundation, Inc.
> -
> --   This program is free software; you can redistribute it and/or modify
> --   it under the terms of the GNU General Public License as published by
> --   the Free Software Foundation; either version 2, or (at your option)
> -+   This program is free software; you can redistribute it and/or modify
> it
> -+   under the terms of the GNU Library General Public License as published
> -+   by the Free Software Foundation; either version 2, or (at your option)
> -    any later version.
> -
> -    This program is distributed in the hope that it will be useful,
> -    but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> --   GNU General Public License for more details.
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Library General Public License for more details.
> -
> --   You should have received a copy of the GNU General Public License
> --   along with this program; if not, write to the Free Software
> Foundation,
> --   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
> -+   You should have received a copy of the GNU Library General Public
> -+   License along with this program; if not, write to the Free Software
> -+   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
> -+   USA.  */
> -
> - #ifdef HAVE_CONFIG_H
> - # include <config.h>
> - #endif
> -
> --#if defined STDC_HEADERS || defined _LIBC
> --# include <stdlib.h>
> --#else
> --# ifdef HAVE_MALLOC_H
> --#  include <malloc.h>
> --# else
> --void free ();
> --# endif
> --#endif
> -+#include <stddef.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -
> --#if defined HAVE_STRING_H || defined _LIBC
> --# include <string.h>
> -+#ifdef _LIBC
> -+# include <libintl.h>
> - #else
> --# include <strings.h>
> --# ifndef memcpy
> --#  define memcpy(Dst, Src, Num) bcopy (Src, Dst, Num)
> --# endif
> -+# include "libgnuintl.h"
> - #endif
> -+#include "gettextP.h"
> -
> - #ifdef _LIBC
> --# include <libintl.h>
> -+/* We have to handle multi-threaded applications.  */
> -+# include <bits/libc-lock.h>
> - #else
> --# include "libgettext.h"
> -+/* Provide dummy implementation if this is outside glibc.  */
> -+# define __libc_rwlock_define(CLASS, NAME)
> -+# define __libc_rwlock_wrlock(NAME)
> -+# define __libc_rwlock_unlock(NAME)
> -+#endif
> -+
> -+/* The internal variables in the standalone libintl.a must have different
> -+   names than the internal variables in GNU libc, otherwise programs
> -+   using libintl.a cannot be linked statically.  */
> -+#if !defined _LIBC
> -+# define _nl_default_dirname libintl_nl_default_dirname
> -+# define _nl_domain_bindings libintl_nl_domain_bindings
> -+#endif
> -+
> -+/* Some compilers, like SunOS4 cc, don't have offsetof in <stddef.h>.  */
> -+#ifndef offsetof
> -+# define offsetof(type,ident) ((size_t)&(((type*)0)->ident))
> - #endif
> --#include "gettext.h"
> --#include "gettextP.h"
> -
> - /* @@ end of prolog @@ */
> -
> - /* Contains the default location of the message catalogs.  */
> - extern const char _nl_default_dirname[];
> -+#ifdef _LIBC
> -+extern const char _nl_default_dirname_internal[] attribute_hidden;
> -+#else
> -+# define INTUSE(name) name
> -+#endif
> -
> - /* List with bindings of specific domains.  */
> - extern struct binding *_nl_domain_bindings;
> -
> -+/* Lock variable to protect the global data in the gettext
> implementation.  */
> -+__libc_rwlock_define (extern, _nl_state_lock attribute_hidden)
> -+
> -
> - /* Names for the libintl functions are a problem.  They must not clash
> -    with existing names and they should follow ANSI C.  But this source
> -@@ -61,23 +77,41 @@
> -    prefix.  So we have to make a difference here.  */
> - #ifdef _LIBC
> - # define BINDTEXTDOMAIN __bindtextdomain
> --# define strdup(str) __strdup (str)
> -+# define BIND_TEXTDOMAIN_CODESET __bind_textdomain_codeset
> -+# ifndef strdup
> -+#  define strdup(str) __strdup (str)
> -+# endif
> - #else
> --# define BINDTEXTDOMAIN bindtextdomain__
> -+# define BINDTEXTDOMAIN libintl_bindtextdomain
> -+# define BIND_TEXTDOMAIN_CODESET libintl_bind_textdomain_codeset
> - #endif
> -
> --/* Specify that the DOMAINNAME message catalog will be found
> --   in DIRNAME rather than in the system locale data base.  */
> --char *
> --BINDTEXTDOMAIN (domainname, dirname)
> --     const char *domainname;
> --     const char *dirname;
> -+/* Specifies the directory name *DIRNAMEP and the output codeset
> *CODESETP
> -+   to be used for the DOMAINNAME message catalog.
> -+   If *DIRNAMEP or *CODESETP is NULL, the corresponding attribute is not
> -+   modified, only the current value is returned.
> -+   If DIRNAMEP or CODESETP is NULL, the corresponding attribute is
> neither
> -+   modified nor returned.  */
> -+static void
> -+set_binding_values (const char *domainname,
> -+                  const char **dirnamep, const char **codesetp)
> - {
> -   struct binding *binding;
> -+  int modified;
> -
> -   /* Some sanity checks.  */
> -   if (domainname == NULL || domainname[0] == '\0')
> --    return NULL;
> -+    {
> -+      if (dirnamep)
> -+      *dirnamep = NULL;
> -+      if (codesetp)
> -+      *codesetp = NULL;
> -+      return;
> -+    }
> -+
> -+  __libc_rwlock_wrlock (_nl_state_lock);
> -+
> -+  modified = 0;
> -
> -   for (binding = _nl_domain_bindings; binding != NULL; binding =
> binding->next)
> -     {
> -@@ -93,81 +127,173 @@
> -       }
> -     }
> -
> --  if (dirname == NULL)
> --    /* The current binding has be to returned.  */
> --    return binding == NULL ? (char *) _nl_default_dirname :
> binding->dirname;
> --
> -   if (binding != NULL)
> -     {
> --      /* The domain is already bound.  If the new value and the old
> --       one are equal we simply do nothing.  Otherwise replace the
> --       old binding.  */
> --      if (strcmp (dirname, binding->dirname) != 0)
> -+      if (dirnamep)
> -       {
> --        char *new_dirname;
> -+        const char *dirname = *dirnamep;
> -
> --        if (strcmp (dirname, _nl_default_dirname) == 0)
> --          new_dirname = (char *) _nl_default_dirname;
> -+        if (dirname == NULL)
> -+          /* The current binding has be to returned.  */
> -+          *dirnamep = binding->dirname;
> -         else
> -           {
> -+            /* The domain is already bound.  If the new value and the old
> -+               one are equal we simply do nothing.  Otherwise replace the
> -+               old binding.  */
> -+            char *result = binding->dirname;
> -+            if (strcmp (dirname, result) != 0)
> -+              {
> -+                if (strcmp (dirname, INTUSE(_nl_default_dirname)) == 0)
> -+                  result = (char *) INTUSE(_nl_default_dirname);
> -+                else
> -+                  {
> - #if defined _LIBC || defined HAVE_STRDUP
> --            new_dirname = strdup (dirname);
> --            if (new_dirname == NULL)
> --              return NULL;
> -+                    result = strdup (dirname);
> - #else
> --            size_t len = strlen (dirname) + 1;
> --            new_dirname = (char *) malloc (len);
> --            if (new_dirname == NULL)
> --              return NULL;
> --
> --            memcpy (new_dirname, dirname, len);
> -+                    size_t len = strlen (dirname) + 1;
> -+                    result = (char *) malloc (len);
> -+                    if (__builtin_expect (result != NULL, 1))
> -+                      memcpy (result, dirname, len);
> - #endif
> -+                  }
> -+
> -+                if (__builtin_expect (result != NULL, 1))
> -+                  {
> -+                    if (binding->dirname != INTUSE(_nl_default_dirname))
> -+                      free (binding->dirname);
> -+
> -+                    binding->dirname = result;
> -+                    modified = 1;
> -+                  }
> -+              }
> -+            *dirnamep = result;
> -           }
> -+      }
> -
> --        if (binding->dirname != _nl_default_dirname)
> --          free (binding->dirname);
> -+      if (codesetp)
> -+      {
> -+        const char *codeset = *codesetp;
> -
> --        binding->dirname = new_dirname;
> -+        if (codeset == NULL)
> -+          /* The current binding has be to returned.  */
> -+          *codesetp = binding->codeset;
> -+        else
> -+          {
> -+            /* The domain is already bound.  If the new value and the old
> -+               one are equal we simply do nothing.  Otherwise replace the
> -+               old binding.  */
> -+            char *result = binding->codeset;
> -+            if (result == NULL || strcmp (codeset, result) != 0)
> -+              {
> -+#if defined _LIBC || defined HAVE_STRDUP
> -+                result = strdup (codeset);
> -+#else
> -+                size_t len = strlen (codeset) + 1;
> -+                result = (char *) malloc (len);
> -+                if (__builtin_expect (result != NULL, 1))
> -+                  memcpy (result, codeset, len);
> -+#endif
> -+
> -+                if (__builtin_expect (result != NULL, 1))
> -+                  {
> -+                    if (binding->codeset != NULL)
> -+                      free (binding->codeset);
> -+
> -+                    binding->codeset = result;
> -+                    binding->codeset_cntr++;
> -+                    modified = 1;
> -+                  }
> -+              }
> -+            *codesetp = result;
> -+          }
> -       }
> -     }
> -+  else if ((dirnamep == NULL || *dirnamep == NULL)
> -+         && (codesetp == NULL || *codesetp == NULL))
> -+    {
> -+      /* Simply return the default values.  */
> -+      if (dirnamep)
> -+      *dirnamep = INTUSE(_nl_default_dirname);
> -+      if (codesetp)
> -+      *codesetp = NULL;
> -+    }
> -   else
> -     {
> -       /* We have to create a new binding.  */
> --      size_t len;
> -+      size_t len = strlen (domainname) + 1;
> -       struct binding *new_binding =
> --      (struct binding *) malloc (sizeof (*new_binding));
> -+      (struct binding *) malloc (offsetof (struct binding, domainname) +
> len);
> -
> --      if (new_binding == NULL)
> --      return NULL;
> -+      if (__builtin_expect (new_binding == NULL, 0))
> -+      goto failed;
> -
> -+      memcpy (new_binding->domainname, domainname, len);
> -+
> -+      if (dirnamep)
> -+      {
> -+        const char *dirname = *dirnamep;
> -+
> -+        if (dirname == NULL)
> -+          /* The default value.  */
> -+          dirname = INTUSE(_nl_default_dirname);
> -+        else
> -+          {
> -+            if (strcmp (dirname, INTUSE(_nl_default_dirname)) == 0)
> -+              dirname = INTUSE(_nl_default_dirname);
> -+            else
> -+              {
> -+                char *result;
> - #if defined _LIBC || defined HAVE_STRDUP
> --      new_binding->domainname = strdup (domainname);
> --      if (new_binding->domainname == NULL)
> --      return NULL;
> -+                result = strdup (dirname);
> -+                if (__builtin_expect (result == NULL, 0))
> -+                  goto failed_dirname;
> - #else
> --      len = strlen (domainname) + 1;
> --      new_binding->domainname = (char *) malloc (len);
> --      if (new_binding->domainname == NULL)
> --      return NULL;
> --      memcpy (new_binding->domainname, domainname, len);
> -+                size_t len = strlen (dirname) + 1;
> -+                result = (char *) malloc (len);
> -+                if (__builtin_expect (result == NULL, 0))
> -+                  goto failed_dirname;
> -+                memcpy (result, dirname, len);
> - #endif
> --
> --      if (strcmp (dirname, _nl_default_dirname) == 0)
> --      new_binding->dirname = (char *) _nl_default_dirname;
> -+                dirname = result;
> -+              }
> -+          }
> -+        *dirnamep = dirname;
> -+        new_binding->dirname = (char *) dirname;
> -+      }
> -       else
> -+      /* The default value.  */
> -+      new_binding->dirname = (char *) INTUSE(_nl_default_dirname);
> -+
> -+      new_binding->codeset_cntr = 0;
> -+
> -+      if (codesetp)
> -       {
> -+        const char *codeset = *codesetp;
> -+
> -+        if (codeset != NULL)
> -+          {
> -+            char *result;
> -+
> - #if defined _LIBC || defined HAVE_STRDUP
> --        new_binding->dirname = strdup (dirname);
> --        if (new_binding->dirname == NULL)
> --          return NULL;
> -+            result = strdup (codeset);
> -+            if (__builtin_expect (result == NULL, 0))
> -+              goto failed_codeset;
> - #else
> --        len = strlen (dirname) + 1;
> --        new_binding->dirname = (char *) malloc (len);
> --        if (new_binding->dirname == NULL)
> --          return NULL;
> --        memcpy (new_binding->dirname, dirname, len);
> -+            size_t len = strlen (codeset) + 1;
> -+            result = (char *) malloc (len);
> -+            if (__builtin_expect (result == NULL, 0))
> -+              goto failed_codeset;
> -+            memcpy (result, codeset, len);
> - #endif
> -+            codeset = result;
> -+            new_binding->codeset_cntr++;
> -+          }
> -+        *codesetp = codeset;
> -+        new_binding->codeset = (char *) codeset;
> -       }
> -+      else
> -+      new_binding->codeset = NULL;
> -
> -       /* Now enqueue it.  */
> -       if (_nl_domain_bindings == NULL
> -@@ -187,13 +313,51 @@
> -         binding->next = new_binding;
> -       }
> -
> --      binding = new_binding;
> -+      modified = 1;
> -+
> -+      /* Here we deal with memory allocation failures.  */
> -+      if (0)
> -+      {
> -+      failed_codeset:
> -+        if (new_binding->dirname != INTUSE(_nl_default_dirname))
> -+          free (new_binding->dirname);
> -+      failed_dirname:
> -+        free (new_binding);
> -+      failed:
> -+        if (dirnamep)
> -+          *dirnamep = NULL;
> -+        if (codesetp)
> -+          *codesetp = NULL;
> -+      }
> -     }
> -
> --  return binding->dirname;
> -+  /* If we modified any binding, we flush the caches.  */
> -+  if (modified)
> -+    ++_nl_msg_cat_cntr;
> -+
> -+  __libc_rwlock_unlock (_nl_state_lock);
> -+}
> -+
> -+/* Specify that the DOMAINNAME message catalog will be found
> -+   in DIRNAME rather than in the system locale data base.  */
> -+char *
> -+BINDTEXTDOMAIN (const char *domainname, const char *dirname)
> -+{
> -+  set_binding_values (domainname, &dirname, NULL);
> -+  return (char *) dirname;
> -+}
> -+
> -+/* Specify the character encoding in which the messages from the
> -+   DOMAINNAME message catalog will be returned.  */
> -+char *
> -+BIND_TEXTDOMAIN_CODESET (const char *domainname, const char *codeset)
> -+{
> -+  set_binding_values (domainname, NULL, &codeset);
> -+  return (char *) codeset;
> - }
> -
> - #ifdef _LIBC
> --/* Alias for function name in GNU C Library.  */
> -+/* Aliases for function names in GNU C Library.  */
> - weak_alias (__bindtextdomain, bindtextdomain);
> -+weak_alias (__bind_textdomain_codeset, bind_textdomain_codeset);
> - #endif
> ---- lrzsz-0.12.20.safe/intl/cat-compat.c       1998-04-26
> 09:22:37.000000000 -0400
> -+++ lrzsz-0.12.20/intl/cat-compat.c    1969-12-31 19:00:00.000000000
> -0500
> -@@ -1,262 +0,0 @@
> --/* Compatibility code for gettext-using-catgets interface.
> --   Copyright (C) 1995, 1997 Free Software Foundation, Inc.
> --
> --   This program is free software; you can redistribute it and/or modify
> --   it under the terms of the GNU General Public License as published by
> --   the Free Software Foundation; either version 2, or (at your option)
> --   any later version.
> --
> --   This program is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> --   GNU General Public License for more details.
> --
> --   You should have received a copy of the GNU General Public License
> --   along with this program; if not, write to the Free Software
> Foundation,
> --   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
> --
> --#ifdef HAVE_CONFIG_H
> --# include <config.h>
> --#endif
> --
> --#include <stdio.h>
> --
> --#ifdef STDC_HEADERS
> --# include <stdlib.h>
> --# include <string.h>
> --#else
> --char *getenv ();
> --# ifdef HAVE_MALLOC_H
> --#  include <malloc.h>
> --# endif
> --#endif
> --
> --#ifdef HAVE_NL_TYPES_H
> --# include <nl_types.h>
> --#endif
> --
> --#include "libgettext.h"
> --
> --/* @@ end of prolog @@ */
> --
> --/* XPG3 defines the result of `setlocale (category, NULL)' as:
> --   ``Directs `setlocale()' to query `category' and return the current
> --     setting of `local'.''
> --   However it does not specify the exact format.  And even worse: POSIX
> --   defines this not at all.  So we can use this feature only on selected
> --   system (e.g. those using GNU C Library).  */
> --#ifdef _LIBC
> --# define HAVE_LOCALE_NULL
> --#endif
> --
> --/* The catalog descriptor.  */
> --static nl_catd catalog = (nl_catd) -1;
> --
> --/* Name of the default catalog.  */
> --static const char default_catalog_name[] = "messages";
> --
> --/* Name of currently used catalog.  */
> --static const char *catalog_name = default_catalog_name;
> --
> --/* Get ID for given string.  If not found return -1.  */
> --static int msg_to_cat_id PARAMS ((const char *msg));
> --
> --/* Substitution for systems lacking this function in their C library.  */
> --#if !_LIBC && !HAVE_STPCPY
> --static char *stpcpy PARAMS ((char *dest, const char *src));
> --#endif
> --
> --
> --/* Set currently used domain/catalog.  */
> --char *
> --textdomain (domainname)
> --     const char *domainname;
> --{
> --  nl_catd new_catalog;
> --  char *new_name;
> --  size_t new_name_len;
> --  char *lang;
> --
> --#if defined HAVE_SETLOCALE && defined HAVE_LC_MESSAGES \
> --    && defined HAVE_LOCALE_NULL
> --  lang = setlocale (LC_MESSAGES, NULL);
> --#else
> --  lang = getenv ("LC_ALL");
> --  if (lang == NULL || lang[0] == '\0')
> --    {
> --      lang = getenv ("LC_MESSAGES");
> --      if (lang == NULL || lang[0] == '\0')
> --      lang = getenv ("LANG");
> --    }
> --#endif
> --  if (lang == NULL || lang[0] == '\0')
> --    lang = "C";
> --
> --  /* See whether name...
>
> [Message clipped]

--001a114387b803f12c055fd73392
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SSYjMzk7dmUgaGFkIHBlb3BsZSBmcm9tIHRoZSBwYXN0IHN1Z2dlc3Qg
dGhhdCB0aGlzIGlzIHN0aWxsIHVzZWZ1bCBmb3IgZGVlcGx5IGVtYmVkZGVkIGVudmlyb25tZW50
cyB3aGVyZSBhIHNlcmlhbCBsaW5lIGlzIHRoZSBvbmx5IGZvcm0gb2YgY29tbXVuaWNhdGlvbiwg
c28gSSYjMzk7bSByZXRyYWN0aW5nIHRoaXMgYW5kIHdpbGwgaW5zdGVhZCBjbGVhbiB1cCBkZXBl
bmRlbmNpZXMgc28gaXQgZG9lc24mIzM5O3QgZW5kIHVwIGluIGFsbCBpbWFnZXMuPGRpdj48YnI+
PC9kaXY+PGRpdj5Sb3NzPC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48
ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24gOCBEZWNlbWJlciAyMDE3IGF0IDE2OjQ0LCBSb3Nz
IEJ1cnRvbiA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpyb3NzLmJ1cnRvbkBp
bnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yb3NzLmJ1cnRvbkBpbnRlbC5jb208L2E+Jmd0Ozwv
c3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDox
ZXgiPkl0JiMzOTtzIGJlZW4gYSBsb25nIHRpbWUgc2luY2UgYW55b25lIHdhbnRlZCB0byBkbyBh
IFpNT0RFTSB0cmFuc2ZlciBvdmVyIGEgc2VyaWFsPGJyPg0KbGluZSBhbmQgdGhpcyB1cHN0cmVh
bSBoYXNuJiMzOTt0IGJlZW4gdG91Y2hlZCBpbiBhbG1vc3QgdHdvIGRlY2FkZXMuPGJyPg0KPGJy
Pg0KTGV0JiMzOTtzIHJlbW92ZSBpdCBmcm9tIG9lLWNvcmUsIGlmIHRoZXJlIGFyZSBuaWNoZXMg
d2hlcmUgWk1PREVNIGlzIHN0aWxsIHVzZWZ1bDxicj4NCnRoZW4gaXQgY2FuIGdvIHRvIGFub3Ro
ZXIgbGF5ZXIuPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gJmx0OzxhIGhy
ZWY9Im1haWx0bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb20iPnJvc3MuYnVydG9uQGludGVsLmNvbTwv
YT4mZ3Q7PGJyPg0KLS0tPGJyPg0KwqBtZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvPHdicj5tYWlu
dGFpbmVycy5pbmPCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoDEgLTxicj4NCsKgLi4uL3JlY2lw
ZXMtYnNwL2xyenN6L2xyenN6LTAuPHdicj4xMi4yMC9hY2RlZmluZS5wYXRjaCB8wqAgwqAgMTkg
LTxicj4NCsKgLi4uL2xyenN6L2xyenN6LTAuMTIuMjAvPHdicj5hdXRvdG9vbHMucGF0Y2jCoCDC
oCDCoCDCoCDCoCDCoCB8wqAgwqAgMzkgLTxicj4NCsKgbWV0YS9yZWNpcGVzLWJzcC9scnpzei9s
cnpzei08d2JyPjAuMTIuMjAvZ2V0dGV4dC5wYXRjaCB8IDIxODg0IC0tLS0tLS0tLS0tLS0tLS0t
LS08YnI+DQrCoC4uLi9scnpzei9scnpzei0wLjEyLjIwL2xyenN6LTx3YnI+Y2hlY2stbG9jYWxl
LmgucGF0Y2ggfMKgIMKgIDMyIC08YnI+DQrCoC4uLi9scnpzel9maXhfZm9yX2F1dG9tYWtlLTEu
PHdicj4xMi5wYXRjaMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCA0OSAtPGJyPg0KwqAuLi4v
cmVjaXBlcy1ic3AvbHJ6c3ovbHJ6c3otMC48d2JyPjEyLjIwL21ha2VmaWxlLnBhdGNoIHzCoCDC
oCAyMiAtPGJyPg0KwqBtZXRhL3JlY2lwZXMtYnNwL2xyenN6LzxhIGhyZWY9Imh0dHA6Ly9scnpz
el8wLjEyLjIwLmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5scnpzel88d2Jy
PjAuMTIuMjAuYmI8L2E+wqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIDQ4IC08YnI+DQrCoC4uLi9w
YWNrYWdlZ3JvdXBzLzxhIGhyZWY9Imh0dHA6Ly9wYWNrYWdlZ3JvdXAtYmFzZS5iYiIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+cGFja2FnZWdyb3VwPHdicj4tYmFzZS5iYjwvYT7C
oCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoDMgKy08YnI+DQrCoC4uLi88YSBocmVmPSJodHRw
Oi8vcGFja2FnZWdyb3VwLWNvcmUtdG9vbHMtdGVzdGFwcHMuYmIiIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPnBhY2thZ2Vncm91cC1jb3JlLXRvb2xzLTx3YnI+dGVzdGFwcHMuYmI8
L2E+wqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgMSAtPGJyPg0KwqAuLi4vcGFja2FnZWdyb3Vw
cy88YSBocmVmPSJodHRwOi8vcGFja2FnZWdyb3VwLXNlbGYtaG9zdGVkLmJiIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5wYWNrYWdlZ3JvdXA8d2JyPi1zZWxmLWhvc3RlZC5iYjwv
YT7CoCDCoCDCoCB8wqAgwqAgwqAxIC08YnI+DQrCoC4uLi9wYWNrYWdlZ3JvdXBzLzxhIGhyZWY9
Imh0dHA6Ly9wYWNrYWdlZ3JvdXAtY29yZS1sc2IuYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPnBhY2thZ2Vncm91cDx3YnI+LWNvcmUtbHNiLmJiPC9hPsKgIMKgIMKgIMKgIMKg
fMKgIMKgIMKgMSAtPGJyPg0KwqAxMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMjIw
OTkgZGVsZXRpb25zKC0pPGJyPg0KwqBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWJz
cC9scnpzei9scnpzei08d2JyPjAuMTIuMjAvYWNkZWZpbmUucGF0Y2g8YnI+DQrCoGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtYnNwL2xyenN6L2xyenN6LTx3YnI+MC4xMi4yMC9hdXRv
dG9vbHMucGF0Y2g8YnI+DQrCoGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtYnNwL2xy
enN6L2xyenN6LTx3YnI+MC4xMi4yMC9nZXR0ZXh0LnBhdGNoPGJyPg0KwqBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWJzcC9scnpzei9scnpzei08d2JyPjAuMTIuMjAvbHJ6c3otY2hl
Y2stbG9jYWxlLmguPHdicj5wYXRjaDxicj4NCsKgZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVj
aXBlcy1ic3AvbHJ6c3ovbHJ6c3otPHdicj4wLjEyLjIwL2xyenN6X2ZpeF9mb3JfPHdicj5hdXRv
bWFrZS0xLjEyLnBhdGNoPGJyPg0KwqBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWJz
cC9scnpzei9scnpzei08d2JyPjAuMTIuMjAvbWFrZWZpbGUucGF0Y2g8YnI+DQrCoGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtYnNwL2xyenN6LzxhIGhyZWY9Imh0dHA6Ly9scnpzel8w
LjEyLjIwLmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5scnpzel88d2JyPjAu
MTIuMjAuYmI8L2E+PGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL21ldGEvY29uZi9kaXN0cm8vaW5j
bHVkZS88d2JyPm1haW50YWluZXJzLmluYyBiL21ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS88d2Jy
Pm1haW50YWluZXJzLmluYzxicj4NCmluZGV4IDg1NmE2Yjc2M2JmLi5jNWNhYjZjZWUzMSAxMDA2
NDQ8YnI+DQotLS0gYS9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvPHdicj5tYWludGFpbmVycy5p
bmM8YnI+DQorKysgYi9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvPHdicj5tYWludGFpbmVycy5p
bmM8YnI+DQpAQCAtNDYwLDcgKzQ2MCw2IEBAIFJFQ0lQRV9NQUlOVEFJTkVSX3BuLWxpbnV4LTx3
YnI+eW9jdG8tcnQgPSAmcXVvdDtCcnVjZSBBc2hmaWVsZCAmbHQ7YnJ1Y2UuYXNoZmllbGRAd2lu
ZHJpdmVyLjxicj4NCsKgUkVDSVBFX01BSU5UQUlORVJfcG4tbGludXgtPHdicj55b2N0by10aW55
ID0gJnF1b3Q7QnJ1Y2UgQXNoZmllbGQgJmx0OzxhIGhyZWY9Im1haWx0bzpicnVjZS5hc2hmaWVs
ZEB3aW5kcml2ZXIuY29tIj5icnVjZS5hc2hmaWVsZEB3aW5kcml2ZXIuY29tPC9hPiZndDs8d2Jy
PiZxdW90Ozxicj4NCsKgUkVDSVBFX01BSU5UQUlORVJfcG4tbGx2bSA9ICZxdW90O0toZW0gUmFq
ICZsdDs8YSBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj5yYWoua2hlbUBnbWFpbC5j
b208L2E+Jmd0OyZxdW90Ozxicj4NCsKgUkVDSVBFX01BSU5UQUlORVJfcG4tbG9ncm90YXRlID0g
JnF1b3Q7Um9iZXJ0IFlhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzpsaWV6aGkueWFuZ0B3aW5kcml2
ZXIuY29tIj5saWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPC9hPiZndDsmcXVvdDs8YnI+DQotUkVD
SVBFX01BSU5UQUlORVJfcG4tbHJ6c3ogPSAmcXVvdDtNYXhpbiBCLiBKb2huICZsdDs8YSBocmVm
PSJtYWlsdG86bWF4aW4uam9obkBpbnRlbC5jb20iPm1heGluLmpvaG5AaW50ZWwuY29tPC9hPiZn
dDsmcXVvdDs8YnI+DQrCoFJFQ0lQRV9NQUlOVEFJTkVSX3BuLWxzYiA9ICZxdW90O0hvbmd4dSBK
aWEgJmx0OzxhIGhyZWY9Im1haWx0bzpob25neHUuamlhQHdpbmRyaXZlci5jb20iPmhvbmd4dS5q
aWFAd2luZHJpdmVyLmNvbTwvYT4mZ3Q7JnF1b3Q7PGJyPg0KwqBSRUNJUEVfTUFJTlRBSU5FUl9w
bi08d2JyPmxzYmluaXRzY3JpcHRzID0gJnF1b3Q7Um9zcyBCdXJ0b24gJmx0OzxhIGhyZWY9Im1h
aWx0bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb20iPnJvc3MuYnVydG9uQGludGVsLmNvbTwvYT4mZ3Q7
JnF1b3Q7PGJyPg0KwqBSRUNJUEVfTUFJTlRBSU5FUl9wbi1sc2J0ZXN0ID0gJnF1b3Q7WWkgWmhh
byAmbHQ7PGEgaHJlZj0ibWFpbHRvOnlpLnpoYW9Ad2luZHJpdmVyLmNvbSI+eWkuemhhb0B3aW5k
cml2ZXIuY29tPC9hPiZndDsmcXVvdDs8YnI+DQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWJz
cC9scnpzei88d2JyPmxyenN6LTAuMTIuMjAvYWNkZWZpbmUucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
YnNwL2xyenN6Lzx3YnI+bHJ6c3otMC4xMi4yMC9hY2RlZmluZS5wYXRjaDxicj4NCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NDxicj4NCmluZGV4IDY4MmNmNDE2ZTIyLi4wMDAwMDAwMDAwMDxicj4N
Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvbHJ6c3ovPHdicj5scnpzei0wLjEyLjIwL2FjZGVmaW5l
LnBhdGNoPGJyPg0KKysrIC9kZXYvbnVsbDxicj4NCkBAIC0xLDE5ICswLDAgQEA8YnI+DQotQWRk
IGEgZGVzY3JpcHRpb24gdG8gdGhlIEFDX0RFRklORSBmb3IgTE9DQUxFRElSIHNvIHRoYXQgaXQg
YXBwZWFycyBpbiBjb25maWcuaDxicj4NCi1hbmQgc2lsZW5jZXMgYSBmYXRhbCB3YXJuaW5nLjxi
cj4NCi08YnI+DQotVXBzdHJlYW0tU3RhdHVzOlBlbmRpbmc8YnI+DQotU2lnbmVkLW9mZi1ieTog
Um9zcyBCdXJ0b24gJmx0OzxhIGhyZWY9Im1haWx0bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb20iPnJv
c3MuYnVydG9uQGludGVsLmNvbTwvYT4mZ3Q7PGJyPg0KLTxicj4NCi1kaWZmIC0tZ2l0IGEvPGEg
aHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+Y29uZmlndXJlLmluPC9hPiBiLzxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuaW4iIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmNvbmZpZ3VyZS5pbjwvYT48YnI+DQotaW5kZXgg
YzEwNDYwYy4uYWEyMDI2MyAxMDA2NDQ8YnI+DQotLS0tIGEvPGEgaHJlZj0iaHR0cDovL2NvbmZp
Z3VyZS5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+Y29uZmlndXJlLmluPC9h
Pjxicj4NCi0rKysgYi88YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmluIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5jb25maWd1cmUuaW48L2E+PGJyPg0KLUBAIC0yNTgsNyArMjU4
LDcgQEAgQUNfU1VCU1QoTElCUyk8YnI+DQotPGJyPg0KLSBBTV9HTlVfR0VUVEVYVDxicj4NCi08
YnI+DQotLUFDX0RFRklORV9VTlFVT1RFRCg8d2JyPkxPQ0FMRURJUiwmcXVvdDskcHJlZml4LyQ8
d2JyPkRBVEFESVJOQU1FJnF1b3Q7KTxicj4NCi0rQUNfREVGSU5FX1VOUVVPVEVEKDx3YnI+TE9D
QUxFRElSLCZxdW90OyRwcmVmaXgvJDx3YnI+REFUQURJUk5BTUUmcXVvdDssW2xvY2FsZSBkaXJl
Y3RvcnldKTxicj4NCi08YnI+DQotIEFDX09VVFBVVChbTWFrZWZpbGUgaW50bC9NYWtlZmlsZSBs
aWIvTWFrZWZpbGUgdGVzdHN1aXRlL01ha2VmaWxlwqAgbTQvTWFrZWZpbGUgXDxicj4NCi0gbWFu
L01ha2VmaWxlIHBvL01ha2VmaWxlLmluIHNyYy9NYWtlZmlsZSBkZWJpYW4vcnVsZXMgU3BlY2Zp
bGUgc3lzdHlwZSBcPGJyPg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvbHJ6c3ovPHdi
cj5scnpzei0wLjEyLjIwL2F1dG90b29scy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ic3AvbHJ6c3ov
PHdicj5scnpzei0wLjEyLjIwL2F1dG90b29scy5wYXRjaDxicj4NCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NDxicj4NCmluZGV4IDM5NDUxOTg1NWUxLi4wMDAwMDAwMDAwMDxicj4NCi0tLSBhL21l
dGEvcmVjaXBlcy1ic3AvbHJ6c3ovPHdicj5scnpzei0wLjEyLjIwL2F1dG90b29scy5wYXRjaDxi
cj4NCisrKyAvZGV2L251bGw8YnI+DQpAQCAtMSwzOSArMCwwIEBAPGJyPg0KLVVwc3RyZWFtLVN0
YXR1czogSW5hcHByb3ByaWF0ZSBbY29uZmlndXJhdGlvbl08YnI+DQotPGJyPg0KLS0tLSBscnpz
ei0wLjEyLjIwL2FjaW5jbHVkZS5tNH48d2JyPmF1dG90b29sc8KgIMKgIMKgIMKgMTk5OC0xMi0y
NyAxNzowODo1OS4wMDAwMDAwMDAgLTA1MDA8YnI+DQotKysrIGxyenN6LTAuMTIuMjAvYWNpbmNs
dWRlLm00IDIwMDQtMDUtMDkgMjI6MjY6MTkuMDAwMDAwMDAwIC0wNDAwPGJyPg0KLUBAIC0xLDEy
ICsxLDExIEBAPGJyPg0KLSBkbmwgQUNfUkVQTEFDRV9HTlVfR0VUT1BUPGJyPg0KLS1BQ19ERUZV
TihBQ19SRVBMQUNFX0dOVV88d2JyPkdFVE9QVCw8YnI+DQotLVtBQ19DSEVDS19GVU5DKGdldG9w
dF9sb25nLCAsIFtMSUJPQkpTPSZxdW90OyRMSUJPQkpTIGdldG9wdDEubyBnZXRvcHQubyZxdW90
O10pPGJyPg0KLS1BQ19TVUJTVChMSUJPQkpTKWRubDxicj4NCi0tXSk8YnI+DQotK0FDX0RFRlVO
KFtBQ19SRVBMQUNFX0dOVV88d2JyPkdFVE9QVF0sPGJyPg0KLStbQUNfQ0hFQ0tfRlVOQyhnZXRv
cHRfbG9uZywgLCBbQUNfTElCT0JKKFtnZXRvcHQxXSk8YnI+DQotK0FDX0xJQk9CSihbZ2V0b3B0
XSlkbmxdKV0pPGJyPg0KLTxicj4NCi0gZG5sPGJyPg0KLSBkbmwgdGFrZW4gZnJvbSB0YXlsb3Ig
dXVjcDxicj4NCi0tQUNfREVGVU4oTFJaU1pfRVJSTk9fREVDTCxbPGJyPg0KLStBQ19ERUZVTihb
TFJaU1pfRVJSTk9fREVDTF0sPHdicj5bPGJyPg0KLSBBQ19NU0dfQ0hFQ0tJTkcoZm9yIGVycm5v
IGRlY2xhcmF0aW9uKTxicj4NCi0gQUNfQ0FDSEVfVkFMKGxyenN6X2N2X2RlY2xfPHdicj5lcnJu
byw8YnI+DQotIFtBQ19UUllfQ09NUElMRShbI2luY2x1ZGUgJmx0O2Vycm5vLmgmZ3Q7XSwgW2lu
dCBpID0gZXJybm87IGVycm5vID0gMTtdLDxicj4NCi1AQCAtMjMsNyArMjEsNyBAQDxicj4NCi0g
XSk8YnI+DQotPGJyPg0KLSBkbmwgTFJaU1pfVFlQRV9TUEVFRF9UPGJyPg0KLS1BQ19ERUZVTihM
UlpTWl9UWVBFX1NQRUVEX1QsPHdicj5bPGJyPg0KLStBQ19ERUZVTihbTFJaU1pfVFlQRV9TUEVF
RF88d2JyPlRdLFs8YnI+DQotIEFDX1JFUVVJUkUoW0FDX0hFQURFUl9TVERDXSk8d2JyPmRubDxi
cj4NCi0gQUNfUkVRVUlSRShbTFJaU1pfSEVBREVSU188d2JyPlRFUk1fSU9dKWRubDxicj4NCi0g
QUNfTVNHX0NIRUNLSU5HKGZvciBzcGVlZF90KTxicj4NCi1AQCAtNjEsNyArNTksNyBAQDxicj4N
Ci0gZmk8YnI+DQotIF0pPGJyPg0KLTxicj4NCi0tQUNfREVGVU4obHJ6c3pfSEVBREVSX1NZU188
d2JyPlNFTEVDVCw8YnI+DQotK0FDX0RFRlVOKFtscnpzel9IRUFERVJfU1lTXzx3YnI+U0VMRUNU
XSw8YnI+DQotIFtBQ19DQUNIRV9DSEVDSyhbd2hldGhlciBzeXMvdGltZS5oIGFuZCBzeXMvc2Vs
ZWN0LmggbWF5IGJvdGggYmUgaW5jbHVkZWRdLDxicj4NCi3CoCDCoGxyenN6X2N2X2hlYWRlcl9z
eXNfc2VsZWN0LDxicj4NCi0gW0FDX1RSWV9DT01QSUxFKFsjaW5jbHVkZSAmbHQ7c3lzL3R5cGVz
LmgmZ3Q7PGJyPg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvbHJ6c3ovPHdicj5scnpz
ei0wLjEyLjIwL2dldHRleHQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtYnNwL2xyenN6Lzx3YnI+bHJ6
c3otMC4xMi4yMC9nZXR0ZXh0LnBhdGNoPGJyPg0KZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0PGJy
Pg0KaW5kZXggMWEyNGExZjA1ZTcuLjAwMDAwMDAwMDAwPGJyPg0KLS0tIGEvbWV0YS9yZWNpcGVz
LWJzcC9scnpzei88d2JyPmxyenN6LTAuMTIuMjAvZ2V0dGV4dC5wYXRjaDxicj4NCisrKyAvZGV2
L251bGw8YnI+DQpAQCAtMSwyMTg4NCArMCwwIEBAPGJyPg0KLVVwc3RyZWFtLVN0YXR1czogSW5h
cHByb3ByaWF0ZSBbY29uZmlndXJhdGlvbl08YnI+DQotPGJyPg0KLS0tLSBscnpzei0wLjEyLjIw
LnNhZmUvQUJPVVQtTkxTwqAgwqAgwqAgwqAxOTk4LTA0LTI2IDA5OjIyOjMwLjAwMDAwMDAwMCAt
MDQwMDxicj4NCi0rKysgbHJ6c3otMC4xMi4yMC9BQk9VVC1OTFPCoCDCoCAyMDA0LTA5LTEyIDE0
OjQwOjM0LjMyMzc1Mjk1MiAtMDQwMDxicj4NCi1AQCAtMSwxNCArMSwxNCBAQDxicj4NCi0gTm90
ZXMgb24gdGhlIEZyZWUgVHJhbnNsYXRpb24gUHJvamVjdDxicj4NCi0gKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqPHdicj4qKioqKioqPGJyPg0KLTxicj4NCi0twqAgwqBGcmVlIHNvZnR3
YXJlIGlzIGdvaW5nIGludGVybmF0aW9uYWwhwqAgVGhlIEZyZWUgVHJhbnNsYXRpb24gUHJvamVj
dDxicj4NCi0taXMgYSB3YXkgdG8gZ2V0IG1haW50YWluZXJzIG9mIGZyZWUgc29mdHdhcmUsIHRy
YW5zbGF0b3JzLCBhbmQgdXNlcnMgYWxsPGJyPg0KLStGcmVlIHNvZnR3YXJlIGlzIGdvaW5nIGlu
dGVybmF0aW9uYWwhwqAgVGhlIEZyZWUgVHJhbnNsYXRpb24gUHJvamVjdCBpczxicj4NCi0rYSB3
YXkgdG8gZ2V0IG1haW50YWluZXJzIG9mIGZyZWUgc29mdHdhcmUsIHRyYW5zbGF0b3JzLCBhbmQg
dXNlcnMgYWxsPGJyPg0KLSB0b2dldGhlciwgc28gdGhhdCB3aWxsIGdyYWR1YWxseSBiZWNvbWUg
YWJsZSB0byBzcGVhayBtYW55IGxhbmd1YWdlcy48YnI+DQotIEEgZmV3IHBhY2thZ2VzIGFscmVh
ZHkgcHJvdmlkZSB0cmFuc2xhdGlvbnMgZm9yIHRoZWlyIG1lc3NhZ2VzLjxicj4NCi08YnI+DQot
wqAgwqAgSWYgeW91IGZvdW5kIHRoaXMgYEFCT1VULU5MUyYjMzk7IGZpbGUgaW5zaWRlIGEgZGlz
dHJpYnV0aW9uLCB5b3UgbWF5PGJyPg0KLSBhc3N1bWUgdGhhdCB0aGUgZGlzdHJpYnV0ZWQgcGFj
a2FnZSBkb2VzIHVzZSBHTlUgYGdldHRleHQmIzM5OyBpbnRlcm5hbGx5LDxicj4NCi0taXRzZWxm
IGF2YWlsYWJsZSBhdCB5b3VyIG5lYXJlc3QgR05VIGFyY2hpdmUgc2l0ZS7CoCBCdXQgeW91IGRv
ICpub3QqPGJyPg0KLStpdHNlbGYgYXZhaWxhYmxlIGF0IHlvdXIgbmVhcmVzdCBHTlUgYXJjaGl2
ZSBzaXRlLsKgIEJ1dCB5b3UgZG8gX25vdF88YnI+DQotIG5lZWQgdG8gaW5zdGFsbCBHTlUgYGdl
dHRleHQmIzM5OyBwcmlvciB0byBjb25maWd1cmluZywgaW5zdGFsbGluZyBvciB1c2luZzxicj4N
Ci0gdGhpcyBwYWNrYWdlIHdpdGggbWVzc2FnZXMgdHJhbnNsYXRlZC48YnI+DQotPGJyPg0KLUBA
IC0yMiwxMCArMjIsMTAgQEA8YnI+DQotIGBnZXR0ZXh0JiMzOTsgd2hpY2ggaXMgdXNlZC7CoCBU
aGUgaW5mb3JtYXRpb24gY2FuIGJlIGZvdW5kIGluIHRoZTxicj4NCi0gYGludGwvVkVSU0lPTiYj
Mzk7IGZpbGUsIGluIGludGVybmF0aW9uYWxpemVkIHBhY2thZ2VzLjxicj4NCi08YnI+DQotLU9u
ZSBhZHZpc2UgaW4gYWR2YW5jZTxicj4NCi0tPT09PT09PT09PT09PT09PT09PT09PGJyPg0KLStR
dWljayBjb25maWd1cmF0aW9uIGFkdmljZTxicj4NCi0rPT09PT09PT09PT09PT09PT09PT09PT09
PT08YnI+DQotPGJyPg0KLS3CoCDCoElmIHlvdSB3YW50IHRvIGV4cGxvaXQgdGhlIGZ1bGwgcG93
ZXIgb2YgaW50ZXJuYXRpb25hbGl6YXRpb24sIHlvdTxicj4NCi0rSWYgeW91IHdhbnQgdG8gZXhw
bG9pdCB0aGUgZnVsbCBwb3dlciBvZiBpbnRlcm5hdGlvbmFsaXphdGlvbiwgeW91PGJyPg0KLSBz
aG91bGQgY29uZmlndXJlIGl0IHVzaW5nPGJyPg0KLTxicj4NCi3CoCDCoCDCoCAuL2NvbmZpZ3Vy
ZSAtLXdpdGgtaW5jbHVkZWQtZ2V0dGV4dDxicj4NCi1AQCAtMzQsNDIgKzM0LDQwIEBAPGJyPg0K
LSBwYWNrYWdlLCBkZXNwaXRlIHRoZSBleGlzdGVuY2Ugb2YgaW50ZXJuYXRpb25hbGl6aW5nIGNh
cGFiaWxpdGllcyBpbiB0aGU8YnI+DQotIG9wZXJhdGluZyBzeXN0ZW0gd2hlcmUgdGhpcyBwYWNr
YWdlIGlzIGJlaW5nIGluc3RhbGxlZC7CoCBTbyBmYXIsIG9ubHk8YnI+DQotIHRoZSBgZ2V0dGV4
dCYjMzk7IGltcGxlbWVudGF0aW9uIGluIHRoZSBHTlUgQyBsaWJyYXJ5IHZlcnNpb24gMiBwcm92
aWRlcyBhczxicj4NCi0tbWFueSBmZWF0dXJlcyAoc3VjaCBhcyBsb2NhbGUgYWxpYXMgb3IgbWVz
c2FnZSBpbmhlcml0YW5jZSkgYXMgdGhlPGJyPg0KLS1pbXBsZW1lbnRhdGlvbiBoZXJlLsKgIEl0
IGlzIGFsc28gbm90IHBvc3NpYmxlIHRvIG9mZmVyIHRoaXMgYWRkaXRpb25hbDxicj4NCi0tZnVu
Y3Rpb25hbGl0eSBvbiB0b3Agb2YgYSBgY2F0Z2V0cyYjMzk7IGltcGxlbWVudGF0aW9uLsKgIEZ1
dHVyZSB2ZXJzaW9ucyBvZjxicj4NCi0tR05VIGBnZXR0ZXh0JiMzOTsgd2lsbCB2ZXJ5IGxpa2Vs
eSBjb252ZXkgZXZlbiBtb3JlIGZ1bmN0aW9uYWxpdHkuwqAgU28gaXQ8YnI+DQotLW1pZ2h0IGJl
IGEgZ29vZCBpZGVhIHRvIGNoYW5nZSB0byBHTlUgYGdldHRleHQmIzM5OyBhcyBzb29uIGFzIHBv
c3NpYmxlLjxicj4NCi0rbWFueSBmZWF0dXJlcyAoc3VjaCBhcyBsb2NhbGUgYWxpYXMsIG1lc3Nh
Z2UgaW5oZXJpdGFuY2UsIGF1dG9tYXRpYzxicj4NCi0rY2hhcnNldCBjb252ZXJzaW9uIG9yIHBs
dXJhbCBmb3JtIGhhbmRsaW5nKSBhcyB0aGUgaW1wbGVtZW50YXRpb24gaGVyZS48YnI+DQotK0l0
IGlzIGFsc28gbm90IHBvc3NpYmxlIHRvIG9mZmVyIHRoaXMgYWRkaXRpb25hbCBmdW5jdGlvbmFs
aXR5IG9uIHRvcDxicj4NCi0rb2YgYSBgY2F0Z2V0cyYjMzk7IGltcGxlbWVudGF0aW9uLsKgIEZ1
dHVyZSB2ZXJzaW9ucyBvZiBHTlUgYGdldHRleHQmIzM5OyB3aWxsPGJyPg0KLSt2ZXJ5IGxpa2Vs
eSBjb252ZXkgZXZlbiBtb3JlIGZ1bmN0aW9uYWxpdHkuwqAgU28gaXQgbWlnaHQgYmUgYSBnb29k
IGlkZWE8YnI+DQotK3RvIGNoYW5nZSB0byBHTlUgYGdldHRleHQmIzM5OyBhcyBzb29uIGFzIHBv
c3NpYmxlLjxicj4NCi08YnI+DQotLcKgIMKgU28geW91IG5lZWQgbm90IHByb3ZpZGUgdGhpcyBv
cHRpb24gaWYgeW91IGFyZSB1c2luZyBHTlUgbGliYyAyIG9yPGJyPg0KLSvCoCDCoFNvIHlvdSBu
ZWVkIF9ub3RfIHByb3ZpZGUgdGhpcyBvcHRpb24gaWYgeW91IGFyZSB1c2luZyBHTlUgbGliYyAy
IG9yPGJyPg0KLSB5b3UgaGF2ZSBpbnN0YWxsZWQgYSByZWNlbnQgY29weSBvZiB0aGUgR05VIGdl
dHRleHQgcGFja2FnZSB3aXRoIHRoZTxicj4NCi0gaW5jbHVkZWQgYGxpYmludGwmIzM5Oy48YnI+
DQotPGJyPg0KLSBJTlNUQUxMIE1hdHRlcnM8YnI+DQotID09PT09PT09PT09PT09PTxicj4NCi08
YnI+DQotLcKgIMKgU29tZSBwYWNrYWdlcyBhcmUgJnF1b3Q7bG9jYWxpemFibGUmcXVvdDsgd2hl
biBwcm9wZXJseSBpbnN0YWxsZWQ7IHRoZTxicj4NCi0tcHJvZ3JhbXMgdGhleSBjb250YWluIGNh
biBiZSBtYWRlIHRvIHNwZWFrIHlvdXIgb3duIG5hdGl2ZSBsYW5ndWFnZS48YnI+DQotLU1vc3Qg
c3VjaCBwYWNrYWdlcyB1c2UgR05VIGBnZXR0ZXh0JiMzOTsuwqAgT3RoZXIgcGFja2FnZXMgaGF2
ZSB0aGVpciBvd248YnI+DQotLXdheXMgdG8gaW50ZXJuYXRpb25hbGl6YXRpb24sIHByZWRhdGlu
ZyBHTlUgYGdldHRleHQmIzM5Oy48YnI+DQotK1NvbWUgcGFja2FnZXMgYXJlICZxdW90O2xvY2Fs
aXphYmxlJnF1b3Q7IHdoZW4gcHJvcGVybHkgaW5zdGFsbGVkOyB0aGUgcHJvZ3JhbXM8YnI+DQot
K3RoZXkgY29udGFpbiBjYW4gYmUgbWFkZSB0byBzcGVhayB5b3VyIG93biBuYXRpdmUgbGFuZ3Vh
Z2UuwqAgTW9zdCBzdWNoPGJyPg0KLStwYWNrYWdlcyB1c2UgR05VIGBnZXR0ZXh0JiMzOTsuwqAg
T3RoZXIgcGFja2FnZXMgaGF2ZSB0aGVpciBvd24gd2F5cyB0bzxicj4NCi0raW50ZXJuYXRpb25h
bGl6YXRpb24sIHByZWRhdGluZyBHTlUgYGdldHRleHQmIzM5Oy48YnI+DQotPGJyPg0KLcKgIMKg
IEJ5IGRlZmF1bHQsIHRoaXMgcGFja2FnZSB3aWxsIGJlIGluc3RhbGxlZCB0byBhbGxvdyB0cmFu
c2xhdGlvbiBvZjxicj4NCi0tbWVzc2FnZXMuwqAgSXQgd2lsbCBhdXRvbWF0aWNhbGx5IGRldGVj
dCB3aGV0aGVyIHRoZSBzeXN0ZW0gcHJvdmlkZXM8YnI+DQotLXVzYWJsZSBgY2F0Z2V0cyYjMzk7
IChpZiB1c2luZyB0aGlzIGlzIHNlbGVjdGVkIGJ5IHRoZSBpbnN0YWxsZXIpIG9yPGJyPg0KLS1g
Z2V0dGV4dCYjMzk7IGZ1bmN0aW9ucy7CoCBJZiBuZWl0aGVyIGlzIGF2YWlsYWJsZSwgdGhlIEdO
VSBgZ2V0dGV4dCYjMzk7IG93bjxicj4NCi0rbWVzc2FnZXMuwqAgSXQgd2lsbCBhdXRvbWF0aWNh
bGx5IGRldGVjdCB3aGV0aGVyIHRoZSBzeXN0ZW0gYWxyZWFkeTxicj4NCi0rcHJvdmlkZXMgdGhl
IEdOVSBgZ2V0dGV4dCYjMzk7IGZ1bmN0aW9ucy7CoCBJZiBub3QsIHRoZSBHTlUgYGdldHRleHQm
IzM5OyBvd248YnI+DQotIGxpYnJhcnkgd2lsbCBiZSB1c2VkLsKgIFRoaXMgbGlicmFyeSBpcyB3
aG9sbHkgY29udGFpbmVkIHdpdGhpbiB0aGlzPGJyPg0KLSBwYWNrYWdlLCB1c3VhbGx5IGluIHRo
ZSBgaW50bC8mIzM5OyBzdWJkaXJlY3RvcnksIHNvIHByaW9yIGluc3RhbGxhdGlvbiBvZjxicj4N
Ci0tdGhlIEdOVSBgZ2V0dGV4dCYjMzk7IHBhY2thZ2UgaXMgKm5vdCogcmVxdWlyZWQuwqAgSW5z
dGFsbGVycyBtYXkgdXNlPGJyPg0KLSt0aGUgR05VIGBnZXR0ZXh0JiMzOTsgcGFja2FnZSBpcyBf
bm90XyByZXF1aXJlZC7CoCBJbnN0YWxsZXJzIG1heSB1c2U8YnI+DQotIHNwZWNpYWwgb3B0aW9u
cyBhdCBjb25maWd1cmF0aW9uIHRpbWUgZm9yIGNoYW5naW5nIHRoZSBkZWZhdWx0PGJyPg0KLSBi
ZWhhdmlvdXIuwqAgVGhlIGNvbW1hbmRzOjxicj4NCi08YnI+DQotwqAgwqAgwqAgLi9jb25maWd1
cmUgLS13aXRoLWluY2x1ZGVkLWdldHRleHQ8YnI+DQotLcKgIMKgIMKgLi9jb25maWd1cmUgLS13
aXRoLWNhdGdldHM8YnI+DQotwqAgwqAgwqAgLi9jb25maWd1cmUgLS1kaXNhYmxlLW5sczxicj4N
Ci08YnI+DQotLXdpbGwgcmVzcGVjdGl2ZWx5IGJ5cGFzcyBhbnkgcHJlLWV4aXN0aW5nIGBjYXRn
ZXRzJiMzOTsgb3IgYGdldHRleHQmIzM5OyB0byB1c2U8YnI+DQotLXRoZSBpbnRlcm5hdGlvbmFs
aXppbmcgcm91dGluZXMgcHJvdmlkZWQgd2l0aGluIHRoaXMgcGFja2FnZSwgZW5hYmxlPGJyPg0K
LS10aGUgdXNlIG9mIHRoZSBgY2F0Z2V0cyYjMzk7IGZ1bmN0aW9ucyAoaWYgZm91bmQgb24gdGhl
IGxvY2FsZSBzeXN0ZW0pLCBvcjxicj4NCi0tZWxzZSwgKnRvdGFsbHkqIGRpc2FibGUgdHJhbnNs
YXRpb24gb2YgbWVzc2FnZXMuPGJyPg0KLSt3aWxsIHJlc3BlY3RpdmVseSBieXBhc3MgYW55IHBy
ZS1leGlzdGluZyBgZ2V0dGV4dCYjMzk7IHRvIHVzZSB0aGU8YnI+DQotK2ludGVybmF0aW9uYWxp
emluZyByb3V0aW5lcyBwcm92aWRlZCB3aXRoaW4gdGhpcyBwYWNrYWdlLCBvciBlbHNlLDxicj4N
Ci0rX3RvdGFsbHlfIGRpc2FibGUgdHJhbnNsYXRpb24gb2YgbWVzc2FnZXMuPGJyPg0KLTxicj4N
Ci3CoCDCoCBXaGVuIHlvdSBhbHJlYWR5IGhhdmUgR05VIGBnZXR0ZXh0JiMzOTsgaW5zdGFsbGVk
IG9uIHlvdXIgc3lzdGVtIGFuZCBydW48YnI+DQotIGNvbmZpZ3VyZSB3aXRob3V0IGFuIG9wdGlv
biBmb3IgeW91ciBuZXcgcGFja2FnZSwgYGNvbmZpZ3VyZSYjMzk7IHdpbGw8YnI+DQotQEAgLTgz
LDE4ICs4MSwxMCBAQDxicj4NCi08YnI+DQotIHRvIHByZXZlbnQgYXV0by1kZXRlY3Rpb24uPGJy
Pg0KLTxicj4NCi0twqAgwqBCeSBkZWZhdWx0IHRoZSBjb25maWd1cmF0aW9uIHByb2Nlc3Mgd2ls
bCBub3QgdGVzdCBmb3IgdGhlIGBjYXRnZXRzJiMzOTs8YnI+DQotLWZ1bmN0aW9uIGFuZCB0aGVy
ZWZvcmUgdGhleSB3aWxsIG5vdCBiZSB1c2VkLsKgIFRoZSByZWFzb25zIGFyZSBhbHJlYWR5PGJy
Pg0KLS1naXZlbiBhYm92ZTogdGhlIGVtdWxhdGlvbiBvbiB0b3Agb2YgYGNhdGdldHMmIzM5OyBj
YW5ub3QgcHJvdmlkZSBhbGwgdGhlPGJyPg0KLS1leHRlbnNpb25zIHByb3ZpZGVkIGJ5IHRoZSBH
TlUgYGdldHRleHQmIzM5OyBsaWJyYXJ5LsKgIElmIHlvdSBuZXZlcnRoZWxlc3M8YnI+DQotLXdh
bnQgdG8gdXNlIHRoZSBgY2F0Z2V0cyYjMzk7IGZ1bmN0aW9ucyB1c2U8YnI+DQotLTxicj4NCi0t
wqAgwqAgwqAuL2NvbmZpZ3VyZSAtLXdpdGgtY2F0Z2V0czxicj4NCi0tPGJyPg0KLS10byBlbmFi
bGUgdGhlIHRlc3QgZm9yIGBjYXRnZXRzJiMzOTsgKHRoaXMgY2F1c2VzIG5vIGhhcm0gaWYgYGNh
dGdldHMmIzM5OyBpczxicj4NCi0tbm90IGF2YWlsYWJsZSBvbiB5b3VyIHN5c3RlbSkuwqAgSWYg
eW91IHJlYWxseSBzZWxlY3QgdGhpcyBvcHRpb24gd2U8YnI+DQotLXdvdWxkIGxpa2UgdG8gaGVh
ciBhYm91dCB0aGUgcmVhc29ucyBiZWNhdXNlIHdlIGNhbm5vdCB0aGluayBvZiBhbnk8YnI+DQot
LWdvb2Qgb25lIG91cnNlbGYuPGJyPg0KLSvCoCDCoFRoZSBjb25maWd1cmF0aW9uIHByb2Nlc3Mg
d2lsbCBub3QgdGVzdCBmb3IgdGhlIGBjYXRnZXRzJiMzOTsgZnVuY3Rpb248YnI+DQotK2FuZCB0
aGVyZWZvcmUgaXQgd2lsbCBub3QgYmUgdXNlZC7CoCBUaGUgcmVhc29uIGlzIHRoYXQgZXZlbiBh
bjxicj4NCi0rZW11bGF0aW9uIG9mIGBnZXR0ZXh0JiMzOTsgb24gdG9wIG9mIGBjYXRnZXRzJiMz
OTsgY291bGQgbm90IHByb3ZpZGUgYWxsIHRoZTxicj4NCi0rZXh0ZW5zaW9ucyBvZiB0aGUgR05V
IGBnZXR0ZXh0JiMzOTsgbGlicmFyeS48YnI+DQotPGJyPg0KLcKgIMKgIEludGVybmF0aW9uYWxp
emVkIHBhY2thZ2VzIGhhdmUgdXN1YWxseSBtYW55IGBwby9MTC5wbyYjMzk7IGZpbGVzLCB3aGVy
ZTxicj4NCi0gTEwgZ2l2ZXMgYW4gSVNPIDYzOSB0d28tbGV0dGVyIGNvZGUgaWRlbnRpZnlpbmcg
dGhlIGxhbmd1YWdlLsKgIFVubGVzczxicj4NCi1AQCAtMTA4LDU3ICs5OCw3MyBAQDxicj4NCi0g
VXNpbmcgVGhpcyBQYWNrYWdlPGJyPg0KLSA9PT09PT09PT09PT09PT09PT08YnI+DQotPGJyPg0K
LS3CoCDCoEFzIGEgdXNlciwgaWYgeW91ciBsYW5ndWFnZSBoYXMgYmVlbiBpbnN0YWxsZWQgZm9y
IHRoaXMgcGFja2FnZSwgeW91PGJyPg0KLStBcyBhIHVzZXIsIGlmIHlvdXIgbGFuZ3VhZ2UgaGFz
IGJlZW4gaW5zdGFsbGVkIGZvciB0aGlzIHBhY2thZ2UsIHlvdTxicj4NCi0gb25seSBoYXZlIHRv
IHNldCB0aGUgYExBTkcmIzM5OyBlbnZpcm9ubWVudCB2YXJpYWJsZSB0byB0aGUgYXBwcm9wcmlh
dGU8YnI+DQotLUlTTyA2MzkgYExMJiMzOTsgdHdvLWxldHRlciBjb2RlIHByaW9yIHRvIHVzaW5n
IHRoZSBwcm9ncmFtcyBpbiB0aGU8YnI+DQotLXBhY2thZ2UuwqAgRm9yIGV4YW1wbGUsIGxldCYj
Mzk7cyBzdXBwb3NlIHRoYXQgeW91IHNwZWFrIEdlcm1hbi7CoCBBdCB0aGU8YnI+DQotLXNoZWxs
IHByb21wdCwgbWVyZWx5IGV4ZWN1dGUgYHNldGVudiBMQU5HIGRlJiMzOTsgKGluIGBjc2gmIzM5
OyksPGJyPg0KLS1gZXhwb3J0IExBTkc7IExBTkc9ZGUmIzM5OyAoaW4gYHNoJiMzOTspIG9yIGBl
eHBvcnQgTEFORz1kZSYjMzk7IChpbiBgYmFzaCYjMzk7KS7CoCBUaGlzPGJyPg0KLS1jYW4gYmUg
ZG9uZSBmcm9tIHlvdXIgYC5sb2dpbiYjMzk7IG9yIGAucHJvZmlsZSYjMzk7IGZpbGUsIG9uY2Ug
YW5kIGZvciBhbGwuPGJyPg0KLStgTExfQ0MmIzM5OyBjb21iaW5hdGlvbi7CoCBIZXJlIGBMTCYj
Mzk7IGlzIGFuIElTTyA2MzkgdHdvLWxldHRlciBsYW5ndWFnZSBjb2RlLDxicj4NCi0rYW5kIGBD
QyYjMzk7IGlzIGFuIElTTyAzMTY2IHR3by1sZXR0ZXIgY291bnRyeSBjb2RlLsKgIEZvciBleGFt
cGxlLCBsZXQmIzM5O3M8YnI+DQotK3N1cHBvc2UgdGhhdCB5b3Ugc3BlYWsgR2VybWFuIGFuZCBs
aXZlIGluIEdlcm1hbnkuwqAgQXQgdGhlIHNoZWxsPGJyPg0KLStwcm9tcHQsIG1lcmVseSBleGVj
dXRlIGBzZXRlbnYgTEFORyBkZV9ERSYjMzk7IChpbiBgY3NoJiMzOTspLDxicj4NCi0rYGV4cG9y
dCBMQU5HOyBMQU5HPWRlX0RFJiMzOTsgKGluIGBzaCYjMzk7KSBvciBgZXhwb3J0IExBTkc9ZGVf
REUmIzM5OyAoaW4gYGJhc2gmIzM5OykuPGJyPg0KLStUaGlzIGNhbiBiZSBkb25lIGZyb20geW91
ciBgLmxvZ2luJiMzOTsgb3IgYC5wcm9maWxlJiMzOTsgZmlsZSwgb25jZSBhbmQgZm9yPGJyPg0K
LSthbGwuPGJyPg0KLTxicj4NCi0twqAgwqBBbiBvcGVyYXRpbmcgc3lzdGVtIG1pZ2h0IGFscmVh
ZHkgb2ZmZXIgbWVzc2FnZSBsb2NhbGl6YXRpb24gZm9yPGJyPg0KLS1tYW55IG9mIGl0cyBwcm9n
cmFtcywgd2hpbGUgb3RoZXIgcHJvZ3JhbXMgaGF2ZSBiZWVuIGluc3RhbGxlZCBsb2NhbGx5PGJy
Pg0KLS13aXRoIHRoZSBmdWxsIGNhcGFiaWxpdGllcyBvZiBHTlUgYGdldHRleHQmIzM5Oy7CoCBK
dXN0IHVzaW5nIGBnZXR0ZXh0JiMzOTs8YnI+DQotLWV4dGVuZGVkIHN5bnRheCBmb3IgYExBTkcm
IzM5OyB3b3VsZCBicmVhayBwcm9wZXIgbG9jYWxpemF0aW9uIG9mIGFscmVhZHk8YnI+DQotLWF2
YWlsYWJsZSBvcGVyYXRpbmcgc3lzdGVtIHByb2dyYW1zLsKgIEluIHRoaXMgY2FzZSwgdXNlcnMg
c2hvdWxkIHNldDxicj4NCi0tYm90aCBgTEFOR1VBR0UmIzM5OyBhbmQgYExBTkcmIzM5OyB2YXJp
YWJsZXMgaW4gdGhlaXIgZW52aXJvbm1lbnQsIGFzIHByb2dyYW1zPGJyPg0KLS11c2luZyBHTlUg
YGdldHRleHQmIzM5OyBnaXZlIHByZWZlcmVuY2UgdG8gYExBTkdVQUdFJiMzOTsuwqAgRm9yIGV4
YW1wbGUsIHNvbWU8YnI+DQotLVN3ZWRpc2ggdXNlcnMgd291bGQgcmF0aGVyIHJlYWQgdHJhbnNs
YXRpb25zIGluIEdlcm1hbiB0aGFuIEVuZ2xpc2ggZm9yPGJyPg0KLS13aGVuIFN3ZWRpc2ggaXMg
bm90IGF2YWlsYWJsZS7CoCBUaGlzIGlzIGVhc2lseSBhY2NvbXBsaXNoZWQgYnkgc2V0dGluZzxi
cj4NCi0tYExBTkdVQUdFJiMzOTsgdG8gYHN2OmRlJiMzOTsgd2hpbGUgbGVhdmluZyBgTEFORyYj
Mzk7IHRvIGBzdiYjMzk7Ljxicj4NCi0rwqAgwqBZb3UgbWlnaHQgdGhpbmsgdGhhdCB0aGUgY291
bnRyeSBjb2RlIHNwZWNpZmljYXRpb24gaXMgcmVkdW5kYW50Ljxicj4NCi0rQnV0IGluIGZhY3Qs
IHNvbWUgbGFuZ3VhZ2VzIGhhdmUgZGlhbGVjdHMgaW4gZGlmZmVyZW50IGNvdW50cmllcy7CoCBG
b3I8YnI+DQotK2V4YW1wbGUsIGBkZV9BVCYjMzk7IGlzIHVzZWQgZm9yIEF1c3RyaWEsIGFuZCBg
cHRfQlImIzM5OyBmb3IgQnJhemlsLsKgIFRoZTxicj4NCi0rY291bnRyeSBjb2RlIHNlcnZlcyB0
byBkaXN0aW5ndWlzaCB0aGUgZGlhbGVjdHMuPGJyPg0KLSs8YnI+DQotK8KgIMKgVGhlIGxvY2Fs
ZSBuYW1pbmcgY29udmVudGlvbiBvZiBgTExfQ0MmIzM5Oywgd2l0aCBgTEwmIzM5OyBkZW5vdGlu
ZyB0aGU8YnI+DQotK2xhbmd1YWdlIGFuZCBgQ0MmIzM5OyBkZW5vdGluZyB0aGUgY291bnRyeSwg
aXMgdGhlIG9uZSB1c2Ugb24gc3lzdGVtcyBiYXNlZDxicj4NCi0rb24gR05VIGxpYmMuwqAgT24g
b3RoZXIgc3lzdGVtcywgc29tZSB2YXJpYXRpb25zIG9mIHRoaXMgc2NoZW1lIGFyZTxicj4NCi0r
dXNlZCwgc3VjaCBhcyBgTEwmIzM5OyBvciBgTExfQ0MuRU5DT0RJTkcmIzM5Oy7CoCBZb3UgY2Fu
IGdldCB0aGUgbGlzdCBvZjxicj4NCi0rbG9jYWxlcyBzdXBwb3J0ZWQgYnkgeW91ciBzeXN0ZW0g
Zm9yIHlvdXIgY291bnRyeSBieSBydW5uaW5nIHRoZSBjb21tYW5kPGJyPg0KLStgbG9jYWxlIC1h
IHwgZ3JlcCAmIzM5O15MTCYjMzk7JiMzOTsuPGJyPg0KLSs8YnI+DQotK8KgIMKgTm90IGFsbCBw
cm9ncmFtcyBoYXZlIHRyYW5zbGF0aW9ucyBmb3IgYWxsIGxhbmd1YWdlcy7CoCBCeSBkZWZhdWx0
LCBhbjxicj4NCi0rRW5nbGlzaCBtZXNzYWdlIGlzIHNob3duIGluIHBsYWNlIG9mIGEgbm9uZXhp
c3RlbnQgdHJhbnNsYXRpb24uwqAgSWYgeW91PGJyPg0KLSt1bmRlcnN0YW5kIG90aGVyIGxhbmd1
YWdlcywgeW91IGNhbiBzZXQgdXAgYSBwcmlvcml0eSBsaXN0IG9mIGxhbmd1YWdlcy48YnI+DQot
K1RoaXMgaXMgZG9uZSB0aHJvdWdoIGEgZGlmZmVyZW50IGVudmlyb25tZW50IHZhcmlhYmxlLCBj
YWxsZWQ8YnI+DQotK2BMQU5HVUFHRSYjMzk7LsKgIEdOVSBgZ2V0dGV4dCYjMzk7IGdpdmVzIHBy
ZWZlcmVuY2UgdG8gYExBTkdVQUdFJiMzOTsgb3ZlciBgTEFORyYjMzk7PGJyPg0KLStmb3IgdGhl
IHB1cnBvc2Ugb2YgbWVzc2FnZSBoYW5kbGluZywgYnV0IHlvdSBzdGlsbCBuZWVkIHRvIGhhdmUg
YExBTkcmIzM5Ozxicj4NCi0rc2V0IHRvIHRoZSBwcmltYXJ5IGxhbmd1YWdlOyB0aGlzIGlzIHJl
cXVpcmVkIGJ5IG90aGVyIHBhcnRzIG9mIHRoZTxicj4NCi0rc3lzdGVtIGxpYnJhcmllcy7CoCBG
b3IgZXhhbXBsZSwgc29tZSBTd2VkaXNoIHVzZXJzIHdobyB3b3VsZCByYXRoZXI8YnI+DQotK3Jl
YWQgdHJhbnNsYXRpb25zIGluIEdlcm1hbiB0aGFuIEVuZ2xpc2ggZm9yIHdoZW4gU3dlZGlzaCBp
cyBub3Q8YnI+DQotK2F2YWlsYWJsZSwgc2V0IGBMQU5HVUFHRSYjMzk7IHRvIGBzdjpkZSYjMzk7
IHdoaWxlIGxlYXZpbmcgYExBTkcmIzM5OyB0byBgc3ZfU0UmIzM5Oy48YnI+DQotKzxicj4NCi0r
wqAgwqBTcGVjaWFsIGFkdmljZSBmb3IgTm9yd2VnaWFuIHVzZXJzOiBUaGUgbGFuZ3VhZ2UgY29k
ZSBmb3IgTm9yd2VnaWFuPGJyPg0KLStib2ttYSpsIGNoYW5nZWQgZnJvbSBgbm8mIzM5OyB0byBg
bmImIzM5OyByZWNlbnRseSAoaW4gMjAwMykuwqAgRHVyaW5nIHRoZTxicj4NCi0rdHJhbnNpdGlv
biBwZXJpb2QsIHdoaWxlIHNvbWUgbWVzc2FnZSBjYXRhbG9ncyBmb3IgdGhpcyBsYW5ndWFnZSBh
cmU8YnI+DQotK2luc3RhbGxlZCB1bmRlciBgbmImIzM5OyBhbmQgc29tZSBvbGRlciBvbmVzIHVu
ZGVyIGBubyYjMzk7LCBpdCYjMzk7cyByZWNvbW1lbmRlZDxicj4NCi0rZm9yIE5vcndlZ2lhbiB1
c2VycyB0byBzZXQgYExBTkdVQUdFJiMzOTsgdG8gYG5iOm5vJiMzOTsgc28gdGhhdCBib3RoIG5l
d2VyIGFuZDxicj4NCi0rb2xkZXIgdHJhbnNsYXRpb25zIGFyZSB1c2VkLjxicj4NCi0rPGJyPg0K
LSvCoCDCoEluIHRoZSBgTEFOR1VBR0UmIzM5OyBlbnZpcm9ubWVudCB2YXJpYWJsZSwgYnV0IG5v
dCBpbiB0aGUgYExBTkcmIzM5Ozxicj4NCi0rZW52aXJvbm1lbnQgdmFyaWFibGUsIGBMTF9DQyYj
Mzk7IGNvbWJpbmF0aW9ucyBjYW4gYmUgYWJicmV2aWF0ZWQgYXMgYExMJiMzOTs8YnI+DQotK3Rv
IGRlbm90ZSB0aGUgbGFuZ3VhZ2UmIzM5O3MgbWFpbiBkaWFsZWN0LsKgIEZvciBleGFtcGxlLCBg
ZGUmIzM5OyBpcyBlcXVpdmFsZW50PGJyPg0KLSt0byBgZGVfREUmIzM5OyAoR2VybWFuIGFzIHNw
b2tlbiBpbiBHZXJtYW55KSwgYW5kIGBwdCYjMzk7IHRvIGBwdF9QVCYjMzk7PGJyPg0KLSsoUG9y
dHVndWVzZSBhcyBzcG9rZW4gaW4gUG9ydHVnYWwpIGluIHRoaXMgY29udGV4dC48YnI+DQotPGJy
Pg0KLSBUcmFuc2xhdGluZyBUZWFtczxicj4NCi0gPT09PT09PT09PT09PT09PT08YnI+DQotPGJy
Pg0KLS3CoCDCoEZvciB0aGUgRnJlZSBUcmFuc2xhdGlvbiBQcm9qZWN0IHRvIGJlIGEgc3VjY2Vz
cywgd2UgbmVlZCBpbnRlcmVzdGVkPGJyPg0KLStGb3IgdGhlIEZyZWUgVHJhbnNsYXRpb24gUHJv
amVjdCB0byBiZSBhIHN1Y2Nlc3MsIHdlIG5lZWQgaW50ZXJlc3RlZDxicj4NCi0gcGVvcGxlIHdo
byBsaWtlIHRoZWlyIG93biBsYW5ndWFnZSBhbmQgd3JpdGUgaXQgd2VsbCwgYW5kIHdobyBhcmUg
YWxzbzxicj4NCi0gYWJsZSB0byBzeW5lcmdpemUgd2l0aCBvdGhlciB0cmFuc2xhdG9ycyBzcGVh
a2luZyB0aGUgc2FtZSBsYW5ndWFnZS48YnI+DQotLUVhY2ggdHJhbnNsYXRpb24gdGVhbSBoYXMg
aXRzIG93biBtYWlsaW5nIGxpc3QsIGNvdXJ0ZXN5IG9mIExpbnV4PGJyPg0KLS1JbnRlcm5hdGlv
bmFsLsKgIFlvdSBtYXkgcmVhY2ggeW91ciB0cmFuc2xhdGlvbiB0ZWFtIGF0IHRoZSBhZGRyZXNz
PGJyPg0KLS1gPGEgaHJlZj0ibWFpbHRvOkxMQGxpLm9yZyI+TExAbGkub3JnPC9hPiYjMzk7LCBy
ZXBsYWNpbmcgTEwgYnkgdGhlIHR3by1sZXR0ZXIgSVNPIDYzOSBjb2RlIGZvciB5b3VyPGJyPg0K
LS1sYW5ndWFnZS7CoCBMYW5ndWFnZSBjb2RlcyBhcmUgKm5vdCogdGhlIHNhbWUgYXMgdGhlIGNv
dW50cnkgY29kZXMgZ2l2ZW48YnI+DQotLWluIElTTyAzMTY2LsKgIFRoZSBmb2xsb3dpbmcgdHJh
bnNsYXRpb24gdGVhbXMgZXhpc3QsIGFzIG9mIEF1Z3VzdCAxOTk3Ojxicj4NCi0tPGJyPg0KLS3C
oCDCoCDCoENoaW5lc2UgYHpoJiMzOTssIEN6ZWNoIGBjcyYjMzk7LCBEYW5pc2ggYGRhJiMzOTss
IER1dGNoIGBubCYjMzk7LCBFbmdsaXNoIGBlbiYjMzk7LDxicj4NCi0twqAgwqAgwqBFc3BlcmFu
dG8gYGVvJiMzOTssIEZpbm5pc2ggYGZpJiMzOTssIEZyZW5jaCBgZnImIzM5OywgR2VybWFuIGBk
ZSYjMzk7LCBIdW5nYXJpYW48YnI+DQotLcKgIMKgIMKgYGh1JiMzOTssIElyaXNoIGBnYSYjMzk7
LCBJdGFsaWFuIGBpdCYjMzk7LCBJbmRvbmVzaWFuIGBpZCYjMzk7LCBKYXBhbmVzZSBgamEmIzM5
Oyw8YnI+DQotLcKgIMKgIMKgS29yZWFuIGBrbyYjMzk7LCBMYXRpbiBgbGEmIzM5OywgTm9yd2Vn
aWFuIGBubyYjMzk7LCBQZXJzaWFuIGBmYSYjMzk7LCBQb2xpc2g8YnI+DQotLcKgIMKgIMKgYHBs
JiMzOTssIFBvcnR1Z3Vlc2UgYHB0JiMzOTssIFJ1c3NpYW4gYHJ1JiMzOTssIFNsb3ZlbmlhbiBg
c2wmIzM5OywgU3BhbmlzaCBgZXMmIzM5Oyw8YnI+DQotLcKgIMKgIMKgU3dlZGlzaCBgc3YmIzM5
OywgYW5kIFR1cmtpc2ggYHRyJiMzOTsuPGJyPg0KLS08YnI+DQotLUZvciBleGFtcGxlLCB5b3Ug
bWF5IHJlYWNoIHRoZSBDaGluZXNlIHRyYW5zbGF0aW9uIHRlYW0gYnkgd3JpdGluZyB0bzxicj4N
Ci0tYDxhIGhyZWY9Im1haWx0bzp6aEBsaS5vcmciPnpoQGxpLm9yZzwvYT4mIzM5Oy48YnI+DQot
K0VhY2ggdHJhbnNsYXRpb24gdGVhbSBoYXMgaXRzIG93biBtYWlsaW5nIGxpc3QuwqAgVGhlIHVw
LXRvLWRhdGUgbGlzdCBvZjxicj4NCi0rdGVhbXMgY2FuIGJlIGZvdW5kIGF0IHRoZSBGcmVlIFRy
YW5zbGF0aW9uIFByb2plY3QmIzM5O3MgaG9tZXBhZ2UsPGJyPg0KLStgPGEgaHJlZj0iaHR0cDov
L3d3dy5pcm8udW1vbnRyZWFsLmNhL2NvbnRyaWIvcG8vSFRNTC8iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly93d3cuaXJvLnVtb250cmVhbC48d2JyPmNhL2NvbnRyaWIv
cG8vSFRNTC88L2E+JiMzOTssIGluIHRoZSAmcXVvdDtOYXRpb25hbCB0ZWFtcyZxdW90Ozxicj4N
Ci0rYXJlYS48YnI+DQotPGJyPg0KLS3CoCDCoElmIHlvdSYjMzk7ZCBsaWtlIHRvIHZvbHVudGVl
ciB0byAqd29yayogYXQgdHJhbnNsYXRpbmcgbWVzc2FnZXMsIHlvdTxicj4NCi0rwqAgwqBJZiB5
b3UmIzM5O2QgbGlrZSB0byB2b2x1bnRlZXIgdG8gX3dvcmtfIGF0IHRyYW5zbGF0aW5nIG1lc3Nh
Z2VzLCB5b3U8YnI+DQotIHNob3VsZCBiZWNvbWUgYSBtZW1iZXIgb2YgdGhlIHRyYW5zbGF0aW5n
IHRlYW0gZm9yIHlvdXIgb3duIGxhbmd1YWdlLjxicj4NCi0tVGhlIHN1YnNjcmliaW5nIGFkZHJl
c3MgaXMgKm5vdCogdGhlIHNhbWUgYXMgdGhlIGxpc3QgaXRzZWxmLCBpdCBoYXM8YnI+DQotK1Ro
ZSBzdWJzY3JpYmluZyBhZGRyZXNzIGlzIF9ub3RfIHRoZSBzYW1lIGFzIHRoZSBsaXN0IGl0c2Vs
ZiwgaXQgaGFzPGJyPg0KLSBgLXJlcXVlc3QmIzM5OyBhcHBlbmRlZC7CoCBGb3IgZXhhbXBsZSwg
c3BlYWtlcnMgb2YgU3dlZGlzaCBjYW4gc2VuZCBhPGJyPg0KLSBtZXNzYWdlIHRvIGA8YSBocmVm
PSJtYWlsdG86c3YtcmVxdWVzdEBsaS5vcmciPnN2LXJlcXVlc3RAbGkub3JnPC9hPiYjMzk7LCBo
YXZpbmcgdGhpcyBtZXNzYWdlIGJvZHk6PGJyPg0KLTxicj4NCi3CoCDCoCDCoCBzdWJzY3JpYmU8
YnI+DQotPGJyPg0KLcKgIMKgIEtlZXAgaW4gbWluZCB0aGF0IHRlYW0gbWVtYmVycyBhcmUgZXhw
ZWN0ZWQgdG8gcGFydGljaXBhdGU8YnI+DQotLSphY3RpdmVseSogaW4gdHJhbnNsYXRpb25zLCBv
ciBhdCBzb2x2aW5nIHRyYW5zbGF0aW9uYWwgZGlmZmljdWx0aWVzLDxicj4NCi0rX2FjdGl2ZWx5
XyBpbiB0cmFuc2xhdGlvbnMsIG9yIGF0IHNvbHZpbmcgdHJhbnNsYXRpb25hbCBkaWZmaWN1bHRp
ZXMsPGJyPg0KLSByYXRoZXIgdGhhbiBtZXJlbHkgbHVya2luZyBhcm91bmQuwqAgSWYgeW91ciB0
ZWFtIGRvZXMgbm90IGV4aXN0IHlldCBhbmQ8YnI+DQotIHlvdSB3YW50IHRvIHN0YXJ0IG9uZSwg
b3IgaWYgeW91IGFyZSB1bnN1cmUgYWJvdXQgd2hhdCB0byBkbyBvciBob3cgdG88YnI+DQotIGdl
dCBzdGFydGVkLCBwbGVhc2Ugd3JpdGUgdG8gYDxhIGhyZWY9Im1haWx0bzp0cmFuc2xhdGlvbkBp
cm8udW1vbnRyZWFsLmNhIj50cmFuc2xhdGlvbkBpcm8udW1vbnRyZWFsLmNhPC9hPiYjMzk7IHRv
IHJlYWNoIHRoZTxicj4NCi1AQCAtMTcxLDQzICsxNzcsNTU5IEBAPGJyPg0KLSBBdmFpbGFibGUg
UGFja2FnZXM8YnI+DQotID09PT09PT09PT09PT09PT09PTxicj4NCi08YnI+DQotLcKgIMKgTGFu
Z3VhZ2VzIGFyZSBub3QgZXF1YWxseSBzdXBwb3J0ZWQgaW4gYWxsIHBhY2thZ2VzLsKgIFRoZSBm
b2xsb3dpbmc8YnI+DQotLW1hdHJpeCBzaG93cyB0aGUgY3VycmVudCBzdGF0ZSBvZiBpbnRlcm5h
dGlvbmFsaXphdGlvbiwgYXMgb2YgQXVndXN0PGJyPg0KLS0xOTk3LsKgIFRoZSBtYXRyaXggc2hv
d3MsIGluIHJlZ2FyZCBvZiBlYWNoIHBhY2thZ2UsIGZvciB3aGljaCBsYW5ndWFnZXM8YnI+DQot
LVBPIGZpbGVzIGhhdmUgYmVlbiBzdWJtaXR0ZWQgdG8gdHJhbnNsYXRpb24gY29vcmRpbmF0aW9u
Ljxicj4NCi0rTGFuZ3VhZ2VzIGFyZSBub3QgZXF1YWxseSBzdXBwb3J0ZWQgaW4gYWxsIHBhY2th
Z2VzLsKgIFRoZSBmb2xsb3dpbmc8YnI+DQotK21hdHJpeCBzaG93cyB0aGUgY3VycmVudCBzdGF0
ZSBvZiBpbnRlcm5hdGlvbmFsaXphdGlvbiwgYXMgb2YgSmFudWFyeTxicj4NCi0rMjAwNC7CoCBU
aGUgbWF0cml4IHNob3dzLCBpbiByZWdhcmQgb2YgZWFjaCBwYWNrYWdlLCBmb3Igd2hpY2ggbGFu
Z3VhZ2VzPGJyPg0KLStQTyBmaWxlcyBoYXZlIGJlZW4gc3VibWl0dGVkIHRvIHRyYW5zbGF0aW9u
IGNvb3JkaW5hdGlvbiwgd2l0aCBhPGJyPg0KLSt0cmFuc2xhdGlvbiBwZXJjZW50YWdlIG9mIGF0
IGxlYXN0IDUwJS48YnI+DQotPGJyPg0KLS3CoCDCoCDCoFJlYWR5IFBPIGZpbGVzwqAgwqAgY3Mg
ZGEgZGUgZW4gZXMgZmkgZnIgaXQgamEga28gbmwgbm8gcGwgcHQgc2wgc3Y8YnI+DQotLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
PHdicj4tLS0tLS0tLS0tLS0tLS0tLS0tLS48YnI+DQotLcKgIMKgIMKgYmFzaMKgIMKgIMKgIMKg
IMKgIMKgIHzCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCBbXcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCAzPGJyPg0KLS3CoCDCoCDCoGJpc29uwqAgwqAgwqAg
wqAgwqAgwqB8wqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgW13C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgMzxicj4NCi0twqAgwqAgwqBjbGlzcMKgIMKgIMKg
IMKgIMKgIMKgfMKgIMKgIMKgIMKgW10gW10gW13CoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCA0PGJyPg0KLS3CoCDCoCDCoGNwaW/CoCDCoCDCoCDC
oCDCoCDCoCB8wqAgwqAgwqAgwqBbXcKgIMKgIFtdwqAgwqAgW13CoCDCoCDCoCDCoCDCoCBbXcKg
IMKgIFtdwqAgwqAgwqAgwqAgwqAgfMKgIDU8YnI+DQotLcKgIMKgIMKgZGlmZnV0aWxzwqAgwqAg
wqAgwqB8wqAgwqAgwqAgwqBbXcKgIMKgIFtdwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBbXcKgIMKgIMKgIMKgW10gfMKgIDU8YnI+DQotLcKgIMKgIMKgZW5zY3JpcHTCoCDCoCDCoCDC
oCB8wqAgwqAgwqAgwqBbXcKgIMKgIFtdIFtdIFtdwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDC
oCDCoCBbXcKgIMKgIHzCoCA2PGJyPg0KLS3CoCDCoCDCoGZpbGV1dGlsc8KgIMKgIMKgIMKgfCBb
XcKgIMKgIFtdwqAgwqAgW13CoCDCoCBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCBbXSBbXSBbXSBb
XSB8IDEwPGJyPg0KLS3CoCDCoCDCoGZpbmR1dGlsc8KgIMKgIMKgIMKgfMKgIMKgIMKgIMKgW13C
oCDCoCBbXcKgIMKgIFtdIFtdwqAgwqAgW10gW13CoCDCoCBbXcKgIMKgIMKgIMKgW10gfMKgIDg8
YnI+DQotLcKgIMKgIMKgZmxleMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDC
oFtdwqAgwqAgW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gfMKgIDQ8
YnI+DQotLcKgIMKgIMKgZ2NhbMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoFtdwqAgwqAg
wqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCBbXcKgIMKgIFtdwqAgwqAgwqAgwqBbXSB8wqAgNTxi
cj4NCi0twqAgwqAgwqBnZXR0ZXh0wqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqBbXcKgIMKgIFtd
wqAgwqAgW13CoCDCoCDCoCDCoFtdIFtdIFtdIFtdIFtdIFtdIFtdIHwgMTE8YnI+DQotLcKgIMKg
IMKgZ3JlcMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoFtdwqAgwqAgW13CoCDCoCBbXcKg
IMKgIMKgIMKgW10gW10gW10gW13CoCDCoCBbXSBbXSB8wqAgOTxicj4NCi0twqAgwqAgwqBoZWxs
b8KgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgW13CoCDCoCBbXcKgIMKgIFtdwqAgwqAgwqAg
wqBbXSBbXSBbXSBbXSBbXSBbXSBbXSB8IDEwPGJyPg0KLS3CoCDCoCDCoGlkLXV0aWxzwqAgwqAg
wqAgwqAgfMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIFtdwqAgwqAgwqAgwqAgwqAgfMKgIDM8YnI+DQotLcKgIMKgIMKgaW5kZW50wqAgwqAgwqAg
wqAgwqAgfMKgIMKgIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKg
IMKgW13CoCDCoCDCoCDCoCDCoCB8wqAgNDxicj4NCi0twqAgwqAgwqBsaWJjwqAgwqAgwqAgwqAg
wqAgwqAgfMKgIMKgIMKgIMKgW13CoCDCoCBbXcKgIMKgIFtdwqAgwqAgwqAgwqBbXSBbXcKgIMKg
IFtdwqAgwqAgwqAgwqBbXSB8wqAgNzxicj4NCi0twqAgwqAgwqBtNMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHzCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgW13CoCDCoCBbXcKgIMKgIFtdwqAgwqAg
wqAgwqAgwqAgwqAgwqBbXSB8wqAgNTxicj4NCi0twqAgwqAgwqBtYWtlwqAgwqAgwqAgwqAgwqAg
wqAgfMKgIMKgIMKgIMKgW13CoCDCoCBbXcKgIMKgIFtdwqAgwqAgwqAgwqBbXSBbXcKgIMKgIFtd
wqAgwqAgwqAgwqAgwqAgfMKgIDY8YnI+DQotLcKgIMKgIMKgbXVzaWPCoCDCoCDCoCDCoCDCoCDC
oHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
W13CoCDCoCDCoCDCoCDCoCB8wqAgMjxicj4NCi0twqAgwqAgwqBwdHjCoCDCoCDCoCDCoCDCoCDC
oCDCoHzCoCDCoCDCoCDCoFtdwqAgwqAgW13CoCDCoCBbXcKgIMKgIMKgIMKgIMKgIFtdIFtdIFtd
IFtdwqAgwqAgW10gfMKgIDg8YnI+DQotLcKgIMKgIMKgcmVjb2RlwqAgwqAgwqAgwqAgwqAgfMKg
IMKgIFtdIFtdwqAgwqAgW13CoCDCoCBbXcKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgW10gW10gW10g
W10gfMKgIDk8YnI+DQotLcKgIMKgIMKgc2gtdXRpbHPCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqBb
XcKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgW10gW10gW10gW13CoCDCoCBbXSB8wqAg
Nzxicj4NCi0twqAgwqAgwqBzaGFydXRpbHPCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoFtdwqAgwqAg
W13CoCDCoCBbXcKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSB8wqAgNTxi
cj4NCi0twqAgwqAgwqB0YXLCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoFtdwqAgwqAg
wqAgwqAgwqAgW10gW13CoCDCoCBbXSBbXSBbXSBbXSBbXSBbXSBbXSB8IDEwPGJyPg0KLS3CoCDC
oCDCoHRleGluZm/CoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtd
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDE8YnI+DQotLcKg
IMKgIMKgdGV4dHV0aWxzwqAgwqAgwqAgwqB8IFtdwqAgwqAgW13CoCDCoCBbXcKgIMKgIFtdwqAg
wqAgwqAgwqBbXSBbXSBbXSBbXcKgIMKgIMKgIMKgW10gfMKgIDk8YnI+DQotLcKgIMKgIMKgd2Rp
ZmbCoCDCoCDCoCDCoCDCoCDCoHwgW13CoCDCoCBbXcKgIMKgIFtdwqAgwqAgW13CoCDCoCDCoCDC
oCDCoCBbXSBbXSBbXcKgIMKgIMKgIMKgW10gfMKgIDg8YnI+DQotLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgYC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPHdicj4tLS0tLS0t
LS0tLS0tLS0tLS0tLSYjMzk7PGJyPg0KLS3CoCDCoCDCoCDCoDE2IGxhbmd1YWdlc8KgIMKgIGNz
IGRhIGRlIGVuIGVzIGZpIGZyIGl0IGphIGtvIG5sIG5vIHBsIHB0IHNsIHN2PGJyPg0KLS3CoCDC
oCDCoCDCoDI3IHBhY2thZ2VzwqAgwqAgwqAgM8KgIDIgMjTCoCAxIDE3wqAgMSAyNsKgIDLCoCAx
IDExIDIwwqAgOSAxOcKgIDfCoCA3IDE3wqAgMTY3PGJyPg0KLSvCoCDCoCDCoFJlYWR5IFBPIGZp
bGVzwqAgwqAgwqAgwqBhZiBhbSBhciBheiBiZSBiZyBicyBjYSBjcyBkYSBkZSBlbCBlbiBlbl9H
QiBlbyBlczxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPHdicj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSs8YnI+
DQotK8KgIMKgIMKgYTJwc8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKg
IMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoFtdIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fDxicj4NCi0rwqAgwqAgwqBhZWdpc8KgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgpwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGFudC1waG9uZcKgIMKgIMKgIMKgIMKgIHzCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgpwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGFudWJpc8KgIMKgIMKgIMKgIMKgIMKgIMKg
fMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+DQotK8KgIMKgIMKgYXAtdXRpbHPCoCDCoCDCoCDC
oCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoGFzcGVsbMKgIMKg
IMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgYmFz
aMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW10gW10gfDxicj4NCi0rwqAgwqAg
wqBiYXRjaGVsb3LCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0r
wqAgwqAgwqBiZmTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdIHw8
YnI+DQotK8KgIMKgIMKgYmludXRpbHPCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
W10gfDxicj4NCi0rwqAgwqAgwqBiaXNvbsKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIFtdIHw8YnI+DQotK8KgIMKgIMKgYmx1ZXotcGluwqAgwqAgwqAgwqAgwqAgfCBbXcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBbXcKgIMKgIHw8YnI+DQotK8KgIMKgIMKgY2xpc3DCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBjbGlzcMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAg
wqAgW13CoCDCoCDCoCDCoCDCoCBbXSB8PGJyPg0KLSvCoCDCoCDCoGNvbnNvbGUtdG9vbHPCoCDC
oCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIFtdwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGNvcmV1dGlsc8KgIMKg
IMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIFtdIFtd
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gfDxicj4NCi0rwqAgwqAgwqBjcGlvwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
W10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXSB8PGJyPg0KLSvCoCDCoCDCoGRhcmtzdGF0
wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDC
oCAoKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW10gfDxicj4NCi0rwqAgwqAgwqBkaWZm
dXRpbHPCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10g
W10gW10gW10gW13CoCDCoCDCoCDCoCDCoCBbXSBbXSB8PGJyPg0KLSvCoCDCoCDCoGUyZnNwcm9n
c8KgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtd
wqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXSB8PGJyPg0KLSvCoCDCoCDCoGVuc2Ny
aXB0wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13C
oCDCoCBbXSBbXcKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGVy
cm9ywqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoCBbXcKgIMKgIMKgIFtdIHw8YnI+DQotK8KgIMKgIMKg
ZmV0Y2htYWlswqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IFtdICgpIFtdIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSB8PGJyPg0KLSvCoCDCoCDCoGZp
bGV1dGlsc8KgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdIHw8YnI+DQotK8KgIMKgIMKg
ZmluZHV0aWxzwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDC
oFtdwqAgwqAgW10gW10gW13CoCDCoCDCoCDCoCDCoCBbXSBbXSB8PGJyPg0KLSvCoCDCoCDCoGZs
ZXjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBbXcKgIMKgIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gfDxicj4NCi0rwqAgwqAg
wqBmc2xpbnTCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0K
LSvCoCDCoCDCoGdhc8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtd
IHw8YnI+DQotK8KgIMKgIMKgZ2F3a8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBbXSB8PGJyPg0KLSvCoCDCoCDCoGdiaWZmwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgZ2NhbMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBnY2PCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdIHw8YnI+DQotK8KgIMKgIMKgZ2V0dGV4dMKgIMKg
IMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqBbXcKgIMKgIFtd
IFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gfDxicj4NCi0rwqAgwqAgwqBnZXR0ZXh0LWV4
YW1wbGVzwqAgwqB8IFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKg
W13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXSB8PGJyPg0KLSvCoCDCoCDCoGdldHRleHQtcnVu
dGltZcKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqBbXcKgIMKgIFtdIFtd
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gfDxicj4NCi0rwqAgwqAgwqBnZXR0ZXh0LXRvb2xz
wqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqBb
XcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdIHw8YnI+DQotK8KgIMKgIMKgZ2ltcC1wcmludMKg
IMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW10gW10g
W13CoCDCoCDCoCDCoCBbXcKgIMKgIMKgIFtdIHw8YnI+DQotK8KgIMKgIMKgZ2xpdsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+DQotK8KgIMKgIMKgZ2x1
bmFyY2xvY2vCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKg
Z251YmlmZsKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvC
oCDCoCDCoGdudWNhc2jCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBbXcKgIMKgICgpwqAgwqAgwqAgwqAgW13CoCDCoCDCoCBbXSB8PGJyPg0K
LSvCoCDCoCDCoGdudWNhc2gtZ2xvc3NhcnnCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBbXSAoKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdIHw8YnI+DQot
K8KgIMKgIMKgZ251cGfCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgW10gKCnCoCDCoCBbXSBbXcKgIMKgIMKgIMKgIMKgIFtdIFtdIHw8YnI+DQot
K8KgIMKgIMKgZ3BlLWFlcmlhbMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8
YnI+DQotK8KgIMKgIMKgZ3BlLWJlYW3CoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHw8YnI+DQotK8KgIMKgIMKgZ3BlLWNhbGVuZGFywqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGdwZS1jbG9ja8KgIMKgIMKgIMKgIMKgIHzCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgZ3BlLWNvbmbCoCDCoCDCoCDCoCDCoCDCoHzC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgW13CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgZ3BlLWNvbnRhY3RzwqAgwqAgwqAg
wqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIFtdwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGdwZS1lZGl0wqAgwqAgwqAg
wqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBncGUtZ2/CoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtd
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGdw
ZS1sb2dpbsKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoFtdwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKg
IMKgZ3BlLW93bmVyaW5mb8KgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoFtdwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8Kg
IMKgIMKgZ3BlLXNrZXRjaGJvb2vCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoFtdwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQot
K8KgIMKgIMKgZ3BlLXN1wqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
PGJyPg0KLSvCoCDCoCDCoGdwZS10YXNrbWFuYWdlcsKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHw8YnI+DQotK8KgIMKgIMKgZ3BlLXRpbWVzaGVldMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB8PGJyPg0KLSvCoCDCoCDCoGdwZS10b2RhecKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgZ3BlLXRvZG/CoCDCoCDCoCDCoCDCoCDCoHzCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgW13CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgZ3Bob3RvMsKgIMKgIMKgIMKgIMKgIMKg
IHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdIFtdIFtdwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgW10gfDxicj4NCi0rwqAgwqAgwqBncHJvZsKgIMKgIMKgIMKgIMKgIMKg
IMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXSBbXcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIFtdIHw8YnI+DQotK8KgIMKgIMKgZ3BzZHJpdmXCoCDCoCDCoCDC
oCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgp
wqAgwqAgKCnCoCDCoCDCoCDCoCDCoCAoKSB8PGJyPg0KLSvCoCDCoCDCoGdyYW1hZG9pcsKgIMKg
IMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGdyZXDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdIFtdwqAgwqAgW13CoCDC
oCDCoCDCoFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSB8PGJyPg0KLSvCoCDCoCDCoGdyZXRs
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW10gfDxicj4NCi0rwqAgwqAg
wqBndGlja8KgIMKgIMKgIMKgIMKgIMKgIMKgIHwgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAoKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0r
wqAgwqAgwqBoZWxsb8KgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBbXcKgIMKgIFtdIFtdIFtdwqAgwqAgwqAgwqAgwqAgW10gW10gfDxicj4NCi0r
wqAgwqAgwqBpZC11dGlsc8KgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJy
Pg0KLSvCoCDCoCDCoGluZGVudMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW10gW10g
fDxicj4NCi0rwqAgwqAgwqBpc29fMzE2NsKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKg
IFtdwqAgwqAgW10gW10gW10gW10gW10gW10gW13CoCDCoCDCoCDCoCDCoCBbXSBbXSB8PGJyPg0K
LSvCoCDCoCDCoGlzb18zMTY2XzHCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBbXSBbXSBbXSBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW10gfDxicj4NCi0r
wqAgwqAgwqBpc29fMzE2Nl8ywqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxi
cj4NCi0rwqAgwqAgwqBpc29fMzE2Nl8zwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfDxicj4NCi0rwqAgwqAgwqBpc29fNDIxN8KgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBbXSB8PGJyPg0KLSvCoCDCoCDCoGlzb182MznCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBqcGlsb3TCoCDCoCDCoCDCoCDCoCDCoCDCoHzC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdIFtdwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBbXSB8PGJyPg0KLSvCoCDCoCDCoGp0YWfCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoGp3aG9pc8KgIMKgIMKg
IMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW10gfDxicj4NCi0rwqAgwqAgwqBrYmTCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBbXSBbXSBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW10gfDxicj4NCi0rwqAgwqAgwqBsYXRy
aW5lwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgKCnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKg
IMKgbGTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW10gfDxicj4N
Ci0rwqAgwqAgwqBsaWJjwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgW10gW10gW10gW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoFtdIHw8YnI+
DQotK8KgIMKgIMKgbGliZ3Bld2lkZ2V0wqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
PGJyPg0KLSvCoCDCoCDCoGxpYmljb252wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW10gW10g
fDxicj4NCi0rwqAgwqAgwqBsaWZlbGluZXPCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gKCnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHw8YnI+DQotK8KgIMKgIMKgbGlseXBvbmTCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGxpbmdvdGVhY2jCoCDCoCDCoCDCoCDCoHzCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoGxpbmdvdGVhY2hfbGVzc29ucyB8wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoKcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgICgpIHw8YnI+DQotK8KgIMKgIMKgbHlueMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdIFtdIFtdIFtdwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoG00wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSBbXSBbXSBb
XcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+DQotK8KgIMKgIMKgbWFpbHV0aWxzwqAgwqAg
wqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSB8PGJyPg0KLSvCoCDCoCDCoG1ha2XCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdIHw8YnI+DQotK8KgIMKgIMKgbWFuLWRi
wqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10g
KCkgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoKSB8PGJyPg0KLSvCoCDCoCDCoG1pbmlj
b23CoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBbXcKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gfDxicj4NCi0rwqAgwqAgwqBt
eXNlY3JldGRpYXJ5wqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gfDxicj4NCi0rwqAgwqAgwqBu
YW5vwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgW10gKCkgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXSB8PGJyPg0KLSvCoCDCoCDC
oG5hbm9fMV8wwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgW10gKCkgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXSB8PGJyPg0KLSvCoCDCoCDC
oG9wY29kZXPCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSB8PGJyPg0KLSvC
oCDCoCDCoHBhcnRlZMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIFtdIFtdIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gfDxicj4NCi0r
wqAgwqAgwqBwdHjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgW13CoCDCoCBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW10gW10gfDxicj4N
Ci0rwqAgwqAgwqBweXRob27CoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCB8PGJyPg0KLSvCoCDCoCDCoHJhZGl1c8KgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgW10gfDxicj4NCi0rwqAgwqAgwqByZWNvZGXCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDC
oCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqBbXcKgIMKgIFtdIFtdIFtdwqAgwqAgwqAgwqAg
wqAgW10gW10gfDxicj4NCi0rwqAgwqAgwqBycG3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSBbXcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHw8YnI+DQotK8KgIMKgIMKgc2NyZWVtwqAgwqAgwqAgwqAgwqAgwqAg
wqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBzY3JvbGxrZWVwZXLCoCDC
oCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqBbXSBbXSBbXSBbXcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIFtdIHw8YnI+DQotK8KgIMKgIMKgc2VkwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgfCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCBbXSBbXcKg
IMKgIMKgIMKgIMKgIMKgIMKgW10gW10gfDxicj4NCi0rwqAgwqAgwqBzaC11dGlsc8KgIMKgIMKg
IMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdIFtd
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gfDxicj4NCi0rwqAgwqAgwqBzaGFyZWQtbWltZS1p
bmZvwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBzaGFydXRpbHPC
oCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gW10gW10g
W10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoFtdIHw8YnI+DQotK8KgIMKgIMKgc2lsa3nCoCDCoCDC
oCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAoKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBza2Vu
Y2lswqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFtdICgpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gfDxicj4NCi0rwqAgwqAgwqBz
a2V0Y2jCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBbXSAoKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdIHw8YnI+DQotK8KgIMKg
IMKgc291bmR0cmFja2VywqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXSB8PGJyPg0KLSvCoCDC
oCDCoHNwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxi
cj4NCi0rwqAgwqAgwqB0YXLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtd
IHw8YnI+DQotK8KgIMKgIMKgdGV4aW5mb8KgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW13C
oCDCoCB8PGJyPg0KLSvCoCDCoCDCoHRleHR1dGlsc8KgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgW10gfDxicj4NCi0rwqAgwqAgwqB0aW7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoKcKgIMKgIMKgIMKgICgp
wqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoHRwLXJvYm90wqAgwqAgwqAgwqAgwqAgwqB8
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqB0dXhwYWludMKgIMKgIMKgIMKg
IMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdIFtdIFtdIFtdIFtdwqAg
wqAgwqBbXcKgIMKgIMKgIFtdIHw8YnI+DQotK8KgIMKgIMKgdW5pY29kZS1oYW4tdHJhLi4uIHzC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoHVuaWNvZGUtdHJhbnNsYS4uLiB8
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqB1dGlsLWxpbnV4wqAgwqAgwqAg
wqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gW10gW10gW13CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBbXSB8PGJyPg0KLSvCoCDCoCDCoHZvcmJpcy10b29sc8KgIMKgIMKg
IMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCBbXSBbXcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgW10gfDxicj4NCi0rwqAgwqAgwqB3YXN0ZXNlZGdlwqAgwqAgwqAg
wqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoKcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqB3ZGlmZsKgIMKgIMKg
IMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIFtd
IFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gfDxicj4NCi0rwqAgwqAgwqB3Z2V0wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCBbXcKgIMKg
IFtdIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSB8PGJyPg0KLSvCoCDCoCDCoHhjaGF0wqAg
wqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAg
wqAgwqAgwqBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW10gfDxicj4NCi0rwqAgwqAgwqB4ZnJl
ZTg2X3hrYl94bWzCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBb
XSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+DQotK8KgIMKgIMKgeHBh
ZMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW10gfDxicj4NCi0rwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tPHdicj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSs8YnI+DQotK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFmIGFtIGFyIGF6IGJlIGJnIGJzIGNhIGNzIGRhIGRl
IGVsIGVuIGVuX0dCIGVvIGVzPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoDTCoCAwwqAgMMKgIDHCoCA5wqAgNMKgIDEgNDAgNDEgNjAgNzggMTfCoCAxwqAg
wqA1wqAgwqAxMyA2ODxicj4NCi0rPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBldCBldSBmYSBmaSBmciBnYSBnbCBoZSBociBodSBpZCBpcyBpdCBqYSBrbyBs
Zzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tPHdicj4tLS0tLS0tLS0tLS0tLS0tLS0tLSs8YnI+DQotK8KgIMKg
IMKgYTJwc8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoKcKgIMKgICgpwqAgwqAgfDxicj4NCi0rwqAgwqAg
wqBhZWdpc8KgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8Kg
IMKgIMKgYW50LXBob25lwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvC
oCDCoCDCoGFudWJpc8KgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0K
LSvCoCDCoCDCoGFwLXV0aWxzwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqBb
XcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+
DQotK8KgIMKgIMKgYXNwZWxswqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAg
wqBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxi
cj4NCi0rwqAgwqAgwqBiYXNowqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAg
wqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHw8YnI+DQotK8KgIMKgIMKgYmF0Y2hlbG9ywqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKg
IMKgIMKgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHw8YnI+DQotK8KgIMKgIMKgYmZkwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKg
IMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB8PGJyPg0KLSvCoCDCoCDCoGJpbnV0aWxzwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAg
wqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDC
oCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgYmlzb27CoCDCoCDCoCDCoCDCoCDCoCDCoCB8IFtdwqAg
wqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIFtdwqAgwqAgwqAg
wqAgwqAgfDxicj4NCi0rwqAgwqAgwqBibHVlei1waW7CoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAg
wqAgwqAgW10gW10gW13CoCDCoCDCoCDCoCDCoCBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHw8YnI+DQotK8KgIMKgIMKgY2xpc3DCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB8PGJyPg0KLSvCoCDCoCDCoGNsaXNwwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKg
IMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoGNvbnNvbGUtdG9vbHPCoCDCoCDCoCB8wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGNvcmV1dGlsc8KgIMKgIMKgIMKgIMKgIHwgW13CoCDC
oCDCoCDCoFtdIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSBbXcKgIMKgIMKg
IMKgfDxicj4NCi0rwqAgwqAgwqBjcGlvwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAg
wqAgwqAgwqAgwqBbXcKgIMKgIFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW13C
oCDCoCB8PGJyPg0KLSvCoCDCoCDCoGRhcmtzdGF0wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAg
wqAgwqAgwqAgwqAoKSBbXcKgIMKgIMKgIMKgIMKgIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfDxicj4NCi0rwqAgwqAgwqBkaWZmdXRpbHPCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAg
wqAgW10gW13CoCDCoCBbXSBbXcKgIMKgIFtdIFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgfDxi
cj4NCi0rwqAgwqAgwqBlMmZzcHJvZ3PCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
PGJyPg0KLSvCoCDCoCDCoGVuc2NyaXB0wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAg
wqAgwqBbXcKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fDxicj4NCi0rwqAgwqAgwqBlcnJvcsKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDC
oCBbXSBbXSBbXcKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
PGJyPg0KLSvCoCDCoCDCoGZldGNobWFpbMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKg
fDxicj4NCi0rwqAgwqAgwqBmaWxldXRpbHPCoCDCoCDCoCDCoCDCoCB8IFtdwqAgwqAgwqAgwqAg
wqAgW10gW13CoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoHw8YnI+
DQotK8KgIMKgIMKgZmluZHV0aWxzwqAgwqAgwqAgwqAgwqAgfCBbXcKgIMKgIMKgIMKgW10gW10g
W10gW13CoCDCoCBbXSBbXSBbXcKgIMKgIFtdIFtdIFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBm
bGV4wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqBbXSBbXcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCB8PGJyPg0KLSvCoCDCoCDC
oGZzbGludMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDC
oCDCoGdhc8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0r
wqAgwqAgwqBnYXdrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqBb
XcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgfDxicj4N
Ci0rwqAgwqAgwqBnYmlmZsKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDC
oFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxi
cj4NCi0rwqAgwqAgwqBnY2FswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAg
wqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHw8YnI+DQotK8KgIMKgIMKgZ2NjwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKg
IMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB8PGJyPg0KLSvCoCDCoCDCoGdldHRleHTCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAg
wqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW10gW13C
oCDCoCB8PGJyPg0KLSvCoCDCoCDCoGdldHRleHQtZXhhbXBsZXPCoCDCoHzCoCDCoCDCoCDCoCDC
oCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKg
IMKgfDxicj4NCi0rwqAgwqAgwqBnZXR0ZXh0LXJ1bnRpbWXCoCDCoCB8wqAgwqAgwqAgwqAgwqAg
W10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCB8PGJy
Pg0KLSvCoCDCoCDCoGdldHRleHQtdG9vbHPCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqBb
XcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW10gW13CoCDCoCB8PGJyPg0K
LSvCoCDCoCDCoGdpbXAtcHJpbnTCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtd
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgfDxicj4N
Ci0rwqAgwqAgwqBnbGl2wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAg
wqAoKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHw8
YnI+DQotK8KgIMKgIMKgZ2x1bmFyY2xvY2vCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgW13C
oCDCoCBbXSBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+
DQotK8KgIMKgIMKgZ251YmlmZsKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDC
oFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxi
cj4NCi0rwqAgwqAgwqBnbnVjYXNowqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKg
IMKgKCnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIHw8
YnI+DQotK8KgIMKgIMKgZ251Y2FzaC1nbG9zc2FyecKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCB8PGJy
Pg0KLSvCoCDCoCDCoGdudXBnwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCBbXcKgIMKgIMKgIMKgW10g
W13CoCDCoCBbXcKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoHw8YnI+DQot
K8KgIMKgIMKgZ3BlLWFlcmlhbMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0K
LSvCoCDCoCDCoGdwZS1iZWFtwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqBb
XcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+
DQotK8KgIMKgIMKgZ3BlLWNhbGVuZGFywqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqBb
XcKgIMKgIMKgIMKgIMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0K
LSvCoCDCoCDCoGdwZS1jbG9ja8KgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtd
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4N
Ci0rwqAgwqAgwqBncGUtY29uZsKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKg
W13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJy
Pg0KLSvCoCDCoCDCoGdwZS1jb250YWN0c8KgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKg
W13CoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJy
Pg0KLSvCoCDCoCDCoGdwZS1lZGl0wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAg
wqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxi
cj4NCi0rwqAgwqAgwqBncGUtZ2/CoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDC
oCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fDxicj4NCi0rwqAgwqAgwqBncGUtbG9naW7CoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAg
wqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHw8YnI+DQotK8KgIMKgIMKgZ3BlLW93bmVyaW5mb8KgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDC
oCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHw8
YnI+DQotK8KgIMKgIMKgZ3BlLXNrZXRjaGJvb2vCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDC
oFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxi
cj4NCi0rwqAgwqAgwqBncGUtc3XCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDC
oCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fDxicj4NCi0rwqAgwqAgwqBncGUtdGFza21hbmFnZXLCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAg
wqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHw8
YnI+DQotK8KgIMKgIMKgZ3BlLXRpbWVzaGVldMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDC
oFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+
DQotK8KgIMKgIMKgZ3BlLXRvZGF5wqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKg
W10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+
DQotK8KgIMKgIMKgZ3BlLXRvZG/CoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDC
oFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJy
Pg0KLSvCoCDCoCDCoGdwaG90bzLCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAg
wqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgfDxi
cj4NCi0rwqAgwqAgwqBncHJvZsKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDC
oCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8
PGJyPg0KLSvCoCDCoCDCoGdwc2RyaXZlwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAg
wqAgwqAoKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICgpICgpwqAgwqAgwqAgwqB8
PGJyPg0KLSvCoCDCoCDCoGdyYW1hZG9pcsKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDC
oCDCoFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
PGJyPg0KLSvCoCDCoCDCoGdyZXDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgW13CoCDCoCDCoCDC
oFtdIFtdIFtdIFtdIFtdIFtdIFtdIFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoHw8YnI+DQotK8Kg
IMKgIMKgZ3JldGzCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0r
wqAgwqAgwqBndGlja8KgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCBbXSBbXSBb
XcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0r
wqAgwqAgwqBoZWxsb8KgIMKgIMKgIMKgIMKgIMKgIMKgIHwgW13CoCDCoCBbXSBbXSBbXSBbXSBb
XSBbXSBbXSBbXSBbXcKgIMKgIFtdIFtdIFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBpZC11dGls
c8KgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDC
oCDCoFtdIFtdwqAgwqAgW13CoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoGluZGVudMKg
IMKgIMKgIMKgIMKgIMKgIMKgfCBbXcKgIMKgIMKgIMKgW10gW10gW10gW13CoCDCoCDCoCDCoFtd
IFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgaXNvXzMxNjbCoCDCoCDC
oCDCoCDCoCDCoHzCoCDCoCBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoFtdIFtdIFtdwqAg
wqAgW13CoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoGlzb18zMTY2XzHCoCDCoCDCoCDC
oCDCoHzCoCDCoCBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoCDCoCBbXSBbXcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHw8YnI+DQotK8KgIMKgIMKgaXNvXzMxNjZfMsKgIMKgIMKgIMKgIMKg
fMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBpc29fMzE2Nl8zwqAgwqAgwqAgwqAg
wqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGlzb180MjE3wqAgwqAgwqAgwqAg
wqAgwqB8IFtdwqAgwqAgwqAgwqAgwqAgW13CoCDCoCBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoCDC
oFtdIFtdwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGlzb182MznCoCDCoCDCoCDCoCDCoCDC
oCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGpwaWxvdMKgIMKgIMKgIMKgIMKg
IMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCgpwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGp0YWfCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBqd2hvaXPCoCDCoCDC
oCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqBb
XSBbXcKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBrYmTCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+DQotK8KgIMKgIMKgbGF0cmluZcKg
IMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBsZMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoGxp
YmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCBbXSBbXcKgIMKgIFtdwqAg
wqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIFtdIFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBsaWJn
cGV3aWRnZXTCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdIFtdwqAgwqAgwqAgwqAg
wqAgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoGxpYmljb252
wqAgwqAgwqAgwqAgwqAgwqB8IFtdwqAgwqAgwqAgwqBbXSBbXSBbXSBbXcKgIMKgIFtdIFtdIFtd
wqAgwqAgW13CoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoGxpZmVsaW5lc8KgIMKgIMKg
IMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCgpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBsaWx5cG9uZMKgIMKgIMKg
IMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoGxpbmdvdGVhY2jCoCDC
oCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
W13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoGxpbmdvdGVhY2hfbGVz
c29ucyB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGx5bnjCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHwgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAg
wqAgwqAgwqBbXSBbXcKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBtNMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCBbXcKgIMKgIMKgIMKgIMKg
IFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBtYWlsdXRpbHPCoCDC
oCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoG1ha2XCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgW10gW10gW13CoCDC
oCDCoCDCoCDCoCDCoCDCoFtdIFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBtYW4tZGLCoCDCoCDC
oCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCgpICgpwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoG1pbmljb23CoCDC
oCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoFtd
wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgbXlzZWNyZXRkaWFy
ecKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
W13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoG5hbm/CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgW13CoCDCoCDCoCDCoCDC
oCBbXcKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBuYW5vXzFfMMKgIMKg
IMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCBbXcKgIMKgIMKgIMKgIMKg
IFtdwqAgwqAgW13CoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoG9wY29kZXPCoCDCoCDC
oCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+DQotK8KgIMKgIMKgcGFydGVkwqAgwqAg
wqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIFtdwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBwdHjCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB8IFtdwqAgwqAgwqAgwqBbXSBbXSBbXSBbXcKgIMKgIMKgIMKgW10g
W13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoHB5dGhvbsKgIMKgIMKg
IMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqByYWRpdXPCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqByZWNvZGXC
oCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgW10gW13CoCDC
oCBbXSBbXcKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBycG3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBzY3JlZW3C
oCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgc2Ny
b2xsa2VlcGVywqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgc2Vk
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCBbXcKgIMKgIMKgIMKgW10gW10gW10gW13CoCDCoCDC
oCDCoFtdIFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgc2gtdXRpbHPC
oCDCoCDCoCDCoCDCoCDCoHwgW13CoCDCoCDCoCDCoFtdIFtdIFtdwqAgwqAgwqAgwqAgwqAgW13C
oCDCoCDCoCDCoFtdIFtdwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoHNoYXJlZC1taW1lLWlu
Zm/CoCDCoHzCoCDCoCDCoCDCoCDCoCBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgc2hhcnV0aWxzwqAgwqAgwqAg
wqAgwqAgfCBbXcKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAg
wqAgwqAgW13CoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgc2lsa3nCoCDCoCDCoCDCoCDCoCDC
oCDCoCB8wqAgwqAgwqAgwqAgwqAgKCkgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCgpwqAgwqAgwqAg
wqAoKcKgIMKgIMKgIMKgIMKgIHw8YnI+DQotK8KgIMKgIMKgc2tlbmNpbMKgIMKgIMKgIMKgIMKg
IMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBza2V0Y2jCoCDCoCDCoCDCoCDC
oCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBzb3VuZHRyYWNrZXLCoCDC
oCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgW13CoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDCoHNwwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgKCnCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgdGFywqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgfCBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCBbXcKgIMKgIFtdIFtdIFtd
wqAgwqAgW10gW13CoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgdGV4aW5mb8KgIMKgIMKgIMKg
IMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqBbXSBbXcKgIMKgIMKgIMKg
IMKgIMKgIMKgW13CoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgdGV4dHV0aWxzwqAgwqAgwqAg
wqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW10gW10gW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAg
wqAgwqAgW10gW13CoCDCoCB8PGJyPg0KLSvCoCDCoCDCoHRpbsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHwgW13CoCDCoCDCoCDCoCDCoCAoKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+DQotK8KgIMKgIMKgdHAtcm9ib3TCoCDCoCDCoCDCoCDC
oCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCi0rwqAgwqAgwqB0dXhwYWludMKgIMKgIMKgIMKg
IMKgIMKgfMKgIMKgIMKgIMKgIMKgIFtdIFtdwqAgwqAgwqAgwqBbXcKgIMKgIFtdIFtdIFtdIFtd
IFtdIFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqB1bmljb2RlLWhhbi10cmEuLi4gfMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqB1bmljb2RlLXRyYW5zbGEuLi4gfMKgIMKgIMKgIMKg
IMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHw8YnI+DQotK8KgIMKgIMKgdXRpbC1saW51eMKgIMKgIMKgIMKgIMKgfCBbXcKgIMKgIMKg
IMKgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAoKSBbXcKgIMKgIMKgIMKg
fDxicj4NCi0rwqAgwqAgwqB2b3JiaXMtdG9vbHPCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDC
oCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fDxicj4NCi0rwqAgwqAgwqB3YXN0ZXNlZGdlwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAg
wqAgwqAoKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHw8YnI+DQotK8KgIMKgIMKgd2RpZmbCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IFtdwqAgwqAgwqAg
wqAgwqAgW10gW10gW13CoCDCoCDCoCDCoFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxi
cj4NCi0rwqAgwqAgwqB3Z2V0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IFtdwqAgwqAgwqAgwqBb
XSBbXcKgIMKgIFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgfDxicj4N
Ci0rwqAgwqAgwqB4Y2hhdMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgW13CoCDCoCDCoCDCoFtdIFtd
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4N
Ci0rwqAgwqAgwqB4ZnJlZTg2X3hrYl94bWzCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKg
IMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQot
K8KgIMKgIMKgeHBhZMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKg
W10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+
DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLTx3YnI+LS0tLS0tLS0tLS0tLS0tLS0tLS0rPGJyPg0KLSvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBldCBldSBmYSBmaSBmciBnYSBnbCBoZSBociBo
dSBpZCBpcyBpdCBqYSBrbyBsZzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgMjLCoCAywqAgMSAyNiAxMDYgMjggMjTCoCA4IDEwIDQxIDMzwqAgMSAyNiAzMyAx
MsKgIDA8YnI+DQotKzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgbHQgbHYgbWsgbW4gbXMgbXQgbmIgbmwgbm4gbm8gbnNvIHBsIHB0IHB0X0JSIHJvIHJ1PGJy
Pg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCArLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS08d2JyPi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSs8YnI+DQotK8KgIMKg
IMKgYTJwc8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDC
oCDCoCDCoFtdwqAgwqAgKCnCoCDCoCDCoCgpwqAgwqAgwqBbXcKgIMKgW10gW10gfDxicj4NCi0r
wqAgwqAgwqBhZWdpc8KgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAoKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKCkgKCkgfDxi
cj4NCi0rwqAgwqAgwqBhbnQtcGhvbmXCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAg
wqAgfDxicj4NCi0rwqAgwqAgwqBhbnViaXPCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDC
oCDCoCDCoCDCoFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAg
W10gW10gfDxicj4NCi0rwqAgwqAgwqBhcC11dGlsc8KgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAoKcKgIMKgIMKgIMKg
IMKgIFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBhc3BlbGzCoCDCoCDCoCDCoCDCoCDCoCDCoHzC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBiYXNowqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgW13CoCDCoFtdIFtdIHw8YnI+DQotK8KgIMKgIMKgYmF0Y2hlbG9ywqAg
wqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCB8PGJyPg0KLSvCoCDCoCDCoGJmZMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgfDxicj4NCi0rwqAg
wqAgwqBiaW51dGlsc8KgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdIHw8YnI+
DQotK8KgIMKgIMKgYmlzb27CoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAg
wqBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgW10gW10g
fDxicj4NCi0rwqAgwqAgwqBibHVlei1waW7CoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgW13C
oCDCoCB8PGJyPg0KLSvCoCDCoCDCoGNsaXNwwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBjbGlzcMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBjb25zb2xlLXRvb2xzwqAg
wqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdIHw8YnI+DQotK8KgIMKgIMKgY29yZXV0aWxzwqAg
wqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoFtdIHw8YnI+DQotK8KgIMKgIMKgY3Bpb8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtd
wqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgW13CoCDCoFtdIFtdIHw8YnI+DQotK8KgIMKgIMKg
ZGFya3N0YXTCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAg
wqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqBbXcKgIMKgIHw8YnI+DQotK8Kg
IMKgIMKgZGlmZnV0aWxzwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDC
oCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgW13CoCDCoFtdIFtdIHw8YnI+DQot
K8KgIMKgIMKgZTJmc3Byb2dzwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8
PGJyPg0KLSvCoCDCoCDCoGVuc2NyaXB0wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgW10g
W10gfDxicj4NCi0rwqAgwqAgwqBlcnJvcsKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAg
wqBbXcKgIMKgIHw8YnI+DQotK8KgIMKgIMKgZmV0Y2htYWlswqAgwqAgwqAgwqAgwqAgfMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKg
KCnCoCDCoCDCoCBbXSB8PGJyPg0KLSvCoCDCoCDCoGZpbGV1dGlsc8KgIMKgIMKgIMKgIMKgIHzC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAg
wqAgwqAgwqAgwqAgW10gW10gfDxicj4NCi0rwqAgwqAgwqBmaW5kdXRpbHPCoCDCoCDCoCDCoCDC
oCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoFtd
wqAgwqAgwqBbXcKgIMKgW10gW10gfDxicj4NCi0rwqAgwqAgwqBmbGV4wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBbXcKgIMKgIMKgW13CoCDCoFtdIFtdIHw8YnI+DQotK8KgIMKgIMKgZnNsaW50wqAgwqAg
wqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBnYXPC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvC
oCDCoCDCoGdhd2vCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqBbXcKgIMKgW13CoCDCoCB8
PGJyPg0KLSvCoCDCoCDCoGdiaWZmwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBb
XcKgIMKgIHw8YnI+DQotK8KgIMKgIMKgZ2NhbMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBnY2PCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvCoCDCoCDCoGdldHRleHTCoCDC
oCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIFtdIFtdIHw8YnI+DQotK8KgIMKgIMKgZ2V0dGV4
dC1leGFtcGxlc8KgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAg
wqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBnZXR0
ZXh0LXJ1bnRpbWXCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDC
oCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgW10gW10gfDxicj4NCi0rwqAgwqAgwqBnZXR0
ZXh0LXRvb2xzwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCBbXcKgIMKgIHw8YnI+DQotK8KgIMKgIMKg
Z2ltcC1wcmludMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvC
oCDCoCDCoGdsaXbCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqBbXcKgIMKgIHw8
YnI+DQotK8KgIMKgIMKgZ2x1bmFyY2xvY2vCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAg
wqBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdIFtd
IHw8YnI+DQotK8KgIMKgIMKgZ251YmlmZsKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBnbnVjYXNowqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCAo
KcKgIMKgIMKgIFtdIHw8YnI+DQotK8KgIMKgIMKgZ251Y2FzaC1nbG9zc2FyecKgIMKgfMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDC
oCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgZ251cGfCoCDCoCDCoCDCoCDCoCDCoCDC
oCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIHw8YnI+DQotK8KgIMKgIMKgZ3BlLWFlcmlhbMKgIMKg
IMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAg
wqAgwqAgwqAgW13CoCDCoCDCoCDCoFtdIFtdIHw8YnI+DQotK8KgIMKgIMKgZ3BlLWJlYW3CoCDC
oCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKg
IMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqBbXSBbXSB8PGJyPg0KLSvCoCDCoCDCoGdwZS1jYWxl
bmRhcsKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAg
wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoFtdIFtdIHw8YnI+DQotK8KgIMKgIMKgZ3BlLWNs
b2NrwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAg
wqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoFtdIFtdIHw8YnI+DQotK8KgIMKgIMKgZ3Bl
LWNvbmbCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBb
XcKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqBbXSBbXSB8PGJyPg0KLSvCoCDCoCDC
oGdwZS1jb250YWN0c8KgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoFtdIFtdIHw8YnI+DQotK8KgIMKg
IMKgZ3BlLWVkaXTCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqBbXSBbXSB8PGJyPg0KLSvC
oCDCoCDCoGdwZS1nb8KgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSBbXSB8PGJy
Pg0KLSvCoCDCoCDCoGdwZS1sb2dpbsKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqBbXSBbXSB8
PGJyPg0KLSvCoCDCoCDCoGdwZS1vd25lcmluZm/CoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgW10gW10g
fDxicj4NCi0rwqAgwqAgwqBncGUtc2tldGNoYm9va8KgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoFtdIFtd
IHw8YnI+DQotK8KgIMKgIMKgZ3BlLXN1wqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKg
W10gW10gfDxicj4NCi0rwqAgwqAgwqBncGUtdGFza21hbmFnZXLCoCDCoCB8wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKg
W10gW10gfDxicj4NCi0rwqAgwqAgwqBncGUtdGltZXNoZWV0wqAgwqAgwqAgfMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDC
oFtdIFtdIHw8YnI+DQotK8KgIMKgIMKgZ3BlLXRvZGF5wqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDC
oCDCoFtdIFtdIHw8YnI+DQotK8KgIMKgIMKgZ3BlLXRvZG/CoCDCoCDCoCDCoCDCoCDCoHzCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAg
wqAgwqAgwqBbXSBbXSB8PGJyPg0KLSvCoCDCoCDCoGdwaG90bzLCoCDCoCDCoCDCoCDCoCDCoCB8
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBbXcKgIMKgIHw8YnI+DQotK8KgIMKgIMKgZ3Byb2bCoCDCoCDCoCDCoCDC
oCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgW13CoCDCoFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBncHNkcml2ZcKg
IMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICgpwqAgwqAg
KCnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBncmFt
YWRvaXLCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKCnC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgfDxicj4NCi0rwqAgwqAg
wqBncmVwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSBbXcKgIFtdwqAgwqBbXSBbXSB8PGJyPg0KLSvC
oCDCoCDCoGdyZXRswqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fDxicj4NCi0rwqAgwqAgwqBndGlja8KgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
W10gW10gfDxicj4NCi0rwqAgwqAgwqBoZWxsb8KgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCBb
XcKgIMKgIMKgIMKgW13CoCDCoCBbXSBbXSBbXSBbXcKgIMKgIMKgW13CoCDCoCDCoFtdwqAgwqBb
XSBbXSB8PGJyPg0KLSvCoCDCoCDCoGlkLXV0aWxzwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKg
IMKgW10gW10gfDxicj4NCi0rwqAgwqAgwqBpbmRlbnTCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IFtdwqAgwqBbXSBbXSB8PGJyPg0KLSvCoCDCoCDCoGlzb18zMTY2wqAgwqAgwqAgwqAgwqAgwqB8
wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXSBbXcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+DQotK8KgIMKgIMKgaXNvXzMxNjZfMcKgIMKgIMKgIMKg
IMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgW13CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgaXNvXzMxNjZfMsKgIMKg
IMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBpc29fMzE2
Nl8zwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKg
aXNvXzQyMTfCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKg
IFtdIFtdIFtdwqAgwqAgwqBbXSBbXcKgIFtdwqAgwqAgwqAgW10gfDxicj4NCi0rwqAgwqAgwqBp
c29fNjM5wqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KLSvC
oCDCoCDCoGpwaWxvdMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICgpwqAgwqAgKCnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8
YnI+DQotK8KgIMKgIMKganRhZ8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBqd2hvaXPCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDC
oFtdwqAgwqBbXSAoKSB8PGJyPg0KLSvCoCDCoCDCoGtiZMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgW13C
oCDCoCDCoCDCoCDCoCBbXcKgIMKgIHw8YnI+DQotK8KgIMKgIMKgbGF0cmluZcKgIMKgIMKgIMKg
IMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBsZMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAg
wqBsaWJjwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoFtdwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgfDxicj4N
Ci0rwqAgwqAgwqBsaWJncGV3aWRnZXTCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqBbXcKgIMKgIHw8
YnI+DQotK8KgIMKgIMKgbGliaWNvbnbCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoFtdwqAgwqBbXSBb
XSB8PGJyPg0KLSvCoCDCoCDCoGxpZmVsaW5lc8KgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgbGlseXBvbmTCoCDCoCDCoCDCoCDCoCDCoHzCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgbGluZ290ZWFjaMKgIMKgIMKgIMKg
IMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBsaW5nb3RlYWNoX2xl
c3NvbnMgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBseW54wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIFtdIHw8YnI+DQotK8KgIMKgIMKgbTTC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBbXcKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoFtdwqAgwqBbXSBbXSB8PGJyPg0KLSvCoCDC
oCDCoG1haWx1dGlsc8KgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgW10gW10gfDxicj4NCi0r
wqAgwqAgwqBtYWtlwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqBbXcKgIMKgIMKgIFtdIHw8
YnI+DQotK8KgIMKgIMKgbWFuLWRiwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBb
XcKgIMKgIHw8YnI+DQotK8KgIMKgIMKgbWluaWNvbcKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqBb
XcKgIMKgW10gW10gfDxicj4NCi0rwqAgwqAgwqBteXNlY3JldGRpYXJ5wqAgwqAgwqAgfMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
W13CoCDCoFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBuYW5vwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB8wqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoFtd
wqAgwqAgwqAgwqAgwqAgW10gW10gfDxicj4NCi0rwqAgwqAgwqBuYW5vXzFfMMKgIMKgIMKgIMKg
IMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCBbXcKgIMKgIFtdwqAgwqAgwqAgwqAg
W13CoCDCoCDCoCDCoCDCoCBbXSBbXSB8PGJyPg0KLSvCoCDCoCDCoG9wY29kZXPCoCDCoCDCoCDC
oCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgfDxicj4NCi0rwqAgwqAgwqBwYXJ0ZWTCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtd
wqAgwqAgwqAgwqAgW10gW13CoCBbXcKgIMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBwdHjC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSBb
XcKgIMKgIFtdwqAgwqAgwqBbXSBbXcKgIFtdwqAgwqBbXSBbXSB8PGJyPg0KLSvCoCDCoCDCoHB5
dGhvbsKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCi0r
wqAgwqAgwqByYWRpdXPCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSB8
PGJyPg0KLSvCoCDCoCDCoHJlY29kZcKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoFtdwqAgwqBb
XSBbXSB8PGJyPg0KLSvCoCDCoCDCoHJwbcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdIFtdwqAgwqAg
wqAgwqAgwqAgW10gfDxicj4NCi0rwqAgwqAgwqBzY3JlZW3CoCDCoCDCoCDCoCDCoCDCoCDCoHzC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgc2Nyb2xsa2VlcGVywqAgwqAg
wqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXSBbXcKgIMKgIMKgIMKgIMKgIMKg
W13CoCDCoCDCoCDCoCDCoCBbXSBbXSB8PGJyPg0KLSvCoCDCoCDCoHNlZMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoFtdwqAgwqAgwqBbXcKgIMKgW13CoCDCoCB8PGJyPg0KLSvCoCDCoCDCoHNoLXV0aWxz
wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW10gfDxicj4NCi0rwqAgwqAgwqBz
aGFyZWQtbWltZS1pbmZvwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10g
W13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KLSvCoCDCoCDC
oHNoYXJ1dGlsc8KgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdIHw8YnI+DQotK8Kg
IMKgIMKgc2lsa3nCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKCkgfDxi
cj4NCi0rwqAgwqAgwqBza2VuY2lswqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgW13CoCDCoCDCoCDC
oCDCoHw8YnI+DQotK8KgIMKgIMKgc2tldGNowqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCBbXcKg
IMKgIMKgIMKgIMKgfDxicj4NCi0rwqAgwqAgwqBzb3VuZHRyYWNrZXLCoCDCoCDCoCDCoHzCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgc3DCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgdGFywqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCBbXcKgIMKgIMKg
IMKgW13CoCDCoCDCoFtdwqAgwqAgwqBbXcKgIMKgW13CoCDCoCB8PGJyPg0KLSvCoCDCoCDCoHRl
eGluZm/CoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKg
IMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgW10gW10gfDxicj4NCi0rwqAgwqAg
wqB0ZXh0dXRpbHPCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBb
XcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW10gfDxicj4NCi0r
wqAgwqAgwqB0aW7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB8PGJyPg0KLSvCoCDCoCDCoHRwLXJvYm90wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgdHV4cGFpbnTCoCDCoCDCoCDCoCDCoCDCoHwgW13C
oCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoCBbXSBbXcKgIFtdwqAg
wqBbXcKgIMKgIHw8YnI+DQotK8KgIMKgIMKgdW5pY29kZS1oYW4tdHJhLi4uIHzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgdW5pY29kZS10cmFuc2xhLi4uIHzCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgdXRpbC1saW51eMKgIMKgIMKgIMKgIMKg
fMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgW13CoCDCoCDCoCBbXSB8PGJyPg0KLSvCoCDCoCDCoHZvcmJpcy10b29sc8KgIMKgIMKg
IMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBbXSBbXSB8PGJyPg0KLSvCoCDCoCDCoHdhc3Rlc2VkZ2XCoCDCoCDC
oCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQotK8KgIMKgIMKgd2RpZmbCoCDC
oCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIFtdwqAgwqAgwqBbXcKgIMKgW10gW10gfDxicj4NCi0rwqAgwqAgwqB3Z2V0
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIFtdIFtdIHw8YnI+DQotK8KgIMKg
IMKgeGNoYXTCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdIHw8YnI+DQot
K8KgIMKgIMKgeGZyZWU4Nl94a2JfeG1swqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW10gfDxicj4N
Ci0rwqAgwqAgwqB4cGFkwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAg
wqAgfDxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tPHdicj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rPGJyPg0K
LSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBsdCBsdiBtayBtbiBtcyBt
dCBuYiBubCBubiBubyBuc28gcGwgcHQgcHRfQlIgcm8gcnU8YnI+DQotK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMcKgIDLCoCAwwqAgMyAxMsKgIDAgMTAgNjnCoCA2
wqAgN8KgIDHCoCA0MCAyNsKgIDM2wqAgwqA3NiA2Mzxicj4NCi0rPGJyPg0KLSvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzayBzbCBzciBzdiB0YSB0aCB0ciB1ayB2ZW4g
dmkgd2EgeGggemhfQ04gemhfVFcgenU8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTx3YnI+LS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tKzxicj4NCi0rwqAgwqAgwqBhMnBzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
wqAgwqAgW13CoCDCoCBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHwgMTY8YnI+DQotK8KgIMKgIMKgYWVnaXPCoCDCoCDCoCDCoCDC
oCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMDxicj4NCi0rwqAgwqAgwqBhbnQt
cGhvbmXCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMzxicj4NCi0r
wqAgwqAgwqBhbnViaXPCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
wqAgOTxicj4NCi0rwqAgwqAgwqBhcC11dGlsc8KgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgICgpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB8wqAgMzxicj4NCi0rwqAgwqAgwqBhc3BlbGzCoCDCoCDCoCDCoCDCoCDCoCDC
oHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA0PGJyPg0KLSvCoCDCoCDCoGJhc2jCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA5PGJyPg0KLSvCoCDC
oCDCoGJhdGNoZWxvcsKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAz
PGJyPg0KLSvCoCDCoCDCoGJmZMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDC
oCBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB8wqAgNjxicj4NCi0rwqAgwqAgwqBiaW51dGlsc8KgIMKgIMKgIMKgIMKgIMKgfMKg
IMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtd
wqAgwqAgwqAgwqAgwqAgwqAgfMKgIDg8YnI+DQotK8KgIMKgIMKgYmlzb27CoCDCoCDCoCDCoCDC
oCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCAxNDxicj4NCi0rwqAgwqAgwqBibHVlei1w
aW7CoCDCoCDCoCDCoCDCoCB8IFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDE0PGJyPg0KLSvCoCDCoCDC
oGNsaXNwwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIDA8
YnI+DQotK8KgIMKgIMKgY2xpc3DCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8wqAgNTxicj4NCi0rwqAgwqAgwqBjb25zb2xlLXRvb2xzwqAgwqAgwqAgfMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfMKgIDM8YnI+DQotK8KgIMKgIMKgY29yZXV0aWxzwqAgwqAgwqAg
wqAgwqAgfMKgIMKgIFtdwqAgwqAgW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCB8IDE2PGJyPg0KLSvCoCDCoCDCoGNwaW/CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCB8IDE0PGJyPg0KLSvCoCDCoCDC
oGRhcmtzdGF0wqAgwqAgwqAgwqAgwqAgwqB8IFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgpwqAgwqAgKCnCoCDCoCDCoCB8IDEyPGJyPg0KLSvC
oCDCoCDCoGRpZmZ1dGlsc8KgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKg
IMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIHwgMjM8
YnI+DQotK8KgIMKgIMKgZTJmc3Byb2dzwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIFtd
wqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHzCoCA2PGJyPg0KLSvCoCDCoCDCoGVuc2NyaXB0wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAg
wqAgwqAgwqAgW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgfCAxMjxicj4NCi0rwqAgwqAgwqBlcnJvcsKgIMKgIMKgIMKgIMKgIMKg
IMKgIHwgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgfCAxNTxicj4NCi0rwqAgwqAgwqBmZXRjaG1haWzCoCDC
oCDCoCDCoCDCoCB8IFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDExPGJyPg0KLSvCoCDCoCDCoGZpbGV1
dGlsc8KgIMKgIMKgIMKgIMKgIHzCoCDCoCBbXcKgIMKgIFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgW13CoCDCoCDCoCB8IDE3PGJyPg0KLSvCoCDCoCDC
oGZpbmR1dGlsc8KgIMKgIMKgIMKgIMKgIHwgW10gW10gW10gW13CoCDCoCDCoCDCoFtdwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCB8IDI5PGJyPg0KLSvCoCDC
oCDCoGZsZXjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKg
IMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDEz
PGJyPg0KLSvCoCDCoCDCoGZzbGludMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfMKgIDM8YnI+DQotK8KgIMKgIMKgZ2FzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgMzxicj4NCi0rwqAgwqAgwqBnYXdrwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCAxMjxicj4NCi0rwqAgwqAgwqBn
YmlmZsKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA0PGJy
Pg0KLSvCoCDCoCDCoGdjYWzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCBb
XcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB8wqAgNDxicj4NCi0rwqAgwqAgwqBnY2PCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHzCoCA0PGJyPg0KLSvCoCDCoCDCoGdldHRleHTCoCDCoCDCoCDC
oCDCoCDCoCB8IFtdIFtdwqAgwqAgW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCB8IDE2PGJyPg0KLSvCoCDCoCDCoGdldHRleHQtZXhh
bXBsZXPCoCDCoHwgW13CoCDCoCBbXSBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIHwgMTQ8YnI+DQotK8KgIMKgIMKgZ2V0dGV4dC1y
dW50aW1lwqAgwqAgfCBbXSBbXSBbXSBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoFtdwqAgwqAgW13CoCDCoCDCoCB8IDIyPGJyPg0KLSvCoCDCoCDCoGdldHRleHQtdG9v
bHPCoCDCoCDCoCB8IFtdIFtdIFtdIFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqAgfCAxNDxicj4NCi0rwqAgwqAgwqBnaW1wLXByaW50
wqAgwqAgwqAgwqAgwqB8IFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAxMDxicj4NCi0rwqAgwqAgwqBn
bGl2wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMzxi
cj4NCi0rwqAgwqAgwqBnbHVuYXJjbG9ja8KgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoFtdIFtdwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHwgMTM8YnI+DQotK8KgIMKgIMKgZ251YmlmZsKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHzCoCAzPGJyPg0KLSvCoCDCoCDCoGdudWNhc2jCoCDCoCDCoCDCoCDCoCDC
oCB8IFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgW13CoCDCoCDCoCB8wqAgOTxicj4NCi0rwqAgwqAgwqBnbnVjYXNoLWdsb3Nz
YXJ5wqAgwqB8IFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCB8wqAgODxicj4NCi0rwqAgwqAgwqBnbnVwZ8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIHwgW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgfCAxNzxicj4NCi0rwqAgwqAg
wqBncGUtYWVyaWFswqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA3PGJy
Pg0KLSvCoCDCoCDCoGdwZS1iZWFtwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgW13C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHzCoCA4PGJyPg0KLSvCoCDCoCDCoGdwZS1jYWxlbmRhcsKgIMKgIMKgIMKgfCBbXcKgIMKg
IMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKg
W13CoCDCoCDCoCB8IDEzPGJyPg0KLSvCoCDCoCDCoGdwZS1jbG9ja8KgIMKgIMKgIMKgIMKgIHwg
W13CoCDCoCBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfCAxMDxicj4NCi0rwqAgwqAgwqBncGUtY29uZsKgIMKgIMKgIMKg
IMKgIMKgfCBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA5PGJyPg0KLSvCoCDCoCDCoGdwZS1jb250
YWN0c8KgIMKgIMKgIMKgfCBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgfCAxMTxicj4NCi0rwqAgwqAgwqBn
cGUtZWRpdMKgIMKgIMKgIMKgIMKgIMKgfCBbXcKgIMKgIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgfCAxMjxicj4NCi0rwqAg
wqAgwqBncGUtZ2/CoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzC
oCA1PGJyPg0KLSvCoCDCoCDCoGdwZS1sb2dpbsKgIMKgIMKgIMKgIMKgIHwgW13CoCDCoCBbXSBb
XcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKg
IMKgIHwgMTM8YnI+DQotK8KgIMKgIMKgZ3BlLW93bmVyaW5mb8KgIMKgIMKgIHwgW13CoCDCoCBb
XSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW13C
oCDCoCDCoCB8IDEzPGJyPg0KLSvCoCDCoCDCoGdwZS1za2V0Y2hib29rwqAgwqAgwqB8IFtdwqAg
wqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfMKgIDk8YnI+DQotK8KgIMKgIMKgZ3BlLXN1wqAgwqAgwqAgwqAgwqAg
wqAgwqB8IFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMTA8YnI+DQotK8KgIMKgIMKgZ3BlLXRhc2ttYW5h
Z2VywqAgwqAgfCBbXcKgIMKgIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDEwPGJyPg0KLSvCoCDCoCDCoGdwZS10aW1l
c2hlZXTCoCDCoCDCoCB8IFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgwqAgfCAxMjxicj4NCi0rwqAgwqAgwqBncGUt
dG9kYXnCoCDCoCDCoCDCoCDCoCB8IFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCB8IDEzPGJyPg0KLSvCoCDCoCDC
oGdwZS10b2RvwqAgwqAgwqAgwqAgwqAgwqB8IFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIHwgMTI8YnI+DQot
K8KgIMKgIMKgZ3Bob3RvMsKgIMKgIMKgIMKgIMKgIMKgIHwgW13CoCDCoCDCoCDCoFtdwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIHwg
MTE8YnI+DQotK8KgIMKgIMKgZ3Byb2bCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAg
wqAgW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgfMKgIDk8YnI+DQotK8KgIMKgIMKgZ3BzZHJpdmXCoCDCoCDCoCDCoCDCoCDCoHwg
W13CoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMzxicj4NCi0rwqAgwqAgwqBncmFtYWRvaXLCoCDCoCDC
oCDCoCDCoCB8IFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDU8YnI+DQotK8KgIMKgIMKgZ3JlcMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIFtdIFtdwqAgwqAgwqAgwqAgwqAgW10gW13CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMjY8YnI+DQotK8KgIMKg
IMKgZ3JldGzCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAg
Mzxicj4NCi0rwqAgwqAgwqBndGlja8KgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHzCoCA3PGJyPg0KLSvCoCDCoCDCoGhlbGxvwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fCBbXcKgIMKgIFtdIFtdwqAgwqAgwqAgwqBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfCAzNDxicj4NCi0rwqAgwqAgwqBpZC11dGlsc8KgIMKgIMKgIMKg
IMKgIMKgfMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgMTI8YnI+DQotK8KgIMKgIMKgaW5kZW50wqAg
wqAgwqAgwqAgwqAgwqAgwqB8IFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCAyMTxicj4NCi0rwqAgwqAgwqBp
c29fMzE2NsKgIMKgIMKgIMKgIMKgIMKgfCBbXSBbXSBbXSBbXcKgIMKgIMKgIMKgW13CoCDCoCBb
XcKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMjc8YnI+DQotK8KgIMKg
IMKgaXNvXzMxNjZfMcKgIMKgIMKgIMKgIMKgfCBbXSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW13C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDE2PGJyPg0K
LSvCoCDCoCDCoGlzb18zMTY2XzLCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHzCoCAwPGJyPg0KLSvCoCDCoCDCoGlzb18zMTY2XzPCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHzCoCAyPGJyPg0KLSvCoCDCoCDCoGlzb180MjE3wqAgwqAgwqAgwqAgwqAg
wqB8IFtdIFtdwqAgwqAgW13CoCDCoCDCoCDCoFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBb
XcKgIMKgIMKgIMKgIMKgIMKgIHwgMjQ8YnI+DQotK8KgIMKgIMKgaXNvXzYzOcKgIMKgIMKgIMKg
IMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAxPGJyPg0KLSvCoCDCoCDCoGpwaWxv
dMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqBbXcKgIMKg
IMKgIMKgIFtdwqAgwqAgwqAgwqAgW13CoCDCoCBbXcKgIMKgIMKgIHzCoCA5PGJyPg0KLSvCoCDC
oCDCoGp0YWfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAg
Mjxicj4NCi0rwqAgwqAgwqBqd2hvaXPCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDC
oCAoKcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKg
IMKgIMKgIHwgMTE8YnI+DQotK8KgIMKgIMKga2JkwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKg
IMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHwgMTE8YnI+DQotK8KgIMKgIMKgbGF0cmluZcKgIMKgIMKgIMKg
IMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAyPGJyPg0KLSvCoCDCoCDCoGxkwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoFtdwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDU8YnI+DQot
K8KgIMKgIMKgbGliY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCBbXcKgIMKgIMKgIMKgW13CoCDC
oCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCB8
IDIwPGJyPg0KLSvCoCDCoCDCoGxpYmdwZXdpZGdldMKgIMKgIMKgIMKgfCBbXcKgIMKgIFtdIFtd
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHwgMTM8YnI+DQotK8KgIMKgIMKgbGliaWNvbnbCoCDCoCDCoCDCoCDCoCDCoHwgW10gW10g
W10gW13CoCDCoCDCoCDCoFtdIFtdwqAgwqAgwqAgwqAgW13CoCDCoCDCoFtdwqAgwqAgwqAgwqAg
wqAgwqAgfCAyNzxicj4NCi0rwqAgwqAgwqBsaWZlbGluZXPCoCDCoCDCoCDCoCDCoCB8wqAgwqAg
wqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCAyPGJyPg0KLSvCoCDCoCDCoGxpbHlwb25kwqAgwqAgwqAgwqAg
wqAgwqB8wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAzPGJyPg0KLSvCoCDCoCDCoGxpbmdvdGVh
Y2jCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAyPGJyPg0KLSvCoCDC
oCDCoGxpbmdvdGVhY2hfbGVzc29ucyB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoKcKgIMKgIMKgIMKgIMKgIMKgIHzCoCAwPGJyPg0K
LSvCoCDCoCDCoGx5bnjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCBbXcKg
IMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHwgMTQ8YnI+DQotK8KgIMKgIMKgbTTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDC
oCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDC
oCDCoCDCoCDCoCDCoCB8IDE1PGJyPg0KLSvCoCDCoCDCoG1haWx1dGlsc8KgIMKgIMKgIMKgIMKg
IHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA1PGJyPg0KLSvCoCDCoCDCoG1ha2XCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIHwgMTY8YnI+DQotK8KgIMKgIMKg
bWFuLWRiwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA1PGJy
Pg0KLSvCoCDCoCDCoG1pbmljb23CoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB8IDExPGJyPg0KLSvCoCDCoCDCoG15c2VjcmV0ZGlhcnnCoCDCoCDCoCB8wqAgwqAgwqAg
wqAgwqAgW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgfCAxMDxicj4NCi0rwqAgwqAgwqBuYW5vwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB8wqAgwqAgwqAgwqBbXSBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMTc8YnI+DQotK8KgIMKgIMKgbmFub18xXzDCoCDCoCDC
oCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMTc8YnI+DQotK8KgIMKgIMKgb3Bjb2Rl
c8KgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgW13CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgNjxicj4NCi0rwqAg
wqAgwqBwYXJ0ZWTCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKg
IMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIHwgMTU8
YnI+DQotK8KgIMKgIMKgcHR4wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKg
IFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHwgMjI8YnI+DQotK8KgIMKgIMKgcHl0aG9uwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMDxicj4NCi0rwqAgwqAgwqByYWRpdXPCoCDCoCDCoCDC
oCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA0PGJyPg0KLSvCoCDCoCDCoHJl
Y29kZcKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIFtdwqAgwqAgW13CoCDCoCDCoCDCoFtdwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCAyMDxicj4NCi0r
wqAgwqAgwqBycG3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgW13CoCDC
oCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fMKgIDk8YnI+DQotK8KgIMKgIMKgc2NyZWVtwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAg
wqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAg
wqAgwqAgwqAgwqAgfMKgIDI8YnI+DQotK8KgIMKgIMKgc2Nyb2xsa2VlcGVywqAgwqAgwqAgwqB8
IFtdwqAgwqAgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHwgMTU8YnI+DQotK8KgIMKgIMKgc2VkwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgfCBbXSBbXSBbXSBbXcKgIMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMjQ8YnI+DQotK8KgIMKgIMKgc2gtdXRpbHPCoCDC
oCDCoCDCoCDCoCDCoHzCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDE0PGJyPg0KLSvCoCDCoCDCoHNo
YXJlZC1taW1lLWluZm/CoCDCoHzCoCDCoCDCoCDCoFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgNzxicj4NCi0rwqAg
wqAgwqBzaGFydXRpbHPCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqBbXSBbXcKgIMKgIMKgIMKg
W13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIHwgMTc8YnI+
DQotK8KgIMKgIMKgc2lsa3nCoCDCoCDCoCDCoCDCoCDCoCDCoCB8ICgpwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfMKgIDM8YnI+DQotK8KgIMKgIMKgc2tlbmNpbMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDC
oCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfMKgIDY8YnI+DQotK8KgIMKgIMKgc2tldGNowqAgwqAgwqAgwqAgwqAg
wqAgwqB8wqAgwqAgwqAgwqAgwqAgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA2PGJyPg0KLSvCoCDCoCDCoHNvdW5kdHJh
Y2tlcsKgIMKgIMKgIMKgfCBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA3PGJyPg0KLSvCoCDCoCDC
oHNwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCAz
PGJyPg0KLSvCoCDCoCDCoHRhcsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgW10gW13CoCDCoCBb
XcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKgIMKgIMKgIMKg
IMKgIHwgMjQ8YnI+DQotK8KgIMKgIMKgdGV4aW5mb8KgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDC
oCDCoCDCoCBbXcKgIMKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBbXcKgIMKg
IMKgIMKgIMKgIMKgIHwgMTQ8YnI+DQotK8KgIMKgIMKgdGV4dHV0aWxzwqAgwqAgwqAgwqAgwqAg
fMKgIMKgIFtdwqAgwqAgW13CoCDCoCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgW13CoCDCoCDCoCB8IDE2PGJyPg0KLSvCoCDCoCDCoHRpbsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAxPGJyPg0KLSvCoCDCoCDCoHRw
LXJvYm90wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMjxicj4N
Ci0rwqAgwqAgwqB0dXhwYWludMKgIMKgIMKgIMKgIMKgIMKgfCBbXcKgIMKgIMKgIMKgW13CoCDC
oCDCoCDCoFtdwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKgW13CoCDCoCDCoCDCoCDCoCDCoCB8
IDI5PGJyPg0KLSvCoCDCoCDCoHVuaWNvZGUtaGFuLXRyYS4uLiB8wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB8wqAgMDxicj4NCi0rwqAgwqAgwqB1bmljb2RlLXRyYW5zbGEuLi4gfMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfMKgIDI8YnI+DQotK8KgIMKgIMKgdXRpbC1saW51eMKgIMKgIMKgIMKgIMKg
fMKgIMKgIMKgIMKgIMKgIFtdwqAgwqAgwqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgMTU8YnI+DQotK8KgIMKgIMKgdm9yYmlzLXRvb2xzwqAg
wqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgODxicj4NCi0rwqAgwqAgwqB3YXN0
ZXNlZGdlwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMDxicj4NCi0r
wqAgwqAgwqB3ZGlmZsKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgW13CoCDCoCDCoCDCoFtdwqAgwqAg
wqAgwqBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwg
MTg8YnI+DQotK8KgIMKgIMKgd2dldMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCBbXSBbXSBbXSBb
XcKgIMKgIMKgIMKgW10gW13CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFtdwqAgwqAgW13CoCDCoCDC
oCB8IDI0PGJyPg0KLSvCoCDCoCDCoHhjaGF0wqAgwqAgwqAgwqAgwqAgwqAgwqAgfCBbXSBbXSBb
XSBbXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgW13CoCDCoCDCoCDC
oCDCoCDCoCB8IDE1PGJyPg0KLSvCoCDCoCDCoHhmcmVlODZfeGtiX3htbMKgIMKgIHwgW13CoCDC
oCBbXcKgIMKgIMKgIMKgIMKgIFtdIFtdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbXcKgIMKgIMKg
IMKgIMKgIMKgIHwgMTE8YnI+DQotK8KgIMKgIMKgeHBhZMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIDU8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTx3YnI+LS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tKzxicj4NCi0rwqAgwqAgwqAgwqA2MyB0ZWFtc8KgIMKgIMKgIMKg
IMKgIMKgc2sgc2wgc3Igc3YgdGEgdGggdHIgdWsgdmVuIHZpIHdhIHhoIHpoX0NOIHpoX1RXIHp1
PGJyPg0KLSvCoCDCoCDCoCAxMzEgZG9tYWluc8KgIMKgIMKgIMKgIMKgNDcgMTkgMjggODPCoCAw
wqAgMCA1OSAxM8KgIDHCoCDCoDEgMTHCoCAwwqAgMjLCoCDCoCAyMsKgIMKgIDDCoCAxMzczPGJy
Pg0KLTxicj4NCi3CoCDCoCBTb21lIGNvdW50ZXJzIGluIHRoZSBwcmVjZWRpbmcgbWF0cml4IGFy
ZSBoaWdoZXIgdGhhbiB0aGUgbnVtYmVyIG9mPGJyPg0KLSB2aXNpYmxlIGJsb2NrcyBsZXQgdXMg
ZXhwZWN0LsKgIFRoaXMgaXMgYmVjYXVzZSBhIGZldyBleHRyYSBQTyBmaWxlcyBhcmU8YnI+DQot
QEAgLTIyMCw2ICs3NDIsMjcgQEA8YnI+DQotIGxhZyBiZXR3ZWVuIHRoZSBtZXJlIGV4aXN0ZW5j
ZSBhIFBPIGZpbGUgYW5kIGl0cyB3aWRlIGF2YWlsYWJpbGl0eSBpbiBhPGJyPg0KLSBkaXN0cmli
dXRpb24uPGJyPg0KLTxicj4NCi0twqAgwqBJZiBBdWd1c3QgMTk5NyBzZWVtcyB0byBiZSBvbGQs
IHlvdSBtYXkgZmV0Y2ggYSBtb3JlIHJlY2VudCBjb3B5IG9mPGJyPg0KLS10aGlzIGBBQk9VVC1O
TFMmIzM5OyBmaWxlIG9uIG1vc3QgR05VIGFyY2hpdmUgc2l0ZXMuPGJyPg0KLSvCoCDCoElmIEph
bnVhcnkgMjAwNCBzZWVtcyB0byBiZSBvbGQsIHlvdSBtYXkgZmV0Y2ggYSBtb3JlIHJlY2VudCBj
b3B5IG9mPGJyPg0KLSt0aGlzIGBBQk9VVC1OTFMmIzM5OyBmaWxlIG9uIG1vc3QgR05VIGFyY2hp
dmUgc2l0ZXMuwqAgVGhlIG1vc3QgdXAtdG8tZGF0ZTxicj4NCi0rbWF0cml4IHdpdGggZnVsbCBw
ZXJjZW50YWdlIGRldGFpbHMgY2FuIGJlIGZvdW5kIGF0PGJyPg0KLStgPGEgaHJlZj0iaHR0cDov
L3d3dy5pcm8udW1vbnRyZWFsLmNhL2NvbnRyaWIvcG8vSFRNTC9tYXRyaXguaHRtbCIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3d3dy5pcm8udW1vbnRyZWFsLjx3YnI+
Y2EvY29udHJpYi9wby9IVE1ML21hdHJpeC5odG1sPC9hPjx3YnI+JiMzOTsuPGJyPg0KLSs8YnI+
DQotK1VzaW5nIGBnZXR0ZXh0JiMzOTsgaW4gbmV3IHBhY2thZ2VzPGJyPg0KLSs9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PHdicj49PT08YnI+DQotKzxicj4NCi0rSWYgeW91IGFyZSB3cml0
aW5nIGEgZnJlZWx5IGF2YWlsYWJsZSBwcm9ncmFtIGFuZCB3YW50IHRvPGJyPg0KLStpbnRlcm5h
dGlvbmFsaXplIGl0IHlvdSBhcmUgd2VsY29tZSB0byB1c2UgR05VIGBnZXR0ZXh0JiMzOTsgaW4g
eW91cjxicj4NCi0rcGFja2FnZS7CoCBPZiBjb3Vyc2UgeW91IGhhdmUgdG8gcmVzcGVjdCB0aGUg
R05VIExpYnJhcnkgR2VuZXJhbCBQdWJsaWM8YnI+DQotK0xpY2Vuc2Ugd2hpY2ggY292ZXJzIHRo
ZSB1c2Ugb2YgdGhlIEdOVSBgZ2V0dGV4dCYjMzk7IGxpYnJhcnkuwqAgVGhpcyBtZWFuczxicj4N
Ci0raW4gcGFydGljdWxhciB0aGF0IGV2ZW4gbm9uLWZyZWUgcHJvZ3JhbXMgY2FuIHVzZSBgbGli
aW50bCYjMzk7IGFzIGEgc2hhcmVkPGJyPg0KLStsaWJyYXJ5LCB3aGVyZWFzIG9ubHkgZnJlZSBz
b2Z0d2FyZSBjYW4gdXNlIGBsaWJpbnRsJiMzOTsgYXMgYSBzdGF0aWM8YnI+DQotK2xpYnJhcnkg
b3IgdXNlIG1vZGlmaWVkIHZlcnNpb25zIG9mIGBsaWJpbnRsJiMzOTsuPGJyPg0KLSs8YnI+DQot
K8KgIMKgT25jZSB0aGUgc291cmNlcyBhcmUgY2hhbmdlZCBhcHByb3ByaWF0ZWx5IGFuZCB0aGUg
c2V0dXAgY2FuIGhhbmRsZTxicj4NCi0rdGhlIHVzZSBvZiBgZ2V0dGV4dCYjMzk7IHRoZSBvbmx5
IHRoaW5nIG1pc3NpbmcgYXJlIHRoZSB0cmFuc2xhdGlvbnMuwqAgVGhlPGJyPg0KLStGcmVlIFRy
YW5zbGF0aW9uIFByb2plY3QgaXMgYWxzbyBhdmFpbGFibGUgZm9yIHBhY2thZ2VzIHdoaWNoIGFy
ZSBub3Q8YnI+DQotK2RldmVsb3BlZCBpbnNpZGUgdGhlIEdOVSBwcm9qZWN0LsKgIFRoZXJlZm9y
ZSB0aGUgaW5mb3JtYXRpb24gZ2l2ZW4gYWJvdmU8YnI+DQotK2FwcGxpZXMgYWxzbyBmb3IgZXZl
cnkgb3RoZXIgRnJlZSBTb2Z0d2FyZSBQcm9qZWN0LsKgIENvbnRhY3Q8YnI+DQotK2A8YSBocmVm
PSJtYWlsdG86dHJhbnNsYXRpb25AaXJvLnVtb250cmVhbC5jYSI+dHJhbnNsYXRpb25AaXJvLnVt
b250cmVhbC48d2JyPmNhPC9hPiYjMzk7IHRvIG1ha2UgdGhlIGAucG90JiMzOTsgZmlsZXMgYXZh
aWxhYmxlIHRvPGJyPg0KLSt0aGUgdHJhbnNsYXRpb24gdGVhbXMuPGJyPg0KLTxicj4NCi0tLS0g
bHJ6c3otMC4xMi4yMC5zYWZlL0NoYW5nZUxvZ8KgIMKgIMKgIMKgMTk5OC0xMi0yOSAxNzo0OTo1
Ni4wMDAwMDAwMDAgLTA1MDA8YnI+DQotKysrIGxyenN6LTAuMTIuMjAvQ2hhbmdlTG9nwqAgwqAg
MjAwNC0wOS0xMiAxNDo0MDozNS44NDY1MjE0NTYgLTA0MDA8YnI+DQotQEAgLTEsMyArMSwxMSBA
QDxicj4NCi0rMjAwNC0wOS0xMsKgIGdldHRleHRpemXCoCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmJ1
Zy1nbnUtZ2V0dGV4dEBnbnUub3JnIj5idWctZ251LWdldHRleHRAZ251Lm9yZzwvYT4mZ3Q7PGJy
Pg0KLSs8YnI+DQotK8KgIMKgIMKgICogTWFrZWZpbGUuYW0gKEFDTE9DQUxfQU1GTEFHUyk6IE5l
dyB2YXJpYWJsZS48YnI+DQotK8KgIMKgIMKgIChFWFRSQV9ESVNUKTogQWRkIGNvbmZpZy5ycGF0
aC48YnI+DQotK8KgIMKgIMKgICogPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5pbiIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+Y29uZmlndXJlLmluPC9hPiAoQUNfT1VUUFVUKTog
QWRkIG00L01ha2VmaWxlLjxicj4NCi0rwqAgwqAgwqAgKEFDX09VVFBVVCk6IFJlbW92ZSBjb21t
YW5kIHRoYXQgY3JlYXRlZCBwby9NYWtlZmlsZS48YnI+DQotK8KgIMKgIMKgIChBQ19MSU5LX0ZJ
TEVTKTogUmVtb3ZlIGludm9jYXRpb24uPGJyPg0KLSs8YnI+DQotIDE5OTgtMTItMjnCoCDCoCBV
d2UgT2hzZcKgICZsdDs8YSBocmVmPSJtYWlsdG86dXdlQG9oc2UuZGUiPnV3ZUBvaHNlLmRlPC9h
PiZndDs8YnI+DQotPGJyPg0KLcKgIMKgIMKgIMKgKiBzcmMvbHJ6LmM6IHJlbW92ZWQgc3RwY3B5
IGNhbGwuPGJyPg0KLS0tLSBscnpzei0wLjEyLjIwLnNhZmUvY29uZmlnLjx3YnI+cnBhdGjCoCDC
oCAxOTY5LTEyLTMxIDE5OjAwOjAwLjAwMDAwMDAwMCAtMDUwMDxicj4NCi0rKysgbHJ6c3otMC4x
Mi4yMC9jb25maWcucnBhdGggMjAwNC0wOS0xMiAxNDo0MDozNC4zMjk3NTIwNDAgLTA0MDA8YnI+
DQotQEAgLTAsMCArMSw1NDggQEA8YnI+DQotKyMhIC9iaW4vc2g8YnI+DQotKyMgT3V0cHV0IGEg
c3lzdGVtIGRlcGVuZGVudCBzZXQgb2YgdmFyaWFibGVzLCBkZXNjcmliaW5nIGhvdyB0byBzZXQg
dGhlPGJyPg0KLSsjIHJ1biB0aW1lIHNlYXJjaCBwYXRoIG9mIHNoYXJlZCBsaWJyYXJpZXMgaW4g
YW4gZXhlY3V0YWJsZS48YnI+DQotKyM8YnI+DQotKyPCoCDCoENvcHlyaWdodCAxOTk2LTIwMDMg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuPGJyPg0KLSsjwqAgwqBUYWtlbiBmcm9tIEdO
VSBsaWJ0b29sLCAyMDAxPGJyPg0KLSsjwqAgwqBPcmlnaW5hbGx5IGJ5IEdvcmRvbiBNYXR6aWdr
ZWl0ICZsdDs8YSBocmVmPSJtYWlsdG86Z29yZEBnbnUuYWkubWl0LmVkdSI+Z29yZEBnbnUuYWku
bWl0LmVkdTwvYT4mZ3Q7LCAxOTk2PGJyPg0KLSsjPGJyPg0KLSsjwqAgwqBUaGlzIHByb2dyYW0g
aXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeTxi
cj4NCi0rI8KgIMKgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBhcyBwdWJsaXNoZWQgYnk8YnI+DQotKyPCoCDCoHRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yPGJyPg0KLSsjwqAg
wqAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLjxicj4NCi0rIzxicj4NCi0rI8Kg
IMKgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBi
ZSB1c2VmdWwsIGJ1dDxicj4NCi0rI8KgIMKgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQg
ZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZjxicj4NCi0rI8KgIMKgTUVSQ0hBTlRBQklMSVRZ
IG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLsKgIFNlZSB0aGUgR05VPGJyPg0K
LSsjwqAgwqBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuPGJyPg0KLSsj
PGJyPg0KLSsjwqAgwqBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZTxicj4NCi0rI8KgIMKgYWxvbmcgd2l0aCB0aGlzIHByb2dy
YW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmU8YnI+DQotKyPCoCDCoEZvdW5k
YXRpb24sIEluYy4sIDU5IFRlbXBsZSBQbGFjZSAtIFN1aXRlIDMzMCwgQm9zdG9uLCBNQSAwMjEx
MS0xMzA3LCBVU0EuPGJyPg0KLSsjPGJyPg0KLSsjwqAgwqBBcyBhIHNwZWNpYWwgZXhjZXB0aW9u
IHRvIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSwgaWYgeW91PGJyPg0KLSsjwqAgwqBk
aXN0cmlidXRlIHRoaXMgZmlsZSBhcyBwYXJ0IG9mIGEgcHJvZ3JhbSB0aGF0IGNvbnRhaW5zIGE8
YnI+DQotKyPCoCDCoGNvbmZpZ3VyYXRpb24gc2NyaXB0IGdlbmVyYXRlZCBieSBBdXRvY29uZiwg
eW91IG1heSBpbmNsdWRlIGl0IHVuZGVyPGJyPg0KLSsjwqAgwqB0aGUgc2FtZSBkaXN0cmlidXRp
b24gdGVybXMgdGhhdCB5b3UgdXNlIGZvciB0aGUgcmVzdCBvZiB0aGF0IHByb2dyYW0uPGJyPg0K
LSsjPGJyPg0KLSsjIFRoZSBmaXJzdCBhcmd1bWVudCBwYXNzZWQgdG8gdGhpcyBmaWxlIGlzIHRo
ZSBjYW5vbmljYWwgaG9zdCBzcGVjaWZpY2F0aW9uLDxicj4NCi0rI8KgIMKgIENQVV9UWVBFLU1B
TlVGQUNUVVJFUi08d2JyPk9QRVJBVElOR19TWVNURU08YnI+DQotKyMgb3I8YnI+DQotKyPCoCDC
oCBDUFVfVFlQRS1NQU5VRkFDVFVSRVItS0VSTkVMLTx3YnI+T1BFUkFUSU5HX1NZU1RFTTxicj4N
Ci0rIyBUaGUgZW52aXJvbm1lbnQgdmFyaWFibGVzIENDLCBHQ0MsIExERkxBR1MsIExELCB3aXRo
X2dudV9sZDxicj4NCi0rIyBzaG91bGQgYmUgc2V0IGJ5IHRoZSBjYWxsZXIuPGJyPg0KLSsjPGJy
Pg0KLSsjIFRoZSBzZXQgb2YgZGVmaW5lZCB2YXJpYWJsZXMgaXMgYXQgdGhlIGVuZCBvZiB0aGlz
IHNjcmlwdC48YnI+DQotKzxicj4NCi0rIyBLbm93biBsaW1pdGF0aW9uczo8YnI+DQotKyMgLSBP
biBJUklYIDYuNSB3aXRoIENDPSZxdW90O2NjJnF1b3Q7LCB0aGUgcnVuIHRpbWUgc2VhcmNoIHBh
dGNoIG11c3Qgbm90IGJlIGxvbmdlcjxicj4NCi0rI8KgIMKgdGhhbiAyNTYgYnl0ZXMsIG90aGVy
d2lzZSB0aGUgY29tcGlsZXIgZHJpdmVyIHdpbGwgZHVtcCBjb3JlLiBUaGUgb25seTxicj4NCi0r
I8KgIMKga25vd24gd29ya2Fyb3VuZCBpcyB0byBjaG9vc2Ugc2hvcnRlciBkaXJlY3RvcnkgbmFt
ZXMgZm9yIHRoZSBidWlsZDxicj4NCi0rI8KgIMKgZGlyZWN0b3J5IGFuZC9vciB0aGUgaW5zdGFs
bGF0aW9uIGRpcmVjdG9yeS48YnI+DQotKzxicj4NCi0rIyBBbGwga25vd24gbGlua2VycyByZXF1
aXJlIGEgYC5hJiMzOTsgYXJjaGl2ZSBmb3Igc3RhdGljIGxpbmtpbmcgKGV4Y2VwdCBNJFZDLDxi
cj4NCi0rIyB3aGljaCBuZWVkcyAmIzM5Oy5saWImIzM5OykuPGJyPg0KLStsaWJleHQ9YTxicj4N
Ci0rc2hyZXh0PS5zbzxicj4NCi0rPGJyPg0KLStob3N0PSZxdW90OyQxJnF1b3Q7PGJyPg0KLSto
b3N0X2NwdT1gZWNobyAmcXVvdDskaG9zdCZxdW90OyB8IHNlZCAmIzM5O3MvXlwoW14tXSpcKS1c
KFteLV0qXCktXCguKlwpPHdicj4kL1wxLyYjMzk7YDxicj4NCi0raG9zdF92ZW5kb3I9YGVjaG8g
JnF1b3Q7JGhvc3QmcXVvdDsgfCBzZWQgJiMzOTtzL15cKFteLV0qXCktXChbXi1dKlwpLVwoLipc
KTx3YnI+JC9cMi8mIzM5O2A8YnI+DQotK2hvc3Rfb3M9YGVjaG8gJnF1b3Q7JGhvc3QmcXVvdDsg
fCBzZWQgJiMzOTtzL15cKFteLV0qXCktXChbXi1dKlwpLVwoLipcKTx3YnI+JC9cMy8mIzM5O2A8
YnI+DQotKzxicj4NCi0rIyBDb2RlIHRha2VuIGZyb20gbGlidG9vbC5tNCYjMzk7cyBBQ19MSUJU
T09MX1BST0dfQ09NUElMRVJfUElDLjxicj4NCi0rPGJyPg0KLSt3bD08YnI+DQotK2lmIHRlc3Qg
JnF1b3Q7JEdDQyZxdW90OyA9IHllczsgdGhlbjxicj4NCi0rwqAgd2w9JiMzOTstV2wsJiMzOTs8
YnI+DQotK2Vsc2U8YnI+DQotK8KgIGNhc2UgJnF1b3Q7JGhvc3Rfb3MmcXVvdDsgaW48YnI+DQot
K8KgIMKgIGFpeCopPGJyPg0KLSvCoCDCoCDCoCB3bD0mIzM5Oy1XbCwmIzM5Ozxicj4NCi0rwqAg
wqAgwqAgOzs8YnI+DQotK8KgIMKgIG1pbmd3KiB8IHB3MzIqIHwgb3MyKik8YnI+DQotK8KgIMKg
IMKgIDs7PGJyPg0KLSvCoCDCoCBocHV4OSogfCBocHV4MTAqIHwgaHB1eDExKik8YnI+DQotK8Kg
IMKgIMKgIHdsPSYjMzk7LVdsLCYjMzk7PGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAg
aXJpeDUqIHwgaXJpeDYqIHwgbm9uc3RvcHV4Kik8YnI+DQotK8KgIMKgIMKgIHdsPSYjMzk7LVds
LCYjMzk7PGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgbmV3c29zNik8YnI+DQotK8Kg
IMKgIMKgIDs7PGJyPg0KLSvCoCDCoCBsaW51eCopPGJyPg0KLSvCoCDCoCDCoCBjYXNlICRDQyBp
bjxicj4NCi0rwqAgwqAgwqAgwqAgaWNjfGVjYyk8YnI+DQotK8KgIMKgIMKgIMKgIMKgIHdsPSYj
Mzk7LVdsLCYjMzk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgwqAgwqAg
Y2NjKTxicj4NCi0rwqAgwqAgwqAgwqAgwqAgd2w9JiMzOTstV2wsJiMzOTs8YnI+DQotK8KgIMKg
IMKgIMKgIMKgIDs7PGJyPg0KLSvCoCDCoCDCoCBlc2FjPGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4N
Ci0rwqAgwqAgb3NmMyogfCBvc2Y0KiB8IG9zZjUqKTxicj4NCi0rwqAgwqAgwqAgd2w9JiMzOTst
V2wsJiMzOTs8YnI+DQotK8KgIMKgIMKgIDs7PGJyPg0KLSvCoCDCoCBzY28zLjJ2NSopPGJyPg0K
LSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgc29sYXJpcyopPGJyPg0KLSvCoCDCoCDCoCB3bD0m
IzM5Oy1XbCwmIzM5Ozxicj4NCi0rwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKgIHN1bm9zNCopPGJy
Pg0KLSvCoCDCoCDCoCB3bD0mIzM5Oy1Rb3B0aW9uIGxkICYjMzk7PGJyPg0KLSvCoCDCoCDCoCA7
Ozxicj4NCi0rwqAgwqAgc3lzdjQgfCBzeXN2NC4ydXcyKiB8IHN5c3Y0LjMqIHwgc3lzdjUqKTxi
cj4NCi0rwqAgwqAgwqAgd2w9JiMzOTstV2wsJiMzOTs8YnI+DQotK8KgIMKgIMKgIDs7PGJyPg0K
LSvCoCDCoCBzeXN2NCpNUCopPGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgdXRzNCop
PGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAgZXNhYzxicj4NCi0rZmk8YnI+DQotKzxicj4N
Ci0rIyBDb2RlIHRha2VuIGZyb20gbGlidG9vbC5tNCYjMzk7cyBBQ19MSUJUT09MX1BST0dfTERf
U0hMSUJTLjxicj4NCi0rPGJyPg0KLStoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjPTxicj4NCi0r
aGFyZGNvZGVfbGliZGlyX3NlcGFyYXRvcj08YnI+DQotK2hhcmRjb2RlX2RpcmVjdD1ubzxicj4N
Ci0raGFyZGNvZGVfbWludXNfTD1ubzxicj4NCi0rPGJyPg0KLStjYXNlICZxdW90OyRob3N0X29z
JnF1b3Q7IGluPGJyPg0KLSvCoCBjeWd3aW4qIHwgbWluZ3cqIHwgcHczMiopPGJyPg0KLSvCoCDC
oCAjIEZJWE1FOiB0aGUgTVNWQysrIHBvcnQgaGFzbiYjMzk7dCBiZWVuIHRlc3RlZCBpbiBhIGxv
b29vbmcgdGltZTxicj4NCi0rwqAgwqAgIyBXaGVuIG5vdCB1c2luZyBnY2MsIHdlIGN1cnJlbnRs
eSBhc3N1bWUgdGhhdCB3ZSBhcmUgdXNpbmc8YnI+DQotK8KgIMKgICMgTWljcm9zb2Z0IFZpc3Vh
bCBDKysuPGJyPg0KLSvCoCDCoCBpZiB0ZXN0ICZxdW90OyRHQ0MmcXVvdDsgIT0geWVzOyB0aGVu
PGJyPg0KLSvCoCDCoCDCoCB3aXRoX2dudV9sZD1ubzxicj4NCi0rwqAgwqAgZmk8YnI+DQotK8Kg
IMKgIDs7PGJyPg0KLSvCoCBvcGVuYnNkKik8YnI+DQotK8KgIMKgIHdpdGhfZ251X2xkPW5vPGJy
Pg0KLSvCoCDCoCA7Ozxicj4NCi0rZXNhYzxicj4NCi0rPGJyPg0KLStsZF9zaGxpYnM9eWVzPGJy
Pg0KLStpZiB0ZXN0ICZxdW90OyR3aXRoX2dudV9sZCZxdW90OyA9IHllczsgdGhlbjxicj4NCi0r
wqAgY2FzZSAmcXVvdDskaG9zdF9vcyZxdW90OyBpbjxicj4NCi0rwqAgwqAgYWl4MyogfCBhaXg0
KiB8IGFpeDUqKTxicj4NCi0rwqAgwqAgwqAgIyBPbiBBSVgvUFBDLCB0aGUgR05VIGxpbmtlciBp
cyB2ZXJ5IGJyb2tlbjxicj4NCi0rwqAgwqAgwqAgaWYgdGVzdCAmcXVvdDskaG9zdF9jcHUmcXVv
dDsgIT0gaWE2NDsgdGhlbjxicj4NCi0rwqAgwqAgwqAgwqAgbGRfc2hsaWJzPW5vPGJyPg0KLSvC
oCDCoCDCoCBmaTxicj4NCi0rwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKgIGFtaWdhb3MqKTxicj4N
Ci0rwqAgwqAgwqAgaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYz0mIzM5Oy1MJDx3YnI+bGliZGly
JiMzOTs8YnI+DQotK8KgIMKgIMKgIGhhcmRjb2RlX21pbnVzX0w9eWVzPGJyPg0KLSvCoCDCoCDC
oCAjIFNhbXVlbCBBLiBGYWx2byBJSSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmtjNXRqYUBkb2xwaGlu
Lm9wZW5wcm9qZWN0cy5uZXQiPmtjNXRqYUBkb2xwaGluLm9wZW5wcm9qZWN0cy48d2JyPm5ldDwv
YT4mZ3Q7IHJlcG9ydHM8YnI+DQotK8KgIMKgIMKgICMgdGhhdCB0aGUgc2VtYW50aWNzIG9mIGR5
bmFtaWMgbGlicmFyaWVzIG9uIEFtaWdhT1MsIGF0IGxlYXN0IHVwPGJyPg0KLSvCoCDCoCDCoCAj
IHRvIHZlcnNpb24gNCwgaXMgdG8gc2hhcmUgZGF0YSBhbW9uZyBtdWx0aXBsZSBwcm9ncmFtcyBs
aW5rZWQ8YnI+DQotK8KgIMKgIMKgICMgd2l0aCB0aGUgc2FtZSBkeW5hbWljIGxpYnJhcnkuwqAg
U2luY2UgdGhpcyBkb2VzbiYjMzk7dCBtYXRjaCB0aGU8YnI+DQotK8KgIMKgIMKgICMgYmVoYXZp
b3Igb2Ygc2hhcmVkIGxpYnJhcmllcyBvbiBvdGhlciBwbGF0Zm9ybXMsIHdlIGNhbiB1c2U8YnI+
DQotK8KgIMKgIMKgICMgdGhlbS48YnI+DQotK8KgIMKgIMKgIGxkX3NobGlicz1ubzxicj4NCi0r
wqAgwqAgwqAgOzs8YnI+DQotK8KgIMKgIGJlb3MqKTxicj4NCi0rwqAgwqAgwqAgaWYgJExEIC0t
aGVscCAyJmd0OyZhbXA7MSB8IGdyZXAgJiMzOTs6IHN1cHBvcnRlZCB0YXJnZXRzOi4qIGVsZiYj
Mzk7ICZndDsgL2Rldi9udWxsOyB0aGVuPGJyPg0KLSvCoCDCoCDCoCDCoCA6PGJyPg0KLSvCoCDC
oCDCoCBlbHNlPGJyPg0KLSvCoCDCoCDCoCDCoCBsZF9zaGxpYnM9bm88YnI+DQotK8KgIMKgIMKg
IGZpPGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgY3lnd2luKiB8IG1pbmd3KiB8IHB3
MzIqKTxicj4NCi0rwqAgwqAgwqAgIyBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjIGlzIGFjdHVh
bGx5IG1lYW5pbmdsZXNzLCBhcyB0aGVyZSBpczxicj4NCi0rwqAgwqAgwqAgIyBubyBzZWFyY2gg
cGF0aCBmb3IgRExMcy48YnI+DQotK8KgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9
JiMzOTstTCQ8d2JyPmxpYmRpciYjMzk7PGJyPg0KLSvCoCDCoCDCoCBpZiAkTEQgLS1oZWxwIDIm
Z3Q7JmFtcDsxIHwgZ3JlcCAmIzM5O2F1dG8taW1wb3J0JiMzOTsgJmd0OyAvZGV2L251bGw7IHRo
ZW48YnI+DQotK8KgIMKgIMKgIMKgIDo8YnI+DQotK8KgIMKgIMKgIGVsc2U8YnI+DQotK8KgIMKg
IMKgIMKgIGxkX3NobGlicz1ubzxicj4NCi0rwqAgwqAgwqAgZmk8YnI+DQotK8KgIMKgIMKgIDs7
PGJyPg0KLSvCoCDCoCBuZXRic2QqKTxicj4NCi0rwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKgIHNv
bGFyaXMqIHwgc3lzdjUqKTxicj4NCi0rwqAgwqAgwqAgaWYgJExEIC12IDImZ3Q7JmFtcDsxIHwg
Z3JlcCAmIzM5O0JGRCAyXC44JiMzOTsgJmd0OyAvZGV2L251bGw7IHRoZW48YnI+DQotK8KgIMKg
IMKgIMKgIGxkX3NobGlicz1ubzxicj4NCi0rwqAgwqAgwqAgZWxpZiAkTEQgLS1oZWxwIDImZ3Q7
JmFtcDsxIHwgZ3JlcCAmIzM5Ozogc3VwcG9ydGVkIHRhcmdldHM6LiogZWxmJiMzOTsgJmd0OyAv
ZGV2L251bGw7IHRoZW48YnI+DQotK8KgIMKgIMKgIMKgIDo8YnI+DQotK8KgIMKgIMKgIGVsc2U8
YnI+DQotK8KgIMKgIMKgIMKgIGxkX3NobGlicz1ubzxicj4NCi0rwqAgwqAgwqAgZmk8YnI+DQot
K8KgIMKgIMKgIDs7PGJyPg0KLSvCoCDCoCBzdW5vczQqKTxicj4NCi0rwqAgwqAgwqAgaGFyZGNv
ZGVfZGlyZWN0PXllczxicj4NCi0rwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKgICopPGJyPg0KLSvC
oCDCoCDCoCBpZiAkTEQgLS1oZWxwIDImZ3Q7JmFtcDsxIHwgZ3JlcCAmIzM5Ozogc3VwcG9ydGVk
IHRhcmdldHM6LiogZWxmJiMzOTsgJmd0OyAvZGV2L251bGw7IHRoZW48YnI+DQotK8KgIMKgIMKg
IMKgIDo8YnI+DQotK8KgIMKgIMKgIGVsc2U8YnI+DQotK8KgIMKgIMKgIMKgIGxkX3NobGlicz1u
bzxicj4NCi0rwqAgwqAgwqAgZmk8YnI+DQotK8KgIMKgIMKgIDs7PGJyPg0KLSvCoCBlc2FjPGJy
Pg0KLSvCoCBpZiB0ZXN0ICZxdW90OyRsZF9zaGxpYnMmcXVvdDsgPSB5ZXM7IHRoZW48YnI+DQot
K8KgIMKgICMgVW5saWtlIGxpYnRvb2wsIHdlIHVzZSAtcnBhdGggaGVyZSwgbm90IC0tcnBhdGgs
IHNpbmNlIHRoZSBkb2N1bWVudGVkPGJyPg0KLSvCoCDCoCAjIG9wdGlvbiBvZiBHTlUgbGQgaXMg
Y2FsbGVkIC1ycGF0aCwgbm90IC0tcnBhdGguPGJyPg0KLSvCoCDCoCBoYXJkY29kZV9saWJkaXJf
ZmxhZ19zcGVjPSYjMzk7JHs8d2JyPndsfS1ycGF0aCAke3dsfSRsaWJkaXImIzM5Ozxicj4NCi0r
wqAgZmk8YnI+DQotK2Vsc2U8YnI+DQotK8KgIGNhc2UgJnF1b3Q7JGhvc3Rfb3MmcXVvdDsgaW48
YnI+DQotK8KgIMKgIGFpeDMqKTxicj4NCi0rwqAgwqAgwqAgIyBOb3RlOiB0aGlzIGxpbmtlciBo
YXJkY29kZXMgdGhlIGRpcmVjdG9yaWVzIGluIExJQlBBVEggaWYgdGhlcmU8YnI+DQotK8KgIMKg
IMKgICMgYXJlIG5vIGRpcmVjdG9yaWVzIHNwZWNpZmllZCBieSAtTC48YnI+DQotK8KgIMKgIMKg
IGhhcmRjb2RlX21pbnVzX0w9eWVzPGJyPg0KLSvCoCDCoCDCoCBpZiB0ZXN0ICZxdW90OyRHQ0Mm
cXVvdDsgPSB5ZXM7IHRoZW48YnI+DQotK8KgIMKgIMKgIMKgICMgTmVpdGhlciBkaXJlY3QgaGFy
ZGNvZGluZyBub3Igc3RhdGljIGxpbmtpbmcgaXMgc3VwcG9ydGVkIHdpdGggYTxicj4NCi0rwqAg
wqAgwqAgwqAgIyBicm9rZW4gY29sbGVjdDIuPGJyPg0KLSvCoCDCoCDCoCDCoCBoYXJkY29kZV9k
aXJlY3Q9dW5zdXBwb3J0ZWQ8YnI+DQotK8KgIMKgIMKgIGZpPGJyPg0KLSvCoCDCoCDCoCA7Ozxi
cj4NCi0rwqAgwqAgYWl4NCogfCBhaXg1Kik8YnI+DQotK8KgIMKgIMKgIGlmIHRlc3QgJnF1b3Q7
JGhvc3RfY3B1JnF1b3Q7ID0gaWE2NDsgdGhlbjxicj4NCi0rwqAgwqAgwqAgwqAgIyBPbiBJQTY0
LCB0aGUgbGlua2VyIGRvZXMgcnVuIHRpbWUgbGlua2luZyBieSBkZWZhdWx0LCBzbyB3ZSBkb24m
IzM5O3Q8YnI+DQotK8KgIMKgIMKgIMKgICMgaGF2ZSB0byBkbyBhbnl0aGluZyBzcGVjaWFsLjxi
cj4NCi0rwqAgwqAgwqAgwqAgYWl4X3VzZV9ydW50aW1lbGlua2luZz1ubzxicj4NCi0rwqAgwqAg
wqAgZWxzZTxicj4NCi0rwqAgwqAgwqAgwqAgYWl4X3VzZV9ydW50aW1lbGlua2luZz1ubzxicj4N
Ci0rwqAgwqAgwqAgwqAgIyBUZXN0IGlmIHdlIGFyZSB0cnlpbmcgdG8gdXNlIHJ1biB0aW1lIGxp
bmtpbmcgb3Igbm9ybWFsPGJyPg0KLSvCoCDCoCDCoCDCoCAjIEFJWCBzdHlsZSBsaW5raW5nLiBJ
ZiAtYnJ0bCBpcyBzb21ld2hlcmUgaW4gTERGTEFHUywgd2U8YnI+DQotK8KgIMKgIMKgIMKgICMg
bmVlZCB0byBkbyBydW50aW1lIGxpbmtpbmcuPGJyPg0KLSvCoCDCoCDCoCDCoCBjYXNlICRob3N0
X29zIGluIGFpeDQuWzIzXXxhaXg0LlsyM10uKnxhaXg1Kik8YnI+DQotK8KgIMKgIMKgIMKgIMKg
IGZvciBsZF9mbGFnIGluICRMREZMQUdTOyBkbzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgaWYg
KHRlc3QgJGxkX2ZsYWcgPSAmcXVvdDstYnJ0bCZxdW90OyB8fCB0ZXN0ICRsZF9mbGFnID0gJnF1
b3Q7LVdsLC1icnRsJnF1b3Q7KTsgdGhlbjxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgYWl4
X3VzZV9ydW50aW1lbGlua2luZz15ZXM8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFr
PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCBmaTxicj4NCi0rwqAgwqAgwqAgwqAgwqAgZG9uZTxi
cj4NCi0rwqAgwqAgwqAgwqAgZXNhYzxicj4NCi0rwqAgwqAgwqAgZmk8YnI+DQotK8KgIMKgIMKg
IGhhcmRjb2RlX2RpcmVjdD15ZXM8YnI+DQotK8KgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9zZXBh
cmF0b3I9JiMzOTs6JiMzOTs8YnI+DQotK8KgIMKgIMKgIGlmIHRlc3QgJnF1b3Q7JEdDQyZxdW90
OyA9IHllczsgdGhlbjxicj4NCi0rwqAgwqAgwqAgwqAgY2FzZSAkaG9zdF9vcyBpbiBhaXg0Llsw
MTJdfGFpeDQuWzAxMl0uKik8YnI+DQotK8KgIMKgIMKgIMKgIMKgIGNvbGxlY3QybmFtZT1gJHtD
Q30gLXByaW50LXByb2ctbmFtZT1jb2xsZWN0MmA8YnI+DQotK8KgIMKgIMKgIMKgIMKgIGlmIHRl
c3QgLWYgJnF1b3Q7JGNvbGxlY3QybmFtZSZxdW90OyAmYW1wOyZhbXA7IFw8YnI+DQotK8KgIMKg
IMKgIMKgIMKgIMKgIHN0cmluZ3MgJnF1b3Q7JGNvbGxlY3QybmFtZSZxdW90OyB8IGdyZXAgcmVz
b2x2ZV9saWJfbmFtZSAmZ3Q7L2Rldi9udWxsPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCB0aGVuPGJy
Pg0KLSvCoCDCoCDCoCDCoCDCoCDCoCAjIFdlIGhhdmUgcmV3b3JrZWQgY29sbGVjdDI8YnI+DQot
K8KgIMKgIMKgIMKgIMKgIMKgIGhhcmRjb2RlX2RpcmVjdD15ZXM8YnI+DQotK8KgIMKgIMKgIMKg
IMKgIGVsc2U8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgICMgV2UgaGF2ZSBvbGQgY29sbGVjdDI8
YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIGhhcmRjb2RlX2RpcmVjdD11bnN1cHBvcnRlZDxicj4N
Ci0rwqAgwqAgwqAgwqAgwqAgwqAgaGFyZGNvZGVfbWludXNfTD15ZXM8YnI+DQotK8KgIMKgIMKg
IMKgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JiMzOTstTCQ8d2JyPmxpYmRpciYj
Mzk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCBoYXJkY29kZV9saWJkaXJfc2VwYXJhdG9yPTxi
cj4NCi0rwqAgwqAgwqAgwqAgwqAgZmk8YnI+DQotK8KgIMKgIMKgIMKgIGVzYWM8YnI+DQotK8Kg
IMKgIMKgIGZpPGJyPg0KLSvCoCDCoCDCoCAjIEJlZ2luIF9MVF9BQ19TWVNfTElCUEFUSF9BSVgu
PGJyPg0KLSvCoCDCoCDCoCBlY2hvICYjMzk7aW50IG1haW4gKCkgeyByZXR1cm4gMDsgfSYjMzk7
ICZndDsgY29uZnRlc3QuYzxicj4NCi0rwqAgwqAgwqAgJHtDQ30gJHtMREZMQUdTfSBjb25mdGVz
dC5jIC1vIGNvbmZ0ZXN0PGJyPg0KLSvCoCDCoCDCoCBhaXhfbGlicGF0aD1gZHVtcCAtSCBjb25m
dGVzdCAyJmd0Oy9kZXYvbnVsbCB8IHNlZCAtbiAtZSAmIzM5Oy9JbXBvcnQgRmlsZSBTdHJpbmdz
LywvXiQvIHsgL14wLyB7IHMvXjDCoCAqXCguKlwpJC9cMS87IHA7IH08YnI+DQotK30mIzM5O2A8
YnI+DQotK8KgIMKgIMKgIGlmIHRlc3QgLXogJnF1b3Q7JGFpeF9saWJwYXRoJnF1b3Q7OyB0aGVu
PGJyPg0KLSvCoCDCoCDCoCDCoCBhaXhfbGlicGF0aD1gZHVtcCAtSFg2NCBjb25mdGVzdCAyJmd0
Oy9kZXYvbnVsbCB8IHNlZCAtbiAtZSAmIzM5Oy9JbXBvcnQgRmlsZSBTdHJpbmdzLywvXiQvIHsg
L14wLyB7IHMvXjDCoCAqXCguKlwpJC9cMS87IHA7IH08YnI+DQotK30mIzM5O2A8YnI+DQotK8Kg
IMKgIMKgIGZpPGJyPg0KLSvCoCDCoCDCoCBpZiB0ZXN0IC16ICZxdW90OyRhaXhfbGlicGF0aCZx
dW90OzsgdGhlbjxicj4NCi0rwqAgwqAgwqAgwqAgYWl4X2xpYnBhdGg9JnF1b3Q7L3Vzci9saWI6
L2xpYiZxdW90Ozxicj4NCi0rwqAgwqAgwqAgZmk8YnI+DQotK8KgIMKgIMKgIHJtIC1mIGNvbmZ0
ZXN0LmMgY29uZnRlc3Q8YnI+DQotK8KgIMKgIMKgICMgRW5kIF9MVF9BQ19TWVNfTElCUEFUSF9B
SVguPGJyPg0KLSvCoCDCoCDCoCBpZiB0ZXN0ICZxdW90OyRhaXhfdXNlX3J1bnRpbWVsaW5raW5n
JnF1b3Q7ID0geWVzOyB0aGVuPGJyPg0KLSvCoCDCoCDCoCDCoCBoYXJkY29kZV9saWJkaXJfZmxh
Z19zcGVjPSYjMzk7JHs8d2JyPndsfS1ibGlicGF0aDokbGliZGlyOiYjMzk7JnF1b3Q7JGFpeF88
d2JyPmxpYnBhdGgmcXVvdDs8YnI+DQotK8KgIMKgIMKgIGVsc2U8YnI+DQotK8KgIMKgIMKgIMKg
IGlmIHRlc3QgJnF1b3Q7JGhvc3RfY3B1JnF1b3Q7ID0gaWE2NDsgdGhlbjxicj4NCi0rwqAgwqAg
wqAgwqAgwqAgaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYz0mIzM5OyR7PHdicj53bH0tUiAkbGli
ZGlyOi91c3IvbGliOi9saWImIzM5Ozxicj4NCi0rwqAgwqAgwqAgwqAgZWxzZTxicj4NCi0rwqAg
wqAgwqAgwqAgwqAgaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYz0mIzM5OyR7PHdicj53bH0tYmxp
YnBhdGg6JGxpYmRpcjomIzM5OyZxdW90OyRhaXhfPHdicj5saWJwYXRoJnF1b3Q7PGJyPg0KLSvC
oCDCoCDCoCDCoCBmaTxicj4NCi0rwqAgwqAgwqAgZmk8YnI+DQotK8KgIMKgIMKgIDs7PGJyPg0K
LSvCoCDCoCBhbWlnYW9zKik8YnI+DQotK8KgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3Nw
ZWM9JiMzOTstTCQ8d2JyPmxpYmRpciYjMzk7PGJyPg0KLSvCoCDCoCDCoCBoYXJkY29kZV9taW51
c19MPXllczxicj4NCi0rwqAgwqAgwqAgIyBzZWUgY29tbWVudCBhYm91dCBkaWZmZXJlbnQgc2Vt
YW50aWNzIG9uIHRoZSBHTlUgbGQgc2VjdGlvbjxicj4NCi0rwqAgwqAgwqAgbGRfc2hsaWJzPW5v
PGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgYnNkaTQqKTxicj4NCi0rwqAgwqAgwqAg
Ozs8YnI+DQotK8KgIMKgIGN5Z3dpbiogfCBtaW5ndyogfCBwdzMyKik8YnI+DQotK8KgIMKgIMKg
ICMgV2hlbiBub3QgdXNpbmcgZ2NjLCB3ZSBjdXJyZW50bHkgYXNzdW1lIHRoYXQgd2UgYXJlIHVz
aW5nPGJyPg0KLSvCoCDCoCDCoCAjIE1pY3Jvc29mdCBWaXN1YWwgQysrLjxicj4NCi0rwqAgwqAg
wqAgIyBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjIGlzIGFjdHVhbGx5IG1lYW5pbmdsZXNzLCBh
cyB0aGVyZSBpczxicj4NCi0rwqAgwqAgwqAgIyBubyBzZWFyY2ggcGF0aCBmb3IgRExMcy48YnI+
DQotK8KgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JiMzOTsgJiMzOTs8YnI+DQot
K8KgIMKgIMKgIGxpYmV4dD1saWI8YnI+DQotK8KgIMKgIMKgIDs7PGJyPg0KLSvCoCDCoCBkYXJ3
aW4qIHwgcmhhcHNvZHkqKTxicj4NCi0rwqAgwqAgwqAgaWYgJENDIC12IDImZ3Q7JmFtcDsxIHwg
Z3JlcCAmIzM5O0FwcGxlJiMzOTsgJmd0Oy9kZXYvbnVsbCA7IHRoZW48YnI+DQotK8KgIMKgIMKg
IMKgIGhhcmRjb2RlX2RpcmVjdD1ubzxicj4NCi0rwqAgwqAgwqAgZmk8YnI+DQotK8KgIMKgIMKg
IDs7PGJyPg0KLSvCoCDCoCBkZ3V4Kik8YnI+DQotK8KgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9m
bGFnX3NwZWM9JiMzOTstTCQ8d2JyPmxpYmRpciYjMzk7PGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4N
Ci0rwqAgwqAgZnJlZWJzZDEqKTxicj4NCi0rwqAgwqAgwqAgbGRfc2hsaWJzPW5vPGJyPg0KLSvC
oCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgZnJlZWJzZDIuMiopPGJyPg0KLSvCoCDCoCDCoCBoYXJk
Y29kZV9saWJkaXJfZmxhZ19zcGVjPSYjMzk7LVIkPHdicj5saWJkaXImIzM5Ozxicj4NCi0rwqAg
wqAgwqAgaGFyZGNvZGVfZGlyZWN0PXllczxicj4NCi0rwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKg
IGZyZWVic2QyKik8YnI+DQotK8KgIMKgIMKgIGhhcmRjb2RlX2RpcmVjdD15ZXM8YnI+DQotK8Kg
IMKgIMKgIGhhcmRjb2RlX21pbnVzX0w9eWVzPGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAg
wqAgZnJlZWJzZCopPGJyPg0KLSvCoCDCoCDCoCBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjPSYj
Mzk7LVIkPHdicj5saWJkaXImIzM5Ozxicj4NCi0rwqAgwqAgwqAgaGFyZGNvZGVfZGlyZWN0PXll
czxicj4NCi0rwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKgIGhwdXg5Kik8YnI+DQotK8KgIMKgIMKg
IGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JiMzOTskezx3YnI+d2x9K2IgJHt3bH0kbGliZGly
JiMzOTs8YnI+DQotK8KgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9zZXBhcmF0b3I9Ojxicj4NCi0r
wqAgwqAgwqAgaGFyZGNvZGVfZGlyZWN0PXllczxicj4NCi0rwqAgwqAgwqAgIyBoYXJkY29kZV9t
aW51c19MOiBOb3QgcmVhbGx5IGluIHRoZSBzZWFyY2ggUEFUSCw8YnI+DQotK8KgIMKgIMKgICMg
YnV0IGFzIHRoZSBkZWZhdWx0IGxvY2F0aW9uIG9mIHRoZSBsaWJyYXJ5Ljxicj4NCi0rwqAgwqAg
wqAgaGFyZGNvZGVfbWludXNfTD15ZXM8YnI+DQotK8KgIMKgIMKgIDs7PGJyPg0KLSvCoCDCoCBo
cHV4MTAqIHwgaHB1eDExKik8YnI+DQotK8KgIMKgIMKgIGlmIHRlc3QgJnF1b3Q7JHdpdGhfZ251
X2xkJnF1b3Q7ID0gbm87IHRoZW48YnI+DQotK8KgIMKgIMKgIMKgIGNhc2UgJnF1b3Q7JGhvc3Rf
Y3B1JnF1b3Q7IGluPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCBocHBhKjY0Kik8YnI+DQotK8KgIMKg
IMKgIMKgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JiMzOTskezx3YnI+d2x9K2Ig
JHt3bH0kbGliZGlyJiMzOTs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIGhhcmRjb2RlX2xpYmRp
cl9zZXBhcmF0b3I9Ojxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgaGFyZGNvZGVfZGlyZWN0PW5v
PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgwqAgwqAgwqAgaWE2NCop
PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjPSYjMzk7
LUwkPHdicj5saWJkaXImIzM5Ozxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgaGFyZGNvZGVfZGly
ZWN0PW5vPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCAjIGhhcmRjb2RlX21pbnVzX0w6IE5vdCBy
ZWFsbHkgaW4gdGhlIHNlYXJjaCBQQVRILDxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgIyBidXQg
YXMgdGhlIGRlZmF1bHQgbG9jYXRpb24gb2YgdGhlIGxpYnJhcnkuPGJyPg0KLSvCoCDCoCDCoCDC
oCDCoCDCoCBoYXJkY29kZV9taW51c19MPXllczxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgOzs8
YnI+DQotK8KgIMKgIMKgIMKgIMKgICopPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCBoYXJkY29k
ZV9saWJkaXJfZmxhZ19zcGVjPSYjMzk7JHs8d2JyPndsfStiICR7d2x9JGxpYmRpciYjMzk7PGJy
Pg0KLSvCoCDCoCDCoCDCoCDCoCDCoCBoYXJkY29kZV9saWJkaXJfc2VwYXJhdG9yPTo8YnI+DQot
K8KgIMKgIMKgIMKgIMKgIMKgIGhhcmRjb2RlX2RpcmVjdD15ZXM8YnI+DQotK8KgIMKgIMKgIMKg
IMKgIMKgICMgaGFyZGNvZGVfbWludXNfTDogTm90IHJlYWxseSBpbiB0aGUgc2VhcmNoIFBBVEgs
PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCAjIGJ1dCBhcyB0aGUgZGVmYXVsdCBsb2NhdGlvbiBv
ZiB0aGUgbGlicmFyeS48YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIGhhcmRjb2RlX21pbnVzX0w9
eWVzPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgwqAgwqAgZXNhYzxi
cj4NCi0rwqAgwqAgwqAgZmk8YnI+DQotK8KgIMKgIMKgIDs7PGJyPg0KLSvCoCDCoCBpcml4NSog
fCBpcml4NiogfCBub25zdG9wdXgqKTxicj4NCi0rwqAgwqAgwqAgaGFyZGNvZGVfbGliZGlyX2Zs
YWdfc3BlYz0mIzM5OyR7PHdicj53bH0tcnBhdGggJHt3bH0kbGliZGlyJiMzOTs8YnI+DQotK8Kg
IMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9zZXBhcmF0b3I9Ojxicj4NCi0rwqAgwqAgwqAgOzs8YnI+
DQotK8KgIMKgIG5ldGJzZCopPGJyPg0KLSvCoCDCoCDCoCBoYXJkY29kZV9saWJkaXJfZmxhZ19z
cGVjPSYjMzk7LVIkPHdicj5saWJkaXImIzM5Ozxicj4NCi0rwqAgwqAgwqAgaGFyZGNvZGVfZGly
ZWN0PXllczxicj4NCi0rwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKgIG5ld3NvczYpPGJyPg0KLSvC
oCDCoCDCoCBoYXJkY29kZV9kaXJlY3Q9eWVzPGJyPg0KLSvCoCDCoCDCoCBoYXJkY29kZV9saWJk
aXJfZmxhZ19zcGVjPSYjMzk7JHs8d2JyPndsfS1ycGF0aCAke3dsfSRsaWJkaXImIzM5Ozxicj4N
Ci0rwqAgwqAgwqAgaGFyZGNvZGVfbGliZGlyX3NlcGFyYXRvcj06PGJyPg0KLSvCoCDCoCDCoCA7
Ozxicj4NCi0rwqAgwqAgb3BlbmJzZCopPGJyPg0KLSvCoCDCoCDCoCBoYXJkY29kZV9kaXJlY3Q9
eWVzPGJyPg0KLSvCoCDCoCDCoCBpZiB0ZXN0IC16ICZxdW90O2BlY2hvIF9fRUxGX18gfCAkQ0Mg
LUUgLSB8IGdyZXAgX19FTEZfX2AmcXVvdDsgfHwgdGVzdCAmcXVvdDskaG9zdF9vcy0kaG9zdF9j
cHUmcXVvdDsgPSAmcXVvdDtvcGVuYnNkMi44LXBvd2VycGMmcXVvdDs7IHRoZW48YnI+DQotK8Kg
IMKgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JiMzOTskezx3YnI+d2x9LXJwYXRo
LCRsaWJkaXImIzM5Ozxicj4NCi0rwqAgwqAgwqAgZWxzZTxicj4NCi0rwqAgwqAgwqAgwqAgY2Fz
ZSAmcXVvdDskaG9zdF9vcyZxdW90OyBpbjxicj4NCi0rwqAgwqAgwqAgwqAgwqAgb3BlbmJzZFsw
MV0uKiB8IG9wZW5ic2QyLlswLTddIHwgb3BlbmJzZDIuWzAtN10uKik8YnI+DQotK8KgIMKgIMKg
IMKgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JiMzOTstUiQ8d2JyPmxpYmRpciYj
Mzk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgwqAgwqAgwqAgKik8
YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JiMzOTsk
ezx3YnI+d2x9LXJwYXRoLCRsaWJkaXImIzM5Ozxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgOzs8
YnI+DQotK8KgIMKgIMKgIMKgIGVzYWM8YnI+DQotK8KgIMKgIMKgIGZpPGJyPg0KLSvCoCDCoCDC
oCA7Ozxicj4NCi0rwqAgwqAgb3MyKik8YnI+DQotK8KgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9m
bGFnX3NwZWM9JiMzOTstTCQ8d2JyPmxpYmRpciYjMzk7PGJyPg0KLSvCoCDCoCDCoCBoYXJkY29k
ZV9taW51c19MPXllczxicj4NCi0rwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKgIG9zZjMqKTxicj4N
Ci0rwqAgwqAgwqAgaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYz0mIzM5OyR7PHdicj53bH0tcnBh
dGggJHt3bH0kbGliZGlyJiMzOTs8YnI+DQotK8KgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9zZXBh
cmF0b3I9Ojxicj4NCi0rwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKgIG9zZjQqIHwgb3NmNSopPGJy
Pg0KLSvCoCDCoCDCoCBpZiB0ZXN0ICZxdW90OyRHQ0MmcXVvdDsgPSB5ZXM7IHRoZW48YnI+DQot
K8KgIMKgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JiMzOTskezx3YnI+d2x9LXJw
YXRoICR7d2x9JGxpYmRpciYjMzk7PGJyPg0KLSvCoCDCoCDCoCBlbHNlPGJyPg0KLSvCoCDCoCDC
oCDCoCAjIEJvdGggY2MgYW5kIGN4eCBjb21waWxlciBzdXBwb3J0IC1ycGF0aCBkaXJlY3RseTxi
cj4NCi0rwqAgwqAgwqAgwqAgaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYz0mIzM5Oy08d2JyPnJw
YXRoICRsaWJkaXImIzM5Ozxicj4NCi0rwqAgwqAgwqAgZmk8YnI+DQotK8KgIMKgIMKgIGhhcmRj
b2RlX2xpYmRpcl9zZXBhcmF0b3I9Ojxicj4NCi0rwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKgIHNj
bzMuMnY1Kik8YnI+DQotK8KgIMKgIMKgIDs7PGJyPg0KLSvCoCDCoCBzb2xhcmlzKik8YnI+DQot
K8KgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JiMzOTstUiQ8d2JyPmxpYmRpciYj
Mzk7PGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgc3Vub3M0Kik8YnI+DQotK8KgIMKg
IMKgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JiMzOTstTCQ8d2JyPmxpYmRpciYjMzk7PGJy
Pg0KLSvCoCDCoCDCoCBoYXJkY29kZV9kaXJlY3Q9eWVzPGJyPg0KLSvCoCDCoCDCoCBoYXJkY29k
ZV9taW51c19MPXllczxicj4NCi0rwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKgIHN5c3Y0KTxicj4N
Ci0rwqAgwqAgwqAgY2FzZSAkaG9zdF92ZW5kb3IgaW48YnI+DQotK8KgIMKgIMKgIMKgIHNuaSk8
YnI+DQotK8KgIMKgIMKgIMKgIMKgIGhhcmRjb2RlX2RpcmVjdD15ZXMgIyBpcyB0aGlzIHJlYWxs
eSB0cnVlPz8/PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgwqAgwqAgc2ll
bWVucyk8YnI+DQotK8KgIMKgIMKgIMKgIMKgIGhhcmRjb2RlX2RpcmVjdD1ubzxicj4NCi0rwqAg
wqAgwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKgIMKgIMKgIG1vdG9yb2xhKTxicj4NCi0rwqAgwqAg
wqAgwqAgwqAgaGFyZGNvZGVfZGlyZWN0PW5vICNNb3Rvcm9sYSBtYW51YWwgc2F5cyB5ZXMsIGJ1
dCBteSB0ZXN0cyBzYXkgdGhleSBsaWU8YnI+DQotK8KgIMKgIMKgIMKgIMKgIDs7PGJyPg0KLSvC
oCDCoCDCoCBlc2FjPGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgc3lzdjQuMyopPGJy
Pg0KLSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgc3lzdjQqTVAqKTxicj4NCi0rwqAgwqAgwqAg
aWYgdGVzdCAtZCAvdXNyL25lYzsgdGhlbjxicj4NCi0rwqAgwqAgwqAgwqAgbGRfc2hsaWJzPXll
czxicj4NCi0rwqAgwqAgwqAgZmk8YnI+DQotK8KgIMKgIMKgIDs7PGJyPg0KLSvCoCDCoCBzeXN2
NC4ydXcyKik8YnI+DQotK8KgIMKgIMKgIGhhcmRjb2RlX2RpcmVjdD15ZXM8YnI+DQotK8KgIMKg
IMKgIGhhcmRjb2RlX21pbnVzX0w9bm88YnI+DQotK8KgIMKgIMKgIDs7PGJyPg0KLSvCoCDCoCBz
eXN2NU9wZW5VTklYOCogfCBzeXN2NVVuaXhXYXJlNyogfMKgIHN5c3Y1dXdbNzhdKiB8IHVuaXh3
YXJlNyopPGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgc3lzdjUqKTxicj4NCi0rwqAg
wqAgwqAgaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYz08YnI+DQotK8KgIMKgIMKgIDs7PGJyPg0K
LSvCoCDCoCB1dHM0Kik8YnI+DQotK8KgIMKgIMKgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9
JiMzOTstTCQ8d2JyPmxpYmRpciYjMzk7PGJyPg0KLSvCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAg
Kik8YnI+DQotK8KgIMKgIMKgIGxkX3NobGlicz1ubzxicj4NCi0rwqAgwqAgwqAgOzs8YnI+DQot
K8KgIGVzYWM8YnI+DQotK2ZpPGJyPg0KLSs8YnI+DQotKyMgQ2hlY2sgZHluYW1pYyBsaW5rZXIg
Y2hhcmFjdGVyaXN0aWNzPGJyPg0KLSsjIENvZGUgdGFrZW4gZnJvbSBsaWJ0b29sLm00JiMzOTtz
IEFDX0xJQlRPT0xfU1lTX0RZTkFNSUNfTElOS0VSLjxicj4NCi0rbGlibmFtZV9zcGVjPSYjMzk7
bGliJG5hbWUmIzM5Ozxicj4NCi0rY2FzZSAmcXVvdDskaG9zdF9vcyZxdW90OyBpbjxicj4NCi0r
wqAgYWl4MyopPGJyPg0KLSvCoCDCoCA7Ozxicj4NCi0rwqAgYWl4NCogfCBhaXg1Kik8YnI+DQot
K8KgIMKgIDs7PGJyPg0KLSvCoCBhbWlnYW9zKik8YnI+DQotK8KgIMKgIDs7PGJyPg0KLSvCoCBi
ZW9zKik8YnI+DQotK8KgIMKgIDs7PGJyPg0KLSvCoCBic2RpNCopPGJyPg0KLSvCoCDCoCA7Ozxi
cj4NCi0rwqAgY3lnd2luKiB8IG1pbmd3KiB8IHB3MzIqKTxicj4NCi0rwqAgwqAgc2hyZXh0PS5k
bGw8YnI+DQotK8KgIMKgIDs7PGJyPg0KLSvCoCBkYXJ3aW4qIHwgcmhhcHNvZHkqKTxicj4NCi0r
wqAgwqAgc2hyZXh0PS5keWxpYjxicj4NCi0rwqAgwqAgOzs8YnI+DQotK8KgIGRndXgqKTxicj4N
Ci0rwqAgwqAgOzs8YnI+DQotK8KgIGZyZWVic2QxKik8YnI+DQotK8KgIMKgIDs7PGJyPg0KLSvC
oCBmcmVlYnNkKik8YnI+DQotK8KgIMKgIDs7PGJyPg0KLSvCoCBnbnUqKTxicj4NCi0rwqAgwqAg
Ozs8YnI+DQotK8KgIGhwdXg5KiB8IGhwdXgxMCogfCBocHV4MTEqKTxicj4NCi0rwqAgwqAgY2Fz
ZSAmcXVvdDskaG9zdF9jcHUmcXVvdDsgaW48YnI+DQotK8KgIMKgIMKgIGlhNjQqKTxicj4NCi0r
wqAgwqAgwqAgwqAgc2hyZXh0PS5zbzxicj4NCi0rwqAgwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKg
IMKgIGhwcGEqNjQqKTxicj4NCi0rwqAgwqAgwqAgwqAgc2hyZXh0PS5zbDxicj4NCi0rwqAgwqAg
wqAgwqAgOzs8YnI+DQotK8KgIMKgIMKgICopPGJyPg0KLSvCoCDCoCDCoCDCoCBzaHJleHQ9LnNs
PGJyPg0KLSvCoCDCoCDCoCDCoCA7Ozxicj4NCi0rwqAgwqAgZXNhYzxicj4NCi0rwqAgwqAgOzs8
YnI+DQotK8KgIGlyaXg1KiB8IGlyaXg2KiB8IG5vbnN0b3B1eCopPGJyPg0KLSvCoCDCoCBjYXNl
ICZxdW90OyRob3N0X29zJnF1b3Q7IGluPGJyPg0KLSvCoCDCoCDCoCBpcml4NSogfCBub25zdG9w
dXgqKTxicj4NCi0rwqAgwqAgwqAgwqAgbGlic3VmZj0gc2hsaWJzdWZmPTxicj4NCi0rwqAgwqAg
wqAgwqAgOzs8YnI+DQotK8KgIMKgIMKgICopPGJyPg0KLSvCoCDCoCDCoCDCoCBjYXNlICRMRCBp
bjxicj4NCi0rwqAgwqAgwqAgwqAgwqAgKi0zMnwqJnF1b3Q7LTMyICZxdW90O3wqLW1lbGYzMmJz
bWlwfComcXVvdDstbWVsZjMyYnNtaXAgJnF1b3Q7KSBsaWJzdWZmPSBzaGxpYnN1ZmY9IDs7PGJy
Pg0KLSvCoCDCoCDCoCDCoCDCoCAqLW4zMnwqJnF1b3Q7LW4zMiAmcXVvdDt8Ki1tZWxmMzJibWlw
bjMyfComcXVvdDstPHdicj5tZWxmMzJibWlwbjMyICZxdW90OykgbGlic3VmZj0zMiBzaGxpYnN1
ZmY9TjMyIDs7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCAqLTY0fComcXVvdDstNjQgJnF1b3Q7fCot
bWVsZjY0Ym1pcHwqJnF1b3Q7LW1lbGY2NGJtaXAgJnF1b3Q7KSBsaWJzdWZmPTY0IHNobGlic3Vm
Zj02NCA7Ozxicj4NCi0rwqAgwqAgwqAgwqAgwqAgKikgbGlic3VmZj0gc2hsaWJzdWZmPSA7Ozxi
cj4NCi0rwqAgwqAgwqAgwqAgZXNhYzxicj4NCi0rwqAgwqAgwqAgwqAgOzs8YnI+DQotK8KgIMKg
IGVzYWM8YnI+DQotK8KgIMKgIDs7PGJyPg0KLSvCoCBsaW51eCpvbGRsZCogfCBsaW51eCphb3V0
KiB8IGxpbnV4KmNvZmYqKTxicj4NCi0rwqAgwqAgOzs8YnI+DQotK8KgIGxpbnV4Kik8YnI+DQot
K8KgIMKgIDs7PGJyPg0KLSvCoCBuZXRic2QqKTxicj4NCi0rwqAgwqAgOzs8YnI+DQotK8KgIG5l
d3NvczYpPGJyPg0KLSvCoCDCoCA7Ozxicj4NCi0rwqAgbnRvLXFueCk8YnI+DQotK8KgIMKgIDs7
PGJyPg0KLSvCoCBvcGVuYnNkKik8YnI+DQotK8KgIMKgIDs7PGJyPg0KLSvCoCBvczIqKTxicj4N
Ci0rwqAgwqAgbGlibmFtZV9zcGVjPSYjMzk7JG5hbWUmIzM5Ozxicj4NCi0rwqAgwqAgc2hyZXh0
PS5kbGw8YnI+DQotK8KgIMKgIDs7PGJyPg0KLSvCoCBvc2YzKiB8IG9zZjQqIHwgb3NmNSopPGJy
Pg0KLSvCoCDCoCA7Ozxicj4NCi0rwqAgc2NvMy4ydjUqKTxicj4NCi0rwqAgwqAgOzs8YnI+DQot
K8KgIHNvbGFyaXMqKTxicj4NCi0rwqAgwqAgOzs8YnI+DQotK8KgIHN1bm9zNCopPGJyPg0KLSvC
oCDCoCA7Ozxicj4NCi0rwqAgc3lzdjQgfCBzeXN2NC4ydXcyKiB8IHN5c3Y0LjMqIHwgc3lzdjUq
KTxicj4NCi0rwqAgwqAgOzs8YnI+DQotK8KgIHN5c3Y0Kk1QKik8YnI+DQotK8KgIMKgIDs7PGJy
Pg0KLSvCoCB1dHM0Kik8YnI+DQotK8KgIMKgIDs7PGJyPg0KLStlc2FjPGJyPg0KLSs8YnI+DQot
K3NlZF9xdW90ZV9zdWJzdD0mIzM5O3MvXChbJnF1b3Q7YCRcXF08d2JyPlwpL1xcXDEvZyYjMzk7
PGJyPg0KLStlc2NhcGVkX3dsPWBlY2hvICZxdW90O1gkd2wmcXVvdDsgfCBzZWQgLWUgJiMzOTtz
L15YLy8mIzM5OyAtZSAmcXVvdDskc2VkX3F1b3RlX3N1YnN0JnF1b3Q7YDxicj4NCi0rc2hsaWJl
eHQ9YGVjaG8gJnF1b3Q7JHNocmV4dCZxdW90OyB8IHNlZCAtZSAmIzM5O3MsXlwuLCwmIzM5O2A8
YnI+DQotK2VzY2FwZWRfaGFyZGNvZGVfbGliZGlyXzx3YnI+ZmxhZ19zcGVjPWBlY2hvICZxdW90
O1gkaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYyZxdW90OyB8IHNlZCAtZSAmIzM5O3MvXlgvLyYj
Mzk7IC1lICZxdW90OyRzZWRfcXVvdGVfc3Vic3QmcXVvdDtgPGJyPg0KLSs8YnI+DQotK3NlZCAt
ZSAmIzM5O3MvXlwoW2EtekEtWjAtOV9dKlwpPS9hY2xfY3ZfPHdicj5cMT0vJiMzOTsgJmx0OyZs
dDtFT0Y8YnI+DQotKzxicj4NCi0rIyBIb3cgdG8gcGFzcyBhIGxpbmtlciBmbGFnIHRocm91Z2gg
dGhlIGNvbXBpbGVyLjxicj4NCi0rd2w9JnF1b3Q7JGVzY2FwZWRfd2wmcXVvdDs8YnI+DQotKzxi
cj4NCi0rIyBTdGF0aWMgbGlicmFyeSBzdWZmaXggKG5vcm1hbGx5ICZxdW90O2EmcXVvdDspLjxi
cj4NCi0rbGliZXh0PSZxdW90OyRsaWJleHQmcXVvdDs8YnI+DQotKzxicj4NCi0rIyBTaGFyZWQg
bGlicmFyeSBzdWZmaXggKG5vcm1hbGx5ICZxdW90O3NvJnF1b3Q7KS48YnI+DQotK3NobGliZXh0
PSZxdW90OyRzaGxpYmV4dCZxdW90Ozxicj4NCi0rPGJyPg0KLSsjIEZsYWcgdG8gaGFyZGNvZGUg
XCRsaWJkaXIgaW50byBhIGJpbmFyeSBkdXJpbmcgbGlua2luZy48YnI+DQotKyMgVGhpcyBtdXN0
IHdvcmsgZXZlbiBpZiBcJGxpYmRpciBkb2VzIG5vdCBleGlzdC48YnI+DQotK2hhcmRjb2RlX2xp
YmRpcl9mbGFnX3NwZWM9JnF1b3Q7JDx3YnI+ZXNjYXBlZF9oYXJkY29kZV9saWJkaXJfZmxhZ188
d2JyPnNwZWMmcXVvdDs8YnI+DQotKzxicj4NCi0rIyBXaGV0aGVyIHdlIG5lZWQgYSBzaW5nbGUg
LXJwYXRoIGZsYWcgd2l0aCBhIHNlcGFyYXRlZCBhcmd1bWVudC48YnI+DQotK2hhcmRjb2RlX2xp
YmRpcl9zZXBhcmF0b3I9JnF1b3Q7JDx3YnI+aGFyZGNvZGVfbGliZGlyX3NlcGFyYXRvciZxdW90
Ozxicj4NCi0rPGJyPg0KLSsjIFNldCB0byB5ZXMgaWYgdXNpbmcgRElSL2xpYk5BTUUuc28gZHVy
aW5nIGxpbmtpbmcgaGFyZGNvZGVzIERJUiBpbnRvIHRoZTxicj4NCi0rIyByZXN1bHRpbmcgYmlu
YXJ5Ljxicj4NCi0raGFyZGNvZGVfZGlyZWN0PSZxdW90OyRoYXJkY29kZV88d2JyPmRpcmVjdCZx
dW90Ozxicj4NCi0rPGJyPg0KLSsjIFNldCB0byB5ZXMgaWYgdXNpbmcgdGhlIC1MRElSIGZsYWcg
ZHVyaW5nIGxpbmtpbmcgaGFyZGNvZGVzIERJUiBpbnRvIHRoZTxicj4NCi0rIyByZXN1bHRpbmcg
YmluYXJ5Ljxicj4NCi0raGFyZGNvZGVfbWludXNfTD0mcXVvdDskaGFyZGNvZGVfPHdicj5taW51
c19MJnF1b3Q7PGJyPg0KLSs8YnI+DQotK0VPRjxicj4NCi0tLS0gbHJ6c3otMC4xMi4yMC5zYWZl
LzxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmNvbmZpZ3VyZS48d2JyPmluPC9hPsKgIMKgIDIwMDQtMDktMTIgMTQ6Mzk6NTUuMTYx
NzA2NDg4IC0wNDAwPGJyPg0KLSsrKyBscnpzei0wLjEyLjIwLzxhIGhyZWY9Imh0dHA6Ly9jb25m
aWd1cmUuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmNvbmZpZ3VyZS5pbjwv
YT4gMjAwNC0wOS0xMiAxNDo0MDozNS44MTY1MjYwMTYgLTA0MDA8YnI+DQotQEAgLTI2MCwxMSAr
MjYwLDEwIEBAPGJyPg0KLSBBTV9HTlVfR0VUVEVYVDxicj4NCi08YnI+DQotIEFDX0RFRklORV9V
TlFVT1RFRChMT0NBTEVESVIsJnF1b3Q7PHdicj4kcHJlZml4LyREQVRBRElSTkFNRSZxdW90Oyk8
YnI+DQotLUFDX0xJTktfRklMRVMoJG5sc19jdl88d2JyPmhlYWRlcl9saWJndCwgJG5sc19jdl9o
ZWFkZXJfaW50bCk8YnI+DQotPGJyPg0KLS1BQ19PVVRQVVQoW01ha2VmaWxlIGludGwvTWFrZWZp
bGUgbGliL01ha2VmaWxlIHRlc3RzdWl0ZS9NYWtlZmlsZSBcPGJyPg0KLStBQ19PVVRQVVQoW01h
a2VmaWxlIGludGwvTWFrZWZpbGUgbGliL01ha2VmaWxlIHRlc3RzdWl0ZS9NYWtlZmlsZcKgIG00
L01ha2VmaWxlIFw8YnI+DQotIG1hbi9NYWtlZmlsZSBwby9NYWtlZmlsZS5pbiBzcmMvTWFrZWZp
bGUgZGViaWFuL3J1bGVzIFNwZWNmaWxlIHN5c3R5cGUgXDxicj4NCi0gc3JjL2xyenN6YnVnXSw8
YnI+DQotLVtzZWQgLWUgJnF1b3Q7L1BPVEZJTEVTID0vciBwby9QT1RGSUxFUyZxdW90OyBwby9N
YWtlZmlsZS5pbiAmZ3Q7IHBvL01ha2VmaWxlOzxicj4NCi0rWzxicj4NCi0gY2htb2QgK3ggZGVi
aWFuL3J1bGVzOzxicj4NCi0gdGVzdCAteiAmcXVvdDskQ09ORklHX0hFQURFUlMmcXVvdDsgfHwg
ZWNobyB0aW1lc3RhbXAgJmd0OyBzdGFtcC1oXSk8YnI+DQotLS0tIGxyenN6LTAuMTIuMjAuc2Fm
ZS9pbnRsLzx3YnI+YmluZHRleHRkb20uY8KgIMKgIMKgIDE5OTgtMDQtMjYgMDk6MjI6MzYuMDAw
MDAwMDAwIC0wNDAwPGJyPg0KLSsrKyBscnpzei0wLjEyLjIwL2ludGwvPHdicj5iaW5kdGV4dGRv
bS5jwqAgwqAyMDA0LTA5LTEyIDE0OjQwOjM0LjM0Mzc0OTkxMiAtMDQwMDxicj4NCi1AQCAtMSw1
OSArMSw3NSBAQDxicj4NCi0gLyogSW1wbGVtZW50YXRpb24gb2YgdGhlIGJpbmR0ZXh0ZG9tYWlu
KDMpIGZ1bmN0aW9uPGJyPg0KLS3CoCDCoENvcHlyaWdodCAoQykgMTk5NSwgMTk5NiwgMTk5NyBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy48YnI+DQotK8KgIMKgQ29weXJpZ2h0IChDKSAx
OTk1LTE5OTgsIDIwMDAtMjAwMyBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy48YnI+DQot
PGJyPg0KLS3CoCDCoFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlz
dHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5PGJyPg0KLS3CoCDCoGl0IHVuZGVyIHRoZSB0ZXJtcyBv
ZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5PGJyPg0KLS3C
oCDCoHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChh
dCB5b3VyIG9wdGlvbik8YnI+DQotK8KgIMKgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7
IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkgaXQ8YnI+DQotK8KgIMKgdW5k
ZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGlicmFyeSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFz
IHB1Ymxpc2hlZDxicj4NCi0rwqAgwqBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBl
aXRoZXIgdmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pPGJyPg0KLcKgIMKgIGFueSBsYXRl
ciB2ZXJzaW9uLjxicj4NCi08YnI+DQotwqAgwqAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVk
IGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsPGJyPg0KLcKgIMKgIGJ1dCBXSVRI
T1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mPGJy
Pg0KLS3CoCDCoE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRS7CoCBTZWUgdGhlPGJyPg0KLS3CoCDCoEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZv
ciBtb3JlIGRldGFpbHMuPGJyPg0KLSvCoCDCoE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZP
UiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS7CoCBTZWUgdGhlIEdOVTxicj4NCi0rwqAgwqBMaWJyYXJ5
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy48YnI+DQotPGJyPg0KLS3C
oCDCoFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlPGJyPg0KLS3CoCDCoGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3Qs
IHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sPGJyPg0KLS3CoCDCoEluYy4s
IDU5IFRlbXBsZSBQbGFjZSAtIFN1aXRlIDMzMCwgQm9zdG9uLCBNQSAwMjExMS0xMzA3LCBVU0Eu
wqAgKi88YnI+DQotK8KgIMKgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUg
R05VIExpYnJhcnkgR2VuZXJhbCBQdWJsaWM8YnI+DQotK8KgIMKgTGljZW5zZSBhbG9uZyB3aXRo
IHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZTxicj4NCi0r
wqAgwqBGb3VuZGF0aW9uLCBJbmMuLCA1OSBUZW1wbGUgUGxhY2UgLSBTdWl0ZSAzMzAsIEJvc3Rv
biwgTUEgMDIxMTEtMTMwNyw8YnI+DQotK8KgIMKgVVNBLsKgICovPGJyPg0KLTxicj4NCi0gI2lm
ZGVmIEhBVkVfQ09ORklHX0g8YnI+DQotICMgaW5jbHVkZSAmbHQ7Y29uZmlnLmgmZ3Q7PGJyPg0K
LSAjZW5kaWY8YnI+DQotPGJyPg0KLS0jaWYgZGVmaW5lZCBTVERDX0hFQURFUlMgfHwgZGVmaW5l
ZCBfTElCQzxicj4NCi0tIyBpbmNsdWRlICZsdDtzdGRsaWIuaCZndDs8YnI+DQotLSNlbHNlPGJy
Pg0KLS0jIGlmZGVmIEhBVkVfTUFMTE9DX0g8YnI+DQotLSPCoCBpbmNsdWRlICZsdDttYWxsb2Mu
aCZndDs8YnI+DQotLSMgZWxzZTxicj4NCi0tdm9pZCBmcmVlICgpOzxicj4NCi0tIyBlbmRpZjxi
cj4NCi0tI2VuZGlmPGJyPg0KLSsjaW5jbHVkZSAmbHQ7c3RkZGVmLmgmZ3Q7PGJyPg0KLSsjaW5j
bHVkZSAmbHQ7c3RkbGliLmgmZ3Q7PGJyPg0KLSsjaW5jbHVkZSAmbHQ7c3RyaW5nLmgmZ3Q7PGJy
Pg0KLTxicj4NCi0tI2lmIGRlZmluZWQgSEFWRV9TVFJJTkdfSCB8fCBkZWZpbmVkIF9MSUJDPGJy
Pg0KLS0jIGluY2x1ZGUgJmx0O3N0cmluZy5oJmd0Ozxicj4NCi0rI2lmZGVmIF9MSUJDPGJyPg0K
LSsjIGluY2x1ZGUgJmx0O2xpYmludGwuaCZndDs8YnI+DQotICNlbHNlPGJyPg0KLS0jIGluY2x1
ZGUgJmx0O3N0cmluZ3MuaCZndDs8YnI+DQotLSMgaWZuZGVmIG1lbWNweTxicj4NCi0tI8KgIGRl
ZmluZSBtZW1jcHkoRHN0LCBTcmMsIE51bSkgYmNvcHkgKFNyYywgRHN0LCBOdW0pPGJyPg0KLS0j
IGVuZGlmPGJyPg0KLSsjIGluY2x1ZGUgJnF1b3Q7bGliZ251aW50bC5oJnF1b3Q7PGJyPg0KLSAj
ZW5kaWY8YnI+DQotKyNpbmNsdWRlICZxdW90O2dldHRleHRQLmgmcXVvdDs8YnI+DQotPGJyPg0K
LSAjaWZkZWYgX0xJQkM8YnI+DQotLSMgaW5jbHVkZSAmbHQ7bGliaW50bC5oJmd0Ozxicj4NCi0r
LyogV2UgaGF2ZSB0byBoYW5kbGUgbXVsdGktdGhyZWFkZWQgYXBwbGljYXRpb25zLsKgICovPGJy
Pg0KLSsjIGluY2x1ZGUgJmx0O2JpdHMvbGliYy1sb2NrLmgmZ3Q7PGJyPg0KLSAjZWxzZTxicj4N
Ci0tIyBpbmNsdWRlICZxdW90O2xpYmdldHRleHQuaCZxdW90Ozxicj4NCi0rLyogUHJvdmlkZSBk
dW1teSBpbXBsZW1lbnRhdGlvbiBpZiB0aGlzIGlzIG91dHNpZGUgZ2xpYmMuwqAgKi88YnI+DQot
KyMgZGVmaW5lIF9fbGliY19yd2xvY2tfZGVmaW5lKENMQVNTLCBOQU1FKTxicj4NCi0rIyBkZWZp
bmUgX19saWJjX3J3bG9ja193cmxvY2soTkFNRSk8YnI+DQotKyMgZGVmaW5lIF9fbGliY19yd2xv
Y2tfdW5sb2NrKE5BTUUpPGJyPg0KLSsjZW5kaWY8YnI+DQotKzxicj4NCi0rLyogVGhlIGludGVy
bmFsIHZhcmlhYmxlcyBpbiB0aGUgc3RhbmRhbG9uZSBsaWJpbnRsLmEgbXVzdCBoYXZlIGRpZmZl
cmVudDxicj4NCi0rwqAgwqBuYW1lcyB0aGFuIHRoZSBpbnRlcm5hbCB2YXJpYWJsZXMgaW4gR05V
IGxpYmMsIG90aGVyd2lzZSBwcm9ncmFtczxicj4NCi0rwqAgwqB1c2luZyBsaWJpbnRsLmEgY2Fu
bm90IGJlIGxpbmtlZCBzdGF0aWNhbGx5LsKgICovPGJyPg0KLSsjaWYgIWRlZmluZWQgX0xJQkM8
YnI+DQotKyMgZGVmaW5lIF9ubF9kZWZhdWx0X2Rpcm5hbWUgbGliaW50bF9ubF9kZWZhdWx0X2Rp
cm5hbWU8YnI+DQotKyMgZGVmaW5lIF9ubF9kb21haW5fYmluZGluZ3MgbGliaW50bF9ubF9kb21h
aW5fYmluZGluZ3M8YnI+DQotKyNlbmRpZjxicj4NCi0rPGJyPg0KLSsvKiBTb21lIGNvbXBpbGVy
cywgbGlrZSBTdW5PUzQgY2MsIGRvbiYjMzk7dCBoYXZlIG9mZnNldG9mIGluICZsdDtzdGRkZWYu
aCZndDsuwqAgKi88YnI+DQotKyNpZm5kZWYgb2Zmc2V0b2Y8YnI+DQotKyMgZGVmaW5lIG9mZnNl
dG9mKHR5cGUsaWRlbnQpICgoc2l6ZV90KSZhbXA7KCgodHlwZSopMCktJmd0O2lkZW50KSk8YnI+
DQotICNlbmRpZjxicj4NCi0tI2luY2x1ZGUgJnF1b3Q7Z2V0dGV4dC5oJnF1b3Q7PGJyPg0KLS0j
aW5jbHVkZSAmcXVvdDtnZXR0ZXh0UC5oJnF1b3Q7PGJyPg0KLTxicj4NCi0gLyogQEAgZW5kIG9m
IHByb2xvZyBAQCAqLzxicj4NCi08YnI+DQotIC8qIENvbnRhaW5zIHRoZSBkZWZhdWx0IGxvY2F0
aW9uIG9mIHRoZSBtZXNzYWdlIGNhdGFsb2dzLsKgICovPGJyPg0KLSBleHRlcm4gY29uc3QgY2hh
ciBfbmxfZGVmYXVsdF9kaXJuYW1lW107PGJyPg0KLSsjaWZkZWYgX0xJQkM8YnI+DQotK2V4dGVy
biBjb25zdCBjaGFyIF9ubF9kZWZhdWx0X2Rpcm5hbWVfaW50ZXJuYWxbXSBhdHRyaWJ1dGVfaGlk
ZGVuOzxicj4NCi0rI2Vsc2U8YnI+DQotKyMgZGVmaW5lIElOVFVTRShuYW1lKSBuYW1lPGJyPg0K
LSsjZW5kaWY8YnI+DQotPGJyPg0KLSAvKiBMaXN0IHdpdGggYmluZGluZ3Mgb2Ygc3BlY2lmaWMg
ZG9tYWlucy7CoCAqLzxicj4NCi0gZXh0ZXJuIHN0cnVjdCBiaW5kaW5nICpfbmxfZG9tYWluX2Jp
bmRpbmdzOzxicj4NCi08YnI+DQotKy8qIExvY2sgdmFyaWFibGUgdG8gcHJvdGVjdCB0aGUgZ2xv
YmFsIGRhdGEgaW4gdGhlIGdldHRleHQgaW1wbGVtZW50YXRpb24uwqAgKi88YnI+DQotK19fbGli
Y19yd2xvY2tfZGVmaW5lIChleHRlcm4sIF9ubF9zdGF0ZV9sb2NrIGF0dHJpYnV0ZV9oaWRkZW4p
PGJyPg0KLSs8YnI+DQotPGJyPg0KLSAvKiBOYW1lcyBmb3IgdGhlIGxpYmludGwgZnVuY3Rpb25z
IGFyZSBhIHByb2JsZW0uwqAgVGhleSBtdXN0IG5vdCBjbGFzaDxicj4NCi3CoCDCoCB3aXRoIGV4
aXN0aW5nIG5hbWVzIGFuZCB0aGV5IHNob3VsZCBmb2xsb3cgQU5TSSBDLsKgIEJ1dCB0aGlzIHNv
dXJjZTxicj4NCi1AQCAtNjEsMjMgKzc3LDQxIEBAPGJyPg0KLcKgIMKgIHByZWZpeC7CoCBTbyB3
ZSBoYXZlIHRvIG1ha2UgYSBkaWZmZXJlbmNlIGhlcmUuwqAgKi88YnI+DQotICNpZmRlZiBfTElC
Qzxicj4NCi0gIyBkZWZpbmUgQklORFRFWFRET01BSU4gX19iaW5kdGV4dGRvbWFpbjxicj4NCi0t
IyBkZWZpbmUgc3RyZHVwKHN0cikgX19zdHJkdXAgKHN0cik8YnI+DQotKyMgZGVmaW5lIEJJTkRf
VEVYVERPTUFJTl9DT0RFU0VUIF9fYmluZF90ZXh0ZG9tYWluX2NvZGVzZXQ8YnI+DQotKyMgaWZu
ZGVmIHN0cmR1cDxicj4NCi0rI8KgIGRlZmluZSBzdHJkdXAoc3RyKSBfX3N0cmR1cCAoc3RyKTxi
cj4NCi0rIyBlbmRpZjxicj4NCi0gI2Vsc2U8YnI+DQotLSMgZGVmaW5lIEJJTkRURVhURE9NQUlO
IGJpbmR0ZXh0ZG9tYWluX188YnI+DQotKyMgZGVmaW5lIEJJTkRURVhURE9NQUlOIGxpYmludGxf
YmluZHRleHRkb21haW48YnI+DQotKyMgZGVmaW5lIEJJTkRfVEVYVERPTUFJTl9DT0RFU0VUIGxp
YmludGxfYmluZF90ZXh0ZG9tYWluXzx3YnI+Y29kZXNldDxicj4NCi0gI2VuZGlmPGJyPg0KLTxi
cj4NCi0tLyogU3BlY2lmeSB0aGF0IHRoZSBET01BSU5OQU1FIG1lc3NhZ2UgY2F0YWxvZyB3aWxs
IGJlIGZvdW5kPGJyPg0KLS3CoCDCoGluIERJUk5BTUUgcmF0aGVyIHRoYW4gaW4gdGhlIHN5c3Rl
bSBsb2NhbGUgZGF0YSBiYXNlLsKgICovPGJyPg0KLS1jaGFyICo8YnI+DQotLUJJTkRURVhURE9N
QUlOIChkb21haW5uYW1lLCBkaXJuYW1lKTxicj4NCi0twqAgwqAgwqBjb25zdCBjaGFyICpkb21h
aW5uYW1lOzxicj4NCi0twqAgwqAgwqBjb25zdCBjaGFyICpkaXJuYW1lOzxicj4NCi0rLyogU3Bl
Y2lmaWVzIHRoZSBkaXJlY3RvcnkgbmFtZSAqRElSTkFNRVAgYW5kIHRoZSBvdXRwdXQgY29kZXNl
dCAqQ09ERVNFVFA8YnI+DQotK8KgIMKgdG8gYmUgdXNlZCBmb3IgdGhlIERPTUFJTk5BTUUgbWVz
c2FnZSBjYXRhbG9nLjxicj4NCi0rwqAgwqBJZiAqRElSTkFNRVAgb3IgKkNPREVTRVRQIGlzIE5V
TEwsIHRoZSBjb3JyZXNwb25kaW5nIGF0dHJpYnV0ZSBpcyBub3Q8YnI+DQotK8KgIMKgbW9kaWZp
ZWQsIG9ubHkgdGhlIGN1cnJlbnQgdmFsdWUgaXMgcmV0dXJuZWQuPGJyPg0KLSvCoCDCoElmIERJ
Uk5BTUVQIG9yIENPREVTRVRQIGlzIE5VTEwsIHRoZSBjb3JyZXNwb25kaW5nIGF0dHJpYnV0ZSBp
cyBuZWl0aGVyPGJyPg0KLSvCoCDCoG1vZGlmaWVkIG5vciByZXR1cm5lZC7CoCAqLzxicj4NCi0r
c3RhdGljIHZvaWQ8YnI+DQotK3NldF9iaW5kaW5nX3ZhbHVlcyAoY29uc3QgY2hhciAqZG9tYWlu
bmFtZSw8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbnN0IGNoYXIgKipkaXJu
YW1lcCwgY29uc3QgY2hhciAqKmNvZGVzZXRwKTxicj4NCi0gezxicj4NCi3CoCDCoHN0cnVjdCBi
aW5kaW5nICpiaW5kaW5nOzxicj4NCi0rwqAgaW50IG1vZGlmaWVkOzxicj4NCi08YnI+DQotwqAg
wqAvKiBTb21lIHNhbml0eSBjaGVja3MuwqAgKi88YnI+DQotwqAgwqBpZiAoZG9tYWlubmFtZSA9
PSBOVUxMIHx8IGRvbWFpbm5hbWVbMF0gPT0gJiMzOTtcMCYjMzk7KTxicj4NCi0twqAgwqAgcmV0
dXJuIE5VTEw7PGJyPg0KLSvCoCDCoCB7PGJyPg0KLSvCoCDCoCDCoCBpZiAoZGlybmFtZXApPGJy
Pg0KLSvCoCDCoCDCoCAqZGlybmFtZXAgPSBOVUxMOzxicj4NCi0rwqAgwqAgwqAgaWYgKGNvZGVz
ZXRwKTxicj4NCi0rwqAgwqAgwqAgKmNvZGVzZXRwID0gTlVMTDs8YnI+DQotK8KgIMKgIMKgIHJl
dHVybjs8YnI+DQotK8KgIMKgIH08YnI+DQotKzxicj4NCi0rwqAgX19saWJjX3J3bG9ja193cmxv
Y2sgKF9ubF9zdGF0ZV9sb2NrKTs8YnI+DQotKzxicj4NCi0rwqAgbW9kaWZpZWQgPSAwOzxicj4N
Ci08YnI+DQotwqAgwqBmb3IgKGJpbmRpbmcgPSBfbmxfZG9tYWluX2JpbmRpbmdzOyBiaW5kaW5n
ICE9IE5VTEw7IGJpbmRpbmcgPSBiaW5kaW5nLSZndDtuZXh0KTxicj4NCi3CoCDCoCDCoHs8YnI+
DQotQEAgLTkzLDgxICsxMjcsMTczIEBAPGJyPg0KLcKgIMKgIMKgIMKgfTxicj4NCi3CoCDCoCDC
oH08YnI+DQotPGJyPg0KLS3CoCBpZiAoZGlybmFtZSA9PSBOVUxMKTxicj4NCi0twqAgwqAgLyog
VGhlIGN1cnJlbnQgYmluZGluZyBoYXMgYmUgdG8gcmV0dXJuZWQuwqAgKi88YnI+DQotLcKgIMKg
IHJldHVybiBiaW5kaW5nID09IE5VTEwgPyAoY2hhciAqKSBfbmxfZGVmYXVsdF9kaXJuYW1lIDog
YmluZGluZy0mZ3Q7ZGlybmFtZTs8YnI+DQotLTxicj4NCi3CoCDCoGlmIChiaW5kaW5nICE9IE5V
TEwpPGJyPg0KLcKgIMKgIMKgezxicj4NCi0twqAgwqAgwqAgLyogVGhlIGRvbWFpbiBpcyBhbHJl
YWR5IGJvdW5kLsKgIElmIHRoZSBuZXcgdmFsdWUgYW5kIHRoZSBvbGQ8YnI+DQotLcKgIMKgIMKg
IMKgb25lIGFyZSBlcXVhbCB3ZSBzaW1wbHkgZG8gbm90aGluZy7CoCBPdGhlcndpc2UgcmVwbGFj
ZSB0aGU8YnI+DQotLcKgIMKgIMKgIMKgb2xkIGJpbmRpbmcuwqAgKi88YnI+DQotLcKgIMKgIMKg
IGlmIChzdHJjbXAgKGRpcm5hbWUsIGJpbmRpbmctJmd0O2Rpcm5hbWUpICE9IDApPGJyPg0KLSvC
oCDCoCDCoCBpZiAoZGlybmFtZXApPGJyPg0KLcKgIMKgIMKgIMKgezxicj4NCi0twqAgwqAgwqAg
wqAgY2hhciAqbmV3X2Rpcm5hbWU7PGJyPg0KLSvCoCDCoCDCoCDCoCBjb25zdCBjaGFyICpkaXJu
YW1lID0gKmRpcm5hbWVwOzxicj4NCi08YnI+DQotLcKgIMKgIMKgIMKgIGlmIChzdHJjbXAgKGRp
cm5hbWUsIF9ubF9kZWZhdWx0X2Rpcm5hbWUpID09IDApPGJyPg0KLS3CoCDCoCDCoCDCoCDCoCBu
ZXdfZGlybmFtZSA9IChjaGFyICopIF9ubF9kZWZhdWx0X2Rpcm5hbWU7PGJyPg0KLSvCoCDCoCDC
oCDCoCBpZiAoZGlybmFtZSA9PSBOVUxMKTxicj4NCi0rwqAgwqAgwqAgwqAgwqAgLyogVGhlIGN1
cnJlbnQgYmluZGluZyBoYXMgYmUgdG8gcmV0dXJuZWQuwqAgKi88YnI+DQotK8KgIMKgIMKgIMKg
IMKgICpkaXJuYW1lcCA9IGJpbmRpbmctJmd0O2Rpcm5hbWU7PGJyPg0KLcKgIMKgIMKgIMKgIMKg
ZWxzZTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoHs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIC8q
IFRoZSBkb21haW4gaXMgYWxyZWFkeSBib3VuZC7CoCBJZiB0aGUgbmV3IHZhbHVlIGFuZCB0aGUg
b2xkPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9uZSBhcmUgZXF1YWwgd2Ugc2ltcGx5
IGRvIG5vdGhpbmcuwqAgT3RoZXJ3aXNlIHJlcGxhY2UgdGhlPGJyPg0KLSvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoG9sZCBiaW5kaW5nLsKgICovPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCBjaGFy
ICpyZXN1bHQgPSBiaW5kaW5nLSZndDtkaXJuYW1lOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAg
aWYgKHN0cmNtcCAoZGlybmFtZSwgcmVzdWx0KSAhPSAwKTxicj4NCi0rwqAgwqAgwqAgwqAgwqAg
wqAgwqAgezxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHN0cmNtcCAoZGlybmFt
ZSwgSU5UVVNFKF9ubF9kZWZhdWx0X2Rpcm5hbWUpKSA9PSAwKTxicj4NCi0rwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgcmVzdWx0ID0gKGNoYXIgKikgSU5UVVNFKF9ubF9kZWZhdWx0X2Rpcm5h
bWUpOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZWxzZTxicj4NCi0rwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgezxicj4NCi0gI2lmIGRlZmluZWQgX0xJQkMgfHwgZGVmaW5lZCBI
QVZFX1NUUkRVUDxicj4NCi0twqAgwqAgwqAgwqAgwqAgwqAgbmV3X2Rpcm5hbWUgPSBzdHJkdXAg
KGRpcm5hbWUpOzxicj4NCi0twqAgwqAgwqAgwqAgwqAgwqAgaWYgKG5ld19kaXJuYW1lID09IE5V
TEwpPGJyPg0KLS3CoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gTlVMTDs8YnI+DQotK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlc3VsdCA9IHN0cmR1cCAoZGlybmFtZSk7PGJyPg0K
LSAjZWxzZTxicj4NCi0twqAgwqAgwqAgwqAgwqAgwqAgc2l6ZV90IGxlbiA9IHN0cmxlbiAoZGly
bmFtZSkgKyAxOzxicj4NCi0twqAgwqAgwqAgwqAgwqAgwqAgbmV3X2Rpcm5hbWUgPSAoY2hhciAq
KSBtYWxsb2MgKGxlbik7PGJyPg0KLS3CoCDCoCDCoCDCoCDCoCDCoCBpZiAobmV3X2Rpcm5hbWUg
PT0gTlVMTCk8YnI+DQotLcKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiBOVUxMOzxicj4NCi0t
PGJyPg0KLS3CoCDCoCDCoCDCoCDCoCDCoCBtZW1jcHkgKG5ld19kaXJuYW1lLCBkaXJuYW1lLCBs
ZW4pOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2l6ZV90IGxlbiA9IHN0
cmxlbiAoZGlybmFtZSkgKyAxOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
cmVzdWx0ID0gKGNoYXIgKikgbWFsbG9jIChsZW4pOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgaWYgKF9fYnVpbHRpbl9leHBlY3QgKHJlc3VsdCAhPSBOVUxMLCAxKSk8YnI+
DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1lbWNweSAocmVzdWx0LCBkaXJu
YW1lLCBsZW4pOzxicj4NCi0gI2VuZGlmPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCB9PGJyPg0KLSs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChfX2J1aWx0aW5f
ZXhwZWN0IChyZXN1bHQgIT0gTlVMTCwgMSkpPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoYmluZGluZy0m
Z3Q7ZGlybmFtZSAhPSBJTlRVU0UoX25sX2RlZmF1bHRfZGlybmFtZSkpPGJyPg0KLSvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBmcmVlIChiaW5kaW5nLSZndDtkaXJuYW1lKTs8YnI+
DQotKzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYmluZGluZy0mZ3Q7ZGly
bmFtZSA9IHJlc3VsdDs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1vZGlm
aWVkID0gMTs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQotK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIH08YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgICpkaXJuYW1lcCA9IHJl
c3VsdDs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KLSvCoCDCoCDCoCB9PGJyPg0KLTxi
cj4NCi0twqAgwqAgwqAgwqAgaWYgKGJpbmRpbmctJmd0O2Rpcm5hbWUgIT0gX25sX2RlZmF1bHRf
ZGlybmFtZSk8YnI+DQotLcKgIMKgIMKgIMKgIMKgIGZyZWUgKGJpbmRpbmctJmd0O2Rpcm5hbWUp
Ozxicj4NCi0rwqAgwqAgwqAgaWYgKGNvZGVzZXRwKTxicj4NCi0rwqAgwqAgwqAgezxicj4NCi0r
wqAgwqAgwqAgwqAgY29uc3QgY2hhciAqY29kZXNldCA9ICpjb2Rlc2V0cDs8YnI+DQotPGJyPg0K
LS3CoCDCoCDCoCDCoCBiaW5kaW5nLSZndDtkaXJuYW1lID0gbmV3X2Rpcm5hbWU7PGJyPg0KLSvC
oCDCoCDCoCDCoCBpZiAoY29kZXNldCA9PSBOVUxMKTxicj4NCi0rwqAgwqAgwqAgwqAgwqAgLyog
VGhlIGN1cnJlbnQgYmluZGluZyBoYXMgYmUgdG8gcmV0dXJuZWQuwqAgKi88YnI+DQotK8KgIMKg
IMKgIMKgIMKgICpjb2Rlc2V0cCA9IGJpbmRpbmctJmd0O2NvZGVzZXQ7PGJyPg0KLSvCoCDCoCDC
oCDCoCBlbHNlPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCB7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDC
oCAvKiBUaGUgZG9tYWluIGlzIGFscmVhZHkgYm91bmQuwqAgSWYgdGhlIG5ldyB2YWx1ZSBhbmQg
dGhlIG9sZDxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvbmUgYXJlIGVxdWFsIHdlIHNp
bXBseSBkbyBub3RoaW5nLsKgIE90aGVyd2lzZSByZXBsYWNlIHRoZTxicj4NCi0rwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBvbGQgYmluZGluZy7CoCAqLzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAg
Y2hhciAqcmVzdWx0ID0gYmluZGluZy0mZ3Q7Y29kZXNldDs8YnI+DQotK8KgIMKgIMKgIMKgIMKg
IMKgIGlmIChyZXN1bHQgPT0gTlVMTCB8fCBzdHJjbXAgKGNvZGVzZXQsIHJlc3VsdCkgIT0gMCk8
YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIHs8YnI+DQotKyNpZiBkZWZpbmVkIF9MSUJDIHx8
IGRlZmluZWQgSEFWRV9TVFJEVVA8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlc3Vs
dCA9IHN0cmR1cCAoY29kZXNldCk7PGJyPg0KLSsjZWxzZTxicj4NCi0rwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgc2l6ZV90IGxlbiA9IHN0cmxlbiAoY29kZXNldCkgKyAxOzxicj4NCi0rwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcmVzdWx0ID0gKGNoYXIgKikgbWFsbG9jIChsZW4pOzxicj4NCi0r
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKF9fYnVpbHRpbl9leHBlY3QgKHJlc3VsdCAhPSBO
VUxMLCAxKSk8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1lbWNweSAocmVzdWx0
LCBjb2Rlc2V0LCBsZW4pOzxicj4NCi0rI2VuZGlmPGJyPg0KLSs8YnI+DQotK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGlmIChfX2J1aWx0aW5fZXhwZWN0IChyZXN1bHQgIT0gTlVMTCwgMSkpPGJy
Pg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBpZiAoYmluZGluZy0mZ3Q7Y29kZXNldCAhPSBOVUxMKTxicj4NCi0rwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZnJlZSAoYmluZGluZy0mZ3Q7Y29kZXNldCk7
PGJyPg0KLSs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJpbmRpbmctJmd0
O2NvZGVzZXQgPSByZXN1bHQ7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBi
aW5kaW5nLSZndDtjb2Rlc2V0X2NudHIrKzs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIG1vZGlmaWVkID0gMTs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08
YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgICpj
b2Rlc2V0cCA9IHJlc3VsdDs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIH08YnI+DQotwqAgwqAgwqAg
wqB9PGJyPg0KLcKgIMKgIMKgfTxicj4NCi0rwqAgZWxzZSBpZiAoKGRpcm5hbWVwID09IE5VTEwg
fHwgKmRpcm5hbWVwID09IE5VTEwpPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCZhbXA7JmFtcDsgKGNv
ZGVzZXRwID09IE5VTEwgfHwgKmNvZGVzZXRwID09IE5VTEwpKTxicj4NCi0rwqAgwqAgezxicj4N
Ci0rwqAgwqAgwqAgLyogU2ltcGx5IHJldHVybiB0aGUgZGVmYXVsdCB2YWx1ZXMuwqAgKi88YnI+
DQotK8KgIMKgIMKgIGlmIChkaXJuYW1lcCk8YnI+DQotK8KgIMKgIMKgICpkaXJuYW1lcCA9IElO
VFVTRShfbmxfZGVmYXVsdF9kaXJuYW1lKTs8YnI+DQotK8KgIMKgIMKgIGlmIChjb2Rlc2V0cCk8
YnI+DQotK8KgIMKgIMKgICpjb2Rlc2V0cCA9IE5VTEw7PGJyPg0KLSvCoCDCoCB9PGJyPg0KLcKg
IMKgZWxzZTxicj4NCi3CoCDCoCDCoHs8YnI+DQotwqAgwqAgwqAgwqAvKiBXZSBoYXZlIHRvIGNy
ZWF0ZSBhIG5ldyBiaW5kaW5nLsKgICovPGJyPg0KLS3CoCDCoCDCoCBzaXplX3QgbGVuOzxicj4N
Ci0rwqAgwqAgwqAgc2l6ZV90IGxlbiA9IHN0cmxlbiAoZG9tYWlubmFtZSkgKyAxOzxicj4NCi3C
oCDCoCDCoCDCoHN0cnVjdCBiaW5kaW5nICpuZXdfYmluZGluZyA9PGJyPg0KLS3CoCDCoCDCoCAo
c3RydWN0IGJpbmRpbmcgKikgbWFsbG9jIChzaXplb2YgKCpuZXdfYmluZGluZykpOzxicj4NCi0r
wqAgwqAgwqAgKHN0cnVjdCBiaW5kaW5nICopIG1hbGxvYyAob2Zmc2V0b2YgKHN0cnVjdCBiaW5k
aW5nLCBkb21haW5uYW1lKSArIGxlbik7PGJyPg0KLTxicj4NCi0twqAgwqAgwqAgaWYgKG5ld19i
aW5kaW5nID09IE5VTEwpPGJyPg0KLS3CoCDCoCDCoCByZXR1cm4gTlVMTDs8YnI+DQotK8KgIMKg
IMKgIGlmIChfX2J1aWx0aW5fZXhwZWN0IChuZXdfYmluZGluZyA9PSBOVUxMLCAwKSk8YnI+DQot
K8KgIMKgIMKgIGdvdG8gZmFpbGVkOzxicj4NCi08YnI+DQotK8KgIMKgIMKgIG1lbWNweSAobmV3
X2JpbmRpbmctJmd0O2RvbWFpbm5hbWUsIGRvbWFpbm5hbWUsIGxlbik7PGJyPg0KLSs8YnI+DQot
K8KgIMKgIMKgIGlmIChkaXJuYW1lcCk8YnI+DQotK8KgIMKgIMKgIHs8YnI+DQotK8KgIMKgIMKg
IMKgIGNvbnN0IGNoYXIgKmRpcm5hbWUgPSAqZGlybmFtZXA7PGJyPg0KLSs8YnI+DQotK8KgIMKg
IMKgIMKgIGlmIChkaXJuYW1lID09IE5VTEwpPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCAvKiBUaGUg
ZGVmYXVsdCB2YWx1ZS7CoCAqLzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgZGlybmFtZSA9IElOVFVT
RShfbmxfZGVmYXVsdF9kaXJuYW1lKTs8YnI+DQotK8KgIMKgIMKgIMKgIGVsc2U8YnI+DQotK8Kg
IMKgIMKgIMKgIMKgIHs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIGlmIChzdHJjbXAgKGRpcm5h
bWUsIElOVFVTRShfbmxfZGVmYXVsdF9kaXJuYW1lKSkgPT0gMCk8YnI+DQotK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIGRpcm5hbWUgPSBJTlRVU0UoX25sX2RlZmF1bHRfZGlybmFtZSk7PGJyPg0KLSvC
oCDCoCDCoCDCoCDCoCDCoCBlbHNlPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCB7PGJyPg0K
LSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjaGFyICpyZXN1bHQ7PGJyPg0KLSAjaWYgZGVmaW5l
ZCBfTElCQyB8fCBkZWZpbmVkIEhBVkVfU1RSRFVQPGJyPg0KLS3CoCDCoCDCoCBuZXdfYmluZGlu
Zy0mZ3Q7ZG9tYWlubmFtZSA9IHN0cmR1cCAoZG9tYWlubmFtZSk7PGJyPg0KLS3CoCDCoCDCoCBp
ZiAobmV3X2JpbmRpbmctJmd0O2RvbWFpbm5hbWUgPT0gTlVMTCk8YnI+DQotLcKgIMKgIMKgIHJl
dHVybiBOVUxMOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVzdWx0ID0gc3RyZHVw
IChkaXJuYW1lKTs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChfX2J1aWx0aW5f
ZXhwZWN0IChyZXN1bHQgPT0gTlVMTCwgMCkpPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBnb3RvIGZhaWxlZF9kaXJuYW1lOzxicj4NCi0gI2Vsc2U8YnI+DQotLcKgIMKgIMKgIGxl
biA9IHN0cmxlbiAoZG9tYWlubmFtZSkgKyAxOzxicj4NCi0twqAgwqAgwqAgbmV3X2JpbmRpbmct
Jmd0O2RvbWFpbm5hbWUgPSAoY2hhciAqKSBtYWxsb2MgKGxlbik7PGJyPg0KLS3CoCDCoCDCoCBp
ZiAobmV3X2JpbmRpbmctJmd0O2RvbWFpbm5hbWUgPT0gTlVMTCk8YnI+DQotLcKgIMKgIMKgIHJl
dHVybiBOVUxMOzxicj4NCi0twqAgwqAgwqAgbWVtY3B5IChuZXdfYmluZGluZy0mZ3Q7ZG9tYWlu
bmFtZSwgZG9tYWlubmFtZSwgbGVuKTs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNp
emVfdCBsZW4gPSBzdHJsZW4gKGRpcm5hbWUpICsgMTs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHJlc3VsdCA9IChjaGFyICopIG1hbGxvYyAobGVuKTs8YnI+DQotK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGlmIChfX2J1aWx0aW5fZXhwZWN0IChyZXN1bHQgPT0gTlVMTCwgMCkpPGJy
Pg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIGZhaWxlZF9kaXJuYW1lOzxicj4N
Ci0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbWVtY3B5IChyZXN1bHQsIGRpcm5hbWUsIGxlbik7
PGJyPg0KLSAjZW5kaWY8YnI+DQotLTxicj4NCi0twqAgwqAgwqAgaWYgKHN0cmNtcCAoZGlybmFt
ZSwgX25sX2RlZmF1bHRfZGlybmFtZSkgPT0gMCk8YnI+DQotLcKgIMKgIMKgIG5ld19iaW5kaW5n
LSZndDtkaXJuYW1lID0gKGNoYXIgKikgX25sX2RlZmF1bHRfZGlybmFtZTs8YnI+DQotK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGRpcm5hbWUgPSByZXN1bHQ7PGJyPg0KLSvCoCDCoCDCoCDCoCDC
oCDCoCDCoCB9PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCB9PGJyPg0KLSvCoCDCoCDCoCDCoCAqZGly
bmFtZXAgPSBkaXJuYW1lOzxicj4NCi0rwqAgwqAgwqAgwqAgbmV3X2JpbmRpbmctJmd0O2Rpcm5h
bWUgPSAoY2hhciAqKSBkaXJuYW1lOzxicj4NCi0rwqAgwqAgwqAgfTxicj4NCi3CoCDCoCDCoCDC
oGVsc2U8YnI+DQotK8KgIMKgIMKgIC8qIFRoZSBkZWZhdWx0IHZhbHVlLsKgICovPGJyPg0KLSvC
oCDCoCDCoCBuZXdfYmluZGluZy0mZ3Q7ZGlybmFtZSA9IChjaGFyICopIElOVFVTRShfbmxfZGVm
YXVsdF9kaXJuYW1lKTs8YnI+DQotKzxicj4NCi0rwqAgwqAgwqAgbmV3X2JpbmRpbmctJmd0O2Nv
ZGVzZXRfY250ciA9IDA7PGJyPg0KLSs8YnI+DQotK8KgIMKgIMKgIGlmIChjb2Rlc2V0cCk8YnI+
DQotwqAgwqAgwqAgwqB7PGJyPg0KLSvCoCDCoCDCoCDCoCBjb25zdCBjaGFyICpjb2Rlc2V0ID0g
KmNvZGVzZXRwOzxicj4NCi0rPGJyPg0KLSvCoCDCoCDCoCDCoCBpZiAoY29kZXNldCAhPSBOVUxM
KTxicj4NCi0rwqAgwqAgwqAgwqAgwqAgezxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgY2hhciAq
cmVzdWx0Ozxicj4NCi0rPGJyPg0KLSAjaWYgZGVmaW5lZCBfTElCQyB8fCBkZWZpbmVkIEhBVkVf
U1RSRFVQPGJyPg0KLS3CoCDCoCDCoCDCoCBuZXdfYmluZGluZy0mZ3Q7ZGlybmFtZSA9IHN0cmR1
cCAoZGlybmFtZSk7PGJyPg0KLS3CoCDCoCDCoCDCoCBpZiAobmV3X2JpbmRpbmctJmd0O2Rpcm5h
bWUgPT0gTlVMTCk8YnI+DQotLcKgIMKgIMKgIMKgIMKgIHJldHVybiBOVUxMOzxicj4NCi0rwqAg
wqAgwqAgwqAgwqAgwqAgcmVzdWx0ID0gc3RyZHVwIChjb2Rlc2V0KTs8YnI+DQotK8KgIMKgIMKg
IMKgIMKgIMKgIGlmIChfX2J1aWx0aW5fZXhwZWN0IChyZXN1bHQgPT0gTlVMTCwgMCkpPGJyPg0K
LSvCoCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIGZhaWxlZF9jb2Rlc2V0Ozxicj4NCi0gI2Vsc2U8
YnI+DQotLcKgIMKgIMKgIMKgIGxlbiA9IHN0cmxlbiAoZGlybmFtZSkgKyAxOzxicj4NCi0twqAg
wqAgwqAgwqAgbmV3X2JpbmRpbmctJmd0O2Rpcm5hbWUgPSAoY2hhciAqKSBtYWxsb2MgKGxlbik7
PGJyPg0KLS3CoCDCoCDCoCDCoCBpZiAobmV3X2JpbmRpbmctJmd0O2Rpcm5hbWUgPT0gTlVMTCk8
YnI+DQotLcKgIMKgIMKgIMKgIMKgIHJldHVybiBOVUxMOzxicj4NCi0twqAgwqAgwqAgwqAgbWVt
Y3B5IChuZXdfYmluZGluZy0mZ3Q7ZGlybmFtZSwgZGlybmFtZSwgbGVuKTs8YnI+DQotK8KgIMKg
IMKgIMKgIMKgIMKgIHNpemVfdCBsZW4gPSBzdHJsZW4gKGNvZGVzZXQpICsgMTs8YnI+DQotK8Kg
IMKgIMKgIMKgIMKgIMKgIHJlc3VsdCA9IChjaGFyICopIG1hbGxvYyAobGVuKTs8YnI+DQotK8Kg
IMKgIMKgIMKgIMKgIMKgIGlmIChfX2J1aWx0aW5fZXhwZWN0IChyZXN1bHQgPT0gTlVMTCwgMCkp
PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIGZhaWxlZF9jb2Rlc2V0Ozxicj4NCi0r
wqAgwqAgwqAgwqAgwqAgwqAgbWVtY3B5IChyZXN1bHQsIGNvZGVzZXQsIGxlbik7PGJyPg0KLSAj
ZW5kaWY8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIGNvZGVzZXQgPSByZXN1bHQ7PGJyPg0KLSvC
oCDCoCDCoCDCoCDCoCDCoCBuZXdfYmluZGluZy0mZ3Q7Y29kZXNldF9jbnRyKys7PGJyPg0KLSvC
oCDCoCDCoCDCoCDCoCB9PGJyPg0KLSvCoCDCoCDCoCDCoCAqY29kZXNldHAgPSBjb2Rlc2V0Ozxi
cj4NCi0rwqAgwqAgwqAgwqAgbmV3X2JpbmRpbmctJmd0O2NvZGVzZXQgPSAoY2hhciAqKSBjb2Rl
c2V0Ozxicj4NCi3CoCDCoCDCoCDCoH08YnI+DQotK8KgIMKgIMKgIGVsc2U8YnI+DQotK8KgIMKg
IMKgIG5ld19iaW5kaW5nLSZndDtjb2Rlc2V0ID0gTlVMTDs8YnI+DQotPGJyPg0KLcKgIMKgIMKg
IMKgLyogTm93IGVucXVldWUgaXQuwqAgKi88YnI+DQotwqAgwqAgwqAgwqBpZiAoX25sX2RvbWFp
bl9iaW5kaW5ncyA9PSBOVUxMPGJyPg0KLUBAIC0xODcsMTMgKzMxMyw1MSBAQDxicj4NCi3CoCDC
oCDCoCDCoCDCoGJpbmRpbmctJmd0O25leHQgPSBuZXdfYmluZGluZzs8YnI+DQotwqAgwqAgwqAg
wqB9PGJyPg0KLTxicj4NCi0twqAgwqAgwqAgYmluZGluZyA9IG5ld19iaW5kaW5nOzxicj4NCi0r
wqAgwqAgwqAgbW9kaWZpZWQgPSAxOzxicj4NCi0rPGJyPg0KLSvCoCDCoCDCoCAvKiBIZXJlIHdl
IGRlYWwgd2l0aCBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlcy7CoCAqLzxicj4NCi0rwqAgwqAg
wqAgaWYgKDApPGJyPg0KLSvCoCDCoCDCoCB7PGJyPg0KLSvCoCDCoCDCoCBmYWlsZWRfY29kZXNl
dDo8YnI+DQotK8KgIMKgIMKgIMKgIGlmIChuZXdfYmluZGluZy0mZ3Q7ZGlybmFtZSAhPSBJTlRV
U0UoX25sX2RlZmF1bHRfZGlybmFtZSkpPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCBmcmVlIChuZXdf
YmluZGluZy0mZ3Q7ZGlybmFtZSk7PGJyPg0KLSvCoCDCoCDCoCBmYWlsZWRfZGlybmFtZTo8YnI+
DQotK8KgIMKgIMKgIMKgIGZyZWUgKG5ld19iaW5kaW5nKTs8YnI+DQotK8KgIMKgIMKgIGZhaWxl
ZDo8YnI+DQotK8KgIMKgIMKgIMKgIGlmIChkaXJuYW1lcCk8YnI+DQotK8KgIMKgIMKgIMKgIMKg
ICpkaXJuYW1lcCA9IE5VTEw7PGJyPg0KLSvCoCDCoCDCoCDCoCBpZiAoY29kZXNldHApPGJyPg0K
LSvCoCDCoCDCoCDCoCDCoCAqY29kZXNldHAgPSBOVUxMOzxicj4NCi0rwqAgwqAgwqAgfTxicj4N
Ci3CoCDCoCDCoH08YnI+DQotPGJyPg0KLS3CoCByZXR1cm4gYmluZGluZy0mZ3Q7ZGlybmFtZTs8
YnI+DQotK8KgIC8qIElmIHdlIG1vZGlmaWVkIGFueSBiaW5kaW5nLCB3ZSBmbHVzaCB0aGUgY2Fj
aGVzLsKgICovPGJyPg0KLSvCoCBpZiAobW9kaWZpZWQpPGJyPg0KLSvCoCDCoCArK19ubF9tc2df
Y2F0X2NudHI7PGJyPg0KLSs8YnI+DQotK8KgIF9fbGliY19yd2xvY2tfdW5sb2NrIChfbmxfc3Rh
dGVfbG9jayk7PGJyPg0KLSt9PGJyPg0KLSs8YnI+DQotKy8qIFNwZWNpZnkgdGhhdCB0aGUgRE9N
QUlOTkFNRSBtZXNzYWdlIGNhdGFsb2cgd2lsbCBiZSBmb3VuZDxicj4NCi0rwqAgwqBpbiBESVJO
QU1FIHJhdGhlciB0aGFuIGluIHRoZSBzeXN0ZW0gbG9jYWxlIGRhdGEgYmFzZS7CoCAqLzxicj4N
Ci0rY2hhciAqPGJyPg0KLStCSU5EVEVYVERPTUFJTiAoY29uc3QgY2hhciAqZG9tYWlubmFtZSwg
Y29uc3QgY2hhciAqZGlybmFtZSk8YnI+DQotK3s8YnI+DQotK8KgIHNldF9iaW5kaW5nX3ZhbHVl
cyAoZG9tYWlubmFtZSwgJmFtcDtkaXJuYW1lLCBOVUxMKTs8YnI+DQotK8KgIHJldHVybiAoY2hh
ciAqKSBkaXJuYW1lOzxicj4NCi0rfTxicj4NCi0rPGJyPg0KLSsvKiBTcGVjaWZ5IHRoZSBjaGFy
YWN0ZXIgZW5jb2RpbmcgaW4gd2hpY2ggdGhlIG1lc3NhZ2VzIGZyb20gdGhlPGJyPg0KLSvCoCDC
oERPTUFJTk5BTUUgbWVzc2FnZSBjYXRhbG9nIHdpbGwgYmUgcmV0dXJuZWQuwqAgKi88YnI+DQot
K2NoYXIgKjxicj4NCi0rQklORF9URVhURE9NQUlOX0NPREVTRVQgKGNvbnN0IGNoYXIgKmRvbWFp
bm5hbWUsIGNvbnN0IGNoYXIgKmNvZGVzZXQpPGJyPg0KLSt7PGJyPg0KLSvCoCBzZXRfYmluZGlu
Z192YWx1ZXMgKGRvbWFpbm5hbWUsIE5VTEwsICZhbXA7Y29kZXNldCk7PGJyPg0KLSvCoCByZXR1
cm4gKGNoYXIgKikgY29kZXNldDs8YnI+DQotIH08YnI+DQotPGJyPg0KLSAjaWZkZWYgX0xJQkM8
YnI+DQotLS8qIEFsaWFzIGZvciBmdW5jdGlvbiBuYW1lIGluIEdOVSBDIExpYnJhcnkuwqAgKi88
YnI+DQotKy8qIEFsaWFzZXMgZm9yIGZ1bmN0aW9uIG5hbWVzIGluIEdOVSBDIExpYnJhcnkuwqAg
Ki88YnI+DQotIHdlYWtfYWxpYXMgKF9fYmluZHRleHRkb21haW4sIGJpbmR0ZXh0ZG9tYWluKTs8
YnI+DQotK3dlYWtfYWxpYXMgKF9fYmluZF90ZXh0ZG9tYWluX2NvZGVzZXQsIGJpbmRfdGV4dGRv
bWFpbl9jb2Rlc2V0KTs8YnI+DQotICNlbmRpZjxicj4NCi0tLS0gbHJ6c3otMC4xMi4yMC5zYWZl
L2ludGwvY2F0LTx3YnI+Y29tcGF0LmPCoCDCoCDCoCDCoDE5OTgtMDQtMjYgMDk6MjI6MzcuMDAw
MDAwMDAwIC0wNDAwPGJyPg0KLSsrKyBscnpzei0wLjEyLjIwL2ludGwvY2F0LWNvbXBhdC48d2Jy
PmPCoCDCoCAxOTY5LTEyLTMxIDE5OjAwOjAwLjAwMDAwMDAwMCAtMDUwMDxicj4NCi1AQCAtMSwy
NjIgKzAsMCBAQDxicj4NCi0tLyogQ29tcGF0aWJpbGl0eSBjb2RlIGZvciBnZXR0ZXh0LXVzaW5n
LWNhdGdldHMgaW50ZXJmYWNlLjxicj4NCi0twqAgwqBDb3B5cmlnaHQgKEMpIDE5OTUsIDE5OTcg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuPGJyPg0KLS08YnI+DQotLcKgIMKgVGhpcyBw
cm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBt
b2RpZnk8YnI+DQotLcKgIMKgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnk8YnI+DQotLcKgIMKgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKTxicj4N
Ci0twqAgwqBhbnkgbGF0ZXIgdmVyc2lvbi48YnI+DQotLTxicj4NCi0twqAgwqBUaGlzIHByb2dy
YW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCw8YnI+
DQotLcKgIMKgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxp
ZWQgd2FycmFudHkgb2Y8YnI+DQotLcKgIMKgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFLsKgIFNlZSB0aGU8YnI+DQotLcKgIMKgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy48YnI+DQotLTxicj4NCi0twqAgwqBZb3Ug
c2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZTxicj4NCi0twqAgwqBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0
byB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLDxicj4NCi0twqAgwqBJbmMuLCA1OSBUZW1w
bGUgUGxhY2UgLSBTdWl0ZSAzMzAsIEJvc3RvbiwgTUEgMDIxMTEtMTMwNywgVVNBLsKgICovPGJy
Pg0KLS08YnI+DQotLSNpZmRlZiBIQVZFX0NPTkZJR19IPGJyPg0KLS0jIGluY2x1ZGUgJmx0O2Nv
bmZpZy5oJmd0Ozxicj4NCi0tI2VuZGlmPGJyPg0KLS08YnI+DQotLSNpbmNsdWRlICZsdDtzdGRp
by5oJmd0Ozxicj4NCi0tPGJyPg0KLS0jaWZkZWYgU1REQ19IRUFERVJTPGJyPg0KLS0jIGluY2x1
ZGUgJmx0O3N0ZGxpYi5oJmd0Ozxicj4NCi0tIyBpbmNsdWRlICZsdDtzdHJpbmcuaCZndDs8YnI+
DQotLSNlbHNlPGJyPg0KLS1jaGFyICpnZXRlbnYgKCk7PGJyPg0KLS0jIGlmZGVmIEhBVkVfTUFM
TE9DX0g8YnI+DQotLSPCoCBpbmNsdWRlICZsdDttYWxsb2MuaCZndDs8YnI+DQotLSMgZW5kaWY8
YnI+DQotLSNlbmRpZjxicj4NCi0tPGJyPg0KLS0jaWZkZWYgSEFWRV9OTF9UWVBFU19IPGJyPg0K
LS0jIGluY2x1ZGUgJmx0O25sX3R5cGVzLmgmZ3Q7PGJyPg0KLS0jZW5kaWY8YnI+DQotLTxicj4N
Ci0tI2luY2x1ZGUgJnF1b3Q7bGliZ2V0dGV4dC5oJnF1b3Q7PGJyPg0KLS08YnI+DQotLS8qIEBA
IGVuZCBvZiBwcm9sb2cgQEAgKi88YnI+DQotLTxicj4NCi0tLyogWFBHMyBkZWZpbmVzIHRoZSBy
ZXN1bHQgb2YgYHNldGxvY2FsZSAoY2F0ZWdvcnksIE5VTEwpJiMzOTsgYXM6PGJyPg0KLS3CoCDC
oGBgRGlyZWN0cyBgc2V0bG9jYWxlKCkmIzM5OyB0byBxdWVyeSBgY2F0ZWdvcnkmIzM5OyBhbmQg
cmV0dXJuIHRoZSBjdXJyZW50PGJyPg0KLS3CoCDCoCDCoHNldHRpbmcgb2YgYGxvY2FsJiMzOTsu
JiMzOTsmIzM5Ozxicj4NCi0twqAgwqBIb3dldmVyIGl0IGRvZXMgbm90IHNwZWNpZnkgdGhlIGV4
YWN0IGZvcm1hdC7CoCBBbmQgZXZlbiB3b3JzZTogUE9TSVg8YnI+DQotLcKgIMKgZGVmaW5lcyB0
aGlzIG5vdCBhdCBhbGwuwqAgU28gd2UgY2FuIHVzZSB0aGlzIGZlYXR1cmUgb25seSBvbiBzZWxl
Y3RlZDxicj4NCi0twqAgwqBzeXN0ZW0gKGUuZy4gdGhvc2UgdXNpbmcgR05VIEMgTGlicmFyeSku
wqAgKi88YnI+DQotLSNpZmRlZiBfTElCQzxicj4NCi0tIyBkZWZpbmUgSEFWRV9MT0NBTEVfTlVM
TDxicj4NCi0tI2VuZGlmPGJyPg0KLS08YnI+DQotLS8qIFRoZSBjYXRhbG9nIGRlc2NyaXB0b3Iu
wqAgKi88YnI+DQotLXN0YXRpYyBubF9jYXRkIGNhdGFsb2cgPSAobmxfY2F0ZCkgLTE7PGJyPg0K
LS08YnI+DQotLS8qIE5hbWUgb2YgdGhlIGRlZmF1bHQgY2F0YWxvZy7CoCAqLzxicj4NCi0tc3Rh
dGljIGNvbnN0IGNoYXIgZGVmYXVsdF9jYXRhbG9nX25hbWVbXSA9ICZxdW90O21lc3NhZ2VzJnF1
b3Q7Ozxicj4NCi0tPGJyPg0KLS0vKiBOYW1lIG9mIGN1cnJlbnRseSB1c2VkIGNhdGFsb2cuwqAg
Ki88YnI+DQotLXN0YXRpYyBjb25zdCBjaGFyICpjYXRhbG9nX25hbWUgPSBkZWZhdWx0X2NhdGFs
b2dfbmFtZTs8YnI+DQotLTxicj4NCi0tLyogR2V0IElEIGZvciBnaXZlbiBzdHJpbmcuwqAgSWYg
bm90IGZvdW5kIHJldHVybiAtMS7CoCAqLzxicj4NCi0tc3RhdGljIGludCBtc2dfdG9fY2F0X2lk
IFBBUkFNUyAoKGNvbnN0IGNoYXIgKm1zZykpOzxicj4NCi0tPGJyPg0KLS0vKiBTdWJzdGl0dXRp
b24gZm9yIHN5c3RlbXMgbGFja2luZyB0aGlzIGZ1bmN0aW9uIGluIHRoZWlyIEMgbGlicmFyeS7C
oCAqLzxicj4NCi0tI2lmICFfTElCQyAmYW1wOyZhbXA7ICFIQVZFX1NUUENQWTxicj4NCi0tc3Rh
dGljIGNoYXIgKnN0cGNweSBQQVJBTVMgKChjaGFyICpkZXN0LCBjb25zdCBjaGFyICpzcmMpKTs8
YnI+DQotLSNlbmRpZjxicj4NCi0tPGJyPg0KLS08YnI+DQotLS8qIFNldCBjdXJyZW50bHkgdXNl
ZCBkb21haW4vY2F0YWxvZy7CoCAqLzxicj4NCi0tY2hhciAqPGJyPg0KLS10ZXh0ZG9tYWluIChk
b21haW5uYW1lKTxicj4NCi0twqAgwqAgwqBjb25zdCBjaGFyICpkb21haW5uYW1lOzxicj4NCi0t
ezxicj4NCi0twqAgbmxfY2F0ZCBuZXdfY2F0YWxvZzs8YnI+DQotLcKgIGNoYXIgKm5ld19uYW1l
Ozxicj4NCi0twqAgc2l6ZV90IG5ld19uYW1lX2xlbjs8YnI+DQotLcKgIGNoYXIgKmxhbmc7PGJy
Pg0KLS08YnI+DQotLSNpZiBkZWZpbmVkIEhBVkVfU0VUTE9DQUxFICZhbXA7JmFtcDsgZGVmaW5l
ZCBIQVZFX0xDX01FU1NBR0VTIFw8YnI+DQotLcKgIMKgICZhbXA7JmFtcDsgZGVmaW5lZCBIQVZF
X0xPQ0FMRV9OVUxMPGJyPg0KLS3CoCBsYW5nID0gc2V0bG9jYWxlIChMQ19NRVNTQUdFUywgTlVM
TCk7PGJyPg0KLS0jZWxzZTxicj4NCi0twqAgbGFuZyA9IGdldGVudiAoJnF1b3Q7TENfQUxMJnF1
b3Q7KTs8YnI+DQotLcKgIGlmIChsYW5nID09IE5VTEwgfHwgbGFuZ1swXSA9PSAmIzM5O1wwJiMz
OTspPGJyPg0KLS3CoCDCoCB7PGJyPg0KLS3CoCDCoCDCoCBsYW5nID0gZ2V0ZW52ICgmcXVvdDtM
Q19NRVNTQUdFUyZxdW90Oyk7PGJyPg0KLS3CoCDCoCDCoCBpZiAobGFuZyA9PSBOVUxMIHx8IGxh
bmdbMF0gPT0gJiMzOTtcMCYjMzk7KTxicj4NCi0twqAgwqAgwqAgbGFuZyA9IGdldGVudiAoJnF1
b3Q7TEFORyZxdW90Oyk7PGJyPg0KLS3CoCDCoCB9PGJyPg0KLS0jZW5kaWY8YnI+DQotLcKgIGlm
IChsYW5nID09IE5VTEwgfHwgbGFuZ1swXSA9PSAmIzM5O1wwJiMzOTspPGJyPg0KLS3CoCDCoCBs
YW5nID0gJnF1b3Q7QyZxdW90Ozs8YnI+DQotLTxicj4NCi0twqAgLyogU2VlIHdoZXRoZXIgbmFt
ZS4uLjxicj48YnI+W01lc3NhZ2UgY2xpcHBlZF3CoMKgPC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48
L2Rpdj4NCg==

--001a114387b803f12c055fd73392--
