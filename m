Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3DEC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:12:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.7208.1749129162948499823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 06:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IJQ6OtAt;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2352400344aso8449305ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 06:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749129162; x=1749733962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGrLAaSeo2u5ZHQW3qJo8f7t3lJOxLm/fWr7R+QrvhI=;
        b=IJQ6OtAtieqFEDiGqWbJi7dZqRYUvndbwE8996FGbH0sR8Z55WqqnklVhMQrVYxwEy
         ZpNPnMTU7CmsB3tqkokmFXSB0sX99xVAcdTh6b72pkWz+R82ZLYiAoTdrw309+VjelMM
         OojvdO8yE82dKCcD8HSuGoCGRYUtg1+9OUS7114X1G1TObqhudzsAwl8m5DDEKaaqtn7
         /M8L58VDTcJYqJ7PqdtrXxH9oS+xmAonxl/KQqBGD5yClDymTqBIudBi8ovxPIcFeiiK
         kj2np++7Pim8cHmJ5mraV09KoLCDkgAKILSLSjFISdPbajGhTXFVYbsYZQSSV/figyfS
         o9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129162; x=1749733962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGrLAaSeo2u5ZHQW3qJo8f7t3lJOxLm/fWr7R+QrvhI=;
        b=mvvwjun7PWuwuhqUoxba7HlhC1YTs41y2Thkv2383dY2ondzpQGK/TzDCCspi4UCVg
         LIoCUYVZEd1OhxOsbAocXiBWu0Q2MOf/TnfTmeBt1awINBTrmu2kO1w1Mv0YMRyuDbCh
         A6Yo6oWy+7xoGL/wYjx4MZEuEYX5RXXcuH608A/oHbctXiMDV7zVBXKKIBhyJY2vrLkT
         TPpt2qYAJD+fsiyworhcl+IC95PCYrQ4HZHFpcjfnqJ2HmuSxdMb3nsJXFgxM/AcRDz3
         sp2lKh8Nso6+grLBlM42m5lGquabSh2dj6UqcPxdZRB1MzxT2IFon1ZMPNAtmyghaybb
         AOcQ==
X-Gm-Message-State: AOJu0Yw83HgybocLZ0kYsNAeKwV/q7RrM3Ix2LUU6nXdchtA5E9X4DmY
	u8o1ikzlRlFT3EZQjuxngt9EDMRvFuxk26T1UR1pPXP1T6Z1xYC/n+7sn5eogQ==
X-Gm-Gg: ASbGncsb+jK8DPRrZpyXs1PQ7Wp4Vcf1nLQ0T+pG3P0Zi29LNfp8LweMcQZDtqz/Xj8
	tqUVQxIPhfOTE/twb8sujeFdtrN9NGIHLL56xk7sIJlv7tqkEp6ffwycdd0Ejvndo84XFDGknYN
	a1O1yCToFs37zo2XzLX6lNnIm5wIC3/EkLXnxQbWyWI7qZyxeEclcNZ9odJVReuNMUysd0MYBoT
	hIaWa/p480qVBbNUyBDYfXKTrVGP6mpCN5zNJ7+S7ydWYWdjXZGt0Ni9hULb6I59iSRZyUKd7sz
	7l3wxSMLP7t4aAVMPfippWwsHQdKLpmyCkZd+fltcZp3+3H8J/Isg9kznxlejEtytA==
X-Google-Smtp-Source: AGHT+IEfBTp06mE88mAPxJeMAcIWwg2DIo/xLHMBIqeK8EOSkS9ujSLgyVl/pMdjXNu+KOW834wAMg==
X-Received: by 2002:a17:902:8603:b0:234:9497:69e3 with SMTP id d9443c01a7336-235e14bc6b3mr69633215ad.25.1749129161583;
        Thu, 05 Jun 2025 06:12:41 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c44:a779:7fef:8c20:c62d:6de3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3506sm119397845ad.156.2025.06.05.06.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:12:41 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH 1/1] kernel-module-split: fix conf file generation when KERNEL_SPLIT_MODULES=0
