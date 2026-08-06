Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F9DC55174
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 00:02:42 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9212.1785974559850164641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 17:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=gJX9Jewz;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161, mailfrom: marek.vasut@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hFnXX2TKwzKn8n;
	Thu, 06 Aug 2026 02:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785974556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IPPaRARXjid9kS+Y4YiGQc7gFb6jSPLGyAEPplut6nA=;
	b=gJX9JewztTIwftuwo6+DPAimRGmQrp9P+n6URWQdRutiGzvdlEWBLwVpjtKvipyzXlH8Gg
	UASBScv9GpFf/2cJAeKyByYUjHfxlyh+5PdUuTAgTrMc1XI8Gq6Nn9DMljEl3kAu3SmnZ2
	4n7s3OAlvqbHMYGvAO9ESZYlIYt5v3fJlfdKu7v1vEOBv1l8DeCwHW7GshEF1SlfxTzpZr
	8Fe00xbht8v7LN6bPufXm9cCBhKj8LxEQ3mZfgM4Vi8p7a0bAdZuMZB3ru9tltu/7A2PvF
	2oaPxyL4VHAxAKcDZWLuVMwvuzKLsXR01iTLAT56m22GJmnlBfIEPlSMYfPxBA==
Message-ID: <e1f32ec0-bc37-48d4-bf7e-7dc5d880dfbc@mailbox.org>
Date: Thu, 6 Aug 2026 02:02:32 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
From: Marek Vasut <marek.vasut@mailbox.org>
To: Yoann Congal <yoann.congal@smile.fr>, adrian.freihofer@gmail.com,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Paul Barker <paul@pbarker.dev>
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
 <a84070f4-290c-4ada-86ce-7f601bb8870b@mailbox.org>
 <DKBQEXTZ79PI.3DFEPYRHXLBNB@smile.fr>
 <2327c8bd-c465-43ad-bb56-ac571eadafc8@mailbox.org>
 <0be60525b600137c0f723c7faa7ab5c2f04934ae.camel@gmail.com>
 <DKBWUZLGTNVG.ZNWPY3U22BE8@smile.fr>
 <b4fd3e49-e436-40cd-8b62-0c6792cd6f14@mailbox.org>
 <982caddffca561ea3bf1ce907a40447302e74378.camel@gmail.com>
 <DKBYCAF9BZO1.1QQXVA3V614B3@smile.fr>
 <398ede22-152a-4b9b-8eeb-8e252bdab4d4@mailbox.org>
Content-Language: en-US
In-Reply-To: <398ede22-152a-4b9b-8eeb-8e252bdab4d4@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 09bcee6e2116aeb5c0b
X-MBO-RS-META: gwsd98andw43him6fusmz7p9ujsqjp4i
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 00:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242895

On 7/31/26 4:34 AM, Marek Vasut wrote:

Hello again,

+CC Paul , it would be good to finally land those fitImage bugfix 
backports in OE wrynose , without them I cannot use OE wrynose with 
fitImages .

>>>>>>> The fitimage fixes landed in oe-core master 6 weeks ago and
>>>>>>> they fix
>>>>>>> fitImage usability issues which block me from updating to
>>>>>>> wrynose in
>>>>>>> multiple projects, that's why I keep monitoring this thread so,
>>>>>>> but
>>>>>>> again, please do not read this as a push.
>>>>>>
>>>>>> I think going with the four patches from
>>>>>> https://lore.kernel.org/all/ 
>>>>>> cover.1784364567.git.yoann.congal@smile.fr/
>>>>>> without a fifth patch which adds test coverage for this fairly
>>>>>> isolated
>>>>>> detail is fine.
>>>>>
>>>>> This is where I disagree. Last time I reviewed this series it
>>>>> looked
>>>>> good but I had no way to check it actually worked once backported
>>>>> to
>>>>> wrynose. That is why I asked Ryan to backport the test from master
>>>>> to
>>>>> wrynose.
>>>>
>>>> Is there a git tree/branch with those patches ? If so, I can at least
>>>> test this locally and confirm whether or not anything is broken on my
>>>> end ?
>>
>> I pushed that here:
>> https://git.openembedded.org/openembedded-core-contrib/log/?h=ycongal/ 
>> wrynose/kernel-fit
> 
> This works for my use cases.
[...]

> I submitted the backported test, but the test required adjustments to 
> not depend on the other commits. I think the adjustments are harmless 
> and the test still works as intended:
> 
> [wrynose][PATCH] oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED


-- 
Best regards,
Marek Vasut


