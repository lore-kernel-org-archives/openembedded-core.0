Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.32631.1631001695479083822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 01:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VYe4If4M;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4884f50412=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1876xc6N008072
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Sep 2021 01:01:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=RF8uMSmBH7+vh4X2gga7dV6Zq0JqARtlRaqWu9HClJw=;
 b=VYe4If4MJaQpb9kDDJ6bZcSkrItCTOAUvS0G9bqOmxgJJyKhk2IBUo/br46Pv6B0+TrE
 u+SJPQiq3oh9m9bDGTQgeBPsfdL1+Q8tWZh94GU+x7u7wNtPDwzKL0Et/umFjgnEHCbS
 AdF+a2eIrMUyQA0QiMyvid29wwi3MpqfgYTrUx+0dkwVvJBPLUcloarQD8INC10zyj3E
 YRr6k6LDsqEIR78c1gLualIvkR3coUvtPA90FVZzIvNXPxlQsqpcU9Cxt5kfeGPAi7z4
 smh4/1gXQiMPtAsFo/DgXRiTDbhY4SW0/z3/fMiTBmoTV4x1CLEu+0eKNqftw78HfuJV LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aw6bj8vym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 01:01:34 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18781Y1m021406
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Sep 2021 01:01:34 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aw6bj8vyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Sep 2021 01:01:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8LQzj217LeqT6iEkxU310ldj/QNwLmHH7/Nsjv+JA9F5Rm6X7LfhLAQBi7XBP6oNxhbPfBMuTQLyXE3LlcRjqzv/U7rYVjghVqG1xA6+pxyxQyCIvWgNo5bhYoQ7ujwvLtuWiYtAokG49fMU+hInbKRh4vC490Ws4vv7IXulojl3dB7p+FJrh8lBLzr/ehDrkWPD9Y5x1XHSbxW6GPszDuxxpA5iPsqVciw8hkzFdZTGlNM2JsUOgeauwham6sbkTV+z4ciTvJvFjvESz0Wjrl0xZiE2dKZjdPdMYBJlSZocoFrY6SlmJnbMzjkgXD+WIEq9WPkq8ed9m1zK1irBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=RF8uMSmBH7+vh4X2gga7dV6Zq0JqARtlRaqWu9HClJw=;
 b=GtLjTw9yus3iVhNFuXDsKXdQHdb2I4HtldiFZuko4iC3WBopUZRhy4Ps0OJ+5WdWo4jNoFnCQAkM+EfhdmNc9lF9aJL6Vo1GnjJW3r/Khw7iPFosUbIyAg7cf6EVwjavPfrHDEY2BKHR3t0cx8CBsLcMZInO/LYvK3XXmdZHxSf/Rjo1CG2F2vUt9ozoIv97XnA/UGiQDBr5qYRqB4R8JyVkrsCRIzF9ewaTW++MiTFV9ERPhkiujyxE6BZOTfw8yOkTbNqS2qrOxjJ4M3xgN51JLTlEr2YlcJJuZV8Dx8xr4BUcOpQHHOZTrvTS8zjfeRflrQoVBsGYKjQtPlWUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 08:01:31 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432%5]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 08:01:31 +0000
Subject: Re: [OE-core] License issues for assimp_5.0.1.bb
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>,
        "Mittal, Anuj" <anuj.mittal@intel.com>
References: <21fb5d8a-6733-90f4-95dc-b50c1b9df2cb@windriver.com>
 <CANNYZj8fQDzsdx4sU8MbhrFTm=nRw6vx8+pcB6fC73eK=60CxA@mail.gmail.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <9a2df61d-c26f-9fe2-3bde-a721421cee80@windriver.com>
