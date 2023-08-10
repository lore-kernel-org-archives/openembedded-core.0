Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8CCC41513
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:36:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.22348.1691685394945902084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dhbDRzwF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE00060005;
	Thu, 10 Aug 2023 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691685392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIWEK/NN/EaVgBBVyQHHZw6++dV4WI6NTqOEmyyybCg=;
	b=dhbDRzwFN4s+0sBpbliPXgOpbND2xDVCazm/oe/R7SG97v0T+CsVeM5RGJ1xcDG11/X4Ez
	A9qxRxXGX9lAC/R7TwDphHA3yrvj1jmA92jh+TKZcgeEnZOcZ3/L096X14wiMN32Ui/gJW
	+pOnzdg93Gk1V9wpEPfPVhU5zWtZC2S/KGoeE0GcUyYLH7RjcC7wDQ7E9nr2YceSt5dY1p
	+kJf/KX+E1aDPb+za7KpiouBRdmIPFr5BmHifAYnIaiArRzDhIXeOPdQMKAnPQwjZaZx3E
	iNQFiMQK++AyVKwppnV0Ms/kV0XitNbX2Hi5qzL/XMCNFSEYKQGpIm9rxGJcxw==
Message-ID: <b2efe736-0613-a3cb-020c-2cba3562420f@bootlin.com>
Date: Thu, 10 Aug 2023 18:36:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] Keep scripts/create-pull-request and send-pull-request
 ?
Content-Language: en-US
To: Cliff Brake <cbrake@bec-systems.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <3faef71d-caaf-3d10-a894-5dec092d0d3c@bootlin.com>
 <d03b0041-978c-40c0-8905-f4f3d62729be@bec-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <d03b0041-978c-40c0-8905-f4f3d62729be@bec-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185814

Hello,

On 10.08.23 at 16:18, Cliff Brake wrote:
> On 8/10/23 10:04, Michael Opdenacker via lists.openembedded.org wrote:
>> I'm wondering whether it's better to document how to create and send 
>> pull requests from standard git tools.
>
> +1
>
> Cliff


All things considered, since scripts/create-pull-request is still in 
use, in particular by Steve and Bruce, I'm leaning towards documenting 
both variants:

  * Creating a simple pull request using the standard git tools, as
    several of us are doing. Richard doesn't seem to mind. At least in
    my case, this applies to changes I previously submitted through the
    lists.
  * Creating a more elaborate pull request from a branch containing
    commits that haven't been shared yet, typically like what Steve
    does. This way, people can review each patch individually by e-mail.

Unless we want to standardize our pull requests, and make sure each 
commit is submitted (sometimes once again) as a separate patch. In that 
case, we'd only document the use of scripts/create-pull-request.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


