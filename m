Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8335C282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 08:11:49 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.25430.1742112706253002966
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 01:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VH/FPWJ3;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2235189adaeso57649515ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 01:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742112705; x=1742717505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsCPWZ8tfLJiqYkFmHglT5kMJVj1XIxvQke83h1C4wc=;
        b=VH/FPWJ3HpP34Eyy8Tb0wi0DxUYJbkNKhlHHD3jYPvA/JG/aOZC0P16VNyimjTLg1g
         lyXVYkxzp/HDiEtK/+yd0la15FQKyoVW9/u5v2pHq4ixMnAn/XHvp1M9lzXqhNj2PQSF
         xzpu0hfz5RblSS/VBIC9v5Sv9LYtgkNpnkUCXjAYdRfJfCfE54kXaicxmpbUsA/lwhPU
         Lq+MA6M1uKKuZKkL4xZTKfKsbGFK6ZKmS9hyMfuHzPmYGmgpbF3p5lexWiqYBPA3XOGC
         oRZHUXrq+PitAqLx0pgjIsCZJ4CncZqWpEOBCsOBM2F8z3Fieh5ADxwMkLaMpTdERRI3
         5FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742112705; x=1742717505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsCPWZ8tfLJiqYkFmHglT5kMJVj1XIxvQke83h1C4wc=;
        b=GqiDV7lFdZwuzpWxU2ESkoVerNz6B/Yg4KjgfLAfLQZuvUTdxwmQ/8nVw697vOxhm8
         F5gRsX8gRDGn1Acz+0QSJ9Q4sHXrmcgHgwsVGlL2Omc3rXaV1n7MaK2wP190EH5IQATZ
         RfQ+j1BFlu2Ewk/5j33QeSKo+HIkvpBXGuTfIBtel0Feb7OAtd1jNXIZZ9qxPS6wwglD
         Sq9WLYrEqRgphxCbZ3ThVkUL/KGUyN8lRt4M2KVHJAgFwjx2LMBP5kDxj/dMnbzU1BjC
         6CHExyrcw3t+j4TRny8ySLpmbG229FgwKn8i/gbC7r5gLinZ6/ED2XMiNj6qKUYGwG2C
         KmnQ==
X-Gm-Message-State: AOJu0YyLOYfoAhngMMsQfxpN+J7SztYxbVKOadk8ysGTrkGDGqeNTRHv
	f9qWuUbrCNeM5cYgfmh/fb+ey+wgqoBOfwtvXBc5YNZBcwSjkhK32zT27A==
X-Gm-Gg: ASbGncskmHgLXFXz7+XhsUKJYFHgDPMEUs8FktMIGnZNd3GccMYQjjY4gApXKGhAERL
	+d9aqz+Y4WU3tbbyLhRMZvV6BhWiA+Y3hpBM3ihkCn2/+ZmXwRsZ8ZOb0XtZYQym2jHZqFTDxYk
	RVjPLk4KqXgujE+pAyNKLZ6EMsAgXsrltLMXZXDocrvOWnsk3qgdi8zSH+HP0k/PKXNwklYQ9+1
	tO/HPxba+k3ffEZMJFjBiiPydAFL7LM32HyPyoq0CK4SQQdnFVmgW1SGLoTaFctI/wlRaHNeCNi
	/84YupQbCyBrGrwZgMXz+OH3IHC1hKlISrzXxg9geFoRANk=
X-Google-Smtp-Source: AGHT+IGz0pe/NavEAEcwOjcPND7BfgdSpe9HelakFISZ4VyaZMPOTukEKi/WcZeVOp40dtGbVjhoXw==
X-Received: by 2002:a17:902:e884:b0:215:9eac:1857 with SMTP id d9443c01a7336-225c64f7f0bmr147752755ad.5.1742112705327;
        Sun, 16 Mar 2025 01:11:45 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c43:3984:9558:7d48:6917:743])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a7447sm54173155ad.74.2025.03.16.01.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 01:11:44 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>,
	George Thopas <george.thopas@gmail.com>
Subject: [PATCH 1/1] kernel-module-split: fix conf file generation when KERNEL_SPLIT_MODULES=0
Date: Sun, 16 Mar 2025 13:40:50 +0530
Message-ID: <20250316081137.14191-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Z8IIVTwVir8JCsxE@lists.openembedded.org>
References: <Z8IIVTwVir8JCsxE@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 08:11:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212992

When KERNEL_SPLIT_MODULES=0 modprobe and autoload conf files are not getting
generated for the kernel modules.

Separated out conf file handling mechanism as handle_conf_files() function
from hook frob_metadata() function. handle_conf_files() gets re-used from the
existing hook function and add_conf_files function which got introduced for
splitmods=0 flow in this patch.

[YOCTO #15145]

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
Cc: George Thopas <george.thopas@gmail.com>
--
Can you show the conf files for the same kernel configuration
with and without the kernel_split_modules enabled ? That way
we know there's no change in existing behaviour.
> I have confirmed that in my testing. Can you suggest how I can
share that information here?

We also should make a test for this in the OE selftests. We
are adding conditional code paths, so they should be tested
to ensure no regressions in either in the future.
> Never done that before. May be I can do it given some direction 
as separate patch.

I'm curious about the above line. It is unclear to me why we'd
only have this postinst be relevant if none was previously set.
> Reverted.

Is there really a scenario where the directory won't exist ? Isn't
this just running in our own install phase ? So all prerequisites
and directories should be in place.
> Ideally no, we kept it for safer side, I have added log warning.

The walking and sorting seems quite heavy.  Isn't this called from do_split_packages indirectly ?
Do we really need to walk and gather the information ? Is this mainly for the case of no-split
on the kernel modules ? If that is the case, isn't there a way to short circuit the processing
on the split-package case ?
> Litterally I could not think of anything else here and not sure of there
are any short-circuit options. I have limited knowledge in this. I am open to suggestions
if this is not the best solution at the moment.
---
 .../kernel-module-split.bbclass               | 81 +++++++++++++++----
 1 file changed, 67 insertions(+), 14 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 9487365eb7..b7ee3a8f9e 100644
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
@@ -123,7 +119,7 @@ python split_kernel_module_packages () {
         modconf = d.getVar('module_conf_%s' % basename)
         if modconf and basename in modconflist:
             conf = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
-            name = '%s%s' % (dvar, conf)
+            name = '%s%s' % (d.getVar('PKGD'), conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
             with open(name, 'w') as f:
                 f.write("%s\n" % modconf)
@@ -134,6 +130,63 @@ python split_kernel_module_packages () {
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
+        # check if the root directory doesn't exist for safe side, don't error out later but silently do
+        # no splitting.
+        if not os.path.exists(dvar + root):
+            bb.warn("kernel module root directory path does not exist")
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
@@ -167,19 +220,19 @@ python split_kernel_module_packages () {
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


