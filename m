Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5460.1795179858007862216
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DTsJKWIB;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9503; q=dns/txt;
  s=iport01; t=1795179858; x=1796389458;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1gwuxIpIzjwLV3gplO1wSNd46IQMANuyuJmbmKW7O1I=;
  b=DTsJKWIBknvOZoibvXgT7ErXOejH33VjmweO8eOo8m7vLctYg/nX9J9C
   Ghzpwui+tL0BmJOenzXuM4y+Torrod4WivcK2ymiOcBzEw+antAGANIlx
   lbxtFbcKCf76RccEylIf61L7Ou7oz16qkiKS4Qjv8uExHBI1F02HSPBRe
   lzD7bxzuzGtXDpdQRcpkMRwIiD0ZyYtnNywVFX0quhhTRPnXkgbCAMj7R
   LihjQfkNMyA1o/OP1Lz5CXsAiDnvzEe+swALNinRf6H1G8SMz0EqJ2WKp
   uzZ01Ws9Y4ixyDufIh0iPWOE31fHV4pnki8QSeW+R7ljIxdTVmAsZIS0y
   A==;
X-CSE-ConnectionGUID: yemrc/rpRYmmyKbiLI/cXg==
X-CSE-MsgGUID: xDUY61iXQVOCvyYgFEO3LQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgAxRABr/9RK/pBRCYJZgld1YUJJlCqCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo4hAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIZFisjCBmDAgGCdAIBEQa4Shs3g?=
 =?us-ascii?q?XkzgQGDKQExBQkCAkABUNszAQsUAYE4hUKIJF0YAYR9JxsbgXKEf4EFgVwCA?=
 =?us-ascii?q?QEYgRp8hXYEgg0VgQyBVB5kCYIXiVsaAoFPgVuGS0iBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQ?=
 =?us-ascii?q?Q4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvB?=
 =?us-ascii?q?RomPhsKgQwnHx4bDgIfEAYNGA1IESw3FRkEPm4Hk2yDFwIBFUstASkCf4E7A?=
 =?us-ascii?q?QIMARSTAwqQFYIhoREKKIN5jCSVOhozqnKZCI4KlgRNhGqBaDyBWXAVO4JnC?=
 =?us-ascii?q?RY0GQ+OLgsLg2CFE4Etx3kiIzUCCTIBAQcCBw4DC4FokCaBWAEB?=
IronPort-Data: A9a23:bMn5UK6YL2Uf4gbrr3h60AxRtGzGchMFZxGqfqrLsTDasY5as4F+v
 mVNWD+AOv+La2OgL94iO4Tk/UsB7ZSBm4IyGwVrq39gZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOs/vZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eLIAd4O0wG3l0x
 PkdORMHbzSiwOmGz+fuIgVsrpxLwMjDNY4F/3UlxjbDALN/GNbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaOkcn1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FboCPI43XH5U9ckCwt
 k77zjqgAyEjCvu01yu0/VyBobTrpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl/AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:NCIazKmZwJEmJShtyguI+Vbzv2jpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3Ac1mnA2rj4FboG/qDK5SBBMTmUdEod2fWi23IGX6?=
 =?us-ascii?q?9DHdKQryxaBibyKwxxg=3D=3D?=
X-Talos-MUID: 9a23:yEY4SgWOXjuOgO3q/C/AuQA8bcZY2pqJI14coJoolu7fERUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,223,1787011200"; 
   d="scan'208";a="62219528"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 13:04:15 +0000
