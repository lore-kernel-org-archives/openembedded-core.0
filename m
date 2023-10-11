Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21180CD6E77
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 14:59:42 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.18756.1697036375838738930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 07:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e04VMFOu;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7740c8509c8so411550185a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 07:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697036375; x=1697641175; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wNHwS7RGUTZjYD5eTMlZD0CyK3sw2i4xf9+U1qAn5y0=;
        b=e04VMFOucLa7yvu/lWv1xoXUNcyb3Q3oWhX2pt1EoqQmC7154dmM8l4ZunEMBbnWxk
         ri/mPxMw+tFtR27lXWwAbV1WhkwIXx4VPryr9+7UUMDlBIdRttuBs556F5Vmu2CWuHNI
         RYc5h1XX4ghk/R9C6ur2K3LNOb6G9bSZ9Eg6Sn0nWZ0JwiJcx3f0AFdUlwkOdDHch4Fk
         I9gMhHR7Eo9xmV/q5UHS38Ct1BLF+diBcXIElnNSKBE4Nm+cEWVZurSIgHf1G6OyCoRF
         USo6EtHefx9wd6LE/KSJb8O/47PBB/Omfk1yurk1CClQgtZmlbJWm20xikc6vlUxnD7R
         VFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697036375; x=1697641175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNHwS7RGUTZjYD5eTMlZD0CyK3sw2i4xf9+U1qAn5y0=;
        b=JZyW/qt/7wvYg3IO+aA0kBpaGtsPBLlcR3iKstT+PKKG7PA4MfvEpmvvp0W1Xg/QiN
         mDA1MW4qnEa9vH3ocGSpaUfgC+wDc42I1ORHRpBt/5O2aYS93rC5t/FrooOrmGp4tCyU
         3b5V4xnRUKMvQ1AUJR4cvdqQbWv6T9XjQ1bh6hks7kWiJjPO0YrwdBgfqMJRb311CuST
         YqghHIOFgn7iS3ZdIA/c8zwVIP3UYVdeJy6XSfACkksKyONXTIDdfNv0+cbHfVe8J+Ca
         4u6Mf+7omSROv4hy+KSmqhvKuxg6XKqA4c1PY5EsbR12jNxRhFn8w2X4RzoJFfMb4TBs
         SP1g==
X-Gm-Message-State: AOJu0YwfpGoR473XYKJkxcZooUbWDl6LQlzOucq8J7o7WeUPeEgF2t4s
	N0GhAnE20uLcz3fokrSdsZ7ReZR7jSVGrNWQIcI3bHfv
X-Google-Smtp-Source: AGHT+IG5VQv2QC55I0J1f/4HU2NXTUmq6AU/C3hdcNSopf46kLlGVkvTgh/Rgjw4MB6VwbSjvPMXGwqxwVD/8VgVy+8=
X-Received: by 2002:a0c:c407:0:b0:658:243e:3084 with SMTP id
 r7-20020a0cc407000000b00658243e3084mr20361162qvi.55.1697036374491; Wed, 11
 Oct 2023 07:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqMcsqrRDLTar=XE7mGinWQ7bAnCM5ErCecQoooya8nAQ@mail.gmail.com>
 <16085.1697034760953286929@lists.openembedded.org>
In-Reply-To: <16085.1697034760953286929@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 11 Oct 2023 16:59:23 +0200
Message-ID: <CA+cAkepiburSyPt5LNykUzqgbWfqXb_2+EOjj5wHWEL+y0omcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: reproducibility issue fix
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000045c7cc060772129a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 14:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188962

--00000000000045c7cc060772129a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 11 oct. 2023, 16:32, Sundeep KOKKONDA via lists.openembedded.org
<sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit :

> I looked briefly into the issue 15090 (zvariant recipe) description and a=
s
> per me it should be tested before removing EXCLUDE_FROM_WORLD to ensure t=
he
> builds are reproducible.


I'll try do that in the coming days and submit the patch if it is OK.


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188961):
> https://lists.openembedded.org/g/openembedded-core/message/188961
> Mute This Topic: https://lists.openembedded.org/mt/101890610/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000045c7cc060772129a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le mer. 11 oct. 2023, 16:32, Sundeep KOKKONDA via <a h=
ref=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;sundee=
p.kokkonda=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windri=
ver.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">I looked briefly into the issue 15090 (zvariant rec=
ipe) description and as per me it should be tested before removing EXCLUDE_=
FROM_WORLD=C2=A0to ensure the builds are reproducible.</blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll try do that in t=
he coming days and submit the patch if it is OK.=C2=A0</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188961): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188961" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/188961</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101890610/621=
3388" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/101890610/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martin=
sons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--00000000000045c7cc060772129a--

