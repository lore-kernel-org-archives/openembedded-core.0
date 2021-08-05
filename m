Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web08.10550.1628177834895329116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Uyw2oSDq;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.52, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f52.google.com with SMTP id n1-20020a4ac7010000b0290262f3c22a63so1422666ooq.9
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0dn1worewaRYzTAGGFhp5dPzPYRxp9SuDgwIEKJj18U=;
        b=Uyw2oSDq45DHNrJ9iHhvDWJ4dKQezhatSJONjICY3M2De93H+roWIcprNQq5R4lenU
         OpyyBE89zFhShb2Vr9eID92ZO4iiFvIkxIyHpRwwLn92fjh236EZBHTHFSuYAo1RVceH
         vPcFJy4iUqELFNS/IMvWH3ZMuaoIHabRTc6Kgp8K+FrrxvUMRf4DaRiyclp0KukFIjC3
         6XWGsVDqaTcRtfTSpayNqTi9SsX6j7yTfN4NtWyPfFY5LJVmAGxau5zDwgK/sOrTo0AX
         bIHMoNrikoX2400zmO/A0XJkzliJldWy4LCw6PIDj+kKex5AtkIpWQjDYh/wC1cmGGOg
         lQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0dn1worewaRYzTAGGFhp5dPzPYRxp9SuDgwIEKJj18U=;
        b=ReKxjOwx3Ee7h+5/kBbNTQuKVB2e8WUrD2cry5DzJtoVx3fyghqhJMhZQckiAJ3+2J
         PQgW0eqVl5ts685tnbvxunvQSzntARvT2UCNx9IO1l/xE6neGqMfQTcxQ/98JBNjXc8M
         G1IHN2GszBVCVAEWa/c6Ia9H67XvaGc50lKzQabR3FFDJ50GVwl35tz92RGVgrAe/vRA
         Mdlz6iE6sa0+JtHCOIluXgVDvwCABZvO+IYC0e1nHJLttg4Tu7A6u3Hd2rgBzbdCPsmn
         IwM9UdFCaMMsTVGPi3gGVKp/QbmIC9cAaf2dd8wV6nGSRErMJXbVR/HDcir7CYGu7Ym3
         5dPw==
X-Gm-Message-State: AOAM530UlBLSezfFS+zansUBTUnPwpzAi+ip+Oh4XsLFrJKe8IDCfnYp
	xy9qnMtQNARrz/lvsSLZzjgvrgLsrWq2CO7b
X-Google-Smtp-Source: ABdhPJzeVE3Vfl3U1p0Zd3msa1jG7JgXZD/i1iw9sZAVJWOlh7/o5tFscG40VGP5n37f/AyUv5o3SA==
X-Received: by 2002:a4a:b98c:: with SMTP id e12mr3698727oop.67.1628177833831;
        Thu, 05 Aug 2021 08:37:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.37.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:37:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/33] oeqa/suspend : add test for suspend state
Date: Thu,  5 Aug 2021 05:34:00 -1000
Message-Id: <dbd541cf2bf5083604a2e929ea8f148b96b4ce2f.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test case is checking the command and LAN device behaviour before and after suspend state. The Test_if_LAN_device_works_well_after_resume_from_suspend_state and standby manual test cases from oeqa/manual/bsp-hw can be replace by this runtime test.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10728035a606483ea67f6cb8ba5779558856593a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/suspend.py | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/suspend.py

diff --git a/meta/lib/oeqa/runtime/cases/suspend.py b/meta/lib/oeqa/runtime/cases/suspend.py
new file mode 100644
index 0000000000..67b6f7e56f
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/suspend.py
@@ -0,0 +1,33 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfQemu
+import threading
+import time
+
+class Suspend_Test(OERuntimeTestCase):
+
+    def test_date(self): 
+        (status, output) = self.target.run('date')
+        self.assertEqual(status, 0,  msg = 'Failed to run date command, output : %s' % output)
+        
+    def test_ping(self):
+        t_thread = threading.Thread(target=self.target.run, args=("ping 8.8.8.8",))
+        t_thread.start()
+        time.sleep(2)
+        
+        status, output = self.target.run('pidof ping')
+        self.target.run('kill -9 %s' % output)
+        self.assertEqual(status, 0, msg = 'Not able to find process that runs ping, output : %s' % output)  
+        
+    def set_suspend(self): 
+        (status, output) = self.target.run('sudo rtcwake -m mem -s 10')
+        self.assertEqual(status, 0,  msg = 'Failed to suspends your system to RAM, output : %s' % output)
+    
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_suspend(self):
+        self.test_date()
+        self.test_ping()
+        self.set_suspend()
+        self.test_date()
+        self.test_ping()
-- 
2.25.1

