Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.85])
 by mx.groups.io with SMTP id smtpd.web12.2560.1614025119401988878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 12:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NSyVfsml;
 spf=pass (domain: windriver.com, ip: 40.107.93.85, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiYTFO2JQ7tbc13QCzfvlLr0YBW1CeymKULL9oQne1OQibpNk6BNjbokB7EhQXkixeYUBmaaU/mBtP/lTu1TYj6s6PmU9qeo0CFvojj6EBUF75aMcjov8jSLrYgVe67O1BMEA68j06pfDUAwm5UQzJCXhbpLYGU0FuONwXfezAEYB8llL56b/SDoThu3fVTNiofAehtyNkXt22reFxVeg8ByBGGkBlRogr4XkqgBkCFt3dVTQxNkBmzA4a0XgaDDytVHVa0fVcDQnhXvJrYqhASjoJd3mvunC2YVCAulJnfGgxSjAXqMgWYblhCkx7+2SxiGxK9KdXKY5VOROZ3dvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f7HQtSpSMQ5BEODmqXAyq3/y783Dgw9hBrjLtThwjc=;
 b=NE7VDVb+XO5p8Ny7e4AqInlLGLJz3nhEOyiUxIkN/xQWRDCrneqSMjrXeR1aXu8jYrKUpzXFM8IpMwwD9V1VirVbUcFzUcK61Ko8RJ9JMCY1QMOP3A4mzTluOr1MmYLHuE2D6yL+w0EZOkxNKJmVTaVBNpODCCDb9lbJ+CU4/WKSOlMxLys0lk34YRU/yQglLDhQu/pQKXWaUhKPahzc75cDCGHprCxMG/i3mveAxrRsHJWd39avtee+mcTJmWesCyPNSTnHX3po0zFE/56p2TVErc8XKVRt9Yob3ovh74MPEyAVOdebd+TOOwInm2pkrXGnJZVdShq7mdF5DqNqyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f7HQtSpSMQ5BEODmqXAyq3/y783Dgw9hBrjLtThwjc=;
 b=NSyVfsmlhEyB4hqWiMgrmVAku8VsexoL6z7aGE2xwZ9F6UVrEV12uZ29yha9cu3QOPtnpXcp0Zy8knbdps9VyUblwig86ryQRlqZsP6SIAzgC6is4/HmFdDGMKGaSVyEhDbpD2T/YyFNDtyGoGGFfquObklIUZAXAUyQZvMz5TU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB0028.namprd11.prod.outlook.com (2603:10b6:4:67::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Mon, 22 Feb
 2021 20:18:36 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3868.030; Mon, 22 Feb 2021
 20:18:36 +0000
Subject: Re: [OE-core] [PATCH] go: Update to 1.15.8
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210214084905.3353606-1-raj.khem@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <54bd9d57-d197-7a67-6793-8b0800715362@windriver.com>
Date: Mon, 22 Feb 2021 15:18:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210214084905.3353606-1-raj.khem@gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0069.namprd03.prod.outlook.com (2603:10b6:a03:331::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 20:18:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 764753af-d459-49d1-f0bf-08d8d76f088a
X-MS-TrafficTypeDiagnostic: DM5PR11MB0028:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB00280F3392C2E2941516D2B7F8819@DM5PR11MB0028.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:370;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sieFsNSvaY32mKL2+YqEt85yVoHh8Em7wgn7eogJP4ADfKBGHwPqq0wpLlMWC3sYYu0sv/G7zwhC9HzeNd/PxJSn1IpziTVyGNEXrcLois6UaGk4HUMkKldm6EbZ9KZCq8oktwCga6AhIQvQ7omKcFbE0CsQI0vBD6MXaiwacluR/raNowFfuRIp/uOA3oF98FmjWBaO+fOWDT1Wi83bSFxwbOJkCwm7TT13G+hcLBT8pLZQNE4etcj4GlryZv7WaNTxj4hYRjfs2NFCoSezubPQxKoRn1/n7MnE/76YyYyeUxDTrjU3hL3ZEOJufux45Rd9Oj14VHar2TblTgM/mUgTX3B1H/ulwKjcg8WjEeg3mtCT4nbyTdYG2YJFxeJSDFhChsvhjA/dwRgtcYFczKfd2iXUVQKgffQLlIOq507eeu/bzpPt7WwSQXpO98TjZ6w8jSJJOtCS4wQDI4yCz/xhnUD/zPhXxtCaJbBoAqr7SkQ7ek23g1m8Vq4ZkfYkYLVnuCN8UVzC59tpnxjd79ii4WCJtz5lCL20LyrkluCb3HTOh7FDC9LrJPCgC+U+lt0wHaeJgFbF7J0a2zFmBhi4tAtfvbP29BGPBxuYFeqb+OMK4oSaCf+JEp23CgjP2wQanu30nR5X93Q703rQw6RFf2/Zl5jvPPSe2jRPyXfC4lxl7JUl4a9wk0FhZ5Hr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(478600001)(956004)(83380400001)(52116002)(2616005)(36756003)(6486002)(53546011)(2906002)(6666004)(31696002)(16576012)(8936002)(15650500001)(66946007)(5660300002)(966005)(26005)(16526019)(31686004)(316002)(66476007)(66556008)(186003)(86362001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZnlLRE5HSms0blF2eUxPaUdJTzk5L296eVo3K242NHMxaWplMDZHdGVkRzlI?=
 =?utf-8?B?YzE0blp1dllqZTUrQit6WTYrR3Y2bk9WczJpVTlNc000dnQ3ZGNyYnVyaTA4?=
 =?utf-8?B?eFNLbDlURjNSb0FmcCtubjBIT2NoYWhyeHJsSXJiakkxVDlUdnR4WFlacGRr?=
 =?utf-8?B?ODFRU1lQMkZ4TzROZThwSENhakd3aHp6dVVRU2lLQVMrUjFuTDYwU0ZjNUtp?=
 =?utf-8?B?OVk5NHBLSVVNRlN4WmlJdnBqZFN1QlF2Rk9hY25jRXBXdG56QWJFQVNXajRY?=
 =?utf-8?B?SW9UTDhiM3F3NTVveTMvajI4eVhkSU5Lb1cwdFg1MWx5U0U5RlprZFlhc0dk?=
 =?utf-8?B?dVZheEU1NmFGaGl4eUE3U1l4UTdRenpoYklZSUNTQUxTcDMwcDVCMXBIYkQ4?=
 =?utf-8?B?aExNWFNTUWlsalNENUZ5QjRMZnBma3JXZE5heUtxVmRsaVNVNnZnQUFIODl6?=
 =?utf-8?B?ek1LNTJlcmtzcm80dE1FRFJTUWg4OWdvTHpITFZVekpVYnBuYldvZTd0aDFa?=
 =?utf-8?B?SVgyMUhCcmt6OTNYL3l1SlN6amtYZE5FTUNObTd5MEtMUTg4KzVlYU1vQnJ5?=
 =?utf-8?B?cVp1VS9yTDA4OUh0QXdHbjVWZE8rSTJQdlNFR1I0ZGxzMjRhZ0ZMV09waFNu?=
 =?utf-8?B?Zkp2a2VXMThielI5NnFhVWMwWXhobE1QY0tSREZ0NTlmYTlpVWcwazh3K0Ew?=
 =?utf-8?B?QVNMbXpzbStDTkFSMXZ4bk5ZYVREQU1uSE1Mc2I5ejloTXRBZENYeWc5eDZK?=
 =?utf-8?B?MUVhNGJHM1hRSjNGRHlsV0JjNG9MUkJqdkpJRFhrbmlSZ1VxeUFJRngvUHZ4?=
 =?utf-8?B?S3ovZ2w5WHhXVjFqSlF6Ujk2MkViRk55Qm8zWmcyRmE2aU14bW9TbGZ3ZjB2?=
 =?utf-8?B?aGNlTGNncXNKOXRJenF3WVloSTU3dGV6cW1hSEViVHhKZGgweVBhaHFib01r?=
 =?utf-8?B?UkFDSnV2MkRBR3pwZlJZZ1dQOTdRK0N2TS9QUjZtV3h3UTNyWkxLWnNKenQv?=
 =?utf-8?B?QkVMVW01eTEzWXJ6cWhVdFBhVjVrYzNjZlB2V2FRckxCbkVVNWxiOTZYSHZU?=
 =?utf-8?B?bUIraVBRcFRKcnkyV1d4ZFlzTHlIblBKR3phNlJubG85ODAwd0Z0Qi80Tmkv?=
 =?utf-8?B?RTBDNEROYlJGOU5ZYkhCRWN6ZVczcVlsN0MrZkNlbWRGTmFOeW9ndWJFWnFF?=
 =?utf-8?B?U28rTVVxdkFNMkNYQTJXOGs4UVVaUzV4UW1qMmluaHNMck5CUWZoTGpCdkhS?=
 =?utf-8?B?OGQwTjBMSW1XekI0NjhRZzJjYlN1Z2pnZThTTWJJdlZ4dUM5M2xUNnZyVHpE?=
 =?utf-8?B?UDl3WnNFYlpJMmU5VitPMFFLVE1ZenFaZE1WYjN0THlTR1dkL1lxb1Nyazc3?=
 =?utf-8?B?ZTNEancwS3VocDVSanpHaVphVlR4SXcrMzlBSFNEbHl3Tnl6R3loQ1doWExU?=
 =?utf-8?B?VkdGUVhZMGVJcHlJOUQ5U3ljUXlpSmg2c1NCc3U1MEdTUzhtUUVZbWlYck5I?=
 =?utf-8?B?WmxUM3cvd0hpUm95RkNROXhPUHFIOVpCSWZFVmxybkdwdUp2dUF1RnZWNk5y?=
 =?utf-8?B?dHExYjFRVnhBc2ErcTIzekNCQ0l6SVN1T3QyYWJRWERzU3ROLytJZFF4dndu?=
 =?utf-8?B?elhOYWFvOFRIS1dVM0lYZmVia0EvaDA2S2dJRjdnQVMvZUN1WVIvMzB2VjBq?=
 =?utf-8?B?NWZZSTdmZ0hjdE9XV1B2d0V6NEtRZ3I3WGJ1Z09LNUpyNFJmUjBkUjZ2Q1VE?=
 =?utf-8?Q?mr6E9Z4G6nUI6RxSYRwGT9alGBaC77fClcDrjEW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764753af-d459-49d1-f0bf-08d8d76f088a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 20:18:35.9249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oX6dOoj6rIxz4SGHBPWG8kXeHtPdjlxsnZRFwetcfPZkxbRe/sat/OtCArXgXwvMiOrwoe3wHBJkOL2OycFWF8GbzwrJFoZ5QbfAs/7mivo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0028
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-02-14 3:49 a.m., Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/go/go-1.15.inc                          | 4 ++--
>   ...{go-binary-native_1.15.6.bb => go-binary-native_1.15.8.bb} | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-devtools/go/{go-binary-native_1.15.6.bb => go-binary-native_1.15.8.bb} (83%)
> 
> diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
> index abe74e5eb7..7c8190f68c 100644
> --- a/meta/recipes-devtools/go/go-1.15.inc
> +++ b/meta/recipes-devtools/go/go-1.15.inc
> @@ -1,7 +1,7 @@
>   require go-common.inc
>   
>   GO_BASEVERSION = "1.15"

Khem,

go-1.16 was released on: 2021/02/16
   https://golang.org/doc/devel/release.html#go1.16

Should we update for oe-core-3.3?

../Randy

> -PV = "1.15.6"
> +PV = "1.15.8"
>   FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> @@ -16,4 +16,4 @@ SRC_URI += "\
>       file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
>       file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
>   "
> -SRC_URI[main.sha256sum] = "890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817"
> +SRC_URI[main.sha256sum] = "540c0ab7781084d124991321ed1458e479982de94454a98afab6acadf38497c2"
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.6.bb b/meta/recipes-devtools/go/go-binary-native_1.15.8.bb
> similarity index 83%
> rename from meta/recipes-devtools/go/go-binary-native_1.15.6.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.15.8.bb
> index 622557ad2b..df697e2781 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.15.6.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.15.8.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>   PROVIDES = "go-native"
>   
>   SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] = "3918e6cc85e7eaaa6f859f1bdbaac772e7a825b0eb423c63d3ae68b21f84b844"
> -SRC_URI[go_linux_arm64.sha256sum] = "f87515b9744154ffe31182da9341d0a61eb0795551173d242c8cad209239e492"
> +SRC_URI[go_linux_amd64.sha256sum] = "d3379c32a90fdf9382166f8f48034c459a8cc433730bc9476d39d9082c94583b"
> +SRC_URI[go_linux_arm64.sha256sum] = "0e31ea4bf53496b0f0809730520dee98c0ae5c530f3701a19df0ba0a327bf3d2"
>   
>   UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>   UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
