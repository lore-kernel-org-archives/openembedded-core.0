Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA64C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 15:42:11 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.493.1652197325812956080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 08:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aTuAIoQN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so1692483wme.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 08:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=fOmuq3FqYXkeJuLZbroAS5gCS/3kR1r1urtPmu383z8=;
        b=aTuAIoQNes8Tv2aPzuHkxCXn2d6+5iYuYOHfZwUPGuVUskYq86YNGPC2YAMmYDvvyt
         prCORhDjuuDX2ei/dRsu+sHCNGBCQg87jN1j6RXklPVJT2duRuOWSbzrvCMZLxqT6/Ik
         VMY2sSGWthosRYh2deHVi+nptS+XKj/1i54P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=fOmuq3FqYXkeJuLZbroAS5gCS/3kR1r1urtPmu383z8=;
        b=fkhQGjzRQVkQuKKNkm8tvGZ2enJophus+2nJfianeyEDQ6PrB3dA4+bIJJjXK9Kbfp
         oS1lTcv6jeES1K7d1LULF7xVQukRz9JtDuo8cr3jVbqI/Q6ob9sVhc8a7RXa2g0KmBXS
         +eAh4NzEGuZHSQ3WrxLByVaMMJIy0gR9Azj169BLvFgT+0OSMiKGV17H0azNBaCdN3NV
         xxqo3bZp1vxxWMSBPmT82Xm39M/8QGth1UuYHuk72DEdKZzi4hBiQXDUWNa4ju8+pllV
         v+0OPt3+1cVRfSPYk86SFOsK3JPEHbwB6lj+lwCivCFlFWLKqBdBKB6TEsa5nVGK2lPY
         xfMQ==
X-Gm-Message-State: AOAM530D9TRBDxXDoXxo/XskXBIILi4l6QBzzRAaLyXfssBmHeub8hmD
	xEVskoIctaeo3WWjBNwS5wkWdA==
X-Google-Smtp-Source: 
 ABdhPJz2+n9t9iB/fKC6QQteLRQtYvonhQalFGFqyMqB53tKqb5ZR3TZ7lIncKJhHu8/ABeSw+ZhEA==
X-Received: by 2002:a05:600c:a08:b0:392:a561:9542 with SMTP id
 z8-20020a05600c0a0800b00392a5619542mr611694wmp.62.1652197324247;
        Tue, 10 May 2022 08:42:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f0f9:d8b3:e8bc:d2f3?
 ([2001:8b0:aba:5f3c:f0f9:d8b3:e8bc:d2f3])
        by smtp.gmail.com with ESMTPSA id
 o9-20020a5d62c9000000b0020c5253d903sm14290166wrv.79.2022.05.10.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 08:42:03 -0700 (PDT)
Message-ID: 
 <a2de54fa833b5dc25a3a75695632877057a90167.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] freetype: Upgrade 2.12.0 -> 2.12.1
From: richard.purdie@linuxfoundation.org
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Ross Burton
	 <ross.burton@arm.com>, Steve Sakoman <steve@sakoman.com>
Date: Tue, 10 May 2022 16:42:02 +0100
In-Reply-To: 
 <CAApg2=Tx+WXk4U16j61GHLb6KFwfOdXxyrsXLVUQAwN2nePOxA@mail.gmail.com>
References: <20220508123418.159142-1-richard.purdie@linuxfoundation.org>
	 <16ED214F51D113CA.5869@lists.openembedded.org>
	 <940414ecb58f77ed1c0ce6693cf7b5e8836ce28a.camel@linuxfoundation.org>
	 <CAApg2=TNtVc1Zb4_1pD2Vd53338++wPa+Lwj4QUVJaBdMwkjiQ@mail.gmail.com>
	 <16ED76DCD3B51CA1.18911@lists.openembedded.org>
	 <CAApg2=Tx+WXk4U16j61GHLb6KFwfOdXxyrsXLVUQAwN2nePOxA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 15:42:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165462

On Tue, 2022-05-10 at 17:02 +0200, Marta Rybczynska wrote:
> On Mon, May 9, 2022 at 4:42 PM Marta Rybczynska via
> lists.openembedded.org <rybczynska=3Dgmail.com@lists.openembedded.org>
> wrote:
> > On Mon, May 9, 2022 at 12:40 PM Marta Rybczynska
> > <rybczynska@gmail.com> wrote:
> > > On Sun, May 8, 2022 at 6:45 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Sun, 2022-05-08 at 13:34 +0100, Richard Purdie via
> > > > lists.openembedded.org wrote:
> > > > > Includes fixes for CVE-2022-27404, CVE-2022-27405, CVE-2022-
> > > > > 27406.
> > > > >=20
> > > > >=20
> > > >=20
> > > > I'm amending this to "Include fix for CVE-2022-27404" since
> > > > CVE-2022-
> > > > 27405 and CVE-2022-27406 were already in 2.12.0.
> > > >=20
> > > > I don't think the CVE checker is going to like these as they're
> > > > using
> > > > dates for these for reasons I don't understand.
> > > >=20
> > > >=20
> > >=20
> > >=20
> > > They also include versions in the NVD, but there is no version
> > > "non-afected"
> > > as of today for CVE-2022-27404. I'll figure out the exact
> > > versions for those
> > > CVEs and update the NVD in the next hours.
> > >=20
> > > Kind regards,
> > > Marta
> > >=20
> >=20
> >=20
> > Update: the message to NVD has been sent. According to my analysis
> > all three
> > CVEs have been fixed in 2.12.0.
> >=20
>=20
>=20
> The change is up in NVD. The next run of the cve-check should see it.

Great, thanks for sorting that one out, the reports will be much better
for it!

Cheers,

Richard


