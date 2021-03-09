Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.57])
 by mx.groups.io with SMTP id smtpd.web12.6649.1615284805890065481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 02:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UYbBMro8;
 spf=pass (domain: windriver.com, ip: 40.107.92.57, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlDmikGK6/4bT3ziJiWGCD7HZdL53mmw7fFcyNkZRwo2Md27c2Zxxq54fBM9WD9nzR1YSj8CUUdHo338Npacl0hPeX/6xd3cyMp59Wwdv+8a/+AWznHlomGuWvWX/H9kYGOI56+SVuS1QZ5/TeXHUAEv0kVJBtrUSwujcI5NE+9SQ1q3reW2JqhN7urPtRld/vYrK3LrdQJRIKEUPL/2daGwCOS4/MEL3XpSQWPGLqDiULpNp8Oad11dSxBYBKthOQqaG92o/djfpkbkhEDmnm1jWmkxd3DRx574TKhuTs1Id/qqoSxvxcDh3Z9VUH55Gw7o3PRt8bYCyEsEoZf79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za6StoUOM35kg2uXt5NQLgwnUgL85wj7ntKvVyF96TQ=;
 b=AZYf4zhSlELS7t3d59qBQDxFOLCpejl+4cdkPfjySiNQdvPua/qFwOgP2X62ENMeMn7r/ng2MJmQKrmsa3D+nmOg77bSw8+yRwAuOOsD3e7RAl2clpXX10Wwp0xxRYtfCKyzIBx/dzQudQ1Y+7osQHqHN86W7E1HANrf/n+cB+38AZw1kjSIKFCy6THyMn4db1L/jVnLXA8XSwXhc1talDDjSSywswwDLnERz/iyVaHRyaz7FTAk/GrpP3wNxuZD0Tx/V5aTSVt3O94mLJkDqOgHJHRcNt8tIRKE0lzYxlrxUb9oNm+l3T7fV2YgKmNojLg21oGUu4nsl5nTN7u38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za6StoUOM35kg2uXt5NQLgwnUgL85wj7ntKvVyF96TQ=;
 b=UYbBMro8hYFkuHGTTNmamMyXi2DV5ezQbkMMExh2imHzcUNXaS9jR95rk5V7xz5ch/vLtUluH6Ul2b5+O/09c5q3Ji2Q9l/J3hTb+o1ZkLhArOayy+Ag2EyfbDxRLy/MOcp8+8Ks0CJogvrtJLmWv2l5kiBEqAE4jn0AM5Evwfg=
Authentication-Results: kpit.com; dkim=none (message not signed)
 header.d=none;kpit.com; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB3736.namprd11.prod.outlook.com (2603:10b6:a03:f6::10)
 by BYAPR11MB2935.namprd11.prod.outlook.com (2603:10b6:a03:82::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Tue, 9 Mar
 2021 10:13:22 +0000
Received: from BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9]) by BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9%7]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 10:13:22 +0000
Subject: Re: [OE-core] [meta-oe][sumo][PATCH] opencv: Security fixes
To: "Neetika.Singh" <Neetika.Singh@kpit.com>,
 openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
