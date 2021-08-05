Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web12.10500.1628177858585270307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kh25AYy8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id d10-20020a9d4f0a0000b02904f51c5004e3so1175060otl.9
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pbLz3vCUMUoSicjggYWiXr0mb2l/yvf357/PW57GJQw=;
        b=kh25AYy8zUXcIKuf03A7oRCCXlSfyjnRNfMZEgFNJSD5G6j9R9NIB0OE1nY0V+HN5h
         boxksQC8uyFhxyyBfFx/MV7V009xL626CVOvnMTd5vFqwlyFWWi5BayRP/e23+7jmC/b
         Q3ITikrECk488tPWgjEXLGWNy2j4tpR+J2S5rPHHWowWjVInFGHmtwLAUgHbNqMOLsYq
         WQHGPs0yEEKmkiaAJ/DyTA+dVWkqYbc85Ttt7qv+HUwOyI96N6hkOVaD2FRQyro6GjE1
         lNWtz4nsFa56RneiyO/lqNDMZ86FIQY82Qn1xAMZN4ZK3wbRhf8f8wzG14F2Szy2Lp2H
         /8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pbLz3vCUMUoSicjggYWiXr0mb2l/yvf357/PW57GJQw=;
        b=jXDbKTPjviB+t6HWcfrVx83irMLHihmLmwQgc8l1kwi9/A6K+c89uOYSxhbBMKqVT5
         9b5R1Ad57rDAQ0ZK1vilZEtG4bKAFEGsIpy2dNPGpMNpvTRJlI00t33423uzNWouH70D
         MWZG9UVdwfneCPToD8xZR1rf7LdLdhSlAcrBbnZdf50Ur16OR64QycBpeAIFzGjBuh4x
         bd1ETLrtmu6/sIZfrmesPidX+EkiVLJ4eaKDI3RMx4aRU1Ayk8rjxcoMjA92mUJq1GCS
         qC/lpKmAxt+Wmxx+GQPoRRjdyMiJ/2QE77IrE3l9FcgR2J5JeMHUFlTsg3BuxuYgkmYU
         MlNA==
X-Gm-Message-State: AOAM531jgmNZdFQjkvIxP4z/fLwVQYKXRSVCa+Y+iceqUvVS08M8mh3L
	mDrRKTNb4ZfPM1UpkHxVKDWqiznVSeB3z3ow
X-Google-Smtp-Source: ABdhPJx2Mb6d/fx5vff/aeSMQNhOknK3Jd2ISwglhor869x18SBNC4b9nxe1TIPlfGEF4lIYTyh3Ww==
X-Received: by 2002:a9d:30d:: with SMTP id 13mr4277489otv.66.1628177857540;
        Thu, 05 Aug 2021 08:37:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.37.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:37:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/33] oeqa/usb_hid.py : add test to check the usb/human interface device status after suspend state
Date: Thu,  5 Aug 2021 05:34:03 -1000
Message-Id: <00074636b81484dedef4c1769b018f6b980be423.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test mimic the Test_if_usb_hid_device_works_well_after_resume_from_suspend_state manual test case from oeqa/manual/bsp-hw.json.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23a3dc370a52907ee3261746405fb9b2af9e9a11)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/usb_hid.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/usb_hid.py

diff --git a/meta/lib/oeqa/runtime/cases/usb_hid.py b/meta/lib/oeqa/runtime/cases/usb_hid.py
new file mode 100644
index 0000000000..3c292cf661
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/usb_hid.py
@@ -0,0 +1,22 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfQemu
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class USB_HID_Test(OERuntimeTestCase):
+
+    def keyboard_mouse_simulation(self): 
+        (status, output) = self.target.run('export DISPLAY=:0 && xdotool key F2 && xdotool mousemove 100 100')
+        return self.assertEqual(status, 0,  msg = 'Failed to simulate keyboard/mouse input event, output : %s' % output)
+             
+    def set_suspend(self): 
+        (status, output) = self.target.run('sudo rtcwake -m mem -s 10')
+        return self.assertEqual(status, 0,  msg = 'Failed to suspends your system to RAM, output : %s' % output)
+    
+    @OEHasPackage(['xdotool'])
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_USB_Hid_input(self):
+        self.keyboard_mouse_simulation()
+        self.set_suspend()
+        self.keyboard_mouse_simulation()  
-- 
2.25.1

