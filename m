Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A63E6C607
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 05:30:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12689.1733203832103835554
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 21:30:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2067c3157f=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B35U8FR016931
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Dec 2024 21:30:31 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43833q2gtt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 21:30:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWZZfGTxHztM9xwKOVbXzUVM0t1CdW3nnCPNwjzpx8gArwJT0yqz6K9Z8Mw7QHX9FQHPzZz82pmAHVB0JPf22M64Cig8FM7JWDg301ogMU5zcz37qDIzFYjIS4dw5/zu1O3LMqeCotPvjJH/GJuePze0hWYnn7FTUoDVhhcCdBJGYaZKDCFC0W7Vid423w/Ib2qZzpi2DQkT+Gec9BSXl6s8TSorHA+pRgOzzPcVexWZfzrZmTBmwfhYuHmItayiLONDGRx+zc1xOqEZnGZfD8/pvXopkwpUmrAxdTjo12Nu6VOkzj/wpaQmM8eHPWMiI5RrToGXC8zAN8bS5VVx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXsfocIVxBhjOwIeLZre3Wd3Hmc25YKEjcVmfC+JCUI=;
 b=L2WzcaZVpLMYtXqPVuwNH0XP6DrHflHFRwQ1F9XttyGAoBB7FMpW2O2FeDcpMjxvmJjxkF3h/lrVACxmuCeEpJWgLOJe2uebi4d91e1i3VHk+TG6/zPmSILs75w6JZGndZsB79wtAftirt5VNbk19INRddVSLn5cImb5N8WS+p8vlga9sNx8gl2nYSRs5VJaCRSmmDIFkxJdWdBbeB0rdB3tsLvKfp+QqTPNXs+3yw/wc/tNZU+agFKg048Zd4ZKBuTx5UA4xsBMztwPVIiMyrEWdne8DZgzqvmJimcQ60df3A196Omi5Ds3npc7TwLOK2EOclGiGI4BwzvW7JAGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 05:30:27 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 05:30:27 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [styhead][PATCH] glibc: stable 2.40 branch updates.
