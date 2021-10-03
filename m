Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C302C433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 10:35:36 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.21100.1633257335137050367
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 03:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7CDEF240003;
	Sun,  3 Oct 2021 10:35:32 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] reproducible: remove ruby-ri-docs from the exclusion list
Date: Sun,  3 Oct 2021 12:35:30 +0200
Message-Id: <20211003103530.256583-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 10:35:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156547

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index e4582cb82a6a..4bd102c4682e 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -25,8 +25,6 @@ import datetime
 # https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201203-sua0pzvc/
 # (both packages/ and packages-excluded/)
 
-# ruby-ri-docs, meson:
-#https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210215-0_td9la2/packages/diff-html/
 # rust-llvm:
 #https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210825-kaihham6/
 exclude_packages = [
@@ -35,7 +33,6 @@ exclude_packages = [
 	'go-runtime',
 	'go_',
 	'go-',
-	'ruby-ri-docs',
 	'rust-llvm-liblto',
 	'rust-llvm-staticdev'
 	]
-- 
2.31.1


