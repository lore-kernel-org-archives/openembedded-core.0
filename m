Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6116.1631261135888521809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 01:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rbBH4xiv;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48872e2802=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18A6Zrj7016476
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 01:05:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ITby3wiKrVDxdTZMGaEsjVMTOGL8knbwMyFycF5lanc=;
 b=rbBH4xivBy3xiQdr88iU8HdrvVkgb96+lTvPrPtQ4bEjq0Edl6i967u2e3XzsHdI0zSe
 LrhPavmnTPDmgoMcGCDCDwpQMTAm/BVMG6QoN4xOEeY9YyvGXKa4hLAYupeQwsKIyoex
 j5Y6FOYkoqgHqbrvVQzxx3MtlYR2LvGWLEt5t87tfRJkD6mYx3Pyu9i3dNOzOSbNWUYV
 ESgHEhiSNgFMz1K/8v0RCzspQIjTAlfRUhC98nDL/7OFCSCOO2/8rcVbM2iftUjyIYEi
 DV1JPXEN6A8rS493qNWBngQgJBd32P3ctPtr1S/j5Q2yQPJOl54V+vMx8N4II9lVeAkc hA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aythyrb0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 01:05:35 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18A81GUi004758
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 01:05:34 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aythyrb09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Sep 2021 01:05:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XV3nScMlB+yjLSlgm9TlUMsfaz78gbvTMP7Re2MVfbaZQMR8LLSX5XGVkcSb1BLUP5/re6fD8SljW/gQqEg0okaLn9nZ5wqKQu/P8Wy3y4+8PulfShR3pyfV5GnHpfdZtHPzmDtQuYTSNRcP8+pF9M0It/lilEW1dwEvaoVhiuU1LsGfNeZY1bg83XngNsYvs9jONf13xC2+Hpua9v7ha8bdJHqzNfC1nOAYL2Eg8ebP0FS3en4c44qQyt9WkJMRVOVowz3x1HpEB8AjlqfbG0byWz6FIqnXINRi1TjmVDWIJj2auUpzweAgZjUtNIAzfNVOEgFljLP30G9ZTnFHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ITby3wiKrVDxdTZMGaEsjVMTOGL8knbwMyFycF5lanc=;
 b=Zq/v07F2k2N6/crIucv5CNsv1jGn6oqLKkD+oCcln6i4BeAdS8DxwZPmwM7KF4neDzpaVZXg0LxWWhodJq91INhYAZf9ykOUyAMNPNQL9jmusT6lXmswv4ZSaOEGVBhrjdqQeBSfbkwN4wGKpWc0iH1GzlGHw641gMFkbI5AOeU5G15h6TvgowJUaVXMpCN8eDLmKs06VEo2bMSCdRc4zpMD6VJd1Qi0bv6jHGq72mLebxzqlGh7PtkLUvxQaY6JfXKIywOY/d2cEElikMzxNUqK2BGaSktPH544tgE8N2an5WG0qERUe40j4ojxQLMhwPw+5oRZlhgRKOZ/Qyqfow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM6PR11MB4298.namprd11.prod.outlook.com (2603:10b6:5:204::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 10 Sep
 2021 08:05:31 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 08:05:31 +0000
Subject: Re: [OE-core] [PATCH 0/1] assimp: Remove it
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <cover.1631006167.git.liezhi.yang@windriver.com>
 <CAMKF1soGYd6t=1NaTTnD0482JOZWBx=M2HxDUnmHY8MX-j4aWw@mail.gmail.com>
 <5f2fa859-8638-118b-8c5a-d35a6d265a64@windriver.com>
 <CAMKF1srsvAGLdzp7hkz68uC7qWWzsgkM9ZacrJ+BTB69DTfc=Q@mail.gmail.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <bf771451-6557-3803-3664-36f7f463e708@windriver.com>
Date: Fri, 10 Sep 2021 16:05:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAMKF1srsvAGLdzp7hkz68uC7qWWzsgkM9ZacrJ+BTB69DTfc=Q@mail.gmail.com>
X-ClientProxiedBy: HKAPR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:d0::16) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from [128.224.162.198] (60.247.85.82) by HKAPR04CA0006.apcprd04.prod.outlook.com (2603:1096:203:d0::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 08:05:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8892c14a-fa5a-4b5c-f09b-08d97431c23f
X-MS-TrafficTypeDiagnostic: DM6PR11MB4298:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4298E8D9047573F2A19F8BD8FFD69@DM6PR11MB4298.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2zUEewsTMQx8YTr9RWQ/WGHmPPaLoszgCjeOTiljc+K6JKWqGYozM9eomr5AJSHuZnfG7ellZf1sifx8XePRovBL5kCi5fabRUDygP8kYyTG++3vGfG+Nv5msdW1tJiwEjf0rpK4Xw8uuguvBe8YTS1fbxycc2sdzxMj1bTRscJmlvw1T6oYdlpYrKa9tv82y4znBPV7DXSwME/aK+xLImSy93YXfNop8HgMqo+WtqJ8E5axBeYViE3tc6WZBNWTlbv6VOgqEZjdoBC/5UHwlsqms7BFJaqpVs13rIa+ODJpE42BLi73rSLG5gSEogdymfAHWpv3c2M2vbousouajU5qDOxIEaGC7/qXqk7WynEh2/DZ1K05ZfmWQE3yRBSHBh2eGowUtKFlEqh/3PhpJqjcqrE+9UVoPm4iYxEzGWQkGL4A0MuIOGi3Wu9RwPlFIKVtvF9TTDbHHHVJJkUXK+HsWoeBqbWhIT9bTtHM2omZuXy0qoMXCWlM52m7tl+8EdYWclK2HFQXhwoFThZrja9twRJRVYOqZYrmUYuGnN2jkINBW16VeY7wJE0vG4piPCko34NugWbMNT1v9S9YXdpraHnHq3E5PxBqvxRd7B1TRk3KxMum2Ypx9bx9vWqGbG9MwgEP0PYq5jvIqh0HR8eW/wpeW1kbs3oxn3H096u4JyTcjcsfJNSbJNBofToyu2dCBYAz2AaF+FwPPLCZDdSuzj3kfGcsbcgtl8j8BuoDGArLlMxZeCAdA07VgmC5HdP+ZrGEVCCdFoPQ+PcaCMpqA6YBLQDAk1mwtQMX0XRgWkHKv08e85OEBTG8meeWhTNInTitzqykfBik+YpesgRRmQeMVi4Jcew+v7Sdi8lEKEWnmaY17DxaQa7T+xiB9LY+MSfXxVlXk4/m8rOMuDPG9OzwrxHkTUX+22XJHm0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(6666004)(2906002)(316002)(66556008)(26005)(6916009)(16576012)(186003)(8936002)(66946007)(86362001)(8676002)(6706004)(83380400001)(36756003)(4326008)(6486002)(31686004)(5660300002)(52116002)(38350700002)(38100700002)(31696002)(2616005)(478600001)(956004)(53546011)(66476007)(966005)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2tsWmxmLzlyYXVXTTFYVGtvZHg5bHF5NnF0cnEvN0N5QVRtdnJoL3FDSVZM?=
 =?utf-8?B?elkyWjJOSStHRnhaTjhCeHJoV2xGenRiMUlBK01ZNkxaWG9CR3h3Q2F5TU9x?=
 =?utf-8?B?QVFCbndTNS8rTmNJK3RJOHBGRjIxOTBTVlFDOUZKakc1emxkOXlSZU9rdENw?=
 =?utf-8?B?eWtHTUJwajFLeDAyWitQQ1htWnZQdGpUSWxwanlOQk5XQ2NWT3RDaHRrUUNI?=
 =?utf-8?B?SkZKakNJN0R3KzRuTHBRL0k5MVVIWnY3UVJ0ZjRRZTVXNmFCL0liVGsvYjVX?=
 =?utf-8?B?YzlMM0pzK3JBbUJ1U3lyU2t3VFNHaWw4VTRaQUZTMUVjWk1OM3pqMjNHY3Av?=
 =?utf-8?B?VDhGYTJYTEJFOHhrdGZXMXRlejBDVEhLZ3hudndwS0tUYWVqY0UyU2tTb1Bx?=
 =?utf-8?B?NHVPZmJsRnRuWURTSUhTR2dwbEdNaG1LcUlONTZZbVZ3YTdKdkFxVmp0Z0R3?=
 =?utf-8?B?MkJ6WlZIVEJzTEEyVTY5OTk0WG1uUDdoNTUzQVFnUzVmc1V2cWhxWHZKRWNI?=
 =?utf-8?B?VG1OSWhLenF0T1IrTi9TbXFJUXphWTViWVBLMmZyRm8xdUZnYmpjODVLK0R2?=
 =?utf-8?B?aCtnRnZOUW5QV1c2V2NEWlJkSmhTVUhoM1N6SGc4WmRxcXIxQkNCMjJ1L3Z0?=
 =?utf-8?B?eldOWXQ3a2IzN2F5QTEwaklIUHNBcjEzUjlkcE1EemlLZFlqb0VieXQvTHNv?=
 =?utf-8?B?K1lKV092VG1ibGpnVlJOV01UVDVicVZRK3draTliYU4rRW85ZGpjNmluNUtw?=
 =?utf-8?B?MThTS2U3a1g5NjVjcUNxWlZQSU4waDIvQTNXT2tObU1yZ1QvL0Z0S3NVMVVD?=
 =?utf-8?B?ck1venpDUHd4dmM3QjZsQ3B6WVpkbVZ3bFk4dzJGZ3U0aGtGMDgvNTJVTEY4?=
 =?utf-8?B?MTkwTERkeEJsc2FyaVJxS3NPaWZXVXNlbnM2cm9MVE5lbCtlRWdxTkR6dHVs?=
 =?utf-8?B?cndMR3B6OExGUnRDcDdObU5zNUFGN2tscU1ka2JWSzNYM0FKQTQ5UEtOWGhq?=
 =?utf-8?B?Y2RoMTVqY1lGUzVyWWUxL0IvbTZ1Yks5cElGRVgzbFVMVWhGS0dBcFpLdWdv?=
 =?utf-8?B?c1VNZHF0WWYzOUp4R2x2RG1xdFplalZmM3BBUnQwaXZTSThycWtXdjZkelor?=
 =?utf-8?B?ZklLcDQ5VTlyU1k5M3B2cFlvZHJIeEg2UFlrOWtGNXd5QXFRajF0eitKaGVH?=
 =?utf-8?B?cjhmS1lYVXErbjFMU1h2dWVQdGpaY3RkY0RKMkZzd2UxNldabmFSRmU1MVdQ?=
 =?utf-8?B?eGhpaTh5d0RvRzVFcS9BRElYalF1Skp1SG5wZExNdTFWWWE1TG9PQ3dkV1Zj?=
 =?utf-8?B?YlBkRGtDZ1hrRlZ4R0thL3Nkd0VCTUxuaWdUZXNRU2xqM25zOVRFeEE1d0lh?=
 =?utf-8?B?NHQ0dHlCOG8rUi9hUnpYYnhGSGNpTlNrNklnczRnNDc0ZjY1bEV3T1dHejd1?=
 =?utf-8?B?NW9MZU4rd3JSd2FFcDYraU5RQ1h4OEtWZUdJdmV4ZDlDV0hoTGlLUnlrUG9E?=
 =?utf-8?B?ZFdpbFhncGl6ck5DbWlWQU1QNUMvVFF6Y05QcWhQLzg5TFEyRUcvdnBsSFZt?=
 =?utf-8?B?M3JNdXJJMTlCY3Z0OUVKcDFrci91WmtJdVA3Y1o5VU90N1psSmdrVWZDTE9K?=
 =?utf-8?B?VVUwNWIxRGZPTHRaU2tCQm9BRktINGVxeSs1bzdZbDJISE9EcmYvcHg5SWdt?=
 =?utf-8?B?Zi9EejVLSmUzQ1htRmJqN0hvcm5neVdXOUVzL2Zmd2oxTXFIdHhlVzJVZUx0?=
 =?utf-8?Q?7ofmO8EGWb3m/N56NbkfGP11+yU+VCKSCoNOvxa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8892c14a-fa5a-4b5c-f09b-08d97431c23f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 08:05:31.1642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLnBfVrbv/HZiBcStGEBJqCi0po8wuta1ptI32r4MU3yWjN/p/DvawMHwBOz52RmbpUW1Jg/Qyw+zg3DbJZGlk+ceHtSKd3fJlsaix2o2jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4298
X-Proofpoint-GUID: 9VcyuokcO_CzRMKVLKtJXKKwCqemOFom
X-Proofpoint-ORIG-GUID: rj97ZUuLKwhsjK2uKztoLfHb5xg2tDv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_02,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100050
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/9/21 11:43 PM, Khem Raj wrote:
> On Thu, Sep 9, 2021 at 3:26 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Hi Khem,
>>
>> On 9/9/21 1:06 PM, Khem Raj wrote:
>>> also delete meta/lib/oeqa/sdk/cases/assimp.py
>>
>> It's a test case for testing cmake, it should be OK to keep it? Or we need add a
>> new one to replace it.
> 
> is it downloading assimp code etc. ? if so I would suggest to replace
> it with something else too as a followup.

Yes, it does, I've sent a patch to use expat to replace assimp for the test.

// Robert

> 
>>
>> // Robert
>>
>>>
>>> On Tue, Sep 7, 2021 at 1:46 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>>>>
>>>> The following changes since commit 70de1dbb660461bdf0613494f53ec4c78738ae2a:
>>>>
>>>>     vim: Add packageconfig for sound notification support (2021-09-06 09:49:13 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     git://git.openembedded.org/openembedded-core-contrib rbt/assimp
>>>>     http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/assimp
>>>>
>>>> Robert Yang (1):
>>>>     assimp: Remove it
>>>>
>>>>    meta/conf/distro/include/maintainers.inc      |    1 -
>>>>    ...hared-lib-from-_IMPORT_CHECK_TARGETS.patch |   32 -
>>>>    ...hub.com-assimp-assimp-issues-2733-up.patch | 1664 -----------------
>>>>    .../use-GNUInstallDirs-where-possible.patch   |  257 ---
>>>>    meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |   26 -
>>>>    5 files changed, 1980 deletions(-)
>>>>    delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
>>>>    delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch
>>>>    delete mode 100644 meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
>>>>    delete mode 100644 meta/recipes-graphics/vulkan/assimp_5.0.1.bb
>>>>
>>>> --
>>>> 2.17.1
>>>>
>>>>
>>>> 
>>>>
