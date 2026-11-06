Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1248.1793949576635451417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=V2rzZjmQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14511; q=dns/txt;
  s=iport01; t=1793949576; x=1795159176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FFYuYW7NS4bfg7zY2qhLaXMI+eshf99Hh/aRLWyncCQ=;
  b=V2rzZjmQ6+55MWX8rzluIFU2BLkOhSmL8X82YQsaz0VTCIYmVRSMH5kN
   kEBwhlN2ylRu+HSLddrI8LhU40k2avNJSY43FGfFPjOKZtqdTiCU25sB0
   QktomWmWl2MdmOY0J/+8L5xMCBBbluYuHeBbStHVHEqhGIuGLSRNtZuRg
   qEcuoDeUxXrhLEK/t987GskPt/yBoDs5HdHb4UAUbjZwmDZVKxyiNlmJJ
   r64Knt5d3Ckiv/K5joKvpRMlA8KIkrsWJrj6NcssZ/TNQur7lvjCZL4Id
   XJ1L216ct3//HhYsS0Dbnq3FQycxFQd/C0XRGsJomAHnm2c2oQ2o5tC7H
   w==;
X-CSE-ConnectionGUID: xRaZTMcHS9SWOmk1Akx6Qg==
X-CSE-MsgGUID: rbdH8tUNQDiAZEaeJaLHWw==
X-IPAS-Result: =?us-ascii?q?A0BIAgBrfu1q/4//Ja1aglmCV3VgQ0mWSwOeIYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4dAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBAJgwIBgnQDEQa7Oxs3gXkzg?=
 =?us-ascii?q?QGDKQE/AgJAAVDbMwELFAGBOIVAiCNdGAGEfScbG4FygRWBO4IugQWBXAIBg?=
 =?us-ascii?q?UeGXgSCIoEMgVoeZYwVAoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4Hkj2CTiQgARUbMC0BKQEBfxIHQiMFLwwLAhQIFJJDJQmQFoIhn?=
 =?us-ascii?q?1OBPgoog3iMJJU6GjOFW6UWC5h9jgqVaSZChGmBaDyBWXAVO4JnCRY0GQ9Yj?=
 =?us-ascii?q?VMDCwuBeIFohkDGBSYyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:4JDvBa+RTkDxvthUnCgCDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TFNUG7VO6qKNGugfosnOY21904EusPWyN42Gwto/y5EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazpJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kmB4QqxsN8IVofz
 sM/LTNURxOT2du5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Yn1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FbYaJJYPUHpUO9qqej
 njM80SpHiw8DfCe4Aio+3+Oj8vvojyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjZCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:n5GOGKN70jz/1cBcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: 9a23:2wB71m2HT14yigHAvVVlN7xfCvosQEH4x1frcnSHLmNqEZSWWQGp9/Yx
X-Talos-MUID: 9a23:uugfmAgNs3yYzi/tdFa+D8MpLs1kw/SyNWY0vZQvieSNOA55Hxeik2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544776383"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:19:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 4E09B1800025A;
	Fri,  6 Nov 2026 07:19:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id EDA79CBF204; Thu,  5 Nov 2026 23:19:34 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 4/9] curl: fix CVE-2026-92390
Date: Thu,  5 Nov 2026 23:19:27 -0800
Message-Id: <20261106071932.490299-5-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106071932.490299-1-dkelaiya@cisco.com>
References: <20261106071932.490299-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 07:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249603
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Delay output creation until the remote filename is selected, preserving
-J anti-clobber handling for 103 and ETag headers.

Include the later upstream filename-less Content-Disposition fix [3].
It closes another early-open path and writes buffered headers when a
transfer completes without a body. Keep both fixes in separate patches
with upstream tests 3037, 3038 and 1718.

[1] https://github.com/curl/curl/commit/c24a69d8cd368de4e25e3540bf0b7b000a31d5a7
[2] https://curl.se/docs/CVE-2026-92390.html
[3] https://github.com/curl/curl/commit/631ed306872956f86617df9b5664614e8a2dee54

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-92390_p1.patch         | 270 ++++++++++++++++++
 .../curl/curl/CVE-2026-92390_p2.patch         | 150 ++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 3 files changed, 422 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92390_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92390_p2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92390_p1.patch b/meta/recipes-support/curl/curl/CVE-2026-92390_p1.patch
