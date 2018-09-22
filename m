Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id E5DB9796CE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 20:21:04 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id b129-v6so7489607pga.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 13:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TVNsnMOIiA4r9nsbVOFuf+jWCcUMpNkJhA0TnQaztkA=;
	b=cEN0WtaYDpzECYvjVvq3xo9u37EpjmSuPgN1kyIM0nTaLSfqt5RZ9IZ3C8Mn408gm0
	1RyK7D3eQcSF/Q4+nmSiXuK34RRyZUt47Oh2v6pxwVkSt9mjXg0t9K7InFFW8BFGZL92
	LSndAJBuV/8vyUEPCKupWqIU6N8Qc8fJo6S/Qfc7tetu3MB3oAVWWGBNXqnl9Dqe0uNu
	6oaAjFfNnjuo3NVdIZ4rPcbbowhLOCZeqVQ7OnqvEwzSce9/czVpuOI8nwooi0Vpl1X7
	Jaucte03xuuuGRQtwtOiQF8pO5sf919QCWZq2lQprd5LvxCDtIBDetiEQa7JPO5lQZ4u
	eqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TVNsnMOIiA4r9nsbVOFuf+jWCcUMpNkJhA0TnQaztkA=;
	b=bJsQZwzjmE52CTCrYj0P+Ey0Bsi2OqHt0QYtSnxBGpZcxwxgvxggd7oho+nebzRq/p
	iHo7Txif0TajLm0FtC9NJWMB9tnqKRGeeKDjyc7H0oP6llkg0xeIoF48+xA1f20gJH1T
	61r+4Ua/edxh5yDwg6XmfzAzPlP+/U/aozGTxohX4VE5mrWs65ni7jZLF11oBel/wnDo
	fDmVisuOxr8U6aUFKPGDt22PLZJgHrTAAiPkld86OC6n4x+/gnVo85nKTyFOmIOd8iHB
	1jClmyb0yTH8FvQISsK05ATf39X8ZWkOUA1AtGrELPG4LDKCHuvbGhH+sZmh3LMhbDdc
	BdKA==
X-Gm-Message-State: ABuFfoiAZE1NWfB1shtRitCTN3j4j4CMUJ6+HjrV7plheSv59ilIdl4p
	qLl4w6UEtWizOhkcvPm8cOMaBVkQ8EI=
X-Google-Smtp-Source: ACcGV60GrivBryq0Bg6hcMyNNYwMpXIKgR2ZSYd+kf1FrBzrpFhRvMcKw7IrW/KbAm263kMAf93UHQ==
X-Received: by 2002:a63:ec14:: with SMTP id
	j20-v6mr3403591pgh.28.1537647665588; 
	Sat, 22 Sep 2018 13:21:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	m27-v6sm42515591pff.152.2018.09.22.13.21.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Sep 2018 13:21:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2018 13:20:55 -0700
Message-Id: <20180922202055.4779-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH] musl: Bring in patches post 1.20 release
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
X-List-Received-Date: Sat, 22 Sep 2018 20:21:06 -0000
Content-Transfer-Encoding: 8bit

There have been regressions found in 1.20 release, this is cumulative
update to bring these changes and drops the local patches which have
been upstreamed in this delta

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=0fa1e638e87cf257e9f96b4019b2076afd674a19..c50985d5c8e316c5c464f352e79eeebfed1121a9

License-Update: Dropped BSD Prng implementation