Received: from sjc-ads-8099.cisco.com (sjc-ads-8099.cisco.com [171.68.208.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 6FCCD1800040B
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:04:15 +0000 (GMT)
Received: by sjc-ads-8099.cisco.com (Postfix, from userid 1887503)
	id 23B25CBF202; Fri, 20 Nov 2026 05:04:14 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][scarthgap][PATCH 2/4] curl: Fix CVE-2026-8932
Date: Fri, 20 Nov 2026 05:04:12 -0800
Message-Id: <20261120130414.822854-3-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120130414.822854-1-devanshp@cisco.com>
References: <20261120130414.822854-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-8099.cisco.com [171.68.208.137];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.68.208.137, sjc-ads-8099.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250781
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix commit as referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/7541ae569d82fb308a5e2d94916027da4fa3ba3e
[2] https://curl.se/docs/CVE-2026-8932.html
[3] https://www.cve.org/CVERecord?id=CVE-2026-8932

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-8932.patch             | 170 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 171 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8932.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8932.patch b/meta/recipes-support/curl/curl/CVE-2026-8932.patch
new file mode 100644
index 0000000..c7a6c4f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8932.patch
@@ -0,0 +1,170 @@
+From 8b62ee5391b03f780223bfc0780c9e14f01d34f2 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <MegaManSec@users.noreply.github.com>
+Date: Tue, 19 May 2026 11:47:50 +0200
+Subject: [PATCH] tls: fix incomplete mTLS config in conn reuse and session
+ cache
+
+cert_type, key, key_type, key_passwd and key_blob lived in
+ssl_config_data but not in ssl_primary_config, so they were invisible to
+match_ssl_primary_config() and to the TLS session cache peer key.
+
+Two easy handles sharing a connection pool could reuse each other's
+authenticated connections when they differed only on SSLKEY, SSLKEYTYPE,
+KEYPASSWD, SSLCERTTYPE or SSLKEYBLOB. The second handle would silently
+inherit the first handle's authenticated identity.
+
+Promote all five fields into ssl_primary_config so the conn-reuse
+predicate and session cache key cover the complete client credential
+set. Also replace the fixed ":CCERT" session cache marker with the
+actual clientcert path so sessions are not shared across different
+client certificates.
+
+Verified by test 3303 and 3304
+
+Reported-By: Joshua Rogers (AISLE Research)
+Closes #21667
+
+CVE: CVE-2026-8932
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7541ae569d82fb308a5e2d94916027da4fa3ba3e]
+
+Backport Changes:
+- Add the credential fields in upstream order and initialize primary
+  directly. Retain the old ssl_config_data fields as backend aliases.
+  The omitted lib/ldap.c, lib/vssh/{libssh,libssh2}.c and lib/vtls/
+  {gtls,mbedtls,openssl,rustls,schannel,wolfssl}.c hunks only relocate
+  equivalent credential reads. Use the old Curl_safefree name.
+- Apply session isolation through the existing vtls.c primary-config
+  clone/match paths. 8.7.1 lacks lib/vtls/vtls_scache.{c,h}; its cache
+  already compares the actual clientcert path, without a peer-key API.
+- Omit tests/data/{Makefile.am,test3303,test3304} and
+  tests/unit/{Makefile.inc,unit3303.c,unit3304.c}.
+
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/urldata.h   |  5 +++++
+ lib/vtls/vtls.c | 47 ++++++++++++++++++++++++++++++++++++-----------
+ 2 files changed, 41 insertions(+), 11 deletions(-)
+
+diff --git a/lib/urldata.h b/lib/urldata.h
+index d2d9424..957fef7 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -290,9 +290,14 @@ struct ssl_primary_config {
+   char *cipher_list13;   /* list of TLS 1.3 cipher suites to use */
+   char *pinned_key;
+   char *CRLfile;         /* CRL to check certificate revocation */
++  char *cert_type;       /* format for certificate (default: PEM) */
++  char *key;             /* private key filename */
++  char *key_type;        /* format for private key (default: PEM) */
++  char *key_passwd;      /* plain text private key password */
+   struct curl_blob *cert_blob;
+   struct curl_blob *ca_info_blob;
+   struct curl_blob *issuercert_blob;
++  struct curl_blob *key_blob;
+ #ifdef USE_TLS_SRP
+   char *username; /* TLS username (for, e.g., SRP) */
+   char *password; /* TLS password (for, e.g., SRP) */
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index d13a3cb..969a8a2 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -187,6 +187,7 @@ match_ssl_primary_config(struct Curl_easy *data,
+      blobcmp(c1->cert_blob, c2->cert_blob) &&
+      blobcmp(c1->ca_info_blob, c2->ca_info_blob) &&
+      blobcmp(c1->issuercert_blob, c2->issuercert_blob) &&
++     blobcmp(c1->key_blob, c2->key_blob) &&
+      Curl_safecmp(c1->CApath, c2->CApath) &&
+      Curl_safecmp(c1->CAfile, c2->CAfile) &&
+      Curl_safecmp(c1->issuercert, c2->issuercert) &&
+@@ -199,7 +200,11 @@ match_ssl_primary_config(struct Curl_easy *data,
+      strcasecompare(c1->cipher_list13, c2->cipher_list13) &&
+      strcasecompare(c1->curves, c2->curves) &&
+      strcasecompare(c1->CRLfile, c2->CRLfile) &&
+-     strcasecompare(c1->pinned_key, c2->pinned_key))
++     strcasecompare(c1->pinned_key, c2->pinned_key) &&
++     curl_strequal(c1->cert_type, c2->cert_type) &&
++     Curl_safecmp(c1->key, c2->key) &&
++     curl_strequal(c1->key_type, c2->key_type) &&
++     !Curl_timestrcmp(c1->key_passwd, c2->key_passwd))
+     return TRUE;
+ 
+   return FALSE;
+@@ -234,6 +239,7 @@ static bool clone_ssl_primary_config(struct ssl_primary_config *source,
+   CLONE_BLOB(cert_blob);
+   CLONE_BLOB(ca_info_blob);
+   CLONE_BLOB(issuercert_blob);
++  CLONE_BLOB(key_blob);
+   CLONE_STRING(CApath);
+   CLONE_STRING(CAfile);
+   CLONE_STRING(issuercert);
+@@ -243,6 +249,10 @@ static bool clone_ssl_primary_config(struct ssl_primary_config *source,
+   CLONE_STRING(pinned_key);
+   CLONE_STRING(curves);
+   CLONE_STRING(CRLfile);
++  CLONE_STRING(cert_type);
++  CLONE_STRING(key);
++  CLONE_STRING(key_type);
++  CLONE_STRING(key_passwd);
+ #ifdef USE_TLS_SRP
+   CLONE_STRING(username);
+   CLONE_STRING(password);
+@@ -263,8 +273,13 @@ static void Curl_free_primary_ssl_config(struct ssl_primary_config *sslc)
+   Curl_safefree(sslc->cert_blob);
+   Curl_safefree(sslc->ca_info_blob);
+   Curl_safefree(sslc->issuercert_blob);
++  Curl_safefree(sslc->key_blob);
+   Curl_safefree(sslc->curves);
+   Curl_safefree(sslc->CRLfile);
++  Curl_safefree(sslc->cert_type);
++  Curl_safefree(sslc->key);
++  Curl_safefree(sslc->key_type);
++  Curl_safefree(sslc->key_passwd);
+ #ifdef USE_TLS_SRP
+   Curl_safefree(sslc->username);
+   Curl_safefree(sslc->password);
+@@ -291,12 +306,17 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+   data->set.ssl.primary.username = data->set.str[STRING_TLSAUTH_USERNAME];
+   data->set.ssl.primary.password = data->set.str[STRING_TLSAUTH_PASSWORD];
+ #endif
+-  data->set.ssl.cert_type = data->set.str[STRING_CERT_TYPE];
+-  data->set.ssl.key = data->set.str[STRING_KEY];
+-  data->set.ssl.key_type = data->set.str[STRING_KEY_TYPE];
+-  data->set.ssl.key_passwd = data->set.str[STRING_KEY_PASSWD];
++  data->set.ssl.primary.cert_type = data->set.str[STRING_CERT_TYPE];
++  data->set.ssl.primary.key = data->set.str[STRING_KEY];
++  data->set.ssl.primary.key_type = data->set.str[STRING_KEY_TYPE];
++  data->set.ssl.primary.key_passwd = data->set.str[STRING_KEY_PASSWD];
+   data->set.ssl.primary.clientcert = data->set.str[STRING_CERT];
+-  data->set.ssl.key_blob = data->set.blobs[BLOB_KEY];
++  data->set.ssl.primary.key_blob = data->set.blobs[BLOB_KEY];
++  data->set.ssl.cert_type = data->set.ssl.primary.cert_type;
++  data->set.ssl.key = data->set.ssl.primary.key;
++  data->set.ssl.key_type = data->set.ssl.primary.key_type;
++  data->set.ssl.key_passwd = data->set.ssl.primary.key_passwd;
++  data->set.ssl.key_blob = data->set.ssl.primary.key_blob;
+ 
+ #ifndef CURL_DISABLE_PROXY
+   data->set.proxy_ssl.primary.CApath = data->set.str[STRING_SSL_CAPATH_PROXY];
+@@ -316,12 +336,17 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+     data->set.blobs[BLOB_SSL_ISSUERCERT_PROXY];
+   data->set.proxy_ssl.primary.CRLfile =
+     data->set.str[STRING_SSL_CRLFILE_PROXY];
+-  data->set.proxy_ssl.cert_type = data->set.str[STRING_CERT_TYPE_PROXY];
+-  data->set.proxy_ssl.key = data->set.str[STRING_KEY_PROXY];
+-  data->set.proxy_ssl.key_type = data->set.str[STRING_KEY_TYPE_PROXY];
+-  data->set.proxy_ssl.key_passwd = data->set.str[STRING_KEY_PASSWD_PROXY];
++  data->set.proxy_ssl.primary.cert_type = data->set.str[STRING_CERT_TYPE_PROXY];
++  data->set.proxy_ssl.primary.key = data->set.str[STRING_KEY_PROXY];
++  data->set.proxy_ssl.primary.key_type = data->set.str[STRING_KEY_TYPE_PROXY];
++  data->set.proxy_ssl.primary.key_passwd = data->set.str[STRING_KEY_PASSWD_PROXY];
+   data->set.proxy_ssl.primary.clientcert = data->set.str[STRING_CERT_PROXY];
+-  data->set.proxy_ssl.key_blob = data->set.blobs[BLOB_KEY_PROXY];
++  data->set.proxy_ssl.primary.key_blob = data->set.blobs[BLOB_KEY_PROXY];
++  data->set.proxy_ssl.cert_type = data->set.proxy_ssl.primary.cert_type;
++  data->set.proxy_ssl.key = data->set.proxy_ssl.primary.key;
++  data->set.proxy_ssl.key_type = data->set.proxy_ssl.primary.key_type;
++  data->set.proxy_ssl.key_passwd = data->set.proxy_ssl.primary.key_passwd;
++  data->set.proxy_ssl.key_blob = data->set.proxy_ssl.primary.key_blob;
+ #ifdef USE_TLS_SRP
+   data->set.proxy_ssl.primary.username =
+     data->set.str[STRING_TLSAUTH_USERNAME_PROXY];
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6539f7f..144a5c2 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92388-2.patch \
            file://CVE-2026-87864.patch \
            file://CVE-2026-8927.patch \
+           file://CVE-2026-8932.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
