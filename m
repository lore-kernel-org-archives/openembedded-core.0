Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2687.1792484784475697493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 01:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=FG4Fa1v1;
 spf=pass (domain: ericsson.com, ip: 52.101.69.28, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3m5gYQ+bbxiI9xMGBO2WE0zlN3BD+gzUHzq0yj/GoC4OpwBHAAMbSw4qYssfZoCci6wNPM9IEN1xEWEZpuAdSbXi1cu139AHo3QHgLgsd+phbL31g0QFfzK+f75YU7Ze1/8Yx3PoDTFXRIWAFkK2WVpSCpADsiM6rnAWqi2dufOyP9lEw1l+kBy0gAo+W7u5JIAGs+tPGYRfe4c4Ha6DSOZykUxUsat4J5Cpn2MJTV3XcaPqwhysbKz0ebjlUa89mpEG8zB3sFMbBZ6jX02EMNTaKlYdhJSKIOcQvF3D9Eo3YvlIQyMjIDupGSXSuTD2uQFtFlJSQAot9VuDGuitQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64Pk7yO2aK9FUYFDEezzaexIMtW8U0vr0NQM3PtFo5A=;
 b=CqidxZlrghV1qwMKm3sM93qvBeYYU3iWaODS43Qwp5CbigMaEYDGiQETIXtvbdPq3f3V5fKOmehd43V0M8nwg/jUR/zIf0deThTpFdr3rOXXoJImlcZsHoWcWYd1R2IrrJ1F4WezNFPiUzbu86hV9GzOlv7PeHi0760AzD/3zse0aTCDYRkgGwu2u/ZWk7+il3pyK7TD9cIhfsbAwyCPhj7hrXglRklrLWtg6SQ4XFwBTyACN34deHodDoF0OytAU80u8ulWsFIeD2AyRTkHeijHq5FgMDYUjz1PI7AVc5gAe0tgF6e/PVOh/wrow5o7YhLU3fIxFmFS49kvyVz5DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64Pk7yO2aK9FUYFDEezzaexIMtW8U0vr0NQM3PtFo5A=;
 b=FG4Fa1v13DqQb8GjuV1VnfB6DYJ/Asr/pkJ9aU0q97KRTPS2chwVD5MTiiff5kODKH+YteK3XJIgd0trw52QgButzTIII72JHdy42dAffqu4GzaKzfQTloDrlqn2a5QNGufvd8n+eqQk+WaITenlJo6FuoYKV5aUQWvErALlD/SIheOdHSMkOafULbn0IXi3G/g0mKW6eKTvXhP+mn4ZyaF1gunn21yBXeNkwJ4CK4VXS2XjkXrSQfEJpfmdNKGUBcH9p8izx29Zjt6lQZwVru3O0VrX3qjTwd/r5fUgaIlpmB2fIH3sCZWrLVlbCx0EGkPmT5cE3SZuV9elgbESGg==
Received: from AS9PR04CA0126.eurprd04.prod.outlook.com (2603:10a6:20b:531::8)
 by GV4PR07MB11485.eurprd07.prod.outlook.com (2603:10a6:150:2ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:26:17 +0000
Received: from AMS1EPF0000009A.eurprd02.prod.outlook.com
 (2603:10a6:20b:531:cafe::6d) by AS9PR04CA0126.outlook.office365.com
 (2603:10a6:20b:531::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 08:26:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF0000009A.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 08:26:16 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 20 Oct 2026 10:26:15 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id A893A95807;
	Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 7468E70038F2; Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH 4/7] lttng-modules: upgrade 2.14.4 -> 2.14.7
Date: Tue, 20 Oct 2026 10:26:08 +0200
Message-ID: <20261020082611.3115623-5-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020082611.3115623-1-daniel.turull@ericsson.com>
References: <20261020082611.3115623-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000009A:EE_|GV4PR07MB11485:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d8ff90-145d-4ad2-a980-08df2e83cf5c
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|11063799006|5023799004|56012099006|260925021911599003|261009223027099003|260925022911599003|260925021311599003|10067099003|22082099003|18002099003|6133799003|12006099003;
X-Microsoft-Antispam-Message-Info: jHbIdmrsfPY64ZMgYQ4N1zfQ3sSKBuqq27eEWzp1b0E0hmRJ6xU+RGEEFxRaOULQkNyhdpXJdl0daaeLCFlK3ZKEd0sFtOiDttT2NdVR2IaEXRB5EPPydOCjg5NNp7uZtNM4m+tbW3BxL7O4IEfbdS/pyNh83LjtIgT7CTLqQ8wIcn6L6PARLF5J05sPlzqdTNC++wiSVN6NezGkYCW8MmNYyIt4E7nrh2BOu+fxIgUxwNXJ3Ylfcu0E6CJLvOXBt4xNVWLM8W9+U0X1VbFpXeyvBRniEXtAyqfRLFCJwtv4bkhR9dEePWlO7Q3WguthiRdyExx4FjAgicx8s1oz6qtl/P2svnFpjXd+sNkeE2uxogwxXEHN1+Vi/l5HVKeHen1Ws6n1ixyxbb5s3fznc/+u+duicEmxPzXwqKF9BGdGYdyKBvw2414r5KSFLAeW5HFXVSZmfrbJS2JzVdWZ0x3f31OMLu//qvI68JjvumFg0M1DH9YU43x1r9zRv0Y38zemBqeEWEY43yFRb3lA1y9imEnSBN54TTZuam9K5+K6eMKCRI+J7X0ziGFz0PF07WGpz8QRvlBPP9erHEXbMxtqDnVGaCkSVsNCeNTW6tDUrdzCXXADCeL1PhLnOha6hVhRcOAOSTD8+x4H2hilefuT/qFZvex3WcjSfyyg6z0=
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(5023799004)(56012099006)(260925021911599003)(261009223027099003)(260925022911599003)(260925021311599003)(10067099003)(22082099003)(18002099003)(6133799003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ijmVG1eoToZuAahPPiw1nODXDfMK6gTGOxocjQNE3IA5q8W7tbRzuijUqlGtH6LUeiHoYIN+e79ODH7jGPntNK1aSgznv71AerCwBYdlskVxmAOamJYQKSrIRMDYgGpu+NEC/G854DJRX2i3RyFRSuSG5mALCWak61b6Lf0s1AdHYms/84X+k0Tdm1zWb/ogkH98ZbaHerqGZhSSMIkcGlpbO3USvVPNWS6Pw95CCNckjiE7oQRQnzRlg9WCbtlugDwbPXTPxMsKT2rjgE8J8sU49WrvBbkxKB+ntL2admeOjiHnt7ckrP1mDegpgEMdxCRDAsVTT4tmAVAMy9pJ2hhp/OqappuvNMy7W2k/FAoDigUiyy2FELW3WduIefaQCin4v+5lL/7KdVmSWYPrUUByXaVuxZ/Sk1MRE1/FJepa2Ai0kmVPhR7JozeN/fZn
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:26:16.3794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d8ff90-145d-4ad2-a980-08df2e83cf5c
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000009A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR07MB11485
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248248
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Changes 2.14.5-2.14.7 (from ChangeLog):
- fix: adjust range in btrfs probe for v6.18.14
- fix: ASoC: soc-dapm: move struct snd_soc_dapm_context (v7.0)
- Fix: kallsyms on powerpc64 with ABI V1
- fix: hrtimer: Reduce trace noise in hrtimer_start() (v7.1, v6.1.175,
  Ubuntu-6.8.0-136)
- fix: ext4/vfs/btrfs/mm tracepoint updates for newer kernels
- fix: leaked file and fd on channel create error
- fix: warning -Wordered-compare-function-pointers / -Wcast-function-type-s=
trict
  with LLVM
- Fix: ring buffer: zeroed UUID in populated empty packet headers

Two carried patches backport the hrtimer and btrfs fixes above
(b77f94c7a7, de7ca66c797), now redundant since both are in 2.14.7
natively; drop them. Only the OE-specific Kbuild
CONFIG_TRACEPOINTS-to-warning patch is kept.

Verified do_compile succeeds.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 ...st-range-in-btrfs-probe-for-v6.18.14.patch |  36 ------
 ...ce-trace-noise-in-hrtimer_start-v7.1.patch | 103 ------------------
 ...ules_2.14.4.bb =3D> lttng-modules_2.14.7.bb} |   4 +-
 3 files changed, 1 insertion(+), 142 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust=
-range-in-btrfs-probe-for-v6.18.14.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtime=
r-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.14.4.bb =3D> lttng-modul=
es_2.14.7.bb} (87%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-=
in-btrfs-probe-for-v6.18.14.patch b/meta/recipes-kernel/lttng/lttng-modules=
/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch
deleted file mode 100644
index 662a803680..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrf=
s-probe-for-v6.18.14.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From de7ca66c797ba0b3273a217a47c8fb791d896f7c Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Fri, 27 Feb 2026 17:54:39 -0500
-Subject: [PATCH] fix: adjust range in btrfs probe for v6.18.14
-
-Upstream commit c5667f9c8eb9 ("btrfs: headers cleanup to remove
-unnecessary local includes") was backported in v6.18.14, adjust the
-range accordingly in the btrfs probe.
-
-Upstream-Status: Backport from commit ca93dc3b05fcb
-
-Change-Id: I51c5cb6345c6a1e1aa4e5e3cb9a4af2ec962ecb2
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- include/instrumentation/events/btrfs.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentat=
ion/events/btrfs.h
-index feb4f40b..e87f0085 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -12,7 +12,8 @@
- #include <linux/writeback.h>
- #include <lttng/kernel-version.h>
-=20
--#if (LTTNG_LINUX_VERSION_CODE >=3D LTTNG_KERNEL_VERSION(6,19,0))
-+#if (LTTNG_LINUX_VERSION_CODE >=3D LTTNG_KERNEL_VERSION(6,19,0) || \
-+	LTTNG_KERNEL_RANGE(6,18,14, 6,19,0))
- #include <../fs/btrfs/ordered-data.h>
- #endif
-=20
---=20
-2.47.3
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduc=
e-trace-noise-in-hrtimer_start-v7.1.patch b/meta/recipes-kernel/lttng/lttng=
-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
deleted file mode 100644
index a6fe47737e..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace=
-noise-in-hrtimer_start-v7.1.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From b77f94c7a7109e70a97bf936b72d66d611187d61 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 25 May 2026 10:38:18 -0400
-Subject: [PATCH] fix: hrtimer: Reduce trace noise in hrtimer_start() (v7.1=
)
-
-See upstream commit:
-
-  commit f2e388a019e4cf83a15883a3d1f1384298e9a6aa
-  Author: Thomas Gleixner <tglx@kernel.org>
-  Date:   Tue Feb 24 17:36:59 2026 +0100
-
-    hrtimer: Reduce trace noise in hrtimer_start()
-
-    hrtimer_start() when invoked with an already armed timer traces like:
-
-     <comm>-..   [032] d.h2. 5.002263: hrtimer_cancel: hrtimer=3D ....
-     <comm>-..   [032] d.h1. 5.002263: hrtimer_start: hrtimer=3D ....
-
-    Which is incorrect as the timer doesn't get canceled. Just the expiry =
time
-    changes. The internal dequeue operation which is required for that is =
not
-    really interesting for trace analysis. But it makes it tedious to keep=
 real
-    cancellations and the above case apart.
-
-    Remove the cancel tracing in hrtimer_start() and add a 'was_armed'
-    indicator to the hrtimer start tracepoint, which clearly indicates wha=
t the
-    state of the hrtimer is when hrtimer_start() is invoked:
-
-    <comm>-..   [032] d.h1. 6.200103: hrtimer_start: hrtimer=3D .... was_a=
rmed=3D0
-     <comm>-..   [032] d.h1. 6.200558: hrtimer_start: hrtimer=3D .... was_=
armed=3D1
-
-Change-Id: I37ee0ae0af665a51fd4f92adffb6b1dcb2ecd9d2
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/b=
77f94c7a7109e70a97bf936b72d66d611187d61]
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- include/instrumentation/events/timer.h | 39 ++++++++++++++++++++++++--
- 1 file changed, 37 insertions(+), 2 deletions(-)
-
-diff --git a/include/instrumentation/events/timer.h b/include/instrumentat=
ion/events/timer.h
-index f69e069b..dfc295e0 100644
---- a/include/instrumentation/events/timer.h
-+++ b/include/instrumentation/events/timer.h
-@@ -220,12 +220,43 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_init,
- 	)
- )
-=20
-+#if (LTTNG_LINUX_VERSION_CODE >=3D LTTNG_KERNEL_VERSION(7,1,0) || \
-+	LTTNG_KERNEL_RANGE(7,0,10, 7,1,0) || \
-+	LTTNG_KERNEL_RANGE(6,18,33, 6,19,0) || \
-+	LTTNG_KERNEL_RANGE(6,12,91, 6,13,0) || \
-+	LTTNG_KERNEL_RANGE(6,6,141, 6,7,0))
- /**
-  * hrtimer_start - called when the hrtimer is started
-- * @timer: pointer to struct hrtimer
-+ * @hrtimer:	pointer to struct hrtimer
-+ * @mode:	the hrtimers mode
-+ * @was_armed:	Was armed when hrtimer_start*() was invoked
-  */
--#if (LTTNG_LINUX_VERSION_CODE >=3D LTTNG_KERNEL_VERSION(4,16,0) || \
-+LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
-+
-+	timer_hrtimer_start,
-+
-+	TP_PROTO(struct hrtimer *hrtimer, enum hrtimer_mode mode, bool was_armed=
),
-+
-+	TP_ARGS(hrtimer, mode, was_armed),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(void *, hrtimer, hrtimer)
-+		ctf_integer_hex(void *, function, hrtimer->function)
-+		ctf_integer(s64, expires,
-+			lttng_ktime_get_tv64(hrtimer_get_expires(hrtimer)))
-+		ctf_integer(s64, softexpires,
-+			lttng_ktime_get_tv64(hrtimer_get_softexpires(hrtimer)))
-+		ctf_enum(hrtimer_mode, unsigned int, mode, mode)
-+		ctf_integer(bool, was_armed, was_armed)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >=3D LTTNG_KERNEL_VERSION(4,16,0) || \
- 	LTTNG_RT_KERNEL_RANGE(4,14,0,0, 4,15,0,0))
-+/**
-+ * hrtimer_start - called when the hrtimer is started
-+ * @hrtimer:	pointer to struct hrtimer
-+ * @mode:	the hrtimers mode
-+ */
- LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
-=20
- 	timer_hrtimer_start,
-@@ -245,6 +276,10 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
- 	)
- )
- #else
-+/**
-+ * hrtimer_start - called when the hrtimer is started
-+ * @hrtimer: pointer to struct hrtimer
-+ */
- LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
-=20
- 	timer_hrtimer_start,
---=20
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb b/meta/recip=
es-kernel/lttng/lttng-modules_2.14.7.bb
similarity index 87%
rename from meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.14.7.bb
index d0983f58cb..8a6ab93dc1 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.7.bb
@@ -20,10 +20,8 @@ SRC_URI =3D "https://lttng.org/files/${BPN}/${BPN}-${PV}=
.tar.bz2 \
=20
 # Use :append here so that the patch is applied also when using devupstrea=
m
 SRC_URI:append =3D " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOI=
NTS-to-warn.patch \
-                   file://0001-fix-adjust-range-in-btrfs-probe-for-v6.18.1=
4.patch \
-                   file://0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_s=
tart-v7.1.patch \
                 "
-SRC_URI[sha256sum] =3D "63deefbc15d9ce7c43d858187533367b01dcb6e8469d6b69cc=
b757d6d3dbb0ad"
+SRC_URI[sha256sum] =3D "fe304c31ad3e8f68a48f52b538ed2c1bf9b9fe62d8ee528ebc=
96d0a321287145"
=20
 export INSTALL_MOD_DIR =3D "kernel/lttng-modules"
=20
