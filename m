Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id A7E007F985
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 03:35:22 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 15so7867323pgh.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 19:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1o5NPrHMYHBUhUJHYkZwL9GBhP6VRr5XfvPoOH46kJs=;
	b=scEnMMTUOQ61jtNZ0ajbd1hQPMdL8N9iTvHvktweDB8a6ZZa/dluLMleAzTy5P5kRz
	yOWtfCr1o0GDonewBTjkv9JzDwImAjEbSlxz6tBJrVdgsShukSk/CgTbcPQXyTaiW6kd
	P4bwvjeMowPcmNTzLXYhmEMV+HqECjnossIj25dwk6Ki+XZNJf8Bxxtg7SOqW3650o8K
	qBlz/lIlfp8N6TgdYabmK56xEY70Y0MNGrXNbyyI7WAgXX21TB93B5YrZmv108q3zPgJ
	Ucyi/pbGMzCHXFwY5OO3jlB67VXt9ujM85o9JpN6nN+EtLYUKb/T1ZL45n5wvsT2bYpR
	4Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1o5NPrHMYHBUhUJHYkZwL9GBhP6VRr5XfvPoOH46kJs=;
	b=L4W7iJMYpZuNwlkLxU0ssRyrfCbIfvuq6OPNMKFChAFTUMyhj/zPeIE+YujT6B72jt
	W3XWHPM/o5KotP75b62oE8YCbESW7qRTd3rGcQ9j68oDC/XNBPIg7TOMRzFl90F5bLy9
	GcToX+F+5oNrjE3dj/Pe2RpPEqM0ag19Kz0Wonzlqkapzez8/Zjd3znLgY61wu4yRlMo
	7etxcMe15xQpmCzQM8BsT9FTm/wKa9tm6yD2UMGAIF/bpCxwd1NJ5cFLK8gIe59Cjhnt
	JioQjbm1bRZyCNb8TCVzuaVLpW4dkDhnjQZfcsu8P8gx+3R1tuDjwQ8vmRMtjcupD+HV
	ygjA==
X-Gm-Message-State: APjAAAXPmqnDHEEVpylkVBjpGKY3ewTowXbEieC332hRk/7R/91QUCxQ
	rHd97+BqDZgh6Ejeo3qbXpdVhqmE
X-Google-Smtp-Source: APXvYqzfJVo6+oD3coI5jFonQkGj1MgpCRfUInidFBJHbGSFOxT0yxQgU1OvsbYcrk3MFuRe1qI9Dw==
X-Received: by 2002:a63:4726:: with SMTP id u38mr4965062pga.426.1573961723454; 
	Sat, 16 Nov 2019 19:35:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:a049:e40e:fb9e:4d3d])
	by smtp.gmail.com with ESMTPSA id
	71sm16666402pfx.107.2019.11.16.19.35.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Nov 2019 19:35:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Nov 2019 19:35:16 -0800
Message-Id: <1573961720-4099-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
References: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/7] oeqa/runtime/boot: add reboot test
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
X-List-Received-Date: Sun, 17 Nov 2019 03:35:22 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/boot.py | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/boot.py

diff --git a/meta/lib/oeqa/runtime/cases/boot.py b/meta/lib/oeqa/runtime/cases/boot.py
new file mode 100644
index 0000000..2142f40
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/boot.py
@@ -0,0 +1,33 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from subprocess import Popen, PIPE
+import time
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oetimeout import OETimeout
+from oeqa.core.decorator.data import skipIfQemu
+
+class BootTest(OERuntimeTestCase):
+
+    @OETimeout(120)
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_reboot(self):
+        output = ''
+        count = 0
+        (status, output) = self.target.run('reboot -h')
+        while count < 5:
+            time.sleep(5)
+            cmd = 'ping -c 1 %s' % self.target.ip
+            proc = Popen(cmd, shell=True, stdout=PIPE)
+            output += proc.communicate()[0].decode('utf-8')
+            if proc.poll() == 0:
+                count += 1
+            else:
+                count = 0
+        msg = ('Expected 5 consecutive, got %d.\n'
+               'ping output is:\n%s' % (count,output))
+        self.assertEqual(count, 5, msg = msg)
-- 
2.7.4


