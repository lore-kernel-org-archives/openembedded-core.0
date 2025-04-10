Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00471C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 08:03:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.29346.1744272223462443882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 01:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KArA9jkn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA069443EC;
	Thu, 10 Apr 2025 08:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744272221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3ZvJ2zIEU/o0ymo4pPwCFsuRqx+eJlDnXP984kkkJA=;
	b=KArA9jknWvdc96HXMmeUgKVG4DKDrVEUTxzzKLRBD1kilpn8NW1Vfa7nFiuu+z51Q10JBE
	YPgLw5i+JuxZbYjCqQBK9zBf7Ic8YcXIHwRNOtQI+hs1KKy4KmXjpttyaAIrPkHGVtkAaM
	Xhu7HFrS+Zc6g6bOTL5cafPIyPp7Bhr4RGIXIYGaU4ZjNlTexyuGWE4YyX3PZwt2g3AQ85
	07FgwoveV4gk9jY4huC+BvCUgu76zzGIqxNGvTTklW8TNrL/b9/6l5EzH5CQtj6LlGWbPp
	tYhqUFES6PLx36aHXWT/VorBmhudiL5LsJMJhWs/gr7vaVsL1wkyCW8lvDN0ZQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Apr 2025 10:03:39 +0200
Message-Id: <D92SWBH82EM9.PR0Y4TYFQ6J@bootlin.com>
Subject: Re: [OE-core] Option to change default optimization level of Python
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Lukas Woodtli" <lw@hqv.ch>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <14bccfd5-f8fb-4120-a779-7219fa18983e@hqv.ch>
In-Reply-To: <14bccfd5-f8fb-4120-a779-7219fa18983e@hqv.ch>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeuuedvleejhfdujeejleetjeehkeegfeehgfdufeeiueekudfhlefftdfhkeetnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehlfieshhhqvhdrtghhpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghms
 ggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 08:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214631

On Thu Apr 10, 2025 at 8:23 AM CEST, Lukas Woodtli wrote:
>  From 1614b1bb21b164d11aa88ff428c6bae9439b82d6 Mon Sep 17 00:00:00 2001
> From: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
> Date: Mon, 7 Apr 2025 13:18:41 +0200
> Subject: [PATCH] python3: Allow to set the default optimization level
>
> It's possible to compile the Python interpreter for the target, that it
> uses a given optimization level by default. This is as providing the
> `-O` option to the interpreter (possibly one or two times) or setting
> the environment variable `PYTHONOPTIMIZE`.
>
> Signed-off-by: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
> ---

Hi Lukas,

Thanks for your patch. However, it seems it was corrupted somehow in the
sending process. This comes either from your mailer or the behaviour of
your mail server. Are you using 'git send-email' or 'b4 prep' to send
it?

First, it looks like long lines are wrapped, so git cannot understand
them. I tried a bit to reconstruct a correct patch, but failed. So maybe
something else was also modified in the process.

Can you please try to fix this? It looks like there is the same issue
for your other patch.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


