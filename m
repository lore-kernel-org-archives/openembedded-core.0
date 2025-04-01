Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED0BC36008
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 07:43:50 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.13687.1743493421278944639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 00:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AZ2fg/bm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBB00442A9;
	Tue,  1 Apr 2025 07:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743493419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJv1w1s4I1i6LqOFS7AiUmQq6udykEHsr9r/+Y3NSLM=;
	b=AZ2fg/bm6xA/uGzn5WfCY0Rq7lHOoOUcm8Kaui//TeCcFDmEThfOD4cvyHlFBIkmDnwYMp
	7zMFwekGryOHfSRMXjhUKhhDuU/Z9JAB28eKvwP1etdScf2uPSEBZbYCxyzhWDcTrS6APx
	eYlCi/LChnejS0+KA12i6U4KAcv5yKPZQy15yUJyT45j9HwesIydesKrvfiXcKVrZdSyQj
	/AUeoG5KyZYoLUo1fcRqGkoEpIfplYQKw/397j21+MNC5xF0HEPWHZ+gEN8EeC7lLc840x
	bBPD3KjXH6ERq6vc7c0F/CUuJ0rycmMbikFRz3df++5ItpJpM35lFVYikc7nsQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 09:43:38 +0200
Message-Id: <D8V4U36CUJ05.25YQVY5IL20VE@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "jan vermaete" <jan.vermaete@gmail.com>
Subject: Re: [OE-core] [PATCH] python3-exhale: new recipe (0.3.7)
Cc: <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250330130052.2664988-1-jan.vermaete@gmail.com>
 <D8UAZCO62KTS.2SUM8QYTTL1WF@bootlin.com>
 <CABF_=yhPD7WnLUhHrcx=b0ixH4K4BwuRKO5qvxwsLzSX0NupuQ@mail.gmail.com>
In-Reply-To: <CABF_=yhPD7WnLUhHrcx=b0ixH4K4BwuRKO5qvxwsLzSX0NupuQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehvedtkeffueelheektddvjefhiefhgedtudevgeehvdevlefgveetkeevleelteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhgrnhdrvhgvrhhmrggvthgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrv
 geslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 07:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214006

On Mon Mar 31, 2025 at 7:15 PM CEST, jan vermaete wrote:
> Hi Mathieu,
>
> This patch should not be applied to oe-core.  I corrected this later,
> thanks to the remarks in the mailing list, to meta-openembedded.
> Or is this warning from the patch applied to meta-openembedded and
> should those recipes be added to the maintainers.inc file of meta-oe?
>

Hi,

No this warning was from applying it on oe-core. So no problem if this
patch is for meta-openembedded.


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


