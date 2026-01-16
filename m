Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109ECD3CCAB
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:32:25 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2431.1768555944238553856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=AHRqZB4Q;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.68, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b87677a8a96so30814366b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768555942; x=1769160742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+92Z9aqK/kUEq6LNps1BVB2MaJkDBOyOuE52/clwQ98=;
        b=AHRqZB4Q7Mb4/NiqPMleIuIjkUMu5Wgm66skfuIRMjl4F7o+ElDKw4VPqogF0dWHnL
         HAGAbjYNpc3N/POj0dcdoycQMkfLKDohjEDDxPjbpjcdz+71MtsW2uyrYXb3wM2a+p97
         nLl+Hq9FJu0/ys5rOke0Ltk6VhZv/VdmbuCRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555942; x=1769160742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+92Z9aqK/kUEq6LNps1BVB2MaJkDBOyOuE52/clwQ98=;
        b=flLEUWVKvCqfpl2/TFBldPAxLNmFoAgiy84QZ+13Q3OhAiUpkJX7ZbC5NzYJTB3jQw
         LZjC5pH6a0oWiANj7wjoSh2FRtifxSiBb8eVNKQcbk8ZofxzvX9XJHqvimGWlylhoOVy
         D3yaLynoQsxX7ZpAwMhfPXLvrhtB4aibvmp/p1dF3ENmgPcd5QiPlo03iQHgtuShG/nK
         LTP/AU3pRk/7OPXiQNoDi7TQXzM/7KqwrsdZZsFidNOBMECpZ7q4aAffOUgKywj0Qo2p
         4MTQ+U88LDpsNRk1wWfm4D5em+4iOvMU2vrrtSSHVZYu+4SyDcBeDa8ZgfxeesSccFCT
         cADA==
X-Gm-Message-State: AOJu0Yzzj0pmqo1mwk2WyItRxifdfnHm0QQnbJbsDMizcbzra3DmBegN
	sRFvZvo2AP3PBgDJXtVg2aV7WGHF0nQ1Kw7R8l763bgRMrTmkC1DFXTxaIzhGPy2CRjOt4O+Qtk
	Qq8uxwOY=
X-Gm-Gg: AY/fxX7J1nSqM/GfjMQML14D4eT7B6yYbXP1H0Y+1Pv2AI6RN2k+9hpR/83nRsqowLQ
	DRW/drTjQzrHepVM24Afq9hnbIuXuX5rx1BYfHvulKJxqTSN+nCec4bjpSG+bUSztYt7nDKlxjQ
	y3sjKfXuEZkfYK+FnLI0orttf0s54O21feOLFMdcpo8PvB5Ql8C2weNvbsEIJb4UNsNy0hFthFY
	h9U6Aj9eLe2ezg2uqAJowypffVRVCKjUqvEhK97tnMpCI46qMvxrENIa9IBVy+YkJ4WeAAR/kLD
	2h6YZbK37uJ8yRyG5mwwFYHBE9kZMLR/9NdRBEke3uePvf5qgoGFe7Wz1b0wGLu1Sz96IOXjFid
	vazYH1SuePWg1vPLp7YfDKCGSIQcyaJ8LCtylkrzXmXgmL0S3a1fTnQg+mZipuKvHHkelQwRSFa
	FWWNNpKtdoFiITyRw861HYB4myKc8Rzyj7R9YhTJ/2UAb6v+4ll+uiT3kmr/EzQvPPwC0VC5GyJ
	L53wpGJA/2a4oZb9DByKgdBmPJSQejfLi46E8R9HzYIgdeIo/sk
X-Received: by 2002:a17:907:3cc9:b0:b87:2780:1b2b with SMTP id a640c23a62f3a-b8793023afdmr107997966b.4.1768555942443;
        Fri, 16 Jan 2026 01:32:22 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e6d3sm187982366b.4.2026.01.16.01.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 01:32:21 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 6/6] wic: extra-partitions: extend to support extra directories
Date: Fri, 16 Jan 2026 10:32:15 +0100
Message-ID: <20260116093215.26108-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
References: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229536

  - Add the ability to define a space-delminated list of directories
    to create on the extra partition.

  - Extend the fail condition to fail if both extra directories and
    extra files is not defined.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Make the list space deliminated instead of semicolon deliminated.
          If the list is blank, print a warning instead of an info.

v2 -> v3: Remove uneeded logic in _parse_extra_directories

v3 -> v4: Rework to error if extra directories and files are not set.

