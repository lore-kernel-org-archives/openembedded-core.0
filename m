Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469A6C44512
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:00 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12405.1784134077005034458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lI8ApJQF;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-448de0cc236so3424414fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134076; x=1784738876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIz5hPukVKtWmv01oJA2KfLBNUu+Dz3CN6Flxr5V0OE=;
        b=lI8ApJQFQxBimrtS89lqeoL+iZqSnoOLa/F67ep0+gcDiPxqlfJSDjxOAuk44+W8LS
         qPMr+tQUL/oetd3skGalMWwXLYmcl5i9uz/dD2oYW7BOnS0cCLSjouvm5duL4FMdCVRE
         jMZzD3ietU2uNtC7wXR1zVOvE0bdLzj+CL5yaajH6oVq6L4uc/29Yim9pGNSqKl9UXhq
         Y0ic1xS1NtG9Aa0Aw9kFdQMX2mfPI1rX89i/4d5Z/f2z+jJkVR9kw/+ScZqGO0nxJpeR
         iuJ/jRsVEo2TQq7c85EbJz3X1bxyK0MvScDRLxldVUaEcFmh9AIKuHew8c+2bvTV0l2p
         Hdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134076; x=1784738876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OIz5hPukVKtWmv01oJA2KfLBNUu+Dz3CN6Flxr5V0OE=;
        b=YJKxZ+jW96UP40a3h6XRSr/Q0mrOQ3DDaUqtXz+IscDC27qWkC4TUZrDMHRQIDapkr
         2wj2mkv4qwEyjj2X4E5PnyEY+eAftr2qXQvGYDo58U28UjTEGJCfUX4gq8EapCbiq7Yu
         PQi9vf0sGgdxmLcsvv4OTy+Mq3dHdjeLInqZtpRJEv+0fkTzFY/24Bf9mcVJaMbrS99l
         w0HZpVhxBMlRHCW5fWISkVK+w+XkOqzsrMy3xJO9EhDxiOYVTyXhOcrvWQCTVmCCoj+o
         r75bmaxphg3opM0rQTu+PzamdFGz2mreQ4o6v8chVLnAEOBImx6QjoY5g0VGWPRr7cMN
         KNSQ==
X-Gm-Message-State: AOJu0YyhlXH3P+HWZcyCjLr8jo5/jDqA5NdAA3zP57+9rJrymw0ypqcO
	sLKhQoKdhv+tztLbWL1curazeQd61dVEH0wOSafP6V/Zu35AujcRieGzKWMMqQ==
X-Gm-Gg: AfdE7ckh+viKiGWOSkgwE6vmwohH5E2SAAQw3tWCyClg6VuixtFM5rEpkhQ4+cbeZir
	1GkNzb1OAuzPptej8rW4ZmIw9MyDmB5hA0jUv9nHk7PZ2vyS/dZ+V7xTW/uW2Ow+fZG6cw/SfyH
	AIG7sTqY1AwapI1KTr//+WANyDFB44PU1njx40KLwRXTFXJu0dJ8ytjIvSD8l1kKhQWL2wu1zIJ
	+03Ct7FcSIrk+X+W8LHkwpQyFP74lDf3dJ5qXfppcP0O7T48GEH8Mp/s+O0YTUOECyL4xTvxtrc
	GjMe7Qr5WIAa8osxYrh9GUBANf3K52+OgdEiB2Rrzqlp5X2YE1xXvcTAWMkvQFpACWefNSrHJDs
	jY+NTtkLIwK5hgaQ6o0ROV4tGo9vrDcd6m4wWXVl/POGT4NlNziTdbHXozNFE/+QJe5RW7CleC7
	SQuRKtwBKb
X-Received: by 2002:a05:6870:6245:b0:439:a524:a29d with SMTP id 586e51a60fabf-455f7a34f41mr5123554fac.1.1784134075833;
        Wed, 15 Jul 2026 09:47:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:55 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 19/25] license: Remove tidy_licenses()
Date: Wed, 15 Jul 2026 10:45:15 -0600
Message-ID: <20260715164739.364323-20-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241012

Removes the tidy_licenses() API in favor of calling .sort() on a SPDX
license AST. Reworks the recipetool API that passes around licenses to
use SPDX license AST nodes instead of a list of licenses.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../go-mod-update-modules.bbclass             |  21 ++--
 meta/files/license-hashes.csv                 |   4 +-
 meta/lib/oe/license.py                        |  13 --
 meta/lib/oe/license_finder.py                 |  10 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   5 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    | 106 ++++++++--------
 scripts/lib/recipetool/create.py              | 116 +++++++++---------
 scripts/lib/recipetool/create_npm.py          |  13 +-
 8 files changed, 141 insertions(+), 147 deletions(-)

