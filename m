Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF9CC433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 10:43:44 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web10.7013.1641465823727092755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 02:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TU9DuyJK;
 spf=pass (domain: gmail.com, ip: 209.85.221.181,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id h5so1376067vkp.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 02:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s0U5hrkr8naRztkGPF3rI/cFFmi0CFveoXzj23R4fD0=;
        b=TU9DuyJKtuWEWIQ+eCLysBwFpn1+F5SXNTCFKjUrbOcLFX/oH3djrbfe6UVPdLRwb+
         zVe6paHO1AjjY2haivKDx+teGYsJjm7LyldQHcIKlPXeM50+Irgeyq9lduqvYXbtpsMH
         95e8G0yGIpSGSWfPxxDrXIw42Xp3Twov/pXKQqOH6ihJKZYkYEfoKwE8EDdQCHAksfNC
         Womd9aVZipgsE8UXh1nvAsg6aAxGn0r3KWR23GW+K0DjO7m1cUURy6brN7nVMbayb4Ka
         ZwBx/Ql2x11yH8j82BthkQYR2W5IIxqWYNTeGu0JjG063Emh+MU/I9K/P+A0v0zPIasD
         Xr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s0U5hrkr8naRztkGPF3rI/cFFmi0CFveoXzj23R4fD0=;
        b=e6KwYh++2Ks2oiBi30qIZoshNN9y0W2L/lC0I5XQ8hewSc9igdA2OtCBSKkCoY5yHw
         BdlqG5LlzmcuAzYHEWCRjA01IKE7lvoi5j9O0XP/QP4cOXc2Q+kHDfQBlaeqSR+9AiSI
         Jr1OCfO28896gsBtWpLnmj4VR2qzN1rhxt+qW67+Hqod/kuZzps+i2EPNNF2CYiCaIWG
         4+wyoiNdQ2QqjevX9YUAtX5k76+5e3BvwPO7/vpJj/9P6Cl+o5WRr6Wn+D9vbvd5NcRd
         utP5vSVvguHzvvvPoWkBmo4IJF02XToyXlPMi2+QrLWjATK3PcOKfZggjgkmAtNcS2ib
         o4jw==
X-Gm-Message-State: AOAM532+Mt/90cRVewgODFPQyeD20bLxb6psEVOF94gWw4UO2p00WZMt
	aaudxTnxRDgBEa9Vy0rckeOxbVOci/+yC3ZjAb8HP0Wgb0I=
X-Google-Smtp-Source: 
 ABdhPJwUEB7G+A1P/7R/MHmFcNS6akM+/B0jKJnR4gvH9cGzQXx4cMkprToasdUmSpikvyhQMyRLAZxt+PQ9DRyFurE=
X-Received: by 2002:a05:6122:8ca:: with SMTP id
 10mr20812212vkg.11.1641465821614;
 Thu, 06 Jan 2022 02:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20211225143244.182974-1-pgowda.cve@gmail.com>
In-Reply-To: <20211225143244.182974-1-pgowda.cve@gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Thu, 6 Jan 2022 16:13:31 +0530
Message-ID: 
 <CALY4984hO52H0V5HLS5f33pGjPG1d41gjTPDGgaaZm=stos2BQ@mail.gmail.com>
Subject: Re: [PATCH v3] gcc: Fix CVE-2021-42574 testcase
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <rwmacleod@gmail.com>,
	umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 10:43:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160227

Hi,

Gentle ping on this patch.

The patch modifies the testcases in UTF-8 format to execute as expected.

Thanks,
Pgowda

On Sat, Dec 25, 2021 at 8:02 PM pgowda <pgowda.cve@gmail.com> wrote:
>
> Modify the testcases properly to generate expected output.
>
> Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git=
;h=3D51c500269bf53749b107807d84271385fad35628]
> Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git=
;h=3Dbef32d4a28595e933f24fef378cf052a30b674a7]
>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>  .../gcc/gcc/0002-CVE-2021-42574.patch         | 536 ++++++++----------
>  .../gcc/gcc/0004-CVE-2021-42574.patch         |  20 +-
>  2 files changed, 258 insertions(+), 298 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch b/me=
ta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
> index 9bad81d4d0..d40735621a 100644
> --- a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
> @@ -142,9 +142,8 @@ Signed-off-by: Pgowda <pgowda.cve@gmail.com>
>   create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-9.c
>
>  diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> -index 8a4cd634f77..3976fc368db 100644
> ---- a/gcc/c-family/c.opt
> -+++ b/gcc/c-family/c.opt
> +--- a/gcc/c-family/c.opt       2021-12-24 20:36:18.424153360 -0800
> ++++ b/gcc/c-family/c.opt       2021-12-24 20:52:31.835651314 -0800
>  @@ -370,6 +370,30 @@ Wbad-function-cast
>   C ObjC Var(warn_bad_function_cast) Warning
>   Warn about casting functions to incompatible types.
> @@ -177,9 +176,8 @@ index 8a4cd634f77..3976fc368db 100644
>   C ObjC C++ ObjC++ Var(warn_bool_compare) Warning LangEnabledBy(C ObjC C=
++ ObjC++,Wall)
>   Warn about boolean expression compared with an integer value different =
from true/false.
>  diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> -index 6070288856c..a22758d18ee 100644
> ---- a/gcc/doc/invoke.texi
> -+++ b/gcc/doc/invoke.texi
> +--- a/gcc/doc/invoke.texi      2021-12-24 20:36:21.264105609 -0800
> ++++ b/gcc/doc/invoke.texi      2021-12-24 20:52:31.843651178 -0800
>  @@ -326,7 +326,9 @@ Objective-C and Objective-C++ Dialects}.
>   -Warith-conversion @gol
>   -Warray-bounds  -Warray-bounds=3D@var{n} @gol
> @@ -216,17 +214,15 @@ index 6070288856c..a22758d18ee 100644
>   @opindex Wno-bool-compare
>   @opindex Wbool-compare
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-10.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-10.c
> -new file mode 100644
> -index 00000000000..34f5ac19271
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-10.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-10.c      1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-10.c      2021-12-24 20:53:=
10.051000540 -0800
>  @@ -0,0 +1,27 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
>  +/* { dg-options "-Wbidi-chars=3Dunpaired" } */
>  +/* More nesting testing.  */
>  +
> -+/* RLE=C3=A2=C2=AB LRI=C3=A2=C2=A6 PDF=C3=A2=C2=AC PDI=C3=A2=C2=A9*/
> ++/* RLE=E2=80=AB LRI=E2=81=A6 PDF=E2=80=AC PDI=E2=81=A9*/
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +int LRE_\u202a_PDF_\u202c;
>  +int LRE_\u202a_PDF_\u202c_LRE_\u202a_PDF_\u202c;
> @@ -249,75 +245,69 @@ index 00000000000..34f5ac19271
>  +int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_FSI_\u2068_PDI_\u2069_P=
DI_\u2069_PDI_\u2069_PDI_\u2069;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-11.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-11.c
> -new file mode 100644
> -index 00000000000..270ce2368a9
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-11.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-11.c      1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-11.c      2021-12-24 20:53:=
10.562991821 -0800
>  @@ -0,0 +1,13 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
>  +/* { dg-options "-Wbidi-chars=3Dunpaired" } */
>  +/* Test that we warn when mixing UCN and UTF-8.  */
>  +
> -+int LRE_=C3=A2=C2=AA_PDF_\u202c;
> ++int LRE_=E2=80=AA_PDF_\u202c;
>  +/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> -+int LRE_\u202a_PDF_=C3=A2=C2=AC_;
> ++int LRE_\u202a_PDF_=E2=80=AC_;
>  +/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> -+const char *s1 =3D "LRE_=C3=A2=C2=AA_PDF_\u202c";
> ++const char *s1 =3D "LRE_=E2=80=AA_PDF_\u202c";
>  +/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> -+const char *s2 =3D "LRE_\u202a_PDF_=C3=A2=C2=AC";
> ++const char *s2 =3D "LRE_\u202a_PDF_=E2=80=AC";
>  +/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-12.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-12.c
> -new file mode 100644
> -index 00000000000..b07eec1da91
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-12.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-12.c      1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-12.c      2021-12-24 20:53:=
10.890986236 -0800
>  @@ -0,0 +1,19 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile { target { c || c++11 } } } */
>  +/* { dg-options "-Wbidi-chars=3Dany" } */
>  +/* Test raw strings.  */
>  +
> -+const char *s1 =3D R"(a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z=
)";
> ++const char *s1 =3D R"(a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z)";
>  +/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+const char *s2 =3D R"(a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z=
)";
> ++const char *s2 =3D R"(a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z)";
>  +/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+const char *s3 =3D R"(a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z=
)";
> ++const char *s3 =3D R"(a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z)";
>  +/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+const char *s4 =3D R"(a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z=
)";
> ++const char *s4 =3D R"(a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z)";
>  +/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+const char *s7 =3D R"(a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y) =
z";
> ++const char *s7 =3D R"(a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y) z";
>  +/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> -+const char *s8 =3D R"(a b c PDI=C3=A2=C2=A9 x y )z";
> ++const char *s8 =3D R"(a b c PDI=E2=81=A9 x y )z";
>  +/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> -+const char *s9 =3D R"(a b c PDF=C3=A2=C2=AC x y z)";
> ++const char *s9 =3D R"(a b c PDF=E2=80=AC x y z)";
>  +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> -diff -uprN '-x*.orig' '-x*.rej' del/gcc-11.2.0/gcc/testsuite/c-c++-commo=
n/Wbidi-chars-13.c gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c
> ---- del/gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c 1969-12-3=
1 16:00:00.000000000 -0800
> -+++ gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c     2021-12-1=
3 23:11:22.328439287 -0800
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-13.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-13.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-13.c      1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-13.c      2021-12-24 20:53:=
11.190981126 -0800
>  @@ -0,0 +1,17 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile { target { c || c++11 } } } */
>  +/* { dg-options "-Wbidi-chars=3Dunpaired" } */
>  +/* Test raw strings.  */
>  +
> -+const char *s1 =3D R"(a b c LRE=C3=A2=C2=AA 1 2 3)";
> ++const char *s1 =3D R"(a b c LRE=E2=80=AA 1 2 3)";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s2 =3D R"(a b c RLE=C3=A2=C2=AB 1 2 3)";
> ++const char *s2 =3D R"(a b c RLE=E2=80=AB 1 2 3)";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s3 =3D R"(a b c LRO=C3=A2=C2=AD 1 2 3)";
> ++const char *s3 =3D R"(a b c LRO=E2=80=AD 1 2 3)";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s4 =3D R"(a b c FSI=C3=A2=C2=A8 1 2 3)";
> ++const char *s4 =3D R"(a b c FSI=E2=81=A8 1 2 3)";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s5 =3D R"(a b c LRI=C3=A2=C2=A6 1 2 3)";
> ++const char *s5 =3D R"(a b c LRI=E2=81=A6 1 2 3)";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s6 =3D R"(a b c RLI=C3=A2=C2=A7 1 2 3)";
> ++const char *s6 =3D R"(a b c RLI=E2=81=A7 1 2 3)";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-14.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-14.c
> -new file mode 100644
> -index 00000000000..ba5f75d9553
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-14.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-14.c      1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-14.c      2021-12-24 20:53:=
11.482976153 -0800
>  @@ -0,0 +1,38 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
> @@ -325,13 +315,13 @@ index 00000000000..ba5f75d9553
>  +/* Test PDI handling, which also pops any subsequent LREs, RLEs, LROs,
>  +   or RLOs.  */
>  +
> -+/* LRI_=C3=A2=C2=A6_LRI_=C3=A2=C2=A6_RLE_=C3=A2=C2=AB_RLE_=C3=A2=C2=AB_=
RLE_=C3=A2=C2=AB_PDI_=C3=A2=C2=A9*/
> ++/* LRI_=E2=81=A6_LRI_=E2=81=A6_RLE_=E2=80=AB_RLE_=E2=80=AB_RLE_=E2=80=
=AB_PDI_=E2=81=A9*/
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// LRI_=C3=A2=C2=A6_RLE_=C3=A2=C2=AB_RLE_=C3=A2=C2=AB_RLE_=C3=A2=C2=AB_=
PDI_=C3=A2=C2=A9
> -+// LRI_=C3=A2=C2=A6_RLO_=C3=A2=C2=AE_RLE_=C3=A2=C2=AB_RLE_=C3=A2=C2=AB_=
PDI_=C3=A2=C2=A9
> -+// LRI_=C3=A2=C2=A6_RLO_=C3=A2=C2=AE_RLE_=C3=A2=C2=AB_PDI_=C3=A2=C2=A9
> -+// FSI_=C3=A2=C2=A8_RLO_=C3=A2=C2=AE_PDI_=C3=A2=C2=A9
> -+// FSI_=C3=A2=C2=A8_FSI_=C3=A2=C2=A8_RLO_=C3=A2=C2=AE_PDI_=C3=A2=C2=A9
> ++// LRI_=E2=81=A6_RLE_=E2=80=AB_RLE_=E2=80=AB_RLE_=E2=80=AB_PDI_=E2=81=
=A9
> ++// LRI_=E2=81=A6_RLO_=E2=80=AE_RLE_=E2=80=AB_RLE_=E2=80=AB_PDI_=E2=81=
=A9
> ++// LRI_=E2=81=A6_RLO_=E2=80=AE_RLE_=E2=80=AB_PDI_=E2=81=A9
> ++// FSI_=E2=81=A8_RLO_=E2=80=AE_PDI_=E2=81=A9
> ++// FSI_=E2=81=A8_FSI_=E2=81=A8_RLO_=E2=80=AE_PDI_=E2=81=A9
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +
>  +int LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069;
> @@ -358,10 +348,8 @@ index 00000000000..ba5f75d9553
>  +int FSI_\u2068_FSI_\u2068_PDF_\u202c_PDI_\u2069;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-15.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-15.c
> -new file mode 100644
> -index 00000000000..a0ce8ff5e2c
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-15.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-15.c      1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-15.c      2021-12-24 20:53:=
11.738971793 -0800
>  @@ -0,0 +1,59 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
> @@ -369,182 +357,170 @@ index 00000000000..a0ce8ff5e2c
>  +/* Test unpaired bidi control chars in multiline comments.  */
>  +
>  +/*
> -+ * LRE=C3=A2=C2=AA end
> ++ * LRE=E2=80=AA end
>  + */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
>  +/*
> -+ * RLE=C3=A2=C2=AB end
> ++ * RLE=E2=80=AB end
>  + */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
>  +/*
> -+ * LRO=C3=A2=C2=AD end
> ++ * LRO=E2=80=AD end
>  + */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
>  +/*
> -+ * RLO=C3=A2=C2=AE end
> ++ * RLO=E2=80=AE end
>  + */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
>  +/*
> -+ * LRI=C3=A2=C2=A6 end
> ++ * LRI=E2=81=A6 end
>  + */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
>  +/*
> -+ * RLI=C3=A2=C2=A7 end
> ++ * RLI=E2=81=A7 end
>  + */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
>  +/*
> -+ * FSI=C3=A2=C2=A8 end
> ++ * FSI=E2=81=A8 end
>  + */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+/* LRE=C3=A2=C2=AA
> -+   PDF=C3=A2=C2=AC */
> ++/* LRE=E2=80=AA
> ++   PDF=E2=80=AC */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> -+/* FSI=C3=A2=C2=A8
> -+   PDI=C3=A2=C2=A9 */
> ++/* FSI=E2=81=A8
> ++   PDI=E2=81=A9 */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
>  +
> -+/* LRE<=C3=A2=C2=AA>
> ++/* LRE<=E2=80=AA>
>  + *
>  + */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-3 } */
>  +
>  +/*
> -+ * LRE<=C3=A2=C2=AA>
> ++ * LRE<=E2=80=AA>
>  + */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
>  +
>  +/*
>  + *
> -+ * LRE<=C3=A2=C2=AA> */
> ++ * LRE<=E2=80=AA> */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +
> -+/* RLI<=C3=A2=C2=A7> */ /* PDI<=C3=A2=C2=A9> */
> ++/* RLI<=E2=81=A7> */ /* PDI<=E2=81=A9> */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* LRE<=C3=A2=C2=AA> */ /* PDF<=C3=A2=C2=AC> */
> ++/* LRE<=E2=80=AA> */ /* PDF<=E2=80=AC> */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-16.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-16.c
> -new file mode 100644
> -index 00000000000..baa0159861c
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-16.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-16.c      1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-16.c      2021-12-24 20:53:=
11.998967366 -0800
>  @@ -0,0 +1,26 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
>  +/* { dg-options "-Wbidi-chars=3Dany" } */
>  +/* Test LTR/RTL chars.  */
>  +
> -+/* LTR<=C3=A2> */
> ++/* LTR<=E2=80=8E> */
>  +/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> -+// LTR<=C3=A2>
> ++// LTR<=E2=80=8E>
>  +/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> -+/* RTL<=C3=A2> */
> ++/* RTL<=E2=80=8F> */
>  +/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
> -+// RTL<=C3=A2>
> ++// RTL<=E2=80=8F>
>  +/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
>  +
> -+const char *s1 =3D "LTR<=C3=A2>";
> ++const char *s1 =3D "LTR<=E2=80=8E>";
>  +/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
>  +const char *s2 =3D "LTR\u200e";
>  +/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
>  +const char *s3 =3D "LTR\u200E";
>  +/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> -+const char *s4 =3D "RTL<=C3=A2>";
> ++const char *s4 =3D "RTL<=E2=80=8F>";
>  +/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
>  +const char *s5 =3D "RTL\u200f";
>  +/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
>  +const char *s6 =3D "RTL\u200F";
>  +/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-17.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-17.c
> -new file mode 100644
> -index 00000000000..07cb4321f96
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-17.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-17.c      1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-17.c      2021-12-24 20:53:=
12.286962462 -0800
>  @@ -0,0 +1,30 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
>  +/* { dg-options "-Wbidi-chars=3Dunpaired" } */
>  +/* Test LTR/RTL chars.  */
>  +
> -+/* LTR<=C3=A2> */
> ++/* LTR<=E2=80=8E> */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// LTR<=C3=A2>
> ++// LTR<=E2=80=8E>
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* RTL<=C3=A2> */
> ++/* RTL<=E2=80=8F> */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// RTL<=C3=A2>
> ++// RTL<=E2=80=8F>
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  +int ltr_\u200e;
>  +/* { dg-error "universal character " "" { target *-*-* } .-1 } */
>  +int rtl_\u200f;
>  +/* { dg-error "universal character " "" { target *-*-* } .-1 } */
>  +
> -+const char *s1 =3D "LTR<=C3=A2>";
> ++const char *s1 =3D "LTR<=E2=80=8E>";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  +const char *s2 =3D "LTR\u200e";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  +const char *s3 =3D "LTR\u200E";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+const char *s4 =3D "RTL<=C3=A2>";
> ++const char *s4 =3D "RTL<=E2=80=8F>";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  +const char *s5 =3D "RTL\u200f";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  +const char *s6 =3D "RTL\u200F";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-1.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-1.c
> -new file mode 100644
> -index 00000000000..2340374f276
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-1.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-1.c       1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-1.c       2021-12-24 20:53:=
12.518958510 -0800
>  @@ -0,0 +1,12 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
>  +
>  +int main() {
>  +    int isAdmin =3D 0;
> -+    /*=C3=A2=C2=AE } =C3=A2=C2=A6if (isAdmin)=C3=A2=C2=A9 =C3=A2=C2=A6 =
begin admins only */
> ++    /*=E2=80=AE } =E2=81=A6if (isAdmin)=E2=81=A9 =E2=81=A6 begin admins=
 only */
>  +/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
>  +        __builtin_printf("You are an admin.\n");
> -+    /* end admins only =C3=A2=C2=AE { =C3=A2=C2=A6*/
> ++    /* end admins only =E2=80=AE { =E2=81=A6*/
>  +/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
>  +    return 0;
>  +}
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-2.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-2.c
> -new file mode 100644
> -index 00000000000..2340374f276
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-2.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-2.c       1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-2.c       2021-12-24 20:53:=
12.778954082 -0800
>  @@ -0,0 +1,9 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
>  +
>  +int main() {
> -+    /* Say hello; newline=C3=A2=C2=A7/*/ return 0 ;
> ++    /* Say hello; newline=E2=81=A7/*/ return 0 ;
>  +/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
>  +    __builtin_printf("Hello world.\n");
>  +    return 0;
>  +}
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-3.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-3.c
> -new file mode 100644
> -index 00000000000..9dc7edb6e64
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-3.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-3.c       1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-3.c       2021-12-24 20:53:=
13.038949654 -0800
>  @@ -0,0 +1,11 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
>  +
>  +int main() {
>  +    const char* access_level =3D "user";
> -+    if (__builtin_strcmp(access_level, "user=C3=A2=C2=AE =C3=A2=C2=A6//=
 Check if admin=C3=A2=C2=A9 =C3=A2=C2=A6")) {
> ++    if (__builtin_strcmp(access_level, "user=E2=80=AE =E2=81=A6// Check=
 if admin=E2=81=A9 =E2=81=A6")) {
>  +/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
>  +        __builtin_printf("You are an admin.\n");
>  +    }
>  +    return 0;
>  +}
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-4.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-4.c
> -new file mode 100644
> -index 00000000000..639e5c62e88
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-4.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-4.c       1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-4.c       2021-12-24 20:53:=
13.382943796 -0800
>  @@ -0,0 +1,188 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
> @@ -553,89 +529,89 @@ index 00000000000..639e5c62e88
>  +   string literals, character constants), both UCN and UTF-8.  The bidi
>  +   chars here are properly terminated, except for the character constan=
ts.  */
>  +
> -+/* a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z */
>  +/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+/* a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z */
>  +/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+/* a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z */
>  +/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+/* a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z */
>  +/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+/* a b c LRI=C3=A2=C2=A6 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* a b c LRI=E2=81=A6 1 2 3 PDI=E2=81=A9 x y z */
>  +/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> -+/* a b c RLI=C3=A2=C2=A7 1 2 3 PDI=C3=A2=C2=A9 x y */
> ++/* a b c RLI=E2=81=A7 1 2 3 PDI=E2=81=A9 x y */
>  +/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> -+/* a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y z */
>  +/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
>  +
>  +/* Same but C++ comments instead.  */
> -+// a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z
> ++// a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z
>  +/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+// a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z
> ++// a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z
>  +/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+// a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z
> ++// a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z
>  +/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+// a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z
> ++// a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z
>  +/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+// a b c LRI=C3=A2=C2=A6 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++// a b c LRI=E2=81=A6 1 2 3 PDI=E2=81=A9 x y z
>  +/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> -+// a b c RLI=C3=A2=C2=A7 1 2 3 PDI=C3=A2=C2=A9 x y
> ++// a b c RLI=E2=81=A7 1 2 3 PDI=E2=81=A9 x y
>  +/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> -+// a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++// a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y z
>  +/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
>  +
>  +/* Here we're closing an unopened context, warn when =3Dany.  */
> -+/* a b c PDI=C3=A2=C2=A9 x y z */
> ++/* a b c PDI=E2=81=A9 x y z */
>  +/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> -+/* a b c PDF=C3=A2=C2=AC x y z */
> ++/* a b c PDF=E2=80=AC x y z */
>  +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> -+// a b c PDI=C3=A2=C2=A9 x y z
> ++// a b c PDI=E2=81=A9 x y z
>  +/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> -+// a b c PDF=C3=A2=C2=AC x y z
> ++// a b c PDF=E2=80=AC x y z
>  +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
>  +
>  +/* Multiline comments.  */
> -+/* a b c PDI=C3=A2=C2=A9 x y z
> ++/* a b c PDI=E2=81=A9 x y z
>  +   */
>  +/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
> -+/* a b c PDF=C3=A2=C2=AC x y z
> ++/* a b c PDF=E2=80=AC x y z
>  +   */
>  +/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
>  +/* first
> -+   a b c PDI=C3=A2=C2=A9 x y z
> ++   a b c PDI=E2=81=A9 x y z
>  +   */
>  +/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
>  +/* first
> -+   a b c PDF=C3=A2=C2=AC x y z
> ++   a b c PDF=E2=80=AC x y z
>  +   */
>  +/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
>  +/* first
> -+   a b c PDI=C3=A2=C2=A9 x y z */
> ++   a b c PDI=E2=81=A9 x y z */
>  +/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
>  +/* first
> -+   a b c PDF=C3=A2=C2=AC x y z */
> ++   a b c PDF=E2=80=AC x y z */
>  +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
>  +
>  +void
>  +g1 ()
>  +{
> -+  const char *s1 =3D "a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++  const char *s1 =3D "a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z";
>  +/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+  const char *s2 =3D "a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++  const char *s2 =3D "a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z";
>  +/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+  const char *s3 =3D "a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++  const char *s3 =3D "a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z";
>  +/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+  const char *s4 =3D "a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++  const char *s4 =3D "a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z";
>  +/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+  const char *s5 =3D "a b c LRI=C3=A2=C2=A6 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++  const char *s5 =3D "a b c LRI=E2=81=A6 1 2 3 PDI=E2=81=A9 x y z";
>  +/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> -+  const char *s6 =3D "a b c RLI=C3=A2=C2=A7 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++  const char *s6 =3D "a b c RLI=E2=81=A7 1 2 3 PDI=E2=81=A9 x y z";
>  +/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> -+  const char *s7 =3D "a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++  const char *s7 =3D "a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y z";
>  +/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> -+  const char *s8 =3D "a b c PDI=C3=A2=C2=A9 x y z";
> ++  const char *s8 =3D "a b c PDI=E2=81=A9 x y z";
>  +/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> -+  const char *s9 =3D "a b c PDF=C3=A2=C2=AC x y z";
> ++  const char *s9 =3D "a b c PDF=E2=80=AC x y z";
>  +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
>  +
>  +  const char *s10 =3D "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
> @@ -689,21 +665,21 @@ index 00000000000..639e5c62e88
>  +/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
>  +}
>  +
> -+int a=C3=A2=C2=AAb=C3=A2=C2=ACc;
> ++int a=E2=80=AAb=E2=80=ACc;
>  +/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> -+int a=C3=A2=C2=ABb=C3=A2=C2=ACc;
> ++int a=E2=80=ABb=E2=80=ACc;
>  +/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> -+int a=C3=A2=C2=ADb=C3=A2=C2=ACc;
> ++int a=E2=80=ADb=E2=80=ACc;
>  +/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> -+int a=C3=A2=C2=AEb=C3=A2=C2=ACc;
> ++int a=E2=80=AEb=E2=80=ACc;
>  +/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> -+int a=C3=A2=C2=A6b=C3=A2=C2=A9c;
> ++int a=E2=81=A6b=E2=81=A9c;
>  +/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> -+int a=C3=A2=C2=A7b=C3=A2=C2=A9c;
> ++int a=E2=81=A7b=E2=81=A9c;
>  +/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> -+int a=C3=A2=C2=A8b=C3=A2=C2=A9c;
> ++int a=E2=81=A8b=E2=81=A9c;
>  +/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> -+int A=C3=A2=C2=ACX;
> ++int A=E2=80=ACX;
>  +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
>  +int A\u202cY;
>  +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> @@ -735,10 +711,8 @@ index 00000000000..639e5c62e88
>  +int X\u2069;
>  +/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-5.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-5.c
> -new file mode 100644
> -index 00000000000..68cb053144b
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-5.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-5.c       1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-5.c       2021-12-24 20:53:=
14.370926970 -0800
>  @@ -0,0 +1,188 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
> @@ -747,89 +721,89 @@ index 00000000000..68cb053144b
>  +   string literals, character constants), both UCN and UTF-8.  The bidi
>  +   chars here are properly terminated, except for the character constan=
ts.  */
>  +
> -+/* a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c LRI=C3=A2=C2=A6 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* a b c LRI=E2=81=A6 1 2 3 PDI=E2=81=A9 x y z */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c RLI=C3=A2=C2=A7 1 2 3 PDI=C3=A2=C2=A9 x y */
> ++/* a b c RLI=E2=81=A7 1 2 3 PDI=E2=81=A9 x y */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y z */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  +
>  +/* Same but C++ comments instead.  */
> -+// a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z
> ++// a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z
> ++// a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z
> ++// a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z
> ++// a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c LRI=C3=A2=C2=A6 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++// a b c LRI=E2=81=A6 1 2 3 PDI=E2=81=A9 x y z
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c RLI=C3=A2=C2=A7 1 2 3 PDI=C3=A2=C2=A9 x y
> ++// a b c RLI=E2=81=A7 1 2 3 PDI=E2=81=A9 x y
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++// a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y z
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  +
>  +/* Here we're closing an unopened context, warn when =3Dany.  */
> -+/* a b c PDI=C3=A2=C2=A9 x y z */
> ++/* a b c PDI=E2=81=A9 x y z */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c PDF=C3=A2=C2=AC x y z */
> ++/* a b c PDF=E2=80=AC x y z */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c PDI=C3=A2=C2=A9 x y z
> ++// a b c PDI=E2=81=A9 x y z
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c PDF=C3=A2=C2=AC x y z
> ++// a b c PDF=E2=80=AC x y z
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  +
>  +/* Multiline comments.  */
> -+/* a b c PDI=C3=A2=C2=A9 x y z
> ++/* a b c PDI=E2=81=A9 x y z
>  +   */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
> -+/* a b c PDF=C3=A2=C2=AC x y z
> ++/* a b c PDF=E2=80=AC x y z
>  +   */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
>  +/* first
> -+   a b c PDI=C3=A2=C2=A9 x y z
> ++   a b c PDI=E2=81=A9 x y z
>  +   */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
>  +/* first
> -+   a b c PDF=C3=A2=C2=AC x y z
> ++   a b c PDF=E2=80=AC x y z
>  +   */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
>  +/* first
> -+   a b c PDI=C3=A2=C2=A9 x y z */
> ++   a b c PDI=E2=81=A9 x y z */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  +/* first
> -+   a b c PDF=C3=A2=C2=AC x y z */
> ++   a b c PDF=E2=80=AC x y z */
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  +
>  +void
>  +g1 ()
>  +{
> -+  const char *s1 =3D "a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++  const char *s1 =3D "a b c LRE=E2=80=AA 1 2 3 PDF=E2=80=AC x y z";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s2 =3D "a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++  const char *s2 =3D "a b c RLE=E2=80=AB 1 2 3 PDF=E2=80=AC x y z";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s3 =3D "a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++  const char *s3 =3D "a b c LRO=E2=80=AD 1 2 3 PDF=E2=80=AC x y z";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s4 =3D "a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++  const char *s4 =3D "a b c RLO=E2=80=AE 1 2 3 PDF=E2=80=AC x y z";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s5 =3D "a b c LRI=C3=A2=C2=A6 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++  const char *s5 =3D "a b c LRI=E2=81=A6 1 2 3 PDI=E2=81=A9 x y z";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s6 =3D "a b c RLI=C3=A2=C2=A7 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++  const char *s6 =3D "a b c RLI=E2=81=A7 1 2 3 PDI=E2=81=A9 x y z";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s7 =3D "a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++  const char *s7 =3D "a b c FSI=E2=81=A8 1 2 3 PDI=E2=81=A9 x y z";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s8 =3D "a b c PDI=C3=A2=C2=A9 x y z";
> ++  const char *s8 =3D "a b c PDI=E2=81=A9 x y z";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s9 =3D "a b c PDF=C3=A2=C2=AC x y z";
> ++  const char *s9 =3D "a b c PDF=E2=80=AC x y z";
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  +
>  +  const char *s10 =3D "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
> @@ -883,21 +857,21 @@ index 00000000000..68cb053144b
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +}
>  +
> -+int a=C3=A2=C2=AAb=C3=A2=C2=ACc;
> ++int a=E2=80=AAb=E2=80=ACc;
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int a=C3=A2=C2=ABb=C3=A2=C2=ACc;
> ++int a=E2=80=ABb=E2=80=ACc;
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int a=C3=A2=C2=ADb=C3=A2=C2=ACc;
> ++int a=E2=80=ADb=E2=80=ACc;
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int a=C3=A2=C2=AEb=C3=A2=C2=ACc;
> ++int a=E2=80=AEb=E2=80=ACc;
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int a=C3=A2=C2=A6b=C3=A2=C2=A9c;
> ++int a=E2=81=A6b=E2=81=A9c;
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int a=C3=A2=C2=A7b=C3=A2=C2=A9c;
> ++int a=E2=81=A7b=E2=81=A9c;
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int a=C3=A2=C2=A8b=C3=A2=C2=A9c;
> ++int a=E2=81=A8b=E2=81=A9c;
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> -+int A=C3=A2=C2=ACX;
> ++int A=E2=80=ACX;
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  +int A\u202cY;
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> @@ -929,10 +903,8 @@ index 00000000000..68cb053144b
>  +int X\u2069;
>  +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-6.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-6.c
> -new file mode 100644
> -index 00000000000..0ce6fff2dee
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-6.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-6.c       1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-6.c       2021-12-24 20:53:=
14.770920157 -0800
>  @@ -0,0 +1,155 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
> @@ -940,160 +912,158 @@ index 00000000000..0ce6fff2dee
>  +/* Test nesting of bidi chars in various contexts.  */
>  +
>  +/* Terminated by the wrong char:  */
> -+/* a b c LRE=C3=A2=C2=AA 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* a b c LRE=E2=80=AA 1 2 3 PDI=E2=81=A9 x y z */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c RLE=C3=A2=C2=AB 1 2 3 PDI=C3=A2=C2=A9 x y  z*/
> ++/* a b c RLE=E2=80=AB 1 2 3 PDI=E2=81=A9 x y  z*/
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c LRO=C3=A2=C2=AD 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* a b c LRO=E2=80=AD 1 2 3 PDI=E2=81=A9 x y z */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c RLO=C3=A2=C2=AE 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* a b c RLO=E2=80=AE 1 2 3 PDI=E2=81=A9 x y z */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c LRI=C3=A2=C2=A6 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* a b c LRI=E2=81=A6 1 2 3 PDF=E2=80=AC x y z */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c RLI=C3=A2=C2=A7 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* a b c RLI=E2=81=A7 1 2 3 PDF=E2=80=AC x y z */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* a b c FSI=C3=A2=C2=A8 1 2 3 PDF=C3=A2=C2=AC x y  z*/
> ++/* a b c FSI=E2=81=A8 1 2 3 PDF=E2=80=AC x y  z*/
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +
> -+/* LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC */
> -+/* LRE=C3=A2=C2=AA LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC PDF=C3=A2=C2=AC */
> -+/* PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC */
> -+/* LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC */
> -+/* LRE=C3=A2=C2=AA LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC */
> ++/* LRE=E2=80=AA PDF=E2=80=AC */
> ++/* LRE=E2=80=AA LRE=E2=80=AA PDF=E2=80=AC PDF=E2=80=AC */
> ++/* PDF=E2=80=AC LRE=E2=80=AA PDF=E2=80=AC */
> ++/* LRE=E2=80=AA PDF=E2=80=AC LRE=E2=80=AA PDF=E2=80=AC */
> ++/* LRE=E2=80=AA LRE=E2=80=AA PDF=E2=80=AC */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA */
> ++/* PDF=E2=80=AC LRE=E2=80=AA */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +
> -+// a b c LRE=C3=A2=C2=AA 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++// a b c LRE=E2=80=AA 1 2 3 PDI=E2=81=A9 x y z
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c RLE=C3=A2=C2=AB 1 2 3 PDI=C3=A2=C2=A9 x y  z*/
> ++// a b c RLE=E2=80=AB 1 2 3 PDI=E2=81=A9 x y  z*/
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c LRO=C3=A2=C2=AD 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++// a b c LRO=E2=80=AD 1 2 3 PDI=E2=81=A9 x y z
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c RLO=C3=A2=C2=AE 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++// a b c RLO=E2=80=AE 1 2 3 PDI=E2=81=A9 x y z
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c LRI=C3=A2=C2=A6 1 2 3 PDF=C3=A2=C2=AC x y z
> ++// a b c LRI=E2=81=A6 1 2 3 PDF=E2=80=AC x y z
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c RLI=C3=A2=C2=A7 1 2 3 PDF=C3=A2=C2=AC x y z
> ++// a b c RLI=E2=81=A7 1 2 3 PDF=E2=80=AC x y z
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// a b c FSI=C3=A2=C2=A8 1 2 3 PDF=C3=A2=C2=AC x y  z
> ++// a b c FSI=E2=81=A8 1 2 3 PDF=E2=80=AC x y  z
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +
> -+// LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC
> -+// LRE=C3=A2=C2=AA LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC PDF=C3=A2=C2=AC
> -+// PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC
> -+// LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC
> -+// LRE=C3=A2=C2=AA LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC
> ++// LRE=E2=80=AA PDF=E2=80=AC
> ++// LRE=E2=80=AA LRE=E2=80=AA PDF=E2=80=AC PDF=E2=80=AC
> ++// PDF=E2=80=AC LRE=E2=80=AA PDF=E2=80=AC
> ++// LRE=E2=80=AA PDF=E2=80=AC LRE=E2=80=AA PDF=E2=80=AC
> ++// LRE=E2=80=AA LRE=E2=80=AA PDF=E2=80=AC
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+// PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA
> ++// PDF=E2=80=AC LRE=E2=80=AA
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +
>  +void
>  +g1 ()
>  +{
> -+  const char *s1 =3D "a b c LRE=C3=A2=C2=AA 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++  const char *s1 =3D "a b c LRE=E2=80=AA 1 2 3 PDI=E2=81=A9 x y z";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +  const char *s2 =3D "a b c LRE\u202a 1 2 3 PDI\u2069 x y z";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s3 =3D "a b c RLE=C3=A2=C2=AB 1 2 3 PDI=C3=A2=C2=A9 x y "=
;
> ++  const char *s3 =3D "a b c RLE=E2=80=AB 1 2 3 PDI=E2=81=A9 x y ";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +  const char *s4 =3D "a b c RLE\u202b 1 2 3 PDI\u2069 x y z";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s5 =3D "a b c LRO=C3=A2=C2=AD 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++  const char *s5 =3D "a b c LRO=E2=80=AD 1 2 3 PDI=E2=81=A9 x y z";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +  const char *s6 =3D "a b c LRO\u202d 1 2 3 PDI\u2069 x y z";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s7 =3D "a b c RLO=C3=A2=C2=AE 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++  const char *s7 =3D "a b c RLO=E2=80=AE 1 2 3 PDI=E2=81=A9 x y z";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +  const char *s8 =3D "a b c RLO\u202e 1 2 3 PDI\u2069 x y z";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s9 =3D "a b c LRI=C3=A2=C2=A6 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++  const char *s9 =3D "a b c LRI=E2=81=A6 1 2 3 PDF=E2=80=AC x y z";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +  const char *s10 =3D "a b c LRI\u2066 1 2 3 PDF\u202c x y z";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s11 =3D "a b c RLI=C3=A2=C2=A7 1 2 3 PDF=C3=A2=C2=AC x y =
z\
> ++  const char *s11 =3D "a b c RLI=E2=81=A7 1 2 3 PDF=E2=80=AC x y z\
>  +    ";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
>  +  const char *s12 =3D "a b c RLI\u2067 1 2 3 PDF\u202c x y z";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s13 =3D "a b c FSI=C3=A2=C2=A8 1 2 3 PDF=C3=A2=C2=AC x y =
z";
> ++  const char *s13 =3D "a b c FSI=E2=81=A8 1 2 3 PDF=E2=80=AC x y z";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +  const char *s14 =3D "a b c FSI\u2068 1 2 3 PDF\u202c x y z";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s15 =3D "PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA";
> ++  const char *s15 =3D "PDF=E2=80=AC LRE=E2=80=AA";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +  const char *s16 =3D "PDF\u202c LRE\u202a";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s17 =3D "LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC";
> ++  const char *s17 =3D "LRE=E2=80=AA PDF=E2=80=AC";
>  +  const char *s18 =3D "LRE\u202a PDF\u202c";
> -+  const char *s19 =3D "LRE=C3=A2=C2=AA LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC =
PDF=C3=A2=C2=AC";
> ++  const char *s19 =3D "LRE=E2=80=AA LRE=E2=80=AA PDF=E2=80=AC PDF=E2=80=
=AC";
>  +  const char *s20 =3D "LRE\u202a LRE\u202a PDF\u202c PDF\u202c";
> -+  const char *s21 =3D "PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC"=
;
> ++  const char *s21 =3D "PDF=E2=80=AC LRE=E2=80=AA PDF=E2=80=AC";
>  +  const char *s22 =3D "PDF\u202c LRE\u202a PDF\u202c";
> -+  const char *s23 =3D "LRE=C3=A2=C2=AA LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC"=
;
> ++  const char *s23 =3D "LRE=E2=80=AA LRE=E2=80=AA PDF=E2=80=AC";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +  const char *s24 =3D "LRE\u202a LRE\u202a PDF\u202c";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s25 =3D "PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA";
> ++  const char *s25 =3D "PDF=E2=80=AC LRE=E2=80=AA";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +  const char *s26 =3D "PDF\u202c LRE\u202a";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s27 =3D "PDF=C3=A2=C2=AC LRE\u202a";
> ++  const char *s27 =3D "PDF=E2=80=AC LRE\u202a";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+  const char *s28 =3D "PDF\u202c LRE=C3=A2=C2=AA";
> ++  const char *s28 =3D "PDF\u202c LRE=E2=80=AA";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +}
>  +
> -+int aLRE=C3=A2=C2=AAbPDI=C3=A2=C2=A9;
> ++int aLRE=E2=80=AAbPDI=E2=81=A9;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +int A\u202aB\u2069C;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aRLE=C3=A2=C2=ABbPDI=C3=A2=C2=A9;
> ++int aRLE=E2=80=ABbPDI=E2=81=A9;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +int a\u202bB\u2069c;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aLRO=C3=A2=C2=ADbPDI=C3=A2=C2=A9;
> ++int aLRO=E2=80=ADbPDI=E2=81=A9;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +int a\u202db\u2069c2;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aRLO=C3=A2=C2=AEbPDI=C3=A2=C2=A9;
> ++int aRLO=E2=80=AEbPDI=E2=81=A9;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +int a\u202eb\u2069;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aLRI=C3=A2=C2=A6bPDF=C3=A2=C2=AC;
> ++int aLRI=E2=81=A6bPDF=E2=80=AC;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +int a\u2066b\u202c;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aRLI=C3=A2=C2=A7bPDF=C3=A2=C2=ACc
> ++int aRLI=E2=81=A7bPDF=E2=80=ACc
>  +;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
>  +int a\u2067b\u202c;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aFSI=C3=A2=C2=A8bPDF=C3=A2=C2=AC;
> ++int aFSI=E2=81=A8bPDF=E2=80=AC;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +int a\u2068b\u202c;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aFSI=C3=A2=C2=A8bPD\u202C;
> ++int aFSI=E2=81=A8bPD\u202C;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aFSI\u2068bPDF=C3=A2=C2=AC_;
> ++int aFSI\u2068bPDF=E2=80=AC_;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+int aLRE=C3=A2=C2=AAbPDF=C3=A2=C2=ACb;
> ++int aLRE=E2=80=AAbPDF=E2=80=ACb;
>  +int A\u202aB\u202c;
> -+int a_LRE=C3=A2=C2=AA_LRE=C3=A2=C2=AA_b_PDF=C3=A2=C2=AC_PDF=C3=A2=C2=AC=
;
> ++int a_LRE=E2=80=AA_LRE=E2=80=AA_b_PDF=E2=80=AC_PDF=E2=80=AC;
>  +int A\u202aA\u202aB\u202cB\u202c;
> -+int aPDF=C3=A2=C2=ACbLREadPDF=C3=A2=C2=AC;
> ++int aPDF=E2=80=ACbLREadPDF=E2=80=AC;
>  +int a_\u202C_\u202a_\u202c;
> -+int a_LRE=C3=A2=C2=AA_b_PDF=C3=A2=C2=AC_c_LRE=C3=A2=C2=AA_PDF=C3=A2=C2=
=AC;
> ++int a_LRE=E2=80=AA_b_PDF=E2=80=AC_c_LRE=E2=80=AA_PDF=E2=80=AC;
>  +int a_\u202a_\u202c_\u202a_\u202c_;
> -+int a_LRE=C3=A2=C2=AA_b_PDF=C3=A2=C2=AC_c_LRE=C3=A2=C2=AA;
> ++int a_LRE=E2=80=AA_b_PDF=E2=80=AC_c_LRE=E2=80=AA;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +int a_\u202a_\u202c_\u202a_;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-7.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-7.c
> -new file mode 100644
> -index 00000000000..d012d420ec0
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-7.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-7.c       1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-7.c       2021-12-24 20:53:=
15.070915048 -0800
>  @@ -0,0 +1,9 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
> @@ -1105,10 +1075,8 @@ index 00000000000..d012d420ec0
>  +/* a b c \u202a 1 2 3 */
>  +/* a b c \u202A 1 2 3 */
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-8.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-8.c
> -new file mode 100644
> -index 00000000000..4f54c5092ec
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-8.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-8.c       1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-8.c       2021-12-24 20:53:=
15.370909939 -0800
>  @@ -0,0 +1,13 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
> @@ -1124,10 +1092,8 @@ index 00000000000..4f54c5092ec
>  +int a_\U0000202a_4;
>  +/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-9.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-9.c
> -new file mode 100644
> -index 00000000000..e2af1b1ca97
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-9.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-9.c       1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-9.c       2021-12-24 20:53:=
15.618905716 -0800
>  @@ -0,0 +1,29 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
> @@ -1135,33 +1101,32 @@ index 00000000000..e2af1b1ca97
>  +/* Test that we properly separate bidi contexts (comment/identifier/cha=
racter
>  +   constant/string literal).  */
>  +
> -+/* LRE ->=C3=A2=C2=AA<- */ int pdf_\u202c_1;
> ++/* LRE ->=E2=80=AA<- */ int pdf_\u202c_1;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* RLE ->=C3=A2=C2=AB<- */ int pdf_\u202c_2;
> ++/* RLE ->=E2=80=AB<- */ int pdf_\u202c_2;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* LRO ->=C3=A2=C2=AD<- */ int pdf_\u202c_3;
> ++/* LRO ->=E2=80=AD<- */ int pdf_\u202c_3;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* RLO ->=C3=A2=C2=AE<- */ int pdf_\u202c_4;
> ++/* RLO ->=E2=80=AE<- */ int pdf_\u202c_4;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* LRI ->=C3=A2=C2=A6<-*/ int pdi_\u2069_1;
> ++/* LRI ->=E2=81=A6<-*/ int pdi_\u2069_1;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* RLI ->=C3=A2=C2=A7<- */ int pdi_\u2069_12;
> ++/* RLI ->=E2=81=A7<- */ int pdi_\u2069_12;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* FSI ->=C3=A2=C2=A8<- */ int pdi_\u2069_3;
> ++/* FSI ->=E2=81=A8<- */ int pdi_\u2069_3;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +
> -+const char *s1 =3D "LRE\u202a"; /* PDF ->=C3=A2=C2=AC<- */
> ++const char *s1 =3D "LRE\u202a"; /* PDF ->=E2=80=AC<- */
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> -+/* LRE ->=C3=A2=C2=AA<- */ const char *s2 =3D "PDF\u202c";
> ++/* LRE ->=E2=80=AA<- */ const char *s2 =3D "PDF\u202c";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +const char *s3 =3D "LRE\u202a"; int pdf_\u202c_5;
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  +int lre_\u202a; const char *s4 =3D "PDF\u202c";
>  +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
>  diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
> -index 176f8c5bbce..112b9c24751 100644
> ---- a/libcpp/include/cpplib.h
> -+++ b/libcpp/include/cpplib.h
> +--- a/libcpp/include/cpplib.h  2021-07-27 23:55:08.712307227 -0700
> ++++ b/libcpp/include/cpplib.h  2021-12-24 20:52:31.847651110 -0800
>  @@ -318,6 +318,17 @@ enum cpp_main_search
>     CMS_system,  /* Search the system INCLUDE path.  */
>   };
> @@ -1202,9 +1167,8 @@ index 176f8c5bbce..112b9c24751 100644
>
>   /* Callback for header lookup for HEADER, which is the name of a
>  diff --git a/libcpp/init.c b/libcpp/init.c
> -index 5a424e23553..f9a8f5f088f 100644
> ---- a/libcpp/init.c
> -+++ b/libcpp/init.c
> +--- a/libcpp/init.c    2021-07-27 23:55:08.716307283 -0700
> ++++ b/libcpp/init.c    2021-12-24 20:52:31.847651110 -0800
>  @@ -219,6 +219,7 @@ cpp_create_reader (enum c_lang lang, cpp
>         =3D ENABLE_CANONICAL_SYSTEM_HEADERS;
>     CPP_OPTION (pfile, ext_numeric_literals) =3D 1;
> @@ -1214,9 +1178,8 @@ index 5a424e23553..f9a8f5f088f 100644
>     /* Default CPP arithmetic to something sensible for the host for the
>        benefit of dumb users like fix-header.  */
>  diff --git a/libcpp/internal.h b/libcpp/internal.h
> -index 8577cab6c83..0ce0246c5a2 100644
> ---- a/libcpp/internal.h
> -+++ b/libcpp/internal.h
> +--- a/libcpp/internal.h        2021-07-27 23:55:08.716307283 -0700
> ++++ b/libcpp/internal.h        2021-12-24 20:52:31.847651110 -0800
>  @@ -597,6 +597,13 @@ struct cpp_reader
>     /* Location identifying the main source file -- intended to be line
>        zero of said file.  */
> @@ -1232,9 +1195,8 @@ index 8577cab6c83..0ce0246c5a2 100644
>
>   /* Character classes.  Based on the more primitive macros in safe-ctype=
.h.
>  diff --git a/libcpp/lex.c b/libcpp/lex.c
> -index fa2253d41c3..6a4fbce6030 100644
> ---- a/libcpp/lex.c
> -+++ b/libcpp/lex.c
> +--- a/libcpp/lex.c     2021-07-27 23:55:08.716307283 -0700
> ++++ b/libcpp/lex.c     2021-12-24 20:52:31.847651110 -0800
>  @@ -1164,6 +1164,324 @@ _cpp_process_line_notes (cpp_reader *pfi
>       }
>   }
> diff --git a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch b/me=
ta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
> index 4999c71b64..14b969a5e0 100644
> --- a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
> @@ -90,11 +90,10 @@ Signed-off-by: Pgowda <pgowda.cve@gmail.com>
>   2 files changed, 257 insertions(+), 48 deletions(-)
>   create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
>
> +
>  diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c b/gcc/tests=
uite/c-c++-common/Wbidi-chars-ranges.c
> -new file mode 100644
> -index 00000000000..298750a2a64
> ---- /dev/null
> -+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
> +--- a/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c  1969-12-31 16:00:=
00.000000000 -0800
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c  2021-12-24 20:53:=
15.618905716 -0800
>  @@ -0,0 +1,54 @@
>  +/* PR preprocessor/103026 */
>  +/* { dg-do compile } */
> @@ -104,7 +103,7 @@ index 00000000000..298750a2a64
>  +
>  +int test_unpaired_bidi () {
>  +    int isAdmin =3D 0;
> -+    /*=C3=A2=C2=AE } =C3=A2=C2=A6if (isAdmin)=C3=A2=C2=A9 =C3=A2=C2=A6 =
begin admins only */
> ++    /*=E2=80=AE } =E2=81=A6if (isAdmin)=E2=81=A9 =E2=81=A6 begin admins=
 only */
>  +/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
>  +#if 0
>  +   { dg-begin-multiline-output "" }
> @@ -117,7 +116,7 @@ index 00000000000..298750a2a64
>  +#endif
>  +
>  +        __builtin_printf("You are an admin.\n");
> -+    /* end admins only =C3=A2=C2=AE { =C3=A2=C2=A6*/
> ++    /* end admins only =E2=80=AE { =E2=81=A6*/
>  +/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
>  +#if 0
>  +   { dg-begin-multiline-output "" }
> @@ -133,7 +132,7 @@ index 00000000000..298750a2a64
>  +    return 0;
>  +}
>  +
> -+int LRE_=C3=A2=C2=AA_PDF_\u202c;
> ++int LRE_=E2=80=AA_PDF_\u202c;
>  +/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
>  +#if 0
>  +   { dg-begin-multiline-output "" }
> @@ -142,7 +141,7 @@ index 00000000000..298750a2a64
>  +   { dg-end-multiline-output "" }
>  +#endif
>  +
> -+const char *s1 =3D "LRE_=C3=A2=C2=AA_PDF_\u202c";
> ++const char *s1 =3D "LRE_=E2=80=AA_PDF_\u202c";
>  +/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
>  +#if 0
>  +   { dg-begin-multiline-output "" }
> @@ -151,9 +150,8 @@ index 00000000000..298750a2a64
>  +   { dg-end-multiline-output "" }
>  +#endif
>  diff --git a/libcpp/lex.c b/libcpp/lex.c
> -index 2421d6c0f40..94c36f0d014 100644
> ---- a/libcpp/lex.c
> -+++ b/libcpp/lex.c
> +--- a/libcpp/lex.c     2021-12-24 20:59:55.132097460 -0800
> ++++ b/libcpp/lex.c     2021-12-24 20:59:36.172420707 -0800
>  @@ -1172,11 +1172,34 @@ namespace bidi {
>     /* All the UTF-8 encodings of bidi characters start with E2.  */
>     constexpr uchar utf8_start =3D 0xe2;
> --
> 2.31.1
>

