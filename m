Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD58F42100
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 17:37:27 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.989.1776274641347807162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 10:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=fF+Gp2nq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260415173717191de44520000207dd-07oeyp@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260415173717191de44520000207dd
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Apr 2026 19:37:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TKdi9+gKW2Taqx8OGdHR/f9hTPIh2WvNrjXonWD5ZEE=;
 b=fF+Gp2nqzSxOQx/7mDZhrs73OC0VBH7Fo+m+0Yf2kbizBi9n4ZlFTK7VZeDq8g5KA+7GvY
 StUFoLS+5DDJixNs38IJPiHooGSBtxTKO6oqccGKsaipJUueM139IegUZng4o4ON2TwFlsBe
 2E+LMXmphyro1G1vVWw6IcjxQzIL0hBOV6vs4rXclD+ExfMvi2JbG2YoaKBlMTDu+TR8D8eY
 YW8HHzwwXprOIUqEbYzTTOJxD641OtE8haDAYFjeWCIs4jznt5Tu6hgn6hL4sb+f9TpGoI8L
 hiCvpKcI4nery4HczDshv/nIjiuOTiqkEoEG5wKikOEeUomsnYSlBgEw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libarchive: upgrade 3.8.6 -> 3.8.7
Date: Wed, 15 Apr 2026 19:37:12 +0200
Message-ID: <20260415173712.1451880-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 17:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235314

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-5121 (points to [2] per [3]).
Since it's Redhat version-less CVE, add explicit CVE_STATUS.

Release information [1]:

Libarchive 3.8.6 is a security and bugfix release.

Notable fixes:

* CAB: fix NULL pointer dereference during skip (#2900)
* CAB: Fix Heap OOB Write in CAB LZX decoder (#2919)
* cpio: various fixes and improvements (#2899, #2908, #2910, #2939)
* contrib/untar: fix out-of-bounds read (#2903)
* iso9660: fix undefined behavior (#2897)
* iso9660: fix posibble heap buffer overflow on 32-bit systems (#2934)
* libarchive: fix handling of option failures (#2871)
* libarchive: do not continue with truncated numbers (#2911)
* libarchive: lzop and grzip filter support (#2947)
* RAR: fix LZSS window size mismatch after PPMd block (#2898)

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.7
[2] https://github.com/libarchive/libarchive/pull/2934
[3] https://security-tracker.debian.org/tracker/CVE-2026-5121

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/{libarchive_3.8.6.bb => libarchive_3.8.7.bb}   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.6.bb => libarchive_3.8.7.bb} (95%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.6.bb b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
similarity index 95%
rename from meta/recipes-extended/libarchive/libarchive_3.8.6.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.7.bb
index d579cdb65a..a65afb7b22 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "213269b05aac957c98f6e944774bb438d0bd168a2ec60b9e4f8d92035925821c"
+SRC_URI[sha256sum] = "4b787cca6697a95c7725e45293c973c208cbdc71ae2279f30ef09f52472b9166"
 
 inherit autotools update-alternatives pkgconfig ptest
 
@@ -88,3 +88,5 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
+
+CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"

