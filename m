Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.5511.1623396695982697711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 00:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KpPsDOko;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=179608fda6=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15B7FPpu002931
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 00:31:35 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3942cy81du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 00:31:35 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15B7SgXt023287
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 00:31:35 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3942cy81dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jun 2021 00:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vi7K6atQb0t9RCIfzddCR8nHHHyZziwIOka5t9duHqvtIf4Q+EXbjKP07cQdW+HaJ/kvlVVZo6M7CrV4tvlxT/2KGFyd1R8JS7KRV8TbkXD/nE+wcz7oVHrYqzuKCe1n7sceDzbLTm6X8FGg95KK9fzvWK0LN9RVFHcaEgEpG+Ma+XDggz9ZmxEqPVUZWc2rtX8rtzohqNoKCwvDazpdGHap0SN6v/qagiCVcv/FTRAOsotSedUycwEw7kcUp1+cZZOBTwEGR6k2jhn4hDy0o5tSHKnIBdd0imbG6fSgE+S35ZA0hF9HxwrDpSIlPT6Cy1ET+p0SlcTJR9Yc0gozLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFLWHh9zLexbUlJTXhbLiNDCD09wDBJouzDaKpEH8vk=;
 b=M41PYSORkNSLhVOEVSBxjLMU8e3cJLhduaLyZ7Oizv53f3NhqcDFSz0GSXZTtOezNUr7CNBw4ygIDSstEZGtHMdZm6Upnte6IOmB9na6WfaEjILbMUeCjgoUgewvRbBhcPbVPFf+P50Fr/W1uK8wI6NfT8QKFUtsdhzCPSaWsW1IbX2bcoYz7w/IppIohRKMDa7bxvPJ88Bg4kC9/7QD/hkixJ1nViTVUCuZKeyv/GD1tPr+DqcBAJAd0Lb5l/4DnzisYAQddGRuLmEcmJVWK8u4VST/G9wxJ2lPEFRkmLP3EIEhfc2DxI+vdUdT8g9flLmiJfwgfLoTxeHCmGAqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFLWHh9zLexbUlJTXhbLiNDCD09wDBJouzDaKpEH8vk=;
 b=KpPsDOkoJWPLCsBZsWA+kC0/rmyyhORdBf66cadC63zai7kAXWhM+JSZq/u6Au6stuS6dYGj9/SOinLP1cM55/eGCz4tNim4EuJv6+HjWN78yvWBmwxreasjYzF/sFOV3pMxAdvbKA0G5AQJ1a2uRWM+dnTusHrp9hgv7eff7FM=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB2031.namprd11.prod.outlook.com (2603:10b6:300:29::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Fri, 11 Jun
 2021 07:31:33 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127%7]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 07:31:33 +0000
Subject: Re: [oe-core][PATCH 3/4] archive: fix racing between do_ar_patched and do_kernel_configme
To: hongxu <hongxu.jia@windriver.com>,
        openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org
References: <20200925070535.59518-1-hongxu.jia@windriver.com>
 <20200925070535.59518-4-hongxu.jia@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <0b5fd7fd-f18f-20d5-22bc-588652dfef66@windriver.com>
