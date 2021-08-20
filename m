Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.81266.1629444754177791458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 00:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IliBoiYZ;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3866552705=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17K6qR6m011615
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 07:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=RpJWA2C/bf3IYWHN1om1zq4QZFLEWRSoItKpqpu75D4=;
 b=IliBoiYZ0MqI3Yb2nlwM+4Nz358D6BSjYcWDZNTxVScKcw91HcpLjFyip2vwzslm2UuG
 au6TXvFBGmwib8xWvrUoe8brce2VXJdq0nU3Mx7jT8jDIn5Ul5BX2ykT/gkyZcOS0GB9
 +AfFq19fsIF7kHGAWVNkl5C2faNAycyxqP88SiNglTwdR6ib49HVCMCP20CxOSzGEsU8
 YlJCtV8S6K8OIUqaj0oIvZEknOFlEk7WHymU7b0hJbhkrYVkRGUeig/Ivu2gYVclfm2k
 8wTE8AJ5oKZ3BDCsX0rvW4mQVMwDriPCiynKqI+YntZu4113vRpZm2SRLDgnVWRsn3gg FA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ahfs9gy01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 07:32:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFwWQCVL6729ydwSq0fq0pCxC/cb44k9oaY7SPddwBldqHgsbyPzopJ6NIrh4EgFCW0woFy/Jsf9KS5xpBknwrHHeAurS67YzlBpBvg7tIPlTIUcLv3/OvanAP55cMd5hkh7MMbDvq3IRXphzZmfIeROJN+yrOFieimmedjagcmIcaybUMPvNjo6Sxpka6yW778wwWpXJ+602iR6WYihf9G/rhDgurFTKi1Ju40VVcbZ7vAUysIrx9M/hWP6Ljojw4A7f7Dg26eivQjmPetZhdROem7uQOCvzFhHAHbNXilp4rOJonQB5Gf3TIDnNP3sFUmZm5khwzYp/1o/OEVysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpJWA2C/bf3IYWHN1om1zq4QZFLEWRSoItKpqpu75D4=;
 b=SlThR/Z2Q/kkGKAb3/Go/oKKxEMZIeccz0DeKwW8jyBV5wfEPFP8T3eHq6kTbEjQv9zOSimVsqueBavZ2jDFmQsNpEXkZs6mQ7IWXa8Ag5h4uR/7FuAMyapAy+8zpeegQvMMBhQMGK1LHbw5+gK24QY27wBoSFtv4FY7weI2FkysHnSkUGl9Amr2KHT4HShQoVrJfbC56JW/xfBEJDG1Sn07a5nIFzv9LmGzw6y4MyHpOHKTjdSLa/gVeE4JGEFF9fz0C3TCCQ9LI2vieTTEpHi/PFPX5r/M8NtqMQanyHv0J7AhrEHfiXTrCWMDlIIMwe/GwNB8Y9jD5fyt8dgOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2190.namprd11.prod.outlook.com (2603:10b6:301:5b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 07:32:31 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::652d:432f:777e:faed]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::652d:432f:777e:faed%4]) with mapi id 15.20.4415.025; Fri, 20 Aug 2021
 07:32:31 +0000
