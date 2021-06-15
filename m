Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.5858.1623738351992526696
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 23:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IRxGXJfx;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1800207bcf=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15F6GPSr001063
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 06:25:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3967n98kb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 06:25:49 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15F6Pnqq015646
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 06:25:49 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3967n98kb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jun 2021 06:25:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IY/3m1XTgLf76rWoHLBvLIdL1HJZSpnw1nwr8MlDqV1EhU2UgatODkQiSpnCxe2Uq3dpz6GAJq5kNWiCqr/zznvjpi5jgO+rv3MnxUueV6ZoODej/SR3D2rQD4pINC/ILx/dn4HXd8Qh1ijpZ2DZNluYOHFwMpLCbqbN8EjL5FB+QBAhNY/4fj9/14EmzSoHYQzvW0GIHtTPQcG9q/zqbgU6VyIT8KoxXkzHnc5LRJ+2UBI2XwSz3qd/tZFfzgrybdeW/36EZELaXZcEK6x9Axmn8y0LpfQTexxc0wZM5lmcjUj/vu0lqaZuRWdmfQIETKOGXIt8OgFln9bwZIAHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABqgmhA1/xHneJ2ROI+tGM7hvu2B74Q4OzWyAOwyTFw=;
 b=ahxg4jWSBoyHHTwfpWVhvIrq/ie5Z5m9ZR7cq512Hug1WZz8dkqYewsx35MQiMAIek0nr+O+jGF36cTYmM8G3mBwf94TVrl3OE2DiL0IA6PfDdzjT2nZKdgopgi5BdfjvG3VAo777snuBkXEQNLvuNc3Oir1tRF4f6mXQNBA3fXT7mb/wWkRHk6s+ArJJqaOXpDaoLUhAdfatC8G2GEk3NGgEolRSEaC1dhH2YvKv66S42kc3thdG9Cl+i+B92/eZZ8kFc/WlBXtC1/9PraH9Ozk3E9HnVaUOPox4GWleTKn+46ycrwXVCl+7XHn+2fT5KCCqdbLJp9G3QTYoFliIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABqgmhA1/xHneJ2ROI+tGM7hvu2B74Q4OzWyAOwyTFw=;
 b=IRxGXJfx0OAv0K+eWBtRd3vl2umhhQ7XGAQ1krwd+nEIwtf2joSPTtc4qJtsa+nkIYoZnTGMVA4vljzkJoHuZgDmmIYJ+ennT1QOAQGsEFhM67xC1FaSO7N4q5zNcI+/Gioz1aYBrO0Ecq+hnGcYDAU7BdLHltq8x6TqDEaEJBY=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR1101MB2280.namprd11.prod.outlook.com (2603:10b6:910:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 06:25:46 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::3da3:9e4a:b2a7:cfda]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::3da3:9e4a:b2a7:cfda%5]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 06:25:46 +0000
Subject: Re: [OE-core] [PATCH] ffmpeg: link in libatomic on 32-bit mips
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20210615035404.10376-1-kai.kang@windriver.com>
 <CAJ86T=UpWm8YM0S0tcBoTFBaG+bWqZxCNc5LB4o1jKz-qv8_-g@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <13b2588b-d174-292e-fedd-69ab68e594e8@windriver.com>
