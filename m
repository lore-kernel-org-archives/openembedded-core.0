Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8722.1793357096603141579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NOHQ0NBX;
 spf=pass (domain: est.tech, ip: 52.101.83.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfEPaxsxCNCMFo5Q9e7khmIA/qYi9a9CkZn369p6ojSdt2Uc8WZw0dNBuHt0WRtECnKe/tmUrAXa8m8/1OiQMLzsmB2VVdpawHZceTFO/xrEUCC/mc9Qqa19ermPR0TTkrsESVHJDfAlt/yTvyJEe84fur5R7ZLWd6lNSI98AQwWtjKnsQ+l2cnF8MNskXWt/RxGf8d7bp8Q6s3G/+QLKH6hYGqkq6mbNyH8ZR9CwIHHnKOi7GK8/lW+6qzv9E5kI1DnZlrahzLolkJyCRyxJ/T358LIDuBEa4lkpZc8A0GCF6WVWH7klx3l6m7MOcIOBrJ1cFKeOx0V/QjLT+mg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nn0ylsaz0aL3vRnY68hXms83G76QNPRKbxlI+MLPppg=;
 b=SPCuwMwXfXy2WxViZHJSQqBZ2dM7TEynAmjcj9e+5iUKXscc6d4frN/hYX2rkRDORx3GUUBhsTuI7KWRK69nlA5Ik8fkS0xrjSm/Y6mbBQvV2meYDmVc1pOUZYUUY0sp10z1eoIpziRLe9BI9FNrJ+uCQEklXLDG6p3f/41+umuw49DNMmD9ovwvc/LKmemcJlRLxPruf4+8VRgxSPPJhHc11CzggYaKyMAZF4XTbiU8xbKxbTSNXGa8gpAl3svI1NvaO+HbGz0T2zJIuRySU5uKm1UhFO861QE1rWgpC+s4cu7yCEa/SXxBSIDd+NWZDzQRBgGWjgwxJMJnPolupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn0ylsaz0aL3vRnY68hXms83G76QNPRKbxlI+MLPppg=;
 b=NOHQ0NBXwGNK5ZfM/iwlgw3jV+4RgATUvgMHr8dMVYn/7B8Pzm3sHinDnYtscGroIQKSccqP14DcN6Uxw5pjzvFh8o/0VA9PNbqEofZhffa2pU/mnzm7Fq4qJSjc30SC/o+gBkkBxCnR9bZxHgMI4vYNMYfq/1q4CcVdkEYGHwrBtSALF3TIbayGCluBhzSTRdzOSj2Di7a86U2Jg0wxKHJcfxIQrzxo7BAgE9g2MjJXfB1D8x1BmRTasIVyk88W+TmZ0C/qT5So+qK5ppfduGAMJ+Lyqtp2OhLAjDY6vSPLq75NOpKdU09lT2PA6DyB6+Pv3C+7p035seyKXFiR4Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB9P189MB1882.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:33d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:44:52 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:44:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] libx11: upgrade 1.8.13 -> 1.8.14
