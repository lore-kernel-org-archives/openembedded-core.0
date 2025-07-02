Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971AEC8303C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:29:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18042.1751441363373463147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927864f6e4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5621RSjV026746
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 07:29:22 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2078.outbound.protection.outlook.com [40.107.100.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1c3p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:29:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wA9IkDGf/4ZOP2Szbl01VOeEb3qEfFm13H3GWDVXnaQKOmAGxP4smtFHqytm8KrNW8VAJA9+uDHlInOMVRx3t4YjFQxVkxhPcp/EQb4kjx9fEfR2jHhUogHcSvVQMnyAVFru2K4zngwJ3CcjLqypBN3foEJI09gBUF8O9AzAwcVU6admGooG8rS5uUSARQr6wwuoxcL7oPgicZKPd0Z78+gEQ4cN+YoCeYr0jYxeKbRsPmvrMkSLtCkcsB72z3QhhPdAvYCPLb19adUM5D8QG9mnvuw47/44qr/SSPC8zU80TF2bBnnXEG/gKAGjpzSZ7HgzEdNeVv3Qm4pNNlRnow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ar9X5YgAnN3gB8cxebQTdlCI4knBHbvn8a5OSnrh6Y=;
 b=ZHlqYFqgm0kGFw2vK1o+KjPOEqlcTJNiFfmr4O25TL04ZjBHLBiBJXgZ1/FpBVaXNCZIGkvZAGGcKEj2G0rkb0SnHBXqbGjXQqJBq+pcjdkpBxEsa0UNGFHOMJ70byO0CoTxGtr8bhEwpNj4QzfpbAyD33pOabKRtofl1CNnxy7P7KvAdN1NA49UOCS7120G4OLiw9dweEkeujyIEhLdOFfmh44daXp3Yv0aY7z9etRuf1T2VldD+SvONogzbPIzHt8gyqZD/ThS5duyunwz4XDx32Y613l76jFA9bDBc3Vw3wsUIZ4HRm9W9k+RDy7ycJyTtEvYbsD6e610WkOG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.32; Wed, 2 Jul 2025 07:29:20 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:29:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] libksba: drop -unknown suffix from version number
