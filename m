Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7ADC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 14:03:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.25529.1647439380646445296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 07:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kIBylwxb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BDF991BF214;
	Wed, 16 Mar 2022 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647439378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZF5P7PJ1BwVRVIr+oc1qXI7dy9JETKdVGDUAWz9nFWk=;
	b=kIBylwxbtiXx7yJwyuwnOn1B/CjF8GdBUd0wJYkR8nqIiCAVCoKDoNiNWHJwA3bZjm8CF+
	Y4ylYprTNP08wSPITKEZHzhnQx8u6gqEQUCYtvEu05nICtVFPlRC10iQtoiLPmJ42LOZft
	TsfXQSS4rIMvObTBYgnbSow4p5blcnMVSG/Vpwl8N65W+SYsuipdEnpAokMNbnh7WvC2ha
	aGz47aq8ddjj0HKIuannjilTbHPrCk66lBwHnoi60YUt7PSD0zsBqTbMGXbKynKJ5wURaJ
	smkTFnL4LdX3epGqM8Jg4CJh5o31A4qgsAxrYpXCEaf6Yia57mQqbJby/Fhfig==
Message-ID: <98a26f8b-5ae6-03bf-9a6d-9f6315a10916@bootlin.com>
Date: Wed, 16 Mar 2022 15:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: michael.opdenacker@bootlin.com
Subject: Re: [PATCH] convert-variable-renames.py: add more problematic words
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220316140007.184425-1-michael.opdenacker@bootlin.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220316140007.184425-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 14:03:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163334


On 3/16/22 15:00, Michael Opdenacker wrote:
> Listed on https://inclusivenaming.org/
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  scripts/contrib/convert-variable-renames.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/contrib/convert-variable-renames.py b/scripts/contrib/convert-variable-renames.py
> index 856c001e11..304f5484ed 100755
> --- a/scripts/contrib/convert-variable-renames.py
> +++ b/scripts/contrib/convert-variable-renames.py
> @@ -53,9 +53,14 @@ removed_list = [
>  ]
>  
>  context_check_list = [
> +"abort",
>  "blacklist",
> +"slave",
> +"sanity check",
> +"sanity test",
> +"segregate",
> +"segregation",
>  "whitelist",
> -"abort",


Oops, I meant to send this as an RFC, but forgot when I tweaked the
description line.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


