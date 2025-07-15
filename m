Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A97C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 13:10:07 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.8251.1752585005096676241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 06:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dmsgGb+A;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2537B44A01;
	Tue, 15 Jul 2025 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752585003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LrTxt5kzl7HBsnr1Y9gOnjzumxJw8nd7kPHZLjnFbeQ=;
	b=dmsgGb+Ar7wrTez5558F1wtU/cFTzbW8xtFe5X3LCqHQ8diZAYP4koz55WwaCUW8vXw/kN
	ellxmlS0EnLk5NugLhvj4GvYF1bCCkSPIu0iBnMVWLcbl3lVE46rcBOTp1WVLYXX6xoVnE
	VTA9oWk41W5aQNXyH+5lUbW04onjh/4OAo1y/jJ7edtyDeHH2DMH/7kwNXsugebPQHJe21
	zr73Ygp/Dct3ZoEmNBnN9Hk/PZUEXCrcrak8NMrfnRufWnJQaBo8lCnWJoUwLZHlSK7S2V
	Vr4MRiq4hJDprx4Gusvl6rXaKKpZRLWvr8QKU+sb4wL8Bv6Bpad2xa7rR+MAoQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 15:10:02 +0200
Message-Id: <DBCNJ7EUDW81.3P4BML7UON5UA@bootlin.com>
Subject: Re: [OE-core] [PATCH 04/19] gnutls: upgrade 3.8.9 -> 3.8.10
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250715080819.622-1-wangmy@fujitsu.com>
 <20250715080819.622-4-wangmy@fujitsu.com>
In-Reply-To: <20250715080819.622-4-wangmy@fujitsu.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteekvddtudetteetgeejueekhffgjefgffefffeuffejhfdvheejfeekfeduvddvnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdihohgtthhordhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmpdhrtghpthhto
 hepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220295

On Tue Jul 15, 2025 at 10:08 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the recipe update.

It looks like this is breaking some ptests:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1893
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1896

Failed ptests:
{'gnutls': ['compress-cert-conf']}

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20250715-107/testresults/qemux86-=
64-ptest/core-image-ptest-gnutls/
https://valkyrie.yocto.io/pub/non-release/20250715-107/testresults/qemuarm6=
4-ptest/core-image-ptest-gnutls/

Can you have a look at what went wrong here?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


