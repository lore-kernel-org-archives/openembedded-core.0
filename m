Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C489EC1449
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:37:18 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18351.1772545032262495460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 05:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm2 header.b=CPPbol6x;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1334352-20260303133709a817fab64e000207ed-u2_p_p@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260303133709a817fab64e000207ed
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Mar 2026 14:37:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ZnnNsiQD2sh/7W19Ra5VQC8g4R1b7s+kTOvoZOO3dYA=;
 b=CPPbol6xYEsEH8fsOTu4z52Xj9hsW4xbeKdaCHhtEQwpmbfDiDfl9OfdYWbXH6o43qFMbB
 Mj2b0E9uQj400fu4YUAjOINyLj9YRmLWkyXfzWJhiqsEW7NZnTfLs/KJKj6TrGsPR3IEdLP7
 O9QGinbDjl5cKztqUn5VwQGcmb28pWCeL0d9alJLRUYXatG1QEReNkjVMAFaZbhxe9+AuPMh
 JF0PMbCw+VsMNt/LRvMXQ6TLi2hAvLJBymSY6n3Q1n9fZAAMtnOrMIDo3llR9Rrjt9Lz25hN
 uWTeLwKy5XPC0PJuyAzO0wv7xk/QYFGw/mZcjmseReS3g6o5TGj49fag==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [PATCH 2/6] freetype: upgrade 2.14.1 -> 2.14.2
Date: Tue,  3 Mar 2026 14:36:41 +0100
Message-ID: <20260303133645.1449-2-andrej.kozemcak@siemens.com>
In-Reply-To: <20260303133645.1449-1-andrej.kozemcak@siemens.com>
References: <20260303133645.1449-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 13:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232313

Changelog: https://gitlab.freedesktop.org/freetype/freetype/-/blob/f4205da14867c5387cd6a329b90ee10a6df6eeff/docs/CHANGES

Changes:
  - Several  changes  related  to  LCD  filtering  are implemented  to
    achieve better performance and encourage sound practices.

Bug fixes:
  - A bunch of potential security problems have been found.  All users
    should update.
  - The italic angle in `PS_FontInfo`  is now stored  as a fixed-point
    value  in degrees  for  all  Type 1 fonts  and  their derivatives,
    consistent  with  CFF  fonts  and  common  practices.  The  broken
    underline position and thickness values are fixed for CFF fonts.

Miscellaneous:
  - The `x` field in the `FT_Span` structure is now unsigned.
  - Demo  program  `ftgrid` got  an  option  `-m`  to select  a  start
    character to display.
  - Similarly, demo program  `ftmulti` got an option `-m`  to select a
    text string for rendering.
  - Option  `-d` in  the demo  program `ttdebug`  is now  called `-a`,
    expecting  a  comma-separated  list  of  axis  values.   The  user
    interface is also slightly improved.
  - The `ftinspect` demo program can now be compiled with Qt6, too.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../freetype/{freetype_2.14.1.bb => freetype_2.14.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/freetype/{freetype_2.14.1.bb => freetype_2.14.2.bb} (94%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.14.1.bb b/meta/recipes-graphics/freetype/freetype_2.14.2.bb
similarity index 94%
rename from meta/recipes-graphics/freetype/freetype_2.14.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.14.2.bb
index dc59e5656b..08e3908235 100644
--- a/meta/recipes-graphics/freetype/freetype_2.14.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.14.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=eeb073d5fb86d23c52bb9b84aa256307 \
                     "
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "32427e8c471ac095853212a37aef816c60b42052d4d9e48230bab3bdf2936ccc"
+SRC_URI[sha256sum] = "4b62dcab4c920a1a860369933221814362e699e26f55792516d671e6ff55b5e1"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.3


