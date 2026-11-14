Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5732.1794629888852860513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 20:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=I6WkNb6S;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild08.wrs.com, ip: 205.220.166.238, mailfrom: prvs=5778f421dc=sgavini@oak-lpgbuild08.wrs.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE4AVII1196756;
	Fri, 13 Nov 2026 20:17:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=4dB+IrFpF
	moQZKOZV9neB6Y+HgXF/ImDGfypXxI1t3c=; b=I6WkNb6Sjvi13pNN4z7561z9A
	PIKeiuVvD8Nx6Pce/UgH5UJ+OKvTI5yDO0BpuAXASGHrHdRQGAiKkmOk18h2RYzS
	l6J5wJnusoY8K6VFf8AfTdBzB4LOR/0eu1uVAxtdwD/TlbO+aLh+X7doZviNDCHF
	osmMSU/97uKVIyQsIrdW1vmgtDyMK8vsgXhr0mzhpxN8RYZ+ErfotmsNq2D0SXP2
	lo1cERTLKbMTJpCeAlTdvFRCrmuj6IpWkdIyc1ti8wz2g5x2wVkXO0qAcowQn/Tk
	L38i3GtSZyKW3z2KnoDniMcJfOW88ee+y6uP3DZlb9tIJTyyK8yhC/5B75gaw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hwxc5hyu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 20:17:54 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Fri, 13 Nov 2026 20:17:54 -0800
Received: from oak-lpgbuild08.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 13 Nov 2026 20:17:54 -0800
Received: by oak-lpgbuild08.wrs.com (Postfix, from userid 1762445539)
	id 1D68C41C04DA; Sat, 14 Nov 2026 04:17:54 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
        <mattware@cisco.com>, <esparlin@cisco.com>, <peter.marko@siemens.com>,
        <sumanth.gavini@windriver.com>, <randy.macleod@windriver.com>
Subject: [PATCH] rpm: 6.0.2 -> 6.1.0
Date: Sat, 14 Nov 2026 04:17:54 +0000
Message-ID: <20261114041754.311958-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxNiBTYWx0ZWRfXxf9ntLyyjEHk
 atpZRNGQs4bzlnXeG12RkOTGSLEGZFLeXtXwzENDoIQ5BJ81Ae/tNk1ef0npK2bJoAsWnn4QQDc
 L7fVAd9BS/skbU1yPxIXRKGTHGzNO+xQxGVBFtbv78wp7e8genj9+37F+mUiCHOk8z5BbWuKkYF
 FOVhl8BbFYCok28DloZ52ppHKZi9yE6/AOeVaWf28VGjoLD71GQ7BxxqXYWGVIy4KV3TGdJTc2R
 huZvN33O/6TywNmXOf3iGfoWs+fiPHKba0tFLE4ViaVCDj2TAMKIabgWOfr7WqqQWjCmeZyZhQ7
 WYGP6mJud3j30YV8t6PgaaiUeDGM+m9b86sXqI5vQR95GLmT3P7jQWMjXyni8JREWlII7o1WTF9
 fVVRzmHJ1tb2VjiFgt1cr9oZ+UAop2MPlc/BzW/JWEJremTWysYIK19LyxEDtRDawDRZAYsbcSy
 XOzIf2RZ6XvkC4hi7eQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxNiBTYWx0ZWRfX26TZDyQ1UY4G
 gbSFfirD7lIhrQYM6BjAIJlyhMUh5fqpI1e2mzjbuE6N0JO3qPfFc7Odu23NLuPjfyp+qAg8UPF
 0CCG4mSvRJgY8b/j+4udq64i45Etch2EmE5fXMEvbeNQH42juhUw
X-Authority-Analysis: v=2.4 cv=GNCdgeNK c=1 sm=1 tr=0 ts=6af7e0f2 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=GMGn13PZAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=BHHHHgmu6tJ8bl5pj_AA:9 a=jIF0orF5dxDFSsn8Ms5I:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DUL-J4cM2tjME3oTIJCT2IXFasIubTHm
X-Proofpoint-ORIG-GUID: DUL-J4cM2tjME3oTIJCT2IXFasIubTHm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1011 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 04:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250193
Content-Type: text/plain; charset="utf-8"

* Switch SRC_URI to the rpm-6.1.x branch.
* COPYING checksum changed, upstream added an SPDX clarification.
  The license is unchanged.
* rpm-setup-autosign moved from ${libdir}/rpm to ${bindir}, add it to
  rpm-build. rpmuncompress moved too and stays in the rpm package.
* Refresh 0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch,
  it applied with fuzz 2 after upstream added the WITH_WEBSITE option.
  The other patches apply cleanly.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...ardcode-lib-rpm-as-the-installation-path-for.patch | 11 ++++++++---
 .../rpm/{rpm_6.0.2.bb => rpm_6.1.0.bb}                |  7 ++++---
 2 files changed, 12 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/rpm/{rpm_6.0.2.bb => rpm_6.1.0.bb} (97%)

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
diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtools/rpm/rpm_6.1.0.bb
similarity index 97%
rename from meta/recipes-devtools/rpm/rpm_6.0.2.bb
rename to meta/recipes-devtools/rpm/rpm_6.1.0.bb
index c27f58a0e8..b4c27bdd5b 100644
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
@@ -43,7 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;protocol=https;branch=rp
            "
 
 PE = "1"
-SRCREV = "a7f89afb57a98f6419d0eff35ca792198293b682"
+SRCREV = "f832c7e69945248dd5bcfcacfd10c176ee300fa2"
 
 DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd scdoc-native"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
@@ -183,6 +183,7 @@ FILES:${PN}-build = "\
     ${libdir}/rpm/mkinstalldirs \
     ${libdir}/rpm/macros.p* \
     ${libdir}/rpm/fileattrs/* \
+    ${bindir}/rpm-setup-autosign \
     ${libdir}/rpm/rpm-setup-autosign \
 "
 
