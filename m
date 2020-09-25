Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.57])
 by mx.groups.io with SMTP id smtpd.web12.6134.1601001810005377090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2020 19:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SMSDlN1M;
 spf=pass (domain: windriver.com, ip: 40.107.237.57, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdedovnIIpXy2KWDWXTJdx0NcUJGhLEhi0ADUH5XVVQdms3f8eZqx15t7UzvaFz0s1/HVL5nxeDCv5IDO4hDiZiFkykZjXD3sbHrB60Yv1swQr0ccmdTCtqtJ665R03YaRVa9AqhrQEgOQzGaK6zeD3siNUdwIlg2cNQzxEav5QgRPOsKgS9VPjll6KOptECCNGMRN0bjC1Rflh7Ex7gLIQgatTpppFtmSygynCyUaMxaraEKo0CD5+DxqJpzMzYWDr9XQR6Y3lg6R+cTx9jaLsXKJGu560QkMWs3vvElGbztlg4x4cVxYyNZFNR0w971Wj0g+QIqDj/ciE35ILnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVGacygf9SkaU+A/pBpBb8OZoVsrzj8YlIeNzfJf9zg=;
 b=CFiAjECWlg/NwHvIC6/+eS309JvmPpt9RV4cMasH8rr9h5iWJMp6a3KylvTxf4LVRGflHKIu+sXTD/YIGG6LrB42SlBCd0KBYUJ87TcvU9PcckzcVlJ05TwAGQaEyBlz8nGfX2RUAnA/XSuvZY7SqNKm4RqQZ6MefmkZG+1nN/GqZjrE/DkaspZh6r9uL5XNjH+6TjIj7nnXKZCcQi7GpcaoZb0WHcWHIjt6N3wb4llqAsvqyuZIR5q/wJgMkVrLt7i4d6VFvCfaDC5wfYzkfg+ntZ63boxOhEgTUiW0GjJeplpGlal9IGfVEGAgUBsJyIGQH95UZYLRdcXGZwDK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVGacygf9SkaU+A/pBpBb8OZoVsrzj8YlIeNzfJf9zg=;
 b=SMSDlN1MVTkHuUl7Yz/W8VWYUlB3mPb1AQmFd41hXMHwf6PLC8jzmTAVmF43E+D3AzN7VwHxEUSI3Nk6HUVcCsODm5Jy4wiXjmm6CYD1J4pFOSnsrt6nSO6WrJoJyljYUXFKqvpAr12YxsbZws92KFQx6Y5qqcim1cAd0Ol8Ks4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3302.namprd11.prod.outlook.com (2603:10b6:a03:7b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Fri, 25 Sep
 2020 02:43:27 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::dc3d:f132:1438:7e10]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::dc3d:f132:1438:7e10%7]) with mapi id 15.20.3391.026; Fri, 25 Sep 2020
 02:43:27 +0000
Subject: Re: [OE-core] [PATCH V4 1/4] base.bbclass: Add buildcfg multilib values
To: Robert Yang <liezhi.yang@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1531449293.git.liezhi.yang@windriver.com>
 <8c5da6490461b333ab4537a7a09ad4fc7826a008.1531449293.git.liezhi.yang@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <990a3b0c-588a-a7d1-fbd3-ca5c67408109@windriver.com>
