Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3723.1793405745883464534
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=NGRwrmS1;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so11378345e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405744; x=1794010544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lOsfezwNPMZF+DiZVgvm4tc01NDE01t3GU9IHt7KIgc=;
        b=NGRwrmS1gIwR+GydzhPqlKJLWQ89G3dY+phGF7ej09x1TRvz9Oe6x9T0D62YpSbWpe
         38jbWY8J4b1ajTuSKupthcAJkM2n51I1CWRrlHFB2hDFi0G09P/07SIKmtYxC7WSoBVq
         x+RAETuVals96dkW99qb75tfOfsZjdgsKAvzN0ZNcBMAKcqr5SJEEYaXVuUi9umzp1CR
         MNDoZlmBu4hTBk9ImE0BBvyXSkXPPotO8/lNLld8z4GupvMddLKjMbbXJPsXnY1ARyKk
         qGLQD5o3/b3HiuxfomcIaagBxYIWpIq+aujPbk107+Nessuqf+VnAY4GRB4sBClIFE2u
         EKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405744; x=1794010544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lOsfezwNPMZF+DiZVgvm4tc01NDE01t3GU9IHt7KIgc=;
        b=q7PWW4tp1viYNbuPuwsBml9UpeSaaINt/RwJLMikGUy9MDYsv+bmFQ5ZK7ACH62wFm
         9TPSEKYNuCvqK+utBwgoWN21BDwbQu+wzder8XmZ2ojfraPKG4j+RyYtWcKXGfEjBfIC
         uV7VyKsv9lurL19kPPkEUnvWyw2hAowwREJWXxn1jqvnGkN7t30v9TBUtND034xBzcJ5
         h1NPPCxTLOQ/0wzowGBj9O+UFm5rgl74UB5lkBRqDKoDsSZT339f6vX0YYUkU+OPTf9x
         CP1v715XJrA4MFSkqmVRXhHz9utT4m/ZAeAjTDwtKxlSwGUOdiv2mt67l1zFYGAiTXdZ
         4dwA==
X-Gm-Message-State: AFq9FYLDdaWWgZxoJLhsunpoqVsSbIFEOC01Z69V9n4qc2/1hGUT+L0/
	p1XkaiYx0svz8IfU8tgVMO+22f6a/OxiRkm47hmcugoPrUQ0+5GXM+v2I8LBFyGVxpvR3+XnhPv
	7bplfaGw=
X-Gm-Gg: AYBFou0Tzka1//lwRwUnWSX/gNf/5XC7i/cOokhTa40VKojihXBNBYRVv6oYZXcOzbv
	E2J9aKHsQbcRtfkoyGunaHvitpHEMCu06fc9wZsZNeG/D3uyvGFTt5zWfZW8l3npofxaeW7tTBS
	S+KCm19f+TgblxFgVjUz25MAsrKBcvEkA72rmHSEyRq7SMh7hIgf/FdUalPjm0S1lSLI8xz1Doz
	UpT0sR698NUk9o3PVm7/D+qu9udQ3YkhKyfrND64bAvOOz3lVUoGGdOLbV4Wk0WUatVnqsd+ovR
	w+f7pzIfVZINVV8uu5gL4U+1GZxDMNliOoDCwlRcB/JH1vzlzTFKiMZWfbJC/VS51P1NnV7YUut
	UADECxQHGnoITJt42fRFGkznx2jiCVvvDW32C6ysHRUtiTlsce04SlR+u+ONn7p5tVk/EdO3fqr
	uBES/KUuGkPB9dWt3X7bQAzoTIOZl3oYjvYBstEXIWyDz1llhDpwIavfOavaOYSihmQNPYClYMW
	qa+nwswb9tJfXFdVAHbKB8Pwuxcv/9d3BLuTF/VnWMktffoaKOQSarow816t2dSvXvDUrIm1QZn
	g50tVSL8qvEyHYQgxbXmgxmLnU3klcYowjOQ8VMZ6VjcS/RLvZpl6/Thr2eGpnqOWnNcfjieZX9
	Gx+ynR9ru7+qsQj35qRvT5MkOUxSd
