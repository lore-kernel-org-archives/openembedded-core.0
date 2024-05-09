Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA360C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 20:55:24 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.2609.1715288121458068036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 13:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KMFAqCQ+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2024050920551873ba30d57512094395-edg1tu@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024050920551873ba30d57512094395
        for <openembedded-core@lists.openembedded.org>;
        Thu, 09 May 2024 22:55:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ykUynLNk577uUouSgh+uzNhpJzjsjznUvbSqWH7MD9M=;
 b=KMFAqCQ+3v7cw0kAh5IxOvx0lLulTi4E+IAm5cDyl90yFriG8vlSKmDqLCs1xzJ2rufju8
 f88JI16XYpDA4dp4kp43DviSYAK57cAzvodM/fBLcgDL8oVfeT1HZIW3la1k7X5/TvqixU2/
 AM1yhTmf4xqJ3avh1217jGxO8Xb8A=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] glib-2.0: Upgrade 2.78.5 -> 2.78.6
Date: Thu,  9 May 2024 22:54:30 +0200
Message-Id: <20240509205430.250059-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 20:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199184

From: Peter Marko <peter.marko@siemens.com>

Handle regression of CVE-2024-34397 fix.

News (https://gitlab.gnome.org/GNOME/glib/-/commit/d40f72e98e4734ba826ba9a278814530720ba760):

Overview of changes in GLib 2.78.6, 2024-05-08
==============================================
* Fix a regression with IBus caused by the fix for CVE-2024-34397 (#3353,
  work by Simon McVittie)
* Bugs fixed:
  - #3353 Fixing CVE-2024-34397 caused regressions for ibus (Simon McVittie)
  - !4056 Backport !4053 “gdbusconnection: Allow name owners to have the syntax
    of a well-known name” to glib-2-78

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/{glib-2.0_2.78.5.bb => glib-2.0_2.78.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.5.bb => glib-2.0_2.78.6.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.78.5.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index d0aac737f7..1a4278b1bc 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -22,7 +22,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "39b26044bd44dc30f427202add4997f554723c30017e92ff36da4197a2c916aa"
+SRC_URI[sha256sum] = "244854654dd82c7ebcb2f8e246156d2a05eb9cd1ad07ed7a779659b4602c9fae"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.30.2


