Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.5461.1627481712935749238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 07:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=STmrWCIs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id k4so1524075wms.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QkABHTXY0Z00Yjf8KXSvT92JYfdyzCCNIPRCKcht9o0=;
        b=STmrWCIs79XcPsdB9OBba497DWWIS2WfsmLpsX38RDXC2heKLVWxha6paq7P1+8Uvk
         ns/HCL7i6FMONNfxDDEeGhR9SjhBD82DRPNXDefqOxg3UjbCfUjtldlbFuYoY7tsMZVm
         CkKAGqZV9v1EGbNv2okZD3Ro3sV78DrElkdBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QkABHTXY0Z00Yjf8KXSvT92JYfdyzCCNIPRCKcht9o0=;
        b=nMHUi0bcI85kTt3gMeURir+8zc/zWhUoO7YmsknOZ7kL57v52ofw/CjJtUBlibrR1/
         //1QvwKyr2m8V7HomA+nCXqyqD1NX3lrMpygVHJ2XcA7dA3B14v4h8rX8nSE87MYQZyH
         Q9RsS/5MFlwDcMM+eMdtQQmKLzMO5hQfnN2VD5YNQfOZauwBQkQFYGSbAthwa9zW1GSs
         Ok4yvroVrwYvGK1d4U68cgJsIuflUOoe2JWF9wlJIZqoWmSBOX/cJMgZujDayYhzHX+9
         8/JCPpy5BJaLiYcjdwn5DsQ7X9jmOZwhg9onrQPIjrx6TXlLtkcHUtFyuFKkIRPXrmsG
         RZyQ==
X-Gm-Message-State: AOAM531elPhd0wGy0C0Zu9xSupom+eog9Wf8Wibn8Mj98lA3H/9B3y+v
	IIlCcLDQ7KmtPqhBswS4fCvPmdpgrzLe+w==
X-Google-Smtp-Source: ABdhPJxwSm5ANZDzLd8X/34xiQ5M2y8GvZs0muyZzu5PTPIWGVJ3aIW48DSHwzdv0k2h8xqAD2lT6w==
X-Received: by 2002:a05:600c:1c09:: with SMTP id j9mr4571546wms.183.1627481711060;
        Wed, 28 Jul 2021 07:15:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:824:a750:d1fb:a5cc])
        by smtp.gmail.com with ESMTPSA id v6sm5691514wru.50.2021.07.28.07.15.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 07:15:10 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] meta: Manual override fixes
