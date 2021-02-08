Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web09.538.1612808469915153919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 10:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=so7v1hfT;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=767365350d=alex.stewart@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 118IDsvj025069;
	Mon, 8 Feb 2021 12:21:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=to : references : from :
 message-id : date : in-reply-to : content-type : content-transfer-encoding
 : mime-version : subject; s=PPS11062020;
 bh=gUQ4xUh9ZxD4QUeQMF4T1Wfyw+KQELUhUZdCWUxPqZ8=;
 b=so7v1hfT8UtT7LBlPTfUJb+qfufHLcPs4NnanLdvCukZpXcti9ex3vNaZM8vJfK4oxpN
 8r3l7d1ERpOwMKMB9I2Ef5yG9cIxS33eZ6/FXz+bYJiH4h4GjNblETkCRwBzODKkNz4C
 JabIPMgx30bXTK6WZR0ot5+Va9BDUAQ2+Uvr+CCQ4NlsFRZ3wnGu1z088S6DUsHAunkP
 aFjDxjX6thRniNlAg612VUcZphcnE5QKsZwF9S8u1ZQBXHK4rlumLwswRo/Z29rlRFaT
 eSvPAFQISMO6GK/Ql96IKgtZZUNocKzWDWmvtAvodlbjWGZ5X/yDSJ/DU3xKPcN/rBKg Gg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0b-00010702.pphosted.com with ESMTP id 36hr8paxnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Feb 2021 12:21:08 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLl66Uo22jx9tkoJpz6yU7LVmulNc6PwA4Ksi6Hxt3RCL+sZEY6wEYDTjE5s4mnEP8qM3viRpNt6x3Kxat9KLn+UoT4TDOUeHAVidloBuIwfST01D8KKpbY609RoCOB7ZLt6RGXRyU/UQz3oiJFfZocwGnarPuaoxEBfwFtjDXLMNoOMH0NJSA1Kl7Q8R8a4wUmFQkJozegwP6uRQzbWCB7aZR2yD5Jr0RFNHoCGIwkzq8Fhp+sHXbgN/Vbmai5eWzz2F2Tb7s+hMFmtkJ9gVT5lPvQmmNRpiVjloWn7NV9XEzKOzd4EW/Gc3qgxDXiz5mQxECkpUSGMeaDVmVAbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUQ4xUh9ZxD4QUeQMF4T1Wfyw+KQELUhUZdCWUxPqZ8=;
 b=jSz+QfOvotKXnOLZ/SvyL+JsDKJ6euZe/xGGRBInFh0nxZZmzMXVMtzP4+CMRuozxaUAI3yuHi6Uce1HjqOJERSQW57ojOwXgr3eSnxQaQRwo/ZBEIVcFDCDKa3c41+ik93raolcchUgnqXTD3itfY/gKCwoeiz7eejNyoHxk3nZ0P4Xdz6mDXH3bTk8LcYtLJDeijwr+dZgrPv5iMW9CYvG9Ygz9wuKxsbkm4yRk5OQJVB5TPIEJBVZvX7zBLttD6O+8zIFDW9FPFZnkv09+BFN5zFTBYjIEd3mIKT/h5poMmDg/sCBGD6rjyCJzFoodqavUwFHxK/Fc9O04oh8rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUQ4xUh9ZxD4QUeQMF4T1Wfyw+KQELUhUZdCWUxPqZ8=;
 b=hb7yyNgubCXlQK/fAimTE1E2mV9Bwbq1t8Hh83nikrSUZVG+ztOMa+uQoX0lxaNgl/ku+hdKflyE4Jylf0dmsCUXRWxcqb/bZujFvkufOilucnDN3KufUUf3A7022Aqd50g3E5r4t+4yVXJVwkxX+n+JaYW2NpaiinJK0vJiaWg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=ni.com;
