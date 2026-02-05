Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC8BE91296
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 08:51:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16636.1770281482240248450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 00:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bLg6LZy3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6496c1e885=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6157iQNK2218261
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Feb 2026 00:51:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=XsLKjC8Slwt/5RsRiuhE
	+GxjX1VtNRUybjupaFkngM0=; b=bLg6LZy3Ldf8Ore1YT/hXxBh1+md00VBI+mA
	9PmSV9c1/goRFKZs/onjxjGz2vnydFXgrAetX0wHnWyj0LZtXllhkzv9Z7f0AH9O
	wYDlwFXSl/GsvjXK1gx6MrFaVdwXiWG8R3xAYoGoDFSpQQb9d/Rp11WEsH4bVTN3
	jKfV3uvqk/VmIFbi6l50YC8fi6qstGPWt4fjfPziI0gQ9w9f68FxJ+k7LzOy2xVP
	LO1YHzJoFD6hAK9QFEHJPj46IyzKcxp1ozHTztOEcZJQ57h83TKRSSLM10yGqpUo
	+2LNFf4RPpYRw9tLZE1GLpJMj4F2s6MHiZH4MyoIxjbGkulhIQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c4jhd09aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 00:51:21 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 5 Feb 2026 00:51:21 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 5 Feb 2026 00:51:20 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] lttng-tools: Upgrade 2.14.0 -> 2.14.1
Date: Thu, 5 Feb 2026 16:51:19 +0800
Message-ID: <20260205085119.1794164-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2MyBTYWx0ZWRfXypTNhWJwlwNE
 U1IgTsgf4N4GZcf1EbQvpAZb7kzXP1a7BtFwP5ltMMj1GJBzBehkve8ciopKZ1asVrj+JR7dBg2
 h8dGcaWdrZTmtD/p2YeKbvfu7Vmcp0QYyd0JWaM+goyJLz8LtSfCWnLVjwb8tyca/RNym9fTr/H
 RWmjWWxFKk3Z9kjjsvM4/A9+oR+sGptOd7QVWkWEf5/aen9SH/D0CtQ2yoGQjmwipH3ejqG2D3m
 Fnk9j8s6YhF/Px8dWIAMnYYkrmNVCvvOr4qxh3xkQTuJulKWFUYradRkiWia+tSJHl23E9Hs4X2
 jj+QukPCsa4+lREk4SHqp1ONYlW2eNB8M0WEdQxEBt9RiEJx9qMVfbYZ3w4iFpNn3my4WRWN9Cg
 O6XCKiXYFIcXr9hqcaWt5fzgZCfavJOBn/mcdFZh8ql415kOBNkdqbki1m/g47A1g1BjZcJPmbV
 bCWPtwsUB5JtZzJlBUg==
X-Proofpoint-ORIG-GUID: X8riGK5q9ccZuMY_Qg6O3UD1VpWCpUQB
X-Authority-Analysis: v=2.4 cv=CdgFJbrl c=1 sm=1 tr=0 ts=69845a09 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=a5LkSv8FAAAA:8
 a=t7CeM3EgAAAA:8 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=FZm2v3UJgyx-_mvfrG8A:9
 a=HqxKs9YlP0manpUS:21 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: X8riGK5q9ccZuMY_Qg6O3UD1VpWCpUQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 08:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230567

From: Mingli Yu <mingli.yu@windriver.com>

Remove 0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch
as the logic is included in 2.14.1 [1].

Remove 0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch as
the logic is included in 2.14.1 [2].

Remove 0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch
as the logic is included in 2.14.1 [3].

util_event_generator.sh is renamed to util_event_generator.py [4] and
the .py install logic in included as below.
  find "${B}/tests/$d" -maxdepth 1 -type f -name "*.py" \
            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} +

 # ./run-ptest
 [snip]
 PASS: test_ust_data 8 - Validate UST event
 PASS: test_ust_data 9 - Create UST context
 PASS: test_ust_data 10 - Validate UST context
 PASS: test_ust_data 11 - Validate string length
 PASS: test_ust_data 12 - Create UST exclusion
 PASS: test_ust_data 13 - Create UST event with identical exclusion names fails
 PASS: test_ust_data 14 - Create UST exclusion
 PASS: test_ust_data 15 - Create UST event with different exclusion names
 PASS: test_ust_data 16 - Validate UST event and exclusion
 ============================================================================
 Testsuite summary for lttng-tools 2.14.1
 ============================================================================
 # TOTAL: 1089
 # PASS:  1089
 # SKIP:  0
 # XFAIL: 0
 # FAIL:  0
 # XPASS: 0
 # ERROR: 0

