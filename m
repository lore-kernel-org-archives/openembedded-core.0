Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40809.1793015270918841295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 04:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0UfVDCY6;
 spf=pass (domain: est.tech, ip: 52.101.84.29, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFPB6FOxRB70uYKqkLzeY5mylKYpStKzGDbFOU6oBE7WgY+muZoOJ3l7UT5czzVXtgc9dbw0uc1PqEAKvkp9a3M5+ydlZg4XPRCLoc0eII4Z+RSB+bPQpAiYP2JvkWD+1ank1LNpl2Co7/gE++/M/b9Bkvr6FuLhSHeKw5NXd9jAvuZr85Elj/AFdJCx7+ciUefGZaq9p3IImNHWWC5AkkV7EydtZdGnWYNVwBfSnZVBa4/dKIqhDPX+FvhZKgAgXYKwA/mnutrYXOprD59JTVtBoOmK1skm+E28uFwR2vEqrvZphi77XoeQ04SjKPmLqMFOY7dsLlOrTI0vgO1Ydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKsh3bLi08sfHzY+uHYfC4lX9+MNcM3gLpiZCj/W7n0=;
 b=VjnJbr0Ys57IpQ5ClyDsc8ume+rp1p0m1HqRpFUBEg5gWs+xLgttl12RPrR5uHdhNyDarKP3NEg1nCb0eQwivXg/CYsXdp8uOL9vqk9jlooqD+hxXHaeg7xsNdT9E3RNpOG+mjVee9LR257Kdxke1keh7gvxVnKoAR5miv/UrIhkUvelcheIk9XNbPwh0YJAHLd60bedbuicRYUtEixYfgs8+FS3mAnOceoSkbbYI+BV67h5fPuh9pc8/0F+400iXgDMZgiqLUc0rCi0jGckxdaqaHS99yA6lpmz2Oxvz+XLLG0kOBL8wk2bgpOJ62DBzUffFznbIKT3wgmTq92WNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKsh3bLi08sfHzY+uHYfC4lX9+MNcM3gLpiZCj/W7n0=;
 b=0UfVDCY6m7DbTqisNXfuN12xQxrCsOir23ufXbZ3+D7Pd7aJ9xS75FZu15+bc/UIk6eL5YVObzcLJyAa+/urkRMn+pRl/oxL4HcAgGPQReJSeZ/94BdNLfK8EIQW1WCUelDjeLGwQWps3sD8dFS74OJo4QIMKbe+EoJL7dcSH9vdmNeFW/UwEBL675aRavB9FR/SG4Suz41rgGR85DXfKkWtUPBujjjDzUbYPvbXfJKxCjmK+Yik4xGgeQ91MjQtW1cMi1KmeaKKNMImytrz2vGtb9aQX7OJl8c3Z8fBnqo2INZHppAv84ZjOv0AjaHimitmytq8YIyaAt/yqa368Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AS8P189MB2603.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:47:46 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 11:47:45 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] python3: ptest: skip flaky test_shutdown_no_wait_max_tasks_gh119592
