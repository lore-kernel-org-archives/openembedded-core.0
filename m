Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 35D1A7BB8E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:10:37 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id f81so6480813wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=jBPq5nhcrrT/q08mw8hfQSIk/YtbICYU24YjVApkiqc=;
	b=XRA4s6d0dHmy5YLdHi2K4mdlKy/0SFjmRJPo3oph8PYY3+MbftXB/WyWKtIYvog7Qj
	x8OExUNpdvAN9399jwGc8ujtD100qzUjwkd8yv0O2Jkq8kRARm52i8X1FW0xDjyoXxA4
	yWYE5A5W+KskXQKS+F/QT/1RqDuCiLlJCodgABF2/Me2ZoSUOefJSjis7oKB1eXIW8ik
	a0kh7qGQ010VA9C76y5S3uXRX7+pztCK5x/Ynht85aPoGLLAZwtjdS5APrDRHoMdb7lh
	UWrc2WikMkkn7fJnMUt8wI5SSSF9BWkvCDvrfQelb35PNlIDigkpOMtt8rtMe1n2Qt4s
	oyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jBPq5nhcrrT/q08mw8hfQSIk/YtbICYU24YjVApkiqc=;
	b=YAEEDNnjJTYl50p/2u1MUTM0+3HEt+4WyIeEvqdjyCyuFXE0TGeZAiXKzbUs9E7gce
	VD86C8Qf422ssmHJFk7MIHQA8PScfSaDRWOsjfk7zNmGI3tGpi3oBQoJkGwnOlF7Tg+U
	p2x64gPLBfBx/BQKV7MpxRCZF8wqMl75OEBiYnsz1BOJX5YLvqgmgmSSKKK7D0eZL3Z9
	GgI4ZvQV2yzu/r0Bx2rq/E0EzWra6SIqncLaJ4TM6r5nLpeMn4F3BjPxiED6ly1pbQM+
	ZypxvS/SZMEBXNU4uQ8GJN1SemrWPeY4fzu5Dvs0rgqnOpGyvqJN9mW9LqlzhlX8eGQc
	inRg==
X-Gm-Message-State: AA+aEWYWTAY4HwoLMg9DB98Ru8AvXUj9/ezgPhzaXwMx8hNui+dkSPO+
	N/b/Xw3KKhaQcrHZZkJFzhe1jKdpUyM=
X-Google-Smtp-Source: AFSGD/WRj+yZgcaW85uKfzJMvQduDclI0WlDw08UOFU8k+Zt7Hj1riKYull5aSygqV5GGiuh00k73A==
X-Received: by 2002:a1c:df46:: with SMTP id w67mr4037295wmg.51.1544807436972; 
	Fri, 14 Dec 2018 09:10:36 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	129sm6314317wmd.18.2018.12.14.09.10.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 09:10:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 17:10:34 +0000
Message-Id: <20181214171034.1897-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] runqemu: formatting cleanups suggested by PyLint
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2018 17:10:37 -0000

Mostly whitespace fixes but also some r"" strings to clarify regular
expressions.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py | 97 +++++++++++++++++-------------------------
 scripts/runqemu                | 46 ++++++++++----------
 2 files changed, 61 insertions(+), 82 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 92a98e2a8df..f08190efc0d 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -185,7 +185,6 @@ class OpkgIndexer(Indexer):
                      "SDK_PACKAGE_ARCHS",
                     ]
 
-        opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
         else:
@@ -211,8 +210,8 @@ class OpkgIndexer(Indexer):
                 if not os.path.exists(pkgs_file):
                     open(pkgs_file, "w").close()
 
