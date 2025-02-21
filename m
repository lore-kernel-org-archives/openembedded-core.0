Return-Path: <rob.woolleywr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F10C021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 16:54:15 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.28007.1740156849713168448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 08:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l8MI2++V;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: rob.woolleywr@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e587cca1e47so2209821276.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 08:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740156849; x=1740761649; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AfoIiBKCsej9f6TKhitiBmCOO0cLp4FJwGDuMHcaOk8=;
        b=l8MI2++Vh9BcsytSjXCTv78wW/eVlsRBZTbblV4B7J3ko6LHNZ7Dcn3Lc/4XvZQdLW
         EVUpwKExeoYsrvZyca90YHhS/x3hGPXwjzHALEQ4vW7b0JzKQWg/8oXYqZ5K0jyw/nuc
         fT9NAoy9x8pT6y+AdXgI0UCjU618FoqfqniaN0Mcc8ex6uN2CRBrb/f6Dr48yoor3cTw
         XuINC6tLzY8pxjAAx4Yxh/7YlttWreJBfAwPg1yLeOIfbjUkfAuysyTgxwcsMw0S/aTh
         Or8PopVBUdINqs9W0y8XK7NfuRCqAIyB5aeX7957UiJWDF0wqppWFhF57ej36GncAQ+1
         ZLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740156849; x=1740761649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfoIiBKCsej9f6TKhitiBmCOO0cLp4FJwGDuMHcaOk8=;
        b=LhbqCqxx5V5/uW0BMpLlkfcc6O81xxReDcxWyxzebNfp/AG67e4xxxb9M5Hnxg9oBB
         W4As51S+yZ5INsAklMayrq7orKSxazN15VFBK7fKIehdSgH5VpF2xI2UkmnXnT+aYHxS
         vfAlsqPAT6uB+H0pcu+WxMhxzYhsSYkao70e9fO2uC4XvFeew0hOk+oilFOEozhtuRcp
         BOJIlvgd9Yf6kN9nETXILLxri1C8dbcdi5GIGZ1HbYua6d4QAW8s6UqYbGalnew+ZRbE
         wmoS2JvDn/xBfH/nyrumvc/CvbyZopdsHDh/Zne4//E1ZXWX3ziwTFzIpP8rl/SiqRjl
         wQsg==
X-Gm-Message-State: AOJu0YyVWHIMTlJYYjUYNLiTcrvO+PpBOYn6YpwKtl+aavVHUwQV6RBB
	o5NCnwvHbQJyAbsgrna/7DQoYWwM6OHyqJc2NZauaMgXvAvHXjm6CG2v6KGsRr8iEwLJWkuTjYR
	hDvmMJTGSFD5gSXuf5+oHs13xQCcWSg==
X-Gm-Gg: ASbGncsXTJpzhl4pN/3wby7RoysWbdKs7mx9Hg/fdM5MctZ/T98Cl0xmDnKQnn5Lr0c
	mt5wzuy3qU8l1goQFauFJfuS0ZjVMG5Z/PHic03s7JOd5YiH/cLyqRjt3kjhy2lUyZ0/H5Zl2OR
	fSbn8MBHS8
X-Google-Smtp-Source: AGHT+IFjIho2EdMQmOhZuxGlaq9KpZczGZZykNTGQDF4uPo8oEoPS2eVhmeIBj4DYYyR8IMauOoEwl30338ZqzW03Qw=
X-Received: by 2002:a05:6902:248f:b0:e5d:bf2a:ba02 with SMTP id
 3f1490d57ef6-e5e246a4fcemr3576093276.49.1740156848786; Fri, 21 Feb 2025
 08:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20250221143811.2072024-2-rob.woolley@windriver.com> <23323.1740156586093876764@lists.openembedded.org>
In-Reply-To: <23323.1740156586093876764@lists.openembedded.org>
From: Rob Woolley <rob.woolleywr@gmail.com>
Date: Fri, 21 Feb 2025 11:54:05 -0500
X-Gm-Features: AWEUYZn0hK-GBJ7WWveE1mXuKUBgTTCQWxVX2hHItVvPU3tNQgvv8F2bTX0l-4Q
Message-ID: <CAGAhMBw5SrZWJprdgjnDw5SxDeKeRgVgDi_t6aMo2UbKLbM6uA@mail.gmail.com>
Subject: Re: [oe] [OE-Core][PATCH 1/2] libglvnd: add new recipe libglvnd v1.6.0
To: vince@underview.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d3586d062ea9d6b4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 16:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211812

--000000000000d3586d062ea9d6b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

Thanks for reaching out.  Yes you are correct, it is already in master.  I
was hoping it would be considered for Kirkstone.

However,  Alexander pointed out it may not be eligible for backporting to
LTS.

Regards,
Rob



On Fri, Feb 21, 2025 at 11:49=E2=80=AFAM Vincent Davis Jr via lists.openemb=
edded.org
<vince=3Dunderview.tech@lists.openembedded.org> wrote:

> Put in wrong chat.
>
> Hey the libgvlnd recipe is already in meta-openembedded
>
>
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graph=
ics/libglvnd/libglvnd_1.7.0.bb
>
> Personally believe this may be a recipe we want to promote into oe-core.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211810):
> https://lists.openembedded.org/g/openembedded-core/message/211810
> Mute This Topic: https://lists.openembedded.org/mt/111309002/556952
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rob.woolleywr@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d3586d062ea9d6b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Vincent,<div><br>Thanks for reaching out.=C2=A0 Yes you=
 are correct, it is already in master.=C2=A0 I was hoping it would be consi=
dered for Kirkstone.<br></div><div><br></div><div>However,=C2=A0 Alexander =
pointed out it may not be eligible for backporting to LTS.<br><br>Regards,<=
/div><div>Rob</div><div><br></div><div><br></div></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Feb 21, 2025 at 11:49=E2=80=AFAM Vincent Davis Jr via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;vince=3D<a href=3D"=
mailto:underview.tech@lists.openembedded.org">underview.tech@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div>Put in wrong chat.</div>
<div>=C2=A0</div>
<div>Hey the libgvlnd recipe is already in meta-openembedded<br><br><a href=
=3D"https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-gra=
phics/libglvnd/libglvnd_1.7.0.bb" rel=3D"nofollow noopener" target=3D"_blan=
k">https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-grap=
hics/libglvnd/libglvnd_1.7.0.bb</a><br><br>Personally believe this may be a=
 recipe we want to promote into oe-core.</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211810): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211810" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211810</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111309002/556=
952" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/111309002/556952</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rob.woolleywr@gmail.com" t=
arget=3D"_blank">rob.woolleywr@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d3586d062ea9d6b4--

