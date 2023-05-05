Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744B6C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 09:53:03 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.23274.1683280379571653887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 02:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gXqCh/KF;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f1394cb0d1so1769495e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 02:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683280378; x=1685872378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRrtlstU9VZiqheaZeVgNiAAZnH78h7gVpI84T7D3yc=;
        b=gXqCh/KFzSIzQXSKg6k859mAo0ZzpoanvWAFQQvT+nmbDlgVZjjMRmmv68VAgmBSic
         2qyyAanGyeyCNxlGmMk3XeufEZsywvN8Fn0TmJe27CjD30Mo1brcKHZQ8Uz2tYVMt/uQ
         uhzoF3wxADiQ6FpaO1ExBG80GRX5abDc5SoO+aah0bQ7e2yrjrl53va1OxzrY/xfc67q
         EQfg5z2TFCV4f8bUPVzTLZKP87bOuzLZhC2997VJvwZfzq30qoh536REeoA3m4r8/+dm
         Sjz8g5qhRn8vRc8peOzu2pf656naPoY6o9m4PVndxArvDxziWXkX5vFmzi/tMXOnxfT9
         F/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683280378; x=1685872378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRrtlstU9VZiqheaZeVgNiAAZnH78h7gVpI84T7D3yc=;
        b=d8bHuQxoJGjb6QtYMA+U5/1Bkua/Gy1ASm1fL0ojQ3vaNtHaulsbk3RB1TSrdrCOXp
         CKPhp/OADhQsM3a1LiEK6qXNNDkDX+hroBFTFgYQCMg8NJUT6dsdrKE9voOSaxjq0Qei
         eqNTEUqawDYUT6nR/U9whazXBHp97gmghrMsQKOHMCkmbyYOVNEZveAMCjUwGjGyBlD1
         qZAJgBHTOhbO2hufEJiZZbU6xi8+V9gDW0DRxX7sWKHUTDdTNyFcT18sbHTbRT38xVHs
         ZFXJNuOqoUMMl/fWycXFM3MbaX8cVD40wG+zdJQzUCGeaaBtTthK1+lGU+P44zCWRpcE
         FL0Q==
X-Gm-Message-State: AC+VfDw2OSXfjQETi5oP4VR6ZOgBB8PkNv7PI7hAPglWc8DOet1/Yojp
	z1KEy/QMQrx5uKdGlh07UlZL6aCWaunEviXB43k=
X-Google-Smtp-Source: ACHHUZ62YFXg2MlBb6bc9rVd0RL4yBwgO5CqnBbDF0NMUatT3d+tn9b7qHwfY36flZb1rHo9oCo/tkw9Dh3uLdzqnwY=
X-Received: by 2002:a2e:2e06:0:b0:2ab:d1b:dcb2 with SMTP id
 u6-20020a2e2e06000000b002ab0d1bdcb2mr260122lju.38.1683280377565; Fri, 05 May
 2023 02:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAOT3mi+DorC4uSqCwO7HmmFVuXX3BLFWJNp_o-NH4OmqP=6ZSg@mail.gmail.com>
In-Reply-To: <CAOT3mi+DorC4uSqCwO7HmmFVuXX3BLFWJNp_o-NH4OmqP=6ZSg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 May 2023 11:52:46 +0200
Message-ID: <CANNYZj-L2PFH=5M0RWEtGq9Xmrq79A9-yFKQEg4khmXap77dpg@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Community Manager updates
To: Nicolas Dechesne <ndec13@gmail.com>
Cc: yocto@lists.yoctoproject.org, yocto-advocacy@lists.yoctoproject.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Josef Holzmayr <jester@theyoctojester.info>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 09:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180903

Thank you for the work over the years Nico; it takes a lot of
organizational effort for things to simply 'go right', and that effort
isn't particularly visible most of the time, which only makes it more
valuable from my POV.

Alex

On Thu, 4 May 2023 at 16:40, Nicolas Dechesne <ndec13@gmail.com> wrote:
>
> Dear all,
>
> After five years, I have decided to resign from my position as the Yocto =
Project Community Manager. I joined the OpenEmbedded community around 2008.=
 I have fond memories of my early days, and still remember some of my first=
 interactions on IRC and mailing lists! This is a very welcoming community,=
 always helping new people with patience and kindness. Serving the project =
during the last five years is something I am very proud of, and I will be f=
orever grateful to all of you for accepting me!
>
> During these years, we have gone through a lot together, the pandemic gav=
e us an opportunity to rethink how our community should come together. Sett=
ing up our Virtual Summits has been a lot of work (and stress!) for a group=
 of few people, but the never ending success of these events has been very =
rewarding! Our online presence in social media has dramatically improved, a=
nd allows us to reach out to and interact with our community faster than ev=
er before!
>
> On the side of all the technical changes, and releases, we have also esta=
blished the Yocto LTS process which was a recurring request from the commun=
ity and has become a strength of the project! We also revamped the project =
documentation to make it easier to maintain and contribute. The Yocto Proje=
ct documentation is such a great resource for our community! I have spent s=
o many hours on these PDFs in my early days!
>
> Anyway, let=E2=80=99s not focus on the past! The future looks bright and =
I am really excited to announce that Josef Holzmayr has accepted to take ov=
er the Community Manager role. Josef needs no introduction, he has been a k=
ey member of this community for so many years. Thanks to Josef's relentless=
 efforts, we have grown our social media presence on Youtube, Twitter, Link=
edIn and Mastodon! His energy will be a great source of inspiration for thi=
s community! I wish Josef and Yocto the best for the years to come, and I a=
m convinced this community is in good hands and that Josef will be a great =
community leader!
>
> Many thanks!
> Nico
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180877): https://lists.openembedded.org/g/openembedde=
d-core/message/180877
> Mute This Topic: https://lists.openembedded.org/mt/98685136/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

