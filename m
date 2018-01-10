Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 81499 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Jan 2018 19:11:59 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0070.outbound.protection.outlook.com [104.47.40.70])
	by mail.openembedded.org (Postfix) with ESMTP id C7BA878199
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 19:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=H53nLN2GdRoXhoolUb9XKq3mWU/rqwnNY5xdMK0ToqQ=;
	b=ZK25eNReGLQB4vu31DsvU/gcNq5hR4D3oIQDv4M92Cv0kgMbkn0FtzxBJPIX57/gV+gTm2cZk5j9jgsRooWVQdAI9XHxv40NYQPjuyLgGwptFKGwm7qZ+4w+pYwZ27+HVrt55IH165JnzuBdyOIWNf9hTskS1P7n/V8Hvr6Yt2o=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (71.35.165.30) by
	MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Wed, 10 Jan 2018 19:11:59 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
	<20180104131238.21452-2-alexander.kanavin@linux.intel.com>
	<CAJTo0Lb4YRsAknNGhzc_dqGS7wJgFzxL_siyqQAGJ=9Wy7Cm+g@mail.gmail.com>
	<0ff515da-6221-7074-11c9-96b1cb8380ba@linux.intel.com>
	<64c07649-f0df-9acc-fbf3-e8f6a52db9f1@xevo.com>
	<1515610131.29722.112.camel@linuxfoundation.org>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <9a261bf7-62c9-2aa9-9fa2-d27bb6ff7653@xevo.com>
Date: Wed, 10 Jan 2018 11:11:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515610131.29722.112.camel@linuxfoundation.org>
X-Originating-IP: [71.35.165.30]
X-ClientProxiedBy: MWHPR1201CA0023.namprd12.prod.outlook.com (10.174.253.33)
	To MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 574e17ed-bbc6-494e-b9bf-08d5585e0620
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
	SRVR:MWHPR0101MB2944; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	3:FbkrVTZT4RIGCSH6NXJmRHVI2MvN4URa4+R5PhglKWNpt0XqQzfWJqTGiOoSUiAdLaVa/dZEbmeK/bfhRIXLyL3rMpBgCFfsV+8CNQ2CxSHFw8eSU6wh6GCu1oTHfEkcatKpytn/b5w3pKp0sIyuT/tGTSFIJYk9V4IZHG7XFB4iALXWxGZKfAS4gfqVCBipE6NFvO6/Yj3+mpSboSnE4a78hq0vnvSDD9QlDA+ziR2VPjTaHlOt2towYzwDQM5m;
	25:QTxy8G5UzQRYQ8R91dIzdFl71MpWvdJDgzA28nzoy+X9VJLpIX+NkNXgcBhpKXWkpoebGzL9HtT5gKl1Ltng4HEmN9FNoFnBLQKB3UlEL8XFe930z609HCpOvmeB4+ki9dQLTypNBUppN3OCZy4uTwQtZaX3hdSvnf/2TPi+RN7cpUpCod9pAs+LA8B+dMNfD0IkN8atKSn0M+rsA/McVKKOmJpjbHCBmwenWeEV/0XyyNpT/9AL55G/ccj8SGQhzGzPfTRYpY3nf+wPKm/eB/KH/sfIMl2WutWCNewFaf2FQgBFYWOgYAmpyJGyYGdc7nS6S+0BtVW0RtGjAeOmYg==;
	31:N2DUp5YhX1M7pIbNxzHS0erUfsiefyEolOVHsXLWLZSpSG66/1QVsqRg0AH8/VF3INqKTUmaoNDFOjhvIF09BV6vu19EBsnMXR4huctX/fkz/qd2y3f5tzl5l4jQ08/OD6OSHX5SyJ+PWYUiABC967AtSb6+lOlwSf8NJn+8i1q6G09xPTDV6gafY/UyjgWSdslc5hI+QjuJxX8lJZi8FhA3qBb2n42zQDzZ0nZ9N0s=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2944:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	20:SmYkFIaks/Ah0s67SGvBX7OqVVc8tYpDTtovGKAZyYkCmROcHArrz6u08WTYfVvSQkVYfOA7v2RhEwkpeY5M4+nehgZmuPWvZxgS+zv//tQAyYwDHlM4GaWGMqznqn4qovVzn21R/SUAsTT83wufSvEI09NHvVyfLsEpmaRQPNu64j0GlR5qHXSZx9bhxDqyAIgM2YHO4Q4kHvJaaRRymIZRsng5zxc/JEF5fcuCugPtqsxWGrmZJML29tnEDxm8VrBaiZSZd8+quxZhICPGZPZYzepfoSoCAqlfrVbskzy/Unwemey57OUktFsdf53o2COLn/rRp8h/85tkhF6C5HtEefs4Ve0n46RDQcy0rLiBwCCs44R1PUzjAHYHWVcRUCkotcjdoUW9KErAmS7bMIV/9WSHtPXkZXSt1quw6J8=;
	4:kN6ncmKKYN3A0NIKoN/RRHbvIU5tQrtF1TmWwCIVe4OBhwO5OgEbDe2nPf2VT0Ckaj0+EZwD0yoyoYx5gawCnFbRTE7rZ1yj39fgr7/sS0c69AFl1zlFlYhVF9jK3PIimjkYdN67CLbs9INj2tJkG452cffwIhL/+KchL/VCxHqq8QEGoGhI+BWlyr2+NsOLu6nUCxwiEWXnqLVX2FDEzQEGvc+axb+bmsVUqATYiedXDjFbyNCfOjWrRFf+eEJmaE/qLzbaFZS0RR+wP83MzA==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2944854819E266066CEB6EEFAB110@MWHPR0101MB2944.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3231023)(944501075)(10201501046)(93006095)(93001095)(3002001)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:MWHPR0101MB2944; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR0101MB2944; 
