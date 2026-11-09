Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3700.1794253686309113381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 11:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=q+WbQhBK;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-70059e4dab6so684421eaf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 11:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253685; x=1794858485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2WIZpwPimqavDkzbT1ZpVYufGFe+CtcAal/HZACf5Y=;
        b=q+WbQhBK+t6kZSRig4nsTYrY/Jewxa2Rn04A+YiYM4ZuYJghnfDNqtAiW6mR2W6qA5
         H7gOA7laYWI32qpn5qF/0rRAwyWyt+CFocSN6qVsQKnSqdO7JWTbXpZspzVtL+QYpZmt
         9KLQBQgJyJPoQ1cToYZRESX5eOrnPr/WIlqF+ktExg0xb8JJt2ip4HNZvlNhz1AAuj/N
         96drW47vzpJfPo7pSyIm+RnnoWxmhtrZFG/poUVOjA5EEpdLkCu8k53Us83hPot2HOEs
         HRfEyRoeRTws8eKfT4SYgkTwXFkGB58SjbHyMcf0FCzHk1Ee14LHs2PysvO4AJPOpRoo
         1kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253685; x=1794858485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2WIZpwPimqavDkzbT1ZpVYufGFe+CtcAal/HZACf5Y=;
        b=zSOf1lqw2HGC2ol1vWou6m2JvALQA935AfOvKEIowUSH7CXRT2Yi+8vPqPRl7qfxmV
         HHrfhDWTz1iu2qyT8UU5RKN2bKndMhoVEki/svPxb7wefkHsVM2MyM2OZhhmjUC1N076
         cmbaR0CNo/BRmEUNqUlRHbJ4PkSMqv3sFkcj5JJiNRzFVcDq8wy5ZEey/NduixarQB03
         Rc6c3NE6r6wKTyFUZhBom+XIy1d9kdUNiJw6JIZDmhgZ2jhqnMbL6s+B7VGDFzWP2ncF
         J15ru9IfXESU4KiWJ/DTDBGzbLVBMXQWrxEsLiZd0kX8CJgat3KwMlLiSlza3ZW6c79d
         81bQ==
X-Gm-Message-State: APuU4Z8rnpPkdgC/M7fqQYcE41k5WrmhsCnJ/0UPh1hthl39y2+spzg/
	Zs5hp8SWb3N5nh0UflBLuPThVZ+7RrHZsNFYEr/CmoL04GezBOoY9CtZEbHFRA==
X-Gm-Gg: AYBFou0sakk4MdJBiziubwHN6rBQsKhEqnxfGuiifIu1DnfCGZge0hzY31HyjOj7C1v
	6NpynM386bbZvhu7ACS7rQvQ2wp+B4Ph6O2UaEnCYmKq3qFbL0mhEh2mmuXPbpxinNmaTj2aC85
	/t0PmDIfwd7JCDrc7CxxVGj31J7iepFNSi9EQMk4wIn9qu1xqA8D4o4QivvLR0YAQvEhHd/QI/J
	Ce/WZFHU93+BEagbYiRjTvD3esJ4O4paDF3qMW68iWyDqyq0BJGGnByY97tLF7aUVUUFOlnFsn7
	UVEFYMU+Gr3Tla6i1+8qT0ktSMVs92Z88OywdSQA/F24W4q+0mcNqmjkF/n+uC8lwXrtXXdg4Km
	eA9pq/LiEvvmZgjOHAdEGVDrhMXZKHAKtykkT/vxKfYH0gZSDGZhChIImZVg4tIZoJrRhF6P0X+
	9ZsjVnlD9tq8dFJnTVQSVG40GW1zMlWQ/Wchs4nBXPSgaK5OBhggROSG0qMDHwHFR7KcHvuhGhx
	5GR3XZLKlNqDvgZfQITeE5mhQdtV5IxgGJE2B2ThpWAvJ/TA4DUHZIDuLqbAfxoGMfVsIqzhndL
	uDQ3Avn49tp++qQGPGABKCRSGu8VG5koHWS7VlSOhsB06HBY
X-Received: by 2002:a05:6820:6fc5:b0:714:adb2:3245 with SMTP id 006d021491bc7-718a5f4ab69mr79054eaf.37.1794253685424;
        Mon, 09 Nov 2026 11:48:05 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::3232])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa132e65sm70363eaf.14.2026.11.09.11.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:05 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v9 4/9] classes-global/sstate: Keep SPDX generating setscene dependencies
Date: Mon,  9 Nov 2026 12:45:40 -0700
Message-ID: <20261109194759.550935-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109194759.550935-1-JPEWhacker@gmail.com>
References: <20261104153535.3184146-1-JPEWhacker@gmail.com>
 <20261109194759.550935-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249869
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

