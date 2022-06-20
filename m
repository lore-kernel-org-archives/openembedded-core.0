Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B1AC43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 11:32:27 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.29181.1655724738911601150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 04:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JCfIEcpS;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id b23so2980886ljh.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AhhAVffa8Sr/g+EVz1fEJSOtug0V+UvptYOn3YPaojs=;
        b=JCfIEcpS4VbMbEcEd0XTsvB5O7tsqRHTspycV/MLe0+2DZccAUprgdKJeQMHxs+iow
         om+RavAiMV/IL8VjKt3b5yYNgj3KbgIg3HatXX2qCNGflNgTrFMS5IYWrgXdS4Qgqr3w
         Mwz0BTV2rXp+DH0eSDmVo33n8Y+VsDSOxB2rY7cmAa76AXHMyW2lT9Wl9yEuXtemNpoC
         wgxD7/nIi8N+J9ERVpGOIb9WddoP6uAvKTpAU5ExO14eHdBLEAoJYOppy1ZeSbKsaMLy
         ed4iH8bDAhmJX6opMTpJzjNUBctc4tAenfwNYhEulytVziBuaW+HroL4nakW2IuH7aj7
         sX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhhAVffa8Sr/g+EVz1fEJSOtug0V+UvptYOn3YPaojs=;
        b=MuzpAZwF65rTkUqIj/EtaPpboEM91r58PDsr7jUpSn/X/7FDyUn+vieA9l8iNTjix1
         C2CZcsGOEoadyAjrckoRsPC+jK45Dxvo4iESD+ZPZh17jfsRC+H2GvBaojHP6+eUx9Lk
         GwjYdBtKzATTpxf0kmmTdLi+dNiI+7cNodPNgT1Kon6pfLH813JXqhmsoyX9SM1ZEH5g
         Jh0fD5YOL07PLZaBlFmSy8myfw0P6/BdkBOrzQxNUlNMqnipWD8Kg+OTLT4dekACJoOX
         Z5KQWA5V17YEAq0rB10J9iIPyzfIEJzmIC2CZkV4fxRMESErrRr2Koux8HLdXKrAJg1S
         fcdw==
X-Gm-Message-State: AJIora9hmPODJQEGoxCSP7c9Jd2899zhxeejYhxODQivQ4NIjVJMnew9
	lkuV9ShZi1FebZFnR9L5D/EPA1GpeV7Y8j7UUho=
X-Google-Smtp-Source: 
 AGRyM1uYEIhvxGSbWeNqMCZJ0tq5zgMooJngdOARmuzb7gDOJjPvAsDX+rea/WT8zyjNR+UjiF9OQB6CxA/J3IejQRo=
X-Received: by 2002:a05:651c:54c:b0:25a:621e:5cf2 with SMTP id
 q12-20020a05651c054c00b0025a621e5cf2mr5294502ljp.87.1655724736905; Mon, 20
 Jun 2022 04:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220620090819.84400-1-davide.gardenal@huawei.com>
In-Reply-To: <20220620090819.84400-1-davide.gardenal@huawei.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 20 Jun 2022 13:32:04 +0200
Message-ID: 
 <CAApg2=T-XaL3b=-wcsAgU3=Gf51KXgBMdfkUHNgDkpNG7LBygw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH][RESEND] efivar: add musl libc
 compatibility
To: Davide Gardenal <davidegarde2000@gmail.com>,
 Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000ca05d805e1df744a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 11:32:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167093

--000000000000ca05d805e1df744a
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 11:08 AM Davide Gardenal <davidegarde2000@gmail.com>
wrote:

> Backport patch to get efivar working with musl.
>
>
Steve,
do you consider picking this one up? It is blocking the cve-check on world
on our side.

Kind regards,
Marta

--000000000000ca05d805e1df744a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 20, 2022 at 11:08 AM Davi=
de Gardenal &lt;<a href=3D"mailto:davidegarde2000@gmail.com">davidegarde200=
0@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Backport patch to get efivar working with musl.<br>
<br></blockquote><div><br></div><div>Steve,</div><div>do you consider picki=
ng this one up? It is blocking the cve-check on world on our side.</div><di=
v><br></div><div>Kind regards,</div><div>Marta<br></div></div></div>

--000000000000ca05d805e1df744a--

