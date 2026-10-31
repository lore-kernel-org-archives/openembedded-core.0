Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3727.1793405749800504634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=lzPUGZf8;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso8899955e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405748; x=1794010548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TRly+ZUVY/y6VrERmE9dO2mJxiLVYuWOF4Mw8L8yHIA=;
        b=lzPUGZf80dsofrEdXoeRsCP7/POXySyBUA3s18RAHdmglJMNRa/9/iaPg/vkBpESmf
         Mb67iL/qKanBtjjdO9fV398dxhrrpZXeOrcgdR28LEJfk4zVOhHR823XVAGH4VkSWQVK
         sdjEy+RlhDlzIKNotwCOXLkV7x0CeMAZsVV+mVaYX6c2WyUMc1em1bGTjpZWFmo6zWE7
         sVvu0RzFC6C4PJP4OaHHXTSsl0ayzsKm30o3HtOoW0Qm5I/QodG5cgN2snT1e73x21Nl
         rFfHPxM5oEu8bhnQoIOR4W40p5J1dnejqWNQjW3P2Zhv0bytf6SJwknfgYByxh6V0Jkb
         lorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405748; x=1794010548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TRly+ZUVY/y6VrERmE9dO2mJxiLVYuWOF4Mw8L8yHIA=;
        b=Y+ajzLigs5Gx3YEPtK7jt2TsZTQBTOvD0Mq/jgN9oXb6pwooJlXyoU3d99irGitds4
         t6dyYE8xGt3aQ7FhNk2YZYh/CUTc/zkhkWUjFuwot4K1fFBPAcm8OFLppjwn16HWT7rH
         UJq82HWsLb0tQws+M7Hw3A0INGJF2z0TrunAMM3f9Q1iYaeGkFXXkb3wUddl+wMsWv3+
         H0AJy9VVyuRrzBlBDrHI2iEu/Y86tscUkD9TU0TJJarDQFcdPE+kZnnpr0jijjW9VqaQ
         vYQgypKUUOTq/ug+ElGVq+IjZCnjjpcLFzRCnlhWYgDSRi4tRJ3i9NLzqxV/oAWZYvW4
         PElw==
X-Gm-Message-State: AFq9FYIJPNDKc1Dt+VS4BY5cborwElt5a99jXpttj5g7msZfcTimmAcE
	eCAWnrpuqGDmh6k5etzYirKpm8mNrZcFPLZp0uJk2PVd5yTu+1LXrEWTNiOCvCRdkwUp6oqWsuF
	zBf9BzLs=
X-Gm-Gg: AYBFou2SIn/r7SuesC83MibaEDMODyDi4v5nl2hyRPA10trOn+yuU1wH+NdADwOjXAj
	neeQB8ElaqkzpvCmAwyB0xyGrbWlcf5IJu0hMojJaJ2rANQjj95TrUWfn/5jqUbC0+e62vPvaXo
	YMt7OAAzK/ferNGvVF+uyQ18w2RznhfLUHGuJNdUcQfU4SaLXSo1XIkFNoielkqUZPWr049XIPL
	oPi6qQyGFFBu8Xu+IKanBWUnVn9UnnIjECL8yMtppBR1iwofUPFi4z4uDyr0RToBmPD2YBOG50v
	jVL2HIumI8clL+FK29anKOe+0kZF+e2T/nw+smrDyndsIRFVRKGeoorElHz0eH4AnChzE9gGDCZ
	by8jmGx7GEpm8FOdRJzzljz772shV1G5s3G22PiBCyyASYMAX61v8Gyxetdo0BoStI1sM981jIM
	69ix/+tJmxOK6H0R4lX5jVgg7vDkUPSH37kKPulpMEH9ojAX+Q9Cx0w7GiHsAq2rUHpnKGjlX/P
	hn/3n4g6wYmcw0XVTDS9iOC053yqC7OvwPcz6dFDFarqC0g5f6nH+VCakwr9ns/h9EJDZelPKm+
	EL4ZscYxv3D6UfpVRTkiGyW862IpYz5eyc6aWaYnP6SuisPVbJxHParfX2ez3YiJ2+nK9r00+hj
	5BkRu2DL/sQwx3Fshaaun2w26Dvse
X-Received: by 2002:a05:600c:6285:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ac182dc8f6mr86252485e9.34.1793405748002;
        Fri, 30 Oct 2026 17:15:48 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/55] util-linux: patch CVE-2026-76642
Date: Sat, 31 Oct 2026 01:14:29 +0100
Message-ID: <e0950ffa68bdf9071a7839b90501b1472173ce4d.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249083
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41.6 release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-76642.patch           | 136 ++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-76642.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 10803e38938..fdc8c62f6e5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -62,6 +62,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2026-78410-01.patch \
            file://CVE-2026-78410-02.patch \
            file://CVE-2026-78410-03.patch \
