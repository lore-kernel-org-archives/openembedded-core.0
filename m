Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B345EC61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 09:57:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9128.1749722244137385730
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 02:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8258e96b79=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C3YbaA027382
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd95bnx-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFhkyMggBpbWG+4sf8IArLWOzbCrDdK6hFwoC/46gh9ULJyK3X6QO9nz2quJmOv6PXgl3SSwscrn/ktUCUqbEMn4T+1j8JOfmCVWoe8W0y5s19T/Mjdvu79RpYvgOv76+E1MQ0RZr9IAGYgQbUs6EFzpVC3bOOjsSfF7gAh9n3CZP2KmDUKNdCLEE16CRn40/zUuikUEgUC8O/Ld2Q/bKMPYpxA+lrjB/mLrZrPWOymZKaKjP4DNujnODaJf4V/OUDW14ZHiAZrctT02DuxMtOeub8LBue2WpxyIbDiGWFep+4zAynM8XIPYO19pCTDV4+U66ytSCbOM3PYvIRQ3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4Lu0EvtzUMiGHx9p+cgGCQ3fOmCplCemIzHEkvp9ww=;
 b=usLS2KU+FM4oDuf5nxxeL3ymU7u9QQhrI7XYxxfu26AohFJUdsr3uYVDEkwBBzN+gWSTi6JQRL3ELeWCuOhbPKwJpiQeAiOTioKMbbNXZj+14C15tCI8ICQulrwbwV/g4Fk+eOHcBZcWUHUqIItVhfhf/2w2w+7k15X13F13Q0Lw8svTsJULkfPGmz3n3mQFMQCg7i+J7iu+wz3TIhpNivPAK/IbVxCpFBDLELk5E65gJWFEuUls+dJpo1dRrBy9cuBtUlVpBPA77Ud401jmmnjcjPIif6bJCBqm98zUQc/ERWtKuXYD96T7roXXa/Qtfcuu4+rRoDbkubGCdEfdQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH3PPF2B89F77E0.namprd11.prod.outlook.com (2603:10b6:518:1::d11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 12 Jun
 2025 09:57:21 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 09:57:21 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        =SunilKumar.Dora@windriver.com
Subject: [kirkstone][PATCH V2 6/8] nptl: Fix indentation
Date: Thu, 12 Jun 2025 02:56:37 -0700
Message-ID: <20250612095639.3630518-7-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
References: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::11) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH3PPF2B89F77E0:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3bf716-b40f-4a42-37a7-08dda9978663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GrzzppNDmigYvxvd929JKqLdDuxol5rVgQebsdx+59uh6R38aLhniPuLt/kp?=
 =?us-ascii?Q?QReBd8SuFvpDbYlLqUe/7lklWf5XgMOj5FkWzFm3wrh3bujZvpC0wwpO7yBt?=
 =?us-ascii?Q?diG0fgp1WOWNsVXjZ51zSFwNNlLDYzyxRw6EkOlX0wmR+VnJCb3a6z1DvDhS?=
 =?us-ascii?Q?tW0wk+rlC5f09ULmNnOchvUG8CCY7Q/gatyTz7saPmbZoFO2L2g6BzQxDXOB?=
 =?us-ascii?Q?N2G7LeleE6DPyRNfUHgwWEZZd5DpV939aa7RXL7W6Pnpmb7H5WAsThWBC9tU?=
 =?us-ascii?Q?je0TYmB4saH9qtueVyHaMoZrvIKKp/NvlKYyUO5YaUvxJyL3/Wjvmfc2JSjn?=
 =?us-ascii?Q?kC+VoDZXrU4yeY7L57121ARwBjZengk7uHvJSB6r3YCyoyIvLlCNpFipVCL1?=
 =?us-ascii?Q?xftJBGc/I4JcOxYqaqboWbUmy9lcxZE9PZVLNeWLvO6VJqHweM5VmcW22JTB?=
 =?us-ascii?Q?gpjSt7Hcojp9hPMbpMzvKooGn1KeEZxfAUMalE3ZynVlFWBPyy8UrAmHO+SR?=
 =?us-ascii?Q?8n5UmKM/Zpgo2L76o6PZ+ZGKDg/8/4z1aKD1v4tqY6DacyRXIsO88kLyYoMd?=
 =?us-ascii?Q?QR+CjRgmbzC6gR8xO2AUp9sRiyDXpYhsXLA4iiT9qj4kZB7FoLfxFWPJj8xx?=
 =?us-ascii?Q?fFbsncHaDcobsYUf1/wBFY1J4qoqNqlxiPjklURkIUQiBgGrfDfMF33MzcAE?=
 =?us-ascii?Q?6Zz8XKUDUTJQS1s5iLxsKlVQTTIGqacuVRC+U2EagnG0aDjvp4qH14HFxyt+?=
 =?us-ascii?Q?WskNZs8dObU9l7n22AjXDljKejWDc3XB3fZc7USIR3xdDrx5tFrC7PIlfxPm?=
 =?us-ascii?Q?jC+XLKC1RJQknfxBhVJMKKYTqawXfUsghtgd36OdKedvJlDtKPGuC30rtuQe?=
 =?us-ascii?Q?YORzgniXmdZri5QV156YfGO1YwM8YHt3kMWUdnlRcuWL2Lq0bcynqjrZLPUc?=
 =?us-ascii?Q?+QPFVK/J1VL/GXaa5u8BCFN3bmZtHlkjuN7o7gRWOoDMTfhOUuIODAtAD/Xn?=
 =?us-ascii?Q?KsfOyFc7sicd50D6u5Z3gibqSLrw00E98TgbeY7tamA4btKt3drup8FTiR2H?=
 =?us-ascii?Q?TCFKFt+QzWxBrcXOm2OvYjrwVycGKdfCVBJ9og/lSTJBDpSwNUzirlI/5tDS?=
 =?us-ascii?Q?WtkCavvsXJRP1TJGpepHOaUdMWOiaATN5BVwMEjwGKVfh5cP3+2qsaPelFUR?=
 =?us-ascii?Q?5QSb7H1Tg0k6PErSwEGhs3Zcfdrr7rKrqqmJBBf5/TKXAoZL9wCJ3fwkm62P?=
 =?us-ascii?Q?wgguXqHRBGebcOq95Y4Dnmd0EZ/rp0TH0Jl725V5ZuOA9xuqHdOhH71TUfOA?=
 =?us-ascii?Q?cM0heT1bimxCgRmV/C9b9iJ84u5LkYqNpeNJoRbwKPBHqA/NUIQEpPSyet0u?=
 =?us-ascii?Q?+i2Cy0OmV6MmnB1gY8HIGSjQ/8nRM22KTk2xOdQjUAeVTCL5NIclLMeE41DI?=
 =?us-ascii?Q?tK35N6FH2kZqQ1I0O/LKAPUDhfvPJ16RgnITZqxKdzTJOsrePwct8pidEND4?=
 =?us-ascii?Q?/rx9C/Ya9sfW4Sw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ujdL/IBDZZVzHnCufx1gFtgSAvStV/k3Pxe2Eaft/pv8DIiniRPd8w9sVKl6?=
 =?us-ascii?Q?9zCt+m1r+S2Qb9/3arnfegv/1PMmDVvvVbGd6CoxFlFP4bG+g1w1aYdIPb+r?=
 =?us-ascii?Q?CQGRJc0uudPvw2ql2hR+emjk8v+Mz/Zu3+hTKOsmDIRafvJHPmQ4YbqrjMyL?=
 =?us-ascii?Q?XE2vnJXMhcTTeI/36Bnf7lUSzhVAMT3xFsE+jSJsIgNE6i3CcFOfx4Jjt9/V?=
 =?us-ascii?Q?XPYRWBv/zqMqbYT4YD8OMeOpQFR5XV+tuFrC0AV2peNaYYFKaeeX6esGiKvx?=
 =?us-ascii?Q?z/ZoEDcL+YxoziNOCeAWWdpY6326Oic8l0tPNE915mK2abC8cmSgBg9GTBoG?=
 =?us-ascii?Q?wX7IaIjF50v0KkZ6oGalKyyY2U1Gj3GBeRgMnFk737yeQS3HDPntBDoP2g1t?=
 =?us-ascii?Q?FyZVxG9s1ODRiY8ui36iPOvKnBHBPuTaM1CVTwCzgI/dKFiMDuV24CsQnPcU?=
 =?us-ascii?Q?x2tUZRY8bYfIG3IjZ5c3OZtd1LHJVyalrWJZEbhWX+USnan8R+eVzSNjEvpd?=
 =?us-ascii?Q?FnEj+v0VhJFyfdr9cNaKDjY7MH86GfMAE3NWW0Bzx3fkd8zP87U/9uZ2ZIPO?=
 =?us-ascii?Q?oglYALwWXar8uz1h5tz4FtohnQaEe60L1RXxLvsb5bBCmJl7G138TpkA53Y3?=
 =?us-ascii?Q?xdCktG2kDqFUaJmhNRNlcC3M5Wu0Cywof909T8qg+spDL973tJ3wEU+OObrp?=
 =?us-ascii?Q?IE134Hu0Djd5VvmdkZjSdAudZoe9pHiEhYKC9qXau+SqqaEkLTZQmW058jTC?=
 =?us-ascii?Q?tdcKsAZo9qRmniWFfYnjj0PWA2+VppPHrnNNPtQWaP1FtXITS2Zo+UFFTdgc?=
 =?us-ascii?Q?kx3fNqth6gKnA47LO6GCM85K5n6skk/ZClM4KyJWwRI50t3TjRoOHNmtGIgt?=
 =?us-ascii?Q?Huxf95EdT4EbKAuAbYCcnqIXUKzz8NVjPz6YrdLZl+r9So6AAerZ5dY0q2ES?=
 =?us-ascii?Q?gj2iY54HuiD5EQ3vzsKxJVS48ECwxcoqYnEw7Y9n0wZfLOMtktvrFgZd6b4t?=
 =?us-ascii?Q?qxKMYlD0ByrjGXt7h56SdNJN48ta/2Sc/bTVh/oJfts9zGNl+HbhQ1pyKwdQ?=
 =?us-ascii?Q?xW1XKHUGVcGCfRgWfprDe4K5YH9DMAmfGojHgPf70+wYF4iNIAfyrB1UPbzI?=
 =?us-ascii?Q?CIvuRF97HMYuy+3F93j5Rfx+5cTu8fwlhCUcwtdAPmW/FzyJYSYcqMIo6CHR?=
 =?us-ascii?Q?lE/SIadolPANXfxdiztWFwJvy93sqv0GPPlviYIas6LY3Zqr8SXNW5jrPjBb?=
 =?us-ascii?Q?Jc7dJeqpcyAQXr6Rp9sgx0bYTZqeCnGsr3oa18gPrgwJ1Qogaf5W379ASwKV?=
 =?us-ascii?Q?DNbaN+eq5rh64bObg+yg/FtbRE7N3HS+/7XxJFyqW9g6HYURKoiN9zzgdZKS?=
 =?us-ascii?Q?bVSF955ma2rxdEyg7gPZ8Q+vrDKU9cFfCARD7mThyPffnF+holK172eEuDVV?=
 =?us-ascii?Q?m8Z9TzTh45/LspmaNc3O38DwiQ4sxjvHnS+71iX+EKGTYNeU0Y3nkLKz+5UR?=
 =?us-ascii?Q?jH7RbJ93o5W6hGtCHVoDOMzpVusGUbKiVKcqblmInY39VUYKjz7TNJ1t2+Rb?=
 =?us-ascii?Q?dv4eRIUD8d487aJiSsLCJzVKCnT0SAVPUmnvCpeNMzdmxyHBO0P4os45aMGD?=
 =?us-ascii?Q?2S7RcIvDnaaGNAWI15M5qDw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3bf716-b40f-4a42-37a7-08dda9978663
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:57:21.7782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFbyA7q3YPj9rQGKvIlj271qs7Xbyj2qnPaoyje8dCh6jg8p96nWG0KtZRSwtR+LFOEJKzQboLWrW3BNt8YogkC3ZRHv9fkvQJhfcY2AyPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2B89F77E0
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684aa483 cx=c_pps a=oHfdRNjjH91Dx1UII95wnA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=7ZBXszWF_8vsTP3PHmcA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfXw4sFWcxK/022 QSeJnWP2GVPPbPjKba9uDkdUNLqwbJyNBJ8MQLswPerdyzN9Vxd93hpnsQbT9HI+pKiCGkSF0Vh HGhLVjzrRO3gYOScMIPqg4oaM3i3vLZUo1eOZcUj6ePgO2k6NN46hAhz0MrQX95uLx0DMooj1ok
 34Z8gi9S3ejCiCvToiufY57im06h8OQP5mJ2J0SCz5YqxmuXgqnHmzZFVtlCX2gzAZ0SB8D1X3N eA94H2QXVQ6iU8IDsEYRw5qPpn5wQ2Ifve/m1AB+MpvsTWdAS1DQnoV2zOsJls/jotHP8kHwYnt UeUyPRX+dRabjgqVy/emKy19wI67qy93f6VXBPbKMoQ9MR3/rWjT+W2AyeH3kAF+1uOm0YToUC3
 9RfwCHvRFyJzoX3yPevTaxbpv/3dmXGk3lyEEIYCgwchwIhhqEcPnRiCpybmoN0BPkW9Wzgz
