Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.63.1632236198523228766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 07:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=p7qy+E0O;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4898cea026=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18LCOhXM009598
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 07:56:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=77WWASAl9mpkRgZbSpzbdeNlaxMOG4uKDIQraT/EmYA=;
 b=p7qy+E0OzbNh9Whh5yr3gUeiMgv9ymWWa2JB+LknLLDjAsUaUF8TDqfyzDAe8DhatlMa
 xdWJfJdSo4g2IBou4KtaSe/NwTlbWabRGWOZoWmWUHdxq2W2tozuuWkBj4DXixKqJDOx
 4m60H8b+e/WxD8nzMqdwtmEsoShydI7gccQq6XdeqsCRTPpLZRbZid7hOnj3wewY79Qd
 60FHxScDkKCNy+/vzfO5ETZc8VBLxI0zIM0TYlmTWd8xpxYMAToTQccXhOBH4yIz1WsQ
 AyXlbj27hYsAkm1GW/ee8Ut05seWLp5SkqgAcYzHYBzQZuAslYlVD3yKkdHY/BLEgikR gw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b790r0baw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 07:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qp4qw77LZr8efpKtdLGyQrKkuxjNUyJ58qj2DJsLqrPD2RzhtoZ1w8amuhI09YFZrlt1dTSBjJYTQLZdV68bCI3M55aZjTct7QHZDxzQ6rfLqV0yDBktXJ+ohHoBKmjzr21t6EmZosrpyKRY/jm37D2F4MU4yUiM5DDmoi4ANEXaeHt6pqSElCtEWN1Q0fRn/Qk3Wrj+v2UeHphMEumN6GGm74Jet/gXhZGy1gjQ8RivKChjFZ04Cvp399U1CAzLF+MI9lWFgVOxRaxQR9Fm1giqps/joTcTIn4KYTuBKH7sTpfJmW49gq4+tkAQW3A97eKQaw+68Ae8hSWOtKOPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=77WWASAl9mpkRgZbSpzbdeNlaxMOG4uKDIQraT/EmYA=;
 b=GVnZ5LANkjX5MYceygoUBJ5mW/NZeduhtdYCOx5SCX2foSA7lQ1oH2lbP7qEcs20ci622YTesqGy5CVev48xW4WJxjOh1SacylKzKjsh+ANdt4YGRqf/jgCBoIiR2Nk3wYIyvlWGHl+tcXYzmP4+MapV0faF0WJUif/erxuemitQmD5scEFWPhFHAcPgCgM5bSZc3bl7xHlWfwWo3E75wVZYjrmNcIzJIDap8v1JZa3JmLFWDo/FzaG30Y0L2/D3YWZVemiUVhg17KiOu1GlcBmzUmG7enwvK3th+LdZ05JN2i0ijgG8WwP6Dejpfs8mkz673rzdOX+ERqHuOfKX0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 21 Sep
 2021 14:56:36 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::dd97:8263:b218:28d9]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::dd97:8263:b218:28d9%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 14:56:36 +0000
Subject: Re: [OE-core] [RFC PATCH] package_ipk/deb/rpm: Drop recursive do_build task dependencies
To: openembedded-core@lists.openembedded.org
References: <20210919105735.1543088-1-richard.purdie@linuxfoundation.org>
 <CAJdd5GZAEFJZmLjRFadjF5s2zu_b-k3dftwaNanUAA-GvN9Bnw@mail.gmail.com>
 <5aa952a94df465a15b06479f0c95f9dfe7474e89.camel@linuxfoundation.org>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <e67b1c30-ae1f-0292-b42b-28cb7864bae7@windriver.com>
