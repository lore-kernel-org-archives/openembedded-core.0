Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16011.1793097039463802472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 03:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qMavA0tw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=476085ac17=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5auv41606484
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 03:30:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ZqH3oKYeF
	as+Et4Mk1V+jxhATV4mYPTWTPIDo1Dh8n0=; b=qMavA0twvGCljWpldvu3UBPSf
	DaEZRuUbgGST0kvEk4GTogR3l8W8uuxU/jb3I2Pjs+ocLloqk/9e8ks6qoa3O3KR
	FyegQqkAqpUxFVSCvqzkDK+j/hg1otTo2fTujmYu4XWcVk5QfgiRAxVLHLJXMl8M
	e83vgLoQ/0fFAHL/oIroZJA0MKg2i2eNYb/Tni1N676d5cuYPOrv2yjjfh+exTTF
	ZFGL68V1HPTPUoMnf3fDf0JkC9GhAmlDxshvE7x4YRs5ZxDAB4Wnb4L1JLv0HXNm
	FrKT7EQuaPJa4Nfcdwg/gbfrSyFWOCy8LoPr4CxL37fldGDIt7lwfTj0p8jdQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023132.outbound.protection.outlook.com [40.93.201.132])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hgqy1kv5y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 03:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yw0Sup0lRFmRGS2RHlGAZapMs+YiRGQeC2hsbymISrnDT7tL3IRtw9rzZ+LHgx7wzRLv0zCeLCWRgGnjuqgmubYBVtaPGRADFMkViU6iMUndX6j6ZDM3oDxjnC4yZAJ7IbA71oLe/elcBfqv78azzatJ/fENfdUgihLdjY7+K6kd84w/ebWcgUGQ/LrT11IYTPuTtTbQaI6nVvuaTSDZopO0jlozlnzvKjGkZW4LatHO1q8H92vHyvR5s5J5HPYlsW/9jtMh7yqUzHin4SojpeQCJCpqJej4Vx0+CmEmo2SdMVG+iig3x+n0hA4GmneocAIiNHbUMLLFhs81ZXlLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqH3oKYeFas+Et4Mk1V+jxhATV4mYPTWTPIDo1Dh8n0=;
 b=kdkcmGKMKLOykSdLI3F4/wiabppmTpkveTazzXUaJ8e1447Uq8LiNjBdCE/ycz0tscIX1GGM7eGoIv3jdILc3D9pxaxjyvXh/73dj6RFuKjwB27jK7GhM6qFYcpO11dSo6TECBjCt6B/Wzkwnir03uIt4ZJhZtNFLgu5V4akrn6MJ0Xi0n6pwIQUAHcQKRB8KEBwd1LtEmRDrNmDbVkAibgubLBaeF7yXks4/DepFaoZSMAy1+BcWMm0WABIIHlQZJePtbJawkUGXxBr4hGdAm4NIrMDeIKAZTpZg6bPuyBc4WNtpqZhxkdQ+Z2xefJK7XC1nWm64NlLbBAxNv0lNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV0PR11MB195454.namprd11.prod.outlook.com (2603:10b6:408:3ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 10:30:36 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:30:36 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.kokkonda@Windriver.com
Subject: [blacksail][PATCH] gcc: Fix for CVE-2026-95619
Date: Tue, 27 Oct 2026 03:30:14 -0700
Message-ID: <20261027103014.3993276-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0020.namprd21.prod.outlook.com
 (2603:10b6:a03:114::30) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV0PR11MB195454:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2121e0-47f8-4d6d-d2ba-08df3415568f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|6133799003|18002099003|261026140227099003|3023799007|10067099003|38350700014|11063799006|56012099006|261021121427099003|5023799004|261009223027099003|261022105027099003|261022075727099003|261021123027099003|261026121527099003|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: 0+ID7JOQxCfP+W0CIlNDjjNQeu9fztaAh53Ktc/NIm7mvj2X8799jBS7XijN0FMNHSZPRjDLjSfUd2u6JYNQBjJ/HqSxu6MxnkSwtJfOFzocUhXJJt2Fswp9wQXpDWCq7WxCG45BQufs7CmfX3IzkDJHcEehTX2X+VwD6ghizR4oshSs81aaK2hXD6MSWhoRFFl1wBL+zpDKpeOEA3c6FQ3YzDEKeuEd1X+SCgkUITZ0zjHoC1khcQuRp0mhlfuFTlD+cIyvKP1vp3fzIhnSv77TH3YxfveQwGVn6xEAfqfROt98vtIXVXdZpkZDEh6PppatGFYISt+D6eC93vS5IGTp3u+rN3aveh8JCgeqFGU/wWpTw+YGSYFAAQVsIpLcc30PU54uyQwFOQ3FZfbI7oWiiBP5ac1JOJJV/wH84Bl+ceLwyqxSJaTFGx1wU/pwRkyp1uAbnvTdET8g+sicABtoVZ2ZtaXDm2dJ/Y9COQj3AW3kyrcgxjBTfpvtSR7/dIoOfYwXE8qpK/R0DiUmJdHHzkSUVTOMjQUoQRuZj+4qJP2N87wnRMjgB9nEOIytkg4AwYYlvHK+cnTkkIUMNacHhyjiHiPghe9XIjdlLE7hj44CPgQU6NPa20bn42PGEeH0yZI5BLlKeuF0oPw/IGutwTukx6S0KbAYmXSN8OAXDpDhi2J8qayaYgCsBXSKwhswwdE0j6qzEeNWkanBWV9Y1NmuZISGUcV6iiNnMdg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(6133799003)(18002099003)(261026140227099003)(3023799007)(10067099003)(38350700014)(11063799006)(56012099006)(261021121427099003)(5023799004)(261009223027099003)(261022105027099003)(261022075727099003)(261021123027099003)(261026121527099003)(260925021911599003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6pNLnZpi/GN3fT/SxqQ7CbV41wv062uljPiEW/sLi2Eso9aX1w22lHvl2YrT?=
 =?us-ascii?Q?pA2tezFtPDQARvaqZuE8/p18NKr6mmkwkTA06gOf7EKE1eNy+R/YpiHzrTUE?=
 =?us-ascii?Q?4UCAsHxfQFRNbszquqUdhrE/HyRO/rhdUbke3goZ96LJQ5sY+rOqr8TJAxiv?=
 =?us-ascii?Q?RWbUwblFXQgVhJUeNi9o46yNAbPsFenVjLrEIL3vqC8fvbwSJd215GdZTNPW?=
 =?us-ascii?Q?Bj2nU2cJCyJvJrtnFfelb7vPgG40Z8jdyUEN/tEpgsQZ1mdq2/Y9t+4v/r8M?=
 =?us-ascii?Q?LyafXxAwPWeMbvt0MBgBaNy7UC0OIbk3uJo4Kg3Bu6/6ujBalv0+3dLG34Th?=
 =?us-ascii?Q?PpnPQSX2vpYctubvxNzHbBPUwgPEbYd0a7nroUgG3sGijE8qeBzG/o4WnMii?=
 =?us-ascii?Q?mbwBdFWLkxImF+7OUlRkj3zqw50XssLuDcILQB4/ev3Qzg+mix3yVxTblxLH?=
 =?us-ascii?Q?KptGESTIGyqPfnIasHgQ8ZCkiCt6iE3b2AeTBc4Mi8+w+fTTtaozIvi99DJJ?=
 =?us-ascii?Q?LQ45M+r8QJmDW+QGuIYITPOOp6Yb0nP7/GggowoxOVxEWEdG4XLMT0OudNNT?=
 =?us-ascii?Q?oXmIdUNYCdT/urXjsA0nXfqRVTe6PHtN9pIs4HN/9kN2yuvV4xpQpV9HKSGc?=
 =?us-ascii?Q?55/I8a/BKcazGisdJtvL+XAWYgqUhnUputXFMwDM8WhH0lNrkb6MUT1WkNHJ?=
 =?us-ascii?Q?2mLBJiNdNJRX4aQsq+hgOnQuYrOpFIC9RS7v7RgTAO6P/AcXawuk9rmuXUE5?=
 =?us-ascii?Q?9rHTDeQuYD5uLkoe9fwVPXcCU198sE6onzFQHDrMACHOPjsMFbOq0247BWIS?=
 =?us-ascii?Q?hBS16nnaDH95oNKDSED+RjzfoQW15dk3fq8up/44I3Dtnq5+kMvbmAUzq6S5?=
 =?us-ascii?Q?DDkGvH1cfK6hLlZn6zSfzpuJ5dGai1qBoyKcB8DuZu7+aKfUdHtB8EiSjtrs?=
 =?us-ascii?Q?TpjQ+asr7oAlEqGUHC8DSOWHZBQhl7xLGMtcALwPC9wduSJU7vhfiJ7gXBGC?=
 =?us-ascii?Q?uLosma9tgAPjyvlqLNr8+tlr+cBkGJDhLXk2eiurlzZDWKm5Vz+MOY6yvDzJ?=
 =?us-ascii?Q?D8MGSO4sIasUnaz2yB44lMF/r92CbMDVMHOn56CDo7OeNxyYTvaSAC379Epx?=
 =?us-ascii?Q?Kco2pqXz8wWuto3jWJjx4nt7woCQYoHSvL+miLoRBZPA7Y9YECeWLNFNf5b0?=
 =?us-ascii?Q?AYQIwXqvycFQ19wXKWH6SSAvbg8tdzWF3Ovot0dl5xGfBEbArtFWR5g5BpRn?=
 =?us-ascii?Q?XsvvH/vb+++TNBec3+kPXSuaGg7yW6cYh4ppSb6YmGBrTCd132jc8geoJhgs?=
 =?us-ascii?Q?hcQRGTK7YUsoNfy3ysPB0cBLiIgc/bCdwHmFeGraw6awvPzkzMfqFks6QkjG?=
 =?us-ascii?Q?o6BvDKDs+FmkX6QH9OfdxaLYw5+fDinYdjzLG0newjWgbf+PjS39Fgo8tRuO?=
 =?us-ascii?Q?SeION6K5YSgHJMqalxmd+2pPCgAQ/WFJUbuN8z3NuiMxvt2kUjQFDuHv9oz4?=
 =?us-ascii?Q?h5rGQhPVCx7JgRZxFjDoGRuB9G/zpOEtSm7CoALUXV1JK/o2Zj0jvFwsL9Vp?=
 =?us-ascii?Q?K290nueMsnuJJlRnPxyfjpjUVpJFO6B+PBQEqlECZtgimv9OBSi4cPJX1pJL?=
 =?us-ascii?Q?f33TEhbAh0sSIvNiKKHMtVYyjFzCvwsPEhYrZsK/bJbGkZy/C5uMTImnlZVL?=
 =?us-ascii?Q?nbaq5bO4e6s7Fj8tRh6y94rZjo+yw1oBxfd5SqzSrO3xtauuwHVT8e6MJxsI?=
 =?us-ascii?Q?jZSS0+7gX+s7TBSfqfY63HKAieCym+g=3D?=
X-Exchange-RoutingPolicyChecked: JRM+PyBuV2pNfEGLTzRU5L4g0ejBlIA0IJdjhCC9eVvBXW+zYNmtAqAKpwgXRDFY4a7tdN+aCSxr9XHQmZYmApkI4aU4wqsvhAGBB5cWTmAtkeR1pN4BtZ0qLMci8CpJrTJ1hcYGkbGdkH6y6eGcLhMz+mPWEvWUyPCK8hQ6xq9h15m7UgdYnUVlccbCI7/WNyzIiWalsWGZjgrJNw1TfzZGcjOKjXTNOJ9w9LxoVKwGNs0o+qwB0T861eTYVtOtV372yVguK+tQX/ZiRCtl6vcb48iJWmasIqVxPwg5tAyKaRf8SCg4F6SzRIRNzLkIRuGcu33PxnCqLOfu8jQgUQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2121e0-47f8-4d6d-d2ba-08df3415568f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:30:36.2512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lE8VnNMnKMHldovxfn7K8WAnmb94rUt5EJfeQroStfmStyq8WtNsF+GSc+9OcoRFobz77v1iLcPD/A+aSnK8mCkimfaXkczgaaNM8Bnn4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB195454
X-Proofpoint-ORIG-GUID: O3HPnIwwTmGf2GO5JAGvefCGEf-jdXyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MSBTYWx0ZWRfXw5zFsRnm+UJ6
 0n+fm/dfT3VVmcjC62JSW5u/ko5R7PrStvgwUx4ndw1CkmFs3GllOC10Wc/QgzTGBeABKHA5hf9
 Gj+FXkbz86+rTOyaCp/5Ye43eDGxB3+9WUllTnHB58AOQh0TrwcLBWavip/QMYsKim5I/GzkPat
 8iI/zetlvRbvT/j1ZBOBNW4Mc8KruOSZy69N9qbxAFet0UNQ2viBX9ikzVnxPlFF/p5Fnlel8bR
 2G1ebzsPTu8taXbIeKVT4sYiGupm3Ccti9OEDpvsu7od+RaB2q2sC7lbxSRczPlVFQU5YdNssj3
 8n18Nf/zaKC3jp9hn/wYfRa+V5cOoebfolyt6bKvvmIM8NHDE45qaKRuK9wAc/VWF0laxd8qcKU
 GmERrYjUva0EzL0F3SSgYdAPTyUkiWFNxZFDNOAP1YF8uFXDOv6DW0RZaB4/iH/WXHy3PzhBe3R
 PogvN/OSFP8Dse+df8A==
X-Authority-Analysis: v=2.4 cv=dr1OmFg4 c=1 sm=1 tr=0 ts=6ae07d4e cx=c_pps
 a=xHq7MdwY2pS/T2WNu/1Gug==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=mDV3o1hIAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=pUjUj6oU-fdMQ6dj_Z4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MSBTYWx0ZWRfX8UY9NC2Pu6pJ
 KzWtjzcRPZQ/mm/38bc57oi+yBypNgmnw9XGqo+FzjSgUz/XhbDVadps8q5+mZVaIH6Sl9TUh0m
 DOvR22OcVHRoXorL0iUpMz2gdf5HQAx4L4aO2+Vcl4skV4vjv92e
X-Proofpoint-GUID: O3HPnIwwTmGf2GO5JAGvefCGEf-jdXyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 10:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248723
Content-Type: text/plain; charset="utf-8"

From: Sowmya Sathram <sowmyasathram12@gmail.com>

libstdc++: Ensure that aligned new detects size_t overflow

Depending on the implementation used for aligned new, the size argument
may be rounded up to a multiple of the alignment. If the size or
alignment is a huge value the rounded result could wraparound to a small
value and be successfully allocated, returning a non-null pointer that is
smaller than requested. Add size_t overflow checks so std::bad_alloc is
thrown instead. The using-directive for ::aligned_alloc is replaced with
a new __gnu_cxx::aligned_alloc function and the parameter adjustments are
moved from operator new into it, with the added overflow checks for the
aligned_alloc, _aligned_malloc (Wine) and malloc fallback paths.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-95619
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=59d235ffa5a69231eb42e5290d52dc8c90d28b7a

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
 .../gcc/gcc/0027-CVE-2026-95619.patch         | 183 ++++++++++++++++++
 2 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools/gcc/gcc-16.2.inc
index 3497493619..31a630ce8a 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -75,6 +75,7 @@ SRC_URI = "${BASEURI} \
            file://0001-mapper-localhost-might-not-be-known.patch \
            file://0001-Fix-check-for-working-assembler-gdwarf-4-option.patch \
 	   file://0026-CVE-2026-102010.patch \
+	   file://0027-CVE-2026-95619.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch
new file mode 100644
index 0000000000..373323a02e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch
@@ -0,0 +1,183 @@
+From 59d235ffa5a69231eb42e5290d52dc8c90d28b7a Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Wed, 23 Sep 2026 13:15:18 +0100
+Subject: [PATCH] libstdc++: Ensure that aligned new detects size_t overflow
+ (CVE-2026-95619)
+
+Depending on the implementation used for aligned new, we might need to
+round the size argument up to a multiple of the alignment. If either the
+size or the alignment is a huge value then the rounded result could
+wraparound to a small value which would then be successfully allocated
+by the underlying libc allocation function. This means that we return a
+non-null pointer but not of the requested size. Instead we should throw
+std::bad_alloc because the allocation cannot succeed.
+
+This doesn't affect most modern targets because they use the
+posix_memalign implementation, which doesn't do that rounding.
+
+On targets without posix_memalign we use C11 aligned_alloc and round
+before calling it. That rounding needs to be checked for overflow. The
+using-directive for ::aligned_alloc is replaced with a new
+__gnu_cxx::aligned_alloc function and the existing fix-ups for that path
+are moved from operator new into the new function, with added check for
+the overflow we need to fix.
+
+On *-*-mingw* we use the Windows _aligned_malloc function which
+correctly checks for overflow on Windows. But the Wine version of that
+function does not and has the same overflow problem so we need to do our
+own checks before calling it. We include a conservative 2*sizeof(void*)
+adjustment in our own overflow check.
+
+On targets without any aligned allocation function we provide our own
+__gnu_cxx::aligned_alloc in terms of malloc. This also needs an overflow
+check.
+
+libstdc++-v3/ChangeLog:
+
+        * libsupc++/new_opa.cc
+        [_GLIBCXX_HAVE_ALIGNED_ALLOC] (__gnu_cxx::aligned_alloc):
+        Replace using-directive with new function. Check for size_t
+        overflow.
+        [_GLIBCXX_HAVE__ALIGNED_MALLOC] (__gnu_cxx::aligned_alloc):
+        Check for size_t overflow.
+        (__gnu_cxx::aligned_alloc): Likewise in fallback definition.
+        (operator new) [_GLIBCXX_HAVE_ALIGNED_ALLOC]: Move parameter
+        adjustments to new __gnu_cxx::aligned_alloc function.
+        * testsuite/18_support/new_aligned_wrap.cc: New test.
+
+CVE: CVE-2026-95619
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=59d235ffa5a69231eb42e5290d52dc8c90d28b7a]
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ libstdc++-v3/libsupc++/new_opa.cc             | 49 ++++++++++++-------
+ .../testsuite/18_support/new_aligned_wrap.cc  | 39 +++++++++++++++
+ 2 files changed, 71 insertions(+), 17 deletions(-)
+ create mode 100644 libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc
+
+diff --git a/libstdc++-v3/libsupc++/new_opa.cc b/libstdc++-v3/libsupc++/new_opa.cc
+index 7bda847a925..bd0098ac09e 100644
+--- a/libstdc++-v3/libsupc++/new_opa.cc
++++ b/libstdc++-v3/libsupc++/new_opa.cc
+@@ -81,12 +81,38 @@ aligned_alloc (std::size_t al, std::size_t sz)
+   return nullptr;
+ }
+ #elif _GLIBCXX_HAVE_ALIGNED_ALLOC
+-using ::aligned_alloc;
++// We have C11 aligned_alloc but we need to satisfy its preconditions.
++static inline void*
++aligned_alloc (std::size_t al, std::size_t sz)
++{
++# if defined _AIX || defined __APPLE__
++  /* AIX 7.2.0.0 aligned_alloc incorrectly has posix_memalign's requirement
++   * that alignment is a multiple of sizeof(void*).
++   * OS X 10.15 has the same requirement.  */
++  if (al < sizeof(void*))
++    al = sizeof(void*);
++# endif
++  /* C11: the value of size shall be an integral multiple of alignment.  */
++  if (__builtin_add_overflow(sz, al - 1, &sz)) [[unlikely]]
++    return nullptr;
++  sz &= ~(al - 1);
++  return ::aligned_alloc(al, sz);
++}
+ #elif _GLIBCXX_HAVE__ALIGNED_MALLOC
++// Use Windows _aligned_malloc
+ static inline void*
+ aligned_alloc (std::size_t al, std::size_t sz)
+-{ return _aligned_malloc(sz, al); }
++{
++  // The Wine msvcrt.dll version of _aligned_malloc doesn't detect overflow
++  // so do it ourselves. We know al + 2 * sizeof(void*) won't overflow because
++  // has_single_bit(al) was already checked by the caller.
++  std::size_t check;
++  if (__builtin_add_overflow(sz, al + 2 * sizeof(void*), &check)) [[unlikely]]
++    return nullptr;
++  return _aligned_malloc(sz, al);
++}
+ #elif _GLIBCXX_HAVE_MEMALIGN
++// Use memalign (and assume that what it returns can be passed to free).
+ static inline void*
+ aligned_alloc (std::size_t al, std::size_t sz)
+ {
+@@ -103,8 +129,10 @@ aligned_alloc (std::size_t al, std::size_t sz)
+   // We need extra bytes to store the original value returned by malloc.
+   if (al < sizeof(void*))
+     al = sizeof(void*);
+-  void* const malloc_ptr = malloc(sz + al);
+-  if (!malloc_ptr)
++  if (__builtin_add_overflow(sz, al, &sz)) [[unlikely]]
++    return nullptr;
++  void* const malloc_ptr = malloc(sz);
++  if (!malloc_ptr) [[unlikely]]
+     return nullptr;
+   // Align to the requested value, leaving room for the original malloc value.
+   void* const aligned_ptr = (void *) (((uintptr_t) malloc_ptr + al) & -al);
+@@ -131,19 +159,6 @@ operator new (std::size_t sz, std::align_val_t al)
+   if (__builtin_expect (sz == 0, false))
+     sz = 1;
+ 
+-#if _GLIBCXX_HAVE_POSIX_MEMALIGN
+-#elif _GLIBCXX_HAVE_ALIGNED_ALLOC
+-# if defined _AIX || defined __APPLE__
+-  /* AIX 7.2.0.0 aligned_alloc incorrectly has posix_memalign's requirement
+-   * that alignment is a multiple of sizeof(void*).
+-   * OS X 10.15 has the same requirement.  */
+-  if (align < sizeof(void*))
+-    align = sizeof(void*);
+-# endif
+-  /* C11: the value of size shall be an integral multiple of alignment.  */
+-  sz = (sz + align - 1) & ~(align - 1);
+-#endif
+-
+   void *p;
+ 
+   while ((p = __gnu_cxx::aligned_alloc (align, sz)) == nullptr)
+diff --git a/libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc b/libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc
+new file mode 100644
+index 00000000000..dbd642d6ba5
+--- /dev/null
++++ b/libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc
+@@ -0,0 +1,39 @@
++// { dg-do run }
++
++#include <new>
++#include <stdint.h>
++#include <testsuite_hooks.h>
++
++#pragma GCC diagnostic ignored "-Walloc-size-larger-than="
++
++void
++check_aligned_new_overflow(std::size_t size, std::size_t align)
++{
++#if __cpp_aligned_new
++  std::align_val_t alignv = (std::align_val_t)align;
++  try
++    {
++      (void) ::operator new(size, alignv);
++      VERIFY(false);
++    }
++  catch (const std::bad_alloc&)
++    {
++    }
++
++  void* p = ::operator new(size, alignv, std::nothrow);
++  VERIFY(p == 0);
++#endif
++}
++
++int main()
++{
++  check_aligned_new_overflow(-9, 32);
++  check_aligned_new_overflow(SIZE_MAX, 8);
++  check_aligned_new_overflow(SIZE_MAX, 32);
++  check_aligned_new_overflow(SIZE_MAX, 1024);
++  check_aligned_new_overflow(SIZE_MAX, 65536);
++  check_aligned_new_overflow(SIZE_MAX -     1,    16);
++  check_aligned_new_overflow(SIZE_MAX -  1025,  1024);
++  check_aligned_new_overflow(SIZE_MAX -  1024,  1024);
++  check_aligned_new_overflow(SIZE_MAX - 65536, 65536);
++}
+-- 
+2.49.0
-- 
2.49.0

