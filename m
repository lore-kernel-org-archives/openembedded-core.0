Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A82C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 14:08:55 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.22417.1741097333342806643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 06:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XgWke0jV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7BEA41CFB;
	Tue,  4 Mar 2025 14:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741097331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXHl73XMV3sYkepdj2WnTeIbd7Aznx7tzzgW6Oe6U9U=;
	b=XgWke0jVf6jBZCEnTeNBwP0j8o/1w4ophdX61loE/ampVYl6Ewv5KIGHGD13EubPNgNWhs
	x5yFEUOQu4yUfvwdHIYuWq0MELKizCAlGFTftq4yUY3yRKuKvXz48pWBzQsoEgtgbs+C2k
	Uh5K4TXW//fJ0OPpXMT9NXVAUUK8o8E9+OPMkVsCPW/Xu+E/6xZh2XT5P4hpAkcBPQd/Hg
	gnE0+xwQJiXb3iBwPJ6R6oaxf8We/xt9kwp5ugNBQOF1i9zIuW4jnGik1KeROKGthNmK6g
	KKpH+0O9BbrGDAA8fBtdCMAQVTsSgQKLCMw49ZWVvDDtphCCy2pt0gCCoxDOgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Mar 2025 15:08:50 +0100
Message-Id: <D87JHRJADHM3.1RAUNZ5YO2S98@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 04/31] gi-docgen: upgrade 2024.1 -> 2025.3
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
 <1741079356-13445-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1741079356-13445-4-git-send-email-wangmy@fujitsu.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmpdhrtghpthhtohepohhpvghnvghms
 ggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 14:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212286

On Tue Mar 4, 2025 at 10:08 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> Added
> ------
> Add layout for tablet portrait mode
> Support static virtual methods
>
> Changed
> -------
> Don't generate classes hierarchy if not needed
> Improve copy buttons on narrow layouts
>
> Fixed
> -------
> Only consider dot data processing fail if dot returns non-zero
> Show non-standard instance parameters
> Fix C declaration of structure fields
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi,

It looks like this is adding new warnings on the autobuilder:

WARNING: gi-docgen-2025.3-r0 do_check_backend: QA Issue: inherits setuptool=
s3 but has pyproject.toml with setuptools.build_meta, use the correct class=
 [pep517-backend]

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1654230/raw_inlin=
e

Can you have a look at this issue please?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


