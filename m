Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117FCEB5958
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 03:20:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10718.1770780015936537664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 19:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b89izOAY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502e9d17b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B1U2KL3781698
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:20:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=d4pvC/80iSahQMscwrfy
	3XCgHvYVxSTy3z2ilTYLDp8=; b=b89izOAYAH3l2dyE66314zQegaZoUN88MSUl
	316di6nUgumPvY5l/zAcsJgJDfKVUQH7PnLP5esFnU3DmaRkBN2ChlZWgMez0DPM
	MoyNrQxJ4AMaHvrSLDE9ChlVlkKn2rgoDzaqPxrugzsibrfEACgqZ53qf/IwahJ1
	B0xuObJrj0GCUkHjbsii/akUQQ0e7OVvhubSe0o0aYCNQu7YElyrIJZIL7aE/L8A
	RjvxbouftgYDsAaRMSb6HU1hkLpVuR1z5YRraKZwtr9pJZD5Xp1X61OwEX/hgntR
	dThx79LmFwVkwkoM0Dk8zoSki6nfoMDyM45zn6W0yobge83m8Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4uyx9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:20:15 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 19:20:14 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 19:20:14 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v5 0/7] rpm: 4.20.1 -> 6.0.1
Date: Tue, 10 Feb 2026 19:20:07 -0800
Message-ID: <cover.1770779786.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698bf56f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=Kyd-bvW6bDpxVBODhxMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: kHTqSVyzdSdWXqa-xF1kkqbrtxuTH8bh
X-Proofpoint-GUID: kHTqSVyzdSdWXqa-xF1kkqbrtxuTH8bh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyNSBTYWx0ZWRfX2PJZ8D0GQhLz
 BI35KrVdJzNOZ+kQ817lNa7fuyB24YJxrX7f995Y+fP/6z2lyUATzzQ7FXE0MvSp7bOUkRP4a8E
 m2mb+bjRNgfGQpugSv+H3OHMSvTyMxe7ay/Fa9yR6OMvYJwGpHRcR/KMZ0t/df0zBVDeev7XWJD
 DDkFX/WVMF9OWYtgn2NThdBcy3plF+/UDL8PF7xaQPZ3ZlJLN7A1cHx7qpDk5xzqOisko4c7ovL
 jF8ZSlcQ6gIhlqhkqkl2I2ysrwbA272GBmXgWZUzHyJSn4NCwb+67lPyx8HydsjHWwldpc3pFjC
 hQntNwNnIE8W6F0dW+bCPUdpz1OiFw23CIf8H9rbjmAvxSRZMyOqLVAz8fJ5Q0WyL55MNXYlD2g
 bhkpwYDk6nBT4NI1F1QhE0HC8pftcsCwbFk8yObsFNolkuJUfD29VJtistc1b0Eu9u6WTX3Dd7p
 MdOvWUPjm1qCnT+DWog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 03:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230950

From: Robert Yang <liezhi.yang@windriver.com>

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

The following changes since commit 58b9f90779d1227e30a7de4948b10e49fb5b5ac1:

  report-error.bbclass: replace 'codecs.open()' with 'open()' (2026-01-29 10:26:54 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/rpm
  https://github.com/robertlinux/yocto/tree/rbt/rpm

for you to fetch changes up to fb0dc8227faa87cdad9f7ef12ebfcb13e6ac8076:

  rpm: 4.20.1 -> 6.0.1 (2026-02-11 03:14:52 +0000)

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
 24 files changed, 206 insertions(+), 272 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb} (95%)

-- 
2.49.1


