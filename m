Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C79C77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 18:30:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.29652.1684261821592713366
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 11:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jP65xdNH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 265F160007;
	Tue, 16 May 2023 18:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684261820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZyh7rOqIVyETW1YUhTC5T5f5WsSyrUZt1tFVwjCLBY=;
	b=jP65xdNHqkHoc5HFbfLYQ4WcYe6Gghn/pZWNvp3HgytMBPcgWdjkAodCG2aJ9kFYkXziMX
	zhpV7RMglX27udLF+6D3eXK6tMp5QVbxyugW7cYOVlopqDiMTUfigzXthCfpSld6gDfSZR
	VYf8wJhqf4t0tDxEoDrtWnDLZeI90dw8uKKUB32cGzSvwJclu/QcG8los2DMbW1vi00tzj
	A/lrfWMlElstepnqU4M1NPBbUHiY8/Jd8VPx6orCpo6nBhLbQzqr9BYWa802zzHJ5jnm2q
	R+b31NRzEm8TlGvlIkv8YgxZirNU4cej84wB8FC4bDubuZZh3Eq8IMgMQKhJaQ==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] bitbake.conf: add "xz" to HOSTTOOLS
Date: Tue, 16 May 2023 20:30:07 +0200
Message-Id: <20230516183009.1874105-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516183009.1874105-1-michael.opdenacker@bootlin.com>
References: <20230516183009.1874105-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181409

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

xz is necessary to extract the uninative binary shims

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index afd9e2f552..2a6aefc01a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -529,7 +529,7 @@ HOSTTOOLS += " \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
-    uniq wc wget which xargs zstd \
+    uniq wc wget which xargs xz zstd \
 "
 
 # Tools needed to run testimage runtime image testing
-- 
2.34.1


