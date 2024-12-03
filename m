Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE38E69E88
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 10:14:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15909.1733220889939769834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 02:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20671b3c9a=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37Jgn8011232
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Dec 2024 02:14:49 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7tvva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 02:14:49 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 3 Dec 2024 02:14:47 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] Revert "ruby: upgrade 3.2.2 -> 3.3.5"
Date: Tue, 3 Dec 2024 10:14:26 +0000
Message-ID: <20241203101426.2227535-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: rC9EA9tAD6h3AeTuRByTvAQoGlZUXTlR
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=674eda19 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=RZcAm9yDv7YA:10 a=b4LDLZbEAAAA:8 a=Twlkf-z8AAAA:8 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8 a=-fKjk79AAAAA:8
 a=A1X0JdhQAAAA:8 a=w2PP7KgtAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=9Wbp7B8dAAAA:8 a=svO6gwnVAAAA:8 a=cd34Doh_AAAA:8 a=cETuxoCwAAAA:8 a=v12xRLZ1AAAA:8 a=fk1lIlRQAAAA:8 a=F7opxe6ksRFA80excgQA:9 a=p97NfMmiahrsBjvO:21 a=g_-jsAev3ssA:10
 a=20T61YgZp4ItGotXEy2O:22 a=-74SuR6ZdpOK_LpdRCUo:22 a=yfRUlTaMxgxjPDvNZr5O:22 a=CDB6uwv3NW-08_pL9N3q:22 a=FdTzh2GWekK77mhwV6Dw:22 a=BESxJfN36ujmTJQqZ0Zq:22 a=5awQwY9Y38-QVGG67zo_:22 a=DGTqSDpDppWLBvRNt63D:22 a=tb6VMGFFq-HsUJGUQiVL:22
 a=AgWhkyGJzIdW_ONjbm8h:22 a=U75ogvRika4pmaD_UPO0:22
X-Proofpoint-ORIG-GUID: rC9EA9tAD6h3AeTuRByTvAQoGlZUXTlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412030087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 10:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208185

From: Yogita Urade <yogita.urade@windriver.com>

This reverts commit 0402f54b66438ec6e9f06f02652e148dce6480b3.

