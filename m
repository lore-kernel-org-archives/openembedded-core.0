Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B67C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 13:16:03 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.12809.1741266961695145172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 05:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nqTzDhrL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22C30443FD;
	Thu,  6 Mar 2025 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741266960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFvkGQ+iLhh5U2Q7HcqRvNJ8Guo2CZsFosKEIF6Y8XE=;
	b=nqTzDhrLN/SsjK2hLleq5MvYxI9flMTjAydIjG7nnGHk98KhvUo6K071LpqnNIfuNlTQWT
	KbV1equC9Y3wsHHj1pEjU6kh0QIr/hdmjDCKlxwva/E3OBUYYvlSODI0FtYkIp9U+YfuFD
	3/IVOhm3WOXgv7O11SEnVO8m6IfONQCX5kDvwLQuMOZiBH3UsfeC9WVNZqfuyrzGPTp9Mx
	qqwEbo+KcuWyJHhmnoLzGPGnCSmm6eQsBCXpgYsdiFFj5EtP12VQN+fDKYKCutJ7O19LEl
	aqh+trRNdcRqfSbC+6xpUxLADWcdyCFHoPf2KBsBIEt4hseIao+hT6b5SeRiXg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Mar 2025 14:15:59 +0100
Message-Id: <D897ME98F6LQ.3UY5ONS9WU0AU@bootlin.com>
Subject: Re: [OE-core] [PATCH v4] mtd-utils: Upgrade to 2.3.0
Cc: <openembedded-core@lists.openembedded.org>, <ross.burton@arm.com>,
 <raj.khem@gmail.com>, "Fabio Estevam" <festevam@denx.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Fabio Estevam" <festevam@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250304131105.1187410-1-festevam@gmail.com>
 <D897IA2JDVDD.MBR1KBH9YWBE@bootlin.com>
 <CAOMZO5AO-pa10ar=4EuZAaevAYoOXu=n3Sy6JHRSFNH+3yOiKA@mail.gmail.com>
In-Reply-To: <CAOMZO5AO-pa10ar=4EuZAaevAYoOXu=n3Sy6JHRSFNH+3yOiKA@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvdeljeeiuefhvedtkeejgeffudeghfefkefgvdettdetuefgffehkefhjeegjeenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrv
 geslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopehfvghsthgvvhgrmhesuggvnhigrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 13:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212390

On Thu Mar 6, 2025 at 2:13 PM CET, Fabio Estevam wrote:
> Hi Antonin,
>
> On Thu, Mar 6, 2025 at 10:10=E2=80=AFAM Antonin Godard
> <antonin.godard@bootlin.com> wrote:
>
>> You can make a single SRC_URI assignment here:
>>
>>   SRC_URI =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster \
>>              file://0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch \
>>              file://0002-ubifs-utils-journal-Include-sys-stat.h.patch \
>>              file://0003-ubifs-utils-link-libmissing.a-in-case-execinfo.=
h-isn.patch \
>>              file://0004-ubifs-utils-extract_files-Include-linux-limits.=
h.patch \
>>              "
>>
>> It will make parsing a bit faster.
>
> Richard tweaked the SRC_URI line as you suggested:
>
> https://github.com/yoctoproject/poky/commit/768a0f6c7fdd7f788673ecd070a05=
c8d30ac486c
>
> I will do it like this next time.

Ha, ok, sorry didn't see this :)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

