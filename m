Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97346C27C53
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.5953.1689456455570575700
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=S3ARXmcp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101895b73ac82-8030a6ae-eea8-4b56-9b90-f04d4a304f4a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qbDz8BuI/x5ksYZWSUPawfSPtQ912DqAN14eigBJEUQ=;
	b=S3ARXmcpprYCSt+BMwMMR5nAY/y6UcF5yDJmgm8i0Jll/g+Nv6zFN4T3hlIpBUjW
	Y2Sou8GtTEJ6SwC95NgTOmRRGYbfgdzDO9n7YwBXitj2M47exOv4agXqmxFhjOrBygR
	NIfdvrRy7KemGLrcKnTsVg2TeEyJQcqbFWwfcBbE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qbDz8BuI/x5ksYZWSUPawfSPtQ912DqAN14eigBJEUQ=;
	b=rBLfttP0L4Q2cUKJFh4607agVR0PMgs9Gw7cpjUnOwD8h0Nm3p+zeDVy+vLd4X5I
	QgXoKOGuJ8cI5f1aCSygsitEs3XWXumE8zo89AwmYL6vlS54NVciDFGDonUS0JjyZcb
	Nr4pCsR0uLsj6DxKb1SkFcMCs5qyRX1Sv9ryIspM=
Content-Type: multipart/mixed; boundary="===============5384330087660662928=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] strace: upgrading to 6.4 SUCCEEDED
Message-ID: <010101895b73ac82-8030a6ae-eea8-4b56-9b90-f04d4a304f4a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184359

--===============5384330087660662928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *strace* to *6.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-strace-upgrade-6.3-6.4.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From cb5d26c942fed2888b34577bc62273e5a795b6f8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 14:42:13 +0000
Subject: [PATCH] strace: upgrade 6.3 -> 6.4

---
 ...e1392f5bd289239b755458dcdeeed69af1da.patch | 303 ------------------
 ...b541b258baec9eba674b5d8dc30007a61542.patch |  50 ---
 ...2f4494779e5c5f170ad10539bfc2dfafe967.patch |  50 ---
 .../strace/{strace_6.3.bb => strace_6.4.bb}   |   5 +-
 4 files changed, 1 insertion(+), 407 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/00ace1392f5bd289239b755458dcdeeed69af1da.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch
 rename meta/recipes-devtools/strace/{strace_6.3.bb => strace_6.4.bb} (88%)

