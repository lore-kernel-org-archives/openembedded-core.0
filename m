Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3725.1793405748973569557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=RnWWhPv/;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so11378545e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405747; x=1794010547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3mOszcfq+eN32B9y35zFEj5Am+JNiBueBGGAbLcd6IU=;
        b=RnWWhPv/hRAmvnl4xf727GuOQ2qVgxnmi0hohHdH2UT1I/YkkHgeqzjSI8e1jcWT62
         hhKTROlfA2zEnUttwpNjNEcCBEXF0MHAdcssqpZXJVEHVGuvxXTjykPInQtHFMTxEyev
         YnDfNDBPGyzWWoBh9Uu0ena/OQ7xVs0sTCQqwW57gg8B6FrFoLd9GzUAeTqxsC8/DM+t
         ZA9IsU4YrwsRfbELfY391kqey4XQHW7MCaJi8EpVDMlnpogfkezi+sCahXxE2DTVKz+f
         tURzvTDaIeQFQ08Rba8hLrQBQrAgPdbBCUNsOqxTn8Blxpkn3VuPEM1nX/yMHyWWF6ac
         GRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405747; x=1794010547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3mOszcfq+eN32B9y35zFEj5Am+JNiBueBGGAbLcd6IU=;
        b=C0atqR7UQyklAIQWOHff6gqykbrqsgCIkx0NBUXg8Rv/1aBX63R4/oLk9sq1fTO21v
         1RKo7xhaLyOloBzfrb/F8tqZ9qbQwmmBw8OAPsNbFr5iYXOBcRKVpAR/keFqZtEk+im2
         Tu5I7QRDQvDIL4RE/YqpLZkSyC5/fWW0WZsCX8+Au65GibwW7kCt3es8UmNodnKIk/k6
         twEYN/Aw7f0xA3v6z2IyexkOCAuNMuB9kqBTcDlfABtsxxnRu1LhLC02QPEZFG8A9vcc
         lXQPhiJWZu/59WAAMzmyjCSOjzHQITr/E6WnFcyFSaORtwA3wdwkdeoBcDn95rA8MqnV
         uGBA==
X-Gm-Message-State: AFq9FYI2EwDkCmK1kT7pGLhm8zYF4Pa7KbxveMgB1U0AVRMoCBGs/xRO
	IiNUaYv4bCPnUf1VXcwpZLpH1diy3KJf+wY5spFzK3CNUHsWUrkgq4JIS1i8q/gPhePVQK03dq/
	D4RTHwhk=
X-Gm-Gg: AYBFou0r08wQM4bq1aaaXG23uvX9Gh4MQW8tpSkfTRoVGNrQ5Dwv1F1uDgY+PDIwNhP
	fnpBi7eHFby9ETTRu0Rmcv5oxr2DATMc57v12WQjfs/u/LfjRf7uotdBVh8v2aEa6hGAD07N8rf
	ejjBF1sX5z1HvtAJpmgp5gAlwJusf52ClsuLm1wGMEsHF5nEqPxp/nk+79GfiGLK90DM8+IjhoB
	wB6NOFiTlf/GI6hED4a/R2L+vU4F2nLfNUMD4ZOXQw5gvFr3ViTABRXg6hVhEw2QCeMNxxhLdGz
	GWR0eKSv5J3lqHS8XGwJdAhHdRHX1v89T6NsAk3lXjpS0bzX6BiU6qXO33cBjPupbfy1OlvKBj9
	yuTkQEfy+F9yDMaBc6Mc1EBUnlxRDTUsskSH4YDH6cIwTNfQ7LjIWWI3xzd1ina4T1TX8XTsO8d
	9++IfRb5sZNS23yJiihmkAigQJqb72CmW1y12d2W8MEM5IBquSZlhSwnMA3p46pdUPgMOGjt4Y8
	mQZETH8mT+RoFW3yDHl805gMKd+FMhMkn3C4vtET7q0XEhJKfX/kKX/e4AvIOob5dEZsohSg08c
	CobIeleLZtf+fYCRtrfbrLcrklx6IRBMgouXuXmWtxCyWpJrf4SM7WS1SplN+cPjj0Qsjtv8LqG
	XX21udUu4SY7TD9iNGhyJwuJzGWFMZB8FMaA9ay6AkEYqYkp37AY=
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr83479585e9.18.1793405746991;
        Fri, 30 Oct 2026 17:15:46 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/55] util-linux: patch CVE-2026-78410
