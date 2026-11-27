Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11643.1795762048045356516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 22:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IKSZnPJB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57914e973c=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR6RFvx505046
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ge9Yp8DNM2VDu9RwtOF1StEZBcuxiVK28wsbIo9Q6ow=; b=IKSZnPJBjcF9
	l0Pro4L+SYvkPCcwTUsYOm+0WfOjBNu6QVd/+exRwTbp8cgkB+ZmpT5WdDDT+UxR
	O55GEkFPSIskDrT4ptgt9SMV68Yg4AxVRvzofPZIDddP9ED/Gel20zR67f+LC5v+
	ZIZwR1Ha6iymaRM4vEbicgZHbwEABt2sWXSIGkGR+ojXK3P0RzsnVWTqfwj6pnI2
	2i3cUxi3FZCKvwfTKyYAnh9sVa+xfdu/BIS1B7Fs84TTMsOw08fEhnhljCy4dPAa
	0fLH/nQGUbaF0E5qUb9t5o7GKTcqrAAsFXBpQAM9KhbN5944KR99N5pXUILPMO6T
	qnyc4S0glA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023099.outbound.protection.outlook.com [40.93.201.99])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j516wym5h-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2Ix/8NxJ7ypoev9KCNUfUdrjk4tiEBe8xmHa//3EHVy/EeEiw7cE8dibChMRfvh1W/b+sPtMEsYFQ+aOFXUPWU4xqHFM856QTIR2ffbbExsS81bIcXKj3/AYDb9084PVyp59RifSgRDYyvlVSZOV8ccSpEsRw7fQXhCizq314EqgVoMoaUXaONYr1xDXeWawnLMYJDOCjPJntZ5tL0t5Pidi7Isb/ESxDAZ2b/4eC+WGxrC/EJw4ctAutAuAZ+UH3Wuo772y6u90XBqwT5u/TcwtD9/f9H8wFmEtN2fwc2p8+6SVlF80KBT9VuxpvY3zgXdgWU78KpptlbAfF6ELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ge9Yp8DNM2VDu9RwtOF1StEZBcuxiVK28wsbIo9Q6ow=;
 b=txAseUst249ra9xSnDOqisvrjQayPPlTohoOh2J74lFRfge2Tmj1Q/TRxFyNPcPyu+bmyxoEnd1v9ixuOZWBSAOyR86IbjS5uEu5LgmIeSmR0mN5+VzoIEuvjtyluOXNdn4a9890Wa6XPAuAyRhVC6PODKO8I0+M9bgZFohmuDupheb4K4toNsIT4fKawG0J8v2WSem0pSUlPnVZRVKNBVS+1WCunnkN0uJaNhYHNs9S6tmp5pYKMzOrWuWgJ1dB8OX/9JevJq2B3zJUHBgVNhrqSG6V9Y+p485KbFpecHT2aUJHpYLYED7JiRtAq7CSrWUS1rzUFniSJ+R9GNRcMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3243.namprd11.prod.outlook.com (2603:10b6:5:e::19) by
 FT1PR11MB780136.namprd11.prod.outlook.com (2603:10b6:170:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 06:47:24 +0000
Received: from DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1]) by DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:47:24 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 1/8] libconvert-asn1-perl: fix CVE-2026-126540
Date: Fri, 27 Nov 2026 12:16:52 +0530
Message-Id: <20261127064659.2169695-2-OmkarAbaji.Patil@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 04171386-4c45-41a7-1f75-08df4c524b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003|5023799004|11063799006|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 5bWLhHJgNZQi1tIwgNWWdL4EPsY0PXQBGgAbyGo8Uds2wF5pva/fl/Z15p0aZHaUyA+bppuCSiw92UjIj6MHQxGccD4k3IEC10FI0KNCUNpKF/brTRe+KG4lUdWlBbqImWVe9Y7S4S7j4ymVEn2lFI+xDCF3ZRBfjZTx0mQ3WNFvsM4rzkbsYhQ2E302efgVrNR8htPtXfXS+i1/JrGJsvyPD0+26paCzb0ZyX+s30FRPIuvYLqhWo1fB54kfSUwhTb2SHE8/KJTdjPraZqHNHVyBt5FfrH5IOQPPS/wr2+E+kdhDW/Hfl+PonQ+0UD5xSd+IN9VJiQAEDjRl1hVn6OR/cfxjpAVTnRksmboJCbHR+F/d74l7THtmRsnrQ4IbPaAVEx7p2jl1nAbeaT8bOYIzJVmqAet4BBVClt4fGG50qAwUzqcj7BP+eQG08Uw5O5aZM9IlN9nRzGKyFnOr2hikS4K5A37yc8M7AqLJTLvKR03JQOWWa/4/ALZqN341bVZZmm65sSk+NvDtmg1VRZCNUGRgVlyalAacE3JLHGhRw6sW5xoXBn0gGNozKODLtk9yyi/wTTVvmIBuZely3tD55uTd6QqVnYasDsDYizcUSuK1E57DJ76yufNEUA+us2ICesmebYzJYFC9Ton78OUrobYJwAA+AYhXc0Gimk1Yp30ulnIQ5CiUhPIw/asWez0sjhlvLfvhBntKREygvvWX5hIO1xnuN3XMu8wNzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(5023799004)(11063799006)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+M81DCqXRdf7CkIaro7kfbgUnhTruZtbTwWh7zuI98QFNpPyNnF0TS5/K5cm?=
 =?us-ascii?Q?qwbUXqyZB5bQnM3T0MZIWRd3kYtXHgrG2WFfPzS8v1GIGJ1C5m5VgvgN1w7p?=
 =?us-ascii?Q?0GwRq6+WVYl221aqeEVMcGa0kwtg6HN53LS3+0BgzSj8nHCsxvR9J33CId5L?=
 =?us-ascii?Q?Wg13CY/uDGGnVMFLjJdROtuIpxEEfXLxGK8J/YM8V33xmWrlMkFr7nCw8Z2m?=
 =?us-ascii?Q?gV4aet2/XGTq7kPNrVAlFNFEa3UeJYOIcV00iP5Pg/Hio8e3KVUNQ7fnXx2Z?=
 =?us-ascii?Q?g31jkmBghvcs0wzaQzZICoX0lmIRlbT1k3rNy4cVbGZhSZXfAjDFMX5/xoKA?=
 =?us-ascii?Q?Vmqlkhn1J/cv8DZMBZDf1PAy1HcDVRK/ooO+Y6gLI+TQygeiYJuHIMkgWwCU?=
 =?us-ascii?Q?jJNsyT55O5gKiTF/R553cErCHVmYlz9eeapmQbPKJgNbyhaWg0S1O3cIO/6o?=
 =?us-ascii?Q?ylT72T0ggzdZnhskB3wc+L6vqgowkVqixCPCEcM0h8OP5kDEN01Fn0W8pzSB?=
 =?us-ascii?Q?bX+lTqtzSRG47701DN4cSNDuva5dKkbjmnZ8XMRTZ20V2/oB8xq0axG7S78f?=
 =?us-ascii?Q?qYQSaLm32EC0vMgl/Ydf5aB8ng4eDVj9sKPP0dMTqUe1GqBABJVRTUqdpGYk?=
 =?us-ascii?Q?0HlmJJrXXAxOMxdF0CH6dyd3boyQEJ5JYlg8vUXmp+Nraw867HuZw3zm/2QH?=
 =?us-ascii?Q?rYq6QXUt5cXBFjClnxBNw1kFovM0VWV3++AHZt58ef6t3LF75KVpsnV54W+l?=
 =?us-ascii?Q?EoqQCy1kVIyVVebUbLtctNVyJYMLePNvVwJCarbvPOJMT5BRIMzD8lPhgJSY?=
 =?us-ascii?Q?O52TbiDSQggtQtkJxyvKOZ4IsKfjaphiizTvYp8HKG3mrAPK9eAWuC1ifB56?=
 =?us-ascii?Q?5CxaSw8p5VYFSziHpOhCHvnGbFWqXU9oIZoBaymiMUcdwipR146bEt8QkSGv?=
 =?us-ascii?Q?QQ6L5mvnekVeROZL9sniS7Lo8305z4QXQcchXV3lEC0mvxCB8vtlbEuJg/ne?=
 =?us-ascii?Q?mm7AdbIhO/YSBv9yfhys4cmT2rtl11oEVmVwQJJNvgOwX8QiBKG2fOSIZT2U?=
 =?us-ascii?Q?Z19H0T8Z6Xa0LQMIR7BlpYQk9pINyUGG41ntjXqC4BCnlMOrdnuGtdqBu0zv?=
 =?us-ascii?Q?mu2gBvek/yJLifHhNysESDMuAOUXcjfZ9YFxaK6B5VOs7UJQicmWCTZ0UisD?=
 =?us-ascii?Q?qr/gednUx2s0Y4gquiMvPpQlWlsEKXJbace75BFZP6Nm6LdO9EKQa1wplSxF?=
 =?us-ascii?Q?6TIJwPiz4S5WWVU511yfwA1zM5E0+8eKZFrSyHw/GzDIwwFEBpT5rSim1woX?=
 =?us-ascii?Q?KOCohb6r+ccD28KzwqJIogSjhwjAalKIBOeZo7QPLuMTefdFEX7t2iB/aT9P?=
 =?us-ascii?Q?sCe7l5LLSSJbH10scCr5Sj01r6c2b001CAAaXWCZXkFXqTBkLle9wxQelfZa?=
 =?us-ascii?Q?nnSBa968Grg5R7M3QoEwVTu/vtAS3Zzmn3ko7QF/WBqCwcFxO3Kkf7/I79Af?=
 =?us-ascii?Q?OXM0UaQz/DoXzsduTDEGzS78vabVw097wcm25aj97FvsoTUKQDNkW3hJOmKj?=
 =?us-ascii?Q?ty9VA6VNvLf/YZ3HmazHBpc2e/uKQKZm8N69M7/PSaJVXHUUoG/o92+sEK2w?=
 =?us-ascii?Q?jYQN1iBXb0Bg8MHX3YBEt6rU8rSvKCZWJ8slEMQoSlg0HI76xHecagYk0hQi?=
 =?us-ascii?Q?iml/tiuFTaH+Te7IzMNC7jqfczqF+RaxjWtOebuWaqPrUei5Qz0sG1S5keXC?=
 =?us-ascii?Q?ZkwHChMqIO+GdLTE2VVlAiIkKeDij1I=3D?=
