Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4750.1795121360260638830
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 12:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xCOYIuJf;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49465892f7bso151263f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 12:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795121358; x=1795726158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ddKFm4edcu46UL0qqikK24536Nx+0m4JDW2BPdxXAg=;
        b=xCOYIuJfPYp1+xYUZ8puI8oXsaBSmcZC4LMwz6uTLyLb70bg7HlYQxdSA5pqQhXeGo
         nBfVYjxPJ+wHNsA96Dg5doGm3aVhPkNm8nOFulT9cx7EgAxQ8zlztMQfHhehqMMlZNJs
         XtqalRDs2VgpM8oA0PsTmOmpQT1ImxSo2+c/l59LA0VCzOLe6clE5C6k/ZPieharPpl0
         dg4UT/f3Xry/Yv5CQyTJoZBlHDomwwkytzBBnUkn+X/rIySN+XArPqfwaA4vJ0f1/9a7
         DnaaqZQR/D5hL4/p8CZ5BpXgLntxEmKaWZ5FK9GtsKsr7wKPe3RzQKjEFxKsLTKqiA4f
         OvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121358; x=1795726158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ddKFm4edcu46UL0qqikK24536Nx+0m4JDW2BPdxXAg=;
        b=hj5aNQMW5yaNmgwP93eYfsFJeMs+euXm/xWhyu6gb9qdTpPPISvO8yqa0RSbs+wa3N
         tG7RZuajsNgEs5/Dp8+C3u9VIda4eY5NsPrxOWrCsse72Gd5aYDa4X0hxu59tIG8uj1x
         itYDPHEHLCZuk71z4F/6DjWypsbKEQ5RpqpUTMfHVMB8Vh9RhRb86aL3HUFD1UZ2FBdQ
         SIs308TDRMu3sWP+RnotdspsiXbm3m/cAB1atAJD/sz2IRgyOZaRRT7jt1u3dTc93gTm
         8Zg8QBoRqT5NBQK82RtUrdyBEDBBmCcR8R+RpgxcXxJ1k89lO1b+k4VAzQrfEFxvtsZF
         +9Dg==
X-Gm-Message-State: APuU4Z9VtYgPf1RHFRtnHhfQzQdFEbImt/BBarzakX7iFkM/zj9yLaXy
	6nFyOG1kgwXabkDu5wBtB7lipoNjo0E0F+5yMRCZ6qHej/OEbodLMMh0xyVbaZPD
X-Gm-Gg: AZFdTZd+GluNfH2XQaFa2zA9q00ykQ5OQ2KObcg9wmUt2Be5FuUXquj3aqNlz1Dhgg1
	PuY0GwpERdalOAKzBoDk1YmTp3fn/bCux2OReyfmB/aZw8K2OWyhXH20QsIGidWyrKLjW6HyTNn
	FX3FI8u6aIdhPZAyG+Fo0A4rPTQQmxGk3rvo9ErYJQruoG0Vqtju6cO6OGA3XG6JuNpYX1cIO4R
	22g17z3/xh8cdAf4hj5DruB0RnCx9zVQMKj79/K5aN9MscasKhcstOZZBaybU38tPw5dJEGo2wO
	2t+mDOggt+VdPeDCOyKH5CcLoanizDxkGUem8tB2iEmAT/Dci8ckY2HxlR5WTVnflRFGk122bqD
	GX/DwLORymA01cAkD8i69e1LlMakX97HQrRTBur4rLzpXjRyRLcNJ1zoJCAG9HfbILh8M0TQV6R
	ITnreHFckBEfgSd9PHbhPlNKzPCOrqh8pb8nY9gmeENzvhzbP6oPydHL7AJpz/6Mt54bJ77A01+
	TRBw0sYNA3j3Cswk8odamzIjoLNkIG+zZtvru3wQqlcXWJyCf5+xSGDYahMvNsFV4n47x8VidXz
	zgvg9KgM1Qs=
X-Received: by 2002:a5d:5f85:0:b0:4a7:1613:7206 with SMTP id ffacd0b85a97d-4abb57f7b6fmr1197202f8f.47.1795121358353;
        Thu, 19 Nov 2026 12:49:18 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm1606171f8f.57.2026.11.19.12.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:49:17 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v3 4/4] oeqa/selftest: spdx: Test crate identity, scope and output PURLs
Date: Thu, 19 Nov 2026 21:49:09 +0100
Message-ID: <20261119204909.2931233-5-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119204909.2931233-1-stondo@gmail.com>
References: <20261119204909.2931233-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 20:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250721
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

python3-bcrypt fetches 42 crates. The new tests check three things:

- Each crate download has its name, version and PURL.
- Each crate download has a lifecycle scope, or an annotation that it
  is not built.
- The output package gets the PURLs of the runtime crates only.

The tests name only crates that do not change on recipe upgrades.
blowfish is the cipher of bcrypt. Only the pyo3 proc-macros use syn,
at build time. The other checks do not use crate names.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 122 +++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index ce9a8af4f6..d75c6146c7 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -9,6 +9,7 @@ import hashlib
 from datetime import datetime, timezone
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
+import oe.purl
 import oe.spdx30
 
 
@@ -543,3 +544,124 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
 
         # Document should be fully linked
         self.check_objset_missing_ids(objset)
