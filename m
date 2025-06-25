Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD354C77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 08:34:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10454.1750840480023906514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 01:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8271618f28=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P6nF2t013743
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 08:34:39 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqam3vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 08:34:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lt0igv/4bk2Dcg6jCAKlyqVAQseh2PGJAL6eh3k0p3ECL8XSSqBZVY9Xr2+3AMp+xxHRn8p0xvkEecjwG00i1faB/lIFsQ3tj2Kx4FG7ijAjBGvQCkBsQgTL5k2nWKnRw9TZlfOEaPZTsYd21w1a1kxHa6OPQVpJaaiOy0KoIMjk1nsNww9YBEku+EP0liHuJj+Me2H4GzsJpTCc1qWiaa8cX3LmSOs9EeG6YBiVDAF8EeOYL0tueM63U8IpetEA59ko0RT7US7sY8P7j0pe9RuE36U44lfr210Aevrcbm5th9q4zc2XQ+ggOevsn5B/+NpDysPFSdwGeBk/6h21ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWIG3pJSYJ4hjTPZqsEq96ycsWDsy48L6L8P4kM31KQ=;
 b=p5t9+HyuEWgSjXF9YYEdP6P+qgKZtFbsIcb7J/7OrQr+JFxLWc3SVEQxx498VMis0+/hIqhLbgKcbPUSbYn2OM3qKx4kYsahuqzF6zzU4SpCGO55sCb7VI8A+2QyMUXV7qnb4l+FiAxKLUBh0J0fOrWcB4WLoocXF6w1vuYJoU9pDPHgYMRQsNvS1m9P/O6uuGd+2EbFVIpgVETdHN4TvqhfLru538wMUceKAt7RyfrIwz1BgFylvCWcTWGjL1WmQCsbcJh4nBuLauS8qjyMemFkwEGZlVHHRSZvsuYZmeNLs3QqfruykfYTCrQ9P23c/Q+7yxJbYpsNL6+StNC4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 08:34:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 08:34:34 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] util-linux: replace submitted patches with a merged one
