Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFBAC433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 16:24:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.20853.1636215853691377797
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 09:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=jQEUsEIZ;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 39C5483702;
	Sat,  6 Nov 2021 17:24:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1636215850;
	bh=g/aHTWJpPw7SxNT+qLB3IayvfqPQW69zb/Tco+8/d3M=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=jQEUsEIZOyU9gOmGBeg6uvbDrbgDj0X6wi/+cvCzSsCIIjlp+0G1W36dx6RMS/J6B
	 FB02l7eFAOTwZ5R4qzUlVmEylvRIdYcK0tUOpWTwEUEwEM3gBD/ljmMDPkEUwCzVJj
	 LOw95SOxZ43L2SOD51PztXrpc4M6sJNs09lFKiu9ldi4efMLGaohptwcp9opBFxqEC
	 S8FN3Qh3RbEqcOnxLA85+d8/ukgfwHfB4CLk6LjwwSXcpS09LSXeufW1XkSqwDVmWx
	 sH0vOt7T8IRKUFfKdntyBmvtk/OwP0k9/9HaPLqpsbqsXVxwDuKkIq/mBPqg22B/n3
	 xnnv7RbZjyeZA==
Subject: Re: [OE-core] [dunfell][PATCH] piglit: upgrade to latest revision
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Anuj Mittal <anuj.mittal@intel.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20211106125915.13227-1-marex@denx.de>
 <CAGDS+n=4kaGR8_3QmAEopN+paMnBPPXfFTTuK2nujrXM_tqEFg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <d1cb91bd-3bf3-928f-d57c-be677220ebf5@denx.de>
Date: Sat, 6 Nov 2021 17:24:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAGDS+n=4kaGR8_3QmAEopN+paMnBPPXfFTTuK2nujrXM_tqEFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 16:24:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157942

On 11/6/21 5:01 PM, Steve Sakoman wrote:
> On Sat, Nov 6, 2021 at 2:59 AM Marek Vasut <marex@denx.de> wrote:
>>
>> Update piglit to latest git revision and update the branch name,
>> since the original one is no longer updated. Make sure the VK
>> tests are only enabled if VK is also enabled in PACKAGECONFIG,
>> and that this is opt-in, otherwise older systems fail to build.
>>
>> Cherry picked from squashed commits:
>>    eb3a8d4c7b ("piglit: upgrade to latest revision")
>>    a27b06f73a ("piglit: upgrade to latest revision")
>>    bb091bc0be ("piglit: upgrade to latest revision")
>>    394746d1cb ("piglit: upgrade to latest revision")
>>    5aec8cff94 ("piglit: upgrade to latest revision")
>>    fc4c82773d ("piglit: fix reproducibility")
>>    6fbec0f12a ("piglit: update to latest revision")
>>    8d23a0d498 ("piglit: upgrade to latest revision")
>>    5144d515fe ("piglit: upgrade to latest revision")
>>    dd085bd577 ("piglit: upgrade to latest revision")
>>    9ba6df1b2c ("piglit: upgrade to latest revision")
>>    1ccd71eb3e ("piglit: upgrade to latest revision")
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Anuj Mittal <anuj.mittal@intel.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Steve Sakoman <steve@sakoman.com>
>> ---
>> NOTE: Why backport this -- because graphics testing on oe-core dunfell
> 
> I am having trouble parsing the reason.  Could you explain?

I just want to be able to run latest GPU tests with all the fixes in 
place on the LTS versions of OE builds, not some obsolete broken version 
of those tests, that's all.

Since piglit isn't something which you deploy as production application, 
but rather something you use to test your drivers (both kernel and 
userspace), I think it is OK to keep it up to date.

