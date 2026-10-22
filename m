Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5969.1792694180869516356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 11:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LW9RrZiR;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso8020205e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 11:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792694179; x=1793298979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9gIQIs8pWCHlLczUlu/+XCkVgh/hLWaV6spcm6TE1Q=;
        b=LW9RrZiRqqDm8q47ipl4QJDG3GsAkzaw9ir13Go7y6QTgU5OFxZGjNjO8CrKgTixDT
         2zsI8eJ7rkWT6R0PzOiyigAcfEAiaGqO0Jz0HxferejyT83xOMwENV9RZmxKBGehddr3
         8ZtlWdJd4hqb9a/1ek52cYuzHEtFM3S7jeotc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694179; x=1793298979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9gIQIs8pWCHlLczUlu/+XCkVgh/hLWaV6spcm6TE1Q=;
        b=rwepFDf4lbUDKLqS4sJiMj9vlO8NzAKhTaBKrod5kMrHR/W4qwDeXAt159PW5tn5wS
         gGo9Z7w68i7/5ATb2f1W04c6CTIGuyCLnOtzUaY/77yFhDyPqK5aLYJAovBVEF5onDrX
         22ArtxpJRxZJSmTjn6bA5tBa/ttUk5rCNYIAEhC7Oq5o83Fbs1QPGSH+KgdGnwOuR+A+
         mf7eGJ9qC/wl6d/+QmtTqex7NL4VSAkSqV0KdUXyicge/nDh/gswdtivmbQL9jivgSvE
         E8YwfsDzDpWae6knflScbjiwcInHguwWZffMpsQ6MBbz7xrdPqPI0K0dFyWXocPgfi2L
         wjmA==
X-Gm-Message-State: AFq9FYKV/xSKCF2bzEwTeXGWHp8JdTdj+gYJCJESjOI+wasG+JusfuEm
	1pEujYcCnCVqS3PVv2bZC2b2FptFZjK8Ei++piwnTC0T54qP3X98HXJT1u3g4O+QBa/AnFU/10U
	8YZ3Q
X-Gm-Gg: AYBFou3/NUkm0hPxFXJ6b7lgeugnRjVBc4Jrl2Si8d66LkpQCKZSEEIBJoYqp68RwmN
	nfs08bKLYhYt5+DY1qTJ7Utso/IpslcZcfi8sc8CX9JWjA//Djo1X9Aq1zea/o1INlDTUsUdCnn
	BJLutvTTs+zb0HeViytyeOrB8Ecl5ft7ZUrxjzceKONrYsBmUHomL8XXyiwyJ9yEipNCBTUd5n1
	2jwsD7LAIYOnwmhLD+La3KmbJijdA55JHAD1+nOxjOTEUTZMoa8ubA9DWnzn4yXreauwA1wcTht
	htYPobTbTKNfZoiFIj9W9rGZCsiqqSLLiMDcSMKbLF0aECLHSEcwaIPe9XcbigppL3SMAsCYdmo
	W8jugo8QrXbq7mLHgxhl4M3Zu8MPA+jjxh5/FcsCFNa0Bj7ui3nbwcvf3CBXshlFuBDyut1pzYD
	WiZUpzfUOVfRvGhmaaX9j9oSLQkwI/twrRQE+iKYbHB7yQrx5FDyZGLY+Lnes9l8ZaFlWHvNa3J
	w8rPSDb4w/2pJpYdFQsvUaSaPF5b0PO3JPvpwqJNqEpEk3DHPUNm5RWoNQKKcRX7evVr/d7SFEc
	LIiUMArCvYkKd5QPTGh/xliFTOxbP4FBy8ilIS55Dysw8gjGb1yiJ/IYrObwKWFrx4VMTYriJLf
	Uc5Av
X-Received: by 2002:a05:600c:1d07:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a204a8f4camr57059925e9.2.1792694178805;
        Thu, 22 Oct 2026 11:36:18 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b524sm15303475e9.14.2026.10.22.11.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:36:18 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 2/3] recipetool: Fix sdist name detection from PyPI
Date: Thu, 22 Oct 2026 21:36:07 +0300
Message-ID: <20261022183608.3500655-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022183608.3500655-1-leon.anavi@konsulko.com>
References: <20261022183608.3500655-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 18:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248453
Content-Type: text/plain; charset="utf-8"

The sdist name used to decide whether PYPI_PACKAGE_SDIST needs to
be set was determined incorrectly:

- For pypi.org project URLs the release filename was split on
  every '-', so python-magic-0.4.15.tar.gz resulted in
  PYPI_PACKAGE_SDIST = "python".

- For files.pythonhosted.org URLs the name was taken from
  determine_from_url(), which lowercases it and replaces '_' with
  '-'. For sphinxcontrib_svg2pdfconverter-2.0.0.tar.gz this set
  PYPI_PACKAGE_SDIST to the hyphenated name although the sdist
  uses the standard underscore form and the variable is not
  needed.

In both cases the generated recipe fetches from a non-existent URL.

Before:

devtool add python3-magic https://pypi.org/project/python-magic/
bitbake python3-magic -e | grep ^PYPI_PACKAGE
PYPI_PACKAGE="python-magic"
PYPI_PACKAGE_EXT="tar.gz"
PYPI_PACKAGE_SDIST="python"

