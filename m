Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.60])
 by mx.groups.io with SMTP id smtpd.web08.5454.1611738743443074645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 01:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NQEF4+PV;
 spf=pass (domain: windriver.com, ip: 40.107.70.60, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jm8yLRP3yxIDMduNiP6gBYbaFTFWoLNMOcCQL139ZswFv18Cr8Te3Eb8fQZMlvMcC3XvArhvzUR9RnwtTVVL4V5MBu/cdy3/PQWyufGtFLPyNhy4bKsxELZEU1Ex0866tVlueVxoxgAWvwMriUk16ydTbIbxTlvO6PVab+1g/hEvbWC9l5ipyFNeHwrvKCWoHB4FG8BMKxDp3EM/wQ23pJEHrTiF1dTeHP2YELN2tiLYbi6qqlNFKnDUmLGWXay7VNxUV0AFWC2cipMHewDNHHL0K+zYF0hjhTQfgpW8wS+KvaFqOcYlTXi2GgfLKEhY9zs59nKAzRgzwyNba7Qbcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9h4k4WKstAbZZRmCPIFzd+5EWWcNa9gwxhWZRC7Fkgo=;
 b=gMpm5hXPZq250YlLBPxVU2bDjPhL8L6PH3uxgwsJreejs9+T4vsRs8WFKxd/JmJ2yem0T1NbaUUEzqFPBs/CRhL9WSWaK4eVPnx/fBowL55VKReh2B3642gtPVx2AlbYNFH83fUaHnLujM2RDdXzuEIGFXGId1Cu2o92juT1LkzGII30Md4A/Y1XjZKYt7wkiN5cWsZ9sKdDyiJLwVPQ9XtNs2oUmtTXaBVYQl5WrsbwgCLP5AHiz7uCaQH2RUOu7Ps4i+bwUNgaLyZ91OvyY9lpo1xq4AspVSNgvEhB0EVelb/AEgu/wzQKtZxQy8jqrXLDz58yeBHMzD/mFPunCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9h4k4WKstAbZZRmCPIFzd+5EWWcNa9gwxhWZRC7Fkgo=;
 b=NQEF4+PV3lHPunBr2m+duHjZnloKII4ZgrUI/r9hD28JOzb32iIs2gAnjSiL18QGASq2gulAkM53x8AuuFy4Kgx1F2YY0KSiLNrKX6e1+okjpJgWFfkN/mrIE1HTiW1znbtYw+VQuGNHe8qz/bxFUYCJQdiD+H0CUlPmozYYyCc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1951.namprd11.prod.outlook.com (2603:10b6:300:10c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 09:12:22 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c888:52a9:d69:3859]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c888:52a9:d69:3859%5]) with mapi id 15.20.3784.019; Wed, 27 Jan 2021
 09:12:21 +0000
Subject: Re: [OE-core] [PATCH v2] bitbake.conf: use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <4e34eedd6cd84c361e5a316325c508499a7d75a6.camel@linuxfoundation.org>
 <165BDEE2FA12F0DD.28472@lists.openembedded.org>
