Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D280DC7EE32
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 10:42:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5338.1750761734507383699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 03:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=827047d704=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O3GYFB028307
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:14 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mjp8p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPtZ2P+t3nbJMOdBCjTdQoXXxBtRlYgUzuDIJr3pGr8PXrV3H8sZoPDcZnWwJ88YwAkeDcADnTAployviDh7dNaRdnBz9wR3RCcgNMJ2Gzx5h9aeEgu6m6yRbBur0WwAk/NlaTOFf/q1AGklSaX9ZRi/xw2GOujnHQenqfgtYobIuzjHLireeXwufIw4TSgJbn+fYOXms4kG+s3PB0x8vLmdqQuxxRuCNGLOEqpg8gjLOal5C/srTG1RJYbD0qoLiwsj2q6x50BoX/FpUZo8IHH8jul4EDoswrulTdbiSKLzdI6jcpRZg4iVPKMkhqRdLxqs0flh/PPvUa2DtTcqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j29gOwREQsRkhjkvK34H0EnBY/vsaBEUYCx752SNfSc=;
 b=YgpImf4oNY6vZmz2EB5nlJVgfjhD2+aiHgf2zhs23yQdDAQQiAyhuYz+fvZMBNYwbe28wPtwZhdAk0wJzEAXwOhW88fhD+Ro0ODwvfquotQZh1r/p1jF/9jS8tlXJvQQJ2FE+NG8xmIatYS8U5hlnmgiNga/SE5qYn1AS6GxttfguhZRZrl0PtfvbwSXSaFeiQr8yL7sFgUn1XrhP2+3OyE5CvWNEy7qiCNO8qLHWBbBv6wx1ylJQWOjwMBRzl/NHVyu7woiX+6ZJw0zXFD2HieQ7YlMVATL9gEDEwzN9APG3cO6K6hrWoPX4JzIZgJp5ui9/4cFs5Wy7Uk4TxwEog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Tue, 24 Jun 2025 10:42:11 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:42:11 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] libgpg-error: drop -unknown suffix from version number
