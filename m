Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44255D5E389
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 23:20:19 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.27473.1731194414898957752
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Nov 2024 15:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KbBm2jJR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202411092320114441af3cb29cdbe267-5_fpd0@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202411092320114441af3cb29cdbe267
        for <openembedded-core@lists.openembedded.org>;
        Sun, 10 Nov 2024 00:20:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yioGbLAepdCxPka3gSiWrhg/bmaf6BL0002WCPwaAN8=;
 b=KbBm2jJReG2GK3l1gSWib8Xt3NFjMl6z5eYWjsXjxY+goceFeubT0Z+YJRYoeUXRXIHfRR
 lyBA3VuxuDoSK2og//cYX9VJ2cANiRNUrUyOHDtbqRxttpP4IlWomrTgq++0cey/QQjhBcTR
 2ao1UK0BTc9d49H7qnwHl5c36lJcv/GkWi1LIiIz6Pmf3V/9+7bndmhZ+/mC+94NPA8Nu+hn
 vc/kFx1z5AFvJWoFPxbJm2Qs08mWR7hAwd542TfqfAnCin54eL4LWb0pFuSdlAa8Fh0jEFfb
 GtHaYghw7w7Xvg2slADXklZbud8F+1db0ue63ybEUdO/WDlSf4k8CZbA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] gstreamer1.0: set status for CVE-2024-0444
Date: Sun, 10 Nov 2024 00:19:24 +0100
Message-Id: <20241109231924.2015113-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Nov 2024 23:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206911

From: Peter Marko <peter.marko@siemens.com>

This is patched in gstreamer1.0-plugins-bad in 1.22 branch since 1.22.9
via [1].
cpe product is set to gstreamer, they share source git repository.

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/394d5066f8a7b728df02fe9084e955b2f7d7f6fe

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
index f4acb0977b..8486e258d5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
@@ -71,4 +71,6 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-iso8859-5"
 
 CVE_PRODUCT = "gstreamer"
 
+CVE_STATUS[CVE-2024-0444] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-bad in 1.22 branch since 1.22.9"
+
 PTEST_BUILD_HOST_FILES = ""
-- 
2.30.2


