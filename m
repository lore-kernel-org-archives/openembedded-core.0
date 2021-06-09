Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web08.1361.1623273100562468429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 14:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=HnRiiupO;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=1794ea71e9=alex.stewart@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 159L7vZj001579
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Jun 2021 16:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : content-type : mime-version; s=PPS11062020;
 bh=agFpIG6Vz4E5j8GZIpjs7Obt0DsY1OcG6piryugOY0U=;
 b=HnRiiupOekyPhrofLytvk61wJKipv+xiUtZIL8sPKr5HK4gcXfzKY0L8BgZEjJoT7RnG
 toImFN7NEOpWfALCF1VrFqjRMMSuhUqdxUWI0zexaQOW3aDRUQ/aFlk7waP2d4jvXWTY
 A5FGqUBcuWzPNEFyU2Zdui86Bm9evhMSza5MNm0Jwa1v38QfcV7g3Cjgq8xqKtymfWve
 Sg9vxsoIPI+lellYQgxnETXLe0hnLwmGqW1uzJPPgSi6k6eXVBvkPMrjjwStv45lwQ7L
 2BVBbgq1AcIMrNAohpSmg2lkFspHYZNzUnKKss2sgV5MLNPMhPiWCHHL7eTe3nzFos/g 9w== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0a-00010702.pphosted.com with ESMTP id 392qvx9pfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Jun 2021 16:11:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbW11BFeBGkfoeJzhkFhuDvwnm32IEpgkZnxGwRX6IUz4huDS7DdtJqMQyNUXV4FpzsDJzCPYxD5hbZ524oVuN37wSUcLukW4jhdkUQBYMhX/9Jfnfby/7fVmWeeOlSIKR/pH/31mU1VauD7JtiCi96tElaf3lsFUBkSVs/bsTLaXDPozYeKFM5r175NucKd70dmEl0JamnP9pUi8TNX8pjeQiaDqG6vI8BSyhA+kdrqxg7brUnx+NK9yr/r4y/XY4YQfFpAoObVxud0Yq6+aLdkIviE8Wvk4bVseMhe5AooO+G8KVuMUmOYwwJgtA5pSZUSf4FW96kjxr08vPVNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agFpIG6Vz4E5j8GZIpjs7Obt0DsY1OcG6piryugOY0U=;
 b=hKaNyenjwAlwU2ppYrFo6wiD3Bu4v26gxyNME41zw1GPYh7b3LK4scxykhR42oIFUQIN7pZRZyq5zkivoTioZm5m6/IkhKWUOXbuLkNeBax4K2d6PKAMt5IPrLgoXhzkMYlLxZ3DeowjWBLomnWRfdxhuyAh9JpjcG95bFYMH6pps25W1sooCvMKMO2v9Pg/43HukfsDQ8kJdzyzvsOtbYIFaSL6ptHK6Bic6u4wz8WwXxfgwOP0XR7V22PlqaIM2txNhDRSWo2Tb1vjaSLgdAOMHZXER7cqmcHMSFmKUhcA7wrHIX2qGSPQPGgscOb2rKB4IOgmBmvg5g0bqX3v4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agFpIG6Vz4E5j8GZIpjs7Obt0DsY1OcG6piryugOY0U=;
 b=C89JPdEmtD3L+UM24PpHTTip1XbyRXfOy+xD0gzD9Uuhd9OiNWSMVbCkcCGzS+3K1+ddVnaejZKot9Uj5p7/RQWbYYXN9nNeW4EyENUxGwkaA/VBEdBu/t3M8ofvJT1DPEzP3+PDXn1IBghyBAHgWnbSOit/0q6RqZRUeGtbWas=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SA2PR04MB7674.namprd04.prod.outlook.com (2603:10b6:806:14b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 21:11:38 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::ed94:4e4c:ab8d:f185]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::ed94:4e4c:ab8d:f185%7]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 21:11:38 +0000
