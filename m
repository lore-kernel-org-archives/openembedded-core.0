Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12323.1795499325387927434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GrojhaxJ;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14766; q=dns/txt;
  s=iport01; t=1795499325; x=1796708925;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MmQm+z3EbV/AC48DXbBhOxh/U9I2YNt5jqK5prs2MJg=;
  b=GrojhaxJiPQI7xIYUGJFXczaa+gmu9HaB5Axdqbg1azYeAe/O36t4upB
   PAMxUG37JGe/aTFJtI0TABYYKE0mJqzUm4lo/3B/aZIBtjmbXGmn4ll0g
   TZ2x7ilnDDz4Dj/YpbZokM9qbH6C9G74kmY2Lw7QohG3zsjTT2VSAdwbP
   1HakVIQnMm2/y2wLsvqAd5DHwZ3f8ElfsDkdtlBd57fWWDD2D/RqAjaGe
   lzDcWZQEzq2VGo1RBCchMatUyoqwjufXkhPG+YGkSMBcqjAUqmc46uBcc
   eT97xqCs2wZiuRWwn7VJgnmoDeIjeQYyqg+uX4w64NvmT7tf9VUFEH7oH
   A==;
X-CSE-ConnectionGUID: YfAAoRAOQlSJThpNnEwWzQ==
X-CSE-MsgGUID: 8QRvmhWKSeuWCiAIRYX13g==
X-IPAS-Result: =?us-ascii?q?A0BFAgD+IwVr/9JK/pBaglmCV3VgQ0mUKoE1bIEWnRaBf?=
 =?us-ascii?q?g8BAQEPMSAEAQGTKQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgEtCwEYAVkDAQJaIxgJgwIBgnQDuwGBeTOBAYMpAYFU2zMBC?=
 =?us-ascii?q?xQBgTiFQogkXYUWJxsbgXKBFYJ0doQbEoZcBIIigQyBVBgGMYxIAoFPiElIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFoAzUSKhUyPDIdgSM7F4EHGwYFgRyBHoESgQNdgSsoX?=
 =?us-ascii?q?iGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLG?=
 =?us-ascii?q?gVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYDUgRLDcVGQQ+b?=
 =?us-ascii?q?geUFIMICwcOCBcEXQEHDC96BwIGLQckDAQDMgsGGJJ0BwoUkAGCIYE1n1wKK?=
 =?us-ascii?q?IN5jCSVOhozhVulF5kIo3MbTYRqgWg8gVlwFYMiCUoZD44vFRyBXIg4yAsmM?=
 =?us-ascii?q?gI7AgcCBw4DC5FpgX0BAQ?=
IronPort-Data: A9a23:GBpeT67HX+5wZ32CJNS0WwxRtG3GchMFZxGqfqrLsTDasY5as4F+v
 mRNUTqBPPyLamGnedkkaNiypEJV78DSydBqTlRlqS1mZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOt/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eDIMx0+FNKEZ38
 cc6FDAVSBaumN2k+efuIgVsrpxLwMjDNY4F/3UlxjbDALN+ENbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaOkUn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCzaoSEI4bXFK25mG7In
 1jY+mTGISoXKeO0yBOkyEOc37TAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1ffDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:grx6Rasexklr0T2Opw8fYTOC7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:IYPGEG0/sg6gwmjPtm/OYrxfK84MW3rn5VDpJ3SaNWZxbru4VmCCwfYx
