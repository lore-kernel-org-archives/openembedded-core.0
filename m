Return-Path: <dadleyy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2BFEE3F08
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 17:26:42 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.407.1694539595409550523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 10:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NfVyvuPd;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: dadleyy@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68fc081cd46so2249143b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 10:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694539594; x=1695144394; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gsB4zto0++fqxpvN6xcZ6CLfDNo4baw6Gq/oyszUw6E=;
        b=NfVyvuPdAElEag+7t5p+gzrlg1EMn2HwgWfDw0U5RboIbo9mbYXQt+7LhtHRQsqnJI
         lwbB1jdtxtMAD488SyMqTEGYlgIFrCs612nf45fLyTkojIf2UrMY8y5LJIhu2BtdLXz8
         vGRx8kzPH5IoRmJ87SSeEWPmi3LtasJXUNNjA+gLhgxzUf365VRxOUmPkENu0KVgQKwt
         j7jYvww+RROqmbGW20n41qByjHtifbGizatHSKbekFqozKFpZFEB3gxZeLdEJ7o+huZr
         t5SkrYuH5oKdlE6rTZT7+KA9PWlltbPZGK/iuj4ttdlcbnKo7TbFRaundkeHWS5SZ2RE
         44eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694539594; x=1695144394;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gsB4zto0++fqxpvN6xcZ6CLfDNo4baw6Gq/oyszUw6E=;
        b=qncIomLuUh+W2+/OpjQzsZLsL4X4v4a/ch/3VS14dwIsg9eSCsIGuvUwtpm2Feo0Av
         fzKSx0RokOsUmIEf3rVH1kznZp3q2q5Eae0Z/YDBu5VVRl8EFVJ5L6OpixipdORQrod6
         WOqfGCoeD9eezcWqpH2szUahlB9e4BzZszmHWDG8kn1DtHJfLkc4BI/bwdzUBiiOidLu
         YtrnOrGEAG/IrUzlnadiZMy/xXS013UOTD9PSB8rhcnedzt0ZesDhdYtri4b4UBpE/Ym
         jRt9e/+lE6KomY3266VAEgqp3pu0RQm1hGG79zvQnhSviZGACoc8DKHk3N80eQV7Nzi2
         kg8w==
X-Gm-Message-State: AOJu0YzwQ65leR6DHJgoKBaXS0eUNQGnmKJ2eoXWSaa4SLqGLXxCFHyx
	ezRIGCFcYXtIm3v3Cgkha3y4pmKgRgDJDVCdtrIAaSXY3Kfajg==
X-Google-Smtp-Source: AGHT+IGwb40boyXhQmoL5+W1RsGeqcuvPMAxmgZ6107Lq8b27qAYka1QY1LpI59eVOnkaJGjinF6h17y8A7FEk8D+/8=
X-Received: by 2002:a05:6a21:6d87:b0:154:a1e4:249 with SMTP id
 wl7-20020a056a216d8700b00154a1e40249mr93739pzb.13.1694539593589; Tue, 12 Sep
 2023 10:26:33 -0700 (PDT)
MIME-Version: 1.0
From: Danny <dadleyy@gmail.com>
Date: Tue, 12 Sep 2023 13:26:21 -0400
Message-ID: <CADEQF5GFW16EDaPdyiOTouH8nTeMG+TTdZerTHyStgAiKy+_Vw@mail.gmail.com>
Subject: mickledore - adding rust tooling to sdk seems to create problematic
 rustc/cargo executable configurations
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000088aa8806052cbe13"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 17:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187544

--00000000000088aa8806052cbe13
Content-Type: text/plain; charset="UTF-8"

Hey all!

I am working on rust project targeting the STM32MPU, (specifically the
stm32MP135F-DK). ST has provided two layers for supporting os development
on yocto:

their distro: https://github.com/STMicroelectronics/meta-st-openstlinux
their BSP: https://github.com/STMicroelectronics/meta-st-stm32mp

I have started to add rust support to the SDK by adding the following to my
`local.conf`:

