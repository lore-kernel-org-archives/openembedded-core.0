Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.57])
 by mx.groups.io with SMTP id smtpd.web10.8685.1619336450498913790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 00:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MBByvCGg;
 spf=pass (domain: windriver.com, ip: 40.107.102.57, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ww3R3otWUkIInQMrX8np/Z11CSzop/ybKmbqLkxYccQpbnXnVjgurDU/H+pcviBVMMziZUCPUkJeYEScXb9Mqx01d3HA72DLWiWKdsKU6+x2JF8bVShuAcOrO7lfLPlYJIjVHxtNgT3NdmxmRAF9QOM1mmDBmSr0qvDQRnWAFNGS/aDRKjecAXPJvLOA2gs7yBtlAB3UFDYdTQ3cTYgn5+e7r+UFYsR9daZ6JBbAQyt6bNH4DYBFbuKhDDWq2pb6SBwsyro6hhiDDE0EUeiMP8hGdvlFgcljb5Ou33kpHN0cuitOfTLsqjxxnRc/wbNEgp0sWx9jggd87DEKqHtd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEzezoesx4EwmKyXFVJ16tss86apGXOqoxYLfg1DhCE=;
 b=CW92SZmiyLNWP/20CBQOE0eGBSUAwr+GzW2XArJapvrcROjLcd25HTNvyZsS4e4+7T3wRTrmH72dKO1lpyiEh9vGTL4BLnbfmZySOLd+lnnCIlxSrPKyLdGah5WAtm/m2daNAnAw00gzoiSTrHlncr73f17ELYc73sDsvQsCB19MY5N47UZqvabriMb+hnDsDz+DBLGWZ4MvUpz2EAY0/MERjoEYg4Ud4gqKux1Pgwq3u5UvfH8MHbQUwVYEJISAOsI+2lU3HdkP8E2c1S6M85K6iGNDOjy+cqTMDmtJWFq6nlFT9WBRlLOsjwTHMHpBt1fO4eXnwkwYvCcdIljOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEzezoesx4EwmKyXFVJ16tss86apGXOqoxYLfg1DhCE=;
 b=MBByvCGgYpDDUmPrSPPDgaMSq4RvBc1eEt4tyfwgnJ3AANqa1ELnXKfB7gMo0ko3/aPB2afh01pRbCs1XJCm+7rFH9rekg2/kQ2dIMI3eE7NU0i1LVVnbuRg4WCPOUGtcz/gpGLAqrcb9Qogy6HL0pLGfpYuqxKCkoX90C6ZPug=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Sun, 25 Apr
 2021 07:40:48 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c129:2a53:5093:81e8]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c129:2a53:5093:81e8%3]) with mapi id 15.20.4065.025; Sun, 25 Apr 2021
 07:40:48 +0000