From: "Alex Stewart" <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core] [PATCH 2/3] opkg: upgrade to version 0.4.5
Date: Wed,  9 Jun 2021 16:10:43 -0500
Message-Id: <20210609211044.853609-2-alex.stewart@ni.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210609211044.853609-1-alex.stewart@ni.com>
References: <20210609211044.853609-1-alex.stewart@ni.com>
X-Originating-IP: [37.19.213.129]
X-ClientProxiedBy: CH2PR18CA0003.namprd18.prod.outlook.com
 (2603:10b6:610:4f::13) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 41d17.amer.corp.natinst.com (37.19.213.129) by CH2PR18CA0003.namprd18.prod.outlook.com (2603:10b6:610:4f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend Transport; Wed, 9 Jun 2021 21:11:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01f48b9d-15f9-474b-435a-08d92b8b2b6e
X-MS-TrafficTypeDiagnostic: SA2PR04MB7674:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR04MB76749C291B0E0A7AC7518EB0FE369@SA2PR04MB7674.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qDxDBjYKiVXWTBTjZSytaV2MVliv5bABbDNcU6N0OBOMYj0wChLGvfGCYAkPD1kWlOyccu9yh0koNLVyiwOL5ItEmOaJLS40RbJI6GlWbLn455byWnZssT3LdtamRexS1mm2pwpEmA19CKaTZ4uGavAWJYEI04PuhKAA886ZlZPJV2k9uAc+Hk88jotEKeiQfWVFucsxynzH3UMP2S2QajwzTsmcvBX7+18GAJ41UZC4BMQ8r09vV8NaStRwshWpliwrS7Tx3aM2p2j82QOF8zJLzB3LKLR/cz1vyQj+QHBpyaMhGwQwO2vYs8f++bx/qi1H5Cntw97/OJqOUdocUf6QJFuY61zLdaaczpFzTubkQHa0yEvAJkQ2xB4lh0NjRL0Qh60j9V/lA8iuWizzUsr1/clo+w/5TwhS+N7XNG+ZSFeC555JqBht9HsQLb4r/I56BUf1ZSsN19aCT66pCPJtlULddJvjwbRcGy6V9NweW8rC4dEp2fvC5TKDzCw1wLlEZ5w1bKyPq0AZpyAmj85CdNdsyh2OMrGWpxzVV+nX2i09IcvUKjdUTPR8jP0oalO7AxbDC4Pojed249Vp9iLWmJLhzTNzfV2aLnpJIO/JYebIpZXV3D/tIyPsqxNnCFiIuPWgWgvu3FJ8BM67IE0AU5SJO7reK9KuNlsikUjryQbfMTieabxo9VS+OkpoHkbECD/s6QqdaFVxeBpOFjN0/Z5JWLmMMylgV5PenrJ0erJjGr8wJlLwaONrpLC7pRwZ6hEOBpwfo++p0jN2JA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(396003)(346002)(366004)(136003)(26005)(66946007)(4326008)(186003)(16526019)(956004)(36756003)(66556008)(6506007)(66476007)(2616005)(5660300002)(6666004)(1076003)(44832011)(52116002)(316002)(38350700002)(38100700002)(8936002)(478600001)(86362001)(6512007)(8676002)(83380400001)(2906002)(6916009)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bj7qcfhs5PDaLTcPRCDuWdTilPXmruyJytH9dx9Q90nqxsnzvTaDop4H/SqB?=
 =?us-ascii?Q?KGGnaj/xg5TkpYjeymgw4HixRuuok6iiJuQOx9rmWNX2C5+aUPR3PpnYn2KG?=
 =?us-ascii?Q?K5A89/B9+aGQRPw0PNUWWV8GDf3FiTVlr/FUTFKlsZbJLJLwECWkWqKA/Qml?=
 =?us-ascii?Q?sCpNZ68u/JQXDUctM7qA9yVVs6zroyCFj9c8/QSK2y0n2m1w94mpSk1ibhlz?=
 =?us-ascii?Q?0SoS1RsRUM37MiST8/FhtT9TeiBo448g1CpQEUPq/W4U3Vcb7BfUUugEGfqk?=
 =?us-ascii?Q?GBAX9SYhRZuITL7NxqR++FOsrriNuXHUcwL7YuXJFl0eqY2A6XWKDlbxgUzp?=
 =?us-ascii?Q?TX6dKJPRIcF9VhVzv7xsZKV3lZrLVybZscq2vCXfoXnTFysV5c1jTuf5Kulx?=
 =?us-ascii?Q?1EDfRmro13FClDFpyP2mvAxBErgUmnxMDHIvXqcWKdS1egy9oNi/n+NFn8v+?=
 =?us-ascii?Q?75xagBkVLUMOm+MhdE/9JxKlTxkWnkqZwq1tCV+RRQp3pvJU5t/swJT9d/2b?=
 =?us-ascii?Q?UxRMZQdLLbE+FZCCZKwoZErdoyDrhcvyKz8xqzPPQ4dKFN5Bs+/r4O/veNvL?=
 =?us-ascii?Q?E7KcXQKd8Nohh5NnxjGunOJPUgOnvQcRypXsJUFMXyEtT/1zm62VBAp+GySq?=
 =?us-ascii?Q?VK2kNZ/IZVZyFsugOLL/1kN5Jsqljhig331VIZzjg0EpkwYMEnDvyMNOa2K5?=
 =?us-ascii?Q?kMriGyO60FLlbufyASNucK2ZyIodFkPxAtZWZ1lwo0GDjEzSq6mcM9QHjY88?=
 =?us-ascii?Q?0rccDjMPz9KE3Q7XLjkExgxu1Ir3QVhOr4/HAVjnHi/xEMf27flUKLRMNycX?=
 =?us-ascii?Q?EZ32lRekoqBuE/7XhPgtiGnEg/RKfDc+YMDWIKlUklpD1LJ2G7h8E4O+ygDM?=
 =?us-ascii?Q?jjWX4BDg4pnRyQspgXfNuYb1xnlAUJfqFtnmpAb/E2F431qGIDNS9+3we6e0?=
 =?us-ascii?Q?qUUfxY671xUTD8iInTDE7SuRmmRQT+CKLf4vPTSOSLeGgtvIliPPZIIajqOP?=
 =?us-ascii?Q?vFzqABde7+A10UKCFXlBgHZ10OoL3Yr3McAlZkBVFh2Dw5YMKtt5aKn1ICEI?=
 =?us-ascii?Q?3o49sSzngHdAkjLrL/JEgOsm+G+N6XTERV8mybAzqzHM8QAUUHDb8jkxTiCA?=
 =?us-ascii?Q?CzbtnvpFCLhS2L19whA3iOD8TGN/e/0IYj7I5SeBWfr7wh+MJsrDHWlaVzQV?=
 =?us-ascii?Q?UcMh+DlrBsFY0q7dOymd6mxG2RzR5lFTFTE6i3amvNDHB1PjitupchiW8DO0?=
 =?us-ascii?Q?QULXbgfrGmwSnFeA0z5mq7ALsH/u4wtFI37Q0gloWFCKYFSgLUfA4FTH3iM3?=
 =?us-ascii?Q?nnNGYaSRu592X1AkJTJ5kw9V?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f48b9d-15f9-474b-435a-08d92b8b2b6e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 21:11:38.0419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0M8i2u3lM3Why+cFNdeMAvDH/7SC1lq2QN1/W6Qo4xzS3tqnSn0n2l3z0C4C7omZo3Zpgd+1jRHXfjuFQ5ekQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7674
X-Proofpoint-GUID: r37DbNOQCa6A8hkLc_CQhDRaMaXeVLWf
X-Proofpoint-ORIG-GUID: r37DbNOQCa6A8hkLc_CQhDRaMaXeVLWf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-09_07:2021-06-04,2021-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106090111
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Drop patches which have been accepted upstream.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 ...e-OS-negotiate-relative-package-dirs.patch | 43 -------------------
 .../opkg/opkg/sourcedateepoch.patch           | 24 -----------
 .../opkg/{opkg_0.4.4.bb => opkg_0.4.5.bb}     |  6 +--
 3 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-tests-let-the-OS-negotiate-relative-package-dirs.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
 rename meta/recipes-devtools/opkg/{opkg_0.4.4.bb => opkg_0.4.5.bb} (91%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-tests-let-the-OS-negotiate-relative-package-dirs.patch b/meta/recipes-devtools/opkg/opkg/0001-tests-let-the-OS-negotiate-relative-package-dirs.patch
deleted file mode 100644
index 33b7280e5a1d171400e0765c7d66072e3a718d17..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/opkg/opkg/0001-tests-let-the-OS-negotiate-relative-package-dirs.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 4acda6d01c5abd33f1a1a3275fd695363f59473f Mon Sep 17 00:00:00 2001
-From: Alex Stewart <alex.stewart@ni.com>
-Date: Tue, 15 Dec 2020 15:17:54 -0600
-Subject: [opkg][opkg-0.4.4 PATCH] tests: let the OS negotiate relative package
- dirs
-
-In cases where a regression test requires that a package be installed to
-a subdirectory in the test feed, the opk.py module will attempt to
-resolve the subdirectory and rebase it to the root of the test feed.
-
-This is unnecessary, since all operations which make use of the
-subdirectory path do so from the perspective of the test feed already.
-Further, the rebase implementation breaks in cases where the test feed
-is beyond a symlink.
-
-Remove the resolve-and-rebase logic, and allow the OS to negotiate the
-relative path.
-
-Upstream-Status: Submitted [https://groups.google.com/g/opkg-devel/c/dE1o7_OVQSY]
-
-Signed-off-by: Alex Stewart <alex.stewart@ni.com>
----
- tests/opk.py | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/tests/opk.py b/tests/opk.py
-index 692339567f72441766c8e658edc5bdf6a339f77d..711abacaeb328283e31524f6a49305fc7d39696a 100644
---- a/tests/opk.py
-+++ b/tests/opk.py
-@@ -58,9 +58,7 @@ class Opk:
-         if 'Version' not in control.keys():
-             control['Version'] = '1.0'
-         if subdirectory is not None:
--            subdir = Path(subdirectory).resolve()
--            opkdir = Path(cfg.opkdir)
--            self._relative_dir = subdir.relative_to(opkdir)
-+            self._relative_dir = Path(subdirectory)
-         else:
-             self._relative_dir = None
-         self.control = control
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
deleted file mode 100644
index 4578fa33be2cdb7de509796b43ffa96f6ab291dc..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Having CLEAN_DATE come from the current date doesn't allow for build
-reproducibility. Add the option of using SOURCE_DATE_EPOCH if set
-which for OE, it will be.
-
-Upstream-Status: Pending
-RP 2021/2/2
-
-Index: opkg-0.4.4/configure.ac
-===================================================================
---- opkg-0.4.4.orig/configure.ac
-+++ opkg-0.4.4/configure.ac
-@@ -281,7 +281,11 @@ AC_FUNC_UTIME_NULL
- AC_FUNC_VPRINTF
- AC_CHECK_FUNCS([memmove memset mkdir regcomp strchr strcspn strdup strerror strndup strrchr strstr strtol strtoul sysinfo utime])
- 
--CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
-+if ! test -z "$SOURCE_DATE_EPOCH" ; then
-+    CLEAN_DATE=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH +"%B %Y" | tr -d '\n'`
-+else
-+    CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
-+fi
- 
- AC_SUBST([CLEAN_DATE])
- 
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.4.bb b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
similarity index 91%
rename from meta/recipes-devtools/opkg/opkg_0.4.4.bb
rename to meta/recipes-devtools/opkg/opkg_0.4.5.bb
index 9eca61be2aa581ecdb1bb38a6af858899c31203e..bc948647c804f3f24800275289ef3fd7dee9335f 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
@@ -15,13 +15,11 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
-           file://0001-tests-let-the-OS-negotiate-relative-package-dirs.patch \
-           file://sourcedateepoch.patch \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "345900c1d4747d58455867f9fe88ca43"
-SRC_URI[sha256sum] = "2217acc58b8eb31300631ebae75e222ebc700c9c1cf6408088705d19a472c839"
+SRC_URI[md5sum] = "5dc41ad37d88803b5e0f456a9c5a0811"
+SRC_URI[sha256sum] = "a1214a75fa34fb9228db8da47308e0e711b1c93fd8938cf164c10fd28eb50f1e"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.32.0

