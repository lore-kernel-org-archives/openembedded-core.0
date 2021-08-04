Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6268.1628065535462280991
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 01:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XJk/B5nC;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38501327b4=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1748I9U5005648
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Aug 2021 01:25:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : cc : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=Efr034N0ywJo+avvyp/wI/PUkRzCFz8+zyj3OcZiRrY=;
 b=XJk/B5nC2ZSs7+5mhptstr/IkvKcv2hbShon31ao956/+t3IAAUONOvBCr7LdpHBP547
 pXKtowgvnubjWHkd2sgB1ONVLsKYRz4Xt9pefCDcq/ka0PreApPwAEtXYgMQGL5lZSKo
 k9GfufUrMQODTs0nJGJ+zW/ZbAQU4KMTVnAEHFWxcAvyZLZ1sC6c8F7QCcV6lRBxWLDL
 I0xmFCqk89Hr8OhxQ+erT15XMvSMiauC64AL7RzopUMUOYqBAK7u23Mzd3IMYEMEnSWf
 TGmA9xpKqz4rQZvoywf3PGM+VIQUi3Grevf6ty0JiTqtMNXO3gcHSwheM0M07moaPfnw bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a753s0pgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 01:25:34 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1748PYi3020473
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Aug 2021 01:25:34 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a753s0pgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Aug 2021 01:25:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bg9QjsdoHBzk0Iy9ux8tzWoUZTXC2B0KkH7cT3XUiEROLOeWPamVW/amP5YiPU4NbVqgfgVRQ5J1QOH3kCu1l3zU8UyL/cGo/lWS2hef5DYId+T9J8OqriXX5Arsy5ke2b9bGRy+2+SGMc+Hw1gb5dCXaYuI9XHO+Ob/a2PepW2JKvbT9y1W0dx+T7c3jZr5Phr0LQtQklKaHrqzfwCYRoHd8S0V0vR1l+vbUrSnD4VIjzjGeuNRcitk4SBUjCAhCS85LWut3EckamcKs2hxGFOWB3ZFlz8LpTH8wwxlA1NkhG5SzKPKKnTBCICTkl8PDT1ckmV+qhEjbREfauPn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Efr034N0ywJo+avvyp/wI/PUkRzCFz8+zyj3OcZiRrY=;
 b=QQBOHdiwqG7cwv3LQ+f0zZ2sexGCazF2u63l5ADgeJ/vyzuO7GLFQXU8y8cYE1vFV2seuP26+uAGVQA+LgpNlQB+El5uMxHa552OA//Az1jknJ4dy46h25VFEDbyPrMTfYBaIWX55PrZwgs94zqJQ/8+Ji8OIHSqf3FT2pXKR7UfOt7oS1Rj5UgfpOtzqvwSxLZeE8CXygB+YwP/SQE1UTBCEdTXw7kchd0S2oisrd2CEmYM2LCtWZRK5W4Y127R/KiJfMuXq9RDlCPPdoawCb8CgKxR9QIfaeWtVKxEfdvgNgTjbeycShluAOkjpMpoX6Mop8jMLoJLFGPTSNb4uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 4 Aug
 2021 08:25:31 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::24fe:fb1b:ce1e:d109]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::24fe:fb1b:ce1e:d109%9]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 08:25:31 +0000
Subject: Re: [OE-core] [PATCH] iputils: backport a fix for building on hosts without ip installed
To: Martin Jansa <Martin.Jansa@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <1697EB16E97488E4.1963@lists.openembedded.org>
 <20210804080637.5869-1-Martin.Jansa@gmail.com>
