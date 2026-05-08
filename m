Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567FBCD37A7
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 14:45:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15475.1778251504063875684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 07:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BeMBB/py;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9588382931=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648B4eeW470902
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 14:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=crruLcW0R816dMuk4YDh
	J6gKSGhboE3qhyoWQTYbRDg=; b=BeMBB/pyUAPu4KVncIVBzMeseHwbnkc7VS8f
	BLrhrIJWNUUJKkQUyzFEybax9r9v/QMPOVDIxuAbh0WjKLyXc6wsmUuFYud5e+nF
	Dy12krfYJZBJkp0y3xRr8+mwDb8UIoYuQoA6dtWu3rsEm//Gc06LiQlAa22yVP1+
	BdNjfotZH3RZN/7NrJ7btaeLHG9eo6KmDXaF5+R5/p6FXj4h2iJtW/s9JRA2q9iq
	rfKLxg/iA5yD+LcnSKyN7/5sITghiCpC7wAOfjEkNLgIth3ww+mrNhQuEPWhCxti
	DV1XVvM18a4NJ74OCKtmU78wEqiXWcgc7Etdke1ydNpzSQK/Rw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1cbvrc3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:45:02 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 8 May 2026 07:45:01 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 8 May 2026 07:45:01 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/3] Packages upgrade
Date: Fri, 8 May 2026 07:44:58 -0700
Message-ID: <cover.1778251103.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LFlkGXw9Pwu4FISGqVB5amkwBbQx3XCs
X-Proofpoint-GUID: LFlkGXw9Pwu4FISGqVB5amkwBbQx3XCs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE1MCBTYWx0ZWRfXxPJOTTVFghNM
 p8hj5zwthsPHgCpNiDdw6zLkIzL4YoPWHPt2xjy0z/CbceFKntcf49Y/2ntK2SznCCIg/gpNVJz
 GpSEmPMCctiyZyaaDw0Wz49Ney8gpm3F9L4G5rmQawqCheFSIDq5Rsg+naN4BYq4AC7xp4sFIII
 UYZOigvbdJVS3M3sDeBUtWBfv5U9f2fw1l3VjHaI50ZjQqdMaGusb2KJkTFdKAsPvxbeNbrYV4Q
 JGKsMhfW1GQdz4X8M6bD1yNrcK9KggHsvXiwe47ozciCXG1IvWC9ISQe4ZCr4zabbNV4s5FLdq8
 xwRiU6mmy7f56UuHm4oU/yh2lLVPzqOZJkltLeEiGN8qk+PDND9Dk6ZvxZAF+YhVLloXA0QBYbF
 V2c22CwrPWI6tOfbT8A1/a3gNlgIc0+bLggoe/5go7xBfjtGuYkCJhUvIrQ5+0CHvLfoLmzRKdZ
 zFiI9URrAjF0Tjacppw==
X-Authority-Analysis: v=2.4 cv=U9iiy+ru c=1 sm=1 tr=0 ts=69fdf6ee cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=T395ZXeLyhRypBCXE_0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236719

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 4f7d1a0885d7d6f2a533f7388ed5f5a35d6f99bc:

  python3-requests: update to 2.33.1 (2026-05-07 11:19:26 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/pu
  https://github.com/robertlinux/yocto/tree/rbt/pu

for you to fetch changes up to b45f339c84baf27040248d667f2a8d02ee2f25fd:

  strace: upgrade 6.19 -> 7.0 (2026-05-08 07:20:18 -0700)

----------------------------------------------------------------

Robert Yang (3):
  time: 1.9 -> 1.10
  nfs-utils: 2.8.7 -> 2.9.1
  strace: upgrade 6.19 -> 7.0

 ..._key_file.c-Fix-build-error-for-musl.patch |  31 +++++
 ...{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb} |   5 +-
 ...gnore-pwritev-pwrite64-tests-on-musl.patch |  62 +++++++++
 ...toconf-macro-to-detect-largefile-sup.patch |   4 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |   2 +-
 ...001-strace-fix-reproducibilty-issues.patch |   2 +-
 ...002-tests-Replace-off64_t-with-off_t.patch |   2 +-
 .../strace/strace/Makefile-ptest.patch        |   6 +-
 .../strace/strace/ptest-spacesave.patch       |   2 +-
 .../strace/strace/skip-bpf.patch              |  25 ++--
 .../strace/strace/skip-load.patch             |   2 +-
 .../strace/strace/update-gawk-paths.patch     |   2 +-
 .../strace/{strace_6.19.bb => strace_7.0.bb}  |   3 +-
 .../0001-include-string.h-for-memset.patch    |  27 ----
 .../0002-maint-remove-K-R-declarations.patch  | 131 ------------------
 ...t-fix-compilation-errors-with-GCC-15.patch |  65 ---------
 ...aint-remove-obsolete-autoconf-macros.patch |  43 ------
 .../time/{time_1.9.bb => time_1.10.bb}        |   9 +-
 18 files changed, 127 insertions(+), 296 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file.c-Fix-build-error-for-musl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb} (96%)
 create mode 100644 meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
 rename meta/recipes-devtools/strace/{strace_6.19.bb => strace_7.0.bb} (96%)
 delete mode 100644 meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch
 delete mode 100644 meta/recipes-extended/time/time/0002-maint-remove-K-R-declarations.patch
 delete mode 100644 meta/recipes-extended/time/time/0003-maint-fix-compilation-errors-with-GCC-15.patch
 delete mode 100644 meta/recipes-extended/time/time/0004-maint-remove-obsolete-autoconf-macros.patch
 rename meta/recipes-extended/time/{time_1.9.bb => time_1.10.bb} (61%)

-- 
2.49.0


