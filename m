Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id B563C7F7BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:48 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id h4so1588156pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mEMOUCieXF34iNg11IKj0pKEUN2nPHFG3x0gR9L4Geg=;
	b=IPXzk6otRkR6rQvqXxoHi+JJXvPASQBpf3tiGquW1vlPdJ0PVcxSf+wBLBVKa8Q+cc
	oZ6zeif/j1NkW9v0tH6MBKXqi8//Yj41Ro0EKm2w14eMBIXPVlnMwYkGeEYnJqfIYA7l
	j5acLOxi70IibVRXzLqnUp9JaWQ0FKe25IWG0PadjdLAMm2gmC+dZcIPB2jdgOpe8Vr1
	D770X5qAIupv+IfZyfjic8DagkkymfW5S3OtGuN78KS/HX/MzvgtBnMp/SzjikU4Qmmh
	fydjsdVKSpsU0N2gGs/xnwVlZ8OyJM3FhD8sjvexT33afgqfp3mUE6kV0HXBmSyTK+zE
	2/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mEMOUCieXF34iNg11IKj0pKEUN2nPHFG3x0gR9L4Geg=;
	b=GMLsRHP1QEW3/wZ/jibmrXjHufmkkJvvRcz/gJrMGS416mozqvDA7t/dyQffis33Lx
	nNhiIfo3efj7PnxmKQdqPCzUqeJGonwY7MTOx5eiY2k/nnV288HfXdANxw7cMFmo5WXB
	uuXrSorztzw9rcBK1UI77sf7DwYVr8yRHyhVjBUgY84tUU1S4cVDtQlS6SvgA75raJ5X
	WWA2ecCcvB7QMZ2+3tVEIefk0RyFKRQFLPfaOeQMLuHKvA6LDiqNOhDLn20zXD6ucFKD
	rJ9oF+GTVO7DwaeGaSqEaTEuy/ugrz9qUHu5eGzYueFvIvLsmh34eQbIw70q7lX5ghuW
	aw5w==
X-Gm-Message-State: APjAAAVICH8vxwvxj4libVBt79CrNj5k8hmBnlynDXmjoUocj9KmSUBb
	Amoy+KMVa0hYcTJvMVsyGmYICmlO
X-Google-Smtp-Source: APXvYqxL7CZd6Q1O4t+NtAVdwMqg7+mQx5fS/jcOE56HrSdOCG3T4p+tvvHle3nuhVkOEKmhTixJyw==
X-Received: by 2002:a17:90a:c082:: with SMTP id
	o2mr5771839pjs.94.1573659169812; 
	Wed, 13 Nov 2019 07:32:49 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:06 -0800
Message-Id: <1344a6a1300007b4fadaf815f6652d30e7834430.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 24/31] selftest: skip virgl test on centos 7 entirely
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:49 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

With the sdl frontend, qemu isn't able to even boot fully,
so let's skip the test early.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-selftest/lib/oeqa/runtime/cases/virgl.py | 5 -----
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 2 ++
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/virgl.py b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
index d301a19..c0abfd1 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/virgl.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
@@ -13,11 +13,6 @@ class VirglTest(OERuntimeTestCase):
 
     @OETestDepends(['virgl.VirglTest.test_kernel_driver'])
     def test_kmscube(self):
-
-        distro = oe.lsb.distro_identifier()
-        if distro and distro == 'centos-7':
-            self.skipTest('kmscube is not working when centos 7 is the host OS')
-
         status, output = self.target.run('kmscube', timeout=30)
         self.assertEqual(status, 0, "kmscube exited with non-zero status %d and output:\n%s" %(status, output))
         self.assertIn('renderer: "virgl"', output, "kmscube does not seem to use virgl:\n%s" %(output))
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 3f212bd..7d3922c 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -179,6 +179,8 @@ class TestImage(OESelftestTestCase):
         distro = oe.lsb.distro_identifier()
         if distro and distro == 'debian-8':
             self.skipTest('virgl isn\'t working with Debian 8')
+        if distro and distro == 'centos-7':
+            self.skipTest('virgl isn\'t working with Centos 7')
 
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
         features = 'INHERIT += "testimage"\n'
-- 
2.7.4


