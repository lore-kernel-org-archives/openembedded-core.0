Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D276C282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 08:24:20 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.25535.1742113455755447502
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 01:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BLYICwh5;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2260c915749so1319185ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 01:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742113455; x=1742718255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQzwkn0Jz75ppx/NWXQT7j9kvAvYOdNnOpIZFl10bSo=;
        b=BLYICwh5DdCZcKdDlRwF/wOsFfINC9Vq7zCtEN6bP+51QiKDen5hULzy8YU+M+MAN2
         1qcNpJuIcr+lbfG2uvua+Aaw70EGVrUUwy0D2ygL1YQr8WkRdfCOWj5XIAj7MbrJWvYU
         7xQayIXNl1jdv3DFnjAPlX347WNFDf3HcWcUsQnhf4W9M9P0kjGbSqQexeDyqkIfP8Qg
         drtt999IFf94RiWkM6egaJXmJNw8Ycduv80ue0LZp/mfnyr6HVPCCv4uCLnu2w3AcgSm
         wwdWcqdOvZDfuQcDYN6RDGDebfPraLsOaYoCradR7r8cLoXHjUCTe3Yh+rBB3kPltX+M
         XZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742113455; x=1742718255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQzwkn0Jz75ppx/NWXQT7j9kvAvYOdNnOpIZFl10bSo=;
        b=pXQGkoPQM9aiQoQf69eBx8qh56TxeEWxgkN5MOttmvEn4FvY3C0xyhfkDOwi7EKLuu
         sRr34ELwrhHnkboky6de+DOqN7oXrjXI+bBDFeBrTcLnKF0s3sin8/A7z4BdD3M3vjUj
         TeVuapJl3M1wk8A8BPk4TMWBW2gDxrgphj+WZlXCf6gCpkril5a+15Sbf6YR6mtYa0Nb
         LNareUId15wvqCXS/0P2iTZXy1LL+MKHQKUhUQ2Tt6/jdjpC6+iQex2ZkZ9EmxcMaAqk
         Uh7fcKLlOuFtbkb4CFkhtwxbU0QNBHls3S1eNQPvbkMcRVOimbA2/D/o/bZIebuZKCeO
         IAYw==
X-Gm-Message-State: AOJu0Yz3c6WAlrk6IJELjFP775p6neyqPDmIuSFS022TpfJ7WnUGkkqy
	QPBrba5GLIHpVifv1530I/Bw64iltOMyyfnDs0vARp0Pe/FAQk5Oe2Lo0A==
X-Gm-Gg: ASbGnctTcVtlIvQzsiwgLnO2VcM53tGnbc4T12Aap+aWctxD5iHB/Zpxc2/9PO8JuSA
	0qD2M3q5wJb1zJg0dxXnC2sk5JmzqTX37Sj6CP6le3+iKCUGPv787huTbFYunV+w5+6l5ddz4Bo
	3rnwSfE70Y0dRv1Bd3fozdByEM4qnoZV/jPATNGYJx3gOuxARNDKLWgTMIwB/uxZ1I/gubhcnhO
	jmKvSlsTZFR63G3/4jXSWS/l0Yo5djN71TBSwojFCPsTuuE1/0g4+kNoeUH7HJDyF1aatgk5f2k
	x9bAP366vt2FTsyWZXkvF9zr0mtRrL7djSGYHsDpsMg9rcc=
X-Google-Smtp-Source: AGHT+IHrdEgCKjScrK238in1O1D5NwNxHyUexKanNy1rPzUYCB8tHjlUeH0g5x7kxjmXZZ1/AKcIEg==
X-Received: by 2002:a17:903:18e:b0:224:3c6:7865 with SMTP id d9443c01a7336-225e0a529bcmr83481365ad.3.1742113454828;
        Sun, 16 Mar 2025 01:24:14 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c43:3984:9558:7d48:6917:743])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a407asm54732945ad.62.2025.03.16.01.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 01:24:14 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>,
	George Thopas <george.thopas@gmail.com>
Subject: [PATCH V2] kernel-module-split: fix conf file generation when KERNEL_SPLIT_MODULES=0
Date: Sun, 16 Mar 2025 13:52:41 +0530
Message-ID: <20250316082407.14359-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250222071113.81675-1-dixitparmar19@gmail.com>
References: <20250222071113.81675-1-dixitparmar19@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 08:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212995

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