This isn't a minor version upgrade.
$git log v3_2_2..v3_3_5 --oneline  | wc -l
6924

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...Alignof-to-define-ALIGN_OF-when-poss.patch | 51 ++++++++++
 ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch | 25 +++++
 ...-Makefile.in-filter-out-f-prefix-map.patch | 42 ++++++++
 ...eproducible-change-fixing-784225-too.patch | 26 ++---
 .../0006-Make-gemspecs-reproducible.patch     | 18 ++--
 .../ruby/ruby/CVE-2023-36617_1.patch          | 55 +++++++++++
 .../ruby/ruby/CVE-2023-36617_2.patch          | 51 ++++++++++
 .../ruby/ruby/CVE-2024-27281.patch            | 96 +++++++++++++++++++
 .../ruby/ruby/CVE-2024-27282.patch            | 27 ++++++
 .../ruby/ruby/remove_has_include_macros.patch | 35 +++++++
 .../ruby/{ruby_3.3.5.bb => ruby_3.2.2.bb}     | 13 ++-
 12 files changed, 446 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
 rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb => ruby_3.2.2.bb} (88%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch b/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
new file mode 100644
index 0000000000..ab7ae1eb23
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
@@ -0,0 +1,51 @@
+From 6b3c202b46b9312c5bb0789145f13d8086e70948 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Jan 2023 02:34:17 -0800
+Subject: [PATCH] fiddle: Use C11 _Alignof to define ALIGN_OF when possible
+
+WG14 N2350 made very clear that it is an UB having type definitions
+within "offsetof" [1]. This patch enhances the implementation of macro
+ALIGN_OF to use builtin "_Alignof" to avoid undefined behavior
+when using std=c11 or newer
+
+clang 16+ has started to flag this [2]
+
+Fixes build when using -std >= gnu11 and using clang16+
+
+Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
+may support C11, exclude those compiler versions
+
+[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+[2] https://reviews.llvm.org/D133574
+
+Upstream-Status: Submitted [https://github.com/ruby/fiddle/pull/120]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ext/fiddle/fiddle.h | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/ext/fiddle/fiddle.h b/ext/fiddle/fiddle.h
+index 10eb9ce..ffb395e 100644
+--- a/ext/fiddle/fiddle.h
++++ b/ext/fiddle/fiddle.h
+@@ -196,7 +196,17 @@
+ #endif
+ #define TYPE_UINTPTR_T (-TYPE_INTPTR_T)
+
+-#define ALIGN_OF(type) offsetof(struct {char align_c; type align_x;}, align_x)
++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
++   clang versions < 8.0.0 have the same bug.  */
++#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
++     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
++         && !defined __clang__) \
++     || (defined __clang__ && __clang_major__ < 8))
++# define ALIGN_OF(type) offsetof(struct {char align_c; type align_x;}, align_x)
++#else
++# define ALIGN_OF(type) _Alignof(type)
++#endif
+
+ #define ALIGN_VOIDP  ALIGN_OF(void*)
+ #define ALIGN_CHAR   ALIGN_OF(char)
+--
+2.39.0
diff --git a/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
new file mode 100644
index 0000000000..e35a461f76
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
@@ -0,0 +1,32 @@
+From 2368d07660a93a2c41d63f3ab6054ca4daeef820 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 17 Nov 2020 18:31:40 +0000
+Subject: [PATCH] template/Makefile.in: do not write host cross-cc items into
+ target config
+
+This helps reproducibility.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ template/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/template/Makefile.in b/template/Makefile.in
+index 10dc826..940ee07 100644
+--- a/template/Makefile.in
++++ b/template/Makefile.in
+@@ -657,11 +657,11 @@ mjit_config.h:
+	echo '#endif'; \
+	quote MJIT_MIN_HEADER_NAME "$(MJIT_MIN_HEADER_NAME)"; \
+	sep=,; \
+-	quote "MJIT_CC_COMMON  " $(MJIT_CC); \
++	quote "MJIT_CC_COMMON  " ; \
+	quote "MJIT_CFLAGS      MJIT_ARCHFLAG" $(MJIT_CFLAGS); \
+	quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
+	quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
+-	quote "MJIT_LDSHARED   " $(MJIT_LDSHARED); \
++	quote "MJIT_LDSHARED   " ; \
+	quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
+	quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
+	quote 'PRELOADENV       "@PRELOADENV@"'; \
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
new file mode 100644
index 0000000000..96ae86263b
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -0,0 +1,25 @@
+From 21d8e7700fa0a9c4bf569dd366134060ae858832 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Thu, 5 May 2016 10:59:07 -0700
+Subject: [PATCH] Obey LDFLAGS for the link of libruby
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-Status: Pending
+
+---
+ template/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/template/Makefile.in b/template/Makefile.in
+index 1456313..15b98a4 100644
+--- a/template/Makefile.in
++++ b/template/Makefile.in
+@@ -127,7 +127,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
+ LDSHARED = @LIBRUBY_LDSHARED@
+ DLDSHARED = @DLDSHARED@
+ XDLDFLAGS = @DLDFLAGS@
+-DLDFLAGS = @LIBRUBY_DLDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
++DLDFLAGS = @LIBRUBY_DLDFLAGS@ @LDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
+ SOLIBS = @SOLIBS@
+ ENABLE_DEBUG_ENV = @ENABLE_DEBUG_ENV@
+ MAINLIBS = $(YJIT_LIBS) @MAINLIBS@
diff --git a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
new file mode 100644
index 0000000000..b0d9a2e0ed
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
@@ -0,0 +1,42 @@
+Subject: [PATCH] template/Makefile.in: filter out -f*prefix-map
+
+If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no longer
+reproducible.  Fix this.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
+---
+--- a/tool/mjit_archflag.sh
++++ b/tool/mjit_archflag.sh
+@@ -7,6 +7,20 @@ quote() {
+     echo
+ }
+
++quote_filtered() {
++    printf "#${indent}define $1"
++    while shift && [ "$#" -gt 0 ]; do
++	case "$1" in
++	    -ffile-prefix-map=*|-fdebug-prefix-map=*|-fmacro-prefix-map=*)
++		;;
++	    *)
++		printf ' "%s"'$sep "$1"
++		;;
++	esac
++    done
++    echo
++}
++
+ archs=""
+ arch_flag=""
+
+--- a/template/Makefile.in
++++ b/template/Makefile.in
+@@ -666,7 +666,7 @@ mjit_config.h:
+	quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
+	quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
+	quote "MJIT_LDSHARED   " ; \
+-	quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
++	quote_filtered "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
+	quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
+	quote 'PRELOADENV       "@PRELOADENV@"'; \
+	indent=$${archs:+'  '}; \
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 0902a201ec..41f206523e 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -12,20 +12,20 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index d6eac7f..4b2e95e 100644
+index 0d72cee..eb7bc25 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1707,7 +1707,9 @@ class Gem::Specification < Gem::BasicSpecification
-                 raise(Gem::InvalidSpecificationException,
-                       "invalid date format in specification: #{date.inspect}")
-               end
--            when Time, DateLike then
-+            when Time then
-+              Time.utc(date.utc.year, date.utc.month, date.utc.day)
-+            when DateLike then
-               Time.utc(date.year, date.month, date.day)
-             else
-               TODAY
+@@ -1691,7 +1691,9 @@ class Gem::Specification < Gem::BasicSpecification
+         raise(Gem::InvalidSpecificationException,
+               "invalid date format in specification: #{date.inspect}")
+       end
+-    when Time, DateLike then
++    when Time then
++      Time.utc(date.utc.year, date.utc.month, date.utc.day)
++    when DateLike then
+       Time.utc(date.year, date.month, date.day)
+     else
+       TODAY
 -- 
