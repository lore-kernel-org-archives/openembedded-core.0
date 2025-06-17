Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA233C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 08:06:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.13234.1750147605737841779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 01:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pgrweTOL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B10C43955;
	Tue, 17 Jun 2025 08:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750147604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oja1UgyAEYGPywnbYWVEQBxfNZMeUdq95a7XcaaPE0Y=;
	b=pgrweTOLfasWu+p3LnjBukgruiVh/QU8EXK+R7ANLm9ueIoK+5Duria2WIom6dGz3OghKh
	e1qoMT9lUa3e0TKht9jqIi/K6leONNgCoUu13EFxExcaplWMvMNPE/jZqSdHjqGJCU8+7K
	1p/XgO3C6wh0l3dUXMlWRjVE9u7UOGknHDQUZCjnB+So76IZ5Z/fn9N15hVAT+Q8OEdPDW
	WIKJ+Gm9I8S/RD6tKH5DndiB2T9fLSnqacD01bmqtcrpQxbvNCzHaAui5ZhDMS1F0/Pasb
	srgB8VIn+7xiMT6f4HgAf7YYQV7QSZ4SMmjnNH8bSOGzJVGmQXLnvcOe/z8fVw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 10:06:39 +0200
Message-Id: <DAONJNWI9CKT.Z78C1GZFMAUI@bootlin.com>
Subject: Re: [OE-core][meta][PATCH v2] dropbear: add xauth runtime
 recommends dependency on x11 DISTRO_FEATURE
Cc: <ross.burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Andrej Valek" <andrej.v@skyrain.eu>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250605091828.50442-1-andrej.v@skyrain.eu>
 <20250616073742.47439-1-andrej.v@skyrain.eu>
In-Reply-To: <20250616073742.47439-1-andrej.v@skyrain.eu>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvkeekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkefhkeeifeethfejteevfeduheduvddvuedvvddugfffhfevkefftefhuefftddunecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhgurhgvjhdrvhesshhkhihrrghinhdrvghupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhis
 hhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218857

On Mon Jun 16, 2025 at 9:37 AM CEST, Andrej Valek wrote:
> Change enable-x11-forwarding PACKAGECONFIG to x11, while we can rely
> directly on X11 DISTRO_FEATURE. Previously when enable-x11-forwarding was
> used, the XAUTH_COMMAND failed due to missing xauth. So add xauth to
> runtime recommends dependency and enable this behavior as default.
>
> Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
> ---

Hi Andrej,

It looks like the v2 depends on the v1 here. I would have been happy to
squash them, but the commit message is different, so I don't want to
interfere too much here.

Do you mind sending a v3 with a single commit?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


