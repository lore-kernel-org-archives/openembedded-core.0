Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 262927F8CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:37:05 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id a15so5411987wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 02:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7TtH4S8JlCuPHNpySOHxw3mH/AI4b7mRElXTQe4RrUc=;
	b=KX0WS9Jm+0eRyJphPTDbUIfd5qKwN/0CsQvnTr9UNeT2aX0M7+/JoDDUy0JcRj9B19
	px7L3GeTs9187ZubsHTTmJwThbD15PWchWAX0VgUJNY+bF/LkYprHFVJlieAEQeFtEBb
	EsnEJDf6xqrg8EYpC7tuzfEE2QUiI4ru7zFyzHT3H4TQX0b9uMzpyWmCbuLin3v6vpI/
	yzUnzJ22sOU8rYrYAeN0alJ8Ibv91xJ52cfuQ0SBmgzm4se+kOr+e+plX8AKZe3UttMX
	NabLvSuahxUfLlNPAveXOivdvgkXB1pgGIzx6j/N2iB8Y0n6qC0Gz8NAeTwKuJR9i4z2
	c6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7TtH4S8JlCuPHNpySOHxw3mH/AI4b7mRElXTQe4RrUc=;
	b=TfImx4XqCeheCI0A3YuKdx3Ac0qg1/ASvrjfjxGZtAgqYYoFpCIrYzPv5PzI+YQnoD
	/pZY6WOkg64wOtbFPN5DXUx2/MJxdQOZ6QVYOdVGhxTxPLeOhSdPlaJVQj4pvS/i4PhD
	Vu4RHepwqZLhgeaQsUwfHvmTvDQeAYUmhMy2AvMaaMZmu5Tf6/RBBS5mM7kNyXT7ilTU
	R0Jb46sNqEoXNxNzMbRi4ErUD2OeEzDdy+EC2h8AcWyUmjS2xhrArbGjVsf71NlMRq0a
	WHVWDMiyDHrJ+xqgllkeP57EUyXy7QXsaEmEogv3B3vH+HoBolhFP7jI3Zgs5SzRk7gZ
	xf4Q==
X-Gm-Message-State: APjAAAXhaRTNQEXjZ5GPcQdo5QSfacfAzgp46BpE5d8oCzjHQQjKhXvH
	8LdlLUW1DLUHWgRNHFX+HMUNXQystYM=
X-Google-Smtp-Source: APXvYqxvDMEzwuuHe9Xx9giQ353kuMr8LptjbQUVtCKK+6Vl2MU8170PXxlUcFfkPrdeG1jIJVEFSA==
X-Received: by 2002:a5d:63c1:: with SMTP id c1mr4380537wrw.332.1572514626479; 
	Thu, 31 Oct 2019 02:37:06 -0700 (PDT)
Received: from localhost.localdomain ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	b186sm2950263wmb.21.2019.10.31.02.37.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 02:37:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:36:51 +0100
Message-Id: <20191031093655.14852-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191031093655.14852-1-alex.kanavin@gmail.com>
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/6] selftest: skip virgl test on centos 7 entirely
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
X-List-Received-Date: Thu, 31 Oct 2019 09:37:06 -0000

With the sdl frontend, qemu isn't able to even boot fully,
so let's skip the test early.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-selftest/lib/oeqa/runtime/cases/virgl.py | 5 -----
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 2 ++
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/virgl.py b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
index d301a19fa42..c0abfd1b161 100644
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
index 3f212bd0eac..7d3922ce448 100644
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
2.17.1