-2.40.0
+2.25.1
 
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index d32e209129..0a87cae17f 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -7,6 +7,7 @@ Without an explicit date, they will get the current date and make the
 build unreproducible
 
 Upstream-Status: Backport [debian]
+
 ---
  ext/bigdecimal/bigdecimal.gemspec | 1 +
  ext/fiddle/fiddle.gemspec         | 1 +
@@ -16,12 +17,12 @@ Upstream-Status: Backport [debian]
  5 files changed, 5 insertions(+)
 
 diff --git a/ext/bigdecimal/bigdecimal.gemspec b/ext/bigdecimal/bigdecimal.gemspec
-index f9f3b45..b9a469d 100644
+index d215757..5148d56 100644
 --- a/ext/bigdecimal/bigdecimal.gemspec
 +++ b/ext/bigdecimal/bigdecimal.gemspec
-@@ -14,6 +14,7 @@ Gem::Specification.new do |s|
-   s.name          = name
-   s.version       = source_version
+@@ -4,6 +4,7 @@ Gem::Specification.new do |s|
+   s.name          = "bigdecimal"
+   s.version       = "3.1.3"
    s.authors       = ["Kenta Murata", "Zachary Scott", "Shigeo Kobayashi"]
 +  s.date          = RUBY_RELEASE_DATE
    s.email         = ["mrkn@mrkn.jp"]
@@ -40,10 +41,10 @@ index 8781093..efdca32 100644
    spec.email         = ["aaron@tenderlovemaking.com", "hsbt@ruby-lang.org"]
  
 diff --git a/ext/io/console/io-console.gemspec b/ext/io/console/io-console.gemspec
-index d4f5276..8f89611 100644
+index d26a757..cc88c55 100644
 --- a/ext/io/console/io-console.gemspec
 +++ b/ext/io/console/io-console.gemspec
-@@ -4,6 +4,7 @@ _VERSION = "0.7.1"
+@@ -4,6 +4,7 @@ _VERSION = "0.6.0"
  Gem::Specification.new do |s|
    s.name = "io-console"
    s.version = _VERSION
@@ -64,7 +65,7 @@ index 1f4798e..48743cf 100644
    spec.email         = ["knu@idaemons.org", "ume@mahoroba.org"]
  
 diff --git a/lib/rdoc/rdoc.gemspec b/lib/rdoc/rdoc.gemspec
-index 93a281c..cc5c155 100644
+index 3c96f7d..fec0872 100644
 --- a/lib/rdoc/rdoc.gemspec
 +++ b/lib/rdoc/rdoc.gemspec
 @@ -7,6 +7,7 @@ end