new file mode 100644
index 0000000000..fa25d06b36
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92390_p1.patch
@@ -0,0 +1,270 @@
+From c24a69d8cd368de4e25e3540bf0b7b000a31d5a7 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <MegaManSec@users.noreply.github.com>
+Date: Sat, 12 Sep 2026 02:57:04 +0200
+Subject: [PATCH] tool: buffer headers before remote filename selection
+
+Verified by test 3037 and 3038.
+
+Closes #22977
+
+CVE: CVE-2026-92390
+Upstream-Status: Backport [https://github.com/curl/curl/commit/c24a69d8cd368de4e25e3540bf0b7b000a31d5a7]
+
+Backport Changes:
+- In content_disposition(), remove curl 8.19.0's curl_maprintf()
+  header-copy block; the upstream block uses curlx_memdup0().
+- Register test3037 and test3038 together in the older grouped
+  tests/data/Makefile.am list instead of one line per test.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/tool_cb_hdr.c      | 53 +++++++++++++++++++++++++++--------------
+ tests/data/Makefile.am |  1 +
+ tests/data/test3037    | 62 ++++++++++++++++++++++++++++++++++++++++++++++++
+ tests/data/test3038    | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 162 insertions(+), 18 deletions(-)
+
+diff --git a/src/tool_cb_hdr.c b/src/tool_cb_hdr.c
+index fc03cf1..15abb5b 100644
+--- a/src/tool_cb_hdr.c
++++ b/src/tool_cb_hdr.c
+@@ -248,6 +248,28 @@ fail:
+   return rc;
+ }
+ 
++/* Store a header until the output filename has been decided. */
++static size_t buffer_header(struct HdrCbData *hdrcbdata,
++                            const char *str, size_t cb)
++{
++  char *clone = curlx_memdup0(str, cb);
++  if(clone) {
++    struct curl_slist *old = hdrcbdata->headlist;
++    hdrcbdata->headlist = curl_slist_append(old, clone);
++    curlx_free(clone);
++    if(!hdrcbdata->headlist) {
++      curl_slist_free_all(old);
++      return CURL_WRITEFUNC_ERROR;
++    }
++  }
++  else {
++    curl_slist_free_all(hdrcbdata->headlist);
++    hdrcbdata->headlist = NULL;
++    return CURL_WRITEFUNC_ERROR;
++  }
++  return cb;
++}
++
+ /*
+  * Write etag to file when --etag-save option is given.
+  */
+@@ -395,24 +417,8 @@ static size_t content_disposition(const char *str, const char *end,
+ 
+   if(hdrcbdata->honor_cd_filename &&
+      hdrcbdata->config->show_headers) {
+-    /* still awaiting the Content-Disposition header, store the header in
+-       memory. Since it is not null-terminated, we need an extra dance. */
+-    char *clone = curl_maprintf("%.*s", (int)cb, str);
+-    if(clone) {
+-      struct curl_slist *old = hdrcbdata->headlist;
+-      hdrcbdata->headlist = curl_slist_append(old, clone);
+-      curlx_free(clone);
+-      if(!hdrcbdata->headlist) {
+-        curl_slist_free_all(old);
+-        return CURL_WRITEFUNC_ERROR;
+-      }
+-    }
+-    else {
+-      curl_slist_free_all(hdrcbdata->headlist);
+-      hdrcbdata->headlist = NULL;
+-      return CURL_WRITEFUNC_ERROR;
+-    }
+-    return cb; /* done for now */
++    /* still awaiting the Content-Disposition header */
++    return buffer_header(hdrcbdata, str, cb);
+   }
+ 
+   return 0; /* ok */
+@@ -434,6 +440,7 @@ size_t tool_header_cb(char *ptr, size_t size, size_t nmemb, void *userdata)
+   const size_t cb = size * nmemb;
+   const char *end = ptr + cb;
+   const char *scheme = NULL;
++  bool cd_checked = FALSE;
+ 
+   if(!per->config)
+     return CURL_WRITEFUNC_ERROR;
+@@ -493,6 +500,9 @@ size_t tool_header_cb(char *ptr, size_t size, size_t nmemb, void *userdata)
+       size_t rc = content_disposition(str, end, cb, per, response);
+       if(rc)
+         return rc;
++      /* remember that this was checked to avoid duplicating it further
++         down */
++      cd_checked = TRUE;
+     }
+   }
+   if(hdrcbdata->config->writeout) {
+@@ -512,6 +522,13 @@ size_t tool_header_cb(char *ptr, size_t size, size_t nmemb, void *userdata)
+     /* bold headers only for selected protocols */
+     const char *value = NULL;
+ 
++    /* Informational responses, and ETag headers handled by --etag-save,
++       bypass the content-disposition handling above. Do not open the output
++       file until the filename decision is complete. Only for HTTP(S). */
++    if(hdrcbdata->honor_cd_filename && !cd_checked &&
++       (scheme == proto_http || scheme == proto_https))
++      return buffer_header(hdrcbdata, str, cb);
++
+     if(!outs->stream && !tool_create_output_file(outs, per->config))
+       return CURL_WRITEFUNC_ERROR;
+ 
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 7a9b8d0..6d12c7c 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -279,6 +279,7 @@ test3008 test3009 test3010 test3011 test3012 test3013 test3014 test3015 \
+ test3016 test3017 test3018 test3019 test3020 test3021 test3022 test3023 \
+ test3024 test3025 test3026 test3027 test3028 test3029 test3030 test3031 \
+ test3032 test3033 test3034 test3035 \
++test3037 test3038 \
+ \
+ test3100 test3101 test3102 test3103 test3104 test3105 test3109 \
+ \
+diff --git a/tests/data/test3037 b/tests/data/test3037
+new file mode 100644
+index 0000000..be29b99
+--- /dev/null
++++ b/tests/data/test3037
+@@ -0,0 +1,62 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++103
++Early Hints
++-J
++--show-headers
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data nocheck="yes">
++HTTP/1.1 103 Early Hints
++
++HTTP/1.1 200 OK
++Content-Length: 6
++Content-Disposition: attachment; filename="victim%TESTNUMBER"
++Connection: close
++
++12345
++</data>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<features>
++http
++</features>
++<name>
++Do not open output for 103 Early Hints with -J and --show-headers
++</name>
++<file name="%LOGDIR/victim%TESTNUMBER">
++original
++</file>
++<command option="no-output">
++http://%HOSTIP:%HTTPPORT/victim%TESTNUMBER -O -J -i --output-dir %LOGDIR
++</command>
++</client>
++
++<verify>
++<protocol crlf="headers">
++GET /victim%TESTNUMBER HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<errorcode>
++23
++</errorcode>
++<file name="%LOGDIR/victim%TESTNUMBER">
++original
++</file>
++</verify>
++</testcase>
+diff --git a/tests/data/test3038 b/tests/data/test3038
+new file mode 100644
+index 0000000..ff51458
+--- /dev/null
++++ b/tests/data/test3038
+@@ -0,0 +1,64 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++ETag
++--etag-save
++-J
++--show-headers
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data nocheck="yes">
++HTTP/1.1 200 OK
++ETag: "tag%TESTNUMBER"
++Content-Length: 6
++Content-Disposition: attachment; filename="victim%TESTNUMBER"
++Connection: close
++
++12345
++</data>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<features>
++http
++</features>
++<name>
++Do not open output for ETag with -J, --show-headers, --etag-save
++</name>
++<file name="%LOGDIR/victim%TESTNUMBER">
++original
++</file>
++<command option="no-output">
++http://%HOSTIP:%HTTPPORT/victim%TESTNUMBER -O -J -i --etag-save %LOGDIR/etag%TESTNUMBER --output-dir %LOGDIR
++</command>
++</client>
++
++<verify>
++<protocol crlf="headers">
++GET /victim%TESTNUMBER HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<errorcode>
++23
++</errorcode>
++<file1 name="%LOGDIR/victim%TESTNUMBER">
++original
++</file1>
++<file2 name="%LOGDIR/etag%TESTNUMBER">
++"tag%TESTNUMBER"
++</file2>
++</verify>
++</testcase>
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl/CVE-2026-92390_p2.patch b/meta/recipes-support/curl/curl/CVE-2026-92390_p2.patch
new file mode 100644
index 0000000000..24696ca27b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92390_p2.patch
@@ -0,0 +1,150 @@
+From 631ed306872956f86617df9b5664614e8a2dee54 Mon Sep 17 00:00:00 2001
+From: matty69v <matty69v@users.noreply.github.com>
+Date: Tue, 20 Oct 2026 10:28:31 +0200
+Subject: [PATCH] tool_cb_hdr: do not truncate existing file on filename-less
+ C-D header
+
+With -O -J, a Content-Disposition header without a usable filename
+(for example "inline") made curl create the URL-derived output file
+right away. When a later Content-Disposition header then named that
+same file, the no-clobber check refused it, but the file had already
+been truncated to zero bytes. The same happened when such a header came
+in a 3xx response before the Location: header with -L.
+
+Defer creating the output file until the body arrives (or the transfer
+ends), like for any other header. When the transfer ends without a body,
+also write the headers buffered for -i, which were lost before.
+
+Test 1718 verifies both.
+Closes #23501
+
+CVE: CVE-2026-92390
+Upstream-Status: Backport [https://github.com/curl/curl/commit/631ed306872956f86617df9b5664614e8a2dee54]
+
+Backport Changes:
+- Register test1718 without indentation to match curl 8.19.0's
+  grouped TESTCASES list; upstream indents the entry by two spaces.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/tool_cb_hdr.c      | 10 +++++----
+ src/tool_operate.c     |  4 ++++
+ tests/data/Makefile.am |  1 +
+ tests/data/test1718    | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 70 insertions(+), 4 deletions(-)
+
+diff --git a/src/tool_cb_hdr.c b/src/tool_cb_hdr.c
+index 15abb5b..69c0227 100644
+--- a/src/tool_cb_hdr.c
++++ b/src/tool_cb_hdr.c
+@@ -409,10 +409,12 @@ static size_t content_disposition(const char *str, const char *end,
+       }
+       break;
+     }
+-    if(!outs->stream && !tool_create_output_file(outs, per->config))
+-      return CURL_WRITEFUNC_ERROR;
+-    if(tool_write_headers(&per->hdrcbdata, outs->stream))
+-      return CURL_WRITEFUNC_ERROR;
++    /* No usable filename in this header. Do not create the output file
++       yet: a later Content-Disposition header may still provide a name, and
++       opening the URL-derived name here would truncate an existing file
++       that -J is meant to leave alone. The file is created once the body
++       arrives (or at the end of the transfer) and any buffered headers are
++       written then. */
+   } /* content-disposition handling */
+ 
+   if(hdrcbdata->honor_cd_filename &&
+diff --git a/src/tool_operate.c b/src/tool_operate.c
+index 9a29b8e..1458322 100644
+--- a/src/tool_operate.c
++++ b/src/tool_operate.c
+@@ -649,6 +649,10 @@ static CURLcode post_output_handling(struct per_transfer *per,
+     curl_easy_getinfo(curl, CURLINFO_CONDITION_UNMET, &cond_unmet);
+     if(!cond_unmet && !tool_create_output_file(outs, config))
+       return CURLE_WRITE_ERROR;
++    /* write headers buffered while waiting for a -J filename */
++    if(outs->stream && per->hdrcbdata.headlist &&
++       tool_write_headers(&per->hdrcbdata, outs->stream))
++      return CURLE_WRITE_ERROR;
+   }
+ 
+   if(!outs->regular_file && outs->stream) {
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 6d12c7c..2528286 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -230,6 +230,7 @@ test1680 test1681 test1682 test1683 test1685 \
+ \
+ test1700 test1701 test1702 test1703 test1704 test1705 test1706 test1707 \
+ test1708 test1709 test1710 test1711 test1712 \
++test1718 \
+ \
+ test1800 test1801 test1802 test1847 test1848 test1849 test1850 test1862 \
+ \
+diff --git a/tests/data/test1718 b/tests/data/test1718
+new file mode 100644
+index 0000000..c4826f3
+--- /dev/null
++++ b/tests/data/test1718
+@@ -0,0 +1,59 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++-J
++</keywords>
++</info>
++
++<reply>
++<data nocheck="yes">
++HTTP/1.1 200 OK
++Content-Disposition: inline
++Content-Disposition: attachment; filename="name%TESTNUMBER"
++Content-Length: 8
++
++PAYLOAD
++</data>
++<data2 nocheck="yes">
++HTTP/1.1 200 OK
++Content-Disposition: inline
++Content-Length: 0
++
++</data2>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<name>
++HTTP GET -OJi, filename-less Content-Disposition first
++</name>
++<command option="no-output,no-include">
++http://%HOSTIP:%HTTPPORT/%TESTNUMBER0002 http://%HOSTIP:%HTTPPORT/name%TESTNUMBER -Ji -O -O --output-dir %LOGDIR
++</command>
++<file name="%LOGDIR/name%TESTNUMBER">
++initial content
++</file>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<errorcode>
++23
++</errorcode>
++<file name="%LOGDIR/name%TESTNUMBER">
++initial content
++</file>
++<file2 name="%LOGDIR/%TESTNUMBER0002">
++HTTP/1.1 200 OK
++Content-Disposition: inline
++Content-Length: 0
++
++</file2>
++</verify>
++</testcase>
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index e5b9203678..a458a69e20 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -63,6 +63,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92391.patch \
            file://CVE-2026-87863.patch \
            file://CVE-2026-86410.patch \
+           file://CVE-2026-92390_p1.patch \
+           file://CVE-2026-92390_p2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
