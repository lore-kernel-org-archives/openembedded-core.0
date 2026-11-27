Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11648.1795762058343428586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 22:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sC4iPN+9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57914e973c=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR6j12a162205
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=h7iInHWONCzIl2nZhGA1tNtRxrHjMNK4u99dyDuld2E=; b=sC4iPN+9eMMJ
	lps1AwUVm1XjVdT2Ze7/0MlWhc80P+YKbpGcb+wXtGcEy5nXGuAKYhJozynx4gf7
	PRiU82v/19ko37I1LeCPhkMllCUR7obIKd7PSI87LqKImfW5QNSa4CN/KSXrHH0B
	Oj4Cz9m7yfHbhE/OaRlxT4KVGHIa1kUR9VZJv9AMZimN5cYHanvlF5YZrXlw2ioZ
	Z8fAPw0AsbjiHfX63L4ZsWWv+P3z4+e5+vxEsY9a4LDXbCtZb+BAEjle4dN2Jihb
	6Tyc/xV+CyobsfqHgwyHCvlpXol6FgcSJ6ia2jEn7ANx0emt87J+1iu+qgfdjzM+
	2m2fWKDaoA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023093.outbound.protection.outlook.com [40.93.201.93])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j60gh3x86-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L31J+OWTz5YE5ywyYoVE2acHyO7YwKqMVp+a9pC73AN6VzlLDY/U1mippdLLgoG1AC/gmHkxoyqPWa5AV5gHzymevl51BOLQflJLiMDv16ypHXVwO7B7qP/dWKFQ1MjD/zZGA2eH5p+YrwrSJHFT99qeH6OSiM/jrc9ElhlwFgjs8/j9vK2yAGlExgZENX9ceXgYAMwmT/5Lr7+tVCHHTnqsIXPeGb6nTJFgpdlwLS5GFzJptEe1BEdTq+i55Ev+RESAnUdTgCNHxd/8YccwxdZZ9OKW9UTjfYMke7Xqb8/HymgjB19+TkEFjGLWvPaLYX5NlJ5UP+dv/KVvkrraJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7iInHWONCzIl2nZhGA1tNtRxrHjMNK4u99dyDuld2E=;
 b=JWSNx3p8jR8HhLa+hM8O51vQHsSRbzudX29eOvG0YRLUaz+YbHCkdgNNRy+S2nDCZ/1ahe8BKSbLp/qoNr1eAE9bgh03pbGKEtRC2uXdWVkiLRVv3V9OXmVTAzUBaQLX3ni56NHrKqq5Tgxp1LADNJ3SxNDAd/frMIB3fLpNoK/jJNtDHF40E9zRTBxb80I4hIbf6tkHbro1fa9W8Tc6zwYwo+FTeVnyozMele8smw0eJzKD05DarGN0X0cXM9qPc7nG1eZIcwJCL9iwrfeDt8wcaoqQ+zDQ/LtwqZC8Yon65ZMPezyOeZOutPCv5OBP+IwBHclbMkhC6X48vTlzKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3243.namprd11.prod.outlook.com (2603:10b6:5:e::19) by
 FT1PR11MB780136.namprd11.prod.outlook.com (2603:10b6:170:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 06:47:36 +0000
Received: from DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1]) by DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:47:36 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 8/8] libconvert-asn1-perl: fix CVE-2026-131877
Date: Fri, 27 Nov 2026 12:16:59 +0530
Message-Id: <20261127064659.2169695-9-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261127064659.2169695-1-OmkarAbaji.Patil@windriver.com>
References: <20261127064659.2169695-1-OmkarAbaji.Patil@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0194.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::19) To DM6PR11MB3243.namprd11.prod.outlook.com
 (2603:10b6:5:e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3243:EE_|FT1PR11MB780136:EE_
X-MS-Office365-Filtering-Correlation-Id: 33fd5454-6af8-4c13-82c5-08df4c525203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: RCz/xFtg8bVxkK0YV3qEf2Ld1fqwEt0ei8HU3K4R+SAVIEYz3PZgWXl8Eop7nH3i68FqwCzPaq3EkriPS1OSdnzDTL2hyHrghdJOhkPLEcWDxG2xaW0662ryG5Zoet6SZd61rzyVcZgk26sE3PtUJhfbl9BTV6GcvNXPLBoOx/75MUOyd6a6Wd2Aj9RH6plyerpnn9D910RY2QFTHL6Ukz8USRo1y8Oae85J7YNizSkypsLOR8/tn/osrgZ4ZUMLTGOI/WLHxaJrO4+AswUH3KItTPaQLJCTAR3AQBB/2kUjkweyw4ZDvs7iOp+p8lp98y3V/3iFUy/XwppNJ+swkC02HkaBrNFWrNV+/H3Si2jIPQcv6MApKA1o69pNCdyTfca1zjYL6IxBkb6Ly69KIjtI+uGN4/droL9ck2D99JsV9vN87oLK2Sx0/kcDJggs9jDkO2UNYV9D3xBLu8AlN5MLOkq4skTdh/R4D2iX0ZCoF5hu/F9DAPqCFVDe26Zjlc1z/8TxT9nyBfFqsuSnZE2xbbiWG5j/YcTUfuP45Uzv8sAN5zKcpulofhXMrbINJSR6EbWpV5Ewb1fmEscCMw5GkQQ8Hmd6uTo+ur8fyNi82v9a2EZ+YgrnefbPwSx9N22/KWJh0MP11pi+3hcWvGB0YxVgEtHUJS13h2JOwPlHtZZIOTic3XCgobbmRXUXajHrX8g4REeR+PZNEBOrIl4m0Yq9SwV8pUOh6H1EMNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TzmKBAkGdG6o8fq3YAfTpzVmuPc9FXRR84vb7vtZx1N1i3CMD2pPYG1XwcUv?=
 =?us-ascii?Q?1ntfzEjH46tkgAzuCSeO2UbZI4S++L4tp3R7p0IqhxWaAU3L4fM+x/rMHp4E?=
 =?us-ascii?Q?/rrKOj9JzOTpbVLZE5yMLJAL0jzso7FNy21DPEwBCB8kjCxS7+APEOkj5bAC?=
 =?us-ascii?Q?mJbiH6Q+tHOY+DwoJ1zZBeQoDHvbudvRW05r0xLSz3mxZK9aXVH99CSxPcS+?=
 =?us-ascii?Q?JsX1BbCU0DhB1PfdFnCtVyOTo4YgQgAzsvrFSpynRWPaoVfRYIMRyWCguD3k?=
 =?us-ascii?Q?qNC6x5IN+5afH5+9GZXhhh2nkFCXhbDH+QAlTvsbPqNWgoNzwqYJBsrZpIEw?=
 =?us-ascii?Q?4eiCfjpVS/q8UCQmfUPQ5H0nUOSdc7g0m2w2doUoR6QWq0oSN17FL0gDTAHf?=
 =?us-ascii?Q?POlQKOfChwF/ZjMcZ1HkP68g4O5cR2Emoujr+JXsS7dbcWI/PCu3vWxTbH1D?=
 =?us-ascii?Q?tiRkN4ipIOzetKlAggzBNBCjuSBZBADF22RjJSy+wCcnplrMCVe9bdCf6Kjk?=
 =?us-ascii?Q?KjK45xkUbJW29M/x1Wq5GlS7GNFYbyu9fgq4NRD2iTGlrgJFa3X9OE6hq8+c?=
 =?us-ascii?Q?aWNd/kKeRj5iPId3zIWHTNxlYwBTpjvqf4v7V8nIr6Vy1EKK2UtvnjtYT9ER?=
 =?us-ascii?Q?L8djrM9OUV9fRfM6EUi79RA6fd8VD9HgZY2SOXt01CS0FvZBv67SwQoXHVrM?=
 =?us-ascii?Q?kYEJXhsvQcJlZk/u3llftghKPVplY7AE2cocxZ3bcA173ITXUFlsk+Ws5l4H?=
 =?us-ascii?Q?8g3z8rAzOpJmDy6kViVUCSo1zV519XmC+vErwWxTTqNQuTsPYL4h5s7swdHd?=
 =?us-ascii?Q?arR5Qr7gLG5+BZrYqg9pNv093f9+Qfl4jIK825MDemgFxRlmNkXnNCtXhr2e?=
 =?us-ascii?Q?EpVoVUUVA/ONPclWyav802tfEBv2K9Xp7tRw8F+jPzemANyQsdCv+WO3qTck?=
 =?us-ascii?Q?oSOomuadclOFg2/oUGTYwUhtG9WkJZDJReNqTze0fbyW+iB14m5cMVPlRfju?=
 =?us-ascii?Q?VIUfwLqz1AtecGdZtuRdBIvEffYtjbZrJbDCeZ44SWtFu5F8l8UOkvUm4xVw?=
 =?us-ascii?Q?7uKKrrOs9x1Aq6rLGlKAnA/9FXpQKvK8rP13b3Yl1mPbrVEjfASUsrMbc9H+?=
 =?us-ascii?Q?eyr1tB07C84TuAh5XKGx1mKDk8KV6NOBVuLiQ46t4prMzmqXZFHS84pRtxr5?=
 =?us-ascii?Q?+3EXxRmnbWO86mXhHU/Psv0TPxCnfLe51cqXATa6XLnqq3TWMdH2q7o7LCcV?=
 =?us-ascii?Q?4hGVwIlvzAAOmlQEOvypgD8uWGIOCejFS2A133U05QTde0BHZ5ScslC6PL62?=
 =?us-ascii?Q?pqk+JmrgVJhEbdaV3LraeATUO8js6ggAdaiByuWRCfxdGsOi2SxW6CSeR6jF?=
 =?us-ascii?Q?+WaCLQUXw7Dg1dfHC2d77YN6+/rmiKQmjyEraLcS2LdvFx+nGikqNvAfmJ83?=
 =?us-ascii?Q?C7frmg06TypEBTfc+Dsggr8/wX9TcLPuDEvK+x2XHNuKQ9ZPsf+7kscDsfz6?=
 =?us-ascii?Q?a79sgs5gOO0RxSfe7SxS3o5ObAbT0VKIQMQ5Nyn7Xtb4phl8C30NY/al8zGg?=
 =?us-ascii?Q?wT+H1zIpgYFDTwygDLOgeT2yTuFffbAxFVAOdXfsErdt/gl0FC9O/tTzOebt?=
 =?us-ascii?Q?pdeB5xJs7uLqbWh7zWMg83gpEupwJmC+7Ec0D+lT7Wf5K4N8t2VBua5oz0b+?=
 =?us-ascii?Q?DfOR+V64a/G2RVCDYUukMEapCZjBalABBgEDIa57ddaTyKP+MaqQL0bsDd+p?=
 =?us-ascii?Q?7o9GhkmYRJPXhEftfoFELEyGvYtpdq8=3D?=
X-Exchange-RoutingPolicyChecked: MMO5UVoa3suWwFS0BC7es5cd8w7UnJ+0WLAJkNgHoK3oxhjLBbdqhzr6u4eNiCf71lSeEhQGclJpXHBRTowGh15rRRlo/mJSWeh3eu+LcJVt77muXDmsoIPcrXHLRJeJRCEnDjxC1sf5p/e64cK3UU8Sg0TzLRWrB4qKJrK3rK6U6mHi2kAfdlBP95pDPJ8xm1wIYF2j9uc88Zk8KfLEumo4eCeHpfOP1GRUSihcP6xhAc+/LVTHG25PVX66gDFIqAlxs8NNtjsQ4tkUuR7JSTv+x+jcXz8rLOkcA4RqG+WjXobXhNEzLC01qbcZTSNsrj8sgpvH39/93KUKiDkPgA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fd5454-6af8-4c13-82c5-08df4c525203
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:47:36.0795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KS7z0skMiptGhB4qb9EEgxJwVtQ3OCKRI2QvhL6IOFMG7exbuXpMER87UobrztQIpvqOjpCn6Iua8QAPGeKCFKgrH/6wCvkGvclDwKDyMeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB780136
X-Authority-Analysis: v=2.4 cv=R5SWitRX c=1 sm=1 tr=0 ts=6b092789 cx=c_pps
 a=c61ECyqdR3yyy0DXXr4X4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=tur_Ltz9aGPhrhRrcaYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XFpVS7gBEuDBnKuGecSNBTIsmbufDYmt
X-Proofpoint-ORIG-GUID: XFpVS7gBEuDBnKuGecSNBTIsmbufDYmt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX09Zh36g9OUdT
 upJuZiN6o4sSU69fUcUWphayUm90+VnvaLQX3lQ9MbbrtZx5tqvOqC13aDYdZvZa+5wMHw/kdsC
 ZjLHgVavl3aBlhV2ECZQF1giEUbKCaiufHIKm5gIL8OFmHCxanzs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX99iBukbIldPX
 vtjtdoLGf3U181fqH+DCFeI87lVfr0RI14fDMZPUbe59EyQxdNElGh9FHU8ZRQVJ2rcUiLI3xMy
 N8gPZE+GB9cpbsDFUzRayr2jjKB0SbWW2TbPbo89JYIQHii6QjSwRgyDizQ6mjdQqmIsgR1ab5M
 oLdjZ3BoDkuBUmyMkoX1QKULNjYoI8D+65A8P123n4KuHxziE+j8XsGvJob9iOXx4nN+bGlD6ox
 CyqXSWyDqxUBDuQS3HW97cfL83BuudTgIUfNUWUr7qMzLoPIy4Un3lWXcbqhoQEL7UiST/4paHw
 doxeiC/y+YQG0B+L0reAwMKKPu13e5AR/ZmBdHBshmxhTtHrE46SGhsTRyBlo6V2u7uOcwOYiJJ
 Vep0JCP8uKVwk8UgLG8VezgXnPUwdvJYIJrd8vUEy1kBgKI31k0vhTbtw0a3wVXGAzoR1rms87g
 tyVFipqE/twpNLDCAJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 06:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251351
Content-Type: text/plain; charset="utf-8"

Convert::ASN1 versions before 0.37 contain a flaw
in OBJECT IDENTIFIER (OID) encoding and decoding
that can lead to CPU exhaustion (DoS). A specially
crafted OID with an excessively large arc value can
trigger expensive processing in Perl's pack "w*" or
unpack "w*", causing excessive CPU usage and potentially
impacting application availability.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-131877]