Date: Wed, 25 Jun 2025 16:34:18 +0800
Message-Id: <20250625083418.1900098-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::21)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: 8adc6e8c-ba6c-4bad-d185-08ddb3c31cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lsCVCdPYPTpSFJYu99zM4pU+Opf2SNlzEus7xKSFz/a/khTalX9hiFP80Y7i?=
 =?us-ascii?Q?TlWpbQ4XQcc1SfBfGUfUVkzcvizVLljHDaFdueONX/KQCKnlD1BY7qtOmeHW?=
 =?us-ascii?Q?hLP+Jzqvo+GFKcLXtKkLiTGDFFZQZ6LFxubfeEIFS8D+N4PlNOtJM+oU3uSB?=
 =?us-ascii?Q?x+iHj0dGHuRWI842YQFQVzaprEdFU++f9N+aeC+ol+UYHw1v8wY93WoDg2pS?=
 =?us-ascii?Q?zPX6LKr1N0wviNTY5gi6o6PWvSL2supkAw1U2FrfiDN0uCFg/ozFLP/Ktqsh?=
 =?us-ascii?Q?jdU4iw/v8qbhH2pj3dTnFha+F0KI8ibLzGUSWYuirMncaaVz239SyH/+Jr+M?=
 =?us-ascii?Q?iVo57BAQ+BGG8ZZcf56/hPRFog3Qb+X2TlvvBaWRCMU8EazRNAR+vCaKgsFD?=
 =?us-ascii?Q?gzTyNIuiwpdWREqz65anUFs+md0rwZDnMwLQaKhYJpzX+niiLgAE3PTt5ubH?=
 =?us-ascii?Q?nyjYy9cV2owrv6IRzDHwMR8O4ZuOT5ELsQIuCJibtKmnEGxJO4VuTDrh2+td?=
 =?us-ascii?Q?v/HDVIxdbzn+I83a/hLqmBrK+zYAYhZBcOtX4VjSm0xGyq9KbfMthSKHVNEZ?=
 =?us-ascii?Q?WUmiT/xfQc2tGNeF3v3C6HeYmSr8GHDEyeQTUNDWlqLFsCXJKvAMxiIBmbkt?=
 =?us-ascii?Q?YLZgNW1he/kkURn1dK+7XS/FO0XO8A0pmxZyaxmT5O5MJHRzvg2ppLNHG8Jj?=
 =?us-ascii?Q?xN4uKBZA8OVG7ANORU5ZiajFVzgM1Akr2SQwHPSqLvavdLP4CU2L8M2b7lpq?=
 =?us-ascii?Q?pQDOZegEIRXVP/h82tWekCgdmqJZyJBuShbBf7jLo8TGXmRXiUbK+TVxfgB6?=
 =?us-ascii?Q?/50AYtZTsPOVY8kezl80295/pi521kiBBiIYhcJ0zdOwvOUzd9j7CJV75N0F?=
 =?us-ascii?Q?BWEFYdk7KoKZ8dQXEgCxBb5IzzKtr8BcFLjZARekaXyvhorAGtwPaTRytie+?=
 =?us-ascii?Q?9K46bFkwYWD5HXJx1GnUHEStKSgR8jmAR7VPoURLGwoybHvmuY7kFEDvAlo/?=
 =?us-ascii?Q?g0Kv5GR/OmPab5yQVpypn3dPcDQE9oCyLVVsmGqdTZu6T7Nl5tCVQSZOUuxd?=
 =?us-ascii?Q?2+CXHcCbal6RpVFhfIebVNVq+uR8Elw72EJcOZ0S5TUWuzsH+V3+/axV17M2?=
 =?us-ascii?Q?fA1UBWJPY1+0dn/jOOb2wCI24ub2A+5wvKOjV8PAi4zsOb44mFIba9eVETuJ?=
 =?us-ascii?Q?YVKBGZCVZXOUn7rElrl39RNyd1BIRWvv2Ku95mUO5srFWlLRwpE44L3zjB00?=
 =?us-ascii?Q?yXccp0yJq6C0qMM7olJvrlm2Mo0f+j2XVYBVk0CvHqyRc4iycGe2GC/tBBfj?=
 =?us-ascii?Q?fqP/DVotBSizvQdJxswS6s5qavfECOTska5KW6B3Dx/Klmth6iWpipEjUSAB?=
 =?us-ascii?Q?lsqas4OWqVuT/2rWYJY90s0kH1HsXb6hnMBDFMcTVgLspOwTd8mNxkJ5qNZ/?=
 =?us-ascii?Q?qYm58kPIpnv2iXHX//7mwxy0GI9zX3FNPTEiIEBzHvzZqcRzMlDkN2S1vGhm?=
 =?us-ascii?Q?kdOYsfSwAK+gOYA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AX4Ky2vkOMC42kLm9DxXKqHWRfVi03vBm9sCnpwJX83iSDl97UBGCb2bCRQg?=
 =?us-ascii?Q?4y+Zx52Q2xoBQGSPebk/EOQvAgxSE0ZO8nze6POTJ9XXDblJEJlREoXGGjKX?=
 =?us-ascii?Q?sAxuCeOAtNHCIPYdt6DqwMC0gY6WattMvVgNjxfG6zKbQycqK+L3umBz+XV9?=
 =?us-ascii?Q?74qN3qQIZ7PmC0gVdj2DIwu+SBTCE3eJi+NEj/y7XlAHRF8y0m0imMdjH9pF?=
 =?us-ascii?Q?IQkUeaTG+md90jWS95C65LeV/mSOjSmyc+Wewjmxx7FacZVqG5KtJPXeI6WZ?=
 =?us-ascii?Q?tkI616of49c0n7AJ7uQw1At/zQd/ut3fhFhhAoDk/RPGPQUvfPlUTj8NnO4m?=
 =?us-ascii?Q?Qa0VFxj2upvJFHZ/SHw3BEeohDzgRhyx9H9Cf2QdxOwgN/qrmJAhJacAWnmR?=
 =?us-ascii?Q?kyricVMI6zz1MFqPJNaP/pAWi3pp7qFs/IWKtJChuqp6fWofTRjcFNyIP2hR?=
 =?us-ascii?Q?xbKUsmK/wShXOW40+/SgMoLmIr4xKYBdAzr+2FJ9wV1b7e8y6YFYtVTuCPCf?=
 =?us-ascii?Q?8LrmhKxPcyFwZEwowIC2R5CdiHd0vdr8JBifMbDHbN0yZhqf/l+Fqlne639Z?=
 =?us-ascii?Q?H3mxqOC8UhOKIuilz0Smj0sYyrFtdpDPQHoaLiJvsfw6YUWp4PvaDyIw5XvS?=
 =?us-ascii?Q?68PXYUjz63Ho72QGMS6FZXnyJPjCywc1aCBIIf6r/qRUwwGsiL6wXkzRak07?=
 =?us-ascii?Q?5wXMSyB3ZoaR2Y1NVRGlenmGXCfrAL3a/eU4WEAio7JjZqjazDBOU41oS0Bk?=
 =?us-ascii?Q?KyknWxoUVpHlMHQGSElTD9bXHmBxMkTRClv56DVfwWuf+T+wudRp1h+0Jcum?=
 =?us-ascii?Q?YNAopn5nZSh4P/ylRXIx7hd1zbADUo700SENVTQs4VAzLRrwR33BgV1swhC0?=
 =?us-ascii?Q?82+Jczj0Q1JaCVYl2iDXqG2vbZzgUYO3TIVJHPZUy0fpD2N99KJSv1CldtpM?=
 =?us-ascii?Q?B0hgRCYrHOVmRH0iIlLlce+fI2AxQVZHSmUUQGsxcdiSLNzlr4/DUq7SmDl5?=
 =?us-ascii?Q?b/mqum8+pCTDcF/y3dRWVSxIrEajHwUMLwzEOu/4Ae2Bzc2ZH+lzvJbTKrI+?=
 =?us-ascii?Q?jDFBGpBkt4F5UrKtn1SikEtedrzE0KWHrj26tWLV7Srczv5R1qOLzaDmEbun?=
 =?us-ascii?Q?EoH4Hxw+OPlkdpbaLctQyo5WzjJCInI4xSpbBd846w+Nb9xtwdf/Bvp1x4ni?=
 =?us-ascii?Q?OBqlwiYhNOs9AbuZO8/jRXdTsfwbpEpa7ANOxBbUxgL8/jQHU1mCwZXmnPR6?=
 =?us-ascii?Q?jxn7Cmjz6NE38hg/IVlPwEewu4H8e1ZhWOd5UJj2A2DNMEp/EvIgKa1nY9WP?=
 =?us-ascii?Q?Kf6+RGRDLlo/Bn+g7H2VPsKZIQslnPdflLlBtBodWH1acTe27R1VZfZrqf/X?=
 =?us-ascii?Q?rKcRLqaXfxpThuwJ1eq1NpkG3XSbjlKt1zAVDQ6lRElR4fvCxpKmtRmq9gP1?=
 =?us-ascii?Q?RHKoDpGL6RX2zcJEhhzuiOHzyLyZefrCVlv+9qMTaNQNbbB4w2PwKQHXk/AP?=
 =?us-ascii?Q?pRQCtW1gTKf15ROs7Lcc7v1xSuIaOzBKLQ1JTxSkWyQsrItTrK/YfY+WBLSE?=
 =?us-ascii?Q?tUzbCPe9Y0csoSPfpW9hzYkHC7UI3Ioz8YVsTJ5W?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adc6e8c-ba6c-4bad-d185-08ddb3c31cb8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 08:34:34.0362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yI7fYGDSyNei5D6n9FyCFPbuWvsoLXrlHMN41yarlQ37sL4pccgRJjlVwZN4uQuKw4LdujGD4xvDf3qh8wwdTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
