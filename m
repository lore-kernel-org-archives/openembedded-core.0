Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3756.1793405777492851342
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=TXJxI+st;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso13072355e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405776; x=1794010576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J6cU1KWgohvQIsXRaxumf1PfocdRspIWit2FnUnQWak=;
        b=TXJxI+st9nMIndPErwrGi/qwRG+zNRGrmWHjuY5NNn3iTjGaZ7aH8LVPGlzIsKI47E
         sNT7k1vkGmPn/kG4UID0Cc8PIIBlXtc/JJomv4ALrhxRuxwvJnoqAB/G7poWv5xndp8A
         cpdgBiHagqlfnCYtm1qWKSzrO+/Z8zyl32ychOcOMEDUouFAFZJFYaoUBU6sUJZ+cZo8
         6VP87GKuvSvCpke/jtM1H1DUOYm3fmqXSPHnpCtEW6e0i0qOhCLssnNlAOMi9OUSLwMR
         aCLvjH2UaH5U4OmDnrrumd1IALxV8hCJBckiEWW/UvWi++2H2ORc7jTbTzRjSyeJW6Q6
         o8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405776; x=1794010576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J6cU1KWgohvQIsXRaxumf1PfocdRspIWit2FnUnQWak=;
        b=CpC1vqVhW15DX5JIh/j4PAxppZYdv2L2goSGBED6/t8Hx8ftRqhduW9fsxjcSKf4WQ
         STGDEogCcVfJa17F8Q1S5XfBK0KLqMy5SCnE5k6yp4jyHuMVpWLsTs91iygEp2zIfy8f
         NZxFsIiOtPRlZUxTr/IHIYi5hro2mouyD/amA44bpoQc87+/HSdCWWBUBYJnbKNjxUkv
         /SZsfCO9pP9aPuIqQogqQFrPjWLl+lzr1zGF4w6wdQS9kHI+n1pMbQ1kfYhA551L9Edm
         CzpgGutZ5ShQhjoCpa7cHB8HnapjAD7hBtO6n7gHihfrSWn9Vv6DnOxvGb/YIaMoBe0S
         Mcyg==
X-Gm-Message-State: AFq9FYIdf/uBRxCmqHNoODp18NtjN1NwSLvtbd61Zpjhg/85Z4C/3PNX
	Wu3N9qK0Cmt+yQVcSt8vtlw7ZCXG3m7Ug93p06r8P9cbvjwPjI8aR1YjTLeaBoWuSdXLOJ9w+Xc
	50pLbdPs=
X-Gm-Gg: AYBFou0hAvfn3wf3TvOEEXelF6ZzpD3jKi2LdgtMksAYEij+CMeTJ1ZtoYckbcXrEaX
	sadFOTHiBJ+lzDpCx4H4WtFNYe2KWACVxZU5+crsIre/zG8qZSKxTE6u8xJLClGkFHuGw4SCyDt
	/JRRBXX1b/avy4KihX2yFUvID/qIYKYMkwiLvbFHeM2uQPhxTPwaA6gnD8oUENrkPIHleZkxIHz
	FyqFo1WQUljfew439IRO1Kw/hv+9RLT5BsCY0LnRrl+Aqv03X1+kHw0lHPwrWaxmMGHZt4rXpqh
	T22Aka/5J86g1ZfTPwNOiygLKYR+Cmg6jDGZMd5exulenBVuj48y5rdVKIA5FiNN4fBsI0o4HHq
	EcGwMnowlf7XZrzytIvQ7y28rrauXLGuB4r5QyK1bHXQdJAMsh6S8aHzM5MS+5xjxrOuGmSbu2w
	46/bYZdYtI76jouBs2bCsn2dnzEPN/GVi3Y9Jjkfs1auNxNkBZHhknY/fq7kVsGUy/vwVysZW8d
	sDKjahXtjfWA8+2dIem5TrL08vEigzjdee2qD9vaM1kmo+9SU7ndfSQIMGC58CB5MgCKqAuutl0
	YzfDlNoboon3JkVEKdjusmGaxh5Yh+e0r2s1X04B3FXUHcFxmT/of49/iRHjJMlP9z0aS9+pk6/
	JABWlffVFVuqgEUQIFRYA4u8cq4ma
X-Received: by 2002:a05:600c:870f:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4ac1899348bmr77127115e9.30.1793405775714;
        Fri, 30 Oct 2026 17:16:15 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 54/55] apr-util: Fix CVE-2026-34502
Date: Sat, 31 Oct 2026 01:15:15 +0100
Message-ID: <bea81d9b46442cb146b4aa0fecb3ab1ea3da289f.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249129
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream memcache validation fix [1] and its follow-up
parsing correction [2] to address CVE-2026-34502 [3].

[1] https://github.com/apache/apr-util/commit/f1c98dd0847c43375daf3789c936685adbc6d872
[2] https://github.com/apache/apr-util/commit/997c02ce5b9db44083c580e3e47095f5ac4524ae
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-34502

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../apr/apr-util/CVE-2026-34502_p1.patch      | 106 ++++++++++++++++++
 .../apr/apr-util/CVE-2026-34502_p2.patch      |  38 +++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   2 +
 3 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-34502_p1.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-34502_p2.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-34502_p1.patch b/meta/recipes-support/apr/apr-util/CVE-2026-34502_p1.patch
