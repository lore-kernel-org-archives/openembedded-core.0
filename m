Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1249EC79F89
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:00:17 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9553.1788512409943525828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Yf3JvBx6;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9086; q=dns/txt;
  s=iport01; t=1788512410; x=1789722010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zPz6gdzsKDYrAQ1xg+P0vhq8GgHoo/87ea+PcYWSzdQ=;
  b=Yf3JvBx6rO08FOknkjtV7FWMy61RUVnJArN5qzE0hOex41tX3eafo0+D
   RBFp9mP8xUarMvKi2JMCPDM+PsnCBpq9Eyigt7SWPEH+v9w2ikG2rcQC0
   pHpxLimFZOckaTPQjEe2MciUUcT/dAQ9onIpCdu6BiZDRpL0iyk4ORjuX
   YJbWb0nws7CCVeHU2Z9mTfyYrcmhDpl/+zuzAC5L7qp3VIZu+lxy0E6BJ
   LBPBqGFdRfOi7WBoxiHGbe0wBIMJ/1Cpb/QWEECnB85YLYTxpbHd305kM
   se/YMq4DIloEq1hn8NpfwMGn40TMLZKzhZeMDb+UjLbZLIUJdnsCdTKxP
   Q==;
X-CSE-ConnectionGUID: BFdFrKURS7O0TgrutfwJlQ==
X-CSE-MsgGUID: N0AU6K76SFqOlYaNfotxSg==
X-IPAS-Result: =?us-ascii?q?A0AHAADxh5pq/4sQJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX4DAQEBAQsBglZ0YENJlkoDgROdCIF+DwEBAQ9EDQQBAYUFA?=
 =?us-ascii?q?o4CAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZAZA?=
 =?us-ascii?q?QIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRBsI4gXkzgQGDKAE/AgJAAVDbM?=
 =?us-ascii?q?QELFAEFgTMBhT6DA4EQhA9dGAGEfCcbG4FygRWBO4E4doEFgVwCAYFHhl0Eg?=
 =?us-ascii?q?iKBDIFakg1IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBHYEng?=
 =?us-ascii?q?z8jGTZ6gQlegSspYAESF4EJgggCglSCAwIBSUMOB0dTCSdBBAsYDUgRLDcVG?=
 =?us-ascii?q?QQ+bgeOXx+CSQYBAWAaCgkBKQEBggIDOAsWCJJrGpAWgiGhDwoog3aMIpU6G?=
 =?us-ascii?q?jOqbQuYfY4KlWAHDF2EaYFvATSBWXAVgyIJFjQZD44rDguDYIQHgjnFeScyA?=
 =?us-ascii?q?gkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:OrNJIql/ViQ9tTHHKbitV6zo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJODDqPa/eLM2qjKdwnOYXioUwEvJ+Ay4NrQFFlqnszE1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpFs/nb9HuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fac29shtIlx0z
 qM/cAwCdA2fif2UxIvuH4GAhux7RCXqFIobvnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkYeUrsUIMpWcOOAinThejtDqEq9rqss6G+Vxwt0uFToGIqJJYbXG5gLxy50o
 Ergp03EXDJFauex0B2Bw3uKiOjTjRj0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:cv/CXak43VRsQzBxTijX/9Y6G/7pDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:6tDsMW1+1eMnzJQJvkVo8bxfMO4pXGf+8U3rfGjgNWlzVaGbVn2UwfYx
X-Talos-MUID: 9a23:VXGqHAl5bjtcinDJKGRMdnpEbO5VvYfxVnsjiLICisCiOytsKwyS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,260,1779148800"; 
   d="scan'208";a="847256561"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 09:00:09 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id CD64218000199;
	Fri,  4 Sep 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 0FD0ECC124B; Fri,  4 Sep 2026 02:00:08 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 6/6] curl: Fix CVE-2026-12064
Date: Fri,  4 Sep 2026 02:00:07 -0700
Message-Id: <20260904090007.27374-6-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260904090007.27374-1-devanshp@cisco.com>
References: <20260904090007.27374-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245080

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. The config2setopts.c change is adapted to curl
8.7.1's equivalent url_proto() implementation in tool_operate.c while
preserving upstream out-of-memory error propagation.

