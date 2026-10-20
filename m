Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2672.1792484782702116704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 01:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=LfcCwv5o;
 spf=pass (domain: ericsson.com, ip: 52.101.70.43, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiNSP53XR3TKyi4s+YDKJ4/atp2fo3xzHincfC/3egrYVS8DFDN9C3TfZMUQx7kFGkiD/MvlHsRsG58+KhzUB5f8yWzx4u93ZLWDoMKK+CrS0G14XGnTMdJGd3YCNNBux2f0fBh5ML5LEQN6ojLQz7AtgIbQ31LSmhMPM3SkKrahXjUgqhVJJo/NnYjbsg/Brlt51T/OeRE775xTR3rWqCpCWPmEHwrLGVweW8Psd2nzH37MISJYj0FSY5EuRQCPRXIHigeUfgmjipvQ9nAG0Fxdnd075LJJvReZ0B0Vd90lNm0led3kVPR1kQVmZpEhuM9CVQgXEDgnBZPsDc+k5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7ftkHwi/DteMO6laEzTeTCnT9VFRMnEKSh8QwchqSo=;
 b=pSoO/7uXKoZrlac83QBV2HYPHN1j8mhWxIyvjBMT5adcBzMK9bdYK1Hg2cb84G2vIX4QyM62ZbcLeQJx0JBhCTVIASkdG66qlRIudHjwFscuFOZTmj2LZrXi8Ne30CFQqQPvG0BYJeGjiLFo3RV0NQ710Ob81MT54pwFO1bCS4X8qyLlPDBgBfVhcqmvtvtzmq4VjiNxGylyX5AsI2SbOmxBBS4VZTqT1E4HUdyoFvxLEWyykGZMQtu9fL098H1IQ/7F6abSP7wUWiyccUcug5BTySfzYA5gTPAd0rdZhXb67cIDt+NRASzhqXE4nNvBZvA0Ugx1VrDmuXNjBeaFfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7ftkHwi/DteMO6laEzTeTCnT9VFRMnEKSh8QwchqSo=;
 b=LfcCwv5ovAeI+JAcv6iOrJrlL8pxRO1pu12zKP5KmqR5dpvbJaUYQvf05ce2n5Dwll8G+iVPGFJQwalLngvUqgqOdRNE5hM3JcdjJq5uM6kAqFm61lI2OSCaf0jy01kKBnij3BMEf6IEPTOX/i8jJZ9lyHCnaVnMRiPwEUbCIbXi/LfTURago4qsM/NzNRaxHWz9+hIImYe2a1WrEXYd3faBtxTBOHPbBcjPgAq+WUd5sat+xPWj0WNrBFK+6NJboKDaewVzd+G17uFalmkj/5TzGf+kXgH+o7h+PLwXMd/yFy+/Tgc2P1J72gASDsdGoC4wYVck02UQDqFzcwPLFg==
Received: from VIVP296CA0020.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:354::15)
 by DB9PR07MB9932.eurprd07.prod.outlook.com (2603:10a6:10:4cd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:26:17 +0000
Received: from MA3PEPF00000408.eurprd04.prod.outlook.com
 (2603:10a6:800:354:cafe::a9) by VIVP296CA0020.outlook.office365.com
 (2603:10a6:800:354::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 08:26:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MA3PEPF00000408.mail.protection.outlook.com (10.167.241.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 08:26:16 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 20 Oct 2026 10:26:15 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 963F44020B42;
	Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 6B2607003EA9; Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH 2/7] glib-2.0-initial,glib-2.0: upgrade 2.88.2 -> 2.88.4
Date: Tue, 20 Oct 2026 10:26:06 +0200
Message-ID: <20261020082611.3115623-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020082611.3115623-1-daniel.turull@ericsson.com>
References: <20261020082611.3115623-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000408:EE_|DB9PR07MB9932:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f103145-fab9-41a5-e041-08df2e83cf74
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|261009223027099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: r4XYlw8ggxU+JEwm13+MAgjpnEcuXm9eUjz/fxQ8c5yKRffbsbmcZf+Tn3ZP056kAVwdlcBri/9rH6ThJ9H0phuG1HQCVN+UCwV72WXSaWub4TgKpEjnvPvDYBzQc2KpJ6qV/TnDMjcCXEmRu4lLZuQuyqGOyfUsgVG5JyFToip9C7qM1U72GP4E6jQ4y5qaLMB17zUWtxd9UNQuyJwQ/GTKzDMz6ZrbCaYl0EXdH9me5QxL4WJp9Yu2D0wNznj4vZbgXvShmClBkC53KB5NIyGqwVNLyiPpDbc/9Yvu/+780ob/s8WX8oIQL9gGK4aqOMxxHYp+Vfv7UlrckwfPxSOuEywKP07y+Ih14eHTlklX0c4TFlWYgq/uizwOR2raGmIGsC8kCiSpMqMasxXOh6A1gYUWLlMS1Z3dMzFXhIxByz3DENWAUDrJZvR+FCFBVlxrn3/LkQJRrqyK4zZ5K3hvFyRLxcgoWTc0jaPPatWDEdPK9Tf4RSL0cCRvEImtufDBcYMPiMqSavCo6XqviPGSwBWfwA3cTOhQRaZJTHHS19uJ5V3mUDW/YstUssf4L9bvf4fvob/MWmli2VECHpBDsol4hj/GGh0nTiwz/495eKRHSz5pfzLGIO6hRi1c5Tt5ql+QyZ5M3ByEJvlwRntBbIfdPzh7sCGgGgcvipcc4P86JJwuanTrKVc6TAl0OAySZ5jc/NgKt/j2p4Xugw==
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2PgIU40uR28QYN7FmzZ4+YN5FdGUmIIs2oa3YN9g/ZhDNA2fNDQ+Vv7sYZ/ENjIQ/kTYk1hruQFmKo+HmPav+50H69G9Fn/g9K55F3tYYwYO4eo4bChXKs/hWVj64Q1naITrxGEbM84fteQCJOAl0oE0dxYx9QM683IUoO37JFdbCBjvAQzGpThXHOoTBZxYA6EmLI54wtT02GPnoXKTdiqEVAUXq1cNn4mSDyGV/nyP1/oGn8HkUmcB8EkLXgTDoED83deRTJw3qsyixAi9iRsZZrhsrKhqhPATYb4z8/SEuNfftaKQZR0hwR/5yAxeE2mdcZU8aq/nwuoZPx4b6fBKSrq/jTLGeDE28bsfbvVaCq2SmiguCqGvoENfszsCS6aDQmvTijdvJ6EM9psSQbongzVi0rxOh5ve7Ihw8ozWJVChZV0VK+jtr1gSCvDO
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:26:16.4883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f103145-fab9-41a5-e041-08df2e83cf74
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: MA3PEPF00000408.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB9932
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248246
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Changes in 2.88.3-2.88.4 (per NEWS):
- CVE-2026-15588: GDBusServer pre-authentication DoS via unbounded
  SASL line buffering
- Security hardening backport: overflow/bounds checks in
  GSocketAddress, Unicode normalization, GResource, GVariant,
  logging, and GMarkup error paths
- Fix miscompilation with GCC 17 caused by G_GNUC_CONST on
  get_type() functions
- Fix handling of long filenames when moving files to trash

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../{glib-2.0-initial_2.88.2.bb =3D> glib-2.0-initial_2.88.4.bb}  | 0
 .../glib-2.0/{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.4.bb}         | 0
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.2.bb =3D> glib-2.=
0-initial_2.88.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.4=
.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0-initial_2.88.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.88.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index cad74f53f7..7e7725f9bd 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -242,7 +242,7 @@ SRC_URI:append:class-native =3D " file://relocate-modul=
es.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
                               "
=20
-SRC_URI[archive.sha256sum] =3D "cf3f215a640c8a4257f14317586b8f1fdd25a10a93=
cb4bdda147c0f9ad88e74f"
+SRC_URI[archive.sha256sum] =3D "25fd169f3b2f91fe2391ad297883ce0fcf30c69fc7=
89ffd1c9672d1332b1c5a8"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.