Cc: alex.kanavin@gmail.com
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <5d94be69-fd43-ec59-e4c3-362ae295ab84@windriver.com>
Date: Wed, 4 Aug 2021 16:36:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20210804080637.5869-1-Martin.Jansa@gmail.com>
X-ClientProxiedBy: HKAPR03CA0035.apcprd03.prod.outlook.com
 (2603:1096:203:c9::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HKAPR03CA0035.apcprd03.prod.outlook.com (2603:1096:203:c9::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4394.10 via Frontend Transport; Wed, 4 Aug 2021 08:25:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9db6305a-a60c-42e1-128a-08d957216c2c
X-MS-TrafficTypeDiagnostic: CO6PR11MB5636:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56360E15674AFAEF67B551D7EDF19@CO6PR11MB5636.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aBzYQ17JgfmKmdAFbjFsf+vwsUfM0fbmKS0MsmEEnOXWR/EEeWVC2bTvJSqWW9Fq8zJaABbieWjj2fdDxgdKMzCTc8XBFASSOaWExzA8z+GbKDHSQngf9qZ00vP5u0ayt8QRyaZAguWrIquBsV+N+4YTRpLMuaE3ShCHBgBFhG+G7Kc9b5HlphU+P+dxFOtNurmJRNJ9prX8enmI+1FsCE8iK/1IvasLdIiQUmW8vvUjTW4vFmSQxUEOwV6xQoJ0MerZLIEWXpRx5h0CyF+T3mlBh+GwlbJBHKBPMymZK6yefECsiO9hOuAS6KHBahrKiVFWauD87rGQlASfGp6Kc2oTWDXRbsij0b5zJK5OvSockl+1sXt8fKzVosOFVPJuBG38P0q94YUhjqUNkk/6C1ZyGZ8uj0xRSdrYGsO30ZoIDoja4gwWqLGDn+Hk8JsZv86p8YamoWq8xlC6DKc/PtAAOT6QI57pG7wSPY0Zf1pfHCU+IRcQcxNYsnrSuIg0VwOYlYXbykwp2HXpY0pzlJT68moGScph2n5MZIRzdScsK4aQHqLgZjESb4sDjWOVjKGYGIrdcOVsY9KH1Kt7QmAA/fI5G0P34d7eBrT8X/5NUWaWfD356ixW6L15iYVpYPzwiLNMHPPuUuWW9NEckX0M4m/E3+XlkQTWXff9MyfDRVhCglOSgLp75CZw1nY5trXzFyrI8eno/cdHhEs1X3PCUtnHSscNEGyW92XJbIko7qtUKwSiO+/jBoApYFuC5ZfgupL4bkfVTK0g/JBpoera71WpUZjXcMegbvqBpCgtQNBXt0Eb5JCWJNppFUppIyLPozfApg67AAAv8aL9HDcKOMtnvNTCM7gtP7H+NwFN8BY6vPUlKHkh+3+z85UGBupCw/LDEuZFyzsTEy64Gw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(6666004)(53546011)(52116002)(956004)(36756003)(66946007)(2906002)(38350700002)(38100700002)(83380400001)(66476007)(31696002)(66556008)(6486002)(4326008)(5660300002)(31686004)(30864003)(8676002)(166002)(86362001)(8936002)(508600001)(316002)(966005)(186003)(33964004)(26005)(16576012)(6706004)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UDlQeUVGWTJYTG1kL3NPcEpqa1RRVFdadU5kUmpvQmZ4aDEvVGE2QXJWRW1N?=
 =?utf-8?B?eFhodnl0NE96dHZVaW1QV2lzQUJEamlUM3BUZ280S2hCa2x6L0RPRVVuWGpC?=
 =?utf-8?B?QWRJTEtST0VmWWJsVjY4OWlENVhtVzZQNy94TUhNRmRMb3ZDaURGYzVzMURq?=
 =?utf-8?B?SFFIaUthc3V0YzVYdU5Neko1aWFUOUVLQis4UEtUYVRxZ2p0aGkrcllkaWlw?=
 =?utf-8?B?TWFyWHZXT2lBdXFCM29Kb0IvRDcwdkI4UjB6Qm9KVUhSam9paFJsRm1DQXMy?=
 =?utf-8?B?bm42VTV4Q2N4ejlwUTVYOUpvczViTjVjK25ES1dHbjNrSnhEY09vWlN3VnZB?=
 =?utf-8?B?bGZ4dHZKS0xIamgyQWtralhxNDFReFh3SWQwN29zZU1teFp0L2pmb1lqYnAz?=
 =?utf-8?B?WDJBUVVVRm42a0FyTk5jTVY1SEl0d0dRaVhIaU1uVC9teHJZRVVnT1QyU2VG?=
 =?utf-8?B?dW5iSk1qQ1BsMnFyWmxqT1huYmZHcWpCRjhKR0liRzZDUFA2THRtV2cvZ1Fr?=
 =?utf-8?B?SENRZ0dJU1ZDNWZ2Nk8xME9uRWdZY2IzdExiR2Q3d21VbjZFZE0zOGhPTU5t?=
 =?utf-8?B?Q3FQeWF4Mi90VUMxVU1LNEViUzhpZlhCeEtGM1IrOTgyZzg5dys0bWdEdU1V?=
 =?utf-8?B?SDNKSjlUazU1RytUSmRrditxaWY4TzEwRE9wdkFXbVNqTDJBZXpmRC8xdkU3?=
 =?utf-8?B?NVltVUVOTkhkMW0xVkszZ2tNUklXRlh4UVhzOXA5Rk5IRHRCRDVzSHNYOHFp?=
 =?utf-8?B?TTdFWjY3Z05BS3B4SmY0dTlHNHRhR0xFRkNWQmNjc2h2c0JsQy9VL0dGbTBn?=
 =?utf-8?B?ZC85YW0vL3oxa2gvQVdPYWRveUM3K0tBaFdkNk1LVGZjdDNGY1Z3NlZRZFV6?=
 =?utf-8?B?N3RyL3hOcytNZnFVMW5kVzFQa0twdHBlNGJYczVuMXZraXFreG1JbzlCNW4r?=
 =?utf-8?B?Z0V1ekVGR2lDTjJXQ3Fxb1UwbGJJUU52U0liZUlZUzBsaGYzK2MyL0RCVHFx?=
 =?utf-8?B?N2YxejVaTUdmZFhzMHFJM3VrMGY4ZVM4emREdzdIRmdKbUxidmpKMmVjTU1M?=
 =?utf-8?B?L1hudHNvcW1SOGJOMUtFdFB5eFMzQzBMTEh5aUw2US9yakVGK29lVnpoYStI?=
 =?utf-8?B?ZGlsKzJDaFJLUkhTenE0WFdJSTZWZG1YYk13ZkdOWGI5TENwVzhNTGt3Nm53?=
 =?utf-8?B?cmNRdmVweGZ0SmRnRmRtRE5hRjJhRjArc3VtTnRXYm9jRGw1R2g2aUJVa0xS?=
 =?utf-8?B?OUoya0w0UU1VL3UrcW1zYk01RS9XN2pzYUVvSDRiR1hFd0JqQk5XMXRqUTZM?=
 =?utf-8?B?NDFDRUkvODZRVFVQc2NzWjd5dk81dGVVbXdPWFZjeUlJRTdRVGlwMDNrcVpz?=
 =?utf-8?B?ZmJVUS9iVWxlRzlyNktnN0N0UDlhRk1BZEtld0NXSkZYdTc2Z2hka0MwZGdD?=
 =?utf-8?B?NmR0TGkrK0FReXJZZEV3bUxqMmtZNXhJQmZBWWFZYm9MTzJGR0NvZVJnS0tu?=
 =?utf-8?B?T0x1dE5rMFJVOThlZkdzUGRkL2p6dVhCKzBTN1V6ZWN0dm9TMHQ0cU91SDFo?=
 =?utf-8?B?ajZRNmtJcVJvMTF1ck8xM21zOCtpNnZ0eHZham9kdUNHWTJ0dkpXTzN6d0dZ?=
 =?utf-8?B?cTJHd2JnMXp0NDBSanp1Q2JXZTk0QW5ycG1seTFBTURnSHI1a0hjeEs5Y21i?=
 =?utf-8?B?aWQ2Y3dMSHJrVHI3aW0yTm00Q2NTci9PT2dKc1EzajdaRHdjeGJWZEtoK0d0?=
 =?utf-8?Q?kfN9BDdlNc7qBw5ku5ngxZuRSQBtmL34XkALiRw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db6305a-a60c-42e1-128a-08d957216c2c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 08:25:31.2768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCt9VdOlEOKNruUqQbnQ/SZ+Z3ypdK30Ao1tJm+N+gWqIxuHnicK6ux8X9Cmq9/L0zA8qXHz1RH6IEHWfaySsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5636
X-Proofpoint-ORIG-GUID: utx7K5D220yFGAnya0MLpjhUJf-i35_d
X-Proofpoint-GUID: R12_Z_AdQQ1XrfiMp9tBBgepnc1fN8PA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-04_02,2021-08-03_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108040041
Content-Type: multipart/alternative;
 boundary="------------8BB8E3A395A76CB8C69AE061"

--------------8BB8E3A395A76CB8C69AE061
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

I met the same problem and sent out a similar patch.
More accurately, the problem is about 'testsdk' and 'testimage' not 
being inherited in configuration.

meta/conf/bitbake.conf:HOSTTOOLS += "${@'ip ping ps scp ssh stty' if 
(bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, 
False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in 
["testimage.bbclass", "testsdk.bbclass"])) else ''}"

