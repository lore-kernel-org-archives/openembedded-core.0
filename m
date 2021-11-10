Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDB6C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 21:30:47 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.1788.1636579846386884471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 13:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bqlM+kdU;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636579847;
  x=1668115847;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EpmyCo81fEO2HysjuYfZV5rcASaYzBmv21FGGrGtoBc=;
  b=bqlM+kdU/LMHu4rthxECM7bBaOVM5f7ArufJh1ZtDvBxxAtBwRP3UXGU
   0VIbO8vQmWFlX1REnqMu+BBptF/J5IJFdUPq7WBq4Cs2ACbLOY4M4G6z/
   TCHmQjekpi3HHNTrLXZ343R2M/0j5Y+Vn61Qi87cpXRGGHAjauXXvFaac
   cgDMn6DVmIDSdXtGovC81cr4dz9vNTtrEzN2jAbT3l8DUwxFje2qjTwGK
   4LOmhpq9lnF7pciMGQ7n9MlFz4/hoRRk89yNy9dVLKdE8JPjB5NHUYGKr
   b4pk4vw2l89MkQtAT0usePUuGkl97Nd8fSZbsResIJjO4utqiZ9rhjoFl
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ncurses.inc: Remove a no longer relevant comment
Date: Wed, 10 Nov 2021 22:30:42 +0100
Message-ID: <20211110213042.26882-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 21:30:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158113

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 3f04545465..e32a6d12f1 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -244,7 +244,6 @@ do_install() {
 
             # Use ln -rs to ensure this is a relative link despite absolute paths
             # (as we can't know the relationship between base_libdir and libdir).
-            # At some point we can rely on coreutils 8.16 which has ln -r.
             ln -rs ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.so
         fi
         if [ -d "${D}${includedir}/ncurses" ]; then

