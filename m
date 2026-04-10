Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288FAF4486A
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:11:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155768.1775826667570255258
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 06:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KbWp8Ls7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DC1BC4E429B3;
	Fri, 10 Apr 2026 13:11:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B3EE4603F0;
	Fri, 10 Apr 2026 13:11:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EEB310450022;
	Fri, 10 Apr 2026 15:11:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775826665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lvH0ODqfw5xPUtzjHn2hSQeo0fMX71o2mg05hWQKJM0=;
	b=KbWp8Ls7do+azmH8/QE8zU4ODzCogPpE8GAuZNZah4xa77Ocp81hCHZff+W8Z8cZXbV5ai
	zeADqS5rFoEBimykTrKP+jFx+LfqhZvzEIH2eRYbDNpya+Vw5AQ2IT40yP0+BZFI44aVWZ
	FwBImkwTKpcqD3Mitzda4oc85I0YAIQWQ7mYXIv6ijwJ14oXdHVpm8w/+6tNh/rANcxfGX
	7oTaUXIglupaaB+W//7jGf2HlvvxjAhHKMoUnsXU+D+eIVx33SEb8jmnuJKgXMIBJ4iVg2
	aa86gQEz+PudVt0V7T4yCwhXEZUORz1dDIKKN8L08gKJ9O+TfTwWXZaldsPdNg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Fri, 10 Apr 2026 15:10:45 +0200
Subject: [PATCH 3/4] gtk+: Remove escaping of the plus sign in
 `CVE_PRODUCT`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-fix-cpe-escaping-v1-3-ed63c2477f46@bootlin.com>
References: <20260410-fix-cpe-escaping-v1-0-ed63c2477f46@bootlin.com>
In-Reply-To: <20260410-fix-cpe-escaping-v1-0-ed63c2477f46@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
 peter.marko@siemens.com, stefano.tondo.ext@siemens.com, 
 jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235027

The `+` character is now properly escaped by `cve_check.cpe_escape()`

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
index 35f99b2de0c1..51a293c1d8ee 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
                     file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
 
-CVE_PRODUCT = "gnome:gtk gtk:gtk\+"
+CVE_PRODUCT = "gnome:gtk gtk:gtk+"
 
 DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf gdk-pixbuf-native"
 

-- 
2.53.0