+
+    def test_crate_package_identity(self):
+        """Test that crate downloads carry name, version and a cargo PURL."""
+        objset = self.check_recipe_spdx(
+            "python3-bcrypt",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-python3-bcrypt.spdx.json",
+        )
+
+        prefix = "https://static.crates.io/crates/"
+        crates = 0
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            location = pkg.software_downloadLocation or ""
+            if not location.startswith(prefix):
+                continue
+            name, version, _ = location[len(prefix):].split("/")
+            self.assertEqual(pkg.name, name)
+            self.assertEqual(pkg.software_packageVersion, version)
+            self.assertEqual(
+                pkg.software_packageUrl,
+                f"pkg:cargo/{oe.purl.quote(name)}@{oe.purl.quote(version)}",
+            )
+            crates += 1
+
+        self.assertGreater(crates, 0, "no crate downloads found")
+
+    def test_crate_dependency_scope(self):
+        """Test that crate downloads get a lifecycle scope for the target.
+
+        Every crate download is either the target of one scoped dependsOn
+        relationship or annotated as not built. python3-bcrypt fetches crates
+        for other platforms (WebAssembly, UEFI), which are never built for a
+        Linux target. blowfish is the cipher of bcrypt, and syn only runs at
+        build time in proc-macros, so these names do not change on upgrades.
+        """
+        objset = self.check_recipe_spdx(
+            "python3-bcrypt",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-python3-bcrypt.spdx.json",
+        )
+
+        crates = {
+            pkg._id: pkg.name
+            for pkg in objset.foreach_type(oe.spdx30.software_Package)
+            if (pkg.software_packageUrl or "").startswith("pkg:cargo/")
+            and (pkg.software_downloadLocation or "").startswith("https://static.crates.io/")
+        }
+
+        scope_of = {}
+        for rel in objset.foreach_type(oe.spdx30.LifecycleScopedRelationship):
+            if rel.relationshipType != oe.spdx30.RelationshipType.dependsOn:
+                continue
+            for to in rel.to:
+                to_id = to if isinstance(to, str) else to._id
+                if to_id in crates:
+                    self.assertNotIn(crates[to_id], scope_of)
+                    scope_of[crates[to_id]] = rel.scope
+
+        not_built = set()
+        for annotation in objset.foreach_type(oe.spdx30.Annotation):
+            subject = annotation.subject
+            subject_id = subject if isinstance(subject, str) else subject._id
+            if subject_id in crates and "not built" in annotation.statement:
+                not_built.add(crates[subject_id])
+
+        self.assertEqual(set(scope_of) | not_built, set(crates.values()))
+        self.assertFalse(set(scope_of) & not_built)
+        self.assertTrue(not_built, "no crate for another platform found")
+        self.assertEqual(scope_of["syn"], oe.spdx30.LifecycleScopeType.build)
+        self.assertEqual(scope_of["blowfish"], oe.spdx30.LifecycleScopeType.runtime)
+
+    def test_crate_purls_in_output_package(self):
+        """Test that the output package inherits the PURLs of its crates.
+
+        The package gets the PURLs of the crates with the runtime scope in
+        the build SPDX, and no other crate PURLs. syn only runs at build
+        time in proc-macros, so it is not in the binary.
+        """
+        objset = self.check_recipe_spdx(
+            "python3-bcrypt",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/packages/package-python3-bcrypt.spdx.json",
+        )
+
+        package = next(
+            pkg
+            for pkg in objset.foreach_type(oe.spdx30.software_Package)
+            if pkg.name == "python3-bcrypt"
+        )
+        purls = {
+            e.identifier
+            for e in package.externalIdentifier
+            if e.externalIdentifierType == oe.spdx30.ExternalIdentifierType.packageUrl
+        }
+        crates = {p[len("pkg:cargo/"):].split("@")[0] for p in purls if p.startswith("pkg:cargo/")}
+
+        # The package's own PURL stays first
+        own_purls = get_bb_var("SPDX_PACKAGE_URLS", "python3-bcrypt").split()
+        self.assertEqual(package.software_packageUrl, own_purls[0])
+        self.assertTrue(set(own_purls) <= purls)
+        self.assertIn("blowfish", crates)
+        self.assertNotIn("syn", crates)
+
+        spdx_vars = get_bb_vars(["DEPLOY_DIR_SPDX", "SSTATE_PKGARCH"], "python3-bcrypt")
+        build_objset = self.check_spdx_file(
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-python3-bcrypt.spdx.json".format(**spdx_vars)
+        )
+        downloads = {
+            pkg._id: pkg.software_packageUrl
+            for pkg in build_objset.foreach_type(oe.spdx30.software_Package)
+            if (pkg.software_packageUrl or "").startswith("pkg:cargo/")
+        }
+        runtime = set()
+        for rel in build_objset.foreach_type(oe.spdx30.LifecycleScopedRelationship):
+            if rel.scope != oe.spdx30.LifecycleScopeType.runtime:
+                continue
+            for to in rel.to:
+                to_id = to if isinstance(to, str) else to._id
+                if to_id in downloads:
+                    runtime.add(downloads[to_id])
+
+        self.assertTrue(runtime, "no crate with the runtime scope found")
+        cargo_purls = {p for p in purls if p.startswith("pkg:cargo/")}
+        self.assertEqual(cargo_purls - set(own_purls), runtime)
-- 
2.56.1

