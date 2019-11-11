Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id A741E7FBC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:21 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id c184so11262920pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mEMOUCieXF34iNg11IKj0pKEUN2nPHFG3x0gR9L4Geg=;
	b=pFy7eGQ3fatt1o+Of3upgDoiVz0ZciUC0HPZVEY1ZGOrGov/OqCSRnZEclVLZ064kA
	QKy5mP3hoH3T84THNjyZ4wySnk1AyxhFzq+WcxIGR5cdWEqsiiQ2PTxpj2f1PmMoH814
	xWTLp9uldix5oplnDbpqiYH+sXeW0th1s4rzxAnsx0+MvgRu7WPX8G3i9MXw0zdN8IvD
	7bPRORsQaadA/nSCrgZUJMcA+mAdR2NqwXIS9qb5uPDh5bF/XZ9ghgmjBd2WppOblK6B
	F7NrVADalrGAXOX5P0EyGwJaVq15Ppv4s4yDaO0NA0IewUIcRM31xD8fuVPOTifxr1Y+
	Q/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mEMOUCieXF34iNg11IKj0pKEUN2nPHFG3x0gR9L4Geg=;
	b=r6CQOa6JLyafEKRo0H3TlrggV9IGYjkFtCS3gK8aP+oRCFq8w6PX+1quy9QjagOdfv
	ZsoEckR0nZnZp50BXdrGn2oBEBKCCvcx+OKq+yQFTqhJ7HuDip5IoHD2Ne16ws7ryahz
	SIMhH18ju1vtVRyaXvwBX8jA1AVlcLT0/FiL1QXM9C6Cf4654ldIMbTpIdwZ+BVHjool
	XP1/A1GT2dd0lXUcqEGgVymfYqQ6bYWPorrnanrU/CFVv2SIJ1gJO1YYqSG9NIMKOFwe
	zQdxcIDON3a6ggutyTd5dNN7x7Zy0tOOjuM8Abi8azxlnyHzgTKVzFQeAByH8831u7ld
	yy1g==
X-Gm-Message-State: APjAAAUHPd84DzDOEj8t5okXcBBPMsln3rkKszfxkNPfVx0x2nmeHoiV
	cuLciyGbE+v/TAJfgO4NKZyhOx6b
X-Google-Smtp-Source: APXvYqwURqTG41oCj/ZUQ06Qf7VOuEh2esN9S7GWcEVdyuvZc2P8o6hCWGvdtDVPWYEcz2qrrichTA==
X-Received: by 2002:a63:b40b:: with SMTP id s11mr29324919pgf.142.1573497022517;
	Mon, 11 Nov 2019 10:30:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:56 -0800
Message-Id: <1344a6a1300007b4fadaf815f6652d30e7834430.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 14/21] selftest: skip virgl test on centos 7 entirely
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:22 -0000

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


