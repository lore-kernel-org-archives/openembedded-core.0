Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5214.1794037608751438045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 23:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=PJj0Ehep;
 spf=pass (domain: est.tech, ip: 40.107.130.17, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixWCi/yKWJ7obTTtkvwnOfm2+vfgXYPaSYYUJJ7H69w8UFOz58Ln3jgL1E1WmGNtEhvvhe+UoTr6O5f38iHGf+rktX+cdmkVNFJ2jTeCNlzFwot2IUFPnItuyqXVvF19QrB2qH4Vb4vOYipv86SsGHYZ1emraNZso/jV8s973wZynnLKNW2dq6L+zEaLU7NkTgsXvB2vfg8uXvDiyiy3FG8QuQZEI5mwxxCS2bLrZz5yNF1zhgVLWyRUv4o4RdQ/2XP87UoHQ9qz7GdX7IqKT1YP53RbmNsc2WDrc9LZqUHqIclP26GCYGTDA8g0n6BOOzo5/T2TTPKH2kMomsgoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wde5hsUSLETIc4XVwz3B9VMD9fNtwEB6urR0bWxBHWI=;
 b=STXeZ7GZBcu0dnZRhc2cw0qU8l5/y4CZn/IDMUy9GzyaDiwHolaczAo6qqIV8D9lbLc43SdQjdbqDnxHJA48LNizNk9Ai+OvqHPLpRFYojuUUI1wWiLlPA5TwxKUq3e38fmwFoTYBUqqK5OtujXYnMYQE1+1oPMG5psQ4EBDdGBurCK4100Y+lA78h8a0SizFkI05sGwIm6mZLQGlNRidrMf7xpydNT5o1LI4pLX1ZO9yolZ9CIZT7FXBxFFprdP2ivylHr2Kgj7I7gb3svz3Oy9TORMeTrbLE76xOmLU+vPw17RWqjsOb9Ff9iSXI97lfdKcKIQJaGmVhdwEpVyEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wde5hsUSLETIc4XVwz3B9VMD9fNtwEB6urR0bWxBHWI=;
 b=PJj0Ehep95mHzJDq8RssUhVKMcFsBiWoaoFngpzu1Tn+SExx/9Byz3k8Otu9HH3JVf8HY17BCB31ZAx/Vn+YIyyzgChwsFU3HhzloyofRtdL6amnnPtdAkik6Jyp/h4AM18VlEVhEglHrghrd3eapyJVoowgRaTalvxRxrDBlZHThoJtzN1fEU6O7zmhyMf4wM0hEGicXmJMamAZEvYp4ZNIzc1Rfk3Em3X9r/alTUIh9yiFkVpILoLinB+QfX7bfTzqJ9MKjW2JzwLhfYpm/dLfIjWGidbN4k+IbqEnIFOqWocwAcvyhTZhgZn6jDC6OWtonk8nTjoVjCxU2EBaag==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAXP189MB1776.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:138::10)
 by DB9P189MB1857.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:326::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 07:46:44 +0000
Received: from PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 ([fe80::53aa:751:3d59:b6b7]) by PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 ([fe80::53aa:751:3d59:b6b7%6]) with mapi id 15.21.0592.010; Sat, 7 Nov 2026
 07:46:44 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: tim.orling@konsulko.com,
	Anders Heimer <anders.heimer@est.tech>,
	Henrik Nilsson <henrik.b.nilsson@est.tech>
