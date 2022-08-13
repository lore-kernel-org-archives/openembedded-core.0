Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23077C19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 13:07:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.4635.1660396020324007514
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 06:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ASId5weP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 53021240006;
	Sat, 13 Aug 2022 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1660396017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wChy/0a9vwoiZmcfqswoqaE364U6F6IhgOh5wOqePKw=;
	b=ASId5wePoAdTKqoiBy5aWnMnPfuELMObMoETaj3iMZesHoZVbu9rDY3Jnfb8MXqjmIKAma
	59RFUDsT7pbEL1yquYKySL/MlKmQ0CUX9UZa9OqYSUcpIokgG0Ekc8dC3pNh98W0du6f9B
	80VuR+MvjPG8fsuylNQcsSa1GHPYgz2xvDJB1J2T02ceh0W9noszOJjuX6FpCVzzrX8FCB
	gGHXSfqsBJScof4eLvl9u7a4hTTPxryxGTB/ASjX7/tG1M7I2MhMqoS65IYPDQz4pW8+Q8
	JWSL0TODSznbCDf+Ghy5mquc+gRP4xeWrW+ncvri6XU3ln1/ps/LzCeGUHGD6g==
Date: Sat, 13 Aug 2022 15:06:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH v2 41/44] stress-ng: upgrade 0.14.02 -> 0.14.03
Message-ID: <Yveh8MmFvUplmGpb@mail.local>
References: <20220808064237.3975347-1-alex@linutronix.de>
 <20220808064237.3975347-41-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808064237.3975347-41-alex@linutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 13:07:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169306

v1 was applied, please rebase on master

On 08/08/2022 08:42:34+0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../stress-ng/{stress-ng_0.14.02.bb => stress-ng_0.14.03.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/stress-ng/{stress-ng_0.14.02.bb => stress-ng_0.14.03.bb} (93%)
> 
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.14.02.bb b/meta/recipes-extended/stress-ng/stress-ng_0.14.03.bb
> similarity index 93%
> rename from meta/recipes-extended/stress-ng/stress-ng_0.14.02.bb
> rename to meta/recipes-extended/stress-ng/stress-ng_0.14.03.bb
> index 000a640917..ccca4ffa4d 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.14.02.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.14.03.bb
> @@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
> -SRCREV = "5239ae6c82bfb239637b5a66cd39a035a158e641"
> +SRCREV = "346518caffe5302f9a6d36860459c297c6968aaa"
>  S = "${WORKDIR}/git"
>  
>  DEPENDS = "coreutils-native"
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169065): https://lists.openembedded.org/g/openembedded-core/message/169065
> Mute This Topic: https://lists.openembedded.org/mt/92887037/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

