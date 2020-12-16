Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web08.2218.1608148918971533475
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 12:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nio365.onmicrosoft.com header.s=selector2-nio365-onmicrosoft-com header.b=oljhPpX9;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=5619220c10=alex.stewart@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BGJw8hn032409;
	Wed, 16 Dec 2020 14:01:58 -0600
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0b-00010702.pphosted.com with ESMTP id 35cvjaq8aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Dec 2020 14:01:57 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBOxWWbOnCVqLUGtfqFShPiSu5s3CaYHTAPf9sdr/6Cc+JCQGDx7DYEUv5/2+Tcr6vrk6XUAd+e9iEtQk/fYHzjPgO2oxXlLKldGtmaZ0jqD7qapYn5p4YZKdoqXz8aBs4z9azVTABvVxszSHzu1x66WoFW7IIl3m9apa1YjzE3VYkGy6sDoq5nCEIDkkuLWokOkRipmNuAbyKo/iTDvgRugVwBT0/5CPIMuAjYC8+p39J9zljFrjeQDguiOl3Qw8nRqb7C/g7+m9cnuMZmHuuloX7CuCFOw/SUAas+s1EzwEhzxpALXzeL00Rt1fz9aW/3/yGHhD3wS+VEfqLFhSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+Amz1E4q5pJxFuKSo4gUbNriCEOiPxGU1rBSY7iKfg=;
 b=iv6De8wQ8tWlAy5YrQ36ir1qHbf1zl1t6GEfBCr08hGtVqFhBcFEBuP9xNUw1YmojT9GovhpD/wgsIzrIVTRS2wc6h4mI/MozpNJ5cIqv3c2OmZz70mKC78BLNwGRqV/ZnhXYgt1UcRoBWxmuzg8KAn+6WF82QbU68qwc31Jl4mMGlFTVzpHrZ4ttJafkEGwNYaNTJOOk+1SagpslqzdY0oqhgAKUtWUnE0gbH1D3limRUkzps0S59KBxxb1+ct0pi8i8M6UpYHQ4EhysrQ6+sH5GE96/JVnkwiVyz8wBzfyqjgRVZXG7jJj1wMQ8bqXvf+0ZT+DmED0t9rs/DKYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+Amz1E4q5pJxFuKSo4gUbNriCEOiPxGU1rBSY7iKfg=;
 b=oljhPpX9mVDb8awwiXJGXaEs2OyGs72RgqYGE9ya2WTEPLJM4HCad+Pr9h8crmQDKJ3xq4T7ASScHLuK1sAA0y1yrTD48S8GMDxLr+gmuo3EOQ62u9NoUbkHlVa0yhp1ncLoZpuaXX4LnqSYZqzJ09esq+pPzkQxBYFsTxx8PSY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=ni.com;
Received: from DM6PR04MB5306.namprd04.prod.outlook.com (2603:10b6:5:10f::25)
 by DM6PR04MB6954.namprd04.prod.outlook.com (2603:10b6:5:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Wed, 16 Dec
 2020 20:01:53 +0000
Received: from DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::85b6:eb0:e666:8db]) by DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::85b6:eb0:e666:8db%6]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 20:01:53 +0000
From: "Alex Stewart" <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: alejandro.delcastillo@ni.com, alex.kanavin@gmail.com,
        Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core][PATCH v2 1/1] opkg: upgrade to version 0.4.4
