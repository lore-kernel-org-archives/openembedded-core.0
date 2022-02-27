Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDBFC433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 18:21:48 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.11594.1645986106122988617
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 10:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=j9pOyeUb;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645986106;
  x=1677522106;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=d3cAWJ8mLvLBfSiCH8imKPzqYLTm0VGksASwkz3EueA=;
  b=j9pOyeUbyy6Oe9X6sE5bdcJ7YYJim26/RmXP4CKjcxY17YcNZ9Mhg1dQ
   c77/ztjpyEWmk+2R71zL9SgAjw+o8ilBmta0vV58UZqJt1xAcBF4d00Eh
   kP6YtsswlpUgVDJF8hhdMGHoqnAPX8ySCS/31qHgujEtBDsc+p9oBkqB6
   RPm7V8EidJG+8SH4N60vuxjnOhJic5uhaaZX+BqWSIWqLKNzhPmLc2jjM
   8qKkZE3H07DN120eC+/se8GlB9XCxvrum2RIeL26BKKHAsjuKOEWmRinS
   uJ0KEy9d1S5anqaADaU2Jduc0mWpm1JXias7QGZdOFpWFUrjAqu48uIhk
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/6] selftest: recipetool: Correct the URI for socat
Date: Sun, 27 Feb 2022 19:21:33 +0100
Message-ID: <20220227182138.5364-2-peter.kjellerstedt@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220227182138.5364-1-peter.kjellerstedt@axis.com>
References: <20220227182138.5364-1-peter.kjellerstedt@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Feb 2022 18:21:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162439

The URI to the socat tarball used in the
recipetool.RecipetoolCreateTests.test_recipetool_create_simple test has
been moved to an "Archive" directory.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 09448bad01..a5fe4084b4 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -377,7 +377,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         pv = '1.7.4.1'
-        srcuri = 'http://www.dest-unreach.org/socat/download/socat-%s.tar.bz2' % pv
+        srcuri = 'http://www.dest-unreach.org/socat/download/Archive/socat-%s.tar.bz2' % pv
         result = runCmd('recipetool create %s -o %s' % (srcuri, temprecipe))
         dirlist = os.listdir(temprecipe)
         if len(dirlist) > 1:

