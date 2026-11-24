Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24294.1795540699948741764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Lrz2StkL;
 spf=pass (domain: est.tech, ip: 40.107.162.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPDrheIZmH5bZY0Uc0Pp23lr+pVXXI/PcctefQNGVIEd5cn1NNtWaIE/DEa/oVGBEI9XJGwWlLO2uj8eg0lol/r7XbwJgvdD4DbDNq6Ayx4jwkGpBy7bIcNiNZ51w4TxtAqFTZqWsK4J7p4e6Myh6e1qd6BXTBvx4WW/Gn7zvsT4pzo6AR2QY1vNMgt4JvNWl5aLSXX4k+9dyokMfGYWrXmC/v1FYfolx45Q/mnyPEYw4J9fbRVJ0iBWOmlJf7yJZ2BA3l/cqUaWGpnPR9hALJ4kvqSgAL4HZyzTmLAJRDFAPyCnYFZf+qreQGurPfBNdn90+DGT+CnGroSPVfLl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFgdiW31f9tunx3MxTVbs0EQUVW1kBbMVjtT29DHQ4Y=;
 b=D8GgLGl347Ad8rF6S0FJSX1qgVS+/5amMJeJX2D3aphL+FvmSAbXcXbf0BU1GiW6pQ5lrHOL8px2EG2/w2xIwwM7YG9R4VkMWdTp1w6suLcFDOeALx8wP9mEhUv1CPmAlK3p1DZd0ZMS23JG5w3jurDJ94bJ45CRK5v3X9OtqNI9BERDCqlchKPQJO0kniZw4XSKF49JApdqrM3HCvIdeeFro2MDAV47tZ/iakdXv+8MNWrf/4u1se0Rv8g7V308gN+JXipAMCKkrkw/Dwo90IAw2/I7J/SLVzNSWXi1yYOuL5JDb8cX+AmuKCZ3dxEN8bygMG6yhWR+Ghobnj/qSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFgdiW31f9tunx3MxTVbs0EQUVW1kBbMVjtT29DHQ4Y=;
 b=Lrz2StkL9i0JiCiPyNsbSeUMK8F8mO+WU66T+MKL8u6bb21CmT9VfVivxpX20PBneY4JlbUXHlBjyuZDv4nwF/cmRpxHdsz9bmycfmQu3pvZBwMfsyuwc7fxDOfcmwhvLwiCyes20lp/3+jPYWIASxEn9BcVIGofzPISOKGDCY1QDuB9VNke2sU8N5ec9I/fld+VIrITULXgX/1y6e8lE2oiESgT/lMQwG4re3U1FRJbfWs4jgl9AsK5Z5l7EjZ4XCmRLPl17/5/4JPRsfIeHSQkvT30ZsapBfJ3hJoiJkxrzipIs1bmRxUknksmVmAUKi6P0IUm1l1+pCWEmMzexQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3668.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:18:16 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:18:16 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/11] btrfs-tools: upgrade 7.1 -> 7.3
