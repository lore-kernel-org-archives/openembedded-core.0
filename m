Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6332.1795182842366178423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RyV1pOHs;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491971ac844so783957f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 05:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182841; x=1795787641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVb0RBjObLWKOF1sdMvbn7+00s1R4c3PODXt9WvlTXg=;
        b=RyV1pOHs8tMAQ3j+zcqNiC/E7aRzI6v5I5ykz7klQrg42mtVOxkwa+pzBpgwlq9qaz
         8GQlBmPMNVAnH7mY0mgkLCdI7PHKEL8gx3v5XFh1cPOqrAxCD6pDjS4T6bSKkzwNgK8q
         NuwWz2eF+nfLeehjoZwfBG+CI4btVYPDsPALnKLjg6PaStQRWq+CZmG4kVLw0j9EsXKA
         bQI8isLjXqgMSpOlHs3Le64CE3XUX/u02c7fB+RINIkFlGzvw5OsEgMKn9t+13g+SKFI
         eCjOo20jYySyFfczQeomTOcmhWYqNQ4qmMa4XYeKQfBqmjsKSn4ATmORcXxxpM/gJmLE
         EDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182841; x=1795787641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVb0RBjObLWKOF1sdMvbn7+00s1R4c3PODXt9WvlTXg=;
        b=YtcWXlol2JgJ1x1XevagBd7Up+r4b1hSqxyt7Q48b4hvhs3g6UDstCxv1W5gCTLUlB
         naUFvGePsF7dZ1Pls+zs0u7pno2XDhoR6mKpYZeqpRcfX4WQnCAmXTJWNi2gwOR36gaq
         BJRzBrj86ozzr3lJv7DPKgUHvNp9x/4njbsNGpzdU9cOXgqX1FVGssauPNvGKSXBWAiJ
         hWsnww58rd8XwUJlfPhEHDQIYsk0yoGJ/D5zqA9dK/l6dUHi8EG5HPVg2bRsY3pd+rTn
         F0r9QkUOWT4aLltSW9L6xQa/UHo6lIWTFXHB9p4De7Ei0p85tFqvor6zvDda08hALLf6
         Tg5w==
X-Gm-Message-State: APuU4Z+Ke6WAhJ1eVGVE3XFCbKyonnbdKB/1JIkipDp4qHWA34CkCuY1
	vn8TDJdK4ZlrtQyY2tyAex7PJf8YboXREqu3ii0/lFrJxUsP3R+TJjv59BC7BBTP
X-Gm-Gg: AYBFou3g+7ti0Qw27A2sOeNM4ccqLLk2/cPG1xzCSx5kcPzCA5xKzTHpijbH/lNwly5
	yOtPkROa7m2LQQjZv2+FvQAxfy/2pFSS1qY5iUgh4ptGNdphLzy3Oehfbw3jmAuyJ3ctwsGb8I3
	RFg0H/t8+ulrFQvMw0IWeP9kvvDv/BS+h7q12d2eB8TkezY1O3XOq9i7vLVtJ+eZW/IhgNv9v8l
	K4rBxEz0XFNt4K1zAum78AgwoCXgCC8FspbEEC8lo0b6L6y8RObwvFgkwAN5ACOBPRfbWqKzPsb
	Ar+JF7sUq4Mc3SQNkyUxWp2hInOf6RGcijoTNSpOwyZ5wRn1Qe5ab/CnGUmk52OWS87tYP9EJ9Z
	+ypS0mQUhJpSBemPsURxHwXCIw6bXyxhlEti7tW0v4eldvH2uY+fQ2BbrnbNttAY0CVVOsrf8+P
	dYcVETC3HwnX7NYEkXw+/Zcef1912BFE1045YjnY4zDu6PswJleEJPrD6Obr2KVbno8N5v+MsXy
	d8C8YmxOJ3/xC1YXM33EYYnJpst1XFIRWzwap+l3W1P62Rp/HQFKUaQrhBIQXllRBDca9U2EaGZ
	BF56WfreWD/1
