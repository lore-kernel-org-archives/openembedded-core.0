Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.88.1627441082319499882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 19:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HAFEmJCs;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2843425e93=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16S2kaxA012139
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 02:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=f8HRCVrrJndWnkqZvSUVP4tsyiGvvViscd5UKvxiajU=;
 b=HAFEmJCsJca71R9QaITKXPPUJmzOzLsVInV5MTgflIkMuX6uUP6tpRxUxxUn2237gbW+
 VyZQ2sEPw7zYqru9aZbUrZh5CruCTNNw7+5VXB5HQNH5wFRVAGQB4pElBs9Rriom+n4f
 NZY59TyPiLQnomD+LAb45YHcY9JbDnrUt2HC7uU6v2MqEPuERxZQtab/LWdlc9r9qNVU
 j5xSUdExzPYC8Uh8u/0T7D7Gt9Sh+1gRSjV5D2DM7ccTQpESUgQBxn0tzIqDMYq5WZy8
 GgZ4L2kaOLheK7v4mrSAXwesbzVhsdSRBpW/3/sdsG3lcej86iOmZ2K/SFBK+B9rNHqm tQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a2351h4g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 02:58:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIR2Wl3jfQio46ynNAEPjbqHp3rLSxlP1sSZvm2dnlhvLSD9O7Zp/e1qZifC9nFZJVAPc1QOPm3VznO7sBwvNOzyT/X06uZWSMF8plcK0PLl/iWRF2lExsyWOAejPM6+XPVOe0MEsEbc2JqTU054t+uI4Nz9LzoBXxDGqyE+gh3xYQHFICZ1qhNxGOkOWVi7CTIJ0J8YCG+uOostqRevtBVujofKcsywTUABFV3Bv4+VaCBpkivB/RK1jeJ2L2FvH8/TxAHNhEx97RcKM1MzQ9oRd2t/GixCzgTnPbJO8segkFIiOeRjetlpktKBt7a5b2JSBycqIt0qK1sbCY7ffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8HRCVrrJndWnkqZvSUVP4tsyiGvvViscd5UKvxiajU=;
 b=LDZ6D3iYq848Euzr1hc0vTD1LsQ9zlJeYngV3PZZh8IcLi7Eob7uI486Il4pWQ7lDqyFkA9LXbSPGfrpudPMf22JjPJTCmpZhKwLJ9X9e32peaSEtDsgcx7z8E7Z6IqVqrPfmiXd5UpjUgPeeveT9q0uGqSrc6mxXmRryDKCzU3v5whRvHf4RiwhlZnad3Le4xJs2wsxWYI+nV4NVJcJ6mUNCXzfaAOLuBBziwGhQRv4p8GEvewYHhT0/1FEVtwStwzwDgjQAka6FXA5aplRCHvBKBAghqY6L8+piW17ePHThJovAmpSs+Bx2pxymm+wE55AWHnC8jDRibZxDs/fBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4654.namprd11.prod.outlook.com (2603:10b6:806:98::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Wed, 28 Jul
 2021 02:57:57 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::911:37d1:9b4a:7693]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::911:37d1:9b4a:7693%4]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 02:57:57 +0000
