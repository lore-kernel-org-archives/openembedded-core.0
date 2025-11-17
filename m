Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9360CEBF92
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 06:37:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3846.1763361431836041614
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 22:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pmyttDc2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34165bd6f8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH3xCAr1234247
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 22:37:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=URxMAbYza6mfr5xW1otIIECr0Yglq8obQezURZUrN6Q=; b=pmyttDc2Va7+
	JVBy1x+IsCVhZLE1Sj36T78nkVoAb/Jr8mDn5brdkZaDmM+OeSUVI8QybopA+7ra
	oPBMrTsvqpYHbK5TgjXgAA7/YBw76eU8qWAM0lCeifwUxX7YEj0dn2qHgGFdrI7S
	+1SeliMPphcFcpTQ79UFkGtAC856XDtjY1qFNaVZIVEuTFJILwxoco+MRa/agyrJ
	5mUj1iJNKIxSrJG7atlzL12gKHVHN3bfeNeg9ZJe20UVmByh+huu+ulfuJLGNCCM
	WtLUna8CMYU0MXRlnmTRslNDXa+S3dtmz2KYuqd31fPj0Qqwe5SJi7xzHYGXzUWs
	DvfcWYOGOg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2sewm-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 22:37:11 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 22:37:10 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 22:37:10 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/4] fmt: 11.2.0 -> 12.1.0
Date: Sun, 16 Nov 2025 22:37:08 -0800
Message-ID: <f6c915e6b6a568911bb0187a083b34c0db978ef9.1763361341.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1763361341.git.liezhi.yang@windriver.com>
References: <cover.1763361341.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1NCBTYWx0ZWRfX0EsnCI9bRldD
 7ZMQUcvMN5J5nkzQ6Qjqfhr2YMjDBp9ymx4SQklMqXFX6TDC+xWDE3w5xZBXbMWKtKyNqDNGlwq
 CnWVJAPl/adBLq/EK1gypBZQpYndZYCHF2z8OmD74nhVf3aWYVt1ByVqhaV1Cg+x23w5eIiLMgI
 HX8idiyPlBxpAWx0HjM1VvO4jmCr5UM023USo4rdTh0YCjEpOo4EG4jpiMnWo8y/tjsqA6qujpF
 d1XrEhusOu7C+f0J7c/mro6PtEKgmAlDvUV/d8YiNMcQlqkOM6nM3wU6NNbB9RNJFaX3qWgUwI0
 C9rWfhf7Y9onSAlmaY+AIkF2kJNsfJALZUSilIjkIf2bB8oIX7mLvy2l4BYfDkF4Zk86vuvqSNy
 4X6ECpVbMt7g3KuKWQ6WLdcuK5/Ohg==
X-Proofpoint-ORIG-GUID: _ydu7GTV2MhZIDiiLwAMHXR7DZeARu1U
X-Proofpoint-GUID: _ydu7GTV2MhZIDiiLwAMHXR7DZeARu1U
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691ac297 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=XkUYdDwvAAAA:8
 a=t7CeM3EgAAAA:8 a=Q0gJwpOHAAAA:8 a=pGLkceISAAAA:8 a=VabnemYjAAAA:8
 a=4hHsc62lP50qUNF-YsYA:9 a=22Hr7QaVm-UqefIw97Vx:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=vB0bUEeMeeYkaD2_WZFM:22 a=gKebqoRLp9LExxC7YDUY:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=jd6J4Gguk5HxikPWLKER:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 06:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226482

From: Robert Yang <liezhi.yang@windriver.com>

* Remove backport patch 0001-Fix-compilation-on-cl
* Refresh 0001-Workaround-an-ABI-issue-in-spdlog.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...compilation-on-clang-21-libc-21-4477.patch | 46 -------------------
 ...01-Workaround-an-ABI-issue-in-spdlog.patch |  8 ++--
 .../fmt/{fmt_11.2.0.bb => fmt_12.1.0.bb}      |  5 +-
 3 files changed, 6 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch
 rename meta/recipes-devtools/fmt/{fmt_11.2.0.bb => fmt_12.1.0.bb} (84%)

