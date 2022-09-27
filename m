Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31892C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:50:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.9086.1664272224566133880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DEw0hy2C;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3BB80FF809;
	Tue, 27 Sep 2022 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664272222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gjNpUWnlIUHuiBom/Ibu/UVJxxwc+lFCfHi0XqdAbBc=;
	b=DEw0hy2Cdq08vZFWbcSSHwDZKZe5v0Yy7k1SRluQ84+uY+SqZp2RpnucAHxJyAKuHGDC2y
	9e/ETl9phouvcYVG5wNlvtIbNNywcO3lrSvbnwSGTYjEaY/05BIMI0SvZFirv86ayTqFT8
	zYRffbXs0sJ63wFIA0+IE1/MCH0oPjpbOyiWQSbCO5o5EwNMYSAZawc/efpW3eRkwmLmRB
	GYpqdNlOTFBbAAd6Ab3xA0U3ufV5mGv4LW5y/JmTf/5jNGL7IhbSwzCtKS8/w4aI5Hxl2u
	cwoa8/qPjurQuPEY4slgFA3vH0K9so/tNz9EDE1S/ow0nzSeRkGjgWpn1gREFg==
Date: Tue, 27 Sep 2022 11:50:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: robert_henz@jabil.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] PR to fix WantedBy parsing of systemctl
Message-ID: <YzLHXeTtSyNzo9vE@mail.local>
References: <Yyouc28ZITHHQlcp@mail.local>
 <18402.1664207376148460909@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18402.1664207376148460909@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 09:50:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171085

On 26/09/2022 08:49:36-0700, Robert Henz via lists.openembedded.org wrote:
> >> An empty string assignment to WantedBy should clear all prior WantedBy
> >> settings. This matches behavior of the current systemd implementation.
> > 
> > Your SoB is missing here and this is mandatory.
> 
> I will attach a new patch with a SoB. Can you explain the value of having me sign off on my own PR? I guess I thought someone with more authority would be signing off on the change...
> 

You are singing of on the DCO:
https://en.wikipedia.org/wiki/Developer_Certificate_of_Origin



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

