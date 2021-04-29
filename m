Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.51])
 by mx.groups.io with SMTP id smtpd.web10.116.1619718298613215596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 10:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dm+ZuvYN;
 spf=pass (domain: windriver.com, ip: 40.107.220.51, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgeZgo1MEvNDIwGufSV1etgIUbp5WAg9MhcbQTonq4Kjsf43vvzG2PbYs/Y350/8ObSRtvhXXIoPxQxn2E27z32eWUTH5ZS9viuMulGriSSF+HT3Dey47MdPHHVUC4J0haMz4GmMt+JlGJ53A8OGitQepqCd0AvtwaPj0gIm4LC96Y+QX0SQFZMyTImnrAzz7hJEW2Jf71XBI782JcwJIUK9p/PNX6QWtxJc8mM5nggzGvvv/zF4hhDrDv91jj+r3/eYrjauWdmRpKd3LQJ/1smF485QROCAqgC+nVPonxRP0O57kf/UDkprAgM9D3Mvmf6YMqbRdGwrWJVHVNRubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upJMMIKPm3UDY/P6LGUDEuA47MbGllWhTCLb7JgzWwc=;
 b=JVz2M3F7gxryNumkbSdB8IU3QedP/vCbMx17zEQgAGW3R2JZJ/a4VPk6WOENo+irP59UTeo6xW1HMNeoDqStg5coIBhIfeyVdY+QwNo8jEuajbCjO0f+cegJrzFmyB10At6VXeAixWM2mK26vLglTBf/mMWENlUlV4dfcJCgrt2ObLaytKPOOmE/aO9lGZ1XmfSPCEu7kPUt65TaDL+0NhShnRN1O3T/cmmbMwTYhWv8nTjrJ7NeP6RY0dxorMwGk9JvxcHh1VkpzI/zYzudEk9iY3pKLjpap73ZT9/KoScbL02spNmwFuYiQYyhZMwD6JGXGcGiqHsGU25896VGnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upJMMIKPm3UDY/P6LGUDEuA47MbGllWhTCLb7JgzWwc=;
 b=dm+ZuvYNsCM3uEydsKFsWyOpmEyqreULUq5OsHXI7ybhlSKqHxT7kjD0lG6nOIYz126XH7C8qWzaXTF9zuClcuBLQVqM/JW3xq/2tZtRMaWxUA3zxAD7lRv7jNwC/dtfcHRiXFcZhYLgMMqLcs5H0a4yUUSw+3CAMRBHG2oDHE4=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1485.namprd11.prod.outlook.com (2603:10b6:301:d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.26; Thu, 29 Apr
 2021 17:44:56 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 17:44:56 +0000
Subject: Re: [OE-core] [PATCH] tbb: Disable PPC as COMPATIBLE_MACHINE
To: openembedded-core@lists.openembedded.org
References: <167A6435152CEFA8.6294@lists.openembedded.org>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <80c302ec-582b-317b-7986-217d4561db61@windriver.com>
Date: Thu, 29 Apr 2021 10:44:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <167A6435152CEFA8.6294@lists.openembedded.org>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR2201CA0047.namprd22.prod.outlook.com
 (2603:10b6:301:16::21) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: Saul.Wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.23.90.211] (71.238.119.71) by MWHPR2201CA0047.namprd22.prod.outlook.com (2603:10b6:301:16::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend Transport; Thu, 29 Apr 2021 17:44:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f406a92-fe5f-4531-145f-08d90b3680b1
X-MS-TrafficTypeDiagnostic: MWHPR11MB1485:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1485A1542262F818E8A0ABBAEE5F9@MWHPR11MB1485.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/5eDUaS0mp9w7lAmbiNVCJ0G1D6vCV70r0IExv5/FhAyCEsDP0glCFlBav8Rc1X3vpH4UKSyuiEplFx/XoO84eTK2HYcdKU0YoMhyjlIn48ZIhsgRVJhMwjDgg7tjDItgCPxlHIKvj8jv8Wanz/HsEy+CKnWBZBnN0gXNCM7Qhlt4zCLx19cDl/5dqWjRM/CKYVOE6EOhh3v93h1hiv0R5gEwe/XRv/iPBYi2Yx8td53vbfHgx6eLqAqGEAwu8TI/tGcETqpkCiDTWzICRIAlCx+SjWTUKL6wFadflKAzid3igfKV4EVpgoRX9ySjf6JyoB93hvwkNloo+bnjp8VFLJb3tvZB5wxtNRNJjCYDT7ePG+wWfWkqq4ZAGkxSVAmHCjoC/E/R/o0XhlxGhS2tqMBZC7mL2BsFrpfcno9rcYwp7EjJDpW2DYEOK59h0Kf4BpS4YlB+robKqLL54M/s3VQ2r4XBp1OcrHYog9eeMYLzqnmIXwxkhsCM2OB2Z+QD3tRvMY1iZyF9XvjXjc/RKkCKASDd15HStmkKhhRcZcoB0SiUg8S6+H9I7LD+kLMsYwetidjAUE8K1ZUEW5WLRnYF6e+ZGxqtkgXvLI0U2nan0WN970RrGIBYbF94JMCoQXYUh9i6z9kYsHxDmtOoHQaR+Yt9TW8MXK1+7QMv1k5H903qdCNcLSPdw7MCmZDtbA//jjpk6ceZVCpdPO2Mbj6XlRyIKsiicGYK2s2Wxul+St5FWyGTCSF/NmyAdobQ839NrF5uHFp85pag9kgbnr7beUWePwtVc8SRMnJ5Bw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39850400004)(366004)(31686004)(966005)(8936002)(52116002)(6916009)(478600001)(956004)(83380400001)(26005)(2906002)(316002)(31696002)(38100700002)(16576012)(36756003)(66556008)(66476007)(8676002)(6486002)(53546011)(186003)(66946007)(2616005)(16526019)(38350700002)(5660300002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SG94dVBZQ3JUajIweTdEYkZpUUV6OGkrWXRnWmJzWDNENzBWRElOMTZuckF2?=
 =?utf-8?B?ckZLMVBuMWFxNEtnTGliME8za3RaNkE5RFdiZTlJN201NG1BTmxqQm5SOU9Q?=
 =?utf-8?B?OFBKeGpESGJlN0tsYVV3YkFKUlhENm5FNnFFMG1nQXBnYkhWUDVhWEc2ckkr?=
 =?utf-8?B?T2h6UG0yK3Izc29UcGYxMDd6VDFsc0JWYTRyRndvMDNOaVZQR1JVL2dyM0Nu?=
 =?utf-8?B?dXNPSXpGRTNSemtrSmMvQmdCMXhVSWNOaXM4azE4VGhYY2MzTnMzeExqWGdi?=
 =?utf-8?B?c0NnVTB4QjlOczVSRHowOGxYUmlaQ0QwZW1JYVdES1BSQnNvVElVWWFjbDNj?=
 =?utf-8?B?ZW1ZMnlhQzVHLzNpN2RkUUlYSjFwTU9tMGY2WHhPbTVTSzJtTFlBbjBMazRv?=
 =?utf-8?B?Q251SUl1V0paVUNKTXlyYzJRdG1uY3Y4U2JiOXJ6QWtkR1VLa0lBeHJ1RXRI?=
 =?utf-8?B?WWxvS01oKzdnUWhLQjA5K0JqSE1LSUx0MnZVbE56ZWU2ZVJqNXdDeENBV0lz?=
 =?utf-8?B?TjVFWWk1RktNczJQb0t1eFdjZUZYYVhjdU5aVDlBU0pMTWRZZm5wdGt3WVpP?=
 =?utf-8?B?b1lhcW1wd2NvOU05c0FvaDdxMUVvTWhYck44aXQ5YURTakRrU1VNQWI5SmJa?=
 =?utf-8?B?bjJlM2NObVdmYlhCZzhTcVhyUk03bkk1aHJWRHhCTjZSdUtidGNFSGJDZVhp?=
 =?utf-8?B?WHdzcE81b3dJa1B4VkYra0JKbzBxdVRsUW11S296U1dkbDRGYVA3cC9sUjBU?=
 =?utf-8?B?azBZaDJjSjErS0ZFUStQZXkrOUg2TDVDYlFiYzZnTWd3ZUtZWDZIQlpmOGRI?=
 =?utf-8?B?VDJUKzJ0Ulc3NnJMeS9Jbzg3OTNMMHFtS0RabkZVbW1HbzBpWDFxbXRtcmor?=
 =?utf-8?B?VTdGYmtJRWR0TGxmcmUycHJmR2grSENZUUlMNWkwdzZRU3JLZko2a2wycCs5?=
 =?utf-8?B?bmt0bUJobXZLdkowZGVCNXZPQzZKU1BVRWZLNUtFT3lRYkMyMFhtM0NtbGtI?=
 =?utf-8?B?Ynp1d1hqNVpGK2xWeHpwbyt5clgzaVU5VVdUakxkend1djRackhxY2pNNjRw?=
 =?utf-8?B?Wlh0NXB0MTd6OGVMNFJnUUR2M2FmR2wzMjFta2phaG1tQVJlV1MwcUYzd2w0?=
 =?utf-8?B?ZzZZMWZYZnBsUDh3b0pnaXc3Zm5lT0EwbXIvR01VUm1oMkIrLy9KL09iV1Yv?=
 =?utf-8?B?MXduOXFMbWY2U3FteS9tSXpZSWk0eU12UGlqTUhKeVUrUG1BNy9JTDlqSnkr?=
 =?utf-8?B?RkNzT0xVUjk5Y3AyeDBNSHk0OVk2NktFZ09hWmVxcWQ0U0hDTWRRQTFNY1V0?=
 =?utf-8?B?YkJxY3V0emh2Q2gxamc3RHI0aVNIQzBVNkptUTE3TTMwVjZqZ0pBNjdiUEhs?=
 =?utf-8?B?Y2V4cTh0SnhtTU9Pa0dZZGNpV3BUd1dZZTNkaVI5U3Y4SlZBb0ZYLzhoUlR2?=
 =?utf-8?B?SEMzMytyanhlYnRPUXBjMGNKdmFsOHFIaVFBbzl5dWE0NTdOaGZ5OGI2WFl3?=
 =?utf-8?B?M0FhOVdxaEQxd0EzakZGZytmakhZS2VvVm5UZExibEFobTFZdmJsMEVCR3pz?=
 =?utf-8?B?emtKaGtJMTFjZnFoR2JLMDNwOFhqalBPNGFNbGFrcmFRamJCVS9JelBobmpK?=
 =?utf-8?B?c3FFMFdKLzVWNW9tYk1TaThQbldNWUt4cldOZ1hPOVFFSng2blgwaDR4S1cx?=
 =?utf-8?B?b1NROURZcGdrWEd3UFF1b1RXMEJrOHZxb1ViNUtORVpVcW9HMkRJWklIUlVL?=
 =?utf-8?Q?TmUIEIPkJTg/5qXKIbskliS5nBmiJGMEPFb2HSk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f406a92-fe5f-4531-145f-08d90b3680b1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 17:44:56.5879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCTH92kqoDKxNcIK2TRPN92pV7Ncg4RSGzT/Xa0aO0o97V2Ya8XcSB25pO+FvMMxm7kSxLK+VTYvJleZ6qYrTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1485
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Oops wrong list!

Sorry for the extra noise.

Sau!


On 4/29/21 10:25 AM, Saul Wold wrote:
> The latest version does not support PPC architecture, so disable
> the it. Otherwise the following error occurs:
> 
> /srv/nvme/yocto/hardknott/builds/tbb/tmp/work/ppc7400-poky-linux/tbb/2021.2.0-r0/git/src/tbb/tools_api/ittnotify_config.h:338:12: error: '__TBB_machine_fetchadd4' was not declared in this scope
>    338 |     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
>        |            ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>   meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> index b05a59dc7..d8a18866c 100644
> --- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> +++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> @@ -43,3 +43,6 @@ LDFLAGS_append_mips = " -latomic"
>   LDFLAGS_append_mipsel = " -latomic"
>   
>   LDFLAGS_append_libc-musl = " -lucontext"
> +
> +# The latest version of oneTBB does not support PPC
> +COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
> 
> 
> 
> 
> 

-- 
Sau!
