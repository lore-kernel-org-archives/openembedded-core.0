Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AFFC71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 17:10:31 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.969.1693242623839741889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 10:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LalHzllq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37SHAJQf085661;
	Mon, 28 Aug 2023 12:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693242619;
	bh=hs1+6B5345kpZrVzgAqpAkHY09/DelxixChsvjjnAqo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LalHzllq4rapxmVtGsa5WtXnT8VKCG4Y/vLbTtYUqu93MAo064LJlaU671gAcOGsF
	 a94kuRB1bWyBNejXHur7uycTkUxhfL8v7jM+cLd5JZM4JZMGtLGuCI/+KHaRgI66Q7
	 VecTbs3qJv7ptVJ4tP/MWNFvfD4ecXpVbLjV3Nzg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37SHAJGw089440
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Aug 2023 12:10:19 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Aug 2023 12:10:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Aug 2023 12:10:19 -0500
Received: from [10.249.36.124] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37SHAJ6F040427;
	Mon, 28 Aug 2023 12:10:19 -0500
Message-ID: <f81f270d-709f-01ce-97aa-785abb75d872@ti.com>
Date: Mon, 28 Aug 2023 12:10:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit the
 default dependencies"
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Max Krummenacher
	<max.oss.09@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Max Krummenacher <max.krummenacher@toradex.com>, Randolph Sapp <rs@ti.com>
References: <20230827080953.2005190-1-max.oss.09@gmail.com>
 <DB5PR02MB1021304FFF37BA67288997ADDEFE1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <DB5PR02MB1021304FFF37BA67288997ADDEFE1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 17:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186838



On 8/27/2023 4:23 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Max Krummenacher <max.oss.09@gmail.com>
>> Sent: den 27 augusti 2023 10:10
>> To: openembedded-core@lists.openembedded.org; Peter Kjellerstedt
>> <peter.kjellerstedt@axis.com>
>> Cc: Max Krummenacher <max.krummenacher@toradex.com>; Randolph Sapp
>> <rs@ti.com>
>> Subject: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit the
>> default dependencies"
>>
>> From: Max Krummenacher <max.krummenacher@toradex.com>
>>
>> Hi
>>
>> With commit d1d09bd4d7 ("bin_package.bbclass: Inhibit the default
>> dependencies") applied I'm getting a lot of these errors, i.e. qa
>> does miss libc and compiler provided libs:
>>
>> ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
>> /usr/lib/libusc.so.23.1.6404501 contained in package ti-img-rogue-umlibs
>> requires ld-linux-aarch64.so.1(GLIBC_2.17)(64bit), but no providers found
>> in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
>> ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
>> /usr/lib/libusc.so.23.1.6404501 contained in package ti-img-rogue-umlibs
>> requires libc.so.6(GLIBC_2.17)(64bit), but no providers found in
>> RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
>> ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
>> /usr/lib/libufwriter.so.23.1.6404501 contained in package ti-img-rogue-
>> umlibs requires libstdc++.so.6(GLIBCXX_3.4.14)(64bit), but no providers
>> found in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
>>
>> Reverting the commit makes the build pass, alternatively adding
>> to depends in the recipe which is using the bin_package class
>> fixes it too:
>>
>> DEPENDS += " virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
>>
>> I'd prefer reverting removing the default dependencies over fixing
>> each of the recipes which do use the bin_package class to actually
>> install binaries running in the target user space.
>>
>> Any opinions?
> 
> Bummer. I guess we will have to update our recipes individually
> instead. :(

Was there some issue that your patch was seeking to solve?  There was 
not much explanation in your patch or discussion about it on the mailing 
list before it was accepted.

Or did this just seem like something to do since this class doesn't 
build anything?

Just looking for background.

Your commit is also the source of another error with this the same 
ti-img-rogue-umlibs recipe that I've been trying to track down all last 
week.  Max just beat me to finding it.

I'm voting to revert your patch unless there is compelling reason for 
your patch.

>>
>> Max
>>
>> Max Krummenacher (1):
>>    Revert "bin_package.bbclass: Inhibit the default dependencies"
>>
>>   meta/classes-recipe/bin_package.bbclass | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> --
>> 2.35.3
> 
> //Peter
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186807): https://lists.openembedded.org/g/openembedded-core/message/186807
> Mute This Topic: https://lists.openembedded.org/mt/100987453/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

