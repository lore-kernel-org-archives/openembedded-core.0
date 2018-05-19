Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id A13CE74D87
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 02:13:59 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id l2-v6so4034158pgc.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 19:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S0wSUv0P/O4xyX0vlCpGlduLuqmcNsLa0Ujdhhr73LI=;
	b=P53B3Q4YZof/570sisc8E2ZDrgelMr8Q0CKCN2hzjVc8teSvOMCqDqtZjsc02SyTqo
	FgVjFBxfOOK4j3wNw7Thckfu0hUpq9INxEmexDgbfdktVGW36XjHgyYgWlBcuTqP+Y9S
	BKUJQBLsZXS0ZqaO0GDCbkaY1Ud4vOcz67BMacqqJxAPvjpJfhat+D+/QYJXcJYRw1VE
	oW2bcT+rvG7LB6iJKMcsF6h9CWxiEhmxw50l7zRKkdmgU/7gCkFGWrF7Pc01TnT26Tmi
	+WdAfRV7Ige2zTuEuX5Ht4QtnosT5EvvyUEQRbKHxBirX/Tf0BJgRQgroEQ+M/PSuBZ+
	fscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S0wSUv0P/O4xyX0vlCpGlduLuqmcNsLa0Ujdhhr73LI=;
	b=DSLkGDtgjAejryDDascZAdSWy6y1J2I+525833sOhZR1RcGLJPVPtfvq8rz6VNF4i+
	kHZk8eOqhGDGXi5Ofz5Bq8LvP6xPHxZEy0UsWrNvf7cl40GfmwjpPQmKvsycaAEAFIBh
	eGRlT28F5wzFqgNgUKKsURWHr5//RtjNpRcM6sNhg+Xd2CEbZEvsThn/zXaxuPtA4Seh
	WqbC6wizW9BPdxuBxhKe34O3EWE+NrEWt22rTVt5xcuSVSnaPTzkuGw85l42kjvt5CNw
	YSyWGhhzt1eZ6X+7gUlKuLcxz6EG2/VNM5y7sPxiBETOseBufzA6/VxO24iX4Qe9N6vH
	YbvQ==
X-Gm-Message-State: ALKqPwf3U4zWXgksN+OQG6d/I5neKe2n3pd4D67zJNb5Qc5WTP2Q6LVm
	+tAhBSZ+NRplnlB58uYH9JA=
X-Google-Smtp-Source: AB8JxZqrJi9eRYMXr3i3rGQUV+mDVFck+qh2X4KaW7t9uNeyaJ84aptT2LN9lUlNjdNkDCHu4cro5Q==
X-Received: by 2002:a62:5b02:: with SMTP id
	p2-v6mr11635769pfb.96.1526696040291; 
	Fri, 18 May 2018 19:14:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:ed41:dd75:6b53:32ea])
	by smtp.gmail.com with ESMTPSA id
	n10-v6sm19307081pfj.68.2018.05.18.19.13.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 May 2018 19:13:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 19:13:51 -0700
Message-Id: <1526696034-3857-5-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526696034-3857-1-git-send-email-akuster@mvista.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 5/8] nss: update to 3.36.1
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
X-List-Received-Date: Sat, 19 May 2018 02:13:59 -0000

From: Armin Kuster <akuster808@gmail.com>

removed patches included in update:
0001-Bug-1437734-Use-snprintf-in-sign.c-r-ttaubert.patch
nss-build-hacl-poly1305-aarch64.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1437734-Use-snprintf-in-sign.c-r-ttaubert.patch | 119 ---------------------
 .../nss/nss/nss-build-hacl-poly1305-aarch64.patch  |  30 ------
 .../nss/{nss_3.35.bb => nss_3.36.1.bb}             |   6 +-
 3 files changed, 2 insertions(+), 153 deletions(-)
 delete mode 100644 meta/recipes-support/nss/nss/0001-Bug-1437734-Use-snprintf-in-sign.c-r-ttaubert.patch
 delete mode 100644 meta/recipes-support/nss/nss/nss-build-hacl-poly1305-aarch64.patch
 rename meta/recipes-support/nss/{nss_3.35.bb => nss_3.36.1.bb} (96%)

