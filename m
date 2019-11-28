Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id E42767F9A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 15:27:01 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id x1so8294965qkl.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 07:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5PM2SY3lNZaOm5i18UfovPbHlG0CSyH9/LP5wilr3Qc=;
	b=sjmtRzUYglCiNLnQ+TH8oLe+xkBl3ABnky3fC1XUIHRw6rjcWg/J35QeogNywH0/Pz
	rn4MC3/wsFI67VB4iUJPIOMRXH8aoIL3/YnVtAXtvQbT7DZws4HUSZxTrUeqt95z1s7b
	DGlJwV+oyv9IJMbBLaruAVe5oxrjRHuHCzVQ8/fX5Y1+OuepMsn5LqVuMh7KmkUsPT0R
	8Dig9uwj3bzGI1okw1Qq6SWNCBWsAF8nGO5P6TRChgSC6ZbxS4QeKqDgFrY4VhibZNlq
	d9KZVnbiSVH2v/kJtS3LxTtdcO353LhKa4fcSLLEGHXiydk4Btr9QKJhm3L1qRqc8plu
	c0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5PM2SY3lNZaOm5i18UfovPbHlG0CSyH9/LP5wilr3Qc=;
	b=d+pTwqYmCbGk+6CHjXFlwvYdzo7SVz7rU+BZS2Sse/Cuze7MLzarMmFJZxq7xvZqG4
	q3NuH2i0cPvwovzHGFlOZOFME+ihHG6u0HADCC2c6SR7ZQt91k0Afkaxv2M8N7E/7E2T
	JPo+fJjbpyZ9u9prjb97Ik1GetuMOYuAGxNQX4B/Flo+fNEDMSZ1yjCJV4ADOj36NFJv
	f9r+K9dDuxvXtA7cyXXfseqVmqJDk633DYfBtaHvWoRIuf6Li9CSsBK6zbGciCakIAch
	gLdZtP3uDacPSFXTPDtAMslOcmnsdF1Gn+Fh1D0V/TrnH/QODXw9vz/I01o17nipkRCB
	78Mw==
X-Gm-Message-State: APjAAAV+m1D+fiCztzyGhmWEabMChYMpjIYpbAHaCnEv0wfqCeblrXXH
	QZu3NEz86p6bO+ymdYhI5iQdXjrxQ5Gj305tc18=
X-Google-Smtp-Source: APXvYqxjv6+AEpWDO1bYZKINf0Zeaie6aKCKa+glt7c5HcImxn48QxvXz4Ukk0nCOMbjUgLm7f+wLxyfOmg9wu33FC4=
X-Received: by 2002:a37:a0cf:: with SMTP id j198mr10971964qke.9.1574954821356; 
	Thu, 28 Nov 2019 07:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
	<20191127164003.115980-13-alex.kanavin@gmail.com>
	<99022154-a793-98d3-69a0-6b446fe56b92@gmail.com>
In-Reply-To: <99022154-a793-98d3-69a0-6b446fe56b92@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Nov 2019 07:26:34 -0800
Message-ID: <CAMKF1spivuUbg=6x9iwaniCgqLHkTzm67u-HEkhfrAw6oZ9GQA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/14] flex: update to 2.6.4
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
X-List-Received-Date: Thu, 28 Nov 2019 15:27:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2019 at 7:15 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 11/27/19 8:40 AM, Alexander Kanavin wrote:
> > Add a backport patch that addresses segfaults on newer glibc versions.
> >
> > Remove:
> > CVE-2016-6354.patch (backport)
> > 0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch (issue fixed ups=
tream)
>
> This cause AB build failure
>
> https://errors.yoctoproject.org/Errors/Details/288799/
>

mostly due to configure time confusion of detecting reallocarray since
the host is debian9 which
should be running glibc 2.24 which is older than when reallocarray was
introduced but actually
nativesdk package would use nativesdk-glibc that OE builds, one option
to explore is can be disable
use of this function. what do we lose if we do