X-Proofpoint-ORIG-GUID: e8ytLNRgxTnUi8KU0PZvpZ8KZxXw2Avk
X-Proofpoint-GUID: e8ytLNRgxTnUi8KU0PZvpZ8KZxXw2Avk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506120076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218498

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from the Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport [ee6c14ed59d480720721aaacc5fb03213dc153da]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-6.patch          | 171 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-6.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
new file mode 100644
index 0000000000..d117cae9b7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
@@ -0,0 +1,171 @@
+From 082e8146a1ca100d6ae15000e04b5e9cf6423a6c Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Wed, 11 Jun 2025 22:46:27 -0700
+Subject: [PATCH] nptl: Fix indentation
+
+In my previous change I turned a nested loop into a simple loop. I'm doing
+the resulting indentation changes in a separate commit to make the diff on
+the previous commit easier to review.
+
+The following commits have been cherry-picked from the master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport [ee6c14ed59d480720721aaacc5fb03213dc153da]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 134 ++++++++++++++++-----------------------
+ 1 file changed, 55 insertions(+), 79 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index d1714a0c..2cbc567f 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -410,89 +410,65 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+       return err;
+     }
+ 
+-
+-      while (1)
+-	{
+-	  /* Now wait until a signal is available in our group or it is closed.
+-	     Acquire MO so that if we observe (signals == lowseq) after group
+-	     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-	     store and will see the prior update of __g1_start done while switching
+-	     groups too.  */
+-	  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-
+-	  if (seq < (g1_start >> 1))
+-	    {
+-	      /* If the group is closed already,
+-	         then this waiter originally had enough extra signals to
+-	         consume, up until the time its group was closed.  */
+-	       break;
+-	    }
+-
+-	  /* If there is an available signal, don't block.
+-	     If __g1_start has advanced at all, then we must be in G1
+-	     by now, perhaps in the process of switching back to an older
+-	     G2, but in either case we're allowed to consume the available
+-	     signal and should not block anymore.  */
+-	  if ((int)(signals - lowseq) >= 2)
+-           {
+-             /* Try to grab a signal.  See above for MO.  (if we do another loop
+-                iteration we need to see the correct value of g1_start)  */
+-                     if (atomic_compare_exchange_weak_acquire (
+-                               cond->__data.__g_signals + g,
++  while (1)
++    {
++      /* Now wait until a signal is available in our group or it is closed.
++         Acquire MO so that if we observe (signals == lowseq) after group
++         switching in __condvar_quiesce_and_switch_g1, we synchronize with that
++         store and will see the prior update of __g1_start done while switching
++         groups too.  */
++      unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
++      uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++      unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++
++      if (seq < (g1_start >> 1))
++        {
++          /* If the group is closed already,
++             then this waiter originally had enough extra signals to
++             consume, up until the time its group was closed.  */
++           break;
++        }
++
++      /* If there is an available signal, don't block.
++         If __g1_start has advanced at all, then we must be in G1
++         by now, perhaps in the process of switching back to an older
++         G2, but in either case we're allowed to consume the available
++         signal and should not block anymore.  */
++      if ((int)(signals - lowseq) >= 2)
++        {
++         /* Try to grab a signal.  See above for MO.  (if we do another loop
++            iteration we need to see the correct value of g1_start)  */
++           if (atomic_compare_exchange_weak_acquire (
++                       cond->__data.__g_signals + g,
+                        &signals, signals - 2))
+-                       break;
+-                     else
+-                       continue;
+-           }
+-
+-	  /* No signals available after spinning, so prepare to block.
+-	     We first acquire a group reference and use acquire MO for that so
+-	     that we synchronize with the dummy read-modify-write in
+-	     __condvar_quiesce_and_switch_g1 if we read from that.  In turn,
+-	     in this case this will make us see the advancement of __g_signals
+-	     to the upcoming new g1_start that occurs with a concurrent
+-	     attempt to reuse the group's slot.
+-	     We use acquire MO for the __g_signals check to make the
+-	     __g1_start check work (see spinning above).
+-	     Note that the group reference acquisition will not mask the
+-	     release MO when decrementing the reference count because we use
+-	     an atomic read-modify-write operation and thus extend the release
+-	     sequence.  */
+-	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+-
+-	  // Now block.
+-	  struct _pthread_cleanup_buffer buffer;
+-	  struct _condvar_cleanup_buffer cbuffer;
+-	  cbuffer.wseq = wseq;
+-	  cbuffer.cond = cond;
+-	  cbuffer.mutex = mutex;
+-	  cbuffer.private = private;
+-	  __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
+-
+-	  err = __futex_abstimed_wait_cancelable64 (
+-	    cond->__data.__g_signals + g, signals, clockid, abstime, private);
+-
+-	  __pthread_cleanup_pop (&buffer, 0);
+-
+-	  if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
+-	    {
+-	      __condvar_dec_grefs (cond, g, private);
+-	      /* If we timed out, we effectively cancel waiting.  Note that
+-		 we have decremented __g_refs before cancellation, so that a
+-		 deadlock between waiting for quiescence of our group in
+-		 __condvar_quiesce_and_switch_g1 and us trying to acquire
+-		 the lock during cancellation is not possible.  */
+-	      __condvar_cancel_waiting (cond, seq, g, private);
+-	      result = err;
+-	      break;
+-	    }
++	       break;
+ 	  else
+-	    __condvar_dec_grefs (cond, g, private);
+-
++	      continue;
+ 	}
+ 
++      // Now block.
++      struct _pthread_cleanup_buffer buffer;
++      struct _condvar_cleanup_buffer cbuffer;
++      cbuffer.wseq = wseq;
++      cbuffer.cond = cond;
++      cbuffer.mutex = mutex;
++      cbuffer.private = private;
++      __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
++
++      err = __futex_abstimed_wait_cancelable64 (
++        cond->__data.__g_signals + g, signals, clockid, abstime, private);
++
++      __pthread_cleanup_pop (&buffer, 0);
++
++      if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
++        {
++          /* If we timed out, we effectively cancel waiting.  */
++          __condvar_cancel_waiting (cond, seq, g, private);
++          result = err;
++          break;
++       }
++    }
++
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+      to allow for execution of pthread_cond_destroy while having acquired the
+      mutex.  */
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 05f408065f..45e6dedecb 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -66,6 +66,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-3.patch \
            file://0026-PR25847-4.patch \
            file://0026-PR25847-5.patch \
+           file://0026-PR25847-6.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