Best Regards,
Chen Qi

On 08/04/2021 04:06 PM, Martin Jansa wrote:
> * otherwise fails with:
>    ../git/ping/meson.build:38:0: ERROR: Program or command 'ip' not found or not executable
>    on hosts without ip command
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   .../0001-meson-Make-tests-optional.patch      | 217 ++++++++++++++++++
>   .../iputils/iputils_20210722.bb               |   8 +-
>   2 files changed, 222 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
>
> diff --git a/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
> new file mode 100644
> index 0000000000..0e47a8f047
> --- /dev/null
> +++ b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
> @@ -0,0 +1,217 @@
> +From c50aa971b9f7bf3212c48cb271ab2b1e804aef7f Mon Sep 17 00:00:00 2001
> +From: Heiko Becker <heirecka@exherbo.org>
> +Date: Fri, 23 Jul 2021 16:32:46 +0200
> +Subject: [PATCH] meson: Make tests optional
> +
> +Now can be disabled with -DSKIP_TESTS=true.
> +
> +It allows to avoid meson error during build when ip isn't installed.
> +
> +Closes: #359
> +
> +Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> +Signed-off-by: Heiko Becker <heirecka@exherbo.org>
> +[ pvorel: Rename variable TEST => SKIP_TESTS, default false, adjust
> +the description ]
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +
> +Upstream-Status: Backport
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + meson_options.txt     |  3 ++
> + ping/meson.build      | 84 ++-----------------------------------------
> + ping/test/meson.build | 81 +++++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 86 insertions(+), 82 deletions(-)
> + create mode 100644 ping/test/meson.build
> +
> +diff --git a/meson_options.txt b/meson_options.txt
> +index ac5f5d9..517667f 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -72,3 +72,6 @@ option('INSTALL_SYSTEMD_UNITS', type: 'boolean', value: false,
> +
> + option('USE_GETTEXT', type: 'boolean', value: true,
> + 	description: 'Enable I18N')
> ++
> ++option('SKIP_TESTS', type: 'boolean', value: false,
> ++	description: 'Skip tests during build')
> +diff --git a/ping/meson.build b/ping/meson.build
> +index 1e678ec..83ea353 100644
> +--- a/ping/meson.build
> ++++ b/ping/meson.build
> +@@ -27,86 +27,6 @@ if (setcap_ping)
> + 	)
> + endif
> +
> +-##### TESTS #####
> +-
> +-# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
> +-
> +-# GitHub CI does not have working IPv6
> +-# https://github.com/actions/virtual-environments/issues/668
> +-ipv6_dst = []
> +-ipv6_switch = []
> +-r = run_command('ip', '-6', 'a')
> +-if r.stdout().strip().contains('::1')
> +-  message('IPv6 enabled')
> +-  ipv6_dst = [ '::1' ]
> +-  ipv6_switch = [ '-6' ]
> +-else
> +-  message('WARNING: IPv6 disabled')
> ++if not get_option('SKIP_TESTS')
> ++	subdir('test')
> + endif
> +-
> +-run_as_root = false
> +-r = run_command('id', '-u')
> +-if r.stdout().strip().to_int() == 0
> +-  message('running as root')
> +-  run_as_root = true
> +-else
> +-  message('running as normal user')
> +-endif
> +-
> +-foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
> +-  foreach switch : [ '', '-4' ] + ipv6_switch
> +-	args = [ '-c1', dst ]
> +-	should_fail = false
> +-
> +-	if switch != ''
> +-	  args = [switch] + args
> +-	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
> +-		 should_fail = true
> +-	  endif
> +-	endif
> +-
> +-	name = 'ping ' + ' '.join(args)
> +-	test(name, ping, args : args, should_fail : should_fail)
> +-  endforeach
> +-endforeach
> +-
> +-ping_tests_opt = [
> +-  [ '-c1' ],
> +-  [ '-c5', '-i0.1' ],
> +-  [ '-c1', '-I', 'lo' ],
> +-  [ '-c1', '-w1' ],
> +-  [ '-c1', '-W1' ],
> +-  [ '-c1', '-W1.1' ],
> +-]
> +-foreach dst : [ '127.0.0.1' ] + ipv6_dst
> +-  foreach args : ping_tests_opt
> +-	args += [ dst ]
> +-	name = 'ping ' + ' '.join(args)
> +-	test(name, ping, args : args)
> +-  endforeach
> +-endforeach
> +-
> +-ping_tests_opt_fail = [
> +-  [ '-c1.1' ],
> +-  [ '-I', 'nonexisting' ],
> +-  [ '-w0.1' ],
> +-  [ '-w0,1' ],
> +-]
> +-foreach dst : [ '127.0.0.1' ] + ipv6_dst
> +-  foreach args : ping_tests_opt_fail
> +-	args += [ dst ]
> +-	name = 'ping ' + ' '.join(args)
> +-	test(name, ping, args : args, should_fail : true)
> +-  endforeach
> +-endforeach
> +-
> +-ping_tests_user_fail = [
> +-  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
> +-]
> +-foreach dst : [ '127.0.0.1' ] + ipv6_dst
> +-  foreach args : ping_tests_user_fail
> +-	args += [ dst ]
> +-	name = 'ping ' + ' '.join(args)
> +-	test(name, ping, args : args, should_fail : not run_as_root)
> +-  endforeach
> +-endforeach
> +diff --git a/ping/test/meson.build b/ping/test/meson.build
> +new file mode 100644
> +index 0000000..43aed75
> +--- /dev/null
> ++++ b/ping/test/meson.build
> +@@ -0,0 +1,81 @@
> ++# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
> ++
> ++# GitHub CI does not have working IPv6
> ++# https://github.com/actions/virtual-environments/issues/668
> ++ipv6_dst = []
> ++ipv6_switch = []
> ++r = run_command('ip', '-6', 'a')
> ++if r.stdout().strip().contains('::1')
> ++  message('IPv6 enabled')
> ++  ipv6_dst = [ '::1' ]
> ++  ipv6_switch = [ '-6' ]
> ++else
> ++  message('WARNING: IPv6 disabled')
> ++endif
> ++
> ++run_as_root = false
> ++r = run_command('id', '-u')
> ++if r.stdout().strip().to_int() == 0
> ++  message('running as root')
> ++  run_as_root = true
> ++else
> ++  message('running as normal user')
> ++endif
> ++
> ++foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
> ++  foreach switch : [ '', '-4' ] + ipv6_switch
> ++	args = [ '-c1', dst ]
> ++	should_fail = false
> ++
> ++	if switch != ''
> ++	  args = [switch] + args
> ++	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
> ++		 should_fail = true
> ++	  endif
> ++	endif
> ++
> ++	name = 'ping ' + ' '.join(args)
> ++	test(name, ping, args : args, should_fail : should_fail)
> ++  endforeach
> ++endforeach
> ++
> ++ping_tests_opt = [
> ++  [ '-c1' ],
> ++  [ '-c5', '-i0.1' ],
> ++  [ '-c1', '-I', 'lo' ],
> ++  [ '-c1', '-w1' ],
> ++  [ '-c1', '-W1' ],
> ++  [ '-c1', '-W1.1' ],
> ++]
> ++foreach dst : [ '127.0.0.1' ] + ipv6_dst
> ++  foreach args : ping_tests_opt
> ++	args += [ dst ]
> ++	name = 'ping ' + ' '.join(args)
> ++	test(name, ping, args : args)
> ++  endforeach
> ++endforeach
> ++
> ++ping_tests_opt_fail = [
> ++  [ '-c1.1' ],
> ++  [ '-I', 'nonexisting' ],
> ++  [ '-w0.1' ],
> ++  [ '-w0,1' ],
> ++]
> ++foreach dst : [ '127.0.0.1' ] + ipv6_dst
> ++  foreach args : ping_tests_opt_fail
> ++	args += [ dst ]
> ++	name = 'ping ' + ' '.join(args)
> ++	test(name, ping, args : args, should_fail : true)
> ++  endforeach
> ++endforeach
> ++
> ++ping_tests_user_fail = [
> ++  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
> ++]
> ++foreach dst : [ '127.0.0.1' ] + ipv6_dst
> ++  foreach args : ping_tests_user_fail
> ++	args += [ dst ]
> ++	name = 'ping ' + ' '.join(args)
> ++	test(name, ping, args : args, should_fail : not run_as_root)
> ++  endforeach
> ++endforeach
> diff --git a/meta/recipes-extended/iputils/iputils_20210722.bb b/meta/recipes-extended/iputils/iputils_20210722.bb
> index c2a5bf44ea..2e4ff2e826 100644
> --- a/meta/recipes-extended/iputils/iputils_20210722.bb
> +++ b/meta/recipes-extended/iputils/iputils_20210722.bb
> @@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390"
>   DEPENDS = "gnutls"
>   
>   SRC_URI = "git://github.com/iputils/iputils \
> -           file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
> -           "
> +    file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
> +    file://0001-meson-Make-tests-optional.patch \
> +"
>   SRCREV = "71bb2a6c72e9f658e90ac618c73d873a76bbaa81"
>   
>   S = "${WORKDIR}/git"
> @@ -38,7 +39,8 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
>   
>   inherit meson systemd update-alternatives
>   
> -EXTRA_OEMESON += "--prefix=${root_prefix}/"
> +# skip tests as they require ip to be installed on host
> +EXTRA_OEMESON += "--prefix=${root_prefix}/ -DSKIP_TESTS=true"
>   
>   ALTERNATIVE_PRIORITY = "100"
>   
>
>
> 
>


