Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A31B171C0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 02:19:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so54626203wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 18:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4bqhmRbAs151O2+qCwGjG+Q7Lq7nB88bJ5iReJ1mBPY=;
	b=thwi/5HMzH1F7aaDMcVnazX5m1WgXmpY/fT+GUjD8q53f0P0jefY+34YSY22GLYEe9
	qYr3I87ZmgANMOSicns+4Zp4IFaqfG7PsUNxExCAqz/v6BRgq9UKP7ppegINLR91a52W
	26mjziaqC211bVw2QGCrwpqsVGA15LooVezYP5Ehs+7jG7WsGm7BGUIckxmYOgxP6AgZ
	eKa2j/WsGzHBnDIaIhZplLTHairEM05wTOL/zNEyiRXO+UmzNrqCY8jN2oiiXyThlwco
	ntEk/ApAnJcJ0+DpYAPBBzRrFnUswmHmnZsobX2bEhMF/Kkl83ysQLa1u3TlD/d76T9E
	54WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4bqhmRbAs151O2+qCwGjG+Q7Lq7nB88bJ5iReJ1mBPY=;
	b=FmXGpH2gqDt69rQ+JTmy2lDk7+Z8QCE2tETzP9x71iupAXiek8mTr6WwEGzw3rxN9C
	RfLADhzBn5mtPubamvE1FDnx37VWHOGWiFZPC56aRoIzOmMaKbYy94LQ/rey683XolAr
	lB26gfAZrrKDyw0Sj99iCJDVRYDVmK3GYo8rZtofUl1I6uzDR43F61uKwu4kgEkrvYFA
	Hu3p8scQIkdIkUJyraFnaIwpuKv71UfHA13TgRjTKirOBwav1IvH6gsL2mDtrzVL3BRd
	1NNWgoodgVzjUojWqTfFv3qEZS0kWys5CRggZ238DSapORrX5Xf3FQShefLHcPgrTe46
	mMLA==
X-Gm-Message-State: AIkVDXJOK37J8ndu5jOmNgGqOPms1k7DvwIbX7cJsKX2LAW+zJn/Gmdh7Ka7MhsPRKP/zLVXjdCzU6Nmkjh07w==
X-Received: by 10.28.91.19 with SMTP id p19mr916040wmb.49.1485483599325; Thu,
	26 Jan 2017 18:19:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Thu, 26 Jan 2017 18:19:58 -0800 (PST)
In-Reply-To: <49e5214c-5a23-05c0-c35d-636997dc7310@gmail.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
	<46d94601d67973b17516241cea3b6afce9a2914d.1482739038.git.Qi.Chen@windriver.com>
	<CA+chaQd519TOCHMNPzFnnWgZFi6=aWNC231-8=ihqf_Mfr-9Hw@mail.gmail.com>
	<49e5214c-5a23-05c0-c35d-636997dc7310@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 27 Jan 2017 03:19:58 +0100
Message-ID: <CA+chaQe0PXA=4gA==O06bZP6c6oz2JXVAhCiqELZzs7KthQkRQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] flex: upgrade to 2.6.2
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
X-List-Received-Date: Fri, 27 Jan 2017 02:20:00 -0000
Content-Type: multipart/alternative; boundary=001a1144392c41f16805470a1a98

--001a1144392c41f16805470a1a98
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I did try 2.6.3 but it was even worse as reported, if anyone wants to use
it as starting point here it is:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/mas=
ter&id=3D4590c0145a7ae98e7ff7bbf40ec3e25471484f60

but then I've reverted both 2.6.3 and 2.6.2 upgrade and I don't plan to
work on it.

