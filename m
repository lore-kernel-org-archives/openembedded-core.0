Return-Path: <george.mccollister@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id D33ED7C860
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 16:38:08 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id x11so521242ybx.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 08:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CbtLL5ABg7eiuCsppOrh/hbxDxoBdDIFT5UPynztgHc=;
	b=IJdQWZ+EMT2L4sgduZNJRbaDafSE1Lq32wTmWgFZ/p117fRpwqZxkVNpOGuLhSgBSd
	QZsJQ3CGgr5iGVbtYcTqBJIyQgyxuu1IRT0Ams58X7sQHiuI6+IDBsyfDGkhK1mc2iSR
	iWesW8OgV3TzD9cD6VN2tYhICO3LOIgHINUVLox1FTK5E9URFA7WJDFCkSxmQ0f8Zc8+
	pfDIhQQaGA9ZJ3XzSX6VPj7qv4vnkIMpRuIFOZd49ym9fQ26PSCy0CH7LtD0wzB0iHl/
	KtVDQHKkceyUZHAzCq+PJ8w9oQ5Es8q+qjFibYZqzFhx3yNEwYdDYY2YGn8g9+kKXEKM
	w6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CbtLL5ABg7eiuCsppOrh/hbxDxoBdDIFT5UPynztgHc=;
	b=cB5aPFBDTIFXWCek0TvrgPFIgHiAMyt2x6oDR41EuuNbvEZnT1fVI3M80ZH5v1O9El
	wivOY3atHx/VDWZahDGNVZu/OJM6Lp8PviAvVrNlQKCcuD7REzOpjziUs9HLMYHtMJzy
	hWOBn5wIgZqQ0cGqapmpONS8shUJSOlr4yFcGfWSbtkbFBd4AJ9Yzch/t6+RXtibLvjW
	g3VpIxZQIKeWoV3bN2OQh2XeYnAEnhbqohfoLttJSSPkyoYnD7Jau+7NVkegj4ikX7C0
	4CO+F/sOI6phOR1eBs91pQE40DESXClxU7D8eaXBrilhijgf+ZWXAz8Ul8NAgWcnwVFJ
	IJMA==
X-Gm-Message-State: AHQUAuafInxiC8WeT49r0ekVeuOHcwY3WNlEIqOWk6Votkf2tmPT7apB
	VQxYRdhu9zhW5xB+1yDavePmvEU=
X-Google-Smtp-Source: AHgI3IZEgYWOr9mt0HxWUeV8Vg91hSYOiafC25ezrBAHH8Rogqwg/tsozutiPUyWTGsIEE9dOwwHJQ==
X-Received: by 2002:a25:c087:: with SMTP id
	c129mr15233051ybf.320.1551112689078; 
	Mon, 25 Feb 2019 08:38:09 -0800 (PST)
Received: from threadripper.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	z23sm6293654ywj.36.2019.02.25.08.38.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 08:38:08 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 10:37:07 -0600
Message-Id: <4d3ee6ea57bb323092ace36f255dca964496e494.1551111341.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1551111341.git.george.mccollister@gmail.com>
References: <cover.1551111341.git.george.mccollister@gmail.com>
Subject: [sumo][PATCH 2/8] systemd: fix CVE-2018-15687
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2019 16:38:09 -0000

Backport patch to fix the following CVE.

CVE: CVE-2018-15687

Based on thud commit eeb621aa19f690971caf862290a172a115578ba1
The patch in the thud commit doesn't compile against 237. Use the
version of this patch,  CVE-2018-15687.patch from
systemd_237-3ubuntu10.13.debian.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 ...sive-let-s-rework-the-recursive-logic-to-.patch | 252 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb           |   1 +
 2 files changed, 253 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch b/meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