X-Received: by 2002:a05:600c:674f:b0:4bb:56bb:1196 with SMTP id 5b1f17b1804b1-4bb8880fb9bmr74502185e9.23.1795182840438;
        Fri, 20 Nov 2026 05:54:00 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f6b6a6sm101009695e9.5.2026.11.20.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:53:59 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH 10/10] recipetool: create_npm: List the npm dependencies in SRC_URI
Date: Fri, 20 Nov 2026 14:53:41 +0100
Message-ID: <20261120135342.2628228-11-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120135342.2628228-1-stondo@gmail.com>
References: <20261120135342.2628228-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250803
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

recipetool adds an npmsw:// entry without destsuffix to the recipe.
Since bitbake commit 84f102954, the npmsw fetcher unpacks into the root
of UNPACKDIR and not into ${S}. So npm-shrinkwrap.json is not in ${S},
and npm.bbclass silently packs no dependencies. The package then has no
node_modules.

Create the recipe with the explicit list of dependencies instead:

- Add npm-shrinkwrap.json to SRC_URI, so that it unpacks into ${S}.
- Inherit npm-update-dependencies and require ${BPN}-npm-deps.inc.
- Run the update task, which writes the dependencies to the .inc file.

create_recipe() gives the source subdirectory to the handlers in
extravalues, so that the npm handler knows where ${S} is.

Fetch the dependencies from the same list for the license scan.

The selftest now checks the .inc file.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 16 +++++++--
 scripts/lib/recipetool/create.py           |  4 +++
 scripts/lib/recipetool/create_npm.py       | 42 +++++++++++++++-------
 3 files changed, 48 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index ba4f674b4c..181d95804f 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -5,11 +5,13 @@
 #
 
 import errno
+import json
 import os
 import shutil
 import tempfile
 import urllib.parse
 
+import oe.npm
 import oe.spdx_license
 
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
@@ -452,16 +454,26 @@ class RecipetoolCreateTests(RecipetoolBase):
         urls.append('npm://registry.npmjs.org/;package=@savoirfairelinux/node-server-example;version=${PV}'
                     ';sha512sum=f2dd7d88cb9a129fbb97eb87a8b5103bab24f783420fd7587f8000a355a12bf7'
                     '83f1263230afc588123958b73e36bb241f63eaf08119aac5aa2a870bc4de9223')
-        urls.append('npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json')
+        urls.append('file://npm-shrinkwrap.json;subdir=npm')
         checkvars['SRC_URI'] = set(urls)
         checkvars['S'] = '${UNPACKDIR}/npm'
         checkvars['LICENSE:${PN}'] = 'MIT'
         checkvars['LICENSE:${PN}-base64'] = 'Unknown'
         checkvars['LICENSE:${PN}-accepts'] = 'MIT'
         checkvars['LICENSE:${PN}-inherits'] = 'ISC'
-        inherits = ['npm']
+        inherits = ['npm', 'npm-update-dependencies']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+        # The update task writes one SRC_URI entry for each dependency
+        with open(shrinkwrap) as f:
+            expected = oe.npm.shrinkwrap_src_uri(json.load(f), 'npm')
+        deps_require_file = os.path.join(temprecipe, 'savoirfairelinux-node-server-example-npm-deps.inc')
+        self.assertFileExists(deps_require_file)
+        checkvars = {'SRC_URI': set(expected)}
+        self._test_recipe_contents(deps_require_file, checkvars, [])
+        self.assertTrue(any(url.startswith('npm://registry.npmjs.org/;package=accepts;')
+                            and url.endswith(';destsuffix=npm/node_modules/accepts') for url in expected))
+
     def test_recipetool_create_github(self):
         # Basic test to see if github URL mangling works. Deliberately use an
         # older release of Meson at present so we don't need a toml parser.
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index b2cc92c90b..46a321a866 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -784,8 +784,12 @@ def create_recipe(args):
         classes.append('bin_package')
         handled.append('buildsystem')
 
+    # Handlers can read the source subdirectory (S relative to UNPACKDIR),
+    # when S is set to it above
+    extravalues['srcsubdir'] = srcsubdir if not args.binary else ''
     for handler in handlers:
         handler.process(srctree_use, classes, lines_before, lines_after, handled, extravalues)