X-Received: by 2002:a05:600c:8b0a:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4ac1709a200mr88523395e9.16.1793405744114;
        Fri, 30 Oct 2026 17:15:44 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/55] util-linux: patch CVE-2026-53614
Date: Sat, 31 Oct 2026 01:14:23 +0100
Message-ID: <0f1a1abb8a1f12a0be625a22010dfaace330bb1d.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249077
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41.5 release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/CVE-2026-53614.patch           | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-53614.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index f651dc2dab4..70acf6dfec3 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -49,6 +49,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2026-27456.patch \
            file://CVE-2026-13595.patch \
            file://CVE-2026-3184.patch \
+           file://CVE-2026-53614.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-53614.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-53614.patch
new file mode 100644
index 00000000000..f1dd4ae5d74
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-53614.patch
@@ -0,0 +1,83 @@
+From cc81bbcec598cb91f0eb8456282f33eed820ed5f Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 16 Jun 2026 10:58:32 +0200
+Subject: [PATCH] libmount: fix SUID bypass via LIBMOUNT_FORCE_MOUNT2 and
+ legacy mount path
+
+Use safe_getenv() for LIBMOUNT_FORCE_MOUNT2 to ignore the variable
+in SUID context, consistent with LIBMOUNT_FSTAB and other sensitive
+environment variables.
+
+Additionally, refuse multi-step mount(2) sequences (bind+remount and
+propagation) for restricted (non-root) users in the legacy mount path.
+The two-step approach has a window between syscalls where security
+flags (nosuid, noexec, ...) are not yet applied.  The new mount API
+handles this atomically.
+
+CVE-2026-53614
+
+Reported-by: Xinyao Hu <ctf_0x01@foxmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 9cbfb823500f510b34767edabd3ffd5b436987b4)
+
+CVE: CVE-2026-53614
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/cc81bbcec598cb91f0eb8456282f33eed820ed5f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/hook_mount.c        | 3 ++-
+ libmount/src/hook_mount_legacy.c | 8 ++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
+index 1ffd19e83..37179fb59 100644
+--- a/libmount/src/hook_mount.c
++++ b/libmount/src/hook_mount.c
+@@ -44,6 +44,7 @@
+  */
+ 
+ #include "mountP.h"
++#include "env.h"
+ #include "fileutils.h"	/* statx() fallback */
+ #include "strutils.h"
+ #include "mount-api-utils.h"
+@@ -627,7 +628,7 @@ fail:
+ 
+ static int force_classic_mount(struct libmnt_context *cxt)
+ {
+-	const char *env = getenv("LIBMOUNT_FORCE_MOUNT2");
++	const char *env = safe_getenv("LIBMOUNT_FORCE_MOUNT2");
+ 
+ 	if (env) {
+ 		if (strcmp(env, "always") == 0)
+diff --git a/libmount/src/hook_mount_legacy.c b/libmount/src/hook_mount_legacy.c
+index 18b7a0066..94a8fc685 100644
+--- a/libmount/src/hook_mount_legacy.c
++++ b/libmount/src/hook_mount_legacy.c
+@@ -282,6 +282,8 @@ static int hook_prepare(struct libmnt_context *cxt,
+ 
+ 	/* add extra mount(2) calls for each propagation flag  */
+ 	if (flags & MS_PROPAGATION) {
++		if (mnt_context_is_restricted(cxt))
++			goto eperm;
+ 		rc = prepare_propagation(cxt, hs);
+ 		if (rc)
+ 			return rc;
+@@ -291,12 +293,18 @@ static int hook_prepare(struct libmnt_context *cxt,
+ 	if ((flags & MS_BIND)
+ 	    && (flags & MNT_BIND_SETTABLE)
+ 	    && !(flags & MS_REMOUNT)) {
++		if (mnt_context_is_restricted(cxt))
++			goto eperm;
+ 		rc = prepare_bindremount(cxt, hs);
+ 		if (rc)
+ 			return rc;
+ 	}
+ 
+ 	return rc;
++eperm:
++	DBG(HOOK, ul_debugobj(hs,
++		"multi-step mount(2) refused for non-root user"));
++	return -EPERM;
+ }
+ 
+ const struct libmnt_hookset hookset_mount_legacy =
