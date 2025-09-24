Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CACCAC5B3
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:46:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.11747.1758717994462702857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3whpYXDX;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46cf7bbfda8so23004795e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758717993; x=1759322793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M456LOfcv+R5+rQiyWbWwNTMDN6K7YlEjhb0xgV4jbc=;
        b=3whpYXDXb+3jmNtSZF+fT+zdreQOxwIywAoUuY1nmETPh8R0VUOPNRR7qh/uxwf+J2
         4PetFlFXc7zgeQGgj/zHJtqZDXk78XkUNfakCJcr01YLJh3gSZ6yyj5wB8iy5uIcNJhj
         5SYLabLnNQDgJLswi5ok/QSvBfJceKbcBUgvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758717993; x=1759322793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M456LOfcv+R5+rQiyWbWwNTMDN6K7YlEjhb0xgV4jbc=;
        b=iwlwpvaf8zhxurRQSgdqCLJIcLwc21XbLLS1M3S6P08o5beL+StXwTfVvitoXS8TjV
         i9wFj7jOi9nO/xsomlSeKSMUUKREUN1uvYetWaVC62R96AFvJQC64JdhQA7Fy/SmCtqW
         RHft8UEK78V1pzwc6hJRrcOgsMz98QuSXLTgKToaNHL1iGnjcgFTwDRFUBqiDEHZmCzM
         qQPvQJioCDy9g0K/1Uj7A+O7AHYhuY6PAcH1d02XkvjrT//x1GcIzEHLtnSKiQmdGG4F
         QjkloKoozVtIM6C6FDGtZFmKqgZEZND0JBWuEbZWr+8avP4K5a8RUDX2XrVupBr8mhdR
         YPcQ==
X-Gm-Message-State: AOJu0YwWg0DulcecezTk+boQD0lyJhPbthYv04t019xwwmwaxbDO+WDF
	Nd8O6s7MN03O4QGVfRV5TvmNvGmlQKnOb8wX2m2TsGm1ckCnk2kC4g6qi6qqgAWRnVJnCXe1f3S
	KP8oH
X-Gm-Gg: ASbGncshVDOAMSTj7iHtgZMnyZpNaw8PjNGTXDG/KxQpRux6xUW2oeKkhFUuxda1Khf
	gYIV6KqHjIUYhbVCD/BzCAznPwyVcNJLtDDAKRLBuo57Ze8oBBub6kTpGN5k77kYtk+8BqNf3vF
	vvDoU1FoqLS/XMES/MGgPE8vVPagkGbKgEjcFQaxkaKi4kNWFbkq7vdPOv2NWAkHZXJfh5db2Fy
	V/Zq8z66kf/mv3Ew7VFi4Cs/StGByRWpXomihEelTDFLDVFlsUJH3oJA+Xmf6SO/xyV+8t7k3/+
	UkkP1OFIMw3qvso4A1Yh7UcyvWqOfsZpYC2dchAbsbjFKjF1322wqj0fVltwTZ0/f5wbJEUXR6d
	Fogqq/bT9EIfzhoQ3PI05EVjkdKYEW/sbQnTcAUoRxQefSdWQLsPU3MBIK3HzsjF2PWV9+xqZF0
	bxU5FZ9ADUkLBQx2Xs8AUWtn8pW/jS4ZRa+p2q
X-Google-Smtp-Source: AGHT+IFuh939tNoZfzgrZ+xmx3jl4IShDQyedxAkuY3TVnUQ1w1GfKyuvrxsZnkQgCGABSj4lPr8wQ==
X-Received: by 2002:a05:600c:3583:b0:46e:1b03:6c77 with SMTP id 5b1f17b1804b1-46e1dae2ad2mr71246465e9.32.1758717992768;
        Wed, 24 Sep 2025 05:46:32 -0700 (PDT)
Received: from FRSMI24-BLUE.example.com (2a01cb000301bd00abbbfd8eac9677bf.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:abbb:fd8e:ac96:77bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbffaeasm28075098f8f.62.2025.09.24.05.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:46:32 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH 1/1] wic: extra partition plugin
Date: Wed, 24 Sep 2025 14:46:11 +0200
Message-Id: <20250924124611.3186960-2-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924124611.3186960-1-pierre-loup.gosse@smile.fr>
References: <20250924124611.3186960-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 12:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223975

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

The extra_partition plugin allows populating an extra partition with
files listed in the new IMAGE_EXTRA_FILES variable. The implementation
is similar to the bootimg_partition plugin.

This plugin provides an easy way to install files that are not part of
the rootfs.
---
 meta/classes-recipe/image_types_wic.bbclass   |   1 +
 meta/lib/oeqa/selftest/cases/wic.py           |  40 ++++++
 .../lib/wic/plugins/source/extra_partition.py | 133 ++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/extra_partition.py

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 6180874a4c..549a69db60 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -17,6 +17,7 @@ WICVARS ?= "\
 	IMAGE_BOOT_FILES \
 	IMAGE_CLASSES \
 	IMAGE_EFI_BOOT_FILES \
+	IMAGE_EXTRA_FILES \
 	IMAGE_LINK_NAME \
 	IMAGE_ROOTFS \
 	IMGDEPLOYDIR \
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b1c318bd4e..0c40edf695 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1647,6 +1647,46 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
 