[1] https://github.com/lttng/lttng-tools/commit/409ea456e181a769fc7e4b0a44823be0bdc8b9ce
[2] https://github.com/lttng/lttng-tools/commit/e58aac43fc498e48eb0bfb871dd5b50e54a5e93e
[3] https://github.com/lttng/lttng-tools/commit/e7eaad663489f8a12568f8ca84429b6ed64dc8c5
[4] https://github.com/lttng/lttng-tools/commit/7126bceecea9ed5d981863400ee7c4ba13042871

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...Remove-the-scope-resolution-operator.patch | 41 ------------------
 ...onstructor-change-rpath-to-libdir-li.patch | 43 -------------------
 ...p-index-allocator-symbols-from-versi.patch | 43 -------------------
 ...-tools_2.14.0.bb => lttng-tools_2.14.1.bb} |  6 +--
 4 files changed, 1 insertion(+), 132 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.14.0.bb => lttng-tools_2.14.1.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch
deleted file mode 100644
index 02bd1d1db0..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From da83d31a8dd555c28eb27bd7a7d3c53b51d5f276 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Sun, 20 Jul 2025 16:37:57 +0800
-Subject: [PATCH] eventfd.cpp: Remove the scope resolution operator
-
-Remove the scope resolution operator :: to fix the below build failure
-with musl.
- | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
- |    18 |                 int flags = ::EFD_CLOEXEC;
- |       |                               ^~~~~~~~~~~
- | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
- |    21 |                         flags |= ::EFD_SEMAPHORE;
- |       |                                    ^~~~~~~~~~~~~
-
-Upstream-Status: Pending [The message to lttng-dev awaits moderator approval]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/common/eventfd.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/common/eventfd.cpp b/src/common/eventfd.cpp
-index fe5b549..3379b0b 100644
---- a/src/common/eventfd.cpp
-+++ b/src/common/eventfd.cpp
-@@ -15,10 +15,10 @@
- 
- lttng::eventfd::eventfd(bool use_semaphore_semantics, std::uint64_t initial_value) :
- 	file_descriptor([use_semaphore_semantics, initial_value]() {
--		int flags = ::EFD_CLOEXEC;
-+		int flags = EFD_CLOEXEC;
- 
- 		if (use_semaphore_semantics) {
--			flags |= ::EFD_SEMAPHORE;
-+			flags |= EFD_SEMAPHORE;
- 		}
- 
- 		const auto raw_fd = ::eventfd(initial_value, flags);
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch
deleted file mode 100644
index 562381b5fd..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 673e8ef4763ea9a9c67248e6a1a7eadfc4bc278d Mon Sep 17 00:00:00 2001
-From: Liu Yiding <liuyd.fnst@fujitsu.com>
-Date: Thu, 3 Jul 2025 19:00:25 +0800
-Subject: [PATCH] gen-ust-events-constructor: change rpath to $libdir like
- others do
-
-set rpath to abs_builddir will cause issue like:
-ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: File /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-events-c-constructor-so in package lttng-tools-ptest contains reference to TMPDIR [buildpaths]
-ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: File /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-events-constructor-so in package lttng-tools-ptest contains reference to TMPDIR [buildpaths]
-
-userspace-probe-elf-binary and userspace-probe-sdt-binary set rpath to libdir
- |$ grep -nr "rpath" */Makefile.am
- |gen-ust-events-constructor/Makefile.am:29:                         -rpath $(abs_builddir)
- |userspace-probe-elf-binary/Makefile.am:8:libfoo_la_LDFLAGS = -shared -module -avoid-version -rpath $(libdir)
- |userspace-probe-sdt-binary/Makefile.am:25:libfoo_la_LDFLAGS = -module -shared -avoid-version -rpath $(libdir)
- |userspace-probe-sdt-binary/Makefile.am:31:libbar_la_LDFLAGS = -module -shared -avoid-version -rpath $(libdir)
- |userspace-probe-sdt-binary/Makefile.am:37:libzzz_la_LDFLAGS = -module -shared -avoid-version -rpath $(libdir)
-
-Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
-
-Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/171]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tests/utils/testapp/gen-ust-events-constructor/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/utils/testapp/gen-ust-events-constructor/Makefile.am b/tests/utils/testapp/gen-ust-events-constructor/Makefile.am
-index 6c09cf585..3eb26fba2 100644
---- a/tests/utils/testapp/gen-ust-events-constructor/Makefile.am
-+++ b/tests/utils/testapp/gen-ust-events-constructor/Makefile.am
-@@ -26,7 +26,7 @@ else
- # Force the shared flag on the noinst libraries since they are
- # only built static by default
- FORCE_SHARED_LIB_OPTIONS = -module -shared -avoid-version \
--			   -rpath $(abs_builddir)
-+			   -rpath $(libdir)
- 
- noinst_LTLIBRARIES += libtp-so-provider.la libtp-so-define.la \
- 	libtp-so_c-provider.la libtp-so_c-define.la
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch
deleted file mode 100644
index 3a535470da..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From adafa15a0ea145e1e98f68e2a56512e83f1f6798 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 19 Aug 2025 20:06:21 -0700
-Subject: [PATCH] liblttng-ctl: drop index allocator symbols from version
- script
-
-The lttng_index_allocator_* functions are implemented in libcommon-gpl,
-not in liblttng-ctl. Since liblttng-ctl does not link against
-libcommon-gpl and does not export these symbols, referencing them in
-liblttng-ctl.sym causes link failures with LLD:
-
-  ld.lld: error: version script assignment of 'global' to symbol
-  'lttng_index_allocator_alloc' failed: symbol not defined
-  ...
-
-Remove these entries from the version script to align the exported ABI
-with the actual symbols provided by liblttng-ctl.
-
-This fixes builds with clang + lld.
-
-Upstream-Status: Submitted [https://review.lttng.org/c/lttng-tools/+/15156]
-Change-Id: I27f40f3d38af7014cf5356230e06aa291c9a3c5f
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/lttng-ctl/liblttng-ctl.sym | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/src/lib/lttng-ctl/liblttng-ctl.sym b/src/lib/lttng-ctl/liblttng-ctl.sym
-index 27900ca44..641084750 100644
---- a/src/lib/lttng-ctl/liblttng-ctl.sym
-+++ b/src/lib/lttng-ctl/liblttng-ctl.sym
-@@ -336,11 +336,6 @@ lttng_health_state
- lttng_health_thread_name
- lttng_health_thread_state
- lttng_ht_seed
--lttng_index_allocator_alloc
--lttng_index_allocator_create
--lttng_index_allocator_destroy
--lttng_index_allocator_get_index_count
--lttng_index_allocator_release
- lttng_kernel_probe_location_address_create
- lttng_kernel_probe_location_address_get_address
- lttng_kernel_probe_location_destroy
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
index 7ab99cf2c6..46bf59c271 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
@@ -49,14 +49,11 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://run-ptest \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
-           file://0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch \
-           file://0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch \
            file://disable-tests2.patch \
-           file://0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch \
            file://libc++.patch \
            "
 
-SRC_URI[sha256sum] = "d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3"
+SRC_URI[sha256sum] = "0e68eb27923621c4bc127cfce40422d28cf7e473fedf6229ae6c32ba5c5b7c6d"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -93,7 +90,6 @@ do_install_ptest () {
     for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/*.lttng \
             tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh \
             tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh \
-            tests/regression/tools/notification/util_event_generator.sh \
             tests/regression/tools/trace-format/ust-local-trace-pretty.expect \
             tests/regression/tools/trace-format/kernel-local-trace-pretty.expect \
             tests/regression/tools/base-path/*.lttng; do
-- 
2.34.1


