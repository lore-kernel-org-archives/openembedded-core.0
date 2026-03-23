Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BE3F483CC
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 16:26:48 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21880.1774283200876852232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 09:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FIT9ew0/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202603231626377c7bffe1b8000207f0-a_zzfs@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202603231626377c7bffe1b8000207f0
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Mar 2026 17:26:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Q7WKnmWmhAn5h+I3650VPDPAqTVxaXA3g8puFVuFUko=;
 b=FIT9ew0/2LfcU+mKCRhB3JLNUwVcrtsL3jvqeVVjLnWoaqSNRN8oQzC8dpm5f6WoTOjbXt
 Lf2wzteI2787YKKlDmVOQ08UudC1Uk2C1epr8BO8zAI+nfQSIw7Hu0EZ5denVOK1VugLenuh
 1az7EdL9aYi1ogUyL1xIiU6oeIz3CIWrwoK0d5m7uAUpoSrbZcdjLIASx+xAKYmPFmtN4c0e
 3Pcu1f/sNkqIJV8n3WQQKTzvYYEg0XpxU7e5oo5+yMq8bdm9o6rtU9w1lxHnN8CXw4HBakz0
 lE+zRUrH553fLvoUUFXa4DwjXgIYp+hAEDQyc/B5bKyTV1wFdIoIBF7A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] freetype: upgrade 2.14.2 -> 2.14.3
Date: Mon, 23 Mar 2026 17:26:15 +0100
Message-Id: <20260323162615.8427-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 16:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233750

From: Peter Marko <peter.marko@siemens.com>

Changelog [1]:

CHANGES BETWEEN 2.14.2 and 2.14.3 (2026-Mar-22)
  I. IMPORTANT BUG FIXES
  - A bunch of potential security problems have been found.  All users
    should update.
  II. MISCELLANEOUS
  - If configuration option `TT_CONFIG_OPTION_GPOS_KERNING` is active,
    GPOS-based kerning could miss some  value pairs (bug introduced in
    version 2.14.0).

[1] https://gitlab.freedesktop.org/freetype/freetype/-/blob/VER-2-14-3/docs/CHANGES?ref_type=tags

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../freetype/{freetype_2.14.2.bb => freetype_2.14.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/freetype/{freetype_2.14.2.bb => freetype_2.14.3.bb} (94%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.14.2.bb b/meta/recipes-graphics/freetype/freetype_2.14.3.bb
similarity index 94%
rename from meta/recipes-graphics/freetype/freetype_2.14.2.bb
rename to meta/recipes-graphics/freetype/freetype_2.14.3.bb
index 08e3908235..a7a8585b15 100644
--- a/meta/recipes-graphics/freetype/freetype_2.14.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.14.3.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=eeb073d5fb86d23c52bb9b84aa256307 \
                     "
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "4b62dcab4c920a1a860369933221814362e699e26f55792516d671e6ff55b5e1"
+SRC_URI[sha256sum] = "36bc4f1cc413335368ee656c42afca65c5a3987e8768cc28cf11ba775e785a5f"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 

