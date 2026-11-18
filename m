Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9020.1794994176464018302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 01:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=E/5J1K3+;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e46e449e8so432552f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 01:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994175; x=1795598975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ddKFm4edcu46UL0qqikK24536Nx+0m4JDW2BPdxXAg=;
        b=E/5J1K3+QiLMncwnnUSCXyF3FQvUUThFdLs8aVgKi19ABQ3ENwguNRVLab41AwTW5E
         uNudatCDjZVI3ns07Zo6sYFVnaeRP7b/rcVsBsD3JIlf4NpwOh0Z2FWtac/8gAlMuwWR
         MI03XWBEgacEugT+hPP7b+FOlEf1NTUfnJVrMWtikpQFvWQU0+SnP8GIYPGMri7fwj3t
         dhvcXqP73FesktypfDlVe0LyMJYV7TxhPIpr9NsYKyFQe/YuC6RtFwqImz700FaYehT0
         wS4ZweL8hl6OPdi3VnS3FiXKH9pSqiPAXKzXEqSuBgY6scS49gTxdqXGnjhoLBbsflQu
         nqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994175; x=1795598975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ddKFm4edcu46UL0qqikK24536Nx+0m4JDW2BPdxXAg=;
        b=Nxo5D/vLr2ToUzvQKJ8mhbQZo+sCWMW4VIqRHigV0hW1kxH8TcSFLJbeEV0igjyNNI
         LJKm2oT3jH4yJwu7yfHxR6h/gqxtlrHd4625ZplSagyZd9crqfZLigs+GjyliG0wQMcm
         pd6baUTl0vN1UTQU93elRbKOf2B58dpXGKtv7wzuEO54lWf8K270HWvQTkh8AsFYxT1m
         Sub0UXyRnf+U+gGOTSGnXsS44EaR4uNYx5MY7f7bE1jVCggJ3KYWwydMCaq67M+6azc7
         FaCo/nQiaQbgv+yQNI36ZE20ORLaPf6lgVPH9BFcQ1D1nSa6n0/PQRdAdZdD4OHn9dv4
         WGQA==
X-Gm-Message-State: APuU4Z96RvMpBPglrsPRhjmarXnnDDl3bahsxBjSCM7XG5mjwJEDZ1w/
	kNxmy2e59sVHN1+WpheMd8DklUBcTuV4RI1HVanNzarkQCt1lcBISNqSTkI3hg==
X-Gm-Gg: AYBFou2IhZquzW/qo+Onx+6h+imNRGMn96H3oZRQb9iwoyS0vGntk6JJN4oqDJ4/ltC
	+Ncvdw0U8Qiy9MDLa3spzwCNVpXmSQR7iM40OhZujcKfwN98kKP2NczH3kcmFkE5tdAVxORGJ2a
	zY1182el8QdRhITDaR7s/01snx2Xn9fPdtxzXg1+1hKa7PfuBWlfRnpFJqJCiNN21BC/SLlqeDQ
	2D0AT11D6VpDK8hMe7pLNw/XEU9pa1gX1TFahLC1HgFfmMvMkgJSoa5R8CIu5kADUaXM6fetijc
	Ek7U4m7KEgesTu41y7f+rO6hhL882PYgQo2Wa9vW7YRYtJ2WwgWVYDosYBjad1hMHgKBDRHHDdv
	yCgJhIyj8FvoU+j6IdVcZlGv7NxZHYZDV4PhxPCMDfKDBAdJA3pmomi3ThiL4VPHnd4AWtt9M8D
	uXaPXvuyBoOWtVutLYr6t/8/TkJouHYev8MmiZWh+ATuF3lXZ5nax46bAgQ1ut4Nv6j3s2087ZG
	IhrNmsbfpSLM+VxjCEpi92ZsFFDpZi+nwfZgu1cd8Uw/fKaP3l4yZIeaUf5qnhOHbVjVGenZNpf
	6eJcbBD+8BE=
X-Received: by 2002:a05:600c:4fc6:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb7da26333mr36482245e9.18.1794994174456;
        Wed, 18 Nov 2026 01:29:34 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d28ec3asm55486755e9.0.2026.11.18.01.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:29:33 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Stefano Tondo <stondo@gmail.com>,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [PATCH 4/4] oeqa/selftest: spdx: Test crate identity, scope and output PURLs
Date: Wed, 18 Nov 2026 10:29:27 +0100
Message-ID: <20261118092927.204959-5-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118092927.204959-1-stondo@gmail.com>
References: <20261118092927.204959-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250530
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

