Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C820C77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 17:31:11 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.26380.1683135064956422372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 10:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VRWPsDwB;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-b9ddcf0afb3so6153515276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 10:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683135064; x=1685727064;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B9vFzMFD8XFGEUQbdVFHVcihr6WO8zkJLx4oU9nOo5M=;
        b=VRWPsDwB2RmD1BaqaFBaQN8f1tiexcdoq7usH8YwJCPueYeYEuA97fLPUzvhCfD8YR
         ItHmu7ns2J/o4INIRmJxv+6n7r46T50x8vc1Xs+CmU5cjzIyGzmPORLxEI65J4PyDf7b
         xPuiDMIzJczTsnGAwYZOTJFNbD63O0PF5TxTfuQ1uHCGyKL5XY8Z23pd5FFc284LBwA9
         kc5fOmAkpdMWcXM66NkCDq5hAHkEjaoueyG6v+EhOQ2RfNKjNyX1S2iAn0XEg1Gjj40p
         t2Lf9KhftJgyuvxgVlcOtpiZtUYCmOaOLJ7RxudY4b3LshpX9u66iMGqHfbjFO+i0g+M
         /9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683135064; x=1685727064;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B9vFzMFD8XFGEUQbdVFHVcihr6WO8zkJLx4oU9nOo5M=;
        b=khFVHtdlSSQV2rxkLTmhDdh0siqbfJD0neVfaSJHcLNeTEXVNz05TRfoDDHQFRk47l
         zfmXP52Y9fm21VLSmbZEOKAIvvrp60+0gpqiSGfzTCwkRBwfCusfa/q46s8JLVR4idSe
         pU9A8e0zB5LINJ+oZuzhA0c9dhgCTBmmSpjWX20V2bBaPAMXWevUIWLVllRKc6jjR+x+
         cUkWEApHVA1IvFZkfKv0j5JrBd+HaVD7o60BDhH5QVF3B6tXVODw6t+r5aFi2UrIIWHX
         vL/hUaSSXjwMMiDDnqbN4apdfVIrCsC+3eT9KdA0ztRjh5CB/XQkqkjam6AZpWwFoWjV
         IjkQ==
X-Gm-Message-State: AC+VfDySWtCzX85NRJjGH/pH8d36LLz2TnXu5mUKHqEFAng2j4wTbwCO
	5lShuO5Tz8LvhclF9MLRs2ybaPGpj2d4xdO5nu6hvVStBQ4=
X-Google-Smtp-Source: ACHHUZ4QHe9bPwGm/ARe2BMcpdKDZ1DmnSv8oKN33yVBs5Us6tFU5HkfO6kX42KPg8uckAMD3Z8jqign2Fk0n05us1Y=
X-Received: by 2002:a25:73cf:0:b0:b99:71dd:869 with SMTP id
 o198-20020a2573cf000000b00b9971dd0869mr20736383ybc.53.1683135063557; Wed, 03
 May 2023 10:31:03 -0700 (PDT)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 3 May 2023 10:30:52 -0700
