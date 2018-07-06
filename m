Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 25227 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 07 Jul 2018 12:29:46 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10091.outbound.protection.outlook.com [40.107.1.91])
	by mail.openembedded.org (Postfix) with ESMTP id 06DF2607E1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jul 2018 12:29:46 +0000 (UTC)
Received: from DB6PR1001MB1336.EURPRD10.PROD.OUTLOOK.COM (10.171.77.151) by
	AM4PR1001MB1331.EURPRD10.PROD.OUTLOOK.COM (10.171.87.149) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.930.19; Fri, 6 Jul 2018 21:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=k9wr2BgesaXEIVjhcOahKgrAEGJno8uU/pBGKmLUTcg=;
	b=lqOqtNQv8GQBeMA9qvej2CPO7B+4Xfpb7rVNHtctoh6vB5jJ9D2FkmKZkKZApMDJjpjgb0XapccXSAfFNUK9CslpWjFXlNU5lHdfM/k4mZzg9hsbVC/lqUqHXZ8cjKFoNp/iB9yJj304kVmV439Q+HOXkU7LqrSeYgE1Bld54/I=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from [172.16.11.32] (81.216.59.226) by
	DB6PR1001MB1336.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b4::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.930.20; Fri, 6 Jul 2018 07:26:31 +0000
To: Andre McCurdy <armccurdy@gmail.com>
References: <20180705205544.24546-1-rasmus.villemoes@prevas.dk>
	<CAJ86T=Uya2FV32fUVWfefiQQ8Mc6sgKZ4H30N2rav6tC2J3bJg@mail.gmail.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <e85569ab-88a1-79f1-9ec5-8a45aaeefb0d@prevas.dk>
Date: Fri, 6 Jul 2018 09:26:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Uya2FV32fUVWfefiQQ8Mc6sgKZ4H30N2rav6tC2J3bJg@mail.gmail.com>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: HE1PR05CA0349.eurprd05.prod.outlook.com
	(2603:10a6:7:92::44) To DB6PR1001MB1336.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:4:b4::23)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18e214fd-ae40-45f4-719f-08d5e311cbab
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR1001MB1336; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1336;
	3:Z22Gst/5xI59JgYKBzEhXAsfqsTjzoQcz+es+R9RaNjjxJr6bpb4UChMFGBJ35sO+YrgFMIEMoOSkmC40/4c45SLgxcsCr2HxA4BwT/IPRRAci2UhrxldcR6hV68etVTRmYqdxBs7I51/IErE+MUbo69p7E71Wr3APqyc5RqX+Fmjs+Jg2xMio8jZUPlQt7L4/0xF1t4pzc78m0qfTwJ9cqzykB3ONlMulRC1NDx0M4MoVMUnbx77yxoo9y6SuLR;
	25:LBguffSMYK10I7bCCJCpM+5FqmD3waIgaFmSdHLCl4+z2DP/AQvpcvmddVvKMCh8XzumYGyEgiK45A7LBDv57BKzh3cTRdTrCGIYRhUAW/YqPTP9DlhLIk9HymgdpjBl5ewMNIet8kGF/0OsuoCuKBPVDHKVuz4S/wUG9DA9TbF5xYVZ7uCUDKJFq7lC/1/d6wnBn7OhnX5RagmFkYoLwTultGvgH+/H324aqi2AGbD2mvxqf8rATHbLW5V8rQgUF8mg7Siso/gpy6D5S8YEZzf21CA9yhcZqzViGR/GPfctl/E/ohV0DHy0ASt4SDtxyhaJugGqmmZgCVN2s2UY6A==;
	31:ay+sNDiry30ZhxDSoT3NiWqNWX50PRFcKjvshiKy+hJV8fhKUJDPb11cRUkpf5Gp/s9N287kLCoBwY5A6tECUj/eJvfEgE7dSOvPuyFnMMayRP+t0FAJg2m5S4ZqvQdP0Tidk8XABa8r075YpiNBTm4hi4f+PNxOS/wBFxkdPUj4xwNR0k1XfUCpT4JdZN7njfMZH0kqXrL/X5JjdUyH6zLPI3q83b6rcnIT8V6qgPM=
