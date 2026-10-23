Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2011.1792740550690987861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 00:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bjDOuFsy;
 spf=pass (domain: est.tech, ip: 52.101.65.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+b2jhGoHKtatom7YF1npmdwB6ENj+wnkjWveZ+i01ah87AlC9aGGGhnBOT6Qq33gPH0DSzmBxO514kAr7z+ZYOs0KFy1TSgumAl4InmxzoPiK81ZxY7T+xV4y4PFgTdM1xfI9Nm3SQZsOqCovuXALsdpg/MTzWCcbs6XfRjPQYLwtiabS8geGzbOGAQeNP5b7dOqe+pL+LtmxruoYVM5/rFu0H6agcICXt13mhY406/9Zn5cWO4LRtc55irnGCDrYDjvCnLhDl7xQKbiTG/Fwi7n1aCWyA1y0BVZ2pwGAZxhFadbG/XX2AL/3sym6qB3Me15Ts2ifrZ3qOG7rqoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqcRkiZr560qGcZ/F122CjswKtvBZP9OxrmBlE7+/+I=;
 b=QOf8uOCsU7vA0Y7a7lFbUFZhAc0XAkfEiB4RIHppvZxN4F3SZdPBsa46GT7pt1vOYMa8C5ckVBX7Tqlk4gDTfX76X+Iyjxw+TBnfZajImLNuiaBTe+T5V1YD2Djo7DoM+hQF9vOrqLFuYyriAoGLP3BavP0eYZ48vCxpWWyHj54XyxwKY3DMOwCneARWzWNU9yfcFnLLtPXbZody9OwWDUBMOgEm7AoSZflN+g4VErcrU2/pIpXM5ehdixoIsflS2/XY+OI02H10uE6NThX+CbxYXo79yvVnPXObRyOQaLHI8XdsyLIOUhRU8d/2fq46uAL+EHuj9qnEIY5egfGVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqcRkiZr560qGcZ/F122CjswKtvBZP9OxrmBlE7+/+I=;
 b=bjDOuFsyBNAQUKPjBLiEcCYh3t8+sLTRRKXfl3zrK+Rsu9DVdLWVUGdZ2B8SkzjjkLHMyYNLS1JBm8YM+8BkjgmzHqVOf/7Cj3XUgR3lBkiKlbHDNM9cc1gVWvlaraqC2ez0re1BJo5uiI6byfy5tnCEPhq73uLQ0coDJgaUZSnqtzXnPpMd/KnXELkAx49U0GgNu/LaQmZf+ALQYvRiWfQMCLJvyG8KxLRFU7ct/08ZRGeFFjV+msMFFeoeokoXjySOJJdGeM+s1G1x8G5V1+ofXXy2VDfka0TVFcngVpw5t4r5RcF6llyIphua3XRlhtdAImwKhIuVdKCeBLJlLQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DBBP189MB1226.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1f3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 07:29:06 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 07:29:06 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] glibc: stable glibc 2.39 branch uplift
