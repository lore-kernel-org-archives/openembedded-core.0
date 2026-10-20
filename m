Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5068.1792494995139609637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 04:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=VkzQPxcK;
 spf=pass (domain: ericsson.com, ip: 52.101.66.2, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3by30NC1uZGLXmQiDww+QgphJSleJabcmycnoBInCK4lXS8TvahTggx753W5iKbfua4UrnL0w4GjGmG93g2IdngORzd/ealFElodNk4mCvZBCyeHZfZx+T/eiQsgMrxBOk5rnHQeA7sZ8652iTnTaGGs4IxsaJptdMznnYgeUH78HRKMKOPipw/UGEeCkOZDOXVYvaJIjiBOuPTQbuiqTyCu+yUTXFzHf+G1REmIXLU45ZmplFjV6TV16bAHn1F/KtcGrSrkUDjJKqY+UyLp2OHlPGKutMo27DvyYELzyPFcn97F8TFEAnervt9+X8wcEszGdolypEGvv9jFSww0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GK5US2ssnsDlsxauUfgFHHPTi6o7AxpKGuHo2bCr4U=;
 b=sHjLehR3U7tukfjtV7bGdYk3Vhw4jzv0XoJvMcCivz11jFdBT+QkhogRqJMaIkJpJ6duHoqwOa+iT2QBLo3R1S5GOe0kLE+vHSNbDGMVN1e9wWMlUlHjq1UGe04VNCXQ0jyvuElqDBQpE2IiAXgiDbDDxgwf8yI1ZOWJPSSNP8QLSneCoP4P4YO9j1PASW8TJW99AoX//cQyx+/K6h0zPD62h/r/px3oXl3pvAEIT4WPN8BAl1axWNckPSH2Ht1DSdQXyDD3d6EM/WD084c42xc/0Iy5gmkNivcq9xByTCbk9E/NV7BROkuxtREwjHWnnPtUiDHRFSK39E9r9k85eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GK5US2ssnsDlsxauUfgFHHPTi6o7AxpKGuHo2bCr4U=;
 b=VkzQPxcK3Pk9xQzrGFhe7E0fqAQLtvvQSOpU0E2Blt43XEere1trR85IjgjTI/Hbl7yUpjpTkGXA5weOfzV32x/ABZhA02DQjGhtNsUCCQVpN9aLuHznEKV6nAjykZKsfTgq2txMN4K5DJGE+1/og2NUsDCtTPn+VuOkeYFWWHIttQaTG/cNXwgS8/zYbEX+FRFTHjvxy240HwXkYabeN3aXaVGdOMrHgX+QWRLV56bVKyhaz0fNCaM67TOg+5E2PyX7PR+5AVz+ExFGr1jUSHi/CbJ3RBSZASaSVn/20MXt8L14DgPNYdyPpGQ3mYfQstITEHkeOl9QAzzKa4stCA==
Received: from AM7PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:20b:100::38)
 by AM9PR07MB7793.eurprd07.prod.outlook.com (2603:10a6:20b:309::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 11:16:29 +0000
Received: from AM1PEPF000C1AD8.eurprd02.prod.outlook.com
 (2603:10a6:20b:100:cafe::94) by AM7PR02CA0028.outlook.office365.com
 (2603:10a6:20b:100::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 11:16:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM1PEPF000C1AD8.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 11:16:28 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 20 Oct 2026 13:16:26 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 79DCB4020B54;
	Tue, 20 Oct 2026 13:16:25 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 4DD45700CF34; Tue, 20 Oct 2026 13:16:25 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <yoann.congal@smile.fr>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH] glib-2.0: upgrade 2.88.3 -> 2.88.4
Date: Tue, 20 Oct 2026 13:16:20 +0200
Message-ID: <20261020111620.3186263-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1AD8:EE_|AM9PR07MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 251851c5-71e0-4255-ecb8-08df2e9b9622
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|56012099006|260925021311599003|260925022911599003|260925021911599003|5023799004|11063799006|261009223027099003|261009221227099003|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: ScEHwon0azoyNpL0MmTNYApueTcjQG3Qq/NxkrRdF938tBNBcyVMPCyypnvrlRs9/xlu1l7ysB547llIVPZjpZvD8O1KXz4JvNYLYr32AOm83WTQqwjenA6yibEcd389gjLEVD5HJKDz4oW23lEIbfFyMyJhDSMMcfKfUUD4xgXOjvQxyw84vduGbNLtyaBvztELyN0V1E1+EfWczrBUyNnZ2zRwjWsL2s71z2g2I2FVV4tDpXuwWPeHP82keATwS++iIebYZdy80uNf7Pfi6+aM/uFuxO75G74Yo6bi8fc5fuv1XLayh2Kt7dqT0ie67F3ZfBkW0Q6uAII/cHg7NiS71skKYw0NSe4FhXPV31n7QpRpBGgkRbi+/1PsJuFQmSy4mkwmDu0/PWgi2Y4fzTm4i0d8CtUT8e3DXu2h45XTrMgh1sQYsXJDxmETAzYtemwQoIkGPTogYhV4vCuEj3DuQPG63Mz7VHwC8Fugk1kZVfdrpoVxA6SqSgVz9kGZmPujqym1CnDttVC8FgP+IPQGoxr0VCmQjgk3j2uqUiLjWzciMbLgeGbbQ6Cdl4+uT7HO9HMMOW744lYWG2Gfbt6+HCLWnkm2GhI6KjsZtTqrBOdFfsBEOOlNrQbGgDViZK2CH3POaYtdM8YvePmNov0M9uxyrwprfwBxvbvUB/UNFSc9JIq4fgi8pngjM2Ek+XA0DUOktZYR9loqJQWiuA==
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(5023799004)(11063799006)(261009223027099003)(261009221227099003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eVVRI5sHi/e0qkUGDwzAAdJWOll/+iXyL/U8ajyAw+k0ITkoTz8Q8HcFnE+KhDQWCdIiPQOc1BsfOa9QKG7Z86v5yu7/auW8M0L774b7DZm4R9SErG06bKapKqOhix/s95XadFO1bxM4KCYSOVlp8PaqdIdMoEbMGzRTR6z4LPRfZp4c+CKxq2lzqdFzkfQc4CIGZZc8RsV3TF32hI86HEw5twZzNn+34FKzO5zplK8CPOZ8bXUGh+/L1xbjZBk9zKQsc10zUyjrlCLQebu302V9jHXHAJCbM+9/d50PVcMJQ5orfcJxJaBuF//Pd/r74WqTorHO9LXHDEoCS6jMhcjM3B6vKCiLQVdXAPBBGbPdslMZp+befTlrhdslN5CzHPm0JKVl6mUQ9JBJ3iYMYReqH5CFtpi+VgN9cpuy2xfr2/EUEAsXCEG8nMd0o7No
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 11:16:28.2860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 251851c5-71e0-4255-ecb8-08df2e9b9622
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000C1AD8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7793
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 11:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248272
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog: https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.4/NEWS

Source: NEWS

Overview of changes in GLib 2.88.4, 2026-10-08
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - #4011 gio/tests/services: Installed service file contains build path af=
ter
    !5259 (Jaipaul Cheernam)
  - #4020 'TLS callback not invoked' error on msys2-clang64 CI job (Luca Ba=
cci)
  - !5262 Backport !5261 "gio/tests/services: Fix installed service file
    containing build path" to glib-2-88
  - !5273 Backport !5266 "docs: Fix gio gi-docgen docs_url" to glib-2-88
  - !5285 Backport !5283 "gconstructor: Reference _tls_used also on GCC, CL=
ang"
    to glib-2-88
  - !5323 Backport !5311 "fix: handle long filenames in trash by truncating=
 from
    front" to glib-2-88
  - !5379 Update Norwegian Nynorsk translation
  - !5394 Backport various security fixes to glib-2-88

Drop 0001-gio-tests-services-Fix-installed-service-file-using-.patch
(local backport of #4011/!5262) as the fix is now included upstream.

Assisted-by: kiro:claude-sonnet-5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 ...es-Fix-installed-service-file-using-.patch | 35 -------------------
 ...l_2.88.3.bb =3D> glib-2.0-initial_2.88.4.bb} |  0
 ...{glib-2.0_2.88.3.bb =3D> glib-2.0_2.88.4.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 4 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/0001-gio-tests-service=
s-Fix-installed-service-file-using-.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.3.bb =3D> glib-2.=
0-initial_2.88.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.3.bb =3D> glib-2.0_2.88.4=
.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-i=
nstalled-service-file-using-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-services-Fix-installed-service-file-using-.patch
deleted file mode 100644
index 755e51cdd3..0000000000
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installe=
d-service-file-using-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ed5956d0000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Thu, 30 Jul 2026 11:28:36 +0000
-Subject: [PATCH] gio/tests/services: Fix installed service file containing
- build path
-
-The refactoring in !5259 changed the installed service file's
-configure_file() to use the build output as input instead of the
-original .in template. Since @installed_tests_dir@ is already
-substituted in the build output, the installed version gets the
-build directory path instead of the install prefix.
-
-Use the .in template directly as input for the installed version.
-
-Closes #4011
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ed=
5956d]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- gio/tests/services/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gio/tests/services/meson.build b/gio/tests/services/meson.bui=
ld
-index 1111111..2222222 100644
---- a/gio/tests/services/meson.build
-+++ b/gio/tests/services/meson.build
-@@ -18,7 +18,7 @@ foreach service_file_name : dbus_service_files
-     # Build a second copy of the service file for the installed
-     # version of the tests.
-     installed_service_file =3D configure_file(
--      input: service_file,
-+      input: service_file_name + '.in',
-       output: service_file_name + '.to-install',
-       configuration: installed_cdata,
-     )
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0-initial_2.88.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.88.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index 50cdeff158..7e7725f9bd 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -237,13 +237,12 @@ SRC_URI +=3D "\
            file://skip-timeout.patch \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
-           file://0001-gio-tests-services-Fix-installed-service-file-using=
-.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
                               "
=20
-SRC_URI[archive.sha256sum] =3D "ab24d24e698dfa1e408b7bcdb508f4aafc906185a8=
b8ce72fdf79bbbdc9b383b"
+SRC_URI[archive.sha256sum] =3D "25fd169f3b2f91fe2391ad297883ce0fcf30c69fc7=
89ffd1c9672d1332b1c5a8"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.
