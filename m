Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13493.1794903397605191231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 00:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=rImyn3E5;
 spf=pass (domain: est.tech, ip: 52.101.83.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMUvlxKFw0Jscw4Q67Fw8nBabZ4vFDWrBPunNmKnaHmA8G9z0+/hiTIcYkpbOZ+tiBUuMBMMN2xnSTSJ7yulbCSdoDZqxzV+Xv0Hm3j/eWu0Jj4LXbZpLfJHKYQFKnS6hvU9I9GmzWjym3uhX++f+HCrzzCxbnC2jT511TiMBLpSMUy7IavjRw7JXbbHnoQB7ra8NCoLiN1/S1JlEQ9168haQSHGlfOD5gMa8wvx1ivdpGwj8BeJ8VKY9dKLLOpX2SVQnZfyY+8vRutlehu5asJsYZ3+NxKmqYQrE2R1rUGb4UU5pijGkccxa0MbL2eTab8xsKT5G6wVbUD8PpNd0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X19rq/1/Cfj7mfE/xNCWnepbtS3bkmSFNJCOccCcgkQ=;
 b=mJiJcfIrSkH3I4F6kELH2rggsglhDEC9/mbcS5U2DC47vqG0Bjg8+8dS0faSdIxMVS3xVhe5gCDuuHpkbqmAmonPGLO5uV032L8FsvumdljFtE37RSOrQ4zgZlI5cQzRT84tahrX8fRtEYcwYi5dxNsd4AJmuq9tMfOB8nACBIlok0UY4YS6iignNTDqYd34G8pcM39VBKhTd3p52T/GfC6wBEYCeHR/BxM8BioRo5scn15obKpltZ8fmmUyO2+qBR/Jx54niNwqD7w1TDyUDn4b+ttUYdbuDFJSjl8S/sm7R3DRzBTV2ClkxIs02vPkuP30FBeLls6k56J4FNtVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X19rq/1/Cfj7mfE/xNCWnepbtS3bkmSFNJCOccCcgkQ=;
 b=rImyn3E5ghEge9wWCtLqpUykChxeXn9wXKroIUJ53MoMoiCB7v53T00sp2+czdVANmU8pKhNHIvT36oRQy3EUNnUoD69Mn42+TooQlTm7pvV2B0e7ij3hvhU085SUyn/n531swa62/HrU11lNET1/jPnfoKytS85dSygY4XkBf3pRITQ6uFF7kh7PEAzrsSnSBsY17uJ56fZmJygJOHNGU4APDB7w4u07V+yPq43j1yKcJxUsXpddSG4eiwdx25mN4RmKfauvDW/wNsXa6xmMiZycg66IrwrT3FpP0EE/CfzE3cH+p+pqlAEQA5f/35txHi6rbPmQyjbSMQGOgUM9w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:16:31 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 08:16:31 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 1/2] perl-cross: add patches for perl-5.42.3
