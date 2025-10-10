Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCE5CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 18:56:52 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1680.1760122606756187462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 11:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DxVIPf2Y;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59AIugZ9827365;
	Fri, 10 Oct 2025 13:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760122602;
	bh=+Hpk37saqFp4Rj+G9OvFftjDn+X3mmVbpFOqWzh0OnI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=DxVIPf2YY6QhhvZ6E/cm0fCZTkx+alDaC7+iVAbZ3ByCsTNEa/90WtLiu19TnHppS
	 jJv0VetTQwfx5FbPtuLmg7Lk25sIwhJ8cGYoZOblNs9eXRSI//XUknEfRLN+ZshsLh
	 4UWThRLNHFO2zc5XUeavWlCX1R3OzRPAf0UxcE2A=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59AIugLf2409261
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 10 Oct 2025 13:56:42 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 10
 Oct 2025 13:56:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 13:56:42 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59AIuf8W2089460;
	Fri, 10 Oct 2025 13:56:41 -0500
Message-ID: <0b6a2828-bd9b-4225-b071-72337911715c@ti.com>
Date: Fri, 10 Oct 2025 13:56:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v3 3/3] linux-firmware: Set FILES to ""
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20251010160842.28715-1-reatmon@ti.com>
 <20251010160842.28715-3-reatmon@ti.com>
 <DB5PR02MB10213DF753E3F85BCEA448E74EFEFA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <DB5PR02MB10213DF753E3F85BCEA448E74EFEFA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 18:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224705



On 10/10/2025 1:55 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Ryan Eatmon via lists.openembedded.org
>> Sent: den 10 oktober 2025 18:09
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core][PATCH v3 3/3] linux-firmware: Set FILES to ""
>>
>> Now that all of the current firmware has either been moved into
>> sub-packages or removed due to licensing the base package is now
>> empty. Going forward we would like to keep the base package empty
>> and force the version updates to bin any new firmwares into
>> sub-packages.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v3: Split single patch into three patches, and add ALLOW_EMPTY.
>>
>>   .../linux-firmware/linux-firmware_20250917.bb             | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
>> index 4efdc73a45..9a12f45435 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
>> @@ -3311,8 +3311,14 @@ LICENSE:${PN} = "\
>>       & WHENCE \
>>   "
>>
>> +# The goal for this recipe is to creata bunch of breakout packages for the
> 
> creata -> create a

That's what I get for typing too fast and not spell checking.  Do I need 
to a v4?


>> +# firmware so that you can choose which files to include and not have to pull
>> +# them all in.  To that end, we do want any files to be part of the
> 
> do want -> do not want
> 
>> +# linux-firmware package.  So set it to "".  Do not change this.
>> +FILES:${PN} = ""
>> +ALLOW_EMPTY:${PN} = "1"
>> +
>>   FILES:${PN}-license += "${nonarch_base_libdir}/firmware/LICEN*"
>> -FILES:${PN} += "${nonarch_base_libdir}/firmware/*"
>>   RDEPENDS:${PN} += "${PN}-license"
>>   RDEPENDS:${PN} += "${PN}-whence-license"
>>
>> --
>> 2.17.1
> 
> //Peter
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

