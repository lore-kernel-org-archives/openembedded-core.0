Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213F6C38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 04:28:28 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.42])
 by mx.groups.io with SMTP id smtpd.web11.95515.1674793704615449119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 20:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=PmZNtryi;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.101.42, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXLUZOilI4PKq1ZIMqFKjLvLKlMk6P+nwKBCqsawYBsviBk+9fTMQBtY7UfsRhIsgAIV5mssCDoE9c43C2NzDbmok/Q7adUqZl3EwC6EQD8dy6gGgwCurDm7VftL1TBeCowLsu+bJ0MljXvFfGUTbN11kbepPr7ozJnx0vnt8LQCkccyohzr8PI/en9TC8NxN96WS2CMcU30aRbJQ+RoGgbe1BTOzi9RUlyCLRO39HwACGetojMJMWMwRuXrqe0GreUgB1NCKHxSBfjQ+qPGBaRa+nKgbIgiGRNjjQEeWZSLO4oSleJa/JD/7ryzFYWVW2NFiuliHCBdO96KhxpbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DRsqrCfgBfA8mtJI8U8ZfwkhvMJ07HtWnCH2diHlKg=;
 b=DGcgjC6G/LV5tYJkVYY5ZTQI/OG+rYyZwS5TEj6jS1jLLWze15J0Zb1gHVddjl9GgJgA5c5gilnLMB3MgxLnOLffIJdUDHT2CbN0hBr+8W3jF64qCJ0JDc1JwmRPmWgbA9VuoWv4lf5U7l7wwQsUjXUjrgHj3pBExQcEP/vxKmX+4/rHeE8aj5eWMUhFDrOMTNWPA2OCzwHKuQtaJiEpSE0dKHVa6lprZP/QCCHQmWOHf+jYpU2uDqi1LO8fPbrRAaxSlOm5Q/pvQUhXu6TIFJDGb5UU0Vg2bZm34KreOZ6hs2LUxJzfmlP3qI7Z4WEkTC+9/BYIBelNlulNVZSW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DRsqrCfgBfA8mtJI8U8ZfwkhvMJ07HtWnCH2diHlKg=;
 b=PmZNtryiqMoIODLxKXA/GGep5y51MHJ5pkXM2gUaSeCmv4jZM0CRL9K0frxea1pbMpaV7L+i4iCe8aEgsc3sZibFArKrPjfcRtSwozb/xk5iXhPmBiykils6yIBJGUxKBfmdBGfvH14cSJvFYtSddVfzod2hyImL8iDf+Ws9mWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 04:28:21 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752%5]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 04:28:21 +0000
Content-Type: multipart/alternative;
 boundary="------------k9sowTuF8VB00wQzQIuswpnp"
Message-ID: <10b31bd2-c183-122f-fa53-292ca5c5db6c@amd.com>
Date: Thu, 26 Jan 2023 21:28:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: python3-bqplot build issues
To: Tim Orling <ticotimo@gmail.com>
Cc: Openembedded Core <openembedded-core@lists.openembedded.org>,
 "Hatle, Mark" <mark.hatle@amd.com>
References: <cccfbf0c-5bb9-45f2-db6d-4d2692a7b729@amd.com>
 <CANx9H-BuquWnmXAcRmzDdpwgxtKE_-+BbdvEKHnEXvmEsHrOPA@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CANx9H-BuquWnmXAcRmzDdpwgxtKE_-+BbdvEKHnEXvmEsHrOPA@mail.gmail.com>