Date: Fri, 23 Oct 2026 09:29:04 +0200
Message-ID: <20261023072904.46982-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0383.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DBBP189MB1226:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8de906-7007-4daf-991f-08df30d751f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|18002099003|3023799007|261022105027099003|261022075727099003|10067099003|13003099007|5023799004|56012099006|11063799006|261021121427099003|261021130227099003|261021123027099003|261021133027099003|261009223027099003|261021135927099003|261022115727099003|260925021911599003|260925021311599003|260925022911599003|261022113327099003;
X-Microsoft-Antispam-Message-Info: s2jFBFODRikSEKUFCHQBximDhHlZ/59ZgpwgJpXaS7ciFXY0m8pevqiE4GglNVkmW8DTkw1ZH7fQ3MPWUOaGWWS/JCNfosp6q68oKWP+3b2mMYLiGQ+7MWryCDrrj4ecqI9SFVmQAxg5sDNwgpbZXt+oGPS52JsOi3Io5c5+zNTbOzR57i9IbluDxZK7EMEhDapgcbKjGCEbwebBHOQlzpXi9WqzpcWJBlWFUK6fcxSsRf+PSyivaL3OW5uzjyvqxki3XDL2/4F0+MGj8zCk+cLbVkgoyYwu3OuGPWOMgthIO8qq0dWWBA999DZjwNEg9vunIxNYAbo+ghXN+8Ad4cFlwWR9xtVH2AhY3A7Huc0L45t7efAmuUqjZiZrFJ6twx46uZivDaHtIr+K6x3YyB/vGpy/M8HfBLMB0iGDkF5NhIN1gNJZQ5wwztrpmbaw3pFXeBYAEyeW85Dx+CP1emRXS/2dQSIzaYMdhWNy4OgC/uB9nIOyzehS0R8TdhTCKq010zIi6PBRRxktBYy6SFKdB5wc7iyySSxirP31j7McrBdoeRQvYm0+MknzqoXl/uyRpvHxAQ0+WY7JGElqgleq6uuXgEQ9WFE7xVmVftM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(3023799007)(261022105027099003)(261022075727099003)(10067099003)(13003099007)(5023799004)(56012099006)(11063799006)(261021121427099003)(261021130227099003)(261021123027099003)(261021133027099003)(261009223027099003)(261021135927099003)(261022115727099003)(260925021911599003)(260925021311599003)(260925022911599003)(261022113327099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9UoGU78iTNCTfC9VwWoIGlw7syBtULKfdfFHmc0ofgj4J+i+YJMVP+m33DQb?=
 =?us-ascii?Q?jZ8gXEXy6bcRWD2S0Dw33GmJRw1oMMNxvoNY+jMpoZXBC9ebNrCkYPrTQrRq?=
 =?us-ascii?Q?3yTAxglzc+LIDLXGcpJS1MOK+dhuc+Nyw+29QJKWGdn826VFECK2aUBBZKLB?=
 =?us-ascii?Q?bmo67RiDUXElkL1n7Np/pWTlm9z1IGcdr17dojFhO8hZBwfADeUs/GzN9ZEP?=
 =?us-ascii?Q?o4Lb2SZPk+EXdzgIzg3WD8TgbIKGlfQVZ8or3ar5jnvN40WB2aZcpAgGBkZS?=
 =?us-ascii?Q?CHcQpS/lsfQhfDePDZd3NQ+BsPy8niuYgHczipi55GSkbwbghK6WtafP908n?=
 =?us-ascii?Q?V1lJdzOzNI0FyWS+b9f1r7MW0maU5e/Nbd/HN5Wba5gcW1iX/wVd6Yjm4A9C?=
 =?us-ascii?Q?X5WovCiqC1qKc5Qn37R64fQOG+dQroHDqe7pGVzpmx1urA2ijp+bovysxSaw?=
 =?us-ascii?Q?N/1IbJWC/KbZmRDroaNobyr+icOhOS9gY1Tzf1sbDN/7QzFJCz1pBAQcyljl?=
 =?us-ascii?Q?Agi5YZpPbgmElengvhEfwKwuE4a4jucIQre2hlXzLes/FgatHYJFe04Fk0zU?=
 =?us-ascii?Q?yed9vtsSHgnIOohhvcNn2NpnHsVhuzMSx+r/V36IIUZZkeXewaYSm13gC2vB?=
 =?us-ascii?Q?h5WfUQy16E5RkGpWS1gaehDsKDBhwI3O9/8a/5Y2Tv55iF2dGb/y5CBhdhwX?=
 =?us-ascii?Q?o35Ddf9/K0pI0lg2h8rGSwsQKt8UF0CfA5SybBjGHWdu4A32LUWCaT4+xClb?=
 =?us-ascii?Q?jFNDo3yRNxT2VUJ76EW798L3tkbN/Wyzj21jEITU27PEAwp120iUm1yPChzG?=
 =?us-ascii?Q?FUQYdCDhLgbE6hhZLg8j/X0EgSMjQiHC+sXGrfaNhYJRdD2rHpem1lM82roV?=
 =?us-ascii?Q?sm5upZWFMxYqv1kn0zsbRUc5mUO9dk7XU1TfsRQ6+hC1wNAa/xbP915sZqA4?=
 =?us-ascii?Q?j/NwycHVfokqVWNtz0EdKFaPXKrtNuVn0AN0Pn/9ZqUIsRaDx2ZmEhMjWNIJ?=
 =?us-ascii?Q?RLreMPACORPjaXoyTEYgq0dlLOEko9irAdHame74aER31b8Ne739LjFQu4Ck?=
 =?us-ascii?Q?HwFJ4fYp7hgmcH0hnrw3JZiIkXev0zdEuuL2defrqcAJtTaN1D/cOR48ooOW?=
 =?us-ascii?Q?j73cr+WhzGkmqoFkFwZDEjWc3OzYI4OO1wWhLK80k6TFduDov2wbg6/iUBnM?=
 =?us-ascii?Q?G0IWRAoMg/aVWzoaQb5IYX7tattvlBD+Tzbm864d9yvifTd+YFxJYCjdI0r7?=
 =?us-ascii?Q?f4p+gqlFkZNzC5PdzPveeNOhGnGPn90I4aFufsPJbQCEOZhSjWQo/LUbgWVK?=
 =?us-ascii?Q?fek3pvtTwmFUzTjKlEpxBIkEN+XiFvvnbYqBetRZy4wnAIe8AiLLB2Eys0CF?=
 =?us-ascii?Q?xBKvxO0JJfsE8/cW5gzyhGwTdlFBVTf798f0HkC/edLl+/Pnv85lyazhg3Lu?=
 =?us-ascii?Q?y2KwTzh9iqTXbfBxfGtCS1dJkVMC7xvXD7Ia9/+fJIH49r0uR7sX+b1QcfnR?=
 =?us-ascii?Q?C7j/es58rRpefWwBPD2/3ey1QGQu8yiY0ZWXOPQfNANcouFnV2378f8/J7Ip?=
 =?us-ascii?Q?S5aKOacvQjbJ9p7udw7uiEgp3Vtb5xmzDY4LzNW5LzeWHDuTimkzTJNgXnYL?=
 =?us-ascii?Q?fRp3ZYY04m1fhM3kXuRUvhs65XsfszOd323zdEoadFrOqQPxQ/5Dd3onDyXh?=
 =?us-ascii?Q?BHKl4TsKazazrkNdhUvM/f9IaRIBjpcmIPCTU6At3XQHKMoXdVm8CEPSaNJv?=
 =?us-ascii?Q?rfPbh97pMQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8de906-7007-4daf-991f-08df30d751f2
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 07:29:06.3945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+A+2Xk/8mW3+QirIhiEKezZsaAM0RmeH+mY3//9KgR3UPSo8J2SU5lrUmz94OeubMRYig+RzG7/0M0yMvCFbr/DzoU+9zMf4VQZsAATJZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1226
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 07:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248486
Content-Type: text/plain; charset="utf-8"

git log --oneline be1e627cd72db31161a3b4ce1c8114674f0895eb..e86f5937581b7af=
6aa63077c906d3bdf7b7bdeda
e86f593758 (HEAD -> release/2.39/master) resolv: Add test case tst-ns_sprin=
trr (bug 34033, bug 34069)
644bc6cf52 resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
87d47084a2 resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)
ecb2538d3e resolv: Check for inet_ntop failure in ns_sprintrrf
9bf7df9b2b resolv: Improve formatting of unknown records in ns_sprintrrf
ecf1088715 resolv: Fix ns_sprintrrf formatting of class, type values (bug 3=
4289)
29a9567c61 resolv: Declare __p_class_syms, __p_type_syms for internal use

Drop CVE-2026-6238 and CVE-2026-5435 patches as change is part of stable re=
lease

 29a9567c61 - 0025-CVE-2026-6238-0001.patch
 ecf1088715 - 0026-CVE-2026-6238-0002.patch
 9bf7df9b2b - 0027-CVE-2026-6238-0003.patch
 ecb2538d3e - 0028-CVE-2026-6238-0004.patch
 87d47084a2 - 0024-CVE-2026-5435.patch
 644bc6cf52 - 0029-CVE-2026-6238-0005.patch
 e86f593758 - 0030-CVE-2026-6238-0006.patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/0024-CVE-2026-5435.patch      | 137 -------
 .../glibc/glibc/0025-CVE-2026-6238-0001.patch |  59 ---
 .../glibc/glibc/0026-CVE-2026-6238-0002.patch |  81 ----
 .../glibc/glibc/0027-CVE-2026-6238-0003.patch |  58 ---
 .../glibc/glibc/0028-CVE-2026-6238-0004.patch |  73 ----
 .../glibc/glibc/0029-CVE-2026-6238-0005.patch |  69 ----
 .../glibc/glibc/0030-CVE-2026-6238-0006.patch | 382 ------------------
 meta/recipes-core/glibc/glibc_2.39.bb         |   7 -
 9 files changed, 1 insertion(+), 867 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.p=
atch
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.p=
atch
 delete mode 100644 meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.p=
atch
 delete mode 100644 meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.p=
atch
 delete mode 100644 meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.p=
atch
 delete mode 100644 meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.p=
atch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc
index 5d57dafed0..bf31a66db4 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D "release/2.39/master"
 PV =3D "2.39+git"
-SRCREV_glibc ?=3D "be1e627cd72db31161a3b4ce1c8114674f0895eb"
+SRCREV_glibc ?=3D "e86f5937581b7af6aa63077c906d3bdf7b7bdeda"
 SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
=20
 GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch b/meta/=
