Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9824.1792584327820941507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 05:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=c4PJMeNI;
 spf=pass (domain: snapchat.com, ip: 74.125.82.169, mailfrom: ecordonnier@snapchat.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-354ba08cfd1so1082152eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 05:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1792584327; x=1793189127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TLCfc0h+dXc1C1E7oT2BaRDxA0o097pZyJax2KdAG6Q=;
        b=c4PJMeNICVCZ9FKfzFATgY4U0Pjh91rEXueaaG7TstrQe3n4DTN2bNMHJB3L2nl3BZ
         UyZhcZaHKu+yytz2WdD6aBjj1FjI3ELIVB4jq4MW2iIZPJjD8Y3yyNWemf7xAHknEa6K
         nCOEWM5nc0yv3wNhJrmC5/MujgJYA3NXddXIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584327; x=1793189127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLCfc0h+dXc1C1E7oT2BaRDxA0o097pZyJax2KdAG6Q=;
        b=spAdV6sEyyTci0xIzWunj+SH+YOZYE3c8yrjeP+z5wfVVsEn3wJj9XoX5xn/pbCHKA
         wl7DeEuRkxu5d9Elr56ceSG1fvXPMV8imzV4GCyBQ1AD/qF3HDguGt9Uey7knwuZKGLv
         S7gOUJeNCpT0hCvaQjbyPu2NIY7QuMBw5dNy6UrCnn8Mj8hgaopze82biMW0/0NVgCJf
         raaQwse4uvztEnY3z+5Ax0qG9ufNv65mw4AFydDpDAPRc0O57t6JoRpHUIw7bK1T+XuK
         YC8jfqQoRmVjKVByq4Z933m8fmP0B2BErKFmLdImiIptLIZvltb0LWLXk+vQjwWc1WoH
         bw3g==
X-Gm-Message-State: AFq9FYJXFY7Ocs2j4bBmNnpFtwK9NontTJuBZmUrnp+Gm5ZSxdhtYnvi
	eKP0hH2+KZ5WrUhy8KgVSPv4xfCfOjkx8bYVQ75UqYgQCS4fGpOviI/ol/tOSd5zyO9570/KPaB
	u5bZUrkQ=
X-Gm-Gg: AYBFou370jynvJkTTRWI9Frkr5WfWvVXr+odI7P4xWqvdljkAWkE+Hos7CTE9Lq2JtT
	+O0LDO88ChX0CbRIqDoXRuT2fTj74cuFT8gmo9UK/NDUKw1sVGxCT8O4Vjqz83JJv5RMLjePFUA
	pA67gr6543+kibckvTSXyLtx/c7URB9sf6UjlZXHXlJxKCbldU3SOxfWTJb+DmxC3vGLEXpZCsm
	YLJWi/el2/xhOtAhFwmq57uf5R2jVOpdYkKXqT4y12qxrGiaAOJiT0/eZKOLMonJ/MDjzD4ay37
	kuOysiVnQlNhRgW74Zi02HpnQjZua8WHDjAphksfwlooadjqUShfoCUqY6rzmnkpBjPV7Pf6RmZ
	ttc52PAobcMPh/k88/PJzdt0Bd4ss6D2i9n6kEVMxambj+/fAUvYPkx/nMpiK3h4m0lrXHjyrFo
	Q/4HhPkksvTeds9ZPoRMFHGvBD5XC3ZkMeeYpiU3GeM7oqPIY9rnm6csO4igHx4WI8KAtfwHf6m
	dJpWX7wlm1CcO+w/5BijCbnQYNRBOZj6V/t1PrZsmeZtdn5yW62S4bIs0GeLP5NdlZswXdEO0/3
	4hCGbijYC9mrtOZDEpwMmk7hWqZL/PwXLU0he5NWTv6p
X-Received: by 2002:a05:7301:4e88:b0:361:306f:c32a with SMTP id 5a478bee46e88-3674c92ff0bmr4067948eec.11.1792584326872;
        Wed, 21 Oct 2026 05:05:26 -0700 (PDT)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed2absm8195254eec.5.2026.10.21.05.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:05:26 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] image, populate_sdk_base: warn on ';' in *_COMMAND function lists
Date: Wed, 21 Oct 2026 14:05:21 +0200
Message-ID: <20261021120521.1453558-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 12:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248393
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

Since c3365dfd9ddd ("classes: Drop ';' delimiter from ROOTFS/IMAGE*COMMAND
variables") these variables are space separated function lists, used as
vardeps of themselves. A stray ';' is still tolerated when the list is
executed, but at parse time "func;" names no variable, so the function is
not part of the do_rootfs/do_image/do_populate_sdk signature and a stale
rootfs or SDK can be reused from sstate.

Warn when a variable from rootfs_command_variables() or
sdk_command_variables() contains ';'. Tested by adding "foo;" entries and
checking the warning, and that stock core-image-minimal parses without it.

AI-Generated: Uses Claude Code (claude-sonnet-5-5)
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-recipe/image.bbclass             | 7 ++++++-
 meta/classes-recipe/populate_sdk_base.bbclass | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 460e5ab39f..1e3c784ec9 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -127,7 +127,12 @@ def rootfs_command_variables(d):
 python () {
     variables = rootfs_command_variables(d)
     for var in variables:
-        d.setVarFlag(var, 'vardeps', d.getVar(var))
+        value = d.getVar(var)
+        if value and ';' in value:
+            bb.warn("%s contains ';' but is a space separated list of functions, "
+                    "remove the ';' delimiters or the functions will not be part "
+                    "of the task signature: %s" % (var, value.strip()))
+        d.setVarFlag(var, 'vardeps', value)
 }
 
 def rootfs_variables(d):
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 2c6dd1828c..0d67ab6ac6 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -423,7 +423,12 @@ do_populate_sdk[vardeps] += "${@sdk_variables(d)}"
 python () {
     variables = sdk_command_variables(d)
     for var in variables:
-        d.setVarFlag(var, 'vardeps', d.getVar(var))
+        value = d.getVar(var)
+        if value and ';' in value:
+            bb.warn("%s contains ';' but is a space separated list of functions, "
+                    "remove the ';' delimiters or the functions will not be part "
+                    "of the task signature: %s" % (var, value.strip()))
+        d.setVarFlag(var, 'vardeps', value)
 }
 
 do_populate_sdk[file-checksums] += "${TOOLCHAIN_SHAR_REL_TMPL}:True \
-- 
2.43.0

