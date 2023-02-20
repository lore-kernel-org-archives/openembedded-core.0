Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C65C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:18:50 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.14053.1676902727494271717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Ce/YbAuc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id y19so791779pgk.5
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXJQyzp2MJXLWlDGBfQ02CD4O58CAWJPyHaLVH5o8ns=;
        b=Ce/YbAucaDxMPgDgg2bSErDtHL4L7BQj4ChNxv44+Qz0kJWlGcYuD31kG06XZmdzBU
         INp1M0IliKnJkQWyvktvkTj0m6HV6R73rmp0PaIJD4iGZ1qcaRkalCrrWMEit/YTs862
         njh38eRqbY9+49jw+OJDZS6HmLY24aWpa+GjCC5bB9JX0yZc95hKQiIOJEDY46ui3GAb
         nhWycQMox2gwQrsAIzAcckN0WqWC+V0iRPyJpwhbf0266F9cyKergmoEF+NRcM+oVcTm
         58s4LB/JDHOkN6nLlCOPcPIYvBHrRGCyPevEByPrzInJf7da31tdT5vlAZ7wWeoFsQHy
         zTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXJQyzp2MJXLWlDGBfQ02CD4O58CAWJPyHaLVH5o8ns=;
        b=Q3pwZe9IotLV3KKR6iRy6l9Akc2KKL4qzCfGUuEsiCX7a6gUT8z215SLF+8hcdmOVq
         Rpqswozi0XCSpPeEpIK9EqWmYOvUSCmONXx6fAwoz5WzIdw1iLR11QZHm0q79osqJ8K7
         NU97/OeN4Pe0X9owmFcdw/zpQWKKEeu8oMGsx+nAAjnHzxUFNz7FYfJvnNRp4OVnSRP/
         c+Toe2ocY0nQcc1Gwgk+kag0/GkPrvdZ3M5dSbSpRFzkuB5KUQLDYSVfxhrfFPHJ5Axd
         fPZiNBMDYrUvhAR096UlQ5LQWY7UeKQs0t4QqpDj9Ww4EcuPZyhoYQy6YL7/derodX5L
         dgwQ==
X-Gm-Message-State: AO0yUKW/bLc+u7QvQA3WfjlQpdIytWYJkvwzUWHmBpE/EZd+J9zAtYHF
	wstQ2hzJEhomhwbz1FhtyoDJ8ZdwkdAx/XSOefI=
X-Google-Smtp-Source: AK7set8FocjjzR9ew/RK2hKRxWz9mlD42N3B8Nt/rTNx5lIboFWm4WN/RlZb2+Cj89dzjJSjbwY4bA==
X-Received: by 2002:aa7:9eda:0:b0:5a8:5e6d:28d7 with SMTP id r26-20020aa79eda000000b005a85e6d28d7mr893821pfq.0.1676902726482;
        Mon, 20 Feb 2023 06:18:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.18.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:18:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/22] apr-util: update 1.6.1 -> 1.6.3
Date: Mon, 20 Feb 2023 04:18:12 -1000
Message-Id: <da972ff634132943de71241e130bdccd3e4cfa47.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177411

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes with APR-util 1.6.3

  *) Correct a packaging issue in 1.6.2. The contents of the release were
     correct, but the top level directory was misnamed.

Changes with APR-util 1.6.2

  *) SECURITY: CVE-2022-25147 (cve.mitre.org)
     Integer Overflow or Wraparound vulnerability in apr_base64 functions
     of Apache Portable Runtime Utility (APR-util) allows an attacker to
     write beyond bounds of a buffer.

  *) Teach configure how to find and build against MariaDB 10.2. PR 61517
     [Kris Karas <bugs-a17 moonlit-rail.com>]

  *) apr_crypto_commoncrypto: Remove stray reference to -lcrypto that
     prevented commoncrypto being enabled. [Graham Leggett]

  *) Add --tag=CC to libtool invocations. PR 62640. [Michael Osipov]

  *) apr_dbm_gdbm: Fix handling of error codes. This makes gdbm 1.14 work.
     apr_dbm_gdbm will now also return error codes starting with
     APR_OS_START_USEERR, as apr_dbm_berkleydb does, instead of always
     returning APR_EGENERAL. [Stefan Fritsch]

Drop backport.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dca707f9fecc805503e17f6db3e4c88069ac0125)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Fix-error-handling-in-gdbm.patch     | 134 ------------------
 .../{apr-util_1.6.1.bb => apr-util_1.6.3.bb}  |   6 +-
 2 files changed, 2 insertions(+), 138 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
 rename meta/recipes-support/apr/{apr-util_1.6.1.bb => apr-util_1.6.3.bb} (94%)

