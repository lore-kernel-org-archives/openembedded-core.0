Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.76])
 by mx.groups.io with SMTP id smtpd.web09.1941.1615496022180428824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 12:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aGajiBVh;
 spf=pass (domain: windriver.com, ip: 40.107.244.76, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UadKUFiB9HJjEGW/tbO/3hatqhgrMM+0oOnIEjZxiU0ONaxFDIJFvsm3DU9QQsLqFP0xNmFunDc3/nj/dCbg7Qe60b0p9tcfHk5atk6yfrwbsh/Wm9b3wfcK4H3AWrA7zfMfzGIThtCsfhakGkB3WOLrX+vb3UjKEqToqqPOQGSpstQ5ZA5jovXfOtlxpTkkaE6/cxGlZAFdUWb2f8A68e0kKSwFGEqVhFlgfGqmQ67fZ993c8yfSo9LYjiA9uScIqvbc2dgpJCh2g2r7ugpgILv1SzHzvvFZKqF1o51rOiOYZWUOYzT17nS934wBdXuxmYztlWqgc+72AdE3W31rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1Oel1N6o3Xg7WIM31S2b1LZoaIEKXATN5Fmor+WC44=;
 b=hg7F32XxrkgsUjJTq/YGhZUSxLb/4RC6y95CL0AAk2sbGMuOdyuhMjR1NkQEg5rL8MWQezvfVDOEJRDhq2pLkWszV/KDR7LoYZlJfsPmpzpazmbyE7OT0/OxQm9/H6Z/m3tTd8xNzfnFNuvULp82if0+SR1fEHTzW2VuQkaCsOEzepZjVBYBBR8zpO4i40PeZmA6b4G/5YerUuQEkPR0JnHAmxaCD5aj9Nuj2txuguZiTD3ZuNQS8Spvq+Yw4ocexD1IQ1yb1t7aiCvEjHdnVXBD0qu5ErRZ50xD4rMihalCvUuRqF5AVhfUxHDYRKzgBUcdGd2UpI4/JxxVwpLrBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1Oel1N6o3Xg7WIM31S2b1LZoaIEKXATN5Fmor+WC44=;
 b=aGajiBVhneFCgirfhN/sqGVGu5gntXNR+gneZ2Hdi8lIUxRXoyecXuWqq/Gqtequ1LxAH89ap2uiC/GKhjom4gAHym007dkawuzdB9ylD4Fu18t4MpQB/I8dHeeAu0ATlWzORJh36uEaaBP9KcFYKA2sos7NqNJsb0GzK1m20nM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2607.namprd11.prod.outlook.com (2603:10b6:805:56::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 11 Mar
 2021 20:53:37 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.3933.031; Thu, 11 Mar 2021
 20:53:37 +0000
Subject: Re: [OE-core] [PATCH] scripts/oe-timeout-dd-test.sh: add script
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sakib Sajal <sakib.sajal@windriver.com>,
 Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20210307205817.5679-1-sakib.sajal@windriver.com>
 <a8d69435-a6cc-4daf-a22a-cb190c04f781@windriver.com>
 <847ee37ec1bc1545e0a13d11c4eeac6358ef3fa8.camel@linuxfoundation.org>
 <2b197274-5e89-2648-5881-4f2671a1e6aa@windriver.com>
 <78d7c30d3d642353fbd52202beb49e1dd74fb7f2.camel@linuxfoundation.org>
From: "Yi Fan Yu" <yifan.yu@windriver.com>
Message-ID: <983c6af4-6412-b958-171a-01f65fe64929@windriver.com>
Date: Thu, 11 Mar 2021 15:53:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <78d7c30d3d642353fbd52202beb49e1dd74fb7f2.camel@linuxfoundation.org>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: YT2PR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::28) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by YT2PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend Transport; Thu, 11 Mar 2021 20:53:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6e30484-77f7-437f-87ac-08d8e4cfbde8
X-MS-TrafficTypeDiagnostic: SN6PR11MB2607:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2607F11549F8D6F171B828FB80909@SN6PR11MB2607.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m97H6tg2ZB3w/HFQ3RAl3dLb4XknYX1MjNy0JWi8BTLwISl9MAibypKWtJaoErz+zDC+EYT1T6n8l8AREry6sOuHKCrvcwHRFXopiJSfkSJ1DeEZG590GHQl4CBhNt3Egwv/At02f7fsndWtzUEpzCChrcuFLeWAe1oc7iver6u14rmrza4r9nEyvETv2DP1/g55qBx6f1kPMI/K9I3UrXGrR+Voj1URiN0Mi+CLB+sQ453VZhwN0MuRH51QvMJNmYy7xS4nRGTYNVYb4dpRf1xLe00MrY9XH/6YZPpfTOvRhysY0wN9L38wFLZ5FhAb3onPg9AplMxdFkHiUUdvLQ7C5NGHcwQwne3RRydnLAvxIgshtbR0duNCOGIazzwpZI1sosEGiiw0cX0HehdlwdLs/QlDUvJyAPNRKXaJcAJkuKhkP/jONKck7ugs6nnAjrTdS0nQce1g41eC9/j9GQ13T/s9T8T+Ms7gTM1jJxw+2ckggsP4cg8XWP/+dhueptzfj6vEB2JVF2QGNn57s0mYkr+g+JklC84Jqu2GXj5ju+uw39cIVzkzPJhZQwBXnhssLj7ZjE819fY49FMBPHrD/6Q6JRVsxNVvPRZXt9k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(66556008)(5660300002)(66946007)(66476007)(316002)(16576012)(2906002)(86362001)(186003)(52116002)(4744005)(16526019)(6666004)(31686004)(6486002)(8676002)(8936002)(36756003)(478600001)(2616005)(956004)(110136005)(83380400001)(31696002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Vy9sd2RqdDl0YlJqazd2d2xZUGRMVjBVNVlVa2JpekVkRUtRbmZYYkFCMDRp?=
 =?utf-8?B?U1RDS0hvR1Q4K2sxVExseDAzd3VIRW5OUXhYS016Yzl5Y1k0MXdLZFR4QlBo?=
 =?utf-8?B?b21Ta2FSbXZNSjBZUkdYZ0c0TkZGeS9hY214N0dkczBYLzJiZ3FSZk5uMm92?=
 =?utf-8?B?NGVlelBJTkN0Uzhvb2hOazlkWWcrdlFUbVQwNHlmaW1BemdiRHhibUh4Vk9y?=
 =?utf-8?B?RDdTdFVHdDdYamxaOG0xdXVVZXNEdlUzZVhWTjl2d0FPZG16bEZadnZ1WGMv?=
 =?utf-8?B?aTFaU1JUL1pKRm9jVWd0OEJyY21wK1RraGJEbitMdnMwekczMXN3STFuMjB6?=
 =?utf-8?B?bUEzV09ONGlrT1N5L2t0ZmYxcjRSVXdtUHVDOUhmaTNYN2tERHp4emd5di9z?=
 =?utf-8?B?bVg4V2F6L2Vjc0VNL25sc0hZNXlxZTAvZVprVWxRdFRHTHhmdGxZYjFjSWNn?=
 =?utf-8?B?L2dtUlkzRUNDU04vRkJSdnRrcHNwZ1E4Yy9LSS8xK25TZnIrZWw4K2owQTdi?=
 =?utf-8?B?bDZLNnorL2hKcDZmMmk1Z3FOZ3FRVkx0MmlzOTR1LzBBdWJQd2pwSkY3bE5j?=
 =?utf-8?B?SmdSUUE0RTRpOENld0pxRWxsM1lHVGdVTFdWS3VVOVVva0tUOVQ0NTVQNDQ3?=
 =?utf-8?B?SGdFaS9oOVJPQXRyaXZLaUFpci81Z1MwaEMrTTVLTTlzRldOUmlOS2IzRFFV?=
 =?utf-8?B?VzBWQVJ0bUloaGplTFdoM3FRUHpJMURIcHM1UGJ2RXVla2g1djJmK3lVV3hs?=
 =?utf-8?B?ZENEdzVGY1hOWlQwcW5yUnBBZjBOTVR2MnRwYjZmbTViYzRZZGhiMDhFYnJV?=
 =?utf-8?B?Q3pPREw3SENUNzZsYnZvYVluYjhjbDRTZGtVK0JxUWZBRHhMOFpzcFQyS1N4?=
 =?utf-8?B?eWZuZzRwb3VzWHBJdFRMNUQ3Q3h5a1RmcnU0NXVCQU1nbW0yWEFoN00zSm0x?=
 =?utf-8?B?OHdMQ0RjUGdjMHNzV2FLenlnbTJvRDdZa0d3MU9rUFYwMjVOMnBNZjJYZ0Ry?=
 =?utf-8?B?WmtxZlBoejc5RnFYSG81VmxPV1VPbUk2bEdUb2x4V3JWaktHNDVGNEc1VTBJ?=
 =?utf-8?B?b2tsbW5CUXVrUldWYTdOTnlwNFBNYzZXSzlHYzIwS1lVWmN5dktlVEVZNWdD?=
 =?utf-8?B?akN1VklodUxtOU92eDRnajM3aklBWjZETjNiNkZDOVFaaDRTZ3kremw1R0hH?=
 =?utf-8?B?SEtLcnFnK3FMeG5mTXJiMlpXd1k0a0lsYndGcUhRTU9aS1ZGNGVUWi95bmZ0?=
 =?utf-8?B?TzR1MDFMbC9ucVY3ZE42c2FyMGZndHE1NGZ3TUhtcmd2WTE3cmh6MGhqTTZi?=
 =?utf-8?B?MmNOWDJEM1lySXliRDRtekJxR0prMkpueG9Da3JUbWZIZU5zZEQxQk5hblB1?=
 =?utf-8?B?MXJVOElWUDRYd3dTWFQrb0U4TVZxbTBYYm96c3JzUGFIc3hQbTM0ZXdDUnNM?=
 =?utf-8?B?Y1hmVUY2R0wwcE9zUzFtc1c4MTlKR01YVFNwcUUzcHRKMHlOc2xWWGJaSndL?=
 =?utf-8?B?NzlGRVh0TjVkbzVOT3cxVHk5RXMzeEdjMm1EVFpIOUlwcGYxeU9tR0hzQVZM?=
 =?utf-8?B?RzlPaUZvOWp4L2tDU2U3T0JRWi9Xb0NxQVVFSUh0QWxFZ0hDcWFZY1pEOFd3?=
 =?utf-8?B?R2J6NnEwRmtad3JEY2lwcXdFSmNkYVdFemFwVkplWC9RS0cvU1pPWGlJQzBo?=
 =?utf-8?B?ZDBuWVRrOWRsNFR4a2VRb0w0d0JXMGNoQ3VkcDB5SVNxOWROQ2FTUlVGcUsv?=
 =?utf-8?Q?P6yomqL0bpJ3AzbEYCRh0qc2juiAS2Kqhb4/CCA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e30484-77f7-437f-87ac-08d8e4cfbde8
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 20:53:37.1368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htxc3Zd/vaxFBVjmv8dN/N+F5gauc1qrSRGgKb65kIIJuo/fy1GOtzmYBy9zKXBHbNgVGCtAmDpF5ZM918DMTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2607
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Randy & Sakib & I took a look at using `flock` instead of `dd`

Initial results to see if it works:
the results are the following when tested with `stress --timeout 20'

stress: info: [44041] dispatching hogs: 800 cpu, 0 io, 800 vm, 800 hdd:
0.74 seconds to flock my home directory
at this load, opening a shell takes around 3-4 seconds


stress: info: [1424] dispatching hogs: 1000 cpu, 0 io, 1000 vm, 1000 hdd
20 seconds: the stress test times out before flock could return
at this load, opening a shell takes forever


I think it is a good indicator of stress if flock takes more than 0.5s 
to complete


yifan
