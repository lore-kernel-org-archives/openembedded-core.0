Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11644.1795762049613533400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 22:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eJLxnKvB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57914e973c=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR0XTbW3706326
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=jWzj0c9zJdoZDcbIeixPVvmNjlCd27CORcJiXMdF1u8=; b=eJLxnKvBJlaO
	TC2JiWNNtPuUu27LCmysWnSqF4YVd2Fo94oVKfth5VjqxIOIe+5ZhlbrmQ8v5rcg
	de117Lxt9bTi8O2FIb+g8y4eAHHgMgF2JoJFAXspCj0sZWP9/BtiwUD4mk1mZSCm
	xtcUgyDv9u0GjOzFd2TPW4xYApV4je6ihEkpIJcyYGWJ9qulzdxjz6Pai/UEVnMo
	KRCwr95T1zl/lb2x//t1ksOAEz43Be9hPhSTCFbYlEAPlg8xdh0rdQzODpbMZ51g
	ezs9OjXUCsZugKva8HJbrnVP67YEZxUysSzoiAvxQz9CScgPn60vGNFVGqRXV94o
	p/jcD7cpRA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023076.outbound.protection.outlook.com [40.93.201.76])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j60gh3x7r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqL+VZDU1GjyVTtG5znZEsmz4RiJn2ihtQX6Y1/OddpKgSKug6nroTbWGFOXCJ21GIx97uNUa6/k30q1BcO4qPKnPvHTSyPfSEDS4F3DpcBHMGcmFJNdHTSHoaX+aWQDQz2oOTtOoeSRGrGQ6MWvtqkyGG8OWHevt8/EqXvbWkEj05ctyRP1AW/xLnNlqZFfrHJtuxTse4NRFTY8cP/dc30eE75cCLJ1iB+lt1oVemzFXcE7IFkbD2DwmvuC6AR/VVDbhty/ZqaMShkhWDe9EOL/Xm0f3+gq6rwBvULUKZxhqMkLMZg+Iue2XqAkSjkNCUiwJMReWTsVtm7FMWXp0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWzj0c9zJdoZDcbIeixPVvmNjlCd27CORcJiXMdF1u8=;
 b=oXi0ewI4OFr6/IAA3P3OqP5mkvtYUd8VNksGXXvd1PTxFa57KeZ9Q2CN57aem6o2pL9dEDcV9dEr4B6eEbtRN67snkBgFO+mU8p2rK5Wujr5fszTu/DfeEIzpcAC+GehgePmFkA/4K4Ru0U6ZqdfjMEY6OTECQAhKycyG+9/YxgFJH3yAYiGJySr/6xZvELMPAOQr2/EgejXsmseB5w32W6tKm91ga7BSuT99hgTxLg1y7s3tm4dzimewJWnkVIiWUJO/gUR+LMwC4ZNAToxpxGSueFu4klbzjQYTxnw55FqgtGWpABaiJ+A5n1OV+NCgEZMClQpE+knBgKJ0WNU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3243.namprd11.prod.outlook.com (2603:10b6:5:e::19) by
 FT1PR11MB780136.namprd11.prod.outlook.com (2603:10b6:170:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 06:47:27 +0000
Received: from DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1]) by DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:47:27 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 3/8] libconvert-asn1-perl: fix CVE-2026-126576
Date: Fri, 27 Nov 2026 12:16:54 +0530
Message-Id: <20261127064659.2169695-4-OmkarAbaji.Patil@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 92fa0a00-2a01-4821-b246-08df4c524d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: OR+c2tjsXheBU5X75bFlcvAa7YJpnAE/D+bxNBuyKB9ZnvKiY4TE9YrQVO+ayQ2YmGAqVFC5A3SGrel15spXjwQya1tt8kHkU1jy43dt2YxPpMTy3QP8LekXYPBXqcFoVxQot1RL2VG1m84snJfqrCm4NOMXwvFuLPyVhSd2NC7beB/vfZxER1U3ac5PTmsAnG2gnnROlFquKFlI0xnPbMXPMVijGr/3/zdq2oufDroJYnqm09O8sRRjQjCa4GQi1xBtFPoRSEOwzVuMoWvr2xb5bIEXIia2M7uR7cl+NdMrTjaPswOkigtX6WQaM8/eXUNFEbvKtuZAOED6owgAVAgJM6H1VE9QHGozXQMuIdOFoBUMv6u05s86+uyxOfubQcpqUCy49VxnLJ4tzMJE5ysKcm8SKV6wTmBHcHvxUZ0fqkMnS62OYGjJE3mG4rr1mqEkQfKmi9NlKy+CVole3StVwtn56lsm0uzrokWZFln+LNTyYVY7d9N6MOuCo5MYXVwq0W8ebj4Qv/SIVYYqOJB37UNhXs7mmBADEGPi03BDRLFZKa5FCP9HnxRp8+ZVq4MqdkGdqVHD1Qow111TzQxirp5RRnVE0j4Ac73UtnBgIeEfYl3wwdTkA+1uv3kY3rxbLmCwjyV8Vf6hlw2XTr7rYtd5cN9RWYNy/+Y2+Xd36h8RFfUXSICUZBDod3mWGEj+QhcVTyMS6zZ84QmnuudJUC7gFDmGdg7vqQy2QRQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bAZRXT2CX2M/hHLWIsDmtdy6ynapbBxzehSJpPq+8KOxAkuTQMT1m/5QJWTz?=
 =?us-ascii?Q?BqzVpPsg9hf4uCat9drZB5pupEKXxThT3pPHlHEYiRIQEDpQXWNL/4oyVP8N?=
 =?us-ascii?Q?um0bOy5qczSnFShoRN/FriwzFnkuWQPLXUyLNaHL1qTh3AkrPs8fAY8sy4el?=
 =?us-ascii?Q?U8qY+GJjJxMAripEP2Akub7s7TZ15oR1kHec+70Wht2fknt1sPFuchzuu1O0?=
 =?us-ascii?Q?iAjUla/WqXJOQY83S4hm9wM05udeqXWk9EZrlDJdhVU9jPuFGE+mr5QWHwHa?=
 =?us-ascii?Q?5wDgoiwDtDKu+XgJHkT+nBG0wg1FqgxINZX4T/IhwNy4SaZC8R2/iO3B4u9R?=
 =?us-ascii?Q?g3kbecIcMitbu1omIpAgDvW1DKf89fhZqKisUGJaj90Mu6vEumFeqiNTw47M?=
 =?us-ascii?Q?WlXzuge4hXrtByFvfJZUkg+nk/c7ev5Dodwg5A0u82nSPEBeRdj9XqiJalk5?=
 =?us-ascii?Q?x0DRIaCiDweCTckCkpc6cKROekoOQCWhVtRg0FRv5zoZ8MQUnefoCWJZpXRW?=
 =?us-ascii?Q?mwGp5K2CgT1GJiLZnUn3vKQdsqt+Ft+DMARyccLKlf03rV0IFwWMEk3WIbl7?=
 =?us-ascii?Q?MA3jJJ9gA5qXwqphgk+cMH1V5lyZyB7zSfKVtMw0lbo7P0dU72kaz9HqeafI?=
 =?us-ascii?Q?5rdBfNFdJxPmc8lyeI6ibaSY8BfzHr8Of/jl1SdDciRmNsbaikNOap5W1VFU?=
 =?us-ascii?Q?2vYz/K3/IwrFGaPrYy60gwJzDUPGUnBT4B3vDoIW7AS7iV6N+U3xMIMrdBnf?=
 =?us-ascii?Q?XH08f2Z2v0tUGmglD1SE140W2Ls4tgHuHQhxkSVtLMk+z9bWm3QV+8VMxe47?=
 =?us-ascii?Q?ln3aBlcxA2FE7j6am22MPXMHXEv48jyPFSlJBHu8wFrHpDvVInGd13nokyT4?=
 =?us-ascii?Q?/YM76t7KjNjE2N3+dL6gocmrC9GNgMGIIFwQvVv9JAiijN2tWhy8scuq1Vmo?=
 =?us-ascii?Q?bUDE4qyMZEL020aeNCq4en6/aj/4uATwAODYSP1wVitCKT8Tn9ODXz5fMKRj?=
 =?us-ascii?Q?1LnOlX+kLmC1cHU6AYBFjTLEu0T/EJPCXSHB1oOzoojT9oiGvw2QVaNs+YRW?=
 =?us-ascii?Q?2KtHpMuJgZytD61J4l29xp9uAoBjAzTfTJmPZlMCpw0ukPonhlHiOunyfNYl?=
 =?us-ascii?Q?AnaUY3CQ19Mm8iLrC1kIlhrsmY/XI/Gu0N5DfaUM2Db/KITAFf9dCdbxxki+?=
 =?us-ascii?Q?BG4xxKpn+mvQ7q7Ig5KRxTe2sJNWc++apdDzQ67gwrPkjHqHY1pSnYtB/s0y?=
 =?us-ascii?Q?sKZS5GF5WdYqvpoXm5wD64XCes3MgdDwP+v2LSshZCTaUm/r0a9K7MkbyysP?=
 =?us-ascii?Q?QlA0o1dBifVXugXR4PB5kkI5NnjqgTb4oG1UiEJCpDkKO6ra4yg1tfDiQj3n?=
 =?us-ascii?Q?39/TuOekZc1/rU40cPp7Q20+V7z7k0Yh2JlLMqja6hPlTRVi/O/ddDQE9nUA?=
 =?us-ascii?Q?6BhIJXXvkQmk98QEVl2h61LTQBFhauHMiTYOyplXI1NcyTQEPaCmG9yWl40T?=
 =?us-ascii?Q?5PF46r64H+Pmt78pQmaQTfRm5Vajr0bsB7pgCn8gYc1tOSIFcmVnw2l5U6jU?=
 =?us-ascii?Q?BkQzxnwVF3UyK4XLqxDQcOSRbO9z3w6Nfe6FmvMW7N/LSHD06P9CKcRPrIRP?=
 =?us-ascii?Q?BgfB31DQki2pGLAMzrXjovqoyZOYmPhgW5vZWVKVTzWKVIKwUJLhVbxEY8JZ?=
 =?us-ascii?Q?X4HjV3VXT2C6HtyBV4VqxpIlkwO1CRqyzdwTyeRfJqoUpxK6rgFVTCTM3/uD?=
 =?us-ascii?Q?oXU5gbRzIOfeKwYrbRFSzjUHHKAe67o=3D?=
