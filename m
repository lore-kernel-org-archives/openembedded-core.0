Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD503E77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 23:36:26 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.8466.1733960180123934552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 15:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h0MqrNVX;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-29737adb604so3012fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 15:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733960179; x=1734564979; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPw0GIrSOwPDSovuenXNjNPGZjy3pYYxi+gtwYwPtc8=;
        b=h0MqrNVXtY0bp1gKcCq4tiZeK0d/FDQkEIgEgtxzZeeZ3QagnQyzjoH00IrWtZw/RN
         FeVGI+zgzukx6dO+EbneSPW/8kNTp0/X9DNj4wf5cRaeauyAInFt+715BxMlMu1s8OiG
         GuMFTEeNj3FizdJb310yu/TTen5W4uj5OWwPiEJZqb+c0yz0B8oNWmY7ZLruDOpf0fxr
         PHbqXFyXgFp7CuwJ5tZF67Pwn1brxato8UtnStIgoNsIwDQ9qBNzxhBBFaHr2XY3fKYL
         tXG8U1gzsEVFnzCqWXI4b4F1iv1FeCrh2bqXkab7C8RPsUzOAZPYEGHZ1ZakCSpJbKWA
         yFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733960179; x=1734564979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPw0GIrSOwPDSovuenXNjNPGZjy3pYYxi+gtwYwPtc8=;
        b=lVOypNge4YNJ/vVHzzF8JHe0LFsbodqmJci10MO+tMJ24mTycSadLlvg5GeGUeuVon
         DiV5C67D3v1ATJ3V6fUtclstCJC8KTZ0vjM+P0grNfvu0yfT1SI+0oWJ8sl0MQEAcuI2
         BuymfFdZoTeL7INVFt7oaw40slSwVgRalIgAU77svq/OIDD6kfIWu/giC7W6KSpk81gT
         wz8iNWCbAWisUGjt7KJDqG5U4MCLeRKljz57jKO/nW9Hf+ss/9ShdHM3cpNgARs4zAwT
         zOlV1T06BrOEWmnSSpW0rkTBvucbAg4J38Kr/scEr4MDEITIQa2wuogl/IM+C7EPW767
         sM/w==
X-Gm-Message-State: AOJu0YypgaMbVpzBGaR+O57KsNFkRO5ZDzJL3WQcKWS+Ey3s+eSSAryt
	9WR+D3P6mBa31c0jY2/tDtOggWlXFSMA5IbtN0FZlvyVcSEgNBTCyelvR6u+VASQyWxzOItAa1i
	+1yaEuze+4teOdmMbObbZobQPvADJUw==
X-Gm-Gg: ASbGncviFW5JSp4shsx/iGKlypPCVv29bgukTGuttefKwDKqcwvo5qsYofhNA9tdvpB
	jttfpOpHDlJC6uNbiny9YYtMcDPBJgVG9lRtk1ZAxAy09gN9MwA==
X-Google-Smtp-Source: AGHT+IFjnmfo38nq7Suj5xFBt1mout+GQ8Ndni+S+Sqzojzzsp4YN+tBb93d3edN1nnE0DkzhRwVuEs7T1e+Kh5AkVQ=
X-Received: by 2002:a05:6871:68e:b0:29d:c624:7cc4 with SMTP id
 586e51a60fabf-2a38232e72amr1185457fac.6.1733960179318; Wed, 11 Dec 2024
 15:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20241211180036.1710054-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20241211180036.1710054-1-sunilkumar.dora@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Dec 2024 15:35:53 -0800
Message-ID: <CAMKF1soxHqg-7KkGtSZKqf6gRgJKrw8GFTZCr9Nt5qUnuPzswA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 23:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208617

seems good to me.

On Wed, Dec 11, 2024 at 10:01=E2=80=AFAM SunilKumar.Dora via
lists.openembedded.org
<SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> This commit updates the warning to use a check for "trivially constructib=
le" instead of
> "trivially copyable." The original check was incorrect, as "trivially cop=
yable" only applies
> to types that can be copied trivially, whereas "trivially constructible" =
is the correct check
> for types that can be trivially default-constructed.
>
> This change ensures the warning is more accurate and aligns with the prop=
er type traits.
>
> LLVM accepted a similar fix:
> https://github.com/llvm/llvm-project/issues/47355
>
> PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D116731]
>
> Signed-off-by: Marek Polacek <polacek@redhat.com>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-13.3.inc        |   1 +
>  ...ix-c-tweak-for-Wrange-loop-construct.patch | 113 ++++++++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-fo=
r-Wrange-loop-construct.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-13.3.inc b/meta/recipes-devtoo=
ls/gcc/gcc-13.3.inc
> index ffe90c7188..8b6c2a5938 100644
> --- a/meta/recipes-devtools/gcc/gcc-13.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-13.3.inc
> @@ -66,6 +66,7 @@ SRC_URI =3D "${BASEURI} \
>             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
>             file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
>             file://0027-Fix-gcc-vect-module-testcases.patch \
> +          file://0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
>             file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch=
 \
