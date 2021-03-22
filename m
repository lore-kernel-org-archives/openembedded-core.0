Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.41])
 by mx.groups.io with SMTP id smtpd.web12.14054.1616423770541145243
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 07:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hxAcOHxj;
 spf=pass (domain: windriver.com, ip: 40.107.223.41, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgY2dW3hNb+XBZYFCH9imZM6tHhP6ztUg2GqJlTXedbFf4vF9n1WeywdSbDd/RFbAvn0WeWVMZ1AiMsr/Kepobsk2A6C0kIiCry4w+gEflVkrCzVFeL3glcSm5GwulGFhNPrqKYNGu64sC2XVoJ3W7nLCv2u6lL1rNDhIjf+5zR1gwuKdR3Xrjxlm1EhQ7ZtiTBtkXnq+IjoKy6PTlWQNsM6ddZXIN1vBltKGdMUX29oR6fqX+TGGvlYf1WBAwNU5QdEf37neq6EIn4rXBg7ZT79vEoCiGMCtR06fm+nup4/URB3A8qMa04MTtrHQQ/JwL7uvZDHeofICt9tgwAr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyVuEQWnr88i/7j7CsGzrxhZxoQqpPV3sEQ0qkwjP+U=;
 b=kSCbCU1+lNAORMUE6u27LJSUubASv1XN4u9yrRxiCf77MgtFsbIZoFQZ3yOF0u96K8D1ULJ6lEFwKf12/pet0wEWK/KdwDoKuN7WZ3QSUWyq2B38eFIhcINsE9yGSpYKPyDiSB+9ShpKJPi1BhipDWFuuRYN3wdF3z4jR7RTT8suE1tVnZIz/NKvmr/bRClAfxQRKnL9j4bO7RM8KhwM8T5G1f3wN6WwVtzoVFY534Wg83/xspSaXksVBuSxjj0CICum2uUS3laz29VTVTusbtxjkzb0vYfDhR8tEIh6wQaOmBRy+eUa8nz3uxPw1wsLKZAX4DmH+s26g7hmXl6GGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyVuEQWnr88i/7j7CsGzrxhZxoQqpPV3sEQ0qkwjP+U=;
 b=hxAcOHxjEoEHRFfaXyqMvOVrdHGsDv8+evUjxPWzJ6ERUwyfNWIom1JakqBBAZxKchlzm0eI1KetgH1MdL9px+MaHaX7skh7yQLdzyXt9jT93APCtpiKd+Uou6+7tpWmLRjvL3kPBYaGXHtqV8GEtcdqN7U4cG9Pizq8xEEB6y8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4297.namprd11.prod.outlook.com (2603:10b6:5:14e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 22 Mar
 2021 14:36:08 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 14:36:08 +0000
Subject: Re: [oe-core][PATCH] [WIP] valgrind: update to 3.17.0.RC2
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: Yi Fan Yu <yifan.yu@windriver.com>,
 openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20210322020208.18814-1-yifan.yu@windriver.com>
 <f1e8243c-4f58-f2e5-aa77-bc01ee4741f3@windriver.com>
Message-ID: <6c3c004d-4a8d-7442-1317-92784e3dfbca@windriver.com>
Date: Mon, 22 Mar 2021 10:36:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <f1e8243c-4f58-f2e5-aa77-bc01ee4741f3@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::31) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR07CA0090.namprd07.prod.outlook.com (2603:10b6:a03:12b::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 14:36:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 475d993d-259a-4c2f-d034-08d8ed3fd4e2
X-MS-TrafficTypeDiagnostic: DM6PR11MB4297:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB42971024D9391C15F9B55018F8659@DM6PR11MB4297.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vYoO6lR2OoebQ54aot955k8piJlPxAJp29gs6t0Vp/AZz5hVlJ00YJeeWEiFN+dLWrg+MCvx8FY+ALWAF2qt8Uvj0lBm2wQ5DlptA9N3ZuZ/Y2ll8pjnSNIN7WoKUisL5xK+YqDmjB2pixYzgNCsHrXgU59dqkNeCBpduCz7lGPe8dk+0vWInFjekXdwU8fOB49t6RMYmwKyNmVrW8SGsbbafPax5msbAFd1yuTg+Oo0t20sBAWOBhBl/xIumaWF/e1PAmsivvGv8FZxNQ4JMoZk/CapqH3rT2Rp2Cjf77tPmp2cBe6/SG8IQZ6+IHdiC4hGJBM52Hs2TSMsotS/6+i8WeChFOstRR5z8u2lHmmTkl3L7GMNUdg8lrAkHmS1v8CGWOV3I2TibOjp1aj3xoZwDKmC4hv80QfKOtnCXvru6op8gDJbaZNiQbCp9zKgYMRp9zAWAZYybbIMrLY1YRWeCeMnYtWKQbla5pptS9EVchbbF68//aIgXRqCFjjNoFOsx8hdQgWSfP4/SMe01OOrSYCycF0p64v6J9nGU0kos38pXfXd5az1djn6Iahwsk2eXM2KNmjoa7cwcW3cuCizhjnkoukGSGy+9PpGT/jR9VhQzJFBSb4aPLQ4gwzAKODQ/ahXgyfTVMrSCr4xZ04yjR+dR2NK3bn9uTmLlwPp16Bv4nS6/3BnkXkXJBdwSiWyDhQvklR+sTd9XJiX8bvSj818arOQtY25iyu7+Avs+WztpRyyx7ZuD9ysolwizKOXcFPvoBOr8wqe+TJNalp988/eCo24w5aGf0YVwUs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(39850400004)(136003)(6666004)(16526019)(316002)(26005)(6486002)(52116002)(53546011)(186003)(16576012)(38100700001)(2616005)(956004)(4744005)(478600001)(31686004)(8936002)(966005)(66556008)(36756003)(5660300002)(66946007)(86362001)(8676002)(31696002)(110136005)(66476007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?a2QwNU1ERW45RnNxVllaV2lrMGNkUjVhN2lDT2ZON1dpNEk5STlqelpEdlZL?=
 =?utf-8?B?ZEFwYm5ucmkzdVZyU3ZJWDg4RlQzQXo1cWQ4NTVTaEIwSXRiZXpUb0ltWmh2?=
 =?utf-8?B?bTdkQndHa0M0cHpDSDhSZWpwdWVJaHdQK3lTNWtHQWJRTEpoNzhKK3R0STk4?=
 =?utf-8?B?QzlCcEp0bnBjQTlCSVliRnk1OHpHOVFhMllkOFJZS2lSbVc5U0VFamRHQi8x?=
 =?utf-8?B?UFEzZVNuNkFycW4zdDZiZ0xsQk90RHI3bG13aXJhNm5zWGdPL2I4SWNHSjlz?=
 =?utf-8?B?YTluOFVJOVVldmYwN3JZcFNIbmd2eGhEakE2eW92SVlvVjRvMUlQUzRMRlZu?=
 =?utf-8?B?ektpR0xRUEYxaVZMQ3FYS3d6MkY0VVBvZVorTEszRVhhblM3d3FXS0k5eUVI?=
 =?utf-8?B?blBzZTBKR2F4N1hZU1V3MlFSSGVucncxb0FHU0NaSElHd014Z3dhNjdhbFNx?=
 =?utf-8?B?Zk84TkpLbGIwY0xydkFtUWRzZDZrY1dnd2xTZThOMndLR3YzVm9tM3pQVzgx?=
 =?utf-8?B?QWV2NG1tbHpZdUlyNEdUd1NkcEZRY3N5U1lVRE51akphYjFWTmxPQVhVaHdE?=
 =?utf-8?B?bTYwUDk1UjVuZDBZdWVQTWJUM1JaODNuTU5zYkhqWGpUcWFJaGY5SEhXaXps?=
 =?utf-8?B?ZDBTTXdST0JZYkNvNUVtNjdjVmNTS3RZWkNwdVU5bWVyVCtuMHdQZ3BpaEoy?=
 =?utf-8?B?aWJZNWxHNXJuQU5tWms0bVhUaGxMS3Q5bGxYRTI4MU9CUmdTdmxNb2lZcjMz?=
 =?utf-8?B?WURzNDNoaWswdGhFc2VydllMQkVPdjJEeG1aOHNvUzVIdjRmSlJ0NTd6aEd2?=
 =?utf-8?B?SVB4eXQ0b0JMbVAvOEQyVXVXYjQ1NHlNOVl5bHdaM0lUblBORzZUZWk3aW92?=
 =?utf-8?B?eGMzK3lEdktXbWRLQWtyblpJckxSVTB1dGxNV0FJaEUxUzRKSDRIYlFFa1ZB?=
 =?utf-8?B?VWdBZFhNOUhmQXNnbDQ0N0VtSmxLSENUcTVTcWNNS2lwMVR0Y1I5aTdCM1FI?=
 =?utf-8?B?QnlMQm5USTduTGo3Q3o5Y3cyM2RVZkgzbkt5eDZZbDd0WUZSVWNYVkxLMldr?=
 =?utf-8?B?enhHMVVBanlSRDREZFcraXZjaHo1TXhaOTRhNXZXVDVtdFBpcHdESEg2eHM2?=
 =?utf-8?B?bGhleHRPbHZLeUMwUFFSSEVwb2R6TGdXczdNY0p6NGxBVUZjUGR6eEk2dG1o?=
 =?utf-8?B?TGNPNktYUS9pWW1MaittbWZNYzNPWUVHakI1ajRyL1lFZnVpZFNWSTZYcnBL?=
 =?utf-8?B?NUFMdEk3MFlmOEFvc1JHRjZ6d3hNZXRTZjdrb2FobGRLWXJJS2NpclNoaU1C?=
 =?utf-8?B?UmsxUUIzT0FLRm9sRmVFOVZqRGlJSEJBdm54RENRVUIrUk85MjZKTlI3aTdM?=
 =?utf-8?B?SUlvVEVya3lKS2VLdG4xN0VnMzF0Ukg1VzVWM1laSytSTnczMktuOXovZmF2?=
 =?utf-8?B?aWFKWmd1aXNSdUY5R0ZzZUY3K3JyTzNDWnZWb1pseHdKVUx0REQwaS9nMmlO?=
 =?utf-8?B?cmlkY0Rra3EvaG0wTHo5WWlsVzdyUUZZYUx1eFk5OUFvaW4vWmZObWhjY2ZK?=
 =?utf-8?B?Y2Zza3FwdzlZWVVsajMzdGthRkVodXh3Z1hPZXFEUjkrSkNWcktnM1FLakRG?=
 =?utf-8?B?VzRaTnRlanI0TGtmbmtlOEd5QzROellCTW44WXJBaVNWYXlHYkxWZG9QU1hK?=
 =?utf-8?B?QUNzZi9WZk50bkVZOGttc0ZtdTczLzV6clJVSjRxb3EydHhqam00RHB5ODNY?=
 =?utf-8?Q?ZRblq5yh/P0cuyFTouWgyGZrYYfUS+gSeC4ZiVZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475d993d-259a-4c2f-d034-08d8ed3fd4e2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 14:36:08.4501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VraTApkQ3WU2R+7tet6n9zMNxvWbXAf/6J35441s8kAKuZH3wg6clmgIzWixid7c0C+ICpJsicuRg7DMzqYujBipvmd620YbBN52rLx4PVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4297
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-03-22 10:30 a.m., Randy MacLeod wrote:
> 
>>
>> TESTING RESULTS:
>> qemu x86-64:
>> FAIL: drd/tests/swapcontext
>> FAIL: gdbserver_tests/hgtls
>>
>> === Test Summary ===
>> TOTAL: 736
>> PASSED: 693
>> FAILED: 2
>> SKIPPED: 41
> 
> Compared to:
> 
> === Test Summary ===
> TOTAL: 408
> PASSED: 390
> FAILED: 0
> SKIPPED: 18
> DURATION: 738
> 
> https://autobuilder.yocto.io/pub/non-release/20210321-1/testresults/qemuarm64-ptest/ 
> 

Oops, that was for arm64, the latest x86-64 ptest results on master are:

=== Test Summary ===
TOTAL: 726
PASSED: 688
FAILED: 0
SKIPPED: 38
DURATION: 959

https://autobuilder.yocto.io/pub/non-release/20210321-1/testresults/qemux86-64-ptest/

Please include them in your long log for context.

-- 
# Randy MacLeod
# Wind River Linux
