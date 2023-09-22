Return-Path: <SANJAY.CHITRODA@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D68CD4F3B
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 08:31:25 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web11.17009.1695371479294070400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 01:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: vivelmur@cisco.com)
X-CSE-ConnectionGUID: hhbuioIETjCJybpUeoQ29w==
X-CSE-MsgGUID: 7LZY30VhS82brXkgj/rhLg==
X-IPAS-Result: =?us-ascii?q?A0ANAABzUA1lmJBdJa1aHAEBAQEBAQcBARIBAQQEAQGBe?=
 =?us-ascii?q?wcBAQsBgy9VGiZHA4xsiUKBFpxogg0BAQENAQE5CwQBAYwLAiY0CQ4BAgQBA?=
 =?us-ascii?q?QEBAwIDAQEBAQEBAQIBAQUBAQECAQcEFAEBAQEBAQEBHhkFDhAnhWgNhkcBO?=
 =?us-ascii?q?AEYAS0sAwECWyMhgn4Bgl4DEbEzgiyBAYMkAT8CQ68UgVKBSAGMPYMjgi8ng?=
 =?us-ascii?q?iiBFYE8gTd2gQWBXQEBiCMEiUaFPQUCMoIngzAqilwqgQgIXIFqPQINVQsLX?=
 =?us-ascii?q?YERgkQCAhE5E0daFhsDBwNaKhArBwQyIgYJFi0lBlEEFxYkCRMSPgSDOAqBB?=
 =?us-ascii?q?j8RDhGCRSICBzY2GUuCXQkVQU52ECsEFBhtKG4fFR43ERIFFA0DCHYdAhEjP?=
 =?us-ascii?q?AMFAwQ2ChUNCyEFVwNHBksLAwIcBQMDBIE2BQ8eAhAuKQMDGVACEBQDPgMDB?=
 =?us-ascii?q?gMLMgMyPwMJAwcFSUADCxgNSBEsNRQbBkFzB6EkboFvcoEOAQckgQWBJxGkN?=
 =?us-ascii?q?qA7B5AOlQZNqV+GdZE4jWGWDIQwAgQGBQIWgWM6gUkLB3CDNwlJGQ+OLAsLg?=
 =?us-ascii?q?1aBf4MViwUkMgILLgIHCwEBAwmLSQEB?=
IronPort-Data: A9a23:SsZEtKhkw7J+GQEW7Tk65oTOX161WxAKZh0ujC45NGQN5FlHY01je
 htvW2qEaffYZGOjedlxbd/joUwPsJfVmINrSAs9qnxnRC5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+1H1dOCn9CEgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZWEULOZ82QsaDlMuvjZ8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVTmZk5tZkSXqkMqShrefUoMHKF0hU9/011llj3qo
 TlHncTYpQwBZsUglAmBOvVVO3kWAEFIxFPICXi/u9GSyGzrT3nH4eRkFHw7OrRCq/kiVAmi9
 dRAQNwMRgqIi+Tzy7WhR6w8wM8iN8LseogYvxmMzxmAUq1gGs+FEv6MvIMEtNszrpgm8fL2e
 csHZD5qcQ7oaBxUMVBRA5U79AutriChLWQE9QzN9MLb5UCM6D5Ai+DTMOGFINaQdcZanAGCp
 kbJqjGR7hYybYzDlmXtHmiXrujXkCX2XYgfGLG1+rthh0ee7mgSEwENE1yjrP+0j0SzV95SJ
 woT4CVGhbM78k6iX5/2XxykunmItzYRWtxeFOY66RmWjKHT5m6k6nMsVDVNbpkts9U7AGxs3
 V6SlNSvDjtq2FGIdZ6D3reUpy6zPgk4EW0pRz4OVTYI5OC58Z5m23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vYSgjivvTEbfv3m/Em3TZcuImzl6IAT/9v2uVcKbgNtP4swGKhRpVBN/BFgHpg
 ZQSpySJAAkz4XyljieBRqAGG6ukoqbDOzzHilkpFJ4kn9hMx5JBVd4JiN2dDB45WirhRdMPS
 BOL0e+2zMQCVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOjj22yhF0zf1vY
 c3znSOQ4ZAyV/0PIN2eGb917FPX7nxWKZ77HMqilE33jdJymlbMF+pVWLdxUgzJxPrU/FqKm
 zquH8CL0B5YGPbveTXa9JV7ELz5BSZTOHwCkOQOLrTrClM/QAkJUqaNqZt/INYNt/oOyY/1E
 oSVBxUwJKzX3yOXcG1nqxlLNdvSYHqIhStkZ3RyYQz5iyBLjETGxP53SqbbtIIPrIRLpcOYh
 dFcEylcKpyjkgj6xgk=
IronPort-HdrOrdr: A9a23:XX1lmq5ZglWO5njTYwPXwMPXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7d8+mUzJ876U
 +mGJIObOHNMQ==
X-Talos-CUID: 9a23:aBNf9m9YE6wgqud5LESVv04UEN0kdVzw8HX7AV6yEVtkT4TPGEDFrQ==
X-Talos-MUID: 9a23:l89rZgjToiPCIJiNhMFtIMMpa+Na0v/2NkA2wc8MofmHOi43ITe5g2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.03,167,1694736000"; 
   d="scan'208";a="166145609"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
  by alln-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 08:31:18 +0000
