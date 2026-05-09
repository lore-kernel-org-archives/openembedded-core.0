Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC323CD3447
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 22:46:20 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20959.1778366772482033076
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2026 15:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gKd0bUeF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026050922461021d56a584200020722-vvjby7@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026050922461021d56a584200020722
        for <openembedded-core@lists.openembedded.org>;
        Sun, 10 May 2026 00:46:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=gMBLrY2/HVj2bWX3Fzfu8Quc/ES9PhWZwQ6H2+Je32w=;
 b=gKd0bUeFqSP/Dg6jZHTcWPVKHKYOO4pXNcmoRZ2CwJfeo5TKUbmkw5BR3SdzmUEAtnfvIw
 E2pRKILKyJpWG35KLVzJgcXHkUikNy33EoYfnfmdaD1+U9FKcuURIxAM9Vylcc+aKsjs94HG
 w0qyMWLIEvV4wwPGuqRSiGGRt6zxNbkCptWEkWjF5YPPTueF4D/dfINKIGy2gDy46bJOmBG0
 cAfeCTrhmrohluZAP/eDEz5OVs/sCEshTS0G5Myo25RweEL4ue91NXXFjlybUWZHEjzou6Jp
 wazvh467NIo5E1ZVAZCMaRsA/Jc7PZybo27Yj2ypjKwIT1fnTl5PeGbA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/4] gdk-pixbuf: set status for 2.44.6
Date: Sun, 10 May 2026 00:45:35 +0200
Message-ID: <20260509224536.27734-3-peter.marko@siemens.com>
In-Reply-To: <20260509224536.27734-1-peter.marko@siemens.com>
References: <20260509224536.27734-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 22:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236764

From: Peter Marko <peter.marko@siemens.com>

This is a version-less RedHat CVE.
[1] points to [2] included in v2.44.6.

[1] https://security-tracker.debian.org/tracker/CVE-2026-5201
[2] https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/6cce9311e70b969cbcc6e3e1e74ae1756ed02d5b

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
index d9c0d0ab65..b2e348ea43 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
@@ -110,3 +110,5 @@ do_install:append:class-native() {
 		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
 }
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2026-5201] = "fixed-version: fixed since v2.44.6"