Subject: [scarthgap][PATCH] python3-certifi: correct license to MPL-2.0
Date: Sat,  7 Nov 2026 08:46:39 +0100
Message-ID: <20261107074639.2005592-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVZP280CA0073.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:274::14) To PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:138::10)
Return-Path: anders.heimer@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP189MB1776:EE_|DB9P189MB1857:EE_
X-MS-Office365-Filtering-Correlation-Id: f578a242-4b66-4fe7-20f0-08df3ca34513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|261021135927099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: rdwH/9pM33P9GzwLobr8aMDeFJlpkH5k5uqJov0R36MAqbunIcbb4kROzpZBx6Gg4x5zIrlAl8+f3B3XTwnrXokQ1aHuo6WUYulV84zACeK6zg7SENmYe56j7+9jCVdDEHi6XqjiUCzS5wEq/+rIfdOLUdv57B+rET/mG663UGMRHP6ihDRwB9SSAgBBekO5tB7p5rw2y/z2JPLW6n3zd8OR4mUEwdoNrSI8h1T2yudVV875s3bXaixWo1dzyV4IZGR4tPVvTGRPoCI+uIGB+1bKprKvXnHFqv3LU9E3/j7Ks++RMKqqsUeWxQXa5s815FZyL/xIrynm1rTM4VOk2xAZolkOSDLHgwADaoKfRhp9u6T/hza+gjUkCV+Tk8npgnIdjkiJdD64lCjWLTaO6FcJGa7N+A04/CCrDzO29UI9edJyy0mLMwW3j6iFf2nxQ8HFnEazMn/mZVrROltXZowDT36InDqmURKsxZK+AcxgRWmmf1EnPjX4gT62aryQ8SzunQhHNE+tdi2OeYfBNcXkgjwXEiE+TCEJkuiZWka8UxlC5lKOYr2Un+ahrrSoz2OxwJM36PBaI3lOHiyASrIRdN2VEWzCNdd/SCeWDdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP189MB1776.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(261021135927099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p3NHOOZMLgiLGW0C4sHTWz+xwSIdwtRlQ7qMGAj/TMnG9Mft1Agf7XEhwBS/?=
 =?us-ascii?Q?G378TUUs2PDzuw9biWwnmGP23U2R1AxqErBqWAabAL4uFQ71J5KRpBex/7Xi?=
 =?us-ascii?Q?O+KqwWDMBONzsiKSUjBzOlscVi5rWeUBZZZF0n7dgY8RIFO3oUw9HM4Sjsa+?=
 =?us-ascii?Q?2KL22CnH1qAjIIwbff2liCHQVvFCsjh/yfhIrTwh79ssl1Bv7LO+kpuan3ED?=
 =?us-ascii?Q?G81on75HTN8zCP8651JEYQtJ/VuVa2PM4mc6RuA7r5m3iVtDlDQExsb3L1iX?=
 =?us-ascii?Q?GMGz5G9EUhTOJR7rggGyB7E9VCN/dieyPG8IsaS2wRaEwww4nykY1RRcppuU?=
 =?us-ascii?Q?ux0hSUNGmIfZlQq5bXjPAoC7rarhA0UukVi/FTQ/cKxV+BLc04O5yqZ14lwr?=
 =?us-ascii?Q?G9/SniqNaK71BBdqElfulH++xtIrjuarTwAkfztWGvl/hIQJNvlZaZooZG10?=
 =?us-ascii?Q?oIXyJ6WEIihEPqCavyGQyX/VoGs7+HZwiWKhPQ88U0vwc9fnQEROLyVeCGue?=
 =?us-ascii?Q?M4C47RNMuFDYUlrUJENLBLYYqCqpx4hFsmiXFD2lStEv4rpvQ1kjXuK4NYo6?=
 =?us-ascii?Q?3wXJnAwXw4iz+8xddaOSfxUUs12sWXeNHhbUMdvtiGz4Z/bBJziVSM/3gp0q?=
 =?us-ascii?Q?/Zjp4MHH7OT1wiU8f4nXqQjSSBSCblGu3vRo1G1hRulKOsCXBwxcOjJRgcY8?=
 =?us-ascii?Q?ZyyVH+lBhlgkAA9caFhtlamnk9RnJl09C0Hg/q5zmz/T7C2034qYrOsYZFMP?=
 =?us-ascii?Q?NfsHw7F9ke5XSN20SNmpgBVm5nRcq5NnxZQTM1Ayzg+FebRBX1T1Mi5XZaiN?=
 =?us-ascii?Q?pJ9tvMyoUFnZSojvSTY67aw0g0Odd862iXKMitKxHAGaRiozC4plMtTa7iBY?=
 =?us-ascii?Q?jzZsGtESpIJm1TAMDTUKb2MDlQgW2pb8MIB+7z8x6Vs0yNnPCiHkU3fjuWgq?=
 =?us-ascii?Q?9geeWuietlF94bjjcifh8ccIZGHORfr02kWUim0FPO1foBhKsK1XmipdKeS1?=
 =?us-ascii?Q?IiZe5VbBy2yK/rhcG8UPdOzeE/YS1B/v3wp5uCahRdh15Y0nkpqpKM5GYPSl?=
 =?us-ascii?Q?OXnQ3dW7wywieO0E+0rcpYZO1ZpHgtJF6InUVmf1arBWQ2raWYAQ5Fhs3+3T?=
 =?us-ascii?Q?gNxlvXrdog8ydaw4GzLzJfjrmlC1OC0jraGkjXCJcMrDX8maq20dk9hBHTv1?=
 =?us-ascii?Q?hGzpeIyHnPu1B89y8KTtGhp+aXN4Azyu8Gus/LGifA0Xl6AN6+OhBzaRfij7?=
 =?us-ascii?Q?4/qhO95rmV3jrVq0GVzNMmQ/54uHkSxl2qpgmXANaR87YCkfyWwSdcLRvvgG?=
 =?us-ascii?Q?Ac6alRhG/Sza4SW+eIOeHv9gG4p3cuUZiTHsGrkXeVmiZZOjO6S8dNhHEWo+?=
 =?us-ascii?Q?WmHDub/XykpshwcxuTKdAH5ezXWZZ/65bGopbFcH1jIo48VJCpC2UDsH4k3F?=
 =?us-ascii?Q?k6y+AJj3+5/5qprT781VCKmGhm7mlLLQaAY8bv39owo0gSZhBESwKQ7ya84R?=
 =?us-ascii?Q?oW8bK0qSoNnXVZ2K9wo7kFYGbRGyZeot0b8nfQPkNsDImQdvzxWP9t0kQcaQ?=
 =?us-ascii?Q?JoM7UNEeAZgFAO5UX4NxtoTArIC9WIMZasa7cz6fwxNSL1H8m2uaK3nom9mT?=
 =?us-ascii?Q?pJGrpMd+aw6fjFepCX2wz6mmSVNb5fv9Q3IPGuHEiwQGvFcB/R0egka01+gE?=
 =?us-ascii?Q?XH1o2Gjp66sSbyJftlSGPgekqYDMl56nwm7nmPIq9y0/958RFEyWil7lCHot?=
 =?us-ascii?Q?iHo6Hn6jzQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f578a242-4b66-4fe7-20f0-08df3ca34513
X-MS-Exchange-CrossTenant-AuthSource: PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 07:46:44.6778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JO6YcFo4tu1AxixOXsWCjeiK8ER7vsWzKSsDxbF+ciuJkDdCKS4+34pCAjyGDSlHry92OmKT2miXlTWak8ZiZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1857
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 07:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249739
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
index 749894f56a..b80044b399 100644
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