v4 -> v5: Fix double image_extra_partition_dirs_var_name typo 
          Change logger.debug print for consistency
          Reword plugin description for clarity
          Add an extra line in the plugin description before the WICVARS
          Remove extra space between _get_extra_vars and _parse_extra_directories

 meta/lib/oeqa/selftest/cases/wic.py           | 11 ++++
 .../lib/wic/plugins/source/extra_partition.py | 60 +++++++++++++++----
 2 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index d7a9b14658..83072deaae 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1657,10 +1657,14 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
     def test_extra_partition_plugin(self):
         """Test extra partition plugin"""
         config = dedent("""\
+        IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo = "/test1 /test2/test3"
+        IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "/test1 /test2/test3"
         IMAGE_EXTRA_PARTITION_FILES_label-foo = "bar.conf;foo.conf"
         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf"
         IMAGE_EXTRA_PARTITION_FILES = "foo/*"
         WICVARS:append = "\
+            IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo \
+            IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
             IMAGE_EXTRA_PARTITION_FILES_label-foo \
             IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
         "
@@ -1692,6 +1696,13 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                 result = runCmd("wic ls %s | wc -l" % wicimg)
                 self.assertEqual('4', result.output, msg="Expect 3 partitions, not %s" % result.output)
 
+                for part, extra_dir in enumerate(["test1", "test2"]):
+                    result = runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1, extra_dir))
+                    self.assertEqual(0, result.status, msg="Directory '%s' not found in the partition #%d" % (extra_dir, part))
+
+                    result = runCmd("wic ls %s:%d/test2 | grep -q \"test3\"" % (wicimg, part + 1))
+                    self.assertEqual(0, result.status, msg="Directory test2/test3 not found in the partition #%d" % part)
+
                 for part, file in enumerate(["foo.conf", "foobar.conf", "bar.conf"]):
                     result = runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1, file))
                     self.assertEqual(0, result.status, msg="File '%s' not found in the partition #%d" % (file, part))
diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index 327bc2b8c3..3be7aed374 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -12,21 +12,31 @@ logger = logging.getLogger('wic')
 
 class ExtraPartitionPlugin(SourcePlugin):
     """
-    Populates an extra partition with files listed in the IMAGE_EXTRA_PARTITION_FILES
-    BitBake variable. Files should be deployed to the DEPLOY_DIR_IMAGE directory.
+    Populates an extra partition with:
+    - Files listed in the IMAGE_EXTRA_PARTITION_FILES BitBake variable. Files should be deployed to
+      the DEPLOY_DIR_IMAGE directory.
+    - Empty directories listed in the IMAGE_EXTRA_PARTITION_DIRECTORIES Bitbake variable.
+      Directories are created automatically.
 
     The plugin supports:
     - Glob pattern matching for file selection.
     - File renaming.
     - Suffixes to specify the target partition (by label, UUID, or partname),
       enabling multiple extra partitions to coexist.
+    - Extra directories.
 
     For example:
 
+        IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo = "/foo /bar/baz"
+        IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "/foo /bar/baz"
+
         IMAGE_EXTRA_PARTITION_FILES_label-foo = "bar.conf;foo.conf"
         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf"
         IMAGE_EXTRA_PARTITION_FILES = "foo/*"
+
         WICVARS:append = "\
+            IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo \
+            IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
             IMAGE_EXTRA_PARTITION_FILES_label-foo \
             IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
         "
@@ -34,6 +44,7 @@ class ExtraPartitionPlugin(SourcePlugin):
     """
 
     name = 'extra_partition'
+    image_extra_partition_dirs_var_name = 'IMAGE_EXTRA_PARTITION_DIRECTORIES'
     image_extra_partition_files_var_name = 'IMAGE_EXTRA_PARTITION_FILES'
 
     @classmethod
@@ -50,6 +61,22 @@ class ExtraPartitionPlugin(SourcePlugin):
                 break
         return extra_vars
 
+    @classmethod
+    def _parse_extra_directories(cls, part):
+        """
+        Parse the directories of which to copy.
+        """
+        cls.extra_dirs_task = []
+
+        extra_dirs = cls._get_extra_vars(part, cls.image_extra_partition_dirs_var_name)
+        if extra_dirs is None:
+            logger.info('No extra directories defined, %s unset for entry #%d' % (cls.image_extra_partition_dirs_var_name, part.lineno))
+            return
+
+        logger.info('Extra dirs: %s', extra_dirs)
+        for src_entry in extra_dirs.strip().split(' '):
+            cls.extra_dirs_task.append(src_entry)
+
     @classmethod
     def _parse_extra_files(cls, part, kernel_dir):
         """
@@ -113,6 +140,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
+        cls._parse_extra_directories(part)
         cls._parse_extra_files(part, kernel_dir)
 
     @classmethod
@@ -126,24 +154,32 @@ class ExtraPartitionPlugin(SourcePlugin):
         """
         extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
 
-        if not cls.extra_files_task:
-            raise WicError("Entry #%d does not have a corresponding %s variable set!"
+        if not cls.extra_dirs_task and not cls.extra_files_task:
+            raise WicError("Entry #%d does not have a corresponding %s or %s variable set!"
                            "If you wish to create an empty partition, remove "
                            "--source extra-partition from the wks file"
-                           % (part.lineno, cls.image_extra_partition_files_var_name))
+                           % (part.lineno, cls.image_extra_partition_dirs_var_name,
+                              cls.image_extra_partition_files_var_name))
 
         if not kernel_dir:
             kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-        for task in cls.extra_files_task:
-            src_path, dst_path = task
-            logger.debug('Install %s as %s', src_path, dst_path)
-            install_cmd = "install -m 0644 -D %s %s" \
-                          % (os.path.join(kernel_dir, src_path),
-                             os.path.join(extradir, dst_path))
-            exec_cmd(install_cmd)
+        if cls.extra_dirs_task:
+            for task in cls.extra_dirs_task:
+                logger.debug("Create directory %s" % task)
+                mkdir_cmd = "mkdir -p %s/%s" % (extradir, task)
+                exec_cmd(mkdir_cmd)
+
+        if cls.extra_files_task:
+            for task in cls.extra_files_task:
+                src_path, dst_path = task
+                logger.debug('Install %s as %s', src_path, dst_path)
+                install_cmd = "install -m 0644 -D %s %s" \
+                              % (os.path.join(kernel_dir, src_path),
+                                 os.path.join(extradir, dst_path))
+                exec_cmd(install_cmd)
 
         logger.debug('Prepare extra partition using rootfs in %s', extradir)
         part.prepare_rootfs(cr_workdir, oe_builddir, extradir,
-- 
2.52.0


