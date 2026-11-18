Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3930.1795045479524341824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 15:44:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=A9qV24FD;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so900052f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045478; x=1795650278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ddKFm4edcu46UL0qqikK24536Nx+0m4JDW2BPdxXAg=;
        b=A9qV24FD+yP2veXjlQBcAft5tAmZiTIukQb4I0XRCRreIhsXyD52vOsLr9t6PPr96w
         QtpdRN4tQTpVwiEvDtf6oYf9Q16/Npe16g/ushzFjOU/5HcehJv5k2GQxKnd1sBU8diw
         v6PWDhI38my0mqt8rH8ObF2jsLK7mYNenhAQAnvIBvckw/CX60dyaobKr6c1vyLV5xH6
         mUBAiYZ/X06byHoSM6KKvLTFtePOJQc8IIM3rQfE1YOMoLdIhLk6zYZAw7oLSnWIR70y
         Cp4NO6+vrJFvfZgBBF87Iz6+h7j4GzOfVcmKYQ5gwPRnKA9IIrXYH9ZPIqk/JlJqDX52
         qjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045478; x=1795650278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ddKFm4edcu46UL0qqikK24536Nx+0m4JDW2BPdxXAg=;
        b=RCH98iI1epSAQxdg/05KkCAP0PMY/QaDDn8FdtxhHSxVAdGCocPatLxMFSa8tXEmcl
         K89OdHhkO5keHLNyH0/FMMgXxJbAOttJA9hd2LRZCI919RTsSTNSRmijYVD7RQd4ygsm
         IRi+z7kjrlldnC0vHulyYN5qV3U/jJFLbmf9koqkW7KBemSoBudIoEUml9gH+kq63xvU
         iaI7ixYBKO/RmCt9ql61yrxNyZH8wZnORr8yiLCFJChVpHXrxLFRQxVCJKHoh1go+l/a
         xistLlrcc7ld6h6CjuU2apSoifnqrDgF0LuscgO4LCx+PIMyeSNFwSPUDcb57T8KJicd
         ZpJg==
X-Gm-Message-State: APuU4Z/sDtDKmYyvXb4Y3lYC5QIqNwJbuY+snEo/YJSBBDClD0/V6p0C
	rWAg/DsZ4jL1Y/0kWqH5jwD0BJaJ4vzg2+h1l8+SPhOiG7dM4wRxrUhsGJsE8g==
X-Gm-Gg: AZFdTZcfGC4VhA2F5C9mF1xdOc97Hxqi8d4xmPhlCJbk+MhOmVlo7hg1Ysv7+unVqm5
	ISnx7FYXtwa70ohVbLXg96OgcW0cL4MzWjmUagLZM3CnNJFxQ6baK/1DZEeS4rMCwIR5T9s+yoD
	kKppfO3M8tucR32oIosLRPifaDatFs9y90eWxh+zIrNpl7WeoxUsPH1oOsvPqFuWzRxNNR6xHzB
	1gwg+IR5yjWFLOZVcvvHnXLC1Ihg0/a7feiPKK+ya+uHXDXuRUunzg/m/yAkfy/qOWVKNepvBDp
	YmsBD8drF8gFDC7TkE03iU7gPRB7H5Uf5DoWTCDGYXQublNpAlJSdAFyJMZkj+tsN3OUtEgWYYD
	weDxBjur9OqdTrvJe6q+Vow0c5gH7UOi/32vya5ZIpnEr0qWv291CKJScL+9Uc2orHTbvc0dtrD
	avYwVzpIGAZgq0bmnUvWQFxwx/p0so/Nc1QbY4UW7MC/rGYsmB8gv0xH7FHh3oGYyqIvvd0F1y7
	hAMhpRc8pjTVtEScf7rYW2xCUt/wP68ANe0B9dfO1fhw03fRYDTOfKS4C4nf6xEOXUblTH2NDNr
	Y2MiRxHkugk=
X-Received: by 2002:a05:6000:2512:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-4a63c374724mr9828606f8f.53.1795045477714;
        Wed, 18 Nov 2026 15:44:37 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm6730718f8f.19.2026.11.18.15.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:44:36 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v2 4/4] oeqa/selftest: spdx: Test crate identity, scope and output PURLs
Date: Thu, 19 Nov 2026 00:44:25 +0100
Message-ID: <20261118234425.3681880-5-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118234425.3681880-1-stondo@gmail.com>
References: <20261118234425.3681880-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 23:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250604
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

