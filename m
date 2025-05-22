Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B02C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:25:19 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.22799.1747916711517931476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EQK8V2HO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B69B743A08;
	Thu, 22 May 2025 12:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747916709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJPQ3hm7Gu7qjk9WFI+b6xP9ar1n900vY8q5LcM3/jk=;
	b=EQK8V2HOPLeAs/ek7Jvyc83A2/TAd4RhDnotcc86Aq3ddemKtzqlFewLPTK7jMF5aKY/uF
	w9vs1tQ5+a6oTBSZ/LWZ3TCsVaGHk7tJP4FGpmn7my3wmIPxaem96FWgaufmFNobfiT9bu
	c6ZywZGZY9dgKzKe9tVdLaOeKDWUw6pKKXqLjrFAk4oJ+b2+4s/3gvZxaVkqCfl5m+5jAq
	bF3wTV/IiQ39qbGLt8tSZEm1t0wZpzSaBOWZHI9BIQYgACLxizMH/fKP2OwmCtBIe1VqGN
	dfOze27BQc9JRHmcIVu1HJ2OeM+1LYltDnBM7+NGrhVQzCwnJD0/Fgc1/YMn3g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 14:25:06 +0200
Message-Id: <DA2ORDMJAWTX.2XH4RND735F7C@bootlin.com>
Subject: Re: [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "Hongxu Jia"
 <hongxu.jia@windriver.com>, "alex.kanavin@gmail.com"
 <alex.kanavin@gmail.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250521080925.815334-1-hongxu.jia@windriver.com>
 <DA2H7Z2IQH15.8AQHUB50F8SB@bootlin.com>
 <AS1PR10MB5697E603603C2156BCF1DE5CFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM> <DA2KDA7L7YRZ.2I1CKTLPP29LZ@bootlin.com> <AS1PR10MB5697DC8D007471A68D8709ECFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697DC8D007471A68D8709ECFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehleehucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeuuedvleejhfdujeejleetjeehkeegfeehgfdufeeiueekudfhlefftdfhkeetnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopefrvghtvghrrdforghrkhhosehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohephhhonhhggihur
 dhjihgrseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217094

On Thu May 22, 2025 at 2:14 PM CEST, Peter Marko wrote:
>
> OK, I have updated my patch to .3 and sent to mailing list.
> Don't forget to pick the lttng-tools patch again with it...
>
> Peter
>

Thanks, I will take both patches for my next build.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


