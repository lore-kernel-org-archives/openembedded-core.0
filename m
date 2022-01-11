Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2710C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 11:10:52 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web08.5566.1641899451705243569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 03:10:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hq0ETgNs;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id x33so27630938uad.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 03:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E6G9GN/UwfedgUpUqw0rWgDhirXNauepsA9spGNqHRM=;
        b=hq0ETgNsjwgqoeveClZW5o03QxlrC6g7wA0wKUT4ebg/T83hRaa6qNwoEaLJ398fKw
         AZQuUQxHH1MYCesc5hgPGAG7CqRyv9XNZuOTviWF/J69X0bq+ULzAzkKU9qY7tviXNoW
         EKKRE5V5O5SUQyobZyuN6JYPB/9tCvedVcZ8FNGOeWTi68jL+N9gtVq7q/a/OVKrAuEY
         kx+gxRBgEKtT2sd9Q4aZ8Oc/g2gcVJ/DaLo2DQhuFT538CBfIH3UcPN0ABiQMnHSDGV6
         HGmDk5MKA+0P8dC5c3zbMgEWJoXrRef1BGmkmU/eKAVcbCpWDK7wGWlpJzdPEHhbIZI3
         DBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E6G9GN/UwfedgUpUqw0rWgDhirXNauepsA9spGNqHRM=;
        b=glhNvc4fFdDzaqSC02b1vr4VRzAyFU9zy1f2KIc90W03LeihB0XX/6JgFIJbfcywEp
         VK/59wzZcaqhdM0HJQA6dGRu6BmdJZEkHpgJJ3VX7ma102xOybF40sLdgc17WaVNexUx
         GoC9OMjkfpGtPhTvn83gEHUDyvXJTQTT+ExxuQS1ENPjHg1Tdt6icbWD9E0byinxa+WK
         +i3uy+gvgg8T60WuL0i5epKEzT0CMvVK6K+xhUpFJdgcGmqxKYRcWg+eED2n2Uzn5z5H
         Q8N7LvyAO+REfKc/94pdzijWW94v+FYMF8vGJIttjE22oJF5wVkLE42suekEmFdOBJyt
         B0kQ==
X-Gm-Message-State: AOAM531TB3Vm7nMX4G2z81ksEpcJGGqDA22c3QjjotoLBEJSnpQR1RwX
	AVVEWQuQWXNBHlG9dMCXZvGWQUZNvGvNhCpJ/Lc=
X-Google-Smtp-Source: 
 ABdhPJwl6v8gd/Dshgq5O2J9oPoyCCqa1srerFoX+Ig+DiqRVvNCwXuTnyTbr0gjN6MyrJFGGJIqLChCjqCftYh1/to=
X-Received: by 2002:a67:c81c:: with SMTP id u28mr1639079vsk.38.1641899450824;
 Tue, 11 Jan 2022 03:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20220109222732.2252416-1-alex@linutronix.de>
 <20220109222732.2252416-13-alex@linutronix.de>
 <b13cebc769646dffce33ee9b675375d4c22ef7bc.camel@linuxfoundation.org>
 <CANNYZj9jRkc32Xm7PevLuFEgLOxTdaq7bYGu9=_gU3PitT7_-A@mail.gmail.com>
 <8993e498bf8d266832f911b7b2c7263ccaf418e7.camel@linuxfoundation.org>
In-Reply-To: 
 <8993e498bf8d266832f911b7b2c7263ccaf418e7.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jan 2022 12:10:39 +0100
Message-ID: 
 <CANNYZj97rvKykUrrnbuzD8w77-AEo+kaFLdC=HqC0mhLd79krA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/14] connman: do nothing in qemu,
 do not touch eth0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000085fe3305d54c8110"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 11:10:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160394

--00000000000085fe3305d54c8110
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Jan 2022 at 12:08, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The data above is inserted into /etc/default/connman in the connman package
> itself. That package is installed into deploy/XXX/<tunearch>/connman.YYY.
> That
> is not the machine specific package directory.
>
> Or in different words, if I build connmand for a qemu machine, then build
> connman for a machine with the same tune that isn't qemu, command rebuilds
> but
> installs the package to the same location. This is not allowed.
>
> Machine specific data (in this case qemu specific) shouldn't be in general
> packages. This goes against yocto-check-layer and YP-Compatibility.
>

Right, I can fix this, but is there a testing gap then? This prompted no
warnings on either local builds or in a-full.

Alex

--00000000000085fe3305d54c8110
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 11 Jan 2022 at 12:08, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
The data above is inserted into /etc/default/connman in the connman package=
<br>
itself. That package is installed into deploy/XXX/&lt;tunearch&gt;/connman.=
YYY. That<br>
is not the machine specific package directory.<br>
<br>
Or in different words, if I build connmand for a qemu machine, then build<b=
r>
connman for a machine with the same tune that isn&#39;t qemu, command rebui=
lds but<br>
installs the package to the same location. This is not allowed.<br>
<br>
Machine specific data (in this case qemu specific) shouldn&#39;t be in gene=
ral<br>
packages. This goes against yocto-check-layer and YP-Compatibility.<br></bl=
ockquote><div><br></div>Right, I can fix this, but is there a testing gap t=
hen? This prompted no warnings on either local builds or in a-full.</div><d=
iv class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div=
></div>

--00000000000085fe3305d54c8110--

