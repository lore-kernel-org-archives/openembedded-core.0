Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DDDC3ABBC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:12 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.45925.1747040648954828559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=brrnwalb;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040648; x=1778576648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RnI8sTMrqwzPTwQI9up2yAnwqbucMfnYx7PeUj0EaZo=;
  b=brrnwalbxJRL0obWdgB6FgJ+zTU0E9PZ8757okAoJgdlrc2hl6ObBEJk
   adNID7ppwOANV2ndIEmc6EHcCl6JfJpo70Rcwu1hT8cb0WInflCNkbgFZ
   AqPiYJSFgcjyvfsm3r1YVKLBDWkVZLB3LX2ZmiNn6bC+RpCa+9MmW5+7F
   py3Ft7m6E8AseTD6m4KWVn1/h8V8tdnBc1bGrheNO98/cC/935xwqEh0m
   6gukm3vPHtFSYpvbxVHw7KVX31XwMJj8ysJhYJiEQU88nQVt2Rk8kyw77
   7T0ikx361m4kuSZvflf3DIpk8IPowkMMoyF/6KB2yhvUed/pFB7ax8/yC
   g==;
X-CSE-ConnectionGUID: V8qtAIdnRI6kK4k1igs3hg==
X-CSE-MsgGUID: DiwiqxjoR26HwjoQMjHQvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="178046182"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="178046182"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9397ED6861
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3815AD20AF
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B33CB1A009A;
	Mon, 12 May 2025 17:04:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 50/56] python3: upgrade 3.13.2 -> 3.13.3
Date: Mon, 12 May 2025 17:03:33 +0800
Message-Id: <1747040619-7566-50-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216348

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Avoid-shebang-overflow-on-python-config.py.patch
0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
0001-test_readline-skip-limited-history-test.patch
0001-test_storlines-skip-due-to-load-variability.patch
makerace.patch
valid-dists.patch
refreshed for 3.13.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...shebang-overflow-on-python-config.py.patch |   6 +-
 ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 108 +++++++++---------
 ...-use-prefix-value-from-build-configu.patch |   6 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |  12 +-
 ..._fileno-test-due-to-load-variability.patch |   6 +-
 ...t_readline-skip-limited-history-test.patch |  14 ++-
 ...orlines-skip-due-to-load-variability.patch |   6 +-
 .../python/python3/makerace.patch             |   6 +-
 .../python/python3/valid-dists.patch          |  28 +++--
 .../{python3_3.13.2.bb => python3_3.13.3.bb}  |   2 +-
 10 files changed, 101 insertions(+), 93 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.13.2.bb => python3_3.13.3.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 81a613c151..e7f7fdfda5 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,4 +1,4 @@
-From 6b111a328c1c57b1580d63894b2b5d337316f6d4 Mon Sep 17 00:00:00 2001
+From 0239f786147acda432c4a0ac0615ff13375053e3 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -16,10 +16,10 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 9ec3a71..f7d5382 100644
+index ce490a3..8284a87 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2578,6 +2578,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2579,6 +2579,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch b/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
index 075737e7d1..b3118c5cfe 100644
--- a/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
+++ b/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
@@ -1,4 +1,4 @@
-From db5c5763f3e3172f1dd011355b41469770dafc0f Mon Sep 17 00:00:00 2001
+From ad6f45615d99a2a9e8338dc3066781d449155868 Mon Sep 17 00:00:00 2001
 From: Petr Viktorin <encukou@gmail.com>
 Date: Thu, 28 Nov 2024 13:29:27 +0100
 Subject: [PATCH] gh-127330: Update for OpenSSL 3.4 & document+improve the
@@ -31,7 +31,7 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  rename Modules/{_ssl_data_31.h => _ssl_data_34.h} (92%)
 
 diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index b6b5ebf094c..e5b8bf21002 100644
