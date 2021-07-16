Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.3887.1626426812072954042
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 02:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NQXbbgmn;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2831fc28a3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16G9DOtj004279
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 09:13:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tw3k0bua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 09:13:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZzcirk7z8msuiwE+39YpSpUUE9aX2ZqIE+m+zyej0z04rjfE74kZszgJZAOE5TgbY0k3fEqzLacV4nOZOH6XO8Z0dUiZ+0USASw8c7sZW5REuvI1JXNNIZ9v4Z1oWqhClJwKVHHDLiLgmP/6nQbJZ/ONuleG7oX3FEXzntdq5VgQrj/kW1ud3SfcwBSepUsh7M7ZSqcdLEGZ93pzGuVO0RVSOSwzDRWfxub99HDkKyU+870naBpdN7fEs0IZ6fm6HGSAceu9awRX/GbejRH5D6daFraEV7HTMcTopvBoE3+WtPCQEXUqCu7FuWcv+2KqvE1usfQNd7gEhShoMjDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWOJU4JG27Ghdvf4SNZZwGe/Hi/FkP3JzE0Owj8hcyw=;
 b=XJgPyDkmNtvnDJCf61NuXK198q59zOu14n7tK6Tu+BtZ70Ij10rZdH/kRdhnWKyq16JODYJyCV6rj3gx6UL58BEkzx6xuK8mbbgNSG8fbG2EZm4pMbnUPXWNwjsXBDR8BarEvHonhjimWP555O2UnVb2YqN4oeAbFnfNnnaCVyVzRcC/ltho9wPa5IPKJ0gpd9GBhXhdVUrowzcEs6P17pj2sGDHL3YrWUQlCQo+jP0WttZql8AahOwf1OtG1PdDA6Z9dqKODLIDzWJoevdNMLiK57ZA5ylPUBsAS669sxZXz9Ecan6DwDYFxH0EZmDrdHzTA45gLTLwLF8bl5FiPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWOJU4JG27Ghdvf4SNZZwGe/Hi/FkP3JzE0Owj8hcyw=;
 b=NQXbbgmnLLNjiYGZGOjL2AAwtza71s4yvo7Kc2R3P41dHgt6xTLRQcF03+mWeM8muky15H1c+MwMeGjFx+n3dBIHa81wmmtGGYi93HsOAQWuubl8Xol0a3qJ3bgYCKnEiIpo6ZnaNcxfvYZccic323lG5q/eH02bvgezzZrkK0k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 09:13:25 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%7]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 09:13:25 +0000
