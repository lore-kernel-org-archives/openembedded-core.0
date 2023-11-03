Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68117C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 09:29:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.45475.1699003790270700804
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 02:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m31tLUGt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC1791BF208;
	Fri,  3 Nov 2023 09:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699003788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YvOPmDl2itTP8nVj6GfbdP2HJXCrV0Br5jmVgfwRXaE=;
	b=m31tLUGt3Pv0MsCpLE/IXms+OHctLK9AD4CFdyM/eRhnvgGKdkrXGFoEL9IjmI51k1lDq8
	wjQRbvgQqN6c1fwg81Dkk+Unzz2Nj42Rcr6X0EB0uLiqj+AT9bh9uQguJAl0BAK6CHAUcH
	x3P5D6znLsJivNnOot59x2FgkMnpD5R/cA+a8/xyDw4THgjxSllZvdigBy5DwB85SHUJKg
	n8G6pizROVjIjGEyQ/3YWYaVQtgXvqlKdqb1opdZPCT46V9fCU3oV3XA5Ala7v8H9p4CUa
	9p3zj6pIeW7Pt3Rb4s+rdQ//X3Ysg3exvrCw0zupW37e48YW1Mq3/1oEXBgSBw==
Message-ID: <8197591c-8074-4b41-ba6b-7511a3e7548d@bootlin.com>
Date: Fri, 3 Nov 2023 10:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] documentation.conf: drop SERIAL_CONSOLES_CHECK
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20231103062554.3881836-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231103062554.3881836-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190144


On 03.11.23 at 07:25, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> remove obsolete SERIAL_CONSOLES_CHECK.
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   meta/conf/documentation.conf | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 23a9c0fe7b..d03c497c0e 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -379,7 +379,6 @@ SDKMACHINE[doc] = "Specifies the architecture (i.e. i686 or x86_64) for which to
>   SECTION[doc] = "The section in which packages should be categorized. Package management utilities can make use of this variable."
>   SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless DEBUG_BUILD = '1'. In this case, the value of DEBUG_OPTIMIZATION is used."
>   SERIAL_CONSOLES[doc] = "Defines the serial consoles (TTYs) to enable using getty."
> -SERIAL_CONSOLES_CHECK[doc] = "Similar to SERIAL_CONSOLES except the device is checked for existence before attempting to enable it. Supported only by SysVinit."
>   SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that should not be used to determine signatures of tasks from one recipe when they depend on tasks from another recipe."
>   SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
>   SITEINFO_BITS[doc] = "Specifies the number of bits for the target system CPU."


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Once this is merged, I'll be able to remove the variable from the docs.
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


