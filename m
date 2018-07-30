Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2327878D50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 06:12:42 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id m13-v6so10955811qth.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2018 23:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=she5VoxHWfzL/X2fWleU8y15dVF9lDsCURzWNBameUE=;
	b=YtqDmiMN0GYcae3T4I/A5O08UuMBP0unQlkGYQqISpJXOojO7CEjQs/f+/pjBuctD0
	I21j5XrDQW7I/WZ+QY1jX27j3dMcUlOw1FoHhdsjGlUYSxSNdRz3MXiQQGLP5DwEHx5L
	2v3POoBD+DDzQspsnNxkOiJr4LsnC8jdy0dxPkSyKosbVBG2Bda93M972WuKqH2OwjO8
	Ut2phIMb05iXbQNK4Hcc1FdpJP6uVX4bhIk/0lAwoqnDBiXZJItN6Kr39FT9OqxltfAH
	q0VosKCTX5xizQ7wBBXh4JUL7JgKtmAgR2nJxwTgh8uTyHxB5DgIZQAAYRntKtlgJ6ZD
	82QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=she5VoxHWfzL/X2fWleU8y15dVF9lDsCURzWNBameUE=;
	b=Jt277KTZKT1BAiHy7kR/xdlwfwVNF3QyK6ytHClrMvDmkzzsVP7sEVWB3JYbU/yaLX
	855lcDtrOhmnW8YHJrWe5Bz1IllOeB+jD+uVNDcU5i8rDRoU1WiSN5k/Vio3Y4o9zD0x
	NzWMaMLHdg+szY7+XSLoQ8eCwiomruyNMuJB1bqc3P7bPbSpZRg/7BbjqX7siQmbzjGs
	JRMXT0CTVHyxlQRitpNlCF083ItWkgK2vsudrNwG8dB6Y21PmJN9Huzw5OcHj+aFMlQb
	foKlbeq8BduLcAeVcqzvnGYEpIhFWj4IBzUbJiIBFAIWW50ZQJ6mKeZ3PEn+Fx90xY6F
	U6XA==
X-Gm-Message-State: AOUpUlH5xstypy+ldxsMT5oYkpQtOFrNuJ3u2G62qrKJctkzpQYIADep
	3xed9n0dOPooNjsGFB/EO4LhMoDKAzPkmZ9PiwL/jg==
X-Google-Smtp-Source: AAOMgpfzeYywkFTvK29PTGMW4ZAMs1KqK5p4/zMOOB7jVbQrivaN5LcpmJWU+2YWYtMaiOBiIJezLJYxQppy7f/D0uc=
X-Received: by 2002:ac8:25f1:: with SMTP id
	f46-v6mr15851842qtf.20.1532931163592; 
	Sun, 29 Jul 2018 23:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20180730044200.3164-1-joel@jms.id.au>
	<20180730044200.3164-3-joel@jms.id.au>
In-Reply-To: <20180730044200.3164-3-joel@jms.id.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Jul 2018 23:12:32 -0700
Message-ID: <CAMKF1sqjAnFL2dS0oo4_PbQGNLRiVUF59pvyqgvYWDzTcotgTg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gcc-7.3: Backport fixes for std::pair high memory usage
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
X-List-Received-Date: Mon, 30 Jul 2018 06:12:43 -0000
Content-Type: multipart/alternative; boundary="000000000000789d2305723159f5"

--000000000000789d2305723159f5
Content-Type: text/plain; charset="UTF-8"

V2 is good to install

On Sun, Jul 29, 2018 at 9:42 PM Joel Stanley <joel@jms.id.au> wrote:

