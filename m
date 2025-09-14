Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AC0CAC592
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 18:26:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.15035.1757874357368304147
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 11:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L4+IC4l7;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so42491515e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 11:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757874356; x=1758479156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5pWy1If9xZWDP1oGRrG+BplyxE4UH7KtlJ+RkfeD0R0=;
        b=L4+IC4l7xBLbuade1JN5X/CMBENTuhvnwnIpfox94YzE8n2n/lHclax0529jOgrjhk
         1xH8mQ0hfwT0KVqQTWjfzs14JPRgNylxaIznVMxeUJFQaLTG048bfWvzS6h9ColeXN6X
         h1a9N+K4oTm0bDIhILEOy0glE7whMlz0msxQSrFdAxvj/x4Q7dBeCTW3leOhi4ZMKYCm
         QjBfwn7HdC0sZ9V93sONCBhd64E4K2KOb32Fguujr3E4Mge/tCb6CsuUuFmbUsPhLAWY
         Cn8+gVcicgZfSLe/r1dutPTY2Kst+LExDTiI2ovTzr+953cEpzFLxzErsRKw1B09Ttmb
         aEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757874356; x=1758479156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pWy1If9xZWDP1oGRrG+BplyxE4UH7KtlJ+RkfeD0R0=;
        b=O/mNCTDlfMN8ZWcfOT3twrZuJL7FtEMTTg8UYElaInMydGndeWe5vWEIDiStYA4J1D
         ZjOfQQI5lnyyhSlq+mXKt52p/Go73jq+1Mo2QClSoOl2+Cart0Gt9HJXvLkQ7x74nsHh
         nP2fL/tOsjFCaBpb5Dv1/2qgjLcz8H4457aZJBGP/MuICPOg/noNQAPzJDcHGr0jh6qG
         wOC/Z7EQ3edNU2H19FM+BtmIae2WxFKdf819hDMa452ZhmZU0yNIwyp8Y+XDlgASBLJL
         x+faeTngzpzHa9LVjovEMoetbB8ix1BnLUYTUf+x67OEjEvpoyyGBbgtZnA0KVrbCWZl
         2RpQ==
X-Gm-Message-State: AOJu0YwyQ3Xw9Ema8c3jamnXxudknICj1VC3Sm+N10FkaI6Y0f25oKV5
	69lPsKz5/hmHQNTqn682dAP1Hwt2Cw3rVf937tPpavNVaRPJHnZyzPvhLXYPYg==
X-Gm-Gg: ASbGncv9QX6uuSspGAD8rC3ds1YWo7kdcYv5i5EH9vYV7q6/N95sweXfnrjxh3uC/g7
	kLjKFVFq3FK4/VcJ+gAtIEbnycEjyaSGxOv+hZoIVJ5MmvxSJ9UjZ17XRkHrs8W02l4PuvPqxR6
	SxOS6W76pEOk3lXS5+GewqDmYiUj32Zsl33jQ045gH05Cw+JRNo0NRVYiC58OzOgS/V1LfGNn8h
	IRTRcytm4UdvGWIIb7u5i8m9c1DKMyyPPnebKQOmRI+39mOjvop9S5ttEGuuU9rH4q/d3Vkb3Mo
	ewM2tyCEkTy2Hpq0q6eBIS8NtPBFQYHrN4cfdBQq9DO8D7FZYTWFPChGJARon8JWIdfP0j4teMp
	DYD3iwCO45h5xf/J0tFv6XtnW/Mu1J4el7XTRvVCdwQBIegb29yG/HQGSZCwa2z0x0ao6qTKnzu
	XlZpo=
X-Google-Smtp-Source: AGHT+IH2lYLRAMZ3bkfQD5TsS6EnCo/CrB5JN7XnVnDdu95i5oR28Zd7ABiN/a2vAnutVjStCS+SgQ==
X-Received: by 2002:a05:600c:c4b8:b0:45f:2919:5e6c with SMTP id 5b1f17b1804b1-45f29d33122mr41706845e9.16.1757874355521;
        Sun, 14 Sep 2025 11:25:55 -0700 (PDT)
Received: from osama.. ([156.223.20.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c4490sm144833575e9.19.2025.09.14.11.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 11:25:54 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com,
	mathieu.dubois-briand@bootlin.com
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v3 1/2] go: extend runtime test
Date: Sun, 14 Sep 2025 20:25:49 +0200
Message-ID: <20250914182550.24959-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 18:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223368

extend go runtime test with a simple test file, and simple
go module test to validate go compilation and execution on
target.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2: add check for go command, skip tests if not found
v3: add changelog
---
 meta/lib/oeqa/files/test.go       |  7 ++++
 meta/lib/oeqa/runtime/cases/go.py | 68 +++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/lib/oeqa/files/test.go

diff --git a/meta/lib/oeqa/files/test.go b/meta/lib/oeqa/files/test.go
new file mode 100644
index 0000000000..9ca9302654
--- /dev/null
+++ b/meta/lib/oeqa/files/test.go
@@ -0,0 +1,7 @@
+package main
+
+import "fmt"
+
+func main() {
+	fmt.Println("Hello from Go!")
+}
diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
index 39a80f4dca..fc7959b5f4 100644
--- a/meta/lib/oeqa/runtime/cases/go.py
+++ b/meta/lib/oeqa/runtime/cases/go.py
@@ -4,10 +4,78 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+class GoCompileTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUp(cls):
+        dst = '/tmp/'
+        src = os.path.join(cls.tc.files_dir, 'test.go')
+        cls.tc.target.copyTo(src, dst)
+
+    @classmethod
+    def tearDown(cls):
+        files = '/tmp/test.go /tmp/test'
+        cls.tc.target.run('rm %s' % files)
+        dirs = '/tmp/hello-go'
+        cls.tc.target.run('rm -r %s' % dirs)
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage('go')
+    @OEHasPackage('go-runtime')
+    @OEHasPackage('go-runtime-dev')
+    @OEHasPackage('openssh-scp')
+    def test_go_compile(self):
+        # Check if go is available
+        status, output = self.target.run('which go')
+        if status != 0:
+            self.skipTest('go command not found, output: %s' % output)
+
+        # Compile the simple Go program
+        status, output = self.target.run('go build -o /tmp/test /tmp/test.go')
+        msg = 'go compile failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        # Run the compiled program
+        status, output = self.target.run('/tmp/test')
+        msg = 'running compiled file failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage('go')
+    @OEHasPackage('go-runtime')
+    @OEHasPackage('go-runtime-dev')
+    @OEHasPackage('openssh-scp')
+    def test_go_module(self):
+        # Check if go is available
+        status, output = self.target.run('which go')
+        if status != 0:
+            self.skipTest('go command not found, output: %s' % output)
+
+        # Create a simple Go module
+        status, output = self.target.run('mkdir -p /tmp/hello-go')
+        msg = 'mkdir failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        # Copy the existing test.go file to the module
+        status, output = self.target.run('cp /tmp/test.go /tmp/hello-go/main.go')
+        msg = 'copying test.go failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        # Build the module
+        status, output = self.target.run('cd /tmp/hello-go && go build -o hello main.go')
+        msg = 'go build failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        # Run the module
+        status, output = self.target.run('cd /tmp/hello-go && ./hello')
+        msg = 'running go module failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
 class GoHelloworldTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['go-helloworld'])
-- 
2.43.0


