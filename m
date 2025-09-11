Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B475FCAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 14:27:10 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.48337.1757600820940558623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 07:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CdFFM+Fb;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d60504788so5600157b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757600820; x=1758205620; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QB9AFRChKhGnQZ8kzY4w/7vw3gVsBy9cHskLREFivkw=;
        b=CdFFM+Fb4rvs5UkNlllelEUzVre+gblIivtjzQfoiHBcS5B70drYdXvuQCu1mlSEaM
         5ZJmzgJjaOIG0rN8CeTiLBRw3TFdJZ5tPVNJZk0534BShdEIi2dxfULzDKyaeFSoY+7C
         cG2wrfyTRJCyFTP6S51XFDHVxFAxhW9JUhqbyRlhZ1wC5y6xBtSqdOh0/X3M4fFcab81
         UtsMMwYCWrwlfDz8uEQVXqFVRva5ntm5fABBBcrObYWYhGYnYSd4of6V1dsC+gNzOwq6
         2sWvr+JGFl325L6XPZeD2hKbYR704KL4jqwrxDfO0QsJEF7vVnFuqcFK0KAYROj3fS18
         nDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757600820; x=1758205620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QB9AFRChKhGnQZ8kzY4w/7vw3gVsBy9cHskLREFivkw=;
        b=kyrgwCl59PwHBjaY+mONpTDGRN4X2EJmUvJ0/K8fk/0ksuHfrNkOkonLykkKn8XGPg
         bZtbuPbCxV94Yid9fVKwfwbCI0ibKWACbeoNT5bUyMNOuIaCMfME2I9obk+yrkKP98ud
         AqxxlUazx69FqYesDh9ELbg9oH7XoRl347Zlmfgoo4YhinV/ylXTWu9n14WNlTs8kuww
         MFr3LlBMUVj4RgRKVjrx9jpVqI07M5psrpWHJzpc2CQGqCwcrTARzYhM5APaHAxpwhxr
         24ZYPDoK6oRaYAgSsDLoBkde2a8lD3kRTvsC/h/SKS0v6oNDHlFyzDrDugYG7D8PtHwb
         F9bg==
X-Gm-Message-State: AOJu0Yz+eYbGOeqDpJzcPGlmWX5Ie9RWYoB2KjWu4BBCsed+zTVu1ZLp
	S/bMogCA/LcR3lPW1evPNg9rPoSMdIgS7r61zAbVTPiGk1Dvf34cFR8DGoYIdHk90Phr2/ZRsiA
	0xGYVR6HhmS2jwpmXqDdyID6v+LZkuEA=
X-Gm-Gg: ASbGncudduC8l3xvNKL9wN4PPOn38PewvRFYmvoFbamE9KoocoNwejB8bNr9MuNU27d
	Mea9mc9rz2nEz7NqDvje+/nREYgvHRMCIIUmS5FBuyXLjHCrsDTjpUr3Pg1RtOUFbF1xHJxIZM+
	Fkmwp7meXucON9DlfXQ/FmxgNyDBaEhyDTrcMdVcYIZqazfS2ViQVzB6SqagXRCsp/StsbIu9hZ
	O0JSw3s9oP0i2mfix4yAVeFrBk56WjiUcftqa0wBvvXBDyyvQ9SbZ7mFPZtxKjb9z1ai+aSLQYs
	miWe7SirnRvm1pqus+Hhk1Tnqp4rkmmUDlgD05mURu3dhxhU1X7YlGl8Xf2yrG81iScL
X-Google-Smtp-Source: AGHT+IEJKKzhNzA1bThkDdgaSbRfwQXL+0hvZIIjVPy0+YuCkSJ4GYxZwOlnu7Bo0w9hpFPRn0tFAx4gXjKbcKbfnXA=
X-Received: by 2002:a05:690c:6f0f:b0:71f:b944:1019 with SMTP id
 00721157ae682-727f73fe2e7mr191033227b3.52.1757600819692; Thu, 11 Sep 2025
 07:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250911115835.1885519-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20250911115835.1885519-1-sunilkumar.dora@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Sep 2025 07:26:48 -0700
X-Gm-Features: Ac12FXxQAy8S0bAKoHT68iXdmXELKIDHOEfQCbqw93EboduDhgrvZG6aBIsD4qs
Message-ID: <CAMKF1srSVUXocCkkGUW6F0uou2NOY+2xABJo2QSP_iPdfO=3xg@mail.gmail.com>
Subject: Re: [PATCH] clang: drop obsolete patch D144514
To: sunilkumar.dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="00000000000083cbcf063e875448"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 14:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223280

