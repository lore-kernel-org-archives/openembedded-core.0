Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2322.1632432586163370498
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 14:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=arrhAdEt;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4900a564d0=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NLPuSt003877
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 14:29:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=1n9rAXSIR1DD5xKgjQnbl4H920/FZ8kUEvz6Jr1WdGY=;
 b=arrhAdEtrGi664m/2qDdiWZyoib9NbxkJP/o82p9gRzyb6bnYAlgCpS+VTdf4bvmCJqc
 jEFwKwoNcfdW6JVrL4deJubjhppB2zmg5v14AYw8GepPWq2+GuX8ZFtFJhos5Lp2583n
 U7vLztBF5BJG34F1hRW+VGsUzzd6FQkfk3ifAhuzEfjhuu/sdi8T2J+CL+Kcga5zpGgi
 ObYImvYueFkpoFLoiaCO433WKZbYp/aomtlB1XpwKVwfrrNaktBucuEpoRrl/+0767Hd
 BO4uGoU1x5ygQ3XKF8a9BhgWtqPCURjZDmT263uZoFshwqnq6HDVhwRCQe+HhIT9dbK+ Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b8h3a8tsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 14:29:45 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18NLSrZk006447
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 14:29:45 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b8h3a8tsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Sep 2021 14:29:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYC0cpzpiL4lMiaOiAiAxUI8l9BZOTgApadrbsEWR3IpC9AXXuge+Pmz2Qy3FX3skF4QsfD063cywIUMzMQ9sGpWBmlie9VfTYZc+hqTxEjQuZZAPoDu5ayflDTGQZm7HRCn7pF4oujczWMHMLAxBJYstOyyXRjNXIvUD8vf3X78zSf/hAAURVtr4VbAOrr2c3BgjAu/78xcQtjdxKqhMicg9T7YA+FabtjwEEztgvlskPa8ZXRUpt9m9bD45ZFF+VMukmQ59OFe4dD8vp6Zj1nPx3kWqXBEBenyC4mf2+WE2bDEKeAM763bCmb6swfp3PSGwm5fywM85/v+hJBrmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1n9rAXSIR1DD5xKgjQnbl4H920/FZ8kUEvz6Jr1WdGY=;
 b=Qo0TJ57Llj257+LeIE8vdVd95ciFCs1BRA0dnpWgYlFsHO16JuWQ/1TofRlFsL54CH/k0at+Zv+1CAAi1lW9HRfcXAPXglXR2SJWOZPyfB4f1GnFGPes8MlM+HEA72MHsE40ASiQdolc+RG8B5ojViZO4fNf8M+TrSl7gKx3X3FugY2/MYI6KPBeNioSBK5q6xpAopWHprXUUfg3Zhi++BOWPq0YLBKsb/hSGycredx/pUUCyCxOG45sMS7eE3hjTJ3QTqXoH39Z5HLyL/dWohyO7hhJrD8FZBpNH65Zx3mfr2JJsL/GYysNGqhfRSTri9rvEkdFGduB1W6b5OMRKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 21:29:42 +0000
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::e5b7:1e6c:e33e:3b52]) by SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::e5b7:1e6c:e33e:3b52%2]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 21:29:42 +0000
Subject: Re: [PATCH v2] create-spdx: Don't collect natives sources
To: Joshua Watt <jpewhacker@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20210923205328.2662727-1-saul.wold@windriver.com>
 <91fdbb39-dded-4c59-75de-4a8e223f370a@gmail.com>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <bd23a9da-94ad-4386-1460-8107b7be59ec@windriver.com>
Date: Thu, 23 Sep 2021 14:29:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <91fdbb39-dded-4c59-75de-4a8e223f370a@gmail.com>
X-ClientProxiedBy: MWHPR21CA0034.namprd21.prod.outlook.com
 (2603:10b6:300:129::20) To SJ0PR11MB5085.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::10)
