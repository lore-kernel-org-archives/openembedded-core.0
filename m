Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5897.1793051192594689359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 14:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ad7VO4qC;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53656465d1dso1804802b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 14:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793051192; x=1793655992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkHE/er36Hqv89KTCOB7k6z8xrYAAh2+zMxhj+bKTYE=;
        b=ad7VO4qC41XVd+QfnveKFSBxjZgsCg0tTSnhRJPw41DlblqWxuBtyu+5RXX3i4dNTj
         ewlAJJdxSr5DIzaWUBUKg1HpQ8tNDj69ARyCqMAAXsjDUX+mz9tqjMnavJ1OVx8nOE2o
         PGl+O2jIfDc/woQ08Blm2EDpG6aQA0KaOHO/lJtUDBdwkbEZphHIlpHUoFNPIwHtngWe
         nOQAdJo57eGVB4cn+e3q8uQpi5viEsFh6d1OoAdHK0vhjyTrcxadmv8ZWDH+x1i7t3dw
         JP3AQuMWdaQZfHtHsajB0znV9PixlORurCVMvFEenifjxB9sj8LmIn9trvUVexXuy2+p
         +YxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051192; x=1793655992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GkHE/er36Hqv89KTCOB7k6z8xrYAAh2+zMxhj+bKTYE=;
        b=lsf9Klk3F44JCthTpX3mBBseQmMuSoeXWjsjtYQUDl84PPc2K//EFCfiCiqYt3SXJn
         7TrbVpHz10r1M0RtRtpbyzEMggEQrtv3/+QpOr9clRsaPc6U/XCHLMFVv/LTruE32taJ
         Xy/KQ4CjMm2l59wNWJGwcFhKsxDlTY9lL5aGXQOCSieK4RdbGqkiS9ywSVsIsboLjeZu
         sKTNClvnmUwA9Mwu0EmGMVgyy1MY+okCwm14TjSFlwVzZwRhVsA+jrJu+h0P24/t3ZY7
         Oh45EE9NfOwQOWoHkJun2QNsoD34PAd0JtQTqaW6qd2KJRgH3R7Ki12cNrqtOkaM9C6/
         MbDw==
X-Gm-Message-State: AFq9FYJYZJkmbZF4QueUXbkUxQoTFCGkvfW30L+U27/5nCUXMqmsq6mT
	U0tiEdhhMuHiEtRP+QyS3fMlnIIgvhErggXODi4FNxtCmVfqw5C3Gyb2V9aVVg==
X-Gm-Gg: AYBFou1sQDjN/7VpjucM5NjDolH/L+ZYoXd9OhPTeqDGf5KvTnNkExO/SOLwGZ9dBv6
	7UDY9YL4R4uVMqwQwSPbsMHL+UYqbsXSYR7+NeERDJtSI2C+3PVz+c6QO3B1VJUjTGnOOgpBnQK
	Xzac4EB7sW78Q3LBgzvz+BHG8dgdqdpY1asmoQur28AvVXwFFtAPROxFlYGJE8qNX/w39w9Rwkb
	zT1w92+PyfvsoYuWxG5kKoLmsFxsVQTKtVoVvr9j6TKAa2ZQ3HTTu6g0io8U+LgLApMmACtouVj
	G0KqkWQnbosAKMg7RAzNbRq8RPaCwKoR4yRbzN5iA1JVMWhxzggkDu+gZh0UhHD1ENsHQ2JTDwG
	+54nxdocsBcNjmx6JudI8wZdj1EmQAs29aD3HbAH3LvfQ54CWeAwZMwj98MBs6gMkAmAYirJS7U
	DflaBACF6hM9YnX6lhVd5YU/VgmgGEJF9MepxpQRU0SrI7SGs7buh5I95zQ0scKSF29gqIvDjXo
	BCUbWsDhtApTMt8fwPbWA4E9ziqE46wXVm+5yBNlQDU6h7952yj/oc=
X-Received: by 2002:a05:6808:1798:b0:4fb:6996:aac9 with SMTP id 5614622812f47-55c0030c83amr5269557b6e.35.1793051191538;
        Mon, 26 Oct 2026 14:46:31 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::283f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424a05dsm6304219b6e.4.2026.10.26.14.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:46:31 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 2/6] spdx: Add ability for deploy tasks to create SPDX