On Fri, Jan 27, 2017 at 3:16 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 1/26/17 2:39 PM, Martin Jansa wrote:
> > This is breaking number of recipes as discussed in acpica thread:
> > http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-January/131555.html
> >
> > in by builds I also see failures in qtwebkit, upstart, libpbnjson, ...
> >
> > I've tried to upgrade to 2.6.3 as suggested in:
> > https://github.com/westes/flex/issues/164
> >
> > but that brings different set of undefined yy* symbols (e.g. yywrap in
> > yylex function when building binutils-crosssdk and in the end it doesn'=
t
> > help at all, because even binutils, binutils-cross, dtc-native fail muc=
h
> > sooner.
> >
> > Is someone working on flex upgrade or can we revert this 2.6.2 upgrade
> > until these issues are resolved?
> >
>
> +1
> I have reverted this upgrade locally. Its breaking webkit too. I think
> we should either revert this or try out 2.6.3 in short time.
>
> > On Mon, Dec 26, 2016 at 9:10 AM, Chen Qi <Qi.Chen@windriver.com
> > <mailto:Qi.Chen@windriver.com>> wrote:
> >
> >     Upgrade flex to 2.6.2.
> >
> >     The following two patches are removed as they have been merged.
> >       0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
> >       CVE-2016-6354.patch
> >
> >     do_not_create_pdf_doc.patch is removed as it's not suitable for the
> new
> >     version.
> >
> >     0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch is
> added
> >     to fix cross compiling problem.
> >
> >     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
> >     <mailto:Qi.Chen@windriver.com>>
> >     ---
> >      ...lex-from-flex-native-to-fix-cross-compili.patch | 51
> >     +++++++++++++++++
> >      ...oid-c-comments-in-c-code-fails-with-gcc-6.patch | 64
> >     ----------------------
> >      .../recipes-devtools/flex/flex/CVE-2016-6354.patch | 59
> >     --------------------
> >      .../flex/flex/do_not_create_pdf_doc.patch          | 17 ------
> >      .../flex/{flex_2.6.0.bb <http://flex_2.6.0.bb> =3D> flex_2.6.2.bb
> >     <http://flex_2.6.2.bb>}          | 16 +++---
> >      5 files changed, 60 insertions(+), 147 deletions(-)
> >      create mode 100644
> >     meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-
> flex-native-to-fix-cross-compili.patch
> >      delete mode 100644
> >     meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-
> c-code-fails-with-gcc-6.patch
> >      delete mode 100644 meta/recipes-devtools/flex/
> flex/CVE-2016-6354.patch
> >      delete mode 100644
> >     meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> >      rename meta/recipes-devtools/flex/{flex_2.6.0.bb
> >     <http://flex_2.6.0.bb> =3D> flex_2.6.2.bb <http://flex_2.6.2.bb>}
> (79%)
> >
> >     diff --git
> >     a/meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-
> flex-native-to-fix-cross-compili.patch
> >     b/meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-
> flex-native-to-fix-cross-compili.patch
> >     new file mode 100644
> >     index 0000000..08f7688
> >     --- /dev/null
> >     +++
> >     b/meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-
> flex-native-to-fix-cross-compili.patch
> >     @@ -0,0 +1,51 @@
> >     +Subject: use stage1flex from flex-native to fix cross compiling
> >     +
> >     +When cross compiling, we would have failure because stage1flex
> >     cannot run on host.
> >     +Use stage1flex from flex-native to fix this problem.
> >     +
> >     +This patch is OE specific as upstream may have other way to fix
> >     this cross compilation
> >     +problem.
> >     +
> >     +Upstream-Status: Inappropriate [OE specific]
> >     +
> >     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
> >     <mailto:Qi.Chen@windriver.com>>
> >     +---
> >     + src/Makefile.am | 11 ++---------
> >     + 1 file changed, 2 insertions(+), 9 deletions(-)
> >     +
> >     +diff --git a/src/Makefile.am b/src/Makefile.am
> >     +index 77ddf4b..09ffddb 100644
> >     +--- a/src/Makefile.am
> >     ++++ b/src/Makefile.am
> >     +@@ -6,17 +6,10 @@ LIBS =3D @LIBS@
> >     + m4 =3D @M4@
> >     +
> >     + bin_PROGRAMS =3D flex
> >     +-noinst_PROGRAMS =3D stage1flex
> >     + lib_LTLIBRARIES =3D \
> >     +       libfl.la <http://libfl.la> \
> >     +       libfl_pic.la <http://libfl_pic.la>
> >     +
> >     +-stage1flex_SOURCES =3D \
> >     +-      scan.l \
> >     +-      $(COMMON_SOURCES)
> >     +-
> >     +-stage1flex_CFLAGS =3D $(AM_CFLAGS)
> >     +-
> >     + flex_SOURCES =3D \
> >     +       $(COMMON_SOURCES)
> >     +
> >     +@@ -89,8 +82,8 @@ skel.c: flex.skl mkskel.sh flexint.h
> >     tables_shared.h tables_shared.c
> >     +         $(SHELL) $(srcdir)/mkskel.sh > $@.tmp
> >     +       mv $@.tmp $@
> >     +
> >     +-stage1scan.c: scan.l stage1flex$(EXEEXT)
> >     +-      ./stage1flex$(EXEEXT) -o $@ $<
> >     ++stage1scan.c: scan.l
> >     ++      stage1flex$(EXEEXT) -o $@ $<
> >     +
> >     + # make needs to be told to make parse.h so that parallelized runs
> will
> >     + # not fail.
> >     +--
> >     +2.1.0
> >     +
> >     diff --git
> >     a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-
> c-code-fails-with-gcc-6.patch
> >     b/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-
> c-code-fails-with-gcc-6.patch
> >     deleted file mode 100644
> >     index 438ca5f..0000000
> >     ---
> >     a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-
> c-code-fails-with-gcc-6.patch
> >     +++ /dev/null
> >     @@ -1,64 +0,0 @@
> >     -From 7072befe1397af4eb01c3ff7edf99f0cd5076089 Mon Sep 17 00:00:00
> 2001
> >     -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D
> >     <schnitzeltony@googlemail.com <mailto:schnitzeltony@googlemail.com>=
>
> >     -Date: Tue, 30 Aug 2016 14:25:32 +0200
> >     -Subject: [PATCH] avoid c++ comments in c-code - fails with gcc-6
> >     -MIME-Version: 1.0
> >     -Content-Type: text/plain; charset=3DUTF-8
> >     -Content-Transfer-Encoding: 8bit
> >     -
> >     -fixes:
> >     -
> >     -| error: C++ style comments are not allowed in ISO C90
> >     -| num_to_alloc =3D 1; // After all that talk, this was set to 1
> >     anyways...
> >     -
> >     -Upstream-Status: Pending
> >     -
> >     -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com
> >     <mailto:schnitzeltony@googlemail.com>>
> >     ----
> >     - src/flex.skl | 2 +-
> >     - src/scan.c   | 2 +-
> >     - src/skel.c   | 2 +-
> >     - 3 files changed, 3 insertions(+), 3 deletions(-)
> >     -
> >     -diff --git a/src/flex.skl b/src/flex.skl
> >     -index 73a0b9e..ed71627 100644
> >     ---- a/src/flex.skl
> >     -+++ b/src/flex.skl
> >     -@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_buffer_stack(void=
)
> >     -                * scanner will even need a stack. We use 2 instead
> >     of 1 to avoid an
> >     -                * immediate realloc on the next call.
> >     -          */
> >     --              num_to_alloc =3D 1; // After all that talk, this wa=
s
> >     set to 1 anyways...
> >     -+              num_to_alloc =3D 1; /* After all that talk, this wa=
s
> >     set to 1 anyways... */
> >     -               YY_G(yy_buffer_stack) =3D (struct
> >     yy_buffer_state**)yyalloc
> >     -
> >      (num_to_alloc * sizeof(struct yy_buffer_state*)
> >     -
> >      M4_YY_CALL_LAST_ARG);
> >     -diff --git a/src/scan.c b/src/scan.c
> >     -index b55df2d..f1dce75 100644
> >     ---- a/src/scan.c
> >     -+++ b/src/scan.c
> >     -@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)
> >     -                * scanner will even need a stack. We use 2 instead
> >     of 1 to avoid an
> >     -                * immediate realloc on the next call.
> >     -          */
> >     --              num_to_alloc =3D 1; // After all that talk, this wa=
s
> >     set to 1 anyways...
> >     -+              num_to_alloc =3D 1; /* After all that talk, this wa=
s
> >     set to 1 anyways...*/
> >     -               (yy_buffer_stack) =3D (struct yy_buffer_state**)yya=
lloc
> >     -
> >      (num_to_alloc * sizeof(struct yy_buffer_state*)
> >     -                                                               );
> >     -diff --git a/src/skel.c b/src/skel.c
> >     -index ef657d3..26cc889 100644
> >     ---- a/src/skel.c
> >     -+++ b/src/skel.c
> >     -@@ -2561,7 +2561,7 @@ const char *skel[] =3D {
> >     -   "            * scanner will even need a stack. We use 2 instead
> >     of 1 to avoid an",
> >     -   "            * immediate realloc on the next call.",
> >     -   "         */",
> >     --  "           num_to_alloc =3D 1; // After all that talk, this wa=
s
> >     set to 1 anyways...",
> >     -+  "           num_to_alloc =3D 1; /* After all that talk, this wa=
s
> >     set to 1 anyways... */",
> >     -   "           YY_G(yy_buffer_stack) =3D (struct
> >     yy_buffer_state**)yyalloc",
> >     -   "
> >      (num_to_alloc * sizeof(struct yy_buffer_state*)",
> >     -   "
> >      M4_YY_CALL_LAST_ARG);",
> >     ---
> >     -2.5.5
> >     -
> >     diff --git a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
> >     b/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
> >     deleted file mode 100644
> >     index 216ac7a..0000000
> >     --- a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
> >     +++ /dev/null
> >     @@ -1,59 +0,0 @@
> >     -From 3939eccdff598f47e5b37b05d58bf1b44d3796e7 Mon Sep 17 00:00:00
> 2001
> >     -From: Jussi Kukkonen <jussi.kukkonen@intel.com
> >     <mailto:jussi.kukkonen@intel.com>>
> >     -Date: Fri, 7 Oct 2016 14:15:38 +0300
> >     -Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer
> >     -
> >     -This is upstream commit a5cbe929ac3255d371e698f62dc256afe7006466
> >     -with some additional backporting to make binutils build again.
> >     -
> >     -Upstream-Status: Backport
> >     -CVE: CVE-2016-6354
> >     -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com
> >     <mailto:jussi.kukkonen@intel.com>>
> >     ----
> >     - src/flex.skl | 2 +-
> >     - src/scan.c   | 2 +-
> >     - src/skel.c   | 2 +-
> >     - 3 files changed, 3 insertions(+), 3 deletions(-)
> >     -
> >     -diff --git a/src/flex.skl b/src/flex.skl
> >     -index ed71627..814d562 100644
> >     ---- a/src/flex.skl
> >     -+++ b/src/flex.skl
> >     -@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_buffer()
> >     -
> >     -       else
> >     -               {
> >     --                      yy_size_t num_to_read =3D
> >     -+                      int num_to_read =3D
> >     -                       YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
> >     number_to_move - 1;
> >     -
> >     -               while ( num_to_read <=3D 0 )
> >     -diff --git a/src/scan.c b/src/scan.c
> >     -index f1dce75..1949872 100644
> >     ---- a/src/scan.c
> >     -+++ b/src/scan.c
> >     -@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)
> >     -
> >     -       else
> >     -               {
> >     --                      yy_size_t num_to_read =3D
> >     -+                      int num_to_read =3D
> >     -                       YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
> >     number_to_move - 1;
> >     -
> >     -               while ( num_to_read <=3D 0 )
> >     -diff --git a/src/skel.c b/src/skel.c
> >     -index 26cc889..0344d18 100644
> >     ---- a/src/skel.c
> >     -+++ b/src/skel.c
> >     -@@ -1929,7 +1929,7 @@ const char *skel[] =3D {
> >     -   "",
> >     -   "   else",
> >     -   "           {",
> >     --  "                   yy_size_t num_to_read =3D",
> >     -+  "                   int num_to_read =3D",
> >     -   "                   YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
> >     number_to_move - 1;",
> >     -   "",
> >     -   "           while ( num_to_read <=3D 0 )",
> >     ---
> >     -2.1.4
> >     -
> >     diff --git
> >     a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> >     b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> >     deleted file mode 100644
> >     index 032833ae..0000000
> >     --- a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> >     +++ /dev/null
> >     @@ -1,17 +0,0 @@
> >     -Upstream-Status: Inappropriate (embedded specific)
> >     -
> >     -Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com
> >     <mailto:laurentiu.palcu@intel.com>>
> >     -
> >     -Index: flex-2.5.37/doc/Makefile.am
> >     -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     ---- flex-2.5.37.orig/doc/Makefile.am   2012-07-21
> >     04:18:27.000000000 +0300
> >     -+++ flex-2.5.37/doc/Makefile.am        2013-07-30
> >     17:57:09.834834531 +0300
> >     -@@ -2,7 +2,7 @@
> >     -
> >     - info_TEXINFOS =3D       flex.texi
> >     - dist_man_MANS =3D flex.1
> >     --dist_doc_DATA=3D flex.pdf
> >     -+EXTRA_DIST=3D flex.pdf
> >     -
> >     - CLEANFILES =3D \
> >     -       flex.hks \
> >     diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb
> >     <http://flex_2.6.0.bb> b/meta/recipes-devtools/flex/flex_2.6.2.bb
> >     <http://flex_2.6.2.bb>
> >     similarity index 79%
> >     rename from meta/recipes-devtools/flex/flex_2.6.0.bb
> >     <http://flex_2.6.0.bb>
> >     rename to meta/recipes-devtools/flex/flex_2.6.2.bb
> >     <http://flex_2.6.2.bb>
> >     index ab35b09..e723124 100644
> >     --- a/meta/recipes-devtools/flex/flex_2.6.0.bb <http://flex_2.6.0.b=
b
> >
> >     +++ b/meta/recipes-devtools/flex/flex_2.6.2.bb <http://flex_2.6.2.b=
b
> >
> >     @@ -5,22 +5,23 @@ HOMEPAGE =3D "http://sourceforge.net/projects/fle=
x/
> >     <http://sourceforge.net/projects/flex/>"
> >      SECTION =3D "devel"
> >      LICENSE =3D "BSD"
> >
> >     -DEPENDS =3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-nat=
ive
> >     flex-native', '', d)}"
> >     +DEPENDS =3D "flex-native ${@bb.utils.contains('PTEST_ENABLED', '1'=
,
> >     'bison-native', '', d)}"
> >      BBCLASSEXTEND =3D "native nativesdk"
> >
> >      LIC_FILES_CHKSUM =3D
> >     "file://COPYING;md5=3De4742cf92e89040b39486a6219b68067"
> >
> >     -SRC_URI =3D "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
> >     +SRC_URI =3D
> >     "https://github.com/westes/flex/releases/download/v${PV}/
> flex-${PV}.tar.gz
> >     <https://github.com/westes/flex/releases/download/v${PV}/
> flex-${PV}.tar.gz>
> >     \
> >                 file://run-ptest \
> >     -           file://do_not_create_pdf_doc.patch \
> >
> >     file://0001-tests-add-a-target-for-building-tests-without-runnin.pa=
tch
> \
> >     -
> >      file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch \
> >     -           file://CVE-2016-6354.patch \
> >                 ${@bb.utils.contains('PTEST_ENABLED', '1', '',
> >     'file://disable-tests.patch', d)} \
> >                 "
> >
> >     -SRC_URI[md5sum] =3D "266270f13c48ed043d95648075084d59"
> >     -SRC_URI[sha256sum] =3D
> >     "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
> >     +SRC_URI_append_class-target =3D " \
> >     +
> >      file://0001-use-stage1flex-from-flex-native-to-fix-cross-
> compili.patch
> >     \
> >     +           "
> >     +
> >     +SRC_URI[md5sum] =3D "cc6d76c333db7653d5caf423a3335239"
> >     +SRC_URI[sha256sum] =3D
> >     "9a01437a1155c799b7dc2508620564ef806ba66250c36bf5f9034b1c207cb2c9"
> >
> >      # Flex has moved to github from 2.6.1 onwards
> >      UPSTREAM_CHECK_URI =3D "https://github.com/westes/flex/releases
> >     <https://github.com/westes/flex/releases>"
> >     @@ -37,6 +38,7 @@ EXTRA_OEMAKE +=3D
> >     "${@bb.utils.contains('PTEST_ENABLED', '1', 'FLEX=3D${STAGING_BIND
> >
> >      do_install_append_class-native() {
> >             create_wrapper ${D}/${bindir}/flex M4=3D${M4}
> >     +       cp ${B}/src/stage1flex ${D}/${bindir}
> >      }
> >
> >      do_install_append_class-nativesdk() {
> >     --
> >     1.9.1
> >
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> >
> >
> >
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144392c41f16805470a1a98
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I did try 2.6.3 but it was even worse as reported, if anyo=
ne wants to use it as starting point here it is:<div><a href=3D"http://git.=
openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/master&amp;id=
=3D4590c0145a7ae98e7ff7bbf40ec3e25471484f60">http://git.openembedded.org/op=
enembedded-core-contrib/commit/?h=3Djansa/master&amp;id=3D4590c0145a7ae98e7=
ff7bbf40ec3e25471484f60</a><br></div><div><br></div><div>but then I&#39;ve =
reverted both 2.6.3 and 2.6.2 upgrade and I don&#39;t plan to work on it.</=
div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri,=
 Jan 27, 2017 at 3:16 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
On 1/26/17 2:39 PM, Martin Jansa wrote:<br>
&gt; This is breaking number of recipes as discussed in acpica thread:<br>
&gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2=
017-January/131555.html" rel=3D"noreferrer" target=3D"_blank">http://lists.=
openembedded.org/<wbr>pipermail/openembedded-core/<wbr>2017-January/131555.=
html</a><br>
&gt;<br>
&gt; in by builds I also see failures in qtwebkit, upstart, libpbnjson, ...=
<br>
&gt;<br>
&gt; I&#39;ve tried to upgrade to 2.6.3 as suggested in:<br>
&gt; <a href=3D"https://github.com/westes/flex/issues/164" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/westes/<wbr>flex/issues/164</a><br>
&gt;<br>
&gt; but that brings different set of undefined yy* symbols (e.g. yywrap in=
<br>
&gt; yylex function when building binutils-crosssdk and in the end it doesn=
&#39;t<br>
&gt; help at all, because even binutils, binutils-cross, dtc-native fail mu=
ch<br>
&gt; sooner.<br>
&gt;<br>
&gt; Is someone working on flex upgrade or can we revert this 2.6.2 upgrade=
<br>
&gt; until these issues are resolved?<br>
&gt;<br>
<br>
</span>+1<br>
I have reverted this upgrade locally. Its breaking webkit too. I think<br>
we should either revert this or try out 2.6.3 in short time.<br>
<span class=3D""><br>
&gt; On Mon, Dec 26, 2016 at 9:10 AM, Chen Qi &lt;<a href=3D"mailto:Qi.Chen=
@windriver.com">Qi.Chen@windriver.com</a><br>
</span><span class=3D"">&gt; &lt;mailto:<a href=3D"mailto:Qi.Chen@windriver=
.com">Qi.Chen@windriver.com</a>&gt;<wbr>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Upgrade flex to 2.6.2.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The following two patches are removed as they have =
been merged.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A00002-avoid-c-comments-in-c-<wbr>code-fails-w=
ith-gcc-6.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CVE-2016-6354.patch<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0do_not_create_pdf_doc.patch is removed as it&#39;s =
not suitable for the new<br>
&gt;=C2=A0 =C2=A0 =C2=A0version.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A00001-use-stage1flex-from-flex-<wbr>native-to-fix-cr=
oss-compili.<wbr>patch is added<br>
&gt;=C2=A0 =C2=A0 =C2=A0to fix cross compiling problem.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Che=
n@windriver.com">Qi.Chen@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Qi.Chen@windriv=
er.com">Qi.Chen@windriver.com</a>&gt;<wbr>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ...lex-from-flex-native-to-<wbr>fix-cross-compili.=
patch | 51<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ...oid-c-comments-in-c-code-<wbr>fails-with-gcc-6.=
patch | 64<br>
&gt;=C2=A0 =C2=A0 =C2=A0----------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .../recipes-devtools/flex/<wbr>flex/CVE-2016-6354.=
patch | 59<br>
&gt;=C2=A0 =C2=A0 =C2=A0--------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .../flex/flex/do_not_create_<wbr>pdf_doc.patch=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 ------<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0 .../flex/{<a href=3D"http://flex_2.6.0.bb" =
rel=3D"noreferrer" target=3D"_blank">flex_2.6.0.bb</a> &lt;<a href=3D"http:=
//flex_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">http://flex_2.6.0.bb<=
/a>&gt; =3D&gt; <a href=3D"http://flex_2.6.2.bb" rel=3D"noreferrer" target=
=3D"_blank">flex_2.6.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://flex_2.6.2.bb" rel=3D"norefer=
rer" target=3D"_blank">http://flex_2.6.2.bb</a>&gt;}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 16 +++---<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 5 files changed, 60 insertions(+)=
, 147 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/flex/<wbr>flex/0001-use-stage=
1flex-from-<wbr>flex-native-to-fix-cross-<wbr>compili.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/flex/<wbr>flex/0002-avoid-c-c=
omments-in-<wbr>c-code-fails-with-gcc-6.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 delete mode 100644 meta/recipes-devtools/flex/<wbr=
>flex/CVE-2016-6354.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/flex/<wbr>flex/do_not_create_=
pdf_doc.<wbr>patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rename meta/recipes-devtools/flex/{<a href=3D"http=
://flex_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">fl<wbr>ex_2.6.0.bb</=
a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://flex_2.6.0.bb" rel=3D"=
noreferrer" target=3D"_blank">http://flex_2.6.0.bb</a>&gt; =3D&gt; <a href=
=3D"http://flex_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">flex_2.6.2.b=
b</a> &lt;<a href=3D"http://flex_2.6.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">http://flex_2.6.2.bb</a>&gt;} (79%)<br>
<span class=3D"">&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/flex/<wbr>flex/0001-use-sta=
ge1flex-from-<wbr>flex-native-to-fix-cross-<wbr>compili.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/flex/<wbr>flex/0001-use-sta=
ge1flex-from-<wbr>flex-native-to-fix-cross-<wbr>compili.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000..08f7688<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/flex/<wbr>flex/0001-use-sta=
ge1flex-from-<wbr>flex-native-to-fix-cross-<wbr>compili.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,51 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: use stage1flex from flex-native to fix cr=
oss compiling<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+When cross compiling, we would have failure becaus=
e stage1flex<br>
&gt;=C2=A0 =C2=A0 =C2=A0cannot run on host.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Use stage1flex from flex-native to fix this proble=
m.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+This patch is OE specific as upstream may have oth=
er way to fix<br>
&gt;=C2=A0 =C2=A0 =C2=A0this cross compilation<br>
&gt;=C2=A0 =C2=A0 =C2=A0+problem.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Upstream-Status: Inappropriate [OE specific]<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Ch=
en@windriver.com">Qi.Chen@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Qi.Chen@windriv=
er.com">Qi.Chen@windriver.com</a>&gt;<wbr>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0+---<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ src/Makefile.am | 11 ++---------<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 1 file changed, 2 insertions(+), 9 deletions(-)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/src/Makefile.am b/src/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 77ddf4b..09ffddb 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/src/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/src/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -6,17 +6,10 @@ LIBS =3D @LIBS@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ m4 =3D @M4@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ bin_PROGRAMS =3D flex<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-noinst_PROGRAMS =3D stage1flex<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ lib_LTLIBRARIES =3D \<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http:=
//libfl.la" rel=3D"noreferrer" target=3D"_blank">libfl.la</a> &lt;<a href=
=3D"http://libfl.la" rel=3D"noreferrer" target=3D"_blank">http://libfl.la</=
a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libfl=
_pic.la" rel=3D"noreferrer" target=3D"_blank">libfl_pic.la</a> &lt;<a href=
=3D"http://libfl_pic.la" rel=3D"noreferrer" target=3D"_blank">http://libfl_=
pic.la</a>&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-stage1flex_SOURCES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 scan.l \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 $(COMMON_SOURCES)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-stage1flex_CFLAGS =3D $(AM_CFLAGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ flex_SOURCES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(COMMON_SOURCES)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -89,8 +82,8 @@ skel.c: flex.skl mkskel.sh flexi=
nt.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0tables_shared.h tables_shared.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(SHELL) $(srcdi=
r)/mkskel.sh &gt; $@.tmp<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0mv $@.tmp $@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-stage1scan.c: scan.l stage1flex$(EXEEXT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 ./stage1flex$(EXEEXT) -o $@ =
$&lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++stage1scan.c: scan.l<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 stage1flex$(EXEEXT) -o $@ $&=
lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ # make needs to be told to make parse.h so that p=
arallelized runs will<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ # not fail.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--<br>
&gt;=C2=A0 =C2=A0 =C2=A0+2.1.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/flex/<wbr>flex/0002-avoid-c=
-comments-in-<wbr>c-code-fails-with-gcc-6.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/flex/<wbr>flex/0002-avoid-c=
-comments-in-<wbr>c-code-fails-with-gcc-6.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 438ca5f..0000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/flex/<wbr>flex/0002-avoid-c=
-comments-in-<wbr>c-code-fails-with-gcc-6.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,64 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From 7072befe1397af4eb01c3ff7edf99f<wbr>0cd5076089=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3D<wbr>BCller=
?=3D<br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com">schnitzeltony@googlemail.com</a> &lt;mailto:<a href=3D"mailto:=
schnitzeltony@googlemail.com">schnitzeltony@<wbr>googlemail.com</a>&gt;&gt;=
<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0-Date: Tue, 30 Aug 2016 14:25:32 +=
0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Subject: [PATCH] avoid c++ comments in c-code - fa=
ils with gcc-6<br>
&gt;=C2=A0 =C2=A0 =C2=A0-MIME-Version: 1.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Content-Type: text/plain; charset=3DUTF-8<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Content-Transfer-Encoding: 8bit<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-fixes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-| error: C++ style comments are not allowed in ISO=
 C90<br>
&gt;=C2=A0 =C2=A0 =C2=A0-| num_to_alloc =3D 1; // After all that talk, this=
 was set to 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0anyways...<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Upstream-Status: Pending<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"=
mailto:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:schnitzeltony@g=
ooglemail.com">schnitzeltony@<wbr>googlemail.com</a>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0----<br>
&gt;=C2=A0 =C2=A0 =C2=A0- src/flex.skl | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- src/scan.c=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- src/skel.c=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- 3 files changed, 3 insertions(+), 3 deletions(-)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-diff --git a/src/flex.skl b/src/flex.skl<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 73a0b9e..ed71627 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- a/src/flex.skl<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ b/src/flex.skl<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_b=
uffer_<wbr>stack(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 * scanner will even need a stack. We use 2 instead<br>
&gt;=C2=A0 =C2=A0 =C2=A0of 1 to avoid an<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 * immediate realloc on the next call.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
num_to_alloc =3D 1; // After all that talk, this was<br>
&gt;=C2=A0 =C2=A0 =C2=A0set to 1 anyways...<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
num_to_alloc =3D 1; /* After all that talk, this was<br>
&gt;=C2=A0 =C2=A0 =C2=A0set to 1 anyways... */<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0YY_G(yy_buffer_stack) =3D (struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0yy_buffer_state**)yyalloc<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (num_to_alloc * sizeof(struct yy_buffer_state*)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 M4_YY_CALL_LAST_ARG);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-diff --git a/src/scan.c b/src/scan.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index b55df2d..f1dce75 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- a/src/scan.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ b/src/scan.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -4672,7 +4672,7 @@ static void yyensure_buffer_=
stack (void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 * scanner will even need a stack. We use 2 instead<br>
&gt;=C2=A0 =C2=A0 =C2=A0of 1 to avoid an<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 * immediate realloc on the next call.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
num_to_alloc =3D 1; // After all that talk, this was<br>
&gt;=C2=A0 =C2=A0 =C2=A0set to 1 anyways...<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
num_to_alloc =3D 1; /* After all that talk, this was<br>
&gt;=C2=A0 =C2=A0 =C2=A0set to 1 anyways...*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(yy_buffer_stack) =3D (struct yy_buffer_state**)yyalloc<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (num_to_alloc * sizeof(struct yy_buffer_state*)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-diff --git a/src/skel.c b/src/skel.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index ef657d3..26cc889 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- a/src/skel.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ b/src/skel.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -2561,7 +2561,7 @@ const char *skel[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * scanner will even need a stack. We use 2 instead<br>
&gt;=C2=A0 =C2=A0 =C2=A0of 1 to avoid an&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * immediate realloc on the next call.&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*/&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0num_to_alloc =3D 1; // After all that talk, this was<br>
&gt;=C2=A0 =C2=A0 =C2=A0set to 1 anyways...&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0num_to_alloc =3D 1; /* After all that talk, this was<br>
&gt;=C2=A0 =C2=A0 =C2=A0set to 1 anyways... */&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0YY_G(yy_buffer_stack) =3D (struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0yy_buffer_state**)yyalloc&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (num_to_alloc * sizeof(struct yy_buffer_state*)&qu=
ot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 M4_YY_CALL_LAST_ARG);&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0-2.5.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-devtools/flex/<wbr>flex/C=
VE-2016-6354.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/flex/<wbr>flex/CVE-2016-635=
4.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 216ac7a..0000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-devtools/flex/<wbr>flex/CVE-2016=
-6354.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,59 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From 3939eccdff598f47e5b37b05d58bf1<wbr>b44d3796e7=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.k=
ukkonen@intel.com">jussi.kukkonen@intel.com</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jussi.kukk=
onen@intel.com">jussi.kukkonen@intel.<wbr>com</a>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0-Date: Fri, 7 Oct 2016 14:15:38 +0=
300<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Subject: [PATCH] Prevent buffer overflow in yy_get=
_next_buffer<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-This is upstream commit a5cbe929ac3255d371e698f62d=
c256<wbr>afe7006466<br>
&gt;=C2=A0 =C2=A0 =C2=A0-with some additional backporting to make binutils =
build again.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Upstream-Status: Backport<br>
&gt;=C2=A0 =C2=A0 =C2=A0-CVE: CVE-2016-6354<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailt=
o:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jussi.kukkonen@=
intel.com">jussi.kukkonen@intel.<wbr>com</a>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0----<br>
&gt;=C2=A0 =C2=A0 =C2=A0- src/flex.skl | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- src/scan.c=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- src/skel.c=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- 3 files changed, 3 insertions(+), 3 deletions(-)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-diff --git a/src/flex.skl b/src/flex.skl<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index ed71627..814d562 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- a/src/flex.skl<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ b/src/flex.skl<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next=
_<wbr>buffer()<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 yy_size_t num_to_read =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int num_to_read =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0YY_CURRENT_BUFFER_LVALUE-&gt;yy_<wbr>buf_=
size -<br>
&gt;=C2=A0 =C2=A0 =C2=A0number_to_move - 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0while ( num_to_read &lt;=3D 0 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0-diff --git a/src/scan.c b/src/scan.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index f1dce75..1949872 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- a/src/scan.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ b/src/scan.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -4181,7 +4181,7 @@ static int yy_get_next_buffe=
r (void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 yy_size_t num_to_read =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int num_to_read =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0YY_CURRENT_BUFFER_LVALUE-&gt;yy_<wbr>buf_=
size -<br>
&gt;=C2=A0 =C2=A0 =C2=A0number_to_move - 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0while ( num_to_read &lt;=3D 0 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0-diff --git a/src/skel.c b/src/skel.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 26cc889..0344d18 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- a/src/skel.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ b/src/skel.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -1929,7 +1929,7 @@ const char *skel[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0&quot;&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0else&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yy_size_t num_to_read =3D&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int num_to_read =3D&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0YY_CURRENT_BUFFER_LVALUE-&gt;yy_<wbr>=
buf_size -<br>
&gt;=C2=A0 =C2=A0 =C2=A0number_to_move - 1;&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0&quot;&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0while ( num_to_read &lt;=3D 0 )&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0-2.1.4<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/flex/<wbr>flex/do_not_creat=
e_pdf_doc.<wbr>patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/flex/<wbr>flex/do_not_creat=
e_pdf_doc.<wbr>patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 032833ae..0000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-devtools/flex/<wbr>flex/do_not_c=
reate_pdf_doc.<wbr>patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,17 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Upstream-Status: Inappropriate (embedded specific)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Signed-off-by: Laurentiu Palcu &lt;<a href=3D"mail=
to:laurentiu.palcu@intel.com">laurentiu.palcu@intel.com</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:laurentiu.=
palcu@intel.com">laurentiu.palcu@intel.<wbr>com</a>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Index: flex-2.5.37/doc/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- flex-2.5.37.orig/doc/Makefile.<wbr>am=C2=A0 =
=C2=A02012-07-21<br>
&gt;=C2=A0 =C2=A0 =C2=A004:18:27.000000000 +0300<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ flex-2.5.37/doc/Makefile.am=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 2013-07-30<br>
&gt;=C2=A0 =C2=A0 =C2=A017:57:09.834834531 +0300<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -2,7 +2,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- info_TEXINFOS =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0flex.=
texi<br>
&gt;=C2=A0 =C2=A0 =C2=A0- dist_man_MANS =3D flex.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0--dist_doc_DATA=3D flex.pdf<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+EXTRA_DIST=3D flex.pdf<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CLEANFILES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0flex.hks \<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-devtools/flex/<a href=3D"=
http://flex_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">f<wbr>lex_2.6.0.=
bb</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://flex_2.6.0.bb" rel=3D"=
noreferrer" target=3D"_blank">http://flex_2.6.0.bb</a>&gt; b/meta/recipes-d=
evtools/flex/<a href=3D"http://flex_2.6.2.bb" rel=3D"noreferrer" target=3D"=
_blank">f<wbr>lex_2.6.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://flex_2.6.2.bb" rel=3D"norefer=
rer" target=3D"_blank">http://flex_2.6.2.bb</a>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0similarity index 79%<br>
&gt;=C2=A0 =C2=A0 =C2=A0rename from meta/recipes-devtools/flex/<a href=3D"h=
ttp://flex_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">fle<wbr>x_2.6.0.b=
b</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://flex_2.6.0.bb" rel=3D"=
noreferrer" target=3D"_blank">http://flex_2.6.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0rename to meta/recipes-devtools/flex/<a href=3D"htt=
p://flex_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">fle<wbr>x_2.6.2.bb<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://flex_2.6.2.bb" rel=3D"norefer=
rer" target=3D"_blank">http://flex_2.6.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index ab35b09..e723124 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-devtools/flex/<a href=3D"http://=
flex_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">f<wbr>lex_2.6.0.bb</a> =
&lt;<a href=3D"http://flex_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">h=
ttp://flex_2.6.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-devtools/flex/<a href=3D"http://=
flex_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">f<wbr>lex_2.6.2.bb</a> =
&lt;<a href=3D"http://flex_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">h=
ttp://flex_2.6.2.bb</a>&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0@@ -5,22 +5,23 @@ HOMEPAGE =
=3D &quot;<a href=3D"http://sourceforge.net/projects/flex/" rel=3D"noreferr=
er" target=3D"_blank">http://sourceforge.net/<wbr>projects/flex/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://sourceforge.net/projects/flex=
/" rel=3D"noreferrer" target=3D"_blank">http://sourceforge.net/<wbr>project=
s/flex/</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SECTION =3D &quot;devel&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 LICENSE =3D &quot;BSD&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-DEPENDS =3D &quot;${@bb.utils.contains(&#39;PTEST_=
<wbr>ENABLED&#39;, &#39;1&#39;, &#39;bison-native<br>
&gt;=C2=A0 =C2=A0 =C2=A0flex-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+DEPENDS =3D &quot;flex-native ${@bb.utils.contains=
(&#39;PTEST_<wbr>ENABLED&#39;, &#39;1&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;bison-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 LIC_FILES_CHKSUM =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://COPYING;md5=3D<wbr>e4742cf92e89040b394=
86a6219b680<wbr>67&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/flex/<wbr>=
flex-${PV}.tar.bz2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://github.com/westes/flex/rel=
eases/download/v${PV}/flex-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/westes/<wbr>flex/releases/download/v${PV}/<wbr>flex-$=
{PV}.tar.gz</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/westes/flex/relea=
ses/download/v${PV}/flex-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/westes/<wbr>flex/releases/download/v${PV}/<wbr>flex-${P=
V}.tar.gz</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ru=
n-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://do=
_not_create_pdf_doc.<wbr>patch \<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-tests-add-a-<wbr>target-for-building-te=
sts-<wbr>without-runnin.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0002-avoid-c-comments-<wbr>in-c-code-fails-=
with-gcc-6.<wbr>patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CV=
E-2016-6354.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.uti=
ls.contains(&#39;PTEST_<wbr>ENABLED&#39;, &#39;1&#39;, &#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;file://disable-tests.patch&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRC_URI[md5sum] =3D &quot;<wbr>266270f13c48ed043d9=
5648075084d<wbr>59&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<wbr>24e611ef5a4703a191012f80c1027d<wbr>c9d12=
555183ce0ecd46f3636e587e9<wbr>b8e9&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SRC_URI_append_class-target =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-use-stage1flex-<wbr>from-flex-native-t=
o-fix-cross-<wbr>compili.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SRC_URI[md5sum] =3D &quot;<wbr>cc6d76c333db7653d5c=
af423a33352<wbr>39&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<wbr>9a01437a1155c799b7dc2508620564<wbr>ef806=
ba66250c36bf5f9034b1c207c<wbr>b2c9&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Flex has moved to github from 2.6.1 onwards<br>
&gt;=C2=A0 =C2=A0 =C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gi=
thub.com/westes/flex/releases" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/westes/<wbr>flex/releases</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/westes/flex/relea=
ses" rel=3D"noreferrer" target=3D"_blank">https://github.com/westes/<wbr>fl=
ex/releases</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -37,6 +38,7 @@ EXTRA_OEMAKE +=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;PTEST_<wbr>ENABLED&=
#39;, &#39;1&#39;, &#39;FLEX=3D${STAGING_BIND<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 do_install_append_class-<wbr>native() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_wrapper ${D}/${b=
indir}/flex M4=3D${M4}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${B}/src/stage1flex =
${D}/${bindir}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 do_install_append_class-<wbr>nativesdk() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A01.9.1<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0______________________________<wbr>________________=
_<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedd=
ed-core@lists.openembedded.org">Openembedded-core@<wbr>lists.openembedded.o=
rg</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists=
.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://l=
ists.openembedded.<wbr>org/mailman/listinfo/<wbr>openembedded-core</a>&gt;<=
br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1144392c41f16805470a1a98--
