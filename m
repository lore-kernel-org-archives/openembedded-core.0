Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEC4EB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 06:00:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.37253.1691733603597744205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 23:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=faRm5ESr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 007E5E0006;
	Fri, 11 Aug 2023 06:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691733601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DcDJ/KPdjlfPMAH0kJWf4ahbTt/BzJ2+Zx9EBSJV0sc=;
	b=faRm5ESrUbdJwryssQbQD1jLNLLMOkdHK1O7dqvZKmvIPb0oM2FNYWWmwjyjrUFWuWR2dt
	4x1JNeTR4KuRzfaMW/uTIKJJhq6FGnUidT1kaVB0ATwqb0L9rE/o39Ii83kBbmCtmW5w85
	dsRF5VLeISiqf4/KY5S48J+LxF/f11H5asC0U2nktxpvf7sSk+4F5uvLdZ+KigCBmYkn8i
	9Dx/uIFBwmnDf9yS2Lq+sdjTpVxe9fjZtSy+am0rNDKWo5PdoVfbxseUCVvAEUcsGs+5Do
	2V6Y7ON3XpOe96km8AdWZGiGu4B4/CD/KuWWMQjPLkVtFhKsRulb3+ukVJiGmQ==
Message-ID: <3f31bf9f-a3dd-1be1-8320-5aa2abd67351@bootlin.com>
Date: Fri, 11 Aug 2023 08:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Status of patchtest tool
Content-Language: en-US
To: Frederic Martinsons <frederic.martinsons@gmail.com>
References: <CA+cAker4rvPcdjxN7faE5jzGTKVC-1K--ezXXmkOdWbJ_f_bkA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CA+cAker4rvPcdjxN7faE5jzGTKVC-1K--ezXXmkOdWbJ_f_bkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 06:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185827

Hi Frederic,

On 11.08.23 at 07:28, Frederic Martinsons wrote:
> Hello list
>
> Michael recently made a change on contirubing guide talking about 
> patchtest as a tool (quoting him) "to test user contributions before 
> they hit the mailing lists; and looking in my older emails, Alexander 
> also mentioned this tool as a (quoting him) "special bot called 
> patchtest that used to check mailing list submissions for common 
> problems".
>
> Can you tell me more about it ? Are we talking about the script 
> patchtest.sh in scripts/contrib of oe-core ?
> Can you please describe the expectations of this tool .
> I'm willing to improve it and am ready to work on it if you give me 
> some directions.


Actually, Richard wrote the initial text, and I actually wondered... Is 
the intent to have a tool that contributors can run before sending their 
patches, and that a bot can run on mailing list submissions too?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