Date: Mon, 26 Oct 2026 15:45:22 -0600
Message-ID: <20261026214627.2388650-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026214627.2388650-1-JPEWhacker@gmail.com>
References: <20260630210422.1903245-1-JPEWhacker@gmail.com>
 <20261026214627.2388650-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 21:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248695
Content-Type: text/plain; charset="utf-8"

Adds support for "deploy" tasks (like do_deploy) to write out SPDX
documents that describe what has been deployed.

Deploy tasks will automatically detect many dependencies on other
recipes; specifically they will correctly detect dependencies on any
do_create_spdx task, and also other deploy tasks that generate SPDX
output. The only known notable exception are transitive (e.g.
originating from other upstream tasks) dependencies on
do_image_complete, and do_populate_sysroot. However, these are detected
if a direct dependency of the deploy task (via translation of the task
dependencies).

This same dependency finding algorithm is now applied to the image
generation SBoM; this means that if an image creation task depends on a
task that generates a deploy SBoM, it will show up in the dependency
graph of the image. A typical example is a wic file that consumes the
kernel, u-boot, etc. will now correctly list those as a dependency, as
long as their do_deploy step is added to SPDX_DEPLOY_TASKS.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../create-spdx-image-3.0.bbclass             |   4 +-
 meta/classes-recipe/deploy.bbclass            |   1 +
 meta/classes-recipe/nospdx.bbclass            |   1 +
 meta/classes/create-spdx-3.0.bbclass          | 181 +++++++++++
 meta/classes/spdx-common.bbclass              |   1 +
 meta/lib/oe/sbom30.py                         |  46 +--
 meta/lib/oe/spdx30_tasks.py                   | 282 +++++++++++++++---
 meta/lib/oe/spdx_common.py                    |   2 +-
 8 files changed, 453 insertions(+), 65 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index cf79ef5b01..b60cdd826f 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -30,7 +30,7 @@ python do_create_rootfs_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_rootfs_spdx(d)
 }
-addtask do_create_rootfs_spdx after do_rootfs before do_image
+addtask do_create_rootfs_spdx after do_rootfs do_create_recipe_spdx before do_image
 SSTATETASKS += "do_create_rootfs_spdx"
 do_create_rootfs_spdx[sstate-inputdirs] = "${SPDXROOTFSDEPLOY}"
 do_create_rootfs_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
@@ -47,7 +47,7 @@ python do_create_image_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_image_spdx(d)
 }
-addtask do_create_image_spdx after do_image_complete do_create_rootfs_spdx before do_build
+addtask do_create_image_spdx after do_image_complete do_create_rootfs_spdx do_create_recipe_spdx before do_build
 SSTATETASKS += "do_create_image_spdx"
 SSTATE_SKIP_CREATION:task-create-image-spdx = "1"
 do_create_image_spdx[sstate-inputdirs] = "${SPDXIMAGEWORK}"
diff --git a/meta/classes-recipe/deploy.bbclass b/meta/classes-recipe/deploy.bbclass
index f56fe98d6d..f222a8560f 100644
--- a/meta/classes-recipe/deploy.bbclass
+++ b/meta/classes-recipe/deploy.bbclass
@@ -6,6 +6,7 @@
 
 DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 SSTATETASKS += "do_deploy"
+SPDX_DEPLOY_ARTIFACTS_DIR:task-deploy = "${DEPLOYDIR}"
 do_deploy[sstate-inputdirs] = "${DEPLOYDIR}"
 do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 
diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index 6ccb93ba01..723194da2d 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -12,3 +12,4 @@ deltask do_create_package_spdx
 deltask do_create_rootfs_spdx
 deltask do_create_image_spdx
 deltask do_create_image_sbom_spdx
+deltask do_create_deploy_sbom
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 6d47aa1301..6077105094 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -163,6 +163,49 @@ SPDX_GIT_PURL_MAPPINGS[doc] = "A space separated list of domain:purl_type \
     on gitlab.example.com to the pkg:gitlab PURL type. \
     github.com is always mapped to pkg:github by default."
 