X-Exchange-RoutingPolicyChecked: BDqwpl+3hMgdH58zLg2rPMu1wjFR3Vosp1py263e2dVyQQSfE7Y1vlVhhLjUsRYf9R1K6gxPd4X4YreGp3jY5xFUqwGCTXLq5MzzeqEl7A1fNpIa8bQD7WhhyyCuvNXmUFPn3I0DwsRqkubkrdk0fFG9lfLRRwXf+0XNZXqxBkdVwkcPhOG6p5FuwW/si2eTHYoftAz9XQ8bMm/y0EFj4QG2VVQ5ZeLVVTw14jRwweR4cdxXShwesqsRsuG7TsKqpCwAKWJyyQdGixziG4stpUWRFXhhjYngLXv2p14wqh5KFU6HvsUlzFKS5sgAqQRFBWxSqTSfZJvqvkrRBt4qDw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fa0a00-2a01-4821-b246-08df4c524d28
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:47:27.7882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/5zZ0V2GPcVnMUz78hT4Dm0nZQi2AxAJ/eDfbRVkHcetjHmYkWSuKe3pNbkbuVEXJ20cDnlBBC0piR4KupCIgY9mjFLaMdyiah6LOeIUt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB780136
X-Authority-Analysis: v=2.4 cv=R5SWitRX c=1 sm=1 tr=0 ts=6b092781 cx=c_pps
 a=TLRaRVVo73tAgr2tZ40rpQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=sZr9-Sand4_KaS_hrTMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kG2Y9d7CUgJoxJOk4cEvAbAbGxEhL7Ft
