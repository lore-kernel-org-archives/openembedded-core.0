Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FD2C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 09:30:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.3754.1665048638628353088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 02:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ToXoZu+0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 689AD1BF214;
	Thu,  6 Oct 2022 09:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665048636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXnYM2FGdKdYgq5GNzsDpwNN4wsdlUwuF9VP8b85ijA=;
	b=ToXoZu+0SQYSAQHxo2PzqxPTWqk7KmTpIRR5rvz++rJoETR+qanZOKPaZ4DG0Qgla7qX8L
	NA5G12DUo9msNO6j3zjZpUF0HeeJvMQWmctJS7yIDwnwTotIt0HO6h/jPUMPVCm4vv/fM0
	S422k1Ufcgl6yFMCOyNUUmXAFIPO6H9bsneqbd4MbzD3Sxqm7YkKAnv97UYP4kXRDN/TTZ
	jEavn3AgQ4oLfUnV93kEy3xyUDfUcUMNEHjTHME9kpGCrqjfe/7De7er6Bt+60cg4Ts/fe
	eMb52wpd7r8Qnxm+g7mZAvh8yLT2CTyMTqFitBiLHRzAfAIqtICDcnoZprz+LA==
Message-ID: <5e4a9745-469e-3adf-3817-5a84620af2a9@bootlin.com>
Date: Thu, 6 Oct 2022 11:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: John Edward Broadbent <jebr@google.com>,
 Carson Labrado <clabrado@google.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [dunfell] [PATCH] externalsrc: git submodule--helper
 list unsupported
Content-Language: en-US
To: sven@svenschwermer.de
References: <20221006092257.67313-1-sven@svenschwermer.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221006092257.67313-1-sven@svenschwermer.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 09:30:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171484

Hi Seven,

On 06.10.22 11:22, Sven via lists.openembedded.org wrote:
> From: John Edward Broadbent <jebr@google.com>
>
> Git has removed support for "git submodule--helper list".
> https://github.com/git/git/commit/31955475d1c283120d5d84247eb3fd55d9f5fdd9
>
> This change provides an alternate method for gathering the submodules
> information.
>
> Tested:
> Build recipes with and without submodules
>
> Signed-off-by: Carson Labrado <clabrado@google.com>
> Signed-off-by: John Edward Broadbent <jebr@google.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 6d9364e5f3535954f65cbbc694ee7933ac1d664f)
> ---
>
> Notes:
>      With git 2.38.0 externalsrc does not work anymore. I hope, we can
>      backport this fix to stable branches as well.
>
>   meta/classes/externalsrc.bbclass | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> index 0e0a3ae89c..291fcf5653 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass


Thanks for the patch, but it doesn't apply.
I guess you should re-apply to the openembedded-core repository first, 
which has different paths.

Thanks again
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