recipes-core/glibc/glibc/0024-CVE-2026-5435.patch
deleted file mode 100644
index 722ec2129c..0000000000
--- a/meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 5d41b8e5aaec3580e4a05d93c5ff2fc69bb3d5a7 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Fri, 19 Jun 2026 18:22:20 +0200
-Subject: [PATCH] resolv: More types as unknown in ns_sprintrrf (CVE-2026-5=
435)
-
-Specifically, CERT, TKEY, TSIG, OPT.  This removes the buggy
-implementations of TSIG, fixing bug 34033, and partially
-fixing bug 34069.
-
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-
-CVE: CVE-2026-5435
-Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dp=
atch;h=3Dca44a6609c29a683b03575fa035c6d17aa591e72]
-
-Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
----
- resolv/ns_print.c | 96 -----------------------------------------------
- 1 file changed, 96 deletions(-)
-
-diff --git a/resolv/ns_print.c b/resolv/ns_print.c
-index cef2212fd2..882a86e58e 100644
---- a/resolv/ns_print.c
-+++ b/resolv/ns_print.c
-@@ -434,96 +434,6 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
- 		break;
- 	    }
-=20
--	case ns_t_cert: {
--		u_int c_type, key_tag, alg;
--		int n;
--		unsigned int siz;
--		char base64_cert[8192], tmp[40];
--		const char *leader;
--
--		c_type  =3D ns_get16(rdata); rdata +=3D NS_INT16SZ;
--		key_tag =3D ns_get16(rdata); rdata +=3D NS_INT16SZ;
--		alg =3D (u_int) *rdata++;
--
--		len =3D SPRINTF((tmp, "%d %d %d ", c_type, key_tag, alg));
--		T(addstr(tmp, len, &buf, &buflen));
--		siz =3D (edata-rdata)*4/3 + 4; /* "+4" accounts for trailing \0 */
--		if (siz > sizeof(base64_cert) * 3/4) {
--			const char *str =3D "record too long to print";
--			T(addstr(str, strlen(str), &buf, &buflen));
--		}
--		else {
--			len =3D b64_ntop(rdata, edata-rdata, base64_cert, siz);
--
--			if (len < 0)
--				goto formerr;
--			else if (len > 15) {
--				T(addstr(" (", 2, &buf, &buflen));
--				leader =3D "\n\t\t";
--				spaced =3D 0;
--			}
--			else
--				leader =3D " ";
--
--			for (n =3D 0; n < len; n +=3D 48) {
--				T(addstr(leader, strlen(leader),
--					 &buf, &buflen));
--				T(addstr(base64_cert + n, MIN(len - n, 48),
--					 &buf, &buflen));
--			}
--			if (len > 15)
--				T(addstr(" )", 2, &buf, &buflen));
--		}
--		break;
--	    }
--
--	case ns_t_tkey: {
--		/* KJD - need to complete this */
--		u_long t;
--		int mode, err, keysize;
--
--		/* Algorithm name. */
--		T(addname(msg, msglen, &rdata, origin, &buf, &buflen));
--		T(addstr(" ", 1, &buf, &buflen));
--
--		/* Inception. */
--		t =3D ns_get32(rdata);  rdata +=3D NS_INT32SZ;
--		len =3D SPRINTF((tmp, "%lu ", t));
--		T(addstr(tmp, len, &buf, &buflen));
--
--		/* Expiration. */
--		t =3D ns_get32(rdata);  rdata +=3D NS_INT32SZ;
--		len =3D SPRINTF((tmp, "%lu ", t));
--		T(addstr(tmp, len, &buf, &buflen));
--
--		/* Mode , Error, Key Size. */
--		/* Priority, Weight, Port. */
--		mode =3D ns_get16(rdata);  rdata +=3D NS_INT16SZ;
--		err  =3D ns_get16(rdata);  rdata +=3D NS_INT16SZ;
--		keysize  =3D ns_get16(rdata);  rdata +=3D NS_INT16SZ;
--		len =3D SPRINTF((tmp, "%u %u %u ", mode, err, keysize));
--		T(addstr(tmp, len, &buf, &buflen));
--
--		/* XXX need to dump key, print otherdata length & other data */
--		break;
--	    }
--
--	case ns_t_tsig: {
--		/* BEW - need to complete this */
--		int n;
--
--		T(len =3D addname(msg, msglen, &rdata, origin, &buf, &buflen));
--		T(addstr(" ", 1, &buf, &buflen));
--		rdata +=3D 8; /*%< time */
--		n =3D ns_get16(rdata); rdata +=3D INT16SZ;
--		rdata +=3D n; /*%< sig */
--		n =3D ns_get16(rdata); rdata +=3D INT16SZ; /*%< original id */
--		sprintf(buf, "%d", ns_get16(rdata));
--		rdata +=3D INT16SZ;
--		addlen(strlen(buf), &buf, &buflen);
--		break;
--	    }
--
- 	case ns_t_a6: {
- 		struct in6_addr a;
- 		int pbyte, pbit;
-@@ -557,12 +467,6 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
- 		break;
- 	    }
-=20
--	case ns_t_opt: {
--		len =3D SPRINTF((tmp, "%u bytes", class));
--		T(addstr(tmp, len, &buf, &buflen));
--		break;
--	    }
--
- 	default:
- 		snprintf (errbuf, sizeof (errbuf), "unknown RR type %d", type);
- 		comment =3D errbuf;
---=20
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch b/=
meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch
deleted file mode 100644
index 504803317b..0000000000
--- a/meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 360f352c9a6da545d798ef3015e73ca114f0d230 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Fri, 19 Jun 2026 18:22:20 +0200
-Subject: [PATCH] resolv: Declare __p_class_syms, __p_type_syms for interna=
l
- use
-
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-
-CVE: CVE-2026-6238
-Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dp=
atch;h=3D360f352c9a6da545d798ef3015e73ca114f0d230]
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
----
- include/resolv.h   | 5 +++++
- resolv/res_debug.c | 4 ----
- 2 files changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/include/resolv.h b/include/resolv.h
-index 4dbbac38..d5ad9994 100644
---- a/include/resolv.h
-+++ b/include/resolv.h
-@@ -70,6 +70,11 @@ libc_hidden_proto (__libc_res_nameinquery)
- extern __typeof (__res_queriesmatch) __libc_res_queriesmatch;
- libc_hidden_proto (__libc_res_queriesmatch)
-=20
-+extern const struct res_sym __p_class_syms[];
-+libresolv_hidden_proto (__p_class_syms)
-+extern const struct res_sym __p_type_syms[];
-+libresolv_hidden_proto (__p_type_syms)
-+
- /* Variant of res_hnok which operates on binary (but uncompressed) names.=
  */
