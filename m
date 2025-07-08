Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39792C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 10:16:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15105.1751969738552124880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 03:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=928426fcf9=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568734St015689
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jul 2025 03:15:38 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5jp31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 03:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JO4ZNxmK+VSDYifGZj2VryBF0F9ikeFeV8qCMJY8VmPKV0+cQ5xD9M1xlB5KLY2LeHhzCIkVBRt7Y+uWC/huAuQa/DnzMADRdeQIdSkiToHHmHrJt5oA7vcftcb7hGDlz1yyHMEaSF4tSHqefMhtOAFyC4MC+5whnSRs+A7Q1j2JiiqTO5uu4kLA3WXSe728g9dWyeOeh/owCZkpxow3WcGQiSoEHJpkN3vs4dfK1cwrVW2xZhhpQSQib037kx8TfAymKsjvN1Dy3xUgMec4TKwf+V4NXh/yWaUkNR8gHNDXmuq2UnlCjDZgLlY3FlemvV8FUy8tcXDvshUOgyjewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9vpAKX83dGW2Tr/fvgh5RYV7MIjZoZ7SF4VfVsFxEE=;
 b=E6AWru1dn24V35hYWUMrrugzAcXkQCzcKute51nq6hPRvyt0ULsqVPRmiDClzRLuAMK7E8Vi4piqJyABG7PlqgOOUHl7DCkNuR8pIF7q6zq4L2QDLTCQ7T5sOhGt5sosdVsg4pEf7SpYqycYHPZ9S3D+9EbDS5spzSE0V7SorzM0W29RcGdQ0vYUuKOvsW+LlfjSrSZPHhwEfO9Q89DZhn5APunL5lS8BficIFv8TYTtvNgC5Sbcfq577hVUmt3e1mXcszm+8GJGjwwIRQfzEpPDr7r1W6HuHZTg6fYgUbpQ9w2hm9hJIwlfcn/vyrtQD+hLtiK7iFosdtdRslRfAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8705.namprd11.prod.outlook.com (2603:10b6:610:1cc::22)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 10:15:34 +0000
