Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3928.1795045474576126922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 15:44:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wqYqCAN6;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49d64a88222so208126f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045473; x=1795650273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slJC0v5xsKxvzx+hs6xcHaoETbX+btqhLuTIoYCNnzA=;
        b=wqYqCAN6LPUwhYy4pPc5lJX/ZbwsFvD/zLxfpri3XS0cbT+66p6UMS3NTftWsvKB8L
         YhoXB1f219RszcJQav9JEU95xBmmbm7UIU3OV2me9r21bekHNVjG7AHVRk7er7L9VNKy
         6vmQronazyuhOXICliGM3wDNq3ylq3TS0nl+NenXmZP44tJrJJeRYF1ukJJJ53j93vUK
         FZBnBwX/I7VGcsbZ48Di6/zK7R9ztM1ubFZfeKOHLBU2i372LmH+DJAnNA35v4rWtWXX
         IrsiaFEYHu5qfB0/e8AhJR0876d7AwCBYR/X/V7tCx+b35SzFuPdTxm68DRFDxUzkdY8
         aFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045473; x=1795650273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=slJC0v5xsKxvzx+hs6xcHaoETbX+btqhLuTIoYCNnzA=;
        b=PcyhwcSg9q2q6GGTTVcmVnIKyNXboUPa4Ljn1pTocEWn5oL27GTWZmwXknUrflGeoU
         hAwK+Fo+RQ6pUJSbfRpAKTgZQxK33kf8jo9ejdExkuWPEUz+WK25XUuHOnlf5qvq4wFa
         5Czvp7FOJKftE9r+TasZi2c+Cr/QEx0r1Att0+CyKZu23c6nEdLiE5/P74wrZOo0A1Bx
         +Djxh7hTQ48Ya4qLFSkUkQIOk955O0RIGvkptCtdd6O3T7LphTwi10Xz2X+P6fipgIqG
         THxiyjwVfiOPe3ByliTt3NWWHc2TS+nM3CPi907xuVbzO3sSIIKzpJ0JjDK0a68SShTQ
         lFTQ==
X-Gm-Message-State: APuU4Z9DnAWn+BJL9i1H5oWwHOjvpAOc+uikyz3MRm5BAgssKMnpvQFG
	BAVmKmg8oraQxFnWZXbnsEbJzyVcQYGYeyz7BNrvpt9vR0Xg4aa//q5QxnOXqg==
X-Gm-Gg: AZFdTZc7BjTPxGlGsjI9DmXh2v26xzSbchD/L/GtFBMS054kUSRNwmQAb4TwjDvU4QU
	BHg8XtO6D/XhGJ1hjEGLJpGXCURaIPIdRQ4I2kqePNy7Wm0w8TMmk/oa6po5UL1B+B6ZBLRNa53
	KgcAj+GhBMBmLmLCrd/BUidw1/BMw67Cmr0OFHhwgNPE7AdX7oMT8CHGZJIEChOfW/5ZgPPn6Mu
	Dvk8/ZgXNLoueMKgqyXl67WDioMvHVfWnoNFLCjJD9EHniHPwxdKhaqY49kzOUb2nLD2SYnMFB8
	bhzhTAOgb5Ym0fIkJ8HKGZ9OaU37AblG0za4OsASgHdgIyAPi8JF062AfW8wZDpoGSwR1wDn5Fk
	E/fzzoUd7tmKaSp+MV6z995oSAlt9OQ5yoADSib9tEVgAeSaLgjlY4JW0DQd091i302anjHxo4C
	yXpI4Yph5FM0e277Vz+dY07uLNydmiljY+DmLdOHSkySqVUwnMjJOXSmb1HLMe7jD3C6/xwXDjJ
	ZTYFSZKVFKG7pd4+3gVL7Hgr2oKMR5XqVthP9a68xU/l+Dit2cwyle2Z/xg2k0iDrjI7gbGjyS6
	dyWQ63IUexk=
X-Received: by 2002:a05:6000:420d:b0:491:cd7:e96b with SMTP id ffacd0b85a97d-4a9a5cf6a6bmr203932f8f.15.1795045472701;
        Wed, 18 Nov 2026 15:44:32 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm6730718f8f.19.2026.11.18.15.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:44:32 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v2 2/4] spdx30: Record the lifecycle scope of crate dependencies
Date: Thu, 19 Nov 2026 00:44:23 +0100
Message-ID: <20261118234425.3681880-3-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118234425.3681880-1-stondo@gmail.com>
References: <20261118234425.3681880-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 23:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250602
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
index 58fe45ec7e..7aae73ed0d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -476,6 +476,94 @@ def set_package_identity(d, dl, fd):
         dl.software_packageUrl = identity["purl"]
 
 
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

