Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28FED3CC8E
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 00:25:18 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25184.1768436710454522559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 16:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=e3s+tOCJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260115002508a5c3d1adac0002075f-ls_m6f@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260115002508a5c3d1adac0002075f
        for <openembedded-core@lists.openembedded.org>;
        Thu, 15 Jan 2026 01:25:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BZUAkmI5kLtW7SKhW1FYI2qUNW0WB3OYOp30vOlBg/I=;
 b=e3s+tOCJLI7RyzTiRmAAQSnqzh+ZkgvSWHc8OJgZFjNM4cW0EXOUhJAU1jWPHC/hPqkyL6
 fU0Jn6+desU4dY978Hi4cf5e3dDPvXOvRxbPUbFXKkWAEmFkxC9rSJOwJUS8SKY71ZZq7C13
 yIZMT4yJc9ozVki8M4Tda8MMDLUKqx1vlC8WGyWwGanWe0d7QrVJhdhJ7w4iE0wwOy2Pq6Cg
 nAf0N5ilmUWEvnngJ1BtO8b/9SvFuBb3uipjOgh1Jvh096tf4i+njycjHugi72Ie2DvU/0PM
 TM+1x0MU42Oxo3fN8TSh+P1QSi+thVSmiZNIS+1JqsyZUHfZUd6NvrXg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][whinlatter][PATCH 2/2] libpng: upgrade 1.6.53 -> 1.6.54
Date: Thu, 15 Jan 2026 01:24:56 +0100
Message-Id: <20260115002456.49151-2-peter.marko@siemens.com>
In-Reply-To: <20260115002456.49151-1-peter.marko@siemens.com>
References: <20260115002456.49151-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 00:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229374

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2026-22695 and CVE-2026-22801.

License-Update: copyright years refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/{libpng_1.6.53.bb => libpng_1.6.54.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.53.bb => libpng_1.6.54.bb} (94%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb b/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
similarity index 94%
rename from meta/recipes-multimedia/libpng/libpng_1.6.53.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.54.bb
index 956cd243b1..3f2b80a060 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
@@ -5,7 +5,7 @@ library for use in applications that read, create, and manipulate PNG \
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5516d77a3cf75f55a0d37254e3e65a20"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9dc350edbbbee660c7d9af79487168f2"
 DEPENDS = "zlib"
 
 LIBV = "16"
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4"
+SRC_URI[sha256sum] = "01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

