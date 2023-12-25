Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC16C3DA6E
	for <webhook@archiver.kernel.org>; Mon, 25 Dec 2023 16:42:06 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.62223.1703522517275422739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Dec 2023 08:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WlRflghN;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5945fef58caso1040101eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Dec 2023 08:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703522516; x=1704127316; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O36MwXxn3MICm5wG0NIN4pLolr2355V3qrKU9ZrW4XE=;
        b=WlRflghNP8bBI0xmOWJV9w/tNRT3gXYlWuSlTG5q8QLY0DS3PN9NNJA2mBUVYFgTRD
         6zaDEDCBBjzmbiiOZ6QwrNLZT9w9iWMweeWfHjGgHiEwnWfc6AkSBaqFa85cjUHDFwPB
         Q8QCF3ZAtYFq718Vv6mTKhREW5oafqI2Yr28rA65TOtVdc/Ouvw8/+5FvZh/oYcUaoAD
         ovj9Rfp0IP5VWlN4n8Nyqve7AxbOWBrCy+oNmq7cArN8qSQ4Os1PC761sjUZSnJGN8NI
         Hrs2HlK0E2YIPI8B44658mLMabCeJv7D8lCYh93FruCA9HBSsduJBLt/JvouUUzOK5md
         lprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703522516; x=1704127316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O36MwXxn3MICm5wG0NIN4pLolr2355V3qrKU9ZrW4XE=;
        b=FtDYm/r2MmvcHH80Y05v0wt0blO4dORItTe3Cq2oPAtPaf9ebmHhdXiQGsQ06LeoO6
         vqg3fuBjds9h+vaCowH7fr1hLR+2SMPTivDvPNUt647+z/SAj2DUjQ+e0URE+vChJkGP
         L6d/MjS3TAd3mtizguo77zpKRYOMraG/uVrLY0RNMnDtkdkf6PV5t6plZsfbxEULOVYo
         WWvNqfAzX+9QHERYc55q6Nzjb85fOxmVQ/y/FpCBsK18Z7Cu1CrioLEdzd7XvAjbRLni
         FFSj++PXPDP2u5vlxKMqSO94YzaluD1FZ4HnzaJqxdHyfiBSaHZaL0PGF3SXHcbAwquM
         8N2w==
X-Gm-Message-State: AOJu0YxavKs0gnNByz35MRrkW7kRQwfMJ9R3plCZ0S745ymKW7TCNNzR
	rZCy+efxivjUvwhnWTOiOgI9FxSdkpuWayf63Fk=
X-Google-Smtp-Source: AGHT+IE1WUe4EFINjlU8DOHvlfe6USYBX6Pw295q1FWhnhMtETIubteyMVMSexcO9bH9xQk0w/HWTUN1VYv7TWTGaI0=
X-Received: by 2002:a05:6808:1189:b0:3ba:131b:325a with SMTP id
 j9-20020a056808118900b003ba131b325amr5383676oil.94.1703522516225; Mon, 25 Dec
 2023 08:41:56 -0800 (PST)
MIME-Version: 1.0
References: <20231224230934.831-1-alex.kiernan@gmail.com>
In-Reply-To: <20231224230934.831-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Dec 2023 08:41:45 -0800
Message-ID: <CAMKF1spzruYgoQiVbQxPDupmRirC1yyuieQG=Ydfs0MJaNLjdQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 0/6] Stepwise rust upgrade 1.71.1 -> 1.74.1
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000725454060d583e1e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Dec 2023 16:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192903

--000000000000725454060d583e1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 24, 2023 at 3:09=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:

> This is the 1.74.1 rust series rebased to include a revert of
>
> https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f277704=
d1d08a8ec


I think this is definitely the culprit kudos to track it down. I think this
could be improved by generating hash of file content instead of the
pathname to prefix the relative path and we will fix both the issues

