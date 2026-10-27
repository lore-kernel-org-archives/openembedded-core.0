Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31418.1793141381112697572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 15:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ir2+Gd3j;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-48e94879f02so162170fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 15:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793141380; x=1793746180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2WIZpwPimqavDkzbT1ZpVYufGFe+CtcAal/HZACf5Y=;
        b=ir2+Gd3j7VjarNwM/F3cRdYS4237+FrolDI45vPbzamB/WFR5WMuvYZg+cIITGUSIE
         EKt1couVukjqlUAwd03zRI5ag+tkVnWw+vXL3et3ED8CIUChviS3+KQk9cywR8jvpJze
         MoE2JP7/PGjwY0AA92tzELLcW7syqwXVpuAN+k9D1Af88sgSeaxBLJlzMLlI8QYloU/9
         1hk4+zMBo3ocHtI6k8SryiQc6ChHSRn9CWmzmXP4b0UOFaHK3bKV64coTi+/tQGOyRng
         99e/q62TJafBtd9kbi7Abz6dRKKt5SQxFRhT/VZMrdZ2RN78XlR+MOwws4YMVPiUCqi+
         xNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141380; x=1793746180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2WIZpwPimqavDkzbT1ZpVYufGFe+CtcAal/HZACf5Y=;
        b=i8olxYF4InCCOSxeigUehn1zSo+YAItN9pNjSHYKLdL9CLkbNMojhRLmhCrJhNiiur
         3yjyop+sqFWKdGEKDmKffoq58jpBZI8lMBxB5F/A2tWhHrX6xrzbnEARFvRlP+1BdU/1
         FvHK+6LM+XH8Bah60pWhZbNf+zIMatTaIa4pl4LD/GKJOZltyLdqu6oGQC0muvinByZF
         1xPNeT7G/EPcBGExLrlbMXu3c1yTXHxVF4AgYSFBysPGbzP0V+dj9tVsALBUegDAVWgJ
         s2Sqcyb/E6ounws9ZN4VsaZONLisjrbiCgsvkdEmi+kWld2CGULiuv4jUb2IqJNJ1ICi
         nx4A==
X-Gm-Message-State: AFq9FYJ3y9r8pofABbLY4wp3QJTTysytz3YucNT+rlB5Bdk84vHVrvHc
	hy2v0M9qy4adLsDcChs+mXJ2mnap4yRzwkgJv27JVXeFwHm8Zz8Cvl0lf5aqkg==
X-Gm-Gg: AYBFou1JfZK8Ez/vvjjNDG9xGxysfAVc+3jrTMFYVmVT2zdfMSqtA8JvV8PiLfxPK58
	9Xte8peAxNpVBNX3nxWVbw2CY8x2e/A7VoRoBfzlvC1pGcxrzn/EsJZ85PVadyc/RGM3b9WTbS8
	CytxN0AKhvNofQbWD1kc0uiU+wH6CJS0cO+FzUDxGxlut8yKtpUNpz82uFvL1tdn+T7XIGBVO9e
	ZfZnIKKYJE+abMXFthulkd3OmlRoZ7ZDfMwI/azUFnNeFGuLjpR8Mla+Ki0WmjOV3bH950ahiml
	3WNImP+5ifKvsT0215XqrKTu9iVBC3cFdJsY1wwQZpV3qTr+0n1XT3PrC6+PyWZGO3l5UGHSM3Q
	bOA/okHyy0v290CxM+GAXkT5nAiraFbxzupwU/sbACJf+y6zpyWgey+F9XSc/tv8dOEmBGv9fQ/
	1qbBgtD7XjYRnAB7uFkPaip8qCUNz2RyjFiidfueyZbACuke77pzTs5WJPIpWLjZE6E4MJZf25p
	5ZM2klnatGRQBMKEWoxiAh01ak4QwA+Qe1R5CAek7vaudGhnmUeUw==
X-Received: by 2002:a05:6870:2f14:b0:475:e0a7:9f2f with SMTP id 586e51a60fabf-4a8bb49f303mr759636fac.29.1793141380021;
        Tue, 27 Oct 2026 15:49:40 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1109])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b7979514sm1111037fac.17.2026.10.27.15.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:49:39 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 4/7] classes-global/sstate: Keep SPDX generating setscene dependencies
Date: Tue, 27 Oct 2026 16:47:18 -0600
Message-ID: <20261027224931.385138-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027224931.385138-1-JPEWhacker@gmail.com>
References: <20261026214627.2388650-1-JPEWhacker@gmail.com>
 <20261027224931.385138-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 22:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248768
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

