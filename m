Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BEFFD4F29
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:24 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2602.1773168076043869795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ceAwd209;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4672076355aso755615b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168075; x=1773772875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUBzgp+fyUFvBBsxz2jPyyhfEK+4QWDU2iqhGmxuUuU=;
        b=ceAwd209jUWemGuggcJg14wNu++twvZ2/0bTGpDDsiANzgl/Db8CzkRYAqwzHid3q7
         dhYqZ/x6NgYPf92zNBbmvdNuJxtHG7CK9DO58cD8QHDj6OPzoMKo6k2GuetN4hkXhQ7n
         BpqrPaXmueXoRkYHBW7UGoS0Rk38g6RVF8MFHIDWPsXl5mO/yB8jp1VFQjd/Irf5+bRw
         dpxZGwm1pRTBdNkigEIoEcPC7J1MVGlTap0rqrg2czSiAlkkAywe9q9jOcJJALbOhIX9
         fuNlR/S2OMyLn42k773a2PcK2LRXUghkf/DI3jcBParYyzLFxp9ethjj4xc6vVZBqb2h
         Tn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168075; x=1773772875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MUBzgp+fyUFvBBsxz2jPyyhfEK+4QWDU2iqhGmxuUuU=;
        b=O1HEtkYk1Am6Oc+1nMBrovvBa/numYreesr63bl0LmeQmxUMkV9ijSWdUIz1KfA/2k
         Y7zc8Ubhuto19czp4ukNTYMKDHj4MyqhSFpsFKQzmgGVfT3jcgX4HkKCk2nDwMO4UZ//
         WXQnXGmjFPmdGUTzO7rbcVFWxi59jPclzz8C70susJ3tY36o2UKqYa9dD90fkt8szzNu
         fAbpkN5KIRyT6pQBmQNlxL6jxd5Qk+TneoGs2tSQ0eYyhoBmRkByCUkWtD8mGKJg89wl
         csPZocbhUa/54fdBosAnAl1VQ7DMXl9vRj5rhv8zgb/oIv7RF4bSYR/HBjx5g35YKpa+
         SF5A==
X-Gm-Message-State: AOJu0YxjQG388kBUt5Pu1J3FJ5bzZfAzapI1kxl/h+b+Z3vuRX31RIJc
	DHTKvmpOcp5ZaqDjJfC8w12ddR8yzizixHqEvyHabu2+yc5maSBBvempNAMP0A==
X-Gm-Gg: ATEYQzxmhfdPfF9fE0DpTFmjxidcdDnzLmM1TkOfYwprhOWwpYiyJcXuvhDt38zYN7d
	Pqv7vQRv8RM3BGqr8fKir3Yvt71rkVdzW7ycZjWSc3FuNWlDjWhg19HgppluX57ciSZwLvRSpJX
	R2Ibnvwec7gJ3mdZ7jd84pdwKynsI0oVsDG1FnCIPj0KRys7pid+TWY1cO1rMBhlqZbJnwn0IZy
	Y9X555e0p+AYm8OAnk33lExB1vBv7Cl3mldvKvlXzfDUTkZSN0Fmnnr3S5m4oG7FkUHOgWl1lna
	8/axnQOUm08d2z66oEMuQ5yIse+vdF8ZOZT/K/82ZrAYlAq2p08aiEhpbw/LaCMAMtl/h1eLsOm
	Gz4HbUyjScuvqHnDks550jJ2qAZ7cAaHHPb+o83FK/h31MXJVorJ6bapJV2JNFZBSVQH4LhvEkq
	UtGNHVcfWs6ljHjJiKA8UE
X-Received: by 2002:a05:6808:2217:b0:464:305e:8fcc with SMTP id 5614622812f47-466dca4e89dmr9129773b6e.20.1773168075010;
        Tue, 10 Mar 2026 11:41:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 14/15] spdx: Remove do_collect_spdx_deps task
