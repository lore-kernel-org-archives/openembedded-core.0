Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18552.1629912630635033209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 10:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kvPH5Moq;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38718b69a2=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17PCscrv022025
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 17:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=PiVQpVXClk+1+PCHnj9EOE7oeqkWUxPBX8h9lxe6400=;
 b=kvPH5Moqi97rsR2EAyWChpkKZwl3VtVYiByMhF7tLmJNHVdOdzQJU5mC9EXkPT0k3Cjy
 uv27/YsZmW85grln0ZEbH4CgfQoEUnIhWr0tNImsJGhBrxreOwn9bDXRH7KSp1IxOnqH
 WOALtyiXZSbDa8wI858Att0nMaX+zXn2QHvKli2YZ42HwDJNFlHLbQ7KXT/QyVwKvJB4
 H0aRGegf5WCNBa5ATzw7lw5xB0xtaVjD8uZKf6ZzaCEVlrj1D6N0ObF1nAn7iz2enIoO
 rU13VGgsbaAVuF/V/RfmnuR9F1GF/gRv3v394a6AatYYd7vlMn7ut0RkPHFi9wFsBC4b LQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 3an7e4grdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 17:30:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noPtrYOgnyUWUWsJfEtm+aeMq9B1YfuGeM8GOWnDtC8kW/52MTmG2JXsvYKYRvtFefMzRIMoaSEMdGS0GQ06A8xtbBaM1eZWiMzlnStNbwUnLQyVKiXOh+bD2ZVf5wCBkSgBghkf/6rzY352hTg06mXKRI1rrAv9Uo9CWZz0oyGXksRLWxENTkxVbe4fzr7AHegRonD4mMXiFrvLOCE2YJULKHh9/UXNCPmprAG4vV/2jAqlaBaENtmXxxpwedKax0S0L9Mq1CAdYbwB55UxDzAwaRYnMh9b5GWVXwILIbl1+ALCVbnBcrFCRspv/QsUMkOMf9vDpnYflgf/2C3g3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiVQpVXClk+1+PCHnj9EOE7oeqkWUxPBX8h9lxe6400=;
 b=EpcuirRXCAwjNAAZy1p1HAG94C1daWfdkSGScAATEIZM5JxJXHIy94UsrmA44OHgKo7I/87dypi4smf3J3rSNaKyFn8JLc9ke+KibIc17TDXaPUc9BvX7KGuR+8RAy6eHuMKujdlqYI/KbclT9nFgYcfoEQKi6/8bEXMyCAmKZ5T6pLYy3Gth3xo+/Xw9kfN5BVJkRExeWy/x754uk/fXQseVZ76TGnzbwKBGCoofuiR0eHHbpBA4D6wi7TFgRjt6bG7Iuj893oLbWIhGhumG15tB7XHr/laHjRLBtXsVNgGkN9ksN84nMwlrzfab+6OMXqpd5HlwoYKtL1ah0lijA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR11MB1434.namprd11.prod.outlook.com (2603:10b6:4:9::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18; Wed, 25 Aug 2021 17:30:25 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4194:d852:a5e5:77d6]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4194:d852:a5e5:77d6%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 17:30:25 +0000