diff --git a/meta/classes-recipe/go-mod-update-modules.bbclass b/meta/classes-recipe/go-mod-update-modules.bbclass
index 0dda716c65..3a0f0a3377 100644
--- a/meta/classes-recipe/go-mod-update-modules.bbclass
+++ b/meta/classes-recipe/go-mod-update-modules.bbclass
@@ -14,7 +14,6 @@ do_update_modules[network] = "1"
 
 python do_update_modules() {
     import subprocess, tempfile, json, re, urllib.parse
-    from oe.license import tidy_licenses
     from oe.license_finder import find_licenses_up
 
     def unescape_path(path):
@@ -75,24 +74,28 @@ python do_update_modules() {
             mod_dir = pkg['Module']['Dir']
             path = os.path.relpath(mod_dir, mod_cache_dir)
 
-            for name, file, md5 in find_licenses_up(pkg_dir, mod_dir, d, first_only=True, extra_hashes=extra_hashes):
-                lic_files[os.path.join(path, file)] = (name, md5)
+            for node, file, md5 in find_licenses_up(pkg_dir, mod_dir, d, first_only=True, extra_hashes=extra_hashes):
+                lic_files[os.path.join(path, file)] = (node, md5)
 
-        licenses = set()
+        licenses = []
         lic_files_chksum = []
         for lic_file in lic_files:
-            license_name, license_md5 = lic_files[lic_file]
-            if license_name == "Unknown":
+            node, license_md5 = lic_files[lic_file]
+            if isinstance(node, oe.spdx_license.UnknownId):
                 bb.warn(f"Unknown license: {lic_file} {license_md5}")
 
-            licenses.add(lic_files[lic_file][0])
+            licenses.append(node)
             lic_files_chksum.append(
-                f'file://pkg/mod/{lic_file};md5={license_md5};spdx={urllib.parse.quote_plus(license_name)}')
+                f'file://pkg/mod/{lic_file};md5={license_md5};spdx={urllib.parse.quote_plus(node.to_string())}')
 
         licenses_filename = os.path.join(thisdir, f"{bpn}-licenses.inc")
         with open(licenses_filename, "w") as f:
             f.write(notice)
-            f.write(f'LICENSE += "AND {" AND ".join(tidy_licenses(licenses))}"\n\n')
+            f.write('LICENSE += "AND')
+            if licenses:
+                f.write(' ')
+                f.write(oe.spdx_license.AndOp.join(licenses).sort().to_string())
+            f.write('"\n\n')
             f.write('LIC_FILES_CHKSUM += "\\\n')
             for lic in sorted(lic_files_chksum, key=fold_uri):
                 f.write('    ' + lic + ' \\\n')
diff --git a/meta/files/license-hashes.csv b/meta/files/license-hashes.csv
index 5e81dbcdec..1895f4d377 100644
--- a/meta/files/license-hashes.csv
+++ b/meta/files/license-hashes.csv
@@ -18,7 +18,7 @@
 2d5025d4aa3495befef8f17206a5b0a1,LGPL-2.1-only
 3214f080875748938ba060314b4f727d,LGPL-2.0-only
 37acb030ba070680be4a9fcb57f2735a,MIT
-385c55653886acac3821999a3ccd17b3,Artistic-1.0 | GPL-2.0-only
+385c55653886acac3821999a3ccd17b3,Artistic-1.0 OR GPL-2.0-only
 38be95f95200434dc208e2ee3dab5081,BSD-3-Clause
 393a5ca445f6965873eca0259a17f833,GPL-2.0-only
 3b83ef96387f14655fc854ddc3c6bd57,Apache-2.0
@@ -71,7 +71,7 @@ b376d29a53c9573006b9970709231431,MIT
 b5f72aef53d3b2b432702c30b0215666,BSD-3-Clause
 b66384e7137e41a9b1904ef4d39703b6,Apache-2.0
 bbb461211a33b134d42ed5ee802b37ff,LGPL-2.1-only
-bfe1f75d606912a4111c90743d6c7325,MPL-1.1-only
+bfe1f75d606912a4111c90743d6c7325,MPL-1.1
 c93c0550bd3173f4504b2cbd8991e50b,GPL-2.0-only
 d014fb11a34eb67dc717fdcfc97e60ed,GFDL-1.2-only
 d0b68be4a2dc957aaf09144970bc6696,MIT
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index e4a860eff9..a1dce143dd 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -602,16 +602,3 @@ def skip_incompatible_package_licenses(d, pkgs):
             skipped_pkgs[pkg] = [lic.to_string() for lic in incompatible_lic]
 
     return skipped_pkgs
-
-def tidy_licenses(value):
-    """
-    Flat, split and sort licenses.
-    """
-    def _choose(a, b):
-        str_a, str_b  = sorted((" AND ".join(a), " AND ".join(b)), key=str.casefold)
-        return ["(%s OR %s)" % (str_a, str_b)]
-
-    if not isinstance(value, str):
-        value = " AND ".join(value)
-
-    return sorted(list(set(flattened_licenses(None, value, _choose))), key=str.casefold)
diff --git a/meta/lib/oe/license_finder.py b/meta/lib/oe/license_finder.py
index 4f2bb661fd..6f071f7c56 100644
--- a/meta/lib/oe/license_finder.py
+++ b/meta/lib/oe/license_finder.py
@@ -13,6 +13,8 @@ import re
 import bb
 import bb.utils
 
+import oe.spdx_license
+
 logger = logging.getLogger("BitBake.OE.LicenseFinder")
 
 def _load_hash_csv(d):
@@ -180,10 +182,14 @@ def match_licenses(licfiles, srctree, d, extra_hashes={}):
             crunched_md5 = _crunch_license(resolved_licfile)
             license = md5sums.get(crunched_md5, None)
             if not license:
-                license = 'Unknown'
+                rel_fn = os.path.relpath(licfile, srctree + "/..")
+                license = oe.spdx_license.UnknownId("Unknown")
                 logger.info("Please add the following line for '%s' to a 'license-hashes.csv' " \
                     "and replace `Unknown` with the license:\n" \
-                    "%s,Unknown" % (os.path.relpath(licfile, srctree + "/.."), md5value))
+                    "%s,Unknown" % (rel_fn, md5value))
+
+        if isinstance(license, str):
+            license = oe.spdx_license.parse(license)
 
         licenses.append((license, os.path.relpath(licfile, srctree), md5value))
 
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b2cd13e9a5..792ccfed26 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -172,10 +172,7 @@ class DevtoolTestCase(OESelftestTestCase):
                     if needvalue is None:
                         self.fail('Variable %s should not appear in recipe, but value is being set to "%s"' % (var, value))
                     if isinstance(needvalue, set):
