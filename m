Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E866C44515
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:00 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12402.1784134075274898509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FPTgdxvu;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-44aeefa1c00so3216322fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134074; x=1784738874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+t29PNxlXVhlZX2fByMuQV4cJGgkyTZDNRNzZ+IFMI=;
        b=FPTgdxvubvLm5XOkAGODlgIgPAGw/IWebvu+7wDBgTG3TIbGCP1dGu4UZj5psbWiPc
         FGj87ROdaLmeRf7Im4xxtHAtl/FWOjuw8mbwkf2N7joz0gtn00IKsaFMyy4E7aIbOsNN
         EWGPFIYIHoZsx2Yg/BYJZAUZp9U54SQAJV2ohhkCyCilPVmoAgCAuGMk4A3gaSmiLopW
         Z1rx9ZH/LkIFJk0x/cgQMYVi963eZysSBk2WgS7Mi4z8DgKjFyuwrgJOBmIJzG2G5JnL
         T3EW8Tb/XQ7M3/4p/l8MlFXy1Exjr5KGl7KgDFhoPAU3t6YFEXldWybpMgKVV6u0fgID
         ge+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134074; x=1784738874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x+t29PNxlXVhlZX2fByMuQV4cJGgkyTZDNRNzZ+IFMI=;
        b=E41aEGsPHsi200yruS1RXB+LBAtAVDwq/WubLU7iTwvuEWEwIYx/s5UdQB3vQR1wWx
         XEdAI2pQcg9vtRnmvLa60mF+qmKcUMteM0WCkMTJbl6oeVOO/oOpn6aIBRlOQFIJq4sT
         jr6fjuyDQZL0/2K5udoo72pA8iDc1jeb4ekUj4O8ILRX3x9XM4HE9QCzxeEv74LxbnrK
         7NLmHe4nF133NIsp6PUof7KGNc4DxMAhbLNR4ndUHF/rM9JZli7n9wR1G0x33GFA3LdA
         RREVLO4Cr62YekASgLAy6dtwZRf/B/DIvUBS1Sef3HM3mpnVGcRdHC+eumEWBu1UphmQ
         xoIw==
X-Gm-Message-State: AOJu0Yzc8vYe32YDk7Xt+nGj3lohovBx1xDZNotK6l87X2XFyBwh85K8
	575Fi5nQ/moHpG+dFNnfcXbeKYMT1paWVDPzv/Uw/Q7KoH9dDrk6gYAp6X1nHw==
X-Gm-Gg: AfdE7ck+kJ4JNfFJB/uSrm2F9NF1I/T3VeDj9ycveEThQkLfT/K12lHN3PNgqzy1C2V
	Z8HXmeMz7IlTgKcNTqZnL4uHfQCi6lZt4ECAbwbTHYfncs7bAH0Qgzm2f0vDtyogGgVdUtb1DQH
	dOOVbmJHRmjXtAE4aQ4dt+aQCi/cQrvVgpLAg0n7/nqy8myOi9SLTxgY3zX9w/3n2JNCP7u9PCl
	CnFWWyr34lFWMXI7gYlIX3XQW6sWRMCOEq/Gq0x1zcM5Yrmj1773LVMv3oOBvZrKQMC+80nA+tm
	oZTqpMC67h6UGnef+KFPpGKTDOjlZYG2sEyTkeBqM9LeaGjTwhVT9tltdwteo3VVmTFVkhNxeLA
	BCmyRSutnjZvXS3SoyhbDefsagDhFxAJ19P5nOKrS8uFXgndJB1BVQ4y7PB9wYVzUTscMk5QpkN
	pRIBVR9lNP
X-Received: by 2002:a05:6870:b4a1:b0:435:bfb7:695d with SMTP id 586e51a60fabf-45655ce3c64mr72228fac.27.1784134074307;
        Wed, 15 Jul 2026 09:47:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:53 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 17/25] lib: oe: license: Rework package licenses matching
Date: Wed, 15 Jul 2026 10:45:13 -0600
Message-ID: <20260715164739.364323-18-JPEWhacker@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241010

Reworks the way that package licenses matching works with the
INCOMPATIBLE_LICENSE and INCOMPATIBLE_LICENSE_EXCEPTIONS variable to
make it compatible with SPDX license expressions.

