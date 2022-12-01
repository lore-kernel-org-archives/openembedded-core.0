Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C165AC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 12:14:41 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.41454.1669896875387641341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 04:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ikVC+ww4;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DE193100004;
	Thu,  1 Dec 2022 12:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669896873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xe1zO/Ev5bk7BzX3dyWz++iI4a6mYP8Vhj101VaeUnk=;
	b=ikVC+ww4aMa5SZqpS0T4cwT922wNVlzr3R/DHEpATCnHCvv3d7/OPrGhIMrz4/PSAOEsgn
	T+c1wba5PSa0D8wiS5CBTUSa8R7OGXMczfqRSQXH0DlJka6NnDAuNDrCogyxfXcD8a2Fdf
	RbRbTPMS0/Pmb+MHTQLUqvaoJfQdW6C6kveU+lgGaEo30gI8Ei6ErHox8mKQWf86cQ+QAW
	VJFyv3FrDGl5PIewaCvdI7NwW9uU9mu0pnYLmN4wCyRwVN075yY8mGjy8XiaddIz7NI6hV
	y88TGwy9FMl7ctg7exHPDs3ARXfe1hz7sAUt7ZKRHL/2GG6K118mSh9wJKZsWQ==
Date: Thu, 1 Dec 2022 13:14:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: "pyih.soft@gmail.com" <pyih.soft@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes: make TOOLCHAIN more permissive for
 kernel
Message-ID: <Y4iaqGB8RkrBQYsX@mail.local>
References: <20221130162113.3731385-1-pyih.soft@gmail.com>
 <C5C61A1A-4E14-4D7F-97BA-B12C3FB15417@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C5C61A1A-4E14-4D7F-97BA-B12C3FB15417@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 12:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174053

On 01/12/2022 11:25:29+0000, Ross Burton wrote:
> On 30 Nov 2022, at 16:21, Alexey Smirnov via lists.openembedded.org <pyih.soft=gmail.com@lists.openembedded.org> wrote:
> > -TOOLCHAIN = "gcc"
> > +TOOLCHAIN ?= “gcc"
> 
> If the kernel is buildable with clang then the TOOLCHAIN statement should just be removed.
> 

It is buildable but the generated binary is not necessarily bootable,
depending on the architecture



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

