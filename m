Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420A7C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 16:56:27 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.86901.1705337778040330644
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 08:56:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mYep4h2D;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6dddb927d02so4379600a34.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 08:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705337777; x=1705942577; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nV5rx9bPMrre2nbqV0UrBuOWggy5Y5GpfDD0NexUd0A=;
        b=mYep4h2DkBnQOcdmW5xCypwB48HFxFQ4trMAQb/7V/9YF024tlnRpBEDnjSpn+zhZn
         0+ESM2uwJ3D4b6c0GAtBRucRhLLU1boZzzSjfbA66ka88FrD8aOzcAuGsav3eVZzgJPO
         sc55HcVG2yXB9FyFxIWZZ9xoMJ1AaX5rvQzlFwBIr3uDYtzawNwMls5xCtYd7zAILiGC
         pwFLCM+qsjWdq4ejNwpvwDw2jnnqMHlkZ9v889doK/bsfcBNJvxX1jKVVsWePed5efJY
         qM7xRbClDRo9GZHWuLIzV6d1w4HRlLM3qBzq0ppme3mNQbxK0AsN40kSnREJtsDurwfJ
         du3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705337777; x=1705942577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nV5rx9bPMrre2nbqV0UrBuOWggy5Y5GpfDD0NexUd0A=;
        b=d+k9rXaSd79H0nQ74vAP2ALFs+d/LERuzrJzzm95G8X1TT24+B3ckoFwxpbSC0a1BQ
         zR4gBX0cANLNqSfx9Zqiyq74CkQm/fk2l1FHsEfcMfiLYIQ0fB7EdYi3fxi2oVGqI1uo
         LYgJPeQqub4S8ff/8clrZpkgOEn6xhq10Dfc2eblzzlZpE/C+sNX1TA94SC9372qwOQw
         hg7TZMSHWsweR48MU7pb3MBLITYmNPBTFOjyf1B/rG4zDL4GkLdBtQm2sBW4eKRPPfxW
         XulVQ3e0i4MgyUvk1cyX0GTpC/34Rei9X/T0mPShrcV0cXgSTx/+oLlmlQ+/PfFjIbhp
         gMcw==
X-Gm-Message-State: AOJu0YxR2YYY9uIhHhuti2TkasVvD/S//dkJ7wF52PdArpGezhXrg5h0
	cqxVzbJiJmgCDtcu7NPEVqTzT1AP6G8BqaK7NKj8INCKfmQ=
X-Google-Smtp-Source: AGHT+IEU2rEHwuqV88LO2hDejCAPC6HGGJTXAmEZEtKNQzZkd21yx52fdjXTlaNPB60u1QpCxlyPASCD/8S038h6Oek=
X-Received: by 2002:a05:6870:1711:b0:203:c927:474d with SMTP id
 h17-20020a056870171100b00203c927474dmr9788061oae.75.1705337777253; Mon, 15
 Jan 2024 08:56:17 -0800 (PST)
MIME-Version: 1.0
References: <20240114055844.2301337-1-raj.khem@gmail.com> <cd7e909003596bb4db2b3a946e2b846aad5e9de9.camel@linuxfoundation.org>
In-Reply-To: <cd7e909003596bb4db2b3a946e2b846aad5e9de9.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Jan 2024 08:56:06 -0800
Message-ID: <CAMKF1sph2E72GXvpy43X9Ow+=PDk01F+465HRJ-Xa1ZxpFaQtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Use llvm-config from native llvm-rust on
 rust target builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006f72c3060efee408"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 16:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193690

--0000000000006f72c3060efee408
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jan 15, 2024 at 5:19=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2024-01-13 at 21:58 -0800, Khem Raj wrote:
> > target rust recipe builds ( cross compile ) calls llvm-config from
> > target sysroot which works ok as long as C++ runtime it needs is
> > available on build host e.g. libstdc++ etc. which is commonly the
> > case, however when using clang and llvm runtime this falters since
> > it should be using libc++ from native sysroot and if this does not
> > exist on build machine this fails to find libc++ shared object and
> > llvm-config fails to run. This ensures that llvm-config version in
> > use is correctly relocated and can use shared libraries from native
> > sysroot correctly. Adding ORIGIN to sysroot will look for the .so in
> > same dir as the binary and there is the libc++.so.1 copied in place
> >
> > Fixes rust build with clang compiler.
> >
> > >
> /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/rust/1.74.1/recipe-sys=
root/usr/lib/llvm-rust/bin/llvm-config:
> error while loading shared libraries: libc++.so.1: cannot open shared
> object file: No such file or director
> > y
> > > thread 'main' panicked at llvm.rs:551:19:
> > > command did not execute successfully:
> "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/rust/1.74.1/recipe-sy=
sroot/usr/lib/llvm-rust/bin/llvm-config"
> "--version"
> > > expected success, got: exit status: 127
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/rust/rust_1.74.1.bb | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/rust/rust_1.74.1.bb
> b/meta/recipes-devtools/rust/rust_1.74.1.bb
> > index 30543ada7db..2dffe009827 100644
> > --- a/meta/recipes-devtools/rust/rust_1.74.1.bb
> > +++ b/meta/recipes-devtools/rust/rust_1.74.1.bb
> > @@ -198,9 +198,13 @@ rust_runx () {
> >      # Copy the natively built llvm-config into the target so we can ru=
n
> it. Horrible,
> >      # but works!
> >      if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D
> ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
> > -        mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
> > +        tgtdir=3D`dirname ${RUST_ALTERNATE_EXE_PATH}`
> > +        mkdir -p ${tgtdir}
> >          cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH=
}
> > -        chrpath -d ${RUST_ALTERNATE_EXE_PATH}
> > +        if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
> > +            cp ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ${tgtdir}/
> > +        fi
> > +        chrpath -r \$ORIGIN ${RUST_ALTERNATE_EXE_PATH}
> >      fi
> >
> >      oe_cargo_fix_env
>
> Copying a native library into the target sysroot goes beyond what I'm
> comfortable with even for this horrible hack with llvm-config.


