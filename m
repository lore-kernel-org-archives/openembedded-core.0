Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 94E35788A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 04:18:26 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id l65-v6so9104447pgl.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 21:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z7jsqzweZ4y+EEPbfYEYsGcr25emZQsaOWRSR8NFDaM=;
	b=m4SZeBWuEi4Etpndd76/cJzQvw9tv9xirTqv/nLH0UjllD/K8UKHc8BhZTDC1DE9zh
	yQtYM81urs7KYOZlPM0pTnTYPNHkheEwlZuua9xHLQq3tsHFBbV7YggAlD81YuvdK9Zz
	kOVmSqiRYCrxrB6b2ZGMWy7JDq8fh4hlCSO87xlgv30mwQEqcqYj+hPwHW3naqgdRGBK
	8UVBotnM1anthNmU7R6Hc3J7ZZCoXB9TN9cAPHVX0uK40V1SkmMQtHb3cs3nrlEtPSUC
	xajIAArQu1uErarWH62gjAEFxfOPrAQ6bi9SZ6fU1mOa2DRnwTFVq3ihvRyGWeMzRVUE
	rdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z7jsqzweZ4y+EEPbfYEYsGcr25emZQsaOWRSR8NFDaM=;
	b=Bo20xijPYhoFa+mrno496fhBoYBH+J2Y1kM2MozLnE+SbRYjaJRyu8DgjexZZ0NgJ+
	gdfUyYo6bS9spTND0qaHzfBJTy3BiRUEpxfXcOH29OeFdnDphw0q9ZUkIB0iw+dikcbE
	RLtqDO4BaJ6Hl8f1D/3zJyUDKmsPxqE73ZNxienunuxkN/t5YLR0NBqYzYfqxtzuJR+t
	jU8goBaRu4ex65ECyf8OfuOULI4OBchaZb4cNEUoMY28L0X5koSitqxo6/9GzAGi0WNN
	T2y3BocRU4fR8Kz0KkZRFkzJ3tl7rgZWGql/dkJwIaRqGOQ8YWd01AM2t6UI2fEybmKM
	l7Gg==
X-Gm-Message-State: APt69E37WYUW/vSiDLir4atETGH8RN5nsWfRFbYSU6o+UL9Sa4YD9kwF
	7bHwZSVmS81xaNb/cqpluZCwlA==
X-Google-Smtp-Source: ADUXVKJTH1uQw+0Fg9MNgpmiZ0S/qB6Rzl4GRcp7aat+XAVfpwDL18HAzHSrdnmpvm9fx+VwABSPsw==
X-Received: by 2002:a63:951c:: with SMTP id
	p28-v6mr13319903pgd.318.1528690706757; 
	Sun, 10 Jun 2018 21:18:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:89d8:d09:3d9e:5389])
	by smtp.gmail.com with ESMTPSA id
	x2-v6sm133212577pfk.113.2018.06.10.21.18.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jun 2018 21:18:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 10 Jun 2018 21:18:24 -0700
Message-Id: <1528690704-338-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [v5][PATCH] busybox: update to 1.28.4
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
X-List-Received-Date: Mon, 11 Jun 2018 04:18:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

refactored busybox-udhcpc-no_deconfig.patch for this update
updated 1.28.3

[v1]
removed patches included in update:
busybox/CVE-2011-5325.patch
busybox/CVE-2017-15873.patch
busybox/busybox-CVE-2017-16544.patch

[v2]
Add back busybox-udhcpc-no_deconfig.patch ti SRC_URI, missed earlier

[v3]
Update defconfig based on feedback

[v4]
Decided to update again.
1.28.4

[v5]
rebased change do to changes in master
squashed .cfg into defconfig and remove files
Delete busybox-fix-lzma-segfaults.patch which is included in updated.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../busybox/busybox/CVE-2011-5325.patch            | 481 ---------------------
 .../busybox/busybox/CVE-2017-15873.patch           |  95 ----
 .../busybox/busybox/busybox-CVE-2017-16544.patch   |  43 --
 .../busybox/busybox-fix-lzma-segfaults.patch       | 106 -----
 .../busybox/busybox-udhcpc-no_deconfig.patch       |  36 +-
 meta/recipes-core/busybox/busybox/defconfig        | 278 ++++++------
 meta/recipes-core/busybox/busybox/getopts.cfg      |   3 -
 .../busybox/busybox/login-utilities.cfg            |  13 -
 meta/recipes-core/busybox/busybox/mdev.cfg         |   2 -
 .../busybox/busybox/mount-via-label.cfg            |   9 -
 meta/recipes-core/busybox/busybox/resize.cfg       |   2 -
 meta/recipes-core/busybox/busybox/sha1sum.cfg      |   1 -
 meta/recipes-core/busybox/busybox/sha256sum.cfg    |   1 -
 meta/recipes-core/busybox/busybox/syslog.cfg       |  11 -
 .../{busybox_1.27.2.bb => busybox_1.28.4.bb}       |  15 +-
 15 files changed, 162 insertions(+), 934 deletions(-)
 delete mode 100755 meta/recipes-core/busybox/busybox/CVE-2011-5325.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2017-15873.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-fix-lzma-segfaults.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/getopts.cfg
 delete mode 100644 meta/recipes-core/busybox/busybox/login-utilities.cfg
 delete mode 100644 meta/recipes-core/busybox/busybox/mount-via-label.cfg
 delete mode 100644 meta/recipes-core/busybox/busybox/resize.cfg
 delete mode 100644 meta/recipes-core/busybox/busybox/sha1sum.cfg
 delete mode 100644 meta/recipes-core/busybox/busybox/sha256sum.cfg
 delete mode 100644 meta/recipes-core/busybox/busybox/syslog.cfg
 rename meta/recipes-core/busybox/{busybox_1.27.2.bb => busybox_1.28.4.bb} (72%)

