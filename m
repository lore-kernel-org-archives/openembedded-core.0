Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B84C77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 05:22:34 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.42653.1683177748759806989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 22:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BjUZMzOg;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ac675d84b5so664021fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 22:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683177746; x=1685769746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=giMO4HRnLWRZEyE14OMLsg9xcqh0lnSSDu7BBSZF/lI=;
        b=BjUZMzOgTVKhc+w9ijNgJ5Ma/YuuIDl72knyTAxov/nguDKNY/XyHSoGFyGpbEh+YU
         H+XG02AsI64FqmL5Xdn/VQtXpedeuO7goOvqinDDy24qkmdjytpCrtPTaSC0GtuO8Cwr
         lHmDtlKLDTZvKUpB5pPF2pAR59uToG4TvWyXh5aU1/A00IbaYBq9ID31Pijs5DBUToWT
         Pfmjpzn8lTqqN/pkw3x3lMx/ulCgnBaLnxH8cjL70FxD0Y2jiWyAqMh8k8Y7h4Nlxu6S
         z65ltaJqggwoq++gkKAaQXSMY9j4iKnBel5tk+w7h75qWBualPyqBNxcmlCg/3koBXLP
         wzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683177746; x=1685769746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giMO4HRnLWRZEyE14OMLsg9xcqh0lnSSDu7BBSZF/lI=;
        b=NCIo9sUZslKEd5e4SmbpwMVJBTMCYEf8crclQs+UQ/+nnZyXI1i+dyYpwhtjkuqvSS
         0xnjAyuQFhcdPQ054nZ13DnsU4+DfgPK4asU45TA+FSFfP+FsPY9kREEoOHAfbNucXRH
         V6pGcmad1WocXAAwuH/66l1LHf9tv0z/JP31wuw7RDm2D5kyM/vDmMQB+1Vj4vOjgoZq
         1MipxJ+ExjQES6Q4QFcgMSQBrIS3FP8Q0UfvO1ljotutLcW1ct1W+XnJ7gagevvDIW+e
         qG0U35z7lKzxkaZ9BQ77ewdDEpY88JSxRd2Glj/yoYPN7SPKEbvGzo3z2eAoIFUyfjhz
         Jnqg==
X-Gm-Message-State: AC+VfDze+ghnZ0qkp66GPxcXky80evUR6oxhto2EqYB7B2z6FRa4h5+R
	u37PEJ3OJk+zIOJkAUPK8CSVCmH5MFYozSa7Hqw=
X-Google-Smtp-Source: ACHHUZ6e5wR40VWpkYp5ZMDkHxgpCIFmT8O24+O3Mm6hFcJeNM7gjsEhsJzhyN1JlGYZXmBjWNtqnq0keqoY9ChVch0=
X-Received: by 2002:ac2:414a:0:b0:4eb:1e87:b1fe with SMTP id
 c10-20020ac2414a000000b004eb1e87b1femr1323227lfi.58.1683177746027; Wed, 03
 May 2023 22:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