+           file://CVE-2026-76642.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-76642.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-76642.patch
new file mode 100644
index 00000000000..b5d811770a3
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-76642.patch
@@ -0,0 +1,136 @@
+From a15c00a9e545aa8b9cf6ec0f888ff6c7b3eaeedc Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 28 Jul 2026 11:40:25 +0200
+Subject: [PATCH] libmount: skip post-mount hooks after failed mount helper
+ [CVE-2026-76642]
+
+When an external mount.<type> helper exits nonzero, exec_helper()
+stores the failure in helper_status but returns zero (meaning the
+fork/exec/wait infrastructure succeeded). This zero propagates as
+the mount result, causing MNT_STAGE_MOUNT_POST and MNT_STAGE_POST
+hooks to execute as if the mount had succeeded.
+
+This allows privileged post-mount operations on the pre-existing
+target filesystem:
+
+ - X-mount.idmap clones and idmaps the underlying target, creating
+   an overmount that inherits suid/exec from the root filesystem
+   (ignoring nosuid/nodev/noexec from fstab)
+
+ - X-mount.owner/group/mode changes the physical target inode
+   ownership and permissions even though no mount was created
+
+Gate both MNT_STAGE_MOUNT_POST in mnt_context_do_mount() and
+MNT_STAGE_POST in mnt_context_mount() on is_success_status(), which
+already correctly distinguishes helper exit status from process
+execution status. This is a centralized fix -- individual hooks do
+not need their own guards.
+
+Audit of all hooks registered at these stages:
+
+ MNT_STAGE_MOUNT_POST:
+  - hook_mount.c (attach, propagation, vfsflags): already skip when
+    helper executed (commit f94a7760)
+  - hook_idmap.c: would clone+idmap pre-existing target -- now blocked
+  - hook_subdir.c: deinit calls tmptgt_cleanup() -- safe
+  - hook_mount_legacy.c (propagation, bindremount): no resources to leak
+  - hook_loopdev.c: deinit fixed to call delete_loopdev() when the
+    cleanup hook is skipped (was only free(), leaking fd and device)
+  - hook_veritydev.c: deinit calls delete_veritydev() -- safe
+
+ MNT_STAGE_POST:
+  - hook_owner.c: would chown/chmod target -- now blocked; deinit
+    only frees uid/gid/mode struct, no resources to leak
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit f57cea130839c0af8dc0525274267ae4cfd66bbf)
+(cherry picked from commit 1d14676ea70003e9f5b2a6a76af0cadb1190411a)
+
+CVE: CVE-2026-76642
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/a15c00a9e545aa8b9cf6ec0f888ff6c7b3eaeedc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/context_mount.c | 23 ++++++++++++++++++++---
+ libmount/src/hook_loopdev.c  | 13 +++++++++++--
+ 2 files changed, 31 insertions(+), 5 deletions(-)
+
+diff --git a/libmount/src/context_mount.c b/libmount/src/context_mount.c
+index 77435684b..80c45beeb 100644
+--- a/libmount/src/context_mount.c
++++ b/libmount/src/context_mount.c
+@@ -574,6 +574,22 @@ static int is_success_status(struct libmnt_context *cxt)
+ 	return 0;
+ }
+ 
++/* Check if the mount stage explicitly failed (helper or syscall returned
++ * an error). Unlike is_success_status(), this treats "nothing happened"
++ * as not-failed -- the MOUNT stage may be a no-op for operations like
++ * bind/move with the new mount API where open_tree() runs in PREP and
++ * move_mount() is deferred to MOUNT_POST. */
++static int is_mount_stage_failed(struct libmnt_context *cxt)
++{
++	if (mnt_context_helper_executed(cxt))
++		return mnt_context_get_helper_status(cxt) != 0;
++
++	if (mnt_context_syscall_called(cxt))
++		return mnt_context_get_status(cxt) != 1;
++
++	return 0;
++}
++
+ /* try mount(2) for all items in comma separated list of the filesystem @types */
+ static int do_mount_by_types(struct libmnt_context *cxt, const char *types)
+ {
+@@ -874,8 +890,9 @@ int mnt_context_do_mount(struct libmnt_context *cxt)
+ 	} else
+ 		res = do_mount_by_pattern(cxt, cxt->fstype_pattern);
+ 
+-	/* after mount stage */
+-	if (res == 0) {
++	/* after mount stage -- the post-mount hooks are commit-path only,
++	 * skip them if the mount helper or syscall has failed */
++	if (res == 0 && !is_mount_stage_failed(cxt)) {
+ 		rc = mnt_context_call_hooks(cxt, MNT_STAGE_MOUNT_POST);
+ 		if (rc)
+ 			return rc;
+@@ -1058,7 +1075,7 @@ again:
+ 		}
+ 	}
+ 
+-	if (rc == 0)
++	if (rc == 0 && !is_mount_stage_failed(cxt))
+ 		rc = mnt_context_call_hooks(cxt, MNT_STAGE_POST);
+ 
+ 	mnt_context_deinit_hooksets(cxt);
+diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
+index 34351116c..af9a52227 100644
+--- a/libmount/src/hook_loopdev.c
++++ b/libmount/src/hook_loopdev.c
+@@ -23,6 +23,8 @@ struct hook_data {
+ 	int loopdev_fd;
+ };
+ 
++static int delete_loopdev(struct libmnt_context *cxt, struct hook_data *hd);
++
+ /* de-initiallize this module */
+ static int hookset_deinit(struct libmnt_context *cxt, const struct libmnt_hookset *hs)
+ {
+@@ -30,9 +32,16 @@ static int hookset_deinit(struct libmnt_context *cxt, const struct libmnt_hookse
+ 
+ 	DBG(HOOK, ul_debugobj(hs, "deinit '%s'", hs->name));
+ 
+-	/* remove all our hooks */
++	/* remove all our hooks and free hook data */
+ 	while (mnt_context_remove_hook(cxt, hs, 0, &data) == 0) {
+-		free(data);
++		if (data) {
++			struct hook_data *hd = (struct hook_data *) data;
++
++			/* cleanup after skipped MOUNT_POST hook */
++			if (hd->loopdev_fd > -1)
++				delete_loopdev(cxt, hd);
++			free(hd);
++		}
+ 		data = NULL;
+ 	}
+ 
