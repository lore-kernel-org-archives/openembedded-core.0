Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45F8FC9EC3
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 23:29:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.795.1772839746615938196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 15:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IMCJxMo4;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso4177895e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 15:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772839745; x=1773444545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VaRUoN0Oc8U1KlI5t1M4Md0yBlJrDpfYdFcKOjXtM8=;
        b=IMCJxMo4yZgvEf+G9pmPF/TTMAQ9FKQUcCdgdlgbcqWt3Z16FeXfNiJs/IyYS4GQRg
         1MxUgTikjW282U0MmuM5oYy04WOTmzFQoD9t8e+Uhu4mEcYYsdeO9W1itDhdoDcV9ni0
         BoNBTuqY1Jtx6NUFFW2T9XxIgZBJg7LrvrbL4Lve3s7hyjnie4dC47lHvSPjo2gss96s
         K5vO3ocrrI3jph4ZpZDbnxE+oGRYD5HhFSRnFEs4B3l17ZycGC9oKEy/KnSilj7ghowz
         XD76Fitaw27BOBXyaTfvYMMfPoLwHGsYts2wytAFgvwfettQUyK/W4O3dti+m51Hk0Z3
         kriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839745; x=1773444545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VaRUoN0Oc8U1KlI5t1M4Md0yBlJrDpfYdFcKOjXtM8=;
        b=Ta+zPat8JVdjNx/NApCAAoXBbYmklPd2mmSbXOKwzlDKrdlk28hMXcNXnJ+Vb1Cu2N
         FFqEgPN1qTMrsSDVzcgveIUm3Pm5EPZYcSbAGGV3YO0MHybYzm37VnydNN1iI5qYIJSz
         Z+7isP5LCZL8L4zQc31d02zlPnJW0WTs9298HgsSK9vhWl1yaHMzSFMscfKETeaqPL6i
         iAbA8Nipj/C4FMiSvMgHNMuO9YAxAESqsxdGcYVGsG/FCuRel6MWflnBDeuCeUVpYh5o
         VFVyJQpfOrjO6H5Q/ytys0H3iziNfMZpx1wqyClI9bJDrW9i9LjvHok7AKGRWaVAI1lj
         7Ygw==
X-Gm-Message-State: AOJu0Yx5BMkKKwOTuAM5SH6U7HHtiVZpw+5j82mr2g/1Rwhp/xHHGbwI
	dN79eQLugs4SkU4QpSiUNivrOmrzNWgaD5OB35lpc7vuotmHYzcIoul3lT3nMQ==
X-Gm-Gg: ATEYQzzg71Le7Au9QB5QLGBgxXST2xzTD8Ei39elr6Z6Mf4LW89zXtyyw5foyZLN0Iz
	cuZNunO7Qj0yLw8NfwmYHS2vhaZ40oIwiwZ6UChunr3Iy1UWvjLrIfd721PSm2GrKksaOeI8A4i
	YPTZLWbGfmrgPVIodIzloEgibdTt5kqs1mSSUxVdsNuwvUUlm2GvgHEkDLvVyhno1+CsRD6Y5NW
	TJSppSTtKhomHFW7BVPVE3tZCx1Eq2WCMvsivu1cD8f/t2dmGsjQhtuCJ79RmFw/kdCoT0b/IMr
	Bu3UjSSyEOJLJrPHCR/+V40o8Mb8V4/eawInzo4dcdRvV5R+H69jSKuoADbYfdvyPrwdOYKZfFh
	2WAZ7s6BgCMfMWE6hOS0LP3qYL0BW+mS0Z6RKHOlE7UEWRl3AygXZ/FHIq1JphvBnoj5JjLuWJj
	7WixWGHVb2HB7A56VRbNHqqFpC9r1hkHjPZaZxbi3Y+meGZOy5Hr9WsEzq6NoFJ+r0w8agjekg3
	Bwg
X-Received: by 2002:a05:600c:4ec9:b0:483:7783:5373 with SMTP id 5b1f17b1804b1-4852697a0d8mr62198975e9.23.1772839744319;
        Fri, 06 Mar 2026 15:29:04 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b75eesm57818195e9.14.2026.03.06.15.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:29:03 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [PATCH V03] devtool: Add test-image plugin for testing packages via devtool via images.
Date: Sat,  7 Mar 2026 00:28:43 +0100
Message-ID: <20260306232842.3062503-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 23:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232602

Based of a feature of AUH this is a plugin to run a testimage directly with packages installed that you are working on via devtool.

Inputs would be a:
- target image
- target packages
- optional test suites to run (defaulting to all test suites)

