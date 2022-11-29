Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A976C4321E
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 14:09:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.150571.1669730988887494720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 06:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jtAc0RU+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2ATE9iip118332;
	Tue, 29 Nov 2022 08:09:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669730984;
	bh=bsQPG0TtbD56uexzAG4GH1ohco+zqYmAQ48oCzj3ofA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jtAc0RU+hFmUfBWbvmMyDMe5jKOsWqZpqgkiUFpR9YdDibUTNu4MQAxZarHZpLlOd
	 NPq0nADvW5V1+NH1pscQ4JurzfE9u0CvkOOVlT78BmVtG2+CiQ5P9C9gwFBCfigEW2
	 4x56/wPOqt41/Vwk9W7aYkEJi4HnWFUkR+LcBua8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2ATE9ik4014277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Nov 2022 08:09:44 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 29
 Nov 2022 08:09:43 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 29 Nov 2022 08:09:43 -0600
Received: from [10.249.37.150] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2ATE9h26124951;
	Tue, 29 Nov 2022 08:09:43 -0600
Message-ID: <31fa9e9c-25a8-b1dc-a269-04ba3c135545@ti.com>
Date: Tue, 29 Nov 2022 08:09:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [OE-core] [PATCH v2][master] go: Update reproducibility patch to
 fix panic errors
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20221129122302.14589-1-reatmon@ti.com>
 <20221129133601.GQ22689@denix.org>
 <CANNYZj9PLN=YmbCzn9YEmFhr-uvt5gXpW-qgYKytWNe8jLER1g@mail.gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CANNYZj9PLN=YmbCzn9YEmFhr-uvt5gXpW-qgYKytWNe8jLER1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 14:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173972


I'll send a v3.


On 11/29/2022 7:44, Alexander Kanavin wrote:
> On Tue, 29 Nov 2022 at 14:36, Denys Dmytriyenko <denis@denix.org> wrote:
>> Should be specified here as:
>>
>> [YOCTO #14976]
> 
> I prefer both. Clickable links help.
> 
> Alex

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

