Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5165.1623396614894588244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 00:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ALK+xHhG;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=179608fda6=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15B7SEO9023206
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 00:30:14 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3942cy81cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 00:30:14 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15B7UE72028235
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 00:30:14 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3942cy81ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jun 2021 00:30:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dm++O7FwNcwdCQ9YSlC8Cx/sDmZGvYzGgl2GDrfPgnzYqzGlp/h6xvHqZwSf90HB7/sh2dSl0s9WTx6zrfc2WXoT+VdIh5FLc7xhr4kQvznYf9zhuQS1HX/1jZgtiR0sEAdqO4/qntfnvemRBdnuJXGTnK/7J7AkgKyj48RZr3bnAM7Bd1WTj176Cbb5bvULzGR+hN+HwzdfS6URBjg4Y0m/GuI9cOMEdvRycrUxWdyQBW0vdQkYZMIDDVReZ2/doGG1V3heCYBImjKQput6WtjoX3CUZ7RKlQ+56nS2tzEV8ealPfBaWyd50DtJ0jGnM6mlIrTzVtUJ2IFTCYi2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPJiIUbq7y+iUy+gAKaGASly5TZErdIxBXaFTCYG2hw=;
 b=e7licQnyLLn3+yxuJeNIWJ9RAhgbtbsf0TQAkvfBQVf2SuV9YEZLgjHbcBNoSQsU7U57p4EIz6WWzLDbbPvJ1h0+p9oMAtBtsRk8GzaMreL0YX4dMFMUrDVyZpMCL1IG38842THGqnooxePAQi03717+hUXMI085heoMkeZL75waIHZ6SellLwP0YhHok+9Tgse3d69puFe2LfqeGvjMwfSsVzIBH53QcSW3XA/8wj9CkvJJke2MKbocTEtysfYcRqv+B/IRdqoRUFUkg9d4FA0SPE/ZNdM/MqiDmBiSas01mLwCcpB/MLZN4wCyO0lFlcs2sMIY9GAYp5EDi3CrIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPJiIUbq7y+iUy+gAKaGASly5TZErdIxBXaFTCYG2hw=;
 b=ALK+xHhG8lHYQObNAFaPVO/+LBZrlpbktYMxp0LewhiK/44LeeIInXI5ksnNBVxUjTpWjUWWvnKojJWfx7gFq0nfWUGmdvfgWQ+On9d9M55qCMDjVL4QqX7i3bFG5kR1I2miASY6/Vi/2KNZBScPl+ft/H7R8el4R4dIN50B8ZI=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB2031.namprd11.prod.outlook.com (2603:10b6:300:29::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Fri, 11 Jun
 2021 07:30:12 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127%7]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 07:30:12 +0000
Subject: Re: [oe-core][PATCH 1/4] initramfs-framework/udev: umount /run/media/XXX
To: hongxu <hongxu.jia@windriver.com>,
        openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org
References: <20200925070535.59518-1-hongxu.jia@windriver.com>
 <20200925070535.59518-2-hongxu.jia@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <b50d160f-c94d-0616-3845-d93bbc45851a@windriver.com>
