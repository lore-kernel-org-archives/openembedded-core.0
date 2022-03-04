Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B173C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 20:14:35 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.1294.1646424874773038639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 12:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VFjP0Iig;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id w1so8388867qtj.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 12:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pAAZP3ggt+TxVnGUqJhIrBNvoARpUPUh4jgFieuyBTw=;
        b=VFjP0IigrW6BC2MPYFjFSJ2Y6VgxvDaoJry/mkCGG/XhtJShma+5Sr4ybE328flIBN
         itWRaPhOma/Q7zOW62H1HaSyKrM6GAKdZu1S/lxR921qy+46PItU09H4rWNnNkisMV8R
         0DIMnAEuuVXta6A6tAZIFAkcEf9YlNwk3KkiDaAf+SA8A1gD8q2UVzrLojOJhC+4jTk4
         1HookDLqBd6uYkjdX7Y8TA8evwmQt0DV3eTq+UVLiUfvookh2B4YGmdb5BjPOCZBhP0v
         zQpQrAB5i3vkHxIMx5wxdpwEA+Li+k82cdNCOSTXdlb1qrWVBs2jsCoezhaC1sp/frvf
         1kMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pAAZP3ggt+TxVnGUqJhIrBNvoARpUPUh4jgFieuyBTw=;
        b=WlibrOQQD7JsUWzyJmK/5Atb6BU3/1bgNvL7kxF6mEk90Tz6b9z4USfg++MlQPpMUb
         WiIzGGdXrR8o5/BH360PNqEffpirW9EgseHBXUddxd2df5XNoJXqrgQeQmo7L7pYJHer
         J+lsqKCXfSxQYuJ9Yo27JttLv/WEsqm2mHFDXsCvxdfvuEjiKR0F/RRUs6fC8BikOZHL
         PCj0sGo5P7Pc3XWmq8WZgG1cFihq3nCEJPNg6N8HPsXqQG1h9aTNSGFdsChBm5NIPYoZ
         ybr9dW5B3qdcr50pr9lbWS+nE2ej7i/kBn4gwj3sPi6MPiu8LFU7JgaybkOFvP/IjIRk
         EudQ==
X-Gm-Message-State: AOAM531ly61MnUxz6iM07ROIsdy2bdXawZkPFBDgwzJsbiezYtSMGuNl
	FKJrIiaETx5bJzlibrGdqDbl1uMylLCiwfFmGwM=
X-Google-Smtp-Source: 
 ABdhPJyUB79ZmS9hNrMZusVuS6AP+//1FPTOyUjQyVJZ2VGRNenghePQGyJZogSg6mulh6zXt6H7LiX7+xKxybYkAvk=
X-Received: by 2002:ac8:584c:0:b0:2dd:aaa6:7865 with SMTP id
 h12-20020ac8584c000000b002ddaaa67865mr435165qth.330.1646424873823; Fri, 04
 Mar 2022 12:14:33 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAP9ODKrZT9A=fdjUekvAHEch9LFjNt3mnH+jnGXGK0DR0BOvww@mail.gmail.com>
 <AM9PR09MB46428B351F1207869AA667DFA8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46428B351F1207869AA667DFA8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2022 12:14:07 -0800
Message-ID: 
 <CAMKF1sp6ZO5ZL9WY2z7QP_eMDC9+uB3yBMpzFrKyaTNdHqYvGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: add setuptools3_legacy
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Ross Burton <ross@burtonini.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 20:14:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162756

On Fri, Mar 4, 2022 at 11:20 AM Konrad Weihmann <kweihmann@outlook.com> wro=
te:
>
> If it's about meta-python why can't be placed there? I don't follow the a=
rgument that some edge case stuff outside of core requires the project to h=
ave additional (as of now not time limited) maintenance effort - if there w=
ould be a clear plan to remove that before kirkstone release I might agree,=
 but with the release looming this all feels like abandoning the commitment=
 for the upcoming release.

it is about many layers e.g. meta-oe, meta-xfce, meta-python and
perhaps many more that I have not come across yet. We want to enable a
wider ecosystem and we
do carry features in OE-core to do so from time to time. Core in
itself is a reference distribution, its not meant to carry just what
it needs to support a minimum distro
it serves as a baseline for many distros which may include other
layers. At times we do put specific features in specific layers, this
is not one of those.

>
> And just to emphasize my claim, if there's nothing in core that would req=
uire this patch it won't get tested, so it's another dead end.
>
> In the end it's the decision of the project leads, but I would be persona=
lly be disappointed to take the easy way out here.
>
> On 4 Mar 2022 19:01, Otavio Salvador <otavio.salvador@ossystems.com.br> w=
rote:
>
>
>
> Em sex., 4 de mar. de 2022 =C3=A0s 13:56, Khem Raj <raj.khem@gmail.com> e=
screveu:
>
> There are recipes in meta-oe and meta-python which would need this
> and both layer only list core as sole dependency, if we put it in either =
of
> these layers, then one will depend on other which is not nice, so I rathe=
r
> would prefer it in core.
>
>
> Couldn't those recipes (depending on Python) go to meta-python?
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>
>

