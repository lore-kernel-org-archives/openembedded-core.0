Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.71])
 by mx.groups.io with SMTP id smtpd.web08.24666.1617035673884626358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 09:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=J9eHmaB8;
 spf=pass (domain: windriver.com, ip: 40.107.75.71, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiIeWUWi6nTH3h092lnrZP7euBldVZBtamBEHuXGPrGcPztx2ufMljhDrGd3gyVRLeeTyBmidm9s9agEXE19hqJLsyrOfUEFls2LJbgRf88wKQCeLbckMyyx2AFqud9U0SayZKvGq0hV38rCVtiVWVRFHol3yLvlAioRCKKQbjvxURojVz+MBqBisDa6/MlQxIEQhwredNLNjzQqWcbQEzPAdntEdcIERvE3H5ipxjoXzMr00Lw+YY7HblQ0aNS2f+WX1JDsubeoghKYNYgREjdnoU3LJD9JgN1idyWNec7CyVOnGN+QswezuXtR2Oq+ZG9T2pgij6zTuVkRY7mrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSvXK8p5vOIhhqjtuPtTCtrAWhX0LQRWDfTV08aSMbY=;
 b=Jauq0OOb8KApTA1OjmyF3AzNzKQ4m+1U4Tym7/D0RUzK/WTKEDIVSPRO/RemTE1zAWwjqZsDMpQDhAL2vJuk44IWsj59j0mAEA3l29elSLIzwMkXw4OU2ptfiDxwc7uucpVWsw/kT+AsV5+nARqHppPTQ3bZL3B5dC41J9KNDzJwCtSerMBw/bka5wBlTELIQJGgE0FTjuwLIw06pKsGqtCQkzz9u30fBQ0G6UveRjOQcBfiwub4wFTErm4wPYgQOkteGkOquh5/75AmFXmyXqUFlXsB9isPXL1kEhR05Xmkiwpgm2/YN/PYChk4tYHm5es2S89Ox9yWz3qpr/3Lew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSvXK8p5vOIhhqjtuPtTCtrAWhX0LQRWDfTV08aSMbY=;
 b=J9eHmaB8DjtM2WsQAQi3xIiAIEUsy2CBLN2zYMvpFc9bnSrdwHSiouaO2olMungucZ+inDf6I4krmFFYu+BgvLQazoBmWERdkFSgOTZiAalN2RNjTsU8ySc98Z0ruIuhFFBtxE+0eAjiPx00CFuyhg27dD32C6IjpyIv7DM/tP4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2895.namprd11.prod.outlook.com (2603:10b6:805:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 16:34:31 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 16:34:30 +0000
Subject: Re: [oe-core][PATCH v3 1/2] valgrind: update 3.16.1 -> 3.17.0
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: openembedded-core@lists.openembedded.org
References: <166FB59AC0FDC39E.19792@lists.openembedded.org>
 <20210326143710.168053-1-yifan.yu@windriver.com> <5446239.DvuYhMxLoT@linc>
From: "Yi Fan Yu" <yifan.yu@windriver.com>
Message-ID: <6f253d24-f404-a901-83d0-bd10879c8a35@windriver.com>
Date: Mon, 29 Mar 2021 12:34:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <5446239.DvuYhMxLoT@linc>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: BYAPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::33) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by BYAPR03CA0020.namprd03.prod.outlook.com (2603:10b6:a02:a8::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 16:34:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d74cdf60-1ebf-4013-8092-08d8f2d08700
X-MS-TrafficTypeDiagnostic: SN6PR11MB2895:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2895B26D66C794586E659E27807E9@SN6PR11MB2895.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a1kWkAUDAXRj2th7lhOr6oseEYiInPqXOtW+BpMn+qZJqROwYAmixIL1FihJQZ255nS4/4fVRbEVWX4lMld9i0RFO+PVCzhx2FspGAMczmgaAg90rNLaQ43eoK1bapHXuTYsS4hMTyMMMfIHI/yuofkrHmfPX/ZcXYvaGsAUPXaZuHY6tuKs15FVk4OPxskzreTBFth9q3Z/W42IQVVRsqEXfJIOi++sz4FHpv2R5fWDvGlOC9UdCHelFJ++Nl9p3qjGgtvkaVVJMRJlX4L1QTQHA9m42Sl4v7U41VKP64iu0NK8K5uM21KpVh3t3H9OmC92XQ+SEBtjVdIAJ7/4EtiOfSfsTb+tjhqlk+UYpB8Wm8mLzhRNHfRbRcdiovwIPLlqsze3tzWQ8at/pjKLrPWWVl60KVINCE1yV3mO2JLjNivpnk3Ap8R1eP8XeLkQZH0ZtpgPo4lQ3ePKOxG9Z6xPUc7N+/0/hM+anhPAk52Itj5KqaGy/9Sn9bLqJBqzU/e2S5yIH+hZdeXNqvMp/z9FUs83xm8xr1BBl5fWGpQuInxqr0SKaP+vy73AdGEdBKQFlj0eyFwDNl+olLu0tN1YKYxZDXTaVoGPEFWZpIsR06nCfbTlOLR1Cd/kBSAO9Eey3vWYq6m8IkEtsE0EAaprljzhaG2/02x+g4Spwj1rk30i/4PFOS9t+PjxcZ9hFHCmxhdPrIFvc5JK0WzqkPmH2hzMwxsRnEgzjRugpa9ab4gHY+6hsetXWV3FzIyI98jViCrLQO+IDopkkyCGkN+4sLB4WJVY+f1XDuDvNww=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(396003)(366004)(346002)(5660300002)(53546011)(36756003)(6916009)(6486002)(83380400001)(2906002)(31696002)(186003)(6666004)(4326008)(316002)(31686004)(16526019)(86362001)(966005)(26005)(52116002)(38100700001)(4744005)(8936002)(8676002)(956004)(66946007)(2616005)(66476007)(66556008)(16576012)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?L1R3a0IwYXNtR3UydmtIamloZ2k0clBtdEJzT0lKekVsYy9jeTMyR3MyY0Fs?=
 =?utf-8?B?UW94TmY3cWhTNEk2YnUra1VYV1ByK3pqUkEwS2ZBblRMaDg4dGFLNStHK2xz?=
 =?utf-8?B?bGdxYUpWK01iaXMzck51eWptK1B3ekdLWTUrdlMwVWdKWncvaUgvSUJlTy9j?=
 =?utf-8?B?bERIZW85R1hIQ0Vpa2l6ZGY1bWxuSVZLd3hpbTE5RXhTZzNBV1JWWE1walBG?=
 =?utf-8?B?VEJtVUJ4SUdNNHUyaEhVS0xvc0M4M0svUjhyV1NySnhENncvLzYyNUJXbmYw?=
 =?utf-8?B?NEdhRW9EMzA4N0pEUTdKOXpTQVozTFNadG1reW5iQ3h0QVNISEI0cUlzdm5P?=
 =?utf-8?B?V3pmdDBBeGRXN2tHcGNwOE9laDV5MFZJSzVEU3MzSjFOaVcvK0k4aEI4Y0VK?=
 =?utf-8?B?SG5CSnE5MXo0dkdjMEI4SEVBSTJCT1A0NkxRVklnSHZ0TDhobG93UFgrZlVI?=
 =?utf-8?B?SlBpNjVzT1hxbzVLZ3hKcUpZSmgvK2trTVVhWTlMR2ZLZFkvMzRraTdOWkZ3?=
 =?utf-8?B?NWxpUmRIbm5SZFEyREhCbENQVjF3L1RPcm9aVWhpMUl5dkJUTXB3U3d6bWZr?=
 =?utf-8?B?aHVpcXkzZFVhNzdQMTduSy9RRXQ0NUF4KzR4cXdDazJQZmxMck8vNUlTaE51?=
 =?utf-8?B?Yk4vZlk3bHV4NDhGd1N1TTMzaFkvNzl1Z2xzdHVnS3MwVk1pR3F5THRib1ZY?=
 =?utf-8?B?dHBPbVNKN1JrWlFjUk9HcGREdEdjOTlZN2FybzhLY0wwVDAycE1uc2t0M3p6?=
 =?utf-8?B?REE4dUplTG1WSnBZTzIwZFJPOTJOazQwcUZVZ2lPZDlZSVFSVHdxdDFVSDUz?=
 =?utf-8?B?T3l6UlZUVUpWRmNYRUFqWFBReGRCT2dLUXJheHNHNVlsYU40ME54dzI3M3BW?=
 =?utf-8?B?dnhLYXEyaEI5UjRZMnh4THdMdWpWNXgwTmN4b3FvaEdUT1F0SmM4Rk10Skpn?=
 =?utf-8?B?UlJVOGkxalc5NEdsSHFlWTk3NjdyV3NoRlhyR1dlOXpIUFFseVhXcFdkRXRT?=
 =?utf-8?B?RjdqSFNnMFluVHdaR3hzTElDREg1akpQYkloRTNBSlhwblZTd2tLRmJrcXRS?=
 =?utf-8?B?RXZIY0VMdHcvbDBiT0FwNkJvMzN4MVVkd1ZHUnIzM0Z6RDdoMk1FdWw2cFE1?=
 =?utf-8?B?ZkQyWTdmUXEzZ21iZUc4K3NHM3gwN1VRV2hPemZIcitqamwzTEx6UEIwQ24z?=
 =?utf-8?B?LzZaOTRjQ3pUdWxRMEdMY096VUtHdEZiVlJhRVhmQStTTFc1RERZK0E0d1RU?=
 =?utf-8?B?VEsvVjROUWJNRHdVVVozODZzbEdPM2NWelNHR1NoNGdTUmVTR1RiYWxYYmJr?=
 =?utf-8?B?cGh5SnhlWG5ZQjhiZFNBL0d3NXU1WnFyYVZyeVF4SUlkdVBFTEtPNzI5dFht?=
 =?utf-8?B?Zzc5WEVqbjRjNkVscWhhSmRQdEtZVG5vT0tRWFFPeWJRZlc4RFVIbEwwbUZi?=
 =?utf-8?B?ZXd2TWJHbWE0bm5SN1Vsa0JJMkJwY1pNY3ZWbFY1WEZnSy9CQU1vR2x2QTVu?=
 =?utf-8?B?UFZkQnBORHhRWVgxak15Q0x3d1FmN0dxb1JjOGNYd1BTakJNSGthVzhaZTM4?=
 =?utf-8?B?dVNQeVB4U28ySWxHQWFYZ2JlYjRyRTU3WW9neUdRQitHMmJHK3dGQWRMeVha?=
 =?utf-8?B?bVp5QnRHenN2WlJnVXh1QzJSMnJMdEpsdDNibkJvL3ZJY1RNeHpqN2VTVEFD?=
 =?utf-8?B?TFlxMFVnOXZ6Y3IwakRLS3VoUmJlb01OaTRQUmczVDlvM1o0WmQ5Yzc5dnRC?=
 =?utf-8?Q?mCwb27PswWnPYwgJqUymEYwgjItYqr4RzwY7RrF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74cdf60-1ebf-4013-8092-08d8f2d08700
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 16:34:30.7470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJChUIdlaMEHRU1TMulQJid/0glSP5DwW4nomf4pVB0nkFP8Kvk0NRbgLUNpgpMIv3YS9wbNQy+L7nTANN87Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2895
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/28/21 10:23 PM, Paul Eggleton wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
>   AssertionError: Failed ptests:
>   {'valgrind': ['callgrind/tests/simwork-branch']}
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1657/steps/12/logs/stdio
> 
> (To be fair I'm not 100% sure if this only started happening after your patch though.)
This is very strange, never seen this test appear in the failure list.
I looked at the more recent runs and don't see this failure reproduced.

Anyways I went ahead and made sure at least it works on my machine

```
on qemuarm64 running on my personal x86-64 machine

=== Test Summary ===
TOTAL: 408
PASSED: 390
FAILED: 0
SKIPPED: 18
DURATION: 2941
END: /usr/lib/valgrind/ptest


This is after the patch 1/2 3.16.1->3.17.0

TOTAL: 419
PASSED: 398
FAILED: 1
SKIPPED: 20
DURATION: 3053

Failed test is the drd/swapcontext

//yifan