Date: Sat, 31 Oct 2026 01:14:28 +0100
Message-ID: <09b1b6fc44c4d4d11f6c53a5ac618f7abb196ac3.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249082
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patches referencing this CVE from 2.41.6 release.
Also pick regression patch and patch implementing helper function.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc   |   4 +
 ..._open_tree-helper-for-safe-tree-open.patch |  85 +++++++++++++
 .../util-linux/CVE-2026-78410-01.patch        |  94 ++++++++++++++
 .../util-linux/CVE-2026-78410-02.patch        |  96 +++++++++++++++
 .../util-linux/CVE-2026-78410-03.patch        | 115 ++++++++++++++++++
 5 files changed, 394 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-libmount-add-mnt_open_tree-helper-for-safe-tree-open.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-78410-01.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-78410-02.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-78410-03.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 2eb9251a704..10803e38938 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -58,6 +58,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2026-53612.patch \
            file://CVE-2024-28085-0003.patch \
            file://CVE-2026-78408.patch \
+           file://0001-libmount-add-mnt_open_tree-helper-for-safe-tree-open.patch \
+           file://CVE-2026-78410-01.patch \
+           file://CVE-2026-78410-02.patch \
+           file://CVE-2026-78410-03.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-libmount-add-mnt_open_tree-helper-for-safe-tree-open.patch b/meta/recipes-core/util-linux/util-linux/0001-libmount-add-mnt_open_tree-helper-for-safe-tree-open.patch
new file mode 100644
index 00000000000..efe68cc17c8
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-libmount-add-mnt_open_tree-helper-for-safe-tree-open.patch
@@ -0,0 +1,85 @@
+From 71ff1c94be2fd2577bf600accb5c6ad2782276ef Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 20 Jul 2026 14:40:16 +0200
+Subject: [PATCH] libmount: add mnt_open_tree() helper for safe tree opening
+
+Add mnt_open_tree() that combines openat2() path pinning with
+open_tree() into a single call. When resolve flags are non-zero,
+the path is first pinned with ul_openat_resolve(), then cloned
+with open_tree(AT_EMPTY_PATH). When resolve is zero, open_tree()
+is called directly.
+
+This consolidates the openat2+open_tree pattern used for symlink
+protection in restricted mount operations.
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 37afc15d9e5a0accea94eb067b151e21f8494880)
+(cherry picked from commit 90a1f3b5b134b775dd30a46155064731ba40c519)
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/71ff1c94be2fd2577bf600accb5c6ad2782276ef]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/mountP.h |  2 ++
+ libmount/src/utils.c  | 29 +++++++++++++++++++++++++++++
+ 2 files changed, 31 insertions(+)
+
+diff --git a/libmount/src/mountP.h b/libmount/src/mountP.h
+index 97d0bf8fa..9d022d14e 100644
+--- a/libmount/src/mountP.h
++++ b/libmount/src/mountP.h
+@@ -687,6 +687,8 @@ static inline struct libmnt_sysapi *mnt_context_get_sysapi(struct libmnt_context
+ {
+ 	return mnt_context_get_hookset_data(cxt, &hookset_mount);
+ }
++int mnt_open_tree(int dirfd, const char *path, unsigned long flags,
++		  unsigned long long resolve);
+ #endif
+ 
+ #endif /* _LIBMOUNT_PRIVATE_H */
+diff --git a/libmount/src/utils.c b/libmount/src/utils.c
+index 4c90c951b..e4301689e 100644
+--- a/libmount/src/utils.c
++++ b/libmount/src/utils.c
+@@ -24,6 +24,7 @@
+ #include "strutils.h"
+ #include "pathnames.h"
+ #include "mountP.h"
++#include "fileutils.h"
+ #include "mangle.h"
+ #include "canonicalize.h"
+ #include "env.h"
+@@ -1286,6 +1287,34 @@ done:
+ 	return 1;
+ }
+ 
++#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
++/*
++ * Open a mount tree, optionally pinning the path with openat2() first.
++ *
++ * When @resolve is non-zero, the path is resolved with openat2() using the
++ * given resolve flags, then the tree is opened with open_tree(AT_EMPTY_PATH).
++ * When @resolve is zero, open_tree() is called directly with the path.
++ */
++int mnt_open_tree(int dirfd, const char *path, unsigned long flags,
++		  unsigned long long resolve)
++{
++	if (resolve) {
++		int pin_fd, fd;
++
++		pin_fd = ul_openat_resolve(dirfd, path,
++					O_PATH | O_CLOEXEC, 0, resolve);
++		if (pin_fd < 0)
++			return pin_fd;
++
++		fd = open_tree(pin_fd, "", flags | AT_EMPTY_PATH);
++		close(pin_fd);
++		return fd;
++	}
++
++	return open_tree(dirfd, path, flags);
++}
++#endif /* USE_LIBMOUNT_MOUNTFD_SUPPORT */
++
+ #ifdef TEST_PROGRAM
+ static int test_match_fstype(struct libmnt_test *ts, int argc, char *argv[])
+ {
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-78410-01.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-78410-01.patch
new file mode 100644
index 00000000000..50dadbbe884
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-78410-01.patch
@@ -0,0 +1,94 @@
+From b21f4cee55f723b045920dad5ce48a659d34cac8 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 9 Jul 2026 16:10:08 +0200
+Subject: [PATCH] libmount: restrict source path canonicalization for non-root
+ users [CVE-2026-78410]
+
+In restricted (suid, non-root) mode, mnt_context_prepare_srcpath()
+calls realpath() as euid=0 to canonicalize the source path. This
+follows symlinks through directories where the real user has write
+access (e.g. /home/user/), allowing redirection to arbitrary files.
+
+Only canonicalize /dev/ paths (e.g. /dev/cdrom -> /dev/sr0) and
+verify the result stays within /dev/. For non-/dev/ paths (e.g.
+disk images in user-writable directories), keep the original fstab
+path. Symlink protection for these paths is handled at open time
+by RESOLVE_NO_SYMLINKS in ul_open_no_symlinks().
+
+This is a follow-up to commits:
+ 5e390467b ("loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink attacks")
+ d07aad41e ("libmount: ignore X-mount.nocanonicalize for restricted users")
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit e554245ccc165fcdd4b8ba68bf2994ee14b98607)
+(cherry picked from commit 6051830a27a852fed92ebd8493e57aa3d5d9cf18)
+
+CVE: CVE-2026-78410
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/b21f4cee55f723b045920dad5ce48a659d34cac8]
+Backport notes:
+- Left out hunk from manual not yet present in 2.39.3
+- Adapted to use the startswith() helper available in util-linux 2.39.3.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/context.c | 17 ++++++++++++++++-
+ sys-utils/mount.8.adoc | 10 ++++++++--
+ 2 files changed, 24 insertions(+), 3 deletions(-)
+
+diff --git a/libmount/src/context.c b/libmount/src/context.c
+index 00fd099c9..8418b2d64 100644
+--- a/libmount/src/context.c
++++ b/libmount/src/context.c
+@@ -1888,7 +1888,22 @@ int mnt_context_prepare_srcpath(struct libmnt_context *cxt)
+ 		/*
+ 		 * Source is PATH (canonicalize)
+ 		 */
+-		path = mnt_resolve_path(src, cache);
++		if (mnt_context_is_restricted(cxt)) {
++			/* In restricted mode, only canonicalize /dev/
++			 * paths (e.g. /dev/cdrom -> /dev/sr0) and verify
++			 * the result stays in /dev/. For non-/dev/ paths
++			 * (e.g. disk images in user dirs), keep the
++			 * original fstab path -- symlink protection is
++			 * handled at open time by RESOLVE_NO_SYMLINKS.
++			 */
++			if (startswith(src, "/dev/")) {
++				path = mnt_resolve_path(src, cache);
++				if (path && !startswith(path, "/dev/"))
++					path = NULL;
++			}
++		} else
++			path = mnt_resolve_path(src, cache);
++
+ 		if (path && strcmp(path, src) != 0)
+ 			rc = mnt_fs_set_source(cxt->fs, path);
+ 	 }
+diff --git a/sys-utils/mount.8.adoc b/sys-utils/mount.8.adoc
+index 2acf2e15c..add2914ae 100644
+--- a/sys-utils/mount.8.adoc
++++ b/sys-utils/mount.8.adoc
+@@ -186,6 +186,10 @@ For more details, see *fstab*(5). Only the user that mounted a filesystem can un
+ 
+ The *user* mount option is accepted if no username is specified. If used in the format *user=someone*, the option is silently ignored and visible only for external mount helpers (/sbin/mount.<type>) for compatibility with some network filesystems.
+ 
++For mount source paths, *mount*(8) only canonicalizes (resolves symlinks) paths starting with _/dev/_ for unprivileged users and verifies the result stays within _/dev/_. Source paths outside _/dev/_ (e.g. disk images in user-writable directories) are kept as-is from _fstab_.
++
++Filesystem type auto-detection for unprivileged users relies exclusively on *udev* metadata rather than direct device probing; this means file images that are not registered with udev require an explicit filesystem type in _fstab_.
++
+ === Bind mount operation
+ 
+ Remount part of the file hierarchy somewhere else. The call is:
+@@ -426,10 +430,12 @@ The argument following the *-t* is used to indicate the filesystem type. The fil
+ +
+ The programs *mount* and *umount*(8) support filesystem subtypes. The subtype is defined by a '.subtype' suffix. For example 'fuse.sshfs'. It's recommended to use subtype notation rather than add any prefix to the mount source (for example 'sshfs#example.com' is deprecated).
+ +
+-If no *-t* option is given, or if the *auto* type is specified, *mount* will try to guess the desired type. *mount* uses the *libblkid*(3) library for guessing the filesystem type; if that does not turn up anything that looks familiar, *mount* will try to read the file _/etc/filesystems_, or, if that does not exist, _/proc/filesystems_. All of the filesystem types listed there will be tried, except for those that are labeled "nodev" (e.g. _devpts_, _proc_ and _nfs_). If _/etc/filesystems_ ends in a line with a single {asterisk}, mount will read _/proc/filesystems_ afterwards. While trying, all filesystem types will be mounted with the mount option *silent*.
++If no *-t* option is given, or if the *auto* type is specified, *mount* will try to guess the desired type. The filesystem type is determined using *udev* metadata first, then by direct device probing via *libblkid*(3) for root users. If neither method identifies the type, *mount* will fall back to trying all types listed in _/etc/filesystems_, or if that file does not exist, _/proc/filesystems_. Types labeled "nodev" (e.g. _devpts_, _proc_ and _nfs_) are skipped. If _/etc/filesystems_ ends in a line with a single {asterisk}, mount will read _/proc/filesystems_ afterwards. While trying, all filesystem types will be mounted with the mount option *silent*.
+ //TRANSLATORS: Keep {asterisk} untranslated.
+ +
+-The *auto* type may be useful for user-mounted floppies. Creating a file _/etc/filesystems_ can be useful to change the probe order (e.g., to try vfat before msdos or ext3 before ext2) or if you use a kernel module autoloader.
++For unprivileged (non-root) users, direct device probing via *libblkid*(3) is disabled and filesystem type detection relies exclusively on *udev* metadata. This means file images that are not registered with *udev* require an explicit filesystem type in _fstab_.
+++
++Creating a file _/etc/filesystems_ can be useful to change the probe order (e.g., to try vfat before msdos or ext3 before ext2) or if you use a kernel module autoloader.
+ +
+ More than one type may be specified in a comma-separated list, for the *-t* option as well as in an _/etc/fstab_ entry. The list of filesystem types for the *-t* option can be prefixed with *no* to specify the filesystem types on which no action should be taken. The prefix *no* has no effect when specified in an _/etc/fstab_ entry.
+ +
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-78410-02.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-78410-02.patch
new file mode 100644
index 00000000000..27669463630
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-78410-02.patch
@@ -0,0 +1,96 @@
+From 9fcb98bf08d9119d07ba3a3c709b1a85e4a1bbcb Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 20 Jul 2026 14:59:21 +0200
+Subject: [PATCH] libmount: pin source path with openat2() for restricted users
+ [CVE-2026-78410]
+
+In restricted (non-root) mode, mnt_context_open_tree() resolves the
+source path via open_tree(AT_FDCWD, path, ...) which follows symlinks
+in intermediate path components.  A local attacker who can replace the
+fstab-authorized bind source path or an ancestor with a symlink can
+redirect the privileged mount operation to an arbitrary directory.
+
+When combined with X-mount.owner/group/mode the post-mount hook
+applies root-privileged chown/chmod to the bind source inode, giving
+a local ownership/permission modification primitive on paths not
+authorized by fstab.
+
+Fix by using mnt_open_tree() with RESOLVE_NO_SYMLINKS in restricted
+mode.  Also fix hook_idmap.c fallback open_tree() call to use the
+same pattern.  Unrestricted (root) callers pass resolve=0 and get
+the direct open_tree() path.
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit fb8e2653553ce2ecd077a294d53a1422d7c6dbc0)
+(cherry picked from commit 9a8d0d60c55d3a55f89f6f75a17bae31bc5ee1c6)
+
+CVE: CVE-2026-78410
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/9fcb98bf08d9119d07ba3a3c709b1a85e4a1bbcb]
+Backport notes:
+- In 2.39.3, source tree opening is in hook_mount.c:open_mount_tree(),
+  not context.c:mnt_context_open_tree(). Apply that security hunk there.
+- Add fileutils.h to hook_idmap.c for the RESOLVE_NO_SYMLINKS definition;
+  without it, compilation fails when mountfd support is enabled.
+- Replace the duplicate fileutils.h include in utils.c with
+  mount-api-utils.h for the open_tree() declaration and syscall fallback.
+  The original fileutils.h include further down is retained.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/hook_idmap.c | 7 +++++--
+ libmount/src/hook_mount.c | 3 ++-
+ libmount/src/utils.c      | 2 +-
+ 3 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/libmount/src/hook_idmap.c b/libmount/src/hook_idmap.c
+index adaa9c636..97d8e0d1e 100644
+--- a/libmount/src/hook_idmap.c
++++ b/libmount/src/hook_idmap.c
+@@ -25,6 +25,7 @@
+ #include "strutils.h"
+ #include "all-io.h"
+ #include "namespace.h"
++#include "fileutils.h"
+ #include "mount-api-utils.h"
+ 
+ #include "mountP.h"
+@@ -330,9 +331,11 @@ static int hook_mount_post(
+ 	}
+ #endif
+ 	if (fd_tree < 0)
+-		fd_tree = open_tree(-1, target,
++		fd_tree = mnt_open_tree(AT_FDCWD, target,
+ 			    OPEN_TREE_CLONE | OPEN_TREE_CLOEXEC |
+-			    (recursive ? AT_RECURSIVE : 0));
++			    (recursive ? AT_RECURSIVE : 0),
++			    mnt_context_is_restricted(cxt) ?
++				RESOLVE_NO_SYMLINKS : 0);
+ 	if (fd_tree < 0) {
+ 		DBG(HOOK, ul_debugobj(hs, " failed to open tree"));
+ 		return -MNT_ERR_IDMAP;
+diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
+index a34b2d4..f5198c6 100644
+--- a/libmount/src/hook_mount.c
++++ b/libmount/src/hook_mount.c
+@@ -245,7 +245,8 @@ static int open_mount_tree(struct libmnt_context *cxt, const char *path, unsigne
+ 	DBG(HOOK, ul_debug("open_tree(path=%s%s%s)", path,
+ 				oflg & OPEN_TREE_CLONE ? " clone" : "",
+ 				oflg & AT_RECURSIVE ? " recursive" : ""));
+-	fd = open_tree(AT_FDCWD, path, oflg);
++	fd = mnt_open_tree(AT_FDCWD, path, oflg,
++			mnt_context_is_restricted(cxt) ? RESOLVE_NO_SYMLINKS : 0);
+ 	set_syscall_status(cxt, "open_tree", fd >= 0);
+ 
+ 	return fd;
+diff --git a/libmount/src/utils.c b/libmount/src/utils.c
+index 9e2f4d53d..6c6f1aaeb 100644
+--- a/libmount/src/utils.c
++++ b/libmount/src/utils.c
+@@ -24,7 +24,7 @@
+ #include "strutils.h"
+ #include "pathnames.h"
+ #include "mountP.h"
+-#include "fileutils.h"
++#include "mount-api-utils.h"
+ #include "mangle.h"
+ #include "canonicalize.h"
+ #include "env.h"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-78410-03.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-78410-03.patch
new file mode 100644
index 00000000000..15366a8864d
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-78410-03.patch
@@ -0,0 +1,115 @@
+From 233cf7321e9d0fd2cea901d0a97e565c725640ad Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 3 Sep 2026 10:01:29 +0200
+Subject: [PATCH] libmount: use USE_LIBMOUNT_MOUNTFD_SUPPORT for idmap hook
+
+The idmap hookset was originally guarded by HAVE_MOUNTFD_API (kernel
+headers have the new mount syscalls) rather than
+USE_LIBMOUNT_MOUNTFD_SUPPORT (libmount is built with mountfd support).
+
+This was intentional (commit 9040c0900, 2022) -- the idea was to keep
+idmap working even with --disable-libmount-mountfd-support by calling
+the raw open_tree() syscall directly, while using an inner #ifdef
+USE_LIBMOUNT_MOUNTFD_SUPPORT to optionally reuse the sysapi fd_tree.
+
+This fine-grained approach broke when the CVE-2026-78410 fix replaced
+the raw open_tree() call with mnt_open_tree(), which is only available
+under USE_LIBMOUNT_MOUNTFD_SUPPORT. The build fails with
+--disable-libmount-mountfd-support because mnt_open_tree() is
+undeclared.
+
+Rather than maintaining two code paths for a feature that fundamentally
+depends on the new mount API, gate the entire idmap hookset on
+USE_LIBMOUNT_MOUNTFD_SUPPORT -- consistent with how hookset_mount is
+guarded. Remove the now-redundant inner #ifdef.
+
+Also add a note to mount.8 that X-mount.idmap requires the new
+fd-based mount API.
+
+Addresses: https://github.com/util-linux/util-linux/issues/4598
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit e06799ac325a881a297d2ffd6fe568cacdcd00ab)
+
+CVE: CVE-2026-78410
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/233cf7321e9d0fd2cea901d0a97e565c725640ad]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/hook_idmap.c | 6 ++----
+ libmount/src/hooks.c      | 2 +-
+ libmount/src/version.c    | 2 +-
+ sys-utils/mount.8.adoc    | 1 +
+ 4 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/libmount/src/hook_idmap.c b/libmount/src/hook_idmap.c
+index d4d7fbacc..94c025097 100644
+--- a/libmount/src/hook_idmap.c
++++ b/libmount/src/hook_idmap.c
+@@ -34,7 +34,7 @@
+ # include <linux/nsfs.h>
+ #endif
+ 
+-#if defined(HAVE_MOUNTFD_API) && defined(HAVE_LINUX_MOUNT_H)
++#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+ 
+ typedef enum idmap_type_t {
+ 	ID_TYPE_UID,	/* uidmap entry */
+@@ -319,7 +319,6 @@ static int hook_mount_post(
+ 	 * Once a mount has been attached to the filesystem it can't be
+ 	 * idmapped anymore. So create a new detached mount.
+ 	 */
+-#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+ 	{
+ 		struct libmnt_sysapi *api = mnt_context_get_sysapi(cxt);
+ 
+@@ -329,7 +328,6 @@ static int hook_mount_post(
+ 			DBG(HOOK, ul_debugobj(hs, " reuse tree FD"));
+ 		}
+ 	}
+-#endif
+ 	if (fd_tree < 0)
+ 		fd_tree = mnt_open_tree(AT_FDCWD, target,
+ 			    OPEN_TREE_CLONE | OPEN_TREE_CLOEXEC |
+@@ -521,4 +519,4 @@ const struct libmnt_hookset hookset_idmap =
+ 	.deinit = hookset_deinit
+ };
+ 
+-#endif /* HAVE_MOUNTFD_API && HAVE_LINUX_MOUNT_H */
++#endif /* USE_LIBMOUNT_MOUNTFD_SUPPORT */
+diff --git a/libmount/src/hooks.c b/libmount/src/hooks.c
+index 23eca4efd..5ae91edd7 100644
+--- a/libmount/src/hooks.c
++++ b/libmount/src/hooks.c
+@@ -46,7 +46,7 @@ static const struct libmnt_hookset *hooksets[] =
+ 	&hookset_mount,
+ #endif
+ 	&hookset_mount_legacy,
+-#if defined(HAVE_MOUNTFD_API) && defined(HAVE_LINUX_MOUNT_H)
++#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+ 	&hookset_idmap,
+ #endif
+ 	&hookset_owner
+diff --git a/libmount/src/version.c b/libmount/src/version.c
+index 3b61618b5..5c70ebf8a 100644
+--- a/libmount/src/version.c
++++ b/libmount/src/version.c
+@@ -38,7 +38,7 @@ static const char *lib_features[] = {
+ #ifdef USE_LIBMOUNT_SUPPORT_NAMESPACES
+ 	"namespaces",
+ #endif
+-#if defined(HAVE_MOUNTFD_API) && defined(HAVE_LINUX_MOUNT_H)
++#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+ 	"idmapping",
+ #endif
+ #ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+diff --git a/sys-utils/mount.8.adoc b/sys-utils/mount.8.adoc
+index add2914ae..4bc1bb0f9 100644
+--- a/sys-utils/mount.8.adoc
++++ b/sys-utils/mount.8.adoc
+@@ -724,6 +724,7 @@ Set _mountpoint_'s mode after mounting.
+ 
+ *X-mount.idmap*=__id-type__:__id-mount__:__id-host__:__id-range__ [__id-type__:__id-mount__:__id-host__:__id-range__], *X-mount.idmap*=__file__::
+ Use this option to create an idmapped mount.
++This feature requires the new file-descriptor-based mount API (available since Linux 5.2).
+ An idmapped mount allows to change ownership of all files located under a mount according to the ID-mapping associated with a user namespace.
+ The ownership change is tied to the lifetime and localized to the relevant mount.
+ The relevant ID-mapping can be specified in two ways:
