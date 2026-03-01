Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF6BFD0066
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 12:26:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.136882.1772367996963725430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 04:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TNnnZgXY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75206bce17=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621CKsHv3787147;
	Sun, 1 Mar 2026 12:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=HQC9OqjY/
	uR7JdAYFkFIoC8qjuXJeoJaRcf1PZzorb8=; b=TNnnZgXYA/WXUYYY/34uuR3LR
	Oep7wTBQkJOhNbbjWQ5Qrn7u2zOGsi31lr6VmimNJKcIb7BF7T5QZCV9DCuOPc9x
	FkwtJhlhda/asPQlCt33vXV6HOAdXpgN+bhWAba9v3kM9ZGPZ1oRHXekhLnjjNnj
	fr4mYiAiIcZxu8bNGvfNSc0zphN+XuV1w4sMRSh7ZJk0iaV8YrNZBmUZ4xO3BqNm
	NXGfDdn3WeN4kEtKsrmzf/GPF8rycnDyMPvkrC+GfBWiZX9dOTXrJBHVX6XllXOI
	eMH1a/mnvn4QqU1Pvsmko8P9kdcn5ehf4zG06aNz6b1B1kjRRMxEsGx2LI8iw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvhfk6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 01 Mar 2026 12:26:27 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 1 Mar 2026 04:26:04 -0800
Received: from ala-lpggp3.wrs.com (10.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 1 Mar 2026 04:26:04 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v7 0/7] rpm: 4.20.1 -> 6.0.1
Date: Sun, 1 Mar 2026 04:25:57 -0800
Message-ID: <cover.1772367692.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Pi9GAA4md6pwEGjce_UapH267DMIH2Iq
X-Proofpoint-ORIG-GUID: Pi9GAA4md6pwEGjce_UapH267DMIH2Iq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDExMiBTYWx0ZWRfXySYLRKdR5umd
 96nLoRHItGrW506a7foD0D0frbvGgpanzp+FtEAt8k28+ejkx09sQvEvhdGFW/rgblKa1QpAKmQ
 iYq4xOmgFYcft6c2/uIZmSW4OSINn5iplEVDaqj1xw31rK79H60lAR+G+JqMX/KxVPDMtRy0KaR
 QQnjbEdeONUF3KVg3A7jEdBEa2JhQp0LVF+uBBZNX1TCGxyc7ocAS3qfISyK3FiYiYqHiIb4bKO
 RrwHgS23rN8JCqWPRDeymjrfAZomjBcPh3Oil4GE4eDfWa7QuU+BBRfj/81C2LXNHSwDSAiBam1
 FoVBGyw5XAgdHnu8m+S5Gha4nR4j747vphEn527Dpeb7UgadD7X2RJLDDwcjUUFSe8sRx71qyMu
 y9W9phUomiNdc4lF69lq547EN5UNok0tPyy421COMoe+JH5zfYr390DAQMAv0Q3lp+j33bZZAjY
 zrz5xTg0QcRCJj6XFDQ==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a43073 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=RhSpMNvFF0VU4odwAyQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 12:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232141

From: Robert Yang <liezhi.yang@windriver.com>

* V7:
  - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
    To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04 when
    pkg-config is installed on host, now the host contamination has been fixed,
    and the patch has been submitted to upstream:
    https://github.com/rpm-software-management/rpm/pull/4127

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

The following changes since commit b8e48562ba273051bcf8cbc62be742ef42a1e622:

  alsa-lib: patch CVE-2026-25068 (2026-02-23 18:02:43 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/rpm
  https://github.com/robertlinux/yocto/tree/rbt/rpm

for you to fetch changes up to ab5c811380aac927b0fca3cf4f00952af4e6d8f5:

  rpm: 4.20.1 -> 6.0.1 (2026-03-01 12:18:43 +0000)

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

 meta/classes-global/package_rpm.bbclass       | 87 ++-----------------
 meta/lib/oe/package.py                        |  5 +-
 meta/recipes-core/glib-2.0/glib.inc           |  2 +-
 meta/recipes-core/glibc/glibc-package.inc     |  5 ++
 .../meta/nativesdk-sdk-provides-dummy.bb      |  1 +
 .../meta/target-sdk-provides-dummy.bb         |  1 +
 meta/recipes-core/musl/musl_git.bb            |  5 ++
 .../recipes-devtools/python/python3_3.14.3.bb |  2 +
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
 ...nfigdeps.sh-Use-pkg-config-from-PATH.patch | 42 +++++++++
 ...ools-elfdeps.cc-Remove-format-module.patch | 37 ++++++++
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 25 +++---
 ...avoid-using-GLOB_BRACE-if-undefined-.patch | 13 +--
 ...ge-logging-level-around-scriptlets-t.patch | 13 +--
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb}       | 15 ++--
 meta/recipes-support/attr/acl_2.3.2.bb        |  2 +
 26 files changed, 252 insertions(+), 271 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb} (94%)

-- 
2.49.1


