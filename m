Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.1011.1623887981314532155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 16:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hYtmMiyD;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1801ab6b34=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15GNxfNA023285
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 16:59:41 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3972b312mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 16:59:40 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15GNxeke023280
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 16:59:40 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2044.outbound.protection.outlook.com [104.47.73.44])
	by mx0a-0064b401.pphosted.com with ESMTP id 3972b312mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jun 2021 16:59:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZH5/1Vp2/dZr2cFeqKJ1gKIwUmuDp5+6fvGOo1g7ZWIIfmSkn8SAPrGv9O0RQGFqyta7dVbaGyPcFbhEwHzIu/81egUWBPy7N90g/al5dy5MsPEoh0oa/DOY5hmVEWoZSYOFTxpPSZKzc63pvspE1yn50RlAgvBqrSn/QtdRm7c2cx1MLSmkoXP6MKyEWWSmctaqthbXjWMl84DQuYZx4mOfu9Rp9n/wgzbqS92oiSXw28uL3B+rg594M2NID6UkBAcP3LT9z11uPq5vVnDjzuChCH6jy1gdrWfSZtuOydzx2PnPXM+k+QDMZzZyOw0jH4b3LN4VcThR/AdOF9ZaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+7Okqr7pigmh5aliGxXkqAXVCJg/gVAYNZDHXPSji4=;
 b=kp9NZmohTONjPNradhmYuc3DuXfBjxPghPG/+Rob1C9oVscu8etDfU0uj3Oe8toeheUZPtOEMjdbocU1BGvT1EQDShpm4HAiUUhTte+uozI1gIda0xf8BkzZ72fM+X4/WFYhbkPFMlB23BN8XSdCRXqJLw8NnM6wKi90Uvkb2aBTBTNh34hHZYcoDAbSWdkNS9rW36vTGhVzS0D4luJBWWPxqD74rxNwJ1qxU+39Am5g2F012XJXLor0WhvH4Xtpo78+S5zM8BnlUMv/MghBi1d/j0/N9kjdAQaTUHyorQeifppw9wPhpddL8/ac/NVx2qZ++GbrzUZZsGwtkY/3UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+7Okqr7pigmh5aliGxXkqAXVCJg/gVAYNZDHXPSji4=;
 b=hYtmMiyDoEsFrf4oIWbXuqcsUhY6JXMSE3olTrVH04e3HiaEVW+ybFgi25gMTj/LDhlkK9ZS0Fi5tTK91p3hyb+edKAu9Xm52AwRqp03Y+kI+ExqwXczu5RGa8qfUiSCeWvdT/mQPOf3eqAmdXZYWJ+Y5kCMb2sJblE6tAXN1e4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR1101MB2105.namprd11.prod.outlook.com (2603:10b6:4:51::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Wed, 16 Jun
 2021 23:59:37 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579%6]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 23:59:37 +0000
Subject: Re: [OE-core] [PATCH] arch-armv4: Allow -march=armv4 --> remove qemuarmv5.conf ?
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
        Jon Mason <jdmason@kudzu.us>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
