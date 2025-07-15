Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F4DC83F21
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 14:10:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.9655.1752588649012974650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 07:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=icTAmkDw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE1034430E;
	Tue, 15 Jul 2025 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752588647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8oi1WI8vXzsJWKZoagPbkrUNLZYi3LWJio3T7g4OzKA=;
	b=icTAmkDwGrgxSwaOv54Mds+w6crAIzvfAyD/FLE2uisezzleVoCd6h6QYVc2C7CnN/oa5l
	XUCz6eCWQOBLh/zZGe/U5vJQmkgY+DRXqPHLu5MXli36cg6ms+AE3o8cXl6ImxZE0vM3/p
	vG0zd0I7IbTMnj2BmUrSIUUtCv5O0clhHz8A6AcMsqn+Qsw1AhxZfKCJkJLM8+w2eh7/Kx
	vIIAW/8AxmnoB0EY5OAF9Rni+tS8HA70JMylOpIDY4HZPQdQJSKTRUEA7RWRFbChmIR0dp
	N+R4FtqgpwDWmtmNeiI3DykL/QWPrNI2LANYkVfZUKI+yHqUAI8p0kzAGQkebA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 16:10:46 +0200
Message-Id: <DBCOTPCR7ZYN.21VJH1FTUH3WM@bootlin.com>
Subject: Re: [OE-core] [PATCH 18/19] u-boot: upgrade 2025.04 -> 2025.07
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <wangmy@fujitsu.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250715080819.622-1-wangmy@fujitsu.com>
 <20250715080819.622-18-wangmy@fujitsu.com>
 <07ce6170-7943-4470-808f-74d81d0a648f@gmail.com>
In-Reply-To: <07ce6170-7943-4470-808f-74d81d0a648f@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehhedtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvedvvdfhheegtefgheetjeeuvdeiveefhefhieekheefvdejleelteejiefgteeinecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehskhgrnhguihhgrhgruhhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfigrnhhgm
 hihsehfuhhjihhtshhurdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 14:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220296

On Tue Jul 15, 2025 at 11:08 AM CEST, Gyorgy Sarvari via lists.openembedded=
.org wrote:
> This patch looks identical to
> https://lists.openembedded.org/g/openembedded-core/message/220004 -
> however there are some build failures (see same thread)
>

Yes, I confirm build issues are still present:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/2048



--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


