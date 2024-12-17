Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4642DE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 07:37:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.76518.1734421062195452178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 23:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GIVTt6Z3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC8D51C0008;
	Tue, 17 Dec 2024 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734421060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+ktDCKMNfMegw+PQNrCdAz6mVeTL+n1PUWkT932AKk=;
	b=GIVTt6Z3gLxYtmqxFvlaYDbu19T0Xdalj3d33GDCHw8Hvio0Y58aWHTS8+0gmMEMabZ4K3
	l07B1YxRkyqAIyPgyLFjzO5c6JXFZ6pZzOmXeCzO7W8tGKNRLClMnB9zz3GfO30ryVQAo/
	gcRiltQqYdeuYdxPupu+D+SgColqyU0MFzJ78kYXvu2Ka3VO9rKVSWv+NuhefcnNsQaBZr
	eeCQL5o9DvKRIJ74OQ218HcAWUJg+qeyQx1ms6lcLJP1HB0fSkvXSgHReYe9KzJlH8RskV
	ru14C3CT1gYBRZMYcjZ/7A4vwPXELHzBd0BAOszksq8hC4GQYLdhUz3ZPBBcYQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Dec 2024 08:37:40 +0100
Message-Id: <D6DSYBCD4I4G.2O4ZDW15ZPJ1S@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>, <jpewhacker@gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] meta/lib/oe/sbom30.py: correct alias
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241217034724.2737515-1-hongxu.jia@windriver.com>
In-Reply-To: <20241217034724.2737515-1-hongxu.jia@windriver.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 07:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208802

On Tue Dec 17, 2024 at 4:47 AM CET, hongxu via lists.openembedded.org wrote=
:
> After commit [spdx 3.0: Rework how SPDX aliases are linked] applied,
> it added extra "/" to namespace, which causing the replacement of
> UNIHASH missing a "/"
>
>   http://spdxdocs.org/openembedded-alias/by-doc-hash/0b308e4b9ad979f642d8=
787c61f76c31bdcad04837eeaaf8bc383f33f99bbeb8/flex-nativeUNIHASH/build/recip=
e
>
> After applying this commit to remove "/" from namespace.
>
>   http://spdxdocs.org/openembedded-alias/by-doc-hash/0b308e4b9ad979f642d8=
787c61f76c31bdcad04837eeaaf8bc383f33f99bbeb8/flex-native/UNIHASH/build/reci=
pe
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi Hongxu,

Sorry, but I still get the SPDX IDs were unable to be resolved warning.
E.g.:

WARNING: core-image-sato-sdk-1.0-r0 do_create_image_sbom_spdx: The followin=
g SPDX IDs were unable to be resolved:
  http://spdxdocs.org/openembedded-alias/by-doc-hash/82b2ddffbd624bcb26b4c9=
3f8e7bf31e456ea81a1e5720354726d1fc7e433dd0/openssl/UNIHASH/package/openssl-=
bin
  http://spdxdocs.org/openembedded-alias/by-doc-hash/882a5d190518b194aea738=
0573eeee8a79f524131463308e414d0cb51f9a8099/openssl/UNIHASH/package/openssl
  http://spdxdocs.org/openembedded-alias/by-doc-hash/974e7ddc5b8f9307c77078=
3e7d96e9e9fc65cd5b3f9cdd5a8578e4ed121dd8d1/initscripts/UNIHASH/build/recipe
  http://spdxdocs.org/openembedded-alias/by-doc-hash/f63cc948b407d32cfacbfc=
288d66c3fb64a6a611debfd7989d2cda55d7a957ca/openssh/UNIHASH/package/openssh

https://valkyrie.yoctoproject.org/#/builders/6/builds/668/steps/12/logs/std=
io
https://valkyrie.yoctoproject.org/#/builders/8/builds/666/steps/15/logs/std=
io
https://valkyrie.yoctoproject.org/#/builders/9/builds/646/steps/12/logs/std=
io

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