Date: Fri, 30 Oct 2026 11:44:36 +0100
Message-ID: <20261030104439.18901-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
References: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0290.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::25) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB9P189MB1882:EE_
X-MS-Office365-Filtering-Correlation-Id: 080b6d22-2eb7-4056-b4d2-08df3672d3c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|6133799003|3023799007|56012099006|11063799006|261021133027099003|261022115727099003|261022075727099003|261022113327099003|261021130227099003|10067099003|261021123027099003|261021135927099003|261028144727099003|261021121427099003|261022105027099003|261009223027099003|261026135527099003|261026121527099003|261026130827099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: r43PGaBIXSedcnhJL6u3k7CznBKqde/2pLIXUo9Bn8Lvz58JDxOy2Ds63Efh50YFKKYTrRvnq65GWtav/L0h8rVb2kWEjTUOeU40H1xZeFXNjf+jvh2kkdXADzlMorLFSOTfD1oZPV/k7P9aguFfb35HUM+DPA/faJ7d9VP3H1JcO0SRkq8urigUNlw5H5t5bSsY9BDLvGQO5XXWJBbsBPaA2WNl5RlYm4LS0BM3QzxivhOfkaWcTX939QZoUt+PjyP9FTLO4EUN4eIzXdClIYRXHc28ECE1CZ5Z+bSKi2LKR0X3umfYHp2ZyQ1sYjds80CrfoTrEf08StijYwvdUJ72FKg4xc9hCqNil4ZCpfyRtTjhl5YcbMexkLYizWEBL0E0zmvFxRNLESr/0lBkfT+I0ju9yBMn5YrmvcyYq0cBnh0n5MpfjK/37jS7XfgRk+G3/r8REdSVarf9xlffZJAWyr0QUv45sWs0T1N8RYIx1qjKR/IBOflnLpRJEqkG5lXaYwnudRxJk7H0W7sclEYW+C7OQ2jK3spZXviV5l523wZvMFcQmdxkbA52y8uF3rUyyqdYqj266eEtDrbvWdhhOghqo5Bz0enIFUFIexA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(11063799006)(261021133027099003)(261022115727099003)(261022075727099003)(261022113327099003)(261021130227099003)(10067099003)(261021123027099003)(261021135927099003)(261028144727099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026135527099003)(261026121527099003)(261026130827099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2GMvZ/5r61CreKPRlmNZwtSs/hN+tFfmCS3CliOWKVWSoTsnaYYBwax45Na+?=
 =?us-ascii?Q?4/vQ1KiMr15Yu8BWFgH935/WuurQAhsnn2aTXoiucNULmQlWfwvyCb+NnmqE?=
 =?us-ascii?Q?oCm+0ZeU3H41YQHXtpN9zJ/ylIK56RVUiNBQmw6MXwC2DBrg9HksPms5qgLO?=
 =?us-ascii?Q?S+/LA034u07DQgYt5wL3II2SB8XFGZEq1JyBSMABtcQjrMplod9ZnOLjm1q5?=
 =?us-ascii?Q?XeWCkLNsGsdRz7HFL9bBW7K8WwZwcpPtHncllBB3EO2m7/QVc3ky+wFdQM2g?=
 =?us-ascii?Q?bX6fVDNdUfRPVCn6zx4n/lz2kB2SpoewLXX0/oUW6eecTInRbjilOh10MU2+?=
 =?us-ascii?Q?ceN6R2Qso980JuhJNeVu2IyUjCiw/nL/PCGNJUD4gDlid5XMQX+mw+gb9Llh?=
 =?us-ascii?Q?JR7ZfhJszgYM1sVv8fW8sts3FM+hqBqlNHIAKVCHkozo+rp+DFpuqvfDD4NC?=
 =?us-ascii?Q?ZLIiKOyLVbeVk9caYeatbVENP/exm6cppyT2FpgYG9wNVNzUHC3YDVMbD1tg?=
 =?us-ascii?Q?OXE7OvUUAEkDUIJD8Ty4ccj58N4kX5r+OpUqxA/hyY8HyxtUCJRG7WWAitTv?=
 =?us-ascii?Q?feKGTrMszWnKbH3ejW7wfJ3yZ36ZjAT1VMWMAWuSr2/VXRunJ3LSRb17CXkr?=
 =?us-ascii?Q?XSojlrCCOFRgym1d2KZAk2L/vqEKUwlQJwSOUwsrSuLmFrqbYUN8IuHlmwfg?=
 =?us-ascii?Q?D21aN5b8QW+uo75crcmkrEOJncNm3jDysjs0S43PM6bB+hvMUdsrTn30KsCZ?=
 =?us-ascii?Q?kL1TJSmpPK2vDEfcqT7ziqyg+PJxveRXwc2+3Cj5AS4gpZqXNzhtoLuRl/qZ?=
 =?us-ascii?Q?wulPuxV427TldLFjBPYFe8rUIQns6dtG4Q+z5TVM2CVqSHsra0QQ4dOehc+V?=
 =?us-ascii?Q?oCKMR8ihc7SpiJnjePIzUzQ/sj8jh0yYZCKV96u6qT7pBmpmSk/jUSxARTtP?=
 =?us-ascii?Q?w0EMRNZL0puJKUE5UTzrdl+17MSNEwiR/QMJ7prXWhbQKugd8yNvWmOXRonx?=
 =?us-ascii?Q?xv5tB/i7DT9ES4HTGXbKp/z/PwJ78WP8xe0UYoO1xl3TKBK6ytGv/1eNR71K?=
 =?us-ascii?Q?vi6TCJu0vOsGx80bFALatfbKU+cYhERAfHLzI5Eqd8KV75BwhWuau/yeVkPV?=
 =?us-ascii?Q?ztBYbhwS1aVhNv5w+4IduZOgDc78v3t+KYg/io9iqG+HWyRurYkb85oPYDqW?=
 =?us-ascii?Q?T8BVas6L5ZlhmyF6LzUinVuPw5/wiSjAmCbr5K0D03VXy10neCqNasukcBl8?=
 =?us-ascii?Q?s0rh/O1p09DgBVowB4SFC4oa4aP8I1+YN2moaUD6M9YNLr8qL3439wKtfi97?=
 =?us-ascii?Q?HQBY79SnbuqVJChC1BczZ645aRUWtNRuEqtLykJ/9t4YahWgAx50awhk5IOg?=
 =?us-ascii?Q?KXVK7h8U4wCzu/cGfSMjPWJORkpudHjkZOkJhe7ewwP1IncN7NEJCApJWaeJ?=
 =?us-ascii?Q?KMx8lceAEjdKHXwjN4Gs2D6DkJ4n9M4Ha2daumwYCSza6etq+hNYf7LraGWa?=
 =?us-ascii?Q?qGacXULNhJYBSn/nHNsSWPw/uq09wk6dMD7/DODBPHpkPlqJPfHamkivd9nH?=
 =?us-ascii?Q?6x9/UvGzK7JsQWR0QXTautf9HIl9LAOxNc+lqX7AIBwB5ll7BJ6yFMIvXw6Z?=
 =?us-ascii?Q?jEhuXSAfF9kawH35jMl9VlYGLgDaWILHeQgAlIlqdBz7PYCDPDNWoscaRZk/?=
 =?us-ascii?Q?WxTkLYOwQwcq5Q6ukrVCCkEwhDC0dsFbHgLlxu1IP4DWFrqHEQlSiGaAUJ/B?=
 =?us-ascii?Q?Z79LH11g/A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 080b6d22-2eb7-4056-b4d2-08df3672d3c1
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:44:51.8036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Krur/U2IskEWWmvPmj6DqsvdOdKvq6wLWYRCgMPgEOiWJvxKu10E+vRJveNz68u9Q/Q3es+WanLHznE5CSMCY75Zx+RLWnewca6d3llIk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1882
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249025
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://gitlab.freedesktop.org/xorg/lib/libx11#release-1814

CVE fixed: CVE-2026-94283, CVE-2026-94284, CVE-2026-94285, CVE-2026-88806

Complete Notes:

ximcp: bound XIM_OPEN_REPLY attribute lengths (CVE-2026-94283) (!310 (merge=
d))
ximcp: bound XIM_REGISTER_TRIGGERKEYS keylist lengths (CVE-2026-94284) (!31=
0 (merged))
lcGenConv: bound byteM_parse_codeset() reads (CVE-2026-94285) (!310 (merged=
))
xkb: Check the keysym range in _XkbReadKeyActions (CVE-2026-88806) (!309 (c=
losed))
OpenDisplay: avoid NULL dereference in out-of-memory error path (!307 (merg=
ed))
XSetFontPath: zero-initialize packed font path buffer (#248 (closed), !306 =
(merged))
_XSend: treat xcb_writev returning 0 as failure (!305 (merged))
_XSend: discard the output buffer after an I/O error (!305 (merged))
XkbSetIndicatorMap: avoid undefined behavior due to left shift (#246 (close=
d), !304 (merged))
nls: Add ca_ES.UTF-8@valencia locale (#234 (closed), !303 (merged))
Xutil.h: add include of Xresource.h (#242 (closed), !302 (merged))
xkb: fix incorrect size check when growing doodads in a section (!300 (merg=
ed))
XlibInt.c: use correct type for Win32 in SocketBytesReadable() (!299 (merge=
d))
XlibInt.h: prevent Win32 CreateWindow macro from leaking into our code (!29=
9 (merged))

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch       | 2 +-
 .../xorg-lib/{libx11_1.8.13.bb =3D> libx11_1.8.14.bb}             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.13.bb =3D> libx11_1.8.14=
.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch b/me=
ta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
index d2c5f5f1422..6d358b1f434 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
@@ -1,4 +1,4 @@
-From 37debe301336cfb61e7f81e9e47e5e1019177d8c Mon Sep 17 00:00:00 2001
+From 26c415e836439d2212cea437e11cfb6396436fbc Mon Sep 17 00:00:00 2001
 From: Marko Lindqvist <cazfi74@gmail.com>
 Date: Tue, 8 Jan 2013 09:16:37 +0200
 Subject: [PATCH] libx11: disable tests
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb b/meta/recipes=
-graphics/xorg-lib/libx11_1.8.14.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb
index 42f52f3de2d..25fcd6d8b99 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb
@@ -23,7 +23,7 @@ XORG_PN =3D "libX11"
=20
 SRC_URI +=3D "file://disable_tests.patch"
=20
-SRC_URI[sha256sum] =3D "69606f485c2c07c14ef64f75b7bb326d48587af33795d9ab3e=
607c0b5f94f11c"
+SRC_URI[sha256sum] =3D "bbc78c46217174655c2b32b138ad119f3ac15f50808b4d0b3a=
2677a4b1afc950"
=20
 inherit gettext
=20