devtool add python3-sphinxcontrib-svg2pdfconverter https://files.pythonhosted.org/packages/b9/05/11b12853b6a0398bd19d5464b68cb97dde21c354265ff2c1929f92ae03a9/sphinxcontrib_svg2pdfconverter-2.1.0.tar.gz
bitbake python3-sphinxcontrib-svg2pdfconverter -e | grep ^PYPI_PACKAGE
PYPI_PACKAGE="sphinxcontrib-svg2pdfconverter"
PYPI_PACKAGE_EXT="tar.gz"
PYPI_PACKAGE_SDIST="sphinxcontrib-svg2pdfconverter"

After:

devtool add python3-magic https://pypi.org/project/python-magic/
bitbake python3-magic -e | grep ^PYPI_PACKAGE
PYPI_PACKAGE="python-magic"
PYPI_PACKAGE_EXT="tar.gz"
PYPI_PACKAGE_SDIST="python-magic"

devtool add python3-sphinxcontrib-svg2pdfconverter https://files.pythonhosted.org/packages/b9/05/11b12853b6a0398bd19d5464b68cb97dde21c354265ff2c1929f92ae03a9/sphinxcontrib_svg2pdfconverter-2.1.0.tar.gz
bitbake python3-sphinxcontrib-svg2pdfconverter -e | grep ^PYPI_PACKAGE
PYPI_PACKAGE="sphinxcontrib-svg2pdfconverter"
PYPI_PACKAGE_EXT="tar.gz"
PYPI_PACKAGE_SDIST="sphinxcontrib_svg2pdfconverter"

Split only on the last '-' and use the name exactly as it appears
in the filename.

Fixes: 52779aa8b5 ("recipetool: set PYPI_PACKAGE_SDIST if needed")

AI-Generated: Uses Claude Code
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py       | 7 +++++++
 scripts/lib/recipetool/create_buildsys_python.py | 8 +++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 5a9fc8ea67..ca05e54593 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -511,6 +511,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
         checkvars['SRC_URI[sha256sum]'] = 'f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5'
         checkvars['PYPI_PACKAGE'] = pn
+        checkvars['PYPI_PACKAGE_SDIST'] = pn
         inherits = ['setuptools3', 'pypi']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
@@ -533,6 +534,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
         checkvars['SRC_URI[sha256sum]'] = 'f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5'
         checkvars['PYPI_PACKAGE'] = pn
+        checkvars['PYPI_PACKAGE_SDIST'] = pn
         inherits = ['setuptools3', "pypi"]
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
@@ -547,6 +549,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
         checkvars['SRC_URI[sha256sum]'] = 'f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5'
         checkvars['PYPI_PACKAGE'] = pn
+        checkvars['PYPI_PACKAGE_SDIST'] = pn
         inherits = ['setuptools3', "pypi"]
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
@@ -572,6 +575,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars = {}
         checkvars['LICENSE'] = 'MIT'
         checkvars['PYPI_PACKAGE'] = pn
+        checkvars['PYPI_PACKAGE_SDIST'] = pn
         inherits = ['setuptools3', "pypi"]
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
@@ -593,6 +597,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] = 'BSD-3-Clause'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=702b1ef12cf66832a88f24c8f2ee9c19'
         checkvars['SRC_URI[sha256sum]'] = 'c225b674c83fa923be93d235330ce0300373d02885cef23238813b0d5668304a'
+        checkvars['PYPI_PACKAGE_SDIST'] = None
         inherits = ['python_setuptools_build_meta', 'pypi']
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -616,6 +621,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] = 'GPL-3.0-only'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464'
         checkvars['SRC_URI[sha256sum]'] = '81f7c0c5559becc8049470d86046b36e96113637bcbe4753ecef06977c00245d'
+        checkvars['PYPI_PACKAGE_SDIST'] = None
         inherits = ['python_setuptools_build_meta', 'pypi']
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -638,6 +644,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] = 'BSD-2-Clause'
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE.txt;md5=b11cf936853a71258d4b57bb1849a3f9'
         checkvars['SRC_URI[sha256sum]'] = 'ab9c8f1080391e231812d20abf2657a69ee35574563b1014414f953964a95fa3'
+        checkvars['PYPI_PACKAGE_SDIST'] = None
         inherits = ['python_setuptools_build_meta', 'pypi']
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 81ceaed47a..4fc96db7e8 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -162,7 +162,7 @@ class PythonRecipeHandler(RecipeHandler):
                 for release in reversed(data["releases"][version]):
                     if release["packagetype"] == "sdist":
                         fetch_uri = release["url"]
-                        sdist = release["filename"].rsplit("-")[0]
+                        sdist = release["filename"].rsplit("-", 1)[0]
                         break
             else:
                 logger.warning("Cannot handle pypi url %s: cannot fetch package information using %s", source, json_url)
@@ -171,8 +171,10 @@ class PythonRecipeHandler(RecipeHandler):
             match = re.match(r'^https?://files.pythonhosted.org/packages.*/(.*)-.*$', source)
             if match:
                 fetch_uri = source
-                pypi_package = match.group(1)
-                sdist, version = determine_from_url(fetch_uri)
+                # The sdist name as found in the filename, not normalised
+                sdist = match.group(1)
+                pypi_package = sdist
+                _, version = determine_from_url(fetch_uri)
 
         if match and not args.no_pypi:
             if required_version and version != required_version:
-- 
2.47.3