--------------8BB8E3A395A76CB8C69AE061
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Martin,<br>
      <br>
      I met the same problem and sent out a similar patch.<br>
      More accurately, the problem is about 'testsdk' and 'testimage'
      not being inherited in configuration.<br>
      <br>
      meta/conf/bitbake.conf:HOSTTOOLS += <a class="moz-txt-link-rfc2396E" href="mailto:${@'ippingpsscpsshstty'if(bb.utils.contains_any('IMAGE_CLASSES','testimagetestsdk',True,False,d)orany(xin(d.getVar(">&quot;${@'ip ping ps scp ssh stty'
      if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk',
      True, False, d) or any(x in (d.getVar(&quot;</a>BBINCLUDED&quot;) or &quot;&quot;) for x
      in [&quot;testimage.bbclass&quot;, &quot;testsdk.bbclass&quot;])) else ''}&quot;<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 08/04/2021 04:06 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote cite="mid:20210804080637.5869-1-Martin.Jansa@gmail.com" type="cite">
      <pre wrap="">* otherwise fails with:
  ../git/ping/meson.build:38:0: ERROR: Program or command 'ip' not found or not executable
  on hosts without ip command

Signed-off-by: Martin Jansa <a class="moz-txt-link-rfc2396E" href="mailto:Martin.Jansa@gmail.com">&lt;Martin.Jansa@gmail.com&gt;</a>
---
 .../0001-meson-Make-tests-optional.patch      | 217 ++++++++++++++++++
 .../iputils/iputils_20210722.bb               |   8 +-
 2 files changed, 222 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
