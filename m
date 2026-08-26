Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638D9C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:58:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8179.1787734699849562021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=obd1h3dU;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 87B964E413BF;
	Wed, 26 Aug 2026 08:58:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B731604EC;
	Wed, 26 Aug 2026 08:58:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4031E11C7ACCE;
	Wed, 26 Aug 2026 10:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787734692; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w9dMzrbnK9d5L7gIWpRgxV1sM5Odon0ns8tWC5Dus7E=;
	b=obd1h3dUQ/5WJpIqJD4Dy1Tp68n5L0HM+S7svpYfbFA090smkai4ERYtNYrNsbCNSK2ixY
	Uve07b1zguTAxiWdMLaPTw+tGtrR/eU9RZbFKpFcyW8jVmVqIitsGCJZwAaHFTovT2efbY
	+Vz1C80Zk+kTZOQproZ1kiegVB2ryusHjS0xo3nuJEhCwKYxLQZDehkErwz44Bbm51uTWa
	yXTBcTDuEnbCgjW3eSZohruQbsWR15h2Oxc9CnjyPR6AkWPoB7qzLZKUwbnSgZVB8dLbdz
	s2r6jwSe94C7EaRTtYF2GuzOcTBoKU/8K6Vu0+NQTZ0VFdhJ1ynrcFzS+97Lww==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 10:58:11 +0200
Message-Id: <DKYR23KHZXH4.15WVJ8FA59H6V@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/8] python3-pbr: upgrade 7.1.0 -> 7.1.2
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com> <20260826-mathieu-updates-20260826-v1-6-4082bbc152f2@bootlin.com> <40554eb0fcecd37e5e080fe5b93efcfeafca7843.camel@linuxfoundation.org>
In-Reply-To: <40554eb0fcecd37e5e080fe5b93efcfeafca7843.camel@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244383

On Wed Aug 26, 2026 at 10:49 AM CEST, Richard Purdie wrote:
> On Wed, 2026-08-26 at 10:33 +0200, Mathieu Dubois-Briand via
> lists.openembedded.org wrote:
>> Changelog:
>>=20
>> * Fix hook ordering race that drops subpackages from wheels
>
> 7.1.1 in the subject! :)
>
> Cheers,
>
> Richard

Right! I forgot to change title from AUH, I will do so.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


