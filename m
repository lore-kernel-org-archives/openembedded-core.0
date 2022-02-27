Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B4AC433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 18:21:49 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.11438.1645986106775965675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 10:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=o+Fji31y;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645986107;
  x=1677522107;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QNcPuLLuG8dT5qH5uXcA5qyMbL2bmn/SkoPijKhGmOA=;
  b=o+Fji31yauvUIcgelGDxnRMItrNlze/dF1bz69RYiHM/slwnsO19jrq0
   iY8r7mduAAsHhfanxP0GzOHZX0OaLXI4Hs7ZOnDZcBi71YzT9TvFTDHmZ
   9q5I6qsNnzGfeTJF828L4dunbZ/E5ofFHqoNYuvzDZQkGd6aHvQey2P+9
   2EKiARfon7res5+XUedRoO2qVCncApC2tIFyyNZ5ZYt6JgmL6wRlVEv0m
   xuMwEDdftCOVbcnrx2erqYQ3ToAJlajZZLLVBxA8LYZZE7aOsGkT+LFr4
   ih4/pGgJEhlTNS6uSnkMNH0MAm9ylRdoLbLuuj9AVuAVbl+RqSvJ0glVV
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/6] default-distrovars.inc: Remove the empty default for
 WHITELIST_GPL-3.0
Date: Sun, 27 Feb 2022 19:21:32 +0100
Message-ID: <20220227182138.5364-1-peter.kjellerstedt@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Feb 2022 18:21:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162440

There is no reason to set an empty default for it, while not doing it
for all other potential WHITELIST_* variables. The reason it was set
here is a leftover from before when it was actually set to a value.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 3bba651a77..3edba1b6d0 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -20,8 +20,6 @@ DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 la
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
-WHITELIST_GPL-3.0 ?= ""
-
 COMMERCIAL_AUDIO_PLUGINS ?= ""
 # COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
 COMMERCIAL_VIDEO_PLUGINS ?= ""

