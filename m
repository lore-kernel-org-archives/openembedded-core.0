Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ED8C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 10:18:49 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.6208.1667902722877271966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 02:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gj0aGeY9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AAA24E0004;
	Tue,  8 Nov 2022 10:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667902721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZKD3qfwM/UNFGbLYf4wca2+QfFijyWheYstyAQaNPA=;
	b=gj0aGeY9Y7DEGs8cdeJi6z6DaUg1lqcsEZMOS5N4rD1NNsXuQxdIejeEIz+ObjG3Fxrvxg
	WrgvSEzV6BS9HyDFuHnxnkc7hgqfL+aProByEnQ/chUa4NlS5Pz4BnaYcD0ccLmt6EjtaT
	KSqYTVTAXGhS23dIZhhWQZQv2iIooKgIRNzSbChKqC1ThR9hqOmS9AAljP37UIvFbxphYA
	S05s2L/6UtaQP+yXnrqhDER0ARjbLAYiuFDCy/X4x/3w2i6H/NdH3t53el7aJgWr0meIfi
	Vv191M5xfuHNR/RtqgsfPOzzAtRzl8lINTLPAnzYt6MBInpNyLoalInbQvcZdQ==
Message-ID: <fa283717-c99a-fddb-d6fb-dfd6814ec93e@bootlin.com>
Date: Tue, 8 Nov 2022 11:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] pixman: backport fix for CVE-2022-44638
Content-Language: en-US
To: Ezhilarasan <ezhilarasanx.s@intel.com>
References: <20221108085109.3851-1-ezhilarasanx.s@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221108085109.3851-1-ezhilarasanx.s@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 10:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172957

Hi Ravula

Thank you very much for the patch!

On 11/8/22 09:51, Ezhilarasan wrote:
> Reference to upstream patch:
> https://gitlab.freedesktop.org/pixman/pixman/-/commit/a1f88e842e0216a5b4df1ab023caebe33c101395
>
> Signed-off-by: Ravula AdhityaX Siddartha <adhityax.siddartha.ravula@intel.com>

However, if I apply your patch through "git am", the author of the 
commit will be:
Ezhilarasan <ezhilarasanx.s@intel.com>
instead of
Ravula AdhityaX Siddartha <adhityax.siddartha.ravula@intel.com>

Because of this issue, the maintainer has to manually fix this field 
when accepting your patch. Worse, if he doesn't catch this, that's 
harder to fix afterwards.

You should be able to fix this by running:
git config --global sendemail.from "ezhilarasanx.s@intel.com"

This should add a "From" field to the sent patch which "git am" should 
be able to match with your name.
At least this worked for me. See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Could you try to send an update (don't hesitate to send a private one to 
me first)?

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


