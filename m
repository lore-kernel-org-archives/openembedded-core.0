Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.16995.1629906562128820746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 08:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=PJo3a9Ms;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3871beaa7c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17PDcRmT013141
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 08:49:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=sNtQNxmi7AUwS+W0HowIvyNttVc6YSgN9sUIm0TaZUs=;
 b=PJo3a9Ms7ysem1TV5gZiryjjhFiC8O7/q1lkT/CPM+hb4zVGicG1t8FJUjRGyE1SlNtT
 ot+DfAxY+UizO6NAZ6HV8qGmMsvanXJ6l9A9JEMvIgS6KGJbabQSSMv06wF0IOro7IBd
 TEPI2whaciLeNuYHaBiY3kZOm9PbA7ftsJabgITL/5Xf1/oXyokoscfNjwscM6OnRMnA
 QUe6Jn7Ndae8zvQ+1aRSzSBqtb5hMzHzbOTGriktd/v8Euv/fIcwl1b+yRGg3q6gaDyf
 Sr0tqjLDe6JvvuKas+tENPBh0uqko75T3HNV+wPRWvXpKBIZzqP/n8pfMyBTaYoVMjxo zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3anpwkr35y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 08:49:21 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17PFnKRI032482
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 08:49:20 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 3anpwkr35w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Aug 2021 08:49:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgAsoVqAegzhpO2Rr0PznK6EMoE7iFxbgGlB1P1QgMy//GLVZ0dx7iHm4b0sesSaL9sYut98ysy3vUCoXUaPCpCwQUfFrYf+1zAJLS2o+0bVsmBKAREHLLBVk5NspmUuA4qzN8So8ycaHZGZDTgQfg3X902Tpxmg46ZxujPX1MQxHi+SksRkOod06BYDdrRFteKD9j1yygOYqxIb0Jz2/oqEPldNQmrl1SEe5R7odUI2W7mB6I0Q0PqDmvgzcxM95nnrADBNgwVoFYTVy+C0jodhOOMgXIz6YFxfzLmLA30qbYKXTCot22fJw9aWCaPvP834ivw4E67Bg+uUVlEIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNtQNxmi7AUwS+W0HowIvyNttVc6YSgN9sUIm0TaZUs=;
 b=YrUy8LmvPNAYaWPVF0wrPbC2NAlngEIdWtiOetQw7w848tSlkcqhwHlwPd1VhFujl1zabDcV6ZJ36l1ssdmZMnRrwYEq5dUYjDZJAgMq+GRqxkvL9aty0Lzjq004QUj5Q3wkVtvEbpraadgQbSOPDcc0LQLVtCiv9VntRu5HbsLnAU9EqMUgA1cQNvxqK0aQ5oa4Z3Cdt9QjRAdP6Mxl0WZL5qREcU4TbYwY5zYI09d0hlNEhiOQojilwVMsbQZUj5D/UYH+4rMYNHkyFV6Ubr401UGxVSbDsXXENJQ/xVQlKPBzXGf2dh6T708CUSaj1ZC6nqiJvMPNejuJSdGtqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 15:49:17 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 15:49:17 +0000
Subject: Re: [oe-core][hardknott][PATCH 1/1] icu: increase pkgdata command buffer size
To: "Slater, Joseph" <joe.slater@windriver.com>,
        "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20210823212944.159869-1-joe.slater@windriver.com>
 <6093d42eedfe1d8a6673f78d8ada092af5cc7c2e.camel@intel.com>
 <DM6PR11MB3993976A3B8D546FBD8207AD88C59@DM6PR11MB3993.namprd11.prod.outlook.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <898b438c-0c90-af41-78d4-9b7b938d40e3@windriver.com>