+SPDX_DEPLOY_TASKS ?= ""
+SPDX_DEPLOY_TASKS[doc] = "A space separated list of sstate tasks that produce \
+    deployed output (usually written to DEPLOY_DIR_IMAGE). Tasks in this list \
+    will produce SPDX documents that describe the deployed output. Items in \
+    list have the format 'TASK(:FUNCTION)' where 'TASK' is the sstate task \
+    (which must start with 'do_deploy'), and 'FUNCTION' is the optional \
+    function to call to produce the deploy SPDX. If 'FUNCTION' is omitted \
+    a default function is provided that uses SPDX_DEPLOY_ARTIFACTS and \
+    SPDX_DEPLOY_ARTIFACTS_DIR to configure what deploy artifacts it describes \
+    in the SPDX output.\
+    \
+    Dependencies of deploy tasks that produce SPDX data will be automatically \
+    linked in as a build time dependency of the deploy task's SBoM. (for \
+    example, if one do_deploy depends on another recipes do_deploy, this will \
+    be reflected in the SPDX data)."
+
+SPDX_DEPLOY_SBOM ??= "1"
+SPDX_DEPLOY_SBOM[doc] = "If '1' (the default) a task named \
+    do_create_deploy_sbom will be created to automatically collect all deploy \
+    SPDX documents (from SPDX_DEPLOY_TASKS) and combine them into a SBoM \
+    which will be placed in DEPLOY_DIR_IMAGE. This task is added as a \
+    dependency of do_build, so it will run whenever the recipe is built \
+    directly. The name of the document can be set with SPDX_DEPLOY_SBOM_NAME. \
+    If the recipe already has another task to create an SBoM, this should be \
+    set to '0' to prevent multiple SBoMs from being created."
+
+SPDX_DEPLOY_SBOM_NAME ?= "${PN}-deploy-sbom"
+SPDX_DEPLOY_SBOM_NAME[doc] = "The name of the output deploy SBoM when using \
+    create_deploy_sbom"
+
+SPDX_DEPLOY_ARTIFACTS = "AUTO"
+SPDX_DEPLOY_ARITFACTS[doc] = "A space separated list of deployed artifacts, \
+    relative to SPDX_DEPLOY_ARTIFACTS_DIR that should be included in the SBoM. \
+    If 'AUTO' (the default), all files in SPDX_DEPLOY_ARITFACTS_DIR will be \
+    added. A :task- override *must* be used to set this value so that it is \
+    scoped to a specific task"
+
+SPDX_DEPLOY_ARTIFACTS_DIR = ""
+SPDX_DEPLOY_ARTIFACTS_DIR[doc] = "The directory recipe specific directory \
+    where artifacts are deployed for staging to sstate (e.g. for do_deploy, \
+    this is DEPLOY_DIR). A :task- override *must* be used to set this value so \
+    that it is scoped to a specific task."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
@@ -293,3 +336,141 @@ python spdx30_build_started_handler () {
 addhandler spdx30_build_started_handler
 spdx30_build_started_handler[eventmask] = "bb.event.BuildStarted"
 
+python create_deploy_spdx() {
+    import oe.spdx30_tasks
+    from pathlib import Path
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+
+    spdxdeploydir = Path(d.getVar("SPDXDIR") + "/deploy-" + current_task)
+
+    artifactsdir = d.getVar("SPDX_DEPLOY_ARTIFACTS_DIR")
+    if not artifactsdir:
+        bb.fatal(f"{pn}: spdx-artifactsdir must be set for task {current_task}")
+        return
+
+    artifacts = d.getVar("SPDX_DEPLOY_ARTIFACTS")
+
+    oe.spdx30_tasks.create_deploy_spdx(d, spdxdeploydir, artifactsdir, artifacts)
+}
+oe.spdx30_tasks.find_build_dep_objsets[vardepsexclude] += "BB_TASKDEPDATA"
+
+python () {
+    # Most recipes generate SPDX output in a distinct task from the task that
+    # actually is the relevant dependency. As such, we need to map the task
+    # that we care about to the task that generates the corresponding SPDX
+    # output so that we can rely on the SPDX output being present when the time
+    # comes to use it downstream.
+    #
+    # The down side of this is that only the first level of dependencies (e.g
+    # tasks listed in SPDX_DEPLOY_TASKS) will have the mapping done and thus
+    # find the dependencies. Transitive dependencies will not be mapped and
+    # thus the SPDX data will not be linked in.
+    #
+    # Ideally, this will be able to go away once more tasks directly generate
+    # SPDX files for their output instead of combining it into monolithic
+    # functions; tasks listed in this map are the best candidates to have this
+    # done first.
+    TASK_MAP = {
+        # If a task requires the RSS be extended, depend on the SPDX build task
+        # for the recipe, at least until it's possible for do_populate_sysroot
+        # to describe it's own output.
+        "do_populate_sysroot": "do_create_spdx",
+        # If an image is needed, also depend on the task to create the SBoM for
+        # the image
+        "do_image_complete": "do_create_image_spdx",
+    }
+
+    def map_task_deps(task, flag):
+        task_flags= (d.getVarFlag(task, flag) or "").split()
+        for t in task_flags:
+            if t in TASK_MAP and TASK_MAP[t] not in task_flags:
+                d.appendVarFlag(task, flag, f" {TASK_MAP[t]}")
+
+    def before_postfunc(f):
+        return f == "sstate_task_postfunc" or "buildhistory" in f
+
+    if bb.data.inherits_class("nospdx", d):
+        return
+
+    sstate_tasks = set((d.getVar("SSTATETASKS") or "").split())
+    deploy_sbom_tasks = []
+    for task in (d.getVar("SPDX_DEPLOY_TASKS") or "").split():
+        if ":" in task:
+            task, func = task.split(":")
+        else:
+            func = "create_deploy_spdx"
+
+        if not task.startswith("do_deploy") and not task == "do_image_complete":
+            bb.fatal(f"Task {task} is not allowed to deploy SPDX data. Must start with 'do_deploy'")
+
+        deploy_sbom_tasks.append(task)
+
+        if task not in sstate_tasks:
+            bb.fatal(f"{task} is not an sstate task")
+
+        spdx_deploy = "${SPDXDIR}/deploy-" + task
+
+        # Ensure function is sorted properly. It should be right before
+        # sstate_task_postfunc
+        postfuncs = (d.getVarFlag(task, "postfuncs") or "").split()
+
+        new_postfuncs = []
+        while True:
+            if not postfuncs or before_postfunc(postfuncs[0]):
+                break
+            new_postfuncs.append(postfuncs.pop(0))
+        new_postfuncs.append(func)
+        new_postfuncs.extend(postfuncs)
+
+        d.setVarFlag(task, "postfuncs", " ".join(new_postfuncs))
+        d.prependVarFlag(task, "sstate-inputdirs", f"{spdx_deploy} ")
+        d.prependVarFlag(task, "sstate-outputdirs", "${DEPLOY_DIR_SPDX} ")
+        d.prependVarFlag(task, "file-checksums", "${SPDX3_DEP_FILES} ")
+        d.prependVarFlag(task, "dirs", f"{spdx_deploy} ")
+        d.prependVarFlag(task, "cleandirs", f"{spdx_deploy} ")
+
+        deps = (d.getVarFlag(task, "depends") or "").split()
+        extra_deps = ["${PN}:do_create_recipe_spdx", "${PN}:do_create_spdx"]
+        for dep in deps:
+            _, fn, taskname = bb.runqueue.split_tid(dep)
+            if taskname in TASK_MAP:
+                extra_deps.append(f"{fn}:{TASK_MAP[taskname]}")
+
+        d.prependVarFlag(task, "depends", " ".join(extra_deps) + " ")
+
+        map_task_deps(task, "deptask")
+        map_task_deps(task, "rdeptask")
+        map_task_deps(task, "recrdeptask")
+
+    # For now, if a recipe is directly built, deploy all of it's deploy tasks
+    # into a single SBoM. We may need an option in the future to have tasks
+    # that don't do this (e.g. because they do not deploy to a location that is
+    # intended to be consumed by the user)
+    if deploy_sbom_tasks and (d.getVar("SPDX_DEPLOY_SBOM") or "") == "1":
+        bb.build.addtask("do_create_deploy_sbom", "do_build", " ".join(deploy_sbom_tasks), d)
+}
+
+python do_create_deploy_sbom() {
+    import oe.spdx30_tasks
+    from pathlib import Path
+    deploydir = Path(d.getVar("SPDXDEPLOYSBOMDEPLOY"))
+    deploy_tasks = []
+    for task in (d.getVar("SPDX_DEPLOY_TASKS") or "").split():
+        if ":" in task:
+            task, _ = task.split(":")
+        deploy_tasks.append(task)
+
+    oe.spdx30_tasks.create_deploy_sbom(d, deploydir, deploy_tasks)
+}
+do_create_deploy_sbom[sstate-inputdirs] = "${SPDXDEPLOYSBOMDEPLOY}"
+do_create_deploy_sbom[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+do_create_deploy_sbom[recrdeptask] += "do_create_recipe_spdx do_create_spdx"
+do_create_deploy_sbom[cleandirs] += "${SPDXDEPLOYSBOMDEPLOY}"
+do_create_deploy_sbom[file-checksums] += "${SPDX3_DEP_FILES}"
+
+SSTATETASKS += "do_create_deploy_sbom"
+python do_create_deploy_sbom_setscene() {
+    sstate_setscene(d)
+}
+addtask do_create_deploy_sbom_setscene
+SSTATE_SKIP_CREATION:task-create-deploy-sbom = "1"
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 40701730a6..bca169670d 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -26,6 +26,7 @@ SPDX_TOOL_VERSION ??= "1.0"
 SPDXRECIPEDEPLOY = "${SPDXDIR}/recipe-deploy"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
 SPDXRECIPESBOMDEPLOY = "${SPDXDIR}/recipes-bom-deploy"
+SPDXDEPLOYSBOMDEPLOY = "${SPDXDIR}/deploy-bom-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
 SPDX_INCLUDE_SOURCES[doc] = "If set to '1', include source code files in the \
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index b33860e4aa..2d3b54069c 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -1054,6 +1054,25 @@ def write_jsonld_doc(d, objset, dest):
     objset.objects.remove(objset.doc)
 
 
+def make_jsonld_link(d, fn, subdir, name, deploydir):
+    pkg_arch = d.getVar("SSTATE_PKGARCH")
+
+    link_name = jsonld_arch_path(
+        d,
+        pkg_arch,
+        subdir,
+        name,
+        deploydir=deploydir,
+    )
+    try:
+        link_name.parent.mkdir(exist_ok=True, parents=True)
+        link_name.symlink_to(os.path.relpath(fn, link_name.parent))
+    except:
+        target = link_name.readlink()
+        bb.warn(f"Unable to link {fn} as {link_name}. Already points to {target}")
+        raise
+
+
 def write_recipe_jsonld_doc(
     d,
     objset,
@@ -1061,6 +1080,7 @@ def write_recipe_jsonld_doc(
     deploydir,
     *,
     create_spdx_id_links=True,
+    create_task_link=False,
 ):
     pkg_arch = d.getVar("SSTATE_PKGARCH")
 
@@ -1068,23 +1088,7 @@ def write_recipe_jsonld_doc(
 
     def link_id(_id):
         hash_path = jsonld_hash_path(hash_id(_id))
-
-        link_name = jsonld_arch_path(
-            d,
-            pkg_arch,
-            *hash_path,
-            deploydir=deploydir,
-        )
-        try:
-            link_name.parent.mkdir(exist_ok=True, parents=True)
-            link_name.symlink_to(os.path.relpath(dest, link_name.parent))
-        except:
-            target = link_name.readlink()
-            bb.warn(
-                f"Unable to link {_id} in {dest} as {link_name}. Already points to {target}"
-            )
-            raise
-
+        make_jsonld_link(d, dest, *hash_path, deploydir)
         return hash_path[-1]
 
     objset.add_aliases()
@@ -1100,6 +1104,14 @@ def write_recipe_jsonld_doc(
         # out, so always do that even if there is an error making the links
         write_jsonld_doc(d, objset, dest)
 
+    if create_task_link:
+        pn = d.getVar("PN")
+        current_task = "do_" + d.getVar("BB_CURRENTTASK")
+
+        make_jsonld_link(d, dest, "by-task", f"{pn}:{current_task}", deploydir)
+
+    return dest
+
 
 def find_root_obj_in_jsonld(d, subdir, fn_name, obj_type, **attr_filter):
     objset, fn = find_jsonld(d, subdir, fn_name, required=True)
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 3dd87c2a75..c1c0733508 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -598,6 +598,135 @@ def get_is_native(d):
     return bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
 
 
+def set_var_field(d, var, obj, name, package=None):
+    val = None
+    if package:
+        val = d.getVar("%s:%s" % (var, package))
+
+    if not val:
+        val = d.getVar(var)
+
+    if val:
+        setattr(obj, name, val)
+
+
+def find_build_dep_objsets(d, start_task):
+    def find_deps(d, taskdepdata, current_dep, start_dep, visited, depth=0):
+        key = f"{current_dep.pn}:{current_dep.taskname}"
+
+        dep_objsets = []
+
+        if key not in visited:
+            visited.add(key)
+
+            for n in current_dep.deps:
+                dep = taskdepdata[n]
+                dep_name = f"{dep.pn}:{dep.taskname}"
+
+                dep_objset, dep_path = oe.sbom30.find_jsonld(d, "by-task", dep_name)
+                if dep_objset:
+                    dep_objsets.append(dep_objset)
+
+                elif dep.pn == start_dep.pn:
+                    # If this task is still part of the same recipe, continue
+                    # searching up the dependency tree until a valid dependency
+                    # is found. This detects transitive dependencies that may
+                    # have been pulled in by previous tasks in the same recipe.
+                    dep_objsets.extend(
+                        find_deps(d, taskdepdata, dep, start_dep, visited, depth + 1)
+                    )
+
+        return dep_objsets
+
+    pn = d.getVar("PN")
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    for dep in taskdepdata.values():
+        if dep.pn == pn and dep.taskname == start_task:
+            start_dep = dep
+            break
+    else:
+        bb.fatal(f"Unable to find {pn}:{start_task} in taskdepdata")
+
+    return find_deps(d, taskdepdata, start_dep, start_dep, set())
+
+
+def create_deploy_package(d, objset, build, spdxid, name, start_task, files, **attrs):
+    recipe, _ = load_recipe_spdx(d)
+
+    deploy_package = objset.add_root(
+        oe.spdx30.software_Package(
+            _id=spdxid,
+            creationInfo=objset.doc.creationInfo,
+            name=name,
+            software_packageVersion=d.getVar("PV"),
+        )
+    )
+
+    objset.new_scoped_relationship(
+        [oe.sbom30.get_element_link_id(recipe)],
+        oe.spdx30.RelationshipType.generates,
+        oe.spdx30.LifecycleScopeType.build,
+        [deploy_package],
+    )
+
+    set_var_field(d, "HOMEPAGE", deploy_package, "software_homePage")
+    set_var_field(d, "SUMMARY", deploy_package, "summary")
+    set_var_field(d, "DESCRIPTION", deploy_package, "description")
+
+    set_purls(deploy_package, (d.getVar("SPDX_PACKAGE_URLS") or "").split())
+
+    set_timestamp_now(d, deploy_package, "builtTime")
+
+    supplier = objset.new_agent("SPDX_PACKAGE_SUPPLIER")
+    if supplier is not None:
+        deploy_package.suppliedBy = (
+            supplier if isinstance(supplier, str) else supplier._id
+        )
+
+    if files:
+        objset.new_relationship(
+            [deploy_package],
+            oe.spdx30.RelationshipType.contains,
+            sorted(list(files)),
+        )
+
+    objset.new_scoped_relationship(
+        [build],
+        oe.spdx30.RelationshipType.hasOutput,
+        oe.spdx30.LifecycleScopeType.build,
+        sorted(list(files) + [deploy_package]),
+    )
+
+    # Collect dependencies
+    if start_task is not None:
+        dep_builds = set()
+        dep_packages = set()
+        for o in find_build_dep_objsets(d, start_task):
+            if obj := o.find_root(oe.spdx30.software_Package):
+                dep_packages.add(oe.sbom30.get_element_link_id(obj))
+
+            if obj := o.find_root(oe.spdx30.build_Build):
+                dep_builds.add(oe.sbom30.get_element_link_id(obj))
+
+        if dep_packages:
+            objset.new_scoped_relationship(
+                [deploy_package],
+                oe.spdx30.RelationshipType.dependsOn,
+                oe.spdx30.LifecycleScopeType.build,
+                sorted(list(dep_packages)),
+            )
+
+        if dep_builds:
+            objset.new_scoped_relationship(
+                [build],
+                oe.spdx30.RelationshipType.dependsOn,
+                oe.spdx30.LifecycleScopeType.build,
+                sorted(list(dep_builds)),
+            )
+
+    return deploy_package
+
+
 def create_recipe_spdx(d):
     deploydir = Path(d.getVar("SPDXRECIPEDEPLOY"))
     pn = d.getVar("PN")
@@ -790,7 +919,9 @@ def create_recipe_spdx(d):
             sorted(list(all_cves)),
         )
 
-    oe.sbom30.write_recipe_jsonld_doc(d, recipe_objset, "static", deploydir)
+    oe.sbom30.write_recipe_jsonld_doc(
+        d, recipe_objset, "static", deploydir, create_task_link=True
+    )
 
 
 def load_recipe_spdx(d):
@@ -804,17 +935,6 @@ def load_recipe_spdx(d):
 
 
 def create_spdx(d):
-    def set_var_field(var, obj, name, package=None):
-        val = None
-        if package:
-            val = d.getVar("%s:%s" % (var, package))
-
-        if not val:
-            val = d.getVar(var)
-
-        if val:
-            setattr(obj, name, val)
-
     license_data = oe.spdx_common.load_spdx_license_data(d)
 
     pn = d.getVar("PN")
@@ -943,10 +1063,12 @@ def create_spdx(d):
                 )
 
             set_var_field(
-                "HOMEPAGE", spdx_package, "software_homePage", package=package
+                d, "HOMEPAGE", spdx_package, "software_homePage", package=package
+            )
+            set_var_field(d, "SUMMARY", spdx_package, "summary", package=package)
+            set_var_field(
+                d, "DESCRIPTION", spdx_package, "description", package=package
             )
-            set_var_field("SUMMARY", spdx_package, "summary", package=package)
-            set_var_field("DESCRIPTION", spdx_package, "description", package=package)
 
             purls = (
                 d.getVar("SPDX_PACKAGE_URLS:%s" % package)
@@ -1133,7 +1255,9 @@ def create_spdx(d):
                 f"Added PACKAGECONFIG entries: {len(enabled)} enabled, {len(disabled)} disabled"
             )
 
-    oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "builds", deploydir)
+    oe.sbom30.write_recipe_jsonld_doc(
+        d, build_objset, "builds", deploydir, create_task_link=True
+    )
 
 
 def create_package_spdx(d):
@@ -1369,26 +1493,9 @@ def create_rootfs_spdx(d):
         d, "%s-%s-rootfs" % (image_basename, machine)
     )
 
-    rootfs = objset.add_root(
-        oe.spdx30.software_Package(
-            _id=objset.new_spdxid("rootfs", image_basename),
-            creationInfo=objset.doc.creationInfo,
-            name=image_basename,
-            software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.archive,
-        )
-    )
-    set_timestamp_now(d, rootfs, "builtTime")
-
     rootfs_build = objset.add_root(objset.new_task_build("rootfs", "rootfs"))
     set_timestamp_now(d, rootfs_build, "build_buildEndTime")
 
-    objset.new_scoped_relationship(
-        [rootfs_build],
-        oe.spdx30.RelationshipType.hasOutput,
-        oe.spdx30.LifecycleScopeType.build,
-        [rootfs],
-    )
-
     files_by_hash = {}
     collect_build_package_inputs(d, objset, rootfs_build, packages, files_by_hash)
 
@@ -1421,14 +1528,20 @@ def create_rootfs_spdx(d):
                     )
                 )
 
