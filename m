Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0BDCD3427
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 17:37:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2106.1778002621262607869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 10:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5F79340C8A
	for <openembedded-core@lists.openembedded.org>; Tue,  5 May 2026 17:37:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5qShptfaP8y
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2026 17:37:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 49E34407E5
	for <openembedded-core@lists.openembedded.org>; Tue,  5 May 2026 17:37:00 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 26C6F17D1FD;
	Tue,  5 May 2026 13:36:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 1/2] wayland: upgrade 1.24.0 -> 1.25.0
Date: Tue,  5 May 2026 13:36:57 -0400
Message-Id: <20260505173658.3662663-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 17:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236520

Massage existing patches to remove fuzz and apply to the new version.

Release notes:
https://lore.freedesktop.org/wayland-devel/Xc5mzCaUxqhO0w-Dls241-PmLXWdFT=
2DLLkz0Lhr4LAhDTZxiZfrDZeq9lCGGn2V8nxqcMZDTn6vSCdClRYkQ7vCUMPKwQokYhCjf93=
xRx4=3D@emersion.fr/T/#u

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 ...build-Fix-strndup-detection-on-MinGW.patch |  7 +++---
 ...1-tests-Remove-event_loop_timer-test.patch | 24 +++++++++----------
 .../{wayland_1.24.0.bb =3D> wayland_1.25.0.bb}  |  2 +-
 3 files changed, 16 insertions(+), 17 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.24.0.bb =3D> wayland_1.2=
5.0.bb} (96%)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup=
-detection-on-MinGW.patch b/meta/recipes-graphics/wayland/wayland/0001-bu=
ild-Fix-strndup-detection-on-MinGW.patch
index c6ddf8a1f9..d402fbf8b4 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detect=
ion-on-MinGW.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detect=
ion-on-MinGW.patch
@@ -1,4 +1,4 @@
-From a90bfa622f7323074c715674b368cba80bc7d196 Mon Sep 17 00:00:00 2001
+From b4a3b9f913e06f9b71966cd695df1ab14a031ed0 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Thu, 20 Feb 2020 15:20:45 -0600
 Subject: [PATCH] build: Fix strndup detection on MinGW
@@ -20,14 +20,15 @@ Signed-off-by: Denys Dmytriyenko <denis@denix.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 8e28f2a..b56ba91 100644
+index 33653e7..e05eaef 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -45,11 +45,11 @@ have_funcs =3D [
+@@ -49,12 +49,12 @@ have_funcs =3D [
  	'prctl',
  	'memfd_create',
  	'mremap',
 -	'strndup',
+ 	'gettid',
  ]
  foreach f: have_funcs
  	config_h.set('HAVE_' + f.underscorify().to_upper(), cc.has_function(f)=
)
diff --git a/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-even=
t_loop_timer-test.patch b/meta/recipes-graphics/wayland/wayland/0001-test=
s-Remove-event_loop_timer-test.patch
index e662d6cfd2..b225bec96d 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_=
timer-test.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_=
timer-test.patch
@@ -1,4 +1,4 @@
-From 61fa7e7d9c282798988907cf3b8928c88d7a7930 Mon Sep 17 00:00:00 2001
+From 46da8d01e695f415aeb4a8442dbc13ae0898912c Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Thu, 6 Nov 2025 08:35:26 -0700
 Subject: [PATCH] tests: Remove event_loop_timer test
@@ -13,30 +13,28 @@ way to increase the timing constraints.
=20
 Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Signed-off-by: Denys Dmytriyenko <denis@denix.org>
 ---
  tests/event-loop-test.c | 2 ++
  1 file changed, 2 insertions(+)
=20
 diff --git a/tests/event-loop-test.c b/tests/event-loop-test.c
-index a51ba8f..0c39b09 100644
+index be15a34..3f5f476 100644
 --- a/tests/event-loop-test.c
 +++ b/tests/event-loop-test.c
-@@ -238,6 +238,7 @@ TEST(event_loop_multiple_same_signals)
- 	wl_event_loop_destroy(loop);
- }
+@@ -245,6 +245,7 @@ struct timer_update_context {
+ 	int count;
+ };
 =20
 +#if 0 /* Timing requirements are too tight for qemu testing */
  static int
- timer_callback(void *data)
+ timer_update_callback_1(void *data)
  {
-@@ -280,6 +281,7 @@ TEST(event_loop_timer)
- 	wl_event_source_remove(source2);
+@@ -323,6 +324,7 @@ TEST(event_loop_timer_updates)
+ 	wl_event_source_remove(context.source2);
  	wl_event_loop_destroy(loop);
  }
 +#endif
 =20
- #define MSEC_TO_USEC(msec) ((msec) * 1000)
-=20
---=20
-2.51.1
-
+ struct timer_order_data {
+ 	struct wl_event_source *source;
diff --git a/meta/recipes-graphics/wayland/wayland_1.24.0.bb b/meta/recip=
es-graphics/wayland/wayland_1.25.0.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/wayland_1.24.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.25.0.bb
index de7ee516bb..a0bc13df56 100644
--- a/meta/recipes-graphics/wayland/wayland_1.24.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.25.0.bb
@@ -17,7 +17,7 @@ SRC_URI =3D "https://gitlab.freedesktop.org/wayland/way=
land/-/releases/${PV}/downl
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            file://0001-tests-Remove-event_loop_timer-test.patch \
            "
-SRC_URI[sha256sum] =3D "82892487a01ad67b334eca83b54317a7c86a03a89cfadacf=
ef5211f11a5d0536"
+SRC_URI[sha256sum] =3D "c065f040afdff3177680600f249727e41a1afc22fccf2722=
2f15f5306faa1f03"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-=
/tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
--=20
2.25.1


