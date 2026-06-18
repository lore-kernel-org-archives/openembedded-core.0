Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71ED0CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 09:17:57 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15415.1781774269768921944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 02:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lofFWebB;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84229481d44so302052b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 02:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781774269; x=1782379069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AuFbvjmWVwjS3cA/FBqXeeFe+Is5DCGf6YXUpg4Lpmw=;
        b=lofFWebBv4Y57jjWvoAvxUoIMU4c61Op1YsZcKsGP+ZjFuVUK1CdRWDf8VoovEa92J
         jNxPTGm7G92iDGexQl6VzrbIeqx0ihQ7gmFhvjCfQ2KOlgM8hTbG7427+Acenp1OjNFi
         o25F54bbpt8JdjcJgya/7nlFvIG1lQvKScsFrwMvVdonrF+W/eYHaTbYs/m+Y1k+Il8V
         FZZi+vj7ae1jOcg9O92fc7qWOR/rEhBYgZviwbLNaoXV5tTB0YcEsvcRUkatLr6ewT16
         /fi7bPnXzEnkk4ZhO8epyLZqLbBlzdbJNawstkYDyBN/m7aMk/7mstf7nUcvLN7IfwOo
         FL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774269; x=1782379069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuFbvjmWVwjS3cA/FBqXeeFe+Is5DCGf6YXUpg4Lpmw=;
        b=s9uqoY046CUN6on9OboHxc3P7Rbe7PQyPQC/PyF84ZWaPXTv7tUrAe0KkuZl+/msjM
         /IIY637l7ZvbhZI8xADQRAI+1FS9BVUJvWLQtWpwiYbb9InclQ+DNUKm+rKOo50ezcg4
         Mvj6Cr0XJ3t6xDB52VrUUF1jyv0RE6gs9OScmdDYzWF51MVMWQdoPuurz6RL6g2w9xr1
         5AZR3xZbNCf8xjrhVh0SpGIkaoaaWhQaUmrBmqYP0uVtfHNNTUoDKWDpYfpdRihjW80q
         amZlGuiPpTzaZTTp9MJCul12J6Q2U31A6UP6BGZ+XHcwU0hjjn1akXNKuKQXulns0aBf
         qEow==
X-Gm-Message-State: AOJu0Yx79iboCO1ZodVHnyzoYuriet4RaJqQ8sGK1Xjf+e9xNX5ctG2U
	Pee6s+N+Sg4iB07ff+oESf44pXGh3HArJRBqrpyRj1DbE8frh0nxd5L777CFVYSEj4I=
X-Gm-Gg: AfdE7clBv7cHzmWHUl3UO7VicRErsEuqSjC5dW20YV42Z/9wDAzb5Pl5Iu8wcq9k/P6
	z4Y+xbVq5V1+m9BJV+w+R7Nvv894B2j9ZJCVDXcvL7iaLRT1OlvDel5/iIrgfAcT1AYlww5d6WM
	kt10UjA+CgXqjDQOYbTIZvA2SMNpXAXLBg9QqCxH6CFow+ei8XnTrDQThVu6KCMqRwLYlBz0Qxh
	aS9EsFW0EwYFQIS9oy2efCGD8O/A/crQx1LiyJ1UTrw/PhlbQvlxUkT4tLJ9HzgCshyUO6oEjje
	A+W+QlE1K7kRFI6wPUNCI5g3Trn3aLoSC8OqcXJmzH9HTXwWYZfHMdecB+Pu/hIR+SCsSlNKrxc
	hon9a8tb6Szo8f2O/3Pv81JK58Oqi3dvXneIutOO/IDDbgTblwlC0Rs3k3PqnCl8brUdnbV9q8v
	tpQBhMwRt1d7IqRWsEJc68hPPi6MnUlDyIf+nNYkHpZp3VJ65nWvToBzM=
X-Received: by 2002:a05:6a00:e1b:b0:842:74e3:48b5 with SMTP id d2e1a72fcca58-8453b12690amr3051412b3a.13.1781774268919;
        Thu, 18 Jun 2026 02:17:48 -0700 (PDT)
