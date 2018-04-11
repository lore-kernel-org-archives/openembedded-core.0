Return-Path: <Martin.Hundeboll@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0091.outbound.protection.outlook.com [104.47.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 6F03B60191
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 12:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7YA1lG1fxNtQe5/SojOKeEPdNo6E8lFuHqpI5UpHe2E=;
	b=mHAGlm62w5yYdZOnChoDxeKV7wfDgyajsAc5cZ50LvS8B6QihmHqSt6qPMU0ETxR8GtgGCsVCn4o8fC/c3vQMDu0xN/+OjMvm73M5QER2+t+lZdrvufvOyQ6pNtL+1049LvwDKpo9JYOCZuXYDXLAbazrOlvgLL3jGUY6RxfMX0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from [172.16.11.2] (81.216.59.226) by
	DB5PR10MB0119.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:0:15::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.653.12;
	Wed, 11 Apr 2018 08:42:20 +0000
To: yamada.masahiro@socionext.com, marex@denx.de, raj.khem@gmail.com
References: <20180408230223.17260-1-marex@denx.de>
	<CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
	<bf9e9593-a395-8d53-faf8-ad6609aa5ba1@prevas.dk>
	<53904a8f-7ba2-7f09-4e93-a95a780f60c7@denx.de>
	<d89b39f665a14c63b0821c1ad600da72@SOC-EX01V.e01.socionext.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <8cc34667-5bb3-9642-40e2-d56b28f56646@prevas.dk>
Date: Wed, 11 Apr 2018 10:42:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <d89b39f665a14c63b0821c1ad600da72@SOC-EX01V.e01.socionext.com>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: AM4P190CA0022.EURP190.PROD.OUTLOOK.COM
	(2603:10a6:200:56::32) To DB5PR10MB0119.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:0:15::26)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DB5PR10MB0119; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0119;
	3:/6hSObzOJE3VzZ0q7mssiBjELpWI1KjUv/gd/pQ0M+R7auDoQExcZ1tlX5/MusIXKCNoulb1Ddh54pZGgs3lQSbq9KB/xXg/IxQen5Naf5f+QfsPq7b4OWuVd9ft/8UnKhQaeh8Vrg9co7bQUcQ2tn+TSKBYYxqmkKOTGgxXkbjFgt3jLtydLdGEOyhDuL8LHJaT/jvMn8PWuQCI4f4l8rdmtLCemHuLWboyHiflNnmJIdWEclblov+Hem0ZOnau;
	25:9EAKxFrKQ+U4hxbezw6GVwDsXNVu/gLNsZanWc33jKKB5Y6fz5Qdcx7KOz5xXePxKIO0Bk29dNNLbT5yrydsTe7ttJM8sAHbqDWhxeBy6MqjaXbE5hfOXL1p6JZ3ARFCU8pRT9vWuZt9+dFub8viyIOjMvmfLCRzE8RiPwSEAEXZrK6xndOU1onwquCN16po0ZBlE3CaqQtg19TvAoXL/CdAhs9sE2U6AcnX1rkazJw/KkhxJ7V38inv5WbT0kBBszG0Bpkxchc1OgsbqSSQsMs7biXnZwjP9Fsj4sXVwcI8t1DDvuDkX9payS8ztFw8RCzggEvTrlgDtOy0HcsXXQ==;
	31:s8ots8HzbAljm7B6bwGQBu9mI4EqqUhnG4MscQm4qatBqPQtx1JbuPVPDImzxPrpNV96J5BHObYHkQIHp5fdVPE5foDdigxLcDfiUC1s4gjenv6bmZB6w2BXmKx0fAVFJOeo1vE1eR4JHqCrk7yNe02BCuntOT6+dzdFykQJ6sjvjqt4FAH4BG3grV8m2nl20gYdMheHSgvj1xyiIuK4Bz/vwmaYT6wLGhRZbjEtzqE=