+index 53a2802..e898a5a 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
 @@ -121,7 +121,7 @@ static void _PySSLFixErrno(void) {
@@ -44,7 +44,7 @@ index b6b5ebf094c..e5b8bf21002 100644
  #include "_ssl_data_300.h"
  #elif (OPENSSL_VERSION_NUMBER >= 0x10101000L)
 diff --git a/Modules/_ssl_data_111.h b/Modules/_ssl_data_111.h
-index 093c786e6a2..061fac2bd58 100644
+index 093c786..061fac2 100644
 --- a/Modules/_ssl_data_111.h
 +++ b/Modules/_ssl_data_111.h
 @@ -1,4 +1,6 @@
@@ -56,7 +56,7 @@ index 093c786e6a2..061fac2bd58 100644
  #ifdef ERR_LIB_ASN1
      {"ASN1", ERR_LIB_ASN1},
 diff --git a/Modules/_ssl_data_300.h b/Modules/_ssl_data_300.h
-index dc66731f6b6..b687ce43c77 100644
+index dc66731..b687ce4 100644
 --- a/Modules/_ssl_data_300.h
 +++ b/Modules/_ssl_data_300.h
 @@ -1,4 +1,7 @@
@@ -72,7 +72,7 @@ diff --git a/Modules/_ssl_data_31.h b/Modules/_ssl_data_34.h
 similarity index 92%
 rename from Modules/_ssl_data_31.h
 rename to Modules/_ssl_data_34.h
-index c589c501f4e..d4af3e1c1fa 100644
+index c589c50..d4af3e1 100644
 --- a/Modules/_ssl_data_31.h
 +++ b/Modules/_ssl_data_34.h
 @@ -1,4 +1,6 @@
@@ -1078,7 +1078,7 @@ index c589c501f4e..d4af3e1c1fa 100644
    #ifdef SSL_R_TLSV1_ALERT_ACCESS_DENIED
      {"TLSV1_ALERT_ACCESS_DENIED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_ACCESS_DENIED},
    #else
-@@ -7470,6 +7982,16 @@ static struct py_ssl_error_code error_codes[] = {
+@@ -7470,11 +7982,26 @@ static struct py_ssl_error_code error_codes[] = {
    #else
      {"TLSV1_ALERT_DECODE_ERROR", 20, 1050},
    #endif
@@ -1087,57 +1087,60 @@ index c589c501f4e..d4af3e1c1fa 100644
 +  #else
 +    {"TLSV1_ALERT_DECODE_ERROR", 20, 1050},
 +  #endif
+   #ifdef SSL_R_TLSV1_ALERT_DECRYPTION_FAILED
+     {"TLSV1_ALERT_DECRYPTION_FAILED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPTION_FAILED},
+   #else
+     {"TLSV1_ALERT_DECRYPTION_FAILED", 20, 1021},
+   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_DECRYPTION_FAILED
 +    {"TLSV1_ALERT_DECRYPTION_FAILED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPTION_FAILED},
 +  #else
 +    {"TLSV1_ALERT_DECRYPTION_FAILED", 20, 1021},
 +  #endif
-   #ifdef SSL_R_TLSV1_ALERT_DECRYPTION_FAILED
-     {"TLSV1_ALERT_DECRYPTION_FAILED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPTION_FAILED},
-   #else
-@@ -7480,6 +8002,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_ALERT_DECRYPT_ERROR", 20, 1051},
-   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_DECRYPT_ERROR
 +    {"TLSV1_ALERT_DECRYPT_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPT_ERROR},
 +  #else
 +    {"TLSV1_ALERT_DECRYPT_ERROR", 20, 1051},
 +  #endif
+   #ifdef SSL_R_TLSV1_ALERT_DECRYPT_ERROR
+     {"TLSV1_ALERT_DECRYPT_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPT_ERROR},
+   #else
+@@ -7485,6 +8012,16 @@ static struct py_ssl_error_code error_codes[] = {
+   #else
+     {"TLSV1_ALERT_EXPORT_RESTRICTION", 20, 1060},
+   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION
 +    {"TLSV1_ALERT_EXPORT_RESTRICTION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION},
 +  #else
 +    {"TLSV1_ALERT_EXPORT_RESTRICTION", 20, 1060},
 +  #endif
-   #ifdef SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION
-     {"TLSV1_ALERT_EXPORT_RESTRICTION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION},
-   #else
-@@ -7490,6 +8022,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", 20, 1086},
-   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_INAPPROPRIATE_FALLBACK
 +    {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INAPPROPRIATE_FALLBACK},
 +  #else
 +    {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", 20, 1086},
 +  #endif
+   #ifdef SSL_R_TLSV1_ALERT_INAPPROPRIATE_FALLBACK
+     {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INAPPROPRIATE_FALLBACK},
+   #else
+@@ -7495,11 +8032,36 @@ static struct py_ssl_error_code error_codes[] = {
+   #else
+     {"TLSV1_ALERT_INSUFFICIENT_SECURITY", 20, 1071},
+   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY
 +    {"TLSV1_ALERT_INSUFFICIENT_SECURITY", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY},
 +  #else
 +    {"TLSV1_ALERT_INSUFFICIENT_SECURITY", 20, 1071},
 +  #endif
-   #ifdef SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY
-     {"TLSV1_ALERT_INSUFFICIENT_SECURITY", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY},
-   #else
-@@ -7500,6 +8042,26 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_ALERT_INTERNAL_ERROR", 20, 1080},
-   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_INTERNAL_ERROR
 +    {"TLSV1_ALERT_INTERNAL_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INTERNAL_ERROR},
 +  #else
 +    {"TLSV1_ALERT_INTERNAL_ERROR", 20, 1080},
 +  #endif
+   #ifdef SSL_R_TLSV1_ALERT_INTERNAL_ERROR
+     {"TLSV1_ALERT_INTERNAL_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INTERNAL_ERROR},
+   #else
+     {"TLSV1_ALERT_INTERNAL_ERROR", 20, 1080},
+   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_NO_APPLICATION_PROTOCOL
 +    {"TLSV1_ALERT_NO_APPLICATION_PROTOCOL", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_NO_APPLICATION_PROTOCOL},
 +  #else
@@ -1156,7 +1159,7 @@ index c589c501f4e..d4af3e1c1fa 100644
    #ifdef SSL_R_TLSV1_ALERT_NO_RENEGOTIATION
      {"TLSV1_ALERT_NO_RENEGOTIATION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_NO_RENEGOTIATION},
    #else
-@@ -7510,21 +8072,56 @@ static struct py_ssl_error_code error_codes[] = {
+@@ -7510,6 +8072,16 @@ static struct py_ssl_error_code error_codes[] = {
    #else
      {"TLSV1_ALERT_PROTOCOL_VERSION", 20, 1070},
    #endif
@@ -1165,26 +1168,23 @@ index c589c501f4e..d4af3e1c1fa 100644
 +  #else
 +    {"TLSV1_ALERT_PROTOCOL_VERSION", 20, 1070},
 +  #endif
-   #ifdef SSL_R_TLSV1_ALERT_RECORD_OVERFLOW
-     {"TLSV1_ALERT_RECORD_OVERFLOW", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_RECORD_OVERFLOW},
-   #else
-     {"TLSV1_ALERT_RECORD_OVERFLOW", 20, 1022},
-   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_RECORD_OVERFLOW
 +    {"TLSV1_ALERT_RECORD_OVERFLOW", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_RECORD_OVERFLOW},
 +  #else
 +    {"TLSV1_ALERT_RECORD_OVERFLOW", 20, 1022},
 +  #endif
+   #ifdef SSL_R_TLSV1_ALERT_RECORD_OVERFLOW
+     {"TLSV1_ALERT_RECORD_OVERFLOW", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_RECORD_OVERFLOW},
+   #else
+@@ -7520,11 +8092,36 @@ static struct py_ssl_error_code error_codes[] = {
+   #else
+     {"TLSV1_ALERT_UNKNOWN_CA", 20, 1048},
+   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_CA
 +    {"TLSV1_ALERT_UNKNOWN_CA", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_UNKNOWN_CA},
 +  #else
 +    {"TLSV1_ALERT_UNKNOWN_CA", 20, 1048},
 +  #endif
-   #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_CA
-     {"TLSV1_ALERT_UNKNOWN_CA", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_UNKNOWN_CA},
-   #else
-     {"TLSV1_ALERT_UNKNOWN_CA", 20, 1048},
-   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_PSK_IDENTITY
 +    {"TLSV1_ALERT_UNKNOWN_PSK_IDENTITY", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_UNKNOWN_PSK_IDENTITY},
 +  #else
@@ -1213,7 +1213,7 @@ index c589c501f4e..d4af3e1c1fa 100644
    #ifdef SSL_R_TLSV1_BAD_CERTIFICATE_HASH_VALUE
      {"TLSV1_BAD_CERTIFICATE_HASH_VALUE", ERR_LIB_SSL, SSL_R_TLSV1_BAD_CERTIFICATE_HASH_VALUE},
    #else
-@@ -7535,6 +8132,16 @@ static struct py_ssl_error_code error_codes[] = {
+@@ -7535,11 +8132,26 @@ static struct py_ssl_error_code error_codes[] = {
    #else
      {"TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE", 20, 1113},
    #endif
@@ -1222,30 +1222,35 @@ index c589c501f4e..d4af3e1c1fa 100644
 +  #else
 +    {"TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE", 20, 1113},
 +  #endif
+   #ifdef SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE
+     {"TLSV1_CERTIFICATE_UNOBTAINABLE", ERR_LIB_SSL, SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE},
+   #else
+     {"TLSV1_CERTIFICATE_UNOBTAINABLE", 20, 1111},
+   #endif
 +  #ifdef SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE
 +    {"TLSV1_CERTIFICATE_UNOBTAINABLE", ERR_LIB_SSL, SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE},
 +  #else
 +    {"TLSV1_CERTIFICATE_UNOBTAINABLE", 20, 1111},
 +  #endif
-   #ifdef SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE
-     {"TLSV1_CERTIFICATE_UNOBTAINABLE", ERR_LIB_SSL, SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE},
-   #else
-@@ -7545,6 +8152,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_UNRECOGNIZED_NAME", 20, 1112},
-   #endif
 +  #ifdef SSL_R_TLSV1_UNRECOGNIZED_NAME
 +    {"TLSV1_UNRECOGNIZED_NAME", ERR_LIB_SSL, SSL_R_TLSV1_UNRECOGNIZED_NAME},
 +  #else
 +    {"TLSV1_UNRECOGNIZED_NAME", 20, 1112},
 +  #endif
+   #ifdef SSL_R_TLSV1_UNRECOGNIZED_NAME
+     {"TLSV1_UNRECOGNIZED_NAME", ERR_LIB_SSL, SSL_R_TLSV1_UNRECOGNIZED_NAME},
+   #else
+@@ -7550,6 +8162,11 @@ static struct py_ssl_error_code error_codes[] = {
+   #else
+     {"TLSV1_UNSUPPORTED_EXTENSION", 20, 1110},
+   #endif
 +  #ifdef SSL_R_TLSV1_UNSUPPORTED_EXTENSION
 +    {"TLSV1_UNSUPPORTED_EXTENSION", ERR_LIB_SSL, SSL_R_TLSV1_UNSUPPORTED_EXTENSION},
 +  #else
 +    {"TLSV1_UNSUPPORTED_EXTENSION", 20, 1110},
 +  #endif
-   #ifdef SSL_R_TLSV1_UNSUPPORTED_EXTENSION
-     {"TLSV1_UNSUPPORTED_EXTENSION", ERR_LIB_SSL, SSL_R_TLSV1_UNSUPPORTED_EXTENSION},
+   #ifdef SSL_R_TLS_ILLEGAL_EXPORTER_LABEL
+     {"TLS_ILLEGAL_EXPORTER_LABEL", ERR_LIB_SSL, SSL_R_TLS_ILLEGAL_EXPORTER_LABEL},
    #else
 @@ -7665,6 +8282,11 @@ static struct py_ssl_error_code error_codes[] = {
    #else
@@ -1359,7 +1364,7 @@ index c589c501f4e..d4af3e1c1fa 100644
      {"WRONG_LOOKUP_TYPE", ERR_LIB_X509, X509_R_WRONG_LOOKUP_TYPE},
    #else
 diff --git a/Tools/c-analyzer/cpython/_parser.py b/Tools/c-analyzer/cpython/_parser.py
-index 21be53e7884..a08b32fa45d 100644
+index 12010f0..104cf22 100644
 --- a/Tools/c-analyzer/cpython/_parser.py
 +++ b/Tools/c-analyzer/cpython/_parser.py
 @@ -70,9 +70,7 @@ Python/thread_pthread.h
@@ -1374,7 +1379,7 @@ index 21be53e7884..a08b32fa45d 100644
  Modules/unicodedata_db.h
  Modules/unicodename_db.h
 diff --git a/Tools/ssl/make_ssl_data.py b/Tools/ssl/make_ssl_data.py
-index 9860871..0cd05c7 100755
+index 9860871..982d05a 100755
 --- a/Tools/ssl/make_ssl_data.py
 +++ b/Tools/ssl/make_ssl_data.py
 @@ -5,9 +5,28 @@ This script should be called *manually* when we want to upgrade SSLError
@@ -1447,6 +1452,3 @@ index eae0e0c..fb06f63 100755
  ]
  
  LIBRESSL_OLD_VERSIONS = [
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index ca72ebc899..cb3a13ff0a 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 3f4f3e917950e286d5729ea949ca342995eb3c3e Mon Sep 17 00:00:00 2001
+From e7c0c356efe61be74c4c7a463d01b4eeb677c7df Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 5 insertions(+)
 
 diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
-index f8e1c7d..0882526 100644
+index 7a5feac..867f497 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
-@@ -494,6 +494,11 @@ def _init_config_vars():
+@@ -501,6 +501,11 @@ def _init_config_vars():
          _CONFIG_VARS['VPATH'] = sys._vpath
      if os.name == 'posix':
          _init_posix(_CONFIG_VARS)
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index c8537db1fd..38a6ef065e 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -1,4 +1,4 @@
-From 8828a52ebace98199569404f01174398bcc64a00 Mon Sep 17 00:00:00 2001
+From d6982c7de7dbeec6f50c05b923be02780b30ce89 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 1 Apr 2021 13:08:37 -0700
 Subject: [PATCH] Skip failing tests due to load variability on YP AB
@@ -23,10 +23,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 5dae370..23eb971 100644
+index 4b06123..b69e33f 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -688,6 +688,7 @@ class _TestProcess(BaseTestCase):
+@@ -692,6 +692,7 @@ class _TestProcess(BaseTestCase):
          close_queue(q)
  
      @support.requires_resource('walltime')
@@ -34,7 +34,7 @@ index 5dae370..23eb971 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2211,6 +2212,7 @@ class _TestBarrier(BaseTestCase):
+@@ -2223,6 +2224,7 @@ class _TestBarrier(BaseTestCase):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -42,7 +42,7 @@ index 5dae370..23eb971 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -5299,6 +5301,7 @@ class TestWait(unittest.TestCase):
+@@ -5311,6 +5313,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
      @support.requires_resource('walltime')
@@ -51,7 +51,7 @@ index 5dae370..23eb971 100644
          from multiprocessing.connection import wait
  
 diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
-index 293799f..1dbb623 100644
+index ee17c93..13041f3 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
 @@ -548,6 +548,7 @@ class TimeTestCase(unittest.TestCase):
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
index ea103bc834..7d8c9db9e1 100644
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From c5bdd39f8ebc4e6c58a47d7e424eac028eddb4ff Mon Sep 17 00:00:00 2001
+From d40708eac1cc5d0feb9e8ef3921d09cd7fffb23b Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 15 Sep 2023 08:48:33 -0400
 Subject: [PATCH] skip no_stdout_fileno test due to load variability
@@ -16,10 +16,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
-index c5394de..ed17fb6 100644
+index d4da291..efe84bd 100644
 --- a/Lib/test/test_builtin.py
 +++ b/Lib/test/test_builtin.py
-@@ -2435,6 +2435,7 @@ class PtyTests(unittest.TestCase):
+@@ -2458,6 +2458,7 @@ class PtyTests(unittest.TestCase):
                           "byte 0xe9 in position 4: ordinal not in "
                           "range(128)")
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index 862a7f5ea7..9a4c0e4626 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -1,4 +1,4 @@
-From 1a0a145261ba4f97aaff3c0c656ac2e0ad9695a8 Mon Sep 17 00:00:00 2001
+From 8fc0adf5a393faf2303b929cc3723a1d97417041 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Tue, 13 Aug 2024 11:07:05 -0400
 Subject: [PATCH] test_readline: skip limited history test
@@ -13,12 +13,14 @@ Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- Lib/test/test_readline.py | 2 ++
- 1 file changed, 2 insertions(+)
+ Lib/test/test_readline.py | 3 +++
+ 1 file changed, 3 insertions(+)
 
+diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
+index 8b8772c..90b9dbc 100644
 --- a/Lib/test/test_readline.py
 +++ b/Lib/test/test_readline.py
-@@ -70,6 +70,7 @@ class TestHistoryManipulation (unittest.
+@@ -70,6 +70,7 @@ class TestHistoryManipulation (unittest.TestCase):
  
      @unittest.skipUnless(hasattr(readline, "append_history_file"),
                           "append_history not available")
@@ -26,7 +28,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
      def test_write_read_append(self):
          hfile = tempfile.NamedTemporaryFile(delete=False)
          hfile.close()
-@@ -141,6 +142,7 @@ class TestHistoryManipulation (unittest.
+@@ -141,6 +142,7 @@ class TestHistoryManipulation (unittest.TestCase):
          self.assertEqual(readline.get_history_item(1), "entrée 1")
          self.assertEqual(readline.get_history_item(2), "entrée 22")
  
@@ -34,7 +36,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
      def test_write_read_limited_history(self):
          previous_length = readline.get_history_length()
          self.addCleanup(readline.set_history_length, previous_length)
-@@ -382,6 +384,7 @@ readline.write_history_file(history_file
+@@ -382,6 +384,7 @@ readline.write_history_file(history_file)
          self.assertIn(b"done", output)
  
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
index b4f873fd72..c1a9bebe78 100644
--- a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From 9f252a691cd335341938489da32d6e2d4620d8ca Mon Sep 17 00:00:00 2001
+From 45a38769a5cc7c1e16211bda02e9eb6c23e04eee Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 6 Oct 2023 10:59:44 -0400
 Subject: [PATCH] test_storlines: skip due to load variability
@@ -16,10 +16,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
-index bed0e6d..36602be 100644
+index c864d40..8459c4c 100644
 --- a/Lib/test/test_ftplib.py
 +++ b/Lib/test/test_ftplib.py
-@@ -627,6 +627,7 @@ class TestFTPClass(TestCase):
+@@ -630,6 +630,7 @@ class TestFTPClass(TestCase):
              self.client.storbinary('stor', f, rest=r)
              self.assertEqual(self.server.handler_instance.rest, str(r))
  
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index b115a6fa65..d69db443f9 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 2b458b4e1bcd57e3f135d3f0e715f64b98b27906 Mon Sep 17 00:00:00 2001
+From bdb637f4c65329f1e452ad08158a7ab89529ff39 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -17,10 +17,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index be1b9ea..9ec3a71 100644
+index 7586b6c..ce490a3 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2485,7 +2485,7 @@ COMPILEALL_OPTS=-j0
+@@ -2486,7 +2486,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3/valid-dists.patch b/meta/recipes-devtools/python/python3/valid-dists.patch
index 1b2c078c21..50ee4d455a 100644
--- a/meta/recipes-devtools/python/python3/valid-dists.patch
+++ b/meta/recipes-devtools/python/python3/valid-dists.patch
@@ -1,4 +1,4 @@
-From a65c29adc027b3615154cab73aaedd58a6aa23da Mon Sep 17 00:00:00 2001
+From a5a3716a7bb4bef5478757b986059e13981d473e Mon Sep 17 00:00:00 2001
 From: "Jason R. Coombs" <jaraco@jaraco.com>
 Date: Tue, 23 Jul 2024 08:36:16 -0400
 Subject: [PATCH] Prioritize valid dists to invalid dists when retrieving by
@@ -8,12 +8,16 @@ Closes python/importlib_metadata#489
 
 Upstream-Status: Backport [https://github.com/python/importlib_metadata/commit/a65c29adc027b3615154cab73aaedd58a6aa23da]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Lib/importlib/metadata/__init__.py   | 14 +++-
+ Lib/importlib/metadata/_itertools.py | 98 ++++++++++++++++++++++++++++
+ 2 files changed, 110 insertions(+), 2 deletions(-)
 
-diff --git i/Lib/importlib/metadata/__init__.py w/Lib/importlib/metadata/__init__.py
-index 8ce62dd864f..085378caabc 100644
---- i/Lib/importlib/metadata/__init__.py
-+++ w/Lib/importlib/metadata/__init__.py
-@@ -21,7 +21,7 @@
+diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata/__init__.py
+index 8ce62dd..085378c 100644
+--- a/Lib/importlib/metadata/__init__.py
++++ b/Lib/importlib/metadata/__init__.py
+@@ -21,7 +21,7 @@ import collections
  from . import _meta
  from ._collections import FreezableDefaultDict, Pair
  from ._functools import method_cache, pass_none
@@ -22,7 +26,7 @@ index 8ce62dd864f..085378caabc 100644
  from ._meta import PackageMetadata, SimplePath
  
  from contextlib import suppress
-@@ -404,7 +404,7 @@ def from_name(cls, name: str) -> Distribution:
+@@ -404,7 +404,7 @@ class Distribution(DeprecatedNonAbstract):
          if not name:
              raise ValueError("A distribution name is required.")
          try:
@@ -31,7 +35,7 @@ index 8ce62dd864f..085378caabc 100644
          except StopIteration:
              raise PackageNotFoundError(name)
  
-@@ -428,6 +428,16 @@ def discover(
+@@ -428,6 +428,16 @@ class Distribution(DeprecatedNonAbstract):
              resolver(context) for resolver in cls._discover_resolvers()
          )
  
@@ -48,10 +52,10 @@ index 8ce62dd864f..085378caabc 100644
      @staticmethod
      def at(path: str | os.PathLike[str]) -> Distribution:
          """Return a Distribution for the indicated metadata path.
-diff --git i/Lib/importlib/metadata/_itertools.py w/Lib/importlib/metadata/_itertools.py
-index d4ca9b9140e..79d37198ce7 100644
---- i/Lib/importlib/metadata/_itertools.py
-+++ w/Lib/importlib/metadata/_itertools.py
+diff --git a/Lib/importlib/metadata/_itertools.py b/Lib/importlib/metadata/_itertools.py
+index d4ca9b9..79d3719 100644
+--- a/Lib/importlib/metadata/_itertools.py
++++ b/Lib/importlib/metadata/_itertools.py
 @@ -1,3 +1,4 @@
 +from collections import defaultdict, deque
  from itertools import filterfalse
diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.3.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.2.bb
rename to meta/recipes-devtools/python/python3_3.13.3.bb
index 8e16ce90dc..6839d28e19 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.3.bb
@@ -36,7 +36,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "d984bcc57cd67caab26f7def42e523b1c015bbc5dc07836cf4f0b63fa159eb56"
+SRC_URI[sha256sum] = "40f868bcbdeb8149a3149580bb9bfd407b3321cd48f0be631af955ac92c0e041"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


