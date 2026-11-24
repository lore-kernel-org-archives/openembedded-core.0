Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24299.1795540703718479399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SIdM4jVe;
 spf=pass (domain: est.tech, ip: 52.101.72.63, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1LT05tvaerJqUJT17h+Pd+QW64N8ohd3gaFxIeNKzYtUji4BhOT6dExdajv8L006rn0ABE6+929toN/Kq8ZkLaseusHvdWJKc7IvrELAkoVtjQdtXo/2R93kpXNpt36IVyCJ1ofHyt9RYjkHgtOGy+Vjsjm40YSYaMe2+eqCbdiXFmAKzagh9T4JLJg2kRfhwhmxLJHHvJ2DKSRR+g07HpSJ222ywODAP3nEneoOKXKDMxaiCJPG3gkQwhlGH1VHDbYNLEl7x4ZKLwP82cLpaJ0zRGtYVtwbKpvppzx3mN3+srLLCmNHp3seZ0pOCrYGLRgblhDTUyvd204FcXNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfI9iPC0fLNr2q87GryOVIfNbgKxfzw89XQh7TfaHgo=;
 b=HjSIm2Jsrkncb8JxCPgTxudtCtUPuiFv7jK18ry3vd+Ss9aqDjGlLwlJc48P7zcsWb0ssoYmq7+Zp70x6Hzs8ZERkCiHSWr1dJRLpE+4/drlb54jHOsT0OPOnU4yvhGBgTGfbihRI56DMeWag8Bmjvj06DVdxkrtKrHDmR14nsYJr1hLPMlNToTH9cav5KfxzDWdcVZQn3bnCNrPcJtAobWI41L7D73/4fFsww/vkJ79nLE/pyYFjqSebkpfBi4EH4u2W5hYLso5MmjWRgMOlwEyICm0pnE9SwH9Q/wd2C/qM6KWFxmoBIQbnPUTqcdtJUpi1YN3nMBFPgTbUtb41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfI9iPC0fLNr2q87GryOVIfNbgKxfzw89XQh7TfaHgo=;
 b=SIdM4jVeFvtZNKTHICDE5NUlEauRnIbTrKAU3nY8lBAjITQY/cZAHbykV5PJRHVakmaaEQOluBsY3Fsbqangtj3VhUR/3HZKg1QFqTcyHfzioiW6+xEhV4pVimX+OrAuM7eYA9fOvppn240Cktwml/wCMW/0s8DsCngYRtPX1XQDFlr6qnmBF8Uo4gT0PmdZk17G9vUce//hh6O5JyECGYO9f5/wlSBKcrlxAqmhi7TsxNGRQy1GsYeIhKMw1bBoofS4MXLFB03slgr7srWfnYHd2OwSIxYIDCPX4g64E0rlKuFY5JEmJiKXVIDmZsGUXL65pfX+fKfbCVRtM9lsrQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3668.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:18:23 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:18:23 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/11] blueprint-compiler: upgrade 0.20.4 -> 0.22.2
Date: Tue, 24 Nov 2026 18:18:04 +0100
Message-ID: <20261124171807.74394-9-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0029.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3668:EE_
X-MS-Office365-Filtering-Correlation-Id: ab26fb38-49b9-4eeb-4191-08df4a4ef174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|3023799007|56012099006|11063799006|261009223027099003|261102123227099003|261026140227099003|261021123027099003|261026121527099003|261022105027099003|261009221227099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: YIw0kzhoPrJF8whwopm6CUxEpq21EXe43Bfvh8e9d/L/h/mXl66sVs4+VXIHIBi1YK1ovFLMGeZuEv12bVdxEP7SSq2FjAmgjPJIIHTVKk8cm38s6FDGufCzr7O/8CY3uLqhqIUeaFjpSR6PlPIm2B/c9guGLBdmUENPtergldIsrwrxti1WqqC+AZwaMnaNL6tipWnxQjG8hRl7MHEYIkNAiNh7vQC/IAuNMqLzFvwapVCphtDElrr8LVAsjwS4hXVZ45Q7sdFPuSIGNnPC/aSF4ormdUl7MxQe49rJpV2fDcGx/wRbdMJLIedutzLsYKYKS/6YVObkN7WK+IusA7UTFh6eeb8QlnzfZTAsH3XYt2b4/MBFXlrPz9vMncpr4NokHc9fUVAejUouUNDHR3jZIoCbpvQiCxfzLsPYASsz6hr8cMmxASSFYje0dGgnEtrpz/OlMYLbeVVULrSDT1P5bGclL3/zGt4TZ4djSv+dgIgCN1vUBnj6YNtFBoiL9QPtxA+CYgSDlQgZCJU3ZDVXmzPGsYZnv5LCIHmd0Vjcw/QYfJj1z1qPqmqSwtZViqeT3qfW3RZCliAQDWbYK0g87iVf0UVYNAArVgr3Mzb6Cy5xh3edG3oWB3LC4rEs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261009223027099003)(261102123227099003)(261026140227099003)(261021123027099003)(261026121527099003)(261022105027099003)(261009221227099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LcOBQDmos5AQw6z1wC23t9vItFl/ZpLZZkrr6xgR6AANGQsu61yGr3ybKLFr?=
 =?us-ascii?Q?vcGKcGHkpw2K47PrmMr/T9Zljxmh6VYxI18mZFVRGEnO1OJ5+KjEBCmGn+ef?=
 =?us-ascii?Q?TpTkCexVhBFIBXrz4gxiqEbgOE8GUUJVGOzqPqb3hM/4Csz9k29pd555yiFI?=
 =?us-ascii?Q?sDCujjYRQDOS1zz4xPhgvK8KlLTlkJCn/1paOsmHASmnmGslosB47XP53CKd?=
 =?us-ascii?Q?drBEH2rcaW1ldIp1ILaBYTIi9lAU58Aiya5Mx/1KDHrx2hWk8RpndqbbtBLo?=
 =?us-ascii?Q?LwTcA7hd88B1pAycmwi/4vYstGQ/QFPhEt14JCWeNjarZOTUOSDLRTk2KcRb?=
 =?us-ascii?Q?0ytjhfYCcbdziyur6jYenKFgZ8ZnElxgRi4b7cg4SoD6Ho+l5CREsIy+a17q?=
 =?us-ascii?Q?I8ImVDV7JY0XSlp/Ot0MPD3J5hQCyWTTlxc2ghUnzpKlfvts5/+WJJv7wcwb?=
 =?us-ascii?Q?90YJPWQ2nzZiRvHNK7Xt1t7qHo6HgPFrfjsUzTXA0WCeVoIbpynjwYLbOPNd?=
 =?us-ascii?Q?P+tlCTMsqNZHGU+BsIBs7/XaaPsgcxqcnX24cL9xHzRIhZ1sHobV8obTErid?=
 =?us-ascii?Q?pCXfiFWV8U7cypW5EPsWTv8Newpnx4RfoS5YUHnEIKwTbeZnhJhxYIsRsIAJ?=
 =?us-ascii?Q?ogg/d5XyUSeYeWbMJTOTjQMol4b5rl/GYMQ+vE0sviAahVmaBxJpyHIaYEn3?=
 =?us-ascii?Q?39Hb2Az123G1KFP1vIOM9TlcLqd1RLyejvn8IOuhdbsM87c3zy3YC6ewvYVD?=
 =?us-ascii?Q?GAADNXPjguW1C+j5pq/cyknwHZgyV6W2k4MrqVTH3YWccCHyDc305S23NBp3?=
 =?us-ascii?Q?S/xzniLirTTIlynAxN7BsyzDV8iukeNU2agXH5aF75zITdlDqI1/n04kyLaW?=
 =?us-ascii?Q?JHBeICGP3iAYW7Wa00fti5X9kmHYFfR+3URs7CPup+D7+tPe/y3tUWVTXjKE?=
 =?us-ascii?Q?UyN1+8shX1ow6DtwcS7pPClGVvcasr0MOPML0MrWKftVKtZMuqVDA2JZ/p8U?=
 =?us-ascii?Q?hNIs+HMFKDuLM6oJ7Leq6E4LOeO9VWbFfTpBMD/Jx1dsKrKkGYv2rv/1jqRg?=
 =?us-ascii?Q?lgo8Z6rueucbvpyjE4X/ubN2kWsRH9EGW7DNWIYqkeGVUtDXxL5x1kczmM8U?=
 =?us-ascii?Q?dyiLMP0Zm0XymLXIzf4GZDr9n8JlhOuDMBFaGVhu0jMIyE+SrMwkJELiQiFU?=
 =?us-ascii?Q?hB1gcR2Vh5j/KP8mHMDQoLA6xZEp5tb/GQSqJJTfofTO6EcxUkYZGi9jNQGu?=
 =?us-ascii?Q?GM9cxkzLz0KIVNYEfCPHcKsvbcmzSf29l/AGRr/hc/Le/t7RJMiGWQQPIXyj?=
 =?us-ascii?Q?79GK+L0prRaJOHmlXMLIuKN2O4GgYynn6pq6do77LLEFMiJzp3S8einvQLYX?=
 =?us-ascii?Q?MNK5fgjTlT2W3VI/9xTQdpHPLaVocWm1FA8R9iSZ0DauNw5dqy7VSoEoi4tW?=
 =?us-ascii?Q?emc0kphY/8kCLntzq2+cU4AUB53ndPscvSVeGxhSqKN0l63PkJN4XYro+ueC?=
 =?us-ascii?Q?LqD5nbRLiYMWsORTIfcLhLYc1CSXhXSUchjw9Zdn8fIMCYDW9ueJItvVBrut?=
 =?us-ascii?Q?w2nvCIScBqzAz8KpuT2RjstYjAC8jPe75qRZ5eSWXAMNDsHRxo5JnC8rmDss?=
 =?us-ascii?Q?w34d+YKIlp9ge32Pk7DPL/KRfrisyQxgsozWfjpwiogYTysTS5ADDyi3y7iX?=
 =?us-ascii?Q?Gc8KNO0ftTeYZR2oIOhJ9LPT39c0bsc5N+S9DLTJZCbNpD8+TUeoqFMFV0cO?=
 =?us-ascii?Q?omav7RIxKw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ab26fb38-49b9-4eeb-4191-08df4a4ef174
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:18:23.0442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3EyR6TbFTK9BIgACGLBIUS/ldsE22uUSTEdmY8Tm/9DwJITUqZxX2u5BjSt7RW+mpOzV0hM/hcdy4IyKJjxP1JmNOKscp+eDcyuJl/tpa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251060
Content-Type: text/plain; charset="utf-8"

Compare Log: https://gitlab.gnome.org/GNOME/blueprint-compiler/-/compare/v0=
.20.4...v0.22.2

- The release commit is only on the tag, so use nobranch=3D1.
- Meson embeds the build Python path in the shebang, causing buildpaths and=
 file-rdeps QA failures.
  Rewrite it to #!/usr/bin/env python3.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...t-compiler_0.20.4.bb =3D> blueprint-compiler_0.22.2.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/blueprint-compiler/{blueprint-compiler_0.20.4.bb=
 =3D> blueprint-compiler_0.22.2.bb} (75%)

diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.=
4.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.22.2.bb
similarity index 75%
rename from meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4=
.bb
rename to meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.22.2.b=
b
index 199a9b0f55..7b8204769d 100644
--- a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.22.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/blueprint-comp=
iler"
 LICENSE =3D "LGPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539ec061b899bce1d9ce940=
4"
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=3Dht=
tps;branch=3Dblueprint-0-20;tag=3Dv${PV}"
-SRCREV =3D "31b62c24a72c1670d2d93dcdf2d130f1ae12778e"
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv${PV}"
+SRCREV =3D "ed35ac74de0c1bb1f5e852410b97edd1f08904c9"
=20
 inherit meson pkgconfig python3-dir gobject-introspection-data
=20
@@ -15,6 +15,11 @@ python() {
         raise bb.parse.SkipRecipe("GI not available")
 }
=20
+do_install:append () {
+    # Meson encodes the full path of the build python in the shebang
+    sed -i -e '1s|^#!.*|#!${USRBINPATH}/env python3|' ${D}${bindir}/bluepr=
int-compiler
+}
+
 PACKAGES +=3D "${PN}-python"
=20
 FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