References: <20210610021705.3792040-1-raj.khem@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <622b9813-f98f-2e2c-f42f-737a296c0889@windriver.com>
Date: Wed, 16 Jun 2021 19:59:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210610021705.3792040-1-raj.khem@gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR13CA0014.namprd13.prod.outlook.com (2603:10b6:a03:2c0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Wed, 16 Jun 2021 23:59:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64e9a606-dd4b-46bd-970a-08d93122cc1e
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2105:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB2105C58B81121F7C29E9129EF80F9@DM5PR1101MB2105.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NjCNMzLLfzWNv9azCGasnh9troltjWioDHt0Rd8qLvYab4Lec73XRgfFYfVkn6C5Z8Ye2m24i0CxWV8nio6llyRrvia5sKrCcIx4vCzqqxCl23uC6C7wOfSeePuZhj5jQ3nuOaWLB82iasSA7b2Gy1JmSRe1raWscnK/BPzyGgj5SvFCYn6JpjveBHL5o1i69HRDJUIvh2voFEQaFj3RCQI7m3OrezTDda1FV51tjEfzz1ZawARmc1y2mzrsa1BO1v38nfJs9cFRpQtMluIolJbFJ3887mutq/0Viqb2VjnOxxsUdB6XUM8v7R8v30SsNka+4fgc8bfiZCoRhtSuYFvII3SEHV5ba35fqtwJvHodTzn/thOgBcMK1azETHsuJl2zHfOzN4HsVJhD56Bg/LylvGxEdyyNHwtJf0c3E+w3lZfLwF9ALT3H6eQ/CGL151yiHb028kg/EX5zo725aOdSpl8DGGjLD942uKJ352TxZ+4lIMbbVWeqBS7tSejIrsHSDJ4HqU1f5W3KirCPea/3Sx+H0cgzQdEyZ2DeAgq97BRWXSYnFZzgrQIQg0s7FhdfCXOI6yEhwBk+IKmb5QSNdZPuiiqqj2Glz5EyrDcFJ6yrRoSYMu/6HIbUJODa3U2c01n0LOxsihP5VXO92kTUVIhdJETpfOHj3vk6a5s0gUw0+rn/xbx6ohhfOlpzLBfq0huP2UMhguIm90sbk1wrKgC7FUpgGmc8EcUM0lcXBvZkRzmtJUXlqETphBeuKk1RXzYpltemKtWRAxi2gIRgI7lVuVneSL0XysHED65cjkU+b+kKECrPmFmk2ECRAoJr9jJKHG2h3md3wfVO/KKBHyDUk2smUMhZusgk1Kx521v575bvfMsEnxaCxzQO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39840400004)(966005)(6486002)(8936002)(478600001)(38350700002)(38100700002)(83380400001)(53546011)(31696002)(86362001)(26005)(6666004)(36756003)(52116002)(5660300002)(110136005)(2906002)(8676002)(66556008)(956004)(31686004)(2616005)(4326008)(16526019)(316002)(66946007)(186003)(16576012)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cHZDYnF5OWV4Y0lveEV3alhVNTBVN2FzR3FQWUxQNy9jVjhvMW1vdnAyWkdI?=
 =?utf-8?B?TjVQMGNxVVRTajRJYi92NVQxVFRUMEI5cFBIWXo3SjJ2aThhQ2E3TG96N2JB?=
 =?utf-8?B?RFZIbGY2U3JWM1JZTkJGK0NVK2g5UWE4dzM1ajAzUExRVWdwR2FMVXZBcGRO?=
 =?utf-8?B?YmlETzZJU2FsTHVOcjFmQWNGYjhrZWllb0RRNU9kTmJYSEJ6MjFIMHQ0SWJ6?=
 =?utf-8?B?b2o3c0VkcWdOaHZDT0EwR1ZwemxwT2tBYmQxM25GeU9ISG4yNkJNNzRWcGdr?=
 =?utf-8?B?Zlh4M3ZhbjVaVHUyUm9sYytqZDA5Ui9VeVo4TjRsMi9NZFVDa0Z5U1hLSGFD?=
 =?utf-8?B?Y1FwcFRoYVpTRHFrZGtCQVJmSzZERGtpSU1RSGtrQXJ0K3M4Q3JRSVIyWVFv?=
 =?utf-8?B?SDI0OExMVUJXWHVhZlJVVlVMclBJeGFrcFpBTTJnL1E2SUVOR2NvOUZJTEpJ?=
 =?utf-8?B?cFBsNGZzYzlGdEd0dHhOaGluNk1vQzVGeFgzbFVUZHJpWlFwWmF1QUpMZUNZ?=
 =?utf-8?B?dG1FcGdzN25tNTJUeDFGSzJiNUt3THo5dUtXYVIrQ3JuczRHclFIWkpyNi9B?=
 =?utf-8?B?WDJiYno4MUpEeEFhZlR5VVBrYkhVKzZCRndjODE5Mk1GL3I3VHAyWGlrSEF6?=
 =?utf-8?B?eDk5aGp6SE9jMHNEODFWZ3loYko3c2lYZlhQOGwvRHRxVWZjUHhPdm15SWU3?=
 =?utf-8?B?U1JQKzhKRXZ0MFoyTHArbGZ5M0hXbXh3ZWQ3YmVQSEZJRVBxOEZQZUNCdGlm?=
 =?utf-8?B?V1doNFBYY2RlVDFxQkxwenFDUmJzdHgzbm9HZ1g2VFAwTjQxbGNqNXoxaUor?=
 =?utf-8?B?WXo0S2ZSTENxOUErcXIvb3hnWUdWcncrUWZROER2dFRLL0VQU202YkQyaWkz?=
 =?utf-8?B?KytPWnpQSUtyZ0hlRWppN2lxaHNLUEFuRS96STZoTVV6R3QrcEcrZSttdHVi?=
 =?utf-8?B?QXNTVzY2WG5QZVJ1bUJwQ2ozdC81SFBSYnpFVkJUQ0UrcXk3U1FGbzI2NjNO?=
 =?utf-8?B?QVErVkVsY1d0elp2QkdEUFhEYnUrM1R3dU83ekREZVVSSlBDUUJuMUlzVExY?=
 =?utf-8?B?emRaM1BlU09zN1J5dmN6bGJsRTBWVlZxU0tCQXJGdlllNXExRU5NTVk0YlAr?=
 =?utf-8?B?djBzUzFVU1VwK2NsNk1QVnAzQmI1cDlKUDlZemhQcGZPR3lNRWFpY2M0WjBu?=
 =?utf-8?B?Y1FSV2k1U3BBeTVqcWdQS0N3NlhpTFBKTGFwc3ZXeFQ1ZjlVRDRIYXlwNVg5?=
 =?utf-8?B?aCtDSDM1WWxwTE9GK1ZNNEVhQzdmR051RHVSc3E0TWwrdmltQXVJS3BNUDJu?=
 =?utf-8?B?dHZvSEoveSswL2RWZUMrTExyS2o2NHE0Vkp1T2svRy9xSnFXTkpaMkxFVG5w?=
 =?utf-8?B?Rit0and4NnFiM0lGb25rajNaVU0ybTl2aU92N0RhOE5MYWlQVlE4akJtck52?=
 =?utf-8?B?UGthS056SHg4eHZOUGhxdWg0MUtPRTdrRmQ1aW1MeFB6TXVBWXM3R09RWWlx?=
 =?utf-8?B?TUMySGxxYzlheERYZUY4WGljQTBoRk02bjQ4RWFVcmExeWhQTFNNWHJiZmpo?=
 =?utf-8?B?Y1hGT2hIODdnZEhiMG1OSGcrMTVjMHN0cGNwK1lqWERCQS82ak9EUlJYcmI4?=
 =?utf-8?B?YUpvVGxHTUtHQVkwN2lBa0NLQ09zQTJITWZSWkZ6K3B5aGptQkJDaGVXajJQ?=
 =?utf-8?B?bGpQNEk1a2R6ampwQ1o3WWJLN3B3c25oNjlaZ3IrK2VIUnJqeUZmQnJnMHRK?=
 =?utf-8?Q?GXx8hNbVbj+ZEXjokIwfKgKTxG+OvYG1CU8bDTf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e9a606-dd4b-46bd-970a-08d93122cc1e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 23:59:37.4880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGSxNruPJkUAhJ3A460UTC1pnr2esUbzOVspKClqZgN73LFs+W+BtdVxe6PCwdPePlKGS13I9scdegtkicsXHLT01oEYgWWwloOgSmAIMTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2105