X-ClientProxiedBy: BY3PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:a03:255::28) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: c08449d3-46e4-4081-4361-08db001eebcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ia/LxkqIMaF18k1HfBPcSCUwEPObo1TIqvL5S73CKgEFCm/1JTyDXcGJ5xOhoJDSNw6aGzshcjPoQnxv3mILe54rB7klMomUBW6TYg6xB5vz9TTQ6WWq4HTZITQdGKiyRJVRwbOTMbDc6zuHD+mnpA2lJorDyNGOLniScl0dOkEhYW+7gquqlZbTsAFUMnfUJXZjhr5ff5fTgWwDTMMifn/Yx3Jg2NtAZ35od02R/mISJ94jJehJWUpNCWwfGnFmoV2Fw6tM+amXvLZ8JBYwZPDvVyObo9MWp6pXWcfXtxia50I+hxaU2z2lzf4S5u/aCyZB+SDRyUWWOZmoGI4arrACANdkR5oe638ehTQO9FQ3mGs8kn4vFs73l4zbYljMLeosZLAgvf/f6J32UT3LQBqsKpwW1VPwQrj7TnLmS/NzbuUILQxWU3ctrUM/PMWPIg4PdxMMJ7sYGo0zTtrjOWpdh/GWtoOSbneHv0ZoXhvEMyCPVRXP1bhS0BtDNmGK/CAlAnqzQi9fg6duamnYw2lAiaBwLaE5V4EADK/L14QDO5ydPnW/pqyNPXYnTDvebbaOd3X/5kAZDaoPVcKVD6kAI9acH73DIJCO8xvUxjJukCDRA0+LVOJ1l7k9o3KK6r92mRo7ggkmvOru3FqWeAPLOvTEdCIeBD3t2rz5PtRtDumLhgoAgg1wnpOa2nYMebpAkm4ZrQASCugSnodVWx5LojiVRgdJFmPXaUKWfd5i+vxaXxYM6MrMmDM4MOd7CA8hztXiwNfT1bkTT6LS6gIV992GFFLJicWD4WhFx7+pUrYJZ9b+UIsUVvsDVNmL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199018)(166002)(38100700002)(2616005)(2906002)(8936002)(966005)(54906003)(31686004)(316002)(6486002)(41300700001)(478600001)(86362001)(83380400001)(6512007)(186003)(26005)(6666004)(31696002)(53546011)(6506007)(8676002)(36756003)(33964004)(66946007)(5660300002)(30864003)(4326008)(66476007)(6916009)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RjJkRGRtMStVTkI2TTc4Z1B3amVjMUJqOENzYldZRmlITW84QU9hdFlVYVd4?=
 =?utf-8?B?bjBHcHdVUndCdDFlRXJXaUR5akhLcTh1UkNEVXZTTEtZYzdWRm05TWd3dk96?=
 =?utf-8?B?SVVxNURsMTZ0WmVpNHVuUEF5ZWtKVVhJSXhBU3Rsb1hFaVE1VVVmaEhwWFE5?=
 =?utf-8?B?eGNsWkNTZWUrcndNL3U5YVpVdktsZzZkSE5zcHBVYUw3MFFEQm1VdUM5Y2xS?=
 =?utf-8?B?OU5zQ01DNmVtdmNGN0o4KzJaWXJtRDhUZFRBb0ZVa1Jla3NtVVd0dUxJZHJ0?=
 =?utf-8?B?Ky84aU9aejFsTVZKbVRhRkgwRjFFYUJSbDFvSFp5NVMxVkQxUEN4c202VVNv?=
 =?utf-8?B?U1ZIUGpPcStxcks0ZWZsczhLcjZ2YzdjbXRQVFl6T2lhcGs3M0hiRnc2YjVL?=
 =?utf-8?B?c2VRWEtQMHJTK3g3U1dja1VpNXVJSTE3SVY5Y2RQQWxWWVlVdnRhR1FOc2o2?=
 =?utf-8?B?czNLenB3MFBqcnFwNkYwV0xFZ0VtTlZqaGJ4b0l3bXByaWQxdWU2eDhqSmJM?=
 =?utf-8?B?dksweXUvNjc4aXRGYUlvcXVvUjB5NjQvUnRmblFRQW5sYmR0RjNtRFZSVGRD?=
 =?utf-8?B?YVQ5VFErN0Jpc3VHOGdxeWMxc1V0TEhTL080S3lMeE5pMXlPQmJ0bm5yVWl3?=
 =?utf-8?B?OHJnSHhBeVBSejR0QmJjMk1ZV3FhMm5wYWpDYkxES3ZyZ1V2ZEdhdG95NDNR?=
 =?utf-8?B?Tlg5eldTaHJKbmtvM3N0alFoeXk1NC9vWUs1VEQ0NDc0M1pONGdIVmljVzVy?=
 =?utf-8?B?aWZWUFVqbnFSbEtKMnMvbmVxVUhINDZmM0dlcGF4RTBNZlEzQlJJQUl0YThj?=
 =?utf-8?B?bkNFeGttMDNQZ09CYk5CQk9BUGxLYXpXcVVScG9GTEZQMVUrWENoWDFEUjJh?=
 =?utf-8?B?a0xOV0YrcEJqU3ExMVFrU0kzU1VybkNkVHBUNUxDVWZHRmp6T1ZQYXhJYVpk?=
 =?utf-8?B?RVluZ0txVE9QK0dqODFuZFJnN0JMZTJ2c2tFVXR4aFRvc0Q1STZZRndYUjNX?=
 =?utf-8?B?MlYvTXk1RWo5Sy9hNFUySk53ZlVNVjl5L04rN0pKYmM2a29oZm4vMzBQRnNp?=
 =?utf-8?B?THpjOC9DV3ZSNWt4TW9zY2o4aFBSRHNQQU14ZzcyZjZIbThtQ3RoV3pFaWx4?=
 =?utf-8?B?VmRTWVl0OGprRkpIRDNBNlZMd0ZIRFRuV2ZjVktkRnkxZGV6U1lPWmRVNnZP?=
 =?utf-8?B?ZnhSTUxxeU45cndvVWNQY2wwcmw3UHFsYkxXNDlidVE3SmlMNnF5YnNWNzNJ?=
 =?utf-8?B?ZVUxR3pWeVMwR2NGVE1ERnlCdUE0TXFCU0hKeExCTURJRDlqTFRqK2RaTGlX?=
 =?utf-8?B?R3NjLzdUTDVVVXdFS0lwMmluUzJDUEp4TElucGJmRGJlVFM3RE9Fb1JFNUc2?=
 =?utf-8?B?emhWU2pNYnEwdWUwUDRHOHprREcwWm9WNEYrZWtOTkEwRElpak13d0VibTJa?=
 =?utf-8?B?QWY0UkZaZEZoVERoVGJ0YzRJeWdoV21pN3pjY2wydVZYeWVXWE9uWFQrZ3gw?=
 =?utf-8?B?cXBBNTZMSXJGT0taUkRMdUlXeUV4ZXBBbEhDL2E4TE5wRXV0R3RYbUVnV0Ux?=
 =?utf-8?B?bjRPMjhmMGk0VUwxWmI5MDZDendmaDQ2dkpKUDJUc2tuQW1JcFhMbmRrQjRl?=
 =?utf-8?B?cmJ4L2Jselp6SnQ3b1A5UWpIclpjNU1iRG5FVUVCTEtYeG1ubk9Ya2V5TDBn?=
 =?utf-8?B?MTNPdWZDVXVoNGdRZi9veDBDZDdhN0RBeElMcFVFR3Q3SkxvWG10WklFOUQ5?=
 =?utf-8?B?dmFMbFE2Mkh3SVRUQXZJK2IzSWRySysrZEY0a2pBZWpXNmVQbU12blh4NVdx?=
 =?utf-8?B?NmFwR1JoeWtOUG5Fcnh3WTdvbkk1cVZma1J6YlVyZVhPNHdIaVVPQnM2T2Jq?=
 =?utf-8?B?VjJrQStEcHhWMUVTcUtGK2lkdTdhMmxaeXlJV2dZS3Uvdm16RnpDNlpyTi9y?=
 =?utf-8?B?UEtYUWplaDl4V0E4S25QKzJEQkk3cnU4Ym42SWRJZW0vT3dFRnFTUExSSHY4?=
 =?utf-8?B?cnRhNkFyeDk5aEM2bTNQV1lQZ0I1SGgvTEEyWkgzSTd1c0o4NXNrRmVZc3Fm?=
 =?utf-8?B?RDNIQU5FaUIxZnJMa1pHa25lSjZmQVhkdEZsWDRKRDNTSGJFOWVucW4rZ0RE?=
 =?utf-8?Q?0ZlGAk2oGPld0GpkMC1s46o51?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08449d3-46e4-4081-4361-08db001eebcc
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 04:28:20.9982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/elMCr8RK7p1yJS9C6fnn2/dQr4UeSjTvdBVUKhZPo4cvUbcUI9zWSZqNUMxGkqGIbwRgPELtBA9L58lmSLvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 04:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176434

