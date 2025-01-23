Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1920C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:39:31 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web10.13235.1737646766626935538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 07:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=jPtevQZa;
 spf=pass (domain: cherry.de, ip: 40.107.20.73, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDWkbNQwYuCD5Q91tnfbiJ1LK6w25N5AshBWmzwJoTXqSt9hxiVmFfV/h9qmdrGRdxp4Y0u89ee1+882lDZuQHjRg3U1oxWXAzs9KUlriMO6cSkKimpYDrTIU5MRL12tsRWOckiSR+QYai1r9+AqNrXSJr/5js/uEn4r6+dsaKFO1ALgKANXFsgArKy8H6dbgK+I2tVaBe95DqV22TDJDHgnK4WBVEIxjoBGkhk6rAlV3QARV+ck9JCMi8doVT6u/ffnoZItKU8NlKCQv7D8go3ZsuW4CKRzMMWVfCBy46Xypa+UgvHuVqhJVQqZcEh5L9EVDr/V/ZC1sg+3xLhdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MtptdVq/TxGirkfAqPUFvvhNy2Bf5WHlItuNPZ19JA=;
 b=K9TWsAz1ArKfJ3dbixbSdPjWbroiHdAi7Qh9DGrj/+iBiatNYiajHaNNZQpnGly+an/zWz+LszzDzv1hjufer0OgbJ6U+hjA5g/wbxiSq2+z9wO1NQgP3QKjcwm23OfuwK9vlWsx/lzeP2+AlRCBUcGpMfSQI4jgT83uINyFX81lx72uJ2C4JBGThWS2bpzmuMZ5CMI0alJilcET56cuYPaOe7jbe8YrC63Z1hdEQKU/TUguN8uBPUeoWgCQ3zpD/uii10oq6xfHda2cPrnwYHpmQRPD//JZvJP4Ad8TZPkfpHkHznuV9M7uKVEazEBCtS4PU7H1Il4Zwf61J11qSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MtptdVq/TxGirkfAqPUFvvhNy2Bf5WHlItuNPZ19JA=;
 b=jPtevQZa4hvzdtSJU1xZ02izdQyagYmBZYgWgd+Hw6fanBshy3GKlu/cjw6/IlEE6rLl92v5C/zqjKmdHFKp5TzVNeAjC8SLknJRZ0yvkKpJOXSGmNgmhgUcKr1xmCOime4JR0MD6Qf+gE8ifPNj14IYiYFwMOjCPTyKnYlCnkU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 15:39:19 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 15:39:19 +0000
Message-ID: <8ca1d6a9-9e4b-46ad-9e8c-6da619e13050@cherry.de>
Date: Thu, 23 Jan 2025 16:39:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] add basic b4 config file
To: Richard Purdie <richard.purdie@linuxfoundation.org>, foss@0leil.net,
 openembedded-core@lists.openembedded.org
