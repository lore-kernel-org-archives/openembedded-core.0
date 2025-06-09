Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB60C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 13:45:46 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.60150.1749476743581715990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 06:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iloeg6W4;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235d6de331fso50766495ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 06:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749476743; x=1750081543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zPBORJgUM0P5kSeXauYZJGI6DSvcaVkNJp6PcAVOMdM=;
        b=Iloeg6W4IQCC+NnVKFOjTny6UlouOgBu0Q+RJRxYFvn1u24X52ACdjKliWczYzEkZo
         kDJDONLb5vd2/fm066zaUWt7OJGwQg9+0EODvMgw6eVOcSbv6tpXEW09aSPOmtxCfqKu
         jqmgtxM+Af/r5lDcTWZSGa5nGzBNE2oex97QmPpFj7YObqink3rcuCYoaxmdVitCxtvL
         FJvNco3kDHWHFCDJTAE6wS49lNdZ5e8yQaoQFgom3aVjpDmRoRAHSEjiTBVL4e5ZT7I/
         D88zpUwQEM4gXkh3XfhMqH/oQEiqiyK9aK3kY1uz/BxxgQ9lMSCKm/QC0CjOI95fbMZx
         0GgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749476743; x=1750081543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPBORJgUM0P5kSeXauYZJGI6DSvcaVkNJp6PcAVOMdM=;
        b=pItGRyvjlXNBviBzo7IoUKMvDH8mTHz3mScEdtlsXwy61QJZRs3SgUCbVXL5fbtJQl
         NwIaMPF7bz1PZQIeQGngPLy0unUrNadtVD3IkZRzEP6kZzQ3lhNX/sSUI6f62uDUCgRp
         QFaERJIthvxF0/UY7xQ8dBH3yAxAk0av/5sOCevyuj+zOFmmvlTC+f54UWnKBIph7Z4a
         Ex9z6wM6asrONjQfZSmiF8YMk2IasqOEtw5edhBtc7PM1CaFBHUhcI0uAtLvN7eW9k86
         MXSMllx6+VRb5guNcXQU/Zbwk8EuAYiIDnivwJtZmWu50kP+W0v5lBGN6Wxhkwvaq7xV
         W48A==
X-Gm-Message-State: AOJu0YySPygSVuwBk4AetmeEuYEmwx5QuZnT6Cl8c+/bPpg8jPe23Pee
	oRlkcZPaDqn5pgpJBFb2SwrcojMiIISv0jKrWzPrMiZVt2cHpqH1g/whcY73DQ==
X-Gm-Gg: ASbGncu8AiWqNmrg0ywnN4Jjiyo0pmwXI7jBG7zxdPHPc/8YFR2lxF+WS7zs4AXrXJP
	qRts0KkSV/shPGngqGazVz2FR3ndXTEicbsloVzWdFOsvbtXgU2KF5xgQnx7PptLWnyOWGcGa9i
	8bkUBe1a79eE4665jUrGqNolwKSeyWn4REOXv+//X5FDLpvtP+5KcTHpbn3yxoZSN5D8b6GaktL
	G5RwDLGbKhCsM3p1NkOSINUZ6PUR8EUj1CJoKUkNdf9qyPm/XrIPMRIL6VfF+CClqEDPX3TCWFz
	2UJy7V+b15STXiTNfegxp2QcYeZiayZuaTaYUF7L8rVJkTw9Z2NkQhFg1TjqR7/8Vw==
X-Google-Smtp-Source: AGHT+IHRjUihL+rSjXa0qA7kU2smefBTTaq2cfau39e0xs3SngHaOeRTsm9US9VHlH9129OsNkqkOQ==
X-Received: by 2002:a17:902:dacb:b0:235:f70:fd39 with SMTP id d9443c01a7336-23601ced438mr186932685ad.10.1749476742676;
        Mon, 09 Jun 2025 06:45:42 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c45:df5e:58ab:910f:e76c:4271])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603e2f9f7sm53652585ad.248.2025.06.09.06.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:45:42 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH v4] kernel-module-split: fix conf file generation when KERNEL_SPLIT_MODULES=0
Date: Mon,  9 Jun 2025 19:15:35 +0530
Message-ID: <20250609134535.11816-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 13:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218290

KERNEL_MODULE_AUTOLOAD defines the list of the kernel modules to be autoloaded
on boot. kernel-module-split.bbclass generates the required modules.load.d and
conf files for each kernel module. This conf files inturn read by system service
to perform module loading and configuration. When a kernel module is added to
KERNEL_MODULE_AUTOLOAD the conf files must be generated in all cases.
When KERNEL_SPLIT_MODULES=0 modprobe and autoload conf files are not
getting generated for the kernel modules.
To fix that enhanced the class implementation by separating out conf
file handling mechanism in two functions, generate_conf_files() and
frob_metadata(). generate_conf_files() handles no-split case where as
frob_metadata() keeps handling the existing case for spliting the modules.
Splitted common handling/generation of conf files stuff in to handle_conf_files()
function which gets invoked by both frob_metadata() and generate_conf_files()
on top of the scenario specific handling done in respective functions.
This implementation covers generation of the conf files for in-tree kernel
modules as well as standalone kernel module built as seperate package/recipe.