Date: Tue, 17 Nov 2026 09:16:28 +0100
Message-ID: <20261117081629.12668-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105170249.55552-1-jaipaul.cheernam@est.tech>
References: <20261105170249.55552-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI1P18901MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea6c493-2d6b-4a3b-908d-08df4483162b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009221727099003|261009223327099003|261009221227099003|261009220027099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: ixtO/E/Lp5bd8tZpv1xVw+ofArOwUNJJStW9jYRR9eYsyynsXziilbhiLmcRLR/1niZBrZhctq9+d2ZsW6VL+TXbW3bJHrvfqrCBHBnw8fhWFMv81pjc+eAw548l21EG2+sNeR6De5PsrLyDyDOF/QSNxcksDT6nW67s911nOHn299nuzrgFgBCFWhA1SDMO+uW71cwFLuoywuh9WrJK9XiIrCsDnG2vT8Fyp589VI/5ZO82JhgY3ktfwhCiPUWB2aa8wupUP+Etp7yx04tRB9Yd7dzQGLz3dKeqGYuUKABkOTgcsFOSfXlzmAbscHw30F5qYakPmtRyZXFJfYYeZ4Ig2RrfhRbCndmf4Hn8e6rDtl8qU+ugLm9uBGtBe/Oz5ZoWYF4p8dLQPZH8deoVfHvHvwYZOtRVdTfHcUI6Lq2UCwX6fMxLaRvtbGyTeVQZ59bFGOavwFr5NBt9KQTE/AqAsg+CREYk76Kp7XhuKxRpobjRwH7NL7u5TcKQGcmYF1jH4CU6PE2pROoAkDCjbWqyyygkBah0HC81m2Db3+xv72q/YJkaGwHP3GSi7x0liCgw2E6rKH9p9XOPdbBOc4BSXXO4znMk9FOeFLWvswcRVrw1G/B+YCNcB98PHCn19uH9CzjBRXeSH2Gm2ATmsy0HvYAlFPrvaiZ/YN9FAgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009221727099003)(261009223327099003)(261009221227099003)(261009220027099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Yi6/B8QSblU8Qx0zQ+43fbDLcEumPenKUwHETMEn/nXcSapjmbu1lwY1xDD?=
 =?us-ascii?Q?f6aQtseI/NmnDvmBoN1PwLkqKMvScqYJF/rcqcWTp2//gyUr/dBNvxuxa++3?=
 =?us-ascii?Q?AQlcVI57s4WLNBrYLb/0XWbGeQRWq7r52vcvgkxKG6uxIeBx8vRoU87bZSt8?=
 =?us-ascii?Q?zm3t1Z0TjZrEPEU7xQrx6Ou0E8t4v7/xfkcRjKJ3Hrt1q+ZNzjoAVHv+CyJ/?=
 =?us-ascii?Q?iUuUEKiJKG5Ryiak+T8NIgUBVsgNLpeSBT4dDy7NobXJwGa+SnGnzBz+zypA?=
 =?us-ascii?Q?tIieh9wdiENR4NvMN/91jcZUVLT0et/wIqh8L9xD/9G5UAPclDMh0mT3gnVf?=
 =?us-ascii?Q?o8CaEPgcAwEotNzmQZLtvN0AaHkUqDNyy7M4Qbdc1zy5Dxa8LwJQIi92uj0y?=
 =?us-ascii?Q?6PHMCVJdW7GUvXN65QqZAwcRpyMv5cF2yWlZ1zLmvsi8ynwWNSJ5veeTSaYQ?=
 =?us-ascii?Q?7gA1qUQyyFpRmgL+wAm9dZMvYWrArC0zpRWYkQOgYV7L6rou5RSTZUZjTtOl?=
 =?us-ascii?Q?2lJN6gt/TZYIWVUj50X8rBkoVYYeFBTSWFi0ebW4jjFclJY2rj29eef6jFY3?=
 =?us-ascii?Q?XnRtxNCBkof7grDQUa0lCEsUn2QDPMwrk5jm7DYLAA+zOAx9mEfW/Op3EtIb?=
 =?us-ascii?Q?9CysIFH0k8DQSLnQV1DTL+frP6e4FVG6pbq28kxuq7ce0OKqd74RQe72qvG7?=
 =?us-ascii?Q?xH1M5/v3mTTdiPuJfRpEFKkkgvOPOuCLcQW5vNOk6EOFxRs/OLHLHN0SVFY1?=
 =?us-ascii?Q?W5GQRSx49zRfoup4NjQ4xa4Nbg3XMEjCvYjw1Kiw4OnORheueJOQqGVsOeSu?=
 =?us-ascii?Q?BWc5n7VKA9lKrFoiQISSXa6yq/g9CNjTeC4hgJV1Ua/8iXw4Ew7GyWMEXqiR?=
 =?us-ascii?Q?1UGkl8Heqs3LqkT2SKR5BegXYQBdvfKa1LXyCfpfDYd1L4GyjMmm8cf19qP7?=
 =?us-ascii?Q?jh4eHCc7WRvoAgZaAYeGgBG7oeN2bKlpY2Ixd+GO3Lv2SYUg3v5AOPqyitUG?=
 =?us-ascii?Q?prUK2557JyWcAluyARU3OORlfmQuUSPvvk9+BN7iuYImAH/1VA9AznGlc+4D?=
 =?us-ascii?Q?vD+v79Bbwx+V4r+ZRDiS1U0721+wDv9v8vpU82GjmQb58jxrY5+XsUuQwW4o?=
 =?us-ascii?Q?sd1+hXyP8TIMQmw9nt572LO99EflsZAsjF+eUH0Vce62nzQ9l7EPjZ+adGjn?=
 =?us-ascii?Q?3GaFl0HNcELEmnOf3H1s3zRMV6OQ7vZXDa21cyO/c4CdkSmsytI1+6WW/1b2?=
 =?us-ascii?Q?HSeaUFdLOVnLSzULazhf2HuOw6vVf3TvCDbIawXRqJSVaRu4LWotXAAI84oJ?=
 =?us-ascii?Q?6qro19llrjDOKPZ/jEdahf7NesVaML1upj+l+Jy6y4GxILXyLJ1RaxriZSEC?=
 =?us-ascii?Q?ZcT9EKEWOsdj3H7r0cJ/P3hpYYTTfUKciqXzCwKg7iAavKHX8dJ9FbUf+wm7?=
 =?us-ascii?Q?c2rTrt5YsWvzhuP/spYOYBtyhQNEhBkiuTBz/zVHBNIOtULYKZCT8Cp+Ezv5?=
 =?us-ascii?Q?p1ySrcglJPKukF3dpR0oR+0M1+syHhxVSDUY5nYxRVY3JOTB9+oxvM2eV2Z0?=
 =?us-ascii?Q?uDST8l7052UiXEZHQX1u1CDIA/rSR+iMFp2MtByNToygozdP+uGwHDArxKrP?=
 =?us-ascii?Q?LuMW1dL3QBEL7a7CbG7n0UhLzTBrbdGjH4i3WUsr27m/9/vPJ5nhfYuI2l6H?=
 =?us-ascii?Q?hdARIZ0BI4FpHtzTxSgLme9CH8jmE7sB2EOhWzIEBAibwCvI1dQj9J8xhjLS?=
 =?us-ascii?Q?+hyJUUEF1fSZFub8NCP6YcBJdVYIjCM=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea6c493-2d6b-4a3b-908d-08df4483162b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:16:31.5714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3Osp8CPkVyvIMOVPmOW6BGPl97d5VMClEQV4z62u/rS1N2MgvrcjdddERVGZSQ8aIEchkYswporrc32PRccBRjjIV+IasJvdNhrrZWsGWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 08:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250411
Content-Type: text/plain; charset="utf-8"

perl-cross 1.6.4 has no patchset for the 5.42.3 point release and aborts
configure on unknown versions. Reuse the 5.42.0 patchset, as its
cnf/diffs/README advises ("Copy the closest available version").

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes Since v1:
- Add symlinks to missing liblist.patch and xconfig.patch

 ...rl-cross-add-patches-for-perl-5.42.3.patch | 114 ++++++++++++++++++
 .../perl-cross/perlcross_1.6.4.bb             |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/perl-cross/files/0001-perl-cross-=
add-patches-for-perl-5.42.3.patch

diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-pat=
ches-for-perl-5.42.3.patch b/meta/recipes-devtools/perl-cross/files/0001-pe=
rl-cross-add-patches-for-perl-5.42.3.patch
new file mode 100644
index 0000000000..5b823d593c
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-patches-fo=
r-perl-5.42.3.patch
@@ -0,0 +1,114 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 5 Nov 2026 14:00:00 +0000
+Subject: [PATCH] perl-cross: add patches for perl-5.42.3
+
+Reuse the perl 5.42.0 patchset for the 5.42.3 point release. Following the
+cnf/diffs convention, every entry is a symlink to an existing patchset so
+no original code is added.
+
+Upstream-Status: Inappropriate [oe-specific; perl-cross goes 5.42.0 -> 5.4=
4.0]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ cnf/diffs/perl5-5.42.3/constant.patch       | 1 +
+ cnf/diffs/perl5-5.42.3/dynaloader.patch     | 1 +
+ cnf/diffs/perl5-5.42.3/findext.patch        | 1 +
+ cnf/diffs/perl5-5.42.3/installscripts.patch | 1 +
+ cnf/diffs/perl5-5.42.3/liblist.patch        | 1 +
+ cnf/diffs/perl5-5.42.3/makemaker.patch      | 1 +
+ cnf/diffs/perl5-5.42.3/posix-makefile.patch | 1 +
+ cnf/diffs/perl5-5.42.3/test-checkcase.patch | 1 +
+ cnf/diffs/perl5-5.42.3/test-makemaker.patch | 1 +
+ cnf/diffs/perl5-5.42.3/xconfig.patch        | 1 +
+ 10 files changed, 10 insertions(+)
+ create mode 120000 cnf/diffs/perl5-5.42.3/constant.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/dynaloader.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/findext.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/installscripts.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/liblist.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/posix-makefile.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/test-checkcase.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/test-makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/xconfig.patch
+
+diff --git a/cnf/diffs/perl5-5.42.3/constant.patch b/cnf/diffs/perl5-5.42.=
3/constant.patch
+new file mode 120000
+index 0000000..065e198
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/constant.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/constant.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/dynaloader.patch b/cnf/diffs/perl5-5.4=
2.3/dynaloader.patch
+new file mode 120000
+index 0000000..ffb73eb
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/dynaloader.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/dynaloader.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/findext.patch b/cnf/diffs/perl5-5.42.3=
/findext.patch
+new file mode 120000
+index 0000000..9efbe5b
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/findext.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/findext.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/installscripts.patch b/cnf/diffs/perl5=
-5.42.3/installscripts.patch
+new file mode 120000
+index 0000000..1c05e0f
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/installscripts.patch
+@@ -0,0 +1 @@
++../perl5-5.36.0/installscripts.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/liblist.patch b/cnf/diffs/perl5-5.42.3=
/liblist.patch
+new file mode 120000
+index 0000000..5037380
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/liblist.patch
+@@ -0,0 +1 @@
++../perl5-5.42.0/liblist.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/makemaker.patch b/cnf/diffs/perl5-5.42=
.3/makemaker.patch
+new file mode 120000
+index 0000000..d7bd609
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.38.0/makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/posix-makefile.patch b/cnf/diffs/perl5=
-5.42.3/posix-makefile.patch
+new file mode 120000
+index 0000000..29463b7
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/posix-makefile.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/posix-makefile.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/test-checkcase.patch b/cnf/diffs/perl5=
-5.42.3/test-checkcase.patch
+new file mode 120000
+index 0000000..36c5186
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/test-checkcase.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/test-checkcase.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/test-makemaker.patch b/cnf/diffs/perl5=
-5.42.3/test-makemaker.patch
+new file mode 120000
+index 0000000..4e970ff
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/test-makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.34.0/test-makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/xconfig.patch b/cnf/diffs/perl5-5.42.3=
/xconfig.patch
+new file mode 120000
+index 0000000..87ac501
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/xconfig.patch
+@@ -0,0 +1 @@
++../perl5-5.42.0/xconfig.patch
+\ No newline at end of file
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb b/meta/rec=
ipes-devtools/perl-cross/perlcross_1.6.4.bb
index 3c544c9746..584c08defa 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/perl-cross=
-${PV}.tar.gz;name=3Dperl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
+           file://0001-perl-cross-add-patches-for-perl-5.42.3.patch \
            "
 GITHUB_BASE_URI =3D "https://github.com/arsv/perl-cross/releases/"
=20