X-MS-TrafficTypeDiagnostic: DB6PR1001MB1336:|DB6PR1001MB1336:|AM4PR1001MB1331:
X-Microsoft-Antispam-PRVS: <DB6PR1001MB133623035E2892FF6BADB3888A470@DB6PR1001MB1336.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(3002001)(10201501046)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DB6PR1001MB1336; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR1001MB1336; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1336;
	4:HKuppa7HJOY83SZl6B9ZeLa0kL8W5n7roLfE2+YoYQ/E+N+muVUPaMfxxolsu/wyrvzgARYDtoAp2qzwUVNDy1tkp28jr7nV0V0GLG9lJS6KL1DRq9oF/Epit4LjWJbo38TOOhmgONibw48FUf21L1rog/h0FdO02OXJEdZYdOJtetYu8BmCrGPfEU1LO8T3vQfibGLV1KSt20AnyOHSXUHIDSo7zqvHaRD9Va4qv6/eHG9ajA9+b3v9ULMbx41uamKFXAO8jID9zqU0n0slsg==
X-Forefront-PRVS: 0725D9E8D0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(136003)(346002)(376002)(39850400004)(396003)(366004)(189003)(199004)(8676002)(7736002)(81156014)(105586002)(8936002)(6666003)(8976002)(74482002)(4326008)(305945005)(6246003)(81166006)(6916009)(53936002)(39060400002)(106356001)(478600001)(2486003)(52146003)(52116002)(16526019)(6486002)(186003)(53546011)(42882007)(31686004)(229853002)(76176011)(36756003)(386003)(77096007)(1411001)(65826007)(2616005)(11346002)(5660300001)(68736007)(486006)(476003)(446003)(44832011)(23676004)(72206003)(26005)(2906002)(25786009)(956004)(14444005)(65806001)(65956001)(66066001)(64126003)(31696002)(230700001)(97736004)(3846002)(58126008)(50466002)(47776003)(16576012)(6116002)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR1001MB1336; H:[172.16.11.32];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjZQUjEwMDFNQjEzMzY7MjM6SHRUWFptMXdIVDh5MTRQVjhjZjdnSXpL?=
	=?utf-8?B?dERJMWl2UCsrVm9lTDVFOHhxZFpUekFxTWQwK0M5T2l6bEZjLy9zTkdkS0pX?=
	=?utf-8?B?dm9LbFZJTjZMb2c4SWZtSUdUNXNtMUNmZVhZYXgxL0xzY21VUzFGNGx0S2Js?=
	=?utf-8?B?VDZXUzdqc3cvbGNuSkpydURJaVNsNVdYY1k3TmNBY0NPQVU5bENYNlhHWHgy?=
	=?utf-8?B?ZVhVSWU4aFowemxhMXZSVUlnNUg0VEJpYmxkWCtNVnVBTlhhYXBrbzFmQ2Uz?=
	=?utf-8?B?QThqaCsvYzM3djNPc3VrcmxUb05vUkRBaHZvV0VxS3VsSEtqYXZrSC9SRGcz?=
	=?utf-8?B?RHhObWtpcG5UTDhwVGVuVjFNakM5L3hveWQ0UmN2d1dSNlpVVDR1djZiTDY4?=
	=?utf-8?B?bzVGU3hXRC9aM2NVMktIak4wTHRjZjhDV3dLazg3UVRVUS9rYzZ0WUJQSlFy?=
	=?utf-8?B?NTFTTHFsdmpuK2xsayt4TDgwU3pGeUNKS0xjNGxDNi9yektFbFlPSTJITlkz?=
	=?utf-8?B?cC9QT3ZnWlJ2RFBVc08yR2tDVVc4V2k0VjlrOW1KS085eFY4Wkh1cDVjUlRI?=
	=?utf-8?B?aDhsNlo2VlB0U29vdWVOdGZEWUtOZVJVRmNSN1RYWndHSGRLOTlHazFHUE8w?=
	=?utf-8?B?aGsvbEh4bmFIQ3QxT1l2Vk04QlVLVHY4RksvMUZGaWJVZ1RrUTQ2SFk1QnN4?=
	=?utf-8?B?NFptcDJPSzAyd3VhbUtPVTlkMUtadjZpbk9Yb1ZpNTRKSklqdkd1SHBJc2lQ?=
	=?utf-8?B?Y0h4QXpzMXBITlpRTWdMTThUR2dGRlBjVGVqVE1zQ2tjWTZYTlZqZFJob1B2?=
	=?utf-8?B?ZHlFSWI4dGZ3SWFrbi9tR2ZGdFVpWTRxZGZDWWV3RUoreGJtV1ZqN2dVaFY1?=
	=?utf-8?B?T2FaOHY1aHpReDg1bDlJc2hSaGYyV3FzVFdRdWs3aHpuRDg3eWpzalJZZnZh?=
	=?utf-8?B?VVk1T1U3dTMxemlHR3JvV1VheWVza081UG5XQkVhUUxmQXNqU2cvc0ZWYy9C?=
	=?utf-8?B?WkFEbXBmT29tdGY1S2UwajNCTzl6bTlmMnNVWjFrN2p6MUoxNmxjUkZsdEFR?=
	=?utf-8?B?VFFETzJ1anJHejlKVUU5MWdhbDlqUUhRRWpzOG56Wlg5NlM1cnp3dzdKK2hh?=
	=?utf-8?B?aEhhZXFKYlNXRTRtakh2K01POUJpRGQ3VTdkVkR0NEM4cTFXYjBlUUJnRkJL?=
	=?utf-8?B?SjRwMHcvM2V2bDNCUjVHb3Q4bjdQaWc1WDdCV3lTcXJHUGduY2drK0pJSG9j?=
	=?utf-8?B?VDBNdXZUOHA4U0lCcUlBRGlhQUY2ZkpVcWJoMkt5VDZBR1hzVFV5bm9OQVdQ?=
	=?utf-8?B?VGk0U1Zac3l0aEZMamx0SDFnQkkySmJkcGI2SHZRYWFWa3BvbVVXckt3WDZ5?=
	=?utf-8?B?SmI0ZysrR0hncVFybU9LVlVyMmNvdE1qYUNaVXdNVEVHVXdpOU1VbExYc0VM?=
	=?utf-8?B?MmIxTDVwTUFuSUJKQ0xRT3RMOFNLQ01jWUh4L2pBWnZXaU1GUEpaMGxzb3lk?=
	=?utf-8?B?akttTlVrbjhiTjBhV1JwQTVzL1pjRGpqdlBxSUpuTDYrbStBdlRQNXBybmh6?=
	=?utf-8?B?bHNEM1JGTW5YTUdienhkc0VaWER1cGpua3dLSFF5UWpFcEFtdzlBL3B3YUQ4?=
	=?utf-8?B?Yjd5TlhuSlZ4RzlYbURkZG9mcUI2dHM0a211d25FbFRlM0VmeXNlUjhFVkxz?=
	=?utf-8?B?UGVhN0VGMm5PbWJZZXBQa1BkWVMrTWRMb1VtaTJPMnhLaDhUS0RPb1FPVWkv?=
	=?utf-8?B?bjlhNXI5NDhXYzY3RFRMbDFrRGpGbkF3SEFnNVVVTHVrVmdMb1FqeGlWTkht?=
	=?utf-8?B?clVvZW5OdUVPSHBhTmR0RjBTN2xYMGtJa1FCbWg2WEgyYWFCU3hSZ01wdnBw?=
	=?utf-8?B?bVM1RzNUNk9ZQWxuZVFiWTRYWHlpQVZNY2JvZjN5dnFEdjk3Uy8zWnZ0Wk1y?=
	=?utf-8?B?aFo0RW9yNWNOM245cy8rK0RBUldnY2JzTU1MY2dSalNMdTh4MXQ5SVppeFZS?=
	=?utf-8?B?WjVJS3A1Sy9pTFFCblJlNGJTUTRKcHBRM3dQMktITi8vQ2tOZ0Z0eisrakF3?=
	=?utf-8?B?bFo3R2NINmVnR2RxWmlqckg2Q1ZDbjNSQ2lGai9sUzJpWjRhOHB0YTJCL29j?=
	=?utf-8?B?RjYrdz09?=
