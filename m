Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25322.1795543958542925616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 10:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=G+1OZmKR;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=97205; q=dns/txt;
  s=iport01; t=1795543959; x=1796753559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0tVCxqgnDhPIKXdkM7MFVziOso0rLn0NT/ZrBws3WoU=;
  b=G+1OZmKRjxoojCmY828IUYfyJyBiDNSM9MsXY7KgBB7do/NNP3d9hDYS
   wXQ6Zxz7I2YGbfirHPhIBYD8fWTk5/h37AM6vlGoMrv7Lo0zrYABodtum
   Ghqql9BRqOOh6WUU6WIBCEjCUIhl+KI7cuhbb+gimYkuLdxH9wjU8WiNb
   VNqx+jlHZmhuStBh9/etJLeSdJFeE2ZnUdWpTlJm1WtFb3YRgv2hV0EtY
   RdCCBiMsJ4XE6aUhi62rofxhSyEzia/UG2uw8g9IygEOuAhKzNwJS4GQV
   DzOdD9AQhgwaEDmw5j+/pepUl0Fot0trN34UlP3qb0sWmNDNG4iMw5aKy
   w==;
X-CSE-ConnectionGUID: nlNvQpPlTV+TArrlFsckTg==
X-CSE-MsgGUID: S5VA139eT2uBWOANW9Df0g==
X-IPAS-Result: =?us-ascii?q?A0BtAgBD0gVr/8pK/pBTB4JZghg/dWBDSQOEGDyRdAOBE?=
 =?us-ascii?q?5A9jFkUgWQGDwEBAQ8uFg0EAQGBcQEggi1GAo4iAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAwELDgEIBAsBGAEtEAkTA?=
 =?us-ascii?q?wECAwIRFQICJwQjCBAJgipYAYJ0AxGfUppSGzd6fzOBAYIigQcBgVTbMwELF?=
 =?us-ascii?q?AGBCi6FQoMgAYUEXRgBgkuCMycbG4FygRQBgnR2gQWBXAEBgRkKFAEPAwE7G?=
 =?us-ascii?q?YMdgmoEgg0VgQyBVB5kCYIXgxcDhVaBBQKBT4hVSIECHANZLAFVEw0KCwcFg?=
 =?us-ascii?q?WgDNRIqFW4yHYEjOxcvWBsGBYEcgR6BEoEDXYErKF0BIYEIgXYCglGCAAIBS?=
 =?us-ascii?q?UEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kL?=
 =?us-ascii?q?wUaJj4bCoEMJx8eGw4CHxAGFiELLxgNSBEsNxUZBD0BbgeUHoIfagsHAQYHC?=
 =?us-ascii?q?BcCAiIFCxgEAwwBBwwYCSYeAjYMDw9VBAYWCA88kkEFJggUHo9jgiGBNZ9cC?=
 =?us-ascii?q?iiDeYwkjT52hwYaM4QETYEKkkOSVAuYfY4KFpUfGAcVDgoDC0KEaoFoPIFZc?=
 =?us-ascii?q?BWCbgEzCUoZD44rAgELC4EUAQFigWiDKl2BXWzICyYyAgkDLwEBBwIHAQwBA?=
 =?us-ascii?q?wuBaIRhix8BJwNzYAEB?=
IronPort-Data: A9a23:xsPXjKohzb04qALenx/Kc0nPKoleBmJMZBIvgKrLsJaIsI4StFCzt
 garIBmPa6qLYzTwKopwaoyx8UsDv8eDxoNmHVQ+qiE1Qi8W9ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8sj/zgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8k835pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uBzJ3937
 cQcFA5OUjmZneaY27m4duY506zPLOGzVG8eknht13TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA9NYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoLQFZsIwB7Bz
 o7A11+kPDhDb42S9WCY2E2Lr8nwzA/1AI1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QyXj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:B6Pqv68sK/wsBREiclluk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HJoB17726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:lF3pYW7AwefK4H/T89ss8koyBPk9Snnh8jTsClWiDUhyQ76pRgrF
X-Talos-MUID: 9a23:JZzOxASUMrzNRikwRXTX2Q9LbZw57pj0FWoytrwghJioO3R/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,231,1787011200"; 
   d="scan'208";a="62865601"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 18:12:36 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id D5DA73464A;
	Tue, 24 Nov 2026 18:12:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 7B5A2CBF201; Tue, 24 Nov 2026 10:12:34 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][blacksail][PATCH 2/3] expat: fix CVE-2026-115506
Date: Tue, 24 Nov 2026 10:12:28 -0800
Message-Id: <20261124181229.1704425-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124181229.1704425-1-dkelaiya@cisco.com>
References: <20261124181229.1704425-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 18:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251072
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport early entity-expansion accounting [1], identified by [2], to
Expat 2.8.5. Compute expanded entity sizes before replacement-text
processing so amplification attacks are rejected earlier.