Received: from DM6PR04MB5306.namprd04.prod.outlook.com (2603:10b6:5:10f::25)
 by DM5PR04MB1051.namprd04.prod.outlook.com (2603:10b6:4:3d::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 8 Feb
 2021 18:21:06 +0000
Received: from DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::85b8:7cc:802e:d31]) by DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::85b8:7cc:802e:d31%4]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 18:21:06 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20210202234835.1532984-1-richard.purdie@linuxfoundation.org>
From: "Alex Stewart" <alex.stewart@ni.com>
Organization: National Instruments Corp.
Message-ID: <cc33b921-3b59-8c11-ffbf-df8fdb4d3173@ni.com>
Date: Mon, 8 Feb 2021 12:21:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210202234835.1532984-1-richard.purdie@linuxfoundation.org>
X-Originating-IP: [65.36.69.14]
X-ClientProxiedBy: SA9PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:806:21::7) To DM6PR04MB5306.namprd04.prod.outlook.com
 (2603:10b6:5:10f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (65.36.69.14) by SA9PR13CA0002.namprd13.prod.outlook.com (2603:10b6:806:21::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.15 via Frontend Transport; Mon, 8 Feb 2021 18:21:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97ff5008-0fbf-4b26-a26f-08d8cc5e4d07
X-MS-TrafficTypeDiagnostic: DM5PR04MB1051:
X-Microsoft-Antispam-PRVS: 
	<DM5PR04MB1051FC101631A4F235F46A70FE8F9@DM5PR04MB1051.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sdbsQqudiXIbzUW8+a2n+UG7QbPY0bKh/SEeFvTyXzcYQfv31JqFWYjx5a3qZS3YumJ7IZfJhH8hhMpvmBEqivzT+KtUupu731idrKkNjeHSUtRPqM4pP1TROlloTgsyboPoCqHuyembj45D1lJFAftakfRVaZk2eZMiRIGS49q2ZOiRgFbTGhabqZYSZ1i5f8AD+OE3ee85SN5Cqo21Fyuo/NnFdfhvCymGd1tkIyjXHRB2n2no1t2/cVB0rKvpba+X5tNMDb7UrjLbE2Zv03Bybe2JUk4cTnXwGE6aXRA5xy6Lf3hP2KS2PVkXWVQ1rQ9LshCVxGP6PBF4tBTiBIdfywxYsvEVAF5YIdR1ynYt/FrfLf46wbpes8cRXzUFUda6g63p9UVKvM3+Hi0Tu9AXq/sG+CsfjoVPGOwgXWDuTk8Kpi+GrowMqLNRxmV/W+95Vhdqs5kLc7rXFcpHKZdv9ebD7qKz3iHArELsIUE13ohlWsp65gI9hvqqQ4s3u5SPjsG6kJvasMCLJBaABhEBL4Ez9OYUFb9ZholaPHQzNeeFCXBkCFQd/kkyaD6QUxetB4vJSzWO/twKnfBnTXoYcx+vA8OoOk5E5AR9VBibIWZjptr4mu7tsT3v4i/uhhpOFBtcm5qDed7im7LUC8364GAf7Cj5TiWTljdi3FU4y9yjAt2UmC442lEaWK9y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5306.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(366004)(39850400004)(396003)(31686004)(478600001)(53546011)(5660300002)(8676002)(52116002)(36756003)(66946007)(2616005)(186003)(8936002)(86362001)(16526019)(316002)(6486002)(83380400001)(16576012)(44832011)(2906002)(956004)(26005)(31696002)(66556008)(66476007)(36916002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dHhMN2NJLy9ETDhZTW1ZYy9aMU1CVVZ1M25Ub3BkYmxxdGVFeDR0REFMVlhE?=
 =?utf-8?B?aGlaSHZFL21mWTdPRUd5NHdiSEYzK1BhZTcyd2s3OEhKV0EzR2xtYmxLSExl?=
 =?utf-8?B?eTdydmdXRGoxc1Q5UGdNWHNNbnZYRzh6V094OTV6VEdJSXZxNVI5VXUyZWor?=
 =?utf-8?B?T3Q0TWFqMnRQLzlpcTVxeFF1Q0lQNFNhbS9YUVFnQWZkbWZ3NVQrdUVoUnRs?=
 =?utf-8?B?L3BhdFhyMFVsTzhWUTIzUXR6WWgxZUxMbjRReHh1WU5Hd3hZUFd5SVAwVjhW?=
 =?utf-8?B?RUVjVmZrWUMvSUl1a1lET1NkOEgzaEJ6Mk9uS2VYR04wQjBvdUdnb1kwd2dT?=
 =?utf-8?B?aW94eER6WFBjMVBtRWRzUnRZelB0Wm05bDBoRzdSWW1JQmthWDR0STFTaUs4?=
 =?utf-8?B?ZVo4WFV1bWxRN0FhME01ZXd5eElpTmhMdGlyUUtLditkVE94Si8zK1hGN0k0?=
 =?utf-8?B?S3Rmd2hsRG1vZWIydHlEcWxBMGJVemNockhzMGkybWJDSXY5bFBFelRDT01W?=
 =?utf-8?B?cWV0V1ptOTdWNWhCSTJzeUx6TTk3RnVCcW8zN1ZVdUpoWmdWdmY3OVAvYUg5?=
 =?utf-8?B?MVJDVkh4aWo4SDZseDBQc2NCSlBKOFUrQzBwZVZBdjBSOTBVYTdFU1pLRjh1?=
 =?utf-8?B?WnJsTzdmcjFPQUZ2dDVTZjQzTnNNYm9DTG5HVStxOGdoWnFMWlFmQ3dPZ0E3?=
 =?utf-8?B?UHdzclRVSEpsS0R2QVQxc3FQaFNRWE1JV0VLU3VHNVRWeElONFVlOWsrTTZ2?=
 =?utf-8?B?SC9EMVBoZW5sSWRJZVpLSFErMGg3cDAzL0dVcEJhQnBOenhJdElNRHBxaUpW?=
 =?utf-8?B?VXBzNk43cVNKRkhvdUx6ZWQwS1ZpUEZOVnczc2FiTTJHT3YxZFk5S2daSzRv?=
 =?utf-8?B?NGxyWGM0Y0Mrc2VGc1RpYVZoU3Nid01WTzFzbkgzY2g4Zm11cVBZeFZUSHZX?=
 =?utf-8?B?bEUrcVpHcTJpcjl5Z3J5UnhJaWJRZVp3OEJ2SG5WR3FxeE14L0FXTUlwQXRw?=
 =?utf-8?B?cVBKZUE0NTRFZmFQSU1rUHdnRE9jWmQ4MGNZNXhmRCtEdFlPcHM2SGRVcVRO?=
 =?utf-8?B?WStjL1BQR1lBQnZJS1diTzl4S0JjY3VoTHRMd2V4UzBhRGRjS3BIZlNORWg5?=
 =?utf-8?B?QWtRUnZFVm5XK0Z5blFzVkFCY08yQWloZVI1MmxXcTY3cE9zM2lMaytBZytp?=
 =?utf-8?B?aFNnN2ZCaW1udVR5UE1kWjExNHRISklwcWozb2F5TmhDemRtN2ZOY0h4QmxN?=
 =?utf-8?B?bEsrdnk5elB6QlYvWW1kaHg1azFKa1RKeWR4aXdiYUUyWVEwSU45b3NHV3dH?=
 =?utf-8?B?YVlhVUEybXdBc0JreThKZ1BJOWZMNnZYdlhvaUFDbXV0VW1NeHNUR0Rrb00w?=
 =?utf-8?B?UytRVTdDdVJDZERCMHh6NnNoVVE1Z0phYlFaSTErTHFzWTkybHEyN211UllB?=
 =?utf-8?B?M3c0WDBrZzVlUlN2T2JwTmVNL1Q4WndQbDRIWGRsRFVLb21yTFB4SUh5THRn?=
 =?utf-8?B?NEt6cjExcDBtaTdvbFhGZ2pDeE1pOGUrZkRzSVlFWUE2RlJaOElETHV3cm1j?=
 =?utf-8?B?ekg2alZ3SCsvWTU2MFNNZkg3bjZkcE8yZjhlck9leHFsTkdUWVUzZnMxajBC?=
 =?utf-8?B?R1lOLzlhRTNiNFJ5TDhCbnY1SWxmSHc3Q3crb1ZGbUMxbEJWbG41aUNHRmk5?=
 =?utf-8?B?VTFrQlVQbWEzTURWSjM4b2sxdG9kdTRacHVTMjAreHJ2NGxuVk8ySGh5UFRT?=
 =?utf-8?Q?s6LBnK/6GpQE72eOVF6gHGcpqioBvP8Gpm1Ycre?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ff5008-0fbf-4b26-a26f-08d8cc5e4d07
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5306.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 18:21:06.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqfzrhqQ1vQHrgIpoNa/UODKPrP1M6Llsq15oHIzq7TyjRwJlRvZpq1N3BdB7UVtd7PpoqTxunc3+n31RDA/Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1051
Subject: Re: [PATCH] opkg: Fix build reproducibility issue
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-08_11:2021-02-08,2021-02-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 phishscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080112
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 2/2/21 5:48 PM, Richard Purdie wrote:
> A build date was leaking into the generated docs and makefile used for
> ptests leading to reproducibility issues each time the month changed.
>
> Add a patch to use SOURCE_DATE_EPOCH to derive it if available.

ACK the objective, but I have a couple concerns about the patch below.

> +--- opkg-0.4.4.orig/configure.ac
> ++++ opkg-0.4.4/configure.ac
> +@@ -281,7 +281,12 @@ AC_FUNC_UTIME_NULL
> + AC_FUNC_VPRINTF
> + AC_CHECK_FUNCS([memmove memset mkdir regcomp strchr strcspn strdup strerror strndup strrchr strstr strtol strtoul sysinfo utime])
> +
> +-CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
> ++1607446883

Is this `1607...` timestamp just some leftover pollution in the 
configure.ac file or does it serve some purpose?

> ++if [ ! -z "$SOURCE_DATE_EPOCH" ]; then

AutoConf doesn't have the shell interpretation of `[`; right? At least 
on my system, AutoConf drops the brackets in this statement and writes 
the ./configure file as:

if ! -z "$SOURCE_DATE_EPOCH" ; then

which obviously fails when executed. Can you use `if test ! -z ...` instead?

> ++    CLEAN_DATE=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH +"%B %Y" | tr -d '\n'`
> ++else
> ++    CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
> ++fi
> +
> + AC_SUBST([CLEAN_DATE])
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.4.bb b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
> index f8034ca5fa5..548e81962d7 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.4.4.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
> @@ -15,6 +15,7 @@ SRC_URI = "https://urldefense.com/v3/__http://downloads.yoctoproject.org/releases/$*7BBPN*7D/$*7BBPN*7D-$*7BPV*7D.tar.gz__;JSUlJSUl!!FbZ0ZwI3Qg!-TBdy64CfATG4aDXNwLs-F_1Ucyiha1TiiAh_Q51F5iWdo4LWw-X9cnExOGco7s$
>              file://opkg.conf \
>              file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
>              file://0001-tests-let-the-OS-negotiate-relative-package-dirs.patch \
> +           file://sourcedateepoch.patch \
>              file://run-ptest \
>   "
>   

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com

