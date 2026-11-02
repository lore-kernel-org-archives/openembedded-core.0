Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9754.1793615270477773929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 02:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jS7Qom3V;
 spf=pass (domain: est.tech, ip: 52.101.66.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3vctqYiB/LkIPcdrb3pFNAm4YON/7ZaiAlPJEM8HpoFKXhFRREmx6BRGfgc21XCI46bzQkH4RFvj5rwAc6jwtW4jTwMxve4mzql9OQggFF9n/XO9G06b2SVPbW3e5wnOFYEt5PskV+bzZkYnBWOjwi4i0NYcbroA/pinwEgQLAWSsay5nEPuRd4RlHL9htcguzv5Av3SI3x1KYABn1YzdrHv4mdFrDuQKcm+VzEMkIE7gIuKSTwj0VbmKmnB/NOurCFaxqa0+4PAyFvdRMS2S2TZmEyr3WJyxR+QPztWywWW9fIvahFzSGbsFmSfquwhGAW7XRKS+IfnmsnMubSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mndB/McD4xycmpYvWOhs7zI/goJ7L3ZqOWFRDShUz40=;
 b=uOaqZg5aT7oMwdMqzrc5bZ+u4A1O/YGt22+xT4Sy8WYsAW3AAI+RSR9RFGGD1lunxqICqj5wfol9WKZPSUJYIj4S0Eiq39HH8E+uUDiaRXwuakorpkSveSze4IuZulJz7KBzOgdmQMy11nyERDIC+cM1OAjSItSZyT2CvOA/5JQUJpeFug+fxlifDuw+x87qKGwoUjgvjmJnYCpkepBpOoFuIipsOe72T23O3Qro7eOlmGLbHhZCs1yTabh/R323SQuIy22NbpjmelLZ4ZUM2x3Ovvk/Agz7FGKOXo3TNEPoQ8Sju9Emx1mwo3qQuj8NzaViWVdksuA92FFOuo+00A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mndB/McD4xycmpYvWOhs7zI/goJ7L3ZqOWFRDShUz40=;
 b=jS7Qom3VopARtCTU6bWxIUwpHSvb/Bd8vI3Ml98IC4CmBm4ngxSbAg5gQIQMKX6lIGKhJiCtOxFxvrM4ktxdKO2iabkJm1OFDRaM+6wtqHR1tSuQP4nNQTcOBBbyEIJl4YA4oODbR/vpGke1y+3FvDdbCw1tyf73dB6tBLisIIt/vBHmiL/6gDzv8ycIMCZZ6eT1eTP1ZP9CkDsf7dP3QXgSdlbEHrPYt/U9+SDh+CaLWjhncwnDHnj1L4/aRW893iklkaBg7Z53pQ3N9k3BxOeVMmtVffiSE13qw//RG+EXl/1kz+yMz6oegNdSKUOxmyLVVkFWRqTdmM4upSA2cA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PR3P189MB1113.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:48::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:27:44 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:27:44 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] patchelf: upgrade 0.19.2 -> 0.19.3
Date: Mon,  2 Nov 2026 11:27:39 +0100
Message-ID: <20261102102742.31991-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PR3P189MB1113:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6b95e8-a1ae-4fe6-073c-08df38cbee7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|11063799006|10067099003|56012099006|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: fzoGDk4G4a/9JVSoxUcxfDBbtib2PX78Y/EbHujrvi4ZnWv8f/MiC2bBjzMYIfA0I+t4KFnGjxgWXkqqNoygHpjyPXI9194Q96EuVyLGGDltMLs7eQebHe7izwuVHbbDsZzYbV2GWONbO8uAei52HSXvouRnK2uZ5xK6TDX0ouUuqeYobzZ6igatYT8MiKQmJfBiFDhs0QVgjIGUHWSmU4828pDjtFUGmQq0dtZ33f3cetbhVHLDvviKa8L4jKj4s+nJU3A5IyJM5fO8PxEsjsRW5aHLXYmwMm4c2XWU8rGnRMzxCs124Zar2jm+q5V2btQv64D2hqMy3lJjPPay4wgIsRn2MKsE44LpKnW4tdxz5xtTsOhiDMQbSS0Nn4lu6WWr62wTjea/sYYzR7OTPoBNvKNEmlGLXDLzFzTuwWXnm72fDLOH9WjzkiSn+BZ5RuLqgTIQxyYMI5eAiODTYg3jFwTXz1a4SFoa1kz7jyXsGdgNAp14MKmR3lc+JMVki102x57x3RjU1HcIPxL8sNKNyLhn5MTmMYyDpTqM/e39c1TEQEPCUqkG2wPsvAHZKNB44ecisY5x0JcwDOcjRR3vvjmTDTCLB2oRCPtUc8r22l4JUYWTNycogiigfVeV12GoG6cru6euaCJyvh3QH9k4wwHc/PzlgFGwcdkmYmY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HKjuVCZAJilCVMOk6qQqzfPUyRWxpClLTf6NDW8X6x75u0ZnBWC+ViCIHBx8?=
 =?us-ascii?Q?nwnj/V7pp1nM174eWxov1ghQYLsiC6qWSqpbjDTRzhkpYDhinLTHTpxJXa+7?=
 =?us-ascii?Q?F1fih5rKIs0FY1k/NPoPgPtzRGlod8k8nxG+WAXBtxc1KR0ENwHViXETSqgi?=
 =?us-ascii?Q?iUU2gJ2Bz/zer+KLsmZY+TCfyykIlakQQiBuVJom4+al10f0bMcCb4j/uPu5?=
 =?us-ascii?Q?UxjNFzgQf2e3wjwmv+Q3qC967xTg3iYOaMy2qzlu43aels5Sv6HUrfaNRcV9?=
 =?us-ascii?Q?G2OBWSjExbytWfrLOnvSh2mCrIPgNcJ8bGp5yJhONJv9vdrDRilkHjtxHg4V?=
 =?us-ascii?Q?eykxTOiFxrU91U0aiqTdUQKufZRVXBLv7V7wDRG43uIUMvcfuz2y9uuY/Sf/?=
 =?us-ascii?Q?7mFS1QiaaehO9yzadFhh4zFUIa1c4OK8L+mp/iMhocURNtKHdDsduYd1pQ65?=
 =?us-ascii?Q?5b/86667X56raz7727/j2kQ30lDjgEcvzVfcdziPk+7CbRioTqL1XPG70L3N?=
 =?us-ascii?Q?1gvjbqXqHRynrKRw2r5p9A/2Bmmk0ytf+x6YuuhI0WE5wmCp1cZ0x8RrGOhi?=
 =?us-ascii?Q?8lBWcs/TRewuEi4mamyXSt9PrCYmVhMY/I7kGDE10ra9iils9OhATDuXNM0c?=
 =?us-ascii?Q?qn8k7RycO6eNBiFMQUqnngj5RYj7LkG40nRkIN/1cxCfD1Q15cgmsHE95KrG?=
 =?us-ascii?Q?QC3Du/jYA96tALHaz39RYo7YS98pY15FERaS0Wi40XB3XWWzjOVibpRMrmTf?=
 =?us-ascii?Q?fanwG22nGOWqLX1Pw9pfb/7ciyEJlHAg7T3Z5YLkFJ/6x5gOwOt+khLxGHLB?=
 =?us-ascii?Q?3i9fmY6gjm3LHOjxZEUjsvhy85KSBpR8D14blfBiIRCIepeO3/zc45cJIaup?=
 =?us-ascii?Q?pWIZkiRFlqXuKTpmV4YJPaEcCldPWAVsjcuawIPuVMMOUnNAekZjFtgLbCqU?=
 =?us-ascii?Q?HllCkGagl4t8H01mjj4IpgDTMNa272BSV//fCO76ayAVBjOZNl+yE8fUNGQs?=
 =?us-ascii?Q?opH3QFf0nSWjIuL2PA5sVPPHxiLImHNSSDsyXQIHdZq44GfCTtCtn4MOvpO0?=
 =?us-ascii?Q?hiqvxCLQI0dW81NTryKa9QRc5tYxRDdljJkAokHKKu3KcqyaQWOA3DxLYbS3?=
 =?us-ascii?Q?YoW4UgPx0y1CcKxC/CwWhuPF2TwBD1ZANsQXZkBjgGYJTeHHISRIGnECwrXy?=
 =?us-ascii?Q?Vd9lHna4ynThd1yj3Pad1f9umQ4eANJHjfuFL8npBD895dSmeXpKyVmBOBis?=
 =?us-ascii?Q?CL0Hd63shm0wqpLMnaXbLqMdrIkCf2+DEvbhEkyyizMkQuVmRBKcqjKc6o/q?=
 =?us-ascii?Q?LmYJEWzIFd6IuT5RWGLSOZ0GwSlYe3rbe4RkQUMWdlpX915yXNWMUrNQ58RQ?=
 =?us-ascii?Q?sCVjXjmIKgPFpT5vJ/4567NaMYP2WPTcUtAEh3NkB3Q6CjQX1PaTKaGy4sM0?=
 =?us-ascii?Q?J2G+ad8usPMqW9zcyiyP0yRVm0WsZIHypA6iTy+0/UNyb8KG5R6zxY/69uwj?=
 =?us-ascii?Q?xKTjKwNvZ+nDCumEV3Cu8zv4SUXFYuiUYDCErP/1iT4YU2ObJ3BDXUDUY0zX?=
 =?us-ascii?Q?gVoV4eCwy6fX2MUm4SD9Lgopv5wJ0KWIdgolaTMkPPN0dJ3GQpUgcfCx3LgE?=
 =?us-ascii?Q?Bmc0fdcXm0bzRQsjNiJya+rFgCNq0qYi9Dk6gypXAzUN3qgP2WJZ4W2GKkWt?=
 =?us-ascii?Q?xapEqHr4nvQBhym6HzD/uOMjrAFqJj/C+kqely04hA3lIWPqe402PP5rnpm0?=
 =?us-ascii?Q?N0L/MOHHOQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6b95e8-a1ae-4fe6-073c-08df38cbee7a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:27:44.2201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Oh/K6TgayuP0FZ5JyrgxUS61un0ScF24U4qsUScZX8puyE0woo0DQBAgdLxAiPwotLZpUEeSVEDNFsm9wizxKR3crgXPh8PBHiKZP6mJ7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 10:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249197
Content-Type: text/plain; charset="utf-8"

Release: https://github.com/NixOS/patchelf/releases/tag/0.19.3

A bug fix release for executable rewrites, symbol version definitions, and =
zsh
completion.

* Fix overlapping load segment mappings when growing an executable's interp=
reter
  and then rewriting its RPATH. Preserve writable coverage of `.dynamic` so=
 the
  dynamic loader can update `DT_DEBUG`, fixing crashes in musl bootstrap GC=
C and
  GNAT (#672).
* Reuse the header load segment for further growth and reserve enough file =
and
  virtual address space after `strip` removes padding, preventing later rew=
rites
  from overlapping mappings or corrupting section contents (#672).
* Keep the program header table covered by a load segment when repeated
  executable rewrites split note segments and grow the table. This fixes in=
valid
  PHDR coverage on x86_64 and an assertion failure on AArch64, including wh=
en
  patching Grpc.Tools binaries (#675, #679).
* Update `DT_VERDEF` when `.gnu.version_d` is relocated, preventing the dyn=
amic
  loader from following stale symbol version definitions and crashing befor=
e
  the program starts (#664, #665).
* Fix zsh completion of options, OS ABI names, input files, library names, =
and
  colon-separated directory lists (#677).

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/patchelf/patchelf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf_git.bb b/meta/recipes-=
devtools/patchelf/patchelf_git.bb
index a69f3b9d757..9553b211556 100644
--- a/meta/recipes-devtools/patchelf/patchelf_git.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE =3D "https://github.com/NixOS/patchelf"
 LICENSE =3D "GPL-3.0-only"
=20
 SRC_URI =3D "git://github.com/NixOS/patchelf;protocol=3Dhttps;branch=3Dmas=
ter;tag=3D${PV}"
-SRCREV =3D "382d8bc12db9e720515da49d9c272ef4a622c3c0"
+SRCREV =3D "2b4b49d36b62690860414dd127f567be4f1f3208"
=20
-PV =3D "0.19.2"
+PV =3D "0.19.3"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a71=
e"
=20
