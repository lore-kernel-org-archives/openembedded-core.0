Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4BAEB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 14:20:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.9473.1689603640921993909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 07:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GTOvvAcU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C91B91BF20C;
	Mon, 17 Jul 2023 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689603639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vKaWQ6aiCC1alP+MOKRc2ptzgGIBvPFAReWN3qneoJI=;
	b=GTOvvAcUK7YX8laj/T1Hd/rbpkTmyqd6jjHYJiYIOnH+gxgDgXn/08cpFobOuHG5qp/qBi
	YoxrL16Su5NVnzVI5KEcoxvb4V9I3cOtXMq+QtLnxlwfokiGXxz5AuiPQ+jcmIGOdBNqJS
	WeiLxSFm1O8y96gEsZ/qbAXDffVxrooCppRSQrcBmDRZCt9t9PLrH1US2UFLxm7okMFJS8
	kfjXTeOq6E813R32OYirNW4VujvrHA5rHuwMPY5+/osEhs94eORDJLjorPhtpfrkRSFmUU
	ORoRP1xBM4k2wy5EGCNs8CQDiK/DCnQbTiUWwLsG02Vi6tGdJid4I+nN8uE8PQ==
Date: Mon, 17 Jul 2023 16:20:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Heiko <heiko.thole@entwicklung.eq-3.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] wic: Add dependencies for erofs-utils
Message-ID: <20230717142038b0940de6@mail.local>
References: <202307171349425149c051@mail.local>
 <17172.1689602142772444612@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17172.1689602142772444612@lists.openembedded.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 14:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184470

On 17/07/2023 06:55:42-0700, Heiko wrote:
> Hello Alexandre,
> 
> I know. The patch is based on it.
> 
> I asked to cherrypick it. But Steve told me ( https://lists.openembedded.org/g/openembedded-core/message/184140 ) , that I should create a new patch.
> 

Please mark it for kirkstone then

> Bye,
> Heiko

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184468): https://lists.openembedded.org/g/openembedded-core/message/184468
> Mute This Topic: https://lists.openembedded.org/mt/100189195/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

