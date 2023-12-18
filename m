Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DC5C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 10:53:04 +0000 (UTC)
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net [178.33.251.173])
 by mx.groups.io with SMTP id smtpd.web11.41653.1702896777519029970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 02:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 178.33.251.173, mailfrom: jonathan@joggee.fr)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.176.128])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 53BCA27A8E
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 10:52:55 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dm76s (unknown [10.110.96.132])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BF49F1FEB8
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 10:52:54 +0000 (UTC)
Received: from joggee.fr ([37.59.142.108])
	by ghost-submission-6684bf9d7b-dm76s with ESMTPSA
	id 1LOoFIYkgGWyOwAAixK9/w
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 10:52:54 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002ee74c937-86f9-4e3e-b4c4-895a2b2dee37,
                    322D4E01743EA40E077468207D8B501B6ACEDD83) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 209.85.210.44
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6da5d2c3ec7so1492935a34.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 02:52:54 -0800 (PST)
X-Gm-Message-State: AOJu0YwidkMm8/LxMMSu0ux1pTHEjPex/DZdIP2Qo6U4r/ikYZge4hIY
	/soElkXVWzdhkeefmG7P1y1DovO8gvJ4jXcSqEA=
X-Google-Smtp-Source: AGHT+IFAoeFPubz2TdK+r/HxAFFcf6M4pw8dbfmUpuLjmScv4mpwiwUzACU5MmWSc2IrFiOPimGHQGqUofPZF4yudjc=
X-Received: by 2002:a05:6870:4597:b0:1fb:75a:6d34 with SMTP id
 y23-20020a056870459700b001fb075a6d34mr19359183oao.91.1702896772936; Mon, 18
 Dec 2023 02:52:52 -0800 (PST)
MIME-Version: 1.0
References: <CXNASYPMN4HU.28KB1ZM3347U5@joggee.fr> <CXNASYPMNU9N.2AKRQ4ODCZYTH@joggee.fr>
 <CAMKF1sqUzNwDkevyhYvFdCgTMWOagqzhA=s4P9qXrSn2+_c05w@mail.gmail.com>
 <CAA_hxbTUek_xb8gwJtsd+U6747viKfKkb2Ae6-ATBCv2C3ZmdQ@mail.gmail.com> <CAMKF1sqrvGpKHsbV15XHo59jWhOWkYySvYWi=5JcDdpVW_DF3Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqrvGpKHsbV15XHo59jWhOWkYySvYWi=5JcDdpVW_DF3Q@mail.gmail.com>
From: Jonathan GUILLOT <jonathan@joggee.fr>
Date: Mon, 18 Dec 2023 11:52:22 +0100
X-Gmail-Original-Message-ID: <CAA_hxbQB0wxeb8Lqb9SUKYi6vDbT+iUTm8kHJwBZ3OR6uxEppA@mail.gmail.com>
Message-ID: <CAA_hxbQB0wxeb8Lqb9SUKYi6vDbT+iUTm8kHJwBZ3OR6uxEppA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] lib/oe/package: add LOCALEEXTRADIRS to
 define extra locations for locales
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 2632072511028268155
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvddtkedgudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepgghfjgfhfffkuffvvegtgfesthhqredttddtjeenucfhrhhomheplfhonhgrthhhrghnucfifgfknffnqffvuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeeuleffffehueegteevhefhhfejiefgiedviedvveekgfdtveeikedttdehieekieenucfkphepuddvjedrtddrtddruddpvddtledrkeehrddvuddtrdeggedpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 10:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192629

Hi,

I am just looking to existing variables to add documentation for
LOCALE_EXTRA_PATHS and it makes me think about separator to use.
FILESEXTRAPATHS use ':' between each path, PACKAGE_FEED_BASE_PATHS
uses simple space ' ' and PSEUDO_IGNORE_PATHS is comma-separated list.
What is the best option here?

Regards,
Jonathan GUILLOT

Le jeu. 14 d=C3=A9c. 2023 =C3=A0 17:45, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
>
> We used this convention when we used '_'  as an override separator.
> That constainst is no more as we use ':' now.
>