Subject: Re: [OE-core] [hardknott][PATCH] mklibs: remove recipes and class
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <1695D4F0B9337557.29235@lists.openembedded.org>
Message-ID: <58855d66-b934-fd5e-1f4c-cb4ccf2d1c2a@windriver.com>
Date: Wed, 28 Jul 2021 10:57:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1695D4F0B9337557.29235@lists.openembedded.org>
X-ClientProxiedBy: BYAPR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:a03:54::15) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by BYAPR02CA0038.namprd02.prod.outlook.com (2603:10b6:a03:54::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 02:57:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56b67b82-ef8a-4116-f675-08d951738080
X-MS-TrafficTypeDiagnostic: SA0PR11MB4654:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB465404C6A0A32DC65430CF9282EA9@SA0PR11MB4654.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:499;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hdl9ockZrp7sMK+G5D4GRRclr883WMrw0J2YWOtyMV64UQCOa7ct46Je3AgPGXsQaZA4/yfCq2QGQs+iWeiHgsi2O1zWXmbGDbZzBTbbX8vp3d8YfeuNQv+leUjWCTCxXYCYsuESCMT+z5M078mvxfoAw+gZBAq5SqdbxYzmdRzwgPHi7MHOm3nWvYelCHLQwY/lHgvFhNDPwKEhlaW5LNpaDj5Zm6Y1TbPrw1aLCNlvLuFgrjtVT7zPbU9efdKyL/SUkmWJP5X7sEsNnpL/hv8cNKP5IqVPTYjCGdiyzb4rL3GkW56zTAnO1Oj/DknJZjZfobdKyalYk3eg+E4WnJFZHISxQ4Zty31oKDItg7t7dTFW+besyH5MWATSyh6LEAZqKl+N0PhG9D/HRHSmQsid2D+oB9QDDPwNOxd8vE7YDVF6ZV4L05736682szLe/iOT4Ux4XrntiPiKQj3SXWdilMGOwsELwkiVLvmSXCvxCj4qaLKLE/NQ3YgWBsxTXl1meziZwchjb5rfKcOns0/FOEus37b7Lsulo2cqgAO1DCpgChTJwnPcC52pH1eHYPVLXd9M1dHDh2AIyhPN6O9r1MwrXvBCr2flDIVnc+TEKsYEJQu/rvwfshL6OYY8mz0ZmxyXIDFQFeEpZYQOitZHkSOkfs9aedRGDBmvMfRjYn04nMKYzLC7jd+MxZm7EWE5tUxJWIhJxtldcs+lXMPePaLhAnJyE5+byIUNCI57L7ngr/bbODdb2iqHAYfmMh/7L+xPSKttcsfbTSa5Fd420wGrZ2oQ+GDVpC5qlNy/c7xion5YhLNSEewdVe6j6I0GQHiKQx5PO+tZn66N1qekYPt8My0O8Bptsj7amTnDlBOvgClHLvgPOld0MWvuQ+SimyOMnZsElxhrf3Gvmg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(4001150100001)(8676002)(186003)(38100700002)(38350700002)(66946007)(83380400001)(66556008)(66476007)(8936002)(19627235002)(166002)(6666004)(26005)(5660300002)(316002)(16576012)(6916009)(6706004)(86362001)(966005)(44832011)(30864003)(52116002)(2616005)(956004)(2906002)(33964004)(53546011)(478600001)(31686004)(31696002)(6486002)(36756003)(78286007)(43740500002)(45980500001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MStqNk1MYmFWMzBaaVB6dzg4c0FGOXlLOVVhTUZuS2FkVUVZQUFZbk1mZm1m?=
 =?utf-8?B?dzdURFZqVkpFM3N1eVpERldaZXI1OWpRZ0VFRlZLazRRczZkaXVtNS9Mbkpu?=
 =?utf-8?B?Y2s2YVU4UE95bHhDUmEvVkpJTitIUmxFMDRTQndJWW02eE45ZUhkaUw3Tnpw?=
 =?utf-8?B?alpLaEdVME1WT0I3TUhzL3dlZEZlZm1oWWw0UlhHZnhMeDd4QWkvM3Q2d3Va?=
 =?utf-8?B?RlJTbzFFTmpEWTJEcjE1R3JvVTVON1h1dU1kSEJReFZJOHJiazNUaXNaSVpL?=
 =?utf-8?B?dGpKSlEvT0s3ZW85UnBHcXQvNnNycG1mZVVJdmNmd01iMGVOQjJyeUZQU25h?=
 =?utf-8?B?T1NLWjZyRzdnUC9kekdkQkVYTWpyUklwTzE1ZGZKZ3RKSU96ZlVNeVRHVHVy?=
 =?utf-8?B?MVRGZFNxWFlOYmRLT1hpaE5sS21udWpEMmtadmlPWEpIS0ZXa0R3TDBWTzJP?=
 =?utf-8?B?Z0pGelliOUVBUWRpbVFMVlNrYXMzZWx2R1djUm5Ca3ZtUGxnNDNWWklOTGls?=
 =?utf-8?B?d2FTcGRhTWtQZHpocS9rYStZMXVjZ0d2RVIzOWxzVVlVb2RlWWxkNlJQc0la?=
 =?utf-8?B?K3p4cGtReWpYK0E5TENwcUtRbW5EWFc4S0paTDN4OHB2TFBiZVhWQUxEcnFm?=
 =?utf-8?B?ejJXREk2MkVoazZhNDdud1N5UURIODRFT0tkRVVJTjE1bXF1a1RLbTBRbTZQ?=
 =?utf-8?B?WklFT2U0aFgyVmtvYzVWcEhDOC95WTdQTXIyWTcxODJ6Q2U2bkIrRCtmb0FH?=
 =?utf-8?B?TzJLZUNRSW9SWFNqTVh2MXR3L1Q4cC9Nd1dUQ0ZZWFRkZ01Rc09hblNVZ1R4?=
 =?utf-8?B?blJVSks0LzY4eVZkSit1ek9IdTd6U2JEY3I0aTZXVlhVbVRMNmhJSWFwcy8v?=
 =?utf-8?B?eUlsTGFHSm5FTEMrM2dQNWdCK2VUekRJc29lQlEzU2d3eXArcGlIWk94ZWox?=
 =?utf-8?B?L1NBK3lXTms0SC9rMDNXalRjalFSRmExQlBja0c5TC9UencyOFV1djhBNDJv?=
 =?utf-8?B?eDJnVGRhczZGajRRaTJlSW5pckxXdlpXYUNLYk5zaGp1d1QzUjJJSHBjbUI3?=
 =?utf-8?B?bjhJYWRPTlRVaUlqTUpiQURneEFPL1VIdmNUUXJSQ2l6Rzg1TFNXQWxhdDQy?=
 =?utf-8?B?dEFIZWVYTmFJRUtyeEltU1lXbFB5bnVVbHNQd3F2REgxdWFpb2dPKy9uNkFZ?=
 =?utf-8?B?dDJ6MXlaemlPU0R4aSs1LzRPdDNCZ1d5MUtrbnVqYWxnYjVGQmhMYzY5ZGJE?=
 =?utf-8?B?c05adjNPcVVKZWtqOHA2WEpXZWYzTXpPczRCYVE4b2FKdndSeW9wUkFuWWls?=
 =?utf-8?B?YzF2a0N2TjQrNWc5aTltbUYyVHVCT01FdVkvOUQvQ3lIUEMzclAyQy9QL09o?=
 =?utf-8?B?ZEtSUFlCK0svUmZwUVIrYkt0ZXQ2eG9rMWI2T2U3UkpDVE1sdGZJRVNRZ2R5?=
 =?utf-8?B?UE9LOTAxQjdUNmgwa1Y2WmQxU1lXS091QVRwM2pQK28yVS9QZ0VIY1VTZ3JF?=
 =?utf-8?B?ejVON2I5Qko5ZHExSkVITE55c1NDYlBkUC8ybGZQdittRVBkSTVodXdRdnhh?=
 =?utf-8?B?YjhzY3RFNzlrTUovQW40Mm92ejFoZjBId0M4WStPZndlS0xnMnlGYnN5UDRa?=
 =?utf-8?B?WTBkb25XdG1xV205eFdhV3NrU3VONXl5cnRxMW4zaCtiUlJnZldLdVdtMkk3?=
 =?utf-8?B?bGx2QmhIeGQ4STBpV0pnRy9HNlhRTEQ4MlN3dlBHbmFYOFZnRFB4RUFaenNW?=
 =?utf-8?Q?55xYmqWOlAQemRJG7VotxsiKvFXd/dqISX1F2yx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b67b82-ef8a-4116-f675-08d951738080
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 02:57:57.4476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gmsK0XxYZ2Aq9qVevKqGnhtK9btcPOp6aVpKUlDEpEq6oQ+PVfGVM2HJJUkXVlOmpBc72gJm6MpLJB+aMDlNeMHF9jVALXmVnnXD01doWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4654
X-Proofpoint-GUID: x8qWtADmFo_9DOdMV8NCpH_byyc28tJg
X-Proofpoint-ORIG-GUID: x8qWtADmFo_9DOdMV8NCpH_byyc28tJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-28_01,2021-07-27_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280015
Content-Type: multipart/alternative;
 boundary="------------7CE5D0D28B22EF2CC5CFE9E8"
Content-Language: en-US

--------------7CE5D0D28B22EF2CC5CFE9E8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

mklibs-native-0.1.44 do_compile failed on Fedora34: 
mklibs-readelf/elf.hpp:52:56: error: ISO C++17 does not allow dynamic 
exception specifications

so removed it.

On 7/28/21 10:54 AM, Changqing Li wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> This is not enabled or tested by default, and has never been
> ported to python 3 upstream[1], which means it doesn't work at all
> with plain poky. If you need it, please put it in a separate layer
> and/or modernize to work with py3.
>
> https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs
>
> (From OE-Core rev: 908df863b419d1cad7317153101fc827e7e3a354)
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/image-mklibs.bbclass             |  56 ----------
>   meta/conf/distro/include/maintainers.inc      |   1 -
>   .../mklibs/files/ac_init_fix.patch            |  19 ----
>   ...re-on-symbol-provided-by-application.patch | 103 ------------------
>   .../mklibs/files/fix_STT_GNU_IFUNC.patch      |  26 -----
>   .../mklibs/files/fix_cross_compile.patch      |  81 --------------
>   ...U-unique-symbols-as-provided-symbols.patch |  34 ------
>   .../mklibs/files/sysrooted-ldso.patch         |  18 ---
>   .../mklibs/mklibs-native_0.1.44.bb            |  22 ----
>   9 files changed, 360 deletions(-)
>   delete mode 100644 meta/classes/image-mklibs.bbclass
>   delete mode 100644 meta/recipes-devtools/mklibs/files/ac_init_fix.patch
>   delete mode 100644 meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
>   delete mode 100644 meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
>   delete mode 100644 meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
>   delete mode 100644 meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
>   delete mode 100644 meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
>   delete mode 100644 meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
>
> diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
> deleted file mode 100644
> index 68e11d4365..0000000000
> --- a/meta/classes/image-mklibs.bbclass
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -do_rootfs[depends] += "mklibs-native:do_populate_sysroot"
> -
> -IMAGE_PREPROCESS_COMMAND += "mklibs_optimize_image; "
> -
> -inherit linuxloader
> -
> -mklibs_optimize_image_doit() {
> -	rm -rf ${WORKDIR}/mklibs
> -	mkdir -p ${WORKDIR}/mklibs/dest
> -	cd ${IMAGE_ROOTFS}
> -	du -bs > ${WORKDIR}/mklibs/du.before.mklibs.txt
> -
> -	# Build a list of dynamically linked executable ELF files.
> -	# Omit libc/libpthread as a special case because it has an interpreter
> -	# but is primarily what we intend to strip down.
> -	for i in `find . -type f -executable ! -name 'libc-*' ! -name 'libpthread-*'`; do
> -		file $i | grep -q ELF || continue
> -		${HOST_PREFIX}readelf -l $i | grep -q INTERP || continue
> -		echo $i
> -	done > ${WORKDIR}/mklibs/executables.list
> -
> -	dynamic_loader=${@get_linuxloader(d)}
> -
> -	mklibs -v \
> -		--ldlib ${dynamic_loader} \
> -		--libdir ${baselib} \
> -		--sysroot ${PKG_CONFIG_SYSROOT_DIR} \
> -		--gcc-options "--sysroot=${PKG_CONFIG_SYSROOT_DIR}" \
> -		--root ${IMAGE_ROOTFS} \
> -		--target `echo ${TARGET_PREFIX} | sed 's/-$//' ` \
> -		-d ${WORKDIR}/mklibs/dest \
> -		`cat ${WORKDIR}/mklibs/executables.list`
> -
> -	cd ${WORKDIR}/mklibs/dest
> -	for i in *
> -	do
> -		cp $i `find ${IMAGE_ROOTFS} -name $i`
> -	done
> -
> -	cd ${IMAGE_ROOTFS}
> -	du -bs > ${WORKDIR}/mklibs/du.after.mklibs.txt
> -
> -	echo rootfs size before mklibs optimization: `cat ${WORKDIR}/mklibs/du.before.mklibs.txt`
> -	echo rootfs size after mklibs optimization: `cat ${WORKDIR}/mklibs/du.after.mklibs.txt`
> -}
> -
> -mklibs_optimize_image() {
> -	for img in ${MKLIBS_OPTIMIZED_IMAGES}
> -	do
> -		if [ "${img}" = "${PN}" ] || [ "${img}" = "all" ]
> -		then
> -			mklibs_optimize_image_doit
> -			break
> -		fi
> -	done
> -}
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 6276331857..22f873444a 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -502,7 +502,6 @@ RECIPE_MAINTAINER_pn-mingetty = "Yi Zhao <yi.zhao@windriver.com>"
>   RECIPE_MAINTAINER_pn-mini-x-session = "Armin Kuster <akuster808@gmail.com>"
>   RECIPE_MAINTAINER_pn-minicom = "Anuj Mittal <anuj.mittal@intel.com>"
>   RECIPE_MAINTAINER_pn-mkfontscale = "Armin Kuster <akuster808@gmail.com>"
> -RECIPE_MAINTAINER_pn-mklibs-native = "Robert Yang <liezhi.yang@windriver.com>"
>   RECIPE_MAINTAINER_pn-mmc-utils = "Anuj Mittal <anuj.mittal@intel.com>"
>   RECIPE_MAINTAINER_pn-mobile-broadband-provider-info = "Alexander Kanavin <alex.kanavin@gmail.com>"
>   RECIPE_MAINTAINER_pn-modutils-initscripts = "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch b/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
> deleted file mode 100644
> index 422af10420..0000000000
> --- a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Get the version of mklibs by simpler means. The MKLIBS_VERSION string in the
> -configure.ac file is replaced with real version string by the
> -do_configure_prepend() function from the recipe .bb file.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Nitin A Kamble <nitin.a.kamble@intel.com>
> -Date: 2011/01/24
> -
> -Index: mklibs/configure.ac
> -===================================================================
> ---- mklibs.orig/configure.ac	2010-02-21 17:34:56.000000000 -0800
> -+++ mklibs/configure.ac	2011-01-24 18:52:19.943242079 -0800
> -@@ -1,4 +1,4 @@
> --AC_INIT([mklibs],m4_esyscmd(dpkg-parsechangelog | perl -ne 'print $1 if m/^Version: (.*)$/;'))
> -+AC_INIT([mklibs], MKLIBS_VERSION)
> - AM_INIT_AUTOMAKE([foreign no-define])
> - AC_CONFIG_HEADERS([config.h])
> - AM_MAINTAINER_MODE
> diff --git a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch b/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
> deleted file mode 100644
> index 17d9af4de4..0000000000
> --- a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -From dcb45256970b15b672d0004533826c94083356e5 Mon Sep 17 00:00:00 2001
> -From: Yuanjie Huang <yuanjie.huang@windriver.com>
> -Date: Fri, 17 Apr 2015 14:48:20 +0800
> -Subject: [PATCH 4/6] avoid failure on symbol provided by application
> -
> -Upstream-Status: Pending
> -
> -Undefined symbols in a library can be provided by the application
> -that links to the library, such as `logsink' in libmultipath.so.0.
> -This fix checks the type of object in which the symbol is needed
> -and the existence of the symbol in application, when a symbol
> -cannot be provided by libraries. It prevents false alarm on absence
> -of symbols.
> -
> -Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> -
> ----
> - src/mklibs | 28 ++++++++++++++++++++++++----
> - 1 file changed, 24 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/mklibs b/src/mklibs
> -index a3533c0..66b7a09 100755
> ---- a/src/mklibs
> -+++ b/src/mklibs
> -@@ -133,9 +133,9 @@ class Symbol(object):
> -         return '@'.join(ret)
> -
> - class UndefinedSymbol(Symbol):
> --    def __init__(self, name, weak, version, library):
> -+    def __init__(self, name, weak, version, library, object):
> -         super(UndefinedSymbol, self).__init__(name, version, library)
> --        self.weak, self.library = weak, library
> -+        self.weak, self.library, self.object = weak, library, object
> -
> - def symbol_is_blacklisted(name):
> -     # The ARM Embedded ABI spec states symbols under this namespace as
> -@@ -152,6 +152,11 @@ def undefined_symbols(obj):
> -
> -     output = command("mklibs-readelf", "--print-symbols-undefined", obj)
> -
> -+    if len(obj) > len(dest_path) and obj[:len(dest_path)] == dest_path:
> -+        object = obj[len(dest_path) + 1:-len('-so-stripped')]
> -+    else:
> -+        object = obj
> -+
> -     result = []
> -     for line in output:
> -         name, weak_string, version_string, library_string = line.split()[:4]
> -@@ -171,7 +176,7 @@ def undefined_symbols(obj):
> -         if library_string.lower() != 'none':
> -             library = library_string
> -
> --        result.append(UndefinedSymbol(name, weak, version, library))
> -+        result.append(UndefinedSymbol(name, weak, version, library, object))
> -
> -     return result
> -
> -@@ -498,12 +503,13 @@ while 1:
> -                      and re.search("^ps_", str(symbol)))
> -                 and not (re.search("ld-linux.so.3$", str(symbol)))
> -                 and not (re.search("^__gnu_local_gp", str(symbol)))):
> --                debug(DEBUG_SPAM, "needed_symbols adding %s, weak: %s" % (symbol, symbol.weak))
> -+                debug(DEBUG_SPAM, "needed_symbols adding %s, weak: %s, for %s" % (symbol, symbol.weak, obj))
> -                 needed_symbols[str(symbol)] = symbol
> -         libraries.update(library_depends(obj))
> -
> -     # calculate what symbols are present in small_libs and available_libs
> -     present_symbols = {}
> -+    present_symbol_progs = {}
> -     checked_libs = small_libs
> -     checked_libs.extend(available_libs)
> -     checked_libs.append(sysroot + ldlib)
> -@@ -513,6 +519,12 @@ while 1:
> -             names = symbol.base_names()
> -             for name in names:
> -                 present_symbols[name] = symbol
> -+            if not so_pattern.match(lib):
> -+                debug(DEBUG_SPAM, "present_symbol_progs adding %s, from executable %s" % (' '.join(names), lib))
> -+                for name in names:
> -+                    progs = present_symbol_progs.get(name, set())
> -+                    progs.add(lib)
> -+                    present_symbol_progs[name] = progs
> -
> -     # are we finished?
> -     num_unresolved = 0
> -@@ -568,6 +580,14 @@ while 1:
> -     for name in needed_symbols:
> -         if not name in symbol_provider:
> -             if not needed_symbols[name].weak:
> -+                # WORKAROUND: Undefined symbols in a library can be provided by the application
> -+                # that links to the library. So if the object which requires the symbol is a library
> -+                # and some application can provide the symbol, the undefined symbol is skipped.
> -+                symbol = needed_symbols[name]
> -+                if so_pattern.match(symbol.object) and present_symbol_progs.get(name, None):
> -+                    debug(DEBUG_SPAM, "symbol %s in library %s is provided by executable %s" \
> -+                          % (name, symbol.object, ' '.join(present_symbol_progs[name])))
> -+                    continue
> -                 raise Exception("No library provides non-weak %s" % name)
> -         else:
> -             lib = symbol_provider[name]
> ---
> -2.16.1
> -
> diff --git a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch b/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
> deleted file mode 100644
> index d27a48916d..0000000000
> --- a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -The libc6-dev in Ubuntu 9.04 is so old that the elf.h doesn't
> -define STT_GNU_IFUNC, so we have to define it ourselves.
> -
> -Upstream-Status: Inappropriate [other] - old release specific, maybe removable
> -
> --- Dexuan Cui (dexuan.cui@intel.com) Feb 16, 2011.
> -
> -diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
> -index 2444c39..56d93f8 100644
> ---- a/src/mklibs-readelf/main.cpp
> -+++ b/src/mklibs-readelf/main.cpp
> -@@ -6,6 +6,14 @@
> - #include <vector>
> -
> - #include <elf.h>
> -+/*
> -+ * The /usr/include/elf.h in some distributions(like Ubuntu 9.04) doesn't
> -+ * define the macro. We need to define it here.
> -+ */
> -+#ifndef STT_GNU_IFUNC
> -+#define STT_GNU_IFUNC   10              /* Symbol is indirect code object */
> -+#endif
> -+
> - #include <getopt.h>
> -
> - #include "elf.hpp"
> diff --git a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> deleted file mode 100644
> index 13e4606b80..0000000000
> --- a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -Remove dependency on dpkg
> -
> -Upstream-Status: Submitted
> -
> -Asking the host OS whether it supports multiarch is not useful
> -in a cross-compilation environment, or if the user has specified
> -a libdir explicitly. So this patch, based on the work of Mentor
> -Graphics, removes mklibs's dependency on dpkg package.
> -
> -Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
> - src/mklibs | 30 +++++++++++++++++++-----------
> - 1 file changed, 19 insertions(+), 11 deletions(-)
> -
> -diff --git a/src/mklibs b/src/mklibs
> -index d9b784b..c5614ea 100755
> ---- a/src/mklibs
> -+++ b/src/mklibs
> -@@ -261,6 +261,11 @@ def extract_soname(so_file):
> -     return ""
> -
> - def multiarch(paths):
> -+    # Asking the host OS whether it supports multiarch is not useful
> -+    # in a cross-compilation environment, or if the user has specified
> -+    # a libdir explicitly.
> -+    if sysroot != "" or libdir != "":
> -+        return paths
> -     devnull = open('/dev/null', 'w')
> -     dpkg_architecture = subprocess.Popen(
> -         ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],
> -@@ -340,7 +345,7 @@ lib_path = []
> - dest_path = "DEST"
> - ldlib = "LDLIB"
> - include_default_lib_path = "yes"
> --default_lib_path = multiarch(["/lib/", "/usr/lib/", "/usr/X11R6/lib/"])
> -+default_lib_path = ["/lib/", "/usr/lib/", "/usr/X11R6/lib/"]
> - libc_extras_dir = "/usr/lib/libc_pic"
> - libc_extras_dir_default = True
> - libdir = "lib"
> -@@ -386,7 +391,7 @@ for opt, arg in optlist:
> -     elif opt == "--libdir":
> -         libdir = arg
> -     elif opt in ("--help", "-h"):
> --	usage(0)
> -+        usage(0)
> -         sys.exit(0)
> -     elif opt in ("--version", "-V"):
> -         version(vers)
> -@@ -395,6 +400,7 @@ for opt, arg in optlist:
> -         print "WARNING: unknown option: " + opt + "\targ: " + arg
> -
> - if include_default_lib_path == "yes":
> -+    default_lib_path = multiarch(default_lib_path)
> -     lib_path.extend([a.replace("/lib/", "/" + libdir + "/") for a in default_lib_path])
> -
> - if libc_extras_dir_default:
> -@@ -661,16 +669,16 @@ ld_path_name = os.path.dirname(ldlib)
> - ld_full_path = "../" + ldlib
> - ld_file = find_lib(ld_file_name)
> -
> --if ld_path_name != "/lib":
> --    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
> --        os.remove(dest_path + "/" + ld_file_name)
> -+#if ld_path_name != "/lib":
> -+#    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
> -+#        os.remove(dest_path + "/" + ld_file_name)
> -
> --if not os.path.exists(dest_path + "/../" + ld_path_name):
> --    os.mkdir(dest_path + "/../" + ld_path_name)
> -+#if not os.path.exists(dest_path + "/../" + ld_path_name):
> -+#    os.mkdir(dest_path + "/../" + ld_path_name)
> -
> --if not os.access(dest_path + "/" + ld_full_path, os.F_OK):
> --    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to " + ld_full_path)
> -+if not os.access(dest_path + "/" + ld_file_name, os.F_OK):
> -+    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to " + ld_file_name)
> -     command(target + "objcopy", "--strip-unneeded -R .note -R .comment",
> --            ld_file, dest_path + "/" + ld_full_path)
> -+            ld_file, dest_path + "/" + ld_file_name)
> -
> --os.chmod(dest_path + "/" + ld_full_path, 0755)
> -+os.chmod(dest_path + "/" + ld_file_name, 0755)
> diff --git a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
> deleted file mode 100644
> index bc56593e6a..0000000000
> --- a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From eddf04c7f8312e9c29cdb24e431b7e4fb2cc70ed Mon Sep 17 00:00:00 2001
> -From: Yuanjie Huang <yuanjie.huang@windriver.com>
> -Date: Wed, 15 Apr 2015 14:00:06 +0800
> -Subject: [PATCH] Show GNU unique symbols as provided symbols
> -
> -Upstream-Status: Submitted
> -
> -GNU Unique symbol is a GNU extension employed by new version of GCC
> -by default. Even Standard C++ library in GCC 4.9 provides some symbols,
> -such as _ZNSs4_Rep20_S_empty_rep_storageE in this binding type instead
> -of ELF standard weak binding.
> -This patch adds support of this new binding type to mklibs-readelf.
> -
> -Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ----
> - src/mklibs-readelf/main.cpp | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
> -index 56d93f8..0134530 100644
> ---- a/src/mklibs-readelf/main.cpp
> -+++ b/src/mklibs-readelf/main.cpp
> -@@ -88,7 +88,7 @@ static void process_symbols_provided (const Elf::section_type<Elf::section_type_
> -     uint8_t type = symbol->get_type ();
> -     const std::string &name = symbol->get_name_string ();
> -
> --    if (bind != STB_GLOBAL && bind != STB_WEAK)
> -+    if (bind != STB_GLOBAL && bind != STB_WEAK && bind != STB_GNU_UNIQUE)
> -       continue;
> -     if (shndx == SHN_UNDEF || shndx == SHN_ABS)
> -       continue;
> ---
> -1.8.5.2.233.g932f7e4
> -
> diff --git a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch b/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
> deleted file mode 100644
> index 75500a029a..0000000000
> --- a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -In cross builds we will have to respect sysroot
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -
> -Index: mklibs-0.1.39/src/mklibs
> -===================================================================
> ---- mklibs-0.1.39.orig/src/mklibs	2014-03-01 18:25:36.000000000 +0000
> -+++ mklibs-0.1.39/src/mklibs	2014-10-19 00:51:46.813534596 +0000
> -@@ -495,7 +495,7 @@
> -     present_symbols = {}
> -     checked_libs = small_libs
> -     checked_libs.extend(available_libs)
> --    checked_libs.append(ldlib)
> -+    checked_libs.append(sysroot + ldlib)
> -     for lib in checked_libs:
> -         for symbol in provided_symbols(lib):
> -             debug(DEBUG_SPAM, "present_symbols adding %s" % symbol)
> diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> deleted file mode 100644
> index 1784af1f4c..0000000000
> --- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -SUMMARY = "Shared library optimisation tool"
> -DESCRIPTION = "mklibs produces cut-down shared libraries that contain only the routines required by a particular set of executables."
> -HOMEPAGE = "https://launchpad.net/mklibs"
> -SECTION = "devel"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
> -
> -SRC_URI = "http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz \
> -	file://ac_init_fix.patch\
> -	file://fix_STT_GNU_IFUNC.patch\
> -	file://sysrooted-ldso.patch \
> -	file://avoid-failure-on-symbol-provided-by-application.patch \
> -	file://show-GNU-unique-symbols-as-provided-symbols.patch \
> -	file://fix_cross_compile.patch \
> -"
> -
> -SRC_URI[md5sum] = "6b6eeb9b4016c6a7317acc28c89e32cc"
> -SRC_URI[sha256sum] = "3af0b6bd35e5b6fc58d8b68827fbae2ff6b7e20dd2b238ccb9b49d84722066c2"
> -
> -UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/mklibs/"
> -
> -inherit autotools gettext native
>
> 
>

--------------7CE5D0D28B22EF2CC5CFE9E8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>mklibs-native-0.1.44 do_compile failed on Fedora34:
      mklibs-readelf/elf.hpp:52:56: error: ISO C++17 does not allow
      dynamic exception specifications</p>
    <p>so removed it.<br>
    </p>
    <div class="moz-cite-prefix">On 7/28/21 10:54 AM, Changqing Li
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1695D4F0B9337557.29235@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>

This is not enabled or tested by default, and has never been
ported to python 3 upstream[1], which means it doesn't work at all
with plain poky. If you need it, please put it in a separate layer
and/or modernize to work with py3.

<a class="moz-txt-link-freetext" href="https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs">https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs</a>

(From OE-Core rev: 908df863b419d1cad7317153101fc827e7e3a354)

Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
Signed-off-by: Jacob Kroon <a class="moz-txt-link-rfc2396E" href="mailto:jacob.kroon@gmail.com">&lt;jacob.kroon@gmail.com&gt;</a>
Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 meta/classes/image-mklibs.bbclass             |  56 ----------
 meta/conf/distro/include/maintainers.inc      |   1 -
 .../mklibs/files/ac_init_fix.patch            |  19 ----
 ...re-on-symbol-provided-by-application.patch | 103 ------------------
 .../mklibs/files/fix_STT_GNU_IFUNC.patch      |  26 -----
 .../mklibs/files/fix_cross_compile.patch      |  81 --------------
 ...U-unique-symbols-as-provided-symbols.patch |  34 ------
 .../mklibs/files/sysrooted-ldso.patch         |  18 ---
 .../mklibs/mklibs-native_0.1.44.bb            |  22 ----
 9 files changed, 360 deletions(-)
 delete mode 100644 meta/classes/image-mklibs.bbclass
 delete mode 100644 meta/recipes-devtools/mklibs/files/ac_init_fix.patch
 delete mode 100644 meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
 delete mode 100644 meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
 delete mode 100644 meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
 delete mode 100644 meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
 delete mode 100644 meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
 delete mode 100644 meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
deleted file mode 100644
index 68e11d4365..0000000000
--- a/meta/classes/image-mklibs.bbclass
+++ /dev/null
@@ -1,56 +0,0 @@
-do_rootfs[depends] += &quot;mklibs-native:do_populate_sysroot&quot;
-
-IMAGE_PREPROCESS_COMMAND += &quot;mklibs_optimize_image; &quot;
-
-inherit linuxloader
-
-mklibs_optimize_image_doit() {
-	rm -rf ${WORKDIR}/mklibs
-	mkdir -p ${WORKDIR}/mklibs/dest
-	cd ${IMAGE_ROOTFS}
-	du -bs &gt; ${WORKDIR}/mklibs/du.before.mklibs.txt
-
-	# Build a list of dynamically linked executable ELF files.
-	# Omit libc/libpthread as a special case because it has an interpreter
-	# but is primarily what we intend to strip down.
-	for i in `find . -type f -executable ! -name 'libc-*' ! -name 'libpthread-*'`; do
-		file $i | grep -q ELF || continue
-		${HOST_PREFIX}readelf -l $i | grep -q INTERP || continue
-		echo $i
-	done &gt; ${WORKDIR}/mklibs/executables.list
-
-	dynamic_loader=${@get_linuxloader(d)}
-
-	mklibs -v \
-		--ldlib ${dynamic_loader} \
-		--libdir ${baselib} \
-		--sysroot ${PKG_CONFIG_SYSROOT_DIR} \
-		--gcc-options &quot;--sysroot=${PKG_CONFIG_SYSROOT_DIR}&quot; \
-		--root ${IMAGE_ROOTFS} \
-		--target `echo ${TARGET_PREFIX} | sed 's/-$//' ` \
-		-d ${WORKDIR}/mklibs/dest \
-		`cat ${WORKDIR}/mklibs/executables.list`
-
-	cd ${WORKDIR}/mklibs/dest
-	for i in *
-	do
-		cp $i `find ${IMAGE_ROOTFS} -name $i`
-	done
-
-	cd ${IMAGE_ROOTFS}
-	du -bs &gt; ${WORKDIR}/mklibs/du.after.mklibs.txt
-
-	echo rootfs size before mklibs optimization: `cat ${WORKDIR}/mklibs/du.before.mklibs.txt`
-	echo rootfs size after mklibs optimization: `cat ${WORKDIR}/mklibs/du.after.mklibs.txt`
-}
-
-mklibs_optimize_image() {
-	for img in ${MKLIBS_OPTIMIZED_IMAGES}
-	do
-		if [ &quot;${img}&quot; = &quot;${PN}&quot; ] || [ &quot;${img}&quot; = &quot;all&quot; ]
-		then
-			mklibs_optimize_image_doit
-			break
-		fi
-	done
-}
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6276331857..22f873444a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -502,7 +502,6 @@ RECIPE_MAINTAINER_pn-mingetty = &quot;Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>&quot;
 RECIPE_MAINTAINER_pn-mini-x-session = &quot;Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>&quot;
 RECIPE_MAINTAINER_pn-minicom = &quot;Anuj Mittal <a class="moz-txt-link-rfc2396E" href="mailto:anuj.mittal@intel.com">&lt;anuj.mittal@intel.com&gt;</a>&quot;
 RECIPE_MAINTAINER_pn-mkfontscale = &quot;Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>&quot;
-RECIPE_MAINTAINER_pn-mklibs-native = &quot;Robert Yang <a class="moz-txt-link-rfc2396E" href="mailto:liezhi.yang@windriver.com">&lt;liezhi.yang@windriver.com&gt;</a>&quot;
 RECIPE_MAINTAINER_pn-mmc-utils = &quot;Anuj Mittal <a class="moz-txt-link-rfc2396E" href="mailto:anuj.mittal@intel.com">&lt;anuj.mittal@intel.com&gt;</a>&quot;
 RECIPE_MAINTAINER_pn-mobile-broadband-provider-info = &quot;Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>&quot;
 RECIPE_MAINTAINER_pn-modutils-initscripts = &quot;Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>&quot;
diff --git a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch b/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
deleted file mode 100644
index 422af10420..0000000000
--- a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Get the version of mklibs by simpler means. The MKLIBS_VERSION string in the 
-configure.ac file is replaced with real version string by the 
-do_configure_prepend() function from the recipe .bb file.
-
-Upstream-Status: Inappropriate [configuration]
-
-Nitin A Kamble <a class="moz-txt-link-rfc2396E" href="mailto:nitin.a.kamble@intel.com">&lt;nitin.a.kamble@intel.com&gt;</a>
-Date: 2011/01/24
-
-Index: mklibs/configure.ac
-===================================================================
---- mklibs.orig/configure.ac	2010-02-21 17:34:56.000000000 -0800
-+++ mklibs/configure.ac	2011-01-24 18:52:19.943242079 -0800
-@@ -1,4 +1,4 @@
--AC_INIT([mklibs],m4_esyscmd(dpkg-parsechangelog | perl -ne 'print $1 if m/^Version: (.*)$/;'))
-+AC_INIT([mklibs], MKLIBS_VERSION)
- AM_INIT_AUTOMAKE([foreign no-define])
- AC_CONFIG_HEADERS([config.h])
- AM_MAINTAINER_MODE
diff --git a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch b/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
deleted file mode 100644
index 17d9af4de4..0000000000
--- a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From dcb45256970b15b672d0004533826c94083356e5 Mon Sep 17 00:00:00 2001
-From: Yuanjie Huang <a class="moz-txt-link-rfc2396E" href="mailto:yuanjie.huang@windriver.com">&lt;yuanjie.huang@windriver.com&gt;</a>
-Date: Fri, 17 Apr 2015 14:48:20 +0800
-Subject: [PATCH 4/6] avoid failure on symbol provided by application
-
-Upstream-Status: Pending
-
-Undefined symbols in a library can be provided by the application
-that links to the library, such as `logsink' in libmultipath.so.0.
-This fix checks the type of object in which the symbol is needed
-and the existence of the symbol in application, when a symbol
-cannot be provided by libraries. It prevents false alarm on absence
-of symbols.
-
-Signed-off-by: Yuanjie Huang <a class="moz-txt-link-rfc2396E" href="mailto:yuanjie.huang@windriver.com">&lt;yuanjie.huang@windriver.com&gt;</a>
-
----
- src/mklibs | 28 ++++++++++++++++++++++++----
- 1 file changed, 24 insertions(+), 4 deletions(-)
-
-diff --git a/src/mklibs b/src/mklibs
-index a3533c0..66b7a09 100755
---- a/src/mklibs
-+++ b/src/mklibs
-@@ -133,9 +133,9 @@ class Symbol(object):
-         return '@'.join(ret)
- 
- class UndefinedSymbol(Symbol):
--    def __init__(self, name, weak, version, library):
-+    def __init__(self, name, weak, version, library, object):
-         super(UndefinedSymbol, self).__init__(name, version, library)
--        self.weak, self.library = weak, library
-+        self.weak, self.library, self.object = weak, library, object
- 
- def symbol_is_blacklisted(name):
-     # The ARM Embedded ABI spec states symbols under this namespace as
-@@ -152,6 +152,11 @@ def undefined_symbols(obj):
- 
-     output = command(&quot;mklibs-readelf&quot;, &quot;--print-symbols-undefined&quot;, obj)
- 
-+    if len(obj) &gt; len(dest_path) and obj[:len(dest_path)] == dest_path:
-+        object = obj[len(dest_path) + 1:-len('-so-stripped')]
-+    else:
-+        object = obj
-+
-     result = []
-     for line in output:
-         name, weak_string, version_string, library_string = line.split()[:4]
-@@ -171,7 +176,7 @@ def undefined_symbols(obj):
-         if library_string.lower() != 'none':
-             library = library_string
- 
--        result.append(UndefinedSymbol(name, weak, version, library))
-+        result.append(UndefinedSymbol(name, weak, version, library, object))
- 
-     return result
- 
-@@ -498,12 +503,13 @@ while 1:
-                      and re.search(&quot;^ps_&quot;, str(symbol)))
-                 and not (re.search(&quot;ld-linux.so.3$&quot;, str(symbol)))
-                 and not (re.search(&quot;^__gnu_local_gp&quot;, str(symbol)))):
--                debug(DEBUG_SPAM, &quot;needed_symbols adding %s, weak: %s&quot; % (symbol, symbol.weak))
-+                debug(DEBUG_SPAM, &quot;needed_symbols adding %s, weak: %s, for %s&quot; % (symbol, symbol.weak, obj))
-                 needed_symbols[str(symbol)] = symbol
-         libraries.update(library_depends(obj))
- 
-     # calculate what symbols are present in small_libs and available_libs
-     present_symbols = {}
-+    present_symbol_progs = {}
-     checked_libs = small_libs
-     checked_libs.extend(available_libs)
-     checked_libs.append(sysroot + ldlib)
-@@ -513,6 +519,12 @@ while 1:
-             names = symbol.base_names()
-             for name in names:
-                 present_symbols[name] = symbol
-+            if not so_pattern.match(lib):
-+                debug(DEBUG_SPAM, &quot;present_symbol_progs adding %s, from executable %s&quot; % (' '.join(names), lib))
-+                for name in names:
-+                    progs = present_symbol_progs.get(name, set())
-+                    progs.add(lib)
-+                    present_symbol_progs[name] = progs
- 
-     # are we finished?
-     num_unresolved = 0
-@@ -568,6 +580,14 @@ while 1:
-     for name in needed_symbols:
-         if not name in symbol_provider:
-             if not needed_symbols[name].weak:
-+                # WORKAROUND: Undefined symbols in a library can be provided by the application
-+                # that links to the library. So if the object which requires the symbol is a library
-+                # and some application can provide the symbol, the undefined symbol is skipped.
-+                symbol = needed_symbols[name]
-+                if so_pattern.match(symbol.object) and present_symbol_progs.get(name, None):
-+                    debug(DEBUG_SPAM, &quot;symbol %s in library %s is provided by executable %s&quot; \
-+                          % (name, symbol.object, ' '.join(present_symbol_progs[name])))
-+                    continue
-                 raise Exception(&quot;No library provides non-weak %s&quot; % name)
-         else:
-             lib = symbol_provider[name]
--- 
-2.16.1
-
diff --git a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch b/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
deleted file mode 100644
index d27a48916d..0000000000
--- a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-The libc6-dev in Ubuntu 9.04 is so old that the elf.h doesn't
-define STT_GNU_IFUNC, so we have to define it ourselves.
-
-Upstream-Status: Inappropriate [other] - old release specific, maybe removable
-
--- Dexuan Cui (<a class="moz-txt-link-abbreviated" href="mailto:dexuan.cui@intel.com">dexuan.cui@intel.com</a>) Feb 16, 2011.
-
-diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
-index 2444c39..56d93f8 100644
---- a/src/mklibs-readelf/main.cpp
-+++ b/src/mklibs-readelf/main.cpp
-@@ -6,6 +6,14 @@
- #include &lt;vector&gt;
- 
- #include &lt;elf.h&gt;
-+/*
-+ * The /usr/include/elf.h in some distributions(like Ubuntu 9.04) doesn't
-+ * define the macro. We need to define it here.
-+ */
-+#ifndef STT_GNU_IFUNC
-+#define STT_GNU_IFUNC   10              /* Symbol is indirect code object */
-+#endif
-+
- #include &lt;getopt.h&gt;
- 
- #include &quot;elf.hpp&quot;
diff --git a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
deleted file mode 100644
index 13e4606b80..0000000000
--- a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Remove dependency on dpkg
-
-Upstream-Status: Submitted
-
-Asking the host OS whether it supports multiarch is not useful
-in a cross-compilation environment, or if the user has specified
-a libdir explicitly. So this patch, based on the work of Mentor
-Graphics, removes mklibs's dependency on dpkg package.
-
-Signed-off-by: Yuanjie Huang <a class="moz-txt-link-rfc2396E" href="mailto:Yuanjie.Huang@windriver.com">&lt;Yuanjie.Huang@windriver.com&gt;</a>
- src/mklibs | 30 +++++++++++++++++++-----------
- 1 file changed, 19 insertions(+), 11 deletions(-)
-
-diff --git a/src/mklibs b/src/mklibs
-index d9b784b..c5614ea 100755
---- a/src/mklibs
-+++ b/src/mklibs
-@@ -261,6 +261,11 @@ def extract_soname(so_file):
-     return &quot;&quot;
- 
- def multiarch(paths):
-+    # Asking the host OS whether it supports multiarch is not useful
-+    # in a cross-compilation environment, or if the user has specified
-+    # a libdir explicitly.
-+    if sysroot != &quot;&quot; or libdir != &quot;&quot;:
-+        return paths
-     devnull = open('/dev/null', 'w')
-     dpkg_architecture = subprocess.Popen(
-         ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],
-@@ -340,7 +345,7 @@ lib_path = []
- dest_path = &quot;DEST&quot;
- ldlib = &quot;LDLIB&quot;
- include_default_lib_path = &quot;yes&quot;
--default_lib_path = multiarch([&quot;/lib/&quot;, &quot;/usr/lib/&quot;, &quot;/usr/X11R6/lib/&quot;])
-+default_lib_path = [&quot;/lib/&quot;, &quot;/usr/lib/&quot;, &quot;/usr/X11R6/lib/&quot;]
- libc_extras_dir = &quot;/usr/lib/libc_pic&quot;
- libc_extras_dir_default = True
- libdir = &quot;lib&quot;
-@@ -386,7 +391,7 @@ for opt, arg in optlist:
-     elif opt == &quot;--libdir&quot;:
-         libdir = arg
-     elif opt in (&quot;--help&quot;, &quot;-h&quot;):
--	usage(0)
-+        usage(0)
-         sys.exit(0)
-     elif opt in (&quot;--version&quot;, &quot;-V&quot;):
-         version(vers)
-@@ -395,6 +400,7 @@ for opt, arg in optlist:
-         print &quot;WARNING: unknown option: &quot; + opt + &quot;\targ: &quot; + arg
- 
- if include_default_lib_path == &quot;yes&quot;:
-+    default_lib_path = multiarch(default_lib_path)
-     lib_path.extend([a.replace(&quot;/lib/&quot;, &quot;/&quot; + libdir + &quot;/&quot;) for a in default_lib_path])
- 
- if libc_extras_dir_default:
-@@ -661,16 +669,16 @@ ld_path_name = os.path.dirname(ldlib)
- ld_full_path = &quot;../&quot; + ldlib
- ld_file = find_lib(ld_file_name)
- 
--if ld_path_name != &quot;/lib&quot;:
--    if os.access(dest_path + &quot;/&quot; + ld_file_name, os.F_OK):
--        os.remove(dest_path + &quot;/&quot; + ld_file_name)
-+#if ld_path_name != &quot;/lib&quot;:
-+#    if os.access(dest_path + &quot;/&quot; + ld_file_name, os.F_OK):
-+#        os.remove(dest_path + &quot;/&quot; + ld_file_name)
- 
--if not os.path.exists(dest_path + &quot;/../&quot; + ld_path_name):
--    os.mkdir(dest_path + &quot;/../&quot; + ld_path_name)
-+#if not os.path.exists(dest_path + &quot;/../&quot; + ld_path_name):
-+#    os.mkdir(dest_path + &quot;/../&quot; + ld_path_name)
- 
--if not os.access(dest_path + &quot;/&quot; + ld_full_path, os.F_OK):
--    debug(DEBUG_NORMAL, &quot;I: stripping and copying dynamic linker to &quot; + ld_full_path)
-+if not os.access(dest_path + &quot;/&quot; + ld_file_name, os.F_OK):
-+    debug(DEBUG_NORMAL, &quot;I: stripping and copying dynamic linker to &quot; + ld_file_name)
-     command(target + &quot;objcopy&quot;, &quot;--strip-unneeded -R .note -R .comment&quot;,
--            ld_file, dest_path + &quot;/&quot; + ld_full_path)
-+            ld_file, dest_path + &quot;/&quot; + ld_file_name)
- 
--os.chmod(dest_path + &quot;/&quot; + ld_full_path, 0755)
-+os.chmod(dest_path + &quot;/&quot; + ld_file_name, 0755)
diff --git a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
deleted file mode 100644
index bc56593e6a..0000000000
--- a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From eddf04c7f8312e9c29cdb24e431b7e4fb2cc70ed Mon Sep 17 00:00:00 2001
-From: Yuanjie Huang <a class="moz-txt-link-rfc2396E" href="mailto:yuanjie.huang@windriver.com">&lt;yuanjie.huang@windriver.com&gt;</a>
-Date: Wed, 15 Apr 2015 14:00:06 +0800
-Subject: [PATCH] Show GNU unique symbols as provided symbols
-
-Upstream-Status: Submitted
-
-GNU Unique symbol is a GNU extension employed by new version of GCC
-by default. Even Standard C++ library in GCC 4.9 provides some symbols,
-such as _ZNSs4_Rep20_S_empty_rep_storageE in this binding type instead
-of ELF standard weak binding.
-This patch adds support of this new binding type to mklibs-readelf.
-
-Signed-off-by: Yuanjie Huang <a class="moz-txt-link-rfc2396E" href="mailto:yuanjie.huang@windriver.com">&lt;yuanjie.huang@windriver.com&gt;</a>
----
- src/mklibs-readelf/main.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
-index 56d93f8..0134530 100644
---- a/src/mklibs-readelf/main.cpp
-+++ b/src/mklibs-readelf/main.cpp
-@@ -88,7 +88,7 @@ static void process_symbols_provided (const Elf::section_type&lt;Elf::section_type_
-     uint8_t type = symbol-&gt;get_type ();
-     const std::string &amp;name = symbol-&gt;get_name_string ();
- 
--    if (bind != STB_GLOBAL &amp;&amp; bind != STB_WEAK)
-+    if (bind != STB_GLOBAL &amp;&amp; bind != STB_WEAK &amp;&amp; bind != STB_GNU_UNIQUE)
-       continue;
-     if (shndx == SHN_UNDEF || shndx == SHN_ABS)
-       continue;
--- 
-1.8.5.2.233.g932f7e4
-
diff --git a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch b/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
deleted file mode 100644
index 75500a029a..0000000000
--- a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-In cross builds we will have to respect sysroot
-
-Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
-Upstream-Status: Pending
-
-Index: mklibs-0.1.39/src/mklibs
-===================================================================
---- mklibs-0.1.39.orig/src/mklibs	2014-03-01 18:25:36.000000000 +0000
-+++ mklibs-0.1.39/src/mklibs	2014-10-19 00:51:46.813534596 +0000
-@@ -495,7 +495,7 @@
-     present_symbols = {}
-     checked_libs = small_libs
-     checked_libs.extend(available_libs)
--    checked_libs.append(ldlib)
-+    checked_libs.append(sysroot + ldlib)
-     for lib in checked_libs:
-         for symbol in provided_symbols(lib):
-             debug(DEBUG_SPAM, &quot;present_symbols adding %s&quot; % symbol)
diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
deleted file mode 100644
index 1784af1f4c..0000000000
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = &quot;Shared library optimisation tool&quot;
-DESCRIPTION = &quot;mklibs produces cut-down shared libraries that contain only the routines required by a particular set of executables.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://launchpad.net/mklibs">&quot;https://launchpad.net/mklibs&quot;</a>
-SECTION = &quot;devel&quot;
-LICENSE = &quot;GPLv2+&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://debian/copyright;md5=98d31037b13d896e33890738ef01af64">&quot;file://debian/copyright;md5=98d31037b13d896e33890738ef01af64&quot;</a>
-
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz\-file://ac_init_fix.patch\-file://fix_STT_GNU_IFUNC.patch\-file://sysrooted-ldso.patch\-file://avoid-failure-on-symbol-provided-by-application.patch\-file://show-GNU-unique-symbols-as-provided-symbols.patch\-file://fix_cross_compile.patch\-">&quot;http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz \
-	file://ac_init_fix.patch\
-	file://fix_STT_GNU_IFUNC.patch\
-	file://sysrooted-ldso.patch \
-	file://avoid-failure-on-symbol-provided-by-application.patch \
-	file://show-GNU-unique-symbols-as-provided-symbols.patch \
-	file://fix_cross_compile.patch \
-&quot;</a>
-
-SRC_URI[md5sum] = &quot;6b6eeb9b4016c6a7317acc28c89e32cc&quot;
-SRC_URI[sha256sum] = &quot;3af0b6bd35e5b6fc58d8b68827fbae2ff6b7e20dd2b238ccb9b49d84722066c2&quot;
-
-UPSTREAM_CHECK_URI = &quot;${DEBIAN_MIRROR}/main/m/mklibs/&quot;
-
-inherit autotools gettext native
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------7CE5D0D28B22EF2CC5CFE9E8--