X-Microsoft-Antispam-Message-Info: 5oShpa33W/tS2Wr2dmzM54c0UC99y/jTT8vBS655EN1i4/t5sLEJxW9UAaXYW/VghPsUzE18uNKfWlf87R9h040CU9Pb3Zm4zNjk4f15qYmdtnM5sJ9zmCFm3L8QjGaCqELLqPod/CadW1FTcs3c8+P5KcR2hDJWXu1HzagBpm4K15pMzOSuMEhplP8A/sCDU6Ei2NeEDOWwLf/uvRoSVU01NhXXSgTxx2A5HfdKc/Kzca+cd/jOhDBblomrw5J5Scvg57sOy1gVT1dzaMHH/Hn9ECzBtZFwgg9zViYFSTKWT22KWwMMwpWCtQBL4JeITNMmR2EtmBvf6d1euAzZ2lramu9I9KbQuiE4SBSw378=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1336;
	6:W5ehC49pFJbDGQIu8zAQ2i+t7g3FNwQRiUsnE998lt4XyiaPIfouFgUL2UbwViFJGy3f24D6wFz5dHLrVI1eDdI+DbYc1SJ6vX2Fyod4L6I4XR9NtWyXxeG0NT1F7cSqfAFq7wlSENA4iiOMY84kMqVbZhyM7eaUrGJhsz/ld88T1mqP9BSDmfSc1e/9uNK9BHdDwA3m4XGxms7p2yNfSPeVTp6kimf5bVQ37yP6I05musvW3Q6Jyt19Xpmxp2SQqhVxArCpLlXgplaGQMWuIQQS6eEvyOicETBukHjU/11spnCymT/3UrlNOMSzlr1nftQcUaNp+84KXf7pXBN0Ea+s4Posfbsg/5flq8MLhmBbUSNJqKKj16mmi/mUWAgB812aPQe6gsvr8kX3RccOw2LeAv5MKJCk7pYoFLU02usu9SfRoQf+PuddKRWtoIoHs3KtZHeYm5fsrzervYMveg==;
	5:bloHbyAdySNSRE0O4Y+jpk4q4hMzcAj9KdzKg0ZZsaQrbIe4ZYsZGv12DEKiRi0Id2i1tSzF4fEwdtZJZXQ4WKwo6b1iUjLm8UY9bfOvSFafW6OHtyusXd1Cwb9G5y+3tWKhl6/nHXIKhGE8JQOmjnSglUKyioo3bcfw5o/bM6A=;
	24:J4VzD466RHVZwVcJG81hDGxPOdk1baIZ9grDOycywDXWkpBZm3m3ieEkESIfmtc+K7nP282263HdztDYRGGDNhr/DVlhdvKPQBR+wFq9OkI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1336;
	7:+9tQcwcYmxHYxmBzBVDfsCyIIXC5DV/O/bLJ2VXYursDb6FOe3X3PZWVxAOiqOFhQbwP1orrc0lN36s+yZ6j2U6dEvAnWJ7XKoryCU41H3i+u4u7rGg4RvWYZfYs3m6QQ7j2wUDz5g/C3zK4vJ+EF8yl5cT8WXCGXPkRjv3BYOK6I6c7I0ismhRm/rh+GOeSsYlkfgCjyNx+Zj+ImJS6F7WrSz6vZG6dsqiykU4oC0bFu/DCStEo2OCKz/b+8jwT
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2018 07:26:31.0660 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e214fd-ae40-45f4-719f-08d5e311cbab
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1336
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1331;
	23:aQ8oGSKerbHrRdSYNaqgRpRKuyZ/4zvTHY9ATeR47rTiKH2qwAeILszK9vjSnRFxAeV8UDAkITNfL4F7B2cZ830jWGkvBZ/Nlp2QAcjzlhDqJ5vRHaXwOf2UrTrUbk4sbC67JxA2wPIOXW5Nb9mp/Q==
