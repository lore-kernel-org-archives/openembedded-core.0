Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.63])
 by mx.groups.io with SMTP id smtpd.web08.6673.1616059728179827175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 02:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OWStZqEx;
 spf=pass (domain: windriver.com, ip: 40.107.220.63, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIrVxiqeYJQ7nFVRh9PvvI3yjbM2rpZt4OEhKQViq8n3rouSVS+z9m9//S/njRfmAIDIEHCs7CLDiX/QxI1Z/rROfMN7sQDrmFUtaUUJsCsOydvUGqGsHliwuB68WjQwCRKDqPYGJRRr7BJ+SibxxmS3AIVsrWN6qTYn2uO7BLKLvKu3VCsELcVR/6+OUhdZc4GcN+ugTNf2s8bhU1ksKaBumjlHm66TRikFgoQQ1POQNb55lM1axLzaJ7PiATE8lPhom3Fj5Ij14fGOk2JWYMeLbhNP1XUlwu/2cKdJxAkTj5BOiqSHkFJue5/bM3Hc5zpDaW/2sOi5b3FAVOk3SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zc4KTtdbTLtfvMNnDmV4WbSKse9ft4OzA2E6JO/VejE=;
 b=eO15oVBgTOjWtAFihYeJbeq67KzN0P+dtleh4Lc2vmeBF9MP4HZ6FDvNmudJuxurCgj12qP0lX5Y0Nv1UxvPCD2NMjPLFeTIUSxGa8bfo4XVox93q5Z8H3B5OnXL9VHPTnzpZ29dB9HZl5omkAsbcI5BiWGdw7ddycbs3Rf314k8rOKvmSavCu5M/ybG/DMd7j4fmO10xRogefPf5PaYALYjsT4YdJ4SFmMM/EM9sUNPKehoIa9LxCdobl21tft9UmjIO27vQlZvgTfeHT2DIdg+Oa3oml/ulCTMMKWFeS+79iT7b4L0TX1AQM8BxbMTSe8+UzJJkmJ+OXqeAF2ojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zc4KTtdbTLtfvMNnDmV4WbSKse9ft4OzA2E6JO/VejE=;
 b=OWStZqExXbWaIG69PxwrW8pvSTLFkYtusTvqU4r1z1tq5C0Cu2Pbe0tzPx9eXzi1GTO2Da72YWDHw1ifkbfnDnb+SHvlbUJR7KiIMhpUu8zX1OBy8tYnDlt/kAyKS/WEZ727fBhEo8Ltd/lI3cRT7f9RB/YsyXvU4FMvoojd+sg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4769.namprd11.prod.outlook.com (2603:10b6:303:91::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 09:28:45 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 09:28:45 +0000
Subject: Re: [OE-core] [PATCH v2] autotools: don't wipe elfutils macros
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <166D505781F5EE94.19946@lists.openembedded.org>
 <166D50DC24E9BAF7.5206@lists.openembedded.org>
 <83c8832f-727d-2d71-2610-fb3d8540f246@windriver.com>
 <CAMKF1sr2=3ip3GjA+touJ0QdVJFBZUwU5z4RGZRCfivhvh63=Q@mail.gmail.com>
 <4f991cf2-3e5a-212d-44f6-66c7e754eeb0@windriver.com>
 <CAMKF1srtexeyLKFLxqZXuqRg9UuaWEwLM2OCjT_bCHWz=nLReQ@mail.gmail.com>
 <0dec7b1762a28052383ec39ff88122f6e49832f3.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <77d717dd-1600-63ce-1421-081ec0948bb5@windriver.com>
Date: Thu, 18 Mar 2021 17:27:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <0dec7b1762a28052383ec39ff88122f6e49832f3.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0011.apcprd04.prod.outlook.com
 (2603:1096:202:2::21) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK2PR0401CA0011.apcprd04.prod.outlook.com (2603:1096:202:2::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 09:28:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67a1c1ba-6064-42d2-ee40-08d8e9f03a27
X-MS-TrafficTypeDiagnostic: CO1PR11MB4769:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB47693C0FFC4E495E0761FB64F1699@CO1PR11MB4769.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8ppEP24ROOBBa3iUbN3rjPjEtCp3fVrl9BJkMrvzHAN7/7bpM1jIF5Q/FZTan79JY/6u1/sf6fRDWm5OliP6WscuvaWSyakOLI2ZlZJbX0+EV2y/Tan4KWypBCTezGs97o38RC99JenOUS4djcefWtCqlhqT6DU4C/TN++ueTj7reaWkLhHgvZkt8u9mfdRiT+KL/y6IQCaTkcc54S++9CjzExZkY9xoqmxTxNQ5V8ahp0p0/UuauA0LLZCp/r8GrV/EuaE3ty193LxROLm+22HLJE4i1jNwDLZBUUaFJl2JcvKsKMNblOSzrL5SyxeugBK5tbpuYhIlPU2ZzUFVURWzhpv4I/znAOcCejhs/vKO552ctLSZzMBBYa9CpSO4sJ804DYDarMX03MT6E1/8ySlOtCAO/B/bi90FHI5iSsQaSslQ5s74Bv56OhQl6mnP8pFYq4NneqIuirA0AjA18xngRmOjJn/3xJ1VVShqDJy8BzwRPah55k8ezF+kXgnK+lcNdWwSUTtWyrTCHDYbb4Syoi+N1OorFxgGPa6+xsPt8jLtCsSWfdcYAiRMXdEtUUOpEfAFUKRL0rlG4sWjtf4I8X2xAz7Wa7bDEld6JarqdfPEde/Hwp5bEa79BiI+IuDs20gsivOTv01XJp36FaLjyAJvyByxOKCwSp6gwibQZQZLN6r2BECGtKM4U3eG4NVV3uAow9zfPQilcV0YQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(39840400004)(136003)(8936002)(6666004)(5660300002)(53546011)(26005)(66946007)(36756003)(86362001)(83380400001)(478600001)(2616005)(31686004)(186003)(4326008)(6706004)(8676002)(6486002)(956004)(2906002)(66476007)(316002)(52116002)(31696002)(16576012)(38100700001)(66556008)(110136005)(16526019)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MzYvc2plMmFXTVpJdHEzV25tdWw5ckRxMGFKNkNMMWtMdmtRQjlCcTRzRVkz?=
 =?utf-8?B?MCtQbmxWSGxYcmsrMjVtcXJqaG5NWDRjcjBCZGF4NGdDYmpSTlVYK2VxOFli?=
 =?utf-8?B?eGZlL3F4cXNhYy8xeTVjT2NVUEgzRHdtajBHQUhPREFKeEZXb1hiSXBMcnp6?=
 =?utf-8?B?K01yUjlkZ3ZaNEsybDdGbHJYRmZvNVlrSGlJN3lMRzY3MDN4UkxNMmozcnUv?=
 =?utf-8?B?UkxBeC9QSlgxUjZKQnJCYlowWXNjWTI4R1lCNlJMcVh1cXptVTVnck9RdkI2?=
 =?utf-8?B?eERBNUtXNVQ5cXFlNG9MOTZQUHVwMGR2MXdIMmJQeTZ0TU9mV2ZvTjloTHJj?=
 =?utf-8?B?Mk83R3g3NmpPMU1PSDJieVUySTJlT2RMbm13dUVxUW10TXdSSkx0K2VYM3lG?=
 =?utf-8?B?V1JqaWRTNVhtZkZ5TVVlZ0pHdmk1Q3poanpMR1BmY3h2RHVobVNjZEt6Nll1?=
 =?utf-8?B?dXpJOU5JU3hobU5UV2JYZE9RZzl2bW81TmdUTktZVFArTjJHTnRTdXh4UjBu?=
 =?utf-8?B?cmhJSHB0dXVRWFFZaE1FTllWc3AxNXlLcG5OVGRLdTZ1dUNVOGN2YWJ4NG12?=
 =?utf-8?B?VTZabzZFb2J6OGsrNVdtQVZGSmNQT1NaZWtlUFZQYVE3YWxZcjA4Uk5rdDBv?=
 =?utf-8?B?cUtEdkRvenIyUEpGdG12QnFPWmIrd1JoN0VMUXIwdVNnSytYUUtZUlVIbHpR?=
 =?utf-8?B?NnNocHlZbk1xdmIvWmViTmt6STlDaXAwYUkrZFZORU9QTldOUlpyd05KcWFv?=
 =?utf-8?B?Qm5TRk4xWjE3bE5PN3lBYzl0aGxQTldpUDhMWHVjTjFuT1JLemVEZWdLN0Rh?=
 =?utf-8?B?L0JsY0ZzOFFGbTNYZFF0dXN1YTNZSHBzWXZ3a3RUbGllVkprQWtSaWlobUJx?=
 =?utf-8?B?dS9WckxTMm44MlhWL2dTNzRITXdPT0I4cDJQc01oSWRKNkZYMTRTOTcxUzB5?=
 =?utf-8?B?TEQzL2M0bmFwZ1QwZ1lLOXg4dXlEV0hyRUc3ZkZ4TWVOaXcxVGcxUS85YmdQ?=
 =?utf-8?B?NXhiOXJqOW9OaHhpaG1yRTh4RTRPZ3UvN2gzb2dPQ0pFK1hVbi92Q1E0c21l?=
 =?utf-8?B?UkdhWk4xQVQxMnZiem1TZlRTWXl0eGY5NnY3UWFiYjZHT0NyYTBIanJ6R3F6?=
 =?utf-8?B?cmhzS05qdVIyM2hzdjlxaTNzbEN4YU5OeVdxbFZFUEtSSExxaHVIZU9Na3dj?=
 =?utf-8?B?YmcxTk03bG5MVlpWcWNWWEZ3ODloSlIvTWJiRTg0bEttSWgwWjJYQ2p3bnlH?=
 =?utf-8?B?T3Ztb2diaUlFOFk3aTNEZWs3Ky9TSHdiWWRONm5BY1pZRGxFM3Q0VThoREly?=
 =?utf-8?B?elZzMHB4NTZJSzNFNlBrRFlzaVN6YVVYZWdWYWNyb3cvWm94aXNWRSs2ejJI?=
 =?utf-8?B?WGRUYVh6bjE4YUIyNHJKbjVUZ2l0WU9iTi9MSVQzRFIvaHM1TzJEbGk4bTlm?=
 =?utf-8?B?SmlpbXQzRDNxSTBod21DclBxbUdzSjVyK1JZc2s5c2NybVpTUlIrZDhJeWxi?=
 =?utf-8?B?UlhZck9KcDlXRWhMcXkwcDF2bjRCTHErMHc1TkM3b3JobzFZKzdxRm1RRTlT?=
 =?utf-8?B?VXNDcUJ6bDlNd1hqaEZmYzlkTy94ZFY5K3cvNlF0V01hTmhhYlJiQkNBcXRw?=
 =?utf-8?B?NnJGYjFMWmViM0lDK2RKVDdxbGZFK1pQdzZ5MmkybjJRWTFTY1ZETkRRa1Zo?=
 =?utf-8?B?bDc4WVE4MDZWL1NEdzV6blhLZnRuL050a2xDVmozaFE1YmMycUl1Z2lKMm1q?=
 =?utf-8?Q?Vx5pjwG20iBnz+sTmAYirnZYvjTpx0dHtCYpROL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a1c1ba-6064-42d2-ee40-08d8e9f03a27
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 09:28:45.1009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbAXCit2MWaZ3O4qR0EUBtxvZ/DyhxM5+fjHbzTsFssl5dtINzRKNo7WmMmcWvyAEF24hp1hJGjZqkyAtIDR2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4769
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/18/21 4:50 PM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Wed, 2021-03-17 at 23:09 -0700, Khem Raj wrote:
>> On Wed, Mar 17, 2021 at 11:04 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>
>>>
>>>
>>> On 3/18/21 1:45 PM, Khem Raj wrote:
>>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>>
>>>> On Wed, Mar 17, 2021 at 10:40 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>>>
>>>>> Hi Khem,
>>>>>
>>>>> Understood your concern, but skip elfutils here is the least code change
>>>>> and the gettext also use this means previously.
>>>>
>>>> gettext perhaps can be pardoned since its the one providing these
>>>> macros in first place.
>>>>
>>>>>
>>>>> Meanwhile, there should as least as possible recipe need to skip wiping
>>>>> macros. If no, we may need to reconsider the related implement in
>>>>> autotools.bbclass. From this perspective, I think we should better
>>>>> record the recipe in this general bbclass.
>>>>
>>>> I agree, but so far it seems its only elfutils, if there are more then
>>>> please mentioned then to the list
>>>> and perhaps a different solution should be sought.
>>>
>>> Currently only found elfutils has this problem in my env. I think
>>> firstly if only one recipe, it's no big deal to record here as we wipe
>>> the per recipe macros in this autotools.bbclass(I didn't find other
>>> distribution wipe the macros). And secondly if there are other recipes
>>> need to skip the wiping, then it's just right to record here to prove we
>>> need to reconsider the related implements in autotools.bbclass.
>>>
>>
>> this class is used everywhere, adding a check in this class would mean
>> its executed in every recipe inehrititng it so no we are not doing it for
>> one recipe.
> 
> I agree with Ross and Khem, this isn't a good fix. What issue are you seeing
> with elfutils? We're not seeing anything in our testing...

Hi RP,

Currently the 0004-Disable-the-test-to-convert-euc-jp.patch doesn't take 
effect actually as the elfutils m4 macro files wiped out and also result 
the below failure "bitbake -cconfigure elfutils && bitbake -cpatch 
elfutils -f".

Anyway, I will take other solutions.

Thanks,

> 
> Cheers,
> 
> Richard
> 
