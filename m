Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CB7C25B74
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 00:52:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.72533.1717375968616822852
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 17:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=688488c23c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4530qmGe008111;
	Sun, 2 Jun 2024 17:52:48 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfxwys5vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 17:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mk9ltQMXTYu2ZidXNBwQ8YgJD6SzwmSZSq7cRftunZ7bpmmWQ/Qrw0LSMj9dHBdIwkN1K/RSBn4/3KyY7yzoYvY2voIut0qkOz6leXsj27tEwgZmDD/AEkScH+hIN6ebr6n4FKa+ctrRUCMmnaPF6ysqy2Rbm4nMv9ISdjTxQYiSY+EcWtxwrRZOFIjiONQHgAPdLk9owMVuYXyvY9iWDyCnXuIA6FmIIP5aO1ne+xwjewJ5mYhfTdG+TLTGGdiTF/l6K65XC8CW6QLo2scJearbKtCjiiR6z/NIh/m8Pvo1uLTl+BUETRT9lknDG8pSsBd+2PqYplJpsRQN7JyY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2z35Z37aNZJ2/sNLn2J+cDTzh+35WdCRmfAF2FFnoY=;
 b=YbPZhpv3DCgW//xp7NSKfREmPlNsskRlMeQa/m+LgM1N9eVkpObryMGj5CmPNnkVgscE5cTG1pyPH29ztPyk3J5FJFernPUe58RCPZfBuUpsCYzAbqpn9zQQmaLyUsDCdLWI6/B3rzGkScLuF53lLeU3Re2APo8ZvKybzItn29YZ7zzVmiUQP28xmOp+BQytziwYrNbOEplsiElNcbHduCpx/bj2zB04Dv8ZFTiRJX8daPz7H/f6x0Gf0fxYPynWnnMbtDIxlP7hbwaxt2q4GRrUbcteJmUDsrgX2RAVZPJxUSP+cIy/0T7T/IZ8Ipzafk+/KsdycQTI3vXfQWwvAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 00:52:31 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 00:52:31 +0000
Content-Type: multipart/alternative;
 boundary="------------DGs09qmrFqO4xlrv5rW0j0b8"
Message-ID: <ce18157d-6301-4976-9680-f5758f074a33@windriver.com>
Date: Mon, 3 Jun 2024 08:52:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] man-pages: upgrade 6.06 -> 6.8
To: openembedded-core@lists.openembedded.org
References: <20240527013705.2781009-1-changqing.li@windriver.com>
 <20240527013705.2781009-4-changqing.li@windriver.com>
 <2024060209512044239c59@mail.local>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <2024060209512044239c59@mail.local>
