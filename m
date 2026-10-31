Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3724.1793405746976668281
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=IXAQcBrC;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so9958465e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405745; x=1794010545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gro7YVOmSTMk1FQlHeqI4FeiqgBAYYNJ524iEqunZrE=;
        b=IXAQcBrCQx20bVAKN0V7cW6P0NqkU5BFaupAFEvAkBmfa6159I6hyxjaduAt38JduL
         QxByLh2sBNplDJUqN5vxMcU7lJyqQDRb9YYwUEWNvKQ3NVzUDl3rG3uz5XSjd3wLrmZN
         Q72mxkHVnc7IAEWJpQRs9R5v+r/ms4Ym8BH9qzt6MgkUkLbbFwAcjKFS81bd7kes34zQ
         woC8FfrvVyOphAwL9DmhTcau4juipC6nI2GPQEvPofsz5yT/+clSU8OCYJFfMuNAtJxy
         xmHdEmSq1YT4GSpK1Fd/CCZ8PEIq8Tv9dYbKRRKO42uqKWQoIVSV5I7Onw1sQux1IQxF
         3agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405745; x=1794010545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gro7YVOmSTMk1FQlHeqI4FeiqgBAYYNJ524iEqunZrE=;
        b=VbVmVir6vGrISwOs+5MJ07MxAKXkO7ADU6dbyNhLv2fGDwlyyMQg8yYggIkt4YJHdH
         efiWy/qkwuLWzfAbAqhwQ+gtESp8EeUr1uwxmX9UDx8SYZ8Fx2C43PTW4cNNlPCA/RWl
         v5025wBb/6SQs5CnDFTXYkgQu0GiBfvCVLijN8QFNDxh3aQ1aAmIaM82h6S7RAwWJjsG
         vIzvaroZNvXwcTRN7OYJhyi5BLaTtUvs9io9sja46pJp0peZYP+GygCjF8fuDp/XsEB3
         dS2Tg0SxrU2PkwAjMkA12eBcfBibM0lApWiMV+/BbRkJZRQRLN01MYD4MY0BShmtPXf3
         +gPQ==
X-Gm-Message-State: AFq9FYIjGiW1yXKf2pbvPh9qLjtkNsJv2l4Utf/N0LnLenu+hVSnq4yM
	kit5CyctEO0BjfvN+Sx6vNflMfECPlqmsbfqeKRm5qxII7MqKusgq0fK9Ah2+j+f6YnakTLqqR3
	QFCeUudQ=
X-Gm-Gg: AYBFou2X2RQ5zoC3mZjCoVQAHjHflyePMfhJTFAeyR4GdgRQ+AMcJ83vrmvKs4qlNY5
	FvyHayrhG86DGqrX7hnFRk1JyKo9giSdBi4qRdhKtYHLaf7ihT8lOj3y5Xxt3828lYwHgnQ0RNt
	Dyio4TEnwcwtyovEWwC3b44yNzQffp9/SNeFAed5gS3wkmt2BTudfkqaVO86cBJsGQYExZFy332
	okzN3sdew7uXlHjt4A2bmewPa+4WPYuGVlCyTv69WpOE/PvcIq09AIIQ0OgJEfNH/x4i7I0oWZV
	aRdEk262fke/SpFvjV31GbD9+B7tDk7cR7SZ4roRRAI3a2E2YlPX4PeWktWRqalh3fISqmK+Le7
	CRzBdnCES7uIgR36JAXeiVF8vKXNCKJoz8+3YsjKK973++28yYgUog7lbTFm7TfuV8JYRaKb93R
	R76T6NpsVZ1iaXFQYrJtBa1wOiV2KuotDkH+GM9HCyWn5baZwwwats7NEYwn7nRCwmD4llPdAqS
	aIaCA39AsWoKtMPGfzvu2wryjiKeKSeSEIyY2cZb1JJM2qF79ctsJuwEVP58LLMXHxHGWqmdayU
	KHl6v3ZdG+cSZK+PUT+wiMLHWzq4dL7v2PQYoVM8f0Ck750G6jdsAYSKQ/5gqSR+McdkFinRh5w
	QXpsKlmRB+Br1+w7G2ykvTJIdAxuw
X-Received: by 2002:a05:600c:6215:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4ac187a6c3amr82036415e9.20.1793405745182;
        Fri, 30 Oct 2026 17:15:45 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/55] util-linux: patch CVE-2026-53612