X-Proofpoint-ORIG-GUID: kG2Y9d7CUgJoxJOk4cEvAbAbGxEhL7Ft
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX7dpZ3yEBLVl+
 B9vNwiU+5i2pPN/VHFIv6HoI0d8F3Shl6gGyQZJQvkVJ0bDIjO+48tEivsZ2AZUQGMXfvsgi38x
 ElDuWGe6Sq7ihAwFMBrvGN3pPiyNv4MlTIL11dNgtNqptn2ts+8b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX8d20A5rYzhWC
 6mIj/mImwW8CVSnDoYXi441cAOMfuMOnH3hwuXYHzBIbWGcDAW8Y1FIm8MPSSdv4zlKKh+8zKlI
 SyV7enevTWHbMVYJVtLJ4Ot7geobf7doqLnNgeUceYQHFa4TZkMOLXgXsjE4jdCCBq0STvJ7JBi
 eVvj89ezmCuVfm2Blt/Px59D9TMh4+QpNK/dVHoJFNvqiOv0TCK5e64IplU0NZsnXm4lNpCBetc
 2lDc+VmQ243C5mE0Nepvd9i+xqexhb7gDlT9+HEp2CZgJ9s68F71HDtdNvOek6PxMYhUODBz4Zw
 WyM9MqBjfoXxSx0+z61yAS1JsFYAYfE2LUHkf3dDRDq/Lk2LfUdN7GIawr/L+XZAaHtfwwW6r5X
 +N8cyeYHN8+ftV8CA/0f9v2ARg3C4QlGC2029NdR5ZXb+h3Y1r3KSB976S5VA9rbIGgHa2aQvVJ
 dv1XGemEsFd9+xW5+Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 06:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251345
