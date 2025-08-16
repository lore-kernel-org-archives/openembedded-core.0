Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39D2CA0EE9
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 15:44:03 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.36420.1755359036789295170
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Aug 2025 08:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=S9OQ+WXc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250816154350d2eb6504facdb65230-r4omru@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250816154350d2eb6504facdb65230
        for <openembedded-core@lists.openembedded.org>;
        Sat, 16 Aug 2025 17:43:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=dW2Eco/ooC+maHSvx+s/ZxrjM0iQ2y/h4ksusGFBnYc=;
 b=S9OQ+WXcD0nfRRlbjEdQ94+WsYgTvO6oa+TXDghqxyIsP4K85f5OQun/5Ju6lXaEhFR6O/
 Y3o5GR8IZLt+ULqV8jMHU0xRgtzCsMvQckFBZ1H8okBvdX0b7AeI244HpsN6t3tXfsDjl1lT
 zijt4g0Jue8l+cWMYwHU6ZheikXxC5ecyjU0JtrMEX8vXqP9q8MYvFhnQvXOmwd7cQHHXw3k
 Q7BF8yZG9l7yvBorQIwcaGAJ5ZU2lHj2EynCkHGK41LQawm5RETFBsz5GIItMSunlKkYnLGH
 gA87zrOni1tefj1XAkUHLdYayBu9ViA0y1oEbhFuc5qtIhGm3lssShoQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] python3: upgrade 3.13.6 -> 3.13.7
Date: Sat, 16 Aug 2025 17:43:03 +0200
Message-Id: <20250816154303.309306-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Aug 2025 15:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221998

From: Peter Marko <peter.marko@siemens.com>

Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-13-7-final

Refresh patches via devtool.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0001-test_locale.py-correct-the-test-output-format.patch    | 2 +-
 .../python/{python3_3.13.6.bb => python3_3.13.7.bb}             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.13.6.bb => python3_3.13.7.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index f672ee7ad7..3fc3a7e8ce 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -34,7 +34,7 @@ diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
 index da4bd79..fd9e67d 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -576,7 +576,7 @@ class TestMiscellaneous(unittest.TestCase):
+@@ -502,7 +502,7 @@ class TestRealLocales(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3_3.13.6.bb b/meta/recipes-devtools/python/python3_3.13.7.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.6.bb
rename to meta/recipes-devtools/python/python3_3.13.7.bb
index 184d71bdce..e9eb610949 100644
--- a/meta/recipes-devtools/python/python3_3.13.6.bb
+++ b/meta/recipes-devtools/python/python3_3.13.7.bb
@@ -36,7 +36,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "17ba5508819d8736a14fbfc47d36e184946a877851b2e9c4b6c43acb44a3b104"
+SRC_URI[sha256sum] = "5462f9099dfd30e238def83c71d91897d8caa5ff6ebc7a50f14d4802cdaaa79a"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