Date: Mon,  2 Dec 2024 21:30:10 -0800
Message-ID: <20241203053010.2203409-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: bde55111-d626-4526-aa2a-08dd135b9848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Obn/nTZdvgdmTIIOzEQR8WCXg2mkCDWD8PHJlbRybs+X7CYbTaz/IlwsnGO7?=
 =?us-ascii?Q?Dm1CDvztb/EqXXZI0ityMzrpTNqtXETM5fWjvAiG58kUGFG6hBX9C9m70tic?=
 =?us-ascii?Q?clczo3OFYl/oiotoBnogod/n6qNgYj9PKxpkLWMvztOYTVcio6BFPUk2EqIT?=
 =?us-ascii?Q?YUOpSxWNT9BZF5ADYVn29ZS4FcrHxHz2SiuINbvyHCT32uNwXuHc7obtYH8e?=
 =?us-ascii?Q?hCgkWNwRZfLGfG9lxy0ByMJLgGdzrFR1GrB18QLeaT+RcxaQuxMZXwPFYyfg?=
 =?us-ascii?Q?nMnDBQrjdr65NuvjGx2PQOP7qhfq/9R0uplxGNsjJW/CLr9NVj1D2WPaXSBK?=
 =?us-ascii?Q?ouW7YCpvNoNgpH/EzmhJjTfroEZN7iO9wOUueIJKXcP0gp9ILntRe2ZFL2HK?=
 =?us-ascii?Q?lxID3wMR5y2yAVnoIGU0X89TBN/4adS6gJelqdc5GeO94r4/WcT+gTMNExeX?=
 =?us-ascii?Q?3L0L6osfVuBj5VPqANLAFsX08a9Gq5aN1hK1ws+HPLZkesC3+9gGTNMmmY/F?=
 =?us-ascii?Q?+bnM+OmBOc3VC3e/pLov3yCvKkuiPY7x5kJvNKl9q+uWOQFQofAIToQtWDbr?=
 =?us-ascii?Q?dPQhhlkoMEpyyKZsqZWCE2ayhxuo//roxV4AJPKY8DUd3czPKca0zXVZ5swu?=
 =?us-ascii?Q?vxyjyJFe2BmR9OXQ8VoNpv5TehTXSrxG73m63eCIOyBCbh0zugJrjVHSxDXz?=
 =?us-ascii?Q?WccIOO9GKEFutet6/tJUtpWG9jgAVUdFEs3/nvOKfiPE+ShyV4t0ErrjRqJT?=
 =?us-ascii?Q?QQyOkRWLGgEdtdaCHTF03/44lMuiCyIWeTeZoIgrcjJPE7dLLIc2JgcICVNV?=
 =?us-ascii?Q?ixBqod7+qX7SsgvnNmCUroUKtPBlUAcGLUYFTvZUsX6OreeHoO6atTRWpi/E?=
 =?us-ascii?Q?H5fb6vNrF5Knv2Dl/L3ybI/MbXZWIUHXiz8PEfpDVCjFSATzTFcvDRUexGcZ?=
 =?us-ascii?Q?D9i9y0XJsC41yjEOc2kfoAdY/goA78AUn0dhvQKCNbsWdNiRUtkZyHQMEaoM?=
 =?us-ascii?Q?KcOzTPhYgH91NTo7gGhCGSbZmbyRQqyzUK8Bi2y9fbM0cg0+C9sm7vy0y4WP?=
 =?us-ascii?Q?vyFOr86gAlUi851ucs0TInQnlkY6SOd0I4bTZTySiw/rJepI6mQUYwks3GvH?=
 =?us-ascii?Q?59Oqffdp7nutxtD0BCdDtciOFm7TI1l5O1XejF/j83rcw7AxAg1BWg4vgJPT?=
 =?us-ascii?Q?c848FBpbuG4NPJmaWMWDoETmXWpOBF577VHMIbkWmoPi3/AYyyB95/JgP99a?=
 =?us-ascii?Q?qCua1kQyyuPDfmxrgnpLt6bLnFjEOP8IXIQq1NvDmdnH2pF/WvDFkdYabfFS?=
 =?us-ascii?Q?sl38j3aqmokbWhWNDJZSOFcgQdIcOO4skIEYBigNyhKXlYYkyJbYWcSPrvRq?=
 =?us-ascii?Q?q9MZqspmnKPAYKsgBhdHN1ED2lHTeUGUbUU2bh4MWs1yMzAGVA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cRKIs5cx4LlEgbpOq6CEiQUb9QKYOBAMN33r4Lrv/kxo2SmLuwjUua6L/yCU?=
 =?us-ascii?Q?Nvky3s2Wnl90yxTqlWjhzyG14+iQTULV2GKdSmEnY3p1P7reCusWMom03OkX?=
 =?us-ascii?Q?mDErH0czsszHTCxUW5UIlZRxLPguQP5eQdym2wkmZQpjJrMX5xhsMKM3KoYz?=
 =?us-ascii?Q?+/49sxiz3hUqeGTSUo6eyvowYcWJJhwkxp21YwltZrhFtBrJcTOPTLAN0Dzm?=
 =?us-ascii?Q?RbwUMhMVW0AGSXtcKHwTdNO1pUS1K+WqYRvl+icBvUjrTxvfyaeWCiqGPoC8?=
 =?us-ascii?Q?9k3OG0gJW183ApeSNcX4KxIbB319GQ3YvSHS3BVBC3sRuCzV2bqujMU6p30+?=
 =?us-ascii?Q?V1O7U8GRuFN5KXmWKrjql0PgSmFsrvMcvkqr0OJy3cHR1dvaWhJ/MVsMLObg?=
 =?us-ascii?Q?ZXAj1SSSjpfeYJyi7jLNeYG29U2nnWGClz6S7pYDWvq/M7qaxi01pdVvhUyp?=
 =?us-ascii?Q?g22sLr2/MucqqEUR/p5Ff6qUateOIfrXmvMcT1x2SV6ebIj7Uz+pyfyTELPN?=
 =?us-ascii?Q?m1buhlxo4hz8RBpD/1WCYdB7bepDoX7OVaektiQPZWr0vUXLSzhT7DwHU/r2?=
 =?us-ascii?Q?VFgHH6/nebpJtwVvYIop9awfYCz5LpiZaC9dNfIy24BpJrvmLO0HjhKhD4Dn?=
 =?us-ascii?Q?dkhfqCUkA6a42JQVb+wYUihKXAoYoYBSAZiXGBXTQ0oUxLfWpQitrdAx9Idi?=
 =?us-ascii?Q?R2Fp4OZxdtS3A3f4mpbJFZHiIvy27bpEbB/UhwH+yKdKYULguyz2drz0Tzac?=
 =?us-ascii?Q?Umm1kAsOkvOSUCM/hPADfKVvs5TleIDh9rtNk+y0jvNUBLFA+IBsZNjXI7y9?=
 =?us-ascii?Q?KFP4bdu7JzeTadDqVxyqYi9wGhXm9lUEBZAieqGKxI4fq9F0ZnGN2z5VdAsP?=
 =?us-ascii?Q?yz/8+ZGnm4xJLs0l0BMuE8lCQpow1MTzQ7eiI/udo/Wx7i00lYJqZhZW0qsX?=
 =?us-ascii?Q?MMyysE4fOBWuDiEpuO8qIA7iYYWOvmhsRcnLUagMCdGBDLr1NUy0AzX+/UZK?=
 =?us-ascii?Q?JfMnPsjT8DFVs4NDwnM62F8We6U7bw5ePSGeXAKlLGwoTCHQG/kX891SCFXh?=
 =?us-ascii?Q?iWzXUtbm7tcZI4gT7JtR3R1TibQ88/D32Uf73bffQc6/OuhX93B7DmXH60LO?=
 =?us-ascii?Q?yG0jsqrAjTGmuV7soTZ8jIKtxCDMcAQRyuoYDCDXRBeSyyf3qWbZWEjHSNu5?=
 =?us-ascii?Q?IqnPmQeL5XJObXygeWuB6iR38RfeoVwRr1tHn1Ir1z74U8KRM8csAn8/+1Ic?=
 =?us-ascii?Q?Fi4A7hD+bpSvsjwkn44Cy5VfmPKUEMo0HDXXX6qYIa7KP2+FZU2xBv5eCVPL?=
 =?us-ascii?Q?U8TT3H5zPUBQ5skbAaiz5pgjd23eAQtJBkZgx7hcSx3wdF1NiWw+vQH+P/Sr?=
 =?us-ascii?Q?qbR7bqUTghmyE/xI62b2Lhmlfo9eoSC99hn5IiNOd2+bGyxPHpoE6Xg8MndA?=
 =?us-ascii?Q?+0rKVMH0juZU+iVHLkIIhzzFB2BdgwMuXMwtXZUhYead10PJ+7L0rkJyUEW4?=
 =?us-ascii?Q?ryiwXqeV2cdEgUI6RxmBACgSToziVfLl7YYj48Ev2z3zboEHp8EWwpudkPeS?=
 =?us-ascii?Q?wPdxOzISa8Sc63c32jfCOewNpFsY98mpAoYkNn3TEmS3HueuhU0VPXwQ3MBu?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde55111-d626-4526-aa2a-08dd135b9848
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 05:30:27.5057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQvxCiBpYej32sov1yKqjGDE2VHiayLYqTL4rpd1weW+fgNBGiQW1LyzhF2tTB7yFYx/a3cwV7AWPy55iM64sUupEbdpHdhJndvIeE7Sjug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-Proofpoint-ORIG-GUID: prT0eZf73uxX-K3JTCzswc-P9kJ1ufXM
X-Authority-Analysis: v=2.4 cv=bqq2BFai c=1 sm=1 tr=0 ts=674e9777 cx=c_pps a=G0EMd8eUBd5ElxF49Cdl+w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=7umbWx2pWX3K8tXTQi4A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: prT0eZf73uxX-K3JTCzswc-P9kJ1ufXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=930 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412030044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208180

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.40 stable branch are updated.
626c048f32 elf: handle addition overflow in _dl_find_object_update_1 [BZ #32245]
efb710034e linux: sparc: Fix clone for LEON/sparcv8 (BZ 31394)
2344580243 Mitigation for "clone on sparc might fail with -EFAULT for no valid reason" (bz 31394)
3a34851103 elf: Change ldconfig auxcache magic number (bug 32231)
85e5850f2f Make tst-strtod-underflow type-generic
5c06c6e0b5 libio: Set _vtable_offset before calling _IO_link_in [BZ #32148]
cc256952ec Add tests of more strtod special cases
8f40dfbe2a Add more tests of strtod end pointer
4a9b6cdc88 Make tst-strtod2 and tst-strtod5 type-generic
5a10d05c39 powerpc64le: Build new strtod tests with long double ABI flags (bug 32145)
c4cc72d2ef Do not set errno for overflowing NaN payload in strtod/nan (bug 32045)
ad93c2047d Improve NaN payload testing
cac10d88c6 Make __strtod_internal tests type-generic
d0c1792ad2 Fix strtod subnormal rounding (bug 30220)
e06153665f More thoroughly test underflow / errno in tst-strtod-round
9bc76c7ca4 Test errno setting on strtod overflow in tst-strtod-round
61b6464f8d Add tests of fread
77018fd9f9 stdio-common: Add new test for fdopen

Testresults:
After update	|Before update	 |Difference
PASS: 4947	|PASS: 4945 	 |PASS: +2
FAIL: 224	|FAIL: 224	 |FAIL: 0
XPASS: 4	|XPASS: 4	 |XPASS: 0
XFAIL: 16	|XFAIL: 16	 |XFAIL: 0
UNSUPPORTED: 229|UNSUPPORTED: 229|UNSUPPORTED: 0

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index c8614e3c60..156d2b0474 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.40/master"
 PV = "2.40+git"
-SRCREV_glibc ?= "7073164add3b874cf0c19ca0fb84236f6bb0985d"
+SRCREV_glibc ?= "626c048f32a979f77662bdcb1cca477c11d3f9c1"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


