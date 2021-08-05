Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web08.10547.1628177822600537406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uio+xGlO;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id o20so7851227oiw.12
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5tfG6i/ZWiTfdkkks/nVDNLZMM5vt2xbWAF6LfoWF4I=;
        b=uio+xGlOvcTAkNVp1CG7zxJqVAWJqkVxviN6H8KyvyW+zNIQOSQHGSUsD8GpgBfBLe
         TeVSpH83+r9ejxK27wZ41vNL2U8XU0dlmOkkSRyka1RNBWV/MO29Nycl51jFedDsvMmM
         nHNwZNNH9xRAJ6TZAdrsv7FjNMXGaTLSLU8yGtzYBjsCMVCnCGAlOaErwgnKZt+pBtM2
         UlLGtr5P/aifYVTaMlXpNEpf5qdZQMCBOWFki5fg9RxDX/g//YzjGrXC88BV++RCpw/C
         NNJb9yoYjrUg/xQlIQnTwkmRw/nZinvFDBH13yPZipdbtjd1zceSDJxvRPGGpMrzPiYz
         WLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5tfG6i/ZWiTfdkkks/nVDNLZMM5vt2xbWAF6LfoWF4I=;
        b=f2/AjdRmTydXKBLlp4J/Y14z181T75Ig/bYYDKvtA5M12wsAeDegRMC40b9BNn7Zwq
         hCfOd1USHVvDZUage0tTn0oiwmoMp9RfkuLMcDOK+T9b/2z8wzbaS5qUDm3y2D6xnit+
         Pi7ggP2TmdlwJPM0omA/ZGd/ztlrSAI/8bXpvs1TcyGLZcb0X86uj+TlLVcnTl6BNWUP
         xR+9N3zqTt2o/Bf8CMFtAsyuXvy7YQX9IU++o/ud4mu0nuxuBtgbVSR3egvTobq9TNOY
         /QcYllds4Bo+E8RoRQldOjPubDBOnu/wkgQejo1Rohee9EwPL3XNYu4sd1NDtkM/UQ73
         UHmg==
X-Gm-Message-State: AOAM530lhZyqsB6ehNw42V/J402rf0xaSCyCK305bF3zGTlS9xUPPvDr
	/LfzFjc2hOyKCj39kenOYztp36rXnh/Z4DYD
X-Google-Smtp-Source: ABdhPJzRM56+HIiWaY2DCbDf4hcjR8p2U8ob+BsskcNbYY0zyq1LNEXll9bACo5KyqA9Foyu78qepQ==
X-Received: by 2002:aca:aacd:: with SMTP id t196mr4020053oie.12.1628177821567;
        Thu, 05 Aug 2021 08:37:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.36.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:37:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/33] oeqa/runtime : add test for RTC(Real Time Clock)
Date: Thu,  5 Aug 2021 05:33:58 -1000
Message-Id: <7c6624dbea2df5a47752e7684045d9d1aa41c3e5.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test is checking the functionality of the RTC(Real Time Clock). The Check_if_RTC_(Real_Time_Clock)_can_work_correctly manual test case from oeqa/manual/bsp-hw can be replace by this runtime test.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6961c2fc04edbc5bc3827c7703997085d9c609e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/rtc.py | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/rtc.py

diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/runtime/cases/rtc.py
new file mode 100644
index 0000000000..a34c101a9d
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/rtc.py
@@ -0,0 +1,38 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+import re
+
+class RTCTest(OERuntimeTestCase):
+
+    def setUp(self):
+        if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
+            self.logger.debug('Stopping systemd-timesyncd daemon')
+            self.target.run('systemctl disable --now systemd-timesyncd')
+
+    def tearDown(self):
+        if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
+            self.logger.debug('Starting systemd-timesyncd daemon')
+            self.target.run('systemctl enable --now systemd-timesyncd')
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['coreutils', 'busybox'])
+    def test_rtc(self):
+        (status, output) = self.target.run('hwclock -r')
+        self.assertEqual(status, 0, msg='Failed to get RTC time, output: %s' % output)
+        
+        (status, current_datetime) = self.target.run('date +"%m%d%H%M%Y"')
+        self.assertEqual(status, 0, msg='Failed to get system current date & time, output: %s' % current_datetime)
+
+        example_datetime = '062309452008'
+        (status, output) = self.target.run('date %s ; hwclock -w ; hwclock -r' % example_datetime)
+        check_hwclock = re.search('2008-06-23 09:45:..', output)
+        self.assertTrue(check_hwclock, msg='The RTC time was not set correctly, output: %s' % output)
+
+        (status, output) = self.target.run('date %s' % current_datetime)
+        self.assertEqual(status, 0, msg='Failed to reset system date & time, output: %s' % output)
+        
+        (status, output) = self.target.run('hwclock -w')
+        self.assertEqual(status, 0, msg='Failed to reset RTC time, output: %s' % output)
+        
-- 
2.25.1