--------------k9sowTuF8VB00wQzQIuswpnp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Tim for your help.

On 1/26/2023 1:40 PM, Tim Orling wrote:
>
>
> On Wed, Jan 25, 2023 at 11:17 AM Gundlupet Raju, Sandeep 
> <sandeep.gundlupet-raju@amd.com> wrote:
>
>     Hello,
>
>     I'm upgrading python3-bqplot from honister to langdale in
>     meta-jupyter,
>     I've migrated the recipe version from 0.12.31 ->0.12.36 but I'm
>     running
>     into build missing dependencies issues. Even if I use 0.12.31 issues
>     exists in kirkstone and langdale.
>
>     Any help from community will be much appreciated.
>
>     https://github.com/Xilinx/meta-jupyter/blob/langdale/recipes-python/python3-bqplot_0.12.31.bb
>
>     ============
>
>     Source repo:
>
>     ============
>
>     https://github.com/bqplot/bqplot/tree/0.12.36
>
>     ================================================================
>
>     0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch:
>
>     ================================================================
>
>      From c4681f95099516e96b1c7be757da6e0f302f50fe Mon Sep 17 00:00:00
>     2001
>     From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>     Date: Tue, 13 Dec 2022 15:41:18 -0700
>     Subject: [PATCH] pyproject.toml: Allow jupyter packaging to be
>     greater than
>       0.7
>
>     Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>     ---
>       pyproject.toml | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/pyproject.toml b/pyproject.toml
>     index ba04c53f..7a3cc3a9 100644
>     --- a/pyproject.toml
>     +++ b/pyproject.toml
>     @@ -1,3 +1,3 @@
>       [build-system]
>     -requires = ["jupyter_packaging~=0.7.9", "jupyterlab~=3.0",
>     "setuptools>=40.8.0", "wheel"]
>     +requires = ["jupyter_packaging~=0.9,<2", "jupyterlab~=3.0,<4",
>
> These are build time dependencies so they need to be in DEPENDS, not 
> RDEPENDS.
>
>
>     "setuptools", "wheel"]
>       build-backend = "setuptools.build_meta"
>     -- 
>     2.17.1
>
>     =================================
>
>     python3-bqplot_0.12.36.bb <http://python3-bqplot_0.12.36.bb> recipe:
>
>     =================================
>
>     SUMMARY = "Interactive plotting for the Jupyter notebook, using
>     d3.js and \
>             ipywidgets."
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
>          "
>
> In the prior 0.12.31 ecipe, you had
>  DEPENDS += " \
> ${PYTHON_PN}-jupyter-packaging-native \
> "
> So according to the "requires =" in [build-system], you should also 
> need python3-jupyterlab-native

