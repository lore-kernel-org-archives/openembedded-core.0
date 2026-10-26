Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41252.1793016856123933308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 05:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=y6zFq0Yf;
 spf=pass (domain: est.tech, ip: 52.101.72.49, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdvJaUBESJTf7lUHodp7lMc916aS7mcQrRb7quC6/7rjvqkI3uP6NuH1DrjCTeBfBpYldxoxdfxtBHKOmYQw6BDm1R0cMbMedSbfg5ZnKZbmNYu/2IVT+pHQ0fSXVPNgVPogoQ9eSV4+tDhbq0Pf0xouEUyrc79JHx/cbinC3GE7IXnHbG/GtYuEeC5R9t0aWW9ImhhT9Vl5mxH1Htv4LslNp/SgUo3wDEyrgE8MnL7NhZX1eMsXkPncQbWVyi3ALf5+oJ+taDSBt4PeLGkvmIGOJJrayEwROyJevVW9ipAPzHSRsnC+2dHaetAGf9TAOOcCZ1vhbNlUKMnH/aDSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEKq3RnquKHIQ32ZAsABMGLFWesmJrfBim1RmNUEFn0=;
 b=QhDVYlGPxftZWBsEV5JhZAwCi4Og2uljtInTc9UfhMKXAQkNOWiSbFaeUCaCiNct7F0oe1MZBhf4Z9c0SPbvbmjSuuJfIpXsLavuzZrXxvWYPN1PFqLQbTB/MTUbQOETpW+7iGPAZtxxtC+5zSuC7G1lTimrI+dIBStTfYpPDqqlcdM00ioecLqiDwuao0XZ+lHfhL75JykeW70uoR2WWn8PJ7Xlzk1wT757DAbsl2wFQ62MIQUux2yowxsjQPtraHng9mSGNCF+FJXMVWYKOpMyjwzMw3La2HhQ3Ss8FCfTIOAYm/utBPjnsxfNXupVa4NWd2XJfFOzUmxpQXt4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEKq3RnquKHIQ32ZAsABMGLFWesmJrfBim1RmNUEFn0=;
 b=y6zFq0Yfw7IcZUowwuj9avAPoxmmWUdvPzBcAvOlFLRMcoTYhpy7pcMZVEF5A2Ei9ZoW3cpqT24+5yBF5Sl256daPhnHGS95RHdyNTQPO3a/7J/Nfjbpy6JYJlAqb/9GmJeaxCg0t0mkzw6jDpFyCuTP2BJb1NS+uGtimllgOgAS5FOx76DLJfJMcw1peb0cWFYCZNLmzG213Oe18eUYfghUmI5egLfckgpYkbEWmu86Lx78UFKWeUD1ha2HO9qPq+0E9PrhOz9ORMOKzyvOXTQ7vqDG6h3ibdS45u3kGganeujvqUBzflwUKV4PcQkBJ7k9qzMGgfb/akqLzcKeQg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM4P189MB3409.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:14:11 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 12:14:11 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] glib-2.0: ptest: skip memory-monitor-psi /dev/null test