Include the shared XML_Char helper and comparison changes [5-8],
including their unsigned-short corrections and regression tests.
Expat 2.8.5 already provides bounded hash lookups and internal testing
visibility, so those Wrynose prerequisites are not needed here.

Include the CDATA, comment and processing-instruction correction [3]
required by upstream for backports [2], plus entity-scanning tests [4].
Retain the source's int entity lengths and the preceding parser-reset
fix.

Correct an upstream accounting gap in UTF-16 builds by converting the
projected XML_Char count to bytes with an overflow check. Add
regressions for default-limit early rejection and conversion overflow
with UTF-8 and UTF-16 input, preserving narrow-build behavior below the
threshold.

Refreshed for Blacksail 5b458838c126051c884c8cb5225c7265d1483ea6.
Source patches apply without fuzz. Builds and runtime tests were
not rerun.

[1] https://github.com/libexpat/libexpat/commit/c30145b28632b31f805d57f9838ba36b8db99367
[2] https://www.openwall.com/lists/oss-security/2026/11/02/6
[3] https://github.com/libexpat/libexpat/commit/b665010ec7adb64933269df970a71e581f0d92d5
[4] https://github.com/libexpat/libexpat/commit/512af15da9dfdf7675a11af595f773c139daa7cc
[5] https://github.com/libexpat/libexpat/commit/ed8c49ea053085637517347b8675f92bda229b6f
[6] https://github.com/libexpat/libexpat/commit/b109672486e11e12b4eae11e6077a41dbdf93e9b
[7] https://github.com/libexpat/libexpat/commit/88fa70b30ae6115d80517c4710e4e63ef06e9c88
[8] https://github.com/libexpat/libexpat/commit/a824e920f3d3d77930d7897c80b6925a6733aebc

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../expat/CVE-2026-115506-dependent_p1.patch  | 296 +++++++
 .../expat/CVE-2026-115506-dependent_p2.patch  |  63 ++
 .../expat/CVE-2026-115506-dependent_p3.patch  |  97 ++
 .../expat/CVE-2026-115506-dependent_p4.patch  | 240 +++++
 .../expat/expat/CVE-2026-115506_p1.patch      | 815 +++++++++++++++++
 .../expat/expat/CVE-2026-115506_p2.patch      | 255 ++++++
 .../expat/expat/CVE-2026-115506_p3.patch      | 833 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.5.bb        |   7 +
 8 files changed, 2606 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506_p3.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p1.patch