X-Proofpoint-GUID: vgBBsO6AW2LBhjdBJ7sKDk0HikxYx3L2
X-Proofpoint-ORIG-GUID: TifDi08FIbpj8KQE0VV7KN87X4t4FiU9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-16_16:2021-06-15,2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160137
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-06-09 10:17 p.m., Khem Raj wrote:
> Even though it is deprecated in GCC 6 [1] it has not yet been
> removed from gcc upstream. We do have active machines in OE
> ecosystem which use armv4 ( SA11xx ) e.g. collie in meta-handheld
> so until upstream gcc takes next step to remove them
> lets support armv4 again, we are still carrying the relevant gcc patch
> to support v4 BX fix.
> 
> [1] https://gcc.gnu.org/gcc-6/changes.html#arm


Huh, I was going to send an email about removing support for qemuarmv5.
Do we follow gcc or drop older arches before that?

Our current list of qemu machines on master is:

meta/conf/machine/qemuarm64.conf
meta/conf/machine/qemuarm.conf
meta/conf/machine/qemuarmv5.conf
meta/conf/machine/qemumips64.conf
meta/conf/machine/qemumips.conf
meta/conf/machine/qemuppc64.conf
meta/conf/machine/qemuppc.conf
meta/conf/machine/qemuriscv32.conf
meta/conf/machine/qemuriscv64.conf
meta/conf/machine/qemux86-64.conf
meta/conf/machine/qemux86.conf


qemuarmv5 was added in:

commit 6fc70eb4f3494bee2be10ee24fe3ea1c8b5ff988
Author: Jon Mason <jdmason@kudzu.us>
Date:   Tue Mar 5 17:32:19 2019

     qemuarm: Swap for an arm7ve (A15) configuration

     Add new QEMU BSP for a Arm Cortex-A15 system and use this as qemuarm,
     moving the old armv5te Versatile PB based machine to qemuarmv5.

     The new machine uses the QEMU virt machine type, which should be
     faster to emulate and updates the qemuarm support to a modern
     architecture.

     Signed-off-by: Jon Mason <jdmason@kudzu.us>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


../Randy

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andrea Adami <andrea.adami@gmail.com>
> ---
>   meta/conf/machine/include/arm/arch-armv4.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
> index fac2bdf952..b71739c20a 100644
> --- a/meta/conf/machine/include/arm/arch-armv4.inc
> +++ b/meta/conf/machine/include/arm/arch-armv4.inc
> @@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv4"
>   
>   TUNEVALID[arm] = "Enable ARM instruction set"
>   TUNEVALID[armv4] = "Enable instructions for ARMv4"
> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4t', '', d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4${ARMPKGSFX_THUMB}', '', d)}"
>   # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
>   # maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does
>   # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
