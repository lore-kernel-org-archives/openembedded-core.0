Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFF4C5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 11:12:25 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8062.1786878738152537106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 04:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FVw9d9MQ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 86AA11A1699
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 524B560352
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6AC911C4F8EC;
	Sun, 16 Aug 2026 13:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786878731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bZzc7mgrxhonpCumgecnEZY/bON/Eb4RCdIAY/tDS1k=;
	b=FVw9d9MQXbjM7SXz5t7xE/fr04d75UNk4vJ6ZR0vi/Aed7nwva77UECuoe1R0c2z1Q2o1E
	Z2Uu6Zsrd5G07nDQDxaemXdJ6fJRnP5+3sUwAAFy979w7SDIykR3+W5IYalVGdOAJKLdKY
	gIsmLE/ZH9SyfrTGKxIxaH7DVMbWKBu+5t2xxBl5zcXWEgssh/gzBzYgdEXZ/Aft0hJXol
	JGQoJKmN7WMTyY04c56Al8P4jNhH/1px0tEWkUAWOwUb+nYXoxPLg5Bpb3VJ+e21ljH3yB
	FHp3XTWzx7naKxSfpTfdAdDPleyBgWgX6fb4rZ11UhWiZ6ukOC9zz3PCOq/x+Q==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sun, 16 Aug 2026 13:12:01 +0200
Subject: [PATCH v2 1/4] scripts: scriptutils: Use
 LicenseRef-RecipetoolTransient LICENSE while fetching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-mathieu-devtool-v2-1-13c943abf48e@bootlin.com>
References: <20260816-mathieu-devtool-v2-0-13c943abf48e@bootlin.com>
In-Reply-To: <20260816-mathieu-devtool-v2-0-13c943abf48e@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786878726; l=1460;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=j4d88wbc0W+yV4GGCYHHIjcggPx5wT1EbCDbZvOFXq8=;
 b=+oX8y2XIZ54o+O+QrHYJGlA3caKZ1EaLQDEa4yKuiuMA903rv/6cCJW0D0zkkyQ3sDRaRkETo
 7PuHbKz2ZvLBp8EJzD5YO/ZgY3LQKeBehjfDKQQbNBwTzKLUp+7qhYd
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243517

Switching away of the "CLOSED" license, as devtool users would encounter
deprecation warnings on "devtool add" command.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/files/common-licenses/RecipetoolTransient | 1 +
 scripts/lib/scriptutils.py                     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/files/common-licenses/RecipetoolTransient b/meta/files/common-licenses/RecipetoolTransient
new file mode 100644
index 000000000000..3c59fbb8a580
--- /dev/null
+++ b/meta/files/common-licenses/RecipetoolTransient
@@ -0,0 +1 @@
+Recipetool transient license.
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 32e749dbb1a2..33e197a22cc7 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -170,7 +170,7 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
             logger.debug('Generating initial recipe %s for fetching' % fetchrecipe)
             with open(fetchrecipe, 'w') as f:
                 # We don't want to have to specify LIC_FILES_CHKSUM
-                f.write('LICENSE = "CLOSED"\n')
+                f.write('LICENSE = "LicenseRef-RecipetoolTransient"\n')
                 # We don't need the cross-compiler
                 f.write('INHIBIT_DEFAULT_DEPS = "1"\n')
                 # We don't have the checksums yet so we can't require them

-- 
2.47.3


