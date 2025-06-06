Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92221C61DB2
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 06:44:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.27913.1749192252411341336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 23:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=825255177f=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5564VQZo004165
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 23:44:12 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rw2kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 23:44:11 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 23:44:11 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 23:44:09 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] elfutils: Upgrade 0.192 -> 0.193
Date: Fri, 6 Jun 2025 12:14:03 +0530
Message-ID: <20250606064403.1099116-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA2MSBTYWx0ZWRfXw8WBmJL7Q4M6 dhshvZqH+VX2aXH/bWwq2Ib8bdyS2vAHJ2N/xltFRjDNQV40HaJ4DtShtB+KrCFO3L/T4qGdfQf 8Ehuo2f7I6ETOw7XQJi2YhGsZbSjIs8SgqDjWasxuPFvWweFo/jB+5J+vGdmcsocgnw23v3VuID
 JMr3o02mXFMzoMqiLsOokKr46THKVJep88DjhQAJQ/N0fzQAFo9MN9UnBb+99jIjeqfOj590Xw9 Mqnd7j7AZDLOXWJwdfzHfR4R1pKjg0gOps+F/2D7SIeKQ0j4CaUijEuT/ewgH8TsBH5bukhmdnF Ps3RzwuCGYTT5a2AFy7N9xfpuUYiSCfgDDwr8PGu91/tXubZ2ZiHysRFXaE2yJyQcRnXL9qZS2U
 Qu7LxIQY7ZTh0Bj7r5WUbt7vvIQVbzWLynOvE9ggTzR4hIRJ/cAFoGi03Z5uDUDTWlYkjthU
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=68428e3b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=xbHkyDv1lGT6jhT2oyIA:9 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kdjJ2JHoIifIk_rZ1mx5INIDDnI9JX1M
X-Proofpoint-ORIG-GUID: kdjJ2JHoIifIk_rZ1mx5INIDDnI9JX1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 06:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218097

From: Soumya Sambu <soumya.sambu@windriver.com>

Refreshed patches:
0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch
ptest.patch

Changelog:
Version 0.193 "Bugs erased, stacks traced"

debuginfod: Add CORS (webapp access) support to webapi and --cors option.

            Add --listen-address option for binding the HTTP listen socket
            to a specific IPv4 or IPv6 address.

            debuginfod client now caches x-debuginfod-* HTTP headers
            alongside downloaded files.

libdw: Add dwarf_language and dwarf_language_lower_bound functions.

       Improved support for DWARF6 language metadata as well as DWARF
       language constants for Nim, Dylan, Algol68, V and Mojo.

       dwarf_srclang is now forward-compatible with DWARF6 language
       constants.

libdwfl_stacktrace: Experimental new library interface for unwinding
                    stack samples into call chains, and tracking and
                    caching Elf data for multiple processes, building
                    on libdwfl.  Initially supports perf_events stack
                    sample data.

libelf: elf_scnshndx has been rewritten to be more robust, particularily
        for ELF files with more than 64K sections.

readelf: Improved handling of corrupt ELF data.

         --section-headers output now includes a "Key to Flags" explaining
         section flag meanings.

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../elfutils/{elfutils_0.192.bb => elfutils_0.193.bb}  |  2 +-
 ...-Add-libeu-objects-to-libelf.a-static-archive.patch |  8 ++++----
 meta/recipes-devtools/elfutils/files/ptest.patch       | 10 +++++-----
 3 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.192.bb => elfutils_0.193.bb} (98%)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
similarity index 98%
rename from meta/recipes-devtools/elfutils/elfutils_0.192.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.193.bb
index f96e7c8ef0..4ccea2bea3 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
@@ -24,7 +24,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] = "616099beae24aba11f9b63d86ca6cc8d566d968b802391334c91df54eab416b4"
+SRC_URI[sha256sum] = "7857f44b624f4d8d421df851aaae7b1402cfe6bcdd2d8049f15fc07d3dde7635"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch
index 1587087896..81c5255447 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch
@@ -20,12 +20,12 @@ Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h
  1 file changed, 3 insertions(+)
 
 diff --git a/libelf/Makefile.am b/libelf/Makefile.am
-index 3402863e..2d3dbdf2 100644
+index 05484c1..72f1e22 100644
 --- a/libelf/Makefile.am
 +++ b/libelf/Makefile.am
-@@ -122,6 +122,9 @@ libelf.so: $(srcdir)/libelf.map $(libelf_so_LIBS) $(libelf_so_DEPS)
- 	@$(textrel_check)
- 	$(AM_V_at)ln -fs $@ $@.$(VERSION)
+@@ -125,6 +125,9 @@ libelf.so: $(srcdir)/libelf.map $(libelf_so_LIBS) $(libelf_so_DEPS)
+ libeu_objects = $(shell cat ../lib/libeu.manifest)
+ libelf_a_LIBADD = $(addprefix ../lib/,$(libeu_objects))
  
 +libeu_objects = $(shell $(AR) t ../lib/libeu.a)
 +libelf_a_LIBADD = $(addprefix ../lib/,$(libeu_objects))
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipes-devtools/elfutils/files/ptest.patch
index 1de82ef32b..6b83fa4662 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -21,11 +21,11 @@ Upstream-Status: Inappropriate [oe specific]
  3 files changed, 3 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index f191488..426a68f 100644
+index 0670e01..14f3e36 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -49,7 +49,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2024 The elfutils developers.])
- AC_PREREQ(2.63)			dnl Minimum Autoconf version required.
+@@ -43,7 +43,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2025 The elfutils developers.])
+ AC_PREREQ(2.69)			dnl Minimum Autoconf version required.
  
  dnl We use GNU make extensions; automake 1.10 defaults to -Wportability.
 -AM_INIT_AUTOMAKE([gnits 1.11 -Wno-portability dist-bzip2 no-dist-gzip parallel-tests])
@@ -34,10 +34,10 @@ index f191488..426a68f 100644
  
  AM_SILENT_RULES([yes])
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 865a604..eed9bd4 100644
+index 00ba754..6be7dd6 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -893,3 +893,5 @@ check: check-am coverage
+@@ -937,3 +937,5 @@ check: check-am coverage
  coverage:
  	-$(srcdir)/coverage.sh
  endif
-- 
2.40.0


