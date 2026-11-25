Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48622.1795631783530302786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 10:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=N6Tevl2l;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3855395f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631782; x=1796236582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/q7W2M3bmR1CipvfJKpZ3xCzB6Tq8+NWRg0UZIqGcE=;
        b=N6Tevl2lL9q0WL3paiEDnJz128gV+rCUo6pSgoVWq2zrO3noWX8rGvoP5v7/ZQrB9B
         vpDT6LmtVbgNr/te6jyCQLWC+Sjs0cl39ExqSYQADedn6tm+0u2rQU+9siwN4K6Ma1T2
         oweaeAYOUiQe4qzVfEmfcFbwuJUBlt9Vg3GyAvC0IhbCIVbrfJJfDPpb54slNVKUjzso
         +kw1BPs72pLE6hfxRpoIFnaFiZcIVAMJLiLiYRxWzIVXlOkWB7185GA/XIdf9z4CF6Vs
         Fwl96dT/WFNb3Vzkvr46TDaaACahGschRcgK+YqmMOyF3sRif1YuoA2hqvadVDQ820s/
         Ve6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631782; x=1796236582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/q7W2M3bmR1CipvfJKpZ3xCzB6Tq8+NWRg0UZIqGcE=;
        b=rr5Woyc7XIUXMonOq2YD6+dxjZ8VbH7BexrVPDf8YOd8SnbClK7chG0TmKdTqMs5uS
         2vEC1kLTOO97f/De9z+vPx+4KJlKV4nJng5NlNZS6ydIdOjFUChkO/7QsCr+Wt+NbTz5
         jZzQRa2Q59mJ2ygEyd6z2a3p2rMl/t8yylmuNBJxo8o2mVTkg+SdmHoVlz9gSCDT+35p
         wZ6WtnwpibERpSE/MDwUib8/aAsDxHMQh7Rrn+NAtV55g3o54Gq7N+yteVFutqYecOFE
         nVbAIusihuuiVmzDt7p8Pl7fThodo7g5pjrL6F9d2qAC/8qzMB5bDJE6iuHskuyR7RwA
         Cp4g==
X-Gm-Message-State: APuU4Z8l2msjIRI6BpGaBZHXjigk5ZzIzbxb76HcZzbOVkJPraoDzlJx
	Hn8FuqSFILAv6RDMfmCrtmW/assDm06Vhk28l2TbEy2HPRFjkMaKajx+f/VPz8dr
X-Gm-Gg: AZFdTZe86AeAuUNETjXNrHESjcQ1/18TAtJ5V18ekW2Ll5rdNuzC8r0l2I+j1ni2aWe
	TQvimDjR1THVtWb3x4nv8dgPWWjIRMIQhhuw+a42oeEWFa80hyJqH/D6D87+VC00ft3ZDQPuZHk
	x6TJPmBK/pmVxDVpPW1HtMBiabmxuYIbgDfL9TF1+7aK3tQyCs7bBG8cuxVvdfQZBjfbB/BIYsn
	jEhKTzlNJpHsK1pNnnA96VwDsjBP10QqOO8yfkGmBhn2zBCQPXtVknC6wqlPZvXJRwL66zVwMew
	DuJHvqXSuweBSBCxXneMVBQ64kXx6uGUphvf0XaIE7hACWIhfSsOQ+r5sp3Mw5bNL42OOAWOvCJ
	c7o6pflg3z+Ji7cGb/CHHa2k9cfdf5ITkMNuoNM0FDQ2mTZGXAkAigxO3qZNriEV+7nmqeiUONi
	EoMAXNA3UnSKMMBkh+Eatnnn/oSPaLe9ZQzTnaMv7KZLBQMbi0Hv/z+PN3e85e/BLDcByokYHOX
	8DXZtR9DCZYoLQbFweQDEMWWWRVyEI69m/9Fz8tpKQQzafy/mYon6FlKFLha6866jlluW55tdg1
	0mWa2qFl4yDqOBHFqlQC5oYY++pn9gjO
X-Received: by 2002:a05:6000:47d4:b0:493:8c32:94 with SMTP id ffacd0b85a97d-4abb400ae31mr24170552f8f.38.1795631781623;
        Wed, 25 Nov 2026 10:36:21 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm36941016f8f.2.2026.11.25.10.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:36:20 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v4 4/4] oeqa/selftest: spdx: Test crate identity, scope and output PURLs
Date: Wed, 25 Nov 2026 19:36:13 +0100
Message-ID: <20261125183613.1335718-5-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125183613.1335718-1-stondo@gmail.com>
References: <20261125183613.1335718-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 18:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251240
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

python3-bcrypt fetches 42 crates. The new tests check three things:

- Each crate download has its name, version and PURL.
- Each crate download has a lifecycle scope, or an annotation that it
  is not built.
- The output package gets the PURLs of the runtime crates only.

A fourth test checks rpm-sequoia, which builds with the feature
crypto-openssl instead of its default features: the download of
openssl-sys must have the runtime scope.

The tests name only crates that do not change on recipe upgrades.
blowfish is the cipher of bcrypt. Only the pyo3 proc-macros use syn,
at build time. openssl-sys is the OpenSSL binding of the
crypto-openssl backend. The other checks do not use crate names.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 151 +++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index ce9a8af4f6..4768081ec5 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -9,6 +9,7 @@ import hashlib
 from datetime import datetime, timezone
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
+import oe.purl
 import oe.spdx30
 
 
@@ -543,3 +544,153 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
 
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
+    def test_crate_scope_with_recipe_features(self):
+        """Test that a crate of a feature that the recipe enables is runtime.
+
+        rpm-sequoia builds with --no-default-features --features
+        crypto-openssl, so its library uses openssl-sys. The default
+        features of rpm-sequoia select another backend. The crate graph has
+        all features, so openssl-sys gets the runtime scope.
+        """
+        objset = self.check_recipe_spdx(
+            "rpm-sequoia",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-rpm-sequoia.spdx.json",
+        )
+
+        openssl_sys = {
+            pkg._id
+            for pkg in objset.foreach_type(oe.spdx30.software_Package)
+            if (pkg.software_packageUrl or "").startswith("pkg:cargo/openssl-sys@")
+        }
+        self.assertTrue(openssl_sys, "no download of openssl-sys found")
+
+        runtime = set()
+        for rel in objset.foreach_type(oe.spdx30.LifecycleScopedRelationship):
+            if (
+                rel.relationshipType == oe.spdx30.RelationshipType.dependsOn
+                and rel.scope == oe.spdx30.LifecycleScopeType.runtime
+            ):
+                runtime |= {to if isinstance(to, str) else to._id for to in rel.to}
+        self.assertTrue(openssl_sys <= runtime, "openssl-sys does not have the runtime scope")
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