>
> >
> > ptest pass rate is 100%.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...SE_SYSTEM_EXTENSIONS-in-configure.ac.patch | 32 ++++++++++
> >  ...-comments-in-c-code-fails-with-gcc-6.patch | 64 -------------------
> >  .../flex/flex/CVE-2016-6354.patch             | 59 -----------------
> >  .../flex/flex/do_not_create_pdf_doc.patch     | 17 -----
> >  meta/recipes-devtools/flex/flex/run-ptest     |  2 +-
> >  .../flex/{flex_2.6.0.bb =3D> flex_2.6.4.bb}     | 10 ++-
> >  6 files changed, 37 insertions(+), 147 deletions(-)
> >  create mode 100644 meta/recipes-devtools/flex/flex/0001-build-AC_USE_S=
YSTEM_EXTENSIONS-in-configure.ac.patch
> >  delete mode 100644 meta/recipes-devtools/flex/flex/0002-avoid-c-commen=
ts-in-c-code-fails-with-gcc-6.patch
> >  delete mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
> >  delete mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_d=
oc.patch
> >  rename meta/recipes-devtools/flex/{flex_2.6.0.bb =3D> flex_2.6.4.bb} (=
86%)
> >
> > diff --git a/meta/recipes-devtools/flex/flex/0001-build-AC_USE_SYSTEM_E=
XTENSIONS-in-configure.ac.patch b/meta/recipes-devtools/flex/flex/0001-buil=
d-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
> > new file mode 100644
> > index 00000000000..60bf7ce8cfd
> > --- /dev/null
> > +++ b/meta/recipes-devtools/flex/flex/0001-build-AC_USE_SYSTEM_EXTENSIO=
NS-in-configure.ac.patch
> > @@ -0,0 +1,32 @@
> > +From ed1f7e9de0d6a1d5a9e581e02a63593d22cf1e52 Mon Sep 17 00:00:00 2001
> > +From: Explorer09 <explorer09@gmail.com>
> > +Date: Mon, 4 Sep 2017 10:47:33 +0800
> > +Subject: [PATCH] build: AC_USE_SYSTEM_EXTENSIONS in configure.ac.
> > +
> > +This would, e.g. define _GNU_SOURCE in config.h, enabling the
> > +reallocarray() prototype in glibc 2.26+ on Linux systems with that
> > +version of glibc.
> > +
> > +Fixes #241.
> > +
> > +Upstream-Status: Backport
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + configure.ac | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 55e774b..c879fe1 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -25,8 +25,10 @@
> > + # autoconf requirements and initialization
> > +
> > + AC_INIT([the fast lexical analyser generator],[2.6.4],[flex-help@list=
s.sourceforge.net],[flex])
> > ++AC_PREREQ([2.60])
> > + AC_CONFIG_SRCDIR([src/scan.l])
> > + AC_CONFIG_AUX_DIR([build-aux])
> > ++AC_USE_SYSTEM_EXTENSIONS
> > + LT_INIT
> > + AM_INIT_AUTOMAKE([1.11.3 -Wno-portability foreign check-news std-opti=
ons dist-lzip parallel-tests subdir-objects])
> > + AC_CONFIG_HEADER([src/config.h])
> > diff --git a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c=
-code-fails-with-gcc-6.patch b/meta/recipes-devtools/flex/flex/0002-avoid-c=
-comments-in-c-code-fails-with-gcc-6.patch
> > deleted file mode 100644
> > index 438ca5f5276..00000000000
> > --- a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-f=
ails-with-gcc-6.patch
> > +++ /dev/null
> > @@ -1,64 +0,0 @@
> > -From 7072befe1397af4eb01c3ff7edf99f0cd5076089 Mon Sep 17 00:00:00 2001
> > -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googl=
email.com>
> > -Date: Tue, 30 Aug 2016 14:25:32 +0200
> > -Subject: [PATCH] avoid c++ comments in c-code - fails with gcc-6
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -fixes:
> > -
> > -| error: C++ style comments are not allowed in ISO C90
> > -| num_to_alloc =3D 1; // After all that talk, this was set to 1 anyway=
s...
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > ----
> > - src/flex.skl | 2 +-
> > - src/scan.c   | 2 +-
> > - src/skel.c   | 2 +-
> > - 3 files changed, 3 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/src/flex.skl b/src/flex.skl
> > -index 73a0b9e..ed71627 100644
> > ---- a/src/flex.skl
> > -+++ b/src/flex.skl
> > -@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_buffer_stack(void)
> > -              * scanner will even need a stack. We use 2 instead of 1 =
to avoid an
> > -              * immediate realloc on the next call.
> > -          */
> > --            num_to_alloc =3D 1; // After all that talk, this was set =
to 1 anyways...
> > -+            num_to_alloc =3D 1; /* After all that talk, this was set =
to 1 anyways... */
> > -             YY_G(yy_buffer_stack) =3D (struct yy_buffer_state**)yyall=
oc
> > -                                                             (num_to_a=
lloc * sizeof(struct yy_buffer_state*)
> > -                                                             M4_YY_CAL=
L_LAST_ARG);
> > -diff --git a/src/scan.c b/src/scan.c
> > -index b55df2d..f1dce75 100644
> > ---- a/src/scan.c
> > -+++ b/src/scan.c
> > -@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)
> > -              * scanner will even need a stack. We use 2 instead of 1 =
to avoid an
> > -              * immediate realloc on the next call.
> > -          */
> > --            num_to_alloc =3D 1; // After all that talk, this was set =
to 1 anyways...
> > -+            num_to_alloc =3D 1; /* After all that talk, this was set =
to 1 anyways...*/
> > -             (yy_buffer_stack) =3D (struct yy_buffer_state**)yyalloc
> > -                                                             (num_to_a=
lloc * sizeof(struct yy_buffer_state*)
> > -                                                             );
> > -diff --git a/src/skel.c b/src/skel.c
> > -index ef657d3..26cc889 100644
> > ---- a/src/skel.c
> > -+++ b/src/skel.c
> > -@@ -2561,7 +2561,7 @@ const char *skel[] =3D {
> > -   "          * scanner will even need a stack. We use 2 instead of 1 =
to avoid an",
> > -   "          * immediate realloc on the next call.",
> > -   "         */",
> > --  "         num_to_alloc =3D 1; // After all that talk, this was set =
to 1 anyways...",
> > -+  "         num_to_alloc =3D 1; /* After all that talk, this was set =
to 1 anyways... */",
> > -   "         YY_G(yy_buffer_stack) =3D (struct yy_buffer_state**)yyall=
oc",
> > -   "                                                         (num_to_a=
lloc * sizeof(struct yy_buffer_state*)",
> > -   "                                                         M4_YY_CAL=
L_LAST_ARG);",
> > ---
> > -2.5.5
> > -
> > diff --git a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch b/meta=
/recipes-devtools/flex/flex/CVE-2016-6354.patch
> > deleted file mode 100644
> > index 216ac7ae1c4..00000000000
> > --- a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
> > +++ /dev/null
> > @@ -1,59 +0,0 @@
> > -From 3939eccdff598f47e5b37b05d58bf1b44d3796e7 Mon Sep 17 00:00:00 2001
> > -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > -Date: Fri, 7 Oct 2016 14:15:38 +0300
> > -Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer
> > -
> > -This is upstream commit a5cbe929ac3255d371e698f62dc256afe7006466
> > -with some additional backporting to make binutils build again.
> > -
> > -Upstream-Status: Backport
> > -CVE: CVE-2016-6354
> > -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > ----
> > - src/flex.skl | 2 +-
> > - src/scan.c   | 2 +-
> > - src/skel.c   | 2 +-
> > - 3 files changed, 3 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/src/flex.skl b/src/flex.skl
> > -index ed71627..814d562 100644
> > ---- a/src/flex.skl
> > -+++ b/src/flex.skl
> > -@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_buffer()
> > -
> > -     else
> > -             {
> > --                    yy_size_t num_to_read =3D
> > -+                    int num_to_read =3D
> > -                     YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to=
_move - 1;
> > -
> > -             while ( num_to_read <=3D 0 )
> > -diff --git a/src/scan.c b/src/scan.c
> > -index f1dce75..1949872 100644
> > ---- a/src/scan.c
> > -+++ b/src/scan.c
> > -@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)
> > -
> > -     else
> > -             {
> > --                    yy_size_t num_to_read =3D
> > -+                    int num_to_read =3D
> > -                     YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to=
_move - 1;
> > -
> > -             while ( num_to_read <=3D 0 )
> > -diff --git a/src/skel.c b/src/skel.c
> > -index 26cc889..0344d18 100644
> > ---- a/src/skel.c
> > -+++ b/src/skel.c
> > -@@ -1929,7 +1929,7 @@ const char *skel[] =3D {
> > -   "",
> > -   " else",
> > -   "         {",
> > --  "                 yy_size_t num_to_read =3D",
> > -+  "                 int num_to_read =3D",
> > -   "                 YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to=
_move - 1;",
> > -   "",
> > -   "         while ( num_to_read <=3D 0 )",
> > ---
> > -2.1.4
> > -
> > diff --git a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patc=
h b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> > deleted file mode 100644
> > index 29792efee87..00000000000
> > --- a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -Upstream-Status: Inappropriate (embedded specific)
> > -
> > -Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > -
> > -Index: flex-2.6.0/doc/Makefile.am
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- flex-2.6.0.orig/doc/Makefile.am
> > -+++ flex-2.6.0/doc/Makefile.am
> > -@@ -2,7 +2,7 @@ help2man =3D @HELP2MAN@
> > -
> > - info_TEXINFOS =3D     flex.texi
> > - dist_man_MANS =3D flex.1
> > --dist_doc_DATA=3D flex.pdf
> > -+EXTRA_DIST=3D flex.pdf
> > -
> > - CLEANFILES =3D \
> > -     flex.aux \
> > diff --git a/meta/recipes-devtools/flex/flex/run-ptest b/meta/recipes-d=
evtools/flex/flex/run-ptest
> > index 19db3379002..037301c40fa 100755
> > --- a/meta/recipes-devtools/flex/flex/run-ptest
> > +++ b/meta/recipes-devtools/flex/flex/run-ptest
> > @@ -2,4 +2,4 @@
> >
> >  # make would want to rebuild some files with a compiler otherwise :-/
> >  make FLEX=3D/usr/bin/flex -t check-TESTS || true
> > -make FLEX=3D/usr/bin/flex check-TESTS
> > +make FLEX=3D/usr/bin/flex abs_builddir=3D./ check-TESTS
> > diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-de=
vtools/flex/flex_2.6.4.bb
> > similarity index 86%
> > rename from meta/recipes-devtools/flex/flex_2.6.0.bb
> > rename to meta/recipes-devtools/flex/flex_2.6.4.bb
> > index 9bdd99c59f8..347018df1b7 100644
> > --- a/meta/recipes-devtools/flex/flex_2.6.0.bb
> > +++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
> > @@ -10,17 +10,15 @@ BBCLASSEXTEND =3D "native nativesdk"
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4742cf92e89040b39486a6219b=
68067"
> >
> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
> > +SRC_URI =3D "https://github.com/westes/flex/releases/download/v${PV}/f=
lex-${PV}.tar.gz \
> >             file://run-ptest \
> > -           file://do_not_create_pdf_doc.patch \
> >             file://0001-tests-add-a-target-for-building-tests-without-r=
unnin.patch \
> > -           file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.pat=
ch \
> > -           file://CVE-2016-6354.patch \
> >             ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disa=
ble-tests.patch', d)} \
> > +           file://0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.=
patch \
> >             "
> >
> > -SRC_URI[md5sum] =3D "266270f13c48ed043d95648075084d59"
> > -SRC_URI[sha256sum] =3D "24e611ef5a4703a191012f80c1027dc9d12555183ce0ec=
d46f3636e587e9b8e9"
> > +SRC_URI[md5sum] =3D "2882e3179748cc9f9c23ec593d6adc8d"
> > +SRC_URI[sha256sum] =3D "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd74=
8b31f15b33c45ee995"
> >
> >  # Flex has moved to github from 2.6.1 onwards
> >  UPSTREAM_CHECK_URI =3D "https://github.com/westes/flex/releases"
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

