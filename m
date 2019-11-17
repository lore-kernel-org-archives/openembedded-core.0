Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 547FB7F96F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 03:35:24 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d7so7535303pls.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 19:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=98FekI7spi8qzql/ioqv28Hx+P+MA8tS3eXWDJLo0Eg=;
	b=Cx8ic0xegnODlN2lpV/jaz84/PDV2UddF5mJk18B1KeTopeWhAxNAFEqJRi7I8bvqP
	5yR4asBh6BUfN3QfltZEw44BAn9FiN+M3ItjUJSpMVrlBC/uVVY+iAIbzP1froaW7xx3
	L1WMZ0Ecl73y07+OKvvSVt3+rMtp3fFWi0QXIG1gtZYbEEs04Ve79NujXdomtWOHtiWU
	kGjw6FnoP/Vq6N1+cnF3RincBy9R9aQWEM/kOF5nY6mo2jGssuX5UZLQPYut3qf8f1ov
	5sjqH2Z6Iy2h5YEmTtOZZfXvqh8zyt3eYA/6cDg8W5TV7MTT6In4qr59bBaMELg274dS
	Vd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=98FekI7spi8qzql/ioqv28Hx+P+MA8tS3eXWDJLo0Eg=;
	b=FQnJLaCDrKod4Xhv/kt3HyAn5sqBzSZItsfOaAn7WxNj6PqC/pl5U1Kbh0LrzF5jW3
	8tDjsQVPm/ZNbOXNzC3ErrWKxJ8cuCJfQCxFXv0+/nLEU+1TUuoqk3P+RZIoGPnfVC6D
	b6TmdjQJnjURShrjlBrPyP5mszA0AETFg8LuvZAFijKVfg16WtWkpwZdQQF+GgbiSyom
	WI2Ity8noq34BUFObLbBzWbJQKuNqf18rNQoNphJ/18P5OHkfdQJ0jSTHXtfw7baJn1W
	ygOXqkR+dlSXaXClX6QUq8YF0JaiTEM6WtJL4JHMPzJT8dSnDG+ozhPY3mDG0+MMZbD9
	XeuQ==
X-Gm-Message-State: APjAAAVsK569DdjpamyWqqdEiXDZx+wu9taCvizSoMpVd/XDlKTAXfHM
	Ze7Q2TKunL1b2OdZ+lL2Xlb7FGj7
X-Google-Smtp-Source: APXvYqwvbFIvLMOpzEpddv7XCK7dQWRlUEh7P5X4tRiKLk/vf1U+N69+02QQBo+nb6+LAmrOmwMIeg==
X-Received: by 2002:a17:90a:8a0c:: with SMTP id
	w12mr19374221pjn.63.1573961725232; 
	Sat, 16 Nov 2019 19:35:25 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:a049:e40e:fb9e:4d3d])
	by smtp.gmail.com with ESMTPSA id
	71sm16666402pfx.107.2019.11.16.19.35.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Nov 2019 19:35:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Nov 2019 19:35:18 -0800
Message-Id: <1573961720-4099-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
References: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 5/7] oeqa/manual/bsp-hw: move storage tests to runtime
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
X-List-Received-Date: Sun, 17 Nov 2019 03:35:24 -0000

move usb mount, r/w and umount tests to runtime
move SD card mount, r/w and umount tests to runtim

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/storage.py | 149 +++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/storage.py