Date: Fri, 11 Jun 2021 15:38:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200925070535.59518-4-hongxu.jia@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0020.apcprd03.prod.outlook.com
 (2603:1096:202::30) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK2PR0302CA0020.apcprd03.prod.outlook.com (2603:1096:202::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 07:31:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf6fa427-a04d-4555-2730-08d92caaf00c
X-MS-TrafficTypeDiagnostic: MWHPR11MB2031:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB2031A5F6B417D938575A4D76F1349@MWHPR11MB2031.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gr1Tx77cbx1hWdE3jqzxLJc+zxy+4VbJD5+nU613g+7ZRaUYMECxLyT3XJYYkXPsQOV9gYJ3bZTnsKgWyvLgwG1UlKmBvjkiQctljqxruAPf6i4joPCY+vR48MjRgR4PaY9AWRGGvugSR+SPZUYuC27aZeWj22XnK7enRSgYJq/wSogrJpJBqTCdWaA9E5KdcDn7KWs7g+GjD2b0gp1NCArtrEbB1Law0GImcpZaeoz1GiniWCpkS0F5RNIJTZJ50cQUDWNxMbubcRcapdJo6EkU8tX1X8Job0JoSY1sZXnhjOvQaCUh578g7fDmPdeNWRXneldmmiZobstHmG/VHF1mLzxZ1mgPzg4KupMUH0F9iPuDz4JRe4yrTfMNDXfPm+MvAU+PgHqdxTHU5JCclr/kLJt74MN+0gE8u8+Lh/EMs4+DTx4f+CObAtjrqGxN79OonulwwgNt96i9kZvdqtlNVqAo+xAMwVlNHdu6XkqtJJugZi27K7Pe3X6gBr+BqIvn/IUca4JwQejv7d8in8IkKzbGU2aMfr6nl3I/pFmjh1dnogmbYrcGSU/MeRA9CdDCxr4oZa+0/KWO74DH6Ov+9AARYAH+XiG9FxtieyqqFd9+lrfWXgACrodBGb5o37BiKtKT6hJw+kz78ZhsNTI/NkwL2+sk5YRCljL82ACxJpqOaCWd4GLCJeiOf1yzw2b/2XOS6sEtjHHLdkTV7aRlW5jjgWjBBYfL/8ao9bFzqyJdAjRew7Z911TE8JX/55MONqqlyZDeJxUl5tY/+O5jGorfPEK7BPD4NQWP+8SdujAXYJmovaA2oMV9Ml5T10y4B5NoFm12e7bJezkdHmEUNEabtx+Wvp/7vdK7cAh8AMEnpusQx1aJ52W6pgcug/8C8X6HbJOJo5TODGzjDg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39830400003)(136003)(396003)(366004)(83380400001)(6486002)(31686004)(26005)(8936002)(66946007)(5660300002)(16576012)(6666004)(6706004)(36756003)(66556008)(66476007)(52116002)(478600001)(966005)(31696002)(316002)(186003)(38100700002)(53546011)(2616005)(956004)(16526019)(2906002)(8676002)(86362001)(38350700002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmRsZXdSOWo4S2owWFZxSEhZeS91dGVpYlFCY3FpQjlaSmZkSG1CT2Z4Z1Z1?=
 =?utf-8?B?Yk1sbjNFQzJ5TmNMY0xQYVJkSWd3QlJpeHpFa25pa3NWOVdHODVxTTdwVThF?=
 =?utf-8?B?WndmSjRxd2R0QjVsOEhkd3IzaGx4Z0RZY1E1eDV2NkxEZC9NK1ZnUmZVQzVw?=
 =?utf-8?B?bVpUVVFHQVJwQmF3amJJM2EyUEs1TjBLSE9JdEozaERsbjcxeWlFMmVib0xk?=
 =?utf-8?B?UTlsSTA2dzBnOEdFcFpxK0V5eXp5S1N2amxrVUdFa2d5YlVHWm5uNTRlMmZu?=
 =?utf-8?B?eGc1RW11TXlpVVprcWpKeHlGcHhsSW1HTUFDVnF4MlJvd2lPUmRTTHRTenpY?=
 =?utf-8?B?SjJlWDRkYk5Ib0lIVmFjZXIySzh1aVVRQ1IzdSsxbjV4bTdTTHd5Sm5vU1dl?=
 =?utf-8?B?Y1lvTUFWM1ZRTGpLZUVTaW4rVmRoQ0tIZ2tnVnp0NUVsUEtvMHFraEhrUW5D?=
 =?utf-8?B?eC9xMEs1bWVDOEFBdk1Ga2d6eDNhaGVlT2xRYlVZYVpZbEdhcUNjdkNGTnJD?=
 =?utf-8?B?NHhBWXBMemFMQVdVNmNpdm02a2l6SFlFajMreGQzSDZUZlZOTFQwUEJmTXky?=
 =?utf-8?B?QWhweUh5UExpZmRaM0QwTzI1cEJQWGtvUVVWWEhla1BoU2JLOG9LTy92b09m?=
 =?utf-8?B?MS9wdHRMMlZRbXRiZFhLcDBoK3AwSGlHL0ZFeW9FS0xhQklVRDVYZnR4QVRn?=
 =?utf-8?B?SDF1MllUUzhucVhRVy9hVlNGVFJ5WkVEeCtRVHliZEFRRWlQNm5veHprVmsz?=
 =?utf-8?B?aklrQ3Q3NUZyaXFGYlF2dnFnQi9BdFdMNVRlZ3VHVjVMUWU4aFpFZytNSmJl?=
 =?utf-8?B?QzdScHpvK2lJdFFUWGY1MUlraXcyTEFML3J3elU5MXh3dm01TS9XVmlWcXJN?=
 =?utf-8?B?ZFZSUWUrVVRpcVB4enNVTDdQYmJ0VXdqdkw3eHRZKytsYTVSYUU3QWViMlcy?=
 =?utf-8?B?d3U1ZmRFUDFhRHpwOXhMTFFRTyt0NC80NzJRN2dtWDVCeGI0T1hLdytkd0la?=
 =?utf-8?B?SjIyajJ4NTBQSzJmWkUwUnhwdloxQ3kzRmxvK2ZuK0VQOEJ5aDI5SG1OYUVG?=
 =?utf-8?B?bm5rQW45WExJZGdUVnQyVHcxU0p5TEthZzJ0S25FekpRcTl2TGI0ME8yYlR2?=
 =?utf-8?B?dVk1THF0RHJIK0l0S0RTSG1wVmhSZHFhT2dHWjQvc1dlMm9NYlRtT0ZzdHZO?=
 =?utf-8?B?RzlpZXRFVWxWRjlZaVNGSDJ2R3hzNUFHV2tIWWpkQUxzQzdqMUxvb2JkaEJp?=
 =?utf-8?B?VWRvN1k0WGR4R1lkOVRrZVJKN0tHSlBOV2pnQVhQa2JUekx2SHJSQ1ZrVjZQ?=
 =?utf-8?B?Z283VFBrdzBVNFlhNVkzT2hQU3hGang4NEM2NWpPbTFWMllvRS9XS0pqbzB4?=
 =?utf-8?B?M21VRTJwdmVoTzZuWGcwZlJMMmhya3JmTU5nSUxjVEFtQnF2a21DdW9hYnl2?=
 =?utf-8?B?ajc3LzVHU3VGZ3BSc0NkTXZ3ZGZjTVNMU2V0bUFCQlZpQzNPV3AwVzJvMmUv?=
 =?utf-8?B?MnAwc3hGNkI2OU5HOE9TVjZ5ZkhGOXdVSnkvampRa2V1Q2dlR0xCSFgyVWcy?=
 =?utf-8?B?RXlROGpPU3JLQ0orQnh3eUV4bGVoMVM0OFNBRWdBOWlzUHUyM1FRMGU1anlO?=
 =?utf-8?B?N1RrY2JiWWpUQW1qdmRzcTNyS0xYdCt2bDdHVVNzOFVmbDkxcVJnWTJVN1Vh?=
 =?utf-8?B?V25xYUNQTmxsUThXbjRWUG5GVDVNWVBJdXhPZCtySEtST1o0MVNXeFl0b1pJ?=
 =?utf-8?Q?GgiA9iulvj6ZMv4lDX6mEvl0yBi91FCAgl7uycw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6fa427-a04d-4555-2730-08d92caaf00c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 07:31:33.4062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2WFfSBUkDpfdJg8OrqZfqoR5AAvkAqxNkBJ7xBQ7DvfJFhYY04M5iNnuMIwgoR42mEp1LUbLbA7Xi1dWqkGaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2031
X-Proofpoint-GUID: DvKeYsdUyPnJjYygS7ihzO0yVynVIm_O
X-Proofpoint-ORIG-GUID: 6S8uWhADCA7_OHZvo1hmRMcTDkgsgKwg
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
> While archive mode is 'patched', there is a probably racing between
> do_ar_patched and do_kernel_configme
> [snip]
> |File: 'oe-core/meta/classes/archiver.bbclass', lineno: 313, function: create_tarball
> ...
> |Exception: FileNotFoundError: [Errno 2] No such file or directory: 'build/
> tmp-glibc/work-shared/qemux86-64/kernel-source/.tmp.config.DCUH7mUNe3'
> [snip]
> 
> Task do_kernel_configme will modify ${S}, and it broke create_tarball in
> do_ar_patched.
> 
> Order do_kernel_configme and do_ar_patched to avoid racing.
> 
> Also improve sstatesig.py to respect commit [fed0ed8 archiver.bbclass: do
> not cause kernel rebuilds]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/classes/archiver.bbclass | 8 ++++++--
>   meta/lib/oe/sstatesig.py      | 3 ++-
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index aff1f9dbb0..efab438ebd 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -596,7 +596,11 @@ python () {
>       # Add tasks in the correct order, specifically for linux-yocto to avoid race condition.
>       # sstatesig.py:sstate_rundepfilter has special support that excludes this dependency
>       # so that do_kernel_configme does not need to run again when do_unpack_and_patch
> -    # gets added or removed (by adding or removing archiver.bbclass).
> +    # or do_ar_patched gets added or removed (by adding or removing archiver.bbclass).
>       if bb.data.inherits_class('kernel-yocto', d):
> -        bb.build.addtask('do_kernel_configme', 'do_configure', 'do_unpack_and_patch', d)
> +        ar_src = d.getVarFlag('ARCHIVER_MODE', 'src')
> +        if ar_src == "patched":
> +            bb.build.addtask('do_kernel_configme', 'do_configure', 'do_ar_patched', d)
> +        else:
> +            bb.build.addtask('do_kernel_configme', 'do_configure', 'do_unpack_and_patch', d)
>   }
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 21ae0a7657..30afbcd617 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -32,7 +32,8 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
>       # from a mcdepends). The exception is the special
>       # do_kernel_configme->do_unpack_and_patch dependency from archiver.bbclass.
>       if recipename == depname and depmc == mc:
> -        if task == "do_kernel_configme" and deptaskname == "do_unpack_and_patch":
> +        if task == "do_kernel_configme" and (dep.endswith(".do_unpack_and_patch") or \
> +                                             dep.endswith(".do_ar_patched")):
>               return False
>           return True
>   
> 
> 
> 
> 
> 