-                index_cmds.add('%s -r %s -p %s -m %s' %
-                               (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
+                index_cmds.add('opkg-make-index -r %s -p %s -m %s' %
+                               (pkgs_file, pkgs_file, pkgs_dir))
 
                 index_sign_files.add(pkgs_file)
 
@@ -271,9 +270,6 @@ class DpkgIndexer(Indexer):
         all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").split()
         arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in arch_list)
 
-        apt_ftparchive = bb.utils.which(os.getenv('PATH'), "apt-ftparchive")
-        gzip = bb.utils.which(os.getenv('PATH'), "gzip")
-
         index_cmds = []
         deb_dirs_found = False
         for arch in arch_list:
@@ -281,14 +277,13 @@ class DpkgIndexer(Indexer):
             if not os.path.isdir(arch_dir):
                 continue
 
-            cmd = "cd %s; PSEUDO_UNLOAD=1 %s packages . > Packages;" % (arch_dir, apt_ftparchive)
-
-            cmd += "%s -fcn Packages > Packages.gz;" % gzip
+            cmd = "cd %s; PSEUDO_UNLOAD=1 apt-ftparchive packages . > Packages;" % (arch_dir)
+            cmd += "gzip -fcn Packages > Packages.gz;"
 
             with open(os.path.join(arch_dir, "Release"), "w+") as release:
                 release.write("Label: %s\n" % arch)
 
-            cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
+            cmd += "PSEUDO_UNLOAD=1 apt-ftparchive release . >> Release"
 
             index_cmds.append(cmd)
 
@@ -321,12 +316,11 @@ class OpkgPkgsList(PkgsList):
     def __init__(self, d, rootfs_dir, config_file):
         super(OpkgPkgsList, self).__init__(d, rootfs_dir)
 
-        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
         self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
         self.opkg_args += self.d.getVar("OPKG_ARGS")
 
     def list_pkgs(self, format=None):
-        cmd = "%s %s status" % (self.opkg_cmd, self.opkg_args)
+        cmd = "opkg %s status" % (self.opkg_args)
 
         # opkg returns success even when it printed some
         # "Collected errors:" report to stderr. Mixing stderr into
@@ -347,7 +341,7 @@ class OpkgPkgsList(PkgsList):
 class DpkgPkgsList(PkgsList):
 
     def list_pkgs(self):
-        cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
+        cmd = ["dpkg-query",
                "--admindir=%s/var/lib/dpkg" % self.rootfs_dir,
                "-W"]
 
@@ -783,8 +777,7 @@ class RpmPM(PackageManager):
             signer = get_signer(self.d, self.d.getVar('RPM_GPG_BACKEND'))
             pubkey_path = oe.path.join(self.d.getVar('B'), 'rpm-key')
             signer.export_pubkey(pubkey_path, self.d.getVar('RPM_GPG_NAME'))
-            rpm_bin = bb.utils.which(os.getenv('PATH'), "rpmkeys")
-            cmd = [rpm_bin, '--root=%s' % self.target_rootfs, '--import', pubkey_path]
+            cmd = ['rpmkeys', '--root=%s' % self.target_rootfs, '--import', pubkey_path]
             try:
                 subprocess.check_output(cmd, stderr=subprocess.STDOUT)
             except subprocess.CalledProcessError as e:
@@ -874,8 +867,7 @@ class RpmPM(PackageManager):
         if with_dependencies:
             self._invoke_dnf(["remove"] + pkgs)
         else:
-            cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-            args = ["-e", "-v", "--nodeps", "--root=%s" %self.target_rootfs]
+            args = ["rpm", "-e", "-v", "--nodeps", "--root=%s" %self.target_rootfs]
 
             try:
                 bb.note("Running %s" % ' '.join([cmd] + args + pkgs))
@@ -960,8 +952,8 @@ class RpmPM(PackageManager):
     def _invoke_dnf(self, dnf_args, fatal=True, print_output=True):
         os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
 
-        dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
-        standard_dnf_args = ["-v", "--rpmverbosity=debug", "-y",
+        standard_dnf_args = ["dnf",
+                             "-v", "--rpmverbosity=debug", "-y",
                              "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
                              "--setopt=reposdir=%s" % (oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
                              "--installroot=%s" % (self.target_rootfs),
@@ -969,7 +961,7 @@ class RpmPM(PackageManager):
                             ]
         if hasattr(self, "rpm_repo_dir"):
             standard_dnf_args.append("--repofrompath=oe-repo,%s" % (self.rpm_repo_dir))
-        cmd = [dnf_cmd] + standard_dnf_args + dnf_args
+        cmd = standard_dnf_args + dnf_args
         bb.note('Running %s' % ' '.join(cmd))
         try:
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
@@ -1005,14 +997,13 @@ class RpmPM(PackageManager):
 
     def save_rpmpostinst(self, pkg):
         bb.note("Saving postinstall script of %s" % (pkg))
-        cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-        args = ["-q", "--root=%s" % self.target_rootfs, "--queryformat", "%{postin}", pkg]
+        args = ["rpm", "-q", "--root=%s" % self.target_rootfs, "--queryformat", "%{postin}", pkg]
 
         try:
-            output = subprocess.check_output([cmd] + args, stderr=subprocess.STDOUT).decode("utf-8")
+            output = subprocess.check_output(args, stderr=subprocess.STDOUT).decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Could not invoke rpm. Command "
-                     "'%s' returned %d:\n%s" % (' '.join([cmd] + args), e.returncode, e.output.decode("utf-8")))
+                     "'%s' returned %d:\n%s" % (' '.join(args), e.returncode, e.output.decode("utf-8")))
 
         # may need to prepend #!/bin/sh to output
 
@@ -1038,9 +1029,6 @@ class RpmPM(PackageManager):
             bb.fatal("dnf could not find package %s in repository: %s" %(pkg, output))
         pkg_path = oe.path.join(self.rpm_repo_dir, pkg_name)
 
-        cpio_cmd = bb.utils.which(os.getenv("PATH"), "cpio")
-        rpm2cpio_cmd = bb.utils.which(os.getenv("PATH"), "rpm2cpio")
-
         if not os.path.isfile(pkg_path):
             bb.fatal("Unable to extract package for '%s'."
                      "File %s doesn't exists" % (pkg, pkg_path))
@@ -1050,7 +1038,7 @@ class RpmPM(PackageManager):
         os.chdir(tmp_dir)
 
         try:
-            cmd = "%s %s | %s -idmv" % (rpm2cpio_cmd, pkg_path, cpio_cmd)
+            cmd = "rpm2cpio %s | cpio -idmv" % (pkg_path)
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
             bb.utils.remove(tmp_dir, recurse=True)
@@ -1097,10 +1085,7 @@ class OpkgDpkgPM(PackageManager):
         This method extracts the common parts for Opkg and Dpkg
         """
 
-        ar_cmd = bb.utils.which(os.getenv("PATH"), "ar")
-        tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
         pkg_path = pkg_info[pkg]["filepath"]
-
         if not os.path.isfile(pkg_path):
             bb.fatal("Unable to extract package for '%s'."
                      "File %s doesn't exists" % (pkg, pkg_path))
@@ -1114,10 +1099,10 @@ class OpkgDpkgPM(PackageManager):
             data_tar = 'data.tar.gz'
 
         try:
-            cmd = [ar_cmd, 'x', pkg_path]
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-            cmd = [tar_cmd, 'xf', data_tar]
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            cmd = ['ar', 'x', pkg_path]
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            cmd = ['tar', 'xf', data_tar]
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.utils.remove(tmp_dir, recurse=True)
             bb.fatal("Unable to extract %s package. Command '%s' "
@@ -1147,7 +1132,6 @@ class OpkgPM(OpkgDpkgPM):
 
         self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), ipk_repo_workdir)
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
-        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
         self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/'), target_rootfs)
         self.opkg_args += self.d.getVar("OPKG_ARGS")
 
@@ -1308,7 +1292,7 @@ class OpkgPM(OpkgDpkgPM):
     def update(self):
         self.deploy_dir_lock()
 
-        cmd = "%s %s update" % (self.opkg_cmd, self.opkg_args)
+        cmd = "opkg %s update" % (self.opkg_args)
 
         try:
             subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
@@ -1323,7 +1307,7 @@ class OpkgPM(OpkgDpkgPM):
         if not pkgs:
             return
 
-        cmd = "%s %s" % (self.opkg_cmd, self.opkg_args)
+        cmd = "opkg %s" % (self.opkg_args)
         for exclude in (self.d.getVar("PACKAGE_EXCLUDE") or "").split():
             cmd += " --add-exclude %s" % exclude
         cmd += " install "
@@ -1358,11 +1342,11 @@ class OpkgPM(OpkgDpkgPM):
             return
 
         if with_dependencies:
-            cmd = "%s %s --force-remove --force-removal-of-dependent-packages remove %s" % \
-                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
+            cmd = "opkg %s --force-remove --force-removal-of-dependent-packages remove %s" % \
+                (self.opkg_args, ' '.join(pkgs))
         else:
-            cmd = "%s %s --force-depends remove %s" % \
-                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
+            cmd = "opkg %s --force-depends remove %s" % \
+                (self.opkg_args, ' '.join(pkgs))
 
         try:
             bb.note(cmd)
@@ -1406,7 +1390,7 @@ class OpkgPM(OpkgDpkgPM):
         if os.path.exists(status_file):
             return
 
-        cmd = "%s %s info " % (self.opkg_cmd, self.opkg_args)
+        cmd = "opkg %s info " % (self.opkg_args)
 
         with open(status_file, "w+") as status:
             for pkg in bad_recommendations.split():
@@ -1451,7 +1435,7 @@ class OpkgPM(OpkgDpkgPM):
         opkg_args = "-f %s -o %s " % (self.config_file, temp_rootfs)
         opkg_args += self.d.getVar("OPKG_ARGS")
 
-        cmd = "%s %s update" % (self.opkg_cmd, opkg_args)
+        cmd = "opkg %s update" % (opkg_args)
         try:
             subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
@@ -1459,9 +1443,7 @@ class OpkgPM(OpkgDpkgPM):
                      "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
         # Dummy installation
-        cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
-                                                opkg_args,
-                                                ' '.join(pkgs))
+        cmd = "opkg %s --noaction install %s " % (opkg_args, ' '.join(pkgs))
         try:
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
@@ -1495,7 +1477,7 @@ class OpkgPM(OpkgDpkgPM):
         """
         Returns a dictionary with the package info.
         """
-        cmd = "%s %s info %s" % (self.opkg_cmd, self.opkg_args, pkg)
+        cmd = "opkg %s info %s" % (self.opkg_args, pkg)
         pkg_info = super(OpkgPM, self).package_info(pkg, cmd)
 
         pkg_arch = pkg_info[pkg]["arch"]
@@ -1533,8 +1515,6 @@ class DpkgPM(OpkgDpkgPM):
         else:
             self.apt_conf_dir = apt_conf_dir
         self.apt_conf_file = os.path.join(self.apt_conf_dir, "apt.conf")
-        self.apt_get_cmd = bb.utils.which(os.getenv('PATH'), "apt-get")
-        self.apt_cache_cmd = bb.utils.which(os.getenv('PATH'), "apt-cache")
 
         self.apt_args = d.getVar("APT_ARGS")
 
@@ -1624,7 +1604,7 @@ class DpkgPM(OpkgDpkgPM):
 
         self.deploy_dir_lock()
 
-        cmd = "%s update" % self.apt_get_cmd
+        cmd = "apt-get update"
 
         try:
             subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
@@ -1640,8 +1620,8 @@ class DpkgPM(OpkgDpkgPM):
 
         os.environ['APT_CONFIG'] = self.apt_conf_file
 
-        cmd = "%s %s install --force-yes --allow-unauthenticated %s" % \
-              (self.apt_get_cmd, self.apt_args, ' '.join(pkgs))
+        cmd = "apt-get %s install --force-yes --allow-unauthenticated %s" % \
+              (self.apt_args, ' '.join(pkgs))
 
         try:
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
@@ -1672,12 +1652,11 @@ class DpkgPM(OpkgDpkgPM):
 
         if with_dependencies:
             os.environ['APT_CONFIG'] = self.apt_conf_file
-            cmd = "%s purge %s" % (self.apt_get_cmd, ' '.join(pkgs))
+            cmd = "apt-get purge %s" % (' '.join(pkgs))
         else:
-            cmd = "%s --admindir=%s/var/lib/dpkg --instdir=%s" \
+            cmd = "dpkg --admindir=%s/var/lib/dpkg --instdir=%s" \
                   " -P --force-depends %s" % \
-                  (bb.utils.which(os.getenv('PATH'), "dpkg"),
-                   self.target_rootfs, self.target_rootfs, ' '.join(pkgs))
+                  (self.target_rootfs, self.target_rootfs, ' '.join(pkgs))
 
         try:
             subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
@@ -1809,7 +1788,7 @@ class DpkgPM(OpkgDpkgPM):
     def fix_broken_dependencies(self):
         os.environ['APT_CONFIG'] = self.apt_conf_file
 
-        cmd = "%s %s -f install" % (self.apt_get_cmd, self.apt_args)
+        cmd = "apt-get %s -f install" % (self.apt_args)
 
         try:
             subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
@@ -1824,7 +1803,7 @@ class DpkgPM(OpkgDpkgPM):
         """
         Returns a dictionary with the package info.
         """
-        cmd = "%s show %s" % (self.apt_cache_cmd, pkg)
+        cmd = "apt-cache show %s" % (pkg)
         pkg_info = super(DpkgPM, self).package_info(pkg, cmd)
 
         pkg_arch = pkg_info[pkg]["pkgarch"]
diff --git a/scripts/runqemu b/scripts/runqemu
index c4a0ca811d9..9beb7b00fc0 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -127,7 +127,7 @@ def check_libgl(qemu_bin):
             ('/usr/lib/*-linux-gnu/libGL.so', '/usr/lib/*-linux-gnu/libGLU.so'))
 
         for (f1, f2) in check_files:
-            if re.search('\*', f1):
+            if re.search(r'\*', f1):
                 for g1 in glob.glob(f1):
                     if libgl:
                         break
@@ -179,12 +179,12 @@ class BaseConfig(object):
         # Supported env vars, add it here if a var can be got from env,
         # and don't use os.getenv in the code.
         self.env_vars = ('MACHINE',
-                        'ROOTFS',
-                        'KERNEL',
-                        'DEVICE_TREE',
-                        'DEPLOY_DIR_IMAGE',
-                        'OE_TMPDIR',
-                        'OECORE_NATIVE_SYSROOT',
+                         'ROOTFS',
+                         'KERNEL',
+                         'DEVICE_TREE',
+                         'DEPLOY_DIR_IMAGE',
+                         'OE_TMPDIR',
+                         'OECORE_NATIVE_SYSROOT',
                         )
 
         self.qemu_opt = ''
@@ -329,10 +329,10 @@ class BaseConfig(object):
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
             self.qbconfload = True
-        elif re.search('\.bin$', p) or re.search('bzImage', p) or \
+        elif re.search(r'\.bin$', p) or re.search('bzImage', p) or \
              re.search('zImage', p) or re.search('vmlinux', p) or \
              re.search('fitImage', p) or re.search('uImage', p):
-            self.kernel =  p
+            self.kernel = p
         elif os.path.exists(p) and (not os.path.isdir(p)) and '-image-' in os.path.basename(p):
             self.rootfs = p
             # Check filename against self.fstypes can hanlde <file>.cpio.gz,
@@ -343,13 +343,13 @@ class BaseConfig(object):
                     fst = t
                     break
             if not fst:
-                m = re.search('.*\.(.*)$', self.rootfs)
+                m = re.search(r'.*\.(.*)$', self.rootfs)
                 if m:
-                    fst =  m.group(1)
+                    fst = m.group(1)
             if fst:
                 self.check_arg_fstype(fst)
-                qb = re.sub('\.' + fst + "$", '', self.rootfs)
-                qb = '%s%s' % (re.sub('\.rootfs$', '', qb), '.qemuboot.conf')
+                qb = re.sub(r'\.' + fst + "$", '', self.rootfs)
+                qb = '%s%s' % (re.sub(r'\.rootfs$', '', qb), '.qemuboot.conf')
                 if os.path.exists(qb):
                     self.qemuboot = qb
                     self.qbconfload = True
@@ -538,9 +538,9 @@ class BaseConfig(object):
                 raise RunQemuError(yocto_paravirt_kvm_wiki)
 
         if not os.access(dev_kvm, os.W_OK|os.R_OK):
-                logger.error("You have no read or write permission on /dev/vhost-net.")
-                logger.error("Please change the ownership of this file as described at:")
-                raise RunQemuError(yocto_kvm_wiki)
+            logger.error("You have no read or write permission on /dev/vhost-net.")
+            logger.error("Please change the ownership of this file as described at:")
+            raise RunQemuError(yocto_kvm_wiki)
 
     def check_fstype(self):
         """Check and setup FSTYPE"""
@@ -569,8 +569,8 @@ class BaseConfig(object):
         if self.rootfs and not os.path.exists(self.rootfs):
             # Lazy rootfs
             self.rootfs = "%s/%s-%s.%s" % (self.get('DEPLOY_DIR_IMAGE'),
-                    self.rootfs, self.get('MACHINE'),
-                    self.fstype)
+                                           self.rootfs, self.get('MACHINE'),
+                                           self.fstype)
         elif not self.rootfs:
             cmd_name = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_NAME'), self.fstype)
             cmd_link = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_LINK_NAME'), self.fstype)
@@ -826,7 +826,7 @@ class BaseConfig(object):
                 print('DTB: [%s]' % self.dtb)
         print('MACHINE: [%s]' % self.get('MACHINE'))
         print('FSTYPE: [%s]' % self.fstype)
-        if self.fstype  == 'nfs':
+        if self.fstype == 'nfs':
             print('NFS_DIR: [%s]' % self.rootfs)
         else:
             print('ROOTFS: [%s]' % self.rootfs)
@@ -844,7 +844,7 @@ class BaseConfig(object):
 
         # Figure out a new nfs_instance to allow multiple qemus running.
         ps = subprocess.check_output(("ps", "auxww")).decode('utf-8')
-        pattern = '/bin/unfsd .* -i .*\.pid -e .*/exports([0-9]+) '
+        pattern = r'/bin/unfsd .* -i .*\.pid -e .*/exports([0-9]+) '
         all_instances = re.findall(pattern, ps, re.M)
         if all_instances:
             all_instances.sort(key=int)
@@ -863,7 +863,7 @@ class BaseConfig(object):
             # Use '%s' since they are integers
             os.putenv(k, '%s' % v)
 
-        self.unfs_opts="nfsvers=3,port=%s,udp,mountport=%s" % (nfsd_port, mountd_port)
+        self.unfs_opts = "nfsvers=3,port=%s,udp,mountport=%s" % (nfsd_port, mountd_port)
 
         # Extract .tar.bz2 or .tar.bz if no nfs dir
         if not (self.rootfs and os.path.isdir(self.rootfs)):
@@ -1160,8 +1160,8 @@ class BaseConfig(object):
         self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
         for ovmf in self.ovmf_bios:
-            format = ovmf.rsplit('.', 1)[-1]
-            self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
+            fmt = ovmf.rsplit('.', 1)[-1]
+            self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (fmt, ovmf)
         if self.ovmf_bios:
             # OVMF only supports normal VGA, i.e. we need to override a -vga vmware
             # that gets added for example for normal qemux86.
-- 
2.11.0


