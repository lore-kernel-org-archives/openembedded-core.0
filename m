Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63104C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 14:55:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.64153.1753973711443031160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 07:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m1SpKAJI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4565E4429F;
	Thu, 31 Jul 2025 14:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753973709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Cu7yhy6o4mxtceRP4kMZrG6pwDwaUDck09E9U8N8G8=;
	b=m1SpKAJIWiUa9Hwv3Ja74wtlkrp+VyioOhkOQHWYuaE34v+xqXaBTrZ2bjXMovDLeuZ5Yz
	0hbX3dAQz0W3Zx+n4kKflvdFf9vOVtjGhdLFjLtgLVSWRrbp6x+pkS6PclrPiic5d0yw0V
	/Gkf953+eTSAWtmtuTi2BVgRLG8zmrwaSjAPs0Nh1FheZG773WSPGbjkSmrsENHGWDxMol
	BWQciwsrLVfkwJ/10UtPXm7HNHwHrGTm1xS8X0GlX5Ef+wSN9bWrTm1lK/e1SV9RtAkwby
	kWvh1PbWDSANSHrm2mROVFOLUt13ZlzE3euJ2lmg9CRUuhoDYpcYwXTvs5dOig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Jul 2025 16:55:08 +0200
Message-Id: <DBQBSE7C0LVV.33939M868VCHB@bootlin.com>
Subject: Re: [OE-core] [PATCH v4 2/4] selftest: runqemu: add tests for
 booting zst compressed image
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <yoann.congal@smile.fr>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250731102303.3513121-1-yoann.congal@smile.fr>
 <20250731102303.3513121-2-yoann.congal@smile.fr>
In-Reply-To: <20250731102303.3513121-2-yoann.congal@smile.fr>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehophgvn
 hgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 14:55:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221197

On Thu Jul 31, 2025 at 12:23 PM CEST, Yoann Congal via lists.openembedded.o=
rg wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>
> Add a simple tests booting a compressed image given to runqemu as path
> and as image recipe name.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---

Hi Yoann,

It looks like this new test is failing on armhost. Also, the QEMU log is
not really verbose, maybe the image does not boot at all?

2025-07-31 13:42:51,342 - oe-selftest - INFO - ERROR: runqemu.RunqemuTests.=
test_boot_compressed_wic_by_recipe (subunit.RemotedTestCase)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2217


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


