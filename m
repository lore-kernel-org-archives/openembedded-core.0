Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3755.1793405776713158436
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=m+ta3i7c;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so7644035e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405775; x=1794010575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BtwMnu80lep27E9xOU+j3v6T0hB2/wNzvzf8cmixAQw=;
        b=m+ta3i7c5Wm38/UlMCHniJOim0dyIBY+ErF46MavVCDQCtNjywcA0Y+HpXghNoOcZ5
         67qyFZ/ucPeT/F2g0i1rggai1oaoL4dI4OkW144Y03KwnsdXX4oJ2r4s23voiFuBr7R1
         gzOtc2tSsSMECrT8YlNxci/xGgBkYfK3nhQ68lHDbuukCDkfBdKEqtEwVeBa21FX93Wk
         W9kI8TfvvtT/Fk3rTTSIKqBHNgYJfnz3PoPTIwIEFV3iUO0jaL4ouDuHM+4T4pu5C/Fc
         1q6pL0aK2seQr9DcdDgarlAWteq1WVIvuQT95G00c9YctkFTEzrx8JYxI0zUvUqWkjgJ
         vUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405775; x=1794010575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BtwMnu80lep27E9xOU+j3v6T0hB2/wNzvzf8cmixAQw=;
        b=mFg2KjCl9Gad23cQ34ZsUuVKeUDPOBLPMkReP/7NEr1171zzqhyYNiUclPYVhju/Ff
         QDOWYr3iB9wpTmPLFIfNZ3M2yfYtdqb7Td27kFqkM0oTRN08+hrk7Df9/JlI5P3QWnpI
         G2bUFvKb8q153qNnjsJnPu0ALPlyNMlyHutGwYg0dvqSDaUwCP/JQytLNDv1silbGsOu
         zRisdHUV3OIdcMGR5ZEnrfxWVWATBgGW4DDJQN/1ZDqyCgV5zeBeEz/9ONQ6g+at9i+k
         lF5oq0bgsXPMEiFyyVnSqyWETJGXL3msFLipbC/hwcfPEtRfWbMD+7IEdwzNltuwXBd0
         3SYw==
X-Gm-Message-State: AFq9FYKf+mpEDjSruoP2rtDagHYWP/HnlDsn90XB1QNhriyZNNKtyhxv
	jl37Yd+zAQE6NI6WGV+IXgGFkAn9RTritKUlvbMfD7vvVEXdYRLFU68XduyES/c1UPa62YEfmnq
	DEeLhiGA=
X-Gm-Gg: AYBFou3toQSzhNUle9ftFM2Ym9F2XuhhkXoG0j4lJrSEVxWSC+qx3npvuGHqZRcRME9
	Vr+VcAhEtFLQT8go4d7+10T8gO5M8eNOI7kM3UO4cRrLk01F3spsyWSB3gadPa4BBsvbT2Uz+qL
	VhWF/e/sPf8999ZMpY9qioSo+LoMTrGQ5iFzdRufAnEXg+bcR/SVZoH0S0FZC6kzx093hi0EUjs
	ZEwLh3gNeAXez/TuTT3K0ZdBEpcKAp5LyVCBJsrgfsZSCxfzOtnN16kChbVftgHRXrDolq70LXT
	9Ek2z1relo7gR9ni8VDkgvI2V1FBj+hke0WVJ5laU/cSVz8FozJCs4UJ/PaF9yF8vezkOvbB/nX
	p1DLr6cOIy8dG4EZTquEElFTvHpDDy4Dd+QbSVLW7yq5S2hmxbLRFfJ+zz8BvbA4lQy7XGR3zpw
	mTi34U1QRfkZ+nYueAm/4LJUlDFT2fqEImt8h4O59tYhyzSiM6RPaZ7CrszGsVtSJkqyHqJSXAD
	3S+ZJI8JMffti7zWhBvgjWZlxGOdcp9xlvD5OuheMtQpzyEtTNlG8JINOpHJFiYWQhnSBBRgwZT
	on9NZ/V+pVsNDBpQv6+4Sh6+B3PwtXQy05hImq2PUUxrkamp8NlUsXUJWV7f8217eF0bbFAdZtY
	X/fWRvIyGVrzPbMfumdRL5tPD55LE
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4ac17b2bc63mr93716175e9.10.1793405775063;
        Fri, 30 Oct 2026 17:16:15 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 53/55] apr-util: Fix CVE-2026-34501
Date: Sat, 31 Oct 2026 01:15:14 +0100
Message-ID: <a6855255fcd2e25c592783014b86f8c154673c0e.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249128
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream Redis response-length and error-checking fix [1]
to address CVE-2026-34501 [2].

