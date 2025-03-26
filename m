Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAFCC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 10:13:28 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.18735.1742984006929121109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 03:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d6eVzfPJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD18A432E9;
	Wed, 26 Mar 2025 10:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742984005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmOXQ2OfViHW0ztyG/nM7dHcUqokhZMd9KYuy/psT0U=;
	b=d6eVzfPJew4pjj4XHMZufB7XQya3hzdOrA8ahBAfI7N0cBcjfNYJdCZFjm5HwguJz7OEKS
	MFvtL5oNlz+c5OYh/0mByntz2Io35b652jH1fkAl0xcBtl1B1hrXxc5H1ebw3uiS2fnLs3
	O5UR27pJ2kquGmOjCsTkinMwqnQq8s90dizEcAZUBJzXcsRkeXFEfUDtIteVrxjqsrGeMT
	7roThm/nctoHgXHT95Tjx8fzo5hOlhaKgY+o6utKrFI8EiE4MyKJste7p16MX9+VCfq6GQ
	qVKJcTXjMOt+d1c0u2535GbV8/yb79T8UbfcrIyhdKkXT3JbnCl6/yOU4aEKPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Mar 2025 11:13:24 +0100
Message-Id: <D8Q49HQ6S5QG.24PEZPQAB8PJD@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Mingyu
 Wang (Fujitsu)" <wangmy@fujitsu.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2] dnf: upgrade 4.22.0 -> 4.23.0
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <1742439740-18703-1-git-send-email-wangmy@fujitsu.com>
 <D8KXQ6QPGOL6.1VKUBIEENIJYU@bootlin.com>
 <TYWPR01MB11861D6EC6DC97514BE5AADF9DCA62@TYWPR01MB11861.jpnprd01.prod.outlook.com> <D8Q47HYAALIV.1Q4AZO2V3RPZ1@bootlin.com>
In-Reply-To: <D8Q47HYAALIV.1Q4AZO2V3RPZ1@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeggfehgfegjeefvdefleffkefhleekveeffeffteevhfetueelhfekgfeijefhnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopeifrghnghhmhiesfhhujhhithhsuhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 10:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213644

On Wed Mar 26, 2025 at 11:10 AM CET, Mathieu Dubois-Briand wrote:
> On Wed Mar 26, 2025 at 2:45 AM CET, Mingyu Wang (Fujitsu) wrote:
> > After compiling the image, I did not encounter such an issue, so could =
you please tell me how to reproduce this problem?
> >
> >   --
> > Best Regards
> > ---------------------------------------------------
>
> Hi,
>
> Here is a reproducer sequence:
>
> git clone ssh://git@push.yoctoproject.org/poky-ci-archive -b autobuilder.=
yoctoproject.org/valkyrie/a-full-1229
> . ./poky-ci-archive/oe-init-build-env
> bitbake core-image-minimal
>

Sorry, you probably cannot fetch from this git, but you can instead use:

git clone git://git.yoctoproject.org/poky-ci-archive -b autobuilder.yoctopr=
oject.org/valkyrie/a-full-1229

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


