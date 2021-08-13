Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.44064.1628897669095499357
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 16:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VWcuNltW;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3859a05576=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17DNYMJQ002584
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 16:34:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=OGENJ19oJjFgwYne7+KHdZBbNrYnLsP0JcCCYO45P+Y=;
 b=VWcuNltWbQW4vVFcjLrahZMrcZui4iQOj/wgzufRfD9NGlNn3vgeChSTwAeykQpc4XRa
 agvktyN6wC9LeC932bvvjaraw9DE1N9hMPOa7CXYCIpXA6OKz4c1odnyafC+n3sFqkZd
 VPDMYs/9fYMtbxLDvnmxfD0V1qwNukLXJLwEOFl9Y54D2NIL0Mz2i5saQMw6WWqjPfq4
 99rH5m29re2JryR/X+2n4L1Ov15WrKlp+v9gxl4X3nCLcYgUGVP8XKVGJEVaVNEeYHSF
 lbK5xhkjQwAKVKkTgT7OGSJM5N7CHBOFylnnnreAYwPPFqyT37lQs8xAesDgm9R5PpQ7 EA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ad4wuh5t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 16:34:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPvkwJheYsmcfAh440j4XULiThClTl2W3+LvkE17IqJ12zt7LvTZlvcokx/RzyiJ2eTrjVYhXqq3fWvtDTFK95NuHke5NPjufqTY0xOs+VDw7pxbj0j6lRWjs3QnNEQClxaMHgURmPFV9X42fgDvV8CntMbH1zPFiCg8AtG3Y1GnS/z32mKud9VsM7JJFdDzWK/rbV0tbYYc8U7WCdmi61M8aqUBWtLG6BJl7t349idaL3xS9XRfwAvT0+VN4SDjCu5APsHAtCh35FU47bXyZRskZ4QIguGnO3nbiW/Kl6YmaaejkxN3MkiHlNrEKAOEsCiqWq0uMqIQb3p8HxkUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGENJ19oJjFgwYne7+KHdZBbNrYnLsP0JcCCYO45P+Y=;
 b=RLeXMPGqVP6zI9Q5F1ffyxK5zXJOxJ2jzkKUsl6H9gt+sK2axHaUQRvmPGSnVxumVuRBA9cKTVlAXP4ZVtwfW1ddlmFyfeZGKipd49MCj2G2w/2Bc7MCHJfXYbZAY/ZHEg7E+rhfjTxDkUNw+a2NiNfYzBDYbEltdaLUm1JrgaofyZI8ccY8RM3VHWD2/+GzaNSJd+4DzXxKVv+mM+9KQFqNQvswyRf4txNYjHFFAuEXt0v67XOp6Ds9K6rYj5v0HKGiP/r/lBf2ZagR7QqrOMjh3OUH3eO8ILFAtNyG8pQ8Nr3Mk5RJmZt7jLDGQ9sBbI66zgsstiqNLFC3aBuXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3998.namprd11.prod.outlook.com (2603:10b6:208:137::21)
 by MN2PR11MB3727.namprd11.prod.outlook.com (2603:10b6:208:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 23:34:23 +0000
Received: from MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::e099:43cd:1323:3200]) by MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::e099:43cd:1323:3200%5]) with mapi id 15.20.4415.020; Fri, 13 Aug 2021
 23:34:22 +0000