Received: from sjc-ads-6897.cisco.com (sjc-ads-6897.cisco.com [10.30.218.17])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 38M8VHXv009090
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 22 Sep 2023 08:31:18 GMT
Received: by sjc-ads-6897.cisco.com (Postfix, from userid 1822629)
	id C5AB6CC12B5; Fri, 22 Sep 2023 01:31:17 -0700 (PDT)
From: sanjay.chitroda@einfochips.com
To: openembedded-core@lists.openembedded.org
Cc: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
Subject: [OE-core][mickledore][PATCH] curl: Add CVE-2023-28320 follow-up fix
Date: Fri, 22 Sep 2023 01:30:55 -0700
Message-Id: <20230922083055.3781860-1-sanjay.chitroda@einfochips.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.218.17, sjc-ads-6897.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 08:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188087

From: Sanjay Chitroda <sanjay.chitroda@einfochips.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-28320
https://security-tracker.debian.org/tracker/CVE-2023-28320

Upstream Patch:
Introduced by: https://github.com/curl/curl/commit/3c49b405de4f (curl-7_9_8)
Fixed by: https://github.com/curl/curl/commit/13718030ad4b (curl-8_1_0)
Follow-up: https://github.com/curl/curl/commit/f446258f0269 (curl-8_1_0)

Signed-off-by: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
---
 .../curl/curl/CVE-2023-28320-fol1.patch       | 80 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
new file mode 100644
index 0000000000..3c06d8c518
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
@@ -0,0 +1,80 @@
+From e442feb37ba25c80b8480b908d1c570fd9f41c5e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 16 May 2023 23:40:42 +0200
+Subject: [PATCH] hostip: include easy_lock.h before using
+ GLOBAL_INIT_IS_THREADSAFE
+
+Since that header file is the only place that define can be defined.
+
+Reported-by: Marc Deslauriers
+
+Follow-up to 13718030ad4b3209
+
+Closes #11121
+
+CVE: CVE-2023-28320
+Upstream-Status: Backport [https://github.com/curl/curl/commit/f446258f0269]
+
+(cherry picked from commit f446258f0269a62289cca0210157cb8558d0edc3)
+Signed-off-by: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
+
+---
+ lib/hostip.c | 10 ++++------
+ lib/hostip.h |  9 ---------
+ 2 files changed, 4 insertions(+), 15 deletions(-)
+
+diff --git a/lib/hostip.c b/lib/hostip.c
+index d6906a2e8..2d26b5628 100644
+--- a/lib/hostip.c
++++ b/lib/hostip.c
+@@ -70,6 +70,8 @@
+ #include <SystemConfiguration/SCDynamicStoreCopySpecific.h>
+ #endif
+ 
++#include "easy_lock.h"
++
+ #if defined(CURLRES_SYNCH) &&                   \
+   defined(HAVE_ALARM) &&                        \
+   defined(SIGALRM) &&                           \
+@@ -79,10 +81,6 @@
+ #define USE_ALARM_TIMEOUT
+ #endif
+ 
+-#ifdef USE_ALARM_TIMEOUT
+-#include "easy_lock.h"
+-#endif
+-
+ #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port number + zero */
+ 
+ /*
+@@ -265,8 +263,8 @@ void Curl_hostcache_prune(struct Curl_easy *data)
+ /* Beware this is a global and unique instance. This is used to store the
+    return address that we can jump back to from inside a signal handler. This
+    is not thread-safe stuff. */
+-sigjmp_buf curl_jmpenv;
+-curl_simple_lock curl_jmpenv_lock;
++static sigjmp_buf curl_jmpenv;
++static curl_simple_lock curl_jmpenv_lock;
+ #endif
+ 
+ /* lookup address, returns entry if found and not stale */
+diff --git a/lib/hostip.h b/lib/hostip.h
+index 4b5481f65..0dd19e87c 100644
+--- a/lib/hostip.h
++++ b/lib/hostip.h
+@@ -186,15 +186,6 @@ Curl_cache_addr(struct Curl_easy *data, struct Curl_addrinfo *addr,
+ #define CURL_INADDR_NONE INADDR_NONE
+ #endif
+ 
+-#ifdef HAVE_SIGSETJMP
+-/* Forward-declaration of variable defined in hostip.c. Beware this
+- * is a global and unique instance. This is used to store the return
+- * address that we can jump back to from inside a signal handler.
+- * This is not thread-safe stuff.
+- */
+-extern sigjmp_buf curl_jmpenv;
+-#endif
+-
+ /*
+  * Function provided by the resolver backend to set DNS servers to use.
+  */
diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-support/curl/curl_8.0.1.bb
index bcfe4a6088..708f622fe1 100644
--- a/meta/recipes-support/curl/curl_8.0.1.bb
+++ b/meta/recipes-support/curl/curl_8.0.1.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://CVE-2023-28320.patch \
     file://CVE-2023-28321.patch \
     file://CVE-2023-32001.patch \
+    file://CVE-2023-28320-fol1.patch \
 "
 SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
 
-- 
2.35.6


