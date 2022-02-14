Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F16C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 16:24:43 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.51])
 by mx.groups.io with SMTP id smtpd.web12.36365.1644855882307553868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 08:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=ogS2aoJQ;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.51,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXV1rbI1RM2iRNnZUiONsleWJMC4iaKR/KEyNslc2zkrMuOiGmuXNIueWdo20UnFw6+QZbqkatHgzaitXAtyqRWDKuwUyCidV+hWn+9a6mIJdXZGGK4459hiX2b5htQRilvvt13qavmNGBaz8V5CpyoHfO4CsIKDC3vrCst61cnsk01INyQwPtXU6GE45EjWd5IX9opehAU/H9EA2LMjjf+mRF/+YkCd/7ldaiKT3swbBoyRERMst7DsENZpRtugiokO14jh3WZANgcZvRIJ6LHnsDDFm/ICgo4TIcM32WmhGXhiOSuw6gmJKL4+3jvnwRHsfxGzzS3s9LgcmJZkkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TH7WsYUzp1JRjWyQvSXEw8ifiI/b6i4/JmQkXHaucQY=;
 b=KJiYvTt/0SO1TVAgacyjmJ3rdElv77MSOKTmIQADyiOCKzNB63KW9odBwNkhcl0sS3pmQMFSpaojnhhhYCk4DHaE3r5OK9lmKYfI+O89kC0Rtau2f05d+E3vDP4n7bkvsSk2o3NBHmfJtF8bO7Bd4n9QYPe5Oau5Ibpl6AqqNPV9x8t29x9+gF3sULEIDeRl6SS5sIGZX4VbCwBQlHUpGSOfNTXwbKnRI460hU3ySo7ZJ40AfXgrW1HVW6Wmzuo1AlB7ZXGDam9irz36zQwb5sCCKTmURTzlQwXJYiCxLaDSUFTCKM9o/9Wf3wzQjXBc5RWJVWJllATuTN/oIfju4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TH7WsYUzp1JRjWyQvSXEw8ifiI/b6i4/JmQkXHaucQY=;
 b=ogS2aoJQebq9e0XZOlU1/ssqM84ijxPvOAj2AU7apNBbRTJIcn8HEueYhhx+2b6mjGVwsE3Hs6gC3aXfQnQ7U+A+LhQUOPM5HRGy+luKrPUSjXiE97CwlM/eC6701xSVZxAV6cOygV28tJ7kKyKZg1kOmQ8qG2AjHvY0nwmC2Ws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM0PR0402MB3491.eurprd04.prod.outlook.com (2603:10a6:208:20::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 16:24:33 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::b46d:11b:b0d3:3ac]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::b46d:11b:b0d3:3ac%4]) with mapi id 15.20.4975.011; Mon, 14 Feb 2022
 16:24:32 +0000
Message-ID: <07212849-0549-232f-f139-2c561e1828fe@theobroma-systems.com>
Date: Mon, 14 Feb 2022 17:24:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] dev-manual: update example from kernel.bbclass
Content-Language: en-US
To: Christian Eggers <ceggers@arri.de>,
 openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
