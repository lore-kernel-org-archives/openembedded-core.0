Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.80])
 by mx.groups.io with SMTP id smtpd.web09.7822.1615737223023919728
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 08:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mMSVRrVT;
 spf=pass (domain: windriver.com, ip: 40.107.70.80, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkJqoXV2qgRds1v+jQ79X0pR3UQAiGWUM8ti0IPLqx3qNP8vtu4r9yn3BBk4/++SU4Z8UwV29Gmv+/8d15KnRUqIJoLVjZMqsLNXsJ1CnsoXmD9D+PlX1wwb0fAdXQY8ajqh+AK2Y09a1VU7jFmQdNjP4tyHaIQqtNCFbzIau44hUc5Fjw3L5pdj9Db7IFtSmDAwFxTP6wik3VLn7gYQWpUSl0JoC4JN4fZosmsA82wYLEEq2tN4k3+B1OVLsXrKPZPd9NojFkAwCO/2S+oinkZbh4gxEGx3TIFsSM75S8J8ec4FdFWBou0qBHVz2+MRmH7HlWCycdEr9lkCFgif8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvqESHuRk11cKA5oTEBJlV21ArFJESwQXVYFTobsbr0=;
 b=SxI4KNNprPPzja1k02+3vOytRAh4XQHpknt6bcEAWxvcaXQgYL11/jl0+ycDbRDFPNYYSSvH14YOlsX1ERwMI4RQ7YVo1G212FLHcchH7STWxxKLgbtOE90k2WYXaCL93F4jBY8gqRPG8ko+yOlz7iwIqvM+vopFNiFh8Uwo7fkLkkK42I4cZZtLNptl47/KGZhdERrAarEvkhVdL8yv8FF+idF7+bhgiM2Pk38XAhDRG2H3pSnRI/3XGxHghSTTsTYItwFCm/8D4tQW3+fUohohcpcQAWGW4+iS8gvl6fOwKPH3ylZICtGnivdvGJdAqgZ84ylnpLqF4hSBeTRUjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvqESHuRk11cKA5oTEBJlV21ArFJESwQXVYFTobsbr0=;
 b=mMSVRrVTzhAKAfotA9h4lY88d5EeKnpSLwxIsI0bxQfgX1yyG/e/9C7utjUI3gSIlcXBc6aWFOcChHia2i/qphdSTMCjib9JJhzrxM0HVR/pVUngX7ntuwPwiBTMzleGuLuCE3jO7Mlmp8jkgeu42qb0JD1RlmyEmqgaLQHB334=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3196.namprd11.prod.outlook.com (2603:10b6:5:5b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 15:53:40 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 15:53:40 +0000
Subject: Re: [OE-core] Gstreamer
To: manoun92@gmail.com, openembedded-core@lists.openembedded.org
References: <JR2X.1615680903774027513.CgiZ@lists.openembedded.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <faf97fd0-5d5c-d30b-6871-4d2b7d2ed93a@windriver.com>
Date: Sun, 14 Mar 2021 11:53:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <JR2X.1615680903774027513.CgiZ@lists.openembedded.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::23) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:a03:33a::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sun, 14 Mar 2021 15:53:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2fc8294-3aa4-48c7-5925-08d8e701561f
X-MS-TrafficTypeDiagnostic: DM6PR11MB3196:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3196CF8F59222D8D57BDD603F86D9@DM6PR11MB3196.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z7uPuBOouQDuBUswTgUJpw9aCRelN7LWOLawLmKV5yRCAjVZnhhzmiDJH8LM4PoBpr5qz9g+VPvvW8veApEOaKul5UnGdhWgiJdqj8tELvZbcmffmb1450oIogte8v0iK0uiqJLdrLha0V3a7qKlXIjJnpi8CS/Z6K6p4BTVP+aJbiNMt6Ko5613Tw8RqO++/o3cNIn0M7TeZutE2bL364mGtklbMMDgbrkS+xTAt4ePtLuOhPxY5ErhsavGNKl72MLNsbCuvdjvAIP8YRJoLbFLjram25t1YMi3GODk9nl7nNzj6BbIzY/03Nhjhhuabeny9DvqcNLFCPO+tcZ5bt5r0coXxyxyFEJfehP7C4t8RXue90OAjdDASZf8mkCaupnDuC5yCFxVbqP1oLvXIbicunrkQmZ6hqK8l0wopUQ5vOeqlKEjezVg7py/8IV2VXUFEkft8ZO+eWljuZxUV4H7KHb9BePZHSudzn0F5/XVTPuIDBH8Azts3+/t+G0nSnPgpe0sTsPn9rKD9x4qHxXYXVZw0b3PjLjnI9wNO7wjoDkqeeCyn+RribZ/HO3fhtj78AS3kUdJcVjRUOol97xHkZKE2qpkZAkStHZwIzbFNRka0jz2V2kXgObAxgOemK1Nfa+UF4Zq5l+2Hzawj58ACpkABDUGhY95azYTI6fTg9pc3OJAQGUR6nnemiVXykxwq2fK9EqQbFQwyeZrjzU51MsuHsc96dVu2Cv6WTw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(346002)(136003)(376002)(396003)(366004)(52116002)(53546011)(5660300002)(83380400001)(86362001)(186003)(16526019)(66556008)(2616005)(6666004)(31696002)(956004)(966005)(31686004)(2906002)(8676002)(36756003)(4744005)(478600001)(16576012)(8936002)(6486002)(316002)(66946007)(26005)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SVNCTUJWOGxYZG9YNUorV2JoV09FdXhJZFZFdW5acUNCTnBNYXZBOGp6SThZ?=
 =?utf-8?B?WlJWV25GYmdUTm9tRmRRRnVITkxWR3NBQnF0dnE3dmV4TlBxVnJrUTRURjZC?=
 =?utf-8?B?V082ZGViS0JLYjVxOVpUMnZ4M3R0YWVBUUVCRFhjWVBOYTFNTU1MMGs3T2hC?=
 =?utf-8?B?YjhWTkQxS0VtdFpDRDZ4VWsvaXR4Y2pWeEs2b2JBVndnUFJDbWkwb2FnV05v?=
 =?utf-8?B?YU40QjNsbjFRb1M5dVNRM3ZPUXhOeDNhMWJubkh0N3Z0aTVmQW5UU3Nhb3Er?=
 =?utf-8?B?Z0pyWVNDSDlESG1vSG9aNUtiaVlpOGRRbFJtR0RRT083K1lUcWxSY3RueGdj?=
 =?utf-8?B?bkoyWmx3OFBVN1d1Q3FlM1czaTFhVUZtcitEbTlLM3lGQi9peVpERlZsWnor?=
 =?utf-8?B?TVZNTnZ5VXVxR3U0dUxXOCtpNHVhU1FwOTQyQllzSjFBWEtBTEJKKzA0QWNG?=
 =?utf-8?B?Yi9OU0tISlhjMDJ4eEY2VTRlQnNBdWUzUnNPS2t0a1RmVzBqV0pWaFZndEdI?=
 =?utf-8?B?akE2MWk2cUVFOGxyQTkrazRxbW1vdkFTdGU3VWlScXROWTluY2xxOTFRWGtr?=
 =?utf-8?B?NGRDK0JvcTV1RmE5U1h4dzJWcDhxdUtCaTR1dDJiK1JGbUtSc0V0c3VEdmZF?=
 =?utf-8?B?RlhaRENvbkcvQlRMV2swZDE2Yk1yeS83R2NGa3V2Y0F3K0R3dnUxbjV0Y3ZE?=
 =?utf-8?B?MFpZVHFsMWtpOExLc1ZVaEJadzcrTU90dWx4amI1R010clFwSERHQXpjMnFL?=
 =?utf-8?B?ZTRublR3SEc5SC9JQ1RPVUZiTmYrQnVTQUE2ckRnQ3ExVCtLVDdvazlBMUJZ?=
 =?utf-8?B?UFh4UzE4N2U4eXVuU1Y4OXpqRkw0eUxlTUE0ajJqLzdFV1Q3Tzl2emZYTHhD?=
 =?utf-8?B?ZEViL2FzekxUU1JYRmFDTWxkN2Q5MzNSSHdRRnJxVnlXM1h4VlptUTVtYjB6?=
 =?utf-8?B?VzQ1Y2RlanJUZzNQOXZVVWR0bFNwSncwN1BKN1ZqNkFEdUxqYTRsMWVHeG4y?=
 =?utf-8?B?dnNUbVpmcFBEZlVTdTR4SWRja3ZNSHNPWUY5aU44YXg5d3IwWEdXNk5MN2Q5?=
 =?utf-8?B?RDRzSDJXY1VBdVZHQ01yMlhMMEdmSFMwZngyNkNxTjlNcXZzTE1rbS9QOWRz?=
 =?utf-8?B?QTNsYzRwaG03QkRadHlSWGY4TG1WN05IdEhhdWhLc1ZieisvTExpY0lzdmVY?=
 =?utf-8?B?SHpGNFFmVDIwZDR5MDNzSzJhTXY1MEh3STRtSzJ2RTlkNWlhVWtWeFc3TTg2?=
 =?utf-8?B?UXQ2VXg3R2I4WHV4NUI5ZzMwWmRYQVBCb24yL1A3eWowU21vUE9DZEh0MVhi?=
 =?utf-8?B?VHB6aDFYVUdkSkIraThpNWlqUkJOYzliMVNpblB5OGo4Tk9aMXBTN0RkdXVa?=
 =?utf-8?B?cTRhb1lxVlhFNGZkdER6dm05TWdDSi9KaUNPbGVTY2Q3ZklRR0NSMmg3RUYr?=
 =?utf-8?B?NjN3dlRhZjlkN2VwRHZDZHdoUk10aWRxYmNhcGpQR0dwUEpiWWYvaENJcXpi?=
 =?utf-8?B?OUl1WDBqWDQyQytUS0dYREU4RnBvYU9pM2JPZmtmV0Z0aGx1Skp1MFlVR1dB?=
 =?utf-8?B?WlBEaStaa2Y5SkQ2OGo1NDJEUGhQMnRQL0VjUnVHU1BnOTA3aVREa2U3VVlJ?=
 =?utf-8?B?c0NYUUp3bHduMFV3VThPMnVNN2xjaXgyS0NCMTk3dkIyVW1xOFowcTFiVm8v?=
 =?utf-8?B?RmZ1VFdTOUswRmVjQkdPYm1YdnpNdVpnWGtzb3hOUG1TN09CU2ljV0FDWkxW?=
 =?utf-8?Q?Z1n2cLa3+ZXYYNREwCvmRInlefP5KiuUn/gLMVH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fc8294-3aa4-48c7-5925-08d8e701561f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2021 15:53:40.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dy50yVyC6n2Wf1KcApDL3SB4QxitzLwMmOLGmuf51wbabaecepTaY39soX+Hy79RPlEMJPSuWC2Z7OC/KZWwYwtNZizCG1cpOU5aIDUIrZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3196
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-03-13 7:15 p.m., manoun92@gmail.com wrote:
> Hello, can anyone please tell me how can I add a recipe to my image 
> without it being avaliable in Openembedded? I want to add Gstreamer from 
> git and not the 1.14.1 version avaliable on openembedded(warrior)
> 
> Thanks!

Can you just clone the recipe and change it to fetch from git?
https://stackoverflow.com/questions/49535881/how-to-setup-an-yocto-recipe-to-build-from-a-local-git-source

../Randy

> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
