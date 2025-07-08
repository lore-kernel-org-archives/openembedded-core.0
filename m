Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC21EC83F0A
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 12:37:43 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.17576.1751978262556379521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 05:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c2uWINPT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A77514397D;
	Tue,  8 Jul 2025 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751978261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aXK5Ht6frJDY2BvgxFK3XX34SPNnQdLfA3oUVgsL2E=;
	b=c2uWINPTg3f5QqU07UhOZVCODDsOWKWGEwU0k7p6hYMony/jbacMEY4FRbb9LU9EGQS/jK
	AdP2FX5nuBTdDg8OZE5briUh4edsqDGGAhepYo2OKqw86/0JqbYLQ3gyPwWDNdQgEv7zyj
	fp7KV1ELNNRqrFYJUrdthYDxqMKfci5D3iC4E2cmaJBTGtFETo3L+REdXIsZIS4VeuA/g/
	r44KA1FChy3JxDvVXFTxXDvZJd2sQazoAJKr8+jEXKvF6+UQgkrCaeeqav82AXzTSWOeZM
	qOxrD2ZNt/kcKpTldg60xuxlWzDvcp1sg09eDMK3bMVO3l/aPyE2RCIx02Mi3Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 14:37:40 +0200
Message-Id: <DB6OGLNWBEVN.2V2F24LHIZ4C4@bootlin.com>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2025.04 -> 2025.07
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <festevam@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250708012959.77522-1-festevam@gmail.com>
In-Reply-To: <20250708012959.77522-1-festevam@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefgeejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvedvvdfhheegtefgheetjeeuvdeiveefhefhieekheefvdejleelteejiefgteeinecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsv
 gguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 12:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220029

On Tue Jul 8, 2025 at 3:29 AM CEST, Fabio Estevam via lists.openembedded.or=
g wrote:
> Upgrade to U-Boot 2025.07.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Hi Fabio,

Thanks for your patch.

It looks like this is breaking selftests on the autobuilder:

2025-07-08 07:43:52,116 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_cascaded_uboot_fit_image (subunit.RemotedTestCase)
2025-07-08 07:43:52,118 - oe-selftest - INFO -  ... FAIL
...
ERROR: u-boot-1_2025.07-r0 do_compile: oe_runmake failed
...
| arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such fi=
le or directory


Both on debian and armhost:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1923
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2077

Can you have a look at these failures please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


