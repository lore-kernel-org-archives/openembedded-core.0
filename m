Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC2EC3DA7B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 22:34:47 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.32728.1671662082600781308
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 14:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nC9nOxt+;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id m18so902667eji.5
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 14:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4zZ++z0zPruVCIBT/YALevNdBU96+1X03jvaDOg1MuM=;
        b=nC9nOxt+DZbKJAaHbAqNOGMhKmpAwICMOsmCigDSQ666KY8Q8amId8k10VSuW7Nd1D
         cdxtE8zckfG2lQoDXwr4strQhDNtz0bYyg91jpiBC5SEPSlhcrvSvxDLC96vwLDMm1Gv
         XPTJt/yapSRSsW9PeEe2rA4bSy0eJazr1GIg8KfLW/0O/hbJdrbhrP6Q1jc5za/f0TEd
         dYAgX0mbJg8fxQSrS9/CDL5lVFzclFxyniL8E7auCTWbooet+M1LBxW865kWyxrBgatA
         oQWZtprkDwrm7q6p6wd/PQmewisjhBOcnX7THOgUqKIAEk/WchRiaOKSpDIMY7Xw4Bl1
         NZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zZ++z0zPruVCIBT/YALevNdBU96+1X03jvaDOg1MuM=;
        b=7iFYFrtd+lZbaGZ2lj0hvU25hBGjZG5OtFlbucyS+NN0zzgoc8fc2GTaFxpDveBimY
         zLvF7owQQHVFEDmbZ2keP2Id/QefQEzjUnLfimZyJPfhkP+KNWAUplrrbtCH6UWtFmJH
         6xXIM/5/jwP1XUabA+mFo/LNFMzGyRVSBepJ3z8AfkJHllctBB/c7lgSMzrBHl+3VPSZ
         Ky/BmzvH/HhGcTMBGD9lGHgMPjM5gDTT6cWv4EJW3XUDaqudamhmlZA0+8uXv6QmUPLn
         BUGUgEJB1aFe1x5cKbjcZXVSlFuNmawwEvUb3hl2vqz02XI8kDqtCOAgzVV/roRk56xQ
         +cOA==
X-Gm-Message-State: AFqh2koI1N9sCKPWeG63b9yk1KObE+BfwY28z2tA/+EQqKpCkQgdqrBd
	7VC7QRgqd2AsPk22dcQw2s/w/VlUh150LLYS9qc=
X-Google-Smtp-Source: AMrXdXsCj8WN+sCvzo6WwJE+MqAk2Ml+ya5GkWsMW8cQKkRIDQNGtHx4ZoQAH61g/rN3XDm/cIm2G+mI+1k764tCvmI=
X-Received: by 2002:a17:907:a70a:b0:7ae:50c6:fd0a with SMTP id
 vw10-20020a170907a70a00b007ae50c6fd0amr256272ejc.184.1671662080986; Wed, 21
 Dec 2022 14:34:40 -0800 (PST)
MIME-Version: 1.0
References: <20221221125306.13779-1-alex.kiernan@gmail.com> <Y6N4t46ZSA9ly0Tl@mail.local>
In-Reply-To: <Y6N4t46ZSA9ly0Tl@mail.local>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 21 Dec 2022 22:34:31 +0000
Message-ID: <CAO5Uq5T-4r_2trNYVr1RPiUARA+vigvu3NspySaLZ=xEqeWPpA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2 00/10] Add rust runtime tests
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000085978c05f05e2896"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 22:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174952

--00000000000085978c05f05e2896
Content-Type: text/plain; charset="UTF-8"

Thanks. Busy the next few days, but at least one looks like the crossbeam
atomics problem.

On Wed, 21 Dec 2022, 21:20 Alexandre Belloni, <alexandre.belloni@bootlin.com>
wrote:

