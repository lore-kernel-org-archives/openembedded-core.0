Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10705.1793364621248983060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 05:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qBXnF7dD;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso991696f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 05:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793364619; x=1793969419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d2XNzukxF0/pOBOCU7fVcOKiqqtpvZ0OhfHl4FlYCDc=;
        b=qBXnF7dDeXkK2gJoidYQuKACt45Vx+cEwawQYmsj+nFZCk208jgHyIynCmf1T61abT
         v8RWXccLA+3X9JAnbElmjOWrVCQm7d5zwTl31kCob9ggVlqDeVz3jLsvPaC/XGJE3gpQ
         +bmXO8AWxcMTtF5f/gsT6XK20EMWLb9VmQjnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364619; x=1793969419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d2XNzukxF0/pOBOCU7fVcOKiqqtpvZ0OhfHl4FlYCDc=;
        b=OQUBNY4HkgM3av3c2U1kqo/FxSvEPcU0WoLePWjAY3P27+DSrKWotRTPJoFHVsnRY6
         iDlJRocgIDzxfCtmzX2Hyk7jkc1Y5AM7eyaLnOsI7CjdP7L6p4iZty7NYBaaEsMGyHXx
         fGIMxYF2ZaD9iiby72NxYNYLqNrCYUd7A+YJS7LuVX8OhSnOn/Z2pJtZdKTDId3p3LbE
         TUEArDSMINe9TYy9d5XGkuHKvwNCgtgvZwyi7B38G2+2MsGOisFQyXmJu9IH4dT8pk1k
         HGxL2sTJIwwkJEB1naGbnMmOQ2Y3u/jDThNp+WM5mkfA6WHu6/8O6I8OtBKcG2de5NyN
         sWzQ==
X-Gm-Message-State: AFq9FYK6IS/53B/oP2TBWOoHrbMpW1TKux5dNk80GEPpDvx5JsQx0/zQ
	Xf2CrCdgUfyXxXZABvu7hSCOMBsQzOQ1x18/JG+20h9/K+piA5LkVeZ5v+xRQqGOGApHQrg7cBB
	mmfxe
X-Gm-Gg: AYBFou2TjBszFC96S4G0lQWY1RsoTVS9bPmvBr5Z0yW/EozJSNSQiB/bIKG0ZORfD+9
	gtxWqwasGJ9Mdpm5uIRAn34O2hDoNWlRk2zo0s71fP/kN99JspbKt68Cj/kfbEobvQuUdNdkLpX
	eBJWkeanM0RH01dMXKPRX1mtxPuQDx4hCFksG1csTpPdbVh0IUfYRhSZfB9BZZcpw00YtZ+xNIz
	wyboX9GFcGSTt6A49HMpjOFlttZwU7sBZNtqTh/T8qLPiP+aOUpRnT/3ZuTYl9DNMdUJGLYA8qm
	e/oMYI/nhHcdDbYOht4vDWiPqgxw2WjFgT4v2wzk1C/zcMIl4bUc097mrcfMPBVnKRjJzgPPvN+
	M2HrrgkPGG4IF/n81saz2yiILJHrcptgkh/vTsiXsIxjQl5n0jtZ+2lRQHhj+ndgCGuwB6NqAl+
	cqHwPA5a2r6iKKo2x2bqM/ZVW1AmXH00bKKHxM8OAOhdaJ7gNGrnhok7aYzcj6Z+9nyPiV2hQr7
	OhRlo1tIQMLmeecODHDwjMGfjlLT3JhpkmoBep1kdSkH6Cn+cmAf8LING0ii4MTJc7sWfs60d1l
	EyKQW1DpSBHczCpemaI2zs5qiuC8ZGfLFFo98XEmhiW7RjmfweEY3OrQbE7eA7QbRJkzFeh3983
	myHRMdWjAVEyruwU7fRmFp5XTCdN3Mshn9S9xKe/gDl8Wtc87gmkvV3DfQWuWBWcPs/6HVgcZy9
	c=
X-Received: by 2002:a5d:5f03:0:b0:48e:1b11:7ee6 with SMTP id ffacd0b85a97d-48e6e27eb97mr5916528f8f.2.1793364618989;
        Fri, 30 Oct 2026 05:50:18 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm3175951f8f.20.2026.10.30.05.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:50:18 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCHv2] recipetool: Drop PYPI_PACKAGE if it matches BPN
Date: Fri, 30 Oct 2026 14:50:15 +0200
Message-ID: <20261030125015.999057-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 12:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249034
Content-Type: text/plain; charset="utf-8"

PYPI_PACKAGE was always added to recipes created for PyPI sources
because the recipe name is not known yet when the source URL is
processed. Since PYPI_PACKAGE is now the normalised package name
and pypi.bbclass derives it from BPN by default, it is redundant in
the common case.

Add a cleanup() hook to RecipeHandler which create_recipe() calls
for every handler once the recipe name and version have been
determined, so that handlers can drop values from extravalues that
turn out to be redundant. The default implementation does nothing.

Implement cleanup() in PythonRecipeHandler to drop PYPI_PACKAGE if
it matches the default value from pypi.bbclass. This keeps the
Python-specific logic in the Python plugin instead of adding it to
the generic create.py.

