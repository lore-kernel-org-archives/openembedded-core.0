Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E387C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 15:23:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.1684.1752765833061233327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 08:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ixr4Y3Hf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C268C1FD38;
	Thu, 17 Jul 2025 15:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752765831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P70gECIeXfIfQ7XxJtigStFk3kMb4Ozwbhm0xHJWr0I=;
	b=ixr4Y3Hfum0/LEwPSH0UwygIRLeMi5DPyWo3hZiQDXDmSwA/6HxOCR8J2GvPWSjnPyG1/a
	vC6Li1Ys8WCIv2WgyJ27rv9mZ00N7XFbf6MOIQdzMp56k4ZZhH6nPBdsx9ZS5J8/1t1mW0
	4nLVb3dm/aJhXsiu6lZTnxTBSD2jJARypZhgLlcMXoKEPzMLhA20xYRPCNRY0EjIGMHhoP
	g54gmelS9KZ+h5ef/kvnmWedxjW5ScJb5hXMwrBnK0zF8fArMxxphFi4M4l7C1P/B/ETAl
	xFsswkaL73U/Oh4z9/3CEyyS3/TVNd8NoVhJnz9RhbhGZYeOVK72Gsy89OyLqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 17:23:50 +0200
Message-Id: <DBEFMQER8UIT.PFP980KBIKDV@bootlin.com>
Subject: Re: [oe-core][master][walnascar][PATCH 1/1] gnutls: upgrade 3.8.9
 -> 3.8.10
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <archana.polampalli@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250716141044.1733137-1-archana.polampalli@windriver.com>
In-Reply-To: <20250716141044.1733137-1-archana.polampalli@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeltdehveffgeehveetfedvieffleekiedtffejudevuddtfeeiteehhfekffeknecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhnuhhpghdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdihohgtthhordhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprghrtghhrghnrgdrphholhgrmhhpr
 ghllhhiseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 15:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220548

On Wed Jul 16, 2025 at 4:10 PM CEST, Archana via lists.openembedded.org Pol=
ampalli wrote:
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> Changelog:
> https://lists.gnupg.org/pipermail/gnutls-help/2025-July/004883.html
>
> Includes security fix for:
> CVE-2025-6395
> CVE-2025-32989
> CVE-2025-32988
> CVE-2025-32990
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---

Hi Archana,

Thanks for your patch.

It looks like this is breaking some ptests:

Failed ptests:
{'gnutls': ['compress-cert-conf']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1909
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1917

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20250717-75/testresults/qemux86-6=
4-ptest/core-image-ptest-gnutls/
https://valkyrie.yocto.io/pub/non-release/20250717-75/testresults/qemuarm64=
-ptest/core-image-ptest-gnutls/

Can you have a look at these failures please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