+    extravalues.pop('srcsubdir', None)
 
     # native and nativesdk classes are special and must be inherited last
     # If present, put them at the end of the classes list
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 50dd45c7d2..1b03aef612 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -12,6 +12,7 @@ import re
 import sys
 import tempfile
 import bb
+import oe.npm
 from bb.fetch.npm import NpmEnvironment
 from bb.fetch.npm import npm_package
 from bb.fetch.npmsw import foreach_dependencies
@@ -257,33 +258,39 @@ class NpmRecipeHandler(RecipeHandler):
         extravalues.setdefault("extrafiles", {})
         extravalues["extrafiles"]["npm-shrinkwrap.json"] = shrinkwrap_copy
 
-        url_local = "npmsw://%s" % shrinkwrap_file
-        url_recipe= "npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json"
+        has_dependencies = "dependencies" in shrinkwrap.get("packages", {}).get("", {})
 
-        if dev:
-            url_local += ";dev=1"
-            url_recipe += ";dev=1"
+        # The shrinkwrap file must be in ${S}, where npm.bbclass reads it
+        srcsubdir = extravalues.get("srcsubdir") or "${BP}"
+        url_recipe = "file://npm-shrinkwrap.json;subdir=%s" % srcsubdir
 
-        # Add the npmsw url in the SRC_URI of the generated recipe
+        # Add the shrinkwrap file to the SRC_URI of the generated recipe
         def _handle_srcuri(varname, origvalue, op, newlines):
-            """Update the version value and add the 'npmsw://' url"""
+            """Update the version value and add the shrinkwrap file"""
             value = origvalue.replace("version=" + data["version"], "version=${PV}")
             value = value.replace("version=latest", "version=${PV}")
             values = [line.strip() for line in value.strip('\n').splitlines()]
-            if "dependencies" in shrinkwrap.get("packages", {}).get("", {}):
+            if has_dependencies:
                 values.append(url_recipe)
             return values, None, 4, False
 
         (_, newlines) = bb.utils.edit_metadata(lines_before, ["SRC_URI"], _handle_srcuri)
         lines_before[:] = [line.rstrip('\n') for line in newlines]
 
+        try:
+            dependency_urls = oe.npm.shrinkwrap_src_uri(shrinkwrap, "", dev)
+        except ValueError as e:
+            bb.error("%s: %s" % (shrinkwrap_file, e))
+            sys.exit(14)
+
         # In order to generate correct licence checksums in the recipe the
-        # dependencies have to be fetched again using the npmsw url
+        # dependencies have to be fetched again
         bb.note("Fetching npm dependencies ...")
         bb.utils.remove(os.path.join(srctree, "node_modules"), recurse=True)
-        fetcher = bb.fetch.Fetch([url_local], d)
-        fetcher.download()
-        fetcher.unpack(srctree)
+        if dependency_urls:
+            fetcher = bb.fetch.Fetch(dependency_urls, d)
+            fetcher.download()
+            fetcher.unpack(srctree)
 
         bb.note("Handling licences ...")
         (licfiles, packages, fallback_licenses) = self._handle_licenses(srctree, shrinkwrap_file, dev)
@@ -297,6 +304,17 @@ class NpmRecipeHandler(RecipeHandler):
         classes.append("npm")
         handled.append("buildsystem")
 
+        if has_dependencies:
+            # npm-update-dependencies writes the dependencies to
+            # ${BPN}-npm-deps.inc. Write a stub file, which the task replaces.
+            classes.append("npm-update-dependencies")
+            extravalues["run_tasks"] = "update_npm_deps"
+            stub = os.path.join(tempfile.mkdtemp(prefix="recipetool-npm-"), "npm-deps.inc")
+            with open(stub, "w") as f:
+                f.write("# FROM RECIPETOOL\n")
+            extravalues["extrafiles"]["../{pn}-npm-deps.inc"] = stub
+            lines_before.append("require ${BPN}-npm-deps.inc")
+
         # Check if package has peer dependencies and inform the user
         self._handle_peer_dependency(shrinkwrap_file)
 
-- 
2.56.1

