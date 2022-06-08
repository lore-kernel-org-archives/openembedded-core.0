Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CB7C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 07:57:37 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.4020.1654675055706014863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 00:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b5MqIKuq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B8F8DFF817;
	Wed,  8 Jun 2022 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654675053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cjvv+OSNCLv/H22rkmYqhcNNMq0cre5QuYj6u0/Wwvo=;
	b=b5MqIKuqKeR4ijbJmu+tpmVj61Cfq6ZLHUl6ZYCbEJmHnfOgT3yti6ZzJYmkqac1KabjAQ
	jJ3Qxd8mGVbPn+KspY6TxnkgO/OqbWnmCSl280GYuAPMkDd5AJ8z7nBKavrd73Yc3Dq1DL
	w8J/UczYZgPjKV+G8iN1CasxyML1tTW8ab8p36f6tWpcxaZw75TDhZ1D7FfPSSPNLoiKnQ
	t5LSpm37UanWcxQj+mlM8OcR2zqMe1g+VJjleHMI4sL7Ca+WVWr8ifjly5gjUPviTFgnwy
	MvESqmJ4rhYHGrDD/8/AeUdzXJ030v+BB0AR9ospZR+lL5nEaqxz09fuRQ/Kmw==
Date: Wed, 8 Jun 2022 09:57:31 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Marcel Ziswiler" <marcel@ziswiler.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH v2] gstreamer1.0-plugins-bad: add libavtp
 packageconfig
Message-ID: <20220608095731.2b046446@booty>
In-Reply-To: <523055072271ae397582baf881e279ee2268e5d3.camel@ziswiler.com>
References: <20220531213624.7414-1-marcel@ziswiler.com>
	<523055072271ae397582baf881e279ee2268e5d3.camel@ziswiler.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 07:57:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166696

Hi Marcel,

On Wed, 08 Jun 2022 09:07:17 +0200
"Marcel Ziswiler" <marcel@ziswiler.com> wrote:

> On Tue, 2022-05-31 at 23:36 +0200, Marcel Ziswiler wrote:
> > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > 
> > Add avtp resp. libavtp PACKAGECONFIG. This allows building them
> > GStreamer Audio Video Transport Protocol (AVTP) Plugins which rely on
> > Avnu's libavtp.  
> 
> Gentle ping on this one now with the other two related patches having been pulled to master [1] resp. meta-
> openembedded/master-next [2].

Good news, this patch is on master since yesterday! :)

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