X-Proofpoint-ORIG-GUID: g0OVQRKgg7UmEgBozB_vkRrOh4gSGlXm
X-Proofpoint-GUID: g0OVQRKgg7UmEgBozB_vkRrOh4gSGlXm
X-Authority-Analysis: v=2.4 cv=N/IpF39B c=1 sm=1 tr=0 ts=685bb49e cx=c_pps a=2GB9L8dNip6y3bDgyjjg1g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=o4nVkG7QvNqdAdRxOKYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2MyBTYWx0ZWRfX6jAfOHUrxR/m 4jrMyUk9xdWD4ManPixtjLQZLghbNFc6gLTJkILQp4R6F8NRBny0oDaO41A8+oPxLOLxzdCyEvq jqTi6xbg2Wf/sOB3+Gfmh7qjJy0PT6+np53V+MdHHmJepNdMgo/bWFxow/+IiKTerzxZ0C16Vb4
 DTLrBjGljLGAcXdyzepjK1me4LeyS7aF2nvBNyav4DNcGflviF+q6DBOZvwC8ID0zSXDL0WMSEv N45ixa8qLF62DlYszFNKTKltT/LQRjjCLGsxYpG2lIh7CltiRiAC+oRwVptm2kIWW4YioDGDT5G 8/uhchi5cPxPPPPh+Eg2bkIzpQzO544UnqYA6LmCwhMepL4Zyxw7pTPUceKqklugG4o9cYvh0rL
 CxeKtT/mwWDSsO/N3GAXyqDwIKEfyh9lDzaBYjrWPyF2qq9QIKSyS8vNZWLvNOjaYwSUrlUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 08:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219305