Date: Thu,  5 Jun 2025 18:42:34 +0530
Message-ID: <20250605131235.366013-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218016

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
Previous version of the patch: https://lists.openembedded.org/g/openembedded-core/topic/111815220
oe-selftest patch: https://lists.openembedded.org/g/openembedded-core/message/218013

Validated these changes by the oe-selftest:
1. With the existing implementation the kernel_module_split.KernelSplitAutoloadTest.test_split_modules_disabled
test case fails because the autoload/modconf .conf files are not getting generated for each modules.
2. With this fix both enabled & disabled testcases are passed. Below are test case running results.

$ oe-selftest -r kernel_module_split.KernelSplitAutoloadTest.test_split_modules_disabled
2025-05-29 16:17:29,377 - oe-selftest - INFO - Adding layer libraries:
2025-05-29 16:17:29,377 - oe-selftest - INFO -  /data/home/diparmar/workspace/test/yocto-contri/poky/meta/lib
2025-05-29 16:17:29,377 - oe-selftest - INFO -  /data/home/diparmar/workspace/test/yocto-contri/poky/meta-yocto-bsp/lib
2025-05-29 16:17:29,377 - oe-selftest - INFO -  /data/home/diparmar/workspace/test/yocto-contri/poky/meta-selftest/lib
2025-05-29 16:17:29,378 - oe-selftest - INFO - Checking base configuration is valid/parsable
NOTE: Starting bitbake server...
2025-05-29 16:17:30,926 - oe-selftest - INFO - Adding: "include selftest.inc" in /data/home/diparmar/workspace/test/yocto-contri/poky/build-st/conf/local.conf
2025-05-29 16:17:30,927 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2025-05-29 16:17:30,927 - oe-selftest - INFO - test_split_modules_disabled (kernel_module_split.KernelSplitAutoloadTest)
2025-05-29 16:19:51,512 - oe-selftest - INFO -  ... ok
2025-05-29 16:20:00,367 - oe-selftest - INFO - ----------------------------------------------------------------------
2025-05-29 16:20:00,368 - oe-selftest - INFO - Ran 1 test in 149.890s
2025-05-29 16:20:00,368 - oe-selftest - INFO - OK
2025-05-29 16:20:09,019 - oe-selftest - INFO - RESULTS:
2025-05-29 16:20:09,019 - oe-selftest - INFO - RESULTS - kernel_module_split.KernelSplitAutoloadTest.test_split_modules_disabled: PASSED (140.59s)
2025-05-29 16:20:09,036 - oe-selftest - INFO - SUMMARY:
2025-05-29 16:20:09,037 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 149.891s
2025-05-29 16:20:09,037 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

===

