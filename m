Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4D07B7E31D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 21:05:08 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id i78so1050975vke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 13:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UDjZm7wE49LJergtjrBZjskaelzeGBtIGKwt/sdR9so=;
	b=HEp+MQzjkfXzYSRoV9JF0yQnAbC0PCbgpXqhXAuZegN7lYhhiZ6A7D4q7JiTK+fmn0
	caGSi0V5z0Ba75atdJKLaV0y8SZ3uNzq5IUImY6z+qwKT89xzyIFqaypeCvcH/ZmQi/N
	QlWPYdzlzSK+z7XWNB7cdgyZ0LB281ytYN+FDX1XarvW8iO/dPuVQBBZ9tGoLk7ychHu
	nxL+20Y8lzrCYzfABMNcFD+FnWput+y/Vlfg8yyPzEHCRuoe9v67H4EAF743KUnAjC9m
	YPJ2L92+DzQgZrJT+lzQsWgWFJreYilJK0rr8mKszl9ELQYg+hgHu3gGpzTxh100AIrs
	utrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UDjZm7wE49LJergtjrBZjskaelzeGBtIGKwt/sdR9so=;
	b=Bm1c1Xks6prh8zmjq+GoactRYmWg+6CluclrW47b/m7w4/6YuaUitAPhU/nzW0i0Bg
	KZk4eQ/lD8X22QQzZZ1+ewPN9YJs3L7FSpQS/W+Ha+/zEKtf+dl768R6FK0bfZgclYeM
	zKJ300TcRgEzSAEhkNkvLiy9K8GciMXQ1tU6w7OPQZpHwBkV7PXZdMB0yNVjo18gQVvS
	3Eo1KdOzhA2TBVANpO7dd/LO0Lv2HPPj14j3DpQWB8sY4Awc+VgmXdBF4/lyRoh4uaVU
	hutT9nA78uRDgjOx9i5qpfSATUmWExNxrM2DNQhOGp+l+89TZJxwWZbb5Ukc7yx1MYlz
	yi4w==
X-Gm-Message-State: APjAAAUvxCxpjn7XUYE2loVyZ6p62gWj4jojwSaSdTRdYQRkcjNW0aNt
	bYuWwpsUVryku57TwgHeEzVM4sKG15T2Xjcq9po=
X-Google-Smtp-Source: APXvYqyzf3DAqEvGQnB2gmMkzkGzstNtZhr5SQ2HbeH2oUoeUtQlhr02/6a8Ign3p0w4MqGNbIxohK84YkUBX2IxKaw=
X-Received: by 2002:a1f:fe45:: with SMTP id l66mr3497935vki.9.1576703107624;
	Wed, 18 Dec 2019 13:05:07 -0800 (PST)
MIME-Version: 1.0
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<8477ddb6-cc2f-dab4-0d9e-95220a222e4b@gmail.com>
In-Reply-To: <8477ddb6-cc2f-dab4-0d9e-95220a222e4b@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Dec 2019 22:04:55 +0100
Message-ID: <CANNYZj-Kg8bzQhvjzcmWzPTHSibNYD32m=HEZgx+eeqtbsw-GA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/25] gettext-minimal-native: update to 0.20.1
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
X-List-Received-Date: Wed, 18 Dec 2019 21:05:09 -0000
Content-Type: multipart/alternative; boundary="000000000000a5743b059a00cc84"

--000000000000a5743b059a00cc84
Content-Type: text/plain; charset="UTF-8"

I have more or less already ordered them that way in the latest patchset:
there's gettext, rpm, python, acl/attr, lttng, followed by everything else.
Let me know if the split is unclear.

The idea is to significantly bring down the amount of outdated recipes in
oe-core, so that in the future we have a manageable amount of outstanding
upgrades to do (e.g. a dozen or two at any given time, rather than over a
hundred). Right now AUH is finishing up its own monthly update crunch, so
that should help too.

Alex

On Wed, 18 Dec 2019 at 21:54, Khem Raj <raj.khem@gmail.com> wrote:

> Alex, good work on these changes, I think it would be good to upstream
> this in three groups.
>
> 1. common updates ( that might have resulted from gettext or python3.8
> update ) but is generally ok
>
> 2. Gettext and related patches
>
> 3. python 3.8 patches
>
> This will give us a good way to consume these changes fast. Right now if
> I throw all these patches and several packages break, it will be harder
> to pin point what the reason is and how best to fix it.
>
> Even if you grouped these patches that way it will help a lot.
>
> On 12/18/19 6:37 AM, Alexander Kanavin wrote:
> > Rather than update a tarball, I took m4 files directly from an install
> of 0.20.1.
> >
> > The patch is dropped as guile has long been removed from oe-core.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   ...H-Disable-the-test-to-convert-euc-jp.patch |  38 -
> >   .../gettext-minimal-0.19.8.1/aclocal.tgz      | Bin 40014 -> 0 bytes
> >   .../COPYING                                   |   0
> >   .../Makefile.in.in                            | 124 +--
> >   .../gettext-minimal-0.20.1/aclocal/gettext.m4 | 386 +++++++++
> >   .../aclocal/host-cpu-c-abi.m4                 | 644 +++++++++++++++
> >   .../gettext-minimal-0.20.1/aclocal/iconv.m4   | 288 +++++++
> >   .../aclocal/intlmacosx.m4                     |  72 ++
> >   .../gettext-minimal-0.20.1/aclocal/lib-ld.m4  | 168 ++++
> >   .../aclocal/lib-link.m4                       | 774 ++++++++++++++++++
> >   .../aclocal/lib-prefix.m4                     | 249 ++++++
> >   .../gettext-minimal-0.20.1/aclocal/nls.m4     |  32 +
> >   .../gettext-minimal-0.20.1/aclocal/po.m4      | 450 ++++++++++
> >   .../aclocal/progtest.m4                       |  91 ++
> >   .../config.rpath                              |   2 +-
> >   .../remove-potcdate.sin                       |   8 +-
> >   ....1.bb => gettext-minimal-native_0.20.1.bb} |   5 +-
> >   17 files changed, 3236 insertions(+), 95 deletions(-)
> >   delete mode 100644
> meta/recipes-core/gettext/gettext-minimal-0.19.8.1/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch
> >   delete mode 100644
> meta/recipes-core/gettext/gettext-minimal-0.19.8.1/aclocal.tgz
> >   rename meta/recipes-core/gettext/{gettext-minimal-0.19.8.1 =>
> gettext-minimal-0.20.1}/COPYING (100%)
> >   rename meta/recipes-core/gettext/{gettext-minimal-0.19.8.1 =>
> gettext-minimal-0.20.1}/Makefile.in.in (78%)
> >   create mode 100644
> meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gettext.m4
> >   create mode 100644
> meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/host-cpu-c-abi.m4
> >   create mode 100644
> meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m4
> >   create mode 100644
> meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/intlmacosx.m4
> >   create mode 100644
> meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld.m4
> >   create mode 100644
> meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-link.m4
> >   create mode 100644
> meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-prefix.m4
> >   create mode 100644
> meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4
> >   create mode 100644
> meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4
> >   create mode 100644
> meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/progtest.m4
> >   rename meta/recipes-core/gettext/{gettext-minimal-0.19.8.1 =>
> gettext-minimal-0.20.1}/config.rpath (99%)
> >   rename meta/recipes-core/gettext/{gettext-minimal-0.19.8.1 =>
> gettext-minimal-0.20.1}/remove-potcdate.sin (50%)
> >   rename meta/recipes-core/gettext/{gettext-minimal-native_0.19.8.1.bb
> => gettext-minimal-native_0.20.1.bb} (86%)
> >
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch
> b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch
> > deleted file mode 100644
> > index 29ef2a5a63d..00000000000
> > ---
> a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -[PATCH] Disable the test to convert euc-jp
> > -
> > -Remove the test "Test against HP-UX 11.11 bug:
> > -No converter from EUC-JP to UTF-8 is provided"
> > -since we don't support HP-UX and if the euc-jp is not
> > -installed on the host, the dependence will be built without
> > -iconv support and will cause guile-native building fail.
> > -
> > -Upstream-Status: Inappropriate [OE specific]
> > -
> > -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > ----
> > - iconv.m4 | 2 ++
> > - 1 file changed, 2 insertions(+)
> > -
> > -diff --git a/iconv.m4 b/iconv.m4
> > -index 4e37363..35f54bd 100644
> > ---- a/iconv.m4
> > -+++ b/iconv.m4
> > -@@ -165,6 +165,7 @@ AC_DEFUN([AM_ICONV_LINK],
> > -       }
> > -   }
> > - #endif
> > -+#if 0
> > -   /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
> > -      provided.  */
> > -   if (/* Try standardized names.  */
> > -@@ -176,6 +177,7 @@ AC_DEFUN([AM_ICONV_LINK],
> > -       /* Try HP-UX names.  */
> > -       && iconv_open ("utf8", "eucJP") == (iconv_t)(-1))
> > -     result |= 16;
> > -+#endif
> > -   return result;
> > - ]])],
> > -           [am_cv_func_iconv_works=yes], ,
> > ---
> > -2.0.1
> > -
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/aclocal.tgz
> b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/aclocal.tgz
> > deleted file mode 100644
> > index
> 9b2d1f561d734df608c9c7a6e29e08131296a5fd..0000000000000000000000000000000000000000
> > GIT binary patch
> > literal 0
> > HcmV?d00001
> >
> > literal 40014
> > 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
> >
> > diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/COPYING
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/COPYING
> > similarity index 100%
> > rename from meta/recipes-core/gettext/gettext-minimal-0.19.8.1/COPYING
> > rename to meta/recipes-core/gettext/gettext-minimal-0.20.1/COPYING
> > diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/
> Makefile.in.in b/meta/recipes-core/gettext/gettext-minimal-0.20.1/
> Makefile.in.in
> > similarity index 78%
> > rename from meta/recipes-core/gettext/gettext-minimal-0.19.8.1/
> Makefile.in.in
> > rename to meta/recipes-core/gettext/gettext-minimal-0.20.1/
> Makefile.in.in
> > index 38c293d2ed2..fdb6ad35881 100644
> > --- a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/Makefile.in.in
> > +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/Makefile.in.in
> > @@ -1,13 +1,14 @@
> >   # Makefile for PO directory in any package using GNU gettext.
> > -# Copyright (C) 1995-1997, 2000-2007, 2009-2010 by Ulrich Drepper <
> drepper@gnu.ai.mit.edu>
> > +# Copyright (C) 1995-2000 Ulrich Drepper <drepper@gnu.ai.mit.edu>
> > +# Copyright (C) 2000-2019 Free Software Foundation, Inc.
> >   #
> >   # Copying and distribution of this file, with or without modification,
> >   # are permitted in any medium without royalty provided the copyright
> >   # notice and this notice are preserved.  This file is offered as-is,
> >   # without any warranty.
> >   #
> > -# Origin: gettext-0.19.8
> > -GETTEXT_MACRO_VERSION = 0.19
> > +# Origin: gettext-0.20
> > +GETTEXT_MACRO_VERSION = 0.20
> >
> >   PACKAGE = @PACKAGE@
> >   VERSION = @VERSION@
> > @@ -52,16 +53,13 @@ GMSGFMT_ = @GMSGFMT@
> >   GMSGFMT_no = @GMSGFMT@
> >   GMSGFMT_yes = @GMSGFMT_015@
> >   GMSGFMT = $(GMSGFMT_$(USE_MSGCTXT))
> > -MSGFMT_ = @MSGFMT@
> > -MSGFMT_no = @MSGFMT@
> > -MSGFMT_yes = @MSGFMT_015@
> > -MSGFMT = $(MSGFMT_$(USE_MSGCTXT))
> >   XGETTEXT_ = @XGETTEXT@
> >   XGETTEXT_no = @XGETTEXT@
> >   XGETTEXT_yes = @XGETTEXT_015@
> >   XGETTEXT = $(XGETTEXT_$(USE_MSGCTXT))
> > -MSGMERGE = msgmerge
> > +MSGMERGE = @MSGMERGE@
> >   MSGMERGE_UPDATE = @MSGMERGE@ --update
> > +MSGMERGE_FOR_MSGFMT_OPTION = @MSGMERGE_FOR_MSGFMT_OPTION@
> >   MSGINIT = msginit
> >   MSGCONV = msgconv
> >   MSGFILTER = msgfilter
> > @@ -93,17 +91,32 @@ DISTFILESDEPS =
> $(DISTFILESDEPS_$(DIST_DEPENDS_ON_UPDATE_PO))
> >   # Makevars gets inserted here. (Don't remove this line!)
> >
> >   .SUFFIXES:
> > -.SUFFIXES: .po .gmo .mo .sed .sin .nop .po-create .po-update
> > -
> > -.po.mo:
> > -     @echo "$(MSGFMT) -c -o $@ $<"; \
> > -     $(MSGFMT) -c -o t-$@ $< && mv t-$@ $@
> > -
> > -.po.gmo:
> > +.SUFFIXES: .po .gmo .sed .sin .nop .po-create .po-update
> > +
> > +# The .pot file, stamp-po, .po files, and .gmo files appear in release
> tarballs.
> > +# The GNU Coding Standards say in
> > +# <https://www.gnu.org/prep/standards/html_node/Makefile-Basics.html>:
> > +#   "GNU distributions usually contain some files which are not source
> files
> > +#    ... . Since these files normally appear in the source directory,
> they
> > +#    should always appear in the source directory, not in the build
> directory.
> > +#    So Makefile rules to update them should put the updated files in
> the
> > +#    source directory."
> > +# Therefore we put these files in the source directory, not the build
> directory.
> > +
> > +# During .po -> .gmo conversion, take into account the most recent
> changes to
> > +# the .pot file. This eliminates the need to update the .po files when
> the
> > +# .pot file has changed, which would be troublesome if the .po files
> are put
> > +# under version control.
> > +.po.gmo: $(srcdir)/$(DOMAIN).pot
> >       @lang=`echo $* | sed -e 's,.*/,,'`; \
> >       test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
> > -     echo "$${cdcmd}rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics
> --verbose -o $${lang}.gmo $${lang}.po"; \
> > -     cd $(srcdir) && rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics
> --verbose -o t-$${lang}.gmo $${lang}.po && mv t-$${lang}.gmo $${lang}.gmo
> > +     echo "$${cdcmd}rm -f $${lang}.gmo && $(MSGMERGE)
> $(MSGMERGE_FOR_MSGFMT_OPTION) -o $${lang}.1po $${lang}.po $(DOMAIN).pot &&
> $(GMSGFMT) -c --statistics --verbose -o $${lang}.gmo $${lang}.1po && rm -f
> $${lang}.1po"; \
> > +     cd $(srcdir) && \
> > +     rm -f $${lang}.gmo && \
> > +     $(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) -o $${lang}.1po
> $${lang}.po $(DOMAIN).pot && \
> > +     $(GMSGFMT) -c --statistics --verbose -o t-$${lang}.gmo
> $${lang}.1po && \
> > +     mv t-$${lang}.gmo $${lang}.gmo && \
> > +     rm -f $${lang}.1po
> >
> >   .sin.sed:
> >       sed -e '/^#/d' $< > t-$@
> > @@ -112,7 +125,7 @@ DISTFILESDEPS =
> $(DISTFILESDEPS_$(DIST_DEPENDS_ON_UPDATE_PO))
> >
> >   all: all-@USE_NLS@
> >
> > -all-yes: stamp-po
> > +all-yes: $(srcdir)/stamp-po
> >   all-no:
> >
> >   # Ensure that the gettext macros and this Makefile.in.in are in sync.
> > @@ -126,24 +139,24 @@ CHECK_MACRO_VERSION = \
> >   # internationalized messages, no $(srcdir)/$(DOMAIN).pot is created
> (because
> >   # we don't want to bother translators with empty POT files). We assume
> that
> >   # LINGUAS is empty in this case, i.e. $(POFILES) and $(GMOFILES) are
> empty.
> > -# In this case, stamp-po is a nop (i.e. a phony target).
> > -
> > -# stamp-po is a timestamp denoting the last time at which the CATALOGS
> have
> > -# been loosely updated. Its purpose is that when a developer or
> translator
> > -# checks out the package via CVS, and the $(DOMAIN).pot file is not in
> CVS,
> > -# "make" will update the $(DOMAIN).pot and the $(CATALOGS), but
> subsequent
> > -# invocations of "make" will do nothing. This timestamp would not be
> necessary
> > -# if updating the $(CATALOGS) would always touch them; however, the
> rule for
> > -# $(POFILES) has been designed to not touch files that don't need to be
> > -# changed.
> > -stamp-po: $(srcdir)/$(DOMAIN).pot
> > +# In this case, $(srcdir)/stamp-po is a nop (i.e. a phony target).
> > +
> > +# $(srcdir)/stamp-po is a timestamp denoting the last time at which the
> CATALOGS
> > +# have been loosely updated. Its purpose is that when a developer or
> translator
> > +# checks out the package from a version control system, and the
> $(DOMAIN).pot
> > +# file is not under version control, "make" will update the
> $(DOMAIN).pot and
> > +# the $(CATALOGS), but subsequent invocations of "make" will do
> nothing. This
> > +# timestamp would not be necessary if updating the $(CATALOGS) would
> always
> > +# touch them; however, the rule for $(POFILES) has been designed to not
> touch
> > +# files that don't need to be changed.
> > +$(srcdir)/stamp-po: $(srcdir)/$(DOMAIN).pot
> >       @$(CHECK_MACRO_VERSION)
> >       test ! -f $(srcdir)/$(DOMAIN).pot || \
> >         test -z "$(GMOFILES)" || $(MAKE) $(GMOFILES)
> >       @test ! -f $(srcdir)/$(DOMAIN).pot || { \
> > -       echo "touch stamp-po" && \
> > -       echo timestamp > stamp-poT && \
> > -       mv stamp-poT stamp-po; \
> > +       echo "touch $(srcdir)/stamp-po" && \
> > +       echo timestamp > $(srcdir)/stamp-poT && \
> > +       mv $(srcdir)/stamp-poT $(srcdir)/stamp-po; \
> >       }
> >
> >   # Note: Target 'all' must not depend on target '$(DOMAIN).pot-update',
> > @@ -159,11 +172,9 @@ $(DOMAIN).pot-update: $(POTFILES)
> $(srcdir)/POTFILES.in remove-potcdate.sed
> >       package_gnu="$(PACKAGE_GNU)"; \
> >       test -n "$$package_gnu" || { \
> >         if { if (LC_ALL=C find --version) 2>/dev/null | grep GNU
> >/dev/null; then \
> > -              LC_ALL=C find -L $(top_srcdir) -maxdepth 1 -type f \
> > -                            -size -10000000c -exec grep 'GNU @PACKAGE@'
> \
> > -                            /dev/null '{}' ';' 2>/dev/null; \
> > +              LC_ALL=C find -L $(top_srcdir) -maxdepth 1 -type f -size
> -10000000c -exec grep -i 'GNU @PACKAGE@' /dev/null '{}' ';' 2>/dev/null; \
> >              else \
> > -              LC_ALL=C grep 'GNU @PACKAGE@' $(top_srcdir)/*
> 2>/dev/null; \
> > +              LC_ALL=C grep -i 'GNU @PACKAGE@' $(top_srcdir)/*
> 2>/dev/null; \
> >              fi; \
> >            } | grep -v 'libtool:' >/dev/null; then \
> >            package_gnu=yes; \
> > @@ -184,26 +195,29 @@ $(DOMAIN).pot-update: $(POTFILES)
> $(srcdir)/POTFILES.in remove-potcdate.sed
> >       case `$(XGETTEXT) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
> >         '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].* | 0.16 |
> 0.16.[0-1]*) \
> >           $(XGETTEXT) --default-domain=$(DOMAIN)
> --directory=$(top_srcdir) \
> > -           --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS)
> @XGETTEXT_EXTRA_OPTIONS@ \
> > +           --add-comments=TRANSLATORS: \
> >             --files-from=$(srcdir)/POTFILES.in \
> >             --copyright-holder='$(COPYRIGHT_HOLDER)' \
> >             --msgid-bugs-address="$$msgid_bugs_address" \
> > +           $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
> >           ;; \
> >         *) \
> >           $(XGETTEXT) --default-domain=$(DOMAIN)
> --directory=$(top_srcdir) \
> > -           --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS)
> @XGETTEXT_EXTRA_OPTIONS@ \
> > +           --add-comments=TRANSLATORS: \
> >             --files-from=$(srcdir)/POTFILES.in \
> >             --copyright-holder='$(COPYRIGHT_HOLDER)' \
> >             --package-name="$${package_prefix}@PACKAGE@" \
> >             --package-version='@VERSION@' \
> >             --msgid-bugs-address="$$msgid_bugs_address" \
> > +           $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
> >           ;; \
> >       esac
> >       test ! -f $(DOMAIN).po || { \
> >         if test -f $(srcdir)/$(DOMAIN).pot-header; then \
> >           sed -e '1,/^#$$/d' < $(DOMAIN).po > $(DOMAIN).1po && \
> > -         cat $(srcdir)/$(DOMAIN).pot-header $(DOMAIN).1po >
> $(DOMAIN).po; \
> > -         rm -f $(DOMAIN).1po; \
> > +         cat $(srcdir)/$(DOMAIN).pot-header $(DOMAIN).1po >
> $(DOMAIN).po && \
> > +         rm -f $(DOMAIN).1po \
> > +         || exit 1; \
> >         fi; \
> >         if test -f $(srcdir)/$(DOMAIN).pot; then \
> >           sed -f remove-potcdate.sed < $(srcdir)/$(DOMAIN).pot >
> $(DOMAIN).1po && \
> > @@ -228,17 +242,19 @@ $(srcdir)/$(DOMAIN).pot:
> >   # This target rebuilds a PO file if $(DOMAIN).pot has changed.
> >   # Note that a PO file is not touched if it doesn't need to be changed.
> >   $(POFILES): $(POFILESDEPS)
> > +     @test -f $(srcdir)/$(DOMAIN).pot || $(MAKE) $(srcdir)/$(DOMAIN).pot
> >       @lang=`echo $@ | sed -e 's,.*/,,' -e 's/\.po$$//'`; \
> >       if test -f "$(srcdir)/$${lang}.po"; then \
> > -       test -f $(srcdir)/$(DOMAIN).pot || $(MAKE)
> $(srcdir)/$(DOMAIN).pot; \
> >         test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
> > -       echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS)
> --lang=$${lang} $${lang}.po $(DOMAIN).pot"; \
> > +       echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS)
> --lang=$${lang} --previous $${lang}.po $(DOMAIN).pot"; \
> >         cd $(srcdir) \
> > -         && { case `$(MSGMERGE) --version | sed 1q | sed -e
> 's,^[^0-9]*,,'` in \
> > -                '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
> > +         && { case `$(MSGMERGE_UPDATE) --version | sed 1q | sed -e
> 's,^[^0-9]*,,'` in \
> > +                '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].*) \
> >                    $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) $${lang}.po
> $(DOMAIN).pot;; \
> > +                0.1[6-7] | 0.1[6-7].*) \
> > +                  $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --previous
> $${lang}.po $(DOMAIN).pot;; \
> >                  *) \
> > -                  $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS)
> --lang=$${lang} $${lang}.po $(DOMAIN).pot;; \
> > +                  $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS)
> --lang=$${lang} --previous $${lang}.po $(DOMAIN).pot;; \
> >                esac; \
> >              }; \
> >       else \
> > @@ -373,28 +389,30 @@ check: all
> >
> >   info dvi ps pdf html tags TAGS ctags CTAGS ID:
> >
> > +install-dvi install-ps install-pdf install-html:
> > +
> >   mostlyclean:
> >       rm -f remove-potcdate.sed
> > -     rm -f stamp-poT
> > +     rm -f $(srcdir)/stamp-poT
> >       rm -f core core.* $(DOMAIN).po $(DOMAIN).1po $(DOMAIN).2po *.new.po
> >       rm -fr *.o
> >
> >   clean: mostlyclean
> >
> >   distclean: clean
> > -     rm -f Makefile Makefile.in POTFILES *.mo
> > +     rm -f Makefile Makefile.in POTFILES
> >
> >   maintainer-clean: distclean
> >       @echo "This command is intended for maintainers to use;"
> >       @echo "it deletes files that may require special tools to rebuild."
> > -     rm -f stamp-po $(GMOFILES)
> > +     rm -f $(srcdir)/$(DOMAIN).pot $(srcdir)/stamp-po $(GMOFILES)
> >
> >   distdir = $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)
> >   dist distdir:
> >       test -z "$(DISTFILESDEPS)" || $(MAKE) $(DISTFILESDEPS)
> >       @$(MAKE) dist2
> >   # This is a separate target because 'update-po' must be executed
> before.
> > -dist2: stamp-po $(DISTFILES)
> > +dist2: $(srcdir)/stamp-po $(DISTFILES)
> >       dists="$(DISTFILES)"; \
> >       if test "$(PACKAGE)" = "gettext-tools"; then \
> >         dists="$$dists Makevars.template"; \
> > @@ -439,13 +457,15 @@ update-po: Makefile
> >       tmpdir=`pwd`; \
> >       echo "$$lang:"; \
> >       test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
> > -     echo "$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang
> $$lang.po $(DOMAIN).pot -o $$lang.new.po"; \
> > +     echo "$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang
> --previous $$lang.po $(DOMAIN).pot -o $$lang.new.po"; \
> >       cd $(srcdir); \
> >       if { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-9]*,,'`
> in \
> > -            '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
> > +            '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].*) \
> >                $(MSGMERGE) $(MSGMERGE_OPTIONS) -o $$tmpdir/$$lang.new.po
> $$lang.po $(DOMAIN).pot;; \
> > +            0.1[6-7] | 0.1[6-7].*) \
> > +              $(MSGMERGE) $(MSGMERGE_OPTIONS) --previous -o
> $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
> >              *) \
> > -              $(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang -o
> $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
> > +              $(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang --previous
> -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
> >            esac; \
> >          }; then \
> >         if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gettext.m4
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gettext.m4
> > new file mode 100644
> > index 00000000000..e7832418ea1
> > --- /dev/null
> > +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gettext.m4
> > @@ -0,0 +1,386 @@
> > +# gettext.m4 serial 70 (gettext-0.20)
> > +dnl Copyright (C) 1995-2014, 2016, 2018 Free Software Foundation, Inc.
> > +dnl This file is free software; the Free Software Foundation
> > +dnl gives unlimited permission to copy and/or distribute it,
> > +dnl with or without modifications, as long as this notice is preserved.
> > +dnl
> > +dnl This file can be used in projects which are not available under
> > +dnl the GNU General Public License or the GNU Library General Public
> > +dnl License but which still want to provide support for the GNU gettext
> > +dnl functionality.
> > +dnl Please note that the actual code of the GNU gettext library is
> covered
> > +dnl by the GNU Library General Public License, and the rest of the GNU
> > +dnl gettext package is covered by the GNU General Public License.
> > +dnl They are *not* in the public domain.
> > +
> > +dnl Authors:
> > +dnl   Ulrich Drepper <drepper@cygnus.com>, 1995-2000.
> > +dnl   Bruno Haible <haible@clisp.cons.org>, 2000-2006, 2008-2010.
> > +
> > +dnl Macro to add for using GNU gettext.
> > +
> > +dnl Usage: AM_GNU_GETTEXT([INTLSYMBOL], [NEEDSYMBOL], [INTLDIR]).
> > +dnl INTLSYMBOL must be one of 'external', 'use-libtool'.
> > +dnl    INTLSYMBOL should be 'external' for packages other than GNU
> gettext, and
> > +dnl    'use-libtool' for the packages 'gettext-runtime' and
> 'gettext-tools'.
> > +dnl    If INTLSYMBOL is 'use-libtool', then a libtool library
> > +dnl    $(top_builddir)/intl/libintl.la will be created (shared and/or
> static,
> > +dnl    depending on --{enable,disable}-{shared,static} and on the
> presence of
> > +dnl    AM-DISABLE-SHARED).
> > +dnl If NEEDSYMBOL is specified and is 'need-ngettext', then GNU gettext
> > +dnl    implementations (in libc or libintl) without the ngettext()
> function
> > +dnl    will be ignored.  If NEEDSYMBOL is specified and is
> > +dnl    'need-formatstring-macros', then GNU gettext implementations
> that don't
> > +dnl    support the ISO C 99 <inttypes.h> formatstring macros will be
> ignored.
> > +dnl INTLDIR is used to find the intl libraries.  If empty,
> > +dnl    the value '$(top_builddir)/intl/' is used.
> > +dnl
> > +dnl The result of the configuration is one of three cases:
> > +dnl 1) GNU gettext, as included in the intl subdirectory, will be
> compiled
> > +dnl    and used.
> > +dnl    Catalog format: GNU --> install in $(datadir)
> > +dnl    Catalog extension: .mo after installation, .gmo in source tree
> > +dnl 2) GNU gettext has been found in the system's C library.
> > +dnl    Catalog format: GNU --> install in $(datadir)
> > +dnl    Catalog extension: .mo after installation, .gmo in source tree
> > +dnl 3) No internationalization, always use English msgid.
> > +dnl    Catalog format: none
> > +dnl    Catalog extension: none
> > +dnl If INTLSYMBOL is 'external', only cases 2 and 3 can occur.
> > +dnl The use of .gmo is historical (it was needed to avoid overwriting
> the
> > +dnl GNU format catalogs when building on a platform with an X/Open
> gettext),
> > +dnl but we keep it in order not to force irrelevant filename changes on
> the
> > +dnl maintainers.
> > +dnl
> > +AC_DEFUN([AM_GNU_GETTEXT],
> > +[
> > +  dnl Argument checking.
> > +  ifelse([$1], [], , [ifelse([$1], [external], , [ifelse([$1],
> [use-libtool], ,
> > +    [errprint([ERROR: invalid first argument to AM_GNU_GETTEXT
> > +])])])])
> > +  ifelse(ifelse([$1], [], [old])[]ifelse([$1], [no-libtool], [old]),
> [old],
> > +    [errprint([ERROR: Use of AM_GNU_GETTEXT without [external] argument
> is no longer supported.
> > +])])
> > +  ifelse([$2], [], , [ifelse([$2], [need-ngettext], , [ifelse([$2],
> [need-formatstring-macros], ,
> > +    [errprint([ERROR: invalid second argument to AM_GNU_GETTEXT
> > +])])])])
> > +  define([gt_included_intl],
> > +    ifelse([$1], [external], [no], [yes]))
> > +  gt_NEEDS_INIT
> > +  AM_GNU_GETTEXT_NEED([$2])
> > +
> > +  AC_REQUIRE([AM_PO_SUBDIRS])dnl
> > +  ifelse(gt_included_intl, yes, [
> > +    AC_REQUIRE([AM_INTL_SUBDIR])dnl
> > +  ])
> > +
> > +  dnl Prerequisites of AC_LIB_LINKFLAGS_BODY.
> > +  AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
> > +  AC_REQUIRE([AC_LIB_RPATH])
> > +
> > +  dnl Sometimes libintl requires libiconv, so first search for libiconv.
> > +  dnl Ideally we would do this search only after the
> > +  dnl      if test "$USE_NLS" = "yes"; then
> > +  dnl        if { eval "gt_val=\$$gt_func_gnugettext_libc"; test
> "$gt_val" != "yes"; }; then
> > +  dnl tests. But if configure.in invokes AM_ICONV after AM_GNU_GETTEXT
> > +  dnl the configure script would need to contain the same shell code
> > +  dnl again, outside any 'if'. There are two solutions:
> > +  dnl - Invoke AM_ICONV_LINKFLAGS_BODY here, outside any 'if'.
> > +  dnl - Control the expansions in more detail using AC_PROVIDE_IFELSE.
> > +  dnl Since AC_PROVIDE_IFELSE is not documented, we avoid it.
> > +  ifelse(gt_included_intl, yes, , [
> > +    AC_REQUIRE([AM_ICONV_LINKFLAGS_BODY])
> > +  ])
> > +
> > +  dnl Sometimes, on Mac OS X, libintl requires linking with
> CoreFoundation.
> > +  gt_INTL_MACOSX
> > +
> > +  dnl Set USE_NLS.
> > +  AC_REQUIRE([AM_NLS])
> > +
> > +  ifelse(gt_included_intl, yes, [
> > +    BUILD_INCLUDED_LIBINTL=no
> > +    USE_INCLUDED_LIBINTL=no
> > +  ])
> > +  LIBINTL=
> > +  LTLIBINTL=
> > +  POSUB=
> > +
> > +  dnl Add a version number to the cache macros.
> > +  case " $gt_needs " in
> > +    *" need-formatstring-macros "*) gt_api_version=3 ;;
> > +    *" need-ngettext "*) gt_api_version=2 ;;
> > +    *) gt_api_version=1 ;;
> > +  esac
> > +  gt_func_gnugettext_libc="gt_cv_func_gnugettext${gt_api_version}_libc"
> > +
> gt_func_gnugettext_libintl="gt_cv_func_gnugettext${gt_api_version}_libintl"
> > +
> > +  dnl If we use NLS figure out what method
> > +  if test "$USE_NLS" = "yes"; then
> > +    gt_use_preinstalled_gnugettext=no
> > +    ifelse(gt_included_intl, yes, [
> > +      AC_MSG_CHECKING([whether included gettext is requested])
> > +      AC_ARG_WITH([included-gettext],
> > +        [  --with-included-gettext use the GNU gettext library included
> here],
> > +        nls_cv_force_use_gnu_gettext=$withval,
> > +        nls_cv_force_use_gnu_gettext=no)
> > +      AC_MSG_RESULT([$nls_cv_force_use_gnu_gettext])
> > +
> > +      nls_cv_use_gnu_gettext="$nls_cv_force_use_gnu_gettext"
> > +      if test "$nls_cv_force_use_gnu_gettext" != "yes"; then
> > +    ])
> > +        dnl User does not insist on using GNU NLS library.  Figure out
> what
> > +        dnl to use.  If GNU gettext is available we use this.  Else we
> have
> > +        dnl to fall back to GNU NLS library.
> > +
> > +        if test $gt_api_version -ge 3; then
> > +          gt_revision_test_code='
> > +#ifndef __GNU_GETTEXT_SUPPORTED_REVISION
> > +#define __GNU_GETTEXT_SUPPORTED_REVISION(major) ((major) == 0 ? 0 : -1)
> > +#endif
> > +changequote(,)dnl
> > +typedef int array [2 * (__GNU_GETTEXT_SUPPORTED_REVISION(0) >= 1) - 1];
> > +changequote([,])dnl
> > +'
> > +        else
> > +          gt_revision_test_code=
> > +        fi
> > +        if test $gt_api_version -ge 2; then
> > +          gt_expression_test_code=' + * ngettext ("", "", 0)'
> > +        else
> > +          gt_expression_test_code=
> > +        fi
> > +
> > +        AC_CACHE_CHECK([for GNU gettext in libc],
> [$gt_func_gnugettext_libc],
> > +         [AC_LINK_IFELSE(
> > +            [AC_LANG_PROGRAM(
> > +               [[
> > +#include <libintl.h>
> > +#ifndef __GNU_GETTEXT_SUPPORTED_REVISION
> > +extern int _nl_msg_cat_cntr;
> > +extern int *_nl_domain_bindings;
> > +#define __GNU_GETTEXT_SYMBOL_EXPRESSION (_nl_msg_cat_cntr +
> *_nl_domain_bindings)
> > +#else
> > +#define __GNU_GETTEXT_SYMBOL_EXPRESSION 0
> > +#endif
> > +$gt_revision_test_code
> > +               ]],
> > +               [[
> > +bindtextdomain ("", "");
> > +return * gettext ("")$gt_expression_test_code +
> __GNU_GETTEXT_SYMBOL_EXPRESSION
> > +               ]])],
> > +            [eval "$gt_func_gnugettext_libc=yes"],
> > +            [eval "$gt_func_gnugettext_libc=no"])])
> > +
> > +        if { eval "gt_val=\$$gt_func_gnugettext_libc"; test "$gt_val"
> != "yes"; }; then
> > +          dnl Sometimes libintl requires libiconv, so first search for
> libiconv.
> > +          ifelse(gt_included_intl, yes, , [
> > +            AM_ICONV_LINK
> > +          ])
> > +          dnl Search for libintl and define LIBINTL, LTLIBINTL and
> INCINTL
> > +          dnl accordingly. Don't use
> AC_LIB_LINKFLAGS_BODY([intl],[iconv])
> > +          dnl because that would add "-liconv" to LIBINTL and LTLIBINTL
> > +          dnl even if libiconv doesn't exist.
> > +          AC_LIB_LINKFLAGS_BODY([intl])
> > +          AC_CACHE_CHECK([for GNU gettext in libintl],
> > +            [$gt_func_gnugettext_libintl],
> > +           [gt_save_CPPFLAGS="$CPPFLAGS"
> > +            CPPFLAGS="$CPPFLAGS $INCINTL"
> > +            gt_save_LIBS="$LIBS"
> > +            LIBS="$LIBS $LIBINTL"
> > +            dnl Now see whether libintl exists and does not depend on
> libiconv.
> > +            AC_LINK_IFELSE(
> > +              [AC_LANG_PROGRAM(
> > +                 [[
> > +#include <libintl.h>
> > +#ifndef __GNU_GETTEXT_SUPPORTED_REVISION
> > +extern int _nl_msg_cat_cntr;
> > +extern
> > +#ifdef __cplusplus
> > +"C"
> > +#endif
> > +const char *_nl_expand_alias (const char *);
> > +#define __GNU_GETTEXT_SYMBOL_EXPRESSION (_nl_msg_cat_cntr +
> *_nl_expand_alias (""))
> > +#else
> > +#define __GNU_GETTEXT_SYMBOL_EXPRESSION 0
> > +#endif
> > +$gt_revision_test_code
> > +                 ]],
> > +                 [[
> > +bindtextdomain ("", "");
> > +return * gettext ("")$gt_expression_test_code +
> __GNU_GETTEXT_SYMBOL_EXPRESSION
> > +                 ]])],
> > +              [eval "$gt_func_gnugettext_libintl=yes"],
> > +              [eval "$gt_func_gnugettext_libintl=no"])
> > +            dnl Now see whether libintl exists and depends on libiconv.
> > +            if { eval "gt_val=\$$gt_func_gnugettext_libintl"; test
> "$gt_val" != yes; } && test -n "$LIBICONV"; then
> > +              LIBS="$LIBS $LIBICONV"
> > +              AC_LINK_IFELSE(
> > +                [AC_LANG_PROGRAM(
> > +                   [[
> > +#include <libintl.h>
> > +#ifndef __GNU_GETTEXT_SUPPORTED_REVISION
> > +extern int _nl_msg_cat_cntr;
> > +extern
> > +#ifdef __cplusplus
> > +"C"
> > +#endif
> > +const char *_nl_expand_alias (const char *);
> > +#define __GNU_GETTEXT_SYMBOL_EXPRESSION (_nl_msg_cat_cntr +
> *_nl_expand_alias (""))
> > +#else
> > +#define __GNU_GETTEXT_SYMBOL_EXPRESSION 0
> > +#endif
> > +$gt_revision_test_code
> > +                   ]],
> > +                   [[
> > +bindtextdomain ("", "");
> > +return * gettext ("")$gt_expression_test_code +
> __GNU_GETTEXT_SYMBOL_EXPRESSION
> > +                   ]])],
> > +                [LIBINTL="$LIBINTL $LIBICONV"
> > +                 LTLIBINTL="$LTLIBINTL $LTLIBICONV"
> > +                 eval "$gt_func_gnugettext_libintl=yes"
> > +                ])
> > +            fi
> > +            CPPFLAGS="$gt_save_CPPFLAGS"
> > +            LIBS="$gt_save_LIBS"])
> > +        fi
> > +
> > +        dnl If an already present or preinstalled GNU gettext() is
> found,
> > +        dnl use it.  But if this macro is used in GNU gettext, and GNU
> > +        dnl gettext is already preinstalled in libintl, we update this
> > +        dnl libintl.  (Cf. the install rule in intl/Makefile.in.)
> > +        if { eval "gt_val=\$$gt_func_gnugettext_libc"; test "$gt_val" =
> "yes"; } \
> > +           || { { eval "gt_val=\$$gt_func_gnugettext_libintl"; test
> "$gt_val" = "yes"; } \
> > +                && test "$PACKAGE" != gettext-runtime \
> > +                && test "$PACKAGE" != gettext-tools; }; then
> > +          gt_use_preinstalled_gnugettext=yes
> > +        else
> > +          dnl Reset the values set by searching for libintl.
> > +          LIBINTL=
> > +          LTLIBINTL=
> > +          INCINTL=
> > +        fi
> > +
> > +    ifelse(gt_included_intl, yes, [
> > +        if test "$gt_use_preinstalled_gnugettext" != "yes"; then
> > +          dnl GNU gettext is not found in the C library.
> > +          dnl Fall back on included GNU gettext library.
> > +          nls_cv_use_gnu_gettext=yes
> > +        fi
> > +      fi
> > +
> > +      if test "$nls_cv_use_gnu_gettext" = "yes"; then
> > +        dnl Mark actions used to generate GNU NLS library.
> > +        BUILD_INCLUDED_LIBINTL=yes
> > +        USE_INCLUDED_LIBINTL=yes
> > +        LIBINTL="ifelse([$3],[],\${top_builddir}/intl,[$3])/libintl.la
> $LIBICONV $LIBTHREAD"
> > +        LTLIBINTL="ifelse([$3],[],\${top_builddir}/intl,[$3])/
> libintl.la $LTLIBICONV $LTLIBTHREAD"
> > +        LIBS=`echo " $LIBS " | sed -e 's/ -lintl / /' -e 's/^ //' -e
> 's/ $//'`
> > +      fi
> > +
> > +      CATOBJEXT=
> > +      if test "$gt_use_preinstalled_gnugettext" = "yes" \
> > +         || test "$nls_cv_use_gnu_gettext" = "yes"; then
> > +        dnl Mark actions to use GNU gettext tools.
> > +        CATOBJEXT=.gmo
> > +      fi
> > +    ])
> > +
> > +    if test -n "$INTL_MACOSX_LIBS"; then
> > +      if test "$gt_use_preinstalled_gnugettext" = "yes" \
> > +         || test "$nls_cv_use_gnu_gettext" = "yes"; then
> > +        dnl Some extra flags are needed during linking.
> > +        LIBINTL="$LIBINTL $INTL_MACOSX_LIBS"
> > +        LTLIBINTL="$LTLIBINTL $INTL_MACOSX_LIBS"
> > +      fi
> > +    fi
> > +
> > +    if test "$gt_use_preinstalled_gnugettext" = "yes" \
> > +       || test "$nls_cv_use_gnu_gettext" = "yes"; then
> > +      AC_DEFINE([ENABLE_NLS], [1],
> > +        [Define to 1 if translation of program messages to the user's
> native language
> > +   is requested.])
> > +    else
> > +      USE_NLS=no
> > +    fi
> > +  fi
> > +
> > +  AC_MSG_CHECKING([whether to use NLS])
> > +  AC_MSG_RESULT([$USE_NLS])
> > +  if test "$USE_NLS" = "yes"; then
> > +    AC_MSG_CHECKING([where the gettext function comes from])
> > +    if test "$gt_use_preinstalled_gnugettext" = "yes"; then
> > +      if { eval "gt_val=\$$gt_func_gnugettext_libintl"; test "$gt_val"
> = "yes"; }; then
> > +        gt_source="external libintl"
> > +      else
> > +        gt_source="libc"
> > +      fi
> > +    else
> > +      gt_source="included intl directory"
> > +    fi
> > +    AC_MSG_RESULT([$gt_source])
> > +  fi
> > +
> > +  if test "$USE_NLS" = "yes"; then
> > +
> > +    if test "$gt_use_preinstalled_gnugettext" = "yes"; then
> > +      if { eval "gt_val=\$$gt_func_gnugettext_libintl"; test "$gt_val"
> = "yes"; }; then
> > +        AC_MSG_CHECKING([how to link with libintl])
> > +        AC_MSG_RESULT([$LIBINTL])
> > +        AC_LIB_APPENDTOVAR([CPPFLAGS], [$INCINTL])
> > +      fi
> > +
> > +      dnl For backward compatibility. Some packages may be using this.
> > +      AC_DEFINE([HAVE_GETTEXT], [1],
> > +       [Define if the GNU gettext() function is already present or
> preinstalled.])
> > +      AC_DEFINE([HAVE_DCGETTEXT], [1],
> > +       [Define if the GNU dcgettext() function is already present or
> preinstalled.])
> > +    fi
> > +
> > +    dnl We need to process the po/ directory.
> > +    POSUB=po
> > +  fi
> > +
> > +  ifelse(gt_included_intl, yes, [
> > +    dnl In GNU gettext we have to set BUILD_INCLUDED_LIBINTL to 'yes'
> > +    dnl because some of the testsuite requires it.
> > +    BUILD_INCLUDED_LIBINTL=yes
> > +
> > +    dnl Make all variables we use known to autoconf.
> > +    AC_SUBST([BUILD_INCLUDED_LIBINTL])
> > +    AC_SUBST([USE_INCLUDED_LIBINTL])
> > +    AC_SUBST([CATOBJEXT])
> > +  ])
> > +
> > +  dnl For backward compatibility. Some Makefiles may be using this.
> > +  INTLLIBS="$LIBINTL"
> > +  AC_SUBST([INTLLIBS])
> > +
> > +  dnl Make all documented variables known to autoconf.
> > +  AC_SUBST([LIBINTL])
> > +  AC_SUBST([LTLIBINTL])
> > +  AC_SUBST([POSUB])
> > +])
> > +
> > +
> > +dnl gt_NEEDS_INIT ensures that the gt_needs variable is initialized.
> > +m4_define([gt_NEEDS_INIT],
> > +[
> > +  m4_divert_text([DEFAULTS], [gt_needs=])
> > +  m4_define([gt_NEEDS_INIT], [])
> > +])
> > +
> > +
> > +dnl Usage: AM_GNU_GETTEXT_NEED([NEEDSYMBOL])
> > +AC_DEFUN([AM_GNU_GETTEXT_NEED],
> > +[
> > +  m4_divert_text([INIT_PREPARE], [gt_needs="$gt_needs $1"])
> > +])
> > +
> > +
> > +dnl Usage: AM_GNU_GETTEXT_VERSION([gettext-version])
> > +AC_DEFUN([AM_GNU_GETTEXT_VERSION], [])
> > +
> > +
> > +dnl Usage: AM_GNU_GETTEXT_REQUIRE_VERSION([gettext-version])
> > +AC_DEFUN([AM_GNU_GETTEXT_REQUIRE_VERSION], [])
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/host-cpu-c-abi.m4
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/host-cpu-c-abi.m4
> > new file mode 100644
> > index 00000000000..4407296d084
> > --- /dev/null
> > +++
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/host-cpu-c-abi.m4
> > @@ -0,0 +1,644 @@
> > +# host-cpu-c-abi.m4 serial 11
> > +dnl Copyright (C) 2002-2019 Free Software Foundation, Inc.
> > +dnl This file is free software; the Free Software Foundation
> > +dnl gives unlimited permission to copy and/or distribute it,
> > +dnl with or without modifications, as long as this notice is preserved.
> > +
> > +dnl From Bruno Haible and Sam Steingold.
> > +
> > +dnl Sets the HOST_CPU variable to the canonical name of the CPU.
> > +dnl Sets the HOST_CPU_C_ABI variable to the canonical name of the CPU
> with its
> > +dnl C language ABI (application binary interface).
> > +dnl Also defines __${HOST_CPU}__ and __${HOST_CPU_C_ABI}__ as C macros
> in
> > +dnl config.h.
> > +dnl
> > +dnl This canonical name can be used to select a particular assembly
> language
> > +dnl source file that will interoperate with C code on the given host.
> > +dnl
> > +dnl For example:
> > +dnl * 'i386' and 'sparc' are different canonical names, because code
> for i386
> > +dnl   will not run on SPARC CPUs and vice versa. They have different
> > +dnl   instruction sets.
> > +dnl * 'sparc' and 'sparc64' are different canonical names, because code
> for
> > +dnl   'sparc' and code for 'sparc64' cannot be linked together: 'sparc'
> code
> > +dnl   contains 32-bit instructions, whereas 'sparc64' code contains
> 64-bit
> > +dnl   instructions. A process on a SPARC CPU can be in 32-bit mode or
> in 64-bit
> > +dnl   mode, but not both.
> > +dnl * 'mips' and 'mipsn32' are different canonical names, because they
> use
> > +dnl   different argument passing and return conventions for C
> functions, and
> > +dnl   although the instruction set of 'mips' is a large subset of the
> > +dnl   instruction set of 'mipsn32'.
> > +dnl * 'mipsn32' and 'mips64' are different canonical names, because
> they use
> > +dnl   different sizes for the C types like 'int' and 'void *', and
> although
> > +dnl   the instruction sets of 'mipsn32' and 'mips64' are the same.
> > +dnl * The same canonical name is used for different endiannesses. You
> can
> > +dnl   determine the endianness through preprocessor symbols:
> > +dnl   - 'arm': test __ARMEL__.
> > +dnl   - 'mips', 'mipsn32', 'mips64': test _MIPSEB vs. _MIPSEL.
> > +dnl   - 'powerpc64': test _BIG_ENDIAN vs. _LITTLE_ENDIAN.
> > +dnl * The same name 'i386' is used for CPUs of type i386, i486, i586
> > +dnl   (Pentium), AMD K7, Pentium II, Pentium IV, etc., because
> > +dnl   - Instructions that do not exist on all of these CPUs (cmpxchg,
> > +dnl     MMX, SSE, SSE2, 3DNow! etc.) are not frequently used. If your
> > +dnl     assembly language source files use such instructions, you will
> > +dnl     need to make the distinction.
> > +dnl   - Speed of execution of the common instruction set is reasonable
> across
> > +dnl     the entire family of CPUs. If you have assembly language source
> files
> > +dnl     that are optimized for particular CPU types (like GNU gmp has),
> you
> > +dnl     will need to make the distinction.
> > +dnl   See <https://en.wikipedia.org/wiki/X86_instruction_listings>.
> > +AC_DEFUN([gl_HOST_CPU_C_ABI],
> > +[
> > +  AC_REQUIRE([AC_CANONICAL_HOST])
> > +  AC_REQUIRE([gl_C_ASM])
> > +  AC_CACHE_CHECK([host CPU and C ABI], [gl_cv_host_cpu_c_abi],
> > +    [case "$host_cpu" in
> > +
> > +changequote(,)dnl
> > +       i[4567]86 )
> > +changequote([,])dnl
> > +         gl_cv_host_cpu_c_abi=i386
> > +         ;;
> > +
> > +       x86_64 )
> > +         # On x86_64 systems, the C compiler may be generating code in
> one of
> > +         # these ABIs:
> > +         # - 64-bit instruction set, 64-bit pointers, 64-bit 'long':
> x86_64.
> > +         # - 64-bit instruction set, 64-bit pointers, 32-bit 'long':
> x86_64
> > +         #   with native Windows (mingw, MSVC).
> > +         # - 64-bit instruction set, 32-bit pointers, 32-bit 'long':
> x86_64-x32.
> > +         # - 32-bit instruction set, 32-bit pointers, 32-bit 'long':
> i386.
> > +         AC_COMPILE_IFELSE(
> > +           [AC_LANG_SOURCE(
> > +              [[#if (defined __x86_64__ || defined __amd64__ \
> > +                     || defined _M_X64 || defined _M_AMD64)
> > +                 int ok;
> > +                #else
> > +                 error fail
> > +                #endif
> > +              ]])],
> > +           [AC_COMPILE_IFELSE(
> > +              [AC_LANG_SOURCE(
> > +                 [[#if defined __ILP32__ || defined _ILP32
> > +                    int ok;
> > +                   #else
> > +                    error fail
> > +                   #endif
> > +                 ]])],
> > +              [gl_cv_host_cpu_c_abi=x86_64-x32],
> > +              [gl_cv_host_cpu_c_abi=x86_64])],
> > +           [gl_cv_host_cpu_c_abi=i386])
> > +         ;;
> > +
> > +changequote(,)dnl
> > +       alphaev[4-8] | alphaev56 | alphapca5[67] | alphaev6[78] )
> > +changequote([,])dnl
> > +         gl_cv_host_cpu_c_abi=alpha
> > +         ;;
> > +
> > +       arm* | aarch64 )
> > +         # Assume arm with EABI.
> > +         # On arm64 systems, the C compiler may be generating code in
> one of
> > +         # these ABIs:
> > +         # - aarch64 instruction set, 64-bit pointers, 64-bit 'long':
> arm64.
> > +         # - aarch64 instruction set, 32-bit pointers, 32-bit 'long':
> arm64-ilp32.
> > +         # - 32-bit instruction set, 32-bit pointers, 32-bit 'long':
> arm or armhf.
> > +         AC_COMPILE_IFELSE(
> > +           [AC_LANG_SOURCE(
> > +              [[#ifdef __aarch64__
> > +                 int ok;
> > +                #else
> > +                 error fail
> > +                #endif
> > +              ]])],
> > +           [AC_COMPILE_IFELSE(
> > +              [AC_LANG_SOURCE(
> > +                [[#if defined __ILP32__ || defined _ILP32
> > +                   int ok;
> > +                  #else
> > +                   error fail
> > +                  #endif
> > +                ]])],
> > +              [gl_cv_host_cpu_c_abi=arm64-ilp32],
> > +              [gl_cv_host_cpu_c_abi=arm64])],
> > +           [# Don't distinguish little-endian and big-endian arm, since
> they
> > +            # don't require different machine code for simple
> operations and
> > +            # since the user can distinguish them through the
> preprocessor
> > +            # defines __ARMEL__ vs. __ARMEB__.
> > +            # But distinguish arm which passes floating-point arguments
> and
> > +            # return values in integer registers (r0, r1, ...) - this is
> > +            # gcc -mfloat-abi=soft or gcc -mfloat-abi=softfp - from arm
> which
> > +            # passes them in float registers (s0, s1, ...) and double
> registers
> > +            # (d0, d1, ...) - this is gcc -mfloat-abi=hard. GCC 4.6 or
> newer
> > +            # sets the preprocessor defines __ARM_PCS (for the first
> case) and
> > +            # __ARM_PCS_VFP (for the second case), but older GCC does
> not.
> > +            echo 'double ddd; void func (double dd) { ddd = dd; }' >
> conftest.c
> > +            # Look for a reference to the register d0 in the .s file.
> > +            AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS $gl_c_asm_opt
> conftest.c) >/dev/null 2>&1
> > +            if LC_ALL=C grep 'd0,' conftest.$gl_asmext >/dev/null; then
> > +              gl_cv_host_cpu_c_abi=armhf
> > +            else
> > +              gl_cv_host_cpu_c_abi=arm
> > +            fi
> > +            rm -f conftest*
> > +           ])
> > +         ;;
> > +
> > +       hppa1.0 | hppa1.1 | hppa2.0* | hppa64 )
> > +         # On hppa, the C compiler may be generating 32-bit code or
> 64-bit
> > +         # code. In the latter case, it defines _LP64 and __LP64__.
> > +         AC_COMPILE_IFELSE(
> > +           [AC_LANG_SOURCE(
> > +              [[#ifdef __LP64__
> > +                 int ok;
> > +                #else
> > +                 error fail
> > +                #endif
> > +              ]])],
> > +           [gl_cv_host_cpu_c_abi=hppa64],
> > +           [gl_cv_host_cpu_c_abi=hppa])
> > +         ;;
> > +
> > +       ia64* )
> > +         # On ia64 on HP-UX, the C compiler may be generating 64-bit
> code or
> > +         # 32-bit code. In the latter case, it defines _ILP32.
> > +         AC_COMPILE_IFELSE(
> > +           [AC_LANG_SOURCE(
> > +              [[#ifdef _ILP32
> > +                 int ok;
> > +                #else
> > +                 error fail
> > +                #endif
> > +              ]])],
> > +           [gl_cv_host_cpu_c_abi=ia64-ilp32],
> > +           [gl_cv_host_cpu_c_abi=ia64])
> > +         ;;
> > +
> > +       mips* )
> > +         # We should also check for (_MIPS_SZPTR == 64), but gcc keeps
> this
> > +         # at 32.
> > +         AC_COMPILE_IFELSE(
> > +           [AC_LANG_SOURCE(
> > +              [[#if defined _MIPS_SZLONG && (_MIPS_SZLONG == 64)
> > +                 int ok;
> > +                #else
> > +                 error fail
> > +                #endif
> > +              ]])],
> > +           [gl_cv_host_cpu_c_abi=mips64],
> > +           [# In the n32 ABI, _ABIN32 is defined, _ABIO32 is not
> defined (but
> > +            # may later get defined by <sgidefs.h>), and _MIPS_SIM ==
> _ABIN32.
> > +            # In the 32 ABI, _ABIO32 is defined, _ABIN32 is not defined
> (but
> > +            # may later get defined by <sgidefs.h>), and _MIPS_SIM ==
> _ABIO32.
> > +            AC_COMPILE_IFELSE(
> > +              [AC_LANG_SOURCE(
> > +                 [[#if (_MIPS_SIM == _ABIN32)
> > +                    int ok;
> > +                   #else
> > +                    error fail
> > +                   #endif
> > +                 ]])],
> > +              [gl_cv_host_cpu_c_abi=mipsn32],
> > +              [gl_cv_host_cpu_c_abi=mips])])
> > +         ;;
> > +
> > +       powerpc* )
> > +         # Different ABIs are in use on AIX vs. Mac OS X vs. Linux,*BSD.
> > +         # No need to distinguish them here; the caller may distinguish
> > +         # them based on the OS.
> > +         # On powerpc64 systems, the C compiler may still be generating
> > +         # 32-bit code. And on powerpc-ibm-aix systems, the C compiler
> may
> > +         # be generating 64-bit code.
> > +         AC_COMPILE_IFELSE(
> > +           [AC_LANG_SOURCE(
> > +              [[#if defined __powerpc64__ || defined _ARCH_PPC64
> > +                 int ok;
> > +                #else
> > +                 error fail
> > +                #endif
> > +              ]])],
> > +           [# On powerpc64, there are two ABIs on Linux: The AIX
> compatible
> > +            # one and the ELFv2 one. The latter defines _CALL_ELF=2.
> > +            AC_COMPILE_IFELSE(
> > +              [AC_LANG_SOURCE(
> > +                 [[#if defined _CALL_ELF && _CALL_ELF == 2
> > +                    int ok;
> > +                   #else
> > +                    error fail
> > +                   #endif
> > +                 ]])],
> > +              [gl_cv_host_cpu_c_abi=powerpc64-elfv2],
> > +              [gl_cv_host_cpu_c_abi=powerpc64])
> > +           ],
> > +           [gl_cv_host_cpu_c_abi=powerpc])
> > +         ;;
> > +
> > +       rs6000 )
> > +         gl_cv_host_cpu_c_abi=powerpc
> > +         ;;
> > +
> > +       riscv32 | riscv64 )
> > +         # There are 2 architectures (with variants): rv32* and rv64*.
> > +         AC_COMPILE_IFELSE(
> > +           [AC_LANG_SOURCE(
> > +              [[#if __riscv_xlen == 64
> > +                  int ok;
> > +                #else
> > +                  error fail
> > +                #endif
> > +              ]])],
> > +           [cpu=riscv64],
> > +           [cpu=riscv32])
> > +         # There are 6 ABIs: ilp32, ilp32f, ilp32d, lp64, lp64f, lp64d.
> > +         # Size of 'long' and 'void *':
> > +         AC_COMPILE_IFELSE(
> > +           [AC_LANG_SOURCE(
> > +              [[#if defined __LP64__
> > +                  int ok;
> > +                #else
> > +                  error fail
> > +                #endif
> > +              ]])],
> > +           [main_abi=lp64],
> > +           [main_abi=ilp32])
> > +         # Float ABIs:
> > +         # __riscv_float_abi_double:
> > +         #   'float' and 'double' are passed in floating-point
> registers.
> > +         # __riscv_float_abi_single:
> > +         #   'float' are passed in floating-point registers.
> > +         # __riscv_float_abi_soft:
> > +         #   No values are passed in floating-point registers.
> > +         AC_COMPILE_IFELSE(
> > +           [AC_LANG_SOURCE(
> > +              [[#if defined __riscv_float_abi_double
> > +                  int ok;
> > +                #else
> > +                  error fail
> > +                #endif
> > +              ]])],
> > +           [float_abi=d],
> > +           [AC_COMPILE_IFELSE(
> > +              [AC_LANG_SOURCE(
> > +                 [[#if defined __riscv_float_abi_single
> > +                     int ok;
> > +                   #else
> > +                     error fail
> > +                   #endif
> > +                 ]])],
> > +              [float_abi=f],
> > +              [float_abi=''])
> > +           ])
> > +         gl_cv_host_cpu_c_abi="${cpu}-${main_abi}${float_abi}"
> > +         ;;
> > +
> > +       s390* )
> > +         # On s390x, the C compiler may be generating 64-bit (= s390x)
> code
> > +         # or 31-bit (= s390) code.
> > +         AC_COMPILE_IFELSE(
> > +           [AC_LANG_SOURCE(
> > +              [[#if defined __LP64__ || defined __s390x__
> > +                  int ok;
> > +                #else
> > +                  error fail
> > +                #endif
> > +              ]])],
> > +           [gl_cv_host_cpu_c_abi=s390x],
> > +           [gl_cv_host_cpu_c_abi=s390])
> > +         ;;
> > +
> > +       sparc | sparc64 )
> > +         # UltraSPARCs running Linux have `uname -m` = "sparc64", but
> the
> > +         # C compiler still generates 32-bit code.
> > +         AC_COMPILE_IFELSE(
> > +           [AC_LANG_SOURCE(
> > +              [[#if defined __sparcv9 || defined __arch64__
> > +                 int ok;
> > +                #else
> > +                 error fail
> > +                #endif
> > +              ]])],
> > +           [gl_cv_host_cpu_c_abi=sparc64],
> > +           [gl_cv_host_cpu_c_abi=sparc])
> > +         ;;
> > +
> > +       *)
> > +         gl_cv_host_cpu_c_abi="$host_cpu"
> > +         ;;
> > +     esac
> > +    ])
> > +
> > +  dnl In most cases, $HOST_CPU and $HOST_CPU_C_ABI are the same.
> > +  HOST_CPU=`echo "$gl_cv_host_cpu_c_abi" | sed -e 's/-.*//'`
> > +  HOST_CPU_C_ABI="$gl_cv_host_cpu_c_abi"
> > +  AC_SUBST([HOST_CPU])
> > +  AC_SUBST([HOST_CPU_C_ABI])
> > +
> > +  # This was
> > +  #   AC_DEFINE_UNQUOTED([__${HOST_CPU}__])
> > +  #   AC_DEFINE_UNQUOTED([__${HOST_CPU_C_ABI}__])
> > +  # earlier, but KAI C++ 3.2d doesn't like this.
> > +  sed -e 's/-/_/g' >> confdefs.h <<EOF
> > +#ifndef __${HOST_CPU}__
> > +#define __${HOST_CPU}__ 1
> > +#endif
> > +#ifndef __${HOST_CPU_C_ABI}__
> > +#define __${HOST_CPU_C_ABI}__ 1
> > +#endif
> > +EOF
> > +  AH_TOP([/* CPU and C ABI indicator */
> > +#ifndef __i386__
> > +#undef __i386__
> > +#endif
> > +#ifndef __x86_64_x32__
> > +#undef __x86_64_x32__
> > +#endif
> > +#ifndef __x86_64__
> > +#undef __x86_64__
> > +#endif
> > +#ifndef __alpha__
> > +#undef __alpha__
> > +#endif
> > +#ifndef __arm__
> > +#undef __arm__
> > +#endif
> > +#ifndef __armhf__
> > +#undef __armhf__
> > +#endif
> > +#ifndef __arm64_ilp32__
> > +#undef __arm64_ilp32__
> > +#endif
> > +#ifndef __arm64__
> > +#undef __arm64__
> > +#endif
> > +#ifndef __hppa__
> > +#undef __hppa__
> > +#endif
> > +#ifndef __hppa64__
> > +#undef __hppa64__
> > +#endif
> > +#ifndef __ia64_ilp32__
> > +#undef __ia64_ilp32__
> > +#endif
> > +#ifndef __ia64__
> > +#undef __ia64__
> > +#endif
> > +#ifndef __m68k__
> > +#undef __m68k__
> > +#endif
> > +#ifndef __mips__
> > +#undef __mips__
> > +#endif
> > +#ifndef __mipsn32__
> > +#undef __mipsn32__
> > +#endif
> > +#ifndef __mips64__
> > +#undef __mips64__
> > +#endif
> > +#ifndef __powerpc__
> > +#undef __powerpc__
> > +#endif
> > +#ifndef __powerpc64__
> > +#undef __powerpc64__
> > +#endif
> > +#ifndef __powerpc64_elfv2__
> > +#undef __powerpc64_elfv2__
> > +#endif
> > +#ifndef __riscv32__
> > +#undef __riscv32__
> > +#endif
> > +#ifndef __riscv64__
> > +#undef __riscv64__
> > +#endif
> > +#ifndef __riscv32_ilp32__
> > +#undef __riscv32_ilp32__
> > +#endif
> > +#ifndef __riscv32_ilp32f__
> > +#undef __riscv32_ilp32f__
> > +#endif
> > +#ifndef __riscv32_ilp32d__
> > +#undef __riscv32_ilp32d__
> > +#endif
> > +#ifndef __riscv64_ilp32__
> > +#undef __riscv64_ilp32__
> > +#endif
> > +#ifndef __riscv64_ilp32f__
> > +#undef __riscv64_ilp32f__
> > +#endif
> > +#ifndef __riscv64_ilp32d__
> > +#undef __riscv64_ilp32d__
> > +#endif
> > +#ifndef __riscv64_lp64__
> > +#undef __riscv64_lp64__
> > +#endif
> > +#ifndef __riscv64_lp64f__
> > +#undef __riscv64_lp64f__
> > +#endif
> > +#ifndef __riscv64_lp64d__
> > +#undef __riscv64_lp64d__
> > +#endif
> > +#ifndef __s390__
> > +#undef __s390__
> > +#endif
> > +#ifndef __s390x__
> > +#undef __s390x__
> > +#endif
> > +#ifndef __sh__
> > +#undef __sh__
> > +#endif
> > +#ifndef __sparc__
> > +#undef __sparc__
> > +#endif
> > +#ifndef __sparc64__
> > +#undef __sparc64__
> > +#endif
> > +])
> > +
> > +])
> > +
> > +
> > +dnl Sets the HOST_CPU_C_ABI_32BIT variable to 'yes' if the C language
> ABI
> > +dnl (application binary interface) is a 32-bit one, or to 'no'
> otherwise.
> > +dnl This is a simplified variant of gl_HOST_CPU_C_ABI.
> > +AC_DEFUN([gl_HOST_CPU_C_ABI_32BIT],
> > +[
> > +  AC_REQUIRE([AC_CANONICAL_HOST])
> > +  AC_CACHE_CHECK([32-bit host C ABI], [gl_cv_host_cpu_c_abi_32bit],
> > +    [if test -n "$gl_cv_host_cpu_c_abi"; then
> > +       case "$gl_cv_host_cpu_c_abi" in
> > +         i386 | x86_64-x32 | arm | armhf | arm64-ilp32 | hppa |
> ia64-ilp32 | mips | mipsn32 | powerpc | riscv*-ilp32* | s390 | sparc)
> > +           gl_cv_host_cpu_c_abi_32bit=yes ;;
> > +         *)
> > +           gl_cv_host_cpu_c_abi_32bit=no ;;
> > +       esac
> > +     else
> > +       case "$host_cpu" in
> > +
> > +changequote(,)dnl
> > +         i[4567]86 )
> > +changequote([,])dnl
> > +           gl_cv_host_cpu_c_abi_32bit=yes
> > +           ;;
> > +
> > +         x86_64 )
> > +           # On x86_64 systems, the C compiler may be generating code
> in one of
> > +           # these ABIs:
> > +           # - 64-bit instruction set, 64-bit pointers, 64-bit 'long':
> x86_64.
> > +           # - 64-bit instruction set, 64-bit pointers, 32-bit 'long':
> x86_64
> > +           #   with native Windows (mingw, MSVC).
> > +           # - 64-bit instruction set, 32-bit pointers, 32-bit 'long':
> x86_64-x32.
> > +           # - 32-bit instruction set, 32-bit pointers, 32-bit 'long':
> i386.
> > +           AC_COMPILE_IFELSE(
> > +             [AC_LANG_SOURCE(
> > +                [[#if (defined __x86_64__ || defined __amd64__ \
> > +                       || defined _M_X64 || defined _M_AMD64) \
> > +                      && !(defined __ILP32__ || defined _ILP32)
> > +                   int ok;
> > +                  #else
> > +                   error fail
> > +                  #endif
> > +                ]])],
> > +             [gl_cv_host_cpu_c_abi_32bit=no],
> > +             [gl_cv_host_cpu_c_abi_32bit=yes])
> > +           ;;
> > +
> > +         arm* | aarch64 )
> > +           # Assume arm with EABI.
> > +           # On arm64 systems, the C compiler may be generating code in
> one of
> > +           # these ABIs:
> > +           # - aarch64 instruction set, 64-bit pointers, 64-bit 'long':
> arm64.
> > +           # - aarch64 instruction set, 32-bit pointers, 32-bit 'long':
> arm64-ilp32.
> > +           # - 32-bit instruction set, 32-bit pointers, 32-bit 'long':
> arm or armhf.
> > +           AC_COMPILE_IFELSE(
> > +             [AC_LANG_SOURCE(
> > +                [[#if defined __aarch64__ && !(defined __ILP32__ ||
> defined _ILP32)
> > +                   int ok;
> > +                  #else
> > +                   error fail
> > +                  #endif
> > +                ]])],
> > +             [gl_cv_host_cpu_c_abi_32bit=no],
> > +             [gl_cv_host_cpu_c_abi_32bit=yes])
> > +           ;;
> > +
> > +         hppa1.0 | hppa1.1 | hppa2.0* | hppa64 )
> > +           # On hppa, the C compiler may be generating 32-bit code or
> 64-bit
> > +           # code. In the latter case, it defines _LP64 and __LP64__.
> > +           AC_COMPILE_IFELSE(
> > +             [AC_LANG_SOURCE(
> > +                [[#ifdef __LP64__
> > +                   int ok;
> > +                  #else
> > +                   error fail
> > +                  #endif
> > +                ]])],
> > +             [gl_cv_host_cpu_c_abi_32bit=no],
> > +             [gl_cv_host_cpu_c_abi_32bit=yes])
> > +           ;;
> > +
> > +         ia64* )
> > +           # On ia64 on HP-UX, the C compiler may be generating 64-bit
> code or
> > +           # 32-bit code. In the latter case, it defines _ILP32.
> > +           AC_COMPILE_IFELSE(
> > +             [AC_LANG_SOURCE(
> > +                [[#ifdef _ILP32
> > +                   int ok;
> > +                  #else
> > +                   error fail
> > +                  #endif
> > +                ]])],
> > +             [gl_cv_host_cpu_c_abi_32bit=yes],
> > +             [gl_cv_host_cpu_c_abi_32bit=no])
> > +           ;;
> > +
> > +         mips* )
> > +           # We should also check for (_MIPS_SZPTR == 64), but gcc
> keeps this
> > +           # at 32.
> > +           AC_COMPILE_IFELSE(
> > +             [AC_LANG_SOURCE(
> > +                [[#if defined _MIPS_SZLONG && (_MIPS_SZLONG == 64)
> > +                   int ok;
> > +                  #else
> > +                   error fail
> > +                  #endif
> > +                ]])],
> > +             [gl_cv_host_cpu_c_abi_32bit=no],
> > +             [gl_cv_host_cpu_c_abi_32bit=yes])
> > +           ;;
> > +
> > +         powerpc* )
> > +           # Different ABIs are in use on AIX vs. Mac OS X vs.
> Linux,*BSD.
> > +           # No need to distinguish them here; the caller may
> distinguish
> > +           # them based on the OS.
> > +           # On powerpc64 systems, the C compiler may still be
> generating
> > +           # 32-bit code. And on powerpc-ibm-aix systems, the C
> compiler may
> > +           # be generating 64-bit code.
> > +           AC_COMPILE_IFELSE(
> > +             [AC_LANG_SOURCE(
> > +                [[#if defined __powerpc64__ || defined _ARCH_PPC64
> > +                   int ok;
> > +                  #else
> > +                   error fail
> > +                  #endif
> > +                ]])],
> > +             [gl_cv_host_cpu_c_abi_32bit=no],
> > +             [gl_cv_host_cpu_c_abi_32bit=yes])
> > +           ;;
> > +
> > +         rs6000 )
> > +           gl_cv_host_cpu_c_abi_32bit=yes
> > +           ;;
> > +
> > +         riscv32 | riscv64 )
> > +           # There are 6 ABIs: ilp32, ilp32f, ilp32d, lp64, lp64f,
> lp64d.
> > +           # Size of 'long' and 'void *':
> > +           AC_COMPILE_IFELSE(
> > +             [AC_LANG_SOURCE(
> > +                [[#if defined __LP64__
> > +                    int ok;
> > +                  #else
> > +                    error fail
> > +                  #endif
> > +                ]])],
> > +             [gl_cv_host_cpu_c_abi_32bit=no],
> > +             [gl_cv_host_cpu_c_abi_32bit=yes])
> > +           ;;
> > +
> > +         s390* )
> > +           # On s390x, the C compiler may be generating 64-bit (=
> s390x) code
> > +           # or 31-bit (= s390) code.
> > +           AC_COMPILE_IFELSE(
> > +             [AC_LANG_SOURCE(
> > +                [[#if defined __LP64__ || defined __s390x__
> > +                    int ok;
> > +                  #else
> > +                    error fail
> > +                  #endif
> > +                ]])],
> > +             [gl_cv_host_cpu_c_abi_32bit=no],
> > +             [gl_cv_host_cpu_c_abi_32bit=yes])
> > +           ;;
> > +
> > +         sparc | sparc64 )
> > +           # UltraSPARCs running Linux have `uname -m` = "sparc64", but
> the
> > +           # C compiler still generates 32-bit code.
> > +           AC_COMPILE_IFELSE(
> > +             [AC_LANG_SOURCE(
> > +                [[#if defined __sparcv9 || defined __arch64__
> > +                   int ok;
> > +                  #else
> > +                   error fail
> > +                  #endif
> > +                ]])],
> > +             [gl_cv_host_cpu_c_abi_32bit=no],
> > +             [gl_cv_host_cpu_c_abi_32bit=yes])
> > +           ;;
> > +
> > +         *)
> > +           gl_cv_host_cpu_c_abi_32bit=no
> > +           ;;
> > +       esac
> > +     fi
> > +    ])
> > +
> > +  HOST_CPU_C_ABI_32BIT="$gl_cv_host_cpu_c_abi_32bit"
> > +])
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m4
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m4
> > new file mode 100644
> > index 00000000000..a285e9daa5e
> > --- /dev/null
> > +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m4
> > @@ -0,0 +1,288 @@
> > +# iconv.m4 serial 21
> > +dnl Copyright (C) 2000-2002, 2007-2014, 2016-2019 Free Software
> Foundation,
> > +dnl Inc.
> > +dnl This file is free software; the Free Software Foundation
> > +dnl gives unlimited permission to copy and/or distribute it,
> > +dnl with or without modifications, as long as this notice is preserved.
> > +
> > +dnl From Bruno Haible.
> > +
> > +AC_DEFUN([AM_ICONV_LINKFLAGS_BODY],
> > +[
> > +  dnl Prerequisites of AC_LIB_LINKFLAGS_BODY.
> > +  AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
> > +  AC_REQUIRE([AC_LIB_RPATH])
> > +
> > +  dnl Search for libiconv and define LIBICONV, LTLIBICONV and INCICONV
> > +  dnl accordingly.
> > +  AC_LIB_LINKFLAGS_BODY([iconv])
> > +])
> > +
> > +AC_DEFUN([AM_ICONV_LINK],
> > +[
> > +  dnl Some systems have iconv in libc, some have it in libiconv (OSF/1
> and
> > +  dnl those with the standalone portable GNU libiconv installed).
> > +  AC_REQUIRE([AC_CANONICAL_HOST]) dnl for cross-compiles
> > +
> > +  dnl Search for libiconv and define LIBICONV, LTLIBICONV and INCICONV
> > +  dnl accordingly.
> > +  AC_REQUIRE([AM_ICONV_LINKFLAGS_BODY])
> > +
> > +  dnl Add $INCICONV to CPPFLAGS before performing the following checks,
> > +  dnl because if the user has installed libiconv and not disabled its
> use
> > +  dnl via --without-libiconv-prefix, he wants to use it. The first
> > +  dnl AC_LINK_IFELSE will then fail, the second AC_LINK_IFELSE will
> succeed.
> > +  am_save_CPPFLAGS="$CPPFLAGS"
> > +  AC_LIB_APPENDTOVAR([CPPFLAGS], [$INCICONV])
> > +
> > +  AC_CACHE_CHECK([for iconv], [am_cv_func_iconv], [
> > +    am_cv_func_iconv="no, consider installing GNU libiconv"
> > +    am_cv_lib_iconv=no
> > +    AC_LINK_IFELSE(
> > +      [AC_LANG_PROGRAM(
> > +         [[
> > +#include <stdlib.h>
> > +#include <iconv.h>
> > +         ]],
> > +         [[iconv_t cd = iconv_open("","");
> > +           iconv(cd,NULL,NULL,NULL,NULL);
> > +           iconv_close(cd);]])],
> > +      [am_cv_func_iconv=yes])
> > +    if test "$am_cv_func_iconv" != yes; then
> > +      am_save_LIBS="$LIBS"
> > +      LIBS="$LIBS $LIBICONV"
> > +      AC_LINK_IFELSE(
> > +        [AC_LANG_PROGRAM(
> > +           [[
> > +#include <stdlib.h>
> > +#include <iconv.h>
> > +           ]],
> > +           [[iconv_t cd = iconv_open("","");
> > +             iconv(cd,NULL,NULL,NULL,NULL);
> > +             iconv_close(cd);]])],
> > +        [am_cv_lib_iconv=yes]
> > +        [am_cv_func_iconv=yes])
> > +      LIBS="$am_save_LIBS"
> > +    fi
> > +  ])
> > +  if test "$am_cv_func_iconv" = yes; then
> > +    AC_CACHE_CHECK([for working iconv], [am_cv_func_iconv_works], [
> > +      dnl This tests against bugs in AIX 5.1, AIX 6.1..7.1, HP-UX 11.11,
> > +      dnl Solaris 10.
> > +      am_save_LIBS="$LIBS"
> > +      if test $am_cv_lib_iconv = yes; then
> > +        LIBS="$LIBS $LIBICONV"
> > +      fi
> > +      am_cv_func_iconv_works=no
> > +      for ac_iconv_const in '' 'const'; do
> > +        AC_RUN_IFELSE(
> > +          [AC_LANG_PROGRAM(
> > +             [[
> > +#include <iconv.h>
> > +#include <string.h>
> > +
> > +#ifndef ICONV_CONST
> > +# define ICONV_CONST $ac_iconv_const
> > +#endif
> > +             ]],
> > +             [[int result = 0;
> > +  /* Test against AIX 5.1 bug: Failures are not distinguishable from
> successful
> > +     returns.  */
> > +  {
> > +    iconv_t cd_utf8_to_88591 = iconv_open ("ISO8859-1", "UTF-8");
> > +    if (cd_utf8_to_88591 != (iconv_t)(-1))
> > +      {
> > +        static ICONV_CONST char input[] = "\342\202\254"; /* EURO SIGN
> */
> > +        char buf[10];
> > +        ICONV_CONST char *inptr = input;
> > +        size_t inbytesleft = strlen (input);
> > +        char *outptr = buf;
> > +        size_t outbytesleft = sizeof (buf);
> > +        size_t res = iconv (cd_utf8_to_88591,
> > +                            &inptr, &inbytesleft,
> > +                            &outptr, &outbytesleft);
> > +        if (res == 0)
> > +          result |= 1;
> > +        iconv_close (cd_utf8_to_88591);
> > +      }
> > +  }
> > +  /* Test against Solaris 10 bug: Failures are not distinguishable from
> > +     successful returns.  */
> > +  {
> > +    iconv_t cd_ascii_to_88591 = iconv_open ("ISO8859-1", "646");
> > +    if (cd_ascii_to_88591 != (iconv_t)(-1))
> > +      {
> > +        static ICONV_CONST char input[] = "\263";
> > +        char buf[10];
> > +        ICONV_CONST char *inptr = input;
> > +        size_t inbytesleft = strlen (input);
> > +        char *outptr = buf;
> > +        size_t outbytesleft = sizeof (buf);
> > +        size_t res = iconv (cd_ascii_to_88591,
> > +                            &inptr, &inbytesleft,
> > +                            &outptr, &outbytesleft);
> > +        if (res == 0)
> > +          result |= 2;
> > +        iconv_close (cd_ascii_to_88591);
> > +      }
> > +  }
> > +  /* Test against AIX 6.1..7.1 bug: Buffer overrun.  */
> > +  {
> > +    iconv_t cd_88591_to_utf8 = iconv_open ("UTF-8", "ISO-8859-1");
> > +    if (cd_88591_to_utf8 != (iconv_t)(-1))
> > +      {
> > +        static ICONV_CONST char input[] = "\304";
> > +        static char buf[2] = { (char)0xDE, (char)0xAD };
> > +        ICONV_CONST char *inptr = input;
> > +        size_t inbytesleft = 1;
> > +        char *outptr = buf;
> > +        size_t outbytesleft = 1;
> > +        size_t res = iconv (cd_88591_to_utf8,
> > +                            &inptr, &inbytesleft,
> > +                            &outptr, &outbytesleft);
> > +        if (res != (size_t)(-1) || outptr - buf > 1 || buf[1] !=
> (char)0xAD)
> > +          result |= 4;
> > +        iconv_close (cd_88591_to_utf8);
> > +      }
> > +  }
> > +#if 0 /* This bug could be worked around by the caller.  */
> > +  /* Test against HP-UX 11.11 bug: Positive return value instead of 0.
> */
> > +  {
> > +    iconv_t cd_88591_to_utf8 = iconv_open ("utf8", "iso88591");
> > +    if (cd_88591_to_utf8 != (iconv_t)(-1))
> > +      {
> > +        static ICONV_CONST char input[] = "\304rger mit b\366sen
> B\374bchen ohne Augenma\337";
> > +        char buf[50];
> > +        ICONV_CONST char *inptr = input;
> > +        size_t inbytesleft = strlen (input);
> > +        char *outptr = buf;
> > +        size_t outbytesleft = sizeof (buf);
> > +        size_t res = iconv (cd_88591_to_utf8,
> > +                            &inptr, &inbytesleft,
> > +                            &outptr, &outbytesleft);
> > +        if ((int)res > 0)
> > +          result |= 8;
> > +        iconv_close (cd_88591_to_utf8);
> > +      }
> > +  }
> > +#endif
> > +  /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
> > +     provided.  */
> > +  {
> > +    /* Try standardized names.  */
> > +    iconv_t cd1 = iconv_open ("UTF-8", "EUC-JP");
> > +    /* Try IRIX, OSF/1 names.  */
> > +    iconv_t cd2 = iconv_open ("UTF-8", "eucJP");
> > +    /* Try AIX names.  */
> > +    iconv_t cd3 = iconv_open ("UTF-8", "IBM-eucJP");
> > +    /* Try HP-UX names.  */
> > +    iconv_t cd4 = iconv_open ("utf8", "eucJP");
> > +    if (cd1 == (iconv_t)(-1) && cd2 == (iconv_t)(-1)
> > +        && cd3 == (iconv_t)(-1) && cd4 == (iconv_t)(-1))
> > +      result |= 16;
> > +    if (cd1 != (iconv_t)(-1))
> > +      iconv_close (cd1);
> > +    if (cd2 != (iconv_t)(-1))
> > +      iconv_close (cd2);
> > +    if (cd3 != (iconv_t)(-1))
> > +      iconv_close (cd3);
> > +    if (cd4 != (iconv_t)(-1))
> > +      iconv_close (cd4);
> > +  }
> > +  return result;
> > +]])],
> > +          [am_cv_func_iconv_works=yes], ,
> > +          [case "$host_os" in
> > +             aix* | hpux*) am_cv_func_iconv_works="guessing no" ;;
> > +             *)            am_cv_func_iconv_works="guessing yes" ;;
> > +           esac])
> > +        test "$am_cv_func_iconv_works" = no || break
> > +      done
> > +      LIBS="$am_save_LIBS"
> > +    ])
> > +    case "$am_cv_func_iconv_works" in
> > +      *no) am_func_iconv=no am_cv_lib_iconv=no ;;
> > +      *)   am_func_iconv=yes ;;
> > +    esac
> > +  else
> > +    am_func_iconv=no am_cv_lib_iconv=no
> > +  fi
> > +  if test "$am_func_iconv" = yes; then
> > +    AC_DEFINE([HAVE_ICONV], [1],
> > +      [Define if you have the iconv() function and it works.])
> > +  fi
> > +  if test "$am_cv_lib_iconv" = yes; then
> > +    AC_MSG_CHECKING([how to link with libiconv])
> > +    AC_MSG_RESULT([$LIBICONV])
> > +  else
> > +    dnl If $LIBICONV didn't lead to a usable library, we don't need
> $INCICONV
> > +    dnl either.
> > +    CPPFLAGS="$am_save_CPPFLAGS"
> > +    LIBICONV=
> > +    LTLIBICONV=
> > +  fi
> > +  AC_SUBST([LIBICONV])
> > +  AC_SUBST([LTLIBICONV])
> > +])
> > +
> > +dnl Define AM_ICONV using AC_DEFUN_ONCE for Autoconf >= 2.64, in order
> to
> > +dnl avoid warnings like
> > +dnl "warning: AC_REQUIRE: `AM_ICONV' was expanded before it was
> required".
> > +dnl This is tricky because of the way 'aclocal' is implemented:
> > +dnl - It requires defining an auxiliary macro whose name ends in
> AC_DEFUN.
> > +dnl   Otherwise aclocal's initial scan pass would miss the macro
> definition.
> > +dnl - It requires a line break inside the AC_DEFUN_ONCE and AC_DEFUN
> expansions.
> > +dnl   Otherwise aclocal would emit many "Use of uninitialized value $1"
> > +dnl   warnings.
> > +m4_define([gl_iconv_AC_DEFUN],
> > +  m4_version_prereq([2.64],
> > +    [[AC_DEFUN_ONCE(
> > +        [$1], [$2])]],
> > +    [m4_ifdef([gl_00GNULIB],
> > +       [[AC_DEFUN_ONCE(
> > +           [$1], [$2])]],
> > +       [[AC_DEFUN(
> > +           [$1], [$2])]])]))
> > +gl_iconv_AC_DEFUN([AM_ICONV],
> > +[
> > +  AM_ICONV_LINK
> > +  if test "$am_cv_func_iconv" = yes; then
> > +    AC_MSG_CHECKING([for iconv declaration])
> > +    AC_CACHE_VAL([am_cv_proto_iconv], [
> > +      AC_COMPILE_IFELSE(
> > +        [AC_LANG_PROGRAM(
> > +           [[
> > +#include <stdlib.h>
> > +#include <iconv.h>
> > +extern
> > +#ifdef __cplusplus
> > +"C"
> > +#endif
> > +#if defined(__STDC__) || defined(_MSC_VER) || defined(__cplusplus)
> > +size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char *
> *outbuf, size_t *outbytesleft);
> > +#else
> > +size_t iconv();
> > +#endif
> > +           ]],
> > +           [[]])],
> > +        [am_cv_proto_iconv_arg1=""],
> > +        [am_cv_proto_iconv_arg1="const"])
> > +      am_cv_proto_iconv="extern size_t iconv (iconv_t cd,
> $am_cv_proto_iconv_arg1 char * *inbuf, size_t *inbytesleft, char * *outbuf,
> size_t *outbytesleft);"])
> > +    am_cv_proto_iconv=`echo "[$]am_cv_proto_iconv" | tr -s ' ' | sed -e
> 's/( /(/'`
> > +    AC_MSG_RESULT([
> > +         $am_cv_proto_iconv])
> > +  else
> > +    dnl When compiling GNU libiconv on a system that does not have
> iconv yet,
> > +    dnl pick the POSIX compliant declaration without 'const'.
> > +    am_cv_proto_iconv_arg1=""
> > +  fi
> > +  AC_DEFINE_UNQUOTED([ICONV_CONST], [$am_cv_proto_iconv_arg1],
> > +    [Define as const if the declaration of iconv() needs const.])
> > +  dnl Also substitute ICONV_CONST in the gnulib generated <iconv.h>.
> > +  m4_ifdef([gl_ICONV_H_DEFAULTS],
> > +    [AC_REQUIRE([gl_ICONV_H_DEFAULTS])
> > +     if test -n "$am_cv_proto_iconv_arg1"; then
> > +       ICONV_CONST="const"
> > +     fi
> > +    ])
> > +])
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/intlmacosx.m4
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/intlmacosx.m4
> > new file mode 100644
> > index 00000000000..30e6f50e0ac
> > --- /dev/null
> > +++
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/intlmacosx.m4
> > @@ -0,0 +1,72 @@
> > +# intlmacosx.m4 serial 6 (gettext-0.20)
> > +dnl Copyright (C) 2004-2014, 2016, 2019 Free Software Foundation, Inc.
> > +dnl This file is free software; the Free Software Foundation
> > +dnl gives unlimited permission to copy and/or distribute it,
> > +dnl with or without modifications, as long as this notice is preserved.
> > +dnl
> > +dnl This file can be used in projects which are not available under
> > +dnl the GNU General Public License or the GNU Library General Public
> > +dnl License but which still want to provide support for the GNU gettext
> > +dnl functionality.
> > +dnl Please note that the actual code of the GNU gettext library is
> covered
> > +dnl by the GNU Library General Public License, and the rest of the GNU
> > +dnl gettext package is covered by the GNU General Public License.
> > +dnl They are *not* in the public domain.
> > +
> > +dnl Checks for special options needed on Mac OS X.
> > +dnl Defines INTL_MACOSX_LIBS.
> > +AC_DEFUN([gt_INTL_MACOSX],
> > +[
> > +  dnl Check for API introduced in Mac OS X 10.4.
> > +  AC_CACHE_CHECK([for CFPreferencesCopyAppValue],
> > +    [gt_cv_func_CFPreferencesCopyAppValue],
> > +    [gt_save_LIBS="$LIBS"
> > +     LIBS="$LIBS -Wl,-framework -Wl,CoreFoundation"
> > +     AC_LINK_IFELSE(
> > +       [AC_LANG_PROGRAM(
> > +          [[#include <CoreFoundation/CFPreferences.h>]],
> > +          [[CFPreferencesCopyAppValue(NULL, NULL)]])],
> > +       [gt_cv_func_CFPreferencesCopyAppValue=yes],
> > +       [gt_cv_func_CFPreferencesCopyAppValue=no])
> > +     LIBS="$gt_save_LIBS"])
> > +  if test $gt_cv_func_CFPreferencesCopyAppValue = yes; then
> > +    AC_DEFINE([HAVE_CFPREFERENCESCOPYAPPVALUE], [1],
> > +      [Define to 1 if you have the Mac OS X function
> CFPreferencesCopyAppValue in the CoreFoundation framework.])
> > +  fi
> > +  dnl Check for API introduced in Mac OS X 10.5.
> > +  AC_CACHE_CHECK([for CFLocaleCopyCurrent],
> [gt_cv_func_CFLocaleCopyCurrent],
> > +    [gt_save_LIBS="$LIBS"
> > +     LIBS="$LIBS -Wl,-framework -Wl,CoreFoundation"
> > +     AC_LINK_IFELSE(
> > +       [AC_LANG_PROGRAM(
> > +          [[#include <CoreFoundation/CFLocale.h>]],
> > +          [[CFLocaleCopyCurrent();]])],
> > +       [gt_cv_func_CFLocaleCopyCurrent=yes],
> > +       [gt_cv_func_CFLocaleCopyCurrent=no])
> > +     LIBS="$gt_save_LIBS"])
> > +  if test $gt_cv_func_CFLocaleCopyCurrent = yes; then
> > +    AC_DEFINE([HAVE_CFLOCALECOPYCURRENT], [1],
> > +      [Define to 1 if you have the Mac OS X function
> CFLocaleCopyCurrent in the CoreFoundation framework.])
> > +  fi
> > +  AC_CACHE_CHECK([for CFLocaleCopyPreferredLanguages],
> [gt_cv_func_CFLocaleCopyPreferredLanguages],
> > +    [gt_save_LIBS="$LIBS"
> > +     LIBS="$LIBS -Wl,-framework -Wl,CoreFoundation"
> > +     AC_LINK_IFELSE(
> > +       [AC_LANG_PROGRAM(
> > +          [[#include <CoreFoundation/CFLocale.h>]],
> > +          [[CFLocaleCopyPreferredLanguages();]])],
> > +       [gt_cv_func_CFLocaleCopyPreferredLanguages=yes],
> > +       [gt_cv_func_CFLocaleCopyPreferredLanguages=no])
> > +     LIBS="$gt_save_LIBS"])
> > +  if test $gt_cv_func_CFLocaleCopyPreferredLanguages = yes; then
> > +    AC_DEFINE([HAVE_CFLOCALECOPYPREFERREDLANGUAGES], [1],
> > +      [Define to 1 if you have the Mac OS X function
> CFLocaleCopyPreferredLanguages in the CoreFoundation framework.])
> > +  fi
> > +  INTL_MACOSX_LIBS=
> > +  if test $gt_cv_func_CFPreferencesCopyAppValue = yes \
> > +     || test $gt_cv_func_CFLocaleCopyCurrent = yes \
> > +     || test $gt_cv_func_CFLocaleCopyPreferredLanguages = yes; then
> > +    INTL_MACOSX_LIBS="-Wl,-framework -Wl,CoreFoundation"
> > +  fi
> > +  AC_SUBST([INTL_MACOSX_LIBS])
> > +])
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld.m4
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld.m4
> > new file mode 100644
> > index 00000000000..a18719630d5
> > --- /dev/null
> > +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld.m4
> > @@ -0,0 +1,168 @@
> > +# lib-ld.m4 serial 9
> > +dnl Copyright (C) 1996-2003, 2009-2019 Free Software Foundation, Inc.
> > +dnl This file is free software; the Free Software Foundation
> > +dnl gives unlimited permission to copy and/or distribute it,
> > +dnl with or without modifications, as long as this notice is preserved.
> > +
> > +dnl Subroutines of libtool.m4,
> > +dnl with replacements s/_*LT_PATH/AC_LIB_PROG/ and s/lt_/acl_/ to avoid
> > +dnl collision with libtool.m4.
> > +
> > +dnl From libtool-2.4. Sets the variable with_gnu_ld to yes or no.
> > +AC_DEFUN([AC_LIB_PROG_LD_GNU],
> > +[AC_CACHE_CHECK([if the linker ($LD) is GNU ld], [acl_cv_prog_gnu_ld],
> > +[# I'd rather use --version here, but apparently some GNU lds only
> accept -v.
> > +case `$LD -v 2>&1 </dev/null` in
> > +*GNU* | *'with BFD'*)
> > +  acl_cv_prog_gnu_ld=yes
> > +  ;;
> > +*)
> > +  acl_cv_prog_gnu_ld=no
> > +  ;;
> > +esac])
> > +with_gnu_ld=$acl_cv_prog_gnu_ld
> > +])
> > +
> > +dnl From libtool-2.4. Sets the variable LD.
> > +AC_DEFUN([AC_LIB_PROG_LD],
> > +[AC_REQUIRE([AC_PROG_CC])dnl
> > +AC_REQUIRE([AC_CANONICAL_HOST])dnl
> > +
> > +AC_ARG_WITH([gnu-ld],
> > +    [AS_HELP_STRING([--with-gnu-ld],
> > +        [assume the C compiler uses GNU ld [default=no]])],
> > +    [test "$withval" = no || with_gnu_ld=yes],
> > +    [with_gnu_ld=no])dnl
> > +
> > +# Prepare PATH_SEPARATOR.
> > +# The user is always right.
> > +if test "${PATH_SEPARATOR+set}" != set; then
> > +  # Determine PATH_SEPARATOR by trying to find /bin/sh in a PATH which
> > +  # contains only /bin. Note that ksh looks also at the FPATH variable,
> > +  # so we have to set that as well for the test.
> > +  PATH_SEPARATOR=:
> > +  (PATH='/bin;/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 \
> > +    && { (PATH='/bin:/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 \
> > +           || PATH_SEPARATOR=';'
> > +       }
> > +fi
> > +
> > +if test -n "$LD"; then
> > +  AC_MSG_CHECKING([for ld])
> > +elif test "$GCC" = yes; then
> > +  AC_MSG_CHECKING([for ld used by $CC])
> > +elif test "$with_gnu_ld" = yes; then
> > +  AC_MSG_CHECKING([for GNU ld])
> > +else
> > +  AC_MSG_CHECKING([for non-GNU ld])
> > +fi
> > +if test -n "$LD"; then
> > +  # Let the user override the test with a path.
> > +  :
> > +else
> > +  AC_CACHE_VAL([acl_cv_path_LD],
> > +  [
> > +    acl_cv_path_LD= # Final result of this test
> > +    ac_prog=ld # Program to search in $PATH
> > +    if test "$GCC" = yes; then
> > +      # Check if gcc -print-prog-name=ld gives a path.
> > +      case $host in
> > +        *-*-mingw*)
> > +          # gcc leaves a trailing carriage return which upsets mingw
> > +          acl_output=`($CC -print-prog-name=ld) 2>&5 | tr -d '\015'` ;;
> > +        *)
> > +          acl_output=`($CC -print-prog-name=ld) 2>&5` ;;
> > +      esac
> > +      case $acl_output in
> > +        # Accept absolute paths.
> > +        [[\\/]]* | ?:[[\\/]]*)
> > +          re_direlt='/[[^/]][[^/]]*/\.\./'
> > +          # Canonicalize the pathname of ld
> > +          acl_output=`echo "$acl_output" | sed 's%\\\\%/%g'`
> > +          while echo "$acl_output" | grep "$re_direlt" > /dev/null
> 2>&1; do
> > +            acl_output=`echo $acl_output | sed "s%$re_direlt%/%"`
> > +          done
> > +          # Got the pathname. No search in PATH is needed.
> > +          acl_cv_path_LD="$acl_output"
> > +          ac_prog=
> > +          ;;
> > +        "")
> > +          # If it fails, then pretend we aren't using GCC.
> > +          ;;
> > +        *)
> > +          # If it is relative, then search for the first ld in PATH.
> > +          with_gnu_ld=unknown
> > +          ;;
> > +      esac
> > +    fi
> > +    if test -n "$ac_prog"; then
> > +      # Search for $ac_prog in $PATH.
> > +      acl_save_ifs="$IFS"; IFS=$PATH_SEPARATOR
> > +      for ac_dir in $PATH; do
> > +        IFS="$acl_save_ifs"
> > +        test -z "$ac_dir" && ac_dir=.
> > +        if test -f "$ac_dir/$ac_prog" || test -f
> "$ac_dir/$ac_prog$ac_exeext"; then
> > +          acl_cv_path_LD="$ac_dir/$ac_prog"
> > +          # Check to see if the program is GNU ld.  I'd rather use
> --version,
> > +          # but apparently some variants of GNU ld only accept -v.
> > +          # Break only if it was the GNU/non-GNU ld that we prefer.
> > +          case `"$acl_cv_path_LD" -v 2>&1 </dev/null` in
> > +            *GNU* | *'with BFD'*)
> > +              test "$with_gnu_ld" != no && break
> > +              ;;
> > +            *)
> > +              test "$with_gnu_ld" != yes && break
> > +              ;;
> > +          esac
> > +        fi
> > +      done
> > +      IFS="$acl_save_ifs"
> > +    fi
> > +    case $host in
> > +      *-*-aix*)
> > +        AC_COMPILE_IFELSE(
> > +          [AC_LANG_SOURCE(
> > +             [[#if defined __powerpc64__ || defined _ARCH_PPC64
> > +                int ok;
> > +               #else
> > +                error fail
> > +               #endif
> > +             ]])],
> > +          [# The compiler produces 64-bit code. Add option '-b64' so
> that the
> > +           # linker groks 64-bit object files.
> > +           case "$acl_cv_path_LD " in
> > +             *" -b64 "*) ;;
> > +             *) acl_cv_path_LD="$acl_cv_path_LD -b64" ;;
> > +           esac
> > +          ], [])
> > +        ;;
> > +      sparc64-*-netbsd*)
> > +        AC_COMPILE_IFELSE(
> > +          [AC_LANG_SOURCE(
> > +             [[#if defined __sparcv9 || defined __arch64__
> > +                int ok;
> > +               #else
> > +                error fail
> > +               #endif
> > +             ]])],
> > +          [],
> > +          [# The compiler produces 32-bit code. Add option '-m
> elf32_sparc'
> > +           # so that the linker groks 32-bit object files.
> > +           case "$acl_cv_path_LD " in
> > +             *" -m elf32_sparc "*) ;;
> > +             *) acl_cv_path_LD="$acl_cv_path_LD -m elf32_sparc" ;;
> > +           esac
> > +          ])
> > +        ;;
> > +    esac
> > +  ])
> > +  LD="$acl_cv_path_LD"
> > +fi
> > +if test -n "$LD"; then
> > +  AC_MSG_RESULT([$LD])
> > +else
> > +  AC_MSG_RESULT([no])
> > +  AC_MSG_ERROR([no acceptable ld found in \$PATH])
> > +fi
> > +AC_LIB_PROG_LD_GNU
> > +])
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-link.m4
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-link.m4
> > new file mode 100644
> > index 00000000000..0ff10731fac
> > --- /dev/null
> > +++
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-link.m4
> > @@ -0,0 +1,774 @@
> > +# lib-link.m4 serial 28
> > +dnl Copyright (C) 2001-2019 Free Software Foundation, Inc.
> > +dnl This file is free software; the Free Software Foundation
> > +dnl gives unlimited permission to copy and/or distribute it,
> > +dnl with or without modifications, as long as this notice is preserved.
> > +
> > +dnl From Bruno Haible.
> > +
> > +AC_PREREQ([2.61])
> > +
> > +dnl AC_LIB_LINKFLAGS(name [, dependencies]) searches for libname and
> > +dnl the libraries corresponding to explicit and implicit dependencies.
> > +dnl Sets and AC_SUBSTs the LIB${NAME} and LTLIB${NAME} variables and
> > +dnl augments the CPPFLAGS variable.
> > +dnl Sets and AC_SUBSTs the LIB${NAME}_PREFIX variable to nonempty if
> libname
> > +dnl was found in ${LIB${NAME}_PREFIX}/$acl_libdirstem.
> > +AC_DEFUN([AC_LIB_LINKFLAGS],
> > +[
> > +  AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
> > +  AC_REQUIRE([AC_LIB_RPATH])
> > +  pushdef([Name],[m4_translit([$1],[./+-], [____])])
> > +  pushdef([NAME],[m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./+-],
> > +                                   [ABCDEFGHIJKLMNOPQRSTUVWXYZ____])])
> > +  AC_CACHE_CHECK([how to link with lib[]$1], [ac_cv_lib[]Name[]_libs], [
> > +    AC_LIB_LINKFLAGS_BODY([$1], [$2])
> > +    ac_cv_lib[]Name[]_libs="$LIB[]NAME"
> > +    ac_cv_lib[]Name[]_ltlibs="$LTLIB[]NAME"
> > +    ac_cv_lib[]Name[]_cppflags="$INC[]NAME"
> > +    ac_cv_lib[]Name[]_prefix="$LIB[]NAME[]_PREFIX"
> > +  ])
> > +  LIB[]NAME="$ac_cv_lib[]Name[]_libs"
> > +  LTLIB[]NAME="$ac_cv_lib[]Name[]_ltlibs"
> > +  INC[]NAME="$ac_cv_lib[]Name[]_cppflags"
> > +  LIB[]NAME[]_PREFIX="$ac_cv_lib[]Name[]_prefix"
> > +  AC_LIB_APPENDTOVAR([CPPFLAGS], [$INC]NAME)
> > +  AC_SUBST([LIB]NAME)
> > +  AC_SUBST([LTLIB]NAME)
> > +  AC_SUBST([LIB]NAME[_PREFIX])
> > +  dnl Also set HAVE_LIB[]NAME so that AC_LIB_HAVE_LINKFLAGS can reuse
> the
> > +  dnl results of this search when this library appears as a dependency.
> > +  HAVE_LIB[]NAME=yes
> > +  popdef([NAME])
> > +  popdef([Name])
> > +])
> > +
> > +dnl AC_LIB_HAVE_LINKFLAGS(name, dependencies, includes, testcode,
> [missing-message])
> > +dnl searches for libname and the libraries corresponding to explicit and
> > +dnl implicit dependencies, together with the specified include files and
> > +dnl the ability to compile and link the specified testcode. The
> missing-message
> > +dnl defaults to 'no' and may contain additional hints for the user.
> > +dnl If found, it sets and AC_SUBSTs HAVE_LIB${NAME}=yes and the
> LIB${NAME}
> > +dnl and LTLIB${NAME} variables and augments the CPPFLAGS variable, and
> > +dnl #defines HAVE_LIB${NAME} to 1. Otherwise, it sets and AC_SUBSTs
> > +dnl HAVE_LIB${NAME}=no and LIB${NAME} and LTLIB${NAME} to empty.
> > +dnl Sets and AC_SUBSTs the LIB${NAME}_PREFIX variable to nonempty if
> libname
> > +dnl was found in ${LIB${NAME}_PREFIX}/$acl_libdirstem.
> > +AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],
> > +[
> > +  AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
> > +  AC_REQUIRE([AC_LIB_RPATH])
> > +  pushdef([Name],[m4_translit([$1],[./+-], [____])])
> > +  pushdef([NAME],[m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./+-],
> > +                                   [ABCDEFGHIJKLMNOPQRSTUVWXYZ____])])
> > +
> > +  dnl Search for lib[]Name and define LIB[]NAME, LTLIB[]NAME and
> INC[]NAME
> > +  dnl accordingly.
> > +  AC_LIB_LINKFLAGS_BODY([$1], [$2])
> > +
> > +  dnl Add $INC[]NAME to CPPFLAGS before performing the following checks,
> > +  dnl because if the user has installed lib[]Name and not disabled its
> use
> > +  dnl via --without-lib[]Name-prefix, he wants to use it.
> > +  ac_save_CPPFLAGS="$CPPFLAGS"
> > +  AC_LIB_APPENDTOVAR([CPPFLAGS], [$INC]NAME)
> > +
> > +  AC_CACHE_CHECK([for lib[]$1], [ac_cv_lib[]Name], [
> > +    ac_save_LIBS="$LIBS"
> > +    dnl If $LIB[]NAME contains some -l options, add it to the end of
> LIBS,
> > +    dnl because these -l options might require -L options that are
> present in
> > +    dnl LIBS. -l options benefit only from the -L options listed before
> it.
> > +    dnl Otherwise, add it to the front of LIBS, because it may be a
> static
> > +    dnl library that depends on another static library that is present
> in LIBS.
> > +    dnl Static libraries benefit only from the static libraries listed
> after
> > +    dnl it.
> > +    case " $LIB[]NAME" in
> > +      *" -l"*) LIBS="$LIBS $LIB[]NAME" ;;
> > +      *)       LIBS="$LIB[]NAME $LIBS" ;;
> > +    esac
> > +    AC_LINK_IFELSE(
> > +      [AC_LANG_PROGRAM([[$3]], [[$4]])],
> > +      [ac_cv_lib[]Name=yes],
> > +      [ac_cv_lib[]Name='m4_if([$5], [], [no], [[$5]])'])
> > +    LIBS="$ac_save_LIBS"
> > +  ])
> > +  if test "$ac_cv_lib[]Name" = yes; then
> > +    HAVE_LIB[]NAME=yes
> > +    AC_DEFINE([HAVE_LIB]NAME, 1, [Define if you have the lib][$1
> library.])
> > +    AC_MSG_CHECKING([how to link with lib[]$1])
> > +    AC_MSG_RESULT([$LIB[]NAME])
> > +  else
> > +    HAVE_LIB[]NAME=no
> > +    dnl If $LIB[]NAME didn't lead to a usable library, we don't need
> > +    dnl $INC[]NAME either.
> > +    CPPFLAGS="$ac_save_CPPFLAGS"
> > +    LIB[]NAME=
> > +    LTLIB[]NAME=
> > +    LIB[]NAME[]_PREFIX=
> > +  fi
> > +  AC_SUBST([HAVE_LIB]NAME)
> > +  AC_SUBST([LIB]NAME)
> > +  AC_SUBST([LTLIB]NAME)
> > +  AC_SUBST([LIB]NAME[_PREFIX])
> > +  popdef([NAME])
> > +  popdef([Name])
> > +])
> > +
> > +dnl Determine the platform dependent parameters needed to use rpath:
> > +dnl   acl_libext,
> > +dnl   acl_shlibext,
> > +dnl   acl_libname_spec,
> > +dnl   acl_library_names_spec,
> > +dnl   acl_hardcode_libdir_flag_spec,
> > +dnl   acl_hardcode_libdir_separator,
> > +dnl   acl_hardcode_direct,
> > +dnl   acl_hardcode_minus_L.
> > +AC_DEFUN([AC_LIB_RPATH],
> > +[
> > +  dnl Complain if config.rpath is missing.
> > +  AC_REQUIRE_AUX_FILE([config.rpath])
> > +  AC_REQUIRE([AC_PROG_CC])                dnl we use $CC, $GCC, $LDFLAGS
> > +  AC_REQUIRE([AC_LIB_PROG_LD])            dnl we use $LD, $with_gnu_ld
> > +  AC_REQUIRE([AC_CANONICAL_HOST])         dnl we use $host
> > +  AC_REQUIRE([AC_CONFIG_AUX_DIR_DEFAULT]) dnl we use $ac_aux_dir
> > +  AC_CACHE_CHECK([for shared library run path origin], [acl_cv_rpath], [
> > +    CC="$CC" GCC="$GCC" LDFLAGS="$LDFLAGS" LD="$LD"
> with_gnu_ld="$with_gnu_ld" \
> > +    ${CONFIG_SHELL-/bin/sh} "$ac_aux_dir/config.rpath" "$host" >
> conftest.sh
> > +    . ./conftest.sh
> > +    rm -f ./conftest.sh
> > +    acl_cv_rpath=done
> > +  ])
> > +  wl="$acl_cv_wl"
> > +  acl_libext="$acl_cv_libext"
> > +  acl_shlibext="$acl_cv_shlibext"
> > +  acl_libname_spec="$acl_cv_libname_spec"
> > +  acl_library_names_spec="$acl_cv_library_names_spec"
> > +  acl_hardcode_libdir_flag_spec="$acl_cv_hardcode_libdir_flag_spec"
> > +  acl_hardcode_libdir_separator="$acl_cv_hardcode_libdir_separator"
> > +  acl_hardcode_direct="$acl_cv_hardcode_direct"
> > +  acl_hardcode_minus_L="$acl_cv_hardcode_minus_L"
> > +  dnl Determine whether the user wants rpath handling at all.
> > +  AC_ARG_ENABLE([rpath],
> > +    [  --disable-rpath         do not hardcode runtime library paths],
> > +    :, enable_rpath=yes)
> > +])
> > +
> > +dnl AC_LIB_FROMPACKAGE(name, package)
> > +dnl declares that libname comes from the given package. The configure
> file
> > +dnl will then not have a --with-libname-prefix option but a
> > +dnl --with-package-prefix option. Several libraries can come from the
> same
> > +dnl package. This declaration must occur before an AC_LIB_LINKFLAGS or
> similar
> > +dnl macro call that searches for libname.
> > +AC_DEFUN([AC_LIB_FROMPACKAGE],
> > +[
> > +  pushdef([NAME],[m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./+-],
> > +                                   [ABCDEFGHIJKLMNOPQRSTUVWXYZ____])])
> > +  define([acl_frompackage_]NAME, [$2])
> > +  popdef([NAME])
> > +  pushdef([PACK],[$2])
> > +  pushdef([PACKUP],[m4_translit(PACK,[abcdefghijklmnopqrstuvwxyz./+-],
> > +                                     [ABCDEFGHIJKLMNOPQRSTUVWXYZ____])])
> > +  define([acl_libsinpackage_]PACKUP,
> > +    m4_ifdef([acl_libsinpackage_]PACKUP,
> [m4_defn([acl_libsinpackage_]PACKUP)[, ]],)[lib$1])
> > +  popdef([PACKUP])
> > +  popdef([PACK])
> > +])
> > +
> > +dnl AC_LIB_LINKFLAGS_BODY(name [, dependencies]) searches for libname
> and
> > +dnl the libraries corresponding to explicit and implicit dependencies.
> > +dnl Sets the LIB${NAME}, LTLIB${NAME} and INC${NAME} variables.
> > +dnl Also, sets the LIB${NAME}_PREFIX variable to nonempty if libname
> was found
> > +dnl in ${LIB${NAME}_PREFIX}/$acl_libdirstem.
> > +AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
> > +[
> > +  AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
> > +  pushdef([NAME],[m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./+-],
> > +                                   [ABCDEFGHIJKLMNOPQRSTUVWXYZ____])])
> > +  pushdef([PACK],[m4_ifdef([acl_frompackage_]NAME,
> [acl_frompackage_]NAME, lib[$1])])
> > +  pushdef([PACKUP],[m4_translit(PACK,[abcdefghijklmnopqrstuvwxyz./+-],
> > +                                     [ABCDEFGHIJKLMNOPQRSTUVWXYZ____])])
> > +  pushdef([PACKLIBS],[m4_ifdef([acl_frompackage_]NAME,
> [acl_libsinpackage_]PACKUP, lib[$1])])
> > +  dnl By default, look in $includedir and $libdir.
> > +  use_additional=yes
> > +  AC_LIB_WITH_FINAL_PREFIX([
> > +    eval additional_includedir=\"$includedir\"
> > +    eval additional_libdir=\"$libdir\"
> > +  ])
> > +  AC_ARG_WITH(PACK[-prefix],
> > +[[  --with-]]PACK[[-prefix[=DIR]  search for ]PACKLIBS[ in DIR/include
> and DIR/lib
> > +  --without-]]PACK[[-prefix     don't search for ]PACKLIBS[ in
> includedir and libdir]],
> > +[
> > +    if test "X$withval" = "Xno"; then
> > +      use_additional=no
> > +    else
> > +      if test "X$withval" = "X"; then
> > +        AC_LIB_WITH_FINAL_PREFIX([
> > +          eval additional_includedir=\"$includedir\"
> > +          eval additional_libdir=\"$libdir\"
> > +        ])
> > +      else
> > +        additional_includedir="$withval/include"
> > +        additional_libdir="$withval/$acl_libdirstem"
> > +        if test "$acl_libdirstem2" != "$acl_libdirstem" \
> > +           && test ! -d "$withval/$acl_libdirstem"; then
> > +          additional_libdir="$withval/$acl_libdirstem2"
> > +        fi
> > +      fi
> > +    fi
> > +])
> > +  dnl Search the library and its dependencies in $additional_libdir and
> > +  dnl $LDFLAGS. Using breadth-first-seach.
> > +  LIB[]NAME=
> > +  LTLIB[]NAME=
> > +  INC[]NAME=
> > +  LIB[]NAME[]_PREFIX=
> > +  dnl HAVE_LIB${NAME} is an indicator that LIB${NAME}, LTLIB${NAME}
> have been
> > +  dnl computed. So it has to be reset here.
> > +  HAVE_LIB[]NAME=
> > +  rpathdirs=
> > +  ltrpathdirs=
> > +  names_already_handled=
> > +  names_next_round='$1 $2'
> > +  while test -n "$names_next_round"; do
> > +    names_this_round="$names_next_round"
> > +    names_next_round=
> > +    for name in $names_this_round; do
> > +      already_handled=
> > +      for n in $names_already_handled; do
> > +        if test "$n" = "$name"; then
> > +          already_handled=yes
> > +          break
> > +        fi
> > +      done
> > +      if test -z "$already_handled"; then
> > +        names_already_handled="$names_already_handled $name"
> > +        dnl See if it was already located by an earlier AC_LIB_LINKFLAGS
> > +        dnl or AC_LIB_HAVE_LINKFLAGS call.
> > +        uppername=`echo "$name" | sed -e
> 'y|abcdefghijklmnopqrstuvwxyz./+-|ABCDEFGHIJKLMNOPQRSTUVWXYZ____|'`
> > +        eval value=\"\$HAVE_LIB$uppername\"
> > +        if test -n "$value"; then
> > +          if test "$value" = yes; then
> > +            eval value=\"\$LIB$uppername\"
> > +            test -z "$value" || LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+
> }$value"
> > +            eval value=\"\$LTLIB$uppername\"
> > +            test -z "$value" ||
> LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }$value"
> > +          else
> > +            dnl An earlier call to AC_LIB_HAVE_LINKFLAGS has determined
> > +            dnl that this library doesn't exist. So just drop it.
> > +            :
> > +          fi
> > +        else
> > +          dnl Search the library lib$name in $additional_libdir and
> $LDFLAGS
> > +          dnl and the already constructed $LIBNAME/$LTLIBNAME.
> > +          found_dir=
> > +          found_la=
> > +          found_so=
> > +          found_a=
> > +          eval libname=\"$acl_libname_spec\"    # typically:
> libname=lib$name
> > +          if test -n "$acl_shlibext"; then
> > +            shrext=".$acl_shlibext"             # typically: shrext=.so
> > +          else
> > +            shrext=
> > +          fi
> > +          if test $use_additional = yes; then
> > +            dir="$additional_libdir"
> > +            dnl The same code as in the loop below:
> > +            dnl First look for a shared library.
> > +            if test -n "$acl_shlibext"; then
> > +              if test -f "$dir/$libname$shrext"; then
> > +                found_dir="$dir"
> > +                found_so="$dir/$libname$shrext"
> > +              else
> > +                if test "$acl_library_names_spec" =
> '$libname$shrext$versuffix'; then
> > +                  ver=`(cd "$dir" && \
> > +                        for f in "$libname$shrext".*; do echo "$f";
> done \
> > +                        | sed -e "s,^$libname$shrext\\\\.,," \
> > +                        | sort -t '.' -n -r -k1,1 -k2,2 -k3,3 -k4,4
> -k5,5 \
> > +                        | sed 1q ) 2>/dev/null`
> > +                  if test -n "$ver" && test -f
> "$dir/$libname$shrext.$ver"; then
> > +                    found_dir="$dir"
> > +                    found_so="$dir/$libname$shrext.$ver"
> > +                  fi
> > +                else
> > +                  eval library_names=\"$acl_library_names_spec\"
> > +                  for f in $library_names; do
> > +                    if test -f "$dir/$f"; then
> > +                      found_dir="$dir"
> > +                      found_so="$dir/$f"
> > +                      break
> > +                    fi
> > +                  done
> > +                fi
> > +              fi
> > +            fi
> > +            dnl Then look for a static library.
> > +            if test "X$found_dir" = "X"; then
> > +              if test -f "$dir/$libname.$acl_libext"; then
> > +                found_dir="$dir"
> > +                found_a="$dir/$libname.$acl_libext"
> > +              fi
> > +            fi
> > +            if test "X$found_dir" != "X"; then
> > +              if test -f "$dir/$libname.la"; then
> > +                found_la="$dir/$libname.la"
> > +              fi
> > +            fi
> > +          fi
> > +          if test "X$found_dir" = "X"; then
> > +            for x in $LDFLAGS $LTLIB[]NAME; do
> > +              AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
> > +              case "$x" in
> > +                -L*)
> > +                  dir=`echo "X$x" | sed -e 's/^X-L//'`
> > +                  dnl First look for a shared library.
> > +                  if test -n "$acl_shlibext"; then
> > +                    if test -f "$dir/$libname$shrext"; then
> > +                      found_dir="$dir"
> > +                      found_so="$dir/$libname$shrext"
> > +                    else
> > +                      if test "$acl_library_names_spec" =
> '$libname$shrext$versuffix'; then
> > +                        ver=`(cd "$dir" && \
> > +                              for f in "$libname$shrext".*; do echo
> "$f"; done \
> > +                              | sed -e "s,^$libname$shrext\\\\.,," \
> > +                              | sort -t '.' -n -r -k1,1 -k2,2 -k3,3
> -k4,4 -k5,5 \
> > +                              | sed 1q ) 2>/dev/null`
> > +                        if test -n "$ver" && test -f
> "$dir/$libname$shrext.$ver"; then
> > +                          found_dir="$dir"
> > +                          found_so="$dir/$libname$shrext.$ver"
> > +                        fi
> > +                      else
> > +                        eval library_names=\"$acl_library_names_spec\"
> > +                        for f in $library_names; do
> > +                          if test -f "$dir/$f"; then
> > +                            found_dir="$dir"
> > +                            found_so="$dir/$f"
> > +                            break
> > +                          fi
> > +                        done
> > +                      fi
> > +                    fi
> > +                  fi
> > +                  dnl Then look for a static library.
> > +                  if test "X$found_dir" = "X"; then
> > +                    if test -f "$dir/$libname.$acl_libext"; then
> > +                      found_dir="$dir"
> > +                      found_a="$dir/$libname.$acl_libext"
> > +                    fi
> > +                  fi
> > +                  if test "X$found_dir" != "X"; then
> > +                    if test -f "$dir/$libname.la"; then
> > +                      found_la="$dir/$libname.la"
> > +                    fi
> > +                  fi
> > +                  ;;
> > +              esac
> > +              if test "X$found_dir" != "X"; then
> > +                break
> > +              fi
> > +            done
> > +          fi
> > +          if test "X$found_dir" != "X"; then
> > +            dnl Found the library.
> > +            LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }-L$found_dir
> -l$name"
> > +            if test "X$found_so" != "X"; then
> > +              dnl Linking with a shared library. We attempt to hardcode
> its
> > +              dnl directory into the executable's runpath, unless it's
> the
> > +              dnl standard /usr/lib.
> > +              if test "$enable_rpath" = no \
> > +                 || test "X$found_dir" = "X/usr/$acl_libdirstem" \
> > +                 || test "X$found_dir" = "X/usr/$acl_libdirstem2"; then
> > +                dnl No hardcoding is needed.
> > +                LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
> > +              else
> > +                dnl Use an explicit option to hardcode DIR into the
> resulting
> > +                dnl binary.
> > +                dnl Potentially add DIR to ltrpathdirs.
> > +                dnl The ltrpathdirs will be appended to $LTLIBNAME at
> the end.
> > +                haveit=
> > +                for x in $ltrpathdirs; do
> > +                  if test "X$x" = "X$found_dir"; then
> > +                    haveit=yes
> > +                    break
> > +                  fi
> > +                done
> > +                if test -z "$haveit"; then
> > +                  ltrpathdirs="$ltrpathdirs $found_dir"
> > +                fi
> > +                dnl The hardcoding into $LIBNAME is system dependent.
> > +                if test "$acl_hardcode_direct" = yes; then
> > +                  dnl Using DIR/libNAME.so during linking hardcodes DIR
> into the
> > +                  dnl resulting binary.
> > +                  LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
> > +                else
> > +                  if test -n "$acl_hardcode_libdir_flag_spec" && test
> "$acl_hardcode_minus_L" = no; then
> > +                    dnl Use an explicit option to hardcode DIR into the
> resulting
> > +                    dnl binary.
> > +                    LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
> > +                    dnl Potentially add DIR to rpathdirs.
> > +                    dnl The rpathdirs will be appended to $LIBNAME at
> the end.
> > +                    haveit=
> > +                    for x in $rpathdirs; do
> > +                      if test "X$x" = "X$found_dir"; then
> > +                        haveit=yes
> > +                        break
> > +                      fi
> > +                    done
> > +                    if test -z "$haveit"; then
> > +                      rpathdirs="$rpathdirs $found_dir"
> > +                    fi
> > +                  else
> > +                    dnl Rely on "-L$found_dir".
> > +                    dnl But don't add it if it's already contained in
> the LDFLAGS
> > +                    dnl or the already constructed $LIBNAME
> > +                    haveit=
> > +                    for x in $LDFLAGS $LIB[]NAME; do
> > +                      AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
> > +                      if test "X$x" = "X-L$found_dir"; then
> > +                        haveit=yes
> > +                        break
> > +                      fi
> > +                    done
> > +                    if test -z "$haveit"; then
> > +                      LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+
> }-L$found_dir"
> > +                    fi
> > +                    if test "$acl_hardcode_minus_L" != no; then
> > +                      dnl FIXME: Not sure whether we should use
> > +                      dnl "-L$found_dir -l$name" or "-L$found_dir
> $found_so"
> > +                      dnl here.
> > +                      LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
> > +                    else
> > +                      dnl We cannot use $acl_hardcode_runpath_var and
> LD_RUN_PATH
> > +                      dnl here, because this doesn't fit in flags
> passed to the
> > +                      dnl compiler. So give up. No hardcoding. This
> affects only
> > +                      dnl very old systems.
> > +                      dnl FIXME: Not sure whether we should use
> > +                      dnl "-L$found_dir -l$name" or "-L$found_dir
> $found_so"
> > +                      dnl here.
> > +                      LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }-l$name"
> > +                    fi
> > +                  fi
> > +                fi
> > +              fi
> > +            else
> > +              if test "X$found_a" != "X"; then
> > +                dnl Linking with a static library.
> > +                LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_a"
> > +              else
> > +                dnl We shouldn't come here, but anyway it's good to
> have a
> > +                dnl fallback.
> > +                LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }-L$found_dir
> -l$name"
> > +              fi
> > +            fi
> > +            dnl Assume the include files are nearby.
> > +            additional_includedir=
> > +            case "$found_dir" in
> > +              */$acl_libdirstem | */$acl_libdirstem/)
> > +                basedir=`echo "X$found_dir" | sed -e 's,^X,,' -e
> "s,/$acl_libdirstem/"'*$,,'`
> > +                if test "$name" = '$1'; then
> > +                  LIB[]NAME[]_PREFIX="$basedir"
> > +                fi
> > +                additional_includedir="$basedir/include"
> > +                ;;
> > +              */$acl_libdirstem2 | */$acl_libdirstem2/)
> > +                basedir=`echo "X$found_dir" | sed -e 's,^X,,' -e
> "s,/$acl_libdirstem2/"'*$,,'`
> > +                if test "$name" = '$1'; then
> > +                  LIB[]NAME[]_PREFIX="$basedir"
> > +                fi
> > +                additional_includedir="$basedir/include"
> > +                ;;
> > +            esac
> > +            if test "X$additional_includedir" != "X"; then
> > +              dnl Potentially add $additional_includedir to $INCNAME.
> > +              dnl But don't add it
> > +              dnl   1. if it's the standard /usr/include,
> > +              dnl   2. if it's /usr/local/include and we are using GCC
> on Linux,
> > +              dnl   3. if it's already present in $CPPFLAGS or the
> already
> > +              dnl      constructed $INCNAME,
> > +              dnl   4. if it doesn't exist as a directory.
> > +              if test "X$additional_includedir" != "X/usr/include"; then
> > +                haveit=
> > +                if test "X$additional_includedir" =
> "X/usr/local/include"; then
> > +                  if test -n "$GCC"; then
> > +                    case $host_os in
> > +                      linux* | gnu* | k*bsd*-gnu) haveit=yes;;
> > +                    esac
> > +                  fi
> > +                fi
> > +                if test -z "$haveit"; then
> > +                  for x in $CPPFLAGS $INC[]NAME; do
> > +                    AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
> > +                    if test "X$x" = "X-I$additional_includedir"; then
> > +                      haveit=yes
> > +                      break
> > +                    fi
> > +                  done
> > +                  if test -z "$haveit"; then
> > +                    if test -d "$additional_includedir"; then
> > +                      dnl Really add $additional_includedir to $INCNAME.
> > +                      INC[]NAME="${INC[]NAME}${INC[]NAME:+
> }-I$additional_includedir"
> > +                    fi
> > +                  fi
> > +                fi
> > +              fi
> > +            fi
> > +            dnl Look for dependencies.
> > +            if test -n "$found_la"; then
> > +              dnl Read the .la file. It defines the variables
> > +              dnl dlname, library_names, old_library, dependency_libs,
> current,
> > +              dnl age, revision, installed, dlopen, dlpreopen, libdir.
> > +              save_libdir="$libdir"
> > +              case "$found_la" in
> > +                */* | *\\*) . "$found_la" ;;
> > +                *) . "./$found_la" ;;
> > +              esac
> > +              libdir="$save_libdir"
> > +              dnl We use only dependency_libs.
> > +              for dep in $dependency_libs; do
> > +                case "$dep" in
> > +                  -L*)
> > +                    additional_libdir=`echo "X$dep" | sed -e 's/^X-L//'`
> > +                    dnl Potentially add $additional_libdir to $LIBNAME
> and $LTLIBNAME.
> > +                    dnl But don't add it
> > +                    dnl   1. if it's the standard /usr/lib,
> > +                    dnl   2. if it's /usr/local/lib and we are using
> GCC on Linux,
> > +                    dnl   3. if it's already present in $LDFLAGS or the
> already
> > +                    dnl      constructed $LIBNAME,
> > +                    dnl   4. if it doesn't exist as a directory.
> > +                    if test "X$additional_libdir" !=
> "X/usr/$acl_libdirstem" \
> > +                       && test "X$additional_libdir" !=
> "X/usr/$acl_libdirstem2"; then
> > +                      haveit=
> > +                      if test "X$additional_libdir" =
> "X/usr/local/$acl_libdirstem" \
> > +                         || test "X$additional_libdir" =
> "X/usr/local/$acl_libdirstem2"; then
> > +                        if test -n "$GCC"; then
> > +                          case $host_os in
> > +                            linux* | gnu* | k*bsd*-gnu) haveit=yes;;
> > +                          esac
> > +                        fi
> > +                      fi
> > +                      if test -z "$haveit"; then
> > +                        haveit=
> > +                        for x in $LDFLAGS $LIB[]NAME; do
> > +                          AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
> > +                          if test "X$x" = "X-L$additional_libdir"; then
> > +                            haveit=yes
> > +                            break
> > +                          fi
> > +                        done
> > +                        if test -z "$haveit"; then
> > +                          if test -d "$additional_libdir"; then
> > +                            dnl Really add $additional_libdir to
> $LIBNAME.
> > +                            LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+
> }-L$additional_libdir"
> > +                          fi
> > +                        fi
> > +                        haveit=
> > +                        for x in $LDFLAGS $LTLIB[]NAME; do
> > +                          AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
> > +                          if test "X$x" = "X-L$additional_libdir"; then
> > +                            haveit=yes
> > +                            break
> > +                          fi
> > +                        done
> > +                        if test -z "$haveit"; then
> > +                          if test -d "$additional_libdir"; then
> > +                            dnl Really add $additional_libdir to
> $LTLIBNAME.
> > +                            LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+
> }-L$additional_libdir"
> > +                          fi
> > +                        fi
> > +                      fi
> > +                    fi
> > +                    ;;
> > +                  -R*)
> > +                    dir=`echo "X$dep" | sed -e 's/^X-R//'`
> > +                    if test "$enable_rpath" != no; then
> > +                      dnl Potentially add DIR to rpathdirs.
> > +                      dnl The rpathdirs will be appended to $LIBNAME at
> the end.
> > +                      haveit=
> > +                      for x in $rpathdirs; do
> > +                        if test "X$x" = "X$dir"; then
> > +                          haveit=yes
> > +                          break
> > +                        fi
> > +                      done
> > +                      if test -z "$haveit"; then
> > +                        rpathdirs="$rpathdirs $dir"
> > +                      fi
> > +                      dnl Potentially add DIR to ltrpathdirs.
> > +                      dnl The ltrpathdirs will be appended to
> $LTLIBNAME at the end.
> > +                      haveit=
> > +                      for x in $ltrpathdirs; do
> > +                        if test "X$x" = "X$dir"; then
> > +                          haveit=yes
> > +                          break
> > +                        fi
> > +                      done
> > +                      if test -z "$haveit"; then
> > +                        ltrpathdirs="$ltrpathdirs $dir"
> > +                      fi
> > +                    fi
> > +                    ;;
> > +                  -l*)
> > +                    dnl Handle this in the next round.
> > +                    names_next_round="$names_next_round "`echo "X$dep"
> | sed -e 's/^X-l//'`
> > +                    ;;
> > +                  *.la)
> > +                    dnl Handle this in the next round. Throw away the
> .la's
> > +                    dnl directory; it is already contained in a
> preceding -L
> > +                    dnl option.
> > +                    names_next_round="$names_next_round "`echo "X$dep"
> | sed -e 's,^X.*/,,' -e 's,^lib,,' -e 's,\.la$,,'`
> > +                    ;;
> > +                  *)
> > +                    dnl Most likely an immediate library name.
> > +                    LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$dep"
> > +                    LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }$dep"
> > +                    ;;
> > +                esac
> > +              done
> > +            fi
> > +          else
> > +            dnl Didn't find the library; assume it is in the system
> directories
> > +            dnl known to the linker and runtime loader. (All the system
> > +            dnl directories known to the linker should also be known to
> the
> > +            dnl runtime loader, otherwise the system is severely
> misconfigured.)
> > +            LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }-l$name"
> > +            LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }-l$name"
> > +          fi
> > +        fi
> > +      fi
> > +    done
> > +  done
> > +  if test "X$rpathdirs" != "X"; then
> > +    if test -n "$acl_hardcode_libdir_separator"; then
> > +      dnl Weird platform: only the last -rpath option counts, the user
> must
> > +      dnl pass all path elements in one option. We can arrange that for
> a
> > +      dnl single library, but not when more than one $LIBNAMEs are used.
> > +      alldirs=
> > +      for found_dir in $rpathdirs; do
> > +
> alldirs="${alldirs}${alldirs:+$acl_hardcode_libdir_separator}$found_dir"
> > +      done
> > +      dnl Note: acl_hardcode_libdir_flag_spec uses $libdir and $wl.
> > +      acl_save_libdir="$libdir"
> > +      libdir="$alldirs"
> > +      eval flag=\"$acl_hardcode_libdir_flag_spec\"
> > +      libdir="$acl_save_libdir"
> > +      LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$flag"
> > +    else
> > +      dnl The -rpath options are cumulative.
> > +      for found_dir in $rpathdirs; do
> > +        acl_save_libdir="$libdir"
> > +        libdir="$found_dir"
> > +        eval flag=\"$acl_hardcode_libdir_flag_spec\"
> > +        libdir="$acl_save_libdir"
> > +        LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$flag"
> > +      done
> > +    fi
> > +  fi
> > +  if test "X$ltrpathdirs" != "X"; then
> > +    dnl When using libtool, the option that works for both libraries and
> > +    dnl executables is -R. The -R options are cumulative.
> > +    for found_dir in $ltrpathdirs; do
> > +      LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }-R$found_dir"
> > +    done
> > +  fi
> > +  popdef([PACKLIBS])
> > +  popdef([PACKUP])
> > +  popdef([PACK])
> > +  popdef([NAME])
> > +])
> > +
> > +dnl AC_LIB_APPENDTOVAR(VAR, CONTENTS) appends the elements of CONTENTS
> to VAR,
> > +dnl unless already present in VAR.
> > +dnl Works only for CPPFLAGS, not for LIB* variables because that
> sometimes
> > +dnl contains two or three consecutive elements that belong together.
> > +AC_DEFUN([AC_LIB_APPENDTOVAR],
> > +[
> > +  for element in [$2]; do
> > +    haveit=
> > +    for x in $[$1]; do
> > +      AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
> > +      if test "X$x" = "X$element"; then
> > +        haveit=yes
> > +        break
> > +      fi
> > +    done
> > +    if test -z "$haveit"; then
> > +      [$1]="${[$1]}${[$1]:+ }$element"
> > +    fi
> > +  done
> > +])
> > +
> > +dnl For those cases where a variable contains several -L and -l options
> > +dnl referring to unknown libraries and directories, this macro
> determines the
> > +dnl necessary additional linker options for the runtime path.
> > +dnl AC_LIB_LINKFLAGS_FROM_LIBS([LDADDVAR], [LIBSVALUE], [USE-LIBTOOL])
> > +dnl sets LDADDVAR to linker options needed together with LIBSVALUE.
> > +dnl If USE-LIBTOOL evaluates to non-empty, linking with libtool is
> assumed,
> > +dnl otherwise linking without libtool is assumed.
> > +AC_DEFUN([AC_LIB_LINKFLAGS_FROM_LIBS],
> > +[
> > +  AC_REQUIRE([AC_LIB_RPATH])
> > +  AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
> > +  $1=
> > +  if test "$enable_rpath" != no; then
> > +    if test -n "$acl_hardcode_libdir_flag_spec" && test
> "$acl_hardcode_minus_L" = no; then
> > +      dnl Use an explicit option to hardcode directories into the
> resulting
> > +      dnl binary.
> > +      rpathdirs=
> > +      next=
> > +      for opt in $2; do
> > +        if test -n "$next"; then
> > +          dir="$next"
> > +          dnl No need to hardcode the standard /usr/lib.
> > +          if test "X$dir" != "X/usr/$acl_libdirstem" \
> > +             && test "X$dir" != "X/usr/$acl_libdirstem2"; then
> > +            rpathdirs="$rpathdirs $dir"
> > +          fi
> > +          next=
> > +        else
> > +          case $opt in
> > +            -L) next=yes ;;
> > +            -L*) dir=`echo "X$opt" | sed -e 's,^X-L,,'`
> > +                 dnl No need to hardcode the standard /usr/lib.
> > +                 if test "X$dir" != "X/usr/$acl_libdirstem" \
> > +                    && test "X$dir" != "X/usr/$acl_libdirstem2"; then
> > +                   rpathdirs="$rpathdirs $dir"
> > +                 fi
> > +                 next= ;;
> > +            *) next= ;;
> > +          esac
> > +        fi
> > +      done
> > +      if test "X$rpathdirs" != "X"; then
> > +        if test -n ""$3""; then
> > +          dnl libtool is used for linking. Use -R options.
> > +          for dir in $rpathdirs; do
> > +            $1="${$1}${$1:+ }-R$dir"
> > +          done
> > +        else
> > +          dnl The linker is used for linking directly.
> > +          if test -n "$acl_hardcode_libdir_separator"; then
> > +            dnl Weird platform: only the last -rpath option counts, the
> user
> > +            dnl must pass all path elements in one option.
> > +            alldirs=
> > +            for dir in $rpathdirs; do
> > +
> alldirs="${alldirs}${alldirs:+$acl_hardcode_libdir_separator}$dir"
> > +            done
> > +            acl_save_libdir="$libdir"
> > +            libdir="$alldirs"
> > +            eval flag=\"$acl_hardcode_libdir_flag_spec\"
> > +            libdir="$acl_save_libdir"
> > +            $1="$flag"
> > +          else
> > +            dnl The -rpath options are cumulative.
> > +            for dir in $rpathdirs; do
> > +              acl_save_libdir="$libdir"
> > +              libdir="$dir"
> > +              eval flag=\"$acl_hardcode_libdir_flag_spec\"
> > +              libdir="$acl_save_libdir"
> > +              $1="${$1}${$1:+ }$flag"
> > +            done
> > +          fi
> > +        fi
> > +      fi
> > +    fi
> > +  fi
> > +  AC_SUBST([$1])
> > +])
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-prefix.m4
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-prefix.m4
> > new file mode 100644
> > index 00000000000..8adb17bb916
> > --- /dev/null
> > +++
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-prefix.m4
> > @@ -0,0 +1,249 @@
> > +# lib-prefix.m4 serial 14
> > +dnl Copyright (C) 2001-2005, 2008-2019 Free Software Foundation, Inc.
> > +dnl This file is free software; the Free Software Foundation
> > +dnl gives unlimited permission to copy and/or distribute it,
> > +dnl with or without modifications, as long as this notice is preserved.
> > +
> > +dnl From Bruno Haible.
> > +
> > +dnl AC_LIB_PREFIX adds to the CPPFLAGS and LDFLAGS the flags that are
> needed
> > +dnl to access previously installed libraries. The basic assumption is
> that
> > +dnl a user will want packages to use other packages he previously
> installed
> > +dnl with the same --prefix option.
> > +dnl This macro is not needed if only AC_LIB_LINKFLAGS is used to locate
> > +dnl libraries, but is otherwise very convenient.
> > +AC_DEFUN([AC_LIB_PREFIX],
> > +[
> > +  AC_BEFORE([$0], [AC_LIB_LINKFLAGS])
> > +  AC_REQUIRE([AC_PROG_CC])
> > +  AC_REQUIRE([AC_CANONICAL_HOST])
> > +  AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
> > +  AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
> > +  dnl By default, look in $includedir and $libdir.
> > +  use_additional=yes
> > +  AC_LIB_WITH_FINAL_PREFIX([
> > +    eval additional_includedir=\"$includedir\"
> > +    eval additional_libdir=\"$libdir\"
> > +  ])
> > +  AC_ARG_WITH([lib-prefix],
> > +[[  --with-lib-prefix[=DIR] search for libraries in DIR/include and
> DIR/lib
> > +  --without-lib-prefix    don't search for libraries in includedir and
> libdir]],
> > +[
> > +    if test "X$withval" = "Xno"; then
> > +      use_additional=no
> > +    else
> > +      if test "X$withval" = "X"; then
> > +        AC_LIB_WITH_FINAL_PREFIX([
> > +          eval additional_includedir=\"$includedir\"
> > +          eval additional_libdir=\"$libdir\"
> > +        ])
> > +      else
> > +        additional_includedir="$withval/include"
> > +        additional_libdir="$withval/$acl_libdirstem"
> > +      fi
> > +    fi
> > +])
> > +  if test $use_additional = yes; then
> > +    dnl Potentially add $additional_includedir to $CPPFLAGS.
> > +    dnl But don't add it
> > +    dnl   1. if it's the standard /usr/include,
> > +    dnl   2. if it's already present in $CPPFLAGS,
> > +    dnl   3. if it's /usr/local/include and we are using GCC on Linux,
> > +    dnl   4. if it doesn't exist as a directory.
> > +    if test "X$additional_includedir" != "X/usr/include"; then
> > +      haveit=
> > +      for x in $CPPFLAGS; do
> > +        AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
> > +        if test "X$x" = "X-I$additional_includedir"; then
> > +          haveit=yes
> > +          break
> > +        fi
> > +      done
> > +      if test -z "$haveit"; then
> > +        if test "X$additional_includedir" = "X/usr/local/include"; then
> > +          if test -n "$GCC"; then
> > +            case $host_os in
> > +              linux* | gnu* | k*bsd*-gnu) haveit=yes;;
> > +            esac
> > +          fi
> > +        fi
> > +        if test -z "$haveit"; then
> > +          if test -d "$additional_includedir"; then
> > +            dnl Really add $additional_includedir to $CPPFLAGS.
> > +            CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-I$additional_includedir"
> > +          fi
> > +        fi
> > +      fi
> > +    fi
> > +    dnl Potentially add $additional_libdir to $LDFLAGS.
> > +    dnl But don't add it
> > +    dnl   1. if it's the standard /usr/lib,
> > +    dnl   2. if it's already present in $LDFLAGS,
> > +    dnl   3. if it's /usr/local/lib and we are using GCC on Linux,
> > +    dnl   4. if it doesn't exist as a directory.
> > +    if test "X$additional_libdir" != "X/usr/$acl_libdirstem"; then
> > +      haveit=
> > +      for x in $LDFLAGS; do
> > +        AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
> > +        if test "X$x" = "X-L$additional_libdir"; then
> > +          haveit=yes
> > +          break
> > +        fi
> > +      done
> > +      if test -z "$haveit"; then
> > +        if test "X$additional_libdir" = "X/usr/local/$acl_libdirstem";
> then
> > +          if test -n "$GCC"; then
> > +            case $host_os in
> > +              linux*) haveit=yes;;
> > +            esac
> > +          fi
> > +        fi
> > +        if test -z "$haveit"; then
> > +          if test -d "$additional_libdir"; then
> > +            dnl Really add $additional_libdir to $LDFLAGS.
> > +            LDFLAGS="${LDFLAGS}${LDFLAGS:+ }-L$additional_libdir"
> > +          fi
> > +        fi
> > +      fi
> > +    fi
> > +  fi
> > +])
> > +
> > +dnl AC_LIB_PREPARE_PREFIX creates variables acl_final_prefix,
> > +dnl acl_final_exec_prefix, containing the values to which $prefix and
> > +dnl $exec_prefix will expand at the end of the configure script.
> > +AC_DEFUN([AC_LIB_PREPARE_PREFIX],
> > +[
> > +  dnl Unfortunately, prefix and exec_prefix get only finally determined
> > +  dnl at the end of configure.
> > +  if test "X$prefix" = "XNONE"; then
> > +    acl_final_prefix="$ac_default_prefix"
> > +  else
> > +    acl_final_prefix="$prefix"
> > +  fi
> > +  if test "X$exec_prefix" = "XNONE"; then
> > +    acl_final_exec_prefix='${prefix}'
> > +  else
> > +    acl_final_exec_prefix="$exec_prefix"
> > +  fi
> > +  acl_save_prefix="$prefix"
> > +  prefix="$acl_final_prefix"
> > +  eval acl_final_exec_prefix=\"$acl_final_exec_prefix\"
> > +  prefix="$acl_save_prefix"
> > +])
> > +
> > +dnl AC_LIB_WITH_FINAL_PREFIX([statement]) evaluates statement, with the
> > +dnl variables prefix and exec_prefix bound to the values they will have
> > +dnl at the end of the configure script.
> > +AC_DEFUN([AC_LIB_WITH_FINAL_PREFIX],
> > +[
> > +  acl_save_prefix="$prefix"
> > +  prefix="$acl_final_prefix"
> > +  acl_save_exec_prefix="$exec_prefix"
> > +  exec_prefix="$acl_final_exec_prefix"
> > +  $1
> > +  exec_prefix="$acl_save_exec_prefix"
> > +  prefix="$acl_save_prefix"
> > +])
> > +
> > +dnl AC_LIB_PREPARE_MULTILIB creates
> > +dnl - a variable acl_libdirstem, containing the basename of the libdir,
> either
> > +dnl   "lib" or "lib64" or "lib/64",
> > +dnl - a variable acl_libdirstem2, as a secondary possible value for
> > +dnl   acl_libdirstem, either the same as acl_libdirstem or
> "lib/sparcv9" or
> > +dnl   "lib/amd64".
> > +AC_DEFUN([AC_LIB_PREPARE_MULTILIB],
> > +[
> > +  dnl There is no formal standard regarding lib and lib64.
> > +  dnl On glibc systems, the current practice is that on a system
> supporting
> > +  dnl 32-bit and 64-bit instruction sets or ABIs, 64-bit libraries go
> under
> > +  dnl $prefix/lib64 and 32-bit libraries go under $prefix/lib. We
> determine
> > +  dnl the compiler's default mode by looking at the compiler's library
> search
> > +  dnl path. If at least one of its elements ends in /lib64 or points to
> a
> > +  dnl directory whose absolute pathname ends in /lib64, we assume a
> 64-bit ABI.
> > +  dnl Otherwise we use the default, namely "lib".
> > +  dnl On Solaris systems, the current practice is that on a system
> supporting
> > +  dnl 32-bit and 64-bit instruction sets or ABIs, 64-bit libraries go
> under
> > +  dnl $prefix/lib/64 (which is a symlink to either $prefix/lib/sparcv9
> or
> > +  dnl $prefix/lib/amd64) and 32-bit libraries go under $prefix/lib.
> > +  AC_REQUIRE([AC_CANONICAL_HOST])
> > +  AC_REQUIRE([gl_HOST_CPU_C_ABI_32BIT])
> > +
> > +  case "$host_os" in
> > +    solaris*)
> > +      AC_CACHE_CHECK([for 64-bit host], [gl_cv_solaris_64bit],
> > +        [AC_COMPILE_IFELSE(
> > +           [AC_LANG_SOURCE(
> > +              [[#ifdef _LP64
> > +                 int ok;
> > +                #else
> > +                 error fail
> > +                #endif
> > +              ]])],
> > +           [gl_cv_solaris_64bit=yes],
> > +           [gl_cv_solaris_64bit=no])
> > +        ]);;
> > +  esac
> > +
> > +  dnl Allow the user to override the result by setting
> acl_cv_libdirstems.
> > +  AC_CACHE_CHECK([for the common suffixes of directories in the library
> search path],
> > +    [acl_cv_libdirstems],
> > +    [acl_libdirstem=lib
> > +     acl_libdirstem2=
> > +     case "$host_os" in
> > +       solaris*)
> > +         dnl See Solaris 10 Software Developer Collection > Solaris
> 64-bit Developer's Guide > The Development Environment
> > +         dnl <
> https://docs.oracle.com/cd/E19253-01/816-5138/dev-env/index.html>.
> > +         dnl "Portable Makefiles should refer to any library
> directories using the 64 symbolic link."
> > +         dnl But we want to recognize the sparcv9 or amd64 subdirectory
> also if the
> > +         dnl symlink is missing, so we set acl_libdirstem2 too.
> > +         if test $gl_cv_solaris_64bit = yes; then
> > +           acl_libdirstem=lib/64
> > +           case "$host_cpu" in
> > +             sparc*)        acl_libdirstem2=lib/sparcv9 ;;
> > +             i*86 | x86_64) acl_libdirstem2=lib/amd64 ;;
> > +           esac
> > +         fi
> > +         ;;
> > +       *)
> > +         dnl If $CC generates code for a 32-bit ABI, the libraries are
> > +         dnl surely under $prefix/lib, not $prefix/lib64.
> > +         if test "$HOST_CPU_C_ABI_32BIT" != yes; then
> > +           dnl The result is a property of the system. However,
> non-system
> > +           dnl compilers sometimes have odd library search paths.
> Therefore
> > +           dnl prefer asking /usr/bin/gcc, if available, rather than
> $CC.
> > +           searchpath=`(if test -f /usr/bin/gcc \
> > +                           && LC_ALL=C /usr/bin/gcc -print-search-dirs
> >/dev/null 2>/dev/null; then \
> > +                          LC_ALL=C /usr/bin/gcc -print-search-dirs; \
> > +                        else \
> > +                          LC_ALL=C $CC -print-search-dirs; \
> > +                        fi) 2>/dev/null \
> > +                       | sed -n -e 's,^libraries: ,,p' | sed -e
> 's,^=,,'`
> > +           if test -n "$searchpath"; then
> > +             acl_save_IFS="${IFS=    }"; IFS=":"
> > +             for searchdir in $searchpath; do
> > +               if test -d "$searchdir"; then
> > +                 case "$searchdir" in
> > +                   */lib64/ | */lib64 ) acl_libdirstem=lib64 ;;
> > +                   */../ | */.. )
> > +                     # Better ignore directories of this form. They are
> misleading.
> > +                     ;;
> > +                   *) searchdir=`cd "$searchdir" && pwd`
> > +                      case "$searchdir" in
> > +                        */lib64 ) acl_libdirstem=lib64 ;;
> > +                      esac ;;
> > +                 esac
> > +               fi
> > +             done
> > +             IFS="$acl_save_IFS"
> > +           fi
> > +         fi
> > +         ;;
> > +     esac
> > +     test -n "$acl_libdirstem2" || acl_libdirstem2="$acl_libdirstem"
> > +     acl_cv_libdirstems="$acl_libdirstem,$acl_libdirstem2"
> > +    ])
> > +  # Decompose acl_cv_libdirstems into acl_libdirstem and
> acl_libdirstem2.
> > +  acl_libdirstem=`echo "$acl_cv_libdirstems" | sed -e 's/,.*//'`
> > +  acl_libdirstem2=`echo "$acl_cv_libdirstems" | sed -e '/,/s/.*,//'`
> > +])
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4
> > new file mode 100644
> > index 00000000000..b62f6148570
> > --- /dev/null
> > +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4
> > @@ -0,0 +1,32 @@
> > +# nls.m4 serial 5 (gettext-0.18)
> > +dnl Copyright (C) 1995-2003, 2005-2006, 2008-2014, 2016, 2019 Free
> Software
> > +dnl Foundation, Inc.
> > +dnl This file is free software; the Free Software Foundation
> > +dnl gives unlimited permission to copy and/or distribute it,
> > +dnl with or without modifications, as long as this notice is preserved.
> > +dnl
> > +dnl This file can be used in projects which are not available under
> > +dnl the GNU General Public License or the GNU Library General Public
> > +dnl License but which still want to provide support for the GNU gettext
> > +dnl functionality.
> > +dnl Please note that the actual code of the GNU gettext library is
> covered
> > +dnl by the GNU Library General Public License, and the rest of the GNU
> > +dnl gettext package is covered by the GNU General Public License.
> > +dnl They are *not* in the public domain.
> > +
> > +dnl Authors:
> > +dnl   Ulrich Drepper <drepper@cygnus.com>, 1995-2000.
> > +dnl   Bruno Haible <haible@clisp.cons.org>, 2000-2003.
> > +
> > +AC_PREREQ([2.50])
> > +
> > +AC_DEFUN([AM_NLS],
> > +[
> > +  AC_MSG_CHECKING([whether NLS is requested])
> > +  dnl Default is enabled NLS
> > +  AC_ARG_ENABLE([nls],
> > +    [  --disable-nls           do not use Native Language Support],
> > +    USE_NLS=$enableval, USE_NLS=yes)
> > +  AC_MSG_RESULT([$USE_NLS])
> > +  AC_SUBST([USE_NLS])
> > +])
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4
> > new file mode 100644
> > index 00000000000..143792dba56
> > --- /dev/null
> > +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4
> > @@ -0,0 +1,450 @@
> > +# po.m4 serial 30 (gettext-0.20)
> > +dnl Copyright (C) 1995-2014, 2016, 2018-2019 Free Software Foundation,
> Inc.
> > +dnl This file is free software; the Free Software Foundation
> > +dnl gives unlimited permission to copy and/or distribute it,
> > +dnl with or without modifications, as long as this notice is preserved.
> > +dnl
> > +dnl This file can be used in projects which are not available under
> > +dnl the GNU General Public License or the GNU Library General Public
> > +dnl License but which still want to provide support for the GNU gettext
> > +dnl functionality.
> > +dnl Please note that the actual code of the GNU gettext library is
> covered
> > +dnl by the GNU Library General Public License, and the rest of the GNU
> > +dnl gettext package is covered by the GNU General Public License.
> > +dnl They are *not* in the public domain.
> > +
> > +dnl Authors:
> > +dnl   Ulrich Drepper <drepper@cygnus.com>, 1995-2000.
> > +dnl   Bruno Haible <haible@clisp.cons.org>, 2000-2003.
> > +
> > +AC_PREREQ([2.60])
> > +
> > +dnl Checks for all prerequisites of the po subdirectory.
> > +AC_DEFUN([AM_PO_SUBDIRS],
> > +[
> > +  AC_REQUIRE([AC_PROG_MAKE_SET])dnl
> > +  AC_REQUIRE([AC_PROG_INSTALL])dnl
> > +  AC_REQUIRE([AC_PROG_MKDIR_P])dnl
> > +  AC_REQUIRE([AC_PROG_SED])dnl
> > +  AC_REQUIRE([AM_NLS])dnl
> > +
> > +  dnl Release version of the gettext macros. This is used to ensure that
> > +  dnl the gettext macros and po/Makefile.in.in are in sync.
> > +  AC_SUBST([GETTEXT_MACRO_VERSION], [0.20])
> > +
> > +  dnl Perform the following tests also if --disable-nls has been given,
> > +  dnl because they are needed for "make dist" to work.
> > +
> > +  dnl Search for GNU msgfmt in the PATH.
> > +  dnl The first test excludes Solaris msgfmt and early GNU msgfmt
> versions.
> > +  dnl The second test excludes FreeBSD msgfmt.
> > +  AM_PATH_PROG_WITH_TEST(MSGFMT, msgfmt,
> > +    [$ac_dir/$ac_word --statistics /dev/null >&]AS_MESSAGE_LOG_FD[ 2>&1
> &&
> > +     (if $ac_dir/$ac_word --statistics /dev/null 2>&1 >/dev/null | grep
> usage >/dev/null; then exit 1; else exit 0; fi)],
> > +    :)
> > +  AC_PATH_PROG([GMSGFMT], [gmsgfmt], [$MSGFMT])
> > +
> > +  dnl Test whether it is GNU msgfmt >= 0.15.
> > +changequote(,)dnl
> > +  case `$GMSGFMT --version | sed 1q | sed -e 's,^[^0-9]*,,'` in
> > +    '' | 0.[0-9] | 0.[0-9].* | 0.1[0-4] | 0.1[0-4].*) GMSGFMT_015=: ;;
> > +    *) GMSGFMT_015=$GMSGFMT ;;
> > +  esac
> > +changequote([,])dnl
> > +  AC_SUBST([GMSGFMT_015])
> > +
> > +  dnl Search for GNU xgettext 0.12 or newer in the PATH.
> > +  dnl The first test excludes Solaris xgettext and early GNU xgettext
> versions.
> > +  dnl The second test excludes FreeBSD xgettext.
> > +  AM_PATH_PROG_WITH_TEST(XGETTEXT, xgettext,
> > +    [$ac_dir/$ac_word --omit-header --copyright-holder=
> --msgid-bugs-address= /dev/null >&]AS_MESSAGE_LOG_FD[ 2>&1 &&
> > +     (if $ac_dir/$ac_word --omit-header --copyright-holder=
> --msgid-bugs-address= /dev/null 2>&1 >/dev/null | grep usage >/dev/null;
> then exit 1; else exit 0; fi)],
> > +    :)
> > +  dnl Remove leftover from FreeBSD xgettext call.
> > +  rm -f messages.po
> > +
> > +  dnl Test whether it is GNU xgettext >= 0.15.
> > +changequote(,)dnl
> > +  case `$XGETTEXT --version | sed 1q | sed -e 's,^[^0-9]*,,'` in
> > +    '' | 0.[0-9] | 0.[0-9].* | 0.1[0-4] | 0.1[0-4].*) XGETTEXT_015=: ;;
> > +    *) XGETTEXT_015=$XGETTEXT ;;
> > +  esac
> > +changequote([,])dnl
> > +  AC_SUBST([XGETTEXT_015])
> > +
> > +  dnl Search for GNU msgmerge 0.11 or newer in the PATH.
> > +  AM_PATH_PROG_WITH_TEST(MSGMERGE, msgmerge,
> > +    [$ac_dir/$ac_word --update -q /dev/null /dev/null
> >&]AS_MESSAGE_LOG_FD[ 2>&1], :)
> > +
> > +  dnl Test whether it is GNU msgmerge >= 0.20.
> > +  if LC_ALL=C $MSGMERGE --help | grep ' --for-msgfmt ' >/dev/null; then
> > +    MSGMERGE_FOR_MSGFMT_OPTION='--for-msgfmt'
> > +  else
> > +    dnl Test whether it is GNU msgmerge >= 0.12.
> > +    if LC_ALL=C $MSGMERGE --help | grep ' --no-fuzzy-matching '
> >/dev/null; then
> > +      MSGMERGE_FOR_MSGFMT_OPTION='--no-fuzzy-matching --no-location
> --quiet'
> > +    else
> > +      dnl With these old versions, $(MSGMERGE)
> $(MSGMERGE_FOR_MSGFMT_OPTION) is
> > +      dnl slow. But this is not a big problem, as such old gettext
> versions are
> > +      dnl hardly in use any more.
> > +      MSGMERGE_FOR_MSGFMT_OPTION='--no-location --quiet'
> > +    fi
> > +  fi
> > +  AC_SUBST([MSGMERGE_FOR_MSGFMT_OPTION])
> > +
> > +  dnl Support for AM_XGETTEXT_OPTION.
> > +  test -n "${XGETTEXT_EXTRA_OPTIONS+set}" || XGETTEXT_EXTRA_OPTIONS=
> > +  AC_SUBST([XGETTEXT_EXTRA_OPTIONS])
> > +
> > +  AC_CONFIG_COMMANDS([po-directories], [[
> > +    for ac_file in $CONFIG_FILES; do
> > +      # Support "outfile[:infile[:infile...]]"
> > +      case "$ac_file" in
> > +        *:*) ac_file=`echo "$ac_file"|sed 's%:.*%%'` ;;
> > +      esac
> > +      # PO directories have a Makefile.in generated from Makefile.in.in
> .
> > +      case "$ac_file" in */Makefile.in)
> > +        # Adjust a relative srcdir.
> > +        ac_dir=`echo "$ac_file"|sed 's%/[^/][^/]*$%%'`
> > +        ac_dir_suffix=/`echo "$ac_dir"|sed 's%^\./%%'`
> > +        ac_dots=`echo "$ac_dir_suffix"|sed 's%/[^/]*%../%g'`
> > +        # In autoconf-2.13 it is called $ac_given_srcdir.
> > +        # In autoconf-2.50 it is called $srcdir.
> > +        test -n "$ac_given_srcdir" || ac_given_srcdir="$srcdir"
> > +        case "$ac_given_srcdir" in
> > +          .)  top_srcdir=`echo $ac_dots|sed 's%/$%%'` ;;
> > +          /*) top_srcdir="$ac_given_srcdir" ;;
> > +          *)  top_srcdir="$ac_dots$ac_given_srcdir" ;;
> > +        esac
> > +        # Treat a directory as a PO directory if and only if it has a
> > +        # POTFILES.in file. This allows packages to have multiple PO
> > +        # directories under different names or in different locations.
> > +        if test -f "$ac_given_srcdir/$ac_dir/POTFILES.in"; then
> > +          rm -f "$ac_dir/POTFILES"
> > +          test -n "$as_me" && echo "$as_me: creating $ac_dir/POTFILES"
> || echo "creating $ac_dir/POTFILES"
> > +          gt_tab=`printf '\t'`
> > +          cat "$ac_given_srcdir/$ac_dir/POTFILES.in" | sed -e "/^#/d"
> -e "/^[ ${gt_tab}]*\$/d" -e "s,.*,     $top_srcdir/& \\\\," | sed -e
> "\$s/\(.*\) \\\\/\1/" > "$ac_dir/POTFILES"
> > +          POMAKEFILEDEPS="POTFILES.in"
> > +          # ALL_LINGUAS, POFILES, UPDATEPOFILES, DUMMYPOFILES, GMOFILES
> depend
> > +          # on $ac_dir but don't depend on user-specified configuration
> > +          # parameters.
> > +          if test -f "$ac_given_srcdir/$ac_dir/LINGUAS"; then
> > +            # The LINGUAS file contains the set of available languages.
> > +            if test -n "$OBSOLETE_ALL_LINGUAS"; then
> > +              test -n "$as_me" && echo "$as_me: setting ALL_LINGUAS in
> configure.in is obsolete" || echo "setting ALL_LINGUAS in configure.in is
> obsolete"
> > +            fi
> > +            ALL_LINGUAS=`sed -e "/^#/d" -e "s/#.*//"
> "$ac_given_srcdir/$ac_dir/LINGUAS"`
> > +            POMAKEFILEDEPS="$POMAKEFILEDEPS LINGUAS"
> > +          else
> > +            # The set of available languages was given in configure.in.
> > +            ALL_LINGUAS=$OBSOLETE_ALL_LINGUAS
> > +          fi
> > +          # Compute POFILES
> > +          # as      $(foreach lang, $(ALL_LINGUAS),
> $(srcdir)/$(lang).po)
> > +          # Compute UPDATEPOFILES
> > +          # as      $(foreach lang, $(ALL_LINGUAS), $(lang).po-update)
> > +          # Compute DUMMYPOFILES
> > +          # as      $(foreach lang, $(ALL_LINGUAS), $(lang).nop)
> > +          # Compute GMOFILES
> > +          # as      $(foreach lang, $(ALL_LINGUAS),
> $(srcdir)/$(lang).gmo)
> > +          case "$ac_given_srcdir" in
> > +            .) srcdirpre= ;;
> > +            *) srcdirpre='$(srcdir)/' ;;
> > +          esac
> > +          POFILES=
> > +          UPDATEPOFILES=
> > +          DUMMYPOFILES=
> > +          GMOFILES=
> > +          for lang in $ALL_LINGUAS; do
> > +            POFILES="$POFILES $srcdirpre$lang.po"
> > +            UPDATEPOFILES="$UPDATEPOFILES $lang.po-update"
> > +            DUMMYPOFILES="$DUMMYPOFILES $lang.nop"
> > +            GMOFILES="$GMOFILES $srcdirpre$lang.gmo"
> > +          done
> > +          # CATALOGS depends on both $ac_dir and the user's LINGUAS
> > +          # environment variable.
> > +          INST_LINGUAS=
> > +          if test -n "$ALL_LINGUAS"; then
> > +            for presentlang in $ALL_LINGUAS; do
> > +              useit=no
> > +              if test "%UNSET%" != "$LINGUAS"; then
> > +                desiredlanguages="$LINGUAS"
> > +              else
> > +                desiredlanguages="$ALL_LINGUAS"
> > +              fi
> > +              for desiredlang in $desiredlanguages; do
> > +                # Use the presentlang catalog if desiredlang is
> > +                #   a. equal to presentlang, or
> > +                #   b. a variant of presentlang (because in this case,
> > +                #      presentlang can be used as a fallback for
> messages
> > +                #      which are not translated in the desiredlang
> catalog).
> > +                case "$desiredlang" in
> > +                  "$presentlang"*) useit=yes;;
> > +                esac
> > +              done
> > +              if test $useit = yes; then
> > +                INST_LINGUAS="$INST_LINGUAS $presentlang"
> > +              fi
> > +            done
> > +          fi
> > +          CATALOGS=
> > +          if test -n "$INST_LINGUAS"; then
> > +            for lang in $INST_LINGUAS; do
> > +              CATALOGS="$CATALOGS $lang.gmo"
> > +            done
> > +          fi
> > +          test -n "$as_me" && echo "$as_me: creating $ac_dir/Makefile"
> || echo "creating $ac_dir/Makefile"
> > +          sed -e "/^POTFILES =/r $ac_dir/POTFILES" -e "/^# Makevars/r
> $ac_given_srcdir/$ac_dir/Makevars" -e "s|@POFILES@|$POFILES|g" -e
> "s|@UPDATEPOFILES@|$UPDATEPOFILES|g" -e "s|@DUMMYPOFILES@|$DUMMYPOFILES|g"
> -e "s|@GMOFILES@|$GMOFILES|g" -e "s|@CATALOGS@|$CATALOGS|g" -e
> "s|@POMAKEFILEDEPS@|$POMAKEFILEDEPS|g" "$ac_dir/Makefile.in" >
> "$ac_dir/Makefile"
> > +          for f in "$ac_given_srcdir/$ac_dir"/Rules-*; do
> > +            if test -f "$f"; then
> > +              case "$f" in
> > +                *.orig | *.bak | *~) ;;
> > +                *) cat "$f" >> "$ac_dir/Makefile" ;;
> > +              esac
> > +            fi
> > +          done
> > +        fi
> > +        ;;
> > +      esac
> > +    done]],
> > +   [# Capture the value of obsolete ALL_LINGUAS because we need it to
> compute
> > +    # POFILES, UPDATEPOFILES, DUMMYPOFILES, GMOFILES, CATALOGS.
> > +    OBSOLETE_ALL_LINGUAS="$ALL_LINGUAS"
> > +    # Capture the value of LINGUAS because we need it to compute
> CATALOGS.
> > +    LINGUAS="${LINGUAS-%UNSET%}"
> > +   ])
> > +])
> > +
> > +dnl Postprocesses a Makefile in a directory containing PO files.
> > +AC_DEFUN([AM_POSTPROCESS_PO_MAKEFILE],
> > +[
> > +  # When this code is run, in config.status, two variables have already
> been
> > +  # set:
> > +  # - OBSOLETE_ALL_LINGUAS is the value of LINGUAS set in configure.in,
> > +  # - LINGUAS is the value of the environment variable LINGUAS at
> configure
> > +  #   time.
> > +
> > +changequote(,)dnl
> > +  # Adjust a relative srcdir.
> > +  ac_dir=`echo "$ac_file"|sed 's%/[^/][^/]*$%%'`
> > +  ac_dir_suffix=/`echo "$ac_dir"|sed 's%^\./%%'`
> > +  ac_dots=`echo "$ac_dir_suffix"|sed 's%/[^/]*%../%g'`
> > +  # In autoconf-2.13 it is called $ac_given_srcdir.
> > +  # In autoconf-2.50 it is called $srcdir.
> > +  test -n "$ac_given_srcdir" || ac_given_srcdir="$srcdir"
> > +  case "$ac_given_srcdir" in
> > +    .)  top_srcdir=`echo $ac_dots|sed 's%/$%%'` ;;
> > +    /*) top_srcdir="$ac_given_srcdir" ;;
> > +    *)  top_srcdir="$ac_dots$ac_given_srcdir" ;;
> > +  esac
> > +
> > +  # Find a way to echo strings without interpreting backslash.
> > +  if test "X`(echo '\t') 2>/dev/null`" = 'X\t'; then
> > +    gt_echo='echo'
> > +  else
> > +    if test "X`(printf '%s\n' '\t') 2>/dev/null`" = 'X\t'; then
> > +      gt_echo='printf %s\n'
> > +    else
> > +      echo_func () {
> > +        cat <<EOT
> > +$*
> > +EOT
> > +      }
> > +      gt_echo='echo_func'
> > +    fi
> > +  fi
> > +
> > +  # A sed script that extracts the value of VARIABLE from a Makefile.
> > +  tab=`printf '\t'`
> > +  sed_x_variable='
> > +# Test if the hold space is empty.
> > +x
> > +s/P/P/
> > +x
> > +ta
> > +# Yes it was empty. Look if we have the expected variable definition.
> > +/^['"${tab}"' ]*VARIABLE['"${tab}"' ]*=/{
> > +  # Seen the first line of the variable definition.
> > +  s/^['"${tab}"' ]*VARIABLE['"${tab}"' ]*=//
> > +  ba
> > +}
> > +bd
> > +:a
> > +# Here we are processing a line from the variable definition.
> > +# Remove comment, more precisely replace it with a space.
> > +s/#.*$/ /
> > +# See if the line ends in a backslash.
> > +tb
> > +:b
> > +s/\\$//
> > +# Print the line, without the trailing backslash.
> > +p
> > +tc
> > +# There was no trailing backslash. The end of the variable definition is
> > +# reached. Clear the hold space.
> > +s/^.*$//
> > +x
> > +bd
> > +:c
> > +# A trailing backslash means that the variable definition continues in
> the
> > +# next line. Put a nonempty string into the hold space to indicate this.
> > +s/^.*$/P/
> > +x
> > +:d
> > +'
> > +changequote([,])dnl
> > +
> > +  # Set POTFILES to the value of the Makefile variable POTFILES.
> > +  sed_x_POTFILES=`$gt_echo "$sed_x_variable" | sed -e '/^ *#/d' -e
> 's/VARIABLE/POTFILES/g'`
> > +  POTFILES=`sed -n -e "$sed_x_POTFILES" < "$ac_file"`
> > +  # Compute POTFILES_DEPS as
> > +  #   $(foreach file, $(POTFILES), $(top_srcdir)/$(file))
> > +  POTFILES_DEPS=
> > +  for file in $POTFILES; do
> > +    POTFILES_DEPS="$POTFILES_DEPS "'$(top_srcdir)/'"$file"
> > +  done
> > +  POMAKEFILEDEPS=""
> > +
> > +  if test -n "$OBSOLETE_ALL_LINGUAS"; then
> > +    test -n "$as_me" && echo "$as_me: setting ALL_LINGUAS in
> configure.in is obsolete" || echo "setting ALL_LINGUAS in configure.in is
> obsolete"
> > +  fi
> > +  if test -f "$ac_given_srcdir/$ac_dir/LINGUAS"; then
> > +    # The LINGUAS file contains the set of available languages.
> > +    ALL_LINGUAS=`sed -e "/^#/d" -e "s/#.*//"
> "$ac_given_srcdir/$ac_dir/LINGUAS"`
> > +    POMAKEFILEDEPS="$POMAKEFILEDEPS LINGUAS"
> > +  else
> > +    # Set ALL_LINGUAS to the value of the Makefile variable LINGUAS.
> > +    sed_x_LINGUAS=`$gt_echo "$sed_x_variable" | sed -e '/^ *#/d' -e
> 's/VARIABLE/LINGUAS/g'`
> > +    ALL_LINGUAS=`sed -n -e "$sed_x_LINGUAS" < "$ac_file"`
> > +  fi
> > +  # Compute POFILES
> > +  # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(lang).po)
> > +  # Compute UPDATEPOFILES
> > +  # as      $(foreach lang, $(ALL_LINGUAS), $(lang).po-update)
> > +  # Compute DUMMYPOFILES
> > +  # as      $(foreach lang, $(ALL_LINGUAS), $(lang).nop)
> > +  # Compute GMOFILES
> > +  # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(lang).gmo)
> > +  # Compute PROPERTIESFILES
> > +  # as      $(foreach lang, $(ALL_LINGUAS),
> $(srcdir)/$(DOMAIN)_$(lang).properties)
> > +  # Compute CLASSFILES
> > +  # as      $(foreach lang, $(ALL_LINGUAS),
> $(srcdir)/$(DOMAIN)_$(lang).class)
> > +  # Compute QMFILES
> > +  # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(lang).qm)
> > +  # Compute MSGFILES
> > +  # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(frob
> $(lang)).msg)
> > +  # Compute RESOURCESDLLFILES
> > +  # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(frob
> $(lang))/$(DOMAIN).resources.dll)
> > +  case "$ac_given_srcdir" in
> > +    .) srcdirpre= ;;
> > +    *) srcdirpre='$(srcdir)/' ;;
> > +  esac
> > +  POFILES=
> > +  UPDATEPOFILES=
> > +  DUMMYPOFILES=
> > +  GMOFILES=
> > +  PROPERTIESFILES=
> > +  CLASSFILES=
> > +  QMFILES=
> > +  MSGFILES=
> > +  RESOURCESDLLFILES=
> > +  for lang in $ALL_LINGUAS; do
> > +    POFILES="$POFILES $srcdirpre$lang.po"
> > +    UPDATEPOFILES="$UPDATEPOFILES $lang.po-update"
> > +    DUMMYPOFILES="$DUMMYPOFILES $lang.nop"
> > +    GMOFILES="$GMOFILES $srcdirpre$lang.gmo"
> > +    PROPERTIESFILES="$PROPERTIESFILES
> \$(srcdir)/\$(DOMAIN)_$lang.properties"
> > +    CLASSFILES="$CLASSFILES \$(srcdir)/\$(DOMAIN)_$lang.class"
> > +    QMFILES="$QMFILES $srcdirpre$lang.qm"
> > +    frobbedlang=`echo $lang | sed -e 's/\..*$//' -e
> 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
> > +    MSGFILES="$MSGFILES $srcdirpre$frobbedlang.msg"
> > +    frobbedlang=`echo $lang | sed -e 's/_/-/g' -e 's/^sr-CS/sr-SP/' -e
> 's/@latin$/-Latn/' -e 's/@cyrillic$/-Cyrl/' -e 's/^sr-SP$/sr-SP-Latn/' -e
> 's/^uz-UZ$/uz-UZ-Latn/'`
> > +    RESOURCESDLLFILES="$RESOURCESDLLFILES
> $srcdirpre$frobbedlang/\$(DOMAIN).resources.dll"
> > +  done
> > +  # CATALOGS depends on both $ac_dir and the user's LINGUAS
> > +  # environment variable.
> > +  INST_LINGUAS=
> > +  if test -n "$ALL_LINGUAS"; then
> > +    for presentlang in $ALL_LINGUAS; do
> > +      useit=no
> > +      if test "%UNSET%" != "$LINGUAS"; then
> > +        desiredlanguages="$LINGUAS"
> > +      else
> > +        desiredlanguages="$ALL_LINGUAS"
> > +      fi
> > +      for desiredlang in $desiredlanguages; do
> > +        # Use the presentlang catalog if desiredlang is
> > +        #   a. equal to presentlang, or
> > +        #   b. a variant of presentlang (because in this case,
> > +        #      presentlang can be used as a fallback for messages
> > +        #      which are not translated in the desiredlang catalog).
> > +        case "$desiredlang" in
> > +          "$presentlang"*) useit=yes;;
> > +        esac
> > +      done
> > +      if test $useit = yes; then
> > +        INST_LINGUAS="$INST_LINGUAS $presentlang"
> > +      fi
> > +    done
> > +  fi
> > +  CATALOGS=
> > +  JAVACATALOGS=
> > +  QTCATALOGS=
> > +  TCLCATALOGS=
> > +  CSHARPCATALOGS=
> > +  if test -n "$INST_LINGUAS"; then
> > +    for lang in $INST_LINGUAS; do
> > +      CATALOGS="$CATALOGS $lang.gmo"
> > +      JAVACATALOGS="$JAVACATALOGS \$(DOMAIN)_$lang.properties"
> > +      QTCATALOGS="$QTCATALOGS $lang.qm"
> > +      frobbedlang=`echo $lang | sed -e 's/\..*$//' -e
> 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
> > +      TCLCATALOGS="$TCLCATALOGS $frobbedlang.msg"
> > +      frobbedlang=`echo $lang | sed -e 's/_/-/g' -e 's/^sr-CS/sr-SP/'
> -e 's/@latin$/-Latn/' -e 's/@cyrillic$/-Cyrl/' -e 's/^sr-SP$/sr-SP-Latn/'
> -e 's/^uz-UZ$/uz-UZ-Latn/'`
> > +      CSHARPCATALOGS="$CSHARPCATALOGS
> $frobbedlang/\$(DOMAIN).resources.dll"
> > +    done
> > +  fi
> > +
> > +  sed -e "s|@POTFILES_DEPS@|$POTFILES_DEPS|g" -e "s|@POFILES@|$POFILES|g"
> -e "s|@UPDATEPOFILES@|$UPDATEPOFILES|g" -e "s|@DUMMYPOFILES@|$DUMMYPOFILES|g"
> -e "s|@GMOFILES@|$GMOFILES|g" -e "s|@PROPERTIESFILES@|$PROPERTIESFILES|g"
> -e "s|@CLASSFILES@|$CLASSFILES|g" -e "s|@QMFILES@|$QMFILES|g" -e
> "s|@MSGFILES@|$MSGFILES|g" -e "s|@RESOURCESDLLFILES@|$RESOURCESDLLFILES|g"
> -e "s|@CATALOGS@|$CATALOGS|g" -e "s|@JAVACATALOGS@|$JAVACATALOGS|g" -e
> "s|@QTCATALOGS@|$QTCATALOGS|g" -e "s|@TCLCATALOGS@|$TCLCATALOGS|g" -e
> "s|@CSHARPCATALOGS@|$CSHARPCATALOGS|g" -e 's,^#distdir:,distdir:,' <
> "$ac_file" > "$ac_file.tmp"
> > +  tab=`printf '\t'`
> > +  if grep -l '@TCLCATALOGS@' "$ac_file" > /dev/null; then
> > +    # Add dependencies that cannot be formulated as a simple suffix
> rule.
> > +    for lang in $ALL_LINGUAS; do
> > +      frobbedlang=`echo $lang | sed -e 's/\..*$//' -e
> 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
> > +      cat >> "$ac_file.tmp" <<EOF
> > +$frobbedlang.msg: $lang.po
> > +${tab}@echo "\$(MSGFMT) -c --tcl -d \$(srcdir) -l $lang
> $srcdirpre$lang.po"; \
> > +${tab}\$(MSGFMT) -c --tcl -d "\$(srcdir)" -l $lang $srcdirpre$lang.po
> || { rm -f "\$(srcdir)/$frobbedlang.msg"; exit 1; }
> > +EOF
> > +    done
> > +  fi
> > +  if grep -l '@CSHARPCATALOGS@' "$ac_file" > /dev/null; then
> > +    # Add dependencies that cannot be formulated as a simple suffix
> rule.
> > +    for lang in $ALL_LINGUAS; do
> > +      frobbedlang=`echo $lang | sed -e 's/_/-/g' -e 's/^sr-CS/sr-SP/'
> -e 's/@latin$/-Latn/' -e 's/@cyrillic$/-Cyrl/' -e 's/^sr-SP$/sr-SP-Latn/'
> -e 's/^uz-UZ$/uz-UZ-Latn/'`
> > +      cat >> "$ac_file.tmp" <<EOF
> > +$frobbedlang/\$(DOMAIN).resources.dll: $lang.po
> > +${tab}@echo "\$(MSGFMT) -c --csharp -d \$(srcdir) -l $lang
> $srcdirpre$lang.po -r \$(DOMAIN)"; \
> > +${tab}\$(MSGFMT) -c --csharp -d "\$(srcdir)" -l $lang
> $srcdirpre$lang.po -r "\$(DOMAIN)" || { rm -f
> "\$(srcdir)/$frobbedlang.msg"; exit 1; }
> > +EOF
> > +    done
> > +  fi
> > +  if test -n "$POMAKEFILEDEPS"; then
> > +    cat >> "$ac_file.tmp" <<EOF
> > +Makefile: $POMAKEFILEDEPS
> > +EOF
> > +  fi
> > +  mv "$ac_file.tmp" "$ac_file"
> > +])
> > +
> > +dnl Initializes the accumulator used by AM_XGETTEXT_OPTION.
> > +AC_DEFUN([AM_XGETTEXT_OPTION_INIT],
> > +[
> > +  XGETTEXT_EXTRA_OPTIONS=
> > +])
> > +
> > +dnl Registers an option to be passed to xgettext in the po subdirectory.
> > +AC_DEFUN([AM_XGETTEXT_OPTION],
> > +[
> > +  AC_REQUIRE([AM_XGETTEXT_OPTION_INIT])
> > +  XGETTEXT_EXTRA_OPTIONS="$XGETTEXT_EXTRA_OPTIONS $1"
> > +])
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/progtest.m4
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/progtest.m4
> > new file mode 100644
> > index 00000000000..5f186b14909
> > --- /dev/null
> > +++
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/progtest.m4
> > @@ -0,0 +1,91 @@
> > +# progtest.m4 serial 7 (gettext-0.18.2)
> > +dnl Copyright (C) 1996-2003, 2005, 2008-2019 Free Software Foundation,
> Inc.
> > +dnl This file is free software; the Free Software Foundation
> > +dnl gives unlimited permission to copy and/or distribute it,
> > +dnl with or without modifications, as long as this notice is preserved.
> > +dnl
> > +dnl This file can be used in projects which are not available under
> > +dnl the GNU General Public License or the GNU Library General Public
> > +dnl License but which still want to provide support for the GNU gettext
> > +dnl functionality.
> > +dnl Please note that the actual code of the GNU gettext library is
> covered
> > +dnl by the GNU Library General Public License, and the rest of the GNU
> > +dnl gettext package is covered by the GNU General Public License.
> > +dnl They are *not* in the public domain.
> > +
> > +dnl Authors:
> > +dnl   Ulrich Drepper <drepper@cygnus.com>, 1996.
> > +
> > +AC_PREREQ([2.50])
> > +
> > +# Search path for a program which passes the given test.
> > +
> > +dnl AM_PATH_PROG_WITH_TEST(VARIABLE, PROG-TO-CHECK-FOR,
> > +dnl   TEST-PERFORMED-ON-FOUND_PROGRAM [, VALUE-IF-NOT-FOUND [, PATH]])
> > +AC_DEFUN([AM_PATH_PROG_WITH_TEST],
> > +[
> > +# Prepare PATH_SEPARATOR.
> > +# The user is always right.
> > +if test "${PATH_SEPARATOR+set}" != set; then
> > +  # Determine PATH_SEPARATOR by trying to find /bin/sh in a PATH which
> > +  # contains only /bin. Note that ksh looks also at the FPATH variable,
> > +  # so we have to set that as well for the test.
> > +  PATH_SEPARATOR=:
> > +  (PATH='/bin;/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 \
> > +    && { (PATH='/bin:/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 \
> > +           || PATH_SEPARATOR=';'
> > +       }
> > +fi
> > +
> > +# Find out how to test for executable files. Don't use a zero-byte file,
> > +# as systems may use methods other than mode bits to determine
> executability.
> > +cat >conf$$.file <<_ASEOF
> > +#! /bin/sh
> > +exit 0
> > +_ASEOF
> > +chmod +x conf$$.file
> > +if test -x conf$$.file >/dev/null 2>&1; then
> > +  ac_executable_p="test -x"
> > +else
> > +  ac_executable_p="test -f"
> > +fi
> > +rm -f conf$$.file
> > +
> > +# Extract the first word of "$2", so it can be a program name with args.
> > +set dummy $2; ac_word=[$]2
> > +AC_MSG_CHECKING([for $ac_word])
> > +AC_CACHE_VAL([ac_cv_path_$1],
> > +[case "[$]$1" in
> > +  [[\\/]]* | ?:[[\\/]]*)
> > +    ac_cv_path_$1="[$]$1" # Let the user override the test with a path.
> > +    ;;
> > +  *)
> > +    ac_save_IFS="$IFS"; IFS=$PATH_SEPARATOR
> > +    for ac_dir in ifelse([$5], , $PATH, [$5]); do
> > +      IFS="$ac_save_IFS"
> > +      test -z "$ac_dir" && ac_dir=.
> > +      for ac_exec_ext in '' $ac_executable_extensions; do
> > +        if $ac_executable_p "$ac_dir/$ac_word$ac_exec_ext"; then
> > +          echo "$as_me: trying $ac_dir/$ac_word..." >&AS_MESSAGE_LOG_FD
> > +          if [$3]; then
> > +            ac_cv_path_$1="$ac_dir/$ac_word$ac_exec_ext"
> > +            break 2
> > +          fi
> > +        fi
> > +      done
> > +    done
> > +    IFS="$ac_save_IFS"
> > +dnl If no 4th arg is given, leave the cache variable unset,
> > +dnl so AC_PATH_PROGS will keep looking.
> > +ifelse([$4], , , [  test -z "[$]ac_cv_path_$1" && ac_cv_path_$1="$4"
> > +])dnl
> > +    ;;
> > +esac])dnl
> > +$1="$ac_cv_path_$1"
> > +if test ifelse([$4], , [-n "[$]$1"], ["[$]$1" != "$4"]); then
> > +  AC_MSG_RESULT([$][$1])
> > +else
> > +  AC_MSG_RESULT([no])
> > +fi
> > +AC_SUBST([$1])dnl
> > +])
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/config.rpath
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/config.rpath
> > similarity index 99%
> > rename from
> meta/recipes-core/gettext/gettext-minimal-0.19.8.1/config.rpath
> > rename to meta/recipes-core/gettext/gettext-minimal-0.20.1/config.rpath
> > index 98183ff2f2e..be202c1a9e7 100755
> > --- a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/config.rpath
> > +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/config.rpath
> > @@ -2,7 +2,7 @@
> >   # Output a system dependent set of variables, describing how to set the
> >   # run time search path of shared libraries in an executable.
> >   #
> > -#   Copyright 1996-2016 Free Software Foundation, Inc.
> > +#   Copyright 1996-2019 Free Software Foundation, Inc.
> >   #   Taken from GNU libtool, 2001
> >   #   Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
> >   #
> > diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/remove-potcdate.sin
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/remove-potcdate.sin
> > similarity index 50%
> > rename from
> meta/recipes-core/gettext/gettext-minimal-0.19.8.1/remove-potcdate.sin
> > rename to
> meta/recipes-core/gettext/gettext-minimal-0.20.1/remove-potcdate.sin
> > index 2436c49e786..8c70dfbf148 100644
> > ---
> a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/remove-potcdate.sin
> > +++
> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/remove-potcdate.sin
> > @@ -1,6 +1,12 @@
> > -# Sed script that remove the POT-Creation-Date line in the header entry
> > +# Sed script that removes the POT-Creation-Date line in the header entry
> >   # from a POT file.
> >   #
> > +# Copyright (C) 2002 Free Software Foundation, Inc.
> > +# Copying and distribution of this file, with or without modification,
> > +# are permitted in any medium without royalty provided the copyright
> > +# notice and this notice are preserved.  This file is offered as-is,
> > +# without any warranty.
> > +#
> >   # The distinction between the first and the following occurrences of
> the
> >   # pattern is achieved by looking at the hold space.
> >   /^"POT-Creation-Date: .*"$/{
> > diff --git a/meta/recipes-core/gettext/
> gettext-minimal-native_0.19.8.1.bb b/meta/recipes-core/gettext/
> gettext-minimal-native_0.20.1.bb
> > similarity index 86%
> > rename from meta/recipes-core/gettext/gettext-minimal-native_0.19.8.1.bb
> > rename to meta/recipes-core/gettext/gettext-minimal-native_0.20.1.bb
> > index 26ff19975d2..7a4dcbec57b 100644
> > --- a/meta/recipes-core/gettext/gettext-minimal-native_0.19.8.1.bb
> > +++ b/meta/recipes-core/gettext/gettext-minimal-native_0.20.1.bb
> > @@ -3,12 +3,11 @@ DESCRIPTION = "Contains the m4 macros sufficient to
> support building \
> >   autoconf/automake. This provides a significant build time speedup by \
> >   the removal of gettext-native from most dependency chains (now only \
> >   needed for gettext for the target)."
> > -SRC_URI = "file://aclocal.tgz \
> > +SRC_URI = "file://aclocal/ \
> >              file://config.rpath \
> >              file://Makefile.in.in \
> >              file://remove-potcdate.sin \
> >              file://COPYING \
> > -           file://0001-PATCH-Disable-the-test-to-convert-euc-jp.patch \
> >   "
> >
> >   INHIBIT_DEFAULT_DEPS = "1"
> > @@ -23,7 +22,7 @@ S = "${WORKDIR}"
> >
> >   do_install () {
> >       install -d ${D}${datadir}/aclocal/
> > -     cp ${WORKDIR}/*.m4 ${D}${datadir}/aclocal/
> > +     cp ${WORKDIR}/aclocal/*.m4 ${D}${datadir}/aclocal/
> >       install -d ${D}${datadir}/gettext/po/
> >       cp ${WORKDIR}/config.rpath ${D}${datadir}/gettext/
> >       cp ${WORKDIR}/Makefile.in.in ${D}${datadir}/gettext/po/
> >
>
>

--000000000000a5743b059a00cc84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have more or less already ordered them that way in =
the latest patchset: there&#39;s gettext, rpm, python, acl/attr, lttng, fol=
lowed by everything else. Let me know if the split is unclear.<br></div><di=
v><br></div><div>The idea is to significantly bring down the amount of outd=
ated recipes in oe-core, so that in the future we have a manageable amount =
of outstanding upgrades to do (e.g. a dozen or two at any given time, rathe=
r than over a hundred). Right now AUH is finishing up its own monthly updat=
e crunch, so that should help too.<br></div><div><br></div><div>Alex<br></d=
iv><div dir=3D"ltr"><br></div><div dir=3D"ltr">On Wed, 18 Dec 2019 at 21:54=
, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.=
khem@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Alex, good work on these changes, =
I think it would be good to upstream <br>
this in three groups.<br>
<br>
1. common updates ( that might have resulted from gettext or python3.8 <br>
update ) but is generally ok<br>
<br>
2. Gettext and related patches<br>
<br>
3. python 3.8 patches<br>
<br>
This will give us a good way to consume these changes fast. Right now if<br=
>
I throw all these patches and several packages break, it will be harder <br=
>
to pin point what the reason is and how best to fix it.<br>
<br>
Even if you grouped these patches that way it will help a lot.<br>
<br>
On 12/18/19 6:37 AM, Alexander Kanavin wrote:<br>
&gt; Rather than update a tarball, I took m4 files directly from an install=
 of 0.20.1.<br>
&gt; <br>
&gt; The patch is dropped as guile has long been removed from oe-core.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...H-Disable-the-test-to-convert-euc-jp.patch |=C2=A0 38 -=
<br>
&gt;=C2=A0 =C2=A0.../gettext-minimal-0.19.8.1/aclocal.tgz=C2=A0 =C2=A0 =C2=
=A0 | Bin 40014 -&gt; 0 bytes<br>
&gt;=C2=A0 =C2=A0.../COPYING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A00<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://Makefile.in.in" rel=3D"noreferrer" t=
arget=3D"_blank">Makefile.in.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 124 +--<br>
&gt;=C2=A0 =C2=A0.../gettext-minimal-0.20.1/aclocal/gettext.m4 | 386 ++++++=
+++<br>
&gt;=C2=A0 =C2=A0.../aclocal/host-cpu-c-abi.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 644 +++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../gettext-minimal-0.20.1/aclocal/iconv.m4=C2=A0 =C2=A0| =
288 +++++++<br>
&gt;=C2=A0 =C2=A0.../aclocal/intlmacosx.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 72 ++<br>
&gt;=C2=A0 =C2=A0.../gettext-minimal-0.20.1/aclocal/lib-ld.m4=C2=A0 | 168 +=
+++<br>
&gt;=C2=A0 =C2=A0.../aclocal/lib-link.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 774 ++++++++++++++++++<br=
>
&gt;=C2=A0 =C2=A0.../aclocal/lib-prefix.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 249 ++++++<br>
&gt;=C2=A0 =C2=A0.../gettext-minimal-0.20.1/aclocal/nls.m4=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 32 +<br>
&gt;=C2=A0 =C2=A0.../gettext-minimal-0.20.1/aclocal/po.m4=C2=A0 =C2=A0 =C2=
=A0 | 450 ++++++++++<br>
&gt;=C2=A0 =C2=A0.../aclocal/progtest.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 91 ++<br>
&gt;=C2=A0 =C2=A0.../config.rpath=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 =C2=A0.../remove-potcdate.sin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0....<a href=3D"http://1.bb" rel=3D"noreferrer" target=3D"_=
blank">1.bb</a> =3D&gt; <a href=3D"http://gettext-minimal-native_0.20.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gettext-minimal-native_0.20.1.bb</a>}=
 |=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 =C2=A017 files changed, 3236 insertions(+), 95 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-core/gettext/gettext-minim=
al-0.19.8.1/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-core/gettext/gettext-minim=
al-0.19.8.1/aclocal.tgz<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-core/gettext/{gettext-minimal-0.19.8.1=
 =3D&gt; gettext-minimal-0.20.1}/COPYING (100%)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-core/gettext/{gettext-minimal-0.19.8.1=
 =3D&gt; gettext-minimal-0.20.1}/<a href=3D"http://Makefile.in.in" rel=3D"n=
oreferrer" target=3D"_blank">Makefile.in.in</a> (78%)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/gettext/gettext-minim=
al-0.20.1/aclocal/gettext.m4<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/gettext/gettext-minim=
al-0.20.1/aclocal/host-cpu-c-abi.m4<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/gettext/gettext-minim=
al-0.20.1/aclocal/iconv.m4<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/gettext/gettext-minim=
al-0.20.1/aclocal/intlmacosx.m4<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/gettext/gettext-minim=
al-0.20.1/aclocal/lib-ld.m4<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/gettext/gettext-minim=
al-0.20.1/aclocal/lib-link.m4<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/gettext/gettext-minim=
al-0.20.1/aclocal/lib-prefix.m4<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/gettext/gettext-minim=
al-0.20.1/aclocal/nls.m4<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/gettext/gettext-minim=
al-0.20.1/aclocal/po.m4<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/gettext/gettext-minim=
al-0.20.1/aclocal/progtest.m4<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-core/gettext/{gettext-minimal-0.19.8.1=
 =3D&gt; gettext-minimal-0.20.1}/config.rpath (99%)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-core/gettext/{gettext-minimal-0.19.8.1=
 =3D&gt; gettext-minimal-0.20.1}/remove-potcdate.sin (50%)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-core/gettext/{<a href=3D"http://gettex=
t-minimal-native_0.19.8.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext-=
minimal-native_0.19.8.1.bb</a> =3D&gt; <a href=3D"http://gettext-minimal-na=
tive_0.20.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext-minimal-native=
_0.20.1.bb</a>} (86%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/0001-P=
ATCH-Disable-the-test-to-convert-euc-jp.patch b/meta/recipes-core/gettext/g=
ettext-minimal-0.19.8.1/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch=
<br>
&gt; deleted file mode 100644<br>
&gt; index 29ef2a5a63d..00000000000<br>
&gt; --- a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/0001-PATCH-Di=
sable-the-test-to-convert-euc-jp.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,38 +0,0 @@<br>
&gt; -[PATCH] Disable the test to convert euc-jp<br>
&gt; -<br>
&gt; -Remove the test &quot;Test against HP-UX 11.11 bug:<br>
&gt; -No converter from EUC-JP to UTF-8 is provided&quot;<br>
&gt; -since we don&#39;t support HP-UX and if the euc-jp is not<br>
&gt; -installed on the host, the dependence will be built without<br>
&gt; -iconv support and will cause guile-native building fail.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [OE specific]<br>
&gt; -<br>
&gt; -Signed-off-by: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com=
" target=3D"_blank">rongqing.li@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - iconv.m4 | 2 ++<br>
&gt; - 1 file changed, 2 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/iconv.m4 b/iconv.m4<br>
&gt; -index 4e37363..35f54bd 100644<br>
&gt; ---- a/iconv.m4<br>
&gt; -+++ b/iconv.m4<br>
&gt; -@@ -165,6 +165,7 @@ AC_DEFUN([AM_ICONV_LINK],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; - #endif<br>
&gt; -+#if 0<br>
&gt; -=C2=A0 =C2=A0/* Test against HP-UX 11.11 bug: No converter from EUC-J=
P to UTF-8 is<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 provided.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0if (/* Try standardized names.=C2=A0 */<br>
&gt; -@@ -176,6 +177,7 @@ AC_DEFUN([AM_ICONV_LINK],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try HP-UX names.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; iconv_open (&quot;utf8&quot;, &=
quot;eucJP&quot;) =3D=3D (iconv_t)(-1))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0result |=3D 16;<br>
&gt; -+#endif<br>
&gt; -=C2=A0 =C2=A0return result;<br>
&gt; - ]])],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[am_cv_func_iconv_works=3Dye=
s], ,<br>
&gt; ---<br>
&gt; -2.0.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/acloca=
l.tgz b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/aclocal.tgz<br>
&gt; deleted file mode 100644<br>
&gt; index 9b2d1f561d734df608c9c7a6e29e08131296a5fd..0000000000000000000000=
000000000000000000<br>
&gt; GIT binary patch<br>
&gt; literal 0<br>
&gt; HcmV?d00001<br>
&gt; <br>
&gt; literal 40014<br>
&gt; zcmV(;K-&lt;3`iwFR{kBwIV1MEEcbJ|$a^RxeoH^emt4+w;&gt;*ol+HfNg3puz+(E&lt=
;5CIf<br>
&gt; z0a^=3D*)nSKC^1pxG@6g3zCtppbc6Kyl5PJRk_1*mr#c)mP(?FRY{`7}k6}XNM58?aZ<b=
r>
&gt; z=3D;-*6{Z&lt;e8H{Kqp)t}Vr@yWsAk$O~Bf2yd}%E`%3r1Hm+6knkq=3DpG?I*-PD-s@=
veG<br>
&gt; z=3Dl=3D+Te(d#v7?A}KVA0ZTazye|8U*xHP^u{EOQl-aF&amp;&amp;%K-Nn+grn7+L&g=
t;jhE;&amp;6VJz<br>
&gt; zTEyF9_W2SXsE2r~9+OLtQZjHS!K3a`a_NSSsRx$p6dAIXV&lt;_xqIJ0~*v20548~ga8<=
br>
&gt; z&amp;nptl=3DteZG^VE8vJ_#M$np*)i$%1-w%lDy~1TJv4SQ6ba%dSUE%MUzj90o8&gt;=
z)5(t<br>
&gt; zf*FA({C2~D%w5x(SO&amp;xH7m4l@+jXY+9UzU48(0RTa^Zo%ya#G3I}FjK=3Dg!H67dk=
Gv<br>
&gt; z)~&amp;Hk;d!mDHJX&gt;Vo&amp;2bFqqS?Dt5)Z-tJS-W=3DAb#eEAEVT2mzRSt$y9q;=
IIB$el!7M<br>
&gt; z99y%&amp;5G`loBIzXRK}PyqGajN=3DP3R495x7QxtljGTrnN4c?Ljlo9?Iu1yw&gt;Y?=
ullu{<br>
&gt; zr~%tXFD%EfLz9x%60I_Ob0&lt;(rAY-O``^50cd6K%kpsetUcr*w-hx}~#ukP*&amp;aq=
kTj<br>
&gt; zpD(HZG?3%o6&amp;MWrvL+;;en58DLj!4mlo^b}I&amp;ty0I?ep(y7sQQMgwG|MnsGnb=
YeLa<br>
&gt; zM_IZdnduK{i7-v9&lt;6U9IO{^XG{&lt;A&amp;#`z~;D&gt;NzC~T*#q+P!`x8|JBN2w=
F2?~q*_&amp;v<br>
&gt; z4^;I8;{QRldiZzz{}C6)uRU%Agd4#g(TS~-)}Tx3r&gt;7#s#jzh^d$qJZ!2e}}dmO~4<=
br>
&gt; zw$}VGZ1y`^s{&gt;)SDI@r`_O98#s0~{;`4N|*#-)e=3D&lt;$cn#sqO&gt;Uz$Ws0&lt=
;%G61CUe~h<br>
&gt; zA&lt;tsGpSh374OkZfz~@{yJlBW8AubKV1(M^Fl!7&gt;K*S*s12VxkE7b_t8VnKD!M`U=
A4<br>
&gt; z#-4jmomV(8B6&gt;Xwg2h?6Y=3DfYDW$J{A&gt;rKnLXUssx&lt;ykPd%j0lbf|QTptqk=
ftC{?QE<br>
&gt; zxjzL5J*X%M@#blo2BAah@PvR*fhIlEFBvW%^nhWIF6e*?auE|Ka|U2GC|MwxgpR=3D!<b=
r>
&gt; z1hUWrV(7L_sBVBFK{lR3NK=3D_AMJBgB(dEIlOfo@qdAu!&lt;&amp;*UpfwoT)P3CTmY=
`np#n<br>
&gt; z#_1^l8LsD1Be0iXO!I}UTaJ&amp;2_B=3DYF9z}{ln7|5{2C+=3D)1YkkbBe_Wqc}(*!N=
#9ct<br>
&gt; z1+#mQD0u{K-7z&lt;)q&gt;PRfwTidhfo2`NJVvil%lQBCRw?JRX02&amp;@AWUD=3DNI=
tJ=3Dpj=3D^s<br>
&gt; znpP;V6bcT5YOtoErzgY&lt;@(*;d65t=3DrZ%=3DY6q5$x2fmG-m7)LCza$tOJrAbu-Q!=
}cY<br>
&gt; z5G09h-9!E~g5`oj@&amp;vVALJ#^$M{F$RLY}pJ)0%?Wf}9d`L&lt;54f9xNRqQHrRD28=
Klk<br>
&gt; zUv;ORK1c2X(4K`3y-6{#N%?YcW`z0@ou53q-aYXxrgU)BddwFLGPA~3kkv&amp;b4&lt;=
;Ne<br>
&gt; z0TDUUAZU&amp;Nl!QUR*S+IDvJmDPM(BZd&amp;USbm(jAZwM6D&lt;&lt;S-k&lt;?Y=
=3DgNmA3oy%&amp;-3Cb<br>
&gt; z3o&gt;OEs8#92)dS|lVx)$rPhIEIUPcijLOu_D16)!u8OX$5j(wAjGY;+hG8DJe1RhJ&a=
mp;<br>
&gt; zoYK&lt;54bUreyKL)No|Pa(mlpRx)2tK(OPD&lt;zfSoJ0I~C(%yuTPU{y#h&amp;mMSN=
lCny|Z<br>
&gt; zo}}zfp?dSdG?;;cdvKc+9s#N|Sq=3Datp_YY0Ce|mgH;gKElswZX{4lWG1DF5`+&amp;K=
mZ<br>
&gt; z_H_E|uZ;XCrUssFC@|c@^?(DU9+ZDigYuzTIXHO3;z7;#!#Rz`&amp;J-+!0lo}j4q~&l=
t;s<br>
&gt; zdCt}`%&lt;Y$VUVx9}^LdjMrY0~_&gt;-E}A@bO=3DMA@Rc-m_C4;lix)l`{hfbF&amp;=
Yher5eP*<br>
&gt; ziH?9YF;rS+5;t6LlTgOO4t@MflXTU&amp;t!sl}qb@Qf44%Ni$ND(|&amp;!n8&gt;0j@=
J(Jpt3`<br>
&gt; zc81#R0Om=3D&lt;kG-bEn?al5fsv8nJEFKy$aDs&lt;xbJ1RKWtro)CS$#e!Yo!E9CXc&=
lt;IL!s<br>
&gt; zfR*vH%*GTzXnrADh&lt;4RZmlr6&amp;&gt;t?Od&gt;}wadS355#*zH8vM1)&amp;X@O=
HcOfrPDE0b#4B<br>
&gt; zr&gt;7OQO&lt;tb^D1(BkX3*+((#k_-;-Rj4nqh2i?p?LAjS2M(ZaXj`)#{u&amp;HY8@=
NggwTn<br>
&gt; zwhJdCMh+rk^cD%HgZVa9v^r&gt;epaUDlUqw@p8u*puPq@(7gPT^T+ecGQOJXqWx9UT!<=
br>
&gt; z))};t^87{~VepKa;bWbalaFyMs6x|K0r5p~K`~HX)$8O?sX`5{PaW5X*d+oGStHhT<br>
&gt; z27Idc036iz=3D`&amp;CvBscM=3D6!tt#`E;#Sh{TLfZaV&lt;l*f!o8U{2!&gt;NVMe$=
!5x!4TSM_7<br>
&gt; zT@^5?LuE(u^pkwVDitYkGIpmBFLREI(~Jkp4ROBV1}&gt;ILysW+KcK33ux`7Ol0yHUv<=
br>
&gt; zN?yPvKoffN*;tP=3D&gt;JVtc#HO!SL6*ZZ9}n^A`GF6~Y-$)$5{B&amp;fA4pAl*@sDr=
2EP&lt;z<br>
&gt; zYQ440^P@vmJ$NHi&lt;+t@cK6rU@@+Qu4kuRN}lS8!P&lt;5h=3DRYyHm(a%)Xb6OL8yb=
_PSO<br>
&gt; z*RNgO)V7)GI(X^ES`U)!TqpS)nnSD$V!@3E)c&amp;3;z4ycE6sx1iTh5_i^@HDYxx#wG=
<br>
&gt; zPmg=3DiylQpCfE&amp;kKg#Ij7cnT^&gt;6`M;#B^Mc&gt;j|6=3DWhJ&lt;CNa6BdPjT=
|&gt;SjVJka7bv|=3D<br>
&gt; zuAY+J6GI8VzAOCquHt?FH8GsPF1df=3D{*S6wP7YW0f7HMCe}2gIg2Wae_kRx8Z};#$<b=
r>
&gt; zp40!8#Xm&amp;!-m?Oj;*#-_^z_gsO$g*(0F5um5Vs&gt;B+2YC+V`pOPQ=3DfFTP8XL0=
n=3DFCj<br>
&gt; zugh+`-F;7VBM5aHrhd56pa24~=3DfJin-go=3DIwK`W?+#8rwG3&amp;)oupbZ)Y(ZOvF=
Nr-`<br>
&gt; zKHY{(jGaU#9&amp;N^!TJ*fEcZO|1b=3Dj_64aA}+3Z@6n5JCw-rZ6ox$ZKXqxKjeyM6B=
H;<br>
&gt; z2}PiQad1vI_&amp;69gZ&amp;&gt;Zs!70apt(jR);JIdKfaalM(Zj&amp;S6)aL!jw=
=3DkEJN8|h2Goy{<br>
&gt; zVcpB;W;nw9P_rgLNq)3xoW#aizxmJGR=3D&gt;Fgwy*&amp;@9uz&lt;dJ7QB0xAR1T8E=
D;39biKT<br>
&gt; z%+yq7Y{Mvm0WsGlguk3asdgU$WOoKpW4Lf3M2$OGpdjNxPS-`d#@e-6lHl9U_ihXN<br>
&gt; zOTWx&amp;1JG@9!kdP`Qh5bn!p-rv(}I#ryG}KdsJoO)x-+JAoVb9uzqcIIee}6c-wfW&=
gt;<br>
&gt; zv2t9G%W|`L;x-rrEOn(_7L~qD=3D_2nGh{o&lt;&lt;G6VPfM1}lRNK?kDwY8FvK9CWE1=
7pO_<br>
&gt; zkXki(vEnL~rv{7Bac|m)Px$#02&amp;3iIfUugBf9g))kM78M3i;&gt;Ef(Ojr`_0&lt;=
02sh0S<br>
&gt; z^&gt;&amp;esS|1KS;@uEzu8udgUJpvF;!596w{y|%)_+5o!AAjGuitbVO}y&lt;lx}Ek=
%e)qnQ<br>
&gt; z-|zeQB!%betHjUju5}6$`Ge3N+PG8vbHwATwDhFO4nE%CR{B=3D%h2U^+Tu2W57iC6r<b=
r>
&gt; z7^!eIRDmbCSDAjeh9Ep0irTVCAIeT&gt;+qok4FOZ+lN!sApB}o5rPO4datN_l!XNi&gt=
;}<br>
&gt; zn3zDHyMTm-G{jORUy&gt;&amp;CC01&gt;vkR4C*0I1%qrFGNzcp0_}ehq!sqD^ypxE|!=
|%G2x&lt;<br>
&gt; zqz&gt;x_6mTR{T;YqwuKZcz=3D4PD|_kW&gt;;lhRG&amp;NJFlMn`gKY7L2hUK|q7lv+=
6}@&gt;0+N1<br>
&gt; z@v?xrA_gJZ*W2~}^1Jm8wP&lt;Jrj4$}8Y*a1-07{DF7XaI2iD|0T&lt;8|oPlD3IFytu=
G8<br>
&gt; z*@wt~&gt;P7=3DX@;xXy1ocLdsEmAdJ^5)CsvC@M3me;5k@Uo7zeSL%)Eun%_p&gt;Q_i=
YmO)<br>
&gt; zwxDhs3on)$xLGiJ2E$OF!w+5wuU&gt;0&amp;$?HkJVqz+aA86pAbBc5TJ&lt;;!{NlFr=
Ryix7^<br>
&gt; zT8%l|Tb_zh&gt;0jb}8Yd@nL~UCMojIsx;7N|%w&gt;Tkr5!cIy1+o&gt;#p5v1ISWnJ?=
3VW|!<br>
&gt; zB~cuI6Am8NvM64DGm7FCipc)c=3D%7mkPkr5Zu2Avd0G&lt;n(FD%?Gm-8kr-EBQ1!S6&=
gt;r<br>
&gt; z&gt;_e;v#=3DejY(gIAkwFlikuSmZ3qem*E8!6sNoD+n3%0F+r!)8Mq7+jf=3D&lt;9ut=
EqmWZ8<br>
&gt; zG3(wiRad@`FRqXu!x$gyd7LHJ4V3@QwbH-hB@TN3iR-@y$0x@Jne(4j^+^4D{r5*)<br>
&gt; zFGy?wa{c%CW$FchQ|0Bl7XZ}L)1zmd_y4P`2m_uB7l!WO!5uISwoJM3+&lt;#Fc@X6!M<=
br>
&gt; zGG+vMz@ugQgKpXS7~p{)&gt;M&lt;PbFlgtNTv3O5Ao5-~wqYLBhEW~J7p@mUw5_qHd&a=
mp;&gt;+Y<br>
&gt; zLn5K^h!P*t5AZC}qYl%f0Jo0a2g{^v``PsZwrecW3jH!Xa&amp;uU&gt;tzgMDCC;q^`I=
H}=3D<br>
&gt; z!+v}To4qhX+({M{u?3|d9m9Q~9yJ-N@$v~?Bp*e#vWu`DuC2!-aP^B(7P@h-PibP5<br>
&gt; z&lt;Ou6AOY5Ucrj&amp;hPYhUh!FF2&amp;&gt;;t?;g&gt;|YDPN&lt;9CJ{UGGl_E5M=
Dk1oLI$ZM0|{KHsI<br>
&gt; zozPbxIln1Ncc@ep(JT2v2zfnY-~TXd%U&gt;us)5UG_H^t~Rn#2n&lt;6+y)fJHiHf)J=
=3DXm<br>
&gt; zEyUf{q{s!}tq%e@Befg09DUUs4x1l_`BAGgY!5!(Ty)!*;XBP{BmRYLjaL7zz^RQv<br>
&gt; zrA@mI)3G=3DjuG@P&gt;0ySR=3DbR4)Y`vq1X{Zvr6f^S??)v@l+&lt;1tTm!V|r~Ur+&=
lt;j&amp;zfl5<br>
&gt; zbiN3d1#C(pm6A)6&lt;Ab}}CQ=3DlW!h|90Kr9S{q%A0&gt;!1eJ&amp;uj?&amp;~5*O=
N3au6IoMf)0T<br>
&gt; z?A$~WTTIy`NgUFjL{(%jpy2s=3D{y@5f?7f&gt;0+=3DVs{E!zatg)$CO1{nNSY&amp;|=
*&amp;Xu$j$<br>
&gt; zLtNg6sXBa%xW*Stim{v*xWED?0U@wd`b-@RGDV1f`2Dr?nfEU8ZeRJni7&lt;MMYIxSw<=
br>
&gt; zok(o8n^L1Ss9m(1rNMQr-)t0=3DHQc65AUd7&lt;Eo`oEDJ*b8VhhEgVtYZl+1QktB}bU=
P<br>
&gt; zlyx?i!4(}M7Kfel;OT6a3PdQVC`5?&gt;r6F&lt;V3sESPxFoIO*n&gt;izCRBFi^s&gt=
;Y60p=3DrT<br>
&gt; zTH&gt;ds*O0zKGmE*V&gt;+D5b$smpdvv)Jd=3D_z&gt;)%*gE-k{n7N(9Y5yc{?~i63&=
lt;c&gt;gcvCI<br>
&gt; zdFW+!&amp;-H0hpYzMSH8MMdf~i6X9=3DTT0dlGLlV^X;oAfkHeJUVs|@g|sI34n7Z5q;=
G{<br>
&gt; zQcnEs0lwj4$_UO#_QP@P`&gt;~0!d6P&amp;)A{a!Z;e)y!=3D(al*vO8mAl}c{_Czv+i=
fFXAC<br>
&gt; zP=3Dx5nU$zqlBnJzSGos8POiv&amp;_$)2M0QKoa3osxG$5091ucMMB4#TGlWJf;*6c7;=
yF<br>
&gt; zn7{M`I^Xj_*TTd8bh-};q{BijMq*Jj{73ZB?MHpdR8N}D6cXKx%&gt;AjgS=3DbIJeG6?=
-<br>
&gt; z^J*AMWF;5h8(;=3DQs!YEJEQPVN^-&lt;nuM1gs6wtNB=3D92g4Je&gt;OyifbBS=3Dw{=
l&lt;5*?S{c<br>
&gt; zTReJ}JS)yHp_DoCFb1R7=3DjZL13y4UplLbf-!J=3DgHq1?rFYN71{cO_P}QF4#Vt(Yc(=
<br>
&gt; zW)I3kmMqaDT@&lt;|KdDNy4SkPg`&gt;F9Hc&gt;$eW3Djv%jF05Vf4G5T`aIZ_fewwHX=
5?lB+<br>
&gt; zZyI960esZJ^$6THw&lt;fqcm&gt;=3Dz`SS7$8e5RjC(XVTZv%|X9M5e@MzS2NFZvg=3D=
-$d8)+<br>
&gt; zez$)Ha)981@AOz66oI-V5+su5WCs_H_&lt;u3oE98${+q^4`?zYg$LBw~wY2Iknt~%X8<=
br>
&gt; zGe44N4G{L0+fka7D4E2&lt;i3zvx&lt;R;`&gt;gXOw3xuf0c8ZonHsbseiU`=3D*;hG=
=3D~X;n#eQ<br>
&gt; zY&lt;J{w$oyy;Xfp6&gt;7;%NDHW`Ol3zTOtQs}iiR)1=3DP+Y78gp&amp;wglMZMe=3D=
qIYufSs_D#<br>
&gt; z(3&lt;9llZo|71F^yv^xS4&gt;Blf{j0ScD9wN|G!#8t91UD(FtD^GI7M?G$|URMx2xGS=
KG<br>
&gt; zMZ9MvQ^a?XVMxYE21$}{frSsoCS4v(XZ{^pKFn`@W@h+K_XT^en;pQ&gt;F1n46N|rPZ<=
br>
&gt; z)ay5UP`2UsW$S}HMUsW;_iDrIc*KD_r?{H$%fg5-0zB~m%;cd6IY2n0Pw~ARRxis|<br>
&gt; zd6=3DhVQhvCJl1Emsn=3DYS8i#{w$^F)I&amp;i+2(h!r$!9?c&amp;LsPJ58Uy+4p(E_=
$6if@RR3<br>
&gt; z3B*I2&lt;Us7W&gt;iPTbF5F?=3DhNsVk!=3DRxUh=3D60}pgG*b5SYKFkRuq&gt;Iv3!=
=3DFo3L0sAAzf<br>
&gt; z;K98IaiH$%-Of9~M8;nPnnYm(+1v1}MIgk1-pZFLSe)kR9fP?)qc)#X3ncm!+99ol<br>
&gt; zfsb=3D{-C2@7Yr&lt;z(fEDMj!J`XGu|rlWo{4@X(qg1WlxEC^VD~k6qwaMV&amp;s=3D=
dX=3D%&lt;Cw<br>
&gt; zvM_taZw{p+cp(sOi#aG*Q?K8B*J?Dy!6J!fz}}!+Y33CkzTlTQ%=3DPA+RFxy1v?1vU<b=
r>
&gt; z45n*@{0+b&amp;S`$ykR-ioTZ&lt;{=3DBjVzdVtnmV@CUDx#-X&lt;%q^9hF?!D4y64p=
NDis1zPu<br>
&gt; zn1A2Y&gt;fOPI2s;gkFzprBy}_rPkmm%Gi`!Pa0b|tLw~b~49U8|wcU;zrgRF03{K_YI<=
br>
&gt; zJ52oObs-*|OKNK-BnASt4_jDs!ugo8BZADfbto007nH@;MvkC+p?&amp;)V--~6W?B~d)=
<br>
&gt; z{6uoNw-jjl!qUVr=3DLbaWCCPp=3D@vQ@{M!+jgDoJjEYzPbI7&amp;(lGY}@YVG_tQeh=
HS)x<br>
&gt; z%J~*l2%nQuhKlx)7p0(oA_9iXmhte#Tngocx$~^p$jAdkm&lt;vS-50(?tB8}rY=3DEaQ=
j<br>
&gt; zW^lz%9kx1G`H?)}8qK+)39HZC0;r?rT_NsX&gt;tAW_Tf^)8NOmbjMNG6^I3h4vK_@C@<=
br>
&gt; zf#i$u&gt;lYR!5g5u6=3Dp5T;TEL2#$pT+PlKk)DI1v4x3GTRsv@H6~!EJj8Rl&amp;Ay=
+=3DUa!<br>
&gt; zvuJZ$yXT^6N$PtmbRv&amp;MR&amp;W&lt;@$nzyZP@3sdzV-%&amp;Vd09ZlUPDT!;`a=
0LN3!Ln8L;X<br>
&gt; zc&gt;=3Dx^kXp0w6HD8|oH6I)d-`~O6CUBeq&gt;{xo!TIS}H}3IAmXe(aI{Fu1(!NB%Q=
piDq<br>
&gt; zaee_1z9)qc8g^s&lt;FwFVhjyy1_rRu!FZLinu4&lt;StUo9|k9!gog=3DoqP%~KiB`|d=
Ige~<br>
&gt; zH|Kb|&gt;@EDAk&amp;;@F?}+g^+P_0Lp!p&amp;z^l+I5DZ!&amp;ly65RjGOCh&amp;=
l7Di*N&amp;z#aT7VR-<br>
&gt; z-n~j;9u;{JxfgH5r_Xk*7fS&gt;%v7ROF&gt;N;^liGZ)P{a&lt;@;+R(&lt;4Eey}smt=
RpMlprx$<br>
&gt; z5SwE=3Dcm{)PbAy44aN=3DC-bQ-AvjU}~4Eg4AS=3DeNISskOUW5_m}_q3&lt;0&gt;bX=
T3)PMtb+<br>
&gt; z*3^WHf54bD^)3|(6@mX-DNpO77nI#e{o7|3?Vuz}`beXlL;h_u(Y&amp;BZ=3D3|bDG#5=
Bs<br>
&gt; zu;M34@#f`|`EgFWK#oN)=3Dmq`cB7j?B&amp;;~y2vHfuwzp{cNIO~$gH+h_gu_Po3ny=
=3Dv=3D<br>
&gt; z(85*#!&amp;0zujXV&amp;wH`SbQR}`)ny;zo&gt;E!RF*O&amp;~UoOT&amp;Fp2vdH%=
AZ&gt;P*g@sGyVh*yv<br>
&gt; zh-UOQ+naK#Kc{@F$U_^n1uERK${;Q%&gt;lS`K{q03PpX@Scx;hW9t@owPXIo$1meYN7<=
br>
&gt; zTg6Ty`!7*Wa-|i+pwd@hYVmgpRM&gt;9EBgEVu9ALXBDyI|3duK*&amp;1Vt97G|o(~&a=
mp;Z2h6<br>
&gt; zr&amp;p*hY^ZZ9RC`pufG3sRA&gt;F+coalWtz(rOQN+&amp;ROEV_pC*Ph;Ky)3)s&lt=
;{)^MJVxVY<br>
&gt; z4qj!8qFg0`b2`{LI-&lt;S+v!Z?$9GIR0q9_-~EvZ1l7_l_|$1Pxe5JfqeZV8;vgZPR&l=
t;<br>
&gt; zZ742Op$tuD!kD9Y9M*;*kK;pUIpaB`ehy;)Wyn1OV^}&amp;;#6n@Gpt%Zm(LnoMqTqB*=
<br>
&gt; z?*w758z!P;e=3DUE4^TCA&lt;&lt;o7e55Z*K5cReM1=3Dfo_sPxnI4VKG-dIx+6F4G8;=
_eDuG?<br>
&gt; z(L*;?-|0gk7C)e`J$&lt;VV1npp=3D{DsVsgimIhQ_)nR=3D{s|-y?MVozrgOy*`L4j4)=
yO*<br>
&gt; z=3D#&amp;z171a5XkAcD#i9z`jQ{!Yxo%!fMre11?TbD3=3DtV1?^Fnf&lt;s`&gt;3^v=
hkb35BByX5<br>
&gt; z!XCPA+(-kEF`7i!f+L%^D3N^*DWoe7B;=3DI3W4Pr@c{$1XIo_7CDCiDSTKfTkcEH$T<b=
r>
&gt; z1k)?i6~o$)Ab2wDgku&amp;kIAGLX7oxOtUXum^tOOrT(9)1?dFn62cM+;kYu!Q3%+kkk=
<br>
&gt; z&lt;c1-4!$JM_8$kUya+?R59z}r*#iQ+=3D@3x;ei99Ql&amp;Cz5)9vio&lt;hx)R_ce=
$7$VZ4dV<br>
&gt; zili?0xIo7gpjTUsph{?rCVPAVA&amp;+Kr8?X;8OGd3&lt;op@eK4m2w&lt;m`~&lt;ui=
`}M=3D)GK&amp;1<br>
&gt; z15L@skSTS{IV&gt;v&lt;x8gG`5u*S-Qpo9%fZ7#v1daA$Xv$(}K}N!ukuCa1$o7b%cW4=
7j<br>
&gt; zY9VDfbU_A}&lt;0vc1Q&amp;n@67IsIynhU#trp;Q&gt;y9SrJx0N@=3DUu_Gd4`hK&lt=
;!LMa)aCZ7O<br>
&gt; zPjP(uHZ*4f{W^JZ+}z$Zbk;f*K10hVR@*1O){(;h9JMcF)Ups0RS&gt;@kocSuo&gt;#P=
g7<br>
&gt; zpduq!7xg9i&gt;L*dxzeN##|D3^ro$Zsur~d=3DT&gt;sAISX5qg?4x6+9t@|_&gt;C8O=
ZlXipT$<br>
&gt; zV3O%L+VPli;eV8vMU91+Q%f7i=3DcChy-)-0^s6j)gQ7D6kkfk`=3DA9W^Vz9%(}wd@Ws=
<br>
&gt; z+)QS4KD4!&amp;nY;&gt;e3Jux3^Ss&lt;`R;*y{%&gt;%SRC9S9vp*`!91hY3t*jx=3D=
wB~&amp;QbKJb)e<br>
&gt; z$SZZ0=3D(e#0#25;`j|9e=3DoWN&amp;&lt;YHP4+l5w(*FR5`;`ZJm%o}pYNnZ#gL&gt=
;1Gv35~35&amp;<br>
&gt; zeyV2A*U*U7V`_)!xNhwj1%DWZRu1LXtC-#!pNfA;Z2;s~$*6Fvpsa&lt;|;ji$~VIr*Z<=
br>
&gt; zN+E0EtX0%1XjzEbR@{XJt7dw2bafTdf1XwPL(g;uePpb0a^5Es1|&lt;(Hr|alhk+j1t<=
br>
&gt; zfs#v(&gt;v3}U{q}L`R9#R=3D?;_bTUBw(c#OnaBhpf&amp;OhE_)NT-carU2;5Ox~MJj=
F)}kb<br>
&gt; z*RTa&lt;S04oF+z#5b(IFUCPKT5}*)sD^T|RtQqMEJUcG}(DnY-mq`=3Di=3DcQ%E7HB5=
h0r<br>
&gt; zG_Q?OCCQ&gt;cuG{VkSegwxhOvdtv-x3pRirze|2C)ex)dB8Sb0Bxr-4DKC4j%Ah3pBg<=
br>
&gt; zvNQuH!&gt;dVm92r$bSIWuFuF`jv&gt;=3DnnHH=3DaWBK4a~P8LX&amp;1&amp;3IiD$=
d|tlM_tr#CrZVw<br>
&gt; z!*?q~rkbKBFx@TKH2zlPQkr5urZ-bavpkBwnQIT(7Hqj2NuJO;*z&gt;rz&lt;#`Vz;$p=
mY<br>
&gt; zi?-E0JGb54?UU`@z2k%Jm(4BmP)QBh`hKfH&amp;un&lt;_pr!do$v&amp;D^&amp;Bss=
M=3D=3D0_Qtl&lt;`1<br>
&gt; zliJd(!nDcXKJ_3^_F){Yt&lt;)y+VOt@SHpi-8cvCDPeZxP&gt;&gt;624W8W*;Q&amp;=
?GM;?E$6S<br>
&gt; zRwOY@CZiGFiLukllkcjVTv{8SxKz9i9Uh{o?6YTkuccAzR^D~W(=3D9)Ql;PjUPB%7W<b=
r>
&gt; zMBGY;&lt;#q(Wn-(=3D$F=3Dmbyh4GRW1I{KA*4q&gt;Rdm{hrsLyVKj`6dI2Cx=3DUV!=
S)G6`$%4<br>
&gt; z(*N$Di}C%tzo5@de?72lu?;NgRDhp&gt;$sUaZI_XZ~u-pbNg17&lt;&amp;e2Y4n4+ss=
lO^&gt;~f<br>
&gt; zjnYcn@@FjPx;s$WobF+R%4*u_V!;?R78`}x{gJWKVJ!0Ck+w6_`X%eg0Z)T2jYaR&amp;=
<br>
&gt; zN~*4G&amp;GG-H_&gt;HTL-!=3Dc=3DW@9ZC|FyCCVDsMp|4TfJ!eD^T|2H$;-#U9Mljr=
}+jDWCz<br>
&gt; zs&amp;s!c?yK!dzoXpRE81*&amp;wbsCv2GLbCq8O`_9h_v0)H*#^;6*QZ4%B&gt;Sm9G=
=3Dppxv&lt;n<br>
&gt; zQR0Rx_6AT#QmQv&gt;Uf(dSn{0Ps8yP$l%Sd5uuo_s&amp;@SwfsbD)c;cY@&lt;((tdY=
i%V8`%<br>
&gt; z&gt;v&lt;H8@eq-UR-&lt;QyF&amp;u9n|A+|)C}~B&amp;!{RXSt1?&lt;Uy^$f_rHLc=
v;V@;Nh*dIN#~#q&amp;<br>
&gt; za1So1uyQ6T2DkfahpR2f3RE~1g3ca?cNW}`PkDuOZbE=3Da|4p;)Y7zOp{0j~iFF52G<b=
r>
&gt; z-Y)!3;dFTSe^&amp;B8lm4#*u}{&lt;g`}}`j=3D27(DBL8dm&lt;o{#I|B5F6bI|;;r1=
&gt;9D@&gt;g}U<br>
&gt; zQ;GdlQm+Z^r=3D$6J5~Y*k7-~I(zRyXz=3DOEnkl5K}-`-%4NO0qxc!=3D_@NmHf}3|Es=
Gj<br>
&gt; z57PO+8ygSS?&amp;&lt;%Rcov1i07d&gt;A4{x9T`@vr-5ZHW4zrBv9RtAMH@9dqm_)i&=
lt;(W0#fn<br>
&gt; zJ$pM#^LzYbA!~QPkZ;K@4ehb{oN2KpgM@7y?j&amp;L50(VdP^Hf-Az#p{HJC!IMww~1+=
<br>
&gt; zG8Yv)VPhy@T4oYBQX0=3D5hL=3DG(B+0e#sL=3DqlvZd^q&gt;z(a`!-Kt@?fu}zVe8~=
=3DnOdOS<br>
&gt; zkXBgEDEaI&amp;JcmQ`g7M!iDtNdbw59%8bdG-9uv^e8S1}OhajzF&amp;;a?O6gmQ@4E=
)i00<br>
&gt; zi`0*z)EN6bXM|*d&amp;w;1VTbmR|5)$TdWp7W|Z&amp;g*R%97iP0N@y}PTPN=3DWg$j=
vAukm*<br>
&gt; zD91vWqx(&lt;@rSq`ctMEE=3DObcJhWYTU&amp;xNn6B`%_&amp;V=3DF)BA#F|teY3B^=
a`-)0yPg-34<br>
&gt; zj`)i7hpoaOu2AsvZpXyoQEr-Qz6w@dcqgk4v&gt;L-&gt;K|RH8+Od{4sWHquJ{0U+7LM=
)j<br>
&gt; zDev!KEZP`_o&amp;UgC&gt;}dE)cE7?r^tIIPR1RM4@2CFplnf}CH&lt;T|sp_(%jN*rI=
&gt;)*)TU<br>
&gt; z*sWVS4uu6C@06(q&gt;v@LiQw`MbFx44D&gt;sw9tZ6&lt;vBl&lt;P@12#0f?{_0&amp=
;4J(c!kTWX|~<br>
&gt; z6-;*B(#tk2B~I?9qfpDqTVw30nGe!DbFdBQz}e)2B3*3ny~YHN75cGRYt(8F@Gs7_<br>
&gt; z-e}Ysjfw@R75Bmsz`}@)Gcij$*ruk`ql24)hT5#tKUzf;IEitnzOnxSjB#m6EYTlJ<br>
&gt; zk3}ceP5Sc$&amp;BE&gt;!ersH|Q63H2@SXO&gt;;1i6J0h-i&amp;)=3DN=3Dzd!4=3D=
t`nCvd5&lt;ANag~6{c<br>
&gt; z^Mzflvs_&lt;X??&gt;Vp93G?sQ-NBMU4*_)FfTpw36#{EPLCuxpY*snc4$aAgQdy=3DV=
76y4<br>
&gt; z8J~X&gt;jN{;&amp;Z#Et_oXsjqg}v4xzOOdWJ&gt;u2Lv+6f$^HLUrbZwwrB?-D*sy51=
MYnj9Y<br>
&gt; zG617JdE{c!9SkR9PNVT=3DZGH94&gt;I(dCW4-Vgr=3D&lt;Dn_)xU=3Do*&amp;q$l&a=
mp;IR-&lt;ovX;^48FZ<br>
&gt; z4B%yeJRae=3Dumw{v&gt;HZQ0h+k(nfabmE9M=3DHWzK7$cvKHlGNWcy-C}=3DeU2tGQH=
;4SdT<br>
&gt; zB`8|Xl*Kia6P=3Dwzug8jhzNX&lt;+@V~mb88x`u75bs;Se@eh7zqUiusuDjJRVkILw&g=
t;Ve<br>
&gt; z*FZ6y!3PgI8v=3D9-jAobyt!H9%n6$gy`A~XueKUp7smh-QqgOZA3XlJcnCs5g9}sm{<b=
r>
&gt; z^HJCB`%K)mPgus@r&lt;3z@V1P03B3!F;(UHJoJGfWU*vK&gt;$FcHwQD)G`qNVobYqOd=
FL<br>
&gt; z7CzcJjSwwYvCyy3IJ_vYTw{VW^?Q5QPGa_PDBJiLEN#q0O=3DsSIH_XKK;ttYsp~6rO<b=
r>
&gt; zvx&gt;tMPecRX5jA*ArS(kv5qdozp`8(@@EIlCD}&gt;X?Oal7C1y07PMkWk{0h67RicQ=
|e<br>
&gt; zJM&amp;24bb2pX{3UONqd4i3!Mb#x&lt;aoPS785T4Ia#^e_P}?zJGx0s&lt;-W|`7+t`=
&amp;?stLB<br>
&gt; zezUf@nLtmTzFB*)e%8h-e0&amp;Ma-}dAp8uY_AYikdDgni?`p0NM^y9Y)*E@QWz&lt;k=
9wT<br>
&gt; z?zj~cb3PNR4=3DDa2nqUDw5OdvpwNw3{BNY7*;TFobQ)VvcC@jYTAo$UZ6zGjQXp$x{<b=
r>
&gt; z9&lt;F9wOvlrQ0XI{iU`-B6%UTlj-tpe+ieQ0a2J+Wm=3DKzl;?KxoMaW_BAy{9j$^TFj=
w<br>
&gt; zo(WlP{5+rxHJxhCO`NrmcC^m9ZnG**I3+n$VDU0e#zCCuIDz^JyVscV=3DyEu@#)L+G<b=
r>
&gt; zxP^;JL&gt;cFSw=3DD=3DO{S-Y=3D&amp;jvUP1UW9bFer&lt;a*&amp;8{c35J9M3QW)=
hXU!-I-zlj8hOFkF<br>
&gt; zx#ADmf}D{&amp;=3Dz4;d2Qf{EC1rtjvw}b~7McjR1`Jkxm%$OW&lt;IEhO7o^O=3D5!c=
L+)i|CK<br>
&gt; zEHibyBrGS1n|LA}3NEGG-}aKAp!#EzcgoinyT9Jv%;5)P1qSjt!APmEHF45Y!Z?t2<br>
&gt; zx*d%5)59YgZFt2bQKryrA8-|MNPl+VC|Xi~89u0sN`96lSrY2B(3;UmHOq$HMxn5!<br>
&gt; zX2`W0*8NW#4$BWH(Z)W=3DWzpeob-Y*7;83b+k}GXHQCv6ID&lt;**XI3`FOx%Da&gt;4=
KTVG<br>
&gt; z%)&amp;d4RbG&amp;&lt;9$AWwN8)GI;u1w;=3Djaxg+l93jGDy4h66q8yH6jZ0MqM-^P=
&amp;y0gTyhoO<br>
&gt; zh@}t?u{P!m!ICP;Le$~p0#&amp;g$Hl8OWh{DlgoP^1Bx7S6R3Jz&gt;=3DMOq~azfN&a=
mp;hP*y1C<br>
&gt; zM1{9MR4LSjYEzp}iv&amp;Z`55pvp(WOvdNquDK+%kue&amp;Grk^iNKN&amp;ouN&gt;=
U9o{PLqJ*sd<br>
&gt; zpf^_h-rU~Fo&lt;zu(^)VW7LB=3D+p3@oE&gt;$$1tV1qny3r)v$~lf+APfVMdlkQOm$r=
Vqm@<br>
&gt; zog${F80)7_|1D`c2l2)z+)BoGYO=3DXQQ!6Xa4_*Q4S{_$&lt;u&gt;9bh8u^9G7&amp;=
AOGG^2x)<br>
&gt; z`pb0evs((aUDBjgNPrXVUdZ_|3|V3c`1jlUC3*G&amp;qXb-;t6&lt;`ihcA!z_M4weS2=
0&amp;W<br>
&gt; z9K0k+i=3DR&gt;uv`%(+f`G1U`sK^k4jQMsFAcErg5u$skv7+yie%W4`3DBPqWJD*n`zc=
%<br>
&gt; zkS(?grPySSn`1XsqPJ&lt;Gb4DxURhC#w5`?3R##W&amp;)Pa%?Yn*c7EV#-}s&lt;WEV=
_5Bn2N<br>
&gt; zmFi!%cQQ=3DDY4L658^$ca3wk1!;Q#FS1tn20sR#wBL)T1nc2s6RWKvvOmqSi#&gt;79`=
b<br>
&gt; z7ZN5i`?OSdTbmC_qGC$eDTGQY*Gy7R_mUVB&amp;?MvT7;R1L8&gt;)=3D`aWR;{X426z=
I%X^J<br>
&gt; zaqkc~uKyx14m7H}wkd$Gpk`j3FbMuh$OJL5x~&lt;Srebg!^#em&amp;s|NN6Y-NCrieZ=
TU1<br>
&gt; z`v0tNY-I9(uB@%z+y8xuXHggo(D^^-GypWVe{&lt;S`|Ah&lt;yITyt4-uEktO&gt;`~G=
ko^jF<br>
&gt; zc2p9W8Fpt_Xd&amp;M$9P@FZj1|_AqWGcI`IiVT7Nf9&gt;iLqLH&amp;z~JN&lt;uSr3=
3!n&lt;RL!RAW<br>
&gt; zxghCYoDU&lt;(Y)ev~UvA42-kj@95%a)JCr(ht(+S}oGC19=3DK74Ea*?&gt;P!SMZ%Jo=
Lm%#<br>
&gt; zCLssfS*%)qRsWu#urWy{{mA4~31vnuHqdiG=3D_J}UnSbGmqN&amp;8nBu=3DIt4LKi7M=
Kr|D<br>
&gt; zC`&gt;NJafFtG4yaC-l9fTnJMopgNe$znm&lt;;U@UG{9Whm(xdt9!b(zOnh&gt;?Khh+=
57*yp<br>
&gt; z2Ak_{Xuzq9Fin&amp;tg*@uf-{`$Bf_#c=3D_=3DV$(&lt;TRb;9A=3Dx2v&lt;_b#!@X=
?g{Q}?*LW&lt;kD<br>
&gt; zAax5UL|EWv1L$|B2WXC&gt;Y+z6?$_u};*tvO)@&amp;Vk~6h(3c2f{dCv0hWyAiU|uv}=
t5p<br>
&gt; zQfL}P2%`iqQSZT(;S%s+VF4SvW)&amp;I!ykXlC{P_$2XAlk^b1{y6$=3Dzb`qNMuajsZ=
YJ<br>
&gt; zzfs`K7kBt?iSV{?-D`{Lf5;fKpdxUT#Z5N?6q7Ik&lt;jL{&amp;5qF(@EtFpcT%MAPu6=
&gt;&lt;?<br>
&gt; zR{*?B?ic!%1W&lt;OniLX5Ul=3DmR$?tXVLxvsa4wvTtXLy6U+z5RXDA-g}raMZ?opWT5=
V<br>
&gt; z=3Dpih4?REix&lt;o5uI{sNPKE$ZS15gO(lFVyN!Ucgmaw2Y*B%06-(N2Zq@#BNb%w=3D=
Rn3<br>
&gt; zxFf|`h&amp;LRWX?5r5RV|lX&amp;POKTy44$AhDa&lt;u6a#+rH@|s@_o}srE6ZsDatj=
iY7O0E6<br>
&gt; z0vp6&gt;STpDjK6bny{kNQ&amp;DWphe9D)&amp;)Sz5K#FbRVA#fqI4$a`(%qdGX=3D-=
fJ~mfjTeY<br>
&gt; z0!aXr7|O`3XPvlaUjU#Q%U6GIR?quj+?P&amp;w^!xh%uWqFLe^wi-_x?X$&lt;RSiFVu=
0fR<br>
&gt; zS6%);hx_M@&lt;q!W-o&lt;AL(&amp;{&amp;N^rb}0GvWBDh-%)#vOem&amp;|S9W+NP=
ZEqL8ZD@7f%z%x<br>
&gt; zh2&gt;(Z+&amp;kTp1VojlWU|y`GDe&gt;Vbg7Ub!cdW}!|&gt;Rit9IIKrEUu;_zk@}&=
gt;P1L&gt;q5F{u<br>
&gt; z5)-z^laTWjDm9BYQx{6f-UEBhnU|#zO#WEZI5&lt;)?^Wn+ZYGJ{S7_9;anO5u;{E&amp=
;4j<br>
&gt; z;2T&lt;$Wf&lt;1763z{|B*!l2Tinrc6YgWEu-I5ts&lt;D%(*JG_sD*Y=3DfaX7mpJ8{=
Sa@=3Di#$<br>
&gt; z+$b%nT&amp;Q36q@X~xpV$3!mjCC2jkT4u|L6MZgM0e_B_5{#Ht~1eKOg$2f8*i9jeEL(=
<br>
&gt; zPxt?1bf0uN6Tp&amp;D@&lt;^(?U-d&gt;fxx1ri2uLTs?eLF(wQnv4lcd&amp;;`%fxr=
JFKiIWxFjE<br>
&gt; z6yILbfB)6)b(3KYkBC}4x_DC2F4PaxN6zMoI&amp;yZ%CzBm{V0DLSpJC2+Fh(E8Gkw%B=
<br>
&gt; z+DF&amp;zXvhnn9}iEIaNdV8?4`5bjgV!^6&amp;(h!B1fbjUmU?oPGHT{ndh8yxiV1&l=
t;#JIh`<br>
&gt; zpCcHhA}_xK5W&amp;&amp;3BDa#Px`j+Ujw$euw-3+)!B@Q(U`Cmzd;5DQKjy%&lt;W+K=
=3D*JZ|Q+<br>
&gt; zbn@d-GuS^oc+USotsHn%@Q0lj+sDE5A^;+%L=3DO!dUNpCNo5$D?7H&lt;VFGM?oM5)^s=
4<br>
&gt; z{Tg9q3mhH8*Jr`eVawy1Zbi8AcjI+y@Bh3L0^gqP;KUsU?2tQUZaK(#4iw&lt;In#TuF<=
br>
&gt; zaDVT&gt;-x6X#uzhlJy!Z6gNmGm8$&gt;+}^s2HWOAHIv05&gt;c&amp;26!)^4z~L~!0=
JXiy%8^{;<br>
&gt; zuK|Az=3D&amp;Kf8kmQ28E%mr)67dvf@8m}*xex-40Q1UN;*J?*j0D7vl$j}Qyqi(YKnq=
?v<br>
&gt; z9gatEZk`8YZQ6NinfcjYPw_m&gt;hC&gt;dScg8%ZigZbPQ}_$$*LZ}P0MIS{3eK+&gt;=
B`hO2<br>
&gt; zpH&lt;*c3J#zX&gt;Pe@;uGYgVMB^?qBDYGXCRz;~kR7PSKS=3DN_lxw0}7s%BP)C`j$d=
&gt;x;Q<br>
&gt; z^DFsd5M7bw6doMoXz(7RAIty9_Z$a58ORC%e}Km3SM5aphyLuJjmGg+8~%p&gt;_Roy(<=
br>
&gt; z{wtaLIM5KZ6(lE5Kd0yii8N0@L8&gt;-+8;FBw{Is&lt;TB_y&lt;NqUEh28j)S0`532*=
!U&gt;m6<br>
&gt; zJVr$b`r@1T_1J}82uJQng+$&lt;q*=3D_FZ!^G&amp;`Rj{LSau6vnE2Jad@5Z&amp;uC=
)wdG2f)e2<br>
&gt; zZFG`Q&lt;4g1a$Lge3V^o&gt;tOP=3D`AeOBS9VJZ&amp;qEJ8HWlLV)|bd-~z;8I6EM`=
Nx&amp;iu%A!<br>
&gt; z*yYfou_7qien@ejiLE;84&amp;Y;i?jGHqn&amp;sH8gkWJ3;q-UkZ+a&amp;Z*qXMUid=
hp#bfjpd<br>
&gt; z8|Qfs;Oy&gt;RyFyShxh3i=3DNwLa{P9!4xbw&amp;7zL#AZfXS=3DOCqc%&amp;{!i|7=
zw^T&lt;KECX8i<br>
&gt; z)5=3D1|Zq+G}-?+lZoW@%RxsB^jd5x&lt;A`HgF$kkk4&gt;^N0OIU^kkc=3DFPXf_H~K=
;4qQzg<br>
&gt; z{13Tf|6#_^f6yaeAR9;2&lt;Lw&lt;hI|PPhx7li*ERZr_e&lt;yg^Y_+zZH(P3(?~s~R=
+D-wr<br>
&gt; zgS~h~?ETKo#TD!^Hlj*~Q5&amp;zDD#9`)&gt;jH8wce#YssIfNp$|Us)1qBW7IA+y-QU=
#Aj<br>
&gt; zs9?Yy7+p)1t&gt;j*fIj=3Dletf0$yl1FfxxRJH2h|DS&amp;%IfTH&amp;&lt;I225v5=
)x-98*};UJ19<br>
&gt; zN$;j&amp;I&gt;d}S?{peI&amp;Br-XmmomOg@2biJ-G2=3DpUUcfG-7k;tH^*#k6j*(b=
ZeV2Y$#*k<br>
&gt; zWJV8N342K#sOyqDwwi;Gioc;b$&gt;L(JT&gt;xPRYPQ;h9Ltz&lt;F1U)LwN)6q?Y2O)=
%l&gt;9O<br>
&gt; z9?~8SZYhP{KO8pKR(JRJw~E$x2klh}b7CE4(U;H-FaOA_yvM{&gt;eoR(^fR2hwq=3DEx=
&gt;<br>
&gt; z2WV@++e7B4aWDx{0Go@hqxOX271?}bdIt07&amp;z?N{wVF3MYcyyxC)o*cC{K}IWtLZ8=
<br>
&gt; zRhcc;$#_V7pn@ccAIMq)jrcjy3L$=3D?vnNPq6YihT^4`Jjag$&gt;1ppC^yh85ui4eX{=
c<br>
&gt; zMj6n+Bt?~0AHeUC3BMr^g=3D()|fH_wFnP`Sj`7;)D0zryYkA@}jxJHYPRsutyVYpPt<b=
r>
&gt; zgN{|UAap*^!W3O|NRlcBR~^Jv6!tJn0xOK3D+HBXwJPE=3DzCv=3DtVT-D$?T4KeOJRlt=
<br>
&gt; zsaQDPc+0h3$dd(S@xqZ%kNWc7PP?8)j)br`1}+G*ilCf~*C7+sNp&amp;2zHw=3Ds1HWJ=
+*<br>
&gt; z5~%@?C0#G*^^jp!oIqR1VRFo;M92aG_oGx6-(HT#!$&lt;XcCvF4xje?JUJsQ*--#px`<=
br>
&gt; z%fj$}-0wY^g5J^}j679#wh9GdUv-3jPb=3D(aVz`Le(#H`waS#(pa(muwh7l!+9!2m1<b=
r>
&gt; zzD%az+I|r{Jv=3D!%d|5iR(yL-*vH(j3W08H}qRHR9HRLOA4gNNzT3|b9q^jB9yddy&lt=
;<br>
&gt; zUSIK&gt;w-Wx7R|)^|R$|uHUx~kYtBru}0jYc+&lt;xQ(8Fmr-U*;!C-HR(3kJWz8jL|*=
@V<br>
&gt; zV5ct5Z2-+!u=3D(dKwTKrzNdvkAOoJs&lt;da1y9oh@!=3D19u^{rE0pLa;nll{;K*@PE=
|Q#<br>
&gt; zS=3Dp&amp;-eaflaffI2Q-^kidW&amp;2aM_UOut%O%+M0CG!B2dF1PKR$p{J2vXjf6`q=
`!SR)v<br>
&gt; z1v1?^Kgg+_yBf{YIbW$+AZK*WDwPXKBF&amp;7&gt;`AW?KIiqt^u~n8)NSW$g3X-?fOq=
i+e<br>
&gt; z&lt;-pA8UY5&gt;H+ZMA*&amp;)2||ZIV-ZCS32*=3Dfa%}1w2*e?)Wr&gt;@X_&amp;n=
testY-X?OfIJfjn<br>
&gt; z$g{9|j?#0tk%#5^rL&amp;;pK|9Kw2mLXp9-3G7qU&lt;O=3DA9En&amp;Epqnbf}Q!uQ=
bbZX8@w3s<br>
&gt; zjU-PCsWhmac30|eYi;=3Dovt3q)y~zkoz16$xVK43wbFRxl_d8NKt6oV^N4nlcKi0o5<b=
r>
&gt; z!{oB6g!;~3s(P=3DnGC1#b6Vn&amp;WZ#S5b4a8*)t+%D#l&lt;r+xjz2j+FRKc1*uguz=
ZWUkj<br>
&gt; zlZ$p}0VRnb$=3Da=3DVrW-u=3DDvTNWY5n1TuiePBQ2J_k!GLQSKNDA*=3DvA)nOi_3#T=
_dXA<br>
&gt; z=3DFktePIgg|nAHx#Z`7Uy+xsZB%xQ^AynMOs)!$lfGr7H&gt;uD&amp;uF$UG&gt;l!#=
q0P%K-&amp;_<br>
&gt; z{LXf*$;5We^_AvOljm{Ft_WdS{3=3D4R1&lt;W+527u9p)r4&amp;zN?}DbR?3f6B$W^Y=
uQXP~<br>
&gt; zKgEi8BpQ#!2gfJfn62BoH4?|7hW%vkAZWfmYVPD^9M!pzX^WEBWyF&gt;z6g4Nwbg+g_<=
br>
&gt; z?vAogYtF*a#V&gt;%JFh11Sp#qJpZ}7)t06VCI3bdP~J`6`;KSzg#8jh&lt;DZrbRg%m1=
D5<br>
&gt; zf90R}S3l|x+rt~tpA7opQ0dUd^bWQ!N(S2fA^z-4=3Ds)9l(i7u^V{OBYLMq&gt;|!$CW=
q<br>
&gt; zz=3DALgdcg#sdw#=3Dz4$zJy2+mn&amp;hxdCcKDvsgxT?%&amp;66_;`N5T~JP$`5WzP=
(;=3D(vK6Z<br>
&gt; zj&gt;PaKN@g&lt;_14$)OUi2R8j%{J7Exb3q_l3JnO{LwDlsN2OwdShU&amp;ZGETPenz=
X!|Ww&lt;<br>
&gt; ztJ+jR2Q|55$tg*48wG*Ji&lt;^R2+23z!PUw!aZh|RrT&lt;M!CinuF_DDi(=3DXoa;K0=
))cK<br>
&gt; z=3Dy&gt;Q&lt;r@C5uKnL&lt;y@}Lig-P#b7zS^a*zk~oXzq~rZ@l+kd|InT4&gt;JqJ2=
CvD8asXAA#<br>
&gt; ziKmk&gt;%i(A-WM~%|)+LE&gt;-;eDKnE+T@K^W-OKAh?#G#^e&gt;_eu3XK~unioJ%7;=
uZe^B<br>
&gt; zO2+#iM)8nL?M4wakia0QmzLT&gt;w@mSaLUA^V-=3DPx~3P}q}{E0E&lt;fxBUoFSU%+K=
8A;v<br>
&gt; zkg!2aDU9ZQFoohojWisHXf%pP6}cA@@pP|scz{z;cvLVt`9Z9PXC-qU!x0hpIu45B<br>
&gt; zVbWsL3xb5SoR-Rww37&gt;-E@OM#0r_|zjoJamzL%+sotQ*qJBikh(4{Mm&gt;Q6(L3J5=
K4<br>
&gt; zcLR?o^#tsG)fwAg=3Di6^9Po8Lxoe&lt;T}@r4TSvh}m+Dd2!kgY@L&lt;h6?vEz;F*g)=
t1pv<br>
&gt; z?&lt;vBsEsHlLcKCc#!~fRcN4d6KtiNg0hcYGvE4@&gt;#8RgN^QaRI=3D!uy)|XYHT=
=3DtcbI)<br>
&gt; z1JjnCEv-&amp;kt(`uQE~uw#@T0a|p6;QPX(`&gt;YiiqE(TO7o;{%Q^oQ+uu5I@1xVQe=
d)S<br>
&gt; zvWhmu%weNfZ|l*53h$uIen}&lt;yd_Q&lt;~@T%3^C1JT^9TgnCI&amp;NAKj1mqqOm&g=
t;?T^a8VF<br>
&gt; z^kKpK&gt;uiT|9`&lt;^ebXS}9NZVQ1M0k{Pz^Ug{wU$nkWf^60v&gt;S?&gt;F;IasPT=
%evzI=3DIj<br>
&gt; zAUUJ$7i814eX{qG&gt;O+ZeEX{+FNv&lt;!ea97l^emHuEG&gt;(*3Y~BmSL)bwb)~o86=
ATn!i<br>
&gt; zpA4dT;|paCToY_1d&gt;QqIl+*&amp;w$w@oXfs-m2difGt)WMja@9c=3D`50e2_uM$6n=
+AZx(<br>
&gt; zNioyS5-cp@#8J*InOtj4&lt;xS)_R*FS@VP#l+P=3D?A%L2NB*VCDr1mH-rYCJ4${gUE}=
o<br>
&gt; zB7U=3DTbuCapR1_-XIRv0ISc=3D{ib~?-pT(sM;{~m5;hv=3DeJdZ;k2IY;_%Gd&lt;K4=
!e)oe<br>
&gt; zUCtYDsyYl5*w*n4_1~R@x8?F5)!EPUAoD`5`PZM%3uIROj|b}+|G!Omb?^W21s?YQ<br>
&gt; z&amp;=3D{ao0M8i$Wc}U^&lt;lYVBPv{0&gt;$vc&amp;O4_kR8&gt;LL}Jz$7&amp;*a=
%Lhd19Xb|&gt;XX(&lt;`*f24<br>
&gt; z%~;QDAMN3m9L2~r5K=3DkuPt;W+oeF2?*%2A&gt;;!P*PZMr=3DiesBA(Tc)G)l+8(FV&=
lt;)Dm<br>
&gt; z{?Myb&amp;yia}6Bqh(Cmuy+)5&lt;zIX_KZ!B0RM&amp;=3DPt~;(|NqJyAc^qa|c(V9=
7uwaAUW|N<br>
&gt; z=3D9(HeOvHRuOukV$ZT7qtT*In)0M3lF3pJ0M&amp;zi^0gPmq;=3DkVyq?W3dbxA$K){=
jqnI<br>
&gt; zxX=3Dl}tFcYnp6B;RZXkDsghmM~T&lt;&gt;jgd@Ucx_elhXeb||dphM(t;7pyT#D4=3D=
$bGN&lt;d<br>
&gt; zoEcFmm8EOO1Wd!+Y~efOYzEXE*vhueh^RZSjsa^=3DJ`zu}eV89Z(`0+=3DZo3mND0iBj=
<br>
&gt; zO#6koa4}`NorW?q@(66he)t)Ae|%=3D}|ErDlwY2~DgN^(6e_!Mw{+}`6*5Uuqd3A$R<b=
r>
&gt; z!T-er|8aPTWUQ@`Etj=3DR&gt;G-z96CI3~$Oo=3DMOgqPeM`x=3D(DxEoUI_kYe2t4qx=
7q%&amp;2<br>
&gt; zxe+tN8@5Vyxk}e5Gphie+rM*~o;RE9RF24;!tKDk(~8WTSk%)GOE*#+dG0;Qi5_&lt;@<=
br>
&gt; zy?JDJgCF)zUMK~zTLn5tRZM(p&amp;QG8xB(JVfgFeXyhEAW^Y6&gt;W9T(#kb!jhWczh=
8R~<br>
&gt; zaWjA3W83&lt;S2et1wHbrKqWzhICPiBS`{^HSUrW7}pJxTgt{Vx)Q{Usl@X2Ip}CjV&lt=
;Z<br>
&gt; zc(9(4|7|qx&amp;;Kv+ED8q$6c5l?@rQk(V80~qlkva)dME!;IO&amp;Pz#YHq4!|O$*L=
Yj7v<br>
&gt; zAT712BgU#s#z_UU-%1OTb`L|%Qcu4{vl&gt;;jA`{4y!3E5KBEl{MkaN0gKEQW!%NFSD<=
br>
&gt; z?%~OCiDrMJz~IBDJi@IZ&lt;s7T|=3DcyjF=3D)##+(tnomaMcHDH+`V`2bDfob4q!RSA=
WU;<br>
&gt; zQ`U+vISn~-PhTI#%*GcrvK+KYNAOo|REMMP=3DQ;sq-T&amp;4y`k%GN&gt;b?Hwi#&am=
p;$@OAJsa<br>
&gt; zz=3DL^if$Bt9{Y#$+*&amp;y&amp;%_`o%^rO&gt;Cu(eWONXO0hB!PDcz@0tfW8(nT+)=
+pdyK*ePM<br>
&gt; zBV86@goAh&gt;t(!T&gt;ZK4bhx{1s&lt;%3(n;wDfvy4W+6XMTD`CH7A8@1!|oW4l!gK=
#&lt;_^0<br>
&gt; zH)6ds8CRyI(1q)R1MQGGilil%A&amp;WW$Ft-G_8l;QpGh&lt;5nqg$r4w{Lx%&gt;Iiz=
;SzBG;<br>
&gt; zbU8y9FTe1m3-acu&amp;yP%&lt;9#|&amp;WbbiSj=3D^ssPdQ#-&amp;)|`^M&amp;pN=
#_NPC+j%fVzcD&lt;M57<br>
&gt; zqO)9X6~QOdiW{^d``Ht@BHPnHZsg@Z#?x!}qa+D0qR%J-o^}3jWaB@tuioGPzR0sE<br>
&gt; zYz(;V;lE)H|MiqK*lQHBpbb?2T)e=3D&amp;VaQ*_FyyZBK}l4=3D8gRt}S+SF_%LW%vv=
f5J$<br>
&gt; z;WXQ3)tYj@cS&lt;SN0r&lt;pJb&lt;Gfcgf6?6r@EFGbGt&gt;4#5&gt;g~uh=3D_XCQ=
tUADmPOAo|&gt;gR<br>
&gt; z8TiN=3DB=3D2s;&amp;sYHdOC{cDpxx{IuKM2xtp9zmzP7gVU}JL)^}m~|oA&gt;Acmv|=
P1#sIDV<br>
&gt; z^`G^dc)+ijqz`|UD}HMNccsag_B$LrGIkQom(`A?s!c&gt;v50&gt;{&amp;f}`z|7j&g=
t;eoPl&lt;%q<br>
&gt; z=3D?qKiy&gt;U&lt;v+r6N!y{QOJJMQ&amp;3m5fSBE}O9&gt;4f1VuwYFXpt!T_weHE~=
cY6fud1U&gt;Rt<br>
&gt; zxMAO@LF@!#Ha!aVchPVjkCF5lB3&amp;~uMLK$j758^BgczNpJ#?Tu#Sw5)(F@rkf&gt;=
{)M<br>
&gt; zOC2!^&gt;3l&lt;9H{%V29)GO!4u``KO&lt;;OA?B&gt;NlrJGvVCim;=3D``Q9YFn)%n=
;V*V3`nKMQ<br>
&gt; z-q#0{Uhil00zz*h^xs)tqA7d&amp;Y&lt;G!L7G?V;{iGg0UdSszf#Tphy4U~(w`Ovym@=
Tdy<br>
&gt; zWae3w{oVZemvf&amp;Rzj~g$fbf3%_&amp;LdxfkPNfs&lt;ak-gtvkh&amp;HbaGb#hE=
zUeziNtm+h^<br>
&gt; zf&gt;s*69m{nX9Ta(a#3`J4;iN~3XXB&lt;U1q=3Duk4qp@}3}Q5avggm7=3D%@B;JjAL=
0i{fa6<br>
&gt; z?u3!REfchwN888SCx^#1_=3D4UfNO_4t&gt;Rp95i6Ej&gt;TQJg%U)^f|NTTtF0%mc8A=
NufL<br>
&gt; zv_i(Y&lt;%vfe-B9G=3Dm~AiWXWc&lt;PLFZ=3D?QfcO)7dVR`c{WOP#ggc&lt;sCeObP=
^%Zm?-Gu!<br>
&gt; zCb{Eh1jCLhxd^C_PLZr#kFl!^fSh81QCAE(juGu4-9D3_Rtev2EnycP&lt;3CG}xuLBh<=
br>
&gt; z{`*)!SE_CCs4Sl7ZNuA$-J`$$TKsCmcytFC@__|U^&gt;69%k}B|F0sWMvhuRkG9kX)J<=
br>
&gt; zcXrYeD8(d0A@mZeQV51BR;{AvGt`&amp;ILI~{s_)?mRW|OExxrq#%P{hr&amp;pu7n&a=
mp;#2mX2<br>
&gt; zE?1YU96yl-P&gt;a+e+-?~Bcob5$Nc2C2g}aE9rit%UlVO58od8gEHNu}uMfB&amp;&am=
p;cD#%;<br>
&gt; zw;_{Zcf``0mBz-&gt;&amp;m6Z-c41B!KRdzh94|@b9l0pBnUaQQN!-JO5vNN=3DTRc5|=
^QQim<br>
&gt; zd&gt;{Y$Nd2J%h@&amp;XLARe&amp;Om+GgdKfx#dce(zi_NG=3D&gt;&gt;k11M4&amp=
;nivs2Jjm?@Q1EMc2b)<br>
&gt; zvLnmsA#s9m)z1PuhAt&amp;vy@BVe`d1gy=3DTk@*`&amp;4o0&gt;IF~&lt;c%%DQ5Kn=
}Qm5&lt;@Brt#8k<br>
&gt; zSOMZ@3&amp;~do4m4g+ZFk~9B!3z=3D-2L4G?w0*s&lt;FKhRW79em3JQVt$V&gt;};EE=
9_Fh!=3Dkh<br>
&gt; z65heRj)$IcaNOCcIZG}l%*F-&lt;k77?^MBVq1gerp{C?av*9YJ4vBx%5n$dGLSYCx60<=
br>
&gt; zVmleU8^l)w(*)s8)H8e0DxKbw-VG*Mf%1Zs(0U7@l0p{*GN9Rv@3;3$nuh?ikw&gt;B9<=
br>
&gt; z{S4EtyMRT&gt;47q!rz$)xLYr!}8m+6!tJa`4e5TtEfTbvF_$0S~0jY81|#tUg0&lt;(j=
nK<br>
&gt; z{Bw&amp;ZQ}^s#7phyx`CI;1{BLv}Mb~3DZ&gt;l@`tt?ct(b$I@Pl?EKnxzn{nklP^T;=
8jq<br>
&gt; zA^F%ZI+l=3Dcg&lt;UJp`ZOn|sy`iJ40$US{gt$BgnD(e)_jubxbmt#^K*rwJMcmtcgL0=
T<br>
&gt; zcsy&amp;5rf~P~#Dl&gt;4ondcvQOgf|R(0f?^XqFTY&lt;6s5g5g6fxiK&gt;9jALFD`=
w{a7#ND8@<br>
&gt; zYJ~DQb&gt;#CUK%H^tUD!SnN1VCSXK8hi+AwJkaoAt!t*X9}$v+GxL-1s|=3DJE02F&am=
p;2|3<br>
&gt; zK}&gt;BALrGAefq{5Kn+$+t?-u`M(vZL2L$`mp&lt;$X&gt;G&amp;{X+PV`XLClK*V3t=
W*BajeGl#<br>
&gt; zFY-wF4`YDN0XMG;K;y3@2%2r{v981dk`SU;opKeGh%G+F7&amp;1fP2BSf{iz&lt;7`$H=
{2?<br>
&gt; zun&lt;%XLu@NWkckQ3jz`d+VLa%_n&lt;_@k&gt;$c$#MzK=3D2FaNL`;F%|Z1SJ`lYH~=
iZp?}3+<br>
&gt; z54K-6KhQ^tldWEu3;?Px;pBpaTO=3DVkI-*hOa&amp;tDMl8$M~2%E8RAcgL^ngCuk43M=
D?<br>
&gt; znBuP)ARp&gt;&lt;7DAN{GQUyZBV*Ci?~jPbM-_68O$pQ&amp;&amp;&lt;;x-%kxc$;U=
u}FXd?&amp;E(YKY;<br>
&gt; z{(1oS#6i;Qj^U7Pz?)kAA5|2P1@K5Mg{cGs@Ky@X+EC!)vit9Mz5XB`{s)FMd4F|%<br>
&gt; z^9zG&gt;tw{XO&gt;Gsnd82|GZd;jy@{&gt;y{IqyIf_oxJ+~hu1&amp;;pVgPNpzkui!=
eu}LpaqYo<br>
&gt; zZ?RJ-&lt;3nD9Uf^&amp;~-{S8?MqUvaBoCe*?*7OF5~s!0xB5!!0mA;4@Cs(6kXLT3N}=
kLt<br>
&gt; z+a3&lt;jd*KD$4Gwmumqo6$du{gsUNQn;73#PCw55`*q(^{7t&amp;aK2ja5nADQ`K|`-=
0uF<br>
&gt; z?v%F*52CQ3mtp(psClq^a`^o=3D@M&gt;y@(n&gt;(v1hDLw%3%6B&amp;)bun_wwzjy;=
F$Np_mJ$<br>
&gt; zSFBJ|ok#H&amp;-2!Cq&lt;X4F)q#YkcGTD@b#L2*9Kv5vS@{UV+9q5J5v@#sRr-Xy{Xn=
IEp<br>
&gt; zN!(6IsqZizn%!5nU*H}tFQkaJ+f}06F5RxE%q@7w2cEf25zbEOL&gt;gRFr8UJ{J~Hzt<=
br>
&gt; z{B5W^0rFCK=3Ds&lt;iS^IzcRCATw~Nv7i@m`R*tB|Ph*LSLqOKw&amp;TSiKu`JLk+M-=
qS(|J<br>
&gt; z37(V-lTqT*AYLL!{qROfN-^wDmu(2dWf#v7CAL78ijR)Hb0+qbY9q;&gt;BWhjc89=3D#=
B<br>
&gt; z)FhhMd{Rw4%w`;96+KIfO2wOMnw*hq;t=3DQjs*9Eh-X0T-bg%ISg}s|{^5V+larg&amp=
;4<br>
&gt; zQQf_9f2_*BND9_6QaMekE%Qf1+AH?SK_&amp;G0AVI-RJ02k|=3D-t#7&lt;~eE=3DIqr=
0XIROzJ<br>
&gt; zG&gt;*%3F2FluRvRKSC_0RLz4(g6+!XR89jsD{n@CE5o~$ze6{jn*hKSZoG8qg8AEZ1g<=
br>
&gt; z64d){C|L0X&gt;~~dHtMU&lt;s(HY4sDN*?cyQJ`dBacKWs{e2bs-L$!^&gt;R#P@);e?=
;ix`j<br>
&gt; zVn#@sWjF|&lt;79yEiRfmhIAo)WYA#**UEErBW1Xa&lt;X)MP_}#I7tO%*imIqPnj?u&a=
mp;!tn<br>
&gt; z&gt;0pyxlZlCf&amp;e%}Sq5;hGm&lt;4wfvXpZA7-$#~8+9d&amp;Aw2&amp;w1D2t4?=
l=3DI&lt;V5~=3DC&amp;}B@d<br>
&gt; zA4BKKd|?`tI=3D-pve2AeE4X`Js11yy~jf$yT7)Ns8XgUgB%Pvo`W4*&amp;n(#7Op!}D=
=3D8<br>
&gt; z(!kW1IS-MwuvV_J&lt;pNA&lt;0n-s#0YmJPcBn^wOi76*j6=3Dc`&amp;(ULom9fA&am=
p;JuR-iMeIB+<br>
&gt; zuG_X$X#{qRs4^dyC}&lt;*3j|~Kc|3gc21iAr0mn7dVyKZj*%^jx`5o*{uSqRe{na2`K<=
br>
&gt; z@|P9SsN{MeLo;uI=3DIIP{vZoo%L++i%DQ`rhs(19=3D&amp;5~$(K8SO6ey7_(wN5Vz$=
&gt;&lt;^!<br>
&gt; z(!|})Psncm7&amp;%G&lt;v8Z&amp;^#SOp+Xpy@#1uUp_kv-x+Ptq^4_lE_4hR5lg{zu=
#k=3D4H5z<br>
&gt; zMxI0Sa=3Dtaq;G#jNjD@MAZpkBJgaUA7gDJU|=3Dz3hS-XxdVcaj|nkiAX4$E6DJW0LuL=
<br>
&gt; z8IC&amp;00!!8?z^mHKLNY*dJn|OeED7FEFdvg7*!M7B%r2RjVJB!OpmI=3DS(91@xv7%=
V|<br>
&gt; z9&amp;+BWf#6&amp;^?_Shs!jPOw4jz$&gt;$N;U2;mv~WSFeL-d;1hI%JaH(Y6CPf1+M=
{1nw26h<br>
&gt; zlz0i$$yWsG|KZ&gt;LT|)0XPLl0p%6WkHcL9W@!O4P28_jsZpjm*Y&gt;fyn&amp;z2`J=
~%&amp;s6a<br>
&gt; zWdjJiD(us6a*b=3D6!)c^4g&lt;=3DeIT8?&lt;sz32`sYbu^p#eMATAkVW?Kwa^cG?tK=
aMOq{#<br>
&gt; z3PS6YY&lt;+J^sm0bB#b4!kS}&amp;UW`&amp;DV&gt;@`1^?975e*--1lZhnjYLPsS+8=
B&gt;}66T0Q*^<br>
&gt; zHgEOZ^WGlbmeiOL=3D3MoRPV1^ySg&lt;#&lt;`NDszuWDnP@9K?JUvF~&lt;ihgUAOl^=
FpeCnI3<br>
&gt; zl}ivz&lt;=3Di59Ff_f$hoOsPU@$rH)Z`DD@{-1QD#$N|g}gMI`ZB;QJJXd*xB-x&lt;3=
^Jv?<br>
&gt; zp1iT3QCjn0`zcZliP?k=3Drvk16@~%*20D4EpbdgZq!L5Qp+4a^T8x{%XQANnCvy4}m<b=
r>
&gt; z`#LSld3JpG@@RYKyY1&amp;qDaesN0%a+&gt;kp9ucY%1vtCcjJ!1BuFqfvU%15Z)sbnF=
B{^<br>
&gt; z8G1do&amp;ENr0IC^PrCjrX~kL0&gt;p7f*F%G1-J$3=3DIn3liz|RED8slq0=3DzA&gt=
;XL7DQ|F22<br>
&gt; zm}itGIBvHmBgN+fl=3DQt4^(0BR--TKPjy&amp;|BJsMj$_DZunCzUnr^1S-v+|^Z7XEr=
~&lt;<br>
&gt; z8I*GtNCs4iuCrW&gt;8UqdudaTOXuU{Rd28S;{&amp;EW1bJQP272YP_qLvGES{`mz34h=
6~#<br>
&gt; zrW7ilR?yG2d&lt;tJBi&gt;+o(PDuJyR^*zJYy95IGFQe{aV2z8T9c73a(xtsS6Ci+CrO=
=3D=3D<br>
&gt; z(y`F@&lt;8@y&amp;rL!e&lt;FM+SwLvH?$C0WbvIu~z!`#0x3UIGz8|B##3=3D??{NoO=
h%-JJ%Vl<br>
&gt; zbX&lt;$^+`@~(YHhQjT&gt;mhM(HP}=3D@)%M=3Dp_&lt;dHU_00e^z@hDUujzw;AI2O(=
2}MU@I%sm<br>
&gt; z%)ZdtJ3M$&gt;uAE|%_}^;7JJ&amp;UMi*r%IKTW5f-YE4#h0LmHLrAp-8u;O6Eb&gt;0=
U{sLnX<br>
&gt; z7;S?THb_LLkSovj4&amp;WNVyQsumHYTI9R1|@MzV)VHwe_apEzXT&amp;QU3Kt3rTFVd=
^vxo<br>
&gt; z@@&amp;WLNL&amp;z|`)}W&gt;&amp;+7Z&gt;7Th-83fs){twM}boCEk=3DSK1w%1N&l=
t;A&gt;Ul5j{H4B#Tkwp=3D?<br>
&gt; zkW-V(gL*6Jhb8%WZQJ}8UJqi|xG}X7Qh1_eEBSz2Ff&amp;(=3DpIfe&gt;zmj()`O(1@=
tO1Ce<br>
&gt; z2DLMUTA+fjf^5tbPEmAI$(FU*C05B)G5xmS8s&gt;lfwfMU&lt;5bTKj#!_&gt;BtDdf!=
u9A?+<br>
&gt; z`oYeSj&amp;8&amp;p(&gt;Ht+BmJ&gt;XVcOuC)~&amp;4b&gt;fT!uugH!XjWj#3iO2=
-H3TWLXp8!WFmXeVf<br>
&gt; zUHn3xxXh!yBM%hZA04zEie;XdTsDDj0B2F8@@FBLoQyF&amp;Oe;nyIYkAHQBaQZ?J&gt=
;DW<br>
&gt; zc{JGYhHf`F+4x6q?EJ}h)3Aq=3Da1+oqEb5pKnC&amp;hYAvdwLRBVXiDjM&amp;zdA+e=
3O&amp;2X_<br>
&gt; zYia(1x_1f0Q`jnKwZ_Yj2H?ok;F_jkS*H4)?(6DS-BdBh*57Or3TeXq^q_UBB_)mK<br>
&gt; z$F=3Dv&gt;$ZWX;IOgdoVCmNUOH=3DR&lt;hR0}j67QJEva*&amp;HD7EOA{aP?HSvcx-=
;WD0P`W!&amp;&lt;<br>
&gt; zDAx*u@9O+a&amp;~csIOq8nz^+{#$ip0{*Z_`&lt;#-=3D?!VziAH-Nqi}85fI!rMZMQ_=
C*EW!<br>
&gt; zAYm)j$*!zH04|WxL*z7^*Csw@sU^(cesk=3DCe${_`uzo-Khxi~XOl|n&amp;)=3Di(dj=
h{Hp<br>
&gt; zpUmihb8;!n*fto%cl&lt;a9Q;=3DG9lq{%|fg{5}ST;H;OdZ7lBAWMals|Mv@lfm9)bq&=
amp;t<br>
&gt; zOYgc&amp;k8=3D(Yyme|K&lt;2^WR0kaKE*^j851&lt;Y|W9!=3DV~yAUsMF6+Eb_|xt)=
UC_umB=3DfQt<br>
&gt; zX5S@o_MKCVa6{ezkpW2yG2axh)FQ^+MSrW_%_Ch}jo-5uXusGJ)9khZ7V~mMvecSe<br>
&gt; z(k|jQEGyKKcp7%eQvQ{-;x@Q^V(zYG4kWX@g$yR1NMRU9A|ZPPMwb{6?=3D0%YSC2Av<b=
r>
&gt; zp0W27UN6XZC?&amp;6Vk@Z%Sn{pc&gt;?;g2uMV=3DvlEgQqAS|O(ZV3r?js(faB?7nGy=
ON+Z&lt;<br>
&gt; zIhIm@i+JsuoWo^eDW~TG6HRXYTxxfC#N&lt;ix##2m&lt;V&lt;gUTl?v%0)RysxSAKx!=
#Fh-A<br>
&gt; zDWLR0RY)p7rJ$jcVXaarOs|fSaH?amR9nLJt&amp;T+XU8B-~e^)E3@b6k&gt;4gOuPti=
!(&gt;<br>
&gt; zm5rHQY5Yf^zov0(@|1TEw}_`}D$3NTSnll4fjg#99{z9}o{G*c=3DEsX$hNc;$vM5^$<b=
r>
&gt; z)82TSQkYS6DmZ+fcP90`oll#kIp--mQ|EaFUH;Jlk)1V%ubfgc^&amp;&lt;7BBzXgedO=
3D9<br>
&gt; ze(D9cZasScz1uCH!Nr&lt;d$&amp;aUD;noz;x0((A=3D&gt;C3};q}7lqv~aP4K;4jS?=
_5$-&gt;Tp$<br>
&gt; zU(&gt;#je2uUT&lt;UQLXUxY$?^cwf&amp;^_zkga;S%Gp^Dd*36y!N`^)L__~2^G&gt;=
%(iTX)X^*<br>
&gt; z{ioN}{d#@LM+I+v47(FI=3DV6?xbju@I&amp;HkN;#`NQvpBzGJ_xV#F)%@J*z*gh?WXC=
o?<br>
&gt; zA9;9dAfN0Ax4SjZLC()-IL`T*6YosXTOaMRvhS$EX9{+Hg2P_*{B}n^Kes;kRbz9{<br>
&gt; z=3Dq;E4e)3rX2`+DzbJ&amp;8ZwY;zWEXOU`1%7VJG`O|y#5%|^+=3DkZPhK;!Gyxp3ym=
^B6Y<br>
&gt; z?1ep~d6&lt;mb4(0LV)JtuH{87X8A$*!wbrE|G4k))p9Yxj_1-Ynu8);c}-?S&gt;Ky_7=
80<br>
&gt; z+rK29Iw2f_b%2?=3DR3wKKHzR(Cth8Uo;;B1MJh0e~E5-&lt;_1La6?9knMEi(x52J1JB=
P<br>
&gt; zRM1B{N)mvwlt|aQG$`2bgATMN&gt;XT%IO2hP)H@t&gt;zUL`|&amp;dCp4}`y@*qsD&l=
t;eYs=3DI(#<br>
&gt; z%|k*Q-hrM=3Docpda9M00UIVHJzx#y9nU&lt;Y0$WLc#RPNcP$y~ewH$7UVb?GZZbg?82=
*<br>
&gt; zc&amp;Rc4;*H1AVBAHq964toSTuV#Dk6V9l#yA5*mMm&amp;Hio2!BO_}g_f#&gt;=3D;=
8PYHYPq_O<br>
&gt; zn2#TGN3j~pImWHMb&lt;K-zA;A&lt;XDcg2+IOfSaf&lt;08xd*nL09&amp;RhYH?~@?V=
2@c?W0`%~<br>
&gt; zH|t~L@PO7st_C{Ba$Z4gCZAmv_qvd_2F;bSnl7+zRazC0^gD?~XF}N~dXlawu!)1u<br>
&gt; zIRG`5=3DVJ6n@5o#hHFHbMH_p}Eda9r@izOmB1t&amp;i(0Z&lt;V0r|c6&lt;nrbA6no=
OZ3swU#=3D<br>
&gt; zENU_bEx{*`p5S9&gt;$}Eb4&amp;t0jC)r&amp;mJg3mMtKZi}vW$bT7Y4EXW&amp;3u$=
5w_CZlI$YS}<br>
&gt; z2yg*Vw_r0!g?vPKY7&amp;~VuOO+fml9jWhE9?k5})iNGnzRUqI49WrlR`@JTmgLDbh3b=
<br>
&gt; z+*OLEo-9H-v-)3-lJk)vXT&lt;X(Y3_lh$@1T4&amp;}DgL*n18Az-X-^LF0Yp({L35cO=
FkT<br>
&gt; zWayOo1@A=3Dxk&lt;|S%gW57MW$&lt;(N*__eL6oC!4{{!WyKxYN%#AMB@yiNq~L)M`0?=
*_-O<br>
&gt; z4k)7aj1g5VUuJYbkY)hrmJ2(Mf}Dt9m?V5I`1u6|PlX{S^8xh25R+leW$&gt;k+LwJ5p<=
br>
&gt; z$u-dPcM8Dw5nP~RSZ3y+a*nh=3DC9ZgHwd$EydN4~l&lt;-xej#W|cINbud9XGo}SwOcX=
*<br>
&gt; zl-!Hl4{D_;-6Fc%SRu&gt;@H&amp;@{eA8r?M++pqxeSW;4&amp;Vj2s3)}DR+V|N4ig^=
@;+a|_$<br>
&gt; zDl!aaqlv=3DNS!#0q2ChyKsUxy(?HOIsa{B&amp;`(LB@d&gt;e*xS3_v^TB&amp;!iit=
yKBxb)~W-<br>
&gt; zH3u26g{9&gt;pe9j8&amp;EsH_vx4u+t&lt;SR&lt;NQJG{9=3DepSC84F7oSz}@KWCV7=
Zxm)#3=3D;~*h<br>
&gt; z(bYfSlx8HL7SZyyF;n!HzDxPR(9LM?U?*)|rl6$RX-^S&gt;v4|9xEu&amp;pn(mmN$+E=
ayV<br>
&gt; zu9})G3d9sQj#mN4tTq9w@h$+gd2;OsxK_(B{8sP|9la&amp;R)O$g}&lt;M8@&amp;mi+=
Cm%XVF(<br>
&gt; zLm3`S2~KmRoYU9Xp2oZ*EAO%~y9wQbGxzzNwj;?vfAA?RuZeaa#EDOX&amp;rc8669X(?=
<br>
&gt; z3?}%Wcgtr&lt;XBjg@l&amp;wogh6wTF(H-D359@HtJBGQmX*4ncG;(ikA9rW-+}QSVR&=
amp;wgq<br>
&gt; zW9HrMQy322`p%|{quT!tqhbNUN02!6*r5@B)qi}jeiI9nH}#*DqxEo6`$~1{I*;1L<br>
&gt; zoNcO9dHJWsF-496idgG~#F5p+-q=3Db0tDQ_ewL3j_Y&lt;D!~6};vs-Mi&amp;TdqeJm=
715rI<br>
&gt; zFa*4ho`x3yY!tnxTtpQU?+c*xVgQ5x1+vaRjq9ELP}CajH{&gt;(bO)-uzJ3b1vT&amp;=
KwI<br>
&gt; zZ{94IMa?Pfp+{V%R-abNL$7o&lt;txl)=3DDsKZ5N~qksNl#~b_!2pYTBVA5DV3ZGDC(V=
s<br>
&gt; zTw5!jo0ewn2-=3D+1SF@QGX-)5la&gt;=3DsZXC3c?ox#PJf-`s-=3Dz`zlb{aPWm2St$=
*dS-{<br>
&gt; zGfH|mm7THS3E&gt;rBPV2&amp;*SQ~!)+=3DoPPi@BLcKg*BSjoc1muDX_=3DX`&lt;R$=
qe$^j^AE*Q<br>
&gt; zIo}%aj1k?APvd7!ZjGOh;@SAg;oSJiwNA?YaBF$-taZP$m&gt;!&gt;x71i4#a&gt;Vsn=
Oqs*Z<br>
&gt; zY!1;qKA*&gt;A&gt;`qIQ&amp;m7J_&gt;M87D_Atp~4f&amp;Z{MmEDg$bF{F=3Daf%(=
!P=3D?D+4ggfx1NFg<br>
&gt; zG4Xaf-=3Dm&amp;e8lio5{Jo6&lt;sYmjNPxUy57oEv{9_MnOc@}5$Y4z@AxbVqM7iQ6h=
+nFzT<br>
&gt; z4H)J^;kmZ$^i7+KKT|gB9ky$Z8N)P7-`tMf(Hzdy{)9$x{LG6Dvkm0&lt;`Sat$6eGIZ<=
br>
&gt; z&lt;HW6KS}%{LVHgmK(7@_!X|;lZE(Arf@GpKQ97Z;7hA2#&gt;mAzbA=3D^emwtry;P1=
c3RY<br>
&gt; z_)3JR&amp;y+%_B|oY-hRBa)VoI-RPly-gc0}fj)%{#xGQ#0!n8V6XuWQS7sl~!SQF@^N=
<br>
&gt; zdIMwhtFZECIDdLyVnW$o_Z=3DEbVSt!^9|j(dO^5;xlIW{Gr{)?*=3DdXX8kPx|0JOlPz=
<br>
&gt; z4&gt;Nn+*&lt;s%B61yB3n^G!UhWd|%%r?y!BvDdXwMqo*rsx&amp;IqZFnp0KH62j?x_=
+B{U8@<br>
&gt; zXf9IP=3D2)B(W(JPch8LzZ@SqINa0J*zGO*mXD&lt;W0_^X)-VHk&lt;d+2vMZpO?3FsP=
R&amp;KD<br>
&gt; zkFe#q6|0#AU@c}kij!P;`5)^T()8J*51naqYl7K2rvi&amp;wyQ7W{2mXj&lt;uCzQMLg=
a|C<br>
&gt; z(yF!%gka3Mb~!99hB&gt;uhp{)^yq~(CiQ7_`;FMxCCl&amp;C_ivMrPdN273XAv1ZCca=
#MQ<br>
&gt; zMTd4&amp;cQgY*&gt;nX}l)W&gt;+LP&gt;sPVo-vU^N8^3~J?Y5MO*F&amp;k@1_kq@_=
9p54Hj1Z{Gfk5<br>
&gt; z`p5M7{g5@ev$it3OpK#P(*qlGCitQqROL#C4$@gqb4337wd}EaPnTM3Liq~jHvc9I<br>
&gt; z%5779pVt%!0LyTGhHfb?&amp;_OU&gt;!uF&amp;;;rz?B+pgS&lt;xv_@iv5dUK49%XS=
JIs=3DWGDH;U<br>
&gt; zABz%Lyqbp=3D(4NL!!s2)6%{Y#Gyl0hhJS7Z{NAEbe&gt;sic68)P(Bj{e4gjN4O!WVL$=
C<br>
&gt; z5t*yUQx`0|Tz&lt;CuR#fyjy&lt;~EdXm)hKTNybs9R!zRe9jjvHxr6D6+PF^fdl`mh@H=
cO<br>
&gt; zljgxmt1NFXtWMFyFFw~L@KnPp1Wx*nd2}66gu~nZKug34R$xk%F1|vP5Z^$5maU9i<br>
&gt; z#uyZXN5}mL&amp;q_{?r4#0iuVU7rU&lt;OcBkl+HNwWsbd)yCjG6w8&lt;Moq0muTJs&=
gt;|Rbr1M<br>
&gt; z6dVRdY}Siy-_Oi#3}dER_;6c^oad4z+fQG9Jl8V&amp;66T)0b6lse&lt;A}2O-w*sB+Q=
h1P<br>
&gt; zvv~=3DoLZN3g^KlZ91|q@J3?qY^FvTXXkqkp#-6#5Q(hDuHf6qB)u;yUPGTFSlgKe&amp=
;&gt;<br>
&gt; z!j}&lt;_F0SK&gt;vBx4p8^GluNhn67i47&amp;0GqufC5;?_yai(l&lt;P-zTDP6=3D#=
Er~A9xySs!S<br>
&gt; z0&amp;|zNzTe(|MY%3swVG9UadLRLuQT@n&gt;Z$T7pN!Q3osq;&amp;z^7sAyml5~qUR=
I18YD9M<br>
&gt; zbCtqBSF}r&amp;N&gt;+pPkuF!nCwF*z8qU%#ju~yUHKqoH*3*$6720HGn&gt;S&gt;1v=
9Yx&lt;za;Oo<br>
&gt; zx@67igk|3Xa-FfV?pIFyO?(Dcpff~DXo^V5sy9L&lt;hurkKzVoR)NcpQvr&amp;h!^r~=
6(F<br>
&gt; zxqZ#FXwfZIzLui*4yxVx#Cp!{ap1&amp;?OWh?|HOjN&lt;G*sO$b4|&lt;!nYzTH$%HG=
C1^{Uh<br>
&gt; zL3Q6R1i15*fAq|Mk_EWcI{21DJ~X%KiCr%H-aGPwX^~TBTpR78xKj$nwSs4(40&lt;-r<=
br>
&gt; z!wZ(o2|#qQM!Vl|gl^&lt;U%n?3~W5)-G862g&gt;#s~aI@_MOxbHpK@P?aY}oZ#uABtE=
?x<br>
&gt; z--f;Io!K&lt;{F*oN7FiIFQ*ZtY4n!4iNX4*gYqMJeOjLd5Gbqt@p3#(l0yIjg#uz43V<=
br>
&gt; zd&lt;ggKs~5HD6R*vES-s^N%r!^Wa6I4cJV*1+l4p-*CM~o6Q-oaRT5EFKQ8p9!|G)j2<=
br>
&gt; zADCR39iY}&lt;|4ePHz_Yo&amp;4*y--*w|dBzZ&gt;iP-&lt;6fsmG#xtzcp4Ltgo%DJ=
lI@a`P)ik<br>
&gt; zb)(Vvn^^fw{c#?ka^Xmbzx8gy!9`&lt;QxoDJpi4J|)XHhs90Q?bL{CeVnD8aR63@3ec<=
br>
&gt; zrPla{Z$vxs@Mc6AX-hk0u?mY=3Dg?~0G`12e1+1M1%@DksO&amp;&amp;O9tiYP`8rJt&=
amp;Zy+NDr<br>
&gt; zMC7rFX3lspo@4n$mZwuK7X(#CH_!wn72SRpjVOnBbxab;+qa&gt;Ec-O2GsY}MA?%8CF<=
br>
&gt; zdWMS3(M3u3^u4Jcce&gt;{o&amp;0i+!O$3P;Ffu&gt;(aS)HY?MUaK9lghU72ldM@77b=
edB);J<br>
&gt; z*oAve%@xSVv&gt;zO-1MYb@{dkhd=3D-TGvfRZ&lt;&amp;GN8IzYpj{v&lt;1z!+lnP?=
Cwy|2P)!;u5<br>
&gt; z;F8mhFp7{&amp;m@7?1&lt;+YqM2V)VKB}_&gt;$3fu3ZF{OYs*&amp;kmt_m6_s$?@L7=
bG#I0MJuuo<br>
&gt; zGApFcYr@HZP_Bacu-5ROb&lt;8=3DF0rK{AHW+~70&amp;&amp;G$GJ#Uq=3D_E&gt;Dq=
kTcxNtu7+2X-{p<br>
&gt; zNs{@h&amp;UvC@%&amp;m=3Dbt|1z^!@Bft+@#hlvS6{|S(tR&amp;e5q!xsmo9~)4WWC=
hn51E4NoOs<br>
&gt; z(}}D(ud#l68F||@s5w@_tE;ITaAx1I$b^woNg#l4Bt|cj%uO+#D7&amp;Dv0Sl6I&lt;{=
`2U<br>
&gt; z0}2_*0(nRSg1wIhU5YG|!33G+RZ9+@HlH1$Y@oOz7uD&amp;))bya)Pw7mZw~#-~mxTUL=
<br>
&gt; zkW&lt;LsN2OCkym3i{m2uEbC6qX+&gt;7`U|&amp;O|~6nB=3DM4{6P*pfBK;N&gt;_H+=
mfG?9hD3yn2<br>
&gt; z-l+SxbYWFgxTY(6eLimMubT1enC4V!S6Ta5$JSf&gt;UVOAOscS5jb#`&gt;FX}32M{uo=
b2<br>
&gt; zul?99Q|0*WzdoIR&gt;^%M!GdwKr&lt;WrF{lkwdz=3Dd^^on&gt;XhCKA7$vRgaZy{#W=
(;gZVkH<br>
&gt; z-{q`(_3ix2c0Um@(GFvC5fa(#Y&amp;tThOW7x)A+!Cp=3DAt8Vbf2D#%;j6~rAf$~?qQ=
#g<br>
&gt; zjQp-7Bj49yPTz)I52Y}9=3DYN$yKj&gt;fccrVN$ddpt-Ebd*j0bNjWYHSNADQXv+W9F3=
a<br>
&gt; z_~tEIil|RYjZF$_a;WZ2_?~uk*#$nfDEV7;120;Y`GOZ+4{_HUyKgk37(2PZllG`P<br>
&gt; z%(*k!7ZK)$NlQ6^EjpeIU}U|UiZGoJcKa96SejhmxXAz5%EU#3c6z0IR9kR%2!rEo<br>
&gt; z0r#w?jUwsEB&gt;8I~?@96&lt;uBT&gt;UJrzu;w0)2@npw?TMYooUzw)mSOa7+q!Ud-l=
)d?*`<br>
&gt; z_Vm&amp;ksXG=3DLDDn5+mfqMktPgK8K&amp;_SwY5exkT?}+Z3YNEJ%Tz$Wt!OC$!7)1=
_2XD?e<br>
&gt; zLU!z6{AF~*2#sWAA&amp;We7qI9PB607e#-@4+|HFZCFR{@I^8{V&gt;M__tcGwA4XSBq=
~$2<br>
&gt; zO=3DjF&lt;CPRBLJP~EAle5i5D*}l8Wi(n~#-RXjIa(b2*j(2?&gt;+riWtI5?0a~MekO=
?S|Y<br>
&gt; zW*8?4$|)HQkTH&lt;$r2ER9Fp{V+Nfpr@NrvI5{r(~L%&lt;6MJ?02AxQ;49J+88o;LPk=
d&lt;<br>
&gt; z)WWXyLn})8D7t|ENV`ELQ`lUu$*P9~aRD#dDx@FlGi7)SSlqC!WVj&gt;@jL|ni8fDA;<=
br>
&gt; z*KF&amp;7u+~&lt;qXEH&lt;l&lt;~sfCN^gCX{E;~jrqX=3D62d&amp;5gM)q-mW=3D|=
bbqtXGwSX8IZ5=3DaR&gt;<br>
&gt; zTf;6(rpTJSOIW-mITqqlqJ&amp;o{y^b&amp;qD9W&amp;Ke&amp;jy3N-75g7S=3D2%i=
|FxX4Goi^d@n-1<br>
&gt; zFllnnDHX3)@RHRaaE@{SFz#X8C0o3htfC!X5I989f-F2s;vUM|u?fO(7fOYAW;Xo~<br>
&gt; z)eORP&gt;b2Bj$SV%Efy2?FIs^!3A8ib4^;&gt;ZdrZf2iuRm;AQDQcuOS|%&gt;k5&am=
p;LUlXAD&amp;<br>
&gt; zh2^%wU6qAIo2z^abec=3DV&gt;Td8Y7XPIv3SKE&gt;oD#|V&gt;R2TSuYmTD!A`eGg~K=
b;STWk1<br>
&gt; z-ROOUQDjD9C+_tkp4lh5sGL&lt;@3UK)Oqzh&gt;NgrxEEJ(+Vh2k*P1c!0mHcE7zGkB5=
)y<br>
&gt; z^-kPQYRP0!gWXUMheLXS|J1)}Y*sfKYu{ilpK3IC|Igl5H26B)df$z%p42Q*g(E-?<br>
&gt; zBCapPcM%6ll#U@}&gt;_|IdaAPu_TIOVYDMU&lt;!wTJaSi+dEna`3KJu$sV|EucE-4$x=
y2<br>
&gt; z$o0jb`-?O*(ug2v*#TeA%#I`9l&lt;v9Zl0u3jiCU;AK&amp;{x|q5{i9F-w7mOh*kI$F=
UkP<br>
&gt; zA;!*&amp;W&amp;r=3D&amp;`L1+|H%GY`xZEh(zvu&lt;+_kmpOU~?V5y)~gr5Ve}mfy=
4(pM@PWPbg#!Z<br>
&gt; z=3Dka7Dpjd*{7Zyp|B!c~;&amp;GiNM`@$j+itf36;mBzbFI0J-2C;Qj%~&lt;3XJypDc=
@Uy!C<br>
&gt; zHn9F`?}7Gkk_y;EYX-MJFR0Zmdw)CE!tU}no8mWd{mo`T``c5Galoo&amp;T_p95N`BT`=
<br>
&gt; zkqJMN&lt;E@`d`#Zt*{{GgEDDLct&gt;Tm?)yvhZt*pidrN*T%xEdM#CGmk{2GF);E&gt=
;9#C0<br>
&gt; zI_C~;+D~6cHMh0*j4qY&lt;AMyWvfMWFGk(E&gt;)P?6y%;}runWxe9uh;^OZTfAMy7q*=
lR<br>
&gt; ztvUtQ&lt;Wn%cGF$xG6QQ$K&lt;9fB4$T|)#il?YrhrwJ7&amp;~M159K;iL$-22uD##m=
&gt;GQn&lt;!<br>
&gt; zvzj6vXTW8fFPjP5`nl~+2HF-5uR0#9$2sQ2o|w63Lolw+h`MPB2pp&gt;&amp;#t$1^3S=
O+2<br>
&gt; z;9LVb+fWiC{-ifnx&gt;Vs$Z|;+MdU5;R=3Dd=3D9bXS)5*%IfCkgTFOaHy^C6Z!|Vm8-=
H7A<br>
&gt; zG}ap%_x3+u;#m|D1C-@YW6d@FsjcQ1|7`r#Eq=3D@u7kG&gt;P!=3D3Lu{uJ=3D#&lt;i=
&amp;Awdso&gt;h<br>
&gt; z7!L{fgg#GUCket~7v*AbOYdG=3Dr`4i3Y(1+t#CmOoc&gt;b3_MGsrzHL%pRhUkUucQk!=
N<br>
&gt; z1`~{~a4CZ^W^0dBdV2{dRc2Y7PX=3DwvIvN&gt;3Wc`AZACI8hX^@)JlU6-@2T&lt;t6_=
V&gt;-;<br>
&gt; zh=3D&amp;&amp;(|G+aKP8$|mC{A}NjHP5%#nEAF@3rWoiv_nJFZRSiU&amp;1oryZY6r=
i|+H#a#AB(<br>
&gt; zA_&gt;d&lt;T2$KHZ)Hzwmro?iw&lt;rYyDt@Nw;LBGh&amp;DXFnJFkvgd*3&amp;4&a=
mp;7;Aj&amp;#r4EE+N|*<br>
&gt; zGaZL7kM{PPaN;!gTTN{+fYOZZgXd($a=3DiVrWH?}dr)(aXm|zhEi0@BZyFnnfw#52E<b=
r>
&gt; zG#a5$&lt;simrn?io1MF+lMG9t6BK4A4V3BAV?mI0GS3|%JSO0gLA0C0(i+&lt;_LF2jA=
}&lt;<br>
&gt; zA0E7H9-IU(q05J@;C1kQ6Gnb`5WL(wPzZ{B&amp;@KqT8QiYsw}6NbR?4XXXe`CgwFkEu=
<br>
&gt; zL=3Dr6kS1PVyFO=3DX%IcM!2FN~t`WHb&lt;ezkZy)JG`|KCJ$Lt@MdAHwVt!kszzpOk~=
x7L<br>
&gt; zestV~2_x!20&gt;wpfG&gt;XV7FX@h%-$U;HqQ@=3DNi5RzQE^V=3DZU{@b~N+t#AAO7!=
i@&amp;MD%<br>
&gt; z|3+hVWi567uL4hSfBt`oXHi%fpm~4?o+H2U@Zm$W_kBS2z7PL$r~gqn&gt;51mWMKl`M<=
br>
&gt; za3f0^L4;-h5RL@;XYb$y$;J{vrhkBtEwOKV4Qk2RATlV&lt;Ciq!w8&gt;`;U2AKg&lt;=
IEu4K<br>
&gt; zoQH5N89_CQEpc@jqA^0M#wxl_$CHao{No$y8b@^4W9miRK)OF&lt;hmdFkP}DB2t&amp;=
%VX<br>
&gt; z_=3D?d*1VBn5eju-HlQ~C8my&gt;eEH*(S};emRF5afAO16&lt;%4rYq)6JfY!@QGb%@7=
zWaj<br>
&gt; zFY#}O&amp;4ORZp15uLomi&gt;dtAp0w^8+}l+zQf=3DG9&amp;PEdV+*DY@^5s=3DP$t=
5{11KOqawF}<br>
&gt; zW$K{$z3bwyTzoi+FM&gt;AwgzYqlKOp0Goe6W73%O{0nGBNd1x&amp;D8Bx6NT%mbE_2$=
Hsb<br>
&gt; zIBs7W3_SsyjQW6AgVs16itnP)AnJ+IVXIXZ?Y5{MigtI@4v{dd*HWMW4S}yp5{Ww`<br>
&gt; zlnhNO8ft;&lt;nY(=3Dy$cL!uOn{e4yVMQhvlt^yS-&gt;LY2acOoy1n6kKF7pW2?{&gt=
;Z6W#6+<br>
&gt; z;&gt;oK6#nm|yiPK!(PBU=3D-`s&amp;fYG?zy-DFLP+EAXIl=3DK~aY?i1d&lt;+&lt;=
xsZB{vCdru}DA<br>
&gt; zv(c9t`}^YCZ$&amp;BT{t^M(P;$_&lt;ESAO2i|ym!&gt;E4N`iq*0wUX|UP?v*G}%T&g=
t;`3|DaCf<br>
&gt; zR3t9T=3D4SPrIQ&lt;X&lt;K&amp;pmE1ccwZp7*$Xr7l!jc`P1_?mzzF4Yc*Ee`4IG`{=
)XeQ{-!h<br>
&gt; z`T(=3Dm7f+suE;*#&lt;hEbK=3DrEeGtjG4c&gt;SOreEp9_raoV&lt;`eWM9gbS03AJE=
I+5|zjH~%<br>
&gt; zAWj#3WJ$&amp;?^BdPFcy20@=3DBiWV*yg1bBMoPDLvhnm{dO59xyMsY@zBgN+b6A`rqh=
wD<br>
&gt; z$f5Y7oxOP-%Rhtx4jsd@58&gt;%&amp;9l)`U&lt;oOQdoZe!W=3Dxlbs=3DN{5Ihp#@Z=
GsmyLU5QGk<br>
&gt; zGmpKw3!20EZf7&amp;uGaP)EJwi@{EQ8WI*gHCEo;a6F=3Da1RlHF~WnJJw%!=3DGM(yq=
&amp;w~5<br>
&gt; z9K=3Da&amp;&lt;|Y}^u_1xj5jf+cu+Qpwx$~6M5{;7dKV1|Vg@Xv)=3D%n5rK*ctny+n=
K0(}^WE<br>
&gt; zs$fxrRJA4)&gt;@q|kHU!kqzYn`TQv3Qz%93PODtNJYkM{-GmPuFvNIKY29E(1xhUM5$<=
br>
&gt; zs&gt;O+PdFuN8Xbd~~EE-=3D$5$tVl0ei2S17I+7(FJOmVQLdmims9AKxx_1SseG4%C?A=
L<br>
&gt; zD&amp;EQMmSt&gt;CPwUGR{|7jv3d|1?37YaTd#XYA(NQiQVZcV5Y`py8#}S)8t8p4^1_=
q7|<br>
&gt; zNcf7y7qGKY{0@d`159c{97UtcaF{4MWHF#;k&lt;33c=3D4hgD(OiWJdpv*rD5QWtXjj$=
I<br>
&gt; z$vCm^(e*HDTlqy$*oGFKK&gt;k%^oiT&lt;m!hUtg$O+I*65JZ&lt;wPaP8mXnBLdUA35=
o6B+Z<br>
&gt; z(0AtH&gt;gw9sgVmL_&amp;2Ki=3DA3WIjX5~Sz_t;y0KozQ&lt;8vFaIhJP1{2~}-;v%=
bFhV10e%<br>
&gt; z!P&lt;kBhZ`G&gt;&amp;Bn$nQ&amp;;tz(u^Rg!&lt;397x-R1=3D%rFqEkU2%j;c2Pl=
?-KAeD&lt;~CQfgj#c<br>
&gt; z&lt;}f|~1VZshR2${Dk3H?3otAQjA-&gt;%bCI9%#0B+vKh}DG2+FX0A7*@h{ni{#k;T|=
%+<br>
&gt; zL7Z0Mqu&gt;-DlVFeN&amp;1Ls|EQ3~YBBW_J&amp;=3D0R?p+Wwla%JCyOiXpj7M4nY1=
i;^Ju9d}a<br>
&gt; z0{;MB*8BmCuYM0dQ`1Esu(djLxorOYN@Uj&amp;K2DsbCQe)OTi5&gt;NYj2_&amp;oX8=
d@s!4oN<br>
&gt; zMke&gt;Kr*Qp)Jp-U`pIQAoQ~$fRlF|RJZmitPf4{`DC&gt;R5j=3Dyzjw;D^S;hp78qS=
*s{D<br>
&gt; z@XDr%0kMuh(~@BsYw%Ae9R@h5QP?bO7rCDJ-;|o14L~UvK|Hp&amp;Og0)-X1&gt;o4UW=
w&lt;?<br>
&gt; zfC4QZP0rA2a35M7U@(D^F0n5arfx|BqDtePlABD%Iz9o+3H0YZ8dORqT1QbtuyWlA<br>
&gt; zj#3YYcuw+49ig=3D_bzjEw#CojCV^&amp;Psvs&lt;9FY8P3&amp;7z1Fld(GL+jIpS3R=
FoPU1M`io<br>
&gt; z7I^t(D&gt;A}@)r#GMAF{$eX&lt;)Ss!&amp;+9M$cJ3A6ZgaJK!x_00G5oBN7B~)Rd0l=
oy9-P$<br>
&gt; zTC;xJ;UE8M-&amp;_nP37VZgspyTeQj@i80|N2wCH?nb?Orz-){teZ#iNTSw3Ak7fAPJV=
<br>
&gt; zwST44)!N1iUZJe3_RHX4--_b+vh|!V)O!cdOQ$MhJru#2L8T+iVbsxq5O$&gt;@c^5U|<=
br>
&gt; zh&gt;RU9%b+mAK=3DWYx=3D|0&gt;Pfj}rW3c~`xR&gt;Hzncx@f`^8SGLp92a$CH8@yP=
H&lt;UTjB66c<br>
&gt; zt5y?xy(J?=3Dz7Km9{SGdxWiyoHX6w~H#$l45mEc~6XEJZ^d5F6|!}zlw|1-}2^^KLa<b=
r>
&gt; zM*92*M)&gt;~x{}RulAPi8)|LVGP{y&amp;^@{`*h*`&amp;0h@l)pdaKjxI*Tv48fJC{=
*gM#QHO<br>
&gt; zoN3D;8b$0lhSXg4;OG!f%iX=3D&gt;oLJ8ki|OU|cg&gt;*HJb7D2ME953J7}G3@9$45^=
71=3Dq<br>
&gt; zCpel`q}AN@er7&amp;~zAPv=3Db;d&amp;!uHr_QqgA*-rg{{ktDD$iu3*h4oQY$+V4Ua=
NT7+!F<br>
&gt; zxUSrKYOwkkS`A$g2N&lt;udU32)1=3DgpIo=3D4-NsJ3dsVa3~^2`iM&amp;&lt;!&amp=
;^in(mqr8vAEZZ<br>
&gt; zugC`|LJg1d)^V99l%AiV1Q-e2pd#Uzkogj6Wt1&lt;(f&lt;hnqOjNF*B%3wWe#=3DB;!=
u`-s<br>
&gt; zF3$U7h3gp3TRF|4C)GLHyR)#DCCh+N$_Y!&gt;ByZwy)Vs04$&gt;m6FSnOq*0;a4OxgJ=
d@<br>
&gt; zU?cQ`5rN!?Pns~j!00`Dc~X%DC7VgU=3DUs|*5x^ijFmdPw4dd&gt;%6Jfkmo_zgwyA`}=
_<br>
&gt; zwp!cIQTqKnc(!{gR-b&amp;`5MO`I@~9F_`@G&lt;&amp;qT&gt;W}0UI8W3(1ao&amp;=
-xV9-i&lt;}$G5MwQ<br>
&gt; zA1jYxVwK+Zk&gt;pnOpaGM3u;jqR&lt;Hesv`Bq~R$te~0&amp;N-5-C3vzW0P!|z3++o=
xR`Z_;<br>
&gt; zQ0h`e?kdvf{VXBEFxB&gt;9cb&amp;$6T)&amp;;upH`|5-!7x~j`H&lt;bLf4*^+9`f8=
ziP|$y8(Z!<br>
&gt; zzqNkWmdk?M3RW5$TaSzblKonB$M|X3T|cc@BtdRDQyFGu$~d2Y$$&gt;u48L9nV_h|mH<=
br>
&gt; zK6eJ|-^|yFf&lt;b&gt;)kw+LrSJCJ$n_EM2x3_+M&gt;kY1IPTAtGB?YbM!ui`g1{SY+=
8DTCh<br>
&gt; z_^Yk&gt;&amp;gx~{gI8Pd4z@wJQ$3qpB-OCfLG8xYC!q)*+w!L;9()e=3Df!7he=3DzN=
Sk5Ae=3D$<br>
&gt; zKQs5R9eR|F367uYx#(l=3DjEg9#4dWRkMFW_JsHkQ9GP_N+mf3F32h*wfH=3DGS1cgMk6=
<br>
&gt; z_aijGfIc;HcU=3DCN_Of~Wyjjs;@)3SA&gt;|n0I&gt;VGU$ng^ZX&lt;anezzsIpe=3D=
~8366RKUT<br>
&gt; zO;%u?k-^kf&gt;=3DYOY!+F(66HKVCX#g@^D&amp;Q&gt;o?n_`8I0U&amp;5X-S4I!oZ=
i3qcMk|9cQjb<br>
&gt; z7PGZr`{?QB$vaQ~g@IpSRzmpsfnzsCOU@GNlGgfJR~=3DXuy~u}0C%~?`&amp;Hk#t!vB=
u9<br>
&gt; zWtrALl4$&amp;adgA}S&lt;wql@40nj!M-HCtJx4E+m)i%st&lt;vc*u39UD2S2-%5O?1=
W_;QRP<br>
&gt; z|G46_z5S*guWM0{umIOsEPeW@JFx#-tJU7VRnC#pnNtFGTsfB?Etge`Dm{iS_!}&lt;S<=
br>
&gt; zQu5WK+VWRl!T!}wo0hxgqBuHqoK^`VLSZq~z;fet3~%d1v0PremfK0OY_sJ?rMM`z<br>
&gt; zJO9Rf1R&gt;f|uzWEYwPlD_et2)?j;Mb6Q~fReZ@GvgOH~V!$vMV&gt;saw?%FIDZI-qh=
-u<br>
&gt; zYVkPPa?49FZllXz)u8f)Re2GO8JytHk|?)13Nb&gt;XOF@txWV+_YN~&amp;hMg6$CNz?=
2TL<br>
&gt; z&amp;bzIGtZ&amp;?}%^JCt9pB(u85)X*3JT9jQBIMbi=3DvBB_|yRvt%{y@oZ`!FI|bF=
m)M}2S<br>
&gt; z@uD~(D&gt;p0r9y@&lt;oD1C!hHRO-TB9G(u;ax4Xpd1~Z&amp;&lt;;ghCv4@bXo&amp=
;Z|#0dmVn}a;w<br>
&gt; zhCOtEvw%1uBPe!9r+a=3DLQRos%c8dp3cVNAxFwSmH6YcbVo?WK8I&amp;iG+X5HbLYbd=
14<br>
&gt; z+Tq(QEJ}iYL|)_y@$tnYj)sIc-V7MTGcKE7#%k(f9E`)Wt)D4C!MRv^Gj&gt;w+!1(7J<=
br>
&gt; zr(sG8^`92&amp;or3&amp;%DvG~yBOl%_zbUE@Nu{=3D2p(ct3#p+*+H}F(!U~h^^{Y|O=
1{H9Fb<br>
&gt; z&gt;TeqLf_O50{*De&amp;$bzqTn@6p!g56K67?8RBeY7ro{%X5bfm&amp;3kB3&gt;Qs=
Zl5&amp;upS!PK<br>
&gt; zzWh=3DD_53COf&amp;&amp;?o{W;)(9gy83Ss@$2aXI{kGVLm6;pm=3DsqmGXI#iCam4y=
IV?V^|_5<br>
&gt; zna*6OCr9Ip!mvo!3t2!4R&amp;`duOAcCsJct&amp;f_M}QFmC4&lt;SIdS;3b-3R=3DX=
$IC*`m-d&gt;<br>
&gt; zMr!B);j0A-_oE50*QJQ?F$O+@*|AXlwl$rurIImOFoLb0Jvg1z7i-IPz{1(9@N;Sb<br>
&gt; zUUX$%E4!m%g4RkDW`|C1Ja0(y^sQ*rHr%&lt;VIC)D}?WLuyqTS;qr+9iJ6x|mJ8K&amp=
;mG<br>
&gt; zS(LZZJme5pK&amp;)vN(o&lt;ghBBS?VpgjxD@-B*&lt;xIaXVh1}52w@|8BizQ$aqYy4=
AILZqA<br>
&gt; zZNV&lt;%-@M-Cda;Bh%5e89ds}fx$sOBLEy&amp;A@zag7QeN;Pxc&lt;66I5x!3}V;6m=
A%I0Ex<br>
&gt; zi1pzw!%^f*mS#RKnI@N}WKR&lt;c5$p_F&amp;Z^lT&gt;{+(otGTh?k&amp;jzQria4b=
qL~~}3LfrG<br>
&gt; zK3a-;7)68tYwuDlw||AA^S4lSB)+&amp;+oe&gt;m@_MfsMAb?v%53W$uhhMsfu$sB)+6=
alZ<br>
&gt; zPqyJctxiqyvY@oX&gt;bz7cDLf;W5=3DEFC7?FuVrb98&gt;^Z}J7YLe}RaL%h4#}qD_j=
8i?=3D<br>
&gt; z+EMZZiiVYXt(_gddUeoho_xhIrHfNfNSL=3DM0VcJhY3r7$kt&amp;-Z(&gt;c}c@utdW=
k`PkL<br>
&gt; zG6RAJp9blf0bH9`GJc&gt;vcfdP_z4!vB!hxE2&gt;cb7MCZhkK+LIKj8cKyj^JUAQ)l@=
{z<br>
&gt; z0i8^C%O$1N=3D~|9A8DBaABSfmtMwCJqm2&lt;dboMGq&gt;oE#&lt;U%Y)?VqsOCgkn}=
=3DnR?pED<br>
&gt; z%{0i_DQ6&gt;0Nm6JP&amp;WR00(Oy;83qbuC7qd~Y@kvoVd@}j^+?*9T5!=3D+`Y_~$u=
{!=3D&amp;|<br>
&gt; zn~rw*N#lg38o9gKZZvN@YgD!id(c=3DnRw!y}&lt;t1*@`+SGHo07pyySwQ!R#S#IRTmt=
w<br>
&gt; zRUdh-gpz?Jxe#obL&gt;BV0uBwdWb$|PpJRSb^n&gt;wC;yU^d9g9l1De_Q43V+M-Ze_E=
x~<br>
&gt; z=3D&gt;jFxPwT5%6!@xsT3=3DnpmO5*{z&gt;&lt;aZT++4mN%p-HNgY$!Bl_er`-S@Pq=
!%UC&lt;qS?a<br>
&gt; z7q)Xh&amp;6k_~+`Gk&gt;Yw@UifuZecXW=3D{i@Bb_NBEG@a=3DZiXkdEy&amp;Two-;=
1I7sXuxb-C~<br>
&gt; zpTv^V?c)@V`EWR9ivSh-7$~#4bvbOmqR&gt;~YaYvyKSr-wnNst$Bc_FXp9bBVOpO&lt;=
*s<br>
&gt; zkohYX^Y0dXr|@1PmQv^El7!_Q&lt;y-?ZT_jM3dj2YZRwcXefpCzGE!j{gPR7!qi~MQT<=
br>
&gt; z(o&amp;i_OO|FuzdkyoOMa3uQfZwW9UtyATP-wLQM*K1tSpKjP+`WWCK@22E$d`ZF?YKf=
<br>
&gt; zD)T28`u8ffqN1}@TBiCyI|~8^*TzTmqbht;%#ngUvxwKt)NQgN;pA22sOni3QCA4Z<br>
&gt; z2Hpan+31T@Tkxvkrpv%@E&amp;aZ=3D-209a@4LvlZz1KryL@}b1@8_r?YX7dx0GWOZKG=
*&lt;<br>
&gt; z*2NqY;tJhYV?LSD;&amp;E`1Xah%d9K~x89oEPw0&gt;_tJx~U+3E&gt;TsKtvX&gt;}e=
@2JrrPuJ&lt;<br>
&gt; zIvOs&lt;0hZoc!hfAa3^qU|uKg-`Ggz7vvISdKr`k*f&amp;2&lt;7x1Zb)#N@Xh&amp;=
1RgNoe%m}e<br>
&gt; zStu?q;D7k_hcswiodK(KBfO)CW#KFbti6n`#~3s`wUxi$KHfuPcuBQ|qt5h5s{v|o<br>
&gt; z9jFbzh0gP&amp;f|u^oXj6c}g4xnE&gt;JQQS@_HeuAHn~@k8ubUe#DG=3DV-jX@39(Pv=
3eS;}<br>
&gt; zvl12w3^~2RAT)I$y=3D&lt;5BM%I5iT&gt;@H;vhKo?c)P5|;lACf|4OsbiXy%iumwr4J=
J58@<br>
&gt; z3mwKeZv*H%c@{2wSUBq}Ji^hvKrdpMLrESZ6vUoerD@J&gt;cTt%|z#+zoG5RrqiQ3%+<=
br>
&gt; zU9Csaut$?SX8YfeC%d*llG0*b)E8*9YCWh;6|6qAcg^^0;n5jXd-JAPuT%6k^xIT*<br>
&gt; zDtgzE7yKxs@HTe+;lj90ktb-lA*DF*lp~3zm4U-EY`mr}3KD5y1c#ko6pm8JgyZ`O<br>
&gt; z$A&gt;tC6OB!8d)gx&gt;&gt;crUh`kKRYyE~Y0T1N~dxd`mTHDg6h98K^X8UU|_s40mM=
(w;bt<br>
&gt; z;P3{B7Ft|KbcpLt5~e@uEG&amp;5~HY7rhwWiHUWTNItGaY&amp;aTC&lt;{ep?b6Rb5Y=
U+igIjk<br>
&gt; zP)ohDRR2jVFV;ItY|T&lt;v2(2$Kbw1V%R1+v$fi?G&gt;Z&gt;^)44?`pE&lt;uU&lt;=
@y~9MF|3++y<br>
&gt; zbx=3D&amp;H3X;sy92zLM#3B^v#{q_SQ@SK5ivsmkUkBXcg`(S+!jjt#&gt;|}KZkz9CM=
h+kM(<br>
&gt; zxTO;252ku?@)g}yoAt3;tWU4rxrLHNAG5sK&gt;^Ylnzsb@(6h?n_iTJqvCZW`o-GpbF<=
br>
&gt; zoK2?&amp;mDzK&amp;xOdj|%%$J*DRDktd6TcS`AB6=3Du9D`?${DXx&lt;`XDmtcg87J=
Zc`F&gt;@{0=3D<br>
&gt; z0q@eyUDytL2jxId&amp;Ipr@jJxc8XxiM_-)?&lt;|=3DGt%sr&amp;{{om!D$N{?m7%q=
Gj&lt;%frUMB<br>
&gt; zrk1)~&gt;n9g3{NrZp@YONg+jsZ(KVd^=3D%4(x1i6&lt;jq4r?8bQZf6|met11(85W{k=
)=3De-<br>
&gt; zXxq|SHe0)vLQH&amp;R@CN^qYl}bCg5dAW&lt;f(Ies+wnh)!ZFaa&lt;@&gt;$-AV&lt=
;Qo+9YH`$oKR<br>
&gt; z_skn&gt;({M-i4rPee3&gt;S*#kC||2&gt;oEwmEQO-{mFfR~WFBoq&amp;NJ3~C@}!7k=
!AE;e^VpA<br>
&gt; zn@_Qu`u5YE-R86BFZTZDyZx63he!W=3D+&amp;X#n{SU8y{J(m5)&amp;?&amp;7;&lt;=
EeicfCH$=3DYQa;<br>
&gt; zHF&lt;w^ee+9Qo^%&gt;Z3PttP?wi#e+&gt;-P6F{oGJG?jn+l#Hr7tvdYMI;yLe|3b0S=
pjfZ&amp;<br>
&gt; zhvR{H+rAlfd%bQOKJ46#dUYE{&gt;!`&gt;;+&amp;Vu^eyP6tzha&amp;KBR}!zvUp!8=
X5QtD*IH1Q<br>
&gt; zG+4~($EbGmRk~?a?mQ~o`Bk?mmF?|RwX;&gt;Uj%s#3m8^*pd0Q3iT~)91s$4%()%x)&a=
mp;<br>
&gt; z)=3D#2ZovBitOO&lt;NrOgwp$r&gt;IPCt14A#ytxtj%T|T{&amp;-VA*_TT?|V*horvv=
2&gt;o(|WOe<br>
&gt; zd}P0wOM^O(=3D5#KNsngj)(f(7+Jb0Y3!O?M&amp;YDb+JU;fl^=3Deba{{u2H(&lt;G&=
lt;&lt;D$e&lt;0Z<br>
&gt; zu=3D7I9eNNbDykK&lt;Jq_VZ-Af&amp;Oi{&amp;rNme+&amp;h5ii^VjxNmG_wPun~U9=
JDHN=3DP;cKFeR$<br>
&gt; zH^qm*NA=3DVCnmN9qSmxc_igSBILJ9j%ySFD+8S{r#!rA~(#QMwbiGxGfALoTEiB4^c<b=
r>
&gt; z=3DyeUu!=3DsA+vE+yvl-{1y0^&gt;gM$v)Kp5Ib@VtoFo`)5j$jSjuBi3Td`G9m&amp;=
&gt;2gLXGc<br>
&gt; zblg-K;TK)dCwvZZ3SbJ!DOgD-MiXVAHis?XmnUGT(Rq@dM$+*-TS$|zNBRo0z&gt;0=3D=
{<br>
&gt; zv7`xhK0DNwMYS!e)p5Ir`2gSOYadQL55#kGdMw^Za5-=3Da22f!dBos&amp;fsyr*+SXb=
RN<br>
&gt; zC4Q`3K|d_uIMc_hgDxp_{cpsWKgw}3FRtYtCG#R+JGl%;!})PgR7VyYG6f?I;JJ|!<br>
&gt; zKo&gt;07pAtz81Lq2xZ5D3YoGZ!lBas3i8&gt;Dvn@6(md2GE8nd#Jz)d);3+-Mt9g?Fn=
Hx<br>
&gt; z#u!gHYK+fA)UioPeGT&gt;w_Ea$CJm*l=3D{&amp;95C#mMm(Xhg)rv5Zr6hIz3Q8K*=
=3D$UaMF%<br>
&gt; zQ=3D_&lt;~I^zrFlGEdIet!!^{|8ZQ`~}ls{$(HLPO6l8@N-3in-TwYZDk{!|7)#rpa1j=
A<br>
&gt; zJc}ZQ0V)#Q=3DA3CjISTAwH7S^z5;PNPgT-JtzooK{wx+_eC7cek{&lt;^hCTo{~=3Dwl=
Nn$<br>
&gt; z!&amp;Q+EzjjW*ad33JcX0A7AP7@pd+qFa(_N|l&gt;AubEk_=3D1&amp;Ew|s3HC4cM1=
Hu~_-$L?M<br>
&gt; zIXRYeekHycmM9;lN~VN&amp;su*)A*{`r=3De22l?QIpPACWWt7iyiS*qu4310S@pYy&a=
mp;i1h<br>
&gt; zHZVkCn~vV$C?2z2lr|+wE~8#=3DiR5^)e1xee2yIF*iUigW5l0&amp;yVv3kD2Y#n;QEh=
5K<br>
&gt; z&amp;dcdru?5W2(pO6rv9yZ+6!D)9{v+@o`p|GcyjfWiA09i&lt;&amp;L-!ljg^(Rk16=
vdhN2Ut<br>
&gt; z@&amp;ejpCGz4}f+7{!YDKKUe%sh6qYO|*g@&lt;Wr_lL4vVPgZz6v`+vUV&amp;mC+)P=
5JISYt_<br>
&gt; z#d(T3xrI*kFIw~F^W)}Guyb@&amp;I)z&lt;B&lt;uS|!B|SB%Ne`ki=3DRO7I)4YA!JZ=
z=3Djy=3D?7Z<br>
&gt; zv^BTfOSp9Wu(q16zVqYrANCG{06L_aPA3M%C!H55Z&lt;K|LiL^%&gt;#D&amp;{eg1Ib=
M8JFbG<br>
&gt; zw_1N$%mJY!z{@fYuAEmlg(&gt;b&amp;x%&lt;&lt;3ORcn}H*iszMtMB+#-cU4^F~2&g=
t;&amp;k_DPAIwpM<br>
&gt; zcemd!|Le-;%IbPL|LfZ7ef-}q@+=3DAq0~GJ~U&gt;@GD@$liMl?K3M0Qd_qfcFuB?;`?=
F<br>
&gt; zjR?HykKMnh;&gt;-=3DhF$bFqbp|wEHj)vs;EF?7(AJcF@rRpJCX*F3w0T}VIjj&lt;wU=
ww9X<br>
&gt; zT#?&lt;za@C{eF}!-&amp;+^rrSz{ghyyDA}=3DIIW29xA$K)t9#F?2Zty872jfen5M^d=
*vfW-<br>
&gt; zt{{}$e2CLZC0fm+?c?o}!(-09$o3YLW36`;-XwxZNo_$}I~0F)tI2q5z{tW6Ek?w2<br>
&gt; zkYn8MgLE^r_@f&amp;NyBou&lt;1PrR5bqDq2lFj&lt;DG|w`D(MGxy&lt;_SyID0w3z`=
8%l9i{p1P<br>
&gt; zc&amp;|kJX9PnThOh$|eANyaF&lt;JW(07^d#J5cR3UPqDY^A&lt;XzmGIrx5_aJ+{&lt=
;HL$8`&gt;)3<br>
&gt; zzmMVOf)d|HWjnkig`4Djv0r};7ZD4_qdUNm4=3D~lK{w+P$p-Vn2pvF`&gt;AtB|wjIW$=
D<br>
&gt; zebIH)o{WjSv7evVrGP_djS-4pqETEuyBYIGOqd5##EAqGxcJ;qu|C{OV&gt;H&gt;3*Jq=
%r<br>
&gt; zeWWpznVNzQs&lt;l^*b(vC;Y#DED#bS*J^0(gx+bxtGFaBMj!2$=3D`T#z5ymjGJ)&lt;=
62nN<br>
&gt; zG&amp;WY9*Xdc)*ci40GwNWtRgjen3)1K&amp;r@(muCzD0*cJq`VkvxzrM;r&lt;j8KY=
VHYJuV`<br>
&gt; znh=3DYId|;iOV_PL&amp;8^v=3D?oNQY&amp;*|sNRvhAAO2{U1GQ&lt;F|Q*|u%_WKXt=
np8j9qd9^&gt;m<br>
&gt; zy7s&gt;Jz1DAavmKprw2FO25$m7K-|WI1SQwH(0ImtJb{ZNE=3DOgzFXs|Q-)Ya8P*+|G=
+<br>
&gt; z6-$NS;#@Vljy5twl`O~0Fc%d$Z_ICY4!C4N{PW+p1b=3DGyDK31+d705&amp;HTgudL2a=
3&gt;<br>
&gt; zj7_utqnfNN`yZW|30?JiNQbpW`!#AZ&gt;SNo#ol0$e`MR(5FQP-1jG1`6Tj!dXn$VJL<=
br>
&gt; z&amp;h4!FzARz(4WLt6@3TO5r^M!m{KJCUvjnsq5Tbf-SG`o7{Wi3JgxvKOSY&gt;3mo~=
M^!<br>
&gt; z)3!lO8pU_&lt;*XkW8evb_eq+N#F|EG#GSDKY?I(cpftRENUZ6{syW2!_hEq&lt;W%Zqj=
XU<br>
&gt; zQM7^b&amp;-=3DC&gt;dYX&gt;^=3DO|AZZy{~I=3DvJs7($9kpGdiQqOiEjiDMA#dl!9=
DdQFVKrQ6Ngp<br>
&gt; z031P98v{LhgA$W_;uxr)p-CYIB^N6zQe4K&lt;c15IUeA~cWx=3DENE#&amp;4zT8k(h7=
jXf`&amp;<br>
&gt; zU~vn~W+SooWagyF^qYH}Mti-P+&lt;6@ZCKPw4oisDkQ}CNK&lt;m;UY&amp;r=3DS0Ak=
R962&lt;JJ3<br>
&gt; z7=3Dx_b;vB+U_VDn51%iUuv5Boih?(a+gpZ;DfZ&amp;(Ftlpu;k=3Du~P4G4E=3D%IaT=
{Fx~Pk<br>
&gt; zX?MRSpEagTP@*|orQtD-!&lt;15SpuQ!|oPF6AE`h&amp;xPo+;i|FBzXBm56|bi9U2n$=
RKa<br>
&gt; z;eZLsXoDJIWkDq%&amp;MLDss&lt;L12XqvmY*}uh+^Nk+)OR9pNo*rSfL@$PDet^~#9*=
)PI<br>
&gt; z@T%6V1Y2CulgnP?n);VHYR;7r)x9f=3DB&amp;m)E?}ur!19^@keGrO@wo3OPQwFc~&am=
p;qj*b<br>
&gt; ziN2&amp;C*AHJ7`bUs-EazwNC#HX7YU63+2`O^n2$WQ_D|$+M*sGxtWHI!dB(|qYh;P*o=
<br>
&gt; z{jSPS-T4}4l*z&gt;|Ex3h+M$sLm289oj$1+j!_C?eAg$4K$Wm$7$_QL1g&gt;P1!BtA@=
wN<br>
&gt; zjM(9o?Cd*%JFTg&amp;?&gt;xp&amp;DmbLRF3tw+aC!G{l{MGs$aVmAit{-v$6&gt;k&=
lt;Huf%|sH{ID<br>
&gt; z4T~q93sSCpcqWmW&amp;EJQ(3*wO%ftA|dQ8#btPOl$_HN~h3SzZ~sWVL2thiz8~Ry0jR=
<br>
&gt; zR*CP?0e$vfg{_SrRMMdiKdEin9JevEjqQ-%K7%nr#XLf+;&gt;d%}reZ*dsGG^rB;-YD<=
br>
&gt; ztopawl$PUNR8)!ZXM;bY+Uy8iP7JSdgpp9|A+_C$RVZmp#fV14|6|HIbuWYE2$z&amp;K=
<br>
&gt; za!jC`Z9OpwZziplCdHO5_KWHvOF=3D{m`++=3DrpcHNr{~eV|j!DklkqNv-H&amp;9a^c=
bDBY<br>
&gt; z34zee!m$BajwP(aW!$I0%)6!KynS2-Iy&lt;JB@wYxhvO&lt;hb&gt;f~yZ=3DcpW4d_?=
(gKsSc_<br>
&gt; z2YSWt7G}MRTeHKratN!?E68y1gu=3D5OHC(d&amp;peA1s?*idU3kDzj3)sn$jI;j)I37=
~a<br>
&gt; zV=3DZ@xf0xv?_?b|`iTKr^l00T{9H9#R{b6BS-o44gF1vT&amp;mYro)^E)`+i^Ko;o&l=
t;3k~<br>
&gt; zYGdO9R~nv1F=3DrAf(?8U+feT9Dll&amp;IX?&gt;#T&amp;WTonI#h*5T=3D4Q*KYlkk=
;nQ=3D!1QmO}H<br>
&gt; zRi^F9#ehL9ei3PWwP11Ae~rdD&gt;F-DPBO8iI&lt;Md3=3D3gH#H1k0e)&amp;tM~~gB=
Wij*nzCU<br>
&gt; zUvtm3j~&gt;`zics!hbfhll=3Dp^?RYD(%~Ba~|-vI=3DI4xgyxz&lt;3z&gt;AoSY4$?=
}C#%!;8mp<br>
&gt; z!`R!*loR&amp;kdvUtK5&amp;&amp;U}%19P(mgWf6#DqGjt28R{XSOeuofTUPoguwI&l=
t;c~Ywsn@`0<br>
&gt; zZ|mBt9l}jkUUUZ0*15Rp3QR*h2Oz-Czg^@SufITj4NSVb`|9^5h)m!8VA$;wr_drT<br>
&gt; zoemVlv&gt;!0)aR#*?;?YVAK3f2Dt|i@HaN;9&lt;pIE2M1=3DKnB+VtSTky|fFvKUZ7*=
YLZy<br>
&gt; z1=3D#OfF9lAUt$~Hkk&lt;T!tRYt%o7FD?%tbjw#xVcA}aLf9^9X97I;=3DHl@%&amp;g=
;{-(N1-<br>
&gt; zXy54B(7UJQ+M2q&amp;$OVD90I^C_eHFr_Fo7Y!jQ*Ehg%fk=3DYqcKkrP}C*+DCR`!TA=
Wc<br>
&gt; zcqxWPlfQgk{*fGEMh~Z)WKeTQ5b)shU?|s{vGIC)5#&amp;EN5D$V4w28UO$wf@p+NXFd=
<br>
&gt; zDD?~9o{=3DbXiryE$Z%5J#zV&amp;L&amp;N_*oiIo`8Ztwl&lt;f%hE`{q__(&lt;s7U=
{!&gt;*F=3DXjD%1-<br>
&gt; zskbCl7*Xhf0~-KXBqUhXiM0Ol&lt;4&lt;}&amp;w|$DOye^Fnk|lJ}fd}_j?{R&gt;yI=
uQqI1Y&amp;TA<br>
&gt; zF@5}Un0hG)?3Zi#m0ibl3DI+&lt;sm@1UNVhiM2DilaUDanwjbXw`*oUC@D2)f3q1dEp<=
br>
&gt; z^m=3DqoWs&lt;x5Wnf3M$8S;`MryC*Cfi1&lt;Sh{XB&amp;qp1?DJzB3vD2FWa?swE{j=
DwE&amp;oz&amp;*<br>
&gt; z_FfQJ`}icWKT3g%83nCG8D58Xgs%6IdyK%VFqZU1l&amp;1Ex6&amp;Qs4yMK&gt;-(wE=
Uc@kG2(<br>
&gt; zrTjAFHz{Hd7fTZ&amp;0Hr^onf!|@5LPB;w^_$^YxNfrkVUIf`RGJZEVsiW{4C|u=3D@6=
M!<br>
&gt; z0xhiPy{?HL+&gt;teM+4RY}%a$$5mBtS%3)1{rV1rMy^~@vkZbD(&lt;xMLS{2K2ZVM}p=
K!<br>
&gt; z^Y%gO?_RI+%Z{V$0b!~34AUm%0FEFnRPA&lt;&lt;_yvcgHK-fAVf`qca&amp;&amp;TL=
rta&lt;Rkd&lt;fd<br>
&gt; z-!FVnD=3D`Ug1|t2?stelBm9Vasz-e&amp;cV!!)_#WkJkqQB;!OQBhf6ss%s)tTM%1Xd=
g&amp;<br>
&gt; z;kCD!*0vo~W2M1JK=3D@KW^et&lt;GRKzP)brH?UZ^X0c!oF1kFBD=3Dy66n&gt;RH*rt=
r?63b!<br>
&gt; zfI&gt;UiK|Da3o*)ZfqEBs%l{F*l8&gt;GNKT=3DMj9NsJU&amp;q%H1u&gt;uDP0btV#=
eRIG?D+Wlu&lt;<br>
&gt; zYO*0_c=3D8GUVku`GOJ=3DZ)FyDD&amp;?MZTz89-FYX9Q0FlBo2K4gNDP?^xjL(7d45)=
nE&amp;S<br>
&gt; z&gt;n%gSJ40L!+YX$ny=3D*Lj6Z6X=3Dfr0tE8HKN&amp;KN&gt;O6G46jfK7`_jS729A=
A!m`dCz5gg<br>
&gt; zjG!Zajd!IdFx*y!1;gW4SFDbfDii^Jy;E|()OgPNM{Z&lt;IgyOaMnu&amp;ea%}`rQt1=
obq<br>
&gt; zm|!Z1ETD&lt;tP_Z%#N+UBxi5&gt;1;jrA&lt;4Mm+thKgsAwl-w?GMV*p&gt;Jhuxhb?=
S0cky-eR<br>
&gt; za|#7uCqf*)NK&amp;zk{A&lt;9OlO8Oj0^@Ue^=3DtclVIRpvGw8GU4O9iMVo@zlcY)yg=
JEj43<br>
&gt; z?1%`n`{|p)J5?7gaN&amp;iw`{!n5Yp9BUvOh&amp;KO2KWLd&gt;zrMte^9kyHXSmx20=
c#fME^J<br>
&gt; zXq!M-L#&gt;=3DpV*M2wx|T|kAfdiA+1yKYk=3D3l)-eb|1f@=3DBT@rnkM{L#+o=3DiA=
|UC5BFn<br>
&gt; zoqn_-DFZkR5#bVR-gMHCH?L)1ZD#^j37tXnp-@)W9!wqN)R#)l%DfKElGg}M(%U~M<br>
&gt; zuf)89uCPLFAn&gt;0TQf_%h-7`f4xDpKuN|tKPZr{7h3z}9jVK`3jL|0-O8&gt;jHIcJj=
Zc<br>
&gt; zNuus?9)|}os&lt;FNKMuM=3DNs2Ux8(ML+zei8Tt%|`d-_(PHkZeX$=3DZv5oN3I;c3fF=
C~@<br>
&gt; z2KmB?qa8Y0`N&gt;&lt;&gt;YnjTIBIeC`(@|}0?Jm7C!`PP&amp;`bC?aJ^vQqAePDI*=
(o)u{mSH&lt;<br>
&gt; z)#di#rxh)2Sy2?@!8`;yj?J8(`*Xx&lt;7&amp;7k&lt;yXR;?w-ur+8hI7QFkamGr2Ky=
p_F}c8<br>
&gt; z7$_#e@Z&gt;h6z?V#&lt;L~QRpLRVk}-=3D@NNg`tQ~eNNG0(}GRM?LWMM+zmB&lt;d&l=
t;jxLE|4VK<br>
&gt; z$acFDksHe701|6UMc}+t+r;1Xy@-V9zF=3D6j3+`t5?=3DF&gt;8X_8tytr9OX${%Rag#=
~aQ<br>
&gt; z8fz&lt;i5E&gt;uKyqz*CJxPhco(!XJ&gt;wwP3iiz#iVk&gt;&amp;J{$!lA2Sz$zYa`=
Fa&gt;0(Qev3_@7<br>
&gt; zAj;RFI8zDiXwgp(o6HUMAuyG1P96-t+`Y`~CAwHDp^5IU&gt;&gt;0{;B$DnW;&gt;*nD=
^Zr=3D8<br>
&gt; z+)iJ6JG#hi^&lt;COuZ`-&lt;5ZHR)A^1lI#%`5T4h!XNOVL(v`qyW=3D6tK^D7TJcaq1=
uA%B<br>
&gt; zI(0gsm`cfLUr8G}$`&lt;_70voQ7j4!ovo3r2gbB~%yepJm+5J{6-%OmpGO~UD=3Dz%jE=
X<br>
&gt; z3W0CR(tMOB=3DuzGZIo`aiA6R7ooiB)(^qwT)edmio6TaLqxul7|zUjYCv&lt;4o*lz2V=
O<br>
&gt; zA7ALZ7}wb(Y~wgmGb&lt;~9&amp;fD+MZ;{&gt;Zm}%jhPikK}k=3DZ;mXYCj2v|&gt;8=
(XG}f&amp;EJXd3<br>
&gt; z+-q5HmG#`Cuu~i}z@%r-&amp;iQ$HqmSJZP2Op%JDixu(DRPWvm}(ZCEE$r&amp;6f#{Z=
)0dZ<br>
&gt; zwz&gt;0ZKZRJ0Nz_P}B(^syaJWvoYVMx6sOXjmxhR^CL-H(~*E)fHPYz{Ai=3DWT7*aBQ=
0<br>
&gt; zY)Rnaew0s#bPy7-Fl`5m#%JeUY;&amp;+L?$`jjoyTLKI56vI)Sf{(F3)!}k=3DXE*@L|=
&gt;U<br>
&gt; z#{MB-BTJ&gt;tf=3D)w^7b1K(*GIYR?vG9{llTcIX9sFpr&gt;24SztT2qLr6f~x$oPH8=
k&lt;(o<br>
&gt; zxLy1=3D&lt;&amp;_Fe5=3DlWS+KD%7y_)Dy@_wY&lt;;XR?Y7J9?oe!3SW)miA}3U5_m=
&gt;aX|F6VoO2<br>
&gt; zLZ~qRpyA&lt;NvJAwILb8xx(g&lt;L(7!~1Rnx%cBdA2Td5577Q{i%(6#c2n#^0AH#%RO=
m_<br>
&gt; zoy=3D~TtonFYc3i24w860|PwqTm(z=3DfE3p%vPj{R=3D*D1{cdV)7NrRiLA~3+%+$d+u=
HU<br>
&gt; z%6mlNw!6BUX7M&gt;8hohKU7wje68Ky&gt;kr&amp;5^uUX&gt;q6TN05+`cwyG0#I(AE=
R}3H=3D&lt;R1-<br>
&gt; za?q&amp;h7@mI{obe0-Q3%Wcm$toykmEB=3D;q%}z@Svn+s(FU|ss^kaL%mgY{laRmE0f=
m$<br>
&gt; zI7EIMt0O^3!_J~0wPF-Zgm#k9p@5nm`&gt;t=3DM&lt;K@u!27&lt;T0Slc2_I7ha#m`p=
2%9cggt<br>
&gt; zul55cczf~?M$?08jP&amp;)Iwp^Hra9opzok7LCWb&lt;%F0%x&gt;Iypv&gt;hX7&gt;=
1@@~mWr^E38M<br>
&gt; zFCwM8Xm#kkU?%?{wI1C18Y4rWVV&amp;t@t&lt;DfTlf4=3D^@Adx%`DfvKXgod7$bkO8=
n)oT|<br>
&gt; zk%FJZf+?nh8KPD;v|8xfnhOewRw`G&lt;%A#ytkbJ&amp;0&gt;(%%5*@;Mg!=3DOv)JW=
n~a`xQ^D<br>
&gt; z5KgEqX)yweg@|9gEn4yE$D{g5Kw;@bn$_{4zXy_VUc?~YNfh&lt;xx*;*`i9Piq#Xmy^<=
br>
&gt; z&gt;DsDmDjjc^U&gt;e~y62j{?rz#!nf&gt;7^rV_LO~wNBD&amp;GV`~r-|do^l6v`7K=
aIILKQfzN<br>
&gt; z=3DK{&gt;Ps}A{3W`;X=3DM&lt;;LzJ?E)0NCHxNzmL}ahIze|sS7}7XeEa^6Jul1sXIV=
uG&gt;uM2<br>
&gt; znPoKZG-re%o?TF5!a?H-;1EB&amp;tNCdiD_ml$q(u4i1B_xYlWpLUm)APbBnc|`8vF5-=
<br>
&gt; z)X}Xgu?1&gt;Y(JEc&amp;&amp;F0Dl5M`+a6vyVhxnL!a9zVvRVF+7kH2|~N(4wG)X5%=
gRYi$d6<br>
&gt; zLrGYt`kbmj^^UfmOG-7xd8@$5Xa$2D%0I{ATDAKIUOy_(CKcX*5sI?cPMuz2qrcY=3D<b=
r>
&gt; z&lt;lVzV&gt;^ql5Hk4(JYjswZ?^O*VZ|gz$e)@EG)S`*tRZUqAH_&lt;Y&amp;c}2k?K=
H{;uV7Yd)<br>
&gt; z4=3DfigR$Gnk&lt;3}~t54L9;t}gf&lt;Wyj#7WkC4ZuF~0=3Dl}aT049~u;J$~iSqnAi=
-PBuqQ<br>
&gt; zE6Xe&amp;S8D{5LM!+UZ&gt;DD0r3Q|w%$7?Z&lt;0%TTh%=3D0Sb6&gt;&amp;|kWk%^=
(cEl%RkS2Va{mU^<br>
&gt; zsysrF8$yKfXi{U9n{y%k%FZn&gt;f+}Y3L&amp;sd=3DN1TX{zJMU*iX|Kv-TUaCQ~!wl=
P{rHv<br>
&gt; zTu=3DBZ(8dXnBCB0qLP@84Jg~chog9AwH&gt;o9hD&amp;?^`IZdoXcIeMH^0c&gt;S{j=
i;QX5gBU<br>
&gt; z`M|EDFTbgwQI-D3c&amp;&gt;@*(SgA8pbpL1k#lpwDE(&amp;gu+7?KJ+^-6a;@?0G$$=
a&lt;w2#yO<br>
&gt; zhOsmzQfCZ#1+~Q$(W#xK0vh~BHB|+T#D&gt;#0gyqbwEuFzKqFwR4Hrue&amp;%01SWqQ=
s4U<br>
&gt; zBeCQywe~SRRK~PWe;{@}SUo@h%n?ANVKb&amp;V$}x0#kn@$Fh9&lt;mm{F_qyY{gYUhP=
eS%<br>
&gt; zqih`LbMTKV4e-cq)-s7OT$HY3fr&amp;3en7dv$AUND3{pxcRYKffT@QOs%*WvdHryJbK=
<br>
&gt; z`&gt;fiQ8}#SfFctEvzvXM?MwHx|UXJ_c?p;$g35V;0N0JM=3D)&gt;iBy4FT-xYnTSG&=
amp;P|@8<br>
&gt; zv{6_5kwM(pUbIl0bpN6p0*6TF!9zzChN%iHR_&lt;h0q$KHPhSZUe&amp;$Ela0TmU03!=
=3D&gt;;<br>
&gt; z-&gt;JwQlPXM*TbNO?f@W`B*0gd*fdvrHSjDo&gt;0jbwzmcI~JE)dvfH)|1S$c1eFfOp=
;e<br>
&gt; z=3Dh&amp;DnFNLscJ|`oveY&amp;8&amp;3I%qQdwzeHKVr-9P4acQO?$r@&lt;f)sOtt=
J$6w2@fZ;#d2#<br>
&gt; zmZmCg5ls_Qee^)zVho(PC_4z0ndmUS6G&gt;S#&lt;lg#NR&gt;CoN{aWw9BO(|0ak4PJ=
n;x;s<br>
&gt; z)*zkA(WX|4fqSKCX^^n*@u-ac8g?=3Dftl){nr@5RM4CXt%TefmsJCntQ&gt;phSfMG&l=
t;e4<br>
&gt; zDQ00-v=3DtmFsHc&gt;)Yo5*HaqNjK(O~m9oVj;(55p`@8(*}z6=3D}_NNK)8;k{gN?Ry=
TTG<br>
&gt; z44ln1Va(&gt;RUEQ)RL0V^dt^nZ}AY6?L9d=3Dv_BM1d&amp;yCM9e{KX{dz;ULp^=3Dk=
KK+V${S<br>
&gt; zK1xv+I?|w9QL(f#PCyo`uM(FqaCt)wIlL4UM)6K+PmLBR6j)k&lt;cYu%mX~w(N`@og6<=
br>
&gt; z$3@)0y&lt;PGx1oP%KmA6VI(@QK9;xi^tng?l@CM`}p*SAwD%l1%es^BaGR9hwAeK)t1<=
br>
&gt; zfjo*Xrn`zj%@jKxOGG=3D}-nkH&lt;UEX|GrtCjcJ-1xO3unFh&amp;ZTWv6tmFK)Kp$o=
DT2YY<br>
&gt; zsYy1uDx%qo9M`YlxX=3DD}cbNcpoMGi7zBmVzzG8&amp;&gt;#83h?ZTr&gt;wY|V%)Lc=
Pr}Yc`j0<br>
&gt; zDh}iUo$NXG-Cjs%%#Dw^0Syi6jct0?DsM3rwi_A}&amp;a~~|AY&gt;(rZp|ZyCjD3({9=
KHr<br>
&gt; z9D=3D~V&lt;dAwk&amp;7#{TMuf96RdMOy=3DaNUNKg}T#A3JBuyGq)P5c+SJvNanw&lt=
;=3D6)(uJKlc<br>
&gt; z&gt;F@`wD82#hn}vb4Kx`5&lt;diA&gt;w!6KEWxE_|pZ7Zxs?IPa9lI)A0pi9&lt;!^U=
|8E4pXd;<br>
&gt; z2x0Csn~11Ra05nH-&gt;AzTHX&lt;ft6&amp;dn&lt;6j65Hg(i!=3DuIGSiR&gt;q}mt=
3^l-8=3DulBPO#%d<br>
&gt; z!9G8@gUN=3DO%!cXud#U=3D_6h6^hb2P;0eUrH?ra@*9;&lt;ww=3D0eSeZg*OHo4Ds`{=
f{RB4<br>
&gt; z@J~7O-iKqachwBeyzK`p^;ZRn6!x`&gt;1J-n2$?T}_NXjC9{)S`JK&amp;cnvb)|wDZo=
1U?<br>
&gt; z6?zE=3D&amp;;N8)Ttf8?j{bc$FOn2yzgmLXd%I1-*DQKZc1(30&lt;V_f=3DyXvzyIPc=
=3DnpkV|M<br>
&gt; z`u$%pBJ^X*0(f5nAwAx*EaWE3B#MNqX!C0bd=3D;-4LlTlJF~5II&amp;7{}7{&amp;i;=
eXxR)L<br>
&gt; zV{FRz&amp;G-Zb!p{x~8Ud$OlQV?4fTf+&amp;lw^~p`_QmLe0}}y3cewmBabQ9_p@Y*j=
`l_X<br>
&gt; zZD@F}q^vl_68@4+U=3D6LL$A;a=3DkhTEc8Kz#GKyZJuW1v%$A+`bB*bqziU6J=3D2d&g=
t;_1D<br>
&gt; zq0qmfms5G)QHG%V0L07y{@8A8lrZWJ?{#;NYvHFxjP&gt;&amp;S_~Y8!*a442E8)g3ZJ=
8=3Du<br>
&gt; z(=3DG8HM56w=3Db3{2$%xH;K+TuCJaN;F6a0q0th9&gt;d9+**{3+}-C@Mdnqd!!#mI-}=
zk=3D<br>
&gt; z(VOEd^KYE-*p}&amp;wc&amp;PfW)tcVU!zA6L*r3@uA{l5CgdCxed&gt;dItl#n&gt;G=
#MAN&amp;OzVaT<br>
&gt; zYvj!}+loK&amp;+bWE50wBZ8exL8v*XK;rEK`XII|pyMyWsbWZ~U!?!0Kjv@?R8%jtUul=
<br>
&gt; zP`*U-2_Wl@#8F8_+T?%)Z$VMj0g{A`$O1A^*dXcCoLT0_z^aA^4`;x|-jHTJacUh6<br>
&gt; z&gt;EbWyg%vG&gt;!5ROwOiiA3A-gN}ttM?e^-=3DZIEQwL&gt;Z_f=3D4q!=3D9^W)2&=
amp;iIFBr1H=3D+b4<br>
&gt; z`4+F~2;NeYQ*!tbx98&amp;oJQ!9T#1KkG&lt;Ml`21cZMeUSaynZn~XneilViYV-&lt;=
c6B3I4<br>
&gt; znkhulQ9S1j#&lt;1W|2V_CcLQzbSZZC%ENr!g@{bu-#2W0OejqCaPV=3DPIWn1j!5YTka=
K<br>
&gt; z)-o_2|1;P;xEl{qk2BQcfg{aaSehjzBQyH^Z@7sSbw%vhxUAmSS#kel31a)hmGg}J<br>
&gt; z*u-1j&lt;2@FlHsU;T7qZkeMLOny{zS`&gt;E++7{_hLjZ9nIgt%J`7!6YLNU(QRWoF4#=
f&lt;<br>
&gt; ze0x(4;bwcHYXnQ#vO%-j=3D{dz&amp;XO7qsL9sR0zvGinGaO|(A}SFEC$@)BD@o;XxL#=
Z(<br>
&gt; zaqw$CJ8JVaLxkX?s_~p?MV_GF8?rVz;zi6SpXe_W-l8f`O|Q@7EG3jCvd=3DXlTA=3DS7=
<br>
&gt; z$2w~SmJdBqGHR~sub+7Yr?m_05!aqDyxOm?v&amp;Eh@J~$oFb&amp;~-hc!oC|8@O3b?=
#+#$<br>
&gt; zpMe9myxDOl79s}Mri-hRe=3D)lPs}&amp;2%S&amp;9&lt;H8}y3e#kKb4;&gt;D%S4Mb=
IqF)=3DEwCQo~D<br>
&gt; ze*X~}C)U$Pu^ov=3D$l&amp;mhgH|_wtI=3D@8lLF##UKC^hB`64feN~Wlv&amp;Xq}WO=
@+J&gt;|a{D<br>
&gt; zTn0QJBG*j=3Dw2wZTJ2y`&lt;%8p(D=3D9X{o?-1H7X;U^a!}q1b_SdTP+bKYY+}8QJvE=
du{<br>
&gt; z89Sp!z2sdY(DrZs=3D-z0a4bGc2OuY?&gt;FxElHzQNca3j!pV&lt;4G6vs^smw0=3D2&=
gt;tbHs;q<br>
&gt; zTLwR1&gt;F;3R?94&gt;4f=3DcJv6S00hb^QVAE*Lucw^35O?j$&gt;R)v94EoY1&lt;C=
^~Bz~e+9Bm<br>
&gt; z=3D-+$_arUZtuMat6p6~THx)#-dpnQ0Bx~@z&lt;wEXa&amp;mIs4YM+2AMLB3mhN!bkH=
ijTIx<br>
&gt; zFO(kCb_J48vAx5O$9TzQZ}E@Eb}YD73=3DTi7#Uy&amp;|dNZi(G(S`d;t7&amp;uq3;T=
ca9~Dx<br>
&gt; z09`XRBdBAjErhu}&lt;^sXs3i8Hj)v`so&amp;&gt;iYRvtZf+`tL9=3DU@;etoEBS2m-=
K8~y&gt;q2h<br>
&gt; z+TExjWnE_+v4`$F!uQmhSg1WxuUFSm+o6dmp;MaUae)(u*Vj2R&amp;xg3fmce$t?1#tf=
<br>
&gt; zk0_i&amp;rBmS)WMU!t&lt;&gt;tTkc?r`Xk#~0$KlA6il$KNe(we1If=3DOgIXYy?vQ|=
vzRD+{B=3D<br>
&gt; oS{_Y-qD-8?{UU@;`u2yZH+RUI=3D&gt;Ku7O+hf?7EJA-9$}#V2We-xwEzGB<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/COPYIN=
G b/meta/recipes-core/gettext/gettext-minimal-0.20.1/COPYING<br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-core/gettext/gettext-minimal-0.19.8.1/COPYING=
<br>
&gt; rename to meta/recipes-core/gettext/gettext-minimal-0.20.1/COPYING<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/<a hre=
f=3D"http://Makefile.in.in" rel=3D"noreferrer" target=3D"_blank">Makefile.i=
n.in</a> b/meta/recipes-core/gettext/gettext-minimal-0.20.1/<a href=3D"http=
://Makefile.in.in" rel=3D"noreferrer" target=3D"_blank">Makefile.in.in</a><=
br>
&gt; similarity index 78%<br>
&gt; rename from meta/recipes-core/gettext/gettext-minimal-0.19.8.1/<a href=
=3D"http://Makefile.in.in" rel=3D"noreferrer" target=3D"_blank">Makefile.in=
.in</a><br>
&gt; rename to meta/recipes-core/gettext/gettext-minimal-0.20.1/<a href=3D"=
http://Makefile.in.in" rel=3D"noreferrer" target=3D"_blank">Makefile.in.in<=
/a><br>
&gt; index 38c293d2ed2..fdb6ad35881 100644<br>
&gt; --- a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/<a href=3D"ht=
tp://Makefile.in.in" rel=3D"noreferrer" target=3D"_blank">Makefile.in.in</a=
><br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/<a href=3D"http=
://Makefile.in.in" rel=3D"noreferrer" target=3D"_blank">Makefile.in.in</a><=
br>
&gt; @@ -1,13 +1,14 @@<br>
&gt;=C2=A0 =C2=A0# Makefile for PO directory in any package using GNU gette=
xt.<br>
&gt; -# Copyright (C) 1995-1997, 2000-2007, 2009-2010 by Ulrich Drepper &lt=
;<a href=3D"mailto:drepper@gnu.ai.mit.edu" target=3D"_blank">drepper@gnu.ai=
.mit.edu</a>&gt;<br>
&gt; +# Copyright (C) 1995-2000 Ulrich Drepper &lt;<a href=3D"mailto:dreppe=
r@gnu.ai.mit.edu" target=3D"_blank">drepper@gnu.ai.mit.edu</a>&gt;<br>
&gt; +# Copyright (C) 2000-2019 Free Software Foundation, Inc.<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0# Copying and distribution of this file, with or without m=
odification,<br>
&gt;=C2=A0 =C2=A0# are permitted in any medium without royalty provided the=
 copyright<br>
&gt;=C2=A0 =C2=A0# notice and this notice are preserved.=C2=A0 This file is=
 offered as-is,<br>
&gt;=C2=A0 =C2=A0# without any warranty.<br>
&gt;=C2=A0 =C2=A0#<br>
&gt; -# Origin: gettext-0.19.8<br>
&gt; -GETTEXT_MACRO_VERSION =3D 0.19<br>
&gt; +# Origin: gettext-0.20<br>
&gt; +GETTEXT_MACRO_VERSION =3D 0.20<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PACKAGE =3D @PACKAGE@<br>
&gt;=C2=A0 =C2=A0VERSION =3D @VERSION@<br>
&gt; @@ -52,16 +53,13 @@ GMSGFMT_ =3D @GMSGFMT@<br>
&gt;=C2=A0 =C2=A0GMSGFMT_no =3D @GMSGFMT@<br>
&gt;=C2=A0 =C2=A0GMSGFMT_yes =3D @GMSGFMT_015@<br>
&gt;=C2=A0 =C2=A0GMSGFMT =3D $(GMSGFMT_$(USE_MSGCTXT))<br>
&gt; -MSGFMT_ =3D @MSGFMT@<br>
&gt; -MSGFMT_no =3D @MSGFMT@<br>
&gt; -MSGFMT_yes =3D @MSGFMT_015@<br>
&gt; -MSGFMT =3D $(MSGFMT_$(USE_MSGCTXT))<br>
&gt;=C2=A0 =C2=A0XGETTEXT_ =3D @XGETTEXT@<br>
&gt;=C2=A0 =C2=A0XGETTEXT_no =3D @XGETTEXT@<br>
&gt;=C2=A0 =C2=A0XGETTEXT_yes =3D @XGETTEXT_015@<br>
&gt;=C2=A0 =C2=A0XGETTEXT =3D $(XGETTEXT_$(USE_MSGCTXT))<br>
&gt; -MSGMERGE =3D msgmerge<br>
&gt; +MSGMERGE =3D @MSGMERGE@<br>
&gt;=C2=A0 =C2=A0MSGMERGE_UPDATE =3D @MSGMERGE@ --update<br>
&gt; +MSGMERGE_FOR_MSGFMT_OPTION =3D @MSGMERGE_FOR_MSGFMT_OPTION@<br>
&gt;=C2=A0 =C2=A0MSGINIT =3D msginit<br>
&gt;=C2=A0 =C2=A0MSGCONV =3D msgconv<br>
&gt;=C2=A0 =C2=A0MSGFILTER =3D msgfilter<br>
&gt; @@ -93,17 +91,32 @@ DISTFILESDEPS =3D $(DISTFILESDEPS_$(DIST_DEPENDS_O=
N_UPDATE_PO))<br>
&gt;=C2=A0 =C2=A0# Makevars gets inserted here. (Don&#39;t remove this line=
!)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0.SUFFIXES:<br>
&gt; -.SUFFIXES: .po .gmo .mo .sed .sin .nop .po-create .po-update<br>
&gt; -<br>
&gt; -.po.mo:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0@echo &quot;$(MSGFMT) -c -o $@ $&lt;&quot;; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(MSGFMT) -c -o t-$@ $&lt; &amp;&amp; mv t-$@ $@<=
br>
&gt; -<br>
&gt; -.po.gmo:<br>
&gt; +.SUFFIXES: .po .gmo .sed .sin .nop .po-create .po-update<br>
&gt; +<br>
&gt; +# The .pot file, stamp-po, .po files, and .gmo files appear in releas=
e tarballs.<br>
&gt; +# The GNU Coding Standards say in<br>
&gt; +# &lt;<a href=3D"https://www.gnu.org/prep/standards/html_node/Makefil=
e-Basics.html" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.org/pre=
p/standards/html_node/Makefile-Basics.html</a>&gt;:<br>
&gt; +#=C2=A0 =C2=A0&quot;GNU distributions usually contain some files whic=
h are not source files<br>
&gt; +#=C2=A0 =C2=A0 ... . Since these files normally appear in the source =
directory, they<br>
&gt; +#=C2=A0 =C2=A0 should always appear in the source directory, not in t=
he build directory.<br>
&gt; +#=C2=A0 =C2=A0 So Makefile rules to update them should put the update=
d files in the<br>
&gt; +#=C2=A0 =C2=A0 source directory.&quot;<br>
&gt; +# Therefore we put these files in the source directory, not the build=
 directory.<br>
&gt; +<br>
&gt; +# During .po -&gt; .gmo conversion, take into account the most recent=
 changes to<br>
&gt; +# the .pot file. This eliminates the need to update the .po files whe=
n the<br>
&gt; +# .pot file has changed, which would be troublesome if the .po files =
are put<br>
&gt; +# under version control.<br>
&gt; +.po.gmo: $(srcdir)/$(DOMAIN).pot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@lang=3D`echo $* | sed -e &#39;s,.*/,,&#39;`=
; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test &quot;$(srcdir)&quot; =3D . &amp;&amp; =
cdcmd=3D&quot;&quot; || cdcmd=3D&quot;cd $(srcdir) &amp;&amp; &quot;; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo &quot;$${cdcmd}rm -f $${lang}.gmo &amp;&amp;=
 $(GMSGFMT) -c --statistics --verbose -o $${lang}.gmo $${lang}.po&quot;; \<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0cd $(srcdir) &amp;&amp; rm -f $${lang}.gmo &amp;&=
amp; $(GMSGFMT) -c --statistics --verbose -o t-$${lang}.gmo $${lang}.po &am=
p;&amp; mv t-$${lang}.gmo $${lang}.gmo<br>
&gt; +=C2=A0 =C2=A0 =C2=A0echo &quot;$${cdcmd}rm -f $${lang}.gmo &amp;&amp;=
 $(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) -o $${lang}.1po $${lang}.po $(DO=
MAIN).pot &amp;&amp; $(GMSGFMT) -c --statistics --verbose -o $${lang}.gmo $=
${lang}.1po &amp;&amp; rm -f $${lang}.1po&quot;; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cd $(srcdir) &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rm -f $${lang}.gmo &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) -o $${l=
ang}.1po $${lang}.po $(DOMAIN).pot &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(GMSGFMT) -c --statistics --verbose -o t-$${lang=
}.gmo $${lang}.1po &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mv t-$${lang}.gmo $${lang}.gmo &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rm -f $${lang}.1po<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0.sin.sed:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;/^#/d&#39; $&lt; &gt; t-$@<br>
&gt; @@ -112,7 +125,7 @@ DISTFILESDEPS =3D $(DISTFILESDEPS_$(DIST_DEPENDS_O=
N_UPDATE_PO))<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0all: all-@USE_NLS@<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -all-yes: stamp-po<br>
&gt; +all-yes: $(srcdir)/stamp-po<br>
&gt;=C2=A0 =C2=A0all-no:<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Ensure that the gettext macros and this <a href=3D"http:=
//Makefile.in.in" rel=3D"noreferrer" target=3D"_blank">Makefile.in.in</a> a=
re in sync.<br>
&gt; @@ -126,24 +139,24 @@ CHECK_MACRO_VERSION =3D \<br>
&gt;=C2=A0 =C2=A0# internationalized messages, no $(srcdir)/$(DOMAIN).pot i=
s created (because<br>
&gt;=C2=A0 =C2=A0# we don&#39;t want to bother translators with empty POT f=
iles). We assume that<br>
&gt;=C2=A0 =C2=A0# LINGUAS is empty in this case, i.e. $(POFILES) and $(GMO=
FILES) are empty.<br>
&gt; -# In this case, stamp-po is a nop (i.e. a phony target).<br>
&gt; -<br>
&gt; -# stamp-po is a timestamp denoting the last time at which the CATALOG=
S have<br>
&gt; -# been loosely updated. Its purpose is that when a developer or trans=
lator<br>
&gt; -# checks out the package via CVS, and the $(DOMAIN).pot file is not i=
n CVS,<br>
&gt; -# &quot;make&quot; will update the $(DOMAIN).pot and the $(CATALOGS),=
 but subsequent<br>
&gt; -# invocations of &quot;make&quot; will do nothing. This timestamp wou=
ld not be necessary<br>
&gt; -# if updating the $(CATALOGS) would always touch them; however, the r=
ule for<br>
&gt; -# $(POFILES) has been designed to not touch files that don&#39;t need=
 to be<br>
&gt; -# changed.<br>
&gt; -stamp-po: $(srcdir)/$(DOMAIN).pot<br>
&gt; +# In this case, $(srcdir)/stamp-po is a nop (i.e. a phony target).<br=
>
&gt; +<br>
&gt; +# $(srcdir)/stamp-po is a timestamp denoting the last time at which t=
he CATALOGS<br>
&gt; +# have been loosely updated. Its purpose is that when a developer or =
translator<br>
&gt; +# checks out the package from a version control system, and the $(DOM=
AIN).pot<br>
&gt; +# file is not under version control, &quot;make&quot; will update the=
 $(DOMAIN).pot and<br>
&gt; +# the $(CATALOGS), but subsequent invocations of &quot;make&quot; wil=
l do nothing. This<br>
&gt; +# timestamp would not be necessary if updating the $(CATALOGS) would =
always<br>
&gt; +# touch them; however, the rule for $(POFILES) has been designed to n=
ot touch<br>
&gt; +# files that don&#39;t need to be changed.<br>
&gt; +$(srcdir)/stamp-po: $(srcdir)/$(DOMAIN).pot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(CHECK_MACRO_VERSION)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test ! -f $(srcdir)/$(DOMAIN).pot || \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test -z &quot;$(GMOFILES)&quot; || $(=
MAKE) $(GMOFILES)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@test ! -f $(srcdir)/$(DOMAIN).pot || { \<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;touch stamp-po&quot; &amp;&amp;=
 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0echo timestamp &gt; stamp-poT &amp;&amp; \=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mv stamp-poT stamp-po; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;touch $(srcdir)/stamp-po&quot; =
&amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo timestamp &gt; $(srcdir)/stamp-poT &a=
mp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mv $(srcdir)/stamp-poT $(srcdir)/stamp-po;=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Note: Target &#39;all&#39; must not depend on target &#3=
9;$(DOMAIN).pot-update&#39;,<br>
&gt; @@ -159,11 +172,9 @@ $(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFI=
LES.in remove-potcdate.sed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0package_gnu=3D&quot;$(PACKAGE_GNU)&quot;; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test -n &quot;$$package_gnu&quot; || { \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if { if (LC_ALL=3DC find --version) 2=
&gt;/dev/null | grep GNU &gt;/dev/null; then \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LC_ALL=3DC find -L $=
(top_srcdir) -maxdepth 1 -type f \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -size -10000000c -exec grep &#39;GNU @PACKAGE@=
&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/null &#39;{}&#39; &#39;;&#39; 2&gt;/dev/n=
ull; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LC_ALL=3DC find -L $=
(top_srcdir) -maxdepth 1 -type f -size -10000000c -exec grep -i &#39;GNU @P=
ACKAGE@&#39; /dev/null &#39;{}&#39; &#39;;&#39; 2&gt;/dev/null; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LC_ALL=3DC grep &#39=
;GNU @PACKAGE@&#39; $(top_srcdir)/* 2&gt;/dev/null; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LC_ALL=3DC grep -i &=
#39;GNU @PACKAGE@&#39; $(top_srcdir)/* 2&gt;/dev/null; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } | grep -v &#39;libtool:&#39=
; &gt;/dev/null; then \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 package_gnu=3Dyes; \<br>
&gt; @@ -184,26 +195,29 @@ $(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTF=
ILES.in remove-potcdate.sed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case `$(XGETTEXT) --version | sed 1q | sed -=
e &#39;s,^[^0-9]*,,&#39;` in \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39; | 0.[0-9] | 0.[0-9].* | 0.=
1[0-5] | 0.1[0-5].* | 0.16 | 0.16.[0-1]*) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(XGETTEXT) --default-domain=
=3D$(DOMAIN) --directory=3D$(top_srcdir) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--add-comments=3DTRANSLATORS=
: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--add-comments=3DTRANSLATORS=
: \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--files-from=3D$(srcdir=
)/POTFILES.in \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--copyright-holder=3D&#=
39;$(COPYRIGHT_HOLDER)&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--msgid-bugs-address=3D=
&quot;$$msgid_bugs_address&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(XGETTEXT_OPTIONS) @XGETTEX=
T_EXTRA_OPTIONS@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(XGETTEXT) --default-domain=
=3D$(DOMAIN) --directory=3D$(top_srcdir) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--add-comments=3DTRANSLATORS=
: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--add-comments=3DTRANSLATORS=
: \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--files-from=3D$(srcdir=
)/POTFILES.in \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--copyright-holder=3D&#=
39;$(COPYRIGHT_HOLDER)&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--package-name=3D&quot;=
$${package_prefix}@PACKAGE@&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--package-version=3D&#3=
9;@VERSION@&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--msgid-bugs-address=3D=
&quot;$$msgid_bugs_address&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(XGETTEXT_OPTIONS) @XGETTEX=
T_EXTRA_OPTIONS@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test ! -f $(DOMAIN).po || { \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -f $(srcdir)/$(DOMAIN).pot-he=
ader; then \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;1,/^#$$/d&#39; &lt=
; $(DOMAIN).po &gt; $(DOMAIN).1po &amp;&amp; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat $(srcdir)/$(DOMAIN).pot-header =
$(DOMAIN).1po &gt; $(DOMAIN).po; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $(DOMAIN).1po; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat $(srcdir)/$(DOMAIN).pot-header =
$(DOMAIN).1po &gt; $(DOMAIN).po &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $(DOMAIN).1po \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| exit 1; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -f $(srcdir)/$(DOMAIN).pot; t=
hen \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -f remove-potcdate.sed &lt=
; $(srcdir)/$(DOMAIN).pot &gt; $(DOMAIN).1po &amp;&amp; \<br>
&gt; @@ -228,17 +242,19 @@ $(srcdir)/$(DOMAIN).pot:<br>
&gt;=C2=A0 =C2=A0# This target rebuilds a PO file if $(DOMAIN).pot has chan=
ged.<br>
&gt;=C2=A0 =C2=A0# Note that a PO file is not touched if it doesn&#39;t nee=
d to be changed.<br>
&gt;=C2=A0 =C2=A0$(POFILES): $(POFILESDEPS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@test -f $(srcdir)/$(DOMAIN).pot || $(MAKE) $(src=
dir)/$(DOMAIN).pot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@lang=3D`echo $@ | sed -e &#39;s,.*/,,&#39; =
-e &#39;s/\.po$$//&#39;`; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if test -f &quot;$(srcdir)/$${lang}.po&quot;=
; then \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0test -f $(srcdir)/$(DOMAIN).pot || $(MAKE)=
 $(srcdir)/$(DOMAIN).pot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test &quot;$(srcdir)&quot; =3D . &amp=
;&amp; cdcmd=3D&quot;&quot; || cdcmd=3D&quot;cd $(srcdir) &amp;&amp; &quot;=
; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$${cdcmd}$(MSGMERGE_UPDATE) $(M=
SGMERGE_OPTIONS) --lang=3D$${lang} $${lang}.po $(DOMAIN).pot&quot;; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$${cdcmd}$(MSGMERGE_UPDATE) $(M=
SGMERGE_OPTIONS) --lang=3D$${lang} --previous $${lang}.po $(DOMAIN).pot&quo=
t;; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(srcdir) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; { case `$(MSGMERGE) --ve=
rsion | sed 1q | sed -e &#39;s,^[^0-9]*,,&#39;` in \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39; | =
0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; { case `$(MSGMERGE_UPDAT=
E) --version | sed 1q | sed -e &#39;s,^[^0-9]*,,&#39;` in \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39; | =
0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].*) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $=
(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) $${lang}.po $(DOMAIN).pot;; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.1[6-7] | 0.=
1[6-7].*) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MSGM=
ERGE_UPDATE) $(MSGMERGE_OPTIONS) --previous $${lang}.po $(DOMAIN).pot;; \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MSGM=
ERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=3D$${lang} $${lang}.po $(DOMAIN).po=
t;; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MSGM=
ERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=3D$${lang} --previous $${lang}.po $=
(DOMAIN).pot;; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else \<br>
&gt; @@ -373,28 +389,30 @@ check: all<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0info dvi ps pdf html tags TAGS ctags CTAGS ID:<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +install-dvi install-ps install-pdf install-html:<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0mostlyclean:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f remove-potcdate.sed<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f stamp-poT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rm -f $(srcdir)/stamp-poT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f core core.* $(DOMAIN).po $(DOMAIN).1po=
 $(DOMAIN).2po *.new.po<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -fr *.o<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0clean: mostlyclean<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0distclean: clean<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f Makefile Makefile.in POTFILES *.mo<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rm -f Makefile Makefile.in POTFILES<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0maintainer-clean: distclean<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;This command is intended for mai=
ntainers to use;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;it deletes files that may requir=
e special tools to rebuild.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f stamp-po $(GMOFILES)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rm -f $(srcdir)/$(DOMAIN).pot $(srcdir)/stamp-po =
$(GMOFILES)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0distdir =3D $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir=
)<br>
&gt;=C2=A0 =C2=A0dist distdir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test -z &quot;$(DISTFILESDEPS)&quot; || $(MA=
KE) $(DISTFILESDEPS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(MAKE) dist2<br>
&gt;=C2=A0 =C2=A0# This is a separate target because &#39;update-po&#39; mu=
st be executed before.<br>
&gt; -dist2: stamp-po $(DISTFILES)<br>
&gt; +dist2: $(srcdir)/stamp-po $(DISTFILES)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dists=3D&quot;$(DISTFILES)&quot;; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;$(PACKAGE)&quot; =3D &quot;get=
text-tools&quot;; then \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dists=3D&quot;$$dists Makevars.templa=
te&quot;; \<br>
&gt; @@ -439,13 +457,15 @@ update-po: Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tmpdir=3D`pwd`; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$$lang:&quot;; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test &quot;$(srcdir)&quot; =3D . &amp;&amp; =
cdcmd=3D&quot;&quot; || cdcmd=3D&quot;cd $(srcdir) &amp;&amp; &quot;; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo &quot;$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTION=
S) --lang=3D$$lang $$lang.po $(DOMAIN).pot -o $$lang.new.po&quot;; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0echo &quot;$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTION=
S) --lang=3D$$lang --previous $$lang.po $(DOMAIN).pot -o $$lang.new.po&quot=
;; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(srcdir); \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if { case `$(MSGMERGE) --version | sed 1q | =
sed -e &#39;s,^[^0-9]*,,&#39;` in \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39; | 0.[0-9] | 0.[0=
-9].* | 0.1[0-7] | 0.1[0-7].*) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39; | 0.[0-9] | 0.[0=
-9].* | 0.1[0-5] | 0.1[0-5].*) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MSGMERGE) $(M=
SGMERGE_OPTIONS) -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.1[6-7] | 0.1[6-7].*) \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MSGMERGE) $(MSGMER=
GE_OPTIONS) --previous -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MSGMERGE) $(MSGMER=
GE_OPTIONS) --lang=3D$$lang -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).p=
ot;; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MSGMERGE) $(MSGMER=
GE_OPTIONS) --lang=3D$$lang --previous -o $$tmpdir/$$lang.new.po $$lang.po =
$(DOMAIN).pot;; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }; then \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if cmp $$lang.po $$tmpdir/$$lang.new.=
po &gt;/dev/null 2&gt;&amp;1; then \<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/=
gettext.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gette=
xt.m4<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..e7832418ea1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gettext=
.m4<br>
&gt; @@ -0,0 +1,386 @@<br>
&gt; +# gettext.m4 serial 70 (gettext-0.20)<br>
&gt; +dnl Copyright (C) 1995-2014, 2016, 2018 Free Software Foundation, Inc=
.<br>
&gt; +dnl This file is free software; the Free Software Foundation<br>
&gt; +dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; +dnl with or without modifications, as long as this notice is preserve=
d.<br>
&gt; +dnl<br>
&gt; +dnl This file can be used in projects which are not available under<b=
r>
&gt; +dnl the GNU General Public License or the GNU Library General Public<=
br>
&gt; +dnl License but which still want to provide support for the GNU gette=
xt<br>
&gt; +dnl functionality.<br>
&gt; +dnl Please note that the actual code of the GNU gettext library is co=
vered<br>
&gt; +dnl by the GNU Library General Public License, and the rest of the GN=
U<br>
&gt; +dnl gettext package is covered by the GNU General Public License.<br>
&gt; +dnl They are *not* in the public domain.<br>
&gt; +<br>
&gt; +dnl Authors:<br>
&gt; +dnl=C2=A0 =C2=A0Ulrich Drepper &lt;<a href=3D"mailto:drepper@cygnus.c=
om" target=3D"_blank">drepper@cygnus.com</a>&gt;, 1995-2000.<br>
&gt; +dnl=C2=A0 =C2=A0Bruno Haible &lt;<a href=3D"mailto:haible@clisp.cons.=
org" target=3D"_blank">haible@clisp.cons.org</a>&gt;, 2000-2006, 2008-2010.=
<br>
&gt; +<br>
&gt; +dnl Macro to add for using GNU gettext.<br>
&gt; +<br>
&gt; +dnl Usage: AM_GNU_GETTEXT([INTLSYMBOL], [NEEDSYMBOL], [INTLDIR]).<br>
&gt; +dnl INTLSYMBOL must be one of &#39;external&#39;, &#39;use-libtool&#3=
9;.<br>
&gt; +dnl=C2=A0 =C2=A0 INTLSYMBOL should be &#39;external&#39; for packages=
 other than GNU gettext, and<br>
&gt; +dnl=C2=A0 =C2=A0 &#39;use-libtool&#39; for the packages &#39;gettext-=
runtime&#39; and &#39;gettext-tools&#39;.<br>
&gt; +dnl=C2=A0 =C2=A0 If INTLSYMBOL is &#39;use-libtool&#39;, then a libto=
ol library<br>
&gt; +dnl=C2=A0 =C2=A0 $(top_builddir)/intl/<a href=3D"http://libintl.la" r=
el=3D"noreferrer" target=3D"_blank">libintl.la</a> will be created (shared =
and/or static,<br>
&gt; +dnl=C2=A0 =C2=A0 depending on --{enable,disable}-{shared,static} and =
on the presence of<br>
&gt; +dnl=C2=A0 =C2=A0 AM-DISABLE-SHARED).<br>
&gt; +dnl If NEEDSYMBOL is specified and is &#39;need-ngettext&#39;, then G=
NU gettext<br>
&gt; +dnl=C2=A0 =C2=A0 implementations (in libc or libintl) without the nge=
ttext() function<br>
&gt; +dnl=C2=A0 =C2=A0 will be ignored.=C2=A0 If NEEDSYMBOL is specified an=
d is<br>
&gt; +dnl=C2=A0 =C2=A0 &#39;need-formatstring-macros&#39;, then GNU gettext=
 implementations that don&#39;t<br>
&gt; +dnl=C2=A0 =C2=A0 support the ISO C 99 &lt;inttypes.h&gt; formatstring=
 macros will be ignored.<br>
&gt; +dnl INTLDIR is used to find the intl libraries.=C2=A0 If empty,<br>
&gt; +dnl=C2=A0 =C2=A0 the value &#39;$(top_builddir)/intl/&#39; is used.<b=
r>
&gt; +dnl<br>
&gt; +dnl The result of the configuration is one of three cases:<br>
&gt; +dnl 1) GNU gettext, as included in the intl subdirectory, will be com=
piled<br>
&gt; +dnl=C2=A0 =C2=A0 and used.<br>
&gt; +dnl=C2=A0 =C2=A0 Catalog format: GNU --&gt; install in $(datadir)<br>
&gt; +dnl=C2=A0 =C2=A0 Catalog extension: .mo after installation, .gmo in s=
ource tree<br>
&gt; +dnl 2) GNU gettext has been found in the system&#39;s C library.<br>
&gt; +dnl=C2=A0 =C2=A0 Catalog format: GNU --&gt; install in $(datadir)<br>
&gt; +dnl=C2=A0 =C2=A0 Catalog extension: .mo after installation, .gmo in s=
ource tree<br>
&gt; +dnl 3) No internationalization, always use English msgid.<br>
&gt; +dnl=C2=A0 =C2=A0 Catalog format: none<br>
&gt; +dnl=C2=A0 =C2=A0 Catalog extension: none<br>
&gt; +dnl If INTLSYMBOL is &#39;external&#39;, only cases 2 and 3 can occur=
.<br>
&gt; +dnl The use of .gmo is historical (it was needed to avoid overwriting=
 the<br>
&gt; +dnl GNU format catalogs when building on a platform with an X/Open ge=
ttext),<br>
&gt; +dnl but we keep it in order not to force irrelevant filename changes =
on the<br>
&gt; +dnl maintainers.<br>
&gt; +dnl<br>
&gt; +AC_DEFUN([AM_GNU_GETTEXT],<br>
&gt; +[<br>
&gt; +=C2=A0 dnl Argument checking.<br>
&gt; +=C2=A0 ifelse([$1], [], , [ifelse([$1], [external], , [ifelse([$1], [=
use-libtool], ,<br>
&gt; +=C2=A0 =C2=A0 [errprint([ERROR: invalid first argument to AM_GNU_GETT=
EXT<br>
&gt; +])])])])<br>
&gt; +=C2=A0 ifelse(ifelse([$1], [], [old])[]ifelse([$1], [no-libtool], [ol=
d]), [old],<br>
&gt; +=C2=A0 =C2=A0 [errprint([ERROR: Use of AM_GNU_GETTEXT without [extern=
al] argument is no longer supported.<br>
&gt; +])])<br>
&gt; +=C2=A0 ifelse([$2], [], , [ifelse([$2], [need-ngettext], , [ifelse([$=
2], [need-formatstring-macros], ,<br>
&gt; +=C2=A0 =C2=A0 [errprint([ERROR: invalid second argument to AM_GNU_GET=
TEXT<br>
&gt; +])])])])<br>
&gt; +=C2=A0 define([gt_included_intl],<br>
&gt; +=C2=A0 =C2=A0 ifelse([$1], [external], [no], [yes]))<br>
&gt; +=C2=A0 gt_NEEDS_INIT<br>
&gt; +=C2=A0 AM_GNU_GETTEXT_NEED([$2])<br>
&gt; +<br>
&gt; +=C2=A0 AC_REQUIRE([AM_PO_SUBDIRS])dnl<br>
&gt; +=C2=A0 ifelse(gt_included_intl, yes, [<br>
&gt; +=C2=A0 =C2=A0 AC_REQUIRE([AM_INTL_SUBDIR])dnl<br>
&gt; +=C2=A0 ])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Prerequisites of AC_LIB_LINKFLAGS_BODY.<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_PREPARE_PREFIX])<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_RPATH])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Sometimes libintl requires libiconv, so first search for l=
ibiconv.<br>
&gt; +=C2=A0 dnl Ideally we would do this search only after the<br>
&gt; +=C2=A0 dnl=C2=A0 =C2=A0 =C2=A0 if test &quot;$USE_NLS&quot; =3D &quot=
;yes&quot;; then<br>
&gt; +=C2=A0 dnl=C2=A0 =C2=A0 =C2=A0 =C2=A0 if { eval &quot;gt_val=3D\$$gt_=
func_gnugettext_libc&quot;; test &quot;$gt_val&quot; !=3D &quot;yes&quot;; =
}; then<br>
&gt; +=C2=A0 dnl tests. But if <a href=3D"http://configure.in" rel=3D"noref=
errer" target=3D"_blank">configure.in</a> invokes AM_ICONV after AM_GNU_GET=
TEXT<br>
&gt; +=C2=A0 dnl the configure script would need to contain the same shell =
code<br>
&gt; +=C2=A0 dnl again, outside any &#39;if&#39;. There are two solutions:<=
br>
&gt; +=C2=A0 dnl - Invoke AM_ICONV_LINKFLAGS_BODY here, outside any &#39;if=
&#39;.<br>
&gt; +=C2=A0 dnl - Control the expansions in more detail using AC_PROVIDE_I=
FELSE.<br>
&gt; +=C2=A0 dnl Since AC_PROVIDE_IFELSE is not documented, we avoid it.<br=
>
&gt; +=C2=A0 ifelse(gt_included_intl, yes, , [<br>
&gt; +=C2=A0 =C2=A0 AC_REQUIRE([AM_ICONV_LINKFLAGS_BODY])<br>
&gt; +=C2=A0 ])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Sometimes, on Mac OS X, libintl requires linking with Core=
Foundation.<br>
&gt; +=C2=A0 gt_INTL_MACOSX<br>
&gt; +<br>
&gt; +=C2=A0 dnl Set USE_NLS.<br>
&gt; +=C2=A0 AC_REQUIRE([AM_NLS])<br>
&gt; +<br>
&gt; +=C2=A0 ifelse(gt_included_intl, yes, [<br>
&gt; +=C2=A0 =C2=A0 BUILD_INCLUDED_LIBINTL=3Dno<br>
&gt; +=C2=A0 =C2=A0 USE_INCLUDED_LIBINTL=3Dno<br>
&gt; +=C2=A0 ])<br>
&gt; +=C2=A0 LIBINTL=3D<br>
&gt; +=C2=A0 LTLIBINTL=3D<br>
&gt; +=C2=A0 POSUB=3D<br>
&gt; +<br>
&gt; +=C2=A0 dnl Add a version number to the cache macros.<br>
&gt; +=C2=A0 case &quot; $gt_needs &quot; in<br>
&gt; +=C2=A0 =C2=A0 *&quot; need-formatstring-macros &quot;*) gt_api_versio=
n=3D3 ;;<br>
&gt; +=C2=A0 =C2=A0 *&quot; need-ngettext &quot;*) gt_api_version=3D2 ;;<br=
>
&gt; +=C2=A0 =C2=A0 *) gt_api_version=3D1 ;;<br>
&gt; +=C2=A0 esac<br>
&gt; +=C2=A0 gt_func_gnugettext_libc=3D&quot;gt_cv_func_gnugettext${gt_api_=
version}_libc&quot;<br>
&gt; +=C2=A0 gt_func_gnugettext_libintl=3D&quot;gt_cv_func_gnugettext${gt_a=
pi_version}_libintl&quot;<br>
&gt; +<br>
&gt; +=C2=A0 dnl If we use NLS figure out what method<br>
&gt; +=C2=A0 if test &quot;$USE_NLS&quot; =3D &quot;yes&quot;; then<br>
&gt; +=C2=A0 =C2=A0 gt_use_preinstalled_gnugettext=3Dno<br>
&gt; +=C2=A0 =C2=A0 ifelse(gt_included_intl, yes, [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([whether included gettext is req=
uested])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 AC_ARG_WITH([included-gettext],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [=C2=A0 --with-included-gettext use the G=
NU gettext library included here],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 nls_cv_force_use_gnu_gettext=3D$withval,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 nls_cv_force_use_gnu_gettext=3Dno)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([$nls_cv_force_use_gnu_gettext])<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 nls_cv_use_gnu_gettext=3D&quot;$nls_cv_force_use=
_gnu_gettext&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test &quot;$nls_cv_force_use_gnu_gettext&quot=
; !=3D &quot;yes&quot;; then<br>
&gt; +=C2=A0 =C2=A0 ])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl User does not insist on using GNU NLS=
 library.=C2=A0 Figure out what<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl to use.=C2=A0 If GNU gettext is avail=
able we use this.=C2=A0 Else we have<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl to fall back to GNU NLS library.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test $gt_api_version -ge 3; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gt_revision_test_code=3D&#39;<br>
&gt; +#ifndef __GNU_GETTEXT_SUPPORTED_REVISION<br>
&gt; +#define __GNU_GETTEXT_SUPPORTED_REVISION(major) ((major) =3D=3D 0 ? 0=
 : -1)<br>
&gt; +#endif<br>
&gt; +changequote(,)dnl<br>
&gt; +typedef int array [2 * (__GNU_GETTEXT_SUPPORTED_REVISION(0) &gt;=3D 1=
) - 1];<br>
&gt; +changequote([,])dnl<br>
&gt; +&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gt_revision_test_code=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test $gt_api_version -ge 2; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gt_expression_test_code=3D&#39; + =
* ngettext (&quot;&quot;, &quot;&quot;, 0)&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gt_expression_test_code=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CACHE_CHECK([for GNU gettext in libc],=
 [$gt_func_gnugettext_libc],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LINK_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_PROGRAM(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[<br>
&gt; +#include &lt;libintl.h&gt;<br>
&gt; +#ifndef __GNU_GETTEXT_SUPPORTED_REVISION<br>
&gt; +extern int _nl_msg_cat_cntr;<br>
&gt; +extern int *_nl_domain_bindings;<br>
&gt; +#define __GNU_GETTEXT_SYMBOL_EXPRESSION (_nl_msg_cat_cntr + *_nl_doma=
in_bindings)<br>
&gt; +#else<br>
&gt; +#define __GNU_GETTEXT_SYMBOL_EXPRESSION 0<br>
&gt; +#endif<br>
&gt; +$gt_revision_test_code<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[<br>
&gt; +bindtextdomain (&quot;&quot;, &quot;&quot;);<br>
&gt; +return * gettext (&quot;&quot;)$gt_expression_test_code + __GNU_GETTE=
XT_SYMBOL_EXPRESSION<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [eval &quot;$gt_func_gnuget=
text_libc=3Dyes&quot;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [eval &quot;$gt_func_gnuget=
text_libc=3Dno&quot;])])<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if { eval &quot;gt_val=3D\$$gt_func_gnuge=
ttext_libc&quot;; test &quot;$gt_val&quot; !=3D &quot;yes&quot;; }; then<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Sometimes libintl requires lib=
iconv, so first search for libiconv.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifelse(gt_included_intl, yes, , [<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AM_ICONV_LINK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Search for libintl and define =
LIBINTL, LTLIBINTL and INCINTL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl accordingly. Don&#39;t use AC_=
LIB_LINKFLAGS_BODY([intl],[iconv])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl because that would add &quot;-=
liconv&quot; to LIBINTL and LTLIBINTL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl even if libiconv doesn&#39;t e=
xist.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LIB_LINKFLAGS_BODY([intl])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CACHE_CHECK([for GNU gettext in=
 libintl],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [$gt_func_gnugettext_libint=
l],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gt_save_CPPFLAGS=3D&quot;$C=
PPFLAGS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS =
$INCINTL&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gt_save_LIBS=3D&quot;$LIBS&=
quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$LIBS $LIBINTL=
&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Now see whether libintl=
 exists and does not depend on libiconv.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LINK_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_PROGRAM(<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[<br>
&gt; +#include &lt;libintl.h&gt;<br>
&gt; +#ifndef __GNU_GETTEXT_SUPPORTED_REVISION<br>
&gt; +extern int _nl_msg_cat_cntr;<br>
&gt; +extern<br>
&gt; +#ifdef __cplusplus<br>
&gt; +&quot;C&quot;<br>
&gt; +#endif<br>
&gt; +const char *_nl_expand_alias (const char *);<br>
&gt; +#define __GNU_GETTEXT_SYMBOL_EXPRESSION (_nl_msg_cat_cntr + *_nl_expa=
nd_alias (&quot;&quot;))<br>
&gt; +#else<br>
&gt; +#define __GNU_GETTEXT_SYMBOL_EXPRESSION 0<br>
&gt; +#endif<br>
&gt; +$gt_revision_test_code<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[<br>
&gt; +bindtextdomain (&quot;&quot;, &quot;&quot;);<br>
&gt; +return * gettext (&quot;&quot;)$gt_expression_test_code + __GNU_GETTE=
XT_SYMBOL_EXPRESSION<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]])],<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [eval &quot;$gt_func=
_gnugettext_libintl=3Dyes&quot;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [eval &quot;$gt_func=
_gnugettext_libintl=3Dno&quot;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Now see whether libintl=
 exists and depends on libiconv.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if { eval &quot;gt_val=3D\$=
$gt_func_gnugettext_libintl&quot;; test &quot;$gt_val&quot; !=3D yes; } &am=
p;&amp; test -n &quot;$LIBICONV&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$LIBS $=
LIBICONV&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LINK_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_PROG=
RAM(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
[[<br>
&gt; +#include &lt;libintl.h&gt;<br>
&gt; +#ifndef __GNU_GETTEXT_SUPPORTED_REVISION<br>
&gt; +extern int _nl_msg_cat_cntr;<br>
&gt; +extern<br>
&gt; +#ifdef __cplusplus<br>
&gt; +&quot;C&quot;<br>
&gt; +#endif<br>
&gt; +const char *_nl_expand_alias (const char *);<br>
&gt; +#define __GNU_GETTEXT_SYMBOL_EXPRESSION (_nl_msg_cat_cntr + *_nl_expa=
nd_alias (&quot;&quot;))<br>
&gt; +#else<br>
&gt; +#define __GNU_GETTEXT_SYMBOL_EXPRESSION 0<br>
&gt; +#endif<br>
&gt; +$gt_revision_test_code<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
]],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
[[<br>
&gt; +bindtextdomain (&quot;&quot;, &quot;&quot;);<br>
&gt; +return * gettext (&quot;&quot;)$gt_expression_test_code + __GNU_GETTE=
XT_SYMBOL_EXPRESSION<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [LIBINTL=3D&q=
uot;$LIBINTL $LIBICONV&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LTLIBIN=
TL=3D&quot;$LTLIBINTL $LTLIBICONV&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval &q=
uot;$gt_func_gnugettext_libintl=3Dyes&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$gt_save_C=
PPFLAGS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$gt_save_LIBS&=
quot;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl If an already present or preinstalled=
 GNU gettext() is found,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl use it.=C2=A0 But if this macro is us=
ed in GNU gettext, and GNU<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl gettext is already preinstalled in li=
bintl, we update this<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl libintl.=C2=A0 (Cf. the install rule =
in intl/Makefile.in.)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if { eval &quot;gt_val=3D\$$gt_func_gnuge=
ttext_libc&quot;; test &quot;$gt_val&quot; =3D &quot;yes&quot;; } \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| { { eval &quot;gt_val=3D\=
$$gt_func_gnugettext_libintl&quot;; test &quot;$gt_val&quot; =3D &quot;yes&=
quot;; } \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; te=
st &quot;$PACKAGE&quot; !=3D gettext-runtime \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; te=
st &quot;$PACKAGE&quot; !=3D gettext-tools; }; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gt_use_preinstalled_gnugettext=3Dy=
es<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Reset the values set by search=
ing for libintl.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBINTL=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LTLIBINTL=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INCINTL=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ifelse(gt_included_intl, yes, [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gt_use_preinstalled_gnuget=
text&quot; !=3D &quot;yes&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl GNU gettext is not found in th=
e C library.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Fall back on included GNU gett=
ext library.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nls_cv_use_gnu_gettext=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test &quot;$nls_cv_use_gnu_gettext&quot; =3D =
&quot;yes&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Mark actions used to generate GNU NLS=
 library.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILD_INCLUDED_LIBINTL=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 USE_INCLUDED_LIBINTL=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBINTL=3D&quot;ifelse([$3],[],\${top_bui=
lddir}/intl,[$3])/<a href=3D"http://libintl.la" rel=3D"noreferrer" target=
=3D"_blank">libintl.la</a> $LIBICONV $LIBTHREAD&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 LTLIBINTL=3D&quot;ifelse([$3],[],\${top_b=
uilddir}/intl,[$3])/<a href=3D"http://libintl.la" rel=3D"noreferrer" target=
=3D"_blank">libintl.la</a> $LTLIBICONV $LTLIBTHREAD&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D`echo &quot; $LIBS &quot; | sed -e=
 &#39;s/ -lintl / /&#39; -e &#39;s/^ //&#39; -e &#39;s/ $//&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 CATOBJEXT=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test &quot;$gt_use_preinstalled_gnugettext&qu=
ot; =3D &quot;yes&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| test &quot;$nls_cv_use_gnu_gette=
xt&quot; =3D &quot;yes&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Mark actions to use GNU gettext tools=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CATOBJEXT=3D.gmo<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 ])<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if test -n &quot;$INTL_MACOSX_LIBS&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test &quot;$gt_use_preinstalled_gnugettext&qu=
ot; =3D &quot;yes&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| test &quot;$nls_cv_use_gnu_gette=
xt&quot; =3D &quot;yes&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Some extra flags are needed during li=
nking.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBINTL=3D&quot;$LIBINTL $INTL_MACOSX_LIB=
S&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 LTLIBINTL=3D&quot;$LTLIBINTL $INTL_MACOSX=
_LIBS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if test &quot;$gt_use_preinstalled_gnugettext&quot; =3D=
 &quot;yes&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0|| test &quot;$nls_cv_use_gnu_gettext&quot=
; =3D &quot;yes&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 AC_DEFINE([ENABLE_NLS], [1],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [Define to 1 if translation of program me=
ssages to the user&#39;s native language<br>
&gt; +=C2=A0 =C2=A0is requested.])<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 USE_NLS=3Dno<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 AC_MSG_CHECKING([whether to use NLS])<br>
&gt; +=C2=A0 AC_MSG_RESULT([$USE_NLS])<br>
&gt; +=C2=A0 if test &quot;$USE_NLS&quot; =3D &quot;yes&quot;; then<br>
&gt; +=C2=A0 =C2=A0 AC_MSG_CHECKING([where the gettext function comes from]=
)<br>
&gt; +=C2=A0 =C2=A0 if test &quot;$gt_use_preinstalled_gnugettext&quot; =3D=
 &quot;yes&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if { eval &quot;gt_val=3D\$$gt_func_gnugettext_l=
ibintl&quot;; test &quot;$gt_val&quot; =3D &quot;yes&quot;; }; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gt_source=3D&quot;external libintl&quot;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gt_source=3D&quot;libc&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 gt_source=3D&quot;included intl directory&quot;<=
br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 AC_MSG_RESULT([$gt_source])<br>
&gt; +=C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 if test &quot;$USE_NLS&quot; =3D &quot;yes&quot;; then<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if test &quot;$gt_use_preinstalled_gnugettext&quot; =3D=
 &quot;yes&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if { eval &quot;gt_val=3D\$$gt_func_gnugettext_l=
ibintl&quot;; test &quot;$gt_val&quot; =3D &quot;yes&quot;; }; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([how to link with libintl=
])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([$LIBINTL])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LIB_APPENDTOVAR([CPPFLAGS], [$INCINTL]=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl For backward compatibility. Some packages ma=
y be using this.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 AC_DEFINE([HAVE_GETTEXT], [1],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[Define if the GNU gettext() function is a=
lready present or preinstalled.])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 AC_DEFINE([HAVE_DCGETTEXT], [1],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[Define if the GNU dcgettext() function is=
 already present or preinstalled.])<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dnl We need to process the po/ directory.<br>
&gt; +=C2=A0 =C2=A0 POSUB=3Dpo<br>
&gt; +=C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 ifelse(gt_included_intl, yes, [<br>
&gt; +=C2=A0 =C2=A0 dnl In GNU gettext we have to set BUILD_INCLUDED_LIBINT=
L to &#39;yes&#39;<br>
&gt; +=C2=A0 =C2=A0 dnl because some of the testsuite requires it.<br>
&gt; +=C2=A0 =C2=A0 BUILD_INCLUDED_LIBINTL=3Dyes<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dnl Make all variables we use known to autoconf.<br>
&gt; +=C2=A0 =C2=A0 AC_SUBST([BUILD_INCLUDED_LIBINTL])<br>
&gt; +=C2=A0 =C2=A0 AC_SUBST([USE_INCLUDED_LIBINTL])<br>
&gt; +=C2=A0 =C2=A0 AC_SUBST([CATOBJEXT])<br>
&gt; +=C2=A0 ])<br>
&gt; +<br>
&gt; +=C2=A0 dnl For backward compatibility. Some Makefiles may be using th=
is.<br>
&gt; +=C2=A0 INTLLIBS=3D&quot;$LIBINTL&quot;<br>
&gt; +=C2=A0 AC_SUBST([INTLLIBS])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Make all documented variables known to autoconf.<br>
&gt; +=C2=A0 AC_SUBST([LIBINTL])<br>
&gt; +=C2=A0 AC_SUBST([LTLIBINTL])<br>
&gt; +=C2=A0 AC_SUBST([POSUB])<br>
&gt; +])<br>
&gt; +<br>
&gt; +<br>
&gt; +dnl gt_NEEDS_INIT ensures that the gt_needs variable is initialized.<=
br>
&gt; +m4_define([gt_NEEDS_INIT],<br>
&gt; +[<br>
&gt; +=C2=A0 m4_divert_text([DEFAULTS], [gt_needs=3D])<br>
&gt; +=C2=A0 m4_define([gt_NEEDS_INIT], [])<br>
&gt; +])<br>
&gt; +<br>
&gt; +<br>
&gt; +dnl Usage: AM_GNU_GETTEXT_NEED([NEEDSYMBOL])<br>
&gt; +AC_DEFUN([AM_GNU_GETTEXT_NEED],<br>
&gt; +[<br>
&gt; +=C2=A0 m4_divert_text([INIT_PREPARE], [gt_needs=3D&quot;$gt_needs $1&=
quot;])<br>
&gt; +])<br>
&gt; +<br>
&gt; +<br>
&gt; +dnl Usage: AM_GNU_GETTEXT_VERSION([gettext-version])<br>
&gt; +AC_DEFUN([AM_GNU_GETTEXT_VERSION], [])<br>
&gt; +<br>
&gt; +<br>
&gt; +dnl Usage: AM_GNU_GETTEXT_REQUIRE_VERSION([gettext-version])<br>
&gt; +AC_DEFUN([AM_GNU_GETTEXT_REQUIRE_VERSION], [])<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/=
host-cpu-c-abi.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/acloca=
l/host-cpu-c-abi.m4<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..4407296d084<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/host-cp=
u-c-abi.m4<br>
&gt; @@ -0,0 +1,644 @@<br>
&gt; +# host-cpu-c-abi.m4 serial 11<br>
&gt; +dnl Copyright (C) 2002-2019 Free Software Foundation, Inc.<br>
&gt; +dnl This file is free software; the Free Software Foundation<br>
&gt; +dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; +dnl with or without modifications, as long as this notice is preserve=
d.<br>
&gt; +<br>
&gt; +dnl From Bruno Haible and Sam Steingold.<br>
&gt; +<br>
&gt; +dnl Sets the HOST_CPU variable to the canonical name of the CPU.<br>
&gt; +dnl Sets the HOST_CPU_C_ABI variable to the canonical name of the CPU=
 with its<br>
&gt; +dnl C language ABI (application binary interface).<br>
&gt; +dnl Also defines __${HOST_CPU}__ and __${HOST_CPU_C_ABI}__ as C macro=
s in<br>
&gt; +dnl config.h.<br>
&gt; +dnl<br>
&gt; +dnl This canonical name can be used to select a particular assembly l=
anguage<br>
&gt; +dnl source file that will interoperate with C code on the given host.=
<br>
&gt; +dnl<br>
&gt; +dnl For example:<br>
&gt; +dnl * &#39;i386&#39; and &#39;sparc&#39; are different canonical name=
s, because code for i386<br>
&gt; +dnl=C2=A0 =C2=A0will not run on SPARC CPUs and vice versa. They have =
different<br>
&gt; +dnl=C2=A0 =C2=A0instruction sets.<br>
&gt; +dnl * &#39;sparc&#39; and &#39;sparc64&#39; are different canonical n=
ames, because code for<br>
&gt; +dnl=C2=A0 =C2=A0&#39;sparc&#39; and code for &#39;sparc64&#39; cannot=
 be linked together: &#39;sparc&#39; code<br>
&gt; +dnl=C2=A0 =C2=A0contains 32-bit instructions, whereas &#39;sparc64&#3=
9; code contains 64-bit<br>
&gt; +dnl=C2=A0 =C2=A0instructions. A process on a SPARC CPU can be in 32-b=
it mode or in 64-bit<br>
&gt; +dnl=C2=A0 =C2=A0mode, but not both.<br>
&gt; +dnl * &#39;mips&#39; and &#39;mipsn32&#39; are different canonical na=
mes, because they use<br>
&gt; +dnl=C2=A0 =C2=A0different argument passing and return conventions for=
 C functions, and<br>
&gt; +dnl=C2=A0 =C2=A0although the instruction set of &#39;mips&#39; is a l=
arge subset of the<br>
&gt; +dnl=C2=A0 =C2=A0instruction set of &#39;mipsn32&#39;.<br>
&gt; +dnl * &#39;mipsn32&#39; and &#39;mips64&#39; are different canonical =
names, because they use<br>
&gt; +dnl=C2=A0 =C2=A0different sizes for the C types like &#39;int&#39; an=
d &#39;void *&#39;, and although<br>
&gt; +dnl=C2=A0 =C2=A0the instruction sets of &#39;mipsn32&#39; and &#39;mi=
ps64&#39; are the same.<br>
&gt; +dnl * The same canonical name is used for different endiannesses. You=
 can<br>
&gt; +dnl=C2=A0 =C2=A0determine the endianness through preprocessor symbols=
:<br>
&gt; +dnl=C2=A0 =C2=A0- &#39;arm&#39;: test __ARMEL__.<br>
&gt; +dnl=C2=A0 =C2=A0- &#39;mips&#39;, &#39;mipsn32&#39;, &#39;mips64&#39;=
: test _MIPSEB vs. _MIPSEL.<br>
&gt; +dnl=C2=A0 =C2=A0- &#39;powerpc64&#39;: test _BIG_ENDIAN vs. _LITTLE_E=
NDIAN.<br>
&gt; +dnl * The same name &#39;i386&#39; is used for CPUs of type i386, i48=
6, i586<br>
&gt; +dnl=C2=A0 =C2=A0(Pentium), AMD K7, Pentium II, Pentium IV, etc., beca=
use<br>
&gt; +dnl=C2=A0 =C2=A0- Instructions that do not exist on all of these CPUs=
 (cmpxchg,<br>
&gt; +dnl=C2=A0 =C2=A0 =C2=A0MMX, SSE, SSE2, 3DNow! etc.) are not frequentl=
y used. If your<br>
&gt; +dnl=C2=A0 =C2=A0 =C2=A0assembly language source files use such instru=
ctions, you will<br>
&gt; +dnl=C2=A0 =C2=A0 =C2=A0need to make the distinction.<br>
&gt; +dnl=C2=A0 =C2=A0- Speed of execution of the common instruction set is=
 reasonable across<br>
&gt; +dnl=C2=A0 =C2=A0 =C2=A0the entire family of CPUs. If you have assembl=
y language source files<br>
&gt; +dnl=C2=A0 =C2=A0 =C2=A0that are optimized for particular CPU types (l=
ike GNU gmp has), you<br>
&gt; +dnl=C2=A0 =C2=A0 =C2=A0will need to make the distinction.<br>
&gt; +dnl=C2=A0 =C2=A0See &lt;<a href=3D"https://en.wikipedia.org/wiki/X86_=
instruction_listings" rel=3D"noreferrer" target=3D"_blank">https://en.wikip=
edia.org/wiki/X86_instruction_listings</a>&gt;.<br>
&gt; +AC_DEFUN([gl_HOST_CPU_C_ABI],<br>
&gt; +[<br>
&gt; +=C2=A0 AC_REQUIRE([AC_CANONICAL_HOST])<br>
&gt; +=C2=A0 AC_REQUIRE([gl_C_ASM])<br>
&gt; +=C2=A0 AC_CACHE_CHECK([host CPU and C ABI], [gl_cv_host_cpu_c_abi],<b=
r>
&gt; +=C2=A0 =C2=A0 [case &quot;$host_cpu&quot; in<br>
&gt; +<br>
&gt; +changequote(,)dnl<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i[4567]86 )<br>
&gt; +changequote([,])dnl<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_host_cpu_c_abi=3Di386<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# On x86_64 systems, the C compiler=
 may be generating code in one of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# these ABIs:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - 64-bit instruction set, 64-bit =
pointers, 64-bit &#39;long&#39;: x86_64.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - 64-bit instruction set, 64-bit =
pointers, 32-bit &#39;long&#39;: x86_64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0with native Windows (=
mingw, MSVC).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - 64-bit instruction set, 32-bit =
pointers, 32-bit &#39;long&#39;: x86_64-x32.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - 32-bit instruction set, 32-bit =
pointers, 32-bit &#39;long&#39;: i386.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if (defined __x86=
_64__ || defined __amd64__ \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|| defined _M_X64 || defined _M_AMD64)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ok;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error f=
ail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[#if d=
efined __ILP32__ || defined _ILP32<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]])],<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_host_cpu_c_ab=
i=3Dx86_64-x32],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_host_cpu_c_ab=
i=3Dx86_64])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=3Di386=
])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +changequote(,)dnl<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0alphaev[4-8] | alphaev56 | alphapca5[67] |=
 alphaev6[78] )<br>
&gt; +changequote([,])dnl<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_host_cpu_c_abi=3Dalpha<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0arm* | aarch64 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Assume arm with EABI.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# On arm64 systems, the C compiler =
may be generating code in one of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# these ABIs:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - aarch64 instruction set, 64-bit=
 pointers, 64-bit &#39;long&#39;: arm64.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - aarch64 instruction set, 32-bit=
 pointers, 32-bit &#39;long&#39;: arm64-ilp32.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - 32-bit instruction set, 32-bit =
pointers, 32-bit &#39;long&#39;: arm or armhf.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#ifdef __aarch64__=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ok;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error f=
ail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined=
 __ILP32__ || defined _ILP32<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_host_cpu_c_ab=
i=3Darm64-ilp32],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_host_cpu_c_ab=
i=3Darm64])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[# Don&#39;t distinguish lit=
tle-endian and big-endian arm, since they<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # don&#39;t require differe=
nt machine code for simple operations and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # since the user can distin=
guish them through the preprocessor<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # defines __ARMEL__ vs. __A=
RMEB__.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # But distinguish arm which=
 passes floating-point arguments and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # return values in integer =
registers (r0, r1, ...) - this is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # gcc -mfloat-abi=3Dsoft or=
 gcc -mfloat-abi=3Dsoftfp - from arm which<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # passes them in float regi=
sters (s0, s1, ...) and double registers<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # (d0, d1, ...) - this is g=
cc -mfloat-abi=3Dhard. GCC 4.6 or newer<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # sets the preprocessor def=
ines __ARM_PCS (for the first case) and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # __ARM_PCS_VFP (for the se=
cond case), but older GCC does not.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;double ddd; void =
func (double dd) { ddd =3D dd; }&#39; &gt; conftest.c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Look for a reference to t=
he register d0 in the .s file.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_COMMAND(${CC-cc} $CF=
LAGS $CPPFLAGS $gl_c_asm_opt conftest.c) &gt;/dev/null 2&gt;&amp;1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if LC_ALL=3DC grep &#39;d0,=
&#39; conftest.$gl_asmext &gt;/dev/null; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_host_cpu_c_abi=
=3Darmhf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gl_cv_host_cpu_c_abi=
=3Darm<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f conftest*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hppa1.0 | hppa1.1 | hppa2.0* | hppa64 )<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# On hppa, the C compiler may be ge=
nerating 32-bit code or 64-bit<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# code. In the latter case, it defi=
nes _LP64 and __LP64__.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#ifdef __LP64__<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ok;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error f=
ail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=3Dhppa=
64],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=3Dhppa=
])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ia64* )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# On ia64 on HP-UX, the C compiler =
may be generating 64-bit code or<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# 32-bit code. In the latter case, =
it defines _ILP32.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#ifdef _ILP32<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ok;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error f=
ail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=3Dia64=
-ilp32],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=3Dia64=
])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mips* )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We should also check for (_MIPS_S=
ZPTR =3D=3D 64), but gcc keeps this<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# at 32.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined _MIPS_=
SZLONG &amp;&amp; (_MIPS_SZLONG =3D=3D 64)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ok;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error f=
ail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=3Dmips=
64],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[# In the n32 ABI, _ABIN32 i=
s defined, _ABIO32 is not defined (but<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # may later get defined by =
&lt;sgidefs.h&gt;), and _MIPS_SIM =3D=3D _ABIN32.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # In the 32 ABI, _ABIO32 is=
 defined, _ABIN32 is not defined (but<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # may later get defined by =
&lt;sgidefs.h&gt;), and _MIPS_SIM =3D=3D _ABIO32.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[#if (=
_MIPS_SIM =3D=3D _ABIN32)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]])],<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_host_cpu_c_ab=
i=3Dmipsn32],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_host_cpu_c_ab=
i=3Dmips])])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc* )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Different ABIs are in use on AIX =
vs. Mac OS X vs. Linux,*BSD.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# No need to distinguish them here;=
 the caller may distinguish<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# them based on the OS.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# On powerpc64 systems, the C compi=
ler may still be generating<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# 32-bit code. And on powerpc-ibm-a=
ix systems, the C compiler may<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# be generating 64-bit code.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined __powe=
rpc64__ || defined _ARCH_PPC64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ok;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error f=
ail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[# On powerpc64, there are t=
wo ABIs on Linux: The AIX compatible<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # one and the ELFv2 one. Th=
e latter defines _CALL_ELF=3D2.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[#if d=
efined _CALL_ELF &amp;&amp; _CALL_ELF =3D=3D 2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]])],<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_host_cpu_c_ab=
i=3Dpowerpc64-elfv2],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [gl_cv_host_cpu_c_ab=
i=3Dpowerpc64])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=3Dpowe=
rpc])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rs6000 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_host_cpu_c_abi=3Dpowerpc<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0riscv32 | riscv64 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# There are 2 architectures (with v=
ariants): rv32* and rv64*.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if __riscv_xlen =
=3D=3D 64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ok=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error =
fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[cpu=3Driscv64],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[cpu=3Driscv32])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# There are 6 ABIs: ilp32, ilp32f, =
ilp32d, lp64, lp64f, lp64d.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Size of &#39;long&#39; and &#39;v=
oid *&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined __LP64=
__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ok=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error =
fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[main_abi=3Dlp64],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[main_abi=3Dilp32])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Float ABIs:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# __riscv_float_abi_double:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0&#39;float&#39; and &=
#39;double&#39; are passed in floating-point registers.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# __riscv_float_abi_single:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0&#39;float&#39; are p=
assed in floating-point registers.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# __riscv_float_abi_soft:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0No values are passed =
in floating-point registers.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined __risc=
v_float_abi_double<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ok=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error =
fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[float_abi=3Dd],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[#if d=
efined __riscv_float_abi_single<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]])],<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [float_abi=3Df],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [float_abi=3D&#39;&#=
39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_host_cpu_c_abi=3D&quot;${cpu}=
-${main_abi}${float_abi}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0s390* )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# On s390x, the C compiler may be g=
enerating 64-bit (=3D s390x) code<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# or 31-bit (=3D s390) code.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined __LP64=
__ || defined __s390x__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ok=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error =
fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=3Ds390=
x],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=3Ds390=
])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sparc | sparc64 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# UltraSPARCs running Linux have `u=
name -m` =3D &quot;sparc64&quot;, but the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# C compiler still generates 32-bit=
 code.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined __spar=
cv9 || defined __arch64__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ok;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error f=
ail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=3Dspar=
c64],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=3Dspar=
c])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_host_cpu_c_abi=3D&quot;$host_=
cpu&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0esac<br>
&gt; +=C2=A0 =C2=A0 ])<br>
&gt; +<br>
&gt; +=C2=A0 dnl In most cases, $HOST_CPU and $HOST_CPU_C_ABI are the same.=
<br>
&gt; +=C2=A0 HOST_CPU=3D`echo &quot;$gl_cv_host_cpu_c_abi&quot; | sed -e &#=
39;s/-.*//&#39;`<br>
&gt; +=C2=A0 HOST_CPU_C_ABI=3D&quot;$gl_cv_host_cpu_c_abi&quot;<br>
&gt; +=C2=A0 AC_SUBST([HOST_CPU])<br>
&gt; +=C2=A0 AC_SUBST([HOST_CPU_C_ABI])<br>
&gt; +<br>
&gt; +=C2=A0 # This was<br>
&gt; +=C2=A0 #=C2=A0 =C2=A0AC_DEFINE_UNQUOTED([__${HOST_CPU}__])<br>
&gt; +=C2=A0 #=C2=A0 =C2=A0AC_DEFINE_UNQUOTED([__${HOST_CPU_C_ABI}__])<br>
&gt; +=C2=A0 # earlier, but KAI C++ 3.2d doesn&#39;t like this.<br>
&gt; +=C2=A0 sed -e &#39;s/-/_/g&#39; &gt;&gt; confdefs.h &lt;&lt;EOF<br>
&gt; +#ifndef __${HOST_CPU}__<br>
&gt; +#define __${HOST_CPU}__ 1<br>
&gt; +#endif<br>
&gt; +#ifndef __${HOST_CPU_C_ABI}__<br>
&gt; +#define __${HOST_CPU_C_ABI}__ 1<br>
&gt; +#endif<br>
&gt; +EOF<br>
&gt; +=C2=A0 AH_TOP([/* CPU and C ABI indicator */<br>
&gt; +#ifndef __i386__<br>
&gt; +#undef __i386__<br>
&gt; +#endif<br>
&gt; +#ifndef __x86_64_x32__<br>
&gt; +#undef __x86_64_x32__<br>
&gt; +#endif<br>
&gt; +#ifndef __x86_64__<br>
&gt; +#undef __x86_64__<br>
&gt; +#endif<br>
&gt; +#ifndef __alpha__<br>
&gt; +#undef __alpha__<br>
&gt; +#endif<br>
&gt; +#ifndef __arm__<br>
&gt; +#undef __arm__<br>
&gt; +#endif<br>
&gt; +#ifndef __armhf__<br>
&gt; +#undef __armhf__<br>
&gt; +#endif<br>
&gt; +#ifndef __arm64_ilp32__<br>
&gt; +#undef __arm64_ilp32__<br>
&gt; +#endif<br>
&gt; +#ifndef __arm64__<br>
&gt; +#undef __arm64__<br>
&gt; +#endif<br>
&gt; +#ifndef __hppa__<br>
&gt; +#undef __hppa__<br>
&gt; +#endif<br>
&gt; +#ifndef __hppa64__<br>
&gt; +#undef __hppa64__<br>
&gt; +#endif<br>
&gt; +#ifndef __ia64_ilp32__<br>
&gt; +#undef __ia64_ilp32__<br>
&gt; +#endif<br>
&gt; +#ifndef __ia64__<br>
&gt; +#undef __ia64__<br>
&gt; +#endif<br>
&gt; +#ifndef __m68k__<br>
&gt; +#undef __m68k__<br>
&gt; +#endif<br>
&gt; +#ifndef __mips__<br>
&gt; +#undef __mips__<br>
&gt; +#endif<br>
&gt; +#ifndef __mipsn32__<br>
&gt; +#undef __mipsn32__<br>
&gt; +#endif<br>
&gt; +#ifndef __mips64__<br>
&gt; +#undef __mips64__<br>
&gt; +#endif<br>
&gt; +#ifndef __powerpc__<br>
&gt; +#undef __powerpc__<br>
&gt; +#endif<br>
&gt; +#ifndef __powerpc64__<br>
&gt; +#undef __powerpc64__<br>
&gt; +#endif<br>
&gt; +#ifndef __powerpc64_elfv2__<br>
&gt; +#undef __powerpc64_elfv2__<br>
&gt; +#endif<br>
&gt; +#ifndef __riscv32__<br>
&gt; +#undef __riscv32__<br>
&gt; +#endif<br>
&gt; +#ifndef __riscv64__<br>
&gt; +#undef __riscv64__<br>
&gt; +#endif<br>
&gt; +#ifndef __riscv32_ilp32__<br>
&gt; +#undef __riscv32_ilp32__<br>
&gt; +#endif<br>
&gt; +#ifndef __riscv32_ilp32f__<br>
&gt; +#undef __riscv32_ilp32f__<br>
&gt; +#endif<br>
&gt; +#ifndef __riscv32_ilp32d__<br>
&gt; +#undef __riscv32_ilp32d__<br>
&gt; +#endif<br>
&gt; +#ifndef __riscv64_ilp32__<br>
&gt; +#undef __riscv64_ilp32__<br>
&gt; +#endif<br>
&gt; +#ifndef __riscv64_ilp32f__<br>
&gt; +#undef __riscv64_ilp32f__<br>
&gt; +#endif<br>
&gt; +#ifndef __riscv64_ilp32d__<br>
&gt; +#undef __riscv64_ilp32d__<br>
&gt; +#endif<br>
&gt; +#ifndef __riscv64_lp64__<br>
&gt; +#undef __riscv64_lp64__<br>
&gt; +#endif<br>
&gt; +#ifndef __riscv64_lp64f__<br>
&gt; +#undef __riscv64_lp64f__<br>
&gt; +#endif<br>
&gt; +#ifndef __riscv64_lp64d__<br>
&gt; +#undef __riscv64_lp64d__<br>
&gt; +#endif<br>
&gt; +#ifndef __s390__<br>
&gt; +#undef __s390__<br>
&gt; +#endif<br>
&gt; +#ifndef __s390x__<br>
&gt; +#undef __s390x__<br>
&gt; +#endif<br>
&gt; +#ifndef __sh__<br>
&gt; +#undef __sh__<br>
&gt; +#endif<br>
&gt; +#ifndef __sparc__<br>
&gt; +#undef __sparc__<br>
&gt; +#endif<br>
&gt; +#ifndef __sparc64__<br>
&gt; +#undef __sparc64__<br>
&gt; +#endif<br>
&gt; +])<br>
&gt; +<br>
&gt; +])<br>
&gt; +<br>
&gt; +<br>
&gt; +dnl Sets the HOST_CPU_C_ABI_32BIT variable to &#39;yes&#39; if the C =
language ABI<br>
&gt; +dnl (application binary interface) is a 32-bit one, or to &#39;no&#39=
; otherwise.<br>
&gt; +dnl This is a simplified variant of gl_HOST_CPU_C_ABI.<br>
&gt; +AC_DEFUN([gl_HOST_CPU_C_ABI_32BIT],<br>
&gt; +[<br>
&gt; +=C2=A0 AC_REQUIRE([AC_CANONICAL_HOST])<br>
&gt; +=C2=A0 AC_CACHE_CHECK([32-bit host C ABI], [gl_cv_host_cpu_c_abi_32bi=
t],<br>
&gt; +=C2=A0 =C2=A0 [if test -n &quot;$gl_cv_host_cpu_c_abi&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$gl_cv_host_cpu_c_abi&quot; in<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i386 | x86_64-x32 | arm | armhf | a=
rm64-ilp32 | hppa | ia64-ilp32 | mips | mipsn32 | powerpc | riscv*-ilp32* |=
 s390 | sparc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_host_cpu_c_abi_32bit=
=3Dyes ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_host_cpu_c_abi_32bit=
=3Dno ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$host_cpu&quot; in<br>
&gt; +<br>
&gt; +changequote(,)dnl<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i[4567]86 )<br>
&gt; +changequote([,])dnl<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_host_cpu_c_abi_32bit=
=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# On x86_64 systems, the C c=
ompiler may be generating code in one of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# these ABIs:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - 64-bit instruction set, =
64-bit pointers, 64-bit &#39;long&#39;: x86_64.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - 64-bit instruction set, =
64-bit pointers, 32-bit &#39;long&#39;: x86_64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0with native Wi=
ndows (mingw, MSVC).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - 64-bit instruction set, =
32-bit pointers, 32-bit &#39;long&#39;: x86_64-x32.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - 32-bit instruction set, =
32-bit pointers, 32-bit &#39;long&#39;: i386.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if (define=
d __x86_64__ || defined __amd64__ \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|| defined _M_X64 || defined _M_AMD64) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &amp;&amp; !(defined __ILP32__ || defined _ILP32)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dno],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dyes])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm* | aarch64 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Assume arm with EABI.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# On arm64 systems, the C co=
mpiler may be generating code in one of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# these ABIs:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - aarch64 instruction set,=
 64-bit pointers, 64-bit &#39;long&#39;: arm64.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - aarch64 instruction set,=
 32-bit pointers, 32-bit &#39;long&#39;: arm64-ilp32.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# - 32-bit instruction set, =
32-bit pointers, 32-bit &#39;long&#39;: arm or armhf.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined=
 __aarch64__ &amp;&amp; !(defined __ILP32__ || defined _ILP32)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dno],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dyes])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hppa1.0 | hppa1.1 | hppa2.0* | hppa=
64 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# On hppa, the C compiler ma=
y be generating 32-bit code or 64-bit<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# code. In the latter case, =
it defines _LP64 and __LP64__.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#ifdef __LP=
64__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dno],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dyes])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ia64* )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# On ia64 on HP-UX, the C co=
mpiler may be generating 64-bit code or<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# 32-bit code. In the latter=
 case, it defines _ILP32.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#ifdef _ILP=
32<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dyes],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dno])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mips* )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We should also check for (=
_MIPS_SZPTR =3D=3D 64), but gcc keeps this<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# at 32.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined=
 _MIPS_SZLONG &amp;&amp; (_MIPS_SZLONG =3D=3D 64)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dno],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dyes])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc* )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Different ABIs are in use =
on AIX vs. Mac OS X vs. Linux,*BSD.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# No need to distinguish the=
m here; the caller may distinguish<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# them based on the OS.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# On powerpc64 systems, the =
C compiler may still be generating<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# 32-bit code. And on powerp=
c-ibm-aix systems, the C compiler may<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# be generating 64-bit code.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined=
 __powerpc64__ || defined _ARCH_PPC64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dno],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dyes])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rs6000 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_host_cpu_c_abi_32bit=
=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv32 | riscv64 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# There are 6 ABIs: ilp32, i=
lp32f, ilp32d, lp64, lp64f, lp64d.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Size of &#39;long&#39; and=
 &#39;void *&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined=
 __LP64__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dno],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dyes])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s390* )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# On s390x, the C compiler m=
ay be generating 64-bit (=3D s390x) code<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# or 31-bit (=3D s390) code.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined=
 __LP64__ || defined __s390x__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dno],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dyes])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sparc | sparc64 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# UltraSPARCs running Linux =
have `uname -m` =3D &quot;sparc64&quot;, but the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# C compiler still generates=
 32-bit code.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#if defined=
 __sparcv9 || defined __arch64__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
error fail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dno],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_host_cpu_c_abi=
_32bit=3Dyes])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl_cv_host_cpu_c_abi_32bit=
=3Dno<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 ])<br>
&gt; +<br>
&gt; +=C2=A0 HOST_CPU_C_ABI_32BIT=3D&quot;$gl_cv_host_cpu_c_abi_32bit&quot;=
<br>
&gt; +])<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/=
iconv.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m=
4<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..a285e9daa5e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m=
4<br>
&gt; @@ -0,0 +1,288 @@<br>
&gt; +# iconv.m4 serial 21<br>
&gt; +dnl Copyright (C) 2000-2002, 2007-2014, 2016-2019 Free Software Found=
ation,<br>
&gt; +dnl Inc.<br>
&gt; +dnl This file is free software; the Free Software Foundation<br>
&gt; +dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; +dnl with or without modifications, as long as this notice is preserve=
d.<br>
&gt; +<br>
&gt; +dnl From Bruno Haible.<br>
&gt; +<br>
&gt; +AC_DEFUN([AM_ICONV_LINKFLAGS_BODY],<br>
&gt; +[<br>
&gt; +=C2=A0 dnl Prerequisites of AC_LIB_LINKFLAGS_BODY.<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_PREPARE_PREFIX])<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_RPATH])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Search for libiconv and define LIBICONV, LTLIBICONV and IN=
CICONV<br>
&gt; +=C2=A0 dnl accordingly.<br>
&gt; +=C2=A0 AC_LIB_LINKFLAGS_BODY([iconv])<br>
&gt; +])<br>
&gt; +<br>
&gt; +AC_DEFUN([AM_ICONV_LINK],<br>
&gt; +[<br>
&gt; +=C2=A0 dnl Some systems have iconv in libc, some have it in libiconv =
(OSF/1 and<br>
&gt; +=C2=A0 dnl those with the standalone portable GNU libiconv installed)=
.<br>
&gt; +=C2=A0 AC_REQUIRE([AC_CANONICAL_HOST]) dnl for cross-compiles<br>
&gt; +<br>
&gt; +=C2=A0 dnl Search for libiconv and define LIBICONV, LTLIBICONV and IN=
CICONV<br>
&gt; +=C2=A0 dnl accordingly.<br>
&gt; +=C2=A0 AC_REQUIRE([AM_ICONV_LINKFLAGS_BODY])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Add $INCICONV to CPPFLAGS before performing the following =
checks,<br>
&gt; +=C2=A0 dnl because if the user has installed libiconv and not disable=
d its use<br>
&gt; +=C2=A0 dnl via --without-libiconv-prefix, he wants to use it. The fir=
st<br>
&gt; +=C2=A0 dnl AC_LINK_IFELSE will then fail, the second AC_LINK_IFELSE w=
ill succeed.<br>
&gt; +=C2=A0 am_save_CPPFLAGS=3D&quot;$CPPFLAGS&quot;<br>
&gt; +=C2=A0 AC_LIB_APPENDTOVAR([CPPFLAGS], [$INCICONV])<br>
&gt; +<br>
&gt; +=C2=A0 AC_CACHE_CHECK([for iconv], [am_cv_func_iconv], [<br>
&gt; +=C2=A0 =C2=A0 am_cv_func_iconv=3D&quot;no, consider installing GNU li=
biconv&quot;<br>
&gt; +=C2=A0 =C2=A0 am_cv_lib_iconv=3Dno<br>
&gt; +=C2=A0 =C2=A0 AC_LINK_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 [AC_LANG_PROGRAM(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[<br>
&gt; +#include &lt;stdlib.h&gt;<br>
&gt; +#include &lt;iconv.h&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[iconv_t cd =3D iconv_open(&quot;&=
quot;,&quot;&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iconv(cd,NULL,NULL,NULL,NULL=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iconv_close(cd);]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 [am_cv_func_iconv=3Dyes])<br>
&gt; +=C2=A0 =C2=A0 if test &quot;$am_cv_func_iconv&quot; !=3D yes; then<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 am_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$LIBS $LIBICONV&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 AC_LINK_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_PROGRAM(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[<br>
&gt; +#include &lt;stdlib.h&gt;<br>
&gt; +#include &lt;iconv.h&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[iconv_t cd =3D iconv_open(=
&quot;&quot;,&quot;&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iconv(cd,NULL,NULL,NU=
LL,NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iconv_close(cd);]])],=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [am_cv_lib_iconv=3Dyes]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [am_cv_func_iconv=3Dyes])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$am_save_LIBS&quot;<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 ])<br>
&gt; +=C2=A0 if test &quot;$am_cv_func_iconv&quot; =3D yes; then<br>
&gt; +=C2=A0 =C2=A0 AC_CACHE_CHECK([for working iconv], [am_cv_func_iconv_w=
orks], [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl This tests against bugs in AIX 5.1, AIX 6.1.=
.7.1, HP-UX 11.11,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl Solaris 10.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 am_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test $am_cv_lib_iconv =3D yes; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$LIBS $LIBICONV&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 am_cv_func_iconv_works=3Dno<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for ac_iconv_const in &#39;&#39; &#39;const&#39;=
; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_RUN_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_PROGRAM(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[<br>
&gt; +#include &lt;iconv.h&gt;<br>
&gt; +#include &lt;string.h&gt;<br>
&gt; +<br>
&gt; +#ifndef ICONV_CONST<br>
&gt; +# define ICONV_CONST $ac_iconv_const<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[int result =3D 0;<b=
r>
&gt; +=C2=A0 /* Test against AIX 5.1 bug: Failures are not distinguishable =
from successful<br>
&gt; +=C2=A0 =C2=A0 =C2=A0returns.=C2=A0 */<br>
&gt; +=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 iconv_t cd_utf8_to_88591 =3D iconv_open (&quot;ISO8859-=
1&quot;, &quot;UTF-8&quot;);<br>
&gt; +=C2=A0 =C2=A0 if (cd_utf8_to_88591 !=3D (iconv_t)(-1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 static ICONV_CONST char input[] =3D &quot=
;\342\202\254&quot;; /* EURO SIGN */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char buf[10];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ICONV_CONST char *inptr =3D input;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t inbytesleft =3D strlen (input);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *outptr =3D buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t outbytesleft =3D sizeof (buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t res =3D iconv (cd_utf8_to_88591,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;inptr, &amp;inbytesleft,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;outptr, &amp;outbytesleft);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result |=3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iconv_close (cd_utf8_to_88591);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 }<br>
&gt; +=C2=A0 /* Test against Solaris 10 bug: Failures are not distinguishab=
le from<br>
&gt; +=C2=A0 =C2=A0 =C2=A0successful returns.=C2=A0 */<br>
&gt; +=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 iconv_t cd_ascii_to_88591 =3D iconv_open (&quot;ISO8859=
-1&quot;, &quot;646&quot;);<br>
&gt; +=C2=A0 =C2=A0 if (cd_ascii_to_88591 !=3D (iconv_t)(-1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 static ICONV_CONST char input[] =3D &quot=
;\263&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char buf[10];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ICONV_CONST char *inptr =3D input;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t inbytesleft =3D strlen (input);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *outptr =3D buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t outbytesleft =3D sizeof (buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t res =3D iconv (cd_ascii_to_88591,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;inptr, &amp;inbytesleft,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;outptr, &amp;outbytesleft);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result |=3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iconv_close (cd_ascii_to_88591);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 }<br>
&gt; +=C2=A0 /* Test against AIX 6.1..7.1 bug: Buffer overrun.=C2=A0 */<br>
&gt; +=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 iconv_t cd_88591_to_utf8 =3D iconv_open (&quot;UTF-8&qu=
ot;, &quot;ISO-8859-1&quot;);<br>
&gt; +=C2=A0 =C2=A0 if (cd_88591_to_utf8 !=3D (iconv_t)(-1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 static ICONV_CONST char input[] =3D &quot=
;\304&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 static char buf[2] =3D { (char)0xDE, (cha=
r)0xAD };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ICONV_CONST char *inptr =3D input;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t inbytesleft =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *outptr =3D buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t outbytesleft =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t res =3D iconv (cd_88591_to_utf8,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;inptr, &amp;inbytesleft,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;outptr, &amp;outbytesleft);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res !=3D (size_t)(-1) || outptr - buf=
 &gt; 1 || buf[1] !=3D (char)0xAD)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result |=3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iconv_close (cd_88591_to_utf8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 }<br>
&gt; +#if 0 /* This bug could be worked around by the caller.=C2=A0 */<br>
&gt; +=C2=A0 /* Test against HP-UX 11.11 bug: Positive return value instead=
 of 0.=C2=A0 */<br>
&gt; +=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 iconv_t cd_88591_to_utf8 =3D iconv_open (&quot;utf8&quo=
t;, &quot;iso88591&quot;);<br>
&gt; +=C2=A0 =C2=A0 if (cd_88591_to_utf8 !=3D (iconv_t)(-1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 static ICONV_CONST char input[] =3D &quot=
;\304rger mit b\366sen B\374bchen ohne Augenma\337&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char buf[50];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ICONV_CONST char *inptr =3D input;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t inbytesleft =3D strlen (input);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *outptr =3D buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t outbytesleft =3D sizeof (buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t res =3D iconv (cd_88591_to_utf8,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;inptr, &amp;inbytesleft,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;outptr, &amp;outbytesleft);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((int)res &gt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result |=3D 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iconv_close (cd_88591_to_utf8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 }<br>
&gt; +#endif<br>
&gt; +=C2=A0 /* Test against HP-UX 11.11 bug: No converter from EUC-JP to U=
TF-8 is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0provided.=C2=A0 */<br>
&gt; +=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 /* Try standardized names.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 iconv_t cd1 =3D iconv_open (&quot;UTF-8&quot;, &quot;EU=
C-JP&quot;);<br>
&gt; +=C2=A0 =C2=A0 /* Try IRIX, OSF/1 names.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 iconv_t cd2 =3D iconv_open (&quot;UTF-8&quot;, &quot;eu=
cJP&quot;);<br>
&gt; +=C2=A0 =C2=A0 /* Try AIX names.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 iconv_t cd3 =3D iconv_open (&quot;UTF-8&quot;, &quot;IB=
M-eucJP&quot;);<br>
&gt; +=C2=A0 =C2=A0 /* Try HP-UX names.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 iconv_t cd4 =3D iconv_open (&quot;utf8&quot;, &quot;euc=
JP&quot;);<br>
&gt; +=C2=A0 =C2=A0 if (cd1 =3D=3D (iconv_t)(-1) &amp;&amp; cd2 =3D=3D (ico=
nv_t)(-1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; cd3 =3D=3D (iconv_t)(-1) &amp;=
&amp; cd4 =3D=3D (iconv_t)(-1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 result |=3D 16;<br>
&gt; +=C2=A0 =C2=A0 if (cd1 !=3D (iconv_t)(-1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 iconv_close (cd1);<br>
&gt; +=C2=A0 =C2=A0 if (cd2 !=3D (iconv_t)(-1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 iconv_close (cd2);<br>
&gt; +=C2=A0 =C2=A0 if (cd3 !=3D (iconv_t)(-1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 iconv_close (cd3);<br>
&gt; +=C2=A0 =C2=A0 if (cd4 !=3D (iconv_t)(-1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 iconv_close (cd4);<br>
&gt; +=C2=A0 }<br>
&gt; +=C2=A0 return result;<br>
&gt; +]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [am_cv_func_iconv_works=3Dyes], ,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [case &quot;$host_os&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aix* | hpux*) am_cv_f=
unc_iconv_works=3D&quot;guessing no&quot; ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 am_cv_func_iconv_works=3D&quot;guessing yes&quot; =
;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 test &quot;$am_cv_func_iconv_works&quot; =
=3D no || break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$am_save_LIBS&quot;<br>
&gt; +=C2=A0 =C2=A0 ])<br>
&gt; +=C2=A0 =C2=A0 case &quot;$am_cv_func_iconv_works&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *no) am_func_iconv=3Dno am_cv_lib_iconv=3Dno ;;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *)=C2=A0 =C2=A0am_func_iconv=3Dyes ;;<br>
&gt; +=C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 am_func_iconv=3Dno am_cv_lib_iconv=3Dno<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 if test &quot;$am_func_iconv&quot; =3D yes; then<br>
&gt; +=C2=A0 =C2=A0 AC_DEFINE([HAVE_ICONV], [1],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 [Define if you have the iconv() function and it =
works.])<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 if test &quot;$am_cv_lib_iconv&quot; =3D yes; then<br>
&gt; +=C2=A0 =C2=A0 AC_MSG_CHECKING([how to link with libiconv])<br>
&gt; +=C2=A0 =C2=A0 AC_MSG_RESULT([$LIBICONV])<br>
&gt; +=C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 dnl If $LIBICONV didn&#39;t lead to a usable library, w=
e don&#39;t need $INCICONV<br>
&gt; +=C2=A0 =C2=A0 dnl either.<br>
&gt; +=C2=A0 =C2=A0 CPPFLAGS=3D&quot;$am_save_CPPFLAGS&quot;<br>
&gt; +=C2=A0 =C2=A0 LIBICONV=3D<br>
&gt; +=C2=A0 =C2=A0 LTLIBICONV=3D<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 AC_SUBST([LIBICONV])<br>
&gt; +=C2=A0 AC_SUBST([LTLIBICONV])<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl Define AM_ICONV using AC_DEFUN_ONCE for Autoconf &gt;=3D 2.64, in=
 order to<br>
&gt; +dnl avoid warnings like<br>
&gt; +dnl &quot;warning: AC_REQUIRE: `AM_ICONV&#39; was expanded before it =
was required&quot;.<br>
&gt; +dnl This is tricky because of the way &#39;aclocal&#39; is implemente=
d:<br>
&gt; +dnl - It requires defining an auxiliary macro whose name ends in AC_D=
EFUN.<br>
&gt; +dnl=C2=A0 =C2=A0Otherwise aclocal&#39;s initial scan pass would miss =
the macro definition.<br>
&gt; +dnl - It requires a line break inside the AC_DEFUN_ONCE and AC_DEFUN =
expansions.<br>
&gt; +dnl=C2=A0 =C2=A0Otherwise aclocal would emit many &quot;Use of uninit=
ialized value $1&quot;<br>
&gt; +dnl=C2=A0 =C2=A0warnings.<br>
&gt; +m4_define([gl_iconv_AC_DEFUN],<br>
&gt; +=C2=A0 m4_version_prereq([2.64],<br>
&gt; +=C2=A0 =C2=A0 [[AC_DEFUN_ONCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [$1], [$2])]],<br>
&gt; +=C2=A0 =C2=A0 [m4_ifdef([gl_00GNULIB],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[[AC_DEFUN_ONCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[$1], [$2])]],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[[AC_DEFUN(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[$1], [$2])]])]))<br>
&gt; +gl_iconv_AC_DEFUN([AM_ICONV],<br>
&gt; +[<br>
&gt; +=C2=A0 AM_ICONV_LINK<br>
&gt; +=C2=A0 if test &quot;$am_cv_func_iconv&quot; =3D yes; then<br>
&gt; +=C2=A0 =C2=A0 AC_MSG_CHECKING([for iconv declaration])<br>
&gt; +=C2=A0 =C2=A0 AC_CACHE_VAL([am_cv_proto_iconv], [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_PROGRAM(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[<br>
&gt; +#include &lt;stdlib.h&gt;<br>
&gt; +#include &lt;iconv.h&gt;<br>
&gt; +extern<br>
&gt; +#ifdef __cplusplus<br>
&gt; +&quot;C&quot;<br>
&gt; +#endif<br>
&gt; +#if defined(__STDC__) || defined(_MSC_VER) || defined(__cplusplus)<br=
>
&gt; +size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * =
*outbuf, size_t *outbytesleft);<br>
&gt; +#else<br>
&gt; +size_t iconv();<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [am_cv_proto_iconv_arg1=3D&quot;&quot;],<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [am_cv_proto_iconv_arg1=3D&quot;const&quo=
t;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 am_cv_proto_iconv=3D&quot;extern size_t iconv (i=
conv_t cd, $am_cv_proto_iconv_arg1 char * *inbuf, size_t *inbytesleft, char=
 * *outbuf, size_t *outbytesleft);&quot;])<br>
&gt; +=C2=A0 =C2=A0 am_cv_proto_iconv=3D`echo &quot;[$]am_cv_proto_iconv&qu=
ot; | tr -s &#39; &#39; | sed -e &#39;s/( /(/&#39;`<br>
&gt; +=C2=A0 =C2=A0 AC_MSG_RESULT([<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$am_cv_proto_iconv])<br>
&gt; +=C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 dnl When compiling GNU libiconv on a system that does n=
ot have iconv yet,<br>
&gt; +=C2=A0 =C2=A0 dnl pick the POSIX compliant declaration without &#39;c=
onst&#39;.<br>
&gt; +=C2=A0 =C2=A0 am_cv_proto_iconv_arg1=3D&quot;&quot;<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 AC_DEFINE_UNQUOTED([ICONV_CONST], [$am_cv_proto_iconv_arg1],<b=
r>
&gt; +=C2=A0 =C2=A0 [Define as const if the declaration of iconv() needs co=
nst.])<br>
&gt; +=C2=A0 dnl Also substitute ICONV_CONST in the gnulib generated &lt;ic=
onv.h&gt;.<br>
&gt; +=C2=A0 m4_ifdef([gl_ICONV_H_DEFAULTS],<br>
&gt; +=C2=A0 =C2=A0 [AC_REQUIRE([gl_ICONV_H_DEFAULTS])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if test -n &quot;$am_cv_proto_iconv_arg1&quot;; t=
hen<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ICONV_CONST=3D&quot;const&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 ])<br>
&gt; +])<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/=
intlmacosx.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/in=
tlmacosx.m4<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..30e6f50e0ac<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/intlmac=
osx.m4<br>
&gt; @@ -0,0 +1,72 @@<br>
&gt; +# intlmacosx.m4 serial 6 (gettext-0.20)<br>
&gt; +dnl Copyright (C) 2004-2014, 2016, 2019 Free Software Foundation, Inc=
.<br>
&gt; +dnl This file is free software; the Free Software Foundation<br>
&gt; +dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; +dnl with or without modifications, as long as this notice is preserve=
d.<br>
&gt; +dnl<br>
&gt; +dnl This file can be used in projects which are not available under<b=
r>
&gt; +dnl the GNU General Public License or the GNU Library General Public<=
br>
&gt; +dnl License but which still want to provide support for the GNU gette=
xt<br>
&gt; +dnl functionality.<br>
&gt; +dnl Please note that the actual code of the GNU gettext library is co=
vered<br>
&gt; +dnl by the GNU Library General Public License, and the rest of the GN=
U<br>
&gt; +dnl gettext package is covered by the GNU General Public License.<br>
&gt; +dnl They are *not* in the public domain.<br>
&gt; +<br>
&gt; +dnl Checks for special options needed on Mac OS X.<br>
&gt; +dnl Defines INTL_MACOSX_LIBS.<br>
&gt; +AC_DEFUN([gt_INTL_MACOSX],<br>
&gt; +[<br>
&gt; +=C2=A0 dnl Check for API introduced in Mac OS X 10.4.<br>
&gt; +=C2=A0 AC_CACHE_CHECK([for CFPreferencesCopyAppValue],<br>
&gt; +=C2=A0 =C2=A0 [gt_cv_func_CFPreferencesCopyAppValue],<br>
&gt; +=C2=A0 =C2=A0 [gt_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LIBS=3D&quot;$LIBS -Wl,-framework -Wl,CoreFoundat=
ion&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0AC_LINK_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_PROGRAM(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#include &lt;CoreFoundation/CFPr=
eferences.h&gt;]],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[CFPreferencesCopyAppValue(NULL, =
NULL)]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[gt_cv_func_CFPreferencesCopyAppValue=3Dye=
s],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[gt_cv_func_CFPreferencesCopyAppValue=3Dno=
])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LIBS=3D&quot;$gt_save_LIBS&quot;])<br>
&gt; +=C2=A0 if test $gt_cv_func_CFPreferencesCopyAppValue =3D yes; then<br=
>
&gt; +=C2=A0 =C2=A0 AC_DEFINE([HAVE_CFPREFERENCESCOPYAPPVALUE], [1],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 [Define to 1 if you have the Mac OS X function C=
FPreferencesCopyAppValue in the CoreFoundation framework.])<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 dnl Check for API introduced in Mac OS X 10.5.<br>
&gt; +=C2=A0 AC_CACHE_CHECK([for CFLocaleCopyCurrent], [gt_cv_func_CFLocale=
CopyCurrent],<br>
&gt; +=C2=A0 =C2=A0 [gt_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LIBS=3D&quot;$LIBS -Wl,-framework -Wl,CoreFoundat=
ion&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0AC_LINK_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_PROGRAM(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#include &lt;CoreFoundation/CFLo=
cale.h&gt;]],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[CFLocaleCopyCurrent();]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[gt_cv_func_CFLocaleCopyCurrent=3Dyes],<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[gt_cv_func_CFLocaleCopyCurrent=3Dno])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LIBS=3D&quot;$gt_save_LIBS&quot;])<br>
&gt; +=C2=A0 if test $gt_cv_func_CFLocaleCopyCurrent =3D yes; then<br>
&gt; +=C2=A0 =C2=A0 AC_DEFINE([HAVE_CFLOCALECOPYCURRENT], [1],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 [Define to 1 if you have the Mac OS X function C=
FLocaleCopyCurrent in the CoreFoundation framework.])<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 AC_CACHE_CHECK([for CFLocaleCopyPreferredLanguages], [gt_cv_fu=
nc_CFLocaleCopyPreferredLanguages],<br>
&gt; +=C2=A0 =C2=A0 [gt_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LIBS=3D&quot;$LIBS -Wl,-framework -Wl,CoreFoundat=
ion&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0AC_LINK_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_PROGRAM(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#include &lt;CoreFoundation/CFLo=
cale.h&gt;]],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[CFLocaleCopyPreferredLanguages()=
;]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[gt_cv_func_CFLocaleCopyPreferredLanguages=
=3Dyes],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[gt_cv_func_CFLocaleCopyPreferredLanguages=
=3Dno])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LIBS=3D&quot;$gt_save_LIBS&quot;])<br>
&gt; +=C2=A0 if test $gt_cv_func_CFLocaleCopyPreferredLanguages =3D yes; th=
en<br>
&gt; +=C2=A0 =C2=A0 AC_DEFINE([HAVE_CFLOCALECOPYPREFERREDLANGUAGES], [1],<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 [Define to 1 if you have the Mac OS X function C=
FLocaleCopyPreferredLanguages in the CoreFoundation framework.])<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 INTL_MACOSX_LIBS=3D<br>
&gt; +=C2=A0 if test $gt_cv_func_CFPreferencesCopyAppValue =3D yes \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0|| test $gt_cv_func_CFLocaleCopyCurrent =3D yes \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0|| test $gt_cv_func_CFLocaleCopyPreferredLanguage=
s =3D yes; then<br>
&gt; +=C2=A0 =C2=A0 INTL_MACOSX_LIBS=3D&quot;-Wl,-framework -Wl,CoreFoundat=
ion&quot;<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 AC_SUBST([INTL_MACOSX_LIBS])<br>
&gt; +])<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/=
lib-ld.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld=
.m4<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..a18719630d5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld.=
m4<br>
&gt; @@ -0,0 +1,168 @@<br>
&gt; +# lib-ld.m4 serial 9<br>
&gt; +dnl Copyright (C) 1996-2003, 2009-2019 Free Software Foundation, Inc.=
<br>
&gt; +dnl This file is free software; the Free Software Foundation<br>
&gt; +dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; +dnl with or without modifications, as long as this notice is preserve=
d.<br>
&gt; +<br>
&gt; +dnl Subroutines of libtool.m4,<br>
&gt; +dnl with replacements s/_*LT_PATH/AC_LIB_PROG/ and s/lt_/acl_/ to avo=
id<br>
&gt; +dnl collision with libtool.m4.<br>
&gt; +<br>
&gt; +dnl From libtool-2.4. Sets the variable with_gnu_ld to yes or no.<br>
&gt; +AC_DEFUN([AC_LIB_PROG_LD_GNU],<br>
&gt; +[AC_CACHE_CHECK([if the linker ($LD) is GNU ld], [acl_cv_prog_gnu_ld]=
,<br>
&gt; +[# I&#39;d rather use --version here, but apparently some GNU lds onl=
y accept -v.<br>
&gt; +case `$LD -v 2&gt;&amp;1 &lt;/dev/null` in<br>
&gt; +*GNU* | *&#39;with BFD&#39;*)<br>
&gt; +=C2=A0 acl_cv_prog_gnu_ld=3Dyes<br>
&gt; +=C2=A0 ;;<br>
&gt; +*)<br>
&gt; +=C2=A0 acl_cv_prog_gnu_ld=3Dno<br>
&gt; +=C2=A0 ;;<br>
&gt; +esac])<br>
&gt; +with_gnu_ld=3D$acl_cv_prog_gnu_ld<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl From libtool-2.4. Sets the variable LD.<br>
&gt; +AC_DEFUN([AC_LIB_PROG_LD],<br>
&gt; +[AC_REQUIRE([AC_PROG_CC])dnl<br>
&gt; +AC_REQUIRE([AC_CANONICAL_HOST])dnl<br>
&gt; +<br>
&gt; +AC_ARG_WITH([gnu-ld],<br>
&gt; +=C2=A0 =C2=A0 [AS_HELP_STRING([--with-gnu-ld],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [assume the C compiler uses GNU ld [defau=
lt=3Dno]])],<br>
&gt; +=C2=A0 =C2=A0 [test &quot;$withval&quot; =3D no || with_gnu_ld=3Dyes]=
,<br>
&gt; +=C2=A0 =C2=A0 [with_gnu_ld=3Dno])dnl<br>
&gt; +<br>
&gt; +# Prepare PATH_SEPARATOR.<br>
&gt; +# The user is always right.<br>
&gt; +if test &quot;${PATH_SEPARATOR+set}&quot; !=3D set; then<br>
&gt; +=C2=A0 # Determine PATH_SEPARATOR by trying to find /bin/sh in a PATH=
 which<br>
&gt; +=C2=A0 # contains only /bin. Note that ksh looks also at the FPATH va=
riable,<br>
&gt; +=C2=A0 # so we have to set that as well for the test.<br>
&gt; +=C2=A0 PATH_SEPARATOR=3D:<br>
&gt; +=C2=A0 (PATH=3D&#39;/bin;/bin&#39;; FPATH=3D$PATH; sh -c :) &gt;/dev/=
null 2&gt;&amp;1 \<br>
&gt; +=C2=A0 =C2=A0 &amp;&amp; { (PATH=3D&#39;/bin:/bin&#39;; FPATH=3D$PATH=
; sh -c :) &gt;/dev/null 2&gt;&amp;1 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| PATH_SEPARATOR=3D&#39;;&#=
39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +fi<br>
&gt; +<br>
&gt; +if test -n &quot;$LD&quot;; then<br>
&gt; +=C2=A0 AC_MSG_CHECKING([for ld])<br>
&gt; +elif test &quot;$GCC&quot; =3D yes; then<br>
&gt; +=C2=A0 AC_MSG_CHECKING([for ld used by $CC])<br>
&gt; +elif test &quot;$with_gnu_ld&quot; =3D yes; then<br>
&gt; +=C2=A0 AC_MSG_CHECKING([for GNU ld])<br>
&gt; +else<br>
&gt; +=C2=A0 AC_MSG_CHECKING([for non-GNU ld])<br>
&gt; +fi<br>
&gt; +if test -n &quot;$LD&quot;; then<br>
&gt; +=C2=A0 # Let the user override the test with a path.<br>
&gt; +=C2=A0 :<br>
&gt; +else<br>
&gt; +=C2=A0 AC_CACHE_VAL([acl_cv_path_LD],<br>
&gt; +=C2=A0 [<br>
&gt; +=C2=A0 =C2=A0 acl_cv_path_LD=3D # Final result of this test<br>
&gt; +=C2=A0 =C2=A0 ac_prog=3Dld # Program to search in $PATH<br>
&gt; +=C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 # Check if gcc -print-prog-name=3Dld gives a pat=
h.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 case $host in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *-*-mingw*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # gcc leaves a trailing carriage r=
eturn which upsets mingw<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acl_output=3D`($CC -print-prog-nam=
e=3Dld) 2&gt;&amp;5 | tr -d &#39;\015&#39;` ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acl_output=3D`($CC -print-prog-nam=
e=3Dld) 2&gt;&amp;5` ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 case $acl_output in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Accept absolute paths.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [[\\/]]* | ?:[[\\/]]*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re_direlt=3D&#39;/[[^/]][[^/]]*/\.=
\./&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Canonicalize the pathname of ld<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acl_output=3D`echo &quot;$acl_outp=
ut&quot; | sed &#39;s%\\\\%/%g&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while echo &quot;$acl_output&quot;=
 | grep &quot;$re_direlt&quot; &gt; /dev/null 2&gt;&amp;1; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acl_output=3D`echo $acl_out=
put | sed &quot;s%$re_direlt%/%&quot;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Got the pathname. No search in P=
ATH is needed.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acl_cv_path_LD=3D&quot;$acl_output=
&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_prog=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If it fails, then pretend we are=
n&#39;t using GCC.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If it is relative, then search f=
or the first ld in PATH.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with_gnu_ld=3Dunknown<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 if test -n &quot;$ac_prog&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 # Search for $ac_prog in $PATH.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 acl_save_ifs=3D&quot;$IFS&quot;; IFS=3D$PATH_SEP=
ARATOR<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for ac_dir in $PATH; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 IFS=3D&quot;$acl_save_ifs&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 test -z &quot;$ac_dir&quot; &amp;&amp; ac=
_dir=3D.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f &quot;$ac_dir/$ac_prog&quot; |=
| test -f &quot;$ac_dir/$ac_prog$ac_exeext&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acl_cv_path_LD=3D&quot;$ac_dir/$ac=
_prog&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check to see if the program is G=
NU ld.=C2=A0 I&#39;d rather use --version,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # but apparently some variants of =
GNU ld only accept -v.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Break only if it was the GNU/non=
-GNU ld that we prefer.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case `&quot;$acl_cv_path_LD&quot; =
-v 2&gt;&amp;1 &lt;/dev/null` in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *GNU* | *&#39;with BFD&#39;=
*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test &quot;$with_gnu=
_ld&quot; !=3D no &amp;&amp; break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test &quot;$with_gnu=
_ld&quot; !=3D yes &amp;&amp; break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 IFS=3D&quot;$acl_save_ifs&quot;<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 case $host in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *-*-aix*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[#if defined __power=
pc64__ || defined _ARCH_PPC64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error fail<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [# The compiler produces 64-bit co=
de. Add option &#39;-b64&#39; so that the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# linker groks 64-bit object=
 files.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$acl_cv_path_LD &=
quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*&quot; -b64 &quot;*)=
 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*) acl_cv_path_LD=3D&=
quot;$acl_cv_path_LD -b64&quot; ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ], [])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 sparc64-*-netbsd*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[#if defined __sparc=
v9 || defined __arch64__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ok;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error fail<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [# The compiler produces 32-bit co=
de. Add option &#39;-m elf32_sparc&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# so that the linker groks 3=
2-bit object files.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$acl_cv_path_LD &=
quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*&quot; -m elf32_spar=
c &quot;*) ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*) acl_cv_path_LD=3D&=
quot;$acl_cv_path_LD -m elf32_sparc&quot; ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 ])<br>
&gt; +=C2=A0 LD=3D&quot;$acl_cv_path_LD&quot;<br>
&gt; +fi<br>
&gt; +if test -n &quot;$LD&quot;; then<br>
&gt; +=C2=A0 AC_MSG_RESULT([$LD])<br>
&gt; +else<br>
&gt; +=C2=A0 AC_MSG_RESULT([no])<br>
&gt; +=C2=A0 AC_MSG_ERROR([no acceptable ld found in \$PATH])<br>
&gt; +fi<br>
&gt; +AC_LIB_PROG_LD_GNU<br>
&gt; +])<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/=
lib-link.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-=
link.m4<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..0ff10731fac<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-lin=
k.m4<br>
&gt; @@ -0,0 +1,774 @@<br>
&gt; +# lib-link.m4 serial 28<br>
&gt; +dnl Copyright (C) 2001-2019 Free Software Foundation, Inc.<br>
&gt; +dnl This file is free software; the Free Software Foundation<br>
&gt; +dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; +dnl with or without modifications, as long as this notice is preserve=
d.<br>
&gt; +<br>
&gt; +dnl From Bruno Haible.<br>
&gt; +<br>
&gt; +AC_PREREQ([2.61])<br>
&gt; +<br>
&gt; +dnl AC_LIB_LINKFLAGS(name [, dependencies]) searches for libname and<=
br>
&gt; +dnl the libraries corresponding to explicit and implicit dependencies=
.<br>
&gt; +dnl Sets and AC_SUBSTs the LIB${NAME} and LTLIB${NAME} variables and<=
br>
&gt; +dnl augments the CPPFLAGS variable.<br>
&gt; +dnl Sets and AC_SUBSTs the LIB${NAME}_PREFIX variable to nonempty if =
libname<br>
&gt; +dnl was found in ${LIB${NAME}_PREFIX}/$acl_libdirstem.<br>
&gt; +AC_DEFUN([AC_LIB_LINKFLAGS],<br>
&gt; +[<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_PREPARE_PREFIX])<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_RPATH])<br>
&gt; +=C2=A0 pushdef([Name],[m4_translit([$1],[./+-], [____])])<br>
&gt; +=C2=A0 pushdef([NAME],[m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./=
+-],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ABCDEFGHIJKLMNOPQR=
STUVWXYZ____])])<br>
&gt; +=C2=A0 AC_CACHE_CHECK([how to link with lib[]$1], [ac_cv_lib[]Name[]_=
libs], [<br>
&gt; +=C2=A0 =C2=A0 AC_LIB_LINKFLAGS_BODY([$1], [$2])<br>
&gt; +=C2=A0 =C2=A0 ac_cv_lib[]Name[]_libs=3D&quot;$LIB[]NAME&quot;<br>
&gt; +=C2=A0 =C2=A0 ac_cv_lib[]Name[]_ltlibs=3D&quot;$LTLIB[]NAME&quot;<br>
&gt; +=C2=A0 =C2=A0 ac_cv_lib[]Name[]_cppflags=3D&quot;$INC[]NAME&quot;<br>
&gt; +=C2=A0 =C2=A0 ac_cv_lib[]Name[]_prefix=3D&quot;$LIB[]NAME[]_PREFIX&qu=
ot;<br>
&gt; +=C2=A0 ])<br>
&gt; +=C2=A0 LIB[]NAME=3D&quot;$ac_cv_lib[]Name[]_libs&quot;<br>
&gt; +=C2=A0 LTLIB[]NAME=3D&quot;$ac_cv_lib[]Name[]_ltlibs&quot;<br>
&gt; +=C2=A0 INC[]NAME=3D&quot;$ac_cv_lib[]Name[]_cppflags&quot;<br>
&gt; +=C2=A0 LIB[]NAME[]_PREFIX=3D&quot;$ac_cv_lib[]Name[]_prefix&quot;<br>
&gt; +=C2=A0 AC_LIB_APPENDTOVAR([CPPFLAGS], [$INC]NAME)<br>
&gt; +=C2=A0 AC_SUBST([LIB]NAME)<br>
&gt; +=C2=A0 AC_SUBST([LTLIB]NAME)<br>
&gt; +=C2=A0 AC_SUBST([LIB]NAME[_PREFIX])<br>
&gt; +=C2=A0 dnl Also set HAVE_LIB[]NAME so that AC_LIB_HAVE_LINKFLAGS can =
reuse the<br>
&gt; +=C2=A0 dnl results of this search when this library appears as a depe=
ndency.<br>
&gt; +=C2=A0 HAVE_LIB[]NAME=3Dyes<br>
&gt; +=C2=A0 popdef([NAME])<br>
&gt; +=C2=A0 popdef([Name])<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl AC_LIB_HAVE_LINKFLAGS(name, dependencies, includes, testcode, [mi=
ssing-message])<br>
&gt; +dnl searches for libname and the libraries corresponding to explicit =
and<br>
&gt; +dnl implicit dependencies, together with the specified include files =
and<br>
&gt; +dnl the ability to compile and link the specified testcode. The missi=
ng-message<br>
&gt; +dnl defaults to &#39;no&#39; and may contain additional hints for the=
 user.<br>
&gt; +dnl If found, it sets and AC_SUBSTs HAVE_LIB${NAME}=3Dyes and the LIB=
${NAME}<br>
&gt; +dnl and LTLIB${NAME} variables and augments the CPPFLAGS variable, an=
d<br>
&gt; +dnl #defines HAVE_LIB${NAME} to 1. Otherwise, it sets and AC_SUBSTs<b=
r>
&gt; +dnl HAVE_LIB${NAME}=3Dno and LIB${NAME} and LTLIB${NAME} to empty.<br=
>
&gt; +dnl Sets and AC_SUBSTs the LIB${NAME}_PREFIX variable to nonempty if =
libname<br>
&gt; +dnl was found in ${LIB${NAME}_PREFIX}/$acl_libdirstem.<br>
&gt; +AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],<br>
&gt; +[<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_PREPARE_PREFIX])<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_RPATH])<br>
&gt; +=C2=A0 pushdef([Name],[m4_translit([$1],[./+-], [____])])<br>
&gt; +=C2=A0 pushdef([NAME],[m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./=
+-],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ABCDEFGHIJKLMNOPQR=
STUVWXYZ____])])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Search for lib[]Name and define LIB[]NAME, LTLIB[]NAME and=
 INC[]NAME<br>
&gt; +=C2=A0 dnl accordingly.<br>
&gt; +=C2=A0 AC_LIB_LINKFLAGS_BODY([$1], [$2])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Add $INC[]NAME to CPPFLAGS before performing the following=
 checks,<br>
&gt; +=C2=A0 dnl because if the user has installed lib[]Name and not disabl=
ed its use<br>
&gt; +=C2=A0 dnl via --without-lib[]Name-prefix, he wants to use it.<br>
&gt; +=C2=A0 ac_save_CPPFLAGS=3D&quot;$CPPFLAGS&quot;<br>
&gt; +=C2=A0 AC_LIB_APPENDTOVAR([CPPFLAGS], [$INC]NAME)<br>
&gt; +<br>
&gt; +=C2=A0 AC_CACHE_CHECK([for lib[]$1], [ac_cv_lib[]Name], [<br>
&gt; +=C2=A0 =C2=A0 ac_save_LIBS=3D&quot;$LIBS&quot;<br>
&gt; +=C2=A0 =C2=A0 dnl If $LIB[]NAME contains some -l options, add it to t=
he end of LIBS,<br>
&gt; +=C2=A0 =C2=A0 dnl because these -l options might require -L options t=
hat are present in<br>
&gt; +=C2=A0 =C2=A0 dnl LIBS. -l options benefit only from the -L options l=
isted before it.<br>
&gt; +=C2=A0 =C2=A0 dnl Otherwise, add it to the front of LIBS, because it =
may be a static<br>
&gt; +=C2=A0 =C2=A0 dnl library that depends on another static library that=
 is present in LIBS.<br>
&gt; +=C2=A0 =C2=A0 dnl Static libraries benefit only from the static libra=
ries listed after<br>
&gt; +=C2=A0 =C2=A0 dnl it.<br>
&gt; +=C2=A0 =C2=A0 case &quot; $LIB[]NAME&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *&quot; -l&quot;*) LIBS=3D&quot;$LIBS $LIB[]NAME=
&quot; ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *)=C2=A0 =C2=A0 =C2=A0 =C2=A0LIBS=3D&quot;$LIB[]=
NAME $LIBS&quot; ;;<br>
&gt; +=C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 AC_LINK_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 [AC_LANG_PROGRAM([[$3]], [[$4]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 [ac_cv_lib[]Name=3Dyes],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 [ac_cv_lib[]Name=3D&#39;m4_if([$5], [], [no], [[=
$5]])&#39;])<br>
&gt; +=C2=A0 =C2=A0 LIBS=3D&quot;$ac_save_LIBS&quot;<br>
&gt; +=C2=A0 ])<br>
&gt; +=C2=A0 if test &quot;$ac_cv_lib[]Name&quot; =3D yes; then<br>
&gt; +=C2=A0 =C2=A0 HAVE_LIB[]NAME=3Dyes<br>
&gt; +=C2=A0 =C2=A0 AC_DEFINE([HAVE_LIB]NAME, 1, [Define if you have the li=
b][$1 library.])<br>
&gt; +=C2=A0 =C2=A0 AC_MSG_CHECKING([how to link with lib[]$1])<br>
&gt; +=C2=A0 =C2=A0 AC_MSG_RESULT([$LIB[]NAME])<br>
&gt; +=C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 HAVE_LIB[]NAME=3Dno<br>
&gt; +=C2=A0 =C2=A0 dnl If $LIB[]NAME didn&#39;t lead to a usable library, =
we don&#39;t need<br>
&gt; +=C2=A0 =C2=A0 dnl $INC[]NAME either.<br>
&gt; +=C2=A0 =C2=A0 CPPFLAGS=3D&quot;$ac_save_CPPFLAGS&quot;<br>
&gt; +=C2=A0 =C2=A0 LIB[]NAME=3D<br>
&gt; +=C2=A0 =C2=A0 LTLIB[]NAME=3D<br>
&gt; +=C2=A0 =C2=A0 LIB[]NAME[]_PREFIX=3D<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 AC_SUBST([HAVE_LIB]NAME)<br>
&gt; +=C2=A0 AC_SUBST([LIB]NAME)<br>
&gt; +=C2=A0 AC_SUBST([LTLIB]NAME)<br>
&gt; +=C2=A0 AC_SUBST([LIB]NAME[_PREFIX])<br>
&gt; +=C2=A0 popdef([NAME])<br>
&gt; +=C2=A0 popdef([Name])<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl Determine the platform dependent parameters needed to use rpath:<=
br>
&gt; +dnl=C2=A0 =C2=A0acl_libext,<br>
&gt; +dnl=C2=A0 =C2=A0acl_shlibext,<br>
&gt; +dnl=C2=A0 =C2=A0acl_libname_spec,<br>
&gt; +dnl=C2=A0 =C2=A0acl_library_names_spec,<br>
&gt; +dnl=C2=A0 =C2=A0acl_hardcode_libdir_flag_spec,<br>
&gt; +dnl=C2=A0 =C2=A0acl_hardcode_libdir_separator,<br>
&gt; +dnl=C2=A0 =C2=A0acl_hardcode_direct,<br>
&gt; +dnl=C2=A0 =C2=A0acl_hardcode_minus_L.<br>
&gt; +AC_DEFUN([AC_LIB_RPATH],<br>
&gt; +[<br>
&gt; +=C2=A0 dnl Complain if config.rpath is missing.<br>
&gt; +=C2=A0 AC_REQUIRE_AUX_FILE([config.rpath])<br>
&gt; +=C2=A0 AC_REQUIRE([AC_PROG_CC])=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dnl we use $CC, $GCC, $LDFLAGS<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_PROG_LD])=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl we use $LD, $with_gnu_ld<br>
&gt; +=C2=A0 AC_REQUIRE([AC_CANONICAL_HOST])=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dnl we use $host<br>
&gt; +=C2=A0 AC_REQUIRE([AC_CONFIG_AUX_DIR_DEFAULT]) dnl we use $ac_aux_dir=
<br>
&gt; +=C2=A0 AC_CACHE_CHECK([for shared library run path origin], [acl_cv_r=
path], [<br>
&gt; +=C2=A0 =C2=A0 CC=3D&quot;$CC&quot; GCC=3D&quot;$GCC&quot; LDFLAGS=3D&=
quot;$LDFLAGS&quot; LD=3D&quot;$LD&quot; with_gnu_ld=3D&quot;$with_gnu_ld&q=
uot; \<br>
&gt; +=C2=A0 =C2=A0 ${CONFIG_SHELL-/bin/sh} &quot;$ac_aux_dir/config.rpath&=
quot; &quot;$host&quot; &gt; conftest.sh<br>
&gt; +=C2=A0 =C2=A0 . ./conftest.sh<br>
&gt; +=C2=A0 =C2=A0 rm -f ./conftest.sh<br>
&gt; +=C2=A0 =C2=A0 acl_cv_rpath=3Ddone<br>
&gt; +=C2=A0 ])<br>
&gt; +=C2=A0 wl=3D&quot;$acl_cv_wl&quot;<br>
&gt; +=C2=A0 acl_libext=3D&quot;$acl_cv_libext&quot;<br>
&gt; +=C2=A0 acl_shlibext=3D&quot;$acl_cv_shlibext&quot;<br>
&gt; +=C2=A0 acl_libname_spec=3D&quot;$acl_cv_libname_spec&quot;<br>
&gt; +=C2=A0 acl_library_names_spec=3D&quot;$acl_cv_library_names_spec&quot=
;<br>
&gt; +=C2=A0 acl_hardcode_libdir_flag_spec=3D&quot;$acl_cv_hardcode_libdir_=
flag_spec&quot;<br>
&gt; +=C2=A0 acl_hardcode_libdir_separator=3D&quot;$acl_cv_hardcode_libdir_=
separator&quot;<br>
&gt; +=C2=A0 acl_hardcode_direct=3D&quot;$acl_cv_hardcode_direct&quot;<br>
&gt; +=C2=A0 acl_hardcode_minus_L=3D&quot;$acl_cv_hardcode_minus_L&quot;<br=
>
&gt; +=C2=A0 dnl Determine whether the user wants rpath handling at all.<br=
>
&gt; +=C2=A0 AC_ARG_ENABLE([rpath],<br>
&gt; +=C2=A0 =C2=A0 [=C2=A0 --disable-rpath=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0do not hardcode runtime library paths],<br>
&gt; +=C2=A0 =C2=A0 :, enable_rpath=3Dyes)<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl AC_LIB_FROMPACKAGE(name, package)<br>
&gt; +dnl declares that libname comes from the given package. The configure=
 file<br>
&gt; +dnl will then not have a --with-libname-prefix option but a<br>
&gt; +dnl --with-package-prefix option. Several libraries can come from the=
 same<br>
&gt; +dnl package. This declaration must occur before an AC_LIB_LINKFLAGS o=
r similar<br>
&gt; +dnl macro call that searches for libname.<br>
&gt; +AC_DEFUN([AC_LIB_FROMPACKAGE],<br>
&gt; +[<br>
&gt; +=C2=A0 pushdef([NAME],[m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./=
+-],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ABCDEFGHIJKLMNOPQR=
STUVWXYZ____])])<br>
&gt; +=C2=A0 define([acl_frompackage_]NAME, [$2])<br>
&gt; +=C2=A0 popdef([NAME])<br>
&gt; +=C2=A0 pushdef([PACK],[$2])<br>
&gt; +=C2=A0 pushdef([PACKUP],[m4_translit(PACK,[abcdefghijklmnopqrstuvwxyz=
./+-],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ABCDEFGHIJK=
LMNOPQRSTUVWXYZ____])])<br>
&gt; +=C2=A0 define([acl_libsinpackage_]PACKUP,<br>
&gt; +=C2=A0 =C2=A0 m4_ifdef([acl_libsinpackage_]PACKUP, [m4_defn([acl_libs=
inpackage_]PACKUP)[, ]],)[lib$1])<br>
&gt; +=C2=A0 popdef([PACKUP])<br>
&gt; +=C2=A0 popdef([PACK])<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl AC_LIB_LINKFLAGS_BODY(name [, dependencies]) searches for libname=
 and<br>
&gt; +dnl the libraries corresponding to explicit and implicit dependencies=
.<br>
&gt; +dnl Sets the LIB${NAME}, LTLIB${NAME} and INC${NAME} variables.<br>
&gt; +dnl Also, sets the LIB${NAME}_PREFIX variable to nonempty if libname =
was found<br>
&gt; +dnl in ${LIB${NAME}_PREFIX}/$acl_libdirstem.<br>
&gt; +AC_DEFUN([AC_LIB_LINKFLAGS_BODY],<br>
&gt; +[<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])<br>
&gt; +=C2=A0 pushdef([NAME],[m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./=
+-],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ABCDEFGHIJKLMNOPQR=
STUVWXYZ____])])<br>
&gt; +=C2=A0 pushdef([PACK],[m4_ifdef([acl_frompackage_]NAME, [acl_frompack=
age_]NAME, lib[$1])])<br>
&gt; +=C2=A0 pushdef([PACKUP],[m4_translit(PACK,[abcdefghijklmnopqrstuvwxyz=
./+-],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ABCDEFGHIJK=
LMNOPQRSTUVWXYZ____])])<br>
&gt; +=C2=A0 pushdef([PACKLIBS],[m4_ifdef([acl_frompackage_]NAME, [acl_libs=
inpackage_]PACKUP, lib[$1])])<br>
&gt; +=C2=A0 dnl By default, look in $includedir and $libdir.<br>
&gt; +=C2=A0 use_additional=3Dyes<br>
&gt; +=C2=A0 AC_LIB_WITH_FINAL_PREFIX([<br>
&gt; +=C2=A0 =C2=A0 eval additional_includedir=3D\&quot;$includedir\&quot;<=
br>
&gt; +=C2=A0 =C2=A0 eval additional_libdir=3D\&quot;$libdir\&quot;<br>
&gt; +=C2=A0 ])<br>
&gt; +=C2=A0 AC_ARG_WITH(PACK[-prefix],<br>
&gt; +[[=C2=A0 --with-]]PACK[[-prefix[=3DDIR]=C2=A0 search for ]PACKLIBS[ i=
n DIR/include and DIR/lib<br>
&gt; +=C2=A0 --without-]]PACK[[-prefix=C2=A0 =C2=A0 =C2=A0don&#39;t search =
for ]PACKLIBS[ in includedir and libdir]],<br>
&gt; +[<br>
&gt; +=C2=A0 =C2=A0 if test &quot;X$withval&quot; =3D &quot;Xno&quot;; then=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 use_additional=3Dno<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test &quot;X$withval&quot; =3D &quot;X&quot;;=
 then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LIB_WITH_FINAL_PREFIX([<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval additional_includedir=3D\&quo=
t;$includedir\&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval additional_libdir=3D\&quot;$l=
ibdir\&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 additional_includedir=3D&quot;$withval/in=
clude&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 additional_libdir=3D&quot;$withval/$acl_l=
ibdirstem&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$acl_libdirstem2&quot; !=3D=
 &quot;$acl_libdirstem&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; test ! -d &quot;$=
withval/$acl_libdirstem&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 additional_libdir=3D&quot;$withval=
/$acl_libdirstem2&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +])<br>
&gt; +=C2=A0 dnl Search the library and its dependencies in $additional_lib=
dir and<br>
&gt; +=C2=A0 dnl $LDFLAGS. Using breadth-first-seach.<br>
&gt; +=C2=A0 LIB[]NAME=3D<br>
&gt; +=C2=A0 LTLIB[]NAME=3D<br>
&gt; +=C2=A0 INC[]NAME=3D<br>
&gt; +=C2=A0 LIB[]NAME[]_PREFIX=3D<br>
&gt; +=C2=A0 dnl HAVE_LIB${NAME} is an indicator that LIB${NAME}, LTLIB${NA=
ME} have been<br>
&gt; +=C2=A0 dnl computed. So it has to be reset here.<br>
&gt; +=C2=A0 HAVE_LIB[]NAME=3D<br>
&gt; +=C2=A0 rpathdirs=3D<br>
&gt; +=C2=A0 ltrpathdirs=3D<br>
&gt; +=C2=A0 names_already_handled=3D<br>
&gt; +=C2=A0 names_next_round=3D&#39;$1 $2&#39;<br>
&gt; +=C2=A0 while test -n &quot;$names_next_round&quot;; do<br>
&gt; +=C2=A0 =C2=A0 names_this_round=3D&quot;$names_next_round&quot;<br>
&gt; +=C2=A0 =C2=A0 names_next_round=3D<br>
&gt; +=C2=A0 =C2=A0 for name in $names_this_round; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 already_handled=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for n in $names_already_handled; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$n&quot; =3D &quot;$name&qu=
ot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 already_handled=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test -z &quot;$already_handled&quot;; then<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 names_already_handled=3D&quot;$names_alre=
ady_handled $name&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl See if it was already located by an e=
arlier AC_LIB_LINKFLAGS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl or AC_LIB_HAVE_LINKFLAGS call.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uppername=3D`echo &quot;$name&quot; | sed=
 -e &#39;y|abcdefghijklmnopqrstuvwxyz./+-|ABCDEFGHIJKLMNOPQRSTUVWXYZ____|&#=
39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 eval value=3D\&quot;\$HAVE_LIB$uppername\=
&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$value&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$value&quot; =3D yes=
; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval value=3D\&quot;\$LIB$u=
ppername\&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -z &quot;$value&quot; =
|| LIB[]NAME=3D&quot;${LIB[]NAME}${LIB[]NAME:+ }$value&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval value=3D\&quot;\$LTLIB=
$uppername\&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -z &quot;$value&quot; =
|| LTLIB[]NAME=3D&quot;${LTLIB[]NAME}${LTLIB[]NAME:+ }$value&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl An earlier call to AC_L=
IB_HAVE_LINKFLAGS has determined<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl that this library doesn=
&#39;t exist. So just drop it.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Search the library lib$name in=
 $additional_libdir and $LDFLAGS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl and the already constructed $L=
IBNAME/$LTLIBNAME.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_dir=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_la=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_so=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_a=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval libname=3D\&quot;$acl_libname=
_spec\&quot;=C2=A0 =C2=A0 # typically: libname=3Dlib$name<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$acl_shlibext&quo=
t;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shrext=3D&quot;.$acl_shlibe=
xt&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# typically: shrext=
=3D.so<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shrext=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test $use_additional =3D yes; t=
hen<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir=3D&quot;$additional_lib=
dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl The same code as in the=
 loop below:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl First look for a shared=
 library.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$acl_shlib=
ext&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f &quot;$di=
r/$libname$shrext&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_dir=3D&=
quot;$dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_so=3D&q=
uot;$dir/$libname$shrext&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot=
;$acl_library_names_spec&quot; =3D &#39;$libname$shrext$versuffix&#39;; the=
n<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ver=3D=
`(cd &quot;$dir&quot; &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for f in &quot;$libname$shrext&quot;.*; do echo &quot;$f&quo=
t;; done \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | sed -e &quot;s,^$libname$shrext\\\\.,,&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | sort -t &#39;.&#39; -n -r -k1,1 -k2,2 -k3,3 -k4,4 -k5,5 \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | sed 1q ) 2&gt;/dev/null`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tes=
t -n &quot;$ver&quot; &amp;&amp; test -f &quot;$dir/$libname$shrext.$ver&qu=
ot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 found_dir=3D&quot;$dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 found_so=3D&quot;$dir/$libname$shrext.$ver&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval l=
ibrary_names=3D\&quot;$acl_library_names_spec\&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for f =
in $library_names; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if test -f &quot;$dir/$f&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 found_dir=3D&quot;$dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 found_so=3D&quot;$dir/$f&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Then look for a static =
library.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$found_dir&q=
uot; =3D &quot;X&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f &quot;$di=
r/$libname.$acl_libext&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_dir=3D&=
quot;$dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_a=3D&qu=
ot;$dir/$libname.$acl_libext&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$found_dir&q=
uot; !=3D &quot;X&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f &quot;$di=
r/$<a href=3D"http://libname.la" rel=3D"noreferrer" target=3D"_blank">libna=
me.la</a>&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_la=3D&q=
uot;$dir/$<a href=3D"http://libname.la" rel=3D"noreferrer" target=3D"_blank=
">libname.la</a>&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$found_dir&quot; =
=3D &quot;X&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for x in $LDFLAGS $LTLIB[]N=
AME; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LIB_WITH_FINAL_PR=
EFIX([eval x=3D\&quot;$x\&quot;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$x&quot; =
in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -L*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir=3D=
`echo &quot;X$x&quot; | sed -e &#39;s/^X-L//&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Fi=
rst look for a shared library.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tes=
t -n &quot;$acl_shlibext&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if test -f &quot;$dir/$libname$shrext&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 found_dir=3D&quot;$dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 found_so=3D&quot;$dir/$libname$shrext&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if test &quot;$acl_library_names_spec&quot; =3D &#39;$libname$shrex=
t$versuffix&#39;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ver=3D`(cd &quot;$dir&quot; &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in &quot;$libname$shrext&quot;.*;=
 do echo &quot;$f&quot;; done \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | sed -e &quot;s,^$libname$shrext\\\\.,=
,&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | sort -t &#39;.&#39; -n -r -k1,1 -k2,2=
 -k3,3 -k4,4 -k5,5 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | sed 1q ) 2&gt;/dev/null`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if test -n &quot;$ver&quot; &amp;&amp; test -f &quot;$dir/$l=
ibname$shrext.$ver&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 found_dir=3D&quot;$dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 found_so=3D&quot;$dir/$libname$shrext.$ver&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 eval library_names=3D\&quot;$acl_library_names_spec\&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for f in $library_names; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if test -f &quot;$dir/$f&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_dir=3D&quot;$dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_so=3D&quot;$dir/$f&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Th=
en look for a static library.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tes=
t &quot;X$found_dir&quot; =3D &quot;X&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if test -f &quot;$dir/$libname.$acl_libext&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 found_dir=3D&quot;$dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 found_a=3D&quot;$dir/$libname.$acl_libext&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tes=
t &quot;X$found_dir&quot; !=3D &quot;X&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if test -f &quot;$dir/$<a href=3D"http://libname.la" rel=3D"noreferrer" ta=
rget=3D"_blank">libname.la</a>&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 found_la=3D&quot;$dir/$<a href=3D"http://libname.la" rel=3D"norefer=
rer" target=3D"_blank">libname.la</a>&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$foun=
d_dir&quot; !=3D &quot;X&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$found_dir&quot; !=
=3D &quot;X&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Found the library.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LTLIB[]NAME=3D&quot;${LTLIB=
[]NAME}${LTLIB[]NAME:+ }-L$found_dir -l$name&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$found_so&qu=
ot; !=3D &quot;X&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Linking with a s=
hared library. We attempt to hardcode its<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl directory into t=
he executable&#39;s runpath, unless it&#39;s the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl standard /usr/li=
b.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$enabl=
e_rpath&quot; =3D no \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| test=
 &quot;X$found_dir&quot; =3D &quot;X/usr/$acl_libdirstem&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| test=
 &quot;X$found_dir&quot; =3D &quot;X/usr/$acl_libdirstem2&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl No hardco=
ding is needed.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIB[]NAME=3D&=
quot;${LIB[]NAME}${LIB[]NAME:+ }$found_so&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Use an ex=
plicit option to hardcode DIR into the resulting<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl binary.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Potential=
ly add DIR to ltrpathdirs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl The ltrpa=
thdirs will be appended to $LTLIBNAME at the end.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 haveit=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for x in $ltr=
pathdirs; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tes=
t &quot;X$x&quot; =3D &quot;X$found_dir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 haveit=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -z &q=
uot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ltrpat=
hdirs=3D&quot;$ltrpathdirs $found_dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl The hardc=
oding into $LIBNAME is system dependent.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot=
;$acl_hardcode_direct&quot; =3D yes; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Us=
ing DIR/libNAME.so during linking hardcodes DIR into the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl re=
sulting binary.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIB[]N=
AME=3D&quot;${LIB[]NAME}${LIB[]NAME:+ }$found_so&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tes=
t -n &quot;$acl_hardcode_libdir_flag_spec&quot; &amp;&amp; test &quot;$acl_=
hardcode_minus_L&quot; =3D no; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl Use an explicit option to hardcode DIR into the resulting<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl binary.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 LIB[]NAME=3D&quot;${LIB[]NAME}${LIB[]NAME:+ }$found_so&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl Potentially add DIR to rpathdirs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl The rpathdirs will be appended to $LIBNAME at the end.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 haveit=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 for x in $rpathdirs; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if test &quot;X$x&quot; =3D &quot;X$found_dir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 haveit=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if test -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rpathdirs=3D&quot;$rpathdirs $found_dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl Rely on &quot;-L$found_dir&quot;.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl But don&#39;t add it if it&#39;s already contained in the LDFLAGS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl or the already constructed $LIBNAME<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 haveit=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 for x in $LDFLAGS $LIB[]NAME; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 AC_LIB_WITH_FINAL_PREFIX([eval x=3D\&quot;$x\&quot;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if test &quot;X$x&quot; =3D &quot;X-L$found_dir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 haveit=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if test -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 LIB[]NAME=3D&quot;${LIB[]NAME}${LIB[]NAME:+ }-L$found_dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if test &quot;$acl_hardcode_minus_L&quot; !=3D no; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl FIXME: Not sure whether we should use<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl &quot;-L$found_dir -l$name&quot; or &quot;-L$found_dir $found_s=
o&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl here.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 LIB[]NAME=3D&quot;${LIB[]NAME}${LIB[]NAME:+ }$found_so&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl We cannot use $acl_hardcode_runpath_var and LD_RUN_PATH<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl here, because this doesn&#39;t fit in flags passed to the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl compiler. So give up. No hardcoding. This affects only<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl very old systems.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl FIXME: Not sure whether we should use<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl &quot;-L$found_dir -l$name&quot; or &quot;-L$found_dir $found_s=
o&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl here.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 LIB[]NAME=3D&quot;${LIB[]NAME}${LIB[]NAME:+ }-l$name&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$foun=
d_a&quot; !=3D &quot;X&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Linking w=
ith a static library.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIB[]NAME=3D&=
quot;${LIB[]NAME}${LIB[]NAME:+ }$found_a&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl We should=
n&#39;t come here, but anyway it&#39;s good to have a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl fallback.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIB[]NAME=3D&=
quot;${LIB[]NAME}${LIB[]NAME:+ }-L$found_dir -l$name&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Assume the include file=
s are nearby.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 additional_includedir=3D<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$found_dir&quot;=
 in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */$acl_libdirstem | =
*/$acl_libdirstem/)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basedir=3D`ec=
ho &quot;X$found_dir&quot; | sed -e &#39;s,^X,,&#39; -e &quot;s,/$acl_libdi=
rstem/&quot;&#39;*$,,&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot=
;$name&quot; =3D &#39;$1&#39;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIB[]N=
AME[]_PREFIX=3D&quot;$basedir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 additional_in=
cludedir=3D&quot;$basedir/include&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */$acl_libdirstem2 |=
 */$acl_libdirstem2/)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basedir=3D`ec=
ho &quot;X$found_dir&quot; | sed -e &#39;s,^X,,&#39; -e &quot;s,/$acl_libdi=
rstem2/&quot;&#39;*$,,&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot=
;$name&quot; =3D &#39;$1&#39;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIB[]N=
AME[]_PREFIX=3D&quot;$basedir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 additional_in=
cludedir=3D&quot;$basedir/include&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$additional_=
includedir&quot; !=3D &quot;X&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Potentially add =
$additional_includedir to $INCNAME.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl But don&#39;t ad=
d it<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl=C2=A0 =C2=A01. i=
f it&#39;s the standard /usr/include,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl=C2=A0 =C2=A02. i=
f it&#39;s /usr/local/include and we are using GCC on Linux,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl=C2=A0 =C2=A03. i=
f it&#39;s already present in $CPPFLAGS or the already<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl=C2=A0 =C2=A0 =C2=
=A0 constructed $INCNAME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl=C2=A0 =C2=A04. i=
f it doesn&#39;t exist as a directory.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$addi=
tional_includedir&quot; !=3D &quot;X/usr/include&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 haveit=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot=
;X$additional_includedir&quot; =3D &quot;X/usr/local/include&quot;; then<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tes=
t -n &quot;$GCC&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 case $host_os in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 linux* | gnu* | k*bsd*-gnu) haveit=3Dyes;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -z &q=
uot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for x =
in $CPPFLAGS $INC[]NAME; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 AC_LIB_WITH_FINAL_PREFIX([eval x=3D\&quot;$x\&quot;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if test &quot;X$x&quot; =3D &quot;X-I$additional_includedir&quot;; then<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 haveit=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tes=
t -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if test -d &quot;$additional_includedir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl Really add $additional_includedir to $INCNAME.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 INC[]NAME=3D&quot;${INC[]NAME}${INC[]NAME:+ }-I$additional_included=
ir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Look for dependencies.<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$found_la&=
quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Read the .la fil=
e. It defines the variables<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl dlname, library_=
names, old_library, dependency_libs, current,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl age, revision, i=
nstalled, dlopen, dlpreopen, libdir.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 save_libdir=3D&quot;=
$libdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$found_la=
&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */* | *\\*) .=
 &quot;$found_la&quot; ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) . &quot;./=
$found_la&quot; ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir=3D&quot;$save=
_libdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl We use only depe=
ndency_libs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dep in $dependen=
cy_libs; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$d=
ep&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -L*)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 additional_libdir=3D`echo &quot;X$dep&quot; | sed -e &#39;s/^X-L//&#39;`<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl Potentially add $additional_libdir to $LIBNAME and $LTLIBNAME.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl But don&#39;t add it<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl=C2=A0 =C2=A01. if it&#39;s the standard /usr/lib,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl=C2=A0 =C2=A02. if it&#39;s /usr/local/lib and we are using GCC on Linu=
x,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl=C2=A0 =C2=A03. if it&#39;s already present in $LDFLAGS or the already<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl=C2=A0 =C2=A0 =C2=A0 constructed $LIBNAME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl=C2=A0 =C2=A04. if it doesn&#39;t exist as a directory.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if test &quot;X$additional_libdir&quot; !=3D &quot;X/usr/$acl_libdirstem&q=
uot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&amp;&amp; test &quot;X$additional_libdir&quot; !=3D &quot;X/=
usr/$acl_libdirstem2&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 haveit=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if test &quot;X$additional_libdir&quot; =3D &quot;X/usr/local/$acl_=
libdirstem&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|| test &quot;X$additional_libdir&quot; =3D &quot;X/us=
r/local/$acl_libdirstem2&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if test -n &quot;$GCC&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 case $host_os in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux* | gnu* | k*bsd*-gnu) haveit=3Dyes;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if test -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 haveit=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for x in $LDFLAGS $LIB[]NAME; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 AC_LIB_WITH_FINAL_PREFIX([eval x=3D\&quot;$x\&quot;])=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$x&quot; =3D &quot;X-L$additional_libd=
ir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 haveit=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if test -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if test -d &quot;$additional_libdir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Really add $additional_libdir to $LIBNAME.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIB[]NAME=3D&quot;${LIB[]NAME}${LIB[]NAME:+ }-=
L$additional_libdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 haveit=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for x in $LDFLAGS $LTLIB[]NAME; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 AC_LIB_WITH_FINAL_PREFIX([eval x=3D\&quot;$x\&quot;])=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$x&quot; =3D &quot;X-L$additional_libd=
ir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 haveit=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if test -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if test -d &quot;$additional_libdir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Really add $additional_libdir to $LTLIBNAM=
E.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LTLIB[]NAME=3D&quot;${LTLIB[]NAME}${LTLIB[]NAM=
E:+ }-L$additional_libdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -R*)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dir=3D`echo &quot;X$dep&quot; | sed -e &#39;s/^X-R//&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if test &quot;$enable_rpath&quot; !=3D no; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl Potentially add DIR to rpathdirs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl The rpathdirs will be appended to $LIBNAME at the end.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 haveit=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 for x in $rpathdirs; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if test &quot;X$x&quot; =3D &quot;X$dir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 haveit=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if test -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 rpathdirs=3D&quot;$rpathdirs $dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl Potentially add DIR to ltrpathdirs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dnl The ltrpathdirs will be appended to $LTLIBNAME at the end.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 haveit=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 for x in $ltrpathdirs; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if test &quot;X$x&quot; =3D &quot;X$dir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 haveit=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if test -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ltrpathdirs=3D&quot;$ltrpathdirs $dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -l*)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl Handle this in the next round.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 names_next_round=3D&quot;$names_next_round &quot;`echo &quot;X$dep&quot; |=
 sed -e &#39;s/^X-l//&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *.la)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl Handle this in the next round. Throw away the .la&#39;s<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl directory; it is already contained in a preceding -L<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl option.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 names_next_round=3D&quot;$names_next_round &quot;`echo &quot;X$dep&quot; |=
 sed -e &#39;s,^X.*/,,&#39; -e &#39;s,^lib,,&#39; -e &#39;s,\.la$,,&#39;`<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dnl Most likely an immediate library name.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 LIB[]NAME=3D&quot;${LIB[]NAME}${LIB[]NAME:+ }$dep&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 LTLIB[]NAME=3D&quot;${LTLIB[]NAME}${LTLIB[]NAME:+ }$dep&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Didn&#39;t find the lib=
rary; assume it is in the system directories<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl known to the linker and=
 runtime loader. (All the system<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl directories known to th=
e linker should also be known to the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl runtime loader, otherwi=
se the system is severely misconfigured.)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIB[]NAME=3D&quot;${LIB[]NA=
ME}${LIB[]NAME:+ }-l$name&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LTLIB[]NAME=3D&quot;${LTLIB=
[]NAME}${LTLIB[]NAME:+ }-l$name&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 done<br>
&gt; +=C2=A0 if test &quot;X$rpathdirs&quot; !=3D &quot;X&quot;; then<br>
&gt; +=C2=A0 =C2=A0 if test -n &quot;$acl_hardcode_libdir_separator&quot;; =
then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl Weird platform: only the last -rpath option =
counts, the user must<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl pass all path elements in one option. We can=
 arrange that for a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl single library, but not when more than one $=
LIBNAMEs are used.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 alldirs=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for found_dir in $rpathdirs; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 alldirs=3D&quot;${alldirs}${alldirs:+$acl=
_hardcode_libdir_separator}$found_dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl Note: acl_hardcode_libdir_flag_spec uses $li=
bdir and $wl.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 acl_save_libdir=3D&quot;$libdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 libdir=3D&quot;$alldirs&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 eval flag=3D\&quot;$acl_hardcode_libdir_flag_spe=
c\&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 libdir=3D&quot;$acl_save_libdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 LIB[]NAME=3D&quot;${LIB[]NAME}${LIB[]NAME:+ }$fl=
ag&quot;<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl The -rpath options are cumulative.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for found_dir in $rpathdirs; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 acl_save_libdir=3D&quot;$libdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir=3D&quot;$found_dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 eval flag=3D\&quot;$acl_hardcode_libdir_f=
lag_spec\&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir=3D&quot;$acl_save_libdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIB[]NAME=3D&quot;${LIB[]NAME}${LIB[]NAME=
:+ }$flag&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 if test &quot;X$ltrpathdirs&quot; !=3D &quot;X&quot;; then<br>
&gt; +=C2=A0 =C2=A0 dnl When using libtool, the option that works for both =
libraries and<br>
&gt; +=C2=A0 =C2=A0 dnl executables is -R. The -R options are cumulative.<b=
r>
&gt; +=C2=A0 =C2=A0 for found_dir in $ltrpathdirs; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 LTLIB[]NAME=3D&quot;${LTLIB[]NAME}${LTLIB[]NAME:=
+ }-R$found_dir&quot;<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 popdef([PACKLIBS])<br>
&gt; +=C2=A0 popdef([PACKUP])<br>
&gt; +=C2=A0 popdef([PACK])<br>
&gt; +=C2=A0 popdef([NAME])<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl AC_LIB_APPENDTOVAR(VAR, CONTENTS) appends the elements of CONTENT=
S to VAR,<br>
&gt; +dnl unless already present in VAR.<br>
&gt; +dnl Works only for CPPFLAGS, not for LIB* variables because that some=
times<br>
&gt; +dnl contains two or three consecutive elements that belong together.<=
br>
&gt; +AC_DEFUN([AC_LIB_APPENDTOVAR],<br>
&gt; +[<br>
&gt; +=C2=A0 for element in [$2]; do<br>
&gt; +=C2=A0 =C2=A0 haveit=3D<br>
&gt; +=C2=A0 =C2=A0 for x in $[$1]; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 AC_LIB_WITH_FINAL_PREFIX([eval x=3D\&quot;$x\&qu=
ot;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test &quot;X$x&quot; =3D &quot;X$element&quot=
;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 haveit=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 if test -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 [$1]=3D&quot;${[$1]}${[$1]:+ }$element&quot;<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 done<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl For those cases where a variable contains several -L and -l optio=
ns<br>
&gt; +dnl referring to unknown libraries and directories, this macro determ=
ines the<br>
&gt; +dnl necessary additional linker options for the runtime path.<br>
&gt; +dnl AC_LIB_LINKFLAGS_FROM_LIBS([LDADDVAR], [LIBSVALUE], [USE-LIBTOOL]=
)<br>
&gt; +dnl sets LDADDVAR to linker options needed together with LIBSVALUE.<b=
r>
&gt; +dnl If USE-LIBTOOL evaluates to non-empty, linking with libtool is as=
sumed,<br>
&gt; +dnl otherwise linking without libtool is assumed.<br>
&gt; +AC_DEFUN([AC_LIB_LINKFLAGS_FROM_LIBS],<br>
&gt; +[<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_RPATH])<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])<br>
&gt; +=C2=A0 $1=3D<br>
&gt; +=C2=A0 if test &quot;$enable_rpath&quot; !=3D no; then<br>
&gt; +=C2=A0 =C2=A0 if test -n &quot;$acl_hardcode_libdir_flag_spec&quot; &=
amp;&amp; test &quot;$acl_hardcode_minus_L&quot; =3D no; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl Use an explicit option to hardcode directori=
es into the resulting<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl binary.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 rpathdirs=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 next=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for opt in $2; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$next&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir=3D&quot;$next&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl No need to hardcode the standa=
rd /usr/lib.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$dir&quot; !=3D &qu=
ot;X/usr/$acl_libdirstem&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; test &quot=
;X$dir&quot; !=3D &quot;X/usr/$acl_libdirstem2&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpathdirs=3D&quot;$rpathdir=
s $dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 next=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case $opt in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -L) next=3Dyes ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -L*) dir=3D`echo &quot;X$op=
t&quot; | sed -e &#39;s,^X-L,,&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl No =
need to hardcode the standard /usr/lib.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test=
 &quot;X$dir&quot; !=3D &quot;X/usr/$acl_libdirstem&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &amp;&amp; test &quot;X$dir&quot; !=3D &quot;X/usr/$acl_libdirstem2&quot;;=
 then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
rpathdirs=3D&quot;$rpathdirs $dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next=3D=
 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) next=3D ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test &quot;X$rpathdirs&quot; !=3D &quot;X&quo=
t;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;&quot;$3&quot;&quot;; th=
en<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl libtool is used for linking. U=
se -R options.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dir in $rpathdirs; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $1=3D&quot;${$1}${$1:+ }-R$=
dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl The linker is used for linking=
 directly.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$acl_hardcode_lib=
dir_separator&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Weird platform: only th=
e last -rpath option counts, the user<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl must pass all path elem=
ents in one option.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alldirs=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dir in $rpathdirs; do<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alldirs=3D&quot;${al=
ldirs}${alldirs:+$acl_hardcode_libdir_separator}$dir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acl_save_libdir=3D&quot;$li=
bdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir=3D&quot;$alldirs&quo=
t;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval flag=3D\&quot;$acl_har=
dcode_libdir_flag_spec\&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir=3D&quot;$acl_save_li=
bdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $1=3D&quot;$flag&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl The -rpath options are =
cumulative.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dir in $rpathdirs; do<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acl_save_libdir=3D&q=
uot;$libdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir=3D&quot;$dir&=
quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval flag=3D\&quot;$=
acl_hardcode_libdir_flag_spec\&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir=3D&quot;$acl_=
save_libdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $1=3D&quot;${$1}${$1=
:+ }$flag&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 AC_SUBST([$1])<br>
&gt; +])<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/=
lib-prefix.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/li=
b-prefix.m4<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..8adb17bb916<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-pre=
fix.m4<br>
&gt; @@ -0,0 +1,249 @@<br>
&gt; +# lib-prefix.m4 serial 14<br>
&gt; +dnl Copyright (C) 2001-2005, 2008-2019 Free Software Foundation, Inc.=
<br>
&gt; +dnl This file is free software; the Free Software Foundation<br>
&gt; +dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; +dnl with or without modifications, as long as this notice is preserve=
d.<br>
&gt; +<br>
&gt; +dnl From Bruno Haible.<br>
&gt; +<br>
&gt; +dnl AC_LIB_PREFIX adds to the CPPFLAGS and LDFLAGS the flags that are=
 needed<br>
&gt; +dnl to access previously installed libraries. The basic assumption is=
 that<br>
&gt; +dnl a user will want packages to use other packages he previously ins=
talled<br>
&gt; +dnl with the same --prefix option.<br>
&gt; +dnl This macro is not needed if only AC_LIB_LINKFLAGS is used to loca=
te<br>
&gt; +dnl libraries, but is otherwise very convenient.<br>
&gt; +AC_DEFUN([AC_LIB_PREFIX],<br>
&gt; +[<br>
&gt; +=C2=A0 AC_BEFORE([$0], [AC_LIB_LINKFLAGS])<br>
&gt; +=C2=A0 AC_REQUIRE([AC_PROG_CC])<br>
&gt; +=C2=A0 AC_REQUIRE([AC_CANONICAL_HOST])<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])<br>
&gt; +=C2=A0 AC_REQUIRE([AC_LIB_PREPARE_PREFIX])<br>
&gt; +=C2=A0 dnl By default, look in $includedir and $libdir.<br>
&gt; +=C2=A0 use_additional=3Dyes<br>
&gt; +=C2=A0 AC_LIB_WITH_FINAL_PREFIX([<br>
&gt; +=C2=A0 =C2=A0 eval additional_includedir=3D\&quot;$includedir\&quot;<=
br>
&gt; +=C2=A0 =C2=A0 eval additional_libdir=3D\&quot;$libdir\&quot;<br>
&gt; +=C2=A0 ])<br>
&gt; +=C2=A0 AC_ARG_WITH([lib-prefix],<br>
&gt; +[[=C2=A0 --with-lib-prefix[=3DDIR] search for libraries in DIR/includ=
e and DIR/lib<br>
&gt; +=C2=A0 --without-lib-prefix=C2=A0 =C2=A0 don&#39;t search for librari=
es in includedir and libdir]],<br>
&gt; +[<br>
&gt; +=C2=A0 =C2=A0 if test &quot;X$withval&quot; =3D &quot;Xno&quot;; then=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 use_additional=3Dno<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test &quot;X$withval&quot; =3D &quot;X&quot;;=
 then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LIB_WITH_FINAL_PREFIX([<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval additional_includedir=3D\&quo=
t;$includedir\&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval additional_libdir=3D\&quot;$l=
ibdir\&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 additional_includedir=3D&quot;$withval/in=
clude&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 additional_libdir=3D&quot;$withval/$acl_l=
ibdirstem&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +])<br>
&gt; +=C2=A0 if test $use_additional =3D yes; then<br>
&gt; +=C2=A0 =C2=A0 dnl Potentially add $additional_includedir to $CPPFLAGS=
.<br>
&gt; +=C2=A0 =C2=A0 dnl But don&#39;t add it<br>
&gt; +=C2=A0 =C2=A0 dnl=C2=A0 =C2=A01. if it&#39;s the standard /usr/includ=
e,<br>
&gt; +=C2=A0 =C2=A0 dnl=C2=A0 =C2=A02. if it&#39;s already present in $CPPF=
LAGS,<br>
&gt; +=C2=A0 =C2=A0 dnl=C2=A0 =C2=A03. if it&#39;s /usr/local/include and w=
e are using GCC on Linux,<br>
&gt; +=C2=A0 =C2=A0 dnl=C2=A0 =C2=A04. if it doesn&#39;t exist as a directo=
ry.<br>
&gt; +=C2=A0 =C2=A0 if test &quot;X$additional_includedir&quot; !=3D &quot;=
X/usr/include&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 haveit=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for x in $CPPFLAGS; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LIB_WITH_FINAL_PREFIX([eval x=3D\&quot=
;$x\&quot;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$x&quot; =3D &quot;X-I$add=
itional_includedir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 haveit=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$additional_includedir&quo=
t; =3D &quot;X/usr/local/include&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$GCC&quot;; then<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case $host_os in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux* | gnu* | k*bs=
d*-gnu) haveit=3Dyes;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -d &quot;$additional_inclu=
dedir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Really add $additional_=
includedir to $CPPFLAGS.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;${CPPFLAGS=
}${CPPFLAGS:+ }-I$additional_includedir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 dnl Potentially add $additional_libdir to $LDFLAGS.<br>
&gt; +=C2=A0 =C2=A0 dnl But don&#39;t add it<br>
&gt; +=C2=A0 =C2=A0 dnl=C2=A0 =C2=A01. if it&#39;s the standard /usr/lib,<b=
r>
&gt; +=C2=A0 =C2=A0 dnl=C2=A0 =C2=A02. if it&#39;s already present in $LDFL=
AGS,<br>
&gt; +=C2=A0 =C2=A0 dnl=C2=A0 =C2=A03. if it&#39;s /usr/local/lib and we ar=
e using GCC on Linux,<br>
&gt; +=C2=A0 =C2=A0 dnl=C2=A0 =C2=A04. if it doesn&#39;t exist as a directo=
ry.<br>
&gt; +=C2=A0 =C2=A0 if test &quot;X$additional_libdir&quot; !=3D &quot;X/us=
r/$acl_libdirstem&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 haveit=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for x in $LDFLAGS; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LIB_WITH_FINAL_PREFIX([eval x=3D\&quot=
;$x\&quot;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$x&quot; =3D &quot;X-L$add=
itional_libdir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 haveit=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;X$additional_libdir&quot; =
=3D &quot;X/usr/local/$acl_libdirstem&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$GCC&quot;; then<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case $host_os in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux*) haveit=3Dyes=
;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -z &quot;$haveit&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -d &quot;$additional_libdi=
r&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Really add $additional_=
libdir to $LDFLAGS.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LDFLAGS=3D&quot;${LDFLAGS}$=
{LDFLAGS:+ }-L$additional_libdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 fi<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl AC_LIB_PREPARE_PREFIX creates variables acl_final_prefix,<br>
&gt; +dnl acl_final_exec_prefix, containing the values to which $prefix and=
<br>
&gt; +dnl $exec_prefix will expand at the end of the configure script.<br>
&gt; +AC_DEFUN([AC_LIB_PREPARE_PREFIX],<br>
&gt; +[<br>
&gt; +=C2=A0 dnl Unfortunately, prefix and exec_prefix get only finally det=
ermined<br>
&gt; +=C2=A0 dnl at the end of configure.<br>
&gt; +=C2=A0 if test &quot;X$prefix&quot; =3D &quot;XNONE&quot;; then<br>
&gt; +=C2=A0 =C2=A0 acl_final_prefix=3D&quot;$ac_default_prefix&quot;<br>
&gt; +=C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 acl_final_prefix=3D&quot;$prefix&quot;<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 if test &quot;X$exec_prefix&quot; =3D &quot;XNONE&quot;; then<=
br>
&gt; +=C2=A0 =C2=A0 acl_final_exec_prefix=3D&#39;${prefix}&#39;<br>
&gt; +=C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 acl_final_exec_prefix=3D&quot;$exec_prefix&quot;<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 acl_save_prefix=3D&quot;$prefix&quot;<br>
&gt; +=C2=A0 prefix=3D&quot;$acl_final_prefix&quot;<br>
&gt; +=C2=A0 eval acl_final_exec_prefix=3D\&quot;$acl_final_exec_prefix\&qu=
ot;<br>
&gt; +=C2=A0 prefix=3D&quot;$acl_save_prefix&quot;<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl AC_LIB_WITH_FINAL_PREFIX([statement]) evaluates statement, with t=
he<br>
&gt; +dnl variables prefix and exec_prefix bound to the values they will ha=
ve<br>
&gt; +dnl at the end of the configure script.<br>
&gt; +AC_DEFUN([AC_LIB_WITH_FINAL_PREFIX],<br>
&gt; +[<br>
&gt; +=C2=A0 acl_save_prefix=3D&quot;$prefix&quot;<br>
&gt; +=C2=A0 prefix=3D&quot;$acl_final_prefix&quot;<br>
&gt; +=C2=A0 acl_save_exec_prefix=3D&quot;$exec_prefix&quot;<br>
&gt; +=C2=A0 exec_prefix=3D&quot;$acl_final_exec_prefix&quot;<br>
&gt; +=C2=A0 $1<br>
&gt; +=C2=A0 exec_prefix=3D&quot;$acl_save_exec_prefix&quot;<br>
&gt; +=C2=A0 prefix=3D&quot;$acl_save_prefix&quot;<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl AC_LIB_PREPARE_MULTILIB creates<br>
&gt; +dnl - a variable acl_libdirstem, containing the basename of the libdi=
r, either<br>
&gt; +dnl=C2=A0 =C2=A0&quot;lib&quot; or &quot;lib64&quot; or &quot;lib/64&=
quot;,<br>
&gt; +dnl - a variable acl_libdirstem2, as a secondary possible value for<b=
r>
&gt; +dnl=C2=A0 =C2=A0acl_libdirstem, either the same as acl_libdirstem or =
&quot;lib/sparcv9&quot; or<br>
&gt; +dnl=C2=A0 =C2=A0&quot;lib/amd64&quot;.<br>
&gt; +AC_DEFUN([AC_LIB_PREPARE_MULTILIB],<br>
&gt; +[<br>
&gt; +=C2=A0 dnl There is no formal standard regarding lib and lib64.<br>
&gt; +=C2=A0 dnl On glibc systems, the current practice is that on a system=
 supporting<br>
&gt; +=C2=A0 dnl 32-bit and 64-bit instruction sets or ABIs, 64-bit librari=
es go under<br>
&gt; +=C2=A0 dnl $prefix/lib64 and 32-bit libraries go under $prefix/lib. W=
e determine<br>
&gt; +=C2=A0 dnl the compiler&#39;s default mode by looking at the compiler=
&#39;s library search<br>
&gt; +=C2=A0 dnl path. If at least one of its elements ends in /lib64 or po=
ints to a<br>
&gt; +=C2=A0 dnl directory whose absolute pathname ends in /lib64, we assum=
e a 64-bit ABI.<br>
&gt; +=C2=A0 dnl Otherwise we use the default, namely &quot;lib&quot;.<br>
&gt; +=C2=A0 dnl On Solaris systems, the current practice is that on a syst=
em supporting<br>
&gt; +=C2=A0 dnl 32-bit and 64-bit instruction sets or ABIs, 64-bit librari=
es go under<br>
&gt; +=C2=A0 dnl $prefix/lib/64 (which is a symlink to either $prefix/lib/s=
parcv9 or<br>
&gt; +=C2=A0 dnl $prefix/lib/amd64) and 32-bit libraries go under $prefix/l=
ib.<br>
&gt; +=C2=A0 AC_REQUIRE([AC_CANONICAL_HOST])<br>
&gt; +=C2=A0 AC_REQUIRE([gl_HOST_CPU_C_ABI_32BIT])<br>
&gt; +<br>
&gt; +=C2=A0 case &quot;$host_os&quot; in<br>
&gt; +=C2=A0 =C2=A0 solaris*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 AC_CACHE_CHECK([for 64-bit host], [gl_cv_solaris=
_64bit],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_COMPILE_IFELSE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_SOURCE(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[#ifdef _LP64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ok;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error f=
ail<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_solaris_64bit=3Dyes],=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gl_cv_solaris_64bit=3Dno])<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]);;<br>
&gt; +=C2=A0 esac<br>
&gt; +<br>
&gt; +=C2=A0 dnl Allow the user to override the result by setting acl_cv_li=
bdirstems.<br>
&gt; +=C2=A0 AC_CACHE_CHECK([for the common suffixes of directories in the =
library search path],<br>
&gt; +=C2=A0 =C2=A0 [acl_cv_libdirstems],<br>
&gt; +=C2=A0 =C2=A0 [acl_libdirstem=3Dlib<br>
&gt; +=C2=A0 =C2=A0 =C2=A0acl_libdirstem2=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case &quot;$host_os&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0solaris*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl See Solaris 10 Software Develop=
er Collection &gt; Solaris 64-bit Developer&#39;s Guide &gt; The Developmen=
t Environment<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl &lt;<a href=3D"https://docs.ora=
cle.com/cd/E19253-01/816-5138/dev-env/index.html" rel=3D"noreferrer" target=
=3D"_blank">https://docs.oracle.com/cd/E19253-01/816-5138/dev-env/index.htm=
l</a>&gt;.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl &quot;Portable Makefiles should=
 refer to any library directories using the 64 symbolic link.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl But we want to recognize the sp=
arcv9 or amd64 subdirectory also if the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl symlink is missing, so we set a=
cl_libdirstem2 too.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test $gl_cv_solaris_64bit =3D ye=
s; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acl_libdirstem=3Dlib/64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$host_cpu&quot; i=
n<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sparc*)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 acl_libdirstem2=3Dlib/sparcv9 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i*86 | x86_64) acl_li=
bdirstem2=3Dlib/amd64 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl If $CC generates code for a 32-=
bit ABI, the libraries are<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl surely under $prefix/lib, not $=
prefix/lib64.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;$HOST_CPU_C_ABI_32BIT=
&quot; !=3D yes; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl The result is a property=
 of the system. However, non-system<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl compilers sometimes have=
 odd library search paths. Therefore<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl prefer asking /usr/bin/g=
cc, if available, rather than $CC.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0searchpath=3D`(if test -f /u=
sr/bin/gcc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; LC_ALL=3DC /usr/bin/gcc -print-searc=
h-dirs &gt;/dev/null 2&gt;/dev/null; then \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 LC_ALL=3DC /usr/bin/gcc -print-search-dirs; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 else \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 LC_ALL=3DC $CC -print-search-dirs; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 fi) 2&gt;/dev/null \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| sed -n -e &#39;s,^libraries: ,,p&#39; | sed -e &#39;s,^=3D,=
,&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -n &quot;$searchpath=
&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acl_save_IFS=3D&quot;=
${IFS=3D=C2=A0 =C2=A0 }&quot;; IFS=3D&quot;:&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for searchdir in $sea=
rchpath; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -d &qu=
ot;$searchdir&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &q=
uot;$searchdir&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
*/lib64/ | */lib64 ) acl_libdirstem=3Dlib64 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
*/../ | */.. )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0# Better ignore directories of this form. They are misleading.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
*) searchdir=3D`cd &quot;$searchdir&quot; &amp;&amp; pwd`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 case &quot;$searchdir&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 */lib64 ) acl_libdirstem=3Dlib64 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 esac ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IFS=3D&quot;$acl_save=
_IFS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0test -n &quot;$acl_libdirstem2&quot; || acl_libdi=
rstem2=3D&quot;$acl_libdirstem&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0acl_cv_libdirstems=3D&quot;$acl_libdirstem,$acl_l=
ibdirstem2&quot;<br>
&gt; +=C2=A0 =C2=A0 ])<br>
&gt; +=C2=A0 # Decompose acl_cv_libdirstems into acl_libdirstem and acl_lib=
dirstem2.<br>
&gt; +=C2=A0 acl_libdirstem=3D`echo &quot;$acl_cv_libdirstems&quot; | sed -=
e &#39;s/,.*//&#39;`<br>
&gt; +=C2=A0 acl_libdirstem2=3D`echo &quot;$acl_cv_libdirstems&quot; | sed =
-e &#39;/,/s/.*,//&#39;`<br>
&gt; +])<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/=
nls.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4<br=
>
&gt; new file mode 100644<br>
&gt; index 00000000000..b62f6148570<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4<=
br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +# nls.m4 serial 5 (gettext-0.18)<br>
&gt; +dnl Copyright (C) 1995-2003, 2005-2006, 2008-2014, 2016, 2019 Free So=
ftware<br>
&gt; +dnl Foundation, Inc.<br>
&gt; +dnl This file is free software; the Free Software Foundation<br>
&gt; +dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; +dnl with or without modifications, as long as this notice is preserve=
d.<br>
&gt; +dnl<br>
&gt; +dnl This file can be used in projects which are not available under<b=
r>
&gt; +dnl the GNU General Public License or the GNU Library General Public<=
br>
&gt; +dnl License but which still want to provide support for the GNU gette=
xt<br>
&gt; +dnl functionality.<br>
&gt; +dnl Please note that the actual code of the GNU gettext library is co=
vered<br>
&gt; +dnl by the GNU Library General Public License, and the rest of the GN=
U<br>
&gt; +dnl gettext package is covered by the GNU General Public License.<br>
&gt; +dnl They are *not* in the public domain.<br>
&gt; +<br>
&gt; +dnl Authors:<br>
&gt; +dnl=C2=A0 =C2=A0Ulrich Drepper &lt;<a href=3D"mailto:drepper@cygnus.c=
om" target=3D"_blank">drepper@cygnus.com</a>&gt;, 1995-2000.<br>
&gt; +dnl=C2=A0 =C2=A0Bruno Haible &lt;<a href=3D"mailto:haible@clisp.cons.=
org" target=3D"_blank">haible@clisp.cons.org</a>&gt;, 2000-2003.<br>
&gt; +<br>
&gt; +AC_PREREQ([2.50])<br>
&gt; +<br>
&gt; +AC_DEFUN([AM_NLS],<br>
&gt; +[<br>
&gt; +=C2=A0 AC_MSG_CHECKING([whether NLS is requested])<br>
&gt; +=C2=A0 dnl Default is enabled NLS<br>
&gt; +=C2=A0 AC_ARG_ENABLE([nls],<br>
&gt; +=C2=A0 =C2=A0 [=C2=A0 --disable-nls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0do not use Native Language Support],<br>
&gt; +=C2=A0 =C2=A0 USE_NLS=3D$enableval, USE_NLS=3Dyes)<br>
&gt; +=C2=A0 AC_MSG_RESULT([$USE_NLS])<br>
&gt; +=C2=A0 AC_SUBST([USE_NLS])<br>
&gt; +])<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/=
po.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..143792dba56<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4<b=
r>
&gt; @@ -0,0 +1,450 @@<br>
&gt; +# po.m4 serial 30 (gettext-0.20)<br>
&gt; +dnl Copyright (C) 1995-2014, 2016, 2018-2019 Free Software Foundation=
, Inc.<br>
&gt; +dnl This file is free software; the Free Software Foundation<br>
&gt; +dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; +dnl with or without modifications, as long as this notice is preserve=
d.<br>
&gt; +dnl<br>
&gt; +dnl This file can be used in projects which are not available under<b=
r>
&gt; +dnl the GNU General Public License or the GNU Library General Public<=
br>
&gt; +dnl License but which still want to provide support for the GNU gette=
xt<br>
&gt; +dnl functionality.<br>
&gt; +dnl Please note that the actual code of the GNU gettext library is co=
vered<br>
&gt; +dnl by the GNU Library General Public License, and the rest of the GN=
U<br>
&gt; +dnl gettext package is covered by the GNU General Public License.<br>
&gt; +dnl They are *not* in the public domain.<br>
&gt; +<br>
&gt; +dnl Authors:<br>
&gt; +dnl=C2=A0 =C2=A0Ulrich Drepper &lt;<a href=3D"mailto:drepper@cygnus.c=
om" target=3D"_blank">drepper@cygnus.com</a>&gt;, 1995-2000.<br>
&gt; +dnl=C2=A0 =C2=A0Bruno Haible &lt;<a href=3D"mailto:haible@clisp.cons.=
org" target=3D"_blank">haible@clisp.cons.org</a>&gt;, 2000-2003.<br>
&gt; +<br>
&gt; +AC_PREREQ([2.60])<br>
&gt; +<br>
&gt; +dnl Checks for all prerequisites of the po subdirectory.<br>
&gt; +AC_DEFUN([AM_PO_SUBDIRS],<br>
&gt; +[<br>
&gt; +=C2=A0 AC_REQUIRE([AC_PROG_MAKE_SET])dnl<br>
&gt; +=C2=A0 AC_REQUIRE([AC_PROG_INSTALL])dnl<br>
&gt; +=C2=A0 AC_REQUIRE([AC_PROG_MKDIR_P])dnl<br>
&gt; +=C2=A0 AC_REQUIRE([AC_PROG_SED])dnl<br>
&gt; +=C2=A0 AC_REQUIRE([AM_NLS])dnl<br>
&gt; +<br>
&gt; +=C2=A0 dnl Release version of the gettext macros. This is used to ens=
ure that<br>
&gt; +=C2=A0 dnl the gettext macros and po/<a href=3D"http://Makefile.in.in=
" rel=3D"noreferrer" target=3D"_blank">Makefile.in.in</a> are in sync.<br>
&gt; +=C2=A0 AC_SUBST([GETTEXT_MACRO_VERSION], [0.20])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Perform the following tests also if --disable-nls has been=
 given,<br>
&gt; +=C2=A0 dnl because they are needed for &quot;make dist&quot; to work.=
<br>
&gt; +<br>
&gt; +=C2=A0 dnl Search for GNU msgfmt in the PATH.<br>
&gt; +=C2=A0 dnl The first test excludes Solaris msgfmt and early GNU msgfm=
t versions.<br>
&gt; +=C2=A0 dnl The second test excludes FreeBSD msgfmt.<br>
&gt; +=C2=A0 AM_PATH_PROG_WITH_TEST(MSGFMT, msgfmt,<br>
&gt; +=C2=A0 =C2=A0 [$ac_dir/$ac_word --statistics /dev/null &gt;&amp;]AS_M=
ESSAGE_LOG_FD[ 2&gt;&amp;1 &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(if $ac_dir/$ac_word --statistics /dev/null 2&gt;=
&amp;1 &gt;/dev/null | grep usage &gt;/dev/null; then exit 1; else exit 0; =
fi)],<br>
&gt; +=C2=A0 =C2=A0 :)<br>
&gt; +=C2=A0 AC_PATH_PROG([GMSGFMT], [gmsgfmt], [$MSGFMT])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Test whether it is GNU msgfmt &gt;=3D 0.15.<br>
&gt; +changequote(,)dnl<br>
&gt; +=C2=A0 case `$GMSGFMT --version | sed 1q | sed -e &#39;s,^[^0-9]*,,&#=
39;` in<br>
&gt; +=C2=A0 =C2=A0 &#39;&#39; | 0.[0-9] | 0.[0-9].* | 0.1[0-4] | 0.1[0-4].=
*) GMSGFMT_015=3D: ;;<br>
&gt; +=C2=A0 =C2=A0 *) GMSGFMT_015=3D$GMSGFMT ;;<br>
&gt; +=C2=A0 esac<br>
&gt; +changequote([,])dnl<br>
&gt; +=C2=A0 AC_SUBST([GMSGFMT_015])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Search for GNU xgettext 0.12 or newer in the PATH.<br>
&gt; +=C2=A0 dnl The first test excludes Solaris xgettext and early GNU xge=
ttext versions.<br>
&gt; +=C2=A0 dnl The second test excludes FreeBSD xgettext.<br>
&gt; +=C2=A0 AM_PATH_PROG_WITH_TEST(XGETTEXT, xgettext,<br>
&gt; +=C2=A0 =C2=A0 [$ac_dir/$ac_word --omit-header --copyright-holder=3D -=
-msgid-bugs-address=3D /dev/null &gt;&amp;]AS_MESSAGE_LOG_FD[ 2&gt;&amp;1 &=
amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(if $ac_dir/$ac_word --omit-header --copyright-ho=
lder=3D --msgid-bugs-address=3D /dev/null 2&gt;&amp;1 &gt;/dev/null | grep =
usage &gt;/dev/null; then exit 1; else exit 0; fi)],<br>
&gt; +=C2=A0 =C2=A0 :)<br>
&gt; +=C2=A0 dnl Remove leftover from FreeBSD xgettext call.<br>
&gt; +=C2=A0 rm -f messages.po<br>
&gt; +<br>
&gt; +=C2=A0 dnl Test whether it is GNU xgettext &gt;=3D 0.15.<br>
&gt; +changequote(,)dnl<br>
&gt; +=C2=A0 case `$XGETTEXT --version | sed 1q | sed -e &#39;s,^[^0-9]*,,&=
#39;` in<br>
&gt; +=C2=A0 =C2=A0 &#39;&#39; | 0.[0-9] | 0.[0-9].* | 0.1[0-4] | 0.1[0-4].=
*) XGETTEXT_015=3D: ;;<br>
&gt; +=C2=A0 =C2=A0 *) XGETTEXT_015=3D$XGETTEXT ;;<br>
&gt; +=C2=A0 esac<br>
&gt; +changequote([,])dnl<br>
&gt; +=C2=A0 AC_SUBST([XGETTEXT_015])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Search for GNU msgmerge 0.11 or newer in the PATH.<br>
&gt; +=C2=A0 AM_PATH_PROG_WITH_TEST(MSGMERGE, msgmerge,<br>
&gt; +=C2=A0 =C2=A0 [$ac_dir/$ac_word --update -q /dev/null /dev/null &gt;&=
amp;]AS_MESSAGE_LOG_FD[ 2&gt;&amp;1], :)<br>
&gt; +<br>
&gt; +=C2=A0 dnl Test whether it is GNU msgmerge &gt;=3D 0.20.<br>
&gt; +=C2=A0 if LC_ALL=3DC $MSGMERGE --help | grep &#39; --for-msgfmt &#39;=
 &gt;/dev/null; then<br>
&gt; +=C2=A0 =C2=A0 MSGMERGE_FOR_MSGFMT_OPTION=3D&#39;--for-msgfmt&#39;<br>
&gt; +=C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 dnl Test whether it is GNU msgmerge &gt;=3D 0.12.<br>
&gt; +=C2=A0 =C2=A0 if LC_ALL=3DC $MSGMERGE --help | grep &#39; --no-fuzzy-=
matching &#39; &gt;/dev/null; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 MSGMERGE_FOR_MSGFMT_OPTION=3D&#39;--no-fuzzy-mat=
ching --no-location --quiet&#39;<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl With these old versions, $(MSGMERGE) $(MSGME=
RGE_FOR_MSGFMT_OPTION) is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl slow. But this is not a big problem, as such=
 old gettext versions are<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 dnl hardly in use any more.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 MSGMERGE_FOR_MSGFMT_OPTION=3D&#39;--no-location =
--quiet&#39;<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 AC_SUBST([MSGMERGE_FOR_MSGFMT_OPTION])<br>
&gt; +<br>
&gt; +=C2=A0 dnl Support for AM_XGETTEXT_OPTION.<br>
&gt; +=C2=A0 test -n &quot;${XGETTEXT_EXTRA_OPTIONS+set}&quot; || XGETTEXT_=
EXTRA_OPTIONS=3D<br>
&gt; +=C2=A0 AC_SUBST([XGETTEXT_EXTRA_OPTIONS])<br>
&gt; +<br>
&gt; +=C2=A0 AC_CONFIG_COMMANDS([po-directories], [[<br>
&gt; +=C2=A0 =C2=A0 for ac_file in $CONFIG_FILES; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 # Support &quot;outfile[:infile[:infile...]]&quo=
t;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 case &quot;$ac_file&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *:*) ac_file=3D`echo &quot;$ac_file&quot;=
|sed &#39;s%:.*%%&#39;` ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 # PO directories have a Makefile.in generated fr=
om <a href=3D"http://Makefile.in.in" rel=3D"noreferrer" target=3D"_blank">M=
akefile.in.in</a>.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 case &quot;$ac_file&quot; in */Makefile.in)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Adjust a relative srcdir.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_dir=3D`echo &quot;$ac_file&quot;|sed &=
#39;s%/[^/][^/]*$%%&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_dir_suffix=3D/`echo &quot;$ac_dir&quot=
;|sed &#39;s%^\./%%&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_dots=3D`echo &quot;$ac_dir_suffix&quot=
;|sed &#39;s%/[^/]*%../%g&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # In autoconf-2.13 it is called $ac_given=
_srcdir.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # In autoconf-2.50 it is called $srcdir.<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 test -n &quot;$ac_given_srcdir&quot; || a=
c_given_srcdir=3D&quot;$srcdir&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$ac_given_srcdir&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .)=C2=A0 top_srcdir=3D`echo $ac_do=
ts|sed &#39;s%/$%%&#39;` ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*) top_srcdir=3D&quot;$ac_given_s=
rcdir&quot; ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)=C2=A0 top_srcdir=3D&quot;$ac_do=
ts$ac_given_srcdir&quot; ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Treat a directory as a PO directory if =
and only if it has a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # POTFILES.in file. This allows packages =
to have multiple PO<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # directories under different names or in=
 different locations.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f &quot;$ac_given_srcdir/$ac_dir=
/POTFILES.in&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;$ac_dir/POTFILES&quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -n &quot;$as_me&quot; &amp;&a=
mp; echo &quot;$as_me: creating $ac_dir/POTFILES&quot; || echo &quot;creati=
ng $ac_dir/POTFILES&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gt_tab=3D`printf &#39;\t&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &quot;$ac_given_srcdir/$ac_dir=
/POTFILES.in&quot; | sed -e &quot;/^#/d&quot; -e &quot;/^[ ${gt_tab}]*\$/d&=
quot; -e &quot;s,.*,=C2=A0 =C2=A0 =C2=A0$top_srcdir/&amp; \\\\,&quot; | sed=
 -e &quot;\$s/\(.*\) \\\\/\1/&quot; &gt; &quot;$ac_dir/POTFILES&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 POMAKEFILEDEPS=3D&quot;POTFILES.in=
&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # ALL_LINGUAS, POFILES, UPDATEPOFI=
LES, DUMMYPOFILES, GMOFILES depend<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # on $ac_dir but don&#39;t depend =
on user-specified configuration<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # parameters.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f &quot;$ac_given_srcdir/=
$ac_dir/LINGUAS&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # The LINGUAS file contains=
 the set of available languages.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$OBSOLETE_=
ALL_LINGUAS&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -n &quot;$as_me=
&quot; &amp;&amp; echo &quot;$as_me: setting ALL_LINGUAS in <a href=3D"http=
://configure.in" rel=3D"noreferrer" target=3D"_blank">configure.in</a> is o=
bsolete&quot; || echo &quot;setting ALL_LINGUAS in <a href=3D"http://config=
ure.in" rel=3D"noreferrer" target=3D"_blank">configure.in</a> is obsolete&q=
uot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ALL_LINGUAS=3D`sed -e &quot=
;/^#/d&quot; -e &quot;s/#.*//&quot; &quot;$ac_given_srcdir/$ac_dir/LINGUAS&=
quot;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 POMAKEFILEDEPS=3D&quot;$POM=
AKEFILEDEPS LINGUAS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # The set of available lang=
uages was given in <a href=3D"http://configure.in" rel=3D"noreferrer" targe=
t=3D"_blank">configure.in</a>.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ALL_LINGUAS=3D$OBSOLETE_ALL=
_LINGUAS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Compute POFILES<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach=
 lang, $(ALL_LINGUAS), $(srcdir)/$(lang).po)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Compute UPDATEPOFILES<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach=
 lang, $(ALL_LINGUAS), $(lang).po-update)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Compute DUMMYPOFILES<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach=
 lang, $(ALL_LINGUAS), $(lang).nop)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Compute GMOFILES<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach=
 lang, $(ALL_LINGUAS), $(srcdir)/$(lang).gmo)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$ac_given_srcdir&quot; =
in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .) srcdirpre=3D ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) srcdirpre=3D&#39;$(srcdi=
r)/&#39; ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 POFILES=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UPDATEPOFILES=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DUMMYPOFILES=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GMOFILES=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for lang in $ALL_LINGUAS; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 POFILES=3D&quot;$POFILES $s=
rcdirpre$lang.po&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UPDATEPOFILES=3D&quot;$UPDA=
TEPOFILES $lang.po-update&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DUMMYPOFILES=3D&quot;$DUMMY=
POFILES $lang.nop&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GMOFILES=3D&quot;$GMOFILES =
$srcdirpre$lang.gmo&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # CATALOGS depends on both $ac_dir=
 and the user&#39;s LINGUAS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # environment variable.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INST_LINGUAS=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$ALL_LINGUAS&quot=
;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for presentlang in $ALL_LIN=
GUAS; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 useit=3Dno<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;%UNSET=
%&quot; !=3D &quot;$LINGUAS&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desiredlangua=
ges=3D&quot;$LINGUAS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desiredlangua=
ges=3D&quot;$ALL_LINGUAS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for desiredlang in $=
desiredlanguages; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use the pre=
sentlang catalog if desiredlang is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=
=A0a. equal to presentlang, or<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=
=A0b. a variant of presentlang (because in this case,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=
=A0 =C2=A0 presentlang can be used as a fallback for messages<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=
=A0 =C2=A0 which are not translated in the desiredlang catalog).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$d=
esiredlang&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
$presentlang&quot;*) useit=3Dyes;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test $useit =3D y=
es; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INST_LINGUAS=
=3D&quot;$INST_LINGUAS $presentlang&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CATALOGS=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;$INST_LINGUAS&quo=
t;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for lang in $INST_LINGUAS; =
do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CATALOGS=3D&quot;$CA=
TALOGS $lang.gmo&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -n &quot;$as_me&quot; &amp;&a=
mp; echo &quot;$as_me: creating $ac_dir/Makefile&quot; || echo &quot;creati=
ng $ac_dir/Makefile&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &quot;/^POTFILES =3D/r $ac_=
dir/POTFILES&quot; -e &quot;/^# Makevars/r $ac_given_srcdir/$ac_dir/Makevar=
s&quot; -e &quot;s|@POFILES@|$POFILES|g&quot; -e &quot;s|@UPDATEPOFILES@|$U=
PDATEPOFILES|g&quot; -e &quot;s|@DUMMYPOFILES@|$DUMMYPOFILES|g&quot; -e &qu=
ot;s|@GMOFILES@|$GMOFILES|g&quot; -e &quot;s|@CATALOGS@|$CATALOGS|g&quot; -=
e &quot;s|@POMAKEFILEDEPS@|$POMAKEFILEDEPS|g&quot; &quot;$ac_dir/Makefile.i=
n&quot; &gt; &quot;$ac_dir/Makefile&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in &quot;$ac_given_srcdir/$a=
c_dir&quot;/Rules-*; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f &quot;$f&quot;; =
then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$f&quot; =
in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *.orig | *.ba=
k | *~) ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) cat &quot;=
$f&quot; &gt;&gt; &quot;$ac_dir/Makefile&quot; ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 done]],<br>
&gt; +=C2=A0 =C2=A0[# Capture the value of obsolete ALL_LINGUAS because we =
need it to compute<br>
&gt; +=C2=A0 =C2=A0 # POFILES, UPDATEPOFILES, DUMMYPOFILES, GMOFILES, CATAL=
OGS.<br>
&gt; +=C2=A0 =C2=A0 OBSOLETE_ALL_LINGUAS=3D&quot;$ALL_LINGUAS&quot;<br>
&gt; +=C2=A0 =C2=A0 # Capture the value of LINGUAS because we need it to co=
mpute CATALOGS.<br>
&gt; +=C2=A0 =C2=A0 LINGUAS=3D&quot;${LINGUAS-%UNSET%}&quot;<br>
&gt; +=C2=A0 =C2=A0])<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl Postprocesses a Makefile in a directory containing PO files.<br>
&gt; +AC_DEFUN([AM_POSTPROCESS_PO_MAKEFILE],<br>
&gt; +[<br>
&gt; +=C2=A0 # When this code is run, in config.status, two variables have =
already been<br>
&gt; +=C2=A0 # set:<br>
&gt; +=C2=A0 # - OBSOLETE_ALL_LINGUAS is the value of LINGUAS set in <a hre=
f=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">configure.in=
</a>,<br>
&gt; +=C2=A0 # - LINGUAS is the value of the environment variable LINGUAS a=
t configure<br>
&gt; +=C2=A0 #=C2=A0 =C2=A0time.<br>
&gt; +<br>
&gt; +changequote(,)dnl<br>
&gt; +=C2=A0 # Adjust a relative srcdir.<br>
&gt; +=C2=A0 ac_dir=3D`echo &quot;$ac_file&quot;|sed &#39;s%/[^/][^/]*$%%&#=
39;`<br>
&gt; +=C2=A0 ac_dir_suffix=3D/`echo &quot;$ac_dir&quot;|sed &#39;s%^\./%%&#=
39;`<br>
&gt; +=C2=A0 ac_dots=3D`echo &quot;$ac_dir_suffix&quot;|sed &#39;s%/[^/]*%.=
./%g&#39;`<br>
&gt; +=C2=A0 # In autoconf-2.13 it is called $ac_given_srcdir.<br>
&gt; +=C2=A0 # In autoconf-2.50 it is called $srcdir.<br>
&gt; +=C2=A0 test -n &quot;$ac_given_srcdir&quot; || ac_given_srcdir=3D&quo=
t;$srcdir&quot;<br>
&gt; +=C2=A0 case &quot;$ac_given_srcdir&quot; in<br>
&gt; +=C2=A0 =C2=A0 .)=C2=A0 top_srcdir=3D`echo $ac_dots|sed &#39;s%/$%%&#3=
9;` ;;<br>
&gt; +=C2=A0 =C2=A0 /*) top_srcdir=3D&quot;$ac_given_srcdir&quot; ;;<br>
&gt; +=C2=A0 =C2=A0 *)=C2=A0 top_srcdir=3D&quot;$ac_dots$ac_given_srcdir&qu=
ot; ;;<br>
&gt; +=C2=A0 esac<br>
&gt; +<br>
&gt; +=C2=A0 # Find a way to echo strings without interpreting backslash.<b=
r>
&gt; +=C2=A0 if test &quot;X`(echo &#39;\t&#39;) 2&gt;/dev/null`&quot; =3D =
&#39;X\t&#39;; then<br>
&gt; +=C2=A0 =C2=A0 gt_echo=3D&#39;echo&#39;<br>
&gt; +=C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 if test &quot;X`(printf &#39;%s\n&#39; &#39;\t&#39;) 2&=
gt;/dev/null`&quot; =3D &#39;X\t&#39;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 gt_echo=3D&#39;printf %s\n&#39;<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 echo_func () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &lt;&lt;EOT<br>
&gt; +$*<br>
&gt; +EOT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 gt_echo=3D&#39;echo_func&#39;<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 # A sed script that extracts the value of VARIABLE from a Make=
file.<br>
&gt; +=C2=A0 tab=3D`printf &#39;\t&#39;`<br>
&gt; +=C2=A0 sed_x_variable=3D&#39;<br>
&gt; +# Test if the hold space is empty.<br>
&gt; +x<br>
&gt; +s/P/P/<br>
&gt; +x<br>
&gt; +ta<br>
&gt; +# Yes it was empty. Look if we have the expected variable definition.=
<br>
&gt; +/^[&#39;&quot;${tab}&quot;&#39; ]*VARIABLE[&#39;&quot;${tab}&quot;&#3=
9; ]*=3D/{<br>
&gt; +=C2=A0 # Seen the first line of the variable definition.<br>
&gt; +=C2=A0 s/^[&#39;&quot;${tab}&quot;&#39; ]*VARIABLE[&#39;&quot;${tab}&=
quot;&#39; ]*=3D//<br>
&gt; +=C2=A0 ba<br>
&gt; +}<br>
&gt; +bd<br>
&gt; +:a<br>
&gt; +# Here we are processing a line from the variable definition.<br>
&gt; +# Remove comment, more precisely replace it with a space.<br>
&gt; +s/#.*$/ /<br>
&gt; +# See if the line ends in a backslash.<br>
&gt; +tb<br>
&gt; +:b<br>
&gt; +s/\\$//<br>
&gt; +# Print the line, without the trailing backslash.<br>
&gt; +p<br>
&gt; +tc<br>
&gt; +# There was no trailing backslash. The end of the variable definition=
 is<br>
&gt; +# reached. Clear the hold space.<br>
&gt; +s/^.*$//<br>
&gt; +x<br>
&gt; +bd<br>
&gt; +:c<br>
&gt; +# A trailing backslash means that the variable definition continues i=
n the<br>
&gt; +# next line. Put a nonempty string into the hold space to indicate th=
is.<br>
&gt; +s/^.*$/P/<br>
&gt; +x<br>
&gt; +:d<br>
&gt; +&#39;<br>
&gt; +changequote([,])dnl<br>
&gt; +<br>
&gt; +=C2=A0 # Set POTFILES to the value of the Makefile variable POTFILES.=
<br>
&gt; +=C2=A0 sed_x_POTFILES=3D`$gt_echo &quot;$sed_x_variable&quot; | sed -=
e &#39;/^ *#/d&#39; -e &#39;s/VARIABLE/POTFILES/g&#39;`<br>
&gt; +=C2=A0 POTFILES=3D`sed -n -e &quot;$sed_x_POTFILES&quot; &lt; &quot;$=
ac_file&quot;`<br>
&gt; +=C2=A0 # Compute POTFILES_DEPS as<br>
&gt; +=C2=A0 #=C2=A0 =C2=A0$(foreach file, $(POTFILES), $(top_srcdir)/$(fil=
e))<br>
&gt; +=C2=A0 POTFILES_DEPS=3D<br>
&gt; +=C2=A0 for file in $POTFILES; do<br>
&gt; +=C2=A0 =C2=A0 POTFILES_DEPS=3D&quot;$POTFILES_DEPS &quot;&#39;$(top_s=
rcdir)/&#39;&quot;$file&quot;<br>
&gt; +=C2=A0 done<br>
&gt; +=C2=A0 POMAKEFILEDEPS=3D&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 if test -n &quot;$OBSOLETE_ALL_LINGUAS&quot;; then<br>
&gt; +=C2=A0 =C2=A0 test -n &quot;$as_me&quot; &amp;&amp; echo &quot;$as_me=
: setting ALL_LINGUAS in <a href=3D"http://configure.in" rel=3D"noreferrer"=
 target=3D"_blank">configure.in</a> is obsolete&quot; || echo &quot;setting=
 ALL_LINGUAS in <a href=3D"http://configure.in" rel=3D"noreferrer" target=
=3D"_blank">configure.in</a> is obsolete&quot;<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 if test -f &quot;$ac_given_srcdir/$ac_dir/LINGUAS&quot;; then<=
br>
&gt; +=C2=A0 =C2=A0 # The LINGUAS file contains the set of available langua=
ges.<br>
&gt; +=C2=A0 =C2=A0 ALL_LINGUAS=3D`sed -e &quot;/^#/d&quot; -e &quot;s/#.*/=
/&quot; &quot;$ac_given_srcdir/$ac_dir/LINGUAS&quot;`<br>
&gt; +=C2=A0 =C2=A0 POMAKEFILEDEPS=3D&quot;$POMAKEFILEDEPS LINGUAS&quot;<br=
>
&gt; +=C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 # Set ALL_LINGUAS to the value of the Makefile variable=
 LINGUAS.<br>
&gt; +=C2=A0 =C2=A0 sed_x_LINGUAS=3D`$gt_echo &quot;$sed_x_variable&quot; |=
 sed -e &#39;/^ *#/d&#39; -e &#39;s/VARIABLE/LINGUAS/g&#39;`<br>
&gt; +=C2=A0 =C2=A0 ALL_LINGUAS=3D`sed -n -e &quot;$sed_x_LINGUAS&quot; &lt=
; &quot;$ac_file&quot;`<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 # Compute POFILES<br>
&gt; +=C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach lang, $(ALL_LINGUAS), $(src=
dir)/$(lang).po)<br>
&gt; +=C2=A0 # Compute UPDATEPOFILES<br>
&gt; +=C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach lang, $(ALL_LINGUAS), $(lan=
g).po-update)<br>
&gt; +=C2=A0 # Compute DUMMYPOFILES<br>
&gt; +=C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach lang, $(ALL_LINGUAS), $(lan=
g).nop)<br>
&gt; +=C2=A0 # Compute GMOFILES<br>
&gt; +=C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach lang, $(ALL_LINGUAS), $(src=
dir)/$(lang).gmo)<br>
&gt; +=C2=A0 # Compute PROPERTIESFILES<br>
&gt; +=C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach lang, $(ALL_LINGUAS), $(src=
dir)/$(DOMAIN)_$(lang).properties)<br>
&gt; +=C2=A0 # Compute CLASSFILES<br>
&gt; +=C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach lang, $(ALL_LINGUAS), $(src=
dir)/$(DOMAIN)_$(lang).class)<br>
&gt; +=C2=A0 # Compute QMFILES<br>
&gt; +=C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach lang, $(ALL_LINGUAS), $(src=
dir)/$(lang).qm)<br>
&gt; +=C2=A0 # Compute MSGFILES<br>
&gt; +=C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach lang, $(ALL_LINGUAS), $(src=
dir)/$(frob $(lang)).msg)<br>
&gt; +=C2=A0 # Compute RESOURCESDLLFILES<br>
&gt; +=C2=A0 # as=C2=A0 =C2=A0 =C2=A0 $(foreach lang, $(ALL_LINGUAS), $(src=
dir)/$(frob $(lang))/$(DOMAIN).resources.dll)<br>
&gt; +=C2=A0 case &quot;$ac_given_srcdir&quot; in<br>
&gt; +=C2=A0 =C2=A0 .) srcdirpre=3D ;;<br>
&gt; +=C2=A0 =C2=A0 *) srcdirpre=3D&#39;$(srcdir)/&#39; ;;<br>
&gt; +=C2=A0 esac<br>
&gt; +=C2=A0 POFILES=3D<br>
&gt; +=C2=A0 UPDATEPOFILES=3D<br>
&gt; +=C2=A0 DUMMYPOFILES=3D<br>
&gt; +=C2=A0 GMOFILES=3D<br>
&gt; +=C2=A0 PROPERTIESFILES=3D<br>
&gt; +=C2=A0 CLASSFILES=3D<br>
&gt; +=C2=A0 QMFILES=3D<br>
&gt; +=C2=A0 MSGFILES=3D<br>
&gt; +=C2=A0 RESOURCESDLLFILES=3D<br>
&gt; +=C2=A0 for lang in $ALL_LINGUAS; do<br>
&gt; +=C2=A0 =C2=A0 POFILES=3D&quot;$POFILES $srcdirpre$lang.po&quot;<br>
&gt; +=C2=A0 =C2=A0 UPDATEPOFILES=3D&quot;$UPDATEPOFILES $lang.po-update&qu=
ot;<br>
&gt; +=C2=A0 =C2=A0 DUMMYPOFILES=3D&quot;$DUMMYPOFILES $lang.nop&quot;<br>
&gt; +=C2=A0 =C2=A0 GMOFILES=3D&quot;$GMOFILES $srcdirpre$lang.gmo&quot;<br=
>
&gt; +=C2=A0 =C2=A0 PROPERTIESFILES=3D&quot;$PROPERTIESFILES \$(srcdir)/\$(=
DOMAIN)_$lang.properties&quot;<br>
&gt; +=C2=A0 =C2=A0 CLASSFILES=3D&quot;$CLASSFILES \$(srcdir)/\$(DOMAIN)_$l=
ang.class&quot;<br>
&gt; +=C2=A0 =C2=A0 QMFILES=3D&quot;$QMFILES $srcdirpre$lang.qm&quot;<br>
&gt; +=C2=A0 =C2=A0 frobbedlang=3D`echo $lang | sed -e &#39;s/\..*$//&#39; =
-e &#39;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/&#39;`<br>
&gt; +=C2=A0 =C2=A0 MSGFILES=3D&quot;$MSGFILES $srcdirpre$frobbedlang.msg&q=
uot;<br>
&gt; +=C2=A0 =C2=A0 frobbedlang=3D`echo $lang | sed -e &#39;s/_/-/g&#39; -e=
 &#39;s/^sr-CS/sr-SP/&#39; -e &#39;s/@latin$/-Latn/&#39; -e &#39;s/@cyrilli=
c$/-Cyrl/&#39; -e &#39;s/^sr-SP$/sr-SP-Latn/&#39; -e &#39;s/^uz-UZ$/uz-UZ-L=
atn/&#39;`<br>
&gt; +=C2=A0 =C2=A0 RESOURCESDLLFILES=3D&quot;$RESOURCESDLLFILES $srcdirpre=
$frobbedlang/\$(DOMAIN).resources.dll&quot;<br>
&gt; +=C2=A0 done<br>
&gt; +=C2=A0 # CATALOGS depends on both $ac_dir and the user&#39;s LINGUAS<=
br>
&gt; +=C2=A0 # environment variable.<br>
&gt; +=C2=A0 INST_LINGUAS=3D<br>
&gt; +=C2=A0 if test -n &quot;$ALL_LINGUAS&quot;; then<br>
&gt; +=C2=A0 =C2=A0 for presentlang in $ALL_LINGUAS; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 useit=3Dno<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test &quot;%UNSET%&quot; !=3D &quot;$LINGUAS&=
quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 desiredlanguages=3D&quot;$LINGUAS&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 desiredlanguages=3D&quot;$ALL_LINGUAS&quo=
t;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for desiredlang in $desiredlanguages; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use the presentlang catalog if desiredl=
ang is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0a. equal to presentlang, or=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0b. a variant of presentlang=
 (because in this case,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 presentlang can be =
used as a fallback for messages<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 which are not trans=
lated in the desiredlang catalog).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$desiredlang&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;$presentlang&quot;*) useit=
=3Dyes;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if test $useit =3D yes; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 INST_LINGUAS=3D&quot;$INST_LINGUAS $prese=
ntlang&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 CATALOGS=3D<br>
&gt; +=C2=A0 JAVACATALOGS=3D<br>
&gt; +=C2=A0 QTCATALOGS=3D<br>
&gt; +=C2=A0 TCLCATALOGS=3D<br>
&gt; +=C2=A0 CSHARPCATALOGS=3D<br>
&gt; +=C2=A0 if test -n &quot;$INST_LINGUAS&quot;; then<br>
&gt; +=C2=A0 =C2=A0 for lang in $INST_LINGUAS; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 CATALOGS=3D&quot;$CATALOGS $lang.gmo&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 JAVACATALOGS=3D&quot;$JAVACATALOGS \$(DOMAIN)_$l=
ang.properties&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 QTCATALOGS=3D&quot;$QTCATALOGS $lang.qm&quot;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 frobbedlang=3D`echo $lang | sed -e &#39;s/\..*$/=
/&#39; -e &#39;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/&#39=
;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 TCLCATALOGS=3D&quot;$TCLCATALOGS $frobbedlang.ms=
g&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 frobbedlang=3D`echo $lang | sed -e &#39;s/_/-/g&=
#39; -e &#39;s/^sr-CS/sr-SP/&#39; -e &#39;s/@latin$/-Latn/&#39; -e &#39;s/@=
cyrillic$/-Cyrl/&#39; -e &#39;s/^sr-SP$/sr-SP-Latn/&#39; -e &#39;s/^uz-UZ$/=
uz-UZ-Latn/&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 CSHARPCATALOGS=3D&quot;$CSHARPCATALOGS $frobbedl=
ang/\$(DOMAIN).resources.dll&quot;<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 sed -e &quot;s|@POTFILES_DEPS@|$POTFILES_DEPS|g&quot; -e &quot=
;s|@POFILES@|$POFILES|g&quot; -e &quot;s|@UPDATEPOFILES@|$UPDATEPOFILES|g&q=
uot; -e &quot;s|@DUMMYPOFILES@|$DUMMYPOFILES|g&quot; -e &quot;s|@GMOFILES@|=
$GMOFILES|g&quot; -e &quot;s|@PROPERTIESFILES@|$PROPERTIESFILES|g&quot; -e =
&quot;s|@CLASSFILES@|$CLASSFILES|g&quot; -e &quot;s|@QMFILES@|$QMFILES|g&qu=
ot; -e &quot;s|@MSGFILES@|$MSGFILES|g&quot; -e &quot;s|@RESOURCESDLLFILES@|=
$RESOURCESDLLFILES|g&quot; -e &quot;s|@CATALOGS@|$CATALOGS|g&quot; -e &quot=
;s|@JAVACATALOGS@|$JAVACATALOGS|g&quot; -e &quot;s|@QTCATALOGS@|$QTCATALOGS=
|g&quot; -e &quot;s|@TCLCATALOGS@|$TCLCATALOGS|g&quot; -e &quot;s|@CSHARPCA=
TALOGS@|$CSHARPCATALOGS|g&quot; -e &#39;s,^#distdir:,distdir:,&#39; &lt; &q=
uot;$ac_file&quot; &gt; &quot;$ac_file.tmp&quot;<br>
&gt; +=C2=A0 tab=3D`printf &#39;\t&#39;`<br>
&gt; +=C2=A0 if grep -l &#39;@TCLCATALOGS@&#39; &quot;$ac_file&quot; &gt; /=
dev/null; then<br>
&gt; +=C2=A0 =C2=A0 # Add dependencies that cannot be formulated as a simpl=
e suffix rule.<br>
&gt; +=C2=A0 =C2=A0 for lang in $ALL_LINGUAS; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 frobbedlang=3D`echo $lang | sed -e &#39;s/\..*$/=
/&#39; -e &#39;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/&#39=
;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 cat &gt;&gt; &quot;$ac_file.tmp&quot; &lt;&lt;EO=
F<br>
&gt; +$frobbedlang.msg: $lang.po<br>
&gt; +${tab}@echo &quot;\$(MSGFMT) -c --tcl -d \$(srcdir) -l $lang $srcdirp=
re$lang.po&quot;; \<br>
&gt; +${tab}\$(MSGFMT) -c --tcl -d &quot;\$(srcdir)&quot; -l $lang $srcdirp=
re$lang.po || { rm -f &quot;\$(srcdir)/$frobbedlang.msg&quot;; exit 1; }<br=
>
&gt; +EOF<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 if grep -l &#39;@CSHARPCATALOGS@&#39; &quot;$ac_file&quot; &gt=
; /dev/null; then<br>
&gt; +=C2=A0 =C2=A0 # Add dependencies that cannot be formulated as a simpl=
e suffix rule.<br>
&gt; +=C2=A0 =C2=A0 for lang in $ALL_LINGUAS; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 frobbedlang=3D`echo $lang | sed -e &#39;s/_/-/g&=
#39; -e &#39;s/^sr-CS/sr-SP/&#39; -e &#39;s/@latin$/-Latn/&#39; -e &#39;s/@=
cyrillic$/-Cyrl/&#39; -e &#39;s/^sr-SP$/sr-SP-Latn/&#39; -e &#39;s/^uz-UZ$/=
uz-UZ-Latn/&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 cat &gt;&gt; &quot;$ac_file.tmp&quot; &lt;&lt;EO=
F<br>
&gt; +$frobbedlang/\$(DOMAIN).resources.dll: $lang.po<br>
&gt; +${tab}@echo &quot;\$(MSGFMT) -c --csharp -d \$(srcdir) -l $lang $srcd=
irpre$lang.po -r \$(DOMAIN)&quot;; \<br>
&gt; +${tab}\$(MSGFMT) -c --csharp -d &quot;\$(srcdir)&quot; -l $lang $srcd=
irpre$lang.po -r &quot;\$(DOMAIN)&quot; || { rm -f &quot;\$(srcdir)/$frobbe=
dlang.msg&quot;; exit 1; }<br>
&gt; +EOF<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 if test -n &quot;$POMAKEFILEDEPS&quot;; then<br>
&gt; +=C2=A0 =C2=A0 cat &gt;&gt; &quot;$ac_file.tmp&quot; &lt;&lt;EOF<br>
&gt; +Makefile: $POMAKEFILEDEPS<br>
&gt; +EOF<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 mv &quot;$ac_file.tmp&quot; &quot;$ac_file&quot;<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl Initializes the accumulator used by AM_XGETTEXT_OPTION.<br>
&gt; +AC_DEFUN([AM_XGETTEXT_OPTION_INIT],<br>
&gt; +[<br>
&gt; +=C2=A0 XGETTEXT_EXTRA_OPTIONS=3D<br>
&gt; +])<br>
&gt; +<br>
&gt; +dnl Registers an option to be passed to xgettext in the po subdirecto=
ry.<br>
&gt; +AC_DEFUN([AM_XGETTEXT_OPTION],<br>
&gt; +[<br>
&gt; +=C2=A0 AC_REQUIRE([AM_XGETTEXT_OPTION_INIT])<br>
&gt; +=C2=A0 XGETTEXT_EXTRA_OPTIONS=3D&quot;$XGETTEXT_EXTRA_OPTIONS $1&quot=
;<br>
&gt; +])<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/=
progtest.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/prog=
test.m4<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..5f186b14909<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/progtes=
t.m4<br>
&gt; @@ -0,0 +1,91 @@<br>
&gt; +# progtest.m4 serial 7 (gettext-0.18.2)<br>
&gt; +dnl Copyright (C) 1996-2003, 2005, 2008-2019 Free Software Foundation=
, Inc.<br>
&gt; +dnl This file is free software; the Free Software Foundation<br>
&gt; +dnl gives unlimited permission to copy and/or distribute it,<br>
&gt; +dnl with or without modifications, as long as this notice is preserve=
d.<br>
&gt; +dnl<br>
&gt; +dnl This file can be used in projects which are not available under<b=
r>
&gt; +dnl the GNU General Public License or the GNU Library General Public<=
br>
&gt; +dnl License but which still want to provide support for the GNU gette=
xt<br>
&gt; +dnl functionality.<br>
&gt; +dnl Please note that the actual code of the GNU gettext library is co=
vered<br>
&gt; +dnl by the GNU Library General Public License, and the rest of the GN=
U<br>
&gt; +dnl gettext package is covered by the GNU General Public License.<br>
&gt; +dnl They are *not* in the public domain.<br>
&gt; +<br>
&gt; +dnl Authors:<br>
&gt; +dnl=C2=A0 =C2=A0Ulrich Drepper &lt;<a href=3D"mailto:drepper@cygnus.c=
om" target=3D"_blank">drepper@cygnus.com</a>&gt;, 1996.<br>
&gt; +<br>
&gt; +AC_PREREQ([2.50])<br>
&gt; +<br>
&gt; +# Search path for a program which passes the given test.<br>
&gt; +<br>
&gt; +dnl AM_PATH_PROG_WITH_TEST(VARIABLE, PROG-TO-CHECK-FOR,<br>
&gt; +dnl=C2=A0 =C2=A0TEST-PERFORMED-ON-FOUND_PROGRAM [, VALUE-IF-NOT-FOUND=
 [, PATH]])<br>
&gt; +AC_DEFUN([AM_PATH_PROG_WITH_TEST],<br>
&gt; +[<br>
&gt; +# Prepare PATH_SEPARATOR.<br>
&gt; +# The user is always right.<br>
&gt; +if test &quot;${PATH_SEPARATOR+set}&quot; !=3D set; then<br>
&gt; +=C2=A0 # Determine PATH_SEPARATOR by trying to find /bin/sh in a PATH=
 which<br>
&gt; +=C2=A0 # contains only /bin. Note that ksh looks also at the FPATH va=
riable,<br>
&gt; +=C2=A0 # so we have to set that as well for the test.<br>
&gt; +=C2=A0 PATH_SEPARATOR=3D:<br>
&gt; +=C2=A0 (PATH=3D&#39;/bin;/bin&#39;; FPATH=3D$PATH; sh -c :) &gt;/dev/=
null 2&gt;&amp;1 \<br>
&gt; +=C2=A0 =C2=A0 &amp;&amp; { (PATH=3D&#39;/bin:/bin&#39;; FPATH=3D$PATH=
; sh -c :) &gt;/dev/null 2&gt;&amp;1 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| PATH_SEPARATOR=3D&#39;;&#=
39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +fi<br>
&gt; +<br>
&gt; +# Find out how to test for executable files. Don&#39;t use a zero-byt=
e file,<br>
&gt; +# as systems may use methods other than mode bits to determine execut=
ability.<br>
&gt; +cat &gt;conf$$.file &lt;&lt;_ASEOF<br>
&gt; +#! /bin/sh<br>
&gt; +exit 0<br>
&gt; +_ASEOF<br>
&gt; +chmod +x conf$$.file<br>
&gt; +if test -x conf$$.file &gt;/dev/null 2&gt;&amp;1; then<br>
&gt; +=C2=A0 ac_executable_p=3D&quot;test -x&quot;<br>
&gt; +else<br>
&gt; +=C2=A0 ac_executable_p=3D&quot;test -f&quot;<br>
&gt; +fi<br>
&gt; +rm -f conf$$.file<br>
&gt; +<br>
&gt; +# Extract the first word of &quot;$2&quot;, so it can be a program na=
me with args.<br>
&gt; +set dummy $2; ac_word=3D[$]2<br>
&gt; +AC_MSG_CHECKING([for $ac_word])<br>
&gt; +AC_CACHE_VAL([ac_cv_path_$1],<br>
&gt; +[case &quot;[$]$1&quot; in<br>
&gt; +=C2=A0 [[\\/]]* | ?:[[\\/]]*)<br>
&gt; +=C2=A0 =C2=A0 ac_cv_path_$1=3D&quot;[$]$1&quot; # Let the user overri=
de the test with a path.<br>
&gt; +=C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 *)<br>
&gt; +=C2=A0 =C2=A0 ac_save_IFS=3D&quot;$IFS&quot;; IFS=3D$PATH_SEPARATOR<b=
r>
&gt; +=C2=A0 =C2=A0 for ac_dir in ifelse([$5], , $PATH, [$5]); do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 IFS=3D&quot;$ac_save_IFS&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 test -z &quot;$ac_dir&quot; &amp;&amp; ac_dir=3D=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for ac_exec_ext in &#39;&#39; $ac_executable_ext=
ensions; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if $ac_executable_p &quot;$ac_dir/$ac_wor=
d$ac_exec_ext&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$as_me: trying $ac_dir/=
$ac_word...&quot; &gt;&amp;AS_MESSAGE_LOG_FD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [$3]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_path_$1=3D&quot;$ac_d=
ir/$ac_word$ac_exec_ext&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break 2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 IFS=3D&quot;$ac_save_IFS&quot;<br>
&gt; +dnl If no 4th arg is given, leave the cache variable unset,<br>
&gt; +dnl so AC_PATH_PROGS will keep looking.<br>
&gt; +ifelse([$4], , , [=C2=A0 test -z &quot;[$]ac_cv_path_$1&quot; &amp;&a=
mp; ac_cv_path_$1=3D&quot;$4&quot;<br>
&gt; +])dnl<br>
&gt; +=C2=A0 =C2=A0 ;;<br>
&gt; +esac])dnl<br>
&gt; +$1=3D&quot;$ac_cv_path_$1&quot;<br>
&gt; +if test ifelse([$4], , [-n &quot;[$]$1&quot;], [&quot;[$]$1&quot; !=
=3D &quot;$4&quot;]); then<br>
&gt; +=C2=A0 AC_MSG_RESULT([$][$1])<br>
&gt; +else<br>
&gt; +=C2=A0 AC_MSG_RESULT([no])<br>
&gt; +fi<br>
&gt; +AC_SUBST([$1])dnl<br>
&gt; +])<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/config=
.rpath b/meta/recipes-core/gettext/gettext-minimal-0.20.1/config.rpath<br>
&gt; similarity index 99%<br>
&gt; rename from meta/recipes-core/gettext/gettext-minimal-0.19.8.1/config.=
rpath<br>
&gt; rename to meta/recipes-core/gettext/gettext-minimal-0.20.1/config.rpat=
h<br>
&gt; index 98183ff2f2e..be202c1a9e7 100755<br>
&gt; --- a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/config.rpath<=
br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/config.rpath<br=
>
&gt; @@ -2,7 +2,7 @@<br>
&gt;=C2=A0 =C2=A0# Output a system dependent set of variables, describing h=
ow to set the<br>
&gt;=C2=A0 =C2=A0# run time search path of shared libraries in an executabl=
e.<br>
&gt;=C2=A0 =C2=A0#<br>
&gt; -#=C2=A0 =C2=A0Copyright 1996-2016 Free Software Foundation, Inc.<br>
&gt; +#=C2=A0 =C2=A0Copyright 1996-2019 Free Software Foundation, Inc.<br>
&gt;=C2=A0 =C2=A0#=C2=A0 =C2=A0Taken from GNU libtool, 2001<br>
&gt;=C2=A0 =C2=A0#=C2=A0 =C2=A0Originally by Gordon Matzigkeit &lt;<a href=
=3D"mailto:gord@gnu.ai.mit.edu" target=3D"_blank">gord@gnu.ai.mit.edu</a>&g=
t;, 1996<br>
&gt;=C2=A0 =C2=A0#<br>
&gt; diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/remove=
-potcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.20.1/remove-pot=
cdate.sin<br>
&gt; similarity index 50%<br>
&gt; rename from meta/recipes-core/gettext/gettext-minimal-0.19.8.1/remove-=
potcdate.sin<br>
&gt; rename to meta/recipes-core/gettext/gettext-minimal-0.20.1/remove-potc=
date.sin<br>
&gt; index 2436c49e786..8c70dfbf148 100644<br>
&gt; --- a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/remove-potcda=
te.sin<br>
&gt; +++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/remove-potcdate=
.sin<br>
&gt; @@ -1,6 +1,12 @@<br>
&gt; -# Sed script that remove the POT-Creation-Date line in the header ent=
ry<br>
&gt; +# Sed script that removes the POT-Creation-Date line in the header en=
try<br>
&gt;=C2=A0 =C2=A0# from a POT file.<br>
&gt;=C2=A0 =C2=A0#<br>
&gt; +# Copyright (C) 2002 Free Software Foundation, Inc.<br>
&gt; +# Copying and distribution of this file, with or without modification=
,<br>
&gt; +# are permitted in any medium without royalty provided the copyright<=
br>
&gt; +# notice and this notice are preserved.=C2=A0 This file is offered as=
-is,<br>
&gt; +# without any warranty.<br>
&gt; +#<br>
&gt;=C2=A0 =C2=A0# The distinction between the first and the following occu=
rrences of the<br>
&gt;=C2=A0 =C2=A0# pattern is achieved by looking at the hold space.<br>
&gt;=C2=A0 =C2=A0/^&quot;POT-Creation-Date: .*&quot;$/{<br>
&gt; diff --git a/meta/recipes-core/gettext/<a href=3D"http://gettext-minim=
al-native_0.19.8.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext-minimal=
-native_0.19.8.1.bb</a> b/meta/recipes-core/gettext/<a href=3D"http://gette=
xt-minimal-native_0.20.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext-m=
inimal-native_0.20.1.bb</a><br>
&gt; similarity index 86%<br>
&gt; rename from meta/recipes-core/gettext/<a href=3D"http://gettext-minima=
l-native_0.19.8.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext-minimal-=
native_0.19.8.1.bb</a><br>
&gt; rename to meta/recipes-core/gettext/<a href=3D"http://gettext-minimal-=
native_0.20.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext-minimal-nati=
ve_0.20.1.bb</a><br>
&gt; index 26ff19975d2..7a4dcbec57b 100644<br>
&gt; --- a/meta/recipes-core/gettext/<a href=3D"http://gettext-minimal-nati=
ve_0.19.8.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext-minimal-native=
_0.19.8.1.bb</a><br>
&gt; +++ b/meta/recipes-core/gettext/<a href=3D"http://gettext-minimal-nati=
ve_0.20.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext-minimal-native_0=
.20.1.bb</a><br>
&gt; @@ -3,12 +3,11 @@ DESCRIPTION =3D &quot;Contains the m4 macros suffici=
ent to support building \<br>
&gt;=C2=A0 =C2=A0autoconf/automake. This provides a significant build time =
speedup by \<br>
&gt;=C2=A0 =C2=A0the removal of gettext-native from most dependency chains =
(now only \<br>
&gt;=C2=A0 =C2=A0needed for gettext for the target).&quot;<br>
&gt; -SRC_URI =3D &quot;file://aclocal.tgz \<br>
&gt; +SRC_URI =3D &quot;file://aclocal/ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://config.rpath \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http=
://Makefile.in.in" rel=3D"noreferrer" target=3D"_blank">Makefile.in.in</a> =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://remove-potcdate=
.sin \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://COPYING \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-PATCH-Disable-th=
e-test-to-convert-euc-jp.patch \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt; @@ -23,7 +22,7 @@ S =3D &quot;${WORKDIR}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/aclocal/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/*.m4 ${D}${datadir}/aclocal/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/aclocal/*.m4 ${D}${datadir}/aclocal=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/gettext/po/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/config.rpath ${D}${datadir}/ge=
ttext/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/<a href=3D"http://Makefile.in.=
in" rel=3D"noreferrer" target=3D"_blank">Makefile.in.in</a> ${D}${datadir}/=
gettext/po/<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000a5743b059a00cc84--
