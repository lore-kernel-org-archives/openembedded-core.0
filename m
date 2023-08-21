Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9400EEE49A5
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 19:56:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.680.1692647798503642591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 12:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OkEh5u6H;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67BE840005;
	Mon, 21 Aug 2023 19:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692647796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bEEXtpsir6B/uY51bpQKBnvCVzkU0SM+TQa9naaMdk=;
	b=OkEh5u6Hv4RRToX3Ezl8ykow9JjF+bSRyBZb04bAGEYnfsaoMZVTazSSgj6diFybTAF9IN
	FdmRE6QFbIys0D/vbVbEW4bUXyguYQe4rH7Mo1Ip0THzPHcZ/Kk0vrQDPRZWcLfLpLCNuP
	57HLeDZh+tmaxiHWGR0r2g7NAmMq/t3TN0ksvN+gSc9Tu0V/VJHxNygJpAT5EJlV85+GrP
	/o2q3YPGRbBlQPb6gfVxjfo1SCNTYlnzo01nwo3BzYk5T9TIXv34A6oVDSk9IOZi8GVhni
	d/PfkYyI2gb2ebz2baMhY017Ad/qVFRIWGj5r9hT5hD03IkpsydrmRZSj83ACQ==
Date: Mon, 21 Aug 2023 21:56:34 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Adrian Freihofer" <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Adrian Freihofer
 <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH 02/14] build: vscode configuration
Message-ID: <20230821215634.349b3509@booty>
In-Reply-To: <20230821161120.171956-3-adrian.freihofer@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
	<20230821161120.171956-3-adrian.freihofer@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 19:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186482

Hello Adrian,

On Mon, 21 Aug 2023 18:07:05 +0200
"Adrian Freihofer" <adrian.freihofer@gmail.com> wrote:

> This is just my setup. It's not supposed to be merged into poky.

If this not supposed to me merged, clarifying that on the subject line
would be nice (e.g. add "**** DO NOT MERGE ****")  to not overlook that,
as well as moving this patch at the end of the series IMO.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

