Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA701C001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 10:18:32 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.104192.1692008303680253532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 03:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HPp7Stzw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.170, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b962c226ceso63848641fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 03:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692008302; x=1692613102;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXkbCbXUGQUhK6xuqL8hHGKg+pFM+UgbnFk7hcCCPEc=;
        b=HPp7Stzww7MF8S0KP81HOqHoMcqtxccyEFgClC9o4KhZzzZOAM26hqaRPLHATaKPex
         sBWzpJN9oSsYvnahDaSV94sAJ2hEPAc3suf00qd/dWPxO0sHqVcmHWKKeOGcbr9la3yM
         siVyRCvudwFjY2nCTiDblj0pDsNjCt3Tq+9XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692008302; x=1692613102;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mXkbCbXUGQUhK6xuqL8hHGKg+pFM+UgbnFk7hcCCPEc=;
        b=lFXglUbCh42jWxw966jRZea39PU8hW2wUuB1Ol+6rI7Sfai5tuI75crIFDfE7GCU91
         /4VEL08Fjic7OlQc1SNomSqxoAYDyhjU+nzOqCxTb4IW3Cs4odGDchitOZJCphi8aXcT
         rn9aG2kDltmiCqz81iTnxIottk/sfyYmq6f0Gg4kyaeGRVhEaL8KmzP2+wT/pHRHWWh1
         K00DhzUnjQYp7BbEgQNrQUtjmOli7iKUUG4uuIfR5/E3l/Bzg+s39IC42+GcQAgbZXfy
         5kWIPG0HMthZ0mJSxOKO8k3kriQQfPnJTcMyCFsjQNE7epPXWQjvlKGTSp3vUUzEjaKV
         Yfnw==
X-Gm-Message-State: AOJu0Yx1CdayaBIgDAom0Xz5dIj0e8yZfHuIXIgXlc0ZHb47HBK7L7WG
	vo+OQwyTe2+9Jo/s7760UpT6PQ==
X-Google-Smtp-Source: AGHT+IH1nlPoBm43HLkBIWGQuHKiJ5/ThoINHAdGxnF/zkXRFUMJgM090tBxBUTgu+LU2AUcufWcBw==
X-Received: by 2002:a2e:300e:0:b0:2b6:cf0f:1fbf with SMTP id w14-20020a2e300e000000b002b6cf0f1fbfmr6639619ljw.42.1692008301906;
        Mon, 14 Aug 2023 03:18:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a? ([2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c205300b003fe17901fcdsm16731791wmg.32.2023.08.14.03.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:18:21 -0700 (PDT)
Message-ID: <1611fce1107d11b30c48a52146deb3abb1c22c85.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] qemu: Add qemu-common package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
Date: Mon, 14 Aug 2023 11:18:20 +0100
In-Reply-To: <dbd795c0-048f-5dbc-cc00-165681304cab@windriver.com>
References: <177296216FD9611D.22245@lists.openembedded.org>
	 <ad4d8e98-9163-700d-32b8-5d67b6b127a2@windriver.com>
	 <01211f8f8eafbda39b341638bcbbab9ab4edeba0.camel@linuxfoundation.org>
	 <dbd795c0-048f-5dbc-cc00-165681304cab@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 10:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185932

On Mon, 2023-08-14 at 17:46 +0800, Yu, Mingli wrote:
> Hi Richard,
>=20
> On 8/14/23 17:25, Richard Purdie wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >=20
> > On Mon, 2023-08-14 at 17:19 +0800, Yu, Mingli wrote:
> > > Ping.
> >=20
> > https://lists.openembedded.org/g/openembedded-core/message/184574
> >=20
> > """
> > So why not just add:
> >=20
> > RRECOMMENDS:${PN} +=3D "${PN}-system-all ${PN}-user-all"
> >=20
> > as I think we've then covered all the options we need?
> > """
> >=20
> > I still haven't seen an answer to this?
>=20
> Sorry for noise, have ever answered this question in another thread=20
> "[PATCH v3] qemu: Add qemu-common package".
>=20
> If just add RRECOMMENDS:${PN} +=3D "${PN}-system-all ${PN}-user-all" by=
=20
> default, then how about the user who want only install=20
> qemu-system-aarch64-7.2.0-r0.corei7_64.rpm still install all qemu=20
> binaries as qemu-system-aarch64 rdepends on qemu which RRECOMMENDS=20
> qemu-system-all and=20
> qemu-user-all(https://git.openembedded.org/openembedded-core/commit/?id=
=3D893846ead7ee54d53e9076150cd655e0c8bca5db).
>=20
> So it's better make qemu as meta package to keep backward compatibility=
=20
> for user who install qemu can install all qemu binaries as before and=20
> also can meet the need for user who want just install qemu arm64=20
> emulation rpm such as=20
> qemu-system-aarch64-7.2.0-r0.corei7_64.rpm(https://patchwork.yoctoproject=
.org/project/oe-core/patch/20230717071114.2734859-1-mingli.yu@eng.windriver=
.com/)=20
> via adding IMAGE_INSTALL:append =3D " qemu-system-aarch64" into=20
> conf/local.conf.

Sorry, I'd missed that reply in the midst of the different emails and
it does help explain things thanks.

I don't like the amount of churn we've had in qemu packaging but this
does look like what we'll need to do to resolve the issue you've
mentioned above. I'll queue it for testing.

Cheers,

Richard