diff --git a/meta/recipes-devtools/strace/strace/00ace1392f5bd289239b755458dcdeeed69af1da.patch b/meta/recipes-devtools/strace/strace/00ace1392f5bd289239b755458dcdeeed69af1da.patch
deleted file mode 100644
index bdf815e55e..0000000000
--- a/meta/recipes-devtools/strace/strace/00ace1392f5bd289239b755458dcdeeed69af1da.patch
+++ /dev/null
@@ -1,303 +0,0 @@
-From 00ace1392f5bd289239b755458dcdeeed69af1da Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@strace.io>
-Date: Mon, 26 Jun 2023 10:00:00 +0000
-Subject: [PATCH] tests: avoid accept() libc function when tracing accept()
- syscall
-
-The libc function is allowed to implement accept() using accept4()
-syscall, so migrate to accept4() those tests that trace accept() syscall
-but do not test accept() specifically, and change the test of accept()
-syscall to invoke either __NR_accept or __NR_socketcall(SYS_ACCEPT)
-directly.
-
-* tests/accept_compat.h: Remove.
-* tests/Makefile.am (EXTRA_DIST): Remove accept_compat.h.
-* tests/accept.c [TEST_SYSCALL_NAME]: Do not invoke accept(),
-call __NR_accept or __NR_socketcall if available, or skip the test.
-* tests/net-y-unix.c: Do not include "accept_compat.h".
-(main): Invoke accept4() instead of accept().
-* tests/net-yy-inet.c: Likewise.
-* tests/net-yy-unix.c: Likewise.
-
-Resolves: https://github.com/strace/strace/issues/260
-
-Upstream-Status: Backport
----
- tests/Makefile.am     |  1 -
- tests/accept.c        | 36 ++++++++++++++++++++----------------
- tests/accept_compat.h | 32 --------------------------------
- tests/net-y-unix.c    | 16 ++++++++--------
- tests/net-yy-inet.c   | 12 ++++++------
- tests/net-yy-unix.c   | 16 ++++++++--------
- 6 files changed, 42 insertions(+), 71 deletions(-)
- delete mode 100644 tests/accept_compat.h
-
-Index: strace-6.3/tests/Makefile.am
-===================================================================
---- strace-6.3.orig/tests/Makefile.am
-+++ strace-6.3/tests/Makefile.am
-@@ -776,7 +776,6 @@ check_DATA = \
- 	# end of check_DATA
- 
- EXTRA_DIST = \
--	accept_compat.h \
- 	attach-p-cmd.h \
- 	clock_adjtime-common.c \
- 	clock_xettime-common.c \
-Index: strace-6.3/tests/accept.c
-===================================================================
---- strace-6.3.orig/tests/accept.c
-+++ strace-6.3/tests/accept.c
-@@ -9,38 +9,36 @@
-  */
- 
- #include "tests.h"
--
-+#include "scno.h"
- #include <unistd.h>
- 
--#include "scno.h"
-+#ifndef TEST_SYSCALL_NAME
- 
--#if defined __NR_accept
-+# if defined __NR_accept || defined __NR_socketcall
- 
--# ifndef TEST_SYSCALL_NAME
- #  define TEST_SYSCALL_NAME do_accept
--
--#  ifndef TEST_SYSCALL_STR
--#   define TEST_SYSCALL_STR "accept"
--#  endif
-+#  define TEST_SYSCALL_STR "accept"
- 
- static int
- do_accept(int sockfd, void *addr, void *addrlen)
- {
-+#  ifdef __NR_accept
- 	return syscall(__NR_accept, sockfd, addr, addrlen);
-+#  else /* __NR_socketcall */
-+	const long args[] = { sockfd, (long) addr, (long) addrlen };
-+	return syscall(__NR_socketcall, 5, args);
-+#  endif
- }
--# endif /* !TEST_SYSCALL_NAME */
- 
--#else /* !__NR_accept */
-+# endif /* __NR_accept || __NR_socketcall */
- 
--# ifndef TEST_SYSCALL_NAME
--#  define TEST_SYSCALL_NAME accept
--# endif
-+#endif /* !TEST_SYSCALL_NAME */
- 
--#endif /* __NR_accept */
-+#ifdef TEST_SYSCALL_NAME
- 
--#define TEST_SYSCALL_PREPARE connect_un()
-+# define TEST_SYSCALL_PREPARE connect_un()
- static void connect_un(void);
--#include "sockname.c"
-+# include "sockname.c"
- 
- static void
- connect_un(void)
-@@ -90,3 +88,9 @@ main(void)
- 	puts("+++ exited with 0 +++");
- 	return 0;
- }
-+
-+#else
-+
-+SKIP_MAIN_UNDEFINED("__NR_accept || __NR_socketcall")
-+
-+#endif
-Index: strace-6.3/tests/accept_compat.h
-===================================================================
---- strace-6.3.orig/tests/accept_compat.h
-+++ /dev/null
-@@ -1,32 +0,0 @@
--/*
-- * Copyright (c) 2018-2019 The strace developers.
-- * All rights reserved.
-- *
-- * SPDX-License-Identifier: GPL-2.0-or-later
-- */
--
--#ifndef _STRACE_TESTS_ACCEPT_COMPAT_H_
--# define _STRACE_TESTS_ACCEPT_COMPAT_H_
--
--# include <unistd.h>
--# include <sys/socket.h>
--# include "scno.h"
--
--# if defined __NR_socketcall && defined __sparc__
--/*
-- * Work around the fact that
-- * - glibc >= 2.26 uses accept4 syscall to implement accept() call on sparc;
-- * - accept syscall had not been wired up on sparc until v4.4-rc8~4^2~1.
-- */
--static inline int
--do_accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen)
--{
--	const long args[] = { sockfd, (long) addr, (long) addrlen };
--
--	return syscall(__NR_socketcall, 5, args);
--}
--# else
--#  define do_accept accept
--# endif
--
--#endif /* !_STRACE_TESTS_ACCEPT_COMPAT_H_ */
-Index: strace-6.3/tests/net-y-unix.c
-===================================================================
---- strace-6.3.orig/tests/net-y-unix.c
-+++ strace-6.3/tests/net-y-unix.c
-@@ -10,6 +10,7 @@
- 
- #include "tests.h"
- #include <assert.h>
-+#include <fcntl.h>
- #include <stddef.h>
- #include <stdio.h>
- #include <stdlib.h>
-@@ -18,8 +19,6 @@
- #include <sys/socket.h>
- #include <sys/un.h>
- 
--#include "accept_compat.h"
--
- #define TEST_SOCKET "net-y-unix.socket"
- 
- int
-@@ -88,12 +87,12 @@ main(void)
- 	struct sockaddr * const accept_sa = tail_alloc(sizeof(addr));
- 	memset(accept_sa, 0, sizeof(addr));
- 	*len = sizeof(addr);
--	int accept_fd = do_accept(listen_fd, accept_sa, len);
-+	int accept_fd = accept4(listen_fd, accept_sa, len, O_CLOEXEC);
- 	if (accept_fd < 0)
- 		perror_msg_and_fail("accept");
- 	unsigned long accept_inode = inode_of_sockfd(accept_fd);
--	printf("accept(%d<socket:[%lu]>, {sa_family=AF_UNIX}"
--	       ", [%d => %d]) = %d<socket:[%lu]>\n",
-+	printf("accept4(%d<socket:[%lu]>, {sa_family=AF_UNIX}"
-+	       ", [%d => %d], SOCK_CLOEXEC) = %d<socket:[%lu]>\n",
- 	       listen_fd, listen_inode,
- 	       (int) sizeof(addr), (int) *len,
- 	       accept_fd, accept_inode);
-@@ -160,14 +159,15 @@ main(void)
- 
- 	memset(accept_sa, 0, sizeof(addr));
- 	*len = sizeof(addr);
--	accept_fd = do_accept(listen_fd, accept_sa, len);
-+	accept_fd = accept4(listen_fd, accept_sa, len, O_CLOEXEC);
- 	if (accept_fd < 0)
- 		perror_msg_and_fail("accept");
- 	accept_inode = inode_of_sockfd(accept_fd);
- 	const char * const sun_path1 =
- 		((struct sockaddr_un *) accept_sa)->sun_path + 1;
--	printf("accept(%d<socket:[%lu]>, {sa_family=AF_UNIX"
--	       ", sun_path=@\"%s\"}, [%d => %d]) = %d<socket:[%lu]>\n",
-+	printf("accept4(%d<socket:[%lu]>, {sa_family=AF_UNIX"
-+	       ", sun_path=@\"%s\"}, [%d => %d], SOCK_CLOEXEC)"
-+	       " = %d<socket:[%lu]>\n",
- 	       listen_fd, listen_inode, sun_path1,
- 	       (int) sizeof(addr), (int) *len,
- 	       accept_fd, accept_inode);
-Index: strace-6.3/tests/net-yy-inet.c
-===================================================================
---- strace-6.3.orig/tests/net-yy-inet.c
-+++ strace-6.3/tests/net-yy-inet.c
-@@ -10,6 +10,7 @@
- 
- #include "tests.h"
- #include <assert.h>
-+#include <fcntl.h>
- #include <stddef.h>
- #include <stdio.h>
- #include <string.h>
-@@ -19,8 +20,6 @@
- #include <netinet/tcp.h>
- #include <arpa/inet.h>
- 
--#include "accept_compat.h"
--
- #ifndef ADDR_FAMILY
- # define ADDR_FAMILY_FIELD sin_family
- # define ADDR_FAMILY AF_INET
-@@ -104,14 +103,15 @@ main(void)
- 	struct sockaddr * const accept_sa = tail_alloc(sizeof(addr));
- 	memset(accept_sa, 0, sizeof(addr));
- 	*len = sizeof(addr);
--	const int accept_fd = do_accept(listen_fd, accept_sa, len);
-+	const int accept_fd = accept4(listen_fd, accept_sa, len, O_CLOEXEC);
- 	if (accept_fd < 0)
- 		perror_msg_and_fail("accept");
- 	const unsigned int connect_port =
- 		ntohs(((struct SOCKADDR_TYPE *) accept_sa)->INPORT);
--	printf("accept(%d<" TCP_STR ":[" LOOPBACK ":%u]>, {sa_family=" AF_STR
--	       ", " INPORT_STR "=htons(%u), " INADDR_STR SA_FIELDS "}"
--	       ", [%u]) = %d<" TCP_STR ":[" LOOPBACK ":%u->" LOOPBACK ":%u]>\n",
-+	printf("accept4(%d<" TCP_STR ":[" LOOPBACK ":%u]>, {sa_family=" AF_STR
-+	       ", " INPORT_STR "=htons(%u), " INADDR_STR SA_FIELDS "}, [%u]"
-+	       ", SOCK_CLOEXEC) = %d<" TCP_STR ":[" LOOPBACK ":%u->" LOOPBACK
-+	       ":%u]>\n",
- 	       listen_fd, listen_port, connect_port, (unsigned) *len,
- 	       accept_fd, listen_port, connect_port);
- 
-Index: strace-6.3/tests/net-yy-unix.c
-===================================================================
---- strace-6.3.orig/tests/net-yy-unix.c
-+++ strace-6.3/tests/net-yy-unix.c
-@@ -10,6 +10,7 @@
- 
- #include "tests.h"
- #include <assert.h>
-+#include <fcntl.h>
- #include <stddef.h>
- #include <stdio.h>
- #include <stdlib.h>
-@@ -22,8 +23,6 @@
- # include "xmalloc.h"
- #endif
- 
--#include "accept_compat.h"
--
- #define TEST_SOCKET "net-yy-unix.socket"
- 
- int
-@@ -112,12 +111,12 @@ main(void)
- 	struct sockaddr * const accept_sa = tail_alloc(sizeof(addr));
- 	memset(accept_sa, 0, sizeof(addr));
- 	*len = sizeof(addr);
--	int accept_fd = do_accept(listen_fd, accept_sa, len);
-+	int accept_fd = accept4(listen_fd, accept_sa, len, O_CLOEXEC);
- 	if (accept_fd < 0)
- 		perror_msg_and_fail("accept");
- 	unsigned long accept_inode = inode_of_sockfd(accept_fd);
--	printf("accept(%d<%s:[%lu,\"%s\"]>, {sa_family=AF_UNIX}"
--	       ", [%d => %d]) = %d<%s:[%lu->%lu,\"%s\"]>\n",
-+	printf("accept4(%d<%s:[%lu,\"%s\"]>, {sa_family=AF_UNIX}"
-+	       ", [%d => %d], SOCK_CLOEXEC) = %d<%s:[%lu->%lu,\"%s\"]>\n",
- 	       listen_fd, sock_proto_name, listen_inode, TEST_SOCKET,
- 	       (int) sizeof(addr), (int) *len,
- 	       accept_fd, sock_proto_name, accept_inode, connect_inode,
-@@ -191,14 +190,15 @@ main(void)
- 
- 	memset(accept_sa, 0, sizeof(addr));
- 	*len = sizeof(addr);
--	accept_fd = do_accept(listen_fd, accept_sa, len);
-+	accept_fd = accept4(listen_fd, accept_sa, len, O_CLOEXEC);
- 	if (accept_fd < 0)
- 		perror_msg_and_fail("accept");
- 	accept_inode = inode_of_sockfd(accept_fd);
- 	const char * const sun_path1 =
- 		((struct sockaddr_un *) accept_sa)->sun_path + 1;
--	printf("accept(%d<%s:[%lu,\"%s\"]>, {sa_family=AF_UNIX"
--	       ", sun_path=@\"%s\"}, [%d => %d]) = %d<%s:[%lu->%lu,\"%s\"]>\n",
-+	printf("accept4(%d<%s:[%lu,\"%s\"]>, {sa_family=AF_UNIX"
-+	       ", sun_path=@\"%s\"}, [%d => %d], SOCK_CLOEXEC)"
-+	       " = %d<%s:[%lu->%lu,\"%s\"]>\n",
- 	       listen_fd, sock_proto_name, listen_inode, TEST_SOCKET,
- 	       sun_path1, (int) sizeof(addr), (int) *len,
- 	       accept_fd, sock_proto_name, accept_inode, connect_inode,
diff --git a/meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch b/meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch
deleted file mode 100644
index b4c6ff99de..0000000000
--- a/meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 3bbfb541b258baec9eba674b5d8dc30007a61542 Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@strace.io>
-Date: Wed, 21 Jun 2023 08:00:00 +0000
-Subject: [PATCH] net: enhance getsockopt decoding
-
-When getsockopt syscall fails the kernel sometimes updates the optlen
-argument, for example, NETLINK_LIST_MEMBERSHIPS updates it even if
-optval is not writable.
-
-* src/net.c (SYS_FUNC(getsockopt)): Try to fetch and print optlen
-argument on exiting syscall regardless of getsockopt exit status.
-
-Upstream-Status: Backport
----
- src/net.c | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/src/net.c b/src/net.c
-index f68ccb947..7244b5e57 100644
---- a/src/net.c
-+++ b/src/net.c
-@@ -1038,7 +1038,7 @@ SYS_FUNC(getsockopt)
- 	} else {
- 		ulen = get_tcb_priv_ulong(tcp);
- 
--		if (syserror(tcp) || umove(tcp, tcp->u_arg[4], &rlen) < 0) {
-+		if (umove(tcp, tcp->u_arg[4], &rlen) < 0) {
- 			/* optval */
- 			printaddr(tcp->u_arg[3]);
- 			tprint_arg_next();
-@@ -1047,6 +1047,19 @@ SYS_FUNC(getsockopt)
- 			tprint_indirect_begin();
- 			PRINT_VAL_D(ulen);
- 			tprint_indirect_end();
-+		} else if (syserror(tcp)) {
-+			/* optval */
-+			printaddr(tcp->u_arg[3]);
-+			tprint_arg_next();
-+
-+			/* optlen */
-+			tprint_indirect_begin();
-+			if (ulen != rlen) {
-+				PRINT_VAL_D(ulen);
-+				tprint_value_changed();
-+			}
-+			PRINT_VAL_D(rlen);
-+			tprint_indirect_end();
- 		} else {
- 			/* optval */
- 			print_getsockopt(tcp, tcp->u_arg[1], tcp->u_arg[2],
diff --git a/meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch b/meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch
deleted file mode 100644
index a0843836c2..0000000000
--- a/meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From f31c2f4494779e5c5f170ad10539bfc2dfafe967 Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@strace.io>
-Date: Sat, 24 Jun 2023 08:00:00 +0000
-Subject: [PATCH] tests: update sockopt-sol_netlink test
-
-Update sockopt-sol_netlink test that started to fail, likely
-due to recent linux kernel commit f4e4534850a9 ("net/netlink: fix
-NETLINK_LIST_MEMBERSHIPS length report").
-
-* tests/sockopt-sol_netlink.c (main): Always print changing optlen value
-on exiting syscall.
-
-Reported-by: Alexander Gordeev <agordeev@linux.ibm.com>
----
- tests/sockopt-sol_netlink.c | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-Upstream-Status: Backport
-
-diff --git a/tests/sockopt-sol_netlink.c b/tests/sockopt-sol_netlink.c
-index 82b98adc23..1c33219ac5 100644
---- a/tests/sockopt-sol_netlink.c
-+++ b/tests/sockopt-sol_netlink.c
-@@ -94,7 +94,10 @@ main(void)
- 			printf("%p", val);
- 		else
- 			printf("[%d]", *val);
--		printf(", [%d]) = %s\n", *len, errstr);
-+		printf(", [%d", (int) sizeof(*val));
-+		if ((int) sizeof(*val) != *len)
-+			printf(" => %d", *len);
-+		printf("]) = %s\n", errstr);
- 
- 		/* optlen larger than necessary - shortened */
- 		*len = sizeof(*val) + 1;
-@@ -150,8 +153,12 @@ main(void)
- 		/* optval EFAULT - print address */
- 		*len = sizeof(*val);
- 		get_sockopt(fd, names[i].val, efault, len);
--		printf("getsockopt(%d, SOL_NETLINK, %s, %p, [%d]) = %s\n",
--		       fd, names[i].str, efault, *len, errstr);
-+		printf("getsockopt(%d, SOL_NETLINK, %s, %p",
-+		       fd, names[i].str, efault);
-+		printf(", [%d", (int) sizeof(*val));
-+		if ((int) sizeof(*val) != *len)
-+			printf(" => %d", *len);
-+		printf("]) = %s\n", errstr);
- 
- 		/* optlen EFAULT - print address */
- 		get_sockopt(fd, names[i].val, val, len + 1);
diff --git a/meta/recipes-devtools/strace/strace_6.3.bb b/meta/recipes-devtools/strace/strace_6.4.bb
similarity index 88%
rename from meta/recipes-devtools/strace/strace_6.3.bb
rename to meta/recipes-devtools/strace/strace_6.4.bb
index a47cc71724..2174790fbe 100644
--- a/meta/recipes-devtools/strace/strace_6.3.bb
+++ b/meta/recipes-devtools/strace/strace_6.4.bb
@@ -14,11 +14,8 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
-           file://00ace1392f5bd289239b755458dcdeeed69af1da.patch \
-           file://f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch \
-           file://3bbfb541b258baec9eba674b5d8dc30007a61542.patch \
            "
-SRC_URI[sha256sum] = "e17878e301506c1cc301611118ad14efee7f8bcef63b27ace5d290acce7bb731"
+SRC_URI[sha256sum] = "27987dbac57fdfd260c6db4dc8328df35c95c6867c8a3d4371d59cdcf4eb9238"
 
 inherit autotools ptest
 
-- 
2.39.2


--===============5384330087660662928==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-strace-upgrade-6.3-6.4.patch"

RnJvbSBjYjVkMjZjOTQyZmVkMjg4OGIzNDU3N2JjNjIyNzNlNWE3OTViNmY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTQ6NDI6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dHJhY2U6IHVwZ3JhZGUgNi4zIC0+IDYuNAoKLS0tCiAuLi5lMTM5MmY1YmQyODkyMzliNzU1NDU4
ZGNkZWVlZDY5YWYxZGEucGF0Y2ggfCAzMDMgLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi5iNTQxYjI1
OGJhZWM5ZWJhNjc0YjVkOGRjMzAwMDdhNjE1NDIucGF0Y2ggfCAgNTAgLS0tCiAuLi4yZjQ0OTQ3
NzllNWM1ZjE3MGFkMTA1MzliZmMyZGZhZmU5NjcucGF0Y2ggfCAgNTAgLS0tCiAuLi4vc3RyYWNl
L3tzdHJhY2VfNi4zLmJiID0+IHN0cmFjZV82LjQuYmJ9ICAgfCAgIDUgKy0KIDQgZmlsZXMgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDQwNyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMGFjZTEzOTJmNWJkMjg5MjM5
Yjc1NTQ1OGRjZGVlZWQ2OWFmMWRhLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvM2JiZmI1NDFiMjU4YmFlYzllYmE2NzRiNWQ4ZGMz
MDAwN2E2MTU0Mi5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9zdHJhY2Uvc3RyYWNlL2YzMWMyZjQ0OTQ3NzllNWM1ZjE3MGFkMTA1MzliZmMyZGZhZmU5Njcu
cGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3tzdHJhY2VfNi4zLmJi
ID0+IHN0cmFjZV82LjQuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3N0cmFjZS9zdHJhY2UvMDBhY2UxMzkyZjViZDI4OTIzOWI3NTU0NThkY2RlZWVkNjlhZjFk
YS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlLzAwYWNlMTM5MmY1
YmQyODkyMzliNzU1NDU4ZGNkZWVlZDY5YWYxZGEucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IGJkZjgxNWU1NWUuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3N0cmFjZS9zdHJhY2UvMDBhY2UxMzkyZjViZDI4OTIzOWI3NTU0NThkY2RlZWVkNjlhZjFk
YS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDMwMyArMCwwIEBACi1Gcm9tIDAwYWNlMTM5MmY1
YmQyODkyMzliNzU1NDU4ZGNkZWVlZDY5YWYxZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiAiRG1pdHJ5IFYuIExldmluIiA8bGR2QHN0cmFjZS5pbz4KLURhdGU6IE1vbiwgMjYgSnVu
IDIwMjMgMTA6MDA6MDAgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGF2b2lkIGFjY2Vw
dCgpIGxpYmMgZnVuY3Rpb24gd2hlbiB0cmFjaW5nIGFjY2VwdCgpCi0gc3lzY2FsbAotCi1UaGUg
bGliYyBmdW5jdGlvbiBpcyBhbGxvd2VkIHRvIGltcGxlbWVudCBhY2NlcHQoKSB1c2luZyBhY2Nl
cHQ0KCkKLXN5c2NhbGwsIHNvIG1pZ3JhdGUgdG8gYWNjZXB0NCgpIHRob3NlIHRlc3RzIHRoYXQg
dHJhY2UgYWNjZXB0KCkgc3lzY2FsbAotYnV0IGRvIG5vdCB0ZXN0IGFjY2VwdCgpIHNwZWNpZmlj
YWxseSwgYW5kIGNoYW5nZSB0aGUgdGVzdCBvZiBhY2NlcHQoKQotc3lzY2FsbCB0byBpbnZva2Ug
ZWl0aGVyIF9fTlJfYWNjZXB0IG9yIF9fTlJfc29ja2V0Y2FsbChTWVNfQUNDRVBUKQotZGlyZWN0
bHkuCi0KLSogdGVzdHMvYWNjZXB0X2NvbXBhdC5oOiBSZW1vdmUuCi0qIHRlc3RzL01ha2VmaWxl
LmFtIChFWFRSQV9ESVNUKTogUmVtb3ZlIGFjY2VwdF9jb21wYXQuaC4KLSogdGVzdHMvYWNjZXB0
LmMgW1RFU1RfU1lTQ0FMTF9OQU1FXTogRG8gbm90IGludm9rZSBhY2NlcHQoKSwKLWNhbGwgX19O
Ul9hY2NlcHQgb3IgX19OUl9zb2NrZXRjYWxsIGlmIGF2YWlsYWJsZSwgb3Igc2tpcCB0aGUgdGVz
dC4KLSogdGVzdHMvbmV0LXktdW5peC5jOiBEbyBub3QgaW5jbHVkZSAiYWNjZXB0X2NvbXBhdC5o
Ii4KLShtYWluKTogSW52b2tlIGFjY2VwdDQoKSBpbnN0ZWFkIG9mIGFjY2VwdCgpLgotKiB0ZXN0
cy9uZXQteXktaW5ldC5jOiBMaWtld2lzZS4KLSogdGVzdHMvbmV0LXl5LXVuaXguYzogTGlrZXdp
c2UuCi0KLVJlc29sdmVzOiBodHRwczovL2dpdGh1Yi5jb20vc3RyYWNlL3N0cmFjZS9pc3N1ZXMv
MjYwCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKLS0tLQotIHRlc3RzL01ha2VmaWxlLmFt
ICAgICB8ICAxIC0KLSB0ZXN0cy9hY2NlcHQuYyAgICAgICAgfCAzNiArKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0KLSB0ZXN0cy9hY2NlcHRfY29tcGF0LmggfCAzMiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotIHRlc3RzL25ldC15LXVuaXguYyAgICB8IDE2ICsr
KysrKysrLS0tLS0tLS0KLSB0ZXN0cy9uZXQteXktaW5ldC5jICAgfCAxMiArKysrKystLS0tLS0K
LSB0ZXN0cy9uZXQteXktdW5peC5jICAgfCAxNiArKysrKysrKy0tLS0tLS0tCi0gNiBmaWxlcyBj
aGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCA3MSBkZWxldGlvbnMoLSkKLSBkZWxldGUgbW9kZSAx
MDA2NDQgdGVzdHMvYWNjZXB0X2NvbXBhdC5oCi0KLUluZGV4OiBzdHJhY2UtNi4zL3Rlc3RzL01h
a2VmaWxlLmFtCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gc3RyYWNlLTYuMy5vcmlnL3Rlc3RzL01ha2VmaWxl
LmFtCi0rKysgc3RyYWNlLTYuMy90ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTc3Niw3ICs3NzYsNiBA
QCBjaGVja19EQVRBID0gXAotIAkjIGVuZCBvZiBjaGVja19EQVRBCi0gCi0gRVhUUkFfRElTVCA9
IFwKLS0JYWNjZXB0X2NvbXBhdC5oIFwKLSAJYXR0YWNoLXAtY21kLmggXAotIAljbG9ja19hZGp0
aW1lLWNvbW1vbi5jIFwKLSAJY2xvY2tfeGV0dGltZS1jb21tb24uYyBcCi1JbmRleDogc3RyYWNl
LTYuMy90ZXN0cy9hY2NlcHQuYwotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIHN0cmFjZS02LjMub3JpZy90ZXN0
cy9hY2NlcHQuYwotKysrIHN0cmFjZS02LjMvdGVzdHMvYWNjZXB0LmMKLUBAIC05LDM4ICs5LDM2
IEBACi0gICovCi0gCi0gI2luY2x1ZGUgInRlc3RzLmgiCi0tCi0rI2luY2x1ZGUgInNjbm8uaCIK
LSAjaW5jbHVkZSA8dW5pc3RkLmg+Ci0gCi0tI2luY2x1ZGUgInNjbm8uaCIKLSsjaWZuZGVmIFRF
U1RfU1lTQ0FMTF9OQU1FCi0gCi0tI2lmIGRlZmluZWQgX19OUl9hY2NlcHQKLSsjIGlmIGRlZmlu
ZWQgX19OUl9hY2NlcHQgfHwgZGVmaW5lZCBfX05SX3NvY2tldGNhbGwKLSAKLS0jIGlmbmRlZiBU
RVNUX1NZU0NBTExfTkFNRQotICMgIGRlZmluZSBURVNUX1NZU0NBTExfTkFNRSBkb19hY2NlcHQK
LS0KLS0jICBpZm5kZWYgVEVTVF9TWVNDQUxMX1NUUgotLSMgICBkZWZpbmUgVEVTVF9TWVNDQUxM
X1NUUiAiYWNjZXB0IgotLSMgIGVuZGlmCi0rIyAgZGVmaW5lIFRFU1RfU1lTQ0FMTF9TVFIgImFj
Y2VwdCIKLSAKLSBzdGF0aWMgaW50Ci0gZG9fYWNjZXB0KGludCBzb2NrZmQsIHZvaWQgKmFkZHIs
IHZvaWQgKmFkZHJsZW4pCi0gewotKyMgIGlmZGVmIF9fTlJfYWNjZXB0Ci0gCXJldHVybiBzeXNj
YWxsKF9fTlJfYWNjZXB0LCBzb2NrZmQsIGFkZHIsIGFkZHJsZW4pOwotKyMgIGVsc2UgLyogX19O
Ul9zb2NrZXRjYWxsICovCi0rCWNvbnN0IGxvbmcgYXJnc1tdID0geyBzb2NrZmQsIChsb25nKSBh
ZGRyLCAobG9uZykgYWRkcmxlbiB9OwotKwlyZXR1cm4gc3lzY2FsbChfX05SX3NvY2tldGNhbGws
IDUsIGFyZ3MpOwotKyMgIGVuZGlmCi0gfQotLSMgZW5kaWYgLyogIVRFU1RfU1lTQ0FMTF9OQU1F
ICovCi0gCi0tI2Vsc2UgLyogIV9fTlJfYWNjZXB0ICovCi0rIyBlbmRpZiAvKiBfX05SX2FjY2Vw
dCB8fCBfX05SX3NvY2tldGNhbGwgKi8KLSAKLS0jIGlmbmRlZiBURVNUX1NZU0NBTExfTkFNRQot
LSMgIGRlZmluZSBURVNUX1NZU0NBTExfTkFNRSBhY2NlcHQKLS0jIGVuZGlmCi0rI2VuZGlmIC8q
ICFURVNUX1NZU0NBTExfTkFNRSAqLwotIAotLSNlbmRpZiAvKiBfX05SX2FjY2VwdCAqLwotKyNp
ZmRlZiBURVNUX1NZU0NBTExfTkFNRQotIAotLSNkZWZpbmUgVEVTVF9TWVNDQUxMX1BSRVBBUkUg
Y29ubmVjdF91bigpCi0rIyBkZWZpbmUgVEVTVF9TWVNDQUxMX1BSRVBBUkUgY29ubmVjdF91bigp
Ci0gc3RhdGljIHZvaWQgY29ubmVjdF91bih2b2lkKTsKLS0jaW5jbHVkZSAic29ja25hbWUuYyIK
LSsjIGluY2x1ZGUgInNvY2tuYW1lLmMiCi0gCi0gc3RhdGljIHZvaWQKLSBjb25uZWN0X3VuKHZv
aWQpCi1AQCAtOTAsMyArODgsOSBAQCBtYWluKHZvaWQpCi0gCXB1dHMoIisrKyBleGl0ZWQgd2l0
aCAwICsrKyIpOwotIAlyZXR1cm4gMDsKLSB9Ci0rCi0rI2Vsc2UKLSsKLStTS0lQX01BSU5fVU5E
RUZJTkVEKCJfX05SX2FjY2VwdCB8fCBfX05SX3NvY2tldGNhbGwiKQotKwotKyNlbmRpZgotSW5k
ZXg6IHN0cmFjZS02LjMvdGVzdHMvYWNjZXB0X2NvbXBhdC5oCi09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gc3Ry
YWNlLTYuMy5vcmlnL3Rlc3RzL2FjY2VwdF9jb21wYXQuaAotKysrIC9kZXYvbnVsbAotQEAgLTEs
MzIgKzAsMCBAQAotLS8qCi0tICogQ29weXJpZ2h0IChjKSAyMDE4LTIwMTkgVGhlIHN0cmFjZSBk
ZXZlbG9wZXJzLgotLSAqIEFsbCByaWdodHMgcmVzZXJ2ZWQuCi0tICoKLS0gKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgotLSAqLwotLQotLSNpZm5kZWYgX1NUUkFD
RV9URVNUU19BQ0NFUFRfQ09NUEFUX0hfCi0tIyBkZWZpbmUgX1NUUkFDRV9URVNUU19BQ0NFUFRf
Q09NUEFUX0hfCi0tCi0tIyBpbmNsdWRlIDx1bmlzdGQuaD4KLS0jIGluY2x1ZGUgPHN5cy9zb2Nr
ZXQuaD4KLS0jIGluY2x1ZGUgInNjbm8uaCIKLS0KLS0jIGlmIGRlZmluZWQgX19OUl9zb2NrZXRj
YWxsICYmIGRlZmluZWQgX19zcGFyY19fCi0tLyoKLS0gKiBXb3JrIGFyb3VuZCB0aGUgZmFjdCB0
aGF0Ci0tICogLSBnbGliYyA+PSAyLjI2IHVzZXMgYWNjZXB0NCBzeXNjYWxsIHRvIGltcGxlbWVu
dCBhY2NlcHQoKSBjYWxsIG9uIHNwYXJjOwotLSAqIC0gYWNjZXB0IHN5c2NhbGwgaGFkIG5vdCBi
ZWVuIHdpcmVkIHVwIG9uIHNwYXJjIHVudGlsIHY0LjQtcmM4fjReMn4xLgotLSAqLwotLXN0YXRp
YyBpbmxpbmUgaW50Ci0tZG9fYWNjZXB0KGludCBzb2NrZmQsIHN0cnVjdCBzb2NrYWRkciAqYWRk
ciwgc29ja2xlbl90ICphZGRybGVuKQotLXsKLS0JY29uc3QgbG9uZyBhcmdzW10gPSB7IHNvY2tm
ZCwgKGxvbmcpIGFkZHIsIChsb25nKSBhZGRybGVuIH07Ci0tCi0tCXJldHVybiBzeXNjYWxsKF9f
TlJfc29ja2V0Y2FsbCwgNSwgYXJncyk7Ci0tfQotLSMgZWxzZQotLSMgIGRlZmluZSBkb19hY2Nl
cHQgYWNjZXB0Ci0tIyBlbmRpZgotLQotLSNlbmRpZiAvKiAhX1NUUkFDRV9URVNUU19BQ0NFUFRf
Q09NUEFUX0hfICovCi1JbmRleDogc3RyYWNlLTYuMy90ZXN0cy9uZXQteS11bml4LmMKLT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KLS0tLSBzdHJhY2UtNi4zLm9yaWcvdGVzdHMvbmV0LXktdW5peC5jCi0rKysgc3RyYWNl
LTYuMy90ZXN0cy9uZXQteS11bml4LmMKLUBAIC0xMCw2ICsxMCw3IEBACi0gCi0gI2luY2x1ZGUg
InRlc3RzLmgiCi0gI2luY2x1ZGUgPGFzc2VydC5oPgotKyNpbmNsdWRlIDxmY250bC5oPgotICNp
bmNsdWRlIDxzdGRkZWYuaD4KLSAjaW5jbHVkZSA8c3RkaW8uaD4KLSAjaW5jbHVkZSA8c3RkbGli
Lmg+Ci1AQCAtMTgsOCArMTksNiBAQAotICNpbmNsdWRlIDxzeXMvc29ja2V0Lmg+Ci0gI2luY2x1
ZGUgPHN5cy91bi5oPgotIAotLSNpbmNsdWRlICJhY2NlcHRfY29tcGF0LmgiCi0tCi0gI2RlZmlu
ZSBURVNUX1NPQ0tFVCAibmV0LXktdW5peC5zb2NrZXQiCi0gCi0gaW50Ci1AQCAtODgsMTIgKzg3
LDEyIEBAIG1haW4odm9pZCkKLSAJc3RydWN0IHNvY2thZGRyICogY29uc3QgYWNjZXB0X3NhID0g
dGFpbF9hbGxvYyhzaXplb2YoYWRkcikpOwotIAltZW1zZXQoYWNjZXB0X3NhLCAwLCBzaXplb2Yo
YWRkcikpOwotIAkqbGVuID0gc2l6ZW9mKGFkZHIpOwotLQlpbnQgYWNjZXB0X2ZkID0gZG9fYWNj
ZXB0KGxpc3Rlbl9mZCwgYWNjZXB0X3NhLCBsZW4pOwotKwlpbnQgYWNjZXB0X2ZkID0gYWNjZXB0
NChsaXN0ZW5fZmQsIGFjY2VwdF9zYSwgbGVuLCBPX0NMT0VYRUMpOwotIAlpZiAoYWNjZXB0X2Zk
IDwgMCkKLSAJCXBlcnJvcl9tc2dfYW5kX2ZhaWwoImFjY2VwdCIpOwotIAl1bnNpZ25lZCBsb25n
IGFjY2VwdF9pbm9kZSA9IGlub2RlX29mX3NvY2tmZChhY2NlcHRfZmQpOwotLQlwcmludGYoImFj
Y2VwdCglZDxzb2NrZXQ6WyVsdV0+LCB7c2FfZmFtaWx5PUFGX1VOSVh9IgotLQkgICAgICAgIiwg
WyVkID0+ICVkXSkgPSAlZDxzb2NrZXQ6WyVsdV0+XG4iLAotKwlwcmludGYoImFjY2VwdDQoJWQ8
c29ja2V0OlslbHVdPiwge3NhX2ZhbWlseT1BRl9VTklYfSIKLSsJICAgICAgICIsIFslZCA9PiAl
ZF0sIFNPQ0tfQ0xPRVhFQykgPSAlZDxzb2NrZXQ6WyVsdV0+XG4iLAotIAkgICAgICAgbGlzdGVu
X2ZkLCBsaXN0ZW5faW5vZGUsCi0gCSAgICAgICAoaW50KSBzaXplb2YoYWRkciksIChpbnQpICps
ZW4sCi0gCSAgICAgICBhY2NlcHRfZmQsIGFjY2VwdF9pbm9kZSk7Ci1AQCAtMTYwLDE0ICsxNTks
MTUgQEAgbWFpbih2b2lkKQotIAotIAltZW1zZXQoYWNjZXB0X3NhLCAwLCBzaXplb2YoYWRkcikp
OwotIAkqbGVuID0gc2l6ZW9mKGFkZHIpOwotLQlhY2NlcHRfZmQgPSBkb19hY2NlcHQobGlzdGVu
X2ZkLCBhY2NlcHRfc2EsIGxlbik7Ci0rCWFjY2VwdF9mZCA9IGFjY2VwdDQobGlzdGVuX2ZkLCBh
Y2NlcHRfc2EsIGxlbiwgT19DTE9FWEVDKTsKLSAJaWYgKGFjY2VwdF9mZCA8IDApCi0gCQlwZXJy
b3JfbXNnX2FuZF9mYWlsKCJhY2NlcHQiKTsKLSAJYWNjZXB0X2lub2RlID0gaW5vZGVfb2Zfc29j
a2ZkKGFjY2VwdF9mZCk7Ci0gCWNvbnN0IGNoYXIgKiBjb25zdCBzdW5fcGF0aDEgPQotIAkJKChz
dHJ1Y3Qgc29ja2FkZHJfdW4gKikgYWNjZXB0X3NhKS0+c3VuX3BhdGggKyAxOwotLQlwcmludGYo
ImFjY2VwdCglZDxzb2NrZXQ6WyVsdV0+LCB7c2FfZmFtaWx5PUFGX1VOSVgiCi0tCSAgICAgICAi
LCBzdW5fcGF0aD1AXCIlc1wifSwgWyVkID0+ICVkXSkgPSAlZDxzb2NrZXQ6WyVsdV0+XG4iLAot
KwlwcmludGYoImFjY2VwdDQoJWQ8c29ja2V0OlslbHVdPiwge3NhX2ZhbWlseT1BRl9VTklYIgot
KwkgICAgICAgIiwgc3VuX3BhdGg9QFwiJXNcIn0sIFslZCA9PiAlZF0sIFNPQ0tfQ0xPRVhFQyki
Ci0rCSAgICAgICAiID0gJWQ8c29ja2V0OlslbHVdPlxuIiwKLSAJICAgICAgIGxpc3Rlbl9mZCwg
bGlzdGVuX2lub2RlLCBzdW5fcGF0aDEsCi0gCSAgICAgICAoaW50KSBzaXplb2YoYWRkciksIChp
bnQpICpsZW4sCi0gCSAgICAgICBhY2NlcHRfZmQsIGFjY2VwdF9pbm9kZSk7Ci1JbmRleDogc3Ry
YWNlLTYuMy90ZXN0cy9uZXQteXktaW5ldC5jCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gc3RyYWNlLTYuMy5v
cmlnL3Rlc3RzL25ldC15eS1pbmV0LmMKLSsrKyBzdHJhY2UtNi4zL3Rlc3RzL25ldC15eS1pbmV0
LmMKLUBAIC0xMCw2ICsxMCw3IEBACi0gCi0gI2luY2x1ZGUgInRlc3RzLmgiCi0gI2luY2x1ZGUg
PGFzc2VydC5oPgotKyNpbmNsdWRlIDxmY250bC5oPgotICNpbmNsdWRlIDxzdGRkZWYuaD4KLSAj
aW5jbHVkZSA8c3RkaW8uaD4KLSAjaW5jbHVkZSA8c3RyaW5nLmg+Ci1AQCAtMTksOCArMjAsNiBA
QAotICNpbmNsdWRlIDxuZXRpbmV0L3RjcC5oPgotICNpbmNsdWRlIDxhcnBhL2luZXQuaD4KLSAK
LS0jaW5jbHVkZSAiYWNjZXB0X2NvbXBhdC5oIgotLQotICNpZm5kZWYgQUREUl9GQU1JTFkKLSAj
IGRlZmluZSBBRERSX0ZBTUlMWV9GSUVMRCBzaW5fZmFtaWx5Ci0gIyBkZWZpbmUgQUREUl9GQU1J
TFkgQUZfSU5FVAotQEAgLTEwNCwxNCArMTAzLDE1IEBAIG1haW4odm9pZCkKLSAJc3RydWN0IHNv
Y2thZGRyICogY29uc3QgYWNjZXB0X3NhID0gdGFpbF9hbGxvYyhzaXplb2YoYWRkcikpOwotIAlt
ZW1zZXQoYWNjZXB0X3NhLCAwLCBzaXplb2YoYWRkcikpOwotIAkqbGVuID0gc2l6ZW9mKGFkZHIp
OwotLQljb25zdCBpbnQgYWNjZXB0X2ZkID0gZG9fYWNjZXB0KGxpc3Rlbl9mZCwgYWNjZXB0X3Nh
LCBsZW4pOwotKwljb25zdCBpbnQgYWNjZXB0X2ZkID0gYWNjZXB0NChsaXN0ZW5fZmQsIGFjY2Vw
dF9zYSwgbGVuLCBPX0NMT0VYRUMpOwotIAlpZiAoYWNjZXB0X2ZkIDwgMCkKLSAJCXBlcnJvcl9t
c2dfYW5kX2ZhaWwoImFjY2VwdCIpOwotIAljb25zdCB1bnNpZ25lZCBpbnQgY29ubmVjdF9wb3J0
ID0KLSAJCW50b2hzKCgoc3RydWN0IFNPQ0tBRERSX1RZUEUgKikgYWNjZXB0X3NhKS0+SU5QT1JU
KTsKLS0JcHJpbnRmKCJhY2NlcHQoJWQ8IiBUQ1BfU1RSICI6WyIgTE9PUEJBQ0sgIjoldV0+LCB7
c2FfZmFtaWx5PSIgQUZfU1RSCi0tCSAgICAgICAiLCAiIElOUE9SVF9TVFIgIj1odG9ucygldSks
ICIgSU5BRERSX1NUUiBTQV9GSUVMRFMgIn0iCi0tCSAgICAgICAiLCBbJXVdKSA9ICVkPCIgVENQ
X1NUUiAiOlsiIExPT1BCQUNLICI6JXUtPiIgTE9PUEJBQ0sgIjoldV0+XG4iLAotKwlwcmludGYo
ImFjY2VwdDQoJWQ8IiBUQ1BfU1RSICI6WyIgTE9PUEJBQ0sgIjoldV0+LCB7c2FfZmFtaWx5PSIg
QUZfU1RSCi0rCSAgICAgICAiLCAiIElOUE9SVF9TVFIgIj1odG9ucygldSksICIgSU5BRERSX1NU
UiBTQV9GSUVMRFMgIn0sIFsldV0iCi0rCSAgICAgICAiLCBTT0NLX0NMT0VYRUMpID0gJWQ8IiBU
Q1BfU1RSICI6WyIgTE9PUEJBQ0sgIjoldS0+IiBMT09QQkFDSwotKwkgICAgICAgIjoldV0+XG4i
LAotIAkgICAgICAgbGlzdGVuX2ZkLCBsaXN0ZW5fcG9ydCwgY29ubmVjdF9wb3J0LCAodW5zaWdu
ZWQpICpsZW4sCi0gCSAgICAgICBhY2NlcHRfZmQsIGxpc3Rlbl9wb3J0LCBjb25uZWN0X3BvcnQp
OwotIAotSW5kZXg6IHN0cmFjZS02LjMvdGVzdHMvbmV0LXl5LXVuaXguYwotPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQot
LS0tIHN0cmFjZS02LjMub3JpZy90ZXN0cy9uZXQteXktdW5peC5jCi0rKysgc3RyYWNlLTYuMy90
ZXN0cy9uZXQteXktdW5peC5jCi1AQCAtMTAsNiArMTAsNyBAQAotIAotICNpbmNsdWRlICJ0ZXN0
cy5oIgotICNpbmNsdWRlIDxhc3NlcnQuaD4KLSsjaW5jbHVkZSA8ZmNudGwuaD4KLSAjaW5jbHVk
ZSA8c3RkZGVmLmg+Ci0gI2luY2x1ZGUgPHN0ZGlvLmg+Ci0gI2luY2x1ZGUgPHN0ZGxpYi5oPgot
QEAgLTIyLDggKzIzLDYgQEAKLSAjIGluY2x1ZGUgInhtYWxsb2MuaCIKLSAjZW5kaWYKLSAKLS0j
aW5jbHVkZSAiYWNjZXB0X2NvbXBhdC5oIgotLQotICNkZWZpbmUgVEVTVF9TT0NLRVQgIm5ldC15
eS11bml4LnNvY2tldCIKLSAKLSBpbnQKLUBAIC0xMTIsMTIgKzExMSwxMiBAQCBtYWluKHZvaWQp
Ci0gCXN0cnVjdCBzb2NrYWRkciAqIGNvbnN0IGFjY2VwdF9zYSA9IHRhaWxfYWxsb2Moc2l6ZW9m
KGFkZHIpKTsKLSAJbWVtc2V0KGFjY2VwdF9zYSwgMCwgc2l6ZW9mKGFkZHIpKTsKLSAJKmxlbiA9
IHNpemVvZihhZGRyKTsKLS0JaW50IGFjY2VwdF9mZCA9IGRvX2FjY2VwdChsaXN0ZW5fZmQsIGFj
Y2VwdF9zYSwgbGVuKTsKLSsJaW50IGFjY2VwdF9mZCA9IGFjY2VwdDQobGlzdGVuX2ZkLCBhY2Nl
cHRfc2EsIGxlbiwgT19DTE9FWEVDKTsKLSAJaWYgKGFjY2VwdF9mZCA8IDApCi0gCQlwZXJyb3Jf
bXNnX2FuZF9mYWlsKCJhY2NlcHQiKTsKLSAJdW5zaWduZWQgbG9uZyBhY2NlcHRfaW5vZGUgPSBp
bm9kZV9vZl9zb2NrZmQoYWNjZXB0X2ZkKTsKLS0JcHJpbnRmKCJhY2NlcHQoJWQ8JXM6WyVsdSxc
IiVzXCJdPiwge3NhX2ZhbWlseT1BRl9VTklYfSIKLS0JICAgICAgICIsIFslZCA9PiAlZF0pID0g
JWQ8JXM6WyVsdS0+JWx1LFwiJXNcIl0+XG4iLAotKwlwcmludGYoImFjY2VwdDQoJWQ8JXM6WyVs
dSxcIiVzXCJdPiwge3NhX2ZhbWlseT1BRl9VTklYfSIKLSsJICAgICAgICIsIFslZCA9PiAlZF0s
IFNPQ0tfQ0xPRVhFQykgPSAlZDwlczpbJWx1LT4lbHUsXCIlc1wiXT5cbiIsCi0gCSAgICAgICBs
aXN0ZW5fZmQsIHNvY2tfcHJvdG9fbmFtZSwgbGlzdGVuX2lub2RlLCBURVNUX1NPQ0tFVCwKLSAJ
ICAgICAgIChpbnQpIHNpemVvZihhZGRyKSwgKGludCkgKmxlbiwKLSAJICAgICAgIGFjY2VwdF9m
ZCwgc29ja19wcm90b19uYW1lLCBhY2NlcHRfaW5vZGUsIGNvbm5lY3RfaW5vZGUsCi1AQCAtMTkx
LDE0ICsxOTAsMTUgQEAgbWFpbih2b2lkKQotIAotIAltZW1zZXQoYWNjZXB0X3NhLCAwLCBzaXpl
b2YoYWRkcikpOwotIAkqbGVuID0gc2l6ZW9mKGFkZHIpOwotLQlhY2NlcHRfZmQgPSBkb19hY2Nl
cHQobGlzdGVuX2ZkLCBhY2NlcHRfc2EsIGxlbik7Ci0rCWFjY2VwdF9mZCA9IGFjY2VwdDQobGlz
dGVuX2ZkLCBhY2NlcHRfc2EsIGxlbiwgT19DTE9FWEVDKTsKLSAJaWYgKGFjY2VwdF9mZCA8IDAp
Ci0gCQlwZXJyb3JfbXNnX2FuZF9mYWlsKCJhY2NlcHQiKTsKLSAJYWNjZXB0X2lub2RlID0gaW5v
ZGVfb2Zfc29ja2ZkKGFjY2VwdF9mZCk7Ci0gCWNvbnN0IGNoYXIgKiBjb25zdCBzdW5fcGF0aDEg
PQotIAkJKChzdHJ1Y3Qgc29ja2FkZHJfdW4gKikgYWNjZXB0X3NhKS0+c3VuX3BhdGggKyAxOwot
LQlwcmludGYoImFjY2VwdCglZDwlczpbJWx1LFwiJXNcIl0+LCB7c2FfZmFtaWx5PUFGX1VOSVgi
Ci0tCSAgICAgICAiLCBzdW5fcGF0aD1AXCIlc1wifSwgWyVkID0+ICVkXSkgPSAlZDwlczpbJWx1
LT4lbHUsXCIlc1wiXT5cbiIsCi0rCXByaW50ZigiYWNjZXB0NCglZDwlczpbJWx1LFwiJXNcIl0+
LCB7c2FfZmFtaWx5PUFGX1VOSVgiCi0rCSAgICAgICAiLCBzdW5fcGF0aD1AXCIlc1wifSwgWyVk
ID0+ICVkXSwgU09DS19DTE9FWEVDKSIKLSsJICAgICAgICIgPSAlZDwlczpbJWx1LT4lbHUsXCIl
c1wiXT5cbiIsCi0gCSAgICAgICBsaXN0ZW5fZmQsIHNvY2tfcHJvdG9fbmFtZSwgbGlzdGVuX2lu
b2RlLCBURVNUX1NPQ0tFVCwKLSAJICAgICAgIHN1bl9wYXRoMSwgKGludCkgc2l6ZW9mKGFkZHIp
LCAoaW50KSAqbGVuLAotIAkgICAgICAgYWNjZXB0X2ZkLCBzb2NrX3Byb3RvX25hbWUsIGFjY2Vw
dF9pbm9kZSwgY29ubmVjdF9pbm9kZSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9zdHJhY2Uvc3RyYWNlLzNiYmZiNTQxYjI1OGJhZWM5ZWJhNjc0YjVkOGRjMzAwMDdhNjE1NDIu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8zYmJmYjU0MWIyNThi
YWVjOWViYTY3NGI1ZDhkYzMwMDA3YTYxNTQyLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCBiNGM2ZmY5OWRlLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9zdHJhY2Uvc3RyYWNlLzNiYmZiNTQxYjI1OGJhZWM5ZWJhNjc0YjVkOGRjMzAwMDdhNjE1NDIu
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw1MCArMCwwIEBACi1Gcm9tIDNiYmZiNTQxYjI1OGJh
ZWM5ZWJhNjc0YjVkOGRjMzAwMDdhNjE1NDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9t
OiAiRG1pdHJ5IFYuIExldmluIiA8bGR2QHN0cmFjZS5pbz4KLURhdGU6IFdlZCwgMjEgSnVuIDIw
MjMgMDg6MDA6MDAgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gbmV0OiBlbmhhbmNlIGdldHNvY2tv
cHQgZGVjb2RpbmcKLQotV2hlbiBnZXRzb2Nrb3B0IHN5c2NhbGwgZmFpbHMgdGhlIGtlcm5lbCBz
b21ldGltZXMgdXBkYXRlcyB0aGUgb3B0bGVuCi1hcmd1bWVudCwgZm9yIGV4YW1wbGUsIE5FVExJ
TktfTElTVF9NRU1CRVJTSElQUyB1cGRhdGVzIGl0IGV2ZW4gaWYKLW9wdHZhbCBpcyBub3Qgd3Jp
dGFibGUuCi0KLSogc3JjL25ldC5jIChTWVNfRlVOQyhnZXRzb2Nrb3B0KSk6IFRyeSB0byBmZXRj
aCBhbmQgcHJpbnQgb3B0bGVuCi1hcmd1bWVudCBvbiBleGl0aW5nIHN5c2NhbGwgcmVnYXJkbGVz
cyBvZiBnZXRzb2Nrb3B0IGV4aXQgc3RhdHVzLgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0
Ci0tLS0KLSBzcmMvbmV0LmMgfCAxNSArKysrKysrKysrKysrKy0KLSAxIGZpbGUgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL25ldC5j
IGIvc3JjL25ldC5jCi1pbmRleCBmNjhjY2I5NDcuLjcyNDRiNWU1NyAxMDA2NDQKLS0tLSBhL3Ny
Yy9uZXQuYwotKysrIGIvc3JjL25ldC5jCi1AQCAtMTAzOCw3ICsxMDM4LDcgQEAgU1lTX0ZVTkMo
Z2V0c29ja29wdCkKLSAJfSBlbHNlIHsKLSAJCXVsZW4gPSBnZXRfdGNiX3ByaXZfdWxvbmcodGNw
KTsKLSAKLS0JCWlmIChzeXNlcnJvcih0Y3ApIHx8IHVtb3ZlKHRjcCwgdGNwLT51X2FyZ1s0XSwg
JnJsZW4pIDwgMCkgewotKwkJaWYgKHVtb3ZlKHRjcCwgdGNwLT51X2FyZ1s0XSwgJnJsZW4pIDwg
MCkgewotIAkJCS8qIG9wdHZhbCAqLwotIAkJCXByaW50YWRkcih0Y3AtPnVfYXJnWzNdKTsKLSAJ
CQl0cHJpbnRfYXJnX25leHQoKTsKLUBAIC0xMDQ3LDYgKzEwNDcsMTkgQEAgU1lTX0ZVTkMoZ2V0
c29ja29wdCkKLSAJCQl0cHJpbnRfaW5kaXJlY3RfYmVnaW4oKTsKLSAJCQlQUklOVF9WQUxfRCh1
bGVuKTsKLSAJCQl0cHJpbnRfaW5kaXJlY3RfZW5kKCk7Ci0rCQl9IGVsc2UgaWYgKHN5c2Vycm9y
KHRjcCkpIHsKLSsJCQkvKiBvcHR2YWwgKi8KLSsJCQlwcmludGFkZHIodGNwLT51X2FyZ1szXSk7
Ci0rCQkJdHByaW50X2FyZ19uZXh0KCk7Ci0rCi0rCQkJLyogb3B0bGVuICovCi0rCQkJdHByaW50
X2luZGlyZWN0X2JlZ2luKCk7Ci0rCQkJaWYgKHVsZW4gIT0gcmxlbikgewotKwkJCQlQUklOVF9W
QUxfRCh1bGVuKTsKLSsJCQkJdHByaW50X3ZhbHVlX2NoYW5nZWQoKTsKLSsJCQl9Ci0rCQkJUFJJ
TlRfVkFMX0Qocmxlbik7Ci0rCQkJdHByaW50X2luZGlyZWN0X2VuZCgpOwotIAkJfSBlbHNlIHsK
LSAJCQkvKiBvcHR2YWwgKi8KLSAJCQlwcmludF9nZXRzb2Nrb3B0KHRjcCwgdGNwLT51X2FyZ1sx
XSwgdGNwLT51X2FyZ1syXSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJh
Y2Uvc3RyYWNlL2YzMWMyZjQ0OTQ3NzllNWM1ZjE3MGFkMTA1MzliZmMyZGZhZmU5NjcucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS9mMzFjMmY0NDk0Nzc5ZTVjNWYx
NzBhZDEwNTM5YmZjMmRmYWZlOTY3LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCBhMDg0MzgzNmMyLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJh
Y2Uvc3RyYWNlL2YzMWMyZjQ0OTQ3NzllNWM1ZjE3MGFkMTA1MzliZmMyZGZhZmU5NjcucGF0Y2gK
KysrIC9kZXYvbnVsbApAQCAtMSw1MCArMCwwIEBACi1Gcm9tIGYzMWMyZjQ0OTQ3NzllNWM1ZjE3
MGFkMTA1MzliZmMyZGZhZmU5NjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiAiRG1p
dHJ5IFYuIExldmluIiA8bGR2QHN0cmFjZS5pbz4KLURhdGU6IFNhdCwgMjQgSnVuIDIwMjMgMDg6
MDA6MDAgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IHVwZGF0ZSBzb2Nrb3B0LXNvbF9u
ZXRsaW5rIHRlc3QKLQotVXBkYXRlIHNvY2tvcHQtc29sX25ldGxpbmsgdGVzdCB0aGF0IHN0YXJ0
ZWQgdG8gZmFpbCwgbGlrZWx5Ci1kdWUgdG8gcmVjZW50IGxpbnV4IGtlcm5lbCBjb21taXQgZjRl
NDUzNDg1MGE5ICgibmV0L25ldGxpbms6IGZpeAotTkVUTElOS19MSVNUX01FTUJFUlNISVBTIGxl
bmd0aCByZXBvcnQiKS4KLQotKiB0ZXN0cy9zb2Nrb3B0LXNvbF9uZXRsaW5rLmMgKG1haW4pOiBB
bHdheXMgcHJpbnQgY2hhbmdpbmcgb3B0bGVuIHZhbHVlCi1vbiBleGl0aW5nIHN5c2NhbGwuCi0K
LVJlcG9ydGVkLWJ5OiBBbGV4YW5kZXIgR29yZGVldiA8YWdvcmRlZXZAbGludXguaWJtLmNvbT4K
LS0tLQotIHRlc3RzL3NvY2tvcHQtc29sX25ldGxpbmsuYyB8IDEzICsrKysrKysrKystLS0KLSAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKLQotVXBzdHJl
YW0tU3RhdHVzOiBCYWNrcG9ydAotCi1kaWZmIC0tZ2l0IGEvdGVzdHMvc29ja29wdC1zb2xfbmV0
bGluay5jIGIvdGVzdHMvc29ja29wdC1zb2xfbmV0bGluay5jCi1pbmRleCA4MmI5OGFkYzIzLi4x
YzMzMjE5YWM1IDEwMDY0NAotLS0tIGEvdGVzdHMvc29ja29wdC1zb2xfbmV0bGluay5jCi0rKysg
Yi90ZXN0cy9zb2Nrb3B0LXNvbF9uZXRsaW5rLmMKLUBAIC05NCw3ICs5NCwxMCBAQCBtYWluKHZv
aWQpCi0gCQkJcHJpbnRmKCIlcCIsIHZhbCk7Ci0gCQllbHNlCi0gCQkJcHJpbnRmKCJbJWRdIiwg
KnZhbCk7Ci0tCQlwcmludGYoIiwgWyVkXSkgPSAlc1xuIiwgKmxlbiwgZXJyc3RyKTsKLSsJCXBy
aW50ZigiLCBbJWQiLCAoaW50KSBzaXplb2YoKnZhbCkpOwotKwkJaWYgKChpbnQpIHNpemVvZigq
dmFsKSAhPSAqbGVuKQotKwkJCXByaW50ZigiID0+ICVkIiwgKmxlbik7Ci0rCQlwcmludGYoIl0p
ID0gJXNcbiIsIGVycnN0cik7Ci0gCi0gCQkvKiBvcHRsZW4gbGFyZ2VyIHRoYW4gbmVjZXNzYXJ5
IC0gc2hvcnRlbmVkICovCi0gCQkqbGVuID0gc2l6ZW9mKCp2YWwpICsgMTsKLUBAIC0xNTAsOCAr
MTUzLDEyIEBAIG1haW4odm9pZCkKLSAJCS8qIG9wdHZhbCBFRkFVTFQgLSBwcmludCBhZGRyZXNz
ICovCi0gCQkqbGVuID0gc2l6ZW9mKCp2YWwpOwotIAkJZ2V0X3NvY2tvcHQoZmQsIG5hbWVzW2ld
LnZhbCwgZWZhdWx0LCBsZW4pOwotLQkJcHJpbnRmKCJnZXRzb2Nrb3B0KCVkLCBTT0xfTkVUTElO
SywgJXMsICVwLCBbJWRdKSA9ICVzXG4iLAotLQkJICAgICAgIGZkLCBuYW1lc1tpXS5zdHIsIGVm
YXVsdCwgKmxlbiwgZXJyc3RyKTsKLSsJCXByaW50ZigiZ2V0c29ja29wdCglZCwgU09MX05FVExJ
TkssICVzLCAlcCIsCi0rCQkgICAgICAgZmQsIG5hbWVzW2ldLnN0ciwgZWZhdWx0KTsKLSsJCXBy
aW50ZigiLCBbJWQiLCAoaW50KSBzaXplb2YoKnZhbCkpOwotKwkJaWYgKChpbnQpIHNpemVvZigq
dmFsKSAhPSAqbGVuKQotKwkJCXByaW50ZigiID0+ICVkIiwgKmxlbik7Ci0rCQlwcmludGYoIl0p
ID0gJXNcbiIsIGVycnN0cik7Ci0gCi0gCQkvKiBvcHRsZW4gRUZBVUxUIC0gcHJpbnQgYWRkcmVz
cyAqLwotIAkJZ2V0X3NvY2tvcHQoZmQsIG5hbWVzW2ldLnZhbCwgdmFsLCBsZW4gKyAxKTsKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuMy5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuNC5iYgpzaW1pbGFyaXR5IGluZGV4
IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZV82LjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuNC5iYgpp
bmRleCBhNDdjYzcxNzI0Li4yMTc0NzkwZmJlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc3RyYWNlL3N0cmFjZV82LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0
cmFjZS9zdHJhY2VfNi40LmJiCkBAIC0xNCwxMSArMTQsOCBAQCBTUkNfVVJJID0gImh0dHBzOi8v
c3RyYWNlLmlvL2ZpbGVzLyR7UFZ9L3N0cmFjZS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBm
aWxlOi8vc2tpcC1sb2FkLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtY29uZmlndXJl
LVVzZS1hdXRvY29uZi1tYWNyby10by1kZXRlY3QtbGFyZ2VmaWxlLXN1cC5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAyLXRlc3RzLVJlcGxhY2Utb2ZmNjRfdC13aXRoLW9mZl90LnBhdGNo
IFwKLSAgICAgICAgICAgZmlsZTovLzAwYWNlMTM5MmY1YmQyODkyMzliNzU1NDU4ZGNkZWVlZDY5
YWYxZGEucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vZjMxYzJmNDQ5NDc3OWU1YzVmMTcwYWQx
MDUzOWJmYzJkZmFmZTk2Ny5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8zYmJmYjU0MWIyNThi
YWVjOWViYTY3NGI1ZDhkYzMwMDA3YTYxNTQyLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImUxNzg3OGUzMDE1MDZjMWNjMzAxNjExMTE4YWQxNGVmZWU3ZjhiY2Vm
NjNiMjdhY2U1ZDI5MGFjY2U3YmI3MzEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjc5ODdkYmFj
NTdmZGZkMjYwYzZkYjRkYzgzMjhkZjM1Yzk1YzY4NjdjOGEzZDQzNzFkNTljZGNmNGViOTIzOCIK
IAogaW5oZXJpdCBhdXRvdG9vbHMgcHRlc3QKIAotLSAKMi4zOS4yCgo=

--===============5384330087660662928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/strace: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/strace: SRC_URI changed from "https://strace.io/files/6.3/strace-6.3.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch file://0002-tests-Replace-off64_t-with-off_t.patch file://00ace1392f5bd289239b755458dcdeeed69af1da.patch file://f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch file://3bbfb541b258baec9eba674b5d8dc30007a61542.patch" to "https://strace.io/files/6.4/strace-6.4.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch file://0002-tests-Replace-off64_t-with-off_t.patch"
packages/core2-32-poky-linux/strace: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/strace/strace-dbg: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/strace/strace-dbg: FILELIST: added "/usr/lib/strace/ptest/tests/.debug/nlattr_tcamsg-Xraw /usr/lib/strace/ptest/tests/.debug/ip_protocol-Xraw /usr/lib/strace/ptest/tests/.debug/ip_protocol-Xabbrev /usr/lib/strace/ptest/tests/.debug/ip_protocol-Xverbose /usr/lib/strace/ptest/tests/.debug/nlattr_tcamsg-Xabbrev /usr/lib/strace/ptest/tests/.debug/ip_protocol /usr/lib/strace/ptest/tests/.debug/nlattr_tcamsg-Xverbose"
packages/core2-32-poky-linux/strace/strace-dbg: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/strace/strace-dbg: PKGSIZE changed from 51486084 to 51931208 (+1%)
packages/core2-32-poky-linux/strace/strace-dev: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/strace/strace-dev: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/strace/strace-doc: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/strace/strace-doc: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/strace/strace-doc: PKGSIZE changed from 56715 to 56802 (+0%)
packages/core2-32-poky-linux/strace/strace-locale: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/strace/strace-locale: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/strace/strace-ptest: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/ip_protocol-Xraw /usr/lib/strace/ptest/tests/strace--syscall-limit--seccomp-bpf-2.expected /usr/lib/strace/ptest/tests/strace--syscall-limit--seccomp-bpf-3.expected /usr/lib/strace/ptest/tests/ip_protocol.gen.test /usr/lib/strace/ptest/tests/strace--syscall-limit--seccomp-bpf.test /usr/lib/strace/ptest/tests/nlattr_tcamsg-Xverbose.gen.test /usr/lib/strace/ptest/tests/nlattr_tcamsg-Xraw /usr/lib/strace/ptest/tests/nlattr_tcamsg-Xabbrev.gen.test /usr/lib/strace/ptest/tests/ip_protocol-Xabbrev.gen.test /usr/lib/strace/ptest/tests/nlattr_tcamsg-Xraw.gen.test /usr/lib/strace/ptest/tests/ip_protocol-Xabbrev /usr/lib/strace/ptest/tests/ip_protocol /usr/lib/strace/ptest/tests/nlattr_tcamsg-Xabbrev /usr/lib/strace/ptest/tests/ip_protocol-Xverbose.gen.test /usr/lib/strace/ptest/tests/strace--syscall-limit--seccomp-bpf-1.expected /usr/lib/strace/ptest/tests/ip_protocol-Xverbose /usr/lib/strace/ptest/t
 ests/ip_protocol-Xraw.gen.test /usr/lib/strace/ptest/tests/nlattr_tcamsg-Xverbose"
packages/core2-32-poky-linux/strace/strace-ptest: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/strace/strace-ptest: PKGSIZE changed from 29020201 to 29222588 (+1%)
packages/core2-32-poky-linux/strace/strace-src: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/strace/strace-src: FILELIST: directory renamed /usr/src/debug/strace/6.3-r0/src -> /usr/src/debug/strace/6.4-r0/src, directory renamed /usr/src/debug/strace/6.3-r0/src/linux/generic -> /usr/src/debug/strace/6.4-r0/src/linux/generic, directory renamed /usr/src/debug/strace/6.3-r0/src/linux/x86_64 -> /usr/src/debug/strace/6.4-r0/src/linux/x86_64, directory renamed /usr/src/debug/strace/6.3-r0/src/linux/i386 -> /usr/src/debug/strace/6.4-r0/src/linux/i386, directory renamed /usr/src/debug/strace/6.3-r0/src/gen -> /usr/src/debug/strace/6.4-r0/src/gen, removed "/usr/src/debug/strace/6.3-r0/tests/nlattr_inet_diag_req_compat.c /usr/src/debug/strace/6.3-r0/src/xlat/fdflags.h /usr/src/debug/strace/6.3-r0/src/xlat/madvise_hppa_generic_cmds.h /usr/src/debug/strace/6.3-r0/tests/int_0x80.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ip6mra_creport_attr.h /usr/src/debug/strace/6.3-r0/src/xlat/bluetooth_l2_cid.h /usr/src/debug/strace/6.3-r0/tests/rt_sigsuspend.c /usr/src/
 debug/strace/6.3-r0/src/xlat/v4l2_format_description_flags.h /usr/src/debug/strace/6.3-r0/tests/create_tmpfile.c /usr/src/debug/strace/6.3-r0/tests/nlattr_mdba_router_port.c /usr/src/debug/strace/6.3-r0/src/xlat/kd_modes.h /usr/src/debug/strace/6.3-r0/src/xlat/tee_ioctl_param_attr_types.h /usr/src/debug/strace/6.3-r0/src/xlat/evdev_ff_types.h /usr/src/debug/strace/6.3-r0/src/xlat/nf_cttimeout_msg_types.h /usr/src/debug/strace/6.3-r0/tests/ioctl_watchdog.c /usr/src/debug/strace/6.3-r0/src/xlat/arp_hardware_types.h /usr/src/debug/strace/6.3-r0/tests/recv-MSG_TRUNC.c /usr/src/debug/strace/6.3-r0/src/xlat/f_owner_types.h /usr/src/debug/strace/6.3-r0/src/xlat/aio_cmds.h /usr/src/debug/strace/6.3-r0/tests/libsocketcall.c /usr/src/debug/strace/6.3-r0/tests/memfd_secret.c /usr/src/debug/strace/6.3-r0/tests/check_sigign.c /usr/src/debug/strace/6.3-r0/src/xlat/mount_flags.h /usr/src/debug/strace/6.3-r0/tests/printstrn-umoven.c /usr/src/debug/strace/6.3-r0/src/xlat/landlock_ruleset_access_fs.h
  /usr/src/debug/strace/6.3-r0/tests/nlattr_ifaddrmsg.c /usr/src/debug/strace/6.3-r0/tests/nlattr_ifinfomsg.c /usr/src/debug/strace/6.3-r0/tests/quotactl_fd.c /usr/src/debug/strace/6.3-r0/tests/prctl-set-ptracer-success.c /usr/src/debug/strace/6.3-r0/tests/seccomp-filter.c /usr/src/debug/strace/6.3-r0/src/xlat/tcflsh_options.h /usr/src/debug/strace/6.3-r0/src/xlat/crypto_nl_attrs.h /usr/src/debug/strace/6.3-r0/tests/s390_sthyi.c /usr/src/debug/strace/6.3-r0/src/xlat/get_mempolicy_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/memfd_secret_flags.h /usr/src/debug/strace/6.3-r0/tests/print_maxfd.c /usr/src/debug/strace/6.3-r0/src/xlat/routing_table_ids.h /usr/src/debug/strace/6.3-r0/src/xlat/routing_types.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_nexthop_grp_types.h /usr/src/debug/strace/6.3-r0/src/xlat/unshare_flags.h /usr/src/debug/strace/6.3-r0/tests/printpath-umovestr.c /usr/src/debug/strace/6.3-r0/src/xlat/rxrpc_services.h /usr/src/debug/strace/6.3-r0/tests/clock_nanosleep.c /usr
 /src/debug/strace/6.3-r0/src/xlat/statx_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/statx_masks.h /usr/src/debug/strace/6.3-r0/tests/readahead.c /usr/src/debug/strace/6.3-r0/src/xlat/bpf_commands.h /usr/src/debug/strace/6.3-r0/tests/nlattr_ifla.h /usr/src/debug/strace/6.3-r0/src/xlat/fsmount_attr_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/nf_cthelper_msg_types.h /usr/src/debug/strace/6.3-r0/tests/umovestr-illptr.c /usr/src/debug/strace/6.3-r0/tests/fcntl-common.c /usr/src/debug/strace/6.3-r0/tests/semop-common.c /usr/src/debug/strace/6.3-r0/src/xlat/prctl_options.h /usr/src/debug/strace/6.3-r0/src/xlat/smc_diag_extended_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/route_nexthop_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_default_led_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/bpf_class.h /usr/src/debug/strace/6.3-r0/src/xlat/rwf_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/sigprocmaskcmds.h /usr/src/debug/strace/6.3-r0/src/xlat/fib_rule_flags.h /usr/src/debug/strace/6.
 3-r0/src/xlat/mtd_mode_options.h /usr/src/debug/strace/6.3-r0/src/xlat/mtd_type_options.h /usr/src/debug/strace/6.3-r0/src/xlat/gpio_v2_line_attr_ids.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ipmra_creport_attr.h /usr/src/debug/strace/6.3-r0/src/xlat/counter_ioctl_scopes.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_af_spec_inet6_attrs.h /usr/src/debug/strace/6.3-r0/tests/recvmmsg-timeout.c /usr/src/debug/strace/6.3-r0/src/xlat/ip_type_of_services.h /usr/src/debug/strace/6.3-r0/tests/semtimedop.c /usr/src/debug/strace/6.3-r0/tests/net-yy-inet.c /usr/src/debug/strace/6.3-r0/tests/tprintf.c /usr/src/debug/strace/6.3-r0/src/xlat/tls_info_ciphers.h /usr/src/debug/strace/6.3-r0/src/xlat/keyctl_move_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_can_raw_options.h /usr/src/debug/strace/6.3-r0/tests/nfnetlink_queue.c /usr/src/debug/strace/6.3-r0/tests/netlink_xfrm.c /usr/src/debug/strace/6.3-r0/tests/nlattr_ifla_protinfo.c /usr/src/debug/strace/6.3-r0/src/xlat/pr_pac_keys.h /usr/
 src/debug/strace/6.3-r0/tests/perf_event_open_nonverbose.c /usr/src/debug/strace/6.3-r0/src/xlat/nf_ipset_msg_types.h /usr/src/debug/strace/6.3-r0/src/xlat/ioctl_dirs.h /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_csum_types.h /usr/src/debug/strace/6.3-r0/src/xlat/if_dqinfo_valid.h /usr/src/debug/strace/6.3-r0/src/xlat/netlink_socket_flags.h /usr/src/debug/strace/6.3-r0/tests/nfnetlink_cthelper.c /usr/src/debug/strace/6.3-r0/tests/personality.c /usr/src/debug/strace/6.3-r0/tests/preadv.c /usr/src/debug/strace/6.3-r0/tests/xstatx.c /usr/src/debug/strace/6.3-r0/src/xlat/futexwakeops.h /usr/src/debug/strace/6.3-r0/tests/netlink_protocol.c /usr/src/debug/strace/6.3-r0/tests/renameat2.c /usr/src/debug/strace/6.3-r0/src/xlat/irda_protocols.h /usr/src/debug/strace/6.3-r0/tests/fanotify_mark--secontext.c /usr/src/debug/strace/6.3-r0/src/xlat/syslog_console_levels.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_tca_stats_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_features_incompat.h /us
 r/src/debug/strace/6.3-r0/src/xlat/ifstats_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/modem_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_ax25_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_caif_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_dccp_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_ipv6_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_irda_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_iucv_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_sctp_options.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_dumpable.h /usr/src/debug/strace/6.3-r0/tests/nlattr_netconfmsg.c /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_fn_key_vals.h /usr/src/debug/strace/6.3-r0/src/xlat/bootflags1.h /usr/src/debug/strace/6.3-r0/src/xlat/bootflags2.h /usr/src/debug/strace/6.3-r0/src/xlat/bootflags3.h /usr/src/debug/strace/6.3-r0/src/xlat/fcntlcmds.h /usr/src/debug/strace/6.3-r0/src/xlat/quotatypes.h /usr/src/debug/strace/6.3-r0/tests/prctl-fp-mode.c /usr/src/debug/st
 race/6.3-r0/tests/stack-fcall-0.c /usr/src/debug/strace/6.3-r0/tests/stack-fcall-1.c /usr/src/debug/strace/6.3-r0/src/xlat/futexops.h /usr/src/debug/strace/6.3-r0/tests/stack-fcall-2.c /usr/src/debug/strace/6.3-r0/tests/stack-fcall-3.c /usr/src/debug/strace/6.3-r0/src/xlat/epollevents.h /usr/src/debug/strace/6.3-r0/src/xlat/sockopt_txrehash_vals.h /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_balance_state.h /usr/src/debug/strace/6.3-r0/tests/futimesat.c /usr/src/debug/strace/6.3-r0/src/xlat/sg_scsi_reset.h /usr/src/debug/strace/6.3-r0/src/xlat/snmp_ip_stats.h /usr/src/debug/strace/6.3-r0/src/xlat/secbits.h /usr/src/debug/strace/6.3-r0/tests/getgroups.c /usr/src/debug/strace/6.3-r0/tests/setgroups.c /usr/src/debug/strace/6.3-r0/src/xlat/sigbus_codes.h /usr/src/debug/strace/6.3-r0/tests/fchmod.c /usr/src/debug/strace/6.3-r0/tests/getcwd.c /usr/src/debug/strace/6.3-r0/tests/getgid.c /usr/src/debug/strace/6.3-r0/tests/getpid.c /usr/src/debug/strace/6.3-r0/tests/getsid.c /usr/src/debug/st
 race/6.3-r0/tests/gettid.c /usr/src/debug/strace/6.3-r0/tests/getuid.c /usr/src/debug/strace/6.3-r0/tests/waitid.c /usr/src/debug/strace/6.3-r0/src/xlat/fiemap_extent_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_ip_options.h /usr/src/debug/strace/6.3-r0/src/xlat/key_perms.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_set_vma.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_pix_fmts.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_sdr_fmts.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_tuner_rxsubchanses.h /usr/src/debug/strace/6.3-r0/tests/nlattr_ifla_vfinfo.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_nha_res_group_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/inet_diag_bytecodes.h /usr/src/debug/strace/6.3-r0/tests/fchownat.c /usr/src/debug/strace/6.3-r0/src/xlat/msg_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/bsg_flags.h /usr/src/debug/strace/6.3-r0/tests/xgetrlimit.c /usr/src/debug/strace/6.3-r0/src/xlat/ubi_data_types.h /usr/src/debug/strace/6.3-r0/tests/fcntl.c /usr/src/debug/strac
 e/6.3-r0/tests/flock.c /usr/src/debug/strace/6.3-r0/tests/fsync.c /usr/src/debug/strace/6.3-r0/tests/futex.c /usr/src/debug/strace/6.3-r0/tests/ioctl.c /usr/src/debug/strace/6.3-r0/tests/alarm.c /usr/src/debug/strace/6.3-r0/tests/semop.c /usr/src/debug/strace/6.3-r0/tests/setns.c /usr/src/debug/strace/6.3-r0/tests/shmxt.c /usr/src/debug/strace/6.3-r0/tests/sleep.c /usr/src/debug/strace/6.3-r0/src/xlat/socketlayers.h /usr/src/debug/strace/6.3-r0/src/xlat/kexec_arch_values.h /usr/src/debug/strace/6.3-r0/src/xlat/nl_route_types.h /usr/src/debug/strace/6.3-r0/tests/rt_sigqueueinfo.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_info_data_bridge_attrs.h /usr/src/debug/strace/6.3-r0/tests/nanosleep.c /usr/src/debug/strace/6.3-r0/src/xlat/audit_arch.h /usr/src/debug/strace/6.3-r0/src/xlat/sigsys_codes.h /usr/src/debug/strace/6.3-r0/tests/ioctl_evdev-success.c /usr/src/debug/strace/6.3-r0/src/xlat/clone3_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/icmp_filter_flags.h /usr/src/debug/stra
 ce/6.3-r0/tests/netlink_netfilter.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_af_spec_bridge_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_device_capabilities_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_fn_keys.h /usr/src/debug/strace/6.3-r0/tests/mount_setattr.c /usr/src/debug/strace/6.3-r0/tests/ioctl_seccomp.c /usr/src/debug/strace/6.3-r0/src/xlat/statfs_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/qipcrtr_nodes.h /usr/src/debug/strace/6.3-r0/tests/clock_adjtime-common.c /usr/src/debug/strace/6.3-r0/tests/rt_sigprocmask.c /usr/src/debug/strace/6.3-r0/src/xlat/uffd_api_flags.h /usr/src/debug/strace/6.3-r0/tests/rt_sigtimedwait.c /usr/src/debug/strace/6.3-r0/tests/get_sigset_size.c /usr/src/debug/strace/6.3-r0/tests/epoll_wait.c /usr/src/debug/strace/6.3-r0/tests/hexquote_strndup.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_qgroup_ctl_cmds.h /usr/src/debug/strace/6.3-r0/src/xlat/mtd_flags_options.h /usr/src/debug/strace/6.3-r0/src/xlat/fsconfig_cmds.h /usr/src
 /debug/strace/6.3-r0/tests/localtime.c /usr/src/debug/strace/6.3-r0/tests/rt_sigaction.c /usr/src/debug/strace/6.3-r0/tests/prctl-tid_address.c /usr/src/debug/strace/6.3-r0/src/xlat/ax25_protocols.h /usr/src/debug/strace/6.3-r0/tests/test_printstrn.c /usr/src/debug/strace/6.3-r0/src/xlat/close_range_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/rtc_vl_flags.h /usr/src/debug/strace/6.3-r0/tests/test_printpath.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_vf_vlan_list_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/tcxonc_options.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_cap_ambient.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_keymap_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/uring_sqe_flags.h /usr/src/debug/strace/6.3-r0/tests/seccomp_get_notif_sizes.c /usr/src/debug/strace/6.3-r0/src/xlat/netlink_states.h /usr/src/debug/strace/6.3-r0/tests/attach-f-p-cmd.c /usr/src/debug/strace/6.3-r0/tests/arch_prctl.c /usr/src/debug/strace/6.3-r0/src/xlat/fs_xflags.h /usr/src/debug/strace/6.3-
 r0/src/xlat/waitid_types.h /usr/src/debug/strace/6.3-r0/src/xlat/wait4_options.h /usr/src/debug/strace/6.3-r0/tests/nlattr_ifla_af_inet6.h /usr/src/debug/strace/6.3-r0/src/xlat/evdev_ev.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_netlink_options.h /usr/src/debug/strace/6.3-r0/src/xlat/smc_diag_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_xdp_attached_mode.h /usr/src/debug/strace/6.3-r0/tests/status-failed.c /usr/src/debug/strace/6.3-r0/tests/status-none-f.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_tca_act_hw_stats.h /usr/src/debug/strace/6.3-r0/tests/faccessat.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_scrub_flags.h /usr/src/debug/strace/6.3-r0/tests/dup.c /usr/src/debug/strace/6.3-r0/tests/mq_sendrecv.c /usr/src/debug/strace/6.3-r0/src/xlat/nf_nftables_msg_types.h /usr/src/debug/strace/6.3-r0/src/xlat/bdaddr_types.h /usr/src/debug/strace/6.3-r0/src/xlat/fspick_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/usagewho.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_netcon
 f_attrs.h /usr/src/debug/strace/6.3-r0/tests/net-y-unix.c /usr/src/debug/strace/6.3-r0/tests/at_fdcwd-pathmax.c /usr/src/debug/strace/6.3-r0/src/xlat/pr_pac_enabled_keys.h /usr/src/debug/strace/6.3-r0/src/xlat/sigact_flags.h /usr/src/debug/strace/6.3-r0/tests/filter-unavailable.c /usr/src/debug/strace/6.3-r0/tests/list_sigaction_signum.c /usr/src/debug/strace/6.3-r0/src/xlat/mdb_states.h /usr/src/debug/strace/6.3-r0/tests/nlattr_netlink_diag_msg.c /usr/src/debug/strace/6.3-r0/tests/orphaned_process_group.c /usr/src/debug/strace/6.3-r0/src/xlat/clockflags.h /usr/src/debug/strace/6.3-r0/src/xlat/clocknames.h /usr/src/debug/strace/6.3-r0/src/xlat/vsock_cids.h /usr/src/debug/strace/6.3-r0/tests/prctl-cap-ambient.c /usr/src/debug/strace/6.3-r0/src/xlat/uring_register_rsrc_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/mtd_file_mode_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_tipc_options.h /usr/src/debug/strace/6.3-r0/src/xlat/landlock_create_ruleset_flags.h /usr/src/debug/strace
 /6.3-r0/src/xlat/inet6_if_flags.h /usr/src/debug/strace/6.3-r0/tests/inotify_init1.c /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_buf_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_vbi_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/hci_channels.h /usr/src/debug/strace/6.3-r0/src/xlat/bsg_protocol.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_set_mm.h /usr/src/debug/strace/6.3-r0/src/xlat/sigill_codes.h /usr/src/debug/strace/6.3-r0/src/xlat/seccomp_ops.h /usr/src/debug/strace/6.3-r0/tests/xet_thread_area_x86.c /usr/src/debug/strace/6.3-r0/tests/move_pages.c /usr/src/debug/strace/6.3-r0/tests/oldselect-efault.c /usr/src/debug/strace/6.3-r0/src/xlat/kd_led_flags.h /usr/src/debug/strace/6.3-r0/tests/kexec_file_load.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_defrag_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/bpf_mode.h /usr/src/debug/strace/6.3-r0/tests/kexec_load.c /usr/src/debug/strace/6.3-r0/src/xlat/pr_mce_kill_policy.h /usr/src/debug/strace/6.3-r0/tests/prctl-pac-enabled-keys.c /
 usr/src/debug/strace/6.3-r0/tests/pkey_free.c /usr/src/debug/strace/6.3-r0/src/xlat/hdio_ide_nice.h /usr/src/debug/strace/6.3-r0/tests/ipc_msgbuf.c /usr/src/debug/strace/6.3-r0/src/xlat/ipccalls.h /usr/src/debug/strace/6.3-r0/tests/nlattr_ifstats.c /usr/src/debug/strace/6.3-r0/tests/pkey_mprotect.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_dev_stats_values.h /usr/src/debug/strace/6.3-r0/tests/io_uring_register.c /usr/src/debug/strace/6.3-r0/tests/trie_test.c /usr/src/debug/strace/6.3-r0/src/xlat/pr_tagged_addr_mte_tcf.h /usr/src/debug/strace/6.3-r0/tests/finit_module.c /usr/src/debug/strace/6.3-r0/tests/prctl_marker.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_family.h /usr/src/debug/strace/6.3-r0/tests/sched_yield.c /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_memories.h /usr/src/debug/strace/6.3-r0/tests/getpgrp.c /usr/src/debug/strace/6.3-r0/tests/redirect-fds.c /usr/src/debug/strace/6.3-r0/src/xlat/sigfpe_codes.h /usr/src/debug/strace/6.3-r0/tests/errno2name.c /usr/src/debug/str
 ace/6.3-r0/src/xlat/itimer_which.h /usr/src/debug/strace/6.3-r0/src/xlat/access_modes.h /usr/src/debug/strace/6.3-r0/src/xlat/netlink_ack_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/lirc_modes.h /usr/src/debug/strace/6.3-r0/tests/fadvise64.c /usr/src/debug/strace/6.3-r0/tests/getdents64.c /usr/src/debug/strace/6.3-r0/tests/sched_xetattr.c /usr/src/debug/strace/6.3-r0/tests/timer_xettime.c /usr/src/debug/strace/6.3-r0/tests/nlattr_inet_diag_req_v2.c /usr/src/debug/strace/6.3-r0/tests/pread64-pwrite64.c /usr/src/debug/strace/6.3-r0/tests/nlattr_ifla_brport.c /usr/src/debug/strace/6.3-r0/tests/netlink_selinux.c /usr/src/debug/strace/6.3-r0/tests/ipc.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_qgroup_status_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/tun_device_types.h /usr/src/debug/strace/6.3-r0/tests/prctl-dumpable.c /usr/src/debug/strace/6.3-r0/src/xlat/mpol_mode_flags.h /usr/src/debug/strace/6.3-r0/tests/nlattr_ifla_port.c /usr/src/debug/strace/6.3-r0/tests/mlockall.c /usr/sr
 c/debug/strace/6.3-r0/tests/preadv-pwritev.c /usr/src/debug/strace/6.3-r0/tests/fchmodat.c /usr/src/debug/strace/6.3-r0/src/xlat/nlmsgerr_attrs.h /usr/src/debug/strace/6.3-r0/tests/sigreturn.c /usr/src/debug/strace/6.3-r0/tests/xetpriority.c /usr/src/debug/strace/6.3-r0/tests/execveat.c /usr/src/debug/strace/6.3-r0/tests/renameat.c /usr/src/debug/strace/6.3-r0/tests/sprintrc.c /usr/src/debug/strace/6.3-r0/tests/ioctl_random.c /usr/src/debug/strace/6.3-r0/src/xlat/kexec_load_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/ubi_volume_props.h /usr/src/debug/strace/6.3-r0/src/xlat/gpio_event_flags.h /usr/src/debug/strace/6.3-r0/tests/openat2.c /usr/src/debug/strace/6.3-r0/tests/umount2.c /usr/src/debug/strace/6.3-r0/src/xlat/keyctl_caps1.h /usr/src/debug/strace/6.3-r0/src/xlat/fdb_notify_flags.h /usr/src/debug/strace/6.3-r0/tests/so_error.c /usr/src/debug/strace/6.3-r0/tests/nlattr_ifaddrlblmsg.c /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_tables.h /usr/src/debug/strace/6.3-r0/src/xlat/u
 ffd_register_mode_flags.h /usr/src/debug/strace/6.3-r0/tests/mount.c /usr/src/debug/strace/6.3-r0/tests/pause.c /usr/src/debug/strace/6.3-r0/tests/pidns.c /usr/src/debug/strace/6.3-r0/tests/pipe2.c /usr/src/debug/strace/6.3-r0/tests/wait4.c /usr/src/debug/strace/6.3-r0/tests/xattr.c /usr/src/debug/strace/6.3-r0/tests/umask.c /usr/src/debug/strace/6.3-r0/tests/uname.c /usr/src/debug/strace/6.3-r0/tests/ustat.c /usr/src/debug/strace/6.3-r0/tests/utime.c /usr/src/debug/strace/6.3-r0/src/xlat/nf_acct_msg_types.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_colorspaces.h /usr/src/debug/strace/6.3-r0/tests/faccessat2.c /usr/src/debug/strace/6.3-r0/tests/pidns.h /usr/src/debug/strace/6.3-r0/tests/preadv2-pwritev2.c /usr/src/debug/strace/6.3-r0/tests/sched_get_priority_mxx.c /usr/src/debug/strace/6.3-r0/tests/ioctl_scsi.c /usr/src/debug/strace/6.3-r0/tests/truncate64.c /usr/src/debug/strace/6.3-r0/src/xlat/bpf_size.h /usr/src/debug/strace/6.3-r0/src/xlat/delete_module_flags.h /usr/src/debug/s
 trace/6.3-r0/src/xlat/rtnl_ifla_vf_link_states.h /usr/src/debug/strace/6.3-r0/tests/count-f.c /usr/src/debug/strace/6.3-r0/tests/vfork-f.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_events.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_buf_types.h /usr/src/debug/strace/6.3-r0/tests/nfnetlink_ctnetlink.c /usr/src/debug/strace/6.3-r0/tests/inject-nf.c /usr/src/debug/strace/6.3-r0/tests/ioctl_mtd.c /usr/src/debug/strace/6.3-r0/tests/signal_receive.c /usr/src/debug/strace/6.3-r0/tests/nfnetlink_acct.c /usr/src/debug/strace/6.3-r0/tests/strace-n.c /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_lock_keys.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_control_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_control_types.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_control_id_bases.h /usr/src/debug/strace/6.3-r0/tests/ioctl_fs_f.c /usr/src/debug/strace/6.3-r0/src/xlat/sock_packet_options.h /usr/src/debug/strace/6.3-r0/tests/pselect6-common.c /usr/src/debug/strace/6.3-r0/tests/membarrier.c
  /usr/src/debug/strace/6.3-r0/tests/status-successful-threads.c /usr/src/debug/strace/6.3-r0/src/xlat/netlink_diag_attrs.h /usr/src/debug/strace/6.3-r0/tests/pidfd_getfd.c /usr/src/debug/strace/6.3-r0/src/xlat/fan_init_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/fan_mark_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/ebpf_mode.h /usr/src/debug/strace/6.3-r0/src/xlat/ebpf_regs.h /usr/src/debug/strace/6.3-r0/src/xlat/ebpf_size.h /usr/src/debug/strace/6.3-r0/tests/set_ptracer_any.c /usr/src/debug/strace/6.3-r0/tests/seccomp-strict.c /usr/src/debug/strace/6.3-r0/tests/unblock_reset_raise.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_features_compat_ro.h /usr/src/debug/strace/6.3-r0/tests/sigaction.c /usr/src/debug/strace/6.3-r0/tests/hexdump_strdup.c /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_tuner_capabilities.h /usr/src/debug/strace/6.3-r0/src/xlat/neighbor_cache_entry_ext_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ipmra_msg_types.h /usr/src/debug/strace/6.3-r0/tests/net-pack
 et_mreq.c /usr/src/debug/strace/6.3-r0/src/xlat/tee_ioctl_optee_caps.h /usr/src/debug/strace/6.3-r0/tests/readdir.c /usr/src/debug/strace/6.3-r0/tests/close_range.c /usr/src/debug/strace/6.3-r0/src/xlat/tee_ioctl_origins.h /usr/src/debug/strace/6.3-r0/tests/umoven-illptr.c /usr/src/debug/strace/6.3-r0/tests/nfnetlink_ctnetlink_exp.c /usr/src/debug/strace/6.3-r0/tests/siginfo.c /usr/src/debug/strace/6.3-r0/tests/sysinfo.c /usr/src/debug/strace/6.3-r0/tests/ioctl_sock.c /usr/src/debug/strace/6.3-r0/src/xlat/compat_ptrace_cmds.h /usr/src/debug/strace/6.3-r0/src/xlat/syslog_action_type.h /usr/src/debug/strace/6.3-r0/tests/getrusage.c /usr/src/debug/strace/6.3-r0/tests/threads-execve.c /usr/src/debug/strace/6.3-r0/tests/net-icmp_filter.c /usr/src/debug/strace/6.3-r0/src/xlat/getsock_ip_options.h /usr/src/debug/strace/6.3-r0/src/xlat/setsock_ip_options.h /usr/src/debug/strace/6.3-r0/tests/netlink_netlink_diag.c /usr/src/debug/strace/6.3-r0/tests/ioctl_kd.c /usr/src/debug/strace/6.3-r0/src
 /xlat/pr_tsc.h /usr/src/debug/strace/6.3-r0/tests/seccomp-filter-v.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_br_mcast_querier_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/sigchld_codes.h /usr/src/debug/strace/6.3-r0/src/xlat/gpio_v2_line_flags.h /usr/src/debug/strace/6.3-r0/tests/prctl-mdwe.c /usr/src/debug/strace/6.3-r0/tests/file_handle--secontext.c /usr/src/debug/strace/6.3-r0/tests/scm_rights.c /usr/src/debug/strace/6.3-r0/tests/ioctl_lirc.c /usr/src/debug/strace/6.3-r0/src/xlat/blkpg_ops.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_kbd_modes.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_kbd_types.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_types.h /usr/src/debug/strace/6.3-r0/src/xlat/kvm_mem_flags.h /usr/src/debug/strace/6.3-r0/tests/newfstatat.c /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_buf_flags_ts_src.h /usr/src/debug/strace/6.3-r0/src/xlat/nf_osf_msg_types.h /usr/src/debug/strace/6.3-r0/tests/prctl-capbset.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_cont_reading_
 from_srcdev_mode.h /usr/src/debug/strace/6.3-r0/src/xlat/uring_enter_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_ext_filter_flags.h /usr/src/debug/strace/6.3-r0/tests/ioctl_nsfs.c /usr/src/debug/strace/6.3-r0/tests/pc.c /usr/src/debug/strace/6.3-r0/src/xlat/pr_sched_core_cmds.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_brport_attrs.h /usr/src/debug/strace/6.3-r0/tests/inotify.c /usr/src/debug/strace/6.3-r0/tests/nfnetlink_ipset.c /usr/src/debug/strace/6.3-r0/tests/aio.c /usr/src/debug/strace/6.3-r0/src/xlat/nl_bridge_vlan_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/keyctl_pkey_ops.h /usr/src/debug/strace/6.3-r0/tests/setpgrp-exec.c /usr/src/debug/strace/6.3-r0/tests/status-none.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_logical_ino_args_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/uring_iowq_acct.h /usr/src/debug/strace/6.3-r0/tests/riscv_flush_icache.c /usr/src/debug/strace/6.3-r0/tests/printpath-umovestr-undumpable.c /usr/src/debug/strace/6.3-r0/src/xlat/in
 et_diag_ulp_info_mptcp_attrs.h /usr/src/debug/strace/6.3-r0/tests/so_peercred.c /usr/src/debug/strace/6.3-r0/src/xlat/evdev_relative_axes.h /usr/src/debug/strace/6.3-r0/tests/filter_seccomp-flag.c /usr/src/debug/strace/6.3-r0/src/xlat/ifstats_af_spec_mpls_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_vf_stats_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_dead_keys.h /usr/src/debug/strace/6.3-r0/src/xlat/getsock_ipv6_options.h /usr/src/debug/strace/6.3-r0/src/xlat/bluetooth_l2_psm.h /usr/src/debug/strace/6.3-r0/src/xlat/routing_protocols.h /usr/src/debug/strace/6.3-r0/src/xlat/setsock_ipv6_options.h /usr/src/debug/strace/6.3-r0/src/xlat/skf_ad.h /usr/src/debug/strace/6.3-r0/tests/s390_guarded_storage.c /usr/src/debug/strace/6.3-r0/tests/ioctl_kvm_run_auxstr_vcpu.c /usr/src/debug/strace/6.3-r0/tests/block_reset_raise_run.c /usr/src/debug/strace/6.3-r0/tests/mincore.c /usr/src/debug/strace/6.3-r0/tests/unshare.c /usr/src/debug/strace/6.3-r0/tests/remap_file_pages.c /us
 r/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_bridge_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_control_classes.h /usr/src/debug/strace/6.3-r0/src/xlat/scmvals.h /usr/src/debug/strace/6.3-r0/src/xlat/evdev_autorepeat.h /usr/src/debug/strace/6.3-r0/src/xlat/nl_audit_types.h /usr/src/debug/strace/6.3-r0/src/xlat/routing_scopes.h /usr/src/debug/strace/6.3-r0/src/xlat/uring_files_update_fds.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_control_query_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/ptrace_cmds.h /usr/src/debug/strace/6.3-r0/tests/erestartsys.c /usr/src/debug/strace/6.3-r0/tests/move_mount.c /usr/src/debug/strace/6.3-r0/tests/strace--syscall-limit.c /usr/src/debug/strace/6.3-r0/src/xlat/term_cmds_overlapping.h /usr/src/debug/strace/6.3-r0/tests/fork-f.c /usr/src/debug/strace/6.3-r0/src/xlat/lirc_features.h /usr/src/debug/strace/6.3-r0/tests/ioctl_dm.c /usr/src/debug/strace/6.3-r0/tests/fflush.c /usr/src/debug/strace/6.3-r0/src/xlat/hw_breakpoint_type.h /usr/src/debug/s
 trace/6.3-r0/src/xlat/mtd_otp_options.h /usr/src/debug/strace/6.3-r0/src/xlat/mount_attr_attr.h /usr/src/debug/strace/6.3-r0/src/xlat/ptp_pin_funcs.h /usr/src/debug/strace/6.3-r0/src/xlat/nl_xfrm_types.h /usr/src/debug/strace/6.3-r0/tests/ioctl_termios.c /usr/src/debug/strace/6.3-r0/src/xlat/inet_diag_extended_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/bpf_prog_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_send_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/perf_ioctl_flags.h /usr/src/debug/strace/6.3-r0/tests/brk.c /usr/src/debug/strace/6.3-r0/src/xlat/move_mount_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/move_pages_flags.h /usr/src/debug/strace/6.3-r0/tests/prctl-sme.c /usr/src/debug/strace/6.3-r0/src/xlat/xdp_sockaddr_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ip6mra_msg_types.h /usr/src/debug/strace/6.3-r0/tests/readlink.c /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_streaming_capabilities.h /usr/src/debug/strace/6.3-r0/tests/recvfrom.c /usr/src/debug/strace/6.3
 -r0/tests/netlink_crypto.c /usr/src/debug/strace/6.3-r0/src/xlat/archvals.h /usr/src/debug/strace/6.3-r0/tests/ftruncate64.c /usr/src/debug/strace/6.3-r0/tests/prctl-unalign.c /usr/src/debug/strace/6.3-r0/tests/semop-indirect.c /usr/src/debug/strace/6.3-r0/tests/pipe_maxfd.c /usr/src/debug/strace/6.3-r0/tests/net-tpacket_req.c /usr/src/debug/strace/6.3-r0/src/xlat/futex_waiter_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/semop_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/af_packet_types.h /usr/src/debug/strace/6.3-r0/tests/quotactl.h /usr/src/debug/strace/6.3-r0/tests/getegid.c /usr/src/debug/strace/6.3-r0/tests/geteuid.c /usr/src/debug/strace/6.3-r0/tests/getppid.c /usr/src/debug/strace/6.3-r0/tests/getxgid.c /usr/src/debug/strace/6.3-r0/tests/mlock2.c /usr/src/debug/strace/6.3-r0/tests/getxpid.c /usr/src/debug/strace/6.3-r0/tests/getxuid.c /usr/src/debug/strace/6.3-r0/tests/setugid.c /usr/src/debug/strace/6.3-r0/tests/quotactl.c /usr/src/debug/strace/6.3-r0/tests/waitpid.c /usr/
 src/debug/strace/6.3-r0/src/xlat/ip_cmsg_types.h /usr/src/debug/strace/6.3-r0/src/xlat/keyctl_caps0.h /usr/src/debug/strace/6.3-r0/src/xlat/mctp_addrs.h /usr/src/debug/strace/6.3-r0/tests/xetitimer.c /usr/src/debug/strace/6.3-r0/tests/ioctl_kvm_run.c /usr/src/debug/strace/6.3-r0/src/xlat/sg_io_dxfer_direction.h /usr/src/debug/strace/6.3-r0/src/xlat/bpf_map_update_elem_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/sigtrap_codes.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_frameinterval_types.h /usr/src/debug/strace/6.3-r0/tests/ioctl_rtc.c /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_capture_modes.h /usr/src/debug/strace/6.3-r0/src/xlat/quotacmds.h /usr/src/debug/strace/6.3-r0/tests/set_sigign.c /usr/src/debug/strace/6.3-r0/src/xlat/aio_iocb_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/evdev_ff_status.h /usr/src/debug/strace/6.3-r0/tests/copy_file_range.c /usr/src/debug/strace/6.3-r0/tests/sync_file_range.c /usr/src/debug/strace/6.3-r0/tests/open--secontext.c /usr/src/debug/strace/6.3
 -r0/src/xlat/netlink_get_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/seccomp_ioctl_resp_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/resources.h /usr/src/debug/strace/6.3-r0/tests/getdents.c /usr/src/debug/strace/6.3-r0/src/xlat/ifstats_offload_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/getsock_options.h /usr/src/debug/strace/6.3-r0/src/xlat/setsock_options.h /usr/src/debug/strace/6.3-r0/tests/ioctl_sock_gifconf.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_key_types.h /usr/src/debug/strace/6.3-r0/tests/perf_event_open.c /usr/src/debug/strace/6.3-r0/src/xlat/multicast_router_types.h /usr/src/debug/strace/6.3-r0/tests/xet_robust_list.c /usr/src/debug/strace/6.3-r0/tests/socketcall.c /usr/src/debug/strace/6.3-r0/tests/init_module.c /usr/src/debug/strace/6.3-r0/src/xlat/futexwakecmps.h /usr/src/debug/strace/6.3-r0/tests/nfnetlink_osf.c /usr/src/debug/strace/6.3-r0/src/xlat/seccomp_mode.h /usr/src/debug/strace/6.3-r0/tests/status-successful.c /usr/src/debug/strace/6.3-r0/tests/err
 or_msg.c /usr/src/debug/strace/6.3-r0/tests/xgetdents.c /usr/src/debug/strace/6.3-r0/src/xlat/mount_setattr_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/neighbor_cache_entry_states.h /usr/src/debug/strace/6.3-r0/tests/nlattr_ndmsg.c /usr/src/debug/strace/6.3-r0/tests/nlattr_nhmsg.c /usr/src/debug/strace/6.3-r0/tests/nlattr_rtmsg.c /usr/src/debug/strace/6.3-r0/tests/nlattr_tcmsg.c /usr/src/debug/strace/6.3-r0/tests/prctl-syscall-user-dispatch.c /usr/src/debug/strace/6.3-r0/tests/poke-sendfile.c /usr/src/debug/strace/6.3-r0/src/xlat/open_mode_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/open_tree_flags.h /usr/src/debug/strace/6.3-r0/tests/qual_inject-error-signal.c /usr/src/debug/strace/6.3-r0/tests/ioctl_perf-success.c /usr/src/debug/strace/6.3-r0/tests/net-accept-connect.c /usr/src/debug/strace/6.3-r0/tests/eventfd.c /usr/src/debug/strace/6.3-r0/tests/fadvise64_64.c /usr/src/debug/strace/6.3-r0/tests/userfaultfd.c /usr/src/debug/strace/6.3-r0/src/xlat/ipc_msg_flags.h /usr/src/debu
 g/strace/6.3-r0/src/xlat/nl_sock_diag_types.h /usr/src/debug/strace/6.3-r0/tests/ipc_sem.c /usr/src/debug/strace/6.3-r0/src/xlat/netlink_diag_show.h /usr/src/debug/strace/6.3-r0/src/xlat/inet_protocols.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_proto_down_reason_attrs.h /usr/src/debug/strace/6.3-r0/tests/utimensat.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_mdba_mdb_attrs.h /usr/src/debug/strace/6.3-r0/tests/sched_xetparam.c /usr/src/debug/strace/6.3-r0/tests/nlattr_ifla_xdp.c /usr/src/debug/strace/6.3-r0/src/xlat/term_oflags_tabdly.h /usr/src/debug/strace/6.3-r0/src/xlat/perf_sw_ids.h /usr/src/debug/strace/6.3-r0/tests/symlinkat.c /usr/src/debug/strace/6.3-r0/tests/inode_of_sockfd.c /usr/src/debug/strace/6.3-r0/tests/signal.c /usr/src/debug/strace/6.3-r0/tests/keyctl.c /usr/src/debug/strace/6.3-r0/tests/sysctl.c /usr/src/debug/strace/6.3-r0/src/xlat/ebpf_class.h /usr/src/debug/strace/6.3-r0/tests/tgkill.c /usr/src/debug/strace/6.3-r0/src/xlat/bpf_attach_type.h /usr/src/debu
 g/strace/6.3-r0/tests/fsopen.c /usr/src/debug/strace/6.3-r0/src/xlat/sock_bluetooth_options.h /usr/src/debug/strace/6.3-r0/src/xlat/inotify_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/perf_hw_id.h /usr/src/debug/strace/6.3-r0/src/xlat/kvm_exit_reason.h /usr/src/debug/strace/6.3-r0/src/xlat/bpf_attach_flags.h /usr/src/debug/strace/6.3-r0/tests/time.c /usr/src/debug/strace/6.3-r0/tests/nlattr_crypto_user_alg.c /usr/src/debug/strace/6.3-r0/tests/acct.c /usr/src/debug/strace/6.3-r0/tests/caps.c /usr/src/debug/strace/6.3-r0/tests/dup2.c /usr/src/debug/strace/6.3-r0/tests/dup3.c /usr/src/debug/strace/6.3-r0/src/xlat/whence_codes.h /usr/src/debug/strace/6.3-r0/tests/iopl.c /usr/src/debug/strace/6.3-r0/tests/kcmp.c /usr/src/debug/strace/6.3-r0/tests/kill.c /usr/src/debug/strace/6.3-r0/src/xlat/nfc_protocols.h /usr/src/debug/strace/6.3-r0/src/xlat/smc_protocols.h /usr/src/debug/strace/6.3-r0/tests/reboot.c /usr/src/debug/strace/6.3-r0/src/xlat/mmap_flags.h /usr/src/debug/strace/6.3-r0/src/
 xlat/swap_flags.h /usr/src/debug/strace/6.3-r0/tests/mq.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_br_boolopts.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_af_spec_mctp_attrs.h /usr/src/debug/strace/6.3-r0/tests/prctl-pdeathsig.c /usr/src/debug/strace/6.3-r0/tests/ipc_msg.c /usr/src/debug/strace/6.3-r0/tests/libmmsg.c /usr/src/debug/strace/6.3-r0/tests/recvmsg.c /usr/src/debug/strace/6.3-r0/tests/fadvise.h /usr/src/debug/strace/6.3-r0/tests/madvise.c /usr/src/debug/strace/6.3-r0/src/xlat/kcmp_types.h /usr/src/debug/strace/6.3-r0/tests/fchownat--secontext.c /usr/src/debug/strace/6.3-r0/tests/net-tpacket_stats.c /usr/src/debug/strace/6.3-r0/src/xlat/uffd_copy_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/ebpf_op_jmp.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_framesize_types.h /usr/src/debug/strace/6.3-r0/tests/ioctl_uffdio.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_balance_args.h /usr/src/debug/strace/6.3-r0/src/xlat/fsmagic.h /usr/src/debug/strace/6.3-r0/src/xlat/uni
 x_diag_show.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_mdba_router_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/inet_diag_shutdown_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/ifstats_xstats_bridge_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_compress_types.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_mdba_mdb_eattr_attrs.h /usr/src/debug/strace/6.3-r0/tests/nlattr_mdba_mdb_entry.c /usr/src/debug/strace/6.3-r0/tests/sockaddr_xlat.c /usr/src/debug/strace/6.3-r0/src/xlat/uring_restriction_opcodes.h /usr/src/debug/strace/6.3-r0/tests/ioctl_hdio.c /usr/src/debug/strace/6.3-r0/tests/ioctl_ubi.c /usr/src/debug/strace/6.3-r0/src/xlat/inet_diag_attrs.h /usr/src/debug/strace/6.3-r0/tests/ioctl_gpio.c /usr/src/debug/strace/6.3-r0/tests/mknodat.c /usr/src/debug/strace/6.3-r0/src/xlat/shm_resource_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/pollflags.h /usr/src/debug/strace/6.3-r0/tests/getsockname.c /usr/src/debug/strace/6.3-r0/tests/ioctl_v4l2-success.c /usr/src/debug/strace/6.3-
 r0/src/xlat/mount_attr_propagation.h /usr/src/debug/strace/6.3-r0/src/xlat/siginfo_codes.h /usr/src/debug/strace/6.3-r0/src/xlat/nf_ctnetlink_msg_types.h /usr/src/debug/strace/6.3-r0/tests/rt_sigpending.c /usr/src/debug/strace/6.3-r0/tests/fsmount.c /usr/src/debug/strace/6.3-r0/tests/ksysent.c /usr/src/debug/strace/6.3-r0/src/xlat/bpf_prog_types.h /usr/src/debug/strace/6.3-r0/src/xlat/key_reqkeys.h /usr/src/debug/strace/6.3-r0/tests/sigpending.c /usr/src/debug/strace/6.3-r0/tests/overflowuid.c /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_sliced_flags.h /usr/src/debug/strace/6.3-r0/tests/fsconfig.c /usr/src/debug/strace/6.3-r0/src/xlat/fan_classes.h /usr/src/debug/strace/6.3-r0/src/xlat/kcm_protocols.h /usr/src/debug/strace/6.3-r0/src/xlat/nfc_sockaddr_protocols.h /usr/src/debug/strace/6.3-r0/src/xlat/smc_diag_mode.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_br_boolopt_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/at_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/dm_flags.h /usr/s
 rc/debug/strace/6.3-r0/tests/net-yy-netlink.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_qgroup_limit_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/ubi_volume_types.h /usr/src/debug/strace/6.3-r0/src/xlat/mlock_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/vsock_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/vsock_ports.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_shutdown_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/tee_ioctl_gen_caps.h /usr/src/debug/strace/6.3-r0/src/xlat/ioprio_class.h /usr/src/debug/strace/6.3-r0/tests/adjtimex.c /usr/src/debug/strace/6.3-r0/src/xlat/xattrflags.h /usr/src/debug/strace/6.3-r0/tests/nlattr_tca_stab.c /usr/src/debug/strace/6.3-r0/src/xlat/setns_types.h /usr/src/debug/strace/6.3-r0/tests/ioctl_winsize.c /usr/src/debug/strace/6.3-r0/src/xlat/falloc_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/bpf_map_lookup_elem_flags.h /usr/src/debug/strace/6.3-r0/tests/kill_child.c /usr/src/debug/strace/6.3-r0/tests/strace-x.c /usr/src/debug/strace/6.3-r0/src/xl
 at/dirent_types.h /usr/src/debug/strace/6.3-r0/src/xlat/sigpoll_codes.h /usr/src/debug/strace/6.3-r0/src/xlat/sigprof_codes.h /usr/src/debug/strace/6.3-r0/tests/ipc_shm.c /usr/src/debug/strace/6.3-r0/src/xlat/bpf_link_create_kprobe_multi_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/keyctl_commands.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_neightbl_parms_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/madvise_cmds.h /usr/src/debug/strace/6.3-r0/src/xlat/kvm_cap.h /usr/src/debug/strace/6.3-r0/src/xlat/loop_crypt_type_options.h /usr/src/debug/strace/6.3-r0/tests/set_mempolicy_home_node.c /usr/src/debug/strace/6.3-r0/src/xlat/mlockall_flags.h /usr/src/debug/strace/6.3-r0/tests/ioctl_nbd.c /usr/src/debug/strace/6.3-r0/tests/block_reset_run.c /usr/src/debug/strace/6.3-r0/tests/epoll_create.c /usr/src/debug/strace/6.3-r0/tests/memfd_create.c /usr/src/debug/strace/6.3-r0/tests/timer_create.c /usr/src/debug/strace/6.3-r0/tests/nfnetlink_nftables.c /usr/src/debug/strace/6.3-r0/tests/print_q
 uoted_string.c /usr/src/debug/strace/6.3-r0/tests/timerfd_xettime.c /usr/src/debug/strace/6.3-r0/tests/umovestr_cached.c /usr/src/debug/strace/6.3-r0/tests/clone-flags.c /usr/src/debug/strace/6.3-r0/tests/ioctl_fs_x.c /usr/src/debug/strace/6.3-r0/tests/process_madvise.c /usr/src/debug/strace/6.3-r0/tests/nlattr_inet_diag_msg.c /usr/src/debug/strace/6.3-r0/tests/nlattr_unix_diag_msg.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_addr_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_link_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_nsid_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_rule_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/f_seals.h /usr/src/debug/strace/6.3-r0/tests/fchmod-y--secontext.c /usr/src/debug/strace/6.3-r0/tests/get_process_reaper.c /usr/src/debug/strace/6.3-r0/src/xlat/uring_register_opcodes.h /usr/src/debug/strace/6.3-r0/src/xlat/perf_branch_sample_type.h /usr/src/debug/strace/6.3-r0/src/xlat/ieee802154_addr_types.h /usr/src/debug/strace/6.3-r0/src/xla
 t/bpf_src.h /usr/src/debug/strace/6.3-r0/src/xlat/caif_protocols.h /usr/src/debug/strace/6.3-r0/tests/access--secontext.c /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_brl_keys.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_cur_keys.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_pad_keys.h /usr/src/debug/strace/6.3-r0/tests/pidfd_open.c /usr/src/debug/strace/6.3-r0/src/xlat/perf_hw_cache_id.h /usr/src/debug/strace/6.3-r0/tests/recvfrom-MSG_TRUNC.c /usr/src/debug/strace/6.3-r0/src/xlat/rtc_params.h /usr/src/debug/strace/6.3-r0/src/xlat/smc_states.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_tca_stab_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_meta_vals.h /usr/src/debug/strace/6.3-r0/tests/pwritev.c /usr/src/debug/strace/6.3-r0/tests/setrlimit.c /usr/src/debug/strace/6.3-r0/src/xlat/nl_netfilter_msg_types.h /usr/src/debug/strace/6.3-r0/src/xlat/kexec_file_load_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/ifstats_xstats_bridge_mcast_indices.h /usr/src/debug/strace/6.3-r0/src/xlat/
 mctl_sync.h /usr/src/debug/strace/6.3-r0/tests/prlimit64.c /usr/src/debug/strace/6.3-r0/src/xlat/ifaddrflags.h /usr/src/debug/strace/6.3-r0/src/xlat/bpf_file_mode_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/xfs_dqblk_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/xfs_quota_flags.h /usr/src/debug/strace/6.3-r0/tests/rt_sigreturn.c /usr/src/debug/strace/6.3-r0/tests/print_ppid_tracerpid.c /usr/src/debug/strace/6.3-r0/src/xlat/hdio_drive_cmds.h /usr/src/debug/strace/6.3-r0/tests/getgid32.c /usr/src/debug/strace/6.3-r0/tests/getuid32.c /usr/src/debug/strace/6.3-r0/tests/sxetmask.c /usr/src/debug/strace/6.3-r0/tests/printstrn-umoven-undumpable.c /usr/src/debug/strace/6.3-r0/tests/ioctl_tee.c /usr/src/debug/strace/6.3-r0/src/xlat/perf_event_read_format.h /usr/src/debug/strace/6.3-r0/tests/setreugid.c /usr/src/debug/strace/6.3-r0/tests/setfsugid.c /usr/src/debug/strace/6.3-r0/src/xlat/bpf_rval.h /usr/src/debug/strace/6.3-r0/tests/kernel_old_timex.h /usr/src/debug/strace/6.3-r0/src/xlat/fi
 emap_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/mremap_flags.h /usr/src/debug/strace/6.3-r0/tests/segv_pkuerr.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_dev_stats_flags.h /usr/src/debug/strace/6.3-r0/tests/ioctl_v4l2.c /usr/src/debug/strace/6.3-r0/tests/print_user_desc.c /usr/src/debug/strace/6.3-r0/src/xlat/shm_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/fsopen_flags.h /usr/src/debug/strace/6.3-r0/tests/status-all.c /usr/src/debug/strace/6.3-r0/tests/umovestr3.c /usr/src/debug/strace/6.3-r0/src/xlat/seccomp_ioctl_addfd_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/bpf_miscop.h /usr/src/debug/strace/6.3-r0/src/xlat/bpf_op_alu.h /usr/src/debug/strace/6.3-r0/src/xlat/bpf_op_jmp.h /usr/src/debug/strace/6.3-r0/src/xlat/inet_diag_ulp_info_tls_attrs.h /usr/src/debug/strace/6.3-r0/tests/qual_inject-retval.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_af_spec_bridge_vlan_tunnel_info_attrs.h /usr/src/debug/strace/6.3-r0/tests/landlock_create_ruleset.c /usr/src/debug/strace/6.3-r0
 /tests/s390_runtime_instr.c /usr/src/debug/strace/6.3-r0/tests/seccomp_get_action_avail.c /usr/src/debug/strace/6.3-r0/tests/sendfile.c /usr/src/debug/strace/6.3-r0/tests/attach-f-p.c /usr/src/debug/strace/6.3-r0/tests/get_mempolicy.c /usr/src/debug/strace/6.3-r0/tests/set_mempolicy.c /usr/src/debug/strace/6.3-r0/tests/chmod--secontext.c /usr/src/debug/strace/6.3-r0/tests/ioctl_kvm_run_common.c /usr/src/debug/strace/6.3-r0/tests/strace-p1-Y-p.c /usr/src/debug/strace/6.3-r0/src/xlat/netlink_sk_meminfo_indices.h /usr/src/debug/strace/6.3-r0/src/xlat/iffflags.h /usr/src/debug/strace/6.3-r0/tests/fork--pidns-translation.c /usr/src/debug/strace/6.3-r0/tests/munlockall.c /usr/src/debug/strace/6.3-r0/tests/nlattr_tcamsg.c /usr/src/debug/strace/6.3-r0/tests/nlattr_dcbmsg.c /usr/src/debug/strace/6.3-r0/tests/io_uring_setup.c /usr/src/debug/strace/6.3-r0/tests/vhangup.c /usr/src/debug/strace/6.3-r0/tests/nlattr_ndtmsg.c /usr/src/debug/strace/6.3-r0/src/xlat/alg_sockaddr_flags.h /usr/src/debug
 /strace/6.3-r0/src/xlat/bpf_test_run_flags.h /usr/src/debug/strace/6.3-r0/tests/prctl-arg2-intptr.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_neigh_fdb_ext_attrs.h /usr/src/debug/strace/6.3-r0/tests/io_uring_enter.c /usr/src/debug/strace/6.3-r0/src/xlat/landlock_rule_types.h /usr/src/debug/strace/6.3-r0/tests/execve--secontext.c /usr/src/debug/strace/6.3-r0/src/xlat/bsg_subprotocol.h /usr/src/debug/strace/6.3-r0/src/xlat/tcp_states.h /usr/src/debug/strace/6.3-r0/tests/ptrace_syscall_info.c /usr/src/debug/strace/6.3-r0/src/xlat/open_resolve_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/in6_addr_gen_mode.h /usr/src/debug/strace/6.3-r0/src/xlat/neighbor_cache_entry_flags.h /usr/src/debug/strace/6.3-r0/tests/oldselect.c /usr/src/debug/strace/6.3-r0/tests/sched_xetscheduler.c /usr/src/debug/strace/6.3-r0/src/xlat/nbd_ioctl_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/fs_ioc_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/sa_handler_values.h /usr/src/debug/strace/6.3-r0/tests/ioctl_perf.c
  /usr/src/debug/strace/6.3-r0/tests/osf_utimes.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_snap_flags_v2.h /usr/src/debug/strace/6.3-r0/tests/ioctl_tiocm.c /usr/src/debug/strace/6.3-r0/src/xlat/nf_ctnetlink_exp_msg_types.h /usr/src/debug/strace/6.3-r0/src/xlat/ptrace_setoptions_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/adjtimex_state.h /usr/src/debug/strace/6.3-r0/tests/nfnetlink_nft_compat.c /usr/src/debug/strace/6.3-r0/tests/printflags.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_vfinfo_list_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/getrandom_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/advise.h /usr/src/debug/strace/6.3-r0/tests/chdir.c /usr/src/debug/strace/6.3-r0/tests/chmod.c /usr/src/debug/strace/6.3-r0/tests/ioctl_sg_io_v3.c /usr/src/debug/strace/6.3-r0/src/xlat/gpio_line_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_dev_replace_results.h /usr/src/debug/strace/6.3-r0/src/xlat/nf_ulog_msg_types.h /usr/src/debug/strace/6.3-r0/tests/unix-pair-send-recv.c /
 usr/src/debug/strace/6.3-r0/src/xlat/btrfs_dev_replace_cmds.h /usr/src/debug/strace/6.3-r0/src/xlat/term_cflags_csize.h /usr/src/debug/strace/6.3-r0/src/xlat/term_oflags_bsdly.h /usr/src/debug/strace/6.3-r0/src/xlat/term_oflags_crdly.h /usr/src/debug/strace/6.3-r0/src/xlat/term_oflags_ffdly.h /usr/src/debug/strace/6.3-r0/src/xlat/term_oflags_nldly.h /usr/src/debug/strace/6.3-r0/src/xlat/term_oflags_vtdly.h /usr/src/debug/strace/6.3-r0/src/xlat/snmp_icmp6_stats.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_mdba_mdb_entry_attrs.h /usr/src/debug/strace/6.3-r0/tests/epoll_create1.c /usr/src/debug/strace/6.3-r0/tests/ioctl_counter.c /usr/src/debug/strace/6.3-r0/src/xlat/addrfams.h /usr/src/debug/strace/6.3-r0/src/xlat/mmap_prot.h /usr/src/debug/strace/6.3-r0/tests/printsignal.c /usr/src/debug/strace/6.3-r0/tests/qual_signal.c /usr/src/debug/strace/6.3-r0/src/xlat/bt_protocols.h /usr/src/debug/strace/6.3-r0/src/xlat/module_init_flags.h /usr/src/debug/strace/6.3-r0/tests/create_nl_socket.c 
 /usr/src/debug/strace/6.3-r0/src/xlat/ieee802154_addrs.h /usr/src/debug/strace/6.3-r0/src/xlat/schedulers.h /usr/src/debug/strace/6.3-r0/tests/quotactl-xfs.c /usr/src/debug/strace/6.3-r0/tests/get_page_size.c /usr/src/debug/strace/6.3-r0/tests/msg_control.c /usr/src/debug/strace/6.3-r0/src/xlat/inet_diag_bpf_storages_attrs.h /usr/src/debug/strace/6.3-r0/tests/faccessat-y--secontext.c /usr/src/debug/strace/6.3-r0/src/xlat/epollctls.h /usr/src/debug/strace/6.3-r0/tests/ip_mreq.c /usr/src/debug/strace/6.3-r0/tests/truncate.c /usr/src/debug/strace/6.3-r0/tests/zeroargc.c /usr/src/debug/strace/6.3-r0/tests/xutimes.c /usr/src/debug/strace/6.3-r0/src/xlat/sock_alg_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_ipx_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_kcm_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_llc_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_pnp_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_raw_options.h /usr/src/debug/strace/6.3-r0/src/xla
 t/sock_rds_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_tcp_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_tls_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_udp_options.h /usr/src/debug/strace/6.3-r0/src/xlat/ptp_extts_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/tcp_state_flags.h /usr/src/debug/strace/6.3-r0/tests/ip_local_port_range.c /usr/src/debug/strace/6.3-r0/tests/s390_pci_mmio_read_write.c /usr/src/debug/strace/6.3-r0/src/xlat/adjtimex_status.h /usr/src/debug/strace/6.3-r0/src/xlat/netlink_delete_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/clone_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/bpf_task_fd_type.h /usr/src/debug/strace/6.3-r0/tests/nlattr_tc_stats.c /usr/src/debug/strace/6.3-r0/src/xlat/nf_hook_msg_types.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_port_attrs.h /usr/src/debug/strace/6.3-r0/tests/sethostname.c /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_meta_fmts.h /usr/src/debug/strace/6.3-r0/src/xlat/netlink_flags.h /usr/src/debug/str
 ace/6.3-r0/tests/test_nlattr.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_fields.h /usr/src/debug/strace/6.3-r0/src/xlat/dcb_commands.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_font_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/sg_io_flags.h /usr/src/debug/strace/6.3-r0/tests/process_mrelease.c /usr/src/debug/strace/6.3-r0/src/xlat/notifyflags.h /usr/src/debug/strace/6.3-r0/src/xlat/sg_io_info.h /usr/src/debug/strace/6.3-r0/tests/fanotify_init.c /usr/src/debug/strace/6.3-r0/tests/fanotify_mark.c /usr/src/debug/strace/6.3-r0/tests/prctl-tagged-addr.c /usr/src/debug/strace/6.3-r0/src/xlat/hw_breakpoint_len.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_mce_kill.h /usr/src/debug/strace/6.3-r0/src/xlat/uring_setup_flags.h /usr/src/debug/strace/6.3-r0/tests/maybe_switch_current_tcp.c /usr/src/debug/strace/6.3-r0/src/xlat/pr_tagged_addr_enable.h /usr/src/debug/strace/6.3-r0/tests/printstr.c /usr/src/debug/strace/6.3-r0/tests/sockopt-sol_netlink.c /usr/src/debug/strace/6.3-r0/tests/umovestr.c 
 /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_fs_info_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/phonet_protocols.h /usr/src/debug/strace/6.3-r0/tests/sockopt-sol_socket.c /usr/src/debug/strace/6.3-r0/src/xlat/sock_options.h /usr/src/debug/strace/6.3-r0/src/xlat/name_to_handle_at_flags.h /usr/src/debug/strace/6.3-r0/tests/add_key.c /usr/src/debug/strace/6.3-r0/tests/xetpgid.c /usr/src/debug/strace/6.3-r0/tests/delay.c /usr/src/debug/strace/6.3-r0/tests/dirfd.c /usr/src/debug/strace/6.3-r0/tests/answer.c /usr/src/debug/strace/6.3-r0/tests/fchdir.c /usr/src/debug/strace/6.3-r0/src/xlat/packet_diag_attrs.h /usr/src/debug/strace/6.3-r0/tests/nlattr.c /usr/src/debug/strace/6.3-r0/src/xlat/futexbitset.h /usr/src/debug/strace/6.3-r0/src/xlat/packet_mreq_type.h /usr/src/debug/strace/6.3-r0/src/xlat/cap_version.h /usr/src/debug/strace/6.3-r0/tests/request_key.c /usr/src/debug/strace/6.3-r0/tests/subdir.c /usr/src/debug/strace/6.3-r0/src/xlat/sync_file_range_flags.h /usr/src/debug/strace/6.3
 -r0/tests/pidfd_send_signal.c /usr/src/debug/strace/6.3-r0/tests/umount.c /usr/src/debug/strace/6.3-r0/tests/select.c /usr/src/debug/strace/6.3-r0/tests/accept.c /usr/src/debug/strace/6.3-r0/tests/chroot.c /usr/src/debug/strace/6.3-r0/tests/linkat.c /usr/src/debug/strace/6.3-r0/tests/printpath-umovestr-peekdata.c /usr/src/debug/strace/6.3-r0/tests/openat.c /usr/src/debug/strace/6.3-r0/src/xlat/inet_diag_req_attrs.h /usr/src/debug/strace/6.3-r0/tests/faccessat--secontext.c /usr/src/debug/strace/6.3-r0/tests/nfnetlink_cttimeout.c /usr/src/debug/strace/6.3-r0/src/xlat/netlink_new_flags.h /usr/src/debug/strace/6.3-r0/tests/sock_filter-v.c /usr/src/debug/strace/6.3-r0/tests/linkat--secontext.c /usr/src/debug/strace/6.3-r0/tests/openat--secontext.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_addrlabel_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_input_types.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_tuner_types.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_tca_act_flags.h /usr/src/d
 ebug/strace/6.3-r0/tests/nfnetlink_ulog.c /usr/src/debug/strace/6.3-r0/tests/open_tree.c /usr/src/debug/strace/6.3-r0/src/xlat/inet_diag_ulp_info_attrs.h /usr/src/debug/strace/6.3-r0/tests/shutdown.c /usr/src/debug/strace/6.3-r0/tests/bpf-obj_get_info_by_fd.c /usr/src/debug/strace/6.3-r0/src/xlat/mq_attr_flags.h /usr/src/debug/strace/6.3-r0/tests/group_req.c /usr/src/debug/strace/6.3-r0/src/xlat/nt_descriptor_types.h /usr/src/debug/strace/6.3-r0/tests/filter_seccomp-perf.c /usr/src/debug/strace/6.3-r0/tests/lookup_dcookie.c /usr/src/debug/strace/6.3-r0/src/xlat/x86_xfeatures.h /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_qgroup_inherit_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/ptrace_events.h /usr/src/debug/strace/6.3-r0/tests/pkey_alloc.c /usr/src/debug/strace/6.3-r0/tests/tail_alloc.c /usr/src/debug/strace/6.3-r0/src/xlat/uffd_register_ioctl_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/perf_hw_cache_op_result_id.h /usr/src/debug/strace/6.3-r0/tests/stack-fcall.h /usr/src/debug
 /strace/6.3-r0/tests/ioctl_block.c /usr/src/debug/strace/6.3-r0/tests/stack-fcall.c /usr/src/debug/strace/6.3-r0/tests/ioctl_loop.c /usr/src/debug/strace/6.3-r0/tests/ioperm.c /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_control_ids.h /usr/src/debug/strace/6.3-r0/tests/ioprio.c /usr/src/debug/strace/6.3-r0/src/xlat/af_packet_versions.h /usr/src/debug/strace/6.3-r0/tests/link.c /usr/src/debug/strace/6.3-r0/tests/mmap.c /usr/src/debug/strace/6.3-r0/tests/mmsg.c /usr/src/debug/strace/6.3-r0/tests/open.c /usr/src/debug/strace/6.3-r0/tests/pipe.c /usr/src/debug/strace/6.3-r0/tests/poke.c /usr/src/debug/strace/6.3-r0/tests/poll.c /usr/src/debug/strace/6.3-r0/tests/swap.c /usr/src/debug/strace/6.3-r0/tests/sync.c /usr/src/debug/strace/6.3-r0/tests/xselect.c /usr/src/debug/strace/6.3-r0/tests/nlattr_smc_diag_msg.c /usr/src/debug/strace/6.3-r0/src/xlat/fib_rule_actions.h /usr/src/debug/strace/6.3-r0/tests/tee.c /usr/src/debug/strace/6.3-r0/tests/xchownx.c /usr/src/debug/strace/6.3-r0/tests/bpf
 .c /usr/src/debug/strace/6.3-r0/tests/dev-yy.c /usr/src/debug/strace/6.3-r0/tests/inet-cmsg.c /usr/src/debug/strace/6.3-r0/src/xlat/packet_diag_show.h /usr/src/debug/strace/6.3-r0/src/xlat/perf_type_id.h /usr/src/debug/strace/6.3-r0/src/xlat/bpf_map_types.h /usr/src/debug/strace/6.3-r0/tests/nlattr_ifla_proto_down_reason.c /usr/src/debug/strace/6.3-r0/tests/sockname.c /usr/src/debug/strace/6.3-r0/tests/msg_name.c /usr/src/debug/strace/6.3-r0/src/xlat/ptrace_syscall_info_op.h /usr/src/debug/strace/6.3-r0/tests/prctl-seccomp-strict.c /usr/src/debug/strace/6.3-r0/src/xlat/mtd_nandecc_options.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_sud_cmds.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_pppol2tp_options.h /usr/src/debug/strace/6.3-r0/tests/nlattr_packet_diag_msg.c /usr/src/debug/strace/6.3-r0/tests/clock_xettime-common.c /usr/src/debug/strace/6.3-r0/src/xlat/sigev_value.h /usr/src/debug/strace/6.3-r0/src/xlat/personality_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/personality_types.h
  /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_dev_replace_state.h /usr/src/debug/strace/6.3-r0/src/xlat/netlink_types.h /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_features_compat.h /usr/src/debug/strace/6.3-r0/src/xlat/cap_mask0.h /usr/src/debug/strace/6.3-r0/src/xlat/cap_mask1.h /usr/src/debug/strace/6.3-r0/src/xlat/xdp_flags.h /usr/src/debug/strace/6.3-r0/tests/prctl-securebits.c /usr/src/debug/strace/6.3-r0/src/xlat/seccomp_ret_action.h /usr/src/debug/strace/6.3-r0/src/xlat/isdn_protocols.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_type_flags.h /usr/src/debug/strace/6.3-r0/tests/kernel_old_timespec.h /usr/src/debug/strace/6.3-r0/tests/mmsg_name.c /usr/src/debug/strace/6.3-r0/tests/getpeername.c /usr/src/debug/strace/6.3-r0/src/xlat/bpf_query_flags.h /usr/src/debug/strace/6.3-r0/tests/rename.c /usr/src/debug/strace/6.3-r0/tests/splice.c /usr/src/debug/strace/6.3-r0/tests/execve.c /usr/src/debug/strace/6.3-r0/tests/ptrace.c /usr/src/debug/strace/6.3-r0/src/xlat/tee_ioctl_impl_ids.
 h /usr/src/debug/strace/6.3-r0/src/xlat/ubi_volume_flags.h /usr/src/debug/strace/6.3-r0/tests/signal2name.c /usr/src/debug/strace/6.3-r0/tests/clock_t_str.c /usr/src/debug/strace/6.3-r0/tests/qual_inject-signal.c /usr/src/debug/strace/6.3-r0/src/xlat/open_access_modes.h /usr/src/debug/strace/6.3-r0/tests/sigprocmask.c /usr/src/debug/strace/6.3-r0/tests/prctl-seccomp-filter-v.c /usr/src/debug/strace/6.3-r0/src/xlat/qipcrtr_ports.h /usr/src/debug/strace/6.3-r0/tests/nlattr_ifla_linkinfo.c /usr/src/debug/strace/6.3-r0/src/xlat/kd_font_ops.h /usr/src/debug/strace/6.3-r0/tests/init_delete_module.h /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_balance_ctl_cmds.h /usr/src/debug/strace/6.3-r0/tests/futex_waitv.c /usr/src/debug/strace/6.3-r0/tests/process_vm_readv_writev.c /usr/src/debug/strace/6.3-r0/tests/nlattr_rtgenmsg.c /usr/src/debug/strace/6.3-r0/tests/symlink.c /usr/src/debug/strace/6.3-r0/src/xlat/evdev_abs.h /usr/src/debug/strace/6.3-r0/src/xlat/evdev_snd.h /usr/src/debug/strace/6.3-
 r0/src/xlat/modetypes.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_shift_keys.h /usr/src/debug/strace/6.3-r0/tests/epoll_ctl.c /usr/src/debug/strace/6.3-r0/tests/netlink_kobject_uevent.c /usr/src/debug/strace/6.3-r0/tests/landlock_add_rule.c /usr/src/debug/strace/6.3-r0/tests/secontext.h /usr/src/debug/strace/6.3-r0/tests/getrandom.c /usr/src/debug/strace/6.3-r0/tests/print_time.c /usr/src/debug/strace/6.3-r0/tests/nlattr_nlmsgerr.c /usr/src/debug/strace/6.3-r0/tests/semtimedop-syscall.c /usr/src/debug/strace/6.3-r0/src/xlat/ifstats_attr_flags.h /usr/src/debug/strace/6.3-r0/tests/migrate_pages.c /usr/src/debug/strace/6.3-r0/tests/looping_threads.c /usr/src/debug/strace/6.3-r0/tests/read-write.c /usr/src/debug/strace/6.3-r0/src/xlat/nl_crypto_types.h /usr/src/debug/strace/6.3-r0/tests/prctl-sve.c /usr/src/debug/strace/6.3-r0/src/xlat/fan_event_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/ipc_private.h /usr/src/debug/strace/6.3-r0/src/xlat/splice_flags.h /usr/src/debug/strace/6.3-r
 0/tests/getsockname--secontext.c /usr/src/debug/strace/6.3-r0/tests/restart_syscall.c /usr/src/debug/strace/6.3-r0/src/xlat/ifstats_xstats_bond_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_rxrpc_options.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_vsock_options.h /usr/src/debug/strace/6.3-r0/tests/tracer_ppid_pgid_sid.c /usr/src/debug/strace/6.3-r0/src/xlat/semctl_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/shmctl_flags.h /usr/src/debug/strace/6.3-r0/tests/umovestr_cached_adjacent.c /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_ascii_keys.h /usr/src/debug/strace/6.3-r0/src/xlat/sigsegv_codes.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_vf_info_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_vf_port_attrs.h /usr/src/debug/strace/6.3-r0/tests/nlattr_br_port_msg.c /usr/src/debug/strace/6.3-r0/src/xlat/unix_diag_attrs.h /usr/src/debug/strace/6.3-r0/tests/sync_file_range2.c /usr/src/debug/strace/6.3-r0/src/xlat/flockcmds.h /usr/src/debug/strace/6.3-r0/tests/setdomainn
 ame.c /usr/src/debug/strace/6.3-r0/src/xlat/perf_attr_size.h /usr/src/debug/strace/6.3-r0/tests/clone_parent.c /usr/src/debug/strace/6.3-r0/tests/clone_ptrace.c /usr/src/debug/strace/6.3-r0/tests/epoll_pwait2.c /usr/src/debug/strace/6.3-r0/src/xlat/fsmount_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/tee_ioctl_max_arg_size.h /usr/src/debug/strace/6.3-r0/src/xlat/gpio_handle_flags.h /usr/src/debug/strace/6.3-r0/tests/attach-p-cmd.h /usr/src/debug/strace/6.3-r0/tests/prctl-set_vma.c /usr/src/debug/strace/6.3-r0/tests/xattr-strings.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_neigh_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_route_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/priorities.h /usr/src/debug/strace/6.3-r0/src/xlat/ifstats_xstats_bond_3ad_attrs.h /usr/src/debug/strace/6.3-r0/tests/netlink_generic.c /usr/src/debug/strace/6.3-r0/tests/kern_features.c /usr/src/debug/strace/6.3-r0/tests/printstrn-umoven-peekdata.c /usr/src/debug/strace/6.3-r0/src/xlat/resource_flags.h /u
 sr/src/debug/strace/6.3-r0/src/xlat/tls_info_versions.h /usr/src/debug/strace/6.3-r0/src/xlat/ioprio_who.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_rta_metrics_attrs.h /usr/src/debug/strace/6.3-r0/tests/umode_t.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_nha_res_bucket_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_mdwe_flags.h /usr/src/debug/strace/6.3-r0/tests/vmsplice.c /usr/src/debug/strace/6.3-r0/src/xlat/nf_queue_msg_types.h /usr/src/debug/strace/6.3-r0/src/xlat/term_line_discs.h /usr/src/debug/strace/6.3-r0/tests/ioctl_inotify.c /usr/src/debug/strace/6.3-r0/src/xlat/sched_flags.h /usr/src/debug/strace/6.3-r0/tests/net-yy-unix.c /usr/src/debug/strace/6.3-r0/src/xlat/ebpf_op_alu.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_spec_cmds.h /usr/src/debug/strace/6.3-r0/src/xlat/efd_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/sfd_flags.h /usr/src/debug/strace/6.3-r0/tests/status-unfinished-threads.c /usr/src/debug/strace/6.3-r0/src/xlat/tee_ioctl_shm_flags.h /usr/src/debug/strace
 /6.3-r0/src/xlat/ptp_perout_flags.h /usr/src/debug/strace/6.3-r0/tests/getegid32.c /usr/src/debug/strace/6.3-r0/tests/geteuid32.c /usr/src/debug/strace/6.3-r0/src/xlat/pkey_access.h /usr/src/debug/strace/6.3-r0/tests/sockopt-timestamp.c /usr/src/debug/strace/6.3-r0/tests/execveat--secontext.c /usr/src/debug/strace/6.3-r0/tests/modify_ldt.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_balance_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/at_statx_sync_types.h /usr/src/debug/strace/6.3-r0/src/xlat/smc_decl_codes.h /usr/src/debug/strace/6.3-r0/tests/fsync-y.c /usr/src/debug/strace/6.3-r0/tests/umovestr2.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_tc_action_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_dcb_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_mdb_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/inet6_devconf_indices.h /usr/src/debug/strace/6.3-r0/src/xlat/epollflags.h /usr/src/debug/strace/6.3-r0/src/xlat/mpol_modes.h /usr/src/debug/strace/6.3-r0/tests/ioctl_ptp.c /usr/s
 rc/debug/strace/6.3-r0/tests/prctl-no-args.c /usr/src/debug/strace/6.3-r0/src/xlat/seccomp_filter_flags.h /usr/src/debug/strace/6.3-r0/tests/prctl-spec-inject.c /usr/src/debug/strace/6.3-r0/tests/netlink_inet_diag.c /usr/src/debug/strace/6.3-r0/tests/netlink_sock_diag.c /usr/src/debug/strace/6.3-r0/tests/netlink_unix_diag.c /usr/src/debug/strace/6.3-r0/tests/file_handle.c /usr/src/debug/strace/6.3-r0/src/xlat/uring_setup_features.h /usr/src/debug/strace/6.3-r0/src/xlat/tls_info_configs.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_af_spec_inet_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/umount_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/hdio_busstates.h /usr/src/debug/strace/6.3-r0/tests/sigsuspend.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_tree_objectids.h /usr/src/debug/strace/6.3-r0/src/xlat/sigaltstack_flags.h /usr/src/debug/strace/6.3-r0/tests/time_enjoyment.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_sched_core_pidtypes.h /usr/src/debug/strace/6.3-r0/tests/strace--de
 code-pids-comm.c /usr/src/debug/strace/6.3-r0/src/xlat/evdev_switch.h /usr/src/debug/strace/6.3-r0/tests/kernel_version.c /usr/src/debug/strace/6.3-r0/src/xlat/msgctl_flags.h /usr/src/debug/strace/6.3-r0/tests/ioctl_fiemap.c /usr/src/debug/strace/6.3-r0/src/xlat/if_dqinfo_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/tee_ioctl_login_types.h /usr/src/debug/strace/6.3-r0/tests/lock_file.c /usr/src/debug/strace/6.3-r0/src/xlat/ethernet_protocols.h /usr/src/debug/strace/6.3-r0/src/xlat/uring_ops.h /usr/src/debug/strace/6.3-r0/tests/times-fail.c /usr/src/debug/strace/6.3-r0/tests/fallocate.c /usr/src/debug/strace/6.3-r0/tests/ftruncate.c /usr/src/debug/strace/6.3-r0/src/xlat/numa_node.h /usr/src/debug/strace/6.3-r0/src/xlat/cap.h /usr/src/debug/strace/6.3-r0/src/xlat/x86_xfeature_bits.h /usr/src/debug/strace/6.3-r0/src/xlat/pidfd_open_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_spec_keys.h /usr/src/debug/strace/6.3-r0/tests/unlinkat.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_n
 eightbl_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_buf_flags_ts_type.h /usr/src/debug/strace/6.3-r0/tests/prctl-pac-reset-keys.c /usr/src/debug/strace/6.3-r0/tests/check_sigblock.c /usr/src/debug/strace/6.3-r0/src/xlat/btrfs_space_info_flags.h /usr/src/debug/strace/6.3-r0/tests/landlock_restrict_self.c /usr/src/debug/strace/6.3-r0/tests/net-sockaddr.c /usr/src/debug/strace/6.3-r0/tests/skip_unavailable.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_xdp_attrs.h /usr/src/debug/strace/6.3-r0/tests/nsyscalls.c /usr/src/debug/strace/6.3-r0/src/xlat/pr_unalign_flags.h /usr/src/debug/strace/6.3-r0/tests/xstatfsx.c /usr/src/debug/strace/6.3-r0/tests/fchmod--secontext.c /usr/src/debug/strace/6.3-r0/tests/tampering-notes.c /usr/src/debug/strace/6.3-r0/tests/clone3.c /usr/src/debug/strace/6.3-r0/tests/delete_module.c /usr/src/debug/strace/6.3-r0/src/xlat/uffd_zeropage_flags.h /usr/src/debug/strace/6.3-r0/tests/fill_memory.c /usr/src/debug/strace/6.3-r0/src/xlat/rtc_backup_switch_mod
 es.h /usr/src/debug/strace/6.3-r0/tests/test_ucopy.c /usr/src/debug/strace/6.3-r0/src/xlat/lockfcmds.h /usr/src/debug/strace/6.3-r0/src/xlat/socktypes.h /usr/src/debug/strace/6.3-r0/src/xlat/can_protocols.h /usr/src/debug/strace/6.3-r0/src/xlat/evdev_mtslots.h /usr/src/debug/strace/6.3-r0/tests/test_ucopy.h /usr/src/debug/strace/6.3-r0/src/xlat/kd_key_slock_keys.h /usr/src/debug/strace/6.3-r0/src/xlat/uring_op_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_sme_vl_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_sve_vl_flags.h /usr/src/debug/strace/6.3-r0/tests/mmsg-silent.c /usr/src/debug/strace/6.3-r0/tests/prctl-mce-kill.c /usr/src/debug/strace/6.3-r0/src/xlat/shutdown_modes.h /usr/src/debug/strace/6.3-r0/tests/fchmodat--secontext.c /usr/src/debug/strace/6.3-r0/src/xlat/rtc_features.h /usr/src/debug/strace/6.3-r0/tests/status-none-threads.c /usr/src/debug/strace/6.3-r0/tests/qual_fault.c /usr/src/debug/strace/6.3-r0/src/xlat/netlink_protocols.h /usr/src/debug/strace/6.3-r0/src/x
 lat/quota_formats.h /usr/src/debug/strace/6.3-r0/tests/status-unfinished.c /usr/src/debug/strace/6.3-r0/src/xlat/termios_cc.h /usr/src/debug/strace/6.3-r0/src/xlat/loop_flags_options.h /usr/src/debug/strace/6.3-r0/tests/ioctl_evdev.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_mdba_router_pattr_attrs.h /usr/src/debug/strace/6.3-r0/tests/rt_tgsigqueueinfo.c /usr/src/debug/strace/6.3-r0/tests/sched_rr_get_interval.c /usr/src/debug/strace/6.3-r0/src/xlat/adjtimex_modes.h /usr/src/debug/strace/6.3-r0/src/xlat/membarrier_cmds.h /usr/src/debug/strace/6.3-r0/src/xlat/mbind_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/routing_flags.h /usr/src/debug/strace/6.3-r0/tests/fdatasync.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_info_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/mctp_nets.h /usr/src/debug/strace/6.3-r0/src/xlat/memfd_create_flags.h /usr/src/debug/strace/6.3-r0/tests/nlattr_cachereport.c /usr/src/debug/strace/6.3-r0/src/xlat/counter_ioctl_component_types.h /usr/src/debug/strac
 e/6.3-r0/src/xlat/rtnl_tc_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/sock_nfcllcp_options.h /usr/src/debug/strace/6.3-r0/tests/ppoll.c /usr/src/debug/strace/6.3-r0/src/xlat/nl_selinux_types.h /usr/src/debug/strace/6.3-r0/tests/aio_pgetevents.c /usr/src/debug/strace/6.3-r0/src/xlat/mptcp_subflow_flags.h /usr/src/debug/strace/6.3-r0/tests/attach-p-cmd-p.c /usr/src/debug/strace/6.3-r0/src/xlat/key_spec.h /usr/src/debug/strace/6.3-r0/tests/sendfile64.c /usr/src/debug/strace/6.3-r0/src/xlat/pr_spec_set_store_bypass_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/perf_event_sample_format.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_spec_get_store_bypass_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/socketcalls.h /usr/src/debug/strace/6.3-r0/tests/set_sigblock.c /usr/src/debug/strace/6.3-r0/src/xlat/inet_diag_bpf_storage_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/rename_flags.h /usr/src/debug/strace/6.3-r0/tests/sched_xetaffinity.c /usr/src/debug/strace/6.3-r0/tests/semtimedop-ipc.c /usr
 /src/debug/strace/6.3-r0/tests/setresugid.c /usr/src/debug/strace/6.3-r0/tests/getresugid.c /usr/src/debug/strace/6.3-r0/src/xlat/if_dqblk_valid.h /usr/src/debug/strace/6.3-r0/tests/attach-p-cmd-cmd.c /usr/src/debug/strace/6.3-r0/tests/ifindex.c /usr/src/debug/strace/6.3-r0/tests/inotify_init.c /usr/src/debug/strace/6.3-r0/tests/access.c /usr/src/debug/strace/6.3-r0/tests/status.c /usr/src/debug/strace/6.3-r0/tests/uio.c /usr/src/debug/strace/6.3-r0/src/xlat/evdev_keycode.h /usr/src/debug/strace/6.3-r0/src/xlat/pr_fp_mode.h /usr/src/debug/strace/6.3-r0/tests/getcpu.c /usr/src/debug/strace/6.3-r0/tests/prctl-tsc.c /usr/src/debug/strace/6.3-r0/tests/so_linger.c /usr/src/debug/strace/6.3-r0/src/xlat/uffd_api_features.h /usr/src/debug/strace/6.3-r0/src/xlat/kvm_cpuid_flags.h /usr/src/debug/strace/6.3-r0/tests/run_expect_termsig.c /usr/src/debug/strace/6.3-r0/src/xlat/packet_diag_info_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/lwtunnel_encap_types.h /usr/src/debug/strace/6.3-r0/tests/
 unix-pair-sendto-recvfrom.c /usr/src/debug/strace/6.3-r0/src/xlat/inotify_init_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/term_cflags.h /usr/src/debug/strace/6.3-r0/src/xlat/term_iflags.h /usr/src/debug/strace/6.3-r0/src/xlat/term_lflags.h /usr/src/debug/strace/6.3-r0/src/xlat/term_oflags.h /usr/src/debug/strace/6.3-r0/tests/xettimeofday.c /usr/src/debug/strace/6.3-r0/src/xlat/bpf_map_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/membarrier_flags.h /usr/src/debug/strace/6.3-r0/tests/is_linux_mips_n64.c /usr/src/debug/strace/6.3-r0/tests/printxval.c /usr/src/debug/strace/6.3-r0/src/xlat/mdb_flags.h /usr/src/debug/strace/6.3-r0/tests/readv.c /usr/src/debug/strace/6.3-r0/tests/rmdir.c /usr/src/debug/strace/6.3-r0/tests/lseek.c /usr/src/debug/strace/6.3-r0/tests/mbind.c /usr/src/debug/strace/6.3-r0/tests/mknod.c /usr/src/debug/strace/6.3-r0/tests/mlock.c /usr/src/debug/strace/6.3-r0/tests/btrfs.c /usr/src/debug/strace/6.3-r0/tests/statx.c /usr/src/debug/strace/6.3-r0/tests/times.c /u
 sr/src/debug/strace/6.3-r0/tests/tkill.c /usr/src/debug/strace/6.3-r0/src/xlat/ptrace_peeksiginfo_flags.h /usr/src/debug/strace/6.3-r0/src/xlat/v4l2_tuner_audmodes.h /usr/src/debug/strace/6.3-r0/tests/netlink_audit.c /usr/src/debug/strace/6.3-r0/tests/netlink_route.c /usr/src/debug/strace/6.3-r0/src/xlat/baud_options.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_nexthop_attrs.h /usr/src/debug/strace/6.3-r0/tests/tests.h /usr/src/debug/strace/6.3-r0/tests/old_mmap.c /usr/src/debug/strace/6.3-r0/src/xlat/sock_xdp_options.h /usr/src/debug/strace/6.3-r0/src/xlat/counter_ioctl_event_types.h /usr/src/debug/strace/6.3-r0/tests/epoll_pwait.c /usr/src/debug/strace/6.3-r0/src/xlat/uffd_flags.h /usr/src/debug/strace/6.3-r0/tests/ioctl_sg_io_v4.c /usr/src/debug/strace/6.3-r0/tests/status-detached-threads.c /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_bridge_modes.h /usr/src/debug/strace/6.3-r0/src/xlat/timerfdflags.h /usr/src/debug/strace/6.3-r0/tests/syslog.c /usr/src/debug/strace/6.3-r0/tes
 ts/fspick.c /usr/src/debug/strace/6.3-r0/src/xlat/perf_event_open_flags.h /usr/src/debug/strace/6.3-r0/tests/llseek.c /usr/src/debug/strace/6.3-r0/tests/unlink.c /usr/src/debug/strace/6.3-r0/tests/semtimedop-common.c /usr/src/debug/strace/6.3-r0/src/xlat/faccessat_flags.h /usr/src/debug/strace/6.3-r0/tests/fcntl64.c /usr/src/debug/strace/6.3-r0/tests/nlattr_fib_rule_hdr.c /usr/src/debug/strace/6.3-r0/src/xlat/nfc_saps.h /usr/src/debug/strace/6.3-r0/src/xlat/rtnl_ifla_info_data_tun_attrs.h /usr/src/debug/strace/6.3-r0/src/xlat/netfilter_versions.h /usr/src/debug/strace/6.3-r0/src/xlat/nl_netfilter_subsys_ids.h /usr/src/debug/strace/6.3-r0/src/xlat/nf_nft_compat_msg_types.h /usr/src/debug/strace/6.3-r0/tests/prctl-name.c /usr/src/debug/strace/6.3-r0/src/xlat/perf_hw_cache_op_id.h /usr/src/debug/strace/6.3-r0/src/xlat/ieee802154_pan_ids.h /usr/src/debug/strace/6.3-r0/tests/nlattr_ifla_af_spec.c /usr/src/debug/strace/6.3-r0/src/xlat/inet_devconf_indices.h /usr/src/debug/strace/6.3-r0/te
 sts/sigaltstack.c /usr/src/debug/strace/6.3-r0/src/xlat/evdev_leds.h /usr/src/debug/strace/6.3-r0/src/xlat/evdev_misc.h /usr/src/debug/strace/6.3-r0/src/xlat/evdev_prop.h /usr/src/debug/strace/6.3-r0/src/xlat/ifstats_xstats_type_attrs.h /usr/src/debug/strace/6.3-r0/tests/segv_accerr.c /usr/src/debug/strace/6.3-r0/tests/signalfd4.c /usr/src/debug/strace/6.3-r0/tests/pidns-cache.c /usr/src/debug/strace/6.3-r0/tests/prctl-sched-core.c /usr/src/debug/strace/6.3-r0/src/xlat/smc_link_group_roles.h /usr/src/debug/strace/6.3-r0/tests/readlinkat.c", added "/usr/src/debug/strace/6.4-r0/src/xlat/evdev_switch.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_dev_replace_results.h /usr/src/debug/strace/6.4-r0/src/xlat/uffd_register_mode_flags.h /usr/src/debug/strace/6.4-r0/tests/prctl-pac-reset-keys.c /usr/src/debug/strace/6.4-r0/src/xlat/sock_netlink_options.h /usr/src/debug/strace/6.4-r0/tests/quotactl-xfs.c /usr/src/debug/strace/6.4-r0/src/xlat/hdio_busstates.h /usr/src/debug/strace/6.4-r0/tests/
 scm_rights.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/tls.h /usr/src/debug/strace/6.4-r0/src/xlat/statfs_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_dev_replace_cmds.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_font_flags.h /usr/src/debug/strace/6.4-r0/tests/umovestr_cached_adjacent.c /usr/src/debug/strace/6.4-r0/tests/faccessat-y--secontext.c /usr/src/debug/strace/6.4-r0/src/xlat/term_oflags.h /usr/src/debug/strace/6.4-r0/src/xlat/term_cflags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/qrtr.h /usr/src/debug/strace/6.4-r0/src/xlat/term_iflags.h /usr/src/debug/strace/6.4-r0/src/xlat/term_lflags.h /usr/src/debug/strace/6.4-r0/tests/netlink_protocol.c /usr/src/debug/strace/6.4-r0/src/xlat/bsg_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/msg_flags.h /usr/src/debug/strace/6.4-r0/tests/ioctl_fiemap.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/mctp.h /usr/src/debug/strace/6.4-r0/src/xlat/nbd_ioctl_flags.h /usr/src/debug/str
 ace/6.4-r0/tests/fsconfig.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_control_id_bases.h /usr/src/debug/strace/6.4-r0/tests/hexquote_strndup.c /usr/src/debug/strace/6.4-r0/src/xlat/nl_netfilter_msg_types.h /usr/src/debug/strace/6.4-r0/tests/move_pages.c /usr/src/debug/strace/6.4-r0/tests/set_mempolicy_home_node.c /usr/src/debug/strace/6.4-r0/src/xlat/bpf_map_types.h /usr/src/debug/strace/6.4-r0/src/xlat/aio_iocb_flags.h /usr/src/debug/strace/6.4-r0/tests/ioctl_v4l2.c /usr/src/debug/strace/6.4-r0/src/xlat/futexops.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_xdp_attached_mode.h /usr/src/debug/strace/6.4-r0/src/xlat/counter_ioctl_event_types.h /usr/src/debug/strace/6.4-r0/src/xlat/ebpf_class.h /usr/src/debug/strace/6.4-r0/src/xlat/schedulers.h /usr/src/debug/strace/6.4-r0/src/xlat/nf_nft_compat_msg_types.h /usr/src/debug/strace/6.4-r0/src/xlat/fib_rule_actions.h /usr/src/debug/strace/6.4-r0/src/xlat/nfc_saps.h /usr/src/debug/strace/6.4-r0/tests/nlattr_ifaddrmsg.c /usr/src/debug/
 strace/6.4-r0/tests/nlattr_ifinfomsg.c /usr/src/debug/strace/6.4-r0/src/xlat/futex_waiter_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/pr_tagged_addr_mte_tcf.h /usr/src/debug/strace/6.4-r0/src/xlat/getsock_options.h /usr/src/debug/strace/6.4-r0/src/xlat/setsock_options.h /usr/src/debug/strace/6.4-r0/tests/trie_test.c /usr/src/debug/strace/6.4-r0/tests/prctl-unalign.c /usr/src/debug/strace/6.4-r0/src/xlat/advise.h /usr/src/debug/strace/6.4-r0/tests/qual_inject-error-signal.c /usr/src/debug/strace/6.4-r0/src/xlat/tee_ioctl_impl_ids.h /usr/src/debug/strace/6.4-r0/tests/nlattr_netconfmsg.c /usr/src/debug/strace/6.4-r0/src/xlat/evdev_leds.h /usr/src/debug/strace/6.4-r0/src/xlat/evdev_misc.h /usr/src/debug/strace/6.4-r0/src/xlat/evdev_prop.h /usr/src/debug/strace/6.4-r0/src/xlat/inotify_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/fs.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/in.h /usr/src/debug/strace/6.4-r0/src/xlat/ptrace_events.h /usr/src
 /debug/strace/6.4-r0/src/xlat/multicast_router_types.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_colorspaces.h /usr/src/debug/strace/6.4-r0/src/xlat/cap_version.h /usr/src/debug/strace/6.4-r0/tests/attach-p-cmd-cmd.c /usr/src/debug/strace/6.4-r0/tests/nfnetlink_acct.c /usr/src/debug/strace/6.4-r0/src/xlat/close_range_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/dqblk_xfs.h /usr/src/debug/strace/6.4-r0/src/xlat/mq_attr_flags.h /usr/src/debug/strace/6.4-r0/tests/fchmod--secontext.c /usr/src/debug/strace/6.4-r0/tests/newfstatat.c /usr/src/debug/strace/6.4-r0/tests/ioctl_kvm_run_common.c /usr/src/debug/strace/6.4-r0/src/xlat/netlink_sk_meminfo_indices.h /usr/src/debug/strace/6.4-r0/tests/fill_memory.c /usr/src/debug/strace/6.4-r0/src/xlat/setns_types.h /usr/src/debug/strace/6.4-r0/src/xlat/waitid_types.h /usr/src/debug/strace/6.4-r0/src/xlat/bpf_rval.h /usr/src/debug/strace/6.4-r0/tests/nlattr_inet_diag_req_compat.c /usr/src/debug/strace/6.4-r0/src/xlat/mtd_otp
 _options.h /usr/src/debug/strace/6.4-r0/tests/prctl-cap-ambient.c /usr/src/debug/strace/6.4-r0/src/xlat/quotacmds.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_br_boolopts.h /usr/src/debug/strace/6.4-r0/tests/pidfd_send_signal.c /usr/src/debug/strace/6.4-r0/tests/segv_pkuerr.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/btrfs_tree.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/perf_event.h /usr/src/debug/strace/6.4-r0/tests/prctl-tagged-addr.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netlink_diag.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_scrub_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_addrlabel_attrs.h /usr/src/debug/strace/6.4-r0/tests/times-fail.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/asm/fcntl.h /usr/src/debug/strace/6.4-r0/src/xlat/neighbor_cache_entry_flags.h /usr/src/debug/strace/6.4-r0/tests/pselect6-common.c /usr/src/debug/strace/6.4-r0/src/xlat/smc_decl_codes.h /usr/src/debug/strace/6
 .4-r0/tests/fchmodat--secontext.c /usr/src/debug/strace/6.4-r0/tests/rt_sigtimedwait.c /usr/src/debug/strace/6.4-r0/src/xlat/memfd_create_flags.h /usr/src/debug/strace/6.4-r0/tests/seccomp-filter-v.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/dm-ioctl.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_qgroup_status_flags.h /usr/src/debug/strace/6.4-r0/tests/mmsg-silent.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netfilter/nfnetlink_cthelper.h /usr/src/debug/strace/6.4-r0/tests/recvfrom.c /usr/src/debug/strace/6.4-r0/tests/linkat--secontext.c /usr/src/debug/strace/6.4-r0/tests/openat--secontext.c /usr/src/debug/strace/6.4-r0/tests/acct.c /usr/src/debug/strace/6.4-r0/tests/caps.c /usr/src/debug/strace/6.4-r0/src/xlat/bpf_prog_flags.h /usr/src/debug/strace/6.4-r0/tests/dup2.c /usr/src/debug/strace/6.4-r0/tests/dup3.c /usr/src/debug/strace/6.4-r0/tests/iopl.c /usr/src/debug/strace/6.4-r0/tests/kcmp.c /usr/src/debug/strace/6.4-r0/tests/kill.c /usr/src/de
 bug/strace/6.4-r0/tests/semtimedop-ipc.c /usr/src/debug/strace/6.4-r0/tests/link.c /usr/src/debug/strace/6.4-r0/src/xlat/ptp_extts_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/tcp_state_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_control_classes.h /usr/src/debug/strace/6.4-r0/src/xlat/ifstats_xstats_bond_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/loop_crypt_type_options.h /usr/src/debug/strace/6.4-r0/tests/getcpu.c /usr/src/debug/strace/6.4-r0/src/xlat/bpf_class.h /usr/src/debug/strace/6.4-r0/src/xlat/rwf_flags.h /usr/src/debug/strace/6.4-r0/tests/access.c /usr/src/debug/strace/6.4-r0/tests/status.c /usr/src/debug/strace/6.4-r0/src/xlat/sigbus_codes.h /usr/src/debug/strace/6.4-r0/src/xlat/unix_diag_show.h /usr/src/debug/strace/6.4-r0/src/xlat/bpf_test_run_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/inet_diag_bpf_storage_attrs.h /usr/src/debug/strace/6.4-r0/tests/nlattr_tca_stab.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netconf.h /usr/src/debug/stra
 ce/6.4-r0/src/xlat/ax25_protocols.h /usr/src/debug/strace/6.4-r0/tests/clone_parent.c /usr/src/debug/strace/6.4-r0/tests/clone_ptrace.c /usr/src/debug/strace/6.4-r0/tests/epoll_pwait2.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/nexthop.h /usr/src/debug/strace/6.4-r0/src/xlat/landlock_create_ruleset_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/keyctl_move_flags.h /usr/src/debug/strace/6.4-r0/tests/ioctl_kvm_run_auxstr_vcpu.c /usr/src/debug/strace/6.4-r0/tests/sockaddr_xlat.c /usr/src/debug/strace/6.4-r0/tests/localtime.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_tc_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/blkpg_ops.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ipmra_creport_attr.h /usr/src/debug/strace/6.4-r0/src/xlat/cap_mask0.h /usr/src/debug/strace/6.4-r0/src/xlat/cap_mask1.h /usr/src/debug/strace/6.4-r0/src/xlat/xdp_flags.h /usr/src/debug/strace/6.4-r0/tests/ipc_msgbuf.c /usr/src/debug/strace/6.4-r0/src/xlat/snmp_icmp6_stats.h /usr/src/debug/strace/6.4-r
 0/tests/sched_xetparam.c /usr/src/debug/strace/6.4-r0/src/xlat/kvm_exit_reason.h /usr/src/debug/strace/6.4-r0/src/xlat/fiemap_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/mremap_flags.h /usr/src/debug/strace/6.4-r0/tests/aio_pgetevents.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_memories.h /usr/src/debug/strace/6.4-r0/tests/getegid32.c /usr/src/debug/strace/6.4-r0/tests/geteuid32.c /usr/src/debug/strace/6.4-r0/src/xlat/futexwakecmps.h /usr/src/debug/strace/6.4-r0/tests/nlattr_ifla_proto_down_reason.c /usr/src/debug/strace/6.4-r0/src/xlat/ptrace_peeksiginfo_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/xattrflags.h /usr/src/debug/strace/6.4-r0/tests/seccomp_get_notif_sizes.c /usr/src/debug/strace/6.4-r0/tests/ioctl_scsi.c /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_cont_reading_from_srcdev_mode.h /usr/src/debug/strace/6.4-r0/tests/count-f.c /usr/src/debug/strace/6.4-r0/tests/prctl-capbset.c /usr/src/debug/strace/6.4-r0/tests/vfork-f.c /usr/src/debug/strace/6.4-r0/tests/readv.c /usr
 /src/debug/strace/6.4-r0/tests/rmdir.c /usr/src/debug/strace/6.4-r0/tests/btrfs.c /usr/src/debug/strace/6.4-r0/src/xlat/fan_init_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/fan_mark_flags.h /usr/src/debug/strace/6.4-r0/tests/kernel_old_timespec.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/packet_diag.h /usr/src/debug/strace/6.4-r0/src/xlat/smc_diag_extended_flags.h /usr/src/debug/strace/6.4-r0/tests/renameat2.c /usr/src/debug/strace/6.4-r0/tests/sigsuspend.c /usr/src/debug/strace/6.4-r0/src/xlat/sigsys_codes.h /usr/src/debug/strace/6.4-r0/tests/nlattr_inet_diag_msg.c /usr/src/debug/strace/6.4-r0/tests/nlattr_unix_diag_msg.c /usr/src/debug/strace/6.4-r0/src/xlat/priorities.h /usr/src/debug/strace/6.4-r0/tests/fanotify_mark--secontext.c /usr/src/debug/strace/6.4-r0/src/xlat/fcntlcmds.h /usr/src/debug/strace/6.4-r0/tests/ioctl_rtc.c /usr/src/debug/strace/6.4-r0/tests/skip_unavailable.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/kcmp.h /usr/src/de
 bug/strace/6.4-r0/src/xlat/btrfs_qgroup_ctl_cmds.h /usr/src/debug/strace/6.4-r0/tests/process_mrelease.c /usr/src/debug/strace/6.4-r0/src/xlat/bpf_map_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/bsg.h /usr/src/debug/strace/6.4-r0/src/xlat/ubi_volume_types.h /usr/src/debug/strace/6.4-r0/tests/migrate_pages.c /usr/src/debug/strace/6.4-r0/tests/sched_xetaffinity.c /usr/src/debug/strace/6.4-r0/src/xlat/sg_io_info.h /usr/src/debug/strace/6.4-r0/src/xlat/nf_nftables_msg_types.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_dcb_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_mdb_attrs.h /usr/src/debug/strace/6.4-r0/tests/epoll_create1.c /usr/src/debug/strace/6.4-r0/tests/ioctl_counter.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netfilter/nfnetlink_hook.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_qgroup_limit_flags.h /usr/src/debug/strace/6.4-r0/tests/status-unfinished-threads.c /usr/src/debug/strace/6.4-r0/tests/attach-p-cmd-p.c /usr/src/debu
 g/strace/6.4-r0/src/xlat/mount_attr_propagation.h /usr/src/debug/strace/6.4-r0/src/xlat/ipc_private.h /usr/src/debug/strace/6.4-r0/src/xlat/uring_ops.h /usr/src/debug/strace/6.4-r0/tests/create_nl_socket.c /usr/src/debug/strace/6.4-r0/tests/vmsplice.c /usr/src/debug/strace/6.4-r0/src/xlat/bpf_attach_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/scmvals.h /usr/src/debug/strace/6.4-r0/src/xlat/inet_protocols.h /usr/src/debug/strace/6.4-r0/src/xlat/numa_node.h /usr/src/debug/strace/6.4-r0/tests/net-sockaddr.c /usr/src/debug/strace/6.4-r0/src/xlat/epollflags.h /usr/src/debug/strace/6.4-r0/src/xlat/mpol_modes.h /usr/src/debug/strace/6.4-r0/tests/prlimit64.c /usr/src/debug/strace/6.4-r0/src/xlat/x86_xfeatures.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_neightbl_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/kexec_file_load_flags.h /usr/src/debug/strace/6.4-r0/tests/nlattr_crypto_user_alg.c /usr/src/debug/strace/6.4-r0/tests/s390_sthyi.c /usr/src/debug/strace/6.4-r0/tests/modify_ldt.c /usr
 /src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/sched.h /usr/src/debug/strace/6.4-r0/src/xlat/uring_restriction_opcodes.h /usr/src/debug/strace/6.4-r0/tests/ioctl_random.c /usr/src/debug/strace/6.4-r0/src/xlat/nl_selinux_types.h /usr/src/debug/strace/6.4-r0/tests/xetitimer.c /usr/src/debug/strace/6.4-r0/src/xlat/timerfdflags.h /usr/src/debug/strace/6.4-r0/tests/nlattr_inet_diag_req_v2.c /usr/src/debug/strace/6.4-r0/src/xlat/perf_event_read_format.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_send_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/perf_ioctl_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/ptrace_syscall_info_op.h /usr/src/debug/strace/6.4-r0/tests/umovestr-illptr.c /usr/src/debug/strace/6.4-r0/tests/personality.c /usr/src/debug/strace/6.4-r0/tests/getrusage.c /usr/src/debug/strace/6.4-r0/tests/net-yy-inet.c /usr/src/debug/strace/6.4-r0/tests/semtimedop-syscall.c /usr/src/debug/strace/6.4-r0/src/xlat/evdev_ff_status.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_cont
 rol_query_flags.h /usr/src/debug/strace/6.4-r0/tests/nfnetlink_ctnetlink.c /usr/src/debug/strace/6.4-r0/tests/nlattr_ifla_port.c /usr/src/debug/strace/6.4-r0/tests/sockopt-sol_netlink.c /usr/src/debug/strace/6.4-r0/src/xlat/netlink_new_flags.h /usr/src/debug/strace/6.4-r0/tests/ioctl_loop.c /usr/src/debug/strace/6.4-r0/src/xlat/adjtimex_modes.h /usr/src/debug/strace/6.4-r0/tests/time_enjoyment.h /usr/src/debug/strace/6.4-r0/src/xlat/inet_diag_bytecodes.h /usr/src/debug/strace/6.4-r0/tests/attach-f-p-cmd.c /usr/src/debug/strace/6.4-r0/tests/ioctl_fs_x.c /usr/src/debug/strace/6.4-r0/src/xlat/sock_can_raw_options.h /usr/src/debug/strace/6.4-r0/src/xlat/in6_addr_gen_mode.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/landlock.h /usr/src/debug/strace/6.4-r0/tests/netlink_audit.c /usr/src/debug/strace/6.4-r0/tests/netlink_route.c /usr/src/debug/strace/6.4-r0/src/xlat/sigill_codes.h /usr/src/debug/strace/6.4-r0/src/xlat/nl_route_types.h /usr/src/debug/strace/6.4-r0/tests/s
 xetmask.c /usr/src/debug/strace/6.4-r0/tests/execveat.c /usr/src/debug/strace/6.4-r0/tests/renameat.c /usr/src/debug/strace/6.4-r0/tests/quotactl_fd.c /usr/src/debug/strace/6.4-r0/src/xlat/snmp_ip_stats.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_tree_objectids.h /usr/src/debug/strace/6.4-r0/tests/xettimeofday.c /usr/src/debug/strace/6.4-r0/src/xlat/semop_flags.h /usr/src/debug/strace/6.4-r0/tests/finit_module.c /usr/src/debug/strace/6.4-r0/src/xlat/landlock_rule_types.h /usr/src/debug/strace/6.4-r0/tests/netlink_netlink_diag.c /usr/src/debug/strace/6.4-r0/tests/prctl_marker.c /usr/src/debug/strace/6.4-r0/src/xlat/ipccalls.h /usr/src/debug/strace/6.4-r0/tests/secontext.h /usr/src/debug/strace/6.4-r0/src/xlat/seccomp_ret_action.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netfilter/ipset/ip_set.h /usr/src/debug/strace/6.4-r0/tests/setfsugid.c /usr/src/debug/strace/6.4-r0/tests/setreugid.c /usr/src/debug/strace/6.4-r0/tests/unix-pair-send-recv.c /usr/src/debug/str
 ace/6.4-r0/src/xlat/rtnl_ifla_af_spec_bridge_vlan_tunnel_info_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/resource_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_mdba_router_pattr_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_af_spec_mctp_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/bpf_attach_type.h /usr/src/debug/strace/6.4-r0/tests/nanosleep.c /usr/src/debug/strace/6.4-r0/tests/prctl-seccomp-filter-v.c /usr/src/debug/strace/6.4-r0/tests/ioctl_inotify.c /usr/src/debug/strace/6.4-r0/tests/brk.c /usr/src/debug/strace/6.4-r0/src/xlat/tee_ioctl_optee_caps.h /usr/src/debug/strace/6.4-r0/tests/syslog.c /usr/src/debug/strace/6.4-r0/src/xlat/mptcp_subflow_flags.h /usr/src/debug/strace/6.4-r0/tests/futimesat.c /usr/src/debug/strace/6.4-r0/src/xlat/af_packet_types.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_buf_types.h /usr/src/debug/strace/6.4-r0/tests/fchownat--secontext.c /usr/src/debug/strace/6.4-r0/tests/umovestr3.c /usr/src/debug/strace/6.4-r0/src/xlat/phonet_protoco
 ls.h /usr/src/debug/strace/6.4-r0/tests/futex_waitv.c /usr/src/debug/strace/6.4-r0/tests/nlattr_ifla_vfinfo.c /usr/src/debug/strace/6.4-r0/src/xlat/move_mount_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/move_pages_flags.h /usr/src/debug/strace/6.4-r0/tests/nlattr_netlink_diag_msg.c /usr/src/debug/strace/6.4-r0/src/xlat/sigfpe_codes.h /usr/src/debug/strace/6.4-r0/src/xlat/delete_module_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_mdba_mdb_eattr_attrs.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/gpio.h /usr/src/debug/strace/6.4-r0/src/xlat/fspick_flags.h /usr/src/debug/strace/6.4-r0/tests/set_sigblock.c /usr/src/debug/strace/6.4-r0/tests/semop-indirect.c /usr/src/debug/strace/6.4-r0/src/xlat/semctl_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/shmctl_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/packet_diag_attrs.h /usr/src/debug/strace/6.4-r0/tests/nlattr_mdba_mdb_entry.c /usr/src/debug/strace/6.4-r0/tests/process_madvise.c /usr/src/debug/strace/6.4-r0/test
 s/pkey_free.c /usr/src/debug/strace/6.4-r0/src/xlat/kvm_mem_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/btrfs.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_control_ids.h /usr/src/debug/strace/6.4-r0/tests/arch_prctl.c /usr/src/debug/strace/6.4-r0/tests/clock_adjtime-common.c /usr/src/debug/strace/6.4-r0/tests/netlink_kobject_uevent.c /usr/src/debug/strace/6.4-r0/tests/fadvise64.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netfilter/nfnetlink_acct.h /usr/src/debug/strace/6.4-r0/tests/kill_child.c /usr/src/debug/strace/6.4-r0/tests/sockopt-sol_socket.c /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_snap_flags_v2.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/if_addr.h /usr/src/debug/strace/6.4-r0/src/xlat/open_access_modes.h /usr/src/debug/strace/6.4-r0/src/xlat/tcflsh_options.h /usr/src/debug/strace/6.4-r0/src/xlat/xdp_sockaddr_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/packet_mreq_type.h /usr/src/debug/strace/6.4-r0/tests/
 seccomp_get_action_avail.c /usr/src/debug/strace/6.4-r0/tests/erestartsys.c /usr/src/debug/strace/6.4-r0/src/xlat/tun_device_types.h /usr/src/debug/strace/6.4-r0/src/xlat/key_reqkeys.h /usr/src/debug/strace/6.4-r0/src/xlat/inet_diag_ulp_info_mptcp_attrs.h /usr/src/debug/strace/6.4-r0/tests/lseek.c /usr/src/debug/strace/6.4-r0/src/xlat/futexbitset.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_pppol2tp_options.h /usr/src/debug/strace/6.4-r0/tests/printpath-umovestr-peekdata.c /usr/src/debug/strace/6.4-r0/tests/rt_sigreturn.c /usr/src/debug/strace/6.4-r0/src/xlat/neighbor_cache_entry_ext_flags.h /usr/src/debug/strace/6.4-r0/tests/prctl-mdwe.c /usr/src/debug/strace/6.4-r0/src/xlat/wait4_options.h /usr/src/debug/strace/6.4-r0/src/xlat/ifstats_xstats_bond_3ad_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/clockflags.h /usr/src/debug/strace/6.4-r0/src/xlat/clocknames.h /usr/src/debug/strace/6.4-r0/src/xlat/get_mempolicy_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/vsock_cids.h /usr/src/debu
 g/strace/6.4-r0/tests/net-yy-unix.c /usr/src/debug/strace/6.4-r0/tests/status-failed.c /usr/src/debug/strace/6.4-r0/tests/status-none-f.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_neightbl_parms_attrs.h /usr/src/debug/strace/6.4-r0/tests/xstatfsx.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_neigh_fdb_ext_attrs.h /usr/src/debug/strace/6.4-r0/tests/nfnetlink_queue.c /usr/src/debug/strace/6.4-r0/tests/ioctl_dm.c /usr/src/debug/strace/6.4-r0/tests/print_ppid_tracerpid.c /usr/src/debug/strace/6.4-r0/tests/request_key.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/v4l2-controls.h /usr/src/debug/strace/6.4-r0/tests/nlattr_cachereport.c /usr/src/debug/strace/6.4-r0/tests/prctl-set-ptracer-success.c /usr/src/debug/strace/6.4-r0/src/xlat/iffflags.h /usr/src/debug/strace/6.4-r0/tests/mmap.c /usr/src/debug/strace/6.4-r0/tests/mmsg.c /usr/src/debug/strace/6.4-r0/tests/open.c /usr/src/debug/strace/6.4-r0/tests/pipe.c /usr/src/debug/strace/6.4-r0/tests/poke.c /usr/src/debug/strac
 e/6.4-r0/tests/poll.c /usr/src/debug/strace/6.4-r0/tests/ptrace_syscall_info.c /usr/src/debug/strace/6.4-r0/tests/swap.c /usr/src/debug/strace/6.4-r0/tests/sync.c /usr/src/debug/strace/6.4-r0/tests/time.c /usr/src/debug/strace/6.4-r0/src/xlat/ieee802154_addrs.h /usr/src/debug/strace/6.4-r0/tests/net-y-unix.c /usr/src/debug/strace/6.4-r0/src/xlat/ebpf_mode.h /usr/src/debug/strace/6.4-r0/src/xlat/ebpf_regs.h /usr/src/debug/strace/6.4-r0/src/xlat/ebpf_size.h /usr/src/debug/strace/6.4-r0/tests/s390_runtime_instr.c /usr/src/debug/strace/6.4-r0/src/xlat/bpf_task_fd_type.h /usr/src/debug/strace/6.4-r0/src/xlat/netlink_types.h /usr/src/debug/strace/6.4-r0/src/xlat/fan_event_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/pr_dumpable.h /usr/src/debug/strace/6.4-r0/src/xlat/ip_type_of_services.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_balance_ctl_cmds.h /usr/src/debug/strace/6.4-r0/src/xlat/perf_event_open_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_buf_flags_ts_src.h /usr/src/debug/
 strace/6.4-r0/tests/prctl-sve.c /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_features_compat.h /usr/src/debug/strace/6.4-r0/tests/fchmodat.c /usr/src/debug/strace/6.4-r0/src/xlat/termios_cc.h /usr/src/debug/strace/6.4-r0/src/xlat/sigchld_codes.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_family.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ip6mra_creport_attr.h /usr/src/debug/strace/6.4-r0/src/xlat/evdev_keycode.h /usr/src/debug/strace/6.4-r0/src/xlat/uffd_flags.h /usr/src/debug/strace/6.4-r0/tests/landlock_restrict_self.c /usr/src/debug/strace/6.4-r0/tests/shutdown.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/mount.h /usr/src/debug/strace/6.4-r0/tests/vhangup.c /usr/src/debug/strace/6.4-r0/tests/semtimedop.c /usr/src/debug/strace/6.4-r0/tests/print_maxfd.c /usr/src/debug/strace/6.4-r0/src/xlat/personality_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/personality_types.h /usr/src/debug/strace/6.4-r0/tests/status-none.c /usr/src/debug/strace/6.4-r0/src/xlat/uffd_zero
 page_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/pr_sud_cmds.h /usr/src/debug/strace/6.4-r0/tests/sched_xetscheduler.c /usr/src/debug/strace/6.4-r0/src/xlat/mctp_nets.h /usr/src/debug/strace/6.4-r0/src/xlat/netlink_flags.h /usr/src/debug/strace/6.4-r0/tests/ipc_sem.c /usr/src/debug/strace/6.4-r0/tests/clone-flags.c /usr/src/debug/strace/6.4-r0/tests/fcntl64.c /usr/src/debug/strace/6.4-r0/tests/getdents64.c /usr/src/debug/strace/6.4-r0/tests/ioctl_termios.c /usr/src/debug/strace/6.4-r0/src/xlat/modem_flags.h /usr/src/debug/strace/6.4-r0/tests/xet_thread_area_x86.c /usr/src/debug/strace/6.4-r0/tests/libsocketcall.c /usr/src/debug/strace/6.4-r0/src/xlat/caif_protocols.h /usr/src/debug/strace/6.4-r0/src/xlat/irda_protocols.h /usr/src/debug/strace/6.4-r0/tests/ipc_shm.c /usr/src/debug/strace/6.4-r0/tests/netlink_selinux.c /usr/src/debug/strace/6.4-r0/tests/remap_file_pages.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_tuner_audmodes.h /usr/src/debug/strace/6.4-r0/src/xlat/inotify_init_f
 lags.h /usr/src/debug/strace/6.4-r0/src/xlat/madvise_cmds.h /usr/src/debug/strace/6.4-r0/tests/unblock_reset_raise.c /usr/src/debug/strace/6.4-r0/tests/getgid32.c /usr/src/debug/strace/6.4-r0/tests/getuid32.c /usr/src/debug/strace/6.4-r0/src/xlat/shm_resource_flags.h /usr/src/debug/strace/6.4-r0/tests/status-detached-threads.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/dcbnl.h /usr/src/debug/strace/6.4-r0/src/xlat/term_oflags_tabdly.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/gen_stats.h /usr/src/debug/strace/6.4-r0/src/xlat/tee_ioctl_gen_caps.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_font_ops.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/unix_diag.h /usr/src/debug/strace/6.4-r0/src/xlat/epollctls.h /usr/src/debug/strace/6.4-r0/src/xlat/tee_ioctl_login_types.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_vf_vlan_list_attrs.h /usr/src/debug/strace/6.4-r0/tests/tracer_ppid_pgid_sid.c /usr/src/debug/strace/6.4-r0/src/xlat/pr_
 sched_core_pidtypes.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_nha_res_bucket_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/efd_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_info_data_tun_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/sfd_flags.h /usr/src/debug/strace/6.4-r0/tests/net-tpacket_stats.c /usr/src/debug/strace/6.4-r0/tests/prctl-tsc.c /usr/src/debug/strace/6.4-r0/tests/nlattr_dcbmsg.c /usr/src/debug/strace/6.4-r0/tests/nlattr_ndtmsg.c /usr/src/debug/strace/6.4-r0/tests/nlattr_tcamsg.c /usr/src/debug/strace/6.4-r0/tests/prctl-tid_address.c /usr/src/debug/strace/6.4-r0/tests/prctl-pdeathsig.c /usr/src/debug/strace/6.4-r0/tests/ioctl_tee.c /usr/src/debug/strace/6.4-r0/src/xlat/nlmsgerr_attrs.h /usr/src/debug/strace/6.4-r0/tests/print_user_desc.c /usr/src/debug/strace/6.4-r0/tests/printstrn-umoven-peekdata.c /usr/src/debug/strace/6.4-r0/tests/block_reset_run.c /usr/src/debug/strace/6.4-r0/tests/landlock_create_ruleset.c /usr/src/debug/strace/6.4-r0/src/xlat/if_dqi
 nfo_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/kvm_cap.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netfilter/nfnetlink_conntrack.h /usr/src/debug/strace/6.4-r0/tests/umovestr2.c /usr/src/debug/strace/6.4-r0/src/xlat/itimer_which.h /usr/src/debug/strace/6.4-r0/tests/status-all.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_vf_info_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_vf_port_attrs.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/if_alg.h /usr/src/debug/strace/6.4-r0/tests/printpath-umovestr-undumpable.c /usr/src/debug/strace/6.4-r0/src/xlat/neighbor_cache_entry_states.h /usr/src/debug/strace/6.4-r0/tests/get_sigset_size.c /usr/src/debug/strace/6.4-r0/tests/pkey_mprotect.c /usr/src/debug/strace/6.4-r0/tests/nsyscalls.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_input_capabilities_flags.h /usr/src/debug/strace/6.4-r0/tests/tampering-notes.c /usr/src/debug/strace/6.4-r0/src/xlat/membarrier_cmds.h /usr/src/debug/strace/6.4-r0/sr
 c/xlat/perf_attr_size.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_balance_args.h /usr/src/debug/strace/6.4-r0/src/xlat/netlink_diag_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_ascii_keys.h /usr/src/debug/strace/6.4-r0/tests/prctl-mce-kill.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_meta_fmts.h /usr/src/debug/strace/6.4-r0/src/xlat/ieee802154_addr_types.h /usr/src/debug/strace/6.4-r0/src/xlat/bpf_src.h /usr/src/debug/strace/6.4-r0/tests/pc.c /usr/src/debug/strace/6.4-r0/src/xlat/pr_unalign_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_device_capabilities_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/ebpf_op_jmp.h /usr/src/debug/strace/6.4-r0/src/xlat/fsmagic.h /usr/src/debug/strace/6.4-r0/tests/sched_rr_get_interval.c /usr/src/debug/strace/6.4-r0/src/xlat/f_owner_types.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/cryptouser.h /usr/src/debug/strace/6.4-r0/src/xlat/arp_hardware_types.h /usr/src/debug/strace/6.4-r0/tests/umoven-illptr.c /usr/src/debug
 /strace/6.4-r0/src/xlat/btrfs_dev_stats_flags.h /usr/src/debug/strace/6.4-r0/tests/prctl-spec-inject.c /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_brl_keys.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_cur_keys.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_pad_keys.h /usr/src/debug/strace/6.4-r0/tests/epoll_create.c /usr/src/debug/strace/6.4-r0/tests/memfd_create.c /usr/src/debug/strace/6.4-r0/tests/timer_create.c /usr/src/debug/strace/6.4-r0/tests/nfnetlink_cthelper.c /usr/src/debug/strace/6.4-r0/tests/error_msg.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/vm_sockets.h /usr/src/debug/strace/6.4-r0/src/xlat/secbits.h /usr/src/debug/strace/6.4-r0/tests/rt_sigqueueinfo.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_neigh_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_route_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/inet_diag_ulp_info_tls_attrs.h /usr/src/debug/strace/6.4-r0/tests/printsignal.c /usr/src/debug/strace/6.4-r0/tests/qual_signal.c /usr/src/debug/s
 trace/6.4-r0/src/xlat/mtd_nandecc_options.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netfilter/nfnetlink_osf.h /usr/src/debug/strace/6.4-r0/tests/bpf-obj_get_info_by_fd.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/if_xdp.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_rta_metrics_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/tls_info_versions.h /usr/src/debug/strace/6.4-r0/tests/ioctl_kvm_run.c /usr/src/debug/strace/6.4-r0/tests/ip_mreq.c /usr/src/debug/strace/6.4-r0/src/xlat/tls_info_ciphers.h /usr/src/debug/strace/6.4-r0/tests/nlattr_ifla.h /usr/src/debug/strace/6.4-r0/tests/xutimes.c /usr/src/debug/strace/6.4-r0/tests/netlink_inet_diag.c /usr/src/debug/strace/6.4-r0/src/xlat/uring_op_flags.h /usr/src/debug/strace/6.4-r0/tests/netlink_sock_diag.c /usr/src/debug/strace/6.4-r0/tests/netlink_unix_diag.c /usr/src/debug/strace/6.4-r0/tests/attach-f-p.c /usr/src/debug/strace/6.4-r0/tests/clone3.c /usr/src/debug/strace/6.4-r0/tests/netlink_generic.c /
 usr/src/debug/strace/6.4-r0/tests/nlattr_ifla_xdp.c /usr/src/debug/strace/6.4-r0/tests/unix-pair-sendto-recvfrom.c /usr/src/debug/strace/6.4-r0/tests/faccessat--secontext.c /usr/src/debug/strace/6.4-r0/src/xlat/sigprocmaskcmds.h /usr/src/debug/strace/6.4-r0/src/xlat/syslog_action_type.h /usr/src/debug/strace/6.4-r0/tests/is_linux_mips_n64.c /usr/src/debug/strace/6.4-r0/src/xlat/bootflags1.h /usr/src/debug/strace/6.4-r0/src/xlat/bootflags2.h /usr/src/debug/strace/6.4-r0/src/xlat/bootflags3.h /usr/src/debug/strace/6.4-r0/src/xlat/quotatypes.h /usr/src/debug/strace/6.4-r0/tests/stack-fcall.c /usr/src/debug/strace/6.4-r0/tests/nlattr_ifla_linkinfo.c /usr/src/debug/strace/6.4-r0/tests/zeroargc.c /usr/src/debug/strace/6.4-r0/src/xlat/nl_audit_types.h /usr/src/debug/strace/6.4-r0/tests/fork--pidns-translation.c /usr/src/debug/strace/6.4-r0/tests/stack-fcall.h /usr/src/debug/strace/6.4-r0/src/xlat/ifstats_xstats_type_attrs.h /usr/src/debug/strace/6.4-r0/tests/fanotify_init.c /usr/src/debug/
 strace/6.4-r0/tests/fanotify_mark.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_sliced_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/seccomp.h /usr/src/debug/strace/6.4-r0/src/xlat/routing_protocols.h /usr/src/debug/strace/6.4-r0/tests/ioctl_watchdog.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_proto_down_reason_attrs.h /usr/src/debug/strace/6.4-r0/tests/test_nlattr.h /usr/src/debug/strace/6.4-r0/tests/utimensat.c /usr/src/debug/strace/6.4-r0/src/xlat/bpf_link_create_kprobe_multi_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/mtd_flags_options.h /usr/src/debug/strace/6.4-r0/tests/getpgrp.c /usr/src/debug/strace/6.4-r0/src/xlat/bpf_commands.h /usr/src/debug/strace/6.4-r0/src/xlat/mctl_sync.h /usr/src/debug/strace/6.4-r0/tests/process_vm_readv_writev.c /usr/src/debug/strace/6.4-r0/tests/net-tpacket_req.c /usr/src/debug/strace/6.4-r0/tests/truncate64.c /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_fs_info_flags.h /usr/src/debug/strace/6.4-r0/tests/get_page_size
 .c /usr/src/debug/strace/6.4-r0/src/xlat/seccomp_ioctl_addfd_flags.h /usr/src/debug/strace/6.4-r0/tests/tprintf.c /usr/src/debug/strace/6.4-r0/tests/prctl-arg2-intptr.c /usr/src/debug/strace/6.4-r0/tests/setrlimit.c /usr/src/debug/strace/6.4-r0/src/xlat/baud_options.h /usr/src/debug/strace/6.4-r0/tests/old_mmap.c /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_compress_types.h /usr/src/debug/strace/6.4-r0/src/xlat/nf_acct_msg_types.h /usr/src/debug/strace/6.4-r0/tests/tee.c /usr/src/debug/strace/6.4-r0/tests/dev-yy.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_nexthop_grp_types.h /usr/src/debug/strace/6.4-r0/src/xlat/uring_iowq_acct.h /usr/src/debug/strace/6.4-r0/tests/sigaltstack.c /usr/src/debug/strace/6.4-r0/src/xlat/ifstats_xstats_bridge_mcast_indices.h /usr/src/debug/strace/6.4-r0/tests/nlattr_ifstats.c /usr/src/debug/strace/6.4-r0/src/xlat/pidfd_open_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/nt_descriptor_types.h /usr/src/debug/strace/6.4-r0/src/xlat/bpf_mode.h /usr/src/debug/s
 trace/6.4-r0/src/xlat/counter_ioctl_component_types.h /usr/src/debug/strace/6.4-r0/src/xlat/pr_spec_cmds.h /usr/src/debug/strace/6.4-r0/tests/file_handle--secontext.c /usr/src/debug/strace/6.4-r0/src/xlat/seccomp_filter_flags.h /usr/src/debug/strace/6.4-r0/tests/print_time.c /usr/src/debug/strace/6.4-r0/tests/qual_inject-signal.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_br_mcast_querier_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/routing_table_ids.h /usr/src/debug/strace/6.4-r0/tests/sprintrc.c /usr/src/debug/strace/6.4-r0/tests/io_uring_register.c /usr/src/debug/strace/6.4-r0/src/xlat/inet_diag_shutdown_flags.h /usr/src/debug/strace/6.4-r0/tests/run_expect_termsig.c /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_features_compat_ro.h /usr/src/debug/strace/6.4-r0/src/xlat/mtd_file_mode_options.h /usr/src/debug/strace/6.4-r0/tests/ioprio.c /usr/src/debug/strace/6.4-r0/src/xlat/gpio_v2_line_flags.h /usr/src/debug/strace/6.4-r0/tests/nlattr_ifla_af_inet6.h /usr/src/debug/strace/6.
 4-r0/tests/fchmod-y--secontext.c /usr/src/debug/strace/6.4-r0/src/xlat/netlink_protocols.h /usr/src/debug/strace/6.4-r0/src/xlat/ubi_volume_props.h /usr/src/debug/strace/6.4-r0/src/xlat/ethernet_protocols.h /usr/src/debug/strace/6.4-r0/tests/signal_receive.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/loop.h /usr/src/debug/strace/6.4-r0/src/xlat/siginfo_codes.h /usr/src/debug/strace/6.4-r0/tests/prctl-fp-mode.c /usr/src/debug/strace/6.4-r0/tests/stack-fcall-0.c /usr/src/debug/strace/6.4-r0/tests/stack-fcall-1.c /usr/src/debug/strace/6.4-r0/tests/stack-fcall-2.c /usr/src/debug/strace/6.4-r0/tests/stack-fcall-3.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/sock_diag.h /usr/src/debug/strace/6.4-r0/tests/s390_pci_mmio_read_write.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/if_addrlabel.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_default_led_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/types.h /usr/src/debug/s
 trace/6.4-r0/src/xlat/adjtimex_status.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_dead_keys.h /usr/src/debug/strace/6.4-r0/src/xlat/ubi_volume_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_fields.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_tca_act_hw_stats.h /usr/src/debug/strace/6.4-r0/src/xlat/nfc_sockaddr_protocols.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_netconf_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/uring_register_opcodes.h /usr/src/debug/strace/6.4-r0/tests/kernel_old_timex.h /usr/src/debug/strace/6.4-r0/tests/fork-f.c /usr/src/debug/strace/6.4-r0/src/xlat/notifyflags.h /usr/src/debug/strace/6.4-r0/src/xlat/nf_ctnetlink_msg_types.h /usr/src/debug/strace/6.4-r0/src/xlat/sg_io_flags.h /usr/src/debug/strace/6.4-r0/tests/getuid.c /usr/src/debug/strace/6.4-r0/tests/gettid.c /usr/src/debug/strace/6.4-r0/tests/fchmod.c /usr/src/debug/strace/6.4-r0/tests/getcwd.c /usr/src/debug/strace/6.4-r0/tests/getgid.c /usr/src/debug/strace/6.4-r0/tests/getpid.c /usr/src/debug/
 strace/6.4-r0/tests/getsid.c /usr/src/debug/strace/6.4-r0/tests/waitid.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_vfinfo_list_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/evdev_ff_types.h /usr/src/debug/strace/6.4-r0/tests/strace--decode-pids-comm.c /usr/src/debug/strace/6.4-r0/src/xlat/ifaddrflags.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_qgroup_inherit_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_mdba_mdb_attrs.h /usr/src/debug/strace/6.4-r0/tests/test_printstrn.c /usr/src/debug/strace/6.4-r0/src/xlat/falloc_flags.h /usr/src/debug/strace/6.4-r0/tests/file_handle.c /usr/src/debug/strace/6.4-r0/src/xlat/evdev_ev.h /usr/src/debug/strace/6.4-r0/tests/strace-n.c /usr/src/debug/strace/6.4-r0/src/xlat/skf_ad.h /usr/src/debug/strace/6.4-r0/tests/mlockall.c /usr/src/debug/strace/6.4-r0/tests/ifindex.c /usr/src/debug/strace/6.4-r0/tests/nlattr_smc_diag_msg.c /usr/src/debug/strace/6.4-r0/tests/looping_threads.c /usr/src/debug/strace/6.4-r0/tests/perf_event_open.c /usr/src/d
 ebug/strace/6.4-r0/tests/nlattr_fib_rule_hdr.c /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_space_info_flags.h /usr/src/debug/strace/6.4-r0/tests/fflush.c /usr/src/debug/strace/6.4-r0/src/xlat/mctp_addrs.h /usr/src/debug/strace/6.4-r0/src/xlat/sg_scsi_reset.h /usr/src/debug/strace/6.4-r0/src/xlat/evdev_relative_axes.h /usr/src/debug/strace/6.4-r0/tests/xet_robust_list.c /usr/src/debug/strace/6.4-r0/src/xlat/sigtrap_codes.h /usr/src/debug/strace/6.4-r0/src/xlat/icmp_filter_flags.h /usr/src/debug/strace/6.4-r0/tests/fsync-y.c /usr/src/debug/strace/6.4-r0/src/xlat/pr_sme_vl_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/pr_sve_vl_flags.h /usr/src/debug/strace/6.4-r0/tests/prctl-sched-core.c /usr/src/debug/strace/6.4-r0/src/xlat/getsock_ip_options.h /usr/src/debug/strace/6.4-r0/src/xlat/setsock_ip_options.h /usr/src/debug/strace/6.4-r0/tests/readlink.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_input_status_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netfilter/nf
 netlink_log.h /usr/src/debug/strace/6.4-r0/src/xlat/bpf_miscop.h /usr/src/debug/strace/6.4-r0/src/xlat/bpf_op_alu.h /usr/src/debug/strace/6.4-r0/src/xlat/bpf_op_jmp.h /usr/src/debug/strace/6.4-r0/src/xlat/key_spec.h /usr/src/debug/strace/6.4-r0/tests/pwritev.c /usr/src/debug/strace/6.4-r0/src/xlat/fsopen_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/blktrace_api.h /usr/src/debug/strace/6.4-r0/src/xlat/netlink_states.h /usr/src/debug/strace/6.4-r0/src/xlat/counter_ioctl_scopes.h /usr/src/debug/strace/6.4-r0/tests/siginfo.c /usr/src/debug/strace/6.4-r0/tests/sysinfo.c /usr/src/debug/strace/6.4-r0/tests/fchownat.c /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_key_types.h /usr/src/debug/strace/6.4-r0/tests/sock_filter-v.c /usr/src/debug/strace/6.4-r0/tests/sendfile.c /usr/src/debug/strace/6.4-r0/src/xlat/kexec_load_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/term_line_discs.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/rtnetlink.h /usr/src/debug
 /strace/6.4-r0/src/xlat/keyctl_caps0.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_led_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/ifstats_xstats_bridge_attrs.h /usr/src/debug/strace/6.4-r0/tests/inotify.c /usr/src/debug/strace/6.4-r0/src/xlat/kvm_cpuid_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/evdev_abs.h /usr/src/debug/strace/6.4-r0/src/xlat/evdev_snd.h /usr/src/debug/strace/6.4-r0/src/xlat/modetypes.h /usr/src/debug/strace/6.4-r0/tests/getpeername.c /usr/src/debug/strace/6.4-r0/src/xlat/ifstats_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/keyctl_commands.h /usr/src/debug/strace/6.4-r0/src/xlat/mount_attr_attr.h /usr/src/debug/strace/6.4-r0/tests/filter_seccomp-perf.c /usr/src/debug/strace/6.4-r0/src/xlat/smc_link_group_roles.h /usr/src/debug/strace/6.4-r0/src/xlat/seccomp_mode.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/mqueue.h /usr/src/debug/strace/6.4-r0/src/xlat/gpio_v2_line_attr_ids.h /usr/src/debug/strace/6.4-r0/src/xlat/af_packet_versions.h /usr/src
 /debug/strace/6.4-r0/src/xlat/keyctl_caps1.h /usr/src/debug/strace/6.4-r0/src/xlat/kcmp_types.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/in6.h /usr/src/debug/strace/6.4-r0/tests/rt_sigaction.c /usr/src/debug/strace/6.4-r0/tests/status-none-threads.c /usr/src/debug/strace/6.4-r0/tests/list_sigaction_signum.c /usr/src/debug/strace/6.4-r0/tests/execveat--secontext.c /usr/src/debug/strace/6.4-r0/src/xlat/mmap_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/swap_flags.h /usr/src/debug/strace/6.4-r0/tests/ioctl_perf-success.c /usr/src/debug/strace/6.4-r0/src/xlat/umount_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/uring_setup_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/sockopt_txrehash_vals.h /usr/src/debug/strace/6.4-r0/tests/maybe_switch_current_tcp.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/stat.h /usr/src/debug/strace/6.4-r0/src/xlat/kexec_arch_values.h /usr/src/debug/strace/6.4-r0/tests/pidfd_getfd.c /usr/src/debug/strace/6.4-r0/src/xlat/rtn
 l_ip6mra_msg_types.h /usr/src/debug/strace/6.4-r0/tests/nfnetlink_nftables.c /usr/src/debug/strace/6.4-r0/tests/ioctl_sg_io_v4.c /usr/src/debug/strace/6.4-r0/tests/net-icmp_filter.c /usr/src/debug/strace/6.4-r0/tests/clock_nanosleep.c /usr/src/debug/strace/6.4-r0/tests/mlock2.c /usr/src/debug/strace/6.4-r0/tests/filter_seccomp-flag.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/neighbour.h /usr/src/debug/strace/6.4-r0/src/xlat/nf_osf_msg_types.h /usr/src/debug/strace/6.4-r0/tests/errno2name.c /usr/src/debug/strace/6.4-r0/src/xlat/ptp_pin_funcs.h /usr/src/debug/strace/6.4-r0/src/xlat/dirent_types.h /usr/src/debug/strace/6.4-r0/tests/nfnetlink_ctnetlink_exp.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/if_bonding.h /usr/src/debug/strace/6.4-r0/src/xlat/can_protocols.h /usr/src/debug/strace/6.4-r0/tests/ftruncate64.c /usr/src/debug/strace/6.4-r0/tests/printstr.c /usr/src/debug/strace/6.4-r0/tests/umovestr.c /usr/src/debug/strace/6.4-r0/tests/osf_utime
 s.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_tuner_capabilities.h /usr/src/debug/strace/6.4-r0/src/xlat/netlink_delete_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_bridge_modes.h /usr/src/debug/strace/6.4-r0/src/xlat/term_cflags_csize.h /usr/src/debug/strace/6.4-r0/src/xlat/term_oflags_bsdly.h /usr/src/debug/strace/6.4-r0/src/xlat/term_oflags_crdly.h /usr/src/debug/strace/6.4-r0/src/xlat/term_oflags_ffdly.h /usr/src/debug/strace/6.4-r0/src/xlat/term_oflags_nldly.h /usr/src/debug/strace/6.4-r0/src/xlat/term_oflags_vtdly.h /usr/src/debug/strace/6.4-r0/src/xlat/shutdown_modes.h /usr/src/debug/strace/6.4-r0/tests/munlockall.c /usr/src/debug/strace/6.4-r0/src/xlat/fan_classes.h /usr/src/debug/strace/6.4-r0/tests/rt_sigsuspend.c /usr/src/debug/strace/6.4-r0/tests/bpf.c /usr/src/debug/strace/6.4-r0/src/xlat/sock_alg_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_ipx_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_kcm_options.h /usr/src/debug/strace/6.4-r0/src/xlat/s
 ock_llc_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_pnp_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_raw_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_rds_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_tcp_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_tls_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_udp_options.h /usr/src/debug/strace/6.4-r0/tests/s390_guarded_storage.c /usr/src/debug/strace/6.4-r0/tests/eventfd.c /usr/src/debug/strace/6.4-r0/tests/alarm.c /usr/src/debug/strace/6.4-r0/src/xlat/perf_type_id.h /usr/src/debug/strace/6.4-r0/tests/sync_file_range2.c /usr/src/debug/strace/6.4-r0/tests/symlink.c /usr/src/debug/strace/6.4-r0/tests/signalfd4.c /usr/src/debug/strace/6.4-r0/tests/getresugid.c /usr/src/debug/strace/6.4-r0/tests/setresugid.c /usr/src/debug/strace/6.4-r0/src/xlat/fs_xflags.h /usr/src/debug/strace/6.4-r0/tests/perf_event_open_nonverbose.c /usr/src/debug/strace/6.4-r0/src/xlat/sock_xdp_options.h /usr/src/debug/strace/6.4
 -r0/tests/sched_get_priority_mxx.c /usr/src/debug/strace/6.4-r0/src/xlat/pkey_access.h /usr/src/debug/strace/6.4-r0/src/xlat/mlock_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/vsock_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/vsock_ports.h /usr/src/debug/strace/6.4-r0/tests/mmsg_name.c /usr/src/debug/strace/6.4-r0/src/xlat/nfc_protocols.h /usr/src/debug/strace/6.4-r0/src/xlat/smc_protocols.h /usr/src/debug/strace/6.4-r0/tests/get_process_reaper.c /usr/src/debug/strace/6.4-r0/src/xlat/sock_sctp_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_tipc_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_ax25_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_caif_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_dccp_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_ipv6_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_irda_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_iucv_options.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/mtd/mtd-abi.h /usr/src/
 debug/strace/6.4-r0/tests/so_error.c /usr/src/debug/strace/6.4-r0/tests/symlinkat.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/io_uring.h /usr/src/debug/strace/6.4-r0/tests/umode_t.c /usr/src/debug/strace/6.4-r0/tests/xstatx.c /usr/src/debug/strace/6.4-r0/tests/redirect-fds.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/input.h /usr/src/debug/strace/6.4-r0/src/xlat/tcp_states.h /usr/src/debug/strace/6.4-r0/tests/printpath-umovestr.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/videodev2.h /usr/src/debug/strace/6.4-r0/src/xlat/tcxonc_options.h /usr/src/debug/strace/6.4-r0/src/xlat/tee_ioctl_max_arg_size.h /usr/src/debug/strace/6.4-r0/src/xlat/open_mode_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/open_tree_flags.h /usr/src/debug/strace/6.4-r0/tests/nlattr_tc_stats.c /usr/src/debug/strace/6.4-r0/src/xlat/kd_meta_vals.h /usr/src/debug/strace/6.4-r0/src/xlat/lirc_modes.h /usr/src/debug/strace/6.4-r0/tests/oldselect.c /usr/src/debug/s
 trace/6.4-r0/src/xlat/routing_scopes.h /usr/src/debug/strace/6.4-r0/src/xlat/isdn_protocols.h /usr/src/debug/strace/6.4-r0/src/xlat/nf_hook_msg_types.h /usr/src/debug/strace/6.4-r0/tests/ioctl_nsfs.c /usr/src/debug/strace/6.4-r0/tests/ip_local_port_range.c /usr/src/debug/strace/6.4-r0/tests/recvmmsg-timeout.c /usr/src/debug/strace/6.4-r0/src/xlat/addrfams.h /usr/src/debug/strace/6.4-r0/src/xlat/shm_flags.h /usr/src/debug/strace/6.4-r0/tests/ioctl_perf.c /usr/src/debug/strace/6.4-r0/src/xlat/sigev_value.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_mdba_router_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_br_boolopt_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/fiemap.h /usr/src/debug/strace/6.4-r0/tests/netlink_xfrm.c /usr/src/debug/strace/6.4-r0/tests/ioctl_kd.c /usr/src/debug/strace/6.4-r0/src/xlat/evdev_autorepeat.h /usr/src/debug/strace/6.4-r0/src/xlat/uring_files_update_fds.h /usr/src/debug/strace/6.4-r0/src/xlat/flockcmds.h /usr/src/debug/strac
 e/6.4-r0/tests/fallocate.c /usr/src/debug/strace/6.4-r0/tests/ftruncate.c /usr/src/debug/strace/6.4-r0/tests/mq_sendrecv.c /usr/src/debug/strace/6.4-r0/src/xlat/getrandom_flags.h /usr/src/debug/strace/6.4-r0/tests/filter-unavailable.c /usr/src/debug/strace/6.4-r0/tests/pipe_maxfd.c /usr/src/debug/strace/6.4-r0/tests/signal2name.c /usr/src/debug/strace/6.4-r0/tests/fcntl-common.c /usr/src/debug/strace/6.4-r0/tests/semop-common.c /usr/src/debug/strace/6.4-r0/src/xlat/membarrier_flags.h /usr/src/debug/strace/6.4-r0/tests/prctl-seccomp-strict.c /usr/src/debug/strace/6.4-r0/tests/xchownx.c /usr/src/debug/strace/6.4-r0/tests/getdents.c /usr/src/debug/strace/6.4-r0/tests/sigreturn.c /usr/src/debug/strace/6.4-r0/src/xlat/alg_sockaddr_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/sigpoll_codes.h /usr/src/debug/strace/6.4-r0/src/xlat/lirc_features.h /usr/src/debug/strace/6.4-r0/src/xlat/sigprof_codes.h /usr/src/debug/strace/6.4-r0/tests/oldselect-efault.c /usr/src/debug/strace/6.4-r0/src/xlat
 /pr_tsc.h /usr/src/debug/strace/6.4-r0/tests/prctl-set_vma.c /usr/src/debug/strace/6.4-r0/tests/xattr-strings.c /usr/src/debug/strace/6.4-r0/tests/fadvise64_64.c /usr/src/debug/strace/6.4-r0/tests/print_quoted_string.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/mpls.h /usr/src/debug/strace/6.4-r0/tests/strace--syscall-limit.c /usr/src/debug/strace/6.4-r0/src/xlat/fiemap_extent_flags.h /usr/src/debug/strace/6.4-r0/tests/ioctl_ubi.c /usr/src/debug/strace/6.4-r0/tests/add_key.c /usr/src/debug/strace/6.4-r0/tests/setdomainname.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_vf_stats_attrs.h /usr/src/debug/strace/6.4-r0/tests/nlattr_ndmsg.c /usr/src/debug/strace/6.4-r0/tests/nlattr_nhmsg.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_buf_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_vbi_flags.h /usr/src/debug/strace/6.4-r0/tests/nlattr_rtmsg.c /usr/src/debug/strace/6.4-r0/tests/nlattr_tcmsg.c /usr/src/debug/strace/6.4-r0/tests/nlattr_packet_diag_msg.c /usr/src/deb
 ug/strace/6.4-r0/src/xlat/msgctl_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/socketlayers.h /usr/src/debug/strace/6.4-r0/tests/status-successful.c /usr/src/debug/strace/6.4-r0/tests/init_module.c /usr/src/debug/strace/6.4-r0/src/xlat/uffd_copy_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/open_resolve_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netfilter/nf_tables_compat.h /usr/src/debug/strace/6.4-r0/tests/nlattr_ifla_brport.c /usr/src/debug/strace/6.4-r0/tests/pkey_alloc.c /usr/src/debug/strace/6.4-r0/tests/tail_alloc.c /usr/src/debug/strace/6.4-r0/src/xlat/usagewho.h /usr/src/debug/strace/6.4-r0/src/xlat/term_cmds_overlapping.h /usr/src/debug/strace/6.4-r0/tests/prctl-name.c /usr/src/debug/strace/6.4-r0/src/xlat/socketcalls.h /usr/src/debug/strace/6.4-r0/tests/nlattr_ifla_af_spec.c /usr/src/debug/strace/6.4-r0/tests/ioctl_seccomp.c /usr/src/debug/strace/6.4-r0/tests/mount_setattr.c /usr/src/debug/strace/6.4-r0/tests/check_sigblock.c /usr/src/debug/stra
 ce/6.4-r0/tests/nfnetlink_nft_compat.c /usr/src/debug/strace/6.4-r0/src/xlat/hci_channels.h /usr/src/debug/strace/6.4-r0/src/xlat/name_to_handle_at_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/sigaltstack_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/ioctl_dirs.h /usr/src/debug/strace/6.4-r0/tests/preadv-pwritev.c /usr/src/debug/strace/6.4-r0/src/xlat/uffd_api_features.h /usr/src/debug/strace/6.4-r0/tests/nfnetlink_ulog.c /usr/src/debug/strace/6.4-r0/src/xlat/nl_bridge_vlan_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/inet6_devconf_indices.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netfilter/nfnetlink.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_shift_keys.h /usr/src/debug/strace/6.4-r0/tests/ioctl_tiocm.c /usr/src/debug/strace/6.4-r0/src/xlat/netlink_diag_show.h /usr/src/debug/strace/6.4-r0/src/xlat/epollevents.h /usr/src/debug/strace/6.4-r0/tests/ioctl_evdev-success.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/fib_rules.h /usr/src/debug/
 strace/6.4-r0/tests/epoll_ctl.c /usr/src/debug/strace/6.4-r0/tests/ip_protocol.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netfilter/nf_tables.h /usr/src/debug/strace/6.4-r0/src/xlat/inet_diag_bpf_storages_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/rtc_features.h /usr/src/debug/strace/6.4-r0/tests/pidfd_open.c /usr/src/debug/strace/6.4-r0/src/xlat/uffd_register_ioctl_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/madvise_hppa_generic_cmds.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_spec_keys.h /usr/src/debug/strace/6.4-r0/src/xlat/mlockall_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/hw_breakpoint_len.h /usr/src/debug/strace/6.4-r0/src/xlat/ubi_data_types.h /usr/src/debug/strace/6.4-r0/src/xlat/inet_diag_ulp_info_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/pr_fp_mode.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_std_ids.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/ptp_clock.h /usr/src/debug/strace/6.4-r0/src/xlat/mount_setattr_flags.h /u
 sr/src/debug/strace/6.4-r0/tests/threads-execve.c /usr/src/debug/strace/6.4-r0/tests/getrandom.c /usr/src/debug/strace/6.4-r0/src/xlat/uring_enter_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/bt_protocols.h /usr/src/debug/strace/6.4-r0/tests/chdir.c /usr/src/debug/strace/6.4-r0/tests/chmod.c /usr/src/debug/strace/6.4-r0/tests/orphaned_process_group.c /usr/src/debug/strace/6.4-r0/src/xlat/sock_ip_options.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_ext_filter_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/audit_arch.h /usr/src/debug/strace/6.4-r0/src/xlat/packet_diag_show.h /usr/src/debug/strace/6.4-r0/tests/ioctl_sock.c /usr/src/debug/strace/6.4-r0/src/xlat/sock_nfcllcp_options.h /usr/src/debug/strace/6.4-r0/src/xlat/syslog_console_levels.h /usr/src/debug/strace/6.4-r0/src/xlat/pr_mdwe_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/resources.h /usr/src/debug/strace/6.4-r0/tests/userfaultfd.c /usr/src/debug/strace/6.4-r0/tests/timerfd_xettime.c /usr/src/debug/strace/6.4-r0/src/xl
 at/nf_queue_msg_types.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_input_types.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_tuner_types.h /usr/src/debug/strace/6.4-r0/tests/readlinkat.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_tc_action_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/netlink_socket_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/nl_netfilter_subsys_ids.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_control_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_control_types.h /usr/src/debug/strace/6.4-r0/tests/mq.c /usr/src/debug/strace/6.4-r0/src/xlat/nf_cthelper_msg_types.h /usr/src/debug/strace/6.4-r0/tests/prctl-syscall-user-dispatch.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_bridge_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/tee_ioctl_shm_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/pr_pac_enabled_keys.h /usr/src/debug/strace/6.4-r0/tests/int_0x80.c /usr/src/debug/strace/6.4-r0/src/xlat/seccomp_ioctl_resp_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_f
 n_key_vals.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/if_link.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netfilter/nfnetlink_queue.h /usr/src/debug/strace/6.4-r0/tests/close_range.c /usr/src/debug/strace/6.4-r0/src/xlat/mount_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_features_incompat.h /usr/src/debug/strace/6.4-r0/src/xlat/pr_mce_kill_policy.h /usr/src/debug/strace/6.4-r0/tests/rt_sigpending.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_tca_root_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_tca_root_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/counter.h /usr/src/debug/strace/6.4-r0/tests/xetpriority.c /usr/src/debug/strace/6.4-r0/tests/xgetdents.c /usr/src/debug/strace/6.4-r0/src/xlat/rename_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_type_flags.h /usr/src/debug/strace/6.4-r0/tests/prctl-no-args.c /usr/src/debug/strace/6.4-r0/tests/restart_syscall.c /usr/src/debug/strace/6.4-r0/src/xlat/quota_fo
 rmats.h /usr/src/debug/strace/6.4-r0/tests/kernel_version.c /usr/src/debug/strace/6.4-r0/src/xlat/pr_set_mm.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_addr_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_link_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_nsid_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_rule_attrs.h /usr/src/debug/strace/6.4-r0/tests/ioctl_v4l2-success.c /usr/src/debug/strace/6.4-r0/src/xlat/pr_sched_core_cmds.h /usr/src/debug/strace/6.4-r0/tests/nlattr_br_port_msg.c /usr/src/debug/strace/6.4-r0/src/xlat/gpio_handle_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_rxrpc_options.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_vsock_options.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_kbd_modes.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_kbd_types.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_types.h /usr/src/debug/strace/6.4-r0/tests/open--secontext.c /usr/src/debug/strace/6.4-r0/tests/fsopen.c /usr/src/debug/strace/6.4-r0/tests/setpgrp-exec.c /usr/src/d
 ebug/strace/6.4-r0/tests/keyctl.c /usr/src/debug/strace/6.4-r0/tests/signal.c /usr/src/debug/strace/6.4-r0/src/xlat/kd_modes.h /usr/src/debug/strace/6.4-r0/tests/sysctl.c /usr/src/debug/strace/6.4-r0/tests/tgkill.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ipmra_msg_types.h /usr/src/debug/strace/6.4-r0/src/xlat/mbind_flags.h /usr/src/debug/strace/6.4-r0/tests/epoll_wait.c /usr/src/debug/strace/6.4-r0/tests/netlink_crypto.c /usr/src/debug/strace/6.4-r0/tests/io_uring_setup.c /usr/src/debug/strace/6.4-r0/tests/ioctl_gpio.c /usr/src/debug/strace/6.4-r0/tests/preadv.c /usr/src/debug/strace/6.4-r0/tests/xselect.c /usr/src/debug/strace/6.4-r0/src/xlat/mdb_states.h /usr/src/debug/strace/6.4-r0/src/xlat/routing_types.h /usr/src/debug/strace/6.4-r0/src/xlat/fsmount_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/nf_cttimeout_msg_types.h /usr/src/debug/strace/6.4-r0/tests/linkat.c /usr/src/debug/strace/6.4-r0/tests/select.c /usr/src/debug/strace/6.4-r0/tests/umount.c /usr/src/debug/strace/6.4-
 r0/tests/openat.c /usr/src/debug/strace/6.4-r0/tests/reboot.c /usr/src/debug/strace/6.4-r0/tests/accept.c /usr/src/debug/strace/6.4-r0/tests/chroot.c /usr/src/debug/strace/6.4-r0/tests/io_uring_enter.c /usr/src/debug/strace/6.4-r0/tests/fchdir.c /usr/src/debug/strace/6.4-r0/tests/subdir.c /usr/src/debug/strace/6.4-r0/tests/nlattr.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_af_spec_bridge_attrs.h /usr/src/debug/strace/6.4-r0/tests/answer.c /usr/src/debug/strace/6.4-r0/src/xlat/unix_diag_attrs.h /usr/src/debug/strace/6.4-r0/tests/recvfrom-MSG_TRUNC.c /usr/src/debug/strace/6.4-r0/src/xlat/pr_mce_kill.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_buf_flags_ts_type.h /usr/src/debug/strace/6.4-r0/src/xlat/smc_diag_attrs.h /usr/src/debug/strace/6.4-r0/tests/open_tree.c /usr/src/debug/strace/6.4-r0/src/xlat/bpf_file_mode_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/ifstats_attr_flags.h /usr/src/debug/strace/6.4-r0/tests/set_sigign.c /usr/src/debug/strace/6.4-r0/src/xlat/pollflags.h /u
 sr/src/debug/strace/6.4-r0/src/xlat/gpio_line_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_keymap_flags.h /usr/src/debug/strace/6.4-r0/tests/truncate.c /usr/src/debug/strace/6.4-r0/tests/strace-x.c /usr/src/debug/strace/6.4-r0/tests/delay.c /usr/src/debug/strace/6.4-r0/tests/dirfd.c /usr/src/debug/strace/6.4-r0/tests/nlattr_ifaddrlblmsg.c /usr/src/debug/strace/6.4-r0/src/xlat/key_perms.h /usr/src/debug/strace/6.4-r0/src/xlat/nl_crypto_types.h /usr/src/debug/strace/6.4-r0/tests/mknodat.c /usr/src/debug/strace/6.4-r0/tests/msg_name.c /usr/src/debug/strace/6.4-r0/tests/sockname.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_format_description_flags.h /usr/src/debug/strace/6.4-r0/tests/sigaction.c /usr/src/debug/strace/6.4-r0/tests/prctl-pac-enabled-keys.c /usr/src/debug/strace/6.4-r0/tests/test_ucopy.c /usr/src/debug/strace/6.4-r0/tests/copy_file_range.c /usr/src/debug/strace/6.4-r0/tests/sync_file_range.c /usr/src/debug/strace/6.4-r0/tests/test_ucopy.h /usr/src/debug/strace/6.4-r0/b
 undled/linux/include/uapi/linux/futex.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_af_spec_inet_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_info_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_tca_stab_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/bpf_size.h /usr/src/debug/strace/6.4-r0/src/xlat/rxrpc_services.h /usr/src/debug/strace/6.4-r0/src/xlat/hw_breakpoint_type.h /usr/src/debug/strace/6.4-r0/tests/nfnetlink_osf.c /usr/src/debug/strace/6.4-r0/tests/printflags.c /usr/src/debug/strace/6.4-r0/src/xlat/perf_sw_ids.h /usr/src/debug/strace/6.4-r0/src/xlat/smc_diag_mode.h /usr/src/debug/strace/6.4-r0/tests/test_printpath.c /usr/src/debug/strace/6.4-r0/src/xlat/perf_hw_cache_id.h /usr/src/debug/strace/6.4-r0/tests/getsockname--secontext.c /usr/src/debug/strace/6.4-r0/src/xlat/sched_flags.h /usr/src/debug/strace/6.4-r0/tests/clock_xettime-common.c /usr/src/debug/strace/6.4-r0/tests/ioctl_sock_gifconf.c /usr/src/debug/strace/6.4-r0/tests/ioctl_winsize.c /usr/src/debu
 g/strace/6.4-r0/src/xlat/bsg_subprotocol.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netlink.h /usr/src/debug/strace/6.4-r0/src/xlat/fsmount_attr_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_pix_fmts.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_sdr_fmts.h /usr/src/debug/strace/6.4-r0/src/xlat/sigsegv_codes.h /usr/src/debug/strace/6.4-r0/src/xlat/uring_sqe_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/openat2.h /usr/src/debug/strace/6.4-r0/tests/sethostname.c /usr/src/debug/strace/6.4-r0/tests/nlattr_mdba_router_port.c /usr/src/debug/strace/6.4-r0/tests/chmod--secontext.c /usr/src/debug/strace/6.4-r0/src/xlat/tee_ioctl_origins.h /usr/src/debug/strace/6.4-r0/src/xlat/packet_diag_info_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/mmap_prot.h /usr/src/debug/strace/6.4-r0/src/xlat/nl_xfrm_types.h /usr/src/debug/strace/6.4-r0/tests/sockopt-timestamp.c /usr/src/debug/strace/6.4-r0/tests/pidns-cache.c /usr/src/debug/strace/6.4-r0/tests/acces
 s--secontext.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/nfc.h /usr/src/debug/strace/6.4-r0/tests/ipc.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/tee.h /usr/src/debug/strace/6.4-r0/src/xlat/bpf_query_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/bdaddr_types.h /usr/src/debug/strace/6.4-r0/src/xlat/fs_ioc_flags.h /usr/src/debug/strace/6.4-r0/tests/aio.c /usr/src/debug/strace/6.4-r0/tests/readdir.c /usr/src/debug/strace/6.4-r0/src/xlat/prctl_options.h /usr/src/debug/strace/6.4-r0/src/xlat/archvals.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_nexthop_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_tables.h /usr/src/debug/strace/6.4-r0/tests/rt_sigprocmask.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_vf_link_states.h /usr/src/debug/strace/6.4-r0/src/xlat/perf_branch_sample_type.h /usr/src/debug/strace/6.4-r0/src/xlat/futexwakeops.h /usr/src/debug/strace/6.4-r0/tests/so_peercred.c /usr/src/debug/strace/6.4-r0/tests/move_mount.c /usr/src/d
 ebug/strace/6.4-r0/src/xlat/perf_hw_id.h /usr/src/debug/strace/6.4-r0/tests/net-yy-netlink.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/mroute.h /usr/src/debug/strace/6.4-r0/tests/nlattr_ifla_protinfo.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/mtd/ubi-user.h /usr/src/debug/strace/6.4-r0/src/xlat/nf_ulog_msg_types.h /usr/src/debug/strace/6.4-r0/tests/ioctl_evdev.c /usr/src/debug/strace/6.4-r0/tests/membarrier.c /usr/src/debug/strace/6.4-r0/tests/kexec_file_load.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/rdma/ib_user_verbs.h /usr/src/debug/strace/6.4-r0/src/xlat/uring_register_rsrc_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/ip_cmsg_types.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_logical_ino_args_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/keyctl.h /usr/src/debug/strace/6.4-r0/src/xlat/bpf_map_lookup_elem_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/inet_devconf_indices.h /usr/src/debug/strace/6.4-r0/src
 /xlat/clone3_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/hdio_ide_nice.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_mdba_mdb_entry_attrs.h /usr/src/debug/strace/6.4-r0/tests/inject-nf.c /usr/src/debug/strace/6.4-r0/tests/segv_accerr.c /usr/src/debug/strace/6.4-r0/tests/sched_yield.c /usr/src/debug/strace/6.4-r0/tests/getegid.c /usr/src/debug/strace/6.4-r0/tests/geteuid.c /usr/src/debug/strace/6.4-r0/tests/getppid.c /usr/src/debug/strace/6.4-r0/tests/getxgid.c /usr/src/debug/strace/6.4-r0/tests/getxpid.c /usr/src/debug/strace/6.4-r0/tests/getxuid.c /usr/src/debug/strace/6.4-r0/tests/setugid.c /usr/src/debug/strace/6.4-r0/tests/waitpid.c /usr/src/debug/strace/6.4-r0/tests/xetpgid.c /usr/src/debug/strace/6.4-r0/tests/socketcall.c /usr/src/debug/strace/6.4-r0/src/xlat/sock_packet_options.h /usr/src/debug/strace/6.4-r0/src/xlat/landlock_ruleset_access_fs.h /usr/src/debug/strace/6.4-r0/src/xlat/sync_file_range_flags.h /usr/src/debug/strace/6.4-r0/tests/dup.c /usr/src/debug/strace/6.4-r0
 /src/xlat/ptrace_setoptions_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/pr_set_vma.h /usr/src/debug/strace/6.4-r0/src/xlat/netlink_ack_flags.h /usr/src/debug/strace/6.4-r0/tests/lock_file.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_tuner_rxsubchanses.h /usr/src/debug/strace/6.4-r0/src/xlat/netfilter_versions.h /usr/src/debug/strace/6.4-r0/src/xlat/ipc_msg_flags.h /usr/src/debug/strace/6.4-r0/tests/status-unfinished.c /usr/src/debug/strace/6.4-r0/tests/execve.c /usr/src/debug/strace/6.4-r0/tests/ptrace.c /usr/src/debug/strace/6.4-r0/tests/rename.c /usr/src/debug/strace/6.4-r0/tests/splice.c /usr/src/debug/strace/6.4-r0/tests/uio.c /usr/src/debug/strace/6.4-r0/tests/nfnetlink_cttimeout.c /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_slock_keys.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/smc_diag.h /usr/src/debug/strace/6.4-r0/src/xlat/routing_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/whence_codes.h /usr/src/debug/strace/6.4-r0/tests/so_linger.c /usr/src/debug
 /strace/6.4-r0/tests/rt_tgsigqueueinfo.c /usr/src/debug/strace/6.4-r0/tests/clock_t_str.c /usr/src/debug/strace/6.4-r0/tests/ioperm.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/userfaultfd.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_brport_attrs.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/blkpg.h /usr/src/debug/strace/6.4-r0/tests/fspick.c /usr/src/debug/strace/6.4-r0/tests/llseek.c /usr/src/debug/strace/6.4-r0/tests/unlink.c /usr/src/debug/strace/6.4-r0/src/xlat/bsg_protocol.h /usr/src/debug/strace/6.4-r0/src/xlat/kcm_protocols.h /usr/src/debug/strace/6.4-r0/src/xlat/perf_hw_cache_op_id.h /usr/src/debug/strace/6.4-r0/tests/umovestr_cached.c /usr/src/debug/strace/6.4-r0/tests/getgroups.c /usr/src/debug/strace/6.4-r0/tests/setgroups.c /usr/src/debug/strace/6.4-r0/tests/inode_of_sockfd.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/inet_diag.h /usr/src/debug/strace/6.4-r0/tests/at_fdcwd-pathmax.c /usr/src/debug/strace/6.4-r
 0/src/xlat/tee_ioctl_param_attr_types.h /usr/src/debug/strace/6.4-r0/tests/ioctl_ptp.c /usr/src/debug/strace/6.4-r0/tests/sendfile64.c /usr/src/debug/strace/6.4-r0/src/xlat/bpf_prog_types.h /usr/src/debug/strace/6.4-r0/tests/printstrn-umoven-undumpable.c /usr/src/debug/strace/6.4-r0/tests/fdatasync.c /usr/src/debug/strace/6.4-r0/tests/attach-p-cmd.h /usr/src/debug/strace/6.4-r0/src/xlat/at_statx_sync_types.h /usr/src/debug/strace/6.4-r0/src/xlat/fdb_notify_flags.h /usr/src/debug/strace/6.4-r0/tests/netlink_netfilter.c /usr/src/debug/strace/6.4-r0/tests/xgetrlimit.c /usr/src/debug/strace/6.4-r0/tests/ioctl_hdio.c /usr/src/debug/strace/6.4-r0/src/xlat/fdflags.h /usr/src/debug/strace/6.4-r0/tests/pread64-pwrite64.c /usr/src/debug/strace/6.4-r0/src/xlat/rtc_params.h /usr/src/debug/strace/6.4-r0/src/xlat/smc_states.h /usr/src/debug/strace/6.4-r0/tests/fcntl.c /usr/src/debug/strace/6.4-r0/tests/flock.c /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_defrag_flags.h /usr/src/debug/strace/6.4-r0
 /tests/mincore.c /usr/src/debug/strace/6.4-r0/tests/unshare.c /usr/src/debug/strace/6.4-r0/src/xlat/aio_cmds.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_fn_keys.h /usr/src/debug/strace/6.4-r0/tests/openat2.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_info_data_bridge_attrs.h /usr/src/debug/strace/6.4-r0/tests/umount2.c /usr/src/debug/strace/6.4-r0/tests/group_req.c /usr/src/debug/strace/6.4-r0/src/xlat/adjtimex_state.h /usr/src/debug/strace/6.4-r0/tests/qual_inject-retval.c /usr/src/debug/strace/6.4-r0/tests/net-packet_mreq.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_nha_res_group_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/ioprio_class.h /usr/src/debug/strace/6.4-r0/src/xlat/netlink_get_flags.h /usr/src/debug/strace/6.4-r0/tests/kern_features.c /usr/src/debug/strace/6.4-r0/src/xlat/mdb_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/pr_pac_keys.h /usr/src/debug/strace/6.4-r0/src/xlat/x86_xfeature_bits.h /usr/src/debug/strace/6.4-r0/tests/check_sigign.c /usr/src/debug/strac
 e/6.4-r0/tests/memfd_secret.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/netfilter/nfnetlink_cttimeout.h /usr/src/debug/strace/6.4-r0/tests/preadv2-pwritev2.c /usr/src/debug/strace/6.4-r0/tests/getsockname.c /usr/src/debug/strace/6.4-r0/src/xlat/splice_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/nl_sock_diag_types.h /usr/src/debug/strace/6.4-r0/src/xlat/sa_handler_values.h /usr/src/debug/strace/6.4-r0/tests/ioctl_nbd.c /usr/src/debug/strace/6.4-r0/src/xlat/bpf_map_update_elem_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/inet_diag_req_attrs.h /usr/src/debug/strace/6.4-r0/tests/prctl-dumpable.c /usr/src/debug/strace/6.4-r0/src/xlat/f_seals.h /usr/src/debug/strace/6.4-r0/src/xlat/mpol_mode_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/seccomp_ops.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/mroute6.h /usr/src/debug/strace/6.4-r0/src/xlat/inet6_if_flags.h /usr/src/debug/strace/6.4-r0/tests/prctl-securebits.c /usr/src/debug/strace/6.4-r0/src/xlat/
 inet_diag_extended_flags.h /usr/src/debug/strace/6.4-r0/tests/faccessat2.c /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/socket.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_shutdown_flags.h /usr/src/debug/strace/6.4-r0/tests/adjtimex.c /usr/src/debug/strace/6.4-r0/src/xlat/rtc_backup_switch_modes.h /usr/src/debug/strace/6.4-r0/tests/execve--secontext.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_frameinterval_types.h /usr/src/debug/strace/6.4-r0/src/xlat/compat_ptrace_cmds.h /usr/src/debug/strace/6.4-r0/tests/semtimedop-common.c /usr/src/debug/strace/6.4-r0/tests/read-write.c /usr/src/debug/strace/6.4-r0/src/xlat/rtc_vl_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/ifstats_offload_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/ieee802154_pan_ids.h /usr/src/debug/strace/6.4-r0/src/xlat/bluetooth_l2_cid.h /usr/src/debug/strace/6.4-r0/src/xlat/ptrace_cmds.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/quota.h /usr/src/debug/strace/6.4-r0/tests/create_tmpf
 ile.c /usr/src/debug/strace/6.4-r0/src/xlat/pr_spec_get_store_bypass_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/pr_spec_set_store_bypass_flags.h /usr/src/debug/strace/6.4-r0/tests/sigpending.c /usr/src/debug/strace/6.4-r0/tests/umask.c /usr/src/debug/strace/6.4-r0/tests/uname.c /usr/src/debug/strace/6.4-r0/tests/ustat.c /usr/src/debug/strace/6.4-r0/tests/utime.c /usr/src/debug/strace/6.4-r0/tests/wait4.c /usr/src/debug/strace/6.4-r0/tests/setns.c /usr/src/debug/strace/6.4-r0/tests/shmxt.c /usr/src/debug/strace/6.4-r0/tests/sleep.c /usr/src/debug/strace/6.4-r0/tests/statx.c /usr/src/debug/strace/6.4-r0/tests/xattr.c /usr/src/debug/strace/6.4-r0/tests/pidns.h /usr/src/debug/strace/6.4-r0/tests/tests.h /usr/src/debug/strace/6.4-r0/src/xlat/kd_key_lock_keys.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_balance_state.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_csum_types.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_framesize_types.h /usr/src/debug/strace/6.4-r0/src/xlat/ioprio_who.h
  /usr/src/debug/strace/6.4-r0/src/xlat/evdev_mtslots.h /usr/src/debug/strace/6.4-r0/tests/sched_xetattr.c /usr/src/debug/strace/6.4-r0/tests/timer_xettime.c /usr/src/debug/strace/6.4-r0/tests/readahead.c /usr/src/debug/strace/6.4-r0/tests/ioctl_mtd.c /usr/src/debug/strace/6.4-r0/src/xlat/pr_cap_ambient.h /usr/src/debug/strace/6.4-r0/tests/printxval.c /usr/src/debug/strace/6.4-r0/tests/delete_module.c /usr/src/debug/strace/6.4-r0/tests/ioctl_sg_io_v3.c /usr/src/debug/strace/6.4-r0/tests/overflowuid.c /usr/src/debug/strace/6.4-r0/src/xlat/nf_ctnetlink_exp_msg_types.h /usr/src/debug/strace/6.4-r0/tests/semop.c /usr/src/debug/strace/6.4-r0/tests/times.c /usr/src/debug/strace/6.4-r0/tests/tkill.c /usr/src/debug/strace/6.4-r0/tests/ioctl.c /usr/src/debug/strace/6.4-r0/tests/mbind.c /usr/src/debug/strace/6.4-r0/tests/mknod.c /usr/src/debug/strace/6.4-r0/tests/mlock.c /usr/src/debug/strace/6.4-r0/tests/mount.c /usr/src/debug/strace/6.4-r0/tests/fsync.c /usr/src/debug/strace/6.4-r0/tests/fut
 ex.c /usr/src/debug/strace/6.4-r0/src/xlat/hdio_drive_cmds.h /usr/src/debug/strace/6.4-r0/tests/riscv_flush_icache.c /usr/src/debug/strace/6.4-r0/tests/init_delete_module.h /usr/src/debug/strace/6.4-r0/src/xlat/sigact_flags.h /usr/src/debug/strace/6.4-r0/tests/ioctl_fs_f.c /usr/src/debug/strace/6.4-r0/src/xlat/if_dqblk_valid.h /usr/src/debug/strace/6.4-r0/src/xlat/unshare_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/crypto_nl_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/sock_options.h /usr/src/debug/strace/6.4-r0/src/xlat/nf_ipset_msg_types.h /usr/src/debug/strace/6.4-r0/tests/ioctl_uffdio.c /usr/src/debug/strace/6.4-r0/src/xlat/lwtunnel_encap_types.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_tca_stats_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/dcb_commands.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/if_bridge.h /usr/src/debug/strace/6.4-r0/src/xlat/module_init_flags.h /usr/src/debug/strace/6.4-r0/tests/nlattr_rtgenmsg.c /usr/src/debug/strace/6.4-r0/src/xla
 t/lockfcmds.h /usr/src/debug/strace/6.4-r0/src/xlat/socktypes.h /usr/src/debug/strace/6.4-r0/src/xlat/qipcrtr_nodes.h /usr/src/debug/strace/6.4-r0/src/xlat/memfd_secret_flags.h /usr/src/debug/strace/6.4-r0/tests/fsmount.c /usr/src/debug/strace/6.4-r0/tests/ksysent.c /usr/src/debug/strace/6.4-r0/tests/ioctl_block.c /usr/src/debug/strace/6.4-r0/tests/nlattr_nlmsgerr.c /usr/src/debug/strace/6.4-r0/tests/net-accept-connect.c /usr/src/debug/strace/6.4-r0/src/xlat/getsock_ipv6_options.h /usr/src/debug/strace/6.4-r0/src/xlat/setsock_ipv6_options.h /usr/src/debug/strace/6.4-r0/src/xlat/tls_info_configs.h /usr/src/debug/strace/6.4-r0/tests/sigprocmask.c /usr/src/debug/strace/6.4-r0/tests/lookup_dcookie.c /usr/src/debug/strace/6.4-r0/src/xlat/if_dqinfo_valid.h /usr/src/debug/strace/6.4-r0/tests/status-successful-threads.c /usr/src/debug/strace/6.4-r0/src/xlat/sock_bluetooth_options.h /usr/src/debug/strace/6.4-r0/tests/block_reset_raise_run.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_por
 t_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/faccessat_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/at_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/dm_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_streaming_capabilities.h /usr/src/debug/strace/6.4-r0/tests/prctl-sme.c /usr/src/debug/strace/6.4-r0/src/xlat/gpio_event_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_af_spec_inet6_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/uring_setup_features.h /usr/src/debug/strace/6.4-r0/src/xlat/fib_rule_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/clone_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_xdp_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/ifstats_af_spec_mpls_attrs.h /usr/src/debug/strace/6.4-r0/tests/inotify_init.c /usr/src/debug/strace/6.4-r0/src/xlat/perf_event_sample_format.h /usr/src/debug/strace/6.4-r0/tests/epoll_pwait.c /usr/src/debug/strace/6.4-r0/src/xlat/mtd_mode_options.h /usr/src/debug/strace/6.4-r0/src/xlat/mtd_type_options.h /usr/src/debug/str
 ace/6.4-r0/src/xlat/pr_tagged_addr_enable.h /usr/src/debug/strace/6.4-r0/src/xlat/access_modes.h /usr/src/debug/strace/6.4-r0/src/xlat/fsconfig_cmds.h /usr/src/debug/strace/6.4-r0/tests/printstrn-umoven.c /usr/src/debug/strace/6.4-r0/src/xlat/statx_attrs.h /usr/src/debug/strace/6.4-r0/src/xlat/statx_masks.h /usr/src/debug/strace/6.4-r0/src/xlat/xfs_dqblk_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/xfs_quota_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/loop_flags_options.h /usr/src/debug/strace/6.4-r0/tests/seccomp-filter.c /usr/src/debug/strace/6.4-r0/tests/hexdump_strdup.c /usr/src/debug/strace/6.4-r0/src/xlat/v4l2_capture_modes.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_dev_replace_state.h /usr/src/debug/strace/6.4-r0/src/xlat/cap.h /usr/src/debug/strace/6.4-r0/tests/ioctl_lirc.c /usr/src/debug/strace/6.4-r0/tests/seccomp-strict.c /usr/src/debug/strace/6.4-r0/src/xlat/sg_io_dxfer_direction.h /usr/src/debug/strace/6.4-r0/src/xlat/inet_diag_attrs.h /usr/src/debug/strace/6.4-r0
 /src/xlat/btrfs_dev_stats_values.h /usr/src/debug/strace/6.4-r0/tests/pipe2.c /usr/src/debug/strace/6.4-r0/tests/ppoll.c /usr/src/debug/strace/6.4-r0/tests/pause.c /usr/src/debug/strace/6.4-r0/tests/pidns.c /usr/src/debug/strace/6.4-r0/tests/quotactl.c /usr/src/debug/strace/6.4-r0/tests/get_mempolicy.c /usr/src/debug/strace/6.4-r0/tests/set_mempolicy.c /usr/src/debug/strace/6.4-r0/tests/strace-p1-Y-p.c /usr/src/debug/strace/6.4-r0/tests/quotactl.h /usr/src/debug/strace/6.4-r0/src/xlat/uffd_api_flags.h /usr/src/debug/strace/6.4-r0/tests/kexec_load.c /usr/src/debug/strace/6.4-r0/tests/msg_control.c /usr/src/debug/strace/6.4-r0/tests/unlinkat.c /usr/src/debug/strace/6.4-r0/src/xlat/bluetooth_l2_psm.h /usr/src/debug/strace/6.4-r0/tests/nfnetlink_ipset.c /usr/src/debug/strace/6.4-r0/tests/inet-cmsg.c /usr/src/debug/strace/6.4-r0/tests/poke-sendfile.c /usr/src/debug/strace/6.4-r0/tests/faccessat.c /usr/src/debug/strace/6.4-r0/tests/inotify_init1.c /usr/src/debug/strace/6.4-r0/src/xlat/per
 f_hw_cache_op_result_id.h /usr/src/debug/strace/6.4-r0/tests/landlock_add_rule.c /usr/src/debug/strace/6.4-r0/tests/qual_fault.c /usr/src/debug/strace/6.4-r0/tests/set_ptracer_any.c /usr/src/debug/strace/6.4-r0/tests/recv-MSG_TRUNC.c /usr/src/debug/strace/6.4-r0/src/xlat/ptp_perout_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/route_nexthop_flags.h /usr/src/debug/strace/6.4-r0/src/xlat/ebpf_op_alu.h /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_ifla_events.h /usr/src/debug/strace/6.4-r0/src/xlat/qipcrtr_ports.h /usr/src/debug/strace/6.4-r0/src/xlat/keyctl_pkey_ops.h /usr/src/debug/strace/6.4-r0/src/xlat/btrfs_balance_flags.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/tcp.h /usr/src/debug/strace/6.4-r0/tests/ipc_msg.c /usr/src/debug/strace/6.4-r0/tests/libmmsg.c /usr/src/debug/strace/6.4-r0/tests/recvmsg.c /usr/src/debug/strace/6.4-r0/tests/fadvise.h /usr/src/debug/strace/6.4-r0/tests/madvise.c /usr/src/debug/strace/6.4-r0/src/xlat/rtnl_tca_act_flags.h /usr/src/debug/
 strace/6.4-r0/bundled/linux/include/uapi/linux/mptcp.h /usr/src/debug/strace/6.4-r0/bundled/linux/include/uapi/linux/pkt_sched.h"
packages/core2-32-poky-linux/strace/strace-src: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/strace/strace-src: PKGSIZE changed from 9090519 to 10101448 (+11%)
packages/core2-32-poky-linux/strace/strace-staticdev: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/strace/strace-staticdev: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/strace/strace: PV changed from "6.3" to "6.4"
packages/core2-32-poky-linux/strace/strace: PKGV changed from 6.3 [default] to 6.4 [default]
packages/core2-32-poky-linux/strace/strace: PKGSIZE changed from 1359241 to 1367433 (+1%)

--===============5384330087660662928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/ip_protocol-Xverbose.gen.test /usr/lib/strace/ptest/tests/nlattr_tcamsg-Xverbose.gen.test /usr/lib/strace/ptest/tests/nlattr_tcamsg-Xabbrev /usr/lib/strace/ptest/tests/strace--syscall-limit--seccomp-bpf.test /usr/lib/strace/ptest/tests/ip_protocol-Xraw /usr/lib/strace/ptest/tests/nlattr_tcamsg-Xabbrev.gen.test /usr/lib/strace/ptest/tests/nlattr_tcamsg-Xverbose /usr/lib/strace/ptest/tests/ip_protocol-Xabbrev /usr/lib/strace/ptest/tests/ip_protocol /usr/lib/strace/ptest/tests/strace--syscall-limit--seccomp-bpf-3.expected /usr/lib/strace/ptest/tests/nlattr_tcamsg-Xraw.gen.test /usr/lib/strace/ptest/tests/ip_protocol.gen.test /usr/lib/strace/ptest/tests/ip_protocol-Xabbrev.gen.test /usr/lib/strace/ptest/tests/ip_protocol-Xverbose /usr/lib/strace/ptest/tests/strace--syscall-limit--seccomp-bpf-2.expected /usr/lib/strace/ptest/tests/strace--syscall-limit--seccomp-bpf-1.expected /usr/lib/strace/pte
 st/tests/ip_protocol-Xraw.gen.test /usr/lib/strace/ptest/tests/nlattr_tcamsg-Xraw"
packages/core2-32-poky-linux/strace/strace-src: PKGSIZE changed from 9090519 to 10101448 (+11%)

--===============5384330087660662928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fb1af81339eb2e6b6fff8e063e60157376b9d832"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 84 Local 33 Mirrors 0 Missed 51 Current 573 (39% match, 92% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 578 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 603 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1162 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure_ptest_base)
NOTE: Running task 1244 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_package_setscene: Started
NOTE: Running task 1471 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_warn_musl)
NOTE: Running task 1472 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1522 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1524 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: Running task 1525 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_fetch)
NOTE: Running task 1549 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Started
NOTE: Running task 1574 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1603 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile)
NOTE: Running task 1629 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_fetch)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Succeeded
NOTE: Running task 1684 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Started
NOTE: Running task 1685 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Succeeded
NOTE: Running task 1705 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_unpack)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: Running task 1706 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Started
NOTE: Running task 1707 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_unpack)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: Running task 1719 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Succeeded
NOTE: recipe strace-6.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Succeeded
NOTE: recipe strace-6.4-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: Running task 1857 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_unpack)
NOTE: Running task 1912 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_compile)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Started
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: Running task 1959 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_253.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1998 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 1999 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 2000 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_collect_spdx_deps)
NOTE: recipe strace-6.4-r0: task do_unpack: Started
NOTE: Running task 2010 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_package_write_rpm)
NOTE: recipe grep-3.11-r0: task do_compile: Started
NOTE: recipe readline-8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe readline-8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2014 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx)
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2015 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: Running task 2016 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2017 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 2018 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_patch)
NOTE: Running task 2019 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_create_spdx: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: Running task 2020 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Succeeded
NOTE: Running task 2021 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: Running task 2022 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.4-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2023 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_patch)
NOTE: recipe strace-6.4-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2024 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: Running task 2025 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Succeeded
NOTE: Running task 2026 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_patch)
NOTE: Running task 2027 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2028 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_create_spdx)
NOTE: recipe systemd-1_253.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_patch: Started
NOTE: recipe gawk-5.2.2-r0: task do_create_spdx: Started
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe strace-6.4-r0: task do_patch: Succeeded
NOTE: Running task 2029 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2030 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_populate_lic)
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe strace-6.4-r0: task do_populate_lic: Started
NOTE: recipe strace-6.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_253.3-r0: task do_patch: Succeeded
NOTE: Running task 2032 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_configure)
NOTE: recipe strace-6.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_populate_lic unihash changed to f153ab268099a251ad5831772a7dd1bfefe8e455f50790bd088a463d88b585c6
NOTE: recipe strace-6.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2046 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: Running task 2048 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2049 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx)
NOTE: recipe gawk-5.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe sed-4.9-r0: task do_create_spdx: Started
NOTE: recipe grep-3.11-r0: task do_compile: Succeeded
NOTE: Running task 2050 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_install)
NOTE: recipe grep-3.11-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Succeeded
NOTE: recipe grep-3.11-r0: task do_install: Succeeded
NOTE: Running task 2051 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_package)
NOTE: recipe grep-3.11-r0: task do_package: Started
NOTE: recipe gawk-5.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe grep-3.11-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata)
NOTE: recipe grep-3.11-r0: task do_packagedata: Started
NOTE: recipe grep-3.11-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_create_spdx)
NOTE: Running task 2054 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_rpm)
NOTE: recipe grep-3.11-r0: task do_create_spdx: Started
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Succeeded
NOTE: Running task 2055 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2056 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Succeeded
NOTE: Running task 2057 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2058 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot)
NOTE: Running task 2059 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot unihash changed to 1901aaaff7f748a5f9ee874dd13607a3ffe1667aaefae84b1633673e682b9c48
NOTE: Setscene tasks completed
NOTE: Running task 2060 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2061 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2062 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2063 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_configure)
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_configure: Started
NOTE: recipe systemd-1_253.3-r0: task do_configure: Succeeded
NOTE: Running task 2064 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_compile)
NOTE: recipe systemd-1_253.3-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_configure: Succeeded
NOTE: Running task 2065 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_compile: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 2066 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe systemd-1_253.3-r0: task do_compile: Succeeded
NOTE: Running task 2067 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_install)
NOTE: recipe systemd-1_253.3-r0: task do_install: Started
NOTE: recipe systemd-1_253.3-r0: task do_install: Succeeded
NOTE: Running task 2068 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot)
NOTE: Running task 2069 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_package)
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_253.3-r0: task do_package: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot unihash changed to bf6f21abeeeb95f4c42e37da7dde05e5a805648d4054501d4f5bef2a353f8ff0
NOTE: Setscene tasks completed
NOTE: Running task 2070 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Succeeded
NOTE: Running task 2071 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2072 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Failed
NOTE: recipe gobject-introspection-1.76.1-r0: task do_compile: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_package: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2072 tasks of which 2004 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 111 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glib-2.0/1_2.76.3-r0/temp/log.do_packagedata.2712678
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata) failed with exit code '1'

