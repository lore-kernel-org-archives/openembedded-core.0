Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2233EC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 11:00:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.6313.1741690803753092563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 04:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gFsJ5Y/u;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C1DE432BB;
	Tue, 11 Mar 2025 11:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741690801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xxsj106mLjSf86toLM92AejVq0yMqicK9S3/a12HeaQ=;
	b=gFsJ5Y/upomjTk/V0R3jHXkEH16xoGBOUtHMZDrz6viCfyI2m8azubzfhMfqobFlqAMhTB
	H5KFDPtV0MCQnjpsaX0qA8NPGlcOZ0U02aOmWOUy3OmjUl7nz/oPOgi9cwHuxvs07iF3oA
	dBGvCi87q0GmT3zh1qP4/3fMUxO5WRyQI7dWPkhap3uyCq7vc8uFgWRjXT3MIr5y0JpWYx
	5CkUnBy2y9qC/zHwEGG4HFSS5CunCE756UVjGMVl4xTpZYOu85R3WDWC6OMuU9QHdEr44g
	Eirhy3lEWl3kJEtMUXyyjIFDfFOMJs7R0aQ1XatcOWJuD8MR58ZiIceOFOWV6Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Mar 2025 12:00:01 +0100
Message-Id: <D8DDV08P0OY1.2DFW4R71EYW40@bootlin.com>
To: <ross.burton@arm.com>, "openembedded-core"
 <openembedded-core@lists.openembedded.org>, "openembedded-architecture"
 <openembedded-architecture@lists.openembedded.org>
Subject: Re: [OE-core] Future of CVE scanning in Yocto
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <7D6E419E-A7AE-4324-966C-3552C586E452@arm.com>
In-Reply-To: <7D6E419E-A7AE-4324-966C-3552C586E452@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfdvhefgtdelhedvteekheeiheehfedvkedtfedvfefhveethffggeehuddtgfenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpv
 ghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgrrhgthhhithgvtghtuhhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 11:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212559

Hi Ross,

On Fri Mar 7, 2025 at 3:36 PM CET, Ross Burton via lists.openembedded.org w=
rote:
[...]
> tl;dr:  I propose:
> - For the upcoming (April 2025) release we should add to the release note=
s that we=E2=80=99re aware that NVD is struggling, this is what our CVE too=
ling is based on, and we=E2=80=99re working on a solution for the October 2=
025 release.

I've tried to summarize and add the known issue to the release note here:
https://lists.yoctoproject.org/g/docs/message/6530

Is there a bug associated to this? I could add it to the release note for p=
eople
to track the progress on this.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

