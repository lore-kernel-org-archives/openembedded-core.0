Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1291C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 21:37:47 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.51536.1701293859877518122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 13:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c6gb8Qbv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40b397793aaso1472675e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 13:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701293858; x=1701898658; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UQ2wv4T8rSgMl8N4JgL8wP+PPD7kl6so+U6G+zV0hqo=;
        b=c6gb8QbviotvxF5FhwiWVY6lMdHx4arY+vyQUe/ezs4H2FfDvyODT8nJ1P4WGnkVWJ
         lR9sM0pfVCQIskiHOhQnszPz9KpWIisdogZvZOkokpb9SPgDIP49O1ct8iRkxpA0a7I2
         DhaMSoUxHtgYN5ZT5Ptik+3lT8M1WVJbXuNbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293858; x=1701898658;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQ2wv4T8rSgMl8N4JgL8wP+PPD7kl6so+U6G+zV0hqo=;
        b=Ne2uEmggeQkHren2H7n6KSu5iY+AMvrHY5lxGjLzE1G+vb36oPfPXsAOMBkW/KuTPH
         g45Kl1wxvEt50fovV0uq5X+MAqoS1C7WBKM94LQpuPUUJ+WeHe5wsI8ZqoQ5yrrxK31o
         DaHNPa4Xc677OjeVkpU/diFxGpPVDQzNfVthchzqqeRsbtSXC6xyClqyjfEheFnPPjOj
         7gYVbABNBO2D/Cb2q4/4UwqzxpPyi5Eog/iuIYbqOxzjUt5e4+x5AMYWv/kHDh+42Jt5
         o4EliDrNs60+ywdZDqfHUwq1IqIihCtnrfx7Y7umh5EsHFuTGi02CWraSl/QsgK0DwBx
         k1Zg==
X-Gm-Message-State: AOJu0YyL7foP+YRinqAlvHOojP0rRd5/lU1YA3zYG7Qbl0wz/h+0cF06
	1DZHcH1WVubOLN5QOG9pHucqXA==
X-Google-Smtp-Source: AGHT+IE4Qt/ohCmnTaHCzj8wAg3Naq54n2vn1ZAHx3T3ThT749GX5IfVvmJ34SaMMiLoG7AMfc10Ug==
X-Received: by 2002:a05:600c:45c8:b0:40b:45e2:1f4b with SMTP id s8-20020a05600c45c800b0040b45e21f4bmr9883161wmo.6.1701293858318;
        Wed, 29 Nov 2023 13:37:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ea1:d952:d81c:3bac? ([2001:8b0:aba:5f3c:8ea1:d952:d81c:3bac])
        by smtp.gmail.com with ESMTPSA id hg11-20020a05600c538b00b0040b48690c49sm3483727wmb.6.2023.11.29.13.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:37:37 -0800 (PST)
Message-ID: <948b54403fb2f7a7533b4815cd821afeeac44f52.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone][PATCH 2/4] base-passwd: Add PW_SUBDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Joakim.Tjernlund@infinera.com
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "peter.kjellerstedt@axis.com"
	 <peter.kjellerstedt@axis.com>
Date: Wed, 29 Nov 2023 21:37:37 +0000
In-Reply-To: <CAOSpxdYsEfEVAMAFe9_UrLrJHx7jeWgnYBdHSobp9-_mJ8cinw@mail.gmail.com>
References: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
	 <20231124141108.1397342-3-joakim.tjernlund@infinera.com>
	 <DB5PR02MB10213D2E9905D5D115A8F4EF9EFBEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <cb756de9310b460726d56f962293d8a3dec54a31.camel@infinera.com>
	 <CAOSpxdYsEfEVAMAFe9_UrLrJHx7jeWgnYBdHSobp9-_mJ8cinw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 21:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191462

On Wed, 2023-11-29 at 07:17 -1000, Steve Sakoman wrote:
> On Wed, Nov 29, 2023 at 1:11=E2=80=AFAM Joakim Tjernlund via
> lists.openembedded.org
> <Joakim.Tjernlund=3Dinfinera.com@lists.openembedded.org> wrote:
> >=20
> > Hi Peter :)
> >=20
> > All good comments, will fix accordingly. Not sure how PW_DIR ?=3D "${sy=
sconfdir}" will work though.
>=20
> One additional comment: a change like this should be submitted for the
> master branch, it can't go into a stable branch first.

Being realistic, this is a feature not a bugfix so it isn't really
appropriate for kirkstone in general.

I do agree with Ross that the approach isn't really what we'd want in
master either since we'd have to keep adding variables for each file
people wanted to change. As such I'm unlikely to accept these patches
for master as there are other ways to handle this.

Cheers,

Richard