--===============5384330087660662928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fb1af81339eb2e6b6fff8e063e60157376b9d832"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 84 Local 33 Mirrors 0 Missed 51 Current 573 (39% match, 92% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 578 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 603 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1162 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure_ptest_base)
NOTE: Running task 1244 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_fetch)
NOTE: Running task 1471 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_warn_musl)
NOTE: Running task 1472 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_write_config)
NOTE: Running task 1522 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1524 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: Running task 1525 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_package_setscene: Started
NOTE: Running task 1549 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: Running task 1574 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1628 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_fetch)
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1760 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Started
NOTE: Running task 1832 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Started
NOTE: Running task 1833 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Started
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.4-r0: task do_fetch: Started
NOTE: Running task 1862 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: Running task 1878 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_unpack)
NOTE: Running task 1879 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1880 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: recipe strace-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 1888 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_unpack)
NOTE: Running task 1912 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_compile)
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Succeeded
NOTE: Running task 1959 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Started
NOTE: Running task 1999 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: Running task 2001 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 2011 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Started
NOTE: recipe strace-6.4-r0: task do_unpack: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Started
NOTE: recipe grep-3.11-r0: task do_compile: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 2013 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe systemd-1_253.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe readline-8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2014 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx)
NOTE: recipe gawk-5.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2015 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: recipe readline-8.2-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 2016 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running task 2017 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: Running task 2018 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2019 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: Running task 2020 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: Running task 2021 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Succeeded
NOTE: Running task 2022 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe strace-6.4-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2023 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: Running task 2024 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.4-r0: task do_patch: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2025 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_create_spdx: Started
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Succeeded
NOTE: Running task 2026 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_patch)
NOTE: Running task 2027 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_253.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_patch: Started
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: Running task 2028 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe strace-6.4-r0: task do_patch: Succeeded
NOTE: Running task 2029 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2030 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_populate_lic)
NOTE: recipe strace-6.4-r0: task do_populate_lic: Started
NOTE: recipe strace-6.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_253.3-r0: task do_patch: Succeeded
NOTE: Running task 2032 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_configure)
NOTE: recipe strace-6.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_populate_lic unihash changed to f153ab268099a251ad5831772a7dd1bfefe8e455f50790bd088a463d88b585c6
NOTE: recipe systemd-1_253.3-r0: task do_configure: Started
NOTE: recipe strace-6.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2046 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: Running task 2047 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2049 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx)
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Started
NOTE: recipe grep-3.11-r0: task do_compile: Succeeded
NOTE: Running task 2050 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_install)
NOTE: recipe grep-3.11-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Succeeded
NOTE: recipe grep-3.11-r0: task do_install: Succeeded
NOTE: Running task 2051 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_package)
NOTE: recipe grep-3.11-r0: task do_package: Started
NOTE: recipe gawk-5.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe grep-3.11-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata)
NOTE: recipe grep-3.11-r0: task do_packagedata: Started
NOTE: recipe grep-3.11-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_create_spdx)
NOTE: Running task 2054 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_rpm)
NOTE: recipe grep-3.11-r0: task do_create_spdx: Started
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Succeeded
NOTE: Running task 2055 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile_ptest_base)
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2056 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Succeeded
NOTE: Running task 2057 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2058 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot)
NOTE: Running task 2059 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot unihash changed to 9b7f022d1e1a7dcd6986bbf3a0d2c8756354f64d3322dac4d579567cb49ca099
NOTE: Setscene tasks completed
NOTE: Running task 2060 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2061 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2062 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2063 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_configure)
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_configure: Started
NOTE: recipe systemd-1_253.3-r0: task do_configure: Succeeded
NOTE: Running task 2064 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_compile)
NOTE: recipe systemd-1_253.3-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_configure: Succeeded
NOTE: Running task 2065 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_compile: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 2066 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe systemd-1_253.3-r0: task do_compile: Succeeded
NOTE: Running task 2067 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_install)
NOTE: recipe systemd-1_253.3-r0: task do_install: Started
NOTE: recipe systemd-1_253.3-r0: task do_install: Succeeded
NOTE: Running task 2068 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot)
NOTE: Running task 2069 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_package)
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_253.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Succeeded
NOTE: Running task 2070 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot unihash changed to e6b1d92dc13406b12fb8089e92dbc79b95cbfea51e0f36ad7f50a66d8a5a81e8
NOTE: Running task 2071 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Failed
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_compile: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_package: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2071 tasks of which 2004 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 111 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glib-2.0/1_2.76.3-r0/temp/log.do_packagedata.2560595
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata) failed with exit code '1'

