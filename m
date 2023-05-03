Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CDBC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:56:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.18293.1683118594418320192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 05:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=DU7Y5v5k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f1738d0d4cso31735655e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 05:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683118593; x=1685710593;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FiNBzJRRj+zkHb8shuoE6ezIqBsT+BmvEkUmzyvScg4=;
        b=DU7Y5v5kGh0WysLfFFo/wGyHkrlJOhZmHz9RMPyjUIo03PJcicGdLlXDU5CLSq6Nw+
         p8df6yhMrNJgWoj2cflKrNcUoad/2bmwPXaoHot3p4EX+GHut7xDzImHI2Xq1ND44lkZ
         TKY2HZQ2alzlCDTIfOZVPgjbHBkVoWQZFZpTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683118593; x=1685710593;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiNBzJRRj+zkHb8shuoE6ezIqBsT+BmvEkUmzyvScg4=;
        b=M3NhYl0VblKC4scriBmRwT0R9NfyQ8v1m+HhZCWBUJ9pusgdoJ6BoJY+idugAeWA8T
         VzEBUXf2HI0KA5qU83RZCnNpMdQ210VEHaAGwyAja9kyeO6KTN4+JTM74iSjU//5xmIQ
         nwC1GaiSXNYQ28IiuzGKSDEEOj4M4SUko/LndwoSmy8JFzr34y9FH1wAcmOVPK4cxEcp
         B3v6FvPwYiN9LzC6Pjg1Y8N+kQYh1HdI9687k4aiYXwqJmzEJDnkAqUSY7VF/KtWesI9
         a5yELAK1M6/6e+DkWOyyeSSFP8b0uyt4AR3PktHlNKeRntKujuaArIwh4vyxo5066uX2
         MUnQ==
X-Gm-Message-State: AC+VfDx2Cr2z8QeX+wUrinSzjqQ5B4PlN6brkSx5Ka80MRccbaBMVV4u
	yUq/5NpNS1CkKo1EgnoNdWoeLg==
X-Google-Smtp-Source: ACHHUZ5DBgWolj6qNErjE1xJ94pfRlYBB7Xe+r/CscI3R/oQ3uJwTmzL+EmfoUOjr/G5y79fei5X6A==
X-Received: by 2002:a1c:cc13:0:b0:3f3:468c:a783 with SMTP id h19-20020a1ccc13000000b003f3468ca783mr3880483wmb.8.1683118592816;
        Wed, 03 May 2023 05:56:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b? ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bce15000000b003f17003e26esm1842146wmc.15.2023.05.03.05.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 05:56:32 -0700 (PDT)
Message-ID: <c6a1e22d1b1cd1cfc0483da955d7f2a6f8f9e346.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] mesa: 23.0.2 -> 23.0.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 May 2023 13:56:31 +0100
In-Reply-To: <CAP9ODKoV7m0eZNPzFjxAy1CxWrVyG+36WhQRdNAWvEhhKktDDQ@mail.gmail.com>
References: <20230502201240.2372610-1-otavio@ossystems.com.br>
	 <175B940FAEEE7C8B.14539@lists.openembedded.org>
	 <d61ff6dcece01da702cf8fc6e98b65d613c129f1.camel@linuxfoundation.org>
	 <CAP9ODKoV7m0eZNPzFjxAy1CxWrVyG+36WhQRdNAWvEhhKktDDQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180823

On Wed, 2023-05-03 at 09:32 -0300, Otavio Salvador wrote:
> Hello Richard,
>=20
> Em qua., 3 de mai. de 2023 =C3=A0s 05:17, Richard Purdie
> <richard.purdie@linuxfoundation.org> escreveu:
> > On Wed, 2023-05-03 at 09:14 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Tue, 2023-05-02 at 17:12 -0300, Otavio Salvador wrote:
> > > > Update to 23.0.3 stable release. Release notes in:
> > > >=20
> > > > =C2=A0 - https://docs.mesa3d.org/relnotes/23.0.3.html
> > > >=20
> > > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > > ---
> > >=20
> > > Unfortunately I isolated this change to be causing qemuppc xorg
> > > sanity
> > > check failures:
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/701=
0
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/45=
17
> > >=20
> > > I've not looked into why, just isolated it to this change.
> >=20
> > Sorry, I was about to remove the patch and I'm not sure I have
> > isolated
> > it to that :(.
> >=20
> > I'll do some further checks as whilst I meant to isolate it to
> > this,
> > I'm not sure I did.
> >=20
>=20
>=20
> An error occurred due to an invalid instruction. Have you removed the
> QEMU upgrade that was previously installed? The upgrade version was
> 8.0.0, replacing the older version, 7.2.0.

We've now seen this failure without the qemu upgrade and without the
piglit change. It is something that has merged into master now so I
suspect the libinput one. I'm trying to confirm that...

Cheers,

Richard