new file mode 100644
index 0000000000..0e47a8f047
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
@@ -0,0 +1,217 @@
+From c50aa971b9f7bf3212c48cb271ab2b1e804aef7f Mon Sep 17 00:00:00 2001
+From: Heiko Becker <a class="moz-txt-link-rfc2396E" href="mailto:heirecka@exherbo.org">&lt;heirecka@exherbo.org&gt;</a>
+Date: Fri, 23 Jul 2021 16:32:46 +0200
+Subject: [PATCH] meson: Make tests optional
+
+Now can be disabled with -DSKIP_TESTS=true.
+
+It allows to avoid meson error during build when ip isn't installed.
+
+Closes: #359
+
+Reviewed-by: Petr Vorel <a class="moz-txt-link-rfc2396E" href="mailto:petr.vorel@gmail.com">&lt;petr.vorel@gmail.com&gt;</a>
+Signed-off-by: Heiko Becker <a class="moz-txt-link-rfc2396E" href="mailto:heirecka@exherbo.org">&lt;heirecka@exherbo.org&gt;</a>
+[ pvorel: Rename variable TEST =&gt; SKIP_TESTS, default false, adjust
+the description ]
+Signed-off-by: Petr Vorel <a class="moz-txt-link-rfc2396E" href="mailto:petr.vorel@gmail.com">&lt;petr.vorel@gmail.com&gt;</a>
+
+Upstream-Status: Backport
+Signed-off-by: Martin Jansa <a class="moz-txt-link-rfc2396E" href="mailto:Martin.Jansa@gmail.com">&lt;Martin.Jansa@gmail.com&gt;</a>
+---
+ meson_options.txt     |  3 ++
+ ping/meson.build      | 84 ++-----------------------------------------
+ ping/test/meson.build | 81 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 86 insertions(+), 82 deletions(-)
+ create mode 100644 ping/test/meson.build
+
+diff --git a/meson_options.txt b/meson_options.txt
+index ac5f5d9..517667f 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -72,3 +72,6 @@ option('INSTALL_SYSTEMD_UNITS', type: 'boolean', value: false,
+ 
+ option('USE_GETTEXT', type: 'boolean', value: true,
+ 	description: 'Enable I18N')
++
++option('SKIP_TESTS', type: 'boolean', value: false,
++	description: 'Skip tests during build')
+diff --git a/ping/meson.build b/ping/meson.build
+index 1e678ec..83ea353 100644
+--- a/ping/meson.build
++++ b/ping/meson.build
+@@ -27,86 +27,6 @@ if (setcap_ping)
+ 	)
+ endif
+ 
+-##### TESTS #####
+-
+-# TODO: ::1 generates DEPRECATION: &quot;:&quot; is not allowed in test name &quot;ping -c1 ::1&quot;, it has been replaced with &quot;_&quot;
+-
+-# GitHub CI does not have working IPv6
+-# <a class="moz-txt-link-freetext" href="https://github.com/actions/virtual-environments/issues/668">https://github.com/actions/virtual-environments/issues/668</a>
+-ipv6_dst = []
+-ipv6_switch = []
+-r = run_command('ip', '-6', 'a')
+-if r.stdout().strip().contains('::1')
+-  message('IPv6 enabled')
+-  ipv6_dst = [ '::1' ]
+-  ipv6_switch = [ '-6' ]
+-else
+-  message('WARNING: IPv6 disabled')
++if not get_option('SKIP_TESTS')
++	subdir('test')
+ endif
+-
+-run_as_root = false
+-r = run_command('id', '-u')
+-if r.stdout().strip().to_int() == 0
+-  message('running as root')
+-  run_as_root = true
+-else
+-  message('running as normal user')
+-endif
+-
+-foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
+-  foreach switch : [ '', '-4' ] + ipv6_switch
+-	args = [ '-c1', dst ]
+-	should_fail = false
+-
+-	if switch != ''
+-	  args = [switch] + args
+-	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
+-		 should_fail = true
+-	  endif
+-	endif
+-
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args, should_fail : should_fail)
+-  endforeach
+-endforeach
+-
+-ping_tests_opt = [
+-  [ '-c1' ],
+-  [ '-c5', '-i0.1' ],
+-  [ '-c1', '-I', 'lo' ],
+-  [ '-c1', '-w1' ],
+-  [ '-c1', '-W1' ],
+-  [ '-c1', '-W1.1' ],
+-]
+-foreach dst : [ '127.0.0.1' ] + ipv6_dst
+-  foreach args : ping_tests_opt
+-	args += [ dst ]
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args)
+-  endforeach
+-endforeach
+-
+-ping_tests_opt_fail = [
+-  [ '-c1.1' ],
+-  [ '-I', 'nonexisting' ],
+-  [ '-w0.1' ],
+-  [ '-w0,1' ],
+-]
+-foreach dst : [ '127.0.0.1' ] + ipv6_dst
+-  foreach args : ping_tests_opt_fail
+-	args += [ dst ]
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args, should_fail : true)
+-  endforeach
+-endforeach
+-
+-ping_tests_user_fail = [
+-  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
+-]
+-foreach dst : [ '127.0.0.1' ] + ipv6_dst
+-  foreach args : ping_tests_user_fail
+-	args += [ dst ]
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args, should_fail : not run_as_root)
+-  endforeach
+-endforeach
+diff --git a/ping/test/meson.build b/ping/test/meson.build
+new file mode 100644
+index 0000000..43aed75
+--- /dev/null
++++ b/ping/test/meson.build
+@@ -0,0 +1,81 @@
++# TODO: ::1 generates DEPRECATION: &quot;:&quot; is not allowed in test name &quot;ping -c1 ::1&quot;, it has been replaced with &quot;_&quot;
++
++# GitHub CI does not have working IPv6
++# <a class="moz-txt-link-freetext" href="https://github.com/actions/virtual-environments/issues/668">https://github.com/actions/virtual-environments/issues/668</a>
++ipv6_dst = []
++ipv6_switch = []
++r = run_command('ip', '-6', 'a')
++if r.stdout().strip().contains('::1')
++  message('IPv6 enabled')
++  ipv6_dst = [ '::1' ]
++  ipv6_switch = [ '-6' ]
++else
++  message('WARNING: IPv6 disabled')
++endif
++
++run_as_root = false
++r = run_command('id', '-u')
++if r.stdout().strip().to_int() == 0
++  message('running as root')
++  run_as_root = true
++else
++  message('running as normal user')
++endif
++
++foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
++  foreach switch : [ '', '-4' ] + ipv6_switch
++	args = [ '-c1', dst ]
++	should_fail = false
++
++	if switch != ''
++	  args = [switch] + args
++	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
++		 should_fail = true
++	  endif
++	endif
++
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args, should_fail : should_fail)
++  endforeach
++endforeach
++
++ping_tests_opt = [
++  [ '-c1' ],
++  [ '-c5', '-i0.1' ],
++  [ '-c1', '-I', 'lo' ],
++  [ '-c1', '-w1' ],
++  [ '-c1', '-W1' ],
++  [ '-c1', '-W1.1' ],
++]
++foreach dst : [ '127.0.0.1' ] + ipv6_dst
++  foreach args : ping_tests_opt
++	args += [ dst ]
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args)
++  endforeach
++endforeach
++
++ping_tests_opt_fail = [
++  [ '-c1.1' ],
++  [ '-I', 'nonexisting' ],
++  [ '-w0.1' ],
++  [ '-w0,1' ],
++]
++foreach dst : [ '127.0.0.1' ] + ipv6_dst
++  foreach args : ping_tests_opt_fail
++	args += [ dst ]
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args, should_fail : true)
++  endforeach
++endforeach
++
++ping_tests_user_fail = [
++  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
++]
++foreach dst : [ '127.0.0.1' ] + ipv6_dst
++  foreach args : ping_tests_user_fail
++	args += [ dst ]
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args, should_fail : not run_as_root)
++  endforeach
++endforeach
diff --git a/meta/recipes-extended/iputils/iputils_20210722.bb b/meta/recipes-extended/iputils/iputils_20210722.bb
index c2a5bf44ea..2e4ff2e826 100644
--- a/meta/recipes-extended/iputils/iputils_20210722.bb
+++ b/meta/recipes-extended/iputils/iputils_20210722.bb
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390">&quot;file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390&quot;</a>
 DEPENDS = &quot;gnutls&quot;
 
 SRC_URI = &quot;git://github.com/iputils/iputils \
