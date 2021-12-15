Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B05C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 07:35:24 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.72])
 by mx.groups.io with SMTP id smtpd.web12.37785.1639553715211132119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 23:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=PgPuIG86;
 spf=pass (domain: outlook.com, ip: 40.92.66.72,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzlqODvR7LLgqKFORqnPiZqZ5bTO+1KV4m36+k0ypb+vM+7udtcVNvi0nDRm9xbA9LPgpGD9PXm0lcc6NREGkpvsWPAlVPNnf11qIqvgyqPic0ufsDPLeu0TUFyy25BSS1MFEweeSg6VpjXX8KsKsS1rklGIjVd+rUs4ZYonOITVRBRLoGfPtLauACS7xTo4f+NmtxyZ4LKNTk4T81KjdKNvX6TQ07DZCIjsZsPsATAx3OSaJHtBbay9DUvM0Tj7wdVdRtLYL/jHdIvuD7NvJYNi8DhoAXEkpn6QEuM76Hi6n6WRdiramwaxjM2E0C5Aa5WmBFOOoOYya3rO6ktAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J83TSzgmDkPW4NTsq6UYgowQkmPO8U9xNmCmGB9sfLw=;
 b=mAcQWm+nLaAXDJ7SpFdbMNAPd9VpD0HblIce2xR6T2BT5Jnw3iPn+tSDmkqx/ES8vVKsF12qqUeidzYynVg+ABdKftsIsCBROvl97c3am//yHzl2SbYO7pLXWo11xJGuRn/UU53M0YA5Fm8ImjbgKbjWs5HTrtC5jMJuL61bc2Dfd0kI9h8fb/XiF4vh87ncYFD71o/nbJA5vlOl7mvu4jDIVSvrU+kSueY3HNh22QRzxG1TYbfsFkRxMkHQ29KKoyDCx3t8uArVGrqn67OrKOK0MPQjnqlJhzgRCP53c7CtSWiL6Y655xFs5HB3w23Ono8XIYbvavm0bwLglaQZIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J83TSzgmDkPW4NTsq6UYgowQkmPO8U9xNmCmGB9sfLw=;
 b=PgPuIG86ulDI3we11wdSqsYfNsC01y9GhIwUu4Hc284ewS2nJuywCecDZv5ac5jkkazsLLV9QNG6CR7xl8LQj6apMa9vhNfzuJ6XacfquCo1G4Evte8hm8H3Hr8tP5arvUeNpED7jshhZnx+u2L1847m561FY8TDCItk8j9DDMapcuP174lcoYvN/2KimhKxtQnMWxZEw+05BuP9SGyK9074gJGJFpl+srDuLwXWQAekhvMJSf1FNpCIhXMOxh6OlPsO8azrZgUEEVQuCFaPlpR7SnT0+Pq6nYfR8LFSlQPJ9oqaHRFyQ+DRudji/AeXqIp7z4Tk2HMRwH4b8Qp2lQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2705.eurprd09.prod.outlook.com (2603:10a6:208:127::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 07:35:10 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 07:35:10 +0000
Subject: Re: [OE-core][PATCH] meta/recipes-bsp: Add recipe for Slim Bootloader
To: Yongxin Liu <yongxin.liu@windriver.com>,
 openembedded-core@lists.openembedded.org, richard.purdie@linuxfoundation.org
References: <20211215071632.11038-1-yongxin.liu@windriver.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464238FBE970773FAD77D126A8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 15 Dec 2021 08:35:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211215071632.11038-1-yongxin.liu@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [s30m2jFSvBm4DmsF2fIkPAbRvk9QZnp8B9NwNZRhRyktUPtp64zeNirRp1YoYABX]
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <9e23450d-78e3-3780-a510-bf19e6f24375@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41d8bf02-adf2-4b96-7e16-08d9bf9d6cbe
X-MS-TrafficTypeDiagnostic: AM0PR09MB2705:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	50hUSIi2B1lPyOsH70Nwc+nKv3NDlXtqT692P98eanQPDzfdnRwN0NjVjTO+YllN8GAI3FhMiqnoY/f2lbtVl3TreykSUNJOKYhFO1/e1XwP/l0PxwRYxdqHULGGmpWtTVKOyCx6RWj1Xq60V/zGLAS8GTftZKATocoQ+GijQxhaBC355BULEYQzrXZ35qcFQ/PG7LtDi7E+R/Z1n1AJe0sdLw2oEnkmP6WQcwFhGyownCU4iixHTy41UjY+yPP1NNiYpEE4UR4r76u3nVRvYLQs0dcxg8FwDku+/PiiqAp9xeV2lqkJ6ZwT0DoHTwzbRUXkPmK+ixVInKc6cXFZcAVYEFESD04+OiyWJaIOdKRWLRWcf4GVfEsz1n2LMp5lMDRiJmzCMTTnoY6GHUyVI+0gn2uiQ7AAPFYaQdFMbbYNqgD0u/Pbwe8SkP8upyr0wnvZEF4Ffm8k8hvuaR63J27DNd8q0XLjUEME+jxl21fCW4/E/+BtF22xPWlwvTuRp+17SRck8FN7g4sPTKkb4pTWp/3HRzb+RUDUcBghiSVxJzOB6bmAt1Z5Lqcn6blfpf81hKMh5fLfIA1SC+2WvAYeVgsym+wxDlLRvyqwdty4VW1mA6Ww6NBHrPpst7kgJeqzfydd3ENw4r4kXtvo0cYlHbRaMLXD7DHpBkW+CkI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkloSnpKbG1IcWZ5YWFiVmVhQzJzdExkaHI1dU9tbUpqQlJtc0ZXNHFDK1h1?=
 =?utf-8?B?WmZtR0xNZFdaaEkwZHZOeG9MQzdLakYybnlXMjhncTM4Vmc2SjI0VEtpbURu?=
 =?utf-8?B?ZlZwVFFqUWpVcmoreTh4VWl5dWZHQnNNY3NSMmRmZ2FqbjRSZlhqSWlLVy9t?=
 =?utf-8?B?MFBHMVR3cXh6S3ROY1ErckxZRzhIT0p1azdYeURQVW5ZWE5PY05qTU81WUxs?=
 =?utf-8?B?d1BwclpoS05qcm1NZnBZVGdVK3l4UWpBL0dmcU5jT0N2dDJiNTlMd0NGSzJq?=
 =?utf-8?B?bDNFYnhFUjY0THVVQ2VWWVdQWHhVejhKK0RnS3UydldmaXpucUE2WVdFVEV6?=
 =?utf-8?B?M1VXYVU1Q3Vidk1UK0dFSlpQdENJL0svMDJhbXVaWlJhVkpjYW80MTh4U3Qx?=
 =?utf-8?B?RGhrdzV1V1pZNE1idlZJeVJobjJHS2x2Mm5LVzdVQXdySExROWk2Y1JCeHAr?=
 =?utf-8?B?VWJ0VGZMWlJqV2RLTmphMEJGaUlscGRwaGtJbmhmSTQ3aGszRllIWEV2ODB1?=
 =?utf-8?B?UDk2cDcybUNtVndpRmRhamtuSEx3ODNUeG51RlVUMXc2RE82M2ZxZktrQ05V?=
 =?utf-8?B?K3lzUUdXWWZoTEFyeVNETE00bEd4L2cvcFQwaEZyVDN5QTJkYlg4ZkxwVkRs?=
 =?utf-8?B?YWNpZW5jcWswTEc0OUp6Q2ZYUVcvRWdPRExRNi9scXUya0Q0QXowYjU1VTFC?=
 =?utf-8?B?NHBPYWFpWGtQenpwcEwvL1lVc1VYcHVER0oyNlVuRjNHMVJnMUpBRGpxaThk?=
 =?utf-8?B?N2s0NU43VS9Hb1g3T1FSbk03c3BDcVFjZVI2cHF1SGl4K3NUR3luN0R6a0FS?=
 =?utf-8?B?Uk4va004czNUdGVPUGNnbkFVOTlMaGRoQnp3Y1lwUGI5ckpkNGpoMXNQcEZ6?=
 =?utf-8?B?R1d6cW5BV29ReGdJbGRnUkpUM2d5YVRnZWMxZGtaMDJzNnV0UlhvK1I0dFA5?=
 =?utf-8?B?eWlLZFdHNnZBK2EzbGhOUnp6K0w3eXRKWmRTaFQ2ekQzYkV1OUtRNG1XRS9p?=
 =?utf-8?B?U0xUdFdXcVBWVWUrdG8raFpwcHdKbUhFKzhVU2o4R1kxM0hob0dJcWhaNzJP?=
 =?utf-8?B?citjMjBoRWxYd3lCSnhKamxOSlFQVHY5MGRvSnczWVlqbmZWVGRUdnd2Z29T?=
 =?utf-8?B?aFFBeU8zRER4Ty9RWk0yZGQyZ1RVQUhmN3l5bVc4UUdxK3BvRU9NcWtCSm9J?=
 =?utf-8?B?cW9KZDdEbCsvWDF1MTBlZDA0L2g3M3ZUaUZhYXlDM0xaSlV0RGdHdk9UVWln?=
 =?utf-8?B?THJBZVU3STVTQy90Q2dVQTg1UHFhVmY0eDNRT1p3SmFsZzJQcmt3NHY5c2x5?=
 =?utf-8?B?N21VMnJhK3JRclVsYTVOQ3JEVG1ZU3hrMm9JREx6TGN3WEh3ckJIZCtwbWFX?=
 =?utf-8?B?MVpWbzRLbS84SVE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 41d8bf02-adf2-4b96-7e16-08d9bf9d6cbe
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 07:35:10.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2705
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 07:35:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159714



On 15.12.21 08:16, Yongxin Liu wrote:
> Slim Bootloader is an open-source boot firmware running on Intel x86
> architecture.
> 
> Currently it supports qemu, apl(Apollo Lake), cfl(Coffee Lake),
> cml(Comet Lake), tgl(Tiger Lake), and ehl(Elkhart Lake). You can set
> "SLIMBOOT_TARGET" in .bb file or .bbappend file to specify or add the
> target firmware you want, for example: SLIMBOOT_TARGET = "qemu apl".
> The default target is qemu.
> 
> Generated firmware and security keys are installed in build directory:
>      image
>      `-- usr
>          `-- libexec
>              `-- slimboot
>                  |-- Outputs
>                  |   |-- qemu
>                  |   |-- apl
>                  |   `-- cfl
>                  `-- keys
> 
> Boot firmware for qemu can be used by command:
> "qemu-system-x86_64 -machine q35 -nographic -serial mon:stdio -pflash SlimBootloader.bin"
> 
> Other boot firmware for real hardware cannot be programmed directly to
> flash, please refer to https://slimbootloader.github.io/index.html for
> more instructions.
> 
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>   ...d-private-key-check-for-PKCS8-format.patch | 28 ++++++++
>   .../build-EDK2-BaseTools-with-bitbake.patch   | 70 +++++++++++++++++++
>   ...limbootloader-BaseTools-with-bitbake.patch | 42 +++++++++++
>   meta/recipes-bsp/slimboot/slimboot_git.bb     | 57 +++++++++++++++
>   4 files changed, 197 insertions(+)
>   create mode 100644 meta/recipes-bsp/slimboot/files/add-private-key-check-for-PKCS8-format.patch
>   create mode 100644 meta/recipes-bsp/slimboot/files/build-EDK2-BaseTools-with-bitbake.patch
>   create mode 100644 meta/recipes-bsp/slimboot/files/build-slimbootloader-BaseTools-with-bitbake.patch
>   create mode 100644 meta/recipes-bsp/slimboot/slimboot_git.bb
> 
> diff --git a/meta/recipes-bsp/slimboot/files/add-private-key-check-for-PKCS8-format.patch b/meta/recipes-bsp/slimboot/files/add-private-key-check-for-PKCS8-format.patch
> new file mode 100644
> index 0000000000..a7e9d96dfb
> --- /dev/null
> +++ b/meta/recipes-bsp/slimboot/files/add-private-key-check-for-PKCS8-format.patch
> @@ -0,0 +1,28 @@
> +From e31e9b34f5ffccaab3788da781e05a0622cf7d45 Mon Sep 17 00:00:00 2001
> +From: Yongxin Liu <yongxin.liu@windriver.com>
> +Date: Tue, 7 Dec 2021 16:18:43 +0000
> +Subject: [PATCH] add private key check for PKCS8 format
> +
> +Upstream-Status: Pending

Pending patches are discouraged, please send them upstream

> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + BootloaderCorePkg/Tools/SingleSign.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/BootloaderCorePkg/Tools/SingleSign.py b/BootloaderCorePkg/Tools/SingleSign.py
> +index 2a550bf8..5baacbde 100644
> +--- a/BootloaderCorePkg/Tools/SingleSign.py
> ++++ b/BootloaderCorePkg/Tools/SingleSign.py
> +@@ -259,7 +259,7 @@ def single_sign_gen_pub_key (in_key, pub_key_file = None):
> +     cmdline = [get_openssl_path(), 'rsa', '-pubout', '-text', '-noout', '-in', '%s' % in_key]
> +     # Check if it is public key or private key
> +     text = open(in_key, 'r').read()
> +-    if '-BEGIN RSA PRIVATE KEY-' in text:
> ++    if '-BEGIN RSA PRIVATE KEY-' in text or '-BEGIN PRIVATE KEY-' in text:
> +         is_prv_key = True
> +     elif '-BEGIN PUBLIC KEY-' in text:
> +         cmdline.extend (['-pubin'])
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-bsp/slimboot/files/build-EDK2-BaseTools-with-bitbake.patch b/meta/recipes-bsp/slimboot/files/build-EDK2-BaseTools-with-bitbake.patch
> new file mode 100644
> index 0000000000..3b9db74491
> --- /dev/null
> +++ b/meta/recipes-bsp/slimboot/files/build-EDK2-BaseTools-with-bitbake.patch
> @@ -0,0 +1,70 @@
> +From ce5ed81d9dd9c37e494560edb8f0fbae83713416 Mon Sep 17 00:00:00 2001
> +From: Yongxin Liu <yongxin.liu@windriver.com>
> +Date: Wed, 15 Dec 2021 02:19:42 +0000
> +Subject: [PATCH] build EDK2/BaseTools with bitbake
> +
> +EDK2 basetools are needed by QEMU FSP. Due to CRLF line terminators
> +in target file, the patch has to be set to binary format.
> +
> +Upstream-Status: Inappropriate [oe-core specific]

Why is this oe-specific, I'm missing a proper explanation in the commit 
message

> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + .gitattributes                                   |   1 +
> + .../Tools/PrepareBuildComponentBin.py            |   6 ++++++
> + .../build-edk2-BaseTools-with-bitbake.patch      | Bin 0 -> 1375 bytes
> + 3 files changed, 7 insertions(+)
> + create mode 100644 Silicon/QemuSocPkg/FspBin/Patches/build-edk2-BaseTools-with-bitbake.patch
> +
> +diff --git a/.gitattributes b/.gitattributes
> +index e372c4d9..d31d5dbb 100644
> +--- a/.gitattributes
> ++++ b/.gitattributes
> +@@ -17,3 +17,4 @@
> + # since the files that are being patched have a mixture of line
> + # endings. This means it must be treated as binary.
> + Silicon/QemuSocPkg/FspBin/Patches/0001-Build-QEMU-FSP-2.0-binaries.patch binary
> ++Silicon/QemuSocPkg/FspBin/Patches/build-edk2-BaseTools-with-bitbake.patch binary
> +diff --git a/BootloaderCorePkg/Tools/PrepareBuildComponentBin.py b/BootloaderCorePkg/Tools/PrepareBuildComponentBin.py
> +index 50f24736..2cd2f5d5 100644
> +--- a/BootloaderCorePkg/Tools/PrepareBuildComponentBin.py
> ++++ b/BootloaderCorePkg/Tools/PrepareBuildComponentBin.py
> +@@ -188,6 +188,12 @@ def BuildFspBins (fsp_dir, sbl_dir, fsp_inf, silicon_pkg_name, flag):
> +     ret = subprocess.call(cmd.split(' '), cwd=fsp_dir)
> +     if ret:
> +         Fatal ('Failed to apply QEMU FSP patch !')
> ++
> ++    cmd = 'git am --keep-cr --whitespace=nowarn %s/build-edk2-BaseTools-with-bitbake.patch' % patch_dir
> ++    ret = subprocess.call(cmd.split(' '), cwd=fsp_dir)
> ++    if ret:
> ++        Fatal ('Failed to apply QEMU FSP patch for EDK2 BaseTools !')
> ++
> +     print ('Done\n')
> +
> +     print ('Compiling QEMU FSP source ...')
> +diff --git a/Silicon/QemuSocPkg/FspBin/Patches/build-edk2-BaseTools-with-bitbake.patch b/Silicon/QemuSocPkg/FspBin/Patches/build-edk2-BaseTools-with-bitbake.patch
> +new file mode 100644
> +index 0000000000000000000000000000000000000000..3dbdb14bf5332af1c15e4bf146abf67d4db3768a
> +GIT binary patch
> +literal 1375
> +zcmb7EYj4^>5d3};|6!%%1IU~on8bjZD%2zmDk&%sHC0t1n_H7>j4wUgNs#*EyS8~K
> +zsFf0A8SUKO+{|dtms+i$9dvEy#1oMd2y{F|+wGoqI_NsViQNfZ&km!mYYVtm2~6=3
> +z91m=}S3c0PZHHYFO%J}SWceZ!7|9$ytgFI|Wq$rF6QSi3YIC7hAK4(tuvd^Z!Es@L
> +z3nFPb;5fau-6O=X>Bpvd_zM?V4}MJgGym!*gt?3bpm=D(ry#|dQgI5;GP{RRW?}Gv
> +zjQRILvcyei6bH)`G6i{xAd^L$3xpsM5X(>pdJRHqIzVZODI?ib$VcSqI@L;LJP9(A
> +zY%(^L%LD~iQN+Xb+g)<b*<PqMRk>cE<y+UJG?Fo<);&_*+FWe__yeb47)H6#fuaW%
> +zr6JJ-mmH+1GpUlaZZrx&V2oAG8;l7VMZoz|W)N7reBN?w_^x(JO5h9FBJx_D$ZdJ1
> +zxe!q|bX?I9;Mn$QyUobLJ5?|;4)0WQeh%C_X?kFkZz_-LsI}4*yMU|lbT;qb_*V@E
> +zm{2@52J{TS`lH*y1)NdyY&;&#H$VgUkf7`Smy4V6cy?G?!)kymU#(Vj4PH0zR{w_&
> +z6OpHxUQaU`z(9+`zKYc<VACw$q@@tQlUHN>)9r9HnER8-<*5I8S~}Q@uQB6b)hG<^
> +zmkaAh@PKrCFYabH{rPw@t7zgN&1kXOzC+J|k6Xm>y17wfMd*(0G&^8ae+0+~e?$Ga
> +z?%&<fWXAE+iZZVVM;ooX6R2k^pMOgf7x+jQkG=?kYh21SLk;CZp3uE5z%-8wff%Q_
> +z3t>;YP33_0VD~1S?KUzt8k91~(Kfj)110xw0h=M(y4??06NY`aMO1J^3OTTr>AI%P
> +F*k8r-nZ5u3
> +
> +literal 0
> +HcmV?d00001
> +
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-bsp/slimboot/files/build-slimbootloader-BaseTools-with-bitbake.patch b/meta/recipes-bsp/slimboot/files/build-slimbootloader-BaseTools-with-bitbake.patch
> new file mode 100644
> index 0000000000..5a3a249de0
> --- /dev/null
> +++ b/meta/recipes-bsp/slimboot/files/build-slimbootloader-BaseTools-with-bitbake.patch
> @@ -0,0 +1,42 @@
> +From 080d952b27cc6450bca340c37c9bc1cc4ec6787c Mon Sep 17 00:00:00 2001
> +From: Yongxin Liu <yongxin.liu@windriver.com>
> +Date: Wed, 15 Dec 2021 01:24:11 +0000
> +Subject: [PATCH] build slimbootloader/BaseTools with bitbake
> +
> +Change build flags to use include and library directories
> +in recipe-sysroot-native.
> +
> +Upstream-Status: Inappropriate [oe-core specific]

Same here - I don't see a reason why this can't be proposed to upstream

> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + BaseTools/Source/C/Makefiles/header.makefile | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Source/C/Makefiles/header.makefile
> +index 45c93595..449e5bd1 100755
> +--- a/BaseTools/Source/C/Makefiles/header.makefile
> ++++ b/BaseTools/Source/C/Makefiles/header.makefile
> +@@ -75,7 +75,7 @@ $(error Bad HOST_ARCH)
> + endif
> +
> + INCLUDE = $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common -I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I $(MAKEROOT)/Common/ -I .. -I . $(ARCH_INCLUDE)
> +-BUILD_CPPFLAGS = $(INCLUDE)
> ++BUILD_CPPFLAGS += $(INCLUDE)
> +
> + # keep EXTRA_OPTFLAGS last
> + BUILD_OPTFLAGS = -O2 $(EXTRA_OPTFLAGS)
> +@@ -101,8 +101,8 @@ ifeq ($(CXX), llvm)
> + BUILD_LFLAGS =
> + BUILD_CXXFLAGS = -Wno-deprecated-register -Wno-unused-result
> + else
> +-BUILD_LFLAGS =
> +-BUILD_CXXFLAGS = -Wno-unused-result
> ++BUILD_LFLAGS = $(LDFLAGS)
> ++BUILD_CXXFLAGS += -Wno-unused-result
> + endif
> + ifeq ($(HOST_ARCH), IA32)
> + #
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-bsp/slimboot/slimboot_git.bb b/meta/recipes-bsp/slimboot/slimboot_git.bb
> new file mode 100644
> index 0000000000..2bfdef6a5f
> --- /dev/null
> +++ b/meta/recipes-bsp/slimboot/slimboot_git.bb
> @@ -0,0 +1,57 @@
> +SUMMARY = "Slim Bootloader"
> +DESCRIPTION = "Slim Bootloader is an open-source boot firmware, built from the \
> +ground up to be small, secure and optimized running on Intel x86 architecture."
> +HOMEPAGE = "https://slimbootloader.github.io/"
> +
> +LICENSE = "BSD-2-Clause-Patent"
> +
> +SRC_URI = "git://github.com/slimbootloader/slimbootloader;protocol=https;branch=master\
before the trailing \ a whitespace seems to be missing
> +           file://build-slimbootloader-BaseTools-with-bitbake.patch \
> +           file://add-private-key-check-for-PKCS8-format.patch \
> +           file://build-EDK2-BaseTools-with-bitbake.patch;apply=0 \
> +          "
> +SRCREV = "d0fac9b4423431babff4e790293aad430715187c"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ef7fba7be2819ac13aaf5d0f842ce5d9"

https://github.com/slimbootloader/slimbootloader/tree/master/Licenses 
lists a lot more licenses, please also add them here if they are 
appropriate - which also may influence the overall LICENSE setting

> +PV = "0.0.0+git${SRCPV}"
> +
> +inherit python3native
> +BBCLASSEXTEND = "native"
> +DEPENDS = "openssl-native nasm-native acpica-native util-linux-native"
> +S = "${WORKDIR}/git"
> +
> +do_configure[noexec] = "1"
> +
> +SLIMBOOT_TARGET ?= "qemu"
> +SLIMBOOT_KEY_DIR ?= "keys"
> +
> +do_binary_patch() {
> +    cd "${S}"
> +    git am ${WORKDIR}/build-EDK2-BaseTools-with-bitbake.patch
> +}
> +
> +addtask do_binary_patch after do_patch before do_compile
> +
> +do_compile() {
> +    ln -sf ${STAGING_BINDIR_NATIVE}/python3-native/python3 ${STAGING_BINDIR_NATIVE}/python
> +
> +    cd ${S}
> +    rm -rf ${SLIMBOOT_KEY_DIR}; mkdir -p ${SLIMBOOT_KEY_DIR}
> +    export SBL_KEY_DIR=${S}/${SLIMBOOT_KEY_DIR}
> +    python BootloaderCorePkg/Tools/GenerateKeys.py -k ${SBL_KEY_DIR}
> +
> +    export EXTRA_LDFLAGS="-L${STAGING_LIBDIR_NATIVE}"
> +
> +    for target in ${SLIMBOOT_TARGET}; do
> +        python BuildLoader.py build ${target}
> +    done
> +}
> +
> +do_install() {
> +    for target in ${SLIMBOOT_TARGET}; do
> +        install -m 755 -d ${D}${libexecdir}/slimboot/Outputs/${target}
> +        install -m 755 ${S}/Outputs/${target}/* ${D}${libexecdir}/slimboot/Outputs/${target}
> +    done
> +
> +    install -m 755 -d ${D}${libexecdir}/slimboot/${SLIMBOOT_KEY_DIR}
> +    install -m 755 ${S}/${SLIMBOOT_KEY_DIR}/* ${D}${libexecdir}/slimboot/${SLIMBOOT_KEY_DIR}

755 for keys sounds a bit too permissive for me

> +}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159713): https://lists.openembedded.org/g/openembedded-core/message/159713
> Mute This Topic: https://lists.openembedded.org/mt/87739826/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

