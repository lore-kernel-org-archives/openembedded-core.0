Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976FCC44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 07:19:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7363.1784186368913925657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 00:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2IBLEWEZ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B2CD0C2B9DC;
	Thu, 16 Jul 2026 07:19:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FF6A602B8;
	Thu, 16 Jul 2026 07:19:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 271E911BD057C;
	Thu, 16 Jul 2026 09:19:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784186366; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J46aHZbkmLDvDM7tV9oBZ9Lc6jygzZFzKHpUBWQNEwA=;
	b=2IBLEWEZUJzoMqDdftf81D/GXzJ/zBFS4hfGOGExf3FoOWQ4LR/y6Gt7jTXi/yl/Lzz1oW
	Sv8ql3EY1e37Cuj9i3O1OpIbl65wZfzYxDgpk5xZMR9Jw8R6Hon4z1s3BShoWdcy2WaNfx
	KQBf5cRZRHVg8adiqiouLnveH9ke6Wziye1RXPel7mBhBSHMSc/mg6r+zPVggX7VakFZZ6
	5RRQ6xFx8q/pGhJhWoym4+5AFTz/RMqicoQb06khV+sfjSC5BoXE+GOgYqQNQlp3oskHEN
	CmYIJfhoBdb+UjnurXkp7UZX8mIAxlw/SK1uHMUIsSIhEk26nEQDZD9ElPODew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 09:19:23 +0200
Message-Id: <DJZTA3XYAG4T.1DDQE4ASD7JPI@bootlin.com>
Subject: Re: [OE-core] [PATCH v5 2/2] gstreamer1.0-plugins-rs: add new
 package
Cc: <sebastian@centricular.com>, <nirbheek@centricular.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Taruntej Kanakamalla" <tarun@centricular.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260707081701.1525114-1-tarun@centricular.com>
 <20260714105541.2812170-1-tarun@centricular.com>
 <20260714105541.2812170-2-tarun@centricular.com>
 <DJZ45A2IL6XB.172T8CGXQUIPH@bootlin.com>
 <DJZ6ZB5JTYSV.ZUCFUNHW05GN@bootlin.com>
 <d460480501e19d59ac2a7bec0f15020692f0b855.camel@centricular.com>
In-Reply-To: <d460480501e19d59ac2a7bec0f15020692f0b855.camel@centricular.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 07:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241064

On Thu Jul 16, 2026 at 8:03 AM CEST, Taruntej Kanakamalla wrote:
> Hi Mathieu,
>
> On Wed, 2026-07-15 at 15:50 +0200, Mathieu Dubois-Briand wrote:
>> On Wed Jul 15, 2026 at 1:37 PM CEST, Mathieu Dubois-Briand wrote:
>>=20
>> >=20
>> > Hi Taruntej,
>> >=20
>> > Thanks for your patch.
>> >=20
>> >=20
>> > > +LICENSE =3D "MPL-2.0 | Apache-2.0"
>> > > +
>> >=20
>> >=20
>> > This should be "Apache-2.0 OR MPL-2.0". You should get a warning about
>> > it during the build:
>> >=20
>> > WARNING: /tmp/devtoolqa93fsj3gg/core-copy/meta/recipes-multimedia/gstr=
eamer/gstreamer1.0-plugins-rs_0.15.3.bb: gstreamer1.0-plugins-rs: LICENSE i=
s using an old syntax and should be upgraded to: "Apache-2.0 OR MPL-2.0"
>> >=20
>> > Thanks,
>> > Mathieu
>>=20
>>=20
>> Sorry, this comes from Joshua series and is not merged so far. We will =
=20
>> probably handle the fix on our side.
>>=20
>> No action needed on your side so far.
>
> Thanks for update, the patch is in still in "Changes Requested" state tho=
ugh. Just want to check if that is expected.
>
> Thanks,
> Tarun

Yes, it will be updated soon.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


