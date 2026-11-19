Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4747.1795121355438119450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 12:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sLPMWUyC;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso73212f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 12:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795121354; x=1795726154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyEY1MwSnkpJ/cglrwrz43/rdUxqcF5jiCN7lY+MY00=;
        b=sLPMWUyCw5UpNXGdG9UvoW3auCbsujfbZZQqVKfofY2THQk+WRbXnd4v5i6Axi9aWz
         8BrIFswj2kK8m0LyBJIzEOrHqJHJGnFGi9OMyGOlhQDAVKln0g7ceOfBao1aqDx1ejqV
         OvXdCK/Cea7nfbZJFsb/fDCkLH47xIUdeb6PmzeWcQJIR5sTTO0t3ldGJqHIqCLJYeVV
         0WbQ4Q+vsDo3WhsmeaWQFemdDUUE05qRnIayaLWZk7wKEjefgdRBgcmC4u2JM/t6rHH4
         3oufsSsR6knEjEJB3w5RLnPCOZsVj4J1Gw1OoeHdUZzgtfVtoW6iuGY51pmZ02M+LpPs
         ft+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121354; x=1795726154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iyEY1MwSnkpJ/cglrwrz43/rdUxqcF5jiCN7lY+MY00=;
        b=MZhpY//uL7N3kDqN/RDCAqPAG8CIZgQqaJRoGgAbO2qEfepIP62yQvfQ3/v/g517yb
         zRr8sLIv2q+eNOIjF65Vuz+s+kGgECit1b0oOvNuI8deG2WYauCAdoUMzcSFRTyOXFf+
         HxpoKgVR3Q8XtfOoQO+9Bt9on6NMnIuSFEEhv7iSUGKp2LfPOuoTxENbn3kBjhV6NICY
         odsMdJPBjrspc3otD0nE8oSFLKEanNaACkllQHuECTZ+So96F5+nR9dfFo5sZJDlgYW6
         QkMDSC6uSCO/0qjFs8rwhCxKo/svj0QDRrxEJG5LmyV538pn/e7LtCHMGGHSpML3MNk7
         7kgw==
X-Gm-Message-State: APuU4Z8PYcFDidPdLdKZ2TtPsq6N2yxRTCSf3ZFwfwySe+/TaakLSWHj
	AUHo3qio4qs3X8wHLNezq9YUyAwK4jgVlGpSD440vOIzFhlcE2AVYSS4lYccjH67
X-Gm-Gg: AZFdTZc2jWLQf23qDdJqXIetsDZCL0FTsUSo5vt3sbWCkrc5AscQmVHosUamD48Sdvx
	kRKJIVBhDZSFKw0XdSg/SzsLM4mcxadxwrtPgWpNowE+AGKXgCYPG7c4qaMMw3JRINT1ic3K+S0
	jH6aRvM0oWG+ahfWEoohpsc5hfxeassMUYVb8cksv3ARyo54K5c/liMmt9x3Um+matcYqN3P8SX
	CBtV6ia/SY419DC/6OhmGjfZdEkOpZr+HzvEkpUb26X8OOr/ij96T564WL7ym9bFsSJ9S9+8u9i
	1hWs8px07Tp5JNXrJgRHQuCFXjdpMOyU5iursy1BT8APn/WOdZ3MyxB/f+i0mkdabyBqLFqB5gU
	x/o3B0KfZXlxuTwFH4zEsER7bTq6Btttg+3g4DXleBLz8fgX7vKAmNtKz4RixKWGU/YMB+d0We5
	CFtXcdTtLuAE+Qd798/MaYSPd8DjvCV2GYowQSnsjsFh7iPVHyf7aglJDILUOMYWiYoLUmRUtEB
	gNy2CG+49v6fh8x0cPF5raaJ9zNUtEoXn7XO+mQb4pZV7ZiHNRf6H05LgAnFScLxas2BBDT9bVk
	84NAuv64W4g=
X-Received: by 2002:a05:6000:4904:b0:4a6:60b2:afed with SMTP id ffacd0b85a97d-4abb3c37a2dmr1047312f8f.11.1795121353562;
        Thu, 19 Nov 2026 12:49:13 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm1606171f8f.57.2026.11.19.12.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:49:12 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v3 2/4] spdx30: Record the lifecycle scope of crate dependencies
Date: Thu, 19 Nov 2026 21:49:07 +0100
Message-ID: <20261119204909.2931233-3-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119204909.2931233-1-stondo@gmail.com>
References: <20261119204909.2931233-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 20:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250719
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

