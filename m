Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.10046.1614349591104586587
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0kizMTZp;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.43, mailfrom: steve@sakoman.com)
Received: by mail-io1-f43.google.com with SMTP id z13so9774199iox.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HLlVAYBL5hSC3wXCPaKWtzu3zPPrlO9mn1MfbidYt/w=;
        b=0kizMTZpx4LXyE2HwdgH/XawVpmjrmV2+HXfLl5/YxoHDiY2fKalHYBtGNHDcDrzvI
         Y59pqK1t0mECtl2qFNlpXuYMpw/ZHTokbnJMucAQhOasGdxDOktS5S1/uBB/tzO6kJHO
         X5kvTNobqAD0o151QmiEs/neBp3gvhVY32XHpANENocBTxje1WcrnEgfi/OKHGvNsMPg
         l6R7VjzcMlarbKrhyXPCXb32fLOmiPVEj7GE8Lqx2U3emplAQvTf32ZIxyeVAMXqeTP/
         vBOP23ZGFIuIEz/6mejwuS+6fH/SWKhJyWf0jVHt9h9vcqRiYWxEW49DBE/06bIPWLbU
         8yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HLlVAYBL5hSC3wXCPaKWtzu3zPPrlO9mn1MfbidYt/w=;
        b=QMqovG8MjN3uV9RzyAzrD1/T0TdJskNGVJi8ua5mOjyHgYpyebRjTUYlmCdZ+hDg2X
         Y434Ri2d0E18Dhgk7izIYyhrGQ3UVCGo5fqNaxRbEOKMjEMtMAQJVUKGQxrxZZk0kFWn
         GNfgzKcpMn586Qx2mSnufhMGWDecIKN7shlyNTWpO+lXAr+PpU7xpkyRJlWVuo/dS02j
         iPgLOwG5fEPz0+BezSe/589xzfTWEOJSV0Ju9a2xgAGIo287zqprn4/6AcAWYoeaV92W
         V4AqIXAWydDFgJygMGrQBSpFitJSiXlFZ8e9mn63UMUEB1b0X5fCyD8fGvqR6Itfb/DT
         a+uQ==
X-Gm-Message-State: AOAM532KxVr1n53nmEnuz6Wi8935C64NnKpBmxYbYT+B99hUWQdBu3nk
	wOLYnoGc4pqO8d3G9F4Z6Q3zlfiErF+d0Zme
X-Google-Smtp-Source: ABdhPJy8aQxdpHZR/kAQl+zBqO95oaNKl+JqubqWbnMLyuEroYfn/s/Qth/L+i7NrrLyGdJ5n8nsYQ==
X-Received: by 2002:a5d:8ad3:: with SMTP id e19mr3081485iot.157.1614349590003;
        Fri, 26 Feb 2021 06:26:30 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.26.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:26:29 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/40] oeqa/runlevel : add test for runlevels
Date: Fri, 26 Feb 2021 04:24:01 -1000
Message-Id: <a6e626f8a883ba82b08e2c89076da4eb1e748c3f.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test mimic the boot_from_runlevel_3 and boot_from_runlevel_5 test cases from oeqa/manual/bsp-hw.json.
The boot_from_runlevel_3 and boot_from_runlevel_5 manual test cases should be remove from oeqa/manual/bsp-hw.json if this patch get merged.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6effd30f0e3726bc1f2eb7768c57c6b95eddb079)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/runlevel.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/runlevel.py

diff --git a/meta/lib/oeqa/runtime/cases/runlevel.py b/meta/lib/oeqa/runtime/cases/runlevel.py
new file mode 100644
index 0000000000..3a4df8ace1
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/runlevel.py
@@ -0,0 +1,22 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+
+import time
+
+class RunLevel_Test(OERuntimeTestCase):
+    
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_runlevel_3(self):
+        (status, output) = self.target.run("init 3 && sleep 5 && runlevel")
+        runlevel= '5 3'
+        self.assertEqual(output, runlevel, msg='Failed to set current runlevel to runlevel 3, current runlevel : %s' % output[-1])
+        (status, output) = self.target.run("uname -a")
+        self.assertEqual(status, 0, msg='Failed to run uname command, output: %s' % output)
+        
+    @OETestDepends(['runlevel.RunLevel_Test.test_runlevel_3']) 
+    def test_runlevel_5(self):
+        (status, output) = self.target.run("init 5 && sleep 5 && runlevel")
+        runlevel = '3 5'
+        self.assertEqual(output, runlevel, msg='Failed to set current runlevel to runlevel 5, current runlevel : %s' % output[-1])
+        (status, output) = self.target.run('export DISPLAY=:0 && x11perf -aa10text')
+        self.assertEqual(status, 0, msg='Failed to run 2D graphic test, output: %s' % output)
-- 
2.25.1

