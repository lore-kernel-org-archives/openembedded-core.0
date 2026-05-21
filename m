Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76027CD4F5E
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:46:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31515.1779349610136866406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 00:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AH5sUgn0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96010b0c56=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L5VKp73838569
	for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 07:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=4KMf9DVnJ4mzxJr15+ER
	e60TkZqZna832vCebwAmBYY=; b=AH5sUgn0+GjSn3UeKQtp36P/2j5KWPYLqTWn
	Zx8do6Zn94WGMCSLdibQCYtw3f+iCB6a5Y0Yip5Did2/Ln2c/fHsHODHW+Ab5jlP
	pnDyIdwaDuqvAJvYwgiItsFosGOq0Vmr9LF1739dZXv2MDp1DRlMsf7FcnpVUG9G
	9dbRtl+up2/aQdx778xxUW1RgeNwdPruHXYLJtLjqbtqXNRUhFShvzyxOTCJfqin
	60YKhMO76NG6sqeSc+ZJ5i0BnElj1LUrRYYH9DIANwRQMbyVRZaNZ0pesopx9xpR
	vEYHIJhqYA+aeMSVrZeeyIG/6RwL5/DTAr/6FrIYL1h8iB2Siw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6fj3xrcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 07:46:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 21 May 2026 00:46:47 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 21 May 2026 00:46:47 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 0/2] Packages upgrade
Date: Thu, 21 May 2026 00:46:45 -0700
Message-ID: <cover.1779349122.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -0qVpC7zNV0xCPq3sWWMB4760pngpJP4
X-Proofpoint-ORIG-GUID: -0qVpC7zNV0xCPq3sWWMB4760pngpJP4
X-Authority-Analysis: v=2.4 cv=VssTxe2n c=1 sm=1 tr=0 ts=6a0eb868 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=TvyXcD2dNZ9shqwp_sUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA3MyBTYWx0ZWRfXxyNNuxK7kj/B
 lQK1WM6/YEhqZyIHb+MGstwTJzrHsqf6EWQMq/UMNy6GHaC0c2qDoD6vRh95IZaagIiqO+0YUJB
 weQfIe4qMfNzuZQnXb6XZBFnumTdIh893qs0d4hwBWmtI6yQJstFx4HZ4BGLc/MqrIRWzJFqqj0
 IxCregFRby3dI29sMO8T+dx9gZcmuiBTduzWw4CIXLnwrjtH0Vjn/5XES3lGX/QA7Wvcp5Ambva
 nhxPdIy3190tXtZ+06VJDvwcT8PitmY90m9dyMQkr2l00qqJ7yekUmRLT5e04CbRNfMJFumB2ou
 qyvj7LW0nOTh8orrFWDAvLDb/wgSdmgzZ7I+BcQpcsiqAMOmsEinuaQWh52lRS4nWjxYP4mVMLT
 H+d4rvCgaS1PYlF4Dg8MtitUaM+3pw4Kiv9jAxxbIo66UaCUCPWZlXDkhcM1fiDOfIxsvaaDDs4
 uDW30QU22DvFaTpZAfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 07:46:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237471

From: Robert Yang <liezhi.yang@windriver.com>

* V3:
  - strace: Remove strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch

* V2:
  - ufs-utils: Move 0001-fh_key_file.c-Fix-build-error-for-musl.patch into nfs-utils' commit.
  - strace: Remove HASHEQUIV_HASH_VERSION

* V1:
  - Initial version

// Robert

The following changes since commit b3aa1a6419bef653cff710fc3359211daf9f7902:

  librsvg: upgrade 2.61.3 -> 2.62.2 (2026-05-18 23:19:13 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/pu
  https://github.com/robertlinux/yocto/tree/rbt/pu

for you to fetch changes up to 805b80291449f0ce4ce4b278786f80326434d3b2:

  strace: upgrade 5.19 -> 7.0 (2026-05-20 21:25:32 -0700)

----------------------------------------------------------------

Robert Yang (2):
  nfs-utils: 2.8.7 -> 2.9.1
  strace: upgrade 5.19 -> 7.0

 ..._key_file.c-Fix-build-error-for-musl.patch | 31 +++++++++++++++++++
 ...{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb} |  5 +--
 ...gnore-pwritev-pwrite64-tests-on-musl.patch | 16 +++++++---
 ...toconf-macro-to-detect-largefile-sup.patch |  4 +--
 ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 ++--
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 .../strace/strace/skip-bpf.patch              | 25 ++++++++++-----
 .../strace/strace/skip-load.patch             |  2 +-
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_6.19.bb => strace_7.0.bb}  |  6 +---
 13 files changed, 74 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file.c-Fix-build-error-for-musl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb} (96%)
 rename meta/recipes-devtools/strace/{strace => files}/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch (78%)
 rename meta/recipes-devtools/strace/{strace_6.19.bb => strace_7.0.bb} (93%)

-- 
2.49.0


