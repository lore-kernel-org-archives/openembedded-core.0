Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11723.1795006112757909136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 04:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ArzBrqT0;
 spf=pass (domain: est.tech, ip: 52.101.66.53, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l60+bDfpuYbWOk8CNFbLsTyCx6SvErq4VZAiDCl2kBWs+kcXU6LdaV4t7RuDtK43RZ+gs4bhD/07mcioDW2qOoGpIPzc9KlAKMesQ4qkdbHTs60e/PNyMgIko7p3QJhgAQEnzbxYDkfMsWrWbX/S5+8XajHQwNwnvWaFcTu55ztHHgPkQEHOVdqcsj68lzmb3OJcxNDSh+AhvsnZ/LqNyYFH1rflUiQ8AwHvIEmbhdZoEdO0klZEiwfhpyEX3f6PS69jXRHgzBaWtqoMBZTCFua8PLwXefm8z1F1THZIjof+6TAUuqgHzDPjXnr2BAciQOu6rsRHbb7HuSkAmH0PUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUOHe27nZnS+8mfN4GN3DAjBDmWcDflvIPLQTYs8Q9A=;
 b=bSrjmFUyqTjlXzq2dauTnCWVq3ukvmZ7oJQ8QCYRyD+vXgIYEjyFZkUUMllsKVsOMqE7bnbA+8apu41WYSh/8gGeS+lKl5fxx7SRjDVfNlrM20XoncvDMlTxNvL5HkoYsiLiG8ABZItY+AJBscjN5mXmvfzy7LpDjhmlaV/xTWhidGliiH383P7DSMuU0oF7MvMnbQogiTO/Z9DzZcd75vDb22q4xgP6ZaSPrwYz6O6oEcZ4QAfKVdaAIMap/UUWVzgYMqfSje5l+Ohd+42e6un1L+G9RAgcMYdklA/fOwa8Yx/iHQPwC/E7K+P4VuvyMqIM+3xX+mPSbZNmSiX+jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUOHe27nZnS+8mfN4GN3DAjBDmWcDflvIPLQTYs8Q9A=;
 b=ArzBrqT0mOK6PtCLTtH9dJGg4SWbmpalhfBArX8NIay+NJGGnMEPKvyLE4Zy25dh4KiH9BXYV02v/lSHkf4T77OUMibiHMqjLbIBlUe0MpuiiXc54Zln4Nb6kYm5otUMwopswMdUj+Hkw2qB4WQLoO3Gfc5z5L+yQqYRZtf9zU+cBWqKK1qIeP0FeMAOtmpWdLXM4zjDpm2bQWlFoJE0mBtSqGBWiY19QicIxgB6bKkBVHbYSPRSZQT2igUxxDYr34vAkMW/MD7Mypm4Epk9xE+CKkLBrdg23hS1LKSY9pbi0qGhqOD+G42I6sVgrbhCiL4yrx7gns1wLiCOUMRLow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DB9P189MB1931.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:338::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 12:48:28 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 12:48:28 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	alex.kanavin@gmail.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] avahi: ptest: derive the test list from the Makefiles