-           <a class="moz-txt-link-freetext" href="file://0001-rarpd-rdisc-Drop-PrivateUsers.patch">file://0001-rarpd-rdisc-Drop-PrivateUsers.patch</a> \
-           &quot;
+    <a class="moz-txt-link-freetext" href="file://0001-rarpd-rdisc-Drop-PrivateUsers.patch">file://0001-rarpd-rdisc-Drop-PrivateUsers.patch</a> \
+    <a class="moz-txt-link-freetext" href="file://0001-meson-Make-tests-optional.patch">file://0001-meson-Make-tests-optional.patch</a> \
+&quot;
 SRCREV = &quot;71bb2a6c72e9f658e90ac618c73d873a76bbaa81&quot;
 
 S = &quot;${WORKDIR}/git&quot;
@@ -38,7 +39,8 @@ PACKAGECONFIG[docs] = &quot;-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson systemd update-alternatives
 
-EXTRA_OEMESON += &quot;--prefix=${root_prefix}/&quot;
+# skip tests as they require ip to be installed on host
+EXTRA_OEMESON += &quot;--prefix=${root_prefix}/ -DSKIP_TESTS=true&quot;
 
 ALTERNATIVE_PRIORITY = &quot;100&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------8BB8E3A395A76CB8C69AE061--