The tool will take care to make sure it also installs the minimal necessary dependencies to be able to run ptest on the target image.
Logs will be captured and stored in the devtool workspace for easy access.

An oe-selftest is added to test the plugin.

V2: Dropped the hard dependency on using ext4 as a filesystem for the test image, now it can be used with any filesystem supported by the testimage plugin.
Furthermore now the correct test suite is installed.

V3: processed review comments:
- Runtime-heavy behavior was tied to using a larger image and plugin-side forcing.
- The updated selftest now targets core-image-ptest-<pkg> and completes much faster locally.
- Plugin no longer sets global config in a bbappend (DISTRO_FEATURES, runqemu params), matching reviewer guidance.
- The plugin now also supports running with a custom test suite, which is useful for testing specific test cases without having to run the entire test suite.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py |  64 +++++++++++
 scripts/lib/devtool/test_image.py       | 141 ++++++++++++++++++++++++
 2 files changed, 205 insertions(+)
 create mode 100644 scripts/lib/devtool/test_image.py

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d1209dd94e..baa3509da2 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1932,6 +1932,70 @@ class DevtoolBuildImageTests(DevtoolBase):
         if reqpkgs:
             self.fail('The following packages were not present in the image as expected: %s' % ', '.join(reqpkgs))
 
+
+class DevtoolTestImageTests(DevtoolBase):
+
+    @OETestTag("runqemu")
+    def test_devtool_test_image_ptest(self):
+        """Test devtool test-image plugin."""
+
+        machine = get_bb_var('MACHINE')
+        if not machine or not machine.startswith('qemu'):
+            self.skipTest('This test only works with qemu machines')
+
+        self.assertTrue(not os.path.exists(self.workspacedir),
+                        'This test cannot be run with a workspace directory under the build directory')
+
+        self.append_config('DISTRO_FEATURES:append = " ptest"')
+        self.append_config('IMAGE_CLASSES += " testimage"')
+        self.append_config('TEST_RUNQEMUPARAMS:append = " slirp"')
+
+        recipe = 'python3-atomicwrites'
+        image = 'core-image-ptest-%s' % recipe
+
+        # Ensure selected test package is ptest-capable.
+        ptest_path = get_bb_var('PTEST_PATH', recipe)
+        self.assertTrue(ptest_path,
+                'Selected package %s does not appear to inherit ptest' % recipe)
+
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+        # Ensure we're starting from a clean state
+        bitbake('%s -c clean' % image)
+
+        result = runCmd('devtool test-image %s -p %s --test-suites "ping ssh ptest"' % (image, recipe), ignore_status=True)
+        if result.status != 0 and 'runqemu - ERROR - Unknown path arg' in result.output:
+            self.skipTest('runqemu in this environment does not accept testimage rootfs path args')
+        self.assertEqual(result.status, 0,
+                         'devtool test-image failed unexpectedly:\n%s' % result.output)
+
+        # Check that requested package and its ptest package were installed
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        self.assertTrue(deploy_dir_image, 'Unable to get DEPLOY_DIR_IMAGE')
+
+        manifests = sorted(glob.glob(os.path.join(deploy_dir_image, '%s*.manifest' % image)))
+        self.assertTrue(manifests, 'Image manifest not found for %s in %s' % (image, deploy_dir_image))
+        manifest = manifests[-1]
+        self.assertExists(manifest, 'Image manifest not found: %s' % manifest)
+
+        pkgs = set()
+        with open(manifest, 'r') as f:
+            for line in f:
+                splitval = line.split()
+                if splitval:
+                    pkgs.add(splitval[0])
+
+        self.assertIn(recipe, pkgs)
+        self.assertIn(recipe + '-ptest', pkgs)
+
+        match = re.search(r'Logs are in (\S+)', result.output)
+        if match:
+            logdir = match.group(1)
+        else:
+            logdir = os.path.join(self.workspacedir, 'testimage-logs')
+        self.assertTrue(os.path.isdir(logdir), 'Expected logs directory not found: %s' % logdir)
+
 class DevtoolUpgradeTests(DevtoolBase):
 
     def setUp(self):