Date: Mon, 26 Oct 2026 12:47:41 +0100
Message-ID: <20261026114741.29210-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::22) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AS8P189MB2603:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bfe9979-f427-4701-5579-08df3356f3ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|6133799003|10067099003|18002099003|11063799006|56012099006|261009223027099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: iXCZinPckiHfya7vFHeZCGKigYJPTUfEd/qYLyRz4Tbt9qeGgfHIVVWaifXND5e/asnXo56JU8pl7fw5fE3G84dY3NUukITJJ0bsRyRT3YlbtI7O/NxzPY3Ap6bG5SlxKlm7thrbUFW6LSU3cOe6tubV78rdSSdQEErU8wFgaDMJEMr6dbyn5WUXC7ruU9xdJ2N43tApuB1Lp0uRiX6DHEqte81sAYeNjqPb0rfs2f7Wb5MMrviQF3HdcDpMvqF8UUqiZiRRV0ArfTjP7h+n3YE45PRW+URRNxeEhNiTUufSAzQmC67pQuKSsZbQo9iYql3Ml5yrKM2pIJUE0BS8uk5ap6QGzcnUZJ5CdZBBFqQKvegtf/hFC4+U+yerMtmqE5Fz1vwU0Wkk7U2O9/oMa7xJF1P0dHeS171nhOgvDYZc7TVH/yzN7a6WojH4ULrNBktilfLm1oL6GEGcRE7boz2lpNE8VEnqHLWdrWVFiQ5sDbCzgRWE964a/NG2mgiJxT/GGJaqo2DtKf/aqmO0pwoCaneluTKQhtx3ykLzBNKX4z89p/tCPJZGhjMeiPEJOLkxTRXEF26d/pcUmq6N3C6Wnm/oVKGFWiS+KIvOYNVQknKsVTT6QuUncdKfH8UhzcVXSeBZAokQqS6POiPOsWCX/NlihEUHsHmnzlq5JUY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A6mFJxnHWCkoRTsqSnpCf7K/zNyc+/3h0bWJLG1R3bDi5Yq9YCbmQz03ECFt?=
 =?us-ascii?Q?qxouGM04z3jHrMMDlyDo5DqrAiDp+9iHAFeKpjMPgRGSXoH6VkghLjsf8TLu?=
 =?us-ascii?Q?XPIAypSTycy3UGiJB5ZTQS/ghHcHYZfY2m5QN7Bb5DeNF/rH7gBCTRPkD/uw?=
 =?us-ascii?Q?TFDRaAEuksnaeQXPJ0m8MbTDmkUMN/eXevVwhKTEsDxMdwpD18D8/SQft/lh?=
 =?us-ascii?Q?fCGYrIJ9DaFFmy/hLyPK7Z8+4oodePSVCrzIRSCwSB3e09SIZhbBmL+bBTOq?=
 =?us-ascii?Q?2H6lY73vPNrwVXACiGbvKZnjpNFsD1WrfhvJOmnN9Q/oYwjjqwUmdfZ2ZDE4?=
 =?us-ascii?Q?tRAPQZAG+z3p5Umhgl+gedox7P+DkhldQWvEn6E1KtKzKlzNS4fB84cZAs0K?=
 =?us-ascii?Q?XYwv7DU+k1O3xe2yTAfX4rIYUlqGXV1aACmhjkcBEC9XO7hAhh78vrGt2is1?=
 =?us-ascii?Q?YsmhMjDOCPSNJwrBDw5T08AG8gUUI3P0IeyNSB3WDUF8azI2ng28NcEKrDsS?=
 =?us-ascii?Q?o2VvTcqzhweQHBZW3nahMT3Px0CJD5ERCi5KdlrtLcRW6OqKPRW8uWi6e6+x?=
 =?us-ascii?Q?h7iJ5ceNIUWpE7EHPDzo6tqy5gD4l8xnqCEiPntaWxqQuHoSin5rtyZhh4ms?=
 =?us-ascii?Q?CJDn/ljtXnstUvhXlOjdTd1ff8crAlhEJWDTwJxACr7QWb9TCwZe516mCypx?=
 =?us-ascii?Q?R3v3+iYDYzL9VFz3kMoOfcW9lUhP66XJWRSX+fvJv2nj9rL/dxiFN0gla00r?=
 =?us-ascii?Q?YweLxp8osMd8V98uT8T8BZRxnJ7nYLIsxq5Amq1Y/0ykB+6x0PeEfjomlZsQ?=
 =?us-ascii?Q?Ic2nyG2tTKs8Papo1i+qt8H5oyIaMTVVHMi4/HaHxcdi5kqI7QxgcXlzBMxG?=
 =?us-ascii?Q?6H+I1Ii38YcM4uxQQJVVDm2kvxFALhFS6jBSfu8aIAxTwA8U35+AuUH7oPpc?=
 =?us-ascii?Q?No97gwCiYE2c6AA+A1pkMHnOaJKpsN8u0C8RXnK41VAouiEqSddocMwuPof3?=
 =?us-ascii?Q?AsRPiZwfenWa1MbW6IPMBMJu4eRtcm7HBnPFrVqfE+19Rv54D0UHN9YY9Qx8?=
 =?us-ascii?Q?6AJZwNpzscbLnb2sTb+PhTsUG8WtOkm/hGyRH2zbFBDd7EWMKM6vBf37AMmE?=
 =?us-ascii?Q?miw3ioYARU4AGwoc5urr+pt0fKWb0fJPnmCT/AWC+QfOMSZfPGNqMoA7RTZr?=
 =?us-ascii?Q?4Pct37asnM+nb7XzmfSptg95SIem9EWwvm3LrXWcI48+MO2WiKV1Ef65pB7X?=
 =?us-ascii?Q?i+Lk3gypcrheo93L2DWtJtichgTsFq/Ewu/vb5rAxPL9a8e0BCQOjXMyyPKn?=
 =?us-ascii?Q?rAVrRI4Vb5e1U1EHk4Nd+YWWKcJHXxLVTKufre69CW0LFpwsKN7dCKGvDXoV?=
 =?us-ascii?Q?y9Q53Ee9W2nmjzfS3rXMkvjGMInvr69/g6D0WQHu9X2wvizRPoLHVHku9UsV?=
 =?us-ascii?Q?25loCyP6iplmM5JArAzqAj4L1PicyRYKkh/MjyW2SusSzd16CiWqCd8mVYx5?=
 =?us-ascii?Q?Xe5ZHSVAho6lUoojBAWQsbwVhu8Op1D3bEiqTfPIXG05I+r5Supy9NcCnL8Z?=
 =?us-ascii?Q?mva3y2UD8D0u0I21TYh4aXLx5y81dWjUnM0aIEzw+JBctY1KMg+6onwQbxCi?=
 =?us-ascii?Q?T1lZ+x7mpQNWOuTUY+xS4rCeNwmcaJJB048cs8pVRwmcU4vZzdq/56eqve3S?=
 =?us-ascii?Q?zE8HC8gkkRXvV8VafAFC3pQhMhlKEEtAG6Aa6JNMwJfhOSkhR3PMPibq0p1z?=
 =?us-ascii?Q?Mhp98Gt8lw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfe9979-f427-4701-5579-08df3356f3ad
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:47:45.9036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJqWMv2Z8fhZr+FBVjiXeHhbwXJxngqY8nAHr6wAsvRg4aujjCQf4Xh3OadU5dWVbJCB57AGjGOnmw5ZBQYGBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2603
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 11:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248676
Content-Type: text/plain; charset="utf-8"

