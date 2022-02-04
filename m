Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE3BC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:12:27 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.82])
 by mx.groups.io with SMTP id smtpd.web09.11752.1643994745043250028
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=sO+TfhAC;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.82,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDRrlDTKUPnVVt5XjsGDssHkYTcrOgvcyHgZCxg3Rf7qa0X6PeAtYQfHhVLOsly+g2DpB5u7o8eSbD0fdBG1+MrDdA5VQSlV96djGP+frzEp0L54nxN3t+azPYHm96O5VlkUkwY3p9rR6RMU/XT2i+U5HkEtmK38g4ZmvKqDNzE6cYOVvJblLIO15MZVOdSqkfg4nrB/dw0e/XwXzJ8Rx9rgpz/PJcj2/RIWOTnMMEVQYeFA6TBxpFI8z2+l2vnFouzL+fAEKGiFORQRVt7wQ6Jw1hiy8BBCyE2Lw8/ejI7pDAXUC/5JOaHgONwNBTV3eami8CqejRhZamLGXfI4IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jPFVlfEoVzgw6izbr4XF1AlNC2grAJZG5Sop5YwT04=;
 b=UFA9eKUwjMcgU8cSD1YcKt6P1jLuLxiIuKS6EiWNeKlExXGUr/SoPPCUaBmwqk9+ct6fkkVz2+ga613zxqfqdQMtydS/xdIfazNwADw3QXQOEo6yhPa/Bnx1S3/A/vUs1wHAuWbZW3puj++2dsXBLOGwxBQBvCDlBi9XuKSrKlRigsIfJwnMILdKMrr8Rj5ePDp3h3k1jLqvApcThFfWNN60EnfKifO+DYNoWqM+YsnUd36N7j1M4r1v2HkB35VetlG58oHCAS48rTOM1jwbgxwKgFHJbs5zX/Im5HP/u/tvpXrEKp0LnFOSEo/H0uVI1QHWAQCvwrY5un/7ZCkLtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jPFVlfEoVzgw6izbr4XF1AlNC2grAJZG5Sop5YwT04=;
 b=sO+TfhAC856HHtjvN6At64ieazctW/5Q1CmRgKOykTM1OVq6MFqUVgQa+z6/CHCDOn0xd/5sFfn7k6vFagKmLODbzO0P0s6Ly8U820Vazxq2FN0UVY4VlTT8cVGfB3JYJuEDM+hPRJydLd+Rg8l9kXEXVdYoy5VItD1ygcmY+H8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DB9PR04MB9378.eurprd04.prod.outlook.com (2603:10a6:10:36a::6)
 by AM0PR04MB5364.eurprd04.prod.outlook.com (2603:10a6:208:11f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 17:12:21 +0000
Received: from DB9PR04MB9378.eurprd04.prod.outlook.com
 ([fe80::c540:31f6:c27f:c6a1]) by DB9PR04MB9378.eurprd04.prod.outlook.com
 ([fe80::c540:31f6:c27f:c6a1%4]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 17:12:21 +0000
Message-ID: <c62ba420-dbfb-ae82-da73-a583d3502099@theobroma-systems.com>
Date: Fri, 4 Feb 2022 18:12:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 5/5] documentation: Update for skip_recipe
 rename
Content-Language: en-US
To: Saul Wold <Saul.Wold@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20220204170144.105536-1-saul.wold@windriver.com>
 <20220204170144.105536-6-saul.wold@windriver.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220204170144.105536-6-saul.wold@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P18901CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::13) To DB9PR04MB9378.eurprd04.prod.outlook.com
 (2603:10a6:10:36a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 035119b2-be14-43cf-54bf-08d9e8018116
X-MS-TrafficTypeDiagnostic: AM0PR04MB5364:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB536424DE032F89B78CBF93F3C2299@AM0PR04MB5364.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	afcuSqdk+zmW4NdCkDcOnlCRysDJVAqjTj6DgI0ScSbk2fdt9bTeboNVZkT+7m/Dzt7LGz4BfJJZC7fKccyysFiJNl18ybOeQD+cMVHyyAlEqG4wuYPCZsmbG60ah88PUqjMZdloLdhaUp+1CmDtgUMoZ6DJ+OGN7K1tKPBz252ZJMfMmsek2pRg8bcUFl64nnxxVCWZU552JvZEw/6qAyy/457LAbABkID0H6iqRwNM85/6jQ9b5hqx1CmwkmOE5QqYCSq/kMLodgTFudso3RFdRvDQzEM2QkKrV1W1T2IGcqlDUd9qGgEfSx45RFxkS4c+EknUCf3uqgOq9l4Svb5vQtDGNesv3NUgRr4sOBzPNZBk2t75tlNb1Bkr6jsgrcyqhmZWG/gIt2OOgMqfS2rw2a1QSynJofFb+Nf5t4fhP9JG3nRf1MLyohAA1MNUmk+i2QkGXP8jHEcYYyB9PPqv07P81NVBgMkuUuBo/tBPQQc8GPRevUbxb7ZfdL3JqWEHhsM4wCLGiq5E/7NQF+DVtPQqj6E+Kq7g/MVLkp44mr/LU3EIUTsPUrwMaMJeqS85+Lj0lQnta2IOw7Sby55rKrhrBxzwR8H1OR/To4b75mzJzrp2mXZgNGXXZFRFw7rXZ9gAgdtpkkHDmtNloPqUry/HnA8JrwVaSmbkfEmXXZXgpH2DoULjygF5dmYg2C85pXhYfPC2iTiL3I//5l2v6CjPGkGECbui7l81ZIf/eFkoLu2xlWE2EdAb8zmON0gC6kgybvJ16kn7OT/yR5F1V112WPJTWK3CQkrHxxrxpX9FikesNgUKsY9NYRgm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9378.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(8676002)(5660300002)(66946007)(83380400001)(31686004)(44832011)(316002)(8936002)(86362001)(66556008)(508600001)(2616005)(966005)(6486002)(31696002)(6512007)(66476007)(15650500001)(36756003)(186003)(6506007)(53546011)(6666004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2RwQmhlbnQ5MUpJa1ZBNUpKT1dqT1JWV1RJTGthOG1IQlM3dmljUHNPSWp0?=
 =?utf-8?B?amxGeGlybTY2UGx0TnowUW1VbENyaisyOTUrUW1mTis5bjd0R2pVMm9rUVgy?=
 =?utf-8?B?STlkS09JTkkydXF6c2o2cUg2WlZBcndsZUVVVkltUjRZaE9EN1g0NGo2VWpp?=
 =?utf-8?B?eEcyOFBrVHQ2MXVKcGo3QlpvbXJuMm43TFQ0b1lPKzlqWkZoc2NWVnN6empK?=
 =?utf-8?B?eE9LREdYbUw4eXhhdmp1RTRyd01KM3Z1RkNMUlczeXZNTm5HaUREQlBJb1Nl?=
 =?utf-8?B?dnN6L3IyTGcxQjVZQ0xTL3JKSTJlK0RZaVg4SVVuWkljS01UUGV4VCtzV1li?=
 =?utf-8?B?cmgzZzJpWnBaNHAzVGV0TGFaTXYvNHF4Z0NJUHFuQ3UvWU9FY2V2N1g4Snpu?=
 =?utf-8?B?YzQyNC9yNzg2MkNzWmQ4b040akgzSmJhbE5MU0NWQ1N4d29sWnhWcUVUVDRw?=
 =?utf-8?B?b3YwWVlLOVFhL1FMUFQwZkNGSGlrRjBGSnQ2dGhjTURlNW5PSlJWVHFKamZa?=
 =?utf-8?B?bU9DZ3ZadDBXRHJuWDIvekRRdFpWNUFtNHYrdWtzUEt3WG9HZlVzT0d4T0tn?=
 =?utf-8?B?MS9WblM4dVkrU0c3akpmbS9xTHJXVDhtRGQvc3VKdUlBWVhsTXhxcXVvcjc1?=
 =?utf-8?B?eDFObXd3YkVVa2d6RTl3NzFuQWR5RUlWM0xJWnJNVGJMbkFjUDg4V3lqL084?=
 =?utf-8?B?Tm94YUhRb1J5M0M2azN2aDFMcVRsaUVLcW02TDRWSXBJYjVGMTRzYmxYWTh5?=
 =?utf-8?B?OXZvbzZ5b1dDbUVoRy82NEdsRFQrUjNvK2tnbDh4eGkyTWNyR0g4RURHRU9W?=
 =?utf-8?B?b0QvdXBDczVjS1RQQUh3TkFvN1lGRVRnK3c4YTU4VUlSZUxUcDQ3c05HUVd4?=
 =?utf-8?B?L2R4cGFaMjFVcmJuM2hWUWZRV1hOZStNeVRSazdhM1FmekZsaXNhV0dtUkZS?=
 =?utf-8?B?QW1kWkZaUXloTExpL2Q2WktrTG1Xb21DREEwY3phZ2QxVkwrRnlCa29ndVFx?=
 =?utf-8?B?c2VLb0VLQnliOUF5YkdJUEFiWlpjVTJqV0Y2SmI1eE5mZEtJVDFLVDE0aWtq?=
 =?utf-8?B?emZTUkl3RnZEZmR5aDNBSzY4ZnF2VTZEdEpnRmFHc0t3SFdSTU02V2NnMk1j?=
 =?utf-8?B?cmg2U2VYd2RzYXpUUEJqNEt5NmQySmc4azE5SHZMc1Q2ZW80RlFvSHNGOGdt?=
 =?utf-8?B?ZzBDbUVYQWZjNUhRSm1talJ4SlBhQjlCNlQrZGh1OGJicGVwSlp4U0JPYTNH?=
 =?utf-8?B?WWFyZE15Z3ZxWHozTFRlNUIxakF4b3NSRktKVlVZQWRGQTYzeXZMN21EbWhL?=
 =?utf-8?B?WUJ3YjRqUUw0Rm82bytZdms3bUhpM29vaXVuTVdvQUxDMk9sbk5EWVd6ZzBV?=
 =?utf-8?B?cFpOekV3TlpmVVZmbU1KZHVhSnhFRnhJTFFBdk9HRlhSYkh2VDM1YkFqUjFE?=
 =?utf-8?B?VGJWMG5vc0dpZUZpNlR0ZkZ1RkFrUmVVdjYwMkpsNkRKdVJGMnhma21TQi9O?=
 =?utf-8?B?Y3dwNVNoUnBGUGE2OUdRRmN5SzBJK05GaDVQUXBveUpMZksrTGllRGNMSWtS?=
 =?utf-8?B?WVZVa0JWR0wwNk9wWkdxSVV6MkVtNjh6bGd1VXlUblBmdEJROFd5RFhaVTJj?=
 =?utf-8?B?TUIxaStTM2g0VmtCeFZqbU94d1dCV0pYZ3NkRExqL2pLY282WG5yRXA2dFdR?=
 =?utf-8?B?R2ZWdDNmdnNaS09ISVh4OStFbEpETDVFODBveXVEcmxJdzNRYllsVm1tNFY4?=
 =?utf-8?B?U01OYitnOE9HdTNhYmE5VG1ySHgxOExlTFA2SE1oVUlxcVUxNFlMbU9WQy82?=
 =?utf-8?B?NUdSb3JhR1d6YTlOZW5aT00vM3hWcVdmaVVVMSsxVElxdGhqbEorTkg3d292?=
 =?utf-8?B?dncxK0N4YzVaVWxyd1JaQXlGWS84Q3lNR0xXUk1LN2NzTzkvTVlhS3FzUEds?=
 =?utf-8?B?aXZwYmFGam1TaUlKVTNvVVRkOWJYMC9xVzcyQU0xcHdCT1N3K2U1Vm03Nlho?=
 =?utf-8?B?QmNGTjFqMGRzODFnT3dZMmpTY09sS0hYdHdQMjVkaHl2eXl1SFB6NnlpSUVC?=
 =?utf-8?B?SUtJUUFEVUhuTEVCcnowdm9yOURyeC9Takh2VXc5clE4UzYwbFV5YkZxdEE1?=
 =?utf-8?B?SXNIMGtEWHZoVTcwYjk4WHdnU0ErR1pxS1JqWWhUZkQremkvQmZidStzd2ZG?=
 =?utf-8?B?NDFnZ0M1ckJBYUJYN0l2dzFGVUpWalRrSU9rbEt1WnhPUzgvN3FOcVZZNmpQ?=
 =?utf-8?B?Y09ZeCtkcm5ORjFNOGVsYmZmcUE4U1p4VTk5N2ZLQXAxZWUwa3pxdm83cVVM?=
 =?utf-8?B?c0d3TlJHNnBlakg5cnhGL0N0aUkrTTd4d29UK0J0ZzQyWG4rRys1VDlWelRa?=
 =?utf-8?Q?Ni9c4ukL6Rafck6E=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 035119b2-be14-43cf-54bf-08d9e8018116
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9378.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 17:12:21.1408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1IGp/subTPSHwxGh1+Dqz7o8IoTLM1Y7nRtCc6Xth/OFgPCv8nW8aL57ijbnR1O/3xo7oysUuVrOYwWcjtyO7Ehhig+LKkcI6c1owoOG4rQXHjs52z6PY5+F8bn6VIcS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5364
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 17:12:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161374

Hi Saul,

On 2/4/22 18:01, Saul Wold wrote:
> This change better aligns the name of the variable with it's
> purpose. Since we removed the odler class, the associated
> documentation is also removed.
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>   meta/conf/documentation.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 6b50ad08a8b..9614448a1fe 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -331,7 +331,6 @@ PKGDATA_DIR[doc] = "Points to a shared, global-state directory that holds data g
>   PKGDEST[doc] = "Points to the parent directory for files to be packaged after they have been split into individual packages."
>   PKGDESTWORK[doc] = "Points to a temporary work area used by the do_package task to write output from the do_packagedata task."
>   PN[doc] = "PN refers to a recipe name in the context of a file used by the OpenEmbedded build system as input to create a package. It refers to a package name in the context of a file created or produced by the OpenEmbedded build system."
> -PNBLACKLIST[doc] = "Lists recipes you do not want the OpenEmbedded build system to build."
>   PR[doc] = "The revision of the recipe. The default value for this variable is 'r0'."
>   PREFERRED_PROVIDER[doc] = "If multiple recipes provide an item, this variable determines which recipe should be given preference."
>   PREFERRED_VERSION[doc] = "If there are multiple versions of recipes available, this variable determines which recipe should be given preference."
> @@ -385,6 +384,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that shoul
>   SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
>   SITEINFO_BITS[doc] = "Specifies the number of bits for the target system CPU."
>   SITEINFO_ENDIANNESS[doc] = "Specifies the endian byte order of the target system. The value should be either 'le' for 'little-endian' or 'be' for 'big-endian'."
> +SKIP_RECIPE[doc] = "Lists recipes you do not want the OpenEmbedded build system to build."

Mmm with this sentence I would basically try to use it this way:

SKIP_RECIPE += "libndf"

instead of SKIP_RECIPE[libdnf] = "message to be printed"

I think we can do better :)

