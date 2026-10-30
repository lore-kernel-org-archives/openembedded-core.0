Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8717.1793357086430159205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KSfoRxGz;
 spf=pass (domain: est.tech, ip: 40.107.159.63, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3He9hOM5emAM2zd0KhB4703hJ6bQ2gfA+niYaV7qVCjoWKx/WYAFTVb+zBy/aDzSPMLf1+V7E79ONipxagOjTZxKFDPSqMAMt8PK1xVUiqEByJgZAPYWJYVIUU9onhO8K08ROIT5iJJKMXlwxqBARipxPz0m376M14lw4GT6Cfzgw68FH/JvZPQrr8BJAUSiXdDBI/UuCGEAQaVOJf+0gZyfD+6o+1eUTCBrOqOm8VfyfO/44gMSS4uGoXhOjeN9oG+UgjT7knkohzJeGGOYrcsXbE3UR1p6Us2z6w+RHs8Wv05+7L4+QtuGj5sIfSHI7pyND7BVabRGpyOOFdcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTQu7kPXpPMWml4e4OryBd6sY/buvdESayQagreKzDQ=;
 b=JfsN7+V86+k5ls9OJp+H1c9BT71ffU6P803J41T6CZvZcakQ2dCZRfOxisTaHD2EbKnPuTMRIJXa2GeiH3jDMfLA8mwRBEj5lPFIN9LZgVHFao1HStvb1l4VXfd2/1oAxPrdjuVt9P/mTYLz0/mNL5YsRe1ZlP1JCjYxF7dp6am20xotw9s7Oh9f+41sAhNIsPuwbO7JfX1X85W+VNGJBrHqi7jcZv9HesZ48NCGaDX+pZi2m13qJpP/zVbBcr/w4I+MtUtWYXfYgJq3jK1xDkpIyaYoBltGGHA+Ng+byBjRU/iOh2Gg42iZsurwDGs5KHgy8+lSYT6ci+q4bKhBpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTQu7kPXpPMWml4e4OryBd6sY/buvdESayQagreKzDQ=;
 b=KSfoRxGzW76Nnz1eEDubIPlQMBHG3/hQEFJsDrnxuStVRbZI5E1O+hItGxLDWF3nhzAdFEyTZnqo1G+hTR0enLi8UqaJ+GW33uFQdYydv5pTrZonJ2ODOvw/uc9wunmxgxnorkL65KHTtAAb/Nib3Iq0DRyNdHxtmht6DSxus/7gaPyreOYVGoWf8lF37fB1+RbYhU6VqeEeuiQeZtyNLHOfXgAsce8Vcz40Xw3THjzGyhwp/ZbcG6v6d4BdbGxWKhNLeidMHREqDhKTyRlOTL+JKxnEIz8P5ujSiz3mv1EmpdeMKXZZyq4vfiw5GpsYhY0lh6zFivPxreXbFSaA3A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2606.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:44:46 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:44:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] librepo: upgrade 1.21.2 -> 1.21.3
