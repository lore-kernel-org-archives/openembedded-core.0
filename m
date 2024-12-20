Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE6DE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:12:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.150812.1734696716480536060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 04:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OdxeBvNs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61B1C1C0002;
	Fri, 20 Dec 2024 12:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734696714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JFhtCH26DfOB51Q0qUopS/JbnUDPFQu3IviKo55zLsI=;
	b=OdxeBvNsH8FKm5mS3FZ8y7I/PMd0qMGGf9EY6LKbH25jmV5+uyJsbI4OICZ8v51crO0pKR
	TUts3Khbvg9gQWiNJOANSErnJPk60mxsXqhkXF94MvUb2a++W2TX0G9ykXHHE4TVCauQuz
	6qXdKBFqca83nEje6tvIBqUrphp2F3ju7Nx5vUjwF0PctZfKP1J0IEcSWIQp7qXVpERV3k
	CZBCaag9wYXO/wKhYJ3UhnaUnl5hhXdlhWtXomP+knzlrydjyr8COpZ1eWZ85Hus1lVqMF
	P+8GMBe0eyPG2gz83pjWSb+tjXAQM74X+iguKSCe4aA3/FgvlPRQTc++fXAIFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 13:11:54 +0100
Message-Id: <D6GINWZFWIO0.3UBYR0C0B4K91@bootlin.com>
Cc: <a.fatoum@pengutronix.de>, <alex.kanavin@gmail.com>,
 <openembedded-core@lists.openembedded.org>,
 <richard.purdie@linuxfoundation.org>, <yocto@pengutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Subject: Re: [PATCH v9 0/7] Add barebox bootloader support (and testing)
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <D68XQU2RSZ0C.2V137AIRTE2ZN@bootlin.com>
 <78b6f77c2eab6007ab888ac973d4997bf144aa46.camel@pengutronix.de>
In-Reply-To: <78b6f77c2eab6007ab888ac973d4997bf144aa46.camel@pengutronix.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 12:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208980

Hi Enrico,

On Wed Dec 18, 2024 at 2:32 PM CET, Enrico J=C3=B6rns wrote:
> Hi Antonin,
>
> Am Mittwoch, dem 11.12.2024 um 15:19 +0100 schrieb Antonin Godard:
>> Hello Enrico,
>>=20
>> Since this patch series introduces a new class for compiling barebox-bas=
ed
>> bootloaders, it would be nice to have some documentation for it.
>>=20
>> Openembedded-core classes are documented in yocto-docs[1], and documenta=
tion
>> patches are sent to docs@lists.yoctoproject.org.
>>=20
>> Could anyone, preferably the author of the class, take some time to docu=
ment the
>> usage of the class in yocto-docs/documentation/ref-manual/classes.rst, a=
nd the
>> variables the class defines (especially the ones that can be overridden =
for user
>> customization) in yocto-docs/documentation/ref-manual/variables.rst?
>
> thank you for reaching out regarding the documentation of the barebox.bbc=
lass.
>
> I was on vacation last week and still have some year-end tasks to take ca=
re of
> this week, so I'm not sure how soon I'll get to it.

Ideally, some time before the next Walnascar release would be great.

I've created a bug to track this:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15702.

> However, I=E2=80=99m happy to contribute the corresponding class document=
ation.
>
>> That would be greatly appreciated. I can help if needed.
>
> Thanks a lot! I'll get back to you in case something is unclear (e.g. whe=
re to put which
> information). Luckily all the documentation is rst which I am quite famil=
iar with =F0=9F=99=82.
>
> For now I've checked out the repo and added a barebox section header in c=
lasses.rst --
> just to give myself the impression of having started already =F0=9F=98=89=
.

Great! I'm looking forward to your patches. :)

One advice I would give is to read documentation/standards.md. There are so=
me
yocto-docs specific terms and formatting rules to follow.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

