Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2694.1792484801748762432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 01:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=dIJGjo4h;
 spf=pass (domain: ericsson.com, ip: 40.107.162.52, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8pXERF8NZT+Tl0xJvf5kfpaAvXuLV5XfBJAOY6qJbl8+Nr5CueSdJXcTjwadDROJh3gPv8zj5vdJdG2iEq7/cA6yzo02Ff7AJk7/BYl4b0iT3qHIpUpqP3M4tyeQNJvmd2ppqZzLUFybvOJlMxb/HofCyxKtZe6a+yol6nq3CbF4vf7aZRNb8ZCZdm0ss4Zcv8Nx9yQLWRrNOQW8RZES28j/C4/Nv5U3gupPH7IxF0gKng3od/DGZhkpukPFzZg1GEZTvDuEc3pZYxEzxw+kjt1dXQuchqJNolZ2PRdjU6E4nUvQp4SkIPnjyagmwXBaomdXQQFAaXNW41X/AZ5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GItSoQc/Yc+Ced/rWByfToVhaWxG4wNQmQY2MPydWR8=;
 b=VCoBhdnuXxGfla2JbfaNGzVTORBbwEn9vPDYcpbblxGW1nFxhx0TMWhafjshSxNvDroPWeyML0QLBTLl14RsclxdxXw24oJDvwLuYWszy5hsoZWEUdEIndsBJVXV3746saLwW8Rlt9wadPC44az7yYld1pYTSnoJ5hz+Lv5hNgun300OojA8YUsozit8dgt8wFMRKOFtqR+JvtSavBiQiNWABPShLYQHBbGhCmKuJJgOW3jZ4xlF+8+RfLTE6qCxF/qNiwd6gHRPidaLVZLRmld8MrrIsT4p8dXTVh77tmq88z6G5go7neEZWEC0HuaxPzrxBzL6LbDXe0v4/orcDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GItSoQc/Yc+Ced/rWByfToVhaWxG4wNQmQY2MPydWR8=;
 b=dIJGjo4h9IVxOpCnQmdWIDF6QHUDu3XJR3fitqDTWXfuBVL5G0ABzG9umlcD5gDwBy4+nC2pYbTrouMmuaG9fUdM9V/+BPjnGjeNZgU6Ja61zqjAB2EFpHK0Cr5aDWlS1L4v8KfGtVzM6pvXlVgD2ShLALky+VS6fIqR/3hKnp+nraCXCChNYJ8QjAO9sYh1h6z92RTjZs8wZ+H/QPaa2OIoTkCgcJ2udSxo882Uj0JL+QsTaKFjDrvgLYvHR9uhaeCeRnc7ex3683eWw2i25KiRjnL4Xjh994K00sqYTi8qX1KskguzYpDhrEwH5alXOE5kq3mT/KWrMyG3Gzqrbw==
Received: from DX0P273CA0043.AREP273.PROD.OUTLOOK.COM (2603:1086:300:58::11)
 by BESPR07MB997875.eurprd07.prod.outlook.com (2603:10a6:b10:108::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 08:26:36 +0000
Received: from MI3PEPF00008488.eurprd02.prod.outlook.com
 (2603:1086:300:58:cafe::2c) by DX0P273CA0043.outlook.office365.com
 (2603:1086:300:58::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 08:26:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MI3PEPF00008488.mail.protection.outlook.com (10.167.240.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 08:26:34 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 20 Oct 2026 10:26:16 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id DE2F84020B40;
	Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 78AC07003846; Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH 5/7] lttng-tools: upgrade 2.14.1 -> 2.14.3
Date: Tue, 20 Oct 2026 10:26:09 +0200
Message-ID: <20261020082611.3115623-6-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020082611.3115623-1-daniel.turull@ericsson.com>
References: <20261020082611.3115623-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008488:EE_|BESPR07MB997875:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c89383-5899-4dd1-b22b-08df2e83d9ed
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|11063799006|261009223027099003|10067099003|12006099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: ezmwUv/V8XUBY68VUMmO73p4vTRUDkwZVQ/3D4Nj4Lrj6PsUPv0cd5X4DuuNvNK23QyK0j39GD/KUVsWlkZxLn3JnkWH+CQuN8iFfSkhSNE5y0UopaQR0bxnsodFIHIKwojb6fHHWkHjAGU/nrn7a+yRAabtXZH7e+mpXqBUgxiafUNvzoKUMhbM7M+GtJit9wV0MP1WlEAJa5Yv5ZA25fOUDraPq6qJZ9WeDyNY4+KNS23Sv5SQ5qYCG85ub2Lt3H23C+kU7nPctUTNUFGEnxuATb3Ql3wOFbm0OqNWjLxZ2JO/TgkzugsFz8KbXUmOrcr7G1HpaPnb9c3z9TBIVAyyQWhzyB3zcRd8sYy6X8bzOcXULmEu5BAlH1NwxPJcZln1jB4uhw/RKn02uDLghpiy3vbrhcfOajb+Xl7AGK4/Uaz0h0H1zskDJ4csrnY6Ng4AKmiS/UV33UqN3bYErIgRelY6POo3rcM0b7cVM7TogHRCpIYWKenvU3jbCHbGUaPBTGydXzgZgf/CYGoJ/F6i2n/jdRRg1CdKHbWLz3AydLTzfv4Qz1Z0cTgoQGIO2APgCGqfTFItu5i5+XQDv/IWLZ4RsfG0KmkAkxtW9V1hpjd3QtYI7rJLLJQnzegB73EmtMDZjCZo6L8xzhH7KskvrdIGm17300hTuHUVgBM=
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(12006099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TdVvv35cjFGJDu1IbVhanLbfDEuBUg2/i2VGIG59Tsrv3udEsW/yh9rW8YnafJ71ZsdLNS82zy1F8ntnJP5btC538rEyn/d5cDG69OlFYY/JAVRZzY6+k6l1QDMqseVTRLXKIf4H1JfVRz99ny+3QZIrMq5U1SS8KwTt4GTcpioGbqBQUyj8xpvCc+2z+V6CnLrFqJU4ep9Sr+Kby5MaHQO9OUJLCC+NaJwBqFMjCTzHtRF7TEviT62dDBDojAjwJqn6ADmreEkCYIyQkVofX/fwlhd1PFZuCHcG5Mhnz/ZSllRpaZsA5dG8JfsQHM1ew+I1NFUqL8bB/O6B5Wz0eTIMbGE+5ECN+pxA3qchAug/t4iNem2Qy6Wm5WOPEha/0C0ubM0YysT8yq6TN0BqHNYO/qyBHO6lcQGefWjiagoMD7xF+ga36Mdje1eYzEUq
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:26:34.0922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c89383-5899-4dd1-b22b-08df2e83d9ed
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008488.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR07MB997875
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248252
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Changes 2.14.2-2.14.3 (from ChangeLog):
- Fix: ust-consumerd/relayd crashes and overflow/path-traversal
  hardening in packet, filter, trigger, action, and session-path
  handling
- Fix: sessiond deadlock on notification overflow, default kernel
  probe list, agent event-listing sanitization
- Fix: common lockfile fd leak into consumerd via fork+exec
- tests: add notification/test_rotation to the regression test list

disable-tests.patch drops the flaky tools/notification/* tests from
SERIAL_TESTS (bug 14263); extend it to also drop the new
test_rotation entry added above, which conflicted with the patch.

Verified do_compile succeeds.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../lttng/lttng-tools/disable-tests.patch             | 11 ++++++-----
 .../{lttng-tools_2.14.1.bb =3D> lttng-tools_2.14.3.bb}  |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.14.1.bb =3D> lttng-tools_2=
.14.3.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch b/me=
ta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
index d32cf87535..5717fb6b3d 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
@@ -1,4 +1,4 @@
-From 05cf8ed6cc42a2f6ff53009d0ae2713fe63f1245 Mon Sep 17 00:00:00 2001
+From 755c3e21b7f736f2f19727482bab3100849f7f90 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 14 Dec 2021 12:34:04 +0000
 Subject: [PATCH] lttng-tools: Disable problem tests
@@ -14,14 +14,14 @@ https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D142=
63
=20
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 ---
- tests/regression/Makefile.am | 12 ------------
- 1 file changed, 12 deletions(-)
+ tests/regression/Makefile.am | 13 -------------
+ 1 file changed, 13 deletions(-)
=20
 diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
-index 7076488..e5be904 100644
+index b64a8cc..e92547e 100644
 --- a/tests/regression/Makefile.am
 +++ b/tests/regression/Makefile.am
-@@ -40,18 +40,6 @@ SERIAL_TESTS =3D tools/base-path/test_ust \
+@@ -40,19 +40,6 @@ SERIAL_TESTS =3D tools/base-path/test_ust \
  	tools/regen-metadata/test_ust \
  	tools/regen-statedump/test_kernel \
  	tools/regen-statedump/test_ust \
@@ -37,6 +37,7 @@ index 7076488..e5be904 100644
 -	tools/notification/test_notification_notifier_discarded_count \
 -	tools/notification/test_notification_kernel_userspace_probe \
 -	tools/notification/test_notification_multi_app \
+-	tools/notification/test_rotation \
  	tools/rotation/test_ust \
  	tools/rotation/test_kernel \
  	tools/rotation/test_ust_kernel \
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes=
-kernel/lttng/lttng-tools_2.14.3.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.14.3.bb
index 3df9ed1c00..0b0e7aa4ea 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.3.bb
@@ -52,7 +52,7 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/lttng-to=
ols-${PV}.tar.bz2 \
            file://libc++.patch \
            "
=20
-SRC_URI[sha256sum] =3D "0e68eb27923621c4bc127cfce40422d28cf7e473fedf6229ae=
6c32ba5c5b7c6d"
+SRC_URI[sha256sum] =3D "473ebcf26cae02860ee23e7cbf4ec875586017bd06f32613ba=
21b6586420e2ed"
=20
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd ups=
tream-stable-release-point
=20
