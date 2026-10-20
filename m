Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2686.1792484783478096864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 01:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=nebwQvky;
 spf=pass (domain: ericsson.com, ip: 52.101.70.46, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbjJxm63liXgg6R+18QDqFWKyWCQwktJJPn6oci9mj6pe8fgLgPTukIhQJGW+PxvmikgdDTHBaqDZlNMjEy69szf4th/qlfnDJFy7nqH6vHRyLEZGADKEavCmzdDgxrepYyBibWopQi/ItJIdqRA8jrfd8zbaE0c8fXFE16HAErjHKqrMV7LifKTYo/UlPDQ5hO+pL4COVAMln7iIt9/r7xjprodZMwsAlHmWBN/ODbK47/B0I/t5sVlRQFG1SGwnO9/rQ3l3buPxy+gYCutvww0LYzuLkaXfyJcXPfaZqQsBdwx23oSTlR4hOGJJVszEB3DRgxMxRNQh+pugrQYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaCf3lDN7EQVkuHIxJr7nk4uSndd8ELhQjTRCq1HgY4=;
 b=t2TU3CDtSR46n6vbvWizzUsKJ4dAHFCkNyUiOLWGSvNK98D2iEvuG98U5dgzLE0LcIqGEPaPl9u37CWf18CsBlLmjupe3wRc9PGOmQPyhGO/o8KP6pOyib8VS/Y2AT8ZpVgPzp0In2+ZItRW1vck0/cTjs9n+4m3Y9msr6f+Plx05sT+vwQ4gjXs+m3VYnG4RWRSjwH4EGZ2Iz0pzqIyBKKoS9/vkQVQvaPgxrAk5ZT1t/3zJ06pzn4WSzgcTNeQVeaN9+a7SQTscy2Xep31SNSIbOzZmnyDxhj/BEboTC7T3HrAJ+JYUkGH2GJVWLIWrTrcpppbpsNsSDttU7btdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaCf3lDN7EQVkuHIxJr7nk4uSndd8ELhQjTRCq1HgY4=;
 b=nebwQvky+o4Gg7llBXInT/Ni0hu3GVMF0NPgLkmnj3Stm12rLv9Nk5TwEIXsbXR1kHGSsez7sYjH/1uF+tUC9x6Bqc6MJ1sBVG6xhwvD/VODJ87DACh2wgTB/oBZxNjbqS9FovU8zrh7DPoPFkxOaprf7iIveKaabtoHXYG614Y/dwXug2+rlp1HuXaluUB0NBsi0QrsXu7snV5GyuLuYGugqQfTtB0kFsqurnYLx+wwCAEI3uog6KsNjnDYp8naM+AeuXwydgMLGpngY0Rrxi9nzwcXoIpqlirvUZclCsG33sALHsDkn/R3K66zjui5bDAuk2PZHyIN15BiSR/Uzg==
Received: from AS9P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::18)
 by VI1PR07MB6573.eurprd07.prod.outlook.com (2603:10a6:800:18d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:26:17 +0000
Received: from AMS0EPF0000056B.eurprd02.prod.outlook.com
 (2603:10a6:20b:50f:cafe::b) by AS9P251CA0014.outlook.office365.com
 (2603:10a6:20b:50f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 08:26:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF0000056B.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 08:26:16 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 20 Oct 2026 10:26:15 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 97EC54020B44;
	Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 64963700CF34; Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH 0/7] stable updates for wrynose
Date: Tue, 20 Oct 2026 10:26:04 +0200
Message-ID: <20261020082611.3115623-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000056B:EE_|VI1PR07MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d7c6df-5cde-4150-d219-08df2e83cf5a
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|11063799006|56012099006|261009223027099003|10067099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: mrhHnuwc5NsYVGS6cgwA0A1BtuC9dcIjbOd2KjoVYUCDlYWwDRN03+eAM7Ntmt8L6+cDy/gqvhwMcZUJixn6jnlxstGHvcbVNjPXgzveJ/1gcpe9dd6ps9kKgrolM2/mbLLZfP91TrZbA6Vv+VZqpzCqMjfeMvr3TmIByeZyj0rt9w5Jh3mc8nwfqZfiYvBCOq4xw6NfdAin9p9GmtL8QM2lCg/+zgvzOi0Gt4G2JCsuldER2I/xkoMufkaMV43PajnopFuM0FBOnTykTNKBAk7A7WICA9eBqAThBYyeKT4+ofJmeavZvvtSKVxZuZ5M9DERsktnpVWQwA5pN83SeuwsvuOXfK81UzahQ/s6KdwfzCASBW09WuCuslVyMQCw8ysHOsygVDMI6+rHxVGJBwD8L7/uJkwKC6xyIG9sB9r8JEbxa+2ZDdH103aQh1f/Cko7vyCC7tWJQGF9acOkjBjSOlfbgwS9B0q7zEk/Zrmp3xB+GDE4BMHIwOPhj7yT23nt29KchesiYttImt0+eyCnNiCy8/Zja/PjKqfv6eZuImvIR4asgGYq37k9KMkd/xziu3Z0AiZ24WN8NWEZJmNZqjxtmH7WCdQrarjW/h+VnrdRVcTjjbYtpoDguNucNBRykSJ5ikWiqq3lhuMrxOwagZoKsoV4D2N1AJS/2SWVsZFbFw/E8Af0DrsVj3Z0uy0DksytWOym/OmKtr1wUw==
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(10067099003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AaW8seWVv9BLgsTfcDati9vsTrFo+fr7AEFU/nBHZrqK0nOHspw2LI6rJ5StvAzveSiCfcc0krBOmwwoXVFTtqN73OdOJtatWlfdbw3oeqZbbXnAtdMeomcoab6/u8TczhlTYzG+Vy3s3GpUK61MVLNub7WHCLpJWFuPZ29uYJ/wv3B+le1cGLYznZuksswEMziYnDkxRvmQrfiov6iZw2kTYmTU2OqdKxLYMzpUqo01dW0LW3i19zX/byXDXgLi5vKN/T0pPm1rGtfKvQzOf3YAmxEKpPRdKX8o8YUZbBJUaV2df4Ov8v1grfVr6Vn4tp32n9IcywH0FJ8Q53BLCNz52u83kpc2nQyOlQEjEzEl6/fpSF99jejBR8LU4lFGBi7D04dS/qB1hFl+W1koRAdkMZS7DBfCtUU/Wj8aH0bNAqbW5sKooaACM8i1IPoy
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:26:16.3705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d7c6df-5cde-4150-d219-08df2e83cf5a
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000056B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6573
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248247
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Following the new stable policy and the work with the
auto-upgrade-helper I did run it against wrynose for the already
approved packages.

Used AI to resolve the build errors.

Fixes needed on top of the AUH output:
- util-linux: include linux/openat2.h in libmount hook_idmap.c
- lttng-tools: disable-tests.patch also drops test_rotation
- lttng-modules, perl, libgcrypt: redundant backports/CVE patches
  dropped (already upstream); libgcrypt LIC_FILES_CHKSUM updated
No changes: glib-2.0, openssl, python3, xz, lttng-ust.

I left systemd and perl for the next series.

Tests (qemux86-64, glibc and musl): do_compile of all recipes;
testimage with ping, ssh, systemd runtime tests and ptest for
openssl, util-linux, lttng-tools, libgcrypt, xz: all passed on
both. Not run: ptest for glib-2.0 and python3, other architectures,
lttng-tools regression suite on musl (disabled in the recipe, lttng
bug 1432).
Note: lttng-tools test_blocking needs 1 GB in /tmp (QB_MEM 4096).

Daniel Turull (7):
  xz: upgrade 5.8.2 -> 5.8.4
  glib-2.0-initial,glib-2.0: upgrade 2.88.2 -> 2.88.4
  python3: upgrade 3.14.7 -> 3.14.8
  lttng-modules: upgrade 2.14.4 -> 2.14.7
  lttng-tools: upgrade 2.14.1 -> 2.14.3
  lttng-ust: upgrade 2.14.0 -> 2.14.3
  libgcrypt: upgrade 1.12.1 -> 1.12.4

 ...l_2.88.2.bb =3D> glib-2.0-initial_2.88.4.bb} |   0
 ...{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.4.bb} |   0
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 .../{python3_3.14.7.bb =3D> python3_3.14.8.bb}  |   2 +-
 ...buffer-overflow-in-lzma_index_append.patch |  66 ----
 .../xz/{xz_5.8.2.bb =3D> xz_5.8.4.bb}           |   3 +-
 ...st-range-in-btrfs-probe-for-v6.18.14.patch |  36 --
 ...ce-trace-noise-in-hrtimer_start-v7.1.patch | 103 ------
 ...ules_2.14.4.bb =3D> lttng-modules_2.14.7.bb} |   4 +-
 .../lttng/lttng-tools/disable-tests.patch     |  11 +-
 ...-tools_2.14.1.bb =3D> lttng-tools_2.14.3.bb} |   2 +-
 ...ttng-ust_2.14.0.bb =3D> lttng-ust_2.14.3.bb} |   2 +-
 ...s-Fix-link-errors-for-t-thread-local.patch |  13 +-
 .../libgcrypt/files/CVE-2026-41989.patch      |  42 ---
 .../libgcrypt/files/CVE-2026-41990.patch      | 316 ------------------
 ...ibgcrypt_1.12.1.bb =3D> libgcrypt_1.12.4.bb} |   6 +-
 16 files changed, 19 insertions(+), 589 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.2.bb =3D> glib-2.=
0-initial_2.88.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.4=
.bb} (100%)
 rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D> python3_3.14.8=
.bb} (99%)
 delete mode 100644 meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-o=
verflow-in-lzma_index_append.patch
 rename meta/recipes-extended/xz/{xz_5.8.2.bb =3D> xz_5.8.4.bb} (95%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust=
-range-in-btrfs-probe-for-v6.18.14.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtime=
r-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.14.4.bb =3D> lttng-modul=
es_2.14.7.bb} (87%)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.14.1.bb =3D> lttng-tools_2=
.14.3.bb} (99%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.14.0.bb =3D> lttng-ust_2.14.=
3.bb} (96%)
 delete mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41989.pat=
ch
 delete mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41990.pat=
ch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.12.1.bb =3D> libgcrypt_=
1.12.4.bb} (89%)