--===============5384330087660662928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 48 skipped, 0 masked, 0 errors.
Removing 83 recipes from the core2-32 sysroot...done.
Removing 95 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fb1af81339eb2e6b6fff8e063e60157376b9d832"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 373 Local 287 Mirrors 0 Missed 86 Current 233 (76% match, 85% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 234 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 246 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 266 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 282 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 283 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 291 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 295 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 296 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 304 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 312 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 313 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-72-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 326 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 327 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 329 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 330 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: recipe icu-72-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 331 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 336 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 338 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 855 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 856 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: Running task 857 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: Running task 858 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_fetch)
NOTE: Running task 879 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_fetch)
NOTE: Running task 881 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: Running task 884 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_write_config)
NOTE: Running task 898 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_fetch)
NOTE: Running setscene task 348 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 352 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 353 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 363 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 367 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 370 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 376 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 377 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 381 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 382 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 391 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Started
NOTE: Running task 908 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_write_config)
NOTE: Running task 909 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: Running task 923 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: Running setscene task 395 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_fetch: Started
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.4-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 957 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 958 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 959 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: Running task 960 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe strace-6.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 966 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_unpack)
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: recipe grep-3.11-r0: task do_fetch: Started
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Started
NOTE: Running task 967 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Succeeded
NOTE: recipe grep-3.11-r0: task do_fetch: Succeeded
NOTE: Running task 972 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 973 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 974 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 975 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: Running task 976 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_fetch)
NOTE: Running task 977 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 405 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running task 978 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 979 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: Running task 980 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 981 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 415 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe strace-6.4-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 423 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 424 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 426 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 428 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 429 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 435 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_setscene)
NOTE: recipe grep-3.11-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: Running setscene task 439 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_package_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_fetch: Succeeded
NOTE: Running setscene task 449 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 450 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 454 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_setscene)
NOTE: Running setscene task 458 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: Running task 1013 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_unpack)
NOTE: Running task 1015 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: Running task 1026 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1027 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 1029 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: Running task 1030 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1034 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_unpack)
NOTE: Running task 1035 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1036 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_unpack)
NOTE: Running task 1043 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 1044 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_patch)
NOTE: Running task 1045 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_unpack)
NOTE: Running task 1046 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: Running task 1059 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.12-r0: task do_unpack: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Started
NOTE: recipe grep-3.11-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: Running task 1072 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 469 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_patch: Succeeded
NOTE: Running task 1078 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_unpack: Succeeded
NOTE: Running task 1087 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1088 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1089 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1090 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 1091 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1092 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: Running task 1093 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 481 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 489 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 495 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1099 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: Running task 1102 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1103 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe eudev-3.2.12-r0: task do_patch: Started
NOTE: Running task 1104 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.4-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: Running task 1106 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_patch)
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: Running task 1107 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 498 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 1114 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1117 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_patch)
NOTE: Running task 1118 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: recipe strace-6.4-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_package_setscene: Started
NOTE: Running task 1120 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_package_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_package_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 510 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.8-r0: task do_patch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Succeeded
NOTE: Running task 1173 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_patch)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1178 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe strace-6.4-r0: task do_patch: Succeeded
NOTE: Running task 1179 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1180 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_populate_lic)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 544 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe strace-6.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.4-r0: task do_populate_lic: Started
NOTE: Running task 1181 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe strace-6.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_populate_lic unihash changed to f153ab268099a251ad5831772a7dd1bfefe8e455f50790bd088a463d88b585c6
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe strace-6.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1186 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 1189 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 549 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1195 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: recipe readline-8.2-r0: task do_package_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1198 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 555 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1199 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1202 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1420 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1457 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1540 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1664 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_collect_spdx_deps)
NOTE: Running task 1680 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1721 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1749 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_collect_spdx_deps)
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1758 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1788 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_collect_spdx_deps)
NOTE: Running task 1789 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 1791 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: Running task 1802 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1803 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe readline-8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-30-r0: task do_collect_spdx_deps: Started
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe readline-8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1805 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx)
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1806 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx)
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1807 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1808 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_configure)
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx: Started
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1809 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1810 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe grep-3.11-r0: task do_configure: Started
NOTE: Running task 1811 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_configure)
NOTE: recipe kmod-30-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_configure: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1812 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1813 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_create_spdx)
NOTE: recipe gawk-5.2.2-r0: task do_create_spdx: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Succeeded
NOTE: Running task 1814 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_compile)
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Started
NOTE: recipe gawk-5.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Succeeded
NOTE: Running task 1815 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_install)
NOTE: recipe xorgproto-2023.2-r0: task do_install: Started
NOTE: recipe xorgproto-2023.2-r0: task do_install: Succeeded
NOTE: Running task 1816 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot)
NOTE: Running task 1817 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot unihash changed to 2172cd54f872e008aa90717c1aee2259885aa6ec1881c9fad728a9e818fe0953
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot became valid
NOTE: Running setscene task 589 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1818 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package unihash changed to 14ed32fb6739865e5c33a4d88131b966e0d6168ae6615d3a43fca111da4d265f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata became valid
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_package_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 598 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 600 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package_setscene)
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 602 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package_setscene)
NOTE: Running setscene task 605 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 606 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1861 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1862 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: Running task 1863 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_collect_spdx_deps)
NOTE: Running task 1864 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1865 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1866 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1867 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1868 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1869 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1870 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1871 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Succeeded
NOTE: Running task 1872 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_collect_spdx_deps)
NOTE: recipe libx11-1_1.8.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1873 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx: Started
NOTE: recipe kmod-30-r0: task do_configure: Succeeded
NOTE: Running task 1874 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx: Succeeded
NOTE: recipe kmod-30-r0: task do_compile: Succeeded
NOTE: Running task 1875 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_install)
NOTE: recipe kmod-30-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_install: Succeeded
NOTE: Running task 1876 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot)
NOTE: Running task 1877 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-30-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure: Succeeded
NOTE: Running task 1878 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1879 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1880 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile)
NOTE: recipe eudev-3.2.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Started
NOTE: recipe eudev-3.2.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1881 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_configure)
NOTE: recipe eudev-3.2.12-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_package: Succeeded
NOTE: Running task 1882 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: Running task 1883 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_create_spdx)
NOTE: recipe kmod-30-r0: task do_create_spdx: Started
NOTE: recipe kmod-30-r0: task do_create_spdx: Succeeded
NOTE: Running task 1884 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_collect_spdx_deps)
NOTE: recipe eudev-3.2.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe grep-3.11-r0: task do_configure: Succeeded
NOTE: Running task 1885 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_compile)
NOTE: recipe grep-3.11-r0: task do_compile: Started
NOTE: recipe eudev-3.2.12-r0: task do_configure: Succeeded
NOTE: Running task 1886 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_compile)
NOTE: recipe eudev-3.2.12-r0: task do_compile: Started
NOTE: recipe grep-3.11-r0: task do_compile: Succeeded
NOTE: Running task 1887 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_install)
NOTE: recipe grep-3.11-r0: task do_install: Started
NOTE: recipe grep-3.11-r0: task do_install: Succeeded
NOTE: Running task 1888 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_package)
NOTE: recipe grep-3.11-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Succeeded
NOTE: Running task 1889 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1890 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Started
NOTE: recipe eudev-3.2.12-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_install)
NOTE: recipe eudev-3.2.12-r0: task do_install: Started
NOTE: recipe eudev-3.2.12-r0: task do_install: Succeeded
NOTE: Running task 1892 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot)
NOTE: Running task 1893 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_package)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.12-r0: task do_package: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Succeeded
NOTE: Running task 1894 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1895 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot)
NOTE: Running task 1896 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package)
NOTE: recipe grep-3.11-r0: task do_package: Succeeded
NOTE: Running task 1897 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Started
NOTE: recipe grep-3.11-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot unihash changed to 25bf0a5c6b0ee47772d1393cc4fa038431667693a30232bdaad1c050aacdd8a2
NOTE: recipe grep-3.11-r0: task do_packagedata: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1898 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1899 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1900 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1901 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_create_spdx)
NOTE: Running task 1902 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_rpm)
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.11-r0: task do_create_spdx: Started
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1903 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1904 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1905 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: recipe grep-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_configure: Started
NOTE: recipe eudev-3.2.12-r0: task do_package: Succeeded
NOTE: Running task 1906 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1907 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx)
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx: Started
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_configure: Succeeded
NOTE: Running task 1908 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_compile: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 1909 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Succeeded
NOTE: Running task 1910 of 1970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Failed
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1910 tasks of which 1761 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 111 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glib-2.0/1_2.76.3-r0/temp/log.do_packagedata.2825602
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata) failed with exit code '1'

