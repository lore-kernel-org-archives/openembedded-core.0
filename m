Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180CCC83F04
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 13:31:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.23762.1751463112771581394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 06:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z00yBG3i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82FBC442CA;
	Wed,  2 Jul 2025 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751463110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mie/04w8wmQOJ6f0GXDkiD5HBbWNnRSvTVx7nnS1V28=;
	b=Z00yBG3ic2dbOsqPtSsfGlblykPRp2Ucr7WUl/VLS3YBNNj77Jwp0Hw8LIsZkTuFjZuJ+G
	OX0RtjVswi217v6OkZQ22gjvMz4v5Xe1fHrJ6Kt6zdXyvET35sAZL0PYabupZtSg2XNgDO
	idO+HNKjaq6PIF+k9iiJEUQnNh+AWXBQqigzQ/iA8zN+Pmn7I4Kvh8BWslU+qIvFA3NnGl
	GlZUiiaXevPtHez97YZQ0NkOOTM2b5ctG+gkUH2GwHjpnwKtDKUyT2DUOYHsti7TKe24yl
	mhn/Nr0Gp3+d7fltvZ93kVL1G17zwfJYVnNb0rTW1FTPBF8qk4kpmeELs5yIBw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 15:31:50 +0200
Message-Id: <DB1LUT15L973.1EEQXDMIYLN4S@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 7/7] cmake: upgrade 3.31.6 -> 4.0.3
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250702083148.3035805-1-Moritz.Haase@bmw.de>
 <20250702083148.3035805-8-Moritz.Haase@bmw.de>
 <DB1I4TNLB9MM.1N3LT4JJ0KPIL@bootlin.com>
 <DB3PR09MB620210718C1ACA5494FFE771EA40A@DB3PR09MB6202.eurprd09.prod.outlook.com>
In-Reply-To: <DB3PR09MB620210718C1ACA5494FFE771EA40A@DB3PR09MB6202.eurprd09.prod.outlook.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffheekueetteekueefjeejveevuddutdfgueetieevkeejgeejgeetueevkeefudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopefoohhrihhtiidrjfgrrghsvgessghmfidruggvpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrt
 ghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 13:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219832

On Wed Jul 2, 2025 at 2:29 PM CEST, JD-62 Haase Moritz wrote:
> Hi Antonin,
>
>> This last patch does not apply on master, maybe needs a rebase?
>
> sorry for that, my editor messed up the patch formatting when editing the
> patches to include the changelogs. That happened for all of them, but see=
mingly
> only broke the CMake patch. Will send an update shortly.
>
> Moritz

Thanks, I'll try to queue that up tonight or tomorrow.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