X-OriginatorOrg: prevas.dk
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: disable parallelism for 'make clean'
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
X-List-Received-Date: Sat, 07 Jul 2018 12:29:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-07-06 00:18, Andre McCurdy wrote:
> On Thu, Jul 5, 2018 at 1:55 PM, Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
>> Whenever perf got rebuilt, I was consistently getting errors such as
>>
>> | find: '[...]/perf/1.0-r9/perf-1.0/plugin_mac80211.so': No such file or directory
>> | find: '[...]/perf/1.0-r9/perf-1.0/plugin_mac80211.so': No such file or directory
>> | find: find: '[...]/perf/1.0-r9/perf-1.0/libtraceevent.a''[...]/perf/1.0-r9/perf-1.0/libtraceevent.a': No such file or directory: No such file or directory
>> |
>> [...]
>> | find: cannot delete '/mnt/xfs/devel/pil/yocto/tmp-glibc/work/wandboard-oe-linux-gnueabi/perf/1.0-r9/perf-1.0/util/.pstack.o.cmd': No such file or directory
>>
>> breaking the whole build. The root cause seems to be that the implicit
>> 'make clean' done during do_configure ends up running in parallel, and
>> thus multiple find commands attempt to stat and/or delete the same
>> file.
>>
>> This patch of tools/perf/Makefile has been ack'ed
>> upstream (lkml.kernel.org/r/20180705134955.GB3686@krava). Since the sed
>> script matches exactly the lines
>>
>> clean:
>>         $(make)
>>
>> it should be harmless to have this even with a fixed kernel, and it can
>> be removed if and when all relevant -stable kernels have it.
> 
> If it works, then something like this might be a cleaner solution:
> 
>   EXTRA_OEMAKE_append_task-configure = " -j1"

tools/perf/Makefile explicitly ignores a -j argument, and computes its
own value. But one can pass JOBS=1 instead. I'll try that and resend.

Rasmus