Subject: Re: [OE-core] [PATCH 1/2] rng-tools: Upgrade to 6.14
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <169CF3472372B2C5.3513@lists.openembedded.org>
Message-ID: <db8cccca-cb30-a68c-7d62-c0e5c926f858@windriver.com>
Date: Fri, 20 Aug 2021 15:39:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <169CF3472372B2C5.3513@lists.openembedded.org>
X-ClientProxiedBy: HKAPR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:203:c8::16) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.173] (60.247.85.82) by HKAPR03CA0011.apcprd03.prod.outlook.com (2603:1096:203:c8::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.11 via Frontend Transport; Fri, 20 Aug 2021 07:32:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc985d43-b83b-49d9-ad9e-08d963acab4c
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2190:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2190022B0A73D277515888F9F1C19@MWHPR1101MB2190.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2bZJG0NL2Y2bNmSOrkb4EI5cRmbUjc/hKQK/ShyHFArJO6g0DjnskBqPFBlvFilZIQ0NZiZwV1r9UWe9EUKWl2iWGS1LsWjt/cEdl/j0rZKi14AionOSDdADVXCpTvRkIVTx01N+SvNDuzuhIQIvgD97c5mC38vLDbuPrCzpfSL4muwJkDZRDCvUiNOsAINzX6FMsBsLREGDFWR5AeW5JyQpilBUeUg9+3vCrQH9CQw6wpBaLpGpLOGizKkSqZ8tw3w0TjzAyPRWNLzRRLeto2RlCVVkiv4uk1z6owdZL3Y3hFSshC9gFi0XZitF/blKLeKcpYHTzQrvYndKN+mLcMlqN+pdhgO91rpf+p+vlZ0WpeI95L4COuJ4Z76sSim+RwhqOf7wNyp+2sFOosSNIVy032nFeUhrt0lj9H7EncxtuwMipkwwrT2fdDF9EaHX3l9xRf1O9p912AUXRpglEHcSdPoCbldZYYFyvwrjaIxL/WsoOORlorrn2a4BbVK9kwDG9ZpPnONNOMmbxgYg9WjQlB/JjwvZVl0O2nku1tJKNAt7mK9VBdozgpRFjrhrS36n5xiYq6T4+r+C7qZg2YDrHkNDOMhCHacDFiINqGHD2/UmDjO5grjNWw1tkUTIk9Gu4P0J14sAAEiU6XkOiJN9ECWcF5YAD/VVZY6n9KNbu8OrCbEE0P5ci66s+QjNejBKL/VtO80boMYNui/25o/GXicivPQYXfPaMzWHj/7WGu3mMqaowGry2N8vzXy+VGgXbRQFOcRA5aRk1U0EU8kr+quujIsDjMi0gzfLiHm/1RFDyzMxRTmOErZqUylk59jqzqz3DIcbODMN6SEXX/eK2iQnlzr2t5qGPCO5WeDSNS9xNaaNddP2+TvFrYguFLfHpS3GYf8GbiVuRRL01KojCJnyIj5RxeY5720f+To=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(396003)(366004)(346002)(36756003)(5660300002)(6666004)(66946007)(2906002)(8936002)(6486002)(86362001)(186003)(8676002)(66476007)(66556008)(26005)(16576012)(83380400001)(966005)(31696002)(53546011)(52116002)(2616005)(478600001)(956004)(316002)(38100700002)(38350700002)(31686004)(6706004)(6916009)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzNqVy9nV3lsN1R0UGxYRXJDV1A5MS9hbVE5NXR3UlhObStHSEsyaGZpdFU3?=
 =?utf-8?B?K1ZwVXArVElqY2ZqWlF5bDNOMVJIUHlWRUhsbkVsenJQSjFoSU52dEFoRDly?=
 =?utf-8?B?L2s3ZHpnVUlZQm05K2NuQmRpbGo2cUtucTViR0VsVjBjWk8rakFqcFh2T0Fl?=
 =?utf-8?B?b1JUd2QxOFlsNGNTa2tUVkVlRWN4b0hFR2RJUVBJWGJrT3Q2RkxPSVMvNGh3?=
 =?utf-8?B?SzdXY25vblFjdmVXQUdmamNwc0NzTTlIelo2MWxGeXFiQU4rYk82VzdxUE44?=
 =?utf-8?B?WVIyTm8vUGsrcnltTXlZRDVTdUF2Tk9zU0szOUVnSVA5Y0lZWnpaWjBJekpE?=
 =?utf-8?B?aFkzT2tIY2Y1Qnp1NDJNVkVaUTY5c2kxMGg4T2NKeW9FZEI0WVRNOWVWdzNF?=
 =?utf-8?B?VGNkbDBuUnZZSmFKUjlpdnlHRDlrWGNPdTBhc2pNaWtYTFlRM2xoZEJUN3lt?=
 =?utf-8?B?d0Nub0FnMkM0SUtiNUFhMHBaditNWWJUWGgzdFBEM1gvQkVKL1JWdVNiUkM2?=
 =?utf-8?B?NGZ6S3VvL0s1RHJib1owOUFOTnhNVWZDb2FlTStMSW04eFAvbDFHNGhoODQ5?=
 =?utf-8?B?WDB3S2VNd2pVUlNzVTA1QkVqaVh5a2U4SXNPR1VYVXFzNEhiL3BpejFUaUw5?=
 =?utf-8?B?OW13SlpDQWdvQUR5cGJsQmczTmZ2S0ZSdkdDV1JsNzhVZjRMWDdjcjRyZzVn?=
 =?utf-8?B?L1Ywak9WU0Q2akhuNUsvZ0YyQ0xKd2tSQ20vdGNIeFRKYk5pZjZhdS9Jdjl4?=
 =?utf-8?B?SXQwWXY1RW1ZZDBZVnZ3OEhPTHkreGlaWUgvSUpIVWlzRkpwT1FCNEdWaXBY?=
 =?utf-8?B?NG9yQWxUdkRoSTVlcTJxVjJ1a21EUlk1V0hpeUdDdE9wWU5vSDdNZFEwTlBK?=
 =?utf-8?B?TWJZWkI3Y1VJTWMxNkVRaTRJeTlwQWxhMG5XWFFhczJJUnpGbzdyTlcxc0FG?=
 =?utf-8?B?VGQ3QW0zNEowbEozVVRtS3hqMDQ4cXgxSUpHWXVVMGRwTld0Vmo0U2NEK3Jk?=
 =?utf-8?B?REpib0NwZ0gyN0J4WENOMXlrNm1hcTZjczdKK2JGNzZKZ09RRThhb3BaZVlZ?=
 =?utf-8?B?T0swR2tsQ0N1c1ZXVnJwN2h1enFoeFhraVE0THQ0eTd2MGhvbDRaZlRaQ1Qv?=
 =?utf-8?B?bjY3MlJCQ1Z6WkcyQmd3djN4M1RTRHVTWGJxZG04MWs1TmNNam1BTGc1bUhJ?=
 =?utf-8?B?aEs1bGdJNEtRdUoxTDZHZGRYak5qemxTWGVNcjF3RS9QTnBHMFNhdFFXZVRj?=
 =?utf-8?B?NVd5V1FSMC90VlJpM1JWZ29kSWpuODBGazVLdTNEVTZlTXlZODJqMjR6VDlw?=
 =?utf-8?B?c3U3R1JiSWhmT3EzQnJrUy96LzJMYnY0VHZscHhFMkN5MmhaMGdsZXJvMkRE?=
 =?utf-8?B?UllEalJIQUtaV05WTGM3eW51SitSQzAySDhHTzJyTENndk5IaXQ1TUl1SnVi?=
 =?utf-8?B?bDBlVUoyeUgrQmRUV1NUSVFkdHRrWWRGRk4yemg4Z3ltcGN5bldtbGozK0cz?=
 =?utf-8?B?UzYwZEpMN3BVYXFpWDl2QjRxM3U5ZnRJcFdLcU9pOGgzbUhPd1dwWnlSVW5H?=
 =?utf-8?B?Rkt4VmY2aE50d3FoU0xQUFMxVjZjKzEwR29lNEFKQlMwd0dhWjg1Y20xUk9B?=
 =?utf-8?B?TUhGc0d6VUo5OHN2RE5oZkJ2bU5odksyclVVRWpQc0NlWTV5QjBoN3lrZ1J6?=
 =?utf-8?B?RUZLcVpVaStxWXM4WldmUnpNeUNWQXBPQjdGYW5RbjAwTUhvL1Y5RXlvOXRZ?=
 =?utf-8?Q?cnHyah176m86Ols/LCmaAJnUA/ef0MHO/2mgs/S?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc985d43-b83b-49d9-ad9e-08d963acab4c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 07:32:31.0563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwQDrt2D+KOfSYbX43peQ+fIooQ/YrwKAADyvx3yWvh6Ko6DP3lchSbFzpXkE6Q5T+SaHGKwN1Kpg9Gdj4iFvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2190
X-Proofpoint-GUID: a9vnlepIl0DpURw-9i8VvmpKu097U_50
X-Proofpoint-ORIG-GUID: a9vnlepIl0DpURw-9i8VvmpKu097U_50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-20_02,2021-08-20_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=841
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108200043
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Please ignore, v2 is incoming.

Thanks,

On 8/20/21 3:27 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../rng-tools/{rng-tools_6.13.bb => rng-tools_6.14.bb}            | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename meta/recipes-support/rng-tools/{rng-tools_6.13.bb => rng-tools_6.14.bb} (100%)
> 
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.13.bb b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
> similarity index 100%
> rename from meta/recipes-support/rng-tools/rng-tools_6.13.bb
> rename to meta/recipes-support/rng-tools/rng-tools_6.14.bb
> 
> 
> 
> 
> 