Date: Fri, 11 Jun 2021 15:36:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200925070535.59518-2-hongxu.jia@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0067.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::31) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK0PR01CA0067.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 07:30:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64b98b62-5f6a-41fa-b8d0-08d92caabf96
X-MS-TrafficTypeDiagnostic: MWHPR11MB2031:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB2031AA8FAF5AC9A6E0EF88F7F1349@MWHPR11MB2031.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fPgWvO5tbeF7IBKAivPzTE2ez+7jz8/GI8ajk2QjdRtfdcNBZHjidZJCF5nC7dOEEtZYMDJ8tnxO4Q0+f8ziWTLgNfkfXtgqNCLqcM71qBNtokpQ32lKr4P3/izvKP6kSR753YNLk0/41WWQCC1BbfUriCDM3MLWorWZN0OsAFrfStUaAvkzsq1t172AGnZ9KWcQCIerB6lKC1T5MmMEWJnJsru2UWtYMvDfxUn6BMlY337RKK5ikIO09ci6Z+xj+bBQXjAkA8HJ5oKsV5puKxdUP5bjlXoD078Wb6j5Kj5b5W965onwSGnerp/L9AqnY+ZhU3mkmsqliUaor/nQADhuLPfZh85ckduagDamorZCTySg0hCy6qaD6e61TP+5xnHJIou9j+JvubMBO6durWAiToKPjbuHvIC8Z85SJIu8kKHtBCiLYodiw9tFsnz0enabsS5IyCljbufYfCWd642mbLp+lodIx4Beg8sEaYl+NhmL2uPvX/VMblcM1uWCnERrETFq5yfkr2ndD3kRAcU2L0oGgECPQ6mk0QK7ohy/XTcSu0lIQuM98OlbmQKIOu4Jpj2PXtkQyr+ZeLfBe/4SYPMfIHbPqC8zR3X0tNSi5HUTCKTab8PUz1F6hsR36isiQQD0bO14Z1TIeW6GDV2c0d30cCWuEgSZEesz//pZw7DL4jTFdWR0PX6o1nsSQt6HEiJPUM+KkQDjmRTvXYAkqOt1KJA6ggZ8byHdKaJOWaytpbjYhrrXqcGpN6VaM9O+tsU1F1+2hWSoiLlV8G81B/XZ655b5ZVcd9Np42En/E9OWnBgzJDy+RI3dwwEwG63NOJSeA7EEc/467qLcgXwKD9RKh/5JtOE1csojzHPKm4dbIC/zRA+7Hu95VzdWEJ5ol4A8D+XlFot75+dk5KtMKGXyjNJeDjPKgynw+i0cNENqaFOlty5wX/jOgDU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39830400003)(136003)(396003)(366004)(83380400001)(6486002)(31686004)(26005)(8936002)(66946007)(5660300002)(16576012)(6666004)(6706004)(36756003)(66556008)(66476007)(52116002)(478600001)(966005)(31696002)(316002)(186003)(38100700002)(53546011)(2616005)(956004)(16526019)(2906002)(8676002)(86362001)(38350700002)(13513002)(21314003)(78286007)(43740500002)(457024003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFFWYXNxOHhoZUlZUkRPaldnQ0pBbHBhMnN3Q0E2dEJTTnB1MjBqLzd2MWJl?=
 =?utf-8?B?UnZmOHZuckFRMXRCKzBRMm9PaWRZTkU4UHltUm1NMGk4bE5acWJUcWtqS3Aw?=
 =?utf-8?B?eUJ2dG1qYnp1VlJYOFN6T3JBY2prSkdzcDhCNXNsVDRSWUlvMWdCbVNsblNV?=
 =?utf-8?B?R291ZmlFSk4rbXRyeDJCSmdmMmNER05xdzFQd1Z0dnRjYWxuOUtEMFd5TGNQ?=
 =?utf-8?B?b3RDMEhaZ3VGdm55SG8waXoyaUgzcnY5RkFWZE9CQzRZSlB0QUwvR0lSblJT?=
 =?utf-8?B?MHRaZ2VxNGhXWnlXOGltYVZldDhVYWVuMS9LRncrTGNJelh3K1cyM2VrZVpR?=
 =?utf-8?B?TFpWQ3NJMnNFRHI3VWhwcllxOEZWcE0zSlpVTnl6bmIwVVR4R1RETjl5ZHVZ?=
 =?utf-8?B?aUNrNWRneXhPK2lBQWRLb3AwS0NxUDBBZ1hJdDM1QVMzbHcrcWcwTHpkQWJH?=
 =?utf-8?B?K3NDdW1FSDZsZkt4NjJha2pFd1R0eTJ0T3lGaWF3c2w0T1c4N25ad2Ftelhy?=
 =?utf-8?B?bE5sWDdzR1ZZQTl5Q2t0aCt0TWh2UG1ERldlSU5tZy85a1p2aDlhZXNFZmk0?=
 =?utf-8?B?WVF0L2J0aGx6bGg2SkNtYTZsdDdOc0Fpa21RYzZmcEx3L0t1UWJJcG9mZW1x?=
 =?utf-8?B?ZTEwRjIyWm5UeE8yYVhlc0JoaDduYythdDFXeTRTUDFrSWU3NldSWHArK2tq?=
 =?utf-8?B?MWJGaTY5VUdNS1BOd3ljWDh3Q013Q3pNdnNQdHZYL2RaTmNzejl1cUVYTFpS?=
 =?utf-8?B?RmM4Ykc3YnRzQ2loM0VPK25DK0FRbkIrOVR1Q2VOb29jYk9kTlMrRW1Vc0J3?=
 =?utf-8?B?bjRQSXRDSnlaOXVFbWtVejRNL2h3LzlpdmFkYmQ1R0hCd2hHU0VPdXZ2UFZZ?=
 =?utf-8?B?UnBLc1VyWFhlMkdOa1hlOU9kMnVMb1hOemlKVk1QNmNQckpwbVdMZk5aNW1N?=
 =?utf-8?B?cXNjQW50bkFGeTNUWHNJUGJJYTNDelVWVHpuM2FmU1VMaUN1TDRJcXpHdUVh?=
 =?utf-8?B?ZzB0UzdEamZURHByVXJYcnhYYUo1WmJLdy81L1BBOHlSRUJjQkFHWUc0UkI2?=
 =?utf-8?B?Lzl3YStyWXFjcEF2Vm5mVUFoVkRobFBMRzZPbnZBR1ErVjZtRjRPbHc2cldF?=
 =?utf-8?B?dkxsMlFFV0VEV0ZHV09pSGN6ckliRlhyTjJoNTFSMTlkSEt4OU9NZFpCdEZ1?=
 =?utf-8?B?MEJDTyt6ZGlBS2EzNUovdHBtTEMxT1JUc1JIQW5BWVExbDdhcjBmYU5VSzFx?=
 =?utf-8?B?ZXp6NG5rUG9vNXpHaVNxQkJsT3BIUWYvY290Njg4RDlpUWhJRVhZdXpYZVJo?=
 =?utf-8?B?MlE4VzA0VDR2SGd5Zjk5Ulk2S3dlOWIzU1UzSHdNSjdqeUx2UllUNER0NHlw?=
 =?utf-8?B?ZENMUTltbnJpR0Nxa08wOGd5YnQvNkRIenA1eW0yZ1ZsN1AzdWd1SUQ5NXBB?=
 =?utf-8?B?R1ZvTWF3b0pzL3dnZDY2R2p3dys2V1pGa1NEUG15UlAwYTZCSUpXcHNmTGxT?=
 =?utf-8?B?VUtHYXBpUHV0ZzRpM2xBNU1wTUFWY3Q0VlZMemZ0NVlud0NiVWM4MEE1K0Vx?=
 =?utf-8?B?K3lnYWdJRTNWVzAwaFVObzNJUkJLcnY4QitRTHZkOU1lUzkxc080ZFNyRmN5?=
 =?utf-8?B?WVMzSjlsRkozdkFScE5teHR4dzJCRHFYejhTWnJoYm1PeHBEcEc2TTVjSHhl?=
 =?utf-8?B?VENUb2lHU2JpRnVHK2NPK3JXZ3lIMXJZdG1oMGc2UU1zNTBOV1NYRlIxMjBV?=
 =?utf-8?Q?hbZkD2pBAyy3PdxlOcWHkxoxvgVBYZhuZjw7rkH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b98b62-5f6a-41fa-b8d0-08d92caabf96
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 07:30:12.1149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfIc/76VyY8vZcyaqqoDvpAmg25y6Vqgj6riMD6W6jvDKr+CsRxnkuM1juKZJIo42bRkwdAkMcbVSh8rJdo7ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2031
X-Proofpoint-GUID: dKEHRm05eQzLwPx89xOHx7XBU0o6aeNE
X-Proofpoint-ORIG-GUID: KcEwIpVGhwLRkXXr-fR6afrPMmuia8Hn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-11_01:2021-06-11,2021-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106110047
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

Thanks,

On 9/25/20 3:05 PM, hongxu wrote:
> In initramfs-framework, udev (initramfs-module-udev) calls hook mount.sh to
> mount /run/media/XXX which is used by setup-live (initramfs-module-setup-live).
> The setup-live calls install-XXX.sh and use /run/media/XXX to do installation
> 
> The side effect is while setup-live is not used, after it switches to rootfs,
> and the mounted disk could not be released
> 
> Release the mounted disk before switch root and after kill udev
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-core/initrdscripts/initramfs-framework/udev | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> index 4898b89246..8b62080c68 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> @@ -8,6 +8,11 @@ udev_shutdown_hook_handler() {
>   	if [ "$status" = "pre" ] && [ "$module" = "finish" ]; then
>   		udevadm settle
>   		killall `basename $_UDEV_DAEMON` 2>/dev/null
> +
> +		# Umount other media which is mounted by udev
> +		for dir in `awk '/\/dev.* \/run\/media/{print $2}' /proc/mounts`; do
> +			umount $dir
> +		done
>   	fi
>   }
>   
> 
> 
> 
> 
> 
