Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B71C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 22:31:33 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23395.1785364285245646740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 15:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=OMItDPGJ;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152, mailfrom: marek.vasut@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4h9RrS0plQzKq5v;
	Thu, 30 Jul 2026 00:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785364280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YOXD3i0N/ncBBdqTSfL54+7bPdB/mqKKgYXyDb19bO8=;
	b=OMItDPGJALMOZfR7Gh/bs6CvcZAtgyxoihdQCSlKIxCEdFGg8b5sxmItoUaDjrydMHP97o
	NKWKEDQEBPD7+RYwWpI40rEJ8pRlycdt8lGFfTPTP503sHRiGKeY+6HmovG1WGz4/hq9QD
	zK+e70mI5h/vy2WhgqwRHAZpLK1He3kJdKEATH78h/g+DTgLbO9beSKXM0QMZ8Go4nVVRO
	0MDgclrPX/eycZn7x1Dmx14YIJA3vS0DXvQ6r7rI/4iqrasXWrMup3iNOGInlCyxDhI+uA
	/b8pgtiU46Vg8BHfSEeNrLTY9/KN7ivkFj57Pv3MkPd6DTGNy9w/ScYVArIhQw==
Message-ID: <a84070f4-290c-4ada-86ce-7f601bb8870b@mailbox.org>
Date: Thu, 30 Jul 2026 00:31:17 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
From: Marek Vasut <marek.vasut@mailbox.org>
To: Yoann Congal <yoann.congal@smile.fr>, adrian.freihofer@gmail.com,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Ryan Eatmon <reatmon@ti.com>
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
 <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
 <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
 <DJO1RET2JWA2.2H0HY5TPUI2T5@smile.fr>
 <84bd480810d947c860b95c3cc10f66fced3cdedf.camel@gmail.com>
 <e4369955-eae6-4c45-b00c-01ca18d94fa2@mailbox.org>
 <2304e3c8-1b90-4bbf-8022-80f19d1447a7@mailbox.org>
 <DK3HZYI7OV4C.YF3JS912EHFG@smile.fr>
 <868f8648-d45f-4ba5-a6e5-7eb5fadb2516@mailbox.org>
Content-Language: en-US
In-Reply-To: <868f8648-d45f-4ba5-a6e5-7eb5fadb2516@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: ebf2efe9064d99c5046
X-MBO-RS-META: 63c89gahieeaxjzmhtpry7567gkw87o1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 22:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242298

On 7/20/26 5:31 PM, Marek Vasut wrote:

Hello Yoann,

>>>> [1] https://patchwork.yoctoproject.org/project/oe-core/
>>>> patch/20260704214812.365483-1-marek.vasut@mailbox.org/
>>>> [2] https://patchwork.yoctoproject.org/project/oe-core/
>>>> patch/20260630074356.10265-1-marek.vasut@mailbox.org/
>>>> [3] https://patchwork.yoctoproject.org/project/oe-core/
>>>> patch/20260630074423.10306-1-marek.vasut@mailbox.org/
>>>
>>> Do you think those three backports can be picked up for OE wrynose ?
>>>
>>> Thank you for your help !
>>
>> Sure! They even are in the branch I sent for review:
>> https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smile.fr/
> 
> Oh, that's nice.
> 
>> Following Paul's review, I will most likely hold it for one cycle in 
>> order to merge
>> the test at the same time.
>> See: https://lore.kernel.org/all/ 
>> c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev/

Are there any news on getting the fitImage fixes into the wrynose 
branch, is this still on your radar ?

Thank you, and I'm sorry for the push.

-- 
Best regards,
Marek Vasut


