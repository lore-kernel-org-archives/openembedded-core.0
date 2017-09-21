Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id C66AD600EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 20:32:21 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id b70so3757970pfl.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 13:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=bEYiQGzAYn0URXZahi4Y0hFYLLuMX8zbaW/MfGmF6og=;
	b=OGGxgVM9+KD5yPtYicqQb+Th2KYsjlhRb295Ofvq+ak5pP/ZpKuP9hzOaDE+pE3mXj
	Od57o1zsbvfdQ7+3hVqte0dXzfgoNUUoTaYYo1vg47lCHylcNzqDJNcXPhBAY+12DknH
	RimvyIliYzx0WOCEuWcn6z/4YgwexudfMWJPMihVgWyPOEBmZQiv3JbDfByaWESLPD02
	KzKBJ0Wvdy72bGQMqU3vkSEeLiUQ2yuBZXIfFsPBMh0r39uo3FNjhcWdFwP5iI/GVxy4
	LRFEhbXLBCSIt6p/hM8q9ZloqCOGoKwh9412hVuSO/FidGa3G2fiRRHx6I6+VlAVjIer
	YBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=bEYiQGzAYn0URXZahi4Y0hFYLLuMX8zbaW/MfGmF6og=;
	b=p0neFQD2WCsiV8N+33Yq1cyAKo6epKfRR291v0o05pTWaaBVNe6EEGDypzuM63qTsx
	ziE46aSfxV7q2nC15PtLltO8Pm2jMFT3ex5dt+t1p8EbqORvVFQhxRyi6TBR7naF1yg7
	P9Sa7iaYH6xTBm+Mu/+J9Zl8Iw5ZUM6kuyXKsrgb5f2A5a1Mwsq7aoywo8tjwb0j9TKA
	PwlYWam6e1Lh2Y7mNaRIlsGsahKb4HXWIh5pAEiIUtIizmbbs8fLKjAwBbiF5e64ESPI
	RQxLxxAJwhJUcqlCRMSXBaJq3H9m17OfxVmh0YYIM+IEUw03IdPf2s1h6H+zlJI9ZqAO
	pHoA==
X-Gm-Message-State: AHPjjUhK39aZV2n36IwlfTaKNMH2piJmO7R8Uk5yQQzrGLSqKov0aCyj
	ZNcA7m+eAgsS45HPaJNvMFtNMA==
X-Google-Smtp-Source: AOwi7QD1ASA60yEvCioM99fYgaz7Ni3n84Wztdfj/GZD+Em0u74cWUICxzB5YureDnOww77ES4klYA==
X-Received: by 10.98.80.85 with SMTP id e82mr6937972pfb.265.1506025942504;
	Thu, 21 Sep 2017 13:32:22 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:6413:eafd:1152:fa5c?
	([2601:202:4001:9ea0:6413:eafd:1152:fa5c])
	by smtp.gmail.com with ESMTPSA id
	k195sm3930287pgc.4.2017.09.21.13.32.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 13:32:21 -0700 (PDT)
To: Philip Balister <philip@balister.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Trevor Woerner <twoerner@gmail.com>
References: <37a76fa5-4f25-56dd-9616-4b4b23fbb093@balister.org>
	<CAB=otbS8_F_Yhisc+ybm8X1m3GXBzCK1q16YjrWATDArwVf+Hw@mail.gmail.com>
	<bdabbc35-fa12-55ae-5387-54da9204fd55@topic.nl>
	<CAHUNapRuc6RHNZXHGdN0TO2A0EwRgkT53bqqqM-DcwqKzUz55w@mail.gmail.com>
	<9e86f719-bcf9-132e-3a82-8c924385710d@topic.nl>
	<646f4edc-ff9f-7f2e-37a7-260cbd2af60d@balister.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ab1501ba-e625-61ac-c6f5-ce676531a473@gmail.com>
Date: Thu, 21 Sep 2017 13:32:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <646f4edc-ff9f-7f2e-37a7-260cbd2af60d@balister.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenEmbedded Developer Meeting Oct 22, 2017 in Prague (before ELCE)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2017 20:32:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 09/21/2017 01:27 PM, Philip Balister wrote:
> On 09/20/2017 01:50 AM, Mike Looijmans wrote:
>> On 18-09-17 18:25, Trevor Woerner wrote:
>>> Hi Mike,
>>>
>>> On Mon, Sep 18, 2017 at 8:45 AM, Mike Looijmans
>>> <mike.looijmans@topic.nl> wrote:
>>>> I can probably bring some work (e.g. Zynq MPSoC board) and fun
>>>> (settop box)
>>>> hardware along to demonstrate what I'm using OE for.
>>> Any chance you could set something up that could be on display at the
>>> Yocto booth during the conference?
>> Depends on what I'll be able tug along in my luggage on the airplane,
>> but whatever I can bring is probably suited for public display. A few
>> circuit boards will certainly fit, so if the stand could provide a HDMI
>> monitor (or TV) to connect them to that'd be awesome.
> I'd love to see some different things on the stand. Make sure you help
> explain to people why the Yocto Porject and OpenEmbedded are important
> to you and your product.
Philip,

Since you are the OE rep to the Yocto Project, can you make sure this is
OK with them. There could be space  or limitations at their booth.

Thanks,
- Armin
>
> Philip
>
>
>
>> M.
>>
>>
>> Kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>> TOPIC Products
>> Materiaalweg 4, NL-5681 RJ Best
>> Postbus 440, NL-5680 AK Best
>> Telefoon: +31 (0) 499 33 69 79
>> E-mail: mike.looijmans@topicproducts.com
>> Website: www.topicproducts.com
>>
>> Please consider the environment before printing this e-mail
>>
>>
>> Visit us at the Space Tech Expo Europe (Stand E-71)
>>