@@ -75,6 +76,3 @@ index 93a281c..cc5c155 100644
    s.version = RDoc::VERSION
  
    s.authors = [
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
new file mode 100644
index 0000000000..0b1eb23801
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
@@ -0,0 +1,55 @@
+From 2ebb50d2dc302917a6f57c1239dc9e700dfe0e34 Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 27 Jul 2023 15:53:01 +0800
+Subject: [PATCH] Fix quadratic backtracking on invalid relative URI
+
+https://hackerone.com/reports/1958260
+
+CVE: CVE-2023-36617
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/9010ee2536adda10a0555ae1ed6fe2f5808e6bf1]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/uri/rfc2396_parser.rb |  4 ++--
+ test/uri/test_parser.rb   | 12 ++++++++++++
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/lib/uri/rfc2396_parser.rb b/lib/uri/rfc2396_parser.rb
+index 76a8f99..00c66cf 100644
+--- a/lib/uri/rfc2396_parser.rb
++++ b/lib/uri/rfc2396_parser.rb
+@@ -497,8 +497,8 @@ module URI
+       ret = {}
+
+       # for URI::split
+-      ret[:ABS_URI] = Regexp.new('\A\s*' + pattern[:X_ABS_URI] + '\s*\z', Regexp::EXTENDED)
+-      ret[:REL_URI] = Regexp.new('\A\s*' + pattern[:X_REL_URI] + '\s*\z', Regexp::EXTENDED)
++      ret[:ABS_URI] = Regexp.new('\A\s*+' + pattern[:X_ABS_URI] + '\s*\z', Regexp::EXTENDED)
++      ret[:REL_URI] = Regexp.new('\A\s*+' + pattern[:X_REL_URI] + '\s*\z', Regexp::EXTENDED)
+
+       # for URI::extract
+       ret[:URI_REF]     = Regexp.new(pattern[:URI_REF])
+diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
+index 72fb590..721e05e 100644
+--- a/test/uri/test_parser.rb
++++ b/test/uri/test_parser.rb
+@@ -79,4 +79,16 @@ class URI::TestParser < Test::Unit::TestCase
+     assert_equal([nil, nil, "example.com", nil, nil, "", nil, nil, nil], URI.split("//example.com"))
+     assert_equal([nil, nil, "[0::0]", nil, nil, "", nil, nil, nil], URI.split("//[0::0]"))
+   end
++
++  def test_rfc2822_parse_relative_uri
++    pre = ->(length) {
++      " " * length + "\0"
++    }
++    parser = URI::RFC2396_Parser.new
++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |uri|
++      assert_raise(URI::InvalidURIError) do
++        parser.split(uri)
++      end
++    end
++  end
+ end
+--
+2.25.1
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
new file mode 100644
index 0000000000..0ee295210e
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
@@ -0,0 +1,51 @@
+From eea5868120509c245216c4b5c2d4b5db1c593d0e Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 27 Jul 2023 16:16:30 +0800
+Subject: [PATCH] Fix quadratic backtracking on invalid port number
+
+https://hackerone.com/reports/1958260
+
+CVE: CVE-2023-36617
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/9d7bcef1e6ad23c9c6e4932f297fb737888144c8]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/uri/rfc3986_parser.rb |  2 +-
+ test/uri/test_parser.rb   | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/lib/uri/rfc3986_parser.rb b/lib/uri/rfc3986_parser.rb
+index dd24a40..9b1663d 100644
+--- a/lib/uri/rfc3986_parser.rb
++++ b/lib/uri/rfc3986_parser.rb
+@@ -100,7 +100,7 @@ module URI
+         QUERY: /\A(?:%\h\h|[!$&-.0-;=@-Z_a-z~\/?])*\z/,
+         FRAGMENT: /\A(?:%\h\h|[!$&-.0-;=@-Z_a-z~\/?])*\z/,
+         OPAQUE: /\A(?:[^\/].*)?\z/,
+-        PORT: /\A[\x09\x0a\x0c\x0d ]*\d*[\x09\x0a\x0c\x0d ]*\z/,
++        PORT: /\A[\x09\x0a\x0c\x0d ]*+\d*[\x09\x0a\x0c\x0d ]*\z/,
+       }
+     end
+
+diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
+index 721e05e..cee0acb 100644
+--- a/test/uri/test_parser.rb
++++ b/test/uri/test_parser.rb
+@@ -91,4 +91,14 @@ class URI::TestParser < Test::Unit::TestCase
+       end
+     end
+   end
++
++  def test_rfc3986_port_check
++    pre = ->(length) {"\t" * length + "a"}
++    uri = URI.parse("http://my.example.com")
++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |port|
++      assert_raise(URI::InvalidComponentError) do
++        uri.port = port
++      end
++    end
++  end
+ end
+--
+2.25.1
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
new file mode 100644
index 0000000000..ab8e3f7c4c
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
@@ -0,0 +1,96 @@
+From da7a0c7553ef7250ca665a3fecdc01dbaacbb43d Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@...>
+Date: Mon, 15 Apr 2024 11:40:00 +0000
+Subject: [PATCH] Filter marshaled objets
+
+CVE: CVE-2024-27281
+Upstream-Status: Backport [https://github.com/ruby/rdoc/commit/da7a0c7553ef7250ca665a3fecdc01dbaacbb43d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/rdoc/store.rb | 45 ++++++++++++++++++++++++++-------------------
+ 1 file changed, 26 insertions(+), 19 deletions(-)
+
+diff --git a/lib/rdoc/store.rb b/lib/rdoc/store.rb
+index 9fc540d..5b663d7 100644
+--- a/lib/rdoc/store.rb
++++ b/lib/rdoc/store.rb
+@@ -556,9 +556,7 @@ class RDoc::Store
+   def load_cache
+     #orig_enc = @encoding
+
+-    File.open cache_path, 'rb' do |io|
+-      @cache = Marshal.load io
+-    end
++    @cache = marshal_load(cache_path)
+
+     load_enc = @cache[:encoding]
+
+@@ -615,9 +613,7 @@ class RDoc::Store
+   def load_class_data klass_name
+     file = class_file klass_name
+
+-    File.open file, 'rb' do |io|
+-      Marshal.load io
+-    end
++    marshal_load(file)
+   rescue Errno::ENOENT => e
+     error = MissingFileError.new(self, file, klass_name)
+     error.set_backtrace e.backtrace
+@@ -630,14 +626,10 @@ class RDoc::Store
+   def load_method klass_name, method_name
+     file = method_file klass_name, method_name
+
+-    File.open file, 'rb' do |io|
+-      obj = Marshal.load io
+-      obj.store = self
+-      obj.parent =
+-        find_class_or_module(klass_name) || load_class(klass_name) unless
+-          obj.parent
+-      obj
+-    end
++    obj = marshal_load(file)
++    obj.store = self
++    obj.parent ||= find_class_or_module(klass_name) || load_class(klass_name)
++    obj
+   rescue Errno::ENOENT => e
+     error = MissingFileError.new(self, file, klass_name + method_name)
+     error.set_backtrace e.backtrace
+@@ -650,11 +642,9 @@ class RDoc::Store
+   def load_page page_name
+     file = page_file page_name
+
+-    File.open file, 'rb' do |io|
+-      obj = Marshal.load io
+-      obj.store = self
+-      obj
+-    end
++    obj = marshal_load(file)
++    obj.store = self
++    obj
+   rescue Errno::ENOENT => e
+     error = MissingFileError.new(self, file, page_name)
+     error.set_backtrace e.backtrace
+@@ -976,4 +966,21 @@ class RDoc::Store
+     @unique_modules
+   end
+
++  private
++  def marshal_load(file)
++    File.open(file, 'rb') {|io| Marshal.load(io, MarshalFilter)}
++  end
++
++  MarshalFilter = proc do |obj|
++    case obj
++    when true, false, nil, Array, Class, Encoding, Hash, Integer, String, Symbol, RDoc::Text
++    else
++      unless obj.class.name.start_with("RDoc::")
++        raise TypeError, "not permitted class: #{obj.class.name}"
++      end
++    end
++    obj
++  end
++  private_constant :MarshalFilter
++
+ end
+--
+2.25.1
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
new file mode 100644
index 0000000000..0740ad81e9
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
@@ -0,0 +1,27 @@
+From 989a2355808a63fc45367785c82ffd46d18c900a Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 12 Apr 2024 15:01:47 +1000
+Subject: [PATCH] Fix Use-After-Free issue for Regexp
+
+Co-authored-by: Isaac Peka <7493006+isaac-peka@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/ruby/ruby/commit/989a2355808a63fc45367785c82ffd46d18c900a]
+CVE: CVE-2024-27282
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ regexec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/regexec.c b/regexec.c
+index 73694ab14a0b0a..140691ad42489f 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -3449,8 +3449,8 @@ match_at(regex_t* reg, const UChar* str, const UChar* end,
+     CASE(OP_MEMORY_END_PUSH_REC)  MOP_IN(OP_MEMORY_END_PUSH_REC);
+       GET_MEMNUM_INC(mem, p);
+       STACK_GET_MEM_START(mem, stkp); /* should be before push mem-end. */
+-      STACK_PUSH_MEM_END(mem, s);
+       mem_start_stk[mem] = GET_STACK_INDEX(stkp);
++      STACK_PUSH_MEM_END(mem, s);
+       MOP_OUT;
+       JUMP;
diff --git a/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
new file mode 100644
index 0000000000..1808a6384a
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
@@ -0,0 +1,35 @@
+From e74b57febec9bd806e29025e6eeb8091e7021d75 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 26 Jan 2020 11:27:40 -0800
+Subject: [PATCH] Filter out __has_include* compiler defines
+
+They are internal to compiler and this header is later on includes in C
+files, but newer gcc >= 10 complains about it.
+
+error in initial header file:
+| In file included from /tmp/20200124-86625-14hiju4.c:1:
+| /tmp/20200124-86625-11y6l6i.h:13849:9: error: "__has_include" cannot be used as a macro name
+| 13849 | #define __has_include __has_include
+|       |         ^~~~~~~~~~~~~
+| compilation terminated due to -Wfatal-errors.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ common.mk | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/common.mk b/common.mk
+index 664f750..3b8fbe6 100644
+--- a/common.mk
++++ b/common.mk
+@@ -238,6 +238,8 @@ $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).time: probes.h vm.$(OBJE
+	$(ECHO) building $(@F:.time=.h)
+	$(Q)$(MINIRUBY) $(tooldir)/mjit_tabs.rb "$(MJIT_TABS)" \
+		$(CPP) -DMJIT_HEADER $(MJIT_HEADER_FLAGS) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(srcdir)/vm.c $(CPPOUTFLAG)$(@F:.time=.h).new
++	$(Q)sed -i -e "/#define __has_include __has_include/d" $(@F:.time=.h).new
++	$(Q)sed -i -e "/#define __has_include_next __has_include_next/d" $(@F:.time=.h).new
+	$(Q) $(IFCHANGE) "--timestamp=$@" $(@F:.time=.h) $(@F:.time=.h).new
+
+ $(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).h: $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).time
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
similarity index 88%
rename from meta/recipes-devtools/ruby/ruby_3.3.5.bb
rename to meta/recipes-devtools/ruby/ruby_3.2.2.bb
index fb0d711765..508154dad5 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
@@ -10,7 +10,7 @@ LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
                     file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
                     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LEGAL;md5=81e6a4d81533b9263da4c3485a0ad883 \
+                    file://LEGAL;md5=bcd74b47bbaf2051c5e49811a5faa97a \
                     "
 
 DEPENDS = "zlib openssl libyaml gdbm readline libffi"
@@ -20,12 +20,21 @@ DEPENDS:append:class-nativesdk = " ruby-native"
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0001-extmk-fix-cross-compilation-of-external-gems.patch \
+           file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
+           file://remove_has_include_macros.patch \
            file://run-ptest \
+           file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
+           file://0002-template-Makefile.in-filter-out-f-prefix-map.patch \
            file://0003-rdoc-build-reproducible-documentation.patch \
            file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
+           file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch \
+           file://CVE-2023-36617_1.patch \
+           file://CVE-2023-36617_2.patch \
+           file://CVE-2024-27281.patch \
+           file://CVE-2024-27282.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
@@ -46,7 +55,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "3781a3504222c2f26cb4b9eb9c1a12dbf4944d366ce24a9ff8cf99ecbce75196"
+SRC_URI[sha256sum] = "96c57558871a6748de5bc9f274e93f4b5aad06cd8f37befa0e8d94e7b8a423bc"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.40.0