X-MS-TrafficTypeDiagnostic: DB5PR10MB0119:
X-Microsoft-Antispam-PRVS: <DB5PR10MB011916EE0D652E2A0F4B06389DBD0@DB5PR10MB0119.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(264703809997249)(166494164430575)(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231221)(944501327)(52105095)(93006095)(10201501046)(3002001)(6041310)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DB5PR10MB0119; BCL:0; PCL:0; RULEID:; SRVR:DB5PR10MB0119; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0119;
	4:YT90Jx9TRkiwRpwTQ73rOGJlqA21GwbHRNpkvZqGjO8B+tJSAY56vzTPh8JBX8rEEtOPpFf49TqJHFv22FKTk9JvzuaRMGIhEMt+niW+I6KbWe6TMNQ/RjmKIxXTn1AM4wJKIgmZpTW+fDb3vvERrmmRmPuX7PInUHh4ONw/G64+G4O8umXZgplgGAsg/Oxf6cea6snkhPltBkQlnwzCifVjqAupc4drYwL7tMADRKQvlgDy/qxCbFBLkx81Wy6JJTVCCE1NnwnltNqQ4Tf1vjn3Fl9hRnddJCcHoFQMtN5TouMgNIWbV1Vol3xZghCOttAzC6m2dmLFKHLBvb8ds0u1yNihkDyJYv6cnkS+aiyLEOHxWgPThi/5ZfkLSGbpEmqytN27SXoG5yqtcbotJ/dZ31elciE/nLBVK3pBeQw=