X-Forefront-PRVS: 0548586081
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(39850400004)(39380400002)(396003)(346002)(376002)(366004)(377424004)(189003)(24454002)(199004)(2870700001)(77096006)(31686004)(2486003)(67846002)(53936002)(105586002)(76176011)(52116002)(86362001)(53546011)(478600001)(6116002)(386003)(3846002)(23676004)(52146003)(66066001)(65956001)(47776003)(7736002)(305945005)(6486002)(65806001)(90366009)(64126003)(229853002)(81166006)(81156014)(8676002)(83506002)(8936002)(110136005)(31696002)(2950100002)(5660300001)(36756003)(6666003)(16526018)(316002)(16576012)(117156002)(65826007)(4326008)(93886005)(106356001)(6246003)(2906002)(97736004)(68736007)(50466002)(58126008)(25786009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2944; H:[192.168.0.3];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDQ7MjM6Qm5EV1pXZHp1SHc4dUgrWVprNm93Z1c1?=
	=?utf-8?B?UDgwTVIyaUgrRWdEWitNUmxzZit6ODdndjZJQUYyN0lwYS9ZQ3pTYXhYSDU4?=
	=?utf-8?B?Qk1RNGxOVXNUR1dmbE5VWVhMMHQzaUxpb01OcXRIUDVobGdjRXBqcjIvTGtv?=
	=?utf-8?B?dDhzQm5RZjZGSk9DekhRK0FGUHFCS3JqeHBJM2xOaXdxYUo5cDNuNjJQQmZr?=
	=?utf-8?B?Y3FVdGI2clBzME9iWi9LL0ZFOWd5OHBPMHQ1d2luLzFldmNkWUEyNllNYWhw?=
	=?utf-8?B?ZE5tVUQ2VzA4TnkyNkY1b0dtdWJiL0FTaFhEcnJCMVM4SGRsNzM5a1JrSTcv?=
	=?utf-8?B?dDJRQW9SMFdkNVNodHZGbUFGN2RiOVpUZGxxTjI5ZmlRMmwzZ3Z4TjFnalBD?=
	=?utf-8?B?TDZxejRyWHN1blZPUTY1b3ZmQkV5TjN0TUtGSDlidzNxMldwNVBNZWRHWjJ4?=
	=?utf-8?B?TG4wWkY0Ujkyb295TFk0emQxVWpJQldOaTBxSlZzMmZZMVF5WEk3OUxQWjhX?=
	=?utf-8?B?Q2x1a3p2RmlQaU9BLzJNbGYzdll2N29YOTJNZjZyQzBrcTQ5OTBOVE1UN1BB?=
	=?utf-8?B?UlVIcm9xR1pQaG0wN1VUc1VQakhjMkg4RnhOckt0TWpCS09nbGdrZFZORW1M?=
	=?utf-8?B?Q01IZi9leklUZkZGMys1SmRzYmU0VEt5OTVGemhkdDFVUTV0dmROYmVCUXhD?=
	=?utf-8?B?NnNtR0ZXOTVpTzZ3T3NvQnJncy9rWFNkelFtYUNUaGpzcjZHQ1VETkFGRGlv?=
	=?utf-8?B?aUtlbnBPTGVQMUFNZC8xWWRhZWM2WWVoWTZQQjFwTmlqTnAyTm8ySlpHMUlL?=
	=?utf-8?B?QjZPM2xYZ0xZLzRRNFN5S2s1eVlMWG1ya0QwdDNVbXozeWl3eGRWSk5aUFh0?=
	=?utf-8?B?TnJLK1dGTnVlTVYyRDUzb202TzJDQkFZbkxRNHhod0VpUHFFSUYya3hqdnR4?=
	=?utf-8?B?UzdDOVFHM1hzUGd3MU1IcWlrUlJZOXZtWjl6YXEzUTd3dWFFRUNjRDgvdmVz?=
	=?utf-8?B?RVA1OXNyZmdqQWg2RUZRbEkzNmMwWWYybDN5Yk1jM0JjOHJWRGV6clJoWUh5?=
	=?utf-8?B?cHVRaVlTRW9wbHVyL0pEcDYxdzNyYkpQNjdEOWVOWFJsSU4xeG5LeTdhYlJ3?=
	=?utf-8?B?V2xUYkZmNVlySjFZUGxDY3h2MlNiVC8wQTBOZzg0OGpSbEw0cTlleEJ2dng0?=
	=?utf-8?B?T0NVQVNkV2d4Z3puZ3ZrSGYwK0ZDSDcxKzl0aUJwcFFTd1pGVVZaS0l6WHBy?=
	=?utf-8?B?b1lEck1tVjlZNlhoU0FGdGVNK1dIQXBsOTY5Wm9wUnZxWktTUktQWTAzWHhR?=
	=?utf-8?B?MzBMSG90MnJqWHlndExDWWs5akFLT1g2dkRhTVl4dHVLbENUV2Rlbk9ObDZH?=
	=?utf-8?B?UzBEUC9QZFVjdkRGZXRlRm16MC93ODhIVW9mOTVkZm0zdy83MDFxbm9hcUh6?=
	=?utf-8?B?QjJEeVpzbjAxdGZ1NmNxYmMzRXYwS2dBanYyblRtanh6YVh3cDZkQU9sQmx4?=
	=?utf-8?B?K2lnT05LV0plcHVtalhkRjQyM3dURTAxRVFWbWplZ2JtMDMrbUlneVpZdGdQ?=
	=?utf-8?B?Nks5NkVlZFh0L1luME9zYmRPRjlKMUdYOGIybmEzLzVtZEdCc3RaMlozcmJ3?=
	=?utf-8?B?RU1DMllJRHlUQzBmakdJNk9FRzU0MkJtR3l0cE1mRkpmN2h5R3RpclRCRkVI?=
	=?utf-8?B?UDFWWkQzK3AvbnJhTzhMZUUwM3ZWeWtxNnRhMG9KMnZSdU1VaThaSVNwUEsw?=
	=?utf-8?B?ejkvVjQ3MUFhMlpWYmNwUCs4aUJrU29rQkdhVFB6OTlqaHd2ckJVREpSSDZL?=
	=?utf-8?B?QWtGZW4zbzFQRnZPLzJVdkFwRjBLK3FUcFU1Vk0rbUJ4bVZBc1dUNnpxeVA3?=
	=?utf-8?B?R2laR1lOeUxkTEZnSjJKUVNyVnBlTDdITDFBWHN3ZHYzZFFLajlhMHMwMFBQ?=
	=?utf-8?B?TFJsOVBpLzk5S3JQZ3M2OUVqRkxuMVBwMmhySE00WWFBUzhRZVpXQlBha3ho?=
	=?utf-8?Q?7N5bJVdp?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	6:sUqwNUabhE5zbrIKOZ3ip0Rdpb9RkX759KN5PfKweXouj4il7xHuE/jbzCsJ7tqM/F5lU5wkKaP2KAJZduEXxZfjHVkzOMJBB99BqCq8ropF5DUWE8WPHQf/7dcLFRWmy63mZYN6tqzpfuGq+KH/ZPH2hJeAdlsSsipnvgOKraAOgA/sc0ESAuXkxul58gAJ0gWnykMiy15wkSaF+dlQRRZlU9NoPFmlSkniijHwtUotO/J9sTLatzvDyr+jdSS7nCxc1FGMNOGPTt3t/Q9SP+65ucNDliQ84HA6k6ijnsgLKaEZS20TX7U0rjtHt84TxeT+wUetHq/X66VSE74oEecpSvrKOgIWhsqfjx1mroI=;
	5:KhgJtQg4z/1+S/vOJyHjYJmVwzGfHKWxdpPaq5GJarYFyMzz2sPjpw4M2qDvEfI6d3I3EZ68FhM0g6fSwrB6eCC7Hej6AuBXSA/RKkQHzI1y6n1VRpLB4N6GBZ/ilwZl/lRUbooezfQLG1/QpVePEfLn26zVEtYP0p6av7QhfgE=;
	24:NQlhghwnE5s6A8ZlU5Ie7Xu5+5dODmx0PcGIFnDIRH6jxI46v8RIXUMpxlx3niKRlNEUD+b8vjsy0D/K5o59QsE4Pa6r5YPMnTV6CCFoxUI=;
	7:m7HV/m5MQlaAnSFizSKgfuWcv+siDdQ6v1s/izUilxIJFLKYDnCw3VHIOZAkxXbUOa5Y/XbYggCUdUwCAcAgtEweFY7BwvEKCZI3hV+ac5OrPtdeuym060Usa5IvK++RG+Cy1gYsuwAPpiaV62k+nmLHlDoMRvDJGB7lDb+HxHqJnuoLyP0AsVLW5mAIfjaXJOqg1Rqi5ewNnLVIjzKiVf8+SBsSBK7aMXAejvcGFt1KxPtMBKP8FIunJvAYsY/Y
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2018 19:11:59.4833 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 574e17ed-bbc6-494e-b9bf-08d5585e0620
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2944
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] gnomebase-meson.bbclass: add a meson-specific version
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
X-List-Received-Date: Wed, 10 Jan 2018 19:12:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/10/2018 10:48 AM, Richard Purdie wrote:
> On Wed, 2018-01-10 at 09:55 -0800, Martin Kelly wrote:
>> On 01/05/2018 06:57 AM, Alexander Kanavin wrote:
>>>
>>> On 01/05/2018 01:47 PM, Burton, Ross wrote:
>>>>
>>>> Do we even need gnomebase-meson with this?  I can see a future
>>>> where
>>>> GNOME is entirely Meson and then we could just switch the
>>>> default
>>>> GNOMEBASEBUILDCLASS from autotools to meson.
>>>>
>>>> (prior art being the tarball compression type)
>>>
>>> I'm fine with this. Just so everyone else knows: RP has actually
>>> made
>>> the change already, and merged everything to master, so the YP
>>> supports
>>> meson as a first class citizen now.
>>>
>>> Alex
>> Technically I'd call it a 0.9-class citizen, as the SDK doesn't work
>> yet
>> :), but still a whole lot better than 0.
> 
> We'll get there and patches are very welcome.
> 
> Also *very* welcome would be some SDK tests which illustrate the
> problem so we can a) fix it and b) ensure it doesn't regress again!
> 
> Cheers,
> 
> Richard
> 

Yes, to be clear, I'm not griping, as I'm very happy meson landed in 
OE-core, and I'm working on SDK support now. I have an OE-core thread 
going with meson upstream to get the issue fixed.

To be clear though, I'm not sure it even regressed. AFAICT, it never 
quite worked.

Where would I add SDK tests for this?