> Hello,
>
> This is currently running on the AB and I got the following failures:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6375/steps/11/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3985/steps/11/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/6334/steps/11/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/3960/steps/11/logs/stdio
>
> On 21/12/2022 12:52:55+0000, Alex Kiernan wrote:
> >
> > This series adds runtime tests for rust and cargo, merges (most of) the
> > include files into the base recipes and fixes target cargo builds.
> >
> > Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part
> > of packagegroup-core-sdk.
> >
> > Changes in v2:
> > - Drop rust.inc/rust.bb merge, not actually made use of in the change
> >   set
> > - Reorder so cargo test goes after build fixes
> >
> > Alex Kiernan (10):
> >   oeqa/runtime/rust: Add basic compile/run test
> >   libstd-rs: Merge .inc into .bb
> >   libstd-rs: Move source directory to library/test
> >   rust-llvm: Merge .inc into .bb
> >   rust-llvm: Update LLVM_VERSION to match embedded version
> >   cargo: Merge .inc into .bb
> >   cargo: Extend DEBUG_PREFIX_MAP to cover vendor
> >   packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
> >   packagegroup-core-sdk: Add SDK toolchain language selection support
> >   oeqa/runtime/rust: Add cargo test
> >
> >  meta/lib/oeqa/files/test.rs                   |  2 +
> >  meta/lib/oeqa/runtime/cases/rust.py           | 41 ++++++++++
> >  .../packagegroups/packagegroup-core-sdk.bb    | 10 ++-
> >  .../packagegroup-rust-sdk-target.bb           | 14 ++++
> >  meta/recipes-devtools/cargo/cargo.inc         | 69 ----------------
> >  meta/recipes-devtools/cargo/cargo_1.66.0.bb   | 73 ++++++++++++++++-
> >  meta/recipes-devtools/rust/libstd-rs.inc      | 40 ---------
> >  .../recipes-devtools/rust/libstd-rs_1.66.0.bb | 46 ++++++++++-
> >  meta/recipes-devtools/rust/rust-llvm.inc      | 78 ------------------
> >  .../recipes-devtools/rust/rust-llvm_1.66.0.bb | 82 ++++++++++++++++++-
> >  10 files changed, 260 insertions(+), 195 deletions(-)
> >  create mode 100644 meta/lib/oeqa/files/test.rs
> >  create mode 100644 meta/recipes-core/packagegroups/
> packagegroup-rust-sdk-target.bb
> >  delete mode 100644 meta/recipes-devtools/cargo/cargo.inc
> >  delete mode 100644 meta/recipes-devtools/rust/libstd-rs.inc
> >  delete mode 100644 meta/recipes-devtools/rust/rust-llvm.inc
> >
> > --
> > 2.39.0
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#174906):
> https://lists.openembedded.org/g/openembedded-core/message/174906
> > Mute This Topic: https://lists.openembedded.org/mt/95805431/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000085978c05f05e2896
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thanks. Busy the next few days, but at least one loo=
ks like the crossbeam atomics problem.<br><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, 21 Dec 2022, 21:20 Alexandre Be=
lloni, &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.bello=
ni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello=
,<br>
<br>
This is currently running on the AB and I got the following failures:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/build=
s/6375/steps/11/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6375/ste=
ps/11/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/102/buil=
ds/3985/steps/11/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3985/s=
teps/11/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/63/build=
s/6334/steps/11/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/6334/ste=
ps/11/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/107/buil=
ds/3960/steps/11/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/3960/s=
teps/11/logs/stdio</a><br>
<br>
On 21/12/2022 12:52:55+0000, Alex Kiernan wrote:<br>
&gt; <br>
&gt; This series adds runtime tests for rust and cargo, merges (most of) th=
e<br>
&gt; include files into the base recipes and fixes target cargo builds.<br>
&gt; <br>
&gt; Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as par=
t<br>
&gt; of packagegroup-core-sdk.<br>
&gt; <br>
&gt; Changes in v2:<br>
&gt; - Drop rust.inc/<a href=3D"http://rust.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">rust.bb</a> merge, not actually made use of in the cha=
nge<br>
&gt;=C2=A0 =C2=A0set<br>
&gt; - Reorder so cargo test goes after build fixes<br>
&gt; <br>
&gt; Alex Kiernan (10):<br>
&gt;=C2=A0 =C2=A0oeqa/runtime/rust: Add basic compile/run test<br>
&gt;=C2=A0 =C2=A0libstd-rs: Merge .inc into .bb<br>
&gt;=C2=A0 =C2=A0libstd-rs: Move source directory to library/test<br>
&gt;=C2=A0 =C2=A0rust-llvm: Merge .inc into .bb<br>
&gt;=C2=A0 =C2=A0rust-llvm: Update LLVM_VERSION to match embedded version<b=
r>
&gt;=C2=A0 =C2=A0cargo: Merge .inc into .bb<br>
&gt;=C2=A0 =C2=A0cargo: Extend DEBUG_PREFIX_MAP to cover vendor<br>
&gt;=C2=A0 =C2=A0packagegroup-rust-sdk-target: Add Rust SDK target packageg=
roup<br>
&gt;=C2=A0 =C2=A0packagegroup-core-sdk: Add SDK toolchain language selectio=
n support<br>
&gt;=C2=A0 =C2=A0oeqa/runtime/rust: Add cargo test<br>
&gt; <br>
&gt;=C2=A0 meta/lib/oeqa/files/<a href=3D"http://test.rs" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">test.rs</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 meta/lib/oeqa/runtime/cases/rust.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 41 ++++++++++<br>
&gt;=C2=A0 .../packagegroups/<a href=3D"http://packagegroup-core-sdk.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">packagegroup-core-sdk.bb</a>=
=C2=A0 =C2=A0 | 10 ++-<br>
&gt;=C2=A0 .../<a href=3D"http://packagegroup-rust-sdk-target.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">packagegroup-rust-sdk-target.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++<br>
&gt;=C2=A0 meta/recipes-devtools/cargo/cargo.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 69 ----------------<br>
&gt;=C2=A0 meta/recipes-devtools/cargo/<a href=3D"http://cargo_1.66.0.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">cargo_1.66.0.bb</a>=C2=A0 =
=C2=A0| 73 ++++++++++++++++-<br>
&gt;=C2=A0 meta/recipes-devtools/rust/libstd-rs.inc=C2=A0 =C2=A0 =C2=A0 | 4=
0 ---------<br>
&gt;=C2=A0 .../recipes-devtools/rust/<a href=3D"http://libstd-rs_1.66.0.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">libstd-rs_1.66.0.bb</a> | =
46 ++++++++++-<br>
&gt;=C2=A0 meta/recipes-devtools/rust/rust-llvm.inc=C2=A0 =C2=A0 =C2=A0 | 7=
8 ------------------<br>
&gt;=C2=A0 .../recipes-devtools/rust/<a href=3D"http://rust-llvm_1.66.0.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">rust-llvm_1.66.0.bb</a> | =
82 ++++++++++++++++++-<br>
&gt;=C2=A0 10 files changed, 260 insertions(+), 195 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/lib/oeqa/files/<a href=3D"http://test.rs=
" rel=3D"noreferrer noreferrer" target=3D"_blank">test.rs</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/packagegroups/<a href=3D"ht=
tp://packagegroup-rust-sdk-target.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">packagegroup-rust-sdk-target.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/cargo/cargo.inc<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rust/libstd-rs.inc<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rust/rust-llvm.inc<br>
&gt; <br>
&gt; -- <br>
&gt; 2.39.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#174906): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/174906" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1749=
06</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95805431=
/3617179" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/95805431/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.=
belloni@bootlin.com" target=3D"_blank" rel=3D"noreferrer">alexandre.belloni=
@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--00000000000085978c05f05e2896--