diff --git a/meta/lib/oeqa/runtime/cases/storage.py b/meta/lib/oeqa/runtime/cases/storage.py
new file mode 100644
index 0000000..166d26b
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/storage.py
@@ -0,0 +1,149 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import re
+import time
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfQemu
+
+class StorageBase(OERuntimeTestCase):
+    def storage_mount(cls, tmo=1):
+
+        (status, output) = cls.target.run('mkdir -p %s' % cls.mount_point)
+        (status, output) = cls.target.run('mount %s %s' % (cls.device, cls.mount_point))
+        msg = ('Mount failed: %s.' % status)
+        cls.assertFalse(output, msg = msg)
+        time.sleep(tmo)
+        (status, output) = cls.target.run('cat /proc/mounts')
+        match = re.search('%s' % cls.device, output)
+        if match:
+            msg = ('Device %s not mounted.' % cls.device)
+            cls.assertTrue(match, msg = msg)
+
+        (status, output) = cls.target.run('mkdir -p %s' % cls.test_dir)
+
+        (status, output) = cls.target.run('rm -f %s/*' % cls.test_dir)
+        msg = ('Failed to cleanup files @ %s/*' % cls.test_dir)
+        cls.assertFalse(output, msg = msg)
+
+
+    def storage_basic(cls):
+        # create file on device
+        (status, output) = cls.target.run('touch %s/%s' % (cls.test_dir, cls.test_file))
+        msg = ('File %s not created on %s' % (cls.test_file, cls.device))
+        cls.assertFalse(status, msg = msg)
+        # move file
+        (status, output) = cls.target.run('mv %s/%s %s/%s1' %  
+                (cls.test_dir, cls.test_file, cls.test_dir, cls.test_file))
+        msg = ('File %s not moved to %s' % (cls.test_file, cls.device))
+        cls.assertFalse(status, msg = msg)
+        # remove file
+        (status, output) = cls.target.run('rm %s/%s1' % (cls.test_dir, cls.test_file))
+        msg = ('File %s not removed on %s' % (cls.test_file, cls.device))
+        cls.assertFalse(status, msg = msg)
+
+    def storage_read(cls):
+        # check if message is in file
+        (status, output) = cls.target.run('cat  %s/%s' % 
+                (cls.test_dir, cls.test_file))
+
+        match = re.search('%s' % cls.test_msg, output)
+        msg = ('Test message %s not in file %s.' % (cls.test_msg, cls.test_file))
+        cls.assertEqual(status, 0,  msg = msg)
+
+    def storage_write(cls):
+        # create test message in file on device
+        (status, output) = cls.target.run('echo "%s" >  %s/%s' % 
+                (cls.test_msg, cls.test_dir, cls.test_file))
+        msg = ('File %s not create test message on %s' % (cls.test_file, cls.device))
+        cls.assertEqual(status, 0,  msg = msg)
+
+    def storage_umount(cls, tmo=1):
+        time.sleep(tmo)
+        (status, output) = cls.target.run('umount %s' % cls.mount_point)
+
+        if status == 32:
+            # already unmounted, should it fail?
+            return
+        else:
+            msg = ('Device not unmount %s' % cls.mount_point)
+            cls.assertEqual(status, 0,  msg = msg)
+
+        (status, output) = cls.target.run('cat /proc/mounts')
+        match = re.search('%s' % cls.device, output)
+        if match:
+            msg = ('Device %s still mounted.' % cls.device)
+            cls.assertTrue(match, msg = msg)
+
+
+class UsbTest(StorageBase):
+    '''
+        This is to mimic the usb test previously done in manual bsp-hw.json
+    '''
+    @classmethod
+    def setUpClass(self):
+        self.test_msg = "Hello World - USB"
+        self.mount_point = "/media/usb"
+        self.device = "/dev/sda1"
+        self.test_file = "usb.tst"
+        self.test_dir = os.path.join(self.mount_point, "oeqa")
+
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_usb_mount(self):
+        self.storage_umount(2)
+        self.storage_mount(5)
+
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['storage.UsbTest.test_usb_mount'])
+    def test_usb_basic_operations(self):
+        self.storage_basic()
+
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['storage.UsbTest.test_usb_basic_operations'])
+    def test_usb_basic_rw(self):
+        self.storage_write()
+        self.storage_read()
+
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['storage.UsbTest.test_usb_mount'])
+    def test_usb_umount(self):
+        self.storage_umount(2)
+
+
+class MMCTest(StorageBase):
+    '''
+        This is to mimic the usb test previously done in manual bsp-hw.json
+    '''
+    @classmethod
+    def setUpClass(self):
+        self.test_msg = "Hello World - MMC"
+        self.mount_point = "/media/mmc"
+        self.device = "/dev/mmcblk1p1"
+        self.test_file = "mmc.tst"
+        self.test_dir = os.path.join(self.mount_point, "oeqa")
+
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_mmc_mount(self):
+        self.storage_umount(2)
+        self.storage_mount()
+
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['storage.MMCTest.test_mmc_mount'])
+    def test_mmc_basic_operations(self):
+        self.storage_basic()
+
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['storage.MMCTest.test_mmc_basic_operations'])
+    def test_mmc_basic_rw(self):
+        self.storage_write()
+        self.storage_read()
+
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['storage.MMCTest.test_mmc_mount'])
+    def test_mmc_umount(self):
+        self.storage_umount(2)
-- 
2.7.4