Subject: Re: [OE-core] [PATCH] libffi: disable use of static exec trampolines
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <16923A6A65274009.3881@lists.openembedded.org>
Message-ID: <566902b8-cf45-f7bb-baf8-0f5fddde244d@windriver.com>
Date: Fri, 16 Jul 2021 17:13:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <16923A6A65274009.3881@lists.openembedded.org>
X-ClientProxiedBy: HK2PR02CA0170.apcprd02.prod.outlook.com
 (2603:1096:201:1f::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by HK2PR02CA0170.apcprd02.prod.outlook.com (2603:1096:201:1f::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 09:13:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 259547c5-3f4b-4a76-fc9b-08d94839f754
X-MS-TrafficTypeDiagnostic: CO1PR11MB5058:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB50585BA869C8636264304520F9119@CO1PR11MB5058.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:255;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gWJvb4XnnTFGVdTsSrhK3rDrdJI8sskozGuRwS1+OyqcvRl0KCTS4VQuP7H0lgU54Zxn6NiqJYow93zTlT5eHL/eWq40FHg62ehaOE1PjSu19S+gShCU0r3btXC+7mvFjhZQi16buUIcNws48VUwJm4qDrQ2B8NXqdKPMHSdl3h2wBTJuzAJs3MA+xgdpGNiPOuUi91AhZY64TPh+NP0wtxDHBT2kHnbDLAHaFnFtL2xYjCD7jJvjCcuEPDV1cuU9fQ4GprLZn9kZJMVGI2KeDfxmx980gerIHk4RznpTDyPz8cOYIlFRQEwX+vppJxZGH8R363Dcff3r1go2vQP8W3vuknHoH7cM81lzGjnNkajEgyY+FY4GqlJv5/w8Yb+8mKXua53DKsthMWCyA2e0ixsGneXTE/SSqr4uwAoFqnUNwXIqcjNNpY1Ql19dOQYrn329itVJjbUTbwGuoLcstQMVoFReff85IN0oGzBgEneWyfGXq72kMDa7UwyobCqBSWC//jqW67vN5WD2dxrRGky9cIFt/6+/mhkcPHaVKcqch6d2iD8VfkYt4FSwGY7eSizomb+j027yA9dEJvi1PqCYYibf3mrRhhrXL/F59HxOiAaZAOEsLvJxogkR/RKqixOyQJMan15Ok7QxiIvyA1FF8GdPrVMri5N2ZwNfT/yTFf9H1Z3N6+t+r4C0yB3ION+qmQBQAQ4SBjfDwLgrZP8EAlMJ3lhGcZ+n0PHhmIILNKkum4FxqcW8IRiotKYjTtjcfKNiYEHMjZR2mHiNiM5JKQzcrHXcQe/b3eAfs2DAsSvJNZUgXdPK1wlrQBaJFuDHTSYmO5Dq5F2MZw9g4DdhtTv2xDxInGtp5VHPElM+s3hEgvH2w9+y0OLRpmlcgUDvzah+eptIXawUb7xUOQ2oepwjDJ8tu6YR6vG2KA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(136003)(376002)(346002)(53546011)(31696002)(5660300002)(52116002)(33964004)(2906002)(6916009)(6706004)(8936002)(38100700002)(38350700002)(44832011)(8676002)(31686004)(966005)(166002)(66476007)(478600001)(83380400001)(6666004)(316002)(956004)(2616005)(36756003)(16576012)(26005)(86362001)(66946007)(66556008)(186003)(6486002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NzdMa05qT1ViTk5jOVQ4bndndDJML0l1cSt0enZpTDF1NzErQS9hQytZeVdl?=
 =?utf-8?B?cEs0V0pZek5wUW1GR2xPYlBqOU1HSGdpTDZXZ0FDaVVCU2JUZWYwK3lFUTlJ?=
 =?utf-8?B?MG5sa2xIeHVXRE5MNUFsbjM4Zmc2cmxnL0p3Z3NWUHNTMzh6Y2w3WmtEMnhL?=
 =?utf-8?B?VmlLMUYrVEVWLzJkNldqTlVCQjlHUThETTFocmwvamtzdHNFcEhqc3ZhN2d4?=
 =?utf-8?B?U2FVQUV1NEhxRmM5M0krVjRQZHlXRjJhTURISzhFOWNVRGhsQTREYnJab0VT?=
 =?utf-8?B?ZVQwdEdPSFAzcG9rN1krQ3JRV3lYNGRmNXdHR1A0WnZpVVlYTnc4S0dlWkRi?=
 =?utf-8?B?Y3NHN3k4TjRUZGpUVTBZTTg1emduak1pNEJCOS84VDhiQ2NTeUt5a3c0dnY0?=
 =?utf-8?B?NFlRcjFEMVpqOXJ2K2RRcWovenhUdXZEQzlmaER3QnVCT2tTamx2SUxCYWVn?=
 =?utf-8?B?SnBBWFpGVkxUbHlVMzBrdmd2NjhHdlZtV3o0MG5YbHJta25GWmFHOFlwSXhw?=
 =?utf-8?B?QXBjZzJIZHZSTHhrdzY5N2ZPV1poV3c0allycjJlMjZNS2FEZWhFdG9lRUl4?=
 =?utf-8?B?b3pVMWx0My9hMFNjWHZLeTk3S2RzNWFUZkVYN2U5L3VGbkU4SHpiVks2UDBv?=
 =?utf-8?B?cFUyTWduVlNMcUlRQWVaNFdwbldNS3M2djNnOG1ISlJHOGZHNGxHdWJ3RHRB?=
 =?utf-8?B?dVN6M2U1RVhtbElJQUJ0dFhnd2I1RnUranJNVVdrSHg3dkhTb0ZSR0hYSkN4?=
 =?utf-8?B?VUtwYkh0MTJid0xsS0o4TzQvR2NyTmhPeCtWQ2NVSVM0T3Z2UFB5T0dDSVlq?=
 =?utf-8?B?K3RCb0RZb3AxM2s0Nk5NRmw5MXBUTXp2MUhuMU9reFY0RllIbzN2UWdhUDNM?=
 =?utf-8?B?djhXZ05YT3BYcFBhdEh3TWFPQWx5ZXQ2SFpnbUJyQStIU09yQTFUN2JxTlp2?=
 =?utf-8?B?M2FBZTMwc1d1Y2E5bGZnWkVJRzRXSDBoc1VSeEFsQnZKckpFSTBSRkNTQzRK?=
 =?utf-8?B?Q21wNTduUUJNdFFiVnE0UjhKTFZrMEs0bU1BYmhrb3BtYy9zWW1TZWllZHZv?=
 =?utf-8?B?MEpCM1R6SkpXQU5pS1U1bnlYcTlJWVRrTmVtbHM5dG5MOGV2N3dYWDVpZDE3?=
 =?utf-8?B?Nm8rZGNUZHVBUElLWFdZa3BDYmdjdXN6TW5oVitaRFdZVFp4NTJwTjJtNmNx?=
 =?utf-8?B?UEU3Zk44dk5iQ2tDNUpGZTFYZndZNDJaVEorODRNdkRlNG1RRXVRbnRjTWxM?=
 =?utf-8?B?cGlPSS8rTDEydjdFRnczdTVsN1Z5WmlESkgxZ01RL0RYMGI0RmRxTTdjRXRa?=
 =?utf-8?B?REdmamNQeUxqNHNrUDkxTGFUWkhMd3JrNkZxNEkydEx2NmpHMUdWZ3pIZVNu?=
 =?utf-8?B?NkVzc2tDcHE3cG43WnF1dm10cDFEZ3pXV00xbE4xL2l5SFpBN083eEJLRHY0?=
 =?utf-8?B?MURTMmU0TGhHRVJWVkJUSHNveVZJVUROOTdxU1lBdXRZVjhvM3E4MHJ6MTYr?=
 =?utf-8?B?ZXh4RU5RQnRraVBOYk43a3ZJUkYwNFpENzhRS1ZLZWJKcjFvdG80ZUZvMFNx?=
 =?utf-8?B?ajZtaVVQY3NadDJZQ0Q1WnVEV0xxdC9EcHl1V0hERjl6aXo1dWdHbmNvZTJC?=
 =?utf-8?B?N2VzOUJJRi94ZmZvOWxqK2NwZVhTc0ptS3paNU4wSHdWQW41T096MVhPK2s0?=
 =?utf-8?B?K1pvOTN0VGl4aW1tZGw1Rm9aVXhnSm8zYkJybG5NUHVwT1UxNSs0ekZidUFK?=
 =?utf-8?Q?IotDkj0CIOcyqbIkAwygcRObzQNLXiG6R2DonfO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259547c5-3f4b-4a76-fc9b-08d94839f754
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 09:13:25.2928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Bm9KSCPdZtTpWLFJNbkm5aNKE3ofvcK6nDU+aep3iuDvKAtC5Kgf76lKnfCC5KJw8lo/hl0JNSgp1TxTYRF1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
X-Proofpoint-ORIG-GUID: GmoJKKugfNpHI21R_w9YUuprF-Z4KJ9k
X-Proofpoint-GUID: GmoJKKugfNpHI21R_w9YUuprF-Z4KJ9k
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_02:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160055
Content-Type: multipart/alternative;
 boundary="------------25A921C4F566488410F497DF"
Content-Language: en-US

--------------25A921C4F566488410F497DF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry. Please ignore this.


On 7/16/21 5:10 PM, Yi Zhao wrote:
> Issue: LINCD-6022
>
> We encountered a blueman-applet segfault with libffi 3.4.2:
> $ blueman-applet
> blueman-applet 01.58.45 WARNING  PluginManager:148 __load_plugin: Not loading DhcpClient because its conflict has higher priority
> blueman-applet 01.58.45 WARNING  TransferService:189 _make_share_path: Failed to get Download dir from XDG
> blueman-applet 01.58.45 WARNING  PluginManager:148 __load_plugin: Not loading PPPSupport because its conflict has higher priority
> Segmentation fault
>
> This is because the static exec trampolines is enabled by default in
> libffi 3.4.2. However it doesn't work with gobject-introspection[1].
>
> [1] https://github.com/libffi/libffi/commit/132699b95d3ee4d889ea2a80540acf3300987dad
>
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20210716
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   meta/recipes-support/libffi/libffi_3.4.2.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libffi/libffi_3.4.2.bb b/meta/recipes-support/libffi/libffi_3.4.2.bb
> index 47b230afa2..19b6ed3e58 100644
> --- a/meta/recipes-support/libffi/libffi_3.4.2.bb
> +++ b/meta/recipes-support/libffi/libffi_3.4.2.bb
> @@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9
>   UPSTREAM_CHECK_URI = "https://github.com/libffi/libffi/releases/"
>   UPSTREAM_CHECK_REGEX = "libffi-(?P<pver>\d+(\.\d+)+)\.tar"
>   
> -EXTRA_OECONF += "--disable-builddir"
> +EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
>   EXTRA_OEMAKE_class-target = "LIBTOOLFLAGS='--tag=CC'"
>   inherit autotools texinfo multilib_header
>   
>
> 
>

--------------25A921C4F566488410F497DF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Sorry. Please ignore this.</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/16/21 5:10 PM, Yi Zhao wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16923A6A65274009.3881@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Issue: LINCD-6022

We encountered a blueman-applet segfault with libffi 3.4.2:
$ blueman-applet
blueman-applet 01.58.45 WARNING  PluginManager:148 __load_plugin: Not loading DhcpClient because its conflict has higher priority
blueman-applet 01.58.45 WARNING  TransferService:189 _make_share_path: Failed to get Download dir from XDG
blueman-applet 01.58.45 WARNING  PluginManager:148 __load_plugin: Not loading PPPSupport because its conflict has higher priority
Segmentation fault

This is because the static exec trampolines is enabled by default in
libffi 3.4.2. However it doesn't work with gobject-introspection[1].

[1] <a class="moz-txt-link-freetext" href="https://github.com/libffi/libffi/commit/132699b95d3ee4d889ea2a80540acf3300987dad">https://github.com/libffi/libffi/commit/132699b95d3ee4d889ea2a80540acf3300987dad</a>

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20210716

Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
---
 meta/recipes-support/libffi/libffi_3.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libffi/libffi_3.4.2.bb b/meta/recipes-support/libffi/libffi_3.4.2.bb
index 47b230afa2..19b6ed3e58 100644
--- a/meta/recipes-support/libffi/libffi_3.4.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.2.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = &quot;540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/libffi/libffi/releases/">&quot;https://github.com/libffi/libffi/releases/&quot;</a>
 UPSTREAM_CHECK_REGEX = &quot;libffi-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quot;
 
-EXTRA_OECONF += &quot;--disable-builddir&quot;
+EXTRA_OECONF += &quot;--disable-builddir --disable-exec-static-tramp&quot;
 EXTRA_OEMAKE_class-target = &quot;LIBTOOLFLAGS='--tag=CC'&quot;
 inherit autotools texinfo multilib_header
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------25A921C4F566488410F497DF--
