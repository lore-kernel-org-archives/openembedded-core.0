Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id EA95177F6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:01:16 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id m17so70268660pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vcIQ1C/QbV50bGrAHpwLbFhMmX2uGtKOPnK3S7ru9k0=;
	b=LewRxnsFl9WBTa8p5Hw+yoNGjiqjuoYQHdbrVz54DKrNSHcS1EDes9KO9FI4o2Cwc0
	E+9eGh5NjxpezPgaisVjLlqiBHfbirWaDPG4BBLJRw9B/H6R8O19dVTO9F89yb6b3OW8
	ZuU0RAlulkSRaRfy8ZsrMxsjZAWkvfoz+Ow6QNV9/knlDdoGW4Z/nOvU7BVNgO5At/aF
	U77NvV04gXN3arP5bWRSCUHhb1zjUyoBqwH0P9lPrCuv0O7rNtDmDEdXB8vuJgcaQ0aC
	GxfVMJ0wQynht0eg3rv11wlwwk23izp6iaQLNbxKTaoRoLRDHvfayHzvTTJ1HQyOAqba
	UvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vcIQ1C/QbV50bGrAHpwLbFhMmX2uGtKOPnK3S7ru9k0=;
	b=aPCDy9/d1dibbTBTvzucXZ7n0ECeSqjdSumrS7paQmCWnlIMyi2Tm6SbCVv0YAdaRM
	csho+t/LDZRxORBmMM7Qk+pOipHPYC6vqAGIjxLtlJ6GEJqJ8S4vLEAmbkx984yNWsxe
	HB9q1xhMlpv/YakBn5js91Bua987W16RHJo0kU4YDtq31lrinhNU8bpDuGotMmj8jJSd
	W1JAvs0bAom7i5r0S9XMXApyGYr7pxTe7aZr76xzg9FJt3cMrdYxZew+lM9lJ0vhwNwQ
	wcqWAxvArdvks+/EPXEt7XhYl2o9gctfy/ELvHz7bk8EOjgwPoWNm0DcH3XWMhH+hYIz
	B2vg==
X-Gm-Message-State: AODbwcA0jUcUwSQSCYP2Pcg7j26XFPhUvmMRGNG3OQwAXHTFBc58MmkI
	ywir5A2di9LMSg==
X-Received: by 10.98.138.150 with SMTP id o22mr23196881pfk.120.1495429277920; 
	Sun, 21 May 2017 22:01:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.01.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:01:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:41 -0700
Message-Id: <20170522050042.42403-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 14/15] libtirpc: Fix build error due to missing stdint.h> include
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
X-List-Received-Date: Mon, 22 May 2017 05:01:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-stdint.h-for-uintptr_t.patch      | 32 ++++++++++++++++++++++
 meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch
new file mode 100644
index 0000000000..1fe9833afe
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch
@@ -0,0 +1,32 @@
+From b80d3b573c1dade2b29b22f8acc3b9e2c7ddefd7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 20 May 2017 13:36:43 -0700
+Subject: [PATCH] include stdint.h for uintptr_t
+
+Fixes
+| ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
+|   if (len < (uintptr_t)xdrs->x_base) {
+|              ^~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/xdr_sizeof.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/xdr_sizeof.c b/src/xdr_sizeof.c
+index d23fbd1..79d6707 100644
+--- a/src/xdr_sizeof.c
++++ b/src/xdr_sizeof.c
+@@ -39,6 +39,7 @@
+ #include <rpc/xdr.h>
+ #include <sys/types.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include "un-namespace.h"
+ 
+ /* ARGSUSED */
+-- 
+2.13.0
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
index 662c8999c2..5518fb3c78 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
            file://libtirpc-0.2.1-fortify.patch \
            file://export_key_secretkey_is_set.patch \
            file://0001-replace-__bzero-with-memset-API.patch \
+           file://0001-include-stdint.h-for-uintptr_t.patch \
            "
 
 SRC_URI_append_libc-uclibc = " file://remove-des-functionality.patch \
-- 
2.13.0


