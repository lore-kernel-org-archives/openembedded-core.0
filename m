Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7FFCDE008
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 14:17:18 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8223.1782310633953107609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 07:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=leoVOTdg;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69de16f5e80so628470eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782310633; x=1782915433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tZbtQ9Kak64LuP8YK6BtHiCqVZb9HgkqaLZ/peLdzM=;
        b=leoVOTdg1n6tosl/tHoDDWuWOKHEhHpa4hSpFw6IALEPdrIdhCfCdvydZMftuqiKh4
         ZFVAvi7SyXP2qPnZyoEOWPn8zz+pQNES2CjQiH1pSz92hXXeZ8FR1ElUeKTi2N5IcYoq
         LVfunF8REBls7zAGx23ep/cRcQTgXJ+K572eSi8Qz4F2blN0aBGNvXtpOgNzB6gj02NH
         OWsyCgAKYuVde2KLCH4Txu126AYh45O1UPpQMt+ddk/ry86Eohz9dvEP1URrs4Mn/vcF
         oLQvBnqxmVofzsOD+npGISTFH6TjoBjFBe5oCE+Vqhj2oNE23zyF394tfq7EceuqOzcq
         BJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310633; x=1782915433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2tZbtQ9Kak64LuP8YK6BtHiCqVZb9HgkqaLZ/peLdzM=;
        b=rnVv2VhFVkCK7tVBVE8yQib8wJZiiLnY2euSCJinmoFgPRTvynirjje3mr7is5Y7Er
         L5lSoXUm0QqcwIxwexjfh5I9BKTZ2s0iZecH2FETxZSPUEgYcB03MoXkT0Z9kcU301tx
         hkPlfxwpScmeegGVNhJ5VfwGtdYB+et+4dzBOU8XCLFzhkNlbQeBgLM9f4OLGJf1FdMH
         +xUQvCOp7EpT7VBeSFM0Utb3SqReUL2qlu0dH7oNOyrmhato0up9A6HJRmEC/zdGC5rv
         7sBmAI+DiQBQlfmD34/h9Yr55j+Rc1ZZe8Cz2lBvoldbRpist1HWZmEL2WuMNhLwh/UC
         Oerg==
X-Gm-Message-State: AOJu0YwrsYOH23jzlEr5i2oMBVEG++W4CkJ6W/Pkc2odfmeSBfijs4gk
	uo1xipP9PKDDZmJkJkR736v/D7frqEMgDBwT0nbD/Ai+ziSYZ+Bw1gA52MI22A==
X-Gm-Gg: AfdE7clS3OIe63I3lkNOJbCmClmQasnbeeV7KvbaXDVRBl9JhQBXqbB9m3CJaQ1A8fz
	13oStntOAJ6R7gWOvVkTkKpmj2MMvkp9KBJXlRNpom85/AHE6AcyBLt5o3N6+VAe1PEiN/r/bhu
	N3kKD2Vy9lfqwdYTE8PqUpkGTzEe6SWLGdukEjhoBASPj5LzaeMZ2XTifAEKtMuieaTUQoaeXEV
	bf97bi5vfKHjqcHMZ/VrHcrv2sWfEgvFO8UU2InshI34C6fRS13lRGf8EmCgJFhhaZeHkD/uW2i
	ScFS4lYbb979c6dvvzE6Mc/O6qvotwiC6N0LcV2AzbVl/t6q0OCvKGGMgsZnVruTmjDsMeEwraW
	TEns0rqcPHRVSR97X/AoEZQZTqg6xFFx/Fb6ks5KimvEabELqPH4ZWyieKQyJD4PLvpld62mQfu
	cWoOh10t6//w==
X-Received: by 2002:a05:6820:2001:b0:69b:196a:de67 with SMTP id 006d021491bc7-6a122cece79mr2301504eaf.0.1782310633025;
        Wed, 24 Jun 2026 07:17:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::87cd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0e9f2a4e9sm8946149eaf.2.2026.06.24.07.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:17:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 4/8] classes-global/sstate: Keep SPDX generating setscene dependencies
Date: Wed, 24 Jun 2026 08:15:21 -0600
Message-ID: <20260624141706.2164567-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624141706.2164567-1-JPEWhacker@gmail.com>
References: <20260618165032.347436-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 14:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239513

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
index 4ad71a70da..4d744a887b 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1119,11 +1119,28 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
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
@@ -1136,6 +1153,8 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
                 return False
         return True
 
+    spdx_deps = []
+
     for dep in taskdependees:
         logit("  considering dependency: %s" % (str(taskdependees[dep])), log)
         if task == dep:
@@ -1192,12 +1211,27 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
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
2.54.0