new file mode 100644
index 00000000000..95b33fc27fe
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p1.patch
@@ -0,0 +1,296 @@
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
+ lib/xcs.c         | 60 +++++++++++++++++++++++++++++++++++++++++++++++
+ lib/xcs.h         | 41 ++++++++++++++++++++++++++++++++
+ lib/xcsinc.c      | 54 ------------------------------------------
+ lib/xmlparse.c    |  2 +-
+ tests/chardata.c  |  2 +-
+ xmlwf/Makefile.am |  1 +
+ xmlwf/xmlwf.c     |  2 +-
+ 9 files changed, 109 insertions(+), 59 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cabb6991c4ce..aa8f614e3ea3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -405,11 +405,11 @@ endif()
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
+@@ -651,6 +651,7 @@ endif()
+ #
+ if(EXPAT_BUILD_TOOLS)
+     set(xmlwf_SRCS
++        lib/xcs.c
+         xmlwf/codepage.c
+         xmlwf/readfilemap.c
+         xmlwf/xmlfile.c
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 6b0d0af4e3c5..e4211b4dd3f9 100644
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
+@@ -125,7 +126,7 @@ EXTRA_DIST = \
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
+index 000000000000..bd634f65a456
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
+index 000000000000..9479ddf94f22
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
+index 675b2844c708..000000000000
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
+index fed2cf69a16e..767837d486b6 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -125,7 +125,7 @@
+ #include "ascii.h"
+ #include "expat.h"
+ #include "siphash.h"
+-#include "xcsinc.c"
++#include "xcs.h"
+ 
+ #if defined(HAVE_ARC4RANDOM)
+ #  include "random_arc4random.h"
+diff --git a/tests/chardata.c b/tests/chardata.c
+index a36d58c24f36..987b1fb33cc7 100644
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
+index c7eebd1eeec2..635940551bda 100644
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
+index 892732cb0729..6cfb9179fa3b 100644
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
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p2.patch
new file mode 100644
index 00000000000..c263d179e2a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p2.patch
@@ -0,0 +1,63 @@
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
+index bd634f65a456..66ebbd26f25a 100644
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
+index 9479ddf94f22..6225dd28c4e7 100644
+--- a/lib/xcs.h
++++ b/lib/xcs.h
+@@ -37,5 +37,6 @@
+ #  include "expat_external.h" // for  XML_Char
+ 
+ extern size_t xcslen(const XML_Char *s);
++extern int xcsncmp(const XML_Char *a, const XML_Char *b, size_t len);
+ 
+ #endif // ! defined(EXPAT_XCS_H)
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p3.patch b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p3.patch
new file mode 100644
index 00000000000..672e899b15c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p3.patch
@@ -0,0 +1,97 @@
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
+index 66ebbd26f25a..2d744e10e771 100644
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
+index 6225dd28c4e7..1b942647d333 100644
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
+index 6cfb9179fa3b..c3cf97f3b4e8 100644
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
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p4.patch b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p4.patch
new file mode 100644
index 00000000000..85749609c74
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p4.patch
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
+ lib/xcs.c         |  8 ++---
+ tests/Makefile.am |  4 ++-
+ tests/runtests.c  |  2 ++
+ tests/xcs_tests.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++
+ tests/xcs_tests.h | 41 ++++++++++++++++++++++
+ 6 files changed, 137 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index aa8f614e3ea3..0301b52f5532 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -735,6 +735,7 @@ if(EXPAT_BUILD_TESTS)
+         tests/nsalloc_tests.c
+         tests/runtests.c
+         tests/structdata.c
++        tests/xcs_tests.c
+         ${_EXPAT_C_SOURCES}
+     )
+ 
+diff --git a/lib/xcs.c b/lib/xcs.c
+index 2d744e10e771..ae5e042d778f 100644
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
+index 21d8df2c6676..4601da30bd38 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -56,7 +56,8 @@ runtests_SOURCES = \
+     ns_tests.c \
+     nsalloc_tests.c \
+     runtests.c \
+-    structdata.c
++    structdata.c \
++    xcs_tests.c
+ 
+ runtests_LDADD = ../lib/libtestpat.la
+ 
+@@ -79,5 +80,6 @@ EXTRA_DIST = \
+     README.md \
+     structdata.h \
+     udiffer.py \
++    xcs_tests.h \
+     xmltest.log.expected \
+     xmltest.sh
+diff --git a/tests/runtests.c b/tests/runtests.c
+index 12f8c36c12e3..943dfeaf9161 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -61,6 +61,7 @@
+ #include "alloc_tests.h"
+ #include "nsalloc_tests.h"
+ #include "acc_tests.h"
++#include "xcs_tests.h"
+ 
+ XML_Parser g_parser = NULL;
+ 
+@@ -78,6 +79,7 @@ make_suite(void) {
+   make_accounting_test_case(s);
+ #endif
+ 
++  make_xcs_test_case(s);
+   return s;
+ }
+ 
+diff --git a/tests/xcs_tests.c b/tests/xcs_tests.c
+new file mode 100644
+index 000000000000..3d756b043dde
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
+index 000000000000..52015f14a63e
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
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat/CVE-2026-115506_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-115506_p1.patch
new file mode 100644
index 00000000000..88867b28847
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
+- Correct upstream's UTF-16 preflight by converting the projected
+  XML_Char count to bytes. Reject counts above the XmlBigCount limit
+  divided by sizeof(XML_Char) before multiplying.
+- Clarify that the scanner accumulates internal character units.
+
+Co-authored-by: Shani Yosef <shani.yosef@echo.ai>
+Co-authored-by: Berkay Eren Ürün <berkay.ueruen@siemens.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 513 ++++++++++++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 470 insertions(+), 43 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 767837d486b6..d67a458f2808 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -306,6 +306,8 @@ typedef struct tag {
+   BINDING *bindings;
+ } TAG;
+ 
++typedef unsigned long long XmlBigCount;
++
+ typedef struct {
+   const XML_Char *name;
+   const XML_Char *textPtr;
+@@ -322,6 +324,20 @@ typedef struct {
+     entities are processed and closed */
+   bool is_param;
+   bool is_internal; /* true if declared in internal subset outside PE */
++#if XML_GE == 1
++  /* Indirect accounting bytes charged when this entity is expanded: 1 per text
++     character, plus each reference's "&name;"/"%name;" token length and its own
++     expansion. Matches XML_ACCOUNT_ENTITY_EXPANSION, so it is not the
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
+@@ -452,7 +468,6 @@ enum XML_Account {
+ };
+ 
+ #if XML_GE == 1
+-typedef unsigned long long XmlBigCount;
+ typedef struct accounting {
+   XmlBigCount countBytesDirect;
+   XmlBigCount countBytesIndirect;
+@@ -476,6 +491,13 @@ typedef struct entity_stats {
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
+ typedef enum XML_Error Processor(XML_Parser parser, const char *start,
+@@ -558,6 +580,9 @@ static enum XML_Error callStoreEntityValue(XML_Parser parser,
+                                            const ENCODING *enc,
+                                            const char *start, const char *end,
+                                            enum XML_Account account);
++static enum XML_Error resolveEntityClosureExpandedSize(XML_Parser parser,
++                                                       HASH_TABLE *table,
++                                                       ENTITY *root);
+ #else
+ static enum XML_Error storeSelfEntityValue(XML_Parser parser, ENTITY *entity);
+ #endif
+@@ -617,9 +642,13 @@ static void parserInit(XML_Parser parser, const XML_Char *encodingName,
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
+@@ -629,6 +658,9 @@ static XML_Bool accountingDiffTolerated(XML_Parser originParser, int tok,
+                                         const char *before, const char *after,
+                                         int source_line,
+                                         enum XML_Account account);
++static XML_Bool
++accountingCurrentAmplificationTolerated(XML_Parser rootParser,
++                                        XmlBigCount extraIndirectBytes);
+ 
+ static void entityTrackingReportStats(XML_Parser parser, ENTITY *entity,
+                                       const char *action, int sourceLine);
+@@ -636,6 +668,10 @@ static void entityTrackingOnOpen(XML_Parser parser, ENTITY *entity,
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
+@@ -3212,7 +3248,7 @@ externalEntityInitProcessor2(XML_Parser parser, const char *start,
+ #if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, start, next, __LINE__,
+                                   XML_ACCOUNT_DIRECT)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+ #endif /* XML_GE == 1 */
+@@ -3341,7 +3377,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+               : next;
+     if (! accountingDiffTolerated(parser, tok, s, accountAfter, __LINE__,
+                                   account)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+ #endif
+@@ -4645,7 +4681,7 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+     int tok = XmlCdataSectionTok(enc, s, end, &next);
+ #if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__, account)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+ #else
+@@ -4817,7 +4853,7 @@ doIgnoreSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+ #  if XML_GE == 1
+   if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                 XML_ACCOUNT_DIRECT)) {
+-    accountingOnAbort(parser);
++    accountingOnAbort(parser, 0, __LINE__);
+     return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+   }
+ #  endif
+@@ -4909,7 +4945,7 @@ processXmlDecl(XML_Parser parser, int isGeneralTextEntity, const char *s,
+ #if XML_GE == 1
+   if (! accountingDiffTolerated(parser, XML_TOK_XML_DECL, s, next, __LINE__,
+                                 XML_ACCOUNT_DIRECT)) {
+-    accountingOnAbort(parser);
++    accountingOnAbort(parser, 0, __LINE__);
+     return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+   }
+ #endif
+@@ -5130,7 +5166,7 @@ entityValueInitProcessor(XML_Parser parser, const char *s, const char *end,
+ #  if XML_GE == 1
+       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                     XML_ACCOUNT_DIRECT)) {
+-        accountingOnAbort(parser);
++        accountingOnAbort(parser, 0, __LINE__);
+         return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+       }
+ #  endif
+@@ -5183,7 +5219,7 @@ externalParEntProcessor(XML_Parser parser, const char *s, const char *end,
+   else if (tok == XML_TOK_BOM) {
+     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                   XML_ACCOUNT_DIRECT)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+ 
+@@ -5362,7 +5398,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       break;
+     default:
+       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__, account)) {
+-        accountingOnAbort(parser);
++        accountingOnAbort(parser, 0, __LINE__);
+         return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+       }
+     }
+@@ -5525,7 +5561,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+         handleDefault = XML_FALSE;
+       }
+       break;
+-    case XML_ROLE_INSTANCE_START:
++    case XML_ROLE_INSTANCE_START: {
+ #ifdef XML_DTD
+       /* if there is no DOCTYPE declaration then now is the
+          last chance to read the foreign DTD
+@@ -5569,6 +5605,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+ #endif /* XML_DTD */
+       parser->m_processor = contentProcessor;
+       return contentProcessor(parser, s, end, nextPtr);
++    }
+     case XML_ROLE_ATTLIST_ELEMENT_NAME:
+       parser->m_declElementType = getElementType(parser, enc, s, next);
+       if (! parser->m_declElementType)
+@@ -5713,9 +5750,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
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
+@@ -6391,7 +6430,7 @@ epilogProcessor(XML_Parser parser, const char *s, const char *end,
+ #if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                   XML_ACCOUNT_DIRECT)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+ #endif
+@@ -6458,6 +6497,288 @@ epilogProcessor(XML_Parser parser, const char *s, const char *end,
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
++   *expandedSize (in/out, expanded-character accumulator):
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
+ processEntity(XML_Parser parser, ENTITY *entity, bool betweenDecl,
+               enum EntityType type) {
+@@ -6486,6 +6807,42 @@ processEntity(XML_Parser parser, ENTITY *entity, bool betweenDecl,
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
+@@ -6498,7 +6855,7 @@ processEntity(XML_Parser parser, ENTITY *entity, bool betweenDecl,
+   entity->hasMore = true;
+ #if XML_GE == 1
+   entityTrackingOnOpen(parser, entity, __LINE__);
+-#endif
++#endif /* XML_GE == 1 */
+   entity->processed = 0;
+   openEntity->next = *openEntityList;
+   *openEntityList = openEntity;
+@@ -6701,7 +7058,7 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+     int tok = XmlAttributeValueTok(enc, ptr, end, &next);
+ #if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, ptr, next, __LINE__, account)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+ #endif
+@@ -6917,7 +7274,7 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+ 
+     if (! accountingDiffTolerated(parser, tok, entityTextPtr, next, __LINE__,
+                                   account)) {
+-      accountingOnAbort(parser);
++      accountingOnAbort(parser, 0, __LINE__);
+       result = XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+       goto endEntityValue;
+     }
+@@ -7163,7 +7520,8 @@ storeSelfEntityValue(XML_Parser parser, ENTITY *entity) {
+     poolDiscard(pool);
+     return XML_ERROR_NO_MEMORY;
+   }
+-  entity->textPtr = poolStart(pool);
++  const XML_Char *const valueStart = poolStart(pool);
++  entity->textPtr = valueStart;
+   entity->textLen = (int)(poolLength(pool));
+   poolFinish(pool);
+ 
+@@ -7941,6 +8299,9 @@ copyEntityTable(XML_Parser oldParser, HASH_TABLE *newTable,
+         return 0;
+       newE->textPtr = tem;
+       newE->textLen = oldE->textLen;
++#if XML_GE == 1
++      newE->scanPtr = tem;
++#endif /* XML_GE == 1 */
+     }
+     if (oldE->notation) {
+       const XML_Char *tem = poolCopyString(newPool, oldE->notation);
+@@ -8708,25 +9069,27 @@ copyString(const XML_Char *s, XML_Parser parser) {
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
+@@ -8734,19 +9097,33 @@ accountingReportStats(XML_Parser originParser, const char *epilog) {
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
+@@ -8786,6 +9163,32 @@ accountingReportDiff(XML_Parser rootParser,
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
+@@ -8822,18 +9225,11 @@ accountingDiffTolerated(XML_Parser originParser, int tok, const char *before,
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
+@@ -8879,14 +9275,21 @@ entityTrackingReportStats(XML_Parser rootParser, ENTITY *entity,
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
+@@ -8901,6 +9304,7 @@ entityTrackingOnOpen(XML_Parser originParser, ENTITY *entity, int sourceLine) {
+     rootParser->m_entity_stats.maximumDepthSeen++;
+   }
+ 
++  // NOTE: The space at the end of "OPEN " is for length alignment with "CLOSE"
+   entityTrackingReportStats(rootParser, entity, "OPEN ", sourceLine);
+ }
+ 
+@@ -8913,6 +9317,29 @@ entityTrackingOnClose(XML_Parser originParser, ENTITY *entity, int sourceLine) {
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
index 00000000000..7670f7a87ef
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
+ lib/xcs.c         |  21 ++++++++
+ lib/xcs.h         |   3 ++
+ lib/xmlparse.c    | 124 ++++++++++++++++++++++++++++++++++++++++++++++
+ tests/xcs_tests.c |  23 +++++++++
+ 5 files changed, 172 insertions(+)
+
+diff --git a/lib/ascii.h b/lib/ascii.h
+index 1d9cf70bf695..60cb9c5745d4 100644
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
+index ae5e042d778f..a97647fa9d69 100644
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
+index 1b942647d333..9fbc4fe4c851 100644
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
+index d67a458f2808..7a5b73d1b9d4 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -6553,6 +6553,65 @@ enum EntityScanResult {
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
+@@ -6593,6 +6652,71 @@ scanEntityText(XML_Parser parser, ENTITY *entity, const XML_Char **posPtr,
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
+index 3d756b043dde..44b9273e3235 100644
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
index 00000000000..638a8366e51
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-115506_p3.patch
@@ -0,0 +1,833 @@
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
+- Retain Expat 2.8.5's int textLen and processed fields when moving
+  ENTITY into entities.h.
+- State the projected cost's XML_Char units in the extracted ENTITY
+  comment; runtime accounting uses bytes.
+- Add default-limit and conversion-overflow regressions with UTF-8
+  and UTF-16 input. Check early rejection in UTF-16 builds and retain
+  narrow-build behavior below the activation threshold.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CMakeLists.txt         |   1 +
+ lib/Makefile.am        |   1 +
+ lib/entities.h         |  99 +++++++++++++++++
+ lib/internal.h         |   2 +
+ lib/xmlparse.c         |  52 +--------
+ tests/Makefile.am      |   2 +
+ tests/acc_tests.c      | 158 ++++++++++++++++++++++++++
+ tests/common.c         |  12 ++
+ tests/common.h         |   2 +
+ tests/entities_tests.c | 246 +++++++++++++++++++++++++++++++++++++++++
+ tests/entities_tests.h |  41 +++++++
+ tests/runtests.c       |   2 +
+ 12 files changed, 570 insertions(+), 48 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0301b52f5532..06cf9737e269 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -728,6 +728,7 @@ if(EXPAT_BUILD_TESTS)
+         tests/dummy.c
+         tests/handlers.c
+         tests/hash_tests.c
++        tests/entities_tests.c
+         tests/memcheck.c
+         tests/minicheck.c
+         tests/misc_tests.c
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index e4211b4dd3f9..0c0644f282b8 100644
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
+index 000000000000..cfcb6cab1552
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
++  bool open;
++  bool hasMore; /* true if entity has not been completely processed */
++  /* An entity can be open while being already completely processed (!hasMore).
++    The reason is the delayed closing of entities until their inner
++    entities are processed and closed */
++  bool is_param;
++  bool is_internal; /* true if declared in internal subset outside PE */
++#  if XML_GE == 1
++  /* Projected indirect-accounting cost in XML_Chars: 1 per text character,
++     plus each reference's "&name;"/"%name;" token length and its own expansion.
++     Multiply by sizeof(XML_Char) before comparing with byte counters. This is
++     not the replacement-text size. 0 means "not computed yet" (an empty entity
++     is 0 too, told apart by textLen == 0). */
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
+index 86655371d290..31b5f031e14e 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -129,6 +129,8 @@ union expat_align {
+ 
+ #  include "expat.h" // so we can use type XML_Parser below
+ 
++typedef unsigned long long XmlBigCount;
++
+ void _INTERNAL_trim_to_complete_utf8_characters(const char *from,
+                                                 const char **fromLimRef);
+ 
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 7a5b73d1b9d4..c1d074757b3a 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -229,6 +229,7 @@ typedef char ICHAR;
+ 
+ #include "internal.h"
+ #include "hash_table.h"
++#include "entities.h"
+ #include "xmltok.h"
+ #include "xmlrole.h"
+ 
+@@ -306,40 +307,6 @@ typedef struct tag {
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
+-  bool open;
+-  bool hasMore; /* true if entity has not been completely processed */
+-  /* An entity can be open while being already completely processed (!hasMore).
+-    The reason is the delayed closing of entities until their inner
+-    entities are processed and closed */
+-  bool is_param;
+-  bool is_internal; /* true if declared in internal subset outside PE */
+-#if XML_GE == 1
+-  /* Indirect accounting bytes charged when this entity is expanded: 1 per text
+-     character, plus each reference's "&name;"/"%name;" token length and its own
+-     expansion. Matches XML_ACCOUNT_ENTITY_EXPANSION, so it is not the
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
+@@ -6504,7 +6471,7 @@ epilogProcessor(XML_Parser parser, const char *s, const char *end,
+ // explicit length, instead. Returns
+ // ASCII_AMP/ASCII_APOS/ASCII_GT/ASCII_LT/ASCII_QUOT for a match or 0 for no
+ // match.
+-static int
++XML_NONTESTING_STATIC int
+ isPredefinedEntityName(const XML_Char *name, size_t nameLen) {
+   switch (nameLen) {
+   case 2:
+@@ -6542,17 +6509,6 @@ isPredefinedEntityName(const XML_Char *name, size_t nameLen) {
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
+@@ -6578,7 +6534,7 @@ static const size_t piCloseLen = sizeof(piClose) / sizeof(piClose[0]) - 1;
+ // XML_TOK_CDATA_SECT_OPEN/XML_TOK_COMMENT/XML_TOK_PI for a match or
+ // XML_TOK_INVALID (=0) for no match. Only in the success case, the length
+ // of the token is written to `*openTextLen`.
+-static int
++XML_NONTESTING_STATIC int
+ isCDataCommentOrPIStart(const XML_Char *pos, size_t maxLen,
+                         size_t *openTextLen) {
+   assert(pos != NULL);
+@@ -6634,7 +6590,7 @@ isCDataCommentOrPIStart(const XML_Char *pos, size_t maxLen,
+      of entities it references), not a total across all entities. Not
+      meaningful after ENTITY_SCAN_OVERFLOW; the overflowing value is never
+      stored anywhere. */
+-static enum EntityScanResult
++XML_NONTESTING_STATIC enum EntityScanResult
+ scanEntityText(XML_Parser parser, ENTITY *entity, const XML_Char **posPtr,
+                XmlBigCount *expandedSize, ENTITY **blockerOut) {
+   if (blockerOut != NULL)
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 4601da30bd38..cad5f54c57dc 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -50,6 +50,7 @@ runtests_SOURCES = \
+     dummy.c \
+     handlers.c \
+     hash_tests.c \
++    entities_tests.c \
+     memcheck.c \
+     minicheck.c \
+     misc_tests.c \
+@@ -72,6 +73,7 @@ EXTRA_DIST = \
+     dummy.h \
+     handlers.h \
+     hash_tests.h \
++    entities_tests.h \
+     memcheck.h \
+     minicheck.h \
+     misc_tests.h \
+diff --git a/tests/acc_tests.c b/tests/acc_tests.c
+index d9f58a490bec..b72fa5161a63 100644
+--- a/tests/acc_tests.c
++++ b/tests/acc_tests.c
+@@ -45,8 +45,11 @@
+ 
+ #include "expat_config.h"
+ 
++#include <float.h>
++#include <limits.h>
+ #include <math.h> /* NAN, INFINITY */
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <string.h>
+ 
+ #include "expat.h"
+@@ -470,6 +473,159 @@ START_TEST(test_amplification_reset_neutrality) {
+ }
+ END_TEST
+ 
++struct PreflightData {
++  XML_Parser parser;
++  unsigned long long characters;
++  XML_Bool stop;
++};
++
++static void XMLCALL
++preflight_characters(void *userData, const XML_Char *text, int length) {
++  struct PreflightData *const data = userData;
++  UNUSED_P(text);
++  data->characters += (unsigned int)length;
++  if (data->stop)
++    assert_true(XML_StopParser(data->parser, XML_FALSE) == XML_STATUS_OK);
++}
++
++static char *
++preflight_encode(char *doc, XML_Bool utf16, int *length) {
++  const size_t len = strlen(doc);
++  if (! utf16) {
++    *length = (int)len;
++    return doc;
++  }
++  char *const encoded = malloc(2 + 2 * len);
++  assert_true(encoded != NULL);
++  encoded[0] = (char)0xff;
++  encoded[1] = (char)0xfe;
++  for (size_t i = 0; i < len; i++) {
++    encoded[2 + 2 * i] = doc[i];
++    encoded[3 + 2 * i] = 0;
++  }
++  free(doc);
++  *length = (int)(2 + 2 * len);
++  return encoded;
++}
++
++static char *
++preflight_default_document(unsigned int references) {
++  const char prefix[] = "<!DOCTYPE r [<!ENTITY e '";
++  const char middle[] = "'><!ENTITY t '";
++  const char suffix[] = "'>]><r>&t;</r>";
++  const size_t size = sizeof(prefix) - 1 + 1024 + sizeof(middle) - 1
++                      + references * 3 + sizeof(suffix);
++  char *const doc = malloc(size);
++  assert_true(doc != NULL);
++  char *cursor = doc;
++  memcpy(cursor, prefix, sizeof(prefix) - 1);
++  cursor += sizeof(prefix) - 1;
++  memset(cursor, 'a', 1024);
++  cursor += 1024;
++  memcpy(cursor, middle, sizeof(middle) - 1);
++  cursor += sizeof(middle) - 1;
++  for (unsigned int i = 0; i < references; i++) {
++    memcpy(cursor, "&e;", 3);
++    cursor += 3;
++  }
++  memcpy(cursor, suffix, sizeof(suffix));
++  return doc;
++}
++
++START_TEST(test_entity_preflight_default_bytes) {
++  if (g_chunkSize != 0)
++    return;
++  const unsigned int counts[] = {10, 5000, 10000};
++  for (size_t i = 0; i < sizeof(counts) / sizeof(counts[0]); i++) {
++    for (int utf16 = 0; utf16 <= 1; utf16++) {
++      const unsigned int references = counts[i];
++      set_subtest("width=%zu input=%s refs=%u", sizeof(XML_Char),
++                  utf16 ? "UTF-16LE" : "UTF-8", references);
++      int length;
++      char *const doc = preflight_encode(preflight_default_document(references),
++                                         (XML_Bool)utf16, &length);
++      XML_Parser parser = XML_ParserCreate(NULL);
++      assert_true(parser != NULL);
++      struct PreflightData data = {parser, 0, XML_FALSE};
++      XML_SetUserData(parser, &data);
++      XML_SetCharacterDataHandler(parser, preflight_characters);
++      /* Retain the default amplification factor and activation threshold. */
++      const enum XML_Status status = XML_Parse(parser, doc, length, XML_TRUE);
++      const enum XML_Error error = XML_GetErrorCode(parser);
++      XML_ParserFree(parser);
++      free(doc);
++      /* 5000 references project 5,135,000 internal characters: below 8 MiB
++         as UTF-8, but above it when each XML_Char occupies two bytes. */
++      const XML_Bool reject = references == 10000
++                              || (references == 5000 && sizeof(XML_Char) > 1);
++      assert_true(status == (reject ? XML_STATUS_ERROR : XML_STATUS_OK));
++      assert_true(error == (reject ? XML_ERROR_AMPLIFICATION_LIMIT_BREACH
++                                   : XML_ERROR_NONE));
++      assert_true(data.characters
++                  == (reject ? 0 : (unsigned long long)references * 1024));
++    }
++  }
++}
++END_TEST
++
++static char *
++preflight_overflow_document(void) {
++  const size_t capacity = 4096;
++  char *const doc = malloc(capacity);
++  assert_true(doc != NULL);
++  size_t length = (size_t)snprintf(doc, capacity,
++                                  "<!DOCTYPE r [<!ENTITY e0 'a'>");
++  for (unsigned int i = 1; i <= 60; i++) {
++    const int added = snprintf(doc + length, capacity - length,
++                               "<!ENTITY e%u '&e%u;&e%u;'>", i, i - 1, i - 1);
++    assert_true(added > 0 && (size_t)added < capacity - length);
++    length += (size_t)added;
++  }
++  const int added = snprintf(doc + length, capacity - length,
++                             "]><r>&e60;</r>");
++  assert_true(added > 0 && (size_t)added < capacity - length);
++  return doc;
++}
++
++START_TEST(test_entity_preflight_byte_overflow) {
++  if (g_chunkSize != 0)
++    return;
++  for (int utf16 = 0; utf16 <= 1; utf16++) {
++    set_subtest("width=%zu input=%s", sizeof(XML_Char),
++                utf16 ? "UTF-16LE" : "UTF-8");
++    int length;
++    char *const doc = preflight_encode(preflight_overflow_document(),
++                                       (XML_Bool)utf16, &length);
++    XML_Parser parser = XML_ParserCreate(NULL);
++    assert_true(parser != NULL);
++    assert_true(XML_SetBillionLaughsAttackProtectionMaximumAmplification(
++                    parser, FLT_MAX)
++                == XML_TRUE);
++    assert_true(XML_SetBillionLaughsAttackProtectionActivationThreshold(
++                    parser, ULLONG_MAX)
++                == XML_TRUE);
++    /* e60 projects 10,378,545,341,275,308,022 internal characters. This
++       fits the counter, while its UTF-16 byte cost cannot fit. Stop after
++       the first delivery to keep an unfixed control bounded. */
++    struct PreflightData data = {parser, 0, XML_TRUE};
++    XML_SetUserData(parser, &data);
++    XML_SetCharacterDataHandler(parser, preflight_characters);
++    const enum XML_Status status = XML_Parse(parser, doc, length, XML_TRUE);
++    const enum XML_Error error = XML_GetErrorCode(parser);
++    XML_ParserFree(parser);
++    free(doc);
++    assert_true(status == XML_STATUS_ERROR);
++    if (sizeof(XML_Char) > 1) {
++      assert_true(error == XML_ERROR_AMPLIFICATION_LIMIT_BREACH);
++      assert_true(data.characters == 0);
++    } else {
++      assert_true(error == XML_ERROR_ABORTED);
++      assert_true(data.characters > 0);
++    }
++  }
++}
++END_TEST
++
+ #endif // XML_GE == 1
+ 
+ void
+@@ -485,6 +641,8 @@ make_accounting_test_case(Suite *s) {
+   tcase_add_test__ifdef_xml_dtd(tc_accounting,
+                                 test_amplification_isolated_external_parser);
+   tcase_add_test(tc_accounting, test_amplification_reset_neutrality);
++  tcase_add_test(tc_accounting, test_entity_preflight_default_bytes);
++  tcase_add_test(tc_accounting, test_entity_preflight_byte_overflow);
+ #else
+   UNUSED_P(s);
+ #endif /* XML_GE == 1 */
+diff --git a/tests/common.c b/tests/common.c
+index e2980cbcadbd..5984471e325b 100644
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
+index f9bde995e7d2..d407a6bca8d7 100644
+--- a/tests/common.h
++++ b/tests/common.h
+@@ -146,4 +146,6 @@ extern void *duff_reallocator(void *ptr, size_t size);
+ 
+ extern char *portable_strndup(const char *s, size_t n);
+ 
++extern XML_Char *xcsdup_str(const char *s);
++
+ #endif /* XML_COMMON_H */
+diff --git a/tests/entities_tests.c b/tests/entities_tests.c
+new file mode 100644
+index 000000000000..fd401bea3220
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
+index 000000000000..8a80db8834c4
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
+index 943dfeaf9161..f2b175efc485 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -55,6 +55,7 @@
+ #include "common.h"
+ 
+ #include "basic_tests.h"
++#include "entities_tests.h"
+ #include "hash_tests.h"
+ #include "ns_tests.h"
+ #include "misc_tests.h"
+@@ -70,6 +71,7 @@ make_suite(void) {
+   Suite *s = suite_create("basic");
+ 
+   make_basic_test_case(s);
++  make_entities_test_case(s);
+   make_hash_test_case(s);
+   make_namespace_test_case(s);
+   make_miscellaneous_test_case(s);
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat_2.8.5.bb b/meta/recipes-core/expat/expat_2.8.5.bb
index 2faedb35c7e..f380aab56fa 100644
--- a/meta/recipes-core/expat/expat_2.8.5.bb
+++ b/meta/recipes-core/expat/expat_2.8.5.bb
@@ -17,6 +17,13 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-113351_p3.patch \
            file://CVE-2026-113351_p4.patch \
            file://CVE-2026-113351_p5.patch \
+           file://CVE-2026-115506-dependent_p1.patch \
+           file://CVE-2026-115506-dependent_p2.patch \
+           file://CVE-2026-115506-dependent_p3.patch \
+           file://CVE-2026-115506-dependent_p4.patch \
+           file://CVE-2026-115506_p1.patch \
+           file://CVE-2026-115506_p2.patch \
+           file://CVE-2026-115506_p3.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6
