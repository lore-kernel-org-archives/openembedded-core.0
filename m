Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED46C38142
	for <webhook@archiver.kernel.org>; Sat, 28 Jan 2023 01:59:12 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.40])
 by mx.groups.io with SMTP id smtpd.web10.4993.1674871143309468117
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 17:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=IcvwD2to;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.40, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz6Fh1CLpSogq7BwzLqim1VX++9LSVAxI46N6es7DMcQ+4ddzqCJFPOZbeTjFOWyDNIec8yPBoZ0nrEvhfOp6z8u1WD/93thlUqCkTVTCSXBPusGHMpJs/hijd1PmZiDtYaq7hNSLkOHDI7OPpf+GFV5X83Ua/dwA6D+GTGLYowKmq9JXzIngDUVMGqXgOwtYX5hStsBf7fg5VNpTrdWWCEMUZg8LTnLVlJwux06o+i6M+15TLteVXhMTOQocd8MEIFPAsdocAbMJO5f2LUXJu6xxr0QfYaCo8uRXHrPO9uNBA+CGzkqRm245oT/EDe3xCtWP4/QDIy1OE9xVdtZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGCqt612KztKDB6Vt2GMeq7njexzdAlhBYsxpiorOqg=;
 b=j2rFs2k15osIn6J8g2f6Oixp2iYEiaUjN334T8XZdySu8G840NMyT3kTNFtKEuZOxkJ2mvtyULiWFOsLemhgkOE3V6wik8Uwmpxj5AO2lPWJVtYjRpy8GioGO6GoPPKw4G2PjT6t94aWlFkqdI9+umaeeUOSkKynH/n8Zc0NOmx/B8p7hZCxkxQdMjDODfqCG6nk5rrP409TR+O/Ev5722XpTF1je8ItLJKGjfeSxfUjTK3ECtnOz89qypWlaQ/s43glnGbu++WZKj2ls/62uXDSg8jY0l2cBHW8TTCGCYzMcKaq8mmLS8OPCmBAdF+7FG2ds0+RPs/Ppn+kSUKnNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGCqt612KztKDB6Vt2GMeq7njexzdAlhBYsxpiorOqg=;
 b=IcvwD2toBxzDIPipVhuHcnybpm6xc3Njk4n8y27oKoopYBYsottAuqw4NB/MLOCyYEOm+9NBCacL4j/lha1dwbhQDtwTOOfHThE+MNWhX/N4P+BarjfPkD0sjVeLpIepdVrqZIRBh/5OY5hd6Kh5NY7O6xM87LqfChyjsF7ngp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by LV2PR12MB5872.namprd12.prod.outlook.com (2603:10b6:408:173::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Sat, 28 Jan
 2023 01:58:59 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752%5]) with mapi id 15.20.6043.025; Sat, 28 Jan 2023
 01:58:59 +0000
Content-Type: multipart/alternative;
 boundary="------------0NwqEND0RwVWRmpJnZSgjosR"
Message-ID: <8fe3c3e3-8356-eacc-627d-75896b0508cf@amd.com>
Date: Fri, 27 Jan 2023 18:58:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: python3-bqplot build issues
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>
Cc: "Hatle, Mark" <mark.hatle@amd.com>,
 Openembedded Core <openembedded-core@lists.openembedded.org>
References: <cccfbf0c-5bb9-45f2-db6d-4d2692a7b729@amd.com>
 <CANx9H-BuquWnmXAcRmzDdpwgxtKE_-+BbdvEKHnEXvmEsHrOPA@mail.gmail.com>
 <10b31bd2-c183-122f-fa53-292ca5c5db6c@amd.com>
 <CANx9H-AuMKCpjs9FmWXfs_TsXXcz4Qq9LcWcZV2UrErsGtLNmw@mail.gmail.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CANx9H-AuMKCpjs9FmWXfs_TsXXcz4Qq9LcWcZV2UrErsGtLNmw@mail.gmail.com>