Date: Tue, 24 Nov 2026 18:18:00 +0100
Message-ID: <20261124171807.74394-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0016.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3668:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb27ce3-67cb-43a6-eb33-08df4a4eedba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|3023799007|56012099006|260925022911599003|11063799006|260925021911599003|260925021311599003|261009223027099003|261102123227099003|261026140227099003|261021123027099003|261022075727099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: b8Elb5/TpmvilNXfofU4oNVkxMsqXw33gs6VDBaY4KqTIXpHJ2ihnkUEMdCQMzBhld7sdNfX6zhZnkbOJ5n+iceyNMnEFraBvnBmGQW8f8EnuUMQPBPun1Vn++gaHKvfpTixWufrfF+EDIfG8jUrZ4z4me95GuQOBDvVt0PiqlVYhhkkXX+zFmkS746lfnBxXf40ji/ElEu/UmY17YDiyVJGMlyaCw3fZH8dQbPRi8Aj1q79KZ4GK+0fIxW7nJRNxLpfNusXOBXMu4ATKAZsrG9NuEf/4trK32bpcKcN0h6jwCAo4pJ21B9M75jHhb5qBC9PpjQ/bVK6cAoQt1p6ROtKVZZ4dzs3X4m3IBf3JCf7npSlili/sjeTL4Ct5Ysds0GV5GwGoFqfvbTD0hdFT/KopnhIK0m4ztpRdXEX2gHHB0azLWpFnXYiQ0HkdJj5xE3Q4dBrW5lpf389wSq7mgD6xY6mILSria1ft7MeyL305ZQU9uGcAfDBcxOESUQjjjRZ/DsQyRl93S7U2n9z0fzicMKKX//4Ye/Kc7xX1bPvcmXWKoAvZu4rskorg1mbyruyfe4aQSbiFrs4GngM5lq5nB8M6tCwbamu2K7C1hs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(260925022911599003)(11063799006)(260925021911599003)(260925021311599003)(261009223027099003)(261102123227099003)(261026140227099003)(261021123027099003)(261022075727099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q7oSF34mhrsCOgbrQUbstuEk3xbWv4EPUtgq6yhwTbcS8e5PLJVfq4Vhobkx?=
 =?us-ascii?Q?Ka1CSMVeWkShh4blZT9862Vq3r6WLXA83nadIpfi2zpvgw7/WyWZKSKoFoJ5?=
 =?us-ascii?Q?6ynY/Ii1eeZjyspr/rPdbLD0rzp25E0g/lz/BZdgOrq2cIk9Uw7ehza7bTuf?=
 =?us-ascii?Q?3F81u8ri3rE6j663xHjDa9ye+0P/jZwElExIlfqQF6aV/pwXsNwYSnIutP+T?=
 =?us-ascii?Q?JVOchKnpWr00iBmg2fgZxvnVoscNzSp8uMF6C40giEbCPTL0dUQUNNBqgYD1?=
 =?us-ascii?Q?49ng5IlG4A9yw+Hs7sGNEozY5fkWs4nFTehGjbikHkmmGTTpluPPIy4BgWay?=
 =?us-ascii?Q?Lk4rpePH0y3b1CfixK4iTAXIHOwppR+oyqG8XLgl2ArwPUZEJCQ2MoD2xZyk?=
 =?us-ascii?Q?aVEUQ5pntRSfc2JNDIxMrfyQ89rWxllij+QZSobB/poq66zkvneic8TloiUb?=
 =?us-ascii?Q?lI+aubZ7+wVYEZ7fCrwFwXauXH4zJqUC4QXzQRtf/KRZZHKQsLfNKVAwVgIH?=
 =?us-ascii?Q?3koNi34sMqwojpI6FHHWFaqEmTk143JE7eP06pb2abxn2HiILnj642wmGDAN?=
 =?us-ascii?Q?BiHo9LVKSnTF/2epF3pyUU0czuMpezkqVQu7mK2BWpCM3DOmcu3Aaluxhuu5?=
 =?us-ascii?Q?s0sK27LQ6esz7geniTIwS4bZ9XwsBzfaYIlPRtCMs54HWwBALJyo2ghl6MEd?=
 =?us-ascii?Q?A19Q8+KJnvzedOeaneVVd33UtW2mS8SMzxiORdqqwipG6BFa8NqzK4rolsMy?=
 =?us-ascii?Q?EGrjXCWMQOa7bMwMAyHOedHxEwbB2yvSnhWl5AfQsmTQjD+O/ceIKGCRP7bJ?=
 =?us-ascii?Q?vfE/ZNb8PflSRvkQr9J6v9Q95einzfqJyUSliRZHsWh4peaepTrDqSQ0R1I5?=
 =?us-ascii?Q?k/Eg2URYPuGdyLohlNgURh3tZ5gQNRoE/otd+lnfUgMAkJJCmKYs82JwiFdZ?=
 =?us-ascii?Q?xjdmKRWjjodpY+lbwmCjgiK3c//X6xnYcwlMq2B8kQp6V3Pjg5Q2L30QkwnS?=
 =?us-ascii?Q?37enYePiGvYv1oRqf/0PMeCNyj2tRMg8eQ7TxHOchEnVEklfYj3wso4j7t8M?=
 =?us-ascii?Q?F0UaH5zkxFOdCuKL/JLlNrlkOdye1GDYfq3VMLZXur4TnD9yOIAE8O6efMVs?=
 =?us-ascii?Q?ghuStqBu16tvZRR9LEIEFgwHnWPCMD1V/8+Zyadj3OwmiOAtsxFOgwr52Msi?=
 =?us-ascii?Q?vRLk41plYp6qSoc4VgsKtCgzRHWrVvaBsVORHxoGDVqS050XD5iRXmguwwAm?=
 =?us-ascii?Q?fEvBVZQ7HNIRtVey5IlMUOwGMm8JC8k3lVFY8yGuyDH/CrWWRaRDwFKogS7n?=
 =?us-ascii?Q?BKh+bRTL5Dc0Rb1Qc1t88K+LYgZhuLv1tFknJqs8wBrujiyM6MAIwuwptHpc?=
 =?us-ascii?Q?2rMV0/mGOjoJPnhV+cxNCMJ67ylUnZGOkbeIF7VIuO4pNf/DadDz7o3X8U3q?=
 =?us-ascii?Q?a2qnsQPTeE1lttIE3CPqMBo0TphzdGaHlu9GCSAeiKSa056fAyBoOUfm3JFl?=
 =?us-ascii?Q?rvLVGVfvArA1wbSUfAT22jOjYm5zARg1D98uMuRX8LfE5Ifna0tascVKMZJO?=
 =?us-ascii?Q?2WUfTbE50AqosA3YQpsLkXwQNYbcpBdq0RUgdhPGiT4Q8nowtcyxZ5DvN6Ps?=
 =?us-ascii?Q?4bXhdvTaEdrrIYnDs8s3pOuO5RL4sTv1T4t8S65qXb4snXDRE2dLWYiko4+d?=
 =?us-ascii?Q?lbIw/FB6jPnVFXE/cimj790Vvs7V2kU6q6stPmdwXmt8O1wOr1J6FJkrlukI?=
 =?us-ascii?Q?kuNw09/uog=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb27ce3-67cb-43a6-eb33-08df4a4eedba
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:18:16.7932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhJe5bau9PurKLkHBi4aGHjEmSG2bCqYHYG9EXVWI8Q57QLPwuaM2c1y3RGN+dsjDEhBqgGGLGckTd/fVfcOOkXMFma4R0rM4AiVPUQ16I0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251056
Content-Type: text/plain; charset="utf-8"

