Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3389EC433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 10:49:04 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.3029.1665139734622369990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 03:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RZyPMIIy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 256C01BF203;
	Fri,  7 Oct 2022 10:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665139732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iXvDFdsMUK37VyknRQiDaBDwcMNbBnriaQYKWbidGyY=;
	b=RZyPMIIylcj9p+aSfMpuSneLRsaOw3tdUw4hAi2+sVT2w9M1dA7YyezrjllMEU/AUTgeOW
	EQyWCqV0WNJWkBEKB4qLNFjXnMJrPWFC450nzp0Mn1BXJpZHeU/x4lUBBwqvDFZ34S9ggr
	3r9X728J0YYSkEHKiGWkGnFKCTCgnXvXac2jbfV10md87ICGAh8s2QWdHJ5gQSN01JoEvR
	h7zX/2z6k3xxh6v7iCGoRquqZF+yqc+PIJcCe0FlHLdnqApFmfb1534w4oY4g5biY3YEBs
	LlUTvUpT83Xv74iJN3YtdODajlJPZLZV1INH/7DJWLtHy7OKmQVqJknH8LWeMQ==
Date: Fri, 7 Oct 2022 12:48:50 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] perf: make scripting depend on setuptools3
Message-ID: <20221007124850.1dc035d2@booty>
In-Reply-To: <20221006164944.52304-1-bruce.ashfield@gmail.com>
References: <20221006164944.52304-1-bruce.ashfield@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 10:49:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171521

Hi Bruce,

On Thu,  6 Oct 2022 12:49:44 -0400
"Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> It looks like this should have been an error for a while, but it
> only started showing up in my 6.x linux-yocto-dev testing.
> 
> Without the inherit of setuptool3, we get a module missing error
> during configure and the build obviously fails.
> 
> Tested against 5.x and 6.x kernels.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

This patch triggers a warning:

WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/lib/python3.10/site-packages/perf-0.1-py3.10-linux-x86_64.egg/EGG-INFO/SOURCES.txt in package perf-python contains reference to TMPDIR

https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/3499/steps/13/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

