Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.24716.1629942225881583093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 18:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=mqY39dvt;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3872fe325b=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17Q1frXB031023
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 01:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=fyefGSYDE2+y5vV/IdpytvKgn5G4OyYYBXgQwI15uS0=;
 b=mqY39dvtS+GKDKud3q2r5uJXiqJTss+s6I0MGrp9cyUogaxDsxd6KwaQgzbk6rOZdKA5
 wr8KvnqLDbhu9W/6n+tLAdiZrYRTKZ9XZpjp1gMDZB11S9yHjuY6PO4fG2yFgaScROCq
 8p33UqRE2JLysTIGExOqCJY66oewe/WNmNYSeF9xdYMpL2WMEtB5tKjFndUgliK7YXn8
 3mAaurwVdIdxStRv052iFgyfyuOWygqi0ITKBpwDR+21Oy6xiV8Lp4KnQccryeK/VfRo
 Zr/wWmx36ddnqkFMNXNIdpU36IAQp/2XiPbRPq6UfYW7oCyDCblt/Houl3e80Lu0FegT Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3an90brynm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 01:43:44 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17Q1hiRR001700
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 01:43:44 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3an90brynk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Aug 2021 01:43:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LD849y/WUdMgKCzP9FZ9CCOSMYaRHsdnCdMYrkDtmAs1gKdLelRTW0Bc8LIu/A1r+4ZJMkMi8py4q76dYtoifh1m6qu+8GuP52CiHPObj6dPiIzmVud6MbwMHeaNWvyw5BuflEqkKbFNuTm6q5oeD/kns9Yx3RX9tjoVuL5MY043hNT1IzsszWN+GuTZ5bAeJrRFdwRlxrFgzK8QLvDtVoZ5iG0uiqAPvpoDnNQohDRdEHOOcLkxdC1+4hCL81h3JoXyiQoHAZ4Bv49nhz+u/l4mW+L70qcbKDuPRo6qko42dlh+KeO7zdR4IuBYZmZvjbM+42YTFUa8yCh9ckJsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyefGSYDE2+y5vV/IdpytvKgn5G4OyYYBXgQwI15uS0=;
 b=jp4+yOt8KUzgv2VpeJsg0yJiOV3IB9mtIq4chDfM70HfUSL1CdPv3djN0VSPIBJYtkVc9e1rEjLB9r/zA8lQc2bUsg3EjSiAE1jcmh694V4i0wiqcyQL1xkyVxBAq5oDls3wL3zHQUn3XirKmYDbAF8XkETReuxNeLi9fHhwl219JbV9DFts3ay+0Pl/BxflYW0Kn/KjlDsZd8PwJ/dnt/rGF/kvw4RTZ1vMyr4QYhA5TxRVDd7AQGvsdD4tlTIGcaFJPVfswJSOk5mB4g2HTBEOptlxxgysoABaUBTDjF9Gbq73bMGFDh3t0wGN2YHGqtCNkBtI5Kf/VfOP9JVzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Thu, 26 Aug
 2021 01:43:42 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::858b:a1a9:f762:f19f]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::858b:a1a9:f762:f19f%6]) with mapi id 15.20.4457.020; Thu, 26 Aug 2021
 01:43:42 +0000
Subject: Re: [OE-core] [PATCH] libcgroup: remove static pam library
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210825081054.40523-1-kai.kang@windriver.com>
 <d9124478-3ab8-26c8-75d5-e79cb3f17c9a@gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <15a69209-3aa7-e936-e842-16104ef51865@windriver.com>
