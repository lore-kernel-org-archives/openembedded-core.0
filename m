Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.97.1795101866213311870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=j0Z1NYwB;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so34050985e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101864; x=1795706664; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7F/aYCft6Ttd+cNvWV0b3re4/XBTyN1eaVwdWYEScIo=;
        b=j0Z1NYwBMBUPz0CmulgMI85vj+AUMuips5HjLBP1b4YmIm+lnRFStGG0tzbk/e+ha8
         JXAjdhvlQEwNYraH1Qk99J6TMUboi7AUfnmSN9IXwlgv016FFX3KxwuuZ2F5etuyvziY
         qIBOs3u60MGUWqR5lwN5vNM72pXDPeSCShYU6iX4mfH2xco2ynZ/DvZHzoVhvSMM5Tih
         exHtzBYErWld/Ee8DqDxrfjQWCb8Fz/suxnM0Y7bHbfOslefmg3PGot6yl8IcM2g5axi
         Cz48TLqEdlbS6HnghcJzWSmzO9FuCysm2TBmqvdnTpr7xNHy/SPwnNVHe0MRBwx9r2EI
         c4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101864; x=1795706664;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7F/aYCft6Ttd+cNvWV0b3re4/XBTyN1eaVwdWYEScIo=;
        b=nZj/yyqZje439oj+NDiq6V2Rp2ZJ1ADXRmRryLlpYqezv91C8pWffFzdXwS9Z3jc7O
         gfT+7NJUHk8x11lSLL1i1mHLuyLs2k8/FJaMOHgha2+gZ3qEFekXyHLcwTYTI2DKoStf
         htdnnEBIARHVb/9FcvZJ/BNJWIl/5q5DEzMcYypyzJjckNEpvP93OLrWYNXNaatU8AlS
         9u0eDaDAxpSMT/Zvscy/CXsNyesIaPGOvHR5j1m9i5s9bVEB+VqRj+qIdU+zGby1S0Hw
         MbcSZEprjfZyf3nhvWsyeVOL/Mo2LCCh6kH9lQvLAAD826aGtE5MUzGw2Qtr+1Ufjad0
         kXYg==
X-Gm-Message-State: APuU4Z++Zi/0KdTzg9pe5ChaM58hMANl/fJcLJPBScF4QT1vLiEP3eBx
	FhvsBpalJr6JWDkZt7BWgRVugY+xfWSnHgQibaGNL69nGwC8dx8G+QMCGSQbveiOFhfNlM4cjnr
	Yw+jRwFY=
X-Gm-Gg: AYBFou0A1bJii2Ybs2SDzrept12kD9pgxqQK58ROj8v+h9wzvyAhKTCUCYqwU5fwQks
	q/2YdhLe0sxJKCC+mU1ojrEWkfr1tgJOR4gFlk/fZa9NWhDmipVhtmzOrBBTiPYg2M/sBFKFHm8
	6oStPs80/dxytEsSN3kRrKaIg2IWACYajujIpLRDYkYTsUKnaNGLqjwAJ7R+Ae7Smq4hT/Wk/+Z
	l5Uz+xoTfTzjwVUzOV/WmJt0h5zzIBjC12yhzLX1EsHAyenD2KEAcKWHMWpnnJaxDezxBGpQoNR
	Pxc3H94XwxKn38+a7UGtT3nPjT6PG2+tdQiowAgTQzJ4zrfiq+PeZYoux4faWUw1jGBPRfl+i9L
	YG1ccP6nQ8urnwXCSPqeK1SKpj1vcGz2rH2uWI1GgDA0MudgwHtWC0MjMyGjF5fxmGpZ+4iu92Q
	qpktfFVYaFIYxfs7WSIPu8tKV5yLeFR6R0YEI8eNoNw9aCAirYCN8g9w43TIstw9MaA/AlAb7pn
	3ToNu/w+x7zdWOJoM15FYtdYII4GsYDRIocBT+MR+HOIVuUGa4NeqIdfHRZ80Pwn1ml7rpvPOBD
	Zm5g8tJ3+hwLMkM9Ekq29hKlbUe2+mJMF1xlHlPKCF8DPBMGaNDlvBa4wvs9EXlc0ZYzxm2itFM
	4koec3MQlswZ7ayRkVXitJ+9q//VSHn64A4M12pH5+b8E0pK80Bn23ic=
X-Received: by 2002:a05:600c:468b:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4bb7d6cc2f4mr124452595e9.4.1795101862835;
        Thu, 19 Nov 2026 07:24:22 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:22 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/19] TEST-pseudo: test patches
Date: Thu, 19 Nov 2026 16:22:33 +0100
Message-ID: <bdb4753f398e8ed8d036cdd38c6dd2eee5e482f4.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250691
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 ...ree-tests-when-the-function-or-sysca.patch | 157 ++++++++
 ...-t-generate-unused-_int-paths-with-n.patch |  59 +++
 ...ts-linux-Don-t-require-linux-mount.h.patch |  67 ++++
 ...004-configure-Require-GCC-5-or-later.patch |  76 ++++
 ...erialize-path-changes-across-clients.patch | 339 ++++++++++++++++++
 ...ath-lock-in-create-and-metadata-wrap.patch | 182 ++++++++++
 ...ted-files-under-the-path-lock-before.patch | 248 +++++++++++++
 ...s-Add-a-parallel-create-rename-link-.patch |  87 +++++
 ...Add-information-specific-to-file-pro.patch | 216 +++++++++++
 ...S.md-Add-to-assist-future-developers.patch | 113 ++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  10 +
 11 files changed, 1554 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-test-Skip-open_tree-tests-when-the-function-or-sysca.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0002-makewrappers-Don-t-generate-unused-_int-paths-with-n.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0003-ports-linux-Don-t-require-linux-mount.h.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0004-configure-Require-GCC-5-or-later.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0005-pseudo_client-serialize-path-changes-across-clients.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0006-ports-hold-the-path-lock-in-create-and-metadata-wrap.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0007-ports-check-created-files-under-the-path-lock-before.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0008-test-parallel-ops-Add-a-parallel-create-rename-link-.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0009-README.security-Add-information-specific-to-file-pro.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0010-AGENTS.md-Add-to-assist-future-developers.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-test-Skip-open_tree-tests-when-the-function-or-sysca.patch b/meta/recipes-devtools/pseudo/files/0001-test-Skip-open_tree-tests-when-the-function-or-sysca.patch
