Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDFAC87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 13:14:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.21415.1754399689785445324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 06:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hPN1/GZo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 649514337B;
	Tue,  5 Aug 2025 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754399687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJX1/qiKdT+P9MeVhTCOTH7ZTQ6ghUmYXrk/+YA40ME=;
	b=hPN1/GZoeSGVA0W4b5OoX9wUbPUlASVX48bJi2Q4zRnJuI1DquXJj5AjIKOYnRRDwnwwiI
	GEcgMlyBhEek2MTUPai3NzQ5iI1A/xb34oPYVWK5e0ImVevKboV768e+oXqhmQrAgyGH86
	I9qhDcAGVxCa41jtkPIpVOOf+/5jqFYcrFviWpH1xfEcSWdfendKtJBo1XzCUB8RAHxQh3
	YOcKgrh4B+DQZTkSnaey3TlJazMhOq8w2nNfqQWwhpNHJMCdSwJxd5qttgwgpYk61GWNHp
	Te3JgnA5RXrk41+8SD4T+iyROb+ppgI0o1xozNg3TvjUmUZvYJHqW3sH3AUNJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 15:14:46 +0200
Message-Id: <DBUIS9SGNETD.1OJZHA0Y17QRS@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] librsvg: upgrade 2.59.2 -> 2.60.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250805063925.771875-1-skandigraun@gmail.com>
 <1858D393D35BC4B4.28357@lists.openembedded.org>
In-Reply-To: <1858D393D35BC4B4.28357@lists.openembedded.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudehvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeettdejvdefudegueejjeehkeejueetudejvddvgeelgeegkeeigeduvdejtdfggeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepshhkrghnughighhrrghunhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvn
 hgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 13:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221472

On Tue Aug 5, 2025 at 11:04 AM CEST, Mathieu Dubois-Briand via lists.openem=
bedded.org wrote:
> Hi Gyorgy,
>
> It looks like the build is failing with this patch:
>
> ERROR: librsvg-2.60.0-r0 do_configure: Execution of '/srv/pokybuild/yocto=
-worker/qemuarm64-alt/build/build/tmp/work/cortexa57-poky-linux/librsvg/2.6=
0.0/temp/run.do_configure.832057' failed with exit code 1
> ...
> | Program /usr/bin/gdk-pixbuf-query-loaders found: NO
> |
> | ../sources/librsvg-2.60.0/gdk-pixbuf-loader/meson.build:40:29: ERROR: P=
rogram '/usr/bin/gdk-pixbuf-query-loaders' not found or not executable
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2147
>
> Now, as this is in the configure step, it might be related with the
> gdk-pixbuf commits from Ross, but they look like fairly straightforward.
>
> I will first drop this series and keep you up-to-date.

Hi Gyorgy,

After dropping this series, the build is all green. So the issue is
probably here.

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


