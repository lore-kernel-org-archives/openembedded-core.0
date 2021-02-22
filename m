Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.80])
 by mx.groups.io with SMTP id smtpd.web11.29084.1613958371422924200
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 17:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YwvQ5bQ+;
 spf=pass (domain: windriver.com, ip: 40.107.102.80, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crehHPA0rPiqT8OVtnQ1v1H1HKGP8gGBDDl1bha7kvscoqqmsLCYVdw3PRVVPMlc1LFbN8VaJ3lQwvqSne2JYVGSKdjvcdRV4dIo+wDhc0ouy16Sqh81I4bQIhQyREoViUh6r4BWUsiuEHOAdhUB8VR5R8dwUvy8QjTg1bLgroyJUX/O5oANK7YiuAmN2HVgsepZT6tvE1hyHkWMa0n0wV0rlqdHbvZll8s2qm1BbTVY5K2SM7vD0CBqcND849777Zx/zB+98upei60625Z9+jeIjuGBoTyk7+MbRW/KGJWHwTFT1dMbxo5rgyt5yXXV3xXFtHGRiEVKojHzmMFtAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XJVYYR5f/drU5SLvX7K3wgc8mjfU2aV8qoAOt1qdT0=;
 b=I3jVOvC0hy5udn28ScNvfGhLei3R2p+pZLB1FKdGmBFq0vRlO0hVU7beEsCm7EmPwPaGX64SZuIHIYpDar3XU9yiAeKOqFIJyNkjbCd0ntjTD3ubk+Jluba8X4Vg5D8uXMaadkrAPzAwieXcH73JPl1JhBJvmiNnOhkX114IPa7mr6uyEF2crnSZQxQE70yPxtI726E7/Fat7yJAy/BrcPxLdWHdwwZtRfzSZEZBCnmKs7XuGb/UByb0kc2o25IgmjWoRreDfbRWqyL9AdfffkgtcedzkeMg0LBfrkdFKpezdH9UFhdo+Z+bHBTk9mk/yOMeen1zw6gK+cOndeO9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XJVYYR5f/drU5SLvX7K3wgc8mjfU2aV8qoAOt1qdT0=;
 b=YwvQ5bQ+OwW220T+xya55OnhjBEBwMe2ciA1D85xctOqJqT+PDSQnxnEed+0mjvuvwZ7PADZ2Ip+ocUpz2r0yEq1bDCLDYvuwTyHXeH+B/AzlGjAdOEayfM1NELfYAVH29LaFRg7PB2X4dY6yPx9Dp+ITac9tJz2N3BwiktRSRU=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR1101MB2088.namprd11.prod.outlook.com (2603:10b6:910:17::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Mon, 22 Feb
 2021 01:46:09 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484%4]) with mapi id 15.20.3846.045; Mon, 22 Feb 2021
 01:46:09 +0000
Subject: Re: [OE-core] [PATCH v2 1/1] Customize prompt string for SDKs
From: "kai" <kai.kang@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20210108010259.25628-1-kai.kang@windriver.com>
 <16581C35A2764503.27524@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <4a696ed8-9cd1-4486-19b3-2a738e9e21dd@windriver.com>
