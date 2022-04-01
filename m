Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF35BC49ED8
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:43 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.5036.1648850304935720329
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 14:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=kYtxO32M;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648850305;
  x=1680386305;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=smcquS33J1uJ7xf3GLXKhNgfQxVPnPRMQ5assatGeMc=;
  b=kYtxO32MnIldkQ7fko82DWn5ws6AuobS8NGQ38fpBVER7CSZwUntM6q1
   DsPnNNxgIaIPBBWY04cZ8TkxQ7HVK6Ssvi3kziysMVNkvffAFSRVplcyt
   4hXbCJGMTtrjocjqmRSfqBYaPxvguvs7QhMK1pAfU7bL7RLWpY+QkHBZW
   feaOdjRvzAs7ytX5XevJo3IwBTUw+NfAHVfl4gssLP2rGtvIFapUZVd+6
   zmM6oGNNezYnPe/0SmlD+XsYzVk01+E7RK80uZoTFMOhukO0xuVfOw/QB
   zjBkc4RrlQeDBMxF0iDl5QxU1uFivr5tQkDFnfnUFCOa4hF2OB6j2JLFE
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-jinja2: Correct HOMEPAGE
Date: Fri, 1 Apr 2022 23:58:20 +0200
Message-ID: <20220401215820.19417-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163946

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/python/python3-jinja2_3.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
index 0a2bcd71f5..c38686a5c2 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
-HOMEPAGE = "https://pypi.org/project/Jinja/"
+HOMEPAGE = "https://pypi.org/project/Jinja2/"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"

