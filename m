Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485B8CDB466
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 00:57:06 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33841.1782089817309664215
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 17:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=Js8V/STU;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172, mailfrom: marek.vasut@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gk8sw5777z9tcg;
	Mon, 22 Jun 2026 02:56:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782089812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QttmBcDE8kioIyhUspPd4B0eVZ3qGQdreYnOP6kIylA=;
	b=Js8V/STUVjLk1wsPOOxnh0bCWKou0f1pR3FcfwECw64rOfTlt5nIrZFVvsy0IZVuDRul8p
	3u91XNgmStOuRz+k59TBjlymzHRd3hua9xE4StH7IyRGXJZ1huf4Jk7AYk3iyAzxXH/JOx
	fNDS+9dyHiKK6dOpbv9HQn9foTgRtDizVph+/2LSgBqjQtG24xRSstr7ctHfaxSYSiSsHb
	JQGNE0TX5I8qKIagLEsuyp6Se5Enyk55TOoXFGr4f21verTHT61uWqapMGecZyWVGYyA1j
	3zSkfJmt6OXcTVxilwhxeyrMarLsntiRQRuxtYR0GvEx2to5k6eF899YVz9eIg==
Message-ID: <8b7a420a-4648-4cba-af11-7bbf4f086e4a@mailbox.org>
Date: Mon, 22 Jun 2026 02:56:50 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] kernel-fit-image.bbclass: Fix operation with
 KERNEL_DTBVENDORED = "1"
To: adrian.freihofer@gmail.com, mathieu.dubois-briand@bootlin.com,
 openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20260616214945.40714-1-marek.vasut@mailbox.org>
 <DJBYLLSOVDCK.3V9DIPDH2YV6M@bootlin.com>
 <7cbd939a9294495c287005b843dc068d22f18be5.camel@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <7cbd939a9294495c287005b843dc068d22f18be5.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: d8935f19429075e212e
X-MBO-RS-META: q85ehkj6pb5s7c1ua96tshosnc173i9k
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 00:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239262

On 6/21/26 12:21 PM, adrian.freihofer@gmail.com wrote:

Hello Adrian,

> The issue is that the tests need to handle this change too. I tried to
> come up with a complete solution here:
> https://lists.openembedded.org/g/openembedded-core/message/239258
> 
> The proposal is:
> 1. Fix the tests
> 2. Add the patches from Marek
> 
> 
> 
> Note: Here is my complete WIP branch for the fitimage related changes:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=adrianf/fit-improvements
> There is one more patch which will add test coverage for the
> KERNEL_DTBVENDORED = "1" case. I will send this later, after the
> patches which are already in the queue will be merged to master.

Thank you.

-- 
Best regards,
Marek Vasut