ReleaseInfo: https://btrfs.readthedocs.io/en/latest/CHANGES.html#btrfs-prog=
s-7-3-2026-10-23

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../btrfs-tools/{btrfs-tools_7.1.bb =3D> btrfs-tools_7.3.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_7.1.bb =3D> btrfs-to=
ols_7.3.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possi=
bility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btr=
fs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules=
-ar.patch
index 7272c27c6c..d0f6cc0d33 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-=
to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-=
to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 7edcee57078769b7752275e0e5f35aefbfefc9eb Mon Sep 17 00:00:00 2001
+From 1d3a33b2944293190c4fd5d69f5fa4ca6ecea15c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Makefile b/Makefile
-index 96c11830..3f2585cb 100644
+index 78c23ad3..e912474a 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -997,7 +997,7 @@ endif
+@@ -994,7 +994,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb b/meta/re=
cipes-devtools/btrfs-tools/btrfs-tools_7.3.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb
index 1bc75a7de7..647b1bfa1f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb
@@ -17,7 +17,7 @@ DEPENDS =3D "util-linux zlib"
 SRC_URI =3D "git://github.com/kdave/btrfs-progs.git;branch=3Dmaster;protoc=
ol=3Dhttps;tag=3Dv${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-a=
r.patch \
            "
-SRCREV =3D "4ab0e80be9e3bb1db2e6038e6d4316d35fb7ba8b"
+SRCREV =3D "afdc3a65e33f4d42f768ad50dca20c32e5ee1496"
=20
 PACKAGECONFIG ??=3D " \
     programs \
