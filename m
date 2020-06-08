Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.40])
 by mx.groups.io with SMTP id smtpd.web11.23896.1591594746753875245
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2020 22:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EKAR2sJb;
 spf=pass (domain: windriver.com, ip: 40.107.68.40, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZYJhQs54vZiDVirXbq5Va2KrwPbLyjZYswSbW8+rnfCTb76WgVMm2mOSH6YmRUTKQ+gwkR/KBPlx5YiSD0DJubHF0KgJfM0M9/fJHjd3hCM2wQCLI+zawtEVsZyngk+dkOnPK3OjE40XHRBEoETQRPuTgyuB5fgxE9eJ1lq1/CZt4cVYwts3z1CgAnvyUVLHZOx5z0/g+ku5PZmEUrWYSl2q4YALr+SNreLkflLPTxQcv3mgbACqItyipbYQ5Fd5lGijsh5d+KbTy13gYVA9O9t9om9NsDnWgKHqsXbDqakPKjRXbzvM7ttDLVzfuclQS15C31impvGCjD2FrKi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yk5uy5/UflhigV1p3kynDYAt7gruUhuRX1irp/V3NJc=;
 b=U3yCszulrpazxv0V8DzC96EGd5NQQeYX3hcLR5EEEI7BJl7AjiwGDUcBrMl2rBRZ6LoMSEELfcrIvws7qloosAk+hXVy8Nmr37zSJnZzOkKp1u46a5fV8vfeyEiVIE+vgzOqIQSwI9tNclZEA8Ii/I4EPL7IqxOwJJWPlqPO5W55q1r0aj45c/Bwr1zoCwiiIWFQkirmoIv/6NJGbwWJtBUiU+5qdRg+TPJiOnr2wVvvh9MO/3LB2wMmf2pLLL3jcg+OjnahHbyt5yOu6vcF+L5JEmF/TR5J9Z7GKLDZd7uUhO/TXczXKIGV9HD9C6F7VZWLX/a0yAOABRmRlJHGgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yk5uy5/UflhigV1p3kynDYAt7gruUhuRX1irp/V3NJc=;
 b=EKAR2sJbAXpPo9T2EIUNzfY+M9XE/t0Yvg04FhvtfVjhna54s7GWqAD+1wSNxEQDTVQaFhNuGr70vsmQ0mE8JHzecTmFF+ezM1cbc6skM1iB0Buu7BzrFE5D73QuR73W924/yosSCPvy3udeOsrdXCZLmSCLaQd8AbH7GmPBHqw=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB2536.namprd11.prod.outlook.com (2603:10b6:a02:c4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 05:39:04 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 05:39:04 +0000
Subject: Re: The change pointed to by a .scc file not detected when compile kernel
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Robert Yang <liezhi.yang@windriver.com>, zyang <zhangle.yang@windriver.com>,
 "Asselstine, Mark" <mark.asselstine@windriver.com>
References: <67e32d06-6dc2-5566-f362-d7c2dd736618@windriver.com>
 <CADkTA4M+tRVzebByfDPmM2kwALcakrSoS4CQ87zAj759cBksEA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <ae0f0097-c805-ac7b-5706-4833ffcc0244@windriver.com>
Date: Mon, 8 Jun 2020 13:38:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CADkTA4M+tRVzebByfDPmM2kwALcakrSoS4CQ87zAj759cBksEA@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK2PR02CA0130.apcprd02.prod.outlook.com (2603:1096:202:16::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 05:39:02 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 232788f9-1072-4a3f-8ff1-08d80b6e4104
X-MS-TrafficTypeDiagnostic: BYAPR11MB2536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB253637BA15ACF029B9EBDAFAF1850@BYAPR11MB2536.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zf7EuNbRjuwbStVlRw5956iEAN2URYAdL1VdlaJmsFvN7fzNZ7PfNJr9XA7UevYT0FccCDSvrcfjz21guIz+06rIMktCO/29aPZ2mQm83nHYRAFRo4camPTwMic/8uFgR4MoE/DuD0U65XPaa5vTmKK9dalXNxX6xNqpaCfZor8LKfpBtQaEsOlcsh4R86wEwkYeFY/vCqAj6alJukIMgGwePmL5PfWRujhBGepfUHfFBYu9mC7JxToaDV8VLdn+bFUdxdHpKTGkoJOYZNvyyHrhQ0xeQDUUgigJXp5lN2BXW+/yVZmmKOnA7vMhxQ9oWy7JnpWl4ESrG+M5PF3D/Ta+PfSEzvUWP8kePRJy5h9gMWlC/6IYz7CUfZZ8mbFgMEo02UQ2/Izv5GYHHKgHOEnWM3wpa2FqcQz6GzRijTViFv7/2z2G2Csmjni7f+fG0sxYiL2B36kFRAQs1gPVnlg25rzEb4IxTd5nPENd0TI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(396003)(346002)(136003)(366004)(39840400004)(2906002)(8676002)(36756003)(8936002)(86362001)(31696002)(5660300002)(956004)(26005)(53546011)(66946007)(16526019)(186003)(31686004)(52116002)(6916009)(478600001)(66556008)(316002)(16576012)(66476007)(6486002)(4326008)(107886003)(83380400001)(6706004)(54906003)(2616005)(78286006)(142923001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	RrqM1fMhJO9FsNHi4dV6qeBuuuG/fdqV/5AaOkwTR9tnE8yUEoPSao/ahRbJ0N8/of25L0+/bQS6f79J6XVkEbXwXn7ZonXDMDfzs2Lq0KOV2kwlOH9//ychP16sny/qcTT1d7YF/oQVJPBMyevKQx+qCHMA1jEO8iOIRaxngdueSsPlevqgY7jPAWBiHI5X+1GpZEDiy6GYbweus51OtRTUDIB6aSToyGuyvlKexpNaVZRPD9P6Hh1pSdImfR5VW4YcuDou2wLNl3mli81Nbl/xv3qC79cRcOWcjjI2da1bZl516jvjpQFYjqvw0NOHhtMb0WKwWvpVywGtXFCHYRCJvPcX6dwIUSyzQ91ofCtG7Fqe93yByUKI/4JxNNn2gmJjP9sill/UjljfGWCSHkfYu1t3ShE3uguMVOTx2cSJL1pGpPrq5g2ljC836jq0K2aKSZooGejCRf7idrbtizYPoclXo5N2CanJONL191s=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232788f9-1072-4a3f-8ff1-08d80b6e4104
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 05:39:04.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mcdzd1oelFoOpXGObjk2v28ipHLmh3bZIuJqzCDYNSCrsMVz151QQrRRIw1qg74Y+Ic1z6hFA2SWm5cnWB4PJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2536
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Bruce,

On 6/4/20 9:04 PM, Bruce Ashfield wrote:
> On Thu, Jun 4, 2020 at 12:52 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> Hi Bruce,
>>
>> Currently, the change pointed to by a .scc file not detected when
>> compile kernel, for example:
>>
>> 1, add DISTRO_FEATURES_append = " virtualization" to conf/local.conf to
>> enable virtualization DISTRO_FEATURES and also add meta-virtualization
>> layer to conf/bblayers.conf
>>
>> 2, bitbake -cconfigure linux-yocto
>>
>> 3,
>> $ grep -Rn CONFIG_IO_DELAY_0XED
>> tmp/work/qemux86_64-wrs-linux/linux-yocto/5.4.43+gitAUTOINC+aafb8f095e_9e1b13d7f9-r0/linux-qemux86_64-standard-build/.config
>> 5367:# CONFIG_IO_DELAY_0XED is not set
>>
>> 4, modify the lxc.cfg which introduced by lxc.scc under
>> meta-virtualization layer
>> $ git diff
>> diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg
>> b/recipes-kernel/linux/linux-yocto/lxc.cfg
>> index 3fefc03..b7a19a8 100644
>> --- a/recipes-kernel/linux/linux-yocto/lxc.cfg
>> +++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
>> @@ -1,3 +1,4 @@
>> +CONFIG_IO_DELAY_0XED=y
>>    CONFIG_CGROUP_DEVICE=y
>>    CONFIG_CPUSETS=y
>>    CONFIG_PROC_PID_CPUSET=y
>>
>>
>> 5, bitbake -cconfigure linux-yocto
>>
>> 6,
>> $ grep -Rn CONFIG_IO_DELAY_0XED
>> tmp-glibc/work/qemux86_64-wrs-linux/linux-yocto/5.4.43+gitAUTOINC+aafb8f095e_9e1b13d7f9-r0/linux-qemux86_64-standard-build/.config
>> 5367:# CONFIG_IO_DELAY_0XED is not set
>>
>> The change for CONFIG_IO_DELAY_0XED doesn't take effect.
> 
> Does the same thing happen with a cleanall ? There's an open bug about
> the checksuming of those SRC_URI elements, and you are likely hitting
> it if there's no cleansstate or cleanall happening.

No, it works if execute a cleanall before the step 6. But it should work 
even if we don't execute cleanall.

BTW, what's the status of the bug you mentioned?

Thanks,
Mingli

> 
> Also, you've confirmed that CONFIG_IO_DELAY_0XED isn't missing any
> config options that it has as dependencies ?
> 
> Bruce
> 
>>
>> Thanks,
>> Mingli
> 
> 
> 
