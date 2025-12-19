Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E1DD78784
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 14:19:20 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17585.1766153951670266638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 06:19:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a/AO8s3x;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78ac9f30833so13590347b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 06:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766153951; x=1766758751; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=digCKeKOVQXuCKVNoVvACTTKjhyi72x/gwvDvU6bh7E=;
        b=a/AO8s3xGrFdnmwEFTfcibiiO+VorIe/ePgNo2tIXKVjlbHvZxdl0T0OU2CcIa8Z/f
         ij/DF9yd9D0e8svyEJHMcPYb9NAyQ5RphNEtsuvy10ntMe9zR453qyZ7aTug+NnE0z9v
         ohxay0Mbwa+zrD4h8XreU2z7fFqntCGtPIUfYGxBs4akbbj6l+ErfEEheezsFasL3oWP
         4SuWyMCIkFngRD40Y+1hWG1pogenOqU79dovyAC07pwdNnOWR+YYrTr3RGFqGIMms3Ic
         q1JDqBqP8KG8tcYN+4/DU7zSkIusxaqriJ4JOYyRzxPMvz61cvlwHnEAbw3FRq+28qCN
         KIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766153951; x=1766758751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=digCKeKOVQXuCKVNoVvACTTKjhyi72x/gwvDvU6bh7E=;
        b=wLmOtMhipwHCkDYBlWr5q3BKkIYGoSGn5iaTnvjn4uFj7aMDa85kqfgls2LAruOkXM
         fVknIgKrFeKP+kRSBhe3xHezWxJQccmEW/cLqvYbt+nB07v30tyiybJ8foIgqkkSUYHe
         VKxJA4319J5IxvGKeVeKS6qJn0G1LYmyaTQCC+7u3cGwnUENEP/5B/T82m0PUE0BMeZX
         MIcIbQPWAJ4Q++fdOUaLYPgpVoTkucJA91iix+sWaewU53aNn7steomxB9g1M4kr+5sX
         csyI/PHJV0iWcGP8PSujleVgXLMd6rSHbBGlOVZyRM8c1ZAcJpt4J5hpWM4f788/ATVA
         m08g==
X-Gm-Message-State: AOJu0YzU8K4MZYtIi6vYI8UOGbOPWltQuqRVhZzr9/HMhaBn0679XpN1
	Dv/DhuxDY8oSlQW20bnNcowteMWR2HmOLL7B6r6OXdaaAJCKJYjqUISlsrBpBC1yG7TcW0vxAyR
	wOcVOKSWB+pcvu+LOS7gEbJ3+lmC223o=
X-Gm-Gg: AY/fxX5MzVYCPShnqfDDczEIynaxzGqZHghyhZyIDcqsk4ADaEfOY/RkC9XPhqe5tkO
	rgir16GsRt/RznzRnS2IGn4lyRHf8Y6CtkowUxfsCOUIwRpFOEyfC+bGra2NCu4BafM2VAAlnXG
	HhptBm8Nf935U2xgEcGD7rVARndjYr1wPlElzprt6n6pyT572Jh+xVVdKQvyE1jA+EmwnC5DjXE
	Q12x8mq1UER/5nIPKfI6jg6WvtoXQfvgLlD+nEYHfbHIaWk2qWM1H6olPVhOqqkPYfxjrHTDvhX
	8VT22XAPD/uva3BErxmRiSmgL7JiVYaDuQr7StH6zyHeVcIchtbeklCmisuTT8m5+3C++zxTaYD
	UfCO+XLyayiJG
X-Google-Smtp-Source: AGHT+IHpY3GNtQ92DJH1ZeYVwdcndYLo7MTpguLJHUZaeF0fgrM1YnJbF4xEnwSUzwkzExHj48c5jBNBFNNtmN76UFs=
X-Received: by 2002:a05:690c:3513:b0:78c:7ee5:4434 with SMTP id
 00721157ae682-78fb3ed3008mr23614457b3.10.1766153950698; Fri, 19 Dec 2025
 06:19:10 -0800 (PST)
MIME-Version: 1.0
References: <20251217072654.326736-1-hongxu.jia@windriver.com>
In-Reply-To: <20251217072654.326736-1-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Dec 2025 10:18:59 -0400
X-Gm-Features: AQt7F2r2LOu4DTyuMoo54Xf6TDlMr2HTtUrYAYofhBkWYgYWjQx8lGkp-E03uQ0
Message-ID: <CAMKF1spDupA9C+qVshoiJMDWWo1hLizVMfF9WBpEESwNxvJ+Nw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gcc: fix ICE when building webkitgtk
To: hongxu.jia@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d9a1e806464ec24e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 14:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228239

