Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11785.1630288522947509525
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Aug 2021 18:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=M71q+glY;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=487684681b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17U1E2I6012727
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 01:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=f2/jZNhk1V/DE4Z9rQXCX5xn1/sShTWj8NeyQy5dGFA=;
 b=M71q+glYVBGKg9690Cr37Le/uCXTeRJ8mIaG1Xcya+D3Wo83px6hYnx0eyOeJtAdC93g
 ht+V1okJFKegLslOONl0Bslw24EkgBEoqOte8V6fbx0AO7MQbeXmPzJfD+fC93Wk5aNr
 mTMQ47xyHRdrOXx6eVMRBusIbXjb9YphI+KGB3CtHZb+p6u0a6VawXCqoFz6/FWIPahB
 aKm06+bxv7vRue+ajzlh6Zxi2o6t4B20qgO2w3wL2EFr/gNskLjb8GqVoQkTCRMiNFh+
 0+jX1dTf6i5KdC22Tp0P3K0iJJ6QFEWyLN/fJSiHYmhJLOMWG2QFnt8nuHpAE7C+nExT mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ar9pjr99k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 01:55:21 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17U1tKMM015763
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 01:55:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ar9pjr99h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Aug 2021 01:55:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAurrfuIv6VBUU1wwlDv8eh9CEL5xFBFOBo8C55NGKSshbp8uZrfE1T+TgkwbzLarsOjEA+PHphEZkRlsTqb41kIQKWHxcDPj4wwRyxc2nJyoiJvRp0PjPnEkptH3lwhKsaeV9aqWmyvTaV92vTMXXX4NHwP29r9a2NG2Se1Yse+WTmTRyeH7lLtT/SDzAr8zE9Eau+EiTRFbkCQIoDLtyZemR2qhOLZB/n665T+BLQ4tynJYP7u8GGgPE/wefN0qyAY/smoX87PPxppmXbH1E7gZpvBQYEIvyCY7fy3Lc48oMI9E61RE9Pk85AWkXT3ZwXNcXRys18rjbNbRBwqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2/jZNhk1V/DE4Z9rQXCX5xn1/sShTWj8NeyQy5dGFA=;
 b=GB9H1c7R2XOfhlojKB7giJUV33wCkhaduNFgt8OzdDUHh2JQ7s6ybus1c+pg7V2BsXPnvLCuKkcp8PAezZzOB8mxq3b79Z9mW91V4MgtmUAai1HKNIFJQpTxwyYjqUGUrxZjdWoyzI7+1a8m6c4LNurVCmRZuA6iiywVeWoURxtcvg0hhaVvoTte8peScz1tT7KJ+8tSFjeoRrc6Wd+DpsxkJ5POsy2V4wW8En6hgVumLbVDLftcIOV19UaiLPz2+PLBx9Mf/vxZx1bqzspCVop0iqAIMTKjEqsd7ykOD78ozbCtMt06TL+BtSQqd7cJpt1mmNRCZPZw4HTmLRYVng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by MWHPR11MB1821.namprd11.prod.outlook.com (2603:10b6:300:10f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 01:55:17 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::d1c0:bab8:4a6a:edf8]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::d1c0:bab8:4a6a:edf8%2]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 01:55:17 +0000
Subject: Re: [OE-core] [PATCH] glibc: fix create thread failed in unprivileged process
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org
References: <20210829135235.43999-1-hongxu.jia@windriver.com>
 <6624b30c-ff7c-8772-9363-2ef19ce97996@gmail.com>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <2f5619ce-d204-65fd-f1d9-3c9232bb48d7@windriver.com>
