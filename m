Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5220.1794037503179521060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 23:45:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=z0kBTMH2;
 spf=pass (domain: est.tech, ip: 40.107.159.40, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiNzo5Vdk/dPTrc56pbOJGY+PgK2zPmiPOK3Vi2EA53ikAmaMVntxCFwQaYrt3KLhz6LNfqDEpJwJhMWN9hJr8mrVh5M8wBVB6Cswbn1XSMM/+LyS/t6bhi/2c3gJq/278n8dOq2uGzGsM9Prnpjk+FYdvnSyrII5qZPKqK9fLVsI4rkgG2JRp3R+ucGTcdSHb2Y2ImVwV7kJVLdgy3DZqbNmQa/SceOQNkiJczkGopgCEtfnShDjbLnaBNvKViE295CUlUe1QTpqJShr0FSZxsOxHNThdY7ClGBygfZsgjgQmpcKkGYipPDWwqK/zqWEP8IaxXsdEBPcH5uaMz7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4hYIisMUnVypXzvFdX442XzHDA8YeMKrUYHEr04p+c=;
 b=cbdPdnZZvSxzEi4tqHHO84wy7el7+Vn23aioczNkhTxrlDCukdKc3XrZBGIenuNW7xq2ZzeMiCx7w8eQ179TzSSBQGm8asoCiLrR6C5xTweEW18NTEVns8s4Zn2P4zOCRehqoPztl+5aroWatEUDgtW66aj1taH4J3gbuiyGSWkY4zJfTHDABzdurD8XSK6Z0KkDDmpQZ+svkxKFilBXWfj+WJ10iFS1lHyEeW4aB1IJLNvHzBSzjaBt+5SUVdjKT5lIO7S7652/Oc3/U9UzKH+mHSV0Mlp+WiHktwSIVLkI+e1r0aqfh8V7auvU8yZ0Ia14AOgnaoRtPxrSoraB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4hYIisMUnVypXzvFdX442XzHDA8YeMKrUYHEr04p+c=;
 b=z0kBTMH23NBgKstvakEvWJ3hxkCtGpUxIl3pONIssE6175jgFFwmyVbdgPyBtIenOJS07+t1aysGEez9gwg1xQddbUjEqbf1xEBt05tfgAAqLXZEHvTePsi2gQaKLVuTpT07y4toLcFo+A2pr4/Vz3geVzhoJgIjZdCLn5ZYa9+dOqJdeT5eegddny5eUaR1ghABH5j2RvD/7a/qpZnwDZy92a+I+parksoIJ56m68Eu0w4oIYbbI+VKbjsWrSj2dxUjQZe7GbLUaB/6qoO6+Hh6QEqOWSno3Xymk3vFlY+F3tnqslsbb4FvrOn7cQl4OZZpCO+YdEcGs5jJTwq+qw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAXP189MB1776.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:138::10)
 by DB9P189MB1857.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:326::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 07:44:58 +0000
Received: from PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 ([fe80::53aa:751:3d59:b6b7]) by PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 ([fe80::53aa:751:3d59:b6b7%6]) with mapi id 15.21.0592.010; Sat, 7 Nov 2026
 07:44:58 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: tim.orling@konsulko.com,
	Anders Heimer <anders.heimer@est.tech>,
	Henrik Nilsson <henrik.b.nilsson@est.tech>