Date: Tue, 24 Jun 2025 18:41:48 +0800
Message-Id: <20250624104155.559827-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624104155.559827-1-yi.zhao@windriver.com>
References: <20250624104155.559827-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:4::32) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: daf79ad9-8e30-48ed-4e71-08ddb30bc6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qffzJBLUt56My0dcthEUMIBoO9HXzoWFE/8P6mXheUQ6d87M8MaXIm9tsZkW?=
 =?us-ascii?Q?HaRZ3/nfgti1gPwG1P/XCFd3kCBCQOs3In8pKOGlUyKnJUGfc4OEYz+h7y+E?=
 =?us-ascii?Q?cyIg3NHL3iNgefdxIFinpb+8bJNaZSP3UmCqMvN7VZG6HANilsVcGXIq3kwA?=
 =?us-ascii?Q?ZTHuiJUFn9QoiFaqVKA9pPW+b6RU+jAsgRssH7Y3nHGjJkl6A/nwINMVWuqr?=
 =?us-ascii?Q?LUnil+QvGFzVGBlicPkmpRsUS2czweiJ7cwJVuKeJlXGr+EALJqQWhglAWOi?=
 =?us-ascii?Q?+URxzCZIls6BIgZuG4T2ZiOaQkrwRkKNKBiJH43BJhcDxoFNNLpwYw+l/60a?=
 =?us-ascii?Q?kxeVD/78eaqFYYxoPi+AO+8XvL0wYNpJidhc7quAaCLdNMpr+VAKRSnR6DUR?=
 =?us-ascii?Q?gAvHMTRsNgXJ9DhPHCYC6KsFUuD3LISNw5NcKkLOOz5KdfMPwW7yO8erElxq?=
 =?us-ascii?Q?C2UV10TDXtzDbOM8jxLQceuqNH4hIDVrIRf0Me3Cx0Drg8ZmpbGx0le7RgkC?=
 =?us-ascii?Q?AFQ6WN5Tj9BVLgjKvBe/PkPwtBTNGHK9kSNuUQ9cJeYTz4FDov2eXnrE2OR8?=
 =?us-ascii?Q?xn471sQPCHlLIQ9yThtG8IuRrUjdB+3k/K7fwfdUu0S7L/vROiFBtRzmZYI1?=
 =?us-ascii?Q?398lPQcVkcgMPwTmJoSYMkY0hkWti6+l+47rzSJa/HxzSC4dgLh3075sHuPf?=
 =?us-ascii?Q?iiFIiG4TeIDoy69rty0UjBUntodeb18Is0zuaFNdmumdi3wIPB61K2shbsCY?=
 =?us-ascii?Q?FLCayXzkmuD7dCiyO0kdragayPQ38L626RcDdhFCR2ofIABtxRt9pdATv886?=
 =?us-ascii?Q?d5omyOUWg2rpZW3BNNxSYvw8fAefOreFYsscukYoI5JsVZpKCUwXN8cHGCIw?=
 =?us-ascii?Q?sfsNfjr18dyAXV+55Ib5WYtoDyW+70q2nQd48diF/dRwbSFUWxW80Ytlg36P?=
 =?us-ascii?Q?9NRVeLNfFii2gqQSIv5RCp8kLIMKu0W6IBjiIBAf+X1phYMjOPa1ZBheDwca?=
 =?us-ascii?Q?ZfyQYfCEooHFi0jZJe7n2Ptkl3ERYWilU3an65wAoi0zmGOlOVoWO34J27Lp?=
 =?us-ascii?Q?YVgAJl/nX29xKvTG9ZiiEJ/iDV/Uj1E8//9wE9d6Hq6zLLTCflSDTk6RpV5y?=
 =?us-ascii?Q?LjslzxGPdIfHiRtYDRbF8ka3r4nRFh2wvXogv4yTbEEbEv7QfqKrrJzCo+4y?=
 =?us-ascii?Q?AX2eG5ffykIMTOIAPersYKkSAacwz4B83oSFMA/dlerNHuJRcSIa/g6Z68S1?=
 =?us-ascii?Q?3DxBABkiMJfhb7GkBWfeGUZCBmNYDIX/jBnIYCdUxRQ1y+Z0bY9V0XGR8Rkv?=
 =?us-ascii?Q?X6bC+xHUXTFLEGxxFzMnBTpgWbgUmrKLEdFclRS0fz5VB6jXTHrQlwMizxOc?=
 =?us-ascii?Q?9gTDGS1rTZjgb1TBXTKRIOHA2xztX/02Jhk9KTORayjrmkiuks0eBS3D4pE1?=
 =?us-ascii?Q?H3pOG7c08DM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LOu2WLUoms0B7isMo1b67E7YLbfhzHldHeUw5/L25/wABGJ2uL7f2H6WllTP?=
 =?us-ascii?Q?TzZff+CqEBZhE/pd3A0MyjFFYg0+48/3g1WEaGoKxcPWspcEQfYgAPyFOTqw?=
 =?us-ascii?Q?MWXBcVb8gGWQqe1jAFbmcTJHvuwBtBtM4cV/qNATkG6+/qEQIDOcNp0MFq7U?=
 =?us-ascii?Q?QG81CnLp6sX9GMeVRpaqHPooLCZFOYEKyhEKaPqncB9wda9f3KOr8lnAdf/9?=
 =?us-ascii?Q?pf5csU27MtWYgyW3vzjUrB2NJraft50hKVIGwEmu1F5quMkpOEV9nZ+wpJKM?=
 =?us-ascii?Q?BMt9IJkKskuUYPUH4EXiGNR42SQ+dOdImINPGoaFSSS/pLcuOjbJD9BV1bT3?=
 =?us-ascii?Q?7zrJGBNbZos3yxYeVjiB8uCLcy6nMzc5D8ABWCkU9xjLfojkKgPgaVPkwFzr?=
 =?us-ascii?Q?VxNfuuqz7Ym2qOEVKB9FhLikTBefvVX+H42e0CwKzX/RJYrqBmWZK2J6Y0h1?=
 =?us-ascii?Q?azRWFNQ4L9Uhk/uhEUdZA0fEcIG0+9nnmZqIh2e9PTjKhX8cztL1kckMPhqN?=
 =?us-ascii?Q?9OAlm9S7K1QNXf1IsIb3dDJ5Zs5k/d5Hx65UXxfufNmoVRjvR9Hj3wW9G+MG?=
 =?us-ascii?Q?lcy8Sclg9V+xsot2tuMilTNx1BozoqFvdeicc9VHI2zWrdK1qUAIVmzNQKdN?=
 =?us-ascii?Q?sOJri/0ngbbPb8Ifv08xIDJbeiPYx0bzcKqmb/rixJIQ9BA5vEmZHj0/vBLd?=
 =?us-ascii?Q?/mcjfhg+L75euT+ufQ92r5qEZ6mYCc86sgb8ueVJ03mGHXxatM/VzhpnT/SY?=
 =?us-ascii?Q?BnRXtHYnP5eDvQmCwNm08Teg61n/8CuJcqC7//VjVRirFf+o8D/U7JN8DrK4?=
 =?us-ascii?Q?GK8DfHVEzzqiNvA30k+I+tLiZ/blX+jLRdiF2d2FGDitEonYt1JTKVNqsmTD?=
 =?us-ascii?Q?E8xp4xVlIuOq5nLmY3aGc6KbjBdBJjJPpB5VVdEgSLSYIFOcYYcqemAgMGK7?=
 =?us-ascii?Q?Gwud9PFb3quNDlq0Y65WZsEVvHHvHK20zRUtIT/YTd1S6jAd7gg90/yMAWTy?=
 =?us-ascii?Q?12Z5Kf78I2ZGIRs4JWDkZ4ksLY9TC9Xqo0CbITPNo/3V1WhUeYVxcK53NRGh?=
 =?us-ascii?Q?E2elVWBDXPAYET20M3+qsgm9QKRsI482cSKDtzy3BphuShsL3FmrPIAdkl1j?=
 =?us-ascii?Q?CmGqlcaKM/PuFEmJYVcAG8QyShyNtj/BbNSuhH3chQIDD2mfqBwIP9qCSM6/?=
 =?us-ascii?Q?sgHPi+VqWYgxckijKNSd6d+MdsuPRHOvdGbkKG9sAFka2PvpqRk4kjlCnVh9?=
 =?us-ascii?Q?ICuoUDPTyRNHeMb0+UnUHYadh5av6r548kcYoc/qipNEkUh7h6sC37sp8EzJ?=
 =?us-ascii?Q?vMYbZ7s9kpR7CznSDXI2u1ji2DJJIWOPl4ozGHMTREquOobpzG1lBbtWXij+?=
 =?us-ascii?Q?uUaxE9A/H6Pgup21fcU4fPxNVPnsfAKTUpnWDHezpa9aVNH1N/Nat4VixBuU?=
 =?us-ascii?Q?Jb2tslaEdevF8rb2byQu+TfrxfHbXXciHsIabXVXrHpQCDfU0h3orbSah99+?=
 =?us-ascii?Q?t85jmOKZ8jN3LLJ0Zcx9B3O0SSAmb98hw5TmQAt3b7B2BrBBxj39pPsvY9ou?=
 =?us-ascii?Q?OWXs6IXfC+jjPWzD2J/IRcIBsaf6rgg22dzNDXfx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf79ad9-8e30-48ed-4e71-08ddb30bc6b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:42:11.7799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUrNOV3UbPCmErBLWa97eO8Kt+REAi+RbYvRdGI3jnJ5saiTplAp2vW1Ih2SJ8VjWyF/pT0yy7LHG5f+tRwHHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA5MCBTYWx0ZWRfX/UD8KwrMDRr6 FEwh5s83NJoDg+8WMXPFSizgHdPslFLkba0YkgauxgsTvCB7O8yCYqYcWLCRfJeMW2FTNu/zpVE we3iBMjJQpghe5cyc+uztcbvMyXdLsapaIVBmvU0udqlU3SX2h1CAnDvjNJ10C9Z529ZVIopxSP
 VYaz8qtASGf8ocaanKJucLOLSANrnugnISKgSzfiuK+aOeOwvRA+clT/ZLbuCK9JXgcDl28SAJy /fg2YOhr/jkpbBN7AvJCsoW/AUMZ/j/QHU/pSavUagpcVt3bonkNGKMRP5V6UmI0IeTR/QMCo1l N24GQC/VR9vh4lW7soIgGQ6BocTlWH4GzwDWgizjil3FgV4PmxdeKP7XR/P//7VElDGAQf2Zr96
 chwfgl/IoIvz2teNNVpaFcNe1OLmMFaezjvIqLL3cF7HMbrx6S2dxcWsA+2ru2k9rAcSfUxw
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=685a8105 cx=c_pps a=EDI2sMUdhBp/6Fwy26P2Vw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=sODZU1DNDF4EVHEcULQA:9 a=4f0m0rT7cLEA:10 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: iwQ45qfJoXqF7groCvkYw5INBW2YhkdU
X-Proofpoint-ORIG-GUID: iwQ45qfJoXqF7groCvkYw5INBW2YhkdU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 10:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219242