+    def test_extra_partition_plugin(self):
+        """Test extra partition plugin"""
+        config = """
+IMAGE_EXTRA_FILES_label-foo = "bar.conf;foo.conf"
+IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf"
+IMAGE_EXTRA_FILES = "foo/*"
+WICVARS:append = "\
+    IMAGE_EXTRA_FILES_label-foo \
+    IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
+"
+"""
+        self.append_config(config)
+
+        deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
+
+        testfile = open(os.path.join(deploy_dir, "bar.conf"), "w")
+        testfile.write("test")
+        testfile.close()
+
+        os.mkdir(os.path.join(deploy_dir, "foo"))
+        testfile = open(os.path.join(deploy_dir, "foo", "bar.conf"), "w")
+        testfile.write("test")
+        testfile.close()
+
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines(['part / --source extra_partition --ondisk sda --fstype=ext4 --label foo --align 4 --size 5M\n',
+                            'part / --source extra_partition --ondisk sda --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --size 5M\n',
+                            'part / --source extra_partition --ondisk sda --fstype=ext4 --label bar --align 4 --size 5M\n'])
+            wks.flush()
+            _, wicimg = self._get_wic(wks.name)
+
+            result = runCmd("wic ls %s | wc -l" % wicimg)
+            self.assertEqual('4', result.output)
+
+            for part, file in enumerate(["foo.conf", "foobar.conf", "bar.conf"]):
+                result = runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1, file))
+                self.assertEqual(0, result.status)
+
+        self.remove_config(config)
+
     def test_fs_types(self):
         """Test filesystem types for empty and not empty partitions"""
         img = 'core-image-minimal'
diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
new file mode 100644
index 0000000000..d48715946c
--- /dev/null
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -0,0 +1,133 @@
+import logging
+import os
+import re
+
+from glob import glob
+
+from wic import WicError
+from wic.pluginbase import SourcePlugin
+from wic.misc import exec_cmd, get_bitbake_var
+
+logger = logging.getLogger('wic')
+
+class ExtraPartitionPlugin(SourcePlugin):
+    """
+    Populates an extra partition with files listed in the IMAGE_EXTRA_FILES 
+    BitBake variable. Files shoud be deployed to the DEPLOY_DIR_IMAGE directory.
+
+    The plugin supports:
+    - Glob pattern matching for file selection.
+    - File renaming.
+    - Suffixes to specify the target partition (by label, UUID, or partname),
+      enabling multiple extra partitions to coexist.
+
+    For example:
+
+        IMAGE_EXTRA_FILES_label-foo = "bar.conf;foo.conf"
+        IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf"
+        IMAGE_EXTRA_FILES = "foo/*"
+        WICVARS:append = "\
+            IMAGE_EXTRA_FILES_label-foo \
+            IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
+        "
+
+    """
+
+    name = 'extra_partition'
+    image_extra_files_var_name = 'IMAGE_EXTRA_FILES'
+
+    @classmethod
+    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             native_sysroot):
+        """
+        Called before do_prepare_partition(), list the files to copy
+        """
+        extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
+        install_cmd = "install -d %s" % extradir
+        exec_cmd(install_cmd)
+
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+        extra_files = None
+        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), ("_part-name-%s", part.part_name), (None, None)):
+            if fmt:
+                var = fmt % id
+            else:
+                var = ""
+            extra_files = get_bitbake_var(cls.image_extra_files_var_name + var)
+            if extra_files is not None:
+                break
+
+        if extra_files is None:
+            raise WicError('No extra files defined, %s unset for entry #%d' % (cls.image_extra_files_var_name, part.lineno))
+
+        logger.debug('Extra files: %s', extra_files)
+
+        # list of tuples (src_name, dst_name)
+        deploy_files = []
+        for src_entry in re.findall(r'[\w;\-\./\*]+', extra_files):
+            if ';' in src_entry:
+                dst_entry = tuple(src_entry.split(';'))
+                if not dst_entry[0] or not dst_entry[1]:
+                    raise WicError('Malformed extra file entry: %s' % src_entry)
+            else:
+                dst_entry = (src_entry, src_entry)
+
+            logger.debug('Destination entry: %r', dst_entry)
+            deploy_files.append(dst_entry)
+
+        cls.install_task = [];
+        for deploy_entry in deploy_files:
+            src, dst = deploy_entry
+            if '*' in src:
+                # by default install files under their basename
+                entry_name_fn = os.path.basename
+                if dst != src:
+                    # unless a target name was given, then treat name
+                    # as a directory and append a basename
+                    entry_name_fn = lambda name: \
+                                    os.path.join(dst,
+                                                 os.path.basename(name))
+
+                srcs = glob(os.path.join(kernel_dir, src))
+
+                logger.debug('Globbed sources: %s', ', '.join(srcs))
+                for entry in srcs:
+                    src = os.path.relpath(entry, kernel_dir)
+                    entry_dst_name = entry_name_fn(entry)
+                    cls.install_task.append((src, entry_dst_name))
+            else:
+                cls.install_task.append((src, dst))
+
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, we copies all files listed in IMAGE_EXTRA_FILES variable.
+        """
+        extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
+
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+        for task in cls.install_task:
+            src_path, dst_path = task
+            logger.debug('Install %s as %s', src_path, dst_path)
+            install_cmd = "install -m 0644 -D %s %s" \
+                          % (os.path.join(kernel_dir, src_path),
+                             os.path.join(extradir, dst_path))
+            exec_cmd(install_cmd)
+
+        logger.debug('Prepare extra partition using rootfs in %s', extradir)
+        part.prepare_rootfs(cr_workdir, oe_builddir, extradir,
+                            native_sysroot, False)
\ No newline at end of file
-- 
2.34.1