Subject: Re: [oe-core][PATCH 1/1] blktrace: add rdepends
To: Joe Slater <joe.slater@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20210813202416.138888-1-joe.slater@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <827139a6-de73-ccf7-bbf8-a9097f5ac413@windriver.com>
Date: Fri, 13 Aug 2021 19:34:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210813202416.138888-1-joe.slater@windriver.com>
X-ClientProxiedBy: BYAPR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::39) To MN2PR11MB3998.namprd11.prod.outlook.com
 (2603:10b6:208:137::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR07CA0098.namprd07.prod.outlook.com (2603:10b6:a03:12b::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Fri, 13 Aug 2021 23:34:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db54dc3e-f166-4f92-cf3f-08d95eb2e142
X-MS-TrafficTypeDiagnostic: MN2PR11MB3727:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB37274D8281EA7F051BD8B3E1F8FA9@MN2PR11MB3727.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v1Iu/BAmU9OsDlMvkIF7MQzLSzuQ+PMNd0NgBoAyV2/zSlGngvY7nY404VPolrEQyMgPe826NvXvb8waO5+3OOvL7QWYYKmc9ilkXPcVnBkXA6XorMenzMGXG8CFT1LDLWBB/eNOn2Vk/7ykKRvJv99JH8DQD27SJuZ4b/Go/XlpstMBhfXoeZ83rGcyVolIhgcqbrGmm8q5M307iHfeVVuzzgXMBMlfda9zBCejynaPunoV4aKOBrMdyh8xlqH5Mpt0CSUwzvhXy790WCvj60PVLe0JtzZqkxumKXEVt/FuwK2LnTPJOpw+ufm0tdhE5v4hXrnD+mrkitu8j2Q46SN8Y/mWYLN27fO3UXdPbX3gd1w4ILu4Pkz1D6r3h076DZtBG0o2ufF7t/g9NUV8nyb3expxaFrISOxrGKGct3mNxzQO3lBYaTqJvvn7MhEbEhFrDvI0Oickexw/zgw4Bx3oYU6EmbcOQg6GyjdssZkWSCpMAgbowNAG6Dp+IW6glaTQR3r/XXJkdaczzp8ItTZJVT1daOMwk8hVCZXeV+y5ZZTM/O325Tc1aJQl2zyEc7Tac1aXXv4sS7BXi6TZL0/T+jwFJP1eGKccVZY2x2fetd1//as59WgVDpZFadjA740NIFPMByBhv8lFKxUyd5bDdoJeupl/IlNmhblC3TJ4exVgSJCqS0pzGc6b6I6gypKws0kaNgBZ+7X5c9x3VzTpkEZX/i5zu4Zn4TcZMmBjx6S/q064I3XSNavOdVNSbXXob7ekgiQyd/mlAlKvDSpkujr1A6Is3b3RY9x9eji5imx28QGVFnW+1cNvsI3x5kkquvoQUwPeheJ4iK7BhkJN8+5Stym3R4yVzeklmDk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(396003)(366004)(346002)(966005)(16576012)(316002)(2906002)(26005)(38350700002)(38100700002)(5660300002)(6486002)(956004)(2616005)(6666004)(31686004)(83380400001)(31696002)(36756003)(86362001)(186003)(52116002)(8936002)(66476007)(66556008)(66946007)(8676002)(478600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bUlWbkE0SGJncUxnajlIRENYM3hsWm9UdlJhTVBzOXhoU2ptY0dGV2ZRdmlS?=
 =?utf-8?B?d29OZXY4aGFzQitScFVWMkVIUVNwcWpsdmltOXd1QXpPVm9LZ21CUmNCdmVt?=
 =?utf-8?B?Nnk4eHZORWNoMzU5NlkyYW40bWdDMUZsSlp2b1Z6bXdFaExKT2YydmtlemRt?=
 =?utf-8?B?bnhNZkp5VDhLSzhWTlg2MkplbTdZTnltQXJXczNWenkwMUt1aldxVW0wbXJo?=
 =?utf-8?B?N2RVNWI1OGNDYkEvSTErb3BpYTkwV0RBL0ZhdG9mQ01oZGZTRnBZeDVkMCsv?=
 =?utf-8?B?QzZtNkNqVHpGajFqV2NLQXNWWkdHWDQ5djM0bTVCRHIyaG1ycXNzODlOMEx0?=
 =?utf-8?B?NUEydUdwb3ZjK2w4azcrK2ZKaHhhVGVlNUZHL2I1QUlWNGlqMFNEL3dmZ0hU?=
 =?utf-8?B?azJ3T3lta2VEYUxzcVpYL2xySkpTUzR1WEtRd2N0YjFRRzJNaHdvaG44TVFL?=
 =?utf-8?B?NEhKR1FPdm9oRWlXc1dxZGdYcE9GYytaQjJ4aW5nMHg3YkhNWmJpVS9TMW53?=
 =?utf-8?B?Vmx3djh3UmFSRjhUblQ1YTg1R0dPY0lSME9UcmZoYVY4NXNHdFplN2NpUU9W?=
 =?utf-8?B?b2ZNV3J0TGdid0FmaDVXN0dkbHZnUmQzUWdOU0QxK0xzREo4WXlNNXZOL3Zk?=
 =?utf-8?B?VGpCUlcrM1FiMGh3bW1wMHVkVkF2VzJkOEdzTkhxSkprQW03NlpLc2ZJZ21X?=
 =?utf-8?B?Q0hmRzJYYklDMzNzRmFUWnhFOUIwTWl5T09LOThwL0hZUHZXVG1PekZNSW5q?=
 =?utf-8?B?VkNucFZmN2NGN0xITFdwUVMzSVRhUjBWWnZRR1B6NjlpeDBSb3dNN2ZoZHAv?=
 =?utf-8?B?bzJHclJDZnJPYTN4NFhodmp1RWw3elhINHdaNk5PQUp2Z1hnYm5oeThkQW42?=
 =?utf-8?B?T0RBZ1hGZmxLaG9MTVRzaVFXbVNPUkk4dzVZSk92L1UxK0RkZ0pXbmJDbkJW?=
 =?utf-8?B?Qi80SExIVitxMjgxaklLY0t5TEZkc1RtM0FmeSttUnVrTkZ5RjE5QnFMclhn?=
 =?utf-8?B?eDJHODRDVFN5M2F2NFg1RU8wemxWY3ZLeGR1MHQzY2FrU1RBWDJnTFZkUTBR?=
 =?utf-8?B?aW40ZnFBME1qVFJMRWVoM2pvcldLc3BEZCtRbFlod093N1pnRzNFK0xQYTVQ?=
 =?utf-8?B?ZmYxRGdoTUdWMlBSd1VLbjQ0eU5tWkxaQ0pPWjBFUUpRcUVjVEpqSWNHUnB0?=
 =?utf-8?B?NHAvcUMxQWttN0tjUC9LT0djbnZxd3VGRTlFcE5CT3ZydG1ndTJTZHdad3dU?=
 =?utf-8?B?RlBSVml6K24vT3JtR09YUW9naE1CUWtlcC96eFdCRk5MUFRLUmtsUFRBRFdZ?=
 =?utf-8?B?THU4bWxidVlFeitqM1NzMWMyRmhGb05Ndk9EclExblc1dWRRSUg4QW9aRVlU?=
 =?utf-8?B?cHRzR0M3VGw4cVNmcDJlT0VkQThLTHVZK3p5d2tRN203NkZJaTgzZ3pGOXhH?=
 =?utf-8?B?TzV1ZklFQzEzOTI5MEEyVlhEamZHWWN6NDBWWEo1QW1pMTZKZmRqZ1oyYkxj?=
 =?utf-8?B?SHRLTzQ4NjIwZ2xySmtBSmFrZUkwejlRSk5jUDZ6bjBRYXNtNmd2MUFnZnNP?=
 =?utf-8?B?RFNObXBBamR1U243UGZVRHJBdFlOdjB4UHl3OXRpVlhWMDNWdHNsbXFDdFo5?=
 =?utf-8?B?eVhsK29OVXdQY3ZscVJQaDNQdDUrdVZpTVVRbHZhZ0JndWhIaEI0WkNoc2pR?=
 =?utf-8?B?K0VJWW5rSTZCM0FXZ2tCVmlZaHJUQ3l3Z3dYRGNNeEZOY1lwQWgzR1RBQXA2?=
 =?utf-8?Q?UolPUXUutxMBFq1pC0Y5Xtn+8uqTeZ8PrZcwJtX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db54dc3e-f166-4f92-cf3f-08d95eb2e142
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 23:34:22.8016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ya0QRT220UYU7lfdujrFkjQT3nKc/7cR267tv0yxhZan1ELobutFGyiTEyxR2/NVomxcnvRVpsXZG+OtySkhof2AIwzc8gyeUNxfafGGMxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3727
X-Proofpoint-ORIG-GUID: P1TmJKPBYYRDC84_Q-Ls1iDaWe4tSeI1
X-Proofpoint-GUID: P1TmJKPBYYRDC84_Q-Ls1iDaWe4tSeI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-13_09,2021-08-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130139
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-08-13 4:24 p.m., Joe Slater wrote:
> bno_plot.py uses gnuplot.  Also change shebangs to
> python3 because we do not support python2.

We need to get agreement about what 'python' is.
That's not something i follow and it's already late on Friday so
I'm CCing Trevor, Mr meta-python and pointing you to:

https://www.python.org/dev/peps/pep-0394/

which from a brief review seems to say that it's up to the
distribution! Fun!!


My preference without knowing what other distros have done
is to have the build system make a soft link:
   python -> python3


> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   meta/recipes-kernel/blktrace/blktrace_git.bb  |  6 +++-
>   .../blktrace/files/python3-shebangs.patch     | 30 +++++++++++++++++++
>   2 files changed, 35 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-kernel/blktrace/files/python3-shebangs.patch
> 
> diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
> index d00b1bd0be..36ce282481 100644
> --- a/meta/recipes-kernel/blktrace/blktrace_git.bb
> +++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
> @@ -10,11 +10,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>   
>   DEPENDS = "libaio"
>   
> +RDEPENDS:${PN} += "gnuplot"

As the DESCRIPTION says:

There are three major components:
   a kernel component,
   a utility to record the i/o trace information for
     the kernel to user space,
and
   utilities to analyse and view the trace information.

so shouldn't we split the userspace part up so that the utilities are
packaged separately and people who want to collect data on
target and analyze it elsewhere don't pull in gnuplot and maybe more?



../Randy

> +
>   SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
>   
>   PV = "1.3.0+git${SRCPV}"
>   
> -SRC_URI = "git://git.kernel.dk/blktrace.git"
> +SRC_URI = "git://git.kernel.dk/blktrace.git \
> +           file://python3-shebangs.patch \
> +          "
>   
>   S = "${WORKDIR}/git"
>   
> diff --git a/meta/recipes-kernel/blktrace/files/python3-shebangs.patch b/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
> new file mode 100644
> index 0000000000..70a35c2c3a
> --- /dev/null
> +++ b/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
> @@ -0,0 +1,30 @@
> +blktrace: Use python3 shebangs
> +
> +blktrace can use either python2 or python3, but we really want
> +python3, so modify the shebangs.
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com.
> +
> +
> +diff --git a/btt/bno_plot.py b/btt/bno_plot.py
> +index 3aa4e19..d7d7159 100644
> +--- a/btt/bno_plot.py
> ++++ b/btt/bno_plot.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + #
> + # btt blkno plotting interface
> + #
> +diff --git a/btt/btt_plot.py b/btt/btt_plot.py
> +index 40bc71f..8620d31 100755
> +--- a/btt/btt_plot.py
> ++++ b/btt/btt_plot.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + #
> + # btt_plot.py: Generate matplotlib plots for BTT generate data files
> + #
> 


-- 
# Randy MacLeod
# Wind River Linux
