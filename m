Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E714C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:31:40 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.233.1784561498025702556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 08:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=BbEE2JS3;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: marek.vasut@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4h3kyF57C2z8sYT;
	Mon, 20 Jul 2026 17:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784561493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oMuGMIFJEiHMTZct1Xg9KfWy7eJ46/C5Jk2Ec9izmmo=;
	b=BbEE2JS3q4aHo1o8j/pHCjhgIe0aWDXEuOal/XiHzCD0KtfilWuXLfeCLqMHtn6y4pe96i
	v2bbOOMeQPAQkmotL65J7Pla6A3UTFwFqcd68UQcBkynCBNNkpCsV2vHV6bgFykuNtjkCb
	be7PXDca8E5Q/0T+lCK2B/QkYwZC9iUnLuxkYc3geY67CsXMEvzQNcmggngDeUrcq+1BWP
	8MUNrAOkpUVfC0y22GyJznaot+LRFydy+D4A66DvegXVCqimxMXZrf3/KRl1Rplb4OCiy6
	GqhSrnXYI0eyOGN90bZoLEa6wdef0goMfTV9aplWrebNqmPQ/P794uWGbzIavg==
Message-ID: <868f8648-d45f-4ba5-a6e5-7eb5fadb2516@mailbox.org>
Date: Mon, 20 Jul 2026 17:31:31 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DK3HZYI7OV4C.YF3JS912EHFG@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0b001464dbe3ccf2390
X-MBO-RS-META: rfff9mygb7ukxfw3mkofpd7fjkbj7zn8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 15:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241414

On 7/20/26 5:19 PM, Yoann Congal wrote:

Hello Yoann,

>>> [1] https://patchwork.yoctoproject.org/project/oe-core/
>>> patch/20260704214812.365483-1-marek.vasut@mailbox.org/
>>> [2] https://patchwork.yoctoproject.org/project/oe-core/
>>> patch/20260630074356.10265-1-marek.vasut@mailbox.org/
>>> [3] https://patchwork.yoctoproject.org/project/oe-core/
>>> patch/20260630074423.10306-1-marek.vasut@mailbox.org/
>>
>> Do you think those three backports can be picked up for OE wrynose ?
>>
>> Thank you for your help !
> 
> Sure! They even are in the branch I sent for review:
> https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smile.fr/

Oh, that's nice.

> Following Paul's review, I will most likely hold it for one cycle in order to merge
> the test at the same time.
> See: https://lore.kernel.org/all/c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev/

Thank you !

-- 
Best regards,
Marek Vasut

