Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E976ED6DDCB
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 03:21:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12038.1731640444898520398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 19:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10498f4891=zhangle.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF3E4oR013456;
	Fri, 15 Nov 2024 03:14:04 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtucnuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 03:14:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbwlFWetOMUvrIEIf6D/LkFVi8IwvIiPzoliX/jiB9YfdkEyuKjaONxeoADnyNjsuBniQhhX1O2a0jdWWgOi5kb70CuMID0hTsmlkclulMq7ge9ZGGK4dHF2jcf3CvvDZr2zyHke7vKIKjosPVh0IyhEqA6IOlUB1PCVZah3C5f9J72o/qGpCnubTbFOp1VK346K/sIFvjEnhgCBXS9aqT4RD6mpTvPFPA6kvz6bIKl1DznsVrhMddvbHnq8fFAM5GxFEzX8dp42oJ52LMvFkwBj6hqUnObrF7fEGfBEDpVMhnRHWf8A0ou3Tu1Y5BNPMVvXuLjCtZkevB5NaTOZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4E4tiTyRVVZLOWDbWYzoXyq4hgtUv0DG3sl5okOzAx4=;
 b=izVbhwlZZ74emQwOFNuFwFiQREV3uKry0p3fExo+DG0r4FIPP81IuofR9yAsH3xfD9S7TeHlRVMFqTu9nXHPESeqgKOBh6bffzrPdjcBgcuP/qVgMWMF2NUmH4pF2FrBsp8vOYESjPBUpcxqW5n6qK3MTeEIjbelB119ghJr6v6S7JV8BYdIktlXzHpxCujhJaEAtSDk/qztzHjaNzF8mA5iE1CS9mwDphWHOlMZ767yVn5fmCT7QpeI0iWWKycEIlWDRZco4S3O83e18YclcSOWmTmFLEpfpTk8cTjJHeixxPX7WZQBdPbWKE6mvekqSQhNQCpDTKlkQ2kVsU95Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB6670.namprd11.prod.outlook.com (2603:10b6:a03:44a::8)
 by SJ0PR11MB4927.namprd11.prod.outlook.com (2603:10b6:a03:2d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 03:14:00 +0000
Received: from SJ0PR11MB6670.namprd11.prod.outlook.com
 ([fe80::1e21:27c4:28ca:fdb]) by SJ0PR11MB6670.namprd11.prod.outlook.com
 ([fe80::1e21:27c4:28ca:fdb%7]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 03:13:59 +0000
From: zhangle.yang@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Eric Yang <zhangle.yang@windriver.com>
Subject: [PATCH] bzip2: license and version print should output to stdout and exit
Date: Fri, 15 Nov 2024 11:12:58 +0800
Message-Id: <20241115031258.191121-1-zhangle.yang@windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To SJ0PR11MB6670.namprd11.prod.outlook.com
 (2603:10b6:a03:44a::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB6670:EE_|SJ0PR11MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: 765edf27-2474-4519-66b1-08dd05237ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dLWDOpwUJwXdIaaRkhi8wwzgM1+tB3LK2sVrAGHgMy7QBVHYx0LB87ycvzlO?=
 =?us-ascii?Q?lkR1ETuK0EezOVbWtCZlbkc1z5yJxvokx2g8wNa7rPdHu7Oa/lYC+BgCLpHT?=
 =?us-ascii?Q?ECw7Pf6Y7wbgEpJRuTWP8+78RfzzeD+XSYCNJ4GayIVhu3tXkXkmPGlSIMoa?=
 =?us-ascii?Q?ohQ7NDcl5ZlYiZ2aJCsy1ko+37Ar6rxs3bRK0BZxfHm8HEhZMZiakFUXDU1X?=
 =?us-ascii?Q?U3+hiOIECktCKw26fOirRroDuBPjw/yBoRC5Hnrz6Z0qRLdYeNZzHkYdXMBV?=
 =?us-ascii?Q?szftv8/ANDl4lWEXjg+7jzV5uEsLg7yfuq01yDVmBFll288blPHlgvLAowj0?=
 =?us-ascii?Q?R7zjH/639xHYgzPaJcsFBJ6sDeQiaESfXk5c0Bl94df6/ongChMjEH40d+4b?=
 =?us-ascii?Q?MtbJ3NEOI/3gZ54AGZWxWRnYwEESjwwPe88bduYa5TOSqpjtFi7JQnuG+9nC?=
 =?us-ascii?Q?d/+QVP0K3zsTIOqXDQu93ucMa27aHlEePghZnPx3MixyNOfxEGzixguoxqOZ?=
 =?us-ascii?Q?rV/nYgMdz0dT1vLS0yHU9kTOSIi2/JspNF3aTMCWBYY/WqP5tx3UKnvm8GMo?=
 =?us-ascii?Q?r4S11Xtu8mz4uNOSnrO2/r/bQ9MW3dBeb5HUNoTPdsthwIeK+GT1jevM54XB?=
 =?us-ascii?Q?TxEFne1XcyNcOcOrRGhJoLpyMYugWp8ebBGZUgc+AyhRhNGhJFsdme9QXV/h?=
 =?us-ascii?Q?4gSnsyBqzFzOsivM5BZ/nZwnzpvToNpi44IMIJN0/uVbQCx7TeOvRkh8HD9n?=
 =?us-ascii?Q?dG5yY6WPb9uQWBU7D1hfjSU/hJhw/xAjpf3+ebL7bQt7tR5z+p/lYIOXUzQX?=
 =?us-ascii?Q?yUev05zVEsXPh47oC3GkFxgyL0vTrxOD+leCmsK3SJmGA4p2aJxiu9e6lwE7?=
 =?us-ascii?Q?s9b1Ak5uwxTtPa1aMlr2b4KVV7v1N7mlVy5Z3l7vHUl7wZqFnKPUrvVoABlO?=
 =?us-ascii?Q?BuCWFxxvaj2YAOnSPfRXXj4TDptpVuIn7tqBf3rJ66u1CFeD9apOXrt6+rre?=
 =?us-ascii?Q?UJwOG4ZgLgBBmYP6ZYdVS+JK3Va51ONVB1Da9ELqR/+6U1e5lIZh2wV2+7YL?=
 =?us-ascii?Q?mYBpNbc47Yc4C/0/oJuW78uaB4LP8t7woDzMYol46Poff7KQqSBEM59+JATf?=
 =?us-ascii?Q?/QPUz1iwx5fagFmaGUiUlleDxZTvxEXj3P/QfojeKCkydYh+F6LFFgxQ4o85?=
 =?us-ascii?Q?FSj4Q5HF47qax62+48IMoBNTNEO4DO1oeVGbQ3NpTVLG+bP6wnkGkBjpi7Hj?=
 =?us-ascii?Q?4yOHQbwAmu/4xaEKKU/H5Xa9f504fjmCT0ONXNAAqDxjz/M8awOd7qbr+GDY?=
 =?us-ascii?Q?LFB5DUvRaUt2qDg9Fqpc3BEZrZY2/8uu7ScE0dfcVG78x1CvSAv7+YjhuWHF?=
 =?us-ascii?Q?h0ezq61jAaTJtZ5TUtAKaSdmvEVQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6670.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qiB5E1eLP+1kIsy2IKFtF6h6A7pVThjmoUfqIw/Z/m0pm8OYC2yvFQDLMDqS?=
 =?us-ascii?Q?o0YbSsuNQIHYdK4sbdhrm2Hmp1K+PE1S76ffe+410cLlqhZz95qOH6+/lxu9?=
 =?us-ascii?Q?quTk/N+drAPCfQG3y+UKv6Mf97VmyTj2Xcd1LYkxfWT94j54Z9MpLTQBd6Nv?=
 =?us-ascii?Q?LLyDl+F3yxNkedKKe2GDUSfygTEyadCKeJ4VkzFKJIhdnzul0VEeaSFA8MIs?=
 =?us-ascii?Q?bg8xYUSJvFuV6GuJLeL4Hd2HwOezaP61gyQgl/3CGmzWefCA5GrE3xMmEH5Z?=
 =?us-ascii?Q?PXbwC0fizFyjN/RLf8ov2hHRhGFn+lcSc5b+ubbSllsEf4KISsm2prmihmS1?=
 =?us-ascii?Q?vTUSSI2a+ouiy90aRW2vjk6s36IhspQ2LR7PMVyIg1M6v7bb4m7zezxdCs3D?=
 =?us-ascii?Q?hQwP1EpYNdUxdwizs3O+osb/7gNG20ex85eNP8LNraZA1p/eONg0c2VNU6hZ?=
 =?us-ascii?Q?DHooumjLPMnAzNg0mveRg5mbGgJhxHwkqs/8NiT2c8PRS8v/qAFxjY5vnW8+?=
 =?us-ascii?Q?V5s6L0exlwTFx+ARAdAqkAnmSosrypsDzXfQiK2ItkfALFDrGedxJI+C7b7E?=
 =?us-ascii?Q?uqtleGJWnUUevagkzoatHxhg59YTeNtzFHeSbcCK7kNbeZdPaZuuYXaxYHi+?=
 =?us-ascii?Q?7saLAQYhbz7Q85toimTSEMhC9WhgL3ZWIdjFFb98WM++snuc7//jS29plM0b?=
 =?us-ascii?Q?a84AudvZmwv3Z1UwvnN0mr+jEyltSrNA147vSwNPrX8LuFLea6cWU8S91KJK?=
 =?us-ascii?Q?YxINxXpR5jY64sLfehE7ZbNJ9/8BKT4XQHXpFTN32vybIGI8PhN1btdt6d2R?=
 =?us-ascii?Q?5eTbvvptwlc77ve/FYDlYlr86eJW2sgpPXIryoXL7JPwXhe/xAqyT8iFy7r/?=
 =?us-ascii?Q?aAsLw7xLeLdHWQzXgpdQ9A8SSELG8/RZXwKMJLGsJ2AhMaCNS1XpINBcLW2/?=
 =?us-ascii?Q?qFzXPBXYLdmfRrhxdpIiv8R4Yw3WrnffkjZW6v3pKL0awDsm8Jb61JiFkCH+?=
 =?us-ascii?Q?SjV0C7E4sgJSOILmzCEoiNlxMwfKKzwOUkEyaMFuAx4eHgvY8tKgbGdUumQi?=
 =?us-ascii?Q?+GsD27JIe53BFM3LgohILl/SyjwCod6YLc01/YLNtjt+WkQw/tZ2/yNoDuY/?=
 =?us-ascii?Q?N4vX+51yyU64tAACNwtyHCWD/IKs8UTE9gabCy/4gP+Bp5EtRcDcReS4ZDAR?=
 =?us-ascii?Q?2M27BTxg6N2Vcqr2YueEZWE8x28SEibh2y1LOh38a15lIfBF0iRpkhroHiFP?=
 =?us-ascii?Q?2tqqzyRD4maPKY4AxW3lDKLW511fzeO6nIMwAuDRlzPN6h13zXI+NKRgfK01?=
 =?us-ascii?Q?Fuj9hh2Ve3PQZRf3gXBMaVxD/WFdjHRTtyBOIfc4FcIXm1I21h+/zQzl40fW?=
 =?us-ascii?Q?mmd8xedyuUlxSdztoWZRVhvFUgI7w0dCG9/01JLrVnou67b2y+LkIjfg0Mko?=
 =?us-ascii?Q?27brz9Ay9+5pZHnTtfSR3mQ8dmezn3N+DwqqTHZBO1R+CDkNkwoWp26MD+hg?=
 =?us-ascii?Q?7ayRXry5Vkpq9PoUSdTu0OndxW15T1cIJ4zjKGPxiiqeKqHd2Ps8cqQHaHMF?=
 =?us-ascii?Q?i/3F8R/6JdYJONnORIS7hgCXwSQzasxWjp0GmPKxR1OnJjwrRa7FeBOxI/3Z?=
 =?us-ascii?Q?zQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765edf27-2474-4519-66b1-08dd05237ff4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6670.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 03:13:59.5289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+2ORrgiVrzr3BtBo6zuRvmPBka23BAGo9WbEakxVB+VS7kfnzjlwORlodViGGLazQSLgEupIVkTCARldiNAA8hXAjkUzf6AK1WztXskM8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
X-Proofpoint-GUID: QAGaTm7sZMgr3bYnGMuvARKVCgt7fD8y
X-Authority-Analysis: v=2.4 cv=BPnhr0QG c=1 sm=1 tr=0 ts=6736bc7b cx=c_pps a=CmjB6Nkc3E8pi8fe8piFzA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=p0WdMEafAAAA:8
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=-hWXfp3JfZXgJJt7KR4A:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QAGaTm7sZMgr3bYnGMuvARKVCgt7fD8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1011 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411150024
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 03:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207180

From: Eric Yang <zhangle.yang@windriver.com>

After displaying version or license, bzip2 should exit. It should not continue with compression.

Signed-off-by: Eric Yang <zhangle.yang@windriver.com>
---
 ...ion-print-should-output-to-stdout-an.patch | 53 +++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-license-and-version-print-should-output-to-stdout-an.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/0001-license-and-version-print-should-output-to-stdout-an.patch b/meta/recipes-extended/bzip2/bzip2/0001-license-and-version-print-should-output-to-stdout-an.patch
new file mode 100644
index 0000000000..fe1cb14723
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/0001-license-and-version-print-should-output-to-stdout-an.patch
@@ -0,0 +1,53 @@
+From 65179284ceddc43e6388bf4ed8c2d85cf16e1b2f Mon Sep 17 00:00:00 2001
+From: Rikard Gynnerstedt <rikard.gynnerstedt@gmail.com>
+Date: Thu, 24 Oct 2019 12:48:57 +0200
+Subject: [PATCH] license and version print should output to stdout and exit
+ with code 0
+
+Signed-off-by: Rikard Gynnerstedt <rikard.gynnerstedt@gmail.com>
+
+Upstream-Status: Backport [https://gitlab.com/bzip2/bzip2/-/commit/65179284ceddc43e6388bf4ed8c2d85cf16e1b2f]
+
+Signed-off-by: Eric Yang <zhangle.yang@windriver.com>
+---
+ bzip2.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/bzip2.c b/bzip2.c
+index ed1a33f..6da2905 100644
+--- a/bzip2.c
++++ b/bzip2.c
+@@ -1600,7 +1600,7 @@ void testf ( Char *name )
+ static 
+ void license ( void )
+ {
+-   fprintf ( stderr,
++   fprintf ( stdout,
+ 
+     "bzip2, a block-sorting file compressor.  "
+     "Version %s.\n"
+@@ -1890,7 +1890,9 @@ IntNative main ( IntNative argc, Char *argv[] )
+                case '8': blockSize100k    = 8; break;
+                case '9': blockSize100k    = 9; break;
+                case 'V':
+-               case 'L': license();            break;
++               case 'L': license();
++                         exit ( 0 );
++                         break;
+                case 'v': verbosity++; break;
+                case 'h': usage ( progName );
+                          exit ( 0 );
+@@ -1916,8 +1918,8 @@ IntNative main ( IntNative argc, Char *argv[] )
+       if (ISFLAG("--keep"))              keepInputFiles   = True;    else
+       if (ISFLAG("--small"))             smallMode        = True;    else
+       if (ISFLAG("--quiet"))             noisy            = False;   else
+-      if (ISFLAG("--version"))           license();                  else
+-      if (ISFLAG("--license"))           license();                  else
++      if (ISFLAG("--version"))           { license(); exit ( 0 ); }  else
++      if (ISFLAG("--license"))           { license(); exit ( 0 ); }  else
+       if (ISFLAG("--exponential"))       workFactor = 1;             else 
+       if (ISFLAG("--repetitive-best"))   redundant(aa->name);        else
+       if (ISFLAG("--repetitive-fast"))   redundant(aa->name);        else
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 324276df70..02c05c2902 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
+           file://0001-license-and-version-print-should-output-to-stdout-an.patch \
            "
 SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
 SRC_URI[sha256sum] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
-- 
2.34.1


