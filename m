Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBFB7FC06
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:46 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id c13so12415830pfp.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/cWRIk/J6YFTa+IIOUIPWkAA/5pCrAF4yYFGdo2Wvhs=;
	b=RR8/u7zDVjCyzGKKEN/hE6TTgyNQrervFCmbWeiVNN0ifiIZ0U3kGogsfV1qJr5WOU
	2nVjNqdEe7+8RH//TRJ6hNSrn3R5eGVXkigvPCZAvs6MT6/2Zm9Z3dcI9lLj6bh5xBUU
	czQgDTR/11J7XzuMChJbOng13kg9G0NkQjNnpd8iTkfcCPnZKJAEyFYYqSokUupcXE6Y
	Et2SRE5b0Q2i+YT/W575iP11bjst19UPp1+i36Xm+lfm14zZGLTlW33kHSK7swI/Rz4Z
	7gsZDYeCEaGGjR/h4DZgfeMe2wbYMdadpizps0FdcL9Rc7L8/uucmcKYWareMeixHBUc
	ifRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/cWRIk/J6YFTa+IIOUIPWkAA/5pCrAF4yYFGdo2Wvhs=;
	b=aWa1CVxXpICjB/i7XHmkPFST+v1V68xBafmkoszztxxUgz9aI1+FZAiEbH52sESOzf
	p0iaTX4w5XdZGebNfDtuwF5CYxxnVrV278FcjWY/GRvQTWBmhf4Ht4pMaVlrCzwu2oAI
	MYF4KHtATJhBW1JLDjpSSC81hQIfWqvdUQcTrsekHc6HAhdrnWER5ItTDcXkzhsUgsBj
	TzjVVJyIZ7usEGwx6AWm6cN9wxD6kXbRKv5VQfz3VyHD/47/X9UZCmRSXN9qYD8cp188
	TtyBb6F1BwVLND+82aO81FfQMZg5RBDrPKQ9EQGtcrRNRpVay29A4seoYVh1JYcLL0ch
	Hm6g==
X-Gm-Message-State: APjAAAUP06Jo4Z67ZqRVKCmdJtKsNcVVKDj3LYuqZsF2UFDSz1RQR5tK
	T+e42RBXIx9VlikqLjLqRW6FdSub
X-Google-Smtp-Source: APXvYqzDx1+7zo3XGA/sfpcCkI/UZOiIx1TvuMXa9ns7mqFHLTJrNzO1LEdDUjObEUcK1XubSHB0SQ==
X-Received: by 2002:a63:491e:: with SMTP id w30mr32591420pga.342.1573533227261;
	Mon, 11 Nov 2019 20:33:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:24 -0800
Message-Id: <3c2da7e60d224fd508e82298c516c4ceb1ca4801.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 05/20] OEQA/runtime: Add ltp stress test
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:46 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ltp_stress.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ltp_stress.py

diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/runtime/cases/ltp_stress.py
new file mode 100644
index 0000000..4fc549f
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
@@ -0,0 +1,29 @@
+# LTP Stress runtime
+#
+# Copyright (c) 2019 MontaVista Software, LLC
+#
+# SPDX-License-Identifier: MIT
+#
+
+import time
+import datetime
+import bb
+
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+from oeqa.core.decorator.data import skipIfQemu
+from oeqa.utils.ltp import LtpStressBase
+
+class LtpStressTest(LtpStressBase):
+    # LTP stress runtime tests
+    # crashme [NBYTES] [SRAND] [NTRYS] [NSUB] [VERBOSE]
+    #
+
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(["ltp"])
+    def test_ltp_stress(self):
+        self.tc.target.run("sed -i -r 's/^fork12.*//' /opt/ltp/runtest/crashme")
+        self.cmd = '/opt/ltp/runltp -f crashme +2000 666 100 0:0:00 -p -q -r /opt/ltp -l /opt/ltp/results/crash -I 1 -d /opt/ltp '
+        self.runltp('crashme')
-- 
2.7.4


