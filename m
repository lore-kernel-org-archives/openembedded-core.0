Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F306CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 18:13:00 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.69667.1697307175388332731
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 11:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gOX/Qbdc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0693E1BF204;
	Sat, 14 Oct 2023 18:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697307173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jAw8hMYPHavgH/madS/c8/Tec3XY9jL10chbPmdaeI=;
	b=gOX/QbdclS1RIj+EHaoHDvn8QNBqP9Q0XO8J6vwVCE1GQ4NTYYCH6aTj2VSrmnwXMS/0X+
	G9AL2HHRu/erbLoxJCZU7knhr+sMVKUgNxsmwIONZMYgEwol6GBSiOwji2R+toGiFNL6ey
	l+Ie/g2+UGXDGrsW8A2JH/IOfKs1oU4zTtlnA8LLFy3l072CEehbodG1Q/Hw1hr1ppy16t
	e0P0xET067Ej4tCjRp8qd1QtxqBTIC04lxn4mXzuERjxZDmqX67H2w47ZBBg59M2NSY5FE
	NKrTCLRgQMrroVv6rWq6infv/BhiP+8jQ70E+9lsRBwwY/iVmBzcum5t+f/zLQ==
Date: Sat, 14 Oct 2023 20:12:47 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "wangmy" <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lighttpd: upgrade 1.4.71 -> 1.4.72
Message-ID: <20231014201247.296896b4@booty>
In-Reply-To: <1697187621-4279-1-git-send-email-wangmy@fujitsu.com>
References: <1697187621-4279-1-git-send-email-wangmy@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 18:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189121

Hello wangmy,

On Fri, 13 Oct 2023 17:00:21 +0800
"wangmy" <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ===========

This patch fails building:

ERROR: lighttpd-1.4.72-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.72.tar.xz')

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/8297/steps/12/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

