Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8271.1793268689191229414
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 03:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ilKDAlMs;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5240; q=dns/txt;
  s=iport01; t=1793268689; x=1794478289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zWx+h9goBnYFNRVgoyAzoBRQh1/omfkBjE2HJDrl2dM=;
  b=ilKDAlMsW8P28q1TSf/ufsndn1iiSAc68UweapsZXz7TE1vBdxRvThWI
   EMXaP3t+ownLhus7GrA2EB0SepkG9I+ZNH9nZACHkP9PxtiuISQsDKFMN
   YsHX13i0lgNIQVBjFCaM/R2GDvWLO8lKnqNZu8zI+cmkYb0yZ0sOjcOD/
   WNMPjUm1l3Ru2VVQvSG3aoWdJ8tsuAuS4wrzmF4mJkZIcxx7oNRgcSOpl
   c/UhUJ+ZUSiJR+UESiEQBVrfWuC1dRlC+uOlTNaFZCvlfxVw3p2Xra2Oq
   80T9Sl7xT2IaQ4x03OVKjF/FpLIEn51mzHG7//aEVT05JEO6UJu4jv8Xs
   g==;
X-CSE-ConnectionGUID: vYE/MhxhQ1WkIes9MZhjJA==
X-CSE-MsgGUID: rObE7XTVRCOm1ki5iGkcwQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgD+GuNq/5L/Ja1aglmCV3VhQkmWSwOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOHAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQCARG0UIF5M4EBg?=
 =?us-ascii?q?ykBPwICQAFQ2zMBCxQBBYEzhUCII10YAYR9JxsbgXKBFYNpgQWBXAEBAoE2h?=
 =?us-ascii?q?m0EgiJ6EoFaHo0QAodTSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgR2BHoEZgQddgSspYAEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLguBGjU8CSZBFQxkCxoFYggCDQx2ORAxICYyBAMdGA1IESw3FRkEPm4Hk?=
 =?us-ascii?q?V2CHHIxMBoTASuCFCmTJgEHkjehDwoog3aMIpU6GjOEBJQXklQLmH2OCpZQh?=
 =?us-ascii?q?GmBaDyBKB8LB3AVSAGCWQlKGQ+OOYNrgX9lgi/JRyQ1AgEIMgEBBwIHDgMLg?=
 =?us-ascii?q?WiQAYF9AQE?=
IronPort-Data: A9a23:PBAaLKPocNOma/vvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUoq1WYAy
 WNMX2jTOquMM2SmLo1zat+38R8AucfSxoRiTnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gW8sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+tfIQYTPZ0Yw79IAkBD7
 q09GjAPTDnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMnwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FEtieayYIuLJrRmQ+1PuUy1+
 VL6wV7SJRRDN93CyBWG+W2V07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:sDpnG6yigHnbyB9vWjh7KrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: 9a23:ZhnshGFJaAduMwn0qmJ5xWNTP8A1ckSE83TxLlTpLFRpSp+8HAo=
X-Talos-MUID: 9a23:BRGKCAUdrb45Vn/q/CXLjhw9BPtW2Y+JDRkOkMgHlMqPKhUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,184,1787011200"; 
   d="scan'208";a="541678964"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Oct 2026 10:11:28 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 2CD5B1800023D;
	Thu, 29 Oct 2026 10:11:28 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id C360ECC124E; Thu, 29 Oct 2026 03:11:27 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v4 4/5] apr-util: Fix CVE-2026-34501
Date: Thu, 29 Oct 2026 03:11:26 -0700
Message-Id: <20261029101127.2240608-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261029101127.2240608-1-hthakar@cisco.com>
References: <20261029101127.2240608-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 10:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248922
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream Redis response-length and error-checking fix [1]
to address CVE-2026-34501 [2].

[1] https://github.com/apache/apr-util/commit/e8f36bd5f1cc1c82bed1ae52d5699a4c610251c2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-34501

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../apr/apr-util/CVE-2026-34501.patch         | 128 ++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-34501.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-34501.patch b/meta/recipes-support/apr/apr-util/CVE-2026-34501.patch
new file mode 100644
index 0000000000..0056e62171
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
index 1b7beda904..8d751e7b7a 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://CVE-2025-49506.patch \
            file://CVE-2026-32327-dependent.patch \
            file://CVE-2026-32327.patch \
+		   file://CVE-2026-34501.patch \
            file://run-ptest \
            "
 
-- 
2.35.6

