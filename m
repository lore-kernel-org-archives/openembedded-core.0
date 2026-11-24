Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24291.1795540694721029803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=D6syD8i+;
 spf=pass (domain: est.tech, ip: 52.101.72.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpBs1Qq5GDtkfdSlYpbKBbJ1DEOvwiwb5o1mLXx1c2hu0lheh7HhCS0E1+hX6UOsUQOU5mBosnqrnpPIxdbfFpqHlc/N4IguQ2rl85z3d0geygTjativp0rkJFCl2ypflZkLYKWxCFUhM2mCFhluoez0gCzOvtI6YFvgueyD3pUl4zfi9VPr2X5i8+2Woh+ur5P/o/mnM0NWtylWWy/+x46AqLkG4d6Z4JtkRV7EStsjrUfmJ2FdLG8zSNkA+oX4GT2LIu8lXsSwobivLbm2oIC5nni50DfTXL75mQ3w+Q47fMPTn0xrNz9fh+mRSzpWIRtpX0x3emRhch2PYWD0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4PNSTMzwg4W3LrFbFFit9EjftbZVx5r6jFcsfPzOoI=;
 b=LSGF4cOOLEU/+ShpLACw8IK6qxDPILk3VD4jDohbszcRFdvyZn/pk9CWTTDEdQCtKBji96SrB8zJkmNb+fIarzksYVBlIyqxYDmc6s7uRQtd+YEiERLYX7yQh5eNsA/2OVJtc6j3glJyzRb/j6pjIKn3XnfeKXSxGvpdc9ekUmPM9fpJ6HJWUnidsYf3cVT7E6Kuq03WLwLgkifjynPw/1ry6yDTIBdESBBCCquyTLQcomjOLTd/0geCE9DUHjN8sGZTKuMMUKD4UrTeG9DuB+zsDTxEQfZwFNIcM7DRAYHwPUCsl+bezXN65g7bj5rPmzQ4mmASWV3fEz1oTqI1dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4PNSTMzwg4W3LrFbFFit9EjftbZVx5r6jFcsfPzOoI=;
 b=D6syD8i+IS35zi4VgOIZ22QOtko/zwU+zMEZLM/HXYF0ZGMHcUtQVKQtwEEjF7WrTcMCw9GPF01ljT4e4PHKhRmhXubcIGgspfikophRammHmoQeMgQDtMCmnZa0p/k1VNc+cmTPZLCP/PKaorbHcxp6sZaE+4mx/NFQgis/Ap8/cVmnVg5XvdiH3bqLPTaNqtGuml+1MH+P+/U9FErUNtBdTsvQpSmPh2BPa1MLXRoGPpfucAOHDFe/tBExk8/SK3kEPLUksp8I8eto8t/HYPq+LxgvhKmhDlTBXRFVTZ7B1qW8wz/naPYvyqwA7EtBqR5sz2rD7ELO0D5d42/EZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3668.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:18:13 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:18:13 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/11] libconfig: upgrade 1.8.2 -> 1.8.3