X-Forefront-PRVS: 0639027A9E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(366004)(39840400004)(39380400002)(346002)(376002)(396003)(189003)(199004)(13464003)(377424004)(8936002)(8976002)(67846002)(93886005)(1720100001)(11346002)(59450400001)(386003)(6116002)(64126003)(478600001)(50466002)(3846002)(53546011)(5890100001)(316002)(8676002)(2906002)(31696002)(2870700001)(81166006)(52146003)(4326008)(52116002)(6486002)(575784001)(956004)(229853002)(81156014)(74482002)(6306002)(76176011)(106356001)(6666003)(2486003)(446003)(105586002)(16576012)(58126008)(23676004)(77096007)(65806001)(66066001)(65956001)(5660300001)(476003)(47776003)(486006)(97736004)(186003)(305945005)(53936002)(26005)(7736002)(2616005)(25786009)(36756003)(966005)(42882007)(72206003)(16526019)(68736007)(31686004)(65826007)(6246003)(39060400002)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR10MB0119; H:[172.16.11.2];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjVQUjEwTUIwMTE5OzIzOk9zN29zUkpJNnFMNE9MQ1pKN1dZK0lRQzdS?=
	=?utf-8?B?Q3JXTFBpZlhvQkVBM3NNb3lLeHMwV1VneTUwTExhSjdCT3Y2L3g3RnpobUdB?=
	=?utf-8?B?TnYraG5aVWlZSko0eW1BbEdMaW5WeUhmRDZxeXd4SUdZdC9SQUpBY0NNSElK?=
	=?utf-8?B?bWEyZ1hQelJxSUpNVkc2bjJ4QzMyeXJJcFBJQ0pWMnh4c2lFT2NnOXNXTnlQ?=
	=?utf-8?B?cVBTL3YwQnd5YnJTbWxieDRhN21TSmdkN3IvcWV6ZmhCSDk0RjlOUjRuSWZy?=
	=?utf-8?B?VU5GdlN5cnlORVVTOGhMd21xWGNBTW5nTUdtaUZVT0xMMG5CbWcwYkpaRG82?=
	=?utf-8?B?OE1hZytEZCtTRmlNcFViMURDTDBDb1hUR29Odnc4eXV4TW81WXZJcXI5bWNh?=
	=?utf-8?B?L1lwZnNEYTNhVU1sMHNWWmtlUmRxNW1haUxGQWdRYzY4K2Y3akxwNFpxWmVX?=
	=?utf-8?B?bFBvdVRrSUk0YXNnR1BqNGR6UTV3eUpJczl0ZWV6bWZFcDFEaVhuRVdqc2Ir?=
	=?utf-8?B?ay9ZVkllQndmVi91elAvbE1qMGh4ZFVXNzBjditVRzkzbEdKRE5WYXNVRjJS?=
	=?utf-8?B?SkVaNzk1TDNxZm9aU0ludk1vUFNwdzZPWmh3cjZrbXRZNG9SaWxyekVTNGR6?=
	=?utf-8?B?TmgwY0RLcVJxSGpTTFVidkRMRUJmcjIvY0RCTVRvUS9JRGZuL3ZZK2RQaEJw?=
	=?utf-8?B?RnVNSWFNNXZ1WEFXem10Z3lsM29PQkt3d2liRGpvVWp5bVJVV3ZYbi9OMUpr?=
	=?utf-8?B?cCtIVlJpeEZOeGx0RFVselJ1MndhcWxmd1Y3R1RFaitUVUVrTGorNzdpUVpr?=
	=?utf-8?B?NmY4Yy8rK2UySGhKL1lxb0JhR3pBUWZQNFAycXhOaWc4Q1VEU0d3Y0t5Nmwy?=
	=?utf-8?B?QmFHOSs0bGp2cEpmMmZwNERnY21PL3FVRFppd1dYNGM5dVlYbG4waTMyZzV0?=
	=?utf-8?B?VlNwNDljSVVJc1ZBZXMyTjMveXpiQVRHeHh4akRSNE85WS93SVRSSnluK0NJ?=
	=?utf-8?B?aGwxSmhzZ3E4Z29QSURDUnd2b09HSnlEaFBwdXdydnZZRkE3anM5V1Jld2xn?=
	=?utf-8?B?eWpPeVdYb0JoWEVTa1ArUTlyUEJtemdwVE03eXdHZjZVV1o5OS9vV1BTbTlO?=
	=?utf-8?B?cldDK05HdEJxZUs3MjFQNTVlOUlXSzhyMXJpbGo4VUtYZ0NIUHkzRXlGNC8v?=
	=?utf-8?B?dnhGWExjQ3Z1dDJCY3RMeUh2anlpTHA2Umd2VUJ0cUN5TmVST2VvQ1ZhT3hQ?=
	=?utf-8?B?VDJINnVDL092NXlLVS95d2NNOUg1OGhuNzRFN25PTEdVSExYaWxBVmNNTXlP?=
	=?utf-8?B?b0RjSFNnMitiaVoyMkhzVDU3K1Q5SzBucVVzWkNyYS9HUVYyMHhPRzN5RDg3?=
	=?utf-8?B?S0RTVWppZGtaVk5RMUNuSnQ3bm1NYjJObHhPMEkvaDl6c0cwQlhqK1cwdVYy?=
	=?utf-8?B?RlR6eDk2cTZYU29GdGNvVmdyVi8yTHBRRmlyQlg1eHBDNUkrRlNYVk1HOU85?=
	=?utf-8?B?c0VvaGxocVdSZ3F5bXdTYTBZeWRRdmN4VW1FRkVpbFhaZUJQRWhCZzJtTTNK?=
	=?utf-8?B?OHlVR1hSYWMwb2x6blQyZG1KMDFNOWhhMm1mbU11aEcxRGRZYW1oRnRQSlB4?=
	=?utf-8?B?cE83N3dMVCt4U1I1SmxTQW9MQ3ZOTEpJbmx2OUVoWlAyUkZHQ25tTEplaE9M?=
	=?utf-8?B?SFRYRFdUOUkxR2I2a1JpeHYwQ01FbjUwRHc5T0FzSzlOc0JldDNsZ2drdmFW?=
	=?utf-8?B?YmZuZ1FUS24wWGY2MlpwYUZ5MUxIRjQvYVpjZG85elgrUXRkc3orUjJYSm54?=
	=?utf-8?B?S3B2aGtRMmI5VDdWTTloZU9qQmw0Sk5kdWRwR3U4MlV2aTg5WktUVDNML1k2?=
	=?utf-8?B?ODJUdWwrbzdwTkhudGYzZFBpblU4dGxKamNWYWpESk56eTJrL2hSU1BiR1Bz?=
	=?utf-8?B?akFjWTdpMHEvU2FVdmJXZFAzS1d2OXlNcEZVd0xDWnc4SStHRjVaVk96dS8y?=
	=?utf-8?B?ZWc3TldqTkNJVkZDcGh1L2VzQnd2cm43eEc5c2VjZzkrR3RMYkk0RW5odEpR?=
	=?utf-8?B?MGJzOTVjKysvS1c1WElsL0ZpMFlJWU01WTF2ZUZkVSt3S0h1eVVzZUx5eGZ4?=
	=?utf-8?B?NnRZQS9wdEIzdi9lL2paZTJyNTQ0d0RoSGlZT05nYlI0SXcrUk9pN0xaYUMr?=
	=?utf-8?B?RWF5Wlg4dGpuOFlGdG5ybnByZ1pQbjdjTFgySy9kemtXMTAraVpXUUdsa0ds?=
	=?utf-8?B?UmNHMWdjUnJ1amNLTmFFcFVtc01Fc01lRHJjelRyM2pkQzI0QlpMNTUvc0Qx?=
	=?utf-8?B?TEQvOXZQM292VWNkNWVPZElqUGVDSU5uQTNyY3dxMWU4QThoYmMxb05ZRVlh?=
	=?utf-8?B?NnRKOEtpQTB4SVJKSFE9PQ==?=
