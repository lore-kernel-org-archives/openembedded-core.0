Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36923.1795588400979822631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dJV00KRx;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=105153; q=dns/txt;
  s=iport01; t=1795588401; x=1796798001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=arl6KoBdwe7WbwxZqzgFa7p78mdfANfnwrpMbEkI8Xc=;
  b=dJV00KRx4qtGWk4hTbH4qXe6MaHWHJUW2QVaKkyS4vTu+z9z9YRtEBuT
   DBTVvjvj7u2lINelkjgKJGJJZehlTbgx78EMXNvU+RG9ArroQ0qD+eD7n
   zKVAAzvqH718a1DJAGr55MPxj5t95yQCHOOFwJ5iVUE/34NxYF+Kz1lgz
   PLxOi1yuOgKp641co9diRnJUm8AQUuldice3ZOQ9DzWp2J7j6cb6H7rQy
   WrlT8WkL4sfZCL7hGYLuvM37dYgLtVxDTFyxtwKBExeMUF7/3Tkiqltx7
   85MSWXHRvjuT12js1fBJKXxMZpf4Xh/D2SZOCI4mw0lyKBTssKQToZJDl
   Q==;
X-CSE-ConnectionGUID: kdZnIfvvSHegVAYs5KRiwA==
X-CSE-MsgGUID: 2pgwiB8uRqWTM850nvg4Fg==
X-IPAS-Result: =?us-ascii?q?A0BgAgChgAZr/9JK/pBTB4JZghg/dWBDSQOEGDyRdAOBE?=
 =?us-ascii?q?5A9jFkUgWQGDwEBAQ8uFg0EAQGBcQEggi1GAo4iAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAwELDgEIBAsBGAEtEAkTA?=
 =?us-ascii?q?wECAwIRFQICJwQjCBAJgipYAYJ0AxGeK5pSGzd6fzOBAYIigQcBgVTbMwELF?=
 =?us-ascii?q?AGBCi6FQoMgAYUEXRgBgkuCMycbG4FygRQBgnR2gQWBXAEBgRkKFAEKBQMBO?=
 =?us-ascii?q?xmDHYJqBIINFYEMgVQeZAmCF4MVA4VUgQUCgUmIUkiBAhwDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BKyhdASGBCIF1AoJRggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJ?=
 =?us-ascii?q?C8FGSY8GwqBDCcdHhkOAikGFiELNBgNSBEsNxUZBD0BbgeUE4IfXA4LBwEGB?=
 =?us-ascii?q?wgXAgIaCAULHAMMAQcMEAgJJh4CNgwHCA9VAQECBhYIDzwDkkMmCBQej2OCI?=
 =?us-ascii?q?YE1n1wKKIN5jCSNPnaHBhozhARNgQqSQ5JUC5h9jgoWlR8YBxULAwoDCwFBh?=
 =?us-ascii?q?GqBaDyBWXAVgm4BMwlKGQ+OKwIBCwuBFAEBYoFogypdgV1syAsmMgIJAy8BA?=
 =?us-ascii?q?QcCBwEMAQMLgWiQAAEnA3NgAQE?=
IronPort-Data: A9a23:D55dNKDs0ZFgeBVW/33iw5YqxClBgxIJ4kV8jS/XYbTApDNxhDRVy
 2QWDT2GPv2JZjH3Lt1/btzioU4AuMLWxt9hOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEwPlcCmA4I5Mj2ut4P0h/7
 qE7EjESR0XW7w626OrTpuhEj8k5ac2uN4QFtzQ4nHfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMGIHgBfoO3WjPn8bC586lea5j1H0ciZTrxSeoq9fD237klYgiuO1a4S9ltqiH91agUey9
 n/85lvFJ0FHbNqBxmar/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVncjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:TpOuJaMEtHeoLMBcThmjsMiBIKoaSvp037Dk7S9MoHtuA6qlfq
 GV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AKIprz2o2GTAlDnR3Epy/e9nmUcMpQHv8wmnOGG+?=
 =?us-ascii?q?1BlhAeabIamWR54oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AOou15A4WwhQrixsOL9GaR8mUxowy+6uxCWpdjK8?=
 =?us-ascii?q?fhPWhZXEoPSmS0Bq4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="62923036"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:33:15 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 1CB6C18000816;
	Wed, 25 Nov 2026 06:33:15 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 76CEECBF201; Tue, 24 Nov 2026 22:33:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/2] expat: fix CVE-2026-115506
Date: Tue, 24 Nov 2026 22:33:08 -0800
Message-Id: <20261125063309.3652971-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125063309.3652971-1-dkelaiya@cisco.com>
References: <20261125063309.3652971-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 06:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251165
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport early entity-expansion accounting [1], identified by [2], to
Expat 2.8.3. Compute expanded entity sizes before processing their
replacement text so amplification attacks are rejected earlier.

Normalize the projected XML_Char-unit count to bytes and reject
multiplication overflow before checking amplification. The upstream
preflight also undercounts XML_UNICODE expansion; add a regression
requiring rejection before character data reaches the application.

Include the following prerequisite changes:

Add internal testing visibility [5] so the upstream regression tests
can exercise private entity helpers.

Extract shared XML_Char string helpers [6], add bounded comparison
[7] and reusable comparison [8], and retain their unsigned-short
comparison corrections and tests [9].

Pass explicit hash-key lengths [10] and introduce bounded lookups
[11], including the unterminated-key correction [12]. The entity
scanner uses these lookups to resolve names within replacement text.

Include the CDATA, comment and processing-instruction correction
[3], which upstream specifically requires for backports [2].
Reference-looking literal text in these sections must not be charged
as entity expansion, including when sections are adjacent.

Retain the entity testability changes and regression tests [4].
Preserve Expat 2.8.3's checked int entity lengths and XML_Bool fields,
and the parser-reset behavior from the CVE-2026-113351 backport.

Represent the six upstream merges as first-parent diffs while retaining
their original commit messages.

[1] https://github.com/libexpat/libexpat/commit/c30145b28632b31f805d57f9838ba36b8db99367
[2] https://www.openwall.com/lists/oss-security/2026/11/02/6
[3] https://github.com/libexpat/libexpat/commit/b665010ec7adb64933269df970a71e581f0d92d5
[4] https://github.com/libexpat/libexpat/commit/512af15da9dfdf7675a11af595f773c139daa7cc
[5] https://github.com/libexpat/libexpat/commit/18a2b8a35ef64ec9582735ffca2406df024bf641
[6] https://github.com/libexpat/libexpat/commit/ed8c49ea053085637517347b8675f92bda229b6f
[7] https://github.com/libexpat/libexpat/commit/b109672486e11e12b4eae11e6077a41dbdf93e9b
[8] https://github.com/libexpat/libexpat/commit/88fa70b30ae6115d80517c4710e4e63ef06e9c88
[9] https://github.com/libexpat/libexpat/commit/a824e920f3d3d77930d7897c80b6925a6733aebc
[10] https://github.com/libexpat/libexpat/commit/b5ba797dfc133e5fec69aa8c8da36e1ffb5d6fc0
[11] https://github.com/libexpat/libexpat/commit/f386135b74895ccd8a6ef7631a57a7ae7a102deb
[12] https://github.com/libexpat/libexpat/commit/7069bd21df45d55f47425ef0926a77326da9acd8

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../expat/CVE-2026-115506-dependent_p1.patch  |  33 +
 .../expat/CVE-2026-115506-dependent_p2.patch  | 297 +++++++
 .../expat/CVE-2026-115506-dependent_p3.patch  |  61 ++
 .../expat/CVE-2026-115506-dependent_p4.patch  |  95 ++
 .../expat/CVE-2026-115506-dependent_p5.patch  | 240 ++++++
 .../expat/CVE-2026-115506-dependent_p6.patch  |  57 ++
 .../expat/CVE-2026-115506-dependent_p7.patch  | 106 +++
 .../expat/CVE-2026-115506-dependent_p8.patch  |  60 ++
 .../expat/expat/CVE-2026-115506_p1.patch      | 815 ++++++++++++++++++
 .../expat/expat/CVE-2026-115506_p2.patch      | 255 ++++++
 .../expat/expat/CVE-2026-115506_p3.patch      | 701 +++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |  11 +
 12 files changed, 2731 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p5.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p6.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p7.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p8.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506_p3.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p1.patch
