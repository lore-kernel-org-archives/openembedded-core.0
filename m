Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B1DCE8E64
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 11:28:57 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.12441.1729769333897639888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 04:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=YvZz3IiY;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=MImCGXpioh+fP0x+FsK/EdXij5SOCDzwc9z9VeFjMSA=; b=Yv
	Zz3IiYwSE0m/QD12adGdP1RnSu0b04nt2uw3aGNQIu/SajJon1hQO7/2qJrD/zkgIOjin1uy/D71T
	xwPWMK73NUJJ9hS4L2EDWAn0DYddjeVwXwCctF6CY05FBDFEnqdPfeDc0Kps2SFgNesl4c0MqDYIK
	TFIBqheM83M+oXhPbi3ntCUO8qSoIQhp9QFc/A6K2X708cOa/umYeWOT/cg8KmmCaIAm0KGlxrbsL
	2stEFhFJT0ioy3LxnQ2HN+dxWwlcJTqYyDm71ERF/Us54fMQWb7qHaTxsa97yOsvdAp+WLPxBrWu5
	yrJMTS7XWhjnfQU/+TZUCOg5kCO1z2tQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1t3w1L-000B1k-MQ; Thu, 24 Oct 2024 13:28:51 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1t3w1L-000IhH-1M;
	Thu, 24 Oct 2024 13:28:51 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 24 Oct 2024 13:28:43 +0200
Subject: [PATCH] files: Amend overlayfs unit descriptions with path
 information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-overlayfs-templates-v1-1-58d46a936ff8@geanix.com>
X-B4-Tracking: v=1; b=H4sIAGovGmcC/x2MQQqAIBAAvxJ7TkgJor4SHczWWjCN3YhC+nvSY
 Q5zmMkgyIQCQ5WB8SKhFIvougK32biioqU4mMa0uqDShRzs40WduB/BnijK2X5ujenmxmko5cH
 o6f6v4/S+H/9gco5lAAAA
X-Change-ID: 20241024-overlayfs-templates-ca9b4227b0c1
To: openembedded-core@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729769331; l=2086;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=qY8F2srQ0T5zAtpvo3M6Klg2zT1BQ3tFz9jIN8i7xO8=;
 b=3u0bbVs6w8Xdk/6bUjrJ9AveycbrBDDJiJnFHf69vKzW1S4les0k4thZSOlacl6+jZpLOMZ5q
 hvecx42c7pJD77WwCAV0O88DVZzlVJDqLhP2TjcV1QCO7bip2E/NMNG
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27437/Thu Oct 24 10:33:37 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 11:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206291

Having something like

Starting Overlayfs directories setup /home...
Starting Overlayfs directories setup /root...
Finished Overlayfs directories setup /home.
Finished Overlayfs directories setup /root.
Mounting Overlayfs mount unit /home...
Mounting Overlayfs mount unit /root...
Mounted Overlayfs mount unit /root.
Mounted Overlayfs mount unit /home.

is much more informative than

Starting Overlayfs directories setup...
Starting Overlayfs directories setup...
Finished Overlayfs directories setup.
Finished Overlayfs directories setup.
Mounting Overlayfs mount unit...
Mounting Overlayfs mount unit...
Mounted Overlayfs mount unit.
Mounted Overlayfs mount unit.

Especially as the number of overlayfs mount units increase.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 meta/files/overlayfs-create-dirs.service.in | 2 +-
 meta/files/overlayfs-unit.mount.in          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/overlayfs-create-dirs.service.in
index c949a6dc7363332749f6ea7828fb93e005b2ef67..d8d916365a4562dbe522eca9f291a9a4c859f7d9 100644
--- a/meta/files/overlayfs-create-dirs.service.in
+++ b/meta/files/overlayfs-create-dirs.service.in
@@ -1,5 +1,5 @@
 [Unit]
-Description=Overlayfs directories setup
+Description=Overlayfs directories setup {LOWERDIR}
 Requires={DATA_MOUNT_UNIT}
 After={DATA_MOUNT_UNIT}
 DefaultDependencies=no
diff --git a/meta/files/overlayfs-unit.mount.in b/meta/files/overlayfs-unit.mount.in
index 1d33b7e39cc4323982e11222b416c0474a0a794e..9c117f2c5263c6d92ff177f466dacdc81990a0bd 100644
--- a/meta/files/overlayfs-unit.mount.in
+++ b/meta/files/overlayfs-unit.mount.in
@@ -1,5 +1,5 @@
 [Unit]
-Description=Overlayfs mount unit
+Description=Overlayfs mount unit {LOWERDIR}
 Requires={CREATE_DIRS_SERVICE}
 After={CREATE_DIRS_SERVICE}
 

---
base-commit: 8278d82d8203212bb159eb3805d4a5617c5370df
change-id: 20241024-overlayfs-templates-ca9b4227b0c1

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


