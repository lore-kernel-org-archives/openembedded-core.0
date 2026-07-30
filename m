Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26A2C55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 13:00:56 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11021.1785416450734708773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 06:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=xa7RsTtC;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172, mailfrom: marek.vasut@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4h9q7f5YR4zMlDm;
	Thu, 30 Jul 2026 15:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785416446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gp5Bd65JxiLltK8I9En15lX9XUsmh/atwkeScgUSOsI=;
	b=xa7RsTtCjaPPqeffYkpki9enSOeFQ1AqgR+jqBpCccaW1DQy4PdreC7LPf5wBnZpnjw1vj
	gOYCicCEaN06Jfy/1rDPC0be60E6yskGa3siPrjZIb2lfTGc8CLzolz4bZJwPdC0uimQOE
	OOfKq5dRT0NRHNAZ6qPhnCdo1X85+Hn81hSrgaTvzdwp47AJrhwuNr1hP/95tTemLgfoL/
	YG+R1F36mgVtiPoVVIfi7agt9mFX4u8452WOWZe2k02sSno36H0sBQhfTqGhDUGuBwXDYJ
	8i/U9lGXpbZ+/Ytk6chdQkZgl2YBQ5DlFpiaRMwEdDHh7nE6Glylrw8tdIMQLA==
Message-ID: <b4fd3e49-e436-40cd-8b62-0c6792cd6f14@mailbox.org>
Date: Thu, 30 Jul 2026 15:00:43 +0200
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
 <868f8648-d45f-4ba5-a6e5-7eb5fadb2516@mailbox.org>
 <a84070f4-290c-4ada-86ce-7f601bb8870b@mailbox.org>
 <DKBQEXTZ79PI.3DFEPYRHXLBNB@smile.fr>
 <2327c8bd-c465-43ad-bb56-ac571eadafc8@mailbox.org>
 <0be60525b600137c0f723c7faa7ab5c2f04934ae.camel@gmail.com>
 <DKBWUZLGTNVG.ZNWPY3U22BE8@smile.fr>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DKBWUZLGTNVG.ZNWPY3U22BE8@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1099dd4042b1aa63cd6
X-MBO-RS-META: puademnu4pnfp8qyd86ucaa7rdozuioc
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 13:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242350

On 7/30/26 2:39 PM, Yoann Congal wrote:

Hello everyone,

>>> The fitimage fixes landed in oe-core master 6 weeks ago and they fix
>>> fitImage usability issues which block me from updating to wrynose in
>>> multiple projects, that's why I keep monitoring this thread so, but
>>> again, please do not read this as a push.
>>
>> I think going with the four patches from
>> https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smile.fr/
>> without a fifth patch which adds test coverage for this fairly isolated
>> detail is fine.
> 
> This is where I disagree. Last time I reviewed this series it looked
> good but I had no way to check it actually worked once backported to
> wrynose. That is why I asked Ryan to backport the test from master to
> wrynose.

Is there a git tree/branch with those patches ? If so, I can at least 
test this locally and confirm whether or not anything is broken on my end ?

>> Important is: We need 4 not only 3 patches:
>>
>> Adrian Freihofer (1):
>>    oe-selftest: fitimage: Do not expect kernel property in DTBO config
>>      subnodes
>>
>> Marek Vasut (2):
>>    kernel-fit-image.bbclass: Do not include kernel property in DTBO
>>      config subnodes
>>    kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED = "1"
>>
>> Ryan Eatmon (1):
>>    kernel-fit-image: Add KERNEL_DTBVENDORED support for
>>      FIT_CONF_DEFAULT_DTB
> 
> Yes. This is the patches I have for this work.
> 
>> And also important is: We need time for testing on master before back-
>> porting to stable. Six weeks is probably enough. But the exact same
>> pattern ended up with a broken stable branch maybe one year ago. And
>> also this time there was a state on master which was at least
>> incomplete (three instead of four patches). But still, I think this is
>> ready for stable now.
> 
> I agree on the series needing testing. One more argument for waiting for
> a wrynose test.
> See https://lore.kernel.org/all/DK3HWGV0JCOP.14DJEFKWLP67L@smile.fr/
> (from the same thread you linked)

I ran this now and got 8 commits which cleanly apply on the wrynose 
branch, maybe that is all that is missing for the test part ?

$ git log --oneline --reverse --grep=fitimage 
origin/wrynose..origin/master -- meta/lib/oeqa/selftest/cases/fitimage.py
e46d8473fb3 oeqa/selftest/fitimage: fix missing whitespace around assignment
0344e652a40 oe-selftest: fitimage: replace _gen_random_file with 
_gen_elf64_dummy
5592be53348 oe-selftest: fitimage: replace bbb-dtbs-as-ext with 
test-dtbs-as-ext
befc103a95d oe-selftest: fitimage: replace MACHINE==qemux86-64 guards 
with KERNEL_SETUP_BIN
4b08cf6048b oe-selftest: fitimage: add machine settings table and skip 
helpers
f17f4263c07 oe-selftest: fitimage: stop hardcoding MACHINE and DISTRO in 
tests
85e0408a81b oe-selftest: fitimage: Do not expect kernel property in DTBO 
config subnodes
de2e11e6362 oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED

-- 
Best regards,
Marek Vasut

