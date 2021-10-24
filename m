Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4113BC433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Oct 2021 07:06:37 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.16089.1635059196005987070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Oct 2021 00:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fuawm3ir;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id e5so8757966uam.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Oct 2021 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=67Z/i+AJLurVVAxLqer0kR1Cb3qr6MPnVyer8qPdmWo=;
        b=fuawm3irv5We6HN4FAowpuJMYKqOLefiTf2bx3Vsdy03NR3zUflJNCy/HvqcShpbpz
         pi3L1EGzKkMegrobHT2Pd3mxPYJUk9zrDpbJ15dmLvvrIwrhooGXQhPZLVYlMiYbahBs
         IUhRkb8/zXyVvLgaRbryqT0ZuOeNsrAVsxjIbrDd1od+mRuT/I7V5qrFT7b/KJMKDe5b
         hLnwpZ9n/W1nl0g4wp/cSLknUAqdfeznnFYg7qE+hM38x1YBLFZ0qveNQF5I5ZMDGxhS
         etiqTKf0CFT5WSqE+BhRVdhBJCAqzHLdlnyPwPoU1DNs6pWnW5NJFkgSgmO+EkHCfoY5
         ndVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=67Z/i+AJLurVVAxLqer0kR1Cb3qr6MPnVyer8qPdmWo=;
        b=F7w3BFC3/ntq4g9YH7bUPpd2GQ1o327V0+YBQLUQK71OaiqeonZsu+en4dq34zHyyS
         lYlyuLLROvMuZxlZGyIokwRm+1+Lf9ro7uSYZ2vmuuNZtj+fWAjPAyoxfuFVd8wLLGSb
         KslJEth9wo7N0UbfcoaYDDPlrR7dGfurlIT06jd/OxvTv96K560f3nY0yILFVLOQrbpL
         2zdXqFAV3FTMA1ozDAirh7p4EyC/2Gq3OEKNCJuKeh/rNCkqSm9fhMCiFFCvGvGcfdm/
         UxtP+Q7rWVjyyv9MBkB4ZJssO0u2TxicJeYnkoO8tEIxxg+XCInSjvtMaqUOG+NpSMy0
         Er0w==
X-Gm-Message-State: AOAM532y0rrOZbcIRVoQxh7m28n2Q4IwiIuK7dgoTfXoWPJYgHeDiqZP
	pljrAZtcj1hKPoaM7nz1p5pNzrBRGBz2G9xm1+8=
X-Google-Smtp-Source: 
 ABdhPJw+cwAEEhOpUJaIfN/+dEbjEny41OzpGaWiZFKiGUoX4HGLfES1gj2EuwjV8n2TD6iIe9GeG2HJFWhumEM47mM=
X-Received: by 2002:a67:ae47:: with SMTP id u7mr9495632vsh.7.1635059194956;
 Sun, 24 Oct 2021 00:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211024065943.1880337-1-raj.khem@gmail.com>
In-Reply-To: <20211024065943.1880337-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 24 Oct 2021 09:06:23 +0200
Message-ID: 
 <CANNYZj-Zy7mu0r8hc3UfzKa5kZOvLhKr2SganknN8qDTVWRqwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] librsvg: Disable 64bit atomics in crossbeam
 for rv32
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000080915f05cf13e231"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Oct 2021 07:06:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157324

--00000000000080915f05cf13e231
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks :)

Alex

On Sun, 24 Oct 2021 at 08:59, Khem Raj <raj.khem@gmail.com> wrote:

> This fixes
> | error[E0412]: cannot find type `AtomicU64` in module `core::sync::atomi=
c`
> |     -->
> /usr/src/debug/librsvg/2.52.2-r0/librsvg-2.52.2/vendor/crossbeam-utils/sr=
c/atomic/
> consume.rs:  78:14
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Add riscv32 to NO_ATOMIC_CAS
>
>  ...m-utils-check-only-the-architecture-not-the-.patch | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git
> a/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-only-the-=
architecture-not-the-.patch
> b/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-only-the-=
architecture-not-the-.patch
> index 488c607480..0c1cf59eff 100644
> ---
> a/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-only-the-=
architecture-not-the-.patch
> +++
> b/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-only-the-=
architecture-not-the-.patch
> @@ -16,8 +16,6 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>   vendor/crossbeam-utils/no_atomic.rs         | 78 ++++++++-------------
>   3 files changed, 38 insertions(+), 52 deletions(-)
>
> -diff --git a/vendor/crossbeam-utils/.cargo-checksum.json
> b/vendor/crossbeam-utils/.cargo-checksum.json
> -index 4ffc417..2d476df 100644
>  --- a/vendor/crossbeam-utils/.cargo-checksum.json
>  +++ b/vendor/crossbeam-utils/.cargo-checksum.json
>  @@ -1 +1,3 @@
> @@ -25,9 +23,7 @@ index 4ffc417..2d476df 100644
>  \ No newline at end of file
>
>  +{"files":{"CHANGELOG.md":"5242f1740c65509c465c9a36326d344722facff5f5e58=
dd064f7b77806b83a46","Cargo.toml":"ac35a7b8ccb16f1ab256951576537aa4179a316c=
068929c2acef89e0adc12319","LICENSE-APACHE":"a60eea817514531668d7e0076573144=
9fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281e=
e9f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63=
c84b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/
> atomic_cell.rs
> ":"c927eb3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d",
>  +"build.rs
> ":"15c1a41a88373231cbc17c7de5ade07c6098455af9cdeef81b576f37ed923354",
> -+"no_atomic.rs
> ":"fda07862ab8c3ac999b58b494fa963e4024a0979037f4c37cf2069d78ab6e5ba","src=
/atomic/
> atomic_cell.rs
> ":"1a3a1e073340317b5ce7a94e29c6a87db89ff7e00da6b92cb3c0339364c3b084","src=
/atomic/
> consume.rs
> ":"7a7736fcd64f6473dfea7653559ffc5e1a2a234df43835f8aa8734862145ac15","src=
/atomic/
> mod.rs
> ":"7f6afd5bd0da1f7b51765ab04da4e5f683588ac2d23506e61bf7007bb1e61ba2","src=
/atomic/
> seq_lock.rs
> ":"27182e6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src=
/atomic/
> seq_lock_wide.rs
> ":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b09080088","src=
/
> backoff.rs
> ":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7eb0605806566af3","src=
/
> cache_padded.rs
> ":"6a512698115ad0d5a5b163dbd7a83247e1f1c146c4a30f3fc74b952e3b767b59","src=
/
> lib.rs
> ":"6f1bcf157abe06ad8458a53e865bf8efab9fad4a9424790147cee8fefb3795d8","src=
/sync/
> mod.rs
> ":"59986f559a8f170a4b3247ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src=
/sync/
> parker.rs
> ":"ba8f75bff31b8be9275808e8f393e71cc682dfc1109ceccb12f69a3700cff5be","src=
/sync/
> sharded_lock.rs
> ":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f","src=
/sync/
> wait_group.rs
> ":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa1d1f25990582cb6ea","src=
/
> thread.rs
> ":"0eb5ec1d3c1b40600d88eb70539d14276e32307f5bed2b679f50f6a20777a01e","tes=
ts/
> atomic_cell.rs
> ":"6c9453384ecbbe76f8b97b62f022d478d3a76b4eae1e960f49790970f5d52158","tes=
ts/
> cache_padded.rs
> ":"1bfaff8354c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tes=
ts/
> parker.rs
> ":"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tes=
ts/
> sharded_lock.rs
> ":"726025ce6351fb56ed629d5a56bdf6e833b7afc5dedfa08de0b056c726b6c26d","tes=
ts/
> thread.rs
> ":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62cec060d6cd09cab10","tes=
ts/
> wait_group.rs
> ":"ad8f0cdfed31f9594a2e0737234d418f8b924d784a4db8d7e469deab8c95f5f8"},"pa=
ckage":"d82cfc11ce7f2c3faef78d8a684447b40d503d9681acebed6cb728d45940c4db"}
> -diff --git a/vendor/crossbeam-utils/build.rs b/vendor/crossbeam-utils/
> build.rs
> -index 9c924ad..e97953c 100644
> ++"no_atomic.rs
> ":"dcbd845deda197b13361238a6aab60b6d8124fb588fd0b33740e127441db3f1a","src=
/atomic/
> atomic_cell.rs
> ":"1a3a1e073340317b5ce7a94e29c6a87db89ff7e00da6b92cb3c0339364c3b084","src=
/atomic/
> consume.rs
> ":"7a7736fcd64f6473dfea7653559ffc5e1a2a234df43835f8aa8734862145ac15","src=
/atomic/
> mod.rs
> ":"7f6afd5bd0da1f7b51765ab04da4e5f683588ac2d23506e61bf7007bb1e61ba2","src=
/atomic/
> seq_lock.rs
> ":"27182e6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src=
/atomic/
> seq_lock_wide.rs
> ":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b09080088","src=
/
> backoff.rs
> ":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7eb0605806566af3","src=
/
> cache_padded.rs
> ":"6a512698115ad0d5a5b163dbd7a83247e1f1c146c4a30f3fc74b952e3b767b59","src=
/
> lib.rs
> ":"6f1bcf157abe06ad8458a53e865bf8efab9fad4a9424790147cee8fefb3795d8","src=
/sync/
> mod.rs
> ":"59986f559a8f170a4b3247ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src=
/sync/
> parker.rs
> ":"ba8f75bff31b8be9275808e8f393e71cc682dfc1109ceccb12f69a3700cff5be","src=
/sync/
> sharded_lock.rs
> ":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f","src=
/sync/
> wait_group.rs
> ":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa1d1f25990582cb6ea","src=
/
> thread.rs
> ":"0eb5ec1d3c1b40600d88eb70539d14276e32307f5bed2b679f50f6a20777a01e","tes=
ts/
> atomic_cell.rs
> ":"6c9453384ecbbe76f8b97b62f022d478d3a76b4eae1e960f49790970f5d52158","tes=
ts/
> cache_padded.rs
> ":"1bfaff8354c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tes=
ts/
> parker.rs
> ":"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tes=
ts/
> sharded_lock.rs
> ":"726025ce6351fb56ed629d5a56bdf6e833b7afc5dedfa08de0b056c726b6c26d","tes=
ts/
> thread.rs
> ":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62cec060d6cd09cab10","tes=
ts/
> wait_group.rs
> ":"ad8f0cdfed31f9594a2e0737234d418f8b924d784a4db8d7e469deab8c95f5f8"},"pa=
ckage":"d82cfc11ce7f2c3faef78d8a684447b40d503d9681acebed6cb728d45940c4db"}
>  --- a/vendor/crossbeam-utils/build.rs
>  +++ b/vendor/crossbeam-utils/build.rs
>  @@ -20,17 +20,19 @@ fn main() {
> @@ -53,11 +49,9 @@ index 9c924ad..e97953c 100644
>           println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
>       } else {
>           // Otherwise, assuming `"max-atomic-width" =3D=3D 64`.
> -diff --git a/vendor/crossbeam-utils/no_atomic.rs
> b/vendor/crossbeam-utils/no_atomic.rs
> -index 522b3b8..8096630 100644
>  --- a/vendor/crossbeam-utils/no_atomic.rs
>  +++ b/vendor/crossbeam-utils/no_atomic.rs
> -@@ -2,58 +2,40 @@
> +@@ -2,58 +2,41 @@
>   // It is not intended for manual editing.
>
>   const NO_ATOMIC_CAS: &[&str] =3D &[
> @@ -125,6 +119,7 @@ index 522b3b8..8096630 100644
>  +    "mipsisa32r6",
>  +    "mipsisa32r6el",
>  +    "powerpc",
> ++    "riscv32",
>  +    "riscv32gc",
>  +    "riscv32imac",
>  +    "thumbv7em",
> --
> 2.33.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157323):
> https://lists.openembedded.org/g/openembedded-core/message/157323
> Mute This Topic: https://lists.openembedded.org/mt/86550391/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000080915f05cf13e231
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks :)</div><div><br></div><div>Alex<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On S=
un, 24 Oct 2021 at 08:59, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">This fixes<br>
| error[E0412]: cannot find type `AtomicU64` in module `core::sync::atomic`=
<br>
|=C2=A0 =C2=A0 =C2=A0--&gt; /usr/src/debug/librsvg/2.52.2-r0/librsvg-2.52.2=
/vendor/crossbeam-utils/src/atomic/<a href=3D"http://consume.rs" rel=3D"nor=
eferrer" target=3D"_blank">consume.rs</a>:=C2=A0 78:14<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2: Add riscv32 to NO_ATOMIC_CAS<br>
<br>
=C2=A0...m-utils-check-only-the-architecture-not-the-.patch | 11 +++-------=
-<br>
=C2=A01 file changed, 3 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-=
only-the-architecture-not-the-.patch b/meta/recipes-gnome/librsvg/librsvg/0=
001-crossbeam-utils-check-only-the-architecture-not-the-.patch<br>
index 488c607480..0c1cf59eff 100644<br>
--- a/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-only-th=
e-architecture-not-the-.patch<br>
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-only-th=
e-architecture-not-the-.patch<br>
@@ -16,8 +16,6 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:al=
ex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
=C2=A0 vendor/crossbeam-utils/<a href=3D"http://no_atomic.rs" rel=3D"norefe=
rrer" target=3D"_blank">no_atomic.rs</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 78 ++++++++-------------<br>
=C2=A0 3 files changed, 38 insertions(+), 52 deletions(-)<br>
<br>
-diff --git a/vendor/crossbeam-utils/.cargo-checksum.json b/vendor/crossbea=
m-utils/.cargo-checksum.json<br>
-index 4ffc417..2d476df 100644<br>
=C2=A0--- a/vendor/crossbeam-utils/.cargo-checksum.json<br>
=C2=A0+++ b/vendor/crossbeam-utils/.cargo-checksum.json<br>
=C2=A0@@ -1 +1,3 @@<br>
@@ -25,9 +23,7 @@ index 4ffc417..2d476df 100644<br>
=C2=A0\ No newline at end of file<br>
=C2=A0+{&quot;files&quot;:{&quot;CHANGELOG.md&quot;:&quot;5242f1740c65509c4=
65c9a36326d344722facff5f5e58dd064f7b77806b83a46&quot;,&quot;Cargo.toml&quot=
;:&quot;ac35a7b8ccb16f1ab256951576537aa4179a316c068929c2acef89e0adc12319&qu=
ot;,&quot;LICENSE-APACHE&quot;:&quot;a60eea817514531668d7e00765731449fe14d0=
59d3249e0bc93b36de45f759f2&quot;,&quot;LICENSE-MIT&quot;:&quot;5734ed989dfc=
a1f625b40281ee9f4530f91b2411ec01cb748223e7eb87e201ab&quot;,&quot;README.md&=
quot;:&quot;dfa9fbed47c344c134a63c84b7c0e4651baeac1554b7b3266d0e38643743fc3=
3&quot;,&quot;benches/<a href=3D"http://atomic_cell.rs" rel=3D"noreferrer" =
target=3D"_blank">atomic_cell.rs</a>&quot;:&quot;c927eb3cd1e5ecc4b91adbc3bd=
e98af15ffab4086190792ba64d5cde0e24df3d&quot;,<br>
=C2=A0+&quot;<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blan=
k">build.rs</a>&quot;:&quot;15c1a41a88373231cbc17c7de5ade07c6098455af9cdeef=
81b576f37ed923354&quot;,<br>
-+&quot;<a href=3D"http://no_atomic.rs" rel=3D"noreferrer" target=3D"_blank=
">no_atomic.rs</a>&quot;:&quot;fda07862ab8c3ac999b58b494fa963e4024a0979037f=
4c37cf2069d78ab6e5ba&quot;,&quot;src/atomic/<a href=3D"http://atomic_cell.r=
s" rel=3D"noreferrer" target=3D"_blank">atomic_cell.rs</a>&quot;:&quot;1a3a=
1e073340317b5ce7a94e29c6a87db89ff7e00da6b92cb3c0339364c3b084&quot;,&quot;sr=
c/atomic/<a href=3D"http://consume.rs" rel=3D"noreferrer" target=3D"_blank"=
>consume.rs</a>&quot;:&quot;7a7736fcd64f6473dfea7653559ffc5e1a2a234df43835f=
8aa8734862145ac15&quot;,&quot;src/atomic/<a href=3D"http://mod.rs" rel=3D"n=
oreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;7f6afd5bd0da1f7b51765ab=
04da4e5f683588ac2d23506e61bf7007bb1e61ba2&quot;,&quot;src/atomic/<a href=3D=
"http://seq_lock.rs" rel=3D"noreferrer" target=3D"_blank">seq_lock.rs</a>&q=
uot;:&quot;27182e6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a=
&quot;,&quot;src/atomic/<a href=3D"http://seq_lock_wide.rs" rel=3D"noreferr=
er" target=3D"_blank">seq_lock_wide.rs</a>&quot;:&quot;9888dd03116bb89ca36d=
4ab8d5a0b5032107a2983a7eb8024454263b09080088&quot;,&quot;src/<a href=3D"htt=
p://backoff.rs" rel=3D"noreferrer" target=3D"_blank">backoff.rs</a>&quot;:&=
quot;7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7eb0605806566af3&quot;=
,&quot;src/<a href=3D"http://cache_padded.rs" rel=3D"noreferrer" target=3D"=
_blank">cache_padded.rs</a>&quot;:&quot;6a512698115ad0d5a5b163dbd7a83247e1f=
1c146c4a30f3fc74b952e3b767b59&quot;,&quot;src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a>&quot;:&quot;6f1bcf157abe06ad84=
58a53e865bf8efab9fad4a9424790147cee8fefb3795d8&quot;,&quot;src/sync/<a href=
=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&q=
uot;59986f559a8f170a4b3247ab2eea2460b09809d87c8110ed88e4e7103d3519dc&quot;,=
&quot;src/sync/<a href=3D"http://parker.rs" rel=3D"noreferrer" target=3D"_b=
lank">parker.rs</a>&quot;:&quot;ba8f75bff31b8be9275808e8f393e71cc682dfc1109=
ceccb12f69a3700cff5be&quot;,&quot;src/sync/<a href=3D"http://sharded_lock.r=
s" rel=3D"noreferrer" target=3D"_blank">sharded_lock.rs</a>&quot;:&quot;14b=
e659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f&quot;,&quot;s=
rc/sync/<a href=3D"http://wait_group.rs" rel=3D"noreferrer" target=3D"_blan=
k">wait_group.rs</a>&quot;:&quot;32e946a7581c55f8aa9904527b92b177c538fa0cf7=
cbcfa1d1f25990582cb6ea&quot;,&quot;src/<a href=3D"http://thread.rs" rel=3D"=
noreferrer" target=3D"_blank">thread.rs</a>&quot;:&quot;0eb5ec1d3c1b40600d8=
8eb70539d14276e32307f5bed2b679f50f6a20777a01e&quot;,&quot;tests/<a href=3D"=
http://atomic_cell.rs" rel=3D"noreferrer" target=3D"_blank">atomic_cell.rs<=
/a>&quot;:&quot;6c9453384ecbbe76f8b97b62f022d478d3a76b4eae1e960f49790970f5d=
52158&quot;,&quot;tests/<a href=3D"http://cache_padded.rs" rel=3D"noreferre=
r" target=3D"_blank">cache_padded.rs</a>&quot;:&quot;1bfaff8354c8184e1ee1f9=
02881ca9400b60effb273b0d3f752801a483d2b66d&quot;,&quot;tests/<a href=3D"htt=
p://parker.rs" rel=3D"noreferrer" target=3D"_blank">parker.rs</a>&quot;:&qu=
ot;6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20&quot;,&=
quot;tests/<a href=3D"http://sharded_lock.rs" rel=3D"noreferrer" target=3D"=
_blank">sharded_lock.rs</a>&quot;:&quot;726025ce6351fb56ed629d5a56bdf6e833b=
7afc5dedfa08de0b056c726b6c26d&quot;,&quot;tests/<a href=3D"http://thread.rs=
" rel=3D"noreferrer" target=3D"_blank">thread.rs</a>&quot;:&quot;9a7d7d3028=
c552fd834c68598b04a1cc252a816bc20ab62cec060d6cd09cab10&quot;,&quot;tests/<a=
 href=3D"http://wait_group.rs" rel=3D"noreferrer" target=3D"_blank">wait_gr=
oup.rs</a>&quot;:&quot;ad8f0cdfed31f9594a2e0737234d418f8b924d784a4db8d7e469=
deab8c95f5f8&quot;},&quot;package&quot;:&quot;d82cfc11ce7f2c3faef78d8a68444=
7b40d503d9681acebed6cb728d45940c4db&quot;}<br>
-diff --git a/vendor/crossbeam-utils/<a href=3D"http://build.rs" rel=3D"nor=
eferrer" target=3D"_blank">build.rs</a> b/vendor/crossbeam-utils/<a href=3D=
"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a><br>
-index 9c924ad..e97953c 100644<br>
++&quot;<a href=3D"http://no_atomic.rs" rel=3D"noreferrer" target=3D"_blank=
">no_atomic.rs</a>&quot;:&quot;dcbd845deda197b13361238a6aab60b6d8124fb588fd=
0b33740e127441db3f1a&quot;,&quot;src/atomic/<a href=3D"http://atomic_cell.r=
s" rel=3D"noreferrer" target=3D"_blank">atomic_cell.rs</a>&quot;:&quot;1a3a=
1e073340317b5ce7a94e29c6a87db89ff7e00da6b92cb3c0339364c3b084&quot;,&quot;sr=
c/atomic/<a href=3D"http://consume.rs" rel=3D"noreferrer" target=3D"_blank"=
>consume.rs</a>&quot;:&quot;7a7736fcd64f6473dfea7653559ffc5e1a2a234df43835f=
8aa8734862145ac15&quot;,&quot;src/atomic/<a href=3D"http://mod.rs" rel=3D"n=
oreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;7f6afd5bd0da1f7b51765ab=
04da4e5f683588ac2d23506e61bf7007bb1e61ba2&quot;,&quot;src/atomic/<a href=3D=
"http://seq_lock.rs" rel=3D"noreferrer" target=3D"_blank">seq_lock.rs</a>&q=
uot;:&quot;27182e6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a=
&quot;,&quot;src/atomic/<a href=3D"http://seq_lock_wide.rs" rel=3D"noreferr=
er" target=3D"_blank">seq_lock_wide.rs</a>&quot;:&quot;9888dd03116bb89ca36d=
4ab8d5a0b5032107a2983a7eb8024454263b09080088&quot;,&quot;src/<a href=3D"htt=
p://backoff.rs" rel=3D"noreferrer" target=3D"_blank">backoff.rs</a>&quot;:&=
quot;7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7eb0605806566af3&quot;=
,&quot;src/<a href=3D"http://cache_padded.rs" rel=3D"noreferrer" target=3D"=
_blank">cache_padded.rs</a>&quot;:&quot;6a512698115ad0d5a5b163dbd7a83247e1f=
1c146c4a30f3fc74b952e3b767b59&quot;,&quot;src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a>&quot;:&quot;6f1bcf157abe06ad84=
58a53e865bf8efab9fad4a9424790147cee8fefb3795d8&quot;,&quot;src/sync/<a href=
=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&q=
uot;59986f559a8f170a4b3247ab2eea2460b09809d87c8110ed88e4e7103d3519dc&quot;,=
&quot;src/sync/<a href=3D"http://parker.rs" rel=3D"noreferrer" target=3D"_b=
lank">parker.rs</a>&quot;:&quot;ba8f75bff31b8be9275808e8f393e71cc682dfc1109=
ceccb12f69a3700cff5be&quot;,&quot;src/sync/<a href=3D"http://sharded_lock.r=
s" rel=3D"noreferrer" target=3D"_blank">sharded_lock.rs</a>&quot;:&quot;14b=
e659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f&quot;,&quot;s=
rc/sync/<a href=3D"http://wait_group.rs" rel=3D"noreferrer" target=3D"_blan=
k">wait_group.rs</a>&quot;:&quot;32e946a7581c55f8aa9904527b92b177c538fa0cf7=
cbcfa1d1f25990582cb6ea&quot;,&quot;src/<a href=3D"http://thread.rs" rel=3D"=
noreferrer" target=3D"_blank">thread.rs</a>&quot;:&quot;0eb5ec1d3c1b40600d8=
8eb70539d14276e32307f5bed2b679f50f6a20777a01e&quot;,&quot;tests/<a href=3D"=
http://atomic_cell.rs" rel=3D"noreferrer" target=3D"_blank">atomic_cell.rs<=
/a>&quot;:&quot;6c9453384ecbbe76f8b97b62f022d478d3a76b4eae1e960f49790970f5d=
52158&quot;,&quot;tests/<a href=3D"http://cache_padded.rs" rel=3D"noreferre=
r" target=3D"_blank">cache_padded.rs</a>&quot;:&quot;1bfaff8354c8184e1ee1f9=
02881ca9400b60effb273b0d3f752801a483d2b66d&quot;,&quot;tests/<a href=3D"htt=
p://parker.rs" rel=3D"noreferrer" target=3D"_blank">parker.rs</a>&quot;:&qu=
ot;6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20&quot;,&=
quot;tests/<a href=3D"http://sharded_lock.rs" rel=3D"noreferrer" target=3D"=
_blank">sharded_lock.rs</a>&quot;:&quot;726025ce6351fb56ed629d5a56bdf6e833b=
7afc5dedfa08de0b056c726b6c26d&quot;,&quot;tests/<a href=3D"http://thread.rs=
" rel=3D"noreferrer" target=3D"_blank">thread.rs</a>&quot;:&quot;9a7d7d3028=
c552fd834c68598b04a1cc252a816bc20ab62cec060d6cd09cab10&quot;,&quot;tests/<a=
 href=3D"http://wait_group.rs" rel=3D"noreferrer" target=3D"_blank">wait_gr=
oup.rs</a>&quot;:&quot;ad8f0cdfed31f9594a2e0737234d418f8b924d784a4db8d7e469=
deab8c95f5f8&quot;},&quot;package&quot;:&quot;d82cfc11ce7f2c3faef78d8a68444=
7b40d503d9681acebed6cb728d45940c4db&quot;}<br>
=C2=A0--- a/vendor/crossbeam-utils/<a href=3D"http://build.rs" rel=3D"noref=
errer" target=3D"_blank">build.rs</a><br>
=C2=A0+++ b/vendor/crossbeam-utils/<a href=3D"http://build.rs" rel=3D"noref=
errer" target=3D"_blank">build.rs</a><br>
=C2=A0@@ -20,17 +20,19 @@ fn main() {<br>
@@ -53,11 +49,9 @@ index 9c924ad..e97953c 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rustc-cfg=3Dcrossbe=
am_no_atomic_64&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Otherwise, assuming `&quot;max-atomic=
-width&quot; =3D=3D 64`.<br>
-diff --git a/vendor/crossbeam-utils/<a href=3D"http://no_atomic.rs" rel=3D=
"noreferrer" target=3D"_blank">no_atomic.rs</a> b/vendor/crossbeam-utils/<a=
 href=3D"http://no_atomic.rs" rel=3D"noreferrer" target=3D"_blank">no_atomi=
c.rs</a><br>
-index 522b3b8..8096630 100644<br>
=C2=A0--- a/vendor/crossbeam-utils/<a href=3D"http://no_atomic.rs" rel=3D"n=
oreferrer" target=3D"_blank">no_atomic.rs</a><br>
=C2=A0+++ b/vendor/crossbeam-utils/<a href=3D"http://no_atomic.rs" rel=3D"n=
oreferrer" target=3D"_blank">no_atomic.rs</a><br>
-@@ -2,58 +2,40 @@<br>
+@@ -2,58 +2,41 @@<br>
=C2=A0 // It is not intended for manual editing.<br>
<br>
=C2=A0 const NO_ATOMIC_CAS: &amp;[&amp;str] =3D &amp;[<br>
@@ -125,6 +119,7 @@ index 522b3b8..8096630 100644<br>
=C2=A0+=C2=A0 =C2=A0 &quot;mipsisa32r6&quot;,<br>
=C2=A0+=C2=A0 =C2=A0 &quot;mipsisa32r6el&quot;,<br>
=C2=A0+=C2=A0 =C2=A0 &quot;powerpc&quot;,<br>
++=C2=A0 =C2=A0 &quot;riscv32&quot;,<br>
=C2=A0+=C2=A0 =C2=A0 &quot;riscv32gc&quot;,<br>
=C2=A0+=C2=A0 =C2=A0 &quot;riscv32imac&quot;,<br>
=C2=A0+=C2=A0 =C2=A0 &quot;thumbv7em&quot;,<br>
-- <br>
2.33.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157323): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157323" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157323</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86550391/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86550391/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000080915f05cf13e231--