X-ClientProxiedBy: BYAPR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::49) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|LV2PR12MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d1391a-d077-440b-8f0e-08db00d338d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sxPM59h7lIvVdQd/c7go4fiaytncNozgTHBEBdoJ4/rj0stHDiEVp/BAEIdIZP45wQZ1WzYbwRrb92PEG/flbm6ylExq/alkfvdMgjorGE2+1KZZSOTohZTTBlOgXYtY/Lts3Wn5gP7ueQTWNK86o0++Ep7/5q2NCCRAh443OdosDqq7wC94gWi/ALBLnBpMIZ1icS0PNyrB4mYG4p08yqjqSyuBDfm3SkOvUwRRTmgR+3Y4lg2SUgprRUU+cmnepBzW/KxaDUNoNlLnEqzVB3R7k797NBYXVHUJo1U2TTHVIe6nOxVbN89KCLhgoAejlVn7GhlHFlhT/p//01kf3qboEgAoqe3Z7a1HwjhDx9+7aaewdCs/q2xx1mPKINu+GUrJuTv1FQSMYdvHbgNbuFZvvm/k8NjnWQRjxa1tlykrHdjrxh4wsIyV0p7/WImtj1kzkhMPKiVoxNLjKxQ7Cw3uXEnq7HAFYGgD2etFd8/oVZ08hPy+KFx1dj+jo2S9b7d9kOWRbAR6PndVbT4Ka40U7gi8gTv1E1plxCjuri6ldKM3m9p/RwokvX7vM0Odl3LPh7oPQ77o8VR118AJJtCFGqzujZDjX2y1porQuSVBkDo90fX8a/4LoNwWNWAqOIAHjbamefplmNxe5ixGKOqSU8w1fOSzOrT/KyJNlgARcwnr4cYJ2K0Us7hDM0+cmA56SzJInkJgeT6BAzFu5/6Z8pu5OaDyP/47yjEZmGem8BOe3WaNcHvxPFFwlmzorSlnhrOJ7dmozMP6xmDeLW9B+D6g5o/u9EQzND3lOK1jgssYZqDaRiwwIsFJe9/r
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(34036004)(396003)(376002)(39860400002)(136003)(451199018)(2906002)(30864003)(8936002)(5660300002)(31686004)(8676002)(83380400001)(86362001)(508600001)(41300700001)(53546011)(6666004)(6512007)(4326008)(6506007)(54906003)(66946007)(26005)(966005)(186003)(6486002)(66556008)(66476007)(38100700002)(2616005)(6916009)(33964004)(316002)(36756003)(41320700001)(31696002)(166002)(45980500001)(43740500002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0pGVEtZOEprcmRxalZuUTJ0TFdpVDZrWlAwSW1vMVVDY2xtdHAzYlQ3VU5m?=
 =?utf-8?B?SEp3Z01hM1VIb1RhQXVING9DdU0waUd3cHFBSDhGLy9wQ292aUdGZzVlTmRj?=
 =?utf-8?B?Y2kwMlM5UVhpSnJHRFRBOGZ2bGpUcjVCM29NbXhyeFF6NUVjRGxQTUI2MG9T?=
 =?utf-8?B?bFZ1TzVRbnFCK2NTbDVmUzQzTUFZSXNvZFovWG9aaUV1Z0xQb0pIOE5yWEdq?=
 =?utf-8?B?QW1nTmpaR28yaC9IakpIN3laaWZJQk9oUFJMNlpVZ1NJY3lGVWdtUEx4WmZk?=
 =?utf-8?B?SmwzRDQyTzlocXliWlBNZGxpVG1OSW00VWpjVmlDQlgwVEFzOThxRFdLdnVN?=
 =?utf-8?B?MUwxQWEwMmtxRWRuR2ZRd1VHTzFtWWFUTFRtZ0FZVTV5bU44eVVRSHNieTBY?=
 =?utf-8?B?c2pHYUFCWm9NMWR5NW9DWG1PUDQxN0p5aGdlYk5rODlZT3lXMW1KczRKd1do?=
 =?utf-8?B?a2E2RzBRY29WMkFIWTdrZ3JDUmdOVWQrMHRZYi83K0V2TW9GUFdOMVNyVjlX?=
 =?utf-8?B?QXZLaVNhcFErSFB2T2Q1T1Y1WVROMndVRnAyTVp3alBKcllLbGViSWVqVzF6?=
 =?utf-8?B?ZXMxZ1pOSS80L2sycVRvcGVCNEVSYlJQVS8zU1ltY3dNMzBDelg4bHNzUHp4?=
 =?utf-8?B?YllOdW5yLy9ZeGQ4OHRHRE0yVHUxUy9TSDNobDUyQ1NYOVUzVUZyd3NQTWVi?=
 =?utf-8?B?S3VkY0grbjFpc09leGJxVGo5bFR4S2tGUzU0OXlpT2xJcGo5L1BKZG5odzZ2?=
 =?utf-8?B?TjhZaU16ekoxUk11Wk8wbjhzVDZhQmtKK01pYkNMN0RTcXZUZzVtMjdyNFQz?=
 =?utf-8?B?ZjZRZTN0OXhRRm8yckpZQzFuWkw2bzQyOXVhVGplbmxETXY5MjFRRW8xbGVK?=
 =?utf-8?B?WFBLNkRZbExJbi9ydlpRb1liM0lnRUtDM0pDVWJvZ1ZCN2ZobS85QXUzbGd2?=
 =?utf-8?B?NWpUQ3czZ3dWTFAvKzhzUjQ1aTM5a3lTRkwvUjZVZlRuaHJ1bEtuUjRuWllt?=
 =?utf-8?B?dGtHNkVEQVNKcjh5Tm5hcTIwN1YvdlFWc2FORTZzK3FFblFjdHNkNHBhMUIz?=
 =?utf-8?B?VkRPMEZwZng3cVpoT0cxWXFwZkVQMVYxcittaEt2TmgrNU1LYTd2YzFFcnZz?=
 =?utf-8?B?akN0bWF4QWJ0cThSSkxhR2p5MVhOUTh1RDEzOHNCb3o2dER4cUFlNTNMT0pY?=
 =?utf-8?B?NUlDN1VCQTdrUTR2T00vcElzdGlOTGR3V2dpMkxuWVFDWis1SlNtM29pSkxE?=
 =?utf-8?B?emc0QmI4R1ZreklMUHdzZzhScEJpS3psbHZxaTQ0K2tQazhiOStkUlNnREZk?=
 =?utf-8?B?TGJRWlMyZ0FFcm1NUFRHWW91d1ZjdFBIVmVmVVJOU3g0SWhYRkY5WlNTRFVK?=
 =?utf-8?B?QmcrYStWQXB0WW5ETEM4UFVBWjhyT0E2ZVFhR09GSE80WHB5cFR4R1orS2pt?=
 =?utf-8?B?MU5zN2FuMEVMZk9rMXdUdkxwWG9USEpjeStnRXNKQlNTMHVBVk54b2EvQ212?=
 =?utf-8?B?RUhNOUpOdDZ1SGhIWG5PbGtoOEE1azlrY01SckJrTWlHMlEvQm14dmx2Y3dZ?=
 =?utf-8?B?ZU52YnNCWlFiZDd3emcxdnBLdWx1WVZMM3k1aHhHbUU1enFPNGxCOHlLam5M?=
 =?utf-8?B?bk01Mml4M2NTbC9oZlNHaWJxaXJaTEZ2dCszMGpZWTcyM2FwV2FwQlU1WDhr?=
 =?utf-8?B?K1J3SGZxaUhQV0VtUUIzRjdoTWU4eityUDBpK05JckpoSkk5Tnp5dVhJQytJ?=
 =?utf-8?B?TmZtbjloMUpsaUJNOWFWMnVDNVA0akV6NytWUVZNSmN6eis4R3k3cEVWRGl1?=
 =?utf-8?B?ancrQkFtTUlpSnpuUDVtZ1F6ZS9wdUhCVFdabjMzei82VXR6QWx3Y0FPVEdB?=
 =?utf-8?B?ZkZsTnhhakFSbGwxZng4U3h4Y1JiV0FkbzR3aHp0TFlIdisxaEFNNzFZdGh4?=
 =?utf-8?B?NnNsT3k5RU1sSDVDMHZ3S3hWdHZQTTZrdWVidHR1dXNRYldxMzl1Z2tKODVU?=
 =?utf-8?B?U1l3UjFNSUEyTjNwd1FoWUxpamtkRDlJaVY2STdlUkllSDN3UEVDUC9oT0Fr?=
 =?utf-8?B?a2RoTGg5Z2V1c1pBV0pmQ3dWTWhTQ2dYUldNemVuNVllOW5hMHVldm11UmY5?=
 =?utf-8?Q?twve/Q4S6ud+hIpe2KAOrmKig?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d1391a-d077-440b-8f0e-08db00d338d3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 01:58:59.6888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4iin4LW4K3j5+JARq04K07gVGLqtwa1xB44mxwy4nuldSsACHaqUPxxSremmfII4gblX2mlFMjAE19zi08rg7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5872
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 01:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176456

--------------0NwqEND0RwVWRmpJnZSgjosR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/27/2023 6:26 PM, Tim Orling wrote:
>
>
> On Thu, Jan 26, 2023 at 8:28 PM Gundlupet Raju, Sandeep 
> <sandeep.gundlupet-raju@amd.com> wrote:
>
>     Thanks Tim for your help.
>
>     On 1/26/2023 1:40 PM, Tim Orling wrote:
>>
>>
>>     On Wed, Jan 25, 2023 at 11:17 AM Gundlupet Raju, Sandeep
>>     <sandeep.gundlupet-raju@amd.com> wrote:
>>
>>         Hello,
>>
>>         I'm upgrading python3-bqplot from honister to langdale in
>>         meta-jupyter,
>>         I've migrated the recipe version from 0.12.31 ->0.12.36 but
>>         I'm running
>>         into build missing dependencies issues. Even if I use 0.12.31
>>         issues
>>         exists in kirkstone and langdale.
>>
>>         Any help from community will be much appreciated.
>>
>>         https://github.com/Xilinx/meta-jupyter/blob/langdale/recipes-python/python3-bqplot_0.12.31.bb
>>
>>         ============
>>
>>         Source repo:
>>
>>         ============
>>
>>         https://github.com/bqplot/bqplot/tree/0.12.36
>>
>>         ================================================================
>>
>>         0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch:
>>
>>         ================================================================
>>
>>          From c4681f95099516e96b1c7be757da6e0f302f50fe Mon Sep 17
>>         00:00:00 2001
>>         From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>>         Date: Tue, 13 Dec 2022 15:41:18 -0700
>>         Subject: [PATCH] pyproject.toml: Allow jupyter packaging to
>>         be greater than
>>           0.7
>>
>>         Signed-off-by: Sandeep Gundlupet Raju
>>         <sandeep.gundlupet-raju@amd.com>
>>         ---
>>           pyproject.toml | 2 +-
>>           1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>         diff --git a/pyproject.toml b/pyproject.toml
>>         index ba04c53f..7a3cc3a9 100644
>>         --- a/pyproject.toml
>>         +++ b/pyproject.toml
>>         @@ -1,3 +1,3 @@
>>           [build-system]
>>         -requires = ["jupyter_packaging~=0.7.9", "jupyterlab~=3.0",
>>         "setuptools>=40.8.0", "wheel"]
>>         +requires = ["jupyter_packaging~=0.9,<2", "jupyterlab~=3.0,<4",
>>
>>     These are build time dependencies so they need to be in DEPENDS,
>>     not RDEPENDS.
>>
>>
>>         "setuptools", "wheel"]
>>           build-backend = "setuptools.build_meta"
>>         -- 
>>         2.17.1
>>
>>         =================================
>>
>>         python3-bqplot_0.12.36.bb <http://python3-bqplot_0.12.36.bb>
>>         recipe:
>>
>>         =================================
>>
>>         SUMMARY = "Interactive plotting for the Jupyter notebook,
>>         using d3.js and \
>>                 ipywidgets."
>>         LICENSE = "Apache-2.0"
>>         LIC_FILES_CHKSUM =
>>         "file://LICENSE;md5=822b4ff4dd277d70fc2b796617ae1bf7"
>>
>>         PYPI_PACKAGE = "bqplot"
>>         inherit pypi python_setuptools_build_meta
>>
>>         SRC_URI[sha256sum] =
>>         "6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af"
>>         SRC_URI += "\
>>         file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch
>>         \
>>              "
>>
>>     In the prior 0.12.31 ecipe, you had
>>      DEPENDS += " \
>>     ${PYTHON_PN}-jupyter-packaging-native \
>>     "
>>     So according to the "requires =" in [build-system], you should
>>     also need python3-jupyterlab-native
>
>     [Sandeep]: I tried this still same issue. But I can build all the
>     jupyter-packaging and jupyterlab packages.
>
>
> Did you build the -native versions? I think there are some missing 
> -native dependencies (some recipes need BBCLASSEXTEND = “native”. 
> After that, it looks like bqplot wants to call yarn or npm. Not a well 
> behaved python library.
>
[Sandeep]:Yes I did build native packages(bitbake python3-bqplot -c 
cleanall; bitbake python3-bqplot -k) and I see most of the dependencies 
has native packages. I will double check once using taskexp and see if 
any packages are missing with native.

$ find * -type f | xargs grep -rn "BBCLASSEXTEND"
recipes-python/python3-anyio_3.6.1.bb:16:BBCLASSEXTEND = "native"
recipes-python/python3-argon2-cffi_21.3.0.bb:9:BBCLASSEXTEND = "native"
recipes-python/python3-backcall_%.bbappend:1:BBCLASSEXTEND = "native"
recipes-python/python3-bleach_4.1.0.bb:18:BBCLASSEXTEND = "native"
recipes-python/python3-bokeh_2.4.2.bb:20:BBCLASSEXTEND = "native"
recipes-python/python3-debugpy_1.5.1.bb:12:BBCLASSEXTEND = "native"
recipes-python/python3-decorator_%.bbappend:1:BBCLASSEXTEND = "native"
recipes-python/python3-entrypoints_0.4.bb:10:BBCLASSEXTEND = "native"
recipes-python/python3-executing_0.10.0.bb:14:BBCLASSEXTEND = "native"
recipes-python/python3-ipykernel_6.13.0.bb:50:BBCLASSEXTEND = "native"
recipes-python/python3-ipython-genutils_%.bbappend:1:BBCLASSEXTEND = 
"native"
recipes-python/python3-ipython_%.bbappend:1:BBCLASSEXTEND = "native"
recipes-python/python3-jedi_%.bbappend:1:BBCLASSEXTEND = "native"
recipes-python/python3-json5_0.9.6.bb:8:BBCLASSEXTEND = "native"
recipes-python/python3-jupyter-client_7.3.1.bb:24:BBCLASSEXTEND = "native"
recipes-python/python3-jupyter-core_4.10.0.bb:21:BBCLASSEXTEND = "native"
recipes-python/python3-jupyter-packaging_0.12.0.bb:15:BBCLASSEXTEND = 
"native"
recipes-python/python3-jupyter-server_1.18.1.bb:37:BBCLASSEXTEND = "native"
recipes-python/python3-jupyterlab-server_2.13.0.bb:23:BBCLASSEXTEND = 
"native"
recipes-python/python3-jupyterlab_3.4.5.bb:36:BBCLASSEXTEND = "native"
recipes-python/python3-matplotlib-inline_%.bbappend:3:BBCLASSEXTEND = 
"native"
recipes-python/python3-mistune_0.8.4.bb:9:BBCLASSEXTEND = "native"
recipes-python/python3-nbclassic_0.4.3.bb:28:BBCLASSEXTEND = "native 
nativesdk"
recipes-python/python3-nbconvert_6.5.3.bb:33:BBCLASSEXTEND = "native"
recipes-python/python3-nbformat_5.4.0.bb:15:BBCLASSEXTEND = "native"
recipes-python/python3-notebook_6.4.12.bb:43:BBCLASSEXTEND = "native"
recipes-python/python3-pandocfilters_1.5.0.bb:10:BBCLASSEXTEND = "native"
recipes-python/python3-parso_%.bbappend:1:BBCLASSEXTEND = "native"
recipes-python/python3-pickleshare_%.bbappend:1:BBCLASSEXTEND = "native"
recipes-python/python3-pre-commit_2.18.1.bb:18:BBCLASSEXTEND = "native"
recipes-python/python3-prometheus-client_0.9.0.bb:15:BBCLASSEXTEND = 
"native"
recipes-python/python3-pure-eval_0.2.2.bb:15:BBCLASSEXTEND = "native"
recipes-python/python3-pyzmq_%.bbappend:1:BBCLASSEXTEND = "native"
recipes-python/python3-scandir_1.10.0.bb:7:BBCLASSEXTEND = "native"
recipes-python/python3-send2trash_%.bbappend:1:BBCLASSEXTEND = "native"
recipes-python/python3-simplegeneric_0.8.1.bb:8:BBCLASSEXTEND = "native"
recipes-python/python3-sniffio_1.2.0.bb:8:BBCLASSEXTEND = "native"
recipes-python/python3-stack-data_0.4.0.bb:20:BBCLASSEXTEND = "native"
recipes-python/python3-terminado_0.13.3.bb:15:BBCLASSEXTEND = "native"
recipes-python/python3-testpath_0.5.0.bb:13:BBCLASSEXTEND = "native"
recipes-python/python3-tornado_%.bbappend:1:BBCLASSEXTEND = "native"
recipes-python/python3-traitlets_%.bbappend:1:BBCLASSEXTEND = "native"
recipes-python/python3-websocket-client_%.bbappend:1:BBCLASSEXTEND = 
"native"
recipes-python/zeromq_%.bbappend:1:BBCLASSEXTEND = "native"

>     =======
>
>     recipe:
>
>     ======
>
>     SUMMARY = "Interactive plotting for the Jupyter notebook, using
>     d3.js and \
>                ipywidgets."
>     LICENSE = "Apache-2.0"
>     LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=822b4ff4dd277d70fc2b796617ae1bf7"
>
>     PYPI_PACKAGE = "bqplot"
>     inherit pypi python_setuptools_build_meta
>
>     SRC_URI[sha256sum] =
>     "6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af"
>     SRC_URI += "\
>     file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch
>     \
>         "
>     DEPENDS += " \
>             ${PYTHON_PN}-jupyter-packaging-native \
>             ${PYTHON_PN}-jupyterlab-native \
>             "
>
>     RDEPENDS:${PN} += " \
>             ${PYTHON_PN}-ipywidgets \
>             ${PYTHON_PN}-traitlets \
>             ${PYTHON_PN}-traittypes \
>             ${PYTHON_PN}-numpy \
>             ${PYTHON_PN}-pandas \
>             "
>
>     do_install:append() {
>             # this files will be installed by python3-json5
>             rm -f
>     ${D}${PYTHON_SITEPACKAGES_DIR}/tests/__pycache__/__init__.cpython-37.pyc
>     }
>
>     FILES:${PN} += "${datadir}/*"
>
>     =========
>
>     bootlogs:
>
>     =========
>
>     ERROR: python3-bqplot-0.12.36-r0 do_compile:
>     ExecutionError('/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642',
>     1, None, None)
>     ERROR: Logfile of failure stored in:
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/log.do_compile.3184642
>     Log data follows:
>     | DEBUG: Executing shell function do_compile
>     | Missing build dependencies:
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyter_packaging~=0.7.9,<2
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | - jupyterlab~=3.0,<4
>     | WARNING:
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642:157
>     exit 1 from 'nativepython3 -m picobuild --source
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36
>     --dest
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/dist
>     --wheel'
>     | WARNING: Backtrace (BB generated script):
>     |       #1: python_pep517_do_compile,
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642,
>     line 157
>     |       #2: do_compile,
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642,
>     line 152
>     |       #3: main,
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642,
>     line 161
>
>
>     ERROR: Task
>     (/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:do_compile)
>     failed with exit code '1
>
>>
>>         RDEPENDS:${PN} += " \
>>              ${PYTHON_PN}-jupyter-packaging \
>>              ${PYTHON_PN}-jupyterlab \
>>              ${PYTHON_PN}-ipywidgets \
>>              ${PYTHON_PN}-traitlets \
>>              ${PYTHON_PN}-traittypes \
>>              ${PYTHON_PN}-numpy \
>>              ${PYTHON_PN}-pandas \
>>              "
>>
>>         do_install:append() {
>>              # this files will be installed by python3-json5
>>              rm -f
>>         ${D}${PYTHON_SITEPACKAGES_DIR}/tests/__pycache__/__init__.cpython-37.pyc
>>         }
>>
>>         FILES:${PN} += "${datadir}/*"
>>
>>         =================
>>
>>         Build error logs:
>>
>>         =================
>>
>>         NOTE: Executing Tasks
>>         ERROR: python3-bqplot-0.12.36-r0 do_compile:
>>         ExecutionError('/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058',
>>
>>         1, None, None)
>>         ERROR: Logfile of failure stored in:
>>         /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/log.do_compile.3777058
>>         Log data follows:
>>         | DEBUG: Executing shell function do_compile
>>         | Missing build dependencies:
>>         | - jupyter_packaging~=0.9,<2
>>         | - jupyterlab~=3.0,<4
>>         | WARNING:
>>         /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058:157
>>
>>         exit 1 from 'nativepython3 -m picobuild --source
>>         /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36
>>
>>         --dest
>>         /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/dist
>>
>>         --wheel'
>>         | WARNING: Backtrace (BB generated script):
>>         |       #1: python_pep517_do_compile,
>>         /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
>>
>>         line 157
>>         |       #2: do_compile,
>>         /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
>>
>>         line 152
>>         |       #3: main,
>>         /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
>>
>>         line 161
>>         ERROR: Task
>>         (/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:do_compile)
>>
>>         failed with exit code '1'
>>         NOTE: Tasks Summary: Attempted 2249 tasks of which 2241
>>         didn't need to
>>         be rerun and 1 failed.
>>
>>         Summary: 1 task failed:
>>         /group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:do_compile
>>         Summary: There was 1 WARNING message.
>>         Summary: There was 1 ERROR message, returning a non-zero exit
>>         code.
>>
>>         Thanks,
>>
>>         Sandeep
>>
>>
--------------0NwqEND0RwVWRmpJnZSgjosR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/27/2023 6:26 PM, Tim Orling wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANx9H-AuMKCpjs9FmWXfs_TsXXcz4Qq9LcWcZV2UrErsGtLNmw@mail.gmail.com">
      
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Jan 26, 2023 at 8:28
            PM Gundlupet Raju, Sandeep &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div>
              <p>Thanks Tim for your help.<br>
              </p>
            </div>
            <div>
              <div>On 1/26/2023 1:40 PM, Tim Orling wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div dir="ltr"><br>
                  </div>
                  <br>
                  <div class="gmail_quote">
                    <div dir="ltr" class="gmail_attr">On Wed, Jan 25,
                      2023 at 11:17 AM Gundlupet Raju, Sandeep &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class="gmail_quote" style="margin:0px
                      0px 0px 0.8ex;border-left:1px solid
                      rgb(204,204,204);padding-left:1ex">
                      Hello,<br>
                      <br>
                      I'm upgrading python3-bqplot from honister to
                      langdale in meta-jupyter, <br>
                      I've migrated the recipe version from 0.12.31
                      -&gt;0.12.36 but I'm running <br>
                      into build missing dependencies issues. Even if I
                      use 0.12.31 issues <br>
                      exists in kirkstone and langdale.<br>
                      <br>
                      Any help from community will be much appreciated.<br>
                      <br>
                      <a href="https://github.com/Xilinx/meta-jupyter/blob/langdale/recipes-python/python3-bqplot_0.12.31.bb" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://github.com/Xilinx/meta-jupyter/blob/langdale/recipes-python/python3-bqplot_0.12.31.bb</a><br>
                      <br>
                      ============<br>
                      <br>
                      Source repo:<br>
                      <br>
                      ============<br>
                      <br>
                      <a href="https://github.com/bqplot/bqplot/tree/0.12.36" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://github.com/bqplot/bqplot/tree/0.12.36</a><br>
                      <br>
================================================================<br>
                      <br>
0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch:<br>
                      <br>
================================================================<br>
                      <br>
                      &nbsp;From c4681f95099516e96b1c7be757da6e0f302f50fe Mon
                      Sep 17 00:00:00 2001<br>
                      From: Sandeep Gundlupet Raju &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;<br>
                      Date: Tue, 13 Dec 2022 15:41:18 -0700<br>
                      Subject: [PATCH] pyproject.toml: Allow jupyter
                      packaging to be greater than<br>
                      &nbsp;&nbsp;0.7<br>
                      <br>
                      Signed-off-by: Sandeep Gundlupet Raju &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;<br>
                      ---<br>
                      &nbsp;&nbsp;pyproject.toml | 2 +-<br>
                      &nbsp;&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
                      <br>
                      diff --git a/pyproject.toml b/pyproject.toml<br>
                      index ba04c53f..7a3cc3a9 100644<br>
                      --- a/pyproject.toml<br>
                      +++ b/pyproject.toml<br>
                      @@ -1,3 +1,3 @@<br>
                      &nbsp;&nbsp;[build-system]<br>
                      -requires = [&quot;jupyter_packaging~=0.7.9&quot;,
                      &quot;jupyterlab~=3.0&quot;, <br>
                      &quot;setuptools&gt;=40.8.0&quot;, &quot;wheel&quot;]<br>
                      +requires = [&quot;jupyter_packaging~=0.9,&lt;2&quot;,
                      &quot;jupyterlab~=3.0,&lt;4&quot;,</blockquote>
                    <div>These are build time dependencies so they need
                      to be in DEPENDS, not RDEPENDS.&nbsp;</div>
                    <blockquote class="gmail_quote" style="margin:0px
                      0px 0px 0.8ex;border-left:1px solid
                      rgb(204,204,204);padding-left:1ex">
                      <br>
                      &quot;setuptools&quot;, &quot;wheel&quot;]<br>
                      &nbsp;&nbsp;build-backend = &quot;setuptools.build_meta&quot;<br>
                      -- <br>
                      2.17.1<br>
                      <br>
                      =================================<br>
                      <br>
                      <a href="http://python3-bqplot_0.12.36.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-bqplot_0.12.36.bb</a>
                      recipe:<br>
                      <br>
                      =================================<br>
                      <br>
                      SUMMARY = &quot;Interactive plotting for the Jupyter
                      notebook, using d3.js and \<br>
                      &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ipywidgets.&quot;<br>
                      LICENSE = &quot;Apache-2.0&quot;<br>
                      LIC_FILES_CHKSUM = <a moz-do-not-send="true">&quot;file://LICENSE;md5=822b4ff4dd277d70fc2b796617ae1bf7&quot;</a><br>
                      <br>
                      PYPI_PACKAGE = &quot;bqplot&quot;<br>
                      inherit pypi python_setuptools_build_meta<br>
                      <br>
                      SRC_URI[sha256sum] = <br>
&quot;6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af&quot;<br>
                      SRC_URI += &quot;\<br>
                      <a moz-do-not-send="true">file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch</a>
                      \<br>
                      &nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
                      <br>
                    </blockquote>
                    <div>In the prior 0.12.31 ecipe, you had</div>
                    <div>&nbsp;DEPENDS += &quot; \</div>
                    ${PYTHON_PN}-jupyter-packaging-native \<br>
                    &quot;</div>
                  <div class="gmail_quote">So according to the &quot;requires
                    =&quot; in [build-system], you should also need
                    python3-jupyterlab-native</div>
                </div>
              </blockquote>
            </div>
            <div>
              <p>[Sandeep]: I tried this still same issue. But I can
                build all the jupyter-packaging and jupyterlab packages.<br>
              </p>
            </div>
          </blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Did you build the -native versions? I think
            there are some missing -native dependencies (some recipes
            need BBCLASSEXTEND = “native”. After that, it looks like
            bqplot wants to call yarn or npm. Not a well behaved python
            library.</div>
          <div dir="auto"><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>[Sandeep]:Yes I did build native packages(bitbake python3-bqplot
      -c cleanall; bitbake python3-bqplot -k) and I see most of the
      dependencies has native packages. I will double check once using
      taskexp and see if any packages are missing with native.<br>
    </p>
    <p>$ find * -type f | xargs grep -rn &quot;BBCLASSEXTEND&quot;<br>
      recipes-python/python3-anyio_3.6.1.bb:16:BBCLASSEXTEND = &quot;native&quot;<br>
      recipes-python/python3-argon2-cffi_21.3.0.bb:9:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-backcall_%.bbappend:1:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-bleach_4.1.0.bb:18:BBCLASSEXTEND = &quot;native&quot;<br>
      recipes-python/python3-bokeh_2.4.2.bb:20:BBCLASSEXTEND = &quot;native&quot;<br>
      recipes-python/python3-debugpy_1.5.1.bb:12:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-decorator_%.bbappend:1:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-entrypoints_0.4.bb:10:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-executing_0.10.0.bb:14:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-ipykernel_6.13.0.bb:50:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-ipython-genutils_%.bbappend:1:BBCLASSEXTEND
      = &quot;native&quot;<br>
      recipes-python/python3-ipython_%.bbappend:1:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-jedi_%.bbappend:1:BBCLASSEXTEND = &quot;native&quot;<br>
      recipes-python/python3-json5_0.9.6.bb:8:BBCLASSEXTEND = &quot;native&quot;<br>
      recipes-python/python3-jupyter-client_7.3.1.bb:24:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-jupyter-core_4.10.0.bb:21:BBCLASSEXTEND =
      &quot;native&quot;<br>
recipes-python/python3-jupyter-packaging_0.12.0.bb:15:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-jupyter-server_1.18.1.bb:37:BBCLASSEXTEND =
      &quot;native&quot;<br>
recipes-python/python3-jupyterlab-server_2.13.0.bb:23:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-jupyterlab_3.4.5.bb:36:BBCLASSEXTEND =
      &quot;native&quot;<br>
recipes-python/python3-matplotlib-inline_%.bbappend:3:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-mistune_0.8.4.bb:9:BBCLASSEXTEND = &quot;native&quot;<br>
      recipes-python/python3-nbclassic_0.4.3.bb:28:BBCLASSEXTEND =
      &quot;native nativesdk&quot;<br>
      recipes-python/python3-nbconvert_6.5.3.bb:33:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-nbformat_5.4.0.bb:15:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-notebook_6.4.12.bb:43:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-pandocfilters_1.5.0.bb:10:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-parso_%.bbappend:1:BBCLASSEXTEND = &quot;native&quot;<br>
      recipes-python/python3-pickleshare_%.bbappend:1:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-pre-commit_2.18.1.bb:18:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-prometheus-client_0.9.0.bb:15:BBCLASSEXTEND
      = &quot;native&quot;<br>
      recipes-python/python3-pure-eval_0.2.2.bb:15:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-pyzmq_%.bbappend:1:BBCLASSEXTEND = &quot;native&quot;<br>
      recipes-python/python3-scandir_1.10.0.bb:7:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-send2trash_%.bbappend:1:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-simplegeneric_0.8.1.bb:8:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-sniffio_1.2.0.bb:8:BBCLASSEXTEND = &quot;native&quot;<br>
      recipes-python/python3-stack-data_0.4.0.bb:20:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-terminado_0.13.3.bb:15:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-testpath_0.5.0.bb:13:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-tornado_%.bbappend:1:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-traitlets_%.bbappend:1:BBCLASSEXTEND =
      &quot;native&quot;<br>
      recipes-python/python3-websocket-client_%.bbappend:1:BBCLASSEXTEND
      = &quot;native&quot;<br>
      recipes-python/zeromq_%.bbappend:1:BBCLASSEXTEND = &quot;native&quot;<br>
    </p>
    <blockquote type="cite" cite="mid:CANx9H-AuMKCpjs9FmWXfs_TsXXcz4Qq9LcWcZV2UrErsGtLNmw@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto">
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div>
              <p dir="auto">=======<br>
              </p>
              <p>recipe:</p>
              <p>======<br>
              </p>
              <p>SUMMARY = &quot;Interactive plotting for the Jupyter
                notebook, using d3.js and \<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ipywidgets.&quot;<br>
                LICENSE = &quot;Apache-2.0&quot;<br>
                LIC_FILES_CHKSUM = <a moz-do-not-send="true">&quot;file://LICENSE;md5=822b4ff4dd277d70fc2b796617ae1bf7&quot;</a><br>
                <br>
                PYPI_PACKAGE = &quot;bqplot&quot;<br>
                inherit pypi python_setuptools_build_meta<br>
                <br>
                SRC_URI[sha256sum] =
                &quot;6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af&quot;<br>
                SRC_URI += &quot;\<br>
                &nbsp;&nbsp;&nbsp; <a moz-do-not-send="true">file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch</a>
                \<br>
                &nbsp;&nbsp;&nbsp; &quot;<br>
                DEPENDS += &quot; \<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-jupyter-packaging-native \<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-jupyterlab-native \<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
                <br>
                RDEPENDS:${PN} += &quot; \<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-ipywidgets \<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-traitlets \<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-traittypes \<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-numpy \<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-pandas \<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
                <br>
                do_install:append() {<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # this files will be installed by python3-json5<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -f
                ${D}${PYTHON_SITEPACKAGES_DIR}/tests/__pycache__/__init__.cpython-37.pyc<br>
                }<br>
                <br>
                FILES:${PN} += &quot;${datadir}/*&quot;</p>
              <p>=========<br>
              </p>
              <p>bootlogs:</p>
              <p>=========</p>
              <p>ERROR: python3-bqplot-0.12.36-r0 do_compile:
ExecutionError('/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642',
                1, None, None)<br>
                ERROR: Logfile of failure stored in:
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/log.do_compile.3184642<br>
                Log data follows:<br>
                | DEBUG: Executing shell function do_compile<br>
                | Missing build dependencies:<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyter_packaging~=0.7.9,&lt;2<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | - jupyterlab~=3.0,&lt;4<br>
                | WARNING:
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642:157
                exit 1 from 'nativepython3 -m picobuild --source
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36
                --dest
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/dist
                --wheel'<br>
                | WARNING: Backtrace (BB generated script):<br>
                |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #1: python_pep517_do_compile,
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642,
                line 157<br>
                |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #2: do_compile,
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642,
                line 152<br>
                |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #3: main,
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642,
                line 161</p>
            </div>
            <div>
              <p><br>
                ERROR: Task
(/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:do_compile)
                failed with exit code '1<br>
              </p>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote"><br>
                    <blockquote class="gmail_quote" style="margin:0px
                      0px 0px 0.8ex;border-left:1px solid
                      rgb(204,204,204);padding-left:1ex">
                      RDEPENDS:${PN} += &quot; \<br>
                      &nbsp;&nbsp;&nbsp; &nbsp;${PYTHON_PN}-jupyter-packaging \<br>
                      &nbsp;&nbsp;&nbsp; &nbsp;${PYTHON_PN}-jupyterlab \<br>
                      &nbsp;&nbsp;&nbsp; &nbsp;${PYTHON_PN}-ipywidgets \<br>
                      &nbsp;&nbsp;&nbsp; &nbsp;${PYTHON_PN}-traitlets \<br>
                      &nbsp;&nbsp;&nbsp; &nbsp;${PYTHON_PN}-traittypes \<br>
                      &nbsp;&nbsp;&nbsp; &nbsp;${PYTHON_PN}-numpy \<br>
                      &nbsp;&nbsp;&nbsp; &nbsp;${PYTHON_PN}-pandas \<br>
                      &nbsp;&nbsp;&nbsp; &nbsp;&quot;<br>
                      <br>
                      do_install:append() {<br>
                      &nbsp;&nbsp;&nbsp; &nbsp;# this files will be installed by
                      python3-json5<br>
                      &nbsp;&nbsp;&nbsp; &nbsp;rm -f <br>
${D}${PYTHON_SITEPACKAGES_DIR}/tests/__pycache__/__init__.cpython-37.pyc<br>
                      }<br>
                      <br>
                      FILES:${PN} += &quot;${datadir}/*&quot;<br>
                      <br>
                      =================<br>
                      <br>
                      Build error logs:<br>
                      <br>
                      =================<br>
                      <br>
                      NOTE: Executing Tasks<br>
                      ERROR: python3-bqplot-0.12.36-r0 do_compile: <br>
ExecutionError('/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058',
                      <br>
                      1, None, None)<br>
                      ERROR: Logfile of failure stored in: <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/log.do_compile.3777058<br>
                      Log data follows:<br>
                      | DEBUG: Executing shell function do_compile<br>
                      | Missing build dependencies:<br>
                      | - jupyter_packaging~=0.9,&lt;2<br>
                      | - jupyterlab~=3.0,&lt;4<br>
                      | WARNING: <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058:157
                      <br>
                      exit 1 from 'nativepython3 -m picobuild --source <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36
                      <br>
                      --dest <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/dist
                      <br>
                      --wheel'<br>
                      | WARNING: Backtrace (BB generated script):<br>
                      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #1: python_pep517_do_compile, <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
                      <br>
                      line 157<br>
                      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #2: do_compile, <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
                      <br>
                      line 152<br>
                      |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #3: main, <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
                      <br>
                      line 161<br>
                      ERROR: Task <br>
(/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:do_compile)
                      <br>
                      failed with exit code '1'<br>
                      NOTE: Tasks Summary: Attempted 2249 tasks of which
                      2241 didn't need to <br>
                      be rerun and 1 failed.<br>
                      <br>
                      Summary: 1 task failed:<br>
/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:do_compile<br>
                      Summary: There was 1 WARNING message.<br>
                      Summary: There was 1 ERROR message, returning a
                      non-zero exit code.<br>
                      <br>
                      Thanks,<br>
                      <br>
                      Sandeep<br>
                      <br>
                      <br>
                    </blockquote>
                  </div>
                </div>
              </blockquote>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------0NwqEND0RwVWRmpJnZSgjosR--