Maybe add something like "e.g. SKIP_RECIPE[my-recipe] = "This is the 
reason for skipping this recipe""  at the end of the sentence?

Also, can you add some words in 
documentation/migration-guides/migration-3.5.rst in yocto-docs to 
explain this migration so we don't forget about it before the release :) ?

Thanks!
Cheers,
Quentin

>   SOC_FAMILY[doc] = "Groups together machines based upon the same family of SOC (System On Chip). You typically set this variable in a common .inc file that you include in the configuration files of all the machines."
>   SOLIBS[doc] = "Defines the suffix for shared libraries used on the target platform."
>   SOLIBSDEV[doc] = "Defines the suffix for the development symbolic link (symlink) for shared libraries on the target platform."
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161370): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_message_161370&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=uiHZKRqLMObgXqpXUwRFi8y7UtEaiVhDs8cQdPQk0Tdl2K_q3sYbssh1fwYeBTYV&s=dbpnhNdhY-cK8zLxdt9j35m75kaNaiam5c8Uj8YG66E&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_88911226_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=uiHZKRqLMObgXqpXUwRFi8y7UtEaiVhDs8cQdPQk0Tdl2K_q3sYbssh1fwYeBTYV&s=N3WJTb7jcA-mNcna2UbtcBfV9fXbBYnRGcDLzvyL3sE&e=
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=uiHZKRqLMObgXqpXUwRFi8y7UtEaiVhDs8cQdPQk0Tdl2K_q3sYbssh1fwYeBTYV&s=nXnfk2h1SI1tLsRNpDucivTBifk_qM77Ldm0sTsIKQw&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