X-ClientProxiedBy: TYAPR01CA0136.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::28) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MN2PR11MB4567:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e9ca42-bf3c-4da0-b314-08dc83677317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UERhbjJMRFFmb2tKNUJ6RzZaRHl3Y3FJSk9VaXhxL2J1N1RQaWdRN1U0NC9P?=
 =?utf-8?B?OUVSdEs3dWlFZHEyWXlZMXU5b2xtVFFBUkNpTnd2bE81OGVVWWNVMWZmZWxz?=
 =?utf-8?B?Wm11U0pFK2R5WkI5TENYYnUyRmpYTXQzZ0FMZ3gyc05sM3RSVWZpNmQrZnlh?=
 =?utf-8?B?UU0vM25PUVNHeGdaMU1ESVAreCtmbkpEWGlFQ29mWWNrTHQralRnUUVpVjBz?=
 =?utf-8?B?am1ZdkRpaW44VE1YOEtGWFJmWTJvMCtqcVF2REhUL1dscHlsVEdsUzlienNr?=
 =?utf-8?B?UzFvb0JrL1l1SmtnNm1EbnAwNnpWYUJBaU9ZYUpjZ3MxeUdLbTVYVVpyODBy?=
 =?utf-8?B?RGwrcTJua3FPaElDZkZkNktnODlWK1NGYWxEVVphUUhHZC8wOEdhRlB6YU9w?=
 =?utf-8?B?V3JLSkpSVmJqKy9YcDV4R3hrWlVhYVN2R2dSQmVROGVwZTRTVzRjTG83U1o1?=
 =?utf-8?B?aWwrYkNTSkl5RnJURlZ0d1VLT3lDbUdjckw4MjgzTlV2RXJnNzdHM2d5Nkdo?=
 =?utf-8?B?Tm5BRFJGT1JxamVleGtiNHUrbnJTVkJUazVna0xmWWVYdmZsSmRDSUtwamor?=
 =?utf-8?B?WDY5Mi85REhrWFdGMmJvTFN5NktyRkFVZEJpckFEYmJjTXJpY2d3WDQraThB?=
 =?utf-8?B?WTV4RHhobFNVM21SSThPMklia1NKNTFlN0VYbFhnZHlZdkQwOExIa29KWnZI?=
 =?utf-8?B?VFpVeFFVTHZRRngyUTJzM3Z4Qys2VFlTVE9uTXpUY1NDbnlwNEI2TlVEdHNY?=
 =?utf-8?B?Y1prR1FkbGV0c3oyeFNXQ0ZyaTlsUzdWUytaNzJtZU15WHQyVDNnZVpIbTFQ?=
 =?utf-8?B?UHV2R00yUG1GQlg4bzdnR2Iyd0xXWDBwK0x2OElTa3BlT05pTHRhL3UyUG9G?=
 =?utf-8?B?RENpMXIyME5HMStxZHYwVEU1WWtLVzJqdFNlaUFPUW9JT3hmb0lzUHZpc05V?=
 =?utf-8?B?UHB5TzdwS2NEa2w1MUt5dUhvT2VWQWVsUkN5bkdOQjVrdDRkSWRvVmpmR0ZP?=
 =?utf-8?B?aHVodUZpcU5FVHc2M0I3ZFBsVm9wNVRMVVdjNGpTT1g1MGVVNldvSTlqek9z?=
 =?utf-8?B?b3k2a2M1RXgraHB5YjJ4N0M0Y3AwVlI5THZUcFMzYlVxUkpDRVlDbkFteU93?=
 =?utf-8?B?LzcyZGl1SjArUjdBNWhZcG5YakVpZ2dwMWsrNkxkTFVDbmp0b05ieVBpemZq?=
 =?utf-8?B?Rm1CQVh3Q205eHpabHdicFR3RnJIOU5XYWNzRlJWdmdyR05peE9CMjdUQzh4?=
 =?utf-8?B?R3VMemRuSGxKVW1SUURvRE1VcWlYVGdWYlN3dS9VMlRxblRZQlBJa2VFdUZ4?=
 =?utf-8?B?OGhUakREbEZTUW1IdTkrK3p1REtaY2MxZC9BSEswc2s5MnkyM0JzWDkzU2FX?=
 =?utf-8?B?UndKYU1ZTW1GWURNT1lqRm9WNUovSFE3VTFJNkUvL1JoS05PTU5SZzBlNUlK?=
 =?utf-8?B?ckJCOEt2MVFSRGJ6TnFPUWF6WmhuVHZxalFuQjJRaEw0U003QTlxSWJET3hG?=
 =?utf-8?B?azBRVlkwaG1PdlZ0a3NVNWhKOWNxSzRIcmpwV0NBZldSUWRycU9YWXgraVlF?=
 =?utf-8?B?NG1MVStCWmxmb2JzTGVNT1AzUVJWZWIvKytmSGtORkRHV1ZlWWQzLys5UTBJ?=
 =?utf-8?Q?jrgm4LOYgQ6W4Jq6MUPdXcPsNeULQdMOSddoPLWDrP1w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VTNWaXdjTUU1bitOVThVVDlZRkVFUWgybkhjdnZPTXA1Q0k0NytCWi9xM0I3?=
 =?utf-8?B?SUduNDhvdGFCN0llTkFTWE5uTDNqWlVkTWNjelVnRndEc3pvMmZRZENCQkta?=
 =?utf-8?B?UVdoK0p1VDlUZVJkODVmVzVXeDc1Sjd0aFRSUUFoN1VEY0d4L29NS1lOWExO?=
 =?utf-8?B?WXV1NGlaWmJZM3JRWFphQnNNenp2UmxGWFBCZFJsZ1h3ckJyajE5clJ2LzhE?=
 =?utf-8?B?czI1OEttOUp3TEZDOFQ5REcrZTVpZHViYWdUelhKdW9URE1YTVJnZDh1UjFQ?=
 =?utf-8?B?ZDBadlpJakJkd3dsSDRRd2MrNm5wKzZ3YUcxT1dSRTVFM1lsRHpCd2wvQldT?=
 =?utf-8?B?NXJ6cTh6UWFsQjFaRTBWS3V1b1ZBVHlmTERBay9tL0c4aGJRY2o1azlYVGhr?=
 =?utf-8?B?ZXRRcWRqZXBKWVkxellYSU1JV3lFUHBxVUVZTjdIV0oyWk9QS3pWTjB1aXcz?=
 =?utf-8?B?VlpOeFhvUTFBcDg4eHZiT2ZiVURGbGZhWUpGQWoyWmFKcUxHcWx5aUdrcXVo?=
 =?utf-8?B?MTl3Z3Z0azZnWHg0OGVETFRTRlNxcDZVOXN3akVsdUM4L1c0bi8zaVN4RmFW?=
 =?utf-8?B?OElyVmthUHozUnFOOFVoMVp3N1lhNUwvRzZLWFVpU3dpMEJ2d3I2dUdYQ3p5?=
 =?utf-8?B?SEhvTXJucEw0aTc0MktYUVN0Z3dVYkdjRllleXFNR3ErODJSMUk0dDUxNU1j?=
 =?utf-8?B?TWVCWXN5M3NteEhGQThUY1o2aDBPMmF2Sk0rdThQVUg5MTRpalY0QWRWeG5p?=
 =?utf-8?B?Ym5Za04zMlpTcExnNU90WlRVWm9sY29BYjhzYW40NTVHdjMwbFZmR0dpU1NX?=
 =?utf-8?B?TU0zQjZibVBteTM1NlQvcXo1VU5UWGFEclI2d1l6Y3JuaTdGWjQ1TkUvTlpO?=
 =?utf-8?B?NkdTdGpQdEVsSVdjaFpuZ2RieEc4bDV2enRDVXBWTnFhSm5uTmhmQTR5ekQ2?=
 =?utf-8?B?aDE3MWFNL0ZDK2RCL2VJUmlUY0V2YVFvTjRCczhlZVhTL2k1UmhGbE5INHRP?=
 =?utf-8?B?TWVXUG5kYjhLV0RadG1uZ0JQeWNMYk5wYjEwZFhYbmwyanFUTDIwK0hLZkpK?=
 =?utf-8?B?MjZvVjF1UjlOS3R1eExWcnlBOHBNSWdLMzJvRzMxMW5HZTJ1ZisrdGlFaGpV?=
 =?utf-8?B?MUNyM21oeDVZT2gxVzNoQjA0SHRHcFlMb3RYemJpR1RsVEdQaFRMVGhXMVd4?=
 =?utf-8?B?RDJnYVM2dkx1QVZHMlgvcnBoZFExZTAxb3g2c2lFeGh4TWIvcGRFaEw5amdm?=
 =?utf-8?B?WmdRZkQzM2k1Y3RGSDRNQjZiL2tmV1dDZDNPOUVqN2hBbGQ5aUtPbEVvR0E3?=
 =?utf-8?B?S0x3SlFXZnZhT0VuMlVwUERyNEV2TktvbktMNG5IUmM2cGpZRFFLelpoQlAy?=
 =?utf-8?B?TzNIQ1ZIL2Z3d0V1NkJzWUdRak84MlNLVUs4cktFQ2JNWjYyZklHMitscE10?=
 =?utf-8?B?YTcwT1pTbVN0NVBncUwzSzFuVlpLR0QvMjZJTG5PcWZRNWlwYkhoZlhxeHp0?=
 =?utf-8?B?dEo2L2hhby9PQnNqUFd1cEozTkcvdFBNNkFjbmMrWWtFVUZLS05NV1BoY0JK?=
 =?utf-8?B?R3htc3JscXJOMGFGZWpSK290ZHE4UHF6QTN2QzVlWDJ5TkY1U0N1R3hQN1VB?=
 =?utf-8?B?NkV2QWkvbSsvR2pLVlNZd2p0WGpJdHJDRGpXcGJaQk9kalhRNUlKUHJzY3ZE?=
 =?utf-8?B?WkVLNDFleDZnbGNiZFc2RWNGVEk5NTBwaHN1ZUV3RHZzUlUzai83NnNvV2VZ?=
 =?utf-8?B?QlE0aTF3WDVhVlR2VGgvT3FiU0xyNlRRU2tzUUw3MmptQlFKVnI0T2NTV25D?=
 =?utf-8?B?RkZuSzZyTVpSNmsrZ0hWWlNjUzFXMjVxK3ZCQ3NXOXdpeGtrS1BHTGxYOFdm?=
 =?utf-8?B?TVoyUWluY1ArbEhlV0VxVXdwZURFVVB6NzFkKzN2RGl5QVpoYTI3K1dmNGpw?=
 =?utf-8?B?MDJTcXBmTnpwWHJKZ1VFSlhPbmQyTDUvQzV2ODhkT1JQKzIyWUNYejY4Qmll?=
 =?utf-8?B?ZzlCVnArRG9ZeXd1dXpubmk0Y216Yklmd28vMFQrcjltdy80aUJFcUoxcTVq?=
 =?utf-8?B?NTFzNURaRmJCeTZVQlJOcytrckJlYnZ4TmNCdW52S2lMRS9xakZmSlAra2Yx?=
 =?utf-8?B?SXZxNy9yejZ3UXRtSFdESGVBVitNeWhrME9VUFhqeW5mL3JSUVo3ZzQ5VFIw?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e9ca42-bf3c-4da0-b314-08dc83677317
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 00:52:31.7673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKNTJf8z9BxQsPfoG38nW1rLOac5bynb4FrhKj/kv0CaPTO8ZeDdQKO0fsJ1T9D/lcxGNsgPodtTOu2HpGWszDlCoPo6WReQTdC6nmo8Hlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
X-Proofpoint-GUID: 01FXGymSEI1W2DBOUh88Cp37llJSL8on
X-Proofpoint-ORIG-GUID: 01FXGymSEI1W2DBOUh88Cp37llJSL8on
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2405170001 definitions=main-2406030006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 00:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200227