- bool __res_binary_hnok (const unsigned char *dn) attribute_hidden;
-=20
-diff --git a/resolv/res_debug.c b/resolv/res_debug.c
-index dab5283b..6f03e414 100644
---- a/resolv/res_debug.c
-+++ b/resolv/res_debug.c
-@@ -389,8 +389,6 @@ p_fqname(const u_char *cp, const u_char *msg, FILE *fi=
le) {
-  * that C_ANY is a qclass but not a class.  (You can ask for records of c=
lass
-  * C_ANY, but you can't have any records of that class in the database.)
-  */
--extern const struct res_sym __p_class_syms[];
--libresolv_hidden_proto (__p_class_syms)
- const struct res_sym __p_class_syms[] =3D {
-   {C_IN,    (char *) "IN"},
-   {C_CHAOS, (char *) "CHAOS"},
-@@ -425,8 +423,6 @@ const struct res_sym __p_update_section_syms[] attribu=
te_hidden =3D {
-  * Names of RR types and qtypes.  The list is incomplete because its
-  * size is part of the ABI.
-  */
--extern const struct res_sym __p_type_syms[];
--libresolv_hidden_proto (__p_type_syms)
- const struct res_sym __p_type_syms[] =3D {
-   {ns_t_a,      (char *) "A",     (char *) "address"},
-   {ns_t_ns,     (char *) "NS",    (char *) "name server"},
---=20
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch b/=
meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch
deleted file mode 100644
index ae2662df2c..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From f69b7f95e3694177546faec25d88bb266885c3b8 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Fri, 19 Jun 2026 18:22:20 +0200
-Subject: [PATCH] resolv: Fix ns_sprintrrf formatting of class, type values
- (bug 34289)
-
-The p_class and p_type results could overwrite each other if both
-were unknown.  Format unknown values with CLASS and TYPE prefixes,
-as in RFC 3597.  Handle A6 separately because it cannot be added
-to __p_type_syms for ABI reasons.
-
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-
-CVE: CVE-2026-6238
-Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dp=
atch;h=3Df69b7f95e3694177546faec25d88bb266885c3b8]
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
----
- resolv/ns_print.c | 38 +++++++++++++++++++++++++++++++++-----
- 1 file changed, 33 insertions(+), 5 deletions(-)
-
-diff --git a/resolv/ns_print.c b/resolv/ns_print.c
-index fffed4b3..59c34553 100644
---- a/resolv/ns_print.c
-+++ b/resolv/ns_print.c
-@@ -78,6 +78,24 @@ ns_sprintrr(const ns_msg *handle, const ns_rr *rr,
- }
- libresolv_hidden_def (ns_sprintrr)
-=20
-+/* Writes the class/type symbol NUMBER to *BUF, using the name from
-+   *SYMS if possible.  If NUMBER is not found in *SYMS, print the
-+   number with PREFIX.  */
-+static int
-+addsym (const struct res_sym *syms, int number, const char *prefix,
-+	char **buf, size_t *buflen)
-+{
-+  for (; syms->name !=3D NULL; syms++)
-+    if (number =3D=3D syms->number)
-+      {
-+	T (addstr (" ", 1, buf, buflen));
-+	return addstr (syms->name, strlen (syms->name), buf, buflen);
-+      }
-+  char tmp[20];
-+  int len =3D snprintf (tmp, sizeof (tmp), " %s%d", prefix, number);
-+  return addstr (tmp, len, buf, buflen);
-+}
-+
- /*%
-  *	Convert the fields of an RR into presentation format.
-  *
-@@ -128,11 +146,21 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
- 	/*
- 	 * TTL, Class, Type.
- 	 */
--	T(x =3D ns_format_ttl(ttl, buf, buflen));
--	addlen(x, &buf, &buflen);
--	len =3D SPRINTF((tmp, " %s %s", p_class(class), p_type(type)));
--	T(addstr(tmp, len, &buf, &buflen));
--	T(spaced =3D addtab(x + len, 16, spaced, &buf, &buflen));
-+	{
-+	  char *start =3D buf;
-+
-+	  T (x =3D ns_format_ttl (ttl, buf, buflen));
-+	  addlen (x, &buf, &buflen);
-+	  T (addsym (__p_class_syms, class, "CLASS", &buf, &buflen));
-+	  if (type =3D=3D ns_t_a6)
-+	    /* A6 is not part of __p_type_syms, which is exported.
-+	       Adding A6 there would change its size.  Handle it here.  */
-+	    T (addstr (" A6", 3, &buf, &buflen));
-+	  else
-+	    T (addsym (__p_type_syms, type, "TYPE", &buf, &buflen));
-+
-+	  T (spaced =3D addtab(buf - start, 16, spaced, &buf, &buflen));
-+	}
-=20
- 	/*
- 	 * RData.
---=20
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch b/=
meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch
deleted file mode 100644
index 8aaa123a2a..0000000000
--- a/meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From d58415eb17d457a160af99f9e8ab164404ca151b Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Fri, 19 Jun 2026 18:22:20 +0200
-Subject: [PATCH] resolv: Improve formatting of unknown records in ns_sprin=
trrf
-
-Do not add the "unknown RR type" comment.  After adding the TYPE
-prefix, the number is largely redundant.
-
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-
-CVE: CVE-2026-6238
-Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dp=
atch;h=3Dd58415eb17d457a160af99f9e8ab164404ca151b]
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
----
- resolv/ns_print.c | 9 +++------
- 1 file changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/resolv/ns_print.c b/resolv/ns_print.c
-index 59c34553..4f4f06b6 100644
---- a/resolv/ns_print.c
-+++ b/resolv/ns_print.c
-@@ -115,7 +115,6 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
-=20
- 	const char *comment;
- 	char tmp[100];
--	char errbuf[40];
- 	int len, x;
-=20
- 	/*
-@@ -500,20 +499,18 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
-=20
- 		break;
- 	    }
--
- 	default:
--		snprintf (errbuf, sizeof (errbuf), "unknown RR type %d", type);
--		comment =3D errbuf;
-+		comment =3D "";
- 		goto hexify;
- 	}
- 	return (buf - obuf);
-  formerr:
--	comment =3D "RR format error";
-+	comment =3D " ; RR format error";
-  hexify: {
- 	int n, m;
- 	char *p;
-=20
--	len =3D SPRINTF((tmp, "\\# %u%s\t; %s", (unsigned)(edata - rdata),
-+	len =3D SPRINTF((tmp, "\\# %u%s%s", (unsigned)(edata - rdata),
- 		       rdlen !=3D 0U ? " (" : "", comment));
- 	T(addstr(tmp, len, &buf, &buflen));
- 	while (rdata < edata) {
---=20
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch b/=
meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch
deleted file mode 100644
index 16d594fc0d..0000000000
--- a/meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From cd0db208d56a2cecd528b8ae96df752ba5344d9a Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Fri, 19 Jun 2026 18:22:20 +0200
-Subject: [PATCH] resolv: Check for inet_ntop failure in ns_sprintrrf
-
-This makes the output more consistent (either failure or complete
-output) and helps with systematic testing with varying buffer
-sizes.
-
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-
-CVE: CVE-2026-6238
-Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dp=
atch;h=3Dcd0db208d56a2cecd528b8ae96df752ba5344d9a ]
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
----
- resolv/ns_print.c | 18 +++++++++++-------
- 1 file changed, 11 insertions(+), 7 deletions(-)
-
-diff --git a/resolv/ns_print.c b/resolv/ns_print.c
-index 882a86e5..19082bf2 100644
---- a/resolv/ns_print.c
-+++ b/resolv/ns_print.c
-@@ -140,8 +140,9 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
- 	switch (type) {
- 	case ns_t_a:
- 	  if (rdlen !=3D (size_t)NS_INADDRSZ)
--			goto formerr;
--		(void) inet_ntop(AF_INET, rdata, buf, buflen);
-+		  goto formerr;
-+		if (inet_ntop (AF_INET, rdata, buf, buflen) =3D=3D NULL)
-+		  return -1;
- 		addlen(strlen(buf), &buf, &buflen);
- 		break;
-=20
-@@ -307,9 +308,10 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
- 	    }
-=20
- 	case ns_t_aaaa:
--	  if (rdlen !=3D (size_t)NS_IN6ADDRSZ)
--			goto formerr;
--		(void) inet_ntop(AF_INET6, rdata, buf, buflen);
-+		if (rdlen !=3D (size_t)NS_IN6ADDRSZ)
-+		  goto formerr;
-+		if (inet_ntop (AF_INET6, rdata, buf, buflen) =3D=3D NULL)
-+		  return -1;
- 		addlen(strlen(buf), &buf, &buflen);
- 		break;
-=20
-@@ -400,7 +402,8 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
- 			goto formerr;
-=20
- 		/* Address. */
--		(void) inet_ntop(AF_INET, rdata, buf, buflen);
-+		if (inet_ntop (AF_INET, rdata, buf, buflen) =3D=3D NULL)
-+		  return -1;
- 		addlen(strlen(buf), &buf, &buflen);
- 		rdata +=3D NS_INADDRSZ;
-=20
-@@ -452,7 +455,8 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
- 			if (rdata + pbyte >=3D edata) goto formerr;
- 			memset(&a, 0, sizeof(a));
- 			memcpy(&a.s6_addr[pbyte], rdata, sizeof(a) - pbyte);
--			(void) inet_ntop(AF_INET6, &a, buf, buflen);
-+			if (inet_ntop (AF_INET6, &a, buf, buflen) =3D=3D NULL)
-+			  return -1;
- 			addlen(strlen(buf), &buf, &buflen);
- 			rdata +=3D sizeof(a) - pbyte;
- 		}
---=20
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch b/=
meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch
deleted file mode 100644
index bc64f042e5..0000000000
--- a/meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From a7b60d23bbb56eaef59f4962e4140062e552600a Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Fri, 19 Jun 2026 18:22:20 +0200
-Subject: [PATCH] resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-62=
38)
-
-Check that the RDATA payload does not require more than RDATALEN
-bytes while processing it.  The fixes cover A6, LOC records.
-(CERT, TKEY, TSIG were fixed before, by switching to the generic
-formatter.)
-
-The vulnerable LOC record handling was first introduced before
-glibc 2.0, in commit ee188d555b8c32ad9704a7440cab400af967292f.
-
-CERT, TSIG, TKEY handling came with commit
-b43b13ac2544b11f35be301d1589b51a8473e32b, released with glibc 2.2.
-
-A6 record handling was introduced in commit
-91633816430e7ec5a19fe3ff510a7c4822a9557e ("* resolv/ns_print.c
-(ns_sprintrrf): Handle ns_t_a6 and ns_t_opt."), which went into glibc
-2.7.
-
-This fixes bug 34069.
-
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-
-CVE: CVE-2026-6238
-Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dp=
atch;h=3Da7b60d23bbb56eaef59f4962e4140062e552600a]
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
----
- resolv/ns_print.c | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/resolv/ns_print.c b/resolv/ns_print.c
-index 882a86e5..d5da99d6 100644
---- a/resolv/ns_print.c
-+++ b/resolv/ns_print.c
-@@ -316,7 +316,8 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
- 	case ns_t_loc: {
- 		char t[255];
-=20
--		/* XXX protocol format checking? */
-+		if (rdlen !=3D 16)
-+		  goto formerr;
- 		(void) loc_ntoa(rdata, t);
- 		T(addstr(t, strlen(t), &buf, &buflen));
- 		break;
-@@ -449,13 +450,14 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
-=20
- 		/* address suffix: provided only when prefix len !=3D 128 */
- 		if (pbit < 128) {
--			if (rdata + pbyte >=3D edata) goto formerr;
-+			unsigned int bytelen =3D sizeof(a) - pbyte;
-+			if (edata - rdata < bytelen) goto formerr;
- 			memset(&a, 0, sizeof(a));
--			memcpy(&a.s6_addr[pbyte], rdata, sizeof(a) - pbyte);
-+			memcpy(&a.s6_addr[pbyte], rdata, bytelen);
- 			if (inet_ntop (AF_INET6, &a, buf, buflen) =3D=3D NULL)
- 			  return -1;
- 			addlen(strlen(buf), &buf, &buflen);
--			rdata +=3D sizeof(a) - pbyte;
-+			rdata +=3D bytelen;
- 		}
-=20
- 		/* prefix name: provided only when prefix len > 0 */
---=20
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch b/=
meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch
deleted file mode 100644
index 7b6b2aa319..0000000000
--- a/meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch
+++ /dev/null
@@ -1,382 +0,0 @@
-From 4ba0b79b9596e5a4951cc9eaa1546a55e543e083 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Fri, 19 Jun 2026 18:22:20 +0200
-Subject: [PATCH] resolv: Add test case tst-ns_sprintrr (bug 34033, bug 340=
69)
-
-This test case covers both input buffer overreads and output buffer
-overflows.  It should systematically cover these issues.
-
-I used code auto-generation for updating the test expectations for
-truncated RDATA in TXT, ISDN records, after writing the rest
-of the test by hand.
-
-Assisted-by: LLM
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-
-CVE: CVE-2026-6238
-Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dp=
atch;h=3D4ba0b79b9596e5a4951cc9eaa1546a55e543e083]
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
----
- resolv/Makefile          |   2 +
- resolv/tst-ns_sprintrr.c | 329 +++++++++++++++++++++++++++++++++++++++
- 2 files changed, 331 insertions(+)
- create mode 100644 resolv/tst-ns_sprintrr.c
-diff --git a/resolv/Makefile b/resolv/Makefile
-index 79a1b9647f..130d8b51e0 100644
---- a/resolv/Makefile
-+++ b/resolv/Makefile
-@@ -92,6 +92,7 @@ tests +=3D \
-   tst-ns_name \
-   tst-ns_name_compress \
-   tst-ns_name_pton \
-+  tst-ns_sprintrr \
-   tst-res_hconf_reorder \
-   tst-res_hnok \
-   tst-resolv-aliases \
-@@ -323,5 +324,6 @@ $(objpfx)tst-ns_name: $(objpfx)libresolv.so
- $(objpfx)tst-ns_name.out: tst-ns_name.data
- $(objpfx)tst-ns_name_compress: $(objpfx)libresolv.so
- $(objpfx)tst-ns_name_pton: $(objpfx)libresolv.so
-+$(objpfx)tst-ns_sprintrr: $(objpfx)libresolv.so
- $(objpfx)tst-res_hnok: $(objpfx)libresolv.so
- $(objpfx)tst-p_secstodate: $(objpfx)libresolv.so
-diff --git a/resolv/tst-ns_sprintrr.c b/resolv/tst-ns_sprintrr.c
-new file mode 100644
-index 0000000000..34739b5924
---- /dev/null
-+++ b/resolv/tst-ns_sprintrr.c
-@@ -0,0 +1,329 @@
-+/* Tests for the ns_sprintrr function.
-+   Copyright (C) 2026 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <arpa/nameser.h>
-+
-+#include <alloc_buffer.h>
-+#include <arpa/inet.h>
-+#include <libc-diag.h>
-+#include <stdbool.h>
-+#include <string.h>
-+#include <support/check.h>
-+#include <support/next_to_fault.h>
-+
-+#include <stdio.h>
-+
-+/* Regions that test_one_record uses for input and output.  */
-+static struct support_next_to_fault ntf_in;
-+static struct support_next_to_fault ntf_out;
-+
-+/* This is used by test_one_record to construct the packet.   */
-+static const char packet_prefix[] =3D
-+  /* DNS response with one question, one answer record.  */
-+  "AA\x81\x80\0\1\0\1\0\0\0\0"
-+  /* Question: www.example.org/IN/ANY.  */
-+  "\3www\7example\3org\0\0\xff\0\1"
-+  /* Response: compression reference.  */
-+  "\xc0\x0c";
-+
-+/* Use ns_sprintrr to format a DNS record (starting with
-+   packet_prefix) of type RTYPE, with a record payload of RDATALEN
-+   bytes starting at RDATA.  Check successful formatting against
-+   EXPECTED.  Try various truncated input and output buffers to catch
-+   overreads and buffer overflows, using ntf_in and ntf_out above.  */
-+static void
-+test_one_record (uint16_t rtype, const char *rdata, size_t rdatalen,
-+                 const char *expected)
-+{
-+  struct rr_header
-+  {
-+    uint16_t typ;
-+    uint16_t cls;
-+    uint32_t ttl;
-+    uint16_t rdatalen;
-+    uint16_t pad;
-+  } hdr =3D
-+    {
-+      .typ =3D htons (rtype),
-+      .cls =3D htons (ns_c_in),
-+      .ttl =3D htonl (86400),     /* One day.  */
-+      .rdatalen =3D htons (rdatalen),
-+    };
-+  enum { hdrlen =3D offsetof (struct rr_header, pad) };
-+  TEST_COMPARE (hdrlen, 10);
-+
-+  /* Construct the packet from packet_prefix, hdr, and rdata.  */
-+  unsigned char packet[512];
-+  size_t packetlen;
-+  {
-+    struct alloc_buffer buf =3D alloc_buffer_create (packet, sizeof (pack=
et));
-+    alloc_buffer_copy_bytes (&buf, packet_prefix, sizeof (packet_prefix) =
- 1);
-+    alloc_buffer_copy_bytes (&buf, &hdr, hdrlen);
-+    alloc_buffer_copy_bytes (&buf, rdata, rdatalen);
-+    packetlen =3D sizeof (packet) - alloc_buffer_size (&buf);
-+  }
-+
-+  /* Parse the record.   */
-+  ns_msg msg;
-+  TEST_COMPARE (ns_initparse (packet, packetlen, &msg), 0);
-+  ns_rr rr;
-+  TEST_COMPARE (ns_parserr (&msg, ns_s_an, 0, &rr), 0);
-+
-+  /* Try sizes up to this limit.  Go a bit beyond the expected size to
-+     check for errors.  */
-+  size_t max_result_size =3D strlen (expected) + 16;
-+
-+  bool success =3D false;
-+  for (size_t result_size =3D 1; result_size <=3D max_result_size; ++resu=
lt_size)
-+    {
-+      char *result_start =3D ntf_out.buffer + ntf_out.length - result_siz=
e;
-+      memset (result_start, 'X', result_size);
-+
-+      /* ns_sprintrr was deprecated in 2.34.  */
-+      DIAG_PUSH_NEEDS_COMMENT;
-+      DIAG_IGNORE_NEEDS_COMMENT (4.9, "-Wdeprecated-declarations");
-+      int ret =3D ns_sprintrr (&msg, &rr, NULL, NULL, result_start, resul=
t_size);
-+      DIAG_POP_NEEDS_COMMENT;
-+
-+      if (ret > 0)
-+        {
-+          TEST_COMPARE_STRING (result_start, expected);
-+          TEST_COMPARE (ret, strlen (expected));
-+          success =3D true;
-+        }
-+      else
-+        {
-+          TEST_VERIFY (!success);
-+          TEST_COMPARE (ret, -1);
-+        }
-+    }
-+  TEST_VERIFY (success);
-+
-+  /* Test with truncated RDATA.   */
-+  for (size_t rdata_size =3D 0; rdata_size <=3D rdatalen; ++rdata_size)
-+    {
-+      size_t truncated_packet_size =3D packetlen - rdatalen + rdata_size;
-+      unsigned char *packet_start
-+        =3D ((unsigned char *) ntf_in.buffer + ntf_in.length
-+           - truncated_packet_size);
-+      memcpy (packet_start, packet, truncated_packet_size);
-+      /* Patch in the updated RDATA length field.  */
-+      uint16_t new_rdatalen =3D htons (rdata_size);
-+      memcpy (packet_start + truncated_packet_size - rdata_size - 2,
-+              &new_rdatalen, 2);
-+
-+      ns_msg msg;
-+      TEST_COMPARE (ns_initparse (packet_start, truncated_packet_size, &m=
sg),
-+                    0);
-+      ns_rr rr;
-+      TEST_COMPARE (ns_parserr (&msg, ns_s_an, 0, &rr), 0);
-+
-+      size_t result_size =3D strlen (expected) + 1;
-+      char *result_start =3D ntf_out.buffer + ntf_out.length - result_siz=
e;
-+      memset (result_start, 'X', result_size);
-+
-+      /* ns_sprintrr was deprecated in 2.34.  */
-+      DIAG_PUSH_NEEDS_COMMENT;
-+      DIAG_IGNORE_NEEDS_COMMENT (4.9, "-Wdeprecated-declarations");
-+      int ret =3D ns_sprintrr (&msg, &rr, NULL, NULL, result_start, resul=
t_size);
-+      DIAG_POP_NEEDS_COMMENT;
-+
-+      /* This flag indicates whether the output is syntactically
-+         correct.  In some cases, truncation may still yield a valid
-+         payload.  */
-+      bool broken =3D rdata_size < rdatalen;
-+      switch (rtype)
-+        {
-+        case ns_t_wks:
-+          /* WKS records use all trailing bytes for the port bitmap.  */
-+          broken =3D rdata_size < 5;
-+          break;
-+        case ns_t_nsap:
-+          /* Uses all bytes that are available.  */
-+          broken =3D false;
-+          break;
-+        case ns_t_txt:
-+          /* Truncation produces a valid payload if it occurs right
-+             after a complete string in the TXT payload.  */
-+          broken =3D false;
-+          for (size_t pos =3D 0; pos < rdata_size; )
-+            {
-+              unsigned int slen =3D rdata[pos] & 0xff;
-+              if (pos + 1 + slen > rdata_size)
-+                {
-+                  broken =3D true;
-+                  break;
-+                }
-+              pos +=3D 1 + slen;
-+            }
-+          break;
-+        case ns_t_isdn:
-+          /* The second field is optional.  If it is present, it must
-+             not be truncated.  */
-+          broken =3D rdata_size < 6 || (rdata_size > 6 && rdata_size < rd=
atalen);
-+          break;
-+        case ns_t_a6:
-+          /* The first A6 subtest contains a trailing domain name,
-+             which is ignored and not formatted.  */
-+          if (rdata_size > 0 && rdata[0] =3D=3D 0)
-+            broken =3D rdata_size < 17;
-+          break;
-+        case ns_t_cert:
-+        case ns_t_tkey:
-+        case ns_t_tsig:
-+          /* Only generic printing, which does not validate anything.  */
-+          broken =3D false;
-+          break;
-+        }
-+
-+      if (broken)
-+        {
-+          if (strstr (result_start, "RR format error") !=3D NULL)
-+            /* No further checks if an error indicator has been added
-+               to the output.  */
-+            ;
-+          else
-+            TEST_COMPARE (ret, -1);
-+        }
-+      else
-+        TEST_VERIFY (ret > 0);
-+    }
-+}
-+
-+static int
-+do_test (void)
-+{
-+  ntf_in =3D support_next_to_fault_allocate (512);
-+  ntf_out =3D support_next_to_fault_allocate (256);
-+
-+#define T(rtype, rdata, expected) \
-+  test_one_record (rtype, rdata, sizeof (rdata) - 1, expected)
-+  T (ns_t_a, "\xc0\0\2\1", "www.example.org.\t1D IN A\t\t192.0.2.1");
-+  T (ns_t_cname, "\4www1\4prod\xc0\x10",
-+     "www.example.org.\t1D IN CNAME\twww1.prod.example.org.");
-+  T (ns_t_hinfo, "\5first\6second",
-+     "www.example.org.\t1D IN HINFO\t\"first\" \"second\"");
-+  T (ns_t_isdn, "\5first\6second",
-+     "www.example.org.\t1D IN ISDN\t\"first\" \"second\"");
-+  /* Bug: Extra space at the end in the text representation of ISDN RRs. =
 */
-+  T (ns_t_isdn, "\5first", "www.example.org.\t1D IN ISDN\t\"first\" ");
-+  T (ns_t_soa,
-+     "\2ns\xc0\x10\12hostmaster\xc0\x10"
-+     "\0\0\0\1\0\0\0\2\0\0\0\3\0\0\0\4\0\0\0\5",
-+     "www.example.org.\t1D IN SOA\tns.example.org. hostmaster.example.org=
. (\n"
-+     "\t\t\t\t\t1\t\t; serial\n"
-+     "\t\t\t\t\t2S\t\t; refresh\n"
-+     "\t\t\t\t\t3S\t\t; retry\n"
-+     "\t\t\t\t\t4S\t\t; expiry\n"
-+     "\t\t\t\t\t5S )\t\t; minimum\n");
-+  T (ns_t_mx, "\0\xa\2mx\xc0\x10",
-+     "www.example.org.\t1D IN MX\t10 mx.example.org.");
-+  T (ns_t_px, "\0\xa\3px1\xc0\x10\3px2\xc0\x10",
-+     "www.example.org.\t1D IN PX\t10 px1.example.org. px2.example.org.");
-+  T (ns_t_x25, "\4X.25",
-+     "www.example.org.\t1D IN X25\t\"X.25\"");
-+  T (ns_t_txt, "\1A\2BC\3DEF",
-+     "www.example.org.\t1D IN TXT\t\"A\" \"BC\" \"DEF\"");
-+  T (ns_t_nsap, "",
-+     "www.example.org.\t1D IN NSAP\t");
-+  T (ns_t_nsap, "\1",
-+     "www.example.org.\t1D IN NSAP\t01");
-+  T (ns_t_nsap, "\1\2",
-+     "www.example.org.\t1D IN NSAP\t01.02");
-+  T (ns_t_nsap, "\1\2\3",
-+     "www.example.org.\t1D IN NSAP\t01.0203");
-+  T (ns_t_nsap, "\1\2\3\4",
-+     "www.example.org.\t1D IN NSAP\t01.0203.04");
-+  T (ns_t_nsap,
-+     "\1\2\3\4\5\6\7\10\11\12\13\14\15\16\17\20\21\22\23\24\25\26\27\30\3=
1\32"
-+     "\33\34\35\36\37\40\41\42\43\44\45\46\47\50\51\52\53\54\55\56\57\60\=
61"
-+     "\62\63\64\65\66\67\70\71\72\73\74\75\76\77\100\101\102\103\104\105\=
106"
-+     "\107\110\111\112\113\114\115\116\117\120\121\122\123\124\125\126\12=
7"
-+     "\130\131\132\133\134\135\136\137\140\141\142\143\144\145\146\147\15=
0"
-+     "\151\152\153\154\155\156\157\160\161\162\163\164\165\166\167\170\17=
1"
-+     "\172\173\174\175\176\177\200\201\202\203\204\205\206\207\210\211\21=
2"
-+     "\213\214\215\216\217\220\221\222\223\224\225\226\227\230\231\232\23=
3"
-+     "\234\235\236\237\240\241\242\243\244\245\246\247\250\251\252\253\25=
4"
-+     "\255\256\257\260\261\262\263\264\265\266\267\270\271\272\273\274\27=
5"
-+     "\276\277\300\301\302\303\304\305\306\307\310\311\312\313\314\315\31=
6"
-+     "\317\320\321\322\323\324\325\326\327\330\331\332\333\334\335\336\33=
7"
-+     "\340\341\342\343\344\345\346\347\350\351\352\353\354\355\356\357\36=
0"
-+     "\361\362\363\364\365\366\367\370\371\372\373\374\375\376\377",
-+     "www.example.org.\t1D IN NSAP\t"
-+     "01.0203.0405.0607.0809.0A0B.0C0D.0E0F.1011.1213.1415.1617.1819.1A1B=
"
-+     ".1C1D.1E1F.2021.2223.2425.2627.2829.2A2B.2C2D.2E2F.3031.3233.3435.3=
637"
-+     ".3839.3A3B.3C3D.3E3F.4041.4243.4445.4647.4849.4A4B.4C4D.4E4F.5051.5=
253"
-+     ".5455.5657.5859.5A5B.5C5D.5E5F.6061.6263.6465.6667.6869.6A6B.6C6D.6=
E6F"
-+     ".7071.7273.7475.7677.7879.7A7B.7C7D.7E7F.8081.8283.8485.8687.8889.8=
A8B"
-+     ".8C8D.8E8F.9091.9293.9495.9697.9899.9A9B.9C9D.9E9F.A0A1.A2A3.A4A5.A=
6A7"
-+     ".A8A9.AAAB.ACAD.AEAF.B0B1.B2B3.B4B5.B6B7.B8B9.BABB.BCBD.BEBF.C0C1.C=
2C3"
-+     ".C4C5.C6C7.C8C9.CACB.CCCD.CECF.D0D1.D2D3.D4D5.D6D7.D8D9.DADB.DCDD.D=
EDF"
-+     ".E0E1.E2E3.E4E5.E6E7.E8E9.EAEB.ECED.EEEF.F0F1.F2F3.F4F5.F6F7.F8F9.F=
AFB"
-+     ".FCFD.FEFF");
-+  T (ns_t_aaaa, "\x20\x01\x0d\xb8\0\0\0\0\0\0\0\0\0\0\x12\x34",
-+     "www.example.org.\t1D IN AAAA\t2001:db8::1234");
-+  /* Example from RFC 1876.  The loc_ntoa format is different from the
-+     official text representation.  */
-+  T (ns_t_loc,
-+     "\000\063\026\023\211\027\055\320\160\276\025\360\000\230\215\040",
-+     "www.example.org.\t1D IN LOC"
-+     "\t42 21 54.000 N 71 06 18.000 W -24.00m 30.00m 10000.00m 10.00m");
-+  T (ns_t_naptr,
-+     "\0\1\0\2\5flags\7service\2.*\5naptr\xc0\x10",
-+     "www.example.org.\t1D IN NAPTR\t1 2 \"flags\" \"service\" \".*\""
-+     " naptr.example.org.");
-+  T (ns_t_srv,
-+     "\0\1\0\2\0\x50\4www1\xc0\x10",
-+     "www.example.org.\t1D IN SRV\t1 2 80 www1.example.org.");
-+  T (ns_t_rp, "\3rp1\xc0\x10\3rp2\xc0\x10",
-+     "www.example.org.\t1D IN RP\trp1.example.org. rp2.example.org.");
-+  T (ns_t_wks, "\xc0\0\2\1\6\0\0\0\0\0\0\0\0\0\0\200",
-+     "www.example.org.\t1D IN WKS\t192.0.2.1 6 ( \n\t\t\t\t80 )");
-+  T (ns_t_cert, "\0\1\x04\xd2\0blob",
-+     "www.example.org.\t1D IN CERT\t\\# 9 (\n"
-+     "\t00 01 04 d2 00 62 6c 6f 62 )\t\t\t; .....blob");
-+  T (ns_t_tkey, "\4algo\0\0\0\0\1\0\0\0\2\0\3\0\4"
-+     "\0\5\xa1\xa2\xa3\xa4\xa5\0\3\xb1\xb2\xb3",
-+     "www.example.org.\t1D IN TYPE249\t\\# 30 (\n"
-+     "\t04 61 6c 67 6f 00 00 00 00 01 00 00 00 02 00 03 ; .algo..........=
.\n"
-+     "\t00 04 00 05 a1 a2 a3 a4 a5 00 03 b1 b2 b3 )\t; ..............");
-+  T (ns_t_tsig, "\4algo\0"
-+     "\0\20\xdd\xcd\x64\x10\xe9\x21\x34\x1a\x8e\xe0\xa1\x9a\x30\xfc\x3b\x=
d1"
-+     "\0\2\0\3\0\5other",
-+     "www.example.org.\t1D IN TSIG\t\\# 35 (\n"
-+     "\t04 61 6c 67 6f 00 00 10 dd cd 64 10 e9 21 34 1a ; .algo.....d..!4=
.\n"
-+     "\t8e e0 a1 9a 30 fc 3b d1 00 02 00 03 00 05 6f 74 ; ....0.;.......o=
t\n"
-+     "\t68 65 72 )\t\t\t\t\t; her");
-+  T (ns_t_a6,
-+     "\0\x20\x01\x0d\xb8\0\0\0\0\0\0\0\0\0\0\x12\x34\6prefix\xc0\x10",
-+     "www.example.org.\t1D IN A6\t0 2001:db8::1234");
-+  T (ns_t_a6,
-+     "\0\x20\x01\x0d\xb8\0\0\0\0\0\0\0\0\0\0\x12\x35",
-+     "www.example.org.\t1D IN A6\t0 2001:db8::1235");
-+  T (ns_t_a6, "\200\6prefix\xc0\x10",
-+     "www.example.org.\t1D IN A6\t128  prefix.example.org.");
-+  T (ns_t_a6, "\x20\0\0\0\0\0\0\0\0\0\0\x12\x36\6prefix\xc0\x10",
-+     "www.example.org.\t1D IN A6\t32 ::1236 prefix.example.org.");
-+#undef T
-+
-+  support_next_to_fault_free (&ntf_in);
-+  support_next_to_fault_free (&ntf_out);
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
---=20
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glib=
c/glibc_2.39.bb
index d31c865641..f6be1b5fc9 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -56,13 +56,6 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};nam=
e=3Dglibc \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bina=
r.patch \
            file://0023-qemu-stale-process.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch =
\
-           file://0024-CVE-2026-5435.patch \
-           file://0025-CVE-2026-6238-0001.patch \
-           file://0026-CVE-2026-6238-0002.patch \
-           file://0027-CVE-2026-6238-0003.patch \
-           file://0028-CVE-2026-6238-0004.patch \
-           file://0029-CVE-2026-6238-0005.patch \
-           file://0030-CVE-2026-6238-0006.patch \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
