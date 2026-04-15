Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B7DF428C8
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 19:08:20 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2992.1776280090438925053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 12:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WNlMN9LD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260415190807ea692f24a1000207a6-jpfwtg@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260415190807ea692f24a1000207a6
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Apr 2026 21:08:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Ahg5lUpVfdZMeVHcp+hnqWRqAsJ+85DeclItdFYv6po=;
 b=WNlMN9LDE19lQdCujELyWpUGk5Iz88IQecJFi7AByX+hBUeWAtyHApyYesY+q+hKWMgFNx
 oeArgFQ11ihf+LZGHgDiEKAFKiL1tu9AaR3YeIkx8SHCuQofX7Cy+jMxgH9Aa8ySVuWJN18F
 /ZbSgxSZuuuFMZp/S3X2OiuoXEwoYaUezmSUUdJsTropJKrDuYj8WJecQ4bFOktK2RwkmCNh
 u7RvKW4/kJGTOtsbKGV0gV5Slx2a9x2ZQabkTDtms7E+EYTYru468QWT+HNg9vJfi3NJccxL
 GNAt9wCHJFyBYlwe+uZohYWnogjP+kSe67RiGwRhIsGKsGumpS1NqDYQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libexif: upgrade 0.6.25 -> 0.6.26
Date: Wed, 15 Apr 2026 21:07:17 +0200
Message-ID: <20260415190717.2086465-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 19:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235321

From: Peter Marko <peter.marko@siemens.com>

Release notes [1]:

libexif-0.6.26 (2026-04-14):

* Security issues fixed:
  * CVE-2026-40386: An unsigned integer underflow in Fuji and Olympus makernote handling
  * CVE-2026-40385: An unsigned integer overflow on 32bit systems in Nikon makernote handling
  * CVE-2026-32775: A buffer overwrite via integer underflow in makernote handling

* handle JPEG APP3 marker

* added EXIF_TAG_IMAGE_DEPTH tag

* translations updated: Arabic, German, Spanish, Polish, Romanian,
* Serbian, Swedish, Ukrainian, Chinese

[1] https://github.com/libexif/libexif/releases/tag/v0.6.26

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libexif/{libexif_0.6.25.bb => libexif_0.6.26.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libexif/{libexif_0.6.25.bb => libexif_0.6.26.bb} (93%)

diff --git a/meta/recipes-support/libexif/libexif_0.6.25.bb b/meta/recipes-support/libexif/libexif_0.6.26.bb
similarity index 93%
rename from meta/recipes-support/libexif/libexif_0.6.25.bb
rename to meta/recipes-support/libexif/libexif_0.6.26.bb
index c57855303f..56b2e1e168 100644
--- a/meta/recipes-support/libexif/libexif_0.6.25.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.26.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "7c9eba99aed3e6594d8c3e85861f1c6aaf450c218621528bc989d3b3e7a26307"
+SRC_URI[sha256sum] = "0830ed253fceeb60444fb309598bc8a9491d3007dc054aad3a50a347c5597c57"
 
 inherit autotools gettext github-releases ptest
 