Date: Sat, 31 Oct 2026 01:14:25 +0100
Message-ID: <592e23f18dc64e80d62696c530e8e04fe4b6c4e1.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249079
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41.5 release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/CVE-2026-53612.patch           | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-53612.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index db698ef9367..4b889927c80 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -55,6 +55,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-lib-fileutils-fix-unused-parameter-warnings-without-.patch \
            file://0001-lib-fileutils-fix-RESOLVE_NO_SYMLINKS-fallback-value.patch \
            file://CVE-2026-53613.patch \
+           file://CVE-2026-53612.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-53612.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-53612.patch
new file mode 100644
index 00000000000..94a70c6159c
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-53612.patch
@@ -0,0 +1,92 @@
+From 897a08c2b11dfa66975c3d24d63c7bf5f5be1a7c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 16 Jun 2026 11:15:19 +0200
+Subject: [PATCH] libmount: use fd-based fchownat/chmod in hook_owner
+
+Replace path-based lchown()/chmod() with fd-based operations in the
+X-mount.{owner,group,mode} post-mount hook.
+
+For restricted users the fd_target is pinned in prepare_target() and
+re-opened after mount in hook_attach_target() to point to the mounted
+filesystem root.  For root a local O_PATH fd is opened.  Ownership is
+changed via fchownat(fd, "", ..., AT_EMPTY_PATH), mode via
+/proc/self/fd/N.
+
+This prevents TOCTOU attacks where an ancestor directory is swapped
+between mount and the chmod/chown operations.
+
+CVE-2026-53612
+
+Reported-by: Xinyao Hu <ctf_0x01@foxmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 24da33905c7115c4cbccd0afb2a469804e96467a)
+
+CVE: CVE-2026-53612
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/897a08c2b11dfa66975c3d24d63c7bf5f5be1a7c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/hook_owner.c | 32 ++++++++++++++++++++++++--------
+ 1 file changed, 24 insertions(+), 8 deletions(-)
+
+diff --git a/libmount/src/hook_owner.c b/libmount/src/hook_owner.c
+index 11b238c89..99f0e705d 100644
+--- a/libmount/src/hook_owner.c
++++ b/libmount/src/hook_owner.c
+@@ -17,6 +17,7 @@
+ #include <sched.h>
+ 
+ #include "mountP.h"
++#include "pathnames.h"
+ #include "fileutils.h"
+ 
+ struct hook_data {
+@@ -48,7 +49,7 @@ static int hook_post(
+ {
+ 	struct hook_data *hd = (struct hook_data *) data;
+ 	const char *target;
+-	int rc = 0;
++	int rc = 0, fd;
+ 
+ 	assert(cxt);
+ 
+@@ -59,18 +60,33 @@ static int hook_post(
+ 	if (!target)
+ 		return 0;
+ 
++	/* fd_target is pinned in restricted mode (see prepare_target()),
++	 * for root open it here to keep chmod/chown fd-based too */
++	if (mnt_context_target_fd_required(cxt))
++		fd = mnt_context_get_target_fd(cxt);
++	else
++		fd = open(target, O_PATH | O_CLOEXEC);
++
++	if (fd < 0)
++		return -MNT_ERR_CHMOD;
++
+ 	if (hd->owner != (uid_t) -1 || hd->group != (uid_t) -1) {
+-		DBG(CXT, ul_debugobj(cxt, " lchown(%s, %u, %u)", target, hd->owner, hd->group));
+-		if (lchown(target, hd->owner, hd->group) == -1)
+-			return -MNT_ERR_CHOWN;
++		DBG(CXT, ul_debugobj(cxt, " fchownat(%s, %u, %u)", target, hd->owner, hd->group));
++		if (fchownat(fd, "", hd->owner, hd->group, AT_EMPTY_PATH) == -1)
++			rc = -MNT_ERR_CHOWN;
+ 	}
+ 
+-	if (hd->mode != (mode_t) -1) {
+-		DBG(CXT, ul_debugobj(cxt, " chmod(%s, %04o)", target, hd->mode));
+-		if (chmod(target, hd->mode) == -1)
+-			return -MNT_ERR_CHMOD;
++	if (!rc && hd->mode != (mode_t) -1) {
++		char buf[sizeof(_PATH_PROC_FDDIR) + 1 + sizeof(stringify_value(INT_MAX))];
++
++		snprintf(buf, sizeof(buf), _PATH_PROC_FDDIR "/%d", fd);
++		DBG(CXT, ul_debugobj(cxt, " chmod(%s, %04o)", buf, hd->mode));
++		if (chmod(buf, hd->mode) == -1)
++			rc = -MNT_ERR_CHMOD;
+ 	}
+ 
++	if (!mnt_context_target_fd_required(cxt))
++		close(fd);
+ 	return rc;
+ }
+ 