Date: Mon, 22 Feb 2021 09:46:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16581C35A2764503.27524@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by BY3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:a03:254::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.11 via Frontend Transport; Mon, 22 Feb 2021 01:46:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7c677c3-3c95-4132-7401-08d8d6d3a050
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2088:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB2088B239F0A610F5BC6B0CCD95819@CY4PR1101MB2088.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r/v1Hr81WP4rgi1RdHTM2rWo9a6/qCBzSI9vFHTp+2pEl1b8KpueYVbm3223PHVdK8Aq8+1clNAjQkJIzXY6W/YN4SaILslMO0Xk9fIdlYgnNWDvLXWqpULYdsh2d6w+0lp9QUuyY9FbXbATs0VYwThTRySwc8WcnE1VDHN/wzRNClNmgIpwss3Oteqjw1XCe/dueBYSNNvAcOF1OfRQ98CQDAaYkiwMFLyiuOkMjZLHzBn5/QNv1llTbV47bPPJ9oSe4UIe4p77YFrmAzAjUyMeKYtA7gYNjttCuZmPJ3PoGbIDB5nqEdFPuiFP5fY3TiTCPwBB/RJue+ZlnK2Jm6/zNFLkpHbV26g+mdA/3AGii3F4KDsiX/UzA2v811MEpheJfc6giy/H/LeXyA8MEdY1I6xSA5rkmL8EXgSCnGiZ87bb8YwGPKVMY1qCDSzh+mG0+n5yKuV8jJ+jTyhXo2nO6fWLXixpElSC/i36r7CmDvS78dFHdTt8bEef97uPStaKft5fp3uEl/ymaNmmzZkHGHkJMrklQGnUW8iCNmp0eKfzrJX7rmknGru+F662KQ1XjYZ/vKborcQqUbpx8wUKM2IIofdwxGavcpuSVKkyyaWAcmTzlqQ/9pD+KHl9Mm9mCozk8VCiYGy21L3MU3f+B5MxXUpTVvuTRYgRGEgncVvRHJDekLS1i/Ul36vuEmnkqsYlnv1wjwoz7poBug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(346002)(376002)(366004)(136003)(52116002)(478600001)(66946007)(6916009)(66476007)(66556008)(8676002)(186003)(16576012)(316002)(966005)(83380400001)(166002)(8936002)(33964004)(31686004)(5660300002)(6706004)(2616005)(2906002)(26005)(86362001)(53546011)(956004)(36756003)(31696002)(4326008)(16526019)(6486002)(6666004)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SEhUYTJCUlRUbkxqMDViZlFGcWZ4R0E3TmFEbmNKb1U0Zms0RE9zaVdEV2d3?=
 =?utf-8?B?RFFZTWlUU2UvcGQrTGRBMzg4dXhQWjUvcWQxWnZBbXpacXpjZUJrajh4NTdJ?=
 =?utf-8?B?OFErUkM4TzI1cTBDMkovbnV3dWQvZlVPRUYyMENjR0NtbDNjU2U3QUFkOG1P?=
 =?utf-8?B?c09RbEpTSnpqSUxoenZGM1FOcHlyVkplTytzaEVRMjFLZC94NUJQWGVHczM5?=
 =?utf-8?B?bWdrTHREelMrSnl0aTBZZVhBb0RWZFNMdC81RTVGRndEZXFvV2ZhemI0Unh6?=
 =?utf-8?B?My9ISWdDK0VhNGtlY1NERWhEQnlRSUhoZTNSZUFJV0NGNTdJam5zaTZkZjZ1?=
 =?utf-8?B?QSthMXhxWDhVSnp6QXkyeEJwRTVWdStJWTBBMWdWdkNoS2pqRXZ2ai9JZitt?=
 =?utf-8?B?NlNIKy9ralJZN0s3b0lmTjk1dFVnNDAwdFM2dzBjMWJkRXlyQTN5Tll3eSsr?=
 =?utf-8?B?cnkxRWtEQ2p3bm9EWWo4cWw5WXBtc0I0eU1zZXFwMkV6TmsvTlNOcmhaK1BW?=
 =?utf-8?B?MmltSVQ0MVJYZzU2SlV0VDQxeURQNnlneThMaTlBVzh4Qkx2TzlCMnVTdW92?=
 =?utf-8?B?Mzh4dFdsWUJDUTJyaGxBZFlwb3k2NCtZT2pEUHpHUVlSMUYxb1JlaEVXQU1w?=
 =?utf-8?B?YjV0SFYyTWEvWlZlOTlrNURScnhCVGsxMU1DRDBSMHhSSDRxUW5yMW4wRUYw?=
 =?utf-8?B?YWdpV0ZCUkZJZU1rdzQ4ZGRRaWRvSTd3TjZnQmtjeDlqWlFqeUl6Z1E1ZXVI?=
 =?utf-8?B?V2ZLemxEeUsyaHVXdldaQ29jdkwwb2s1T045TkxrQmhicjdFZDB6SjQ0L1A3?=
 =?utf-8?B?TStrN3FBM1Y5ZlBEaGZkV2pTY3FTS1R6d2FOOTRUVVBDRzVIall6cXhMOGR3?=
 =?utf-8?B?bW9XamRRdVJTbWM2eFJ3SzcwdnE4WDNXMjFmVEtHUVFHOFhwV2VlVUI2NE5X?=
 =?utf-8?B?azVCem1jQWNQL2xEK2xIdGhaUU1NSUNFM2NLWUZuQXlPUDF3eUw3QUxjTFBj?=
 =?utf-8?B?d0hwMFplV0xJSGNWWGNPM21RV214MUdkUEY1b2srTFN0TnRrWk4rSGVUQTJ2?=
 =?utf-8?B?T2IvLzZqWEx4MXE0VmdzK2Y2TFNXU0J1M1lRcGpvcmdRL3l1MUxPbjFRKzQ5?=
 =?utf-8?B?OFQ5NWFUU0pOUENmNTkvR284Z2dnWHhaK3FJQTlzUll4eTFSeFJ2Q2pXQ2xE?=
 =?utf-8?B?MjJES2tTZy9WcFNjSzdSTk1TMk5kdXlMOEsrR200WFYraXRzL3hSNW5waXdX?=
 =?utf-8?B?VTJEeEQwZE05UzdEWTh4elY3ZCtzOG1GVyttNXZIZVdpZHZubVNCUlNDM2o2?=
 =?utf-8?B?YllIQk5HWlhQWlpCbzhKZW45dWxyUm5NYjJObDVzQ0VVaktqQ0hwMmhQd1VV?=
 =?utf-8?B?VE5JMG5FeWcvWDA1Y0ZVS29pL0Y5ZkJOQkR6cVpGZnB0R0lWUk5tYTd6SldD?=
 =?utf-8?B?QzRwek5TaUhhV2NJVUJXelZWY0QzaUVrM0d2cGg1REZVS29NZjZENW1ubXlT?=
 =?utf-8?B?TGZwc2RjbDVPamFIMm0xRkdjVlN2dzBuM3pYSnVwTmswZUVrdXB4d3ErTW4r?=
 =?utf-8?B?cExKU0YvaE14K1NmcldGTEIvcWd1UHJUSmRWU1VqaDBaMUhiZ2FybGs1TW40?=
 =?utf-8?B?YXM0SjR1UW1oNGoyWVNNRXAzK0RhVGNvY29IalRtZkJqZDhGQWt5LzY3cXY0?=
 =?utf-8?B?ejE1QTg0Z3lvUVg5MlQ3RUJySGRlWmpZcnRQZEVvK2RxQi91NTdjWk1jZFN4?=
 =?utf-8?Q?LbOcEcVWd08xHJ5rCuBeTS2ptP8S9fKWOi9/0+k?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c677c3-3c95-4132-7401-08d8d6d3a050
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 01:46:09.1674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2w0gvJ67IduSuKhxMtXZnCmDjgJ2IbLr93YeQt/2os47iFmCqWFfWdtXqyjOlr2BvfGbRitHD7QYKg95/ND3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2088
Content-Type: multipart/alternative;
 boundary="------------319D618288513FEA6A6977EE"
