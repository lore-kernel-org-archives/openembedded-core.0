Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA47CC2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 11:02:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.11042.1643194963702167893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 03:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0800240003;
	Wed, 26 Jan 2022 11:02:40 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] local.conf.sample: use https for SSTATE_MIRRORS
Date: Wed, 26 Jan 2022 12:02:37 +0100
Message-Id: <20220126110237.1062852-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 11:02:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160980

Both http and https work, but we will get fewer user questions with https

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/conf/local.conf.sample | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 7119f0f165..b3e0f11990 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -185,7 +185,7 @@ BB_DISKMON_DIRS ??= "\
 # used to accelerate build time. This variable can be used to configure the system
 # to search other mirror locations for these objects before it builds the data itself.
 #
-# This can be a filesystem directory, or a remote url such as http or ftp. These
+# This can be a filesystem directory, or a remote url such as https or ftp. These
 # would contain the sstate-cache results from previous builds (possibly from other
 # machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the
 # cache locations to check for the shared objects.
@@ -193,7 +193,7 @@ BB_DISKMON_DIRS ??= "\
 # at the end as shown in the examples below. This will be substituted with the
 # correct path within the directory structure.
 #SSTATE_MIRRORS ?= "\
-#file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
+#file://.* https://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
 #file://.* file:///some/local/dir/sstate/PATH"
 
 
-- 
2.25.1


