Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A07EE6B43
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 17:24:25 +0000 (UTC)
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2785.1770398658412968402
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 09:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f71D05jlHzNlf;
	Fri,  6 Feb 2026 18:24:16 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f71D035JNzCMZ;
	Fri,  6 Feb 2026 18:24:16 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 06 Feb 2026 18:23:54 +0100
Subject: [PATCH 2/7] mesa: update patch status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-mesa-tools-native-v1-2-166935b0e379@cherry.de>
References: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
In-Reply-To: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bab12
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 17:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230633

From: Quentin Schulz <quentin.schulz@cherry.de>

This patch was actually merged in main branch, so let's update the patch
status to reflect that.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 ...stream-don-t-dump-genvk.py-args-to-generated-file.patch | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch b/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
index 097ca84e3b..df4db15559 100644
--- a/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
@@ -1,23 +1,25 @@
-From c0f067e86bc9f7fbc60c2539dc612a050ee2569f Mon Sep 17 00:00:00 2001
+From 4315c28739dcade156ac9384c99ba552b6d85b40 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 19 Nov 2025 11:36:42 +0200
 Subject: [PATCH] gfxstream: don't dump genvk.py args to generated files
 
 Full command lines include full path to the output file, which triggers
-the 'buildpath' QA warning. Drop the args and print only a basename of
-the script used to generate the file.
+reproducibility warnings (e.g. in Yocto builds). Drop the args and print
+only a basename of the script used to generate the file.
 
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38875]
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38875>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/4315c28739dcade156ac9384c99ba552b6d85b40]
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
 ---
  src/gfxstream/codegen/scripts/cerealgenerator.py | 8 +-------
  1 file changed, 1 insertion(+), 7 deletions(-)
 
 diff --git a/src/gfxstream/codegen/scripts/cerealgenerator.py b/src/gfxstream/codegen/scripts/cerealgenerator.py
-index 077571e9eda5..217c3e1d0e94 100644
+index a171af83641..5e34ea64bd1 100644
 --- a/src/gfxstream/codegen/scripts/cerealgenerator.py
 +++ b/src/gfxstream/codegen/scripts/cerealgenerator.py
-@@ -254,13 +254,7 @@ def banner_command(argv):
+@@ -285,13 +285,7 @@ def banner_command(argv):
         Return a string corresponding to the command, with platform-specific
         paths removed."""
  

-- 
2.53.0