Date: Thu, 26 Aug 2021 09:43:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <d9124478-3ab8-26c8-75d5-e79cb3f17c9a@gmail.com>
X-ClientProxiedBy: HK0PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:203:b0::29) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.151] (60.247.85.82) by HK0PR03CA0113.apcprd03.prod.outlook.com (2603:1096:203:b0::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 01:43:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4f31f54-e0a2-46d3-0a2b-08d96832ef13
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56517B1B4DB9D2C2AADEAE9595C79@CO6PR11MB5651.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0bWdt9OxZ0qyGKiGqL0zm1RmG3VRHDGrBaT9HKETkuNhfdJUFEqapqw9O5AY2z6vcEnVgkH42bfOvVWQpAPDGubI7NYC+W+sp4rZ3pRhYoBjiMlG5N6AWAV37Yj+SG7W0woNINp1YYLjUrZrsetMUzQ1tV9e0EoCeCztyY6/tiCi5Wxq7PIaHSbaadmRoDFZictv67Fg09jvfPv5iWcI5NkWcwbMcEsqv/ykT8gF4nEB2Qo9o/oAu+OvvCK61cA7GIKIruoKqav2i4rX6QKYpkKk46i/Ncm+nMDsHq4jspjXet4ii0NVLg2V9NIxWLKhoS/orwQdFUhZV6qkuqjEbfbjqyO/Z/aSG1M+Prr6rvedYAKQAmuWUH3sMuv8fopkm56XqnLwTtgsDJsHkXq0xqaxwV8mJd6yOE2SgicvcXB1ZoALX7kgPX6w5FpJeHF9u+HQdkRQYmnQeCbqMLkkM/iYpV8OPyE6R6cdzgXTotPTKv1Rk3tA75W9RuuZojITZADsTZULQiK7VTTCgiGOfW3p4xNNF7JQFk7mR19iPbu4PhXtJbZ+xwKT28yegD3ntQrJOHkXv7KFm6l/2Qvi/811D7LhVXOh0ORDuy6kc6WshmFx5N9u2uCfAVoFDd0/cu4QTBOaK5iC693psw6min2ChR2lJzZamHcohJ3KOvJi4UVuRGJQaXeA7pUyK0ZuK9+mvCM67yIm5f3O7hpUJsYg8R6NZtStZULY3afKI4Nvc3FrSXZyaq7NG2zgVGOhDl910ap+/DtEp14qMVk8Vd8pgypWqjr1pH8C0O7GOVIDkzOvuL4ZQrn+817xM3rLqEf1WPBoOPv+g3QJ+P2bQrG6NsqAAdgVE4VL13Y4Z6bHYbmFSDech24LalscVSds8p+F8ABu8g9kskEfOsS6iUUyG5llXi20/Lk8l7vFSOU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(16576012)(316002)(8676002)(6706004)(66556008)(5660300002)(66476007)(66946007)(6486002)(83380400001)(2906002)(478600001)(86362001)(52116002)(38350700002)(31686004)(31696002)(26005)(53546011)(186003)(36756003)(38100700002)(966005)(8936002)(956004)(6666004)(2616005)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?elVDT2xvTVJFaHlyeEpoWGQxSjVQd1FWdEo1R2p6ZlFPUUdjTWtQdjk2Kzlp?=
 =?utf-8?B?K2JWa1Z5cVJ2cWw5aGZpdlBveXBkeUdpbXozeUd0VysrU0NlYTRtNkp5NjZB?=
 =?utf-8?B?RU1LMlhxaEZ2Y3JZWDk1UU1zOHQ1dGNaQ1g3WmxsVWFlMzlJeEpDMTdFRVpw?=
 =?utf-8?B?K3FOaDgrbXJGZjlMd3h1TkVqRjNaZkFZR25VSElyb0Q2OWxEdUxhT2c1eXRi?=
 =?utf-8?B?Q0kvQXJUQWZPSkJhK0xGNzJSR2MyZlJFZHRSM2tYaWJDMHRDYXQwb1owdzNm?=
 =?utf-8?B?V0RCR2lJdjFyODhtV2RxOCt1SSt2Zm1NektsV0xieTVrSTVXbU1hYU1JcW5x?=
 =?utf-8?B?OUZFbS8rYkFSQlFScmUzWUN4cnM3Wk9CR2M4a3V3UGx4WG5mdHFhOEREeXNm?=
 =?utf-8?B?UjFpazVMY2hTc09TclREVitXYmZMTWpzaU1keElFeSt3WEt2OGxaM0YzQ2My?=
 =?utf-8?B?cjdONWVmdVZmMFU5eW1kUVFTL1haWExXa0VWaENBbHphTDY1NWhqQ1prM052?=
 =?utf-8?B?NzE2WHJRby96UFErbTk4elU3elh4cm5HQnFVd2NhVkxwd3ZBR3ZOTjJxMlFL?=
 =?utf-8?B?OHBKQWRiWHVKaThWYmxuQkxWeVRhRGpyL25QeWxkSTJBYlc2b1BzbUZZZjNQ?=
 =?utf-8?B?M3dnTFVYVElZRzhrTzlIbTNvSzEwNXB0VmF2OWRWREUzbkkwYjNaUU1PYUFO?=
 =?utf-8?B?aXJnVjMwUFdqbncvUEJheFBjV1ZLK2RNcWFFMHZVSk9xOUI5d1dPN0FISjVZ?=
 =?utf-8?B?Sm5jK3Y2UG02QTdrNWVMTUYrQm1mRkxHNjc2Rit6WFRoempTVnJ3N1gvWFcz?=
 =?utf-8?B?dVFDcE1hSXJGOFZIOXlnOEpnRVBBc1RmOWpNMmcyYmVRTFd6ZnNpd3AwQ0hQ?=
 =?utf-8?B?NFNoclJnUHRLZVloaElyWUJQSWNkMUlPcG5ka1MrbklSUVhyWjZIVjk1N0Iz?=
 =?utf-8?B?cWhrVXREOHpGa0IvR2NLYmtXU1VhRDNwVWxuMm5DaENhNlRFLzFsa3dQbWY4?=
 =?utf-8?B?TTFUZ0tNQ21uMVp5SjcxNWp5Q1IvZTQ1cXdhUTltbzhsUnA4dmFZN3hDWUNJ?=
 =?utf-8?B?VmY3bmFYMGp5cW9NNTlWNU9zTjZmNHF6TEl6SjB3dVl0WVNTaVZpdE9RK2M2?=
 =?utf-8?B?WWswN1hYWWlNQUhnRWZsRjh0dHRJNmQzeXlWTU1hc0FxclpkS3RRa284NWNX?=
 =?utf-8?B?VUNCV0xGUTNsTWJka3ZYWC9SQ2JmNkc0eVgrdi9uNVRIa0o2RDdnbTJWVzY5?=
 =?utf-8?B?Y29kVmRhQ3FZbGZTMk80b0lGb2pYM2tySTdBQ2tyMUdEaXhmeU05bjJTWXdT?=
 =?utf-8?B?MmM5dTB6OHNlSTlDeFFvYUJZOU0yQS9wOVhOaU5SS1FrdWpJZm1jYk53WlNj?=
 =?utf-8?B?ZTYrU09PaGhVOUczMEF2SWpVRURZanpvVXVFeDVVUFVINXh3SHg3Q0lvMWkv?=
 =?utf-8?B?YWhrUG9EVGJLUUxxTVZQTkZyUnZjL3N5TTJDSlBzSHZoWXVyNHFvbXRYaWp6?=
 =?utf-8?B?dGdkQTZKeW82Y2pTZllZZ0lYU25IYjR3RlY4R25ybVQwNjdZTjZuM0JQWmIx?=
 =?utf-8?B?TGZUbUlzT3JPMmR2cklxZkhrM0pYM1pkbTJucWFkMGdGbTVrUTFkU3VvNWdB?=
 =?utf-8?B?VEt6Uml1bmZPdWM1cGx3Q0VXM09rbERnVS9nK29HdmNQdEtwdWZoVmh2WTVw?=
 =?utf-8?B?NmMxSmVHVHNyTmo3cG9ZQzdpQ1F5UHhMczVnOFBITTQrYUlhWnVMbmJ4NG5s?=
 =?utf-8?Q?3Lq0Zyb2vfcSwTl55bDq9zTktVrLwEjDW12pPR6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f31f54-e0a2-46d3-0a2b-08d96832ef13
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 01:43:42.1756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Xn/W3A4sJncBikQ5PZhRbx23XhM4Wt6/jptBjp207bT93NZ/8ddczKg3innljPMYnyXF+QAVgsYtMXjsy8vSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5651
X-Proofpoint-ORIG-GUID: tUjUs8P2XTErwAanMBV1E3zHcPcTXI6o
X-Proofpoint-GUID: NA5SyeQeZbqhmybldHscmOPHwHSsEifX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_09,2021-08-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108260008
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17Q1frXB031023
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/25/21 11:35 PM, Khem Raj wrote:
>
>
> On 8/25/21 1:10 AM, kai wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> libpam disables static build by default, so remove static pam library of
>> libcgroup. Otherwise it complains QA issue:
>>
>> | ERROR: libcgroup-2.0-r0 do_package: QA Issue: libcgroup:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Files/directories=
 were installed but not shipped in any=20
>> package:
>> |=C2=A0 /lib/security/pam_cgroup.a
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> =C2=A0 meta/recipes-core/libcgroup/libcgroup_2.0.bb | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/libcgroup/libcgroup_2.0.bb=20
>> b/meta/recipes-core/libcgroup/libcgroup_2.0.bb
>> index bc0a75d46c..f48b8ece9b 100644
>> --- a/meta/recipes-core/libcgroup/libcgroup_2.0.bb
>> +++ b/meta/recipes-core/libcgroup/libcgroup_2.0.bb
>> @@ -31,4 +31,5 @@ FILES:${PN}-dev +=3D "${base_libdir}/security/*.la"
>> =C2=A0 do_install:append() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Until we ship the test suite, this libr=
ary isn't useful
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/libcgroupfortesting.*
>> +=C2=A0=C2=A0=C2=A0 rm -f ${D}${base_libdir}/security/pam_cgroup.a
>> =C2=A0 }
>>
>
> should this be simply packaged into FILES_${PN}-staticdev instead ?

OK. v2 will send.

Regards,
Kai

>
>>
>>
>>=20
>>

--=20
Kai Kang
Wind River Linux

