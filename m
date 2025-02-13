Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7DAC021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 13:36:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.11031.1739453808706160948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 05:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NabgymAY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00B9543311;
	Thu, 13 Feb 2025 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739453807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWQkD8JgEcVzfxP8QSFOO8rLNXd3/e3iJVyaNMuh30A=;
	b=NabgymAYBs8Ssxo2KCDoV8DKz4FPUDU64/yhK38sPekBA4H3bldCy8cLJif/uUb4jgUXch
	w8zi1ajo34Q7HfBi58oPMUieap3Y5Bszr+OWyf2GYLQCRtgXdXdWTSRyp+vHfqhSTmornT
	5ZSj0LCyBdjMifrY7QEagPeFRdXqMWJ7dZwPjrHFvs64oNzv9GPgcwA6wDRUrhY0nna3a0
	NAjKW4sunRWmfr19ujJim4YxGlC3KtP26ydg9k2gr+P+cq5hKjXYoh+pYOpZpMHdXcANwo
	fkJ65/XaCZOfUqQWwJfRL/KiGoiPrT6aH6bBEbUALYJaAIXAJMvgJh9xQP+oWg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Feb 2025 14:36:45 +0100
Message-Id: <D7RCWUM2L2UY.1XEGKH8ENRDW0@bootlin.com>
To: =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v12 1/5] rpm-sequoia-crypto-policy: New recipe
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Randy MacLeod"
 <randy.macleod@windriver.com>, "Khem Raj" <raj.khem@gmail.com>, "Richard
 Purdie" <richard.purdie@linuxfoundation.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250212043532.1258912-1-zboszor@gmail.com>
In-Reply-To: <20250212043532.1258912-1-zboszor@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleettefgfffhfedvvddvgefhleelgeffffevfeehueekvdevkeehkedtvdevkeejnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepiigsohhsiihorhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvm
 hgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehrrghnugihrdhmrggtlhgvohguseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 13:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211331

On Wed Feb 12, 2025 at 5:35 AM CET, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi =
wrote:
> This ships a crypto policy file for rpm-sequoia.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---

Hi Zolt=C3=A1n,

I believe we have a new issue with this version:

| python/build-crypto-policies.py --reloadcmds policies output
| /tmp/tmpqvyryz80: line 5: Bad configuration option: pubkeyacceptedalgorit=
hms
| /tmp/tmpqvyryz80: line 6: Bad configuration option: hostbasedacceptedalgo=
rithms
| /tmp/tmpqvyryz80: line 8: Bad configuration option: requiredrsasize
| /tmp/tmpqvyryz80: terminating, 3 bad configuration options
| There is an error in OpenSSH server generated policy

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/builds/1027/ste=
ps/11/logs/stdio

Can you have a look at this error please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


