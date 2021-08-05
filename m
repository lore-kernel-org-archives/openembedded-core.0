Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.10527.1628177847135599522
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=G3+l3E1o;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.52, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f52.google.com with SMTP id z3-20020a4a98430000b029025f4693434bso1421565ooi.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vv3Gd8euySR754H7h2HE10Erg6P6kxSrbMRI/s2+wic=;
        b=G3+l3E1opZfqpqRs2nUCdjoEM+7nqFIa5/5WB3hgsg1cxzP9Zp3Wz1r2Tmr9/3pcg5
         vRPR+PC/F6HwJReyS+NEMKmmi35a360P2XwggA9hM2sO2+07NQLeoOiLUY0U6NZNHeri
         REuvSkmyaOsZJtTGWQsgMsAcHYq4nEa/qI4vEErTnDm8FXOCHaaVBV/DghhxL5ZxtzUr
         TUTE50fSgzbEiRqY6I+uVguf+RV410WbN6O9P0ES+yAFyAjlXHT3hGOdFS1LfRfqnXTb
         L0F6C99xRZICmqnHagEO5Qj6ckinw2JJFAt2IeHy4iUTBpJUEX/JphYejKfPsV7p8zSr
         6SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vv3Gd8euySR754H7h2HE10Erg6P6kxSrbMRI/s2+wic=;
        b=UZJB8l2bRhaySzgwR9SnbnOtWPOpgh48Kc5LTcn/Lubiii6rW4oaW263tQw5ljqTV4
         Kizw4Q7IN+p74Aabk4Cvu+trn5EHQpqk/wsWYNHsM8GTjmwi5etGnHWS6ir53bnWM9SV
         ujLvFv9216qIh2EroL4LUnIe36VpCjAZtTKeNVhudkKuwb9ujNUbruuQioCMKkcglxh5
         e2xz/JsUMOkI84AOL+mNFk50clArMVeJGYdIMZc5fNxHjzLn3ncg2v8kKCfm1GEBo/FX
         oO1bQ8WUp7p+IeBHQZw5ghgo/poLWDRT0zcWcWr6OlU72rpeZAH+WmSflmNHlbc+xYg5
         Alsw==
X-Gm-Message-State: AOAM533AKt4+WjkgXXE+R78Yo2HK2a3swA9sP9wyYoBgXwOOclIrfist
	BHppsNdemMl3E4B0y+EHKaQqcTTNubRXYmeR
X-Google-Smtp-Source: ABdhPJykWAt0PEmaObE8HF4WdX+QRFZoujGMbvq8gC3EGXIfqfaK1ZhfMWm7gO1JYLqdqyKlNQPIdQ==
X-Received: by 2002:a4a:434d:: with SMTP id l13mr3692792ooj.83.1628177846056;
        Thu, 05 Aug 2021 08:37:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.37.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:37:25 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/33] oeqa/runtime: add test for matchbox-terminal
Date: Thu,  5 Aug 2021 05:34:01 -1000
Message-Id: <e4d0109bde6f9dce0709106262c3e4f51007b510.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: TeohJayShen <jay.shen.teoh@intel.com>

This test is checking that the terminal application is able to run. The click_terminal_icon_on_X_desktop manual test case from oeqa/manual/bsp-hw can be replace by this runtime test.

Signed-off-by: TeohJayShen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cfa9c1ce853bfd31c1febe61d0f7ad9c5d35f709)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/terminal.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/terminal.py

diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runtime/cases/terminal.py
new file mode 100644
index 0000000000..a268f26880
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/terminal.py
@@ -0,0 +1,18 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+import threading
+import time
+
+class TerminalTest(OERuntimeTestCase):
+
+    @OEHasPackage(['matchbox-terminal'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_terminal_running(self):
+        t_thread = threading.Thread(target=self.target.run, args=('export DISPLAY=:0 && matchbox-terminal',))
+        t_thread.start()
+        time.sleep(2)
+        status, output = self.target.run('pidof matchbox-terminal')
+        self.target.run('kill -9 %s' % output)
+        self.assertEqual(status, 0, msg='Not able to find process that runs terminal.')   
-- 
2.25.1

