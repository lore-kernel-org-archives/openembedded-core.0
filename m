Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD41CA5FDD
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 10:00:15 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2963.1791021611569977832
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 03:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bMI9/6Mo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202610031000099e20f6e7470002075e-bz6y9h@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202610031000099e20f6e7470002075e
        for <openembedded-core@lists.openembedded.org>;
        Sat, 03 Oct 2026 12:00:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=cD4464XkMqhyAKdu1CcztS6FB3asOUgtYD/2hsZHago=;
 b=bMI9/6MoQ/mVT+Ogc/jNrcfD7f++qJWtQ4jtI3GWpCGHYWfIfauJdkmp0cXrjUyYYBUypu
 kXd34JtXXpZt0hkPOfMC5p7cDhXxenOD9yVp0nownKxQq6TYhD8PJIp38qnP1s6lFhZ9s/88
 6fkNzd2aftlBsZ/aNJfzO+RvO6rk/1drlFfCJTY6jR2PgeLY9kC3bpNiWa2cofQLhrYA5Yb2
 tK1E5TwPOmvVNvN4csxh/ZX/d0AteGNgUcyyXU18u2zLqTcLIaeT8HVnh+naEqFS26YToDZ/
 OTU4Lf8XYo9F9C0rZqA7E61dhTryK4WzJ6woYGi8JIGo21rFaNFseiHw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libpng: upgrade 1.6.58 -> 1.6.59
Date: Sat,  3 Oct 2026 11:59:49 +0200
Message-ID: <20261003095949.3979094-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 10:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247152

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
 

