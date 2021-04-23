Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.67])
 by mx.groups.io with SMTP id smtpd.web08.1582.1619193968907046631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 09:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SpH9Le7Z;
 spf=pass (domain: windriver.com, ip: 40.107.223.67, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRpz4UQqvh0wDufK6j8uv+E3qh502pxvoD3iU14AHbvoDRhnog7sS64Ot01vBfDrgrnxVrWb5fjbMmVnrtxfVcg3Om1bHxTdgnD6Ti+XBVoTcNV6KUNLP0tBRhIjX+/rGe2TRi67wfcdFKNydoZz2udtL8IT6Xeey1XfVV3LreqzPD0H5aOl9aWZ1iagqCEaTpPfxuSIPmfai6B2na4lN5tn5bJLGYObBk0cM+FmC05TRzvhdGKvDiYIYcMkiiHetnjOaMJVNCVZ+mnPt1qihSsWuZUJIRddgG6JrGBezHntIye14xhQfh3qqxTZIQYA6CeXx/3eIbNK44Nta30kQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICcYcq7WHxyA7YjzEVruCjoNNH+TaIb/YF2uDLzcSlo=;
 b=mnZhXLz5vClGqmeKrVEWNHwgmIi9QqsE0BhjuG4I1UPIPxDnvtkffqiLveO5iOuH1HN9qL8ytFleyhJqjlUc4o4Mkz1wXmwXDuceItT/XXxHlb0u+80/Mp0LJbe5c649vcUhtgAR/tdlS3TBchIPTbBiaUPSQtYBhhWcuLylcPUb9cok1YIELdSRzOal6NNa/+MLwKg9pI9vX6yEajtBUkesL+bLP/3kTn2vOT0XejXYYnjWX35n5fLvEVfvVPSpFIf/7VfvfUnf9AzVVIbEf7fFUTBZj23HWKeE56HBygObt2qkmX3nerDPzp62Edk59mcDdJqaKMY7RT2htr36vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICcYcq7WHxyA7YjzEVruCjoNNH+TaIb/YF2uDLzcSlo=;
 b=SpH9Le7ZeogO8+JUhPLXDokXw3ICLy/5klM7ITXGnGJs3kdtofWgJqQuqrhVkB3UrEWkylET5jYwaS5dlh6x0BSXAraOeafGPdG4rNLYM3X6Vquiyx1PFH0CRhHLxriuwG6JpDhtsmN4C46mbBK6pe4F9Ke5qTx7yH8TgrcTciE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB4939.namprd11.prod.outlook.com (2603:10b6:806:115::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 16:06:06 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 16:06:06 +0000
Subject: Re: [OE-core] Need suggestions: in case where linux-lib-headers and the kernel versions differ
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Sourabh Banerjee <sbanerje@codeaurora.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <Gvtb.1619190188941654950.yc90@lists.openembedded.org>
 <CADkTA4PbOd459xYigZh9q4Eh5hxyK50t=poH6B4HOqhNeMYnCA@mail.gmail.com>
From: "Yi Fan Yu" <yifan.yu@windriver.com>
Message-ID: <da4aace2-faba-d14b-1565-4c3ae192e63d@windriver.com>
Date: Fri, 23 Apr 2021 12:06:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CADkTA4PbOd459xYigZh9q4Eh5hxyK50t=poH6B4HOqhNeMYnCA@mail.gmail.com>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by SJ0PR13CA0088.namprd13.prod.outlook.com (2603:10b6:a03:2c4::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16 via Frontend Transport; Fri, 23 Apr 2021 16:06:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c67566d1-d204-4a2b-5fe7-08d90671b3ab
X-MS-TrafficTypeDiagnostic: SA2PR11MB4939:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB4939A5A693A3E2A475AFCE2E80459@SA2PR11MB4939.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X4tEWkdBMpPCpetm0CtGfiseK/GN8GuwVU4yAFXO+foASSBHxFTx0eDE1o56dmMNPpc9tZfdwSRn5BjfRBkP45lEOsYgsmxrdznwR1R5z7w2Js5RmsoN/jWhM/5ayTmUU7U/ahaMAA+YMfI1B4ofRi4s2TpRbVevidVNqhJMqhKg8j8lE57zZqSagQO9lsMEyQnhfHEaajOnLDZY+DwAkM5jo5eVMiDc4FQ32PlyRf6mXD1zMPzChqzSK4MCilc8k1JyOuzKsveqmCq61pBPaHG6cgx/VlGKoyXY1oL1SyraIPNDLLPHQnJ62eQylRej9rAsKfrufWOx5pj77B4RbhwUWRSDZ8AQUE6nn36kEIv6ufNQ3Fd7q5M2mmia3kROlaKAoSHGDgItsPOVJ5f5J1c/wuex0aRBDmvVSVSnsNpT9dgO0tgmeSfT3cj4+q5Sx+a0+2QM/UcPZRm6xn8aOPcxBgWcpS7ijWrIXR2RGfESfv4T6+9Iq/3uRGjVImx9sZqs6aTjVz4+4Retw/9P23DYhDP+5vnsrDuL+xcJpsP6QD73tMgaAlxQRs51jnX5qoAoJHw4kIGPFjc1fttqAyGrMwyj1WfDUr5Rhk/MM4JFpWl6paCcQ7c0UajmCVCDHrMMAwrE0RENQ8aQT1HM7qfUOnpbVcwXWFyj1ba67B65IjQoKWTkzyufvrhnE2OPCsL90GWWX/zC4Pp/Vg4LXy1ZGdDT9PetDqhbPNmxT4OPXUWPTcWqw1lZho6OCxIWz44FhtsFyU5oCRiJqltCeRRLAxhfclx9aKpTchEXM4M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39840400004)(186003)(66556008)(2906002)(66946007)(16576012)(8936002)(5660300002)(8676002)(53546011)(52116002)(38100700002)(31686004)(66476007)(4326008)(38350700002)(31696002)(6666004)(16526019)(26005)(6486002)(36756003)(316002)(478600001)(966005)(956004)(86362001)(83380400001)(110136005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?K2E3TGtwK0loWGNxaHhGOGd5UVN4aFQxbWJGM3hpRkhESng5bVc3RnNBTkcz?=
 =?utf-8?B?UW5PblMzWWdwVlE2WW82VjZPaThjaWh6ZEVZNVhYaGhxYnZVNi83SXI2SWZ6?=
 =?utf-8?B?bXhUL3IvSUk2aXpNVWdQbWxTS2M3NTlFUWZ1M3VYRVNNbDZqSUZSRHJXR1gz?=
 =?utf-8?B?eVV1d0I4dWhxUlBTMCtuU3FHSXdTK2dXc1RUZ3dUeVV0L2NEaTI2TWNqWU5H?=
 =?utf-8?B?K2dpN0dpakIyTG8yaDM3NE4vNFU3RjcvdFVkYitzY1llenpqVUx5N0QxT3Bv?=
 =?utf-8?B?OUl4c0FPWXJVRHMxMHY1bHRudWNVM1NrTS9pL0tFU2ovSTJLNnY5TVRIQWxr?=
 =?utf-8?B?VStZTEtKb3dUV1NQSUxLRVcxMFNhKzNacWd4TGc2MlVURjNpczJhVloxSGpM?=
 =?utf-8?B?Tmg0Wnd5MmpCMDgxcGpUWERSZUxjZHFTZDd4N3FSbTJlMkVYRmU5MjNtc2JM?=
 =?utf-8?B?OXltUDNnVFFsQTZOandwYlo5bFlNZjN0dkFIV09mQnRRcFR5bnZUblJ6L3Y1?=
 =?utf-8?B?QVcxQVJLZE05cHpiRGNtZmg5ak02T01sbGVsNFkzV0dyK05NeWIvQTVuRnhC?=
 =?utf-8?B?TnBGc0d1R2ZuK1V5SGx3WWpkSHFUbVZGbDQ3cXFPK3BiM2drT1Y2MkhQdzla?=
 =?utf-8?B?NHlOWllhOGFEYjM4TjJvbXdWQ3FhQk1WaGVQcnM5Y3RlNFp0b2VKVlE3R0pq?=
 =?utf-8?B?dWZodXhLaG1nc1I2Y2FjOHMzYXFtbitJem9YVERuTEFpVkpkRTU4TWVzVW4z?=
 =?utf-8?B?RGxvbVJodW9QdEdZOFlOcURCMVdnelhRNWVwb2ppQS9NMGE0WndNSjhOK1U1?=
 =?utf-8?B?ZUFiNVp4ZitPbGNxRXROWUJxcGpvWUN1VmtGRXNhNG1QSXNsSTdaclEvbTcv?=
 =?utf-8?B?WlBRQWdSeUlTQmJNM0QvLzBwRWRac01pRnB4UlgrbVIyenRrM1NvVGdYdmJB?=
 =?utf-8?B?dzI5SUYrTDJFbUQ5di8xb0l4K3NxYzBITEh5OWdBM1F6MGxyMVVJYVVFakpZ?=
 =?utf-8?B?VGlKcWhOR0o4Y3piUDROK1I5bjV1RkUzRnkwaDFVR3MzdDhuRmNBYnJjOTEr?=
 =?utf-8?B?SjdtMUlGWUo5S1lDVFN1SEs2Q1h0NHJZa2VoLzFldE5UU1UvbURiNk5PcW9G?=
 =?utf-8?B?c1FQd3d1cUtJWDNLT3JpSjA0NXhMdVhaYUlmV09UbzdBSGZTN240RHBmUEtM?=
 =?utf-8?B?U1JiL2hnZmhEc08rK3d1MEJCQjgxMnZ3K1p3UW8vUTAyNjFzRGZJTU5STHdX?=
 =?utf-8?B?cGoyNVJYZFVEM0tlaE8vekd1ay9PU2xaaG9veFRmdi9tdEV6Q0xuQ2lMeUl6?=
 =?utf-8?B?ejE2c0FpMm82d3QzUGVxNmxlWWdnbFUrN1pKWmdOcUxVTkpIUzVkUE1neUVu?=
 =?utf-8?B?Nng0RHovUDZBV0VqS0VZNGpyUVhNajlnWDBXMExjbVVaYjNSRk5XY2RDSnJB?=
 =?utf-8?B?SDRBcXhLb1NoTWQ3OUUzWHNXWmpjV3cyQnNBRlI4V2c1QVQwamRDcVNoSmUy?=
 =?utf-8?B?cnhKdm95YXpEcW9GZWVXck9NblNqME92QVBIbTJKQjFNbDBocEZrS1VjRjFl?=
 =?utf-8?B?ekhaOFgrUHdnYmNwV2FkMktjK0ZyS2pBajZUMjRZMCt4SVNCdnR2TTRYVFFn?=
 =?utf-8?B?MDZnVW5PT25ReE43STFLZTdOVWltejhFWmx3bUxUcFk5MWRwUE1ZRVBacmtV?=
 =?utf-8?B?QWdGbFcvVmRYOVpnaDhkU0FPVDRUVjNBTlJsWUNqZW9YWWZBZjZHc3JQTWJa?=
 =?utf-8?Q?o4g36ckyl8A9TfjdkxkMlo/TJ7ToP4B8S5UVdhr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c67566d1-d204-4a2b-5fe7-08d90671b3ab
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 16:06:06.7309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAci3BlITNlk7YbJliNKzkzMP3zDlFIqt8Pq8HjAnXaMKR4xzrpzk3zJSmf22Gj62ADPf29WrlfasZ3GUZeL1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4939
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/23/21 11:35 AM, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Fri, Apr 23, 2021 at 11:03 AM Sourabh Banerjee
> <sbanerje@codeaurora.org> wrote:
>>
>> Hi All,
>> I need your suggestion on how to reconcile if the linux-libc-headers and kernel versions are different?
>> For this discussion let's consider we are using the LTS branch YP-3.1 (Dunfell).
>> With Dunfell let's consider following 3 cases:
>>
>> 1) Machine is supported on 5.4 kernel
>>      Kernel Recipe: linux-yocto_5.4.bb
>>      libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
>>      There is no conflict in this case as libc-headers and linux-yocto are on same version.
>>
>> 2) Machine is supported on a higher kernel (let's say 5.10)
>>      Kernel Recipe: Let's assume provided by a BSP layer, linux_5.10.bb
>>      libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
>>      The kernel version is higher in this case. But, should be okay as 5.10 UAPI is backward compatible and supports  linux-libc-headers_5.4 completely.
>>
>> 3) Machine is supported on a lower kernel (let's say 4.19)
>>      Kernel Recipe: Let's assume provided by a BSP layer, linux_4.19.bb
>>      libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
>>      The kernel version is lower in this case. I suppose, this may lead to some runtime issues? As the kernel built from 4.19 will not be able to support 5.4 UAPI fully.
>>      What's the recommendation here? Should the BSP provider port linux-libc-header_4.19.bb in BSP layer and set PREFERRED_VERSION_linux-libc-headers = "4.19%"
>>
> 
> This is not something that we've really seen happen.  When the
> libc-headers are property used, they'll check/probe for functionality
> and use what is available.
> 
> If you have drivers/applications going directly at the libc-headers,
> versus the toolchain use. That is a different question. In this case,
> you'd be better of dealing with these on a per-application basis, and
> pointing them at alternate headers.
> 
> You can dream up all sorts of issues, and most of them don't happen in
> practice. I've run hundreds of kernels that are older than the
> libc-headers, and have never run into an issue with standard,
> non-machine specific applications.
> 
> Just look at master of oe-core. We continue to support 5.4, after I've
> bumped the headers to 5.10.
> 
maybe unrelated and anecdotal:

I looked at a windriver bug related to a test in libnl called `test-genl`

The failure only occurred in 5.4.X kernel.
and I was able to narrow it down to the 5.10 header update oe-core 
causing the failure.

(if you are interested in details, talk to randy...)

> Cheers,
> 
> Bruce
> 
>>      I suspect this as UAPI headers such as following differ, and what if this leads to runtime issues in case #3
>>        -  videodev2.h: This header is enhanced in 5.4
>>        -  fsverity.h : this header is not present in 4.19
>>
>> --
>> Regards,
>> Sourabh
>>
>>
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 
> 
> 
> 
> 
