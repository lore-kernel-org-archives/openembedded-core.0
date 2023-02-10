Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7985AC636D3
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 08:46:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.9761.1676018800676533569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 00:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iAq+vxiQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B584760003;
	Fri, 10 Feb 2023 08:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676018798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VmSn+5nAqkQiuW9HaHbyapsaDAyuz7y+N/TX84TWw9g=;
	b=iAq+vxiQG+kP/tLgILo6QlxtMlYJBNNxgkIyI1YFmnEWphTWV3hYbTF2lYxadsBwlkm/Pk
	ClMxO6uBkegyHjN/DrJNOb3OwdqfvFInYDZE0660dKn1F7KwFFMuMOIMw508h2clbXbqr5
	yk73fOHGm5GwNq+S385uWWszD8fNlR4jkDKeEszJ4ejhHXnxYKZbGpVyo8tBvbo+C3SNH5
	Uarshb0APCD/xrt/aMB4wZB/6kr2B+qYVdl+EcTqi04woG+VSzJ6WYWMPilYtFB59aKiGt
	yHkW3WuHGsNEmZO/flczUha/phlGkeUi+srOZEp4m33dpNHf6M5BCwxMcPtVvQ==
Date: Fri, 10 Feb 2023 09:46:36 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Trevor Woerner" <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] python3-dtschema: add dependency on
 pylibfdt
Message-ID: <20230210094636.5186b246@booty>
In-Reply-To: <20230209183756.625-1-twoerner@gmail.com>
References: <20230209183756.625-1-twoerner@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 08:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176986

Hello Trevor,

On Thu,  9 Feb 2023 13:37:55 -0500
"Trevor Woerner" <twoerner@gmail.com> wrote:

> dt-schema has a dependency on pylibfdt.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

This patches triggers an error due to the new recipe not having a
maintainer:

The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
python3-pylibfdt (/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb)

Some logs from the autobuilders that found this:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/943/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4823/steps/14/logs/stdio

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

