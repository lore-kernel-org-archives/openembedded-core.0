Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753DCC433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 10:16:06 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web12.4965.1634984165300956912
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 03:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ahDjZ0E9;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id a17so12290581uax.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 03:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SER56UlEcrFmLY/495Iyes40W7PP154BMUKD+USxVRk=;
        b=ahDjZ0E914YgJ+8/rEX5dzOywfHqtQM0Iv748Z/uLXggsdtFDh9CRCEk9trSR62Mam
         4Wji3EJx7/vy4LuPFEPLBe6CThTdA3QyNIigxbIq48p9lwU4yaaVt9SNNSSQIEKhr+wK
         bh8Ecvqwpu+7MX+8Wh8gEkLszPXXrR+QfQnnSMpgSA1dxGjEiCGY47N9MwUIAzxAYFlF
         d4WzAF9xcfXAZwvemSPQrwzNWGn3wJx3P/jyVZz/z3tlH6VsEbjTWNqxezX3FQno7I+G
         3R9U8mayWUqBMCKhY4gE1NfqfpWWwV/hL8qTKrrk8Qm4YU8aDdX2RJPp7KCrHQSDMMDM
         VnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SER56UlEcrFmLY/495Iyes40W7PP154BMUKD+USxVRk=;
        b=pRewSkYWX6OjmEd7dcvbwibpu8jHOCpJ3LIGzQqmLIQOlJhkZacdP7AvGD2eLct7wX
         m726yF3ZxKH1VwNwQJpXMc/3yxN1g523eiWOt+RWEQeLCqDEWEUcTNjQqwIowN/pph73
         zbMoQ/sepNrdpD7LrGMOCDzV3oFMsm2EYyrdHIrCBPut6P98o3RD3GtRiZDz9s6WVeAE
         jLMQbGC4HsVz/ZKtQ5/G/4iaR1mlBamSf1mAbRTPQzmvRqB8OzGC6q/9L+lQCJEI7Mtm
         qjdM8FsX5RqGaPNKqCDrjqyawjYdqS7IW01aEURpqVQ4zy4ruD1CuZixqkGQ9/HBgvq8
         BhXw==
X-Gm-Message-State: AOAM530lXP/T9PjjvezfSAVcuQp3Bt0tih4yk8YePqRPXrz5JICD840q
	9ykmHdIVlWI4uqdaYWpFhD6PF2KOZju+scnZRO9CZue4
X-Google-Smtp-Source: 
 ABdhPJwf++Nvdavodoz+mnMUp48wE6PraxjN+3anIeHo5bebXjFbBM9YlPt+wWm9XDE7c+cgliv9K6I4XnJcuy67io0=
X-Received: by 2002:a05:6102:942:: with SMTP id
 a2mr398101vsi.18.1634984164392;
 Sat, 23 Oct 2021 03:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211021084059.977697-1-alex@linutronix.de>
 <20211021084059.977697-2-alex@linutronix.de>
 <YXL9Hhw9H4hLs9jX@piout.net>
In-Reply-To: <YXL9Hhw9H4hLs9jX@piout.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Oct 2021 12:15:52 +0200
Message-ID: 
 <CANNYZj_tTKQ2eSCaNSMguvY1675WQXDwhd-LEtQge59_6f4gWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] stress-ng: convert to git, website is down
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000055035d05cf026a35"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 10:16:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157300

--00000000000055035d05cf026a35
Content-Type: text/plain; charset="UTF-8"

Thanks, I will correct this in my next batch.

Alex

On Fri, 22 Oct 2021 at 20:04, Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello Alex,
>
> This makes the reproducible builds fail:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/870/steps/12/logs/stdio
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20211022-8ziugi_1/packages/diff-html/
>
>
> On 21/10/2021 10:40:59+0200, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
> b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
> > index 198f7e87c7..f9dcdda0af 100644
> > --- a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
> > +++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
> > @@ -1,14 +1,15 @@
> >  SUMMARY = "System load testing utility"
> >  DESCRIPTION = "Deliberately simple workload generator for POSIX
> systems. It \
> >  imposes a configurable amount of CPU, memory, I/O, and disk stress on
> the system."
> > -HOMEPAGE = "https://kernel.ubuntu.com/~cking/stress-ng/"
> > +HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >
> > -SRC_URI = "
> https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
> > +SRC_URI = "git://github.com/ColinIanKing/stress-ng.git \
> >
>  file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
> >             "
> > -SRC_URI[sha256sum] =
> "1cefe4a3057c1522b146e62f61b80ce6e2e99da2d85ebe25bc03fc45228e58cd"
> > +SRCREV = "61b454b4a3a9d052e63c78a9574ccf8a650575dc"
> > +S = "${WORKDIR}/git"
> >
> >  DEPENDS = "coreutils-native"
> >
> > --
> > 2.20.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#157277):
> https://lists.openembedded.org/g/openembedded-core/message/157277
> > Mute This Topic: https://lists.openembedded.org/mt/86484339/3617179
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

--00000000000055035d05cf026a35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I will correct this in my next batch.</div><d=
iv><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, 22 Oct 2021 at 20:04, Alexandre Bel=
loni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni=
@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hello Alex,<br>
<br>
This makes the reproducible builds fail:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/119/buil=
ds/870/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/119/builds/870/steps/12/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2021=
1022-8ziugi_1/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20211022-8ziugi_1/=
packages/diff-html/</a><br>
<br>
<br>
On 21/10/2021 10:40:59+0200, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.13=
.00.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.13.00.bb</a> | 7 +=
+++---<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/stress-ng/<a href=3D"http://stress-=
ng_0.13.00.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.13.00.bb</a=
> b/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.13.00.bb"=
 rel=3D"noreferrer" target=3D"_blank">stress-ng_0.13.00.bb</a><br>
&gt; index 198f7e87c7..f9dcdda0af 100644<br>
&gt; --- a/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.13=
.00.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.13.00.bb</a><br>
&gt; +++ b/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.13=
.00.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.13.00.bb</a><br>
&gt; @@ -1,14 +1,15 @@<br>
&gt;=C2=A0 SUMMARY =3D &quot;System load testing utility&quot;<br>
&gt;=C2=A0 DESCRIPTION =3D &quot;Deliberately simple workload generator for=
 POSIX systems. It \<br>
&gt;=C2=A0 imposes a configurable amount of CPU, memory, I/O, and disk stre=
ss on the system.&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://kernel.ubuntu.com/~cking/stress=
-ng/" rel=3D"noreferrer" target=3D"_blank">https://kernel.ubuntu.com/~cking=
/stress-ng/</a>&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/ColinIanKing/stress-=
ng#readme" rel=3D"noreferrer" target=3D"_blank">https://github.com/ColinIan=
King/stress-ng#readme</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPLv2&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://kernel.ubuntu.com/~cking/tarball=
s/$%7BBPN%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:/=
/kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz</a> \<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/ColinIanKing/str=
ess-ng.git" rel=3D"noreferrer" target=3D"_blank">github.com/ColinIanKing/st=
ress-ng.git</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-pres=
erve-ownership-when-installing-example-jo.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;1cefe4a3057c1522b146e62f61b80ce6e2e99da2=
d85ebe25bc03fc45228e58cd&quot;<br>
&gt; +SRCREV =3D &quot;61b454b4a3a9d052e63c78a9574ccf8a650575dc&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPENDS =3D &quot;coreutils-native&quot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#157277): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/157277" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/157277</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86484339=
/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86484339/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000055035d05cf026a35--