[1] https://github.com/curl/curl/commit/ab3bb8cd8be8f9d4acb97da0418abc279182041e
[2] https://curl.se/docs/CVE-2026-12064.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-12064.patch            | 258 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 259 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-12064.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-12064.patch b/meta/recipes-support/curl/curl/CVE-2026-12064.patch
new file mode 100644
index 0000000000..4444401864
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-12064.patch
@@ -0,0 +1,258 @@
+From 1bdb3dbcc85bd754b8f5af73159decd926a0b7a4 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 12 Jun 2026 09:01:22 +0200
+Subject: [PATCH] config2setopts: use default protocol properly
+
+Verified by test 1724, 1725 and 2036
+
+Closes #21983
+
+CVE: CVE-2026-12064
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ab3bb8cd8be8f9d4acb97da0418abc279182041e]
+
+Backport Changes:
+- Adapt the config2setopts.c change to curl 8.7.1's equivalent url_proto()
+  implementation in tool_operate.c. Since CURLU_NO_GUESS_SCHEME is not
+  available, parse without scheme guessing when --proto-default is set and
+  use the configured default only when the URL has no explicit scheme.
+- Preserve upstream error handling by propagating CURLUE_OUT_OF_MEMORY from
+  both curl_url_set() and curl_url_get() as CURLE_OUT_OF_MEMORY.
+- Register the regression tests in the target Makefile.inc. Renumber upstream
+  test2036 to test1726 because test2036 already exists in curl 8.7.1. Use
+  the target's %SSH_PWD substitution in test1725. Declare the no-server
+  test1726 explicitly because the older test harness requires it.
+
+(cherry picked from commit ab3bb8cd8be8f9d4acb97da0418abc279182041e)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ docs/cmdline-opts/proto-default.md |  6 +++-
+ src/tool_operate.c                 | 45 +++++++++++++++----------
+ tests/data/Makefile.inc            |  1 +
+ tests/data/test1724                | 53 ++++++++++++++++++++++++++++++
+ tests/data/test1725                | 29 ++++++++++++++++
+ tests/data/test1726                | 29 ++++++++++++++++
+ 6 files changed, 144 insertions(+), 19 deletions(-)
+ create mode 100644 tests/data/test1724
+ create mode 100644 tests/data/test1725
+ create mode 100644 tests/data/test1726
+
+diff --git a/docs/cmdline-opts/proto-default.md b/docs/cmdline-opts/proto-default.md
+index 209e5cdc83..903fac73a5 100644
+--- a/docs/cmdline-opts/proto-default.md
++++ b/docs/cmdline-opts/proto-default.md
+@@ -16,7 +16,8 @@ Example:
+
+ # `--proto-default`
+
+-Use *protocol* for any provided URL missing a scheme.
++Use *protocol* for any provided URL missing a scheme. The case-insensitive
++name should be given without any `://` suffix.
+
+ An unknown or unsupported protocol causes error *CURLE_UNSUPPORTED_PROTOCOL*.
+
+@@ -24,3 +25,6 @@ This option does not change the default proxy protocol (http).
+
+ Without this option set, curl guesses protocol based on the hostname, see
+ --url for details.
++
++The default protocol cannot be set to `ipfs` or `ipns`. Those schemes need to
++be used explicitly in the URL.
+diff --git a/src/tool_operate.c b/src/tool_operate.c
+index 7e2c1eefe0..c8059a40d9 100644
+--- a/src/tool_operate.c
++++ b/src/tool_operate.c
+@@ -704,26 +704,35 @@ static CURLcode url_proto(char **url,
+     if(*url) {
+       char *schemep = NULL;
+
+-      if(!curl_url_set(uh, CURLUPART_URL, *url,
+-                       CURLU_GUESS_SCHEME | CURLU_NON_SUPPORT_SCHEME) &&
+-         !curl_url_get(uh, CURLUPART_SCHEME, &schemep,
+-                       CURLU_DEFAULT_SCHEME)) {
+-        if(curl_strequal(schemep, proto_ipfs) ||
+-           curl_strequal(schemep, proto_ipns)) {
+-          result = ipfs_url_rewrite(uh, schemep, url, config);
+-          /* short-circuit proto_token, we know it's ipfs or ipns */
+-          if(curl_strequal(schemep, proto_ipfs))
+-            proto = proto_ipfs;
+-          else if(curl_strequal(schemep, proto_ipns))
+-            proto = proto_ipns;
+-          if(result)
+-            config->synthetic_error = TRUE;
++      CURLUcode uc =
++        curl_url_set(uh, CURLUPART_URL, *url,
++                     CURLU_NON_SUPPORT_SCHEME |
++                     (config->proto_default ? 0 : CURLU_GUESS_SCHEME));
++
++      if((uc == CURLUE_BAD_SCHEME) && config->proto_default)
++        proto = proto_token(config->proto_default);
++      else if(!uc) {
++        uc = curl_url_get(uh, CURLUPART_SCHEME, &schemep,
++                          CURLU_DEFAULT_SCHEME);
++        if(!uc) {
++          if(curl_strequal(schemep, proto_ipfs) ||
++             curl_strequal(schemep, proto_ipns)) {
++            result = ipfs_url_rewrite(uh, schemep, url, config);
++            /* short-circuit proto_token, we know it's ipfs or ipns */
++            if(curl_strequal(schemep, proto_ipfs))
++              proto = proto_ipfs;
++            else if(curl_strequal(schemep, proto_ipns))
++              proto = proto_ipns;
++            if(result)
++              config->synthetic_error = TRUE;
++          }
++          else
++            proto = proto_token(schemep);
+         }
+-        else
+-          proto = proto_token(schemep);
+-
+-        curl_free(schemep);
+       }
++      if(uc == CURLUE_OUT_OF_MEMORY)
++        result = CURLE_OUT_OF_MEMORY;
++      curl_free(schemep);
+     }
+     curl_url_cleanup(uh);
+   }
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 9708e37b1f..da87400564 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -220,6 +220,7 @@ test1670 test1671 \
+ test1680 test1681 test1682 test1683 \
+ \
+ test1700 test1701 test1702 test1703 test1704 \
++test1724 test1725 test1726 \
+ \
+ test1800 test1801 \
+ \
+diff --git a/tests/data/test1724 b/tests/data/test1724
+new file mode 100644
+index 0000000000..3cd328e39c
+--- /dev/null
++++ b/tests/data/test1724
+@@ -0,0 +1,53 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++IPFS
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data nocheck="yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 21
++Connection: close
++Content-Type: text/plain
++Funny-head: yesyes
++
++Hello curl from IPFS
++</data>
++</reply>
++
++# Client-side
++<client>
++<features>
++ipfs
++</features>
++<server>
++http
++</server>
++<name>
++IPFS with --proto-default HTTP
++</name>
++<command>
++--ipfs-gateway http://%HOSTIP:%HTTPPORT ipfs://bafybeidecnvkrygux6uoukouzps5ofkeevoqland7kopseiod6pzqvjg7u --proto-default http
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET /ipfs/bafybeidecnvkrygux6uoukouzps5ofkeevoqland7kopseiod6pzqvjg7u HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test1725 b/tests/data/test1725
+new file mode 100644
+index 0000000000..e3b2c5abd2
+--- /dev/null
++++ b/tests/data/test1725
+@@ -0,0 +1,29 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++SCP
++server key check
++</keywords>
++</info>
++
++# Client-side
++<client>
++<server>
++scp
++</server>
++<name>
++SCP incorrect host key with --proto-default SCP
++</name>
++<command>
++--hostpubmd5 00000000000000000000000000000000 --key %LOGDIR/server/curl_client_key --pubkey %LOGDIR/server/curl_client_key.pub -u %USER: %HOSTIP:%SSHPORT%SSH_PWD/%LOGDIR/irrelevant-file --insecure --proto-default SCP
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<errorcode>
++60
++</errorcode>
++</verify>
++</testcase>
+diff --git a/tests/data/test1726 b/tests/data/test1726
+new file mode 100644
+index 0000000000..61f5b5dbd5
+--- /dev/null
++++ b/tests/data/test1726
+@@ -0,0 +1,29 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++--proto-default
++</keywords>
++</info>
++
++# Client-side
++<client>
++<server>
++none
++</server>
++<name>
++Attempt to set a default protocol with :// suffix
++</name>
++<command>
++--proto-default https://
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++# CURLE_UNSUPPORTED_PROTOCOL is error code 1
++<errorcode>
++1
++</errorcode>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index e9ba10cb97..267182aacd 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -47,6 +47,7 @@ SRC_URI = " \
     file://CVE-2026-8927.patch \
     file://CVE-2026-8932.patch \
     file://CVE-2026-9547.patch \
+    file://CVE-2026-12064.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