Before:

devtool add python3-tibs https://pypi.org/project/tibs
grep ^PYPI_PACKAGE python3-tibs_2.0.2.bb
PYPI_PACKAGE = "tibs"

After:

devtool add python3-tibs https://pypi.org/project/tibs
grep ^PYPI_PACKAGE python3-tibs_2.0.2.bb

However, it still sets PYPI_PACKAGE and PYPI_PACKAGE_SDIST where
needed, for example in a recipe for python-magic:

devtool add python3-magic https://pypi.org/project/python-magic/
grep ^PYPI_PACKAGE python3-magic_0.4.27.bb
PYPI_PACKAGE = "python-magic"
PYPI_PACKAGE_SDIST = "python-magic"

AI-Generated: Uses Claude Code
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py    |  3 +++
 scripts/lib/recipetool/create.py              | 11 ++++++++++
 .../lib/recipetool/create_buildsys_python.py  | 22 ++++++++++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index ca05e54593..54b7cb3a65 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -597,6 +597,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] = 'BSD-3-Clause'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=702b1ef12cf66832a88f24c8f2ee9c19'
         checkvars['SRC_URI[sha256sum]'] = 'c225b674c83fa923be93d235330ce0300373d02885cef23238813b0d5668304a'
+        checkvars['PYPI_PACKAGE'] = None
         checkvars['PYPI_PACKAGE_SDIST'] = None
         inherits = ['python_setuptools_build_meta', 'pypi']
 
@@ -621,6 +622,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] = 'GPL-3.0-only'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464'
         checkvars['SRC_URI[sha256sum]'] = '81f7c0c5559becc8049470d86046b36e96113637bcbe4753ecef06977c00245d'
+        checkvars['PYPI_PACKAGE'] = None
         checkvars['PYPI_PACKAGE_SDIST'] = None
         inherits = ['python_setuptools_build_meta', 'pypi']
 
@@ -644,6 +646,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] = 'BSD-2-Clause'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE.txt;md5=b11cf936853a71258d4b57bb1849a3f9'
         checkvars['SRC_URI[sha256sum]'] = 'ab9c8f1080391e231812d20abf2657a69ee35574563b1014414f953964a95fa3'
+        checkvars['PYPI_PACKAGE'] = None
         checkvars['PYPI_PACKAGE_SDIST'] = None
         inherits = ['python_setuptools_build_meta', 'pypi']
 
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index bf533a45cf..e0da96dea0 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -261,6 +261,14 @@ class RecipeHandler(object):
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         return False
 
+    def cleanup(self, pn, pv, classes, extravalues):
+        '''
+        Called once the recipe name and version have been determined, so
+        that handlers can drop values from extravalues that turn out to
+        be redundant.
+        '''
+        pass
+
 
 def validate_pv(pv):
     if not pv or '_version' in pv.lower() or pv[0] not in '0123456789':
@@ -795,6 +803,9 @@ def create_recipe(args):
         if name_pv and not realpv:
             realpv = name_pv
 
+    for handler in handlers:
+        handler.cleanup(pn, realpv, classes, extravalues)
+
     handle_license_vars(srctree_use, lines_before, handled, extravalues, tinfoil.config_data)
 
     if not outfile:
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 4fc96db7e8..0fc9b2b58c 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -180,7 +180,8 @@ class PythonRecipeHandler(RecipeHandler):
             if required_version and version != required_version:
                 raise Exception("Version specified using --version/-V (%s) and version specified in the url (%s) do not match" % (required_version, version))
             # PYPI_PACKAGE is optional if BPN looks like "python-<pypi_package>" or "python3-<pypi_package>" (see pypi.bbclass)
-            # but at this point we cannot know because because user can specify the output name of the recipe on the command line
+            # but at this point we cannot know because the user can specify the output name of the recipe on the command line,
+            # so it is set here and dropped later in cleanup() once the recipe name is known
             pypi_package = self.pypi_normalise(pypi_package)
             extravalues["PYPI_PACKAGE"] = pypi_package
             # Some sdists don't use normalised names, so check and set PYPI_PACKAGE_SDIST if needed
@@ -205,6 +206,25 @@ class PythonRecipeHandler(RecipeHandler):
         handled.append('url')
         return fetch_uri
 
+    def cleanup(self, pn, pv, classes, extravalues):
+        """
+        PYPI_PACKAGE is not needed if it matches the default derived from BPN (see pypi.bbclass)
+        """
+        if not pn or 'pypi' not in classes or not extravalues.get('PYPI_PACKAGE'):
+            return
+
+        bpn = pn
+        if bpn.endswith('-native'):
+            bpn = bpn[:-len('-native')]
+        if bpn.startswith('nativesdk-'):
+            bpn = bpn[len('nativesdk-'):]
+        for prefix in ('python-', 'python3-'):
+            if bpn.startswith(prefix):
+                bpn = bpn[len(prefix):]
+                break
+        if self.pypi_normalise(bpn) == extravalues['PYPI_PACKAGE']:
+            del extravalues['PYPI_PACKAGE']
+
     def handle_classifier_license(self, classifiers, existing_licenses=""):
 
         licenses = []
-- 
2.47.3

