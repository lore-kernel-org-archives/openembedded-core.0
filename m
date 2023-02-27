Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C440C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:37:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.85780.1677487024145811371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N/59IV49;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id l25so5291213wrb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 00:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xDtCcOd21yNhQEWCmfmOl063a5JtdcHEHjBpPdXgCc8=;
        b=N/59IV49jI9yGQS2DZwtB/MmqeElxZYVQwtjAptaaUM3SlxSVTMfo9giQhba450t57
         vh+xntZV3YHNQBVJuhrDEm6VaSNqbYM7heoYYpC1shlJu4bqUdED1PkMu/Gk1UuwwYSt
         scSObZhXhWiGYtxTCKISYV5B5c0X8favE/Xdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xDtCcOd21yNhQEWCmfmOl063a5JtdcHEHjBpPdXgCc8=;
        b=gC85lsxlGFR+JrLu3MHZelJ3j13uqZWGQSi+MWyt3bD+uGIIoOXoOrP0H4+JRVd88p
         dTIzf0rt0E7eTq2x1I8br99MGNvTw7G+FrcCUMBDO1dXHaig0m8x3iQ4+T+FAP/qsde5
         ONMZJPc54TPX+7DRXxTt2CMeVTAZXqy3VXhWYnbGWxFKP2u8ByXIvbWTesReA3pTHKJB
         6d94jbcCWD3n9zzilH3e/40jbStvZXdSgea6fOULPsXgBFUFjgg+3oED6vMSHYsODq4a
         N9YsYnQvi4Kqk2mv7wnXbyTSmuGx9S/+ZA6kgG3Ot6C0fGvKiM//AoZtVQ/QM+IiMKsM
         3jUg==
X-Gm-Message-State: AO0yUKUvwSaH0cMcJleBx3h6qfrP+Ialh4AVkpFadryOZgknvqfAqG5z
	CQhpmPc3oV18UQeFlkwLH96TKg==
X-Google-Smtp-Source: AK7set/0oRsjPigbtPGqzoNDlDb6OrdpRlMhenrbnBMAx6DUwk9EJ5B07J21zch2Q7xyuv5XbNIk0A==
X-Received: by 2002:a5d:4dd1:0:b0:2c7:a39:6e30 with SMTP id f17-20020a5d4dd1000000b002c70a396e30mr14156969wru.38.1677487022477;
        Mon, 27 Feb 2023 00:37:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b7e8:d302:d51:7008? ([2001:8b0:aba:5f3c:b7e8:d302:d51:7008])
        by smtp.gmail.com with ESMTPSA id y14-20020adfee0e000000b002c71b4d476asm6488403wrn.106.2023.02.27.00.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 00:37:02 -0800 (PST)
Message-ID: <18613bd480d5dc517c329b1cb541cbdc05d2a8e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2023 08:37:01 +0000
In-Reply-To: <CAMKF1sqeDrCv_+StXhwdWjgrvuq6jANu0Ysydausev0rVsk6xQ@mail.gmail.com>
References: <20230223065816.3151823-1-raj.khem@gmail.com>
	 <Y/f3/n9f4AxtHcoo@mail.local>
	 <CAMKF1srZ=NMtKo_Pn=s9ow913j8AmC9heZKGKyHRB6RAStJFdA@mail.gmail.com>
	 <CAMKF1sqeDrCv_+StXhwdWjgrvuq6jANu0Ysydausev0rVsk6xQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 08:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177776

On Sun, 2023-02-26 at 22:43 -0800, Khem Raj wrote:
> On Thu, Feb 23, 2023 at 5:56=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >=20
> > On Thu, Feb 23, 2023 at 3:34 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >=20
> > > Could this be the cause of this?
> > >=20
> > > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230223-=
79c9rmcw/packages/diff-html/
> >=20
> > most likely yes. I will take a look. Lets work on merging the other
> > binutils and gdb upgrade patch meanwhile.
>=20
> I looked at the diffoscope outputs you posted and it is noting the
> difference in EFL flags
>=20
> changing from
>  0x0000000000000018 (BIND_NOW)
> to
>  0x000000000000001e (FLAGS)              BIND_NOW
>=20
> However, in my local build I see that when I enable --enable-new-dtags
>  than I always get
>  0x000000000000001e (FLAGS)              BIND_NOW
>=20
>=20
> but when I check the glibc builds without the patch then I get flags
> to be 0x0000000000000018
>=20
> So I wonder if we are comparing previously built glibc ( using
> binutils without this patch )
> with glibc compiled with binutils using this patch.

I think that is possible and there is some task hash dependency issue
in here somewhere :/

Cheers,

Richard