Upstream patch:
[https://github.com/cpan-authors/perl-Convert-ASN1/commit/805a7ee7d6c01a7dd6e0479fabcaadd7f9116e70]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../CVE-2026-131877.patch                     | 216 ++++++++++++++++++
 .../perl/libconvert-asn1-perl_0.34.bb         |   1 +
 2 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-131877.patch

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-131877.patch b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-131877.patch
new file mode 100644
index 0000000000..6b8da07d23
--- /dev/null
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-131877.patch
@@ -0,0 +1,216 @@
+From ed9b6afffccd7f24b0bb93fff983065eb9508f2a Mon Sep 17 00:00:00 2001
+From: Timothy Legge <timlegge@gmail.com>
+Date: Tue, 17 Nov 2026 22:31:03 -0400
+Subject: [PATCH 8/8] Fix CVE-2026-131877 Limit OBJECT IDENTIFIER arc size to
+ prevent quadratic
+
+_dec_object_id passed the content straight to unpack "w*", which
+converts each arc to a decimal string in time quadratic in the arc's
+length. A single 80KB arc took about 10 seconds to decode and a 1MB
+arc would take around half an hour. _enc_object_id had the same cost
+through pack "w*" for an arc given as a very long decimal string.
+
+Add a max_oid_arc_len option for decode and encode, in encoded bytes
+per arc, defaulting to 32 (224 bits; a 128-bit UUID arc needs 19).
+ASN.1 puts no upper bound on an arc, so 0 disables the limit and
+negative values are rejected. On encode the limit is applied as a
+digit count that always fits, so the encoder cannot produce an OID
+the decoder refuses at the same setting. RELATIVE-OID shares both
+functions and the option. Document it in the pod and add
+t/28oid_arc_limit.t.
+
+  $asn->configure(decode => { max_oid_arc_len => 64 });   # allow up to 448-bit arcs
+  $asn->configure(decode => { max_oid_arc_len => 0  });   # no limit (not recommended)
+
+CVE: CVE-2026-131877
+Upstream-Status: Backport [https://github.com/cpan-authors/perl-Convert-ASN1/commit/805a7ee7d6c01a7dd6e0479fabcaadd7f9116e70]
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ lib/Convert/ASN1.pod        | 25 ++++++++++++
+ lib/Convert/ASN1/_decode.pm | 14 +++++++
+ lib/Convert/ASN1/_encode.pm | 12 ++++++
+ t/28oid_arc_limit.t         | 81 +++++++++++++++++++++++++++++++++++++
+ 4 files changed, 132 insertions(+)
+ create mode 100644 t/28oid_arc_limit.t
+
+diff --git a/lib/Convert/ASN1.pod b/lib/Convert/ASN1.pod
+index e52d8b9..87e18cc 100644
+--- a/lib/Convert/ASN1.pod
++++ b/lib/Convert/ASN1.pod
+@@ -137,6 +137,19 @@ limit.
+   $asn->configure(encode => { max_int_len => 4096 });   # allow up to 32767-bit
+   $asn->configure(encode => { max_int_len => 0    });   # no limit (not recommended)
+ 
++=item max_oid_arc_len
++
++Maximum size, in encoded bytes, of a single OBJECT IDENTIFIER or RELATIVE-OID
++arc before encoding is aborted with an error. ASN.1 places no upper bound on
++an arc, but the time to encode one grows with the square of its length.
++Defaults to C<32> (224 bits; a 128-bit UUID arc needs 19 bytes). The check is
++made on the number of decimal digits, so an arc within a few bits of the limit
++may be rejected. Set to C<0> to disable the limit; negative values are
++rejected as invalid.
++
++  $asn->configure(encode => { max_oid_arc_len => 64 });   # allow up to 448-bit arcs
++  $asn->configure(encode => { max_oid_arc_len => 0  });   # no limit (not recommended)
++
+ =back
+ 
+ Decode options
+@@ -198,6 +211,18 @@ Set to C<0> to disable the limit; negative values are rejected as invalid.
+   $asn->configure(decode => { max_depth => 256 });   # allow deeper nesting
+   $asn->configure(decode => { max_depth => 0   });   # no limit (not recommended)
+ 
++=item max_oid_arc_len
++
++Maximum size, in encoded bytes, of a single OBJECT IDENTIFIER or RELATIVE-OID
++arc before decoding is aborted with an error. ASN.1 places no upper bound on
++an arc, but the time to decode one grows with the square of its length, so a
++remote peer could otherwise consume unbounded CPU with a single large arc.
++Defaults to C<32> (224 bits; a 128-bit UUID arc needs 19 bytes). Set to C<0>
++to disable the limit; negative values are rejected as invalid.
++
++  $asn->configure(decode => { max_oid_arc_len => 64 });   # allow up to 448-bit arcs
++  $asn->configure(decode => { max_oid_arc_len => 0  });   # no limit (not recommended)
++
+ =item null
+ 
+ The value to decode ASN.1 NULL types into.
+diff --git a/lib/Convert/ASN1/_decode.pm b/lib/Convert/ASN1/_decode.pm
+index 0450471..9cdf1fd 100644
+--- a/lib/Convert/ASN1/_decode.pm
++++ b/lib/Convert/ASN1/_decode.pm
+@@ -351,6 +351,20 @@ sub _dec_object_id {
+ # 0      1    2       3     4     5     6
+ # $optn, $op, $stash, $var, $buf, $pos, $len
+ 
++  # unpack "w" is quadratic in arc length, so bound each arc first
++  my $max = exists $_[0]->{decode_max_oid_arc_len}
++              ? $_[0]->{decode_max_oid_arc_len}
++              : 32;
++  die "decode: max_oid_arc_len must not be negative\n" if $max < 0;
++  if ($max) {
++    my $oid = substr($_[4],$_[5],$_[6]);
++    # every byte of an arc except its last has the high bit set
++    while ($oid =~ /[\x80-\xff]+/g) {
++      die "OBJECT IDENTIFIER decode error (arc too large)\n"
++          if $+[0] - $-[0] >= $max;
++    }
++  }
++
+   my @data = unpack("w*",substr($_[4],$_[5],$_[6]));
+   if ($_[1]->[cTYPE] == opOBJID and @data > 1) {
+     if ($data[0] < 40) {
+diff --git a/lib/Convert/ASN1/_encode.pm b/lib/Convert/ASN1/_encode.pm
+index b1c0adb..335f3ec 100644
+--- a/lib/Convert/ASN1/_encode.pm
++++ b/lib/Convert/ASN1/_encode.pm
+@@ -190,6 +190,18 @@ sub _enc_object_id {
+ 
+   my @data = ($_[3] =~ /(\d+)/g);
+ 
++  # pack "w" is quadratic in arc length, so bound each arc first
++  my $max = exists $_[0]->{encode_max_oid_arc_len}
++              ? $_[0]->{encode_max_oid_arc_len}
++              : 32;
++  die "encode: max_oid_arc_len must not be negative\n" if $max < 0;
++  if ($max) {
++    # any arc of this many digits fits in $max bytes: 2.107 < 7 * log10(2)
++    my $digits = int($max * 2.107);
++    die "OBJECT IDENTIFIER arc too large\n"
++        if grep { length > $digits } @data;
++  }
++
+   if ($_[1]->[cTYPE] == opOBJID) {
+     if(@data < 2) {
+       @data = (0);
+diff --git a/t/28oid_arc_limit.t b/t/28oid_arc_limit.t
+new file mode 100644
+index 0000000..4de1b30
+--- /dev/null
++++ b/t/28oid_arc_limit.t
+@@ -0,0 +1,81 @@
++#!/usr/bin/perl
++# OBJECT IDENTIFIER and RELATIVE-OID arcs are limited in size, because
++# pack/unpack "w" take quadratic time on a very large arc.
++
++use strict;
++use warnings;
++use lib 'lib';
++use Convert::ASN1 qw(asn_encode_length);
++BEGIN { require './t/funcs.pl' }
++
++print "1..28\n";
++
++sub tlv { pack("C", $_[0]) . asn_encode_length(length $_[1]) . $_[1] }
++
++my ($asn, $rel, $ret, $enc, $t);
++btest 1, $asn = Convert::ASN1->new;
++btest 2, $asn->prepare('o OBJECT IDENTIFIER') or warn $asn->error;
++btest 3, $rel = Convert::ASN1->new;
++btest 4, $rel->prepare('o RELATIVE-OID') or warn $rel->error;
++
++# --- 5-6: ordinary and UUID-arc OIDs still round-trip ---
++for my $case ([5, '1.2.840.113549.1.1.11'],
++              [6, '2.25.329800735698586629295641978511506172918']) {
++    $enc = $asn->encode(o => $case->[1]);
++    $ret = defined $enc ? $asn->decode($enc) : undef;
++    btest $case->[0], $ret && $ret->{o} eq $case->[1] or warn $asn->error;
++}
++
++# --- 7-9: a huge arc is rejected on decode, quickly ---
++$t = time;
++btest 7, !defined($asn->decode(tlv(0x06, "\x2a" . ("\xff" x 60_000) . "\x7f")));
++btest 8, ($asn->error || '') =~ /arc too large/;
++btest 9, time - $t < 2;
++
++# --- 10-11: a 32-byte arc decodes, a 33-byte arc does not ---
++btest 10, defined($asn->decode(tlv(0x06, "\x2a" . ("\x81" x 31) . "\x01"))) or warn $asn->error;
++btest 11, !defined($asn->decode(tlv(0x06, "\x2a" . ("\x81" x 32) . "\x01")));
++
++# --- 12-13: RELATIVE-OID uses the same limit ---
++btest 12, !defined($rel->decode(tlv(0x0d, ("\xff" x 60_000) . "\x7f")));
++btest 13, ($rel->error || '') =~ /arc too large/;
++
++# --- 14-16: a huge arc is rejected on encode, quickly ---
++$t = time;
++btest 14, !defined($asn->encode(o => '1.2.' . ('9' x 80_000)));
++btest 15, ($asn->error || '') =~ /arc too large/;
++btest 16, time - $t < 2;
++
++# --- 17-18: a 67-digit arc encodes and decodes back, a 68-digit arc does not ---
++my $oid67 = '1.2.' . ('9' x 67);
++$enc = $asn->encode(o => $oid67);
++$ret = defined $enc ? $asn->decode($enc) : undef;
++btest 17, $ret && $ret->{o} eq $oid67 or warn $asn->error;
++btest 18, !defined($asn->encode(o => '1.2.' . ('9' x 68)));
++
++# --- 19: RELATIVE-OID encode uses the same limit ---
++btest 19, !defined($rel->encode(o => '5.' . ('9' x 80_000)));
++
++# --- 20-28: the limit is configurable through max_oid_arc_len ---
++my $arc33 = tlv(0x06, "\x2a" . ("\x81" x 32) . "\x01");     # one 33-byte arc
++my $oid68 = '1.2.' . ('9' x 68);
++
++my $cfg = Convert::ASN1->new;
++$cfg->prepare('o OBJECT IDENTIFIER') or warn $cfg->error;
++
++$cfg->configure(decode => { max_oid_arc_len => 64 }, encode => { max_oid_arc_len => 64 });
++btest 20, defined($cfg->decode($arc33)) or warn $cfg->error;
++btest 21, defined($cfg->encode(o => $oid68)) or warn $cfg->error;
++btest 22, !defined($cfg->decode(tlv(0x06, "\x2a" . ("\x81" x 64) . "\x01")));
++
++$cfg->configure(decode => { max_oid_arc_len => 0 }, encode => { max_oid_arc_len => 0 });
++btest 23, defined($cfg->decode(tlv(0x06, "\x2a" . ("\x81" x 500) . "\x01"))) or warn $cfg->error;
++btest 24, defined($cfg->encode(o => '1.2.' . ('9' x 1000))) or warn $cfg->error;
++
++$cfg->configure(decode => { max_oid_arc_len => 8 }, encode => { max_oid_arc_len => 8 });
++btest 25, !defined($cfg->decode(tlv(0x06, "\x2a" . ("\x81" x 8) . "\x01")));
++btest 26, !defined($cfg->encode(o => '1.2.' . ('9' x 17)));
++
++$cfg->configure(decode => { max_oid_arc_len => -1 }, encode => { max_oid_arc_len => -1 });
++btest 27, !defined($cfg->decode($arc33)) && ($cfg->error || '') =~ /max_oid_arc_len must not be negative/;
++btest 28, !defined($cfg->encode(o => '1.2.3')) && ($cfg->error || '') =~ /max_oid_arc_len must not be negative/;
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index c404b4f2b0..139c5d85fb 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -13,6 +13,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz \
 	   file://CVE-2026-126819.patch \
 	   file://CVE-2026-126956.patch \
 	   file://CVE-2026-131868.patch \
+	   file://CVE-2026-131877.patch \
 	   "
 
 SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
-- 
2.40.0