From: Chen Qi <Qi.Chen@windriver.com>

The original PR, https://github.com/util-linux/util-linux/pull/3605,
was updated. Use the merged patch to avoid any confusion.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  3 +-
 ...01-test_sysinfo.c-print-out-SIGRTMIN.patch | 50 -------------------
 ...e-RTMIN-from-kill-L-instead-of-hard.patch} | 16 +++---
 3 files changed, 10 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-test_sysinfo.c-print-out-SIGRTMIN.patch
 rename meta/recipes-core/util-linux/util-linux/{0002-ts-kill-decode-use-SIGRTMIN-from-test_sysinfo-instea.patch => 0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch} (76%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 6611ec0fe7..111f29cb92 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -19,8 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://fcntl-lock.c \
            file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch \
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
-           file://0001-test_sysinfo.c-print-out-SIGRTMIN.patch \
-           file://0002-ts-kill-decode-use-SIGRTMIN-from-test_sysinfo-instea.patch \
+           file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            "
 
 SRC_URI[sha256sum] = "81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b686b3fe475ddca4c6"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-test_sysinfo.c-print-out-SIGRTMIN.patch b/meta/recipes-core/util-linux/util-linux/0001-test_sysinfo.c-print-out-SIGRTMIN.patch
deleted file mode 100644
index ee9f220842..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-test_sysinfo.c-print-out-SIGRTMIN.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 50774e34fee0cd528b195a863bcd4e3a04fbfc4b Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 4 Jun 2025 10:52:18 +0800
-Subject: [PATCH 1/2] test_sysinfo.c: print out SIGRTMIN
-
-This will be used by ts/kill/decode.
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3605]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- tests/helpers/test_sysinfo.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/tests/helpers/test_sysinfo.c b/tests/helpers/test_sysinfo.c
-index 1559d471f..3a791e7f1 100644
---- a/tests/helpers/test_sysinfo.c
-+++ b/tests/helpers/test_sysinfo.c
-@@ -27,6 +27,7 @@
- #include <errno.h>
- #include <time.h>
- #include <sys/ioctl.h>
-+#include <signal.h>
- 
- #include "c.h"
- 
-@@ -116,6 +117,12 @@ static int hlp_ulong_max32(void)
- 	return 0;
- }
- 
-+static int hlp_sigrtmin(void)
-+{
-+	printf("%d\n", SIGRTMIN);
-+	return 0;
-+}
-+
- static int hlp_wcsspn_ok(void)
- {
- 	printf("%d\n", wcsspn(L"FOO", L"F") == 1);
-@@ -229,6 +236,7 @@ static const mntHlpfnc hlps[] =
- 	{ "ULONG_MAX",  hlp_ulong_max	},
- 	{ "ULONG_MAX32",hlp_ulong_max32	},
- 	{ "UINT64_MAX", hlp_u64_max     },
-+	{ "SIGRTMIN",   hlp_sigrtmin    },
- 	{ "byte-order", hlp_endianness  },
- 	{ "wcsspn-ok",  hlp_wcsspn_ok   },
- 	{ "enotty-ok",  hlp_enotty_ok   },
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0002-ts-kill-decode-use-SIGRTMIN-from-test_sysinfo-instea.patch b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
similarity index 76%
rename from meta/recipes-core/util-linux/util-linux/0002-ts-kill-decode-use-SIGRTMIN-from-test_sysinfo-instea.patch
rename to meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
index 5a00c9037a..f4e2f9e745 100644
--- a/meta/recipes-core/util-linux/util-linux/0002-ts-kill-decode-use-SIGRTMIN-from-test_sysinfo-instea.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
@@ -1,7 +1,7 @@
-From 9848b0d8c90d9a24275bf402f6d76e97f62b3ba4 Mon Sep 17 00:00:00 2001
+From c5d5e8873029d170fcab38a6fbd5d5a355574b9f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jun 2025 16:27:19 +0800
-Subject: [PATCH 2/2] ts/kill/decode: use SIGRTMIN from test_sysinfo instead of
+Subject: [PATCH] ts/kill/decode: use RTMIN from 'kill -L' instead of
  hardcoding 34
 
 glibc uses 34 as the value of SIGRTMIN:
@@ -16,9 +16,11 @@ With the hardcoded 34, test case fails with the following difference:
 -Ignored: HUP QUIT TRAP PIPE ALRM
 +Ignored: HUP QUIT TRAP PIPE ALRM 34
 
-Use SIGRTMIN got from test_sysinfo to fix this issue.
+Extract the value of RTMIN from 'kill -L' to avoid such hardcoding.
 
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3605]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/c5d5e8873029d170fcab38a6fbd5d5a355574b9f]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
@@ -26,15 +28,15 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
-index 03bc25ff6..dd34aacef 100755
+index 57149899e..524b4e5e2 100755
 --- a/tests/ts/kill/decode
 +++ b/tests/ts/kill/decode
-@@ -48,14 +48,19 @@ ACK=
+@@ -53,14 +53,19 @@ ACK=
  	    # Sending one more USR1 is for making the signal pending state.
  	    "$TS_CMD_KILL" -USR1 "$PID"
  	    "$TS_CMD_KILL" -d "$PID" | {
 -		if [[ $("$TS_CMD_KILL" --list=34) == RT0 ]]; then
-+		SIGRTMIN=$($TS_HELPER_SYSINFO SIGRTMIN)
++		SIGRTMIN=$("$TS_CMD_KILL" -L | grep -o '[0-9]\+ RTMIN' | cut -d " " -f 1)
 +		if [[ $("$TS_CMD_KILL" --list=$SIGRTMIN) == RT0 ]]; then
  		    # See man signal(7).
  		    #   The  Linux  kernel  supports a range of 33 different real-time signals,
-- 
2.34.1


