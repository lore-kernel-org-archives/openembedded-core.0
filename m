Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FA6C433FE
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 21:40:01 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.40026.1643665199171059206
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 13:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=XXQyjLdV;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643665199;
  x=1675201199;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=51sVuoRXt760gTJhUoVE/ccons/66IRviSLx/GDD588=;
  b=XXQyjLdVxF356P2R1SsVbaNDeeM7C6sxwkxZG/bAV4oeJO+QGpH4jRBi
   DHiuJcA1KbF9/E0fxbISWKBFMXpSzXKu5i1IsOEa4Wwix3mRq+rKG8k+2
   r2qRi/71G9fdroQJIEDbKq1TJT6V1gc0bK3qlFDypI7ZdSKOzw0yzwJcj
   mbCJUqiGNxpy681D1shjuUvFVb4REySUEi81ZrjNmP5as562xIKVocGaK
   afhtFZgfEc5/EwFTVb+u+eqdLP0Kf7V7jbIqXE5C96jMe0XQEEkNlwKxk
   Prs+m98inoQ9V2r7KdSFppBefDsFwpljq1IyQXYjtzDXcI+m7F1ud+rdY
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] glibc-tests: Correct PACKAGE_DEBUG_SPLIT_STYLE
Date: Mon, 31 Jan 2022 22:39:53 +0100
Message-ID: <20220131213954.29887-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 21:40:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161138

It was set to "debug", but the officially supported value is ".debug".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/glibc/glibc-tests_2.34.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb b/meta/recipes-core/glibc/glibc-tests_2.34.bb
index 9cbf8776dd..8c7ecf89ba 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.34.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
@@ -102,7 +102,7 @@ EXCLUDE_FROM_SHLIBS = "1"
 # It is more handy to have _all_ the sources and symbols in one
 # place (package) as this recipe will be used for validation and
 # debugging.
-PACKAGE_DEBUG_SPLIT_STYLE = "debug"
+PACKAGE_DEBUG_SPLIT_STYLE = ".debug"
 
 # glibc test cases violate by default some Yocto/OE checks (staticdev,
 # textrel)