X-Talos-MUID: 9a23:f+qjxwXhgaZJHdrq/G/Vvi9nNPhL2KmzN2sMuLQ8ivndbiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62691259"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:48:43 +0000
Received: from sjc-ads-7857.cisco.com (sjc-ads-7857.cisco.com [10.30.222.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 9E21618000123
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 05:48:42 +0000 (GMT)
Received: by sjc-ads-7857.cisco.com (Postfix, from userid 1887505)
	id 4E4B0CC161E; Mon, 23 Nov 2026 21:48:41 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] attr: fix recursive getfattr failures with low descriptor limits
Date: Mon, 23 Nov 2026 21:48:41 -0800
Message-Id: <20261124054841.2576858-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7857.cisco.com [10.30.222.144];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.222.144, sjc-ads-7857.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 05:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250942
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Under low file descriptor limits, getfattr -R can report "Bad file
descriptor" and omit entries from deep directory trees. The 2.6.0 walker
closes ancestor directory streams but retains their descriptors and
readdir() filename pointers in recursive calls.

Retain an open root directory handle and copy filenames before closing
streams. Reopen descendants relative to a valid ancestor, verify their
device and inode, and fix descriptor ownership and accounting.

Add a regression test for default, physical and logical traversal at
descriptor limits of 32 and 256, and enable it in ptest with its required
utilities.

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 ...traversal-through-anchored-directory.patch | 393 ++++++++++++++++++
 meta/recipes-support/attr/attr/run-ptest      |   8 +-
 meta/recipes-support/attr/attr_2.6.0.bb       |   4 +
 3 files changed, 403 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/attr/attr/0001-walk_tree-resume-traversal-through-anchored-directory.patch

diff --git a/meta/recipes-support/attr/attr/0001-walk_tree-resume-traversal-through-anchored-directory.patch b/meta/recipes-support/attr/attr/0001-walk_tree-resume-traversal-through-anchored-directory.patch
new file mode 100644
index 0000000000..799676f10d
--- /dev/null
+++ b/meta/recipes-support/attr/attr/0001-walk_tree-resume-traversal-through-anchored-directory.patch
@@ -0,0 +1,393 @@
+From 417b71279fb1f02ed04b8db997395b073c36cf42 Mon Sep 17 00:00:00 2001
+From: Hetvi Thakar <hthakar@cisco.com>
+Date: Tue, 17 Nov 2026 22:24:17 -0800
+Subject: [PATCH] walk_tree: resume traversal through anchored directory
+ handles
+
+Closing an ancestor directory stream releases both its descriptor and the
+storage returned by readdir(). Recursive frames can consequently retain
+invalid component names and parent descriptors when resuming traversal.
+
+Keep the top-level stream open as an anchor and copy component names before
+closing streams. Reopen closed directories one component at a time relative
+to a surviving ancestor, preserving the original opening flags and checking
+each component's device and inode before continuing. Protect the immediate
+parent while opening and visiting its child.
+
+Transfer descriptor ownership to fdopendir() explicitly, restore the handle
+budget on all close paths, and retry both EMFILE and ENFILE failures. This
+also avoids closing a descriptor again after its stream has been closed.
+
+Add a standalone shell regression test which checks complete recursive xattr
+listings of 74 regular files in 37 directory levels under descriptor limits
+256 and 32, in default, physical and logical traversal modes.
+
+Fixes: 9b37b117c5d5 ("Add the new walk_tree helper")
+Upstream-Status: Pending
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ libmisc/walk_tree.c | 131 ++++++++++++++++++++++++++++++++++----------
+ test/Makemodule.am  |   6 +-
+ test/walk-tree.sh   |  78 ++++++++++++++++++++++++++
+ 3 files changed, 183 insertions(+), 32 deletions(-)
+ create mode 100755 test/walk-tree.sh
+
+diff --git a/libmisc/walk_tree.c b/libmisc/walk_tree.c
+index 5b1b576..5b145f7 100644
+--- a/libmisc/walk_tree.c
++++ b/libmisc/walk_tree.c
+@@ -34,6 +34,8 @@
+ 
+ struct dir_stack_entry {
+ 	struct dir_stack_entry *parent;
++	const char *name;
++	int open_flags;
+ 	DIR *stream;
+ 	long pos;
+ 	dev_t dev;
+@@ -133,7 +135,74 @@ static char *new_dirname(const char *dirname, const char *pathname)
+ 	return newname;
+ }
+ 
+-static int walk_tree_rec(int dirfd, const char *dirname, const char *pathname,
++static int close_parent(struct walk_tree_args *args,
++			struct dir_stack_entry *parent)
++{
++	struct dir_stack_entry *entry, *oldest = NULL;
++	DIR *stream;
++
++	/* Keep the root as an anchor, and the immediate parent for openat(). */
++	for (entry = parent ? parent->parent : NULL;
++	     entry && entry->parent; entry = entry->parent) {
++		if (entry->stream)
++			oldest = entry;
++	}
++	if (!oldest) {
++		errno = EMFILE;
++		return -1;
++	}
++	oldest->pos = telldir(oldest->stream);
++	if (oldest->pos == -1)
++		return -1;
++	stream = oldest->stream;
++	oldest->stream = NULL;
++	args->num_dir_handles++;
++	return closedir(stream);
++}
++
++static int reopen_dir(struct dir_stack_entry *entry)
++{
++	struct dir_stack_entry *parent = entry->parent;
++	struct stat st;
++	int parent_fd, fd, saved_errno;
++
++	/* The root stream is never closed or reopened by pathname. */
++	if (!parent) {
++		errno = ESTALE;
++		return -1;
++	}
++	if (parent->stream)
++		parent_fd = dirfd(parent->stream);
++	else {
++		parent_fd = reopen_dir(parent);
++		if (parent_fd == -1)
++			return -1;
++	}
++
++	fd = openat(parent_fd, entry->name, entry->open_flags);
++	saved_errno = errno;
++	if (!parent->stream)
++		close(parent_fd);
++	errno = saved_errno;
++	if (fd == -1)
++		return -1;
++
++	if (fstat(fd, &st) == -1)
++		goto fail;
++	if (st.st_dev != entry->dev || st.st_ino != entry->ino) {
++		errno = ESTALE;
++		goto fail;
++	}
++	return fd;
++
++fail:
++	saved_errno = errno;
++	close(fd);
++	errno = saved_errno;
++	return -1;
++}
++
++static int walk_tree_rec(int parent_fd, const char *dirname, const char *pathname,
+ 			 unsigned char dirtype, struct walk_tree_args *args,
+ 			 struct dir_stack_entry *parent_dir)
+ {
+@@ -144,7 +213,7 @@ static int walk_tree_rec(int dirfd, const char *dirname, const char *pathname,
+ 	int follow;
+ 	struct stat st;
+ 	char *mydirname = NULL;
+-	int dir_open_flags;
++	char *myname = NULL;
+ 	int fd = -1;
+ 	struct dirent *entry;
+ 	int err = 0;
+@@ -163,34 +232,27 @@ static int walk_tree_rec(int dirfd, const char *dirname, const char *pathname,
+ 	       !(walk_flags & WALK_TREE_TOPLEVEL)))))
+ 		goto visit_this;
+ 
+-	if (args->num_dir_handles == 0) {
+-		struct dir_stack_entry *top;
+-
+-close_another_parent:
+-		/* Close the topmost parent directory handle still open. */
+-		top = parent_dir;
+-		if (!top || !top->stream) {
+-			errno = ENFILE;
+-			goto fail;
+-		}
+-		while (top->parent && top->parent->stream)
+-			top = top->parent;
+-		top->pos = telldir(top->stream);
+-		closedir(top->stream);
+-		top->stream = NULL;
+-		args->num_dir_handles++;
+-	}
++	/* Closing an ancestor stream also frees its readdir() storage. */
++	myname = strdup(pathname);
++	if (!myname)
++		goto fail;
++	pathname = this_dir.name = myname;
++	this_dir.open_flags = O_RDONLY | O_DIRECTORY | (follow ? 0 : O_NOFOLLOW);
++	if (args->num_dir_handles == 0 && close_parent(args, parent_dir) == -1)
++		goto fail;
+ 
+-	dir_open_flags = O_RDONLY | O_DIRECTORY | (follow ? 0 : O_NOFOLLOW);
+-	fd = openat(dirfd, pathname, dir_open_flags);
++retry_open:
++	fd = openat(parent_fd, pathname, this_dir.open_flags);
+ 	if (fd == -1) {
+ 		if (errno == ENOTDIR || errno == ENOENT || errno == ELOOP)
+ 			goto visit_this;
+-		if (errno != ENFILE)
++		if (errno != EMFILE && errno != ENFILE)
+ 			goto fail;
+ 		/* Ran out of file descriptors. */
+ 		args->num_dir_handles = 0;
+-		goto close_another_parent;
++		if (close_parent(args, parent_dir) == -1)
++			goto fail;
++		goto retry_open;
+ 	}
+ 	args->num_dir_handles--;
+ 	if (dirtype == DT_UNKNOWN && !follow)
+@@ -198,6 +260,8 @@ close_another_parent:
+ 
+ 	if (fstat(fd, &st) == -1)
+ 		goto fail;
++	this_dir.dev = st.st_dev;
++	this_dir.ino = st.st_ino;
+ 	if (walk_flags & WALK_TREE_ONE_FILESYSTEM) {
+ 		if (args->dev == 0)
+ 			args->dev = st.st_dev;
+@@ -208,8 +272,6 @@ close_another_parent:
+ 	if (walk_flags & WALK_TREE_LOGICAL) {
+ 		if (dir_visited(parent_dir, st.st_dev, st.st_ino))
+ 			goto dir_visited;
+-		this_dir.dev = st.st_dev;
+-		this_dir.ino = st.st_ino;
+ 	} else {
+ 		int ret = dir_hash_insert_unique(args, &st);
+ 		if (ret == 1)
+@@ -222,8 +284,9 @@ close_another_parent:
+ dir_visited:
+ 	close(fd);
+ 	fd = -1;
++	args->num_dir_handles++;
+ 	if (dirtype == DT_UNKNOWN) {
+-		if (fstatat(dirfd, pathname, &st, AT_SYMLINK_NOFOLLOW) == -1)
++		if (fstatat(parent_fd, pathname, &st, AT_SYMLINK_NOFOLLOW) == -1)
+ 			goto fail;
+ 		dirtype = IFTODT(st.st_mode);
+ 	}
+@@ -231,7 +294,7 @@ dir_visited:
+ 		goto out;
+ 
+ visit_this:
+-	err += args->func(dirfd, dirname, pathname, dirtype,
++	err += args->func(parent_fd, dirname, pathname, dirtype,
+ 			  walk_flags, args->arg);
+ 
+ 	if (fd == -1)
+@@ -239,6 +302,7 @@ visit_this:
+ 	this_dir.stream = fdopendir(fd);
+ 	if (this_dir.stream == NULL)
+ 		goto fail;
++	fd = -1;
+ 
+ 	mydirname = new_dirname(dirname, pathname);
+ 	if (mydirname == NULL)
+@@ -250,18 +314,19 @@ visit_this:
+ 		    !strcmp(entry->d_name, ".."))
+ 			continue;
+ 
+-		err += walk_tree_rec(fd, mydirname, entry->d_name,
++		err += walk_tree_rec(dirfd(this_dir.stream), mydirname, entry->d_name,
+ 				     entry->d_type, args, &this_dir);
+ 
+ 		if (!this_dir.stream) {
+ 			/* Reopen the directory handle. */
+-			fd = openat(dirfd, pathname, dir_open_flags);
++			fd = reopen_dir(&this_dir);
+ 			if (fd == -1)
+ 				goto fail_depth;
+ 			args->num_dir_handles--;
+ 			this_dir.stream = fdopendir(fd);
+ 			if (!this_dir.stream)
+ 				goto fail_depth;
++			fd = -1;
+ 			seekdir(this_dir.stream, this_dir.pos);
+ 		}
+ 	}
+@@ -269,9 +334,11 @@ visit_this:
+ 
+ 	if (closedir(this_dir.stream) != 0) {
+ 		this_dir.stream = NULL;
++		args->num_dir_handles++;
+ 		goto fail;
+ 	}
+ 	this_dir.stream = NULL;
++	args->num_dir_handles++;
+ 
+ out:
+ 	free(mydirname);
+@@ -284,10 +351,11 @@ out:
+ 		close(fd);
+ 		args->num_dir_handles++;
+ 	}
++	free(myname);
+ 	return err;
+ 
+ fail:
+-	err += args->func(dirfd, dirname, pathname, dirtype,
++	err += args->func(parent_fd, dirname, pathname, dirtype,
+ 			  walk_flags | WALK_TREE_FAILED, args->arg);
+ 	goto out;
+ 
+@@ -318,6 +386,9 @@ int walk_tree(const char *pathname, enum walk_flags walk_flags,
+ 	if (getrlimit(RLIMIT_NOFILE, &rlimit) != 0)
+ 		rlimit.rlim_cur = 0;
+ 	args.num_dir_handles = rlimit.rlim_cur / 4 + 1;
++	/* Reserve streams for the root, an immediate parent, and its child. */
++	if (args.num_dir_handles < 3)
++		args.num_dir_handles = 3;
+ 
+ 	err = walk_tree_rec(AT_FDCWD, "", pathname, DT_UNKNOWN, &args, NULL);
+ 
+diff --git a/test/Makemodule.am b/test/Makemodule.am
+index eb679f1..5342960 100644
+--- a/test/Makemodule.am
++++ b/test/Makemodule.am
+@@ -1,8 +1,9 @@
+-TEST_EXTENSIONS = .run
++TEST_EXTENSIONS = .run .sh
+ 
+ TESTS = \
+ 	test/attr.run \
+-	test/root/getfattr.run
++	test/root/getfattr.run \
++	test/walk-tree.sh
+ 
+ if UNSAFE_RESTORE_WARNINGS
+ TESTS += \
+@@ -20,3 +21,4 @@ AM_TESTS_ENVIRONMENT = \
+ 	export LC_MESSAGES=C; \
+ 	PATH="$(abs_top_builddir):$$PATH";
+ RUN_LOG_COMPILER = $(srcdir)/test/run
++SH_LOG_COMPILER = $(SHELL)
+diff --git a/test/walk-tree.sh b/test/walk-tree.sh
+new file mode 100755
+index 0000000..d579c12
+--- /dev/null
++++ b/test/walk-tree.sh
+@@ -0,0 +1,78 @@
++#!/bin/sh
++# SPDX-License-Identifier: GPL-2.0-or-later
++# Exercise closed-directory reopening without relying on readdir() order.
++
++set -eu
++LC_ALL=C
++export LC_ALL
++
++fail()
++{
++	echo "walk-tree: $*" >&2
++	exit 1
++}
++
++skip()
++{
++	echo "walk-tree: $*" >&2
++	exit 77
++}
++
++# Keep enough handles open in the control case to cover all 37 directories.
++# Probe in children so neither the test process nor its caller loses handles.
++(ulimit -S -n 256) >/dev/null 2>&1 || skip "cannot set a soft descriptor limit of 256"
++(ulimit -S -n 32) >/dev/null 2>&1 || skip "cannot set a soft descriptor limit of 32"
++
++testdir=$(mktemp -d "${TMPDIR:-.}/attr-walk-tree.XXXXXX") || fail "mktemp failed"
++testdir=$(CDPATH= cd "$testdir" && pwd) || fail "cannot resolve test directory"
++trap 'rm -rf "$testdir"' 0
++trap 'exit 1' 1 2 3 15
++cd "$testdir"
++
++# Unsupported filesystems are not traversal failures. Unexpected probe errors
++# remain failures, rather than hiding an unrelated setfattr regression.
++: > probe
++if ! setfattr -n user.walk_tree -v 1 probe 2>probe.err; then
++	if grep -E ': (Operation not supported|Not supported|Function not implemented)$' probe.err >/dev/null; then
++		skip "filesystem does not support user extended attributes"
++	fi
++	cat probe.err >&2
++	fail "setting the probe attribute failed"
++fi
++
++make_tree()
++{
++	mkdir "$1"
++	: > "$1/before"
++	setfattr -n user.walk_tree -v 1 "$1/before"
++	printf '# file: %s\nuser.walk_tree="1"\n\n' "$1/before" >>expected
++	if [ "$2" -lt 36 ]; then
++		make_tree "$1/d" "$(($2 + 1))"
++	fi
++	: > "$1/after"
++	setfattr -n user.walk_tree -v 1 "$1/after"
++	printf '# file: %s\nuser.walk_tree="1"\n\n' "$1/after" >>expected
++}
++
++# A file created on either side of the child directory exercises resumption
++# regardless of whether the filesystem returns the child before other entries.
++make_tree tree 0
++sort expected >expected.sorted
++
++for walk in -R -RP -RL; do
++	for limit in 256 32; do
++		if ! (
++			ulimit -S -n "$limit" || exit 1
++			exec getfattr "$walk" -d -m '^user[.]walk_tree$' tree
++		) >actual 2>actual.err; then
++			cat actual.err >&2
++			fail "listing with $walk failed with descriptor limit $limit"
++		fi
++		if [ -s actual.err ]; then
++			cat actual.err >&2
++			fail "listing with $walk reported errors with descriptor limit $limit"
++		fi
++		sort actual >actual.sorted
++		cmp expected.sorted actual.sorted || fail "incomplete listing with $walk and descriptor limit $limit"
++	done
++done
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/attr/run-ptest b/meta/recipes-support/attr/attr/run-ptest
index 50970d5b65..7c7c368ab0 100644
--- a/meta/recipes-support/attr/attr/run-ptest
+++ b/meta/recipes-support/attr/attr/run-ptest
@@ -3,8 +3,12 @@
 failed=0
 all=0
 
-for f in *.run; do
-    ./run $f
+for f in *.run *.sh; do
+    [ -f "$f" ] || continue
+    case "$f" in
+        *.run) ./run "$f" ;;
+        *.sh) sh "$f" ;;
+    esac
     case "$?" in
         0)
             echo "PASS: $f"
diff --git a/meta/recipes-support/attr/attr_2.6.0.bb b/meta/recipes-support/attr/attr_2.6.0.bb
index 4af6c4fac2..36510df4b5 100644
--- a/meta/recipes-support/attr/attr_2.6.0.bb
+++ b/meta/recipes-support/attr/attr_2.6.0.bb
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/attr/${BP}.tar.gz \
            file://run-ptest \
+           file://0001-walk_tree-resume-traversal-through-anchored-directory.patch \
 "
 
 SRC_URI[sha256sum] = "d42fa374513180bb48cb11a46696f488240e5124ff1e6ad88b0abff706985612"
@@ -47,6 +48,9 @@ do_install_ptest:append:libc-musl() {
 }
 
 RDEPENDS:${PN}-ptest = "attr \
+                        coreutils \
+                        diffutils \
+                        grep \
                         perl \
                         perl-module-cwd \
                         perl-module-file-basename \
-- 
2.35.6

