Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9105.1631094118798310054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 02:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nVC2ihGP;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48858bea65=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1887x0w5021790
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 02:41:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=E9q/vOZRkS5EEzK8DQDbFNIZHfw0p26QBgdoIYOkRaQ=;
 b=nVC2ihGPCG5hR/vYgBzC7E86THEiUTv7aSV5GPePk6cXBp+r0zM2iUVJNyDEBXIO4yp0
 OrbSVVtOTz9EK3ItJBMM7cC8Z38sTfcxQZWtPqDkZ/cr04qUWr8nWWaPJRQlxMWiRy8i
 nqCLgFK0ay0rdIglZoJgEscZRPGqTpqDKo1YcFUTCciA97Uv/VKdVmY1/1vbliP3+8HH
 QxJKehlvs6QOjThOnemt0EP5ogp3KxVWYaHAQirxtAoKRTmcC619mnP1o01gMPFEkNOO
 rNOYtkHKj5ze0dKMBVcYzPIyzbzQ83H3a8cbYFBkHQ3lgx8BMHwCo0zCvzqQ4L4TCJhP 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3axcms0fp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 02:41:58 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1889cHON017356
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 02:41:57 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 3axcms0fny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Sep 2021 02:41:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpJXcXqx1X++nqq0a8L7dxvTgnwabYwlNmjOycMD1P3ScljiXq9D9xJPrB07W2qPkGl+yiaihol0bFjCtEBPrrbuILEc8eSDVQ/+XXfc44Ok2vYRPlVK43jM8UUwagw39ojYlUPoVbSgxCWLKf/fgGWqDDV+R64e3tO8PZv6jBUUrSLpjB95qWQVQaPScxKNfX59JwnCPutBa1pk0zCTfWg78OkHaWcBJNRj9yD83vFgmZFq3HmbyDSTH85iKUWLnOfQdK9tAqahd9tkkcBxFS5Kc7BfU5TESrFf508pdvVDOZLvyGlNN6BRIRmKNDHjIXfLW8AJJ9g+LV+O9XnBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=E9q/vOZRkS5EEzK8DQDbFNIZHfw0p26QBgdoIYOkRaQ=;
 b=T0upB8Jzd+OoMAmNuwmmfpSAAjTAzWbq9eLBcgG7NqglNn+63NEM/5ZDvVhRjoRvioEkII7ncnqwpeF4a4LK26KB9hsBFAYKj2+hpNl3qpZlqTprIGgmEUQg5RV/A60UeV8ooDAWvcoitRgOkWS9/2LMy7idhxWjavgfeY4fWUcqlf06lilN94oR3R2qZ+ZkN/EO9n5+rRhynZgBcBC/flUASC2vCESCGNbJ7hHkDX2E7qWSfcFd74ddg6sW08i6OWLld6sYaTzgQnrrQBAdZT7WhgdERhSATUPMG3p14lxFC4dSr87aNjnM6mmdROmp/V69YSacFIs9FHq6MsWTug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM6PR11MB4300.namprd11.prod.outlook.com (2603:10b6:5:1dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 09:41:54 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432%5]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 09:41:54 +0000
Subject: Re: [OE-core] [PATCH 1/1] assimp: Remove it
To: Mikko.Rapeli@bmw.de
Cc: ross@burtonini.com, randy.macleod@windriver.com,
        openembedded-core@lists.openembedded.org
References: <cover.1631006167.git.liezhi.yang@windriver.com>
 <ed036834262a67e88a58001d20c719bed37d50f5.1631006167.git.liezhi.yang@windriver.com>
 <945b8038-97c7-1264-594f-e3b424695c22@windriver.com>
 <CAAnfSTsq2BtJb+PbEj=Yf0E8V=hs6DzDiv5YwRLaWkmd_w3dag@mail.gmail.com>
 <e13fb902-2edf-24f4-57c7-5c594d4a227e@windriver.com>
 <YTiDap4ahVzwW0op@korppu>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <0a90f0ca-2836-1a2d-5ff4-59363aab2e2e@windriver.com>
