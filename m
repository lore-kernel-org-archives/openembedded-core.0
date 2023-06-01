Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F454C77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 21:35:19 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.4736.1685655313516061772
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 14:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Zj9cft5e;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685655311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m7lkBdgTMeNIXM5Se3tiYQ1E6LefhcSYg7+jK2hC2bA=;
	b=Zj9cft5e2PAImnS+ELrH7qsurY5IM0QcPasVjIITRdTbfLJ0R9Wg4SW2+8gkyPSGu3lISj
	6uDO3FiAevLHu90uu7mTWpVMaNKL1AjGMi+zvEO5xlqZGGyMzI2nQcxcYJluLzwoDQQNTG
	iqlhTe18esakdwI9p+a6RLZuNzdbRWhFeFtThvCB2/G8hOgAk3A3L7XTPSVzGYvE9yvVHV
	ow6CeT5RR9+/a5pcTQmZGMQKDeWXTgMtV5eSpgATZFdpoBOsvCTCXSnncWCVEWHSP15UA/
	Zo0PdYLdNRr1LVyvuuAfMtTafVa2OQT+1mcG7GLcjADUQzZsHeyIO8FTqx9pCQ==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A90D260002;
	Thu,  1 Jun 2023 21:35:10 +0000 (UTC)
Date: Thu, 1 Jun 2023 23:35:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lighttpd: upgrade 1.4.69 -> 1.4.71
Message-ID: <202306012135103d72bd44@mail.local>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
 <1685610221-29015-10-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1685610221-29015-10-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 21:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182121

Hello,

On the autobuilders, this causes:

WARNING: lighttpd-1.4.71-r0 do_package_qa: QA Issue: lighttpd rdepends on lighttpd-module-indexfile, but it isn't a build dependency? [build-deps]
WARNING: lighttpd-1.4.71-r0 do_package_qa: QA Issue: lighttpd rdepends on lighttpd-module-staticfile, but it isn't a build dependency? [build-deps]



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