diff --git a/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch b/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
deleted file mode 100644
index 6f27876a7f..0000000000
--- a/meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 6b638fa9afbeb54dfa19378e391465a5284ce1ad Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 12 Sep 2018 17:16:36 +0800
-Subject: [PATCH] Fix error handling in gdbm
-
-Only check for gdbm_errno if the return value of the called gdbm_*
-function says so. This fixes apr-util with gdbm 1.14, which does not
-seem to always reset gdbm_errno.
-
-Also make the gdbm driver return error codes starting with
-APR_OS_START_USEERR instead of always returning APR_EGENERAL. This is
-what the berkleydb driver already does.
-
-Also ensure that dsize is 0 if dptr == NULL.
-
-Upstream-Status: Backport [https://svn.apache.org/viewvc?view=revision&amp;revision=1825311]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- dbm/apr_dbm_gdbm.c | 47 +++++++++++++++++++++++++++++------------------
- 1 file changed, 29 insertions(+), 18 deletions(-)
-
-diff --git a/dbm/apr_dbm_gdbm.c b/dbm/apr_dbm_gdbm.c
-index 749447a..1c86327 100644
---- a/dbm/apr_dbm_gdbm.c
-+++ b/dbm/apr_dbm_gdbm.c
-@@ -36,13 +36,25 @@
- static apr_status_t g2s(int gerr)
- {
-     if (gerr == -1) {
--        /* ### need to fix this */
--        return APR_EGENERAL;
-+        if (gdbm_errno == GDBM_NO_ERROR)
-+           return APR_SUCCESS;
-+        return APR_OS_START_USEERR + gdbm_errno;
-     }
- 
-     return APR_SUCCESS;
- }
- 
-+static apr_status_t gdat2s(datum d)
-+{
-+    if (d.dptr == NULL) {
-+        if (gdbm_errno == GDBM_NO_ERROR || gdbm_errno == GDBM_ITEM_NOT_FOUND)
-+           return APR_SUCCESS;
-+        return APR_OS_START_USEERR + gdbm_errno;
-+   }
-+
-+    return APR_SUCCESS;
-+}
-+
- static apr_status_t datum_cleanup(void *dptr)
- {
-     if (dptr)
-@@ -53,22 +65,15 @@ static apr_status_t datum_cleanup(void *dptr)
- 
- static apr_status_t set_error(apr_dbm_t *dbm, apr_status_t dbm_said)
- {
--    apr_status_t rv = APR_SUCCESS;
- 
--    /* ### ignore whatever the DBM said (dbm_said); ask it explicitly */
-+    dbm->errcode = dbm_said;  
- 
--    if ((dbm->errcode = gdbm_errno) == GDBM_NO_ERROR) {
-+    if (dbm_said == APR_SUCCESS)
-         dbm->errmsg = NULL;
--    }
--    else {
--        dbm->errmsg = gdbm_strerror(gdbm_errno);
--        rv = APR_EGENERAL;        /* ### need something better */
--    }
--
--    /* captured it. clear it now. */
--    gdbm_errno = GDBM_NO_ERROR;
-+    else
-+        dbm->errmsg = gdbm_strerror(dbm_said - APR_OS_START_USEERR);
- 
--    return rv;
-+    return dbm_said;
- }
- 
- /* --------------------------------------------------------------------------
-@@ -107,7 +112,7 @@ static apr_status_t vt_gdbm_open(apr_dbm_t **pdb, const char *pathname,
-                      NULL);
- 
-     if (file == NULL)
--        return APR_EGENERAL;      /* ### need a better error */
-+        return APR_OS_START_USEERR + gdbm_errno;   /* ### need a better error */
- 
-     /* we have an open database... return it */
-     *pdb = apr_pcalloc(pool, sizeof(**pdb));
-@@ -141,10 +146,12 @@ static apr_status_t vt_gdbm_fetch(apr_dbm_t *dbm, apr_datum_t key,
-     if (pvalue->dptr)
-         apr_pool_cleanup_register(dbm->pool, pvalue->dptr, datum_cleanup,
-                                   apr_pool_cleanup_null);
-+    else
-+       pvalue->dsize = 0;
- 
-     /* store the error info into DBM, and return a status code. Also, note
-        that *pvalue should have been cleared on error. */
--    return set_error(dbm, APR_SUCCESS);
-+    return set_error(dbm, gdat2s(rd));
- }
- 
- static apr_status_t vt_gdbm_store(apr_dbm_t *dbm, apr_datum_t key,
-@@ -201,9 +208,11 @@ static apr_status_t vt_gdbm_firstkey(apr_dbm_t *dbm, apr_datum_t *pkey)
-     if (pkey->dptr)
-         apr_pool_cleanup_register(dbm->pool, pkey->dptr, datum_cleanup,
-                                   apr_pool_cleanup_null);
-+    else
-+        pkey->dsize = 0;
- 
-     /* store any error info into DBM, and return a status code. */
--    return set_error(dbm, APR_SUCCESS);
-+    return set_error(dbm, gdat2s(rd));
- }
- 
- static apr_status_t vt_gdbm_nextkey(apr_dbm_t *dbm, apr_datum_t *pkey)
-@@ -221,9 +230,11 @@ static apr_status_t vt_gdbm_nextkey(apr_dbm_t *dbm, apr_datum_t *pkey)
-     if (pkey->dptr)
-         apr_pool_cleanup_register(dbm->pool, pkey->dptr, datum_cleanup,
-                                   apr_pool_cleanup_null);
-+    else
-+       pkey->dsize = 0;
- 
-     /* store any error info into DBM, and return a status code. */
--    return set_error(dbm, APR_SUCCESS);
-+    return set_error(dbm, gdat2s(rd));
- }
- 
- static void vt_gdbm_freedatum(apr_dbm_t *dbm, apr_datum_t data)
--- 
-2.7.4
-
diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
similarity index 94%
rename from meta/recipes-support/apr/apr-util_1.6.1.bb
rename to meta/recipes-support/apr/apr-util_1.6.3.bb
index b851d46351..7c6fcc699b 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -13,11 +13,9 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch \
            file://run-ptest \
-           file://0001-Fix-error-handling-in-gdbm.patch \
-"
+           "
 
-SRC_URI[md5sum] = "bd502b9a8670a8012c4d90c31a84955f"
-SRC_URI[sha256sum] = "b65e40713da57d004123b6319828be7f1273fbc6490e145874ee1177e112c459"
+SRC_URI[sha256sum] = "2b74d8932703826862ca305b094eef2983c27b39d5c9414442e9976a9acf1983"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--without-odbc \
-- 
2.34.1


