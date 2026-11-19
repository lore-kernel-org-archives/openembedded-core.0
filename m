Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15188.1795096896177871276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 06:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rtMSP8gX;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild08.wrs.com, ip: 205.220.178.238, mailfrom: prvs=5783a441a1=sgavini@oak-lpgbuild08.wrs.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBiltR1856706;
	Thu, 19 Nov 2026 14:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=J/KMvEhmuW/dnAmBCVCFFPedj/mYijPGyfvQM/2gCG4=; b=
	rtMSP8gXXXy1YWEdMt1M/Cx0tuLu2IQEkdn73PjNtsU+UCkslg8l9dC9E1UZvXWL
	mcLxt/DwH1ncvt2nkEwq0L3JG/4q/gDlQuzn0o1/DjXZZta/zj1DlO6PV3yQJpfR
	jsdbskLRFxYwKuPI7+F4jq0qj3uw1597NMLpX64Zq7s5nwiNiuKgiGpikHbZaeCK
	wgfaL05rKcM549+ee8afgdTinUlYN0uMghJyMVcccu2n3hwPtOi6SI2FelTOx3WB
	R+TVLWo8RW2jiuXSHqTzCA0kSGFLjyAPDHI8WjYIeSr+4xAdwL/uRTqgfY2PhkOF
	dpQQVDi8XmrVQyFq9uj1nA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvke556-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 14:01:24 +0000 (GMT)
Received: from ala-p2exch02.corp.ad.wrs.com (10.11.226.102) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Thu, 19 Nov 2026 06:01:23 -0800
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch02.corp.ad.wrs.com (10.11.226.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 19 Nov 2026 06:01:22 -0800
Received: from oak-lpgbuild08.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 19 Nov 2026 06:01:22 -0800
Received: by oak-lpgbuild08.wrs.com (Postfix, from userid 1762445539)
	id 2A4F641C08E4; Thu, 19 Nov 2026 14:01:22 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: <sumanth.gavini@windriver.com>
CC: <Peter.Marko@siemens.com>, <Randy.MacLeod@windriver.com>,
        <alex.kanavin@gmail.com>, <esparlin@cisco.com>,
        <mathieu.dubois-briand@bootlin.com>, <mattware@cisco.com>,
        <openembedded-core@lists.openembedded.org>,
        <patchtest@automation.yoctoproject.org>
Subject: [PATCH v3] rpm: 6.0.2 -> 6.1.0
Date: Thu, 19 Nov 2026 14:01:22 +0000
Message-ID: <20261119140122.4072304-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <93e45ea7-db55-4839-aca6-4e7ddbfd86cc@windriver.com>
References: <93e45ea7-db55-4839-aca6-4e7ddbfd86cc@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1NSBTYWx0ZWRfX6lVpU0OvR98U
 kp/Rkk8DeNCAVQjUOGnWdmZCThn0uDNgSRVe0U3q1C+YnppvSDNntwjFFyRKR7gCMUTEh0AL1JS
 BMTWKLuyNPqfGIer+TthOZNgJsZhyz9eVvuf5W+Bj1LgSxSdWeft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1NSBTYWx0ZWRfX6Gs/Irgqjv3a
 bxM72nyXrxsqXfFJm9zfOtQssP4r1/nhBYlTj1rhRySLGKyPXDsZaDBzV+gbVlNVT1q8lOnxUZF
 4hEMoDdgicJjoQfE1lknSwXRA/nMmXlJQTk4F/qxWh8vf+wZ396NO89FsupKt+wJqIB/qrE+bkh
 isF4mb2z0/KgRAszJsl/RY0Hz6Q3y+H0zIvCZksWX2D+9oalBPXrN4Mjsa84hcOsPMt1JvqRhKK
 S3bs6ouriCGsoxx2kFPrajQoOYiEUHjbatWIImA+33AB3R7b0Qv+TmGX1Ml4ctT4/bXn/f18Ysb
 9//XId2p1zMIRR3/a735FNgQm9VxpxxkydXigX1UYvEVPetw2V72l12RCM8udrq1AF743f2Mri8
 GQWSw2XAgsg7sXn0JoyKR/XwN+I3kvZNMMlAqJzYRBnjcn3/da22QBoIA03eBx9BR6QQaSaXDyT
 c0FyFiUCVXpWG9X545A==
X-Authority-Analysis: v=2.4 cv=OdYNnRTY c=1 sm=1 tr=0 ts=6aff0134 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=GMGn13PZAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=TADP97vfDOVKtqQzGOwA:9 a=jIF0orF5dxDFSsn8Ms5I:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: iHIBgcLJ0Az6AGJ38_sqiXoCTEdPmRhP
X-Proofpoint-GUID: iHIBgcLJ0Az6AGJ38_sqiXoCTEdPmRhP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 14:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250671
Content-Type: text/plain; charset="utf-8"

* Switch SRC_URI to the rpm-6.1.x branch.
* COPYING checksum changed, upstream added an SPDX clarification.
  The license is unchanged.
* rpm-setup-autosign moved from ${libdir}/rpm to ${bindir}, add it to
  rpm-build. rpmuncompress moved too and stays in the rpm package.
* Refresh 0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch,
  it applied with fuzz 2 after upstream added the WITH_WEBSITE option.
  The other patches apply cleanly.
* Add 0001-lib-headerfmt.cc-Remove-format-module.patch, 6.1.0 uses
  std::format() in lib/headerfmt.cc and there is no <format> before
  gcc 13, so the build fails on hosts such as Debian 12 (gcc 12.2).
  Same workaround as for tools/elfdeps.cc.

License-Update: COPYING now has an SPDX clarification note, license unchanged

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
* v3: add 0001-lib-headerfmt.cc-Remove-format-module.patch, <format> is
      not available before gcc 13 (Debian 12 autobuilder failure).

* v2: add License-Update tag to the commit message for the COPYING
      checksum change (patchtest). No other changes.
 ...lib-rpm-as-the-installation-path-for.patch | 11 +++--
 ...ib-headerfmt.cc-Remove-format-module.patch | 42 +++++++++++++++++++
 .../rpm/{rpm_6.0.2.bb => rpm_6.1.0.bb}        |  8 ++--
 3 files changed, 55 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-lib-headerfmt.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_6.0.2.bb => rpm_6.1.0.bb} (96%)

diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index 309320cf43..ecb222592c 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -11,6 +11,10 @@ Updated for rpm 6.0.2:
 Remove the changes for macros.in since it doesn't work for rpmbuild, rpmbuild
 is like cross build, will define the values in package_rpm.bbclass.
 
+Refreshed for rpm 6.1.0:
+Update the context for the new WITH_WEBSITE option line, no functional
+change.
+
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
@@ -18,14 +22,15 @@ Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
  1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index de0b578a6..9a3aba071 100644
+index e2a1c5c0b..7e821b1ee 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -41,7 +41,7 @@ option(WITH_LIBELF "Build with libelf support" ON)
- option(WITH_LIBLZMA "Build with liblzma support" ON)
+@@ -41,7 +41,7 @@ option(WITH_LIBLZMA "Build with liblzma support" ON)
  option(WITH_DOXYGEN "Build API docs with doxygen" OFF)
+ option(WITH_WEBSITE "Build standalone website" OFF)
  
 -set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/lib/rpm" CACHE PATH "rpm home")
 +set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/rpm" CACHE PATH "rpm home")
  set(RPM_MACROSDIR "${RPM_CONFIGDIR}/macros.d")
  set(RPM_VENDOR "vendor" CACHE STRING "rpm vendor string")
+ 
diff --git a/meta/recipes-devtools/rpm/files/0001-lib-headerfmt.cc-Remove-format-module.patch b/meta/recipes-devtools/rpm/files/0001-lib-headerfmt.cc-Remove-format-module.patch
new file mode 100644
index 0000000000..895e305a9d
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-lib-headerfmt.cc-Remove-format-module.patch
@@ -0,0 +1,42 @@
+From b956b03412ff099c7bf2858ece95f856ebbb10f5 Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Thu, 19 Nov 2026 13:44:22 +0000
+Subject: [PATCH] lib/headerfmt.cc: Remove format module
+
+There is no <format> until gcc 13.1, so remove the format module to make it
+work on hosts such as Debian 12 (gcc 12.2) and Ubuntu 22.04. rpm 6.1.0 uses
+std::format() in formatValue() since upstream commit 18a4d495e ("Eliminate
+variable length array (VLA) use in headerFormat()"), same as
+tools/elfdeps.cc which is already handled by
+0001-tools-elfdeps.cc-Remove-format-module.patch.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ lib/headerfmt.cc | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/headerfmt.cc b/lib/headerfmt.cc
+index a188d052b..132cb02da 100644
+--- a/lib/headerfmt.cc
++++ b/lib/headerfmt.cc
+@@ -4,7 +4,6 @@
+ 
+ #include "system.h"
+ 
+-#include <format>
+ #include <string>
+ #include <unordered_map>
+ 
+@@ -741,7 +740,7 @@ static bool formatValue(headerSprintfArgs hsa, sprintfTag tag, int element)
+     /* Handle field width + justification formatting if specified */
+     if (tag->format && *tag->format) {
+ 	char *tval = NULL;
+-	const std::string fmtbuf = std::format("%{}s", tag->format);
++	const std::string fmtbuf = std::string("%") + tag->format + "s";
+ 
+ 	rasprintf(&tval, fmtbuf.c_str(), val);
+ 	free(val);
+-- 
+2.54.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtools/rpm/rpm_6.1.0.bb
similarity index 96%
rename from meta/recipes-devtools/rpm/rpm_6.0.2.bb
rename to meta/recipes-devtools/rpm/rpm_6.1.0.bb
index c27f58a0e8..e661c50b8c 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.1.0.bb
@@ -22,9 +22,9 @@ HOMEPAGE = "http://www.rpm.org"
 
 # libraries are also LGPL - how to express this?
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=066ecde17828e5c8911ec9eae8be78f4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=173bb5fcd0680812f4771daa00511604"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm;protocol=https;branch=rpm-6.0.x;tag=${BP}-release \
+SRC_URI = "git://github.com/rpm-software-management/rpm;protocol=https;branch=rpm-6.1.x;tag=${BP}-release \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
            file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
@@ -38,12 +38,13 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;protocol=https;branch=rp
            file://0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch \
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-tools-elfdeps.cc-Remove-format-module.patch \
+           file://0001-lib-headerfmt.cc-Remove-format-module.patch \
            file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
            file://0003-Do-not-install-the-pkgconfig-dependency-generator.patch \
            "
 
 PE = "1"
-SRCREV = "a7f89afb57a98f6419d0eff35ca792198293b682"
+SRCREV = "f832c7e69945248dd5bcfcacfd10c176ee300fa2"
 
 DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd scdoc-native"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
@@ -183,6 +184,7 @@ FILES:${PN}-build = "\
     ${libdir}/rpm/mkinstalldirs \
     ${libdir}/rpm/macros.p* \
     ${libdir}/rpm/fileattrs/* \
+    ${bindir}/rpm-setup-autosign \
     ${libdir}/rpm/rpm-setup-autosign \
 "
 