X-Microsoft-Antispam-Message-Info: XnK/vB9dgPu9VkmkiQIZDAbHBKK1zXBjxTOYwO6TeIT7zskK4/Bopkym3shTdF+4nDAl6lvFDo42MOkgV8zOTeXuxajnrLSw6JVJOI8p5hn4z5YHVa1m19ujmuTRlQnM3zTEXOdJD/3P1Ee2cv4bb2kNw5c5ZjMdA0ueoSqm7eqD8Ju1I9Z9ct4DWZUUgR4+
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0119;
	6:FGWC62p55vQcIAUhzcklr3r4KORuvUMMVZ4pPlSftKbWJVM3BpUQhj3vOeVa7xSymS2mT9VTG3TEHunmlOFTj1R9n4Lw57b8wyjrIE6g+51yxQWEdy8vNWjbsarSqNFFhtzPB3P9JaU8mViBAMC6AuahkKZDlcuIHrJheotOWGOi+G6KEhMLJG7cLZFfPSnj6aRwgFhESa1rbSo/2L5yFqV36gmyWV2yNz90jGIg/maUIgbrGznQQIauxZBnmb/tN7zCqxFgbzArYjbQhgyRj7BIhIl/mrMDOEg9QT0PzmZsvh9SOcfkktMfxq4t7HOvwqm4su9z5lWAS30XvGKOrgmEk2DLm6tz9EOLSsp6hc+JrALVm6SOpvGay04It36Ufb+7V76lywcvwRgKuPeYy0Ov7JUSaB+KK/288mepSZaARMvyixZVjtziS5sQmXDZlfb/HxCBnfpNjKdG9hem/A==;
	5:RjnGUBTiMSmnBEm03AglqoTlKCcF+iz6OEc2Wo8ILPkSNU68mUlOnq/CDhGERHTbtm7F6N8Xam+ROoXAJTYMvwr5SHK700GMT5BPY9C3TCsvRAbCAbyHs43FvKIKlklEQNWHoqGJ+yjjJEHmUzvzX5nTOORfPm3wKKNFn7a5oRQ=;
	24:RHLQnr1K7lEp3zso23TxRAxuT6lbjeWI+4X92R0DicyPQuuNO0TQ4S4Rjo3lNpVpMhTI2GWi4EEZabZDuuTWFwK+AZrIweGkMk/ffInOzNA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0119;
	7:vAO8K42C3oDEjX2vwGo2VVwBOnxvIX2ZAMpDexc19KQQz8z+WkB+mC6SlmU1N/fMEcCdoGO/m1/IGKtYcZKHreTN8Wfpp9fQClpZcFvn0bISTVgkROQxTLxITZ+Msy9iB/OHHUKc5bgyw0Tvyge9DOea+/RD+jjD9drThL0LDzuCblAt2L1OYfNFgIStbm8fwHf7aKtRajZg3IxjibPEcZMRZOFv7QTUy/pXGyTh/wK0N483a/lqLAqtha7y3Y0u