new file mode 100644
index 0000000000..9a0b55f97d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
@@ -0,0 +1,252 @@
+From 2da8ba3f507345d0401ea9d7191fa16ffa560ebc Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 19 Oct 2018 11:26:59 +0200
+Subject: [PATCH] chown-recursive: let's rework the recursive logic to use
+ O_PATH
+
+That way we can pin a specific inode and analyze it and manipulate it
+without it being swapped out beneath our hands.
+
+Fixes a vulnerability originally found by Jann Horn from Google.
+
+CVE-2018-15687
+LP: #1796692
+https://bugzilla.redhat.com/show_bug.cgi?id=1639076
+
+Origin: upstream, https://github.com/poettering/systemd/commit/5de6cce58b3e8b79239b6e83653459d91af6e57c
+Bug-Ubuntu: https://launchpad.net/bugs/1796692
+
+Patch for 237 from:
+systemd_237-3ubuntu10.13.debian CVE-2018-15687.patch
+
+CVE: CVE-2018-15687
+Upstream-Status: Backport
+
+---
+ src/core/chown-recursive.c | 146 ++++++++++++++++++++++-----------------------
+ 1 file changed, 70 insertions(+), 76 deletions(-)
+
+diff --git a/src/core/chown-recursive.c b/src/core/chown-recursive.c
+index c479450..27c6448 100644
+--- a/src/core/chown-recursive.c
++++ b/src/core/chown-recursive.c
+@@ -18,18 +18,20 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+
+-#include <sys/types.h>
+-#include <sys/stat.h>
+ #include <fcntl.h>
++#include <sys/stat.h>
++#include <sys/types.h>
+
+-#include "user-util.h"
+-#include "macro.h"
+-#include "fd-util.h"
+-#include "dirent-util.h"
+ #include "chown-recursive.h"
++#include "dirent-util.h"
++#include "fd-util.h"
++#include "macro.h"
++#include "stdio-util.h"
++#include "strv.h"
++#include "user-util.h"
+
+-static int chown_one(int fd, const char *name, const struct stat *st, uid_t uid, gid_t gid) {
+-        int r;
++static int chown_one(int fd, const struct stat *st, uid_t uid, gid_t gid) {
++        char procfs_path[STRLEN("/proc/self/fd/") + DECIMAL_STR_MAX(int) + 1];
+
+         assert(fd >= 0);
+         assert(st);
+@@ -38,90 +40,82 @@
+             (!gid_is_valid(gid) || st->st_gid == gid))
+                 return 0;
+
+-        if (name)
+-                r = fchownat(fd, name, uid, gid, AT_SYMLINK_NOFOLLOW);
+-        else
+-                r = fchown(fd, uid, gid);
+-        if (r < 0)
+-                return -errno;
++        /* We change ownership through the /proc/self/fd/%i path, so that we have a stable reference that works with
++         * O_PATH. (Note: fchown() and fchmod() do not work with O_PATH, the kernel refuses that. */
++        xsprintf(procfs_path, "/proc/self/fd/%i", fd);
+
+-        /* The linux kernel alters the mode in some cases of chown(). Let's undo this. */
+-        if (name) {
+-                if (!S_ISLNK(st->st_mode))
+-                        r = fchmodat(fd, name, st->st_mode, 0);
+-                else /* There's currently no AT_SYMLINK_NOFOLLOW for fchmodat() */
+-                        r = 0;
+-        } else
+-                r = fchmod(fd, st->st_mode);
+-        if (r < 0)
++        if (chown(procfs_path, uid, gid) < 0)
+                 return -errno;
+
++        /* The linux kernel alters the mode in some cases of chown(). Let's undo this. We do this only for non-symlinks
++         * however. That's because for symlinks the access mode is ignored anyway and because on some kernels/file
++         * systems trying to change the access mode will succeed but has no effect while on others it actively
++         * fails. */
++        if (!S_ISLNK(st->st_mode))
++                if (chmod(procfs_path, st->st_mode & 07777) < 0)
++                        return -errno;
++
+         return 1;
+ }
+
+ static int chown_recursive_internal(int fd, const struct stat *st, uid_t uid, gid_t gid) {
++        _cleanup_closedir_ DIR *d = NULL;
+         bool changed = false;
++        struct dirent *de;
+         int r;
+
+         assert(fd >= 0);
+         assert(st);
+
+-        if (S_ISDIR(st->st_mode)) {
+-                _cleanup_closedir_ DIR *d = NULL;
+-                struct dirent *de;
+-
+-                d = fdopendir(fd);
+-                if (!d) {
+-                        r = -errno;
+-                        goto finish;
+-                }
+-                fd = -1;
+-
+-                FOREACH_DIRENT_ALL(de, d, r = -errno; goto finish) {
+-                        struct stat fst;
+-
+-                        if (dot_or_dot_dot(de->d_name))
+-                                continue;
++        d = fdopendir(fd);
++        if (!d) {
++                safe_close(fd);
++                return -errno;
++        }
+
+-                        if (fstatat(dirfd(d), de->d_name, &fst, AT_SYMLINK_NOFOLLOW) < 0) {
+-                                r = -errno;
+-                                goto finish;
+-                        }
+-
+-                        if (S_ISDIR(fst.st_mode)) {
+-                                int subdir_fd;
+-
+-                                subdir_fd = openat(dirfd(d), de->d_name, O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
+-                                if (subdir_fd < 0) {
+-                                        r = -errno;
+-                                        goto finish;
+-                                }
+-
+-                                r = chown_recursive_internal(subdir_fd, &fst, uid, gid);
+-                                if (r < 0)
+-                                        goto finish;
+-                                if (r > 0)
+-                                        changed = true;
+-                        } else {
+-                                r = chown_one(dirfd(d), de->d_name, &fst, uid, gid);
+-                                if (r < 0)
+-                                        goto finish;
+-                                if (r > 0)
+-                                        changed = true;
+-                        }
++        FOREACH_DIRENT_ALL(de, d, return -errno) {
++                _cleanup_close_ int path_fd = -1;
++                struct stat fst;
++
++                if (dot_or_dot_dot(de->d_name))
++                        continue;
++
++                /* Let's pin the child inode we want to fix now with an O_PATH fd, so that it cannot be swapped out
++                 * while we manipulate it. */
++                path_fd = openat(dirfd(d), de->d_name, O_PATH|O_CLOEXEC|O_NOFOLLOW);
++                if (path_fd < 0)
++                        return -errno;
++
++                if (fstat(path_fd, &fst) < 0)
++                        return -errno;
++
++                if (S_ISDIR(fst.st_mode)) {
++                        int subdir_fd;
++
++                        /* Convert it to a "real" (i.e. non-O_PATH) fd now */
++                        subdir_fd = fd_reopen(path_fd, O_RDONLY|O_CLOEXEC|O_NOATIME);
++                        if (subdir_fd < 0)
++                                return subdir_fd;
++
++                        r = chown_recursive_internal(subdir_fd, &fst, uid, gid); /* takes possession of subdir_fd even on failure */
++                        if (r < 0)
++                                return r;
++                        if (r > 0)
++                                changed = true;
++                } else {
++                        r = chown_one(path_fd, &fst, uid, gid);
++                        if (r < 0)
++                                return r;
++                        if (r > 0)
++                                changed = true;
+                 }
++        }
+
+-                r = chown_one(dirfd(d), NULL, st, uid, gid);
+-        } else
+-                r = chown_one(fd, NULL, st, uid, gid);
++        r = chown_one(dirfd(d), st, uid, gid);
+         if (r < 0)
+-                goto finish;
+-
+-        r = r > 0 || changed;
++                return r;
+
+-finish:
+-        safe_close(fd);
+-        return r;
++        return r > 0 || changed;
+ }
+
+ int path_chown_recursive(const char *path, uid_t uid, gid_t gid) {
+@@ -129,7 +123,7 @@
+         struct stat st;
+         int r;
+
+-        fd = open(path, O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
++        fd = open(path, O_RDONLY|O_DIRECTORY|O_CLOEXEC|O_NOFOLLOW|O_NOATIME);
+         if (fd < 0)
+                 return -errno;
+
+--- a/src/basic/fd-util.c
++++ b/src/basic/fd-util.c
+@@ -578,3 +578,22 @@
+
+         return -EOPNOTSUPP;
+ }
++
++int fd_reopen(int fd, int flags) {
++        char procfs_path[STRLEN("/proc/self/fd/") + DECIMAL_STR_MAX(int)];
++        int new_fd;
++
++        /* Reopens the specified fd with new flags. This is useful for convert an O_PATH fd into a regular one, or to
++         * turn O_RDWR fds into O_RDONLY fds.
++         *
++         * This doesn't work on sockets (since they cannot be open()ed, ever).
++         *
++         * This implicitly resets the file read index to 0. */
++
++        xsprintf(procfs_path, "/proc/self/fd/%i", fd);
++        new_fd = open(procfs_path, flags);
++        if (new_fd < 0)
++                return -errno;
++
++        return new_fd;
++}
+--- a/src/basic/fd-util.h
++++ b/src/basic/fd-util.h
+@@ -91,3 +91,5 @@
+ /* Hint: ENETUNREACH happens if we try to connect to "non-existing" special IP addresses, such as ::5 */
+ #define ERRNO_IS_DISCONNECT(r) \
+         IN_SET(r, ENOTCONN, ECONNRESET, ECONNREFUSED, ECONNABORTED, EPIPE, ENETUNREACH)
++
++int fd_reopen(int fd, int flags);
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 28f3dafbb5..cae9bccc60 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -55,6 +55,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
            file://0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
            file://0001-core-when-deserializing-state-always-use-read_line-L.patch \
+           file://0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.11.0


