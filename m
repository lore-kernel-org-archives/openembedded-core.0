Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F157CA0ED1
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 20:00:22 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.843.1755547213846848432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 13:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=H9bwggMC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250818200011f3a1285f0dbb19276b-dfysh2@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250818200011f3a1285f0dbb19276b
        for <openembedded-core@lists.openembedded.org>;
        Mon, 18 Aug 2025 22:00:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9uRg8n4NYRT0xJs6rXkUTo7j6EuvEx2cS6UU3MGs5eQ=;
 b=H9bwggMC07saUxT3FcmBCSoM2J+n3TRZR7I70VorwyzwXD++qU8jpZFtBVaw3Fe7G6Uzuj
 m3tXmxEOABZthrRCkryFWOYbYydpFKeCAzTxK01GWWqIPuwZhzRFsuFxQxOWs3olzLk1WS0e
 G5yJo16+VLbatTuOI9aJ0gcCz1rQE9x8X4qWBQs2dFOrdLAn3eJ1MhriVTeCUc/3XRm6zC8x
 LOiv4EoQQZ2bk5X6Pl2tQuKZKIMq9M0dOpuX3NwcfUBhKm6DOUt5VVCmOXtH94kWrNLMhsH1
 Wlctf4OjJEFqW+Xk2rXUvnuGa0HuxNCMJyeoO/t9+XT+rRShIZ4x6LwA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Praveen Kumar <praveen.kumar@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 2/4] glib-2.0: update 2.84.1 -> 2.84.2
Date: Mon, 18 Aug 2025 21:58:55 +0200
Message-Id: <20250818195857.2459975-2-peter.marko@siemens.com>
In-Reply-To: <20250818195857.2459975-1-peter.marko@siemens.com>
References: <20250818172457.1683617-1-peter.marko@siemens.com>
 <20250818195857.2459975-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 20:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222051

From: Praveen Kumar <praveen.kumar@windriver.com>

Overview of changes in GLib 2.84.2, 2025-05-20
==============================================

* Bugs fixed:
  - !4576 Backport !4575 “gclosure: fix ATOMIC_CHANGE_FIELD to read vint
    atomically” to glib-2-84
  - !4595 Backport !4582 “Windows: fix wrong typelib path” to glib-2-84
  - !4614 Backport "gstring: carefully handle gssize parameters"
  - !4616 Backport !4613 “Update macOS job for new CI runner” to glib-2-84
  - !4623 Backport !4617 “gdate: Call tzset before localtime_r” to glib-2-84
  - !4639 Backport -Wsign-conversion fixes for g_get_locale_variants() from
    !4590 to glib-2-84
  - !4640 Backport !4620 “glocalfile: Disable faccessat()-based query_exists on
    Android” to glib-2-84

(From OE-Core rev: 3deb6b59f3fa91d4fa755f49dad4ac62c3a518fb)

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{glib-2.0-initial_2.84.1.bb => glib-2.0-initial_2.84.2.bb}  | 0
 .../glib-2.0/{glib-2.0_2.84.1.bb => glib-2.0_2.84.2.bb}         | 0
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.1.bb => glib-2.0-initial_2.84.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.1.bb => glib-2.0_2.84.2.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 4368e51df8..819f3ff50a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -234,7 +234,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "2b4bc2ec49611a5fc35f86aca855f2ed0196e69e53092bab6bb73396bf30789a"
+SRC_URI[sha256sum] = "88e960dd937057407d61fcb3b45a860704b25923c37ae2478b85f2ecb5a4021f"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

