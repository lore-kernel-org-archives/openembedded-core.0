Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0853C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 12:09:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.84724.1749557380158120649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 05:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hKwm7zmh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09002439F5;
	Tue, 10 Jun 2025 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749557378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiLVTTUujPmzFrabgraV34e6/MboHVTX0Q2s3HeeMgw=;
	b=hKwm7zmhheKxrYds31sX1+XIfV8Y//ggVmPNDDYWXm0ewH4a9OmQcBZ8ubpx3VWmddQBJX
	ueOmMcH/Noy2fAk2SGgWfFdyew0uKXZQa8lIxpZIBfEAOzeh4b5MQKClUP7vUWsP4Q5al4
	DabbRbweuPgHDzLXSIz+4mYZo2chy1s/ZqlHoa7eznqAbAikVuqOFjZpgdOdeVG2t6mxjc
	+iYfdNIn99Lno2bSAdhWxNjJdckfDls4f55AD5ynyvvf8yuZw8Td/lxvLlB8kPLYZfNrE+
	ssXadGhT9cVYFqBnOqK0hyXAsOa8whU+h6XKwmMvTbmCTlTJ5oumGRME01eFfA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 14:09:37 +0200
Message-Id: <DAIUBVF7DA8F.3244Y9H8MD9LO@bootlin.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/sanity: add test case for the
 recipe-naming sanity check
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250610104115.2291973-1-ross.burton@arm.com>
In-Reply-To: <20250610104115.2291973-1-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvedvvdfhheegtefgheetjeeuvdeiveefhefhieekheefvdejleelteejiefgteeinecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegvugegfeemgegtgeeimeelkeegtgemudgstddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemvggugeefmeegtgegieemleekgegtmedusgdtuddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvu
 gguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218348

On Tue Jun 10, 2025 at 12:41 PM CEST, Ross Burton via lists.openembedded.or=
g wrote:
> Add a pair of test recipes to meta-selftest, and a new test module to
> collect test cases for the recipe_qa/package_qa checks.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

We get this error:

ERROR: recipename-test-native-1.0-r0 do_recipe_qa: QA Issue: Recipe recipen=
ame-test-native appears native but is not, should inherit native [recipe-na=
ming]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1775


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


