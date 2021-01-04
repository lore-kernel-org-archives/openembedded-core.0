Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.89])
 by mx.groups.io with SMTP id smtpd.web10.60.1609794064372233579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 13:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=n5wfz8Lf;
 spf=pass (domain: windriver.com, ip: 40.107.243.89, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXl51lx8Lm88ZeoGV1BfuBAkUgBdb2h4cd9vQESPgoSw0lVsQuvaa5vnhq4nBkHV1jXiOSasSbFdx5OJaBSkZGua8aQ0cey+vannO8EZ9JVIMb8ibnSRZIXjKdeD/kJdYaBEToMWRs2S4gR+Wfvx/yE6HrrO5F6Dfs92M52ViZqechsTG4Q8aE/OM8AtS3VtvvGVvN4pxerNIu7Khwwx9azykwrfhoAGEVq7qL9Z488lBCuwN3QqSkuqaHZmL5utjvI2UFFypQAPyKN4B8rny2F6aeqFlOTfe5JL/25OV3gyAMZGmMiOUEmomaCokLPWI5oKevjdVhWjx0QTOIAMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+fyKPX2y92rhmQgzoWTPgfIlLFNBLWoFeZgM1XO328=;
 b=NG7N5d2TgjtpTatLilXLk3IZQIuf0fC3IbiGxixBzY/OZxe2svw1q6iMaxg/kbN8oHoCxa1ez//Z1xTbQml+6cKAhLHJd2mKCRP0A5fhKXUstqnCxVsL/RGPIrOfF0bFZhKfaoZflmLrn8VxtALiFTF4Z6iiYzPs90O7tC/XY5hmD9NwJLl3nSge6MwK3ICnhbm0sCkXAz+sc44HzrEBcGwA7yVP8hjCq6qJGiaBBc9P9PCqt2oYplktjJLEDra9IJbmeNJsTRiQwMcAsSoQK6lE/tbFQULLGH+XY214kQBdZHWNvOlGA4M8aWqCNFishv1dXURwKZFYzyqAaHecWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+fyKPX2y92rhmQgzoWTPgfIlLFNBLWoFeZgM1XO328=;
 b=n5wfz8LfjLJbRH2GDMdy1Kaxg7MplEudSmbPbhtG3gCMpBPF1tsS1tQB+8QQKMk/C0zWPcxWTslpkuM9zakR++zAiHMxa4Sh3MpnXPfSSPuHJiZdkLwEbRnX9VkIoAtgBJoWtvOnc/zJdJiozdc/JvaiZ+QhrMNZHeRwktgYYJ0=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Mon, 4 Jan
 2021 21:01:02 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 21:01:02 +0000
Subject: Re: [OE-core] [V2][oe][master][PATCH] packagegroup-cross-canadian: repackage when multilibs gcc gdb binutils changes
To: Chen Qi <Qi.Chen@windriver.com>,
 openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20201208015819.154331-1-jiping.ma2@windriver.com>
 <b75e80f1-6253-ed4e-c91d-5a57d342dadf@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <093bfa8a-ea5d-8cd2-997f-869b3674d4ca@windriver.com>
Date: Mon, 4 Jan 2021 16:00:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <b75e80f1-6253-ed4e-c91d-5a57d342dadf@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BY5PR17CA0047.namprd17.prod.outlook.com
 (2603:10b6:a03:167::24) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BY5PR17CA0047.namprd17.prod.outlook.com (2603:10b6:a03:167::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend Transport; Mon, 4 Jan 2021 21:01:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 887eaad8-07ca-422f-ea8d-08d8b0f3d86a
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB25388240028AFE8BE3E2604AF8D20@DM6PR11MB2538.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ASMLlY321bcB/oYXH0kfOsSOVeOtoxBITU7AIfp8kgoFzAk8Irf7uKMfdmOGLNTCoxaFzGrED0SgHd4pbM/EDJMQ/u1+T8KXScmtpLTikYnBwxY24eTRRXGl3oAdjPv49vNBxrfE+jWU2mOGXaw3OTk6hULkOUkvAzEatcdcMIDNmkPHYcRSvgpg6Af/CRrVSwqow/HCqaTiiFRwpy4nQFtbVxtveLvQNonpQ+M/ON9QoI7pAsBUIsVqRCOekNW53CFq3YbYZGDLihRsFm7HQtKOCeDhtNvgkAYQQy1s5vJRyCTs7H0nyQ1Q0ldFF2aQXzb/Je4E9MGmAWqwy5Uhb/uMvvv8ifjBmCmSExAU1fc/so9wBFfu3QMPodfgUkhlXT1VgVlGD/YqBhL7vek/V2uSFqNn7g1O9jfkh9yrYD/PB7k6CkiZAuJnn9Wnn3mnLMga4VBVk3+zHIR8JW0eoZcK3UMiFkzIwsw2TAn8fDAOwSo+3zAr4AXNVFqCmCwNjlnikwuDQysYdBA3VeBgp1GaUW+mdwwTWPlpTzQRYvYccacaPw4gvglyW/K7aJb+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39850400004)(6486002)(66476007)(966005)(478600001)(5660300002)(956004)(2616005)(6666004)(2906002)(66556008)(8936002)(66946007)(53546011)(186003)(16526019)(16576012)(36756003)(83380400001)(110136005)(31686004)(8676002)(316002)(52116002)(26005)(4001150100001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eFJoMGRwSC9nVlN0ZndJUXRjMXNBc09kNFc5SFE1b1JZZnl4VlZWWmNtdzdN?=
 =?utf-8?B?MGNubEFiOWZJNThqMHFBYm03VUREWEhibUdOYnB2VkpSdjkxSExuaFFXanB1?=
 =?utf-8?B?SVBnVjgyaWF6RTVVRkVTcjBndURtN0RBeXg0amJldXU2K1JFQWgyZUdrRW4w?=
 =?utf-8?B?Vi9JRWF1aU4yMEdPVTh0NUljKzcxRWpjNHdlYmJFOU5KdmtMb1R2S1YxbWta?=
 =?utf-8?B?eXZRL0xNYmx1Umh4QTdLOWx5elExb1BJbVBhUUFubDA5d0JhUmQxWFMwWVU3?=
 =?utf-8?B?ekpseWVEY3A4TGV2Sk43N3QxbXdPMFdraEpQR1UvaWluVnVPbXJKM1pFZUxZ?=
 =?utf-8?B?UzIrdUxBam05eTRBYWtDcWdZWUpsV3pLTG5PeTFKN1RtYml3Yzk3Q01HZjd2?=
 =?utf-8?B?ZHBDbFNEdE9nZlRublNSY3ltemF5VDJKM2MwUTc5eEZ4Nk85OCtpQ2NpSVZT?=
 =?utf-8?B?VXgrdmZ5cUxwT0l1RElXcFdSaFB4cE40eXJYMU1iSDVwb21BTVVkb1pSdWli?=
 =?utf-8?B?bGRwMkZYWFhnQm5kS1lXM3FxWlZmaWE4czFMc1JINkRSNTlwTjE5L0NmZk1m?=
 =?utf-8?B?RXdwVkdYSHUrcmNnVkg5WUdFdFJaWGJtSWlvdWRQakhhMUxocTlpQjUyQzFp?=
 =?utf-8?B?OW90Yy9zbXpDNHpsT1Jma2lxTDNqOU0rU0pTdkpKRCsvYkV2RVJDR0ZWUkR3?=
 =?utf-8?B?TC9OWndUd2ZXTUJPNUQ2cFIyajI2L0dVZkJOdmtmUlpCemZURDA4dmMwdWts?=
 =?utf-8?B?RlBaV3d0NmN0am5jU1NObGRyVzl2ZjFDOC9qcUlxL25WTGU3dGt2Y3lwWWFI?=
 =?utf-8?B?dzVYNnM4NkU2dUlkSGY2akt3aHplVmxWNkMrSVBscks1cGYxZzJBNDVSbUFm?=
 =?utf-8?B?c0QzZ1VKWE1raUw5VzVFSHhQWkVpYWUwbEwwdFFSQU5aZm9wSFpoRUZKSmRl?=
 =?utf-8?B?TlpBR0p3cXBFaTFOZWxJTGZPQmhZUHRieDh2OXMvNXNMT254U095ZGMwTm8w?=
 =?utf-8?B?d1NXVkNtUzdzcHhCVitROFdaV0hiSHBFeVAwSk93WHFnQ0pEY3RPRUc2KzNP?=
 =?utf-8?B?dEQ3YTB6aW5Ma01vQTgzZTVveTQ1OHRUMEdGeWpSczd2cFV5QUI4T0hHOS9h?=
 =?utf-8?B?RnY2Sm0ySS93QnlEMnplMW9MVkNCZzVCMnFYZ2U3NkVoSkEvZWZFSmQ5WGlr?=
 =?utf-8?B?NzE4Y1hhT1RzNUFhVCt5Vnp6UDNMTmIrTy9Jb0pjU1JYeUZ0Yll0WllGTGU3?=
 =?utf-8?B?dENsclQrRHQxOEhDem5jVytKRTdWa1hCM2FEOVNBRVFRcWk3enFjUG1BcDgr?=
 =?utf-8?Q?s0Y2RWDyY80jYeIbUlShOGrXWTdPynoZte?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 21:01:02.5813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 887eaad8-07ca-422f-ea8d-08d8b0f3d86a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRXVpAg4L/YA9STkfA9cE3LHUbZHBq7Q06fhX5qwTQ9+ARiREUYIamBoA3cdUVsy9SxPco1KGiRLRRowwsVqlGphiU6MHGe/NzESyjwuOZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2538
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2020-12-24 2:03 a.m., Chen Qi wrote:
> ping

Ping v2.

Is there a problem with this solution or
do you think we shouldn't handle the use case for some reason?

../Randy
> 
> On 12/08/2020 09:58 AM, Jiping Ma wrote:
>> 1. Build SDK without "MULTILIBS = """ in local.conf.
>> 2. Build SDK again with "MULTILIBS = """ in local.conf, build will fail with the error info.
>> Error:
>>   Problem: conflicting requests
>>    - nothing provides binutils-cross-canadian-arm needed by packagegroup-cross-canadian-nxp-ls1028-1.0-r0.x86_64_nativesdk
>>    - ......
>>
>> Signed-off-by: Jiping Ma<jiping.ma2@windriver.com>
>> ---
>>   .../packagegroups/packagegroup-cross-canadian.bb  | 15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
>> index 3b430c0814..b6b3e5235f 100644
>> --- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
>> +++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
>> @@ -17,8 +17,13 @@ RDEPENDS_${PN} = "\
>>       meta-environment-${MACHINE} \
>>       "
>>   
>> -# When TUNE_ARCH changes but MACHINE does not (for example when a machine definition is updated),
>> -# cross-canadian.bbclass prevents variable dependency propagation to TRANSLATED_TARGET_ARCH
>> -# This will result in erroneous reuse of previous sstate packages. The following line
>> -# establishes a direct dependency instead.
>> -do_package[vardeps] += "TUNE_ARCH"
>> +# When TUNE_ARCH, GCC, GDB, BINUTILS changes but MACHINE does not (for example when a machine
>> +# definition is updated), cross-canadian.bbclass prevents variable dependency propagation to
>> +# TRANSLATED_TARGET_ARCH This will result in erroneous reuse of previous sstate packages. The
>> +# following line establishes a direct dependency instead.
>> +do_package[vardeps] += "\
>> +    ${@all_multilib_tune_values(d, 'BINUTILS')} \
>> +    ${@all_multilib_tune_values(d, 'GDB')} \
>> +    ${@all_multilib_tune_values(d, 'GCC')} \
>> +    TUNE_ARCH \
>> +    "
>>
>>
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
