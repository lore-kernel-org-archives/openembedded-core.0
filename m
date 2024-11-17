Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56347D6DDC3
	for <webhook@archiver.kernel.org>; Sun, 17 Nov 2024 12:32:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.16960.1731846765822489620
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Nov 2024 04:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JOBUSwGv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92076FF802;
	Sun, 17 Nov 2024 12:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731846764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LyincFc+1iH6UUTEfnHTGsg5tEBbKtO/+abvU3Quyys=;
	b=JOBUSwGvrmxkDc+0JCd2QuwWIF58kwjxA0hwS4CGuEWxoIw0PBi8w5gZYXZi3wOt0y71nq
	AHW6mx4TjkIwzGlBqSMhVzpyHZB2pL0aJdvAAGSwnWmo0xwp6jXX3n+daDU1bJcu3xT+NT
	6Q/+FI3VXTqXCbV3jWLlCbZbzX6QeoEHX8ocVEWiqRKkJ6Cy6o++9H2lmo0IoQeC90h1or
	1bTL86ei2bVCwpdLrsAui6OZAmFK/8dxtNniAEoZe8Y7LP4kPTv1yzbXgOEr3FEEUVpH2d
	f2Si55Ht/tWEY6toXqV+3hRxtUTl43LfoqbtzpE4nvd/aH0ZZCX4bAcEx1wcng==
Date: Sun, 17 Nov 2024 13:32:41 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 09/47] gstreamer1.0: upgrade 1.24.6 -> 1.24.9
Message-ID: <ZzniaXn03tyV--Q0@bootlin-mathieu>
Mail-Followup-To: wangmy@fujitsu.com,
	openembedded-core@lists.openembedded.org
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
 <1731403483-21399-9-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1731403483-21399-9-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Nov 2024 12:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207196

On Tue, Nov 12, 2024 at 05:24:05PM +0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
>  https://gstreamer.freedesktop.org/releases/1.24/#1.24.9
> 

Hi Wang,

It looks like this patch is breaking some builds on the autobuilder:

| ../gstreamer-vaapi-1.24.9/meson.build:85:16: ERROR: Dependency
"libva-x11" not found, tried pkgconfig

https://valkyrie.yoctoproject.org/#/builders/25/builds/437/steps/11/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/25/builds/437/steps/14/logs/stdio

Can you have a look at this, please?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

