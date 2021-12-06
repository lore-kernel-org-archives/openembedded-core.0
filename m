Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032A4C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 11:21:17 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web08.50127.1638789673599896303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JQ0foOCX;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id y5so18721092ual.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wPuV3pp/2+vRfllrOrKcy55floclIiUlKUuifiJuryk=;
        b=JQ0foOCX+kZqh+9JrQfx8Tot2+09UgIgbndtZUPR/xSwvhKp4rV8+8qzlLsgZO+rf8
         H5EYrb8vBawJe70Z2CkfH8t+f4JDLVZ+D/OfQS64kR/1SARwfbe8HcZA9Oy8gkyZEUiB
         T2iUonzRGd9lgaYsGumh1zVHUeQtf5sxsrklR3Otk2B2vOWFTU9o5E4NTsqPN6PGrjLu
         NO7dJeyRe5iSs9Fp9e+UyeARBOGHpCVX10/cvWtReHniC/UnvlFKr2bB2+nig9Do9Hhq
         s6fyY6JCL1NqCtG3DeZqcRMBji958TE/ggq5gmMG5g8zgAfoP+KDUnF6ENLjLD/GW8eZ
         mjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wPuV3pp/2+vRfllrOrKcy55floclIiUlKUuifiJuryk=;
        b=HUACoAZa6sJyELhwKDYAr9e1gElNNV4BzAQFeQAsEu6S7yaIem4/yL7atpYXeSzUjO
         PbIl7cPVLAi5xnrsB/caP+S/mx6JWAdVX9jyzOJI/XjOLwh/6bpuvhbhnYmdHf1AZdsd
         qIIrgwSTfZPpKyeYz1KsEBjIp090aq6NQ4uHtk6keR+K5p3b3bb0Ml/MBTrIm4IchxyL
         MMk0UOnmM49XnbXpoUZI6y5vMccbSU5e9rv9vZwWzFg1bfuTsb61K8OS6g1II7UHe4lK
         GIgAel3rYpAYO4nkV+IbviLVg1mUQaMPV3S3ktloiaLwMAS9NjT0m1Gy2b6EwXY03+jo
         WPSw==
X-Gm-Message-State: AOAM533+ZRQpoHPGwQpZy36sakaGxtYtrondVR5R34Y2zyY2jn7qABvs
	szB7oJC3NJfmKIVwGb5/DlbHGlz1oku4UJdfj/4=
X-Google-Smtp-Source: 
 ABdhPJyocXRARfInqbl8ymeT2Pi512VeaziJCuleCJ8x51c92Iwyfhe0/V57vU9aUeZScMDxZvw0GL2tzI6tuogLYDA=
X-Received: by 2002:a67:efd5:: with SMTP id s21mr35719291vsp.73.1638789672805;
 Mon, 06 Dec 2021 03:21:12 -0800 (PST)
MIME-Version: 1.0
References: <20211206083629.2591982-1-alex@linutronix.de>
 <CAAnfSTuCwTFgkKTSVXUtO3e7nT82yWpMO_h11EWE01Q+PgC9gA@mail.gmail.com>
 <16BE263B28F8C771.1147@lists.openembedded.org>
In-Reply-To: <16BE263B28F8C771.1147@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 12:21:01 +0100
Message-ID: 
 <CANNYZj_0OA-CEfZbdm1V2mvJBbQWmuqf=+2q+w+kTH+NirrVTw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] insane.bbclass: lock down pending patches
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000004f2ad405d27874f3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 11:21:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159221

--0000000000004f2ad405d27874f3
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Dec 2021 at 12:15, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Mon, 6 Dec 2021 at 11:24, Ross Burton <ross@burtonini.com> wrote:
>
>>
>> As much as I hate pending patches, and I really do hate patches that
>> sit in pending, there are situations where you know the problem, can
>> work around it, but still want to push it upstream at some point
>> pending further discussion.
>>
>
> These situations are rare and you know it. Almost all of the time it's
> laziness and abuse of pending so that submission can be avoided altogether
> or pushed onto maintainers, e.g. me, not a 'need for further discussion'.
>

I want to add something: if there's truly a need for further discussion,
that need is typically with upstream, and so the patch can be marked as
Inappropriate [link to upstream discussion]. If the patch isn't that good,
file a ticket instead and link to it.

Alex

--0000000000004f2ad405d27874f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 6 Dec 2021 at 12:15, Alexander Kanavin via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a h=
ref=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, 6 Dec 2021 at 11:24, Ross Burton &lt;<a href=3D"mailto:=
ross@burtonini.com" target=3D"_blank">ross@burtonini.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
As much as I hate pending patches, and I really do hate patches that<br>
sit in pending, there are situations where you know the problem, can<br>
work around it, but still want to push it upstream at some point<br>
pending further discussion.<br></blockquote><div><br></div><div>These situa=
tions are rare and you know it. Almost all of the time it&#39;s laziness an=
d abuse of pending so that submission can be avoided altogether or pushed o=
nto maintainers, e.g. me, not a &#39;need for further discussion&#39;. <br>=
</div></div></div></blockquote><div><br></div><div>I want to add something:=
 if there&#39;s truly a need for further discussion, that need is typically=
 with upstream, and so the patch can be marked as Inappropriate [link to up=
stream discussion]. If the patch isn&#39;t that good, file a ticket instead=
 and link to it.</div><div><br></div><div>Alex<br></div><br></div></div>

--0000000000004f2ad405d27874f3--