[Sandeep]: I tried this still same issue. But I can build all the 
jupyter-packaging and jupyterlab packages.

=======

recipe:

======

SUMMARY = "Interactive plotting for the Jupyter notebook, using d3.js and \
            ipywidgets."
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=822b4ff4dd277d70fc2b796617ae1bf7"

PYPI_PACKAGE = "bqplot"
inherit pypi python_setuptools_build_meta

SRC_URI[sha256sum] = 
"6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af"
SRC_URI += "\
file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch \
     "
DEPENDS += " \
         ${PYTHON_PN}-jupyter-packaging-native \
         ${PYTHON_PN}-jupyterlab-native \
         "

RDEPENDS:${PN} += " \
         ${PYTHON_PN}-ipywidgets \
         ${PYTHON_PN}-traitlets \
         ${PYTHON_PN}-traittypes \
         ${PYTHON_PN}-numpy \
         ${PYTHON_PN}-pandas \
         "

do_install:append() {
         # this files will be installed by python3-json5
         rm -f 
${D}${PYTHON_SITEPACKAGES_DIR}/tests/__pycache__/__init__.cpython-37.pyc
}

FILES:${PN} += "${datadir}/*"

=========

bootlogs:

=========

ERROR: python3-bqplot-0.12.36-r0 do_compile: 
ExecutionError('/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642', 
1, None, None)
ERROR: Logfile of failure stored in: 
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/log.do_compile.3184642
Log data follows:
| DEBUG: Executing shell function do_compile
| Missing build dependencies:
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyter_packaging~=0.7.9,<2
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| - jupyterlab~=3.0,<4
| WARNING: 
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642:157 
exit 1 from 'nativepython3 -m picobuild --source 
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36 
--dest 
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/dist 
--wheel'
| WARNING: Backtrace (BB generated script):
|       #1: python_pep517_do_compile, 
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642, 
line 157
|       #2: do_compile, 
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642, 
line 152
|       #3: main, 
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642, 
line 161
ERROR: Task 
(/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:do_compile) 
failed with exit code '1