Date: Mon, 30 Aug 2021 09:55:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <6624b30c-ff7c-8772-9363-2ef19ce97996@gmail.com>
X-ClientProxiedBy: HK2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:202:2e::14) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.148] (60.247.85.82) by HK2PR06CA0002.apcprd06.prod.outlook.com (2603:1096:202:2e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19 via Frontend Transport; Mon, 30 Aug 2021 01:55:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3640256-4a3b-4917-680d-08d96b593702
X-MS-TrafficTypeDiagnostic: MWHPR11MB1821:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1821C30406155CAE20D7830294CB9@MWHPR11MB1821.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IZmAao/ums3+C8S5KkQ6KAhid4XiB6GyUFQwdTEhIec0gfOzeZLO8PJfwmeDzqUOZR6f32FYFCUg4Ha9tIqI3R6KjVxc8levF99hZD5GaO7Q5Wsk2Z6WhLjg0pfs6jYJehrUfCHGlRpC4b7m2YpJUehmav9iP4L4jXlw2RPte+dQq+anhkk3Tyav8AHjy7wgNIAPBAryiTQq3HWSpFMPrHDHd3EeG7MT2QNupcOaMS+i6ap9m/4TiSJXfaN3CSRe2IVeCmdEByrWq1N8mzjwhjZnR4yXskXjigatrduCWkq6P9N2sVEmnyygvQi11IlokR7SsVWb+WuagFXiHo8sqVDps0BL1pR2q92VVir6Ew+EuBHkOiwwT+b31nmZwbXZsBTsduJWvoHmAA99fgLp+HPTPioB6XX9HMjEJazZiNe9m+2kgPVZy+3p1mViZO+m4sgxnxsSDzlheNrOE6daWt30T2GPS0Iycp3jD8z8WAHcToI4WhKmWqXZ+QxFZ2Wdpq+cE87KLJvfFTpJ9GHFnO27bqg2UMtn0Uzgm0Pde4AhIMgrIRgWpycrpYdvPRqZdZ6/pHwSMV6X8cQqAvoSGjjpWmMn/0eQCNM5Y0PSs9UbfknXLFZtSloxEGadc5AkSXf0obNeQaHvxSe/n/2j8AS4D4U4kHJlrExHaa+WEtD3dntfN99RMJRavwfx+/q5dbPA3cyS+oLlAyGcyzDS7+wAZUEw7yDM4btmAytAoBhueL/Q9GHoU5giokLTudSiuQaU5odt/7Aobbb+1Vt3JCEdHvL98JKdR2Be83E7u0JabQa0sDJeRFf0QEKCCsT6owP04BkCyZhG5NdO72R/2lxn/20kZqlPnjawwT5KBBMwgvhUWGU7IPLbCvd+Wbl3fDioYnithtip7A4pz8w0pg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39840400004)(346002)(396003)(36756003)(38100700002)(66556008)(31696002)(66476007)(8676002)(31686004)(38350700002)(956004)(2616005)(52116002)(316002)(6486002)(53546011)(2906002)(66946007)(966005)(6706004)(86362001)(186003)(478600001)(6666004)(83380400001)(16576012)(8936002)(5660300002)(26005)(44832011)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UzB0MGlBRGdoK2Rwa2V3ZThabm5aaWpTcEh0bnFvWC9FYXFxMXkyQXhVcXJB?=
 =?utf-8?B?blJicUVJSm1CUVBmeUJaVG1Hd09GamczVldqRHI3c3E3SEI1ZWJqazhDNmZC?=
 =?utf-8?B?N0ZCUS8xU2xzOHJleU5rdWo5bVMzL2M2L0d2SVhzREJBY1VibWplbEFMVmVZ?=
 =?utf-8?B?MGlWZDFsNTBFQ3VWaHM0dlpDMnd3VldnRXU2Y0JwRFB2L3gwU0xiS2JjQWda?=
 =?utf-8?B?ZGdZbVNLRG9oN3JJaDREd1hxS2RZdCtVQTVOQzUzQWhIaUtROWFtN25WdTZB?=
 =?utf-8?B?Q0lWbjg2RmJLb2ZwR2xQWndKV00xRkhsU1pwbFBuZFdOcVNrNEQrR2ZsMkFi?=
 =?utf-8?B?c2lnWU5KenR1M2hONE9Oakd4YnFpTnltL21rWGU4V1BBZGx2dXhYekZiR2Fj?=
 =?utf-8?B?TWI2eVZnMWUzVXQybHh4UmVDbWltOThxbWhBV3hwKzA1bVRQSEpzSzhGWk9s?=
 =?utf-8?B?K21lbC9nSlRFbTJITUt3eFJaZ091Q2ZQZFBTZG9XeHRWOWtHQWFJTHZJUVps?=
 =?utf-8?B?Y25XVlNlMERIMG1HbXVyeGovTm8zenBDNmhuSU55VnlIZERYWVN1MStOSW1K?=
 =?utf-8?B?MWlQN0g1ck0xQXptVzZ2REE3M0tvMkEwRlpVUTNNNVdsam1nMG9OU3YzcnZ6?=
 =?utf-8?B?YWdHbFM0N2lmdzZuK2RYd2FLY294Ym9wWmw2S3A3dVZwM1pZYzZody9Ib3N5?=
 =?utf-8?B?aUJ5NkdNL3JmSG4vYWNkN0xlNjJEcE0xSGJ5TldSWlV4ck5VKzVTWGFEU2gz?=
 =?utf-8?B?YUY1bURtZmVqOHkzdjlOVnNJRXA5enlnMGRiVDJCU1M5Uzk1d3JhdkI1QzJD?=
 =?utf-8?B?eWpBMkZ4UVRQRUxWLyt2NllmdFFja1Vkckk2VGlDODB3dHgwNVlOYVkxU0VU?=
 =?utf-8?B?cEc0N2Y2eXpORldJUGZWd1pZT21HWXpWTm41NTJxQWRoY29sYlVEWHlkNW5p?=
 =?utf-8?B?RzhvOVlVV25aMGFvK0RVZTBKcWd5N2hEL2RkMDlFNUJhTVJ0OWliVlV3TnRY?=
 =?utf-8?B?R0hOcEFtMDA2cXFYeCtjMXZ1MmxaaGpRT0RScUQrNUl1Nml5dVRmMWVDNzlj?=
 =?utf-8?B?aGtaNy94VWE0TllXbUh1ODFDUWU5TldQenFsNUhMaDdiUE1nTHJrK2lLYTE0?=
 =?utf-8?B?cFZvazVRTkZndjAzY01VaHlYRnVSRFpSNDEzMi9ObklYZ3M1YlZiWGN5a2cy?=
 =?utf-8?B?UEszWU9SVWFFUmkyZS9xc2RITnVSV0JoVWEzeDRYV1NvZTdGT3I3a0s0QTNl?=
 =?utf-8?B?dDdXV2FQbjQ2VmVkcDhjZUlpUldJVjNWVVB6Tit4UnYxQnFoMkxVREJEYk9J?=
 =?utf-8?B?QjhHSnpRSTg1NUVmU0xqRy9MbEh5a1FVSkJSR0RHQ2ZNUisySjh6b1RGVGd2?=
 =?utf-8?B?RWM0RWU0Rk1yRnVOemw0OTZGbFhMYTEyeS9QWEFJTjNhYVpwc09zT0JlR1Vu?=
 =?utf-8?B?R0ptSE94K1gvQnFhdXNnQndlYzNRaEVDUWVOMEQ3M3JDMU12Ykc2cVZRT094?=
 =?utf-8?B?ZEgvbEt2ZWJPNy9YSmpTVXlDYW8yYjRlc0tCTWlINnlxZDNDYkgydUt6Qlc0?=
 =?utf-8?B?ZmlSQUhXdEI4Z1BDTW5HMk5seTV1OHA4bzFtZUdNbE5IN1JCcEIvdThiL0lx?=
 =?utf-8?B?K3lxZlliNTJleU9IU2FzVW5XYjVoNzg1Y2Y3OUgvN1UvUDVBVXUzVjIzNGVn?=
 =?utf-8?B?U2J2cm0yMnZ1M0VPRTRTRGFFZEdUNERadGRmTE5ReERiRDZ5UEVHTENqTGsz?=
 =?utf-8?Q?swmGx/YqfnJDDg6DG2gNuv2PioUqDBe8GFgVDXH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3640256-4a3b-4917-680d-08d96b593702
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 01:55:16.9797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vUjoHESPjdlXDlTgaVZDDTekRZgL7RVzIVOPBSFfBEutws1baBo0bAdHY6sXWtD1he9cQTH/oKbZ2ZCDY/sdqhESZv2t7eZof5WH+yFW7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1821
X-Proofpoint-GUID: 6v3nbpClQClUvUI2ATR3gwCZXcawncdr
X-Proofpoint-ORIG-GUID: xCapv6YwAUQgrBm8yyNsdh5t0njP-EXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-29_09,2021-08-27_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 mlxscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108300010
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17U1E2I6012727
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/30/21 12:18 AM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 8/29/21 6:52 AM, hongxu wrote:
>> Since upstream commit [d8ea0d0168 Add an internal wrapper for clone,=20
>> clone2
>> and clone3] applied, start a unprivileged container (docker run without
>> --privileged), it creates a thread failed in container.
>>
>> In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is=20
>> defined.=C2=A0 If
>> __clone3 returns -1 with ENOSYS, fall back to clone or clone2.
>>
>> As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
>> CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
>> was specified by an unprivileged process (process without CAP_SYS_ADMIN)
>>
>> [1] https://man7.org/linux/man-pages/man2/clone3.2.html
>>
>> So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
>> fix the issue.
>>
>
> I think this is application issue so perhaps should be fixed in
> container runtime and not in glibc so fixing glibc here sounds to be
> wrong approach. You probably should disable clone3 wrapper completely or
> via tunables when launching the container runtime maybe.
>
 From container side, the docker has fixed the issue in commit=20
