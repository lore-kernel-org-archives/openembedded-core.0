Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.51500.1595840441557386158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 02:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=OFysa39p;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id s16so1122486ljc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 02:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z5VW6zeQlaHyMhWVjxv8tKEWrIYov878zC4VBTopw4Q=;
        b=OFysa39p4DUQnwtc0GPRV/Tuahn+uLYROmWpwbMFLH2pY0jIgByhvmx+pNTMBVuK/p
         TB0VNQegnmUm2HMnA1C8b1jGpo2c196Y5hFq1L+qW08pRU/utguy/Jgd4h79sovQsT97
         CWcDQnCC/UFjZTrNkevpvILiBsxSPcUnoPPG8UCwzOqHxOvSt21N4YeDhKs0FdLNJY+u
         x90kwra6G2SqoLdIMOyBzKuP8Oj/p8qc8FYbuiOvDAy13sAwQhW4MmItSqyysG8avCrL
         KOFC2+Rp5XGZqciPICBoMwG+6IMtrzQo5lU8+wMIWug61vAWdBg1l9Dvxxaft1lkXnf2
         3Tyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z5VW6zeQlaHyMhWVjxv8tKEWrIYov878zC4VBTopw4Q=;
        b=HtdZ8v65JvP0zoX0AlrJ3ZzVYnUQB381CbBqwEpi69yRcWjfYPB6wWHNDVbKY2KxeG
         KJU9iYO1Wevyyz2WXRq3KWHnsELxYth6ehAiPptr93YdioWm2DEGJ/v78QgbSyBpKCAF
         YuF7Bfy3YEnAh+Ed5nr9i5KNjXZL5/zeTxLJZYbozaiccW0DfAfxmAPKFKEccaDWJZve
         PF8KmyhrJOAYxE5ORSGE3v9O7Zkxf8RmDznTT6ms9xmTZpS8k4+NRfuKsU76Ef4g6GRe
         P4YAIfw2e5/7NHRofApY1AF0SxN6TuRpXwDlFO+ZaDzNKIaXSL5irRHTVQv23nrL2kY9
         FuqA==
X-Gm-Message-State: AOAM531HaekBsSSpIeqhwp5rcG7NbPf3RLRXg7kjDnW0cfQ6O5jtONO+
	cvo4YxEFx0NPOztvyeSpB7+7K/fOc6Q=
X-Google-Smtp-Source: ABdhPJzbWlzygKHGzhGvT0U5q51NRjWSC0I0nI2jTRPAJiV/IB1ftvh3He06WJFcdhpyfso609cedA==
X-Received: by 2002:a2e:9557:: with SMTP id t23mr784347ljh.193.1595840438416;
        Mon, 27 Jul 2020 02:00:38 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id k13sm528278lfg.75.2020.07.27.02.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 02:00:37 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] json-c: update to 0.15
Date: Mon, 27 Jul 2020 11:00:35 +0200
Message-Id: <20200727090035.2053346-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove upstreamed patch.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../json-c/json-c/CVE-2020-12762.patch        | 160 ------------------
 .../json-c/{json-c_0.14.bb => json-c_0.15.bb} |   6 +-
 2 files changed, 2 insertions(+), 164 deletions(-)
 delete mode 100644 meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch
 rename meta/recipes-devtools/json-c/{json-c_0.14.bb => json-c_0.15.bb} (80%)

