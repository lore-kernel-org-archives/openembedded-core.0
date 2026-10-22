Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6009.1792694181554311518
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 11:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nuBS50Xd;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so890945e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 11:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792694180; x=1793298980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=806G2IsOAB9WAN/g8d5Fc7MdhGmu3sTMTzlTVXwS7P8=;
        b=nuBS50XdHAAeVyWHgaWMyI3qZKS0dGRNS73nmiTWxNyCBGL8aT3q7Dcz2CugjwHwCl
         mRYY8YbcFWbdDP/iD7N0I0tEwLMDBvaFkI+bCThmCLD1zBwVtZtIv58eyR4AeGmGsFNU
         v0fgmlblHiMNDTzjOliDxjQlK/Q9AzZ3RJ6E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694180; x=1793298980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=806G2IsOAB9WAN/g8d5Fc7MdhGmu3sTMTzlTVXwS7P8=;
        b=rxVFfJIkEnZV+u6q7nRFgMcgkHCg3OKl/SHUFLGWXHnI8y0+M2/+GkqAW/McZmoncS
         V1ohk5W1Rsj0WTaA6Q0+uibzxxrhx75j0bL8Ww0lVfzGL15NxxcYEOxCJ3FlRgEthmYI
         69/vQOeJyeLnh7mdaNJ2ed7CB4rZZ59Ny3V1Yyqsl/DeDB66aC2WsuoShBtiu5RMZ69F
         XSPo3aiWfRqias9q7UXhgWT/E6pbv0hxt5IfHx/0zxnSGvjYPiwQ4ZDvx1FA+leVwcsM
         t45KftRAlh7Nucs8Pmj2OljTB+2SwdkHgH/C1NSPuqS3hWrJggG8RZCelZQJHyItg/tK
         +/9w==
X-Gm-Message-State: AFq9FYL7k7Dnjw9eVhD9gECoB0gkbgQ/7cG/Cc3NeTXFHcK+afdrG3dg
	P1ZuNxV+6ST2tKP6zblup63N3xzaqzQl3JijEdihoXL4bwIXbgZ0MVK6vEx03vxBpIUCG3Pqn5r
	Seke8
X-Gm-Gg: AYBFou0K1F03xM52EMcQZP22M0OCCCv6TpUOB8ylXeXqJ52hav7SiE/8yv8EEiiheSX
	QdVT1i3msG0p88SnYveBHpBDNF4hgNKlQSn1V3ueafuS9b9gcekYvbcUSsUpC2wrxg4Q4T4zqaH
	MUNxV7cFIUnrC9Uow66wQoFompPulANkWQNtQxyhm8NVoHLBHxWu8Beeuj9Npw8O8ZZLALXMCIm
	hPnuRwu+5Ra1oW8IOAM1bmoaeWz9sgM0DRLnWWDQURdQbZvxAXp/iskzEXZghujwUAkFRAjcqw8
	ujd3K+aPzHiuoec11vEeb0vUVHvsb0BO3uR2/QXk16Sp9bozAs4NSAUCL8twRsBjIo9efoC3PEL
	plfTCeAFM6XG0p41oD+ai797Mk7dD4d91oNFrqb2DutwGLhf6ZY8vO9DOsVW51rYPUJ/4n2OCeS
	OSLVhfMRg8n6lRUJOygQ32IQaxwFO1o7/4gscT8P2uzRV3S8tu20PWB6tnwIHXliMNl0NMt/zuM
	B7qE5Ke5qeIkgNUA9BP5JfrHSEOrgTuO0td0ruiPo5KNOctooM+pkOwKENCpu31qG77DJoSA9RT
	ICTyOzBYQUCjBTax2ZqjOapR/bKe8ZRLrHF6th4g0h1t64P0PfOLq/24+fNqJzm1E64riQwxHJ0
	+Jxku
X-Received: by 2002:a05:600c:3ba0:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4a1fdb078ebmr149288105e9.5.1792694179717;
        Thu, 22 Oct 2026 11:36:19 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b524sm15303475e9.14.2026.10.22.11.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:36:19 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 3/3] recipetool: Drop PYPI_PACKAGE if it matches BPN
Date: Thu, 22 Oct 2026 21:36:08 +0300
Message-ID: <20261022183608.3500655-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022183608.3500655-1-leon.anavi@konsulko.com>
References: <20261022183608.3500655-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 18:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248454
Content-Type: text/plain; charset="utf-8"

PYPI_PACKAGE was always added to recipes created for PyPI sources
because the recipe name is not known yet when the source URL is
processed. Since PYPI_PACKAGE is now the normalised package name
and pypi.bbclass derives it from BPN by default, it is redundant in
the common case.

Once the recipe name has been determined, drop PYPI_PACKAGE if it
matches the default value from pypi.bbclass.

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
 meta/lib/oeqa/selftest/cases/recipetool.py       |  3 +++
 scripts/lib/recipetool/create.py                 | 14 ++++++++++++++
 scripts/lib/recipetool/create_buildsys_python.py |  3 ++-
 3 files changed, 19 insertions(+), 1 deletion(-)

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
index bf533a45cf..3baf19c7c2 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -795,6 +795,20 @@ def create_recipe(args):
         if name_pv and not realpv:
             realpv = name_pv
 
+    # PYPI_PACKAGE is not needed if it matches the default derived from BPN (see pypi.bbclass)
+    if pn and 'pypi' in classes and extravalues.get('PYPI_PACKAGE'):
+        bpn = pn
+        if bpn.endswith('-native'):
+            bpn = bpn[:-len('-native')]
+        if bpn.startswith('nativesdk-'):
+            bpn = bpn[len('nativesdk-'):]
+        for prefix in ('python-', 'python3-'):
+            if bpn.startswith(prefix):
+                bpn = bpn[len(prefix):]
+                break
+        if re.sub(r"[-_.]+", "-", bpn).lower() == extravalues['PYPI_PACKAGE']:
+            del extravalues['PYPI_PACKAGE']
+
     handle_license_vars(srctree_use, lines_before, handled, extravalues, tinfoil.config_data)
 
     if not outfile:
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 4fc96db7e8..d53a6205bf 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -180,7 +180,8 @@ class PythonRecipeHandler(RecipeHandler):
             if required_version and version != required_version:
                 raise Exception("Version specified using --version/-V (%s) and version specified in the url (%s) do not match" % (required_version, version))
             # PYPI_PACKAGE is optional if BPN looks like "python-<pypi_package>" or "python3-<pypi_package>" (see pypi.bbclass)
-            # but at this point we cannot know because because user can specify the output name of the recipe on the command line
+            # but at this point we cannot know because the user can specify the output name of the recipe on the command line,
+            # so it is set here and dropped later in create_recipe() once the recipe name is known
             pypi_package = self.pypi_normalise(pypi_package)
             extravalues["PYPI_PACKAGE"] = pypi_package
             # Some sdists don't use normalised names, so check and set PYPI_PACKAGE_SDIST if needed
-- 
2.47.3