>
>     RDEPENDS:${PN} += " \
>          ${PYTHON_PN}-jupyter-packaging \
>          ${PYTHON_PN}-jupyterlab \
>          ${PYTHON_PN}-ipywidgets \
>          ${PYTHON_PN}-traitlets \
>          ${PYTHON_PN}-traittypes \
>          ${PYTHON_PN}-numpy \
>          ${PYTHON_PN}-pandas \
>          "
>
>     do_install:append() {
>          # this files will be installed by python3-json5
>          rm -f
>     ${D}${PYTHON_SITEPACKAGES_DIR}/tests/__pycache__/__init__.cpython-37.pyc
>     }
>
>     FILES:${PN} += "${datadir}/*"
>
>     =================
>
>     Build error logs:
>
>     =================
>
>     NOTE: Executing Tasks
>     ERROR: python3-bqplot-0.12.36-r0 do_compile:
>     ExecutionError('/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058',
>
>     1, None, None)
>     ERROR: Logfile of failure stored in:
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/log.do_compile.3777058
>     Log data follows:
>     | DEBUG: Executing shell function do_compile
>     | Missing build dependencies:
>     | - jupyter_packaging~=0.9,<2
>     | - jupyterlab~=3.0,<4
>     | WARNING:
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058:157
>
>     exit 1 from 'nativepython3 -m picobuild --source
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36
>
>     --dest
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/dist
>
>     --wheel'
>     | WARNING: Backtrace (BB generated script):
>     |       #1: python_pep517_do_compile,
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
>
>     line 157
>     |       #2: do_compile,
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
>
>     line 152
>     |       #3: main,
>     /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
>
>     line 161
>     ERROR: Task
>     (/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:do_compile)
>
>     failed with exit code '1'
>     NOTE: Tasks Summary: Attempted 2249 tasks of which 2241 didn't
>     need to
>     be rerun and 1 failed.
>
>     Summary: 1 task failed:
>     /group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:do_compile
>     Summary: There was 1 WARNING message.
>     Summary: There was 1 ERROR message, returning a non-zero exit code.
>
>     Thanks,
>
>     Sandeep
>
>
--------------k9sowTuF8VB00wQzQIuswpnp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Thanks Tim for your help.<br>
    </p>
    <div class="moz-cite-prefix">On 1/26/2023 1:40 PM, Tim Orling wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANx9H-BuquWnmXAcRmzDdpwgxtKE_-+BbdvEKHnEXvmEsHrOPA@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Jan 25, 2023 at
            11:17 AM Gundlupet Raju, Sandeep &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            Hello,<br>
            <br>
            I'm upgrading python3-bqplot from honister to langdale in
            meta-jupyter, <br>
            I've migrated the recipe version from 0.12.31 -&gt;0.12.36
            but I'm running <br>
            into build missing dependencies issues. Even if I use
            0.12.31 issues <br>
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
            &nbsp;From c4681f95099516e96b1c7be757da6e0f302f50fe Mon Sep 17
            00:00:00 2001<br>
            From: Sandeep Gundlupet Raju &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;<br>
            Date: Tue, 13 Dec 2022 15:41:18 -0700<br>
            Subject: [PATCH] pyproject.toml: Allow jupyter packaging to
            be greater than<br>
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
            -requires = [&quot;jupyter_packaging~=0.7.9&quot;, &quot;jupyterlab~=3.0&quot;,
            <br>
            &quot;setuptools&gt;=40.8.0&quot;, &quot;wheel&quot;]<br>
            +requires = [&quot;jupyter_packaging~=0.9,&lt;2&quot;,
            &quot;jupyterlab~=3.0,&lt;4&quot;,</blockquote>
          <div>These are build time dependencies so they need to be in
            DEPENDS, not RDEPENDS.&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
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
            SUMMARY = &quot;Interactive plotting for the Jupyter notebook,
            using d3.js and \<br>
            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ipywidgets.&quot;<br>
            LICENSE = &quot;Apache-2.0&quot;<br>
            LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=822b4ff4dd277d70fc2b796617ae1bf7">&quot;file://LICENSE;md5=822b4ff4dd277d70fc2b796617ae1bf7&quot;</a><br>
            <br>
            PYPI_PACKAGE = &quot;bqplot&quot;<br>
            inherit pypi python_setuptools_build_meta<br>
            <br>
            SRC_URI[sha256sum] = <br>
&quot;6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af&quot;<br>
            SRC_URI += &quot;\<br>
<a class="moz-txt-link-freetext" href="file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch">file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch</a> \<br>
            &nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
            <br>
          </blockquote>
          <div>In the prior 0.12.31 ecipe, you had</div>
          <div>&nbsp;DEPENDS += &quot; \</div>
          ${PYTHON_PN}-jupyter-packaging-native \<br>
          &quot;</div>
        <div class="gmail_quote">So according to the &quot;requires =&quot; in
          [build-system], you should also need python3-jupyterlab-native</div>
      </div>
    </blockquote>
    <p>[Sandeep]: I tried this still same issue. But I can build all the
      jupyter-packaging and jupyterlab packages.<br>
    </p>
    <p>=======<br>
    </p>
    <p>recipe:</p>
    <p>======<br>
    </p>
    <p>SUMMARY = &quot;Interactive plotting for the Jupyter notebook, using
      d3.js and \<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ipywidgets.&quot;<br>
      LICENSE = &quot;Apache-2.0&quot;<br>
      LIC_FILES_CHKSUM =
      <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=822b4ff4dd277d70fc2b796617ae1bf7">&quot;file://LICENSE;md5=822b4ff4dd277d70fc2b796617ae1bf7&quot;</a><br>
      <br>
      PYPI_PACKAGE = &quot;bqplot&quot;<br>
      inherit pypi python_setuptools_build_meta<br>
      <br>
      SRC_URI[sha256sum] =
      &quot;6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af&quot;<br>
      SRC_URI += &quot;\<br>
      &nbsp;&nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch">file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch</a>
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
      line 161<br>
      ERROR: Task
(/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:do_compile)
      failed with exit code '1<br>
    </p>
    <blockquote type="cite" cite="mid:CANx9H-BuquWnmXAcRmzDdpwgxtKE_-+BbdvEKHnEXvmEsHrOPA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote"><br>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
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
            &nbsp;&nbsp;&nbsp; &nbsp;# this files will be installed by python3-json5<br>
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
            NOTE: Tasks Summary: Attempted 2249 tasks of which 2241
            didn't need to <br>
            be rerun and 1 failed.<br>
            <br>
            Summary: 1 task failed:<br>
/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:do_compile<br>
            Summary: There was 1 WARNING message.<br>
            Summary: There was 1 ERROR message, returning a non-zero
            exit code.<br>
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
  </body>
</html>

--------------k9sowTuF8VB00wQzQIuswpnp--

