Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF196C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 13:45:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8697.1743601540075376378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 06:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OIEoHYDC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D5294326A;
	Wed,  2 Apr 2025 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743601538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hjUnX3FSOIOr5rawlBeCCfZ4gFVl9b6mTIdvCPt/W3E=;
	b=OIEoHYDCWf9f0FfS8fWobFUpd/g3YvatRLwf3Ng0Mz6Wd6Aa/u5cGfPIgfG8XFZGcU+ka+
	dUs5e2RwlWDw1NaWsRJYiKO3jDAO6o7VLRFNgayraLfgEPgsH1eXtlSM0YMq3jwIJZXh2X
	rieUdjL9cqaT/W7YR6tcX1ub990wnO3wH1VQVBr9ODrWoZUfM8lxiWKDco6FQjmsjK5bO8
	5uH94EcnRWZv6B7Hm80mem4vaVlHoHJZ5ZgWa6dVzgcQTiYZcsO6nUNNbf1TfbTPigcryq
	i/5ok1xxt1QZ6e2Az3htYzDumr90k7vROoF4qPprHBclacyfkOlyd7GLVm+Ifw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Apr 2025 15:45:36 +0200
Message-Id: <D8W75RR7HN8B.LDDI93NM4URS@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 45/48] shaderc: upgrade 2024.3 -> 2025.1
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
 <20250402071017.2157620-45-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250402071017.2157620-45-richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudeiiefhkedtjeejheeiledviefgudeiudduheejgedtgedugedvleehheevieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgihhthhhusgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfo
 hhunhgurghtihhonhdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 13:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214264

On Wed Apr 2, 2025 at 9:10 AM CEST, Richard Purdie via lists.openembedded.o=
rg wrote:
> Add tag to SRC_URI to verify SRCREV.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

Hi Richard,

It looks like we have a revision error:

ERROR: shaderc-native-2025.1-r0 do_unpack: Bitbake Fetcher Error: FetchErro=
r("The revision the git tag 'v2025.1' resolved to didn't match the SRCREV i=
n use (0968768c61d4eb7dd861114412e904bb3d59b7b6 vs 7f68b1cf6f35f518febf36d4=
25365bb8e6ad224a)", 'git://github.com/google/shaderc.git;protocol=3Dhttps;b=
ranch=3Dmain;tag=3Dv2025.1')

Appears in a lot of builders:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1322
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1360
https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/1321
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1336
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1298
...

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