--------------DGs09qmrFqO4xlrv5rW0j0b8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4530qmGe008111


On 6/2/24 17:51, Alexandre Belloni via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 27/05/2024 09:37:05+0800, Changqing Li wrote:
>> diff --git a/meta/recipes-extended/man-pages/man-pages_6.06.bb b/meta/=
recipes-extended/man-pages/man-pages_6.8.bb
>> similarity index 84%
>> rename from meta/recipes-extended/man-pages/man-pages_6.06.bb
>> rename to meta/recipes-extended/man-pages/man-pages_6.8.bb
>> index 0f091bbd7d..fd19fa3b97 100644
>> --- a/meta/recipes-extended/man-pages/man-pages_6.06.bb
>> +++ b/meta/recipes-extended/man-pages/man-pages_6.8.bb
>> @@ -17,18 +17,12 @@ LIC_FILES_CHKSUM =3D"file://README;md5=3D72cff06b7=
954222c24d38bc2c41b234e \=20
>> file://LICENSES/Linux-man-pages-copyleft-var.txt;md5=3Dd33708712c59185=
21f47f23b0c4e0d20=20
>> \ file://LICENSES/MIT.txt;md5=3D7dda4e90ded66ab88b86f76169f28663 \ "
>> -SRC_URI =3D "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
>> -file://0001-man.ml-do-not-use-dev-stdin.patch  \
>> -file://0001-GNUmakefile-use-env-from-PATH.patch  \
>> -           "
>> +SRC_URI =3D "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
>>
>> -SRC_URI[sha256sum] =3D "006906e7be81a71c2d347809597bcb91485fa7fa488ac=
daa79e681ddfa894568"
>> +SRC_URI[sha256sum] =3D "f4d5b9756b4ee52e34ca9d895095c92312ced6292395b=
811e11069ab007e6f06"
>>
>>   inherit manpages
>>
>> -# can be dropped when ubuntu 18.04 is not in use anymore
>> -DEPENDS +=3D "coreutils-native"
>> -
> But we still have an ARM ubuntu 18.04 worker, will it still work?

