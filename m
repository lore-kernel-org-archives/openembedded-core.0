Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8441.1793225177305952493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 15:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Kmz/8c0j;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-48ed188ee81so743201fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225176; x=1793829976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2WIZpwPimqavDkzbT1ZpVYufGFe+CtcAal/HZACf5Y=;
        b=Kmz/8c0jPAsESpv9FQRsY3rTErtx4AseGSUf8zMgBTlyIV6LRQDs58fTG9+Gwa3acL
         L+6VzkaEs4wFWszEnGEhwrGjK1cEe1w1otBbM/xM1u24NQJDxH+sMC2z1ZPzbcqWVf2v
         Pq2THBdnmB9wZD+6oftsox8MQlKsjMiAGmX/b614d/AxA6tREmpMoKez8iSOY25ZqoRH
         uj4gkN37H06uMWyl6evBM2mT+r1Uu8sDlDqZGl+pfIMXOugFLRNjtvGhajaDR2ql+WN7
         CXb6kV7CC1iak6EquWoUOKKObYqZWkgLfommfl/xJKhD7fdsQWSM07oDzyW3a29KVMxN
         W8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225176; x=1793829976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2WIZpwPimqavDkzbT1ZpVYufGFe+CtcAal/HZACf5Y=;
        b=1XH2UF5ZjjDSCaOUb7OLPXGaj2ucV81MsybUY786gyeAVGLikU6DWMDn+e+IDTcAff
         3i5bKIG1ECqroHyjH3Co3nZlXSPe+s91hlRjzun2wy6QfU/tNhqufXtraw6vMTRTqyWA
         GXbm+VhxxJJS2ZdjXYzBrbQpOOodY1xqDTKn2r88oVghbS5r/zdV98U4MLtbDpKC2WC3
         V9Q91vqYWItsMAX55I4mezg3hww9sxC9rofX1xWEHMXQF3z0AQTJmmn8tGyo20MRPgCc
         ojbMPbjtzD0u6i35OGBx9LDXi+vclbR2vUrS6NQw62xQoSdsRxp65HbDFgiN91X5ZRrJ
         wrfA==
X-Gm-Message-State: AFq9FYI1vX0RILOBW/HDmbZ55ryNopETB9vGdGrqF04TksxDJ1HgIZ7R
	+ZMdI5Az6tJVWaa18o345k2Q3SpW7NuzIvjGOinD+6b+nwUhl9OxMlVufpXaXA==
X-Gm-Gg: AYBFou2H5Ipw1FG49hs4hoXVmTYXObqhv2EhDmAxAiYcWSHXmFdWXogd/n/OGDPZusb
	Jul/EuIQn1XrX+efJuxD/Bpa/ZyT0u/TrlHxddnumfDhXPDJo+0sSetdnPy/YOCS1koKg1crVHz
	9JwLODjCH3pM/hbnKOj5YOlAvQVg+CaEA/p31GABpFTb6M0C1kTzjZCbxNgfMO60Ll2ysIOI15E
	FH7yahHYyBlwa/TpP4dtbKVQ8txDc+ycNlQYbRM0iBU5Mxs1Di9+4leZBoJJWa9VbPEPtciLJCK
	iQKFbqVsfkRHO2C8YViXg8PQoKkkyCLj6XOypA3u65YLATjga4dsRT/TKqw0BpcNs7h3sYOhLD8
	cnD0fmEC3TTviMI3tEg7iDK1S72ypgEhV33pseQM3owvPnzqbDg8FsRNETS2hx3vSrIVyyzd/Ws
	TIpL7CDbkTBnAFNJq85EleiER8a4mZ+KZQa27JQS/DI1dvzKabiYpRGlJg2Xb3VkCg4w8khuE6T
	ePka+dXd1F/18RH/32sA3TpaAU8dSe9igCV1DrNVOKm8WrbbG2+HGvwmBtMHHPjWIFfstKXpYKr
	FzJ7JTwwG0ilx8CLycbNHdYsSGs=
X-Received: by 2002:a05:6871:3a12:b0:48f:e0f6:bd5f with SMTP id 586e51a60fabf-4a8bb70088dmr2596523fac.48.1793225176410;
        Wed, 28 Oct 2026 15:06:16 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::8aac])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77abffcsm3527597fac.4.2026.10.28.15.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:06:15 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 4/8] classes-global/sstate: Keep SPDX generating setscene dependencies
Date: Wed, 28 Oct 2026 16:04:35 -0600
Message-ID: <20261028220609.1348489-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028220609.1348489-1-JPEWhacker@gmail.com>
References: <20261027224931.385138-1-JPEWhacker@gmail.com>
 <20261028220609.1348489-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 22:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248841
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