If autogen.sh is run outside of a git repo, the find-version function
always assumes that libgpg-error is a beta version and adds the suffix
'-unknown' to the version number.

Befor the fix:
$ gpg-error --version
gpg-error (libgpg-error) 1.51-unknown

After the fix:
$ gpg-error --version
gpg-error (libgpg-error) 1.51

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 .../libgpg-error/libgpg-error_1.55.bb         |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
new file mode 100644
index 0000000000..cc6c35884c
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
@@ -0,0 +1,35 @@
+From 7358f4ff6c711bde1d83b9a38bbf349a23e0e243 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 15 Apr 2025 15:32:58 +0800
+Subject: [PATCH] autogen.sh: drop '-unknown' suffix from version number
+
+If autogen.sh is run outside of a git repo, the find-version function
+always assumes that libgpg-error is a beta version and adds the suffix
+'-unknown' to the version number. This should not work for users who use
+tarball and re-run autoconf in build directory.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ autogen.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 9f91297..daa2730 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -270,8 +270,8 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
+     else
+       ingit=no
+-      beta=yes
+-      tmp="-unknown"
++      beta=no
++      tmp=""
+       cid="0000000"
+       rev="0000000"
+       rvd="0"
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
index 842f54b0ff..f06b46ab50 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
@@ -16,6 +16,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://0001-Do-not-fail-when-testing-config-scripts.patch \
+           file://0001-autogen.sh-drop-unknown-suffix-from-version-number.patch \
            file://run-ptest \
            "
 
-- 
2.34.1