$ oe-selftest -r kernel_module_split.KernelSplitAutoloadTest.test_split_modules_enabled
2025-05-29 16:20:53,538 - oe-selftest - INFO - Adding layer libraries:
2025-05-29 16:20:53,538 - oe-selftest - INFO -  /data/home/diparmar/workspace/test/yocto-contri/poky/meta/lib
2025-05-29 16:20:53,538 - oe-selftest - INFO -  /data/home/diparmar/workspace/test/yocto-contri/poky/meta-yocto-bsp/lib
2025-05-29 16:20:53,538 - oe-selftest - INFO -  /data/home/diparmar/workspace/test/yocto-contri/poky/meta-selftest/lib
2025-05-29 16:20:53,540 - oe-selftest - INFO - Checking base configuration is valid/parsable
NOTE: Starting bitbake server...
2025-05-29 16:20:55,000 - oe-selftest - INFO - Adding: "include selftest.inc" in /data/home/diparmar/workspace/test/yocto-contri/poky/build-st/conf/local.conf
2025-05-29 16:20:55,001 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2025-05-29 16:20:55,001 - oe-selftest - INFO - test_split_modules_enabled (kernel_module_split.KernelSplitAutoloadTest)
2025-05-29 16:23:08,930 - oe-selftest - INFO -  ... ok
2025-05-29 16:23:19,735 - oe-selftest - INFO - ----------------------------------------------------------------------
2025-05-29 16:23:19,735 - oe-selftest - INFO - Ran 1 test in 145.057s
2025-05-29 16:23:19,736 - oe-selftest - INFO - OK
2025-05-29 16:23:28,312 - oe-selftest - INFO - RESULTS:
2025-05-29 16:23:28,313 - oe-selftest - INFO - RESULTS - kernel_module_split.KernelSplitAutoloadTest.test_split_modules_enabled: PASSED (133.93s)
2025-05-29 16:23:28,321 - oe-selftest - INFO - SUMMARY:
2025-05-29 16:23:28,322 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 145.058s
2025-05-29 16:23:28,322 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)
---
 .../kernel-module-split.bbclass               | 74 +++++++++++++++----
 1 file changed, 59 insertions(+), 15 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 9487365eb7..843f301f99 100644
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
@@ -101,7 +97,7 @@ python split_kernel_module_packages () {
             bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
         if basename in autoloadlist:
             conf = '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
-            name = '%s%s' % (dvar, conf)
+            name = '%s%s' % (d.getVar('PKGD'), conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
             with open(name, 'w') as f:
                 if autoload:
@@ -114,7 +110,7 @@ python split_kernel_module_packages () {
             d.appendVar('CONFFILES:%s' % pkg, conf2append)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
-                bb.fatal("pkg_postinst:%s not defined" % pkg)
+                postinst = d.getVar('pkg_postinst:modules')
             postinst += d.getVar('autoload_postinst_fragment') % (autoload or basename)
             d.setVar('pkg_postinst:%s' % pkg, postinst)
 
@@ -123,7 +119,7 @@ python split_kernel_module_packages () {
         modconf = d.getVar('module_conf_%s' % basename)
         if modconf and basename in modconflist:
             conf = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
-            name = '%s%s' % (dvar, conf)
+            name = '%s%s' % (d.getVar('PKGD'), conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
             with open(name, 'w') as f:
                 f.write("%s\n" % modconf)
@@ -134,6 +130,54 @@ python split_kernel_module_packages () {
         elif modconf:
             bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
 
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
+    def frob_metadata(file, pkg, pattern, format, basename):
+        vals = extract_modinfo(file)
+        dvar = d.getVar('PKGD')
+
+        handle_conf_files(d, basename, pkg)
+
         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION:' + pkg) or ""
             d.setVar('DESCRIPTION:' + pkg, old_desc + "; " + vals["description"])
@@ -167,19 +211,19 @@ python split_kernel_module_packages () {
     postinst = d.getVar('pkg_postinst:modules')
     postrm = d.getVar('pkg_postrm:modules')
 
+    module_regex = r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
+    module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
+    module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
+    module_pattern = module_pattern_prefix + kernel_package_name + '-module-%s' + module_pattern_suffix
+
     if splitmods != '1':
         d.appendVar('FILES:' + metapkg, '%s %s %s/modules' %
             (d.getVar('modulesloaddir'), d.getVar('modprobedir'), d.getVar("nonarch_base_libdir")))
         d.appendVar('pkg_postinst:%s' % metapkg, postinst)
-        d.prependVar('pkg_postrm:%s' % metapkg, postrm);
+        d.prependVar('pkg_postrm:%s' % metapkg, postrm)
+        generate_conf_files(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern)
         return
 
-    module_regex = r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
-
-    module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
-    module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
-    module_pattern = module_pattern_prefix + kernel_package_name + '-module-%s' + module_pattern_suffix
-
     modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
     if modules:
         d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
-- 
2.43.0


