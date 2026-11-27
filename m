Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11646.1795762054417194727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 22:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QR8+aRwz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57914e973c=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR0XTbX3706326
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=pw2CmwXKWrt+S+Oce+OVM3npA6S3HhMfpZguRZsZI2A=; b=QR8+aRwzc+2d
	ttrL7AbXNmYc6fIdmqz3Gc1/eiEKs/OucnJ02ihkx4S/ia4QjT3Tg88CLJMU0byT
	3PO8eRr9HvQfLMNirkCmAXNYsB6wRB9V48wTb6VlYZXYFOQwX+K2ivdDZ6Kkl7a6
	xd9W1s+tSb6jcBSnbjoG6hAGmHFVgRupYVpzdoBNzmXjkbL8YG1lYIoFEFjwcNF2
	6LhK4KOXPC68OGAaBkJmKCfsFTvgeDhkHdqpNyv4knAQMCljoAfoheLyMvHHPxKc
	8w4QPy6EZqKBqMaGWSK3WTvHS5FDszUIgd1z0H8SgXncfnAhpObIbefoPATkRhHe
	XQ9WOWxwaw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023090.outbound.protection.outlook.com [40.93.201.90])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j60gh3x7y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RatCWaXBp5SRgNEsZ/2pweoBaoxXNA3TPPUzdVkYLpkJN5sZTtLpa13nwhDx/iBy5qNAxRlisco+LBSOOf8SPm2mqnZDW79M+xhXyIp48R9cmGqrMM0xBBWrp343fgbPXoYdPwtoj98qz0HBdmuu+ERVPR+9dBsUTo49RzX+VKCcL8PPW1XupKKFvEctXGiTbmdixafzOe6LWtqf7+bHLKZRNc48iGHt+QQX9Y3OLQ1flbhecd8JFlRLI33T2KRGuVLrSB0ZIxMh6tl35ZH37t420U+gvjHpd4Jv6qGIkyiBZimiErLY4BqjSf6QGykhRgAOVJeulIEAFJq/EcRH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pw2CmwXKWrt+S+Oce+OVM3npA6S3HhMfpZguRZsZI2A=;
 b=kApcK1CV1pxaggernTv35E7IBESeqKqAh1oAhPFxt6y907ZPvyDAoD+2fQvEOIIPhvMA215C6VCOd4OS2qgXG10a/0BCfG/plVmZ0X6G3deYrX2Rq1t96deX5m2YObMvSs7+mQkcvH0TUKq/YoGifj8r1/Uyks+fVQDuS0oPmyYBIILY43TC7LKgXuY8HhU8GJh7eKz9thRIX2VLiNc0LhItnaX9pYaw5Kuxtq3LuXeLU1muLDh73pxW9o+3Tz4Rebk0nh2piqqtJbnj4hLfFm05bCPOhShPtXWmjUuIqPotmd083cFhRaK+B9pt9DHBF7mBM3q+3IVE5coeeiQrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3243.namprd11.prod.outlook.com (2603:10b6:5:e::19) by
 FT1PR11MB780136.namprd11.prod.outlook.com (2603:10b6:170:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 06:47:32 +0000
Received: from DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1]) by DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:47:32 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 6/8] libconvert-asn1-perl: fix CVE-2026-126956
Date: Fri, 27 Nov 2026 12:16:57 +0530
Message-Id: <20261127064659.2169695-7-OmkarAbaji.Patil@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7e78c622-f41f-4616-49ff-08df4c524fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003|5023799004|11063799006|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: YBggj4C3tht2PFK51MmCr0bQNQ7OY31fxiTUMzH0lh8HvucbNAgDxWw+qfx9km4SJDfzQeCN7WkKaW/oa8CeN1H2Vs22A0at5fzotBKRch1JyoySqY3sOdGOvvZ6YvsD8kwpqXV0aFuDaw7zg/5v/wdwBYPLdgCfG8KP3rOHfC9iGrbL0NficcQoZ8j6SWQYrgpvrB9m+rP4aNStcC3yCcl8T2rSY+1/X0e9b5KH3IfR7MpaA4BLNGAayTRRNAT+we6mWoXZm87kspxge2AByKHPwuywWQyCMf7ZJ5VKO5L7LwWSI/hdKLvxwYCVSyjn786Wz3fZjxfJpPqPSmYcL7RVEgmehZ9KOcKR9R0+o4IdrHxiz2DLkogtuiXLsMBU4R8M0M1QYj6BVpXIHlR2IHYsayi1361UwnlpdKsMlwCehcxs2yfDq2Bk77hcEaggGbTFxmpafgWMd6AqfLDBupVIWLJm5hBCyykc5I3R6hQyPdcT7xxb9fScbimvENyqPJg8OSqvDmUvD3829hsDF2THwLsM2MzSpkyoeuNZMn11/XMKPfvhpC9pyH6nQzFr9O+LRoejdt05L0tCP1Xy/tJL14zpLW9lyMJXuwXz27GCpGcBGWzXp8N5Bgn+bE2iinDft4jJaPk0vai4c28s/6gUQ1YVUCdXOVwRsoo5MzDZypZDbZ702ccguLFR0Vpr8RBuY3euP8UsMIWrqL7C3P0FLxF27S6fgoH04HgpDr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(5023799004)(11063799006)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kgw5G5JrbKgpXueogSNLCQbNodTuKaGuhF3wj05AJ83LINKt6fx2qLDEYhii?=
 =?us-ascii?Q?Hb3UVe4liutRlvySduWLspSDiQnq+lbLRZA+groWc7voUC0TvQWuZ7Y36pbG?=
 =?us-ascii?Q?8P7o6ffSyvjjFD9Bzv2D+cDEtng89JtQZ5DYm9EjapRA1UZSn9qBH01XNh3L?=
 =?us-ascii?Q?Pc798BO2Dx2XOl4y/RNlTz0Eg7Dw6k/qSSaLKfrTjkOB5+g69rc4D8GSmITe?=
 =?us-ascii?Q?yDL3h8iQ/R5WO0f//xnGI1z8TB5o8pbSWKFoQ6ooVWCUuRhURJD/UpwPd6YZ?=
 =?us-ascii?Q?S0uO4U5MRCHvZ+nRelAGhWyXhR2j34Uj8t7shDsQtMK2KhcGlJaSCbkc7ivQ?=
 =?us-ascii?Q?YRBWXE6oNKjRy5sRcrdUNJlrPs4ogxUsGAaqHDMQmE7O0VpPixtAhdxU0D26?=
 =?us-ascii?Q?NWR1dWeEObKZA5HQ3QwBNHFRRpMDWhVAnf+RaxrOlnC73ltD8iHM0TFIMoc7?=
 =?us-ascii?Q?xtuxEtTdAaO2QVK318plR8nOB7s0SJEYtMe7FMZbsK71E0d+owwmmR2hp3PQ?=
 =?us-ascii?Q?HOx8TDEG+w1d+lZ5wmTCP4XjvG/y0NvwryZNCNuPBBPM+VLQ8zS+UOks5kDl?=
 =?us-ascii?Q?9HG7pTGgc9soFAIGg3aQpVQuSrWA1Ywkj3vgHyD3xsbL1M527e8/IZl9GN7/?=
 =?us-ascii?Q?VI0WK3LkbWCKzNSrqZ3I8FZJ1y+QDN1SemminvUz7GVj62LHvFECZEhhaybP?=
 =?us-ascii?Q?RDacUX64++yA8D1ACfNFEnMn9r80PBej4a/qkrTQmSZt9sMqoJWbDzDhNFQC?=
 =?us-ascii?Q?ALKlTZSLyX9L02GQTunQYgP1lQUQC92wT3QmaBCHAsyGDurNokY+R79z2I0+?=
 =?us-ascii?Q?OTDvtvoExxioZa0O1BUItLsq/RyF0lENiHZTTs0c64hiJ90xd5OQxwXPn4N0?=
 =?us-ascii?Q?i4z3wVV1L+62jpMvnkJg4xcyF95tXKf6u7EPEeSdDOGhxrfyVU4UPvFP0Sm+?=
 =?us-ascii?Q?8Ii+BEiUh1yez4fVeML5TjhbKuuXmf1acCq/RGBOzbFKOqUm9vFe1j4sby8+?=
 =?us-ascii?Q?cmxMJeO7D4dSezo0v/S98jmqB1mkfaQkyonr4bmxPMOPOktp2H/gztrR42bh?=
 =?us-ascii?Q?ZEMGKWyJTYS3JZ6f1l2frNkkv3pzZqPvijI4RNTV7yT729pPqEJRNk3gcM1l?=
 =?us-ascii?Q?ahuTTimv/TDshik5JUktfg9BsnxxCwmdvGMJtJ1/BZcvVqNvxvODyXwhwtHJ?=
 =?us-ascii?Q?YZOzCuAd2vwX+piQfO/YpY9V9r/+H6hKMC0/rYzoofmucBH+q6f/Es/1f0U9?=
 =?us-ascii?Q?P4Aj6hN+fRILQ6CYFsdd7vU7bXPjgl47T70DJui2LS0xg+54dQdIVm/x1cUa?=
 =?us-ascii?Q?CA4Ejy/Q8+F2UNUrNTGTsssa4YP4lAtqWDE6eVA7N5hCRGulwI5p1htrGnTW?=
 =?us-ascii?Q?qY0j+dUKe1plhove1YrvESSol+WD+38yFZivh+yrPqSvA7NgmpBVrXzRHAQN?=
 =?us-ascii?Q?B3BoVyfVpC8UJBbtXPVjWrvDB8CjcD+dRJz9O7MbL8id4pprFHuQ6roHTgue?=
 =?us-ascii?Q?OlNS89X/sslS9Bo962ULLV76M4hVgDwodoXAH5LfXQYXRmbudIU7i0FKWzev?=
 =?us-ascii?Q?GCq/1AarEDAvD+3Pk4B0brpWAX+4wU6R4Frd88fAZ2HUDbxCrGU6OTxpEUoT?=
 =?us-ascii?Q?GDtMjnWcurFNX9eoGdMv6JgoTU007/XzxoFmicfSi0X9JYI311yPIDmGoy6N?=
 =?us-ascii?Q?xwWf+LLTKdrRDrABxSfA76uwCyuEhN9TrM3EkAQv+cNcSaXKuRDZr9xQ/O9S?=
 =?us-ascii?Q?z5sgTRN4NoaPIRDZKXJ8NTXUvHWZ0r4=3D?=