References: <20220214161732.15475-1-ceggers@arri.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220214161732.15475-1-ceggers@arri.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0137.eurprd07.prod.outlook.com
 (2603:10a6:802:16::24) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edaf7bd7-a164-4f57-771c-08d9efd67baa
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3491:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB349161FE22A05807F8786A1AC2339@AM0PR0402MB3491.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zq0dVxr5H31KD81+u95Dn1ZFDShjMFs4igLYWikvP9kf6d4T5X5sCwqAH2HhUtpo7PH3pKE+yM8TThTkjzA6fVcsjxmB73NMk4apQprwu38snU4WHo4DEU49Y65SIlKu24jpCRzWhxRv63NGrge7rN5Nkx/wxkoOaNqcrWQQyn0g7Ysgey9JKzghhD0aeMWI/VTNE+YDIh6UqmK5ZUCE2ZgUUo/cq2V9rQUsZfGiOmx3ga3IbdvJsyPldFSk2Ays13Frq8xIj1wyK33AtGartoDbuzGr7pyWWM9xUhyqZP96374wYLY5idy2lexopjfFC2xZh7MVw/nJbKuHGH/dPWSxvuQmA+gyacbyFUJ7/ZGLiJccuXrQ13duAvUEihFuDWjuIMNkelW9dQs8+4jLS0DYzGQJC0HA/w5t7cLI1IAbxbkLcZNXeNnVhuRKqie0RrkQPNhsaDiZtWqgud3r30GljjZVXVfLnaSHO0FmdlmkWYyiklZar7YKFbzVkrHDNJ1O8uBVvXVEyOA+Ufy2deJkWdyx+TmhrWgm1Z+x4pjHjj5s/U7+RQcyHXslfTi2vFWJ1Vnje8sjlDst3wHhFWUxCxyTPn/RYIozXyrxQYNoV7F/hgLITUqGqGN0WYrT3/+j3OOBoObIuKUleHKgKy41u5E9cnguU5O8CvS9pOeHv1yQZSnp1I2seSOP0iH0AW7EIXnSRBBeQJYNOl1etxVPqcqT+xIX1Z7C+z5pEfipVEwD3zX4C/obp5eXYZTGuqitTrHgvlr42uija9xhiF22FuR0Tw3N5BYRoy63Feb+06H4F2AWbThm3dJB5C/K
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(44832011)(2906002)(36756003)(15650500001)(5660300002)(31686004)(86362001)(38100700002)(66476007)(66556008)(8936002)(8676002)(83380400001)(31696002)(66946007)(53546011)(6506007)(2616005)(186003)(6512007)(508600001)(966005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckNDcFRrcmJ1NkdScDI3Z1VGayt3NlhhakhDRXRhNllXaTVXMDhHUWdDWmVn?=
 =?utf-8?B?WGZLNDlYOGQ1M2VYbXZYZFREQUNMbnRMVGw2dUo1bSt6Z2RVTWtvR2w2Vjlr?=
 =?utf-8?B?VktsMFBPaW5SWEg4Qm9pT1JJeHlycnRvaGFUSWU1QXlWMFQzb1VIMFJEb1do?=
 =?utf-8?B?dCt0a0xoaitNdS9MRHVnQnRTVW16VDNGYnlXTncwSHhIODJYK2syTkNZeWVJ?=
 =?utf-8?B?WFkzWjlNbHk0cURQNDhTcXdmL0tRaWxJNGhkR0hZYVZKekNpdmZ1emtyZXk5?=
 =?utf-8?B?V0wrTHYxQkVzNkFHNlpqT2FJVnkzOEhQSkFIRDhUVFRST2ZHRTViMWtMM0k5?=
 =?utf-8?B?T0Q3ODFxVjdqVGtweCtzejNkZlNNVWg2UEU2OVpmdFRHb0poS2hpYmRtWnVI?=
 =?utf-8?B?RHNoa3dmaS9YSzg3THhrWjlEMzFtUFJqUTlyM3BIWXBqak9VOUllVG5NRDdC?=
 =?utf-8?B?N3VUMHpPdTI1dTBEVFdmbGg0Z0VIMGRKVHpIRnZQSTMyTk8zWHdwYmFuUktx?=
 =?utf-8?B?KzZNRXdneC9qTUFrVmg5UWIza3hkcEIwdTR5NW8xY0o3b0VneWNNcnlkS2dF?=
 =?utf-8?B?amtNL0NJM2tQV3JVcFdWbURicjNyL2dRVUtMdUh4WEZwTlRjU3UrbGlNTVJ2?=
 =?utf-8?B?M3d0Zmk3VnI5QlM0L0pFY1Zqb25FYlp2RVE1T3ZDU2ZOdnhrTFNRREs5ZkFy?=
 =?utf-8?B?TEVrdFBBSFpEZnZ4QTZpdTVxSFNReU5oMEduN3NVckRrR3E0SnhkRncwb1d3?=
 =?utf-8?B?Umg5VXQ2N1JHTGM5RjI5VVgyUmY4amQxemZkdzhnb1VTU0Y2Q2VuK2pzS0N0?=
 =?utf-8?B?eGJDOXZtT2tKWm1SbDRLdkhIUFo0ZDhzWGVxWEQ0bXVRcklEVS80MUNLdkJR?=
 =?utf-8?B?aXVZYkEzZEJyZzJ3NUJYcXBDZUEvYTIzaElVVVM0dVdTQWZsNW1Wa3dNWFlE?=
 =?utf-8?B?T2FoaFlPdnFYdXJMcnh1OWRxR20zaEhCWSs3MENYRElWVS9Sc3VuZWxYSmpN?=
 =?utf-8?B?ekNLWG9zMmUvaDdLREpWWHVXbVRYOVdLK2oybG9NZ0lvaUwyemp4aGNJNy9I?=
 =?utf-8?B?UzFkV1YwMVJEWi9DNnBNRWpKTm1Jeis1dHZWais2ZVVDUDE3bS9nUDIzUk0z?=
 =?utf-8?B?OFdHT0FTWWQxT0M4T3REYVNGRm5NenZHSjdXRFZaSTJNL0YrUjAvdE13cjZM?=
 =?utf-8?B?d1lkRkZ2V3RxRW8vVVRnMlFvVElsN0xPUFB5ZUtmTHhGNm53NmY1NWVHZFVs?=
 =?utf-8?B?MmJyZlFKRGJoeXZVd0svQ1hQYjFmbTl0R29YdzFDMmZKQ1lRMU5oQitPYVZB?=
 =?utf-8?B?M1V3ZVdnQ09PaGlyYjJpNWs4bjRPekJBRjIrYzV5Wjh0N29raStFenBsQnZj?=
 =?utf-8?B?SW94YWFKbElUT1JBRndnc2JRNTdCcGxtaTVKa3dvTDUyUzdvY2FiTDNkaG5q?=
 =?utf-8?B?UGJteEJSTngzRXlGa3RNTU1EREdsNVBTcWpjSDhZSE96cmcvODk5aEVQcEpv?=
 =?utf-8?B?d3Q2NmxCekdsRjRiRlRTb0NrcWpTcnVMTENldDFNcXBRWGVPQi9PZDhhUUR2?=
 =?utf-8?B?YisvQkZWd1psMndHemtXamxqY2Y4VkNhTVI0OUxiZWxqam53M2xXZkcwUTAz?=
 =?utf-8?B?UjBDekZUMk5xN2ltZkNlS1Erem5qTm91N245anN4aXdYWnBWaWVuSWNmVHdh?=
 =?utf-8?B?S3pNZFdqVUZMVjBKdmlrZTdwdXI4K1lFd1lRU0dvY21pTGEvTmFtQ1MzeHZP?=
 =?utf-8?B?ajlUY25uMjFLdnZJYmtrYUFoeDE2Qk1hMXRhTE4zdXRUZ014eXNCQXIrMDQz?=
 =?utf-8?B?WjYyemwzcS95dXBPTmEwV25FMGJocHNJM280SFFVZzVndmszMUtOcC9Fc2lS?=
 =?utf-8?B?cjJnaEppaHZHY2ErYjh5eS9aaXd6djM2YmpxR2NqakxEU0FXTVlDMXhVYXAr?=
 =?utf-8?B?SjRJd3BjRFRQNlRHZWE2MHFZRG1mMDI3YzNxSEtlb0RtbHVDYjhlRlVqd2cx?=
 =?utf-8?B?NnFkdDY3YUM2VDhyMkcrU3dvQ0g0K0ZLcU1vVDk3NndINHFtbWN0aGN1dUZU?=
 =?utf-8?B?aFBFLzNpaDFONFR0a3QyOFU4OFlQQ3ZkVnVCWTBnRCtYZmlXTXBlak9IYkw0?=
 =?utf-8?B?UnFTTFowYXk0UzBabXBiNG5EL1NycUx3WWhQT3U4VmIrOUF6NHZwK1lLK3dD?=
 =?utf-8?B?c3hUMDZNV0VCdlp1NlowWHR4ZGNJa25oaDFNd0ZxWFo3N2d2R2dVMmNiaTNj?=
 =?utf-8?B?eG9IWXZDY2dRSG94OENUdk13WnJiOWdvWEdnZU9ZZHpiWUtaRUhGRm5tY3Fl?=
 =?utf-8?B?WU1RWVB6SWdBZWRkWCtLczdaWjdUZEFZd3dibmtpa0dhTVRXVnBtemJVMlNy?=
 =?utf-8?Q?e8AjvzXchHXtzzZE=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 edaf7bd7-a164-4f57-771c-08d9efd67baa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 16:24:32.8476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EL5zBdgYKPzAp3+0MKapn2QA0K9S/mbaW6PU2xK6j48oNzzfoEPycC5SDhVEjwnsGMLIPqsCghUMhZtLFTdHKpCDgiZu8W/KHeaWx9tETKuUcoHuzUvKClPQBpBrdvuU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3491
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 16:24:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161723

Hi Christian,

On 2/14/22 17:17, Christian Eggers wrote:
> Since f7485646534e ("kernel: provide virtual/kernel for all kernels"),
> all recipes which inherit kernel.bbclass provide "virtual/kernel",
> independent of the value of `KERNEL_PACKAGE_NAME`.
> 
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>   documentation/dev-manual/common-tasks.rst | 2 +-

Documentation patches have a different mailing list:
docs@lists.yoctoproject.org

I've added it to the Cc recipients now so there's probably no need to 
resend this patch :)

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin

>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index d35b590ee185..1856d4c3ad53 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -2114,7 +2114,7 @@ statement that essentially identifies itself as being able to provide
>   ``virtual/kernel``. Here is one way through the
>   :ref:`kernel <ref-classes-kernel>` class::
>   
> -   PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
> +   PROVIDES += "virtual/kernel"
>   
>   Any recipe that inherits the :ref:`kernel <ref-classes-kernel>` class is
>   going to utilize a :term:`PROVIDES` statement that identifies that recipe as
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161720): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_message_161720&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=salAEUm68GxBGyubcIEZm7DlS2JuU299YHtwFVvdku4TXcRTz7k6L98QiNORDzyn&s=yb7bX1jX1xE8QIx_Y-4hA2wxpHIzvQ-R0z7PhOjKg0U&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_89139800_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=salAEUm68GxBGyubcIEZm7DlS2JuU299YHtwFVvdku4TXcRTz7k6L98QiNORDzyn&s=rqOLvOISOuPJeW8U1uMkNgMKxm2zqe0rVzTY65ZS8tQ&e=
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=salAEUm68GxBGyubcIEZm7DlS2JuU299YHtwFVvdku4TXcRTz7k6L98QiNORDzyn&s=hHHCrO6CSCWViAWJPJVnjLNTDeJOH1UeVVwObe-282Y&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