Message-ID: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
Subject: [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009289a005facd6b05"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 17:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180834

--0000000000009289a005facd6b05
Content-Type: text/plain; charset="UTF-8"

I am working on an upgrade from 39.0.2 to 40.0.2 for python3-cryptography:
https://git.yoctoproject.org/poky-contrib/log/?h=timo/python3-cryptography_40.0.2

The patch at the tip of HEAD is perhaps not needed, as the compiling of
`openssl-sys` was not the problem. We might need tweaks to not vendor
OpenSSL, but I do not think this is the root of the problem right now.

The issue I am struggling with is "Python.h" is not being found:
|   cargo:rerun-if-env-changed=CRATE_CC_NO_DEFAULTS
|   CRATE_CC_NO_DEFAULTS = Some("1")
|   Info: default compiler flags are disabled
|   cargo:rerun-if-env-changed=CC_x86_64-poky-linux-gnu
|   CC_x86_64-poky-linux-gnu = None
|   cargo:rerun-if-env-changed=CC_x86_64_poky_linux_gnu
|   CC_x86_64_poky_linux_gnu = None
|   cargo:rerun-if-env-changed=TARGET_CC
|   TARGET_CC = None
|   cargo:rerun-if-env-changed=CC
|   CC = Some("x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3
-mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security
--sysroot=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot")
|   cargo:rerun-if-env-changed=CFLAGS_x86_64-poky-linux-gnu
|   CFLAGS_x86_64-poky-linux-gnu = None
|   cargo:rerun-if-env-changed=CFLAGS_x86_64_poky_linux_gnu
|   CFLAGS_x86_64_poky_linux_gnu = None
|   cargo:rerun-if-env-changed=TARGET_CFLAGS
|   TARGET_CFLAGS = None
|   cargo:rerun-if-env-changed=CFLAGS
|   CFLAGS = Some(" -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=/usr/src/debug/python3-cryptography/40.0.2-r0
 -fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=/usr/src/debug/python3-cryptography/40.0.2-r0
 -fmacro-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build=/usr/src/debug/python3-cryptography/40.0.2-r0
 -fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build=/usr/src/debug/python3-cryptography/40.0.2-r0
 -fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot=
 -fmacro-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot=
 -fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native=
")
|   cargo:rerun-if-env-changed=CRATE_CC_NO_DEFAULTS
|   CRATE_CC_NO_DEFAULTS = Some("1")
|   Info: default compiler flags are disabled
|   running: "x86_64-poky-linux-gcc" "-m64" "-march=core2" "-mtune=core2"
"-msse3" "-mfpmath=sse" "-fstack-protector-strong" "-O2"
"-D_FORTIFY_SOURCE=2" "-Wformat" "-Wformat-security"
"-Werror=format-security"
"--sysroot=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot"
"-O2" "-pipe" "-g" "-feliminate-unused-debug-types"
"-fmacro-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=/usr/src/debug/python3-cryptography/40.0.2-r0"
"-fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=/usr/src/debug/python3-cryptography/40.0.2-r0"
"-fmacro-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build=/usr/src/debug/python3-cryptography/40.0.2-r0"
"-fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build=/usr/src/debug/python3-cryptography/40.0.2-r0"
"-fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot="
"-fmacro-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot="
"-fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native="
"-I" "/usr/include/python3.11" "-I"
"/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/include"
"-Wconversion" "-Wno-error=sign-conversion" "-Wno-unused-parameter"
"-DPy_LIMITED_API=0x030600f0" "-o"
"/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/9f543b84f9f4dceb-_openssl.o"
"-c"
"/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/_openssl.c"
|
cargo:warning=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/_openssl.c:57:10:
fatal error: Python.h: No such file or directory
|   cargo:warning=   57 | #include <Python.h>
|   cargo:warning=      |          ^~~~~~~~~~
|   cargo:warning=compilation terminated.
|   exit status: 1
|
|   --- stderr

which I believe is happening during:
https://github.com/pyca/cryptography/blob/40.0.x/src/rust/build.rs#L74

I would appreciate input from any crustaceans out there with a better
understanding of what might be happening.

--Tim

--0000000000009289a005facd6b05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am working=C2=A0on an upgrade from 39.0.2 to 40.0.2 for =
python3-cryptography:<div><a href=3D"https://git.yoctoproject.org/poky-cont=
rib/log/?h=3Dtimo/python3-cryptography_40.0.2">https://git.yoctoproject.org=
/poky-contrib/log/?h=3Dtimo/python3-cryptography_40.0.2</a><br></div><div><=
br></div><div>The patch at the tip of HEAD is perhaps not needed, as the co=
mpiling of `openssl-sys` was not the problem. We might need tweaks to not v=
endor OpenSSL, but I do not think this is the root of the problem right now=
.</div><div><br></div><div>The issue I am struggling with is &quot;Python.h=
&quot; is not being found:</div><div>| =C2=A0 cargo:rerun-if-env-changed=3D=
CRATE_CC_NO_DEFAULTS<br>| =C2=A0 CRATE_CC_NO_DEFAULTS =3D Some(&quot;1&quot=
;)<br>| =C2=A0 Info: default compiler flags are disabled<br>| =C2=A0 cargo:=
rerun-if-env-changed=3DCC_x86_64-poky-linux-gnu<br>| =C2=A0 CC_x86_64-poky-=
linux-gnu =3D None<br>| =C2=A0 cargo:rerun-if-env-changed=3DCC_x86_64_poky_=
linux_gnu<br>| =C2=A0 CC_x86_64_poky_linux_gnu =3D None<br>| =C2=A0 cargo:r=
erun-if-env-changed=3DTARGET_CC<br>| =C2=A0 TARGET_CC =3D None<br>| =C2=A0 =
cargo:rerun-if-env-changed=3DCC<br>| =C2=A0 CC =3D Some(&quot;x86_64-poky-l=
inux-gcc =C2=A0-m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fs=
tack-protector-strong =C2=A0-O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-sec=
urity -Werror=3Dformat-security --sysroot=3D/srv/build/ttorling/build-upgra=
des/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysr=
oot&quot;)<br>| =C2=A0 cargo:rerun-if-env-changed=3DCFLAGS_x86_64-poky-linu=
x-gnu<br>| =C2=A0 CFLAGS_x86_64-poky-linux-gnu =3D None<br>| =C2=A0 cargo:r=
erun-if-env-changed=3DCFLAGS_x86_64_poky_linux_gnu<br>| =C2=A0 CFLAGS_x86_6=
4_poky_linux_gnu =3D None<br>| =C2=A0 cargo:rerun-if-env-changed=3DTARGET_C=
FLAGS<br>| =C2=A0 TARGET_CFLAGS =3D None<br>| =C2=A0 cargo:rerun-if-env-cha=
nged=3DCFLAGS<br>| =C2=A0 CFLAGS =3D Some(&quot; -O2 -pipe -g -feliminate-u=
nused-debug-types -fmacro-prefix-map=3D/srv/build/ttorling/build-upgrades/t=
mp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.=
0.2=3D/usr/src/debug/python3-cryptography/40.0.2-r0 =C2=A0-fdebug-prefix-ma=
p=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3=
-cryptography/40.0.2-r0/cryptography-40.0.2=3D/usr/src/debug/python3-crypto=
graphy/40.0.2-r0 =C2=A0-fmacro-prefix-map=3D/srv/build/ttorling/build-upgra=
des/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build=3D/us=
r/src/debug/python3-cryptography/40.0.2-r0 =C2=A0-fdebug-prefix-map=3D/srv/=
build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptogr=
aphy/40.0.2-r0/build=3D/usr/src/debug/python3-cryptography/40.0.2-r0 =C2=A0=
-fdebug-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-p=
oky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot=3D =C2=A0-fmacro-pr=
efix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/=
python3-cryptography/40.0.2-r0/recipe-sysroot=3D =C2=A0-fdebug-prefix-map=
=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-=
cryptography/40.0.2-r0/recipe-sysroot-native=3D &quot;)<br>| =C2=A0 cargo:r=
erun-if-env-changed=3DCRATE_CC_NO_DEFAULTS<br>| =C2=A0 CRATE_CC_NO_DEFAULTS=
 =3D Some(&quot;1&quot;)<br>| =C2=A0 Info: default compiler flags are disab=
led<br>| =C2=A0 running: &quot;x86_64-poky-linux-gcc&quot; &quot;-m64&quot;=
 &quot;-march=3Dcore2&quot; &quot;-mtune=3Dcore2&quot; &quot;-msse3&quot; &=
quot;-mfpmath=3Dsse&quot; &quot;-fstack-protector-strong&quot; &quot;-O2&qu=
ot; &quot;-D_FORTIFY_SOURCE=3D2&quot; &quot;-Wformat&quot; &quot;-Wformat-s=
ecurity&quot; &quot;-Werror=3Dformat-security&quot; &quot;--sysroot=3D/srv/=
build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptogr=
aphy/40.0.2-r0/recipe-sysroot&quot; &quot;-O2&quot; &quot;-pipe&quot; &quot=
;-g&quot; &quot;-feliminate-unused-debug-types&quot; &quot;-fmacro-prefix-m=
ap=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python=
3-cryptography/40.0.2-r0/cryptography-40.0.2=3D/usr/src/debug/python3-crypt=
ography/40.0.2-r0&quot; &quot;-fdebug-prefix-map=3D/srv/build/ttorling/buil=
d-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/cryp=
tography-40.0.2=3D/usr/src/debug/python3-cryptography/40.0.2-r0&quot; &quot=
;-fmacro-prefix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-=
poky-linux/python3-cryptography/40.0.2-r0/build=3D/usr/src/debug/python3-cr=
yptography/40.0.2-r0&quot; &quot;-fdebug-prefix-map=3D/srv/build/ttorling/b=
uild-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/b=
uild=3D/usr/src/debug/python3-cryptography/40.0.2-r0&quot; &quot;-fdebug-pr=
efix-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/=
python3-cryptography/40.0.2-r0/recipe-sysroot=3D&quot; &quot;-fmacro-prefix=
-map=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/pyth=
on3-cryptography/40.0.2-r0/recipe-sysroot=3D&quot; &quot;-fdebug-prefix-map=
=3D/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-=
cryptography/40.0.2-r0/recipe-sysroot-native=3D&quot; &quot;-I&quot; &quot;=
/usr/include/python3.11&quot; &quot;-I&quot; &quot;/srv/build/ttorling/buil=
d-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/reci=
pe-sysroot/usr/include&quot; &quot;-Wconversion&quot; &quot;-Wno-error=3Dsi=
gn-conversion&quot; &quot;-Wno-unused-parameter&quot; &quot;-DPy_LIMITED_AP=
I=3D0x030600f0&quot; &quot;-o&quot; &quot;/srv/build/ttorling/build-upgrade=
s/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build/target/=
x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/=
9f543b84f9f4dceb-_openssl.o&quot; &quot;-c&quot; &quot;/srv/build/ttorling/=
build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/=
build/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a=
952c07ee/out/_openssl.c&quot;<br>| =C2=A0 cargo:warning=3D/srv/build/ttorli=
ng/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-=
r0/build/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e=
39a952c07ee/out/_openssl.c:57:10: fatal error: Python.h: No such file or di=
rectory<br>| =C2=A0 cargo:warning=3D =C2=A0 57 | #include &lt;Python.h&gt;<=
br>| =C2=A0 cargo:warning=3D =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~<br>| =C2=A0 cargo:warning=3Dcompilation terminated.<br=
>| =C2=A0 exit status: 1<br>| <br>| =C2=A0 --- stderr<br></div><div><br></d=
iv><div>which I believe=C2=A0is happening during:</div><div><a href=3D"http=
s://github.com/pyca/cryptography/blob/40.0.x/src/rust/build.rs#L74">https:/=
/github.com/pyca/cryptography/blob/40.0.x/src/rust/build.rs#L74</a></div><d=
iv><br></div><div>I would appreciate input from any crustaceans out there w=
ith a better understanding of what might be happening.</div><div><br></div>=
<div>--Tim</div><div><br></div></div>

--0000000000009289a005facd6b05--

