Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD541C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:13:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.12814.1647969230939835466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H2SgvGul;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 01A8FFF809;
	Tue, 22 Mar 2022 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647969229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QySmE6ZRG3NIJzJuQtkmmaqTu2MVJo/Axs+nYD3ZBIQ=;
	b=H2SgvGulSuArI50xzibbQZzvGsudOo0v7Bw/eU5PZZ8YEfpgzayARJnO/Y2DWMYri6MQxi
	O1f9dZzP26WAwX1tXgDrFXqgaylBVZUZRUuw4q9OXd4Qc93LXyNBv8li/PIxFIrK87VW/5
	I4Q4W5xnCOkN1ivkpQncqUBsTQdorh/wvIPl0ZBpvcaiA1DDMGmyGwrk3yQqC7iZiGq2Cu
	28In6hvDQqZFIqfQIt//GMLUh5IIT+htn7Q8SABBPCZC0dDiUsEaKimftu7AjrGHt2XTaL
	caiBAM7GuewmKVBQU2m7Zp8IZ7kP/AEFHu7hy3xnEhrWWqvi1kcLZtgB+LeKCw==
Date: Tue, 22 Mar 2022 18:13:48 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libjitterentropy: upgrade 3.3.1 -> 3.4.0
Message-ID: <YjoDzJmFADk54g4a@piout.net>
References: <1647945489-5242-1-git-send-email-wangmy@fujitsu.com>
 <1647945489-5242-3-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647945489-5242-3-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 17:13:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163556

Hello,

I'm pretty sure this is the cause of:
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/4937/steps/11/logs/stdio

On 22/03/2022 18:38:08+0800, wangmy wrote:
> License-Update: year updated to 2022
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...opy_3.3.1.bb => libjitterentropy_3.4.0.bb} | 4 ++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.3.1.bb => libjitterentropy_3.4.0.bb} (58%)
> 
> diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.0.bb
> similarity index 58%
> rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb
> rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.4.0.bb
> index 38b48908a3..f80ed11cc1 100644
> --- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb
> +++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.0.bb
> @@ -5,12 +5,12 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
>  all environments and on a lot of CPU architectures."
>  HOMEPAGE = "http://www.chronox.de/jent.html"
>  LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1c94a9d191202a5552f381a023551396 \
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=64a87180908540620ce364b5e69b3b03 \
>                      file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
>                      file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
>                      "
>  SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
> -SRCREV = "887c9871ea110e397812ff7f3b28a6269f0a2ffc"
> +SRCREV = "2e5019cfe63038faaa405ce53715effe4ea580e4"
>  S = "${WORKDIR}/git"
>  
>  # remove at next version upgrade or when output changes
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163539): https://lists.openembedded.org/g/openembedded-core/message/163539
> Mute This Topic: https://lists.openembedded.org/mt/89949054/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

