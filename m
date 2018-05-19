Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC0075212
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 02:14:01 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id c22-v6so3370220pgn.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 19:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5QMBB6a2Y10L31eQHlHrBdsGHjd1G8iN73B2TE3ctTE=;
	b=D7m/5gl0PgnLVMEHhMAj6Hq6LbTsBiTwmMRGociQyTcAM/OqKdqQnFNA75GTb43Wam
	98nUYlmXxynwxefwKpYAdEcJ2AkGfSIvWl4Do+Sdg1X/nhc4UvEWpYgWuOjVYr7WbFVo
	E+p70TL2GRN4RKZgu4kU146n0BsC1zUP3CejK0w7gEdXKUIsubf8FHAEYEeqHdgslHAO
	MDNKUU/HM9N1BFxw93JXBfkVeNcZDVaRBVzdRd2YtQp/2EZZwlzRpUK+GGDEDe47aPhY
	YFfUzmT3KBh/ETMu5f8MUnFQcz6jE5QQuMn9eP6a1W7P9WUlXxiPu9xHBjEOtvSdVo3a
	RZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5QMBB6a2Y10L31eQHlHrBdsGHjd1G8iN73B2TE3ctTE=;
	b=hqgVdWN4InyU0622LLTL97nGv6g/Mu6jZKJFB2R4tJge9TYoUNO0ckVM3U8lMPUoK+
	KPYwrKlNJZsVE+KTgVJ3Ad6DlUd/MnZEvO4/i64zPsNkjtmTJbS7f6LCetbrg6k4wNnp
	8MsWgisMfi0qio+1C6VW2411xvyKmHQio1nKXKyCsI6fJjs2NQOzo0kkyoFBxvGw1S8Y
	BRi9wBKSWeNmU6XN2yzsnqymgHXwg8d7CsTamJhvGkwrHpdLnhH/wFdRRj2r7fFI/NA7
	pxbloZXI4dmZE+d4TKKJzmMpwd4NAfyhrB3pU82XDz0b6+2bK63xlJVnT/oLnluJmB+N
	Skrw==
X-Gm-Message-State: ALKqPwfRrvwh+05QvtKrT/5GDPKWsGdyIF3/C9EU22ytuWP2u9xnTSPP
	WyoeDccfnSpriCxrjdstbrc=
X-Google-Smtp-Source: AB8JxZryqwPXuYkgwVwTLRJc11OEtLiehEzfjdLZsOqWI2WputdKDIIQpMCtd3UIThzQyVKn1wmgEw==
X-Received: by 2002:a65:6310:: with SMTP id
	g16-v6mr9327513pgv.135.1526696042588; 
	Fri, 18 May 2018 19:14:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:ed41:dd75:6b53:32ea])
	by smtp.gmail.com with ESMTPSA id
	n10-v6sm19307081pfj.68.2018.05.18.19.14.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 May 2018 19:14:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 19:13:53 -0700
Message-Id: <1526696034-3857-7-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526696034-3857-1-git-send-email-akuster@mvista.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] busybox: update to 1.28.3
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
X-List-Received-Date: Sat, 19 May 2018 02:14:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster808@gmail.com>

removed patches included in update:
busybox/CVE-2011-5325.patch
busybox/CVE-2017-15873.patch
busybox/busybox-CVE-2017-16544.patch

refactored busybox-udhcpc-no_deconfig.patch for this update

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../busybox/busybox/CVE-2011-5325.patch            | 481 ---------------------
 .../busybox/busybox/CVE-2017-15873.patch           |  95 ----
 .../busybox/busybox/busybox-CVE-2017-16544.patch   |  43 --
 .../busybox/busybox-udhcpc-no_deconfig.patch       |  36 +-
 .../{busybox_1.27.2.bb => busybox_1.28.3.bb}       |   9 +-
 5 files changed, 21 insertions(+), 643 deletions(-)
 delete mode 100755 meta/recipes-core/busybox/busybox/CVE-2011-5325.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2017-15873.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch
 rename meta/recipes-core/busybox/{busybox_1.27.2.bb => busybox_1.28.3.bb} (83%)

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
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.28.3.bb
similarity index 83%
rename from meta/recipes-core/busybox/busybox_1.27.2.bb
rename to meta/recipes-core/busybox/busybox_1.28.3.bb
index 36a6342..6afd9f2 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.28.3.bb
@@ -1,7 +1,6 @@
 require busybox.inc
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
-           file://busybox-udhcpc-no_deconfig.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
            file://busybox-httpd \
@@ -42,11 +41,9 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://rcK \
            file://runlevel \
            file://makefile-libbb-race.patch \
-           file://CVE-2011-5325.patch \
-           file://CVE-2017-15873.patch \
-           file://busybox-CVE-2017-16544.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.md5sum] = "476186f4bab81781dab2369bfd42734e"
-SRC_URI[tarball.sha256sum] = "9d4be516b61e6480f156b11eb42577a13529f75d3383850bb75c50c285de63df"
+#file://busybox-udhcpc-no_deconfig.patch
+SRC_URI[tarball.md5sum] = "82e5ad09ae4a07c266fc179492b51757"
+SRC_URI[tarball.sha256sum] = "ad0d22033f23e696f9a71a4c2f9210194dda39b024a79151f4ac278995332a6e"
-- 
2.7.4


