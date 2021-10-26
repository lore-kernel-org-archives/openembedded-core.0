Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5D1C433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 11:01:56 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web09.10455.1635246116034609521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aRvAG/e2;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id f24so9137774uav.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ulocgwhIF1MPe+X4aoEa0+4dST6WH0d1PXJte+FkJYQ=;
        b=aRvAG/e2Mny344qfZjLlkcFjvuJR2kkRBXRzo2OAx5hYYImCeFsWruXKkdhv0iQRtn
         JQf/JH89g95UY8IVq6nu1b31aTThK5vqe8haicI3RitTeRPqULTuPPfO0LLZ01/8vMyh
         F0oSWId7ArRqle0oqN/jyquhJgQ60VACahas4YNrrw0ZHCa6WixJu6+oZc3CvNDEcPcv
         AFz4nO+2knlL4mqa2pCms44w3mZH9xajP7gR9CovNnsxhjymNVCuJIamKsX1GsARA2J2
         zifhI5I+v9no8UQ1MA4cZ18aCMhyqlPVk+1Kr0IoObtQ1XM4OFCiDXxGaUJctP5fYj8+
         Ak2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ulocgwhIF1MPe+X4aoEa0+4dST6WH0d1PXJte+FkJYQ=;
        b=BAlAuUuw2+jCZ7iZINqj2RuERZzbYoiHk1uHy0am7oN6+ILCYLmb9yctFjrA5XDP+9
         PINkHgpG0JFersIhE3ZP1Zza4xjMenEdWVOKFRVlKPwJAFYCl5iaUqK77J6ZoXFBMQ/n
         tewOP+sRx4dEM5oZJ2r9nSafH2Ah1liwwiEWUZCHpnEdxshOtXhLZXy/1Tpdnz/7f+kr
         5ruXSnmuVDkj+uIYN2oQ0eW1LR8FiDxbLk4gfi5CnLImeF7td4gxkAOGTy3Vz6S4owrP
         BwPA/8EX0pEculJ8me4e6yj5ABAhp6uv6LL8yqkR/LUJN/qe6GwrfzfkeAndpQpvwTN6
         dH3w==
X-Gm-Message-State: AOAM532QQqxTvcTIYCYnHsARMhwa5uHccV53ezNlkFcDKL8N6Ay7Rjjp
	lzYuJUOaGAffFQFdfbhM9wIY1tI0DSydkj4ULrk=
X-Google-Smtp-Source: 
 ABdhPJx1g8Q1BPPO8wV/HPeKnuDyEysmtlVpGk97WOaRkq4H9zSbsM8Vh3OqaH6Db+w9LxHPH+d9gmUjTSO/7znS424=
X-Received: by 2002:ab0:7552:: with SMTP id k18mr9959498uaq.89.1635246115074;
 Tue, 26 Oct 2021 04:01:55 -0700 (PDT)
MIME-Version: 1.0
References: 
 <06387e0dd040237457de963fd13ff3db3e02be61.1635240032.git.martyn.welch@collabora.com>
 <e1285a97073645957532749c71d2de3a02310198.1635240032.git.martyn.welch@collabora.com>
 <AM9PR09MB46423424A75EE5AF6AE482C5A8849@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46423424A75EE5AF6AE482C5A8849@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Oct 2021 13:01:43 +0200
Message-ID: 
 <CANNYZj9JH5B8BTxWQDV=bx3aE1qH52aPROpG0phydEwEDOaJzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 2/2] core-image.bbclass: add default
 IMAGE_QA_PROHIBIT_PATHS variable
To: Martyn Welch <martyn.welch@collabora.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Konrad Weihmann <kweihmann@outlook.com>
Content-Type: multipart/alternative; boundary="000000000000cf355905cf3f67df"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 11:01:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157381

--000000000000cf355905cf3f67df
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Oct 2021 at 12:56, Konrad Weihmann <kweihmann@outlook.com> wrote:

> > Suggested-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>
> That can't be true - or the initial idea is very very old :-) pls use
> Alex's gmail instead
>

I don't remember anything whatsoever about this, and a search in my gmail
for IMAGE_QA_PROHIBIT_PATHS yields nothing, so unless you can point to
where this was suggested, it's best to drop this :)

Alex

--000000000000cf355905cf3f67df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 26 Oct 2021 at 12:56, Konrad Weihmann &lt;<a href=3D"mailto:=
kweihmann@outlook.com" target=3D"_blank">kweihmann@outlook.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; Suggeste=
d-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.intel=
.com" target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;<br>
<br>
That can&#39;t be true - or the initial idea is very very old :-) pls use <=
br>
Alex&#39;s gmail instead<br></blockquote></div><div class=3D"gmail_quote"><=
br></div><div class=3D"gmail_quote">I don&#39;t remember anything whatsoeve=
r about this, and a search in my gmail for IMAGE_QA_PROHIBIT_PATHS yields n=
othing, so unless you can point to where this was suggested, it&#39;s best =
to drop this :)</div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">Alex<br></div></div>

--000000000000cf355905cf3f67df--