-                        if var == 'LICENSE':
-                            value = set(value.split(' & '))
-                        else:
-                            value = set(value.split())
+                        value = set(value.split())
                     self.assertEqual(value, needvalue, 'values for %s do not match' % var)
 
 
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 0369782683..5a9fc8ea67 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -10,6 +10,8 @@ import shutil
 import tempfile
 import urllib.parse
 
+import oe.spdx_license
+
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils.commands import get_bb_vars, create_temp_layer
 from oeqa.selftest.cases import devtool
@@ -406,7 +408,7 @@ class RecipetoolCreateTests(RecipetoolBase):
             self.fail('recipetool did not create recipe file; output:\n%s\ndirlist:\n%s' % (result.output, str(dirlist)))
         self.assertEqual(dirlist[0], 'socat_%s.bb' % pv, 'Recipe file incorrectly named')
         checkvars = {}
-        checkvars['LICENSE'] = set(['Unknown', 'GPL-2.0-only'])
+        checkvars['LICENSE'] = 'GPL-2.0-only AND Unknown'
         checkvars['LIC_FILES_CHKSUM'] = set(['file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4', 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'])
         # We don't check DEPENDS since they are variable for this recipe depending on what's in the sysroot
         checkvars['S'] = None
@@ -422,7 +424,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['LGPL-2.1-only', 'MPL-1.1-only'])
+        checkvars['LICENSE'] = 'LGPL-2.1-only AND MPL-1.1'
         checkvars['SRC_URI'] = 'http://taglib.github.io/releases/taglib-${PV}.tar.gz'
         checkvars['SRC_URI[sha256sum]'] = 'b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b'
         checkvars['DEPENDS'] = set(['boost', 'zlib'])
@@ -445,7 +447,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars = {}
         checkvars['SUMMARY'] = 'Node Server Example'
         checkvars['HOMEPAGE'] = 'https://github.com/savoirfairelinux/node-server-example#readme'
-        checkvars['LICENSE'] = 'BSD-3-Clause & ISC & MIT & Unknown'
+        checkvars['LICENSE'] = 'BSD-3-Clause AND ISC AND MIT AND Unknown'
         urls = []
         urls.append('npm://registry.npmjs.org/;package=@savoirfairelinux/node-server-example;version=${PV}')
         urls.append('npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json')
@@ -469,7 +471,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         result = runCmd(cmd)
         self.assertTrue(os.path.isfile(recipefile), msg="recipe %s not created for command %s, output %s" % (recipefile, " ".join(cmd), result.output))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0', "Unknown"])
+        checkvars['LICENSE'] = 'Apache-2.0 AND Unknown'
         checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=0.52'
         inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -487,7 +489,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         result = runCmd('recipetool create --no-pypi -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LICENSE'] = 'MIT'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
         checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/84/30/80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-magic-${PV}.tar.gz'
         checkvars['SRC_URI[sha256sum]'] = 'f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5'
@@ -505,7 +507,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LICENSE'] = 'MIT'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
         checkvars['SRC_URI[sha256sum]'] = 'f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5'
         checkvars['PYPI_PACKAGE'] = pn
@@ -527,7 +529,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LICENSE'] = 'MIT'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
         checkvars['SRC_URI[sha256sum]'] = 'f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5'
         checkvars['PYPI_PACKAGE'] = pn
@@ -541,7 +543,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         runCmd('recipetool create -o %s %s --version %s' % (temprecipe, srcuri, pv))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LICENSE'] = 'MIT'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
         checkvars['SRC_URI[sha256sum]'] = 'f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5'
         checkvars['PYPI_PACKAGE'] = pn
@@ -568,7 +570,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         recipefile = os.path.join(temprecipe, '%s_%s.bb' % (pn, latest_pv))
         # Do not check LIC_FILES_CHKSUM and SRC_URI checksum here to avoid having updating the test on each release
         checkvars = {}
-        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LICENSE'] = 'MIT'
         checkvars['PYPI_PACKAGE'] = pn
         inherits = ['setuptools3', "pypi"]
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -588,7 +590,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['SUMMARY'] = 'A library for working with the color formats defined by HTML and CSS.'
-        checkvars['LICENSE'] = set(['BSD-3-Clause'])
+        checkvars['LICENSE'] = 'BSD-3-Clause'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=702b1ef12cf66832a88f24c8f2ee9c19'
         checkvars['SRC_URI[sha256sum]'] = 'c225b674c83fa923be93d235330ce0300373d02885cef23238813b0d5668304a'
         inherits = ['python_setuptools_build_meta', 'pypi']
@@ -611,7 +613,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['SUMMARY'] = 'A linter for YAML files.'
-        checkvars['LICENSE'] = set(['GPL-3.0-only'])
+        checkvars['LICENSE'] = 'GPL-3.0-only'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464'
         checkvars['SRC_URI[sha256sum]'] = '81f7c0c5559becc8049470d86046b36e96113637bcbe4753ecef06977c00245d'
         inherits = ['python_setuptools_build_meta', 'pypi']
@@ -633,7 +635,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['SUMMARY'] = 'Sphinx SVG to PDF or PNG converter extension'
-        checkvars['LICENSE'] = set(['BSD-2-Clause'])
+        checkvars['LICENSE'] = 'BSD-2-Clause'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE.txt;md5=b11cf936853a71258d4b57bb1849a3f9'
         checkvars['SRC_URI[sha256sum]'] = 'ab9c8f1080391e231812d20abf2657a69ee35574563b1014414f953964a95fa3'
         inherits = ['python_setuptools_build_meta', 'pypi']
@@ -655,7 +657,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['SUMMARY'] = 'Simple module to parse ISO 8601 dates'
-        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LICENSE'] = 'MIT'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=aab31f2ef7ba214a5a341eaa47a7f367'
         checkvars['SRC_URI[sha256sum]'] = '6b1d3829ee8921c4301998c909f7829fa9ed3cbdac0d3b16af2d743aed1ba8df'
         inherits = ['python_poetry_core', 'pypi']
@@ -700,7 +702,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars = {}
         checkvars['SUMMARY'] = 'An implementation of JSON Schema validation for Python'
         checkvars['HOMEPAGE'] = 'https://github.com/python-jsonschema/jsonschema'
-        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LICENSE'] = 'MIT'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af'
         checkvars['SRC_URI[sha256sum]'] = 'ec84cc37cfa703ef7cd4928db24f9cb31428a5d0fa77747b8b51a847458e0bbf'
         inherits = ['python_hatchling', 'pypi']
@@ -722,7 +724,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['HOMEPAGE'] = 'https://github.com/pydantic/pydantic-core'
-        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LICENSE'] = 'MIT'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c'
         checkvars['SRC_URI[sha256sum]'] = '6d30226dfc816dd0fdf120cae611dd2215117e4f9b124af8c60ab9093b6e8e71'
         inherits = ['python_maturin', 'pypi']
@@ -759,7 +761,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0'])
+        checkvars['LICENSE'] = 'Apache-2.0'
         checkvars['SRC_URI'] = 'https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz'
         inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -934,26 +936,26 @@ class RecipetoolTests(RecipetoolBase):
 
         extravalues = {
             # Duplicate and missing licenses
-            'LICENSE': 'Zlib & BSD-2-Clause & Zlib',
+            'LICENSE': 'Zlib AND BSD-2-Clause AND Zlib',
             'LIC_FILES_CHKSUM': [
                 'file://README.md;md5=0123456789abcdef0123456789abcd'
             ]
         }
         lines_before = []
         handled = []
-        licvalues = handle_license_vars(srctree, lines_before, handled, extravalues, d)
+        licnode = handle_license_vars(srctree, lines_before, handled, extravalues, d)
         expected_lines_before = [
             '# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is',
             '# your responsibility to verify that the values are complete and correct.',
-            '# NOTE: Original package / source metadata indicates license is: BSD-2-Clause & Zlib',
+            '# NOTE: Original package / source metadata indicates license is: BSD-2-Clause AND Zlib',
             '#',
-            '# NOTE: multiple licenses have been detected; they have been separated with &',
+            '# NOTE: multiple licenses have been detected; they have been separated with AND',
             '# in the LICENSE value for now since it is a reasonable assumption that all',
             '# of the licenses apply. If instead there is a choice between the multiple',
-            '# licenses then you should change the value to separate the licenses with |',
-            '# instead of &. If there is any doubt, check the accompanying documentation',
+            '# licenses then you should change the value to separate the licenses with OR',
+            '# instead of AND. If there is any doubt, check the accompanying documentation',
             '# to determine which situation is applicable.',
-            'LICENSE = "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & ISC & MIT & Zlib"',
+            'LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND ISC AND MIT AND Zlib"',
             'LIC_FILES_CHKSUM = "file://LICENSE;md5=0835ade698e0bcf8506ecda2f7b4f302 \\\n'
             '                    file://LICENSE.Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \\\n'
             '                    file://LICENSE.BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \\\n'
@@ -963,36 +965,32 @@ class RecipetoolTests(RecipetoolBase):
             ''
         ]
         self.assertEqual(lines_before, expected_lines_before)
-        expected_licvalues = [
-            ('MIT', 'LICENSE', '0835ade698e0bcf8506ecda2f7b4f302'),
-            ('Apache-2.0', 'LICENSE.Apache-2.0', '89aea4e17d99a7cacdbeed46a0096b10'),
-            ('BSD-3-Clause', 'LICENSE.BSD-3-Clause', '550794465ba0ec5312d6919e203a55f9'),
-            ('ISC', 'LICENSE.ISC', 'f3b90e78ea0cffb20bf5cca7947a896d'),
-            ('MIT', 'LICENSE.MIT', '0835ade698e0bcf8506ecda2f7b4f302')
-        ]
-        self.assertEqual(handled, [('license', expected_licvalues)])
+        expected_licvalue = oe.spdx_license.parse("Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND ISC AND MIT AND Zlib")
+        self.assertEqual(len(handled), 1)
+        self.assertEqual(handled[0][0], "license")
+        self.assertEqual(handled[0][1].to_string(), expected_licvalue.to_string())
         self.assertEqual(extravalues, {})
-        self.assertEqual(licvalues, expected_licvalues)
+        self.assertEqual(licnode.to_string(), expected_licvalue.to_string())
 
 
     def test_recipetool_split_pkg_licenses(self):
         from create import split_pkg_licenses
         licvalues = [
             # Duplicate licenses
-            ('BSD-2-Clause', 'x/COPYING', None),
-            ('BSD-2-Clause', 'x/LICENSE', None),
+            (oe.spdx_license.parse('BSD-2-Clause'), 'x/COPYING', None),
+            (oe.spdx_license.parse('BSD-2-Clause'), 'x/LICENSE', None),
             # Multiple licenses
-            ('MIT', 'x/a/LICENSE.MIT', None),
-            ('ISC', 'x/a/LICENSE.ISC', None),
+            (oe.spdx_license.parse('MIT'), 'x/a/LICENSE.MIT', None),
+            (oe.spdx_license.parse('ISC'), 'x/a/LICENSE.ISC', None),
             # Alternative licenses
-            ('(MIT | ISC)', 'x/b/LICENSE', None),
+            (oe.spdx_license.parse('(MIT OR ISC)'), 'x/b/LICENSE', None),
             # Alternative licenses without brackets
-            ('MIT | BSD-2-Clause', 'x/c/LICENSE', None),
+            (oe.spdx_license.parse('MIT OR BSD-2-Clause'), 'x/c/LICENSE', None),
             # Multi licenses with alternatives
-            ('MIT', 'x/d/COPYING', None),
-            ('MIT | BSD-2-Clause', 'x/d/LICENSE', None),
+            (oe.spdx_license.parse('MIT'), 'x/d/COPYING', None),
+            (oe.spdx_license.parse('MIT OR BSD-2-Clause'), 'x/d/LICENSE', None),
             # Multi licenses with alternatives and brackets
-            ('Apache-2.0 & ((MIT | ISC) & BSD-3-Clause)', 'x/e/LICENSE', None)
+            (oe.spdx_license.parse('Apache-2.0 AND ((MIT OR ISC) AND BSD-3-Clause)'), 'x/e/LICENSE', None)
         ]
         packages = {
             '${PN}': '',
@@ -1013,23 +1011,23 @@ class RecipetoolTests(RecipetoolBase):
         outlines = []
         outlicenses = split_pkg_licenses(licvalues, packages, outlines, fallback_licenses)
         expected_outlicenses = {
-            '${PN}': ['BSD-2-Clause'],
-            'a': ['ISC', 'MIT'],
-            'b': ['(ISC | MIT)'],
-            'c': ['(BSD-2-Clause | MIT)'],
-            'd': ['(BSD-2-Clause | MIT)', 'MIT'],
-            'e': ['(ISC | MIT)', 'Apache-2.0', 'BSD-3-Clause'],
-            'f': ['BSD-3-Clause'],
-            'g': ['Unknown']
+            '${PN}': 'BSD-2-Clause',
+            'a': 'ISC AND MIT',
+            'b': 'ISC OR MIT',
+            'c': 'BSD-2-Clause OR MIT',
+            'd': 'MIT AND (BSD-2-Clause OR MIT)',
+            'e': 'Apache-2.0 AND BSD-3-Clause AND (ISC OR MIT)',
+            'f': 'BSD-3-Clause',
+            'g': 'Unknown',
         }
         self.assertEqual(outlicenses, expected_outlicenses)
         expected_outlines = [
             'LICENSE:${PN} = "BSD-2-Clause"',
-            'LICENSE:a = "ISC & MIT"',
-            'LICENSE:b = "(ISC | MIT)"',
-            'LICENSE:c = "(BSD-2-Clause | MIT)"',
-            'LICENSE:d = "(BSD-2-Clause | MIT) & MIT"',
-            'LICENSE:e = "(ISC | MIT) & Apache-2.0 & BSD-3-Clause"',
+            'LICENSE:a = "ISC AND MIT"',
+            'LICENSE:b = "ISC OR MIT"',
+            'LICENSE:c = "BSD-2-Clause OR MIT"',
+            'LICENSE:d = "MIT AND (BSD-2-Clause OR MIT)"',
+            'LICENSE:e = "Apache-2.0 AND BSD-3-Clause AND (ISC OR MIT)"',
             'LICENSE:f = "BSD-3-Clause"',
             'LICENSE:g = "Unknown"'
         ]
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 5126a4824e..7fc740b149 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -18,7 +18,8 @@ from urllib.parse import urlparse, urldefrag, urlsplit
 import hashlib
 import bb.fetch2
 logger = logging.getLogger('recipetool')
-from oe.license import tidy_licenses
+import oe.license
+import oe.spdx_license
 from oe.license_finder import find_licenses
 
 tinfoil = None
@@ -794,7 +795,7 @@ def create_recipe(args):
         if name_pv and not realpv:
             realpv = name_pv
 
-    licvalues = handle_license_vars(srctree_use, lines_before, handled, extravalues, tinfoil.config_data)
+    handle_license_vars(srctree_use, lines_before, handled, extravalues, tinfoil.config_data)
 
     if not outfile:
         if not pn:
@@ -957,36 +958,40 @@ def handle_license_vars(srctree, lines_before, handled, extravalues, d):
         # Someone else has already handled the license vars, just return their value
         return lichandled[0][1]
 
-    licvalues = find_licenses(srctree, d)
-    licenses = []
+    lines = []
     lic_files_chksum = []
     lic_unknown = []
-    lines = []
-    if licvalues:
-        for licvalue in licvalues:
-            license = licvalue[0]
-            lics = tidy_licenses(fixup_license(license))
-            lics = [lic for lic in lics if lic not in licenses]
-            if len(lics):
-                licenses.extend(lics)
-            lic_files_chksum.append('file://%s;md5=%s' % (licvalue[1], licvalue[2]))
-            if license == 'Unknown':
-                lic_unknown.append(licvalue[1])
-        if lic_unknown:
-            lines.append('#')
-            lines.append('# The following license files were not able to be identified and are')
-            lines.append('# represented as "Unknown" below, you will need to check them yourself:')
-            for licfile in lic_unknown:
-                lines.append('#   %s' % licfile)
-
-    extra_license = tidy_licenses(extravalues.pop('LICENSE', ''))
-    if extra_license:
-        if licenses == ['Unknown']:
-            licenses = extra_license
-        else:
-            for item in extra_license:
-                if item not in licenses:
-                    licenses.append(item)
+    lic_nodes = []
+    for node, licfile, md5 in find_licenses(srctree, d):
+        if isinstance(node, oe.spdx_license.UnknownId):
+            lic_unknown.append(licfile)
+
+        lic_files_chksum.append(f"file://{licfile};md5={md5}")
+        lic_nodes.append(node)
+
+    if lic_unknown:
+        lines.append('#')
+        lines.append('# The following license files were not able to be identified and are')
+        lines.append('# represented as "Unknown" below, you will need to check them yourself:')
+        for licfile in lic_unknown:
+            lines.append('#   %s' % licfile)
+
+    node = None
+    if lic_nodes:
+        node = oe.spdx_license.AndOp.join(lic_nodes).sort()
+
+    extra_license = None
+    new_license = False
+    if expression := extravalues.pop('LICENSE', '').strip():
+        extra_license = oe.license.parse_legacy_license(d, expression).sort()
+
+        if extra_license:
+            if not node or isinstance(node, oe.spdx_license.UnknownId):
+                node = extra_license
+            else:
+                node = oe.spdx_license.AndOp.join([node, extra_license]).sort()
+                new_license = True
+
     extra_lic_files_chksum = split_value(extravalues.pop('LIC_FILES_CHKSUM', []))
     for item in extra_lic_files_chksum:
         if item not in lic_files_chksum:
@@ -996,7 +1001,8 @@ def handle_license_vars(srctree, lines_before, handled, extravalues, d):
         # We are going to set the vars, so prepend the standard disclaimer
         lines.insert(0, '# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is')
         lines.insert(1, '# your responsibility to verify that the values are complete and correct.')
-    else:
+
+    if not node:
         # Without LIC_FILES_CHKSUM we set LICENSE = "CLOSED" to allow the
         # user to get started easily
         lines.append('# Unable to find any files that looked like license statements. Check the accompanying')
@@ -1006,21 +1012,20 @@ def handle_license_vars(srctree, lines_before, handled, extravalues, d):
         lines.append('# this is not accurate with respect to the licensing of the software being built (it')
         lines.append('# will not be in most cases) you must specify the correct value before using this')
         lines.append('# recipe for anything other than initial testing/development!')
-        licenses = ['CLOSED']
 
-    if extra_license and sorted(licenses) != sorted(extra_license):
-        lines.append('# NOTE: Original package / source metadata indicates license is: %s' % ' & '.join(extra_license))
+    if new_license:
+        lines.append('# NOTE: Original package / source metadata indicates license is: %s' % extra_license.to_string())
 
-    if len(licenses) > 1:
+    if not isinstance(node, oe.spdx_license.Identifier):
         lines.append('#')
-        lines.append('# NOTE: multiple licenses have been detected; they have been separated with &')
+        lines.append('# NOTE: multiple licenses have been detected; they have been separated with AND')
         lines.append('# in the LICENSE value for now since it is a reasonable assumption that all')
         lines.append('# of the licenses apply. If instead there is a choice between the multiple')
-        lines.append('# licenses then you should change the value to separate the licenses with |')
-        lines.append('# instead of &. If there is any doubt, check the accompanying documentation')
+        lines.append('# licenses then you should change the value to separate the licenses with OR')
+        lines.append('# instead of AND. If there is any doubt, check the accompanying documentation')
         lines.append('# to determine which situation is applicable.')
 
-    lines.append('LICENSE = "%s"' % ' & '.join(sorted(licenses, key=str.casefold)))
+    lines.append('LICENSE = "%s"' % (node.to_string() if node else 'CLOSED'))
     lines.append('LIC_FILES_CHKSUM = "%s"' % ' \\\n                    '.join(lic_files_chksum))
     lines.append('')
 
@@ -1034,8 +1039,8 @@ def handle_license_vars(srctree, lines_before, handled, extravalues, d):
     else:
         lines_before[pos:pos+1] = lines
 
-    handled.append(('license', licvalues))
-    return licvalues
+    handled.append(('license', node))
+    return node
 
 def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=None, pn='${PN}'):
     """
@@ -1044,33 +1049,30 @@ def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=None, pn
     package-specific LICENSE values.
     """
     pkglicenses = {pn: []}
-    for license, licpath, _ in licvalues:
-        license = fixup_license(license)
+    for node, licpath, _ in licvalues:
         for pkgname, pkgpath in packages.items():
             if licpath.startswith(pkgpath + '/'):
-                if pkgname in pkglicenses:
-                    pkglicenses[pkgname].append(license)
-                else:
-                    pkglicenses[pkgname] = [license]
+                pkglicenses.setdefault(pkgname, []).append(node)
                 break
         else:
             # Accumulate on the main package
-            pkglicenses[pn].append(license)
+            pkglicenses[pn].append(node)
+
     outlicenses = {}
     for pkgname in packages:
-        # Assume AND operator between license files
-        license = ' & '.join(list(set(pkglicenses.get(pkgname, ['Unknown'])))) or 'Unknown'
-        if license == 'Unknown' and fallback_licenses and pkgname in fallback_licenses:
-            license = fallback_licenses[pkgname]
-        licenses = tidy_licenses(license)
-        license = ' & '.join(licenses)
-        outlines.append('LICENSE:%s = "%s"' % (pkgname, license))
-        outlicenses[pkgname] = licenses
+        if pkgname in pkglicenses:
+            lic = oe.spdx_license.AndOp.join(pkglicenses[pkgname]).sort().to_string()
+        elif fallback_licenses and pkgname in fallback_licenses:
+            lic = fallback_licenses[pkgname]
+        else:
+            lic = "Unknown"
+        outlines.append(f'LICENSE:{pkgname} = "{lic}"')
+        outlicenses[pkgname] = lic
     return outlicenses
 
 def generate_common_licenses_chksums(common_licenses, d):
     lic_files_chksums = []
-    for license in tidy_licenses(common_licenses):
+    for license in common_licenses:
         licfile = '${COMMON_LICENSE_DIR}/' + license
         md5value = bb.utils.md5_file(d.expand(licfile))
         lic_files_chksums.append('file://%s;md5=%s' % (licfile, md5value))
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 4d316d9a55..bf53edc08e 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -160,19 +160,19 @@ class NpmRecipeHandler(RecipeHandler):
         _get_package_licenses(srctree, "${PN}")
 
         return licfiles, packages, fallback_licenses
-    
-    # Handle the peer dependencies   
+
+    # Handle the peer dependencies
     def _handle_peer_dependency(self, shrinkwrap_file):
         """Check if package has peer dependencies and show warning if it is the case"""
         with open(shrinkwrap_file, "r") as f:
             shrinkwrap = json.load(f)
-        
+
         packages = shrinkwrap.get("packages", {})
         peer_deps = packages.get("", {}).get("peerDependencies", {})
-        
+
         for peer_dep in peer_deps:
             peer_dep_yocto_name = npm_package(peer_dep)
-            bb.warn(peer_dep + " is a peer dependencie of the actual package. " + 
+            bb.warn(peer_dep + " is a peer dependencie of the actual package. " +
             "Please add this peer dependencie to the RDEPENDS variable as %s and generate its recipe with devtool"
             % peer_dep_yocto_name)
 
@@ -283,7 +283,8 @@ class NpmRecipeHandler(RecipeHandler):
         (licfiles, packages, fallback_licenses) = self._handle_licenses(srctree, shrinkwrap_file, dev)
         licvalues = match_licenses(licfiles, srctree, d)
         split_pkg_licenses(licvalues, packages, lines_after, fallback_licenses)
-        fallback_licenses_flat = [license for sublist in fallback_licenses.values() for license in sublist]
+        fallback_licenses_flat = set(license for sublist in fallback_licenses.values() for license in sublist)
+        fallback_licesens_flat = sorted(fallback_licenses_flat).sort()
         extravalues["LIC_FILES_CHKSUM"] = generate_common_licenses_chksums(fallback_licenses_flat, d)
         extravalues["LICENSE"] = fallback_licenses_flat
 
-- 
2.54.0