References: <1615284047-16706-1-git-send-email-Neetika.Singh@kpit.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <a58f56ff-13fc-21dd-4bbd-4297125aa566@windriver.com>
Date: Tue, 9 Mar 2021 18:12:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1615284047-16706-1-git-send-email-Neetika.Singh@kpit.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SL2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::31) To BYAPR11MB3736.namprd11.prod.outlook.com
 (2603:10b6:a03:f6::10)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by SL2PR01CA0019.apcprd01.prod.exchangelabs.com (2603:1096:100:41::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 10:13:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a04d0d20-c500-4706-c365-08d8e2e3f7a4
X-MS-TrafficTypeDiagnostic: BYAPR11MB2935:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2935885ABD262434FAC7D0A4FF929@BYAPR11MB2935.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UZoFf4tJh39ZGHblVdTF9yTznDcfzFD1WG8v0P7RCKcj5Th6Wziyt0z2/swKoA/d5JuAJCA9WWhMML3xNGqLcB60jAS16Ge2kDWgQQpKdiP7lh9WLLSR8PVgch51IUh3jU1DGbaYrhSMevQnSxjpXIhKUJUnNH6Mt1DJEv6Iynl9DPdkeWlQWkDwFgJaenAdLYrE9fuNO1pfdiIFQMJ7dkDoNHuo8Wbu+Axm4qJGq6YEjGN5l0Ddrfxf5ttmhgkw5IRaM16v+zmDe9hR5+0hE6J3zaZHNamHEHe+wk4YQX0hgp4E/xD04m1Xfm0ig8h7eFmV41YgqHGwF3Aiaqs+nSdxmXSFEGdS/BBdbD8dW4S9jp9AziMo0LKAGwfnMXUblpUGwrSIuYK5o65XOzXE+Gzay6LaywScra6sI8/jVxMURn+TkSAsP7VSX0Ab3fbV/5IVDU6eMMmdWLEbK0YARPDxfOphqUc5MOQFm09OsB8klnecC17iceYe/OCD5azxJN4psxJ0VepQ79ILl+ej98FI+COiTV7WMnGFe4wnXwI7jgasYzSZYvtwTMgAeyqtgpMxIZ5k5JkjdcjPlYAl+GpyfA7viujKS3Pdc2mcQ6CqIxh3y8YG1KYGzK9XraNCw8hD1NE7pm/Kkr6Q4VZwoNQcW8/lmFRVAOPXrp2n2XxXVh+NW+Tt2KPnWA/mvnYY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(346002)(376002)(136003)(83380400001)(6486002)(8676002)(6706004)(66574015)(31686004)(966005)(5660300002)(86362001)(6666004)(4326008)(478600001)(30864003)(26005)(16576012)(316002)(66946007)(36756003)(186003)(66556008)(31696002)(66476007)(956004)(53546011)(16526019)(52116002)(15650500001)(8936002)(2616005)(2906002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZGljRnovQk1EY3BIU3pXa0F0c2FGQU1BSldxQlY5c0FwOVI4K256bnk2MzZu?=
 =?utf-8?B?WGFNRVJ2V0lGSkptS1hMUTlLUTQ5Ymc1VkN4R2JjTHZNaUF4TUQzcE9FUmRN?=
 =?utf-8?B?SVBUNXpaRHJaNDRJM1RLbWx0SGZGQzhveGIydFBtcUVTTW5yOEY5R1lJTG1J?=
 =?utf-8?B?Ni9NVi9ZQXZ5TWNKZzAxTjhxK1krVDI1VThqS1ZVVExMcCswMVF6d2crc1pI?=
 =?utf-8?B?WnlBT043ZGFoakVxdE9nOWR6cGxKa0VSWitmdkQwNEpYUHU5SmRpSGl5MEty?=
 =?utf-8?B?VlZadmVxS2lxSVNRNGFFSUNUcmxqT2M5NEU0VmVSMjVUTTFhNUt0Y0VvM3hD?=
 =?utf-8?B?bnFwbnoxV2RCS2t3N3lQOFBWWE5sTFFBYUlPOU16TW5oMmN1SzdVMyt2SHZ6?=
 =?utf-8?B?TnNVM3hKM3grLzczVGhaSk9nazlaOXNoeW9ISXU4N3RqOVFXWndRZUx0eU9z?=
 =?utf-8?B?RjEzUzBIQVhVVUE0YzY2S1pTc1B1WUc5azdlcmc5U1NiMDVvTGZxZWx0U2VV?=
 =?utf-8?B?Wk5tcUlCamNJekYyNEc1YXY1bEg1N2RuWCtleDlXMnJ3ZUhQZUd2MlRGNHZY?=
 =?utf-8?B?QXNKemxUNVNnLzM0QUFxZEZ0MmcyK0VjT1hYM1Y1VE9VNE9NS0ZwTnFEeFk1?=
 =?utf-8?B?U2x3bGhWMzBoSHF1c095emwvUzJPNURzaHlRbXk1bDRvS2ZWOWRlNjN3bkpO?=
 =?utf-8?B?c2xGTzdQNTZlUE1VdDBlWnV1ZEpXaVN2UUVNMm54SlE1UDVwM0VLd1BmOCtC?=
 =?utf-8?B?dHByRW9wUnp1MUhGQXN1K1hUdStpVXdUaTNMaUFUalFIa3NzV1hqcFBlZllT?=
 =?utf-8?B?WEpaYkc5d2ovVTVDODhYSWwvMVBGeTQvdWs5Y21XMFRHLzRRKzhiREFJeDUz?=
 =?utf-8?B?alZKeUtvazh5SkxJbXNDUERQNnd3cm96a3lYUXV6THZKWlJGUnB3Skdmb0R4?=
 =?utf-8?B?L0FYSVV5M21jaHM0ZFNmOFZKM1pmZ096Wm1oK0hjOE9lUnRBSmhoMFBibXlN?=
 =?utf-8?B?cFIxNUxpSVFUZ2NpOEpwR1p4dGRIbUZHenFvZ1FzWWFNSzUzVHAxamxteXN0?=
 =?utf-8?B?UlE1cnkrOEFacjlpb1N1d0NYdFJYYjBZRnRrbHkvZVRWQThKTk9vYXZvUmpp?=
 =?utf-8?B?dG1vY2ZLT1NlMW1wU2JuY1JuQ043NnEwazVLRElBQ0xiL3ByZmRDUHNLWDN0?=
 =?utf-8?B?Yjl5dGlYb0phWVQ4c3l0blNVOXdJandYUlN4YTBpaHU4QitmWFBqeWtjWXRi?=
 =?utf-8?B?a2UzbW5vRHRoMExoQ0NOZHAyUzJZdUd2VDVZWGQ4OURPSzBNQ214QzFMaTAz?=
 =?utf-8?B?RmhvQXRETC9ZMEJRQzUvTVFpTzBzR3F0MEhzdTk1TFpoYlJBclNYN1FJdkZU?=
 =?utf-8?B?UUFCLzRaYVExdElDOTdJaURucFY2dkVXVlNBU01BSTV2WkNSSlFVOUp0S0xB?=
 =?utf-8?B?N1ZyK3V5WmdhS0xjSXYvdGo5VmJoQWpBUVc0eWxBbitkNTlmTTUrQVJHdzFi?=
 =?utf-8?B?Z2tjbURkaXpweWNNZDZzT2pZbkxQYW9mdkVYamhiWTJjaXI2TDNRUXZZSXV5?=
 =?utf-8?B?MFpUOVFtYjFsdjYxNzkxcTFMRUhUeHZ2aE9ia0VtSEdWZlh4RUQ4bk1UMURx?=
 =?utf-8?B?K0l5aGV6YXRLWU9lZ1hKNzdhNlNLUWJBb1N2bmduL1FvRzRJNDJxY0xRN3VW?=
 =?utf-8?B?cUdKRmVRS1pNLzF6bGR3MjRDYzhRbUZoeXNWdTB2dEtTOUJyakhJcDRZQ3py?=
 =?utf-8?Q?hEEbMGHrs8gjV/5u8p/4qRS4FRchY4O8lQxTsd7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04d0d20-c500-4706-c365-08d8e2e3f7a4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 10:13:22.0744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yu0KoWjujbvI1FmKfQLPq/T6QRpD0+CxBo6zRPe0L/Jq4tihkh/bOeoqm6ONf2jwM8Sq/71XWJWmNFJFC9QWsW34dypoEBMQTPdIUjDxOBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2935
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Neetika,

This should send to openembedded-devel@lists.openembedded.org, not oe-core 
mailing list.

// Robert

On 3/9/21 6:00 PM, Neetika.Singh wrote:
> From: Neetika Singh <Neetika.Singh@kpit.com>
> 
> Added patches to fix below CVE's:
> 
> 1. CVE-2019-14491, CVE-2019-14492
> Link: https://github.com/opencv/opencv/commit/ac425f67e4c1d0da9afb9203f0918d8d57c067ed
> 
> 2. CVE-2019-14493
> Link: https://github.com/opencv/opencv/commit/5691d998ead1d9b0542bcfced36c2dceb3a59023
> 
> 3. CVE-2019-15939
> Link: https://github.com/opencv/opencv/commit/5a497077f109d543ab86dfdf8add1c76c0e47d29
> 
> 4. CVE-2019-19624
> Link: https://github.com/opencv/opencv/commit/d1615ba11a93062b1429fce9f0f638d1572d3418
> 
> Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
> ---
>   .../opencv/opencv/CVE-2019-14491.patch             | 148 +++++++++++++
>   .../opencv/opencv/CVE-2019-14493.patch             | 237 +++++++++++++++++++++
>   .../opencv/opencv/CVE-2019-15939.patch             |  73 +++++++
>   .../opencv/opencv/CVE-2019-19624.patch             | 157 ++++++++++++++
>   meta-oe/recipes-support/opencv/opencv_4.1.0.bb     |   4 +
>   5 files changed, 619 insertions(+)
>   create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
>   create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
>   create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
>   create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
> 
> diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
> new file mode 100644
> index 0000000..b82bea5
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
> @@ -0,0 +1,148 @@
> +From 321c74ccd6077bdea1d47450ca4fe955cb5b6330 Mon Sep 17 00:00:00 2001
> +From: Alexander Alekhin <alexander.alekhin@intel.com>
> +Date: Thu, 25 Jul 2019 17:15:59 +0300
> +Subject: [PATCH] objdetect: validate feature rectangle on reading
> +
> +CVE: CVE-2019-14491
> +CVE: CVE-2019-14492
> +Upstream-Status: Backport [https://github.com/opencv/opencv/commit/ac425f67e4c1d0da9afb9203f0918d8d57c067ed.patch]
> +Comment: No changes in any hunk
> +
> +Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
> +---
> + modules/objdetect/src/cascadedetect.cpp | 43 +++++++++++++++++++++----
> + modules/objdetect/src/cascadedetect.hpp |  6 ++--
> + 2 files changed, 40 insertions(+), 9 deletions(-)
> +
> +diff --git a/modules/objdetect/src/cascadedetect.cpp b/modules/objdetect/src/cascadedetect.cpp
> +index 4b2078306fe..bd62cd21a1b 100644
> +--- a/modules/objdetect/src/cascadedetect.cpp
> ++++ b/modules/objdetect/src/cascadedetect.cpp
> +@@ -47,6 +47,10 @@
> + #include "opencv2/objdetect/objdetect_c.h"
> + #include "opencl_kernels_objdetect.hpp"
> +
> ++#if defined(_MSC_VER)
> ++#  pragma warning(disable:4458)  // declaration of 'origWinSize' hides class member
> ++#endif
> ++
> + namespace cv
> + {
> +
> +@@ -537,7 +541,7 @@ bool FeatureEvaluator::setImage( InputArray _image, const std::vector<float>& _s
> +
> + //----------------------------------------------  HaarEvaluator ---------------------------------------
> +
> +-bool HaarEvaluator::Feature :: read( const FileNode& node )
> ++bool HaarEvaluator::Feature::read(const FileNode& node, const Size& origWinSize)
> + {
> +     FileNode rnode = node[CC_RECTS];
> +     FileNodeIterator it = rnode.begin(), it_end = rnode.end();
> +@@ -549,11 +553,23 @@ bool HaarEvaluator::Feature :: read( const FileNode& node )
> +         rect[ri].weight = 0.f;
> +     }
> +
> ++    const int W = origWinSize.width;
> ++    const int H = origWinSize.height;
> ++
> +     for(ri = 0; it != it_end; ++it, ri++)
> +     {
> +         FileNodeIterator it2 = (*it).begin();
> +-        it2 >> rect[ri].r.x >> rect[ri].r.y >>
> +-            rect[ri].r.width >> rect[ri].r.height >> rect[ri].weight;
> ++        Feature::RectWeigth& rw = rect[ri];
> ++        it2 >> rw.r.x >> rw.r.y >> rw.r.width >> rw.r.height >> rw.weight;
> ++        // input validation
> ++        {
> ++            CV_CheckGE(rw.r.x, 0, "Invalid HAAR feature");
> ++            CV_CheckGE(rw.r.y, 0, "Invalid HAAR feature");
> ++            CV_CheckLT(rw.r.x, W, "Invalid HAAR feature");  // necessary for overflow checks
> ++            CV_CheckLT(rw.r.y, H, "Invalid HAAR feature");  // necessary for overflow checks
> ++            CV_CheckLE(rw.r.x + rw.r.width, W, "Invalid HAAR feature");
> ++            CV_CheckLE(rw.r.y + rw.r.height, H, "Invalid HAAR feature");
> ++        }
> +     }
> +
> +     tilted = (int)node[CC_TILTED] != 0;
> +@@ -598,7 +614,7 @@ bool HaarEvaluator::read(const FileNode& node, Size _origWinSize)
> +
> +     for(i = 0; i < n; i++, ++it)
> +     {
> +-        if(!ff[i].read(*it))
> ++        if(!ff[i].read(*it, _origWinSize))
> +             return false;
> +         if( ff[i].tilted )
> +             hasTiltedFeatures = true;
> +@@ -759,11 +775,24 @@ int HaarEvaluator::getSquaresOffset() const
> + }
> +
> + //----------------------------------------------  LBPEvaluator -------------------------------------
> +-bool LBPEvaluator::Feature :: read(const FileNode& node )
> ++bool LBPEvaluator::Feature::read(const FileNode& node, const Size& origWinSize)
> + {
> +     FileNode rnode = node[CC_RECT];
> +     FileNodeIterator it = rnode.begin();
> +     it >> rect.x >> rect.y >> rect.width >> rect.height;
> ++
> ++    const int W = origWinSize.width;
> ++    const int H = origWinSize.height;
> ++    // input validation
> ++    {
> ++        CV_CheckGE(rect.x, 0, "Invalid LBP feature");
> ++        CV_CheckGE(rect.y, 0, "Invalid LBP feature");
> ++        CV_CheckLT(rect.x, W, "Invalid LBP feature");
> ++        CV_CheckLT(rect.y, H, "Invalid LBP feature");
> ++        CV_CheckLE(rect.x + rect.width, W, "Invalid LBP feature");
> ++        CV_CheckLE(rect.y + rect.height, H, "Invalid LBP feature");
> ++    }
> ++
> +     return true;
> + }
> +
> +@@ -797,7 +826,7 @@ bool LBPEvaluator::read( const FileNode& node, Size _origWinSize )
> +     std::vector<Feature>& ff = *features;
> +     for(int i = 0; it != it_end; ++it, i++)
> +     {
> +-        if(!ff[i].read(*it))
> ++        if(!ff[i].read(*it, _origWinSize))
> +             return false;
> +     }
> +     nchannels = 1;
> +@@ -1477,6 +1506,8 @@ bool CascadeClassifierImpl::Data::read(const FileNode &root)
> +     origWinSize.width = (int)root[CC_WIDTH];
> +     origWinSize.height = (int)root[CC_HEIGHT];
> +     CV_Assert( origWinSize.height > 0 && origWinSize.width > 0 );
> ++    CV_CheckLE(origWinSize.width, 1000000, "Invalid window size (too large)");
> ++    CV_CheckLE(origWinSize.height, 1000000, "Invalid window size (too large)");
> +
> +     // load feature params
> +     FileNode fn = root[CC_FEATURE_PARAMS];
> +diff --git a/modules/objdetect/src/cascadedetect.hpp b/modules/objdetect/src/cascadedetect.hpp
> +index f9910530b94..d9a288fcdda 100644
> +--- a/modules/objdetect/src/cascadedetect.hpp
> ++++ b/modules/objdetect/src/cascadedetect.hpp
> +@@ -317,12 +317,12 @@ class HaarEvaluator CV_FINAL : public FeatureEvaluator
> +     struct Feature
> +     {
> +         Feature();
> +-        bool read( const FileNode& node );
> ++        bool read(const FileNode& node, const Size& origWinSize);
> +
> +         bool tilted;
> +
> +         enum { RECT_NUM = 3 };
> +-        struct
> ++        struct RectWeigth
> +         {
> +             Rect r;
> +             float weight;
> +@@ -412,7 +412,7 @@ class LBPEvaluator CV_FINAL : public FeatureEvaluator
> +         Feature( int x, int y, int _block_w, int _block_h  ) :
> +                  rect(x, y, _block_w, _block_h) {}
> +
> +-        bool read(const FileNode& node );
> ++        bool read(const FileNode& node, const Size& origWinSize);
> +
> +         Rect rect; // weight and height for block
> +     };
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
> new file mode 100644
> index 0000000..88d6a7f
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
> @@ -0,0 +1,237 @@
> +From 5691d998ead1d9b0542bcfced36c2dceb3a59023 Mon Sep 17 00:00:00 2001
> +From: Alexander Alekhin <alexander.alekhin@intel.com>
> +Date: Thu, 25 Jul 2019 15:14:22 +0300
> +Subject: [PATCH] core(persistence): added null ptr checks
> +
> +CVE: CVE-2019-14493
> +Upstream-Status: Backport [https://github.com/opencv/opencv/commit/5691d998ead1d9b0542bcfced36c2dceb3a59023.patch]
> +Comment: No changes in any hunk
> +
> +Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
> +---
> + modules/core/src/persistence_json.cpp | 12 ++++++++++++
> + modules/core/src/persistence_xml.cpp  | 21 +++++++++++++++++++++
> + modules/core/src/persistence_yml.cpp  | 21 +++++++++++++++++++++
> + 3 files changed, 54 insertions(+)
> +
> +diff --git a/modules/core/src/persistence_json.cpp b/modules/core/src/persistence_json.cpp
> +index ae678e1b8b1..89914e6534f 100644
> +--- a/modules/core/src/persistence_json.cpp
> ++++ b/modules/core/src/persistence_json.cpp
> +@@ -296,6 +296,8 @@ class JSONParser : public FileStorageParser
> +
> +         while ( is_eof == false && is_completed == false )
> +         {
> ++            if (!ptr)
> ++                CV_PARSE_ERROR_CPP("Invalid input");
> +             switch ( *ptr )
> +             {
> +                 /* comment */
> +@@ -381,6 +383,7 @@ class JSONParser : public FileStorageParser
> +         if ( is_eof || !is_completed )
> +         {
> +             ptr = fs->bufferStart();
> ++            CV_Assert(ptr);
> +             *ptr = '\0';
> +             fs->setEof();
> +             if( !is_completed )
> +@@ -392,6 +395,9 @@ class JSONParser : public FileStorageParser
> +
> +     char* parseKey( char* ptr, FileNode& collection, FileNode& value_placeholder )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         if( *ptr != '"' )
> +             CV_PARSE_ERROR_CPP( "Key must start with \'\"\'" );
> +
> +@@ -430,6 +436,9 @@ class JSONParser : public FileStorageParser
> +
> +     char* parseValue( char* ptr, FileNode& node )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid value input");
> ++
> +         ptr = skipSpaces( ptr );
> +         if( !ptr || !*ptr )
> +             CV_PARSE_ERROR_CPP( "Unexpected End-Of-File" );
> +@@ -817,6 +826,9 @@ class JSONParser : public FileStorageParser
> +
> +     bool parse( char* ptr )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         ptr = skipSpaces( ptr );
> +         if ( !ptr || !*ptr )
> +             return false;
> +diff --git a/modules/core/src/persistence_xml.cpp b/modules/core/src/persistence_xml.cpp
> +index fb30d90896e..89876dd3da8 100644
> +--- a/modules/core/src/persistence_xml.cpp
> ++++ b/modules/core/src/persistence_xml.cpp
> +@@ -360,6 +360,9 @@ class XMLParser : public FileStorageParser
> +
> +     char* skipSpaces( char* ptr, int mode )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         int level = 0;
> +
> +         for(;;)
> +@@ -441,6 +444,9 @@ class XMLParser : public FileStorageParser
> +
> +     char* parseValue( char* ptr, FileNode& node )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         FileNode new_elem;
> +         bool have_space = true;
> +         int value_type = node.type();
> +@@ -456,6 +462,8 @@ class XMLParser : public FileStorageParser
> +                 (c == '<' && ptr[1] == '!' && ptr[2] == '-') )
> +             {
> +                 ptr = skipSpaces( ptr, 0 );
> ++                if (!ptr)
> ++                    CV_PARSE_ERROR_CPP("Invalid input");
> +                 have_space = true;
> +                 c = *ptr;
> +             }
> +@@ -502,6 +510,8 @@ class XMLParser : public FileStorageParser
> +                 {
> +                     ptr = fs->parseBase64( ptr, 0, new_elem);
> +                     ptr = skipSpaces( ptr, 0 );
> ++                    if (!ptr)
> ++                        CV_PARSE_ERROR_CPP("Invalid input");
> +                 }
> +
> +                 ptr = parseTag( ptr, key2, type_name, tag_type );
> +@@ -645,6 +655,9 @@ class XMLParser : public FileStorageParser
> +     char* parseTag( char* ptr, std::string& tag_name,
> +                     std::string& type_name, int& tag_type )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid tag input");
> ++
> +         if( *ptr == '\0' )
> +             CV_PARSE_ERROR_CPP( "Unexpected end of the stream" );
> +
> +@@ -702,6 +715,8 @@ class XMLParser : public FileStorageParser
> +                 if( *ptr != '=' )
> +                 {
> +                     ptr = skipSpaces( ptr, CV_XML_INSIDE_TAG );
> ++                    if (!ptr)
> ++                        CV_PARSE_ERROR_CPP("Invalid attribute");
> +                     if( *ptr != '=' )
> +                         CV_PARSE_ERROR_CPP( "Attribute name should be followed by \'=\'" );
> +                 }
> +@@ -740,6 +755,8 @@ class XMLParser : public FileStorageParser
> +             if( c != '>' )
> +             {
> +                 ptr = skipSpaces( ptr, CV_XML_INSIDE_TAG );
> ++                if (!ptr)
> ++                    CV_PARSE_ERROR_CPP("Invalid input");
> +                 c = *ptr;
> +             }
> +
> +@@ -781,6 +798,8 @@ class XMLParser : public FileStorageParser
> +
> +         // CV_XML_INSIDE_TAG is used to prohibit leading comments
> +         ptr = skipSpaces( ptr, CV_XML_INSIDE_TAG );
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> +
> +         if( memcmp( ptr, "<?xml", 5 ) != 0 )  // FIXIT ptr[1..] - out of bounds read without check
> +             CV_PARSE_ERROR_CPP( "Valid XML should start with \'<?xml ...?>\'" );
> +@@ -791,6 +810,8 @@ class XMLParser : public FileStorageParser
> +         while( ptr && *ptr != '\0' )
> +         {
> +             ptr = skipSpaces( ptr, 0 );
> ++            if (!ptr)
> ++                CV_PARSE_ERROR_CPP("Invalid input");
> +
> +             if( *ptr != '\0' )
> +             {
> +diff --git a/modules/core/src/persistence_yml.cpp b/modules/core/src/persistence_yml.cpp
> +index 4129ca1dc57..7742e827701 100644
> +--- a/modules/core/src/persistence_yml.cpp
> ++++ b/modules/core/src/persistence_yml.cpp
> +@@ -330,6 +330,9 @@ class YAMLParser : public FileStorageParser
> +
> +     char* skipSpaces( char* ptr, int min_indent, int max_comment_indent )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         for(;;)
> +         {
> +             while( *ptr == ' ' )
> +@@ -374,6 +377,9 @@ class YAMLParser : public FileStorageParser
> +
> +     bool getBase64Row(char* ptr, int indent, char* &beg, char* &end)
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         beg = end = ptr = skipSpaces(ptr, 0, INT_MAX);
> +         if (!ptr || !*ptr)
> +             return false; // end of file
> +@@ -394,6 +400,9 @@ class YAMLParser : public FileStorageParser
> +
> +     char* parseKey( char* ptr, FileNode& map_node, FileNode& value_placeholder )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         char c;
> +         char *endptr = ptr - 1, *saveptr;
> +
> +@@ -422,6 +431,9 @@ class YAMLParser : public FileStorageParser
> +
> +     char* parseValue( char* ptr, FileNode& node, int min_indent, bool is_parent_flow )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         char* endptr = 0;
> +         char c = ptr[0], d = ptr[1];
> +         int value_type = FileNode::NONE;
> +@@ -508,6 +520,8 @@ class YAMLParser : public FileStorageParser
> +
> +             *endptr = d;
> +             ptr = skipSpaces( endptr, min_indent, INT_MAX );
> ++            if (!ptr)
> ++                CV_PARSE_ERROR_CPP("Invalid input");
> +
> +             c = *ptr;
> +
> +@@ -634,6 +648,8 @@ class YAMLParser : public FileStorageParser
> +                 FileNode elem;
> +
> +                 ptr = skipSpaces( ptr, new_min_indent, INT_MAX );
> ++                if (!ptr)
> ++                    CV_PARSE_ERROR_CPP("Invalid input");
> +                 if( *ptr == '}' || *ptr == ']' )
> +                 {
> +                     if( *ptr != d )
> +@@ -647,6 +663,8 @@ class YAMLParser : public FileStorageParser
> +                     if( *ptr != ',' )
> +                         CV_PARSE_ERROR_CPP( "Missing , between the elements" );
> +                     ptr = skipSpaces( ptr + 1, new_min_indent, INT_MAX );
> ++                    if (!ptr)
> ++                        CV_PARSE_ERROR_CPP("Invalid input");
> +                 }
> +
> +                 if( struct_type == FileNode::MAP )
> +@@ -746,6 +764,9 @@ class YAMLParser : public FileStorageParser
> +
> +     bool parse( char* ptr )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         bool first = true;
> +         bool ok = true;
> +         FileNode root_collection(fs->getFS(), 0, 0);
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
> new file mode 100644
> index 0000000..35d62cf
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
> @@ -0,0 +1,73 @@
> +From 5a497077f109d543ab86dfdf8add1c76c0e47d29 Mon Sep 17 00:00:00 2001
> +From: Alexander Alekhin <alexander.alekhin@intel.com>
> +Date: Fri, 23 Aug 2019 16:14:53 +0300
> +Subject: [PATCH] objdetect: add input check in HOG detector
> +
> +CVE: CVE-2019-15939
> +Upstream-Status: Backport [https://github.com/opencv/opencv/commit/5a497077f109d543ab86dfdf8add1c76c0e47d29.patch]
> +Comment: No changes in any hunk
> +
> +Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
> +---
> + modules/objdetect/src/hog.cpp | 19 ++++++++++++-------
> + 1 file changed, 12 insertions(+), 7 deletions(-)
> +
> +diff --git a/modules/objdetect/src/hog.cpp b/modules/objdetect/src/hog.cpp
> +index 9524851eebb..378bab30876 100644
> +--- a/modules/objdetect/src/hog.cpp
> ++++ b/modules/objdetect/src/hog.cpp
> +@@ -68,6 +68,7 @@ enum {DESCR_FORMAT_COL_BY_COL, DESCR_FORMAT_ROW_BY_ROW};
> +
> + static int numPartsWithin(int size, int part_size, int stride)
> + {
> ++    CV_Assert(stride != 0);
> +     return (size - part_size + stride) / stride;
> + }
> +
> +@@ -80,13 +81,17 @@ static Size numPartsWithin(cv::Size size, cv::Size part_size,
> +
> + static size_t getBlockHistogramSize(Size block_size, Size cell_size, int nbins)
> + {
> ++    CV_Assert(!cell_size.empty());
> +     Size cells_per_block = Size(block_size.width / cell_size.width,
> +-        block_size.height / cell_size.height);
> ++                                block_size.height / cell_size.height);
> +     return (size_t)(nbins * cells_per_block.area());
> + }
> +
> + size_t HOGDescriptor::getDescriptorSize() const
> + {
> ++    CV_Assert(!cellSize.empty());
> ++    CV_Assert(!blockStride.empty());
> ++
> +     CV_Assert(blockSize.width % cellSize.width == 0 &&
> +         blockSize.height % cellSize.height == 0);
> +     CV_Assert((winSize.width - blockSize.width) % blockStride.width == 0 &&
> +@@ -144,20 +149,20 @@ bool HOGDescriptor::read(FileNode& obj)
> +     if( !obj.isMap() )
> +         return false;
> +     FileNodeIterator it = obj["winSize"].begin();
> +-    it >> winSize.width >> winSize.height;
> ++    it >> winSize.width >> winSize.height; CV_Assert(!winSize.empty());
> +     it = obj["blockSize"].begin();
> +-    it >> blockSize.width >> blockSize.height;
> ++    it >> blockSize.width >> blockSize.height; CV_Assert(!blockSize.empty());
> +     it = obj["blockStride"].begin();
> +-    it >> blockStride.width >> blockStride.height;
> ++    it >> blockStride.width >> blockStride.height; CV_Assert(!blockStride.empty());
> +     it = obj["cellSize"].begin();
> +-    it >> cellSize.width >> cellSize.height;
> +-    obj["nbins"] >> nbins;
> ++    it >> cellSize.width >> cellSize.height; CV_Assert(!cellSize.empty());
> ++    obj["nbins"] >> nbins; CV_Assert(nbins > 0);
> +     obj["derivAperture"] >> derivAperture;
> +     obj["winSigma"] >> winSigma;
> +     obj["histogramNormType"] >> histogramNormType;
> +     obj["L2HysThreshold"] >> L2HysThreshold;
> +     obj["gammaCorrection"] >> gammaCorrection;
> +-    obj["nlevels"] >> nlevels;
> ++    obj["nlevels"] >> nlevels; CV_Assert(nlevels > 0);
> +     if (obj["signedGradient"].empty())
> +         signedGradient = false;
> +     else
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
> new file mode 100644
> index 0000000..923ca2a
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
> @@ -0,0 +1,157 @@
> +From d1615ba11a93062b1429fce9f0f638d1572d3418 Mon Sep 17 00:00:00 2001
> +From: Thang Tran <TranKimThang279@gmail.com>
> +Date: Mon, 27 May 2019 08:18:26 +0200
> +Subject: [PATCH] video:fixed DISOpticalFlow segfault from small img
> +
> +CVE: CVE-2019-19624
> +Upstream-Status: Backport [https://github.com/opencv/opencv/commit/d1615ba11a93062b1429fce9f0f638d1572d3418.patch]
> +Comment: No changes in any hunk
> +
> +Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
> +---
> + modules/video/src/dis_flow.cpp          | 67 ++++++++++++++++++++++++-
> + modules/video/test/test_OF_accuracy.cpp | 28 +++++++++++
> + 2 files changed, 93 insertions(+), 2 deletions(-)
> +
> +diff --git a/modules/video/src/dis_flow.cpp b/modules/video/src/dis_flow.cpp
> +index a453d8b2b51..806d6f1ddaf 100644
> +--- a/modules/video/src/dis_flow.cpp
> ++++ b/modules/video/src/dis_flow.cpp
> +@@ -140,6 +140,8 @@ class DISOpticalFlowImpl CV_FINAL : public DISOpticalFlow
> +     void prepareBuffers(Mat &I0, Mat &I1, Mat &flow, bool use_flow);
> +     void precomputeStructureTensor(Mat &dst_I0xx, Mat &dst_I0yy, Mat &dst_I0xy, Mat &dst_I0x, Mat &dst_I0y, Mat &I0x,
> +                                    Mat &I0y);
> ++    int autoSelectCoarsestScale(int img_width);
> ++    void autoSelectPatchSizeAndScales(int img_width);
> +
> +     struct PatchInverseSearch_ParBody : public ParallelLoopBody
> +     {
> +@@ -435,6 +437,44 @@ void DISOpticalFlowImpl::precomputeStructureTensor(Mat &dst_I0xx, Mat &dst_I0yy,
> +     }
> + }
> +
> ++int DISOpticalFlowImpl::autoSelectCoarsestScale(int img_width)
> ++{
> ++    const int fratio = 5;
> ++    return std::max(0, (int)std::floor(log2((2.0f*(float)img_width) / ((float)fratio * (float)patch_size))));
> ++}
> ++
> ++void DISOpticalFlowImpl::autoSelectPatchSizeAndScales(int img_width)
> ++{
> ++    switch (finest_scale)
> ++    {
> ++    case 1:
> ++        patch_size = 8;
> ++        coarsest_scale = autoSelectCoarsestScale(img_width);
> ++        finest_scale = std::max(coarsest_scale-2, 0);
> ++        break;
> ++
> ++    case 3:
> ++        patch_size = 12;
> ++        coarsest_scale = autoSelectCoarsestScale(img_width);
> ++        finest_scale = std::max(coarsest_scale-4, 0);
> ++        break;
> ++
> ++    case 4:
> ++        patch_size = 12;
> ++        coarsest_scale = autoSelectCoarsestScale(img_width);
> ++        finest_scale = std::max(coarsest_scale-5, 0);
> ++        break;
> ++
> ++    // default case, fall-through.
> ++    case 2:
> ++    default:
> ++        patch_size = 8;
> ++        coarsest_scale = autoSelectCoarsestScale(img_width);
> ++        finest_scale = std::max(coarsest_scale-2, 0);
> ++        break;
> ++    }
> ++}
> ++
> + DISOpticalFlowImpl::PatchInverseSearch_ParBody::PatchInverseSearch_ParBody(DISOpticalFlowImpl &_dis, int _nstripes,
> +                                                                            int _hs, Mat &dst_Sx, Mat &dst_Sy,
> +                                                                            Mat &src_Ux, Mat &src_Uy, Mat &_I0, Mat &_I1,
> +@@ -1318,9 +1358,20 @@ bool DISOpticalFlowImpl::ocl_calc(InputArray I0, InputArray I1, InputOutputArray
> +     else
> +         flow.create(I1Mat.size(), CV_32FC2);
> +     UMat &u_flowMat = flow.getUMatRef();
> +-    coarsest_scale = min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code serach for maximal movement of width/4 */
> ++    coarsest_scale = min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code search for maximal movement of width/4 */
> +                          (int)(log(min(I0Mat.cols, I0Mat.rows) / patch_size) / log(2.0)));              /* Deepest pyramid level greater or equal than patch*/
> +
> ++    if (coarsest_scale<0)
> ++        CV_Error(cv::Error::StsBadSize, "The input image must have either width or height >= 12");
> ++
> ++    if (coarsest_scale<finest_scale)
> ++    {
> ++        // choose the finest level based on coarsest level.
> ++        // Refs: https://github.com/tikroeger/OF_DIS/blob/2c9f2a674f3128d3a41c10e41cc9f3a35bb1b523/run_dense.cpp#L239
> ++        int original_img_width = I0.size().width;
> ++        autoSelectPatchSizeAndScales(original_img_width);
> ++    }
> ++
> +     ocl_prepareBuffers(I0Mat, I1Mat, u_flowMat, use_input_flow);
> +     u_Ux[coarsest_scale].setTo(0.0f);
> +     u_Uy[coarsest_scale].setTo(0.0f);
> +@@ -1385,8 +1436,20 @@ void DISOpticalFlowImpl::calc(InputArray I0, InputArray I1, InputOutputArray flo
> +     else
> +         flow.create(I1Mat.size(), CV_32FC2);
> +     Mat flowMat = flow.getMat();
> +-    coarsest_scale = min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code serach for maximal movement of width/4 */
> ++    coarsest_scale = min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code search for maximal movement of width/4 */
> +                          (int)(log(min(I0Mat.cols, I0Mat.rows) / patch_size) / log(2.0)));              /* Deepest pyramid level greater or equal than patch*/
> ++
> ++    if (coarsest_scale<0)
> ++        CV_Error(cv::Error::StsBadSize, "The input image must have either width or height >= 12");
> ++
> ++    if (coarsest_scale<finest_scale)
> ++    {
> ++        // choose the finest level based on coarsest level.
> ++        // Refs: https://github.com/tikroeger/OF_DIS/blob/2c9f2a674f3128d3a41c10e41cc9f3a35bb1b523/run_dense.cpp#L239
> ++        int original_img_width = I0.size().width;
> ++        autoSelectPatchSizeAndScales(original_img_width);
> ++    }
> ++
> +     int num_stripes = getNumThreads();
> +
> +     prepareBuffers(I0Mat, I1Mat, flowMat, use_input_flow);
> +diff --git a/modules/video/test/test_OF_accuracy.cpp b/modules/video/test/test_OF_accuracy.cpp
> +index affbab65866..b99ffce2a8b 100644
> +--- a/modules/video/test/test_OF_accuracy.cpp
> ++++ b/modules/video/test/test_OF_accuracy.cpp
> +@@ -121,6 +121,34 @@ TEST(DenseOpticalFlow_DIS, ReferenceAccuracy)
> +     }
> + }
> +
> ++TEST(DenseOpticalFlow_DIS, InvalidImgSize_CoarsestLevelLessThanZero)
> ++{
> ++    cv::Ptr<cv::DISOpticalFlow> of = cv::DISOpticalFlow::create();
> ++    const int mat_size = 10;
> ++
> ++    cv::Mat x(mat_size, mat_size, CV_8UC1, 42);
> ++    cv::Mat y(mat_size, mat_size, CV_8UC1, 42);
> ++    cv::Mat flow;
> ++
> ++    ASSERT_THROW(of->calc(x, y, flow), cv::Exception);
> ++}
> ++
> ++// make sure that autoSelectPatchSizeAndScales() works properly.
> ++TEST(DenseOpticalFlow_DIS, InvalidImgSize_CoarsestLevelLessThanFinestLevel)
> ++{
> ++    cv::Ptr<cv::DISOpticalFlow> of = cv::DISOpticalFlow::create();
> ++    const int mat_size = 80;
> ++
> ++    cv::Mat x(mat_size, mat_size, CV_8UC1, 42);
> ++    cv::Mat y(mat_size, mat_size, CV_8UC1, 42);
> ++    cv::Mat flow;
> ++
> ++    of->calc(x, y, flow);
> ++
> ++    ASSERT_EQ(flow.rows, mat_size);
> ++    ASSERT_EQ(flow.cols, mat_size);
> ++}
> ++
> + TEST(DenseOpticalFlow_VariationalRefinement, ReferenceAccuracy)
> + {
> +     Mat frame1, frame2, GT;
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> index d781da6..de708fd 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> @@ -50,6 +50,10 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
>              file://0001-Dont-use-isystem.patch \
>              file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch \
>              file://download.patch \
> +           file://CVE-2019-14491.patch \
> +           file://CVE-2019-14493.patch \
> +           file://CVE-2019-15939.patch \
> +           file://CVE-2019-19624.patch \
>              "
>   PV = "4.1.0"
> 
> --
> 2.7.4
> 
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.
> 
> 
> 
> 
> 