new file mode 100644
index 0000000000..4100a66213
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-test-Skip-open_tree-tests-when-the-function-or-sysca.patch
@@ -0,0 +1,157 @@
+From a4ba40892a621f342846139397fb2c636ca9dcf8 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Wed, 11 Nov 2026 10:15:03 -0600
+Subject: [PATCH] test: Skip open_tree tests when the function or syscall is
+ unavailable
+
+From: Mark Hatle <mark.hatle@amd.com>
+
+test-open_tree failed to build on systems where glibc does not provide
+open_tree() (added in glibc 2.36), e.g. Ubuntu 22.04, breaking 'make test'.
+
+Declare open_tree() weak so the test links, and skip the test if the
+symbol is not resolved or the call returns ENOSYS. Under pseudo the
+symbol always resolves to libpseudo's wrapper, which returns ENOSYS
+when libc lacks open_tree().
+
+test-open_tree_attr-syscall failed on kernels older than 6.15 which do
+not implement the open_tree_attr syscall. Probe the syscall first and
+skip the test if it returns ENOSYS.
+
+Both tests return 77 to indicate a skip, which the shell wrappers convert
+to 255 so run_tests.sh reports them as skipped, matching the existing
+openat2 tests.
+
+(cherry picked from commit ef3fadb80ea4822fd6ddbdd6fd21dd6a358f010f)
+
+Upstream-Status: Pending [patches under test, https://lore.kernel.org/all/1794413712-18072-2-git-send-email-mark.hatle@kernel.crashing.org/]
+AI-Generated: Uses GitHub Copilot
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ test/test-open_tree.c               | 25 +++++++++++++++++++++++++
+ test/test-open_tree.sh              | 15 +++++++++++++--
+ test/test-open_tree_attr-syscall.c  | 11 +++++++++++
+ test/test-open_tree_attr-syscall.sh | 15 +++++++++++++--
+ 4 files changed, 62 insertions(+), 4 deletions(-)
+
+diff --git a/test/test-open_tree.c b/test/test-open_tree.c
+index 9570f11..3b1b7ea 100644
+--- a/test/test-open_tree.c
++++ b/test/test-open_tree.c
+@@ -10,6 +10,14 @@
+ #define TEST_DIR "test-open-tree-dir"
+ #define TEST_FILE "test-open-tree-file"
+ 
++/*
++ * Older glibc versions (< 2.36) do not provide open_tree().  Declare it
++ * weak so the test still links; at runtime it resolves to glibc's or
++ * libpseudo's open_tree if either provides it, otherwise it is NULL and
++ * the test is skipped.
++ */
++extern int open_tree(int dirfd, const char *path, unsigned int flags) __attribute__((weak));
++
+ static int test_no_flags(void) {
+     int treefd = -1;
+     int fd = -1;
+@@ -124,6 +132,23 @@ static void cleanup(void) {
+ }
+ 
+ int main(void) {
++    int probefd;
++
++    if (!open_tree) {
++        fprintf(stderr, "open_tree() not available, skipping.\n");
++        return 77;
++    }
++
++    /* pseudo exports open_tree() but returns ENOSYS if libc lacks it */
++    probefd = open_tree(AT_FDCWD, ".", 0);
++    if (probefd == -1 && errno == ENOSYS) {
++        fprintf(stderr, "open_tree() returned ENOSYS, skipping.\n");
++        return 77;
++    }
++    if (probefd != -1) {
++        close(probefd);
++    }
++
+     cleanup();
+ 
+     if (mkdir(TEST_DIR, 0777) == -1) {
+diff --git a/test/test-open_tree.sh b/test/test-open_tree.sh
+index 427d550..274c654 100755
+--- a/test/test-open_tree.sh
++++ b/test/test-open_tree.sh
+@@ -1,9 +1,20 @@
+ #!/bin/sh
+ 
+-./test/test-open_tree
++# rc 77 indicates open_tree() is not available, so report skipped (255).
++# This usually indicates that glibc does not have the open_tree function.
++run_test() {
++	"$@"
++	rc=$?
++	if [ "$rc" -eq 77 ]; then
++		exit 255
++	fi
++	return "$rc"
++}
++
++run_test ./test/test-open_tree
+ rc1=$?
+ 
+-PSEUDO_IGNORE_PATHS=/ ./test/test-open_tree
++run_test env PSEUDO_IGNORE_PATHS=/ ./test/test-open_tree
+ rc2=$?
+ 
+ exit $((rc1 | rc2))
+diff --git a/test/test-open_tree_attr-syscall.c b/test/test-open_tree_attr-syscall.c
+index cc38c5f..e4e652e 100644
+--- a/test/test-open_tree_attr-syscall.c
++++ b/test/test-open_tree_attr-syscall.c
+@@ -150,6 +150,17 @@ static void cleanup(void) {
+ }
+ 
+ int main(void) {
++    int probefd;
++
++    probefd = do_open_tree_attr_syscall(AT_FDCWD, ".", 0);
++    if (probefd == -1 && errno == ENOSYS) {
++        fprintf(stderr, "open_tree_attr syscall not supported, skipping.\n");
++        return 77;
++    }
++    if (probefd != -1) {
++        close(probefd);
++    }
++
+     cleanup();
+ 
+     if (mkdir(TEST_DIR, 0777) == -1) {
+diff --git a/test/test-open_tree_attr-syscall.sh b/test/test-open_tree_attr-syscall.sh
+index f6e51f4..d87043e 100755
+--- a/test/test-open_tree_attr-syscall.sh
++++ b/test/test-open_tree_attr-syscall.sh
+@@ -1,9 +1,20 @@
+ #!/bin/sh
+ 
+-./test/test-open_tree_attr-syscall
++# rc 77 indicates the open_tree_attr syscall is not supported (ENOSYS),
++# so report skipped (255).  This usually indicates an older kernel.
++run_test() {
++	"$@"
++	rc=$?
++	if [ "$rc" -eq 77 ]; then
++		exit 255
++	fi
++	return "$rc"
++}
++
++run_test ./test/test-open_tree_attr-syscall
+ rc1=$?
+ 
+-PSEUDO_IGNORE_PATHS=/ ./test/test-open_tree_attr-syscall
++run_test env PSEUDO_IGNORE_PATHS=/ ./test/test-open_tree_attr-syscall
+ rc2=$?
+ 
+ exit $((rc1 | rc2))
diff --git a/meta/recipes-devtools/pseudo/files/0002-makewrappers-Don-t-generate-unused-_int-paths-with-n.patch b/meta/recipes-devtools/pseudo/files/0002-makewrappers-Don-t-generate-unused-_int-paths-with-n.patch
new file mode 100644
index 0000000000..923a33edf7
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0002-makewrappers-Don-t-generate-unused-_int-paths-with-n.patch
@@ -0,0 +1,59 @@
+From 9e4a0cec44021a548adeb3c55ab4c8240da5659a Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Wed, 11 Nov 2026 10:15:04 -0600
+Subject: [PATCH] makewrappers: Don't generate unused _int paths with
+ noignore_path
+
+From: Mark Hatle <mark.hatle@amd.com>
+
+With preserve_paths=1 the canonical path from pseudo_root_path() is
+stored in <path>_int rather than overwriting the path argument. The
+only reader of <path>_int is the ignore_paths() check, which is not
+generated when noignore_path=1 is also set.
+
+open_tree, open_tree_attr and openat2 set both options, so path_int was
+assigned but never used, resulting in:
+
+  warning: variable 'path_int' set but not used [-Wunused-but-set-variable]
+
+It also meant an extra pseudo_root_path() call per invocation, as the
+guts for these functions resolve the path themselves.
+
+Skip the declaration and assignment of the _int paths when both options
+are set. The generated code for all other wrappers is unchanged.
+
+(cherry picked from commit f86ca21137e8a846ba64e66243a54554be533c5e)
+
+Upstream-Status: Pending [patches under test, https://lore.kernel.org/all/1794413712-18072-2-git-send-email-mark.hatle@kernel.crashing.org/]
+AI-Generated: Uses GitHub Copilot
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ makewrappers | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/makewrappers b/makewrappers
+index 19508fa..4c99cf3 100755
+--- a/makewrappers
++++ b/makewrappers
+@@ -389,7 +389,8 @@ class Function:
+         return self.args.call()
+ 
+     def paths_decl(self):
+-        if self.preserve_paths:
++        # path_int is only read by the ignore_paths() check
++        if self.preserve_paths and not self.noignore_path:
+             return "\n\t".join("char *" + path + "_int;" for path in self.paths_to_munge)
+         return ""
+ 
+@@ -420,6 +421,9 @@ class Function:
+                     "\t\t\t%s -1;\n"
+                     "\t\t\tgoto quick_exit;\n"
+                     "\t\t}\n" % (path, self.rc_assign()))
++            if self.preserve_paths and self.noignore_path:
++                # path_int is only read by the ignore_paths() check
++                continue
+             fix_paths.append(
+                 "%s = pseudo_root_path(__func__, __LINE__, %s%s, %s, %s);" %
+                 (pathvar, prefix, self.dirfd, path, self.flags))
diff --git a/meta/recipes-devtools/pseudo/files/0003-ports-linux-Don-t-require-linux-mount.h.patch b/meta/recipes-devtools/pseudo/files/0003-ports-linux-Don-t-require-linux-mount.h.patch
new file mode 100644
index 0000000000..7ec83a39f3
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0003-ports-linux-Don-t-require-linux-mount.h.patch
@@ -0,0 +1,67 @@
+From 71e5702d36d9ecf27c32f064105459e25b1721f2 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Wed, 11 Nov 2026 10:15:05 -0600
+Subject: [PATCH] ports/linux: Don't require <linux/mount.h>
+
+From: Mark Hatle <mark.hatle@amd.com>
+
+<linux/mount.h> only exists in kernel headers from 5.2, so pseudo no
+longer built on older hosts such as CentOS 7.  pseudo only needs
+OPEN_TREE_CLONE, which already has a fallback, and struct mount_attr,
+which is only used through pointers, so declare it instead of including
+the header.  The forward declaration is also needed without the header,
+or each prototype using the struct declares a different type.
+
+(cherry picked from commit e545758f96dbe8a70623957009fd79502e638cd1)
+
+Upstream-Status: Pending [patches under test, https://lore.kernel.org/all/1794413712-18072-2-git-send-email-mark.hatle@kernel.crashing.org/]
+AI-Generated: Uses GitHub Copilot
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ ports/linux/portdefs.h             | 7 +++++--
+ test/test-open_tree_attr-syscall.c | 1 -
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/ports/linux/portdefs.h b/ports/linux/portdefs.h
+index ac1d971..546c33b 100644
+--- a/ports/linux/portdefs.h
++++ b/ports/linux/portdefs.h
+@@ -35,7 +35,6 @@ GLIBC_COMPAT_SYMBOL(memcpy,2.0);
+ #include <sys/prctl.h>
+ #include <linux/seccomp.h>
+ #include <sys/mount.h>
+-#include <linux/mount.h>
+ 
+ /* close_range()'s flags, and unshare(), are only declared by glibc under
+  * _GNU_SOURCE, which pseudo does not build with. <linux/close_range.h> is
+@@ -94,11 +93,15 @@ extern int unshare(int flags);
+ #define SYS_open_tree __NR_open_tree
+ #endif
+ 
+-/* OPEN_TREE_CLONE may be missing from older host headers.
++/* The new mount API is only in <sys/mount.h> from glibc 2.36, and
++ * <linux/mount.h> is missing from older kernel headers (before 5.2), so
++ * don't rely on either.  OPEN_TREE_CLONE is kernel ABI, and struct
++ * mount_attr is only used through pointers, so it can stay incomplete.
+  */
+ #ifndef OPEN_TREE_CLONE
+ #define OPEN_TREE_CLONE (1U << 0)
+ #endif
++struct mount_attr;
+ 
+ #ifndef SYS_open_tree_attr
+ 
+diff --git a/test/test-open_tree_attr-syscall.c b/test/test-open_tree_attr-syscall.c
+index e4e652e..aead9d4 100644
+--- a/test/test-open_tree_attr-syscall.c
++++ b/test/test-open_tree_attr-syscall.c
+@@ -5,7 +5,6 @@
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <sys/syscall.h>
+-#include <linux/mount.h>
+ #include <sys/stat.h>
+ 
+ #ifndef SYS_open_tree_attr
diff --git a/meta/recipes-devtools/pseudo/files/0004-configure-Require-GCC-5-or-later.patch b/meta/recipes-devtools/pseudo/files/0004-configure-Require-GCC-5-or-later.patch
new file mode 100644
index 0000000000..1f4d7051b1
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0004-configure-Require-GCC-5-or-later.patch
@@ -0,0 +1,76 @@
+From 19829a590a6504b148223d0de3ea3835699c876c Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Wed, 11 Nov 2026 10:15:06 -0600
+Subject: [PATCH] configure: Require GCC 5 or later
+
+From: Mark Hatle <mark.hatle@amd.com>
+
+pseudo uses __has_include, which GCC only supports from version 5, so
+older compilers such as GCC 4.8 on CentOS 7 failed part way through the
+build.
+
+clang reports itself as GCC 4.2.1, so it is only checked for
+__has_include.
+
+(cherry picked from commit 7add07ba4f5b5095a66614bb210e5d42cfe33555)
+
+Upstream-Status: Pending [patches under test, https://lore.kernel.org/all/1794413712-18072-2-git-send-email-mark.hatle@kernel.crashing.org/]
+AI-Generated: Uses GitHub Copilot
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ README    |  3 +++
+ configure | 25 +++++++++++++++++++++++++
+ 2 files changed, 28 insertions(+)
+
+diff --git a/README b/README
+index c4cb997..039f960 100644
+--- a/README
++++ b/README
+@@ -11,6 +11,9 @@ environment, allowing ordinary users to run commands which give the illusion
+ of creating device nodes, changing file ownership, and otherwise doing
+ things necessary for creating distribution packages or filesystems.
+ 
++Building pseudo requires GCC 5 or later (or clang), which the configure
++script checks for.
++
+ To configure, run the provided configure script.  Note that this is
+ NOT an autoconf script.
+ 
+diff --git a/configure b/configure
+index 68c9962..f561dcb 100755
+--- a/configure
++++ b/configure
+@@ -232,6 +232,31 @@ if [ -z "$opt_sqlite_lib" ]; then
+     opt_sqlite_lib=$opt_lib
+ fi
+ 
++# pseudo uses __has_include, which needs GCC 5 or later.  clang reports
++# itself as GCC 4.2.1, so only check its support for __has_include.
++if ! cc_version=$(${CC:-cc} -dumpversion 2>/dev/null); then
++    echo >&2 "Error: can't run the C compiler '${CC:-cc}'."
++    exit 1
++fi
++cc_check=$(mktemp -d "${TMPDIR:-/tmp}/pseudo-configure.XXXXXX") || exit 1
++cat > "$cc_check/cc_check.c" <<EOF
++#if defined(__clang__)
++# if !defined(__has_include)
++#  error clang without __has_include
++# endif
++#elif !defined(__GNUC__) || __GNUC__ < 5
++# error GCC older than 5
++#endif
++int pseudo_cc_check;
++EOF
++if ! cc_check_out=$(${CC:-cc} -c -o "$cc_check/cc_check.o" "$cc_check/cc_check.c" 2>&1); then
++    echo >&2 "Error: pseudo requires GCC 5 or later (${CC:-cc} reports version $cc_version)."
++    echo >&2 "$cc_check_out"
++    rm -rf "$cc_check"
++    exit 1
++fi
++rm -rf "$cc_check"
++
+ if [ ! -f "${opt_sqlite}/include/sqlite3.h" ]; then
+     echo >&2 "SQLite3 headers not found in at ${opt_sqlite}/include/sqlite3.h. Please check that SQLite3 and SQLite3 headers are installed."
+     exit 1
diff --git a/meta/recipes-devtools/pseudo/files/0005-pseudo_client-serialize-path-changes-across-clients.patch b/meta/recipes-devtools/pseudo/files/0005-pseudo_client-serialize-path-changes-across-clients.patch
new file mode 100644
index 0000000000..e0008a53f8
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0005-pseudo_client-serialize-path-changes-across-clients.patch
@@ -0,0 +1,339 @@
+From 7d712bbcec30795defab1f5e6d4a5f1b2a9a9bbf Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Wed, 11 Nov 2026 10:15:07 -0600
+Subject: [PATCH] pseudo_client: serialize path changes across clients
+
+From: Mark Hatle <mark.hatle@amd.com>
+
+test-parallel-rename and test-parallel-symlinks failed with "inode
+mismatch" and "path mismatch" errors, and clients were aborted by the
+server.
+
+rename() and unlink() look at the destination, send OP_MAY_UNLINK,
+make the change on disk, and then send OP_DID_UNLINK and OP_RENAME, as
+separate steps.  The wrapper lock only covers one process, so another
+client can rename onto the same name in between.  The first client then
+marks and removes the wrong inode, and its OP_RENAME finds a different
+entry at the destination.  ln -sf does the same, as it creates a
+temporary symlink and renames it over the link.
+
+Readers race in the same way: a client can lstat() a name before
+another client replaces it, but only report the result to the server
+afterwards.  If the filesystem has meanwhile reused the inode number
+for a new file, the server sees the inode under the wrong path, and
+aborts the reader.
+
+Add a path lock shared by all clients of a server, using fcntl() locks
+on pseudo.pathlock in the local state directory.  makewrappers gains a
+path_lock option which holds the lock around the guts of a wrapper:
+exclusive (path_lock=1) for rename, renameat, unlink, unlinkat and
+rmdir, and shared (path_lock=shared) for the stat family, so readers
+don't block each other but can't observe a name in the middle of a
+change.
+
+fcntl() locks belong to the process, so a forked child doesn't share
+them, and they are released if the process dies.  The descriptor is
+kept open and protected like pseudo's other internal descriptors.  If
+the lock can't be taken the operation runs unlocked as before.
+
+Both tests now pass consistently, including with PSEUDO_DEBUG set.  The
+lock adds about 4us to an lstat() (about 12%) and 2% to a rename.
+
+(cherry picked from commit 4a605712d6a4c9b410cc51c33f3d08a2836ab7d0)
+
+Upstream-Status: Pending [patches under test, https://lore.kernel.org/all/1794413712-18072-2-git-send-email-mark.hatle@kernel.crashing.org/]
+AI-Generated: Uses GitHub Copilot
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ makewrappers                   | 17 +++++++
+ ports/linux/statx/wrapfuncs.in |  2 +-
+ ports/linux/wrapfuncs.in       | 24 +++++-----
+ ports/unix/wrapfuncs.in        | 10 ++--
+ pseudo.h                       |  1 +
+ pseudo_client.c                | 83 +++++++++++++++++++++++++++++++++-
+ pseudo_client.h                |  2 +
+ templates/wrapfuncs.c          |  2 +-
+ 8 files changed, 121 insertions(+), 20 deletions(-)
+
+diff --git a/makewrappers b/makewrappers
+index 4c99cf3..6b96c74 100755
+--- a/makewrappers
++++ b/makewrappers
+@@ -244,6 +244,11 @@ class Function:
+         self.noignore_path = False
+         self.hand_wrapped = None
+         self.async_skip = None
++        # Hold the client path lock (pseudo_client_path_lock()) around
++        # the guts: path_lock=1 (exclusive) for operations that check,
++        # change and then record a path in separate steps, and
++        # path_lock=shared for operations that only look at a path.
++        self.path_lock = None
+         # used for the copyright date when creating stub functions
+         self.date = datetime.date.today().year
+         # Used to define pointers that should EFAULT if null
+@@ -494,6 +499,18 @@ class Function:
+         else:
+             return "rc ="
+ 
++    def path_lock_begin(self):
++        """take the client path lock, for path_lock=1 functions"""
++        if self.path_lock:
++            return "int path_lock_fd = pseudo_client_path_lock(%d);\n\t\t\t" % (self.path_lock == "shared")
++        return ""
++
++    def path_lock_end(self):
++        """release the client path lock, for path_lock=1 functions"""
++        if self.path_lock:
++            return "\n\t\t\tpseudo_client_path_unlock(path_lock_fd);"
++        return ""
++
+     def def_return(self):
+         """return default value (or just return)"""
+         if self.type == 'void':
+diff --git a/ports/linux/statx/wrapfuncs.in b/ports/linux/statx/wrapfuncs.in
+index a81fb91..3ca40ac 100644
+--- a/ports/linux/statx/wrapfuncs.in
++++ b/ports/linux/statx/wrapfuncs.in
+@@ -1 +1 @@
+-int statx(int dirfd, const char *path, int flags, unsigned int mask, struct statx *statxbuf); /* efault=path */
++int statx(int dirfd, const char *path, int flags, unsigned int mask, struct statx *statxbuf); /* efault=path, path_lock=shared */
+diff --git a/ports/linux/wrapfuncs.in b/ports/linux/wrapfuncs.in
+index d417ed3..65f2d7a 100644
+--- a/ports/linux/wrapfuncs.in
++++ b/ports/linux/wrapfuncs.in
+@@ -2,12 +2,12 @@ int open(const char *path, int flags, ...{mode_t mode}); /* flags=((flags&O_NOFO
+ int __open_2(const char *path, int flags); /* flags=((flags&O_NOFOLLOW)||((flags&(O_CREAT|O_EXCL))==(O_CREAT|O_EXCL))), noignore_path=1 */
+ int __open64_2(const char *path, int flags); /* flags=((flags&O_NOFOLLOW)||((flags&(O_CREAT|O_EXCL))==(O_CREAT|O_EXCL))), noignore_path=1 */
+ char *get_current_dir_name(void);
+-int __xstat(int ver, const char *path, struct stat *buf);
+-int __lxstat(int ver, const char *path, struct stat *buf); /* flags=AT_SYMLINK_NOFOLLOW */
++int __xstat(int ver, const char *path, struct stat *buf); /* path_lock=shared */
++int __lxstat(int ver, const char *path, struct stat *buf); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=shared */
+ int __fxstat(int ver, int fd, struct stat *buf);
+ int lchmod(const char *path, mode_t mode); /* flags=AT_SYMLINK_NOFOLLOW */
+ int lchown(const char *path, uid_t owner, gid_t group); /* flags=AT_SYMLINK_NOFOLLOW */
+-int __fxstatat(int ver, int dirfd, const char *path, struct stat *buf, int flags);
++int __fxstatat(int ver, int dirfd, const char *path, struct stat *buf, int flags); /* path_lock=shared */
+ int openat(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=((flags&O_NOFOLLOW)||((flags&(O_CREAT|O_EXCL))==(O_CREAT|O_EXCL))), noignore_path=1 */
+ int __openat_2(int dirfd, const char *path, int flags); /* flags=((flags&O_NOFOLLOW)||((flags&(O_CREAT|O_EXCL))==(O_CREAT|O_EXCL))), noignore_path=1 */
+ int open_tree(int dirfd, const char *path, unsigned int flags); /* preserve_paths=1, noignore_path=1 */
+@@ -25,18 +25,18 @@ int open64(const char *path, int flags, ...{mode_t mode}); /* flags=((flags&O_NO
+ int openat64(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=((flags&O_NOFOLLOW)||((flags&(O_CREAT|O_EXCL))==(O_CREAT|O_EXCL))), noignore_path=1 */
+ int __openat64_2(int dirfd, const char *path, int flags); /* flags=((flags&O_NOFOLLOW)||((flags&(O_CREAT|O_EXCL))==(O_CREAT|O_EXCL))), noignore_path=1 */
+ int creat64(const char *path, mode_t mode);
+-int stat(const char *path, struct stat *buf); /* real_func=pseudo_stat */
+-int lstat(const char *path, struct stat *buf); /* real_func=pseudo_lstat, flags=AT_SYMLINK_NOFOLLOW */
++int stat(const char *path, struct stat *buf); /* real_func=pseudo_stat, path_lock=shared */
++int lstat(const char *path, struct stat *buf); /* real_func=pseudo_lstat, flags=AT_SYMLINK_NOFOLLOW, path_lock=shared */
+ int fstat(int fd, struct stat *buf); /* real_func=pseudo_fstat */
+-int fstatat(int dirfd, const char *path, struct stat *buf, int flags);
+-int stat64(const char *path, struct stat64 *buf); /* real_func=pseudo_stat64 */
+-int lstat64(const char *path, struct stat64 *buf); /* real_func=pseudo_lstat64, flags=AT_SYMLINK_NOFOLLOW */
++int fstatat(int dirfd, const char *path, struct stat *buf, int flags); /* path_lock=shared */
++int stat64(const char *path, struct stat64 *buf); /* real_func=pseudo_stat64, path_lock=shared */
++int lstat64(const char *path, struct stat64 *buf); /* real_func=pseudo_lstat64, flags=AT_SYMLINK_NOFOLLOW, path_lock=shared */
+ int fstat64(int fd, struct stat64 *buf); /* real_func=pseudo_fstat64 */
+-int fstatat64(int dirfd, const char *path, struct stat64 *buf, int flags);
+-int __xstat64(int ver, const char *path, struct stat64 *buf);
+-int __lxstat64(int ver, const char *path, struct stat64 *buf); /* flags=AT_SYMLINK_NOFOLLOW */
++int fstatat64(int dirfd, const char *path, struct stat64 *buf, int flags); /* path_lock=shared */
++int __xstat64(int ver, const char *path, struct stat64 *buf); /* path_lock=shared */
++int __lxstat64(int ver, const char *path, struct stat64 *buf); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=shared */
+ int __fxstat64(int ver, int fd, struct stat64 *buf);
+-int __fxstatat64(int ver, int dirfd, const char *path, struct stat64 *buf, int flags);
++int __fxstatat64(int ver, int dirfd, const char *path, struct stat64 *buf, int flags); /* path_lock=shared */
+ FILE *fopen64(const char *path, const char *mode); /* noignore_path=1 */
+ int nftw64(const char *path, int (*fn)(const char *, const struct stat64 *, int, struct FTW *), int nopenfd, int flag); /* noignore_path=1 */
+ FILE *freopen64(const char *path, const char *mode, FILE *stream);  /* noignore_path=1 */
+diff --git a/ports/unix/wrapfuncs.in b/ports/unix/wrapfuncs.in
+index 5665735..a4892fe 100644
+--- a/ports/unix/wrapfuncs.in
++++ b/ports/unix/wrapfuncs.in
+@@ -53,13 +53,13 @@ int mkstemp(char *template); /* flags=AT_SYMLINK_NOFOLLOW */
+ int mkostemp(char *template, int oflags); /* flags=AT_SYMLINK_NOFOLLOW */
+ int mkstemps(char *template, int suffixlen); /* flags=AT_SYMLINK_NOFOLLOW */
+ int mkostemps(char *template, int suffixlen, int oflags); /* flags=AT_SYMLINK_NOFOLLOW */
+-int rename(const char *oldpath, const char *newpath); /* flags=AT_SYMLINK_NOFOLLOW */
+-int renameat(int olddirfd, const char *oldpath, int newdirfd, const char *newpath); /* flags=AT_SYMLINK_NOFOLLOW */
+-int rmdir(const char *path); /* flags=AT_SYMLINK_NOFOLLOW */
++int rename(const char *oldpath, const char *newpath); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int renameat(int olddirfd, const char *oldpath, int newdirfd, const char *newpath); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int rmdir(const char *path); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
+ int symlink(const char *oldname, const char *newpath); /* flags=AT_SYMLINK_NOFOLLOW */
+ int symlinkat(const char *oldname, int dirfd, const char *newpath); /* flags=AT_SYMLINK_NOFOLLOW */
+-int unlink(const char *path); /* flags=AT_SYMLINK_NOFOLLOW */
+-int unlinkat(int dirfd, const char *path, int rflags); /* flags=AT_SYMLINK_NOFOLLOW */
++int unlink(const char *path); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int unlinkat(int dirfd, const char *path, int rflags); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
+ # primarily for use with chroot()
+ ssize_t readlink(const char *path, char *buf, size_t bufsiz); /* flags=AT_SYMLINK_NOFOLLOW */
+ ssize_t readlinkat(int dirfd, const char *path, char *buf, size_t bufsiz); /* flags=AT_SYMLINK_NOFOLLOW */
+diff --git a/pseudo.h b/pseudo.h
+index 3e98c0b..c1077cb 100644
+--- a/pseudo.h
++++ b/pseudo.h
+@@ -109,6 +109,7 @@ extern char *pseudo_version;
+ 
+ #define PSEUDO_LOCKFILE "pseudo.lock"
+ #define PSEUDO_LOGFILE "pseudo.log"
++#define PSEUDO_PATHLOCK "pseudo.pathlock"
+ #define PSEUDO_PIDFILE "pseudo.pid"
+ #define PSEUDO_SOCKET "pseudo.socket"
+ 
+diff --git a/pseudo_client.c b/pseudo_client.c
+index 6bdb17c..759afeb 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -47,6 +47,7 @@ static char *base_path(int dirfd, const char *path, int leave_last);
+ static int connect_fd = -1;
+ static int server_pid = 0;
+ int pseudo_localstate_dir_fd = -1;
++static int pseudo_pathlock_fd = -1;
+ int pseudo_pwd_fd = -1;
+ int pseudo_pwd_lck_fd = -1;
+ char *pseudo_pwd_lck_name = NULL;
+@@ -532,6 +533,7 @@ pseudo_init_client(void) {
+ 		/* Ensure that all of the values are reset */
+ 		server_pid = 0;
+ 		pseudo_localstate_dir_fd = -1;
++		pseudo_pathlock_fd = -1;
+ 		pseudo_pwd_fd = -1;
+ 		pseudo_pwd_lck_fd = -1;
+ 		pseudo_pwd_lck_name = NULL;
+@@ -1173,6 +1175,80 @@ pseudo_fd(int fd, int how) {
+ 	return(newfd);
+ }
+ 
++/* Operations such as rename() and unlink() look at the destination, change
++ * it on disk, and then tell the server what happened, in several separate
++ * steps.  Another client doing the same to the same name in between makes
++ * the database describe a file that is no longer there, which the server
++ * reports as an inode or path mismatch.  Wrappers marked path_lock=1 hold
++ * this lock, shared by every client of the server, for the whole sequence.
++ *
++ * fcntl() locks belong to the process, so a forked child does not share
++ * them even though it inherits the descriptor, and they are released if
++ * the process dies.  The descriptor is kept open and protected like
++ * pseudo's other internal descriptors.
++ *
++ * Wrappers that only look at a path (stat() and friends) take the lock
++ * shared: they don't block each other, but can't observe a path between
++ * the change on disk and the database update.
++ *
++ * Returns the descriptor to pass to pseudo_client_path_unlock(), or -1 if
++ * the lock could not be taken, in which case the operation runs unlocked.
++ */
++int
++pseudo_client_path_lock(int shared) {
++	static char *lock_path = NULL;
++	struct flock lk = { .l_type = shared ? F_RDLCK : F_WRLCK, .l_whence = SEEK_SET };
++	int save_errno = errno;
++	int locked = 0, retried = 0;
++
++	pseudo_antimagic();
++	for (;;) {
++		if (pseudo_pathlock_fd == -1) {
++			if (!lock_path)
++				lock_path = pseudo_localstatedir_path(PSEUDO_PATHLOCK);
++			if (lock_path)
++				pseudo_pathlock_fd = pseudo_fd(open(lock_path,
++					O_RDWR | O_CREAT | O_CLOEXEC, 0644), MOVE_FD);
++			if (pseudo_pathlock_fd == -1) {
++				pseudo_debug(PDBGF_CLIENT, "path lock: can't open '%s': %s\n",
++					lock_path ? lock_path : "<nil>", strerror(errno));
++				break;
++			}
++		}
++		if (fcntl(pseudo_pathlock_fd, F_SETLKW, &lk) == 0) {
++			locked = 1;
++			break;
++		}
++		if (errno == EINTR)
++			continue;
++		/* closed behind our back: reopen it once */
++		if (errno == EBADF && !retried) {
++			pseudo_pathlock_fd = -1;
++			retried = 1;
++			continue;
++		}
++		pseudo_debug(PDBGF_CLIENT, "path lock: can't lock '%s': %s\n",
++			lock_path ? lock_path : "<nil>", strerror(errno));
++		break;
++	}
++	pseudo_magic();
++	errno = save_errno;
++	return locked ? pseudo_pathlock_fd : -1;
++}
++
++void
++pseudo_client_path_unlock(int fd) {
++	struct flock lk = { .l_type = F_UNLCK, .l_whence = SEEK_SET };
++	int save_errno = errno;
++
++	if (fd != -1) {
++		pseudo_antimagic();
++		fcntl(fd, F_SETLK, &lk);
++		pseudo_magic();
++	}
++	errno = save_errno;
++}
++
+ static int
+ client_connect(void) {
+ 	/* we have a server pid, is it responsive? */
+@@ -1913,6 +1989,8 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
+ 			startfd = pseudo_util_evlog_fd + 1;
+ 		if (pseudo_localstate_dir_fd >= startfd)
+ 			startfd = pseudo_localstate_dir_fd + 1;
++		if (pseudo_pathlock_fd >= startfd)
++			startfd = pseudo_pathlock_fd + 1;
+ 		if (pseudo_pwd_fd >= startfd)
+ 			startfd = pseudo_pwd_fd + 1;
+ 		if (pseudo_pwd_lck_fd >= startfd)
+@@ -1926,7 +2004,8 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
+ 		 */
+ 		for (i = fd; i < startfd && i <= close_range_maxfd; ++i) {
+ 			if (i == pseudo_util_debug_fd || i == pseudo_util_evlog_fd ||
+-					i == pseudo_localstate_dir_fd || i == pseudo_pwd_fd ||
++					i == pseudo_localstate_dir_fd || i == pseudo_pathlock_fd ||
++					i == pseudo_pwd_fd ||
+ 					i == pseudo_pwd_lck_fd || i == pseudo_grp_fd ||
+ 					i == connect_fd)
+ 				continue;
+@@ -1952,6 +2031,8 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
+ 				pseudo_util_debug_fd = pseudo_fd(fd, COPY_FD);
+ 			} else if (fd == pseudo_localstate_dir_fd) {
+ 				pseudo_localstate_dir_fd = pseudo_fd(fd, COPY_FD);
++			} else if (fd == pseudo_pathlock_fd) {
++				pseudo_pathlock_fd = pseudo_fd(fd, COPY_FD);
+ 			} else if (fd == pseudo_pwd_fd) {
+ 				pseudo_pwd_fd = pseudo_fd(fd, COPY_FD);
+ 				/* since we have a FILE * on it, we close that... */
+diff --git a/pseudo_client.h b/pseudo_client.h
+index 9b9f86a..217981d 100644
+--- a/pseudo_client.h
++++ b/pseudo_client.h
+@@ -28,6 +28,8 @@ extern void pseudo_client_touchgid(void);
+ extern char *pseudo_client_fdpath(int fd);
+ extern int pseudo_client_shutdown(int);
+ extern int pseudo_fd(int fd, int how);
++extern int pseudo_client_path_lock(int shared);
++extern void pseudo_client_path_unlock(int fd);
+ #define MOVE_FD	0
+ #define COPY_FD	1
+ #define PSEUDO_MIN_FD	20
+diff --git a/templates/wrapfuncs.c b/templates/wrapfuncs.c
+index 9385a40..a57c997 100644
+--- a/templates/wrapfuncs.c
++++ b/templates/wrapfuncs.c
+@@ -68,7 +68,7 @@ ${maybe_async_skip}
+ 		} else {
+ 			/* exec*() use this to restore the sig mask */
+ 			pseudo_saved_sigmask = saved;
+-			${rc_assign} wrap_$name(${call_args});
++			${path_lock_begin}${rc_assign} wrap_$name(${call_args});${path_lock_end}
+ 		}
+ 	}
+ 	${variadic_end}
diff --git a/meta/recipes-devtools/pseudo/files/0006-ports-hold-the-path-lock-in-create-and-metadata-wrap.patch b/meta/recipes-devtools/pseudo/files/0006-ports-hold-the-path-lock-in-create-and-metadata-wrap.patch
new file mode 100644
index 0000000000..23815b7aac
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0006-ports-hold-the-path-lock-in-create-and-metadata-wrap.patch
@@ -0,0 +1,182 @@
+From e52f678bbc2c34b1bc8519a42f03c9006657b161 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Wed, 11 Nov 2026 10:15:08 -0600
+Subject: [PATCH] ports: hold the path lock in create and metadata wrappers
+
+From: Mark Hatle <mark.hatle@amd.com>
+
+Like rename() and unlink(), the wrappers that create a name, or that
+look at a path and then change its metadata in the database, do so in
+separate steps: the real operation on disk, then a request to the
+server.  Another client renaming onto or removing the same name in
+between leaves the database out of step with the filesystem, which the
+server reports as an inode or path mismatch, and may abort a client.
+
+Hold the path lock exclusively in the wrappers that create a name:
+link, linkat, symlink, symlinkat, mkdir, mkdirat, mkfifo, mkfifoat,
+mknod, mknodat, __xmknod, __xmknodat, bind, mkdtemp and the mkstemp
+family.  None of these can block indefinitely.
+
+Hold it shared in the wrappers that look at a path and then record or
+query its metadata: chmod, lchmod, fchmodat, chown, lchown, fchownat,
+fts_read, fts_children, and the path based xattr calls.
+
+(cherry picked from commit c8b1b3ab4d552570f854d3ee19f3bf9611ae633a)
+
+Upstream-Status: Pending [patches under test, https://lore.kernel.org/all/1794413712-18072-2-git-send-email-mark.hatle@kernel.crashing.org/]
+AI-Generated: Uses GitHub Copilot
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ ports/linux/wrapfuncs.in       | 16 ++++++------
+ ports/linux/xattr/wrapfuncs.in | 16 ++++++------
+ ports/unix/wrapfuncs.in        | 46 +++++++++++++++++-----------------
+ 3 files changed, 39 insertions(+), 39 deletions(-)
+
+diff --git a/ports/linux/wrapfuncs.in b/ports/linux/wrapfuncs.in
+index 65f2d7a..a682383 100644
+--- a/ports/linux/wrapfuncs.in
++++ b/ports/linux/wrapfuncs.in
+@@ -5,17 +5,17 @@ char *get_current_dir_name(void);
+ int __xstat(int ver, const char *path, struct stat *buf); /* path_lock=shared */
+ int __lxstat(int ver, const char *path, struct stat *buf); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=shared */
+ int __fxstat(int ver, int fd, struct stat *buf);
+-int lchmod(const char *path, mode_t mode); /* flags=AT_SYMLINK_NOFOLLOW */
+-int lchown(const char *path, uid_t owner, gid_t group); /* flags=AT_SYMLINK_NOFOLLOW */
++int lchmod(const char *path, mode_t mode); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=shared */
++int lchown(const char *path, uid_t owner, gid_t group); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=shared */
+ int __fxstatat(int ver, int dirfd, const char *path, struct stat *buf, int flags); /* path_lock=shared */
+ int openat(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=((flags&O_NOFOLLOW)||((flags&(O_CREAT|O_EXCL))==(O_CREAT|O_EXCL))), noignore_path=1 */
+ int __openat_2(int dirfd, const char *path, int flags); /* flags=((flags&O_NOFOLLOW)||((flags&(O_CREAT|O_EXCL))==(O_CREAT|O_EXCL))), noignore_path=1 */
+ int open_tree(int dirfd, const char *path, unsigned int flags); /* preserve_paths=1, noignore_path=1 */
+ int open_tree_attr(int dirfd, const char *path, unsigned int flags, struct mount_attr *attr, size_t size); /* preserve_paths=1, noignore_path=1*/
+-int mknod(const char *path, mode_t mode, dev_t dev); /* real_func=pseudo_mknod */
+-int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev); /* real_func=pseudo_mknodat */
+-int __xmknod(int ver, const char *path, mode_t mode, dev_t *dev); /* flags=AT_SYMLINK_NOFOLLOW */
+-int __xmknodat(int ver, int dirfd, const char *path, mode_t mode, dev_t *dev); /* flags=AT_SYMLINK_NOFOLLOW */
++int mknod(const char *path, mode_t mode, dev_t dev); /* real_func=pseudo_mknod, path_lock=1 */
++int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev); /* real_func=pseudo_mknodat, path_lock=1 */
++int __xmknod(int ver, const char *path, mode_t mode, dev_t *dev); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int __xmknodat(int ver, int dirfd, const char *path, mode_t mode, dev_t *dev); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
+ int fcntl(int fd, int cmd, ...{struct flock *lock});  /* noignore_path=1 */
+ int fcntl64(int fd, int cmd, ...{struct flock *lock});  /* noignore_path=1 */
+ # just so we know the inums of symlinks
+@@ -44,8 +44,8 @@ int ftw64(const char *path, int (*fn)(const char *, const struct stat64 *, int),
+ int glob64(const char *pattern, int flags, int (*errfunc)(const char *, int), glob64_t *pglob);
+ int scandir64(const char *path, struct dirent64 ***namelist, int (*filter)(const struct dirent64 *), int (*compar)());
+ int truncate64(const char *path, off64_t length);
+-int mkostemp64(char *template, int oflags); /* flags=AT_SYMLINK_NOFOLLOW */
+-int mkstemp64(char *template); /* flags=AT_SYMLINK_NOFOLLOW */
++int mkostemp64(char *template, int oflags); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int mkstemp64(char *template); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
+ int getgrouplist(const char *user, gid_t group, gid_t *groups, int *ngroups);
+ int setgroups(size_t size, const gid_t *list);
+ int setfsgid(gid_t fsgid);
+diff --git a/ports/linux/xattr/wrapfuncs.in b/ports/linux/xattr/wrapfuncs.in
+index 09eba23..89b1c68 100644
+--- a/ports/linux/xattr/wrapfuncs.in
++++ b/ports/linux/xattr/wrapfuncs.in
+@@ -1,12 +1,12 @@
+-ssize_t getxattr(const char *path, const char *name, void *value, size_t size); /* flags=0, version="GLIBC_2.3", version-aarch64="GLIBC_2.17" */
+-ssize_t lgetxattr(const char *path, const char *name, void *value, size_t size); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3", version-aarch64="GLIBC_2.17" */
++ssize_t getxattr(const char *path, const char *name, void *value, size_t size); /* flags=0, version="GLIBC_2.3", version-aarch64="GLIBC_2.17", path_lock=shared */
++ssize_t lgetxattr(const char *path, const char *name, void *value, size_t size); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3", version-aarch64="GLIBC_2.17", path_lock=shared */
+ ssize_t fgetxattr(int filedes, const char *name, void *value, size_t size); /* version="GLIBC_2.3", version-aarch64="GLIBC_2.17" */
+-int setxattr(const char *path, const char *name, const void *value, size_t size, int xflags); /* flags=0, version="GLIBC_2.3", version-aarch64="GLIBC_2.17" */
+-int lsetxattr(const char *path, const char *name, const void *value, size_t size, int xflags); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3", version-aarch64="GLIBC_2.17" */
++int setxattr(const char *path, const char *name, const void *value, size_t size, int xflags); /* flags=0, version="GLIBC_2.3", version-aarch64="GLIBC_2.17", path_lock=shared */
++int lsetxattr(const char *path, const char *name, const void *value, size_t size, int xflags); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3", version-aarch64="GLIBC_2.17", path_lock=shared */
+ int fsetxattr(int filedes, const char *name, const void *value, size_t size, int xflags); /* version="GLIBC_2.3", version-aarch64="GLIBC_2.17" */
+-ssize_t listxattr(const char *path, char *list, size_t size); /* flags=0, version="GLIBC_2.3", version-aarch64="GLIBC_2.17" */
+-ssize_t llistxattr(const char *path, char *list, size_t size); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3", version-aarch64="GLIBC_2.17" */
++ssize_t listxattr(const char *path, char *list, size_t size); /* flags=0, version="GLIBC_2.3", version-aarch64="GLIBC_2.17", path_lock=shared */
++ssize_t llistxattr(const char *path, char *list, size_t size); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3", version-aarch64="GLIBC_2.17", path_lock=shared */
+ ssize_t flistxattr(int filedes, char *list, size_t size); /* version="GLIBC_2.3", version-aarch64="GLIBC_2.17" */
+-int removexattr(const char *path, const char *name); /* flags=0, version="GLIBC_2.3", version-aarch64="GLIBC_2.17" */
+-int lremovexattr(const char *path, const char *name); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3", version-aarch64="GLIBC_2.17" */
++int removexattr(const char *path, const char *name); /* flags=0, version="GLIBC_2.3", version-aarch64="GLIBC_2.17", path_lock=shared */
++int lremovexattr(const char *path, const char *name); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3", version-aarch64="GLIBC_2.17", path_lock=shared */
+ int fremovexattr(int filedes, const char *name); /* version="GLIBC_2.3", version-aarch64="GLIBC_2.17" */
+diff --git a/ports/unix/wrapfuncs.in b/ports/unix/wrapfuncs.in
+index a4892fe..b9d0782 100644
+--- a/ports/unix/wrapfuncs.in
++++ b/ports/unix/wrapfuncs.in
+@@ -4,7 +4,7 @@ char *getwd(char *buf);
+ int close(int fd);  /* noignore_path=1 */
+ int fchmod(int fd, mode_t mode);
+ int fchown(int fd, uid_t owner, gid_t group);
+-int lchown(const char *path, uid_t owner, gid_t group); /* flags=AT_SYMLINK_NOFOLLOW */
++int lchown(const char *path, uid_t owner, gid_t group); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=shared */
+ int dup2(int oldfd, int newfd); /* noignore_path=1 */
+ int dup(int fd); /* noignore_path=1 */
+ int chdir(const char *path); /* noignore_path=1 */
+@@ -13,13 +13,13 @@ int access(const char *path, int mode);
+ int faccessat(int dirfd, const char *path, int mode, int flags);
+ int faccessat2(int dirfd, const char *path, int mode, int flags);
+ FTS *fts_open(char * const *path_argv, int options, int (*compar)(const FTSENT **, const FTSENT **)); /* inode64=1 */
+-FTSENT *fts_read(FTS *ftsp); /* noignore_path=1, inode64=1 */
+-FTSENT *fts_children(FTS *ftsp, int options); /* noignore_path=1, inode64=1 */
++FTSENT *fts_read(FTS *ftsp); /* noignore_path=1, inode64=1, path_lock=shared */
++FTSENT *fts_children(FTS *ftsp, int options); /* noignore_path=1, inode64=1, path_lock=shared */
+ int ftw(const char *path, int (*fn)(const char *, const struct stat *, int), int nopenfd);
+ int nftw(const char *path, int (*fn)(const char *, const struct stat *, int, struct FTW *), int nopenfd, int flag);
+ int glob(const char *pattern, int flags, int (*errfunc)(const char *, int), glob_t *pglob);
+ int lutimes(const char *path, const struct timeval *tv); /* flags=AT_SYMLINK_NOFOLLOW */
+-char *mkdtemp(char *template);
++char *mkdtemp(char *template); /* path_lock=1 */
+ char *mktemp(char *template);
+ long pathconf(const char *path, int name);
+ char *realpath(const char *name, char *resolved_name); /* version="GLIBC_2.3" */
+@@ -37,27 +37,27 @@ int fclose(FILE *fp);  /* noignore_path=1 */
+ FILE *freopen(const char *path, const char *mode, FILE *stream); /* noignore_path=1 */
+ int chroot(const char *path); /* noignore_path=1 */
+ int acct(const char *path);
+-int chmod(const char *path, mode_t mode);
+-int chown(const char *path, uid_t owner, gid_t group);
+-int fchmodat(int dirfd, const char *path, mode_t mode, int flags);
+-int fchownat(int dirfd, const char *path, uid_t owner, gid_t group, int flags);
+-int link(const char *oldname, const char *newname); /* flags=AT_SYMLINK_NOFOLLOW */
+-int linkat(int olddirfd, const char *oldname, int newdirfd, const char *newname, int flags);
+-int mkdir(const char *path, mode_t mode); /* flags=AT_SYMLINK_NOFOLLOW */
+-int mkdirat(int dirfd, const char *path, mode_t mode); /* flags=AT_SYMLINK_NOFOLLOW */
+-int mkfifo(const char *path, mode_t mode); /* flags=AT_SYMLINK_NOFOLLOW */
+-int mkfifoat(int dirfd, const char *path, mode_t mode); /* flags=AT_SYMLINK_NOFOLLOW */
+-int mknod(const char *path, mode_t mode, dev_t dev); /* flags=AT_SYMLINK_NOFOLLOW */
+-int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev); /* flags=AT_SYMLINK_NOFOLLOW */
+-int mkstemp(char *template); /* flags=AT_SYMLINK_NOFOLLOW */
+-int mkostemp(char *template, int oflags); /* flags=AT_SYMLINK_NOFOLLOW */
+-int mkstemps(char *template, int suffixlen); /* flags=AT_SYMLINK_NOFOLLOW */
+-int mkostemps(char *template, int suffixlen, int oflags); /* flags=AT_SYMLINK_NOFOLLOW */
++int chmod(const char *path, mode_t mode); /* path_lock=shared */
++int chown(const char *path, uid_t owner, gid_t group); /* path_lock=shared */
++int fchmodat(int dirfd, const char *path, mode_t mode, int flags); /* path_lock=shared */
++int fchownat(int dirfd, const char *path, uid_t owner, gid_t group, int flags); /* path_lock=shared */
++int link(const char *oldname, const char *newname); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int linkat(int olddirfd, const char *oldname, int newdirfd, const char *newname, int flags); /* path_lock=1 */
++int mkdir(const char *path, mode_t mode); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int mkdirat(int dirfd, const char *path, mode_t mode); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int mkfifo(const char *path, mode_t mode); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int mkfifoat(int dirfd, const char *path, mode_t mode); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int mknod(const char *path, mode_t mode, dev_t dev); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int mkstemp(char *template); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int mkostemp(char *template, int oflags); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int mkstemps(char *template, int suffixlen); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int mkostemps(char *template, int suffixlen, int oflags); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
+ int rename(const char *oldpath, const char *newpath); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
+ int renameat(int olddirfd, const char *oldpath, int newdirfd, const char *newpath); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
+ int rmdir(const char *path); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
+-int symlink(const char *oldname, const char *newpath); /* flags=AT_SYMLINK_NOFOLLOW */
+-int symlinkat(const char *oldname, int dirfd, const char *newpath); /* flags=AT_SYMLINK_NOFOLLOW */
++int symlink(const char *oldname, const char *newpath); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
++int symlinkat(const char *oldname, int dirfd, const char *newpath); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
+ int unlink(const char *path); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
+ int unlinkat(int dirfd, const char *path, int rflags); /* flags=AT_SYMLINK_NOFOLLOW, path_lock=1 */
+ # primarily for use with chroot()
+@@ -74,4 +74,4 @@ void sync(void); /* async_skip= */
+ int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned int flags); /* async_skip=0 */
+ int msync(void *addr, size_t length, int flags); /* async_skip=0 */
+ mode_t umask(mode_t mask);
+-int bind(int sockfd, const struct sockaddr *addr, socklen_t addrlen);
++int bind(int sockfd, const struct sockaddr *addr, socklen_t addrlen); /* path_lock=1 */
diff --git a/meta/recipes-devtools/pseudo/files/0007-ports-check-created-files-under-the-path-lock-before.patch b/meta/recipes-devtools/pseudo/files/0007-ports-check-created-files-under-the-path-lock-before.patch
new file mode 100644
index 0000000000..0c7716e72a
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0007-ports-check-created-files-under-the-path-lock-before.patch
@@ -0,0 +1,248 @@
+From 45bf43b216bfa281bbbf838f18acbf8df0531f67 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Wed, 11 Nov 2026 10:15:09 -0600
+Subject: [PATCH] ports: check created files under the path lock before
+ recording them
+
+From: Mark Hatle <mark.hatle@amd.com>
+
+open() and friends with O_CREAT create a file and then send OP_CREAT
+for the path, so another client can rename onto or remove the name in
+between, like the other wrappers that create names.  They can't hold
+the path lock across the real call, as opening a FIFO can block
+indefinitely, which could deadlock against a client waiting for the
+lock.
+
+Instead, take the lock after the file has been opened, and only send
+OP_CREAT if the path still names the file that was opened, using a new
+pseudo_client_path_matches_fd().  With the lock held no other client is
+part way through changing the path, so if it now names a different
+file, that client has already recorded the change and recording ours
+would be wrong.
+
+This covers openat (and so open, creat and their variants), openat2,
+fopen, freopen, fopen64 and freopen64.  openat and openat2 now also take
+the recorded stat data from the descriptor rather than from an earlier
+lookup of the path.
+
+AI-Generated: Uses GitHub Copilot
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+(cherry picked from commit 21fe63e9dbeb50aa21b498b485d0c3d87f632bc3)
+
+Also include the pseudo_real_fstat and pseudo_real_stat declarations
+(pseudo_client.h), definitions (pseudo_util.c) and initialization
+(pseudo_wrappers.c) from fcd8a81 ("pseudo_client: resolve
+/proc/<pid>/fd/<n> to the descriptor").
+
+The new pseudo_client_path_matches_fd() needs them, but the rest of
+fcd8a81 is an unrelated behavior change that is not being backported.
+
+Upstream-Status: Pending [patches under test, https://lore.kernel.org/all/1794413712-18072-2-git-send-email-mark.hatle@kernel.crashing.org/]
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ ports/linux/guts/fopen64.c         |  5 ++++-
+ ports/linux/guts/freopen64.c       |  5 ++++-
+ ports/linux/guts/openat.c          |  8 +++++++-
+ ports/linux/openat2/guts/openat2.c |  8 +++++++-
+ ports/unix/guts/fopen.c            |  5 ++++-
+ ports/unix/guts/freopen.c          |  5 ++++-
+ pseudo_client.c                    | 25 +++++++++++++++++++++++++
+ pseudo_client.h                    |  3 +++
+ pseudo_util.c                      |  2 ++
+ pseudo_wrappers.c                  |  2 ++
+ 10 files changed, 62 insertions(+), 6 deletions(-)
+
+diff --git a/ports/linux/guts/fopen64.c b/ports/linux/guts/fopen64.c
+index e76da69..a6efd18 100644
+--- a/ports/linux/guts/fopen64.c
++++ b/ports/linux/guts/fopen64.c
+@@ -22,8 +22,11 @@
+ 		pseudo_debug(PDBGF_FILE, "fopen64 '%s': fd %d <FILE %p>\n", path, fd, (void *) rc);
+ 		if (real___fxstat64(_STAT_VER, fd, &buf) != -1) {
+ 			if (!existed) {
++				int path_lock_fd = pseudo_client_path_lock(0);
+ 				real_fchmod(fd, PSEUDO_FS_MODE(0666 & ~pseudo_umask, 0));
+-				pseudo_client_op(OP_CREAT, 0, -1, -1, path, &buf);
++				if (pseudo_client_path_matches_fd(path, fd, 0))
++					pseudo_client_op(OP_CREAT, 0, -1, -1, path, &buf);
++				pseudo_client_path_unlock(path_lock_fd);
+ 			}
+ 			pseudo_client_op(OP_OPEN, pseudo_access_fopen(mode), fd, -1, path, &buf);
+ 		} else {
+diff --git a/ports/linux/guts/freopen64.c b/ports/linux/guts/freopen64.c
+index 5fc9073..6057eda 100644
+--- a/ports/linux/guts/freopen64.c
++++ b/ports/linux/guts/freopen64.c
+@@ -21,8 +21,11 @@
+ 		pseudo_debug(PDBGF_FILE, "freopen64 '%s': fd %d\n", path, fd);
+ 		if (real___fxstat64(_STAT_VER, fd, &buf) != -1) {
+ 			if (!existed) {
++				int path_lock_fd = pseudo_client_path_lock(0);
+ 				real_fchmod(fd, PSEUDO_FS_MODE(0666 & ~pseudo_umask, 0));
+-				pseudo_client_op(OP_CREAT, 0, -1, -1, path, &buf);
++				if (pseudo_client_path_matches_fd(path, fd, 0))
++					pseudo_client_op(OP_CREAT, 0, -1, -1, path, &buf);
++				pseudo_client_path_unlock(path_lock_fd);
+ 			}
+ 			pseudo_client_op(OP_OPEN, pseudo_access_fopen(mode), fd, -1, path, &buf);
+ 		} else {
+diff --git a/ports/linux/guts/openat.c b/ports/linux/guts/openat.c
+index 656ac2b..13bd395 100644
+--- a/ports/linux/guts/openat.c
++++ b/ports/linux/guts/openat.c
+@@ -148,9 +148,15 @@
+ 		if (stat_rc != -1) {
+ 			buf.st_mode = PSEUDO_DB_MODE(buf.st_mode, mode);
+ 			if (!existed) {
++				int path_lock_fd = pseudo_client_path_lock(0);
+ 				real_fchmod(rc, PSEUDO_FS_MODE(mode, 0));
+ 				// file has no path, but has been created
+-				pseudo_client_op(OP_CREAT, 0, -1, dirfd, path, &buf);
++				if (pseudo_client_path_matches_fd(path, rc, flags & O_NOFOLLOW) &&
++				    real___fxstat64(_STAT_VER, rc, &buf) != -1) {
++					buf.st_mode = PSEUDO_DB_MODE(buf.st_mode, mode);
++					pseudo_client_op(OP_CREAT, 0, -1, dirfd, path, &buf);
++				}
++				pseudo_client_path_unlock(path_lock_fd);
+ 			}
+ 				pseudo_client_op(OP_OPEN, PSEUDO_ACCESS(flags), rc, dirfd, path, &buf);
+ 		} else {
+diff --git a/ports/linux/openat2/guts/openat2.c b/ports/linux/openat2/guts/openat2.c
+index a0acbe7..687029a 100644
+--- a/ports/linux/openat2/guts/openat2.c
++++ b/ports/linux/openat2/guts/openat2.c
+@@ -183,9 +183,15 @@
+ 		if (stat_rc != -1) {
+ 			buf.st_mode = PSEUDO_DB_MODE(buf.st_mode, my_how.mode);
+ 			if (!existed) {
++				int path_lock_fd = pseudo_client_path_lock(0);
+ 				real_fchmod(rc, PSEUDO_FS_MODE(my_how.mode, 0));
+ 				// file has no path, but has been created
+-				pseudo_client_op(OP_CREAT, 0, -1, dirfd, pseudo_path, &buf);
++				if (pseudo_client_path_matches_fd(pseudo_path, rc, my_how.flags & O_NOFOLLOW) &&
++				    real___fxstat64(_STAT_VER, rc, &buf) != -1) {
++					buf.st_mode = PSEUDO_DB_MODE(buf.st_mode, my_how.mode);
++					pseudo_client_op(OP_CREAT, 0, -1, dirfd, pseudo_path, &buf);
++				}
++				pseudo_client_path_unlock(path_lock_fd);
+ 			}
+ 				pseudo_client_op(OP_OPEN, PSEUDO_ACCESS(my_how.flags), rc, dirfd, pseudo_path, &buf);
+ 		} else {
+diff --git a/ports/unix/guts/fopen.c b/ports/unix/guts/fopen.c
+index 26a6abc..78388f7 100644
+--- a/ports/unix/guts/fopen.c
++++ b/ports/unix/guts/fopen.c
+@@ -21,8 +21,11 @@
+ 		pseudo_debug(PDBGF_OP, "fopen '%s': fd %d <FILE %p>\n", path, fd, (void *) rc);
+ 		if (base_fstat(fd, &buf) != -1) {
+ 			if (!existed) {
++				int path_lock_fd = pseudo_client_path_lock(0);
+ 				real_fchmod(fd, PSEUDO_FS_MODE(0666 & ~pseudo_umask, 0));
+-				pseudo_client_op(OP_CREAT, 0, -1, -1, path, &buf);
++				if (pseudo_client_path_matches_fd(path, fd, 0))
++					pseudo_client_op(OP_CREAT, 0, -1, -1, path, &buf);
++				pseudo_client_path_unlock(path_lock_fd);
+ 			}
+ 			pseudo_client_op(OP_OPEN, pseudo_access_fopen(mode), fd, -1, path, &buf);
+ 		} else {
+diff --git a/ports/unix/guts/freopen.c b/ports/unix/guts/freopen.c
+index 703b6aa..5d63c9f 100644
+--- a/ports/unix/guts/freopen.c
++++ b/ports/unix/guts/freopen.c
+@@ -21,8 +21,11 @@
+ 		pseudo_debug(PDBGF_OP, "freopen '%s': fd %d\n", path, fd);
+ 		if (base_fstat(fd, &buf) != -1) {
+ 			if (!existed) {
++				int path_lock_fd = pseudo_client_path_lock(0);
+ 				real_fchmod(fd, PSEUDO_FS_MODE(0666 & ~pseudo_umask, 0));
+-				pseudo_client_op(OP_CREAT, 0, -1, -1, path, &buf);
++				if (pseudo_client_path_matches_fd(path, fd, 0))
++					pseudo_client_op(OP_CREAT, 0, -1, -1, path, &buf);
++				pseudo_client_path_unlock(path_lock_fd);
+ 			}
+ 			pseudo_client_op(OP_OPEN, pseudo_access_fopen(mode), fd, -1, path, &buf);
+ 		} else {
+diff --git a/pseudo_client.c b/pseudo_client.c
+index 759afeb..fe99aa6 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -1249,6 +1249,31 @@ pseudo_client_path_unlock(int fd) {
+ 	errno = save_errno;
+ }
+ 
++/* Operations that can block, such as open() on a FIFO, can't hold the path
++ * lock across the real call.  Instead they take the lock afterwards and
++ * check that the path still names the file they opened before recording
++ * it.  With the lock held, no other client is part way through changing the
++ * path, so if it now names a different file, that client has already
++ * recorded the change, and recording ours would be wrong.
++ */
++int
++pseudo_client_path_matches_fd(const char *path, int fd, int nofollow) {
++	PSEUDO_STATBUF pbuf, fbuf;
++	int save_errno = errno;
++	int rc;
++
++	if (!path || fd < 0 || !pseudo_real_fstat || !pseudo_real_lstat || !pseudo_real_stat)
++		return 1;
++	rc = pseudo_real_fstat(fd, &fbuf) == 0 &&
++	     (nofollow ? pseudo_real_lstat(path, &pbuf) : pseudo_real_stat(path, &pbuf)) == 0 &&
++	     pbuf.st_dev == fbuf.st_dev && pbuf.st_ino == fbuf.st_ino;
++	if (!rc)
++		pseudo_debug(PDBGF_FILE, "'%s' no longer names fd %d, not recording it.\n",
++			path, fd);
++	errno = save_errno;
++	return rc;
++}
++
+ static int
+ client_connect(void) {
+ 	/* we have a server pid, is it responsive? */
+diff --git a/pseudo_client.h b/pseudo_client.h
+index 217981d..77fe2ff 100644
+--- a/pseudo_client.h
++++ b/pseudo_client.h
+@@ -30,6 +30,7 @@ extern int pseudo_client_shutdown(int);
+ extern int pseudo_fd(int fd, int how);
+ extern int pseudo_client_path_lock(int shared);
+ extern void pseudo_client_path_unlock(int fd);
++extern int pseudo_client_path_matches_fd(const char *path, int fd, int nofollow);
+ #define MOVE_FD	0
+ #define COPY_FD	1
+ #define PSEUDO_MIN_FD	20
+@@ -53,6 +54,8 @@ extern FILE *pseudo_grp;
+ 
+ /* pseudo_wrappers will try to initialize these */
+ extern int (*pseudo_real_lstat)(const char *path, PSEUDO_STATBUF *buf);
++extern int (*pseudo_real_fstat)(int fd, PSEUDO_STATBUF *buf);
++extern int (*pseudo_real_stat)(const char *path, PSEUDO_STATBUF *buf);
+ extern int (*pseudo_real_fork)(void);
+ extern int (*pseudo_real_execv)(const char *, char * const *);
+ 
+diff --git a/pseudo_util.c b/pseudo_util.c
+index b8afe34..0267585 100644
+--- a/pseudo_util.c
++++ b/pseudo_util.c
+@@ -97,6 +97,8 @@ static int pseudo_util_initted = -1;  /* Not yet run */
+ 
+ /* bypass wrapper logic on path computations */
+ int (*pseudo_real_lstat)(const char *path, PSEUDO_STATBUF *buf) = NULL;
++int (*pseudo_real_fstat)(int fd, PSEUDO_STATBUF *buf) = NULL;
++int (*pseudo_real_stat)(const char *path, PSEUDO_STATBUF *buf) = NULL;
+ /* bash workaround */
+ int (*pseudo_real_unsetenv)(const char *) = unsetenv;
+ char * (*pseudo_real_getenv)(const char *) = getenv;
+diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
+index e54dad5..94f4260 100644
+--- a/pseudo_wrappers.c
++++ b/pseudo_wrappers.c
+@@ -177,6 +177,8 @@ pseudo_init_wrappers(void) {
+ 	pseudo_real_fsetxattr = real_fsetxattr;
+ #endif
+ 	pseudo_real_lstat = base_lstat;
++	pseudo_real_fstat = base_fstat;
++	pseudo_real_stat = base_stat;
+ 	/* and these are used so the client's server spawn can bypass
+ 	 * wrappers.
+ 	 */
diff --git a/meta/recipes-devtools/pseudo/files/0008-test-parallel-ops-Add-a-parallel-create-rename-link-.patch b/meta/recipes-devtools/pseudo/files/0008-test-parallel-ops-Add-a-parallel-create-rename-link-.patch
new file mode 100644
index 0000000000..752a2283d4
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0008-test-parallel-ops-Add-a-parallel-create-rename-link-.patch
@@ -0,0 +1,87 @@
+From ad74f92191757254172af8ae39549b256b880321 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Wed, 11 Nov 2026 10:15:10 -0600
+Subject: [PATCH] test-parallel-ops: Add a parallel create/rename/link/chmod
+ test
+
+From: Mark Hatle <mark.hatle@amd.com>
+
+Four workers repeatedly create, rename onto, chmod, chown, symlink,
+hard link and remove the same names in one directory.  The test fails
+if any of the operations fail, or if the server logged an inode or path
+mismatch while it ran.
+
+Without the path lock in the create, metadata and open wrappers, the
+server reports mismatches and occasionally aborts a client.
+
+(cherry picked from commit 7f582310cb7eb67da9b20ceb3082331518f6d4fb)
+
+Upstream-Status: Pending [patches under test, https://lore.kernel.org/all/1794413712-18072-2-git-send-email-mark.hatle@kernel.crashing.org/]
+AI-Generated: Uses GitHub Copilot
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ test/test-parallel-ops.sh | 53 +++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 53 insertions(+)
+ create mode 100755 test/test-parallel-ops.sh
+
+diff --git a/test/test-parallel-ops.sh b/test/test-parallel-ops.sh
+new file mode 100755
+index 0000000..2fccd30
+--- /dev/null
++++ b/test/test-parallel-ops.sh
+@@ -0,0 +1,53 @@
++#!/bin/bash
++#
++# SPDX-License-Identifier: LGPL-2.1-only
++#
++# Several clients create, rename, link, chmod and remove the same names in
++# one directory at once.  pseudo must not let one client's operation land in
++# the middle of another client's change to the same name, or the server
++# finds the database out of step with the filesystem.  It then logs an
++# "inode mismatch" or "path mismatch" error, and may abort a client.
++#
++# The temporary tree has to live below $PWD so that pseudo tracks it.
++
++tmpdir="$(mktemp -d -p "$PWD" parallel_ops_XXXXXX)"
++trap "rm -rf '$tmpdir'" EXIT TERM INT
++
++log="${PSEUDO_LOCALSTATEDIR:-$PWD/var/pseudo}/pseudo.log"
++mismatches() {
++    grep -c "mismatch" "$log" 2>/dev/null || true
++}
++before=$(mismatches)
++
++cd "$tmpdir" || exit 1
++: > target
++
++worker() {
++    for i in $(seq 50); do
++        echo "$1 $i" > "tmp.$1"            || echo "FAILED: create tmp.$1" >> failed
++        mv -f "tmp.$1" target              || echo "FAILED: mv tmp.$1 target" >> failed
++        chmod 640 target 2>/dev/null
++        chown 0:0 target 2>/dev/null
++        ln -sf target lnk                  || echo "FAILED: ln -sf target lnk" >> failed
++        mkdir dir 2>/dev/null; rmdir dir 2>/dev/null
++        mkfifo "f.$1" && mv -f "f.$1" fifo || echo "FAILED: mkfifo/mv f.$1" >> failed
++        ln -f target "hard.$1" 2>/dev/null && rm -f "hard.$1"
++    done
++}
++
++for w in 1 2 3 4; do
++    worker $w &
++done
++wait
++
++rc=0
++if [ -e failed ]; then
++    sort failed | uniq -c
++    rc=1
++fi
++after=$(mismatches)
++if [ "${after:-0}" -ne "${before:-0}" ]; then
++    echo "FAILED: $((after - before)) mismatch error(s) in $log"
++    rc=1
++fi
++exit $rc
diff --git a/meta/recipes-devtools/pseudo/files/0009-README.security-Add-information-specific-to-file-pro.patch b/meta/recipes-devtools/pseudo/files/0009-README.security-Add-information-specific-to-file-pro.patch
new file mode 100644
index 0000000000..9ec387f631
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0009-README.security-Add-information-specific-to-file-pro.patch
@@ -0,0 +1,216 @@
+From 3863f5d291743306efa6acc62dd43a26ba2ff2f5 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Wed, 11 Nov 2026 10:15:11 -0600
+Subject: [PATCH] README.security: Add information specific to file/process
+ security
+
+From: Mark Hatle <mark.hatle@amd.com>
+
+As noted in the README.security file, pseudo is not intended for
+secure computing, but to assist in build system workflows.
+
+During review the recent rewrite_proc_fd_ref it was noted that
+the way pseudo is working may be counter to the way selinux and
+similar tools are expecting the system to behave.  This behavior
+change is acceptable for the build environment workflow, but
+is not acceptable to a running/server workflow.
+
+See the README.security file for more details.
+
+AI-Generated: Used GitHub Copilot to assist in writing the file
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+(cherry picked from commit 019e93e03f7bb4fe2bacf3658f7dd6bf0d23fb65)
+
+Changes from the cherry-picked version, to match this branch:
+
+Section 1: mention DYLD_INSERT_LIBRARIES, as this branch still has the
+Darwin port, and note that the port is known not to work and is
+unlikely to be useful (see b550fd3, which removes it on master).
+
+Section 3: drop the /proc/self/fd/<n> and /dev/fd/<n> item, as
+rewrite_proc_fd_ref() (fcd8a81) is not on this branch.  fchmodat calls
+the real fchmodat(), not chmod, and mknodat is implemented by
+ports/linux/guts/__xmknodat.c, as the Linux guts override ports/unix;
+both corrections were made upstream in 81d4150 and dd69ed1.
+
+Upstream-Status: Pending [patches under test, https://lore.kernel.org/all/1794413712-18072-2-git-send-email-mark.hatle@kernel.crashing.org/]
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ README          |   3 +
+ README.security | 152 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 155 insertions(+)
+ create mode 100644 README.security
+
+diff --git a/README b/README
+index 039f960..e4fb5ec 100644
+--- a/README
++++ b/README
+@@ -11,6 +11,9 @@ environment, allowing ordinary users to run commands which give the illusion
+ of creating device nodes, changing file ownership, and otherwise doing
+ things necessary for creating distribution packages or filesystems.
+ 
++pseudo is not a security boundary and must not be used in security
++sensitive applications.  See README.security for details.
++
+ Building pseudo requires GCC 5 or later (or clang), which the configure
+ script checks for.
+ 
+diff --git a/README.security b/README.security
+new file mode 100644
+index 0000000..2cb124f
+--- /dev/null
++++ b/README.security
+@@ -0,0 +1,152 @@
++pseudo -- security considerations
++
++SUMMARY:
++
++pseudo is a build tool.  It exists so that ordinary users can produce
++packages and filesystem images containing files that appear to be owned
++by root, device nodes, special permissions and extended attributes.
++
++pseudo is NOT a security boundary and must not be used in security
++sensitive applications.  In particular, do not use pseudo:
++
++* to contain, confine or sandbox untrusted programs;
++* as a substitute for real privileges, a real chroot, a container or a
++  virtual machine;
++* to process filesystem trees that untrusted or concurrent processes can
++  modify while pseudo is running;
++* as the only guarantee that the ownership, permissions, SELinux labels
++  or file capabilities in a security critical image are correct.
++
++
++1. INTERCEPTION IS COOPERATIVE
++
++pseudo works by loading libpseudo with LD_PRELOAD (DYLD_INSERT_LIBRARIES
++on Darwin) and wrapping libc functions.  Anything that does not go
++through those wrappers reaches the real filesystem directly, with the
++real privileges of the user who started pseudo.  This includes:
++
++* statically linked programs;
++* programs that make system calls directly, including language runtimes
++  that do not use libc for file operations, and interfaces such as
++  io_uring;
++* setuid/setgid programs, for which the dynamic linker ignores
++  LD_PRELOAD;
++* any program that clears LD_PRELOAD, or that sets PSEUDO_UNLOAD or
++  PSEUDO_DISABLED (see pseudo_client.c), both of which are deliberately
++  supported ways to turn pseudo off.
++
++A program running under pseudo can therefore always step outside of it.
++pseudo cannot be used to restrict what a program does.
++
++The Darwin port is described as implemented, but it has not worked for
++a long time: System Integrity Protection and the hardened runtime block
++DYLD_INSERT_LIBRARIES, so it is unlikely to be useful.
++
++
++2. "ROOT" EXISTS ONLY IN THE DATABASE
++
++pseudo grants no privileges.  Files on disk remain owned by the real
++user, and the ownership and modes that programs see under pseudo are
++read back from pseudo's database.  The kernel does not enforce any of
++the emulated ownership or permissions.
++
++The real on-disk modes are also deliberately different from the
++emulated ones.  PSEUDO_FS_MODE (pseudo_client.h) always adds owner read
++and write permission (and owner execute for directories) so that the
++emulated root can access everything, and removes group/other write,
++setuid and setgid bits from the real file.  A file that is meant to be
++mode 0600 or 0000 and owned by root, for example /etc/shadow or a
++private key, is readable and writable on disk by the build user and by
++any process running as that user, whether or not it is under pseudo.
++
++Treat everything pseudo writes as accessible to the build user.
++
++
++3. FILE DESCRIPTORS BECOME PATHS (TOCTOU)
++
++Many security sensitive programs rely on the kernel resolving a file
++descriptor, or a path relative to a directory descriptor, to a specific
++inode.  This is how they avoid races where a path component is replaced
++with a symlink between checking a file and using it.  pseudo removes
++that protection in several ways:
++
++* Paths are canonicalized in user space.  pseudo_fix_path()
++  (pseudo_util.c) walks each path component with lstat() and readlink()
++  and builds an absolute path, and the real function is then called
++  with that absolute path (see doc/chroot).  A call such as
++  openat(dirfd, "file", ...) is no longer anchored to dirfd; it becomes
++  an operation on "<recorded path of dirfd>/file".  Kernel guarantees
++  such as O_NOFOLLOW on intermediate components or RESOLVE_BENEATH are
++  not reproduced by this resolution, except in the few wrappers marked
++  preserve_paths in wrapfuncs.in, which handle paths themselves.
++
++* The path pseudo recorded for a descriptor (fd_path() in
++  pseudo_client.c) is used to resolve paths relative to it.  That
++  record can be stale: the file or directory may have been renamed, or
++  the descriptor may have been inherited, received over a socket, or
++  opened by a call pseudo did not see.
++
++* Several wrappers check a path and then act on it by path in a second
++  step.  For example, fchmodat (ports/unix/guts/fchmodat.c) stats the
++  path and later calls the real fchmodat() on the same path, and mknodat
++  (ports/linux/guts/__xmknodat.c) removes the path again by name if the
++  database update fails.
++
++If anything else can change the tree while pseudo is working on it, an
++operation may be applied to a different file than the one that was
++checked, both in pseudo's database and on the real filesystem.  Only
++run pseudo on trees that are fully under the control of the build.
++
++
++4. THE CHROOT IS EMULATED
++
++pseudo's chroot() support only prepends a stored prefix to absolute
++paths and strips it from some results (see doc/chroot).  No real
++chroot() is performed, and the README notes the support is incomplete.
++Any of the bypasses in section 1, or any path pseudo resolves
++differently from the kernel, reaches the host filesystem.  pseudo's
++chroot must not be relied on to keep a program inside a directory.
++
++
++5. METADATA LIVES IN A DATABASE THAT CAN DRIFT
++
++Emulated ownership, modes, device nodes and extended attributes,
++including security.selinux and security.capability, exist only in
++pseudo's database until a packaging or image step copies them out.
++Entries are keyed by path and inode number.  When files are changed
++outside of pseudo, for example deleted or recreated without pseudo
++loaded, an inode number can be reused and the database can attach the
++old file's ownership, mode or attributes to a new file.  The server
++reports such cases as "inode mismatch" or "path mismatch" (pseudo.c),
++but cannot always know which side is correct.
++
++Accesses to paths listed in PSEUDO_IGNORE_PATHS are deliberately not
++tracked at all.
++
++Generated images should be verified independently if their ownership,
++permissions, labels or capabilities matter for security.  Do not
++ignore mismatch errors in pseudo's log.
++
++
++6. THE SERVER TRUSTS ITS CLIENTS
++
++The pseudo server listens on a Unix socket in its local state directory
++and does not authenticate clients beyond the filesystem permissions of
++that socket.  Any process running as the build user can connect and
++change the database, and the database files themselves are writable by
++that user.  The resulting metadata can only be trusted as much as every
++process running as the build user.
++
++
++RECOMMENDATIONS:
++
++* Run pseudo only on build output that is private to the build and is
++  not modified concurrently by anything outside of it.
++* Run untrusted build steps under a real isolation mechanism (a
++  container, a virtual machine, or a dedicated user), with pseudo inside
++  it if needed, never pseudo alone.
++* Do not store secrets in a pseudo-managed tree on a shared system;
++  they are readable by the build user regardless of their emulated
++  ownership and mode.
++* Verify the ownership, permissions, labels and capabilities of
++  security relevant files in the final image.
diff --git a/meta/recipes-devtools/pseudo/files/0010-AGENTS.md-Add-to-assist-future-developers.patch b/meta/recipes-devtools/pseudo/files/0010-AGENTS.md-Add-to-assist-future-developers.patch
new file mode 100644
index 0000000000..62bbab1464
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0010-AGENTS.md-Add-to-assist-future-developers.patch
@@ -0,0 +1,113 @@
+From 56e1fc69be92cefc58d6d9829069776b53f86470 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Wed, 11 Nov 2026 10:15:12 -0600
+Subject: [PATCH] AGENTS.md: Add to assist future developers
+
+From: Mark Hatle <mark.hatle@amd.com>
+
+Based partially off of the Yocto Project standards, this is my attempt
+at documenting the configuration I use with agents during maintainer
+and development activities.
+
+(cherry picked from commit fe4e4f0d920d587f0ded3c044255ee27269d2646)
+
+Upstream-Status: Pending [patches under test, https://lore.kernel.org/all/1794413712-18072-2-git-send-email-mark.hatle@kernel.crashing.org/]
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ AGENTS.md | 85 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 85 insertions(+)
+ create mode 100644 AGENTS.md
+
+diff --git a/AGENTS.md b/AGENTS.md
+new file mode 100644
+index 0000000..c0d041a
+--- /dev/null
++++ b/AGENTS.md
+@@ -0,0 +1,85 @@
++# AGENTS.md — pseudo
++
++Guidance for AI agents working in the `pseudo` repository.
++
++## Making changes
++
++- No web PR workflow. The project uses **patches on mailing lists**
++  (yocto-patches@lists.yoctoproject.org). Don't assume GitHub PR
++  conventions apply. Subject on the mailing list must include
++  '[pseudo]'.
++- One Git commit per logical change (e.g., one commit per fix, refactor or new test).
++- Split unrelated changes, even small ones found along the way: a bug
++  noticed during a refactor gets its own commit.
++- Keep every commit building cleanly, with tests passing, so the series
++  bisects.  Put a new test after the fix it checks.
++- Commit message format:
++  - Summary line prefixed with the component or short file path,
++    e.g. `pseudo_util: Remove stale with_libpseudo() comment`.
++    Check `git log --oneline <path>` for the prefix convention already in use.
++  - Body explains what/why/how, and how it was tested.
++  - Prefer explaining *why* a change was made over restating what's
++    already visible in the diff, unless the diff is long/hard to follow
++    or the reason for the change isn't known — in those cases, summarize
++    what changed instead.
++  - Be succinct: use as few sentences and lines as possible while still
++    covering what/why/how. Cut restatements, filler, and any detail a
++    reviewer wouldn't need (e.g. exact test-run counts, step-by-step
++    narration). One short paragraph is usually enough; only add a second
++    if a distinct point (e.g. testing) needs it.
++  - The most relevant information about the change should be presented first.
++  - Reference bugs as `[YOCTO #1234]` when applicable.
++  - Use `Reported-by`, `Suggested-by`, `Tested-by`, `Reviewed-by`, `Cc` tags
++    where relevant.
++
++### AI-generated code
++
++- **Mandatory**: any AI-generated code/commit must add an `AI-Generated:`
++  tag line in the commit message, placed *before* `Signed-off-by` (if present),
++  naming the tool used, e.g.:
++
++  ```
++  component: Add the ability to ...
++
++  AI-Generated: Uses GitHub Copilot
++  ```
++
++- **Mandatory** Do not automatically add a `Signed-off-by`. This tag must
++  always be written by the human contributor, never by the AI tool — the
++  DCO/Developer's Statement of Origin still applies in full.
++- Contributor is responsible for confirming the AI tool's terms don't
++  conflict with the project's open source license/IP policy, and that
++  any third-party copyrighted material in the AI output is properly
++  licensed before contributing it. See the Linux Foundation generative AI
++  guidance: https://www.linuxfoundation.org/legal/generative-ai.
++- `Co-authored-by` should be omitted in favor of the `AI-Generated` tag.
++  Don't add other tool-specific trailers either (e.g. `Copilot-Session`).
++
++## Building and testing
++
++- Configure and build: `./configure --prefix=$(pwd)/test && make`
++- Full test suite: `make test-verbose` (or `make test`).  Single tests:
++  `./run_tests.sh -v test-name`.
++- Tests are `test/test-*.sh`, with optional `test/test-*.c` programs that
++  the Makefile builds automatically.  A script exits 0 to pass and 255 to
++  report a skip; C helpers conventionally exit 77 for "not supported"
++  (for example ENOSYS), which the script maps to 255.  Create temporary
++  trees below $PWD so pseudo tracks them.
++- Changes to the server, locking or path handling: also run the
++  test-parallel-* tests several times, as they are timing dependent.
++
++## Code layout
++
++- Wrappers are generated by `makewrappers` from `ports/*/wrapfuncs.in`,
++  `templates/` and the guts in `ports/*/guts/`.  Don't edit the generated
++  files (pseudo_wrapfuncs.*, pseudo_wrapper_table.c, pseudo_ports.h,
++  port_wrappers.c).
++- Linux is the only port.  Put port-specific definitions in
++  `ports/<port>/portdefs.h`.  Where shared code needs something only one
++  port provides, fail with `#error` for other ports rather than silently
++  falling back.
++- Keep pseudo.1 and README.security in step with behaviour changes:
++  options, environment variables, diagnostics, security model.
++
++When in doubt about a convention, grep `git log --oneline <path>` in the
++target repo for precedent before inventing a new style.
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 764f81b683..82f1f946b8 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -3,6 +3,16 @@ require pseudo.inc
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=pseudo-1.9;protocol=https \
            file://fallback-passwd \
            file://fallback-group \
+           file://0001-test-Skip-open_tree-tests-when-the-function-or-sysca.patch \
+           file://0002-makewrappers-Don-t-generate-unused-_int-paths-with-n.patch \
+           file://0003-ports-linux-Don-t-require-linux-mount.h.patch \
+           file://0004-configure-Require-GCC-5-or-later.patch \
+           file://0005-pseudo_client-serialize-path-changes-across-clients.patch \
+           file://0006-ports-hold-the-path-lock-in-create-and-metadata-wrap.patch \
+           file://0007-ports-check-created-files-under-the-path-lock-before.patch \
+           file://0008-test-parallel-ops-Add-a-parallel-create-rename-link-.patch \
+           file://0009-README.security-Add-information-specific-to-file-pro.patch \
+           file://0010-AGENTS.md-Add-to-assist-future-developers.patch \
            "
 SRC_URI:append:class-native = " \
     http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=git/prebuilt;name=prebuilt \
