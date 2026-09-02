Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A263C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:46:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.330.1788364014255656194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=I9MrJnX+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9A5B41A195F
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68B726054B
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6525911C7996E;
	Wed,  2 Sep 2026 17:46:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788364011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bEZE2zZwaEm7VkiUoCoJPgRnMczr38whcUETni4YP1Q=;
	b=I9MrJnX+Wg3wmEqFav7DDIthvJyxH2OiZEly8Rl0auWu8aCfasGA89Qa4yn//kdHZfHQhC
	RTHvRJ1acJPN0UIUsk7M9VlODpG+qSTrzjtzUKKAK+fqxPUGov4t2xRXmp3FZzwMvfy/Hd
	d4ZX9poMqZ+bwdUzfNoR4g9J6HUiJ9aArscbLjqB9aeMey+csgEYtWi9vn5iT1gQ79y88u
	7FUvwE/bDqni7cuuA+w9pgX0tiIySrDYN9PbJkioJJx74XL+hghb8i7KarXzhVcLAHJ8kp
	7x9Q90vt2FmJqAr4EOzJP4vBnK9q21rlAqlVZH3uSYBHOb9Yq9HgmjTwhXS8WQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 17:46:50 +0200
Subject: [PATCH 8/8] go-binary-native: upgrade 1.27.0 -> 1.27.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mathieu-updates-2026-09-02-v1-8-039b74833ec7@bootlin.com>
References: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
In-Reply-To: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788364004; l=1597;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=L8ZUduJb8LEJooOW7RPMY0wtzLLTP6qd72DNJVpSyik=;
 b=VofDXuHadJzNPH3KWKu72TbKkhRYHSLV2g7O/Eb/rWs9ekYEopCbSSdImNZCwoL6hRKxf0SkI
 fbmwfwk23PnDEpvZw9e9txDXkSZn+Cp76LJLgSJWdjSA0wGbh3KN+li
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244981

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../go/{go-binary-native_1.27.0.bb => go-binary-native_1.27.1.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.27.0.bb b/meta/recipes-devtools/go/go-binary-native_1.27.1.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.27.0.bb
rename to meta/recipes-devtools/go/go-binary-native_1.27.1.bb
index 0f6c3bc96e79..f909581e4993 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.27.0.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.27.1.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "675c26c449cbb18fc24b74650de1eabbae6e16f64326fd85a283fb3b58280685"
-SRC_URI[go_linux_arm64.sha256sum] = "51798d2c42d0e1c6ed7fd9f48728b4193abac9e8aad6dbac2fe96a81f5909bda"
-SRC_URI[go_linux_ppc64le.sha256sum] = "068085e257a6014c036c723ca62943edbf48fd168b8d00a6d39527d10b656255"
+SRC_URI[go_linux_amd64.sha256sum] = "63d339f0da5ab53635a56f2490a7984dfe12dfcff22ad749f63edaf590168445"
+SRC_URI[go_linux_arm64.sha256sum] = "3450b45a3f9ee8568792736a5c5e70a1f2e9b36c35a8f74958c03e51d7d92bec"
+SRC_URI[go_linux_ppc64le.sha256sum] = "ad1ff83c24f783c2d4a025852b928a05c199e8742a14a5482d88de0293d2bd0d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"

-- 
2.47.3


