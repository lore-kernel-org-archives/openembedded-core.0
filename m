Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6F3CA6017
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 21:57:11 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5928.1791496628921882855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 14:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=cFnJiICO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261008215706973c3d49d5000207e2-oidtqz@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261008215706973c3d49d5000207e2
        for <openembedded-core@lists.openembedded.org>;
        Thu, 08 Oct 2026 23:57:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QXBY2jY60IjGjLOI3EpuZLz/3nIMx1tosSHZwfJv9uA=;
 b=cFnJiICOF78Qb/LGJRGBLhCQoWzSCCTGb/xwN2frAMn0gc7OXUuqW1AlD1B5oTKDCColHu
 CAYKIqW1DrbWwcCvT2U1+LABANIwTqQ8d9kvD1ckcpa4SOyY4XF6HQ8NJJtnSrR4wNCj1wPb
 d7cik7fgCNQLI78pwxy1lhbD1ZL+Mvl3z9JJH7Ynbl7YmsdBG02n053YvTklgt4MOTtOkCC9
 vuYkViY6v09flHdCYK1xIGiLC8Nx9JugB5mXFrYcMAf57liAxFtv1Rbt+n8GPs7krpzSp38t
 hD4hV5R2Gqkit6etoatMZlk3e8FA0lQ8Ycm1nBxieyrLTMZSW9lJhGAw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] libpng: upgrade 1.6.58 -> 1.6.59
Date: Thu,  8 Oct 2026 23:56:51 +0200
Message-ID: <20261008215651.631740-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 21:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247453

From: Peter Marko <peter.marko@siemens.com>

Release notes [1]:

Version 1.6.59 [September 28, 2026]
  Fixed CVE-2026-46675 (medium severity):
    Use-after-free of zlib input in `png_read_end` after incomplete zTXt, iTXt
    or iCCP decompression.
    (Reported independently by Ze Sheng and
    <JasonHonKL@users.noreply.github.com>.)
  Fixed a regression introduced in version 1.6.47 that caused libpng to reject
    hIST chunks in their correct position, after PLTE.
    (Contributed by Yuki Sekiguchi.)
  Prevented a double free of `png_struct` members after an allocation failure.
    (Contributed by Anthony Hurtado.)
  Applied fixes and updates to the CMake build.
  Adopted the REUSE Specification for licensing the CI files.

[1] https://github.com/pnggroup/libpng/blob/v1.6.59/CHANGES#L6388

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 907c6fa2d0c4f8a8f765cde004c55fb2dd2c402d)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../files/0001-tests-stream-per-test-results-to-stdout.patch    | 2 +-
 .../libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb}               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch b/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
index 139495d211..2bedb607f6 100644
--- a/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
+++ b/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
@@ -50,7 +50,7 @@ index eb7078158..a2e64fbe6 100644
  endif
  
  # man pages
-@@ -165,7 +171,7 @@ pkgconfig_DATA = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.pc
+@@ -216,7 +222,7 @@ pkgconfig_DATA = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.pc
  # not done in the source directory!
  EXTRA_DIST= \
  	ANNOUNCE AUTHORS CHANGES INSTALL LICENSE README TODO TRADEMARK \
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb b/meta/recipes-multimedia/libpng/libpng_1.6.59.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.58.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.59.bb
index 928b010c9c..4dbd769cf7 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.59.bb
@@ -15,7 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://0001-tests-stream-per-test-results-to-stdout.patch \
 "
 
-SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
+SRC_URI[sha256sum] = "d80dd2a38a37f803cb9b6ac7b14bd6e74ddc3b654780a8380bdf93523fdb4389"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