Date: Mon, 26 Oct 2026 13:14:06 +0100
Message-ID: <20261026121406.30391-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB9PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::12) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AM4P189MB3409:EE_
X-MS-Office365-Filtering-Correlation-Id: fed78e46-d52b-4703-712b-08df335aa477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|261009220027099003|261009223327099003|261009223027099003|261009221227099003|261009221727099003|261021121427099003|261022075727099003|261022105027099003|261021135927099003|261021123027099003|260925021311599003|260925022911599003|260925021911599003|10067099003|56012099006|4133799003|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: sbxiRGb6N6gl0QOAVFUy3zdjaOxd5I+Al6SQ/rQnfLtyBFE9qE/ckHJoY9451GWK+JNku/mguYdV0b9K6JCrt8OroSSnoXAropiBATgSVG0lZSBLGUZy1wQmrw6tCrFDFgmsKTnugBSzgzY1Yw47B8djj4/6LrsQig4nLmja08wYEBvDKRxSj2JG20GFmC/6u1D8ENxIGEgRpIMRpKWY6Fx6UuHUKYNhLTAeC2USxviR6mnv5E2ZWW9/ZuEWjxheWq88nFVyldnxKPiwuRwAA/Z0eo7R9I5Z7LHBW59fK3KlU/ZF3ze2+BMw7PuGrVmrwucYLhjCn+xMjlMYd/ktclTMAEnYsL7oZHH7RsiRjs1MrmVUF8Le0vo3gWZckoEYgm1yJ+duzOjHEKpyTEMjzirkDYKdkettEtTNXaNOSXyTIa1AUzCpl1KeqgwXwOYUa22oKFuYzMN9aOOzag6eCnD60vGofFn1edCAX7ZmPgAOdJhv083u4vNv5aRdNYYsQhHF0uy2NPMXDMWxOw4HH3Ny3+9alKu/lRddePlxG4Byl6xZDO9jaB9O2YRxNQVz0oKlHvZ18nlT+fByVtSt/iq5nhD1fQArCiocbdFU8jk68vVO4xaQ56tZYP6VgjkB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(261009220027099003)(261009223327099003)(261009223027099003)(261009221227099003)(261009221727099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021135927099003)(261021123027099003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(56012099006)(4133799003)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?04Ot3c4EFhXqKVdrSakZyjK2IdSGrC6pi5HofyXQqGvVk7mlp9fsngA/bAY8?=
 =?us-ascii?Q?P13oSYxMQxmVfnwX/kcewHsHzTBzxl9C90GwphPqQN3wpvV5MKOP9+aAVtGD?=
 =?us-ascii?Q?xDsjWlU/8BvB+iryn0ekEoVMbU8ro7tcSvsf8gs7WZ5uxH6GlPG80gOss7m2?=
 =?us-ascii?Q?3Z97zQhvT3GdEeX3ZlS4xgVx+v5ufHiDYapbUhtT58XhwahTzXpN8H2Rs6Xx?=
 =?us-ascii?Q?jWDx0yDoLoV4a/FEBBUqFNI/6BgAd4C10cMUm9dt4Gk7FOzu9Ue8aAGm1m8U?=
 =?us-ascii?Q?H56IsxJf6NE8Iox4ZZ6118EM+rlGAJJyp3TGM4GMMlRykywljpV+1CIBxzhT?=
 =?us-ascii?Q?8RHKv81hC4mFl4LWuZ0avQZ+I0ZRsuA+S0q/H/jyo3Z1TwgOd2SVO2Pqowz4?=
 =?us-ascii?Q?hgejxA+vvUdaCbDORsruBeJbt6VVqEpB7pZxETP/L56E1iRGKQ5bxbnR7cth?=
 =?us-ascii?Q?FqQg/dHYb3oKIZBAMw2nfh+OnxjZE4Ll0laHweXRmXDAKQpJzKfa+xfESmZt?=
 =?us-ascii?Q?i080AmFiFXK463vpLqYoKQURatgvHLGgeLcurn4uIMcm9QvxM+RYbHXiCK77?=
 =?us-ascii?Q?JFU4+cAePQoSru5hjpYcGo12Cb1M70N7z5HJTUq7GisrFu/Fhi0hgIkLuzxN?=
 =?us-ascii?Q?hQXdXIXR1hzay1IE4aYYUCNs76co+AQH1KbUrhPCX9L7CDVnRM446UQ6A484?=
 =?us-ascii?Q?A2NQSMiDnsB9oXkyHUpAAKk+tZeZTz4H3xqoPSDS+00DUDyP6eeUHlppA3VR?=
 =?us-ascii?Q?9+/Nu0V3T74k0fx4jfxU1o2p3CKvTspJzVIsmPrLT+OEA2S9wJU7ZTGbEAJw?=
 =?us-ascii?Q?ClYcUkV0FfXqXw3eXtMDubgkn5mnLi7SJcg35x3bRwxpNNs4bcf7Dcr/BBWN?=
 =?us-ascii?Q?bTcLCb9n8aV4Fmgg1l50bQOoZTTTwkdeCUuvfNl/WvKPAPbieI6bnpBSKI8w?=
 =?us-ascii?Q?pXCE99UVqM2hoxnkUR+f6JKpp/xmFmuH5s3jtOt8Xh+6q9lcn0FNH4e0YDrw?=
 =?us-ascii?Q?GD95cHNVRum4uAjKK+I+nY4Zgi6yF/7rt7ImTNsHoi26nmuaM2q40xqICGdK?=
 =?us-ascii?Q?nFDUHviQMN71ljEPUowZbsRHhs3MHpPVxwAvWCD2sQDjE4Zh2Ji/PqQeATvn?=
 =?us-ascii?Q?XbdsVWlFRsjBMUjdmb/emhcM7VU+udGlKMqTOm0lOq4VwEaBtkBT2eg0Te5j?=
 =?us-ascii?Q?344kXnZ/SXpOjuKyJ4bWFXjcCY6H4/kU46NJoeffOXptc2pUzmwVuypbfrHX?=
 =?us-ascii?Q?bb2b/U69dDzu1aDpJ0LGs42t6v17ylElh+Sp5mx2Dl+cCvqV+2hYsrd/H3Ki?=
 =?us-ascii?Q?dL39hpJ3j+fjIep4Q6vNCBKXmnMIBGhaXdfKtFuqw65YyPy/ACTB7+vMHBQW?=
 =?us-ascii?Q?BIhxnKZiw/REhGoaMg04iDtfiVJBS8OIoAKQwdbXcy8cwSa+D7ps8O2zwjZx?=
 =?us-ascii?Q?oNixtiwNPxZs4DBhd+zvm4YG7HdzidH27YX4At0PrkHoOEP7cZYIkNE/3+XC?=
 =?us-ascii?Q?wRBl87yLB0Hg7c5BILERWT8KdHpmQVx2BCiDwRImxargjAJEszxnQkXOXeP6?=
 =?us-ascii?Q?19TRu80k5Rv0UaeePltUgIi1X28hav9r5qWwPKbCXwkG/YGRiGhwF6cgwrOK?=
 =?us-ascii?Q?v7wk/cL/81/rcppGaybAghajbyjKPB826cDcCqDmP2J7ho5oMr4ycT/l5coc?=
 =?us-ascii?Q?zqG2qbMd6t19M/BWzQZi6Ic364Ww2b8kGGJXw23jtE54lNiw0wFqzDrskPE8?=
 =?us-ascii?Q?FR1nkBRq4A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fed78e46-d52b-4703-712b-08df335aa477
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 12:14:11.0429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPHM/nxSKkcD8MoK4PDlnqp5sQ/XnyQQXKPZNXyJMmKirt5nzm1CQM2ZItwai+Wsj7od44/zt+ilfRYZB7W3fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3409
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 12:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248677
Content-Type: text/plain; charset="utf-8"

The /memory-monitor-psi-env-set/write-env-null test sets
MEMORY_PRESSURE_WATCH=3D/dev/null and asserts that no low-memory-warning
is emitted. That assumption is unsound: GMemoryMonitorPsi polls the
watch fd for G_IO_IN and /dev/null is always readable, so the
low-memory callback fires and the assertion (warning_level =3D=3D -1)
fails. It reproduces under QEMU system emulation on the autobuilders
(qemuarm64), and the resulting abort leaves the mock PSI FIFO behind,
cascading into a mkfifo failure in the memory-monitor-psi test.

Add a patch dropping the test (and its now-unused function); the other
memory-monitor-psi-env-set subtests still run.

[YOCTO #16464]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 ...ip-memory-monitor-psi-write-env-null.patch | 88 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/skip-memory-monitor-ps=
i-write-env-null.patch

diff --git a/meta/recipes-core/glib-2.0/files/skip-memory-monitor-psi-write=
-env-null.patch b/meta/recipes-core/glib-2.0/files/skip-memory-monitor-psi-=
write-env-null.patch
new file mode 100644
index 0000000000..aa9ef919df
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/skip-memory-monitor-psi-write-env-nu=
ll.patch
@@ -0,0 +1,88 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Pratik Farkase <pratik.farkase@est.tech>
+Date: Mon, 26 Oct 2026 11:55:00 +0000
+Subject: [PATCH] Skip /memory-monitor-psi-env-set/write-env-null test
+
+test_write_env_null sets MEMORY_PRESSURE_WATCH=3D/dev/null and asserts
+that no low-memory-warning signal is emitted (warning_level stays -1).
+
+This assumption does not hold. When MEMORY_PRESSURE_WATCH points at an
+existing path, GMemoryMonitorPsi opens it with O_RDWR | O_NONBLOCK and
+creates a GSource polling for G_IO_IN. /dev/null is always readable
+(reads return immediate EOF), so the source is immediately dispatchable,
+the low-memory callback fires and warning_level becomes 50, making the
+assertion (warning_level =3D=3D -1) fail:
+
+  GLib-GIO:ERROR:.../gio/tests/memory-monitor-psi-env-set.c:300:
+  test_write_env_null: assertion failed (warning_level =3D=3D -1): (50 =3D=
=3D -1)
+
+Whether the spurious event is caught before the monitor is torn down
+depends on GMainContext iteration timing, so it only reproduces in
+slower environments such as QEMU system emulation on the Yocto
+autobuilders (seen on qemuarm64). The test's abort also leaves the mock
+PSI FIFO $TMPDIR/cgroup behind, which then makes the separate
+memory-monitor-psi test fail in tests_setup with "mkfifo(): File exists".
+
+Drop the test registration and the now-unused test function. The
+remaining memory-monitor-psi-env-set subtests still run.
+
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16464
+
+Upstream-Status: Inappropriate [upstream ticket: https://gitlab.gnome.org/=
GNOME/glib/-/work_items/4094]
+Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
+---
+ gio/tests/memory-monitor-psi-env-set.c | 36 --------------------------
+ 1 file changed, 36 deletions(-)
+
+--- a/gio/tests/memory-monitor-psi-env-set.c
++++ b/gio/tests/memory-monitor-psi-env-set.c
+@@ -269,39 +269,6 @@
+   g_clear_error (&local_error);
+ }
+=20
+-static void
+-test_write_env_null (SetupData *setup, gconstpointer data)
+-{
+-  GMemoryMonitorPsi *monitor;
+-  unsigned long warning_id;
+-  int warning_level =3D -1;
+-  GError *local_error =3D NULL;
+-
+-  /* The contents is generated by running "dd if=3D/dev/random of=3D/foo/=
bar bs=3D128 count=3D1" */
+-  const gchar *env_write =3D "hVh9eV0BZsh/GWEs9V6zKyO3VUe2MnxTxLZbA7BRo7G=
JKHAAayIRsgO8EI4m8iFskhx/O4cAfpyL"
+-                           "YQ8LFHMG5XBuBmqD9spZghu0eVYF2X8lCCT+iBlEFw5dW=
iSa6XwJN++AmHi1tp4uJj0UBR7CwV5c"
+-                           "+ms9ZDUqOQrvlFHUSxw=3D";
+-
+-  g_setenv ("MEMORY_PRESSURE_WATCH", "/dev/null", TRUE);
+-  g_setenv ("MEMORY_PRESSURE_WRITE", env_write, TRUE);
+-
+-  monitor =3D g_object_new (G_TYPE_MEMORY_MONITOR_PSI,
+-                          "proc-path", setup->mock_proc_path,
+-                          NULL);
+-  warning_id =3D g_signal_connect (monitor, "low-memory-warning",
+-                                 G_CALLBACK (memory_monitor_psi_signal_cb=
), &warning_level);
+-  g_initable_init (G_INITABLE (monitor), NULL, &local_error);
+-  g_assert_no_error (local_error);
+-
+-  g_signal_handler_disconnect (monitor, warning_id);
+-  g_object_unref (monitor);
+-
+-  /* warning_level shouldn't be set */
+-  g_assert_cmpint (warning_level, =3D=3D, -1);
+-
+-  g_clear_error (&local_error);
+-}
+-
+ static gpointer
+ test_write_env_unix_domain_socket_thread (gpointer user_data)
+ {
+@@ -395,9 +362,6 @@
+   g_test_add ("/memory-monitor-psi-env-set/write-env", SetupData, NULL,
+               tests_setup, test_write_env, tests_teardown);
+=20
+-  g_test_add ("/memory-monitor-psi-env-set/write-env-null", SetupData, NU=
LL,
+-              tests_setup, test_write_env_null, tests_teardown);
+-
+   g_test_add ("/memory-monitor-psi-env-set/write-env-unix-domain-socket",=
 SetupData, NULL,
+               tests_unix_domain_setup, test_write_env_unix_domain_socket,=
 tests_unix_domain_teardown);
+=20
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index 91c9795547..eee9185c70 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -235,6 +235,7 @@ SRC_URI +=3D "file://run-ptest \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patc=
h \
            file://skip-timeout.patch \
            file://skip-monotonic-time-similar.patch \
+           file://skip-memory-monitor-psi-write-env-null.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
--=20
2.43.0