Date: Wed, 18 Nov 2026 13:48:19 +0100
Message-ID: <20261118124819.64437-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0021.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::12) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DB9P189MB1931:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d770aaa-0d10-4d65-cc23-08df45723e50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|261102123227099003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: BC6PjtjxqvF9k+m2U7Yz2Fmd7GdDg2OxChd/VyBXSbfjYB00OnDtxb9UByPIEnw0bv/wb7V7cLiLOAsbs6bMwY27Yg+dSQQpg5ZRGafrtmIN7gRHDIvoS3s3n2a958CFlG2FaL/wDrgA9rdrySnKQZRzT/ryTDFRoBaQhtQUim5v0X7Q/gApKf/Y3wo64MoW+gA0Qb7b2po14YThOh04bSFrARhO2K2wYjQpzpe40BUhfwRMEuc4tlRqXxLuxsYXXkbxuy+PfbIhc3jNXpMuGk1AF2bTKekprg5UnfRERb5ra1hwd0D21j1jc1jTPkMddxMqTRc3lwngVgMnoumWrZpxG+qWHZ3uFYTNjvlgwwERjlN+xYrRdQYVdWkmiWm2JFyYVuGyn755wx28Rxm8K5r83U+OILD85E6ha3+ruB9Ibl7FG3uQKy8NWOnn97I8x9xaeKItoI+VQkrf+kXgGtzWTpEA8QJkMd0t7BqNkWX/AFjeI5MT339u4cxMQSiI+PVnHSxEIX0EirD7D6BhDfjIrIANG7ngkAvvnEQ07dgeuHASDIb/pQkcL26pXeAuyDSrM46labQZ05yfPAjMRJfeHsflg7AQkK/k5ewyK5kGMzxWgfAIOljWYCdHr/MvMEK/mR1aOP9v/buusVFSuC2LEpKuo/YfpDKUFtFi0Fs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261102123227099003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z9cSr8lK7jdlDlp0XQ37UpMfIFm5Fkm6F6T1FU2n+KKb+i7Q8Zkr4ba0Qrd7?=
 =?us-ascii?Q?PwUUKZtVjZR92okn/t3e8Hh9upwtVViD3QQipRI03rTPSGX+bDKwGTmgJ178?=
 =?us-ascii?Q?CQjCN/CS9imPeatf/AJGvDJTFDay3krL+K742AWgmU1oNzc7cOAe90f4Muh4?=
 =?us-ascii?Q?Iy14u+ivCEmodFl/Od8u+FhhjroGHjoL+LYw5o0r8VCDZ5nItTQ3akKVsUtS?=
 =?us-ascii?Q?V0BK1dLdiqkk71I90iMD+KMoBV7qcnec4er1hdyWVUIWnk0U+puTkk6ztg/0?=
 =?us-ascii?Q?XLXE6XdMeLOVJkv2hmXZBREXGeZaKMHSHB5odVOsNC3MB92boSLtwMn4sTCh?=
 =?us-ascii?Q?4sZcbQg2XDAch3bdk/zHfGjKAS8FyiDPD6KC5Cu31oQPMBtUEmzqYxs0iI41?=
 =?us-ascii?Q?hBS71eH4vO1WqO0LMePciiuLl4ZCFCap0oTfPNn/Tq552s+zlxUZQrHFb5Fm?=
 =?us-ascii?Q?QLZZ2/M41Lzbb18ggdyp2oxU+vGHFRrXNBeVcO6EjlZz2wFwUTxku6UoWrty?=
 =?us-ascii?Q?Zal8Dr6pN7Lh2/dDxCC/uNwfY/9Pqbi+4/NYmeotInbBLolIKS8UKPBtdvXA?=
 =?us-ascii?Q?UTiYUNw2EfMPufinnP9l4m+wzoxZw8vA6k2T7B3PDTe5TktVKzO+MZRf+FYV?=
 =?us-ascii?Q?SO0rwYT4jPFPZLL8ObK+Tg4MbIJUTQccyRlyOzH+C8rINk5Jb10I0+0T/BSu?=
 =?us-ascii?Q?fnsrJskK5ZnVyPeSCH4CXqoAgDzA6wSUjc44fky13swc56TTqqnw7HYTxKLk?=
 =?us-ascii?Q?As+ocYLoH0B9fU6c8X5R8kIfeLeogp6dF5qe4AtkdHiOGvH9kUsj1Z6JbKVl?=
 =?us-ascii?Q?H0yjB9mQlkDdmtWSLyi7CUbMHtrj0WNas7nzNMCI7ZK3mVtIITjzGL0gRojy?=
 =?us-ascii?Q?Ek+HXGgAkyQb7NjXrC4cTzogucE0tSZUpuAwP0yZ7c9c5OilQXTtDuGCI3Et?=
 =?us-ascii?Q?jYUS6QAE5nVnoNs116TkUevcy2jtBdDbcxHTD7ydm2+Q3CfRyiYGHg0DAkPR?=
 =?us-ascii?Q?l2xFUI3GpLUSkLQxCdQGe5Zxvzg3Is9fWpD31I5NRR/j11B+8joLTB4icgZU?=
 =?us-ascii?Q?QCjM3TA3n5hYDC6MsebH/U5fNNqSbm2Eu9A6geSAuoNr6Sx7SN3jQE/IUjOd?=
 =?us-ascii?Q?DzXQjN5twA9JSep9TtBr6I1e05yUaWo+M6u/365QbSO64UYHFyAMAVuwZEQa?=
 =?us-ascii?Q?rjv4n/ABiBFmjkoZweB2LTJdhdoDWhbN/Q+YoS5D/j08TVkIn/sLkXMDKyPl?=
 =?us-ascii?Q?dM41bMJy4xDv/gtMDz1o9EvVRKRVHrVZdTtPzM6DGv8wPJhyv3O/SX73r1D9?=
 =?us-ascii?Q?hP19Cj+u7MLPkT/IH23eEhHdpWhNK2LeZ1f3hDbd8qqhNf+rzu/OaRTzFtqq?=
 =?us-ascii?Q?gT2rlnkA5cmwcoVT3XwuBI2eKHeziMPJqX661VbL0kildIHyftpIx/03Nkll?=
 =?us-ascii?Q?rTOTQVHv5qpoMbx2NjzGV4tFycwbqk+7nukPKBe7dfUChCcem+dHXLsabo+O?=
 =?us-ascii?Q?u5EoAfSyc7byYbq64kidmN21+UQiK9RnDd5BX0IRMCsAa2aXS5IO3JW0qyf+?=
 =?us-ascii?Q?eSWa4TeT5RETlwPml3hfCm4bkuySDh0wtnQqhACeI+8NHmYeFgJty7lLl8uE?=
 =?us-ascii?Q?G6iSgZMXzSRZy9n+KxD1nz8SkQlJnrrpPRnkOcNJIl6aAofmue3eFpUSOUV8?=
 =?us-ascii?Q?QRZF3Grncc/Qiov3Zyr040U6XOMlKl9j5ERr/fea69s5UMfErO9IcVA1/Yi6?=
 =?us-ascii?Q?r+LIBolrQw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d770aaa-0d10-4d65-cc23-08df45723e50
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:48:28.4759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlO+LDNhnRDSriYEzH/8IQBVhw8BGzgcJxzqkgqzddRQ+uZLrNInL+n/fANjAsnh6yNFick+2sRHJrjopHBJtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1931
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250545
Content-Type: text/plain; charset="utf-8"