diff --git a/meta/recipes-core/busybox/busybox/CVE-2011-5325.patch b/meta/recipes-core/busybox/busybox/CVE-2011-5325.patch
deleted file mode 100755
index 0926107..0000000
--- a/meta/recipes-core/busybox/busybox/CVE-2011-5325.patch
+++ /dev/null
@@ -1,481 +0,0 @@
-busybox-1.27.2: Fix CVE-2011-5325
-
-[No upstream tracking] -- https://bugs.busybox.net/show_bug.cgi?id=8411
-
-libarchive: do not extract unsafe symlinks
-
-Prevent unsafe links extracting unless env variable $EXTRACT_UNSAFE_SYMLINKS=1
-is not set. Untarring file with -C DESTDIR parameter could be extracted with
-unwanted symlinks. This doesn't feel right, and IIRC GNU tar doesn't do that.
-Include necessary changes from previous commits.
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=bc9bbeb2b81001e8731cd2ae501c8fccc8d87cc7]
-CVE: CVE-2011-5325
-bug: 8411
-Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/archival/libarchive/Kbuild.src b/archival/libarchive/Kbuild.src
-index 942e755..e1a8a75 100644
---- a/archival/libarchive/Kbuild.src
-+++ b/archival/libarchive/Kbuild.src
-@@ -12,6 +12,8 @@ COMMON_FILES:= \
- 	data_extract_all.o \
- 	data_extract_to_stdout.o \
- \
-+	unsafe_symlink_target.o \
-+\
- 	filter_accept_all.o \
- 	filter_accept_list.o \
- 	filter_accept_reject_list.o \
-diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
-index 1830ffb..b828b65 100644
---- a/archival/libarchive/data_extract_all.c
-+++ b/archival/libarchive/data_extract_all.c
-@@ -128,10 +128,9 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
- 		res = link(hard_link, dst_name);
- 		if (res != 0 && !(archive_handle->ah_flags & ARCHIVE_EXTRACT_QUIET)) {
- 			/* shared message */
--			bb_perror_msg("can't create %slink "
--					"%s to %s", "hard",
--					dst_name,
--					hard_link);
-+			bb_perror_msg("can't create %slink '%s' to '%s'",
-+					 "hard", dst_name, hard_link
-+			);
- 		}
- 		/* Hardlinks have no separate mode/ownership, skip chown/chmod */
- 		goto ret;
-@@ -178,15 +177,17 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
- 	case S_IFLNK:
- 		/* Symlink */
- //TODO: what if file_header->link_target == NULL (say, corrupted tarball?)
--		res = symlink(file_header->link_target, dst_name);
--		if (res != 0
--		 && !(archive_handle->ah_flags & ARCHIVE_EXTRACT_QUIET)
--		) {
--			/* shared message */
--			bb_perror_msg("can't create %slink "
--				"%s to %s", "sym",
--				dst_name,
--				file_header->link_target);
-+		if (!unsafe_symlink_target(file_header->link_target)) {
-+			res = symlink(file_header->link_target, dst_name);
-+			if (res != 0
-+				&& !(archive_handle->ah_flags & ARCHIVE_EXTRACT_QUIET)
-+			) {
-+						/* shared message */
-+						bb_perror_msg("can't create %slink '%s' to '%s'",
-+							"sym",
-+							dst_name, file_header->link_target
-+						);
-+			}
- 		}
- 		break;
- 	case S_IFSOCK:
-diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/libarchive/unsafe_symlink_target.c
-new file mode 100644
-index 0000000..ee46e28
---- /dev/null
-+++ b/archival/libarchive/unsafe_symlink_target.c
-@@ -0,0 +1,48 @@
-+/* vi: set sw=4 ts=4: */
-+/*
-+ * Licensed under GPLv2 or later, see file LICENSE in this source tree.
-+ */
-+#include "libbb.h"
-+#include "bb_archive.h"
-+
-+int FAST_FUNC unsafe_symlink_target(const char *target)
-+{
-+	const char *dot;
-+
-+	if (target[0] == '/') {
-+		const char *var;
-+unsafe:
-+		var = getenv("EXTRACT_UNSAFE_SYMLINKS");
-+		if (var) {
-+			if (LONE_CHAR(var, '1'))
-+				return 0; /* pretend it's safe */
-+			return 1; /* "UNSAFE!" */
-+		}
-+		bb_error_msg("skipping unsafe symlink to '%s' in archive,"
-+			" set %s=1 to extract",
-+			target,
-+			"EXTRACT_UNSAFE_SYMLINKS"
-+		);
-+		/* Prevent further messages */
-+		setenv("EXTRACT_UNSAFE_SYMLINKS", "0", 0);
-+		return 1; /* "UNSAFE!" */
-+	}
-+
-+	dot = target;
-+	for (;;) {
-+		dot = strchr(dot, '.');
-+			if (!dot)
-+				return 0; /* safe target */
-+
-+			/* Is it a path component starting with ".."? */
-+			if ((dot[1] == '.')
-+				&& (dot == target || dot[-1] == '/')
-+					/* Is it exactly ".."? */
-+				&& (dot[2] == '/' || dot[2] == '\0')
-+			) {
-+				goto unsafe;
-+			}
-+			/* NB: it can even be trailing ".", should only add 1 */
-+			dot += 1;
-+	}
-+}
-\ No newline at end of file
-diff --git a/archival/unzip.c b/archival/unzip.c
-index 9037262..270e261 100644
---- a/archival/unzip.c
-+++ b/archival/unzip.c
-@@ -335,6 +335,44 @@ static void unzip_create_leading_dirs(const char *fn)
- 	free(name);
- }
- 
-+static void unzip_extract_symlink(zip_header_t *zip, const char *dst_fn)
-+{
-+	char *target;
-+
-+	if (zip->fmt.ucmpsize > 0xfff) /* no funny business please */
-+		bb_error_msg_and_die("bad archive");
-+
-+	if (zip->fmt.method == 0) {
-+		/* Method 0 - stored (not compressed) */
-+		target = xzalloc(zip->fmt.ucmpsize + 1);
-+		xread(zip_fd, target, zip->fmt.ucmpsize);
-+	} else {
-+#if 1
-+		bb_error_msg_and_die("compressed symlink is not supported");
-+#else
-+		transformer_state_t xstate;
-+		init_transformer_state(&xstate);
-+		xstate.mem_output_size_max = zip->fmt.ucmpsize;
-+		/* ...unpack... */
-+		if (!xstate.mem_output_buf)
-+			WTF();
-+		target = xstate.mem_output_buf;
-+		target = xrealloc(target, xstate.mem_output_size + 1);
-+		target[xstate.mem_output_size] = '\0';
-+#endif
-+	}
-+	if (!unsafe_symlink_target(target)) {
-+//TODO: libbb candidate
-+		if (symlink(target, dst_fn)) {
-+			/* shared message */
-+			bb_perror_msg_and_die("can't create %slink '%s' to '%s'",
-+				"sym", dst_fn, target
-+			);
-+		}
-+	}
-+	free(target);
-+}
-+
- static void unzip_extract(zip_header_t *zip, int dst_fd)
- {
- 	transformer_state_t xstate;
-@@ -813,7 +851,7 @@ int unzip_main(int argc, char **argv)
- 		}
-  check_file:
- 		/* Extract file */
--		if (stat(dst_fn, &stat_buf) == -1) {
-+		if (lstat(dst_fn, &stat_buf) == -1) {
- 			/* File does not exist */
- 			if (errno != ENOENT) {
- 				bb_perror_msg_and_die("can't stat '%s'", dst_fn);
-@@ -834,6 +872,7 @@ int unzip_main(int argc, char **argv)
- 			goto do_open_and_extract;
- 		printf("replace %s? [y]es, [n]o, [A]ll, [N]one, [r]ename: ", dst_fn);
- 		my_fgets80(key_buf);
-+//TODO: redo lstat + ISREG check! user input could have taken a long time!
- 
- 		switch (key_buf[0]) {
- 		case 'A':
-@@ -842,7 +881,8 @@ int unzip_main(int argc, char **argv)
-  do_open_and_extract:
- 			unzip_create_leading_dirs(dst_fn);
- #if ENABLE_FEATURE_UNZIP_CDF
--			dst_fd = xopen3(dst_fn, O_WRONLY | O_CREAT | O_TRUNC, file_mode);
-+			if (!S_ISLNK(file_mode))
-+				dst_fd = xopen3(dst_fn, O_WRONLY | O_CREAT | O_TRUNC, file_mode);
- #else
- 			dst_fd = xopen(dst_fn, O_WRONLY | O_CREAT | O_TRUNC);
- #endif
-@@ -852,10 +892,18 @@ int unzip_main(int argc, char **argv)
- 					? " extracting: %s\n"
- 					: */ "  inflating: %s\n", dst_fn);
- 			}
--			unzip_extract(&zip, dst_fd);
--			if (dst_fd != STDOUT_FILENO) {
--				/* closing STDOUT is potentially bad for future business */
--				close(dst_fd);
-+#if ENABLE_FEATURE_UNZIP_CDF
-+			if (S_ISLNK(file_mode)) {
-+				if (dst_fd != STDOUT_FILENO) /* no -p */
-+					unzip_extract_symlink(&zip, dst_fn);
-+			} else
-+#endif
-+			{
-+				unzip_extract(&zip, dst_fd);
-+				if (dst_fd != STDOUT_FILENO) {
-+					/* closing STDOUT is potentially bad for future business */
-+					close(dst_fd);
-+				};
- 			}
- 			break;
- 
-diff --git a/coreutils/link.c b/coreutils/link.c
-index ac3ef85..aab249d 100644
---- a/coreutils/link.c
-+++ b/coreutils/link.c
-@@ -32,9 +32,8 @@ int link_main(int argc UNUSED_PARAM, char **argv)
- 	argv += optind;
- 	if (link(argv[0], argv[1]) != 0) {
- 		/* shared message */
--		bb_perror_msg_and_die("can't create %slink "
--					"%s to %s", "hard",
--					argv[1], argv[0]
-+		bb_perror_msg_and_die("can't create %slink '%s' to '%s'",
-+					"hard",	argv[1], argv[0]
- 		);
- 	}
- 	return EXIT_SUCCESS;
-diff --git a/include/bb_archive.h b/include/bb_archive.h
-index 2b9c5f0..1e4da3c 100644
---- a/include/bb_archive.h
-+++ b/include/bb_archive.h
-@@ -196,6 +196,7 @@ void seek_by_jump(int fd, off_t amount) FAST_FUNC;
- void seek_by_read(int fd, off_t amount) FAST_FUNC;
- 
- const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
-+int unsafe_symlink_target(const char *target) FAST_FUNC;
- 
- void data_align(archive_handle_t *archive_handle, unsigned boundary) FAST_FUNC;
- const llist_t *find_list_entry(const llist_t *list, const char *filename) FAST_FUNC;
-diff --git a/libbb/copy_file.c b/libbb/copy_file.c
-index 23c0f83..be90066 100644
---- a/libbb/copy_file.c
-+++ b/libbb/copy_file.c
-@@ -371,7 +371,10 @@ int FAST_FUNC copy_file(const char *source, const char *dest, int flags)
- 			int r = symlink(lpath, dest);
- 			free(lpath);
- 			if (r < 0) {
--				bb_perror_msg("can't create symlink '%s'", dest);
-+				/* shared message */
-+				bb_perror_msg("can't create %slink '%s' to '%s'",
-+					"sym", dest, lpath
-+				);
- 				return -1;
- 			}
- 			if (flags & FILEUTILS_PRESERVE_STATUS)
-diff --git a/testsuite/tar.tests b/testsuite/tar.tests
-index 9f7ce15..b7cd74c 100755
---- a/testsuite/tar.tests
-+++ b/testsuite/tar.tests
-@@ -10,9 +10,6 @@ unset LC_COLLATE
- unset LC_ALL
- umask 022
- 
--rm -rf tar.tempdir 2>/dev/null
--mkdir tar.tempdir && cd tar.tempdir || exit 1
--
- # testing "test name" "script" "expected result" "file input" "stdin"
- 
- testing "Empty file is not a tarball" '\
-@@ -53,6 +50,7 @@ dd if=/dev/zero bs=512 count=20 2>/dev/null | tar xvf - 2>&1; echo $?
- "" ""
- SKIP=
- 
-+mkdir tar.tempdir && cd tar.tempdir || exit 1
- # "tar cf test.tar input input_dir/ input_hard1 input_hard2 input_hard1 input_dir/ input":
- # GNU tar 1.26 records as hardlinks:
- #  input_hard2 -> input_hard1
-@@ -64,7 +62,6 @@ SKIP=
- # We also don't use "hrw-r--r--" notation for hardlinks in "tar tv" listing.
- optional FEATURE_TAR_CREATE FEATURE_LS_SORTFILES
- testing "tar hardlinks and repeated files" '\
--rm -rf input_* test.tar 2>/dev/null
- >input_hard1
- ln input_hard1 input_hard2
- mkdir input_dir
-@@ -95,10 +92,11 @@ drwxr-xr-x input_dir
- " \
- "" ""
- SKIP=
-+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
- 
-+mkdir tar.tempdir && cd tar.tempdir || exit 1
- optional FEATURE_TAR_CREATE FEATURE_LS_SORTFILES
- testing "tar hardlinks mode" '\
--rm -rf input_* test.tar 2>/dev/null
- >input_hard1
- chmod 741 input_hard1
- ln input_hard1 input_hard2
-@@ -128,10 +126,11 @@ Ok: 0
- " \
- "" ""
- SKIP=
-+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
- 
-+mkdir tar.tempdir && cd tar.tempdir || exit 1
- optional FEATURE_TAR_CREATE FEATURE_LS_SORTFILES
- testing "tar symlinks mode" '\
--rm -rf input_* test.tar 2>/dev/null
- >input_file
- chmod 741 input_file
- ln -s input_file input_soft
-@@ -159,10 +158,11 @@ lrwxrwxrwx input_file
- " \
- "" ""
- SKIP=
-+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
- 
-+mkdir tar.tempdir && cd tar.tempdir || exit 1
- optional FEATURE_TAR_CREATE FEATURE_TAR_LONG_OPTIONS
- testing "tar --overwrite" "\
--rm -rf input_* test.tar 2>/dev/null
- ln input input_hard
- tar cf test.tar input_hard
- echo WRONG >input
-@@ -174,12 +174,13 @@ Ok
- " \
- "Ok\n" ""
- SKIP=
-+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
- 
-+mkdir tar.tempdir && cd tar.tempdir || exit 1
- test x"$SKIP_KNOWN_BUGS" = x"" && {
- # Needs to be run under non-root for meaningful test
- optional FEATURE_TAR_CREATE
- testing "tar writing into read-only dir" '\
--rm -rf input_* test.tar 2>/dev/null
- mkdir input_dir
- >input_dir/input_file
- chmod 550 input_dir
-@@ -201,7 +202,9 @@ dr-xr-x--- input_dir
- "" ""
- SKIP=
- }
-+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
- 
-+mkdir tar.tempdir && cd tar.tempdir || exit 1
- # Had a bug where on extract autodetect first "switched off" -z
- # and then failed to recognize .tgz extension
- optional FEATURE_TAR_CREATE FEATURE_SEAMLESS_GZ GUNZIP
-@@ -217,7 +220,9 @@ Ok
- " \
- "" ""
- SKIP=
-+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
- 
-+mkdir tar.tempdir && cd tar.tempdir || exit 1
- # Do we detect XZ-compressed data (even w/o .tar.xz or txz extension)?
- # (the uuencoded hello_world.txz contains one empty file named "hello_world")
- optional UUDECODE FEATURE_TAR_AUTODETECT FEATURE_SEAMLESS_XZ
-@@ -236,7 +241,9 @@ AAAEWVo=
- ====
- "
- SKIP=
-+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
- 
-+mkdir tar.tempdir && cd tar.tempdir || exit 1
- # On extract, everything up to and including last ".." component is stripped
- optional FEATURE_TAR_CREATE
- testing "tar strips /../ on extract" "\
-@@ -255,7 +262,9 @@ Ok
- " \
- "" ""
- SKIP=
-+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
- 
-+mkdir tar.tempdir && cd tar.tempdir || exit 1
- # attack.tar.bz2 has symlink pointing to a system file
- # followed by a regular file with the same name
- # containing "root::0:0::/root:/bin/sh":
-@@ -270,6 +279,7 @@ optional UUDECODE FEATURE_TAR_AUTODETECT FEATURE_SEAMLESS_BZ2
- testing "tar does not extract into symlinks" "\
- >>/tmp/passwd && uudecode -o input && tar xf input 2>&1 && rm passwd; cat /tmp/passwd; echo \$?
- " "\
-+tar: skipping unsafe symlink to '/tmp/passwd' in archive, set EXTRACT_UNSAFE_SYMLINKS=1 to extract
- 0
- " \
- "" "\
-@@ -281,12 +291,15 @@ l4/V8LDoe90yiWJhOJvIypgEfxdyRThQkBVn/bI=
- ====
- "
- SKIP=
-+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
-+
-+mkdir tar.tempdir && cd tar.tempdir || exit 1
- # And same with -k
- optional UUDECODE FEATURE_TAR_AUTODETECT FEATURE_SEAMLESS_BZ2
- testing "tar -k does not extract into symlinks" "\
- >>/tmp/passwd && uudecode -o input && tar xf input -k 2>&1 && rm passwd; cat /tmp/passwd; echo \$?
- " "\
--tar: can't open 'passwd': File exists
-+tar: skipping unsafe symlink to '/tmp/passwd' in archive, set EXTRACT_UNSAFE_SYMLINKS=1 to extract
- 0
- " \
- "" "\
-@@ -298,7 +311,9 @@ l4/V8LDoe90yiWJhOJvIypgEfxdyRThQkBVn/bI=
- ====
- "
- SKIP=
-+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
- 
-+mkdir tar.tempdir && cd tar.tempdir || exit 1
- optional UNICODE_SUPPORT FEATURE_TAR_GNU_EXTENSIONS FEATURE_SEAMLESS_BZ2 FEATURE_TAR_AUTODETECT
- testing "Pax-encoded UTF8 names and symlinks" '\
- tar xvf ../tar.utf8.tar.bz2 2>&1; echo $?
-@@ -309,17 +324,45 @@ rm -rf etc usr
- ' "\
- etc/ssl/certs/3b2716e5.0
- etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
-+tar: skipping unsafe symlink to '/usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt' in archive, set EXTRACT_UNSAFE_SYMLINKS=1 to extract
- etc/ssl/certs/f80cc7f6.0
- usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
- 0
- etc/ssl/certs/3b2716e5.0 -> EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
--etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem -> /usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
- etc/ssl/certs/f80cc7f6.0 -> EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
- " \
- "" ""
- SKIP=
-+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
- 
--
--cd .. && rm -rf tar.tempdir || exit 1
-+mkdir tar.tempdir && cd tar.tempdir || exit 1
-+optional UUDECODE FEATURE_SEAMLESS_BZ2 FEATURE_TAR_AUTODETECT
-+testing "Symlink attack: create symlink and then write through it" '\
-+exec 2>&1
-+uudecode -o input && tar xvf input; echo $?
-+ls /tmp/bb_test_evilfile
-+ls bb_test_evilfile
-+ls symlink/bb_test_evilfile
-+' "\
-+anything.txt
-+symlink
-+tar: skipping unsafe symlink to '/tmp' in archive, set EXTRACT_UNSAFE_SYMLINKS=1 to extract
-+symlink/bb_test_evilfile
-+0
-+ls: /tmp/bb_test_evilfile: No such file or directory
-+ls: bb_test_evilfile: No such file or directory
-+symlink/bb_test_evilfile
-+" \
-+"" "\
-+begin-base64 644 tar_symlink_attack.tar.bz2
-+QlpoOTFBWSZTWZgs7bQAALT/hMmQAFBAAf+AEMAGJPPv32AAAIAIMAC5thlR
-+omAjAmCMADQT1BqNE0AEwAAjAEwElTKeo9NTR6h6gaeoA0DQNLVdwZZ5iNTk
-+AQwCAV6S00QFJYhrlfFkVCEDEGtgNVqYrI0uK3ggnt30gqk4e1TTQm5QIAKa
-+SJqzRGSFLMmOloHSAcvLiFxxRiQtQZF+qPxbo173ZDISOAoNoPN4PQPhBhKS
-+n8fYaKlioCTzL2oXYczyUUIP4u5IpwoSEwWdtoA=
-+====
-+"
-+SKIP=
-+cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
- 
- exit $FAILCOUNT
diff --git a/meta/recipes-core/busybox/busybox/CVE-2017-15873.patch b/meta/recipes-core/busybox/busybox/CVE-2017-15873.patch
deleted file mode 100644
index 5a027c9..0000000
--- a/meta/recipes-core/busybox/busybox/CVE-2017-15873.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-busybox-1.27.2: Fix CVE-2017-15873
-
-[No upstream tracking] -- https://bugs.busybox.net/show_bug.cgi?id=10431
-
-bunzip2: fix runCnt overflow
-
-The get_next_block function in archival/libarchive/decompress_bunzip2.c
-in BusyBox 1.27.2 has an Integer Overflow that may lead to a write 
-access violation.
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=0402cb32df015d9372578e3db27db47b33d5c7b0]
-CVE: CVE-2017-15873
-bug: 10431
-Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
-
-diff --git a/archival/libarchive/decompress_bunzip2.c b/archival/libarchive/decompress_bunzip2.c
-index 7cd18f5..bec89ed 100644
---- a/archival/libarchive/decompress_bunzip2.c
-+++ b/archival/libarchive/decompress_bunzip2.c
-@@ -156,15 +156,15 @@ static unsigned get_bits(bunzip_data *bd, int bits_wanted)
- static int get_next_block(bunzip_data *bd)
- {
- 	struct group_data *hufGroup;
--	int dbufCount, dbufSize, groupCount, *base, *limit, selector,
--		i, j, runPos, symCount, symTotal, nSelectors, byteCount[256];
--	int runCnt = runCnt; /* for compiler */
-+	int groupCount, *base, *limit, selector,
-+		i, j, symCount, symTotal, nSelectors, byteCount[256];
- 	uint8_t uc, symToByte[256], mtfSymbol[256], *selectors;
- 	uint32_t *dbuf;
- 	unsigned origPtr, t;
-+	unsigned dbufCount, runPos;
-+	unsigned runCnt = runCnt; /* for compiler */
- 
- 	dbuf = bd->dbuf;
--	dbufSize = bd->dbufSize;
- 	selectors = bd->selectors;
- 
- /* In bbox, we are ok with aborting through setjmp which is set up in start_bunzip */
-@@ -187,7 +187,7 @@ static int get_next_block(bunzip_data *bd)
- 	   it didn't actually work. */
- 	if (get_bits(bd, 1)) return RETVAL_OBSOLETE_INPUT;
- 	origPtr = get_bits(bd, 24);
--	if ((int)origPtr > dbufSize) return RETVAL_DATA_ERROR;
-+	if (origPtr > bd->dbufSize) return RETVAL_DATA_ERROR;
- 
- 	/* mapping table: if some byte values are never used (encoding things
- 	   like ascii text), the compression code removes the gaps to have fewer
-@@ -435,7 +435,14 @@ static int get_next_block(bunzip_data *bd)
- 			   symbols, but a run of length 0 doesn't mean anything in this
- 			   context).  Thus space is saved. */
- 			runCnt += (runPos << nextSym); /* +runPos if RUNA; +2*runPos if RUNB */
--			if (runPos < dbufSize) runPos <<= 1;
-+//The 32-bit overflow of runCnt wasn't yet seen, but probably can happen.
-+//This would be the fix (catches too large count way before it can overflow):
-+//			if (runCnt > bd->dbufSize) {
-+//				dbg("runCnt:%u > dbufSize:%u RETVAL_DATA_ERROR",
-+//						runCnt, bd->dbufSize);
-+//				return RETVAL_DATA_ERROR;
-+//			}
-+			if (runPos < bd->dbufSize) runPos <<= 1;
- 			goto end_of_huffman_loop;
- 		}
- 
-@@ -445,14 +452,15 @@ static int get_next_block(bunzip_data *bd)
- 		   literal used is the one at the head of the mtfSymbol array.) */
- 		if (runPos != 0) {
- 			uint8_t tmp_byte;
--			if (dbufCount + runCnt > dbufSize) {
--				dbg("dbufCount:%d+runCnt:%d %d > dbufSize:%d RETVAL_DATA_ERROR",
--						dbufCount, runCnt, dbufCount + runCnt, dbufSize);
-+			if (dbufCount + runCnt > bd->dbufSize) {
-+				dbg("dbufCount:%u+runCnt:%u %u > dbufSize:%u RETVAL_DATA_ERROR",
-+						dbufCount, runCnt, dbufCount + runCnt, bd->dbufSize);
- 				return RETVAL_DATA_ERROR;
- 			}
- 			tmp_byte = symToByte[mtfSymbol[0]];
- 			byteCount[tmp_byte] += runCnt;
--			while (--runCnt >= 0) dbuf[dbufCount++] = (uint32_t)tmp_byte;
-+			while ((int)--runCnt >= 0)
-+				dbuf[dbufCount++] = (uint32_t)tmp_byte;
- 			runPos = 0;
- 		}
- 
-@@ -466,7 +474,7 @@ static int get_next_block(bunzip_data *bd)
- 		   first symbol in the mtf array, position 0, would have been handled
- 		   as part of a run above.  Therefore 1 unused mtf position minus
- 		   2 non-literal nextSym values equals -1.) */
--		if (dbufCount >= dbufSize) return RETVAL_DATA_ERROR;
-+		if (dbufCount >= bd->dbufSize) return RETVAL_DATA_ERROR;
- 		i = nextSym - 1;
- 		uc = mtfSymbol[i];
- 
--- 
-cgit v0.12
diff --git a/meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch b/meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch
deleted file mode 100644
index fc19ee3..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c3797d40a1c57352192c6106cc0f435e7d9c11e8 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Tue, 7 Nov 2017 18:09:29 +0100
-Subject: lineedit: do not tab-complete any strings which have control
- characters
-
-function                                             old     new   delta
-add_match                                             41      68     +27
-
-CVE: CVE-2017-16544
-Upstream-Status: Backport
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- libbb/lineedit.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/libbb/lineedit.c b/libbb/lineedit.c
-index c0e35bb..56e8140 100644
---- a/libbb/lineedit.c
-+++ b/libbb/lineedit.c
-@@ -645,6 +645,18 @@ static void free_tab_completion_data(void)
- 
- static void add_match(char *matched)
- {
-+	unsigned char *p = (unsigned char*)matched;
-+	while (*p) {
-+		/* ESC attack fix: drop any string with control chars */
-+		if (*p < ' '
-+		 || (!ENABLE_UNICODE_SUPPORT && *p >= 0x7f)
-+		 || (ENABLE_UNICODE_SUPPORT && *p == 0x7f)
-+		) {
-+			free(matched);
-+			return;
-+		}
-+		p++;
-+	}
- 	matches = xrealloc_vector(matches, 4, num_matches);
- 	matches[num_matches] = matched;
- 	num_matches++;
--- 
-cgit v0.12
diff --git a/meta/recipes-core/busybox/busybox/busybox-fix-lzma-segfaults.patch b/meta/recipes-core/busybox/busybox/busybox-fix-lzma-segfaults.patch
deleted file mode 100644
index da6dfa8..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-fix-lzma-segfaults.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-busybox-1.27.2: Fix lzma segfaults
-
-[No upstream tracking] -- https://bugs.busybox.net/show_bug.cgi?id=10871
-
-libarchive: check buffer index in lzma_decompress
-
-With specific defconfig busybox fails to check zip fileheader magic
-(archival/unzip.c) and uses (archival/libarchive/decompress_unlzma.c)
-for decompression which leads to segmentation fault. It prevents accessing into
-buffer, which is smaller than pos index. Patch includes multiple segmentation
-fault fixes.
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=a36986bb80289c1cd8d15a557e49207c9a42946b]
-bug: 10436 10871
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/archival/libarchive/decompress_unlzma.c b/archival/libarchive/decompress_unlzma.c
-index a904087..29eee2a 100644
---- a/archival/libarchive/decompress_unlzma.c
-+++ b/archival/libarchive/decompress_unlzma.c
-@@ -11,6 +11,14 @@
- #include "libbb.h"
- #include "bb_archive.h"
- 
-+
-+#if 0
-+# define dbg(...) bb_error_msg(__VA_ARGS__)
-+#else
-+# define dbg(...) ((void)0)
-+#endif
-+
-+
- #if ENABLE_FEATURE_LZMA_FAST
- #  define speed_inline ALWAYS_INLINE
- #  define size_inline
-@@ -217,6 +225,7 @@ unpack_lzma_stream(transformer_state_t *xstate)
- 	rc_t *rc;
- 	int i;
- 	uint8_t *buffer;
-+	uint32_t buffer_size;
- 	uint8_t previous_byte = 0;
- 	size_t buffer_pos = 0, global_pos = 0;
- 	int len = 0;
-@@ -246,7 +255,8 @@ unpack_lzma_stream(transformer_state_t *xstate)
- 	if (header.dict_size == 0)
- 		header.dict_size++;
- 
--	buffer = xmalloc(MIN(header.dst_size, header.dict_size));
-+	buffer_size = MIN(header.dst_size, header.dict_size);
-+	buffer = xmalloc(buffer_size);
- 
- 	{
- 		int num_probs;
-@@ -341,8 +351,12 @@ unpack_lzma_stream(transformer_state_t *xstate)
- 						state = state < LZMA_NUM_LIT_STATES ? 9 : 11;
- 
- 						pos = buffer_pos - rep0;
--						if ((int32_t)pos < 0)
-+						if ((int32_t)pos < 0) {
- 							pos += header.dict_size;
-+							/* see unzip_bad_lzma_2.zip: */
-+							if (pos >= buffer_size)
-+								goto bad;
-+						}
- 						previous_byte = buffer[pos];
- 						goto one_byte1;
- #else
-@@ -417,6 +431,10 @@ unpack_lzma_stream(transformer_state_t *xstate)
- 						for (; num_bits2 != LZMA_NUM_ALIGN_BITS; num_bits2--)
- 							rep0 = (rep0 << 1) | rc_direct_bit(rc);
- 						rep0 <<= LZMA_NUM_ALIGN_BITS;
-+						if ((int32_t)rep0 < 0) {
-+							dbg("%d rep0:%d", __LINE__, rep0);
-+							goto bad;
-+						}
- 						prob3 = p + LZMA_ALIGN;
- 					}
- 					i2 = 1;
-@@ -450,8 +468,12 @@ unpack_lzma_stream(transformer_state_t *xstate)
-  IF_NOT_FEATURE_LZMA_FAST(string:)
- 			do {
- 				uint32_t pos = buffer_pos - rep0;
--				if ((int32_t)pos < 0)
-+				if ((int32_t)pos < 0) {
- 					pos += header.dict_size;
-+					/* more stringent test (see unzip_bad_lzma_1.zip): */
-+					if (pos >= buffer_size)
-+						goto bad;
-+				}
- 				previous_byte = buffer[pos];
-  IF_NOT_FEATURE_LZMA_FAST(one_byte2:)
- 				buffer[buffer_pos++] = previous_byte;
-@@ -478,6 +500,12 @@ unpack_lzma_stream(transformer_state_t *xstate)
- 		IF_DESKTOP(total_written += buffer_pos;)
- 		if (transformer_write(xstate, buffer, buffer_pos) != (ssize_t)buffer_pos) {
-  bad:
-+			/* One of our users, bbunpack(), expects _us_ to emit
-+			 * the error message (since it's the best place to give
-+			 * potentially more detailed information).
-+			 * Do not fail silently.
-+			 */
-+			bb_error_msg("corrupted data");
- 			total_written = -1; /* failure */
- 		}
- 		rc_free(rc);
- 
diff --git a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
index 582a258..9e74653 100644
--- a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
+++ b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
@@ -31,11 +31,11 @@ Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
  networking/udhcp/dhcpc.c                       | 29 ++++++++++++++++------
  1 file changed, 21 insertions(+), 8 deletions(-)
 
-Index: busybox-1.27.2/networking/udhcp/dhcpc.c
+Index: busybox-1.28.3/networking/udhcp/dhcpc.c
 ===================================================================
---- busybox-1.27.2.orig/networking/udhcp/dhcpc.c
-+++ busybox-1.27.2/networking/udhcp/dhcpc.c
-@@ -49,6 +49,8 @@ struct tpacket_auxdata {
+--- busybox-1.28.3.orig/networking/udhcp/dhcpc.c
++++ busybox-1.28.3/networking/udhcp/dhcpc.c
+@@ -48,6 +48,8 @@ struct tpacket_auxdata {
  };
  #endif
  
@@ -44,7 +44,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
  
  /* "struct client_config_t client_config" is in bb_common_bufsiz1 */
  
-@@ -104,8 +106,9 @@ enum {
+@@ -103,8 +105,9 @@ enum {
  	OPT_x = 1 << 18,
  	OPT_f = 1 << 19,
  	OPT_B = 1 << 20,
@@ -55,7 +55,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
  	USE_FOR_MMU(             OPTBIT_b,)
  	IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
  	IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
-@@ -1110,7 +1113,8 @@ static void perform_renew(void)
+@@ -1122,7 +1125,8 @@ static void perform_renew(void)
  		state = RENEW_REQUESTED;
  		break;
  	case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
@@ -65,7 +65,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
  	case REQUESTING:
  	case RELEASED:
  		change_listen_mode(LISTEN_RAW);
-@@ -1146,7 +1150,8 @@ static void perform_release(uint32_t server_addr, uint32_t requested_ip)
+@@ -1158,7 +1162,8 @@ static void perform_release(uint32_t ser
   * Users requested to be notified in all cases, even if not in one
   * of the states above.
   */
@@ -75,16 +75,16 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
  
  	change_listen_mode(LISTEN_NONE);
  	state = RELEASED;
-@@ -1298,7 +1303,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
- 	/* O,x: list; -T,-t,-A take numeric param */
- 	IF_UDHCP_VERBOSE(opt_complementary = "vv";)
- 	IF_LONG_OPTS(applet_long_options = udhcpc_longopts;)
--	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fB"
-+	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fBD"
+@@ -1270,7 +1275,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+ 	/* Parse command line */
+ 	opt = getopt32long(argv, "^"
+ 		/* O,x: list; -T,-t,-A take numeric param */
+-		"CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fB"
++		"CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fBD"
  		USE_FOR_MMU("b")
  		IF_FEATURE_UDHCPC_ARPING("a::")
  		IF_FEATURE_UDHCP_PORT("P:")
-@@ -1409,6 +1414,10 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+@@ -1384,6 +1389,10 @@ int udhcpc_main(int argc UNUSED_PARAM, c
  		logmode |= LOGMODE_SYSLOG;
  	}
  
@@ -95,7 +95,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
  	/* Make sure fd 0,1,2 are open */
  	bb_sanitize_stdio();
  	/* Equivalent of doing a fflush after every \n */
-@@ -1423,7 +1432,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+@@ -1398,7 +1407,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
  	srand(monotonic_us());
  
  	state = INIT_SELECTING;
@@ -105,7 +105,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
  	change_listen_mode(LISTEN_RAW);
  	packet_num = 0;
  	timeout = 0;
-@@ -1577,7 +1587,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+@@ -1565,7 +1575,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
  				}
  				/* Timed out, enter init state */
  				bb_error_msg("lease lost, entering init state");
@@ -115,7 +115,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
  				state = INIT_SELECTING;
  				client_config.first_secs = 0; /* make secs field count from 0 */
  				/*timeout = 0; - already is */
-@@ -1770,7 +1781,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+@@ -1757,7 +1768,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
  						send_decline(/*xid,*/ server_addr, packet.yiaddr);
  
  						if (state != REQUESTING)
@@ -125,7 +125,7 @@ Index: busybox-1.27.2/networking/udhcp/dhcpc.c
  						change_listen_mode(LISTEN_RAW);
  						state = INIT_SELECTING;
  						client_config.first_secs = 0; /* make secs field count from 0 */
-@@ -1840,7 +1852,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+@@ -1827,7 +1839,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
  				bb_error_msg("received %s", "DHCP NAK");
  				udhcp_run_script(&packet, "nak");
  				if (state != REQUESTING)
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index fbb5fd8..ac0cb55 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1,40 +1,39 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.27.2
-# Wed Sep 27 08:56:13 2017
+# Busybox version: 1.28.4
+# Sun Jun 10 23:13:06 2018
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
 #
-# Busybox Settings
+# Settings
 #
 # CONFIG_DESKTOP is not set
 # CONFIG_EXTRA_COMPAT is not set
 # CONFIG_FEDORA_COMPAT is not set
 # CONFIG_INCLUDE_SUSv2 is not set
-# CONFIG_USE_PORTABLE_CODE is not set
+CONFIG_LONG_OPTS=y
 CONFIG_SHOW_USAGE=y
 # CONFIG_FEATURE_VERBOSE_USAGE is not set
 CONFIG_FEATURE_COMPRESS_USAGE=y
-CONFIG_BUSYBOX=y
-# CONFIG_FEATURE_INSTALLER is not set
-# CONFIG_INSTALL_NO_USR is not set
+CONFIG_LFS=y
 # CONFIG_PAM is not set
-CONFIG_LONG_OPTS=y
 CONFIG_FEATURE_DEVPTS=y
-# CONFIG_FEATURE_CLEAN_UP is not set
 CONFIG_FEATURE_UTMP=y
 # CONFIG_FEATURE_WTMP is not set
 CONFIG_FEATURE_PIDFILE=y
 CONFIG_PID_FILE_PATH="/var/run"
+CONFIG_BUSYBOX=y
+# CONFIG_FEATURE_INSTALLER is not set
+# CONFIG_INSTALL_NO_USR is not set
 CONFIG_FEATURE_SUID=y
 CONFIG_FEATURE_SUID_CONFIG=y
 CONFIG_FEATURE_SUID_CONFIG_QUIET=y
-# CONFIG_SELINUX is not set
 # CONFIG_FEATURE_PREFER_APPLETS is not set
 CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
+# CONFIG_SELINUX is not set
+# CONFIG_FEATURE_CLEAN_UP is not set
 CONFIG_FEATURE_SYSLOG=y
-# CONFIG_FEATURE_HAVE_RPC is not set
 CONFIG_PLATFORM_LINUX=y
 
 #
@@ -44,14 +43,15 @@ CONFIG_PLATFORM_LINUX=y
 # CONFIG_PIE is not set
 # CONFIG_NOMMU is not set
 # CONFIG_BUILD_LIBBUSYBOX is not set
+# CONFIG_FEATURE_LIBBUSYBOX_STATIC is not set
 # CONFIG_FEATURE_INDIVIDUAL is not set
 # CONFIG_FEATURE_SHARED_BUSYBOX is not set
-CONFIG_LFS=y
 CONFIG_CROSS_COMPILER_PREFIX=""
 CONFIG_SYSROOT=""
 CONFIG_EXTRA_CFLAGS=""
 CONFIG_EXTRA_LDFLAGS=""
 CONFIG_EXTRA_LDLIBS=""
+# CONFIG_USE_PORTABLE_CODE is not set
 
 #
 # Installation Options ("make install" behavior)
@@ -78,7 +78,7 @@ CONFIG_NO_DEBUG_LIB=y
 # CONFIG_EFENCE is not set
 
 #
-# Busybox Library Tuning
+# Library Tuning
 #
 # CONFIG_FEATURE_USE_BSS_TAIL is not set
 CONFIG_FEATURE_RTMINMAX=y
@@ -145,7 +145,6 @@ CONFIG_BZCAT=y
 # CONFIG_UNLZMA is not set
 CONFIG_LZCAT=y
 # CONFIG_LZMA is not set
-# CONFIG_FEATURE_LZMA_FAST is not set
 # CONFIG_UNXZ is not set
 CONFIG_XZCAT=y
 # CONFIG_XZ is not set
@@ -184,12 +183,14 @@ CONFIG_FEATURE_UNZIP_CDF=y
 # CONFIG_FEATURE_UNZIP_BZIP2 is not set
 # CONFIG_FEATURE_UNZIP_LZMA is not set
 # CONFIG_FEATURE_UNZIP_XZ is not set
+# CONFIG_FEATURE_LZMA_FAST is not set
 
 #
 # Coreutils
 #
 CONFIG_BASENAME=y
 CONFIG_CAT=y
+CONFIG_FEATURE_CATN=y
 # CONFIG_FEATURE_CATV is not set
 CONFIG_CHGRP=y
 CONFIG_CHMOD=y
@@ -220,11 +221,8 @@ CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
 CONFIG_ECHO=y
 CONFIG_FEATURE_FANCY_ECHO=y
 CONFIG_ENV=y
-CONFIG_FEATURE_ENV_LONG_OPTIONS=y
 # CONFIG_EXPAND is not set
-# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
 # CONFIG_UNEXPAND is not set
-# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
 CONFIG_EXPR=y
 CONFIG_EXPR_MATH_SUPPORT_64=y
 # CONFIG_FACTOR is not set
@@ -252,8 +250,8 @@ CONFIG_FEATURE_LS_USERNAME=y
 CONFIG_FEATURE_LS_COLOR=y
 # CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
 CONFIG_MD5SUM=y
-# CONFIG_SHA1SUM is not set
-# CONFIG_SHA256SUM is not set
+CONFIG_SHA1SUM=y
+CONFIG_SHA256SUM=y
 # CONFIG_SHA512SUM is not set
 # CONFIG_SHA3SUM is not set
 
@@ -262,12 +260,10 @@ CONFIG_MD5SUM=y
 #
 CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
 CONFIG_MKDIR=y
-CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
 CONFIG_MKFIFO=y
 CONFIG_MKNOD=y
 CONFIG_MKTEMP=y
 CONFIG_MV=y
-# CONFIG_FEATURE_MV_LONG_OPTIONS is not set
 # CONFIG_NICE is not set
 # CONFIG_NL is not set
 CONFIG_NOHUP=y
@@ -282,7 +278,6 @@ CONFIG_FEATURE_READLINK_FOLLOW=y
 CONFIG_REALPATH=y
 CONFIG_RM=y
 CONFIG_RMDIR=y
-# CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not set
 CONFIG_SEQ=y
 # CONFIG_SHRED is not set
 CONFIG_SHUF=y
@@ -321,6 +316,7 @@ CONFIG_TRUE=y
 CONFIG_TTY=y
 CONFIG_UNAME=y
 CONFIG_UNAME_OSNAME="GNU/Linux"
+CONFIG_BB_ARCH=y
 CONFIG_UNIQ=y
 CONFIG_UNLINK=y
 CONFIG_USLEEP=y
@@ -372,8 +368,8 @@ CONFIG_DEFAULT_SETFONT_DIR=""
 CONFIG_LOADKMAP=y
 CONFIG_OPENVT=y
 CONFIG_RESET=y
-# CONFIG_RESIZE is not set
-# CONFIG_FEATURE_RESIZE_PRINT is not set
+CONFIG_RESIZE=y
+CONFIG_FEATURE_RESIZE_PRINT=y
 CONFIG_SETCONSOLE=y
 # CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
 # CONFIG_SETKEYCODES is not set
@@ -393,6 +389,14 @@ CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
 CONFIG_WHICH=y
 
 #
+# klibc-utils
+#
+# CONFIG_MINIPS is not set
+# CONFIG_NUKE is not set
+# CONFIG_RESUME is not set
+# CONFIG_RUN_INIT is not set
+
+#
 # Editors
 #
 CONFIG_AWK=y
@@ -461,6 +465,8 @@ CONFIG_XARGS=y
 # CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT is not set
 # CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM is not set
 CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
+CONFIG_FEATURE_XARGS_SUPPORT_PARALLEL=y
+CONFIG_FEATURE_XARGS_SUPPORT_ARGS_FILE=y
 
 #
 # Init Utilities
@@ -488,43 +494,41 @@ CONFIG_INIT_TERMINAL_TYPE=""
 #
 # Login/Password Management Utilities
 #
-# CONFIG_FEATURE_SHADOWPASSWDS is not set
+CONFIG_FEATURE_SHADOWPASSWDS=y
 # CONFIG_USE_BB_PWD_GRP is not set
 # CONFIG_USE_BB_SHADOW is not set
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
 # CONFIG_ADD_SHELL is not set
 # CONFIG_REMOVE_SHELL is not set
-# CONFIG_ADDGROUP is not set
-# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
-# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
-# CONFIG_ADDUSER is not set
-# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
+CONFIG_ADDGROUP=y
+CONFIG_FEATURE_ADDUSER_TO_GROUP=y
+CONFIG_ADDUSER=y
 # CONFIG_FEATURE_CHECK_NAMES is not set
 CONFIG_LAST_ID=60000
 CONFIG_FIRST_SYSTEM_ID=100
 CONFIG_LAST_SYSTEM_ID=999
 # CONFIG_CHPASSWD is not set
-CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""
+CONFIG_FEATURE_DEFAULT_PASSWD_ALGO="des"
 # CONFIG_CRYPTPW is not set
 # CONFIG_MKPASSWD is not set
-# CONFIG_DELUSER is not set
-# CONFIG_DELGROUP is not set
-# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
-# CONFIG_GETTY is not set
-# CONFIG_LOGIN is not set
+CONFIG_DELUSER=y
+CONFIG_DELGROUP=y
+CONFIG_FEATURE_DEL_USER_FROM_GROUP=y
+CONFIG_GETTY=y
+CONFIG_LOGIN=y
 # CONFIG_LOGIN_SESSION_AS_CHILD is not set
-# CONFIG_LOGIN_SCRIPTS is not set
-# CONFIG_FEATURE_NOLOGIN is not set
-# CONFIG_FEATURE_SECURETTY is not set
-# CONFIG_PASSWD is not set
-# CONFIG_FEATURE_PASSWD_WEAK_CHECK is not set
-# CONFIG_SU is not set
+CONFIG_LOGIN_SCRIPTS=y
+CONFIG_FEATURE_NOLOGIN=y
+CONFIG_FEATURE_SECURETTY=y
+CONFIG_PASSWD=y
+CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
+CONFIG_SU=y
 # CONFIG_FEATURE_SU_SYSLOG is not set
-# CONFIG_FEATURE_SU_CHECKS_SHELLS is not set
+CONFIG_FEATURE_SU_CHECKS_SHELLS=y
 # CONFIG_FEATURE_SU_BLANK_PW_NEEDS_SECURE_TTY is not set
-# CONFIG_SULOGIN is not set
-# CONFIG_VLOCK is not set
+CONFIG_SULOGIN=y
+CONFIG_VLOCK=y
 
 #
 # Linux Ext2 FS Progs
@@ -571,12 +575,15 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
 # CONFIG_BLKDISCARD is not set
-# CONFIG_BLKID is not set
-# CONFIG_FEATURE_BLKID_TYPE is not set
+CONFIG_BLKID=y
+CONFIG_FEATURE_BLKID_TYPE=y
 # CONFIG_BLOCKDEV is not set
 # CONFIG_CAL is not set
+# CONFIG_CHRT is not set
 CONFIG_DMESG=y
 CONFIG_FEATURE_DMESG_PRETTY=y
+# CONFIG_EJECT is not set
+# CONFIG_FEATURE_EJECT_SCSI is not set
 # CONFIG_FALLOCATE is not set
 # CONFIG_FATATTR is not set
 CONFIG_FBSET=y
@@ -599,15 +606,15 @@ CONFIG_FLOCK=y
 # CONFIG_FSCK_MINIX is not set
 # CONFIG_FSFREEZE is not set
 CONFIG_FSTRIM=y
-# CONFIG_GETOPT is not set
-# CONFIG_FEATURE_GETOPT_LONG is not set
+CONFIG_GETOPT=y
+CONFIG_FEATURE_GETOPT_LONG=y
 CONFIG_HEXDUMP=y
 # CONFIG_FEATURE_HEXDUMP_REVERSE is not set
 # CONFIG_HD is not set
 # CONFIG_XXD is not set
 CONFIG_HWCLOCK=y
-CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
 CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
+# CONFIG_IONICE is not set
 # CONFIG_IPCRM is not set
 # CONFIG_IPCS is not set
 # CONFIG_LAST is not set
@@ -637,14 +644,14 @@ CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_FAKE is not set
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
 # CONFIG_FEATURE_MOUNT_HELPERS is not set
-# CONFIG_FEATURE_MOUNT_LABEL is not set
+CONFIG_FEATURE_MOUNT_LABEL=y
 # CONFIG_FEATURE_MOUNT_NFS is not set
 # CONFIG_FEATURE_MOUNT_CIFS is not set
 CONFIG_FEATURE_MOUNT_FLAGS=y
 CONFIG_FEATURE_MOUNT_FSTAB=y
 # CONFIG_FEATURE_MOUNT_OTHERTAB is not set
+# CONFIG_MOUNTPOINT is not set
 # CONFIG_NSENTER is not set
-# CONFIG_FEATURE_NSENTER_LONG_OPTS is not set
 CONFIG_PIVOT_ROOT=y
 CONFIG_RDATE=y
 # CONFIG_RDEV is not set
@@ -658,10 +665,15 @@ CONFIG_RENICE=y
 # CONFIG_LINUX32 is not set
 # CONFIG_LINUX64 is not set
 # CONFIG_SETPRIV is not set
+# CONFIG_FEATURE_SETPRIV_DUMP is not set
+# CONFIG_FEATURE_SETPRIV_CAPABILITIES is not set
+# CONFIG_FEATURE_SETPRIV_CAPABILITY_NAMES is not set
+# CONFIG_SETSID is not set
 CONFIG_SWAPON=y
 CONFIG_FEATURE_SWAPON_DISCARD=y
 CONFIG_FEATURE_SWAPON_PRI=y
 CONFIG_SWAPOFF=y
+CONFIG_FEATURE_SWAPONOFF_LABEL=y
 CONFIG_SWITCH_ROOT=y
 # CONFIG_TASKSET is not set
 # CONFIG_FEATURE_TASKSET_FANCY is not set
@@ -677,26 +689,31 @@ CONFIG_FEATURE_UMOUNT_ALL=y
 CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
-# CONFIG_VOLUMEID is not set
+CONFIG_VOLUMEID=y
+
+#
+# Filesystem/Volume identification
+#
 # CONFIG_FEATURE_VOLUMEID_BCACHE is not set
-# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
+CONFIG_FEATURE_VOLUMEID_BTRFS=y
 # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
 # CONFIG_FEATURE_VOLUMEID_EXFAT is not set
-# CONFIG_FEATURE_VOLUMEID_EXT is not set
-# CONFIG_FEATURE_VOLUMEID_F2FS is not set
-# CONFIG_FEATURE_VOLUMEID_FAT is not set
+CONFIG_FEATURE_VOLUMEID_EXT=y
+CONFIG_FEATURE_VOLUMEID_F2FS=y
+CONFIG_FEATURE_VOLUMEID_FAT=y
 # CONFIG_FEATURE_VOLUMEID_HFS is not set
 # CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
 # CONFIG_FEATURE_VOLUMEID_JFS is not set
 # CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
 # CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
 # CONFIG_FEATURE_VOLUMEID_LUKS is not set
+CONFIG_FEATURE_VOLUMEID_MINIX=y
 # CONFIG_FEATURE_VOLUMEID_NILFS is not set
 # CONFIG_FEATURE_VOLUMEID_NTFS is not set
 # CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
 # CONFIG_FEATURE_VOLUMEID_REISERFS is not set
 # CONFIG_FEATURE_VOLUMEID_ROMFS is not set
-# CONFIG_FEATURE_VOLUMEID_SQUASHFS is not set
+CONFIG_FEATURE_VOLUMEID_SQUASHFS=y
 # CONFIG_FEATURE_VOLUMEID_SYSV is not set
 # CONFIG_FEATURE_VOLUMEID_UBIFS is not set
 # CONFIG_FEATURE_VOLUMEID_UDF is not set
@@ -705,19 +722,40 @@ CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 #
 # Miscellaneous Utilities
 #
+# CONFIG_ADJTIMEX is not set
+# CONFIG_BBCONFIG is not set
+# CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
 # CONFIG_BEEP is not set
 CONFIG_FEATURE_BEEP_FREQ=0
 CONFIG_FEATURE_BEEP_LENGTH_MS=0
+# CONFIG_CHAT is not set
+# CONFIG_FEATURE_CHAT_NOFAIL is not set
+# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
+# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
+# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
+# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
+# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
+# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
 # CONFIG_CONSPY is not set
 # CONFIG_CROND is not set
 # CONFIG_FEATURE_CROND_D is not set
 # CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
+# CONFIG_FEATURE_CROND_SPECIAL_TIMES is not set
 CONFIG_FEATURE_CROND_DIR=""
+# CONFIG_CRONTAB is not set
+CONFIG_DC=y
+# CONFIG_FEATURE_DC_LIBM is not set
 # CONFIG_DEVFSD is not set
 # CONFIG_DEVFSD_MODLOAD is not set
 # CONFIG_DEVFSD_FG_NP is not set
 # CONFIG_DEVFSD_VERBOSE is not set
 # CONFIG_FEATURE_DEVFS is not set
+# CONFIG_DEVMEM is not set
+# CONFIG_FBSPLASH is not set
+# CONFIG_FLASH_ERASEALL is not set
+# CONFIG_FLASH_LOCK is not set
+# CONFIG_FLASH_UNLOCK is not set
+# CONFIG_FLASHCP is not set
 # CONFIG_HDPARM is not set
 # CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
 # CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
@@ -725,10 +763,12 @@ CONFIG_FEATURE_CROND_DIR=""
 # CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
 # CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
 # CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
+CONFIG_HEXEDIT=y
 # CONFIG_I2CGET is not set
 # CONFIG_I2CSET is not set
 # CONFIG_I2CDUMP is not set
 # CONFIG_I2CDETECT is not set
+# CONFIG_INOTIFYD is not set
 CONFIG_LESS=y
 CONFIG_FEATURE_LESS_MAXLINES=9999999
 CONFIG_FEATURE_LESS_BRACKETS=y
@@ -741,76 +781,32 @@ CONFIG_FEATURE_LESS_FLAGS=y
 # CONFIG_FEATURE_LESS_DASHCMD is not set
 # CONFIG_FEATURE_LESS_LINENUMS is not set
 # CONFIG_LSSCSI is not set
-# CONFIG_NANDWRITE is not set
-# CONFIG_NANDDUMP is not set
-# CONFIG_PARTPROBE is not set
-CONFIG_RFKILL=y
-# CONFIG_SETSERIAL is not set
-# CONFIG_UBIATTACH is not set
-# CONFIG_UBIDETACH is not set
-# CONFIG_UBIMKVOL is not set
-# CONFIG_UBIRMVOL is not set
-# CONFIG_UBIRSVOL is not set
-# CONFIG_UBIUPDATEVOL is not set
-# CONFIG_UBIRENAME is not set
-# CONFIG_ADJTIMEX is not set
-# CONFIG_BBCONFIG is not set
-# CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
-# CONFIG_BEEP is not set
-CONFIG_FEATURE_BEEP_FREQ=0
-CONFIG_FEATURE_BEEP_LENGTH_MS=0
-# CONFIG_CHAT is not set
-# CONFIG_FEATURE_CHAT_NOFAIL is not set
-# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
-# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
-# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
-# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
-# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
-# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
-# CONFIG_CHRT is not set
-# CONFIG_CRONTAB is not set
-CONFIG_DC=y
-# CONFIG_FEATURE_DC_LIBM is not set
-# CONFIG_DEVFSD is not set
-# CONFIG_DEVFSD_MODLOAD is not set
-# CONFIG_DEVFSD_FG_NP is not set
-# CONFIG_DEVFSD_VERBOSE is not set
-# CONFIG_FEATURE_DEVFS is not set
-# CONFIG_DEVMEM is not set
-# CONFIG_EJECT is not set
-# CONFIG_FEATURE_EJECT_SCSI is not set
-# CONFIG_FBSPLASH is not set
-# CONFIG_FLASHCP is not set
-# CONFIG_FLASH_LOCK is not set
-# CONFIG_FLASH_UNLOCK is not set
-# CONFIG_FLASH_ERASEALL is not set
-# CONFIG_IONICE is not set
-# CONFIG_INOTIFYD is not set
-# CONFIG_LAST is not set
-# CONFIG_FEATURE_LAST_FANCY is not set
-# CONFIG_HDPARM is not set
-# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
-# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
-# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
 # CONFIG_MAKEDEVS is not set
 # CONFIG_FEATURE_MAKEDEVS_LEAF is not set
 # CONFIG_FEATURE_MAKEDEVS_TABLE is not set
 # CONFIG_MAN is not set
 CONFIG_MICROCOM=y
-# CONFIG_MOUNTPOINT is not set
 # CONFIG_MT is not set
+# CONFIG_NANDWRITE is not set
+# CONFIG_NANDDUMP is not set
+# CONFIG_PARTPROBE is not set
 # CONFIG_RAIDAUTORUN is not set
 # CONFIG_READAHEAD is not set
+CONFIG_RFKILL=y
 # CONFIG_RUNLEVEL is not set
 # CONFIG_RX is not set
-# CONFIG_SETSID is not set
+CONFIG_SETFATTR=y
+# CONFIG_SETSERIAL is not set
 CONFIG_STRINGS=y
 CONFIG_TIME=y
-# CONFIG_TIMEOUT is not set
 # CONFIG_TTYSIZE is not set
+# CONFIG_UBIATTACH is not set
+# CONFIG_UBIDETACH is not set
+# CONFIG_UBIMKVOL is not set
+# CONFIG_UBIRMVOL is not set
+# CONFIG_UBIRSVOL is not set
+# CONFIG_UBIUPDATEVOL is not set
+# CONFIG_UBIRENAME is not set
 # CONFIG_VOLNAME is not set
 # CONFIG_WATCHDOG is not set
 
@@ -895,6 +891,7 @@ CONFIG_FEATURE_IP_TUNNEL=y
 # CONFIG_FEATURE_NAMEIF_EXTENDED is not set
 # CONFIG_NBDCLIENT is not set
 CONFIG_NC=y
+# CONFIG_NETCAT is not set
 # CONFIG_NC_SERVER is not set
 # CONFIG_NC_EXTRA is not set
 # CONFIG_NC_110_COMPAT is not set
@@ -922,6 +919,7 @@ CONFIG_FEATURE_TELNET_WIDTH=y
 # CONFIG_FEATURE_TELNETD_STANDALONE is not set
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
 CONFIG_TFTP=y
+# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTPD is not set
 
 #
@@ -930,7 +928,6 @@ CONFIG_TFTP=y
 CONFIG_FEATURE_TFTP_GET=y
 CONFIG_FEATURE_TFTP_PUT=y
 # CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
-# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTP_DEBUG is not set
 CONFIG_TLS=y
 CONFIG_TRACEROUTE=y
@@ -949,13 +946,9 @@ CONFIG_FEATURE_WGET_HTTPS=y
 # CONFIG_FEATURE_WGET_OPENSSL is not set
 # CONFIG_WHOIS is not set
 # CONFIG_ZCIP is not set
-# CONFIG_UDHCPC6 is not set
-# CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
-# CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
-# CONFIG_FEATURE_UDHCPC6_RFC4833 is not set
 CONFIG_UDHCPD=y
-# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
 # CONFIG_FEATURE_UDHCPD_BASE_IP_ON_MAC is not set
+# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
 CONFIG_DHCPD_LEASES_FILE="/var/lib/misc/udhcpd.leases"
 CONFIG_DUMPLEASES=y
 # CONFIG_DHCPRELAY is not set
@@ -963,11 +956,19 @@ CONFIG_UDHCPC=y
 CONFIG_FEATURE_UDHCPC_ARPING=y
 CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
 CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
+# CONFIG_UDHCPC6 is not set
+# CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
+# CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
+# CONFIG_FEATURE_UDHCPC6_RFC4833 is not set
+
+#
+# Common options for DHCP applets
+#
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
+CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
 # CONFIG_FEATURE_UDHCP_8021Q is not set
-CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"
 
 #
@@ -1047,13 +1048,11 @@ CONFIG_SV_DEFAULT_SERVICE_DIR=""
 # CONFIG_SVC is not set
 # CONFIG_SVLOGD is not set
 # CONFIG_CHCON is not set
-# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
 # CONFIG_GETENFORCE is not set
 # CONFIG_GETSEBOOL is not set
 # CONFIG_LOAD_POLICY is not set
 # CONFIG_MATCHPATHCON is not set
 # CONFIG_RUNCON is not set
-# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
 # CONFIG_SELINUXENABLED is not set
 # CONFIG_SESTATUS is not set
 # CONFIG_SETENFORCE is not set
@@ -1108,17 +1107,19 @@ CONFIG_ASH_CMDCMD=y
 # CONFIG_HUSH_HELP is not set
 # CONFIG_HUSH_EXPORT is not set
 # CONFIG_HUSH_EXPORT_N is not set
+# CONFIG_HUSH_READONLY is not set
 # CONFIG_HUSH_KILL is not set
 # CONFIG_HUSH_WAIT is not set
 # CONFIG_HUSH_TRAP is not set
 # CONFIG_HUSH_TYPE is not set
+# CONFIG_HUSH_TIMES is not set
 # CONFIG_HUSH_READ is not set
 # CONFIG_HUSH_SET is not set
 # CONFIG_HUSH_UNSET is not set
 # CONFIG_HUSH_ULIMIT is not set
 # CONFIG_HUSH_UMASK is not set
+# CONFIG_HUSH_GETOPTS is not set
 # CONFIG_HUSH_MEMLEAK is not set
-# CONFIG_MSH is not set
 
 #
 # Options common to all shells
@@ -1128,22 +1129,27 @@ CONFIG_FEATURE_SH_MATH=y
 CONFIG_FEATURE_SH_EXTRA_QUIET=y
 # CONFIG_FEATURE_SH_STANDALONE is not set
 # CONFIG_FEATURE_SH_NOFORK is not set
+CONFIG_FEATURE_SH_READ_FRAC=y
 CONFIG_FEATURE_SH_HISTFILESIZE=y
 
 #
 # System Logging Utilities
 #
 CONFIG_KLOGD=y
+
+#
+# klogd should not be used together with syslog to kernel printk buffer
+#
 CONFIG_FEATURE_KLOGD_KLOGCTL=y
 CONFIG_LOGGER=y
-# CONFIG_LOGREAD is not set
-# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
-# CONFIG_SYSLOGD is not set
-# CONFIG_FEATURE_ROTATE_LOGFILE is not set
-# CONFIG_FEATURE_REMOTE_LOG is not set
-# CONFIG_FEATURE_SYSLOGD_DUP is not set
-# CONFIG_FEATURE_SYSLOGD_CFG is not set
-CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=0
-# CONFIG_FEATURE_IPC_SYSLOG is not set
-CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
-# CONFIG_FEATURE_KMSG_SYSLOG is not set
+CONFIG_LOGREAD=y
+CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
+CONFIG_SYSLOGD=y
+CONFIG_FEATURE_ROTATE_LOGFILE=y
+CONFIG_FEATURE_REMOTE_LOG=y
+CONFIG_FEATURE_SYSLOGD_DUP=y
+CONFIG_FEATURE_SYSLOGD_CFG=y
+CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
+CONFIG_FEATURE_IPC_SYSLOG=y
+CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=64
+CONFIG_FEATURE_KMSG_SYSLOG=y
diff --git a/meta/recipes-core/busybox/busybox/getopts.cfg b/meta/recipes-core/busybox/busybox/getopts.cfg
deleted file mode 100644
index 8db0a4a..0000000
--- a/meta/recipes-core/busybox/busybox/getopts.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_GETOPT=y
-CONFIG_LONG_OPTS=y
-CONFIG_FEATURE_GETOPT_LONG=y
diff --git a/meta/recipes-core/busybox/busybox/login-utilities.cfg b/meta/recipes-core/busybox/busybox/login-utilities.cfg
deleted file mode 100644
index cc9b2db..0000000
--- a/meta/recipes-core/busybox/busybox/login-utilities.cfg
+++ /dev/null
@@ -1,13 +0,0 @@
-CONFIG_FEATURE_SHADOWPASSWDS=y
-CONFIG_ADDUSER=y
-CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
-CONFIG_ADDGROUP=y
-CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=y
-CONFIG_DELUSER=y
-CONFIG_DELGROUP=y
-CONFIG_GETTY=y
-CONFIG_LOGIN=y
-CONFIG_PASSWD=y
-CONFIG_SU=y
-CONFIG_SULOGIN=y
-CONFIG_VLOCK=y
diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-core/busybox/busybox/mdev.cfg
index 6aefe90..8cd0dd8 100644
--- a/meta/recipes-core/busybox/busybox/mdev.cfg
+++ b/meta/recipes-core/busybox/busybox/mdev.cfg
@@ -7,5 +7,3 @@ CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=y
 
 CONFIG_SETSID=y
 CONFIG_CTTYHACK=y
-
-CONFIG_FEATURE_SHADOWPASSWDS=y
diff --git a/meta/recipes-core/busybox/busybox/mount-via-label.cfg b/meta/recipes-core/busybox/busybox/mount-via-label.cfg
deleted file mode 100644
index 2fe7ab2..0000000
--- a/meta/recipes-core/busybox/busybox/mount-via-label.cfg
+++ /dev/null
@@ -1,9 +0,0 @@
-CONFIG_BLKID=y
-CONFIG_FEATURE_BLKID_TYPE=y
-CONFIG_FEATURE_MOUNT_LABEL=y
-CONFIG_VOLUMEID=y
-CONFIG_FEATURE_VOLUMEID_BTRFS=y
-CONFIG_FEATURE_VOLUMEID_EXT=y
-CONFIG_FEATURE_VOLUMEID_F2FS=y
-CONFIG_FEATURE_VOLUMEID_FAT=y
-CONFIG_FEATURE_VOLUMEID_SQUASHFS=y
diff --git a/meta/recipes-core/busybox/busybox/resize.cfg b/meta/recipes-core/busybox/busybox/resize.cfg
deleted file mode 100644
index a1d9c95..0000000
--- a/meta/recipes-core/busybox/busybox/resize.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_RESIZE=y
-CONFIG_FEATURE_RESIZE_PRINT=y
diff --git a/meta/recipes-core/busybox/busybox/sha1sum.cfg b/meta/recipes-core/busybox/busybox/sha1sum.cfg
deleted file mode 100644
index 20e72d9..0000000
--- a/meta/recipes-core/busybox/busybox/sha1sum.cfg
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_SHA1SUM=y
diff --git a/meta/recipes-core/busybox/busybox/sha256sum.cfg b/meta/recipes-core/busybox/busybox/sha256sum.cfg
deleted file mode 100644
index ce652ae..0000000
--- a/meta/recipes-core/busybox/busybox/sha256sum.cfg
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_SHA256SUM=y
diff --git a/meta/recipes-core/busybox/busybox/syslog.cfg b/meta/recipes-core/busybox/busybox/syslog.cfg
deleted file mode 100644
index e2425ed..0000000
--- a/meta/recipes-core/busybox/busybox/syslog.cfg
+++ /dev/null
@@ -1,11 +0,0 @@
-CONFIG_SYSLOGD=y
-CONFIG_FEATURE_ROTATE_LOGFILE=y
-CONFIG_FEATURE_REMOTE_LOG=y
-CONFIG_FEATURE_SYSLOGD_DUP=y
-CONFIG_FEATURE_SYSLOGD_CFG=y
-CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
-CONFIG_FEATURE_IPC_SYSLOG=y
-CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=64
-CONFIG_LOGREAD=y
-CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
-CONFIG_FEATURE_KMSG_SYSLOG=y
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.28.4.bb
similarity index 72%
rename from meta/recipes-core/busybox/busybox_1.27.2.bb
rename to meta/recipes-core/busybox/busybox_1.28.4.bb
index 9267870..4c11908 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.28.4.bb
@@ -25,29 +25,18 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://run-ptest \
            file://inetd.conf \
            file://inetd \
-           file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
-           file://mount-via-label.cfg \
-           file://sha1sum.cfg \
-           file://sha256sum.cfg \
-           file://getopts.cfg \
-           file://resize.cfg \
            ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
            ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
-           file://syslog.cfg \
            file://inittab \
            file://rcS \
            file://rcK \
            file://runlevel \
            file://makefile-libbb-race.patch \
-           file://CVE-2011-5325.patch \
-           file://CVE-2017-15873.patch \
-           file://busybox-CVE-2017-16544.patch \
-           file://busybox-fix-lzma-segfaults.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.md5sum] = "476186f4bab81781dab2369bfd42734e"
-SRC_URI[tarball.sha256sum] = "9d4be516b61e6480f156b11eb42577a13529f75d3383850bb75c50c285de63df"
+SRC_URI[tarball.md5sum] = "5661d013c9ef7cc31a453640c320f56b"
+SRC_URI[tarball.sha256sum] = "e3c14a3699dc7e82fed397392957afc78e37bdf25398ac38ead6e84621b2ae6a"
-- 
2.7.4