Date: Tue, 7 Sep 2021 16:01:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CANNYZj8fQDzsdx4sU8MbhrFTm=nRw6vx8+pcB6fC73eK=60CxA@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0162.apcprd02.prod.outlook.com
 (2603:1096:201:1f::22) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from [128.224.162.198] (60.247.85.82) by HK2PR02CA0162.apcprd02.prod.outlook.com (2603:1096:201:1f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 08:01:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af3e8191-cef2-4ada-c519-08d971d5b3cc
X-MS-TrafficTypeDiagnostic: DM6PR11MB4545:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4545C4642294A1503FEFEE29FFD39@DM6PR11MB4545.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PyMFTX+TWfluUZeMrdRmDKSexVXXsz33K6LjQh4scS1i43yNH2cCC0ew6vOsZ9XGNGtMHzzX0RTGsOUujSFimA4Y2jgfD1S3Vr/qTG8vUkmfhE0NpmlLxlZ3pbM96AUsfadNVEtrRAgY2AQK3mvEOuithNjndIpcxEr/RL3qJcjjog2ESZdDc+GXKdcpZu/KUmDP89pIXmGv0M2FGL6zwMyxhsCsAxJZUqpgO+6BoyEFPASiYfNIzyk01v80ksmDOenzwNnOP+eM9sF3ugQLLcnowjiNa4cWre+NIIR9KpceKUSAfSaVeLW/N2ME4S0yDeqzNhUjYTIVQmwNLeg9r/35CfW81EMq03aHCBpN3z5cuMOKhHHJNfbNY52HrFuRhy1e5J+Wp1xPayH5fFNmziNpC4f6VoszOsKm9N9p7hVgUP+2ODubynufaNoRjV1LTuW2+2TmBUxHElEh4ntxOHR2ig1K2tcarbGPRzYbF+8SFUXS/VIz0dQsYDoKl4RQ+SI+U7c0Q3El5ae13R6DL0g3V9f5u50iUwNVpeOoLIOQtqGqfqdx5+vYUf5trLh0oEn3GL6cjFX5m2Bb6uq4b2re9uUWyL63IurhVb0fX6V+GDLTBO8vXjfQcTJkZFaIHDqiPRJaXQnJ8oUkXZdC6dT46/qUXrDykW5mLMr1aJDONXzhPBOw6US3TC0akqSnKjWTFXunYnwho8soIwhn0ORbV97OWIIxGsRwpU8+EF2R4QlOXbPuZ2+0co+S20mjmb4aK9e3Vq8eTTiZbub5tJ4K/4oJX+o+IRjsr+pfBMdjCHQr2zce18K1xRs/GBlucqfyHVH5ifbovt5AZJj53yy69FWCjhu47UJfmINjmnK78FvBqqWcl+jPHn56oiS+fiHDSmbhMLdLXSY+yXw32M9dqCFlkFNtwKMyXD0iYOM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(39840400004)(346002)(86362001)(2616005)(54906003)(4326008)(19627235002)(2906002)(31696002)(6486002)(956004)(31686004)(5660300002)(52116002)(6666004)(66556008)(53546011)(6916009)(36756003)(38350700002)(38100700002)(6706004)(66946007)(26005)(8936002)(8676002)(66476007)(966005)(316002)(186003)(16576012)(83380400001)(478600001)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TURBQjFzd0loUUsweVlJY3h0Skc4U2RLS3B4U1ArbHJSbzFvdWZoY2E0RVF3?=
 =?utf-8?B?ZG5VTk5YbEhyaXlublo2eE96MW5TMU9EZFMvVVowSWhUQy83MzZGY1lxcWNq?=
 =?utf-8?B?a0hEUC9xM3h1ZTZNMG1jUmZqZjQyRkxEdHVPbXhpSjZSN2NWenM0ekhXZSto?=
 =?utf-8?B?Q1RTWEJ2Ly9rUXpyZXgySTUyNGN5dlMzMFdvSUxGT2tZd2taaVlxaTk1UlMr?=
 =?utf-8?B?Uk1IcnViVDZiZ2R4bk1pM2MybjdpdHJRMzA1dVFFUW85VEdxdThsVW9xcWVP?=
 =?utf-8?B?clAweXdQa2RrN0RzSVgyYTMvUzVRcTJEQlFodEsxZHc5WThFMVNJTkxYTHds?=
 =?utf-8?B?MGpJazJDWVVsK1dqelk4eEp3VUw3UUIvSExJcE1SQ1U5M05yQWpRSFhQQndL?=
 =?utf-8?B?TW84bkxDcFdZa3lGZmdTdEhHY2pqZE9ja25VVlNvY0trSzJLRjJFWlZUTHVR?=
 =?utf-8?B?M2NvdFFMY011ajJBdDJ3alBVaWdxSlpNcWZYQkMwMWVhVWdDL2hnUit3dnZv?=
 =?utf-8?B?T3U3Zmc2UVdxemxlcWpSaUlteXB3N0xTQWgwRXVYcVBXcDArc2NPRThJdjRX?=
 =?utf-8?B?K0VzdVdwNW5uMmNxcEZFWXE4aUNpZlJxZXhxMTFsaUR6OEt2NDYrd0lmUXEr?=
 =?utf-8?B?MUlxU1E1d3pqTjN4YWV0QjZEamlYR0w2SEpoMEh5VTZsUzBuU0U3TWtYZTlS?=
 =?utf-8?B?YTdTa1drQ2xOTmtueCtSSTZ6a2cwR1l4UXhVYk9GQ0xMRDVqcUI5RTB2bVFk?=
 =?utf-8?B?Z3VucDI2Y0l0N2IxTkk2TTFraWFzWDArSXZER2NJbHJMbmV4dVVDL3BDWUI3?=
 =?utf-8?B?ais0QWQzUHQzSTNRVkhSZ2N4SXRmeEhWYnJZbm5xV1ZFT1c0UEFpZkRxclNS?=
 =?utf-8?B?YWV5ZVYvK29ZbW1NY0gvVVNPV3NnS0JtLzdUS0pmSy9JbXluYzNBZ1hoVUR4?=
 =?utf-8?B?bFJJVE5iZGpXR0t0ZW81amJtVFZGNXJZY3VwTDhKZm55eTA3NmpFekdSWmlU?=
 =?utf-8?B?Q2ZmSHpUY3M2REF6Q3lkbmlqRjExUkN6SlVLVmJCazRZSTNQOTFYbExJZHJQ?=
 =?utf-8?B?c1VnWUZia2ZlRkwvTTN3VDZYWEVWRlgrY1hTV0cvbFA5emN5OWRTZ3JvOXZ4?=
 =?utf-8?B?djBPQTVEOVowNU5id05LTCtZVjZUT3AvOUptMm9NR1o1UVFVZUZqT0tUYXlN?=
 =?utf-8?B?RUdRNUVSTkRnSTh0YkJaTGIrVVlLVVc2ZnR6Z1ZsVnUyZkFyd1R2T0pqSEo0?=
 =?utf-8?B?OWpNNllnVmt3eGtrVmUySG9KOWZGRGVUakhUT0VYd3JPdE9NVlZRSTV2dkJ1?=
 =?utf-8?B?RlV1K3l3ZDNYUC9icWZUZWJkSVBwRFlPUnhSaXhqU0g5c05jRGRnNkFEaWNY?=
 =?utf-8?B?QlI1c3ZTRFRCNjFvNVI0djRjTy9haURJZnBlWE81SFVpNUkybHd0WHgxeGNa?=
 =?utf-8?B?RDgxRWRLZko5R0ZIUTY1b3NGelZqVmlPYll1c3JiSTUzU3FHSzUwd21UbTc2?=
 =?utf-8?B?VjRmVFFMWVRCLzJiOEw5aSt2QVNrcmFMRlY1aTlSRkNmUHZ6Z0U2QXFpdU1y?=
 =?utf-8?B?VVJZa3RBcjBpemYreUJVSXhhL0dSVVFUTnk5aklINEZNY0tydU5WWkl5Ymlq?=
 =?utf-8?B?MTJ6SDJpS1hMdmNvaEVKTVhJTnVpRiswcjRSN1VuS1VNY0luZDVzdWc2REFP?=
 =?utf-8?B?Z2NFUDlxc2hiLzU0bWU0R01JTnprY1I3cTJBQTlTbXRPR01hMUt2eHVJWDVy?=
 =?utf-8?Q?sKXbIhxJnPMciZmCnsXllR6jtHVo4R4BWqq/N/J?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3e8191-cef2-4ada-c519-08d971d5b3cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 08:01:30.8916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iA4y058eD7Pakp/C7woS+hG1Eo2mZsqKXM9C8usNo3/CGrZ77QdExVLBC6RAS70baOcZRQIAoBEqU26FWAX/HpQQw4kZs/60H8EQehRPGGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4545
X-Proofpoint-GUID: QVU_CfHespUlbW8rNqQaF2gIifPe74cn
X-Proofpoint-ORIG-GUID: Wp9QOO9pj4STfMipZWYufRgG1WbKwcK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_02,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 mlxlogscore=561 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109070053
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/7/21 3:44 PM, Alexander Kanavin wrote:
> I'm not sure what, if anything, uses assimp anymore - it used to be a dependency 
> of (old) vulkan-demos, but not anymore. And nothing in meta-oe. Qt5/6 has it as 
> an optional dependency in qt3d, off by default.
> 
> I'd say, remove.

Thanks, makes sense, I will send a patch for it a few minutes later.

// Robert

> 
> Alex
> 
> On Tue, 7 Sept 2021 at 09:35, Robert Yang <liezhi.yang@windriver.com 
> <mailto:liezhi.yang@windriver.com>> wrote:
> 
>     Hello,
> 
>     It seems that meta/recipes-graphics/vulkan/assimp_5.0.1.bb
>     <https://urldefense.com/v3/__http://assimp_5.0.1.bb__;!!AjveYdw8EvQ!LcDBUA_wBTHz8UofrO77H8AyLY4mFBaP3t_4rMqjMw7PWOztilya3Ai_PGV6etVjISit$>
>     has license issues,
>     its license is BSD-3-Clause in the LICENSE file, but a few files can't
>     be redistributed with out written permissions:
> 
>     * scripts/StepImporter/schema_ifc2x3.exp
> 
>     Copyright by: International Alliance for Interoperability, 1996-2005 All rights
>     reserved. No part of this documentation may be reproduced, stored in a
>     retrieval
>     system, or transmitted in any form or by any means, without the prior written
>     permission of the owner
> 
> 
>     * test/models-nonbsd/X/dwarf-Read-Me.txt
> 
>     RESTRICTIONS: This model pack is available for use in freeware, shareware,
>     commercial games/software with the following restrictions:- **You may not
>     sell/re-sell this model pack or claim it as your own. ***You may not
>     redistribute this pack in some other model pack through a website or on a
>     compilation CD of any kind, without my written consent. Psi
>     http://www.psionic3d.co.uk
>     <https://urldefense.com/v3/__http://www.psionic3d.co.uk__;!!AjveYdw8EvQ!LcDBUA_wBTHz8UofrO77H8AyLY4mFBaP3t_4rMqjMw7PWOztilya3Ai_PGV6et8SuHKr$>
> 
>     * test/models-nonbsd/B3D/turtle.source.txt
> 
>     Copyright 2004, Psionic Design e-mail: psionic@blueyonder.co.uk
>     <mailto:psionic@blueyonder.co.uk> Used with
>     permission. RESTRICTIONS: This model pack is available for use in freeware,
>     shareware, commercial games/software with the following restrictions:- **You
>     may
>     not sell/re-sell this model pack or claim it as your own. ***You may not
>     redistribute this pack in some other model pack through a website or on a
>     compilation CD of any kind, without my written consent.
> 
> 
>     It seems that we even can't add these files to a mirror like:
> 
>     http://downloads.yoctoproject.org/mirror/sources/git2/github.com.assimp.assimp.git/
>     <https://urldefense.com/v3/__http://downloads.yoctoproject.org/mirror/sources/git2/github.com.assimp.assimp.git/__;!!AjveYdw8EvQ!LcDBUA_wBTHz8UofrO77H8AyLY4mFBaP3t_4rMqjMw7PWOztilya3Ai_PGV6egJZxP70$>
> 
> 
>     Maybe we should add LICENSE_FLAGS or remove the recipe?
> 
>     -- 
>     Thanks
> 
>     Robert
> 
>     
> 