It=E2=80=99s just supporting the original hack to work properly I don=E2=80=
=99t think it=E2=80=99s
any worse that the original hack

>
>
> Since it seems to be finding it by RPATH, can you not just add an RPATH
> to the native sysroot in the binary?


It does not work and I don=E2=80=99t know why but seems rpath in llvm-confi=
g
affects what paths it spits out

>


>
> Cheers,
>
> Richard
>

--0000000000006f72c3060efee408
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, Jan 15, 2024 at 5:19=E2=80=AFAM Richard Purdie &lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfound=
ation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, =
2024-01-13 at 21:58 -0800, Khem Raj wrote:<br>
&gt; target rust recipe builds ( cross compile ) calls llvm-config from<br>
&gt; target sysroot which works ok as long as C++ runtime it needs is<br>
&gt; available on build host e.g. libstdc++ etc. which is commonly the<br>
&gt; case, however when using clang and llvm runtime this falters since<br>
&gt; it should be using libc++ from native sysroot and if this does not<br>
&gt; exist on build machine this fails to find libc++ shared object and<br>
&gt; llvm-config fails to run. This ensures that llvm-config version in<br>
&gt; use is correctly relocated and can use shared libraries from native<br=
>
&gt; sysroot correctly. Adding ORIGIN to sysroot will look for the .so in<b=
r>
&gt; same dir as the binary and there is the libc++.so.1 copied in place<br=
>
&gt; <br>
&gt; Fixes rust build with clang compiler.<br>
&gt; <br>
&gt; &gt; /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/rust/1.74.1/re=
cipe-sysroot/usr/lib/llvm-rust/bin/llvm-config: error while loading shared =
libraries: libc++.so.1: cannot open shared object file: No such file or dir=
ector<br>
&gt; y<br>
&gt; &gt; thread &#39;main&#39; panicked at llvm.rs:551:19:<br>
&gt; &gt; command did not execute successfully: &quot;/mnt/b/yoe/master/bui=
ld/tmp/work/riscv64-yoe-linux/rust/1.74.1/recipe-sysroot/usr/lib/llvm-rust/=
bin/llvm-config&quot; &quot;--version&quot;<br>
&gt; &gt; expected success, got: exit status: 127<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/rust/<a href=3D"http://rust_1.74.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.74.1.bb</a> | 8 ++++++--<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.74.1.=
bb" rel=3D"noreferrer" target=3D"_blank">rust_1.74.1.bb</a> b/meta/recipes-=
devtools/rust/<a href=3D"http://rust_1.74.1.bb" rel=3D"noreferrer" target=
=3D"_blank">rust_1.74.1.bb</a><br>
&gt; index 30543ada7db..2dffe009827 100644<br>
&gt; --- a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.74.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.74.1.bb</a><br>
&gt; +++ b/meta/recipes-devtools/rust/<a href=3D"http://rust_1.74.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.74.1.bb</a><br>
&gt; @@ -198,9 +198,13 @@ rust_runx () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Copy the natively built llvm-config into the tar=
get so we can run it. Horrible,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # but works!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUST=
_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p `dirname ${RUST_ALTERNATE_EXE_PA=
TH}`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tgtdir=3D`dirname ${RUST_ALTERNATE_EXE_PA=
TH}`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${tgtdir}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${RUST_ALTERNATE_EXE_PATH_NATIVE}=
 ${RUST_ALTERNATE_EXE_PATH}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 chrpath -d ${RUST_ALTERNATE_EXE_PATH}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.s=
o.1 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${STAGING_LIBDIR_NATIVE}=
/libc++.so.1 ${tgtdir}/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 chrpath -r \$ORIGIN ${RUST_ALTERNATE_EXE_=
PATH}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 oe_cargo_fix_env<br>
<br>
Copying a native library into the target sysroot goes beyond what I&#39;m<b=
r>
comfortable with even for this horrible hack with llvm-config.</blockquote>=
<div dir=3D"auto"><br></div><div dir=3D"auto">It=E2=80=99s just supporting =
the original hack to work properly I don=E2=80=99t think it=E2=80=99s any w=
orse that the original hack=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
<br>
Since it seems to be finding it by RPATH, can you not just add an RPATH<br>
to the native sysroot in the binary?</blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto">It does not work and I don=E2=80=99t know why but seems=
 rpath in llvm-config affects what paths it spits out=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex" dir=3D"auto"></blockquote><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br=
>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000006f72c3060efee408--