>  "
>  SRC_URI[sha256sum] =3D "0845e9621c9543a13f484e94584a49ffc0129970e9914624=
235fc1d061a0c083"
> diff --git a/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrang=
e-loop-construct.patch b/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak=
-for-Wrange-loop-construct.patch
> new file mode 100644
> index 0000000000..745b38f7f1
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-=
construct.patch
> @@ -0,0 +1,113 @@
> +From 66aa69e2add2b8641a652768b0eac30f00427145 Mon Sep 17 00:00:00 2001
> +From: Sunil Dora <sunilkumar.dora@windriver.com>
> +Date: Wed, 11 Dec 2024 09:48:16 -0800
> +Subject: [PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
> +
> +This commit updates the warning to use a check for "trivially constructi=
ble" instead of
> +"trivially copyable." The original check was incorrect, as "trivially co=
pyable" only applies
> +to types that can be copied trivially, whereas "trivially constructible"=
 is the correct check
> +for types that can be trivially default-constructed.
> +
> +This change ensures the warning is more accurate and aligns with the pro=
per type traits.
> +
> +LLVM accepted a similar fix:
> +https://github.com/llvm/llvm-project/issues/47355
> +
> +PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D116731]
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/g:179dc0f0fe01012675c1b43=
0591b9891ce96c26e]
> +
> +Signed-off-by: Marek Polacek <polacek@redhat.com>
> +Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> +---
> + gcc/cp/parser.cc                              |  7 ++-
> + .../g++.dg/warn/Wrange-loop-construct3.C      | 57 +++++++++++++++++++
> + 2 files changed, 61 insertions(+), 3 deletions(-)
> + create mode 100644 gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
> +
> +diff --git a/gcc/cp/parser.cc b/gcc/cp/parser.cc
> +index 4e67da6ff..5dd94357d 100644
> +--- a/gcc/cp/parser.cc
> ++++ b/gcc/cp/parser.cc
> +@@ -13854,11 +13854,12 @@ warn_for_range_copy (tree decl, tree expr)
> +   else if (!CP_TYPE_CONST_P (type))
> +     return;
> +
> +-  /* Since small trivially copyable types are cheap to copy, we suppres=
s the
> +-     warning for them.  64B is a common size of a cache line.  */
> ++  /* Since small trivially constructible types are cheap to construct, =
we
> ++     suppress the warning for them.  64B is a common size of a cache li=
ne.  */
> ++  tree list =3D build_tree_list (NULL_TREE, TREE_TYPE (expr));
> +   if (TREE_CODE (TYPE_SIZE_UNIT (type)) !=3D INTEGER_CST
> +       || (tree_to_uhwi (TYPE_SIZE_UNIT (type)) <=3D 64
> +-        && trivially_copyable_p (type)))
> ++        && is_trivially_xible (INIT_EXPR, type, list)))
> +     return;
> +
> +   /* If we can initialize a reference directly, suggest that to avoid t=
he
> +diff --git a/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C b/gcc/te=
stsuite/g++.dg/warn/Wrange-loop-construct3.C
> +new file mode 100644
> +index 000000000..3d9d0c908
> +--- /dev/null
> ++++ b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
> +@@ -0,0 +1,57 @@
> ++// PR c++/116731
> ++// { dg-do compile { target c++11 } }
> ++// { dg-options "-Wrange-loop-construct" }
> ++
> ++void
> ++f0 ()
> ++{
> ++  struct S {
> ++    char a[64];
> ++    S& operator=3D(const S&) { return *this; };
> ++  };
> ++
> ++  S arr[8];
> ++  for (const auto r : arr)
> ++    (void) r;
> ++}
> ++
> ++void
> ++f1 ()
> ++{
> ++  struct S {
> ++    char a[65];
> ++    S& operator=3D(const S&) { return *this; };
> ++  };
> ++
> ++  S arr[8];
> ++  for (const auto r : arr) // { dg-warning "creates a copy" }
> ++    (void) r;
> ++}
> ++
> ++void
> ++f2 ()
> ++{
> ++  struct S {
> ++    char a[64];
> ++    S& operator=3D(const S&) { return *this; };
> ++    ~S() { }
> ++  };
> ++
> ++  S arr[8];
> ++  for (const auto r : arr) // { dg-warning "creates a copy" }
> ++    (void) r;
> ++}
> ++
> ++void
> ++f3 ()
> ++{
> ++  struct S {
> ++    char a[65];
> ++    S& operator=3D(const S&) { return *this; };
> ++    ~S() { }
> ++  };
> ++
> ++  S arr[8];
> ++  for (const auto r : arr) // { dg-warning "creates a copy" }
> ++    (void) r;
> ++}
> +--
> +2.43.0
> +
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208599): https://lists.openembedded.org/g/openembedde=
d-core/message/208599
> Mute This Topic: https://lists.openembedded.org/mt/110066262/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