<https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f277704d=
1d08a8ec>
> which I'm pretty sure is what's causing our filename churn. I've checked
> 1.72.0 and 1.74.1 for the absvdi2.o intrinsic (one of many intrinsics
> which had the issue) and in both cases we're not generating the dirname
> based prefix - hopefully that means that the interim commits are fine
> too, if not we can do the step back through the commits to find the next
> issue.
>
> I've dropped the zvariant tests as upgrading it isn't useful (since it
> no longer includes git crate dependency) and spurious oe-selftest
> failures aren't helpful. I guess we need to include either something
> synthetic which tests git crates, or pull in
> https://github.com/jthornber/thin-provisioning-tools/ from
> meta-openembedded which includes a live example (though who knows for
> how long!)
>
> Assuming this does actually fix the reproducibility issue, I'll look at
> how we fix the issue properly, rather than just reverting the commit
> which I think is our problem, but I'd like to try and get us back on the
> rust release train if we can!
>
>
> Alex Kiernan (6):
>   meta-selftest: Drop zvariant recipe
>   rust: Upgrade 1.71.1 -> 1.72.0
>   rust: Upgrade 1.72.0 -> 1.72.1
>   rust: Upgrade 1.72.1 -> 1.73.0
>   rust: Upgrade 1.73.0 -> 1.74.0
>   rust: Upgrade 1.74.0 -> 1.74.1
>
>  .../zvariant/zvariant-crates.inc              |  258 ----
>  .../zvariant/zvariant-git-crates.inc          |   14 -
>  .../0001-Tweak-zvariant-crate-config.patch    | 1292 -----------------
>  .../zvariant/zvariant_3.12.0.bb               |   37 -
>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
>  meta/lib/oeqa/selftest/cases/devtool.py       |   93 --
>  .../rust/{cargo_1.71.1.bb =3D> cargo_1.74.1.bb} |    0
>  ...-Do-not-use-LFS64-on-linux-with-musl.patch |  164 ---
>  ...0001-Don-t-use-LFS64-symbols-on-musl.patch |  163 +++
>  ...e-absolute-paths-to-OUT_DIR-as-relat.patch |   67 +
>  ...Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch |  122 ++
>  ...efine-SOCK_SEQPACKET-in-common-place.patch |  114 --
>  ...ine-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch |   41 +
>  ...GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch |  205 +++
>  ...-musl-Define-O_LARGEFILE-for-riscv32.patch |   32 +
>  ...efine-SOCK_SEQPACKET-in-common-place.patch |  115 ++
>  .../rust/files/getrandom-open64.patch         |   50 -
>  .../rust/files/hardcodepaths.patch            |   14 +-
>  .../rust/files/zlib-off64_t.patch             |   17 +-
>  ...ibstd-rs_1.71.1.bb =3D> libstd-rs_1.74.1.bb} |    0
>  ....71.1.bb =3D> rust-cross-canadian_1.74.1.bb} |    0
>  ...ust-llvm_1.71.1.bb =3D> rust-llvm_1.74.1.bb} |    0
>  meta/recipes-devtools/rust/rust-snapshot.inc  |   64 +-
>  meta/recipes-devtools/rust/rust-source.inc    |   12 +-
>  .../rust/{rust_1.71.1.bb =3D> rust_1.74.1.bb}   |    1 +
>  25 files changed, 802 insertions(+), 2075 deletions(-)
>  delete mode 100644
> meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
>  delete mode 100644
> meta-selftest/recipes-extended/zvariant/zvariant-git-crates.inc
>  delete mode 100644
> meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crat=
e-config.patch
>  delete mode 100644 meta-selftest/recipes-extended/zvariant/
> zvariant_3.12.0.bb
>  rename meta/recipes-devtools/rust/{cargo_1.71.1.bb =3D> cargo_1.74.1.bb}
> (100%)
>  delete mode 100644
> meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-musl=
.patch
>  create mode 100644
> meta/recipes-devtools/rust/files/0001-Don-t-use-LFS64-symbols-on-musl.pat=
ch
>  create mode 100644
> meta/recipes-devtools/rust/files/0001-Revert-Map-source-absolute-paths-to=
-OUT_DIR-as-relat.patch
>  create mode 100644
> meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_NONBLOCK-with-O_NO=
NBLOCK.patch
>  delete mode 100644
> meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-in-commo=
n-place.patch
>  create mode 100644
> meta/recipes-devtools/rust/files/0002-musl-riscv32-Define-F_SETLK-F_SETLK=
W-and-fix-F_GETLK.patch
>  create mode 100644
> meta/recipes-devtools/rust/files/0003-musl-Move-F_OFD_GETLK-F_OFD_SETLK-a=
nd-F_OFD_SETLKW-t.patch
>  create mode 100644
> meta/recipes-devtools/rust/files/0004-musl-Define-O_LARGEFILE-for-riscv32=
.patch
>  create mode 100644
> meta/recipes-devtools/rust/files/0005-musl-Define-SOCK_SEQPACKET-in-commo=
n-place.patch
>  delete mode 100644 meta/recipes-devtools/rust/files/getrandom-open64.pat=
ch
>  rename meta/recipes-devtools/rust/{libstd-rs_1.71.1.bb =3D>
> libstd-rs_1.74.1.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.71.1.bb =3D>
> rust-cross-canadian_1.74.1.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-llvm_1.71.1.bb =3D>
> rust-llvm_1.74.1.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust_1.71.1.bb =3D> rust_1.74.1.bb}
> (99%)
>
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192895):
> https://lists.openembedded.org/g/openembedded-core/message/192895
> Mute This Topic: https://lists.openembedded.org/mt/103354255/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000725454060d583e1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Dec 24, 2023 at 3:09=E2=80=AFPM Alex Kiernan &lt;<a=
 href=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">This is the 1.74.1 rust series r=