--00000000000083cbcf063e875448
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 4:59=E2=80=AFAM <sunilkumar.dora@windriver.com> wro=
te:

> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> The upstream fix for the TIMEBITS=3D64 error was committed in LLVM
> D140812 (commit 26800a2) in sanitizer_platform_limits_posix.cpp,
> which addresses the issue for Linux builds.
>
> Our patch D144514 (#undef TIMEBITS in sanitizer_platform.h) is no
> longer needed. Testing compiler-rt-sanitizers for arm32 also
> succeeded without this patch, confirming it is safe to drop.


This is already squashed into 21.1.1 upgrade patch


>
> Upstream fix:
>
> https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5c=
ca41c45e1a9
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---
>  ...f-_TIME_BITS-along-with-_FILE_OFFSET.patch | 43 -------------------
>  meta/recipes-devtools/clang/common.inc        |  1 -
>  2 files changed, 44 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along=
-with-_FILE_OFFSET.patch
>
> diff --git
> a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-alo=
ng-with-_FILE_OFFSET.patch
> b/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-alo=
ng-with-_FILE_OFFSET.patch
> deleted file mode 100644
> index e129aa245d..0000000000
> ---
> a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-alo=
ng-with-_FILE_OFFSET.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 6b6a518bc7686af7680f45fcdea7c414a22a2f53 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 21 Feb 2023 12:46:10 -0800
> -Subject: [PATCH] compiler-rt: Undef _TIME_BITS along with
> _FILE_OFFSET_BITS in
> - sanitizers
> -
> -On 32bit systems using 64bit time_t build fails because
> -_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
> -
> -Fixes
> -In file included from
> compiler-rt/lib/sanitizer_common/sanitizer_procmaps_solaris.cpp:17:
> -In file included from
> compiler-rt/lib/sanitizer_common/sanitizer_platform.h:25:
> -In file included from /usr/include/features.h:393:
> -/usr/include/features-time64.h:26:5: error: "_TIME_BITS=3D64 is allowed
> only with _FILE_OFFSET_BITS=3D64"
> -    ^
> -1 error generated.
> -
> -Upstream-Status: Submitted [https://reviews.llvm.org/D144514]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - compiler-rt/lib/sanitizer_common/sanitizer_platform.h | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
> b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
> -index 57966403c92a..efa83f30eca0 100644
> ---- a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
> -+++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
> -@@ -22,6 +22,15 @@
> - // function declarations into a .S file which doesn't compile.
> - // https://crbug.com/1162741
> - #if __has_include(<features.h>) && !defined(__ANDROID__)
> -+// Some sources undefine _FILE_OFFSET_BITS deliberately e.g.
> -+// sanitizer_procmaps_solaris.cpp. This is problematic on glibc systems
> with
> -+// 32-bit architectures using 64-bit time_t and users passing
> _TIME_BITS=3D64
> -+// from build environment, therefore both _FILE_OFFSET_BITS and
> _TIME_BITS
> -+// need to be undefined together since features.h will check for both
> being 64
> -+// if one is set to 64.
> -+#  if !defined(_FILE_OFFSET_BITS)
> -+#    undef _TIME_BITS
> -+#  endif
> - #  include <features.h>
> - #endif
> -
> diff --git a/meta/recipes-devtools/clang/common.inc
> b/meta/recipes-devtools/clang/common.inc
> index cbcc4feded..9f8daad9f1 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -46,7 +46,6 @@ SRC_URI =3D "\
>      file://0023-compiler-rt-Enable-__int128-for-ppc32.patch \
>      file://0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
>      file://0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
> -
> file://0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch \
>      file://0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch=
 \
>      file://0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch =
\
>      file://0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
> --
> 2.49.0
>
>

--00000000000083cbcf063e875448
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Sep 11, 2025 at 4:59=E2=80=AFAM &lt;<a href=3D=
"mailto:sunilkumar.dora@windriver.com">sunilkumar.dora@windriver.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">From: Sunil Dora &lt;<a hr=
ef=3D"mailto:sunilkumar.dora@windriver.com" target=3D"_blank">sunilkumar.do=
ra@windriver.com</a>&gt;<br>
<br>
The upstream fix for the TIMEBITS=3D64 error was committed in LLVM<br>
D140812 (commit 26800a2) in sanitizer_platform_limits_posix.cpp,<br>
which addresses the issue for Linux builds.<br>
<br>
Our patch D144514 (#undef TIMEBITS in sanitizer_platform.h) is no<br>
longer needed. Testing compiler-rt-sanitizers for arm32 also<br>
succeeded without this patch, confirming it is safe to drop.</blockquote><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">This is already squashed into 2=
1.1.1 upgrade patch=C2=A0</div><div dir=3D"auto"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex" dir=3D"auto"><br>
<br>
Upstream fix:<br>
<a href=3D"https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b=
4e990dd5cca41c45e1a9" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9</a><br=
>
<br>
Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.c=
om" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
---<br>
=C2=A0...f-_TIME_BITS-along-with-_FILE_OFFSET.patch | 43 ------------------=
-<br>
=C2=A0meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 -<br>
=C2=A02 files changed, 44 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/clang/clang/0026-compiler-rt=
-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch<br>
<br>
diff --git a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME=
_BITS-along-with-_FILE_OFFSET.patch b/meta/recipes-devtools/clang/clang/002=
6-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch<br>
deleted file mode 100644<br>
index e129aa245d..0000000000<br>
--- a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-a=
long-with-_FILE_OFFSET.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-From 6b6a518bc7686af7680f45fcdea7c414a22a2f53 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Tue, 21 Feb 2023 12:46:10 -0800<br>
-Subject: [PATCH] compiler-rt: Undef _TIME_BITS along with _FILE_OFFSET_BIT=
S in<br>
- sanitizers<br>
-<br>
-On 32bit systems using 64bit time_t build fails because<br>
-_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64<br>
-<br>
-Fixes<br>
-In file included from compiler-rt/lib/sanitizer_common/sanitizer_procmaps_=
solaris.cpp:17:<br>
-In file included from compiler-rt/lib/sanitizer_common/sanitizer_platform.=
h:25:<br>
-In file included from /usr/include/features.h:393:<br>
-/usr/include/features-time64.h:26:5: error: &quot;_TIME_BITS=3D64 is allow=
ed only with _FILE_OFFSET_BITS=3D64&quot;<br>
-=C2=A0 =C2=A0 ^<br>
-1 error generated.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://reviews.llvm.org/D144514" r=
el=3D"noreferrer" target=3D"_blank">https://reviews.llvm.org/D144514</a>]<b=
r>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- compiler-rt/lib/sanitizer_common/sanitizer_platform.h | 9 +++++++++<br>
- 1 file changed, 9 insertions(+)<br>
-<br>
-diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h b/compi=
ler-rt/lib/sanitizer_common/sanitizer_platform.h<br>
-index 57966403c92a..efa83f30eca0 100644<br>
---- a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h<br>
-+++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h<br>
-@@ -22,6 +22,15 @@<br>
- // function declarations into a .S file which doesn&#39;t compile.<br>
- // <a href=3D"https://crbug.com/1162741" rel=3D"noreferrer" target=3D"_bl=
ank">https://crbug.com/1162741</a><br>
- #if __has_include(&lt;features.h&gt;) &amp;&amp; !defined(__ANDROID__)<br=
>
-+// Some sources undefine _FILE_OFFSET_BITS deliberately e.g.<br>
-+// sanitizer_procmaps_solaris.cpp. This is problematic on glibc systems w=
ith<br>
-+// 32-bit architectures using 64-bit time_t and users passing _TIME_BITS=
=3D64<br>
-+// from build environment, therefore both _FILE_OFFSET_BITS and _TIME_BIT=
S<br>
-+// need to be undefined together since features.h will check for both bei=
ng 64<br>
-+// if one is set to 64.<br>
-+#=C2=A0 if !defined(_FILE_OFFSET_BITS)<br>
-+#=C2=A0 =C2=A0 undef _TIME_BITS<br>
-+#=C2=A0 endif<br>
- #=C2=A0 include &lt;features.h&gt;<br>
- #endif<br>
- <br>
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools=
/clang/common.inc<br>
index cbcc4feded..9f8daad9f1 100644<br>
--- a/meta/recipes-devtools/clang/common.inc<br>
+++ b/meta/recipes-devtools/clang/common.inc<br>
@@ -46,7 +46,6 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0023-compiler-rt-Enable-__int128-for-ppc32.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0file://0024-llvm-Do-not-use-cmake-infra-to-detect-libzs=
td.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0025-compiler-rt-Fix-stat-struct-s-size-for-O32-=
ABI.patch \<br>
-=C2=A0 =C2=A0 file://0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OF=
FSET.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-i=
n-lib32.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0028-clang-llvm-Add-OE-specific-ABI-triple-for-N=
32-ABI.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0029-llvm-Add-libunwind.pc.in-and-llvm-config-sc=
ripts.patch \<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--00000000000083cbcf063e875448--

