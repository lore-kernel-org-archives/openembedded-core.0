Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CADECD13D2
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 19:37:12 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4485.1777491425638566711
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 12:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=fjJLMcMs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260429193703c8f71daa38000207c6-damf4_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260429193703c8f71daa38000207c6
        for <openembedded-core@lists.openembedded.org>;
        Wed, 29 Apr 2026 21:37:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=HHj+K6pJdNWW5fGL21Pobf2Qq5mPwoahqqRXv3f4vUs=;
 b=fjJLMcMs9KXNL9g9DG9iFV2o5gPDFIxh7EGGbZvFMMCjP7xpx3w6Smk+BRdlmFXjDVhJ7B
 we6YuZxCa1r3RQ7E4Rg9alRGryZtB4MqGG3UqN1F5gro6dxsWi0XvNf+n3CQV8LcvCTNDaLE
 8yzTni4F6u3FPb0KWx8PSAIWblDYpntzdjPjexFKNcp+HrckTMB9kd0O8eoUV6WmOUJEOUBX
 tUfwn0bPMREMirGUj9xxXPbuVJ1fsCLdgB6a/vXvp+0TQdI6rGTOqSQDcLF+16tKqQABqIaj
 8LayggX7CZHq70hZ8Grk5gpYXRgevQaqbIT2qnTKACqXd8KGvAlcf1/A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/7] libpng: upgrade 1.6.56 -> 1.6.58
Date: Wed, 29 Apr 2026 21:36:42 +0200
Message-ID: <20260429193647.3090502-2-peter.marko@siemens.com>
In-Reply-To: <20260429193647.3090502-1-peter.marko@siemens.com>
References: <20260429193647.3090502-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 19:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236132

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-34757 (in 1.6.57, as described in CVE description).
Solves also regression of CVE-2026-33416 (in 1.56.58).

Explicit CVE_STATUS is needed to remove it from open CVE list.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/{libpng_1.6.56.bb => libpng_1.6.58.bb}             | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.56.bb => libpng_1.6.58.bb} (95%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
similarity index 95%
rename from meta/recipes-multimedia/libpng/libpng_1.6.56.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.58.bb
index 7ede0a6c8b..630b489d00 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18"
+SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
@@ -70,3 +70,5 @@ do_install_ptest() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2026-34757] = "fixed-version: fixed since 1.6.57"

