Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06961C71135
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 12:39:01 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.8364.1749991139020302498
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 05:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X06D9IHc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E91361F433;
	Sun, 15 Jun 2025 12:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749991137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtT4yf/0yHKfrhMEbLq96c0q3VMrRu3xa5OWGgrUcp0=;
	b=X06D9IHcWncTzPtGEiME3n9LY3deeODh8WIThAUkhD4TfbkmKzjQTMPJHeoYTZLP1bLE+c
	GhKm5mimS4UPYcZx4v4t0hVo8xu2JwZapO1iOBCoz8rM0LfLoN7teeVpRE4fmWhvYkmW0N
	jp5XUhOMlSKjNfm6rIZXcA5VJS3aLSNOUw+Vkl6Tuo+94ochz3O4HcX4FZnutpUIcYeSZK
	tNO0ytDPHnJ912Ff0VZ/3ET0wgHgfpvq9Gh5YW5dbmw7FgIGpUJdwOVIKCHV+TT9QwfjGL
	ZCg8KEPIvqRGwST15jFlIutZ5aGdPI48FuxZcgfn0YHl7GlwK77OHYNuuPstbw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Jun 2025 14:38:55 +0200
Message-Id: <DAN4314CMOY9.I0WKN4F86V5M@bootlin.com>
Subject: Re: [OE-core] [PATCH] systemd: Rename systemd_v255.21 to
 systemd_255.21
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <setairidis@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250614203340.11007-1-setairidis@gmail.com>
In-Reply-To: <20250614203340.11007-1-setairidis@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvfeejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeiveeftdeffeeivefhjeekieelveeffeeugfdvgfekleegtdegueetgfevvdeinecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpvddurdgssgdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemjegsleehmegthegvheemfhhfjeeimeejfheisgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmeejsgelheemtgehvgehmehffhejieemjehfiegspdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepshgvthgrihhrihguihhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgesl
 hhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 12:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218649

On Sat Jun 14, 2025 at 10:33 PM CEST, Savvas Etairidis via lists.openembedd=
ed.org wrote:
> Pumped PE property to two, since this is not a version bump
> but a rename. The recipe was accidentally renamed with a 'v'
> prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.
>
> Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
> ---

Hi Savvas,

Thanks for your patch but this does not apply on the master branch.
Actually, I believe there was never any file named "systemd_v255.21.bb"
in the history.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


