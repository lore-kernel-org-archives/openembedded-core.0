Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48618.1795631780726357208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 10:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AslriHFn;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4aa5833c263so5898162f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631779; x=1796236579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iL3jDwl9cMryG6lLJ4d0ZLn7apqKT+XE1mTDuw40x0o=;
        b=AslriHFnp5CaEHZG1H2qZ1I+riHVQD/E+kn4MtkTv/BEMICUH3sG5Z4gQsSIdRLs8P
         uqW4WzwN+ZMiddfUHFeYf6npGOUG7Ph5cM6Oa+F3IarEVAcPXu9NL/PVVZuJYQ2b/qzV
         +xO+ldBOBAVRxrlDZYUUY2wON4liYickAxFcGKhBy/Flzvc4P/iezeI7eZV5gJyz2smF
         gTnclkQYoRPcmRXH2r99o1tBaJ2C4CjG/8sY7XruYT1Yh9KNoGMZsimWZ6BQAVXVyfD8
         bDH0f6nEz7eDA0Hih2PIYotNaF8DPbOUI6edTSz3jvD3UtaIie4aQtroThz9ziyBHftp
         7l3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631779; x=1796236579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iL3jDwl9cMryG6lLJ4d0ZLn7apqKT+XE1mTDuw40x0o=;
        b=DjLObABM1F4kDR6HpLwaBFZOIgP4JpYpWBMSXqTjiJMno4IZ72zkCFnx44LJR6/dUr
         IN98s0ELDtUN9BGUOpy/yr/93ergWuTB2PRhIQkkD2TPi0dMyKvdNfbw2lZKGC2Fdk5h
         oN7A/vOg8a+qCwEEF3LXdZ1OOjdIslvZWSm+lOdVYomq7ZPj2tKkx3agngKPsM4JCjCb
         gYaJijQPKePeC+WiWaXFHE2T1Cvbk+txQKCHExQNLGljtstEMKzwL8V8eNTUqrTY9i+S
         GLa9aQrbJg7TVNS8Z5TMQ9sWmk4Yzu84R0qwp1Ri/lL0WpNXZJErymIaVfZeVy9DbhTQ
         QW2A==
X-Gm-Message-State: APuU4Z9IWVo2U1zaa6+PXQLw4h1iVzEwH7MDZy6wVVac8BAirrxv7hwn
	CPZ/aLZPw5Xn3R3UQllDuYWLGrqfw5Ye1zyA5/+5SX1TPbNqDvHht6HKduv0M06F
X-Gm-Gg: AZFdTZcnyFHH/h8MShr2PIRdnsULkTjN7nwf9x78Lx6lYS6uG88IJzyzlyZl8EURbzs
	JKjRIFh3fioko3toMnXBWvTBrn0vioyvAhPWSgxCvtEPph/eaXl1FcblZ9i6IgypsOvyTUMGjaI
	cRBhxjMX1EXLgMGpUTR/F8Jlv5kGC5Oxhr4IYSoES0se0CYZkwGxHorp8sYN31hM0Tgw9b8FtHm
	0PXoXDRR1LwG3tYgZDVwbZyKHWgTs2JfEBcBGrLWhFvnLEWJoEn+/HgM3VOEnS2Td9cC2F6aYLH
	qdDq3db3v+N3qtqIr5u7js34wiBQV4jX0JusH1msKgh/52yBr6Ju7QFRpw1QczkldTg/w6EbYAY
	bzVhFKGKcokMCgYtk3Ec4K08VMZVW4ng8a/aJtxEPWJ9kx6ViYDd9EGl1UcEFkXpS9bjdqoShvb
	pCT5eTxx9DWifDm+Gb7O/jjsTy9U2co1KqswzsmVL3IJJXX4Iqq6UYQINb+nxgRVq919647hQlY
	4v82bX/69hDB/RN7zbrEAdqjVv6mU1cvraev7tIvFeinkSv8HAuOeVgmgcrMCPCh1cBl7HxKrKQ
	nahoWMzN30njEC+ucATiVOtC++z7yXsN
X-Received: by 2002:a05:600c:6749:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb8881a294mr372491295e9.25.1795631778705;
        Wed, 25 Nov 2026 10:36:18 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm36941016f8f.2.2026.11.25.10.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:36:18 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v4 2/4] spdx30: Record the lifecycle scope of dependencies
Date: Wed, 25 Nov 2026 19:36:11 +0100
Message-ID: <20261125183613.1335718-3-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125183613.1335718-1-stondo@gmail.com>
References: <20261125183613.1335718-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 18:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251238
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

A Cargo.lock file lists the crates for all targets, and some crates
only run at build time (build scripts, proc-macros and the crates
they use). The fetcher downloads all of them, but only some end up in
the binary.

Add the variable SPDX_DEPENDENCY_SCOPE_FUNCS. A class adds a function
to it that gives the downloads of a recipe a lifecycle scope. The
create_spdx task links the build to each download with a scoped
dependsOn relationship: runtime, build or test. A download that is
fetched but not used on the target gets an annotation instead. The
SPDX code does not read the files of a package manager.