X-Exchange-RoutingPolicyChecked: IqmHE+i9c0bILBbouOTwAUZN1LAfNuS+fmjTToKbO9I6YvTTR9j/Kv84vyrNpBBqGkdbtuhMPJG8ixxxdm8PhxCYKhcbrm5guDK1aqODoCq6Vf1WAm80hIcjXbVVX74KfG3iyw+y4Q7KUVT2DqJgXzH0aExZUJmDapVLnbpCuuDoCyW/cgvnq7odUXKBz68QksTaifxggiUfX0J0FEtHKQqXM+1wMjcyHv4J+NFE0+GQfk4WDK1vqO34/4xHkYml4XZ0z0uUNuu7kASlRFPrWnwfVbHNvXiuNP+nSLLA6FyZShbN+GS6k64oMvTQXf+nVfkCvxEJmxNx9+mKqB7OFA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04171386-4c45-41a7-1f75-08df4c524b56
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:47:24.7083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ak4BNTszQqKNUjYPKga/4bmeMdtWzECP2dwOW5nNV3K07S67yQWHBIc3rt4n4A4zEWjDu+2/7JFgNfrqfdyV/NMng1/2CEHgjqaNbjakyNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB780136
X-Proofpoint-ORIG-GUID: I99ccztLPME73y2SB5nA4bGkkNvHyfDK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX0MVrX28yjw7p
 zUf30SzaSY4dCXVNR2Im20/4vvGzyXlo59MLJQpvELJxK43cnbji5R5TXk8sW3UfRqZhBW6SBJu
 wp4RiaVY6iqjWc3+VqQNCuvUQTmGlYdG1Tnv/D034tratnbDxo+3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX409jPqomvNH/
 teO455mz5bnQMEK8+gf+ncP2cXSRki2T3VSXy3zU5E0zwBtaGn9Mp3xmUsB5YoqXfkyCRyp9MWL
 u0PZnGhfYVqnonKkaYClzp5m6ArEAHTb4wpE9auJdvn1YhomIUI4jp+oEQiIHuTDrGLeEMIP5uj
 qFCO4eUwDvVrSOmbTM87mex0qoc7OovbA5/qVzLuN1e5sAhnF2cNzA6GlaAU4kEjleGPBgIcqog
 vq4O2su8HERyZohjGPvR6Mhhg1rZKmr+7dnjdhi4/3y1gI0z+n6w9bUXJp1ZhpL654v4gVH95Ol
 yuaSNpGa2feJDfA0+wCkG+Xuqv+AD2E9Q8g4oDqGYSAZg66O/ihZU1QfhDcvItuEl1EnZZY9oYi
 swbjM9Mina6PHY/CDdNVT6Dcjz4QUp9/jnZ2ZgF5dRH4UTUBmSESe8Rrmh9t3OkzChmrWr1gTF+
 QixqTvGAj8NouyhfouA==
