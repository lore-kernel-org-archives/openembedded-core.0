Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8272.1793268689233541804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 03:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Jkil2ydf;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6278; q=dns/txt;
  s=iport01; t=1793268689; x=1794478289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7/uqb/rrNArjAZkKsxcT0mzydWgfFr0fqbwc9HgF7Jc=;
  b=Jkil2ydfkun+2zcPw1HFZ7q/qBKRnjy9iEnkHByLs0pdNZ2t84oRe1fV
   RmUcBLVrepIxtufseAo02uMlClDxVtJ3REmBe2VyLOaG/MaZ4GToNpZWM
   L53HELnix0O6UOAWGHEM0h5fOuBchQgw4+kUf12epYgFrT+00ObBkE3R4
   ijcuaUdvW1bbguZVR5L9QWUFUTwiQeuPrFHI59548eQ561O4UukIvEFox
   cbmXpYQbMZ+pDEP4Man52JravBU66k4xyt+eqmu0sa8jR7p2fpTwnBbFC
   4UOnf6P2eNqm/J0uxi1PdbK2sDV8r5gW++MsHYgn1m2X0a93lz0J12iuv
   w==;
X-CSE-ConnectionGUID: K86b3xHuRW2tnQ71QKBfjQ==
X-CSE-MsgGUID: ptncb/IwTPSQREkw7M9ZyQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgCBGuNq/4//Ja1aglmCV3VhQkmWSwOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4cAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAIBEbRAgXkzgQGDK?=
 =?us-ascii?q?QE/AkNQ2zMBCxQBBYEzhUCII10YAYR9JxsbgXKBFYE7gi6BBYFcAQGIJQSCI?=
 =?us-ascii?q?noSgVoejRACh1NIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEegRmBB12BKylgASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExouC?=
 =?us-ascii?q?4EaNTwJJkEVDGQLGgViCAINDHY5EDEgJjIEAx0YDUgRLDcVGQQ+bgeRXYIcc?=
 =?us-ascii?q?nsTAQckgUM6FymlZaEPCiiDdowilToaM6pvC5h9jgqWD0GEaYFoPIEoHwsHc?=
 =?us-ascii?q?BVIAYJZCUoZD445g2uBf4MUyUckNQIBCDIBAQcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:6gzir6ymts4k9xk5r9N6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUPz
 2cfUGDTOf7YYzT3f91waN6yp0kF7cXTnYNlSwc4qFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsaDNMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGJmY4dD6sZqO14U6
 fohd2k0TTqNhdvjldpXSsE07igiBNPgMIVavjRryivUSK54B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOHWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OWxaYeNIYPWHK25mG6Au
 mTN9SPYHS0iD+Wl5DmarVf9tP72yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7HQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:WZEaW68E7BoKKurMCOxuk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:dZJID22H3O+BiTt6YwL6DLxfOZB7eCbN7GrqHBWkD182EYS2Y1GSwfYx
X-Talos-MUID: 9a23:00+HYwQHxvSsYgcVRXT0mDdpPoBJ/JiWM3k3vJYZ5OzVBz1JbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,184,1787011200"; 
   d="scan'208";a="541503741"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Oct 2026 10:11:28 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 2DEEF18000269;
	Thu, 29 Oct 2026 10:11:28 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id C7E4FCC124F; Thu, 29 Oct 2026 03:11:27 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v4 5/5] apr-util: Fix CVE-2026-34502
Date: Thu, 29 Oct 2026 03:11:27 -0700
Message-Id: <20261029101127.2240608-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261029101127.2240608-1-hthakar@cisco.com>
References: <20261029101127.2240608-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 10:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248923
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream memcache validation fix [1] and its follow-up
parsing correction [2] to address CVE-2026-34502 [3].

[1] https://github.com/apache/apr-util/commit/f1c98dd0847c43375daf3789c936685adbc6d872
[2] https://github.com/apache/apr-util/commit/997c02ce5b9db44083c580e3e47095f5ac4524ae
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-34502

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../apr/apr-util/CVE-2026-34502_p1.patch      | 106 ++++++++++++++++++
 .../apr/apr-util/CVE-2026-34502_p2.patch      |  38 +++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   2 +
 3 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-34502_p1.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-34502_p2.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-34502_p1.patch b/meta/recipes-support/apr/apr-util/CVE-2026-34502_p1.patch
new file mode 100644
index 0000000000..d4c6cb39b4
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
index 0000000000..844ad8109d
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
index 8d751e7b7a..f694ae01eb 100644
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
 
-- 
2.35.6

