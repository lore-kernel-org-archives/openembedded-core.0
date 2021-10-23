Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4E4C433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 21:29:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.11786.1635024559817737333
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 14:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0EE0FC0005;
	Sat, 23 Oct 2021 21:29:17 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] ruby: fix Upstream-Status
Date: Sat, 23 Oct 2021 23:29:14 +0200
Message-Id: <20211023212914.392689-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 21:29:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157318

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 ...1-template-Makefile.in-do-not-write-host-cross-cc-item.patch | 2 +-
 .../0002-template-Makefile.in-filter-out-f-prefix-map.patch     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
index 826daf2cda3c..226ef3af7508 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] template/Makefile.in: do not write host cross-cc items into
 
 This helps reproducibility.
 
-Upstream-Status: Inapproppriate [oe-core specific]
+Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  template/Makefile.in | 4 ++--
diff --git a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
index 9387506c26df..2efbad75133a 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
@@ -3,7 +3,7 @@ Subject: [PATCH] template/Makefile.in: filter out -f*prefix-map
 If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no longer
 reproducible.  Fix this.
 
-Upstream-Status: Inapproppriate [oe-core specific]
+Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
 ---
 --- a/tool/mjit_archflag.sh
-- 
2.31.1


