Return-Path: <vijaikumar.kanagarajan@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id C01817C79F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 10:01:49 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id g207so2582484wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Qjj6zRskp9aARWJoeZdb3fEXBpn92DHiAF2KGIwWnVY=;
	b=YRyOqPtyI9OMWyC+z/7fRnoGUQS4YsxJYD4mPxHFtPWP/dTb1lX8tZuCz6dWR7kKgL
	8NtXQZMkQ2VUSOWJx4cGe2MAwe7Lf2LJzkEQc3YtCswEpNeLOVLS345wMrq6Q3xNN7Am
	I2zCFqZKtOCzqYQsO6CxpF1Djx+wn7FDMDuZ7dlnj7ZOa4O2KTegClFWY16m+E3r6zXB
	qhMKyg/56FnPkLzXl0adA4VBRlY2YOT2RLEwkRUD1Tr1xxmSF5dPKmGht0zN0jVZixwv
	PydxJtESOWDw/kz+cEPC4TXTzd57NxtXyYJ+AwLMeeFBQb4qdCL0io+s60XAsY/yiuIr
	X0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Qjj6zRskp9aARWJoeZdb3fEXBpn92DHiAF2KGIwWnVY=;
	b=h0f4tMnq2Up3AjuMDOgUJRxiV/KGJ5J0Gn/aN4y5phhW4HF8mqZCU1i0PlWTtFMLut
	RiSgSJi2cAA36sOCMTkvQ/v0ptei5ZdYig6R/i8qPgaRbrnv2qaRY+6oY3OAgupP9560
	BoL8p8xe33AKY7BBXmPs6mH5frLaM6JjadwpM1QtX2f/Lyf396sL4UrXpl3x7WnRY/gv
	YTVIfHIvXGt0r32PdROeId+53lHLLTTxXAtiyh2ig15L2tGNz2jZbzJB67UqCe1HhMdt
	cho6aKe4O7+miFP7ufmA5fpzjoqDsQnnjknma7By2GLLTz64OOMTDc9HukqKT/rYamzX
	FJPQ==
X-Gm-Message-State: APjAAAVa4jTZYFNuvKKlsoCVYUm3MiXA8c7TwTQg+3jTgJGmUQSh12Gc
	+zuCXZJ724SQJnvWhiS/88511uBNULU=
X-Google-Smtp-Source: APXvYqz8O6+hEtcy8pnAwkXvMUFzYfIQT5XFvLerKpeiyIOCLe6aLVW37ko4v3DZjtou2Je+00eeoQ==
X-Received: by 2002:a7b:c059:: with SMTP id u25mr3581502wmc.140.1567591310218; 
	Wed, 04 Sep 2019 03:01:50 -0700 (PDT)
Received: from chikyu.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
	by smtp.gmail.com with ESMTPSA id
	o14sm54162255wrg.64.2019.09.04.03.01.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 03:01:49 -0700 (PDT)
From: vijaikumar.kanagarajan@gmail.com
X-Google-Original-From: Vijaikumar_Kangarajan@mentor.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2019 15:31:42 +0530
Message-Id: <20190904100142.27034-1-Vijaikumar_Kangarajan@mentor.com>
X-Mailer: git-send-email 2.17.1
Cc: Vijai Kumar K <Vijaikumar_Kanagarajan@mentor.com>
Subject: [PATCH] lib/oe/gpg_sign.py: Remove unwanted import
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Sep 2019 10:01:50 -0000

From: Vijai Kumar K <Vijaikumar_Kanagarajan@mentor.com>

Remove unwanted import of oe.utils.

Signed-off-by: Vijai Kumar K <Vijaikumar_Kanagarajan@mentor.com>
---
 meta/lib/oe/gpg_sign.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index d7624804d5..7634d7ef1d 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -6,7 +6,6 @@
 import os
 
 import bb
-import oe.utils
 import subprocess
 import shlex
 
-- 
2.17.1


