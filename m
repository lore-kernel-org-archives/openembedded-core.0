Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8627BC5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 21:12:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.1202.1748985124236473360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 14:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g6DzzcML;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4777433CF;
	Tue,  3 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748985122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=impc3UDaDGAPirtDIqwX5f3s34/kfYvdf5xWFKKUmE4=;
	b=g6DzzcMLib22g6lV1OZuxwsfhnvgevMIGdDFTOh4aSoCgHJ/Ni5s88x7k3CL0Z45PW5d5f
	OT2n1RUFCV2VHRB5KCKxfdU7bbY3bTb2VtBOOcUtrd5ud/wRPY0qDss+0S7cEBpmgXlEdK
	VyVRau2Jf4lBOeVpv7ZqydNu1+NZZ0PNzofimbBYIVI7Nh117Ts/9ZHZTbZmHDayss5K6c
	Ny+rqNJJnBzS/+NR/NaLWf0/R4D2yGf5smYkQECF9keptb7+QwxolKSlQ6lqwVbwLtCXnm
	9i61xVBH4NlNxCg2IunOagltVA9kdGx0n3yXH+euWMTJ6+rbPfkU+AAWL6l/tw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Jun 2025 23:12:00 +0200
Message-Id: <DAD7HC7Y5E4V.3AEBXGRCPG1EN@bootlin.com>
Subject: Re: [OE-core] [PATCHv2] util-linux: Improve the package licenses
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.kjellerstedt@axis.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250603102320.2344115-1-pkj@axis.com>
In-Reply-To: <20250603102320.2344115-1-pkj@axis.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphgvthgvrhdrkhhjvghllhgvrhhsthgvughtsegrgihishdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 21:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217825

On Tue Jun 3, 2025 at 12:23 PM CEST, Peter Kjellerstedt via lists.openembed=
ded.org wrote:
> The default license for util-linux is GPL-2.0-or-later.
>
> Most of the applications and the libraries are also linked with
> libcommon.la, which uses these licenses:
> LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & MIT
>
> Set the above licenses for all dynamic packages, unless explicitly
> specified.
>
> In particular, this avoids setting BSD-4-Clause-UC and EUPL-1.2 on
> packages where they do not belong.
>
> License-Update: See above
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>

Hi Peter,

Thanks for your patch, but I believe we have some issue with the
licenses. Here is the error on the autobuilder:

ERROR: util-linux-libuuid-2.41-r0 do_package_qa: QA Issue: LICENSE:util-lin=
ux-libuuid-dev includes licenses (LGPL-2.1-or-later MIT BSD-2-Clause) that =
are not listed in LICENSE [unlisted-pkg-lics]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1814

Can you have a look at the issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