References: <20250117-b4-support-v1-1-fe74a5f50eb6@cherry.de>
 <2e7ba5852015b3bc94c6e4a7d0acae2169ac0bdf.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <2e7ba5852015b3bc94c6e4a7d0acae2169ac0bdf.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0227.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::7) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea4c4d5-8ab7-434e-686e-08dd3bc419f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b3ZkYlF3UnFIdjA5MTFUMDdidHFuc3M5QlZrMjAwYjlncFh5amY3OHN4SVdi?=
 =?utf-8?B?T3BJZXk5MjdwYWc5WUhETEJ4UldOUmRtb01zMFI4UzhCaGoyZDhrR2czcklS?=
 =?utf-8?B?UlVrcVFpdFJ1cldUU2ZuSnV5UENzeG90aEMxOFhTSDlvVzBaaHg5Z201QS9z?=
 =?utf-8?B?Sm93UE95ZVFFUnpqQzJwRWtXaGpsb0tVVmRGQTFLN1VVeHJjTnJPcDgyakcy?=
 =?utf-8?B?RjlTbkNrZDB6ekNZWnlpOWpSNXMzdG1xVElyZmR2MC9KQnlXUU9NUFRoWTdr?=
 =?utf-8?B?WEdQR1ZtR0NkN2psbHlFVFpENW9RZDJkaSt0c0xVVS9EOGdjMFVzeFVwMEFB?=
 =?utf-8?B?a0RNRnJIU1JRVTI0UFE5N2E2R1lSU3U4cGpNYS9qeVFJZlp4Z1NUektXU20w?=
 =?utf-8?B?NVFoV3Z0eUptQnYyMHRjT3JZRHhYbmJ6Wm03WmFWQmY0K3JDN2J2eC9SaS9O?=
 =?utf-8?B?ekN2b2V1dWJ3aVJKVSsyOHdTdWEyM0ZQTEt4MTlOYmpsSkJsaGhXT3FGblBa?=
 =?utf-8?B?T2VZSmV3SlNhKzlnV1laOVBpR2VzaWk4Q1ExdmwvUSs3OWFtSVIxR2k3RDNi?=
 =?utf-8?B?TkxpZlhzR0VZeFFaQ2hlNUkyNEpBRHpId1Fya1FuMGNPYWpVdUNTV3ZGMXl5?=
 =?utf-8?B?RWpwaGdCNERVV0EzTlMySnFScUwxTXVQdWt6bitRMlFMQUozVHk5ZU1Vb1BM?=
 =?utf-8?B?S2FvUjFreXpJUDE1QWhqM2FteFphbmQ3RU5xYm1rb1BtYUloY0ZPbW45Slhu?=
 =?utf-8?B?OXIzZ2FCWGZsYWFyUmpwbTdvbHMvdkJERXAvZjdQazFjRXk0TEtsR2t6L1BH?=
 =?utf-8?B?YVY5a0xlMndZc2NFWXAzU2hXaEUrOGN6YnU5VzJlRmlBRnZoL0NVOHNET0ZR?=
 =?utf-8?B?SXdzTWFvQ3M0WVQvZzNTTkhFNE9icHRKdWUyayt3REowYkNZbjU3bjQzZ1JM?=
 =?utf-8?B?ZFAyOWQ5SlVuVEhOU3Q2aDgxK1ZvQlV5M2NyYW43UTdWQXJTK3dWWDdjWmdk?=
 =?utf-8?B?TUNZd0s2NC9hY0s3T2h2NHZZVmJ3bmYwR3JRMHZMbUEreG1sNzBxaENyY2gx?=
 =?utf-8?B?TEs0cTczWDNtZXExUWpkZGRzZW9pbmk4ZmducG5ySUFCT0JQQXFXOVV6VUNw?=
 =?utf-8?B?ckFxVFB4U1JTWTBvemozWDlVbWhwWUpvMTdtMnJjUkQvbUlCU251OHhyWEtj?=
 =?utf-8?B?dEJFMzU3RHF0Ylc0a3dEbGl4VHQvbVR6Ym16QjZ6WFVJZCtrVjVzcnlkZWgz?=
 =?utf-8?B?bFhKUjhVR1lzVGg3YU9lUTIvNnQ5SWNYazRuOXpLSWFiUzZFeDJwZk9SaW1Z?=
 =?utf-8?B?dXVmeWFzaHdQNzZDZHREMTFpdWQwSVFDZ3cvSVZZZlBkLzlpSWxyMXN0OGZR?=
 =?utf-8?B?MUNsSE5abytNTnhJUGZPZkY4d0c2YU9IVy96WTgxYW5IL0QvdFk5d04yb20x?=
 =?utf-8?B?cVp6WlU5eENULzBNdGJmSFZXN2xkdUFSSDhidWRwSlBEU3kzVnFiNFJyb1Uy?=
 =?utf-8?B?enl1TXM5T0RTWWtsTjNObFdEeGVyMnZyTlhNSW1OK0svVjluM1Y5QjNVcWJO?=
 =?utf-8?B?ZTdxbHgwSCtSc0lmUkV2dVFHalB0VC9aZEpEdkt5OFlaV3ZKYnFEbW14OTFV?=
 =?utf-8?B?SDlYY3RQblY2cHZDbzhBUE9WWW5LOVR0ZUdTVkg1SDYrc0Y5dTd2YVo2Vkov?=
 =?utf-8?B?VGR3VlAwWlhXaE1lNDZJWDRpUnVNaEVEVytrUTNKYXdjMllOSXA3dktnSDIr?=
 =?utf-8?B?UGRxbzVVODJPSmozTklBMzJ5QW9rS05xdUhuZC9lT0dqRWh3aHp5MTQ5SGQ1?=
 =?utf-8?B?QVFFK2hua1ZNd0I2Njdndz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkxHT0Zhcnd0ZUdEaU5xNUxBcUEzcE1CZzE4NEYzY1Z4a01LME85T0xBaUpT?=
 =?utf-8?B?REg2b1gyUDJCY2R5THVmRHlZS1dKejcrdFJZRFhwOTQ5RWZQVTlhRzBYZFBR?=
 =?utf-8?B?Rks2cWUycFdvWktvb29IOEx4dnpTdXgvblJsMkNVSVpnZ0FCVkYzVko1NVRJ?=
 =?utf-8?B?YnU0MytkOElRc3lnZTdjOTh0RGxqZ3d0cXNaM0xVWDZKVGF1cG9UVlFKZkRT?=
 =?utf-8?B?dFdiNitxc1hqRkx6endSTFlLUzNsL0xjRGlURGRoMFo3Q0F1UHI0Zlc3Nmo0?=
 =?utf-8?B?ZSsxQ0NsU1dsMWl1dm9SSDc4RTQrcUVkVmx5KzJqWkZPRWFFUU93SU1kcHpV?=
 =?utf-8?B?S281QXBhY29meHNuSS82bllNZ0RaelJmSU5XajVvb2R4MzBpUEhJSWhXaktL?=
 =?utf-8?B?cFlxdjBTMVAybzgxQjc1UUVqRHFubEpJb3VyeVJpWWZDNWlUZG8vbDlQZWVV?=
 =?utf-8?B?ckw1dWcwOTBSTVNOd1NHWDZxR0s4NzRTcUNNUTg4OTRWd2pZUFBDWjNCbjNr?=
 =?utf-8?B?aXVkYkk0Q2pFdWJHSkdzYURaSWFkZ3daTzVac0o1UVluNW5NTFBqUFAzdmND?=
 =?utf-8?B?ajBiUEF4eGdJelBNSnZjb3l2YXhOQmlDVFRnVDdUK1Awam1JaTZUZkJOY1NI?=
 =?utf-8?B?ZnhnbXgySE5HUXdYaXExd3VZQXdKcy9aUCtseUQ0dm1FRVlNeHkvRmh0aUo2?=
 =?utf-8?B?UmlxZEpuaTZQK2FocHcvQitlYmhKdnR2OExFMzFWSnJ4SXZERFo2R1NPR01F?=
 =?utf-8?B?L2EyMElVUG5HUVBrdE94T3NvV3pyVkUzVk9DeWVicW54RHRWOEFVTWV0OWxU?=
 =?utf-8?B?SWUvNi9menV4YnA1SDlVc0MzbHV5YlFEeWR4Z2FRakhHVW5tckcxeVRlbXl5?=
 =?utf-8?B?dVF2RGVNTkEwTDdwN2RTN1ZYQnAxbmNCWkVXMnB4VzhPMThRcTB0L2tDNmho?=
 =?utf-8?B?TlV1NlZJazZsZ2NxZStNeDBtc3crYWRnRXNUVllGUlF2T3p4RFlWTzAyN0lD?=
 =?utf-8?B?elBBT1dwTUoxTXlld2lKRUZqTk1laUJCaFpwNy9EUk9nRU1Cc3YyZDV1UzF2?=
 =?utf-8?B?R1JHMW1LNmQ2NzNMZWNtajlZK3VTSU9OUXFpZ0pPSks1NWM2bnBlRVJpdmJE?=
 =?utf-8?B?NVZrb05YUmJoeFFvN2JSVXBZa3dTREQ4MkMzWlpZNVRIc3hSbjZ0YW93M01a?=
 =?utf-8?B?OU8yR3JZYzFSL3dKU2lST0ZpOWhGZjFmVzhNVG40RlVLT01lZTFpSzN1dm1h?=
 =?utf-8?B?elpiL2llenBteU5IVUtvY0dQYnZGWkZndU9wMEpVbTNmUEpoQThybFYzaU5p?=
 =?utf-8?B?Yis1Y0V1MUc2SEdVb3c5ZVJpVDl0UzVocmV1VTg5M3JjQ1IyN2U0czhZcXVj?=
 =?utf-8?B?b3psdFV1WWZjWW9KL2VFYnovMnZSSW5BY3NkMUJBL0dyNmgvRm51dDVKSlNV?=
 =?utf-8?B?U053NW1FZTdQRWhzakIxU084WDN1aTFEWEVIYW9NNmFCYURCRHRmU3ZJc0Fa?=
 =?utf-8?B?NDFNRDh5c001bVFQNDVLTjVFUG96d2FIdFY0anZyWkhMcmlxNFloT0tkalJB?=
 =?utf-8?B?VlVBMTVsdFhZK0lDWDVLd3JRRWhVS3ZJb2k5VVlMbTFLVm9ScUFNaHcvbE1Q?=
 =?utf-8?B?SGRsanZFVEhuSWxKaG9OdHhEV2R4UWlUZk9mR1VFZHQ4Qk9IdnIyVk5tcS9t?=
 =?utf-8?B?VGU2T05WSHQxRlExSEJSQUUwNGdhekpMS0E5RXpTaUR2RmNtNkx3b0hZeit2?=
 =?utf-8?B?Vmw2dGpYRUxYVnM3MTRoa25BWERDWkdGbFFDK2RGSEc0dTJuT3NCbUN3YVFk?=
 =?utf-8?B?ZEhEQ2Z4V3dIWWRYZHNZZTIvSzRTMmgyRStjNGdZV3pQY2dvaGpsR1YwcEdL?=
 =?utf-8?B?RklobXJvMkdTb1gzQi9FT3Jrd0J1cDI3c0JhNlRRV0lUOVZ4NE9ublY2czFU?=
 =?utf-8?B?K0dUbzJTM09WcDY3M0dhUHR4ZVBIajBEQnZRYVpxOXZGNEZvUVFVY3FPOXVC?=
 =?utf-8?B?cjRsclJTRzhJb0lHME4xWC9Pa0RsVHo0dWo1SitHS2NYdHdrcTg5VWJuZDRl?=
 =?utf-8?B?N0NSQllnM3EyRUhWazFMNmUvN25xbFcwTUZlTVlCaDI1WGxIV3VRNnVkVDhK?=
 =?utf-8?B?VDVqN3NuQVpPOVFYRFhlT1NWaFpEc1FaWUlMRDdsZ040L2RPTzZsWVFWRW9S?=
 =?utf-8?B?clE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea4c4d5-8ab7-434e-686e-08dd3bc419f2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 15:39:19.3239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQVTVSOTe1Z4OQUr3+qZrxJxwaXoHZ2pst/++u4eET5cULE4iL72zjC/wUnXAmgXBAv+kFnbJByU+oPTjrrD3kOHCqoRtbBDNYqNbXrW0DU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210195

