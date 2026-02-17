Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D399E9A03E
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 22:44:47 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53.1771368280064541496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 14:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BawOJODa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260217224436b36d5cee2000020728-hvzbs1@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260217224436b36d5cee2000020728
        for <openembedded-core@lists.openembedded.org>;
        Tue, 17 Feb 2026 23:44:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=10gFtS2CD0tlrt54InPsAbn6V+edLTNCydVCVUTOI0M=;
 b=BawOJODaK7hYqv1bklMELz6ivLOAdHMzS25dhNRoAmww21wXdNLxH+D/mVpDzGyBX4SgTR
 pNdFG26IG7PomjxoLWurIXBUfm87utqz4OWQXE6QfcnNgfsYqWfpT1lE46eYCIK4vWs1scOT
 FYcs+5jachp2YYVEYDMbV4GBe+Y6ekeXUAQq0t7tr9wbD8pEPAGOmt4qVB4S4eqicKkWD50H
 UQV8K+2OwWg184El8dQ4ii+TqtkgXqTvj1YzDBOXUbhNbZzLx4PayH9tVQLHrTu/35g3/1rm
 RXCqCujPfRUVVie7eoSsGMULu3GgI63moH8CjGKb0D2WO4lwx6Cg2FvQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] python3: upgrade 3.14.2 -> 3.14.3
Date: Tue, 17 Feb 2026 23:44:34 +0100
Message-Id: <20260217224434.3798764-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 22:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231280

From: Peter Marko <peter.marko@siemens.com>

From release notes [1]:

Security
* gh-144125: BytesGenerator will now refuse to serialize (write)
  headers that are unsafely folded or delimited; see
  verify_generated_headers. (Contributed by Bas Bloemsaat and Petr
  Viktorin in gh-121650).
* gh-143935: Fixed a bug in the folding of comments when flattening an
  email message using a modern email policy. Comments consisting of a
  very long sequence of non-foldable characters could trigger a forced
  line wrap that omitted the required leading space on the continuation
  line, causing the remainder of the comment to be interpreted as a new
  header field. This enabled header injection with carefully crafted
  inputs.
* gh-143925: Reject control characters in data: URL media types.
* gh-143919: Reject control characters in http.cookies.Morsel fields
  and values.
* gh-143916: Reject C0 control characters within wsgiref.headers.Headers
  fields, values, and parameters.

[1] https://docs.python.org/3/whatsnew/changelog.html#python-3-14-3-final

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/{python3_3.14.2.bb => python3_3.14.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.14.2.bb => python3_3.14.3.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.14.2.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.2.bb
rename to meta/recipes-devtools/python/python3_3.14.3.bb
index 6324151f4e..e475c6e042 100644
--- a/meta/recipes-devtools/python/python3_3.14.2.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "ce543ab854bc256b61b71e9b27f831ffd1bfd60a479d639f8be7f9757cf573e9"
+SRC_URI[sha256sum] = "a97d5549e9ad81fe17159ed02c68774ad5d266c72f8d9a0b5a9c371fe85d902b"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