Date: Tue, 24 Nov 2026 18:17:58 +0100
Message-ID: <20261124171807.74394-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0169.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3668:EE_
X-MS-Office365-Filtering-Correlation-Id: 1489259b-cf8c-484a-48c1-08df4a4eeb97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|3023799007|56012099006|260925022911599003|11063799006|260925021911599003|260925021311599003|261009223027099003|261102123227099003|261026140227099003|261021123027099003|261022075727099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: aG+2c1QdCjx2w7WS4gvBaialcIpX/0YAhjeorZHP1RYiTegGh5LiFHqWPoZC9GeZ1230vIQ8YWECTvzmwoi+d19lXAz2wfFnoQ2cTqnWRXvb+3XMq4Ek87DLszX4Gw08m80C+O5+1MX5NhWGgoNwNtG4Og1J8Gh4pNpdVXYZ9eOzjVwP0D94y/G0I5NjBaLpeCKoFoHTDtsVrtCUU/cWE8Wg0Iu8TMWgGOOOy5aUSX4SKqO9Lynr1bWF/X3stD7ucVlnDPUFcygWymfE/eCUjOnatidk5QvU/lgY3c0QnO7egg9DJT5B25RaTxLnssVKboWmwDBEIYWgvXVHiW1lwoTU7aGy8xKPx5iBEChXc39M3K0nmYra57m+kJA256ovRKVvd9H9Hvo5FNBmOGL8fKAKwkQKMFIEbCFypHtkoM9gwy9obVuESGdGvgDL4YiV4x3bkg/pkrOEyBxjsO77yXjpMZY1CPsOEnnMn7e+KUcDyrfsjbb+qZBXRK417k8cp2VLLR2VIAV+JmKlnYtmozSTrRnCWd+eg6q3D3FGWZ3KLYICItTSrRvctv81I3uVbrmhAXf1FHsP9zlZ5sUoGSukzUTCWY0ulDKfcxpPtACCkJ5J9aoP/4SPsxnQgSy4tkkcgSojWespMrvDvkv2jwKXJsgb0XI4bd2jd9dLmmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(3023799007)(56012099006)(260925022911599003)(11063799006)(260925021911599003)(260925021311599003)(261009223027099003)(261102123227099003)(261026140227099003)(261021123027099003)(261022075727099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kfkKrx97CT2B2FdI6aN7iu+oIcw7dBM+bQtj+MJZAKJ3Q8ps9FO8ZjEKnU7P?=
 =?us-ascii?Q?S83LOf1nl8ipANvOtNpDb+yin9fjICftNSAG2P9IbaC8QWZ9lclcW5rP0cm5?=
 =?us-ascii?Q?WNxlRCkWZyo4AkI7qGT68MxYMDBdDwER4xcYlLaWyuOB/72MJOZk4ggfAkd/?=
 =?us-ascii?Q?W9uQZ8q7jVcM1p4ibXf0AOnhQIDqwHRdsYH0KR+9P5m9ZFP2LS8C4ko4/gsp?=
 =?us-ascii?Q?F6VVQGKIVNoWo3jh5Un1LazvLNl9QGTAGohGowrbh2WH5E570PrjCQ2soQUt?=
 =?us-ascii?Q?h7B0CjC47QOvnIAC1eJPDPyYEJCA+F5nsbXIGSBLYQ7UUNPjZ+2UKJFuslDP?=
 =?us-ascii?Q?QqjZC7a2uKXJNzfSWGumC4li3mGtWlIVHAQXZJMIfp1tz75pqYZmyKXndY/x?=
 =?us-ascii?Q?IAQmwbCkrL7CNXD3sjNNF216sBN01S1bTofVJv2ITAlw1XWGnIS2DroBYaV4?=
 =?us-ascii?Q?GpaOuZ6881cwogZaQ+LvCrblslcNkic7tNgJF9H4IH+wwnvPl4ZLxK/jS6s8?=
 =?us-ascii?Q?A6jBxQsrOpHgB8delrC1M1C1CNZGVFqorE/cC1m+l5bogVPRxi61gj4n+1EJ?=
 =?us-ascii?Q?k4RJ6CLCygCq7F8+CBcAy8OMd3na/yr8rqLitLj1RO9LlSijxizqWTGs3ETu?=
 =?us-ascii?Q?8gwgYJW0KGlIqu4EUwMpUdb0FhV6AS2tEm3oqF/RgcarIFMTTEeBmWmzZVCu?=
 =?us-ascii?Q?BdtGAKqoKHbZ3rj2+BthjBEZXPOitQw5yc51KbdLWa/ynk8V67LuGMISG5qX?=
 =?us-ascii?Q?OZKHfuQLEpmdt86Y+WiHDNitqU/4noc+UGhvD6oBFalboMeA1FAFuHI5Gyop?=
 =?us-ascii?Q?6azXR00tCaJrSbYXsMJXANYEZ2hHAGjXo5AkK2EBrqS4VraeNOW9EbwJT77j?=
 =?us-ascii?Q?pc0bmi2D0sBm4CFGHPRKN226JzEW5JNeIF8+oB89oOUG+xAcgUS1SxsXjaHx?=
 =?us-ascii?Q?loiae0a+TvOhwOiljE0kQm7VcGVJg4iirpSrZz+5Lt9bJUjmeE3lWNAbaIeZ?=
 =?us-ascii?Q?tnrU+XaZSLH2+9eVxWQATT26s3RC4x5/6Rhnw1YTPXkHqE3i3dg80e3TJLhJ?=
 =?us-ascii?Q?JlG8Eh/aoZNo/iY92kIiwNL29MGc+HCBF1Nb3i/RonssygfAIkGO+xhx9iEy?=
 =?us-ascii?Q?eyxRsUB+t+wMLiBAxBwNioVKoaRLJuf+JJrRoP8eTJmw8OkNFkUZ+JPFUkeq?=
 =?us-ascii?Q?RW/4+5RPuZDwc1CjsMUcA1P2MsCn0f2C37I//+n1kgnUaP3Uj4usnHkN2+gJ?=
 =?us-ascii?Q?8Ni/x+SMWjAyna6dOR/9FlGOF4NpEsgmkFmcX9DR+/xEdakwqdr7lXVelArR?=
 =?us-ascii?Q?e38OOUYfmwHzKhQOHayZoxMCu/QChAC5CHoCo6y5icsREMZRi5lIf0aF/Z2N?=
 =?us-ascii?Q?6tUHu1gydsMDZgcjglV1X5KuQGtr2ciL4wTpw8LImFM+GVORtmet0wvwsU9X?=
 =?us-ascii?Q?6bpLM6gIhVQEBKQ6rW+/btWxlqbiRX7Y6xztXS/9pxoczLAXghlpAMLPsOnO?=
 =?us-ascii?Q?6WzFzXK+FYTe8WeHMDsZWTdPj4d5NT1VAekpmfoYNlKFNim1njYJLXlyCeGR?=
 =?us-ascii?Q?L1Isil+0QQzmxE4B7Ku8JiLcJKlUZp2qcCcL4UJWSbkk72vH7CWX+dCRzDsK?=
 =?us-ascii?Q?Sx+3pGoMmt6aq/c8r467ReWZMWTZcMSSZ/fOgOTjAiBYKiwjIqP6ojOQMCm9?=
 =?us-ascii?Q?KXfJoHsw2/wUR3NhtnH+bQChTXYZFoVMTeDZVpd3NL/XgLblKwvgmaBuenha?=
 =?us-ascii?Q?fzCZs1fC9Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1489259b-cf8c-484a-48c1-08df4a4eeb97
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:18:13.2476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLlARy+z/Enu29iQ9mR2rrMcAw912GE0W4QYsLWABgO4J5ICdt2F5ZdoxUHDBKYMndDR1Wq1RiSZFySdLYLM/Y1hf4liKoRST+Xx2/s+NqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251054
Content-Type: text/plain; charset="utf-8"

Release Notes: https://github.com/hyperrealm/libconfig/releases/tag/v1.8.3

----- version 1.8.3 ------

	* Use checked size arithmetic for internal container growth
	* Preserve 32-bit width when writing negative binary integers
	* Preserve explicit 64-bit suffixes when parsing nondecimal integers
	* Preserve double precision when auto-converting integer assignments
	* Added missing files to distribution tarball
	* Handle memory allocation errors from strdup()
	* Improve handling of file read errors in the lexer
	* Various documentation updates
	* Various build file cleanups

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libconfig/{libconfig_1.8.2.bb =3D> libconfig_1.8.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libconfig/{libconfig_1.8.2.bb =3D> libconfig_=
1.8.3.bb} (95%)

diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb b/meta/reci=
pes-extended/libconfig/libconfig_1.8.3.bb
similarity index 95%
rename from meta/recipes-extended/libconfig/libconfig_1.8.2.bb
rename to meta/recipes-extended/libconfig/libconfig_1.8.3.bb
index c3582828f7..e6086dee1f 100644
--- a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
+++ b/meta/recipes-extended/libconfig/libconfig_1.8.3.bb
@@ -11,7 +11,7 @@ SRC_URI =3D " \
     git://github.com/hyperrealm/libconfig.git;protocol=3Dhttps;branch=3Dma=
ster;tag=3Dv${PV} \
     file://run-ptest \
 "
-SRCREV =3D "a42cb47c1526a4f2ed025fcbb2289863375bc898"
+SRCREV =3D "a211339ea575bb1253e3e24eee47089249f6bda1"
=20
 # needed when we modify grammar.y with patches
 DEPENDS +=3D "bison-native flex-native"
