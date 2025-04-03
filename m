Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AB7C3601B
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 08:12:19 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8230.1743667933994674581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 01:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P9W9srgE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2216432FA;
	Thu,  3 Apr 2025 08:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743667932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nZi05Fz0/DKD8XdUjRfuv2fXUeJPQy4l8BAfQhfE26E=;
	b=P9W9srgEYdeijp20fuXtZ8WbtMXN3sRulsljRTt0W/4z3vum2lcfyNMW+RYyUAevwc+is1
	7xCeeCc2WMLkjdBRzCRjLVaV6BvlFjAScBhygyJ42dTwql4E0kE4FE8/csQUHJQ2Yc2R82
	a/NkFIJUTWfDha/DTatz0fCJtLPzktwVyyHIE9l+Z7d3zCgYVRTLxe2iodaEgEJCeyYTlY
	wAzwCUmMvmvaBf71PNQUbjJ3MarAOZR436YjNqdYQM7RYXZyA+RWqjz3wbvwxrGNyeJN4A
	Kab2wzblnWEdGwBTpPjf7e+/TjlM2YPt8FABEtcluKgQe/GrM59Irt0vp+73SA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Apr 2025 10:12:10 +0200
Message-Id: <D8WUP0YFP44E.1R84PVEYQIAT6@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <leimaohui@fujitsu.com>, "Khem Raj" <raj.khem@gmail.com>, "Richard
 Purdie" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] python3-pdm
 python3-pdm-{backend,build-locked}: move from meta-python
Cc: <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250403025551.2159-1-leimaohui@fujitsu.com>
 <20250403025551.2159-2-leimaohui@fujitsu.com>
In-Reply-To: <20250403025551.2159-2-leimaohui@fujitsu.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeektdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefueelgfffteeludehvdehteeugeevudduvdejieelgeegkeegfeejvdevvedtleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhgvihhmrghohhhuihesfhhuj
 hhithhsuhdrtghomhdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 08:12:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214305

On Thu Apr 3, 2025 at 4:55 AM CEST, leimaohui via lists.openembedded.org wr=
ote:
> python3-pdm and python3-pdm-backend are dependencies of python3-webcolors
> python3-pdm itself depends on python3-pdm-build-locked
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---

Hi Lei,

Thanks for your patch.

> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "pdm plugin to publish locked dependencies as optional-depen=
dencies"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D19382cdf9c143df4f00b9caa0b60c=
75a"
> +

We have a warning on the autobuilder about this, as it lacks the
HOMEPAGE link:

WARNING: python3-pdm-build-locked-0.3.5-r0 do_recipe_qa: QA Issue: Recipe p=
ython3-pdm-build-locked in /srv/pokybuild/yocto-worker/a-full/build/meta/re=
cipes-devtools/python/python3-pdm-build-locked_0.3.5.bb does not contain a =
HOMEPAGE. Please add an entry. [missing-metadata]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1333/ste=
ps/13/logs/stdio

Can you fix this please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


