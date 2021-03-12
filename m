Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.66])
 by mx.groups.io with SMTP id smtpd.web08.5334.1615536030971920764
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 00:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=E/C9BXnx;
 spf=pass (domain: windriver.com, ip: 40.107.101.66, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHKmmAoXzwrNK3Uxclh19cG+RZgvM5gYoi2dzjxQ/SL7FKIWNK5JNDKCoIFRpVzkIRKhzu4XHzvBD4P4Ja/P6X4sSOk3xM2yRJ48lFA9afFWw04BhDWxgarmRIZM3MWBQPdA194VuGI1ZYYvB1qsxJBwOCL5cf2z8yefCVLyf84Xmt5bTz+9L9V0Ds6cNePWMGBY2ThCrkEFfo/jjA23EXuoFEfCRE13WnfaCRJp3mQD2305Zy5HYTX0CLMrBcziJ1c3YK1HAT+angiRIMvdBZ4aEP0PQLlhPVX4CQMQDCbKxzRStaA8a94+BJPZcRbgYpM+qWYG9h9z24zzRROZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDaP/LC1uilsazjUNrgfUejrKR95K27DrhaUcFJHoIQ=;
 b=FNzGaG4lN5ilIK+ITJiBIYdoVIdVTVp4Su9+7SnLZh9WIqOsDLmbLG2flGrweNjSBmHorAZcbAD3PFV6LJPkLJkyan2wwZAiATJAeh08yAcAwQ8TAokKrFTrOuYLgijSt6onF7QpXklh7SHi6D8Z3T+r9AtNzkWIroxflBOb7Iz7CuvZlDBuJYsVfMvuyyb6Pk/kVvW08XzVLiRhzmO65iO3apdQobXS2cjH3JYuk69NRgVeOppZMZRwVoi9t5PpMDD8HDU8YKnVMnljQFlL0Lc30nSpN1LWhRFk6zj4yggKp8wFbQg+r6lzr4iev4RT7HQF1nNZBZpVljKyeU9cPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDaP/LC1uilsazjUNrgfUejrKR95K27DrhaUcFJHoIQ=;
 b=E/C9BXnxg0AvGE2rxcplXuukSwcgTJIk7dd67Nz7e9myX2ppx3+PYHetNNEuYvfuu7Qjai8VYwnuwk3rJ0J3ymoQQS5yn6Dq5ovSoTyfmmtGxd8AAhBZXQQFSvmRsE+eUYrfS6/FVRrp0FJjbxtnYY3tPOqBPyGsfdzzy3NkwN0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB3736.namprd11.prod.outlook.com (2603:10b6:a03:f6::10)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 08:00:29 +0000
Received: from BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9]) by BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9%7]) with mapi id 15.20.3890.041; Fri, 12 Mar 2021
 08:00:29 +0000
Subject: Re: [OE-core] [PATCH 1/1] image.bbclass: deltask do_packagedata
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Martin Jansa <Martin.Jansa@gmail.com>
CC: openembedded-core@lists.openembedded.org, steve@sakoman.com,
 anibal.limon@linaro.org
References: <cover.1615452338.git.liezhi.yang@windriver.com>
 <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
 <20210311090200.33p3mptsfwusspwa@jama>
 <64d5a49eeb455d812d7d5e30dfc2c63394d97ff7.camel@linuxfoundation.org>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <fba65a47-7d0c-e0b4-3ea8-aad55b66bd62@windriver.com>
