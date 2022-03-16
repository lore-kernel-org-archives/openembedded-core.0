Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CD9C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 14:05:30 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.25649.1647439529078335277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 07:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YxiyRTan;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 03BC7240008;
	Wed, 16 Mar 2022 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647439527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VRJSO72volkWXCPwDsFhEr4B0J3qaYDVmCDcmLgw+wg=;
	b=YxiyRTan6JsOmtAM07P1vAVUPSLzj5yf7iBT8fs1lUh7JHuEaiJsqlEupGNii7aBD7sqHk
	ILu0KkCmdjL4QfCVMItPJ8ddn9N82tv0vcSas9I4PdSLjsPIDTUQ1uP9eOZg8yI1+DOzq7
	jXXSqmxx/pZOQqFUxKDBW2K3u0D6lYR2Glw5vx+GUuIvfSC0uJz6G0ukzFRjOB5CqIWRwe
	UFFyp2wJTBm1bm2YKPRqP+x47QaxrSQeZ26sAmoODBKtmK+YXu8RllzcURCuqmiVoT+6CV
	x0WsIDhR9Kzt8rIJKACqkvgY6CaqMk1UgraeLwsdgDZJvVHv/AXdVkVnfS8KnA==
Message-ID: <ae470c5c-d35e-5ba3-8da2-65dd5e448786@bootlin.com>
Date: Wed, 16 Mar 2022 15:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] convert-variable-renames.py: add more
 problematic words
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220316140007.184425-1-michael.opdenacker@bootlin.com>
 <3513614322f4f301ca4cd34fe6f6f0b5576562a4.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <3513614322f4f301ca4cd34fe6f6f0b5576562a4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 14:05:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163335


On 3/16/22 15:02, Richard Purdie wrote:
> On Wed, 2022-03-16 at 15:00 +0100, Michael Opdenacker via lists.openembedded.org
> wrote:
>> Listed on https://inclusivenaming.org/
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  scripts/contrib/convert-variable-renames.py | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
> Not sure we want to add a whole load more work at this point in the release
> cycle? This wasn't what we agreed as the first set of priorities :/.

The word checks are just warnings by the way, but no problem at all for me.
I figured I'd send a patch rather than a question ;-)

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


