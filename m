Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEACC46467
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 09:41:59 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.133818.1672047710159455579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 01:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l/mccRJp;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id vm8so18305821ejc.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K31NjjsMi0kfN19QQuqTMAdLJtwANRaaYYZMi1wpv8Q=;
        b=l/mccRJpe+qN4UJA1nfK/vljdehfanZ/ZbGp/Y5MTt+iirx++VUR5iOOAI/RpIH2V6
         ZM863fHJtL2I/1Lat5iNUiaCkx5OKw1RgGGM16P5QWdy+j8klp8X7kvWoQER1LPC1JNf
         hj+jA85JiwvlKbjU/4RGad7Q1se3SA8y2ps6l6388cwY+TZ249N2hs2JU5AvW2AW3eR0
         DV9K3trW5Nu9OB+kC3p2TUa2fL12bDs+FzuglgcjpJ3hmdOI3dx4oSSY49lyv89rMyV4
         g4e8pEgLCuH06/xhkK9k4Cer6RaGqno+MU/u2ZG1qV52znqPs2uk8BRFnb2wKvCuG2yx
         BHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K31NjjsMi0kfN19QQuqTMAdLJtwANRaaYYZMi1wpv8Q=;
        b=kuRuL07cN+SAesq6K3jYnGKPTcgpGksPaNXzPT6suqexIBhYWR0gwastE5+Meq7w2q
         MTNeD/iF/UktwAb0uCETxIG0qXsOHiNmJlUokV4Rc1/WwlxR2HeEcS/1LUan4nBBI7Fk
         79tAESCiQo3ycMoAvas2mJIar3sqdKOEiYC7SjlBnNOJXexb/qaRShI9K2cuVgTUTgJO
         8B+9ba1qwyjfYHYwO2m43zn8nxEl7EdITUn8VymrRtqqKj4I8kG/JtLtNBawaWLMxhyS
         6AzYFYHtIUOj7pqvLNp3gi9RnD3wNYNBkHUriX9+fNvCRJW6oZ7VLXv/91CX2R84qm3h
         suCA==
X-Gm-Message-State: AFqh2kqcZ6Plmax81V+mfC4FnC/zLKD0TM8hJEHeO/AdOCj1F/HPs6tT
	UNio9lMD9Hvi5WwXrO/YSMkw6mtqbOSMSksgE6I=
X-Google-Smtp-Source: AMrXdXvntNz2nPdNiEzNLcpB3PsKSP2X/uea1F7KYCarBwDKfV/MbGg3MlkffOXkGVmJmgD1wj47Bldb5itLNq39oLE=
X-Received: by 2002:a17:906:1311:b0:7c0:aa96:e934 with SMTP id
 w17-20020a170906131100b007c0aa96e934mr2183516ejb.309.1672047708412; Mon, 26
 Dec 2022 01:41:48 -0800 (PST)
MIME-Version: 1.0
References: <17342835AC830076.27785@lists.openembedded.org>
In-Reply-To: <17342835AC830076.27785@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 26 Dec 2022 09:41:37 +0000
Message-ID: <CAO5Uq5SqpQyL8PQHsFYDn8B7rios5EvpCni_5-JmzksAKWP0tw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v4 00/11] Add rust runtime tests
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b51fcb05f0b7f14e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 09:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175017

--000000000000b51fcb05f0b7f14e
Content-Type: text/plain; charset="UTF-8"

There's something odd happened here. Three of the patches in the previous
version I posted look to have been merged in poky, but not oe-core? I
thought the flow was from oe-core into poky.

On Sun, 25 Dec 2022, 21:59 Alex Kiernan via lists.openembedded.org,
<alex.kiernan=gmail.com@lists.openembedded.org> wrote:

>
> This series adds runtime tests for rust and cargo, merges (most of) the
> include files into the base recipes and fixes target cargo builds.
>
> Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part
> of packagegroup-core-sdk.
>
> Changes in v4:
> - Fixup `__stack_chk_fail_local` in musl-x86
> - Add crossbeam atomics fixes for ppc/mips
>
> Changes in v3:
> - Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LANGS
>   (which defaults to SDK_TOOLCHAIN_LANGS)
>
> Changes in v2:
> - Drop rust.inc/rust.bb merge, not actually made use of in the change
>   set
> - Reorder so cargo test goes after build fixes
>
> Alex Kiernan (11):
>   rust-llvm: Merge .inc into .bb
>   rust-llvm: Update LLVM_VERSION to match embedded version
>   packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
>   packagegroup-core-sdk: Add SDK toolchain language selection support
>   cargo: Merge .inc into .bb
>   cargo: Extend DEBUG_PREFIX_MAP to cover vendor
>   rust: Merge .inc into .bb
>   rust: Move musl-x86 fix for `__stack_chk_fail_local` to rust-source
>   cargo: Override crossbeam-utils with 0.8.14
>   packagegroup-rust-sdk-target: Add cargo
>   oeqa/runtime/rust: Add cargo test
>
>  meta/lib/oeqa/runtime/cases/rust.py           |  17 ++
>  .../packagegroups/packagegroup-core-sdk.bb    |  10 +-
>  .../packagegroup-rust-sdk-target.bb           |  14 ++
>  meta/recipes-devtools/cargo/cargo.inc         |  69 ------
>  meta/recipes-devtools/cargo/cargo_1.66.0.bb   |  80 ++++++-
>  meta/recipes-devtools/rust/rust-llvm.inc      |  78 ------
>  .../recipes-devtools/rust/rust-llvm_1.66.0.bb |  82 ++++++-
>  meta/recipes-devtools/rust/rust-source.inc    |   5 +
>  meta/recipes-devtools/rust/rust-target.inc    |  10 -
>  meta/recipes-devtools/rust/rust.inc           | 223 ------------------
>  meta/recipes-devtools/rust/rust_1.66.0.bb     | 223 +++++++++++++++++-
>  11 files changed, 420 insertions(+), 391 deletions(-)
>  create mode 100644 meta/recipes-core/packagegroups/
> packagegroup-rust-sdk-target.bb
>  delete mode 100644 meta/recipes-devtools/cargo/cargo.inc
>  delete mode 100644 meta/recipes-devtools/rust/rust-llvm.inc
>  delete mode 100644 meta/recipes-devtools/rust/rust-target.inc
>  delete mode 100644 meta/recipes-devtools/rust/rust.inc
>
> --
> 2.39.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174995):
> https://lists.openembedded.org/g/openembedded-core/message/174995
> Mute This Topic: https://lists.openembedded.org/mt/95880347/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b51fcb05f0b7f14e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>There&#39;s something odd happened here. Three of th=
e patches in the previous version I posted look to have been merged in poky=
, but not oe-core? I thought the flow was from oe-core into poky.<br><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 25 D=
ec 2022, 21:59 Alex Kiernan via <a href=3D"http://lists.openembedded.org" t=
arget=3D"_blank" rel=3D"noreferrer">lists.openembedded.org</a>, &lt;alex.ki=
ernan=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br>
This series adds runtime tests for rust and cargo, merges (most of) the<br>
include files into the base recipes and fixes target cargo builds.<br>
<br>
Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part<br>
of packagegroup-core-sdk.<br>
<br>
Changes in v4:<br>
- Fixup `__stack_chk_fail_local` in musl-x86<br>
- Add crossbeam atomics fixes for ppc/mips<br>
<br>
Changes in v3:<br>
- Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LANGS<br>
=C2=A0 (which defaults to SDK_TOOLCHAIN_LANGS)<br>
<br>
Changes in v2:<br>
- Drop rust.inc/<a href=3D"http://rust.bb" rel=3D"noreferrer noreferrer nor=
eferrer" target=3D"_blank">rust.bb</a> merge, not actually made use of in t=
he change<br>
=C2=A0 set<br>
- Reorder so cargo test goes after build fixes<br>
<br>
Alex Kiernan (11):<br>
=C2=A0 rust-llvm: Merge .inc into .bb<br>
=C2=A0 rust-llvm: Update LLVM_VERSION to match embedded version<br>
=C2=A0 packagegroup-rust-sdk-target: Add Rust SDK target packagegroup<br>
=C2=A0 packagegroup-core-sdk: Add SDK toolchain language selection support<=
br>
=C2=A0 cargo: Merge .inc into .bb<br>
=C2=A0 cargo: Extend DEBUG_PREFIX_MAP to cover vendor<br>
=C2=A0 rust: Merge .inc into .bb<br>
=C2=A0 rust: Move musl-x86 fix for `__stack_chk_fail_local` to rust-source<=
br>
=C2=A0 cargo: Override crossbeam-utils with 0.8.14<br>
=C2=A0 packagegroup-rust-sdk-target: Add cargo<br>
=C2=A0 oeqa/runtime/rust: Add cargo test<br>
<br>
=C2=A0meta/lib/oeqa/runtime/cases/rust.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 17 ++<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-core-sdk.bb" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">packagegroup-core-sdk.b=
b</a>=C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0.../<a href=3D"http://packagegroup-rust-sdk-target.bb" rel=3D"norefer=
rer noreferrer noreferrer" target=3D"_blank">packagegroup-rust-sdk-target.b=
b</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 ++<br>
=C2=A0meta/recipes-devtools/cargo/cargo.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 69 ------<br>
=C2=A0meta/recipes-devtools/cargo/<a href=3D"http://cargo_1.66.0.bb" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">cargo_1.66.0.bb</a>=C2=
=A0 =C2=A0|=C2=A0 80 ++++++-<br>
=C2=A0meta/recipes-devtools/rust/rust-llvm.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
78 ------<br>
=C2=A0.../recipes-devtools/rust/<a href=3D"http://rust-llvm_1.66.0.bb" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">rust-llvm_1.66.0.bb=
</a> |=C2=A0 82 ++++++-<br>
=C2=A0meta/recipes-devtools/rust/rust-source.inc=C2=A0 =C2=A0 |=C2=A0 =C2=
=A05 +<br>
=C2=A0meta/recipes-devtools/rust/rust-target.inc=C2=A0 =C2=A0 |=C2=A0 10 -<=
br>
=C2=A0meta/recipes-devtools/rust/rust.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 223 ------------------<br>
=C2=A0meta/recipes-devtools/rust/<a href=3D"http://rust_1.66.0.bb" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">rust_1.66.0.bb</a>=C2=A0=
 =C2=A0 =C2=A0| 223 +++++++++++++++++-<br>
=C2=A011 files changed, 420 insertions(+), 391 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/packagegroups/<a href=3D"http://=
packagegroup-rust-sdk-target.bb" rel=3D"noreferrer noreferrer noreferrer" t=
arget=3D"_blank">packagegroup-rust-sdk-target.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/cargo/cargo.inc<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rust/rust-llvm.inc<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rust/rust-target.inc<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rust/rust.inc<br>
<br>
-- <br>
2.39.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174995): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174995" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/=
174995</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95880347/3618=
097" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/mt/95880347/3618097</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-core+own=
er@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex=
.kiernan@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">alex.ki=
ernan@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</div></div>

--000000000000b51fcb05f0b7f14e--

