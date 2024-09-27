Return-Path: <purushottam27.kumar@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4E4CEBF93
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 10:53:43 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.66352.1727434419689347815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 03:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: purushottam27.kumar@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 27 Sep 2024 19:53:37 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: purushottam27.kumar@lge.com
Received: from unknown (HELO si-rd24bld77.lge.net) (10.221.31.77)
	by 156.147.1.125 with ESMTP; 27 Sep 2024 19:53:37 +0900
X-Original-SENDERIP: 10.221.31.77
X-Original-MAILFROM: purushottam27.kumar@lge.com
From: Purushottam Choudhary <purushottam27.kumar@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Purushottam Choudhary <purushottam27.kumar@lge.com>
Subject: [oe-core][PATCH] kmscube: Upgrade to latest revision
Date: Fri, 27 Sep 2024 16:23:33 +0530
Message-Id: <20240927105333.52805-1-purushottam27.kumar@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 10:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205013

Upgrade to the latest kmscube revision.

Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 34d5a7d71d..01ea80a142 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "467e86c5cbeb2a2051b31ce2c240d6ddf5bc3112"
+SRCREV = "b2f97f53e01e07a920761e5d3e3ba22898b794a4"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            file://0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch \
            "

