Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0569C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 08:41:08 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web08.8841.1635324067405777048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 01:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i4mextnr;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id o26so3457327ljj.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 01:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g8zFGl2Z7dHXUNkBLe6WjYHZYrbyAxiSTnWlxziDHbg=;
        b=i4mextnrH7xWQTi1+JTGP8ChSCxZ1wKXuHD6X+PedMDsCPRTDZNzUu3nNQcYVD81xK
         vRjpxNOon12y39obEqh3bFxplQrThJAwd/NH4nxjo8a73vizVWy3RwDpatkMlVwodXns
         APCB+se9L6q/2PZNnTZU+cgqLvgqeeMnM9YeBSV88Mfg9cIh73hUloFVrg9fcSUt61vd
         f/VRew7FRVI1EflWtd+EHHyR/YIBM8FQA9iKQDGY5q8qoRM1ubk1gw+MYLHGagfT4Tkn
         n7345IgWJ2QcGijqhEIluWCBcbICLaC2/nWonn8daF0/lRM6D1OxyEl7WQCi0Y3cVgPm
         oJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g8zFGl2Z7dHXUNkBLe6WjYHZYrbyAxiSTnWlxziDHbg=;
        b=YY1OygSp8gfWm31YXHpRW0gkctS8XOOpDfbi0FPx6bLhmlDxXhVASxd4F1V2qatV9J
         7dpYA/q/JHcC9UCThqsfqV7huTctqjHJedDz1dK3ZiZZBoy11aq5Smb/2h0UcBR7VwyD
         9wBUYRnWLsbFT9kUChHVgq889pUW7Gpc0FgQvNsVzr5j+4azKbdq1bF5ynKFr9tH3YkR
         IxCi+hMoNl2+j5Tfte7ZAPkcFagqUljpPCTcuHyY492Mb5IlcXlFtkGlMrV+/ks9PQ0F
         LqeZh63Y2pTUJhI/453cYiPDUfBp5NHO5nOozhSo+ybxjAF8Rs5JxvCsUFJvGTMWXIv2
         FYNA==
X-Gm-Message-State: AOAM533urWMmd0asF68QXYUGMYXfbvkZFy/oj0R1pN1Myqgdt3pXoXQf
	dJcii6fMn/5q+SIQimx0pizLHy8RdQRkTBBoTgw=
X-Google-Smtp-Source: 
 ABdhPJzhaHrs9j672J07VdDSOwYEV8/g0Qet3+dzQyG7puNHIaXd7z4uKXT+AJgkZz4RUGgrt8Wv7JWOST2yvaiU7NE=
X-Received: by 2002:a05:651c:1693:: with SMTP id
 bd19mr32886908ljb.409.1635324065334;
 Wed, 27 Oct 2021 01:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211027013050.137364-1-saul.wold@windriver.com>
In-Reply-To: <20211027013050.137364-1-saul.wold@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 27 Oct 2021 09:40:55 +0100
Message-ID: 
 <CANPvuRkxEFt7LHO_BAnQpEWU=T9ctFh45d+SzFfe=jBHUOH1aQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] SPDX: Add annotations to relationship
To: Saul Wold <Saul.Wold@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000001cadb05cf518e2e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 08:41:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157476

--00000000000001cadb05cf518e2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

There are any plans or is it possible to backport the SBOM/SPDX to the
dunfell branch?
Doing a quick look on it I see that it is not too intrusive and the most
one is in
 classes/package: Add extended packaged data
 7ec54b174304e940ec66f21ac512f7b50fa637b3

Jose

Saul Wold <Saul.Wold@windriver.com> escreveu no dia quarta, 27/10/2021 =C3=
=A0(s)
02:31:

> Add annotations to relationships and refactor code to add
> create_annotation() function for code reuse.
>
> Ensure that "cross" recipes are factored into isNative also.
>
> v2: removed leftover and unused annotation per Joshua
>
> Sau!
>
> Saul Wold (3):
>   spdx.py: Add annotation to relationship
>   create-spdx: add create_annotation function
>   create-spdx: cross recipes are native also
>
>  classes/create-spdx.bbclass | 22 ++++++++++++++--------
>  lib/oe/spdx.py              |  6 +++++-
>  2 files changed, 19 insertions(+), 9 deletions(-)
>
> --
> 2.31.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157470):
> https://lists.openembedded.org/g/openembedded-core/message/157470
> Mute This Topic: https://lists.openembedded.org/mt/86616599/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000001cadb05cf518e2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div>There are any plans or is=
 it=C2=A0possible to backport the SBOM/SPDX to the dunfell branch?<div>Doin=
g a quick look on it I see that it is=C2=A0not too intrusive and the most o=
ne is in</div><div>=C2=A0classes/package: Add extended packaged data<br></d=
iv><div>=C2=A07ec54b174304e940ec66f21ac512f7b50fa637b3<br></div><div><br></=
div><div>Jose</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Saul Wold &lt;<a href=3D"mailto:Saul.Wold@windriver.com"=
>Saul.Wold@windriver.com</a>&gt; escreveu no dia quarta, 27/10/2021 =C3=A0(=
s) 02:31:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add an=
notations to relationships and refactor code to add<br>
create_annotation() function for code reuse.<br>
<br>
Ensure that &quot;cross&quot; recipes are factored into isNative also.<br>
<br>
v2: removed leftover and unused annotation per Joshua<br>
<br>
Sau!<br>
<br>
Saul Wold (3):<br>
=C2=A0 spdx.py: Add annotation to relationship<br>
=C2=A0 create-spdx: add create_annotation function<br>
=C2=A0 create-spdx: cross recipes are native also<br>
<br>
=C2=A0classes/create-spdx.bbclass | 22 ++++++++++++++--------<br>
=C2=A0lib/oe/spdx.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 6 +++++-<br>
=C2=A02 files changed, 19 insertions(+), 9 deletions(-)<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157470): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157470" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157470</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86616599/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86616599/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--00000000000001cadb05cf518e2e--