--===============5384330087660662928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1804 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fb1af81339eb2e6b6fff8e063e60157376b9d832"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 86 Local 35 Mirrors 0 Missed 51 Current 571 (40% match, 92% complete)
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 576 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 600 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 628 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 642 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe qemu-native-8.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-8.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe qemu-native-8.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-native-8.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1162 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure_ptest_base)
NOTE: Running task 1244 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_package_setscene: Started
NOTE: Running task 1471 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_warn_musl)
NOTE: Running task 1472 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_write_config)
NOTE: Running task 1522 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1524 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: Running task 1525 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1549 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: Running task 1574 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_write_config)
NOTE: Running task 1628 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_fetch)
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1670 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: Running task 1768 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 1769 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Succeeded
NOTE: Running task 1800 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_unpack)
NOTE: Running task 1801 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_unpack)
NOTE: Running task 1802 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.4-r0: task do_fetch: Started
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Succeeded
NOTE: Running task 1803 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: recipe strace-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 1825 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Started
NOTE: Running task 1912 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_compile)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: Running task 1959 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Started
NOTE: Running task 1999 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 2001 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe strace-6.4-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 2012 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_package_write_rpm)
NOTE: recipe systemd-1_253.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2013 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe grep-3.11-r0: task do_compile: Started
NOTE: recipe readline-8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2014 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx)
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2015 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 2016 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_create_spdx: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running task 2017 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: Running task 2018 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2019 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: Running task 2020 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Succeeded
NOTE: Running task 2021 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: Running task 2022 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: recipe strace-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 2023 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.4-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2024 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2025 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_create_spdx)
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: Running task 2026 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.2-r0: task do_create_spdx: Started
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Succeeded
NOTE: Running task 2027 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_patch)
NOTE: Running task 2028 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_253.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_patch: Started
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe strace-6.4-r0: task do_patch: Succeeded
NOTE: Running task 2029 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2030 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_populate_lic)
NOTE: recipe strace-6.4-r0: task do_populate_lic: Started
NOTE: recipe strace-6.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_253.3-r0: task do_patch: Succeeded
NOTE: recipe strace-6.4-r0: task do_populate_lic: Succeeded
NOTE: Running task 2032 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_populate_lic unihash changed to f153ab268099a251ad5831772a7dd1bfefe8e455f50790bd088a463d88b585c6
NOTE: recipe strace-6.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_configure: Started
NOTE: recipe gawk-5.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2046 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: Running task 2047 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2049 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx)
NOTE: recipe sed-4.9-r0: task do_create_spdx: Started
NOTE: recipe grep-3.11-r0: task do_compile: Succeeded
NOTE: Running task 2050 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_install)
NOTE: recipe grep-3.11-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Succeeded
NOTE: recipe grep-3.11-r0: task do_install: Succeeded
NOTE: Running task 2051 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_package)
NOTE: recipe grep-3.11-r0: task do_package: Started
NOTE: recipe gawk-5.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Succeeded
NOTE: Running task 2052 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2053 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Started
NOTE: recipe grep-3.11-r0: task do_package: Succeeded
NOTE: Running task 2054 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata)
NOTE: recipe grep-3.11-r0: task do_packagedata: Started
NOTE: recipe grep-3.11-r0: task do_packagedata: Succeeded
NOTE: Running task 2055 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_create_spdx)
NOTE: Running task 2056 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_rpm)
NOTE: recipe grep-3.11-r0: task do_create_spdx: Started
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Succeeded
NOTE: Running task 2057 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2058 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot)
NOTE: Running task 2059 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot unihash changed to 68611302d6c47dd082d34c6eb98743b5a6388b115255fe25bdffb02c532643b1
NOTE: Setscene tasks completed
NOTE: Running task 2060 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2061 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2062 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2063 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_configure)
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_configure: Succeeded
NOTE: Running task 2064 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_compile: Started
NOTE: recipe systemd-1_253.3-r0: task do_configure: Succeeded
NOTE: Running task 2065 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_compile)
NOTE: recipe systemd-1_253.3-r0: task do_compile: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 2066 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe systemd-1_253.3-r0: task do_compile: Succeeded
NOTE: Running task 2067 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_install)
NOTE: recipe systemd-1_253.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Succeeded
NOTE: Running task 2068 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Started
NOTE: recipe systemd-1_253.3-r0: task do_install: Succeeded
NOTE: Running task 2069 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot)
NOTE: Running task 2070 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_package)
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_253.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Failed
NOTE: recipe gobject-introspection-1.76.1-r0: task do_compile: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_package: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2070 tasks of which 2004 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 111 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.76.3-r0/temp/log.do_packagedata.2488055
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata) failed with exit code '1'

