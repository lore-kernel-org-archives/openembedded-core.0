Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.7779.1623318146760172550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 02:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=peSqQh2w;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17951d9200=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15A9X3Yv009620
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 02:42:26 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 393bk2057x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 02:42:26 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15A9gPdR027022
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 02:42:25 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
	by mx0a-0064b401.pphosted.com with ESMTP id 393bk2057v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jun 2021 02:42:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuY3QQK+XHkVpYRIODuGaH093eK82v6ac39laOqtBDiXwlK0fugUJeHPxaH/9fMRUM5YgSFH4HAWhCeXgEP/MzM8lRxWaniLaXfLUcLF8c33JBUtANKPOutHlk9YS3e99QSPTg6Pv/H31FIguHP/Q583Tv6ZuHfvA3fx86TAlb7CzwAfQT465AbTS5AJcH1DqeaL5z/OvutM2v/jTSgTLrSzFN5wgZm5ZRA83saH/9Zrzc24IVOXB4K6+ces3vxAEq0lRSKsi502ldWLBMZlqajfonpJadhuwDF7j8jq3YQOrUWhQxSOY++k1fcq5VxuekPsuX3KUa4tq4ogXtzrJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WdgJL9xZAoEmD+yAU8BEMO+8/JfpMtTqOKdnmkaqEw=;
 b=I7GaqdpePSDbU7Tuwt6j7vx1I2/rEgQi0ZhYgsz+XUj28q2W/boACrILV3BpmjS5wL3yy5sQ6SlZpumdqQ2V9lxq84jwwRoLRANce9WCyYjRr2SEvMwNwQnwks+CC4uMd845ofGoGTyXfscFmWGyAtq9TZpeQOICeEhtiiniVQLV47UkAdJPDOAcyK42wpIqy81HawAED5k9SlPpey2cvL1tcl6D5CGrI7zSpuIqFMU3mwtxPnE4TRr0+fTLCV8tkkZa3NMJJVO9neYEQ9mbcDtcDH5TjNGXYXNA0zmbv8sFafRczrPBgcFAbunnAxcIO8NHzhA2DSGtK8ZbSnbUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WdgJL9xZAoEmD+yAU8BEMO+8/JfpMtTqOKdnmkaqEw=;
 b=peSqQh2wTb1GOPbXooo7SPvlUc+U97JXMB/2hQEMKxBMgW8kPn6eNCROZJep0QDk8mncGgzjWLHYVhmU1eU/Iy6unScJZNJc8jw86hIpODo4+myAi94qBUdtWWuZ0ixV7FxJRE5S6OhJd3WRacy4iLHG4eu5ucQbp4SNZHDg8Zo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 by BN7PR11MB2564.namprd11.prod.outlook.com (2603:10b6:406:b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 10 Jun
 2021 09:42:23 +0000
Received: from BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::7cc7:7b42:5d87:6609]) by BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::7cc7:7b42:5d87:6609%3]) with mapi id 15.20.4173.037; Thu, 10 Jun 2021
 09:42:23 +0000
Subject: Re: [OE-core] [V2][PATCH] libjpeg-turbo: fix do_compile error on armv5
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20210609072939.6058-1-changqing.li@windriver.com>
 <CAJ86T=X8aHodEfG2uRWsB31xDSf3OfUUhXxxL3+yY4dzTiGzfQ@mail.gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <ecdf1fb7-cc74-23ab-3c70-929492d4d178@windriver.com>