Date: Wed, 25 Aug 2021 11:49:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <DM6PR11MB3993976A3B8D546FBD8207AD88C59@DM6PR11MB3993.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.7] (198.48.226.187) by SJ0PR13CA0062.namprd13.prod.outlook.com (2603:10b6:a03:2c4::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.6 via Frontend Transport; Wed, 25 Aug 2021 15:49:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20d34265-86ac-4f5c-6113-08d967dfe574
X-MS-TrafficTypeDiagnostic: DM4PR11MB5296:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB529697A8054385087B6ABD61F8C69@DM4PR11MB5296.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T9wXOc+2nObnh4BB3BH0dTyXBqYas3myslboohSoD2DVRPxPjGNnGQMKs/wi4PzmukPH40p8U3Xq36CG+ciO4yMzZz+UqUExcPFWRxQW8jJGNO32wrGyOdySPrIJ1IL7R1YewPME/KTS2lhE4LL3mmmeSEKsLRCnTwxVMCOEpxN5WXYyf+uqMu7ui3/wEuaECX4SJfWrhg4OIoedob2K7igFhzzcG87174um54Flpf0vQm/WA9KilKYjTgB73Nkvli3ChFaPpcVpiPdbhCKRH+qIU+YDJF58VAh3KjKZ4gTJu2DygMyT3hD37y+fd+14mXAM4sYDNR4/MQG0/tlS52ZRYCc8Z4N9ocajKmRenJ/IwKozhV858S2sNepyrE6zSI3yqw0Ib/NweLNLNWGB141g5cHp8kEh/U1X28KYj/2G+ELFdfJ3hZ8JkWd5teOL3w6nTK5+wJ+vC0ISsKITC97jgQ78/u4mohyd6W4QYvqugOlPqkIQDo0BkBXT4IPam8R9GAGN77nOQHaiZYiFydWCdUOtYChDo/0XzF3SB/fgtpf+UNFt/hidcT9a7v8PFRvX8UtsArRYJGRnuHk6VX+ATh1ngM7TRdM4DL69AfeAT+l/wZYZtUvJ/YM+uGufYEw3wIxYj9s67+Adg6+D3hiv5yDcCAhpYwKj2M/1Rwiux3ST+B7No6oTJ1xrcA6u+RBeACbUjxQmFdQwE+xbdzHt4eAC1quEzk9on5WPOUtva+CZdN2zHi7qEsFvI/FU5ASlwsUeneFQpX/8qmMnRaBRmLh+NJjhwUSs/2LabWIeWpmtce4C6ZeLCpaR2L3TabFw5iB9kko/mB67nzK3SMM1VBKinCqd97IOAl2ScfBfylyTBxV4grlWXy+gquwAZJMsT5h/uKikzrqpzqwNrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(396003)(376002)(366004)(31686004)(316002)(52116002)(53546011)(8936002)(2616005)(16576012)(8676002)(956004)(38100700002)(2906002)(5660300002)(38350700002)(966005)(86362001)(6486002)(478600001)(83380400001)(26005)(110136005)(6666004)(36756003)(66476007)(66556008)(186003)(31696002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YmhIcHNOOGxZcUNscW9MOGMzQm5MRXF6Zkh0cndHbDlwdktuMmdZWnd3T3Za?=
 =?utf-8?B?WnE2SURUbEMrVG9SNThMZ1BEWnE4ZHcrVzk1WC82dzlmc2hFMkJEckEwTEEr?=
 =?utf-8?B?dUhjKzZZZmVycURiVXhhQW9LcXNZKy9GWEpkVVNoellkUEc4VjlXTVR4Q2Nj?=
 =?utf-8?B?V1dBczhDN3NhR3BLWUI2YVRxNlowQkw0U0VaTURhQ3k2K01nSXhKeStwWk03?=
 =?utf-8?B?UHJrRUxGUkZoWlB1b3lpMkpUZkthRDAzMGdlRXJZZVYrbkF6RENTVERvYWtH?=
 =?utf-8?B?NHNDdDVnWW12M3ZNbzN4SXp2NWJLbWhHbDh4ZjZmNU9wcXlkWkNpbEh1ZUJ1?=
 =?utf-8?B?a0FaV2N4ZHMxaDEyZ216WlY2TDRpendQNGIvYzluSFA4Y2lFSGw4ZGVLK1du?=
 =?utf-8?B?QmRCV0VyQVovbXJnZnQ1RXUzUEhORmg0S0NJQTBNTTRTMGVlUzVIOHBROG10?=
 =?utf-8?B?TUVsYU1Xc1R1U1RzVWMvVEJCdnlRMzNwV2k0Y0xEZlRqUWlOWW5EWjFoS3Ji?=
 =?utf-8?B?YW1oK2xkVzN4REdaaGR2eUtPUVZ0THJTVHlIcU9CL2hvTmpZZ1VOZ24xZGpp?=
 =?utf-8?B?WEt4ZStCY2pqN09IdU1rQTlZYWc0b2hnb0RxWWJHRFVwc1YxK0dKeWNneVRH?=
 =?utf-8?B?bnhuVzlWYjJMWEhZZ2wvK2diUWVYL2NpV3dXYnVsLzlmRWJSeFNyd1ZtNWpl?=
 =?utf-8?B?RGdUcTZRbTdVSytLTzZCN3NDdkJ5blZxaVljYlNqNXM1OHk5KzBUdXhqMTJH?=
 =?utf-8?B?U056RVJBem1VRndkNEpWU0lkVE5OdjE3RWdqc05Va0VwNFBwNlNMWnEwRDBW?=
 =?utf-8?B?RkNBaC9iV3dIR29Cck5Ja0FnZnc2MitpVHhwT3pWMG9hQkI4YnprN0dLblJs?=
 =?utf-8?B?L3F2d244Vy9Sekd4OXEwV3lkR3RVTW9ManZNNXZ4OVUrNEh2T0lpeUF1elQx?=
 =?utf-8?B?ZmVMdmQvckh6Ukc3YmFFT2VIZHp2VHdaV0FKRW5IbHUzbUVjT0pNTCtHdkxC?=
 =?utf-8?B?NFE0c296SUdSQkhlcnVVNk02c3VjYWl1MWptdC8xL1RsbHlKUk1zZllLOWJK?=
 =?utf-8?B?MkN1dE5mN0pEajVObGRPUXVaSjFOVEg4dDJPMThEZllIQzI3YnBYRmhlajRS?=
 =?utf-8?B?UlJFV3A3U05yWUF3dE80Yk9vblFDUjBldmh4RVpIQjhxYWJnUGRLTlByc1JM?=
 =?utf-8?B?RUJtKzNXM3RZTnh4dy9zaXRYVnBJNmlVeWNaaUlZcU9qVlRpZ2NwdFhFaVVn?=
 =?utf-8?B?eXVGUGhBMS9uRzlocEFwMzdrVlVFTTVYN0JBMWpHNms3eFZzdDllSEhYb1hi?=
 =?utf-8?B?RUxWdlBtTFA4UFpiNktMNFBEbDVydTlaUFQ4UGhUczB5QytkR09FMUpMUzJs?=
 =?utf-8?B?QkFsSVVqdGsyemVkNno1eDhVOEJsUWxVNVNzbGhoSFpNOUhLK2k1WWVvYWJq?=
 =?utf-8?B?SFhMZm9MRXp6R0NkTXllNEY3RWZucEt5ajBkYjdjRWlXN0dsQzQzVW5RaTRC?=
 =?utf-8?B?SllieVA3eERkeENNR3k2ZXFEOGFoY1gxQ1pWQVd6WTI2SU9DbEQrazloUU1N?=
 =?utf-8?B?VEpFK0dFTUZDMGZOdHVsRERZOCtGeGRaS0RxWE04cm92c1B1WEE2Q0orQUg4?=
 =?utf-8?B?di9UK2tYd3pPS0l3MWgyTU0yTVlQcWxtS2JpbXh2QkQwU0FLZnVxNElWc0Uz?=
 =?utf-8?B?R3YyeHp0bDNBamhvallQVHBmeTJVYWJVWHR2amVnSnpaRFozTnB5c2RHL3RU?=
 =?utf-8?Q?PaEJ8z0qU2q9o9yQf2KxgllylPQ6U9pOP7UZDiw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d34265-86ac-4f5c-6113-08d967dfe574
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:49:17.5452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flTq4fXrZO0p2eBuPzcuz3NCmF+jDfIqoqmeJ53JXlr8frbp7/zHf/jcOtFDpHEwtfvqejF9g96XEgPyyEcU8L5yyTRZKtkqJm+5AzdUVXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
X-Proofpoint-GUID: YEIffnXpp1MeIyHaTh4Bfy-RNT04KRkK
X-Proofpoint-ORIG-GUID: 95TJvPYZx85iuRyVpZ6NUIaEPMRZeWah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_06,2021-08-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108250094
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17PDcRmT013141
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-08-24 1:01 p.m., Slater, Joseph wrote:
> https://unicode-org.atlassian.net/browse/ICU-21702 has been accepted.  My=
 patch just mitigates the problem but does not take care of issues around l=
ack of error reporting.
>
> Joe


That's good. Can you update the patch to include that link
and pick a different Upstream-Status:=C2=A0 such as "Submitted"

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Hea=
der_Recommendations:_Upstream-Status

so that when we eventually update we know where to check if the
change was made.

Thanks,

../Randy

>
>> -----Original Message-----
>> From: Mittal, Anuj <anuj.mittal@intel.com>
>> Sent: Monday, August 23, 2021 9:04 PM
>> To: Slater, Joseph <joe.slater@windriver.com>; openembedded-
>> core@lists.openembedded.org
>> Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>
>> Subject: Re: [oe-core][hardknott][PATCH 1/1] icu: increase pkgdata comma=
nd
>> buffer size
>>
>> Hi Joe,
>>
>> On Mon, 2021-08-23 at 14:29 -0700, Joe Slater wrote:
>>> Mitigate pathname truncation when installing in a project with a very
>>> long pathname.=C2=A0 The patch is on the master branch, but they have m=
oved
>>> to a later version of icu so we cannot cherry-pick.
>>>
>>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>>> ---
>>>  =C2=A0...pkgdata-increase-command-buffer-size.patch | 43
>>> +++++++++++++++++++
>>>  =C2=A0meta/recipes-support/icu/icu_68.2.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>  =C2=A02 files changed, 44 insertions(+)
>>>  =C2=A0create mode 100644
>>> meta/recipes-support/icu/icu/0001-pkgdata-increase-
>>> command-buffer-size.patch
>>>
>>> diff --git a/meta/recipes-support/icu/icu/0001-pkgdata-increase-
>>> command-buffer-size.patch b/meta/recipes-support/icu/icu/0001-pkgdata-
>>> increase-command-buffer-size.patch
>>> new file mode 100644
>>> index 0000000000..ea68e4be9f
>>> --- /dev/null
>>> +++ b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-
>>> buffer-size.patch
>>> @@ -0,0 +1,43 @@
>>> +From ab6b1acdeed76899f8227c38ab7e7675c7673ff1 Mon Sep 17 00:00:00
>>> +2001
>>> +From: Joe Slater <joe.slater@windriver.com>
>>> +Date: Thu, 5 Aug 2021 09:23:48 -0700
>>> +Subject: [PATCH 1/1] pkgdata: increase command buffer size
>>> +
>>> +Make cmd LARGE_BUFFER_SIZE to avoid pathname truncation when install
>>> +paths are longer than about 150 characters.
>>> +
>>> +Upstream-Status: Pending
>> I think there was a comment from Alex on the original patch for master
>> requesting this be sent upstream first. Can you do that please?
>>
>> Thanks,
>>
>> Anuj
>>
>>> +
>>> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
>>> +---
>>> + source/tools/pkgdata/pkgdata.cpp | 6 +++---
>>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>>> +
>>> +diff --git a/source/tools/pkgdata/pkgdata.cpp
>>> b/source/tools/pkgdata/pkgdata.cpp
>>> +index 5ab682e..d4b70ef 100644
>>> +--- a/tools/pkgdata/pkgdata.cpp
>>> ++++ b/tools/pkgdata/pkgdata.cpp
>>> +@@ -1131,17 +1131,17 @@ normal_symlink_mode:
>>> +
>>> + static int32_t pkg_installLibrary(const char *installDir, const char
>>> *targetDir, UBool noVersion) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int32_t result =3D 0;
>>> +-=C2=A0=C2=A0=C2=A0 char cmd[SMALL_BUFFER_MAX_SIZE];
>>> ++=C2=A0=C2=A0=C2=A0 char cmd[LARGE_BUFFER_MAX_SIZE];
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 auto ret =3D snprintf(cmd,
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SM=
ALL_BUFFER_MAX_SIZE,
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LA=
RGE_BUFFER_MAX_SIZE,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "cd %s && %s %s %s%s%s",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 targetDir,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pkgDataFlags[INSTALL_CMD],
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libFileNames[LIB_FILE_VERSION],
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 installDir, PKGDATA_FILE_SEP_STRING,
>>> libFileNames[LIB_FILE_VERSION]);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 (void)ret;
>>> +-=C2=A0=C2=A0=C2=A0 U_ASSERT(0 <=3D ret && ret < SMALL_BUFFER_MAX_SIZE=
);
>>> ++=C2=A0=C2=A0=C2=A0 U_ASSERT(0 <=3D ret && ret < LARGE_BUFFER_MAX_SIZE=
);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 result =3D runCommand(cmd);
>>> +
>>> +--
>>> +2.29.2
>>> +
>>> diff --git a/meta/recipes-support/icu/icu_68.2.bb b/meta/recipes-
>>> support/icu/icu_68.2.bb index 1ca87feee4..130212d245 100644
>>> --- a/meta/recipes-support/icu/icu_68.2.bb
>>> +++ b/meta/recipes-support/icu/icu_68.2.bb
>>> @@ -107,6 +107,7 @@ SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://filter.json=C2=A0\
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://fix-install-manx.patch=C2=A0\
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://0001-icu-Added-armeb-support.patch=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
01-pkgdata-increase-command-buffer-size.patch=C2=A0\
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>>
>>>  =C2=A0SRC_URI_append_class-target =3D "\
>>>
>>>=20
>>>

--=20
# Randy MacLeod
# Wind River Linux