diff --git a/scripts/lib/devtool/test_image.py b/scripts/lib/devtool/test_image.py
new file mode 100644
index 0000000000..c34ddeeecd
--- /dev/null
+++ b/scripts/lib/devtool/test_image.py
@@ -0,0 +1,141 @@
+# Development tool - test-image plugin
+#
+# Copyright (C) 2026 Authors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+
+"""Devtool plugin containing the test-image subcommand.
+
+Builds a target image, installs specified package(s) from the workspace or
+layer, and runs the image's test suite via the BitBake `testimage` task.
+"""
+
+import os
+import logging
+
+from devtool import DevtoolError
+from devtool.build_image import build_image_task
+
+logger = logging.getLogger('devtool')
+
+
+def _create_ptest_recipe_appends(config, package_names):
+    """Create temporary per-package appends forcing PTEST_ENABLED=1.
+
+    Returns list of created file paths for cleanup.
+    """
+    created = []
+    appends_dir = os.path.join(config.workspace_path, 'appends')
+    os.makedirs(appends_dir, exist_ok=True)
+
+    for pn in sorted(set(package_names)):
+        appendfile = os.path.join(appends_dir, f'{pn}_%.bbappend')
+        if os.path.exists(appendfile):
+            logger.debug('Using existing append %s', appendfile)
+            continue
+        with open(appendfile, 'w') as afile:
+            afile.write('PTEST_ENABLED = "1"\n')
+        created.append(appendfile)
+
+    return created
+
+
+def test_image(args, config, basepath, workspace):
+    """Entry point for the devtool 'test-image' subcommand."""
+
+    if not args.package:
+        raise DevtoolError('Package(s) to install must be specified via -p/--package')
+
+    package_names = [p.strip() for p in args.package.split(',') if p.strip()]
+    if not package_names:
+        raise DevtoolError('No valid package name(s) provided')
+
+    if args.imagename:
+        imagename = args.imagename
+    else:
+        if len(package_names) != 1:
+            raise DevtoolError('Image recipe must be specified when testing multiple packages')
+        imagename = f'core-image-ptest-{package_names[0]}'
+
+    install_pkgs = package_names
+
+    logdir = os.path.join(config.workspace_path, 'testimage-logs')
+    try:
+        os.makedirs(logdir, exist_ok=True)
+    except Exception as exc:
+        raise DevtoolError(f'Failed to create test logs directory {logdir}: {exc}')
+
+    pkg_append = ' '.join(sorted(set(install_pkgs)))
+    ptest_pkg_append = ' '.join(f'{pn}-ptest' for pn in sorted(set(install_pkgs)))
+    extra_append = [
+        f'TEST_LOG_DIR = "{logdir}"',
+        'IMAGE_CLASSES += " testimage"',
+        'IMAGE_FEATURES += "allow-empty-password empty-root-password allow-root-login"',
+        'IMAGE_INSTALL:append = " ptest-runner sshd"',
+        # Ensure requested packages (and -ptest where available) are installed
+        f'IMAGE_INSTALL:append = " {pkg_append}"',
+        f'IMAGE_INSTALL:append = " {ptest_pkg_append}"',
+    ]
+    if args.test_suites:
+        suites = ' '.join(args.test_suites.split())
+        if suites:
+            extra_append.append(f'TEST_SUITES = "{suites}"')
+
+    temp_ptest_appends = _create_ptest_recipe_appends(config, package_names)
+
+    logger.info('Running testimage for %s with packages: %s',
+                imagename, ' '.join(install_pkgs))
+    try:
+        result, _outputdir = build_image_task(
+            config,
+            basepath,
+            workspace,
+            imagename,
+            add_packages=None,
+            extra_append=extra_append,
+        )
+        if result == 0:
+            result, _outputdir = build_image_task(
+                config,
+                basepath,
+                workspace,
+                imagename,
+                add_packages=None,
+                task='testimage',
+                extra_append=extra_append,
+            )
+    finally:
+        for appendfile in temp_ptest_appends:
+            if os.path.exists(appendfile):
+                os.unlink(appendfile)
+
+    if result == 0:
+        logger.info('Testimage completed. Logs are in %s', logdir)
+    return result
+
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from the test-image plugin"""
+    parser = subparsers.add_parser(
+        'test-image',
+        help='Build image, install package(s), and run selected test suites',
+        description=(
+            'Builds an image, installs specified package(s), and runs the\n'
+            'BitBake testimage task. Use --test-suites to limit runtime suites\n'
+            '(for example: "ping ssh ptest").'
+        ),
+        group='testbuild',
+        order=-9,
+    )
+    parser.add_argument('imagename', help='Image recipe to test (defaults to core-image-ptest-<package>)', nargs='?')
+    parser.add_argument(
+        '-p', '--package', '--packages',
+        help='Package(s) to install into the image (comma-separated)',
+        metavar='PACKAGES',
+    )
+    parser.add_argument(
+        '--test-suites',
+        help='Override TEST_SUITES for this invocation (space-separated)',
+        metavar='SUITES',
+    )
+    parser.set_defaults(func=test_image)
-- 
2.43.0