diff --git a/meta/recipes-support/nss/nss/0001-Bug-1437734-Use-snprintf-in-sign.c-r-ttaubert.patch b/meta/recipes-support/nss/nss/0001-Bug-1437734-Use-snprintf-in-sign.c-r-ttaubert.patch
deleted file mode 100644
index bc10f33..0000000
--- a/meta/recipes-support/nss/nss/0001-Bug-1437734-Use-snprintf-in-sign.c-r-ttaubert.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 6f7d7be9997ba6727a5ad7c3800df9051160dc12 Mon Sep 17 00:00:00 2001
-From: Martin Thomson <martin.thomson@gmail.com>
-Date: Tue, 13 Feb 2018 12:30:58 +1100
-Subject: [PATCH] Bug 1437734 - Use snprintf in sign.c, r=ttaubert
-
---HG--
-extra : rebase_source : 97921ece71ff86b18d32b891591608290eed4d83
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://github.com/nss-dev/nss/commit/0a9078b3cde97add7c825c9d13467a8401ad0c88#diff-b42512151dc137537091f823f7701804.patch]
-
- nss/cmd/signtool/sign.c | 58 ++++++++++++++++++++++++++++++++++++++++---------
- 1 file changed, 48 insertions(+), 10 deletions(-)
-
-diff --git a/nss/cmd/signtool/sign.c b/nss/cmd/signtool/sign.c
-index 6e776069a..6f8e43946 100644
---- a/nss/cmd/signtool/sign.c
-+++ b/nss/cmd/signtool/sign.c
-@@ -43,6 +43,7 @@ SignArchive(char *tree, char *keyName, char *zip_file, int javascript,
-     int status;
-     char tempfn[FNSIZE], fullfn[FNSIZE];
-     int keyType = rsaKey;
-+    int count;
- 
-     metafile = meta_file;
-     optimize = _optimize;
-@@ -81,9 +82,18 @@ SignArchive(char *tree, char *keyName, char *zip_file, int javascript,
-         }
- 
-         /* rsa/dsa to zip */
--        sprintf(tempfn, "META-INF/%s.%s", base, (keyType == dsaKey ? "dsa"
--                                                                   : "rsa"));
--        sprintf(fullfn, "%s/%s", tree, tempfn);
-+        count = snprintf(tempfn, sizeof(tempfn), "META-INF/%s.%s", base, (keyType == dsaKey ? "dsa" : "rsa"));
-+        if (count >= sizeof(tempfn)) {
-+            PR_fprintf(errorFD, "unable to write key metadata\n");
-+            errorCount++;
-+            exit(ERRX);
-+        }
-+        count = snprintf(fullfn, sizeof(fullfn), "%s/%s", tree, tempfn);
-+        if (count >= sizeof(fullfn)) {
-+            PR_fprintf(errorFD, "unable to write key metadata\n");
-+            errorCount++;
-+            exit(ERRX);
-+        }
-         JzipAdd(fullfn, tempfn, zipfile, compression_level);
- 
-         /* Loop through all files & subdirectories, add to archive */
-@@ -93,20 +103,44 @@ SignArchive(char *tree, char *keyName, char *zip_file, int javascript,
-     }
-     /* mf to zip */
-     strcpy(tempfn, "META-INF/manifest.mf");
--    sprintf(fullfn, "%s/%s", tree, tempfn);
-+    count = snprintf(fullfn, sizeof(fullfn), "%s/%s", tree, tempfn);
-+    if (count >= sizeof(fullfn)) {
-+        PR_fprintf(errorFD, "unable to write manifest\n");
-+        errorCount++;
-+        exit(ERRX);
-+    }
-     JzipAdd(fullfn, tempfn, zipfile, compression_level);
- 
-     /* sf to zip */
--    sprintf(tempfn, "META-INF/%s.sf", base);
--    sprintf(fullfn, "%s/%s", tree, tempfn);
-+    count = snprintf(tempfn, sizeof(tempfn), "META-INF/%s.sf", base);
-+    if (count >= sizeof(tempfn)) {
-+        PR_fprintf(errorFD, "unable to write sf metadata\n");
-+        errorCount++;
-+        exit(ERRX);
-+    }
-+    count = snprintf(fullfn, sizeof(fullfn), "%s/%s", tree, tempfn);
-+    if (count >= sizeof(fullfn)) {
-+        PR_fprintf(errorFD, "unable to write sf metadata\n");
-+        errorCount++;
-+        exit(ERRX);
-+    }
-     JzipAdd(fullfn, tempfn, zipfile, compression_level);
- 
-     /* Add the rsa/dsa file to the zip archive normally */
-     if (!xpi_arc) {
-         /* rsa/dsa to zip */
--        sprintf(tempfn, "META-INF/%s.%s", base, (keyType == dsaKey ? "dsa"
--                                                                   : "rsa"));
--        sprintf(fullfn, "%s/%s", tree, tempfn);
-+        count = snprintf(tempfn, sizeof(tempfn), "META-INF/%s.%s", base, (keyType == dsaKey ? "dsa" : "rsa"));
-+        if (count >= sizeof(tempfn)) {
-+            PR_fprintf(errorFD, "unable to write key metadata\n");
-+            errorCount++;
-+            exit(ERRX);
-+        }
-+        count = snprintf(fullfn, sizeof(fullfn), "%s/%s", tree, tempfn);
-+        if (count >= sizeof(fullfn)) {
-+            PR_fprintf(errorFD, "unable to write key metadata\n");
-+            errorCount++;
-+            exit(ERRX);
-+        }
-         JzipAdd(fullfn, tempfn, zipfile, compression_level);
-     }
- 
-@@ -408,6 +442,7 @@ static int
- manifesto_xpi_fn(char *relpath, char *basedir, char *reldir, char *filename, void *arg)
- {
-     char fullname[FNSIZE];
-+    int count;
- 
-     if (verbosity >= 0) {
-         PR_fprintf(outputFD, "--> %s\n", relpath);
-@@ -421,7 +456,10 @@ manifesto_xpi_fn(char *relpath, char *basedir, char *reldir, char *filename, voi
-         if (!PL_HashTableLookup(extensions, ext))
-             return 0;
-     }
--    sprintf(fullname, "%s/%s", basedir, relpath);
-+    count = snprintf(fullname, sizeof(fullname), "%s/%s", basedir, relpath);
-+    if (count >= sizeof(fullname)) {
-+        return 1;
-+    }
-     JzipAdd(fullname, relpath, zipfile, compression_level);
- 
-     return 0;
diff --git a/meta/recipes-support/nss/nss/nss-build-hacl-poly1305-aarch64.patch b/meta/recipes-support/nss/nss/nss-build-hacl-poly1305-aarch64.patch
deleted file mode 100644
index 8276f89..0000000
--- a/meta/recipes-support/nss/nss/nss-build-hacl-poly1305-aarch64.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-# HG changeset patch
-# User Daiki Ueno <dueno@redhat.com>
-# Date 1516710574 -3600
-#      Tue Jan 23 13:29:34 2018 +0100
-# Node ID 27f27ce21c2c6ff5a47fa9e17c438b000366c9c9
-# Parent  be1dca5ac80541d3b81a8da9d42854d8b1cceefb
-Build Hacl_Poly1305_64.o on aarch64 even with make
-
-Upstream-Status: Backport
-https://bug1432455.bmoattachments.org/attachment.cgi?id=8944691
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-Index: nss-3.35/nss/lib/freebl/Makefile
-===================================================================
---- nss-3.35.orig/nss/lib/freebl/Makefile
-+++ nss-3.35/nss/lib/freebl/Makefile
-@@ -533,7 +533,12 @@ ifndef NSS_DISABLE_CHACHAPOLY
-             EXTRA_SRCS += chacha20_vec.c
-         endif
-     else
--        EXTRA_SRCS += poly1305.c
-+        ifeq ($(CPU_ARCH),aarch64)
-+            EXTRA_SRCS += Hacl_Poly1305_64.c
-+        else
-+            EXTRA_SRCS += poly1305.c
-+        endif
-+
-         EXTRA_SRCS += chacha20.c
-         VERIFIED_SRCS += Hacl_Chacha20.c
-     endif # x86_64
diff --git a/meta/recipes-support/nss/nss_3.35.bb b/meta/recipes-support/nss/nss_3.36.1.bb
similarity index 96%
rename from meta/recipes-support/nss/nss_3.35.bb
rename to meta/recipes-support/nss/nss_3.36.1.bb
index 84f1916..f855538 100644
--- a/meta/recipes-support/nss/nss_3.35.bb
+++ b/meta/recipes-support/nss/nss_3.36.1.bb
@@ -26,12 +26,10 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
            file://Fix-compilation-for-X32.patch \
-           file://nss-build-hacl-poly1305-aarch64.patch \
-           file://0001-Bug-1437734-Use-snprintf-in-sign.c-r-ttaubert.patch \
            "
 
-SRC_URI[md5sum] = "9467ec9e65c5aeb3254a50250490f5f7"
-SRC_URI[sha256sum] = "f4127de09bede39f5fd0f789d33c3504c5d261e69ea03022d46b319b3e32f6fa"
+SRC_URI[md5sum] = "814d8fe3ec89006cf62078e2a56cf2f9"
+SRC_URI[sha256sum] = "6025441d528ff6a7f1a4b673b6ee7d3540731ada3f78d5acd5c3b3736b222bff"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4