--000000000000d9a1e806464ec24e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lgtm

On Wed, Dec 17, 2025 at 3:27=E2=80=AFAM hongxu via lists.openembedded.org
<hongxu.jia=3Dwindriver.com@lists.openembedded.org> wrote:

> Compile webkitgtk failed with ICE
> ...
> |tmp/work/x86-64-v3-oe-linux/webkitgtk/2.50.0/sources/webkitgtk-2.50.0/
> Source/WebCore/platform/ScrollAnimationMomentum.cpp:96:6: internal compil=
er
> error: in expand_debug_locations, at cfgexpand.cc:6042
> ...
>
> Backport a patch from upstream to fix the issue [1][2]
>
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D122394
> [2]
> https://gcc.gnu.org/cgit/gcc/commit/?id=3De55dcff97708a4937dc4d8736b8b307=
4ebbff6f3
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-15.2.inc        |  1 +
>  .../gcc/gcc/0027-gcc15-pr122394.patch         | 88 +++++++++++++++++++
>  2 files changed, 89 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.pat=
ch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc
> b/meta/recipes-devtools/gcc/gcc-15.2.inc
> index 3ed4600361..b02cc4fcb9 100644
> --- a/meta/recipes-devtools/gcc/gcc-15.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
> @@ -73,6 +73,7 @@ SRC_URI =3D "${BASEURI} \
>             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
>             file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
>             file://0026-fix-pr90579-testcases.patch \
> +           file://0027-gcc15-pr122394.patch \
>             file://0001-mapper-localhost-might-not-be-known.patch \
>  "
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
> b/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
> new file mode 100644
> index 0000000000..9ee371cef7
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
> @@ -0,0 +1,88 @@
> +From e55dcff97708a4937dc4d8736b8b3074ebbff6f3 Mon Sep 17 00:00:00 2001
> +From: Jakub Jelinek <jakub@redhat.com>
> +Date: Mon, 27 Oct 2025 17:43:17 +0100
> +Subject: phiopt: Fix up DEBUG_EXPR_DECL creation in spaceship_replacemen=
t
> + [PR122394]
> +
> +The following testcase ICEs in gcc 15 (and is at least latent in 12-14
> too),
> +because the DEBUG_EXPR_DECL has incorrect mode.  It has
> +TREE_TYPE (orig_use_lhs) type, but TYPE_MODE (type) rather than
> +TYPE_MODE (TREE_TYPE (orig_use_lhs)) where the two types are sometimes
> +the same, but sometimes different (same if !has_cast_debug_uses, differe=
nt
> +otherwise).
> +
> +Though, there wouldn't be the this issue if it used the proper API to
> create
> +the DEBUG_EXPR_DECL which takes care of everything.  This is the sole
> +spot that doesn't use that API.
> +
> +Doesn't affect the trunk because the code has been removed and replaced
> with
> +different stuff after the libstdc++ ABI change in r16-3474.
> +Before r15-5557 the mode has been always wrong because this was done onl=
y
> +for has_cast_debug_uses.  And the bug has been introduced with r12-5490.
> +
> +Enough archeology, while it could be fixed by changing the second
> +SET_DECL_MODE argument, I think it is better to use build_debug_expr_dec=
l.
> +
> +2025-10-27  Jakub Jelinek  <jakub@redhat.com>
> +
> +       PR tree-optimization/122394
> +       * tree-ssa-phiopt.cc (spaceship_replacement): Use
> +       build_debug_expr_decl instead of manually building DEBUG_EXPR_DEC=
L
> +       and getting SET_DECL_MODE wrong.
> +
> +       * g++.dg/opt/pr122394.C: New test.
> +
> +Upstream-Status: Backport [
> https://gcc.gnu.org/cgit/gcc/commit/?id=3De55dcff97708a4937dc4d8736b8b307=
4ebbff6f3
> ]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + gcc/testsuite/g++.dg/opt/pr122394.C | 20 ++++++++++++++++++++
> + gcc/tree-ssa-phiopt.cc              |  6 ++----
> + 2 files changed, 22 insertions(+), 4 deletions(-)
> + create mode 100644 gcc/testsuite/g++.dg/opt/pr122394.C
> +
> +diff --git a/gcc/testsuite/g++.dg/opt/pr122394.C
> b/gcc/testsuite/g++.dg/opt/pr122394.C
> +new file mode 100644
> +index 000000000000..1f84bebd74c2
> +--- /dev/null
> ++++ b/gcc/testsuite/g++.dg/opt/pr122394.C
> +@@ -0,0 +1,20 @@
> ++// PR tree-optimization/122394
> ++// { dg-do compile { target c++23 } }
> ++// { dg-options "-O1 -g" }
> ++
> ++#include <compare>
> ++
> ++struct A {
> ++  friend auto operator<=3D> (A, A) =3D default;
> ++  double a;
> ++};
> ++void foo ();
> ++A b, c;
> ++
> ++void
> ++bar ()
> ++{
> ++  bool d =3D c >=3D b;
> ++  if (d)
> ++    foo ();
> ++}
> +diff --git a/gcc/tree-ssa-phiopt.cc b/gcc/tree-ssa-phiopt.cc
> +index aaebae6b38c0..3e0ad9d3bb09 100644
> +--- a/gcc/tree-ssa-phiopt.cc
> ++++ b/gcc/tree-ssa-phiopt.cc
> +@@ -2995,10 +2995,8 @@ spaceship_replacement (basic_block cond_bb,
> basic_block middle_bb,
> +             if (has_cast_debug_uses
> +                 || (HONOR_NANS (TREE_TYPE (lhs1)) && !is_cast))
> +               {
> +-                tree temp3 =3D make_node (DEBUG_EXPR_DECL);
> +-                DECL_ARTIFICIAL (temp3) =3D 1;
> +-                TREE_TYPE (temp3) =3D TREE_TYPE (orig_use_lhs);
> +-                SET_DECL_MODE (temp3, TYPE_MODE (type));
> ++                tree temp3
> ++                  =3D build_debug_expr_decl (TREE_TYPE (orig_use_lhs));
> +                 if (has_cast_debug_uses)
> +                   t =3D fold_convert (TREE_TYPE (temp3), temp2);
> +                 else
> +--
> +cgit
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228000):
> https://lists.openembedded.org/g/openembedded-core/message/228000
> Mute This Topic: https://lists.openembedded.org/mt/116823455/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d9a1e806464ec24e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Lgtm</div><div dir=3D"auto"><br><div class=3D"gmail_quote=
 gmail_quote_container" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Dec 17, 2025 at 3:27=E2=80=AFAM hongxu via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;hongxu.jia=3D<a href=3D"ma=
ilto:windriver.com@lists.openembedded.org">windriver.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Compile webkitg=
tk failed with ICE<br>
...<br>
|tmp/work/x86-64-v3-oe-linux/webkitgtk/2.50.0/sources/webkitgtk-2.50.0/<br>
Source/WebCore/platform/ScrollAnimationMomentum.cpp:96:6: internal compiler=
<br>
error: in expand_debug_locations, at cfgexpand.cc:6042<br>
...<br>
<br>
Backport a patch from upstream to fix the issue [1][2]<br>
<br>
[1] <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D122394" rel=
=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi=
?id=3D122394</a><br>
[2] <a href=3D"https://gcc.gnu.org/cgit/gcc/commit/?id=3De55dcff97708a4937d=
c4d8736b8b3074ebbff6f3" rel=3D"noreferrer" target=3D"_blank">https://gcc.gn=
u.org/cgit/gcc/commit/?id=3De55dcff97708a4937dc4d8736b8b3074ebbff6f3</a><br=
>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-15.2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0.../gcc/gcc/0027-gcc15-pr122394.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 88 +++++++++++++++++++<br>
=C2=A02 files changed, 89 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.=
patch<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools=
/gcc/gcc-15.2.inc<br>
index 3ed4600361..b02cc4fcb9 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-15.2.inc<br>
@@ -73,6 +73,7 @@ SRC_URI =3D &quot;${BASEURI} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-Avoid-hardcoded-build=
-paths-into-ppc-libgcc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0025-gcc-testsuite-tweaks-=
for-mips-OE.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0026-fix-pr90579-testcases=
.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0027-gcc15-pr122394.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-mapper-localhost-migh=
t-not-be-known.patch \<br>
=C2=A0&quot;<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch b/meta=
/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch<br>
new file mode 100644<br>
index 0000000000..9ee371cef7<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch<br>
@@ -0,0 +1,88 @@<br>
+From e55dcff97708a4937dc4d8736b8b3074ebbff6f3 Mon Sep 17 00:00:00 2001<br>
+From: Jakub Jelinek &lt;<a href=3D"mailto:jakub@redhat.com" target=3D"_bla=
nk">jakub@redhat.com</a>&gt;<br>
+Date: Mon, 27 Oct 2025 17:43:17 +0100<br>
+Subject: phiopt: Fix up DEBUG_EXPR_DECL creation in spaceship_replacement<=
br>
+ [PR122394]<br>
+<br>
+The following testcase ICEs in gcc 15 (and is at least latent in 12-14 too=
),<br>
+because the DEBUG_EXPR_DECL has incorrect mode.=C2=A0 It has<br>
+TREE_TYPE (orig_use_lhs) type, but TYPE_MODE (type) rather than<br>
+TYPE_MODE (TREE_TYPE (orig_use_lhs)) where the two types are sometimes<br>
+the same, but sometimes different (same if !has_cast_debug_uses, different=
<br>
+otherwise).<br>
+<br>
+Though, there wouldn&#39;t be the this issue if it used the proper API to =
create<br>
+the DEBUG_EXPR_DECL which takes care of everything.=C2=A0 This is the sole=
<br>
+spot that doesn&#39;t use that API.<br>
+<br>
+Doesn&#39;t affect the trunk because the code has been removed and replace=
d with<br>
+different stuff after the libstdc++ ABI change in r16-3474.<br>
+Before r15-5557 the mode has been always wrong because this was done only<=
br>
+for has_cast_debug_uses.=C2=A0 And the bug has been introduced with r12-54=
90.<br>
+<br>
+Enough archeology, while it could be fixed by changing the second<br>
+SET_DECL_MODE argument, I think it is better to use build_debug_expr_decl.=
<br>
+<br>
+2025-10-27=C2=A0 Jakub Jelinek=C2=A0 &lt;<a href=3D"mailto:jakub@redhat.co=
m" target=3D"_blank">jakub@redhat.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR tree-optimization/122394<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* tree-ssa-phiopt.cc (spaceship_replacement): U=
se<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0build_debug_expr_decl instead of manually build=
ing DEBUG_EXPR_DECL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0and getting SET_DECL_MODE wrong.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* g++.dg/opt/pr122394.C: New test.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/cgit/gcc/commit/=
?id=3De55dcff97708a4937dc4d8736b8b3074ebbff6f3" rel=3D"noreferrer" target=
=3D"_blank">https://gcc.gnu.org/cgit/gcc/commit/?id=3De55dcff97708a4937dc4d=
8736b8b3074ebbff6f3</a>]<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ gcc/testsuite/g++.dg/opt/pr122394.C | 20 ++++++++++++++++++++<br>
+ gcc/tree-ssa-phiopt.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 6 ++----<br>
+ 2 files changed, 22 insertions(+), 4 deletions(-)<br>
+ create mode 100644 gcc/testsuite/g++.dg/opt/pr122394.C<br>
+<br>
+diff --git a/gcc/testsuite/g++.dg/opt/pr122394.C b/gcc/testsuite/g++.dg/op=
t/pr122394.C<br>
+new file mode 100644<br>
+index 000000000000..1f84bebd74c2<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/g++.dg/opt/pr122394.C<br>
+@@ -0,0 +1,20 @@<br>
++// PR tree-optimization/122394<br>
++// { dg-do compile { target c++23 } }<br>
++// { dg-options &quot;-O1 -g&quot; }<br>
++<br>
++#include &lt;compare&gt;<br>
++<br>
++struct A {<br>
++=C2=A0 friend auto operator&lt;=3D&gt; (A, A) =3D default;<br>
++=C2=A0 double a;<br>
++};<br>
++void foo ();<br>
++A b, c;<br>
++<br>
++void<br>
++bar ()<br>
++{<br>
++=C2=A0 bool d =3D c &gt;=3D b;<br>
++=C2=A0 if (d)<br>
++=C2=A0 =C2=A0 foo ();<br>
++}<br>
+diff --git a/gcc/tree-ssa-phiopt.cc b/gcc/tree-ssa-phiopt.cc<br>
+index aaebae6b38c0..3e0ad9d3bb09 100644<br>
+--- a/gcc/tree-ssa-phiopt.cc<br>
++++ b/gcc/tree-ssa-phiopt.cc<br>
+@@ -2995,10 +2995,8 @@ spaceship_replacement (basic_block cond_bb, basic_b=
lock middle_bb,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (has_cast_debug_uses<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (HONOR_NA=
NS (TREE_TYPE (lhs1)) &amp;&amp; !is_cast))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tree temp3 =3D ma=
ke_node (DEBUG_EXPR_DECL);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DECL_ARTIFICIAL (=
temp3) =3D 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TREE_TYPE (temp3)=
 =3D TREE_TYPE (orig_use_lhs);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SET_DECL_MODE (te=
mp3, TYPE_MODE (type));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tree temp3<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D build_=
debug_expr_decl (TREE_TYPE (orig_use_lhs));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (has_cast=
_debug_uses)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t =3D=
 fold_convert (TREE_TYPE (temp3), temp2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-- <br>
+cgit <br>
+<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228000): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228000" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/228000</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116823455/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116823455/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d9a1e806464ec24e--