Date: Fri, 30 Oct 2026 11:44:33 +0100
Message-ID: <20261030104439.18901-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
References: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::25) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: dcebe48e-9945-4fe4-db88-08df3672d09d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|261009223027099003|261026140227099003|261026130827099003|261026135527099003|261028144727099003|261026121527099003|261022115727099003|261021121427099003|261021133027099003|261022105027099003|261022075727099003|261021123027099003|261021130227099003|261022113327099003|261021135927099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: g0Le1/mUOBD8el059OIj4xU6xUv6g5Xio09qcF79OOu1ME+FUNS8vLSbC+q7sCzJurvOlT2xZ6Mq5WKkyYSC1gEo3MQFtMS4giLAl4JfMDcjKUylBAXifkPeJF5Qq/SEZ2ajbBUCriFI8UhR8EQIv9Z94QDP+qfwLpu5F5C8clCPhXx/5TA8bNgqUHJFUMT11l8JZFUupWTCMHPzWGm+tTF/yOH94yCKPobSqfsS+3ijw9ikvNLhFM3Mdf5ZPo/nHFHysBB54p/CIEQqrS3RDPcZUUw5zcQaFyNYuQ2OBRii3gwuXvFDUhkopJqQ4him04YrfA7sSdEyueoHf3Cw+U1Pe1RoDzZ46wA3g1MhzVeBmpd4KVerlwB0OC6M1KfFySBGx2RoM1gSrXjUc1gIyC56nFmBxjksoTXUkrNVLrt1oT5c1JDzVT1N+8iMjgziGBklGWUr8EJi8bbc6/9RA19Vl6O3Tcfupt0h4ZxygeVrZPHoL1sEmDTMap5RDN1JedHYaff5JwA6MNhNT12gelELheEdiIyfj3l4nKHqOY+V88Pk/PPSjzH+l/7XwtfQg3Rpe5MVkWVJ3A7c++fSWW8cYgTUyu9K9T0n+3XE059nFsW1/zHB0iEAI5XPJtTicOtv/1zOx1nce84xQQZT/w2t3wSPpXsZnvU5i63WCdQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261026130827099003)(261026135527099003)(261028144727099003)(261026121527099003)(261022115727099003)(261021121427099003)(261021133027099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021130227099003)(261022113327099003)(261021135927099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nWM4y4gseEcmzvrcIoQKbzR7ZXXcfYKi/X/d2sVUNyLj1IOJIm61cYkWPSg8?=
 =?us-ascii?Q?ipFmPQKiif/Ou4dSwLH3Vp3pv+kJtO5XcD3HmtAbYLO5Xe7k0uNhxW0iSQrv?=
 =?us-ascii?Q?JIiQ1rBL+8C1sKME5P5lyrWmCvkFRYC8uj1XYo8Uw/XepxcxbVAThNCe23Vj?=
 =?us-ascii?Q?iEofeAapZo//KvFV4qvlDpPSGIpts5ru+YPc8pOqq+4Hi8gp+27fwMbaOCmI?=
 =?us-ascii?Q?HPzeWrXV7LfQZ0dVb4C4L+OgMgWJm0DAUstSh+stR3jaoEWOciuH5aY51AXq?=
 =?us-ascii?Q?MEza7HKNQg6fJAjudkTq8KJx9movteaEShvTifPY9Lznmh8xTEl9pc5y9yGl?=
 =?us-ascii?Q?q1pmLen53jkrIdW5dQ31g8SgcuawdDtpee7peztamzld7KCq/67UDX2A2bTH?=
 =?us-ascii?Q?Hbr3ChY9urI7G1QdQ3P/wfmZC/pSsh94KLbPGhnIs+/TECeNooZJ+wcF5t1t?=
 =?us-ascii?Q?4hE+eMEwfA3oSXiyNbLcQiC1n9lXr9o3GlFQjasEuc0Prs99J9OzFGzEaXKd?=
 =?us-ascii?Q?HGzJD/bnI3IDhErMx1B/hS9xSRHl4lrRdfATPRCq0X3q9ZSxo3Uqrnx5CUo2?=
 =?us-ascii?Q?0FCiEkwsuRclB/J4TlCATwGGh/mLc0Cx0oOfFcpRExTO68MxzpbaaO0ceMtd?=
 =?us-ascii?Q?tTvuoHi7+m/D0CnT5Fg721jjixfWNfqpzL0ZSgkX8BzjtziZJ39r0Qx0QIMZ?=
 =?us-ascii?Q?hSu74dddWKjTydv5bJi4fSyqLWVr8NTmDvKsU+vBRWAiX9w5N6a5Go/MnwYW?=
 =?us-ascii?Q?bis2G361hCwUUfIDUHcDNm0OCFDLvYxDhhevq6CCwpCjlMMKX1TvLrKAVa6v?=
 =?us-ascii?Q?+2t4RnBdHaapCaE1Wb9BuoWngCJhT3rqr29mwzm8yIJtHKQ7xA1/rDuIltZu?=
 =?us-ascii?Q?AgBvSbXRvrl9btkExKtqDToyF8E4gtEvU78fJlJjmy4QFx8JdZF/hATgP483?=
 =?us-ascii?Q?Nf4S5uAezeMey8JmsXd9WKiQzk6gUGVGEhY3VUJ8AqrSCPRTU/LoDYHMUd3Y?=
 =?us-ascii?Q?sK8EDHqqNVnReSfPsMY9fgFLvgU/eeloXrk/brlVAHbd/GMPa6Q9Q8vK3QyF?=
 =?us-ascii?Q?lk+w5bHz4n2nz/jpYV+2+N7rX0DR2hft3hIExb1p7Yu14QU7AQf4DiEtjsfy?=
 =?us-ascii?Q?Vd/RQOFSB7Nd985iMu1763dq11RoXponOUh1qk/N9PMoGQ466htvKaIgBp2i?=
 =?us-ascii?Q?yrkmrbZWGyhiuZyecsutAIbOdFwk0g+r0r5dEdbruEyV6BspED++TAP/Icoi?=
 =?us-ascii?Q?u9s2E7Cs5c4yUOMejAjVVGGFL7RDq3ZN+iHE9CI9xCpNR5qeVu9yWYgns3DX?=
 =?us-ascii?Q?kUmuSDodV+DvGoQB7otoZ5ZXPPeBTE3kpkJMC+XPcQJzwVIo1yR5B2TrDupG?=
 =?us-ascii?Q?Sa9fYZdnKSJaxE8Bmndgo+arwyJ2TIHHek/Te30H46tNi5yxCYRIMHHGnTGG?=
 =?us-ascii?Q?vfA5n16IZ0CBGP/OruGplMFX7X/UlervwVetB+ycHYx486zMQsul4tc3aC5T?=
 =?us-ascii?Q?TI4KQmmXApl2/h3BIRCx4iPp0khh0jUtlNjFbZRRmKZnBm+6ZjFBKIeMxBan?=
 =?us-ascii?Q?0koew8WPsB/GCDtW35ygOfZYGBwp9tJNWFfGbqwgi2BxERaD02IfM6v4Gx0H?=
 =?us-ascii?Q?vzXkocAZS5UoE/mjP0ZT7cLGC52+Ovbu8k6mzb8/3wGfy3C/oBjiZKhcbR7s?=
 =?us-ascii?Q?DcE4++Uqc4yWpCNdT41KS0+SnyfV4+gtDJam1DtMDRgZC0q5zYWgXkyZ0jN3?=
 =?us-ascii?Q?EOjc1tFryA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dcebe48e-9945-4fe4-db88-08df3672d09d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:44:46.5247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62yZ9XQeG8r/iULqAOnQC/0dYGUeZfqkVD6Nb6qu3efs7iOHaoWe/Gfo30v6H3ly/YsOaklp+VZx+EUeFkVjWpU/BGg5w/0MJMDFUHxHYOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249020
Content-Type: text/plain; charset="utf-8"

spec: Remove unsed build dependency on python3-sphinx
Group metalink exclusion fields with related handle state
Make metalink exclusion patterns case-insensitive by default
Add support for excluding domains and locations in metalink parsing
yum: Fix memory leaks in lr_yum_download_repos() and lr_yum_download_repo()
python tests: add missing shebang to run_unittests.sh.in
Update COPYING to current FSF wording
Update FSF's address in LGPL-2.1 headers
python: Fix reference leaks of list items
Add LR_PACKAGEDOWNLOAD_TRANSIENT to skip persisting checksum cache

License-Update: Update FSF's address in LGPL-2.1 headers

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch | 2 +-
 .../librepo/{librepo_1.21.2.bb =3D> librepo_1.21.3.bb}          | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.21.2.bb =3D> librepo_1.21.=
3.bb} (87%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtai=
n-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/lib=
repo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index 30802fd4f28..c7d23732ab0 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHO=
N_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHO=
N_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From e15c8ab0aab4eda7754e186c63b5ee0feb13f886 Mon Sep 17 00:00:00 2001
+From a6282ddaf4a7143866ef500db3bb334b599fa300 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python=
.
diff --git a/meta/recipes-devtools/librepo/librepo_1.21.2.bb b/meta/recipes=
-devtools/librepo/librepo_1.21.3.bb
similarity index 87%
rename from meta/recipes-devtools/librepo/librepo_1.21.2.bb
rename to meta/recipes-devtools/librepo/librepo_1.21.3.bb
index ab60e76b6e1..2d9b1db16b6 100644
--- a/meta/recipes-devtools/librepo/librepo_1.21.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.21.3.bb
@@ -3,13 +3,13 @@ SUMMARY =3D "A library providing C and Python (libcURL li=
ke) API \
 HOMEPAGE =3D "https://github.com/rpm-software-management/librepo"
 DESCRIPTION =3D "${SUMMARY}"
 LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4bf661c1e3793e55c8d1051bc5e0ae2=
1"
=20
 SRC_URI =3D "git://github.com/rpm-software-management/librepo.git;branch=
=3Dmaster;protocol=3Dhttps;tag=3D${PV} \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-=
p.patch \
            "
=20
-SRCREV =3D "f892f216a8f7934f32846712f56a27f997b300a3"
+SRCREV =3D "d665398754be6fe270d0a70c3db2ea5c3b917e68"
=20
 DEPENDS =3D "curl glib-2.0 openssl attr gpgme libxml2"
=20
