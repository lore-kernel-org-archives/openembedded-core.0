Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1540574565
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:33 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id p12so5116925pff.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
	:references:content-transfer-encoding;
	bh=tPCckBkMoG8c5rS+trzIYtKs0XGvCO4IZdx3S4mvics=;
	b=VRtdyKntVw8qHlcb2f6wEe1hyGbVlYzkZ+8szZeTsRJ9n2N3ad6XQFySCrhvDc40/T
	WeFaEwneK0JVYoG602DrsaeqfR+nQZvAwL2oxTAKZb1BnZkTVD8ZSkgdtyMUJPCFntUZ
	C+mv+4mxkEpNKWzUQz8Atjj+ijz1LHKzTXrKNUyoTcljhirGHg2iUeZmbxOwc2qLT8r0
	auORCt1Rc2VfolKX8l5qJZocjpbTM68aaejuOmkD0GPnZpe87teraW+QOdqfm+WF8egG
	TQMUidE2ci6de6P2nGAh9sSMKq8D9X8oa5pcZXbz/lxnNGKQSEb2Up5yCdjLEOT/6JN8
	jDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=tPCckBkMoG8c5rS+trzIYtKs0XGvCO4IZdx3S4mvics=;
	b=AGffUvmR+/cQAEYAVKgbiGuer9Z8q8zlucgubf5lbMiNGH3IEVS1GmmLYTZsIK/IQS
	jVzWG2m9fa4qAoX9hefhkY7cXbVT5f1kC/2ZKC5OVZJZOcDzP8Edqkr/bjnAXuX0PS0+
	j/uDwzTL0AGcO7J6UgZCkITK4pX3GygOxlmuLKFylGZWd4vsq3CYhtQmrzqgB5D1/m3e
	N65LX/g/cmiACDxjtX692CF9c1YiUQ9n3ne67/yG+XmFa5QtoiCLpeAd2wWlW942BcSF
	8ow+6vz+pk+m8wpMiKrPIqYoTsJxXytucV2Pf7+vPAAlCjV7DrS4VIJKqqNhZfNU2oJe
	7ywA==
X-Gm-Message-State: ALQs6tB10Qo0odWtUfsAaGuNfWk9EO3rOIrqwL1/F74PKuqAbMrtYA/X
	t1mYAAyKrhGrEj4y415Y3kRACw==
X-Google-Smtp-Source: AB8JxZpUh8pr1EnvBpEohpcUzcxLyKuLOUv/MdJc9pB61ZBG4MOsoWODJ7dNNsT7VqVhcWGti61A/w==
X-Received: by 2002:a17:902:1c7:: with SMTP id
	b65-v6mr9924573plb.298.1525030594225; 
	Sun, 29 Apr 2018 12:36:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:36:01 -0700