ebased to include a revert of<br>
<a href=3D"https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc9=
23f277704d1d08a8ec" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f277704d1d08a8ec</a></block=
quote><div dir=3D"auto"><br></div><div dir=3D"auto">I think this is definit=
ely the culprit kudos to track it down. I think this could be improved by g=
enerating hash of file content instead of the pathname to prefix the relati=
ve path and we will fix both the issues=C2=A0</div><div dir=3D"auto"><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex" dir=3D"auto"><a href=3D"https://github.c=
om/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f277704d1d08a8ec" rel=3D"=
noreferrer" target=3D"_blank"></a><br>
which I&#39;m pretty sure is what&#39;s causing our filename churn. I&#39;v=
e checked<br>
1.72.0 and 1.74.1 for the absvdi2.o intrinsic (one of many intrinsics<br>
which had the issue) and in both cases we&#39;re not generating the dirname=
<br>
based prefix - hopefully that means that the interim commits are fine<br>
too, if not we can do the step back through the commits to find the next<br=
>
issue.<br>
<br>
I&#39;ve dropped the zvariant tests as upgrading it isn&#39;t useful (since=
 it<br>
no longer includes git crate dependency) and spurious oe-selftest<br>
failures aren&#39;t helpful. I guess we need to include either something<br=
>
synthetic which tests git crates, or pull in<br>
<a href=3D"https://github.com/jthornber/thin-provisioning-tools/" rel=3D"no=
referrer" target=3D"_blank">https://github.com/jthornber/thin-provisioning-=
tools/</a> from<br>
meta-openembedded which includes a live example (though who knows for<br>
how long!)<br>
<br>
Assuming this does actually fix the reproducibility issue, I&#39;ll look at=
<br>
how we fix the issue properly, rather than just reverting the commit<br>
which I think is our problem, but I&#39;d like to try and get us back on th=
e<br>
rust release train if we can!<br>
<br>
<br>
Alex Kiernan (6):<br>
=C2=A0 meta-selftest: Drop zvariant recipe<br>
=C2=A0 rust: Upgrade 1.71.1 -&gt; 1.72.0<br>
=C2=A0 rust: Upgrade 1.72.0 -&gt; 1.72.1<br>
=C2=A0 rust: Upgrade 1.72.1 -&gt; 1.73.0<br>
=C2=A0 rust: Upgrade 1.73.0 -&gt; 1.74.0<br>
=C2=A0 rust: Upgrade 1.74.0 -&gt; 1.74.1<br>
<br>
=C2=A0.../zvariant/zvariant-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 258 ----<br>
=C2=A0.../zvariant/zvariant-git-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A014 -<br>
=C2=A0.../0001-Tweak-zvariant-crate-config.patch=C2=A0 =C2=A0 | 1292 ------=
-----------<br>
=C2=A0.../zvariant/<a href=3D"http://zvariant_3.12.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">zvariant_3.12.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A037 -<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 2 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/devtool.py=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A093 --<br>
=C2=A0.../rust/{<a href=3D"http://cargo_1.71.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">cargo_1.71.1.bb</a> =3D&gt; <a href=3D"http://cargo_1.74.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">cargo_1.74.1.bb</a>} |=C2=A0 =C2=A0 0=
<br>
=C2=A0...-Do-not-use-LFS64-on-linux-with-musl.patch |=C2=A0 164 ---<br>
=C2=A0...0001-Don-t-use-LFS64-symbols-on-musl.patch |=C2=A0 163 +++<br>
=C2=A0...e-absolute-paths-to-OUT_DIR-as-relat.patch |=C2=A0 =C2=A067 +<br>
=C2=A0...Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch |=C2=A0 122 ++<br>
=C2=A0...efine-SOCK_SEQPACKET-in-common-place.patch |=C2=A0 114 --<br>
=C2=A0...ine-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch |=C2=A0 =C2=A041 +<br>
=C2=A0...GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch |=C2=A0 205 +++<br>
=C2=A0...-musl-Define-O_LARGEFILE-for-riscv32.patch |=C2=A0 =C2=A032 +<br>
=C2=A0...efine-SOCK_SEQPACKET-in-common-place.patch |=C2=A0 115 ++<br>
=C2=A0.../rust/files/getrandom-open64.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A050 -<br>
=C2=A0.../rust/files/hardcodepaths.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A014 +-<br>
=C2=A0.../rust/files/zlib-off64_t.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A017 +-<br>
=C2=A0...<a href=3D"http://ibstd-rs_1.71.1.bb" rel=3D"noreferrer" target=3D=
"_blank">ibstd-rs_1.71.1.bb</a> =3D&gt; <a href=3D"http://libstd-rs_1.74.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.74.1.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0....<a href=3D"http://71.1.bb" rel=3D"noreferrer" target=3D"_blank">7=
1.1.bb</a> =3D&gt; <a href=3D"http://rust-cross-canadian_1.74.1.bb" rel=3D"=
noreferrer" target=3D"_blank">rust-cross-canadian_1.74.1.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0...<a href=3D"http://ust-llvm_1.71.1.bb" rel=3D"noreferrer" target=3D=
"_blank">ust-llvm_1.71.1.bb</a> =3D&gt; <a href=3D"http://rust-llvm_1.74.1.=
bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.74.1.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0meta/recipes-devtools/rust/rust-snapshot.inc=C2=A0 |=C2=A0 =C2=A064 +=
-<br>
=C2=A0meta/recipes-devtools/rust/rust-source.inc=C2=A0 =C2=A0 |=C2=A0 =C2=
=A012 +-<br>
=C2=A0.../rust/{<a href=3D"http://rust_1.71.1.bb" rel=3D"noreferrer" target=
=3D"_blank">rust_1.71.1.bb</a> =3D&gt; <a href=3D"http://rust_1.74.1.bb" re=
l=3D"noreferrer" target=3D"_blank">rust_1.74.1.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
=C2=A0 1 +<br>
=C2=A025 files changed, 802 insertions(+), 2075 deletions(-)<br>
=C2=A0delete mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-c=
rates.inc<br>
=C2=A0delete mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-g=
it-crates.inc<br>
=C2=A0delete mode 100644 meta-selftest/recipes-extended/zvariant/zvariant/0=
001-Tweak-zvariant-crate-config.patch<br>
=C2=A0delete mode 100644 meta-selftest/recipes-extended/zvariant/<a href=3D=
"http://zvariant_3.12.0.bb" rel=3D"noreferrer" target=3D"_blank">zvariant_3=
.12.0.bb</a><br>
=C2=A0rename meta/recipes-devtools/rust/{<a href=3D"http://cargo_1.71.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">cargo_1.71.1.bb</a> =3D&gt; <a href=
=3D"http://cargo_1.74.1.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.74=
.1.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rust/files/0001-Do-not-use-L=
FS64-on-linux-with-musl.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/files/0001-Don-t-use-LF=
S64-symbols-on-musl.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/files/0001-Revert-Map-s=
ource-absolute-paths-to-OUT_DIR-as-relat.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/files/0001-musl-Define-=
SOCK_NONBLOCK-with-O_NONBLOCK.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rust/files/0001-musl-Define-=
SOCK_SEQPACKET-in-common-place.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/files/0002-musl-riscv32=
-Define-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/files/0003-musl-Move-F_=
OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/files/0004-musl-Define-=
O_LARGEFILE-for-riscv32.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/files/0005-musl-Define-=
SOCK_SEQPACKET-in-common-place.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rust/files/getrandom-open64.=
patch<br>
=C2=A0rename meta/recipes-devtools/rust/{<a href=3D"http://libstd-rs_1.71.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.1.bb</a> =3D&gt; <=
a href=3D"http://libstd-rs_1.74.1.bb" rel=3D"noreferrer" target=3D"_blank">=
libstd-rs_1.74.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/rust/{<a href=3D"http://rust-cross-canad=
ian_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-canadian_1.7=
1.1.bb</a> =3D&gt; <a href=3D"http://rust-cross-canadian_1.74.1.bb" rel=3D"=
noreferrer" target=3D"_blank">rust-cross-canadian_1.74.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/rust/{<a href=3D"http://rust-llvm_1.71.1=
.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.1.bb</a> =3D&gt; <=
a href=3D"http://rust-llvm_1.74.1.bb" rel=3D"noreferrer" target=3D"_blank">=
rust-llvm_1.74.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/rust/{<a href=3D"http://rust_1.71.1.bb" =
rel=3D"noreferrer" target=3D"_blank">rust_1.71.1.bb</a> =3D&gt; <a href=3D"=
http://rust_1.74.1.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.74.1.bb<=
/a>} (99%)<br>
<br>
-- <br>
2.39.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192895): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192895" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192895</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103354255/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103354255/1997914</a><br>
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

--000000000000725454060d583e1e--