No,=C2=A0 ubuntu18.04 still needs patch=20
0001-GNUmakefile-use-env-from-PATH.patch. Should we keep this patch for=20
not supported=C2=A0 host distro?

I can send a V2=C2=A0 and add this patch back if we still need this.

Regards

Changqing

>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200202):https://lists.openembedded.org/g/openembedd=
ed-core/message/200202
> Mute This Topic:https://lists.openembedded.org/mt/106323762/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------DGs09qmrFqO4xlrv5rW0j0b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/2/24 17:51, Alexandre Belloni via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2024060209512044239c59@mail.local">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 27/05/2024 09:37:05+0800, Changqing Li wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/meta/recipes-extended/man-pages/man-pages_6.06.bb b/meta/recipes-extended/man-pages/man-pages_6.8.bb
similarity index 84%
rename from meta/recipes-extended/man-pages/man-pages_6.06.bb
rename to meta/recipes-extended/man-pages/man-pages_6.8.bb
index 0f091bbd7d..fd19fa3b97 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.06.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.8.bb
@@ -17,18 +17,12 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README;md5=72cff06b7954222c24d38bc2c41b234e\file://LICENSES/Linux-man-pages-copyleft-var.txt;md5=d33708712c5918521f47f23b0c4e0d20\file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663\">&quot;file://README;md5=72cff06b7954222c24d38bc2c41b234e \
                     file://LICENSES/Linux-man-pages-copyleft-var.txt;md5=d33708712c5918521f47f23b0c4e0d20 \
                     file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663 \
                     &quot;</a>