Date: Tue, 10 Mar 2026 12:38:34 -0600
Message-ID: <20260310184058.533343-15-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232825

Removes the do_collect_spdx_deps task. This task was added a long time
ago, and appears to have been added due to a misunderstanding about how
the task graph works. It is not necessary since tasks can directly call
collect_direct_deps() with the appropriate task that they depend on to
get their dependencies.

This should fix several classes of SPDX bug where documents could not be
found because the wrong deps were being looked for due to which tasks
were re-run

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/nospdx.bbclass   |  1 -
 meta/classes/create-spdx-2.2.bbclass | 22 +++++----
 meta/classes/create-spdx-3.0.bbclass |  5 +-
 meta/classes/spdx-common.bbclass     | 22 ---------
 meta/lib/oe/spdx30_tasks.py          | 22 +++++----
 meta/lib/oe/spdx_common.py           | 69 +++++++++++++---------------
 6 files changed, 62 insertions(+), 79 deletions(-)

diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index 90e14442ba..7c99fcd1ec 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -4,7 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
 
-deltask do_collect_spdx_deps
 deltask do_create_recipe_spdx
 deltask do_create_spdx
 deltask do_create_spdx_runtime
diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index aa39208eae..1c43156559 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -277,7 +277,7 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
 
 add_package_sources_from_debug[vardepsexclude] += "STAGING_KERNEL_DIR"
 
-def collect_dep_recipes(d, doc, spdx_recipe):
+def collect_dep_recipes(d, doc, spdx_recipe, direct_deps):
     import json
     from pathlib import Path
     import oe.sbom
@@ -290,9 +290,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     dep_recipes = []
 
-    deps = oe.spdx_common.get_spdx_deps(d)
-
-    for dep in deps:
+    for dep in direct_deps:
         # If this dependency is not calculated in the taskhash skip it.
         # Otherwise, it can result in broken links since this task won't
         # rebuild and see the new SPDX ID if the dependency changes
@@ -405,7 +403,7 @@ do_create_recipe_spdx() {
     :
 }
 do_create_recipe_spdx[noexec] = "1"
