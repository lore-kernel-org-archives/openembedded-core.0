Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A03C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:45:40 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net
 (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web08.28834.1657547129838399305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 06:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YjyZZATY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227,
 mailfrom: fm-256628-20220711134522ba2071d5c508c06084-ydi5i_@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id
 20220711134522ba2071d5c508c06084
        for <openembedded-core@lists.openembedded.org>;
        Mon, 11 Jul 2022 15:45:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yO28VBJyaDbjz6hobR28uS1L8Uv5WTjBuXrWUGVNb7A=;
 b=YjyZZATYei5iusbOi4tpAuyY2kDY/hZ431ixhiCHsWHw1V1Pnv2z0DfijCa1duPKpeGeib
 tuORXBaC12ZFOOk+UtczPjfFU6LXZQeF2y17/EXnU02H2ya+sLq8jOoeqYDfNl+3RPQuJuHn
 kO6ANGKvngligKRuDVswlEImFNzL0=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][kirkstone][dunfell][PATCH] alsa-state: correct
 license
Date: Mon, 11 Jul 2022 15:45:04 +0200
Message-Id: <20220711134504.1831682-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 13:45:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167871

* add GPL license because of alsa-state-init file
* gpl link points to gpl3, but at time of adding this file was actually
  pointing to gpl2, so should correspond to SPDX GPL-2.0-or-later
* remove date as the file was already changed several times since then
---
 meta/recipes-bsp/alsa-state/alsa-state.bb              | 7 +++++--
 meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init | 3 +--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index df546633f1..27b2eccbe4 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -8,8 +8,11 @@ SUMMARY = "Alsa scenario files to enable alsa state restoration"
 HOMEPAGE = "http://www.alsa-project.org/"
 DESCRIPTION = "Alsa Scenario Files - an init script and state files to restore \
 sound state at system boot and save it at system shut down."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LICENSE = "MIT & GPL-2.0-or-later"
+LIC_FILES_CHKSUM = " \
+    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
+    file://alsa-state-init;beginline=3;endline=4;md5=3ff7ecbf534d7d503941abe8e268ef50 \
+"
 PV = "0.2.0"
 PR = "r5"
 
diff --git a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init
index eee59cb321..a04cc27004 100755
--- a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init
+++ b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init
@@ -1,10 +1,9 @@
 #! /bin/sh
 #
 # Copyright Matthias Hentges <devel@hentges.net> (c) 2007
-# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 # Filename: alsa-state
-# Date: 20070308 (YMD)
 
 # source function library
 . /etc/init.d/functions
-- 
2.30.2