The primary wrinkle that makes this more difficult that the previous
code is that SPDX license exceptions are a combination of an actual
license WITH an exception (e.g. "GPL-3.0-or-later WITH
GCC-exception-3.1") where as previously this was a distinct license
(e.g. "GPL-3.0-with-GCC-exception"). This meant that the previous code
implicitly ignored *any* licenses with an exception that was listed in
INCOMPATIBLE_LICENSE. The new code tries to make this more precise,
while not breaking the way that INCOMPATIBLE_LICENSE and
INCOMPATIBLE_LICENSE_EXCEPTIONS work. Now, a license in
INCOMPATIBLE_LICENSE will match the LHS of a license with an exception,
but an exception listed in INCOMPATIBLE_LICENSE_EXCEPTIONS will match
the RHS, allowing the license *only* if it has that exception.

Practically speaking, this means that end users using
INCOMPATIBLE_LICENSE may now need to add the SPDX exceptions they are
willing to allow to INCOMPATIBLE_LICENSE_EXCEPTIONS in order to maintain
their builds. For example, to disallow all GPLv3 except for those with
the GCC exception, use:

    INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0*"
    INCOMPATIBLE_LICENSE_EXCEPTIONS = "GCC-exception-3.1"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/license_image.bbclass     |  29 ++--
 meta/lib/oe/license.py                        | 136 ++++++++++++++----
 .../oeqa/selftest/cases/incompatible_lic.py   |  24 ++++
 3 files changed, 147 insertions(+), 42 deletions(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index 258082c82a..7d00b1ae53 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -118,24 +118,27 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs):
     pkgarchs.reverse()
     incompatible_packages = []
 
-    exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
+    allow_licenses = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
     with open(license_manifest, "w") as license_file:
         for pkg in sorted(pkg_dic):
-            remaining_bad_licenses = oe.license.apply_pkg_license_exception(pkg, bad_licenses, exceptions)
-            incompatible_licenses = oe.license.incompatible_pkg_license(d, remaining_bad_licenses, pkg_dic[pkg]["LICENSE"])
-            if incompatible_licenses:
-                incompatible_packages.append("%s (%s)" % (pkg, ' '.join(incompatible_licenses)))
-            else:
-                incompatible_licenses = oe.license.incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
-                if incompatible_licenses:
-                    oe.qa.handle_error('license-exception', "Including %s with incompatible license(s) %s into the image, because it has been allowed by exception list." %(pkg, ' '.join(incompatible_licenses)), d)
             try:
-                (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
-                    oe.license.manifest_licenses(d, pkg_dic[pkg]["LICENSE"],
-                    remaining_bad_licenses)
-            except oe.license.LicenseError as exc:
+                node = oe.license.parse_legacy_license(d, pkg_dic[pkg]["LICENSE"])
+            except oe.spdx_license.ParseError as exc:
                 bb.fatal(exc.format(prefix=d.getVar("P") + ": "))
 
+            pkg_allow_licenses = oe.license.filter_pkg_license_list(pkg, allow_licenses)
+
+            if node:
+                if incompatible_licenses := oe.license.license_allowed(node, bad_licenses, pkg_allow_licenses):
+                    incompatible_packages.append("%s (%s)" % (pkg, ' '.join(n.to_string() for n in incompatible_licenses)))
+                elif incompatible_licenses := oe.license.license_allowed(node, bad_licenses, []):
+                    oe.qa.handle_error('license-exception', "Including %s with incompatible license(s) %s into the image, because it has been allowed by exception list." %
+                                       (pkg, ' '.join(n.to_string() for n in incompatible_licenses)), d)
+
+            (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
+                oe.license.manifest_licenses(d, pkg_dic[pkg]["LICENSE"],
+                                             bad_licenses, pkg_allow_licenses)
+
             if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
                 # Rootfs manifest
                 license_file.write("PACKAGE NAME: %s\n" % pkg)
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 9e59d82f8d..e4a860eff9 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -18,6 +18,71 @@ def license_ok(license, dont_want_licenses):
             return False
     return True
 
+def check_license_list(node, lst):
+    """
+    Checks a license node against a list if license identifiers. Returns True
+    if the node is in the list, and False if not
+    """
+    result = []
+    for i in lst:
+        if lic := oe.spdx_license.get_license(i):
+            if isinstance(node, oe.spdx_license.Identifier) and node.ident == lic["licenseId"]:
+                return True
+
+            if isinstance(node, oe.spdx_license.WithOp) and node.license.ident == lic["licenseId"]:
+                return True
+
+        elif lic := oe.spdx_license.get_exception(i):
+            if isinstance(node, oe.spdx_license.WithOp) and node.exception.ident == lic["licenseExceptionId"]:
+                return True
+
+        else:
+            if not i.startswith("LicenseRef-"):
+                # For legacy license matching
+                lic = "LicenseRef-" + i
+            else:
+                lic = i
+
+            if isinstance(node, oe.spdx_license.Identifier) and node.ident == lic:
+                return True
+
+    return False
+
+def license_allowed(node, disallowed, allowed):
+    """
+    Filters an SPDX license expression abstract syntax tree based on a list of
+    allowed and disallowed licenses, search through AND and OR conjunctions to
+    check for any path that allows the license to be allowed. If an individual
+    license is in the allowed list, or not in the disallowed list, it is
+    allowed. If the expression is not allowed, returns a list of nodes from the
+    expression for the licenses that caused the license to not be
+    allowed. If the expression is allowed, an empty list is returned.
+    """
+    def walk(n):
+        if isinstance(n, oe.spdx_license.AndOp):
+            return walk(n.left) + walk(n.right)
+
+        if isinstance(n, oe.spdx_license.OrOp):
+            lst = walk(n.left)
+            if not lst:
+                return []
+            return walk(n.right)
+
+        if isinstance(n, oe.spdx_license.CompoundExpression):
+            return walk(n.child)
+
+        if isinstance(n, (oe.spdx_license.WithOp, oe.spdx_license.Identifier)):
+            if check_license_list(n, allowed):
+                return []
+            if check_license_list(n, disallowed):
+                return [n]
+            return []
+
+        raise Exception(f"Unknown node type {n.__class__.__name__}")
+
+    return walk(node)
+
+
 def obsolete_license_list():
     return ["AGPL-3", "AGPL-3+", "AGPLv3", "AGPLv3+", "AGPLv3.0", "AGPLv3.0+", "AGPL-3.0", "AGPL-3.0+", "BSD-0-Clause",
             "GPL-1", "GPL-1+", "GPLv1", "GPLv1+", "GPLv1.0", "GPLv1.0+", "GPL-1.0", "GPL-1.0+", "GPL-2", "GPL-2+", "GPLv2",
@@ -101,7 +166,7 @@ def is_included(d, licensestr, include_licenses=None, exclude_licenses=None):
     else:
         return True, included
 
-def manifest_licenses(d, licensestr, dont_want_licenses):
+def manifest_licenses(d, licensestr, disallowed, allowed):
     """Given a license string and dont_want_licenses list,
        return license string filtered and a list of licenses"""
 
@@ -111,13 +176,20 @@ def manifest_licenses(d, licensestr, dont_want_licenses):
     def walk_license(node):
         nonlocal licenses
         if isinstance(node, oe.spdx_license.Identifier):
-            if license_ok(node.ident, dont_want_licenses):
-                licenses.append(node.ident)
+            if not license_allowed(node, disallowed, allowed):
+                licenses.append(node.to_string())
                 return node
+            return None
 
+        if isinstance(node, oe.spdx_license.WithOp):
+            if not license_allowed(node, disallowed, allowed):
+                licenses.append(node.license.to_string())
+                licenses.append(node.exception.to_string())
+                return node
             return None
 
         old_children = node.children
+
         node.children = []
 
         for child in old_children:
@@ -134,12 +206,6 @@ def manifest_licenses(d, licensestr, dont_want_licenses):
             if node.right is None:
                 return node.left
 
-        # The left side (the license side) of a WITH can be removed, but not
-        # the right (the exception)
-        if isinstance(node, oe.spdx_license.WithOp):
-            if node.license is None:
-                return None
-
         # If one of the above cases doesn't catch everything, raise an error
         if not all(node.children):
             node.children = old_children
@@ -172,11 +238,6 @@ def list_licenses(licensestr, d):
     walk_license(parse_legacy_license(d, licensestr))
     return set(licenses)
 
-def apply_pkg_license_exception(pkg, bad_licenses, exceptions):
-    """Return remaining bad licenses after removing any package exceptions"""
-
-    return [lic for lic in bad_licenses if pkg + ':' + lic not in exceptions]
-
 def return_spdx(d, license):
     """
     This function returns the spdx mapping of a license if it exists.
@@ -215,12 +276,6 @@ def expand_wildcard_licenses(d, wildcard_licenses):
 
     return list(licenses)
 
-def incompatible_license_contains(d, license, truevalue, falsevalue):
-    license = canonical_license(d, license)
-    bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
-    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
-    return truevalue if license in bad_licenses else falsevalue
-
 def incompatible_pkg_license(d, dont_want_licenses, license):
     def walk_license(node):
         if isinstance(node, oe.spdx_license.Identifier):
@@ -486,6 +541,23 @@ def check_license_format(d):
             oe.qa.handle_error("license-format",
                             f'{pn}: {v} value has an invalid format:\n{e.format()}\n', d)
 
+def filter_pkg_license_list(pkg, lst):
+    """
+    Given a list of license IDs and a package, returns the list of license IDs
+    that apply to the package by looking for a package prefix
+    """
+    pkg_lst = []
+    for e in lst:
+        if ":" not in e:
+            pkg_lst.append(e)
+            continue
+
+        p, l = e.split(":", 1)
+        if pkg == p:
+            pkg_lst.append(l)
+
+    return pkg_lst
+
 def skip_incompatible_package_licenses(d, pkgs):
     if not pkgs:
         return {}
@@ -507,21 +579,27 @@ def skip_incompatible_package_licenses(d, pkgs):
 
     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
 
-    exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
+    allow_licenses = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
 
-    for lic_exception in exceptions:
-        if ":" in lic_exception:
-            lic_exception = lic_exception.split(":")[1]
-        if lic_exception in obsolete_license_list():
-            bb.fatal("Obsolete license %s used in INCOMPATIBLE_LICENSE_EXCEPTIONS" % lic_exception)
+    for lic in allow_licenses:
+        if ":" in lic:
+            lic = lic.split(":")[1]
+        if lic in obsolete_license_list():
+            bb.fatal("Obsolete license %s used in INCOMPATIBLE_LICENSE_EXCEPTIONS" % lic)
 
     skipped_pkgs = {}
     for pkg in pkgs:
-        remaining_bad_licenses = apply_pkg_license_exception(pkg, bad_licenses, exceptions)
+        pkg_lic = d.getVar("LICENSE:%s" % pkg) if pkg else None
+        if not pkg_lic:
+            pkg_lic = d.getVar('LICENSE')
+
+        node = parse_legacy_license(d, pkg_lic)
+        if not node:
+            continue
 
-        incompatible_lic = incompatible_license(d, remaining_bad_licenses, pkg)
+        incompatible_lic = license_allowed(node, bad_licenses, filter_pkg_license_list(pkg, allow_licenses))
         if incompatible_lic:
-            skipped_pkgs[pkg] = incompatible_lic
+            skipped_pkgs[pkg] = [lic.to_string() for lic in incompatible_lic]
 
     return skipped_pkgs
 
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 5467640cdd..406f92e37b 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -3,6 +3,7 @@
 #
 # SPDX-License-Identifier: MIT
 #
+import textwrap
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 from oeqa.core.decorator.data import skipIfNotFeature
@@ -135,6 +136,25 @@ NO_GENERIC_LICENSE[SomeLicense] = "COPYING"
 
         bitbake('core-image-minimal')
 
+    def test_spdx_exception(self):
+        # Change bash license to have an SPDX exception, which will fail
+        self.write_config(self.default_config() + textwrap.dedent(
+            """\
+            LICENSE:pn-bash = "GPL-3.0-or-later WITH GCC-exception-3.1"
+            """))
+
+        result = bitbake('core-image-minimal', ignore_status=True)
+        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Some packages cannot be installed into the image because they have incompatible licenses:\n\tbash (GPL-3.0-or-later WITH GCC-exception-3.1)"
+
+        # The SPDX exception can be explicitly allowed in INCOMPATIBLE_LICENSE_EXCEPTIONS
+        self.write_config(self.default_config() + textwrap.dedent(
+            """\
+            LICENSE:pn-bash = "GPL-3.0-or-later WITH GCC-exception-3.1"
+            INCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal = "GCC-exception-3.1"
+            ERROR_QA:remove:pn-core-image-minimal = "license-exception"
+            """))
+        bitbake('core-image-minimal')
+
 class NoGPL3InImagesTests(OESelftestTestCase):
     def test_core_image_minimal(self):
         self.write_config("""
@@ -150,6 +170,10 @@ require conf/distro/include/no-gplv3.inc
 IMAGE_CLASSES += "testimage"
 INCOMPATIBLE_LICENSE:pn-core-image-full-cmdline = "GPL-3.0* LGPL-3.0*"
 INCOMPATIBLE_LICENSE:pn-core-image-weston = "GPL-3.0* LGPL-3.0*"
+INCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-full-cmdline = "GCC-exception-3.1"
+INCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-weston = "GCC-exception-3.1"
+ERROR_QA:remove:pn-core-image-weston = "license-exception"
+ERROR_QA:remove:pn-core-image-full-cmdline = "license-exception"
 
 require conf/distro/include/no-gplv3.inc
 """)
-- 
2.54.0


