Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD3CC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 08:03:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.4276.1653465806447858160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 01:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Iv1Dm7yi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E8EFCFF814;
	Wed, 25 May 2022 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653465804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UNTW/375iN5D1+4keCKFsWMtyuDyJI9iWp1tJu+cyho=;
	b=Iv1Dm7yiQ9IT8+gfSPGEX3c3oBs2+2kWxvwyApVxSG7OKcbogn0shwURFQNYSiAT+WeHF/
	vMs2ChP/9JZdc425ykWRgQg68J+2CB3e2ENWIAZB5XrTqoXkO2xP4kXurizTMyJeSJ0Pqc
	VfgJ5O168BQTyq3x8s6JQzSOi1j0zU1bpRVOwJO7Xv7wU46qgQOJmFBmqXgBSVwvNaEAJu
	sAe8cCzTgkZTmq8fedlbsuVaOlTUMKAdAs3yYJo6dvE1WVhSzrBsdnXixVgDEWrXHMe4rq
	CbsreXTBC10+9hV296Vg2cIYmuXjUw6E7iqxQHQogyudc4MkpwVIDoNpTdsdFQ==
Date: Wed, 25 May 2022 10:03:22 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Ross Burton" <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com,
 bruce.ashfield@gmail.com
Subject: Re: [OE-core] [PATCH 9/9] lzo: remove recipe from oe-core
Message-ID: <20220525100322.1a50d726@melee>
In-Reply-To: <20220524152401.1663317-9-ross.burton@arm.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
	<20220524152401.1663317-9-ross.burton@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 08:03:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166106

Hi Ross, Bruce,

Il giorno Tue, 24 May 2022 16:24:01 +0100
"Ross Burton" <ross.burton@arm.com> ha scritto:

> LZO is a fairly archaic compression format that hasn't been updated
> since 2017.  It's now unused by anything else in oe-core, so remove
> the recipes.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

I love removals of archaic features...

...and how they make things explode :-)

stdio: ERROR: Nothing PROVIDES 'lzo' (but
/home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recipes-extended/xen/xen_4.16.bb,
/home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recipes-extended/xen/xen-tools_4.16.bb
DEPENDS on or otherwise requires it)

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/124/steps/13/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/124/steps/13/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

