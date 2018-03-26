Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id B4195786EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:31 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id m22-v6so12051206pls.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=P683qi2qg3/GumMjuKUYtSM6I32mI7PvxqSq8zqv3bA=;
	b=QPO6G668wbdtbxS3vYtEELPy96ru1pzke/LxlIT0H8FalUmEkq4fRKfyxzbd3iIUz2
	q2mVV17QtFA2neLiZJ3OGQWWNkYIeRiPIbEP9l3sQgSxIOGckfkIBTuBN8K9SsVNi6zL
	hJXD30pq4bnQoZRtEsAi/0qKmuqdTXnDXakQlZyU8RDl5y27ExnyoPDzOKqPDF1rXu8R
	G1Q71VFiAqe0B8pgykug8W0c8IpUmLHgJBsni1HABWoHYVJX5xRfOt5uxwzN1pXkTJjV
	kw0SL8CoaptmqW3nCsqi669p/rjuOuLe5oYb1HNib5ZQ7UlqcpulP3nsua/zokHGGw3e
	cgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=P683qi2qg3/GumMjuKUYtSM6I32mI7PvxqSq8zqv3bA=;
	b=SpiAsGLgVdiOY9QwY0PHpa4v8Mqg1BB6G55fzS5JDMS5qLYZmAlSd02UrYMM/QVvKG
	FirMaJ6KbLCLMWE//IV1AXUqzPpLCgG9/zz31Y47hRxskxmmOWQMQvNDlXn5Z5LV7T4t
	lfKNImagVA6YB1kiNUO0VsK7UFYPEgkdvNkmGbkfH4EQ73EtJx6Nt5ePpVHkBG2GAo6r
	4t3p5i/y6Y91TPTJ1Mx1UpwHGlfgfSN+VvGFTQhFzocVaE7SOHR28fwgTdttoPRTUlNc
	fnIclmLTv0eV9N0JHiRFj+Lj33hueXTEbOW1dJ9oBonXY5WX15bRylQK2QFnr/oNk322
	pDEg==
X-Gm-Message-State: AElRT7FUX54380uGuKzCiCPELrAdT6uJcWNAHxHsg2WHJvH1UA0ESuGt
	6CU6R+b7ZessZGy08iVZIEsI5A==
X-Google-Smtp-Source: AG47ELvyzNeTgrf0WacxVrctXRlkbKjZwPSOw3nb6Qgp07JFI7pSQ1XV46P/Qgr1QqfhCTUKn7M5vg==
X-Received: by 2002:a17:902:6984:: with SMTP id
	l4-v6mr42080023plk.61.1522074693142; 
	Mon, 26 Mar 2018 07:31:33 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:20 -0700
Message-Id: <0e9787856aff0aeca99947aef5c4f76f0147686f.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 17/21] nspr: update to 4.19
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:31 -0000

From: Armin Kuster <akuster@mvista.com>

patch 0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch remove
as it is included in update

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...int.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch | 30 ----------------------
 .../nspr/{nspr_4.18.bb => nspr_4.19.bb}            |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch
 rename meta/recipes-support/nspr/{nspr_4.18.bb => nspr_4.19.bb} (95%)

diff --git a/meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch b/meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch
deleted file mode 100644
index b3bdd8e..0000000
--- a/meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f7551ec58e2f0a892295e0c2a650083101e12c54 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 20 May 2017 13:24:26 -0700
-Subject: [PATCH] include stdint.h for SSIZE_MAX and SIZE_MAX definitions
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- pr/tests/prfz.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/pr/tests/prfz.c b/pr/tests/prfz.c
-index 0c5a432..9c17590 100644
---- a/pr/tests/prfz.c
-+++ b/pr/tests/prfz.c
-@@ -10,7 +10,9 @@
- #include <sys/types.h>
- #include <limits.h>
- #include <string.h>
--
-+#ifdef XP_UNIX
-+#include <stdint.h>
-+#endif
- int
- main(int argc, char **argv)
- {
--- 
-2.13.0
-
diff --git a/meta/recipes-support/nspr/nspr_4.18.bb b/meta/recipes-support/nspr/nspr_4.19.bb
similarity index 95%
rename from meta/recipes-support/nspr/nspr_4.18.bb
rename to meta/recipes-support/nspr/nspr_4.19.bb
index cd7ae8c8..de2c871 100644
--- a/meta/recipes-support/nspr/nspr_4.18.bb
+++ b/meta/recipes-support/nspr/nspr_4.19.bb
@@ -10,7 +10,6 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://fix-build-on-x86_64.patch \
            file://remove-srcdir-from-configure-in.patch \
            file://0002-Add-nios2-support.patch \
-           file://0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch \
            file://0001-md-Fix-build-with-musl.patch \
            file://nspr.pc.in \
 "
@@ -23,8 +22,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "2a558f9aeb109bfb16d78bdc42033a1e"
-SRC_URI[sha256sum] = "b89657c09bf88707d06ac238b8930d3ae08de68cb3edccfdc2e3dc97f9c8fb34"
+SRC_URI[md5sum] = "e1d27282ad6286b69d6b9fd07201d3dd"
+SRC_URI[sha256sum] = "2ed95917fa2277910d1d1cf36030607dccc0ba522bba08e2af13c113dcd8f729"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.7.4