Date: Tue, 21 Sep 2021 07:56:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5aa952a94df465a15b06479f0c95f9dfe7474e89.camel@linuxfoundation.org>
X-ClientProxiedBy: MWHPR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:300:6c::17) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from [10.23.90.211] (71.238.119.71) by MWHPR04CA0055.namprd04.prod.outlook.com (2603:10b6:300:6c::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 14:56:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe7f0814-8df4-4af9-ca71-08d97d10027d
X-MS-TrafficTypeDiagnostic: CO1PR11MB5058:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB50588FB3422B8B105917ED17EEA19@CO1PR11MB5058.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kJDfWdbXTfVOT9FlKVBOOU4hKkE5mwREWqlyAPP5gUmg9pMCHlIjW+iez+jwAKQhv08ANbTgPtAuioD9hQC6gjsefv2hazEgFNVVrXytAZKWaTjL5MBwNgptVVMhGpUuBWcBDDlpIBu1gmazOb9Xte32Y8tNKeMcBKjPyT3vFZ6VBVfH2OZVAFlww+LeylkofjQHvIMKzTMcNiNwa8HhjL8IA7mW6Gtv2JQ1i3eO6pJiTJ+ti6MRACcQOumbVo9rsrwAlfVpPOhY91zCsZ+od0Q++QY+XUqI5HFvOPxGZSHKXGGOFK/zKG1nm1S9fQ9LtwnSR270nUMbYX8QqdHPBilmRECctBJ1VMgDZtmhu21LyS1395ruXMvzkmTmpOXRjI9cwXcurpyNgDqCMAlol9sHzYToBzga7/3tF6gf/RYATl6ZZfRgCZhstA+DbUKAgC143RtfX/l5Aa6a19FcqXU990Fp0U4BLbW6/SyvwViPwUtu9GdfY9l6YDdzcJpaJQM/aZVy2QtvdsUrFJ5/A1aGsyMd4LNak5UOSzcogHgD7LBKwP5sRcTJzNAYbHexaeR+CUbh/6Opyv02xj294ADQ7LpioOXzvuvLHbaa4g5iXHBLFJDqXEu2HL0Z+wQ99Q+H3NFrmyOPnvcIViZPAttx3m/1Fe+tjr/tosr8sFC2O2lIeWTjWQGXkbdgf7zhBoiJUSsvHmLhDw39I84x70gu1bjkq33IyqfSelclPf0t7JJJ6YYbOBT+evkgF493egAOrJdBOGltWxQTMa/pzXDDwtwA9l1rfCDzoLWNXvRnLv6xAOTWXyp1yoiEmzeygjX81BiMlr+9rRq0Kf3nVcOF15rUteny3uQ2tLMinP9SNHUExg3J7eR6dDlbeBAAd0EjJkSbooHJX7zbEAgqSGhxbGH/KoQR47hcweFtpQQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(956004)(316002)(31696002)(52116002)(26005)(53546011)(186003)(8936002)(6916009)(508600001)(31686004)(16576012)(86362001)(38100700002)(83380400001)(6486002)(38350700002)(36756003)(966005)(5660300002)(66556008)(66476007)(8676002)(2906002)(66946007)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OFJnNXorSFJTTmR3NnZoU3ZZWDlMd0Jmdk5EUWNmNDFYNVNLTG5JWEdadEVP?=
 =?utf-8?B?SXVLSVExWjRVeE1LT1pHYllWVXZPeGY3MW1rNEppTmEyTFhsOSs4QnowT0wy?=
 =?utf-8?B?bHFaT1pnTmNPMExuWjAzVUZUODZXcWpTQklQTUZqd0d1MndpR01kL0V3QnBs?=
 =?utf-8?B?RmlFZXlHaGR4Y3c1OGt2cXhOZi9aczB0QU1Nak5xV2duRTdaN0k5VGRGMzJR?=
 =?utf-8?B?SlFXR0FjeFJZeFU2SitvR1FLZk9TTzlqUTBmb1puL2N1OURleTNmU0FwYjZt?=
 =?utf-8?B?UE9ZWW42OGdoUVAzZ25KZXg2REFEekx3dzNxRXg2WDNic1R5NWhIRDg4aVlu?=
 =?utf-8?B?clI1YWZ4UnVlL0w2VkswdlJiMzN6ZE93ck15WFRFKzkwN3VLc1FKcEhrcHp3?=
 =?utf-8?B?VEZlQjF3VlFCM0RLcEh3Mk1Wd25aZ1ZUSy9IQjdEa1lSaUVYdlk2SzBJc1cy?=
 =?utf-8?B?NTZDWnlsNlB6aUNWS1Z0bVllVldmWXNxamErb2F2cFVHRE1PM1ZuT0FtT1Fx?=
 =?utf-8?B?azJOeEcwNG1nbVJWYW4zN0gyOGdKK3B1enBwTk1XNWZPUVhwQXkvSFltTkM4?=
 =?utf-8?B?OGJKdDVTa2hpaDkrNjZlYUZxb2RLWU4vWnRGZ0w5Z2d1QlIzRlI2aTRxUFRa?=
 =?utf-8?B?cGRpQWJ2QWFvTkpoVCs1YjgxbXliRXJ6YmNYak44b0VHd082cFRpMDJlVEIv?=
 =?utf-8?B?SkNSZi84blUydmx2c0hzRHZZcEQ1cXVTenZCRGkxN2hkUDQ4RERWaHllTWJI?=
 =?utf-8?B?OVFrczdtMm5zZlN4a1VlZTNFUUFKMzNUeENmaUJvOVZRUUVFTkNZOFFHN2Vj?=
 =?utf-8?B?djNYN3JOQ1RVdWxKL2hxV3cvQ3cwZU1tcHpueXc3TTNGT1NrMlNKQTJydmll?=
 =?utf-8?B?bEplMXpncWFhOTROYVdqTXNqVTV6TURYQVc5Wi9SR08rbE1OY1dwVXVuVmhN?=
 =?utf-8?B?OWdUQzVHYTNNYXdDa25UaTVJczBMMkxrS2plTVM5eU1GYVJrMmdrV1VKZ1lv?=
 =?utf-8?B?bldxQjVYczBPbFUydWVPeEhhY1VpZXNobEI5dmdIQm53NTRmRWxURW1sOVBi?=
 =?utf-8?B?allVRVM4S0VTQnEyRVkybnE0MEVIQk5qODMySEozaktLQ0hxQ05Ia0VUQ0Vn?=
 =?utf-8?B?WXN0SUpHWjhlTEVYc1NDNUZDNk9oRWo2dURsUGNqN3A1bU1Bb2N4blFYZzlQ?=
 =?utf-8?B?VWIyUnlSQnBaby91bk5RQ1R0blFnNUZFYTNDejZhRWRRSEtzNVViemRpYjlX?=
 =?utf-8?B?R0wzVVphcngzZ09Nc2U1V0hodk9VZWNBcnpXbnZLK0lVN3BTaDNpcko1S09s?=
 =?utf-8?B?SDZseE1XVHYzUzZ2YVpGLzVhOFdid1gra3l0YU1sbEMwekgwN2pmN2hKMEFY?=
 =?utf-8?B?T0s1SzRhUW9ON1diR2JLVWVaOXR0cHg1Q3N0Y1h2RXcyWm1Vc3ExL1c0bkpC?=
 =?utf-8?B?VVNlVXRVLytIc0JLUzhRcFVXZG05c3FUS3lzLzZ5MUV0dEZ4cG42NDN1TG11?=
 =?utf-8?B?ZUFtLzZxWjRJU1ExQnRBOFcxT1VHT09TelZMQlU3TmxhUHJ2SGtrU2t2bUp4?=
 =?utf-8?B?cmNTMWJGclFGR3hnc3NFdHp4ZmdvRU9zV1dUR21Mc2JzSklpQk1qZGYxYmlp?=
 =?utf-8?B?UjF3emlPMWI5NWtsVi9JdEJhSzVNcFNjczNNSUFhRGg0Mm1JcUlkcVZxbUlF?=
 =?utf-8?B?Z3lDZSt5dmlUNkc4TjNZd2d3Q0t5SVpMMm1hcllWUE9tb1VPb0pQcnlja28z?=
 =?utf-8?Q?MT3bUwrXnI7dJoHF4ACzNYFFKIjSac5iC3Mm6ZV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7f0814-8df4-4af9-ca71-08d97d10027d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 14:56:36.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8F98pJ9VEx+0Leh9plUdPKY0tN8BF8xQ+3RZspm5MfulcfhRlfKj+k9DWSjG8L3KzWW6NwTGFNwKjW0Y5L3Cug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
X-Proofpoint-GUID: u1a6aLYTE9owJ9sqQb3mW4znbEY2EM9D
X-Proofpoint-ORIG-GUID: u1a6aLYTE9owJ9sqQb3mW4znbEY2EM9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_04,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 mlxlogscore=829 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210092
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/20/21 6:54 AM, Richard Purdie wrote:
> On Mon, 2021-09-20 at 08:27 -0500, Joshua Watt wrote:
>> On Sun, Sep 19, 2021 at 5:57 AM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> This is a controversial change which removes the recursive dependencies
>>> from the do_build target of packaging tasks of recipes.
>>>
>>> Currently this means when you "bitbake <image>" or "bitbake <recipe>",
>>> the packaging tasks run for all packaging backends enabled for all recipes
>>> in the dependency chain. The same therefore then applies to images.
>>>
>>> We don't actually need that, it is a convinience thing. Removing it
>>> massively simplifies the task graph and causes much fewer tasks to execute
>>> in many common scenarios. It also means less sstate is fetched for
>>> example when building an image.
>>
>> Faster builds in the common cases seems like a great idea!
>>
>> If someone really needs the old behavior, is there a mechanism to do
>> the equivalent to what it was doing?
> 
> In this context, "bitbake XXX --runall build" would be equivalent to the current
> "bitbake XXX".
> 
This is good, since it can be used to catch packaging issues when not 
all packages formats are getting built.  Will this be the default for 
the Autobuilder?  That would ensure packaging issues are caught?

The --runall should be required for anyone doing updates to ensure that 
all package formats are being generated correctly for the update.

Sau!

> Cheers,
> 
> Richard
> 
> 
> 
> 
> 

-- 
Sau!
