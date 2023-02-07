Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4733C636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 10:35:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.80408.1675766102276578677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 02:35:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Cacqz7pu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9F643240009;
	Tue,  7 Feb 2023 10:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675766100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ird1szeh2oeE1ggQZklIjWb2rRS+rd1fsVeWmvbIW84=;
	b=Cacqz7puCrRMInopnBtG879uc40YBhfmqY/gHV6ZGxXPMlZyQ9NUB2IS+segm0WhPlVUtT
	L+7dfq+dWPXiHj4G6XdScbwhLOrWBf7fK9Yo0ry+MwxnTVqceEuEJjs6Of/SqLb/aYCNTS
	cPTFJ78DRZm8/t3oRRTRXg5AssF3K2h4PZcg+1XNnt+qYOd7ORHSJlfdfDuCVZaIhJDA2e
	FJNerfXDkdVGcs8Vb8ThkUfUsp+lrMvHo6W/pSCmKz9XkwBSUsqwIxQ8OVNU5wkYNng5CX
	egWU4FndyRkHuiwnzee24DyaVY6Aa/swW/odW+52UxmSmxqQqcyLlqMkQsLvvw==
Date: Tue, 7 Feb 2023 11:34:57 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Liu, Haitao" <Haitao.Liu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] libgit: add ptest for libgit2
Message-ID: <20230207113457.02233fd9@booty>
In-Reply-To: <BY5PR11MB39448218D2A3A3EEF6AD6AD19FDB9@BY5PR11MB3944.namprd11.prod.outlook.com>
References: <20230206084401.2055798-1-haitao.liu@windriver.com>
	<20230207092859.63f15a0a@booty>
	<BY5PR11MB39448218D2A3A3EEF6AD6AD19FDB9@BY5PR11MB3944.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 10:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176811

Hi Haitao,

On Tue, 7 Feb 2023 09:11:31 +0000
"Liu, Haitao" <Haitao.Liu@windriver.com> wrote:

> HI Luca,
> 
> I have not encountered these failed ptests in my side.  Did you test it with qemu(runqemu) ?  Let's me check it again. 

Those tests have been executed by the yocto autobuilders and yes, they
use qemu.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