In-Reply-To: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 4 May 2023 07:22:14 +0200
Message-ID: <CA+cAkeqEmVWwBb6EucuuSWSGxxSqkBHBPdgwtPpdgNAmTzQWeg@mail.gmail.com>
Subject: Re: [OE-core] [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a558bd05fad75bf2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 05:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180849

--000000000000a558bd05fad75bf2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Tim,

I'll take a look today since I already put my nose in this package for rust
ptest patch series, it was unsuccessful but I want to know more on this
package to kill two birds with one stone (hope so)

Le mer. 3 mai 2023, 19:31, Tim Orling <ticotimo@gmail.com> a =C3=A9crit :

> I am working on an upgrade from 39.0.2 to 40.0.2 for python3-cryptography=
:
>
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/python3-cryptogra=
phy_40.0.2
>
> The patch at the tip of HEAD is perhaps not needed, as the compiling of
> `openssl-sys` was not the problem. We might need tweaks to not vendor
> OpenSSL, but I do not think this is the root of the problem right now.
>
> The issue I am struggling with is "Python.h" is not being found:
> |   cargo:rerun-if-env-changed=3DCRATE_CC_NO_DEFAULTS
> |   CRATE_CC_NO_DEFAULTS =3D Some("1")
> |   Info: default compiler flags are disabled
> |   cargo:rerun-if-env-changed=3DCC_x86_64-poky-linux-gnu
> |   CC_x86_64-poky-linux-gnu =3D None
> |   cargo:rerun-if-env-changed=3DCC_x86_64_poky_linux_gnu
> |   CC_x86_64_poky_linux_gnu =3D None
> |   cargo:rerun-if-env-changed=3DTARGET_CC
> |   TARGET_CC =3D None
> |   cargo:rerun-if-env-changed=3DCC
> |   CC =3D Some("x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore=
2
> -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2
> -Wformat -Wformat-security -Werror=3Dformat-security
> --sysroot=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-lin=
ux/python3-cryptography/40.0.2-r0/recipe-sysroot")
> |   cargo:rerun-if-env-changed=3DCFLAGS_x86_64-poky-linux-gnu
> |   CFLAGS_x86_64-poky-linux-gnu =3D None
> |   cargo:rerun-if-env-changed=3DCFLAGS_x86_64_poky_linux_gnu
> |   CFLAGS_x86_64_poky_linux_gnu =3D None
> |   cargo:rerun-if-env-changed=3DTARGET_CFLAGS
> |   TARGET_CFLAGS =3D None
> |   cargo:rerun-if-env-changed=3DCFLAGS
> |   CFLAGS =3D Some(" -O2 -pipe -g -feliminate-unused-debug-types
> -fmacro-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64=
-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=3D/usr/src/d=
ebug/python3-cryptography/40.0.2-r0
>  -fdebug-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=3D/usr/src/=
debug/python3-cryptography/40.0.2-r0
>  -fmacro-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/build=3D/usr/src/debug/python3-=
cryptography/40.0.2-r0
>  -fdebug-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/build=3D/usr/src/debug/python3-=
cryptography/40.0.2-r0
>  -fdebug-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot=3D
>  -fmacro-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot=3D
>  -fdebug-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native=3D
> ")
> |   cargo:rerun-if-env-changed=3DCRATE_CC_NO_DEFAULTS
> |   CRATE_CC_NO_DEFAULTS =3D Some("1")
> |   Info: default compiler flags are disabled
> |   running: "x86_64-poky-linux-gcc" "-m64" "-march=3Dcore2" "-mtune=3Dco=
re2"
> "-msse3" "-mfpmath=3Dsse" "-fstack-protector-strong" "-O2"
> "-D_FORTIFY_SOURCE=3D2" "-Wformat" "-Wformat-security"
> "-Werror=3Dformat-security"
> "--sysroot=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-li=
nux/python3-cryptography/40.0.2-r0/recipe-sysroot"
> "-O2" "-pipe" "-g" "-feliminate-unused-debug-types"
> "-fmacro-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=3D/usr/src/=
debug/python3-cryptography/40.0.2-r0"
> "-fdebug-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=3D/usr/src/=
debug/python3-cryptography/40.0.2-r0"
> "-fmacro-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/build=3D/usr/src/debug/python3-=
cryptography/40.0.2-r0"
> "-fdebug-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/build=3D/usr/src/debug/python3-=
cryptography/40.0.2-r0"
> "-fdebug-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot=3D"
> "-fmacro-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot=3D"
> "-fdebug-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native=3D"
> "-I" "/usr/include/python3.11" "-I"
> "/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-=
cryptography/40.0.2-r0/recipe-sysroot/usr/include"
> "-Wconversion" "-Wno-error=3Dsign-conversion" "-Wno-unused-parameter"
> "-DPy_LIMITED_API=3D0x030600f0" "-o"
> "/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-=
cryptography/40.0.2-r0/build/target/x86_64-poky-linux-gnu/release/build/cry=
ptography-rust-aa00e39a952c07ee/out/9f543b84f9f4dceb-_openssl.o"
> "-c"
> "/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-=
cryptography/40.0.2-r0/build/target/x86_64-poky-linux-gnu/release/build/cry=
ptography-rust-aa00e39a952c07ee/out/_openssl.c"
> |
> cargo:warning=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky=
-linux/python3-cryptography/40.0.2-r0/build/target/x86_64-poky-linux-gnu/re=
lease/build/cryptography-rust-aa00e39a952c07ee/out/_openssl.c:57:10:
> fatal error: Python.h: No such file or directory
> |   cargo:warning=3D   57 | #include <Python.h>
> |   cargo:warning=3D      |          ^~~~~~~~~~
> |   cargo:warning=3Dcompilation terminated.
> |   exit status: 1
> |
> |   --- stderr
>
> which I believe is happening during:
> https://github.com/pyca/cryptography/blob/40.0.x/src/rust/build.rs#L74
>
> I would appreciate input from any crustaceans out there with a better
> understanding of what might be happening.
>
> --Tim
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180834):
> https://lists.openembedded.org/g/openembedded-core/message/180834
> Mute This Topic: https://lists.openembedded.org/mt/98667212/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a558bd05fad75bf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello Tim,<div dir=3D"auto"><br></div><div dir=3D"auto">I=
&#39;ll take a look today since I already put my nose in this package for r=
ust ptest patch series, it was unsuccessful but I want to know more on this=
 package to kill two birds with one stone (hope so)=C2=A0</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le mer. 3 ma=
i 2023, 19:31, Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotim=
o@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr">I am working=C2=A0on an upgrade from 39.0.2 to 40.0.2=
 for python3-cryptography:<div><a href=3D"https://git.yoctoproject.org/poky=
-contrib/log/?h=3Dtimo/python3-cryptography_40.0.2" target=3D"_blank" rel=
=3D"noreferrer">https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/pyt=
hon3-cryptography_40.0.2</a><br></div><div><br></div><div>The patch at the =
tip of HEAD is perhaps not needed, as the compiling of `openssl-sys` was no=
t the problem. We might need tweaks to not vendor OpenSSL, but I do not thi=
nk this is the root of the problem right now.</div><div><br></div><div>The =
issue I am struggling with is &quot;Python.h&quot; is not being found:</div=
><div>| =C2=A0 cargo:rerun-if-env-changed=3DCRATE_CC_NO_DEFAULTS<br>| =C2=
=A0 CRATE_CC_NO_DEFAULTS =3D Some(&quot;1&quot;)<br>| =C2=A0 Info: default =
compiler flags are disabled<br>| =C2=A0 cargo:rerun-if-env-changed=3DCC_x86=
_64-poky-linux-gnu<br>| =C2=A0 CC_x86_64-poky-linux-gnu =3D None<br>| =C2=
=A0 cargo:rerun-if-env-changed=3DCC_x86_64_poky_linux_gnu<br>| =C2=A0 CC_x8=
6_64_poky_linux_gnu =3D None<br>| =C2=A0 cargo:rerun-if-env-changed=3DTARGE=
T_CC<br>| =C2=A0 TARGET_CC =3D None<br>| =C2=A0 cargo:rerun-if-env-changed=
=3DCC<br>| =C2=A0 CC =3D Some(&quot;x86_64-poky-linux-gcc =C2=A0-m64 -march=
=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong =C2=
=A0-O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity --sysroot=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-pok=
y-linux/python3-cryptography/40.0.2-r0/recipe-sysroot&quot;)<br>| =C2=A0 ca=
rgo:rerun-if-env-changed=3DCFLAGS_x86_64-poky-linux-gnu<br>| =C2=A0 CFLAGS_=
x86_64-poky-linux-gnu =3D None<br>| =C2=A0 cargo:rerun-if-env-changed=3DCFL=
AGS_x86_64_poky_linux_gnu<br>| =C2=A0 CFLAGS_x86_64_poky_linux_gnu =3D None=
<br>| =C2=A0 cargo:rerun-if-env-changed=3DTARGET_CFLAGS<br>| =C2=A0 TARGET_=
CFLAGS =3D None<br>| =C2=A0 cargo:rerun-if-env-changed=3DCFLAGS<br>| =C2=A0=
 CFLAGS =3D Some(&quot; -O2 -pipe -g -feliminate-unused-debug-types -fmacro=
-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-lin=
ux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=3D/usr/src/debug/pyth=
on3-cryptography/40.0.2-r0 =C2=A0-fdebug-prefix-map=3D/srv/build/ttorling/b=
uild-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/c=
ryptography-40.0.2=3D/usr/src/debug/python3-cryptography/40.0.2-r0 =C2=A0-f=
macro-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-pok=
y-linux/python3-cryptography/40.0.2-r0/build=3D/usr/src/debug/python3-crypt=
ography/40.0.2-r0 =C2=A0-fdebug-prefix-map=3D/srv/build/ttorling/build-upgr=
ades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build=3D/u=
sr/src/debug/python3-cryptography/40.0.2-r0 =C2=A0-fdebug-prefix-map=3D/srv=
/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptog=
raphy/40.0.2-r0/recipe-sysroot=3D =C2=A0-fmacro-prefix-map=3D/srv/build/tto=
rling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0=
.2-r0/recipe-sysroot=3D =C2=A0-fdebug-prefix-map=3D/srv/build/ttorling/buil=
d-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/reci=
pe-sysroot-native=3D &quot;)<br>| =C2=A0 cargo:rerun-if-env-changed=3DCRATE=
_CC_NO_DEFAULTS<br>| =C2=A0 CRATE_CC_NO_DEFAULTS =3D Some(&quot;1&quot;)<br=
>| =C2=A0 Info: default compiler flags are disabled<br>| =C2=A0 running: &q=
uot;x86_64-poky-linux-gcc&quot; &quot;-m64&quot; &quot;-march=3Dcore2&quot;=
 &quot;-mtune=3Dcore2&quot; &quot;-msse3&quot; &quot;-mfpmath=3Dsse&quot; &=
quot;-fstack-protector-strong&quot; &quot;-O2&quot; &quot;-D_FORTIFY_SOURCE=
=3D2&quot; &quot;-Wformat&quot; &quot;-Wformat-security&quot; &quot;-Werror=
=3Dformat-security&quot; &quot;--sysroot=3D/srv/build/ttorling/build-upgrad=
es/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysro=
ot&quot; &quot;-O2&quot; &quot;-pipe&quot; &quot;-g&quot; &quot;-feliminate=
-unused-debug-types&quot; &quot;-fmacro-prefix-map=3D/srv/build/ttorling/bu=
ild-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/cr=
yptography-40.0.2=3D/usr/src/debug/python3-cryptography/40.0.2-r0&quot; &qu=
ot;-fdebug-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=3D/usr/src/=
debug/python3-cryptography/40.0.2-r0&quot; &quot;-fmacro-prefix-map=3D/srv/=
build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptogr=
aphy/40.0.2-r0/build=3D/usr/src/debug/python3-cryptography/40.0.2-r0&quot; =
&quot;-fdebug-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core=
2-64-poky-linux/python3-cryptography/40.0.2-r0/build=3D/usr/src/debug/pytho=
n3-cryptography/40.0.2-r0&quot; &quot;-fdebug-prefix-map=3D/srv/build/ttorl=
ing/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2=
-r0/recipe-sysroot=3D&quot; &quot;-fmacro-prefix-map=3D/srv/build/ttorling/=
build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/=
recipe-sysroot=3D&quot; &quot;-fdebug-prefix-map=3D/srv/build/ttorling/buil=
d-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/reci=
pe-sysroot-native=3D&quot; &quot;-I&quot; &quot;/usr/include/python3.11&quo=
t; &quot;-I&quot; &quot;/srv/build/ttorling/build-upgrades/tmp/work/core2-6=
4-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/include&quot=
; &quot;-Wconversion&quot; &quot;-Wno-error=3Dsign-conversion&quot; &quot;-=
Wno-unused-parameter&quot; &quot;-DPy_LIMITED_API=3D0x030600f0&quot; &quot;=
-o&quot; &quot;/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-li=
nux/python3-cryptography/40.0.2-r0/build/target/x86_64-poky-linux-gnu/relea=
se/build/cryptography-rust-aa00e39a952c07ee/out/9f543b84f9f4dceb-_openssl.o=
&quot; &quot;-c&quot; &quot;/srv/build/ttorling/build-upgrades/tmp/work/cor=
e2-64-poky-linux/python3-cryptography/40.0.2-r0/build/target/x86_64-poky-li=
nux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/_openssl.c&quo=
t;<br>| =C2=A0 cargo:warning=3D/srv/build/ttorling/build-upgrades/tmp/work/=
core2-64-poky-linux/python3-cryptography/40.0.2-r0/build/target/x86_64-poky=
-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/_openssl.c:=
57:10: fatal error: Python.h: No such file or directory<br>| =C2=A0 cargo:w=
arning=3D =C2=A0 57 | #include &lt;Python.h&gt;<br>| =C2=A0 cargo:warning=
=3D =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~<br>|=
 =C2=A0 cargo:warning=3Dcompilation terminated.<br>| =C2=A0 exit status: 1<=
br>| <br>| =C2=A0 --- stderr<br></div><div><br></div><div>which I believe=
=C2=A0is happening during:</div><div><a href=3D"https://github.com/pyca/cry=
ptography/blob/40.0.x/src/rust/build.rs#L74" target=3D"_blank" rel=3D"noref=
errer">https://github.com/pyca/cryptography/blob/40.0.x/src/rust/build.rs#L=
74</a></div><div><br></div><div>I would appreciate input from any crustacea=
ns out there with a better understanding of what might be happening.</div><=
div><br></div><div>--Tim</div><div><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180834): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180834" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/180834</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98667212/6213=
388" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/98667212/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martin=
sons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a558bd05fad75bf2--

