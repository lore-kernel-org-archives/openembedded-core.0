Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14290.1795701412551658694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 05:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=u0DvEaCW;
 spf=pass (domain: est.tech, ip: 52.101.69.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEAw7pYnay7Qnq+qNC6HWkGk/6M5xJnn/ur8wmN4bbagMdeonepr1XFky0hJJJQmV3ljIEUPEwkwpIiu1iT+yQI0qBuaONa3ZuqVdz4MTkCsi0xp36WV00J6TNrv85HmC6JPFqi/IPoGtM2maQuMM8dzrQjdYtzzQkPMpoSB0TYq83+7s4gMsWNW5B5NfZJc647abhRHIqyH70m/b5OO3DX+/RMzcsB3SALBBYZMEnRpLXUi7ViF1bZh+BHs2gCuRUQB1eTX/fueLGBhk+1HkxQ9LyCwMEB0dcvdww4aQTLiwb9msE58eSm8G1LpqPQKvRQulfR2sX7jVPwTb6mGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpt/EmIFe9kvkp8qi05BOlZYd3rMtATu5HtfdRX/xu8=;
 b=GVamz1WBtD+DFWzPvdQ1knYKvKh2KcN0UOMqqWldnx9Z5NyjjH88t1sOfzioVM+lWuUdl6R0yKakLi+CANkN1MBa/UgCU6y6qrOv50BPjp+2v9QxSDyLjPAG8Kt73R/Bof6UFzOQb5qXv76uejIvnhxxcYJNQkh8RZ01aq1dfuZJ928RPXL1H1ZJWmcl510WSTOTlExsowKY2BGe/uT0uuKK+hxgDL/Vf0a68wDB3K1BKGyoN8Kf6Sx822UwfZMYeOWnIaYsfxNSQ59POM52NHbIil8RfgT1NZYz4wno/qJy4ESSnTdyIZnehJ/o7946tGBzvDPSXnLl62/XLswveQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpt/EmIFe9kvkp8qi05BOlZYd3rMtATu5HtfdRX/xu8=;
 b=u0DvEaCWVpq+c2I6w0qv420Bm7V0hh3SwUQHoNZVxIUDTRK2E8ELJHmTzpbvRTFHl4z9MY9rQ3gp+5DFm3hNO4TWvI3sRY/w0/8OUkMQqYRy1r4NRzMKiIuNIQP1wGjtqK80s/9iHF7IkuGPjMqpMvNsW5uTiTzixVMlu7hT55ujbi6Kzo+pQMEy/sf9iYFrzedx7h+PnMfBxtRKhjZPxXbZADCHXq66JG5WU+zzv202HTMkoyS88D8RNd/Kyk+/UK54KZERi2B8MrXCNagopSnAwdyJ18hBTmlYEAOjC0qEQHt56ab6mHJcJjT6OHrsvqy4nMiHxVPh2t8NIRhMEw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB1107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:56:48 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:56:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] glib-2.0 upgrade and fix for meson
