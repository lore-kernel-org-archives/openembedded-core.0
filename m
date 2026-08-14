Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1592DC5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 16:27:04 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16751.1786724820469646314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=s49JarZD;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7EFDC1A1644
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:26:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 545476046D
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:26:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A14EC11C4EED6;
	Fri, 14 Aug 2026 18:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786724813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r6v1rfyuKdORjoYVOSB2s+b/swiH2xUB96JW5eKc0Wo=;
	b=s49JarZDfWputnZFx5dMBm+WKGwAXdvNEMnL1rjsuPhWNU+KrZ120tzpEjWEPA9fPj6wKG
	bQUz0C1fQDAS8v1xgU7WjNqxVAA9x6l4yEjvbTl6da1WdyziAqJdD/tkeSq1hqS1iH+COD
	tMkmkN6iPjPMfUGHZsDxHN77SoSnHcJbDlHZGb0TygaHkPm90c7gpyqD33HhTAfN1QMUN2
	PStmnewIawlq3nHgLAGPX2BHfIq2dpE+3io5tN2JX8s0/QtvjDlxqespyv6xSbWUbuQmik
	wbNc/D2+OXNfi8NVfhC4r3QAHo50YNLkfyBa5qc5ZnYtXS+gPtVVNK4kj5PXow==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 14 Aug 2026 18:26:36 +0200
Subject: [PATCH 3/4] devtool: standard: Remove unused variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-mathieu-devtool-v1-3-985e81a17bb3@bootlin.com>
References: <20260814-mathieu-devtool-v1-0-985e81a17bb3@bootlin.com>
In-Reply-To: <20260814-mathieu-devtool-v1-0-985e81a17bb3@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786724798; l=650;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=+Wju/4eH8CWan/wj0wFWT8fbc3XB3N604uwp6C95OAM=;
 b=A4RAVFrBQFbSqrSCJkZHilbmZ9sbAS77vgE+BJ4Ctnb2sxKiBWtRPyDWXqrduigUTvEflbx+j
 Vn9/pE/N3H1Djn33fq9kz0zhUm7YjJaI2I0IOKy16/a3klWRaIIDDfr
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243462

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