MIME-Version: 1.0
Received: from [10.23.90.211] (71.238.119.71) by MWHPR21CA0034.namprd21.prod.outlook.com (2603:10b6:300:129::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.4 via Frontend Transport; Thu, 23 Sep 2021 21:29:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 545ff51e-451e-4e25-3e66-08d97ed94127
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2952E5D96933AEF29B0A75EEEEA39@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	san9wa/P7fa4w6J1IM2bt3MBmkCjXNfJuVgj7jJCtRqQKhFN1S1EDLxk2j1pCxWd0QObSbS4Cl6E3EAq2uDPRUsFngZfc40rON/BMzbudlJwGLWax6c7a/Pe0ZQdpRVKedzYzELGyz11b9Uqb5ZKjytqa1v5XXjpeXcFFF2QV30b8+rVlusEIDu94Z1tiIFkBGcVWiSBJHRRgK91sqLxPojx+sB5MmOaTrmt7Wmb/rQ1e3niUQ1twoSbtcwbqRDBxuBIG2lpK9xgLL4KHhR1K+eP60KdnMeAH+nhOPtCJ1HTuQP5QRhdNlEh6w5+y/khkVwXRgiAkbQ/frjzMR8XIiZ9DJYQQNdTHs/dYPIrQs9RuNlb4upeG9jkqHRpqX5d9uy8SEsel6k7aGyLq0WgM56Irba2/76x2QJw2+0X1AIIj6+I31zqH0QiVhiytjqFADhTyKWkjORxEta97Jae40o5F3ORBXwPZlVBCCfQ+hkRkHca5783X5xlNtUhkOYm2sCV3qsKokkBgxFAZn+oUvkSm1DE7Y8MNlpuaigjRlcN8v1GzklgSzj7hatvJI/4OkT+cbdqGWOfWBj/lr9klI/a/Dais1OltocyYDS8vZJ0B8MNFUtCs0aXVV6Ukq3P5hemz/YoZ4NHgWhzbrcu9y8+XTEgwCHkShbeuBoSv9ejZolfzHg5yX6xi5rEuEHVXgXWp0rxImJFUvh+mJnGb0dIviN5pOXJC1bM4GrfFKevkZdz3ifXtA/xcRP0KayoVdoaLRuag3LQounibn2nraRMjyPYM3H04N7YEmqQwFHnNziEC1k7ezsQzm3oETbBb1/F7NUsykZgWlSmD+xAeqRb2ghqu3s+EB9AGNFu+rI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5085.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6486002)(966005)(16576012)(86362001)(186003)(8676002)(53546011)(5660300002)(2906002)(36756003)(52116002)(31686004)(2616005)(83380400001)(956004)(38350700002)(38100700002)(66556008)(66946007)(26005)(31696002)(66476007)(508600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3ZLdzREakZHNndFSkM3NVN4WWdlaEFjRlE2aERNQ3FrSUdLSkNWSHdQeVlq?=
 =?utf-8?B?VmZHN3hsUUlMY0pCbnlUTmg2aHZ0c3d5aGtkRDRKakxjVGY2S3lLNHpraUhi?=
 =?utf-8?B?RWNDR25SU0IyUXRubzRXc0JKbmE4WExaOGp3UWhlaTYxamtWSnAwaEoxQWZo?=
 =?utf-8?B?Zitma3JxZ2ZtYUF1K3JvbWdpbWRqemVQQ09WTXM4ckxXenJMZkFNWG1XNWRG?=
 =?utf-8?B?eGR4MEJFVlpUcGcwNFBpQ3RoaEh4ekxreldhalB4WmdlU3FoNllIWXlDcWNh?=
 =?utf-8?B?NXZuZUMxSm9KdDYvS29nNW14RTJHWm1DSG1hREhaZnFDVUNURC9WckxQTlYz?=
 =?utf-8?B?ejY2K2VuRURzRWFTd2ZqWWtEd1lBVjFxVXBXRUJqa09aOEZLYVhKUlA1bmJa?=
 =?utf-8?B?Z2NnQnBtK0dvMFNTVy82UVQ1SjRoSDNBcXE3SXhaVWg0OEJCaXh3OXpLUVlN?=
 =?utf-8?B?QmhhN1RRNVkrN1BSNlJKL09Ib2djNWJVOVA5WS9TZHNRc2J4TzhrT1VhZGdV?=
 =?utf-8?B?N2NHVnNPeVV5VDdDbEhGeDJxNkNjcWhsYTNIRU4zdzJYZU5YbkZYQnllbm93?=
 =?utf-8?B?Nk1yWTZZUEVJRUlkditnNmRBcmVYWjdEZmdFWFpFZlJMOVg3T2hPZUYvOFNR?=
 =?utf-8?B?ZnQ1aHB4VS9taW8yNS9QaGNLM3BBTnczcjFSa0JSaERNaHd5OERjUlM1ZU93?=
 =?utf-8?B?OHEwYzJReVNkSThWVlRqVzNjMFU2ZmlkbG9UM2l5eThJSVNLenNrWDV5WHdu?=
 =?utf-8?B?Um5hUE5WWDIyT01FczZNb1lReEhVMSs2ZVFvU3dVdm1ERktSZFR5NDJGNSta?=
 =?utf-8?B?TnY3cDB5NnFuUVhNQm1PUkE0bGIya0ZhK3hIcm9rZWZkMjVESmxjZXdtb0hj?=
 =?utf-8?B?cDBlVFk4RlFmT3hqdUpSTEZYU0w3M3FZMGpBZitoeG1xU24weE42d3lHMWZi?=
 =?utf-8?B?SUVFdEwyYk5Cc3kzN1UvK3pER21wOXowME9vV1ZCVGhWRjBzZnVnMURKdFFv?=
 =?utf-8?B?Wml3MG8waWdKTEo5MGVJSHNhZGtLaERjRHA0Tk95SlZnUmhYM2JuZGtCLy9Y?=
 =?utf-8?B?cTltRkhjUTJocndDdVMra3lEK2hCbFZWRVdzUzlVYU03dHFoSDZ3djcyNFFD?=
 =?utf-8?B?TTg1dEZ2S09IUFA4ZWtoRmpoUVI5ZzRlOGtFaTFlLzVxakJyZGVVVThzcUph?=
 =?utf-8?B?UTJvRFAxZ2dyZUNPNTZzQ3UwSzEraHdISHhFWXY4a08xVDJmUDVTK2JYVHBv?=
 =?utf-8?B?NVI5OFJrUWdtbmh0TTFUUk03ZXFnSkxvVjZJdW0ySUVIU3BHLy9mK011bzE5?=
 =?utf-8?B?SHk4K0lQZ09SZVRUejQvbWhNNTVlVCtveXZscThacEsvZnpSOHVNYUd0cTN5?=
 =?utf-8?B?U2xXaHJnUHFQSkdpY3NCbnExZjFZQnFDc2FqbWRGN1FBdFJPRVJScXhoazg1?=
 =?utf-8?B?ZGZvTlVsbUZGd25JYjFWakM3bndENmdNR2NLNzJWVDJBUGNmOXh2T285Ymhx?=
 =?utf-8?B?NEVNNnJlTStQWU4xUmhwVHhyTTRyTklsWDk5eGNYRDFzRSt0NTRjbTVKTnFq?=
 =?utf-8?B?YVl3ZEJ0SUpodHI3UTdHcHB2bHhBdWo1ckFPQTRNYkFSc0lkQWs5THlRM0Mw?=
 =?utf-8?B?TnM0STNPL0tYMGIzZlZFZEtNcXF6Q2tiNXlucEVMMVBjVG1PdTR2c3lCK3hY?=
 =?utf-8?B?em54Zlk4NFZWazE4cDFWbWhIMDJrRllocitxS2R5YVJJVzZpRTZhWHlpdWQx?=
 =?utf-8?Q?SUG9tlsi0PiuQ/rMLOvaOYVZt1MsSQAqBUX5r5H?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545ff51e-451e-4e25-3e66-08d97ed94127
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5085.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 21:29:41.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHv5PHVdHLv++8FBhi+mh6s68odLAntjqxFsA2dTHpdRbVHw2OD259NHg/wRLpEl6qOHiFhH2xKG4qR9EFn0yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
X-Proofpoint-ORIG-GUID: RvDrrEWaP4nQm9XhmWKpdTNAE8u5PdwT
X-Proofpoint-GUID: DhYzhKTYvmHO6weXCGQhiMLUrFuRnJNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_06,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109200000
 definitions=main-2109230123
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 18NLPuSt003877
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/23/21 2:05 PM, Joshua Watt wrote:
>=20
> On 9/23/21 3:53 PM, Saul Wold wrote:
>> Extend the SPDXPackage to include is_native so it can be used later in
>> the processing.
>>
>> When the collect_dep_sources() runs, it collects sources from both nat=
ive
>> and non-native recipes. Later when the GENERATED_FROM matching occurs =
it
>> may find the file (via checksum) from the native recipe since it's the
>> same checksum as the target file. The that are generated DocumentRefs
>> point to the native recipe rather than the target recipe DocumentRef.
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>> =C2=A0 meta/classes/create-spdx.bbclass | 11 +++++++++--
>> =C2=A0 meta/lib/oe/spdx.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/create-spdx.bbclass=20
>> b/meta/classes/create-spdx.bbclass
>> index 3c73c21c04..e565f0bf6c 100644
>> --- a/meta/classes/create-spdx.bbclass
>> +++ b/meta/classes/create-spdx.bbclass
>> @@ -336,6 +336,10 @@ def collect_dep_sources(d, dep_recipes):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sources =3D {}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for dep in dep_recipes:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Don't collect sources fr=
om native recipes as they
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # match non-native sources=
 also.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if dep.recipe.is_native =3D=
=3D "True":
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
ntinue
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipe_files =3D=
 set(dep.recipe.hasFiles)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for spdx_file i=
n dep.doc.files:
>> @@ -382,7 +386,6 @@ python do_create_spdx() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 include_sources =3D d.getVar("SPDX_INCL=
UDE_SOURCES") =3D=3D "1"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 archive_sources =3D d.getVar("SPDX_ARCH=
IVE_SOURCES") =3D=3D "1"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 archive_packaged =3D d.getVar("SPDX_ARC=
HIVE_PACKAGED") =3D=3D "1"
>> -=C2=A0=C2=A0=C2=A0 is_native =3D bb.data.inherits_class("native", d)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 creation_time =3D=20
>> datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
>> @@ -401,6 +404,10 @@ python do_create_spdx() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipe.name =3D d.getVar("PN")
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipe.versionInfo =3D d.getVar("PV")
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipe.SPDXID =3D oe.sbom.get_recipe_sp=
dxid(d)
>> +=C2=A0=C2=A0=C2=A0 if bb.data.inherits_class("native", d):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipe.is_native =3D "True=
"
>> +=C2=A0=C2=A0=C2=A0 else:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipe.is_native =3D "Fals=
e"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for s in d.getVar('SRC_URI').split():
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not s.starts=
with("file://"):
>> @@ -480,7 +487,7 @@ python do_create_spdx() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sources =3D collect_dep_sources(d, dep_=
recipes)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 found_licenses =3D {license.name:recipe=
_ref.externalDocumentId +=20
>> ":" + license.licenseId for license in doc.hasExtractedLicensingInfos}
>> -=C2=A0=C2=A0=C2=A0 if not is_native:
>> +=C2=A0=C2=A0=C2=A0 if recipe.is_native is "False":
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.exec_f=
unc("read_subpackage_metadata", d)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgdest =3D Pat=
h(d.getVar("PKGDEST"))
>> diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
>> index 9814fbfd66..452148f339 100644
>> --- a/meta/lib/oe/spdx.py
>> +++ b/meta/lib/oe/spdx.py
>> @@ -164,6 +164,7 @@ class SPDXPackage(SPDXObject):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packageVerificationCode =3D _Object(SPD=
XPackageVerificationCode)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hasFiles =3D _StringList()
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packageFileName =3D _String()
>> +=C2=A0=C2=A0=C2=A0 is_native =3D _String()
>=20
> It's probably not well documented in this file, but this has to match t=
o=20
> the SPDX standard; we can't add arbitrary fields here. When I was=20
> referring to an "annotation" I was specifcially referring to an SPDX=20
> annotation:
>
I should have figured that!

> https://spdx.github.io/spdx-spec/8-annotations/
>=20
> We'd need to decide on some schema for encoding the data in the annotat=
ion
>=20
So we need to create an SPDXAnnotation type on spdx.py and define what=20
we want in the AnnotationComment field?

Sua!

>> =C2=A0 class SPDXFile(SPDXObject):

--=20
Sau!
