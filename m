Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id D57B771C0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 02:22:18 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id d5so23694745uag.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 18:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qMk1lk2ukNJ8Ek+rd68ydk6gdQMW15dheltj9wX8GnM=;
	b=nCUGXRepIlKSCPwlVWE0450a+go+i10XBXyBZADosptyXB9Cft+33AO/QNsHbw44s7
	eXqlc3eC3kkRYZJXJgcEsPELiwFao9shFsXX/83xvcOXtllx+2l7MXxuSN5kv9GqiYHp
	rKEUrnqz4MBe8QXYD2TxYTxf0DSyCi+gfvK+6BlnFNAuxJ0sLcf3hviAyiLPsTS3oZsl
	j8/6le3RvOHubuyZhhSh6t/rgw8NyXU2wzPxyUpJmZ+XuEhFcJh4wxmFilGEsQ2lsM5r
	p6murvCtnVaZtQkuDl4EAQKPhkJJpIDOgzsQvHrRWKHqcUXVBlCv74cWWqNSOqk7G0gv
	jsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qMk1lk2ukNJ8Ek+rd68ydk6gdQMW15dheltj9wX8GnM=;
	b=sDmFlOY0D3bIAbUpxAwb0xXVpRPArTy6NuTsFsrVwHAO7GB8ItC5NPgk8AbB1MitCb
	6dyXZIGk+IoWdaGh3KSa18dOjQ/4Jq5Pq3yTK8APqLCTe5sO3/DarnchwIG1OXmghNgs
	TrG/sFB4wQysSs3GFlLOuF6g5J4eW1477RZXIiSS++i5GsCuwm34fPgZClZq/V83ZFcD
	FRJSLAxiF+6MD6IZSrlDNIPmdwPaBqzNr0O7Lv1QVxFhSKc73bbn700zgrrt9BkJE7hY
	+qYCGJKB3Rag21k5MJbQo1fFG2vjgBsmCRz2DrhdUwmJBEhuPIxIvpkrBte5Wh2R0YM5
	3hjQ==
X-Gm-Message-State: AIkVDXKRA9qHfsKU8Or7Zyy/VSVHIfzJuJ8QY7Yp5t6w3oVfD43F/VNutwaFA4f2qMHcjxsxEflOxj7mq2F2ig==
X-Received: by 10.176.83.218 with SMTP id l26mr2860589uaa.69.1485483738434;
	Thu, 26 Jan 2017 18:22:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Thu, 26 Jan 2017 18:21:48 -0800 (PST)
In-Reply-To: <CA+chaQe0PXA=4gA==O06bZP6c6oz2JXVAhCiqELZzs7KthQkRQ@mail.gmail.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
	<46d94601d67973b17516241cea3b6afce9a2914d.1482739038.git.Qi.Chen@windriver.com>
	<CA+chaQd519TOCHMNPzFnnWgZFi6=aWNC231-8=ihqf_Mfr-9Hw@mail.gmail.com>
	<49e5214c-5a23-05c0-c35d-636997dc7310@gmail.com>
	<CA+chaQe0PXA=4gA==O06bZP6c6oz2JXVAhCiqELZzs7KthQkRQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jan 2017 18:21:48 -0800
Message-ID: <CAMKF1sr8=kWBQCMZmou_hvkKNWmZQb0eQRFeb3GTR0L+v8oMfQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 27 Jan 2017 02:22:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 6:19 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> I did try 2.6.3 but it was even worse as reported,

thats just sad.

 if anyone wants to use it
> as starting point here it is:
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/m=
aster&id=3D4590c0145a7ae98e7ff7bbf40ec3e25471484f60
>
> but then I've reverted both 2.6.3 and 2.6.2 upgrade and I don't plan to w=
ork
> on it.

So I think revert it the only option for now.