This concurrent.futures ProcessPool test starts a worker and expects it
to be stranded within a 30s thread-join timeout. On loaded autobuilder
hosts under QEMU emulation (seen on qemuriscv64) the worker process is
slow to start, the managed queue get() times out and the join exceeds
30s, so the test fails intermittently. The upstream test is inherently
timing-sensitive (CPython gh-119592), so skip it like the other flaky
timing-dependent tests.

[YOCTO #16466]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-devtools/python/python3_3.14.7.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-=
devtools/python/python3_3.14.7.bb
index f917edebd8..d89da0431d 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -353,6 +353,17 @@ SKIPPED_TESTS +=3D " \
     --ignore test.test_asyncio.test_eager_task_factory.CEagerTaskFactoryLo=
opTests.test_staggered_race_with_eager_tasks \
 "
=20
+# Intermittent failure under load - this concurrent.futures ProcessPool te=
st
+# starts a worker and expects it to be stranded within a 30s thread-join
+# timeout. On loaded autobuilder hosts under QEMU emulation (seen on
+# qemuriscv64) the worker process is slow to start, the managed queue get(=
)
+# times out and the join exceeds 30s. Upstream test is timing-sensitive
+# (CPython gh-119592).
+# Bugzilla YP 16466
+SKIPPED_TESTS +=3D " \
+    --ignore test_shutdown_no_wait_max_tasks_gh119592 \
+"
+
 SKIPPED_TESTS:append:libc-musl =3D " \
     -x test__locale \
     -x test_c_locale_coercion \
--=20
2.43.0

