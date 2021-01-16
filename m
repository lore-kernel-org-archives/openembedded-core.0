Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.69])
 by mx.groups.io with SMTP id smtpd.web12.4188.1610765191625969912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 18:46:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=n96uz+AT;
 spf=pass (domain: windriver.com, ip: 40.107.92.69, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9Rmg3ylYp/b6FXoxsgBDc7m68QNXi8mDK3r0wAcwFZ+UwEoTakiCkeKJKNMEW4Qlg6FKyVMU4rQEWyBE+jVkQF2xVQC3cF7O46Z2T7qULfgEwxzAjcplNTikV/l44xNtVsSCDLfyTshxNb0QqIIcvd9Sxu7uFHbuz/W60yk/hBGuOytd1MjkaVeTgJxmhcCwhf3DpbiISHIoGBhTYev7iJQyIAIkx92Lv62KmlDSwhvOUxv65wXXV1ndlstEGUQWMt5mvUgauVzMgR6HnVrwfl4CdGAgvAO9yr//I4BP9n2VtT1ijK1tpJGztWP8AGVB07fsxvTl739urE0oI42pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVVX0Am4MvKBC2FVsGbsqJH1S1zoCFE2OpZwioRoOnA=;
 b=B5zS11D7+kfKF4M6XqXfNBwcEtz0AlO7OVpi+5yxrsoG3LGSN2vhh+bjOayj1ZUCx6WBN0My9AxCL8JszhAidaoTuzAEXq0UX1bhYKXZb6tHKKUA78wFCsQaPvPvMWlSNY6XS5mECZ0PbdtF/ZXihZSrADLgvEr9Se0RchdwUjw3Cm13PzVAD27RLzCtUN7HVdgrtrQ4WBi32+8Ly2MEn5953apLBSOBPrj/DUqpcBjqliheVduaoC7A7l7IqmG71hDadwy7c1/YFYOEjUoZzaijre9YN20NLikHGjzt0vj219a0oBB1zK3HZ1AYgZnV94816eoZDip4L/onkr7koA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVVX0Am4MvKBC2FVsGbsqJH1S1zoCFE2OpZwioRoOnA=;
 b=n96uz+ATOi0bais84+Rzx6v/oHTJV2rLW2WZBPUOoO9Cx7O7drunHlx6cgMWQRYe9eCQTnl9Vge9hIqTy2MzdFuKrpwtCvfHHbXhyy5CbMvZxVGHlJWTIcYGDKH8fVBgpzmq5Z06o2wv/V1lKn5KfJqE1jQ6YwKZAhivdpKFVP8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Sat, 16 Jan
 2021 02:46:29 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a816:b4fb:846e:9417]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a816:b4fb:846e:9417%6]) with mapi id 15.20.3763.012; Sat, 16 Jan 2021
 02:46:29 +0000
Subject: Re: [OE-core] [PATCH 3/3] deb: do not insert feed uris if apt not installed
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210115094536.18651-1-hongxu.jia@windriver.com>
 <20210115094536.18651-3-hongxu.jia@windriver.com>
 <32c70df536b241c06742c5e75a4aaab8f02f9d88.camel@linuxfoundation.org>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <3277f94a-464c-bfaa-545c-131cfc23339b@windriver.com>