X-Authority-Analysis: v=2.4 cv=bofZl0ai c=1 sm=1 tr=0 ts=6b09277f cx=c_pps
 a=ajv5h6Eily4lkhfMD1AUMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=SM-Wd2BG5h-KDB35ZrgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: I99ccztLPME73y2SB5nA4bGkkNvHyfDK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 06:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251343
Content-Type: text/plain; charset="utf-8"

Convert::ASN1 versions before 0.37 for Perl allow CPU exhaustion
via quadratic bigint loop in os2ip. Every INTEGER or ENUMERATED
longer than four content octets reaches os2ip, which iterates over
each content octet with $result = ($result * 256) + $octet. Each
multiplication operates on a bigint that grows by one octet per step,
so decoding an n-octet value takes O(n^2) bigint work. Nothing limits
content length before this loop runs. An attacker who controls the
decoded data can exhaust CPU with a single oversized INTEGER or ENUMERATED
value.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-126540]

Upstream patch:
[https://github.com/cpan-authors/perl-Convert-ASN1/commit/49b362c527e0af05fca9be1e97e4a340d95afa75]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../CVE-2026-126540.patch                     | 147 ++++++++++++++++++
 .../perl/libconvert-asn1-perl_0.34.bb         |   4 +-
 2 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126540.patch

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126540.patch b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126540.patch
new file mode 100644
index 0000000000..e50a3444c3
--- /dev/null
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126540.patch
@@ -0,0 +1,147 @@
+From d8b5b05682280773040e53adc005d15b977b46a1 Mon Sep 17 00:00:00 2001
+From: Timothy Legge <timlegge@gmail.com>
+Date: Wed, 11 Nov 2026 00:40:45 +0000
+Subject: [PATCH 1/8] Fix CVE-2026-126540: cap INTEGER byte length to prevent
+ quadratic decode cost
+
+Add a max_int_len decode option that limits the number of content bytes
+accepted for any INTEGER or ENUMERATED value requiring big-integer handling
+(> 4 bytes / 32 bits). The default cap of 1025 bytes accommodates RSA-8192
+moduli (8192 bits + 1 leading sign byte) while blocking larger inputs.
+Set to 0 to disable; negative values are rejected as a hard error.
+
+  $asn->configure(decode => { max_int_len => 4096 });   # allow up to 32767-bit
+  $asn->configure(decode => { max_int_len => 0    });   # no limit (not recommended)
+
+CVE: CVE-2026-126540
+Upstream-Status: Backport [https://github.com/cpan-authors/perl-Convert-ASN1/commit/49b362c527e0af05fca9be1e97e4a340d95afa75]
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ lib/Convert/ASN1.pod        | 12 +++++++
+ lib/Convert/ASN1/_decode.pm |  8 ++++-
+ t/20integer_max_len.t       | 71 +++++++++++++++++++++++++++++++++++++
+ 3 files changed, 90 insertions(+), 1 deletion(-)
+ create mode 100644 t/20integer_max_len.t
+
+diff --git a/lib/Convert/ASN1.pod b/lib/Convert/ASN1.pod
+index 746b538..4eb4a5d 100644
+--- a/lib/Convert/ASN1.pod
++++ b/lib/Convert/ASN1.pod
+@@ -158,6 +158,18 @@ than 32 bits), they will be decoded into big integer objects. This option
+ controls the big integer class into which the objects will be blessed.
+ The default is to use Math::BigInt.
+ 
++=item max_int_len
++
++Maximum number of content bytes accepted for an INTEGER or ENUMERATED element
++greater than 32 bits before decoding is aborted with an error. Prevents a
++remote peer from causing quadratic CPU usage by sending a very large integer
++value. Defaults to C<1025> (enough for an RSA-8192 modulus, which requires a
++leading sign byte). Set to C<0> to disable the limit; negative values are
++rejected as invalid.
++
++  $asn->configure(decode => { max_int_len => 4096 });   # allow up to 32768-bit
++  $asn->configure(decode => { max_int_len => 0    });   # no limit (not recommended)
++
+ =item null
+ 
+ The value to decode ASN.1 NULL types into.
+diff --git a/lib/Convert/ASN1/_decode.pm b/lib/Convert/ASN1/_decode.pm
+index 766a3d6..3d10bb3 100644
+--- a/lib/Convert/ASN1/_decode.pm
++++ b/lib/Convert/ASN1/_decode.pm
+@@ -281,7 +281,13 @@ sub _dec_integer {
+   my $buf = substr($_[4],$_[5],$_[6]);
+   my $tmp = unpack("C",$buf) & 0x80 ? pack("C",255) : pack("C",0);
+   if ($_[6] > 4) {
+-      $_[3] = os2ip($buf, $_[0]->{decode_bigint} || 'Math::BigInt');
++      my $max = ($_[0] && exists $_[0]->{decode_max_int_len})
++                  ? $_[0]->{decode_max_int_len}
++                  : 1025;
++      die "decode: max_int_len must not be negative\n" if $max < 0;
++      die "INTEGER too large (length $_[6] exceeds max_int_len $max)\n"
++          if $max && $_[6] > $max;
++      $_[3] = os2ip($buf, ($_[0] && $_[0]->{decode_bigint}) || 'Math::BigInt');
+   } else {
+       # N unpacks an unsigned value
+       $_[3] = unpack("l",pack("l",unpack("N", $tmp x (4-$_[6]) . $buf)));
+diff --git a/t/20integer_max_len.t b/t/20integer_max_len.t
+new file mode 100644
+index 0000000..06221ac
+--- /dev/null
++++ b/t/20integer_max_len.t
+@@ -0,0 +1,71 @@
++#!/usr/bin/perl
++# Tests for the max_int_len cap on INTEGER decode (F1 fix).
++
++use strict;
++use warnings;
++use lib 'lib';
++use Convert::ASN1 qw(asn_encode_length);
++BEGIN { require './t/funcs.pl' }
++
++print "1..11\n";
++
++# Build a minimal BER-encoded INTEGER from raw content bytes.
++sub make_integer {
++    my $content = shift;
++    return pack("C", 0x02) . asn_encode_length(length $content) . $content;
++}
++
++my ($asn, $ret, $ok);
++
++# --- schema used for all decode tests ---
++btest 1, $asn = Convert::ASN1->new or warn $asn->error;
++btest 2, $asn->prepare('n INTEGER') or warn $asn->error;
++
++# --- 3: a 5-byte INTEGER (> 4 bytes) passes the default 1024-byte cap ---
++$asn->configure(decode => { bigint => 'Math::BigInt' });
++my $five = make_integer("\x00" x 4 . "\x05");
++btest 3, $ret = $asn->decode($five) or warn $asn->error;
++
++# --- 4: a 1025-byte INTEGER is rejected by the default 1024-byte cap ---
++my $big = make_integer("\x00" x 1025);
++$asn->configure(decode => { bigint => 'Math::BigInt', max_int_len => 1024 });
++btest 4, !defined($asn->decode($big))
++    or print "# expected decode to fail on oversized INTEGER\n";
++
++# --- 5: the error message mentions max_int_len ---
++$asn->decode($big);
++btest 5, (defined $asn->error && $asn->error =~ /max_int_len/);
++
++# --- 6: exactly 1024 bytes is accepted by the default cap ---
++my $exact = make_integer("\x01" . "\x00" x 1023);
++btest 6, defined($asn->decode($exact)) or warn $asn->error;
++
++# --- 7: raising the cap to 2048 allows a 1025-byte INTEGER ---
++my $asn2 = Convert::ASN1->new;
++$asn2->prepare('n INTEGER');
++$asn2->configure(decode => { bigint => 'Math::BigInt', max_int_len => 2048 });
++btest 7, defined($asn2->decode($big)) or warn $asn2->error;
++
++# --- 8: setting max_int_len => 0 disables the cap entirely ---
++my $asn3 = Convert::ASN1->new;
++$asn3->prepare('n INTEGER');
++$asn3->configure(decode => { bigint => 'Math::BigInt', max_int_len => 0 });
++my $big2 = make_integer("\x01" . "\x00" x 1500);
++btest 8, defined($asn3->decode($big2)) or warn $asn3->error;
++
++# --- 9: cap of 10 rejects an 11-byte INTEGER ---
++my $asn4 = Convert::ASN1->new;
++$asn4->prepare('n INTEGER');
++$asn4->configure(decode => { bigint => 'Math::BigInt', max_int_len => 10 });
++my $eleven = make_integer("\x00" x 11);
++btest 9, !defined($asn4->decode($eleven));
++
++# --- 10: cap of 10 passes a 4-byte INTEGER (small native path, no os2ip) ---
++my $four = make_integer(pack "N", 0x7fffffff);
++btest 10, defined($asn4->decode($four)) or warn $asn4->error;
++
++# --- 11: negative max_int_len is a hard error ---
++my $asn5 = Convert::ASN1->new;
++$asn5->prepare('n INTEGER');
++$asn5->configure(decode => { bigint => 'Math::BigInt', max_int_len => -1 });
++btest 11, !defined($asn5->decode($five)) && ($asn5->error || '') =~ /max_int_len must not be negative/;
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index c1d83139d7..f4aaa4f579 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -5,7 +5,9 @@ DESCRIPTION = "Convert::ASN1 is a perl library for encoding/decoding data using
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz \
+	   file://CVE-2026-126540.patch \
+	   "
 
 SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
 
-- 
2.40.0

