Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11235ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 09:04:25 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.34932.1661504663507667561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 02:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CPRI2Vx4;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1885E200009;
	Fri, 26 Aug 2022 09:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661504661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ikUKjNocTPJdwJ9kdMM1AyqOd2Zsld+FzvX+k+k/qCE=;
	b=CPRI2Vx4QqqofnGHWQbpj24TN+3PtWQlCYKLqM7+w76WAlCbf1Zij2Et2JFjvn49lwvNcb
	6pnL6fnjiXGDbrIQp890IQgjxLTtBdecy49PBB6aVrbTXWE+qyZ7X82gnn7bu6zb05azCu
	GoepdDZgIZSVoEyOcLSEmtoe3F+3y9FSPOF4nVRVPpA+2dwz5uxWxmjERQpYmmxKJTBwIf
	HHQJmzJR3pCVB+rCZL2sq1QbryNxu1pFt6ZIRFtg5AWgSpxTwDvngMGSbujjM/7BpS71Q3
	QpA58zoqC81vqKzk+jxX9xKBueB8L8zs1AYmcFJUSCCB+sZg14uFr/1+WePrDg==
Date: Fri, 26 Aug 2022 11:04:19 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 1/2] meta/conf: move default configuration
 templates into meta/conf/templates/default
Message-ID: <20220826110419.6039ccd4@booty>
In-Reply-To: 
 <CANNYZj_HRzuszmzkT0vU8rQ7sxvp8m_kLQUfQqPbCMWT_tdFxA@mail.gmail.com>
References: <20220824124234.3549247-1-alex@linutronix.de>
	<20220825153712.55f446b1@booty>
	<CANNYZj_HRzuszmzkT0vU8rQ7sxvp8m_kLQUfQqPbCMWT_tdFxA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 09:04:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169904

Hi Alex,

On Thu, 25 Aug 2022 15:45:21 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> I've sent a separate patch for meta-yocto to poky@ list, does that help?

Oops, I can't find any such patch in the poky@ list.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

