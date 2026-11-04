Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11866.1793806542973624314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ua1em9b3;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso520290eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806542; x=1794411342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2WIZpwPimqavDkzbT1ZpVYufGFe+CtcAal/HZACf5Y=;
        b=ua1em9b31pU4ALP4OJII3ijc0gfZAZisGWROFT9lVsdvN4DT1iUgWnpcoIKFIJwQmF
         SxclQzMzuWi59Z/ABg4hx8PcvAQ34YsHctL4xQnNlBY6s5uzLeajtgMyQE/bM6kf/DHE
         z4ENgiCC1o7gtyu9uN2JQpBWysWReeDVU3EhE8cyX9RsLnP4orm5naCa/mupP2IC0QTR
         SDrkTbMhvvVpNxdfGeAaywxEzWEAStorTF+cZ557FvFQFsOGiM4wB//vIBfGjbc9YmrX
         HeiIZ8JxOp2/BQlqam2jfw9qvH0mI384nfbvctQ4ncRjZKDTS0dvPnp1CUiVHQpALv1i
         aumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806542; x=1794411342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2WIZpwPimqavDkzbT1ZpVYufGFe+CtcAal/HZACf5Y=;
        b=0nbnuvNpHrefzEVLZbjFeLXi5NgnAzoJcTptdTE0nggWZSK8vHZCasuCcsHuqrR9KJ
         gWFA/P/oUI8fsIvcSjOIneELUXnjcy3VwFbMBVQ8qd3XLyyGhLQzngCdqE+UZ8c4ePhG
         lxc8iPKAy3U+pzPF0I2oodwVjPmXD/yIqCceAG5daMTCOlI9A9otABawq1457I7t54/v
         pmZP31MFSlNlR+ObSkxIM1DX/wXH1tuSmeUq/RkW58dQsxgpdffdiZEYRXDSEK6PaezF
         1K/X69dzQVpAHk/kktu4muCF1GkaopWztz/cx76dAlNI3BeGxYRNfcVa6DwBKATiSSuP
         gD3g==
X-Gm-Message-State: APuU4Z903U/jFTIAOJE30pvel85/P5e8XeT6HVfJ8ixtetQcFhl4LVSq
	34mFBLkixbZZy6LUJ1bbzOrgJXDJa/YXk6cKOo0xD0EtLjx4qajBpQjHxdq90Q==
X-Gm-Gg: AYBFou34Fprwf56Bx4c9ApFodBzQ0xczBbeNgor58/brkNDdAFwlx2N2oXySUEKhZdx
	S87gY/CWDku516se3KFLt4Yk990OWkD3Ol+yfr0BXE07qLvyOYk9W2tm0b7JnmiPu6dUmSrjpOC
	b6/2gNVCsqRIfyCzsceGV/F/VLkhjqwSQvwYVgrdyNSUKCrEH/cqN6e3Q21mOO6RtmvpgJKaFkB
	ckC7d5rzqQRLevUajyUU421za7etFK9+v1KBSaoKP8YEPs1GlLqxT902RYno27ACkaqA7Tk5a6E
	z4FOOkEBDZ/5eyhPPqGIY5j3ypzOFKGb9f0bVG07niPXGiOq5i4Q/chSrsJ3w1wSgAhRukinomg
	oTZwhSY1VMhBjH4BLZK3q8teJxv75WFTpyPrDdgpeUaRRJCuac8Ub6m4/PhIYzoDzn84vIB9NXk
	1V2Rirom77mrQ/R1ICIpj6BMkTWLroS8AfspYwCW2GcUc94U7w7MILWUEceygUuoMt5yEFvL27q
	Ew9P3PHt0OEJaGwkFDClyklbthYaFAxJ3jZ7M6tJP/zw/+bCk6XmM1E4+pCfmdkP4jl4c1y5DFv
	vp0jjuhXDoR+iS9+gofPsZsZpOse
X-Received: by 2002:a05:6808:6408:b0:4d6:9283:1df2 with SMTP id 5614622812f47-5640de79c53mr11156288b6e.61.1793806542039;
        Wed, 04 Nov 2026 07:35:42 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1d6f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9f8basm1894928b6e.12.2026.11.04.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:35:41 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v8 4/9] classes-global/sstate: Keep SPDX generating setscene dependencies
Date: Wed,  4 Nov 2026 08:33:57 -0700
Message-ID: <20261104153535.3184146-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104153535.3184146-1-JPEWhacker@gmail.com>
References: <20261028220609.1348489-1-JPEWhacker@gmail.com>
 <20261104153535.3184146-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249397
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

