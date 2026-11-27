Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13879.1795776711161307453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 02:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dmEOkRpB;
 spf=pass (domain: est.tech, ip: 52.101.65.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8nfkSSjYUeBBkA+gEAf6c605OWBfK/NKcZqp9RyODs1tD0tci6lXTMRsdZQqCXnGVgVFv+s6lrDGrX45/BbA1+vUo64YbMPU803LKTQCV5IRri01P5RmZdCeLuxsDSncIuNz+ohEOwAfx9qpJ/i+I5nbsBRgSP0GNX59N3MjaB5ySdUFXqdgo+YRRmaEQfPXs/KKBNNlF/uVlNI7j5aFGq16iO3XAKjmwoaDkvnaXcsTLcaaq+f2siEBACoADrP9PKne6IHZ4Q40zmiM9DoaiC0bJYLwRtA6VwSyzphMbx6vEdtO473Klk9RHuJZPdWguct/INZOCPiwLssAWgncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InPSF8crzGgiemdgkgr6eNgulHlbLFc7BZMzwX9KHOg=;
 b=nYglfsLopXuoERl5kORW8VqbYnjM5A+x+37rv9Oo58JmLzyYkFpBkk1krKZVu5ATEbJ+tY52l+B48ioanpxibU5HwcUN2gtNxDqzO+TEZvjkLpn3icsmiVBvbMQA7i3qAiYtoVLc1T0wJbxvHlTU0MCO9b0hl/oiazNt1H/JY2bwa6OSn7QkCFm1q2KXezuergNoDw0dZBsB/1CwV6cGenogYNuAAbTgLQ3tYIlnIiCBPHnzMaFEsJ5TzhZRFh3HvchuOoy95a8EhxmvM+1+RSF2aeDVo5coaJUwaxHFjiJwYa5Di1O9h5EvNt75om9YlHlKbEL2K/KgW3FPmZG7dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InPSF8crzGgiemdgkgr6eNgulHlbLFc7BZMzwX9KHOg=;
 b=dmEOkRpBpOAoX67UH9E4aZKq4JNxAwB8ITEHxF6ZmxJWemvEWiWAMl78XIvmvJwPYc8dKtHkxOgrSZCE0D5H2ZZJ4nH2EPhST58RHz0jHXk33KmtyeoRJmQxnE+BVMvI3KJvHQHBQ8xXFMx0MgykIPHUCEI+Yoe8TLfUrakA3ZntI0BfQOQMhYyLtvwesPQWKqTm/Eu8TPfa1HYuZJ2NshL+MZvk7/8jSvjOiXZSTWTQzCI70NfyUuDFe1hdt5Y2LnYnqka2vWLq6Glf4IpArBTdGtlZ5PJqq+CEX1qtxxG36CVbEWNH3UqTf/BgdL4hVHVgLp5orJPl8eYj3IVjmg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS8P189MB2465.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 10:51:46 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 10:51:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gtk4: upgrade 4.24.1 -> 4.24.2
Date: Fri, 27 Nov 2026 11:51:44 +0100
Message-ID: <20261127105144.99963-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-4-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-4-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS8P189MB2465:EE_
X-MS-Office365-Filtering-Correlation-Id: ddbf02aa-b7f0-4121-7259-08df4c746e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|22082099003|3023799007|11063799006|10067099003|260925021911599003|260925021311599003|260925022911599003|56012099006|261028144727099003|261102123227099003|261026121527099003|261021121427099003|261022105027099003|261022115727099003|261021123027099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 4BO/9Wb4n4wWP5OOuRqeb1kD8gPybJ0MzqHWlxMkAeopw7hU7Pk7hKFUC2/oBJLbUwvMu6gNoykWQ8mZbSfXmEnmyJ6g3WZHXZhzPQI+N8qk7fokvpRMfBTBxpCQQJ3g0Xa19j2xhOcJNwxc1nMMTZvcOOiImZMeoaPIx1qk/4KSs7dpXRKWiKonAFKHL8bsQ+tPv1iiNPBgsf1VX1nznydho/2Uc3/WDx5bANM5syljofeOtnG7OrlZV/PzvkFzOUrkc5q1azhA1o7DAwtm5jcZXBNshS3jepqdawlce3bPvB2otUeStAl6U+YD8yQ9QTnYMewZACDWPOftAK30++68neWXHc0nWPbBiJQFNrU66j3mnJf718kXA//3XtNnO3NiirA2MqWMulQ+rFkTrf5D4nY3WduL8AHW/97oz4BSlpA7yVcbjbgC42G8uHGPiPhtfJrQL2BwaknU9/q2rkWwYXDpaj36AXQTcfPQg8WXmpFRR0W76fXoeQlvr1ENtpIzIWzjDGNJsUDevo4tUEaTd7X8PY4m8bAHcO/5qxmFDa+i3xnSlRd2OZML34mJIaJ9oSoP7O66wI7hCgKxVK+fqPl0d9BT/AphBTNoIDmuHCYiataVZZevlI+A6sjY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261022115727099003)(261021123027099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VJMegl4CTQlEjVjzNZXEJ3e9CtzeZRt3IzrX7eRc8zZsEcCPyubi+IIPgImH?=
 =?us-ascii?Q?qQqSXVUZXLCzxmtIbszi+rc/Yv/cLrBZ2hLGVXGuvr6q+L4zbMSHhEmYGOj6?=
 =?us-ascii?Q?cdF6RgNziw/yNzuQ/mwuxY461Am2JfFSdLxkIXkXb0bqhb0TH6sBtfrt7U+7?=
 =?us-ascii?Q?YZ61J6B86LthO2pZzImSEo2GcwYxnAZ+g0ZzrXLhAAi8XAexOOn9CVba4Ga8?=
 =?us-ascii?Q?vqksxHfuV1KRoMI/m+HVQ4pIgrlHCpGjVkK4GVH2ZJHdZb+7q4G+yCziXg/N?=
 =?us-ascii?Q?arLFURqWUrH/i9Yd40Tf7CxuJPeX8PNvdJ8oZDN/One1ha9ZefDr6t8yAuee?=
 =?us-ascii?Q?UPB9zHYTXRvtcqEkQrY6t70pQihUGgpcpnPy5KERldtig/TENZRqc6LBOT4s?=
 =?us-ascii?Q?ozU6KClkI4vJJ1+5d6jsoCS0hk4qXxB66t5RP86iAu8bo3q+hiCh8YqLWTvd?=
 =?us-ascii?Q?pt0Sdrk6tDfL0vst6hdMtZi87Mql0cR9zO7dUQr72pSGHNo3t9EtpMLOBzNU?=
 =?us-ascii?Q?0mevNNTVA9TNINx9WNgHx0PjG+6MpfrDKnm3V+JfbiL+zZ1VDNS+/LQQWRxq?=
 =?us-ascii?Q?VgZWjjptqYw6CdZ2ZSpf/Xb+8caknZiy5GDEvFcaU2L68lfamropeG3ikjQ8?=
 =?us-ascii?Q?V0Ga+Nku1SPIRzIgnL9H8I7FoGIURGyh6UT/BI3ntrnONMkq7Wdi7gRevXrA?=
 =?us-ascii?Q?ACe6yn+1nflRu2I6FB2crB4T7L+SJz5SbCTJeARSDiYgA6knVDUNlviEip2T?=
 =?us-ascii?Q?I4V8iWz5X3gPsdXp0R7q6ZvOeMncxPSIcPddY17mLHvmt3EpTtcOEu3Mt5Ae?=
 =?us-ascii?Q?EM64tptYFDTucJERyDy0gBvWxK+5xy+yr/6VKxBWmXeLADt2cXT5PRsDR4ZF?=
 =?us-ascii?Q?W7e8CBgOMiTZYXq9CHkP23UvPRqFgAYQudrmpPKOnPfby1K7b+Fl9XUAQYTd?=
 =?us-ascii?Q?Zi3QIxWcU7OeAF5u5lDQhhRJB3JlgvdQXf2m58RqvgF0ZcAJZZ2k8kkJydH8?=
 =?us-ascii?Q?tdQKC1V5kR5/5Fhu4J3ugZXDJ/MCZHABiiScSgD+ntbhvyjM9GrJFxBuz4wb?=
 =?us-ascii?Q?MVV9I5Ic6cxh/QIvVhCCxeaejhBNwZRba3LcZNUz2B/01Mal98Jy2nClSJi7?=
 =?us-ascii?Q?2v6OeC5xX+xguXD5knGg+9CSdVUGbj+YEDFd2XX4xFi3hMwUgq+FBzf4LJVF?=
 =?us-ascii?Q?zmCRHSgqSOF3WtXZjl1ZntYK4XJk4TqxB0jezr+YklapPo255yvBUjhS6qeu?=
 =?us-ascii?Q?hHAbfA7nLT8iMIlbyKjLn7C26ZRIyzou+FOKStWRTP/+853N9HuZJIuO1hIL?=
 =?us-ascii?Q?fxEtXXqDe0KiFZp80dAXXGR1WHPxxRY3BP8oJUFppmqhaA/yMKaB0TDuEHTe?=
 =?us-ascii?Q?sNpeYrC6loaXLYqhG/sxE4u4THLc7GnZjb/vyzYj/qBHJXX4mfZ59eYxR9/E?=
 =?us-ascii?Q?YBwWv8x5qKLu45+zW60hXQXgs5MLU0RxVnKYQzDjJBqsm0SwpWo1XGkls06j?=
 =?us-ascii?Q?lsNDt2uM9RlYAbbNxPXUz0vAB1w7+SGf5P6OKu3jeIfFdxpbxyzZe7c6j9fw?=
 =?us-ascii?Q?Vyd8N4LP+aSUVssLQBP7LHwiwrrmJqWIKveUHz+R8kc7RUbemULq5fmcwHJw?=
 =?us-ascii?Q?8JzuFHsZrczkl163KA+CRLINQuFs1SV1Y3HuKA2Ya4rEyGfIjllM/KAuuAmK?=
 =?us-ascii?Q?XndpnG2tjGPdE2oj35Rtz2Af3z0cd33L3X0oTd6id6yAtO/NjgomSd+li5I5?=
 =?us-ascii?Q?pgfivPmLsNtntWI0NKCsR3B0/Q57dXg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbf02aa-b7f0-4121-7259-08df4c746e86
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:51:46.6095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvImoCysd6h4PYCJFXiRQ4kAFpfurA8EwhyDDGZhueB1GTw41+Vgc0GqRuN0ub1JrEtPenFGLuZh+FfMFSuzJDhtMlb1+k34nokTBdCqnp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2465
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 10:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251371

NEWS: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.24.2/NEWS

Changes in 4.24.2, 22-11-2026
-----------------------------

* Bugs fixed:
  - GNOME/gtksourceview#433 macOS: Number key in the press-and-hold accent =
menu
    inserts the digit instead of selecting the accent (Jo=C3=A3o Sacramento=
)
  - GNOME/nautilus#3614 Double clicking a file that's slightly off screen
    doesn't open it (Jing Wang)
  - #6719 segfaults when using wintab (Alexia Death)
  - #8455 GTK crashes on launch with floating point exception when wl_outpu=
t
    with refresh=3D0 is encountered (Matthias Clasen)
  - #8456 Wayland: freeing a GtkMediaFile makes GStreamer eglTerminate() GD=
K's
    EGLDisplay (4.24.1 regression) (Benjamin Otte)
  - #8463 Critical when loading SVG (Matthias Clasen)
  - #8537 macOS: Press-and-hold accent menu inserts the accented letter wit=
hout
    replacing the original one (Jo=C3=A3o Sacramento)
  - #8563 CSS parsing: use-after-free in gtk_css_parser_end_block_prelude()=
 and
    three more memory-safety bugs (Matthias Clasen)
  - !10432 Fix the testsuite and stroke bounds (Benjamin Otte)
  - !10433 Fix the testsuite and stroke bounds (Benjamin Otte)
  - !10444 Update Slovenian translation
  - !10445 Fix various issues (Benjamin Otte)
  - !10446 Fix various issues (Benjamin Otte)
  - !10447 Update Chinese (China) translation
  - !10448 Update Chinese (China) translation
  - !10459 Update Serbian translation
  - !10460 Update Serbian (Latin) translation
  - !10462 Update Georgian translation
  - !10464 Update Persian translation (Danial Behzadi)
  - !10466 Update Ukrainian translation
  - !10469 Update Czech translation (Daniel Rusek)
  - !10474 Update Belarusian translation (Vasil Pupkin)
  - !10475 Update Catalan translation (Xavi Ivars)
  - !10477 Update Norwegian Bokm=C3=A5l translation (Kjartan Maraas)
  - !10478 Update Norwegian Nynorsk translation (Roy-Magne Mo)
  - !10484 Update Turkish translation (Emin Tufan =C3=87etin)
  - !10486 Update Lithuanian translation (Aurimas =C4=8Cernius)
  - !10487 Declare sysprof counters as G_GNUC_UNUSED (Benjamin Otte)
  - !10500 nodeparser: Don't crash when someone puts text inside a fill/str=
oke
    (Benjamin Otte)
  - !10502 Update Portuguese translation
  - !10503 Update Portuguese translation
  - !10505 nodeparser: Don't crash when someone puts text inside a fill/str=
oke
    (Benjamin Otte)
  - !10524 Update French translation
  - !10525 Update French translation
  - !10529 Update Bulgarian translation
  - !10572 Update Russian translation
  - !10582 Assorted backports for 4.24 (Zeth (wearing a Fedora), Jing Wang,
    Felix H=C3=A4cker, Alexander Davydzik, Martin Fischer, Alexia Death, Se=
rgey
    Bugaev, Eugenio Depalo, Luk=C3=A1=C5=A1 Tyrychtr, Dimitriy Ryazantcev, =
Benjamin Otte,
    Matthias Clasen, Ignacio Casal Quinteiro)
  - !10650 Update Kazakh translation
  - !10680 Update Basque translation
  - !10683 Update Hebrew translation
  - !10700 backport gsk(opacity): use original value if opaque region hasn'=
t
    changed (Arjan Molenaar)
  - !10707 Update Indonesian translation
  - !10719 Update Azerbaijani translation
  - !10721 Update Brazilian Portuguese translation
  - !10736 backport store-callback-4-24 (Merlijn Sebrechts)
  - !10743 Update Swedish translation
  - !10745 Update Galician translation
  - !10746 macos: Backport input method fixes to gtk-4-24 (Jo=C3=A3o Sacram=
ento)
  - !10751 gsk: skip unnecessary copy/paste replay (Christian Hergert)
  - !10758 testsuite: Drop the repeat-snap compare test (Matthias Clasen)
  - !10760 Backports of assorted css memeory fixes (Matthias Clasen)

- Add backport patch to fix building for Wayland only
  0001-gstsink-Fix-building-for-Wayland-only.patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes Since v1:
- Fix compilation error with no-x11

 ...stsink-Fix-building-for-Wayland-only.patch | 41 +++++++++++++++++++
 .../gtk+/{gtk4_4.24.1.bb =3D> gtk4_4.24.2.bb}   |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk4/0001-gstsink-Fix-building-=
for-Wayland-only.patch
 rename meta/recipes-gnome/gtk+/{gtk4_4.24.1.bb =3D> gtk4_4.24.2.bb} (96%)

diff --git a/meta/recipes-gnome/gtk+/gtk4/0001-gstsink-Fix-building-for-Way=
land-only.patch b/meta/recipes-gnome/gtk+/gtk4/0001-gstsink-Fix-building-fo=
r-Wayland-only.patch
new file mode 100644
index 0000000000..405ab5ab28
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk4/0001-gstsink-Fix-building-for-Wayland-on=
ly.patch
@@ -0,0 +1,41 @@
+From 9b8dab93661798cba9f6a25e2779efd5e8fe2e95 Mon Sep 17 00:00:00 2001
+From: Chris Mayo <aklhfex@gmail.com>
+Date: Mon, 23 Nov 2026 19:24:25 +0000
+Subject: [PATCH] gstsink: Fix building for Wayland only
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+gtk/media/gtkgstsink.c: In function =E2=80=98gtk_gst_sink_initialize_gl=E2=
=80=99:
+gtk/media/gtkgstsink.c:895:25: error: implicit declaration of function =E2=
=80=98gst_gl_display_egl_from_gl_display=E2=80=99; did you mean =E2=80=98gs=
t_gl_display_filter_gl_api=E2=80=99? [-Wimplicit-function-declaration]
+  895 |           display_ptr =3D gst_gl_display_egl_from_gl_display (self=
->gst_display);
+      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+      |                         gst_gl_display_filter_gl_api
+
+Fixes:
+d4fa0b3ba61c ("gstreamer: mark EGL display as foreign", 2026-10-22)
+
+Part-of: <https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/10772>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gtk/-/commit/9b8=
dab93661798cba9f6a25e2779efd5e8fe2e95]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ gtk/media/gtkgstsink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gtk/media/gtkgstsink.c b/gtk/media/gtkgstsink.c
+index 22ca97d702c..973dac393db 100644
+--- a/gtk/media/gtkgstsink.c
++++ b/gtk/media/gtkgstsink.c
+@@ -45,7 +45,7 @@
+ #include <gst/d3d12/gstd3d12.h>
+ #endif
+=20
+-#if GST_GL_HAVE_PLATFORM_EGL && (GST_GL_HAVE_WINDOW_WIN32 || GST_GL_HAVE_=
WINDOW_X11)
++#if GST_GL_HAVE_PLATFORM_EGL && (GST_GL_HAVE_WINDOW_WAYLAND || GST_GL_HAV=
E_WINDOW_WIN32 || GST_GL_HAVE_WINDOW_X11)
+ #include <gst/gl/egl/gstgldisplay_egl.h>
+ #endif
+=20
+--=20
+GitLab
+
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb b/meta/recipes-gnome/gt=
k+/gtk4_4.24.2.bb
similarity index 96%
rename from meta/recipes-gnome/gtk+/gtk4_4.24.1.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.24.2.bb
index 5a18c4bdf9..5964f79119 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM =3D " \
     file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19d2=
9fb2 \
 "
=20
-SRC_URI[archive.sha256sum] =3D "e98abe720e16129c8c0f50761dee0a2e9ae2478055=
e31018f6cf977fcf6513e9"
+SRC_URI[archive.sha256sum] =3D "05561abc25d1b1400136bf79ab68830cb4b053d192=
2ae97e551b3f19755bf3cb"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
@@ -43,6 +43,8 @@ GNOMEBN =3D "gtk"
=20
 inherit gettext gnomebase gi-docgen update-alternatives gsettings features=
_check gobject-introspection mime upstream-version-is-even
=20
+SRC_URI +=3D "file://0001-gstsink-Fix-building-for-Wayland-only.patch"
+
 # TBD: nativesdk
 # gobject-introspection.bbclass pins introspection off for nativesk. As lo=
ng as
 # we do not remove this wisdom or hack gtk4, it is not possible to build
