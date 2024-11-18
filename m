Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8A0D49206
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:52:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.36957.1731923533972203545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZWNbK/Mw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 025E3E0003;
	Mon, 18 Nov 2024 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731923532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lWg9IBqpUuyU6lhhbI+oyUN9xflMZoXJI3hzhlNOB14=;
	b=ZWNbK/MwZsQxF4p5uXPVcNBfU9262+Egjm+3bT6W6NMJ/zZP8BbdnMb+tcRJE9zD1AOAAF
	YVEGBNmQwB/3Xlkfol2iTJP7wF8Y3K9Ba5MvcSlO5UICjMk/D+TbzuK14/yMS9F27skhyS
	ii/ft6qeEpIQyYy/hgRHXDmc5kr8ZqdLRxTPluI9dUEL0jp1SV2sbnST92oqC7Y3Fu+LrR
	ay3OafISuu7/KH712VNoU0EUBxWnP6M7c8uV6Rk8s+1w/5lTX1Aj/g6nMN1d3E0Wvzzy/p
	Ex+CQuQyfFaKz87S04wOzJvsBs9vqrmRyjcEgDP/tu4XtHgf/Wjyyu+vJfegJQ==
Date: Mon, 18 Nov 2024 10:52:10 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 09/47] gstreamer1.0: upgrade 1.24.6 -> 1.24.9
Message-ID: <ZzsOSrvcBQ5wPBV0@bootlin-mathieu>
Mail-Followup-To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
 <1731403483-21399-9-git-send-email-wangmy@fujitsu.com>
 <ZzniaXn03tyV--Q0@bootlin-mathieu>
 <TYWPR01MB1186175142EB976387393680FDC272@TYWPR01MB11861.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYWPR01MB1186175142EB976387393680FDC272@TYWPR01MB11861.jpnprd01.prod.outlook.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 09:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207213

On Mon, Nov 18, 2024 at 09:03:17AM +0000, Mingyu Wang (Fujitsu) wrote:
> I set arch to x86_64 and no error occurred when compiling image.
> Is there any other setting for this issue to occur?
> 

Did you also remove x11 from distro features ?
DISTRO_FEATURES:remove = 'x11'

Specific configuration fragments for this build should all be here:
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n1168

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