Received: from CH3PR11MB8705.namprd11.prod.outlook.com
 ([fe80::e17e:e5ac:8fc2:9614]) by CH3PR11MB8705.namprd11.prod.outlook.com
 ([fe80::e17e:e5ac:8fc2:9614%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 10:15:33 +0000
From: dchellam <divya.chellam@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][walnascar][PATCH 1/1] screen: update 5.0.0 -> 5.0.1
Date: Tue,  8 Jul 2025 15:45:09 +0530
Message-Id: <20250708101509.1079816-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250530115209.2077098-1-divya.chellam@windriver.com>
References: <20250530115209.2077098-1-divya.chellam@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::33) To CH3PR11MB8705.namprd11.prod.outlook.com
 (2603:10b6:610:1cc::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8705:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef68abc-37bc-437c-2b33-08ddbe085fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1wcqvzQwYf1PNGHAJspjO+5ousCsSpyG6oOz4jlGKSXEP4gAZupmCvClVv+2?=
 =?us-ascii?Q?u7YbiVk0RZRvTWhJjbjM51GMlU8oxb8CVkz61pfLzAMCbrMIgyVz9NQANgo/?=
 =?us-ascii?Q?IiZvQTo4MABFOK9IIZdQVbjgr/aOWfo9D7jkwkC1NMKvmjtEXigVlDKmLImU?=
 =?us-ascii?Q?Q9tojhnupwBvmCPg4CpOkTcbGb8r1n/dfnA7BaVX0YUUHYb8LjbdqqDnQhZG?=
 =?us-ascii?Q?51Qc157IWlbnlixRD+nd1SJTUWEpwXFFcTlzIh/fTCwRlDOvjFfu24mJskHR?=
 =?us-ascii?Q?xo/SffHKb7drQRJtws3M9LuP4+B53kZayOw3jOb2mSSzHOTaRrRWhj6E1TET?=
 =?us-ascii?Q?WkvLn6+aexh7ofs4XtpsDitAQzguAVJSC+BK1Oivcg7QcZ9IvhBNQGoE0POW?=
 =?us-ascii?Q?WOYGQEuEoecmfzlVuC0MWNpdhLWTL3cppGTqe4dz6wKmSJKgz1maxCeOdFQf?=
 =?us-ascii?Q?uQQY9w7IubBil2uTMlkmYNwdn93tZi+DSelfowkA0b68OIAVEZxA2+fYSDSf?=
 =?us-ascii?Q?qhUVPveIKrLlU5vg3zUpgZhO3OMaCU9mNSvkPrxSIUboj+O+V0KaDDQM93CO?=
 =?us-ascii?Q?ska97M8+JyV4NPhWlE6sKcUMU4MluaNI2r+vRnaUVTtMQ3ZMfEOXcGeYwwBI?=
 =?us-ascii?Q?F4Vfbex9KxV0jRF6u74OlQr+GOYA2kcvh1eRA+Sk63kPdbAN8D7y76hFvXZq?=
 =?us-ascii?Q?0BA01sh53Fll0pEd90clMovQBnjrciS4FCXSE2mPTCHO2O3/jU1TzLbnEPVw?=
 =?us-ascii?Q?VgX5A1dIoeL7QA9W+pTqUx6/BinjHdgrI23WwDrZweHqvYYVxmuP8y3Mt025?=
 =?us-ascii?Q?f9jbYGwUwGaGbuFtxrVSthcwlGHeEkjHGphwd0wwe6JGcG+Rkj4CMG2n9fs5?=
 =?us-ascii?Q?oLSAiNlyOMTEWF+zfHd6O/mjULNEZCFrDPdgL14dx28z5c4cdgkE6mhu96er?=
 =?us-ascii?Q?YmBfqiMZzWbE2j8SQJX8tlm9E2GqkjCeMKf5YwO9yIp9XhDgSi4UI58SdcUA?=
 =?us-ascii?Q?In0ZTb+WAq5CJx7UgmmOHIcUqARDk0NUGW8mTMWtnahLC53V659GtgX+g1Y/?=
 =?us-ascii?Q?AubIrIRrWSw7g415nFUPv6FCXYm3JhzHBVuUE813m1oQtrPTk0J3j90DEQAy?=
 =?us-ascii?Q?JrHeU41Ac2HUyeNNiheeWCUexPBxfHHDhia+rDvqTROSWyAXLFSjBHpvSDxu?=
 =?us-ascii?Q?Kw8pwFaaL5DP8plTNX/uuvZN9c9fpNkHJK2vt06IQgwluG9DJmh+lPAZNx0x?=
 =?us-ascii?Q?HwMhwJUrjmz+Y/gJ+3F0p0gGUK0aRM8lUZIgGghHUz9wgpfy37Mk0Lt39zid?=
 =?us-ascii?Q?rbSE0cTeWZt2ZrGCbt5SlE4IUXx7/QvYDVC6YHdg5MRUWgKjMMPwVrQ85RxD?=
 =?us-ascii?Q?mlSfiJ6J0WH+76TJMQ5CjP5l7amdRRvC+NnhreQxh8HSNZRrKFh8EdY5DiZY?=
 =?us-ascii?Q?nTeTnx50KGP1wg1ar/2OWbbGaAlJqXyfaz4CgEqjULant89Wn6Cs1J6ZQS8N?=
 =?us-ascii?Q?Gn+c5+wAPFbMxDE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8705.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(43062017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4MjYQWq27zUC5awhGbemEjLaYAsP9SQyc3ZITi+jkuKoBZcgRFt2XBvBMlUg?=
 =?us-ascii?Q?PXJArmp+dmgF9BBjCPJbM0F+83ubbm2DaORzdBQtzPuG26K1CtgfrigNe/u8?=
 =?us-ascii?Q?Igh3muYdhDwoDq3q1nuXAHDK4N3yUr9Br1seCQ6nrVdRfMxDAacMd4PX/DgK?=
 =?us-ascii?Q?XaCww5TPyfzjEnxI0SGTWW2Xohjy2R1quOXTQdi6WeS0FkkaopQB/w/ZAeOC?=
 =?us-ascii?Q?E189ppB1bYJUZNwcfcwOcpQoiQVrF4iArs6mb+T9roRpOuFZIPkCw5nur/oc?=
 =?us-ascii?Q?fEu2FF8xfgyCrqdpmMu999+1nqJV43gBdT668ROixCD42ZQ7Y9sf51uefwGF?=
 =?us-ascii?Q?pddoJ4/Q0sBCjQM4MXkiWQp6bTypuOtMZTxDnvJ6HJQ59d5vn0DXJKqC09Uv?=
 =?us-ascii?Q?329mlyk+Dp6oVSZPFdJs6+0H2hSvkMSGXIgJRfizUA0jHLUlWLJ76bAed2w2?=
 =?us-ascii?Q?MaFgpx7k51ZYSQYl2MCfsTzLd1FGvkuslhbL1s/XcBHoQ2XQMr4hHWyT/KSQ?=
 =?us-ascii?Q?4LbblAcFZwU199PQyZp8jaG9Y1+cF1uBdoqYBH6w4+JmcgceWX92zn2Zm8zu?=
 =?us-ascii?Q?5Fi/FPdZHEqlvlkjmdClSGyGlObfdSE4gw+mImr9ErqFG7Lf2knEFngmlhMO?=
 =?us-ascii?Q?0m4RWdyDnTpTZRYGASLjUXCCAvCnO6z2jwnbJhjA3KSCQAi6+6u776Lt3x4S?=
 =?us-ascii?Q?vkZTsvF6xqFVYlZ5cfMKvl7PrkvzB1IyafTq/S0ibbubWyQpy9P5Z5EnnUy0?=
 =?us-ascii?Q?Y42Qm3kGgWmOjKlp8OZB4FLu6LJThYi9ZlNFaEY47Mk05wLf2+ibciYsOeSo?=
 =?us-ascii?Q?fEE/palEJ0Lz117BuaaRKjTYDEWTZlwQBoOdMTJ2yHXdPHP6kl3S+LhNfUck?=
 =?us-ascii?Q?MtSoOBkQrQD4I/0L5bu7lI8K1ibK7MMOLKDTjkbzBIRnbQQaDRpGc1jjv82o?=
 =?us-ascii?Q?EC7VJaikvRKPwnwo87QBEqYGmPTwK+nO8AUolnMranqSMOUXvNpwG6YRPhzU?=
 =?us-ascii?Q?pb4HxUGs/9DltFN1UNpsZxMtwfwtMtLC+l83NLsSjyHm/5F58xw/SctNELyD?=
 =?us-ascii?Q?YY0GRrwiRBO42CfoGm1/r/ZEsdIypjWDBfhhl1CuFrATSXPCjh+KOWVrEfLQ?=
 =?us-ascii?Q?2H3MN5sCzT4IvjO/1CP+EJqH6BKlKEMV+hJcPKm6AkEUNYVn3daGe5kNcSJC?=
 =?us-ascii?Q?btHcyRU+qizf7NYElsLaQOvKi3eHOqv4lhRyskcjLjiW3IpAq90ZrQ5pjRcy?=
 =?us-ascii?Q?sFAxjDhxOFx/nPBzmK+34dDtbXo5FC0KWeBlW9+W54uXo+Fn8Nh1rlTyvIgz?=
 =?us-ascii?Q?STy4ZnVl+41YnLJdggqrwaixLmwwUceszWINFUuWiR6XQ810c0ecZC0xDfng?=
 =?us-ascii?Q?+6mnXc3k+s7FzFXqQW6CMgXnjFxjWcbelHHodi4tnBEv8EvchE8mp56L7Sle?=
 =?us-ascii?Q?9pQ+8lm7vj+qRkkyy2ST24YZCjKfVTp5B2EyHOs0pliLYnXs65ARTmaHhghf?=
 =?us-ascii?Q?p4Lciu52gROj6ZAUdVOq/iZsuCqa610vehDuDhdqrbIM9PGFnxmCSDgbbH7B?=
 =?us-ascii?Q?NQNWvSDFDk+8fLrN1YdGRvFJyWxjYj0fdITjHBat/L0UHExQ1+nZyc131rYi?=
 =?us-ascii?Q?cA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef68abc-37bc-437c-2b33-08ddbe085fe4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 10:15:33.8072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1D9lyx+LMvtP6CIkLJ58W/mIkEwdCMy7LHzSvYFK0MTdEbfiehN1/mxb1G9COYDPL6RCepvLUGRkdNVaIPEWsbrCMlsB4wBVkGHrHI7595k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA4NCBTYWx0ZWRfX0pxqami+8IiU XKjPlF7Hj03tAtdOI/hymHH537zofUck4Zr+od/nz91Cvp6oYGx8VtYYmXxUrSCC+s9P/xR9EOu 7BMMHvOQLeqCWIT75V4YKNH2Qr2fY7TXPU9OdqVBW4t7XXqEhX0v5INkc22el2aUKHzrpcT8VSW
 EumnyZTXPSd3SotCaZoEdYqsnArF+sgxjFQXGwU73TwjE3rWMwgUUDdFD9j83/m6sd69ciccqSK IZjpG9tteRVPefxZaQaBZRaDLcNNBnK45uG7K7oSQ6iNua67TxoUmM90J5s8+dTBEo9q/+2phWE +vH4Yfgtm8veolx/RnQ85s/ZBfrhc+uboUKxlTaru5aNKzF78RjJoK/GGhMASCU2g2WO0eTae2e
 +unNs1OxZqR1iH2pxYb1BK8lwRgmkarkQ0JmsFg/xrpC2HHSGnJSN6PFTTg+AFCQr4FHlDyh
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686cefca cx=c_pps a=Hxg71G30CNBv6xsSWT+A2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=_gujzhlsYxkA:10 a=Wb1JkmetP80A:10 a=BaTdte186F0382_pyKMA:9
X-Proofpoint-ORIG-GUID: tcnXV3Q2cyJDOxX8zDVQvgnf9CP0MZtv
X-Proofpoint-GUID: tcnXV3Q2cyJDOxX8zDVQvgnf9CP0MZtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=698
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507080084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 10:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220026

Hi,

Gentle reminder that the patch I have submitted on May 30th hasn't been merged yet.
Please let me know if anything is blocking it or if any changes are needed.

Thanks,
Divya Chellam.

