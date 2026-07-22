Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCE7C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 13:22:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47767.1784726564916492730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 06:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lRl7PcAX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF0434E40ECE;
	Wed, 22 Jul 2026 13:22:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 864EC60388;
	Wed, 22 Jul 2026 13:22:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C4A111BD1E93;
	Wed, 22 Jul 2026 15:22:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784726561; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jw79kodIH6WTIx9/ZRUPM0EqocCGSA4NVycOTf1h5lw=;
	b=lRl7PcAX9QzAap9z6o/Grj3vP099HbViNGwF4NmsyVFZu5vuRmLpp+JEv63ZVSOpG8T+y6
	tFYB95pRpiPef4DlNRJyAe1PwyU6Oew3swd8KNQ8nhIqUGbNwUmf3JZkTgDc7MDrgxrZFh
	W5FZYdrWqzkIfRBDZnE+cA7S34x8o/s3t8a10zGPSfjOLCu3HFQ4L88e5ozDD943ifhWKn
	7EBLVNFpA3hApLx5760o7hslc8zybaE/tBmSRD1VQugJuXQqRD+zz1yY2ZtdgADereBNUP
	h40ddKV32g6mzYVdfuhuioc9AkBYtvPFxVU3lQ1OJ8Dge5DwVyXMHF6mKwEHuQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 15:22:39 +0200
Message-Id: <DK54RIOEU340.33ALWQ7AGPKEJ@bootlin.com>
Subject: Re: [OE-core] [PATCH v5 2/2] gstreamer1.0-plugins-rs: add new
 package
Cc: <sebastian@centricular.com>, <nirbheek@centricular.com>,
 <jan@centricular.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Taruntej Kanakamalla" <tarun@centricular.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260707081701.1525114-1-tarun@centricular.com>
 <20260714105541.2812170-1-tarun@centricular.com>
 <20260714105541.2812170-2-tarun@centricular.com>
 <DJZ45A2IL6XB.172T8CGXQUIPH@bootlin.com>
 <DJZ6ZB5JTYSV.ZUCFUNHW05GN@bootlin.com>
 <d460480501e19d59ac2a7bec0f15020692f0b855.camel@centricular.com>
 <DJZTA3XYAG4T.1DDQE4ASD7JPI@bootlin.com>
 <4d95a8c8b8bcb0e1f5e01576466301f69eb2aa9b.camel@centricular.com>
In-Reply-To: <4d95a8c8b8bcb0e1f5e01576466301f69eb2aa9b.camel@centricular.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241693

On Wed Jul 22, 2026 at 2:50 PM CEST, Taruntej Kanakamalla wrote:
> Hi Mathieu,Richard,
>
> I noticed the first patch in this series "cargo_c.bbclass: pass --
> libdir to cargo cinstall" got merged to the master branch, but this
> patch ("gstreamer1.0-plugins-rs: add new package") did not.
> So just wanted to check with you if the review is still in progress or
> if some action needs to be taken by me.
>
> Thanks,
> Tarun

We do have issues with freedesktop gits, I hope to discuss this during
the next patch review meeting. No change needed on your side so far.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


