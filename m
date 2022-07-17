Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F239C43334
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 09:05:34 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.14156.1658048732705909024
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 02:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=og5u/dR7;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id r18so11538949edb.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 02:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o17OfTgP7skpwrnCEh0EO5bxjhFeDqElX0VsTQiJKFU=;
        b=og5u/dR7HqI04Ayip8DKVjANeXpwcdqlXp+r7xGNvubaT8GNZhWja+kCDmMo+OI9jv
         eKaolNsRwdTLdSlP1WygDBIEdSgk64+DyoLZZ8k7C1wIL4d+o8W9HLakNzE3zBIrq7wO
         PwzfjBQFPB3YalSiSgJ7lWdOTDI2EE7ijs26Tg16lMgzD3ZqukmJYKhqiD4iNT4z61Iu
         3cYGdBfi9CDxCTuL4OXsf83m2cVocJ8P/u2QWClSjUOH3WXERmaKlIEsEPjZLUH4OEQj
         /nVnyLNuAA2zyQC1Z9PxoVdpoZAHRP7THFULFmAnN52JNLFZ9gkM2698n+y0O1+mVlaf
         1K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o17OfTgP7skpwrnCEh0EO5bxjhFeDqElX0VsTQiJKFU=;
        b=51mBRLM7EoD1swDzC4WIN9GqEOPaWmPKhV8MMSkDnoLRtQYMwDIqXW2r9DTYQ7Duje
         PVtmwOXyeawOqG9Fs/9FW8ycf9nk2e2K0BG2AwIL/UGn0VYpMjqMDGLAFp2pfukNhTp1
         D+MLO7PqVGRZxECZgj4DAzSnUpLHh0BrsMOk9Tz488WSDxxYUHg5eIm2+4qZXv4k8JA7
         lIv+3JloZfeO6pvftifnbxhQDx2505Bhvw8QiJH+mTF9TF5wcWk50Od5fU/NlyypQR9x
         fbGG0ksoyzYPtilz+Y1CZZW1qWGp2gpj2VsiIZqDovcqtbHtlIGXG93O7++3kDa1yZiI
         Uq2A==
X-Gm-Message-State: AJIora/124e4SIkYccUGfhNZJPonup5WMdubKKfl61ohSLxrgXHiHEN7
	uo5UY7UtoOB6eI9pp9CvqX0DMuJvGBj5P10kTyk=
X-Google-Smtp-Source: 
 AGRyM1uB9KYS+EXfYzDAF7yR2zZUf8hFz8SYXVJY9nOnuNXzAGe07c6pV+ImgHr5/Ax1AYqVuuxSrVX6LA6NR7W6FGs=
X-Received: by 2002:a05:6402:3047:b0:43a:9e43:95e5 with SMTP id
 bs7-20020a056402304700b0043a9e4395e5mr30378784edb.385.1658048731056; Sun, 17
 Jul 2022 02:05:31 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CABF_=yge_DgiH6+MzKNooWYSkks5=zJu=V23FKpx1v-1j=UCBg@mail.gmail.com>
 <CANNYZj8o2mPjVLfLXjvV6BKD57_NF2ymuTs36_ghc80hVV+HFQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8o2mPjVLfLXjvV6BKD57_NF2ymuTs36_ghc80hVV+HFQ@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 17 Jul 2022 11:05:18 +0200
Message-ID: 
 <CABF_=yi3DWPQMP=p8LbBwPU3=01W87HLjjoUPSmN2ar--qBAxw@mail.gmail.com>
Subject: Re: [OE-core] python3-jsonschema: is ${PYTHON_PN}-setuptools-scm
 still needed?
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a28de305e3fc8dbc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 09:05:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168145

--000000000000a28de305e3fc8dbc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v1: https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D5468

On Thu, Jul 14, 2022 at 9:11 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> You can send a patch and it will be taken to testing. Such regressions
> should be easy to spot.
>
> Alex
>
> On Thu, 14 Jul 2022 at 21:03, Jan Vermaete <jan.vermaete@gmail.com> wrote=
:
> >
> > Hi,
> >
> > I think the RDEPENDS on ${PYTHON_PN}-setuptools-scm is not needed
> anymore.
> > Could this one be removed?  And how to test it?
> >
> > br
> >
> > --
> > Jan Vermaete
> > =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hame=
l
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#168038):
> https://lists.openembedded.org/g/openembedded-core/message/168038
> > Mute This Topic: https://lists.openembedded.org/mt/92386355/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

--000000000000a28de305e3fc8dbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v1:=C2=A0<a href=3D"https://patchwork.yoctoproject.org/pro=
ject/oe-core/list/?series=3D5468">https://patchwork.yoctoproject.org/projec=
t/oe-core/list/?series=3D5468</a></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 14, 2022 at 9:11 PM Alexander =
Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>You can send a patch and it will be taken to testing. Such regressions<br>
should be easy to spot.<br>
<br>
Alex<br>
<br>
On Thu, 14 Jul 2022 at 21:03, Jan Vermaete &lt;<a href=3D"mailto:jan.vermae=
te@gmail.com" target=3D"_blank">jan.vermaete@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I think the RDEPENDS on ${PYTHON_PN}-setuptools-scm is not needed anym=
ore.<br>
&gt; Could this one be removed?=C2=A0 And how to test it?<br>
&gt;<br>
&gt; br<br>
&gt;<br>
&gt; --<br>
&gt; Jan Vermaete<br>
&gt; =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Ham=
el<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#168038): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/168038" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/168038</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92386355=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/92386355/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Jan Vermaete<br>=E2=80=9CSuccess is a self-corre=
cting phenomenom.=E2=80=9D -- Gary Hamel</div>

--000000000000a28de305e3fc8dbc--