Date: Wed, 16 Dec 2020 14:00:56 -0600
Message-Id: <20201216200056.2897070-2-alex.stewart@ni.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216200056.2897070-1-alex.stewart@ni.com>
References: <20201216200056.2897070-1-alex.stewart@ni.com>
X-Originating-IP: [130.164.62.147]
X-ClientProxiedBy: DM3PR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:0:52::23) To DM6PR04MB5306.namprd04.prod.outlook.com
 (2603:10b6:5:10f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 41d17.amer.corp.natinst.com (130.164.62.147) by DM3PR08CA0013.namprd08.prod.outlook.com (2603:10b6:0:52::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 20:01:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09430664-900e-4f44-8ffa-08d8a1fd6eee
X-MS-TrafficTypeDiagnostic: DM6PR04MB6954:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR04MB69548F67384D767439C03485FEC50@DM6PR04MB6954.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pQ4ICfa46bJ2sU88YfYuc4l9G5Dngg5blc2JbYS++tv/V24Obyhvx/2DJp+Cku1N3GPOjCnSsJaalPW4Tgqky39riylUEpj2dYYFRdFnoj9KW9OwX5K4Y8D3r6DAx9DxIjUwHUwe4kzFdAjvz2yvXOPsj0ehHgTpiTBTjYwguMiJj8yz4OShgt6C/bUFfftrjkhvpm0p6h6ANov2WT3urRI7Lb8ih3Yr09myNtLDA4gd9ttdbubhjcjQCOx1P5A4Uc5jgcKWc5p24QZFZCjSzy2B7Jb9ENiaLsWoDPAbaZdRYyXWPNhInf3nzacQ+sNjqGwQAl8tG/gNLip6iLyWuvJfM+eqOGWZfPSqt19Ldivy6j66tvwMQhd8pI7ZgYlUeJTNUvUtF7c0HdOd+NVFKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5306.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39860400002)(376002)(366004)(346002)(6512007)(6486002)(44832011)(8676002)(36756003)(2906002)(86362001)(186003)(5660300002)(6506007)(66946007)(83380400001)(52116002)(16526019)(66556008)(2616005)(1076003)(956004)(26005)(4326008)(8936002)(6916009)(66476007)(316002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?IK4SZQMK2y00on+0ZDVP0uexBGlWKUQdWEgU4VtpTBUwc5+1H81Vxq27+nW9?=
 =?us-ascii?Q?y7N4P/efXCMY19XalkO2g4683jLZCNGhRF1jucTsaynF2iZ9K7+6IxcKo9az?=
 =?us-ascii?Q?YSYTKu2TDKqdpsKd1ZrPTtWUUI90aiIgbywiZUhND8PUzlx65wLrPXO2xD//?=
 =?us-ascii?Q?nHCwi+lJmtnyHqgcTFZIl+/yd/wgH9qxHt/O+tQ7MslCoLrHcTqAZ0qUhV6e?=
 =?us-ascii?Q?uMqBP7sGDUmtDSSNaKuqN30wkq6MOPryfY2JVxGBkyiYZZfMRZxGXIChgknT?=
 =?us-ascii?Q?ooYGnYVs90l2AdElRs5051VmfA4pnzSTNwlBwdi4gSvWRidsNwx5afkWGEp0?=
 =?us-ascii?Q?tnqhOhIbJ4TPNDlky1w+KyvXtbXu70ApiM1+FDwnOwX/bsBwqAv3Na49xBb/?=
 =?us-ascii?Q?Q33A4I0cGWyF78nLppMvxD9T46cHr/MIxjnl9zpkwvYip7tlncKaYicxnvP6?=
 =?us-ascii?Q?8VydgePn1vFPE/BYpnGhn2lPEBk8f1PfJbVugdMtCZ7dLsrI1W8SStd4S5qK?=
 =?us-ascii?Q?A65brlCpnSZaUIKRjypQf9xtk8875zVNixnV1DZmQhFttfbeK7u3xBIvbNZ/?=
 =?us-ascii?Q?tt4t2wC6qWRV1OwkcVJivAh9i4jw+BTUkGSE9gqpVjWCXh7rUjN0soiNPttl?=
 =?us-ascii?Q?U/r2fdImG6zpNuktN+fQxb54iD9UK9JhJ+FjHgqd9695Dt3ko7C8TV+35gK6?=
 =?us-ascii?Q?ejcZs9nfQW0z3dtVWOcNsXk1ihII++FKCe+/Hzksf+mTNtz+hMWNcnpd160m?=
 =?us-ascii?Q?ZWR0WWG3u6KMcs0lzIrpiqXYaKQNUpu0Ah4w/vRv/9eMBHMoqIebREIMzEI2?=
 =?us-ascii?Q?UkdcQBmMP+1SXs6Hcp4mgnVt81Tdy9vxeJHITMe0QOHhJUbO2c5k1DJPSz4N?=
 =?us-ascii?Q?UsU8h6c3evUaMR/vTo/NvPDEA3HtwlfCFYWxKJttnTtq9uVb4yCNvIdh1csA?=
 =?us-ascii?Q?o37WZAW1buyiMlXdoEIM6FXi2Jth1cr19RojS7e+maeVy1CG9K7fkTNYNf1Q?=
 =?us-ascii?Q?TyXC?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5306.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 20:01:53.2151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-Network-Message-Id: 09430664-900e-4f44-8ffa-08d8a1fd6eee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVGVN2Eyw87CtQzfJX88SX0JWWoQXiN1RQ96+aD7us5n/ckeW3K+sJkv3iWbDgSBBg7cH9UzLFUK6hWrgLJjYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6954
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-16_08:2020-12-15,2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 mlxscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160123
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Include an upstream patch for 0.4.4 which fixes a test framework error
that occurs on host systems with symlinked /tmp directories (like OE).

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 ...e-OS-negotiate-relative-package-dirs.patch | 43 +++++++++++++++++++
 .../opkg/{opkg_0.4.3.bb => opkg_0.4.4.bb}     |  5 ++-
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-tests-let-the-OS-negotiate-relative-package-dirs.patch
 rename meta/recipes-devtools/opkg/{opkg_0.4.3.bb => opkg_0.4.4.bb} (92%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-tests-let-the-OS-negotiate-relative-package-dirs.patch b/meta/recipes-devtools/opkg/opkg/0001-tests-let-the-OS-negotiate-relative-package-dirs.patch
new file mode 100644
index 0000000000000000000000000000000000000000..33b7280e5a1d171400e0765c7d66072e3a718d17
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-tests-let-the-OS-negotiate-relative-package-dirs.patch
@@ -0,0 +1,43 @@
+From 4acda6d01c5abd33f1a1a3275fd695363f59473f Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 15 Dec 2020 15:17:54 -0600
+Subject: [opkg][opkg-0.4.4 PATCH] tests: let the OS negotiate relative package
+ dirs
+
+In cases where a regression test requires that a package be installed to
+a subdirectory in the test feed, the opk.py module will attempt to
+resolve the subdirectory and rebase it to the root of the test feed.
+
+This is unnecessary, since all operations which make use of the
+subdirectory path do so from the perspective of the test feed already.
+Further, the rebase implementation breaks in cases where the test feed
+is beyond a symlink.
+
+Remove the resolve-and-rebase logic, and allow the OS to negotiate the
+relative path.
+
+Upstream-Status: Submitted [https://groups.google.com/g/opkg-devel/c/dE1o7_OVQSY]
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+---
+ tests/opk.py | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/tests/opk.py b/tests/opk.py
+index 692339567f72441766c8e658edc5bdf6a339f77d..711abacaeb328283e31524f6a49305fc7d39696a 100644
+--- a/tests/opk.py
++++ b/tests/opk.py
+@@ -58,9 +58,7 @@ class Opk:
+         if 'Version' not in control.keys():
+             control['Version'] = '1.0'
+         if subdirectory is not None:
+-            subdir = Path(subdirectory).resolve()
+-            opkdir = Path(cfg.opkdir)
+-            self._relative_dir = subdir.relative_to(opkdir)
++            self._relative_dir = Path(subdirectory)
+         else:
+             self._relative_dir = None
+         self.control = control
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.3.bb b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
similarity index 92%
rename from meta/recipes-devtools/opkg/opkg_0.4.3.bb
rename to meta/recipes-devtools/opkg/opkg_0.4.4.bb
index 46b7aa25231e49b3e800dabac1e516f6c741e574..f8034ca5fa591bce73e5bf6b0ce70bb6a681a18b 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.3.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
@@ -14,11 +14,12 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://0001-tests-let-the-OS-negotiate-relative-package-dirs.patch \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "86ec5eee9362aca0990994a402e077e9"
-SRC_URI[sha256sum] = "dda452854bc0cd1334f7ba18a66003d1c12a98600c894111b56919b1ea434718"
+SRC_URI[md5sum] = "345900c1d4747d58455867f9fe88ca43"
+SRC_URI[sha256sum] = "2217acc58b8eb31300631ebae75e222ebc700c9c1cf6408088705d19a472c839"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.29.1

