Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0B1C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 14:30:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.11872.1642429840127376769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 06:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=smP44nI5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642429838; i=@fujitsu.com;
	bh=Mp53XjHzVtfIOeJN+gu2uDltardbK6PaO1k9/unmqd8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=smP44nI5uI8AJYahq8srRKwTNFHHn6qEidJsvaV+x4O3zCBnee01uk0wEBSty7IjL
	 ym8G53dr9gUEWlxmDYzaJOdfpf55Tc0plKFMqxOsLEd2MxODu0SRnM+71hvB+H3941
	 aKC5y0d9CABz+nBW02dBAr69tQ7aTHy9FAaTI+sbmqM7qLMlp5lzaunoH5sWm2nhsB
	 7E4ITtgiNb6f/PVgvsvmIGRDeDoJQFOkfJUHs+c7j9rQFnGC6aDgRRhJOjYpKwnrOw
	 xuB756scge+z1vCeX7WpzGlteX1eefBu8GUtF1KqoRP4pwkkBoaPJDUlalGSP1jh3u
	 yxym0hAJH7tow==
Received: from [100.115.32.207] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id 41/DF-27579-E8D75E16;
 Mon, 17 Jan 2022 14:30:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8MxSbev9mm
  iQd9aRos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePRhptMBXPVK35fm8/WwLhNuYuRi0NI4DGj
  xPcZl5khnPNMEquufoNyTjBK/Pqxg62LkZODTUBNYvqtG6xdjBwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFbCQ+t3wBK2cRUJW49/4YM4jNK+AkcXfZAjBbQkBBYsrD92A2p4CzxKtXf5lBRgoB1U
  yeoQ9RLihxcuYTFojxEhIHX7yAalWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrROqkoMz2jJDcxM0fX0MBA19DQVNfYQtfI0EgvsUo3US+1VLc8tbhEF8gtL9ZLLS7WK67M
  Tc5J0ctLLdnECAzilGK1KzsY96z6qXeIUZKDSUmUlzPsaaIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCV71TKCcYFFqempFWmYOMKJg0hIcPEoivFY1QGne4oLE3OLMdIjUKUZjjtctP3cwczw5vH
  0XsxBLXn5eqpQ4LxdIqQBIaUZpHtwgWKRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMawk
  yhSczrwRu3yugU5iATln18RHIKSWJCCmpBibW/Uk+cw9w1oZe2h8n0v7USGjZ63eHZ89cv3X9
  nan5Llospnubv/fVJ1+X3hwpq1czXc7MY3fYs1ZfZkmDngXLngmF8342VquJPKb4neNGq+Pmh
  WoCLGK/Z/DqqDys59QJF+tdwL9Lpvd0548c5Vcv5skUbvCY9PVPlPLcU07V6XEdWW5Xd6l41m
  pzeUps4lh7+vG66R6mK+9KhD/cmn5YwaNPXGW29dMl4bxVWWscc5bHa2uZelUYymq9mrKmw7y
  SI7JmZrTW4usWZwMmXfzOsnXCc8WkJU987ort/vnO5g/n3WmZ5b6/dH2TJK6f2bOj3sM6j4t5
  iyffgYVTNjBeVNzvxvZKufFM+dQTa5RYijMSDbWYi4oTAfByk2VvAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1642429837!28791!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25258 invoked from network); 17 Jan 2022 14:30:38 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 14:30:38 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8962C10046F
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:30:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7C6CE100463
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:30:37 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 14:30:21 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsdl2: upgrade 2.0.18 -> 2.0.20
Date: Mon, 17 Jan 2022 22:30:05 +0800
Message-ID: <1642429806-13814-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642429806-13814-1-git-send-email-wangmy@fujitsu.com>
References: <1642429806-13814-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:30:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160643

0001-Fix-build-against-wayland-1.20.patch
removed since it is included in 2.0.20

License-Update: year updated to 2022.

Changelog:
=========
General:

SDL_RenderGeometryRaw() takes a pointer to SDL_Color, not int.
You can cast color data in SDL_PIXELFORMAT_RGBA32 format
(SDL_PIXELFORMAT_ABGR8888 on little endian systems) for this parameter.
Improved accuracy of horizontal and vertical line drawing when using OpenGL
or OpenGLES
Added the hint SDL_HINT_RENDER_LINE_METHOD to control the method of line
drawing used, to select speed, correctness, and compatibility.
Fixed hotplug controller detection, broken in 2.0.18

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fix-build-against-wayland-1.20.patch | 45 -------------------
 .../{libsdl2_2.0.18.bb => libsdl2_2.0.20.bb}  |  7 ++-
 2 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-build-against-wayland-1.20.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.18.bb => libsdl2_2.0.20.bb} (93%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-build-against-wayland-1.20.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-build-against-wayland-1.20.patch
deleted file mode 100644
index 8923334e27..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-build-against-wayland-1.20.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From e2ade2bfc46d915cd306c63c830b81d800b2575f Mon Sep 17 00:00:00 2001
-From: David Redondo <kde@david-redondo.de>
-Date: Fri, 10 Dec 2021 16:22:34 +0100
-Subject: [PATCH] Fix build against wayland 1.20
-
-Fixes #5088
-
-Upstream-Status: Backport [https://github.com/libsdl-org/SDL/pull/5092]
-
----
- src/video/wayland/SDL_waylanddyn.h | 2 ++
- src/video/wayland/SDL_waylandsym.h | 4 ++++
- 2 files changed, 6 insertions(+)
-
-diff --git a/src/video/wayland/SDL_waylanddyn.h b/src/video/wayland/SDL_waylanddyn.h
-index 13b0884..2268555 100644
---- a/src/video/wayland/SDL_waylanddyn.h
-+++ b/src/video/wayland/SDL_waylanddyn.h
-@@ -95,6 +95,8 @@ void SDL_WAYLAND_UnloadSymbols(void);
- #define wl_proxy_marshal_constructor_versioned (*WAYLAND_wl_proxy_marshal_constructor_versioned)
- #define wl_proxy_set_tag (*WAYLAND_wl_proxy_set_tag)
- #define wl_proxy_get_tag (*WAYLAND_wl_proxy_get_tag)
-+#define wl_proxy_marshal_flags (*WAYLAND_wl_proxy_marshal_flags)
-+#define wl_proxy_marshal_array_flags (*WAYLAND_wl_proxy_marshal_array_flags)
- 
- #define wl_seat_interface (*WAYLAND_wl_seat_interface)
- #define wl_surface_interface (*WAYLAND_wl_surface_interface)
-diff --git a/src/video/wayland/SDL_waylandsym.h b/src/video/wayland/SDL_waylandsym.h
-index d6e6a76..32e47d2 100644
---- a/src/video/wayland/SDL_waylandsym.h
-+++ b/src/video/wayland/SDL_waylandsym.h
-@@ -84,6 +84,10 @@ SDL_WAYLAND_MODULE(WAYLAND_CLIENT_1_18)
- SDL_WAYLAND_SYM(void, wl_proxy_set_tag, (struct wl_proxy *, const char * const *))
- SDL_WAYLAND_SYM(const char * const *, wl_proxy_get_tag, (struct wl_proxy *))
- 
-+SDL_WAYLAND_MODULE(WAYLAND_CLIENT_1_20)
-+SDL_WAYLAND_SYM(struct wl_proxy*, wl_proxy_marshal_flags, (struct wl_proxy *proxy, uint32_t opcode, const struct wl_interface *interfac, uint32_t version, uint32_t flags, ...))
-+SDL_WAYLAND_SYM(struct wl_proxy*, wl_proxy_marshal_array_flags, (struct wl_proxy *proxy, uint32_t opcode, const struct wl_interface *interface, uint32_t version,  uint32_t flags, union wl_argument *args))
-+
- SDL_WAYLAND_INTERFACE(wl_seat_interface)
- SDL_WAYLAND_INTERFACE(wl_surface_interface)
- SDL_WAYLAND_INTERFACE(wl_shm_pool_interface)
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
similarity index 93%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
index 6c949d9604..90724ab8b7 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "http://bugzilla.libsdl.org/"
 SECTION = "libs"
 
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=095c2687a3c3908e26984eaa8ec2d770"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=68a088513da90254b2fbe664f42af315"
 
 # arm-neon adds MIT license
 LICENSE:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', '& MIT', '', d)}"
@@ -17,14 +17,13 @@ LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'f
 PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
-           file://0001-Fix-build-against-wayland-1.20.patch \
            file://optional-libunwind-generic.patch \
            file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \
-"
+           "
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "94d40cd73dbfa10bb6eadfbc28f355992bb2d6ef6761ad9d4074eff95ee5711c"
+SRC_URI[sha256sum] = "c56aba1d7b5b0e7e999e4a7698c70b63a3394ff9704b5f6e1c57e0c16f04dd06"
 
 inherit cmake lib_package binconfig-disabled pkgconfig
 
-- 
2.25.1


