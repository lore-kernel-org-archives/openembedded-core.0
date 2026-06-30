Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5949BC44501
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 21:04:32 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31374.1782853468338618631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 14:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kluz1UyR;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e93cd4e64bso3734877a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853467; x=1783458267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tZbtQ9Kak64LuP8YK6BtHiCqVZb9HgkqaLZ/peLdzM=;
        b=kluz1UyRq6BlMybcf0cG3g2Nc/j3x3N8GG+dQaIUWSebLMJ7a0xbxPZ6ViW1KzgpDV
         KQtxPvNrPWwjRP/9p09L15oH2Nb2Mk37hwJodBrHHgchvkBZG8QKDMc58xQiEjvmfJQQ
         1ik0AbtgZEeleZM7Jt7Mcy00XMHjLQqwncN4uBvf5aeJJscjJMqKoh96X8dovND1h5Mb
         q7hH8e44ljsYUREzjtz1Iu3Qw0dNDtBPeI7wnKOdIsvNq7VVaeFO3e4o+MKBqkdKFd13
         Bl4EcgBcKudpmj8P+BIZ8OsPt6I4N/Zk5x2aj/csVfGpwBMpA8NuvhiV3LB+mctyF+Zg
         OuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853467; x=1783458267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2tZbtQ9Kak64LuP8YK6BtHiCqVZb9HgkqaLZ/peLdzM=;
        b=KYOsZDL7kylUu9kwveAwOwvsZmPoPGEJujLHBSVWtc0oNMTJqoRDp3BilvyGGY6jo4
         1ZLxBubRu/JIexdSkFU/CkVYHWGzCnxE8SUguvqQFMCDjkv10gqP3NHS6nXMRbU8Gq8q
         MoFgaV1VCjvjZuAc5leCFhBuaxOZafrvdMUHGlAywDfOTZbxL9mK4mRt9pEM/J5WO8CY
         3CN8x/R+yYVyvECxIRGi6BTB0D155kbKJNReT49TYVYgKfZp5WwQ+/aC5xhzvOE7hXii
         M9ujJZUVqArozyx2Kds4GLsHsj7Y5sNMpilz3lJUOxXbf6xScCxkgPMNue+n5HYCmiTS
         2JjQ==
X-Gm-Message-State: AOJu0YzchX41D2S5rgIeYV6v443fgnbkcYx1sJ8bXyKPr2zsSHP3RVel
	uDPys4Q2w8kfrgdYKuRkxFTMGMJs/sfc79APoifMa7GwBsqx8/U9zLXENHDU9w==
X-Gm-Gg: AfdE7cmWj4PyJF2b3swrgArEaxuM6lD0xwA9/GBmwsQHgwLtsZKgau5wGOBOaYlBJB+
	z7euI3ZSDIF8zJw0OSypTtnr17z4yU15hqscCiNH/dGBMpMccABZDqkfq5Xv/J/R9Js6ChxERCA
	jXjWsLksfsqJmIbl22O0JlZfNx49/w3ku9aT0Ul5ICXRaBjj5lHzDSGQvgUL7UNAl3I8fWm/L/0
	se+1mwwFM14KzzVpucAdiOfeTJU2tbPolpk9NMo2Vhw5OEKw9oOdP7vNm1llKBnqZRN30yqtw3+
	b4OIzFMNGM4l6E2JDkRxCi5mO57d9zf4oxfmw08j5r41/SqqNJlKLuHGWM4mwRxM7yN1bLIdxRH
	aNxbtELwHho0zh/Vjy1rFk/7vztGFwbTG+qWA8YL37qBCTXgj7fJwqN7GK4AahUdZQokDA5JcoU
	FG2kK4cNial3ttfWnfcFV4
X-Received: by 2002:a05:6830:dc2:b0:7d7:d524:bc88 with SMTP id 46e09a7af769-7e9ec6152ebmr4261891a34.10.1782853467393;
        Tue, 30 Jun 2026 14:04:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::3cfc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfd01cdsm3248143a34.8.2026.06.30.14.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:04:27 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 04/10] classes-global/sstate: Keep SPDX generating setscene dependencies
Date: Tue, 30 Jun 2026 15:01:38 -0600
Message-ID: <20260630210422.1903245-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630210422.1903245-1-JPEWhacker@gmail.com>
References: <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260630210422.1903245-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 21:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239919

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


