Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2667C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 13:55:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.196602.1673963735097410946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 05:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FEf8/dPA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7DCA0C0002;
	Tue, 17 Jan 2023 13:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673963733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qwoVdJ8/J2906bjtTZECHR/8wDQLN97BbhHBw7hwqKE=;
	b=FEf8/dPArJJ1hp96ulK94zRoVy/GMPvRsB1/jt2Paei7Fy7GpzFU0iD56SIIuLvBbjvX7R
	djjiNQ+UKqdA7T/YGoncMACucPqzP+UiVqlwZuttiBbz94e7+cZ7qtR1rbiuwblIVqI37G
	rVGuQtsM2IZhJsAyoBXu1FhrkggqTStxTCuG9HwYs9O6Q2BNDfCFbiIaajcEBQn5Ef72+2
	uqqHoHABztGIXdPBDU3hKoQv8a5Js87iXWUZbw2j1rd6MUlbuWCFsSl2De1nMTbZ+vx4bl
	BgTrwFaJ74xHK9EtdPtz7Ix6NIQulkUmbEMiYMOw869pCTWqoBvwRdE8Fai6bw==
Date: Tue, 17 Jan 2023 14:55:31 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] binutils: Upgrade to 2.40 release
Message-ID: <20230117145531.3390cce0@booty>
In-Reply-To: <20230115184358.2276696-1-raj.khem@gmail.com>
References: <20230115184358.2276696-1-raj.khem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 13:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176037

Hi Khem,

On Sun, 15 Jan 2023 10:43:55 -0800
"Khem Raj" <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This patchset (perhaps this one specific patch) seems to be causing
failures on the autobuilders with meta-mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/6556/steps/16/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