> C++ applications that contain a specfic use of std::pair with tempates
> cause the build to require many gigabytes of RAM to build.
>
> This is a fix that was applied to the upstream GCC 7 branch.
>
> Change-Id: I213f96d1d6332e2dce5765482ff3413f1abd7ff8
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  meta/recipes-devtools/gcc/gcc-7.3.inc         |  1 +
>  ...-PR-c-80290-memory-hog-with-std-pair.patch | 58 +++++++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pair.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc
> b/meta/recipes-devtools/gcc/gcc-7.3.inc
> index 81320dc52a59..c7c88f12e499 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
> @@ -80,6 +80,7 @@ BACKPORTS = "\
>             file://0001-Fix-internal-compiler-error-in-testcase.patch \
>             file://0001-PR-rtl-optimization-83030.patch \
>             file://0001-Fix-ppc64le-build-Partial-backport-r256656.patch \
> +           file://0001-PR-c-80290-memory-hog-with-std-pair.patch \
>  "
>
>  SRC_URI[md5sum] = "be2da21680f27624f3a87055c4ba5af2"
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pair.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pair.patch
> new file mode 100644
> index 000000000000..ba43af92fff1
> --- /dev/null
> +++
> b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pair.patch
> @@ -0,0 +1,58 @@
> +From 8c014bceeca6a558519e86b16a8142accc41e94f Mon Sep 17 00:00:00 2001
> +From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Thu, 28 Jun 2018 00:25:21 +0000
> +Subject: [PATCH]       PR c++/80290 - memory-hog with std::pair.
> +
> +       * pt.c (type_unification_real): Skip non-dependent conversion
> +       check for a nested list argument.
> +       (braced_init_depth): New.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@262204
> 138bc75d-0d04-0410-961f-82ee72b054a4
> +Signed-off-by: Joel Stanley <joel@jms.id.au>
> +---
> + gcc/cp/pt.c      | 22 ++++++++++++++++++++++
> + 1 file changed, 22 insertions(+)
> +
> +diff --git a/gcc/cp/pt.c b/gcc/cp/pt.c
> +index 79cfd0129226..71077a3b0498 100644
> +--- a/gcc/cp/pt.c
> ++++ b/gcc/cp/pt.c
> +@@ -19242,6 +19242,24 @@ try_array_deduction (tree tparms, tree targs,
> tree parm)
> +                         /*nondeduced*/false, array_deduction_r);
> + }
> +
> ++/* Returns how many levels of { } INIT contains.  */
> ++
> ++static int
> ++braced_init_depth (tree init)
> ++{
> ++  if (!init || !BRACE_ENCLOSED_INITIALIZER_P (init))
> ++    return 0;
> ++  unsigned i; tree val;
> ++  unsigned max = 0;
> ++  FOR_EACH_CONSTRUCTOR_VALUE (CONSTRUCTOR_ELTS (init), i, val)
> ++    {
> ++      unsigned elt_d = braced_init_depth (val);
> ++      if (elt_d > max)
> ++      max = elt_d;
> ++    }
> ++  return max + 1;
> ++}
> ++
> + /* Most parms like fn_type_unification.
> +
> +    If SUBR is 1, we're being called recursively (to unify the
> +@@ -19478,6 +19496,10 @@ type_unification_real (tree tparms,
> +
> +           if (uses_template_parms (parm))
> +             continue;
> ++          /* Workaround for c++/80290: avoid combinatorial explosion on
> ++             deeply nested braced init-lists.  */
> ++          if (braced_init_depth (arg) > 2)
> ++            continue;
> +           if (check_non_deducible_conversion (parm, arg, strict, flags,
> +                                               explain_p))
> +             return 1;
> +--
> +2.17.1
> +
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000789d2305723159f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">V2 is good to install</div></div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Sun, Jul 29, 2018 at 9:42 PM Joel Stan=
ley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">C++ applications that contain a specfi=
c use of std::pair with tempates<br>
cause the build to require many gigabytes of RAM to build.<br>
<br>
This is a fix that was applied to the upstream GCC 7 branch.<br>
<br>
Change-Id: I213f96d1d6332e2dce5765482ff3413f1abd7ff8<br>
Signed-off-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D=
"_blank">joel@jms.id.au</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-7.3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
=C2=A0...-PR-c-80290-memory-hog-with-std-pair.patch | 58 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 59 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-=
memory-hog-with-std-pair.patch<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/=
gcc/gcc-7.3.inc<br>
index 81320dc52a59..c7c88f12e499 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc<br>
@@ -80,6 +80,7 @@ BACKPORTS =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-internal-compiler=
-error-in-testcase.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-PR-rtl-optimization-8=
3030.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-ppc64le-build-Par=
tial-backport-r256656.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-PR-c-80290-memory-hog=
-with-std-pair.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;be2da21680f27624f3a87055c4ba5af2&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-w=
ith-std-pair.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memo=
ry-hog-with-std-pair.patch<br>
new file mode 100644<br>
index 000000000000..ba43af92fff1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std=
-pair.patch<br>
@@ -0,0 +1,58 @@<br>
+From 8c014bceeca6a558519e86b16a8142accc41e94f Mon Sep 17 00:00:00 2001<br>
+From: jason &lt;jason@138bc75d-0d04-0410-961f-82ee72b054a4&gt;<br>
+Date: Thu, 28 Jun 2018 00:25:21 +0000<br>
+Subject: [PATCH]=C2=A0 =C2=A0 =C2=A0 =C2=A0PR c++/80290 - memory-hog with =
std::pair.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* pt.c (type_unification_real): Skip non-depend=
ent conversion<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0check for a nested list argument.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(braced_init_depth): New.<br>
+<br>
+git-svn-id: svn+ssh://<a href=3D"http://gcc.gnu.org/svn/gcc/branches/gcc-7=
-branch@262204" rel=3D"noreferrer" target=3D"_blank">gcc.gnu.org/svn/gcc/br=
anches/gcc-7-branch@262204</a> 138bc75d-0d04-0410-961f-82ee72b054a4<br>
+Signed-off-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=
=3D"_blank">joel@jms.id.au</a>&gt;<br>
+---<br>
+ gcc/cp/pt.c=C2=A0 =C2=A0 =C2=A0 | 22 ++++++++++++++++++++++<br>
+ 1 file changed, 22 insertions(+)<br>
+<br>
+diff --git a/gcc/cp/pt.c b/gcc/cp/pt.c<br>
+index 79cfd0129226..71077a3b0498 100644<br>
+--- a/gcc/cp/pt.c<br>
++++ b/gcc/cp/pt.c<br>
+@@ -19242,6 +19242,24 @@ try_array_deduction (tree tparms, tree targs, tre=
e parm)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/*nondeduced*/false, array_deduction_r);<br>
+ }<br>
+ <br>
++/* Returns how many levels of { } INIT contains.=C2=A0 */<br>
++<br>
++static int<br>
++braced_init_depth (tree init)<br>
++{<br>
++=C2=A0 if (!init || !BRACE_ENCLOSED_INITIALIZER_P (init))<br>
++=C2=A0 =C2=A0 return 0;<br>
++=C2=A0 unsigned i; tree val;<br>
++=C2=A0 unsigned max =3D 0;<br>
++=C2=A0 FOR_EACH_CONSTRUCTOR_VALUE (CONSTRUCTOR_ELTS (init), i, val)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned elt_d =3D braced_init_depth (val);<br>
++=C2=A0 =C2=A0 =C2=A0 if (elt_d &gt; max)<br>
++=C2=A0 =C2=A0 =C2=A0 max =3D elt_d;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 return max + 1;<br>
++}<br>
++<br>
+ /* Most parms like fn_type_unification.<br>
+ <br>
+=C2=A0 =C2=A0 If SUBR is 1, we&#39;re being called recursively (to unify t=
he<br>
+@@ -19478,6 +19496,10 @@ type_unification_real (tree tparms,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (uses_template_parms (parm))<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Workaround for c++/80290: avoid com=
binatorial explosion on<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deeply nested braced init=
-lists.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (braced_init_depth (arg) &gt; 2)<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (check_non_deducible_conversio=
n (parm, arg, strict, flags,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0explain_p))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+-- <br>
+2.17.1<br>
+<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000789d2305723159f5--
