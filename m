Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AD5C28B2F
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 07:50:19 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.25313.1742111413762436997
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 00:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VPA3rOeF;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff797f8f1bso1340280a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 00:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742111413; x=1742716213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DQzwkn0Jz75ppx/NWXQT7j9kvAvYOdNnOpIZFl10bSo=;
        b=VPA3rOeFliTltPoKwWMD1fbapAZZeiRAQ+aJnHFAlqn8Ay9DoEkTzJrUH9XZurWevt
         cLNzYUAzW9IlC36r5o4HEwJ4Nl8rlItWvVAh64PdFf0wXeZejjpGCdQRNdJDAQXKuJpM
         BEyYTjtE1ubKiL/ZSC3WV1S3HJgjVVfyvzkARd8l4Wy2Qi1oN+6K29uOuImTHRx/lzC2
         /9BJYwf84izs1aJ+SoFpYYbKbAXuHPt5zDxV1TDJKI8pm27b6VurW58ZLYRvNgttwetH
         wESXauRl+tx3Oqbjx06cDyCx3bgw0IOznfuz+LYLMLGzuX7nfPuHYoNAp3SlmD4yyIZO
         cUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742111413; x=1742716213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQzwkn0Jz75ppx/NWXQT7j9kvAvYOdNnOpIZFl10bSo=;
        b=hPB/Bwsyr4+GsBSWtlimbG9Znb57N5xSo/hWqL0eZB3j2wjvKbOwgr59MSze3YSFu5
         Ax2qyA7CT2kE1uDuvrEwcumKnOsGbJZjnfH4dKvIOKay5PMBPUYJLcgRH6QJJOEVDumF
         gVQdDahaMMpvq1v0lHFpz+mRe8KC3daD/HC6GMGhrWNYyQuo+mtCmEc2wffhJ47BqTFN
         2gGlpkSXIlZ5MLODyMAyLq6oFoURMX6cjihf8Teu5cmIMVZiW/9IwUURJzjB7LbC2nOb
         2c8DfcFeTN9Wx4QRnaFM6ENIrK6xeoxAbRDLk7croH70IJDKliaHdZkuEaIPgEURNZHL
         DOGA==
X-Gm-Message-State: AOJu0YzEOYW+IlO4izqZ6KpkmsoHdGjHTsm1x2TE+2tPuQbobiRefAka
	oOY9tom+mecLIzzkQwAf2VLivM7Q63vswGCoISg6bDVcBBDoxPhKuYYH7w==
X-Gm-Gg: ASbGnctDZEDXrCHAYthcQw6lb3/FLkiExF5ifYvbAL5s1iFtc0H2fnI7/4Oc0y1mROd
	o8OMbm9Ez+1zHjCRstUg73g+QXlY/utvOtbFixAVfNOy9gHLdUMJL4Ekq4Kr4p+11lNtamRmeGV
	RgARDkzx+3oSIY/ySC2pgug1tui97PNoaRcRQaL/fIoZ+l7dBOw18tnURih/IFtoAksdbSeouWx
	AX2m8TNqovhR78Ak+VCSskBR7CWENGOpYmVx6SvPIB5f1l/m3FVadw0DfNkGfceHFqVpLz78Nii
	MlmbaHjGPalaYKneP4md4ybKutJwC2XA+JfiA7gRdnxg1Eo=
X-Google-Smtp-Source: AGHT+IHA5s6BqUrLT2VJlHBiZXOMtYZCtq+W7cijcxl+XQ/cbjW1CYGu9DRd0UD4ZCjXeFkds+KYbA==
X-Received: by 2002:a17:90a:e70b:b0:2fe:8f9f:e5f0 with SMTP id 98e67ed59e1d1-30151d00247mr9578387a91.19.1742111412783;
        Sun, 16 Mar 2025 00:50:12 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c43:3984:9558:7d48:6917:743])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afed64sm4269197a91.27.2025.03.16.00.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 00:50:12 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>,
	George Thopas <george.thopas@gmail.com>
Subject: [PATCH 1/1] kernel-module-split: fix conf file generation when KERNEL_SPLIT_MODULES=0
Date: Sun, 16 Mar 2025 13:20:04 +0530
Message-ID: <20250316075004.13958-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 07:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212989

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