[1] https://github.com/apache/apr-util/commit/e8f36bd5f1cc1c82bed1ae52d5699a4c610251c2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-34501

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../apr/apr-util/CVE-2026-34501.patch         | 128 ++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-34501.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-34501.patch b/meta/recipes-support/apr/apr-util/CVE-2026-34501.patch
new file mode 100644
index 00000000000..0056e621718
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2026-34501.patch
@@ -0,0 +1,128 @@
+From e8f36bd5f1cc1c82bed1ae52d5699a4c610251c2 Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Mon, 3 Aug 2026 12:28:37 +0000
+Subject: [PATCH] Merge r1936809 from aprutil 1.7.x:
+
+Merge r1936808 from apr trunk:
+
+apr_redis error checking
+
+Submitted By: jfclere
+Reviewed By: jfclere, jorton, covener
+
+
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936810 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2026-34501
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/e8f36bd5f1cc1c82bed1ae52d5699a4c610251c2]
+
+(cherry picked from commit e8f36bd5f1cc1c82bed1ae52d5699a4c610251c2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ redis/apr_redis.c | 54 +++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 43 insertions(+), 11 deletions(-)
+
+diff --git a/redis/apr_redis.c b/redis/apr_redis.c
+index 8d01fdd6..e7fe2071 100644
+--- a/redis/apr_redis.c
++++ b/redis/apr_redis.c
+@@ -853,26 +853,42 @@ APU_DECLARE(apr_status_t) apr_redis_setex(apr_redis_t *rc,
+     return rv;
+ }
+ 
++/* Redis upstream default is 512Mb. This code will try to read the entire
++ * response into a brigade, and then copy that into a pool, so impose
++ * some reasonable limit since RAM consumption will be double this.
++ * https://redis.io/docs/latest/develop/reference/protocol-spec/#bulk-strings
++ */
++#ifndef APR_REDIS_MAX_BULK_LEN
++#define APR_REDIS_MAX_BULK_LEN (64 * 1024 * 1024)
++#endif
++
+ static apr_status_t grab_bulk_resp(apr_redis_server_t *rs, apr_redis_t *rc,
+                                    apr_redis_conn_t *conn, apr_pool_t *p,
+                                    char **baton, apr_size_t *new_length)
+ {
+-    char *length;
++    /* conn->buffer contains "$<length>\r\n" */
++    char *length = conn->buffer + 1;
+     char *last;
+     apr_status_t rv;
+     apr_size_t len = 0;
++    long val;
++
+     *new_length = 0;
++    *baton = NULL;
+ 
+-    length = apr_strtok(conn->buffer + 1, " ", &last);
+-    if (length) {
+-        len = strtol(length, (char **) NULL, 10);
++    errno = 0;
++    last = NULL;
++    val = strtol(length, &last, 10);
++    if (errno || last == NULL || last == length || *last != '\r'
++        || val < 0 || val > APR_REDIS_MAX_BULK_LEN) {
++        rs_bad_conn(rs, conn);
++        if (rc)
++            apr_redis_disable_server(rc, rs);
++        return val > APR_REDIS_MAX_BULK_LEN ? APR_ENOSPC : APR_EGENERAL;
+     }
++    len = (apr_size_t)val;
+ 
+-    if (len == 0) {
+-        *new_length = 0;
+-        *baton = NULL;
+-    }
+-    else {
++    if (len) {
+         apr_bucket_brigade *bbb;
+         apr_bucket *e;
+ 
+@@ -907,6 +923,11 @@ static apr_status_t grab_bulk_resp(apr_redis_server_t *rs, apr_redis_t *rc,
+ 
+         conn->bb = bbb;
+ 
++        if (len < 2) {
++            *baton = NULL;
++            *new_length = 0;
++            return APR_EGENERAL;
++        }
+         *new_length = len - 2;
+         (*baton)[*new_length] = '\0';
+     }
+@@ -992,6 +1013,10 @@ APU_DECLARE(apr_status_t) apr_redis_getp(apr_redis_t *rc,
+     }
+     else if (strncmp(RS_TYPE_STRING, conn->buffer, RS_TYPE_STRING_LEN) == 0) {
+         rv = grab_bulk_resp(rs, rc, conn, p, baton, new_length);
++        if (rv != APR_SUCCESS) {
++            /* grab_bulk_resp already called rs_bad_conn; do not also release */
++            return rv;
++        }
+     }
+     else {
+         rv = APR_EGENERAL;
+@@ -1172,12 +1197,19 @@ apr_redis_info(apr_redis_server_t *rs, apr_pool_t *p, char **baton)
+         return rv;
+     }
+ 
+-    if (strncmp(RS_TYPE_STRING, conn->buffer, RS_TYPE_STRING_LEN) == 0) {
++    if (strncmp(RS_NOT_FOUND_GET, conn->buffer, RS_NOT_FOUND_GET_LEN) == 0) {
++        rv = APR_NOTFOUND;
++    }
++    else if (strncmp(RS_TYPE_STRING, conn->buffer, RS_TYPE_STRING_LEN) == 0) {
+         apr_size_t nl;
+         rv = grab_bulk_resp(rs, NULL, conn, p, baton, &nl);
++        if (rv != APR_SUCCESS) {
++            /* grab_bulk_resp already called rs_bad_conn; do not also release */
++            return rv;
++        }
+     } else {
+         rs_bad_conn(rs, conn);
+-        rv = APR_EGENERAL;
++        return APR_EGENERAL;
+     }
+ 
+     rs_release_conn(rs, conn);
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 1b7beda9042..8d751e7b7a1 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://CVE-2025-49506.patch \
            file://CVE-2026-32327-dependent.patch \
            file://CVE-2026-32327.patch \
+		   file://CVE-2026-34501.patch \
            file://run-ptest \
            "
 