-SRC_URI = &quot;${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
-           <a class="moz-txt-link-freetext" href="file://0001-man.ml-do-not-use-dev-stdin.patch">file://0001-man.ml-do-not-use-dev-stdin.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0001-GNUmakefile-use-env-from-PATH.patch">file://0001-GNUmakefile-use-env-from-PATH.patch</a> \
-           &quot;
+SRC_URI = &quot;${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz&quot;

-SRC_URI[sha256sum] = &quot;006906e7be81a71c2d347809597bcb91485fa7fa488acdaa79e681ddfa894568&quot;
+SRC_URI[sha256sum] = &quot;f4d5b9756b4ee52e34ca9d895095c92312ced6292395b811e11069ab007e6f06&quot;

 inherit manpages

-# can be dropped when ubuntu 18.04 is not in use anymore
-DEPENDS += &quot;coreutils-native&quot;
-
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
But we still have an ARM ubuntu 18.04 worker, will it still work?</pre>
    </blockquote>
    <p>No,&nbsp; ubuntu18.04 still needs patch&nbsp; <span style="white-space: pre-wrap">0001-GNUmakefile-use-env-from-PATH.patch</span>.&nbsp;
      Should we keep this patch for not supported&nbsp; host distro?</p>
    <p>I can send a V2&nbsp; and add this patch back if we still need this.</p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:2024060209512044239c59@mail.local">
      <pre class="moz-quote-pre" wrap="">


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#200202): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/200202">https://lists.openembedded.org/g/openembedded-core/message/200202</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106323762/3616873">https://lists.openembedded.org/mt/106323762/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------DGs09qmrFqO4xlrv5rW0j0b8--