Instead of naming each test in the recipe, install the programs listed in
the TESTS variable of every directory in SUBDIRS. Tests added upstream are
then picked up without a recipe change, and this adds the three tests that
were not listed before: watch-test, watch-test-thread and glib-watch-test.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-connectivity/avahi/avahi_0.9.bb | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.9.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.9.bb
index 44ec08d895..72be13885c 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.9.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.9.bb
@@ -87,22 +87,14 @@ do_compile:prepend() {
=20
 RRECOMMENDS:${PN}:append:libc-glibc =3D " avahi-libnss-mdns"
=20
-AVAHI_PTESTS =3D " \
-    avahi-common/strlst-test \
-    avahi-common/domain-test \
-    avahi-common/alternative-test \
-    avahi-common/timeval-test \
-    avahi-common/utf8-test \
-    avahi-core/dns-spin-test \
-    avahi-core/dns-test \
-    avahi-core/hashmap-test \
-"
-
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
-    for t in ${AVAHI_PTESTS}; do
-        ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/$t \
-            ${D}${PTEST_PATH}/tests/$(basename $t)
+    for d in $(makefile-getvar ${B}/Makefile SUBDIRS); do
+        [ -f ${B}/$d/Makefile ] || continue
+        for t in $(makefile-getvar ${B}/$d/Makefile TESTS); do
+            ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/$d/$t \
+                ${D}${PTEST_PATH}/tests/$t
+        done
     done
 }
=20
--=20
2.43.0