```
TOOLCHAIN_HOST_TASK:append = " \
  packagegroup-rust-cross-canadian-${MACHINE} \
"
```

I can see this adding `rustc` and `cargo` binaries to the SDK (e.g `which
rustc` after sourcing the environment file prints
`<sdk-path>/sysroots/x86_64-ostl_sdk-linux/usr/bin/rustc`), but they are
not letting me compile the default binary project created with `cargo new`:

```
   Compiling demo v0.1.0 (/home/vboxuser/sdk-testing/demo)
error[E0463]: can't find crate for `std`
  |
  = note: the `armv7-unknown-linux-gnueabihf` target may not be installed
  = help: consider downloading the target with `rustup target add
armv7-unknown-linux-gnueabihf`

error: cannot find macro `println` in this scope
 --> src/main.rs:2:5
  |
2 |     println!("Hello, world!");
  |     ^^^^^^^

error: requires `sized` lang_item

For more information about this error, try `rustc --explain E0463`.
error: could not compile `demo` due to 3 previous errors
```

Would anyone know how I can go about debugging what the problem is here? I
originally thought it may have something to do with `TARGET_VENDOR`, but
clearing that value out (so that we get `unknown` in the triple) did not
seem to work.

For reference, the build configuration looks like:

```
Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "debian-11"
TARGET_SYS           = "arm-linux-gnueabi"
MACHINE              = "stm32mp13-disco"
DISTRO               = "openstlinux-weston"
DISTRO_VERSION       = "4.2.1-snapshot-20230912"
TUNE_FEATURES        = "arm vfp cortexa7 neon vfpv4 thumb
callconvention-hard"
TARGET_FPU           = "hard"
DISTRO_CODENAME      = "mickledore"
ACCEPT_EULA_stm32mp13-disco = "1"
GCCVERSION           = "12.%"
PREFERRED_PROVIDER_virtual/kernel = "linux-stm32mp"
meta-rauc            = "HEAD:c0dcec7b1b0d20862806915e12b4f332e5bef58c"
meta-python
meta-oe
meta-gnome
meta-initramfs
meta-multimedia
meta-networking
meta-webserver
meta-filesystems
meta-perl            = "HEAD:57c516973978ca2667339bf1aae7dc722b5bcac7"
meta-st-stm32mp      = "HEAD:931b3f5be2c00f55d114c8f9122082a9d229b776"
meta-qt5             = "HEAD:cf6ffcbad5275a3428f6046468a0c9d572e813d1"
meta-st-openstlinux  = "HEAD:8c780facff81d3c3878c5fdcd18bdd24fc36478d"
meta                 = "HEAD:ab232138f633b0521867216570ff81fcdceb3be1"
```

I can provide as much additional information as needed!

Thank you!
- Danny

--00000000000088aa8806052cbe13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey all!<div><br>I am working on rust project targeting th=
e STM32MPU, (specifically the stm32MP135F-DK). ST has provided=C2=A0two lay=
ers for supporting os development on yocto:<br><br></div><div>their distro:=
 <a href=3D"https://github.com/STMicroelectronics/meta-st-openstlinux">http=
