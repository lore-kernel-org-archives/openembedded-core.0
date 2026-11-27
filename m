Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15658.1795785511092827251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 05:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZKc9FXgr;
 spf=pass (domain: est.tech, ip: 52.101.69.28, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQnn9GdlXV8H37B0i2AJvpk/rzQdo2CjCyEDo0ueLo2S1bPIyKeh4dzr/Yly615Ee2y2THQUDHyEr8KPo8ZChCowcadQF3iaVW6Bq/Cs14owG9T+LxLlzGXt02oeS5b+s1GeuzOVW07C9puKyt9zsE22VaaaEJVLzSYlnVOsje6bEH5yXNTCV/iMaFP0O8y6y0DJKmVVOGm5cZiQROWFqXIiTcGYeAxvWTRXk4wBm3sWo0yzoNVak3/MijtD2juMpHZ1bClkrtOG1vCJGofIX3UikswLOCQ+V6ROfXclwgPgmNIPljEDJjxTQIK7WDpTkT8eOuaD3B+zgCflmAe7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuiqVn4+SzDx73nnhNk6OIGAlhgluc4JtFGjimGMhzI=;
 b=y8lKLDtmm7PPoA31+LUrdiSZ2mKO9LndQjHXNGywdYrISSg27aNIsZkYuv13p7NJx30IXvh6lzztacU9NTC91770COV1IYGCi3fIw6Kry/g2fIYeSksHQLC/IulBFOYoT4UL+zBFSZ281mE4jWmTUZkrtuYNkM9cBSRg9EJ62Gu2sFj3BlzyIIocIAre5qpD4dZGTUq1Rhk+y1487qMXMtIvLznoU1p7Tf6kcmxSqjrzt89jj0ETWVR6aaFg+R5/pkJe0UYJeQ9ayVb6LRn2JXmU2mPXtMq7Hig5gFhdhuTjLgIwu4IanuYC7s7NsoBH3IKEnccqTl90IHekJ9Z3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuiqVn4+SzDx73nnhNk6OIGAlhgluc4JtFGjimGMhzI=;
 b=ZKc9FXgrvxNkXO0ZcIujTBX62IshPWEtafFf+Yof+vvtQE980mgQOtAFB+F++A8QTY4icR0Yt5O7Ip26Iw92bzpExj481iaB02wTGImLBXn1SV0LARHFxJi1sOoVycjA/xCVcgaMjlWmgNZ2fbd8Tbg7DWuGqSpI47j8Dy0T9LJP/Ez//uarm0jeXwpFOdfdprKwq+PkLD8Jt+uExN78WYfknClDRlccf/DBzZYd/Ax5yyrvyNgDZqnjezA6Ctsj9l2NCiroTu7is1GBr55uUIIIJ3Q2D0qCYqWWuHU9piZoTxElzRDSxA7V7EVLnP5R2tJzjTq6q9IaDzMC8swTmg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB2133.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:518::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 13:18:26 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 13:18:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] p11-kit: set status for CVE-2026-2100
Date: Fri, 27 Nov 2026 14:18:23 +0100
Message-ID: <20261127131823.3534-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZP191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB2133:EE_
X-MS-Office365-Filtering-Correlation-Id: 20698a88-29f9-4dd3-34e7-08df4c88eb3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|261026140227099003|261022105027099003|10067099003|261022075727099003|261102123227099003|261028144727099003|261021121427099003|261009223027099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: xV4tKrpAqpVlLufTY3XZmeJ/nv51V+aE5/BqErm7jGE+zW4hmaOt/ZZ/klPLAH0D1sq9OGo6btSjWBV4eiTAjXD6B06D0PZEccG0d2GTqcotReM4CK8RgeTsiSKqLbvN6yomSsE5wuC46wk4SlIbp8KRKLSN/M03/dI94X2buX2yM6Ky4v1/t28JhTBgOQs6aqn0dj+xl+6UmawzEuVMKafD2UPUeIizlTc/fgvPLL799vhXJMsgzkjjbnRosaSPYGLIpiEbjSN0+JRAxWBpA+bbNOEAIq5FPRMLIKUfReZeuS/mIJrzMO6He/g278at195awH8+aYWG2XT/Xt0mdl/vj+cCsw5vNdPsmJn+c8zGBc+xza0cq1kNRCY1x69TQ2h9KygiupLsYhGN9fksBVbu61F4VptErAJJMRL0r9dw7qM+/H+yutWnGnWZ3ZDkBd84Q88mNeDImt4ivlvyzZLzeU5B5amFHgP9Vroc/vgugfeqwgJun6jtws1WzrALMS/qHSi6pRv82n3N6yfui5zONTLhVeFQWe3JnFR40YlagOEvLBPZuL9NeNEOxyVg/8ZUzj8uyPhPISi8Wd1k5ZiCylM291nHGDo2Tkuzwv5V51kTbb6IECXaPRwSKTep
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(261026140227099003)(261022105027099003)(10067099003)(261022075727099003)(261102123227099003)(261028144727099003)(261021121427099003)(261009223027099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o+7/NrTHiWeTEBI2e0rNA3nvlvlrz/um/60qzYHm1Py92eB2NfnHeEJrMHYv?=
 =?us-ascii?Q?8Jgs20E9yKPh8Ih7F9iI0fUfmsjf1hClfv5I5RURp/c3l6cmeKoXZk+fOVS6?=
 =?us-ascii?Q?uzpX4rcR53dlAgUh3PiR2sS0cNjQb9P2OJxxYIwKl0skErNUbl/oSfum4xlr?=
 =?us-ascii?Q?hOOliTRvnM5hwfs097VcvoxU0OxDtmqGWd02k1Hqfk09LUe21XAbYaz7Fhd1?=
 =?us-ascii?Q?lY4bIaeeBP0epKcHssCe1KDNIJqCe3SF8+fUDENmFPKpntzt5hZ1bTSMQSCP?=
 =?us-ascii?Q?x/q5ynQOBhohJAWNdm1lTC5F9BakFtsDv7jBpvxMgcmEw7P8wSJ8ZJdmRBfL?=
 =?us-ascii?Q?CXEpHsp1hfTUMJLlNyPG2ii5WhMe49iHUZkLODHqF4qZ8FLCKdnNw8b/49rw?=
 =?us-ascii?Q?A/eqG/GjVH8JRUN0p1vk9q+0X8pS+cPcacB48w/dgMJbtH0XAQlakja4b/2C?=
 =?us-ascii?Q?VgTBQfLk0y8usNadm5qNhEB2mQvJXdea70isi7etEkPF9aH18m4lQmZ4B838?=
 =?us-ascii?Q?wZuyyGkOG+i89xU9ksKZwNiMW9iEGbxRWtWvYVfLwU6HNMuZLr546vq5mzHL?=
 =?us-ascii?Q?BV0rCPPsS5n4gGlCn0QZr4iYoKveLoKnJ627UQaVEsbenPazx5AkDvcQgDKW?=
 =?us-ascii?Q?FjruX46FCm95xHOmFbV01U2RzeT0hv4ZY87IUQ4nMHJMRA6cvysIzxh06xz2?=
 =?us-ascii?Q?e4/MbFrho+TBVM4J1OGYwCxw0o9nVNZqbWTzNs/l5b4X/PHNAKZpEQuGDa7G?=
 =?us-ascii?Q?ORTXQY11zzYbRYKSSNDM5QBmc/YTZ/gE6y3pl6V7m2uXvV6hVvQV32gQaVc8?=
 =?us-ascii?Q?+FfMjqvCcVpGz537RDHYfZt9TJCi+rEyUyPFcytylY+DGtm+Vz0X96EIOImt?=
 =?us-ascii?Q?5QSflp7iqWkY8W9PMNmYKKYFZXmzm6IxgkCLw7ZyK2e22TO/463mP6SGcDjQ?=
 =?us-ascii?Q?AZk7jI8jlLiiT2/Dt9brBX0Sh/j3yHg+4tY0coT/Z+7I9eZVmXdhvUkO68F/?=
 =?us-ascii?Q?rRVRqHR1kEFZgkiamZZTXRUXTQz3CIr6fzKBIL8BwdRmQpyWFSiKlIcHFxkz?=
 =?us-ascii?Q?CDSIp83IvqJkplskZ2DPIPfqEVWaw/uOtcOsR/UC7/Zra2ijMj9vkqkovjZQ?=
 =?us-ascii?Q?QUJPNJOjYZQGkDgvh9RkShDqEFm2rCoNd54XbmzezxO+V+cnsf4ekOExkUJ6?=
 =?us-ascii?Q?KUz+Fgj63AhcTPBnNj+xcJ26+tZM38ryPFZfcM6vt93nX/zPXxLVLbPlEJA8?=
 =?us-ascii?Q?zjemPPQGG1FSKps1xiVIIcwQeMZz6/jlOZQTkqVth1DxUQTE4rJ+8gybaKBJ?=
 =?us-ascii?Q?6iZFFnEZ7zfYfg9EVCjnxKLQux3BFv4mRCiGq1ja1bhH756qwF74qMc0C2p5?=
 =?us-ascii?Q?2HJQWNhZGRvOnLFPYXYREuMybDx8GXqkC4F/1iu/+G2hsFGERlykKhWssI+m?=
 =?us-ascii?Q?wKU0Hmenc9vs27PgQ7+7kQI5kCd3YDlx2V2dV4eV89WyZR+YhumrSmmLquhF?=
 =?us-ascii?Q?S3gFP5/m5SaMo8yF4vNVo51dGw8O8mvUgAJWnifQU1NaZYVgIQGXf2v3Ycg8?=
 =?us-ascii?Q?3016EKpzo8IrUH3Aed2nOhbuSOkPFpWLNGL5MoA6UhElrGEwDR9+YZ508lDo?=
 =?us-ascii?Q?ppWzj6Pbjd2IeI+zW8cugioD3nHM6enc2AVXE7kGmociIskamStM+6akWExs?=
 =?us-ascii?Q?zKSQbNdANiz0zJQHL6tzlHfkgdArp14RbN7SyFzWI2ySSTX/dMQLvJFrt5bS?=
 =?us-ascii?Q?+CO2oXWHlG2MUdDoWReKdnlof84iynA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 20698a88-29f9-4dd3-34e7-08df4c88eb3e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 13:18:25.7670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjR9C3pUw6J7jjv/FUEoiNnMi7FkcqBTX4QUUq6GZxHkagx8BATbn45G/VESdmXjHy71ubUoKkfg+DfDTh/wLvpxYLIMdup7rU52hPXJvOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 13:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251387
Content-Type: text/plain; charset="utf-8"

NVD lists CVE-2026-2100 as affecting p11-kit < 0.26.2 [1], so cve-check
reports 0.25.3 as Unpatched. The vulnerable code is not present in
0.25.3.

The fix (39f3b5ed3deccc2772e21ffb7d269329e3ecb600, PR #740) [2] changes
the IBM Kyber and BTC derive parameter handling in
p11-kit/rpc-message.c. That support was added in 0.25.6 [3].

Same has been mentioned in debian tracker [4]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-2100
[2] https://github.com/p11-glue/p11-kit/pull/740
    https://github.com/p11-glue/p11-kit/commit/39f3b5ed3deccc2772e21ffb7d26=
9329e3ecb600
[3] https://github.com/p11-glue/p11-kit/commit/d7523b1031938fdd9740757f90e9=
03aa09f5397d
    https://github.com/p11-glue/p11-kit/commit/aee856f75e06e451a34cb1fdd663=
0945c9d1623c
[4] https://security-tracker.debian.org/tracker/CVE-2026-2100

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-support/p11-kit/p11-kit_0.25.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb b/meta/recipes-=
support/p11-kit/p11-kit_0.25.3.bb
index ca10bbc6ac..2a2f5b8d8c 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
@@ -45,3 +45,5 @@ BBCLASSEXTEND =3D "native nativesdk"
 # git/p11-kit/import-object.c:229:70: error: passing argument 3 of 'p11_as=
n1_read' from incompatible pointer type [-Wincompatible-pointer-types]
 # git/p11-kit/import-object.c:264:78: error: passing argument 3 of 'p11_as=
n1_read' from incompatible pointer type [-Wincompatible-pointer-types]
 CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
+
+CVE_STATUS[CVE-2026-2100] =3D "fixed-version: vulnerable IBM Kyber/BTC der=
ive parameter handling was introduced in 0.25.6 and is not present in 0.25.=
3"