Message-ID: <deef1b33-b91c-72d6-ef8b-92bc6490c59f@windriver.com>
Date: Wed, 27 Jan 2021 17:11:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <165BDEE2FA12F0DD.28472@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0023.apcprd03.prod.outlook.com
 (2603:1096:202::33) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK2PR0302CA0023.apcprd03.prod.outlook.com (2603:1096:202::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend Transport; Wed, 27 Jan 2021 09:12:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 237fa572-0301-40b8-4a5f-08d8c2a3a769
X-MS-TrafficTypeDiagnostic: MWHPR11MB1951:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB19511AFC2A01A5D372AE6FB0F1BB9@MWHPR11MB1951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KMJ2lhgb5zNNwskCNYGEQ7+I4SAcZULbAFc+Z2KaQbHAb2LyiZcvB1p4cNtdp+LY50frzFpEecSGCUYHCMavcWiHQDVvq5aX4LJH26C1eXg6xjs/FCMFO05tZAJjDzYipACY7uqJCkQ4SX8uIoKbds9qAABT2JYvU61jxDkNoCitMZRvY/QPPVXz4aSUhCHMRvruQtcLNBalGjkoXPUPoRvAog+TvFrIjyD5vYQHerPUkPqpRsAeEWjPTdzU2JutPGjC+VWLu0xSsCgdOsdraB0tamduQ+1ZIBmDjc22HWnCw8hgq5ZLB7qBKjEAtEQD8lZztqsFbMSb+UoAM1ntfW2f34DULPpSCZbKv5ZYlcbyliOjqqUsZurZUcv4AFibWcPG8vcEfCIdfdPVX+mAVkxTIdvlcciYQoj0m1yGeuIQKsN7+JI/YuiJpv1yqL8oVEnc65Jucyx1bYkuyiOuc3kV/+2xOZmnDtw9zvm6Z6ucY7gNnut2YH1iiEYAdH6KkCglSj9iyjL9LPjfdwRTlyvH31MpGij56SSdjQKM2Iv73VSey+/2TnEkFOdWrSoUH/PfENGe88k4Dm3aUxPK/QHCPfpKobsWbIEqWFPVPsSjot8Q7VuDOBUjzfgAsDFkx28WTkxMduDRNzsk3iDtJM2hznQGBaVK20D0Asv6bPw3DjJZtrFBKmXGT874SCGo43mlA5079vg3aYUUIgwIwr4Hve61b43xchpuSobN3B4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39850400004)(6486002)(2616005)(36756003)(6706004)(478600001)(52116002)(316002)(2906002)(6916009)(66476007)(66556008)(956004)(31696002)(966005)(16576012)(86362001)(5660300002)(8936002)(26005)(16526019)(6666004)(186003)(83380400001)(66946007)(8676002)(31686004)(53546011)(78286007)(228453006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VzZBVWgxT1BTaFE5MWh6RUxCWkpEUmxQNnBzeXhkN3VRVldmR1dRV05FTkVM?=
 =?utf-8?B?M21KNkVveWthUzNGVmlUOG1vR0JjZU9NTCtabVRxQzhkTjRZbFk1RS9BaFd3?=
 =?utf-8?B?UWpQTlAwUHVpZTl0UGlsTjBNNTh5ZlVqUFV4OEdXeXZLSUU3V25rb0czWlhv?=
 =?utf-8?B?dCtvc3hGMC9QMjNYWmRjQ3dDZG5PZkIwNUhxaEpNVHBSS0xhSFlKMVg3M3ls?=
 =?utf-8?B?WE5NQ3pSVGI3bkNReVJzWm02L2xtUGI0dE5HdUNBUlhQcG9yZ1dhR1pOZmdj?=
 =?utf-8?B?UytMeWpsNlZYYUtwZmR4VGNMbUs1bFowRERYem80V1dTdzJnYW1KOG13dEJM?=
 =?utf-8?B?dy9uNGpKb1NrcHBxQjQvYkZGQUdxQ25GR1RLLyt0TkVlTFo1K1FDTURMTWJF?=
 =?utf-8?B?Ym90ZjVzdFJlaTVzZkI0RFRHY3p5akEyNzN0THFPQ2pXd0V1eEp6bzRBTU0w?=
 =?utf-8?B?WU11YmF4YU1QK0l3YzhqNy9wZW5Tb0IrRXNUZWdmWkwxbExVSFZVOExuWFJy?=
 =?utf-8?B?QW9WZnIwa24zeWFUT0tXSy81cXphWkZJa0RqV0t1THlSSG95OTRCbXBHY1NP?=
 =?utf-8?B?MU5FOUFraG9FcjRsZ3BEcWFxcHJiOUgwSFFGV3YraUJENGY1TktsU2NmOWVo?=
 =?utf-8?B?c3F0OWlmc1I3WXQ5WlV0L2tUd25Md2RleHNuM2psdVcvQ0JqN1ZRY001dlFl?=
 =?utf-8?B?REJ5S3lUTWRrenl6OUZsRkdrQzZ0b3ZDejloV2c1ZFB2OGZCa0krZ3h1TXZ0?=
 =?utf-8?B?VUJFaE5aMWlCQkhZN1g5QXpPU2U3RCtpajRHZlo0azlBRkNPd1c4eHBxODZ0?=
 =?utf-8?B?WjBpdnNNc2lkR0NTSUpLN1BCc3ZVZDZlZEtKb0EzaUN2dyt3Q3B4MFdkRXVs?=
 =?utf-8?B?SFFRZDJCMWVCOU85V1BubjMvYUorb1NOek1TY0h3UGVEeGJxSFJ5ZGZZbEhX?=
 =?utf-8?B?dVcrL1hzK0lnNFZFWlVSQUNjMWNJc2RMOGFyT2pqU0RPZDU4dkY0SFdidVRq?=
 =?utf-8?B?eXBWZlVjL2ZPcFhMSmpsLy90QnY0NUpPQklydDJ6dDNCWjRhQkJCTXU5MDY5?=
 =?utf-8?B?Wi9qcDZ0YlNWRnV6SFE1aTlwTy9mQTYxT0dqV3ZoeDlIaGJKbUxmUU94U1Vl?=
 =?utf-8?B?YnBYZ3RVZnRpQjNDVnVFV3o4RGpVeUJldWViMUhyeXNGTGFlSWU4WUdNVHRy?=
 =?utf-8?B?T01WRmZjMTNCV1RJeEVFUHpXQUtTM3U5M2JXc1FWamx5dEJ0UjdDT1hYVGU1?=
 =?utf-8?B?M1lycjRpdWlaNWFKQ3hOOFQxTEtFZU4vd3dlMzZnMnFLWjdabHU5UWcreTVI?=
 =?utf-8?B?WlZXVnlUaXJuMmliNmR2dDN6cFVMR3VQWkNyNnZhZGZndzBRM29QSElpcmxy?=
 =?utf-8?B?U3NLZWRSNTlVYk9MRW11Y09PemQ4eWFLbTk4ZnlsK0Rja2phOEkybUFST3hW?=
 =?utf-8?Q?79MzV91w?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237fa572-0301-40b8-4a5f-08d8c2a3a769
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:12:21.8123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQmPSIUIa8BA2QPE7/2aDLLqLmmgnSQvIBRn16kZSsDn2/r91YmW4YUXBjhwSwRTSGdTiWVCBOCH7Ky+4xO0JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1951
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

Thanks,

On 1/20/21 3:05 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> When multilib enabled, there comes below error for packages which
> inherit useradd bbclass randomly when build eSDK.
>   $ bitbake image-name -c populate_sdk_ext
>   Exception: subprocess.CalledProcessError: Command '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/lib32-recipe-sysroot/usr/bin/postinst-useradd-lib32-avahi' returned non-zero exit status 1.
>   Subprocess output:
>   /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot-native/usr/sbin/useradd
>   Running useradd commands...
>   NOTE: lib32-avahi: Performing useradd with [--root /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot --system --home /run/avahi-daemon                               --no-create-home --shell /bin/false                               --user-group avahi]
>   useradd: Warning: missing or non-executable shell '/bin/false'
>   abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
>   Check logfile: /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/pseudo//pseudo.log
>   ERROR: lib32-avahi: useradd command did not succeed.
>   ERROR: Logfile of failure stored in: /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/temp/log.do_sdk_depends.20567
> 
>   $ cat  /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/pseudo//pseudo.log
>   [snip]
>   path mismatch [1 link]: ino 26553244 db '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot/etc/group'
> req '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot/etc/group.33605'.
>   [snip]
> 
>   Check the PSEUDO_IGNORE_PATHS in [1], the recipe-sysroot part is
>   /prj/tmp-glibc/work/corei7-32-wrsmllib32-linux/lib32-avahi/0.8-r0/recipe-sysroot.
> 
>   Use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS to guarantee the
>   recipe-syroot part to be /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot
>   to fix the above issue.
> 
>   [1] /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/lib32-recipe-sysroot/usr/bin/postinst-useradd-lib32-avahi
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/conf/bitbake.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index af1b3b8c3e..312b544d41 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -686,7 +686,7 @@ SRC_URI = ""
>   PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
>   PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
>   PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
> -PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
> +PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${RECIPE_SYSROOT},${RECIPE_SYSROOT_NATIVE},${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
>   
>   export PSEUDO_DISABLED = "1"
>   #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
> 
> 
> 
> 
> 
