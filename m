Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BFEC369C2
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 12:07:24 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.13552.1745496435480255206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 05:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jJEk7I5h;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACF294398B;
	Thu, 24 Apr 2025 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745496433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkPTGsdpMXGccEdkrr+vtiYnB83IlOq9byrDlyQltLM=;
	b=jJEk7I5hZZ8GyJhnG6GzvDpsoPo8Vc22BatR1fUtOpOsqSSvk4T/VHmnO9Kk7mPZDfisOK
	XjpU9njVVdZvIT4OElgg8nTUDl5cRU9Djrx+kFEtKBWd5ENar6GXChcZ8KVISWZoGaGdhm
	0/ByiQwl9rG0KyTnYoCOeb0Bq9+sbGarwx7uXDaeGXSXlgPCwYk1JdbwLEp7MQoHb/3gqz
	cOqvbj7QkiijCyYpxRocr5x48MP5QkRSlqdvUXRvngtb0RJIaFZhEqrnISxUV+ctmHKKVr
	vmLtr87G/pTc8Muibgs7Cpk96sUAJmUpsFb51Il5+qA4xjqCsxeXAtgGUZ83fw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 14:07:10 +0200
Message-Id: <D9EUUEE9YG0F.317W9TAS2P6EO@bootlin.com>
Subject: Re: [OE-core] [PATCH V3] icu: set ac_cv_path_install to install
 under hosttools
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Changqing Li" <changqing.li@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250422130702.1337476-1-changqing.li@windriver.com>
 <D9DR2YV3L26S.29EB7OC0D9J5S@bootlin.com>
 <73c9bad4-bedc-43ec-a06d-a8b4dc62548b@windriver.com>
In-Reply-To: <73c9bad4-bedc-43ec-a06d-a8b4dc62548b@windriver.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffdvleefhfffkeeuvdethffggedthfevgfegteefhfehgfeffeelhfetuddvkeffnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheptghhrghnghhqihhnghdrlhhiseifihhnughrihhvvghrrdgtohhmpdhrtghpt
 hhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 12:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215366

On Wed Apr 23, 2025 at 12:23 PM CEST, Changqing Li wrote:
>
> Hi,
>
> I cannot reproduce this locally,=C2=A0 in my local env,=C2=A0 buildpaths =
is=20
> removed by function remove_build_host_references.
>

It can be reproduced using
https://web.git.yoctoproject.org/poky-ci-archive/tag/?h=3Dautobuilder.yocto=
project.org/valkyrie/a-full-1436,
using default config and trying to build icu.

But the issue is actually on my side: as the patch name changed, I did
not make the link with the v2, so this branch contains both v2 and v3.
If I drop v2, it works correctly with the simple reproduce process
described above.

I will try to integrate the v3 correctly in one of my next builds, to
confirm everything is fine.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