Date: Fri, 12 Mar 2021 15:59:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <64d5a49eeb455d812d7d5e30dfc2c63394d97ff7.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0063.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::27) To BYAPR11MB3736.namprd11.prod.outlook.com
 (2603:10b6:a03:f6::10)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by HK0PR01CA0063.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 08:00:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1d2e48d-6b56-464a-871e-08d8e52ce6cf
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4958:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4958E7A5DBEE93A08F27A265FF6F9@SJ0PR11MB4958.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kasryvy+whTTvf9Ws1GFDVm6LekHvS3Pg6/ksrLhq6ReIZa39KzGrN+M9s2oAmkMyrWuxuHJEtwnh1m8PI2lZQDsn/Kiuwqk4VaenLxNYmLDjm6R9bGE37AeiUKTqhXZSlDtyL1gI9P63pyNKxHn5uO+QAG5yJrOiruEhwGBSiN78Vau3fRo3s/qfyMMCGRYt2/+m/m3sXd06rkCtfMlJgMUU7to+PwVFiLEt7gtOBMXzw7u17+1gN9lEBSiHOe0id6XMUrnYAh9a7c/gFgxoU5hEpeaYEGmp6+2J/nygtgWQyh1CtbrBU6S1/LV8TL/aoPgWBMIjidO00nKfcUBkYuqKClqJAFNlibyU/q/gru4N4RY1F7fFZ1Dwj2bF8d6AB8Bot/oxACz7ZaNHvTmG4dUVGu+VSuXeh4AoYyPHKbaNpsJCec8M1rmNC1YOjJ71N7Z6CzNG9ziKeiQp8qdcvlbhqWWyUUDJQmoGEq34V38cwd0stUcggUKg88B4q2lTc+XLcMXmiF+bZPN948DxoawMv5ChhEQAXL89bqIC5Knbwj1oUQ6Z48ou1atuHYO6UvYFO35KucZpFCMbmBYIRwFnU05NMTQSZmIIhQKFi8kDsFZYQF8TxMY9j6P4Mm94XrfSyJoTcr1Vjx4XTO56zRKQJjCyNaY+aJqs63xhgDo9SYa4nCOvXDlv7lYK8H/VDnpwZCTBk9KaPo5z2L2qg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(66556008)(478600001)(186003)(5660300002)(966005)(16526019)(8676002)(53546011)(66476007)(8936002)(316002)(26005)(6706004)(110136005)(16576012)(66946007)(4326008)(6666004)(83380400001)(2906002)(2616005)(956004)(31696002)(36756003)(6486002)(86362001)(31686004)(52116002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?YKlT903bc6Ikg8/jgQHRbySw/g89gYA8+CvFMFDRt4XNWRNnB8i4YVZZuUYM?=
 =?us-ascii?Q?2oRoMmaSg8MuAaj5TJrjOOJYNJm5ltmT0yocAVIZwTjMZFOSO0H8tYZuaBhI?=
 =?us-ascii?Q?O0jDBeACxgwFsTaXFALqUIvOHTP7z5OhSJz09pzZhASS/xAHmr+/2CiVyGEb?=
 =?us-ascii?Q?1qm4nvrL+4Fbu0fS4uYoqN0QCt/uCCQDbddGmE98pAfY8z/1s7JB4Jp/mU8U?=
 =?us-ascii?Q?zSOCLFBCwrmp2usATquTD1imOsoC48fDT8JeKJfeSL6MRYLZ+vFa16RfbnV9?=
 =?us-ascii?Q?ZSoOHZKNklDudYKKDphdrVameQGaUw2Kfjq60dCZyz71hISduptvwek0D7kN?=
 =?us-ascii?Q?zyK4EqObLlBhVxEd1zMG3fdx1GIJZeBds6xlwRTbQ3qK65xtNyzQPbPzxcQW?=
 =?us-ascii?Q?OaccMbxNuJxRCYDwwPL4smy6vi37NwiS46EEXM4RpfwpaYYDeLgcv0u4eUJ9?=
 =?us-ascii?Q?+umuq2sBie38XCETyEtUzOG11uMwkruFiOhskUNKiImZ/rM2MwIMzWdZ64A/?=
 =?us-ascii?Q?1Zd20MqTeG21sRzFlsy0JIXkynxgL3CyYkmIdaRvLj1uwODxzVnSD7rSQgjk?=
 =?us-ascii?Q?Vrhslo19l4MXQ72OEVV9oXtddFzH688nlvf9qJPkV38qGqgF/3DAeLKg2mmC?=
 =?us-ascii?Q?h4qa9DKXPg2ZmSt2EonZZRKXRW9dXjngi26ukXkwZI8YzU0mZk27AoswymQn?=
 =?us-ascii?Q?eq69wxzoWX0TFYCTucVyV1oEJ8aK6MXKeJzcWIRue8zd4AXFXTpQfeP0CBEG?=
 =?us-ascii?Q?Pb1Hiy+sPqNE8dKMn1VdesvABj+B+ZuiHXpAAKr12EVQnPwR16YLQjkxig0g?=
 =?us-ascii?Q?vNs8GfRb1vwlCI+pdwHYJNSOCH81IkqXLjykjHzT6EaHVmYiKg0F+vkHk95V?=
 =?us-ascii?Q?pNdYgu6XWZVd2lXLZ9aArtXo+0eL9PW1ezqr12YMkr1qzoxLlfikK+jQVjlV?=
 =?us-ascii?Q?KsC1l7fTWEVf4BNRVdgK037/+8sZZjIAeneYMN6WqU+GRea72ZWyKr0XGeb9?=
 =?us-ascii?Q?kqh9T6M9u++S456YWm0r/AqpY9InQEoaELt72JTS1Jj/8fVR9dG3v+EimTCE?=
 =?us-ascii?Q?tEvnUpYpDyaaXoQFydv/oHYv4cIaz/d9a6f55dsB21hlBPSvem6xVT9d+5kd?=
 =?us-ascii?Q?54Hz3uVo3YLPU2fKFKiSmwBRXllAKW4oi8uwP0hNLbdzmds3Qi4KuCH3WIBI?=
 =?us-ascii?Q?zlawRkiPQtRBapjekLM1KQrTkoXcY3Lk96o+eVCiAgCcls9Ym5eofRQOMNfW?=
 =?us-ascii?Q?dyvaOBnejT8k8pWU6he+odtF417/yZH6klUgue3hfY459F+HE3UOe7k1ymk6?=
 =?us-ascii?Q?+JqSQ4+TSIbH2Bz2sgHpTf9R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d2e48d-6b56-464a-871e-08d8e52ce6cf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 08:00:29.0474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/GcoCefQXxdXmnX/hE8NZFBv5iiN9PoKaYbHtqK8he8rxgfxwdBNK6P2Fcy7zVtUThPY1fcf6xZTGOunRjtraCG0gzUfoCE+dC6yyeH1SA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi RP,

On 3/11/21 10:38 PM, Richard Purdie wrote:
> On Thu, 2021-03-11 at 10:02 +0100, Martin Jansa wrote:
>> On Thu, Mar 11, 2021 at 12:46:22AM -0800, Robert Yang wrote:
>>> This can fix a do_package error when compile with meta-secure-core laye=
r:
>>> http://layers.openembedded.org/layerindex/branch/master/layer/meta-secu=
re-core/
>>>
>>> $ bitbake kernel-initramfs
>>> [snip]
>>> WARNING:kernel-initramfs-1.0-r0 do_package: Manifest
>>> build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-secure-=
core-image-initramfs.packagedata
>>> not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch x86_64_x86_=
64-nativesdk (variant '')?
>>> [snip]
>>>
>>> This is because kernel-initramfs wants to pack an initramfs image into
>>> kernel-initramfs.rpm which adds a dependency in kernel-initramfs.bb to =
do this:
>>>
>>> d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_=
complete')
>>>
>>> This causes kernel-initramfs' do_package depends on
>>> ${INITRAMFS_IMAGE}:do_image_complete's do_packagedata, then we will get=
 the
>>> error. Delete do_packagedata as other do_package relelated tasks for th=
e image
>>> recipe will fix the error.
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>
>> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>> I went a bit further and inheritted nopackages, but RP mentioned that it
>> might be removing too much. Nothing failed with nopackages over night,
>> but still this smaller version will be safer as this needs to got to
>> gatesgarth and dunfell as well now.
>=20
> This has side effects and there was a reason this wasn't done originally.=
=C2=A0The
> trouble is that nobody is testing for that, just wanting to fix the probl=
em
> they see. To prove this isn't straightforward, I tested this locally, com=
paring
> task-depends.dot from "bitbake core-image-sato -g" before and after this =
patch.


If we want to avoid disconnecting them, it seems that a better way is fixin=
g=20
this in the recipes which has this problem? For example, I got this error i=
n
secure-core-image-initramfs.bb, then we can add "deltask do_packagedata" in=
 the
recipe to fix the problem.

@Martin maybe we shouldn't backport this patch to gatesgarth or dunfell sin=
ce
it may suprise the users.

// Robert

>=20
> The differences were:
>=20
> @@ -11036,7 +11036,6 @@
>   "core-image-sato.do_build" -> "connman.do_build"
>   "core-image-sato.do_build" -> "consolekit.do_build"
>   "core-image-sato.do_build" -> "core-image-sato.do_image_complete"
> -"core-image-sato.do_build" -> "core-image-sato.do_packagedata"
>   "core-image-sato.do_build" -> "core-image-sato.do_populate_lic_deploy"
>   "core-image-sato.do_build" -> "coreutils.do_build"
>   "core-image-sato.do_build" -> "cross-localedef-native.do_build"
> @@ -11459,14 +11458,6 @@
>   "core-image-sato.do_build" -> "zip.do_build"
>   "core-image-sato.do_build" -> "zlib-native.do_build"
>   "core-image-sato.do_build" -> "zlib.do_build"
> -"core-image-sato.do_compile" [label=3D"core-image-sato do_compile\n:1.0-=
r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
> -"core-image-sato.do_compile" -> "core-image-sato.do_configure"
> -"core-image-sato.do_configure" [label=3D"core-image-sato do_configure\n:=
1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
> -"core-image-sato.do_configure" -> "core-image-sato.do_deploy_source_date=
_epoch"
> -"core-image-sato.do_configure" -> "core-image-sato.do_patch"
> -"core-image-sato.do_configure" -> "core-image-sato.do_prepare_recipe_sys=
root"
> -"core-image-sato.do_deploy_source_date_epoch" [label=3D"core-image-sato =
do_deploy_source_date_epoch\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/=
images/core-image-sato.bb"]
> -"core-image-sato.do_deploy_source_date_epoch" -> "core-image-sato.do_pat=
ch"
>   "core-image-sato.do_fetch" [label=3D"core-image-sato do_fetch\n:1.0-r0\=
n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
>   "core-image-sato.do_flush_pseudodb" [label=3D"core-image-sato do_flush_=
pseudodb\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-s=
ato.bb"]
>   "core-image-sato.do_flush_pseudodb" -> "core-image-sato.do_rootfs"
> @@ -11489,18 +11480,6 @@
>   "core-image-sato.do_image_qa" -> "core-image-sato.do_rootfs"
>   "core-image-sato.do_image_tar" [label=3D"core-image-sato do_image_tar\n=
:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
>   "core-image-sato.do_image_tar" -> "core-image-sato.do_image"
> -"core-image-sato.do_install" [label=3D"core-image-sato do_install\n:1.0-=
r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
> -"core-image-sato.do_install" -> "core-image-sato.do_compile"
> -"core-image-sato.do_install" -> "pseudo-native.do_populate_sysroot"
> -"core-image-sato.do_package" [label=3D"core-image-sato do_package\n:1.0-=
r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
> -"core-image-sato.do_package" -> "core-image-sato.do_install"
> -"core-image-sato.do_package" -> "pseudo-native.do_populate_sysroot"
> -"core-image-sato.do_packagedata" [label=3D"core-image-sato do_packagedat=
a\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"=
]
> -"core-image-sato.do_packagedata" -> "core-image-sato.do_package"
> -"core-image-sato.do_patch" [label=3D"core-image-sato do_patch\n:1.0-r0\n=
/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
> -"core-image-sato.do_patch" -> "core-image-sato.do_unpack"
> -"core-image-sato.do_patch" -> "patch-native.do_populate_sysroot"
> -"core-image-sato.do_patch" -> "quilt-native.do_populate_sysroot"
>   "core-image-sato.do_populate_lic_deploy" [label=3D"core-image-sato do_p=
opulate_lic_deploy\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/co=
re-image-sato.bb"]
>   "core-image-sato.do_populate_lic_deploy" -> "acl-native.do_populate_lic=
"
>   "core-image-sato.do_populate_lic_deploy" -> "acl.do_populate_lic"
> @@ -12036,7 +12015,6 @@
>   "core-image-sato.do_rootfs" -> "consolekit.do_package_write_ipk"
>   "core-image-sato.do_rootfs" -> "consolekit.do_packagedata"
>   "core-image-sato.do_rootfs" -> "consolekit.do_populate_lic"
> -"core-image-sato.do_rootfs" -> "core-image-sato.do_packagedata"
>   "core-image-sato.do_rootfs" -> "core-image-sato.do_prepare_recipe_sysro=
ot"
>   "core-image-sato.do_rootfs" -> "coreutils.do_package_qa"
>   "core-image-sato.do_rootfs" -> "coreutils.do_package_write_ipk"
> @@ -13257,8 +13235,6 @@
>   "core-image-sato.do_rootfs" -> "zlib.do_package_write_ipk"
>   "core-image-sato.do_rootfs" -> "zlib.do_packagedata"
>   "core-image-sato.do_rootfs" -> "zlib.do_populate_lic"
> -"core-image-sato.do_unpack" [label=3D"core-image-sato do_unpack\n:1.0-r0=
\n/media/build1/poky/meta/recipes-sato/images/core-image-sato.bb"]
> -"core-image-sato.do_unpack" -> "core-image-sato.do_fetch"
>   "core-image-sato.do_write_qemuboot_conf" [label=3D"core-image-sato do_w=
rite_qemuboot_conf\n:1.0-r0\n/media/build1/poky/meta/recipes-sato/images/co=
re-image-sato.bb"]
>   "core-image-sato.do_write_qemuboot_conf" -> "core-image-sato.do_rootfs"
>   "coreutils.do_build" [label=3D"coreutils do_build\n:8.32-r0\n/media/bui=
ld1/poky/meta/recipes-core/coreutils/coreutils_8.32.bb"]
>=20
> i.e. it "disconnects" do_rootfs from the existing unpack/patch/configure/=
compile
> /install/package tasks. I know last time we tried this I got several comp=
laints
> from users who use these tasks for things.
>=20
> I'm not sure how we fix this but it isn't straightforward, particularly f=
or
> something which people are going to want backports into the LTS for.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
