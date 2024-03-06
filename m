Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E749AC54E4A
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:26:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.14449.1709738785364788931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:26:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q3BPUimn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA1292000F;
	Wed,  6 Mar 2024 15:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709738783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w5E0VkitJ402rLhXeyk9j2AfMFgn/cDa6x/u4dYJ9Uo=;
	b=Q3BPUimnF6wr53N7VSt4Shnmv/iKPt7nle23/NCPZPiJbDtJO31EimOCY83JbXQkd5OdxL
	rIVHTd1xelu+/sJr7G5nughkbIio1XNkwQe7yVJuYtUbF76CnCmgtsn4ybSBjkwsIOt16N
	GEuQ8jQHl4FcFXeIM9sTKgW7zykgvJM/kD9ZCv2MXfDMfIixT2O95c7gpD1O7jLYF2+VPA
	oIwfti0Zp+zYbJi1cSF5quvVK2O8NH5d+OvkwULWqEWPSdxG3qYkKuWcM5fWGpUhWQ6w30
	XVAPs0T8TTuitbhqmlNi5oZ9jLpG34czof8dNK3lSxwLXXY+iUzLC0K5VGWsBw==
Message-ID: <706fe3ca-3803-4fc0-9a98-da1fa62d2e7d@bootlin.com>
Date: Wed, 6 Mar 2024 16:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: raj.khem@gmail.com, docs@lists.yoctoproject.org
Subject: Re: [OE-core] [PATCH v2] dev-manual: Convert to 'bmaptool-native'
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20240305195213.1098945-1-festevam@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240305195213.1098945-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:26:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196683

Hi Fabio

On 3/5/24 at 20:52, Fabio Estevam wrote:
> Since commit 7a036b1a1ec7 ("bmaptool: now part of Yocto Project")
> 'bmap-tools-native' has been renamed as 'bmaptool-native'.
>
> Adjust the references in the documentation accordingly.
>
> Suggested-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>


Many thanks for the patch!
However, I eventually took Trevor's version, which was more exhaustive 
than yours...

Funny to have two competing patches :-)
Thanks anyway
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