Date: Thu, 10 Jun 2021 17:42:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAJ86T=X8aHodEfG2uRWsB31xDSf3OfUUhXxxL3+yY4dzTiGzfQ@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR05CA0144.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::29) To BN7PR11MB2548.namprd11.prod.outlook.com
 (2603:10b6:406:b3::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by SJ0PR05CA0144.namprd05.prod.outlook.com (2603:10b6:a03:33d::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Thu, 10 Jun 2021 09:42:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 506e0646-bcd9-46bb-c46f-08d92bf40c37
X-MS-TrafficTypeDiagnostic: BN7PR11MB2564:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2564D47845EE9287A9035D8782359@BN7PR11MB2564.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wz7EfTbsYPEz7eA/rfFYHXJUzhv9fTBDjBDbW2z9Nwyt/Hpsb6QLIROkaGZ3YbICFx9wcsasZsZ1isll4POmBIDORFcpc7vpYt5Rt+qkBCIMKshNS9n1Z67A63yqESbww8XMFvxHstKeIFU+jDB8ekCqMKWZWocZscTq/KQhdP7xjTtrMKh3b5aVjm0TeFdT9qsGUTQvGmogSzL1BRDNfIR81XB6p23UZ/EnBl1UEHJsIyftTHP1Z7c7uOIBJNMpu7R4zaBmLGeeBUfdXD7dB8zvQdcXGG8KlUP3cGsOvzYG8Y8INY0kRtE3grNJt2+W6fwNIjpoGhcm3iY+FuaWBicm4Or1X62YNp9ZELqtOfJlQ+dJqlgMY8P+OtJLhnwvY16vHak4Lt5zmkVLPK1cgRASfGM9zMr/bRiD9dEn550tokeP+VhciC0eb0hIQRKUVvZVdpeodRno1yEVXLXnCdB/Qh51JoIys8ECDfxNl/qaQexBaLz2vAJLxgLprqjReGn9UJLrOfSzYOWN2T5fnziB4U2vBCR84Z/cp9svbDJ5c5KKGRnSohfOro/4/YcILK2vLTnX2J2yoZ1LR+xmfvEZqK00Ni5t99OVqIHfkyoL/nvfR1UsIAqEPuACdngpJTX60tmjgG/OiNr83JcYvsz8zqj70Rq9wRRRQag7rb6M9ae2jyOkPlUwEhBqYEhSR8rokxGp/8nR75pEBD7F4AxNfYTw14/KEMjo9ABsejqBQoyqGzCEYedAWy5QP44WOOC+RpMutA9sIMm5/Bu1WqJ82wpEKRwhT49iWX4cVGbNt1f/VUW/+4RrB+mKDGA0zGYKKcUCzLMqm38B5fFRaacrqZeTPX4MRoAzEtpmDWdjypqdDZk4xA7WLnOArUd6pQflDJX7s4zkHrIZyF1mng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2548.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39850400004)(316002)(6486002)(16576012)(86362001)(2906002)(31686004)(52116002)(53546011)(186003)(8676002)(5660300002)(66556008)(83380400001)(66946007)(8936002)(16526019)(4326008)(6666004)(478600001)(6916009)(956004)(44832011)(2616005)(36756003)(31696002)(66476007)(966005)(6706004)(38350700002)(38100700002)(26005)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SXpUWUI4UzZ0R0UxRXhvSS85SEtzWjZRVzI2c3F3KzQ0dUZLdzFPWEU4SXZM?=
 =?utf-8?B?bU1yRW1iakV6NkpCOVozTVprenNiV0U3UnpiSTFwVWd3bWM4UjlRNnRQcDFF?=
 =?utf-8?B?U2s4cTZ1VVdTWjRXT25mK1dKMDdJc1pOUnhGQTZjWkFBdXNRWkRTalAwTzVB?=
 =?utf-8?B?UjhsRVlWamdUOHpEQTFpc1FRVWxWT2xrby9TT09LWjhCRE1sSE9sUVhUa3R4?=
 =?utf-8?B?SjZCVkFhR29CaE9OSEwxRGNMeTZ3cmdIejcxdTVhSmYvbC8yTUpTbmJOS0dr?=
 =?utf-8?B?UW9vQnQrTUEzZktKdUlJUlh1dG1uT0lJVldhL1cveFhZTDg1cG8yM3ZueEpu?=
 =?utf-8?B?M3dDV1pYdWhXd2FqN0tVWllHZTNwT090S2hwQlFCTkwrWkE4Z2cvWUd0Q1Fp?=
 =?utf-8?B?cUhtaXpZLzVBZVNJV3JIZ0hodzJQTzRyd0Mzd1FLRFVhU0tiNmh1SUlsSnBJ?=
 =?utf-8?B?ZzNUZWpNZ1BSbmVYV212WXh3MS9aNE95aVhPWUJ4bjFPSkJQN2xPcnc2cU1t?=
 =?utf-8?B?TzNpQW9uK29zYTI5T2d6Tm1BS1kvd1BmVTkxNnZ3SVRGcWVBY0x0N2RXRU1J?=
 =?utf-8?B?YTdLY3ZTL3ZnNW9HMTJEQjJIcS93V1VRY3NzckMvKzNmdVNaWHhaMlNaYldt?=
 =?utf-8?B?UnI5clMzWHl0c1JMVGV0d3Qwd3RaVGwxUlpoU2tpWHpYbHJBYWlJZ3dnbjZ5?=
 =?utf-8?B?aTZ1QS9kT29WWTBzQU9JcXJncVVnaTM3SlZnVnZNZXNuTmNpZWVsSXhia1ZP?=
 =?utf-8?B?V1pneGxGTnFKOVFqRXJwbHVJMDhYNG9tUVpvNmhLcVR4c1E0NzhtVjZhWjVx?=
 =?utf-8?B?SnROK2xEUm1OWVRyV21wOFBtb1ZqcWRhQk94K25zS3BidjhIOWZSSUpZaU9V?=
 =?utf-8?B?ZmhIcUhtSkptM0Z1T1RSdDdKSXZHeWhrK1V5bTNLTGtzUis4ZFpDSWdZWW5D?=
 =?utf-8?B?OVBTQ2lORWJyc0lyOXNmNWplQUpzWnduUERSN2dmWnhwOFVMVGV2Ym83SmZW?=
 =?utf-8?B?dHZ2MEtLOUxjQTdkaXYySXBiY3A0cFFoenlkNkFzbnRRRVZBQmdobDNqVkRz?=
 =?utf-8?B?b1BtNHhjWDJFSEFJaENqUTVaTmdTWWxGZDlqTDE1M1B6RG5OaVk2WXlXK1Bh?=
 =?utf-8?B?QlR6S1huZ1VXNTM1Z2dpdlZNcFkrY280dEl5RG1xRHhMaHRTSXFwOFVqSEd6?=
 =?utf-8?B?MGFOa0t1WGZFZDdYbFJEc0lqQkhlTDArcXczMnE2WEhUZE9VVXhxUHBMdWg4?=
 =?utf-8?B?ckhyQ0Myd3ZIYzd2Q1E3ckhvL08vUGNVL3hGZWNGbm50RTBnZUM2Vml2S29X?=
 =?utf-8?B?ZzYrU2tVM1dVOVZCOXgwUnpyL3NsOGw4YzJwbWM0Rm1rNlNIaUxZZkFzcjlp?=
 =?utf-8?B?dTNMNzEyL0Q2T3QvVGJnZVhZNXNHY2R5dVJ5QXBKdXFPQXhycnpNR3RQTTBz?=
 =?utf-8?B?bmk4UVQ4QmcxR1NLQUN4Qi9CVThuU01lMEd5b0pITEg5eWt0VkY4YVk5WC9V?=
 =?utf-8?B?bThmWXlRSXhTRnRzalFoZWdKazZTZjE2QkVHRDkvZkJ1OW1PU1lPLzR2Tkhh?=
 =?utf-8?B?bnl1dk5hQUJqUjdqdmdSOGEremlvUDdrc2Z4R1hiZHpBdENxM0FObnNQeENw?=
 =?utf-8?B?YlcwWEdZNFhuelNHaHVNQXl3cHJhc1hzOTJ5OXJPMmZoT0o2cVlBRGVXeXpn?=
 =?utf-8?B?VnExdjBnNVVUSEM0NlkxZXdiRWNuZi8zblFiaXUvV0hnYVo4ZG53WGZIblc2?=
 =?utf-8?Q?EShUHzEHETBCKNwcp/51P+gLIzKdzhv20kv+gmx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506e0646-bcd9-46bb-c46f-08d92bf40c37
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 09:42:22.8520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqNjTfkbLGhxphrjX4hXIgNmU3cHUpo7gPPDWVnbRqGrbLZICICaQ0iR4/iZs9fWdKXYNR8iLn8ue3QB2OYvICHs2nuh0HVqmqrU4bsEL48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2564
X-Proofpoint-ORIG-GUID: YQVl6X94wE5a8IsVXziWT0HKPbmMLcd0
X-Proofpoint-GUID: c9EBQokR1mfhTOMr_j6fjWmhQnpEzIAd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-10_05:2021-06-10,2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100062
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 15A9X3Yv009620
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 6/10/21 1:29 AM, Andre McCurdy wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Wed, Jun 9, 2021 at 12:32 AM Changqing Li <changqing.li@windriver.com=
> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> fix below error:
>> /include/arm_neon.h:31:2: error: #error "NEON intrinsics not available =
with the soft-float ABI. Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dh=
ard"
>> 31 | #error "NEON intrinsics not available with the soft-float ABI. Ple=
ase use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard"
>>
>> Neon is not supported by armv5, disable the simd extension build.
> Drop this comment. Neon may be missing from other ISA levels too (i.e.
> this fix is not specific to armv5).
Get it. Thanks.
>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb b/meta/r=
ecipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
>> index 7f91cc02ac..da21971113 100644
>> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
>> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
>> @@ -40,6 +40,8 @@ EXTRA_OECMAKE_append_class-target =3D " ${@bb.utils.c=
ontains("TUNE_FEATURES", "mx3
>>   # Work around missing non-floating point ABI support in MIPS
>>   EXTRA_OECMAKE_append_class-target =3D " ${@bb.utils.contains("MIPSPKG=
SFX_FPU", "-nf", "-DWITH_SIMD=3DFalse", "", d)}"
>>
>> +EXTRA_OECMAKE_append_class-target =3D " ${@ ('') if (d.getVar('TUNE_CC=
ARGS_MFPU') !=3D '') else '-DWITH_SIMD=3DFalse'}"
> Shouldn't this be checking for neon in TUNE_FEATURES rather than
> TUNE_CCARGS_MFPU?
Refer feature-arm-vfp.inc:

TUNE_CCARGS_MFLOAT =3D "${@ bb.utils.contains('TUNE_FEATURES',=20
'callconvention-hard', 'hard', 'softfp', d) if=20
(d.getVar('TUNE_CCARGS_MFPU') !=3D '') else '' }"