X-Exchange-RoutingPolicyChecked: eTF41eN9pxajo27YNwVps64vhYsRd53oY3AnAq6p8d5fZOpXoiH0OrnnDcLn+K4YKtsGhIj25YkkvZnGzF58HKp7xTiR3UrlqKQ/B8SinOY+8jvMhwFhh/IbDaOSXfWdEBC8MWmKF0YJ7Zr8eaUc6Hw9Aqr0lz60k8y2X8X1CM0VBDoD0lfs1HOvV4HBFV/UQlircH0sH4m454cZYYa1fB4Sj4wpbDtfjcNRqlHj5hQxlwUkewrtxKHO1nfdZXgrczNJ7UNhyLqpcrnWpjnJKiNijOnmj9U8WOJtGcBWhlNP+YeXCz96JlpWyx8X/mCVvnYxwPmz+AFFRTs/Lb0B2w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e78c622-f41f-4616-49ff-08df4c524fe4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:47:32.4027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ic706gxXDOZQ0lFHs362PXy030Ey6/k/Dy9IYphYEBBSttRGpx+ha8BNxWpgL7wzc8HrgaYqo/lhWmh8bsP4Nav6Of23V8TUcN9F/IPc268=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB780136
X-Authority-Analysis: v=2.4 cv=R5SWitRX c=1 sm=1 tr=0 ts=6b092786 cx=c_pps
 a=krMX4SE5d8na1K7/klQVLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=3Dy-BMkK3IvYsCc2IQAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XXLl5Ndo9uSFkNPOGKH9JNLGNmcxnQ_g
