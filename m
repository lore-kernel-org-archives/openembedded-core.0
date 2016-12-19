Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id ABA65755C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:40:08 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p66so17444828pga.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 22:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R66S8zhe18XQa308bbJ3wLDgrQc0rsE5UIZbTmA4OKA=;
	b=IkQaB4tidYJ9vPdt9sJrL+lx7ZxPZaz1u7ucUhEtiYgy+uo6IdcTOs8/7etDCwiq/b
	mMROrldF8iuir1ruHxGOgZyMZmH+9z2S0cfzolUbXJ2eVpYlLBgWIH0qVTywZ7jwXSFP
	GUzxUjMuR4ajvGGNNLEeA4BWeMp3/zoLv0vGTtjI3F6aX0B11h1DPHWT/Y3ZWRa+lyS5
	X2OtAt9/rsgd/jL3+tth4cUby9NGGw0FMWUxDH8EyDmtx9uAjbrPtB8gJsS61fwnz+pB
	josPbMiGsM5wOlS8Tpy0FvXpxJWI/nu1/9PYQmcBBhQrgB/8ZDUyNcNKca2nvepKiv5y
	mlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R66S8zhe18XQa308bbJ3wLDgrQc0rsE5UIZbTmA4OKA=;
	b=GrwWPKx+6iHq96QY20e5qcwW39D4YcTr5IrTWgFHkwiTw0Xxna1qnAnosvGDrk6bVl
	9sw4dFumzNAjm739hsdMjqh638FjnCNsPgwbUJqkzheGxg/etOmc343CgUIh9BozNoo2
	N9Ho6OoeA1M9MVaIcgy6NcUIX760G5Cf/ekHDGyDbgiOGs1a1WBUOkj9ea4ENfF4ot8C
	siVSKVvEqQs2jDzCKrvIzfvP4Y1cGVZPIjos0ATUi4mKm3nWLzL6DxPXJGQLHC5gkdK4
	/azCVPX8lox7u7h5Vwk7Ew+cNlSx+WUT7HaM4/YCkBw6pw8pO4hWECWlwmNHcPksMxxK
	wX4A==
X-Gm-Message-State: AIkVDXLSfrKUuXhJ4h2jKOytn+pgNsiFf6IfOR/tWm85yMBKS1kiS8OW7OnKJkRejf5gjQ==
X-Received: by 10.84.216.9 with SMTP id m9mr12117443pli.126.1482129610220;
	Sun, 18 Dec 2016 22:40:10 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	72sm28238304pfw.37.2016.12.18.22.40.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 22:40:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 22:39:53 -0800
Message-Id: <20161219063957.18716-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219063957.18716-1-raj.khem@gmail.com>
References: <20161219063957.18716-1-raj.khem@gmail.com>
Subject: [V2 06/10] pax: Fix build with glibc 2.25
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
X-List-Received-Date: Mon, 19 Dec 2016 06:40:08 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-sysmacros.h-for-major-minor-definitions.patch | 65 ++++++++++++++++++++++
 meta/recipes-extended/pax/pax_3.4.bb               |  4 +-
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/pax/pax/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch

diff --git a/meta/recipes-extended/pax/pax/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch b/meta/recipes-extended/pax/pax/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
new file mode 100644
index 0000000000..1d969bc34a
--- /dev/null
+++ b/meta/recipes-extended/pax/pax/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
@@ -0,0 +1,65 @@
+From 7f4f379f8343c0ce92aa30f3f9037288a089a902 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 18 Dec 2016 08:24:56 +0000
+Subject: [PATCH] include <sys/sysmacros.h> for major/minor definitions
+
+glibc 2.25 will error out if the applications are expecting
+this to come from sys/types.h, it is being removed from
+there.
+
+Fixes
+
+error: In the GNU C Library, "minor" is defined
+|  by <sys/sysmacros.h>. For historical compatibility, it is
+|  currently defined by <sys/types.h> as well, but we plan to
+|  remove this soon. To use "minor", include <sys/sysmacros.h>
+|  directly. If you did not intend to use a system-defined macro
+|  "minor", you should undefine it after including <sys/types.h>. [-Werror]
+|        ul_oct ((u_long) MINOR (arcn->sb.st_rdev), hd->devminor,
+|              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/cpio.c     | 2 +-
+ src/gen_subs.c | 2 +-
+ src/tar.c      | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+Index: pax-3.4/src/cpio.c
+===================================================================
+--- pax-3.4.orig/src/cpio.c
++++ pax-3.4/src/cpio.c
+@@ -36,6 +36,7 @@
+ #include "config.h"
+ #endif
+ 
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <sys/stat.h>
+Index: pax-3.4/src/gen_subs.c
+===================================================================
+--- pax-3.4.orig/src/gen_subs.c
++++ pax-3.4/src/gen_subs.c
+@@ -37,6 +37,7 @@
+ #include "config.h"
+ #endif
+ 
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <sys/stat.h>
+Index: pax-3.4/src/tar.c
+===================================================================
+--- pax-3.4.orig/src/tar.c
++++ pax-3.4/src/tar.c
+@@ -37,6 +37,7 @@
+ #include "config.h"
+ #endif
+ 
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <sys/stat.h>
diff --git a/meta/recipes-extended/pax/pax_3.4.bb b/meta/recipes-extended/pax/pax_3.4.bb
index 9d1abfbb54..9b4e17b3df 100644
--- a/meta/recipes-extended/pax/pax_3.4.bb
+++ b/meta/recipes-extended/pax/pax_3.4.bb
@@ -16,7 +16,9 @@ DEPENDS_append_libc-musl = " fts "
 
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.bz2/fbd9023b590b45ac3ade95870702a0d6/${BP}.tar.bz2 \
 	file://fix_for_compile_with_gcc-4.6.0.patch \
-	file://pax-3.4_fix_for_x32.patch"
+	file://pax-3.4_fix_for_x32.patch \
+        file://0001-include-sys-sysmacros.h-for-major-minor-definitions.patch \
+"
 
 SRC_URI_append_libc-musl = " file://0001-Fix-build-with-musl.patch \
                              file://0001-use-strtoll-instead-of-strtoq.patch \
-- 
2.11.0


