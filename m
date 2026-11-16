Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20920.1794800266072779221
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 19:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FJm0G5A5;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild08.wrs.com, ip: 205.220.166.238, mailfrom: prvs=5780200f4a=sgavini@oak-lpgbuild08.wrs.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG3JoCP1849881;
	Sun, 15 Nov 2026 19:37:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=166p5rdDDqE2hkV72s+uqRdLaKdlvRawGGj1HhEIoD8=; b=
	FJm0G5A5VMYc5aFMR13VEESE+HobVozjqNunk5uOZ8TiNsfi9v8K9MuGSuvuAzU2
	5ZapTD1r2lC+znbhWl8BIt55u8t30wxGVXSMidQY/OEjIQIpS9hMkabkHQzWQTTT
	/mIBTxxSgVbXYmBQvNUvxtTK/M+Zk3ES8DCMrO1CKFF6U4b+/+ijXrjLVfZvzgeP
	E8ewHrTINHxsVry9En1jCc7XZh3bHa1NT/xQdA4mR8ttFjK4ft5egzYBCx8Kf6wC
	aN8odeyRxU/sRHcqPvxvEqyZ5dYTkSAiwVTTpjrSZKZEWQYXE+3CT32Rtgr0/44a
	kCPzKxX4jKZR7+EFvYSvNw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxr1h1qrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Nov 2026 19:37:33 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Sun, 15 Nov 2026 19:37:32 -0800
Received: from oak-lpgbuild08.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 15 Nov 2026 19:37:32 -0800
Received: by oak-lpgbuild08.wrs.com (Postfix, from userid 1762445539)
	id 2E32841C047E; Mon, 16 Nov 2026 03:37:32 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <patchtest@automation.yoctoproject.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
        <mattware@cisco.com>, <esparlin@cisco.com>, <peter.marko@siemens.com>,
        <sumanth.gavini@windriver.com>, <randy.macleod@windriver.com>
Subject: [PATCH v2] rpm: 6.0.2 -> 6.1.0
Date: Mon, 16 Nov 2026 03:37:32 +0000
Message-ID: <20261116033732.3106610-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <010101a1d852b11e-c16751df-e6a5-416d-91dd-1f30cdbab297-000000@us-west-2.amazonses.com>
References: <010101a1d852b11e-c16751df-e6a5-416d-91dd-1f30cdbab297-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfXw0/d99tjwfGw
 sLSDk7FZz7fG6azp7n0k5V/gQzampE8bXKRGuo5h2ln39OeCINDW1XM69SwoOWoi66TOckOURFw
 bDbN6AEondMQOlPngQF8XRw5DwnivDGIGScZo2zOU5N7PHCUmISl15Pa4AZiy0kCtiFKUQ5IZ9I
 yVG8HHisJ4Zp6ClIS/MRqCr9qxrp9wl307iecbyFCi7Eay+2rvhdagZ2Di6P4dpGJDTi37gCzAj
 auMktZc1ixYu6CQrGIU/frZDqnGKwZxKzH8g0pxy4wIaOrdDKE5DE/wkL7RQWh4nKXvoPJIGYoA
 SlD4CBtVoX4E9la56o4A0M0d8i4DwJVtwuyg/DFlI8zRMG4K/6AtF3dCPxMsby6i3RZ9N5buV8H
 LzQMiBX7h6pwcmC00KVSa80Ms2eOy1gGnA2MNepl0dow+6jvDWHRX0mpki5q3meozC4aEMI6Ig3
 JUQ0YfwY3AcR2j6KJIA==
X-Proofpoint-ORIG-GUID: MELf26JQeZCqoReY57dTR0KEelCE7Q99
X-Proofpoint-GUID: MELf26JQeZCqoReY57dTR0KEelCE7Q99
X-Authority-Analysis: v=2.4 cv=WcmZ+EhX c=1 sm=1 tr=0 ts=6afa7a7d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=GMGn13PZAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=BHHHHgmu6tJ8bl5pj_AA:9 a=jIF0orF5dxDFSsn8Ms5I:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX1UNbLOy/2ibR
 8XnqHns3JT7KX1VU5KcKaUBoM1qbw65vjADWJfTCv9xS7mXPmFibm2knJP9Lq1jGdfwKoe88LwA
 qTiA5ab4IZxAvlAicRfv5lYfKkWGzRm2UZx/VGlEj12iXNHSc3Fn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 03:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250304
Content-Type: text/plain; charset="utf-8"

* Switch SRC_URI to the rpm-6.1.x branch.
* COPYING checksum changed, upstream added an SPDX clarification.
  The license is unchanged.
* rpm-setup-autosign moved from ${libdir}/rpm to ${bindir}, add it to
  rpm-build. rpmuncompress moved too and stays in the rpm package.
* Refresh 0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch,
  it applied with fuzz 2 after upstream added the WITH_WEBSITE option.
  The other patches apply cleanly.

License-Update: COPYING now has an SPDX clarification note, license unchanged

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
v2: add License-Update tag to the commit message for the COPYING
    checksum change (patchtest). No other changes.
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
 
