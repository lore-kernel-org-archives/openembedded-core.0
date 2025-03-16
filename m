Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0977C28B30
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 08:04:19 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.25411.1742112257503993990
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 01:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NH7nU1I/;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff6ae7667dso2104457a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 01:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742112256; x=1742717056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQzwkn0Jz75ppx/NWXQT7j9kvAvYOdNnOpIZFl10bSo=;
        b=NH7nU1I/xsRYqyuEp645wH6Fc1dHbjuz0GSm8MpnVi8+44CG6xsV3RLgLKJUY17asL
         PEU9bK/wuXkObLNHs8fsVicXNYsdk2TMdtGe3myJpXUeCUQqgD/EY9Bl1ZHXhToHT/dT
         xY1BrN0JTizoBo37E5tRBSwz9cBVqHcbNLbvBq/Sd5HdwwfO4q7cq4iI+oUhBp9p+WvW
         66VD0hKo/5kzgtbXpECLEpMsT2AReDItbFv3uMUOSzRdoU8LF6Foj0XJeUzBWrcvR4Yu
         G2rWC8Qtfv3k0H1xd8OnbiYI4HsjlnlWpjwawvjLEm+pTkApSJUBv2Ur5ecLt76om49E
         7pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742112256; x=1742717056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQzwkn0Jz75ppx/NWXQT7j9kvAvYOdNnOpIZFl10bSo=;
        b=FK8NHgWHsN7fMOujYBpFZSQtyjVY7NEIZ1lJ2SLBX/o5YoN8tbquoSoTVqImnEQtMs
         A+X3S+E4BrIOyw1v14lVBT6GP7o0EhSqKVMm9MoUEokzCtCAx0o0ckZWeTePUKwLJHE2
         Vq5pwm5ZtgWEbQMITDFd62luiN03kl9UZ9xxgCPnbi7t8AatfGhuHy1yyRmCq0K88zMr
         GhVwpnrJvz7YvWRlunw1b9vOCUoDVixKn2jtYOEBsPEYsjIhMJ1G7B/rYKPwsApkEh4P
         /D2FjR4+/F2U9fHJOrLCPm+GrtQZDupHGqXFpZXLn7JNfJdL0kHVTENNlq10cZGxpH6p
         wHbA==
X-Gm-Message-State: AOJu0Yzll+BYuhz00WdQ0btbM3X6I205b/775yzdW/X+xMxShEtYKTLF
	jFZGnai82Axgfgv1QkD2111rIv1TYcgPO27iGTUmGAxzq1lewJRWmJ5Fyg==
X-Gm-Gg: ASbGnctN/+vdE5Pmzaa/iJu6aeAG27t2eetCsnGy9WSgmiCZKvDWpC9WKTXqDfyVohC
	B0QgkPKA2HcIJZp+duFnhO9nEVw2lfjaXXVs8Sj4og2LzMWsLEi6jFRhY3+G2QDxO+zRcFYzsK+
	TCb4m8LpPaAsp9BFGziaHoJwb5X2yBDDr/p4JAyiM0gzzGSZ0Pupp05UdGmxMjEb8AtVp6A5jDj
	B3TVV4RpsdO3DF48me4gMyBzs40SfzLeB5o9xysKSb3lzltKIbnyqKA9cxWOzaH+5K/aQX1cnry
	TEfll48hvmo2xWynxwgab5BFx9/B+0+EgBqsEaD3dn4OiX0=
X-Google-Smtp-Source: AGHT+IEswQnvsURO1QB4drJYVcKBwDSmZ7gfgZ0e6mqJhcLPTxcpSObOQiF/sXOmJOoDq//hIHjnPw==
X-Received: by 2002:a17:90b:3b89:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-30151cd7b43mr12377530a91.12.1742112256580;
        Sun, 16 Mar 2025 01:04:16 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c43:3984:9558:7d48:6917:743])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9ca494sm4329486a12.5.2025.03.16.01.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 01:04:16 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>,
	George Thopas <george.thopas@gmail.com>
Subject: [PATCH 1/1] kernel-module-split: fix conf file generation when KERNEL_SPLIT_MODULES=0
Date: Sun, 16 Mar 2025 13:32:50 +0530
Message-ID: <20250316080409.14096-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8IIVTwVir8JCsxE@lists.openembedded.org>
References: <8IIVTwVir8JCsxE@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 08:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212990

When KERNEL_SPLIT_MODULES=0 modprobe and autoload conf files are not getting
generated for the kernel modules.

Separated out conf file handling mechanism as handle_conf_files() function
from hook frob_metadata() function. handle_conf_files() gets re-used from the
existing hook function and add_conf_files function which got introduced for
splitmods=0 flow in this patch.

[YOCTO #15145]

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
Cc: George Thopas <george.thopas@gmail.com>
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


