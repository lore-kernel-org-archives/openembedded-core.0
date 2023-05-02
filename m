Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8F8C77B75
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 23:54:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6889.1683071649768071899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 16:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gBm5d4W9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 342Ns6kb101011;
	Tue, 2 May 2023 18:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683071646;
	bh=TMN2o0dliwi/j4j7b+6HeIydYGq82OZfeO3dmrUq8+I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gBm5d4W9pFhOM40WzLJKljGppcF5+oD8t+s/uZAII27hgw8/AHF3K6y6WjhkY+8NJ
	 xNRNps0i2ICdYSgWBz685fVLWDcf+m4a/6YT2cuOjSWIZuliHxSWpjc4+7FmBQL63N
	 otXcFBxpv4Z8OhN+mJcAHSK4VFcVJrF1T0HnT1D0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 342Ns5WT020096
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 May 2023 18:54:06 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 May 2023 18:54:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 May 2023 18:54:05 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 342Ns5Bo080776;
	Tue, 2 May 2023 18:54:05 -0500
Message-ID: <71751fb5-f4e4-bd90-f104-12169245f36e@ti.com>
Date: Tue, 2 May 2023 18:54:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [OE-core] [PATCH v2] wic/bootimg-efi: if
 fixed-size is set then use that for mkdosfs
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>, <p-bhagat@ti.com>
CC: <openembedded-core@lists.openembedded.org>
References: <51022390-b911-5b8c-36bf-3ddb13263826@ti.com>
 <17864.1682500019497210025@lists.openembedded.org>
 <20230502230233.GF9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230502230233.GF9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 23:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180779

On 5/2/23 18:02, Denys Dmytriyenko wrote:
> On Wed, Apr 26, 2023 at 02:06:59AM -0700, Paresh Bhagat via lists.openembedded.org wrote:
>> Hi Randolph
>>
>> I tested your patch in my local kirkstone build for am62x. SD Card boot is working.
>> Boot logs here: http://serenity.dal.design.ti.com:7777/ewakutoqom.yaml
> 
> This is an internal-only resource ^^^
> Since you are both TI-ers, don't you think there's a better way to communicate
> this information rather than using a public mailing list? :)
> 
I was hopping to get a tested-by tag here but I guess that was lost 
somewhere in the communication chain. I already knew this patch worked :)