-addtask do_create_recipe_spdx after do_collect_spdx_deps
+addtask do_create_recipe_spdx
 
 
 python do_create_spdx() {
@@ -532,7 +530,8 @@ python do_create_spdx() {
             if archive is not None:
                 recipe.packageFileName = str(recipe_archive.name)
 
-    dep_recipes = collect_dep_recipes(d, doc, recipe)
+    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
+    dep_recipes = collect_dep_recipes(d, doc, recipe, direct_deps)
 
     doc_sha1 = oe.sbom.write_doc(d, doc, pkg_arch, "recipes", indent=get_json_indent(d))
     dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
@@ -603,7 +602,7 @@ python do_create_spdx() {
 }
 do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
-addtask do_create_spdx after do_create_recipe_spdx do_package do_packagedata do_unpack do_patch do_collect_spdx_deps before do_populate_sdk do_build do_rm_work
+addtask do_create_spdx after do_create_recipe_spdx do_package do_packagedata do_unpack do_patch before do_populate_sdk do_build do_rm_work
 
 SSTATETASKS += "do_create_spdx"
 do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
@@ -638,7 +637,9 @@ python do_create_runtime_spdx() {
 
     license_data = oe.spdx_common.load_spdx_license_data(d)
 
-    providers = oe.spdx_common.collect_package_providers(d)
+    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
+
+    providers = oe.spdx_common.collect_package_providers(d, direct_deps)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
     package_archs = d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
@@ -760,6 +761,7 @@ addtask do_create_runtime_spdx_setscene
 
 do_create_runtime_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_runtime_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
+do_create_runtime_spdx[deptask] = "do_create_spdx"
 do_create_runtime_spdx[rdeptask] = "do_create_spdx"
 
 do_rootfs[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
@@ -829,7 +831,9 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
     license_data = oe.spdx_common.load_spdx_license_data(d)
 
-    providers = oe.spdx_common.collect_package_providers(d)
+    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
+
+    providers = oe.spdx_common.collect_package_providers(d, direct_deps)
     package_archs = d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 6df66c193b..862e656b2c 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -186,13 +186,14 @@ python do_create_recipe_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_recipe_spdx(d)
 }
-addtask do_create_recipe_spdx after do_collect_spdx_deps
+addtask do_create_recipe_spdx
 
 SSTATETASKS += "do_create_recipe_spdx"
 do_create_recipe_spdx[sstate-inputdirs] = "${SPDXRECIPEDEPLOY}"
 do_create_recipe_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_recipe_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_recipe_spdx[cleandirs] = "${SPDXRECIPEDEPLOY}"
+do_create_recipe_spdx[deptask] += "do_create_recipe_spdx"
 do_create_recipe_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
 
 python do_create_recipe_spdx_setscene () {
@@ -208,7 +209,6 @@ addtask do_create_spdx after \
     do_unpack \
     do_patch \
     do_create_recipe_spdx \
-    do_collect_spdx_deps \
     do_deploy_source_date_epoch \
     do_populate_sysroot do_package do_packagedata \
     before do_populate_sdk do_populate_sdk_ext do_build do_rm_work
@@ -244,6 +244,7 @@ do_create_package_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_package_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_package_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
+do_create_package_spdx[deptask] = "do_create_spdx"
 do_create_package_spdx[rdeptask] = "do_create_spdx"
 do_create_package_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
 
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index abf2332bee..4b40cbf75c 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -87,28 +87,6 @@ def create_spdx_source_deps(d):
     return " ".join(deps)
 
 
-python do_collect_spdx_deps() {
-    # This task calculates the build time dependencies of the recipe, and is
-    # required because while a task can deptask on itself, those dependencies
-    # do not show up in BB_TASKDEPDATA. To work around that, this task does the
-    # deptask on do_create_recipe_spdx and writes out the dependencies it finds, then
-    # downstream tasks read in the found dependencies when writing the actual
-    # SPDX document
-    import json
-    import oe.spdx_common
-    from pathlib import Path
-
-    spdx_deps_file = Path(d.getVar("SPDXDEPS"))
-
-    deps = oe.spdx_common.collect_direct_deps(d, "do_create_recipe_spdx")
-
-    with spdx_deps_file.open("w") as f:
-        json.dump(deps, f)
-}
-addtask do_collect_spdx_deps
-do_collect_spdx_deps[deptask] = "do_create_recipe_spdx"
-do_collect_spdx_deps[dirs] = "${SPDXDIR}"
-
 oe.spdx_common.collect_direct_deps[vardepsexclude] += "BB_TASKDEPDATA"
 oe.spdx_common.collect_direct_deps[vardeps] += "DEPENDS"
 oe.spdx_common.collect_package_providers[vardepsexclude] += "BB_TASKDEPDATA"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index ba15d74278..76f3338fb8 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -298,13 +298,11 @@ def get_package_sources_from_debug(
     return dep_source_files
 
 
-def collect_dep_objsets(d, subdir, fn_prefix, obj_type, **attr_filter):
-    deps = oe.spdx_common.get_spdx_deps(d)
-
+def collect_dep_objsets(d, direct_deps, subdir, fn_prefix, obj_type, **attr_filter):
     dep_objsets = []
     dep_objs = set()
 
-    for dep in deps:
+    for dep in direct_deps:
         bb.debug(1, "Fetching SPDX for dependency %s" % (dep.pn))
         dep_obj, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
             d, subdir, fn_prefix + dep.pn, obj_type, **attr_filter
@@ -551,8 +549,10 @@ def create_recipe_spdx(d):
             )
         )
 
+    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_recipe_spdx")
+
     dep_objsets, dep_recipes = collect_dep_objsets(
-        d, "static", "static-", oe.spdx30.software_Package
+        d, direct_deps, "static", "static-", oe.spdx30.software_Package
     )
 
     if dep_recipes:
@@ -753,8 +753,10 @@ def create_spdx(d):
         build_inputs |= files
         index_sources_by_hash(files, dep_sources)
 
+    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
+
     dep_objsets, dep_builds = collect_dep_objsets(
-        d, "builds", "build-", oe.spdx30.build_Build
+        d, direct_deps, "builds", "build-", oe.spdx30.build_Build
     )
 
     if dep_builds:
@@ -1071,7 +1073,9 @@ def create_package_spdx(d):
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     deploydir = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
 
-    providers = oe.spdx_common.collect_package_providers(d)
+    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
+
+    providers = oe.spdx_common.collect_package_providers(d, direct_deps)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
 
     if get_is_native(d):
@@ -1248,7 +1252,9 @@ def write_bitbake_spdx(d):
 def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None):
     import oe.sbom30
 
-    providers = oe.spdx_common.collect_package_providers(d)
+    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
+
+    providers = oe.spdx_common.collect_package_providers(d, direct_deps)
 
     build_deps = set()
 
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 3aaf2a9c8b..c0ef11f199 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -38,7 +38,7 @@ def extract_licenses(filename):
 
 
 def is_work_shared_spdx(d):
-    return '/work-shared/' in d.getVar('S')
+    return "/work-shared/" in d.getVar("S")
 
 
 def load_spdx_license_data(d):
@@ -77,12 +77,15 @@ def process_sources(d):
     return True
 
 
-@dataclass(frozen=True)
+@dataclass(frozen=True, eq=True, order=True)
 class Dep(object):
     pn: str
     hashfn: str
     in_taskhash: bool
 
+    def to_tuple(self):
+        return (self.pn, self.hashfn, self.in_taskhash)
+
 
 def collect_direct_deps(d, dep_task):
     """
@@ -105,7 +108,9 @@ def collect_direct_deps(d, dep_task):
     )
 
     if not dep_task in depflags:
-        bb.fatal(f"Task {dep_task} was not found in any dependency flag of {pn}:{current_task}")
+        bb.fatal(
+            f"Task {dep_task} was not found in any dependency flag of {pn}:{current_task}"
+        )
 
     for this_dep in taskdepdata.values():
         if this_dep[0] == pn and this_dep[1] == current_task:
@@ -118,25 +123,14 @@ def collect_direct_deps(d, dep_task):
     for dep_name in this_dep.deps:
         dep_data = taskdepdata[dep_name]
         if dep_data.taskname == dep_task and dep_data.pn != pn:
-            deps.add((dep_data.pn, dep_data.hashfn, dep_name in this_dep.taskhash_deps))
+            deps.add(
+                Dep(dep_data.pn, dep_data.hashfn, dep_name in this_dep.taskhash_deps)
+            )
 
     return sorted(deps)
 
 
-def get_spdx_deps(d):
-    """
-    Reads the SPDX dependencies JSON file and returns the data
-    """
-    spdx_deps_file = Path(d.getVar("SPDXDEPS"))
-
-    deps = []
-    with spdx_deps_file.open("r") as f:
-        for d in json.load(f):
-            deps.append(Dep(*d))
-    return deps
-
-
-def collect_package_providers(d):
+def collect_package_providers(d, direct_deps):
     """
     Returns a dictionary where each RPROVIDES is mapped to the package that
     provides it
@@ -145,16 +139,15 @@ def collect_package_providers(d):
 
     providers = {}
 
-    deps = collect_direct_deps(d, "do_create_spdx")
-    deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME"), True))
+    all_deps = direct_deps + [Dep(d.getVar("PN"), d.getVar("BB_HASHFILENAME"), True)]
 
-    for dep_pn, dep_hashfn, _ in deps:
+    for dep in all_deps:
         localdata = d
-        recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
+        recipe_data = oe.packagedata.read_pkgdata(dep.pn, localdata)
         if not recipe_data:
             localdata = bb.data.createCopy(d)
             localdata.setVar("PKGDATA_DIR", "${PKGDATA_DIR_SDK}")
-            recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
+            recipe_data = oe.packagedata.read_pkgdata(dep.pn, localdata)
 
         for pkg in recipe_data.get("PACKAGES", "").split():
             pkg_data = oe.packagedata.read_subpkgdata_dict(pkg, localdata)
@@ -171,7 +164,7 @@ def collect_package_providers(d):
                 rprovides.add(pkg)
 
             for r in rprovides:
-                providers[r] = (pkg, dep_hashfn)
+                providers[r] = (pkg, dep.hashfn)
 
     return providers
 
@@ -202,25 +195,21 @@ def get_patched_src(d):
             bb.build.exec_func("do_unpack", d)
 
             if d.getVar("SRC_URI") != "":
-                if bb.data.inherits_class('dos2unix', d):
-                    bb.build.exec_func('do_convert_crlf_to_lf', d)
+                if bb.data.inherits_class("dos2unix", d):
+                    bb.build.exec_func("do_convert_crlf_to_lf", d)
                 bb.build.exec_func("do_patch", d)
 
         # Copy source from work-share to spdx_workdir
         if is_work_shared_spdx(d):
-            share_src = d.getVar('S')
+            share_src = d.getVar("S")
             d.setVar("WORKDIR", spdx_workdir)
             d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
             # Copy source to ${SPDXWORK}, same basename dir of ${S};
-            src_dir = (
-                spdx_workdir
-                + "/"
-                + os.path.basename(share_src)
-            )
+            src_dir = spdx_workdir + "/" + os.path.basename(share_src)
             # For kernel souce, rename suffix dir 'kernel-source'
             # to ${BP} (${BPN}-${PV})
             if bb.data.inherits_class("kernel", d):
-                src_dir = spdx_workdir + "/" + d.getVar('BP')
+                src_dir = spdx_workdir + "/" + d.getVar("BP")
 
             bb.note(f"copyhardlinktree {share_src} to {src_dir}")
             oe.path.copyhardlinktree(share_src, src_dir)
@@ -233,7 +222,9 @@ def get_patched_src(d):
 
 
 def has_task(d, task):
-    return bool(d.getVarFlag(task, "task", False)) and not bool(d.getVarFlag(task, "noexec", False))
+    return bool(d.getVarFlag(task, "task", False)) and not bool(
+        d.getVarFlag(task, "noexec", False)
+    )
 
 
 def fetch_data_to_uri(fd, name):
@@ -243,8 +234,8 @@ def fetch_data_to_uri(fd, name):
     uri = fd.type
 
     # crate: is not a valid URL.  Use url field instead if exist
-    if uri == "crate" and hasattr(fd,"url"):
-       return fd.url
+    if uri == "crate" and hasattr(fd, "url"):
+        return fd.url
 
     # Map gitsm to git, since gitsm:// is not a valid URI protocol
     if uri == "gitsm":
@@ -259,11 +250,13 @@ def fetch_data_to_uri(fd, name):
 
     return uri
 
-def is_compiled_source (filename, compiled_sources, types):
+
+def is_compiled_source(filename, compiled_sources, types):
     """
     Check if the file is a compiled file
     """
     import os
+
     # If we don't have compiled source, we assume all are compiled.
     if not compiled_sources:
         return True
@@ -278,11 +271,13 @@ def is_compiled_source (filename, compiled_sources, types):
     # Check that the file is in the list
     return filename in compiled_sources
 
+
 def get_compiled_sources(d):
     """
     Get list of compiled sources from debug information and normalize the paths
     """
     import itertools
+
     source_info = oe.package.read_debugsources_info(d)
     if not source_info:
         bb.debug(1, "Do not have debugsources.list. Skipping")
-- 
2.53.0


