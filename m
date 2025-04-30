Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA59BC369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 06:18:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10727.1745993906456963741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 23:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72158707b6=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U59o7t003901
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 06:18:25 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6ug0dmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 06:18:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+mnC6DkbYTVi4bEgvhMp758dS6q33m16NUAntz60GuQYxD1QnapUyuXeNcbhPrUEbyDaHYh+xIo8n8klg2zD2J40a08bezI9owzwdzC76ehl+lmmEViUEU+rTqp2LQPCecrDTU9HOh2kqOXxhTjN3gaj4aeAp1Vh6KYkTH2jRk7iZYLvtLBasu47AEZt3auwXOUc8NJp1wyL3N6Ax/F2BQmyWhP5b1iKwcC+pl4rc0fCZK9EQ1Yr4S1knQiklsOOzJf2CqZDaEzfNffRlC/KsTWUciduF4s3a9t338pj2Guoou8YjduW//ZO9AWGLp6nUO4gwX51miU7sqtk7zGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRHpEMjQpgYF+GjrfOcwQd9HCPuGaMFvq7U8NrP3ALE=;
 b=qNyBWOio7iaMK79d3HLkjUTLXlFPfQIUdX7mg7tBm2Gw8LzxQnR41wZRB/R6bSAuQO2PmVhIC0Ug0UkMa4LJGYDtN10F1gqzYud3m/Jrzdac/hytm2cP7xla5ZvnEU7cQ2t5nTAjq0PCmxhQlqHLojZBtdzl42XYzye76xGq2GBiEp4GBkTw9/jTylusCcfgeN2yJln6+qyUrWLvtjwBKxCoTvQOn9sPxHnRWSLnenxTvzpxSrO4shUyO+Nxm8Aq9FHBVP97InZoUpmcQLtZzo665VZVYc96PGgGsbSicKEoKytTgRsqFZ0uO/XQFAyxxKHKjOMNUgbq8i0G/QXEZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH0PR11MB7563.namprd11.prod.outlook.com (2603:10b6:510:286::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 06:18:21 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 06:18:21 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] binutils: stable 2.42 branch updates