Date: Fri, 25 Sep 2020 10:42:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <8c5da6490461b333ab4537a7a09ad4fc7826a008.1531449293.git.liezhi.yang@windriver.com>
X-ClientProxiedBy: YT1PR01CA0106.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::15) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by YT1PR01CA0106.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Fri, 25 Sep 2020 02:43:25 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efebd508-787d-4ff1-c1b6-08d860fcc78a
X-MS-TrafficTypeDiagnostic: BYAPR11MB3302:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3302D1BE1ECE018FE694A112F1360@BYAPR11MB3302.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H6aHmMb4iQ+cfDZUHgz7y0UQKO0Nq4SrJkRsRReLMbpXqmPZQNSo1cps4qL7TAqSEvO+NpMomlTg/qOYCk763kdyt8oPsDtpPfO+LvbvA+01YdhuRDy7hD14RF4IB0lRo4jiFF9w/Q8LzDM4461kKj3fqvfNHJH2zNEgy5wYRN/0lHsXJpjuGn3pXuqAvN3x2l2lh8YPcaLOAF+Z8Grs2oI0WY3WjIqmMb339+8bQM7BqHC7DiN00d91231k2jWNevQpJ2Bxs/9v3kHL7m5t65b0sps/1JiF8C41wdV6rDoNwMP3Gz6K2qK3L6OaS/jIypUHqARQ7Kh/LPlmXcidmOVSlhX2JVqGIgP6Yl2KcB+Yrzh2UCAOS/ONT88ZtP0vyw7xJdOvRLN1gbyZX9lylQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(376002)(346002)(366004)(83380400001)(52116002)(36756003)(478600001)(956004)(31696002)(186003)(16526019)(31686004)(26005)(53546011)(16576012)(86362001)(5660300002)(2616005)(6666004)(66946007)(316002)(6486002)(66476007)(8936002)(66556008)(6706004)(8676002)(2906002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Des4DhOgD/u0ZCjj/zXMVdHDC1v52TNUtFt1bH7zSMULbWtUlYnBbcpIJnKGJsVnK4JdVVdL2PoRdC1RAvpQBMXPyxHbjOJ6QReckKwv/oTdwX4QEkduD0Fx0QVZjBRPVc9uBssEq84yl3CKhMqJ95tu1IEoK60aNTV1cyzXFEgm5x5KOtpuRNLD+CsFUxF/nqWlBkm6UlLwt47TJZ/ohPEw4T0RQa3suoCId7KBxDgd4HNIbJb4KgNPjoJ3IfX8idVWLRrk4yfkaHI8w3UvkmkVAdYaU0WtutlPiINBHNJcomjvFhcBGhAy/c51i9Mi/3OW95+sG8xdK/pNdEkVw7alUPvQfZbuVoFg8CcA6Mg0UJrfjDeGWNWl15eiEyfFVUhtBN67BT55v0rZ3d/WRWqX/y3QCpz3WMNgU5E4ocZFsADGCwI2LVYlHyMyc8p1y/vccFKl03gl3so6qwUqZZnDAOFMP0ffj0ciUk55L2agLMsWC9kzkVNHpdMZOyamjt4oa+SNH4M4RTywRCYq1sTVZ/iogg/HmdqPOUBxsd3ZwPSqhMtMIEJUo22+3D5jbkv2a8ch4tkohm+Zjac7uViHlkocC4zXnWm6tL7oNW0NvnNAUeQOkjZoPel1BQ0JqqR6QXDqSVb8C6B8nq3xpw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efebd508-787d-4ff1-c1b6-08d860fcc78a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 02:43:27.1258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIr43NZL4LoV9VgxN/HKrSmBBEKHTNbD30fL0jLSfybLirjoALOiVo1OXfapT7YvaDfNYj0UYpwtzwkbjLp4Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3302
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

Thanks,

On 7/13/18 10:36 AM, Robert Yang wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
> 
> When displaying the buildcfg for the end user, add in processing
> of the multilib variants.  Only the items that are not the same as
> the DEFAULTTUNE are displayed.
> 
> I.e.:
> Build Configuration:
> BB_VERSION        = "1.19.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "CentOS-6.4"
> DISTRO_VERSION    = "oe-core.0"
> MACHINE           = "qemux86-64"
> DEFAULTTUNE       = "x86-64"
> TARGET_SYS        = "x86_64-oe-linux"
> TUNE_FEATURES     = "m64"
> TARGET_FPU        = ""
> lib32:  DEFAULTTUNE       = "x86"
> lib32:  TARGET_SYS        = "i586-oe-linux"
> lib32:  TUNE_FEATURES     = "m32"
> meta              = "master:1975f3d7bbeb184489a5d0a2e0de231f317d3e1b"
> 
> The order of the displayed elements was changed slightly to group the
> host information together, as well as group the target information
> together.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/base.bbclass | 13 ++++++++++++-
>   meta/conf/bitbake.conf    |  2 +-
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 1a359a0..47ecff4 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -188,7 +188,7 @@ def get_layers_branch_rev(d):
>       return layers_branch_rev
>   
>   
> -BUILDCFG_FUNCS ??= "buildcfg_vars get_layers_branch_rev buildcfg_neededvars"
> +BUILDCFG_FUNCS ??= "buildcfg_vars buildcfg_multilibs get_layers_branch_rev buildcfg_neededvars"
>   BUILDCFG_FUNCS[type] = "list"
>   
>   def buildcfg_vars(d):
> @@ -198,6 +198,17 @@ def buildcfg_vars(d):
>           if value is not None:
>               yield '%-20s = "%s"' % (var, value)
>   
> +def buildcfg_multilibs(d):
> +    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
> +    for variant in variants.split():
> +        localdata = get_multilib_datastore(variant, d)
> +        statusvars = oe.data.typed_value('BUILDCFG_VARS', d)
> +        for var in statusvars:
> +            origvalue = d.getVar(var, True)
> +            variantvalue = localdata.getVar(var, True)
> +            if origvalue and variantvalue and origvalue != variantvalue:
> +                yield '%-7s %-17s = "%s"' % (variant + ":", var, variantvalue)
> +
>   def buildcfg_neededvars(d):
>       needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
>       pesteruser = []
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8f73854..3e0c36e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -698,7 +698,7 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
>   
>   # Pre-build configuration output
>   BUILDCFG_HEADER = "Build Configuration:"
> -BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU"
> +BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING DISTRO DISTRO_VERSION MACHINE DEFAULTTUNE TARGET_SYS TUNE_FEATURES TARGET_FPU"
>   BUILDCFG_VARS[type] = "list"
>   BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
>   BUILDCFG_NEEDEDVARS[type] = "list"
> 