Date: Wed, 8 Sep 2021 17:41:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YTiDap4ahVzwW0op@korppu>
X-ClientProxiedBy: HKAPR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:203:d0::23) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from [128.224.162.198] (60.247.85.82) by HKAPR04CA0013.apcprd04.prod.outlook.com (2603:1096:203:d0::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 09:41:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a61ba18-f9d9-493e-c181-08d972ace4b3
X-MS-TrafficTypeDiagnostic: DM6PR11MB4300:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB43006CC5D46A5222D7F06CFCFFD49@DM6PR11MB4300.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y31ChpIbXgNGPSANURLjQQCTAWXJWUBXCbFpGpYLPFs9Zftmy1vHcGj02HGhhfPrF4eqQY82UkbmW9QWjGoNS8dHLY4QN5LLnXi61eWWUYoUQ2e81/G7tlMxVkJ7jeUNNdyEgLIPTPT/1Qe9ETiHhw735QavZru+i+JRvjUbvLy5xYVDKGvKK+mv0SAVouChxdwiJnwkDtLG0z2RhVIi6nbgX5J9aSQXazuUQinFX53Ez7PFHfgcZGBt7J0M+9ebt7isQ3+G66ECoEpM5UqJCT8VOYDLwoUjm0BM3j5diiQQWdNovgmIwnzSo4IwanZt7kNTFrh6030d+2UFwFkm11jFzm/l2pM+3DJ+w6QQ5c9s9cu58NT0WRQ3jUTaxRKH0IhlAHUwzPVIQSZ67IslIhoN+ZenpxPedcRg+VqnKO1kmuQNPkaZHZbZRYBH3KCgGP/Vl5MnDZsPkKEr2zXKZl3LwvjVT9bbLgnF5DPdDhbQLI5TxJtNpfXViO0IQ5AN2WmIbEU+RxtFW85+jeNkf9EyVY2pnG+0BoZLv3w8BTgWJpqY9m+4oStsK3THU6Deb3lKzuXxe5LJSZpeLrCxYYSboCjWXGpYhEDZzIsoslJ4Nx6SR6+ifxxsT8dYtsBcTQ1AAbM0ODBZXnJxy1M1ah4sWLDZj8a6KzC/MOG7VS7c8K+pJMHEvugBStin8KcZXL5mWU54/gilfinhJJ1WbZtdmRxoocVcH62JROqJkWXsXCrikc/DRS59rgOb1NxOXO7eylm6n3AYGj/gT9VMDv7VS7Cv4zIPZy6iWp02SAcuQo/rOnhR8pZip2Tyqd8JMZc/TdAboiSgDK9BYcMBjJBk4LgoaBsLmGVw8+C8KgCgnve4GZtzklySbrBqYVF4viP9e80+QOFBifxL634yw9BsgWAoBl14OrcHs2vuI6I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(136003)(396003)(346002)(31686004)(966005)(8936002)(6666004)(6486002)(52116002)(83380400001)(53546011)(316002)(36756003)(6916009)(186003)(31696002)(38350700002)(478600001)(38100700002)(2906002)(66946007)(2616005)(8676002)(66556008)(66476007)(956004)(5660300002)(86362001)(6706004)(16576012)(4326008)(26005)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aWZoUUswbE1NKzc5SGZNbEgvZ3lWZjNaY3J2SXh5b3JobjE2MGZJT1ZqYjBS?=
 =?utf-8?B?TWI0T1JIMjAvWVdLSE1jcXdBUXVZOWhmazZGMDk5S0NEMHJzbEhWMUlKdyth?=
 =?utf-8?B?dDBOd0dCRWtqajNMemhhWi8yQXZJRTJ1YVUwNG50ZllxSkxRVm02WVBUaWkx?=
 =?utf-8?B?c005VGhDczRyS1lVTmhjWjVWM2JGVDhXdUVBeTdOSlJFUWdMWTk5MTJ3MXNr?=
 =?utf-8?B?L3RMNU1ERXpFTU44UGY4T0x3VzBLNmg1VmVHMVBmRnlMVVlPUHJtSnBiZTlj?=
 =?utf-8?B?K1hGLys0c2ZNeFlzWnJrdDJPV3A3eS9PNXJ2WXFhVy9ZcjhxMVNrTzRRVitT?=
 =?utf-8?B?akVGTWtvVm1KaTQ3elJIelVIcGZDWWFOSWJDT3hneDdBRDkzeDMzUFg2blRN?=
 =?utf-8?B?NE9tYjlTekIyZ1RBazg3Q0c2V0E5UjE2YWpaSDVqSC9tWmhsc2NHTjk0M3NE?=
 =?utf-8?B?ODNqYkNqbVIzZW1oUFUzOWJsY2EvY2Z0NXdZaWRYUzFWUzZxWGtHTDFkUEhN?=
 =?utf-8?B?ZWY1bVN6YjZGbFU3TjhvVHBLd3hOZlA5ZWlydjR4SHhxc0puTGs0UjByeVF3?=
 =?utf-8?B?cDdocFkwMVdOU0tEZENjdFRNQ2x4Q1NLNmgvbTlsSXBGNUtrVXZlOWZFSWlL?=
 =?utf-8?B?MVJJelIxVDF6UWduK3NGMXFqK2R4SUNwdy9NQkZqUUlsUU5TR2x2bXlWYUJW?=
 =?utf-8?B?Sng5ZFVkL2JrZy9iUTBtR1J4dWE2QXF1WUtGb29pVDNyeW0wa1g0OXZVQUtl?=
 =?utf-8?B?OTdiUHdWRTA5UlFJWCt0OEVCZGRSVWhZNURWeERUYlhoaUd2aS9YRFpkTG1m?=
 =?utf-8?B?NFJvMVI0bnlmemZxcEk3TzBRUG9Ia3pGQjRzZm4zVVd4cmVmYXVGa2pBT3Ez?=
 =?utf-8?B?TkcyNE01cDcwMFNtM0QzT0hFRUIvNHFROG1kUjFvditGa0Zmd2FYV1V6aFB6?=
 =?utf-8?B?MEZucHpqeWlxajBtUnkxenE0Y2UzVUtNTU14VTIveDhKTHJjMUIxWk5FV1Fl?=
 =?utf-8?B?dW9nZnBIazBWUTRqdjl6TTNCVDVncEQwZ25UVHJqTmozdTdsdHh6b0dtaEl5?=
 =?utf-8?B?ZVloaC9KVVIyZHlKRlRNcFpneHFTWGpXOEJiQWtlelptUGk2cy9hZkI4aUpQ?=
 =?utf-8?B?eU00eU9ZSlIrR0ZlQlIybFRZaWwvTGVlRnZMc3Z4OU90MG03dVB5TThIWTla?=
 =?utf-8?B?TFlaNEV5Q2tUZkN5V29TK29OTHVhREdhZ1d3NGpjbzdaeUE2ZjVtejlueWhI?=
 =?utf-8?B?UEVFc2ZYMkJ3a3M5WG1aOUZhK0xTSXZnU25QanNJajd0cmxtdExndmhCU0JC?=
 =?utf-8?B?RXJUQzFITk9RNG04dGkvdVdqTGIya1R4dEQzdnZ1c3dOVlRMZ2pTYzJKNzlk?=
 =?utf-8?B?Z3pneG9VMFBwcTFXN0xWZXU2ZWJYS2hkaXk4QlpaM01Qb3lDUmpqbnFyQkNQ?=
 =?utf-8?B?Uno1RXJVaFFSMU05aXdCRWdVM3k1UDFNUXUrcklIRzJyNUZ6dmhLU2REZW5C?=
 =?utf-8?B?Z1hUN1phVnZrbEUwSkNNSnBGNCtocHZEL2FzdFpUTEpjc0M0R0Zsa0dZenBq?=
 =?utf-8?B?VDZCaVBKVlpKY1d0d1dvLzFnL3BDOUVTTG56NG5VQ3dWOGk1U0NiN1FuaHl3?=
 =?utf-8?B?WGVuTUs1dFVDQTlSRWw5bUl0bUpLTHdTQk1SYnRkSG4rQnNudnJTU0FXQkhW?=
 =?utf-8?B?Um1UL1MzS0x0RWNUZHIyWWR6R1M4aDYxWHJtTGZMcEhvM1J0QzVlRVBwaVdI?=
 =?utf-8?Q?qRaW0ZoGhK+ot3/tPMcrECLhSxJbmc4YqPj62NV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a61ba18-f9d9-493e-c181-08d972ace4b3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 09:41:54.8255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCs6ylZPl7S3ILzQYknE6DkeWOAgWhVkwFdDNnUjdW14BKnKUBWc1v1+lKGa3wg52AW+DJ2+tkKQ+3tApcNMkd3D0dQkitpvbFXYM7fJTfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4300
X-Proofpoint-GUID: 2F1DxpV5Dx81HzayEXmLVOWBfQtsq3e_
X-Proofpoint-ORIG-GUID: qbECIIQqUXBBR953Kn903xvd5b0fu2rB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_03,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080062
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/8/21 5:33 PM, Mikko.Rapeli@bmw.de wrote:
> Hi,
> 
> On Wed, Sep 08, 2021 at 04:55:35PM +0800, Robert Yang wrote:
>> On 9/7/21 8:10 PM, Ross Burton wrote:
>>> On Tue, 7 Sept 2021 at 13:04, Randy MacLeod <randy.macleod@windriver.com> wrote:
>>>> I'll look at the sections that you have pointed out later today.
>>>
>>> Debian is always worth looking at when there's license issues.
>>>
>>> https://salsa.debian.org/debian/assimp/-/blob/master/debian/README.source
>>>
>>> Specifically:
>>>
>>> https://salsa.debian.org/debian/assimp/-/blob/master/debian/README.source#L81
>>>
>>> They strip non-free components from the tarball before importing into
>>> their git repository.  We can delete the same files during the build
>>> so they don't get redistributed.
>>
>> According to the license, those non-free files can't be saved anywhere such
>> as the mirrors, I think that we need a special do_fetch command for assimp to
>> make those files won't be saved to DL_DIR or the mirror?
> 
> Maybe just use the Debian original tarball, and possible patches to fix issues
> in assimp?
> 
> That should be ok for all mirrors.

Yes, that's a good idea, thanks Debian.

// Robert

> 
> Cheers,
> 
> -Mikko
> 
