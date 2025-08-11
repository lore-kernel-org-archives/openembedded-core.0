Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380D4C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 12:45:06 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.47201.1754916296176563788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 05:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nrb/4PFk;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEFDE44982;
	Mon, 11 Aug 2025 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754916294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdpB52FOAoiO5lrhEMXB+Pme0fJfc5AGnQfTkkwuJmQ=;
	b=nrb/4PFkHF1F50aI2uF+9QVWwYVDHjRo7lLKb919t7dT4fUB/Si4PebZRfqOxPi/cbCx2k
	PGCFNNIOVsTI7jL+Lbw3Ot7Yf5/la8ViU3nXPz3hxOBlC84d4QduhR8HrVumSf4JPrh4N7
	Dk82ThHfkCV8xj9iP1bb0GRC8sXQzqJ+hPLCjQml6qQ7AgvWBfafY1hXucEy/ySRO27AdQ
	OtXLlGKdge42Phw5wWIVDilnJaT4kfrr8e1/Dy6VyHxPJ9AWShMCK0OVg8qHNDrfmw64kV
	16MJqLnGmRrFmpsYN5lGnXlaE8Q51v3lQOAhOITBdw1ABmkg3v68LvpuRM63wg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 Aug 2025 14:44:51 +0200
Message-Id: <DBZLWMNEMBSO.1REVKMRL4CMZO@bootlin.com>
Subject: Re: [OE-core] [PATCH] Revert "qemux86-64: Reduce tuning to
 core2-64"
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250810222523.2487072-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250810222523.2487072-1-richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufedvgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetkedvtdduteetteegjeeukefhgfejgffffeffueffjefhvdehjeefkeefuddvvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdphihotghtohdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhun
 hgurghtihhonhdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 12:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221736

On Mon Aug 11, 2025 at 12:25 AM CEST, Richard Purdie via lists.openembedded=
.org wrote:
> This was originally applied as our autobuilder had older hardware and cou=
ldn't
> cope with the newer settings. This has been resolved in the new cluster s=
o we
> can go back to the newer tuning, which software is now more likely to nee=
d.
>
> This reverts commit 369b1dfa28b1791d45f068acc765190defecd460.
> ---

Hi Richard,

I believe this is breaking numpy ptests. I'm not sure to understand why,
but git bisect points on this change and it is confirmed by only failing
on x86-64.

Failed ptests:
{'python3-numpy': ['python3.13/site-packages/numpy/_core/tests/test_umath_a=
ccuracy.py:TestAccuracy.test_validate_transcendentals']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2067
https://valkyrie.yocto.io/pub/non-release/20250811-33/testresults/qemux86-6=
4-ptest/core-image-ptest-python3-numpy/

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