Hi Richard,

On 1/23/25 4:06 PM, Richard Purdie wrote:
> On Fri, 2025-01-17 at 12:59 +0100, Quentin Schulz via lists.openembedded.org wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> b4[1] is a very nice tool for mail-based contribution. A config[2] file
>> exists to set up a few defaults. We can use it to set the Cc recipients
>> to always add, in our case the mailing list.
>>
>> Because we do not have anything to check for now, disable needs-checking
>> so patches can be sent without running b4 prep --check.
>>
>> Because we do not have any auto-to-cc support (and the implicit one
>> using scripts/get_maintainer.pl cannot work for us), also disable
>> needs-auto-to-cc so patches can be sent without running b4 prep
>> --auto-to-cc.
>>
>> [1] https://pypi.org/project/b4/
>> [2] https://b4.docs.kernel.org/en/latest/config.html
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>> Note that this file should be overridden by the one that I'll send for
>> poky by the merging script (no clue how that would work), i.e. an update
>> of .b4-config from OE-Core should not override the one from poky OE-Core
>> when we merge/cherry-pick OE-Core patches later on.
> 
> Did you send one for poky? I was waiting to see what that looked like

I did, but I was not subscribed to the ML so got rejected, and then I 
forgot to send it again :)

Will send it again. There'll be a python wrapper to do things "smartly" 
but I'm wondering what kind of license and copyright we want for it. Can 
be discussed once it's sent :)

> so I could work out how to handle files. There are ways to do that but
> I could do with knowing how things will ultimately look before I merge
> anything.
> 

Oh sure, I wasn't expecting anything less. I actually had planned to 
send all the b4 config for poky, oe-core, bitbake and yocto-docs the 
same day, and then my patch for poky didn't get through and I had sent 
the yocto-docs patch to a non-existing ML :)

Cheers,
Quentin