For Cargo, add a do_cargo_metadata task that writes the dependency
graph for the target with cargo metadata --filter-platform, and the
scope function oe.rust.cargo_dependency_scopes() that reads it. The
graph has all features, because a recipe can enable features in
several places (CARGO_BUILD_FLAGS, PACKAGECONFIG, pyproject.toml). So
a crate counts as not used on the target only when no feature uses
it. If cargo cannot give the graph, the task does not fail, and the
crate downloads get no scope.

The walk expands each workspace member only once. Members can depend
on each other in a cycle, and a member can be a dev dependency of
itself, as uv-preview is in python3-uv-build.

Add unit tests for the scopes, with member cycles.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes-recipe/cargo.bbclass             | 27 ++++++
 meta/classes/create-spdx-3.0.bbclass          | 12 +++
 meta/lib/oe/rust.py                           | 74 ++++++++++++++
 meta/lib/oe/spdx30_tasks.py                   | 48 ++++++++++
 .../oeqa/selftest/cases/oelib/cargo_scopes.py | 96 +++++++++++++++++++
 5 files changed, 257 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 586071988a..4bb685599a 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -26,6 +26,33 @@ cargo_do_compile () {
 	"${CARGO}" build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} "$@"
 }
 
+# The crate dependency graph for the target, with the crates that are not
+# used on it removed. create-spdx uses it to give each crate download a
+# lifecycle scope. The graph has all features, as the features that a
+# recipe enables are not known here: a crate is left out only when no
+# feature uses it on the target.
+CARGO_METADATA_FILE = "${WORKDIR}/cargo-metadata.json"
+
+do_cargo_metadata () {
+	rm -f "${CARGO_METADATA_FILE}"
+	# Some recipes inherit cargo without being a cargo project
+	if [ ! -f "${CARGO_MANIFEST_PATH}" ]; then
+		return
+	fi
+	# Without the graph, create-spdx keeps the PURLs of all crates. So do
+	# not fail when cargo cannot give it, for example when the recipe
+	# configures the crate sources in its own way.
+	if ! "${CARGO}" metadata --format-version 1 --offline --locked \
+		--manifest-path "${CARGO_MANIFEST_PATH}" \
+		--filter-platform "${RUST_HOST_SYS}" --all-features \
+		> "${CARGO_METADATA_FILE}"; then
+		bbnote "cargo metadata failed: the crate downloads get no lifecycle scope"
+		rm -f "${CARGO_METADATA_FILE}"
+	fi
+}
+addtask cargo_metadata after do_configure before do_compile do_create_spdx
+SPDX_DEPENDENCY_SCOPE_FUNCS += "oe.rust.cargo_dependency_scopes"
+
 cargo_do_install () {
 	local have_installed=false
 	for tgt in "${B}/target/${CARGO_TARGET_SUBDIR}/"*; do
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 3c37a50a69..3a69305127 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -21,6 +21,15 @@ SPDX_INCLUDE_BITBAKE_PARENT_BUILD[doc] = "Report the parent invocation of bitbak
     for each Build object. This allows you to know who invoked bitbake to perform \
     a build, but will result in non-reproducible SPDX output."
 
+SPDX_DEPENDENCY_SCOPE_FUNCS ?= ""
+SPDX_DEPENDENCY_SCOPE_FUNCS[doc] = "Space-separated list of functions that give \
+    the downloads of a recipe a lifecycle scope. Each function is called as \
+    func(d, identities). identities is a list of bb.fetch.PackageIdentity, one \
+    for each PURL of the downloads. The function returns a dict that maps the \
+    PURL of each download that it knows to the name of a LifecycleScopeType, for \
+    example runtime, build or test, or to None for a download that is fetched \
+    but not used on the target."
+
 SPDX_PACKAGE_ADDITIONAL_PURPOSE ?= ""
 SPDX_PACKAGE_ADDITIONAL_PURPOSE[doc] = "The list of additional purposes to assign to \
     the generated packages for a recipe. The primary purpose is always `install`. \
@@ -283,6 +292,9 @@ do_create_spdx[depends] += " \
     ${@create_spdx_source_deps(d)} \
 "
 do_create_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
+# The scope functions are called by name, so bitbake does not find them in
+# the code
+do_create_spdx[vardeps] += "${SPDX_DEPENDENCY_SCOPE_FUNCS}"
 
 python do_create_spdx_setscene () {
     sstate_setscene(d)
diff --git a/meta/lib/oe/rust.py b/meta/lib/oe/rust.py
index 1dc9cf150d..a0845c0135 100644
--- a/meta/lib/oe/rust.py
+++ b/meta/lib/oe/rust.py
@@ -4,8 +4,82 @@
 # SPDX-License-Identifier: MIT
 #
 
+import json
+import os
+
 # Handle mismatches between `uname -m`-style output and Rust's arch names
 def arch_to_rust_arch(arch):
     if arch == "ppc64le":
         return "powerpc64le"
     return arch
+
+
+def get_cargo_scopes(metadata):
+    """Return {(crate, version): scope} for the output of cargo metadata.
+
+    Walks the dependency graph from the workspace members: normal
+    dependencies are runtime, build dependencies and proc-macro crates (and
+    everything they pull in) are build, dev dependencies of the members are
+    test.
+    """
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
+def cargo_dependency_scopes(d, identities):
+    """Return the lifecycle scope of the crate downloads.
+
+    See SPDX_DEPENDENCY_SCOPE_FUNCS. CARGO_METADATA_FILE is the output of
+    cargo metadata --filter-platform for the target, so a crate that is
+    only used on other targets gets None.
+    """
+    path = d.getVar("CARGO_METADATA_FILE")
+    if not path or not os.path.exists(path):
+        return {}
+
+    with open(path) as f:
+        scopes = get_cargo_scopes(json.load(f))
+
+    return {
+        i.purl: scopes.get((i.name, i.version))
+        for i in identities
+        if i.purl.startswith("pkg:cargo/")
+    }
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index eded315819..588be68e58 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -476,6 +476,53 @@ def set_package_identity(d, dl, fd):
         dl.software_packageUrl = identity.purl
 
 
+def add_dependency_scopes(d, objset, build, source_files):
+    """Give the downloads a lifecycle scope, see SPDX_DEPENDENCY_SCOPE_FUNCS.
+
+    The build gets a scoped dependsOn relationship to each download with a
+    scope. A download that is fetched but not used on the target gets an
+    annotation instead.
+    """
+    downloads = {}
+    for dl in source_files:
+        purl = getattr(dl, "software_packageUrl", None)
+        if purl:
+            downloads.setdefault(purl, []).append(dl)
+    identities = [
+        bb.fetch.PackageIdentity(dls[0].name, dls[0].software_packageVersion, purl)
+        for purl, dls in downloads.items()
+    ]
+
+    scopes = {}
+    for func in (d.getVar("SPDX_DEPENDENCY_SCOPE_FUNCS") or "").split():
+        scopes.update(
+            bb.utils.better_eval(func + "(d, identities)", {"d": d, "identities": identities})
+        )
+
+    by_scope = {}
+    for purl, scope in scopes.items():
+        if scope is not None and scope not in oe.spdx30.LifecycleScopeType.NAMED_INDIVIDUALS:
+            bb.fatal("SPDX_DEPENDENCY_SCOPE_FUNCS: %s is not a lifecycle scope" % scope)
+        for dl in downloads.get(purl, []):
+            if scope is None:
+                objset.new_annotation(
+                    dl,
+                    "%s %s is fetched but not built: not used on the target"
+                    % (dl.name, dl.software_packageVersion),
+                    oe.spdx30.AnnotationType.other,
+                )
+            else:
+                by_scope.setdefault(scope, []).append(dl)
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
@@ -978,6 +1025,7 @@ def create_spdx(d):
 
     source_files = add_download_files(d, build_objset)
     build_inputs |= source_files
+    add_dependency_scopes(d, build_objset, build, source_files)
 
     recipe_spdx_license = add_license_expression(
         d, build_objset, d.getVar("LICENSE"), license_data, [recipe_objset]
diff --git a/meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py b/meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py
new file mode 100644
index 0000000000..f16718abb9
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py
@@ -0,0 +1,96 @@
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
+import bb.fetch
+import oe.rust
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
+        scopes = oe.rust.get_cargo_scopes(metadata)
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
+
+    def test_dependency_scopes(self):
+        # Only crate downloads get a scope. A crate that is not in the graph
+        # for the target gets None.
+        packages = [package(n) for n in ("app", "used")]
+        metadata = {
+            "packages": packages,
+            "workspace_members": ["app"],
+            "resolve": {"nodes": [{"id": "app", "deps": [dep("used")]}, {"id": "used", "deps": []}]},
+        }
+        identities = [
+            bb.fetch.PackageIdentity("used", "1.0.0", "pkg:cargo/used@1.0.0"),
+            bb.fetch.PackageIdentity("other-os", "1.0.0",
+                                     "pkg:cargo/other-os@1.0.0?repository_url=https%3A%2F%2Fcrates.example.com"),
+            bb.fetch.PackageIdentity("used", "1.0.0", "pkg:npm/used@1.0.0"),
+        ]
+        with tempfile.TemporaryDirectory() as tmpdir:
+            path = os.path.join(tmpdir, "cargo-metadata.json")
+            with open(path, "w") as f:
+                json.dump(metadata, f)
+            d = bb.data.init()
+            d.setVar("CARGO_METADATA_FILE", path)
+            self.assertEqual(oe.rust.cargo_dependency_scopes(d, identities), {
+                "pkg:cargo/used@1.0.0": "runtime",
+                "pkg:cargo/other-os@1.0.0?repository_url=https%3A%2F%2Fcrates.example.com": None,
+            })
+            d.setVar("CARGO_METADATA_FILE", os.path.join(tmpdir, "missing.json"))
+            self.assertEqual(oe.rust.cargo_dependency_scopes(d, identities), {})
-- 
2.56.1

