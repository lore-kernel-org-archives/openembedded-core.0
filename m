Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9018.1794994173657344978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 01:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WwXSyNuh;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b467581b98so8620695e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 01:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994172; x=1795598972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCnKPtUQHSdJWUcsI8ObwiYmflzjvVZtTz8DgENpeSE=;
        b=WwXSyNuhOy+3FwDDJ9ueaAjix5Nowr7Wix7CgK6IXXHX+Pj2egXTwcvQv8CPXZB1Cl
         WYR7Z+1XfPEqbrO7ipudu+G8e5LvysuDpsDpND/YZWLX/OfaWWHex3BChLqNAOE5cbtv
         f332C84QBtEgA2glKL+Rh1Ya3Vfn2ZDN0KXma8MPzUFQlq/HoWSwSg8z5aIy6JgwuJq0
         D+sfYIphrHnZ0jlUXfH9cBr+7z/ykJ56Y+xWunJDDLPmbmfXFoKVJAokYYjQLMM7860s
         z6gjpR0lNZk28+XZz6BnMIIZuutT2AAyHofYJ9LYfK7dSMLA6ZEGVlnejUV9X3wgRx+I
         eUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994172; x=1795598972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CCnKPtUQHSdJWUcsI8ObwiYmflzjvVZtTz8DgENpeSE=;
        b=cL3NbKb7Pv0rj+JG7ttp5INtacHf+Oki2/G36d0f7dP4WEgWW3Du1LWYH9avCCmMmC
         wUTiouaWvD+lwA5coRyzl4K+r0A+Yfald6PE6CAFIUmqt2Dsd+4f3CRmWO2H+NsqdEBK
         EdAH7ICEmO4Hcg3rFK4KPYOFtulKnkyZN8IZVmSebpgb/hgB+AtFmP/wXXGkqKnq+RJq
         vNxkgJ3GCNkLupfCImS80bHA3s3rJmqOYD7HPqZ/1gK7x5r8n9XhDsszsFsOYbhkMrKm
         R9KLDh1oV6Fr3+Cm1o+C5xuo6jPlPZcuX1FqTC+EEA3MfAMtqKc+ggRECQ+N3WjG8jNL
         YYWw==
X-Gm-Message-State: APuU4Z/ed0EN7GrpqJ3TdYmWXIsN15UV616BaQaeT0iwaJtRkllo9vuq
	rRmMzlK8XpDCQDEFuPH0rlfrVbSzDg6ZwCADl3acV5IGKyOxsh7HDtJERT/QbQ==
X-Gm-Gg: AYBFou0DpVDAI6ojuq2UELhYdR1KUllEY3TBHHDNr2gdTDcl4iQg8zKT6H5caTA4pSM
	UtKlzva3SXSac+/BGQKWfm7sHaMlyWKRbTs4KKs+oP+gaga/KuuCMSDLwiUz44DQlEfJmiuQXU5
	MvwO+4ZXEFsEV5YGx/ONtelKEeiCVjfAxFpbyeSOp3gjNKSvH2bnak3jL++cpvnGiS8kx0ROndb
	e9yrseNfd9FxRkLGMeuZQF5FW8jUMXGU8oDT5Cngta0AsYmiFfrtkGHpg8/yzmRlEui8AsheanS
	Ex7iX4PTwV7T0UDVcCQRWQIlXZUdL5lamIaWAwRjv9k7Ohabfs1QN6L9+U8LljPnhYIrrSiwYb+
	uX97HGpl5/YpomXLsoy2Pr5AfSHyQR7to/w4qYUsi1XiKNW3Eq3JCbuRcdyART3lXpKhoFfCGmd
	kFj28GN78vFeKqSV5+KYmTQJ0S2x7hZmu1H0pIpG1KkhZuMEkBOiwc44Hw4J63biPvLHdZiahlo
	hqOwuBoNUPE6aNIXHQkGkodW03RUs2x6Du7jZDeuTY8IHF+UO8wBgCDyYJfBoShWjaZuyKUmQZJ
	qYUb2fFBL+Q=
X-Received: by 2002:a05:600c:4e44:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4bb7da0f78dmr32647475e9.8.1794994171802;
        Wed, 18 Nov 2026 01:29:31 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d28ec3asm55486755e9.0.2026.11.18.01.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:29:31 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Stefano Tondo <stondo@gmail.com>,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [PATCH 2/4] spdx30: Record the lifecycle scope of crate dependencies
Date: Wed, 18 Nov 2026 10:29:25 +0100
Message-ID: <20261118092927.204959-3-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118092927.204959-1-stondo@gmail.com>
References: <20261118092927.204959-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250528
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

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes-recipe/cargo.bbclass | 17 +++++++
 meta/lib/oe/spdx30_tasks.py       | 81 +++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

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
index 58fe45ec7e..e40716a6df 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -476,6 +476,85 @@ def set_package_identity(d, dl, fd):
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
+    stack = [(m, "runtime") for m in members]
+    while stack:
+        pkg_id, scope = stack.pop()
+        if pkg_id not in members:
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
@@ -978,6 +1057,8 @@ def create_spdx(d):
 
     source_files = add_download_files(d, build_objset)
     build_inputs |= source_files
+    if bb.data.inherits_class("cargo", d):
+        add_dependency_scopes(d, build_objset, build, source_files)
 
     recipe_spdx_license = add_license_expression(
         d, build_objset, d.getVar("LICENSE"), license_data, [recipe_objset]
-- 
2.56.1