https://git.musl-libc.org/cgit/musl/commit/COPYRIGHT?id=c50985d5c8e316c5c464f352e79eeebfed1121a9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl.inc               |  2 +-
 .../musl/musl/0001-Define-MAX_HANDLE_SZ.patch | 29 -------
 ...e_to_handle_at-and-name_to_handle_at.patch | 76 -------------------
 meta/recipes-core/musl/musl_git.bb            |  4 +-
 4 files changed, 2 insertions(+), 109 deletions(-)
 delete mode 100644 meta/recipes-core/musl/musl/0001-Define-MAX_HANDLE_SZ.patch
 delete mode 100644 meta/recipes-core/musl/musl/0001-wireup-linux-name_to_handle_at-and-name_to_handle_at.patch

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index ba9b1a046c..319709b3cb 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -9,7 +9,7 @@ standards-conformance and safety."
 HOMEPAGE = "http://www.musl-libc.org/"
 LICENSE = "MIT"
 SECTION = "libs"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=2b9032093c4765e49ae85ddeba29afff"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8a4bb28f771c817fe57d3a7c4240e3aa"
 
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
diff --git a/meta/recipes-core/musl/musl/0001-Define-MAX_HANDLE_SZ.patch b/meta/recipes-core/musl/musl/0001-Define-MAX_HANDLE_SZ.patch
deleted file mode 100644
index b1217723a3..0000000000
--- a/meta/recipes-core/musl/musl/0001-Define-MAX_HANDLE_SZ.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e2e723cfe96ce6ed6558ed7e8fbb44b2283297da Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Sep 2018 06:57:28 -0700
-Subject: [PATCH] Define MAX_HANDLE_SZ
-
-MAX_HANDLE_SZ is described in name_to_handle_at() to contain maximum
-expected size for a file handle
-
-Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2018/09/13/16]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/fcntl.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/fcntl.h b/include/fcntl.h
-index 5c3defcb..6a8b6d49 100644
---- a/include/fcntl.h
-+++ b/include/fcntl.h
-@@ -166,6 +166,7 @@ struct f_owner_ex {
- };
- #define FALLOC_FL_KEEP_SIZE 1
- #define FALLOC_FL_PUNCH_HOLE 2
-+#define MAX_HANDLE_SZ 128
- #define SYNC_FILE_RANGE_WAIT_BEFORE 1
- #define SYNC_FILE_RANGE_WRITE 2
- #define SYNC_FILE_RANGE_WAIT_AFTER 4
--- 
-2.19.0
-
diff --git a/meta/recipes-core/musl/musl/0001-wireup-linux-name_to_handle_at-and-name_to_handle_at.patch b/meta/recipes-core/musl/musl/0001-wireup-linux-name_to_handle_at-and-name_to_handle_at.patch
deleted file mode 100644
index 4738e1efd8..0000000000
--- a/meta/recipes-core/musl/musl/0001-wireup-linux-name_to_handle_at-and-name_to_handle_at.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From ef3ef607693a9513d5ab94a1de67dd2f1f97d8ad Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Sep 2018 16:08:40 -0700
-Subject: [PATCH] wireup linux/name_to_handle_at and name_to_handle_at syscalls
-
-Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2018/09/13/4]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/fcntl.h               |  7 +++++++
- src/linux/name_to_handle_at.c | 11 +++++++++++
- src/linux/open_by_handle_at.c | 10 ++++++++++
- 3 files changed, 28 insertions(+)
- create mode 100644 src/linux/name_to_handle_at.c
- create mode 100644 src/linux/open_by_handle_at.c
-
-diff --git a/include/fcntl.h b/include/fcntl.h
-index 6d8edcd1..5c3defcb 100644
---- a/include/fcntl.h
-+++ b/include/fcntl.h
-@@ -155,6 +155,11 @@ int lockf(int, int, off_t);
- #define F_OWNER_PID 1
- #define F_OWNER_PGRP 2
- #define F_OWNER_GID 2
-+struct file_handle {
-+	unsigned int handle_bytes;
-+	int handle_type;
-+	unsigned char f_handle[];
-+};
- struct f_owner_ex {
- 	int type;
- 	pid_t pid;
-@@ -170,6 +175,8 @@ struct f_owner_ex {
- #define SPLICE_F_GIFT 8
- int fallocate(int, int, off_t, off_t);
- #define fallocate64 fallocate
-+int name_to_handle_at(int, const char *, struct file_handle *, int *, int);
-+int open_by_handle_at(int, struct file_handle *, int);
- ssize_t readahead(int, off_t, size_t);
- int sync_file_range(int, off_t, off_t, unsigned);
- ssize_t vmsplice(int, const struct iovec *, size_t, unsigned);
-diff --git a/src/linux/name_to_handle_at.c b/src/linux/name_to_handle_at.c
-new file mode 100644
-index 00000000..bb6f8007
---- /dev/null
-+++ b/src/linux/name_to_handle_at.c
-@@ -0,0 +1,11 @@
-+#define _GNU_SOURCE
-+#include <fcntl.h>
-+#include "syscall.h"
-+
-+int name_to_handle_at(int dirfd, const char *pathname,
-+			struct file_handle *handle,
-+			int *mount_id, int flags)
-+{
-+	return syscall(SYS_name_to_handle_at, dirfd,
-+		pathname, handle, mount_id, flags);
-+}
-diff --git a/src/linux/open_by_handle_at.c b/src/linux/open_by_handle_at.c
-new file mode 100644
-index 00000000..9bc93f14
---- /dev/null
-+++ b/src/linux/open_by_handle_at.c
-@@ -0,0 +1,10 @@
-+#define _GNU_SOURCE
-+#include <fcntl.h>
-+#include "syscall.h"
-+
-+int open_by_handle_at(int mount_fd, struct file_handle *handle,
-+                             int flags)
-+{
-+	return syscall(SYS_open_by_handle_at, mount_fd,
-+		handle, flags);
-+}
--- 
-2.19.0
-
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index f0556533b5..0d8f8eb2a4 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "0fa1e638e87cf257e9f96b4019b2076afd674a19"
+SRCREV = "c50985d5c8e316c5c464f352e79eeebfed1121a9"
 
 PV = "1.1.20+git${SRCPV}"
 
@@ -12,8 +12,6 @@ PV = "1.1.20+git${SRCPV}"
 
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
-           file://0001-wireup-linux-name_to_handle_at-and-name_to_handle_at.patch \
-           file://0001-Define-MAX_HANDLE_SZ.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.19.0