Date: Sat, 16 Jan 2021 10:46:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <32c70df536b241c06742c5e75a4aaab8f02f9d88.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0085.apcprd04.prod.outlook.com
 (2603:1096:202:15::29) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.131] (60.247.85.82) by HK2PR04CA0085.apcprd04.prod.outlook.com (2603:1096:202:15::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 02:46:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb75aedd-023f-4af1-4b0f-08d8b9c8ecc2
X-MS-TrafficTypeDiagnostic: DM6PR11MB4705:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4705CE1EF60AB5170ED2C9A794A60@DM6PR11MB4705.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FE+qAvBA7Zy0O+PaT/jcfzW8Vr9qZJ2EuBt9Nr042NoQgCR8yZEQhDG1Y5nWMACePgFSq/aS4QEULP13+QS1KPQ4VvOkZ7fFw89wPH77QGCOraeVaH0LQEyPZZNPbssdsRKTHC9GwPsdNc5LlNdq8LBJoidwrFgcBJEg76zgf27ea1sJ2GRnAMjFGTUvRuCsF9Y7fCJcsZFs5cTWzp3LU+mQFrYFIGHQyHD1lDrAXL+YPwF9T1xRGpWMgyag7pKysc6BqRHrl2PQIAXym1XqzAzDJL6eqnCPN1iLCa1vy16DHzrbXavEDzbvwBsoEQn25mwCgKJQpBil53Wh4oWq3pVSsFDOrAvfTzGnjXaU7iIc2ZDuCQ3rkcLi/wHpmQVzWoKc9fa7nCjcKt8HseBfskwA0TS+oWaOriRQBR66aTwJ7nHQcEzprschiZeXYcdw4iVLimHK20UXkwWBYqiuuV0FmrJaRyljPaOXb9YnSwSGS4qllm+kw34sHibSHXqZ+RfHjav/RyKZWFEIePiYDA4xhZ0MrY5UarnmAgD4COzpcXevtNjn9x7MflRLlioehMeFO3eVAdjhc1dDStN5JA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(31696002)(6706004)(8676002)(83380400001)(86362001)(316002)(478600001)(956004)(26005)(2616005)(44832011)(53546011)(36756003)(966005)(52116002)(31686004)(6486002)(8936002)(4744005)(5660300002)(2906002)(186003)(16576012)(66556008)(16526019)(66476007)(66946007)(6666004)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aFNFZ3ZaNTFZMklNem94cjB5U2xaM1ZCajI2TmVSTGJYY1lpamx5VG14dzBM?=
 =?utf-8?B?WkxvVXE5M2NCYWFlOUl1N0EwYitYYUlzK2VuK3BBRnhLekNrcWZxKzZiWmVH?=
 =?utf-8?B?blRRU01ZaVZqblptcjRCcnFDZHNwc3hZcnVJTExBSXRRdGpIT1hINmh5NzZF?=
 =?utf-8?B?bjdwOTdtTmkzdTdPelhOMFJVR2R4UCtlQU9aZThUczBiczJaWC9mUWorS3dJ?=
 =?utf-8?B?WThBdlhvQitlNlNZZUtVRlhRbnprd2xDMUxzaVkzZTJ4d1JlOE9iSWpGckFH?=
 =?utf-8?B?YjJKdHduUUcySTY0MWdubktIY1VaaVFMK0RiVDRuZDdoNm8vczdpeTYyUnM1?=
 =?utf-8?B?K2dOMDNXaUYxTXRQNGlZVDIzamMrdVViSFByeGExa3AzaUZsL2dscTFZWkRu?=
 =?utf-8?B?dWNMU1ZhK0ZBM1JXRk4yeVk5MHpSNThZbVFuZk9lcnZqR1B6dXhFdUw3dGl0?=
 =?utf-8?B?ckNzd2x4QnJ2WDlYMXRhYmZKRHphWXBwb3FYZ20vZjBOUmFUcWlQdk9ZWVVo?=
 =?utf-8?B?UFB3WEs1eG1BVitNc0t0QllIOGR2OHk1aHR3UHI2NDRGQWdka0tKcjNZUWVE?=
 =?utf-8?B?WUxLUVZCeldTeW1BSjFQK2R3UjhjbzZWVWZwVHRzS3VjeXdPdXRZL0Z0aGc4?=
 =?utf-8?B?V3pJaDV4N3RrUlJScTZzTUk4dWpJcWVjQzlab3RkaGVyaTlCYzd1bjl6U014?=
 =?utf-8?B?Y0VtL0lKQXh2cVJQUFpMOVBqQTdsalp3ZFZoUDhaYklJM2JSVkxveklWTDBY?=
 =?utf-8?B?TVRFQlJvUURmNzJIZHMwWnc3dUprenN4bGRYZ05wWE94T1F0SkxYRit2Ry93?=
 =?utf-8?B?THhpOHlLQis5V3FIMFl0aDdXUUI4SFY3R091cVYrdFZEcmdlQ3BodytXVnVo?=
 =?utf-8?B?ZHQ1YWs0YnRqNzhXekJ5UDE0NmE2eVhJbnFNMHdPZDgyVTFnLzBpU0RlOWIz?=
 =?utf-8?B?cHVTcy92a0Q0a1QwK1hmb3JMNDM2b2JLblFxRnlaRWhQUjI0RStmTGJIV3BQ?=
 =?utf-8?B?UzZXTGlqdjNkOVYvamsvaU1SeURyT21hRGFwQXJwa01SUXVscXRYSE1zYzI0?=
 =?utf-8?B?NlNrOGs1RWg4NEoyQW9FbHpUM1dkU3BkSytueDRJYXkvLzhzWmlIbm5TMXRQ?=
 =?utf-8?B?UU9GenRhcHhlWUpqTEx1R0tZZndNRlROc2FxOFNuREt5cDZXL3ZzWTRsNFNX?=
 =?utf-8?B?SGtybVIydGtXY3ZwK2RoT2pPNFJpY0J6ckp1ajBBcVBpVDQyUVFYVTdSc1p6?=
 =?utf-8?B?cGxCNVJRNlIvUVQ4L0FqN2VDOHgvUFR6Umc3R2FPcGRPQjRIOGd3S2tnZU5P?=
 =?utf-8?Q?PrNRyx5jgHsDt+iinGSPdhwzcJ1aiBUZiM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb75aedd-023f-4af1-4b0f-08d8b9c8ecc2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 02:46:29.1737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ya+AwHVu4qGIE6GLSI1pKIFfphNiioZhOWO+qBmXuxqkxQAmxYHmPCJ/XhK2yFPVE1b76E35GTgaDA8y8tPGuN+kjdNY41mZJ8hvBo7GKwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 1/16/21 6:21 AM, Richard Purdie wrote:
> I think this is resulting in these warnings:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/2925

This is caused by the warning message in the output of 'apt install'

...

WARNING: The following packages cannot be authenticated!

...

I will try to fix the warning

//Hongxu

>
> Cheers,
>
> Richard


