Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.87])
 by mx.groups.io with SMTP id smtpd.web08.5999.1621329162277618660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 02:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UWQwuOeP;
 spf=pass (domain: windriver.com, ip: 40.107.94.87, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epOGmMew5e7m9u4FGGIPBQIZh1HgXUrA4CaI72MimxsFOIvXaf0th2jJRwjpfgR/WcPmhpt0Acmg3+MGoKt82PkvckFYP1gaUuMCnlU2Gli7HBASx20bdK3aO4Hgw8TuirDZzGjOP6Yx1ckhLkyiGRRJQ3qS4BqSZqsqAlmooIwCBQ1wYRFp2FgKHfaA8YXpEk7x3a3RLrutlXxZ7euu9EBqAXuR9XPmF2YEF40Mqd0pPIQ/BCfMvZWsShfRbvx84fv8QO0vlfzBIxT1nlyXeu/dt8fZIZeDulx6+3N/tphJEgiyOp6V4LLPOV17Y7d+rbMMG2L3+TuUFJ/1BTB5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6nnecv7U8Sz1tgd/8dmNBtU0IfICV91fVcke9tiM+s=;
 b=ICtCFloHe+s2ab9dxcXFhnGgfNQjt3WkNDlPzJpN9PaY++fXn6i6pcVKuKFirVBJtEjHa9quCJhpLYnkvntGSvxslz4DzKdgwnAXxWxqNcZyZJHpD594BTNQfmV97/YHPLzKhrjulLvOzR+9cGHoSK1JNCuwDWDXz7nkQsYtzTbRGSYoe82N+pVKQR1SaNPoxXZ+wOW0Rw0eVJLAhqX1Qg0vZ0fdLcBJ7tEcQndD8swOVzx8+I6M4WKLwXbPiOSx1IM58PpTrj9y99HsQCxbQ6ngUFeHFv6Wpn1Xnr8hfv5M5RMVHIGwg1PQ8gfzMCw7MZjW9Cexp9hKVfH13B4e8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6nnecv7U8Sz1tgd/8dmNBtU0IfICV91fVcke9tiM+s=;
 b=UWQwuOeP5YQTKnau34PkkmUZW2Z3PCQjqknLf++7MZu0tf9V3uTJN/S7DbDyNdUVoadLZ6C0vgvWXLK5HO0GY8s7wTPdRTxBT6Rqjp8Ef+7f1R79CodQE0vVuZ4ZiWE3YkG/Ye2RcFN1JRmmZedRkYZSMB8loAOU0UVwvjb4KVU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2679.namprd11.prod.outlook.com (2603:10b6:a02:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 09:12:39 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 09:12:39 +0000
Subject: Re: [OE-core][PATCH] sanity.bbclass: also check invalid char for SDKPATH
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210518070655.39921-1-Qi.Chen@windriver.com>
 <a6d2e07f64e319e6750639a5d737ff0d5d4bfdaf.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <41621163-667b-d133-881b-7f6402489299@windriver.com>
Date: Tue, 18 May 2021 17:21:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <a6d2e07f64e319e6750639a5d737ff0d5d4bfdaf.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0141.apcprd02.prod.outlook.com
 (2603:1096:202:16::25) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR02CA0141.apcprd02.prod.outlook.com (2603:1096:202:16::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4108.32 via Frontend Transport; Tue, 18 May 2021 09:12:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04e8fd0c-da2b-4849-6bac-08d919dd15ad
X-MS-TrafficTypeDiagnostic: BYAPR11MB2679:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26791C3AE3717C4D9FD8A914ED2C9@BYAPR11MB2679.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vMO8ViYPMkle4LuJSyhvy0BLxDmbJr7VPy6snrVAO2Ek2QcA8Up/fSDjS2Lsndvps1MdYGsNQqH0qjhqgljbq1RT2VPJtLwIDc7cpOF0g3ksn5BJuKO17vog8DYinrgO03iJCEpfg7XLR2c0YmZ+e8j5r6h+qjzSnFY76JOEmPEqZ9qNBQyQTf0rF1+jurXE9QVWI8/sj7AdJp8CD3skPLmS//OWkkNQleAVDUa2Yq8bf43bUikxGHNidVuqq5psEOOy6UTFoY1420GkQUpMe5KN4ldZSvOQBZb+skgr4bBWxee4qBPbkRCtH7nF7Zg3etEYqzGF9JZjkAUIEce7ZCx3OznXUqEOrBb8tv7OmvI/QMGFbRPK6TFkgJyNjaNJVimXFuah9BaxlSxuqPbC6ffCMoE5yT79cfNSj0Ldq3NqqJlYo+WSeDpCshOsXYnCb6MTeFzrqBpuJuJ36dPC3H4IOR4YwtBhP6/nk+TwuU3JAhEKarjRfklRdgaDrbgf4e+OxIkSWukXNASftgyiEFWQdA1iQWsWEY2MbRl1xTW+6v3bhRndBdS/u8lVeWhLKn0UHLmhY3TDO1aRFmCjB/efZb//H119P3s4szmMF6pnEpbohLsj/wVAQI3eVRzaXzeIf976T7SuN6qPzzQe2kmFjDgpA27zSP42QiQ8F7s5dgUfJa3yDAUNFwaMOvmI1VFQp7DaT2wNMIcYwXwHunr5qwYbgmIDIaEOeMEUrGU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39840400004)(136003)(83380400001)(36756003)(8936002)(478600001)(5660300002)(6706004)(2906002)(31696002)(38100700002)(8676002)(53546011)(66476007)(66556008)(16526019)(316002)(52116002)(66946007)(6666004)(16576012)(956004)(186003)(31686004)(86362001)(38350700002)(2616005)(6486002)(26005)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RW9iU0NoNEh1U2o3a3Z5NStKUjhUN296Slk2RnRYNTJMcWpad0ttSWJ1cUVE?=
 =?utf-8?B?M0F4TWcxUWNSdTJXU1dZRFlBbTBldmorYVUzUGVadVFQdWtscjloQkRVbzUy?=
 =?utf-8?B?R29rTlo1WFVZc0hRWVZBVjM1aVl3TmtWSmE5RlVMQmp0TGkvdnM5bS9wSnVH?=
 =?utf-8?B?TmxkemFqejZYN05aRmxMU0xoWHMzTkYxL2NnSGVTWXl1NDJvS3gyRmNrYnIr?=
 =?utf-8?B?THVCSjNYTzhqMlNSVzJ2azBCLzlTQldiYk1qMms5Tm4yOFdSZ2xwNUhqVFdS?=
 =?utf-8?B?NjdUb1FaVnd4eVlWUDBhbU4xUm4vYmY1RDFoRVZUa0ZLMThaeVFjL3ZvL0FX?=
 =?utf-8?B?T1NpRkxuUGw2ZUtLQ21sYlB2VkdRRDh3bE0vRVZHQzJEL1JKRW1IT2xmcnBo?=
 =?utf-8?B?NmQybXRHcFR2NnMycFBmTVRVd1d6Q0NhY0VNc2hUNExpTHFFaEcwV1BLOGZm?=
 =?utf-8?B?WTdPZDdSYUJ4dUMzWEI4Q0syajJzdjFmUmJXZWF6aStlWGpLUHlXV1lrRTlF?=
 =?utf-8?B?NFlUNXYwWktGYmtXM0ZzV2x6cmNmZW5nMTNoTHhFUFFGb1docUo1MlRUVEVL?=
 =?utf-8?B?RDI5SXhKMHp1TmRTeG9tdFZyNTRRN0Vvb3Y1OWRnU0VnNDNsWW5GQVJTQmhy?=
 =?utf-8?B?UlJQK2Z1VldVWFplRzlNajJiZTZoSDRaTDF3ajg5alpRWEhQVU5pSElkK3p5?=
 =?utf-8?B?RnBDQXlxeG44bnJrSFgzV2EyM205QnhNNkVEd1hhY2J1eEUrNnQ1elZRL0hG?=
 =?utf-8?B?clZpTUVydXlhQ2pYWndhYTZPNW9xVnlSQ050UmRxMXE4VUFPT1FOMVVWZ3ZE?=
 =?utf-8?B?S1JqZVJRem5EQkEzcGdyZlQ4R1ZqUGFvbllkM2hLekx2dk4vaklqMjJud2Rl?=
 =?utf-8?B?Q3RSMk9ady92ZVNNUlE5dVpIdzJlUC9VNEJJc3pKc25kekxTRFRRZXpHNnBS?=
 =?utf-8?B?dFI1MW13TGVNMWFBcVFNbjI1dmFaYkV0TXZUdkIza2hxYlhmek43TzRjbWcw?=
 =?utf-8?B?OXRRN3djM1ZTNnM5S2syRDZaTXlxdVRiZkNnMGppdHFvQzc3MDAwcVRFVmpX?=
 =?utf-8?B?SG1tRnpiWllxUTR2QyttNmR2Ui9vK3Vrc3F0Yzlndkg2ZTlodzE0VG14THI3?=
 =?utf-8?B?SXBvYUtxMWx1WE15amxnKzB2TFN1MjZoWTV3ZmZXK0FLbG16Mk4xRGZvdm5S?=
 =?utf-8?B?TGRLNEdIZWFOaS83QTQweWhqRXhxOTNhTW9rWDVXallYb0lBME9pRVZJMi9p?=
 =?utf-8?B?SEYvell4OUNoVWNpRHBReW5ZRjU0em9UUDdLUGZLeUZnK3FrbXZDdGRSSEgz?=
 =?utf-8?B?UFFyMFhtQzJyMjJkT1hLM1dTdDR4RFZPRGxpcGEvTndUa3N6b0RybHRzcW90?=
 =?utf-8?B?Y3QzQW8xMjhCSytUUDlXSkJvdmFZWElOcGVxYlVYa0lzTXFsUjRSOURseko0?=
 =?utf-8?B?NVo5K0RhOUpVSGhRZENqM2g5dXcrcHM2V0MxdVZFNW45TU9XL3ZKc0VEZmlP?=
 =?utf-8?B?VkxhY0c1RXNwcXFCazd2RkhZMWE5NjBidmZtanpneTMxM3BscWZPbkluTEcr?=
 =?utf-8?B?VlN0UTZpYTc3VXhCdW5UU25lWDdYOVZvMVdQRDZXdmZuUTArb0VSTDB4SzZN?=
 =?utf-8?B?dWRIUkVNSU8zeWdXby9oNDFsRXdwMmVoMmpWUFVHS0VoSndzY2w1NWEwWFVw?=
 =?utf-8?B?S3g3UXl0OFc5Vnc2RmVBSmRtZVl3TFpmN0FwYUJSbmZzOThMczBoT25RVXNI?=
 =?utf-8?Q?w6fuXRaC7XRyPtGFhSbupRTv/Q4vrQCgkRP3EaA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e8fd0c-da2b-4849-6bac-08d919dd15ad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 09:12:39.4348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7c6o0EuGVKUiCWqeBwPN3DLA4TG4gLg91PzeNlX4gC5g/Uw8+AtUqwDsuvXRs56D+84Szn3Pscs6QDk7xA7Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2679
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2021 04:53 PM, Richard Purdie wrote:
> On Tue, 2021-05-18 at 00:06 -0700, Chen Qi wrote:
>> The invalid char check are now only for COREBASE and TMPDIR, however,
>> the SDKPATH with special char could also cause problem.
>>
>> e.g.
>> bitbake nativesdk-xxhash
>> And we get the following error message.
>> Makefile:422: *** configured libdir (/opt/poky/3.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib)
>> is outside of exec_prefix (/opt/poky/3.3+snapshot/sysroots/x86_64-pokysdk-linux/usr), can't generate pkg-config file.  Stop.
>>
>> This is because we have '+' in SDKPATH.
>>
>> FOR SDKPATH, the valid char requirement should be the same with TMPDIR.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/sanity.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Given that the + has been in many of our SDKs for years, should we not fix
> that individual recipe to handle this correctly, preferably upstream?
>
> It doesn't sound like its a very common issue so may be worth fixing rather
> than giving up upon...
>
> Cheers,
>
> Richard
>
>
Got it. I'll fix the individual recipe.

Best Regards,
Chen Qi