diff --git a/meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch b/meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch
deleted file mode 100644
index a45cfb61bc..0000000000
--- a/meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From 099016b7e8d70a6d5dd814e788bba08d33d48426 Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Mon, 4 May 2020 19:41:16 +0200
-Subject: [PATCH 1/3] Protect array_list_del_idx against size_t overflow.
-
-If the assignment of stop overflows due to idx and count being
-larger than SIZE_T_MAX in sum, out of boundary access could happen.
-
-It takes invalid usage of this function for this to happen, but
-I decided to add this check so array_list_del_idx is as safe against
-bad usage as the other arraylist functions.
-
-Upstream-Status: Backport [https://github.com/json-c/json-c/commit/31243e4d1204ef78be34b0fcae73221eee6b83be]
-CVE: CVE-2020-12762
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
-
----
- arraylist.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/arraylist.c b/arraylist.c
-index 12ad8af6d3..e5524aca75 100644
---- a/arraylist.c
-+++ b/arraylist.c
-@@ -136,6 +136,9 @@ int array_list_del_idx(struct array_list *arr, size_t idx, size_t count)
- {
- 	size_t i, stop;
- 
-+	/* Avoid overflow in calculation with large indices. */
-+	if (idx > SIZE_T_MAX - count)
-+		return -1;
- 	stop = idx + count;
- 	if (idx >= arr->length || stop > arr->length)
- 		return -1;
-
-From 77d935b7ae7871a1940cd827e850e6063044ec45 Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Mon, 4 May 2020 19:46:45 +0200
-Subject: [PATCH 2/3] Prevent division by zero in linkhash.
-
-If a linkhash with a size of zero is created, then modulo operations
-are prone to division by zero operations.
-
-Purely protective measure against bad usage.
----
- linkhash.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/linkhash.c b/linkhash.c
-index 7ea58c0abf..f05cc38030 100644
---- a/linkhash.c
-+++ b/linkhash.c
-@@ -12,6 +12,7 @@
- 
- #include "config.h"
- 
-+#include <assert.h>
- #include <limits.h>
- #include <stdarg.h>
- #include <stddef.h>
-@@ -499,6 +500,8 @@ struct lh_table *lh_table_new(int size, lh_entry_free_fn *free_fn, lh_hash_fn *h
- 	int i;
- 	struct lh_table *t;
- 
-+	/* Allocate space for elements to avoid divisions by zero. */
-+	assert(size > 0);
- 	t = (struct lh_table *)calloc(1, sizeof(struct lh_table));
- 	if (!t)
- 		return NULL;
-
-From d07b91014986900a3a75f306d302e13e005e9d67 Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Mon, 4 May 2020 19:47:25 +0200
-Subject: [PATCH 3/3] Fix integer overflows.
-
-The data structures linkhash and printbuf are limited to 2 GB in size
-due to a signed integer being used to track their current size.
-
-If too much data is added, then size variable can overflow, which is
-an undefined behaviour in C programming language.
-
-Assuming that a signed int overflow just leads to a negative value,
-like it happens on many sytems (Linux i686/amd64 with gcc), then
-printbuf is vulnerable to an out of boundary write on 64 bit systems.
----
- linkhash.c |  7 +++++--
- printbuf.c | 19 ++++++++++++++++---
- 2 files changed, 21 insertions(+), 5 deletions(-)
-
-diff --git a/linkhash.c b/linkhash.c
-index f05cc38030..51e90b13a2 100644
---- a/linkhash.c
-+++ b/linkhash.c
-@@ -580,9 +580,12 @@ int lh_table_insert_w_hash(struct lh_table *t, const void *k, const void *v, con
- {
- 	unsigned long n;
- 
--	if (t->count >= t->size * LH_LOAD_FACTOR)
--		if (lh_table_resize(t, t->size * 2) != 0)
-+	if (t->count >= t->size * LH_LOAD_FACTOR) {
-+		/* Avoid signed integer overflow with large tables. */
-+		int new_size = INT_MAX / 2 < t->size ? t->size * 2 : INT_MAX;
-+		if (t->size == INT_MAX || lh_table_resize(t, new_size) != 0)
- 			return -1;
-+	}
- 
- 	n = h % t->size;
- 
-diff --git a/printbuf.c b/printbuf.c
-index 976c12dde5..00822fac4f 100644
---- a/printbuf.c
-+++ b/printbuf.c
-@@ -15,6 +15,7 @@
- 
- #include "config.h"
- 
-+#include <limits.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-@@ -65,10 +66,16 @@ static int printbuf_extend(struct printbuf *p, int min_size)
- 
- 	if (p->size >= min_size)
- 		return 0;
--
--	new_size = p->size * 2;
--	if (new_size < min_size + 8)
-+	/* Prevent signed integer overflows with large buffers. */
-+	if (min_size > INT_MAX - 8)
-+		return -1;
-+	if (p->size > INT_MAX / 2)
- 		new_size = min_size + 8;
-+	else {
-+		new_size = p->size * 2;
-+		if (new_size < min_size + 8)
-+			new_size = min_size + 8;
-+	}
- #ifdef PRINTBUF_DEBUG
- 	MC_DEBUG("printbuf_memappend: realloc "
- 	         "bpos=%d min_size=%d old_size=%d new_size=%d\n",
-@@ -83,6 +90,9 @@ static int printbuf_extend(struct printbuf *p, int min_size)
- 
- int printbuf_memappend(struct printbuf *p, const char *buf, int size)
- {
-+	/* Prevent signed integer overflows with large buffers. */
-+	if (size > INT_MAX - p->bpos - 1)
-+		return -1;
- 	if (p->size <= p->bpos + size + 1)
- 	{
- 		if (printbuf_extend(p, p->bpos + size + 1) < 0)
-@@ -100,6 +110,9 @@ int printbuf_memset(struct printbuf *pb, int offset, int charvalue, int len)
- 
- 	if (offset == -1)
- 		offset = pb->bpos;
-+	/* Prevent signed integer overflows with large buffers. */
-+	if (len > INT_MAX - offset)
-+		return -1;
- 	size_needed = offset + len;
- 	if (pb->size < size_needed)
- 	{
diff --git a/meta/recipes-devtools/json-c/json-c_0.14.bb b/meta/recipes-devtools/json-c/json-c_0.15.bb
similarity index 80%
rename from meta/recipes-devtools/json-c/json-c_0.14.bb
rename to meta/recipes-devtools/json-c/json-c_0.15.bb
index 1d501d1294..2968590dd8 100644
--- a/meta/recipes-devtools/json-c/json-c_0.14.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
@@ -4,11 +4,9 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
-SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
-           file://CVE-2020-12762.patch \
-"
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "b377de08c9b23ca3b37d9a9828107dff1de5ce208ff4ebb35005a794f30c6870"
+SRC_URI[sha256sum] = "b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
-- 
2.25.1

