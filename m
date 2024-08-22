Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5720AC52D7C
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 16:30:44 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.17820.1724344239867530703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 09:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ahB1FvRy;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53349ee42a9so1315460e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724344238; x=1724949038; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqSFQXoAoMk48e+krv7LQfyq6n8tQeu2Z5o1IXOdclM=;
        b=ahB1FvRyMLmqVvJPzYLYGYJSiUkn9FCS2pT011mLYmMW7x+MzpKicmENCIz4H0cXuM
         TZspp2X0j4RaMxHQAEtvOmxR23XHk6S0a6skO2sqA+YF70r/jUHzygTB/Xbj/xY9nE44
         akMLi9H0Nzz9kE4Y7pfAWhtKgsZ7O8vko2n92/9zRwDlvP0k4NxwOSK4aDdeeMC28A7F
         1rTRP/XAP64bj9KuEdFHYJ2aIWK58ew03UdvIQ9yCUZ1VVsAkXc/K+K3FskLvKb4au9U
         hQqsK1g1ZWfUtrXj3R1lB0h9jgzcy1SXoUcb2VHTKXXrYE5KssU1DPCsIfDY0QBSe+io
         SBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724344238; x=1724949038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqSFQXoAoMk48e+krv7LQfyq6n8tQeu2Z5o1IXOdclM=;
        b=qEKop/qFAfrjJvOZ+5Uic+sxHXGidKcf/hKAvSBFe0eBVj82kgnm78a6lavo+9YzOu
         WU59kp+3fzFh337wqAaGJWS4uT5CE0PyJg/dNg3LP9VhsWA6mGzFr2M5GgP+NLPTnmqI
         46Jkf9y9Zehv3sapF1Mv5YeU2HxPCTco4+9xE3xbf3EmTO46+aFeV8Bk/4rBFzFqrCRr
         CUnUkV05fWwsLG6FkTGhtT8WSgUCUufUlpJXmsfcDrDBBbI+iVMSRtD1I2t2OLulRj1C
         o5/tWBgep5haNPNgbIcCNAQSseZ89WpLJytbjvwS5dlVBWDFGcBAPtUUcTrs3ThGxFqf
         cH4Q==
X-Gm-Message-State: AOJu0YwpEPTtsuBRmRSboULLO+TNIQS2CQatWKiWkGbosmnx2IJy+xah
	CfYrF3XQZ+TkAdbDsleCgij+qXZqJmdUGckCwnksaPGloHVc/5Ib0BEFdj1wL9wGP88A26jpSM1
	gt5BJLNxlJ/hi7wF6lQOdRz6VyiM=
X-Google-Smtp-Source: AGHT+IFmDUvUcMXiJvi/lnRX6dacaih0SlYVn7fQhbGswhQ8kCu3jZSHJUzbCndsTjxefx1WP89WJJ9c67zeMCBEmHk=
X-Received: by 2002:a05:6512:3e04:b0:52c:d753:2829 with SMTP id
 2adb3069b0e04-53348557146mr4475695e87.19.1724344237083; Thu, 22 Aug 2024
 09:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com> <1724136703-20023-19-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1724136703-20023-19-git-send-email-wangmy@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Aug 2024 18:30:14 +0200
Message-ID: <CA+chaQdfxzWNuunL94xXwctvsuUVvhTq6wsOtbmt=KAzEZcgng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 19/24] python3-setuptools: upgrade 72.1.0 -> 72.2.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 16:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203658

This seems to break python3-numpy build.

I guess it can be resolved by upgrading numpy as in:
https://lists.openembedded.org/g/openembedded-core/message/203231
which switches from setuptools3 to python_mesonpy

Comparing the failing command line it looks like CXX and some other
flags are included twice:

with: setuptools-72.2.0:

