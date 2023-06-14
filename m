Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A31EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 15:11:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.15106.1686755480115242035
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 08:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SpY6720F;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EFB9cr122993;
	Wed, 14 Jun 2023 10:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686755469;
	bh=gKdeei2QPydWMEYQmN7Z/nJ562XC/DCMTAjlQsMvDZU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SpY6720FG1OiewHQd3gJFijJezveFKLE+i/q15McJzd+r/pakr0X9EcqW/8dtORER
	 l5otTKuEGCBi1NjB6G8AU4rDhJGpVLiRiFati4jGq5iCTu2FQRmHBxeJmaoeNGVnZE
	 +zXbv8vf6r2PfYjHanvaL3lHxY1m0f1A+JyQ5N7A=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EFB9rm107467
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 10:11:09 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 10:11:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 10:11:08 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EFB81O099749;
	Wed, 14 Jun 2023 10:11:08 -0500
Message-ID: <66ca0de4-b51b-4a73-fd4f-4b0a7df77fc5@ti.com>
Date: Wed, 14 Jun 2023 10:11:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] Re: [OE-core][PATCH 4/6] weston-init: fix the mixed
 indentation
Content-Language: en-US, en-US-large
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>,
        Peter Kjellerstedt <peter.kjellerstedt@axis.com>
CC: "reatmon@ti.com" <reatmon@ti.com>, "denis@denix.org" <denis@denix.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20230610011339.3716428-1-rs@ti.com>
 <20230610011339.3716428-5-rs@ti.com>
 <DB5PR02MB102136F50D6C9E9121C9FD08FEF57A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj99QKDuDc7oPaytFOUAeaiSL9y6WMT2Dmo5nLUTNNOLKQ@mail.gmail.com>
 <DB5PR02MB10213D04533C11ED783E5335AEF54A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj-UnVQmJYeYY=zHq2xEKXZXoSNJtraAor1HEkdGVqJFGw@mail.gmail.com>
 <176801038AB94927.4582@lists.openembedded.org>
 <a834239b-83d7-11cf-3ecb-c2ef53b8e6ab@ti.com>
 <8d570279eb2f9832a1576a1aeeb79098a0cba175.camel@linuxfoundation.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <8d570279eb2f9832a1576a1aeeb79098a0cba175.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 15:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182815

On 6/14/23 03:08, Richard Purdie wrote:
> On Tue, 2023-06-13 at 20:16 -0500, Randolph Sapp wrote:
>> On 6/12/23 14:46, Randolph Sapp via lists.openembedded.org wrote:
>>> On 6/12/23 05:05, Alexander Kanavin wrote:
>>>> On Mon, 12 Jun 2023 at 11:58, Peter Kjellerstedt
>>>> <peter.kjellerstedt@axis.com> wrote:
>>>>> Well that is of course an option, but then it may get messy if different
>>>>> people have different preferences and start changing the indentation
>>>>> back
>>>>> and forth...
>>>>
>>>> I suppose changing indentation needs to be justified by for example
>>>> achieving consistency in the same code block (as it does here, which
>>>> is fine), and it never should be mixed in with functional changes.
>>>> What I don't want is lots of empty code churn that doesn't actually
>>>> make things more readable than they already were, and is more or less
>>>> an exercise in pedantic neat freakery.
>>>>
>>>> Alex
>>>
>>> I frankly don't like the concept of mixed indentation in the same file,
>>> let alone the same code block. The only thing really driving me to
>>> change it here was the lack of git attributes to define the project
>>> standard, nvim is attempting to enforce the 4 space standard from python
>>> over the entirety of bitbake recipes (which I think is fairly sane), and
>>> the variance of standard in this code block.
>>>
>>> I have no preference. So long as there is a standard, I will bow to it.
>>>
>>> Randolph
>>>
>>
>> I noticed master didn't pick up any patches past this one. I take it you
>> want me to reformat this to the current tab shell block standard?
> 
> Yes please. I stopped there since at least at a quick glance it looked
> mostly tab indented and this changed it to space which breaks the code
> standard for oe-core. Whether we want to change that isn't something I
> have the time/energy to get into right now. If I take it, I'm opening
> the gates to many more such changes. There are views on both sides and
> people get upset about various aspects of it, me included.
> 
> Cheers,
> 
> Richard
> 

Alright. I'll fix this up and resubmit.