Date: Tue, 29 Apr 2025 23:18:04 -0700
Message-ID: <20250430061804.498385-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0047.namprd07.prod.outlook.com
 (2603:10b6:a03:60::24) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH0PR11MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: aea04319-832a-4694-c158-08dd87aece01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4MOrW4qM1VfMIfdVeCcN+rKVJS+TkUk/lw6Gqg+BRuG8yohL33BqDaXxYVWd?=
 =?us-ascii?Q?yLDOFsMNUbWI099JR8J98PqojcE/1iP+Wjza9h65jrgk7vCjGgYDh4/WIznN?=
 =?us-ascii?Q?j3yzPE+Z5lBrgDuiXQPoDpWDetQWGZVQy5mYK+oYI+uje7dSrdjGN+IzNrrd?=
 =?us-ascii?Q?fwSJrShsGoFbXEhoaXXUOLVGl7IuKPcSUBYhNjAUz5All/6vyCPFIb1gY1B5?=
 =?us-ascii?Q?XxXLqdZlpZ2MwbrLP7BXeJnk0qAcs4N4wgdwsZlC0+xAhStlQeynSRQaPiac?=
 =?us-ascii?Q?Qg7bnmogQXrTzGIZlhaPM+NjdYS7Oc9m4rbhaBZiOdZ2aWWc6E8iOozET3fJ?=
 =?us-ascii?Q?DcVirl8mL2tAdBEY+DI+TaEWfvedJsg9k2wgGID40JLJASsMVCaW0DUkKUja?=
 =?us-ascii?Q?G5qNYntpLURBX8U/LqgcA592egQnfjqhMw4pAUn35El04qs1oXTuJUMxToHT?=
 =?us-ascii?Q?jC/5WPnc9uHgSFzaRoBsOtEExFzqGGEdW91Qck0N7Q2rzOtpxWDJK5QE+HVj?=
 =?us-ascii?Q?q25E1NDitNNfMbzct53DxxsIuTNXoARqUdhvV6nhOGIx6ouP9ov2nmrC3y/Z?=
 =?us-ascii?Q?o39UcVGdMQdJ9wvcJuurvD2aAbwNV8ROfvazIHfJCb6rVtEOgoqtL5FPMp1m?=
 =?us-ascii?Q?KHklTrj9JNPOs0SSpQc12hktV5ADT2ErJWM+Ba7gnVSpjIQRLSnDvucDim0j?=
 =?us-ascii?Q?vPAwuBXcERayJxn9XFdWzgIBzf2fex2fjgiPdW0zPowU04H5M6vULteD/0vX?=
 =?us-ascii?Q?TuUj5YzVbttKFNFszQHaQSWCEICjP5kMk6KXu3Q9dDFoL24DlrtlsKQffnVL?=
 =?us-ascii?Q?/47N720ZOpG/O/H7+O9XDvqeYruOfrquhacvjQGGyPHIQ4MFyM6isaS/lRw2?=
 =?us-ascii?Q?W+Fb9Ys0MoLd7mLEnAe1G5doYk0Yo1rDi9m4F5Jpcd+1rOZJXqVcx7LrrQJg?=
 =?us-ascii?Q?681vs4UkTslWXm+3/6vtbbvc+1cIS8eHcX1Es7BReTpo7sEsf7ooHgXWGHlX?=
 =?us-ascii?Q?LEuyAnlVqdvEQ1wDhmLYQzlmRqzMbBI8PhQNn6QW2qR3+0W3idM/RVDnslSW?=
 =?us-ascii?Q?Y1t4DiELtIhX9+LPLVFdEzN3ePkq1U3Q39pKY86P85LVsUTIe34ctYvpxKag?=
 =?us-ascii?Q?jxLOk35bcLk5r+EK54aOI+wZigECqGzMr55KzpJDUG21NIjgBB2Sqbi2XXQ1?=
 =?us-ascii?Q?LpAzXxAomALKkVDWWZrUsceKkPpo1yPNDPMXKap8E6fNMBc1+FHhp4hsR+z8?=
 =?us-ascii?Q?wbihcnwKMm0m2sC2Pki+GWe4KVB8iHVw6ASGLzVSJGW98dYVqUIecYoUuZnq?=
 =?us-ascii?Q?iF3UWpWPGWVqmyMxVrn6WiKwSDScgCDhkkWkDrab7CAOX14KbUgNjrdjgwuT?=
 =?us-ascii?Q?0ngjTHE9mzvYoLW2YWTvd/tKjd9GxCfb0EjhFa32hhJTfI8rIJZaiNHJ7O2j?=
 =?us-ascii?Q?atxcIe/RU1IoAPdU+XS9VFmfvSF4feoeujzkHV1xt9CmjTls2CzaQg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OOdc3xlHhNC+qS1CPAsRILfh19Uzt68jUKqHiVKfXVKVvcgTiSSTH4PRGeck?=
 =?us-ascii?Q?qhGXScE3IGbYUgkFa3dBvZ0+zT8On0urvE9dtpfRBTwneCoI/CXJzKSEDE0q?=
 =?us-ascii?Q?YEKURLNMsjdEDC/AjdiF8PNOyltNUbKRwDLxG+uTbXa91tcFPv3yWDVwCCjb?=
 =?us-ascii?Q?MkcIf0JmvMTCGeU4SODPUsiBiRitPWY100CD2sxd2fjbxps8xOwRZduUiQZF?=
 =?us-ascii?Q?6gGovU9aR0Y9soaHqtGAFS/NXGulY01XauNp6VD24Q8hOWXo3w6zlGH7piCf?=
 =?us-ascii?Q?+maPNR2nbNDNAmTtGG9xKOW2YmOnEB9jieqU94EHHn7Ac54PWsf37d4a//7E?=
 =?us-ascii?Q?ZELidiRwPG4ZdAz3LQqPs5LUEXHUPCZT9hlKCdAG3nPUgaHTQq4t5HcA27dS?=
 =?us-ascii?Q?i4oYlr5NFmHY7XAx35Z3TxYEXX8s7gJRxhftv4CyWVrfsk7dSFTlAC/XoBHp?=
 =?us-ascii?Q?b5VAUJjNyAe0IyMBcSsrX07apfH6bucmwX0lUmJ8ImWEN09QGGY9aa7HwyVm?=
 =?us-ascii?Q?MD8I3HC0t4GZxrARj8u/hbDG+Q1t+KXGxPUj4Jx4k9bWGQZogLJ8XgSmQbT3?=
 =?us-ascii?Q?O8S7q0Bf9mb/b+rOMuXYzTcjNWPDocW0NxSXmML/9KVV4zYnbCWcITBrFDpw?=
 =?us-ascii?Q?Wvhu5xOBN2xDrI3UicdaHIM7XfR59E8RcuK18x/2PCh5z3MEQIyfemMhraF8?=
 =?us-ascii?Q?gf9AH7EOPIpkXRrAx4lp08lLytBf/mXE768k4dGSo+6fPOhD8d9w+GHsqd+b?=
 =?us-ascii?Q?oEuxr5IcOge6ee3i6YTsspO1b0tqCnVm2AuRW77sbvxNWSv/Uz5Yi36r4jOI?=
 =?us-ascii?Q?UVRrazsZJtOrOzHgct6RAvk6V2YSDFuWGXC/aldu6cyqSmQgRPnzusBZ4s4I?=
 =?us-ascii?Q?MEYyad/1XFYYdVzLOHizgMVg/vp2tfjH4G0nsliy5P9M6qulhYsuUMOeVxUP?=
 =?us-ascii?Q?lomd0P2t4Yn4YwjA41dgLg6+/RqnY9snC2vmR5BgVQ+jm7WHq9WIgzCPOCbC?=
 =?us-ascii?Q?2CECf/J2k5T/U4lk470TRg6vaZxJjC7AEVy5pFHORldTOSBngZy04MiQDmZq?=
 =?us-ascii?Q?ZqIm/bBTZ9QL1pm+UX/HxFzxpZQb39+pogZVvoiiaFJ3oLzEZVZaVhH6u8Vo?=
 =?us-ascii?Q?yxz/6zHYlA1EJPolVw2NhUaoY6Jq+xRDAZ/SnMwL+cAgghQ9n9OFwQAfhIio?=
 =?us-ascii?Q?xjS2loXIw8PJZosJLFlGvWikHp8VvtAr0y9wQ6SZJSZlUPwqk9AsyTN9WkHO?=
 =?us-ascii?Q?TVL7EqOtg6REfkxbGi9FrIC1WcxE8xZcDHw0ByX7fM9ym0jzxpnHdRos+KHG?=
 =?us-ascii?Q?KLqJu1DOiCzZPSyj4jxcayee8OZn0nG1a4EuvkAEW6L+sB44tO53SViah3eG?=
 =?us-ascii?Q?P10M8CXIBk9q85CWDO7JRoqbXJi14EkZd4Z0zklegWb278sqlqF1xXkduH8W?=
 =?us-ascii?Q?UMfNcSqvpYL0nVR6HZP8oV5hTn4es47k6AIHatAJLQFbkRWcLt64Bx01P2K9?=
 =?us-ascii?Q?NSwu/KCrI5MQT/SQRg+WQND6u50B+jXcA1A3Wsg9plX4Kn6O69/wt2oDu9cw?=
 =?us-ascii?Q?Y2miFZrJaLppZPJ1DeWYV3tIWoK0D4yCjJVBTtgw4B916RW/0xrsy9M/WQB0?=
 =?us-ascii?Q?cljpIuMR3906S1hvTAC833w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea04319-832a-4694-c158-08dd87aece01
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 06:18:20.8479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mFHpvLMwPhLnvvqxKxK3Iklri6ntwYFhSZDlKPVmBvjvbOe0QAPf0mh0dkwYV5WUX1t8exJWwmgxEY4Y5Y07xXj6c4O2C09eHTtl7p6hYSyTyhgH49GTDvQ1JAK92M8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7563
X-Authority-Analysis: v=2.4 cv=Xf6JzJ55 c=1 sm=1 tr=0 ts=6811c0b1 cx=c_pps a=Bc47kgIQ+uE7vzpOcRUeGA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=WyqX61epEs_fYRVEAk8A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: 5J7RJAXbvfp0R8P4_iEFB-lk9zw4fCdD
X-Proofpoint-ORIG-GUID: 5J7RJAXbvfp0R8P4_iEFB-lk9zw4fCdD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA0MiBTYWx0ZWRfXzKUQyI2C9c7c GgURXLEg/sD+5FIoS29Ekc3+CFrugDu1tk16zVGoEo99TCx59gQO0glmSeWC8ogSLmey+Sl05zJ sX1ZzRKgBXWThZdjw6ToxuLRWPq7fFQ8J1/m2Thquafimzzv7XLw0Gu3jcqUwKEolGwmfFBh4cw
 Plv4abaYiuxM1YtZGYSCfxpdc9giHHV3SVL5B69iA/4S9Qre5aEQbGoV7aOZUX+/q0ujqCEeIZ4 JW99fk3TBcmydegxzVuUyCclDo9QvRL3R07kU0ePM9oawqlyK+NV8pUbhNxzyA6duIp2pE4lkL/ Hb0lF9N9Hf4s1bIve0tcHF3qMMw2IZ46H63jNVI2KS6kdC89vEX+yZYuXtIevWYvWCTztmesEa5
 K6JwmaRKF98Bl3bO+NxagB+h7jH95y2L23C0EPhSzCu0Du5L3FKf+bBD/tDayVneQu4fyOOa
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0
 mlxlogscore=834 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 06:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215724

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commit on binutils-2.42 stable branch is updated.

6558f9f5f0c s390: Add support for z17 as CPU name

Testing was done and there were no regressions found

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 9fc29301f0..e103e712a4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "758a2290dbdf0d6d6c148c6cf25b2bcfd7a5b84f"
+SRCREV ?= "6558f9f5f0ccc107a083ae7fbf106ebcb5efa817"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