Subject: [wrynose][PATCH] python3-certifi: correct license to MPL-2.0
Date: Sat,  7 Nov 2026 08:44:55 +0100
Message-ID: <20261107074455.2001836-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF0002394F.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::358) To PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:138::10)
Return-Path: anders.heimer@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP189MB1776:EE_|DB9P189MB1857:EE_
X-MS-Office365-Filtering-Correlation-Id: 32857ac7-c762-4d2e-890d-08df3ca305eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|261021135927099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: evARvD48k2yNLYuN++dZ6VpOVdKPqEFp0mPqTTNaTwjs71n8QDsknr9I/3P+Z5E3Nlnyk3jz8owgCjbi0jLUxFbEWrHayvGf853ENtl+CgnJo8Y2tr05u0AApJta4OPxRMKrNBzhbLpNqsojwUNHsRmTs3WiJXT5w0AcEVrcReb7qAHbhkiRdIO9l/Ugq7sSGNUJYTe/IzSzWapLS2P/d79pp6pVmQCb+W4tMELKIQbfGe4YLmHGszX0+jxVnkCg7GC460TMxlvUAxSW82PYJheeet7guYlA4sShNXA3495ZQ8ad5uj3j3eanieM7aWULVyjQQ/V7QK+Ai7wyhA8XmEM9H8tf2iiQXOmYAyakYA+N04sm3GIY8dTdL+l402Tk5psMCDZAEJDzCZh2OIiDS3tQQ5x6KEE26flsV4qjFR4A0bT2en+Xt1WgUJ9YZQhwNUXCicwpm/Uj/X/53gdZIOcrmTHlGrhMnzUNmbyaLfHaZf7scCJjPHHIn8AIf/CnBBuufYtckcoBaRTPCoaE8cCCzVYvxreAuskDNG9ngd8qfwxC+EX2OwFl6/G7/QcHyM749lt+lXTkR7Q+dZEwlc4rwv+c+gqheg+mVUP2T0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP189MB1776.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(261021135927099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KF/6/RYGisB5eBHasgm+JH3UVDJIXPmIyiFAIkd1AmJqg6vQO7FEvvCqws7N?=
 =?us-ascii?Q?diMulrBOGod3t3X1mK3TL/1NC3myH9oXzu3qcW1Go//2caXA1CIZKPXHVyJb?=
 =?us-ascii?Q?MyWsNkiyYy4rWsUUm5aBmwp9gBg7B4e2OSE7XsSLF0qWeLiYxU7NoENXSM53?=
 =?us-ascii?Q?Gr3aucrs6ZDu2UwGz3p6qBnx52lcTkrX4tcWz6gSSUUohoqG6/NPgFYSgij/?=
 =?us-ascii?Q?FdyZt1Pc4H0szeKyozB5MAVcREz173SSIBJKJZ5NTLgCY74+IueLH3pHRVwp?=
 =?us-ascii?Q?RBnQAAGOX89xGWr60pzaGvP5X4bi0favPm7zrNPHMz0jmvm/B5IDEVcbmKBo?=
 =?us-ascii?Q?Z20D+QyJEM0PHKhtjO++bX1GD5+nulMagkViDnEqms8ZPI49c8HxPb5rymuK?=
 =?us-ascii?Q?FVF9RGNEtGpkHv0Ewo9pJGyMSKT8wp8Uc6c7vi+3RHg84UEC7TXuB2hQPiJU?=
 =?us-ascii?Q?SVbIaol6YGuIvIA462/vr7EVBam5Sw5XAYW3YzeMiHBuRJB0jCXV4n6lNSKl?=
 =?us-ascii?Q?tOFITD1mqlj0q6xoSpl/bqAPrumIlXnypD8qbvcKrGAkf3228ymjOiVKa9fy?=
 =?us-ascii?Q?jHkCOW+2XAMdkSMGI5TZ4Ehr3XnuKZY/+KXTaWl6cMbfTgbvT3amlj/NPwPS?=
 =?us-ascii?Q?8MHj84cGtjIQO+g3+DGtqyvI++3ewqW2wdVH3OsqoUeDJC5hGYYSaezSPiFW?=
 =?us-ascii?Q?V6N12kc1EaGc1UfaZJPH2YFXuEvTYeu0jBQRTt6ChPRnL1ojCojkjlc8XWvd?=
 =?us-ascii?Q?oCX4wjcX1d5kjSu8rqeOMyOIBvMs9arLZ7o4xgSuVKfx0sGdVb0Ba1XFbUHi?=
 =?us-ascii?Q?uV5IXMn9O928E/jsd9nUUT2W0YinWUgBH13j6CcTsLqFbNNIy/TYMq3vQ/sr?=
 =?us-ascii?Q?29LCKycmmoc2mARamfCvOOShBXlolp1ljuvsbMxI6JXG+hRsMpJEl01mLZz0?=
 =?us-ascii?Q?ne/DALyXJ7UQ7vODOFNDdNB7CUnMtB8PIZ9MRhwYhO0X3ZjsqMj7UOntbRXh?=
 =?us-ascii?Q?fwG+C/FJRr6gy9t7pXjClSkCSMc2h9b3iEGlZcPQ3T2XxKtJmYaBumzdAlzd?=
 =?us-ascii?Q?LWv+yBy/IL5kd75Pa2FDViEBdAqKbLPTkgb/QLUFSAE5Cxwn6Q2d+qvfVXl0?=
 =?us-ascii?Q?Hav9+f5e3+o/vnWayChBl4Ycah3hOkrGZLuEU3o5KDMwzBiFNagRVPXkMPTh?=
 =?us-ascii?Q?n4WOGtQHZfv9/IxDk6vlTSm5a3vz1GkPlE0LibrQrWbLUeIFaL8jJpXaVlH4?=
 =?us-ascii?Q?AAI7jLPKMCoEH8gkc0ObFxTJVTHzqe9lDCx/8SrTMsDyhpULPKKZLn4vn+L3?=
 =?us-ascii?Q?VYdDyzGl3XvO3it5tmaShomTyF3JqUH6UhOAV/MWYcGhdj4XmhkOXnaj4HVo?=
 =?us-ascii?Q?yHmBJUPDKNLHu7FIbR9H4LQ2v4cRN5Eoq9lO0lJ3f2Orz+N7P8PtBPyD1SUf?=
 =?us-ascii?Q?nB3BN4xIWo9ThbFKD8do2YIHPMuC7b5WTPpx+JMIV5APOXqA0s0sncX/ouim?=
 =?us-ascii?Q?7NgL31giPPlAg8mHxLOFDfl0vytCFRYItIOJ4+pBPXpElTXBRoIP1T920PGy?=
 =?us-ascii?Q?n1FeYopGXw11eA/s0drtIZKGLSORAPirKeTO0TMzDu7nQaYWlYUd3AJ767b6?=
 =?us-ascii?Q?9M0eX008Q1MbUssjb472pJADESm+sMMbM1WJRgtw6s+t833kNgZXXj29lxzm?=
 =?us-ascii?Q?LfHjM8Y6cpXj/6FYWWL9UQdu6JetZvjQwCBHQ140I7My7fmr0ijnefibUI6p?=
 =?us-ascii?Q?wi2qw25mgA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 32857ac7-c762-4d2e-890d-08df3ca305eb
X-MS-Exchange-CrossTenant-AuthSource: PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 07:44:58.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQrTxKFVx97hECbv4/Mqvrjc2MHi8FvAUPr/jvK3YkTMf/2wgKGF2MJbFtxs1QYiyMxEXsmDimhPQMCgBTf8ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1857
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 07:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249738
Content-Type: text/plain; charset="utf-8"

Correct the LICENSE variable to match upstreams MPL 2.0.
The LICENSE file and checksum remain the same.

License-Update: Change declared license from ISC to MPL 2.0

Reviewed-by: Henrik Nilsson <henrik.b.nilsson@est.tech>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
(cherry picked from commit dc95b2df65be00643f280a5ee9c885131f001263)
---
 meta/recipes-devtools/python/python3-certifi_2026.10.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb b/m=
eta/recipes-devtools/python/python3-certifi_2026.10.19.bb
index 0a3ad7dac5..e71d34d531 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
@@ -4,7 +4,7 @@ Python code. This is useful for verifying HTTP requests, fo=
r example.  This is t
 which ships with the Requests codebase, and is derived from Mozilla Firefo=
x's canonical set."
 HOMEPAGE =3D "http://certifi.io/"
=20
-LICENSE =3D "ISC"
+LICENSE =3D "MPL-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D11618cb6a975948679286b1211bd573=
c"
=20
 SRC_URI[sha256sum] =3D "035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075f=
f8d2fea780a1ae"
