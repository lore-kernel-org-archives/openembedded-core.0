Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB4FC3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 07:42:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.3147.1746603742094951667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 00:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J6zQL3Y/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EA5443B46;
	Wed,  7 May 2025 07:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746603740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlpcQB/Z1agB0b7uq4vIsKB1FZhuUm1gXPoSmwnS1TM=;
	b=J6zQL3Y/Ok9fgk8U94QMl9w896wJYDLH2RCzg70OK5czM2oNDcuydvs2O7qv1p2lm5WPwe
	3l1SxNP5SK/otgy+mshPDWLOrkoBxohIIIseewyQFlnaWKwUNqXmUDttd2b3GdcOHmJ5ij
	WPidi6AIsilF38obpNr6On+l91E1LsVpdZSY3H2Y9MJv1J0riwjRZJxJ/Jdd7Q4idzH1xZ
	hHE2G6Nnxn4doz4H+mADp1ScCEs/tYkLK9UNKGwd6K6mNmwvyZtKdf97AgMVoqV3TieHST
	oPEV5z3XqhamzNAxC1929ML/DCaxgNJfRlPsKuzIBFV+85Tv33bWQ9wrC6X83g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 09:42:19 +0200
Message-Id: <D9PRCP2WLN68.1VIO3IX3SQ7IH@bootlin.com>
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/6] kernel-yocto: consolidated pull request
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1746548780.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1746548780.git.bruce.ashfield@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkfevhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheehveeggfdvgefhgfehieetvddvfedtleehheffvdetteekheegtedutdfhvdehnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsrhhutggvrdgrshhhfhhivghlugesghhmrghilhdrtghomhdprhgtphhtthhopehri
 hgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 07:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216095

On Tue May 6, 2025 at 6:32 PM CEST, Bruce Ashfield via lists.openembedded.o=
rg wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Hi Richard,
>
> Now that I'm back at my desk, here are the queued -stable, configuration
> and feature changes that I have queued.
>
> I'll be sending -stable updates to the LTS branches as well.
>
> Note: once patch #1 is in the tree and doesn't need any more tweaks, I'll
> send a documenation update. This is the patch that we need to enable the
> modular initrd work in kernel-yocto references.
>
> Cheers,
>
> Bruce
>

Hi Bruce,

I took this series in my branch and everything seems to be fine so far,
except for a warning:

WARNING: linux-yocto-tiny-6.12.27+git-r0 do_kernel_configcheck: [kernel con=
fig]: specified values did not make it into the kernel's final configuratio=
n:

    [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (y) and .config val (n) =
do not match
    [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n

https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/1565

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