Date: Tue, 15 Jun 2021 14:25:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <CAJ86T=UpWm8YM0S0tcBoTFBaG+bWqZxCNc5LB4o1jKz-qv8_-g@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0157.apcprd02.prod.outlook.com
 (2603:1096:201:1f::17) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.151] (60.247.85.82) by HK2PR02CA0157.apcprd02.prod.outlook.com (2603:1096:201:1f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 06:25:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fb48ed1-0f58-4bec-6da6-08d92fc66901
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB22803664EC302A4132A9CCAD95309@CY4PR1101MB2280.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8zb+KvS6byftFetqrYekrcVXiHKkqP4xMipSVb0bRR/5mAVXMb+RiDJG8cgLWaI3abGoVhVUlsPwzgX3OshYE0Cg74ve+QmZl244rPz8cPK4wnLcsI/Cm45tCwGNQdO35J4pOkZfpfnnmUlADhcZ1bkV+RK6El5fxYv2vgDVoLVLcf9ewCSr/LCfWj+JHCbSmk2z1Mre5VRH72E06wmEU9qA3tNyNiL8JM7Sz9Q4L7oFiCN6/83CwhanqOmYZc17DMmqKseAD3Ha+yibCfi9IhaJ4oBcT19Y+UEKtBARL/3iYIBjNyHURnXU/ERzE2sSADR2Cv1aL2fIN9tTLGyk5Hl7X+yYhLhB7Vg8Pq/cyqT6GWB0AbPdDMY2gww4go2+Do+G+fY0plp24zz7EMNnfCMTUWwD/l1y1HV38Zgkq0lx0JZ1MG0Mh7/Lfy9NG4LgSN2QIh9v1XTh5qgBhVuhqzc9MytGwaOKCm5volKJBlN8/1wKkAZ1EBJwDweyKAct6OsuFa27P4WEJ/2Ky+Du9SwDCbyAQFaEnZmTp5nSsXfSzD8nuSrozynlll0yDy70pdD4ZiR8C5MxFZgP0GDGkcJd+EIYSYM6fMaOW4BcJNtgLFj42D+DRN2YhiuUAAGGnFLS6ql40JenUi0g3YshqqBXZR4Nm6RQK1w70qyrmLK9QxaLYUXg/WFgcz7g4xO2Ejd09FqMyIYvfzgFShCNXRb1444kHiS/nQxeXCoOPGOZZOiZAzdSfe20SUcAHZgi7Qd9w7NAw+7NHTi7v6Cx3KuDqxc70reoVmZqPWwIyqIPSRI5n1tkhp6EAMhp3s59vOBaNHsxTS+lsoKNQknRfA4TpxQNZoiyO+iMkK2uNVYjJA7FWKFl8j/jVJZiaphp5RXciwjI5ghXyH25FNiQCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39840400004)(396003)(366004)(346002)(4326008)(2906002)(6486002)(8676002)(31696002)(38100700002)(6706004)(2616005)(6666004)(26005)(478600001)(186003)(38350700002)(5660300002)(956004)(16526019)(53546011)(86362001)(6916009)(8936002)(966005)(52116002)(36756003)(316002)(16576012)(31686004)(66946007)(66556008)(66476007)(83380400001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SXRzdkFGayt4bUJ1Z0xkVXRsSFRybHJPZGpzMUlHOVRkbjMzMFZYTWlISDls?=
 =?utf-8?B?QzBZaHJ1ODdYeUlYTm9va3h6azdUWDZwd0U4MUYydzR0Mjk0RWxsYUdsZk9E?=
 =?utf-8?B?RlEzZkhmaFNzTFVCdURDaWxpTHBnMU4rSjFhNThMeUFHSm9KU09yVWp1T0Ju?=
 =?utf-8?B?RHNGWHdpdWdYWmxLQWRSUVl2L2UvYkQwTHpvN2gvZmJyZFFWQWNnMEFWZEF2?=
 =?utf-8?B?WkhEV0FtMW9xV202clRFWDYzaStEdUpOWnBPUXZmVUpkbkZNSlJUTU5XSDdP?=
 =?utf-8?B?Rlc5QVN6Y3hZZXVkeVpzY2ZyT0tZYWwrTWdjN24xczNkR0cxZm0wQlQzVGha?=
 =?utf-8?B?YUhGZUFnSUZOaS8zQy96QWlQZjMyVjlHbXV4SWRMNXkyL0NHaHFkQVFuZVZ0?=
 =?utf-8?B?dDhlcXN1TlEzWFg4SVNUV21JVmtVcGdrV0IwczNSQUFWNkFtdXNKMklDT2xD?=
 =?utf-8?B?c3Z6UnFvZzZjdHZWaG9uNkM1VlBLWUYrbitDbWJvK3ZWeEFnL0pTVG1HT0E2?=
 =?utf-8?B?RFhVSjR1bGhxYTdSRGtYR3VreHllS2VwUzlwMFh0WmxkcVlQY3NTcFVEYU1G?=
 =?utf-8?B?VjdmeEFmbVd2WVZmYWhoM3oyUkJCekJJWmM0aVVzaG9mNG56OTJvOEdzVTFS?=
 =?utf-8?B?QlZPa2lrbllOUDBOakZzUmllYnBnWHZHWC9BYUhhWXFSN3BNTzRHTGNpc3hO?=
 =?utf-8?B?cVBhVzBLanp6d09qWHV3N01nUFZweDZCU1Qya0w1QW1pMmxSRURCNVoyZHR0?=
 =?utf-8?B?NVJLRksydDZnWnY3NUUwbHhnbFVPbXpHeWZGNW1La0Vzc2ljaEh4U2M1dTAx?=
 =?utf-8?B?cHp3a1oxZWNoTXVyTmdIQnNwdXVTT3JUK1MvbWg1SFhLV1ZQUFlhNThiWHBU?=
 =?utf-8?B?cm55VUJ4SENqWlJjdDJ0L3duTVdRd3BlOTFNWFVFNm51MG91RnNuSm9XY2p0?=
 =?utf-8?B?VjErQ2ppZ0U1OTJnTmpMbkpFSm1rZmpNdVhFNDF0WGdLc0JWajIzMW1PTkVG?=
 =?utf-8?B?ZmwySUpzSmoySGsvN2RSZnZHeXdVWlRxaVJJUjNzWnF1MTVwQnlIM3RmbkQr?=
 =?utf-8?B?VmlhZitMZVcyc1F2SENDa2FVYW5YWUcxelR3Y3Q3MWhXaWxWTGZjUGdTVis3?=
 =?utf-8?B?NWRGc3FMT0NiR0pHU2ovQlV3Wjh4a2NRc01xS214Mjd1cXpWZE9zRVRyUlF1?=
 =?utf-8?B?ZGVRL1p2UjdUN3BTRmQ0NUJVdkw5UEZEVjc4azFoK0Z2VGxGcTFXY1ZJY1lp?=
 =?utf-8?B?T2pyaWx4Rk45QUttREV4Y3Y4dzhWSHM4MFZWQWlxMk0zeWZ4MmpYc1lmaGM5?=
 =?utf-8?B?SDJhNHNsNnc3dXJUdnpIR3dGdy9qaUppSHdMUnpieGlzMFA5dGJtVDc1cXNL?=
 =?utf-8?B?SkM1T2k4YTRjQmllcWRKWENvUjg2dTB3cXcveHJTMjl1VUlhYS9sVXJUN1Rn?=
 =?utf-8?B?ZzdzS1FWamgzME1xUGVmbUJCdHM5SGxpYmtibTVsNGUreTJxU0o1N2dMaFNx?=
 =?utf-8?B?MFNDaERGcmI5VGFGZkFQc0d2RVl2a2hyR29Fc3NCNmFoWC9TbExGU0pHT2JF?=
 =?utf-8?B?dWVpb0ExdlR4T01kd0lLS1drYnoxaFJ3b3I0cm9rT3RwYm5vcE4yUHJ5WnpH?=
 =?utf-8?B?d3I4UHFXdjN4TVVLcHdRZlFodW5SSWVtQnFWS2VuaEJ4Qi82NXc4QklzdDJL?=
 =?utf-8?B?Z0cxQlRMVzhjQTVxelluaVoyR21ZbU44WW1mOFpDNi85WE9XdXlCTzd2Ym8x?=
 =?utf-8?Q?flKG3HQMGfQ9oN3eeQIxpYLxs7rFTuXTDVBenqh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb48ed1-0f58-4bec-6da6-08d92fc66901
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 06:25:46.4735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqRidu+0iWw6Lzvg63G0GKsIuO4UaCEBBQLLC14FIwgAiGdvzO2XoEyYuUYFMu1IeaQQlAov1F7Etzh/5SzE3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2280
X-Proofpoint-ORIG-GUID: YuzsWxKvmRYfr2jMqPLeSQyPl3kdKSCb
X-Proofpoint-GUID: EG9LzNCDNANN-MEq-PkGjyNr6pb03oV_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-15_04:2021-06-14,2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150037
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 6/15/21 2:22 PM, Andre McCurdy wrote:
> On Mon, Jun 14, 2021 at 8:54 PM kai <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It needs some functions from libatomic on 32-bit mips too:
>>
>> | libavformat/libavformat.so: undefined reference to `__atomic_fetch_sub_8'
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
>> index 3ed009bbb7..f3097f8ebf 100644
>> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
>> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
>> @@ -130,6 +130,7 @@ EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r6', '--disable-mi
>>   EXTRA_OECONF_append_mips = " --extra-libs=-latomic --disable-mips32r5 --disable-mipsdsp --disable-mipsdspr2 \
>>                                --disable-loongson2 --disable-loongson3 --disable-mmi --disable-msa --disable-msa2"
>>   EXTRA_OECONF_append_riscv32 = " --extra-libs=-latomic"
>> +EXTRA_OECONF_append_powerpc = " --extra-libs=-latomic"
> Subject mentions mips, not powerpc.

Oooops. v2 will be sent. Many thanks.

Kai

>
>>   # gold crashes on x86, another solution is to --disable-asm but thats more hacky
>>   # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
>> --
>> 2.17.1
>>
>>
>> 
>>

-- 
Kai Kang
Wind River Linux