Received: from naduvan.timesys.com ([223.184.90.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cd8dsm18266769b3a.1.2026.06.18.02.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 02:17:47 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [PATCH] oeqa/selftest/devtool: add regression test for kernel cfg in subdirs
Date: Thu, 18 Jun 2026 14:47:36 +0530
Message-Id: <20260618091736.2319572-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 09:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239071

Add test_devtool_modify_kernel_cfg_subdirs which exercises a
kernel-yocto recipe whose .scc file and the .cfg fragments it
references (via "kconf"/"patch" lines) live in separate
FILESEXTRAPATHS subdirectories (bsp/ and cfg/). This reproduces the
layout from [YOCTO #15169], where devtool modify previously failed
with FileNotFoundError while trying to copy the .cfg files: the path
was computed as dirname(<.scc file>) + <cfg filename>, which broke
whenever the .cfg file was not in the same directory as the .scc file
that references it.

The offending copy logic was removed in ce8190c519 ("devtool: Drop
oe-local-files and simplify"); this test guards against a regression.
Verified the test fails on d9328e3b0b (pre-fix, FileNotFoundError)
and passes on current master.

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 64 +++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5a6f38f8d5..b4b6dadb75 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1085,6 +1085,70 @@ class DevtoolModifyTests(DevtoolBase):
         # Try building
         bitbake(testrecipe)
 
+    def test_devtool_modify_kernel_cfg_subdirs(self):
+        """
+        Regression test for YOCTO #15169: devtool modify of a kernel-yocto
+        recipe must not fail when an .scc file and the .cfg fragments it
+        references (via "kconf"/"patch" lines) live in different
+        FILESEXTRAPATHS subdirectories. Pre-fix, devtool computed each .cfg
+        file's path as dirname(<.scc file>) + <cfg filename>, which broke
+        whenever the .cfg file was not in the same directory as the .scc
+        file that references it.
+        """
+        testrecipe = 'virtual/kernel'
+        bb_vars = get_bb_vars(['PN', 'FILE'], testrecipe)
+        realrecipe = bb_vars['PN']
+
+        tempparentdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempparentdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake -c clean %s' % realrecipe)
+
+        # bitbake-layers create-layer refuses to run if the target
+        # directory already exists, so pass a path that doesn't exist yet
+        # rather than pre-creating it with mkdtemp()
+        layerdir = os.path.join(tempparentdir, 'meta-selftest-kernelcfgsubdirs')
+        runCmd('bitbake-layers create-layer %s' % layerdir)
+        runCmd('bitbake-layers add-layer %s' % layerdir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % layerdir)
+
+        recipedir = os.path.join(layerdir, 'recipes-kernel', 'linux', realrecipe)
+        bspdir = os.path.join(recipedir, 'bsp')
+        cfgdir = os.path.join(recipedir, 'cfg')
+        os.makedirs(bspdir)
+        os.makedirs(cfgdir)
+
+        # .scc lives in bsp/, references .cfg files that live in cfg/ -
+        # this is the exact split reported in the bug
+        with open(os.path.join(bspdir, 'selftest-cfgsubdirs.scc'), 'w') as f:
+            f.write('kconf hardware selftest-spi.cfg\n')
+            f.write('kconf hardware selftest-clock.cfg\n')
+        with open(os.path.join(cfgdir, 'selftest-spi.cfg'), 'w') as f:
+            f.write('# CONFIG_SPI_SELFTEST is not set\n')
+        with open(os.path.join(cfgdir, 'selftest-clock.cfg'), 'w') as f:
+            f.write('# CONFIG_COMMON_CLK_SELFTEST is not set\n')
+
+        appendfile = os.path.join(layerdir, 'recipes-kernel', 'linux', realrecipe + '_%.bbappend')
+        with open(appendfile, 'w') as f:
+            f.write('FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/cfg:${THISDIR}/${PN}/bsp:"\n')
+            f.write('SRC_URI:append = " file://selftest-cfgsubdirs.scc"\n')
+            f.write('SRC_URI:append = " file://selftest-spi.cfg"\n')
+            f.write('SRC_URI:append = " file://selftest-clock.cfg"\n')
+
+        bitbake('%s -c cleansstate' % realrecipe)
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+
+        # Pre-fix (kirkstone-era), this raised FileNotFoundError while
+        # trying to shutil.copy2() selftest-spi.cfg/selftest-clock.cfg
+        # from inside bsp/ (the .scc's directory) instead of cfg/ (where
+        # they actually live).
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        self.assertNotIn('FileNotFoundError', result.output)
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'),
+                           'Workspace directory not created')
+
     def test_devtool_modify_virtual(self):
         # Try modifying a virtual recipe
         virtrecipe = 'virtual/make'
-- 
2.34.1


