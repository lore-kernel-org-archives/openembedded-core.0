Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9758375D50
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 06:31:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t686VTpY018841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jul 2015 23:31:29 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Jul 2015 23:31:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Jul 2015 23:31:26 -0700
Message-ID: <5391ed4f6bb8164b72b7548b52abf8e0cb004064.1436336498.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436336498.git.liezhi.yang@windriver.com>
References: <cover.1436336498.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] elfutils: 0.162 -> 0.163
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jul 2015 06:31:28 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
 .../0001-remove-the-unneed-checking.patch          |    0
 .../arm_backend.diff                               |    0
 .../arm_func_value.patch                           |    0
 .../arm_unwind_ret_mask.patch                      |    0
 .../fixheadercheck.patch                           |    0
 .../hppa_backend.diff                              |    0
 .../m68k_backend.diff                              |    0
 .../mips_backend.diff                              |    0
 .../mips_readelf_w.patch                           |    0
 .../non_linux.patch                                |    0
 .../redhat-portability.diff                        |    0
 .../scanf-format.patch                             |    0
 .../testsuite-ignore-elflint.diff                  |    0
 .../uclibc-support-for-elfutils-0.161.patch        |    0
 .../{elfutils_0.162.bb => elfutils_0.163.bb}       |    4 ++--
 16 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/0001-remove-the-unneed-checking.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/arm_func_value.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/arm_unwind_ret_mask.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/m68k_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/mips_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/mips_readelf_w.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/non_linux.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/redhat-portability.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/scanf-format.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/uclibc-support-for-elfutils-0.161.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.162.bb => elfutils_0.163.bb} (95%)

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.163/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/0001-remove-the-unneed-checking.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/0001-remove-the-unneed-checking.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/0001-remove-the-unneed-checking.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.163/0001-remove-the-unneed-checking.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.163/arm_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/arm_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.163/arm_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/arm_func_value.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/arm_func_value.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/arm_func_value.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.163/arm_func_value.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/arm_unwind_ret_mask.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/arm_unwind_ret_mask.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/arm_unwind_ret_mask.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.163/arm_unwind_ret_mask.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/fixheadercheck.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/fixheadercheck.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/fixheadercheck.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.163/fixheadercheck.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.163/hppa_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.163/hppa_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.163/m68k_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/m68k_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.163/m68k_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.163/mips_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/mips_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.163/mips_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/mips_readelf_w.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/mips_readelf_w.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.163/mips_readelf_w.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/non_linux.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/non_linux.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/non_linux.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.163/non_linux.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils-0.163/redhat-portability.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/redhat-portability.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.163/redhat-portability.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/scanf-format.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/scanf-format.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/scanf-format.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.163/scanf-format.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.163/testsuite-ignore-elflint.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/testsuite-ignore-elflint.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.163/testsuite-ignore-elflint.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/uclibc-support-for-elfutils-0.161.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.162/uclibc-support-for-elfutils-0.161.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.162.bb b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
similarity index 95%
rename from meta/recipes-devtools/elfutils/elfutils_0.162.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.163.bb
index f6ace7e..b34bfdd 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.162.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
@@ -7,8 +7,8 @@ DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "9334cbcc0df7669b7bf07cf7fc3ad52c"
-SRC_URI[sha256sum] = "526106bc6be898b3b3281a66b83d64993aa0ef1b55b0416766868ad53d0a1951"
+SRC_URI[md5sum] = "77ce87f259987d2e54e4d87b86cbee41"
+SRC_URI[sha256sum] = "7c774f1eef329309f3b05e730bdac50013155d437518a2ec0e24871d312f2e23"
 
 SRC_URI += "\
         file://mempcpy.patch \
-- 
1.7.9.5