-    if files:
-        objset.new_relationship(
-            [rootfs],
-            oe.spdx30.RelationshipType.contains,
-            sorted(list(files)),
-        )
+    rootfs = create_deploy_package(
+        d,
+        objset,
+        rootfs_build,
+        objset.new_spdxid("rootfs", image_basename),
+        image_basename,
+        None,
+        files,
+    )
+    rootfs.software_primaryPurpose = oe.spdx30.software_SoftwarePurpose.archive
 
-    oe.sbom30.write_recipe_jsonld_doc(d, objset, "rootfs", deploydir)
+    oe.sbom30.write_recipe_jsonld_doc(
+        d, objset, "rootfs", deploydir, create_task_link=True
+    )
 
 
 def create_image_spdx(d):
@@ -1508,10 +1621,13 @@ def create_image_spdx(d):
                 set_timestamp_now(d, a, "builtTime")
 
         if artifacts:
-            objset.new_scoped_relationship(
-                [image_build],
-                oe.spdx30.RelationshipType.hasOutput,
-                oe.spdx30.LifecycleScopeType.build,
+            create_deploy_package(
+                d,
+                objset,
+                image_build,
+                objset.new_spdxid(taskname, "image", imagetype),
+                "image",
+                f"do_{taskname}",
                 artifacts,
             )
 
@@ -1532,7 +1648,9 @@ def create_image_spdx(d):
 
     objset.add_aliases()
     objset.link()
-    oe.sbom30.write_recipe_jsonld_doc(d, objset, "image", spdx_work_dir)
+    oe.sbom30.write_recipe_jsonld_doc(
+        d, objset, "image", spdx_work_dir, create_task_link=True
+    )
 
 
 def create_image_sbom_spdx(d):
@@ -1710,3 +1828,77 @@ def create_recipe_sbom(d, deploydir):
     objset, sbom = oe.sbom30.create_sbom(d, sbom_name, [recipe], [recipe_objset])
 
     oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spdx.json"))
+
+
+def create_deploy_spdx(d, spdxdeploydir, artifactsdir, artifacts):
+    pn = d.getVar("PN")
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+
+    recipe, recipe_objset = load_recipe_spdx(d)
+
+    if artifacts == "AUTO":
+        artifacts = []
+        for root, dirs, files in os.walk(artifactsdir):
+            for p in [Path(os.path.join(root, f)) for f in files]:
+                if p.is_file():
+                    artifacts.append(p)
+    else:
+        artifacts = [artifactsdir / p for p in artifacts.split()]
+
+    artifacts.sort(key=lambda p: (p.is_symlink(), p))
+
+    objset = oe.sbom30.ObjectSet.new_objset(d, f"{pn}-{current_task}-deploy")
+
+    build = objset.add_root(objset.new_task_build(current_task, "deploy"))
+    set_timestamp_now(d, build, "build_buildEndTime")
+    objset.set_is_native(get_is_native(d))
+
+    files = set()
+    for a in artifacts:
+        relpath = a.relative_to(artifactsdir)
+        f = objset.new_file(
+            objset.new_spdxid("deploy", str(relpath)),
+            a.name,
+            a,
+        )
+        files.add(f)
+
+    if not files:
+        bb.fatal(f"No deployed artifacts found in {artifactsdir}")
+        return
+
+    create_deploy_package(
+        d,
+        objset,
+        build,
+        objset.new_spdxid("deploy", pn, current_task),
+        pn,
+        current_task,
+        files,
+    )
+
+    # Create document
+    dest = oe.sbom30.write_recipe_jsonld_doc(
+        d,
+        objset,
+        "deploy",
+        spdxdeploydir,
+        create_task_link=True,
+    )
+
+
+def create_deploy_sbom(d, deploydir, deploy_tasks):
+    pn = d.getVar("PN")
+    sbom_name = d.getVar("SPDX_DEPLOY_SBOM_NAME")
+
+    objsets = []
+    for t in deploy_tasks:
+        o, _ = oe.sbom30.find_jsonld(d, "deploy", f"{pn}-{t}-deploy", required=True)
+        objsets.append(o)
+
+    root_objs = []
+    for o in objsets:
+        root_objs.extend(o.doc.rootElement)
+
+    objset, sbom = oe.sbom30.create_sbom(d, sbom_name, root_objs, objsets)
+    oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spdx.json"))
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 07bf9650e2..9a862d9f5a 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -118,7 +118,7 @@ def collect_direct_deps(d, dep_task):
         )
 
     for this_dep in taskdepdata.values():
-        if this_dep[0] == pn and this_dep[1] == current_task:
+        if this_dep.pn == pn and this_dep.taskname == current_task:
             break
     else:
         bb.fatal(f"Unable to find this {pn}:{current_task} in taskdepdata")
-- 
2.56.0

