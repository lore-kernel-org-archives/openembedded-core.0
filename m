Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED2CC02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 16:08:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.73113.1738944486320100046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 08:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rs/lCnaq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE5DB442A4;
	Fri,  7 Feb 2025 16:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738944484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zyo7I6wvW6B2iUzas3x4t+3Ax+irrJjNeZC2wZ0O/2g=;
	b=Rs/lCnaquC/wuuV5RqA/lq3k9BzsUoVsOEhOzBUZIo/F+g1GXnwFeJVljyqSZLJvQ1G1Ix
	rnPOeZS2pcHoEGPMjOLI3pLJ+ey4AWXwlnAfDSdPmXMLNuH8a3KQ7j/4YuVsvETHthWsK5
	6NrtnbQ0z7wyHVJRXQEbkOODoq7dP08HO7ApILZiP+rVVEtCeO3tJeI5++ZvXgt7LqmGJ0
	RBuGlTmy5SX9X++4XtYMR28O4hMpcif/muGeoswC5BJ8kl1DPY27fQrHcnw5lennvvuT24
	f767bqlEYPyqgu4PXVNTQzTMjmmQjXfgzayM6+KGLbbUYaDUGcJW9X0IRzBrPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 17:08:03 +0100
Message-Id: <D7MCDFANDYTT.2NNXQR99MAHC7@bootlin.com>
Subject: Re: [OE-core] [PATCH] recipes: Drop ld-is-gold support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250206144911.3776785-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250206144911.3776785-1-richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeehgeffkeffgfeiffeliefgtedugeeuvdelhfeufedtfefhgeelgfffvdevuedtnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdplhhisghsthgurdhsohdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhun
 hgurghtihhonhdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 16:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210992

On Thu Feb 6, 2025 at 3:49 PM CET, Richard Purdie via lists.openembedded.or=
g wrote:
> Gold hasn't seen development in some time and is being dropped from binut=
ils
> releases. Drop the small number of special cases for it we were carrying.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

Hi Richard,

We get some errors while building go. I fear this comes from this patch:

| # /srv/pokybuild/yocto-worker/genericarm64-alt/build/build/tmp/work/armv8=
a-poky-linux/go-runtime/1.22.11/build-tmp/go-build691092281/b285/libstd.so
| /srv/pokybuild/yocto-worker/genericarm64-alt/build/build/tmp/work/armv8a-=
poky-linux/go-runtime/1.22.11/go/pkg/tool/native_native/link: running aarch=
64-poky-linux-gcc failed: exit status 1
| collect2: fatal error: cannot find 'ld'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/974/step=
s/11/logs/stdio

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