ccache \
aarch64-oe-linux-g++ \
-fstack-protector-all \
-O2 \
-D_FORTIFY_SOURCE=3D2 \
-Wformat \
-Wformat-security \
-Werror=3Dformat-security \
-Werror=3Dreturn-type \
-funwind-tables \
--sysroot=3DWORKDIR/recipe-sysroot \
-O2 \
-g \
-fcanon-prefix-map \
-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1.=
26.4 \
-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1.=
26.4 \
-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1.=
26.4 \
-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1.=
26.4 \
-fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
-fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
-fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
-pipe \
-fvisibility-inlines-hidden \
aarch64-oe-linux-g++ \
-fstack-protector-all \
-O2 \
-D_FORTIFY_SOURCE=3D2 \
-Wformat \
-Wformat-security \
-Werror=3Dformat-security \
-Werror=3Dreturn-type \
-funwind-tables \
--sysroot=3DWORKDIR/recipe-sysroot \
-shared \
-Wl,-O1 \
-Wl,--hash-style=3Dgnu \
-Wl,--as-needed \
-fcanon-prefix-map \
-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1.=
26.4 \
-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1.=
26.4 \
-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1.=
26.4 \
-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1.=
26.4 \
-fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
-fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
-fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
-Wl,-z,relro,-z,now \
-O2 \
-g \
-fcanon-prefix-map \
-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1.=
26.4 \
-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1.=
26.4 \
-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1.=
26.4 \
-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1.=
26.4 \
-fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
-fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
-fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
-pipe \
-fvisibility-inlines-hidden \
build/temp.linux-x86_64-cpython-312/build/src.linux-x86_64-3.12/numpy/core/=
src/multiarray/_multiarray_tests.o
\
build/temp.linux-x86_64-cpython-312/numpy/core/src/common/mem_overlap.o \
build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_argparse.o \
build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_hashtable.o \
-LWORKDIR/recipe-sysroot/usr/lib \
-Lbuild/temp.linux-x86_64-cpython-312 \
-lnpymath \
-o \
build/lib.linux-x86_64-cpython-312/numpy/core/_multiarray_tests.cpython-312=
-aarch64-linux-gnu.so

--- setuptools-72.1.0   2024-08-22 18:17:36.941146726 +0200
+++ setuptools-72.2.0   2024-08-22 18:17:27.208147768 +0200
@@ -9,6 +9,28 @@
 -Werror=3Dreturn-type \
 -funwind-tables \
 --sysroot=3DWORKDIR/recipe-sysroot \
+-O2 \
+-g \
+-fcanon-prefix-map \
+-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1=
.26.4 \
+-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1=
.26.4 \
+-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1=
.26.4 \
+-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/1=
.26.4 \
+-fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
+-fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
+-fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
+-pipe \
+-fvisibility-inlines-hidden \
+aarch64-oe-linux-g++ \
+-fstack-protector-all \
+-O2 \
+-D_FORTIFY_SOURCE=3D2 \
+-Wformat \
+-Wformat-security \
+-Werror=3Dformat-security \
+-Werror=3Dreturn-type \
+-funwind-tables \
+--sysroot=3DWORKDIR/recipe-sysroot \
 -shared \
 -Wl,-O1 \
 -Wl,--hash-style=3Dgnu \
@@ -33,6 +55,7 @@
 -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
 -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
 -pipe \
+-fvisibility-inlines-hidden \
 build/temp.linux-x86_64-cpython-312/build/src.linux-x86_64-3.12/numpy/core=
/src/multiarray/_multiarray_tests.o
\
 build/temp.linux-x86_64-cpython-312/numpy/core/src/common/mem_overlap.o \
 build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_argparse.o \

failing with:
WORKDIR/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch6=
4-oe-linux/gcc/aarch64-oe-linux/14.2.0/ld:
cannot find aarch64-oe-linux-g++: No such file or directory
collect2: error: ld returned 1 exit status

On Tue, Aug 20, 2024 at 8:52=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> - Support for Pathlike objects in data files and extensions
> - native support for C++ compilers
> - removed unused get_msvcr()
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...ython3-setuptools_72.1.0.bb =3D> python3-setuptools_72.2.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-setuptools_72.1.0.bb =3D> p=
ython3-setuptools_72.2.0.bb} (94%)
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb b/=
meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> similarity index 94%
> rename from meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
> rename to meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> index 945d443aff..63ea999960 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> @@ -11,7 +11,7 @@ SRC_URI:append:class-native =3D " file://0001-condition=
ally-do-not-fetch-code-by-e
>  SRC_URI +=3D " \
>              file://0001-_distutils-sysconfig.py-make-it-possible-to-subs=
tite.patch"
>
> -SRC_URI[sha256sum] =3D "8d243eff56d095e5817f796ede6ae32941278f542e0f9418=
67cc05ae52b162ec"
> +SRC_URI[sha256sum] =3D "80aacbf633704e9c8bfa1d99fa5dd4dc59573efcf9e4042c=
13d3bcef91ac2ef9"
>
>  DEPENDS +=3D "python3"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203537): https://lists.openembedded.org/g/openembedde=
d-core/message/203537
> Mute This Topic: https://lists.openembedded.org/mt/107996505/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

