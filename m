Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D99DC021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 07:11:41 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.42233.1740208298519772177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 23:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nmpBoJS2;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2211cd4463cso57593515ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 23:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740208297; x=1740813097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+I87Gn1qmUCBDq2zpAS7dsW8tNpWwu955S4J4Zc40Zw=;
        b=nmpBoJS2X5ZgyyYNK2R7ggEQGzEKV5502Yjv1D9G8IlX89xY9/cVTgLWLM/F/yYBey
         HV1+Sgzq4pZC5H+FOJDhQlVSXqXpQ4qv6y1YyPI5xsZjPBF2m0xL8x8oykK4DJc0cTtv
         pO+yUTC05KUu8ZeJ+Fj/g+v57lFoWqgovFq4yzxC9eURwrjYQGigZcRCq8EpV4h13iUo
         2l+OSlG4LUmvmbpWB00rqXYRSTJPrqvPA7AXjUErRmIf0KIhTa5Jyd51v8x0UGXqnoed
         tIWx6loI8cCiz4xRkllMIoQjSQQ08fqN1MTeNjKDvBBpM7Ru/jAkGEOd9UXyiWgJMQMH
         1XAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740208297; x=1740813097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+I87Gn1qmUCBDq2zpAS7dsW8tNpWwu955S4J4Zc40Zw=;
        b=UsxwoaVOAeCK2xVN/Z8n4PRHdn8UosF6eBUMc6xoh11aAjQRK4dHvotAforWA9X79I
         ti2b7Fq7jKINedINl2xlsDGq7IJwycXG6E4BYw851FAl4cKJzEOxlbnNBP66t9N9X0HL
         HchjA0bY6qPEskTHyJu9hp+9By3/AydddcBeMWqSDSM79WwAW3bNvUsiwGWvXwoakHBg
         9tfI3G+ol7GPOTgF1Ffu6SJ62UDuqmxYf8DyKJhVV4t/glqRVWQfblEaiDGsEkEq4mgo
         kPTcsMj7H//wUc39uJB+2GQYAX3mHfgyddvKpeJjmfIPsNDDpJmGuGh8LAINMS5wS6Qj
         L7UA==
X-Gm-Message-State: AOJu0YwoVGk6z6pyAQWEGS8CrIh3QvAbKg+yvn2nDe3KWC710eS1rGmA
	+Iuem2A8m3tXmKXjvTaspeXuutJpODtxVYAHVB011/YCK6E9PnX1L9A43w==
X-Gm-Gg: ASbGnctGAQsYSbJ2ahi/tUsfEDXZRUkOzClBfti8XinMY65jkklQqEdvpnAlBW37NG3
	u2LLjDrsV8cXpOoMz8Dc1WyCV1RPLG5oBx3+APZeLA2rD/jYw1cTmCdE7XZwJDJGJCg53aEaj9v
	dvM+M4LfmJ0PETO7pGM7HA9gfmOxA7BwG0skWIExnujCVA6NLW4nuMEU9MBof+v4/isvspVjMYM
	+8DQMn7hVvEJohkMsm5MZmee1Nkd9pvKZd9HKbMBfV8u4esd+NcYVI6FxbwHkF8NTleZy1B3rF+
	YlfGLyQ34BEq4qiuK9cnGGqrklEKZQ==
X-Google-Smtp-Source: AGHT+IE0eDLdiruSowweBErh4ER+IWhyoTM18oYzPm+oWNc+3gYTffeDgWN9C7/w6ICyMSFBp/oqfw==
X-Received: by 2002:a17:903:1cd:b0:220:cd7f:cde8 with SMTP id d9443c01a7336-2219ff6eb4cmr88812395ad.29.1740208297480;
        Fri, 21 Feb 2025 23:11:37 -0800 (PST)
Received: from dixit.. ([2401:4900:1c44:7f2a:dbdf:8458:c305:ec68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556dd64sm148576695ad.189.2025.02.21.23.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 23:11:37 -0800 (PST)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>,
	George Thopas <george.thopas@gmail.com>
Subject: [PATCH] kernel-module-split: fix conf file generation when KERNEL_SPLIT_MODULES=0
Date: Sat, 22 Feb 2025 12:41:12 +0530
Message-ID: <20250222071113.81675-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Feb 2025 07:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211817

When KERNEL_SPLIT_MODULES=0 modprob and autload conf files are not getting
generated for the kernel modules.

Separated out conf file handling mechanism as handle_conf_files() function
from hook frob_metadata() function. handle_conf_files() gets re-used from the
existing hook function and add_conf_files function which got introduced for
splitmods=0 flow in this patch.

[YOCTO #15145]

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
Cc: George Thopas <george.thopas@gmail.com>
---
 .../kernel-module-split.bbclass               | 82 +++++++++++++++----
 1 file changed, 67 insertions(+), 15 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 9487365eb7..2fb3ab967f 100644
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
@@ -134,6 +130,62 @@ python split_kernel_module_packages () {
         elif modconf:
             bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
 
+    def add_conf_files(d, root, file_regex, output_pattern):
+        """
+        Arguments:
+        root           -- the path in which to search
+        file_regex     -- regular expression to match searched files. Use
+                          parentheses () to mark the part of this expression
+                          that should be used to derive the module name (to be
+                          substituted where %s is used in other function
+                          arguments as noted below)
+        output_pattern -- pattern to use for the package names. Must include %s.
+        """
+
+        dvar = d.getVar('PKGD')
+        root = d.expand(root)
+        output_pattern = d.expand(output_pattern)
+
+        # if the root directory doesn't exist, don't error out later but silently do
+        # no splitting.
+        if not os.path.exists(dvar + root):
+            return []
+
+        # get list of modules
+        objs = []
+        for walkroot, dirs, files in os.walk(dvar + root):
+            for file in files:
+                relpath = os.path.join(walkroot, file).replace(dvar + root + '/', '', 1)
+                if relpath:
+                    objs.append(relpath)
+
+        for o in sorted(objs):
+            import re, stat
+            if False:
+                m = re.match(file_regex, o)
+            else:
+                m = re.match(file_regex, os.path.basename(o))
+
+            if not m:
+                continue
+
+            file = os.path.join(dvar + root, o)
+            mode = os.lstat(file).st_mode
+            if not (stat.S_ISREG(mode) or (allow_links and stat.S_ISLNK(mode)) or (allow_dirs and stat.S_ISDIR(mode))):
+                continue
+
+            on = legitimize_package_name(m.group(1))
+            pkg = output_pattern % on
+
+            basename = m.group(1)
+            handle_conf_files(d, basename, pkg)
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
@@ -167,19 +219,19 @@ python split_kernel_module_packages () {
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
+        add_conf_files(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern)
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