new file mode 100644
index 0000000..94f7b77
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p1.patch
@@ -0,0 +1,33 @@
+From 18a2b8a35ef64ec9582735ffca2406df024bf641 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 3 Sep 2026 19:13:16 +0200
+Subject: [PATCH] lib: Add internal macro `XML_NONTESTING_STATIC` to ease
+ testing
+
+CVE: CVE-2026-115506
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/18a2b8a35ef64ec9582735ffca2406df024bf641]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/internal.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/internal.h b/lib/internal.h
+index 7e67d2e3..6481b6e5 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -109,6 +109,14 @@
+ #  endif
+ #endif
+ 
++#if ! defined(XML_NONTESTING_STATIC)
++#  if defined(XML_TESTING)
++#    define XML_NONTESTING_STATIC // empty i.e. not static
++#  else
++#    define XML_NONTESTING_STATIC static
++#  endif
++#endif
++
+ #include <limits.h> // ULONG_MAX
+ #include <stddef.h> // size_t
+ 
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p2.patch
new file mode 100644
index 0000000..f1f3084
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p2.patch
@@ -0,0 +1,297 @@
+From ed8c49ea053085637517347b8675f92bda229b6f Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 1 Oct 2026 16:52:36 +0200
+Subject: [PATCH] Merge pull request #1401 from
+ libexpat/resolve-xcsinc-inclusion
+
+lib|xmlwf: Resolve inclusion of file `lib/xcsinc.c`
+
+CVE: CVE-2026-115506
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/ed8c49ea053085637517347b8675f92bda229b6f]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CMakeLists.txt    |  3 ++-
+ lib/Makefile.am   |  3 ++-
+ lib/xcs.c         | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ lib/xcs.h         | 41 +++++++++++++++++++++++++++++++++++++
+ lib/xcsinc.c      | 54 -------------------------------------------------
+ lib/xmlparse.c    |  2 +-
+ tests/chardata.c  |  2 +-
+ xmlwf/Makefile.am |  1 +
+ xmlwf/xmlwf.c     |  2 +-
+ 9 files changed, 109 insertions(+), 59 deletions(-)
+ create mode 100644 lib/xcs.c
+ create mode 100644 lib/xcs.h
+ delete mode 100644 lib/xcsinc.c
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a2db500e..d489cc94 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -411,11 +411,11 @@ endif()
+ # C library
+ #
+ set(_EXPAT_C_SOURCES
++    lib/xcs.c
+     lib/xmlparse.c
+     lib/xmlrole.c
+     lib/xmltok.c
+ # NOTE: ISO C forbids an empty translation unit
+-#   lib/xcsinc.c
+ #   lib/xmltok_impl.c
+ #   lib/xmltok_ns.c
+ )
+@@ -657,6 +657,7 @@ endif()
+ #
+ if(EXPAT_BUILD_TOOLS)
+     set(xmlwf_SRCS
++        lib/xcs.c
+         xmlwf/codepage.c
+         xmlwf/readfilemap.c
+         xmlwf/xmlfile.c
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 2b6aec2e..36299b2e 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -53,6 +53,7 @@ libexpat_la_LDFLAGS += $(VSCRIPT_LDFLAGS),@builddir@/libexpat.map
+ endif
+ 
+ libexpat_la_SOURCES = \
++    xcs.c \
+     xmlparse.c \
+     xmltok.c \
+     xmlrole.c
+@@ -124,7 +125,7 @@ EXTRA_DIST = \
+     siphash.h \
+     utf8tab.h \
+     winconfig.h \
+-    xcsinc.c \
++    xcs.h \
+     xmlrole.h \
+     xmltok.h \
+     xmltok_impl.c \
+diff --git a/lib/xcs.c b/lib/xcs.c
+new file mode 100644
+index 00000000..bd634f65
+--- /dev/null
++++ b/lib/xcs.c
+@@ -0,0 +1,60 @@
++/*
++                            __  __            _
++                         ___\ \/ /_ __   __ _| |_
++                        / _ \\  /| '_ \ / _` | __|
++                       |  __//  \| |_) | (_| | |_
++                        \___/_/\_\ .__/ \__,_|\__|
++                                 |_| XML parser
++
++   Copyright (c) 2022-2026 Sebastian Pipping <sebastian@pipping.org>
++   Licensed under the MIT license:
++
++   Permission is  hereby granted,  free of charge,  to any  person obtaining
++   a  copy  of  this  software   and  associated  documentation  files  (the
++   "Software"),  to  deal in  the  Software  without restriction,  including
++   without  limitation the  rights  to use,  copy,  modify, merge,  publish,
++   distribute, sublicense, and/or sell copies of the Software, and to permit
++   persons  to whom  the Software  is  furnished to  do so,  subject to  the
++   following conditions:
++
++   The above copyright  notice and this permission notice  shall be included
++   in all copies or substantial portions of the Software.
++
++   THE  SOFTWARE  IS  PROVIDED  "AS  IS",  WITHOUT  WARRANTY  OF  ANY  KIND,
++   EXPRESS  OR IMPLIED,  INCLUDING  BUT  NOT LIMITED  TO  THE WARRANTIES  OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
++   NO EVENT SHALL THE AUTHORS OR  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
++   DAMAGES OR  OTHER LIABILITY, WHETHER  IN AN  ACTION OF CONTRACT,  TORT OR
++   OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
++   USE OR OTHER DEALINGS IN THE SOFTWARE.
++
++   SPDX-License-Identifier: MIT
++*/
++
++#include "xcs.h"
++
++#if defined(XML_UNICODE)
++#  if defined(XML_UNICODE_WCHAR_T)
++#    include <wchar.h> // for wcslen
++#  endif
++#else
++#  include <string.h> // for strlen
++#endif
++
++size_t
++xcslen(const XML_Char *s) {
++#ifdef XML_UNICODE
++#  ifdef XML_UNICODE_WCHAR_T
++  return wcslen(s);
++#  else
++  // XML_Char is unsigned short
++  size_t len = 0;
++  while (s[len]) {
++    len++;
++  }
++  return len;
++#  endif
++#else
++  return strlen(s);
++#endif
++}
+diff --git a/lib/xcs.h b/lib/xcs.h
+new file mode 100644
+index 00000000..9479ddf9
+--- /dev/null
++++ b/lib/xcs.h
+@@ -0,0 +1,41 @@
++/*
++                            __  __            _
++                         ___\ \/ /_ __   __ _| |_
++                        / _ \\  /| '_ \ / _` | __|
++                       |  __//  \| |_) | (_| | |_
++                        \___/_/\_\ .__/ \__,_|\__|
++                                 |_| XML parser
++
++   Copyright (c) 2026 Sebastian Pipping <sebastian@pipping.org>
++   Licensed under the MIT license:
++
++   Permission is  hereby granted,  free of charge,  to any  person obtaining
++   a  copy  of  this  software   and  associated  documentation  files  (the
++   "Software"),  to  deal in  the  Software  without restriction,  including
++   without  limitation the  rights  to use,  copy,  modify, merge,  publish,
++   distribute, sublicense, and/or sell copies of the Software, and to permit
++   persons  to whom  the Software  is  furnished to  do so,  subject to  the
++   following conditions:
++
++   The above copyright  notice and this permission notice  shall be included
++   in all copies or substantial portions of the Software.
++
++   THE  SOFTWARE  IS  PROVIDED  "AS  IS",  WITHOUT  WARRANTY  OF  ANY  KIND,
++   EXPRESS  OR IMPLIED,  INCLUDING  BUT  NOT LIMITED  TO  THE WARRANTIES  OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
++   NO EVENT SHALL THE AUTHORS OR  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
++   DAMAGES OR  OTHER LIABILITY, WHETHER  IN AN  ACTION OF CONTRACT,  TORT OR
++   OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
++   USE OR OTHER DEALINGS IN THE SOFTWARE.
++
++   SPDX-License-Identifier: MIT
++*/
++
++#if ! defined(EXPAT_XCS_H)
++
++#  include <stddef.h>         // size_t
++#  include "expat_external.h" // for  XML_Char
++
++extern size_t xcslen(const XML_Char *s);
++
++#endif // ! defined(EXPAT_XCS_H)
+diff --git a/lib/xcsinc.c b/lib/xcsinc.c
+deleted file mode 100644
+index 675b2844..00000000
+--- a/lib/xcsinc.c
++++ /dev/null
+@@ -1,54 +0,0 @@
+-/* This file is included from other .c files!
+-                            __  __            _
+-                         ___\ \/ /_ __   __ _| |_
+-                        / _ \\  /| '_ \ / _` | __|
+-                       |  __//  \| |_) | (_| | |_
+-                        \___/_/\_\ .__/ \__,_|\__|
+-                                 |_| XML parser
+-
+-   Copyright (c) 2022-2026 Sebastian Pipping <sebastian@pipping.org>
+-   Licensed under the MIT license:
+-
+-   Permission is  hereby granted,  free of charge,  to any  person obtaining
+-   a  copy  of  this  software   and  associated  documentation  files  (the
+-   "Software"),  to  deal in  the  Software  without restriction,  including
+-   without  limitation the  rights  to use,  copy,  modify, merge,  publish,
+-   distribute, sublicense, and/or sell copies of the Software, and to permit
+-   persons  to whom  the Software  is  furnished to  do so,  subject to  the
+-   following conditions:
+-
+-   The above copyright  notice and this permission notice  shall be included
+-   in all copies or substantial portions of the Software.
+-
+-   THE  SOFTWARE  IS  PROVIDED  "AS  IS",  WITHOUT  WARRANTY  OF  ANY  KIND,
+-   EXPRESS  OR IMPLIED,  INCLUDING  BUT  NOT LIMITED  TO  THE WARRANTIES  OF
+-   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
+-   NO EVENT SHALL THE AUTHORS OR  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
+-   DAMAGES OR  OTHER LIABILITY, WHETHER  IN AN  ACTION OF CONTRACT,  TORT OR
+-   OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+-   USE OR OTHER DEALINGS IN THE SOFTWARE.
+-
+-   SPDX-License-Identifier: MIT
+-*/
+-
+-#if defined(XML_UNICODE) && defined(XML_UNICODE_WCHAR_T)
+-#  include <wchar.h>
+-#endif
+-
+-static size_t
+-xcslen(const XML_Char *s) {
+-#ifdef XML_UNICODE
+-#  ifdef XML_UNICODE_WCHAR_T
+-  return wcslen(s);
+-#  else
+-  // XML_Char is unsigned short
+-  size_t len = 0;
+-  while (s[len]) {
+-    len++;
+-  }
+-  return len;
+-#  endif
+-#else
+-  return strlen(s);
+-#endif
+-}
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 792d2650..d7158f3c 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -120,7 +120,7 @@
+ #include "ascii.h"
+ #include "expat.h"
+ #include "siphash.h"
+-#include "xcsinc.c"
++#include "xcs.h"
+ 
+ #if defined(HAVE_ARC4RANDOM)
+ #  include "random_arc4random.h"
+diff --git a/tests/chardata.c b/tests/chardata.c
+index a36d58c2..987b1fb3 100644
+--- a/tests/chardata.c
++++ b/tests/chardata.c
+@@ -49,7 +49,7 @@
+ #include <string.h>
+ 
+ #include "chardata.h"
+-#include "../lib/xcsinc.c"
++#include "../lib/xcs.h"
+ 
+ void
+ CharData_Init(CharData *storage) {
+diff --git a/xmlwf/Makefile.am b/xmlwf/Makefile.am
+index c7eebd1e..63594055 100644
+--- a/xmlwf/Makefile.am
++++ b/xmlwf/Makefile.am
+@@ -32,6 +32,7 @@ bin_PROGRAMS = xmlwf
+ 
+ xmlwf_LDADD = ../lib/libexpat.la
+ xmlwf_SOURCES = \
++    ../lib/xcs.c \
+     xmlwf.c \
+     xmlfile.c \
+     codepage.c \
+diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c
+index 57beef1f..b42a1e34 100644
+--- a/xmlwf/xmlwf.c
++++ b/xmlwf/xmlwf.c
+@@ -72,7 +72,7 @@
+ #  include <wchar.h>
+ #endif
+ 
+-#include "../lib/xcsinc.c"
++#include "../lib/xcs.h"
+ 
+ enum ExitCode {
+   XMLWF_EXIT_SUCCESS = 0,
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p3.patch b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p3.patch
new file mode 100644
index 0000000..648f9f4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p3.patch
@@ -0,0 +1,61 @@
+From b109672486e11e12b4eae11e6077a41dbdf93e9b Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 1 Oct 2026 17:23:49 +0200
+Subject: [PATCH] lib: Introduce function `xcsncmp`
+
+CVE: CVE-2026-115506
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/b109672486e11e12b4eae11e6077a41dbdf93e9b]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xcs.c | 19 +++++++++++++++++--
+ lib/xcs.h |  1 +
+ 2 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/lib/xcs.c b/lib/xcs.c
+index bd634f65..66ebbd26 100644
+--- a/lib/xcs.c
++++ b/lib/xcs.c
+@@ -35,10 +35,10 @@
+ 
+ #if defined(XML_UNICODE)
+ #  if defined(XML_UNICODE_WCHAR_T)
+-#    include <wchar.h> // for wcslen
++#    include <wchar.h> // for wcslen, wcsncmp
+ #  endif
+ #else
+-#  include <string.h> // for strlen
++#  include <string.h> // for strlen, strncmp
+ #endif
+ 
+ size_t
+@@ -58,3 +58,18 @@ xcslen(const XML_Char *s) {
+   return strlen(s);
+ #endif
+ }
++
++int
++xcsncmp(const XML_Char *a, const XML_Char *b, size_t len) {
++#if defined(XML_UNICODE)
++#  if defined(XML_UNICODE_WCHAR_T)
++  return wcsncmp(a, b, len);
++#  else
++  for (; len > 0 && a[0] && b[0]; len--, a++, b++)
++    ;
++  return a[0] - b[0];
++#  endif
++#else
++  return strncmp(a, b, len);
++#endif
++}
+diff --git a/lib/xcs.h b/lib/xcs.h
+index 9479ddf9..6225dd28 100644
+--- a/lib/xcs.h
++++ b/lib/xcs.h
+@@ -37,5 +37,6 @@
+ #  include "expat_external.h" // for  XML_Char
+ 
+ extern size_t xcslen(const XML_Char *s);
++extern int xcsncmp(const XML_Char *a, const XML_Char *b, size_t len);
+ 
+ #endif // ! defined(EXPAT_XCS_H)
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p4.patch b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p4.patch
new file mode 100644
index 0000000..9a2a108
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p4.patch
@@ -0,0 +1,95 @@
+From 88fa70b30ae6115d80517c4710e4e63ef06e9c88 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 1 Oct 2026 17:21:45 +0200
+Subject: [PATCH] lib|xmlwf: Introduce re-written `xcscmp`
+
+CVE: CVE-2026-115506
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/88fa70b30ae6115d80517c4710e4e63ef06e9c88]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xcs.c     | 19 +++++++++++++++++--
+ lib/xcs.h     |  2 ++
+ xmlwf/xmlwf.c | 17 -----------------
+ 3 files changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/lib/xcs.c b/lib/xcs.c
+index 66ebbd26..2d744e10 100644
+--- a/lib/xcs.c
++++ b/lib/xcs.c
+@@ -35,10 +35,10 @@
+ 
+ #if defined(XML_UNICODE)
+ #  if defined(XML_UNICODE_WCHAR_T)
+-#    include <wchar.h> // for wcslen, wcsncmp
++#    include <wchar.h> // for wcscmp, wcslen, wcsncmp
+ #  endif
+ #else
+-#  include <string.h> // for strlen, strncmp
++#  include <string.h> // for strcmp, strlen, strncmp
+ #endif
+ 
+ size_t
+@@ -59,6 +59,21 @@ xcslen(const XML_Char *s) {
+ #endif
+ }
+ 
++int
++xcscmp(const XML_Char *a, const XML_Char *b) {
++#if defined(XML_UNICODE)
++#  if defined(XML_UNICODE_WCHAR_T)
++  return wcscmp(a, b);
++#  else
++  for (; a[0] && b[0]; a++, b++)
++    ;
++  return a[0] - b[0];
++#  endif
++#else
++  return strcmp(a, b);
++#endif
++}
++
+ int
+ xcsncmp(const XML_Char *a, const XML_Char *b, size_t len) {
+ #if defined(XML_UNICODE)
+diff --git a/lib/xcs.h b/lib/xcs.h
+index 6225dd28..1b942647 100644
+--- a/lib/xcs.h
++++ b/lib/xcs.h
+@@ -37,6 +37,8 @@
+ #  include "expat_external.h" // for  XML_Char
+ 
+ extern size_t xcslen(const XML_Char *s);
++
++extern int xcscmp(const XML_Char *a, const XML_Char *b);
+ extern int xcsncmp(const XML_Char *a, const XML_Char *b, size_t len);
+ 
+ #endif // ! defined(EXPAT_XCS_H)
+diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c
+index b42a1e34..18748e37 100644
+--- a/xmlwf/xmlwf.c
++++ b/xmlwf/xmlwf.c
+@@ -359,23 +359,6 @@ cleanupUserData(XmlwfUserData *userData) {
+   freeNotations(userData);
+ }
+ 
+-static int
+-xcscmp(const XML_Char *xs, const XML_Char *xt) {
+-  while (*xs != 0 && *xt != 0) {
+-    if (*xs < *xt)
+-      return -1;
+-    if (*xs > *xt)
+-      return 1;
+-    xs++;
+-    xt++;
+-  }
+-  if (*xs < *xt)
+-    return -1;
+-  if (*xs > *xt)
+-    return 1;
+-  return 0;
+-}
+-
+ static int
+ notationCmp(const void *a, const void *b) {
+   const NotationList *const n1 = *(const NotationList *const *)a;
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p5.patch b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p5.patch
new file mode 100644
index 0000000..c51ff26
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p5.patch
@@ -0,0 +1,240 @@
+From a824e920f3d3d77930d7897c80b6925a6733aebc Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 2 Oct 2026 21:16:46 +0200
+Subject: [PATCH] Merge pull request #1405 from libexpat/xcs-test-coverage
+
+tests: Start covering xcs functionality + fix for ushort characters (follow-up to #1402)
+
+CVE: CVE-2026-115506
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/a824e920f3d3d77930d7897c80b6925a6733aebc]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CMakeLists.txt    |  1 +
+ lib/xcs.c         |  8 +++---
+ tests/Makefile.am |  4 ++-
+ tests/runtests.c  |  2 ++
+ tests/xcs_tests.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ tests/xcs_tests.h | 41 ++++++++++++++++++++++++++
+ 6 files changed, 137 insertions(+), 5 deletions(-)
+ create mode 100644 tests/xcs_tests.c
+ create mode 100644 tests/xcs_tests.h
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d489cc94..83da1a25 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -740,6 +740,7 @@ if(EXPAT_BUILD_TESTS)
+         tests/nsalloc_tests.c
+         tests/runtests.c
+         tests/structdata.c
++        tests/xcs_tests.c
+         ${_EXPAT_C_SOURCES}
+     )
+ 
+diff --git a/lib/xcs.c b/lib/xcs.c
+index 2d744e10..ae5e042d 100644
+--- a/lib/xcs.c
++++ b/lib/xcs.c
+@@ -65,7 +65,7 @@ xcscmp(const XML_Char *a, const XML_Char *b) {
+ #  if defined(XML_UNICODE_WCHAR_T)
+   return wcscmp(a, b);
+ #  else
+-  for (; a[0] && b[0]; a++, b++)
++  for (; a[0] && b[0] && a[0] == b[0]; a++, b++)
+     ;
+   return a[0] - b[0];
+ #  endif
+@@ -80,9 +80,9 @@ xcsncmp(const XML_Char *a, const XML_Char *b, size_t len) {
+ #  if defined(XML_UNICODE_WCHAR_T)
+   return wcsncmp(a, b, len);
+ #  else
+-  for (; len > 0 && a[0] && b[0]; len--, a++, b++)
+-    ;
+-  return a[0] - b[0];
++  for (; len > 0 && a[0] && b[0] && a[0] == b[0]; len--, a++, b++) {
++  }
++  return (len == 0) ? 0 : (a[0] - b[0]);
+ #  endif
+ #else
+   return strncmp(a, b, len);
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index eefcfe02..2be03dc3 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -55,7 +55,8 @@ runtests_SOURCES = \
+     ns_tests.c \
+     nsalloc_tests.c \
+     runtests.c \
+-    structdata.c
++    structdata.c \
++    xcs_tests.c
+ 
+ runtests_LDADD = ../lib/libtestpat.la
+ 
+@@ -77,5 +78,6 @@ EXTRA_DIST = \
+     memcheck.h \
+     README.md \
+     udiffer.py \
++    xcs_tests.h \
+     xmltest.log.expected \
+     xmltest.sh
+diff --git a/tests/runtests.c b/tests/runtests.c
+index 51fd131e..20c7ec95 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -60,6 +60,7 @@
+ #include "alloc_tests.h"
+ #include "nsalloc_tests.h"
+ #include "acc_tests.h"
++#include "xcs_tests.h"
+ 
+ XML_Parser g_parser = NULL;
+ 
+@@ -76,6 +77,7 @@ make_suite(void) {
+   make_accounting_test_case(s);
+ #endif
+ 
++  make_xcs_test_case(s);
+   return s;
+ }
+ 
+diff --git a/tests/xcs_tests.c b/tests/xcs_tests.c
+new file mode 100644
+index 00000000..3d756b04
+--- /dev/null
++++ b/tests/xcs_tests.c
+@@ -0,0 +1,86 @@
++/* Tests related to the XCS (XML character string) functionality
++__  __            _
++                         ___\ \/ /_ __   __ _| |_
++                        / _ \\  /| '_ \ / _` | __|
++                       |  __//  \| |_) | (_| | |_
++                        \___/_/\_\ .__/ \__,_|\__|
++                                 |_| XML parser
++
++   Copyright (c) 2026 Sebastian Pipping <sebastian@pipping.org>
++   Licensed under the MIT license:
++
++   Permission is  hereby granted,  free of charge,  to any  person obtaining
++   a  copy  of  this  software   and  associated  documentation  files  (the
++   "Software"),  to  deal in  the  Software  without restriction,  including
++   without  limitation the  rights  to use,  copy,  modify, merge,  publish,
++   distribute, sublicense, and/or sell copies of the Software, and to permit
++   persons  to whom  the Software  is  furnished to  do so,  subject to  the
++   following conditions:
++
++   The above copyright  notice and this permission notice  shall be included
++   in all copies or substantial portions of the Software.
++
++   THE  SOFTWARE  IS  PROVIDED  "AS  IS",  WITHOUT  WARRANTY  OF  ANY  KIND,
++   EXPRESS  OR IMPLIED,  INCLUDING  BUT  NOT LIMITED  TO  THE WARRANTIES  OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
++   NO EVENT SHALL THE AUTHORS OR  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
++   DAMAGES OR  OTHER LIABILITY, WHETHER  IN AN  ACTION OF CONTRACT,  TORT OR
++   OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
++   USE OR OTHER DEALINGS IN THE SOFTWARE.
++
++   SPDX-License-Identifier: MIT
++*/
++
++#include "xcs_tests.h"
++
++#include "ascii.h"
++#include "common.h" // for g_chunkSize
++#include "xcs.h"    // for xcslen, xcscmp, xcsncmp
++
++static const XML_Char empty[] = {'\0'};
++static const XML_Char test[] = {ASCII_T, ASCII_E, ASCII_S, ASCII_T, '\0'};
++static const XML_Char testing[]
++    = {ASCII_T, ASCII_E, ASCII_S, ASCII_T, ASCII_I, ASCII_N, ASCII_G, '\0'};
++
++START_TEST(test_xcs_len) {
++  if (g_chunkSize != 0)
++    return;
++
++  assert_true(xcslen(empty) == 0);
++  assert_true(xcslen(test) == 4);
++}
++END_TEST
++
++START_TEST(test_xcs_cmp) {
++  if (g_chunkSize != 0)
++    return;
++
++  assert_true(xcscmp(test, test) == 0);
++  assert_true(xcscmp(test, testing) < 0);
++  assert_true(xcscmp(testing, test) > 0);
++}
++END_TEST
++
++START_TEST(test_xcs_ncmp) {
++  if (g_chunkSize != 0)
++    return;
++
++  assert_true(xcsncmp(test, test, 0) == 0);
++  assert_true(xcsncmp(test, test, 4) == 0);
++
++  assert_true(xcsncmp(test, testing, 4) == 0);
++  assert_true(xcsncmp(testing, test, 4) == 0);
++
++  assert_true(xcsncmp(test, testing, 5) < 0);
++  assert_true(xcsncmp(testing, test, 5) > 0);
++}
++END_TEST
++
++void
++make_xcs_test_case(Suite *s) {
++  TCase *const tc_xcs = tcase_create("xcs tests");
++  suite_add_tcase(s, tc_xcs);
++  tcase_add_test(tc_xcs, test_xcs_len);
++  tcase_add_test(tc_xcs, test_xcs_cmp);
++  tcase_add_test(tc_xcs, test_xcs_ncmp);
++}
+diff --git a/tests/xcs_tests.h b/tests/xcs_tests.h
+new file mode 100644
+index 00000000..52015f14
+--- /dev/null
++++ b/tests/xcs_tests.h
+@@ -0,0 +1,41 @@
++/* Tests related to the XCS (XML character string) functionality
++__  __            _
++                         ___\ \/ /_ __   __ _| |_
++                        / _ \\  /| '_ \ / _` | __|
++                       |  __//  \| |_) | (_| | |_
++                        \___/_/\_\ .__/ \__,_|\__|
++                                 |_| XML parser
++
++   Copyright (c) 2026 Sebastian Pipping <sebastian@pipping.org>
++   Licensed under the MIT license:
++
++   Permission is  hereby granted,  free of charge,  to any  person obtaining
++   a  copy  of  this  software   and  associated  documentation  files  (the
++   "Software"),  to  deal in  the  Software  without restriction,  including
++   without  limitation the  rights  to use,  copy,  modify, merge,  publish,
++   distribute, sublicense, and/or sell copies of the Software, and to permit
++   persons  to whom  the Software  is  furnished to  do so,  subject to  the
++   following conditions:
++
++   The above copyright  notice and this permission notice  shall be included
++   in all copies or substantial portions of the Software.
++
++   THE  SOFTWARE  IS  PROVIDED  "AS  IS",  WITHOUT  WARRANTY  OF  ANY  KIND,
++   EXPRESS  OR IMPLIED,  INCLUDING  BUT  NOT LIMITED  TO  THE WARRANTIES  OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
++   NO EVENT SHALL THE AUTHORS OR  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
++   DAMAGES OR  OTHER LIABILITY, WHETHER  IN AN  ACTION OF CONTRACT,  TORT OR
++   OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
++   USE OR OTHER DEALINGS IN THE SOFTWARE.
++
++   SPDX-License-Identifier: MIT
++*/
++
++#ifndef XML_XCS_TESTS_H
++#define XML_XCS_TESTS_H
++
++#include "minicheck.h"
++
++extern void make_xcs_test_case(Suite *s);
++
++#endif /* XML_XCS_TESTS_H */
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p6.patch b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p6.patch
new file mode 100644
index 0000000..2e6b45c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p6.patch
@@ -0,0 +1,57 @@
+From b5ba797dfc133e5fec69aa8c8da36e1ffb5d6fc0 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 7 Aug 2026 13:31:05 +0200
+Subject: [PATCH] Pass key length to function `hash` explicitly
+
+This refactoring prepares for an upcoming extension.
+
+CVE: CVE-2026-115506
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/b5ba797dfc133e5fec69aa8c8da36e1ffb5d6fc0]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index d7158f3c..a7de00b2 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -8013,13 +8013,13 @@ copy_salt_to_sipkey(XML_Parser parser, struct sipkey *key) {
+ }
+ 
+ static unsigned long FASTCALL
+-hash(XML_Parser parser, KEY s) {
++hash(XML_Parser parser, KEY s, size_t keyLen) {
+   struct siphash state;
+   struct sipkey key;
+   (void)sip24_valid;
+   copy_salt_to_sipkey(parser, &key);
+   sip24_init(&state, &key);
+-  sip24_update(&state, s, keylen(s) * sizeof(XML_Char));
++  sip24_update(&state, s, keyLen * sizeof(XML_Char));
+   return (unsigned long)sip24_final(&state);
+ }
+ 
+@@ -8040,9 +8040,9 @@ lookup(XML_Parser parser, HASH_TABLE *table, KEY name, size_t createSize) {
+       return NULL;
+     }
+     memset(table->v, 0, tsize);
+-    i = hash(parser, name) & ((unsigned long)table->size - 1);
++    i = hash(parser, name, keylen(name)) & ((unsigned long)table->size - 1);
+   } else {
+-    unsigned long h = hash(parser, name);
++    unsigned long h = hash(parser, name, keylen(name));
+     unsigned long mask = (unsigned long)table->size - 1;
+     unsigned char step = 0;
+     i = h & mask;
+@@ -8080,7 +8080,8 @@ lookup(XML_Parser parser, HASH_TABLE *table, KEY name, size_t createSize) {
+       memset(newV, 0, tsize);
+       for (i = 0; i < table->size; i++)
+         if (table->v[i]) {
+-          unsigned long newHash = hash(parser, table->v[i]->name);
++          KEY const key = table->v[i]->name;
++          unsigned long newHash = hash(parser, key, keylen(key));
+           size_t j = newHash & newMask;
+           step = 0;
+           while (newV[j]) {
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p7.patch b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p7.patch
new file mode 100644
index 0000000..eb81ab9
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p7.patch
@@ -0,0 +1,106 @@
+From f386135b74895ccd8a6ef7631a57a7ae7a102deb Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 7 Aug 2026 13:44:22 +0200
+Subject: [PATCH] Extract function `lookupWithLength`
+
+.. that allows read-only access to a hash table with keys that
+are *not* zero-terminated. This helps code coming up after.
+
+Also document essential operation of both functions.
+
+CVE: CVE-2026-115506
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/f386135b74895ccd8a6ef7631a57a7ae7a102deb]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 46 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index a7de00b2..b77d07e5 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -596,6 +596,8 @@ static int dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+                    XML_Parser parser);
+ static int copyEntityTable(XML_Parser oldParser, HASH_TABLE *newTable,
+                            STRING_POOL *newPool, const HASH_TABLE *oldTable);
++static NAMED *lookupWithLength(XML_Parser parser, HASH_TABLE *table, KEY name,
++                               size_t nameLen, size_t createSize);
+ static NAMED *lookup(XML_Parser parser, HASH_TABLE *table, KEY name,
+                      size_t createSize);
+ static void FASTCALL hashTableInit(HASH_TABLE *table, XML_Parser parser);
+@@ -8023,8 +8025,28 @@ hash(XML_Parser parser, KEY s, size_t keyLen) {
+   return (unsigned long)sip24_final(&state);
+ }
+ 
++// Function `lookupWithLength` can be used to either…
++//
++// a) check whether an element with key `name` exists in the given hash table
++//    (read-only mode where `createSize == 0`) or
++//
++// b) check whether an element with key `name` exists in the given hash table
++//    *and* insert it if missing (i.e. read-write mode where `createSize != 0`.
++//
++// When inserting, a block of `createSize` number of bytes will be allocated
++// and set to zero, and the resulting block of memory will be considered
++// to start with a `NAMED` structure, and `->name = name;` is performed.
++// The fact that all other bytes in the structure are initially zero can
++// be used to tell cases "existed and found" and "newly inserted" apart
++// with the structure returned.
++//
++// NOTE: Read-only lookup does not need zero-terminated keys but
++//       read-write mode does, because keys can be re-hashed later and the
++//       hash table does not store key length information.
++//
+ static NAMED *
+-lookup(XML_Parser parser, HASH_TABLE *table, KEY name, size_t createSize) {
++lookupWithLength(XML_Parser parser, HASH_TABLE *table, KEY name, size_t nameLen,
++                 size_t createSize) {
+   size_t i;
+   if (table->size == 0) {
+     size_t tsize;
+@@ -8040,9 +8062,9 @@ lookup(XML_Parser parser, HASH_TABLE *table, KEY name, size_t createSize) {
+       return NULL;
+     }
+     memset(table->v, 0, tsize);
+-    i = hash(parser, name, keylen(name)) & ((unsigned long)table->size - 1);
++    i = hash(parser, name, nameLen) & ((unsigned long)table->size - 1);
+   } else {
+-    unsigned long h = hash(parser, name, keylen(name));
++    unsigned long h = hash(parser, name, nameLen);
+     unsigned long mask = (unsigned long)table->size - 1;
+     unsigned char step = 0;
+     i = h & mask;
+@@ -8108,11 +8130,31 @@ lookup(XML_Parser parser, HASH_TABLE *table, KEY name, size_t createSize) {
+   if (! table->v[i])
+     return NULL;
+   memset(table->v[i], 0, createSize);
+-  table->v[i]->name = name;
++  table->v[i]->name = name; // NOTE: This requires and assumes zero termination!
+   (table->used)++;
+   return table->v[i];
+ }
+ 
++// Function `lookup` can be used to either…
++//
++// a) check whether an element with key `name` exists in the given hash table
++//    (read-only mode where `createSize == 0`) or
++//
++// b) check whether an element with key `name` exists in the given hash table
++//    *and* insert it if missing (i.e. read-write mode where `createSize != 0`.
++//
++// When inserting, a block of `createSize` number of bytes will be allocated
++// and set to zero, and the resulting block of memory will be considered
++// to start with a `NAMED` structure, and `->name = name;` is performed.
++// The fact that all other bytes in the structure are initially zero can
++// be used to tell cases "existed and found" and "newly inserted" apart
++// with the structure returned.
++//
++static NAMED *
++lookup(XML_Parser parser, HASH_TABLE *table, KEY name, size_t createSize) {
++  return lookupWithLength(parser, table, name, keylen(name), createSize);
++}
++
+ static void FASTCALL
+ hashTableClear(HASH_TABLE *table) {
+   size_t i;
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p8.patch b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p8.patch
new file mode 100644
index 0000000..40fa9df
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p8.patch
@@ -0,0 +1,60 @@
+From 7069bd21df45d55f47425ef0926a77326da9acd8 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 24 Aug 2026 11:31:37 +0200
+Subject: [PATCH] Merge pull request #1334 from
+ libexpat/lookup-key-without-zero-termination
+
+lib: Make read-only hash table lookup work for unterminated keys (follow-up to #1325)
+
+CVE: CVE-2026-115506
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/7069bd21df45d55f47425ef0926a77326da9acd8]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index b77d07e5..893210e8 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7985,19 +7985,23 @@ copyEntityTable(XML_Parser oldParser, HASH_TABLE *newTable,
+ 
+ #define INIT_POWER 6
+ 
++// Compares two strings `s1` and `s2` whereas:
++// - `s2` is zero-terminated but
++// - `s1` is made up of exactly (not just up to) `s1len` non-zero characters.
+ static XML_Bool FASTCALL
+-keyeq(KEY s1, KEY s2) {
++keyeq(KEY s1, size_t s1len, KEY s2) {
+ #ifdef XML_UNICODE
+ #  ifdef XML_UNICODE_WCHAR_T
+-  return (wcscmp(s1, s2) == 0) ? XML_TRUE : XML_FALSE;
++  return (wcsncmp(s1, s2, s1len) == 0 && s2[s1len] == L'\0') ? XML_TRUE
++                                                             : XML_FALSE;
+ #  else
+-  for (; *s1 == *s2; s1++, s2++)
+-    if (*s1 == 0)
+-      return XML_TRUE;
+-  return XML_FALSE;
++  for (; s1len > 0 && *s1 == *s2; s1len--, s1++, s2++)
++    ; /* no loop body! */
++  return ((s1len == 0) && (*s2 == 0)) ? XML_TRUE : XML_FALSE;
+ #  endif
+ #else
+-  return (strcmp(s1, s2) == 0) ? XML_TRUE : XML_FALSE;
++  return (strncmp(s1, s2, s1len) == 0 && s2[s1len] == '\0') ? XML_TRUE
++                                                            : XML_FALSE;
+ #endif
+ }
+ 
+@@ -8069,7 +8073,7 @@ lookupWithLength(XML_Parser parser, HASH_TABLE *table, KEY name, size_t nameLen,
+     unsigned char step = 0;
+     i = h & mask;
+     while (table->v[i]) {
+-      if (keyeq(name, table->v[i]->name))
++      if (keyeq(name, nameLen, table->v[i]->name))
+         return table->v[i];
+       if (! step)
+         step = PROBE_STEP(h, mask, table->power);
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-115506_p1.patch
new file mode 100644
index 0000000..85a7be7
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506_p1.patch
@@ -0,0 +1,815 @@
+From c30145b28632b31f805d57f9838ba36b8db99367 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 23 Oct 2026 15:42:21 +0200
+Subject: [PATCH] Merge pull request #1433 from shani-any/issue3
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[CVE-2026-115506] Precompute entity expanded sizes to detect amplification attacks early
+
+CVE: CVE-2026-115506
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/c30145b28632b31f805d57f9838ba36b8db99367]
+
+Backport Changes:
+- Use %d for the expanded-size diagnostic's retained int textLen.
+  Cast textLen to size_t in the scan-completion comparison.
+- Convert cached XML_Char units to bytes with checked multiplication
+  before the early amplification check. Correct the size-unit comments
+  too; the cited upstream fix undercounts UTF-16 expansion.
+
+Co-authored-by: Shani Yosef <shani.yosef@echo.ai>
+Co-authored-by: Berkay Eren Ürün <berkay.ueruen@siemens.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 514 ++++++++++++++++++++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 471 insertions(+), 43 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 893210e..34bb7d2 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -321,6 +321,8 @@ typedef struct tag {
+   BINDING *bindings;
+ } TAG;
+ 
++typedef unsigned long long XmlBigCount;
++
+ typedef struct {
+   const XML_Char *name;
+   const XML_Char *textPtr;
+@@ -337,6 +339,20 @@ typedef struct {
+     entities are processed and closed */
+   XML_Bool is_param;
+   XML_Bool is_internal; /* true if declared in internal subset outside PE */
++#if XML_GE == 1
++  /* Indirect accounting size in XML_Char units: 1 per text unit, plus each
++     reference's "&name;"/"%name;" token length and its own expansion. Multiply
++     by sizeof(XML_Char) to match XML_ACCOUNT_ENTITY_EXPANSION. This is not the
++     replacement-text size. 0 means "not computed yet" (an empty entity is 0
++     too, told apart by textLen == 0). */
++  XmlBigCount expandedSize;
++  bool beingAnalyzed; /* on the resolveEntityClosureExpandedSize depth-first
++                             search stack; used for cycle detection */
++  const XML_Char
++      *scanPtr; /* cursor position into the entity's replacement text; NULL when
++                   `textPtr` is NULL, else a pointer into the entity value,
++                   ranging from `.textPtr` to `.textPtr + .textLen`. */
++#endif          /* XML_GE == 1 */
+ } ENTITY;
+ 
+ typedef struct {
+@@ -467,7 +483,6 @@ enum XML_Account {
+ };
+ 
+ #if XML_GE == 1
+-typedef unsigned long long XmlBigCount;
+ typedef struct accounting {
+   XmlBigCount countBytesDirect;
+   XmlBigCount countBytesIndirect;
+@@ -491,6 +506,13 @@ typedef struct entity_stats {
+   unsigned int maximumDepthSeen;
+   unsigned long debugLevel;
+ } ENTITY_STATS;
++
++/* One pending entity-analysis task on the explicit stack used by
++   resolveEntityClosureExpandedSize's depth-first search over the entity
++   reference graph. */
++typedef struct {
++  ENTITY *entity; /* entity currently being scanned */
++} ENTITY_ANALYSIS_TASK;
+ #endif /* XML_GE == 1 */
+ 
+ typedef enum XML_Error PTRCALL Processor(XML_Parser parser, const char *start,
+@@ -573,6 +595,9 @@ static enum XML_Error callStoreEntityValue(XML_Parser parser,
+                                            const ENCODING *enc,
+                                            const char *start, const char *end,
+                                            enum XML_Account account);
++static enum XML_Error resolveEntityClosureExpandedSize(XML_Parser parser,
++                                                       HASH_TABLE *table,
++                                                       ENTITY *root);
+ #else
+ static enum XML_Error storeSelfEntityValue(XML_Parser parser, ENTITY *entity);
+ #endif
+@@ -644,9 +669,13 @@ static void parserInit(XML_Parser parser, const XML_Char *encodingName,
+                        bool isReset);
+ 
+ #if XML_GE == 1
+-static float accountingGetCurrentAmplification(XML_Parser rootParser);
+-static void accountingReportStats(XML_Parser originParser, const char *epilog);
+-static void accountingOnAbort(XML_Parser originParser);
++static float accountingGetCurrentAmplification(XML_Parser rootParser,
++                                               XmlBigCount extraIndirectBytes);
++static void accountingReportStats(XML_Parser originParser, const char *epilog,
++                                  XmlBigCount extraIndirectBytes,
++                                  int sourceLine);
++static void accountingOnAbort(XML_Parser originParser,
++                              XmlBigCount extraIndirectBytes, int sourceLine);
+ static void accountingReportDiff(XML_Parser rootParser,
+                                  unsigned int levelsAwayFromRootParser,
+                                  const char *before, const char *after,
+@@ -656,6 +685,9 @@ static XML_Bool accountingDiffTolerated(XML_Parser originParser, int tok,
+                                         const char *before, const char *after,
+                                         int source_line,
+                                         enum XML_Account account);
++static XML_Bool
++accountingCurrentAmplificationTolerated(XML_Parser rootParser,
++                                        XmlBigCount extraIndirectBytes);
+ 
+ static void entityTrackingReportStats(XML_Parser parser, ENTITY *entity,
+                                       const char *action, int sourceLine);
+@@ -663,6 +695,10 @@ static void entityTrackingOnOpen(XML_Parser parser, ENTITY *entity,
+                                  int sourceLine);
+ static void entityTrackingOnClose(XML_Parser parser, ENTITY *entity,
+                                   int sourceLine);
++static void entityTrackingOnScanStart(XML_Parser parser, ENTITY *entity,
++                                      int sourceLine);
++static void entityTrackingOnScanStop(XML_Parser parser, ENTITY *entity,
++                                     int sourceLine);
+ #endif /* XML_GE == 1 */
+ 
+ static XML_Parser getRootParserOf(XML_Parser parser,
+@@ -3232,7 +3268,7 @@ externalEntityInitProcessor2(XML_Parser parser, const char *start,
+ #if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, start, next, __LINE__,
+                                   XML_ACCOUNT_DIRECT)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+ #endif /* XML_GE == 1 */
+@@ -3366,7 +3402,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+               : next;
+     if (! accountingDiffTolerated(parser, tok, s, accountAfter, __LINE__,
+                                   account)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+ #endif
+@@ -4673,7 +4709,7 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+     int tok = XmlCdataSectionTok(enc, s, end, &next);
+ #if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__, account)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+ #else
+@@ -4845,7 +4881,7 @@ doIgnoreSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+ #  if XML_GE == 1
+   if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                 XML_ACCOUNT_DIRECT)) {
+-    accountingOnAbort(parser);
++    accountingOnAbort(parser, 0, __LINE__);
+     return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+   }
+ #  endif
+@@ -4937,7 +4973,7 @@ processXmlDecl(XML_Parser parser, int isGeneralTextEntity, const char *s,
+ #if XML_GE == 1
+   if (! accountingDiffTolerated(parser, XML_TOK_XML_DECL, s, next, __LINE__,
+                                 XML_ACCOUNT_DIRECT)) {
+-    accountingOnAbort(parser);
++    accountingOnAbort(parser, 0, __LINE__);
+     return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+   }
+ #endif
+@@ -5158,7 +5194,7 @@ entityValueInitProcessor(XML_Parser parser, const char *s, const char *end,
+ #  if XML_GE == 1
+       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                     XML_ACCOUNT_DIRECT)) {
+-        accountingOnAbort(parser);
++        accountingOnAbort(parser, 0, __LINE__);
+         return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+       }
+ #  endif
+@@ -5211,7 +5247,7 @@ externalParEntProcessor(XML_Parser parser, const char *s, const char *end,
+   else if (tok == XML_TOK_BOM) {
+     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                   XML_ACCOUNT_DIRECT)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+ 
+@@ -5390,7 +5426,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       break;
+     default:
+       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__, account)) {
+-        accountingOnAbort(parser);
++        accountingOnAbort(parser, 0, __LINE__);
+         return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+       }
+     }
+@@ -5553,7 +5589,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+         handleDefault = XML_FALSE;
+       }
+       break;
+-    case XML_ROLE_INSTANCE_START:
++    case XML_ROLE_INSTANCE_START: {
+ #ifdef XML_DTD
+       /* if there is no DOCTYPE declaration then now is the
+          last chance to read the foreign DTD
+@@ -5597,6 +5633,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+ #endif /* XML_DTD */
+       parser->m_processor = contentProcessor;
+       return contentProcessor(parser, s, end, nextPtr);
++    }
+     case XML_ROLE_ATTLIST_ELEMENT_NAME:
+       parser->m_declElementType = getElementType(parser, enc, s, next);
+       if (! parser->m_declElementType)
+@@ -5741,9 +5778,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           if ((size_t)poolLength(&dtd->entityValuePool) > (size_t)INT_MAX) {
+             return XML_ERROR_NO_MEMORY;
+           }
+-          parser->m_declEntity->textPtr = poolStart(&dtd->entityValuePool);
++          const XML_Char *const valueStart = poolStart(&dtd->entityValuePool);
++          parser->m_declEntity->textPtr = valueStart;
+           parser->m_declEntity->textLen
+               = (int)(poolLength(&dtd->entityValuePool));
++          parser->m_declEntity->scanPtr = valueStart;
+           poolFinish(&dtd->entityValuePool);
+           if (parser->m_entityDeclHandler) {
+             *eventEndPP = s;
+@@ -6420,7 +6459,7 @@ epilogProcessor(XML_Parser parser, const char *s, const char *end,
+ #if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                   XML_ACCOUNT_DIRECT)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+ #endif
+@@ -6487,6 +6526,288 @@ epilogProcessor(XML_Parser parser, const char *s, const char *end,
+   }
+ }
+ 
++#if XML_GE == 1
++// Checks `name` for being a predefined entity (i.e. one of "amp", "apos", "gt",
++// "lt", "quot"). Similar in implementation to function
++// `PREFIX(predefinedEntityName)` but operating on an `XML_Char` string with an
++// explicit length, instead. Returns
++// ASCII_AMP/ASCII_APOS/ASCII_GT/ASCII_LT/ASCII_QUOT for a match or 0 for no
++// match.
++static int
++isPredefinedEntityName(const XML_Char *name, size_t nameLen) {
++  switch (nameLen) {
++  case 2:
++    // Wanted: "lt" or "gt"
++    if (name[1] != XML_T(ASCII_t))
++      break;
++    switch (name[0]) {
++    case XML_T(ASCII_l):
++      return ASCII_LT;
++    case XML_T(ASCII_g):
++      return ASCII_GT;
++    }
++    break;
++  case 3:
++    // Wanted: "amp"
++    if (name[0] == XML_T(ASCII_a) && name[1] == XML_T(ASCII_m)
++        && name[2] == XML_T(ASCII_p))
++      return ASCII_AMP;
++    break;
++  case 4:
++    // Wanted: "apos" or "quot"
++    switch (name[0]) {
++    case XML_T(ASCII_a):
++      if (name[1] == XML_T(ASCII_p) && name[2] == XML_T(ASCII_o)
++          && name[3] == XML_T(ASCII_s))
++        return ASCII_APOS;
++      break;
++    case XML_T(ASCII_q):
++      if (name[1] == XML_T(ASCII_u) && name[2] == XML_T(ASCII_o)
++          && name[3] == XML_T(ASCII_t))
++        return ASCII_QUOT;
++      break;
++    }
++  }
++  return 0;
++}
++
++/* How a scanEntityText call ended. */
++enum EntityScanResult {
++  ENTITY_SCAN_COMPLETE, /* reached end of text; *expandedSize is final */
++  ENTITY_SCAN_BLOCKED,  /* stopped at a defined entity whose expanded
++                           size has not been computed yet; *blockerOut
++                           names the entity whose size to compute
++                           first */
++  ENTITY_SCAN_OVERFLOW  /* the expanded size would exceed XmlBigCount;
++                           callers must abort parsing */
++};
++
++/* Scan `entity`'s body, starting at `*posPtr`, accumulating the expanded
++   size into `*expandedSize`.
++
++   Return value: how the scan ended, see enum EntityScanResult.
++
++   *blockerOut (out, set only for ENTITY_SCAN_BLOCKED):
++     The non-empty entity the scan stopped at because its expanded size
++     has not been computed yet. The caller computes that size first and
++     calls again with *posPtr unchanged to resume.
++     The pointer is borrowed from the entity hash table (via lookup), not
++     a new allocation, so it must not be freed.
++
++   *posPtr (in/out, scan cursor):
++     Advanced to end-of-text on a complete scan, or parked at the
++     offending reference otherwise, so a follow-up call resumes from
++     the same position. Not meaningful after ENTITY_SCAN_OVERFLOW.
++
++   *expandedSize (in/out, XML_Char-unit accumulator):
++     The expanded size of this one `entity` (its text plus the expandedSize
++     of entities it references), not a total across all entities. Not
++     meaningful after ENTITY_SCAN_OVERFLOW; the overflowing value is never
++     stored anywhere. */
++static enum EntityScanResult
++scanEntityText(XML_Parser parser, ENTITY *entity, const XML_Char **posPtr,
++               XmlBigCount *expandedSize, ENTITY **blockerOut) {
++  if (blockerOut != NULL)
++    *blockerOut = NULL;
++  const XML_Char refChar = entity->is_param ? XML_T('%') : XML_T('&');
++  HASH_TABLE *const refTable
++#  ifdef XML_DTD
++      = entity->is_param ? &parser->m_dtd->paramEntities
++                         : &parser->m_dtd->generalEntities;
++#  else
++      = &parser->m_dtd->generalEntities;
++#  endif
++
++  const XML_Char *pos = *posPtr;
++  const XML_Char *const end = entity->textPtr + entity->textLen;
++
++  while (pos < end) {
++    if (*pos != refChar) {
++      // Detect and avoid integer overflow
++      if (*expandedSize == (XmlBigCount)(-1))
++        return ENTITY_SCAN_OVERFLOW;
++      (*expandedSize)++;
++      pos++;
++      continue;
++    }
++
++    const XML_Char *nameStart = pos + 1;
++    const XML_Char *nameEnd = nameStart;
++    while (nameEnd < end && *nameEnd != XML_T(';'))
++      nameEnd++;
++
++    if (nameEnd >= end) {
++      /* Unterminated reference at end of text: treat the trailing
++         bytes as literal characters. */
++      XmlBigCount addend = (XmlBigCount)(end - pos);
++      // Detect and avoid integer overflow
++      if (*expandedSize > (XmlBigCount)(-1) - addend)
++        return ENTITY_SCAN_OVERFLOW;
++      *expandedSize += addend;
++      *posPtr = end;
++      return ENTITY_SCAN_COMPLETE;
++    }
++
++    const size_t nameLen = (size_t)(nameEnd - nameStart);
++
++    /* At runtime the whole "&name;"/"%name;" token is re-scanned and charged to
++       the indirect accounting, then its expansion is charged separately; so
++       every reference below counts this token length plus its expansion. */
++    const XmlBigCount refTokenLen
++        = (XmlBigCount)(/*sigil*/ 1 + nameLen + /*semicolon*/ 1);
++
++    ENTITY *refEntity
++        = (ENTITY *)lookupWithLength(parser, refTable, nameStart, nameLen, 0);
++
++    XmlBigCount addend = 0;
++    if (! refEntity) {
++      /* Predefined entities (amp/lt/gt/quot/apos) are general-only, hence the
++         `! entity->is_param` guard, and expand to a single character. */
++      if (! entity->is_param && isPredefinedEntityName(nameStart, nameLen)) {
++        addend = refTokenLen + 1;
++      } else {
++        /* Undefined entity: expands to nothing, so only the token. */
++        addend = refTokenLen;
++      }
++    } else if (refEntity->beingAnalyzed) {
++      /* Cycle: refEntity is already on the depth-first search stack, so its
++         expandedSize is not final yet; charge just the token. Do not fail the
++         parse here: per XML 1.0r4,
++         "A parsed entity MUST NOT contain a recursive reference to
++         itself, either directly or indirectly", but also "Only parsed
++         entities that are referenced directly or indirectly within the
++         document are required to be well-formed" - so a declared-but-
++         never-expanded cycle must be accepted; if the cycle is actually
++         expanded, the runtime recursive-ref check reports
++         XML_ERROR_RECURSIVE_ENTITY_REF. */
++      addend = refTokenLen;
++    } else if (refEntity->textLen > 0 && refEntity->expandedSize == 0) {
++      /* Non-empty entity whose expanded size has not been computed yet;
++         report refEntity as a blocker so the caller can compute its size
++         first. */
++      *posPtr = pos;
++      if (blockerOut != NULL)
++        *blockerOut = refEntity;
++      return ENTITY_SCAN_BLOCKED;
++    } else if (refEntity->expandedSize > 0) {
++      /* refEntity is fully resolved: expandedSize holds its final expanded
++         size (a non-zero value is never a partial here - the only entity that
++         briefly holds a partial is one currently on the resolve stack, which
++         is caught by the beingAnalyzed branch above). Add the token plus that
++         expansion. */
++      if (refEntity->expandedSize > (XmlBigCount)(-1) - refTokenLen)
++        return ENTITY_SCAN_OVERFLOW;
++      addend = refTokenLen + refEntity->expandedSize;
++    } else {
++      /* Empty entity (textLen == 0): expands to nothing, so only the token. */
++      addend = refTokenLen;
++    }
++
++    // Detect and avoid integer overflow
++    if (*expandedSize > (XmlBigCount)(-1) - addend)
++      return ENTITY_SCAN_OVERFLOW;
++    *expandedSize += addend;
++    pos = nameEnd + 1;
++  }
++
++  /* Loop only exits here with pos == end (a complete scan). */
++  assert(pos == end);
++  *posPtr = end;
++  return ENTITY_SCAN_COMPLETE;
++}
++
++/* Resolve expandedSize using an iterative depth-first search over the
++   reference graph.  Each entity is scanned at most twice (once on push,
++   once after its blocker resolves), so the total work is O(N + T) where
++   N is the number of entities and T is the sum of all entities' textLen.
++   `entity->beingAnalyzed` marks the entities currently on the stack for
++   cycle detection; it is cleared again on pop.
++   Returns XML_ERROR_NO_MEMORY if the stack cannot be allocated, and
++   XML_ERROR_AMPLIFICATION_LIMIT_BREACH if an entity's expanded size
++   overflows XmlBigCount. */
++static enum XML_Error
++resolveEntityClosureExpandedSize(XML_Parser parser, HASH_TABLE *table,
++                                 ENTITY *root) {
++  if (root == NULL || root->expandedSize != 0 || root->textPtr == NULL
++      || root->textLen == 0)
++    return XML_ERROR_NONE;
++
++  if (table->used == 0)
++    return XML_ERROR_NONE;
++
++  // Detect and avoid integer overflow
++  if (table->used > SIZE_MAX / sizeof(ENTITY_ANALYSIS_TASK))
++    return XML_ERROR_NO_MEMORY;
++
++  ENTITY_ANALYSIS_TASK *stack
++      = MALLOC(parser, sizeof(ENTITY_ANALYSIS_TASK) * table->used);
++  if (stack == NULL)
++    return XML_ERROR_NO_MEMORY;
++
++  size_t top = 0;
++  stack[top].entity = root;
++  root->beingAnalyzed = XML_TRUE;
++  top++;
++
++  while (top > 0) {
++    ENTITY_ANALYSIS_TASK *task = &stack[top - 1];
++    ENTITY *e = task->entity;
++    XmlBigCount sizeSoFar = e->expandedSize;
++    ENTITY *blocker = NULL;
++
++    entityTrackingOnScanStart(parser, e, __LINE__);
++
++    const enum EntityScanResult scanResult
++        = scanEntityText(parser, e, &e->scanPtr, &sizeSoFar, &blocker);
++    switch (scanResult) {
++    case ENTITY_SCAN_COMPLETE:
++    case ENTITY_SCAN_BLOCKED:
++      /* Save the size accumulated so far; together with task->pos it is
++         the state that lets the scan resume once the blocker's size has
++         been computed. This is the one place where expandedSize briefly
++         holds neither 0 nor the final size - only while the entity is
++         on the stack, where the beingAnalyzed check in scanEntityText
++         keeps every other reader away from the intermediate value. */
++      e->expandedSize = sizeSoFar;
++      break;
++    default:
++      break;
++    }
++
++    entityTrackingOnScanStop(parser, e, __LINE__);
++
++    switch (scanResult) {
++    case ENTITY_SCAN_OVERFLOW:
++      /* Abort parsing right away; the beingAnalyzed marks still set on
++         the stacked entities do not matter once the parse is dead. */
++      FREE(parser, stack);
++      /* expandedSize overflowed; pass SIZE_MAX (unrepresentable size). */
++      accountingOnAbort(parser, SIZE_MAX, __LINE__);
++      return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
++
++    case ENTITY_SCAN_COMPLETE:
++      e->beingAnalyzed = XML_FALSE;
++      top--;
++      break;
++
++    case ENTITY_SCAN_BLOCKED:
++      /* Push the blocker. A blocker's expanded size is always still
++         uncomputed and it is never already on the stack, so each entity
++         is pushed at most once and top <= table->used. */
++      assert(! blocker->beingAnalyzed);
++      assert(top < table->used);
++      stack[top].entity = blocker;
++      blocker->beingAnalyzed = XML_TRUE;
++      top++;
++      break;
++    }
++  }
++
++  FREE(parser, stack);
++  return XML_ERROR_NONE;
++}
++#endif /* XML_GE == 1 */
++
+ static enum XML_Error
+ processEntity(XML_Parser parser, ENTITY *entity, XML_Bool betweenDecl,
+               enum EntityType type) {
+@@ -6515,6 +6836,43 @@ processEntity(XML_Parser parser, ENTITY *entity, XML_Bool betweenDecl,
+     /* LCOV_EXCL_STOP */
+   }
+ 
++#if XML_GE == 1
++  // Compute entity size assuming immediate access
++  if (entity->textLen > 0 && entity->expandedSize == 0) {
++    HASH_TABLE *const table
++#  ifdef XML_DTD
++        = entity->is_param ? &parser->m_dtd->paramEntities
++                           : &parser->m_dtd->generalEntities;
++#  else
++        = &parser->m_dtd->generalEntities;
++#  endif
++    const enum XML_Error result
++        = resolveEntityClosureExpandedSize(parser, table, entity);
++    if (result != XML_ERROR_NONE)
++      return result;
++  }
++
++  /* Reject an amplification attack before acquiring openEntity, so a rejected
++     entity leaks nothing and leaves entity state untouched. */
++  if (entity->expandedSize > 0) {
++    const XML_Parser rootParser = getRootParserOf(parser, NULL);
++    /* Overflow of expandedSize aborts parsing during resolution
++       (on first expansion), so the stored value here is always exact. */
++    /* Accounting uses bytes; expandedSize counts XML_Char units. */
++    if (entity->expandedSize > (XmlBigCount)(-1) / sizeof(XML_Char)) {
++      accountingOnAbort(rootParser, (XmlBigCount)(-1), __LINE__);
++      return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
++    }
++    const XmlBigCount expandedBytes
++        = entity->expandedSize * sizeof(XML_Char);
++    if (accountingCurrentAmplificationTolerated(rootParser, expandedBytes)
++        != XML_TRUE) {
++      accountingOnAbort(rootParser, expandedBytes, __LINE__);
++      return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
++    }
++  }
++#endif /* XML_GE == 1 */
++
+   if (*freeEntityList) {
+     openEntity = *freeEntityList;
+     *freeEntityList = openEntity->next;
+@@ -6527,7 +6885,7 @@ processEntity(XML_Parser parser, ENTITY *entity, XML_Bool betweenDecl,
+   entity->hasMore = XML_TRUE;
+ #if XML_GE == 1
+   entityTrackingOnOpen(parser, entity, __LINE__);
+-#endif
++#endif /* XML_GE == 1 */
+   entity->processed = 0;
+   openEntity->next = *openEntityList;
+   *openEntityList = openEntity;
+@@ -6730,7 +7088,7 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+     int tok = XmlAttributeValueTok(enc, ptr, end, &next);
+ #if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, ptr, next, __LINE__, account)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+ #endif
+@@ -6946,7 +7304,7 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+ 
+     if (! accountingDiffTolerated(parser, tok, entityTextPtr, next, __LINE__,
+                                   account)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       result = XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+       goto endEntityValue;
+     }
+@@ -7192,7 +7550,8 @@ storeSelfEntityValue(XML_Parser parser, ENTITY *entity) {
+     poolDiscard(pool);
+     return XML_ERROR_NO_MEMORY;
+   }
+-  entity->textPtr = poolStart(pool);
++  const XML_Char *const valueStart = poolStart(pool);
++  entity->textPtr = valueStart;
+   entity->textLen = (int)(poolLength(pool));
+   poolFinish(pool);
+ 
+@@ -7970,6 +8329,9 @@ copyEntityTable(XML_Parser oldParser, HASH_TABLE *newTable,
+         return 0;
+       newE->textPtr = tem;
+       newE->textLen = oldE->textLen;
++#if XML_GE == 1
++      newE->scanPtr = tem;
++#endif /* XML_GE == 1 */
+     }
+     if (oldE->notation) {
+       const XML_Char *tem = poolCopyString(newPool, oldE->notation);
+@@ -8736,25 +9098,27 @@ copyString(const XML_Char *s, XML_Parser parser) {
+ #if XML_GE == 1
+ 
+ static float
+-accountingGetCurrentAmplification(XML_Parser rootParser) {
++accountingGetCurrentAmplification(XML_Parser rootParser,
++                                  XmlBigCount extraIndirectBytes) {
+   //                                          1.........1.........12 => 22
+   const size_t lenOfShortestInclude = sizeof("<!ENTITY a SYSTEM 'b'>") - 1;
+-  const XmlBigCount countBytesOutput
+-      = rootParser->m_accounting.countBytesDirect
+-        + rootParser->m_accounting.countBytesIndirect;
++  /* Add as floats: u64 counts (max ~1.8e19) are far below FLT_MAX, so the sum
++     is always finite and cannot wrap the way an unsigned integer add could. */
++  const float indirect = (float)rootParser->m_accounting.countBytesIndirect
++                         + (float)extraIndirectBytes;
+   const float amplificationFactor
+       = rootParser->m_accounting.countBytesDirect
+-            ? ((float)countBytesOutput
++            ? (((float)rootParser->m_accounting.countBytesDirect + indirect)
+                / (float)(rootParser->m_accounting.countBytesDirect))
+-            : ((float)(lenOfShortestInclude
+-                       + rootParser->m_accounting.countBytesIndirect)
++            : (((float)lenOfShortestInclude + indirect)
+                / (float)lenOfShortestInclude);
+   assert(! rootParser->m_parentParser);
+   return amplificationFactor;
+ }
+ 
+ static void
+-accountingReportStats(XML_Parser originParser, const char *epilog) {
++accountingReportStats(XML_Parser originParser, const char *epilog,
++                      XmlBigCount extraIndirectBytes, int sourceLine) {
+   const XML_Parser rootParser = getRootParserOf(originParser, NULL);
+   assert(! rootParser->m_parentParser);
+ 
+@@ -8762,19 +9126,33 @@ accountingReportStats(XML_Parser originParser, const char *epilog) {
+     return;
+   }
+ 
++  /* On an early abort the amplifying bytes have not been charged to the
++     indirect counter yet; fold extraIndirectBytes in (with overflow detection)
++     so the reported byte count and amplification reflect what was detected. */
++  const XmlBigCount indirect = rootParser->m_accounting.countBytesIndirect;
++  const XmlBigCount indirectWithExtra
++      = (extraIndirectBytes > (XmlBigCount)(-1) - indirect)
++            ? (XmlBigCount)(-1)
++            : indirect + extraIndirectBytes;
+   const float amplificationFactor
+-      = accountingGetCurrentAmplification(rootParser);
++      = accountingGetCurrentAmplification(rootParser, extraIndirectBytes);
+   fprintf(stderr,
+           "expat: Accounting(%p): Direct " EXPAT_FMT_ULL(
+               "10") ", indirect " EXPAT_FMT_ULL("10") ", amplification %8.2f%s",
+           (void *)rootParser, rootParser->m_accounting.countBytesDirect,
+-          rootParser->m_accounting.countBytesIndirect,
+-          (double)amplificationFactor, epilog);
++          indirectWithExtra, (double)amplificationFactor, epilog);
++  /* An abort has no accountingReportDiff before it, so append the originating
++     source line here to show which rejection site these stats belong to. */
++  if (sourceLine > 0) {
++    fprintf(stderr, " (xmlparse.c:%d)\n", sourceLine);
++  }
+ }
+ 
+ static void
+-accountingOnAbort(XML_Parser originParser) {
+-  accountingReportStats(originParser, " ABORTING\n");
++accountingOnAbort(XML_Parser originParser, XmlBigCount extraIndirectBytes,
++                  int sourceLine) {
++  accountingReportStats(originParser, " ABORTING", extraIndirectBytes,
++                        sourceLine);
+ }
+ 
+ static void
+@@ -8814,6 +9192,32 @@ accountingReportDiff(XML_Parser rootParser,
+   fprintf(stderr, "\"\n");
+ }
+ 
++static XML_Bool
++accountingCurrentAmplificationTolerated(XML_Parser rootParser,
++                                        XmlBigCount extraIndirectBytes) {
++  assert(! rootParser->m_parentParser);
++
++  const XmlBigCount countBytesOutput
++      = rootParser->m_accounting.countBytesDirect
++        + rootParser->m_accounting.countBytesIndirect;
++  /* Overflow check: extraIndirectBytes can be SIZE_MAX, which would otherwise
++     wrap the unsigned total around to a small value and wrongly report the
++     output as tolerated. */
++  const XmlBigCount countBytesOutputWithExtra
++      = (extraIndirectBytes > (XmlBigCount)(-1) - countBytesOutput)
++            ? (XmlBigCount)(-1)
++            : countBytesOutput + extraIndirectBytes;
++  const float amplificationFactor
++      = accountingGetCurrentAmplification(rootParser, extraIndirectBytes);
++  const XML_Bool tolerated
++      = (countBytesOutputWithExtra
++         < rootParser->m_accounting.activationThresholdBytes)
++        || (amplificationFactor
++            <= rootParser->m_accounting.maximumAmplificationFactor);
++
++  return tolerated;
++}
++
+ static XML_Bool
+ accountingDiffTolerated(XML_Parser originParser, int tok, const char *before,
+                         const char *after, int source_line,
+@@ -8850,18 +9254,11 @@ accountingDiffTolerated(XML_Parser originParser, int tok, const char *before,
+     return XML_FALSE;
+   *additionTarget += bytesMore;
+ 
+-  const XmlBigCount countBytesOutput
+-      = rootParser->m_accounting.countBytesDirect
+-        + rootParser->m_accounting.countBytesIndirect;
+-  const float amplificationFactor
+-      = accountingGetCurrentAmplification(rootParser);
+   const XML_Bool tolerated
+-      = (countBytesOutput < rootParser->m_accounting.activationThresholdBytes)
+-        || (amplificationFactor
+-            <= rootParser->m_accounting.maximumAmplificationFactor);
++      = accountingCurrentAmplificationTolerated(rootParser, 0);
+ 
+   if (rootParser->m_accounting.debugLevel >= 2u) {
+-    accountingReportStats(rootParser, "");
++    accountingReportStats(rootParser, "", 0, 0);
+     accountingReportDiff(rootParser, levelsAwayFromRootParser, before, after,
+                          bytesMore, source_line, account);
+   }
+@@ -8907,14 +9304,21 @@ entityTrackingReportStats(XML_Parser rootParser, ENTITY *entity,
+       = limitingNeeded ? (maxLimitedDepth - /* make space for ellipis */ 2)
+                        : candidateIndentDepth;
+ 
++  const ptrdiff_t scannedLength
++      = EXPAT_SAFE_PTR_DIFF(entity->scanPtr, entity->textPtr);
++  const char *const confidenceMarker
++      = ((size_t)scannedLength == (size_t)entity->textLen) ? "!" : "?";
++
+   fprintf(
+       stderr,
+-      "expat: Entities(%p): Count %9u, depth %2u/%2u %*s%s%s%s; %s length %d (xmlparse.c:%d)\n",
++      "expat: Entities(%p): Count %9u, depth %2u/%2u %*s%s%s%s; %s scanned " EXPAT_FMT_PTRDIFF_T(
++          "") "/%d, expanded " EXPAT_FMT_ULL("") "%s (xmlparse.c:%d)\n",
+       (void *)rootParser, rootParser->m_entity_stats.countEverOpened,
+       rootParser->m_entity_stats.currentDepth,
+       rootParser->m_entity_stats.maximumDepthSeen, indentDepth * 2, "",
+       ellipisOrEmpty, entity->is_param ? "%" : "&", entityName, action,
+-      entity->textLen, sourceLine);
++      scannedLength, entity->textLen, entity->expandedSize, confidenceMarker,
++      sourceLine);
+ }
+ 
+ static void
+@@ -8929,6 +9333,7 @@ entityTrackingOnOpen(XML_Parser originParser, ENTITY *entity, int sourceLine) {
+     rootParser->m_entity_stats.maximumDepthSeen++;
+   }
+ 
++  // NOTE: The space at the end of "OPEN " is for length alignment with "CLOSE"
+   entityTrackingReportStats(rootParser, entity, "OPEN ", sourceLine);
+ }
+ 
+@@ -8941,6 +9346,29 @@ entityTrackingOnClose(XML_Parser originParser, ENTITY *entity, int sourceLine) {
+   rootParser->m_entity_stats.currentDepth--;
+ }
+ 
++static void
++entityTrackingOnScanStart(XML_Parser originParser, ENTITY *entity,
++                          int sourceLine) {
++  const XML_Parser rootParser = getRootParserOf(originParser, NULL);
++  assert(! rootParser->m_parentParser);
++
++  rootParser->m_entity_stats.currentDepth += 1;
++  entityTrackingReportStats(rootParser, entity, "START", sourceLine);
++  rootParser->m_entity_stats.currentDepth -= 1;
++}
++
++static void
++entityTrackingOnScanStop(XML_Parser originParser, ENTITY *entity,
++                         int sourceLine) {
++  const XML_Parser rootParser = getRootParserOf(originParser, NULL);
++  assert(! rootParser->m_parentParser);
++
++  rootParser->m_entity_stats.currentDepth += 1;
++  // NOTE: The space at the end of "STOP " is for length alignment with "START"
++  entityTrackingReportStats(rootParser, entity, "STOP ", sourceLine);
++  rootParser->m_entity_stats.currentDepth -= 1;
++}
++
+ #endif /* XML_GE == 1 */
+ 
+ static XML_Parser
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-115506_p2.patch
new file mode 100644
index 0000000..89b84a2
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506_p2.patch
@@ -0,0 +1,255 @@
+From b665010ec7adb64933269df970a71e581f0d92d5 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 26 Oct 2026 14:14:37 +0100
+Subject: [PATCH] Merge pull request #1439 from libexpat/entity-scanning-cdata
+
+lib: Take CDATA sections, comments and PI into account with entity scanning (follow-up to #1433, fixes #1438)
+
+CVE: CVE-2026-115506
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/b665010ec7adb64933269df970a71e581f0d92d5]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/ascii.h       |   1 +
+ lib/xcs.c         |  21 +++++++++
+ lib/xcs.h         |   3 ++
+ lib/xmlparse.c    | 124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ tests/xcs_tests.c |  23 ++++++++++
+ 5 files changed, 172 insertions(+)
+
+diff --git a/lib/ascii.h b/lib/ascii.h
+index 1d9cf70..60cb9c5 100644
+--- a/lib/ascii.h
++++ b/lib/ascii.h
+@@ -113,6 +113,7 @@
+ #define ASCII_LT 0x3C
+ #define ASCII_EQUALS 0x3D
+ #define ASCII_GT 0x3E
++#define ASCII_QUEST 0x3F
+ #define ASCII_LSQB 0x5B
+ #define ASCII_RSQB 0x5D
+ #define ASCII_UNDERSCORE 0x5F
+diff --git a/lib/xcs.c b/lib/xcs.c
+index ae5e042..a97647f 100644
+--- a/lib/xcs.c
++++ b/lib/xcs.c
+@@ -88,3 +88,24 @@ xcsncmp(const XML_Char *a, const XML_Char *b, size_t len) {
+   return strncmp(a, b, len);
+ #endif
+ }
++
++// A port of `strnstr(3bsd)` to `XML_Char`
++const XML_Char *
++xcsnstr(const XML_Char *haystack, const XML_Char *needle, size_t maxLen) {
++  // NOTE: We are not calling `xcsnlen(haystack, maxLen)` because
++  //       `haystack` could be long and `xcsnlen` could be used in a loop
++  //       and we need to avoid quadratic runtime behavior.
++  if (! *needle)
++    return haystack; // i.e. empty needle is always a match
++  const size_t needleLen = xcslen(needle);
++  if (needleLen > maxLen)
++    return NULL;
++  const size_t maxTries = (maxLen - needleLen) + 1;
++  for (size_t i = 0; i < maxTries && haystack[i]; i++) {
++    if (haystack[i] == needle[0]
++        && xcsncmp(haystack + i, needle, needleLen) == 0) {
++      return haystack + i;
++    }
++  }
++  return NULL;
++}
+diff --git a/lib/xcs.h b/lib/xcs.h
+index 1b94264..9fbc4fe 100644
+--- a/lib/xcs.h
++++ b/lib/xcs.h
+@@ -41,4 +41,7 @@ extern size_t xcslen(const XML_Char *s);
+ extern int xcscmp(const XML_Char *a, const XML_Char *b);
+ extern int xcsncmp(const XML_Char *a, const XML_Char *b, size_t len);
+ 
++extern const XML_Char *xcsnstr(const XML_Char *haystack, const XML_Char *needle,
++                               size_t maxLen);
++
+ #endif // ! defined(EXPAT_XCS_H)
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 34bb7d2..3a4fb28 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -6582,6 +6582,65 @@ enum EntityScanResult {
+                            callers must abort parsing */
+ };
+ 
++static const XML_Char cdataOpen[]
++    = {ASCII_LT, ASCII_EXCL, ASCII_LSQB, ASCII_C,    ASCII_D,
++       ASCII_A,  ASCII_T,    ASCII_A,    ASCII_LSQB, '\0'}; // i.e. "<![CDATA["
++static const XML_Char cdataClose[]
++    = {ASCII_RSQB, ASCII_RSQB, ASCII_GT, '\0'}; // e.i. "]]>"
++static const XML_Char commentOpen[]
++    = {ASCII_LT, ASCII_EXCL, ASCII_MINUS, ASCII_MINUS, '\0'}; // i.e. "<!--"
++static const XML_Char commentClose[]
++    = {ASCII_MINUS, ASCII_MINUS, ASCII_GT, '\0'};                // i.e. "-->"
++static const XML_Char piClose[] = {ASCII_QUEST, ASCII_GT, '\0'}; // i.e. "?>"
++
++static const size_t cdataOpenLen = sizeof(cdataOpen) / sizeof(cdataOpen[0]) - 1;
++static const size_t cdataCloseLen
++    = sizeof(cdataClose) / sizeof(cdataClose[0]) - 1;
++static const size_t commentOpenLen
++    = sizeof(commentOpen) / sizeof(commentOpen[0]) - 1;
++static const size_t commentCloseLen
++    = sizeof(commentClose) / sizeof(commentClose[0]) - 1;
++static const size_t piCloseLen = sizeof(piClose) / sizeof(piClose[0]) - 1;
++
++// Checks the string starting at `pos` for starting a CDATA section, a comment
++// or processing instructions. Returns
++// XML_TOK_CDATA_SECT_OPEN/XML_TOK_COMMENT/XML_TOK_PI for a match or
++// XML_TOK_INVALID (=0) for no match. Only in the success case, the length
++// of the token is written to `*openTextLen`.
++static int
++isCDataCommentOrPIStart(const XML_Char *pos, size_t maxLen,
++                        size_t *openTextLen) {
++  assert(pos != NULL);
++  assert(openTextLen != NULL);
++
++  if (maxLen < 2)
++    return XML_TOK_INVALID;
++
++  if (pos[0] != XML_T(ASCII_LT))
++    return XML_TOK_INVALID;
++
++  if (pos[1] == XML_T(ASCII_QUEST)) {
++    *openTextLen = 2;
++    return XML_TOK_PI;
++  }
++
++  if (pos[1] != XML_T(ASCII_EXCL))
++    return XML_TOK_INVALID;
++
++  if (maxLen >= cdataOpenLen && xcsncmp(pos, cdataOpen, cdataOpenLen) == 0) {
++    *openTextLen = cdataOpenLen;
++    return XML_TOK_CDATA_SECT_OPEN;
++  }
++
++  if (maxLen >= commentOpenLen
++      && xcsncmp(pos, commentOpen, commentOpenLen) == 0) {
++    *openTextLen = commentOpenLen;
++    return XML_TOK_COMMENT;
++  }
++
++  return XML_TOK_INVALID;
++}
++
+ /* Scan `entity`'s body, starting at `*posPtr`, accumulating the expanded
+    size into `*expandedSize`.
+ 
+@@ -6622,6 +6681,71 @@ scanEntityText(XML_Parser parser, ENTITY *entity, const XML_Char **posPtr,
+   const XML_Char *const end = entity->textPtr + entity->textLen;
+ 
+   while (pos < end) {
++    // Detect and skip CDATA/comment/PI sections
++    // because entities have no effect in these places
++    if (*pos == XML_T('<')) {
++      // Detect CDATA/comment/PI section start
++      size_t openTextLen = 0;
++      const int tok = isCDataCommentOrPIStart(pos, end - pos, &openTextLen);
++      if (tok != XML_TOK_INVALID) {
++        assert(openTextLen != 0);
++
++        // Detect and avoid integer overflow
++        if (openTextLen > (XmlBigCount)(-1) - *expandedSize)
++          return ENTITY_SCAN_OVERFLOW;
++
++        *expandedSize += openTextLen;
++        pos += openTextLen;
++
++        // Detect CDATA/comment/PI section end
++        const XML_Char *closeText = NULL;
++        size_t closeLen = 0;
++
++        switch (tok) {
++        case XML_TOK_CDATA_SECT_OPEN:
++          closeText = cdataClose;
++          closeLen = cdataCloseLen;
++          break;
++        case XML_TOK_COMMENT:
++          closeText = commentClose;
++          closeLen = commentCloseLen;
++          break;
++        case XML_TOK_PI:
++          closeText = piClose;
++          closeLen = piCloseLen;
++          break;
++        default:
++          assert(0 && "never gets here");
++          break;
++        }
++
++        const size_t remainderLen = end - pos;
++        const XML_Char *const closeStart
++            = xcsnstr(pos, closeText, remainderLen);
++        if (closeStart == NULL) {
++          // The CDATA/comment/PI section is NOT terminated
++          if (remainderLen > (XmlBigCount)(-1) - *expandedSize)
++            return ENTITY_SCAN_OVERFLOW;
++          *expandedSize += remainderLen;
++          *posPtr = end;
++          return ENTITY_SCAN_COMPLETE;
++        }
++
++        // The CDATA/comment/PI section is NOT terminated
++        const size_t skippedLen = closeStart + closeLen - pos;
++
++        // Detect and avoid integer overflow
++        if (skippedLen > (XmlBigCount)(-1) - *expandedSize)
++          return ENTITY_SCAN_OVERFLOW;
++
++        *expandedSize += skippedLen;
++        pos += skippedLen;
++
++        continue;
++      }
++    }
++
++    // Detect an entity reference
+     if (*pos != refChar) {
+       // Detect and avoid integer overflow
+       if (*expandedSize == (XmlBigCount)(-1))
+diff --git a/tests/xcs_tests.c b/tests/xcs_tests.c
+index 3d756b0..44b9273 100644
+--- a/tests/xcs_tests.c
++++ b/tests/xcs_tests.c
+@@ -76,6 +76,28 @@ START_TEST(test_xcs_ncmp) {
+ }
+ END_TEST
+ 
++START_TEST(test_xcs_nstr) {
++  if (g_chunkSize != 0)
++    return;
++
++  const XML_Char haystack[] = {ASCII_h, ASCII_a, ASCII_y, ASCII_s, ASCII_t,
++                               ASCII_a, ASCII_c, ASCII_k, '\0'};
++  const XML_Char hay[] = {ASCII_h, ASCII_a, ASCII_y, '\0'};
++  const XML_Char stack[] = {ASCII_s, ASCII_t, ASCII_a, ASCII_c, ASCII_k, '\0'};
++  const XML_Char other[] = {ASCII_o, ASCII_t, ASCII_h, ASCII_e, ASCII_r, '\0'};
++
++  assert_true(xcsnstr(haystack, haystack, xcslen(haystack)) == haystack);
++  assert_true(xcsnstr(haystack, hay, xcslen(haystack)) == haystack);
++  assert_true(xcsnstr(haystack, hay, xcslen(hay)) == haystack);
++  assert_true(xcsnstr(haystack, hay, xcslen(hay) - 1) == NULL);
++  assert_true(xcsnstr(haystack, stack, xcslen(haystack))
++              == haystack + xcslen(hay));
++  assert_true(xcsnstr(haystack, other, xcslen(haystack)) == NULL);
++  assert_true(xcsnstr(haystack, empty, xcslen(haystack)) == haystack);
++  assert_true(xcsnstr(hay, haystack, xcslen(hay)) == NULL);
++}
++END_TEST
++
+ void
+ make_xcs_test_case(Suite *s) {
+   TCase *const tc_xcs = tcase_create("xcs tests");
+@@ -83,4 +105,5 @@ make_xcs_test_case(Suite *s) {
+   tcase_add_test(tc_xcs, test_xcs_len);
+   tcase_add_test(tc_xcs, test_xcs_cmp);
+   tcase_add_test(tc_xcs, test_xcs_ncmp);
++  tcase_add_test(tc_xcs, test_xcs_nstr);
+ }
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506_p3.patch b/meta/recipes-core/expat/expat/CVE-2026-115506_p3.patch
new file mode 100644
index 0000000..f1523e9
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506_p3.patch
@@ -0,0 +1,701 @@
+From 512af15da9dfdf7675a11af595f773c139daa7cc Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 27 Oct 2026 12:40:39 +0100
+Subject: [PATCH] Merge pull request #1442 from
+ libexpat/entity-scanning-cdata-testing
+
+tests: Increase coverage of entity text scanning (follow-up to #1439)
+
+CVE: CVE-2026-115506
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/512af15da9dfdf7675a11af595f773c139daa7cc]
+
+Backport Changes:
+- Move Expat 2.8.3's ENTITY definition into entities.h, retaining int
+  lengths, XML_Bool flags and the original hasMore comment. Include it
+  beside internal.h; this version has not extracted hash_table.h.
+- Keep the corrected XML_Char-unit comment when moving ENTITY.
+- Add a bounded regression requiring amplification rejection before
+  character delivery, including with XML_UNICODE enabled.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CMakeLists.txt         |   1 +
+ lib/Makefile.am        |   1 +
+ lib/entities.h         |  99 ++++++++++++++++++++
+ lib/internal.h         |   2 +
+ lib/xmlparse.c         |  52 +----------
+ tests/Makefile.am      |   2 +
+ tests/acc_tests.c      |  34 +++++++
+ tests/common.c         |  12 +++
+ tests/common.h         |   2 +
+ tests/entities_tests.c | 246 +++++++++++++++++++++++++++++++++++++++++++++++++
+ tests/entities_tests.h |  41 +++++++++
+ tests/runtests.c       |   2 +
+ 12 files changed, 446 insertions(+), 48 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 83da1a2..e0b7bbd 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -732,6 +732,7 @@ if(EXPAT_BUILD_TESTS)
+         tests/chardata.c
+         tests/common.c
+         tests/dummy.c
++        tests/entities_tests.c
+         tests/handlers.c
+         tests/memcheck.c
+         tests/minicheck.c
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 36299b2..8476187 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -113,6 +113,7 @@ uninstall-local:
+ EXTRA_DIST = \
+     ascii.h \
+     asciitab.h \
++    entities.h \
+     expat_external.h \
+     expat.h \
+     fallthrough.h \
+diff --git a/lib/entities.h b/lib/entities.h
+new file mode 100644
+index 0000000..2d94169
+--- /dev/null
++++ b/lib/entities.h
+@@ -0,0 +1,99 @@
++/* Internal helpers related to entities
++                            __  __            _
++                         ___\ \/ /_ __   __ _| |_
++                        / _ \\  /| '_ \ / _` | __|
++                       |  __//  \| |_) | (_| | |_
++                        \___/_/\_\ .__/ \__,_|\__|
++                                 |_| XML parser
++
++   Copyright (c) 2026 Sebastian Pipping <sebastian@pipping.org>
++   Licensed under the MIT license:
++
++   Permission is  hereby granted,  free of charge,  to any  person obtaining
++   a  copy  of  this  software   and  associated  documentation  files  (the
++   "Software"),  to  deal in  the  Software  without restriction,  including
++   without  limitation the  rights  to use,  copy,  modify, merge,  publish,
++   distribute, sublicense, and/or sell copies of the Software, and to permit
++   persons  to whom  the Software  is  furnished to  do so,  subject to  the
++   following conditions:
++
++   The above copyright  notice and this permission notice  shall be included
++   in all copies or substantial portions of the Software.
++
++   THE  SOFTWARE  IS  PROVIDED  "AS  IS",  WITHOUT  WARRANTY  OF  ANY  KIND,
++   EXPRESS  OR IMPLIED,  INCLUDING  BUT  NOT LIMITED  TO  THE WARRANTIES  OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
++   NO EVENT SHALL THE AUTHORS OR  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
++   DAMAGES OR  OTHER LIABILITY, WHETHER  IN AN  ACTION OF CONTRACT,  TORT OR
++   OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
++   USE OR OTHER DEALINGS IN THE SOFTWARE.
++
++   SPDX-License-Identifier: MIT
++*/
++
++#if ! defined(EXPAT_ENTITIES_H)
++#  define EXPAT_ENTITIES_H 1
++
++#  include "expat_config.h"   // for XML_GE
++#  include "expat_external.h" // for XML_Char
++#  include "internal.h"       // for XML_NONTESTING_STATIC
++#  include <stdbool.h>        // for size_t
++#  include <stddef.h>         // for size_t
++
++typedef struct {
++  const XML_Char *name;
++  const XML_Char *textPtr;
++  int textLen;   /* length in XML_Chars */
++  int processed; /* # of processed bytes - when suspended */
++  const XML_Char *systemId;
++  const XML_Char *base;
++  const XML_Char *publicId;
++  const XML_Char *notation;
++  XML_Bool open;
++  XML_Bool hasMore; /* true if entity has not been completely processed */
++  /* An entity can be open while being already completely processed (hasMore ==
++    XML_FALSE). The reason is the delayed closing of entities until their inner
++    entities are processed and closed */
++  XML_Bool is_param;
++  XML_Bool is_internal; /* true if declared in internal subset outside PE */
++#  if XML_GE == 1
++  /* Indirect accounting size in XML_Char units: 1 per text unit, plus each
++     reference's "&name;"/"%name;" token length and its own expansion. Multiply
++     by sizeof(XML_Char) to match XML_ACCOUNT_ENTITY_EXPANSION. This is not the
++     replacement-text size. 0 means "not computed yet" (an empty entity is 0
++     too, told apart by textLen == 0). */
++  XmlBigCount expandedSize;
++  bool beingAnalyzed; /* on the resolveEntityClosureExpandedSize depth-first
++                             search stack; used for cycle detection */
++  const XML_Char
++      *scanPtr; /* cursor position into the entity's replacement text; NULL when
++                   `textPtr` is NULL, else a pointer into the entity value,
++                   ranging from `.textPtr` to `.textPtr + .textLen`. */
++#  endif        /* XML_GE == 1 */
++} ENTITY;
++
++#  if XML_GE == 1
++/* How a scanEntityText call ended. */
++enum EntityScanResult {
++  ENTITY_SCAN_COMPLETE, /* reached end of text; *expandedSize is final */
++  ENTITY_SCAN_BLOCKED,  /* stopped at a defined entity whose expanded
++                           size has not been computed yet; *blockerOut
++                           names the entity whose size to compute
++                           first */
++  ENTITY_SCAN_OVERFLOW  /* the expanded size would exceed XmlBigCount;
++                           callers must abort parsing */
++};
++
++XML_NONTESTING_STATIC int isCDataCommentOrPIStart(const XML_Char *pos,
++                                                  size_t maxLen,
++                                                  size_t *openTextLen);
++
++XML_NONTESTING_STATIC int isPredefinedEntityName(const XML_Char *name,
++                                                 size_t nameLen);
++
++XML_NONTESTING_STATIC enum EntityScanResult
++scanEntityText(XML_Parser parser, ENTITY *entity, const XML_Char **posPtr,
++               XmlBigCount *expandedSize, ENTITY **blockerOut);
++#  endif /* XML_GE == 1 */
++
++#endif // ! defined(EXPAT_ENTITIES_H)
+diff --git a/lib/internal.h b/lib/internal.h
+index 6481b6e..518761b 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -166,6 +166,8 @@
+ 
+ #include "expat.h" // so we can use type XML_Parser below
+ 
++typedef unsigned long long XmlBigCount;
++
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 3a4fb28..391ec4b 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -223,6 +223,7 @@ typedef char ICHAR;
+ #define EXPAT_MIN(a, b) (((a) < (b)) ? (a) : (b))
+ 
+ #include "internal.h"
++#include "entities.h"
+ #include "xmltok.h"
+ #include "xmlrole.h"
+ 
+@@ -321,40 +322,6 @@ typedef struct tag {
+   BINDING *bindings;
+ } TAG;
+ 
+-typedef unsigned long long XmlBigCount;
+-
+-typedef struct {
+-  const XML_Char *name;
+-  const XML_Char *textPtr;
+-  int textLen;   /* length in XML_Chars */
+-  int processed; /* # of processed bytes - when suspended */
+-  const XML_Char *systemId;
+-  const XML_Char *base;
+-  const XML_Char *publicId;
+-  const XML_Char *notation;
+-  XML_Bool open;
+-  XML_Bool hasMore; /* true if entity has not been completely processed */
+-  /* An entity can be open while being already completely processed (hasMore ==
+-    XML_FALSE). The reason is the delayed closing of entities until their inner
+-    entities are processed and closed */
+-  XML_Bool is_param;
+-  XML_Bool is_internal; /* true if declared in internal subset outside PE */
+-#if XML_GE == 1
+-  /* Indirect accounting size in XML_Char units: 1 per text unit, plus each
+-     reference's "&name;"/"%name;" token length and its own expansion. Multiply
+-     by sizeof(XML_Char) to match XML_ACCOUNT_ENTITY_EXPANSION. This is not the
+-     replacement-text size. 0 means "not computed yet" (an empty entity is 0
+-     too, told apart by textLen == 0). */
+-  XmlBigCount expandedSize;
+-  bool beingAnalyzed; /* on the resolveEntityClosureExpandedSize depth-first
+-                             search stack; used for cycle detection */
+-  const XML_Char
+-      *scanPtr; /* cursor position into the entity's replacement text; NULL when
+-                   `textPtr` is NULL, else a pointer into the entity value,
+-                   ranging from `.textPtr` to `.textPtr + .textLen`. */
+-#endif          /* XML_GE == 1 */
+-} ENTITY;
+-
+ typedef struct {
+   enum XML_Content_Type type;
+   enum XML_Content_Quant quant;
+@@ -6533,7 +6500,7 @@ epilogProcessor(XML_Parser parser, const char *s, const char *end,
+ // explicit length, instead. Returns
+ // ASCII_AMP/ASCII_APOS/ASCII_GT/ASCII_LT/ASCII_QUOT for a match or 0 for no
+ // match.
+-static int
++XML_NONTESTING_STATIC int
+ isPredefinedEntityName(const XML_Char *name, size_t nameLen) {
+   switch (nameLen) {
+   case 2:
+@@ -6571,17 +6538,6 @@ isPredefinedEntityName(const XML_Char *name, size_t nameLen) {
+   return 0;
+ }
+ 
+-/* How a scanEntityText call ended. */
+-enum EntityScanResult {
+-  ENTITY_SCAN_COMPLETE, /* reached end of text; *expandedSize is final */
+-  ENTITY_SCAN_BLOCKED,  /* stopped at a defined entity whose expanded
+-                           size has not been computed yet; *blockerOut
+-                           names the entity whose size to compute
+-                           first */
+-  ENTITY_SCAN_OVERFLOW  /* the expanded size would exceed XmlBigCount;
+-                           callers must abort parsing */
+-};
+-
+ static const XML_Char cdataOpen[]
+     = {ASCII_LT, ASCII_EXCL, ASCII_LSQB, ASCII_C,    ASCII_D,
+        ASCII_A,  ASCII_T,    ASCII_A,    ASCII_LSQB, '\0'}; // i.e. "<![CDATA["
+@@ -6607,7 +6563,7 @@ static const size_t piCloseLen = sizeof(piClose) / sizeof(piClose[0]) - 1;
+ // XML_TOK_CDATA_SECT_OPEN/XML_TOK_COMMENT/XML_TOK_PI for a match or
+ // XML_TOK_INVALID (=0) for no match. Only in the success case, the length
+ // of the token is written to `*openTextLen`.
+-static int
++XML_NONTESTING_STATIC int
+ isCDataCommentOrPIStart(const XML_Char *pos, size_t maxLen,
+                         size_t *openTextLen) {
+   assert(pos != NULL);
+@@ -6663,7 +6619,7 @@ isCDataCommentOrPIStart(const XML_Char *pos, size_t maxLen,
+      of entities it references), not a total across all entities. Not
+      meaningful after ENTITY_SCAN_OVERFLOW; the overflowing value is never
+      stored anywhere. */
+-static enum EntityScanResult
++XML_NONTESTING_STATIC enum EntityScanResult
+ scanEntityText(XML_Parser parser, ENTITY *entity, const XML_Char **posPtr,
+                XmlBigCount *expandedSize, ENTITY **blockerOut) {
+   if (blockerOut != NULL)
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 2be03dc..8c10307 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -48,6 +48,7 @@ runtests_SOURCES = \
+     chardata.c \
+     common.c \
+     dummy.c \
++    entities_tests.c \
+     handlers.c \
+     memcheck.c \
+     minicheck.c \
+@@ -69,6 +70,7 @@ EXTRA_DIST = \
+     chardata.h \
+     common.h \
+     dummy.h \
++    entities_tests.h \
+     handlers.h \
+     misc_tests.h \
+     ns_tests.h \
+diff --git a/tests/acc_tests.c b/tests/acc_tests.c
+index d9f58a4..ba30598 100644
+--- a/tests/acc_tests.c
++++ b/tests/acc_tests.c
+@@ -470,6 +470,39 @@ START_TEST(test_amplification_reset_neutrality) {
+ }
+ END_TEST
+ 
++static void XMLCALL
++count_amplification_characters(void *userData, const XML_Char *text, int len) {
++  UNUSED_P(text);
++  *(size_t *)userData += (size_t)len;
++}
++
++START_TEST(test_amplification_preflight_character_width) {
++  const char doc[] = "<!DOCTYPE r [<!ENTITY a '0123456789'>"
++                     "<!ENTITY b '&a;&a;&a;&a;&a;&a;&a;&a;&a;&a;'>"
++                     "<!ENTITY c '&b;&b;&b;&b;&b;&b;&b;&b;&b;&b;'>]>"
++                     "<r>&c;</r>";
++  XML_Parser parser = XML_ParserCreate(NULL);
++  size_t delivered = 0;
++  assert_true(parser != NULL);
++
++  XML_SetUserData(parser, &delivered);
++  XML_SetCharacterDataHandler(parser, count_amplification_characters);
++  /* Keep the byte-based limit between the correct projection and the
++     unscaled XML_Char count, including with XML_UNICODE enabled. */
++  assert_true(XML_SetBillionLaughsAttackProtectionMaximumAmplification(
++                  parser, 6.0f * (float)sizeof(XML_Char))
++              == XML_TRUE);
++  assert_true(XML_SetBillionLaughsAttackProtectionActivationThreshold(parser, 0)
++              == XML_TRUE);
++
++  assert_true(XML_Parse(parser, doc, (int)sizeof(doc) - 1, XML_TRUE)
++              == XML_STATUS_ERROR);
++  assert_true(XML_GetErrorCode(parser) == XML_ERROR_AMPLIFICATION_LIMIT_BREACH);
++  assert_true(delivered == 0);
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ #endif // XML_GE == 1
+ 
+ void
+@@ -485,6 +518,7 @@ make_accounting_test_case(Suite *s) {
+   tcase_add_test__ifdef_xml_dtd(tc_accounting,
+                                 test_amplification_isolated_external_parser);
+   tcase_add_test(tc_accounting, test_amplification_reset_neutrality);
++  tcase_add_test(tc_accounting, test_amplification_preflight_character_width);
+ #else
+   UNUSED_P(s);
+ #endif /* XML_GE == 1 */
+diff --git a/tests/common.c b/tests/common.c
+index e2980cb..5984471 100644
+--- a/tests/common.c
++++ b/tests/common.c
+@@ -338,3 +338,15 @@ portable_strndup(const char *s, size_t n) {
+ 
+   return buffer;
+ }
++
++XML_Char *
++xcsdup_str(const char *s) {
++  const size_t len = strlen(s);
++  XML_Char *const buf = calloc(len + /*terminator*/ 1, sizeof(XML_Char));
++  if (! buf)
++    return NULL;
++  XML_Char *t = buf;
++  while (*s)
++    *t++ = *s++;
++  return buf;
++}
+diff --git a/tests/common.h b/tests/common.h
+index cf1635d..5333d33 100644
+--- a/tests/common.h
++++ b/tests/common.h
+@@ -150,6 +150,8 @@ extern void *duff_reallocator(void *ptr, size_t size);
+ 
+ extern char *portable_strndup(const char *s, size_t n);
+ 
++extern XML_Char *xcsdup_str(const char *s);
++
+ #endif /* XML_COMMON_H */
+ 
+ #ifdef __cplusplus
+diff --git a/tests/entities_tests.c b/tests/entities_tests.c
+new file mode 100644
+index 0000000..fd401be
+--- /dev/null
++++ b/tests/entities_tests.c
+@@ -0,0 +1,246 @@
++/* Unit tests related to internal handling of entities
++__  __            _
++                         ___\ \/ /_ __   __ _| |_
++                        / _ \\  /| '_ \ / _` | __|
++                       |  __//  \| |_) | (_| | |_
++                        \___/_/\_\ .__/ \__,_|\__|
++                                 |_| XML parser
++
++   Copyright (c) 2026 Sebastian Pipping <sebastian@pipping.org>
++   Licensed under the MIT license:
++
++   Permission is  hereby granted,  free of charge,  to any  person obtaining
++   a  copy  of  this  software   and  associated  documentation  files  (the
++   "Software"),  to  deal in  the  Software  without restriction,  including
++   without  limitation the  rights  to use,  copy,  modify, merge,  publish,
++   distribute, sublicense, and/or sell copies of the Software, and to permit
++   persons  to whom  the Software  is  furnished to  do so,  subject to  the
++   following conditions:
++
++   The above copyright  notice and this permission notice  shall be included
++   in all copies or substantial portions of the Software.
++
++   THE  SOFTWARE  IS  PROVIDED  "AS  IS",  WITHOUT  WARRANTY  OF  ANY  KIND,
++   EXPRESS  OR IMPLIED,  INCLUDING  BUT  NOT LIMITED  TO  THE WARRANTIES  OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
++   NO EVENT SHALL THE AUTHORS OR  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
++   DAMAGES OR  OTHER LIABILITY, WHETHER  IN AN  ACTION OF CONTRACT,  TORT OR
++   OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
++   USE OR OTHER DEALINGS IN THE SOFTWARE.
++
++   SPDX-License-Identifier: MIT
++*/
++
++#include "entities_tests.h"
++#include "expat_config.h" // for XML_GE
++
++#include "ascii.h"    // for ASCII_*
++#include "common.h"   // for g_chunkSize, xcsdup_str
++#include "entities.h" // for isCDataCommentOrPIStart, isPredefinedEntityName, ..
++#include "xmltok.h"   // for XML_TOK_*
++#include "xcs.h"      // for xcslen
++
++#include <string.h> // for strlen
++
++static void
++assert_entity_expanded_size_equals(XML_Parser parser, const char *text,
++                                   XmlBigCount expectedExpandedSize);
++
++static void assert_predefined_entity_name_match(const char *text,
++                                                int expectedCharacter);
++
++static ENTITY *createGeneralEntityWithText(const char *text);
++
++START_TEST(test_is_cdata_comment_or_pi_start) {
++  // Speed up the test, chunk size expected to not matter in this test
++  if (g_chunkSize != 0)
++    return;
++
++  XML_Char *const cdataOpen = xcsdup_str("<![CDATA[");
++  XML_Char *const commentOpen = xcsdup_str("<!--");
++  XML_Char *const piOpen = xcsdup_str("<?");
++
++#if XML_GE == 1
++  const size_t expectedCdataOpenLen = xcslen(cdataOpen);
++  const size_t expectedCommentOpenLen = xcslen(commentOpen);
++  const size_t expectedPiOpenLen = xcslen(piOpen);
++
++  size_t actualCdataOpenLen = 0;
++  assert_true(isCDataCommentOrPIStart(cdataOpen, expectedCdataOpenLen,
++                                      &actualCdataOpenLen)
++              == XML_TOK_CDATA_SECT_OPEN);
++  assert_true(actualCdataOpenLen == expectedCdataOpenLen);
++
++  size_t actualCommentOpenLen = 0;
++  assert_true(isCDataCommentOrPIStart(commentOpen, expectedCommentOpenLen,
++                                      &actualCommentOpenLen)
++              == XML_TOK_COMMENT);
++  assert_true(actualCommentOpenLen == expectedCommentOpenLen);
++
++  size_t actualPiOpenLen = 0;
++  assert_true(
++      isCDataCommentOrPIStart(piOpen, expectedPiOpenLen, &actualPiOpenLen)
++      == XML_TOK_PI);
++  assert_true(actualCdataOpenLen == expectedCdataOpenLen);
++
++  size_t dummy = 0;
++  assert_true(isCDataCommentOrPIStart(piOpen, 0, &dummy) == XML_TOK_INVALID);
++  assert_true(isCDataCommentOrPIStart(piOpen, 1, &dummy) == XML_TOK_INVALID);
++#endif // XML_GE == 1
++
++  free(cdataOpen);
++  free(commentOpen);
++  free(piOpen);
++}
++END_TEST
++
++static void
++assert_predefined_entity_name_match(const char *text, int expectedCharacter) {
++  XML_Char *const xcsText = xcsdup_str(text);
++  assert_true(xcsText != NULL);
++
++#if XML_GE == 1
++  assert_true(isPredefinedEntityName(xcsText, xcslen(xcsText))
++              == expectedCharacter);
++#else
++  UNUSED_P(expectedCharacter);
++#endif // XML_GE == 1
++
++  free(xcsText);
++}
++
++START_TEST(test_is_predefined_entity_name) {
++  // Speed up the test, chunk size expected to not matter in this test
++  if (g_chunkSize != 0)
++    return;
++
++  assert_predefined_entity_name_match("amp", ASCII_AMP);
++  assert_predefined_entity_name_match("apos", ASCII_APOS);
++  assert_predefined_entity_name_match("gt", ASCII_GT);
++  assert_predefined_entity_name_match("lt", ASCII_LT);
++  assert_predefined_entity_name_match("quot", ASCII_QUOT);
++}
++END_TEST
++
++static ENTITY *
++createGeneralEntityWithText(const char *text) {
++  assert_true(text != NULL);
++
++  ENTITY *const entity = calloc(1, sizeof(ENTITY));
++  assert_true(entity != NULL);
++
++  entity->textPtr = xcsdup_str(text);
++  assert_true(entity->textPtr != NULL);
++
++  entity->textLen = xcslen(entity->textPtr);
++
++#if XML_GE == 1
++  entity->scanPtr = entity->textPtr;
++#endif // XML_GE == 1
++
++  return entity;
++}
++
++static void
++assert_entity_expanded_size_equals(XML_Parser parser, const char *text,
++                                   XmlBigCount expectedExpandedSize) {
++  // Turn `text` into a general entity with that text
++  ENTITY *const entity = createGeneralEntityWithText(text);
++
++#if XML_GE == 1
++  XmlBigCount actualExpandedSize = 0;
++  assert_true(scanEntityText(parser, entity, &entity->scanPtr,
++                             &actualExpandedSize, NULL)
++              == ENTITY_SCAN_COMPLETE);
++  assert_true(entity->scanPtr == entity->textPtr + entity->textLen);
++  assert_true(actualExpandedSize == expectedExpandedSize);
++#else
++  UNUSED_P(parser);
++  UNUSED_P(expectedExpandedSize);
++#endif // XML_GE == 1
++
++  free((XML_Char *)entity->textPtr);
++  free(entity);
++}
++
++START_TEST(test_scan_entity_text) {
++  // Speed up the test, chunk size expected to not matter in this test
++  if (g_chunkSize != 0)
++    return;
++
++  const char *const doc = "<!DOCTYPE doc[\n"
++                          "  <!ENTITY ten '123456789a'>\n"
++                          "]>\n"
++                          "<doc/>";
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, doc, (int)strlen(doc),
++                                      /*isFinal=*/XML_TRUE)
++              == XML_STATUS_OK);
++
++  assert_entity_expanded_size_equals(parser, "", 0);
++  assert_entity_expanded_size_equals(parser, "123", 3);
++  assert_entity_expanded_size_equals(parser, "&amp;&apos;&gt;&lt;&quot;",
++                                     strlen("&amp;&apos;&gt;&lt;&quot;") + 5);
++  assert_entity_expanded_size_equals(parser, "&undefined;",
++                                     strlen("&undefined;"));
++
++  // Extract entity "ten" and set its `.expandedSize` so that we can scan text
++  // that refers to "&ten;" without blocking
++#if XML_GE == 1
++  ENTITY *entityTen = NULL;
++#endif
++  {
++    ENTITY *const entityReferencingTen
++        = createGeneralEntityWithText("referencing &ten;");
++    assert_true(entityReferencingTen != NULL);
++
++#if XML_GE == 1
++    assert_true(scanEntityText(parser, entityReferencingTen,
++                               &entityReferencingTen->scanPtr,
++                               &entityReferencingTen->expandedSize, &entityTen)
++                == ENTITY_SCAN_BLOCKED);
++    assert_true(entityTen != NULL);
++    assert_true(entityReferencingTen->expandedSize == strlen("referencing "));
++    assert_true(entityReferencingTen->scanPtr
++                == entityReferencingTen->textPtr
++                       + entityReferencingTen->expandedSize);
++    XML_Char *const ten = xcsdup_str("ten");
++    assert_true(xcscmp(entityTen->name, ten) == 0);
++    free(ten);
++
++    entityTen->expandedSize = 10; // which makes it stop being a blocker
++#endif                            // XML_GE == 1
++
++    free((XML_Char *)entityReferencingTen->textPtr);
++    free(entityReferencingTen);
++  }
++
++  assert_entity_expanded_size_equals(parser, "&ten;",
++                                     strlen("&ten;") + strlen("123456789a"));
++  assert_entity_expanded_size_equals(
++      parser, "[&ten;&ten;|&ten;]",
++      3 * (strlen("&ten;") + strlen("123456789a")) + strlen("[|]"));
++
++  // Cases where no entities should be recognized
++  assert_entity_expanded_size_equals(
++      parser, "<![CDATA[&ten;]]><!--&ten;--><?php &ten;?>",
++      strlen("<![CDATA[&ten;]]><!--&ten;--><?php &ten;?>"));
++  assert_entity_expanded_size_equals(parser, "<![CDATA[&ten;",
++                                     strlen("<![CDATA[&ten;"));
++  assert_entity_expanded_size_equals(parser, "<!--&ten;", strlen("<!--&ten;"));
++  assert_entity_expanded_size_equals(parser, "<?php &ten;",
++                                     strlen("<?php &ten;"));
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++void
++make_entities_test_case(Suite *s) {
++  TCase *const tc_entities = tcase_create("entities tests");
++  suite_add_tcase(s, tc_entities);
++  tcase_add_test(tc_entities, test_is_cdata_comment_or_pi_start);
++  tcase_add_test(tc_entities, test_is_predefined_entity_name);
++  tcase_add_test(tc_entities, test_scan_entity_text);
++}
+diff --git a/tests/entities_tests.h b/tests/entities_tests.h
+new file mode 100644
+index 0000000..8a80db8
+--- /dev/null
++++ b/tests/entities_tests.h
+@@ -0,0 +1,41 @@
++/* Unit tests related to internal handling of entities
++__  __            _
++                         ___\ \/ /_ __   __ _| |_
++                        / _ \\  /| '_ \ / _` | __|
++                       |  __//  \| |_) | (_| | |_
++                        \___/_/\_\ .__/ \__,_|\__|
++                                 |_| XML parser
++
++   Copyright (c) 2026 Sebastian Pipping <sebastian@pipping.org>
++   Licensed under the MIT license:
++
++   Permission is  hereby granted,  free of charge,  to any  person obtaining
++   a  copy  of  this  software   and  associated  documentation  files  (the
++   "Software"),  to  deal in  the  Software  without restriction,  including
++   without  limitation the  rights  to use,  copy,  modify, merge,  publish,
++   distribute, sublicense, and/or sell copies of the Software, and to permit
++   persons  to whom  the Software  is  furnished to  do so,  subject to  the
++   following conditions:
++
++   The above copyright  notice and this permission notice  shall be included
++   in all copies or substantial portions of the Software.
++
++   THE  SOFTWARE  IS  PROVIDED  "AS  IS",  WITHOUT  WARRANTY  OF  ANY  KIND,
++   EXPRESS  OR IMPLIED,  INCLUDING  BUT  NOT LIMITED  TO  THE WARRANTIES  OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
++   NO EVENT SHALL THE AUTHORS OR  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
++   DAMAGES OR  OTHER LIABILITY, WHETHER  IN AN  ACTION OF CONTRACT,  TORT OR
++   OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
++   USE OR OTHER DEALINGS IN THE SOFTWARE.
++
++   SPDX-License-Identifier: MIT
++*/
++
++#ifndef XML_ENTITIES_TESTS_H
++#define XML_ENTITIES_TESTS_H
++
++#include "minicheck.h"
++
++extern void make_entities_test_case(Suite *s);
++
++#endif /* XML_ENTITIES_TESTS_H */
+diff --git a/tests/runtests.c b/tests/runtests.c
+index 20c7ec9..a8d0fa8 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -60,6 +60,7 @@
+ #include "alloc_tests.h"
+ #include "nsalloc_tests.h"
+ #include "acc_tests.h"
++#include "entities_tests.h"
+ #include "xcs_tests.h"
+ 
+ XML_Parser g_parser = NULL;
+@@ -77,6 +78,7 @@ make_suite(void) {
+   make_accounting_test_case(s);
+ #endif
+ 
++  make_entities_test_case(s);
+   make_xcs_test_case(s);
+   return s;
+ }
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index 410aa7f..aa6a179 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -29,6 +29,17 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2 \
            file://CVE-2026-117610_p2.patch \
            file://CVE-2026-118370_p1.patch \
            file://CVE-2026-118370_p2.patch \
+           file://CVE-2026-115506-dependent_p1.patch \
+           file://CVE-2026-115506-dependent_p2.patch \
+           file://CVE-2026-115506-dependent_p3.patch \
+           file://CVE-2026-115506-dependent_p4.patch \
+           file://CVE-2026-115506-dependent_p5.patch \
+           file://CVE-2026-115506-dependent_p6.patch \
+           file://CVE-2026-115506-dependent_p7.patch \
+           file://CVE-2026-115506-dependent_p8.patch \
+           file://CVE-2026-115506_p1.patch \
+           file://CVE-2026-115506_p2.patch \
+           file://CVE-2026-115506_p3.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6