X-MS-Office365-Filtering-Correlation-Id: c3a1d603-a606-48da-2d3a-08d59f882415
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2018 08:42:20.7997 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a1d603-a606-48da-2d3a-08d59f882415
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB0119
Cc: otavio@ossystems.com.br, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Wed, 11 Apr 2018 12:15:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

On 2018-04-11 04:28, yamada.masahiro@socionext.com wrote:
> Hi.
> 
>>> I had to patch up our own u-boot recipe as shown in the attached patch
>>> to make v2018.03 compile for qemu-x86.
>>>
>>> The thing is that the build of pylibfdt became unconditional since
>>> 15b97f5c5e ('pylibfdt: move pylibfdt to scripts/dtc/pylibfdt and
>>> refactor makefile')
>>>
>>> In my case u-boot/pylibfdt failed to find the correct (native) headers,
>>> because python setuptools / distutils looks into STAGING_{LIB,INC}DIR
>>> when compiling the native extension for libfdt. I didn't find any other
>>> way to specificy this in either the u-boot Makefile or some other magic
>>> environment variable.
>>
>> CCing Yamada-san, maybe he has an idea.
>> Also, do not top post.
> 
> 
> 
> The build of pylibfdt is conditional.
> It is built only when CONFIG_PYLIBFDT=y,
> which is selected by CONFIG_DTOC.
> 
> If you really do not need pylibfdt,
> you can disable it by tweaking the configuration.
> 
> If you need pylibfdt but you cannot build it,
> it is a different problem.
> 
> Thanks.

Correct. But I was building u-boot.rom for qemu-x86, which depends on 
binman and thus pylibfdt. Before the mentioned commit, one could avoid 
the building of pylibfdt by installing it on the host, as the makerule 
checked if python could already import pylibfdt. This check is now removed.

Or am I missing something?

// Martin

> 
>> -----Original Message-----
>> From: Marek Vasut [mailto:marex@denx.de]
>> Sent: Tuesday, April 10, 2018 6:55 PM
>> To: Martin Hundebøll <mnhu@prevas.dk>; Khem Raj <raj.khem@gmail.com>
>> Cc: Otavio Salvador <otavio@ossystems.com.br>;
>> openembedded-core@lists.openembedded.org; Yamada, Masahiro/山田 真弘
>> <yamada.masahiro@socionext.com>
>> Subject: Re: [OE-core] [PATCH] u-boot: Upgrade to 2018.03 release
>>
>> On 04/10/2018 11:49 AM, Martin Hundebøll wrote:
>>> Hi,
>>
>> Hi,
>>
>>> I had to patch up our own u-boot recipe as shown in the attached patch
>>> to make v2018.03 compile for qemu-x86.
>>>
>>> The thing is that the build of pylibfdt became unconditional since
>>> 15b97f5c5e ('pylibfdt: move pylibfdt to scripts/dtc/pylibfdt and
>>> refactor makefile')
>>>
>>> In my case u-boot/pylibfdt failed to find the correct (native) headers,
>>> because python setuptools / distutils looks into STAGING_{LIB,INC}DIR
>>> when compiling the native extension for libfdt. I didn't find any other
>>> way to specificy this in either the u-boot Makefile or some other magic
>>> environment variable.
>>
>> CCing Yamada-san, maybe he has an idea.
>> Also, do not top post.
>>
>>> // Martin
>>>
>>> On 2018-04-09 02:54, Khem Raj wrote:
>>>>
>>>> On Sun, Apr 8, 2018 at 4:10 PM Marek Vasut <marex@denx.de
>>>> <mailto:marex@denx.de>> wrote:
>>>>
>>>>      This upgrades the U-Boot from 2018.01 to 2018.03 release and drops
>>>>      patches accepted upstream, getting the patch count to zero.
>>>>
>>>>
>>>>
>>>> It fails for me if I have libfdt installed on build host
>>>> It seems build is doing the include dance which goes all the way into
>>>> hosts system include directories
>>>>
>>>>
>>>>
>>>>      Signed-off-by: Marek Vasut <marex@denx.de <mailto:marex@denx.de>>
>>>>      Cc: Otavio Salvador <otavio@ossystems.com.br
>>>>      <mailto:otavio@ossystems.com.br>>
>>>>      Cc: Ross Burton <ross.burton@intel.com
>>>> <mailto:ross.burton@intel.com>>
>>>>      Cc: Richard Purdie <richard.purdie@linuxfoundation.org
>>>>      <mailto:richard.purdie@linuxfoundation.org>>
>>>>      ---
>>>>        .../u-boot/files/MPC8315ERDB-enable-DHCP.patch        | 19
>>>>      -------------------
>>>>        ...t-common_2018.01.inc => u-boot-common_2018.03.inc} |  6
>> ++----
>>>>        ...fw-utils_2018.01.bb <http://fw-utils_2018.01.bb> =>
>>>>      u-boot-fw-utils_2018.03.bb <http://u-boot-fw-utils_2018.03.bb>}
>> |  0
>>>>        ...t-mkimage_2018.01.bb <http://t-mkimage_2018.01.bb> =>
>>>>      u-boot-mkimage_2018.03.bb <http://u-boot-mkimage_2018.03.bb>}
>> |  0
>>>>        .../u-boot/{u-boot_2018.01.bb <http://u-boot_2018.01.bb> =>
>>>>      u-boot_2018.03.bb <http://u-boot_2018.03.bb>}   |  0
>>>>        5 files changed, 2 insertions(+), 23 deletions(-)
>>>>        delete mode 100644
>>>>      meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>>>>        rename meta/recipes-bsp/u-boot/{u-boot-common_2018.01.inc =>
>>>>      u-boot-common_2018.03.inc} (68%)
>>>>        rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2018.01.bb
>>>>      <http://u-boot-fw-utils_2018.01.bb> =>
>> u-boot-fw-utils_2018.03.bb
>>>>      <http://u-boot-fw-utils_2018.03.bb>} (100%)
>>>>        rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.01.bb
>>>>      <http://u-boot-mkimage_2018.01.bb> => u-boot-mkimage_2018.03.bb
>>>>      <http://u-boot-mkimage_2018.03.bb>} (100%)
>>>>        rename meta/recipes-bsp/u-boot/{u-boot_2018.01.bb
>>>>      <http://u-boot_2018.01.bb> => u-boot_2018.03.bb
>>>>      <http://u-boot_2018.03.bb>} (100%)
>>>>
>>>>      diff --git
>>>>      a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>>>>      b/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>>>>      deleted file mode 100644
>>>>      index ecaa1796a4..0000000000
>>>>      ---
>> a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>>>>      +++ /dev/null
>>>>      @@ -1,19 +0,0 @@
>>>>      -Enabled dhcp client functionality for Yocto reference
>>>>      -hardware MPC8315E-RDB.
>>>>      -
>>>>      -Upstream-Status: Pending
>>>>      -
>>>>      -Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com
>>>>      <mailto:ed.bartosh@linux.intel.com>>
>>>>      -
>>>>      -Index: git/configs/MPC8315ERDB_defconfig
>>>>      -==============================================================
>> =====
>>>>      ---- git.orig/configs/MPC8315ERDB_defconfig
>>>>      -+++ git/configs/MPC8315ERDB_defconfig
>>>>      -@@ -12,6 +12,7 @@ CONFIG_CMD_PCI=y
>>>>      - CONFIG_CMD_SATA=y
>>>>      - CONFIG_CMD_USB=y
>>>>      - # CONFIG_CMD_SETEXPR is not set
>>>>      -+CONFIG_CMD_DHCP=y
>>>>      - CONFIG_CMD_MII=y
>>>>      - CONFIG_CMD_PING=y
>>>>      - CONFIG_CMD_DATE=y
>>>>      diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
>>>>      b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
>>>>      similarity index 68%
>>>>      rename from meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
>>>>      rename to meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
>>>>      index d2073ea0c7..8ffae365a9 100644
>>>>      --- a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
>>>>      +++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
>>>>      @@ -7,10 +7,8 @@ PE = "1"
>>>>
>>>>        # We use the revision in order to avoid having to fetch it from
>> the
>>>>        # repo during parse
>>>>      -SRCREV = "f3dd87e0b98999a78e500e8c6d2b063ebadf535a"
>>>>      +SRCREV = "f95ab1fb6e37f0601f397091bb011edf7a98b890"
>>>>
>>>>      -SRC_URI = "git://git.denx.de/u-boot.git
>>>>      <http://git.denx.de/u-boot.git> \
>>>>      -    file://MPC8315ERDB-enable-DHCP.patch \
>>>>      -"
>>>>      +SRC_URI = "git://git.denx.de/u-boot.git
>>>>      <http://git.denx.de/u-boot.git>"
>>>>
>>>>        S = "${WORKDIR}/git"
>>>>      diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
>>>>      <http://u-boot-fw-utils_2018.01.bb>
>>>>      b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
>>>>      <http://u-boot-fw-utils_2018.03.bb>
>>>>      similarity index 100%
>>>>      rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
>>>>      <http://u-boot-fw-utils_2018.01.bb>
>>>>      rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
>>>>      <http://u-boot-fw-utils_2018.03.bb>
>>>>      diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
>>>>      <http://u-boot-mkimage_2018.01.bb>
>>>>      b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
>>>>      <http://u-boot-mkimage_2018.03.bb>
>>>>      similarity index 100%
>>>>      rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
>>>>      <http://u-boot-mkimage_2018.01.bb>
>>>>      rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
>>>>      <http://u-boot-mkimage_2018.03.bb>
>>>>      diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.01.bb
>>>>      <http://u-boot_2018.01.bb>
>>>>      b/meta/recipes-bsp/u-boot/u-boot_2018.03.bb
>>>> <http://u-boot_2018.03.bb>
>>>>      similarity index 100%
>>>>      rename from meta/recipes-bsp/u-boot/u-boot_2018.01.bb
>>>>      <http://u-boot_2018.01.bb>
>>>>      rename to meta/recipes-bsp/u-boot/u-boot_2018.03.bb
>>>>      <http://u-boot_2018.03.bb>
>>>>      --
>>>>      2.16.2
>>>>
>>>>      --
>>>>      _______________________________________________
>>>>      Openembedded-core mailing list
>>>>      Openembedded-core@lists.openembedded.org
>>>>      <mailto:Openembedded-core@lists.openembedded.org>
>>>>      http://lists.openembedded.org/mailman/listinfo/openembedded-cor
>> e
>>>>
>>>>
>>>>
>>
>>
>> --
>> Best regards,
>> Marek Vasut