Subject: Re: [OE-core] [PATCH] go: upgrade to 1.17 release
To: openembedded-core@lists.openembedded.org
References: <169E9C6226DE3CC6.18091@lists.openembedded.org>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <32b22790-eac9-9e8d-ab6c-661bb77e2fac@windriver.com>
Date: Wed, 25 Aug 2021 13:30:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <169E9C6226DE3CC6.18091@lists.openembedded.org>
X-ClientProxiedBy: YT1PR01CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::30) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.28] (184.147.146.64) by YT1PR01CA0091.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 17:30:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77b808a5-d955-4e3c-f03e-08d967ee05f4
X-MS-TrafficTypeDiagnostic: DM5PR11MB1434:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB14349D6672B1D979F5DE23A0F2C69@DM5PR11MB1434.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FY5BOfn5WY4BecAXkX8qMPlP2qcCy9shehQWsYKD4oL+ur1TIOETqgqnvfoyMz6msiPmcypUcTgu4f0/IzqIyWioLZnHK8OI2o1+F4rrdegtp2ounOl1D7N9DHVqnofpgOIQipfQP4kOTnSw5JqiUBo7CNfYilzT/2LWBD4YqeT5p8+e17YPTz17IQu+JMwrScvtO2Qv/NNtDcW6pLeIdwWjQpbUHYhum6xuHys5oJ/1jPyomUDG7p7iK99iNwmKI6mfWbkwkPiznDC3AoqlQ1X1smgDHC5CrRizEj0pQ1B2jphFOQgRYeDpmr8kbLwyxE0luumAun5cRbJ9hPFvrVlrm5lK1DNCiFitZn4MN/6U6q8cFCZX+XiUw2ByloCf7sJ8giBd12OL7httidVwfS6wNUG4B/58FAmhYKfa3CtFJbTiZ7wbDD8dzo434gjOtIcsibT9iqV/sv2/LQdhr2GfNEq4Oli4J7gvVcYCbBgi788ShxkwBVv457vaRTsDvlsHz2VFdHH5xyJ6h+i3WeeCmmM73O0EKISHZHLdhVfVJ6X/nOY90gB3bdH2N8Y4nGjiFYDC5fFZVEL3epv4TTniZFdEssto1vG+Tr0mv0R/ohkmXs7hXMxuokrpMDkxh6AhFK9vqaq7ZpERA65R3Hcm/87lkYmI9Zfcg7YJatNvvRnGgqCUJGsKcxIERgcRsSa+m9KJ+g+CseqN9O61OBqURNFYAbLsqoO/BwhSpsS1vxZBg5D5YKFnNJ/+ebz+0vCD+SXY7QJ4TQYcDh5amdpar79/Csaiy1Ic3lqKSGVWf4vKM2gxCsHHALYlfgAYTl3daeHmAIQM5iVuIB/BK09kIkCTk3kuG62KFrY7VKrKcCJftuhsiq2ZVjiQrbJc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(376002)(136003)(346002)(6916009)(186003)(26005)(16576012)(8676002)(33964004)(8936002)(44832011)(166002)(52116002)(53546011)(316002)(31696002)(5660300002)(2906002)(478600001)(956004)(30864003)(2616005)(83380400001)(86362001)(966005)(66556008)(66476007)(66946007)(6486002)(36756003)(38100700002)(38350700002)(31686004)(43740500002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWhyUXUxM3dtUVM4eForTVlVYmViQ212MUNvc3l6NTVxVnFuSGZMWGFqdzJm?=
 =?utf-8?B?blpyS1NQQlErZmlzNUVDVjJIZC9tZzRQMWhJelpEbWliWTc4NUFxZkUxTWcv?=
 =?utf-8?B?TWtNSHBBY09nTXpHR3lSenEyMUlidmYydS9yWUx6TDR3aDU4SFZLNXVaRVdH?=
 =?utf-8?B?dWZrb1lGL3RsYldxS1hiK09IRG5tZi9ITnlwUStCTFpaMkp6aG9EK0lqTGdS?=
 =?utf-8?B?ZDViV3R0M3VmUHNaTlZWZEc2NVZKdldZV3p3ZGFIZmRjdmMvaSthVG9Ddm4y?=
 =?utf-8?B?MHpqb0ViVEpBNHFtblhzcnNsSlJkNXhZVElha2k4QWVNWWd1VTZZcVk3RkRF?=
 =?utf-8?B?QStuZ3JKcWc5c1RkajJQZERNREJ2YTIwa3RUei9QNmkxUk9peWljMGlsWHBD?=
 =?utf-8?B?RmM0S0prNVRheXcrNkthT0RWamFUVHJhRjMwU0FyWTRWOWdqNStLdGJnYlVY?=
 =?utf-8?B?VitEakFsbjNjUFc1NVdHSW9SZHlGcHhVYnprL2pDQUM1RGJ5RlNJM1lEcG1u?=
 =?utf-8?B?cnBWc3ZqcUhPQkh6eDZxWFhsOFZ4OWVOK0I3MmNtdDA0VzdBSGp2ZUJOQmp5?=
 =?utf-8?B?S2VSSjA3aE1iZCtTU09xaTZsdWdqRC9rYmJ3a2h4SmhKMVdkUlZDek9ycVhD?=
 =?utf-8?B?LzRMWHNkek1RSGM5MXBKTm9vNi9qNHlzVEZyQnVHRkpranR2NDZVekhlVWo0?=
 =?utf-8?B?MXJ2RGlQRnBaVW4xakNwQldwcnNXMDVmdk5VamtDNDhKdDJhbWF3MktVN2dw?=
 =?utf-8?B?VER3bkkydW9vU2h0bEw5akJ6TnBITExkMGtXVHgwOVdxSE1ySkVhMnNXelUw?=
 =?utf-8?B?NFZLb3VINHhGR05yOFFKbmJ2RlBuVUdwU1BJcGVTTTFBeE15TE1Za2xWcmhw?=
 =?utf-8?B?Kzk4dCtrTWVWT05LaEtodmc3d3psNmNTSC9hcklQNUd2dk1XUGI5K0E3cmR3?=
 =?utf-8?B?NTRTNTJzYjhQQ1ZkbnNoSHZxTHZqYkRVTjlrNGc5cmZNbmttbi93a09CY1Y2?=
 =?utf-8?B?YmhCSE1uSjUyMCt6Z2hHTFlwdUU4dUpzcEFlemlHSnR0Qmw5QTFlRm0xeE5k?=
 =?utf-8?B?WnVxSy91ZFdTb0l6ZFpQOUQwRnQwUmRjRGF5Mm9jRW0wbTh3V1RHL3BHTFdH?=
 =?utf-8?B?RnQ1blVPNk1HbDZEU2xtS1R3VnNMVnlQUEdmRUpKMHJNUDlCWU5Ia3FoNURL?=
 =?utf-8?B?TXJpRytPdjdMajBlWUo5cDI5TmJrV2wrYlIrM1hlMWtpd3BtU2pXNFBzZTlY?=
 =?utf-8?B?WTJRNURMYk5rRjRWZ01MQW1SL3JwS0l1aUw1WHVRY3NOZ0s0UnVNVlNqTkFG?=
 =?utf-8?B?V2VJOFIyVGczNWd4Zkl1eGEwQWFlTlFBUk1Kb1ZVajJYSHg3QUZpNHhGZEVp?=
 =?utf-8?B?cTVuNFkwbzFMTGVuT2dHTEF3L1NUUTlTalFKeC8zbG1KN2YyQUh3bnZES3po?=
 =?utf-8?B?dUtJcGVWcDFzUkl0ek5sOURxR0pReHpKZEZVYjgzbEhDeUk1VXc4WEV6dWpq?=
 =?utf-8?B?R3BhVXNmOXBoOTNxT0p1eERVMmNjMmk5ZENVQ0RLdjlaRGNOZWVmVlM4Uk9m?=
 =?utf-8?B?NDU0UXRQa0h2REI5aHhBOFpKUm4zUFkrZjVMaGxqNi8wcktYUDNibC9lVC82?=
 =?utf-8?B?TVFiYjV1Y2FESGhubE1HbklPaVVrU3IxK3NaM2liVldXWG1kWkhwZ1FDWWt6?=
 =?utf-8?B?alFEbzFnMmZQWWsvYmFlS0xxTVN0N1o1MzF0WHdzZEYrZjdYUXh2akNuZ3B1?=
 =?utf-8?Q?zB7tUfyWADYwgk4shq0vGBlX174fBDURCqH9/OW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b808a5-d955-4e3c-f03e-08d967ee05f4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 17:30:25.2120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnJhcz4BYZpXj+VhA0cCzmniw43sGrCBLGSnIXwL8kO2c32zH/dWKfkagfq84zTZOHl77oMCSySP9Kz6w0PiXCulPq55y9Cj9NVSvI7huBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1434
X-Proofpoint-GUID: YgvnzoxktsHgMDJe4n7QWNxdsYuRsy6I
X-Proofpoint-ORIG-GUID: YgvnzoxktsHgMDJe4n7QWNxdsYuRsy6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_07,2021-08-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250103
Content-Type: multipart/alternative;
 boundary="------------5E8E6861E2C9115C1DC37502"
Content-Language: en-US

--------------5E8E6861E2C9115C1DC37502
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Testing done:

bitbake -k world

bitbake core-image-full-cmdline && bitbake core-image-full-cmdline -c 
testimage

Result:

World build passes without warnings/errors.

All image tests passed

Sakib

On 2021-08-25 1:20 p.m., Sakib Sajal wrote:
> go 1.17 includes small enhancements to the language.
> Release notes: https://golang.org/doc/go1.17
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc   |  2 +-
>   .../go/{go-1.16.5.inc => go-1.17.inc}         |  6 +-
>   ...ow-CC-and-CXX-to-have-multiple-words.patch | 10 ++-
>   ...ent-based-hash-generation-less-pedan.patch | 62 +++++++++++-------
>   ...-to-be-overridden-in-the-environment.patch | 18 ++++--
>   ...4-ld-add-soname-to-shareable-objects.patch | 13 ++--
>   ...de-CC-when-building-dist-and-go_boot.patch | 15 +++--
>   ...dist-separate-host-and-target-builds.patch | 64 ++++++++++---------
>   ...d-go-make-GOROOT-precious-by-default.patch | 21 ++++--
>   ...008-use-GOBUILDMODE-to-set-buildmode.patch |  9 ++-
>   ...go-make-sure-CC-and-CXX-are-absolute.patch | 45 ++++++-------
>   ...ive_1.16.5.bb => go-binary-native_1.17.bb} |  4 +-
>   ...an_1.16.5.bb => go-cross-canadian_1.17.bb} |  0
>   .../{go-cross_1.16.5.bb => go-cross_1.17.bb}  |  0
>   ...crosssdk_1.16.5.bb => go-crosssdk_1.17.bb} |  0
>   ...{go-native_1.16.5.bb => go-native_1.17.bb} |  0
>   ...o-runtime_1.16.5.bb => go-runtime_1.17.bb} |  0
>   .../go/{go_1.16.5.bb => go_1.17.bb}           |  0
>   18 files changed, 163 insertions(+), 106 deletions(-)
>   rename meta/recipes-devtools/go/{go-1.16.5.inc => go-1.17.inc} (85%)
>   rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (80%)
>   rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (80%)
>   rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (78%)
>   rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0004-ld-add-soname-to-shareable-objects.patch (78%)
>   rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (76%)
>   rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0006-cmd-dist-separate-host-and-target-builds.patch (90%)
>   rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0007-cmd-go-make-GOROOT-precious-by-default.patch (78%)
>   rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0008-use-GOBUILDMODE-to-set-buildmode.patch (84%)
>   rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch (75%)
>   rename meta/recipes-devtools/go/{go-binary-native_1.16.5.bb => go-binary-native_1.17.bb} (83%)
>   rename meta/recipes-devtools/go/{go-cross-canadian_1.16.5.bb => go-cross-canadian_1.17.bb} (100%)
>   rename meta/recipes-devtools/go/{go-cross_1.16.5.bb => go-cross_1.17.bb} (100%)
>   rename meta/recipes-devtools/go/{go-crosssdk_1.16.5.bb => go-crosssdk_1.17.bb} (100%)
>   rename meta/recipes-devtools/go/{go-native_1.16.5.bb => go-native_1.17.bb} (100%)
>   rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb => go-runtime_1.17.bb} (100%)
>   rename meta/recipes-devtools/go/{go_1.16.5.bb => go_1.17.bb} (100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 47f23f5c39..5b8a532943 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -23,7 +23,7 @@ GDBVERSION ?= "10.%"
>   GLIBCVERSION ?= "2.34"
>   LINUXLIBCVERSION ?= "5.13%"
>   QEMUVERSION ?= "6.0%"
> -GOVERSION ?= "1.16%"
> +GOVERSION ?= "1.17%"
>   # This can not use wildcards like 8.0.% since it is also used in mesa to denote
>   # llvm version being used, so always bump it with llvm recipe version bump
>   LLVMVERSION ?= "12.0.1"
> diff --git a/meta/recipes-devtools/go/go-1.16.5.inc b/meta/recipes-devtools/go/go-1.17.inc
> similarity index 85%
> rename from meta/recipes-devtools/go/go-1.16.5.inc
> rename to meta/recipes-devtools/go/go-1.17.inc
> index 545aa0c828..6b412afe25 100644
> --- a/meta/recipes-devtools/go/go-1.16.5.inc
> +++ b/meta/recipes-devtools/go/go-1.17.inc
> @@ -1,7 +1,7 @@
>   require go-common.inc
>   
> -GO_BASEVERSION = "1.16"
> -PV = "1.16.5"
> +GO_BASEVERSION = "1.17"
> +PV = "1.17"
>   FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> @@ -17,4 +17,4 @@ SRC_URI += "\
>       file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
>       file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
>   "
> -SRC_URI[main.sha256sum] = "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
> +SRC_URI[main.sha256sum] = "3a70e5055509f347c0fb831ca07a2bf3b531068f349b14a3c652e9b5b67beb5d"
> diff --git a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> similarity index 80%
> rename from meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> rename to meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> index 5f4823be22..8a833e05d3 100644
> --- a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> @@ -1,4 +1,4 @@
> -From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:00:00 2001
> +From 0e964d3ca3496beb4f3732abe501b50e262b6646 Mon Sep 17 00:00:00 2001
>   From: Alex Kube <alexander.j.kube@gmail.com>
>   Date: Wed, 23 Oct 2019 21:01:13 +0430
>   Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have multiple words
> @@ -10,14 +10,15 @@ the meta/recipes-devtools/go tree by
>   Matt Madison <matt@madison.systems>.
>   
>   Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> -
>   ---
>    src/cmd/go/internal/envcmd/env.go | 4 ++--
>    1 file changed, 2 insertions(+), 2 deletions(-)
>   
> +diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
> +index 1553d26391..20d0587899 100644
>   --- a/src/cmd/go/internal/envcmd/env.go
>   +++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -103,11 +103,11 @@ func MkEnv() []cfg.EnvVar {
> +@@ -106,11 +106,11 @@ func MkEnv() []cfg.EnvVar {
>    
>    	cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
>    	if env := strings.Fields(cfg.Getenv("CC")); len(env) > 0 {
> @@ -31,3 +32,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	}
>    	env = append(env, cfg.EnvVar{Name: "AR", Value: envOr("AR", "ar")})
>    	env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> similarity index 80%
> rename from meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> rename to meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> index 04d0e496c0..b78b6afa24 100644
> --- a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> @@ -1,4 +1,4 @@
> -From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:00:00 2001
> +From e3628e0bd22caa339652435e166c7144f417c977 Mon Sep 17 00:00:00 2001
>   From: Alex Kube <alexander.j.kube@gmail.com>
>   Date: Wed, 23 Oct 2019 21:14:22 +0430
>   Subject: [PATCH 2/9] cmd/go: make content-based hash generation less pedantic
> @@ -50,9 +50,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    src/cmd/go/internal/work/exec.go  | 66 ++++++++++++++++++++++---------
>    2 files changed, 49 insertions(+), 19 deletions(-)
>   
> +diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
> +index 20d0587899..ff6f0d810a 100644
>   --- a/src/cmd/go/internal/envcmd/env.go
>   +++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -157,7 +157,7 @@ func ExtraEnvVars() []cfg.EnvVar {
> +@@ -160,7 +160,7 @@ func ExtraEnvVars() []cfg.EnvVar {
>    func ExtraEnvVarsCostly() []cfg.EnvVar {
>    	var b work.Builder
>    	b.Init()
> @@ -61,9 +63,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	if err != nil {
>    		// Should not happen - b.CFlags was given an empty package.
>    		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
> +index 5a225fb9f1..a37872e7c7 100644
>   --- a/src/cmd/go/internal/work/exec.go
>   +++ b/src/cmd/go/internal/work/exec.go
> -@@ -37,6 +37,8 @@ import (
> +@@ -38,6 +38,8 @@ import (
>    	"cmd/go/internal/trace"
>    )
>    
> @@ -72,7 +76,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    // actionList returns the list of actions in the dag rooted at root
>    // as visited in a depth-first post-order traversal.
>    func actionList(root *Action) []*Action {
> -@@ -228,7 +230,7 @@ func (b *Builder) buildActionID(a *Actio
> +@@ -229,7 +231,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
>    	// Assume b.WorkDir is being trimmed properly.
>    	// When -trimpath is used with a package built from the module cache,
>    	// use the module path and version instead of the directory.
> @@ -81,25 +85,36 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    		fmt.Fprintf(h, "dir %s\n", p.Dir)
>    	} else if cfg.BuildTrimpath && p.Module != nil {
>    		fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
> -@@ -247,13 +249,13 @@ func (b *Builder) buildActionID(a *Actio
> +@@ -248,9 +250,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
>    	}
> - 	if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
> + 	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
>    		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
>   -		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
> --		fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(), cppflags, cflags, ldflags)
>   +		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
> -+		fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(true), cppflags, cflags, ldflags)
> - 		if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
> --			fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
> -+			fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true), cxxflags)
> +
> +-		ccExe := b.ccExe()
> ++		ccExe := b.ccExe(true)
> + 		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
> + 		// Include the C compiler tool ID so that if the C
> + 		// compiler changes we rebuild the package.
> +@@ -263,14 +265,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
> + 			}
>    		}
> - 		if len(p.FFiles) > 0 {
> --			fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
> -+			fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
> + 		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
> +-			cxxExe := b.cxxExe()
> ++			cxxExe := b.cxxExe(true)
> + 			fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
> + 			if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
> + 				fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
> + 			}
>    		}
> - 		// TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?
> - 	}
> -@@ -2401,33 +2403,48 @@ var (
> + 		if len(p.FFiles) > 0 {
> +-			fcExe := b.fcExe()
> ++			fcExe := b.fcExe(true)
> + 			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
> + 			if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
> + 				fmt.Fprintf(h, "FC ID=%q\n", fcID)
> +@@ -2438,33 +2440,48 @@ var (
>    // gccCmd returns a gcc command line prefix
>    // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
>    func (b *Builder) GccCmd(incdir, workdir string) []string {
> @@ -157,7 +172,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    }
>    
>    // compilerExe returns the compiler to use given an
> -@@ -2436,11 +2453,16 @@ func (b *Builder) fcExe() []string {
> +@@ -2473,11 +2490,16 @@ func (b *Builder) fcExe() []string {
>    // of the compiler but can have additional arguments if they
>    // were present in the environment value.
>    // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
> @@ -175,7 +190,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	return compiler
>    }
>    
> -@@ -2620,7 +2642,7 @@ func envList(key, def string) []string {
> +@@ -2667,7 +2689,7 @@ func envList(key, def string) []string {
>    }
>    
>    // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
> @@ -184,7 +199,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	defaults := "-g -O2"
>    
>    	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
> -@@ -2639,6 +2661,14 @@ func (b *Builder) CFlags(p *load.Package
> +@@ -2686,6 +2708,14 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
>    		return
>    	}
>    
> @@ -199,7 +214,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	return
>    }
>    
> -@@ -2653,7 +2683,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> +@@ -2700,7 +2730,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
>    
>    func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
>    	p := a.Package
> @@ -208,7 +223,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	if err != nil {
>    		return nil, nil, err
>    	}
> -@@ -3104,7 +3134,7 @@ func (b *Builder) swigIntSize(objdir str
> +@@ -3151,7 +3181,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
>    
>    // Run SWIG on one SWIG input file.
>    func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
> @@ -217,3 +232,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	if err != nil {
>    		return "", "", err
>    	}
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> similarity index 78%
> rename from meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> rename to meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> index 662c705471..e5d0ee90e2 100644
> --- a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> @@ -1,7 +1,8 @@
> -From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:00:00 2001
> +From f7b2347869941b751b6db1dfa8461195d2a5888b Mon Sep 17 00:00:00 2001
>   From: Alex Kube <alexander.j.kube@gmail.com>
>   Date: Wed, 23 Oct 2019 21:15:37 +0430
> -Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the environment
> +Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the
> + environment
>   
>   to allow for split host/target build roots
>   
> @@ -17,10 +18,12 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    src/cmd/go/internal/cfg/cfg.go | 6 +++++-
>    2 files changed, 8 insertions(+), 2 deletions(-)
>   
> +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> +index bec17696f3..d82f612e75 100644
>   --- a/src/cmd/dist/build.go
>   +++ b/src/cmd/dist/build.go
> -@@ -246,7 +246,9 @@ func xinit() {
> - 	workdir = xworkdir()
> +@@ -248,7 +248,9 @@ func xinit() {
> + 	}
>    	xatexit(rmworkdir)
>    
>   -	tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> @@ -30,9 +33,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    }
>    
>    // compilerEnv returns a map from "goos/goarch" to the
> +diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
> +index 57a3c1ff6f..825d8c70f2 100644
>   --- a/src/cmd/go/internal/cfg/cfg.go
>   +++ b/src/cmd/go/internal/cfg/cfg.go
> -@@ -64,7 +64,11 @@ func defaultContext() build.Context {
> +@@ -67,7 +67,11 @@ func defaultContext() build.Context {
>    		// variables. This matches the initialization of ToolDir in
>    		// go/build, except for using ctxt.GOROOT rather than
>    		// runtime.GOROOT.
> @@ -45,3 +50,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	}
>    
>    	ctxt.GOPATH = envOr("GOPATH", ctxt.GOPATH)
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> similarity index 78%
> rename from meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> rename to meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> index cd875f1164..bc5cabeca0 100644
> --- a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> @@ -1,4 +1,4 @@
> -From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:00:00 2001
> +From 751ab1c94df250475a8e0c6fe0272c60560a38b3 Mon Sep 17 00:00:00 2001
>   From: Alex Kube <alexander.j.kube@gmail.com>
>   Date: Wed, 23 Oct 2019 21:16:32 +0430
>   Subject: [PATCH 4/9] ld: add soname to shareable objects
> @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    src/cmd/link/internal/ld/lib.go | 3 +++
>    1 file changed, 3 insertions(+)
>   
> +diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
> +index 644faeb2fb..5b7e48636e 100644
>   --- a/src/cmd/link/internal/ld/lib.go
>   +++ b/src/cmd/link/internal/ld/lib.go
> -@@ -1343,6 +1343,7 @@ func (ctxt *Link) hostlink() {
> +@@ -1342,6 +1342,7 @@ func (ctxt *Link) hostlink() {
>    				argv = append(argv, "-Wl,-z,relro")
>    			}
>    			argv = append(argv, "-shared")
> @@ -27,7 +29,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    			if ctxt.HeadType == objabi.Hwindows {
>    				if *flagAslr {
>    					argv = addASLRargs(argv)
> -@@ -1358,6 +1359,7 @@ func (ctxt *Link) hostlink() {
> +@@ -1359,6 +1360,7 @@ func (ctxt *Link) hostlink() {
>    			argv = append(argv, "-Wl,-z,relro")
>    		}
>    		argv = append(argv, "-shared")
> @@ -35,7 +37,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	case BuildModePlugin:
>    		if ctxt.HeadType == objabi.Hdarwin {
>    			argv = append(argv, "-dynamiclib")
> -@@ -1366,6 +1368,7 @@ func (ctxt *Link) hostlink() {
> +@@ -1367,6 +1369,7 @@ func (ctxt *Link) hostlink() {
>    				argv = append(argv, "-Wl,-z,relro")
>    			}
>    			argv = append(argv, "-shared")
> @@ -43,3 +45,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    		}
>    	}
>    
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> similarity index 76%
> rename from meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> rename to meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> index 59c12d9546..a7d9932f4d 100644
> --- a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> @@ -1,4 +1,4 @@
> -From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:00:00 2001
> +From 4a3a4c0b51618cab8e41dc307404c8b40146a8c4 Mon Sep 17 00:00:00 2001
>   From: Alex Kube <alexander.j.kube@gmail.com>
>   Date: Wed, 23 Oct 2019 21:17:16 +0430
>   Subject: [PATCH 5/9] make.bash: override CC when building dist and
> @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    src/make.bash | 4 ++--
>    1 file changed, 2 insertions(+), 2 deletions(-)
>   
> +diff --git a/src/make.bash b/src/make.bash
> +index 7986125a06..dd67029700 100755
>   --- a/src/make.bash
>   +++ b/src/make.bash
> -@@ -178,7 +178,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ];
> +@@ -181,7 +181,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
>    	exit 1
>    fi
>    rm -f cmd/dist/dist
> @@ -28,12 +30,15 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    
>    # -e doesn't propagate out of eval, so check success by hand.
>    eval $(./cmd/dist/dist env -p || echo FAIL=true)
> -@@ -209,7 +209,7 @@ fi
> +@@ -206,7 +206,7 @@ fi
>    # Run dist bootstrap to complete make.bash.
>    # Bootstrap installs a proper cmd/dist, built with the new toolchain.
>    # Throw ours, built with Go 1.4, away after bootstrap.
> --./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> -+CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> +-./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
> ++CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
>    rm -f ./cmd/dist/dist
>    
>    # DO NOT ADD ANY NEW CODE HERE.
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> similarity index 90%
> rename from meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> rename to meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> index 7aee0bac43..e92cc9b28b 100644
> --- a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> @@ -1,4 +1,4 @@
> -From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:00:00 2001
> +From fdbb0770a7e5190368c7e15ffcc2ce25fe7344e7 Mon Sep 17 00:00:00 2001
>   From: Alex Kube <alexander.j.kube@gmail.com>
>   Date: Wed, 23 Oct 2019 21:18:12 +0430
>   Subject: [PATCH 6/9] cmd/dist: separate host and target builds
> @@ -38,17 +38,19 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    src/cmd/dist/build.go | 155 ++++++++++++++++++++++++++++++------------
>    1 file changed, 112 insertions(+), 43 deletions(-)
>   
> +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> +index d82f612e75..af24e01198 100644
>   --- a/src/cmd/dist/build.go
>   +++ b/src/cmd/dist/build.go
> -@@ -41,6 +41,7 @@ var (
> - 	goldflags        string
> +@@ -43,6 +43,7 @@ var (
> + 	goexperiment     string
>    	workdir          string
>    	tooldir          string
>   +	build_tooldir    string
>    	oldgoos          string
>    	oldgoarch        string
>    	exe              string
> -@@ -53,6 +54,7 @@ var (
> +@@ -55,6 +56,7 @@ var (
>    
>    	rebuildall   bool
>    	defaultclang bool
> @@ -56,7 +58,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    
>    	vflag int // verbosity
>    )
> -@@ -249,6 +251,8 @@ func xinit() {
> +@@ -251,6 +253,8 @@ func xinit() {
>    	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
>    		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
>    	}
> @@ -65,7 +67,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    }
>    
>    // compilerEnv returns a map from "goos/goarch" to the
> -@@ -480,8 +484,10 @@ func setup() {
> +@@ -496,8 +500,10 @@ func setup() {
>    	p := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
>    	if rebuildall {
>    		xremoveall(p)
> @@ -76,23 +78,24 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    
>    	if goos != gohostos || goarch != gohostarch {
>    		p := pathf("%s/pkg/%s_%s", goroot, goos, goarch)
> -@@ -1244,12 +1250,29 @@ func cmdbootstrap() {
> +@@ -1266,13 +1272,30 @@ func cmdbootstrap() {
> + 	defer timelog("end", "dist bootstrap")
>    
> - 	var noBanner bool
> - 	var debug bool
> + 	var noBanner, noClean bool
>   +	var hostOnly bool
>   +	var targetOnly bool
>   +	var toBuild = []string{"std", "cmd"}
> -+
> + 	var debug bool
>    	flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
>    	flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap process")
>    	flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print banner")
> + 	flag.BoolVar(&noClean, "no-clean", noClean, "print deprecation warning")
>   +	flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host binaries, not target")
>   +	flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only target binaries, not host")
>    
>   -	xflagparse(0)
>   +	xflagparse(-1)
> -
> ++
>   +	if hostOnly && targetOnly {
>   +		fatalf("specify only one of --host-only or --target-only\n")
>   +	}
> @@ -104,10 +107,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   +			fatalf("package names not permitted without --host-only or --target-only\n")
>   +		}
>   +	}
> - 	// Set GOPATH to an internal directory. We shouldn't actually
> - 	// need to store files here, since the toolchain won't
> - 	// depend on modules outside of vendor directories, but if
> -@@ -1303,8 +1326,13 @@ func cmdbootstrap() {
> +
> + 	if noClean {
> + 		xprintf("warning: --no-clean is deprecated and has no effect; use 'go install std cmd' instead\n")
> +@@ -1345,8 +1368,13 @@ func cmdbootstrap() {
>    		xprintf("\n")
>    	}
>    
> @@ -123,7 +126,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	goBootstrap := pathf("%s/go_bootstrap", tooldir)
>    	cmdGo := pathf("%s/go", gobin)
>    	if debug {
> -@@ -1333,7 +1361,11 @@ func cmdbootstrap() {
> +@@ -1375,7 +1403,11 @@ func cmdbootstrap() {
>    		xprintf("\n")
>    	}
>    	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
> @@ -133,10 +136,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   +	} else {
>   +		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
>   +	}
> + 	// Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
> + 	os.Setenv("GOEXPERIMENT", goexperiment)
>    	goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
> - 	if debug {
> - 		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
> -@@ -1370,50 +1402,84 @@ func cmdbootstrap() {
> +@@ -1414,50 +1446,84 @@ func cmdbootstrap() {
>    	}
>    	checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
>    
> @@ -188,6 +191,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   -		timelog("build", "host toolchain")
>   -		if vflag > 0 {
>   -			xprintf("\n")
> +-		}
> +-		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
>   +
>   +		if goos == oldgoos && goarch == oldgoarch {
>   +			// Common case - not setting up for cross-compilation.
> @@ -219,8 +224,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   +			os.Setenv("GOARCH", goarch)
>   +			os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
>   +			xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
> - 		}
> --		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
> ++		}
>    		goInstall(goBootstrap, "std", "cmd")
>    		checkNotStale(goBootstrap, "std", "cmd")
>    		checkNotStale(cmdGo, "std", "cmd")
> @@ -228,7 +232,12 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   -		timelog("build", "target toolchain")
>   -		if vflag > 0 {
>   -			xprintf("\n")
> --		}
> ++		if debug {
> ++			run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
> ++			run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> ++			checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
> ++			copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
> + 		}
>   -		goos = oldgoos
>   -		goarch = oldgoarch
>   -		os.Setenv("GOOS", goos)
> @@ -249,16 +258,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   -		run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
>   -		checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
>   -		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
> -+		if debug {
> -+			run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
> -+			run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> -+			checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
> -+			copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
> -+		}
>    	}
>    
>    	// Check that there are no new files in $GOROOT/bin other than
> -@@ -1430,8 +1496,11 @@ func cmdbootstrap() {
> +@@ -1474,8 +1540,11 @@ func cmdbootstrap() {
>    		}
>    	}
>    
> @@ -272,3 +275,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    
>    	if goos == "android" {
>    		// Make sure the exec wrapper will sync a fresh $GOROOT to the device.
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> similarity index 78%
> rename from meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> rename to meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> index 4b4d0d4f3d..d522512699 100644
> --- a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> @@ -1,4 +1,4 @@
> -From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:00:00 2001
> +From f65315faeacf0acb8a5dbbc754136e33381200f5 Mon Sep 17 00:00:00 2001
>   From: Alex Kube <alexander.j.kube@gmail.com>
>   Date: Wed, 23 Oct 2019 21:18:56 +0430
>   Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default
> @@ -27,9 +27,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
>    3 files changed, 34 insertions(+)
>   
> +diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
> +index 69940cb001..b0c1667def 100644
>   --- a/src/cmd/go/internal/work/action.go
>   +++ b/src/cmd/go/internal/work/action.go
> -@@ -670,6 +670,9 @@ func (b *Builder) addTransitiveLinkDeps(
> +@@ -673,6 +673,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
>    			if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
>    				continue
>    			}
> @@ -39,9 +41,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    			haveShlib[filepath.Base(p1.Shlib)] = true
>    			// TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
>    			// we'll end up building an overall library or executable that depends at runtime
> +diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
> +index 0ed2389cd5..c3f8a82880 100644
>   --- a/src/cmd/go/internal/work/build.go
>   +++ b/src/cmd/go/internal/work/build.go
> -@@ -167,6 +167,8 @@ See also: go install, go get, go clean.
> +@@ -189,6 +189,8 @@ See also: go install, go get, go clean.
>    
>    const concurrentGCBackendCompilationEnabledByDefault = true
>    
> @@ -50,7 +54,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    func init() {
>    	// break init cycle
>    	CmdBuild.Run = runBuild
> -@@ -179,6 +181,10 @@ func init() {
> +@@ -201,6 +203,10 @@ func init() {
>    
>    	AddBuildFlags(CmdBuild, DefaultBuildFlags)
>    	AddBuildFlags(CmdInstall, DefaultBuildFlags)
> @@ -61,9 +65,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    }
>    
>    // Note that flags consulted by other parts of the code
> +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
> +index a37872e7c7..f4e83b97e2 100644
>   --- a/src/cmd/go/internal/work/exec.go
>   +++ b/src/cmd/go/internal/work/exec.go
> -@@ -468,6 +468,23 @@ func (b *Builder) build(a *Action) (err
> +@@ -514,6 +514,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
>    		return errors.New("binary-only packages are no longer supported")
>    	}
>    
> @@ -87,7 +93,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	if err := b.Mkdir(a.Objdir); err != nil {
>    		return err
>    	}
> -@@ -1520,6 +1537,14 @@ func BuildInstallFunc(b *Builder, a *Act
> +@@ -1558,6 +1575,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
>    		return err
>    	}
>    
> @@ -102,3 +108,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	if err := b.Mkdir(a.Objdir); err != nil {
>    		return err
>    	}
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> similarity index 84%
> rename from meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> rename to meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> index 4e5d5021d6..9a1bce809c 100644
> --- a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> @@ -1,4 +1,4 @@
> -From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:00:00 2001
> +From 1446c2c3cc6b1c66d9ef9507eb596c5bfed3dc47 Mon Sep 17 00:00:00 2001
>   From: Alex Kube <alexander.j.kube@gmail.com>
>   Date: Wed, 23 Oct 2019 21:19:26 +0430
>   Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set buildmode
> @@ -23,9 +23,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    src/cmd/go/internal/work/build.go | 8 +++++++-
>    1 file changed, 7 insertions(+), 1 deletion(-)
>   
> +diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
> +index c3f8a82880..23d1aa4836 100644
>   --- a/src/cmd/go/internal/work/build.go
>   +++ b/src/cmd/go/internal/work/build.go
> -@@ -254,7 +254,13 @@ func AddBuildFlags(cmd *base.Command, ma
> +@@ -275,7 +275,13 @@ func AddBuildFlags(cmd *base.Command, mask BuildFlagMask) {
>    
>    	cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
>    	cmd.Flag.Var(buildCompiler{}, "compiler", "")
> @@ -40,3 +42,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>    	cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
>    	cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
>    	if mask&OmitModFlag == 0 {
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> similarity index 75%
> rename from meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> rename to meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> index dcbdf58752..f8bd491f93 100644
> --- a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> @@ -1,7 +1,7 @@
> -From a983bc6cd48fb0da939e3329cac18d7a3b29ecf8 Mon Sep 17 00:00:00 2001
> +From c5f3c1aa77753254586c0c8a6893862ae97eabe1 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Mon, 22 Feb 2021 17:54:01 -0800
> -Subject: [PATCH] Revert "cmd/go: make sure CC and CXX are absolute"
> +Subject: [PATCH 9/9] Revert "cmd/go: make sure CC and CXX are absolute"
>   
>   OE uses CC/CXX values which consists of cmpiler and options together,
>   secondly, the environment is canned so this check add little value to OE
> @@ -16,47 +16,44 @@ This reverts commit aa161e799df7e1eba99d2be10271e76b6f758142.
>   Upstream-Status: Inappropriate [OE-Specific]
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   ---
> - src/cmd/go/internal/envcmd/env.go        |  5 -----
> + src/cmd/go/internal/envcmd/env.go        |  2 +-
>    src/cmd/go/internal/work/init.go         |  7 -------
>    src/cmd/go/testdata/script/env_write.txt | 24 ------------------------
> - 3 files changed, 36 deletions(-)
> + 3 files changed, 1 insertion(+), 32 deletions(-)
>   
>   diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
> -index 6937187522..29f9057c3f 100644
> +index ff6f0d810a..ca0494b5d4 100644
>   --- a/src/cmd/go/internal/envcmd/env.go
>   +++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -427,11 +427,6 @@ func checkEnvWrite(key, val string) error {
> - 		if !filepath.IsAbs(val) && val != "" {
> +@@ -458,7 +458,7 @@ func checkEnvWrite(key, val string) error {
>    			return fmt.Errorf("GOPATH entry is relative; must be absolute path: %q", val)
>    		}
> --	// Make sure CC and CXX are absolute paths
> --	case "CC", "CXX":
> --		if !filepath.IsAbs(val) && val != "" && val != filepath.Base(val) {
> --			return fmt.Errorf("%s entry is relative; must be absolute path: %q", key, val)
> --		}
> - 	}
> -
> - 	if !utf8.ValidString(val) {
> + 	// Make sure CC and CXX are absolute paths
> +-	case "CC", "CXX", "GOMODCACHE":
> ++	case "GOMODCACHE":
> + 		if !filepath.IsAbs(val) && val != "" && val != filepath.Base(val) {
> + 			return fmt.Errorf("%s entry is relative; must be absolute path: %q", key, val)
> + 		}
>   diff --git a/src/cmd/go/internal/work/init.go b/src/cmd/go/internal/work/init.go
> -index ba7c7c2fbb..3a6df5f758 100644
> +index 37a3e2d0ff..e529cc2917 100644
>   --- a/src/cmd/go/internal/work/init.go
>   +++ b/src/cmd/go/internal/work/init.go
> -@@ -41,13 +41,6 @@ func BuildInit() {
> +@@ -38,13 +38,6 @@ func BuildInit() {
> + 		}
>    		cfg.BuildPkgdir = p
>    	}
> -
> +-
>   -	// Make sure CC and CXX are absolute paths
>   -	for _, key := range []string{"CC", "CXX"} {
>   -		if path := cfg.Getenv(key); !filepath.IsAbs(path) && path != "" && path != filepath.Base(path) {
>   -			base.Fatalf("go %s: %s environment variable is relative; must be absolute path: %s\n", flag.Args()[0], key, path)
>   -		}
>   -	}
> --
> - 	// For each experiment that has been enabled in the toolchain, define a
> - 	// build tag with the same name but prefixed by "goexperiment." which can be
> - 	// used for compiling alternative files for the experiment. This allows
> + }
> +
> + func instrumentInit() {
>   diff --git a/src/cmd/go/testdata/script/env_write.txt b/src/cmd/go/testdata/script/env_write.txt
> -index bda1e57826..c99aadb7f2 100644
> +index b5e9739167..566c876658 100644
>   --- a/src/cmd/go/testdata/script/env_write.txt
>   +++ b/src/cmd/go/testdata/script/env_write.txt
>   @@ -129,30 +129,6 @@ go env -w GOTMPDIR=
> @@ -91,5 +88,5 @@ index bda1e57826..c99aadb7f2 100644
>    env GOOS=
>    env GOARCH=
>   --
> -2.30.1
> +2.25.1
>   
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb b/meta/recipes-devtools/go/go-binary-native_1.17.bb
> similarity index 83%
> rename from meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.17.bb
> index b3e2b6a60e..2b3db17d3b 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.17.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>   PROVIDES = "go-native"
>   
>   SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] = "b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061"
> -SRC_URI[go_linux_arm64.sha256sum] = "d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799"
> +SRC_URI[go_linux_amd64.sha256sum] = "6bf89fc4f5ad763871cf7eac80a2d594492de7a818303283f1366a7f6a30372d"
> +SRC_URI[go_linux_arm64.sha256sum] = "01a9af009ada22122d3fcb9816049c1d21842524b38ef5d5a0e2ee4b26d7c3e7"
>   
>   UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>   UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.17.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.16.5.bb b/meta/recipes-devtools/go/go-cross_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.16.5.bb
> rename to meta/recipes-devtools/go/go-cross_1.17.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.17.bb
> diff --git a/meta/recipes-devtools/go/go-native_1.16.5.bb b/meta/recipes-devtools/go/go-native_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.16.5.bb
> rename to meta/recipes-devtools/go/go-native_1.17.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.16.5.bb b/meta/recipes-devtools/go/go-runtime_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.16.5.bb
> rename to meta/recipes-devtools/go/go-runtime_1.17.bb
> diff --git a/meta/recipes-devtools/go/go_1.16.5.bb b/meta/recipes-devtools/go/go_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.16.5.bb
> rename to meta/recipes-devtools/go/go_1.17.bb
>
> 
>

--------------5E8E6861E2C9115C1DC37502
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Testing done:</p>
    <p>bitbake -k world</p>
    <p>bitbake core-image-full-cmdline &amp;&amp; bitbake
      core-image-full-cmdline -c testimage</p>
    <p>Result:</p>
    <p>World build passes without warnings/errors.</p>
    <p>All image tests passed</p>
    <p>Sakib<br>
    </p>
    <div class="moz-cite-prefix">On 2021-08-25 1:20 p.m., Sakib Sajal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:169E9C6226DE3CC6.18091@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">go 1.17 includes small enhancements to the language.
Release notes: <a class="moz-txt-link-freetext" href="https://golang.org/doc/go1.17">https://golang.org/doc/go1.17</a>

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../go/{go-1.16.5.inc =&gt; go-1.17.inc}         |  6 +-
 ...ow-CC-and-CXX-to-have-multiple-words.patch | 10 ++-
 ...ent-based-hash-generation-less-pedan.patch | 62 +++++++++++-------
 ...-to-be-overridden-in-the-environment.patch | 18 ++++--
 ...4-ld-add-soname-to-shareable-objects.patch | 13 ++--
 ...de-CC-when-building-dist-and-go_boot.patch | 15 +++--
 ...dist-separate-host-and-target-builds.patch | 64 ++++++++++---------
 ...d-go-make-GOROOT-precious-by-default.patch | 21 ++++--
 ...008-use-GOBUILDMODE-to-set-buildmode.patch |  9 ++-
 ...go-make-sure-CC-and-CXX-are-absolute.patch | 45 ++++++-------
 ...ive_1.16.5.bb =&gt; go-binary-native_1.17.bb} |  4 +-
 ...an_1.16.5.bb =&gt; go-cross-canadian_1.17.bb} |  0
 .../{go-cross_1.16.5.bb =&gt; go-cross_1.17.bb}  |  0
 ...crosssdk_1.16.5.bb =&gt; go-crosssdk_1.17.bb} |  0
 ...{go-native_1.16.5.bb =&gt; go-native_1.17.bb} |  0
 ...o-runtime_1.16.5.bb =&gt; go-runtime_1.17.bb} |  0
 .../go/{go_1.16.5.bb =&gt; go_1.17.bb}           |  0
 18 files changed, 163 insertions(+), 106 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.5.inc =&gt; go-1.17.inc} (85%)
 rename meta/recipes-devtools/go/{go-1.16 =&gt; go-1.17}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (80%)
 rename meta/recipes-devtools/go/{go-1.16 =&gt; go-1.17}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (80%)
 rename meta/recipes-devtools/go/{go-1.16 =&gt; go-1.17}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (78%)
 rename meta/recipes-devtools/go/{go-1.16 =&gt; go-1.17}/0004-ld-add-soname-to-shareable-objects.patch (78%)
 rename meta/recipes-devtools/go/{go-1.16 =&gt; go-1.17}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (76%)
 rename meta/recipes-devtools/go/{go-1.16 =&gt; go-1.17}/0006-cmd-dist-separate-host-and-target-builds.patch (90%)
 rename meta/recipes-devtools/go/{go-1.16 =&gt; go-1.17}/0007-cmd-go-make-GOROOT-precious-by-default.patch (78%)
 rename meta/recipes-devtools/go/{go-1.16 =&gt; go-1.17}/0008-use-GOBUILDMODE-to-set-buildmode.patch (84%)
 rename meta/recipes-devtools/go/{go-1.16 =&gt; go-1.17}/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch (75%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.5.bb =&gt; go-binary-native_1.17.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.5.bb =&gt; go-cross-canadian_1.17.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.5.bb =&gt; go-cross_1.17.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.5.bb =&gt; go-crosssdk_1.17.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.5.bb =&gt; go-native_1.17.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb =&gt; go-runtime_1.17.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.5.bb =&gt; go_1.17.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 47f23f5c39..5b8a532943 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= &quot;10.%&quot;
 GLIBCVERSION ?= &quot;2.34&quot;
 LINUXLIBCVERSION ?= &quot;5.13%&quot;
 QEMUVERSION ?= &quot;6.0%&quot;
-GOVERSION ?= &quot;1.16%&quot;
+GOVERSION ?= &quot;1.17%&quot;
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= &quot;12.0.1&quot;
diff --git a/meta/recipes-devtools/go/go-1.16.5.inc b/meta/recipes-devtools/go/go-1.17.inc
similarity index 85%
rename from meta/recipes-devtools/go/go-1.16.5.inc
rename to meta/recipes-devtools/go/go-1.17.inc
index 545aa0c828..6b412afe25 100644
--- a/meta/recipes-devtools/go/go-1.16.5.inc
+++ b/meta/recipes-devtools/go/go-1.17.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
-GO_BASEVERSION = &quot;1.16&quot;
-PV = &quot;1.16.5&quot;
+GO_BASEVERSION = &quot;1.17&quot;
+PV = &quot;1.17&quot;
 FILESEXTRAPATHS:prepend := &quot;${FILE_DIRNAME}/go-${GO_BASEVERSION}:&quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707">&quot;file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707&quot;</a>
@@ -17,4 +17,4 @@ SRC_URI += &quot;\
     <a class="moz-txt-link-freetext" href="file://0008-use-GOBUILDMODE-to-set-buildmode.patch">file://0008-use-GOBUILDMODE-to-set-buildmode.patch</a> \
     <a class="moz-txt-link-freetext" href="file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch">file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch</a> \
 &quot;
-SRC_URI[main.sha256sum] = &quot;7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80&quot;
+SRC_URI[main.sha256sum] = &quot;3a70e5055509f347c0fb831ca07a2bf3b531068f349b14a3c652e9b5b67beb5d&quot;
diff --git a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
similarity index 80%
rename from meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
rename to meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
index 5f4823be22..8a833e05d3 100644
--- a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
+++ b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
@@ -1,4 +1,4 @@
-From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:00:00 2001
+From 0e964d3ca3496beb4f3732abe501b50e262b6646 Mon Sep 17 00:00:00 2001
 From: Alex Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 Date: Wed, 23 Oct 2019 21:01:13 +0430
 Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have multiple words
@@ -10,14 +10,15 @@ the meta/recipes-devtools/go tree by
 Matt Madison <a class="moz-txt-link-rfc2396E" href="mailto:matt@madison.systems">&lt;matt@madison.systems&gt;</a>.
 
 Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
-
 ---
  src/cmd/go/internal/envcmd/env.go | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 1553d26391..20d0587899 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -103,11 +103,11 @@ func MkEnv() []cfg.EnvVar {
+@@ -106,11 +106,11 @@ func MkEnv() []cfg.EnvVar {
  
  	cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
  	if env := strings.Fields(cfg.Getenv(&quot;CC&quot;)); len(env) &gt; 0 {
@@ -31,3 +32,6 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	}
  	env = append(env, cfg.EnvVar{Name: &quot;AR&quot;, Value: envOr(&quot;AR&quot;, &quot;ar&quot;)})
  	env = append(env, cfg.EnvVar{Name: &quot;CC&quot;, Value: cc})
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
similarity index 80%
rename from meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
rename to meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 04d0e496c0..b78b6afa24 100644
--- a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,4 +1,4 @@
-From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:00:00 2001
+From e3628e0bd22caa339652435e166c7144f417c977 Mon Sep 17 00:00:00 2001
 From: Alex Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 Date: Wed, 23 Oct 2019 21:14:22 +0430
 Subject: [PATCH 2/9] cmd/go: make content-based hash generation less pedantic
@@ -50,9 +50,11 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  src/cmd/go/internal/work/exec.go  | 66 ++++++++++++++++++++++---------
  2 files changed, 49 insertions(+), 19 deletions(-)
 
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 20d0587899..ff6f0d810a 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -157,7 +157,7 @@ func ExtraEnvVars() []cfg.EnvVar {
+@@ -160,7 +160,7 @@ func ExtraEnvVars() []cfg.EnvVar {
  func ExtraEnvVarsCostly() []cfg.EnvVar {
  	var b work.Builder
  	b.Init()
@@ -61,9 +63,11 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	if err != nil {
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, &quot;go: invalid cflags: %v\n&quot;, err)
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index 5a225fb9f1..a37872e7c7 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -37,6 +37,8 @@ import (
+@@ -38,6 +38,8 @@ import (
  	&quot;cmd/go/internal/trace&quot;
  )
  
@@ -72,7 +76,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  // actionList returns the list of actions in the dag rooted at root
  // as visited in a depth-first post-order traversal.
  func actionList(root *Action) []*Action {
-@@ -228,7 +230,7 @@ func (b *Builder) buildActionID(a *Actio
+@@ -229,7 +231,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	// Assume b.WorkDir is being trimmed properly.
  	// When -trimpath is used with a package built from the module cache,
  	// use the module path and version instead of the directory.
@@ -81,25 +85,36 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  		fmt.Fprintf(h, &quot;dir %s\n&quot;, p.Dir)
  	} else if cfg.BuildTrimpath &amp;&amp; p.Module != nil {
  		fmt.Fprintf(h, &quot;module %s@%s\n&quot;, p.Module.Path, p.Module.Version)
-@@ -247,13 +249,13 @@ func (b *Builder) buildActionID(a *Actio
+@@ -248,9 +250,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	}
- 	if len(p.CgoFiles)+len(p.SwigFiles) &gt; 0 {
+ 	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) &gt; 0 {
  		fmt.Fprintf(h, &quot;cgo %q\n&quot;, b.toolID(&quot;cgo&quot;))
 -		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
--		fmt.Fprintf(h, &quot;CC=%q %q %q %q\n&quot;, b.ccExe(), cppflags, cflags, ldflags)
 +		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
-+		fmt.Fprintf(h, &quot;CC=%q %q %q %q\n&quot;, b.ccExe(true), cppflags, cflags, ldflags)
- 		if len(p.CXXFiles)+len(p.SwigFiles) &gt; 0 {
--			fmt.Fprintf(h, &quot;CXX=%q %q\n&quot;, b.cxxExe(), cxxflags)
-+			fmt.Fprintf(h, &quot;CXX=%q %q\n&quot;, b.cxxExe(true), cxxflags)
+ 
+-		ccExe := b.ccExe()
++		ccExe := b.ccExe(true)
+ 		fmt.Fprintf(h, &quot;CC=%q %q %q %q\n&quot;, ccExe, cppflags, cflags, ldflags)
+ 		// Include the C compiler tool ID so that if the C
+ 		// compiler changes we rebuild the package.
+@@ -263,14 +265,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 			}
  		}
- 		if len(p.FFiles) &gt; 0 {
--			fmt.Fprintf(h, &quot;FC=%q %q\n&quot;, b.fcExe(), fflags)
-+			fmt.Fprintf(h, &quot;FC=%q %q\n&quot;, b.fcExe(true), fflags)
+ 		if len(p.CXXFiles)+len(p.SwigCXXFiles) &gt; 0 {
+-			cxxExe := b.cxxExe()
++			cxxExe := b.cxxExe(true)
+ 			fmt.Fprintf(h, &quot;CXX=%q %q\n&quot;, cxxExe, cxxflags)
+ 			if cxxID, err := b.gccToolID(cxxExe[0], &quot;c++&quot;); err == nil {
+ 				fmt.Fprintf(h, &quot;CXX ID=%q\n&quot;, cxxID)
+ 			}
  		}
- 		// TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?
- 	}
-@@ -2401,33 +2403,48 @@ var (
+ 		if len(p.FFiles) &gt; 0 {
+-			fcExe := b.fcExe()
++			fcExe := b.fcExe(true)
+ 			fmt.Fprintf(h, &quot;FC=%q %q\n&quot;, fcExe, fflags)
+ 			if fcID, err := b.gccToolID(fcExe[0], &quot;f95&quot;); err == nil {
+ 				fmt.Fprintf(h, &quot;FC ID=%q\n&quot;, fcID)
+@@ -2438,33 +2440,48 @@ var (
  // gccCmd returns a gcc command line prefix
  // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
  func (b *Builder) GccCmd(incdir, workdir string) []string {
@@ -157,7 +172,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  }
  
  // compilerExe returns the compiler to use given an
-@@ -2436,11 +2453,16 @@ func (b *Builder) fcExe() []string {
+@@ -2473,11 +2490,16 @@ func (b *Builder) fcExe() []string {
  // of the compiler but can have additional arguments if they
  // were present in the environment value.
  // For example if CC=&quot;gcc -DGOPHER&quot; then the result is [&quot;gcc&quot;, &quot;-DGOPHER&quot;].
@@ -175,7 +190,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	return compiler
  }
  
-@@ -2620,7 +2642,7 @@ func envList(key, def string) []string {
+@@ -2667,7 +2689,7 @@ func envList(key, def string) []string {
  }
  
  // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
@@ -184,7 +199,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	defaults := &quot;-g -O2&quot;
  
  	if cppflags, err = buildFlags(&quot;CPPFLAGS&quot;, &quot;&quot;, p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
-@@ -2639,6 +2661,14 @@ func (b *Builder) CFlags(p *load.Package
+@@ -2686,6 +2708,14 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  		return
  	}
  
@@ -199,7 +214,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	return
  }
  
-@@ -2653,7 +2683,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+@@ -2700,7 +2730,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
  
  func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
  	p := a.Package
@@ -208,7 +223,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3104,7 +3134,7 @@ func (b *Builder) swigIntSize(objdir str
+@@ -3151,7 +3181,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
  
  // Run SWIG on one SWIG input file.
  func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
@@ -217,3 +232,6 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	if err != nil {
  		return &quot;&quot;, &quot;&quot;, err
  	}
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
similarity index 78%
rename from meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
rename to meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
index 662c705471..e5d0ee90e2 100644
--- a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
+++ b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
@@ -1,7 +1,8 @@
-From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:00:00 2001
+From f7b2347869941b751b6db1dfa8461195d2a5888b Mon Sep 17 00:00:00 2001
 From: Alex Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 Date: Wed, 23 Oct 2019 21:15:37 +0430
-Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the environment
+Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the
+ environment
 
 to allow for split host/target build roots
 
@@ -17,10 +18,12 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  src/cmd/go/internal/cfg/cfg.go | 6 +++++-
  2 files changed, 8 insertions(+), 2 deletions(-)
 
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index bec17696f3..d82f612e75 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -246,7 +246,9 @@ func xinit() {
- 	workdir = xworkdir()
+@@ -248,7 +248,9 @@ func xinit() {
+ 	}
  	xatexit(rmworkdir)
  
 -	tooldir = pathf(&quot;%s/pkg/tool/%s_%s&quot;, goroot, gohostos, gohostarch)
@@ -30,9 +33,11 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  }
  
  // compilerEnv returns a map from &quot;goos/goarch&quot; to the
+diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
+index 57a3c1ff6f..825d8c70f2 100644
 --- a/src/cmd/go/internal/cfg/cfg.go
 +++ b/src/cmd/go/internal/cfg/cfg.go
-@@ -64,7 +64,11 @@ func defaultContext() build.Context {
+@@ -67,7 +67,11 @@ func defaultContext() build.Context {
  		// variables. This matches the initialization of ToolDir in
  		// go/build, except for using ctxt.GOROOT rather than
  		// runtime.GOROOT.
@@ -45,3 +50,6 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	}
  
  	ctxt.GOPATH = envOr(&quot;GOPATH&quot;, ctxt.GOPATH)
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
similarity index 78%
rename from meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
rename to meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
index cd875f1164..bc5cabeca0 100644
--- a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
@@ -1,4 +1,4 @@
-From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:00:00 2001
+From 751ab1c94df250475a8e0c6fe0272c60560a38b3 Mon Sep 17 00:00:00 2001
 From: Alex Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 Date: Wed, 23 Oct 2019 21:16:32 +0430
 Subject: [PATCH 4/9] ld: add soname to shareable objects
@@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  src/cmd/link/internal/ld/lib.go | 3 +++
  1 file changed, 3 insertions(+)
 
+diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
+index 644faeb2fb..5b7e48636e 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1343,6 +1343,7 @@ func (ctxt *Link) hostlink() {
+@@ -1342,6 +1342,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, &quot;-Wl,-z,relro&quot;)
  			}
  			argv = append(argv, &quot;-shared&quot;)
@@ -27,7 +29,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  			if ctxt.HeadType == objabi.Hwindows {
  				if *flagAslr {
  					argv = addASLRargs(argv)
-@@ -1358,6 +1359,7 @@ func (ctxt *Link) hostlink() {
+@@ -1359,6 +1360,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, &quot;-Wl,-z,relro&quot;)
  		}
  		argv = append(argv, &quot;-shared&quot;)
@@ -35,7 +37,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, &quot;-dynamiclib&quot;)
-@@ -1366,6 +1368,7 @@ func (ctxt *Link) hostlink() {
+@@ -1367,6 +1369,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, &quot;-Wl,-z,relro&quot;)
  			}
  			argv = append(argv, &quot;-shared&quot;)
@@ -43,3 +45,6 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  		}
  	}
  
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
similarity index 76%
rename from meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
rename to meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
index 59c12d9546..a7d9932f4d 100644
--- a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,4 +1,4 @@
-From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:00:00 2001
+From 4a3a4c0b51618cab8e41dc307404c8b40146a8c4 Mon Sep 17 00:00:00 2001
 From: Alex Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 Date: Wed, 23 Oct 2019 21:17:16 +0430
 Subject: [PATCH 5/9] make.bash: override CC when building dist and
@@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  src/make.bash | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/src/make.bash b/src/make.bash
+index 7986125a06..dd67029700 100755
 --- a/src/make.bash
 +++ b/src/make.bash
-@@ -178,7 +178,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; = &quot;$GOROOT&quot; ];
+@@ -181,7 +181,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; = &quot;$GOROOT&quot; ]; then
  	exit 1
  fi
  rm -f cmd/dist/dist
@@ -28,12 +30,15 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  
  # -e doesn't propagate out of eval, so check success by hand.
  eval $(./cmd/dist/dist env -p || echo FAIL=true)
-@@ -209,7 +209,7 @@ fi
+@@ -206,7 +206,7 @@ fi
  # Run dist bootstrap to complete make.bash.
  # Bootstrap installs a proper cmd/dist, built with the new toolchain.
  # Throw ours, built with Go 1.4, away after bootstrap.
--./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS &quot;$@&quot;
-+CC=&quot;${BUILD_CC:-${CC}}&quot; ./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS &quot;$@&quot;
+-./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS &quot;$@&quot;
++CC=&quot;${BUILD_CC:-${CC}}&quot; ./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS &quot;$@&quot;
  rm -f ./cmd/dist/dist
  
  # DO NOT ADD ANY NEW CODE HERE.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
similarity index 90%
rename from meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
rename to meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
index 7aee0bac43..e92cc9b28b 100644
--- a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
@@ -1,4 +1,4 @@
-From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:00:00 2001
+From fdbb0770a7e5190368c7e15ffcc2ce25fe7344e7 Mon Sep 17 00:00:00 2001
 From: Alex Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 Date: Wed, 23 Oct 2019 21:18:12 +0430
 Subject: [PATCH 6/9] cmd/dist: separate host and target builds
@@ -38,17 +38,19 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  src/cmd/dist/build.go | 155 ++++++++++++++++++++++++++++++------------
  1 file changed, 112 insertions(+), 43 deletions(-)
 
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index d82f612e75..af24e01198 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -41,6 +41,7 @@ var (
- 	goldflags        string
+@@ -43,6 +43,7 @@ var (
+ 	goexperiment     string
  	workdir          string
  	tooldir          string
 +	build_tooldir    string
  	oldgoos          string
  	oldgoarch        string
  	exe              string
-@@ -53,6 +54,7 @@ var (
+@@ -55,6 +56,7 @@ var (
  
  	rebuildall   bool
  	defaultclang bool
@@ -56,7 +58,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  
  	vflag int // verbosity
  )
-@@ -249,6 +251,8 @@ func xinit() {
+@@ -251,6 +253,8 @@ func xinit() {
  	if tooldir = os.Getenv(&quot;GOTOOLDIR&quot;); tooldir == &quot;&quot; {
  		tooldir = pathf(&quot;%s/pkg/tool/%s_%s&quot;, goroot, gohostos, gohostarch)
  	}
@@ -65,7 +67,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  }
  
  // compilerEnv returns a map from &quot;goos/goarch&quot; to the
-@@ -480,8 +484,10 @@ func setup() {
+@@ -496,8 +500,10 @@ func setup() {
  	p := pathf(&quot;%s/pkg/%s_%s&quot;, goroot, gohostos, gohostarch)
  	if rebuildall {
  		xremoveall(p)
@@ -76,23 +78,24 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  
  	if goos != gohostos || goarch != gohostarch {
  		p := pathf(&quot;%s/pkg/%s_%s&quot;, goroot, goos, goarch)
-@@ -1244,12 +1250,29 @@ func cmdbootstrap() {
+@@ -1266,13 +1272,30 @@ func cmdbootstrap() {
+ 	defer timelog(&quot;end&quot;, &quot;dist bootstrap&quot;)
  
- 	var noBanner bool
- 	var debug bool
+ 	var noBanner, noClean bool
 +	var hostOnly bool
 +	var targetOnly bool
 +	var toBuild = []string{&quot;std&quot;, &quot;cmd&quot;}
-+
+ 	var debug bool
  	flag.BoolVar(&amp;rebuildall, &quot;a&quot;, rebuildall, &quot;rebuild all&quot;)
  	flag.BoolVar(&amp;debug, &quot;d&quot;, debug, &quot;enable debugging of bootstrap process&quot;)
  	flag.BoolVar(&amp;noBanner, &quot;no-banner&quot;, noBanner, &quot;do not print banner&quot;)
+ 	flag.BoolVar(&amp;noClean, &quot;no-clean&quot;, noClean, &quot;print deprecation warning&quot;)
 +	flag.BoolVar(&amp;hostOnly, &quot;host-only&quot;, hostOnly, &quot;build only host binaries, not target&quot;)
 +	flag.BoolVar(&amp;targetOnly, &quot;target-only&quot;, targetOnly, &quot;build only target binaries, not host&quot;)
  
 -	xflagparse(0)
 +	xflagparse(-1)
- 
++
 +	if hostOnly &amp;&amp; targetOnly {
 +		fatalf(&quot;specify only one of --host-only or --target-only\n&quot;)
 +	}
@@ -104,10 +107,10 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 +			fatalf(&quot;package names not permitted without --host-only or --target-only\n&quot;)
 +		}
 +	}
- 	// Set GOPATH to an internal directory. We shouldn't actually
- 	// need to store files here, since the toolchain won't
- 	// depend on modules outside of vendor directories, but if
-@@ -1303,8 +1326,13 @@ func cmdbootstrap() {
+ 
+ 	if noClean {
+ 		xprintf(&quot;warning: --no-clean is deprecated and has no effect; use 'go install std cmd' instead\n&quot;)
+@@ -1345,8 +1368,13 @@ func cmdbootstrap() {
  		xprintf(&quot;\n&quot;)
  	}
  
@@ -123,7 +126,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	goBootstrap := pathf(&quot;%s/go_bootstrap&quot;, tooldir)
  	cmdGo := pathf(&quot;%s/go&quot;, gobin)
  	if debug {
-@@ -1333,7 +1361,11 @@ func cmdbootstrap() {
+@@ -1375,7 +1403,11 @@ func cmdbootstrap() {
  		xprintf(&quot;\n&quot;)
  	}
  	xprintf(&quot;Building Go toolchain2 using go_bootstrap and Go toolchain1.\n&quot;)
@@ -133,10 +136,10 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 +	} else {
 +		os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, goarch))
 +	}
+ 	// Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
+ 	os.Setenv(&quot;GOEXPERIMENT&quot;, goexperiment)
  	goInstall(goBootstrap, append([]string{&quot;-i&quot;}, toolchain...)...)
- 	if debug {
- 		run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/compile&quot;, tooldir), &quot;-V=full&quot;)
-@@ -1370,50 +1402,84 @@ func cmdbootstrap() {
+@@ -1414,50 +1446,84 @@ func cmdbootstrap() {
  	}
  	checkNotStale(goBootstrap, append(toolchain, &quot;runtime/internal/sys&quot;)...)
  
@@ -188,6 +191,8 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 -		timelog(&quot;build&quot;, &quot;host toolchain&quot;)
 -		if vflag &gt; 0 {
 -			xprintf(&quot;\n&quot;)
+-		}
+-		xprintf(&quot;Building packages and commands for host, %s/%s.\n&quot;, goos, goarch)
 +
 +		if goos == oldgoos &amp;&amp; goarch == oldgoarch {
 +			// Common case - not setting up for cross-compilation.
@@ -219,8 +224,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 +			os.Setenv(&quot;GOARCH&quot;, goarch)
 +			os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, goarch))
 +			xprintf(&quot;Building packages and commands for target, %s/%s.\n&quot;, goos, goarch)
- 		}
--		xprintf(&quot;Building packages and commands for host, %s/%s.\n&quot;, goos, goarch)
++		}
  		goInstall(goBootstrap, &quot;std&quot;, &quot;cmd&quot;)
  		checkNotStale(goBootstrap, &quot;std&quot;, &quot;cmd&quot;)
  		checkNotStale(cmdGo, &quot;std&quot;, &quot;cmd&quot;)
@@ -228,7 +232,12 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 -		timelog(&quot;build&quot;, &quot;target toolchain&quot;)
 -		if vflag &gt; 0 {
 -			xprintf(&quot;\n&quot;)
--		}
++		if debug {
++			run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/compile&quot;, tooldir), &quot;-V=full&quot;)
++			run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/buildid&quot;, tooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;, goroot, goos, goarch))
++			checkNotStale(goBootstrap, append(toolchain, &quot;runtime/internal/sys&quot;)...)
++			copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&quot;%s/compile&quot;, tooldir), writeExec)
+ 		}
 -		goos = oldgoos
 -		goarch = oldgoarch
 -		os.Setenv(&quot;GOOS&quot;, goos)
@@ -249,16 +258,10 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 -		run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/buildid&quot;, tooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;, goroot, goos, goarch))
 -		checkNotStale(goBootstrap, append(toolchain, &quot;runtime/internal/sys&quot;)...)
 -		copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&quot;%s/compile&quot;, tooldir), writeExec)
-+		if debug {
-+			run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/compile&quot;, tooldir), &quot;-V=full&quot;)
-+			run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/buildid&quot;, tooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;, goroot, goos, goarch))
-+			checkNotStale(goBootstrap, append(toolchain, &quot;runtime/internal/sys&quot;)...)
-+			copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&quot;%s/compile&quot;, tooldir), writeExec)
-+		}
  	}
  
  	// Check that there are no new files in $GOROOT/bin other than
-@@ -1430,8 +1496,11 @@ func cmdbootstrap() {
+@@ -1474,8 +1540,11 @@ func cmdbootstrap() {
  		}
  	}
  
@@ -272,3 +275,6 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  
  	if goos == &quot;android&quot; {
  		// Make sure the exec wrapper will sync a fresh $GOROOT to the device.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
similarity index 78%
rename from meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
rename to meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
index 4b4d0d4f3d..d522512699 100644
--- a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
@@ -1,4 +1,4 @@
-From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:00:00 2001
+From f65315faeacf0acb8a5dbbc754136e33381200f5 Mon Sep 17 00:00:00 2001
 From: Alex Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 Date: Wed, 23 Oct 2019 21:18:56 +0430
 Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default
@@ -27,9 +27,11 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
  3 files changed, 34 insertions(+)
 
+diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
+index 69940cb001..b0c1667def 100644
 --- a/src/cmd/go/internal/work/action.go
 +++ b/src/cmd/go/internal/work/action.go
-@@ -670,6 +670,9 @@ func (b *Builder) addTransitiveLinkDeps(
+@@ -673,6 +673,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
  			if p1 == nil || p1.Shlib == &quot;&quot; || haveShlib[filepath.Base(p1.Shlib)] {
  				continue
  			}
@@ -39,9 +41,11 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  			haveShlib[filepath.Base(p1.Shlib)] = true
  			// TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
  			// we'll end up building an overall library or executable that depends at runtime
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
+index 0ed2389cd5..c3f8a82880 100644
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
-@@ -167,6 +167,8 @@ See also: go install, go get, go clean.
+@@ -189,6 +189,8 @@ See also: go install, go get, go clean.
  
  const concurrentGCBackendCompilationEnabledByDefault = true
  
@@ -50,7 +54,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  func init() {
  	// break init cycle
  	CmdBuild.Run = runBuild
-@@ -179,6 +181,10 @@ func init() {
+@@ -201,6 +203,10 @@ func init() {
  
  	AddBuildFlags(CmdBuild, DefaultBuildFlags)
  	AddBuildFlags(CmdInstall, DefaultBuildFlags)
@@ -61,9 +65,11 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  }
  
  // Note that flags consulted by other parts of the code
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index a37872e7c7..f4e83b97e2 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -468,6 +468,23 @@ func (b *Builder) build(a *Action) (err
+@@ -514,6 +514,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
  		return errors.New(&quot;binary-only packages are no longer supported&quot;)
  	}
  
@@ -87,7 +93,7 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1520,6 +1537,14 @@ func BuildInstallFunc(b *Builder, a *Act
+@@ -1558,6 +1575,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
@@ -102,3 +108,6 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
similarity index 84%
rename from meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
rename to meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
index 4e5d5021d6..9a1bce809c 100644
--- a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
+++ b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
@@ -1,4 +1,4 @@
-From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:00:00 2001
+From 1446c2c3cc6b1c66d9ef9507eb596c5bfed3dc47 Mon Sep 17 00:00:00 2001
 From: Alex Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
 Date: Wed, 23 Oct 2019 21:19:26 +0430
 Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set buildmode
@@ -23,9 +23,11 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  src/cmd/go/internal/work/build.go | 8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)
 
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
+index c3f8a82880..23d1aa4836 100644
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
-@@ -254,7 +254,13 @@ func AddBuildFlags(cmd *base.Command, ma
+@@ -275,7 +275,13 @@ func AddBuildFlags(cmd *base.Command, mask BuildFlagMask) {
  
  	cmd.Flag.Var(&amp;load.BuildAsmflags, &quot;asmflags&quot;, &quot;&quot;)
  	cmd.Flag.Var(buildCompiler{}, &quot;compiler&quot;, &quot;&quot;)
@@ -40,3 +42,6 @@ Signed-off-by: Alexander J Kube <a class="moz-txt-link-rfc2396E" href="mailto:alexander.j.kube@gmail.com">&lt;alexander.j.kube@gmail.com&gt;</a>
  	cmd.Flag.Var(&amp;load.BuildGcflags, &quot;gcflags&quot;, &quot;&quot;)
  	cmd.Flag.Var(&amp;load.BuildGccgoflags, &quot;gccgoflags&quot;, &quot;&quot;)
  	if mask&amp;OmitModFlag == 0 {
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
similarity index 75%
rename from meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
rename to meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
index dcbdf58752..f8bd491f93 100644
--- a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
+++ b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
@@ -1,7 +1,7 @@
-From a983bc6cd48fb0da939e3329cac18d7a3b29ecf8 Mon Sep 17 00:00:00 2001
+From c5f3c1aa77753254586c0c8a6893862ae97eabe1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Date: Mon, 22 Feb 2021 17:54:01 -0800
-Subject: [PATCH] Revert &quot;cmd/go: make sure CC and CXX are absolute&quot;
+Subject: [PATCH 9/9] Revert &quot;cmd/go: make sure CC and CXX are absolute&quot;
 
 OE uses CC/CXX values which consists of cmpiler and options together,
 secondly, the environment is canned so this check add little value to OE
@@ -16,47 +16,44 @@ This reverts commit aa161e799df7e1eba99d2be10271e76b6f758142.
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 ---
- src/cmd/go/internal/envcmd/env.go        |  5 -----
+ src/cmd/go/internal/envcmd/env.go        |  2 +-
  src/cmd/go/internal/work/init.go         |  7 -------
  src/cmd/go/testdata/script/env_write.txt | 24 ------------------------
- 3 files changed, 36 deletions(-)
+ 3 files changed, 1 insertion(+), 32 deletions(-)
 
 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index 6937187522..29f9057c3f 100644
+index ff6f0d810a..ca0494b5d4 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -427,11 +427,6 @@ func checkEnvWrite(key, val string) error {
- 		if !filepath.IsAbs(val) &amp;&amp; val != &quot;&quot; {
+@@ -458,7 +458,7 @@ func checkEnvWrite(key, val string) error {
  			return fmt.Errorf(&quot;GOPATH entry is relative; must be absolute path: %q&quot;, val)
  		}
--	// Make sure CC and CXX are absolute paths
--	case &quot;CC&quot;, &quot;CXX&quot;:
--		if !filepath.IsAbs(val) &amp;&amp; val != &quot;&quot; &amp;&amp; val != filepath.Base(val) {
--			return fmt.Errorf(&quot;%s entry is relative; must be absolute path: %q&quot;, key, val)
--		}
- 	}
- 
- 	if !utf8.ValidString(val) {
+ 	// Make sure CC and CXX are absolute paths
+-	case &quot;CC&quot;, &quot;CXX&quot;, &quot;GOMODCACHE&quot;:
++	case &quot;GOMODCACHE&quot;:
+ 		if !filepath.IsAbs(val) &amp;&amp; val != &quot;&quot; &amp;&amp; val != filepath.Base(val) {
+ 			return fmt.Errorf(&quot;%s entry is relative; must be absolute path: %q&quot;, key, val)
+ 		}
 diff --git a/src/cmd/go/internal/work/init.go b/src/cmd/go/internal/work/init.go
-index ba7c7c2fbb..3a6df5f758 100644
+index 37a3e2d0ff..e529cc2917 100644
 --- a/src/cmd/go/internal/work/init.go
 +++ b/src/cmd/go/internal/work/init.go
-@@ -41,13 +41,6 @@ func BuildInit() {
+@@ -38,13 +38,6 @@ func BuildInit() {
+ 		}
  		cfg.BuildPkgdir = p
  	}
- 
+-
 -	// Make sure CC and CXX are absolute paths
 -	for _, key := range []string{&quot;CC&quot;, &quot;CXX&quot;} {
 -		if path := cfg.Getenv(key); !filepath.IsAbs(path) &amp;&amp; path != &quot;&quot; &amp;&amp; path != filepath.Base(path) {
 -			base.Fatalf(&quot;go %s: %s environment variable is relative; must be absolute path: %s\n&quot;, flag.Args()[0], key, path)
 -		}
 -	}
--
- 	// For each experiment that has been enabled in the toolchain, define a
- 	// build tag with the same name but prefixed by &quot;goexperiment.&quot; which can be
- 	// used for compiling alternative files for the experiment. This allows
+ }
+ 
+ func instrumentInit() {
 diff --git a/src/cmd/go/testdata/script/env_write.txt b/src/cmd/go/testdata/script/env_write.txt
-index bda1e57826..c99aadb7f2 100644
+index b5e9739167..566c876658 100644
 --- a/src/cmd/go/testdata/script/env_write.txt
 +++ b/src/cmd/go/testdata/script/env_write.txt
 @@ -129,30 +129,6 @@ go env -w GOTMPDIR=
@@ -91,5 +88,5 @@ index bda1e57826..c99aadb7f2 100644
  env GOOS=
  env GOARCH=
 -- 
-2.30.1
+2.25.1
 
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb b/meta/recipes-devtools/go/go-binary-native_1.17.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.bb
index b3e2b6a60e..2b3db17d3b 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707">&quot;file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707&quot;</a>
 PROVIDES = &quot;go-native&quot;
 
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}">&quot;https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}&quot;</a>
-SRC_URI[go_linux_amd64.sha256sum] = &quot;b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061&quot;
-SRC_URI[go_linux_arm64.sha256sum] = &quot;d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799&quot;
+SRC_URI[go_linux_amd64.sha256sum] = &quot;6bf89fc4f5ad763871cf7eac80a2d594492de7a818303283f1366a7f6a30372d&quot;
+SRC_URI[go_linux_arm64.sha256sum] = &quot;01a9af009ada22122d3fcb9816049c1d21842524b38ef5d5a0e2ee4b26d7c3e7&quot;
 
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://golang.org/dl/">&quot;https://golang.org/dl/&quot;</a>
 UPSTREAM_CHECK_REGEX = &quot;go(?P&lt;pver&gt;\d+(\.\d+)+)\.linux&quot;
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.5.bb b/meta/recipes-devtools/go/go-cross_1.17.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.5.bb
rename to meta/recipes-devtools/go/go-cross_1.17.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.5.bb b/meta/recipes-devtools/go/go-native_1.17.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.5.bb
rename to meta/recipes-devtools/go/go-native_1.17.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.5.bb b/meta/recipes-devtools/go/go-runtime_1.17.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.bb
diff --git a/meta/recipes-devtools/go/go_1.16.5.bb b/meta/recipes-devtools/go/go_1.17.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.5.bb
rename to meta/recipes-devtools/go/go_1.17.bb
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5E8E6861E2C9115C1DC37502--