Date: Thu, 26 Nov 2026 14:56:43 +0100
Message-ID: <20261126135646.90796-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0480.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB1107:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9ee8ea-8846-4419-3c57-08df4bc51d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261021135927099003|261026140227099003|261022075727099003|261022105027099003|261009221727099003|261009223027099003|261009223327099003|261009221227099003|261009220027099003|261028144727099003|261102123227099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: ryhXkhRMvjKlDI5CsdKCVR0NMe/fubq6668PCjuX78yxd77g04xBRYlcxEVgCPt1rjdFrUlhWknJsOz2YG8iC/GlWerlSGvnawNH/3Bf5eRk1Wr0nOzbNSx1g37MNYa3oLQRDKx89ts3mtiilYml3i/mhHalPG80vw7VjiJeXdOImARiR9YE8FSY59tp4uqeWRRBawM9VtB0U6hhULKUj164MnvsPdJ6jrdZWteV1fXcb2HcRJ9H0h0+e1vcw32HtzE3ULz1jg87Xu+JaXcINUrMTNNpPamWC7L7ezSRNm3MLVEBCkVCW/oTrPmiM0jdzij7te4zZpNnEeGnsxlGLwOIEYJvcxw+pMq33q0EHc29p+FI56KVCHGa53oH9Qh7t8/Sn8O2ZXPfRWQpyojxbjCXAHKKF0qjL9mxueZGGTt9syg3YQTffivozyiW8qmELER0gaqgzeGMxlZbVvx4oo01JM1Fmh3teW8GB7fn+1UGFng4KknTyyZtNf9uYr9ibfBVhLsjjzir1XyQjhaDC7N3KoZa6H01G+FkIa793MwHf7Qna6gIBcJJSEkQfu6afjgx0L6HfTABN2daDFcjLOueGeHW6c4hEgciQu7iekEzcI4YPvbKMSkTAHevmU2+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261021135927099003)(261026140227099003)(261022075727099003)(261022105027099003)(261009221727099003)(261009223027099003)(261009223327099003)(261009221227099003)(261009220027099003)(261028144727099003)(261102123227099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EuHkEpyOuJ+YJ0rDZp/aN6bWiDcR7tf3XLn8MlH3Rgt3o8ZKkIeVBv1ZKx0L?=
 =?us-ascii?Q?OLkLqgpXactIGg7cc3wQ7yTU5C9PI8scnd6kYFd36AA7aCeC+rZNgygdFp7a?=
 =?us-ascii?Q?ePc/Mj9v89hCmMPitj/B2qygjwDSxvYDmc41RmHcGVj9geszWUifmYDUc1qe?=
 =?us-ascii?Q?+DDaQv63QXhxDSSlAhMBTXfbvXHIQ6mD8RWEhi2hbp+FDbvmYvpmdBVs5sPl?=
 =?us-ascii?Q?om35+OuSqwv4uLKQ74y7TmvqkLvGl+jLNsk10hT5LpOChBFJrz64KsJJRedj?=
 =?us-ascii?Q?+qog8OHVr95hpQs0OBF5pRYaw0surie2D6joNFT7kje2J+84EYNe2IvWYVYE?=
 =?us-ascii?Q?2haIYn8frzlkAk+EPo5YW1Rm0Vkmoy7ISAd4/jJXL6poWNhlvSRZvNz/f/sN?=
 =?us-ascii?Q?/HaKom9zxl6zKsDjOBjPnZFkwNDTTHYUH0d+1fqZG22YrMoCO18Sd0oG3l0Y?=
 =?us-ascii?Q?a3fD0et82jAipiBmruho43Oe5QGHvBheN+TTyjyC9QODoQ5RC5e4KYffBGpD?=
 =?us-ascii?Q?lF4CYnIuPxGcXa+vvaLzf1PVm63K2Q7WaQfEDBff2XpMz180cQf9RRzgokEo?=
 =?us-ascii?Q?wWFxMdW7oQnIdA2NQsCd0tsNbHlGBMYELqovhLzhHTfcAIf1JwfvdgHhyMc3?=
 =?us-ascii?Q?XgvXa4QlHICYyz1g3fgOSsjvbgnoM08+JWpsfEg3ml6/sl+hVjk9+EldllQY?=
 =?us-ascii?Q?l2xmwY0mN7ygE20rCq6scm5G8ErD5AQ8/iEDe8n/Fh9CV+Qpdk4F6OtKUcpb?=
 =?us-ascii?Q?V/JXpoTgpMCMX61wYJNlvdlyhGR1vDEUttCozEmlyzKuKyvzWbNVsVYjvaGn?=
 =?us-ascii?Q?5MM8r4cuYrjg3TBIv66f41om35wQsTB+YFWKKfGeO6GMjWhLfX06xsLMsJfi?=
 =?us-ascii?Q?HCpLeRhvJ4SykXU1TPCpl3kvI69T68damtM09HuQlendOX5GwtFT0XhYIASB?=
 =?us-ascii?Q?q0gDjQiWDQqrk7A/afVQhBNH8JvdsGBaRlL7QgZ86/Pgk+pZun0kVK0KQE6n?=
 =?us-ascii?Q?7AVqeIgHyirRL5kcGdXR6Z3q2inqDeKkIOgiAGehrsRK01v+OvgGmjRPu1Mp?=
 =?us-ascii?Q?DodVf+HOIK0/CqWB4FzuYEDVLpRdjNoggapftKT89goTWfXk+ZEbkCwPk6r1?=
 =?us-ascii?Q?4VWwZN9HwQb47FdooWrKTsg5XDOG04OK/RtSd/DdtE2K6I8eV6BwcAg81DpY?=
 =?us-ascii?Q?+frMBCau7ON7pTHufeyxJVKoXan8UmrOwkj0rk/bfQn5I1e/w7VGGMaLooKo?=
 =?us-ascii?Q?hDI4Ph7l/5R6SFUfvxAFnH2bGjVcnQpFLVtSAXxuTiOCocOmDKi9uNd3/BTN?=
 =?us-ascii?Q?dzV49JSJNCl24SE3UwLOEWMhZWFiwXbsya68HwyV8ieNQ4nm6i7kb/W0yN7D?=
 =?us-ascii?Q?X6gEiqv9TZXxMkyUhqWJaEdYf4GPer4yPfe2tHVG6R2Cxpeos4klWsnX/pfX?=
 =?us-ascii?Q?bxIpPfxJ2H3qji2v9Bs27vHHtvbZvFygjBLQY4DIDlsJ1y1cdchw1V5Y49pt?=
 =?us-ascii?Q?eZHs8sfCJr7KuhRmTj92mcJfflKiRqwBRTZeFHKiWROV347QSTWR1W7DXKl5?=
 =?us-ascii?Q?yhfdSr6PRivVotPg6mxsucEhAEBclIb/UZozmOjqHb7Rc0oxYsLq73StPRBT?=
 =?us-ascii?Q?XuzAm3vg3U5tqqkKE9nCG3xrv7VhBsV94ClFGDbgshu+XRdUUlvvwiszs0y3?=
 =?us-ascii?Q?65tKhvtTt5otBb8z2qWOcAAasdmxTD+ICs/cDa8LW6z2BBse3K5zP0Enb1Ay?=
 =?us-ascii?Q?NyhGe7vatw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9ee8ea-8846-4419-3c57-08df4bc51d3f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:56:48.2699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yT8+pXF0guFJV6+1eA9/nzzTAZi/E0S1GAGCe0/Zvr8sB6J7D3cXglHDJ9sehDeCcsLNi/n1R/nyM/QOT9T9ND6KhgX7oSnvHUvzDepeBL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 13:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251303
Content-Type: text/plain; charset="utf-8"

In upstream [2] discussed about meason bug and fixed that also in this seri=
es

This series depends on [1] from Khem Raj otherwise ptest might fail.

[1] https://lists.openembedded.org/g/openembedded-core/message/251248
[2] https://gitlab.gnome.org/GNOME/glib/-/work_items/4068=20

Jaipaul Cheernam (3):
  meson: keep can_use_env when merging EnvironmentVariables
  glib-2.0-initial,glib-2.0: upgrade 2.90.0 -> 2.90.1
  glib-2.0, glib-2.0-initial: Upgrade 2.90.1 -> 2.90.2

 ...t-write-bindir-into-pkg-config-files.patch |  6 +--
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  6 +--
 ...ng-about-deprecated-paths-in-schemas.patch |  2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |  6 +--
 ...-prepend-library-path-for-g-ir-scann.patch | 50 +++++++++++++++++++
 ...on-Run-atomics-test-on-clang-as-well.patch |  6 +--
 ...ot-enable-pidfd-features-on-native-g.patch |  6 +--
 ...dcode-python-path-into-various-tools.patch |  4 +-
 .../glib-2.0/files/relocate-modules.patch     |  6 +--
 .../files/skip-monotonic-time-similar.patch   |  6 +--
 .../glib-2.0/files/skip-timeout.patch         |  2 +-
 ...l_2.90.0.bb =3D> glib-2.0-initial_2.90.2.bb} |  0
 ...{glib-2.0_2.90.0.bb =3D> glib-2.0_2.90.2.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 ...se_env-when-merging-EnvironmentVaria.patch | 36 +++++++++++++
 meta/recipes-devtools/meson/meson_1.12.1.bb   |  1 +
 17 files changed, 115 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-girepository-Only=
-prepend-library-path-for-g-ir-scann.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.90.0.bb =3D> glib-2.=
0-initial_2.90.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.90.0.bb =3D> glib-2.0_2.90.2=
.bb} (100%)
 create mode 100644 meta/recipes-devtools/meson/meson/0003-utils-keep-can_u=
se_env-when-merging-EnvironmentVaria.patch

