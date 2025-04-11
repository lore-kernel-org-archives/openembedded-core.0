Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D91C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 07:36:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.20044.1744356982197100910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 00:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KF18BYET;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C1A920486;
	Fri, 11 Apr 2025 07:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744356980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OrFewJhiLU2A0lghBQwf2mZm/X4pivVeopONjYyJLX8=;
	b=KF18BYETIZWRmfjlpLZHdchhkmjD3yYVv1gQvt5pUBh5oQ8EDzCXnwwp4ORE2MwD6GrI6z
	6KqLR6+zoATOMRhLl+nb/No+U7Vq1yHDzoIZaeHrGPLI6Oe+6NW5XR4F+v/KuNyvmpingH
	CfotdE3Z8fWZv+lyEiUlhDJ6ddqHpkyaLHmdBYaFd0JlntimhwSmWxMZZT1slHXC7v0CkY
	grpyIONw9iJ2jdiV3ZxRnMtj+/WPZOM+e+EgaD44U0vZsFIOoeMBlkvJrmkYCunzIo5EaR
	UZfhlfTBxju7IarMKbDDe4Lm6BGVouMtVE/KgNUI6omdplHsijZB+qBU5vmRQw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 09:36:19 +0200
Message-Id: <D93MXXT6F706.2574MGU99TVPT@bootlin.com>
Subject: Re: [OE-core][PATCH V2 2/4] nativesdk.bbclass: handle
 PACKAGE_WRITE_DEPS
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250410134021.1299595-1-Qi.Chen@windriver.com>
 <20250410134021.1299595-2-Qi.Chen@windriver.com>
In-Reply-To: <20250410134021.1299595-2-Qi.Chen@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffellefgveekfeegheejiedutedukeffkeduvdevvddtgefgffffveefgfdvudenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopefsihdrvehhvghnseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhis
 hhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 07:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214714

On Thu Apr 10, 2025 at 3:40 PM CEST, Chen Qi via lists.openembedded.org wro=
te:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> We want nativesdk packages to depend on correct recipes introduced
> by PACKAGE_WRITE_DEPS, so do the same mapping just as we do for DEPENDS.
>
> Before this change:
>   nativesdk-glib-2.0 -> qemuwrapper-cross
>
> After this change:
>   nativesdk-glib-2.0 -> nativesdk-qemuwrapper-cross
>
> This can fix do_populate_sdk failure complaining missing of
> nativesdk-qemuwrapper. Error message is like below:
>
>   NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
>   NOTE: Exit code 127. Output:
>   /xxx/lib32-core-image-sato/1.0/intercept_scripts-xxxx/
>   update_gio_module_cache-nativesdk: 13: nativesdk-qemuwrapper: not found
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

Hi,

Thanks for your patch.

It looks like this is causing some issues on the autobuilder:

NOTE: The "universe" target is only intended for testing and may produce er=
rors.
NOTE: Resolving any missing task queue dependencies
WARNING: Nothing PROVIDES 'nativesdk-ptest-runner'. Close matches:
  nativesdk-libtest-warnings-perl
  nativesdk-serf
  nativesdk-xtst

I was able to easily reproduce this locally, just with "bitbake universe -c=
 fetch".

Can you have a look at this, please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