Content-Language: en-US

--------------319D618288513FEA6A6977EE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/21 9:02 AM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Introduce a new variable SDK_PS1 to customize prompt string for SDKs
> when source script environment-setup-script. The prompt string of SDKs
> is set by default with something looks like:
>
> SDK-poky-glibc-x86_64--cortexa57-qemuarm64$

Hi Richard,

It has been in master-next for a long time. Any concern about it please?

Regards,
Kai

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/classes/toolchain-scripts.bbclass       | 1 +
>   meta/conf/bitbake.conf                       | 1 +
>   meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>   3 files changed, 3 insertions(+)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index db1d3215ef..88df373d0b 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -45,6 +45,7 @@ toolchain_create_sdk_env_script () {
>   		EXTRAPATH="$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i"
>   	done
>   	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH' >> $script
> +	echo 'export PS1="${SDK_PS1}"' >>$script
>   	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
>   	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig' >> $script
>   	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a04005b0f5..93687f9950 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -424,6 +424,7 @@ PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
>   
>   SDK_NAME_PREFIX ?= "oecore"
>   SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
> +SDK_PS1 ?= "SDK-${SDK_NAME}:\\\\$ "
>   SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
>   SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>   
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index 9da81d5523..59cfc64ce8 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -71,6 +71,7 @@ create_sdk_files_append () {
>   	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
>   	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
>   	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
> +	echo 'export PS1="${SDK_PS1}"' >>$script
>   
>   	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
>   
>
> 
>

-- 
Kai Kang
Wind River Linux


--------------319D618288513FEA6A6977EE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/8/21 9:02 AM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16581C35A2764503.27524@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Introduce a new variable SDK_PS1 to customize prompt string for SDKs
when source script environment-setup-script. The prompt string of SDKs
is set by default with something looks like:

SDK-poky-glibc-x86_64--cortexa57-qemuarm64$</pre>
    </blockquote>
    <p>Hi Richard,</p>
    <p>It has been in master-next for a long time. Any concern about it
      please?</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type="cite" cite="mid:16581C35A2764503.27524@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 meta/classes/toolchain-scripts.bbclass       | 1 +
 meta/conf/bitbake.conf                       | 1 +
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index db1d3215ef..88df373d0b 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -45,6 +45,7 @@ toolchain_create_sdk_env_script () {
 		EXTRAPATH=&quot;$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i&quot;
 	done
 	echo &quot;export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}&quot;$EXTRAPATH':$PATH' &gt;&gt; $script
+	echo 'export PS1=&quot;${SDK_PS1}&quot;' &gt;&gt;$script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' &gt;&gt; $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'&quot;$libdir&quot;'/pkgconfig:$SDKTARGETSYSROOT'&quot;$prefix&quot;'/share/pkgconfig' &gt;&gt; $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'&quot;${multimach_target_sys}&quot; &gt;&gt; $script
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a04005b0f5..93687f9950 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -424,6 +424,7 @@ PKGDATA_DIR = &quot;${TMPDIR}/pkgdata/${MACHINE}&quot;
 
 SDK_NAME_PREFIX ?= &quot;oecore&quot;
 SDK_NAME = &quot;${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}&quot;
+SDK_PS1 ?= &quot;SDK-${SDK_NAME}:\\\\$ &quot;
 SDKPATH = &quot;/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}&quot;
 SDKPATHNATIVE = &quot;${SDKPATH}/sysroots/${SDK_SYS}&quot;
 
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 9da81d5523..59cfc64ce8 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -71,6 +71,7 @@ create_sdk_files_append () {
 	echo 'export OECORE_NATIVE_SYSROOT=&quot;${SDKPATHNATIVE}&quot;' &gt;&gt; $script
 	echo 'export GIT_SSL_CAINFO=&quot;${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt&quot;' &gt;&gt;$script
 	echo 'export SSL_CERT_FILE=&quot;${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt&quot;' &gt;&gt;$script
+	echo 'export PS1=&quot;${SDK_PS1}&quot;' &gt;&gt;$script
 
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------319D618288513FEA6A6977EE--
