Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0FDC7EE2F
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:46:01 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.22896.1677257156543631533
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fAlOvI/H;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0EFB2100005;
	Fri, 24 Feb 2023 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677257154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kkS0ToEK+wb2MZzobdybJxW7l75nGkeqns2KTP7XgpI=;
	b=fAlOvI/HvhCbRwinBz9wt4zYzym7UDsV7re+jeyTXg5cUKM3L8NIJeSR0wOJwgvoSktsn/
	YTocizoJyMFUVbp/1IWRRqwzR1lE2e+p7wIEr6AyfoO/BfG4h15Npx7Y6uzwfhZp0VJcnq
	6XKWx5StXz/4A7RiftoNJZ84AoapWr5ADTBrqX7oGg6n5xRVr/VKi3JNMS0TEcY/7oEU/y
	RuK9QfRUrDHKYrSTDXSr5HwLvlAMdbU8EVz/628o+hsuXnDL0Ub3LgkTvUj/6CN/Iy0b8R
	9bkMMJwTCSuPR5Sn23UcyeQN4tpfpbwNIKpaO5abMMz34IzEDWv3pCFth43n1g==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH v3 2/6] scripts/resulttool/regression: remove unused import
Date: Fri, 24 Feb 2023 17:45:51 +0100
Message-Id: <20230224164555.67634-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224164555.67634-1-alexis.lothore@bootlin.com>
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177701

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/lib/resulttool/regression.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 9f952951b3f..d0b0c318051 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -7,7 +7,6 @@
 #
 
 import resulttool.resultutils as resultutils
-import json
 
 from oeqa.utils.git import GitRepo
 import oeqa.utils.gitarchive as gitarchive
-- 
2.39.1


