Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DADC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 11:12:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8197.1786878747274751308
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 04:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iPfWMAFp;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A48001A1699
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7394260352
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D346511C4F8F2;
	Sun, 16 Aug 2026 13:12:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786878741; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r6v1rfyuKdORjoYVOSB2s+b/swiH2xUB96JW5eKc0Wo=;
	b=iPfWMAFpLK8yWNECrvdphWNyuq8DtanKUIEg9VDE0OhL8PWklMVnUIietZwDHShzxTxKSN
	EX0QFWPqFTbhr/TFO7ntUuUnj3RzX9MCEO6BpQOKmY0jQSm3YBOewPgtdBhbDoKzAcjvI+
	V2z2IQ1XR7ODis92hndco4rpBBoC3KK43/j1FCJah1W9iDP7CrXIaW9t89JBa/ovq1Fsen
	4Y1UlWOA66AY9V75ZnupciGCkfDB+kuVbD+rcydMYYWjfgboxs1nk68dhC+Qh7zZWI7l1C
	Hhu4hDfOk4GsjIl89+u7SiyguEjKhOlySohELB/0roqza3UJNqEcGPYCybJmOQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sun, 16 Aug 2026 13:12:03 +0200
Subject: [PATCH v2 3/4] devtool: standard: Remove unused variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-mathieu-devtool-v2-3-13c943abf48e@bootlin.com>
References: <20260816-mathieu-devtool-v2-0-13c943abf48e@bootlin.com>
In-Reply-To: <20260816-mathieu-devtool-v2-0-13c943abf48e@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786878726; l=650;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=+Wju/4eH8CWan/wj0wFWT8fbc3XB3N604uwp6C95OAM=;
 b=ZAKjU+G6teauFSWfC9YvCXtaH5YQdu8aurxARb7eCSO/2AuOKA0qMPfYvZOd+b3ztSBbblO/u
 6RXINhKnkt9BmfZt6JJKwkqkmbJtAYBme+UBQXruIb5EZ9Wm57kjIU4
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243519

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 scripts/lib/devtool/standard.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 536411efef6a..ac9e7cd61a58 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1437,7 +1437,6 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
     # recipe space).
     existing_files = oe.recipeutils.get_recipe_local_files(rd)
 
-    new_set = None
     updated = OrderedDict()
     added = OrderedDict()
     removed = OrderedDict()

-- 
2.47.3


