Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50723E9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 12:23:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10860.1771417374615674810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 04:22:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fWx8Hovd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6509523d13=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I9FlvF1377447
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 04:22:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=tdpbEuAsRoNyZx1ZcXqX
	A9Hk6TC7j1OhYU/j59h3xe8=; b=fWx8HovdE1nNnibdt4wiXIGGhkVVjTAXnJqg
	l3eIT3ugD7h3oO4YQmqyZL+QmTPbqJIArimBHLANyOGlpKaGoSggS5t84u9EAcAY
	/ZDio/s6ehcuQSh0fHi4rh0LxIeP3zZclGfLN/3niSNfwK41wrxIDCvOHXVVGENE
	XTCzvoJIe/V7moVv9hGjhKN8VKGZc5YvhNX6A476wjsGOjiVlBsqg1N3SZmv5Utx
	JodpkCqN1FhcBmHg1ILdbrnUjDEdS24lMu0BSPjVcQhKKBYZnRkNhxxVEatemFeI
	b9oY+P7enHl09I2xWTiGgf2bTOYSsF/tq9WM5Yl4jptyRyX0pw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ccbamt6sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 04:22:54 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 18 Feb 2026 04:22:53 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 18 Feb 2026 04:22:53 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v6 0/7] rpm: 4.20.1 -> 6.0.1
Date: Wed, 18 Feb 2026 04:22:46 -0800
Message-ID: <cover.1771409846.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=SsCdKfO0 c=1 sm=1 tr=0 ts=6995af1e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=hM1HSx4yaaL9zJWKmnsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwOSBTYWx0ZWRfX7YC1I90s/OQT
 CiruMcKeAUYqt/fMp8q0BS/b6q9eY7Z5r/iWsjt7txMg+i/SSekIWr78z456gsAZnKUFFjfJNCc
 m63NDysRcf9MXxfMt+EnnMfSL18ImkzEY5EiK39SET9sxmiH5mn9ixaw1+3mVGdZS0WI1iIsZPM
 o275/q84/kigRg/frnDtn+KQWYiHbBUAeNS+k461Oo46KIdbkRnjMuipxHAlCznEaDdZ8zGFy+m
 KbraScpl/DRxrrDD3LfZKIXSx0peg/zhvmVKQZmds4sl3JYkPQIAP15MHj2dEzlRkSlcFSoZQrT
 NJIrtbqMlDd3fqStZHUDBxXaKZEDSt41NbDBFvpmXcs4eN2J9uicynFMUaM/NrEw1tRZr3X4Q53
 xoBo2dG1I+AfOKgObdjJpSsPRzeI7/g59C+odZE20kJI5+8ilNQu6Fl4B3Ylk7JUYbVVeZFNTwa
 9Oul0w4lcRRbn6gWZjA==
X-Proofpoint-ORIG-GUID: nXUcnkFwnDfMYmDI6K2pVD3KGxvDQR4_
X-Proofpoint-GUID: nXUcnkFwnDfMYmDI6K2pVD3KGxvDQR4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602180109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 12:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231298

From: Robert Yang <liezhi.yang@windriver.com>

* V6
  - Fix -cpopulate_sdk error when DISTRO = "poky"

* V5
  - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
  - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
    between /bin/sh and libc.so. 

* V4
  - Fix loop dependencies issues for libc6 and busybox
  - Fix issues for can't find pkg-config files (.pc) on qemux86-64.

* V3
  - Fix Alexender's comments
    a) Suppot rpm 6
    b) Move rpm-setup-autosign to rpm-build
    c) Remove -DLIBELF_FOUND=False

  - Fix build for nativesdk-rpm

  - Drop patch for createrepo-c since it has been upgraded (rev:
    804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

* V1 & V2
  - Initial version

// Robert

The following changes since commit 2c20c05b324e5d6564c8554381019170839509bb:

  pseudo: Update to include an openat2 fix (2026-02-13 12:25:37 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/rpm
  https://github.com/robertlinux/yocto/tree/rbt/rpm

for you to fetch changes up to 907fd664240474a2183fc4bf7bfa35f98c53c3d4:

  rpm: 4.20.1 -> 6.0.1 (2026-02-18 10:02:04 +0000)

----------------------------------------------------------------

Robert Yang (7):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
    musl
  glib/python3/acl: Add pkgconfig to RDEPENDS
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.1

 meta/classes-global/package_rpm.bbclass       | 86 ++-----------------
 meta/lib/oe/package.py                        |  5 +-
 meta/recipes-core/glib-2.0/glib.inc           |  2 +-
 meta/recipes-core/glibc/glibc-package.inc     |  5 ++
 .../meta/nativesdk-sdk-provides-dummy.bb      |  1 +
 .../meta/target-sdk-provides-dummy.bb         |  1 +
 meta/recipes-core/musl/musl_git.bb            |  5 ++
 .../recipes-devtools/python/python3_3.14.2.bb |  2 +
 ...olor-setting-for-mips64_n32-binaries.patch | 21 +++--
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch | 46 ----------
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch | 50 -----------
 ...satisfiable-dependency-when-building.patch | 17 ++--
 ...lib-rpm-as-the-installation-path-for.patch | 23 ++---
 ...1-Do-not-read-config-files-from-HOME.patch | 17 ++--
 ...-PATH-environment-variable-before-ru.patch | 15 ++--
 ...lling-execute-package-scriptlets-wit.patch | 11 +--
 ...not-insert-payloadflags-into-.rpm-me.patch | 17 ++--
 ....c-fix-file-conflicts-for-MIPS64-N32.patch | 17 ++--
 ...kgverify_level-to-digest-as-RCPM-4.2.patch | 34 ++++++++
 ...ools-elfdeps.cc-Remove-format-module.patch | 37 ++++++++
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 25 +++---
 ...avoid-using-GLOB_BRACE-if-undefined-.patch | 13 +--
 ...ge-logging-level-around-scriptlets-t.patch | 13 +--
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb}       | 14 +--
 meta/recipes-support/attr/acl_2.3.2.bb        |  2 +
 25 files changed, 207 insertions(+), 272 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb} (95%)

-- 
2.49.1