Date: Wed, 28 Jul 2021 15:15:06 +0100
Message-Id: <20210728141506.3287158-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210728141506.3287158-1-richard.purdie@linuxfoundation.org>
References: <20210728141506.3287158-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The automated conversion of OE-Core to use the new override sytax isn't
perfect. This patches some mis-converted lines and some lines which were missed
by the automation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass                      |  2 +-
 meta/classes/kernel-grub.bbclass                 |  8 ++++----
 meta/classes/native.bbclass                      |  2 +-
 meta/classes/package.bbclass                     |  4 ++--
 meta/classes/populate_sdk_ext.bbclass            |  2 +-
 meta/classes/qemuboot.bbclass                    |  2 ++
 meta/classes/sanity.bbclass                      |  2 +-
 meta/classes/systemd.bbclass                     |  4 ++--
 meta/classes/useradd.bbclass                     |  2 +-
 meta/lib/oe/classextend.py                       |  4 ++--
 meta/lib/oe/recipeutils.py                       | 16 ++++++++--------
 meta/lib/oeqa/selftest/cases/efibootpartition.py |  2 +-
 meta/lib/oeqa/selftest/cases/incompatible_lic.py |  6 +++---
 meta/lib/oeqa/selftest/cases/recipetool.py       |  4 ++--
 meta/lib/oeqa/selftest/cases/wic.py              |  4 ++--
 meta/recipes-core/dbus/dbus-test_1.12.20.bb      |  2 +-
 .../volatile-binds/volatile-binds.bb             |  2 +-
 meta/recipes-devtools/gdb/gdb.inc                |  2 +-
 meta/recipes-graphics/mesa/mesa.inc              |  4 ++--
 scripts/devtool                                  |  2 +-
 20 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f9a35f2daac..ee858f84b7d 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1306,7 +1306,7 @@ python () {
     # Checking ${FILESEXTRAPATHS}
     extrapaths = (d.getVar("FILESEXTRAPATHS") or "")
     if '__default' not in extrapaths.split(":"):
-        msg = "FILESEXTRAPATHS-variable, must always use _prepend (or _append)\n"
+        msg = "FILESEXTRAPATHS-variable, must always use :prepend (or :append)\n"
         msg += "type of assignment, and don't forget the colon.\n"
         msg += "Please assign it with the format of:\n"
         msg += "  FILESEXTRAPATHS:append := \":${THISDIR}/Your_Files_Path\" or\n"
diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.bbclass
index 0bf8fda3e17..44b2015468a 100644
--- a/meta/classes/kernel-grub.bbclass
+++ b/meta/classes/kernel-grub.bbclass
@@ -97,9 +97,9 @@ python __anonymous () {
 
     for type in imagetypes.split():
         typelower = type.lower()
-        preinst:append = preinst.replace('KERNEL_IMAGETYPE', type)
-        postinst:prepend = postinst.replace('KERNEL_IMAGETYPE', type)
-        d.setVar('pkg_preinst:kernel-image-' + typelower + '_append', preinst:append)
-        d.setVar('pkg_postinst:kernel-image-' + typelower + '_prepend', postinst:prepend)
+        preinst_append = preinst.replace('KERNEL_IMAGETYPE', type)
+        postinst_prepend = postinst.replace('KERNEL_IMAGETYPE', type)
+        d.setVar('pkg_preinst:kernel-image-' + typelower + ':append', preinst_append)
+        d.setVar('pkg_postinst:kernel-image-' + typelower + ':prepend', postinst_prepend)
 }
 
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 61becfb6d5e..76a599bc155 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -133,7 +133,7 @@ python native_virtclass_handler () {
 
     def map_dependencies(varname, d, suffix = "", selfref=True):
         if suffix:
-            varname = varname + "_" + suffix
+            varname = varname + ":" + suffix
         deps = d.getVar(varname)
         if not deps:
             return
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 18f931ee947..a659a1ef5cc 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1583,7 +1583,7 @@ fi
                     scriptlet = scriptlet_split[0] + "\nset -e\n" + "\n".join(scriptlet_split[1:])
                 else:
                     scriptlet = "set -e\n" + "\n".join(scriptlet_split[0:])
-            d.setVar('%s_%s' % (scriptlet_name, pkg), scriptlet)
+            d.setVar('%s:%s' % (scriptlet_name, pkg), scriptlet)
 
     def write_if_exists(f, pkg, var):
         def encode(str):
@@ -2310,7 +2310,7 @@ def gen_packagevar(d, pkgvars="PACKAGEVARS"):
         ret.append(v)
     for p in pkgs:
         for v in vars:
-            ret.append(v + "_" + p)
+            ret.append(v + ":" + p)
 
         # Ensure that changes to INCOMPATIBLE_LICENSE re-run do_package for
         # affected recipes.
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index f67849708cd..10f3265e91b 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -147,7 +147,7 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
     try:
         with open(sdkbasepath + '/conf/local.conf', 'a') as f:
             # Force the use of sstate from the build system
-            f.write('\nSSTATE_DIR_forcevariable = "%s"\n' % d.getVar('SSTATE_DIR'))
+            f.write('\nSSTATE_DIR:forcevariable = "%s"\n' % d.getVar('SSTATE_DIR'))
             f.write('SSTATE_MIRRORS:forcevariable = "file://universal/(.*) file://universal-4.9/\\1 file://universal-4.9/(.*) file://universal-4.8/\\1"\n')
             # Ensure TMPDIR is the default so that clean_esdk_builddir() can delete it
             f.write('TMPDIR:forcevariable = "${TOPDIR}/tmp"\n')
diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index aaf821d6ddc..bf529e9aa4b 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -122,6 +122,8 @@ python do_write_qemuboot_conf() {
     cf = configparser.ConfigParser()
     cf.add_section('config_bsp')
     for k in sorted(qemuboot_vars(d)):
+        if ":" in k:
+            continue
         # qemu-helper-native sysroot is not removed by rm_work and
         # contains all tools required by runqemu
         if k == 'STAGING_BINDIR_NATIVE':
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 29cc42efe77..ddba1e6e1ed 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -199,7 +199,7 @@ def check_toolchain_tune_args(data, tune, multilib, errs):
 
 def check_toolchain_args_present(data, tune, multilib, tune_errors, which):
     args_set = (data.getVar("TUNE_%s" % which) or "").split()
-    args_wanted = (data.getVar("TUNEABI_REQUIRED_%s_tune-%s" % (which, tune)) or "").split()
+    args_wanted = (data.getVar("TUNEABI_REQUIRED_%s:tune-%s" % (which, tune)) or "").split()
     args_missing = []
 
     # If no args are listed/required, we are done.
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 071affbecc8..09ec52792d5 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -70,7 +70,7 @@ python systemd_populate_packages() {
         return
 
     def get_package_var(d, var, pkg):
-        val = (d.getVar('%s_%s' % (var, pkg)) or "").strip()
+        val = (d.getVar('%s:%s' % (var, pkg)) or "").strip()
         if val == "":
             val = (d.getVar(var) or "").strip()
         return val
@@ -86,7 +86,7 @@ python systemd_populate_packages() {
         bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
 
         paths_escaped = ' '.join(shlex.quote(s) for s in d.getVar('SYSTEMD_SERVICE:' + pkg).split())
-        d.setVar('SYSTEMD_SERVICE:ESCAPED_' + pkg, paths_escaped)
+        d.setVar('SYSTEMD_SERVICE_ESCAPED:' + pkg, paths_escaped)
 
         # Add pkg to the overrides so that it finds the SYSTEMD_SERVICE:pkg
         # variable.
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index fdec5cca560..287ef843340 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -199,7 +199,7 @@ python __anonymous() {
 def get_all_cmd_params(d, cmd_type):
     import string
     
-    param_type = cmd_type.upper() + "_PARAM_%s"
+    param_type = cmd_type.upper() + "_PARAM:%s"
     params = []
 
     useradd_packages = d.getVar('USERADD_PACKAGES') or ""
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index d3d8fbe7244..e08d788b755 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -87,7 +87,7 @@ class ClassExtender(object):
     def map_depends_variable(self, varname, suffix = ""):
         # We need to preserve EXTENDPKGV so it can be expanded correctly later
         if suffix:
-            varname = varname + "_" + suffix
+            varname = varname + ":" + suffix
         orig = self.d.getVar("EXTENDPKGV", False)
         self.d.setVar("EXTENDPKGV", "EXTENDPKGV")
         deps = self.d.getVar(varname)
@@ -142,7 +142,7 @@ class ClassExtender(object):
             if pkg_mapping[0].startswith("${") and pkg_mapping[0].endswith("}"):
                 continue
             for subs in variables:
-                self.d.renameVar("%s_%s" % (subs, pkg_mapping[0]), "%s_%s" % (subs, pkg_mapping[1]))
+                self.d.renameVar("%s:%s" % (subs, pkg_mapping[0]), "%s:%s" % (subs, pkg_mapping[1]))
 
 class NativesdkClassExtender(ClassExtender):
     def map_depends(self, dep):
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index a66bb92823b..a0c6974f04a 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -47,7 +47,7 @@ def simplify_history(history, d):
                 continue
             has_set = True
         elif event['op'] in ('append', 'prepend', 'postdot', 'predot'):
-            # Reminder: "append" and "prepend" mean += and =+ respectively, NOT _append / _prepend
+            # Reminder: "append" and "prepend" mean += and =+ respectively, NOT :append / :prepend
             if has_set:
                 continue
         ret_history.insert(0, event)
@@ -342,7 +342,7 @@ def patch_recipe(d, fn, varvalues, patch=False, relpath='', redirect_output=None
     def override_applicable(hevent):
         op = hevent['op']
         if '[' in op:
-            opoverrides = op.split('[')[1].split(']')[0].split('_')
+            opoverrides = op.split('[')[1].split(']')[0].split(':')
             for opoverride in opoverrides:
                 if not opoverride in overrides:
                     return False
@@ -368,13 +368,13 @@ def patch_recipe(d, fn, varvalues, patch=False, relpath='', redirect_output=None
                                 recipe_set = True
                     if not recipe_set:
                         for event in history:
-                            if event['op'].startswith('_remove'):
+                            if event['op'].startswith(':remove'):
                                 continue
                             if not override_applicable(event):
                                 continue
                             newvalue = value.replace(event['detail'], '')
-                            if newvalue == value and os.path.abspath(event['file']) == fn and event['op'].startswith('_'):
-                                op = event['op'].replace('[', '_').replace(']', '')
+                            if newvalue == value and os.path.abspath(event['file']) == fn and event['op'].startswith(':'):
+                                op = event['op'].replace('[', ':').replace(']', '')
                                 extravals[var + op] = None
                             value = newvalue
                             vals[var] = ('+=', value)
@@ -758,7 +758,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
     appendoverride = ''
     if machine:
         bbappendlines.append(('PACKAGE_ARCH', '=', '${MACHINE_ARCH}'))
-        appendoverride = '_%s' % machine
+        appendoverride = ':%s' % machine
     copyfiles = {}
     if srcfiles:
         instfunclines = []
@@ -853,11 +853,11 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
                     newvalue = splitval
                     if len(newvalue) == 1:
                         # Ensure it's written out as one line
-                        if '_append' in varname:
+                        if ':append' in varname:
                             newvalue = ' ' + newvalue[0]
                         else:
                             newvalue = newvalue[0]
-                    if not newvalue and (op in ['+=', '.='] or '_append' in varname):
+                    if not newvalue and (op in ['+=', '.='] or ':append' in varname):
                         # There's no point appending nothing
                         newvalue = None
                     if varname.endswith('()'):
diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index 3203a7b71d0..26de3a07c9e 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -26,7 +26,7 @@ class GenericEFITest(OESelftestTestCase):
         self.write_config(self,
 """
 EFI_PROVIDER = "%s"
-IMAGE_FSTYPES:pn-%s_append = " wic"
+IMAGE_FSTYPES:pn-%s:append = " wic"
 MACHINE = "%s"
 MACHINE_FEATURES:append = " efi"
 WKS_FILE = "efi-bootdisk.wks.in"
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 93be434650a..aa8e0857545 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -98,7 +98,7 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
             raise AssertionError(result.output)
 
     def test_bash_and_license(self):
-        self.write_config(self.default_config() + '\nLICENSE_append_pn-bash = " & SomeLicense"')
+        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " & SomeLicense"')
         error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash cannot be installed into the image because it has incompatible license(s): GPL-3.0-or-later"
 
         result = bitbake('core-image-minimal', ignore_status=True)
@@ -106,12 +106,12 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
             raise AssertionError(result.output)
 
     def test_bash_or_license(self):
-        self.write_config(self.default_config() + '\nLICENSE_append_pn-bash = " | SomeLicense"')
+        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " | SomeLicense"')
 
         bitbake('core-image-minimal')
 
     def test_bash_whitelist(self):
-        self.write_config(self.default_config() + '\nWHITELIST_GPL-3.0_pn-core-image-minimal = "bash"')
+        self.write_config(self.default_config() + '\nWHITELIST_GPL-3.0:pn-core-image-minimal = "bash"')
 
         bitbake('core-image-minimal')
 
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 3b99417e841..6f531dfa364 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -183,9 +183,9 @@ class RecipetoolTests(RecipetoolBase):
                          '\n',
                          'PACKAGE_ARCH = "${MACHINE_ARCH}"\n',
                          '\n',
-                         'SRC_URI:append_mymachine = " file://testfile"\n',
+                         'SRC_URI:append:mymachine = " file://testfile"\n',
                          '\n',
-                         'do_install:append_mymachine() {\n',
+                         'do_install:append:mymachine() {\n',
                          '    install -d ${D}${datadir}\n',
                          '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/something\n',
                          '}\n']
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 32044e74d09..2efbe514c1b 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1035,7 +1035,7 @@ class Wic2(WicTestCase):
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_biosplusefi_plugin_qemu(self):
         """Test biosplusefi plugin in qemu"""
-        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_biosplusefi_plugin.wks"\nMACHINE_FEATURES_append = " efi"\n'
+        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_biosplusefi_plugin.wks"\nMACHINE_FEATURES:append = " efi"\n'
         self.append_config(config)
         self.assertEqual(0, bitbake('core-image-minimal').status)
         self.remove_config(config)
@@ -1072,7 +1072,7 @@ class Wic2(WicTestCase):
         # If an image hasn't been built yet, directory ${STAGING_DATADIR}/syslinux won't exists and _get_bootimg_dir()
         #   will raise with "Couldn't find correct bootimg_dir"
         # The easiest way to work-around this issue is to make sure we already built an image here, hence the bitbake call
-        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_biosplusefi_plugin.wks"\nMACHINE_FEATURES_append = " efi"\n'
+        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_biosplusefi_plugin.wks"\nMACHINE_FEATURES:append = " efi"\n'
         self.append_config(config)
         self.assertEqual(0, bitbake('core-image-minimal').status)
         self.remove_config(config)
diff --git a/meta/recipes-core/dbus/dbus-test_1.12.20.bb b/meta/recipes-core/dbus/dbus-test_1.12.20.bb
index 11b84cec959..ae703014319 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.20.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.20.bb
@@ -59,6 +59,6 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}-ptest += "bash make dbus"
-RDEPENDS_${PN}-ptest_remove = "${PN}"
+RDEPENDS:${PN}-ptest:remove = "${PN}"
 
 PRIVATE_LIBS:${PN}-ptest = "libdbus-1.so.3"
diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index 5eeb6513301..d3863f2b47a 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -68,7 +68,7 @@ do_install () {
     install -m 0755 mount-copybind ${D}${base_sbindir}/
 
     install -d ${D}${systemd_unitdir}/system
-    for service in ${SYSTEMD_SERVICE_${PN}}; do
+    for service in ${@d.getVar('SYSTEMD_SERVICE:${PN}')}; do
         install -m 0644 $service ${D}${systemd_unitdir}/system/
     done
 
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index f4cd0a5c01b..2b0ae1655f6 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -2,7 +2,7 @@ require gdb-common.inc
 
 inherit gettext
 
-#LDFLAGS_append = " -s"
+#LDFLAGS:append = " -s"
 #export CFLAGS:append=" -L${STAGING_LIBDIR}"
 
 # cross-canadian must not see this
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 87b31b4819c..f2585479bd1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -230,7 +230,7 @@ python __anonymous() {
         mlprefix = d.getVar("MLPREFIX")
         fullp = mlprefix + p[1] + "-mesa" + suffix
         mlprefix = d.getVar("MLPREFIX")
-        pkgs = " ".join(mlprefix + x + suffix for x in p[1:])
+        pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
         d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
         d.appendVar("RREPLACES:" + fullp, pkgs)
         d.appendVar("RPROVIDES:" + fullp, pkgs)
@@ -240,7 +240,7 @@ python __anonymous() {
 
         # For -dev, the first element is both the Debian and original name
         fullp = mlprefix + p[1] + "-mesa-dev" + suffix
-        pkgs = mlprefix + p[1] + "-dev" + suffix
+        pkgs = " " + mlprefix + p[1] + "-dev" + suffix
         d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
         d.appendVar("RREPLACES:" + fullp, pkgs)
         d.appendVar("RPROVIDES:" + fullp, pkgs)
diff --git a/scripts/devtool b/scripts/devtool
index 8a4f41bc372..af4811b9221 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -100,7 +100,7 @@ def read_workspace():
         _enable_workspace_layer(config.workspace_path, config, basepath)
 
     logger.debug('Reading workspace in %s' % config.workspace_path)
-    externalsrc_re = re.compile(r'^EXTERNALSRC(_pn-([^ =]+))? *= *"([^"]*)"$')
+    externalsrc_re = re.compile(r'^EXTERNALSRC(:pn-([^ =]+))? *= *"([^"]*)"$')
     for fn in glob.glob(os.path.join(config.workspace_path, 'appends', '*.bbappend')):
         with open(fn, 'r') as f:
             pnvalues = {}
-- 
2.30.2