Subject: Re: [OE-core] [hardknott][PATCH] rpm: Upgrade to 4.16.1.3
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <1678663A5E8DE32D.14065@lists.openembedded.org>
Message-ID: <81b76930-4252-5e00-e410-8b5eca1dc4e4@windriver.com>
Date: Sun, 25 Apr 2021 15:39:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1678663A5E8DE32D.14065@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0177.apcprd02.prod.outlook.com
 (2603:1096:201:21::13) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK2PR02CA0177.apcprd02.prod.outlook.com (2603:1096:201:21::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Sun, 25 Apr 2021 07:40:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec63335d-774a-438d-0e47-08d907bd7177
X-MS-TrafficTypeDiagnostic: MW3PR11MB4555:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB45556F216571E9990B228EA8F1439@MW3PR11MB4555.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i7vdR1Z38WVuKyDPcfqKsH/jH5hBxefZh0yFFQNaZuPm2jzAgoZF+3dnoU9DnNgyGH//cAwESbkpuZFne3dd1dW8CrAfkJagbau0IkfROGSTe55lS8IadLZOfkowLWE4+Z2YDpnOewmBLpKZkd+9yrjxdjB4meXV/54j2DBBP7iy+yYXYM30TXrTl6AyObiB0wY+Ze5m552ncs87Qw5moUX6tvhKvAYv8LYPjRe8EB2TlVJOpK0SdF6t9twkgSVr6hWkaPsAnQmpoLB0BgGSQVXmvfFEzje2yAemA5YRgdm4tLXEq+MJAQLFLkop801Xhrt5N+MkN6/MnIv11f5Vz+4kSDptOEyNcY4FTsJMPd7wWZlkcLn9+dJGfTbLpV6Y4qw6gUruJviC2nc6pdkOOUcl5Iw8yxFs1xF8hk3mxLGOyTNgspmSlK49s5DLB/SanvCI/V54fmDXAvwxAL1jO502qjLEpey7kH10GyAfu3BCEb6da/dFFogARnehUgh8/mfz99QyzbWfb4Wn+VqWZFTHklNy5z3CD0UVK9fJNcDq4Kni9juMqAHABJKrql7uFgqko0bXwPp8P4uDZVEcUxue8FEFXcIjjk9JvnoV7jxcJuAsg4zdMy0xXzJckXuLEdxhyp39biqwI0RQf5jR0eC5LM3rPsFLAiO60Msau9DW3OH8xQR0jGzVzw8Pnho0560Saon//2RDOpfhApDFSDeot7isbkJGswVNKfquZM0DaYVADL8P6a+cVKc4M+wxhb4JPuZMU+3QeGYyB4U6qqp0S/PDH4XZaAt2o9iVjFWVRyvth8o/rWiC8fUEv4ZF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39830400003)(136003)(376002)(366004)(186003)(16526019)(2906002)(36756003)(8936002)(316002)(86362001)(16576012)(31686004)(66556008)(26005)(8676002)(6486002)(2616005)(956004)(66476007)(66946007)(5660300002)(966005)(31696002)(83380400001)(6666004)(38100700002)(38350700002)(478600001)(53546011)(6916009)(6706004)(52116002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TTlBU0VzQVVoeVREL3NIcHBNSEdNdEMxMlhHY3psdlhiMlE3TDFGNlJpbUlN?=
 =?utf-8?B?OCtJV1BGTnFKNG4rUlQwVVZMd2EyaG91VFhPWjBXVWN5bGpJdTAva0JrUTRL?=
 =?utf-8?B?dUFDVFlDbDlhbDdMVnIvbkhmMnVrUUlWbVRoNnM4Ykg3enl3bnZCUE1kNE82?=
 =?utf-8?B?WnBNOFIvbVlYdlNuQlZIV2gvUEowMVZhRzBhM2pmc2NQV09mY1p4TEJSYVky?=
 =?utf-8?B?NHE4SkNWN0RwL2tPT1dENDdicXVXZnlHYXIvc2tuM09wckZldlkxNGhkYUx6?=
 =?utf-8?B?WlZhMFpKZWVJMmRFREU1anJkQXI1RlFSc3NKaGFQVlhvTTZNSUQ4THV1S090?=
 =?utf-8?B?MDl0SzlZaEk4cGdRT2JQUnprVEpWSWVhWWdvMFlnb0JsMEVYTlZMUGM5ZGJv?=
 =?utf-8?B?alhsZTZYbUJsRUR1RDBIZW1hSEs3Umx6WW80eUlQUzBNdnlFRGNkdXNYWlRS?=
 =?utf-8?B?V1JUTm9mUWFieE1sK1J0TmYxRklEMkp0T1dONlVCakZtRmExTW96QXZBZ2pD?=
 =?utf-8?B?cTdYZzh0R0hRd3ZSUmxuK2RkQ2xWcm5GZlVlQjZMeFVSTnozRXlUa1ZJL3Fw?=
 =?utf-8?B?UHdralcyam1QVDVJaEZZdllSdHRTTG9sZVI5RGVOeWdUNXpnY29hbkJLZHZz?=
 =?utf-8?B?akRBMXZ4c21GdW9KOXB6aTMyNitwR09CWjhrdVJaaFlGVFhTMXA5bHQ1Y09j?=
 =?utf-8?B?UWs0SE5Vaytqa0REa0hFTW8vdzJvNXpOR0RFNXc0bjBOc3FxdVEyNEk3TkR5?=
 =?utf-8?B?WTFxNDJtbEM0eGZzdDBFdmtTL3hBYWNVK3pzYVE3YjZYTGdTdDdxTlgzb3R3?=
 =?utf-8?B?TEkwY3h4THFPRTZINWxrak8zR0FxWlM2T3VwV29wWnJuSVVjK3hya2d4KzVU?=
 =?utf-8?B?bFNSZk84aWNvRm0xTzZwYnVnWk5JNE01UFZVWFRMYUI2YjFnUkZyUVV0UWww?=
 =?utf-8?B?Z3RFSVBRdEJqamtEM1M5V1BvMEZrU3Nic05YR3ZwNG04a0JBcTZ1SGlyd2JW?=
 =?utf-8?B?a0FISTNyRlVmNHZnUzZpS0xPYkJPUGJsWGZ6ZVNpTjZpRFZlMHRnbENrVU8w?=
 =?utf-8?B?L2traHF0c1dyOVFIa2JTQS9yekVIQkVuTXdJME4yUVllcEV5QlBkdUg5N2E5?=
 =?utf-8?B?Vi81b3BCWS9OUmtoTUtoUUpvUEhhb0JRZ0JabEtxWWtzRHk2UWUvZWd3WnRR?=
 =?utf-8?B?YU1Md2tmbnJWQWhXRk15R2FXbk5ScXpncDJ5aWpkTS9RQVhTUVd3RWNFWVRO?=
 =?utf-8?B?TnFQQzJQUW52clFzd05MSGc0QmNBY3oyMGl0Rm8rTUdNeUpTczVSQWtwU3NW?=
 =?utf-8?B?MzVmbXZ4dVdzMGh2YkttS0YvRElzWnlyRHNJcFdHNGtaaEZvNlh2SDlXVHFE?=
 =?utf-8?B?ajdTMm9LaTdVN3VHUkFZbHdQc1BBaEJVZE9hY1NMNGordXNKT1Y5ejBRUmFV?=
 =?utf-8?B?dlJqYlZQZWdkN284cmRpNmFPenVmWDAyMkIzdXcrNC80aFErbFc3MVVmbmZB?=
 =?utf-8?B?bk5nNHNUMExlaFd2YTBHU29jSTVtall6bC9aV2JpMS9jb3ZQLzhFMkdnOEU0?=
 =?utf-8?B?ckdjRTgzeWYybXcyVk9ZM2d2OXdrZDEyNlEvNmRQOWdZRDBhMituOGsxSk4x?=
 =?utf-8?B?ekpRWGQwTEVuMTdYWjIvcnFhYXFUb0xETkpncDZVVVdOREdOOVJqanhkRVVx?=
 =?utf-8?B?ZUNBWTVjM3J2SnJIWmN6QnVsaHhnUTRYNy9acFBkRXpadlhiSE1DUXFFbVFJ?=
 =?utf-8?Q?KGvw3ur8LQC57wnlJKpyAE7nFDR2cCh8Tai1auS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec63335d-774a-438d-0e47-08d907bd7177
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2021 07:40:48.4253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8caa0Q6XFGA5QvZXyBcnLDYnywuYrQZIajJf/Cfeyt9bI5eQGr8PSvZ4Y4NVPbntD4G0uSSC7SuqqY+2wxUdRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4555
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

Thanks,

On 4/23/21 1:41 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Fixes some security vulnerabilities such as CVE-2021-3421 and
> CVE-2021-20271.
> 
> Rebase 0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> to avoid fuzz warnings.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   ...ot-hardcode-lib-rpm-as-the-installation-path-for.patch | 8 ++++----
>   .../rpm/{rpm_4.16.1.2.bb => rpm_4.16.1.3.bb}              | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
>   rename meta/recipes-devtools/rpm/{rpm_4.16.1.2.bb => rpm_4.16.1.3.bb} (99%)
> 
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> index 38d755205c..d8fcc16729 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> @@ -1,4 +1,4 @@
> -From 9bbe3f8564705aafcdcc5f2f033f9241a97f47c6 Mon Sep 17 00:00:00 2001
> +From 7b2dd83d8fcd06af8e583b53da79ed0033793d46 Mon Sep 17 00:00:00 2001
>   From: Alexander Kanavin <alex.kanavin@gmail.com>
>   Date: Mon, 27 Feb 2017 09:43:30 +0200
>   Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
> @@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>    3 files changed, 4 insertions(+), 4 deletions(-)
>   
>   diff --git a/configure.ac b/configure.ac
> -index 6c78568e4..76b1d40e4 100644
> +index fe35a90fa..b2faec6f3 100644
>   --- a/configure.ac
>   +++ b/configure.ac
>   @@ -966,7 +966,7 @@ else
> @@ -40,7 +40,7 @@ index 35c8cf9df..9d8b2825c 100644
>    %_infodir		%{_datadir}/info
>    %_mandir		%{_datadir}/man
>   diff --git a/rpm.am b/rpm.am
> -index cd40a16be..e6941e09f 100644
> +index 8e1dc2184..3d889ec86 100644
>   --- a/rpm.am
>   +++ b/rpm.am
>   @@ -1,10 +1,10 @@
> @@ -55,4 +55,4 @@ index cd40a16be..e6941e09f 100644
>   +rpmconfigdir = $(libdir)/rpm
>    
>    # Libtool version (current-revision-age) for all our libraries
> - rpm_version_info = 10:2:1
> + rpm_version_info = 10:3:1
> diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> similarity index 99%
> rename from meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
> rename to meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> index d369c706a2..7c03b41fc8 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> @@ -43,7 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
>              "
>   
>   PE = "1"
> -SRCREV = "278883a704ea36c97974d0f2d65d41abe78b0e2a"
> +SRCREV = "3659b8a04f5b8bacf6535e0124e7fe23f15286bd"
>   
>   S = "${WORKDIR}/git"
>   
> 
> 
> 
> 
> 
