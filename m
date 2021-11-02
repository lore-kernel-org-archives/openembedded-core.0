Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A34C433FE
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:14 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.532.1635871632891398573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509671"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509671"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:24 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575079"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:23 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/24] waffle: convert to git, website is down
Date: Wed,  3 Nov 2021 00:43:50 +0800
Message-Id: 
 <767a12b4e2cd55faf91fa1b918b73e7562ec5bc5.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157788

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28391c20044058e05a1bfdacc31a3e876828fb72)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/waffle/waffle_1.6.1.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.6.1.bb b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
index 395494018a..161bbb0d26 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
@@ -3,17 +3,15 @@ DESCRIPTION = "A cross-platform C library that allows one to defer selection \
 of an OpenGL API and window system until runtime. For example, on Linux, Waffle \
 enables an application to select X11/EGL with an OpenGL 3.3 core profile, \
 Wayland with OpenGL ES2, and other window system / API combinations."
-HOMEPAGE = "http://www.waffle-gl.org/"
+HOMEPAGE = "https://gitlab.freedesktop.org/mesa/waffle"
 BUGTRACKER = "https://gitlab.freedesktop.org/mesa/waffle"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "c91529e579483f44fb330052872b9c73"
-SRC_URI[sha256sum] = "31565649ff0e2d8dff1b8f7f2264ab7a78452063c7e04adfc4ce03e64b655080"
-
-UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
+SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.6"
+SRCREV = "d7e8c4759704b3c571fa3697c716279c26fd05eb"
+S = "${WORKDIR}/git"
 
 inherit meson features_check lib_package bash-completion pkgconfig
 
-- 
2.31.1