https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a659=
4

For glibc side, discussed with upstream maintainer=20
https://sourceware.org/pipermail/libc-alpha/2021-August/130591.html

it is better to disable clone3 wrapper in out Yocto glibc to backward=20
compatibility with old docker

V2 incoming

//Hongxu

>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>> =C2=A0 ...d-failed-in-unprivileged-process-BZ-.patch | 79 ++++++++++++++=
+++++
>> =C2=A0 meta/recipes-core/glibc/glibc_2.34.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 2 files changed, 80 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivile=
ged-process-BZ-.patch
>>
>> diff --git=20
>> a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivi=
leged-process-BZ-.patch=20
>> b/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivi=
leged-process-BZ-.patch=20
>>
>> new file mode 100644
>> index 0000000000..3283dd7ad8
>> --- /dev/null
>> +++=20
>> b/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivi=
leged-process-BZ-.patch
>> @@ -0,0 +1,79 @@
>> +From a8bc44936202692edcd82a48c07d7cf27d6ed8ee Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Sun, 29 Aug 2021 20:49:16 +0800
>> +Subject: [PATCH] fix create thread failed in unprivileged process=20
>> [BZ #28287]
>> +
>> +Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2=20
>> and clone3]
>> +applied, start a unprivileged container (docker run without=20
>> --privileged),
>> +it creates a thread failed in container.
>> +
>> +In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is=20
>> defined.=C2=A0 If
>> +__clone3 returns -1 with ENOSYS, fall back to clone or clone2.
>> +
>> +As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
>> +CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
>> +was specified by an unprivileged process (process without=20
>> CAP_SYS_ADMIN)
>> +
>> +[1] https://man7.org/linux/man-pages/man2/clone3.2.html
>> +
>> +So if __clone3 returns -1 with EPERM, fall back to clone or clone2=20
>> could
>> +fix the issue. Here are the test steps:
>> +
>> +1) Prepare test code
>> +cat > conftest.c <<ENDOF
>> + #include <pthread.h>
>> + #include <stdio.h>
>> +
>> +int check_me =3D 0;
>> +void* func(void* data) {check_me =3D 42; printf("start thread:=20
>> check_me %d\n", check_me); return &check_me;}
>> +int main()
>> +{
>> +=C2=A0 pthread_t t;
>> +=C2=A0 void *ret;
>> +=C2=A0 pthread_create (&t, 0, func, 0);
>> +=C2=A0 pthread_join (t, &ret);
>> +=C2=A0 printf("check_me %d, p %p\n", check_me, &ret);
>> +=C2=A0 return (check_me !=3D 42 || ret !=3D &check_me);
>> +}
>> +
>> +ENDOF
>> +
>> +2) Compile
>> +gcc -o conftest -pthread conftest.c
>> +
>> +3) Start a container with glibc 2.34 installed
>> +[skip details]
>> +docker run -it <container-image-name> bash
>> +
>> +4) Run conftest without this patch
>> +$ ./conftest
>> +check_me 0, p 0x7ffd91ccd400
>> +
>> +5) Run conftest with this patch
>> +$ ./conftest
>> +start thread: check_me 42
>> +check_me 42, p 0x7ffe253c6f20
>> +
>> +Upstream-Status: Submitted [libc-alpha@sourceware.org]
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + sysdeps/unix/sysv/linux/clone-internal.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/sysdeps/unix/sysv/linux/clone-internal.c=20
>> b/sysdeps/unix/sysv/linux/clone-internal.c
>> +index 979f7880be..97101994e8 100644
>> +--- a/sysdeps/unix/sysv/linux/clone-internal.c
>> ++++ b/sysdeps/unix/sysv/linux/clone-internal.c
>> +@@ -52,7 +52,7 @@ __clone_internal (struct clone_args *cl_args,
>> +=C2=A0=C2=A0 /* Try clone3 first.=C2=A0 */
>> +=C2=A0=C2=A0 int saved_errno =3D errno;
>> +=C2=A0=C2=A0 ret =3D __clone3 (cl_args, sizeof (*cl_args), func, arg);
>> +-=C2=A0 if (ret !=3D -1 || errno !=3D ENOSYS)
>> ++=C2=A0 if (ret !=3D -1 || (errno !=3D ENOSYS && errno !=3D EPERM))
>> +=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0 /* NB: Restore errno since errno may be checked against no=
n-zero
>> +--
>> +2.30.2
>> +
>> diff --git a/meta/recipes-core/glibc/glibc_2.34.bb=20
>> b/meta/recipes-core/glibc/glibc_2.34.bb
>> index eafc0216ff..6dc315c349 100644
>> --- a/meta/recipes-core/glibc/glibc_2.34.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.34.bb
>> @@ -57,6 +57,7 @@ SRC_URI =3D=20
>> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>> file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://0001-CVE-2021-38604.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://0002-CVE-2021-38604.patch \
>> +=20
>> file://0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> =C2=A0 S =3D "${WORKDIR}/git"
>> =C2=A0 B =3D "${WORKDIR}/build-${TARGET_SYS}"
>>
>>
>>
>>=20
>>

