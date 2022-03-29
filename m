Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91301C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 16:38:20 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.9181.1648571898677264304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 09:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=eBhPgPOn;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648571899;
  x=1680107899;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BZbxAbKobuiQtoBh6tlg+9YrTJCo1EmTk/sb53l0PO8=;
  b=eBhPgPOnNJHUzKtBOFolxazYzmj7JEeGR8i2632UaDJ/8YDLm67YeV4L
   llNJPPboaE/C/qlB1qUtkyBVtxL3sC+0ddf5uxNYomGirLf+mvEJGuoQg
   40MgmMsAICPEIqKkZ5tqV3NWsDrK0PWciosn6geVfS+CpQiLM866LK5ju
   5zVHyGjqZXfUPuaadatcSsKMXEGEGZhGTMPsrEEJgGkvvQo6JnulQL7+j
   VhJ8rHLj7RxrlnDDZSQ230BXeHczg8Ed44fzwz0eIwQlubRnKcuQJh/y/
   qYIs+xi5jFwlmtwI8mb7pWV5p9MhvaIawm7OL2sMvHmVQy1YlyR5JZ37L
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] lttng-tools: Update to 2.13.6
Date: Tue, 29 Mar 2022 18:38:14 +0200
Message-ID: <20220329163814.7905-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 16:38:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163755

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.6.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
index 0ea4da05ce..d40d0a2dd0 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
+SRC_URI[sha256sum] = "1d52d249437b3f7ba23a45a22c3e26dde006a5da10e96753952084a98e0523e3"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 