new file mode 100644
index 00000000000..d4c6cb39b40
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2026-34502_p1.patch
@@ -0,0 +1,106 @@
+From f1c98dd0847c43375daf3789c936685adbc6d872 Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Mon, 3 Aug 2026 12:33:18 +0000
+Subject: [PATCH] Merge r1936812 from aprutil 1.7.x:
+
+Merge r1936811 from apr trunk:
+
+apr_memcache: error checking
+
+Reviewed By: covener, jorton, jfclere
+
+
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936813 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2026-34502
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/f1c98dd0847c43375daf3789c936685adbc6d872]
+
+(cherry picked from commit f1c98dd0847c43375daf3789c936685adbc6d872)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ memcache/apr_memcache.c | 31 ++++++++++++++++++++++++++++---
+ 1 file changed, 28 insertions(+), 3 deletions(-)
+
+diff --git a/memcache/apr_memcache.c b/memcache/apr_memcache.c
+index 2c7bd1de..137be778 100644
+--- a/memcache/apr_memcache.c
++++ b/memcache/apr_memcache.c
+@@ -595,6 +595,11 @@ static apr_status_t get_server_line(apr_memcache_conn_t *conn)
+     conn->blen = bsize;
+     conn->buffer[bsize] = '\0';
+ 
++    /* Validate CRLF line termination to prevent integer underflow attacks */
++    if (bsize < 2 || conn->buffer[bsize-2] != '\r' || conn->buffer[bsize-1] != '\n') {
++        return APR_EGENERAL;
++    }
++
+     return apr_brigade_cleanup(conn->tb);
+ }
+ 
+@@ -1087,9 +1092,14 @@ apr_memcache_version(apr_memcache_server_t *ms,
+     }
+ 
+     if (strncmp(MS_VERSION, conn->buffer, MS_VERSION_LEN) == 0) {
+-        *baton = apr_pstrmemdup(p, conn->buffer+MS_VERSION_LEN+1, 
+-                                conn->blen - MS_VERSION_LEN - 2);
+-        rv = APR_SUCCESS;
++        if (conn->blen < MS_VERSION_LEN + 2) {
++            rv = APR_EGENERAL;
++        }
++        else {
++            *baton = apr_pstrmemdup(p, conn->buffer+MS_VERSION_LEN+1, 
++                                    conn->blen - MS_VERSION_LEN - 2);
++            rv = APR_SUCCESS;
++       } 
+     }
+     else {
+         rv = APR_EGENERAL;
+@@ -1555,23 +1565,35 @@ apr_memcache_multgetp(apr_memcache_t *mc,
+ static const char *stat_read_string(apr_pool_t *p, char *buf, apr_size_t len)
+ {
+     /* remove trailing \r\n and null char */
++    if (len < 2) {
++        return apr_pstrdup(p, "");
++    }
+     return apr_pstrmemdup(p, buf, len-2);
+ }
+ 
+ static apr_uint32_t stat_read_uint32(apr_pool_t *p, char *buf, apr_size_t  len)
+ {
++    if (len < 2) {
++        return 0;
++    }
+     buf[len-2] = '\0';
+     return atoi(buf);
+ }
+ 
+ static apr_uint64_t stat_read_uint64(apr_pool_t *p, char *buf, apr_size_t  len)
+ {
++    if (len < 2) {
++        return 0;
++    }
+     buf[len-2] = '\0';
+     return apr_atoi64(buf);
+ }
+ 
+ static apr_time_t stat_read_time(apr_pool_t *p, char *buf, apr_size_t  len)
+ {
++    if (len < 2) {
++        return 0;
++    }
+     buf[len-2] = '\0';
+     return apr_time_from_sec(atoi(buf));
+ }
+@@ -1583,6 +1605,9 @@ static apr_time_t stat_read_rtime(apr_pool_t *p, char *buf, apr_size_t  len)
+     char *usecs;
+     const char *sep = ":.";
+ 
++    if (len < 2) {
++        return apr_time_make(0, 0);
++    }
+     buf[len-2] = '\0';
+ 
+     secs = apr_strtok(buf, sep, &tok);
diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-34502_p2.patch b/meta/recipes-support/apr/apr-util/CVE-2026-34502_p2.patch
new file mode 100644
index 00000000000..844ad8109d4
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2026-34502_p2.patch
@@ -0,0 +1,38 @@
+From 997c02ce5b9db44083c580e3e47095f5ac4524ae Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Fri, 7 Aug 2026 14:23:29 +0000
+Subject: [PATCH] fix memcache version parsing
+
+partial port of 1936966 from trunk
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936975 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2026-34502
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/997c02ce5b9db44083c580e3e47095f5ac4524ae]
+
+(cherry picked from commit 997c02ce5b9db44083c580e3e47095f5ac4524ae)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ memcache/apr_memcache.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/memcache/apr_memcache.c b/memcache/apr_memcache.c
+index 137be778..74146712 100644
+--- a/memcache/apr_memcache.c
++++ b/memcache/apr_memcache.c
+@@ -1092,12 +1092,12 @@ apr_memcache_version(apr_memcache_server_t *ms,
+     }
+ 
+     if (strncmp(MS_VERSION, conn->buffer, MS_VERSION_LEN) == 0) {
+-        if (conn->blen < MS_VERSION_LEN + 2) {
++        if (conn->blen < MS_VERSION_LEN + 4) {
+             rv = APR_EGENERAL;
+         }
+         else {
+             *baton = apr_pstrmemdup(p, conn->buffer+MS_VERSION_LEN+1, 
+-                                    conn->blen - MS_VERSION_LEN - 2);
++                                    conn->blen - MS_VERSION_LEN - 3);
+             rv = APR_SUCCESS;
+        } 
+     }
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 8d751e7b7a1..f694ae01eb9 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -17,6 +17,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://CVE-2026-32327-dependent.patch \
            file://CVE-2026-32327.patch \
 		   file://CVE-2026-34501.patch \
+		   file://CVE-2026-34502_p1.patch \
+		   file://CVE-2026-34502_p2.patch \
            file://run-ptest \
            "
 
