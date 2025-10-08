Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2811CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 19:27:08 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.315.1759951621166958747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 12:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=GVd3odEj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202510081926588b50bb4667000207db-ggwre0@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202510081926588b50bb4667000207db
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Oct 2025 21:26:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=eRWWoub/2fjWybKfsPLGLXnJ6/lRfzvaeqNRv4KKvc4=;
 b=GVd3odEjUlLdEToMY5fdL2ytvADGSgJiMr1/0T81R2/4hVw5l3l9xei46A+bixzhGTIl0M
 UIJkFVoN244Q8funhIIm2KSgc41PWqUjbAAsLMpHjIaYsYjeGuKlsQmX7da0ItUL7ZBGlspe
 wTdQVl60RSLipZhuxPCsRL4nc59R6ahtdqGNCFtyEQJ20mlhTbxQgxrZfWBB5xVoeqKzOj8J
 fHBKcRbIXRgMLD6Q1gt/wLwarKaFolNHZI2KQNyIYFQUpS3Cj0jO8ldvCvYyieM8HwgcYcl4
 Q6fINDEUE8CJLdzMMl32qkw6XPjSNbd9fRztv1LfemNqhZjLAXIqrFCg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] pulseaudio: ignore CVE-2024-11586
Date: Wed,  8 Oct 2025 21:26:58 +0200
Message-Id: <20251008192658.1685225-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 19:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224593

From: Ross Burton <ross.burton@arm.com>

As per the linked ticket, this issue is related to an Ubuntu-specific
patch that we don't have.

(From OE-Core rev: dc81fdc6bdf8ab39b7f2fd994d50256430c36558)

(From OE-Core rev: 72e63e44a0c6ad5a408c4dc59a24288c36463439)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a93ef8f3383..26e9e08a630 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -281,3 +281,5 @@ RDEPENDS:pulseaudio-server += "\
 RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
                                   bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit', d), \
                                   '', d)}"
+
+CVE_STATUS[CVE-2024-11586] = "not-applicable-platform: specific to Ubuntu 16.04"