diff --git a/meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch b/meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch
deleted file mode 100644
index 911fa90a40..0000000000
--- a/meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f4345467fce7edbc6b36c3fa1cf197a67be617e2 Mon Sep 17 00:00:00 2001
-From: Remy Jette <remy@remyjette.com>
-Date: Sat, 21 Jun 2025 07:28:14 -0700
-Subject: [PATCH] Fix compilation on clang-21 / libc++-21 (#4477)
-
-`<cstdlib>` was not being included, so malloc and free were only declared
-via transitive includes. Some includes changed in the latest libc++-21
-build which broke fmt.
-
-Also changed `malloc`/`free` to `std::malloc` and `std::free`, as
-putting those symbols in the global namespace is optional for the
-implementation when including `<cstdlib>`.
-
-Upstream-Status: Backport [https://github.com/fmtlib/fmt/pull/4477]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/fmt/format.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-Index: fmt-11.2.0/include/fmt/format.h
-===================================================================
---- fmt-11.2.0.orig/include/fmt/format.h
-+++ fmt-11.2.0/include/fmt/format.h
-@@ -44,6 +44,7 @@
- #  include <cmath>    // std::signbit
- #  include <cstddef>  // std::byte
- #  include <cstdint>  // uint32_t
-+#  include <cstdlib>  // std::malloc, std::free
- #  include <cstring>  // std::memcpy
- #  include <limits>   // std::numeric_limits
- #  include <new>      // std::bad_alloc
-@@ -744,12 +745,12 @@ template <typename T> struct allocator {
- 
-   T* allocate(size_t n) {
-     FMT_ASSERT(n <= max_value<size_t>() / sizeof(T), "");
--    T* p = static_cast<T*>(malloc(n * sizeof(T)));
-+    T* p = static_cast<T*>(std::malloc(n * sizeof(T)));
-     if (!p) FMT_THROW(std::bad_alloc());
-     return p;
-   }
- 
--  void deallocate(T* p, size_t) { free(p); }
-+  void deallocate(T* p, size_t) { std::free(p); }
- };
- 
- }  // namespace detail
diff --git a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
index 3fe85d51ee..442506f834 100644
--- a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
+++ b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
@@ -1,4 +1,4 @@
-From 5a5637c306c617ddb3726c76d3f7490a2dc0a5cd Mon Sep 17 00:00:00 2001
+From 32f4a4a634c99d4e00cc6149786a9180ad651f76 Mon Sep 17 00:00:00 2001
 From: Victor Zverovich <viz@meta.com>
 Date: Sat, 22 Mar 2025 06:57:04 -0700
 Subject: [PATCH] Workaround an ABI issue in spdlog
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/include/fmt/format.h b/include/fmt/format.h
-index 287e7163..61cb2825 100644
+index 4a653007..82f80efd 100644
 --- a/include/fmt/format.h
 +++ b/include/fmt/format.h
-@@ -774,7 +774,9 @@ enum { inline_buffer_size = 500 };
+@@ -793,7 +793,9 @@ enum { inline_buffer_size = 500 };
   * converted to `std::string` with `to_string(out)`.
   */
  template <typename T, size_t SIZE = inline_buffer_size,
@@ -24,7 +24,7 @@ index 287e7163..61cb2825 100644
  class basic_memory_buffer : public detail::buffer<T> {
   private:
    T store_[SIZE];
-@@ -2594,7 +2596,7 @@ class bigint {
+@@ -2746,7 +2748,7 @@ class bigint {
    }
  
   public:
diff --git a/meta/recipes-devtools/fmt/fmt_11.2.0.bb b/meta/recipes-devtools/fmt/fmt_12.1.0.bb
similarity index 84%
rename from meta/recipes-devtools/fmt/fmt_11.2.0.bb
rename to meta/recipes-devtools/fmt/fmt_12.1.0.bb
index 133e1ae77d..22cab6f138 100644
--- a/meta/recipes-devtools/fmt/fmt_11.2.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_12.1.0.bb
@@ -4,12 +4,11 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV}\
+SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV} \
            file://0001-Workaround-an-ABI-issue-in-spdlog.patch \
-           file://0001-Fix-compilation-on-clang-21-libc-21-4477.patch \
            file://run-ptest \
            "
-SRCREV = "40626af88bd7df9a5fb80be7b25ac85b122d6c21"
+SRCREV = "407c905e45ad75fc29bf0f9bb7c5c2fd3475976f"
 
 inherit cmake ptest
 
-- 
2.49.0