TUNE_CCARGS=C2=A0=C2=A0 .=3D "${@ ' -mfloat-abi=3D${TUNE_CCARGS_MFLOAT}' i=
f=20
(d.getVar('TUNE_CCARGS_MFLOAT') !=3D '')=C2=A0=C2=A0=C2=A0=C2=A0 else ''}"


There are condition that neon is not in TUNE_FEATURES, but vfp is in it.=
=20
so TUNE_CCARGS may append -mfloat-abi=3Dsoftfp,=C2=A0 then

simd module here can be compiled=C2=A0 sucessfully.

> It should also probably be conditional on the _arm
> over-ride since neon will be missing from
> TUNE_CCARGS_MFPU/TUNE_FEATURES for other architectures.Since big
> endian ARM doesn't use the _arm over-ride you will also need a
> duplicate line with the same logic with the _armeb override too. See
> the lines below which do the equivalent for _powerpc / _powerpc64 as a
> reference.
ok. thanks.

>
>>   # Provide a workaround if Altivec unit is not present in PPC
>>   EXTRA_OECMAKE_append_class-target_powerpc =3D " ${@bb.utils.contains(=
"TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=3DFalse", d)}"
>>   EXTRA_OECMAKE_append_class-target_powerpc64 =3D " ${@bb.utils.contain=
s("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=3DFalse", d)}"
>> --
>> 2.17.1
>>
>>
>>=20
>>