Content-Type: text/plain; charset="utf-8"

Convert::ASN1 versions before 0.37 contain a
flaw in binary REAL decoding that can lead to
CPU exhaustion (DoS). A specially crafted ASN.1
value can cause the decoder to process large
portions of the input repeatedly due to improper
exponent length validation, resulting in excessive
CPU consumption.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-126576]

Upstream patch:
[https://github.com/cpan-authors/perl-Convert-ASN1/commit/6158dbb33cc3d248a95b4ab4948a135e18141b51]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../CVE-2026-126576.patch                     | 125 ++++++++++++++++++
 .../perl/libconvert-asn1-perl_0.34.bb         |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126576.patch

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126576.patch b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126576.patch
new file mode 100644
index 0000000000..147f8dfcad
--- /dev/null
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126576.patch
@@ -0,0 +1,125 @@
+From 6515eb600911c846c0e98651825d8583ff99e689 Mon Sep 17 00:00:00 2001
+From: Timothy Legge <timlegge@gmail.com>
+Date: Wed, 11 Nov 2026 03:43:20 +0000
+Subject: [PATCH 3/8] Fix CVE-2026-126576: _dec_real bounds-check expLen and
+ fix mantissa length
+
+Add a guard rejecting expLen values that exceed available content bytes,
+preventing buffer overread. Fix the mantissa length calculation to use
+the actual header overhead (1 for short-form, 2 for long-form exponent)
+instead of a hard-coded 1. Add tests covering both cases and correct an
+off-by-one in the max_int_len pod comment (4096 bytes = 32767 bits).
+
+Reject exponents longer than 4 bytes; they were decoded as a bigint
+and made pow() compute an unbounded exact power.
+
+CVE: CVE-2026-126576
+Upstream-Status: Backport [https://github.com/cpan-authors/perl-Convert-ASN1/commit/6158dbb33cc3d248a95b4ab4948a135e18141b51]
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ lib/Convert/ASN1.pod        |  2 +-
+ lib/Convert/ASN1/_decode.pm |  7 ++++-
+ t/23dec_real.t              | 57 +++++++++++++++++++++++++++++++++++++
+ 3 files changed, 64 insertions(+), 2 deletions(-)
+ create mode 100644 t/23dec_real.t
+
+diff --git a/lib/Convert/ASN1.pod b/lib/Convert/ASN1.pod
+index 3e9614b..dc98a8c 100644
+--- a/lib/Convert/ASN1.pod
++++ b/lib/Convert/ASN1.pod
+@@ -167,7 +167,7 @@ value. Defaults to C<1025> (enough for an RSA-8192 modulus, which requires a
+ leading sign byte). Set to C<0> to disable the limit; negative values are
+ rejected as invalid.
+ 
+-  $asn->configure(decode => { max_int_len => 4096 });   # allow up to 32768-bit
++  $asn->configure(decode => { max_int_len => 4096 });   # allow up to 32767-bit
+   $asn->configure(decode => { max_int_len => 0    });   # no limit (not recommended)
+ 
+ =item null
+diff --git a/lib/Convert/ASN1/_decode.pm b/lib/Convert/ASN1/_decode.pm
+index 3d10bb3..72db28e 100644
+--- a/lib/Convert/ASN1/_decode.pm
++++ b/lib/Convert/ASN1/_decode.pm
+@@ -369,10 +369,15 @@ sub _dec_real {
+     else {
+       $expLen++;
+     }
++
++    my $overhead = $estart - $_[5];   # 1 short-form, 2 long-form
++    # an exponent over 4 bytes would become a bigint and make pow() run unbounded
++    die "REAL decode error\n" if $expLen > 4 || $expLen > $_[6] - $overhead;
++
+     _dec_integer(undef, undef, undef, $exp, $_[4],$estart,$expLen);
+ 
+     my $mant = 0.0;
+-    for (reverse unpack("C*",substr($_[4],$estart+$expLen,$_[6]-1-$expLen))) {
++    for (reverse unpack("C*",substr($_[4],$estart+$expLen,$_[6]-$overhead-$expLen))) {
+       $exp +=8, $mant = (($mant+$_) / 256) ;
+     }
+ 
+diff --git a/t/23dec_real.t b/t/23dec_real.t
+new file mode 100644
+index 0000000..6d7d1ef
+--- /dev/null
++++ b/t/23dec_real.t
+@@ -0,0 +1,57 @@
++#!/usr/bin/perl
++# Tests for _dec_real exponent bounds fix (F4).
++
++use strict;
++use warnings;
++use lib 'lib';
++use Convert::ASN1;
++BEGIN { require './t/funcs.pl' }
++
++print "1..15\n";
++
++my ($asn, $ret);
++
++btest 1, $asn = Convert::ASN1->new;
++btest 2, $asn->prepare('r REAL') or warn $asn->error;
++
++# Helper: build a BER REAL from raw content bytes.
++sub make_real { "\x09" . chr(length $_[0]) . $_[0] }
++
++# --- 3: zero-length REAL decodes to 0.0 ---
++btest 3, $ret = $asn->decode(make_real('')) or warn $asn->error;
++btest 4, $ret->{r} == 0.0;
++
++# --- 5: valid binary REAL (1.0 base-2: first=0x80, exp=0, mant=1) ---
++# 09 03 80 00 01  -> binary, exp=0, mant=1 -> 1.0
++my $one = make_real("\x80\x00\x01");
++btest 5, $ret = $asn->decode($one) or warn $asn->error;
++btest 6, $ret->{r} == 1.0;
++
++# --- 7: expLen > content length is rejected (buffer overread / quadratic) ---
++# 09 01 80  -> binary, expLen=1, but content is only 1 byte (the first byte) -> invalid
++my $overread = make_real("\x80");
++btest 7, !defined($asn->decode($overread));
++btest 8, ($asn->error || '') =~ /REAL decode error/;
++
++# --- 9: long-form exponent off-by-one fix: valid encoding gives correct value ---
++# Binary REAL, long-form exponent (bits 0-1 = 11 = 3 -> long form):
++# first = 0x83 (binary, base-2, long-exp), expLen-byte = 0x01, exp = 0x00, mant = 0x01
++# -> 1.0
++my $longexp = make_real("\x83\x01\x00\x01");
++btest 9, $ret = $asn->decode($longexp) or warn $asn->error;
++btest 10, $ret->{r} == 1.0;
++
++# --- 11-12: a 4-byte long-form exponent still decodes ---
++# first = 0x83, expLen-byte = 0x04, exp = 0, mant = 0x01 -> 1.0
++btest 11, $ret = $asn->decode(make_real("\x83\x04\x00\x00\x00\x00\x01")) or warn $asn->error;
++btest 12, $ret && $ret->{r} == 1.0;
++
++# --- 13-15: an exponent longer than 4 bytes is rejected; decoding it as a
++# bigint would make pow() compute an enormous exact power ---
++my $t = time;
++local $SIG{ALRM} = sub { die "timeout\n" };
++eval { alarm 10 };    # fail rather than hang if the check is lost
++btest 13, !defined($asn->decode(make_real("\x83\x05\x01\x01\x01\x01\x01\xff")));
++eval { alarm 0 };
++btest 14, ($asn->error || '') =~ /REAL decode error/;
++btest 15, time - $t < 2;
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index f4460bf324..9de25f3f73 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8
 SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz \
 	   file://CVE-2026-126540.patch \
 	   file://CVE-2026-126568.patch \
+	   file://CVE-2026-126576.patch \
 	   "
 
 SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
-- 
2.40.0

