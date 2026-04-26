Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1643FFF885E
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 19:27:05 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25850.1777231615813683604
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 12:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=DAKMRRZx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260426192652e2ae20e28800020791-phwqb3@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260426192652e2ae20e28800020791
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 21:26:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gV89jWvijCbF4LrHBF3838XVHRgxracp+FfCS1ATADs=;
 b=DAKMRRZxdRtsZ1b9Q4CPLlzhApWRK+oVZALaIFttHUpqjjLSfMaSXRwtiKzwt8Cj3hoyoI
 BfhEdN3V36QtlHkNIMnaK3OgEWNrkhh0tbGSsPLEoswKyga2SaYhwKV1sorWsh17itLUapJz
 c9GuwWtx6pqzHRDAuf2o64GNx8GiVdRgNKBcZvMr01hNLwEl6BK17IuFC/prP6V+wiBDqSMC
 5OZ0j37EbvpRkjZYzBUGAutFVwh8fLhUtQNfapDg3mB8viX0nFZYOJ6niW9TKM924zQ1FMoe
 TFocnwVxN8KB82wF9WQebDxP9xYYfPRnpyJbUzcEU9qnqOG6nhSCQZxg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] sed: upgrade 4.9 -> 4.10
Date: Sun, 26 Apr 2026 21:26:28 +0200
Message-ID: <20260426192628.1460245-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 19:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235970

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-5958.

Release notes: [1]

License-Update: copyright years refreshed

[1] https://gitweb.git.savannah.gnu.org/gitweb/?p=sed.git;a=blob_plain;f=NEWS;hb=v4.10

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/sed/{sed_4.9.bb => sed_4.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sed/{sed_4.9.bb => sed_4.10.bb} (95%)

diff --git a/meta/recipes-extended/sed/sed_4.9.bb b/meta/recipes-extended/sed/sed_4.10.bb
similarity index 95%
rename from meta/recipes-extended/sed/sed_4.9.bb
rename to meta/recipes-extended/sed/sed_4.10.bb
index b30ddc73ca..0966ce6a13 100644
--- a/meta/recipes-extended/sed/sed_4.9.bb
+++ b/meta/recipes-extended/sed/sed_4.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/sed/"
 DESCRIPTION = "sed (stream editor) is a non-interactive command-line text editor."
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://sed/sed.h;beginline=1;endline=15;md5=4e8e0f77bc4c1c2c02c2b90d3d24c670 \
+                    file://sed/sed.h;beginline=1;endline=15;md5=3baf8c344ffa6281a98c30294ac62a6c \
                     "
 SECTION = "console/utils"
 
@@ -11,7 +11,7 @@ SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181"
+SRC_URI[sha256sum] = "b8e72182b2ec96a3574e2998c47b7aaa64cc20ce000d8e9ac313cc07cecf28c7"
 
 inherit autotools texinfo update-alternatives gettext ptest
 