Date: Wed,  2 Jul 2025 15:28:57 +0800
Message-Id: <20250702072857.1267224-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702072857.1267224-1-yi.zhao@windriver.com>
References: <20250702072857.1267224-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 33df7f8b-58ac-455c-5891-08ddb93a28d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zH8H5p8HG81FDS08iBoi5j15AXa118ybyrbuYxmNE6OWzye6ylu//RCq4Z1I?=
 =?us-ascii?Q?urdpbLPLmeSKPZIVLerBCJXxQOezqxkqu8qCWoV7s1+MQDBDXXW8dzyt8MTO?=
 =?us-ascii?Q?3G1hbUwMPGXQ96KTrRygeND02KC7wuVhMtXSEkjQcRqjrridUOZ69aTTjeNV?=
 =?us-ascii?Q?GjHa7z4mkwC+WZBRZDGzmAJ9gVXNqw9nii5cn/UoaWz2MSiEcl1RlM8bhqen?=
 =?us-ascii?Q?3YZqT77uexv75TeVxZCoKf/2qQ7vd6WdxVEa/lpdrc8uDtOm5nRDC7r16G15?=
 =?us-ascii?Q?I6bFVljHCRSEpIbkZiGQ/9GkZvvXiuGjxO0uzTUxSop0JvAaBoKBy3Z7JiAS?=
 =?us-ascii?Q?rSmfEgtwRiD2p7OPGfm+yQ+KsTYg5p84KbfdNmZutHLKghpo9jC8hS9gqIn+?=
 =?us-ascii?Q?PTkOpzMZ3+7wvLhJ2H3I3JNqzTX4vzE2z9AwaQJVaEYcXQBwNhsTPo1OBUZB?=
 =?us-ascii?Q?iuYwj0kt+eoByF6uTzpquZP30ADG07A7SXB2+C6yprkpjb/GCrbrTcUH3bg1?=
 =?us-ascii?Q?v186+wwQ43ddFIio7RIapb/OVzBIKCozfs+a6018o4hMrCgt9DRcNKGkKn97?=
 =?us-ascii?Q?JxePb1r1eCZp3TDC4Od7IgnWbidcdHNbuZ4iXNVvR0JPr/VQKk4s28IATbxJ?=
 =?us-ascii?Q?R86If8aKq8ylF2yzmppNL8LPFcX8gKwPlugwCdVsLIS5wJQjJOfdr31HFtdl?=
 =?us-ascii?Q?MDPJr3krq09ZRYuqs+Ia1Dx4FkIxhZBiOaOkcWarQQaqx3IeywJy5A08iqXN?=
 =?us-ascii?Q?nsOmTrWP/3lXkShqAb74+IHSk8q4qLJF4zM01YYdTCOzAt924vJ2SBxBupDt?=
 =?us-ascii?Q?GJWI8vTKTqvrTcsYSmWu5RPK1f9p279ugLUj7SOULdxxnNg4XcrjIN2rwDHI?=
 =?us-ascii?Q?8tL44TucLJzoLFpaAkqNXwOQM0tuAGIvvqYqxSlua5Z83ghlNBJqgseFkb1Z?=
 =?us-ascii?Q?4KLV9f5PaIw6rtree0dVUBNvQaI+I+0U6xD4k/P1PHWSHRGgD0vNltn5Hh+M?=
 =?us-ascii?Q?c7i4KcJ+gc5e/y1FbPCagBwMZshtecyzAts9WV3+yiyhxcjiNIwXbRk8YD4Y?=
 =?us-ascii?Q?kreL4ZKJ/iTqvB2c3GB1pY9FUFMVu9fsmGUHaqEzxhUcjF4YJpX+us6roUCF?=
 =?us-ascii?Q?4tIKi0hseDzSv0cUsY1xeQO7F7DWpwCZXFnMRr6nAasNjcUi2gRqzR0xQtdr?=
 =?us-ascii?Q?pXOgd4zU/l9WE9cBSUbm6jkP6BAqJPV+XRjKgPtGcXbNn/arndATrcBpLKan?=
 =?us-ascii?Q?IWTfVzGj3tV/uNwn+8BXRcZR5ye4YTKi+UfacO9BlBUV5UMS38tBVgUJ3Y57?=
 =?us-ascii?Q?g02WSwgmynwTCs6ar2DLshBcqGUMjn0d39hyt5Olc5DuRKV8viFoHl/uFQd6?=
 =?us-ascii?Q?vkmRDGrHMFEMmWP1laSnYluyhl6CdGSL6sSVWk61Uxb8Df7h0FB/Jo9G5vaN?=
 =?us-ascii?Q?qUJI/Yz+PiGSULSnQTDrfiMX10ImFoWwQSxz3Ha3L+1spjtJUigc94LpNbCE?=
 =?us-ascii?Q?DqQ0OAMa2RO/IE0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cdLSzqdHWBD1P/Kwro+m/6smUdyD50O7ymZnD4nQ9c16M10KRjlDlzPOD1bG?=
 =?us-ascii?Q?yYz8QWKDU4b2Lt0e26Y0NYx4/TiwPa9a/QzKM3wpZcYL2z5Vtl1wUAql9ykw?=
 =?us-ascii?Q?ag4cCRMzaSSS1rbkgCoWedmX4oTUpVeZZEnGL0pUZnOVjEDc59u5Q+2OnhE6?=
 =?us-ascii?Q?e5puu9Y2rP7Vrxrp4muAXnQ7Faw6ZAMGh6Ydw5OaSgUfjDjn7503YyN/z7sN?=
 =?us-ascii?Q?DvUGsoq7YnW34ubkLwREcWEuGHc8KbZiPnYAUx4hI8bpmB/5dXO7TyPTc62b?=
 =?us-ascii?Q?UY/BMcyXe7aU5AVpSYbYFpquZx0Zd1GG20153jC2XL7beLd6d2vOqydbXfws?=
 =?us-ascii?Q?OaUDPDZjmzt8887pZrVRigHNkix9Euf+HI8Pfi3yya5cewiYqMW7oIGjUU5X?=
 =?us-ascii?Q?N+xucjBt7EYJC6enz+YYnNY0omPThL2H3TttzlNJmf4jlXbi/LUbASa5RctV?=
 =?us-ascii?Q?AesAFc11HPWf9tcHpJEGwHv09I2BnLVSuI5daptwQKXQCBysf85zz+gj1NAS?=
 =?us-ascii?Q?QFbk9JrcvFQBQgP2UThHHgrUefobGHFonwcjdMTguYfyV9ksuSrGsxlttGUb?=
 =?us-ascii?Q?u9M1i2qeRiIk3sXQJQh2nTF4bZor1rezpeYhbdiP41lxlq+m1oNCKPLdgzxl?=
 =?us-ascii?Q?4SH7ZIURhOV/7E+tCZKBibJ1J+58RJGkkJ2JIbSSTlghRbIVnbgRuZTd3wVv?=
 =?us-ascii?Q?+4GxS1CpDKn6I0nLOZlJFFWqH6VsoArwpZd1IFuPnfLmKA5vnmlzrMo1ctMe?=
 =?us-ascii?Q?Iz/6uy1F4qlOiUhCcc8FJ1qENzkZ68FaUWX2YgfAwSHXtTqrRq5Lj9FVhotY?=
 =?us-ascii?Q?8dGDxwJWbfXTif5/Qjwz+/yiNOGPwiCWtWTT4qItEJdEkxWaOnbwAtk/8J2I?=
 =?us-ascii?Q?w0uEato2HY7T+pvE9dKn/JItckQQxHtFaEyuv/l3F5SweL+00b6jtTZ9woVZ?=
 =?us-ascii?Q?uvXf8aONSa5RJvqjr2Jkx1JdigXkpbkvX0VQJotRHd7VZP56M+R6fZsSlV85?=
 =?us-ascii?Q?ifP9KMLp4MoVAITMHKLg4G6J/FUOJn8lQeinPEl9iJzrFk+DKCAdIDc12xO0?=
 =?us-ascii?Q?USDyuqx16AfHUZ5xgBZBICwVsfy8YpCe7Tg+kV4WBhm52Ql5ZqltJm2IS0ZW?=
 =?us-ascii?Q?uVM8WPgU2CserxoDhhh8jbGtRTJ0uePMvZFE0gfFUjvhke9I5HJDWEP5IwHp?=
 =?us-ascii?Q?0ks796eCwnQvFWrT73A+ED6ULXDzJ67OV+V2NB0UwgjeqhTwThGGDBzoxcB8?=
 =?us-ascii?Q?l8LHTKQTkoF798S3MEe8CYLoWn1+Cbn7d8bs+FOsByXKUOR4gJFw0Mcv57uP?=
 =?us-ascii?Q?fubeYeuO/jTnIpHhxHrs0PtFxk8GIp9qkA1SLNbM7BFyZPiW5At3ZfZwDeEe?=
 =?us-ascii?Q?ZueuixJZkVmKnL7pznMRG3rX8b2Lcuvj+M8SdfNzBXO146rm+RC4eLC2ME5+?=
 =?us-ascii?Q?eGKA7t9guHWfm1wuKk4GSOUiQVIvgjLK8I97jxad50n1Im/clpc4t1sfVwo/?=
 =?us-ascii?Q?OgtQo+U4PakldhLQ3CebmtTlF3vkKjtreGLjvuq9Fd8c60ayjdFtwODJ6XIb?=
 =?us-ascii?Q?b9B7O+THdnMHH2qbWCc1vEyjS735fC+h+gH0P4wb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33df7f8b-58ac-455c-5891-08ddb93a28d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:29:20.4018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nn4bOX/cyCGCRSk7wSVlNiCV64zdFk3kS1w8RaMkzxff8OconK/Q1rUeBpC+ymaIiep50qWhD5L85IYVlHZlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA1OSBTYWx0ZWRfX8qkS0C5rHeqO unYVLr0AvBwuQz66/SihdYeIltO5UuJYODx2MZqhU0nkV4s8FaKu4KGC9jmWjXi1h3Ml42RhXRo XXiJOQden1DhxqraHY/B1P2uTNwBFgOeTBUIkPVce960Z2oF9HiLBXmQ2jDwXPAwPX5T3HYIgC2
 fiLWhnhhdVFXDF5iIKcAu9h02CyhrbiCXZ2A8xN5pUizQNVMsyckSFSvnAUtvwsNjwOZw6V+RUk 37H9Cl9ci/vAc6SpfqVA8Wjb6q5IaIFC1T/sBHglwzIikQMTlT3vRtGnD/5yaaHlvtX/2PenaS3 seBi3U/Ss8IdF9f/O8/2kx/1aqurfJc2WFXN97o1SBIW3KwfO6rNMfPH1O6WqTv7497Tdz/BhvI
 tfXjJpI1FmKcDInAXlx4NiOGxfxtlVTQev/BXyfxMaceT3Z3wYcOIjsRd1fg8LTsXcuTgYSE
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=6864dfd2 cx=c_pps a=n6opPnSa4QjJkQ1MU9ihXg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=I12mifpzxeCEc_pRUZcA:9 a=4f0m0rT7cLEA:10 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DjVLwNw0EEbRkTfyh-3SX0B9VSZ4tdzP
X-Proofpoint-ORIG-GUID: DjVLwNw0EEbRkTfyh-3SX0B9VSZ4tdzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=902 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219799

Include drop-unknown-suffix.inc to remove unknown suffix from version in
pc file.

Befor the fix:
$ cat /usr/lib/pkgconfig/ksba.pc
[snip]
Name: ksba
Description: X.509 and CMS support library
Requires: gpg-error
Version: 1.6.7-unknown
Cflags: -I${includedir}
[snip]

After the fix:
$ cat /usr/lib/pkgconfig/ksba.pc
[snip]
Name: ksba
Description: X.509 and CMS support library
Requires: gpg-error
Version: 1.6.7
Cflags: -I${includedir}
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libksba/libksba_1.6.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libksba/libksba_1.6.7.bb b/meta/recipes-support/libksba/libksba_1.6.7.bb
index b7a9fc4050..d97fa84977 100644
--- a/meta/recipes-support/libksba/libksba_1.6.7.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.7.bb
@@ -20,6 +20,8 @@ BINCONFIG = "${bindir}/ksba-config"
 
 inherit autotools binconfig-disabled pkgconfig texinfo
 
+require recipes-support/gnupg/drop-unknown-suffix.inc
+
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
-- 
2.34.1


