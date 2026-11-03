Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7403.1793699143191834940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=n3hsaiIw;
 spf=pass (domain: est.tech, ip: 52.101.70.55, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEMOjgQSq0dDmU24IzJNM6RMZb6H96YHQABSFHLHoBGSBZzEJ/r+7KHr6VTiysJKj3qelLoRQuXY3i2YW/wY2kiVryb3mktigKvDMtf9/Rv16b3GwyyDEHYTH4laSJZ5l5uyH/2IwA15lw8tD2NLDsSSljz4TJ33exTjqIZgUTkGGCyVvzMg1DJCf+q18Xbt5/x2Y04B8IB1rp8X+K4OR/V7gi9iAFdrhaYcUQXV+WrMjBFL0YzQ3fD2J1hg+PuXH3VNcdC3ne5UWMvKbn51kmbDXSjpbWyvG0ecDqrbvSUmjSryh2oUDi1CF2gUurBtmYGTPOBWvvoEd4cWizRq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHXXDUbnid2Z5wXKZ3gWyOCxcFGUyoLJMGni3Sd9huQ=;
 b=WSQAoG7OsalnbDPs+TYIf8uFHR+dZhBJeVmco4Q4VpYvMSTaanizDbNu0Ivw37n2/vqo6ffSrJUiOgRuuyeCgC/Ki9zV5uN3M+GjxZnwNtV+5yFeFiiuwO2/vUg1B46XEz2TFUWkGI7y9QIGFrrs2xPTbo3AkCeBDFAFLrJzn6Zdu0Mo1qPryyV+1ISYU401AX2UgfJJxJEdr/w7VnM57kKlxvEdEX5Ip/Uh+zEs6fWMIiExKqC/Bovt9PbCLL7jG86NS1GlxOojwc9uFHRVyWserDi4wn/erLLsVLOF77eOwuAtsHNZAJGoPVRUiyU1Khr/I0TAP87uqlQwxQBoLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHXXDUbnid2Z5wXKZ3gWyOCxcFGUyoLJMGni3Sd9huQ=;
 b=n3hsaiIw5NQ66Qa5CCNdh9tKvJwnjKwD8YYnapN52nNafPDznpU4xXrdLj6daqHgruYRufO2Qe//n07E5AXgPQJ+ZVewx3I5EK+qt1PQqk41B5VMmZD4ed/SITxh5a6b4et7B1DTWjE7EWW5e/M++8h7Ga5MawWe9KWdzMNYhxqIjXa66iSuSlcyaHE/Jen/P3L7pLjvb+Jh6eMNtRBOErpINPQS6/lHYwzoWgGswDLcLmC5p3oWFgU3fC4N2Ya4LQh+d75TMyy7nBDG/mY0sCE78aMjBriaX+qkEyQa3WcwRtU3RGgwzVkzwGT6EbFgcT60cS7Dgm4cAh5kgodHKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3318.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 09:45:38 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:45:37 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] liburcu: Extend recipe for nativesdk variant
Date: Tue,  3 Nov 2026 10:45:31 +0100
Message-ID: <20261103094531.39610-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103094531.39610-1-jaipaul.cheernam@est.tech>
References: <20261103094531.39610-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3318:EE_
X-MS-Office365-Filtering-Correlation-Id: 607bcbcd-0c07-4e89-2151-08df398f36e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|6133799003|10067099003|18002099003|22082099003|261102123227099003|56012099006|11063799006|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: 94NdyOwgpit7Mg25xbQRRSuQ3VqdwHOPgnDezvge0tSYOsrL9h4PEl1CU5LAo9LY7Vr9WIxU8vlGEy6vzZ9FnMmrVQ5gumk12NexG9GELnGu0ZSr/UXd0Q8Ru6MfFemqUMqaLs8FKw9I/SLB+4qUP4dqzLNA+TyDnW0pud0jrqvdcrle/VSdTj/6zPD+2rrdMUHSOx8SIt5ifxRT4zsS6Nd8mKuaJ+PEfLuiZE/bN2NaJKtObZixBoP6IVAO5XGPrsrKr2bt1J/RFVYOvs+GR8sw5PKPyg2as+Bzy7hgJVblj/nIYoBiRZOAWGttBiDrmdMO8AyIIIUCfR/2luSJkaQyhCHoUh/eTtdhVL7+8+2yPI9l9JVXNAixKNYioGhteN6IwZk+EjI0q3jzdOHOUg1IrKraCbCwBuyfnIKh7zBSi2u5+CWnQeR8u0wDe+vh1CqjLHEm7Z5zarjwur1kYuJuoF2KjP0Naje3bu+zXNeNjVbEVUf6bSvTvSgH9iKEaG4ixjlhfG5mljEIVwpq2BY873TrHr+bNT9h4Noc6hQXggW1YWyRuFUG/GU4ykjmtorWxptZcIroaZlO3xBntbVz+YFx6GySrnO2Ov+z28l8ahRXQIFVqnVOxMFYdwELHqU65tNava2l4omvYyXoinFl91GDlYdMZjolg0VZwcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(261102123227099003)(56012099006)(11063799006)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XWwxECosXTb4A75A5VQf10nTU1eJQep4Hp+eh5xOmvJy3jrBlGzS2uCLMLtr?=
 =?us-ascii?Q?3D7508KHwOssqxVmUsrtQzVeZzvGJXBJf/2wDjeHJG7MfBbbXOIdXKFGzPeJ?=
 =?us-ascii?Q?V80RVWOYlXq+H2DTseFKHewVbKh6FlZZHQchZGMt5mT0f82u8ypGV2M/p0bC?=
 =?us-ascii?Q?1RwhjUQPLZyxrnxaNATYU1cRhLqCT7LKlrfr5gM8gARje8ljGVbQpKl7zu19?=
 =?us-ascii?Q?10JYcg09BO4smyNIYTxlSbg1Cg+bUHlhQpzHj16OxKynFPgqHodpwQjhmp1E?=
 =?us-ascii?Q?3kpc4LCahUxVBXy1Tev4cFY1/sEKlKedrgwA0/xG1KzrivzRuZ0qYVg8Xty7?=
 =?us-ascii?Q?25k6r8Pln7AFWrCi+G/T4U8pJfWjpV0qUc8tNfMluZHwxPii6H+2LWteXB8K?=
 =?us-ascii?Q?F/I4Ti+6cstIByTZNESVGd7rDfqAXPjlvM8HziMOReX6i7xAfhhFG8RjndlU?=
 =?us-ascii?Q?edMKyhr29lICY/G69QP9NMbwAWafV7r2Wg1XQe+r+kiuENkvebZpyKbEgEru?=
 =?us-ascii?Q?Vq0EXU8WEWeWu9kyjOsOeFo343psz5LD4qgp1E/+iwDG2WmXFxKrA0CyarjH?=
 =?us-ascii?Q?4IA2M//g4+avItZGkutYAt8EAJXnA8rLh/g+/hofxgppy76pyY1O/jTZgRPY?=
 =?us-ascii?Q?zu1CQ2SkjTnOje7SRtrPuoxWzONH+8bQU3QrY3k1tj6zmPbmO4uo1EhTZMbj?=
 =?us-ascii?Q?Wc5JdN6oo1R2ZZQjBVdBdJXzE4QZ4V3//MNC6gF6hx6c64/VNMTJjEiUHuck?=
 =?us-ascii?Q?ey1BTXRbji9MSU+GaIWVM5w9VfCAGbvys5kmawXM+NYrHLxsLLEiwVHpi3Kd?=
 =?us-ascii?Q?Z+oh/9qoCoh48dlamKm7phUneA5HE6j3B/ig4gbG3jH/enix02xHUGPDQMZG?=
 =?us-ascii?Q?UX+N7ilQf6WJXdaDhoZTtV7DXxu7EwLerjev4Pf7HuvRDOXRX7Y6jkh5C9AD?=
 =?us-ascii?Q?meZ4SDfT/lCNXxhqyKVV2pcq7dG/TVFHmmvSJ34+BaWWkY/L9HECjRZF0ECJ?=
 =?us-ascii?Q?A4wNutLzzNI9wF4HL+8KnO2yzCetQqXP9T0VPeoIZZ9pZuKuuhoBpVADc9CO?=
 =?us-ascii?Q?Gz6YuF+wg/EOqumLLF7um1BZGMXWwfgdAi0Xj2m9CzyCPWhW+BrsF1d62df0?=
 =?us-ascii?Q?UgrHVDHheBDzIdUiAB/HaEB9316qGw80IQQN1vlmpc6KklSqaEMnDeegZHFr?=
 =?us-ascii?Q?eXBaAD3pEOXiCSU4XI+adPKJEIs9iVj7t6WF/IVh91fCVF573OBL+xO4szGr?=
 =?us-ascii?Q?OadIpVcl0Yh9KnQOiD6HMOka6cOTcj/tqAD90zsoGO9u8Fk4br1TtAhJWYw9?=
 =?us-ascii?Q?eGzkEqYel/GIX6bm0n+sSSOcoP/yWKTHNmjiX2hZlYCK/Te5jZ89n3bBRORk?=
 =?us-ascii?Q?IwKkClUf+aAOs30bM6qkxteMdbPF8o/CfDQCVpdCnctgHiXhof6sD+F5ne3a?=
 =?us-ascii?Q?Y6zkEgoNe5BEEceCBgDHOCMdpyYylf88q9M/h9QoXguuGNt8tB7UpbU/qz8Y?=
 =?us-ascii?Q?y5QqrVLIdK6C5p3jvINidFKQyL74Sh5m/m1LKeRz5v6VptPEDAB43MsTGGuD?=
 =?us-ascii?Q?IgSDbMpSq7xXZ439r/C/DM7vDTjhzRlE5FCih4Uo4WGBK2ZPvGXbGPmoLE+k?=
 =?us-ascii?Q?IqqY26w/8tdUVK48ixQFR6JOLN95JPdup0bN0Qe4C/djD9FkXf6AVe5O8W1o?=
 =?us-ascii?Q?WUsuASHjSxe13JzLZB055KXFNpVvcDK8dWazWFaYsrNTBJYPAVr6Wa6iFv6N?=
 =?us-ascii?Q?WPNguEr60g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 607bcbcd-0c07-4e89-2151-08df398f36e3
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:45:37.5038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SlODPRQHvVRdBsTuFlXaPuNsjP8zNr1IxP0f2WU66dM3CtLccZcSHviy7JfxnoYM08ibQl/dewd31JNR9aJCwNtq5PmONY46PcmHm70XMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249271
Content-Type: text/plain; charset="utf-8"

Extend the liburcu recipe with nativesdk support so
that liburcu can be built and included in the SDK.

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-support/liburcu/liburcu_0.15.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/liburcu/liburcu_0.15.7.bb b/meta/recipes-=
support/liburcu/liburcu_0.15.7.bb
index 18cf6a2e46..60635c70b4 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.7.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.7.bb
@@ -22,6 +22,8 @@ inherit autotools multilib_header ptest
=20
 CPPFLAGS:append:riscv64  =3D " -pthread -D_REENTRANT"
=20
+BBCLASSEXTEND =3D "nativesdk"
+
 RDEPENDS:${PN}-ptest +=3D "bash"
=20
 do_install:append() {