--===============5384330087660662928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fb1af81339eb2e6b6fff8e063e60157376b9d832"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 84 Local 33 Mirrors 0 Missed 51 Current 568 (39% match, 92% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 573 of 652 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 598 of 652 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 613 of 652 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1156 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure_ptest_base)
NOTE: Running task 1236 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_package_setscene: Started
NOTE: Running task 1459 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_warn_musl)
NOTE: Running task 1460 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_write_config)
NOTE: Running task 1510 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1512 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: Running task 1513 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_fetch)
NOTE: Running task 1537 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: Running task 1562 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1616 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_fetch)
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1715 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: Running task 1794 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Started
NOTE: Running task 1803 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.4-r0: task do_fetch: Started
NOTE: Running task 1824 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_unpack)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Succeeded
NOTE: Running task 1851 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: Running task 1858 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_unpack)
NOTE: Running task 1859 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 1872 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Succeeded
NOTE: Running task 1898 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_compile)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Succeeded
NOTE: Running task 1943 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: Running task 1981 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 1983 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: Running task 1994 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_package_write_rpm)
NOTE: recipe strace-6.4-r0: task do_unpack: Started
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Started
NOTE: recipe grep-3.11-r0: task do_compile: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1997 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe systemd-1_253.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe readline-8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1998 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx)
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1999 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: recipe gawk-5.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx: Started
NOTE: Running task 2000 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: Running task 2001 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running task 2002 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2003 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: Running task 2004 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Succeeded
NOTE: Running task 2005 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2006 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_deploy_source_date_epoch)
NOTE: recipe strace-6.4-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2007 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe strace-6.4-r0: task do_patch: Started
NOTE: Running task 2008 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2009 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_create_spdx)
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Succeeded
NOTE: Running task 2010 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_patch)
NOTE: Running task 2011 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.2.2-r0: task do_create_spdx: Started
NOTE: recipe systemd-1_253.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_patch: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: Running task 2012 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe strace-6.4-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_patch: Succeeded
NOTE: Running task 2013 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2014 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_populate_lic)
NOTE: Running task 2016 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_configure)
NOTE: recipe strace-6.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.4-r0: task do_populate_lic: Started
NOTE: recipe systemd-1_253.3-r0: task do_configure: Started
NOTE: recipe strace-6.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.4.bb:do_populate_lic unihash changed to f153ab268099a251ad5831772a7dd1bfefe8e455f50790bd088a463d88b585c6
NOTE: recipe strace-6.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2030 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: Running task 2032 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2033 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx)
NOTE: recipe sed-4.9-r0: task do_create_spdx: Started
NOTE: recipe grep-3.11-r0: task do_compile: Succeeded
NOTE: Running task 2034 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_install)
NOTE: recipe grep-3.11-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Succeeded
NOTE: recipe grep-3.11-r0: task do_install: Succeeded
NOTE: Running task 2035 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_package)
NOTE: recipe grep-3.11-r0: task do_package: Started
NOTE: recipe gawk-5.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe grep-3.11-r0: task do_package: Succeeded
NOTE: Running task 2036 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata)
NOTE: recipe grep-3.11-r0: task do_packagedata: Started
NOTE: recipe grep-3.11-r0: task do_packagedata: Succeeded
NOTE: Running task 2037 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_create_spdx)
NOTE: Running task 2038 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_rpm)
NOTE: recipe grep-3.11-r0: task do_create_spdx: Started
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Succeeded
NOTE: Running task 2039 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2040 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Succeeded
NOTE: Running task 2041 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2042 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot)
NOTE: Running task 2043 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Started
NOTE: recipe systemd-1_253.3-r0: task do_configure: Succeeded
NOTE: Running task 2044 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_compile)
NOTE: recipe systemd-1_253.3-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot unihash changed to 77e966bf8894fc70b2821e7ecc0b17f064b66ee791626b11c19cef683bbcd2fb
NOTE: Setscene tasks completed
NOTE: Running task 2045 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2046 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2047 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2048 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_configure)
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_configure: Succeeded
NOTE: Running task 2049 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_compile: Started
NOTE: recipe systemd-1_253.3-r0: task do_compile: Succeeded
NOTE: Running task 2050 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_install)
NOTE: recipe systemd-1_253.3-r0: task do_install: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 2051 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe systemd-1_253.3-r0: task do_install: Succeeded
NOTE: Running task 2052 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot)
NOTE: Running task 2053 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_package)
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_253.3-r0: task do_package: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot unihash changed to c4e292da87653dd5abb72e4e94bb8723318075db0f7f5395d5ac6836d91e436b
NOTE: Setscene tasks completed
NOTE: Running task 2054 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Succeeded
NOTE: Running task 2055 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2056 of 2118 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Failed
NOTE: recipe gobject-introspection-1.76.1-r0: task do_compile: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_package: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2056 tasks of which 1988 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 111 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.76.4-r0 to 1:2.76.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glib-2.0/1_2.76.3-r0/temp/log.do_packagedata.2633739
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata) failed with exit code '1'

--===============5384330087660662928==--