X-Proofpoint-ORIG-GUID: XXLl5Ndo9uSFkNPOGKH9JNLGNmcxnQ_g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfXwc/bZESayGoD
 yO4Pz/ow/I6aGaEfMfkwIXAN3Qhb1nftP/uACZC889y4VMg+B5wNTsmetzZCpvcU+pJx3O2b34Q
 TPEAImgbdy/jQ7gKtlYuHzrcE7aF9ITMVesXEKxpPkdlZH71RY9F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX4evxAZcd7UMl
 OFhdIwR7tYt32Xt5P6gTLE6ijYfIHuQ7c2GmNyZHH5n9xpj5u672ddodjU6i3Oyn1nZqkJvjL3B
 PyXjvwtTCr5RhpoohsKUP5a9/giFx5pc8ebXUCh2xORxH6Chkb/xz79UCENBjQVf1qrcwfbu5wu
 DieZABeA2pKZhOULOzF1geOKacq92IwgFF0ZrqJS1TJwr4HyeRDugVaAt6tQ4hGZNcHDMHhuKY9
 3vSZtBaxMA5gsIl7585pFhBYMw9fiUzdqqJGvfkiln6N5JGvoahUrrxYk4YIkin4YA/1cFFA3yA
 NmTLuNyt75urKt69DRZQuBZR+vGZ4uXsGINk9dtFCjAu0tx44EdSGgQ2E17OS6VFEN+aXyUz40C
 AbPQtf/3VfCbDi+d2bZPwr1aSNimQDYvlkDq0wKcfNpgB032WNqRcK95BVVoTwRXn/wRNllQY/Y
 EziejfZrmV0oqVHyVlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 06:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251349