Message-Id: <28a8334c80ab8eb99913836ab19505d4e6b321a0.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 14/24] libtirpc: Upgrade to 1.0.4-tc1
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop backported patches
Redo musl support patch such that it
can be applied universally

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-stdint.h-for-uintptr_t.patch |  29 -
 ...0001-replace-__bzero-with-memset-API.patch |  64 --
 .../libtirpc/Use-netbsd-queue.h.patch         | 878 ------------------
 .../export_key_secretkey_is_set.patch         |  31 -
 .../libtirpc/libtirpc-1.0.4-rc1.patch         | 103 ++
 .../libtirpc/libtirpc/musl.patch              |  18 +
 .../{libtirpc_1.0.2.bb => libtirpc_1.0.3.bb}  |  13 +-
 7 files changed, 125 insertions(+), 1011 deletions(-)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/Use-netbsd-queue.h.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/libtirpc-1.0.4-rc1.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/musl.patch
 rename meta/recipes-extended/libtirpc/{libtirpc_1.0.2.bb => libtirpc_1.0.3.bb} (63%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch
deleted file mode 100644
index 7e3e2f86ad..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From acb9a37977cf0a9630eac74af9adebf35e38e719 Mon Sep 17 00:00:00 2001
-From: Thorsten Kukuk <kukuk@thkukuk.de>
-Date: Tue, 14 Nov 2017 10:39:08 -0500
-Subject: [PATCH] Include stdint.h from xdr_sizeof.c to avoid missing
- declaration errors.
-
-Signed-off-by: Thorsten Kukuk <kukuk@suse.de>
-Signed-off-by: Steve Dickson <steved@redhat.com>
----
- src/xdr_sizeof.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/xdr_sizeof.c b/src/xdr_sizeof.c
-index d23fbd1..79d6707 100644
---- a/src/xdr_sizeof.c
-+++ b/src/xdr_sizeof.c
-@@ -39,6 +39,7 @@
- #include <rpc/xdr.h>
- #include <sys/types.h>
- #include <stdlib.h>
-+#include <stdint.h>
- #include "un-namespace.h"
- 
- /* ARGSUSED */
--- 
-1.8.3.1
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch
deleted file mode 100644
index 7ae19cb319..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 5356b63005e9d8169e0399cb76f26fbd29a78dee Mon Sep 17 00:00:00 2001
-From: Joshua Kinard <kumba@gentoo.org>
-Date: Wed, 23 Aug 2017 14:31:36 -0400
-Subject: [PATCH] Replace bzero() calls with equivalent memset() calls
-
-As annotated in the bzero(3) man page, bzero() was marked as LEGACY in
-POSIX.1-2001 and removed in POSIX.1-2008, and should be replaced with
-memset() calls to write zeros to a memory region.  The attached patch
-replaces two bzero() calls and one __bzero() call in libtirpc with
-equivalent memset() calls.  The latter replacement fixes a compile error
-under uclibc-ng, which lacks a definition for __bzero()
-
-Signed-off-by: Joshua Kinard <kumba@gentoo.org>
-Signed-off-by: Steve Dickson <steved@redhat.com>
----
- src/auth_time.c    | 2 +-
- src/des_impl.c     | 2 +-
- src/svc_auth_des.c | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/auth_time.c b/src/auth_time.c
-index 7f83ab4..69400bc 100644
---- a/src/auth_time.c
-+++ b/src/auth_time.c
-@@ -317,7 +317,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
- 	sprintf(ipuaddr, "%d.%d.%d.%d.0.111", a1, a2, a3, a4);
- 	useua = &ipuaddr[0];
- 
--	bzero((char *)&sin, sizeof(sin));
-+	memset(&sin, 0, sizeof(sin));
- 	if (uaddr_to_sockaddr(useua, &sin)) {
- 		msg("unable to translate uaddr to sockaddr.");
- 		if (needfree)
-diff --git a/src/des_impl.c b/src/des_impl.c
-index 9dbccaf..15bec2a 100644
---- a/src/des_impl.c
-+++ b/src/des_impl.c
-@@ -588,7 +588,7 @@ _des_crypt (char *buf, unsigned len, struct desparams *desp)
-     }
-   tin0 = tin1 = tout0 = tout1 = xor0 = xor1 = 0;
-   tbuf[0] = tbuf[1] = 0;
--  __bzero (schedule, sizeof (schedule));
-+  memset (schedule, 0, sizeof (schedule));
- 
-   return (1);
- }
-diff --git a/src/svc_auth_des.c b/src/svc_auth_des.c
-index 2e90146..19a7c60 100644
---- a/src/svc_auth_des.c
-+++ b/src/svc_auth_des.c
-@@ -356,7 +356,7 @@ cache_init()
- 
- 	authdes_cache = (struct cache_entry *)
- 		mem_alloc(sizeof(struct cache_entry) * AUTHDES_CACHESZ);	
--	bzero((char *)authdes_cache, 
-+	memset(authdes_cache, 0,
- 		sizeof(struct cache_entry) * AUTHDES_CACHESZ);
- 
- 	authdes_lru = (short *)mem_alloc(sizeof(short) * AUTHDES_CACHESZ);
--- 
-1.8.3.1
diff --git a/meta/recipes-extended/libtirpc/libtirpc/Use-netbsd-queue.h.patch b/meta/recipes-extended/libtirpc/libtirpc/Use-netbsd-queue.h.patch
deleted file mode 100644
index f93223feb4..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/Use-netbsd-queue.h.patch
+++ /dev/null
@@ -1,878 +0,0 @@
-musl does not provide sys/queue.h implementation. Borrow queue.h from
-the NetBSD project
-http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.68
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-diff -Naur libtirpc-1.0.1-orig/src/clnt_bcast.c libtirpc-1.0.1/src/clnt_bcast.c
---- libtirpc-1.0.1-orig/src/clnt_bcast.c	2015-10-30 17:15:14.000000000 +0200
-+++ libtirpc-1.0.1/src/clnt_bcast.c	2015-12-21 17:03:52.066008311 +0200
-@@ -40,7 +40,6 @@
-  */
- #include <sys/socket.h>
- #include <sys/types.h>
--#include <sys/queue.h>
- 
- #include <net/if.h>
- #include <netinet/in.h>
-@@ -62,6 +61,7 @@
- #include <err.h>
- #include <string.h>
- 
-+#include "queue.h"
- #include "rpc_com.h"
- #include "debug.h"
- 
-diff -Naur libtirpc-1.0.1-orig/tirpc/queue.h libtirpc-1.0.1/tirpc/queue.h
---- libtirpc-1.0.1-orig/tirpc/queue.h	1970-01-01 02:00:00.000000000 +0200
-+++ libtirpc-1.0.1/tirpc/queue.h	2015-12-21 17:02:44.427853905 +0200
-@@ -0,0 +1,846 @@
-+/*	$NetBSD: queue.h,v 1.68 2014/11/19 08:10:01 uebayasi Exp $	*/
-+
-+/*
-+ * Copyright (c) 1991, 1993
-+ *	The Regents of the University of California.  All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in the
-+ *    documentation and/or other materials provided with the distribution.
-+ * 3. Neither the name of the University nor the names of its contributors
-+ *    may be used to endorse or promote products derived from this software
-+ *    without specific prior written permission.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
-+ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-+ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
-+ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-+ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-+ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-+ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
-+ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-+ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-+ * SUCH DAMAGE.
-+ *
-+ *	@(#)queue.h	8.5 (Berkeley) 8/20/94
-+ */
-+
-+#ifndef	_SYS_QUEUE_H_
-+#define	_SYS_QUEUE_H_
-+
-+/*
-+ * This file defines five types of data structures: singly-linked lists,
-+ * lists, simple queues, tail queues, and circular queues.
-+ *
-+ * A singly-linked list is headed by a single forward pointer. The
-+ * elements are singly linked for minimum space and pointer manipulation
-+ * overhead at the expense of O(n) removal for arbitrary elements. New
-+ * elements can be added to the list after an existing element or at the
-+ * head of the list.  Elements being removed from the head of the list
-+ * should use the explicit macro for this purpose for optimum
-+ * efficiency. A singly-linked list may only be traversed in the forward
-+ * direction.  Singly-linked lists are ideal for applications with large
-+ * datasets and few or no removals or for implementing a LIFO queue.
-+ *
-+ * A list is headed by a single forward pointer (or an array of forward
-+ * pointers for a hash table header). The elements are doubly linked
-+ * so that an arbitrary element can be removed without a need to
-+ * traverse the list. New elements can be added to the list before
-+ * or after an existing element or at the head of the list. A list
-+ * may only be traversed in the forward direction.
-+ *
-+ * A simple queue is headed by a pair of pointers, one the head of the
-+ * list and the other to the tail of the list. The elements are singly
-+ * linked to save space, so elements can only be removed from the
-+ * head of the list. New elements can be added to the list after
-+ * an existing element, at the head of the list, or at the end of the
-+ * list. A simple queue may only be traversed in the forward direction.
-+ *
-+ * A tail queue is headed by a pair of pointers, one to the head of the
-+ * list and the other to the tail of the list. The elements are doubly
-+ * linked so that an arbitrary element can be removed without a need to
-+ * traverse the list. New elements can be added to the list before or
-+ * after an existing element, at the head of the list, or at the end of
-+ * the list. A tail queue may be traversed in either direction.
-+ *
-+ * A circle queue is headed by a pair of pointers, one to the head of the
-+ * list and the other to the tail of the list. The elements are doubly
-+ * linked so that an arbitrary element can be removed without a need to
-+ * traverse the list. New elements can be added to the list before or after
-+ * an existing element, at the head of the list, or at the end of the list.
-+ * A circle queue may be traversed in either direction, but has a more
-+ * complex end of list detection.
-+ *
-+ * For details on the use of these macros, see the queue(3) manual page.
-+ */
-+
-+/*
-+ * Include the definition of NULL only on NetBSD because sys/null.h
-+ * is not available elsewhere.  This conditional makes the header
-+ * portable and it can simply be dropped verbatim into any system.
-+ * The caveat is that on other systems some other header
-+ * must provide NULL before the macros can be used.
-+ */
-+#ifdef __NetBSD__
-+#include <sys/null.h>
-+#endif
-+
-+#if defined(QUEUEDEBUG)
-+# if defined(_KERNEL)
-+#  define QUEUEDEBUG_ABORT(...) panic(__VA_ARGS__)
-+# else
-+#  include <err.h>
-+#  define QUEUEDEBUG_ABORT(...) err(1, __VA_ARGS__)
-+# endif
-+#endif
-+
-+/*
-+ * Singly-linked List definitions.
-+ */
-+#define	SLIST_HEAD(name, type)						\
-+struct name {								\
-+	struct type *slh_first;	/* first element */			\
-+}
-+
-+#define	SLIST_HEAD_INITIALIZER(head)					\
-+	{ NULL }
-+
-+#define	SLIST_ENTRY(type)						\
-+struct {								\
-+	struct type *sle_next;	/* next element */			\
-+}
-+
-+/*
-+ * Singly-linked List access methods.
-+ */
-+#define	SLIST_FIRST(head)	((head)->slh_first)
-+#define	SLIST_END(head)		NULL
-+#define	SLIST_EMPTY(head)	((head)->slh_first == NULL)
-+#define	SLIST_NEXT(elm, field)	((elm)->field.sle_next)
-+
-+#define	SLIST_FOREACH(var, head, field)					\
-+	for((var) = (head)->slh_first;					\
-+	    (var) != SLIST_END(head);					\
-+	    (var) = (var)->field.sle_next)
-+
-+#define	SLIST_FOREACH_SAFE(var, head, field, tvar)			\
-+	for ((var) = SLIST_FIRST((head));				\
-+	    (var) != SLIST_END(head) &&					\
-+	    ((tvar) = SLIST_NEXT((var), field), 1);			\
-+	    (var) = (tvar))
-+
-+/*
-+ * Singly-linked List functions.
-+ */
-+#define	SLIST_INIT(head) do {						\
-+	(head)->slh_first = SLIST_END(head);				\
-+} while (/*CONSTCOND*/0)
-+
-+#define	SLIST_INSERT_AFTER(slistelm, elm, field) do {			\
-+	(elm)->field.sle_next = (slistelm)->field.sle_next;		\
-+	(slistelm)->field.sle_next = (elm);				\
-+} while (/*CONSTCOND*/0)
-+
-+#define	SLIST_INSERT_HEAD(head, elm, field) do {			\
-+	(elm)->field.sle_next = (head)->slh_first;			\
-+	(head)->slh_first = (elm);					\
-+} while (/*CONSTCOND*/0)
-+
-+#define	SLIST_REMOVE_AFTER(slistelm, field) do {			\
-+	(slistelm)->field.sle_next =					\
-+	    SLIST_NEXT(SLIST_NEXT((slistelm), field), field);		\
-+} while (/*CONSTCOND*/0)
-+
-+#define	SLIST_REMOVE_HEAD(head, field) do {				\
-+	(head)->slh_first = (head)->slh_first->field.sle_next;		\
-+} while (/*CONSTCOND*/0)
-+
-+#define	SLIST_REMOVE(head, elm, type, field) do {			\
-+	if ((head)->slh_first == (elm)) {				\
-+		SLIST_REMOVE_HEAD((head), field);			\
-+	}								\
-+	else {								\
-+		struct type *curelm = (head)->slh_first;		\
-+		while(curelm->field.sle_next != (elm))			\
-+			curelm = curelm->field.sle_next;		\
-+		curelm->field.sle_next =				\
-+		    curelm->field.sle_next->field.sle_next;		\
-+	}								\
-+} while (/*CONSTCOND*/0)
-+
-+
-+/*
-+ * List definitions.
-+ */
-+#define	LIST_HEAD(name, type)						\
-+struct name {								\
-+	struct type *lh_first;	/* first element */			\
-+}
-+
-+#define	LIST_HEAD_INITIALIZER(head)					\
-+	{ NULL }
-+
-+#define	LIST_ENTRY(type)						\
-+struct {								\
-+	struct type *le_next;	/* next element */			\
-+	struct type **le_prev;	/* address of previous next element */	\
-+}
-+
-+/*
-+ * List access methods.
-+ */
-+#define	LIST_FIRST(head)		((head)->lh_first)
-+#define	LIST_END(head)			NULL
-+#define	LIST_EMPTY(head)		((head)->lh_first == LIST_END(head))
-+#define	LIST_NEXT(elm, field)		((elm)->field.le_next)
-+
-+#define	LIST_FOREACH(var, head, field)					\
-+	for ((var) = ((head)->lh_first);				\
-+	    (var) != LIST_END(head);					\
-+	    (var) = ((var)->field.le_next))
-+
-+#define	LIST_FOREACH_SAFE(var, head, field, tvar)			\
-+	for ((var) = LIST_FIRST((head));				\
-+	    (var) != LIST_END(head) &&					\
-+	    ((tvar) = LIST_NEXT((var), field), 1);			\
-+	    (var) = (tvar))
-+
-+#define	LIST_MOVE(head1, head2) do {					\
-+	LIST_INIT((head2));						\
-+	if (!LIST_EMPTY((head1))) {					\
-+		(head2)->lh_first = (head1)->lh_first;			\
-+		LIST_INIT((head1));					\
-+	}								\
-+} while (/*CONSTCOND*/0)
-+
-+/*
-+ * List functions.
-+ */
-+#if defined(QUEUEDEBUG)
-+#define	QUEUEDEBUG_LIST_INSERT_HEAD(head, elm, field)			\
-+	if ((head)->lh_first &&						\
-+	    (head)->lh_first->field.le_prev != &(head)->lh_first)	\
-+		QUEUEDEBUG_ABORT("LIST_INSERT_HEAD %p %s:%d", (head),	\
-+		    __FILE__, __LINE__);
-+#define	QUEUEDEBUG_LIST_OP(elm, field)					\
-+	if ((elm)->field.le_next &&					\
-+	    (elm)->field.le_next->field.le_prev !=			\
-+	    &(elm)->field.le_next)					\
-+		QUEUEDEBUG_ABORT("LIST_* forw %p %s:%d", (elm),		\
-+		    __FILE__, __LINE__);				\
-+	if (*(elm)->field.le_prev != (elm))				\
-+		QUEUEDEBUG_ABORT("LIST_* back %p %s:%d", (elm),		\
-+		    __FILE__, __LINE__);
-+#define	QUEUEDEBUG_LIST_POSTREMOVE(elm, field)				\
-+	(elm)->field.le_next = (void *)1L;				\
-+	(elm)->field.le_prev = (void *)1L;
-+#else
-+#define	QUEUEDEBUG_LIST_INSERT_HEAD(head, elm, field)
-+#define	QUEUEDEBUG_LIST_OP(elm, field)
-+#define	QUEUEDEBUG_LIST_POSTREMOVE(elm, field)
-+#endif
-+
-+#define	LIST_INIT(head) do {						\
-+	(head)->lh_first = LIST_END(head);				\
-+} while (/*CONSTCOND*/0)
-+
-+#define	LIST_INSERT_AFTER(listelm, elm, field) do {			\
-+	QUEUEDEBUG_LIST_OP((listelm), field)				\
-+	if (((elm)->field.le_next = (listelm)->field.le_next) != 	\
-+	    LIST_END(head))						\
-+		(listelm)->field.le_next->field.le_prev =		\
-+		    &(elm)->field.le_next;				\
-+	(listelm)->field.le_next = (elm);				\
-+	(elm)->field.le_prev = &(listelm)->field.le_next;		\
-+} while (/*CONSTCOND*/0)
-+
-+#define	LIST_INSERT_BEFORE(listelm, elm, field) do {			\
-+	QUEUEDEBUG_LIST_OP((listelm), field)				\
-+	(elm)->field.le_prev = (listelm)->field.le_prev;		\
-+	(elm)->field.le_next = (listelm);				\
-+	*(listelm)->field.le_prev = (elm);				\
-+	(listelm)->field.le_prev = &(elm)->field.le_next;		\
-+} while (/*CONSTCOND*/0)
-+
-+#define	LIST_INSERT_HEAD(head, elm, field) do {				\
-+	QUEUEDEBUG_LIST_INSERT_HEAD((head), (elm), field)		\
-+	if (((elm)->field.le_next = (head)->lh_first) != LIST_END(head))\
-+		(head)->lh_first->field.le_prev = &(elm)->field.le_next;\
-+	(head)->lh_first = (elm);					\
-+	(elm)->field.le_prev = &(head)->lh_first;			\
-+} while (/*CONSTCOND*/0)
-+
-+#define	LIST_REMOVE(elm, field) do {					\
-+	QUEUEDEBUG_LIST_OP((elm), field)				\
-+	if ((elm)->field.le_next != NULL)				\
-+		(elm)->field.le_next->field.le_prev = 			\
-+		    (elm)->field.le_prev;				\
-+	*(elm)->field.le_prev = (elm)->field.le_next;			\
-+	QUEUEDEBUG_LIST_POSTREMOVE((elm), field)			\
-+} while (/*CONSTCOND*/0)
-+
-+#define LIST_REPLACE(elm, elm2, field) do {				\
-+	if (((elm2)->field.le_next = (elm)->field.le_next) != NULL)	\
-+		(elm2)->field.le_next->field.le_prev =			\
-+		    &(elm2)->field.le_next;				\
-+	(elm2)->field.le_prev = (elm)->field.le_prev;			\
-+	*(elm2)->field.le_prev = (elm2);				\
-+	QUEUEDEBUG_LIST_POSTREMOVE((elm), field)			\
-+} while (/*CONSTCOND*/0)
-+
-+/*
-+ * Simple queue definitions.
-+ */
-+#define	SIMPLEQ_HEAD(name, type)					\
-+struct name {								\
-+	struct type *sqh_first;	/* first element */			\
-+	struct type **sqh_last;	/* addr of last next element */		\
-+}
-+
-+#define	SIMPLEQ_HEAD_INITIALIZER(head)					\
-+	{ NULL, &(head).sqh_first }
-+
-+#define	SIMPLEQ_ENTRY(type)						\
-+struct {								\
-+	struct type *sqe_next;	/* next element */			\
-+}
-+
-+/*
-+ * Simple queue access methods.
-+ */
-+#define	SIMPLEQ_FIRST(head)		((head)->sqh_first)
-+#define	SIMPLEQ_END(head)		NULL
-+#define	SIMPLEQ_EMPTY(head)		((head)->sqh_first == SIMPLEQ_END(head))
-+#define	SIMPLEQ_NEXT(elm, field)	((elm)->field.sqe_next)
-+
-+#define	SIMPLEQ_FOREACH(var, head, field)				\
-+	for ((var) = ((head)->sqh_first);				\
-+	    (var) != SIMPLEQ_END(head);					\
-+	    (var) = ((var)->field.sqe_next))
-+
-+#define	SIMPLEQ_FOREACH_SAFE(var, head, field, next)			\
-+	for ((var) = ((head)->sqh_first);				\
-+	    (var) != SIMPLEQ_END(head) &&				\
-+	    ((next = ((var)->field.sqe_next)), 1);			\
-+	    (var) = (next))
-+
-+/*
-+ * Simple queue functions.
-+ */
-+#define	SIMPLEQ_INIT(head) do {						\
-+	(head)->sqh_first = NULL;					\
-+	(head)->sqh_last = &(head)->sqh_first;				\
-+} while (/*CONSTCOND*/0)
-+
-+#define	SIMPLEQ_INSERT_HEAD(head, elm, field) do {			\
-+	if (((elm)->field.sqe_next = (head)->sqh_first) == NULL)	\
-+		(head)->sqh_last = &(elm)->field.sqe_next;		\
-+	(head)->sqh_first = (elm);					\
-+} while (/*CONSTCOND*/0)
-+
-+#define	SIMPLEQ_INSERT_TAIL(head, elm, field) do {			\
-+	(elm)->field.sqe_next = NULL;					\
-+	*(head)->sqh_last = (elm);					\
-+	(head)->sqh_last = &(elm)->field.sqe_next;			\
-+} while (/*CONSTCOND*/0)
-+
-+#define	SIMPLEQ_INSERT_AFTER(head, listelm, elm, field) do {		\
-+	if (((elm)->field.sqe_next = (listelm)->field.sqe_next) == NULL)\
-+		(head)->sqh_last = &(elm)->field.sqe_next;		\
-+	(listelm)->field.sqe_next = (elm);				\
-+} while (/*CONSTCOND*/0)
-+
-+#define	SIMPLEQ_REMOVE_HEAD(head, field) do {				\
-+	if (((head)->sqh_first = (head)->sqh_first->field.sqe_next) == NULL) \
-+		(head)->sqh_last = &(head)->sqh_first;			\
-+} while (/*CONSTCOND*/0)
-+
-+#define SIMPLEQ_REMOVE_AFTER(head, elm, field) do {			\
-+	if (((elm)->field.sqe_next = (elm)->field.sqe_next->field.sqe_next) \
-+	    == NULL)							\
-+		(head)->sqh_last = &(elm)->field.sqe_next;		\
-+} while (/*CONSTCOND*/0)
-+
-+#define	SIMPLEQ_REMOVE(head, elm, type, field) do {			\
-+	if ((head)->sqh_first == (elm)) {				\
-+		SIMPLEQ_REMOVE_HEAD((head), field);			\
-+	} else {							\
-+		struct type *curelm = (head)->sqh_first;		\
-+		while (curelm->field.sqe_next != (elm))			\
-+			curelm = curelm->field.sqe_next;		\
-+		if ((curelm->field.sqe_next =				\
-+			curelm->field.sqe_next->field.sqe_next) == NULL) \
-+			    (head)->sqh_last = &(curelm)->field.sqe_next; \
-+	}								\
-+} while (/*CONSTCOND*/0)
-+
-+#define	SIMPLEQ_CONCAT(head1, head2) do {				\
-+	if (!SIMPLEQ_EMPTY((head2))) {					\
-+		*(head1)->sqh_last = (head2)->sqh_first;		\
-+		(head1)->sqh_last = (head2)->sqh_last;		\
-+		SIMPLEQ_INIT((head2));					\
-+	}								\
-+} while (/*CONSTCOND*/0)
-+
-+#define	SIMPLEQ_LAST(head, type, field)					\
-+	(SIMPLEQ_EMPTY((head)) ?						\
-+		NULL :							\
-+	        ((struct type *)(void *)				\
-+		((char *)((head)->sqh_last) - offsetof(struct type, field))))
-+
-+/*
-+ * Tail queue definitions.
-+ */
-+#define	_TAILQ_HEAD(name, type, qual)					\
-+struct name {								\
-+	qual type *tqh_first;		/* first element */		\
-+	qual type *qual *tqh_last;	/* addr of last next element */	\
-+}
-+#define TAILQ_HEAD(name, type)	_TAILQ_HEAD(name, struct type,)
-+
-+#define	TAILQ_HEAD_INITIALIZER(head)					\
-+	{ TAILQ_END(head), &(head).tqh_first }
-+
-+#define	_TAILQ_ENTRY(type, qual)					\
-+struct {								\
-+	qual type *tqe_next;		/* next element */		\
-+	qual type *qual *tqe_prev;	/* address of previous next element */\
-+}
-+#define TAILQ_ENTRY(type)	_TAILQ_ENTRY(struct type,)
-+
-+/*
-+ * Tail queue access methods.
-+ */
-+#define	TAILQ_FIRST(head)		((head)->tqh_first)
-+#define	TAILQ_END(head)			(NULL)
-+#define	TAILQ_NEXT(elm, field)		((elm)->field.tqe_next)
-+#define	TAILQ_LAST(head, headname) \
-+	(*(((struct headname *)((head)->tqh_last))->tqh_last))
-+#define	TAILQ_PREV(elm, headname, field) \
-+	(*(((struct headname *)((elm)->field.tqe_prev))->tqh_last))
-+#define	TAILQ_EMPTY(head)		(TAILQ_FIRST(head) == TAILQ_END(head))
-+
-+
-+#define	TAILQ_FOREACH(var, head, field)					\
-+	for ((var) = ((head)->tqh_first);				\
-+	    (var) != TAILQ_END(head);					\
-+	    (var) = ((var)->field.tqe_next))
-+
-+#define	TAILQ_FOREACH_SAFE(var, head, field, next)			\
-+	for ((var) = ((head)->tqh_first);				\
-+	    (var) != TAILQ_END(head) &&					\
-+	    ((next) = TAILQ_NEXT(var, field), 1); (var) = (next))
-+
-+#define	TAILQ_FOREACH_REVERSE(var, head, headname, field)		\
-+	for ((var) = (*(((struct headname *)((head)->tqh_last))->tqh_last));\
-+	    (var) != TAILQ_END(head);					\
-+	    (var) = (*(((struct headname *)((var)->field.tqe_prev))->tqh_last)))
-+
-+#define	TAILQ_FOREACH_REVERSE_SAFE(var, head, headname, field, prev)	\
-+	for ((var) = TAILQ_LAST((head), headname);			\
-+	    (var) != TAILQ_END(head) && 				\
-+	    ((prev) = TAILQ_PREV((var), headname, field), 1); (var) = (prev))
-+
-+/*
-+ * Tail queue functions.
-+ */
-+#if defined(QUEUEDEBUG)
-+#define	QUEUEDEBUG_TAILQ_INSERT_HEAD(head, elm, field)			\
-+	if ((head)->tqh_first &&					\
-+	    (head)->tqh_first->field.tqe_prev != &(head)->tqh_first)	\
-+		QUEUEDEBUG_ABORT("TAILQ_INSERT_HEAD %p %s:%d", (head),	\
-+		    __FILE__, __LINE__);
-+#define	QUEUEDEBUG_TAILQ_INSERT_TAIL(head, elm, field)			\
-+	if (*(head)->tqh_last != NULL)					\
-+		QUEUEDEBUG_ABORT("TAILQ_INSERT_TAIL %p %s:%d", (head),	\
-+		    __FILE__, __LINE__);
-+#define	QUEUEDEBUG_TAILQ_OP(elm, field)					\
-+	if ((elm)->field.tqe_next &&					\
-+	    (elm)->field.tqe_next->field.tqe_prev !=			\
-+	    &(elm)->field.tqe_next)					\
-+		QUEUEDEBUG_ABORT("TAILQ_* forw %p %s:%d", (elm),	\
-+		    __FILE__, __LINE__);				\
-+	if (*(elm)->field.tqe_prev != (elm))				\
-+		QUEUEDEBUG_ABORT("TAILQ_* back %p %s:%d", (elm),	\
-+		    __FILE__, __LINE__);
-+#define	QUEUEDEBUG_TAILQ_PREREMOVE(head, elm, field)			\
-+	if ((elm)->field.tqe_next == NULL &&				\
-+	    (head)->tqh_last != &(elm)->field.tqe_next)			\
-+		QUEUEDEBUG_ABORT("TAILQ_PREREMOVE head %p elm %p %s:%d",\
-+		    (head), (elm), __FILE__, __LINE__);
-+#define	QUEUEDEBUG_TAILQ_POSTREMOVE(elm, field)				\
-+	(elm)->field.tqe_next = (void *)1L;				\
-+	(elm)->field.tqe_prev = (void *)1L;
-+#else
-+#define	QUEUEDEBUG_TAILQ_INSERT_HEAD(head, elm, field)
-+#define	QUEUEDEBUG_TAILQ_INSERT_TAIL(head, elm, field)
-+#define	QUEUEDEBUG_TAILQ_OP(elm, field)
-+#define	QUEUEDEBUG_TAILQ_PREREMOVE(head, elm, field)
-+#define	QUEUEDEBUG_TAILQ_POSTREMOVE(elm, field)
-+#endif
-+
-+#define	TAILQ_INIT(head) do {						\
-+	(head)->tqh_first = TAILQ_END(head);				\
-+	(head)->tqh_last = &(head)->tqh_first;				\
-+} while (/*CONSTCOND*/0)
-+
-+#define	TAILQ_INSERT_HEAD(head, elm, field) do {			\
-+	QUEUEDEBUG_TAILQ_INSERT_HEAD((head), (elm), field)		\
-+	if (((elm)->field.tqe_next = (head)->tqh_first) != TAILQ_END(head))\
-+		(head)->tqh_first->field.tqe_prev =			\
-+		    &(elm)->field.tqe_next;				\
-+	else								\
-+		(head)->tqh_last = &(elm)->field.tqe_next;		\
-+	(head)->tqh_first = (elm);					\
-+	(elm)->field.tqe_prev = &(head)->tqh_first;			\
-+} while (/*CONSTCOND*/0)
-+
-+#define	TAILQ_INSERT_TAIL(head, elm, field) do {			\
-+	QUEUEDEBUG_TAILQ_INSERT_TAIL((head), (elm), field)		\
-+	(elm)->field.tqe_next = TAILQ_END(head);			\
-+	(elm)->field.tqe_prev = (head)->tqh_last;			\
-+	*(head)->tqh_last = (elm);					\
-+	(head)->tqh_last = &(elm)->field.tqe_next;			\
-+} while (/*CONSTCOND*/0)
-+
-+#define	TAILQ_INSERT_AFTER(head, listelm, elm, field) do {		\
-+	QUEUEDEBUG_TAILQ_OP((listelm), field)				\
-+	if (((elm)->field.tqe_next = (listelm)->field.tqe_next) != 	\
-+	    TAILQ_END(head))						\
-+		(elm)->field.tqe_next->field.tqe_prev = 		\
-+		    &(elm)->field.tqe_next;				\
-+	else								\
-+		(head)->tqh_last = &(elm)->field.tqe_next;		\
-+	(listelm)->field.tqe_next = (elm);				\
-+	(elm)->field.tqe_prev = &(listelm)->field.tqe_next;		\
-+} while (/*CONSTCOND*/0)
-+
-+#define	TAILQ_INSERT_BEFORE(listelm, elm, field) do {			\
-+	QUEUEDEBUG_TAILQ_OP((listelm), field)				\
-+	(elm)->field.tqe_prev = (listelm)->field.tqe_prev;		\
-+	(elm)->field.tqe_next = (listelm);				\
-+	*(listelm)->field.tqe_prev = (elm);				\
-+	(listelm)->field.tqe_prev = &(elm)->field.tqe_next;		\
-+} while (/*CONSTCOND*/0)
-+
-+#define	TAILQ_REMOVE(head, elm, field) do {				\
-+	QUEUEDEBUG_TAILQ_PREREMOVE((head), (elm), field)		\
-+	QUEUEDEBUG_TAILQ_OP((elm), field)				\
-+	if (((elm)->field.tqe_next) != TAILQ_END(head))			\
-+		(elm)->field.tqe_next->field.tqe_prev = 		\
-+		    (elm)->field.tqe_prev;				\
-+	else								\
-+		(head)->tqh_last = (elm)->field.tqe_prev;		\
-+	*(elm)->field.tqe_prev = (elm)->field.tqe_next;			\
-+	QUEUEDEBUG_TAILQ_POSTREMOVE((elm), field);			\
-+} while (/*CONSTCOND*/0)
-+
-+#define TAILQ_REPLACE(head, elm, elm2, field) do {			\
-+        if (((elm2)->field.tqe_next = (elm)->field.tqe_next) != 	\
-+	    TAILQ_END(head))   						\
-+                (elm2)->field.tqe_next->field.tqe_prev =		\
-+                    &(elm2)->field.tqe_next;				\
-+        else								\
-+                (head)->tqh_last = &(elm2)->field.tqe_next;		\
-+        (elm2)->field.tqe_prev = (elm)->field.tqe_prev;			\
-+        *(elm2)->field.tqe_prev = (elm2);				\
-+	QUEUEDEBUG_TAILQ_POSTREMOVE((elm), field);			\
-+} while (/*CONSTCOND*/0)
-+
-+#define	TAILQ_CONCAT(head1, head2, field) do {				\
-+	if (!TAILQ_EMPTY(head2)) {					\
-+		*(head1)->tqh_last = (head2)->tqh_first;		\
-+		(head2)->tqh_first->field.tqe_prev = (head1)->tqh_last;	\
-+		(head1)->tqh_last = (head2)->tqh_last;			\
-+		TAILQ_INIT((head2));					\
-+	}								\
-+} while (/*CONSTCOND*/0)
-+
-+/*
-+ * Singly-linked Tail queue declarations.
-+ */
-+#define	STAILQ_HEAD(name, type)						\
-+struct name {								\
-+	struct type *stqh_first;	/* first element */		\
-+	struct type **stqh_last;	/* addr of last next element */	\
-+}
-+
-+#define	STAILQ_HEAD_INITIALIZER(head)					\
-+	{ NULL, &(head).stqh_first }
-+
-+#define	STAILQ_ENTRY(type)						\
-+struct {								\
-+	struct type *stqe_next;	/* next element */			\
-+}
-+
-+/*
-+ * Singly-linked Tail queue access methods.
-+ */
-+#define	STAILQ_FIRST(head)	((head)->stqh_first)
-+#define	STAILQ_END(head)	NULL
-+#define	STAILQ_NEXT(elm, field)	((elm)->field.stqe_next)
-+#define	STAILQ_EMPTY(head)	(STAILQ_FIRST(head) == STAILQ_END(head))
-+
-+/*
-+ * Singly-linked Tail queue functions.
-+ */
-+#define	STAILQ_INIT(head) do {						\
-+	(head)->stqh_first = NULL;					\
-+	(head)->stqh_last = &(head)->stqh_first;				\
-+} while (/*CONSTCOND*/0)
-+
-+#define	STAILQ_INSERT_HEAD(head, elm, field) do {			\
-+	if (((elm)->field.stqe_next = (head)->stqh_first) == NULL)	\
-+		(head)->stqh_last = &(elm)->field.stqe_next;		\
-+	(head)->stqh_first = (elm);					\
-+} while (/*CONSTCOND*/0)
-+
-+#define	STAILQ_INSERT_TAIL(head, elm, field) do {			\
-+	(elm)->field.stqe_next = NULL;					\
-+	*(head)->stqh_last = (elm);					\
-+	(head)->stqh_last = &(elm)->field.stqe_next;			\
-+} while (/*CONSTCOND*/0)
-+
-+#define	STAILQ_INSERT_AFTER(head, listelm, elm, field) do {		\
-+	if (((elm)->field.stqe_next = (listelm)->field.stqe_next) == NULL)\
-+		(head)->stqh_last = &(elm)->field.stqe_next;		\
-+	(listelm)->field.stqe_next = (elm);				\
-+} while (/*CONSTCOND*/0)
-+
-+#define	STAILQ_REMOVE_HEAD(head, field) do {				\
-+	if (((head)->stqh_first = (head)->stqh_first->field.stqe_next) == NULL) \
-+		(head)->stqh_last = &(head)->stqh_first;			\
-+} while (/*CONSTCOND*/0)
-+
-+#define	STAILQ_REMOVE(head, elm, type, field) do {			\
-+	if ((head)->stqh_first == (elm)) {				\
-+		STAILQ_REMOVE_HEAD((head), field);			\
-+	} else {							\
-+		struct type *curelm = (head)->stqh_first;		\
-+		while (curelm->field.stqe_next != (elm))			\
-+			curelm = curelm->field.stqe_next;		\
-+		if ((curelm->field.stqe_next =				\
-+			curelm->field.stqe_next->field.stqe_next) == NULL) \
-+			    (head)->stqh_last = &(curelm)->field.stqe_next; \
-+	}								\
-+} while (/*CONSTCOND*/0)
-+
-+#define	STAILQ_FOREACH(var, head, field)				\
-+	for ((var) = ((head)->stqh_first);				\
-+		(var);							\
-+		(var) = ((var)->field.stqe_next))
-+
-+#define	STAILQ_FOREACH_SAFE(var, head, field, tvar)			\
-+	for ((var) = STAILQ_FIRST((head));				\
-+	    (var) && ((tvar) = STAILQ_NEXT((var), field), 1);		\
-+	    (var) = (tvar))
-+
-+#define	STAILQ_CONCAT(head1, head2) do {				\
-+	if (!STAILQ_EMPTY((head2))) {					\
-+		*(head1)->stqh_last = (head2)->stqh_first;		\
-+		(head1)->stqh_last = (head2)->stqh_last;		\
-+		STAILQ_INIT((head2));					\
-+	}								\
-+} while (/*CONSTCOND*/0)
-+
-+#define	STAILQ_LAST(head, type, field)					\
-+	(STAILQ_EMPTY((head)) ?						\
-+		NULL :							\
-+	        ((struct type *)(void *)				\
-+		((char *)((head)->stqh_last) - offsetof(struct type, field))))
-+
-+
-+#ifndef _KERNEL
-+/*
-+ * Circular queue definitions. Do not use. We still keep the macros
-+ * for compatibility but because of pointer aliasing issues their use
-+ * is discouraged!
-+ */
-+
-+/*
-+ * __launder_type():  We use this ugly hack to work around the the compiler
-+ * noticing that two types may not alias each other and elide tests in code.
-+ * We hit this in the CIRCLEQ macros when comparing 'struct name *' and
-+ * 'struct type *' (see CIRCLEQ_HEAD()).  Modern compilers (such as GCC
-+ * 4.8) declare these comparisons as always false, causing the code to
-+ * not run as designed.
-+ *
-+ * This hack is only to be used for comparisons and thus can be fully const.
-+ * Do not use for assignment.
-+ *
-+ * If we ever choose to change the ABI of the CIRCLEQ macros, we could fix
-+ * this by changing the head/tail sentinal values, but see the note above
-+ * this one.
-+ */
-+static __inline const void * __launder_type(const void *);
-+static __inline const void *
-+__launder_type(const void *__x)
-+{
-+	__asm __volatile("" : "+r" (__x));
-+	return __x;
-+}
-+
-+#if defined(QUEUEDEBUG)
-+#define QUEUEDEBUG_CIRCLEQ_HEAD(head, field)				\
-+	if ((head)->cqh_first != CIRCLEQ_ENDC(head) &&			\
-+	    (head)->cqh_first->field.cqe_prev != CIRCLEQ_ENDC(head))	\
-+		QUEUEDEBUG_ABORT("CIRCLEQ head forw %p %s:%d", (head),	\
-+		      __FILE__, __LINE__);				\
-+	if ((head)->cqh_last != CIRCLEQ_ENDC(head) &&			\
-+	    (head)->cqh_last->field.cqe_next != CIRCLEQ_ENDC(head))	\
-+		QUEUEDEBUG_ABORT("CIRCLEQ head back %p %s:%d", (head),	\
-+		      __FILE__, __LINE__);
-+#define QUEUEDEBUG_CIRCLEQ_ELM(head, elm, field)			\
-+	if ((elm)->field.cqe_next == CIRCLEQ_ENDC(head)) {		\
-+		if ((head)->cqh_last != (elm))				\
-+			QUEUEDEBUG_ABORT("CIRCLEQ elm last %p %s:%d",	\
-+			    (elm), __FILE__, __LINE__);			\
-+	} else {							\
-+		if ((elm)->field.cqe_next->field.cqe_prev != (elm))	\
-+			QUEUEDEBUG_ABORT("CIRCLEQ elm forw %p %s:%d",	\
-+			    (elm), __FILE__, __LINE__);			\
-+	}								\
-+	if ((elm)->field.cqe_prev == CIRCLEQ_ENDC(head)) {		\
-+		if ((head)->cqh_first != (elm))				\
-+			QUEUEDEBUG_ABORT("CIRCLEQ elm first %p %s:%d",	\
-+			    (elm), __FILE__, __LINE__);			\
-+	} else {							\
-+		if ((elm)->field.cqe_prev->field.cqe_next != (elm))	\
-+			QUEUEDEBUG_ABORT("CIRCLEQ elm prev %p %s:%d",	\
-+			    (elm), __FILE__, __LINE__);			\
-+	}
-+#define QUEUEDEBUG_CIRCLEQ_POSTREMOVE(elm, field)			\
-+	(elm)->field.cqe_next = (void *)1L;				\
-+	(elm)->field.cqe_prev = (void *)1L;
-+#else
-+#define QUEUEDEBUG_CIRCLEQ_HEAD(head, field)
-+#define QUEUEDEBUG_CIRCLEQ_ELM(head, elm, field)
-+#define QUEUEDEBUG_CIRCLEQ_POSTREMOVE(elm, field)
-+#endif
-+
-+#define	CIRCLEQ_HEAD(name, type)					\
-+struct name {								\
-+	struct type *cqh_first;		/* first element */		\
-+	struct type *cqh_last;		/* last element */		\
-+}
-+
-+#define	CIRCLEQ_HEAD_INITIALIZER(head)					\
-+	{ CIRCLEQ_END(&head), CIRCLEQ_END(&head) }
-+
-+#define	CIRCLEQ_ENTRY(type)						\
-+struct {								\
-+	struct type *cqe_next;		/* next element */		\
-+	struct type *cqe_prev;		/* previous element */		\
-+}
-+
-+/*
-+ * Circular queue functions.
-+ */
-+#define	CIRCLEQ_INIT(head) do {						\
-+	(head)->cqh_first = CIRCLEQ_END(head);				\
-+	(head)->cqh_last = CIRCLEQ_END(head);				\
-+} while (/*CONSTCOND*/0)
-+
-+#define	CIRCLEQ_INSERT_AFTER(head, listelm, elm, field) do {		\
-+	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
-+	QUEUEDEBUG_CIRCLEQ_ELM((head), (listelm), field)		\
-+	(elm)->field.cqe_next = (listelm)->field.cqe_next;		\
-+	(elm)->field.cqe_prev = (listelm);				\
-+	if ((listelm)->field.cqe_next == CIRCLEQ_ENDC(head))		\
-+		(head)->cqh_last = (elm);				\
-+	else								\
-+		(listelm)->field.cqe_next->field.cqe_prev = (elm);	\
-+	(listelm)->field.cqe_next = (elm);				\
-+} while (/*CONSTCOND*/0)
-+
-+#define	CIRCLEQ_INSERT_BEFORE(head, listelm, elm, field) do {		\
-+	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
-+	QUEUEDEBUG_CIRCLEQ_ELM((head), (listelm), field)		\
-+	(elm)->field.cqe_next = (listelm);				\
-+	(elm)->field.cqe_prev = (listelm)->field.cqe_prev;		\
-+	if ((listelm)->field.cqe_prev == CIRCLEQ_ENDC(head))		\
-+		(head)->cqh_first = (elm);				\
-+	else								\
-+		(listelm)->field.cqe_prev->field.cqe_next = (elm);	\
-+	(listelm)->field.cqe_prev = (elm);				\
-+} while (/*CONSTCOND*/0)
-+
-+#define	CIRCLEQ_INSERT_HEAD(head, elm, field) do {			\
-+	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
-+	(elm)->field.cqe_next = (head)->cqh_first;			\
-+	(elm)->field.cqe_prev = CIRCLEQ_END(head);			\
-+	if ((head)->cqh_last == CIRCLEQ_ENDC(head))			\
-+		(head)->cqh_last = (elm);				\
-+	else								\
-+		(head)->cqh_first->field.cqe_prev = (elm);		\
-+	(head)->cqh_first = (elm);					\
-+} while (/*CONSTCOND*/0)
-+
-+#define	CIRCLEQ_INSERT_TAIL(head, elm, field) do {			\
-+	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
-+	(elm)->field.cqe_next = CIRCLEQ_END(head);			\
-+	(elm)->field.cqe_prev = (head)->cqh_last;			\
-+	if ((head)->cqh_first == CIRCLEQ_ENDC(head))			\
-+		(head)->cqh_first = (elm);				\
-+	else								\
-+		(head)->cqh_last->field.cqe_next = (elm);		\
-+	(head)->cqh_last = (elm);					\
-+} while (/*CONSTCOND*/0)
-+
-+#define	CIRCLEQ_REMOVE(head, elm, field) do {				\
-+	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
-+	QUEUEDEBUG_CIRCLEQ_ELM((head), (elm), field)			\
-+	if ((elm)->field.cqe_next == CIRCLEQ_ENDC(head))		\
-+		(head)->cqh_last = (elm)->field.cqe_prev;		\
-+	else								\
-+		(elm)->field.cqe_next->field.cqe_prev =			\
-+		    (elm)->field.cqe_prev;				\
-+	if ((elm)->field.cqe_prev == CIRCLEQ_ENDC(head))		\
-+		(head)->cqh_first = (elm)->field.cqe_next;		\
-+	else								\
-+		(elm)->field.cqe_prev->field.cqe_next =			\
-+		    (elm)->field.cqe_next;				\
-+	QUEUEDEBUG_CIRCLEQ_POSTREMOVE((elm), field)			\
-+} while (/*CONSTCOND*/0)
-+
-+#define	CIRCLEQ_FOREACH(var, head, field)				\
-+	for ((var) = ((head)->cqh_first);				\
-+		(var) != CIRCLEQ_ENDC(head);				\
-+		(var) = ((var)->field.cqe_next))
-+
-+#define	CIRCLEQ_FOREACH_REVERSE(var, head, field)			\
-+	for ((var) = ((head)->cqh_last);				\
-+		(var) != CIRCLEQ_ENDC(head);				\
-+		(var) = ((var)->field.cqe_prev))
-+
-+/*
-+ * Circular queue access methods.
-+ */
-+#define	CIRCLEQ_FIRST(head)		((head)->cqh_first)
-+#define	CIRCLEQ_LAST(head)		((head)->cqh_last)
-+/* For comparisons */
-+#define	CIRCLEQ_ENDC(head)		(__launder_type(head))
-+/* For assignments */
-+#define	CIRCLEQ_END(head)		((void *)(head))
-+#define	CIRCLEQ_NEXT(elm, field)	((elm)->field.cqe_next)
-+#define	CIRCLEQ_PREV(elm, field)	((elm)->field.cqe_prev)
-+#define	CIRCLEQ_EMPTY(head)						\
-+    (CIRCLEQ_FIRST(head) == CIRCLEQ_ENDC(head))
-+
-+#define CIRCLEQ_LOOP_NEXT(head, elm, field)				\
-+	(((elm)->field.cqe_next == CIRCLEQ_ENDC(head))			\
-+	    ? ((head)->cqh_first)					\
-+	    : (elm->field.cqe_next))
-+#define CIRCLEQ_LOOP_PREV(head, elm, field)				\
-+	(((elm)->field.cqe_prev == CIRCLEQ_ENDC(head))			\
-+	    ? ((head)->cqh_last)					\
-+	    : (elm->field.cqe_prev))
-+#endif /* !_KERNEL */
-+
-+#endif	/* !_SYS_QUEUE_H_ */
diff --git a/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch b/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
deleted file mode 100644
index d7f4968669..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From e51d67549b516b2dac6c71d92c8499f6e67125ad Mon Sep 17 00:00:00 2001
-From: Thorsten Kukuk <kukuk@thkukuk.de>
-Date: Tue, 14 Nov 2017 10:43:53 -0500
-Subject: [PATCH] Fix typo in src/libtirpc.map
-
-Which prevents that key_secretkey_is_set will be exported.
-
-Signed-off-by: Thorsten Kukuk <kukuk@suse.de>
-Signed-off-by: Steve Dickson <steved@redhat.com>
----
- src/libtirpc.map | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libtirpc.map b/src/libtirpc.map
-index f385de5..21d6065 100644
---- a/src/libtirpc.map
-+++ b/src/libtirpc.map
-@@ -298,7 +298,7 @@ TIRPC_0.3.2 {
-     key_gendes;
-     key_get_conv;
-     key_setsecret;
--    key_secret_is_set;
-+    key_secretkey_is_set;
-     key_setnet;
-     netname2host;
-     netname2user;
--- 
-1.8.3.1
diff --git a/meta/recipes-extended/libtirpc/libtirpc/libtirpc-1.0.4-rc1.patch b/meta/recipes-extended/libtirpc/libtirpc/libtirpc-1.0.4-rc1.patch
new file mode 100644
index 0000000000..6d40d3cce8
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/libtirpc-1.0.4-rc1.patch
@@ -0,0 +1,103 @@
+Patch from Fedora https://src.fedoraproject.org/rpms/libtirpc/raw/master/f/libtirpc-1.0.4-rc1.patch
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff --git a/src/clnt_generic.c b/src/clnt_generic.c
+index e5a314f..3f3dabf 100644
+--- a/src/clnt_generic.c
++++ b/src/clnt_generic.c
+@@ -47,7 +47,6 @@
+ 
+ extern bool_t __rpc_is_local_host(const char *);
+ int __rpc_raise_fd(int);
+-extern int __binddynport(int fd);
+ 
+ #ifndef NETIDLEN
+ #define	NETIDLEN 32
+@@ -341,8 +340,7 @@ clnt_tli_create(int fd, const struct netconfig *nconf,
+ 		servtype = nconf->nc_semantics;
+ 		if (!__rpc_fd2sockinfo(fd, &si))
+ 			goto err;
+-		if (__binddynport(fd) == -1)
+-			goto err;
++		bindresvport(fd, NULL);
+ 	} else {
+ 		if (!__rpc_fd2sockinfo(fd, &si))
+ 			goto err;
+diff --git a/src/rpc_soc.c b/src/rpc_soc.c
+index af6c482..5a6eeb7 100644
+--- a/src/rpc_soc.c
++++ b/src/rpc_soc.c
+@@ -67,8 +67,6 @@
+ 
+ extern mutex_t	rpcsoc_lock;
+ 
+-extern int __binddynport(int fd);
+-
+ static CLIENT *clnt_com_create(struct sockaddr_in *, rpcprog_t, rpcvers_t,
+     int *, u_int, u_int, char *, int);
+ static SVCXPRT *svc_com_create(int, u_int, u_int, char *);
+@@ -147,8 +145,7 @@ clnt_com_create(raddr, prog, vers, sockp, sendsz, recvsz, tp, flags)
+ 	bindaddr.maxlen = bindaddr.len =  sizeof (struct sockaddr_in);
+ 	bindaddr.buf = raddr;
+ 
+-	if (__binddynport(fd) == -1)
+-		goto err;
++	bindresvport(fd, NULL);
+ 	cl = clnt_tli_create(fd, nconf, &bindaddr, prog, vers,
+ 				sendsz, recvsz);
+ 	if (cl) {
+diff --git a/src/rpcb_clnt.c b/src/rpcb_clnt.c
+index a94fc73..4b44364 100644
+--- a/src/rpcb_clnt.c
++++ b/src/rpcb_clnt.c
+@@ -752,7 +752,7 @@ __try_protocol_version_2(program, version, nconf, host, tp)
+ 
+ 	client = getpmaphandle(nconf, host, &parms.r_addr);
+ 	if (client == NULL)
+-		return (NULL);
++		goto error;
+ 
+ 	/*
+ 	 * Set retry timeout.
+@@ -771,11 +771,11 @@ __try_protocol_version_2(program, version, nconf, host, tp)
+ 	if (clnt_st != RPC_SUCCESS) {
+ 		rpc_createerr.cf_stat = RPC_PMAPFAILURE;
+ 		clnt_geterr(client, &rpc_createerr.cf_error);
+-		return (NULL);
++		goto error;
+ 	} else if (port == 0) {
+ 		pmapaddress = NULL;
+ 		rpc_createerr.cf_stat = RPC_PROGNOTREGISTERED;
+-		return (NULL);
++		goto error;
+ 	}
+ 	port = htons(port);
+ 	CLNT_CONTROL(client, CLGET_SVC_ADDR, (char *)&remote);
+@@ -789,14 +789,24 @@ __try_protocol_version_2(program, version, nconf, host, tp)
+ 			free(pmapaddress);
+ 			pmapaddress = NULL;
+ 		}
+-		return (NULL);
++		goto error;
+ 	}
+ 	memcpy(pmapaddress->buf, remote.buf, remote.len);
+ 	memcpy(&((char *)pmapaddress->buf)[sizeof (short)],
+ 			(char *)(void *)&port, sizeof (short));
+ 	pmapaddress->len = pmapaddress->maxlen = remote.len;
+ 
++	CLNT_DESTROY(client);
+ 	return pmapaddress;
++
++error:
++	if (client) {
++		CLNT_DESTROY(client);
++		client = NULL;
++
++	}
++	return (NULL);
++
+ }
+ #endif
+ 
diff --git a/meta/recipes-extended/libtirpc/libtirpc/musl.patch b/meta/recipes-extended/libtirpc/libtirpc/musl.patch
new file mode 100644
index 0000000000..0c3ce603ea
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/musl.patch
@@ -0,0 +1,18 @@
+Consider musl provided built-in defines
+
+Helps compile libtirpc with musl
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- ./tirpc/rpc/types.h.orig	2018-03-17 10:23:10.022055255 +0100
++++ ./tirpc/rpc/types.h	2018-03-17 10:23:30.877751656 +0100
+@@ -66,7 +66,7 @@
+ #define mem_free(ptr, bsize)	free(ptr)
+ 
+ 
+-#if defined __APPLE_CC__ || defined __FreeBSD__
++#if defined __APPLE_CC__ || defined __FreeBSD__ || !defined(__GLIBC__)
+ # define __u_char_defined
+ # define __daddr_t_defined
+ #endif
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.3.bb
similarity index 63%
rename from meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.0.3.bb
index 99212600e0..17bc038d67 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.3.bb
@@ -10,17 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 PROVIDES = "virtual/librpc"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
-           file://export_key_secretkey_is_set.patch \
-           file://0001-replace-__bzero-with-memset-API.patch \
-           file://0001-include-stdint.h-for-uintptr_t.patch \
+           file://libtirpc-1.0.4-rc1.patch \
+           file://musl.patch \
            "
 
-SRC_URI_append_libc-musl = " \
-                             file://Use-netbsd-queue.h.patch \
-                           "
-
-SRC_URI[md5sum] = "d5a37f1dccec484f9cabe2b97e54e9a6"
-SRC_URI[sha256sum] = "723c5ce92706cbb601a8db09110df1b4b69391643158f20ff587e20e7c5f90f5"
+SRC_URI[md5sum] = "f8403a10695348854e71d525c4db5931"
+SRC_URI[sha256sum] = "86c3a78fc1bddefa96111dd233124c703b22a78884203c55c3e06b3be6a0fd5e"
 
 inherit autotools pkgconfig
 
-- 
2.17.0


