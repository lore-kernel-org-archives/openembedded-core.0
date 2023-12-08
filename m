Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F76AC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 13:55:54 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.36069.1702043750967009652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 05:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IWTYX8oG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so1230738f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 05:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702043749; x=1702648549; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SZt+a5iBeHPn8oqmWTsPoVOJTx6wsxF/6Y8tgXA6uck=;
        b=IWTYX8oGAFb6J2U9URVhqbiCcJ+pTkELqoFKDROFPgAChpMiH6XO6dApTRDDBvQnRo
         yCrBnkgg5LSfqwsd9NZOQhnfkuFEuzWb7xh5th25kjkRXUr3vv6wi+iG0LRDC8QUpUvm
         gNh7xS5WbHu8PuV9a/fPR8WH9kjjmehlyfQJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702043749; x=1702648549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SZt+a5iBeHPn8oqmWTsPoVOJTx6wsxF/6Y8tgXA6uck=;
        b=ljNftJNwZzA+0nLOrduUkooMUIJCtyyBTVXiQri7HOk27MhfDf7x0fI3+eJSnTXDGQ
         Hpln9oiiw3/rhqGiqlorkxl52EVXKOpg0RUz0O4Bi4QHRD0WPp3GvMpiM1pId2b3kzJM
         s0cj8cNMg3gxYh4yFwNBPWiKO8mroevXZm2fxeaQlKdea1Pc3lLyP8ZeSWC2XvY8WiV8
         j0KS+jD6RFGqiTvBezveqpE7fRX5FN1Tn+tH2aQ0f856HTJkrjEmB7u0ydKMRlKQefH2
         ra/LM7asVhoqwBmaKcKokGRuyV41Ulwv0bEbWW5yr20lLOU8iJkWjcMgNyWm3A3ouEzs
         3kZA==
X-Gm-Message-State: AOJu0YxydsbVECTuA6e2763FKdi8kmqIbSVSh9oqJNMSLElsmuKjJUgU
	hOUhYXrgew9QX5eBeiXn7sDYLg==
X-Google-Smtp-Source: AGHT+IFbp3PWXBrvXUaBE46Zt8vPV7nH7nleGVXSKssy/+zlsQkTD+Xm6V62kluDEFlMLn6ONboNNQ==
X-Received: by 2002:a5d:66d2:0:b0:333:434b:a217 with SMTP id k18-20020a5d66d2000000b00333434ba217mr573223wrw.19.1702043749426;
        Fri, 08 Dec 2023 05:55:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b? ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id e12-20020adfe38c000000b003332fa77a0fsm2082274wrm.21.2023.12.08.05.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 05:55:49 -0800 (PST)
Message-ID: <82c9303fff1e1f728b3aa08c47d75efbf239da88.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] rust: Upgrade 1.70.0 -> 1.73.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Date: Fri, 08 Dec 2023 13:55:48 +0000
In-Reply-To: <CAO5Uq5R1hYwo+oa4QR9bFQif57OrXbWEY0QSZfJZZHmipfajqg@mail.gmail.com>
References: <20231208095455.1252421-1-Yash.Shinde@windriver.com>
	 <CAO5Uq5R1hYwo+oa4QR9bFQif57OrXbWEY0QSZfJZZHmipfajqg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 13:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192062

On Fri, 2023-12-08 at 13:47 +0000, Alex Kiernan wrote:
> On Fri, Dec 8, 2023 at 9:56=E2=80=AFAM Shinde, Yash via lists.openembedde=
d.org
> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
> >=20
> > From: Yash Shinde <Yash.Shinde@windriver.com>
> >=20
> > In rust 1.72.0 the 'mips*-unknown-linux-gnu*' support demoted from tier=
2 to tier3.
> > The mips bootstrap compiler is removed from src/stage0.json file and
> > so the same are removed from rust-snapshot.inc. [https://github.com/rus=
t-lang/rust/releases/tag/1.72.0]
> >=20
> > Drop bootstrap_fail.patch, getrandom-open64.patch
> > as they are merged in upstream rust.
> ]>
> > Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> > ---
>=20
> If we're going to go down the road of disabling the rust oe-selftest
> (and I don't see a better option right now as we're well behind), I
> have a series which steps us through each of the releases up to
> 1.74.0.
>=20
> It also avoids the need for the library/test hack (upstream has a new
> target we can use for libstd).

This sounds useful, particularly this last piece. Can you send it? We
could probably combine it with 2/2 in this series if Yash/Randy agree.

Cheers,

Richard

