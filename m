Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBA5EA3F15
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 07:10:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15024.1770707444399789537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 23:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PoxAcwrQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6501c5c083=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6dUMZ1796014
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Feb 2026 23:10:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NWs4IQBaxka4M4mCHlFd
	0gOYEballXSge6xO4CZvE1I=; b=PoxAcwrQdbN5QA9csjGxggkUlHCcRQhQwjwd
	PwAOlsjkAWhCDBUo6V7dp0jVZCHuJRaR2/coEUZ9yYPUPEih3NOs32ghwc7rlfBW
	J2kMfCLCoaDlDzQQe8N4nPukI3FMpB4PyeNGGV45VcXSv7WOykeKKm1gyN9WrVV2
	8PT4zNRLWL749cPKJBE7zd9VNYdJA20yfuXVKb8sb7sZ7lYw/OJYc8bZeF8f09zo
	vuddbkAiJiXzUhWDEuix8O9ZzQ3SejsK90BtwE9W3AI+EleHPqRbVwvi1Ysd06eT
	ilKv/52TJFJWU6CbaSGalZuSRTbbzJfQ7soK3WVkSmWGiYW86Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj2m0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 23:10:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 9 Feb 2026 23:10:43 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 9 Feb 2026 23:10:43 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 0/7] rpm: 4.20.1 -> 6.0.1
Date: Mon, 9 Feb 2026 23:10:35 -0800
Message-ID: <cover.1770707181.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mjF_p8oklRdn0X5-QHtANex8_hDaJk69
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA1OSBTYWx0ZWRfX2ri/wucnRvJf
 dyINdqCItccs2FntW61DUmDK4WwQojm89XkjHVPfMSWXcC8V1Iy6HKXrjhkZDiASSwCliCl28JH
 V1VqLvLVr3QHYtjsaOxXy6v2gWs85PInvu8UF9w2ywNXqtJndJ0sP6ZYoeBqf93VmQgNylZlp2a
 z//EST6CMkGyTn7DHeZEzi/dnQHs3XbXiwuPeF66CVZvwymQqi5SKFyRYEUZr52Hrwt1x0KHxYy
 s+3io0xzibEG2oBTei4mLMJ5RNsVKloMLoL8ON9u2TigMDCXqIga8tXIrzxQN1qiHPtAE/Mtd+l
 bY93vI9RVyLhQP+OTmtL+9rcPKFzzcwnLxhXxdlvnt2yVgJbNm6vAF5aVhMf6wP9siwQYmdwmAB
 Eyi31ZHdQGYbCGpRSlvAL/yERZwXxFHwGXLTvzpU99Y3lfYfdikANs0R9YP5K8PcykV1AC8HgOg
 7ebVIZvOPP4KQyVDafg==
X-Proofpoint-GUID: mjF_p8oklRdn0X5-QHtANex8_hDaJk69
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698ad9f3 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=Kyd-bvW6bDpxVBODhxMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230854

From: Robert Yang <liezhi.yang@windriver.com>

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

for you to fetch changes up to 0e393a61c8ee9de7aeb610df6afb30ed95171dff:

  rpm: 4.20.1 -> 6.0.1 (2026-02-10 07:06:05 +0000)

----------------------------------------------------------------

Robert Yang (7):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  classes-global/package_rpm.bbclass: Remove %pre and %postin for libc6
  glib/python3/acl: Add pkgconfig to RDEPENDS
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.1

 meta/classes-global/package_rpm.bbclass       | 92 ++-----------------
 meta/lib/oe/package.py                        |  2 +-
 meta/lib/oeqa/runtime/cases/dnf.py            |  8 --
 meta/recipes-core/glib-2.0/glib.inc           |  2 +-
 .../meta/target-sdk-provides-dummy.bb         |  1 +
 .../recipes-devtools/python/python3_3.14.2.bb |  2 +
 ...olor-setting-for-mips64_n32-binaries.patch | 21 +++--
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch | 46 ----------
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch | 50 ----------
 ...satisfiable-dependency-when-building.patch | 17 ++--
 ...lib-rpm-as-the-installation-path-for.patch | 23 ++---
 ...1-Do-not-read-config-files-from-HOME.patch | 17 ++--
 ...-PATH-environment-variable-before-ru.patch | 15 +--
 ...lling-execute-package-scriptlets-wit.patch | 11 ++-
 ...not-insert-payloadflags-into-.rpm-me.patch | 17 ++--
 ....c-fix-file-conflicts-for-MIPS64-N32.patch | 17 ++--
 ...kgverify_level-to-digest-as-RCPM-4.2.patch | 34 +++++++
 ...ools-elfdeps.cc-Remove-format-module.patch | 37 ++++++++
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 25 ++---
 ...avoid-using-GLOB_BRACE-if-undefined-.patch | 13 ++-
 ...ge-logging-level-around-scriptlets-t.patch | 13 +--
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb}       | 14 +--
 meta/recipes-support/attr/acl_2.3.2.bb        |  2 +
 23 files changed, 198 insertions(+), 281 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb} (95%)

-- 
2.49.1