>
> On Fri, Jan 27, 2017 at 3:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 1/26/17 2:39 PM, Martin Jansa wrote:
>> > This is breaking number of recipes as discussed in acpica thread:
>> >
>> > http://lists.openembedded.org/pipermail/openembedded-core/2017-January=
/131555.html
>> >
>> > in by builds I also see failures in qtwebkit, upstart, libpbnjson, ...
>> >
>> > I've tried to upgrade to 2.6.3 as suggested in:
>> > https://github.com/westes/flex/issues/164
>> >
>> > but that brings different set of undefined yy* symbols (e.g. yywrap in
>> > yylex function when building binutils-crosssdk and in the end it doesn=
't
>> > help at all, because even binutils, binutils-cross, dtc-native fail mu=
ch
>> > sooner.
>> >
>> > Is someone working on flex upgrade or can we revert this 2.6.2 upgrade
>> > until these issues are resolved?
>> >
>>
>> +1
>> I have reverted this upgrade locally. Its breaking webkit too. I think
>> we should either revert this or try out 2.6.3 in short time.
>>
>> > On Mon, Dec 26, 2016 at 9:10 AM, Chen Qi <Qi.Chen@windriver.com
>> > <mailto:Qi.Chen@windriver.com>> wrote:
>> >
>> >     Upgrade flex to 2.6.2.
>> >
>> >     The following two patches are removed as they have been merged.
>> >       0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
>> >       CVE-2016-6354.patch
>> >
>> >     do_not_create_pdf_doc.patch is removed as it's not suitable for th=
e
>> > new
>> >     version.
>> >
>> >     0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch is
>> > added
>> >     to fix cross compiling problem.
>> >
>> >     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>> >     <mailto:Qi.Chen@windriver.com>>
>> >     ---
>> >      ...lex-from-flex-native-to-fix-cross-compili.patch | 51
>> >     +++++++++++++++++
>> >      ...oid-c-comments-in-c-code-fails-with-gcc-6.patch | 64
>> >     ----------------------
>> >      .../recipes-devtools/flex/flex/CVE-2016-6354.patch | 59
>> >     --------------------
>> >      .../flex/flex/do_not_create_pdf_doc.patch          | 17 ------
>> >      .../flex/{flex_2.6.0.bb <http://flex_2.6.0.bb> =3D> flex_2.6.2.bb
>> >     <http://flex_2.6.2.bb>}          | 16 +++---
>> >      5 files changed, 60 insertions(+), 147 deletions(-)
>> >      create mode 100644
>> >
>> > meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-flex-native-t=
o-fix-cross-compili.patch
>> >      delete mode 100644
>> >
>> > meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-=
with-gcc-6.patch
>> >      delete mode 100644
>> > meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
>> >      delete mode 100644
>> >     meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
>> >      rename meta/recipes-devtools/flex/{flex_2.6.0.bb
>> >     <http://flex_2.6.0.bb> =3D> flex_2.6.2.bb <http://flex_2.6.2.bb>}
>> > (79%)
>> >
>> >     diff --git
>> >
>> > a/meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-flex-native=
-to-fix-cross-compili.patch
>> >
>> > b/meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-flex-native=
-to-fix-cross-compili.patch
>> >     new file mode 100644
>> >     index 0000000..08f7688
>> >     --- /dev/null
>> >     +++
>> >
>> > b/meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-flex-native=
-to-fix-cross-compili.patch
>> >     @@ -0,0 +1,51 @@
>> >     +Subject: use stage1flex from flex-native to fix cross compiling
>> >     +
>> >     +When cross compiling, we would have failure because stage1flex
>> >     cannot run on host.
>> >     +Use stage1flex from flex-native to fix this problem.
>> >     +
>> >     +This patch is OE specific as upstream may have other way to fix
>> >     this cross compilation
>> >     +problem.
>> >     +
>> >     +Upstream-Status: Inappropriate [OE specific]
>> >     +
>> >     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>> >     <mailto:Qi.Chen@windriver.com>>
>> >     +---
>> >     + src/Makefile.am | 11 ++---------
>> >     + 1 file changed, 2 insertions(+), 9 deletions(-)
>> >     +
>> >     +diff --git a/src/Makefile.am b/src/Makefile.am
>> >     +index 77ddf4b..09ffddb 100644
>> >     +--- a/src/Makefile.am
>> >     ++++ b/src/Makefile.am
>> >     +@@ -6,17 +6,10 @@ LIBS =3D @LIBS@
>> >     + m4 =3D @M4@
>> >     +
>> >     + bin_PROGRAMS =3D flex
>> >     +-noinst_PROGRAMS =3D stage1flex
>> >     + lib_LTLIBRARIES =3D \
>> >     +       libfl.la <http://libfl.la> \
>> >     +       libfl_pic.la <http://libfl_pic.la>
>> >     +
>> >     +-stage1flex_SOURCES =3D \
>> >     +-      scan.l \
>> >     +-      $(COMMON_SOURCES)
>> >     +-
>> >     +-stage1flex_CFLAGS =3D $(AM_CFLAGS)
>> >     +-
>> >     + flex_SOURCES =3D \
>> >     +       $(COMMON_SOURCES)
>> >     +
>> >     +@@ -89,8 +82,8 @@ skel.c: flex.skl mkskel.sh flexint.h
>> >     tables_shared.h tables_shared.c
>> >     +         $(SHELL) $(srcdir)/mkskel.sh > $@.tmp
>> >     +       mv $@.tmp $@
>> >     +
>> >     +-stage1scan.c: scan.l stage1flex$(EXEEXT)
>> >     +-      ./stage1flex$(EXEEXT) -o $@ $<
>> >     ++stage1scan.c: scan.l
>> >     ++      stage1flex$(EXEEXT) -o $@ $<
>> >     +
>> >     + # make needs to be told to make parse.h so that parallelized run=
s
>> > will
>> >     + # not fail.
>> >     +--
>> >     +2.1.0
>> >     +
>> >     diff --git
>> >
>> > a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fail=
s-with-gcc-6.patch
>> >
>> > b/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fail=
s-with-gcc-6.patch
>> >     deleted file mode 100644
>> >     index 438ca5f..0000000
>> >     ---
>> >
>> > a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fail=
s-with-gcc-6.patch
>> >     +++ /dev/null
>> >     @@ -1,64 +0,0 @@
>> >     -From 7072befe1397af4eb01c3ff7edf99f0cd5076089 Mon Sep 17 00:00:00
>> > 2001
>> >     -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D
>> >     <schnitzeltony@googlemail.com <mailto:schnitzeltony@googlemail.com=
>>
>> >     -Date: Tue, 30 Aug 2016 14:25:32 +0200
>> >     -Subject: [PATCH] avoid c++ comments in c-code - fails with gcc-6
>> >     -MIME-Version: 1.0
>> >     -Content-Type: text/plain; charset=3DUTF-8
>> >     -Content-Transfer-Encoding: 8bit
>> >     -
>> >     -fixes:
>> >     -
>> >     -| error: C++ style comments are not allowed in ISO C90
>> >     -| num_to_alloc =3D 1; // After all that talk, this was set to 1
>> >     anyways...
>> >     -
>> >     -Upstream-Status: Pending
>> >     -
>> >     -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com
>> >     <mailto:schnitzeltony@googlemail.com>>
>> >     ----
>> >     - src/flex.skl | 2 +-
>> >     - src/scan.c   | 2 +-
>> >     - src/skel.c   | 2 +-
>> >     - 3 files changed, 3 insertions(+), 3 deletions(-)
>> >     -
>> >     -diff --git a/src/flex.skl b/src/flex.skl
>> >     -index 73a0b9e..ed71627 100644
>> >     ---- a/src/flex.skl
>> >     -+++ b/src/flex.skl
>> >     -@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_buffer_stack(voi=
d)
>> >     -                * scanner will even need a stack. We use 2 instea=
d
>> >     of 1 to avoid an
>> >     -                * immediate realloc on the next call.
>> >     -          */
>> >     --              num_to_alloc =3D 1; // After all that talk, this w=
as
>> >     set to 1 anyways...
>> >     -+              num_to_alloc =3D 1; /* After all that talk, this w=
as
>> >     set to 1 anyways... */
>> >     -               YY_G(yy_buffer_stack) =3D (struct
>> >     yy_buffer_state**)yyalloc
>> >     -
>> >      (num_to_alloc * sizeof(struct yy_buffer_state*)
>> >     -
>> >      M4_YY_CALL_LAST_ARG);
>> >     -diff --git a/src/scan.c b/src/scan.c
>> >     -index b55df2d..f1dce75 100644
>> >     ---- a/src/scan.c
>> >     -+++ b/src/scan.c
>> >     -@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)
>> >     -                * scanner will even need a stack. We use 2 instea=
d
>> >     of 1 to avoid an
>> >     -                * immediate realloc on the next call.
>> >     -          */
>> >     --              num_to_alloc =3D 1; // After all that talk, this w=
as
>> >     set to 1 anyways...
>> >     -+              num_to_alloc =3D 1; /* After all that talk, this w=
as
>> >     set to 1 anyways...*/
>> >     -               (yy_buffer_stack) =3D (struct
>> > yy_buffer_state**)yyalloc
>> >     -
>> >      (num_to_alloc * sizeof(struct yy_buffer_state*)
>> >     -                                                               );
>> >     -diff --git a/src/skel.c b/src/skel.c
>> >     -index ef657d3..26cc889 100644
>> >     ---- a/src/skel.c
>> >     -+++ b/src/skel.c
>> >     -@@ -2561,7 +2561,7 @@ const char *skel[] =3D {
>> >     -   "            * scanner will even need a stack. We use 2 instea=
d
>> >     of 1 to avoid an",
>> >     -   "            * immediate realloc on the next call.",
>> >     -   "         */",
>> >     --  "           num_to_alloc =3D 1; // After all that talk, this w=
as
>> >     set to 1 anyways...",
>> >     -+  "           num_to_alloc =3D 1; /* After all that talk, this w=
as
>> >     set to 1 anyways... */",
>> >     -   "           YY_G(yy_buffer_stack) =3D (struct
>> >     yy_buffer_state**)yyalloc",
>> >     -   "
>> >      (num_to_alloc * sizeof(struct yy_buffer_state*)",
>> >     -   "
>> >      M4_YY_CALL_LAST_ARG);",
>> >     ---
>> >     -2.5.5
>> >     -
>> >     diff --git a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
>> >     b/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
>> >     deleted file mode 100644
>> >     index 216ac7a..0000000
>> >     --- a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
>> >     +++ /dev/null
>> >     @@ -1,59 +0,0 @@
>> >     -From 3939eccdff598f47e5b37b05d58bf1b44d3796e7 Mon Sep 17 00:00:00
>> > 2001
>> >     -From: Jussi Kukkonen <jussi.kukkonen@intel.com
>> >     <mailto:jussi.kukkonen@intel.com>>
>> >     -Date: Fri, 7 Oct 2016 14:15:38 +0300
>> >     -Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer
>> >     -
>> >     -This is upstream commit a5cbe929ac3255d371e698f62dc256afe7006466
>> >     -with some additional backporting to make binutils build again.
>> >     -
>> >     -Upstream-Status: Backport
>> >     -CVE: CVE-2016-6354
>> >     -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com
>> >     <mailto:jussi.kukkonen@intel.com>>
>> >     ----
>> >     - src/flex.skl | 2 +-
>> >     - src/scan.c   | 2 +-
>> >     - src/skel.c   | 2 +-
>> >     - 3 files changed, 3 insertions(+), 3 deletions(-)
>> >     -
>> >     -diff --git a/src/flex.skl b/src/flex.skl
>> >     -index ed71627..814d562 100644
>> >     ---- a/src/flex.skl
>> >     -+++ b/src/flex.skl
>> >     -@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_buffer()
>> >     -
>> >     -       else
>> >     -               {
>> >     --                      yy_size_t num_to_read =3D
>> >     -+                      int num_to_read =3D
>> >     -                       YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
>> >     number_to_move - 1;
>> >     -
>> >     -               while ( num_to_read <=3D 0 )
>> >     -diff --git a/src/scan.c b/src/scan.c
>> >     -index f1dce75..1949872 100644
>> >     ---- a/src/scan.c
>> >     -+++ b/src/scan.c
>> >     -@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)
>> >     -
>> >     -       else
>> >     -               {
>> >     --                      yy_size_t num_to_read =3D
>> >     -+                      int num_to_read =3D
>> >     -                       YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
>> >     number_to_move - 1;
>> >     -
>> >     -               while ( num_to_read <=3D 0 )
>> >     -diff --git a/src/skel.c b/src/skel.c
>> >     -index 26cc889..0344d18 100644
>> >     ---- a/src/skel.c
>> >     -+++ b/src/skel.c
>> >     -@@ -1929,7 +1929,7 @@ const char *skel[] =3D {
>> >     -   "",
>> >     -   "   else",
>> >     -   "           {",
>> >     --  "                   yy_size_t num_to_read =3D",
>> >     -+  "                   int num_to_read =3D",
>> >     -   "                   YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
>> >     number_to_move - 1;",
>> >     -   "",
>> >     -   "           while ( num_to_read <=3D 0 )",
>> >     ---
>> >     -2.1.4
>> >     -
>> >     diff --git
>> >     a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
>> >     b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
>> >     deleted file mode 100644
>> >     index 032833ae..0000000
>> >     --- a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
>> >     +++ /dev/null
>> >     @@ -1,17 +0,0 @@
>> >     -Upstream-Status: Inappropriate (embedded specific)
>> >     -
>> >     -Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com
>> >     <mailto:laurentiu.palcu@intel.com>>
>> >     -
>> >     -Index: flex-2.5.37/doc/Makefile.am
>> >     -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >     ---- flex-2.5.37.orig/doc/Makefile.am   2012-07-21
>> >     04:18:27.000000000 +0300
>> >     -+++ flex-2.5.37/doc/Makefile.am        2013-07-30
>> >     17:57:09.834834531 +0300
>> >     -@@ -2,7 +2,7 @@
>> >     -
>> >     - info_TEXINFOS =3D       flex.texi
>> >     - dist_man_MANS =3D flex.1
>> >     --dist_doc_DATA=3D flex.pdf
>> >     -+EXTRA_DIST=3D flex.pdf
>> >     -
>> >     - CLEANFILES =3D \
>> >     -       flex.hks \
>> >     diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb
>> >     <http://flex_2.6.0.bb> b/meta/recipes-devtools/flex/flex_2.6.2.bb
>> >     <http://flex_2.6.2.bb>
>> >     similarity index 79%
>> >     rename from meta/recipes-devtools/flex/flex_2.6.0.bb
>> >     <http://flex_2.6.0.bb>
>> >     rename to meta/recipes-devtools/flex/flex_2.6.2.bb
>> >     <http://flex_2.6.2.bb>
>> >     index ab35b09..e723124 100644
>> >     --- a/meta/recipes-devtools/flex/flex_2.6.0.bb
>> > <http://flex_2.6.0.bb>
>> >     +++ b/meta/recipes-devtools/flex/flex_2.6.2.bb
>> > <http://flex_2.6.2.bb>
>> >     @@ -5,22 +5,23 @@ HOMEPAGE =3D "http://sourceforge.net/projects/fl=
ex/
>> >     <http://sourceforge.net/projects/flex/>"
>> >      SECTION =3D "devel"
>> >      LICENSE =3D "BSD"
>> >
>> >     -DEPENDS =3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-na=
tive
>> >     flex-native', '', d)}"
>> >     +DEPENDS =3D "flex-native ${@bb.utils.contains('PTEST_ENABLED', '1=
',
>> >     'bison-native', '', d)}"
>> >      BBCLASSEXTEND =3D "native nativesdk"
>> >
>> >      LIC_FILES_CHKSUM =3D
>> >     "file://COPYING;md5=3De4742cf92e89040b39486a6219b68067"
>> >
>> >     -SRC_URI =3D "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
>> >     +SRC_URI =3D
>> >
>> > "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.ta=
r.gz
>> >
>> > <https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.ta=
r.gz>
>> >     \
>> >                 file://run-ptest \
>> >     -           file://do_not_create_pdf_doc.patch \
>> >
>> >
>> > file://0001-tests-add-a-target-for-building-tests-without-runnin.patch=
 \
>> >     -
>> >      file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch \
>> >     -           file://CVE-2016-6354.patch \
>> >                 ${@bb.utils.contains('PTEST_ENABLED', '1', '',
>> >     'file://disable-tests.patch', d)} \
>> >                 "
>> >
>> >     -SRC_URI[md5sum] =3D "266270f13c48ed043d95648075084d59"
>> >     -SRC_URI[sha256sum] =3D
>> >     "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
>> >     +SRC_URI_append_class-target =3D " \
>> >     +
>> >
>> > file://0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch
>> >     \
>> >     +           "
>> >     +
>> >     +SRC_URI[md5sum] =3D "cc6d76c333db7653d5caf423a3335239"
>> >     +SRC_URI[sha256sum] =3D
>> >     "9a01437a1155c799b7dc2508620564ef806ba66250c36bf5f9034b1c207cb2c9"
>> >
>> >      # Flex has moved to github from 2.6.1 onwards
>> >      UPSTREAM_CHECK_URI =3D "https://github.com/westes/flex/releases
>> >     <https://github.com/westes/flex/releases>"
>> >     @@ -37,6 +38,7 @@ EXTRA_OEMAKE +=3D
>> >     "${@bb.utils.contains('PTEST_ENABLED', '1', 'FLEX=3D${STAGING_BIND
>> >
>> >      do_install_append_class-native() {
>> >             create_wrapper ${D}/${bindir}/flex M4=3D${M4}
>> >     +       cp ${B}/src/stage1flex ${D}/${bindir}
>> >      }
>> >
>> >      do_install_append_class-nativesdk() {
>> >     --
>> >     1.9.1
>> >
>> >     --
>> >     _______________________________________________
>> >     Openembedded-core mailing list
>> >     Openembedded-core@lists.openembedded.org
>> >     <mailto:Openembedded-core@lists.openembedded.org>
>> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>> >
>> >
>> >
>> >
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

