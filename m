Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8D5C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 08:58:59 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.61489.1742893132453990388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 01:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PhFFI3yP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CE1844454;
	Tue, 25 Mar 2025 08:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742893130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yb8rj5XlRsIvQYt/VAE5GxsUKrWneTsIv8bsMGK8nwQ=;
	b=PhFFI3yPW9fwa5IVrLwKKl5HX7ly7iVQcmP7GZj+/J+gIji9v0LT7RW96uVMdkiTuuoVwM
	yjfxomnL9VUBRJcuQVYcsCE2gRS9AIdAjyFUJMwTVDwmSvuUNB2wI94G1bKWM0J80RHlEg
	cXTIxaDmTNGMNJk35ie04IpldidXmymj7jO1/xReJ1ioU+e5aNF/nowydlpGdW7znM7fDL
	zn9Y7k2O4Bm+SMDsj3xYqXSl9VjDNSLYpE/Zwl3R+zaSiDTBjWMN2uFpnmAOPh91EEC/sl
	/1RdK406h5Yn+a9bWXCZUNNBXxD4y5qE3DzhWGjckQMYMSQay8iM7qbBHworrw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Mar 2025 09:58:49 +0100
Message-Id: <D8P81UEBJTPA.3TVLG94CK2MIH@bootlin.com>
Subject: Re: [OE-core] [PATCH] meta/conf: Start to populate autobuilder
 config fragments
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.1-42-g7f7db0373f6c
References: <20250324170911.391159-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250324170911.391159-1-richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtteehueeffefhieduudefhfehhefhgeelkeeiheduudeuhedvheejueevgfejvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnv
 ghmsggvugguvggurdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 08:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213595

Hi Richard,

On Mon Mar 24, 2025 at 6:09 PM CET, Richard Purdie via lists.openembedded.o=
rg wrote:
[...]
> +SANITY_TESTED_DISTROS =3D ''

Will the recent 'removevars' addition from the helper's scripts/setup-confi=
g
still work after that change?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