A Cargo.lock file lists the crates for all targets, and some crates
only run at build time (build scripts, proc-macros and the crates
they use). The fetcher downloads all of them, but only some end up in
the binary.

Add a do_cargo_metadata task that writes the dependency graph for the
target with cargo metadata --filter-platform. The create_spdx task
reads this graph. It links the build to each crate download with a
scoped dependsOn relationship: runtime, build or test. A crate that is
not used on the target gets an annotation instead.

The walk expands each workspace member only once. Members can depend
on each other in a cycle, and a member can be a dev dependency of
itself, as uv-preview is in python3-uv-build.

Add unit tests for the scopes, with member cycles.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes-recipe/cargo.bbclass             | 17 ++++
 meta/lib/oe/spdx30_tasks.py                   | 90 +++++++++++++++++++
 .../oeqa/selftest/cases/oelib/cargo_scopes.py | 73 +++++++++++++++
 3 files changed, 180 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 586071988a..b3e82f9d5b 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -26,6 +26,23 @@ cargo_do_compile () {
 	"${CARGO}" build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} "$@"
 }
 
+# The crate dependency graph for the target, with the crates that are not
+# used on it removed. create-spdx uses it to give each crate download a
+# lifecycle scope.
+CARGO_METADATA_FILE = "${WORKDIR}/cargo-metadata.json"
+
+do_cargo_metadata () {
+	rm -f "${CARGO_METADATA_FILE}"
+	# Some recipes inherit cargo without being a cargo project
+	if [ ! -f "${CARGO_MANIFEST_PATH}" ]; then
+		return
+	fi
+	"${CARGO}" metadata --format-version 1 --offline --locked \
+		--manifest-path "${CARGO_MANIFEST_PATH}" \
+		--filter-platform "${RUST_HOST_SYS}" > "${CARGO_METADATA_FILE}"
+}
+addtask cargo_metadata after do_configure before do_compile do_create_spdx
+
 cargo_do_install () {
 	local have_installed=false
 	for tgt in "${B}/target/${CARGO_TARGET_SUBDIR}/"*; do
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index eded315819..01e4eefa2d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -476,6 +476,94 @@ def set_package_identity(d, dl, fd):
         dl.software_packageUrl = identity.purl
 
 
+def get_cargo_scopes(d):
+    """Return {(crate, version): scope} from CARGO_METADATA_FILE.
+
+    The file is the output of cargo metadata --filter-platform for the
+    target, so crates used only on other targets are absent. Walks the
+    dependency graph from the workspace members: normal dependencies are
+    runtime, build dependencies and proc-macro crates (and everything they
+    pull in) are build, dev dependencies of the members are test.
+    """
+    path = d.getVar("CARGO_METADATA_FILE")
+    if not path or not os.path.exists(path):
+        return None
+
+    with open(path) as f:
+        metadata = json.load(f)
+
+    packages = {p["id"]: p for p in metadata["packages"]}
+    nodes = {n["id"]: n for n in metadata["resolve"]["nodes"]}
+    members = set(metadata["workspace_members"])
+    rank = {"test": 1, "build": 2, "runtime": 3}
+
+    def is_proc_macro(pkg_id):
+        return any("proc-macro" in t["kind"] for t in packages[pkg_id]["targets"])
+
+    scopes = {}
+    expanded_members = set()
+    stack = [(m, "runtime") for m in members]
+    while stack:
+        pkg_id, scope = stack.pop()
+        if pkg_id in members:
+            # A member is a root with the runtime scope. Expand it only
+            # once: members can depend on each other in a cycle, and a
+            # member can even be a dev dependency of itself.
+            if pkg_id in expanded_members:
+                continue
+            expanded_members.add(pkg_id)
+            scope = "runtime"
+        else:
+            if scope == "runtime" and is_proc_macro(pkg_id):
+                scope = "build"
+            if rank.get(scopes.get(pkg_id), 0) >= rank[scope]:
+                continue
+            scopes[pkg_id] = scope
+        for dep in nodes[pkg_id]["deps"]:
+            for kind in (k["kind"] for k in dep["dep_kinds"]):
+                if kind == "dev":
+                    if pkg_id in members:
+                        stack.append((dep["pkg"], "test"))
+                elif kind == "build":
+                    stack.append((dep["pkg"], "test" if scope == "test" else "build"))
+                else:
+                    stack.append((dep["pkg"], scope))
+
+    return {
+        (packages[i]["name"], packages[i]["version"]): s for i, s in scopes.items()
+    }
+
+
+def add_dependency_scopes(d, objset, build, source_files):
+    """Give crate downloads a lifecycle scope, see get_cargo_scopes()."""
+    scopes = get_cargo_scopes(d)
+    if scopes is None:
+        return
+
+    by_scope = {}
+    for dl in source_files:
+        if not (getattr(dl, "software_packageUrl", None) or "").startswith("pkg:cargo/"):
+            continue
+        scope = scopes.get((dl.name, dl.software_packageVersion))
+        if scope:
+            by_scope.setdefault(scope, []).append(dl)
+        else:
+            objset.new_annotation(
+                dl,
+                "%s %s is fetched but not built: not used on target %s"
+                % (dl.name, dl.software_packageVersion, d.getVar("RUST_HOST_SYS")),
+                oe.spdx30.AnnotationType.other,
+            )
+
+    for scope, dls in sorted(by_scope.items()):
+        objset.new_scoped_relationship(
+            [build],
+            oe.spdx30.RelationshipType.dependsOn,
+            getattr(oe.spdx30.LifecycleScopeType, scope),
+            sorted(oe.sbom30.get_element_link_id(dl) for dl in dls),
+        )
+
+
 def add_download_files(d, objset):
     inputs = set()
     release_date = get_release_date(d)
@@ -978,6 +1066,8 @@ def create_spdx(d):
 
     source_files = add_download_files(d, build_objset)
     build_inputs |= source_files
+    if bb.data.inherits_class("cargo", d):
+        add_dependency_scopes(d, build_objset, build, source_files)
 
     recipe_spdx_license = add_license_expression(
         d, build_objset, d.getVar("LICENSE"), license_data, [recipe_objset]
diff --git a/meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py b/meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py
new file mode 100644
index 0000000000..6273346668
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py
@@ -0,0 +1,73 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import json
+import os
+import tempfile
+from unittest.case import TestCase
+
+import bb.data
+import oe.spdx30_tasks
+
+
+def package(name, proc_macro=False):
+    kind = ["proc-macro"] if proc_macro else ["lib"]
+    return {"id": name, "name": name, "version": "1.0.0", "targets": [{"kind": kind}]}
+
+
+def dep(name, *kinds):
+    return {"pkg": name, "dep_kinds": [{"kind": kind} for kind in kinds or (None,)]}
+
+
+class TestCargoScopes(TestCase):
+    def get_scopes(self, members, packages, deps):
+        metadata = {
+            "packages": packages,
+            "workspace_members": members,
+            "resolve": {"nodes": [{"id": p["id"], "deps": deps.get(p["id"], [])} for p in packages]},
+        }
+        with tempfile.TemporaryDirectory() as tmpdir:
+            path = os.path.join(tmpdir, "cargo-metadata.json")
+            with open(path, "w") as f:
+                json.dump(metadata, f)
+            d = bb.data.init()
+            d.setVar("CARGO_METADATA_FILE", path)
+            scopes = oe.spdx30_tasks.get_cargo_scopes(d)
+        return {name: scope for (name, version), scope in scopes.items()}
+
+    def test_scopes(self):
+        packages = [package(n) for n in ("app", "runtime-dep", "build-dep", "build-dep-dep",
+                                         "dev-dep", "shared")]
+        packages.append(package("derive", proc_macro=True))
+        deps = {
+            "app": [dep("runtime-dep"), dep("build-dep", "build"), dep("dev-dep", "dev"),
+                    dep("derive"), dep("shared", "dev")],
+            "build-dep": [dep("build-dep-dep")],
+            "runtime-dep": [dep("shared")],
+        }
+        self.assertEqual(self.get_scopes(["app"], packages, deps), {
+            "runtime-dep": "runtime",
+            "shared": "runtime",
+            "build-dep": "build",
+            "build-dep-dep": "build",
+            "derive": "build",
+            "dev-dep": "test",
+        })
+
+    def test_member_cycles(self):
+        # Workspace members that depend on each other in a cycle, and a member
+        # that is a dev dependency of itself, as in uv. Each member is a root
+        # and is expanded once.
+        packages = [package(n) for n in ("member-a", "member-b", "member-c", "crate-a", "crate-c")]
+        deps = {
+            "member-a": [dep("member-b"), dep("member-a", "dev"), dep("crate-a")],
+            "member-b": [dep("member-c"), dep("member-a", "dev")],
+            "member-c": [dep("member-a"), dep("member-c", None, "dev"), dep("crate-c", "dev")],
+        }
+        self.assertEqual(self.get_scopes(["member-a", "member-b", "member-c"], packages, deps), {
+            "crate-a": "runtime",
+            "crate-c": "test",
+        })
-- 
2.56.1

