Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5899.1793051194056273462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 14:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gG2Byi5I;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-48e2d5a69c4so1973161fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 14:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793051193; x=1793655993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2WIZpwPimqavDkzbT1ZpVYufGFe+CtcAal/HZACf5Y=;
        b=gG2Byi5IUAfzoDTXZVoBfrnPLEfC2LVKyv0SFCvbIeybkHD+BJl/R1H6eZvE18yZlL
         gwGehIuUHPzzMMAnjodNJJZXFK1f8K7axql7fW+TC5Lq3tUa8Ugz7N3vF4Avx+i+0huG
         4MuwZIquFVdv3hLYwtJ5UjNm2w57wT1Yz/5ihJZ+BOdJpVUYwVTZbYEhK1dflsFLgvCU
         53Z9qQVIf7ynVw3wGAvVCGydu7ozBXtAj5VkE+Itq2MSBe+9TpJPTyji2urOerLvYsRg
         wFeiXyH6l2xLRttMG1OoB0lq26j0nqR218jCZClnTaT/izhmRMMngFTGasV0tJ1qjVNh
         fKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051193; x=1793655993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2WIZpwPimqavDkzbT1ZpVYufGFe+CtcAal/HZACf5Y=;
        b=ZuG1EftFiL9wixCYy5J/j38mIDdwNWa4AxapSnSbk9iK3WfGhW4AOjszO4KE84GrBM
         TyQmDKXJpvUNp2GBG+sPcRGR3qJwB34TB5xOBbw1FO/3hxhkH49nm8LQXdv2zX1kf/4A
         kQI/X5JxWNoNiH2k0+dHndv5Il0i96++2Dist8p8DH8OLcDAxyyYw5+VmXWYCaBN5BEF
         7bD6lHlzkEZKYGQS83UinCkrbVtSPVZXs8E8LS4t2WKKbgmYMVqjPSdD/3S857G9zsPW
         fzKg/ovvTMmpUFersn4b+y402myZFD0q0ZHxJnOw5Xyg5cfaxiV84R9MbVzl6kpfM+/q
         A7Aw==
X-Gm-Message-State: AFq9FYIjVRv/CI3AQ/EiVzedteVQ2gGPCy734J1zRCMxv2a+54vNDmt3
	5LVnHOdFqWe6xPQZYc7NYFS5TgmVa2wu22VAaP/gOrRfKHHJK6L1Ne/u/YNZQw==
X-Gm-Gg: AYBFou1vBrCSZwMNSOQRpZgQeEBI5gNrYE2b+Xq5Wn2E2paIZtbzPYa0muGFFrp+plA
	jwYTVzEvGtiX0KNj4y/ezAnP31lzgH0jL17IVExDYENihturPqP/6bIEOOQ/rE252eFeBU8gYhl
	XhX/9w7P8ZFexLa584I/iH346/z5191S9T4fwAiMi6Rg9GRvja5iaFtJvFgnegWmrWliVSt6pKh
	SrwHQMReFAoHMQ/IK38Pcu8p2dxRPkZtBXF3QduZxsZ8zSPKgHcTkJkm1vVM5k+WgSFubcio01l
	jJ28sA0HqHnZyMA++iMWX2D8cmSJFdQ1QEh9ZB2vsxr1pMY+wynHxIQgqUdEesPrFVZUGgz6bGZ
	cYnhhV54P3frJ5FKcX53cMCaiHuhDBU+KOj9lo0NOTg4fGi4se6GjlFgf1LYy33WiE75aQ11ZSh
	V/iZp2u8lfJVY0c31cW45+pWyDj7LTNzWpxt4AeVNqtG6+oKfh6wEGygRxcxSV/gddnQJS6eUOe
	CAwRtkKeHzvmgImI8q8Ly1UXL+AWfITjetKWW8Rs7eYOwUaX27oHKpfppXzt1ZFiZnt46RFgAHy
	wyOVwMcp36hdFlZhDAowITJtlUc=
X-Received: by 2002:a05:6808:1998:b0:53b:ccda:fb8e with SMTP id 5614622812f47-55c0020a7e1mr5883834b6e.23.1793051193161;
        Mon, 26 Oct 2026 14:46:33 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::283f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424a05dsm6304219b6e.4.2026.10.26.14.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:46:32 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 4/6] classes-global/sstate: Keep SPDX generating setscene dependencies
Date: Mon, 26 Oct 2026 15:45:24 -0600
Message-ID: <20261026214627.2388650-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026214627.2388650-1-JPEWhacker@gmail.com>
References: <20260630210422.1903245-1-JPEWhacker@gmail.com>
 <20261026214627.2388650-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 21:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248697
Content-Type: text/plain; charset="utf-8"

Tasks that create SPDX documents can reference SPDX ids from documents
created by any task they depend on. When it comes time to create the
final SBoM, these referenced SPDX ids must be present so that they can
be merged into the SBoM. Specifically, when a task that restores from
sstate (a setscene task) is one that can create an SPDX document, and
that task is depended on by at least one other task that can create an
SPDX document, it must always be restored.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/sstate.bbclass | 38 ++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index b2fa93650a..c6d9459182 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1125,11 +1125,28 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
     logit("Considering setscene task: %s" % (str(taskdependees[task])), log)
 
-    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_create_spdx", "do_create_recipe_spdx", "do_deploy_archives"]
+    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_deploy_archives"]
+
+    # SPDX tasks are only needed if depended on directly, unless they are
+    # needed by another task that is creating SPDX documents
+    SPDX_TASKS = {"do_create_spdx", "do_create_recipe_spdx", "do_create_package_spdx"}
 
     def isNativeCross(x):
         return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")
 
+    def isSpdxTask(key):
+        taskname = taskdependees[key][1]
+        # Tasks that start with "do_deploy" might be included in
+        # SPDX_DEPLOY_TASKS and should be kept
+        if taskname.startswith("do_deploy"):
+            return True
+
+        # Tasks that are don't start with do_deploy, but still deploy SPDX data
+        if taskname in {"do_image_complete", "do_populate_sdk", "do_populate_sdk_ext"}:
+            return True
+
+        return taskname in SPDX_TASKS
+
     # We only need to trigger deploy_source_date_epoch through direct dependencies
     if taskdependees[task][1] in directtasks:
         return True
@@ -1142,6 +1159,8 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
                 return False
         return True
 
+    spdx_deps = []
+
     for dep in taskdependees:
         logit("  considering dependency: %s" % (str(taskdependees[dep])), log)
         if task == dep:
@@ -1198,12 +1217,27 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
             # Target populate_sysroot need their dependencies
             return False
 
-        if taskdependees[dep][1] in directtasks:
+        # Collect dependees that create SPDX documents
+        if isSpdxTask(dep):
+            spdx_deps.append(dep)
+            continue
+
+        if taskdependees[dep][1] in directtasks or taskdependees[dep][1] in SPDX_TASKS:
             continue
 
         # Safe fallthrough default
         logit(" Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])), log)
         return False
+
+    # SPDX generating tasks can refer to the SPDXID from the SPDX output of
+    # their dependencies. Therefore if the current task can generate SPDX and
+    # is depended on by another SPDX generating task, it must be kept so that
+    # the IDs can be correctly resolved when merging SPDX output into a
+    # complete SBoM
+    if spdx_deps and isSpdxTask(task):
+        logit(f"Keeping SPDX task {taskdependees[task]} needed by SPDX task(s) {', '.join(str(taskdependees[k]) for k in spdx_deps)}", log)
+        return False
+
     return True
 
 addhandler sstate_eventhandler
-- 
2.56.0

