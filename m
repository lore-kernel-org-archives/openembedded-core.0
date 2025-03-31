Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A59C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:40:21 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.48138.1743414013476690072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ktZtBGkR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AF5A20489;
	Mon, 31 Mar 2025 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743414011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VFnDPMOx9Q5Dcr+L07kHecuSHWDrwkO5sXdwjjwPU4=;
	b=ktZtBGkRheH1xjgYW5gmwaQjQETjPCeCmMtVYMs3WUmGqeQW7X3Mw9w63E87NxbTY7Tkj+
	mjgeg838sGiLCGSRbWaq6ov6yq+3tnA5lmow0+cqzBqUQ+lVeeAlzTHnbLBRQIOKy7tmck
	eSwRuZ3/B7FSC5q3j7rOJ+lZ/F08NQDC0npipEQ/BC0oHF7qtPWQhZkCTfeZVfdtWpb+wB
	M0tsHdMK0LZgFryGbG3vRXG2e6KqW1ZFT9ZDKmCKB+0q/IbQfF8dhT+U8ZsfndCmdHYqg/
	69NBsKkhE03u4rQI0QJYGGcJVSVCxAi3GuCpULCR5tKwIV9tt1gPFcmatKT7yQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Mar 2025 11:40:11 +0200
Message-Id: <D8UCORYIOR2I.1Q2YNS35P7HHS@bootlin.com>
Subject: Re: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 ->
 1.26.0
Cc: "Anuj Mittal" <anuj.mittal@intel.com>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <leimaohui@fujitsu.com>, "Jose Quaresma" <quaresma.jose@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
In-Reply-To: <20250331064844.2155-1-leimaohui@fujitsu.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhheffhedvkeehiefhfefgteegffevhfdvlefghefhffefhfffkeettdeljeegteenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhordhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhgvihhmrghohhhuihesfhhujhhithhsuhdrtghom
 hdprhgtphhtthhopehquhgrrhgvshhmrgdrjhhoshgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnuhhjrdhmihhtthgrlhesihhnthgvlhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213958

On Mon Mar 31, 2025 at 8:48 AM CEST, leimaohui via lists.openembedded.org w=
rote:
> Disable new meson option dots_viewer
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---

Hi Lei,

Thanks for your patch.

It looks like we get some new ptest issues on gstreamer when building on
the autobuilder:

Failed ptests:
{'gstreamer1.0': ['gstreamer/elements_queue.test']}

More details about the ptests failures can be seen here:

https://valkyrie.yocto.io/pub/non-release/20250331-52/testresults/qemux86-6=
4-ptest/core-image-ptest-gstreamer1.0/

Can you have a look at these failures please?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