Content-Type: text/plain; charset="utf-8"

Convert::ASN1 versions before 0.37 contain a flaw
in constructed-form string decoding that can lead
to memory exhaustion (DoS). A specially crafted ASN.1
message with deeply nested constructed strings can
trigger unlimited recursion, causing excessive memory
consumption and potentially crashing the application.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-126956]

Upstream patch:
[https://github.com/cpan-authors/perl-Convert-ASN1/commit/99a96139a322ba0a5183c7e40a8857f3550daace]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../CVE-2026-126956.patch                     | 182 ++++++++++++++++++
 .../perl/libconvert-asn1-perl_0.34.bb         |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126956.patch

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126956.patch b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126956.patch
new file mode 100644
index 0000000000..99bdc249d4
--- /dev/null
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126956.patch
@@ -0,0 +1,182 @@
+From a2d8d2dab891fd5e7795eb34f14e903b0c8e8795 Mon Sep 17 00:00:00 2001
+From: Timothy Legge <timlegge@gmail.com>
+Date: Wed, 11 Nov 2026 22:25:08 +0000
+Subject: [PATCH 6/8] Fix CVE-2026-126956: constructed-form strings allow
+ unbounded recursion
+
+Add a configurable nesting depth limit at the top of _decode, covering
+all recursive call sites: constructed strings, SEQUENCE, SET, EXPLICIT
+tags, and CHOICE. Default is 99 (below Perl's built-in deep-recursion
+warning threshold); zero disables; negative values are rejected.
+
+Propagate depth counter into ANY DEFINED BY sub-decoders. The handler
+call at _decode.pm:148 invokes a separate ASN1 object whose $optn would
+otherwise reset the counter to zero; seeding _decode_depth and
+decode_max_depth with local before the call closes that bypass path.
+
+Rethrow the depth error from the eval around untagged CHOICE
+alternatives. Treating it as a non-match made each level retry every
+alternative, so nested CHOICEs could cost up to 2**max_depth work.
+
+  $asn->configure(decode => { max_depth => N });
+
+CVE: CVE-2026-126956
+Upstream-Status: Backport [https://github.com/cpan-authors/perl-Convert-ASN1/commit/99a96139a322ba0a5183c7e40a8857f3550daace]
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ lib/Convert/ASN1.pod        | 13 +++++++
+ lib/Convert/ASN1/_decode.pm | 25 ++++++++++++--
+ t/26dec_depth_limit.t       | 67 +++++++++++++++++++++++++++++++++++++
+ 3 files changed, 102 insertions(+), 3 deletions(-)
+ create mode 100644 t/26dec_depth_limit.t
+
+diff --git a/lib/Convert/ASN1.pod b/lib/Convert/ASN1.pod
+index 898f124..e52d8b9 100644
+--- a/lib/Convert/ASN1.pod
++++ b/lib/Convert/ASN1.pod
+@@ -185,6 +185,19 @@ rejected as invalid.
+   $asn->configure(decode => { max_int_len => 4096 });   # allow up to 32767-bit
+   $asn->configure(decode => { max_int_len => 0    });   # no limit (not recommended)
+ 
++=item max_depth
++
++Maximum number of nested C<_decode> calls permitted before decoding is aborted
++with an error. Each SEQUENCE, SET, EXPLICIT tag, constructed string, or CHOICE
++without a tag adds one level. Prevents a remote peer from causing unbounded
++stack growth by sending deeply nested structures. Defaults to C<99>, which is
++sufficient for any real-world X.509 certificate, LDAP message, or SNMP PDU,
++and stays below Perl's built-in deep-recursion warning threshold of 100.
++Set to C<0> to disable the limit; negative values are rejected as invalid.
++
++  $asn->configure(decode => { max_depth => 256 });   # allow deeper nesting
++  $asn->configure(decode => { max_depth => 0   });   # no limit (not recommended)
++
+ =item null
+ 
+ The value to decode ASN.1 NULL types into.
+diff --git a/lib/Convert/ASN1/_decode.pm b/lib/Convert/ASN1/_decode.pm
+index 3e1978d..0450471 100644
+--- a/lib/Convert/ASN1/_decode.pm
++++ b/lib/Convert/ASN1/_decode.pm
+@@ -44,6 +44,13 @@ my @ctr;
+ 
+ sub _decode {
+   my ($optn, $ops, $stash, $pos, $end, $seqof, $larr) = @_;
++
++  my $max_depth = exists $optn->{decode_max_depth} ? $optn->{decode_max_depth} : 99;
++  local $optn->{_decode_depth} = ($optn->{_decode_depth} || 0) + 1;
++  die "decode: max_depth must not be negative\n" if $max_depth < 0;
++  die "decode error (nesting depth limit exceeded)\n"
++      if $max_depth > 0 && $optn->{_decode_depth} > $max_depth;
++
+   my $idx = 0;
+ 
+   # we try not to copy the input buffer at any time
+@@ -137,8 +144,16 @@ sub _decode {
+               $handler ||= $optn->{handlers}{$op->[cVAR]}{$stash->{$op->[cDEFINE]}};
+             }
+ 
+-	    ($seqof ? $seqof->[$idx++] : ref($stash) eq 'SCALAR' ? $$stash : $stash->{$var})
+-	      = $handler ? $handler->decode(substr($buf,$pos,$len)) : substr($buf,$pos,$len);
++	    if ($handler) {
++	      local $handler->{options}{_decode_depth} = $optn->{_decode_depth};
++	      local $handler->{options}{decode_max_depth} = $max_depth
++	          unless exists $handler->{options}{decode_max_depth};
++	      ($seqof ? $seqof->[$idx++] : ref($stash) eq 'SCALAR' ? $$stash : $stash->{$var})
++	        = $handler->decode(substr($buf,$pos,$len));
++	    } else {
++	      ($seqof ? $seqof->[$idx++] : ref($stash) eq 'SCALAR' ? $$stash : $stash->{$var})
++	        = substr($buf,$pos,$len);
++	    }
+ 
+ 	    $pos += $len;
+ 
+@@ -206,7 +221,11 @@ sub _decode {
+ 
+ 		  @{$nstash}{keys %tmp_stash} = values %tmp_stash;
+ 
+-		} or next;
++		} or do {
++		  die $@ if $@ =~ /nesting depth limit exceeded/;
++		  next;
++		};
++
+ 
+ 		$pos = $npos+$len+$indef;
+ 
+diff --git a/t/26dec_depth_limit.t b/t/26dec_depth_limit.t
+new file mode 100644
+index 0000000..dba346e
+--- /dev/null
++++ b/t/26dec_depth_limit.t
+@@ -0,0 +1,67 @@
++#!/usr/bin/perl
++# Tests for _decode nesting depth limit (F7).
++
++use strict;
++use warnings;
++use lib 'lib';
++use Convert::ASN1 qw(asn_encode_length);
++BEGIN { require './t/funcs.pl' }
++
++print "1..12\n";
++
++# Build a schema with $depth levels of SEQUENCE nesting around an INTEGER.
++sub make_schema {
++    my $depth = shift;
++    my $s = 'n INTEGER';
++    $s = "x SEQUENCE { $s }" for 1 .. $depth;
++    return $s;
++}
++
++# Build matching BER input: $depth levels of SEQUENCE wrapping INTEGER value $v.
++sub make_input {
++    my ($depth, $v) = @_;
++    my $buf = "\x02\x01" . chr($v);
++    $buf = pack("C", 0x30) . asn_encode_length(length $buf) . $buf for 1 .. $depth;
++    return $buf;
++}
++
++my ($asn, $ret);
++btest 1, $asn = Convert::ASN1->new;
++
++# --- 2-3: 2 levels passes max_depth => 3 ---
++$asn->configure(decode => { max_depth => 3 });
++btest 2, $asn->prepare(make_schema(2)) or warn $asn->error;
++btest 3, defined($asn->decode(make_input(2, 7))) or warn $asn->error;
++
++# --- 4-6: 3 levels exceeds max_depth => 3 (depth reaches 4) ---
++btest 4, $asn->prepare(make_schema(3)) or warn $asn->error;
++btest 5, !defined($asn->decode(make_input(3, 7)));
++btest 6, ($asn->error || '') =~ /depth/;
++
++# --- 7: max_depth => 0 disables the limit ---
++$asn->configure(decode => { max_depth => 0 });
++btest 7, defined($asn->decode(make_input(3, 7))) or warn $asn->error;
++
++# --- 8: raising max_depth to 10 allows 3 levels ---
++$asn->configure(decode => { max_depth => 10 });
++btest 8, defined($asn->decode(make_input(3, 7))) or warn $asn->error;
++
++# --- 9: negative max_depth is a hard error ---
++$asn->configure(decode => { max_depth => -1 });
++btest 9, !defined($asn->decode(make_input(3, 7))) && ($asn->error || '') =~ /max_depth must not be negative/;
++
++# --- 10-12: depth error inside an untagged CHOICE alternative aborts the decode
++# rather than being treated as a non-match; otherwise each level retries every
++# alternative and the work grows as 2**max_depth ---
++{
++    my $levels = 30;
++    my $schema = "L0 ::= INTEGER\n";
++    $schema .= "L$_ ::= CHOICE { a L" . ($_ - 1) . ", b L" . ($_ - 1) . " }\n" for 1 .. $levels;
++    my $choice = Convert::ASN1->new;
++    $choice->configure(decode => { max_depth => 22 });
++    btest 10, $choice->prepare($schema) or warn $choice->error;
++    my $top = $choice->find("L$levels");
++    my $t = time;
++    btest 11, !defined($top->decode("\x04\x01\x41")) && ($top->error || '') =~ /depth/;
++    btest 12, time - $t < 2;
++}
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index 4615a1a90e..fc47ccf8d7 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -11,6 +11,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz \
 	   file://CVE-2026-126576.patch \
 	   file://CVE-2026-126682.patch \
 	   file://CVE-2026-126819.patch \
+	   file://CVE-2026-126956.patch \
 	   "
 
 SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
-- 
2.40.0

