Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C343AC25B75
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 00:53:19 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web11.17899.1716770795786322283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 May 2024 17:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaekyu.lee@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 27 May 2024 09:46:33 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jaekyu.lee@lge.com
Received: from unknown (HELO user1..) (10.177.224.73)
	by 156.147.1.125 with ESMTP; 27 May 2024 09:46:33 +0900
X-Original-SENDERIP: 10.177.224.73
X-Original-MAILFROM: jaekyu.lee@lge.com
From: jaekyu.lee@lge.com
To: openembedded-core@lists.openembedded.org,
	jaekyu.lee@lge.com
Subject: [PATCH] [OE-core][scarthgap] rust: remove unnecessary git signature
Date: Mon, 27 May 2024 09:46:30 +0900
Message-Id: <20240527004630.6806-1-jaekyu.lee@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 00:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199888

From: "jaekyu.lee" <jaekyu.lee@lge.com>

Remove useless git signature
---
 .../0001-Handle-vendored-sources-when-remapping-paths.patch     | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-when-remapping-paths.patch b/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-when-remapping-paths.patch
index a46ee14402..10ca1c2530 100644
--- a/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-when-remapping-paths.patch
+++ b/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-when-remapping-paths.patch
@@ -41,6 +41,4 @@ index cd276674dee6..48fdb2c7f7b7 100644
              }
              cargo.env("RUSTC_CARGO_REGISTRY_SRC_TO_REMAP", env_var);
          }
--- 
-2.39.0
 

