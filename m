Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA27DC61CE8
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 14:04:36 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.9643.1749996273648082526
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 07:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UuF28DXb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E241443E4;
	Sun, 15 Jun 2025 14:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749996271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3oQyc+WVKVqR74vY4WNCXJ9W0VlzPa5SzDTIks257YE=;
	b=UuF28DXbrtzOg5HSbxAxak/tYVuR73DFwpMJEgHuukBpsCmIutEJn2bxhoJCKtWRQgiGlQ
	YgzONGuH1Duo8uNBVUjZp5+yXBZBzLQBIiyR62GiirNRPAA3pqFRaGmhzluny/Zekf1cE6
	NGcvbQrsAnJr6p76j8qTPgj+DCPTkVjc625Qz0/G719Z/UYHvtsRDaDOlLxid4pcwk036g
	NcQ7TiQANcfLVrJA4o4C2I/XPhWr2f3fiNrP5kt2liNc4UlmAp+2nr4LEwunIbxOU80rxl
	TSSZOHuo7GoeEPiF1JF3jJm6EZbVamBRhwpXgRUhdS3XYPM4FVXJE7fYX5zySQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Jun 2025 16:04:28 +0200
Message-Id: <DAN5WJ6PQEEP.2UZ3G1EW9VOZ2@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] wic: Avoid problems with "-" characters in
 plugin names
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250613164642.1614047-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250613164642.1614047-1-richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvfeeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfguedvgffhgedthedvgeevhfekgeehieekleeffeffteehiedtudduleduudelnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmeguudgsmedufeduvdemjeduiegrmeefjehfheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmeguudgsmedufeduvdemjeduiegrmeefjehfhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtp
 hhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 14:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218745

On Fri Jun 13, 2025 at 6:46 PM CEST, Richard Purdie via lists.openembedded.=
org wrote:
> Remap "-" characters in plugin names to "_" so wic plugins
> can be extended using standard python class inheritance.
>
> This change means wic files can be incrementally updated over time
> to the correct name rather than breaking everything. Actual plugin
> module files will need to be renamed as done in previous patches.
>
> Also remove a double call to get_plugins() which isn't needed.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

Is this patch to be applied with the ones from Anibal?

In any cases, with or without them, I have build errors:

| ERROR: The 'bootimg_partition' --source specified for /boot doesn't exist=
.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/1848
https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/1849

Or am I missing another patch?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


