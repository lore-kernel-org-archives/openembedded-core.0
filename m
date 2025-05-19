Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20228C3DA6D
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 05:03:41 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.44239.1747631011435295497
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 22:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VIcMWUEE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9258D43B42;
	Mon, 19 May 2025 05:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747631009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S0VPi7B5cp1AHkQkASYEO+GC3JS9yepDAA6QB95MPZs=;
	b=VIcMWUEEIkMsmFeKew+kcwcFDawPjP5KzMXbYJ7zKk1QvknbKLb3BPUqWAL3GzEhBYJ2JN
	EmAjJeI3DIVerf2U1UKYWs5hohiieH/RxeYcDuc0pcmzDrUjjk4OjzC2yh0cr+bGZ4ZTyx
	7VM/Iz3qjQxyIPY4nDZX6GAkiezdFgdzwPi8xcAaoC47Im6fWXgZgkWnNnyJPSrlbTWHmw
	vqVEBYTFnrEj04JG207ASHA/oblv0oIyjUWZcs7T0olj67Z03UpNE3QVvvajkdAcCLEYDh
	HeQsX228+KXd7pCjf+6792nk/PuNXMvaYLxtYTZpmZIx/F6uts8aG2CA2mPaig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 07:03:24 +0200
Message-Id: <D9ZVHK6V016R.29ET8S1G92K4P@bootlin.com>
Subject: Re: [OE-core] [PATCH] libcap: upgrade 2.75 -> 2.76
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <yi.zhao@eng.windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250517125024.38239-1-yi.zhao@windriver.com>
In-Reply-To: <20250517125024.38239-1-yi.zhao@windriver.com>
X-GND-State: clean
X-GND-Score: 49
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddthedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeefgfdvvdeuffejleeigfevffekteefkeehjeejjeeliedtieekffekuefghefhnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhoohhglhgvrdgtohhmpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemfhgrvddvmeeghegufeemkeeijeehmeehrgehjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmehfrgdvvdemgeehugefmeekieejheemhegrheejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohephihirdiih
 hgrohesvghnghdrfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 05:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216816

On Sat May 17, 2025 at 2:50 PM CEST, Yi Zhao via lists.openembedded.org wro=
te:
> ChangeLog:
> https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.wqn=
p1zp1o8bm
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---

Hi,

Thanks for your patch.

Does it builds correctly on your side? It looks like we have issues when
applying patches on the autobuilder:

---
ERROR: nativesdk-libcap-2.76-r0 do_patch: QA Issue: Fuzz detected:

Applying patch 0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.pa=
tch
patching file libcap/execable.h
Hunk #1 succeeded at 34 with fuzz 2 (offset 11 lines).


The context lines in the patches can be updated with devtool:

    devtool modify nativesdk-libcap
    devtool finish --force-patch-refresh nativesdk-libcap <layer_path>

Don't forget to review changes done by devtool!

Patch log indicates that patches do not apply cleanly. [patch-fuzz]
---

https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/1661

Can you fix this in your patch please?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


