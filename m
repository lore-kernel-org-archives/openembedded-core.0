Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F96BC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 10:42:47 +0000 (UTC)
Received: from 5.mo575.mail-out.ovh.net (5.mo575.mail-out.ovh.net [46.105.62.179])
 by mx.groups.io with SMTP id smtpd.web10.19187.1702550560864999275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 02:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 46.105.62.179, mailfrom: jonathan@joggee.fr)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.139.228])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 9654B2AEAB
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:42:38 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-tm4cs (unknown [10.108.9.54])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0B2FA1FEC1
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:42:37 +0000 (UTC)
Received: from joggee.fr ([37.59.142.96])
	by ghost-submission-6684bf9d7b-tm4cs with ESMTPSA
	id UKbBJh3cemWGYgAA+E2Haw
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:42:37 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R001c60f9ecc-6990-4c9f-ab9c-681124639967,
                    A6E40C68E3891374E2F6B4A9169D12E81599E900) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 209.85.160.51
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1fab887fab8so6012701fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 02:42:37 -0800 (PST)
X-Gm-Message-State: AOJu0YyNb9CsOOGs69ym/MJeCblcom6QwadD+ADVFn45pnqrH0v9qZjO
	G5Zi9rRE7/J46CGx6dy8YUQSODzbhUXxROoRwHE=
X-Google-Smtp-Source: AGHT+IEDL6lnKkntgl0bUoWAwcvYDwr15eyznd8bMKeC9BMZtIithugDJ2pr0TLcmGk2/lzcqqBBLmupRKaHwoAfl9o=
X-Received: by 2002:a05:6870:41d5:b0:203:27f8:b5e6 with SMTP id
 z21-20020a05687041d500b0020327f8b5e6mr2794384oac.117.1702550554357; Thu, 14
 Dec 2023 02:42:34 -0800 (PST)
MIME-Version: 1.0
References: <CXNASYPMN4HU.28KB1ZM3347U5@joggee.fr> <CXNASYPMNU9N.2AKRQ4ODCZYTH@joggee.fr>
 <CAMKF1sqUzNwDkevyhYvFdCgTMWOagqzhA=s4P9qXrSn2+_c05w@mail.gmail.com>
In-Reply-To: <CAMKF1sqUzNwDkevyhYvFdCgTMWOagqzhA=s4P9qXrSn2+_c05w@mail.gmail.com>
From: Jonathan GUILLOT <jonathan@joggee.fr>
Date: Thu, 14 Dec 2023 11:42:05 +0100
X-Gmail-Original-Message-ID: <CAA_hxbTUek_xb8gwJtsd+U6747viKfKkb2Ae6-ATBCv2C3ZmdQ@mail.gmail.com>
Message-ID: <CAA_hxbTUek_xb8gwJtsd+U6747viKfKkb2Ae6-ATBCv2C3ZmdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] lib/oe/package: add LOCALEEXTRADIRS to
 define extra locations for locales
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 15861114938956713083
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudelledgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepgghfjgfhfffkuffvvegtgfesthhqredttddtjeenucfhrhhomheplfhonhgrthhhrghnucfifgfknffnqffvuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeeuleffffehueegteevhefhhfejiefgiedviedvveekgfdtveeikedttdehieekieenucfkphepuddvjedrtddrtddruddpvddtledrkeehrdduiedtrdehuddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192351

Hi Khem Raj,

Le mer. 13 d=C3=A9c. 2023 =C3=A0 21:45, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
> I think using _ to separate the words would make it more readable so
> call it LOCALE_EXTRA_PATHS or something.
> secondly, it needs to be documented as well.

The naming LOCALEEXTRADIRS is inspired from existing FILESEXTRAPATHS.
Is there some guidelines for variable naming?
Definitely, I should add a bit of documentation.

