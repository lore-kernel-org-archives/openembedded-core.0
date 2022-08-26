Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD65ECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 10:27:55 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.35540.1661509666856341447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jBncN1Cq;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 33775100002;
	Fri, 26 Aug 2022 10:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661509664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhPg6L7DqB/UiyuGcYD/CW1/vNZDasf1wUqMsrZ68qU=;
	b=jBncN1CqvelDvvFtYStuUi839JSuV2yiprq8kwi1CFhJYvk+cp1yEX9iAjfzqkzD6pcVae
	9Svk2vMrUld+rntfcrPFnV/RHn2L/jMQaWsxvTyLa1BrKXDfOEwSUUWekYu633s+fN/Vph
	t2B5h/JuetnPBEkOcbbBAfTLDkIjt5QNgjQrU58ymv77FeZ9/4jc1x11tdXjhkQv5Yb02v
	HQMSC9AGYVKriUHsaVgr6v2ltNwaPHGhFQmk2vJJjnGBK8Kd6jzrWOJenCneQZ8sBQf1cv
	1aGuKATrTljXBCWSvdh5oxJ8Tp5rR3UWC+kDJNNCLwPxsK2TroQm/pZngWoc8A==
Date: Fri, 26 Aug 2022 12:27:42 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 1/2] meta/conf: move default configuration
 templates into meta/conf/templates/default
Message-ID: <20220826122742.4c5e2e68@booty>
In-Reply-To: 
 <CANNYZj8yH_ZOVoH7=HRzzdnmcOfcA_RjwhYNSsMbH-+h6COihQ@mail.gmail.com>
References: <20220824124234.3549247-1-alex@linutronix.de>
	<20220825153712.55f446b1@booty>
	<CANNYZj_HRzuszmzkT0vU8rQ7sxvp8m_kLQUfQqPbCMWT_tdFxA@mail.gmail.com>
	<20220826110419.6039ccd4@booty>
	<CANNYZj8yH_ZOVoH7=HRzzdnmcOfcA_RjwhYNSsMbH-+h6COihQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 10:27:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169908

Hi Alex,

On Fri, 26 Aug 2022 11:08:15 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> On Fri, 26 Aug 2022 at 11:04, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > > I've sent a separate patch for meta-yocto to poky@ list, does that help?  
> >
> > Oops, I can't find any such patch in the poky@ list.  
> 
> This:
> https://lists.yoctoproject.org/g/poky/message/12870

Oh, no! I'm not receiving any poky@ emails anymore! The last I got is
from August 23. On the website my subscription seems OK, and there is
nothing in my spam folder. And, last but not least, the website does
not seem to allow downloading an email as an mbox file. :-(

I wrote to the help address.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