[YOCTO #15145]

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>

---
Previous version of the patch: https://lists.openembedded.org/g/openembedded-core/message/218016
oe-selftest: https://lists.openembedded.org/g/openembedded-core/message/218289

$ oe-selftest -r kernel_module_split.KernelSplitAutoloadTest.test_split_modules_enabled    2025-06-09 12:52:09,524 - oe-selftest - INFO - Adding layer libraries:
2025-06-09 12:52:09,525 - oe-selftest - INFO -  /data/home/diparmar/workspace/test/yocto-contri/poky/meta/lib
2025-06-09 12:52:09,525 - oe-selftest - INFO -  /data/home/diparmar/workspace/test/yocto-contri/poky/meta-yocto-bsp/lib
2025-06-09 12:52:09,525 - oe-selftest - INFO -  /data/home/diparmar/workspace/test/yocto-contri/poky/meta-selftest/lib
2025-06-09 12:52:09,526 - oe-selftest - INFO - Checking base configuration is valid/parsable
NOTE: Starting bitbake server...
2025-06-09 12:52:10,881 - oe-selftest - INFO - Adding: "include selftest.inc" in /data/home/diparmar/workspace/test/yocto-contri/poky/build-st/conf/local.conf
2025-06-09 12:52:10,881 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2025-06-09 12:52:10,882 - oe-selftest - INFO - test_split_modules_enabled (kernel_module_split.KernelSplitAutoloadTest)
2025-06-09 13:08:57,074 - oe-selftest - INFO -  ... ok
2025-06-09 13:09:16,651 - oe-selftest - INFO - ----------------------------------------------------------------------
2025-06-09 13:09:16,652 - oe-selftest - INFO - Ran 1 test in 1026.259s
2025-06-09 13:09:16,652 - oe-selftest - INFO - OK
2025-06-09 13:09:23,247 - oe-selftest - INFO - RESULTS:
2025-06-09 13:09:23,248 - oe-selftest - INFO - RESULTS - kernel_module_split.KernelSplitAutoloadTest.test_split_modules_enabled: PASSED (1006.23s)
2025-06-09 13:09:23,285 - oe-selftest - INFO - SUMMARY:
2025-06-09 13:09:23,285 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1026.264s
2025-06-09 13:09:23,285 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

$ oe-selftest -r kernel_module_split.KernelSplitAutoloadTest.test_split_modules_disabled
2025-06-09 13:09:43,796 - oe-selftest - INFO - Adding layer libraries:
2025-06-09 13:09:43,796 - oe-selftest - INFO -  /data/home/diparmar/workspace/test/yocto-contri/poky/meta/lib
2025-06-09 13:09:43,796 - oe-selftest - INFO -  /data/home/diparmar/workspace/test/yocto-contri/poky/meta-yocto-bsp/lib
2025-06-09 13:09:43,797 - oe-selftest - INFO -  /data/home/diparmar/workspace/test/yocto-contri/poky/meta-selftest/lib
2025-06-09 13:09:43,798 - oe-selftest - INFO - Checking base configuration is valid/parsable
NOTE: Starting bitbake server...
2025-06-09 13:09:45,073 - oe-selftest - INFO - Adding: "include selftest.inc" in /data/home/diparmar/workspace/test/yocto-contri/poky/build-st/conf/local.conf
2025-06-09 13:09:45,073 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2025-06-09 13:09:45,073 - oe-selftest - INFO - test_split_modules_disabled (kernel_module_split.KernelSplitAutoloadTest)
2025-06-09 13:26:15,628 - oe-selftest - INFO -  ... ok
2025-06-09 13:26:33,452 - oe-selftest - INFO - ----------------------------------------------------------------------
2025-06-09 13:26:33,452 - oe-selftest - INFO - Ran 1 test in 1008.795s
2025-06-09 13:26:33,453 - oe-selftest - INFO - OK
2025-06-09 13:26:40,253 - oe-selftest - INFO - RESULTS:
2025-06-09 13:26:40,253 - oe-selftest - INFO - RESULTS - kernel_module_split.KernelSplitAutoloadTest.test_split_modules_disabled: PASSED (990.58s)
2025-06-09 13:26:40,285 - oe-selftest - INFO - SUMMARY:
2025-06-09 13:26:40,285 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1008.798s
2025-06-09 13:26:40,286 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)
---
 .../kernel-module-split.bbclass               | 76 +++++++++++++++----
 1 file changed, 61 insertions(+), 15 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index a2d81f18e2..75ed696b72 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -86,11 +86,7 @@ python split_kernel_module_packages () {
             vals[m.group(1)] = m.group(2)
         return vals
 
-    def frob_metadata(file, pkg, pattern, format, basename):
-        vals = extract_modinfo(file)
-
-        dvar = d.getVar('PKGD')
-
+    def handle_conf_files(d, basename, pkg):
         # If autoloading is requested, output ${modulesloaddir}/<name>.conf and append
         # appropriate modprobe commands to the postinst
         autoloadlist = (d.getVar("KERNEL_MODULE_AUTOLOAD") or "").split()
@@ -102,7 +98,7 @@ python split_kernel_module_packages () {
 
         # The .conf file can either be installed by a recipe or generated from module_autoload_*
         conf = '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
-        name = '%s%s' % (dvar, conf)
+        name = '%s%s' % (d.getVar('PKGD'), conf)
         # If module name is in KERNEL_MODULE_AUTOLOAD, then generate the .conf file and write to `name`.
         if basename in autoloadlist:
             os.makedirs(os.path.dirname(name), exist_ok=True)
@@ -120,7 +116,7 @@ python split_kernel_module_packages () {
             d.appendVar('CONFFILES:%s' % pkg, conf2append)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
-                bb.fatal("pkg_postinst:%s not defined" % pkg)
+                postinst = d.getVar('pkg_postinst:modules')
             postinst += d.getVar('autoload_postinst_fragment') % (autoload or basename)
             d.setVar('pkg_postinst:%s' % pkg, postinst)
 
@@ -130,7 +126,7 @@ python split_kernel_module_packages () {
 
         # The .conf file can either be installed by a recipe or generated from module_conf_*
         conf = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
-        name = '%s%s' % (dvar, conf)
+        name = '%s%s' % (d.getVar('PKGD'), conf)
         # If module name is in KERNEL_MODULE_PROBECONF, then generate the .conf file and write to `name`.
         if modconf and basename in modconflist:
             os.makedirs(os.path.dirname(name), exist_ok=True)
@@ -145,6 +141,55 @@ python split_kernel_module_packages () {
             d.appendVar('FILES:%s' % pkg, conf2append)
             d.appendVar('CONFFILES:%s' % pkg, conf2append)
 
+    def generate_conf_files(d, root, file_regex, output_pattern):
+        """
+        Arguments:
+        root           -- the path in which to search. Contains system lib path
+                          so needs expansion.
+        file_regex     -- regular expression to match searched files. Use
+                          parentheses () to mark the part of this expression
+                          that should be used to derive the module name (to be
+                          substituted where %s is used in other function
+                          arguments as noted below)
+        output_pattern -- pattern to use for the package names. Must include %s.
+        """
+        import re, stat
+
+        dvar = d.getVar('PKGD')
+        root = d.expand(root)
+
+        # if the root directory doesn't exist, it's fatal - exit from the current execution.
+        if not os.path.exists(dvar + root):
+            bb.fatal("kernel module root directory path does not exist")
+
+        # walk through kernel module directory. for each entry in the directory, check if it
+        # matches the desired regex pattern and file type. if it fullfills, process it to generate
+        # it's conf file based on its package name.
+        for walkroot, dirs, files in os.walk(dvar + root):
+            for file in files:
+                relpath = os.path.join(walkroot, file).replace(dvar + root + '/', '', 1)
+                if not relpath:
+                    continue
+                m = re.match(file_regex, os.path.basename(relpath))
+                if not m:
+                    continue
+                file_f = os.path.join(dvar + root, relpath)
+                mode = os.lstat(file_f).st_mode
+                if not (stat.S_ISREG(mode) or (allow_links and stat.S_ISLNK(mode)) or (allow_dirs and stat.S_ISDIR(mode))):
+                    continue
+
+                basename = m.group(1)
+                on = legitimize_package_name(basename)
+                pkg = output_pattern % on
+                handle_conf_files(d, basename, pkg)
+
+
+    def frob_metadata(file, pkg, pattern, format, basename):
+        vals = extract_modinfo(file)
+        dvar = d.getVar('PKGD')
+
+        handle_conf_files(d, basename, pkg)
+
         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION:' + pkg) or ""
             d.setVar('DESCRIPTION:' + pkg, old_desc + "; " + vals["description"])
@@ -178,19 +223,20 @@ python split_kernel_module_packages () {
     postinst = d.getVar('pkg_postinst:modules')
     postrm = d.getVar('pkg_postrm:modules')
 
-    if splitmods != '1':
-        d.appendVar('FILES:' + metapkg, '%s %s %s/modules' %
-            (d.getVar('modulesloaddir'), d.getVar('modprobedir'), d.getVar("nonarch_base_libdir")))
-        d.appendVar('pkg_postinst:%s' % metapkg, postinst)
-        d.prependVar('pkg_postrm:%s' % metapkg, postrm);
-        return
-
     module_regex = r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
     module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
     module_pattern = module_pattern_prefix + kernel_package_name + '-module-%s' + module_pattern_suffix
 
+    if splitmods != '1':
+        d.appendVar('FILES:' + metapkg, '%s %s %s/modules' %
+            (d.getVar('modulesloaddir'), d.getVar('modprobedir'), d.getVar("nonarch_base_libdir")))
+        d.appendVar('pkg_postinst:%s' % metapkg, postinst)
+        d.prependVar('pkg_postrm:%s' % metapkg, postrm)
+        generate_conf_files(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern)
+        return
+
     modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
     if modules:
         d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
-- 
2.43.0