s://github.com/STMicroelectronics/meta-st-openstlinux</a>=C2=A0<br></div><d=
iv>their BSP:=C2=A0<a href=3D"https://github.com/STMicroelectronics/meta-st=
-stm32mp">https://github.com/STMicroelectronics/meta-st-stm32mp</a></div><d=
iv><br></div><div>I have started to add rust support to the SDK by adding t=
he following to my `local.conf`:<br><br>```</div><font face=3D"monospace">T=
OOLCHAIN_HOST_TASK:append =3D &quot; \<br></font><div><font face=3D"monospa=
ce">=C2=A0 packagegroup-rust-cross-canadian-${MACHINE} \<br>&quot;</font></=
div><div>```<br></div><div><br></div><div>I can see this adding `rustc` and=
 `cargo` binaries to the SDK (e.g `which rustc` after sourcing the environm=
ent file prints `&lt;sdk-path&gt;/sysroots/x86_64-ostl_sdk-linux/usr/bin/ru=
stc`), but they are not letting me compile the default binary project creat=
ed with `cargo new`:</div><div><br></div><div>```</div><div><font face=3D"m=
onospace">=C2=A0 =C2=A0Compiling demo v0.1.0 (/home/vboxuser/sdk-testing/de=
mo)<br>error[E0463]: can&#39;t find crate for `std`<br>=C2=A0 |<br>=C2=A0 =
=3D note: the `armv7-unknown-linux-gnueabihf` target may not be installed<b=
r>=C2=A0 =3D help: consider downloading the target with `rustup target add =
armv7-unknown-linux-gnueabihf`<br><br>error: cannot find macro `println` in=
 this scope<br>=C2=A0--&gt; src/main.rs:2:5<br>=C2=A0 |<br>2 | =C2=A0 =C2=
=A0 println!(&quot;Hello, world!&quot;);<br>=C2=A0 | =C2=A0 =C2=A0 ^^^^^^^<=
br><br>error: requires `sized` lang_item<br><br>For more information about =
this error, try `rustc --explain E0463`.<br>error: could not compile `demo`=
 due to 3 previous errors</font><br>```</div><div><br></div><div>Would anyo=
ne know how I can go about debugging what the problem is here? I originally=
 thought it may have something to do with `TARGET_VENDOR`, but clearing tha=
t value out (so that we get `unknown` in the triple) did not seem to work.<=
/div><div><br></div><div>For reference, the build configuration looks like:=
</div><div><br></div><div>```</div><font face=3D"monospace">Build Configura=
tion:<br>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;2.4.0&quot=
;<br>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-li=
nux&quot;<br>NATIVELSBSTRING =C2=A0 =C2=A0 =C2=A0=3D &quot;debian-11&quot;<=
br>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-linux-gnueab=
i&quot;<br>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;stm32mp13-disco&quot;<br>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D &quot;openstlinux-weston&quot;<br>DISTRO_VERSION =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;4.2.1-snapshot-20230912&quot;<br>TUNE_FEATURES =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;arm vfp cortexa7 neon vfpv4 thumb callconvention=
-hard&quot;<br>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;hard=
&quot;<br>DISTRO_CODENAME =C2=A0 =C2=A0 =C2=A0=3D &quot;mickledore&quot;<br=
>ACCEPT_EULA_stm32mp13-disco =3D &quot;1&quot;<br>GCCVERSION =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;12.%&quot;<br>PREFERRED_PROVIDER_virtual/ker=
nel =3D &quot;linux-stm32mp&quot;<br>meta-rauc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;HEAD:c0dcec7b1b0d20862806915e12b4f332e5bef58c&quot;<=
br>meta-python =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>meta-oe =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>meta-gnome =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <br>meta-initramfs =C2=A0 =C2=A0 =C2=A0 <br>meta-multimedia =C2=
=A0 =C2=A0 =C2=A0<br>meta-networking =C2=A0 =C2=A0 =C2=A0<br>meta-webserver=
 =C2=A0 =C2=A0 =C2=A0 <br>meta-filesystems =C2=A0 =C2=A0 <br>meta-perl =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:57c516973978ca2667339b=
f1aae7dc722b5bcac7&quot;<br>meta-st-stm32mp =C2=A0 =C2=A0 =C2=A0=3D &quot;H=
EAD:931b3f5be2c00f55d114c8f9122082a9d229b776&quot;<br>meta-qt5 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:cf6ffcbad5275a3428f6046468a0=
c9d572e813d1&quot;<br>meta-st-openstlinux =C2=A0=3D &quot;HEAD:8c780facff81=
d3c3878c5fdcd18bdd24fc36478d&quot;<br></font><div><font face=3D"monospace">=
meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD=
:ab232138f633b0521867216570ff81fcdceb3be1&quot;</font></div><div>```<br></d=
iv><div><br></div><div>I can provide as much additional information as need=
ed!</div><div><br></div><div>Thank you!</div><div>- Danny</div></div>

--00000000000088aa8806052cbe13--

