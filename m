Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2883C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 08:00:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.4158.1653465620609554214
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 01:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S+yi8gGr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0C543240006;
	Wed, 25 May 2022 08:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653465618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l5OMdwdZFnSAKDRjKt6qkxLU02DU6V6oPuZXZ3qSxEg=;
	b=S+yi8gGrS8r1PQ9P8czdCqshweK7QvARcu9hsHopFJI4dRWo9xiQcxmp39ZLFv5i1Gpjkr
	q2QZJucawKJHjrrFmVIFEnFKfJgbTbpsIZAJWpEsOWRtS/Se05uX4WKGm7cnA0XiGSSkqY
	1gdKQOV6ys9pb30Z6rLKQCY8iAR9B6fcuUunxoKsSLRBxckUmDyjkC3ZP46GyOeoAHbRmC
	V4m3uY0AeqKdkMsAYoo7OO5dboF9ULxnG9Syha9iclRRyL0yYdy+UdCMie4oG+0CQ65+r6
	AqiZ6LZ9cgc3MTGABwK/UjFwc0R4429bk8lFQ9wy3uxv2ZK27KsZs9jvXtPxAA==
Date: Wed, 25 May 2022 10:00:02 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Ross Burton" <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH 1/9] lzo: Add further info to a patch
Message-ID: <20220525100002.7d702096@melee>
In-Reply-To: <20220524152401.1663317-1-ross.burton@arm.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 08:00:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166105

Hi Richard,

Il giorno Tue, 24 May 2022 16:23:53 +0100
"Ross Burton" <ross.burton@arm.com> ha scritto:

> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Add some further info to the patch based on upsream changes. Given

s/upsream/upstream/

Fixing it in my master-next branch.


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

