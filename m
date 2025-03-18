Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46F8C28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 15:48:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.31.1742312878406354437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 08:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EA0lySX7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52F344431B;
	Tue, 18 Mar 2025 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742312876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ueLNjzEhao5lIpc+6ukasgTE8ektyBjRiSPxneYlYU=;
	b=EA0lySX7WY7EZF8ZbL+AXER6HFpoB5T0YDlQyBYzUxC+SBE9EdOfoCJ5/gWf2KKW2Jmrcd
	3D4V1XfN4DQptiSObLaui+2F7CtscykysRwvDc2piqN4gQD0e+KtubMJCslCnCHwmpvGWJ
	kzX6dNXMKBm+v0Hfg6z6O779/Hs6gtayULOtn9VwyzRqbLnW4ubhvmLSFjNzYAj4rVED6V
	QQ7UoklOLx7TJNAV3fgZ4hp3nfcuxu5BQ4NAdUVnBc/99KbDACsVcd2o0oSbVvZb7xiFNx
	luRIPDtqjIOQOsul6KDMhj2F4/P+sJ5GhMjbNOq3epQugtZXkDk/9JavEwYmBw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Mar 2025 16:47:55 +0100
Message-Id: <D8JID9D3CPOW.2CKN0S40NRT9D@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 13/24] man-db: Add missing rdep for col
 utility
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250318043846.2422141-1-raj.khem@gmail.com>
 <20250318043846.2422141-13-raj.khem@gmail.com>
In-Reply-To: <20250318043846.2422141-13-raj.khem@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghms
 ggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213218

On Tue Mar 18, 2025 at 5:38 AM CET, Khem Raj via lists.openembedded.org wro=
te:
> man utility calls col utility internally when formatting is asked for
> therefore it expects col to be in rootfs otherwise silently errors with
> retcode 3 meaning 'file not found' in this case its due to col not being
> found, other distros eg. gets this via bsdextrautils dependency
>
> libssh2 ptest mansyntax.sh fails due to this error, which now works
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

This triggers a new QA issue:

ERROR: man-db-2.13.0-r0 do_package_qa: QA Issue: man-db rdepends on util-li=
nux-col, but it isn't a build dependency? [build-deps]
ERROR: man-db-2.13.0-r0 do_package_qa: Fatal QA errors were found, failing =
task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1229

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


