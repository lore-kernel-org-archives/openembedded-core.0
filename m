Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851E0CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 08:14:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2669.1778660047262628337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 01:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GRxSIsES;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9593f74c6b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D42IFb258937
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=BMFMZ/3JJE6azR5yBtx/
	8sC+899JNUVFIRlEvFki8sw=; b=GRxSIsESsAAikWoAE2T9/2a15HVhVl89f3VQ
	IiBAI2P/2x5uCIAPOqZC5jm13ZWn673ckF6bnqWeQfDZI1slFPLJq0Iwk13yELTP
	BKbmqGEfS/hn780BqPO2KObq/FTjWht/a5h7XNqf34xeL57mwuk7qAX5q/GcPA2S
	7ucP/nVrLxlqzhy+8wox9D+FxvR19vyuh3tUbjeB1oQY5xgU/F8TQsvK7BSMoQNU
	q7dBj1MYbgECVUWzhREr+pWKXTzBllofj2XFNTYEuS5IWmOVSY4IToGw+u3785Vh
	IKbgotoxNC86qEpf/+/39hG+6teHOT9x/QTvjlzFK0TV9Fx8Kg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ft78dbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:14:06 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 13 May 2026 01:14:05 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 13 May 2026 01:14:05 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 0/2] Packages upgrade
Date: Wed, 13 May 2026 01:14:03 -0700
Message-ID: <cover.1778659781.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cEIFahQn6wMfGUsW_aXUgeApdAqGBwaY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4MyBTYWx0ZWRfX1ZZuYol/fOrZ
 xDVM7SnUOzAiPxgbHr7CLP43J8uKQYKc3zKy5l0svKqhDwAdmJElPzVrEGZk4Wm+r6vsZ27RXzH
 1LvsHBXm0vNA6v9/AHLabMy9gCXZOLB4FrIqh3ke+Z1VRFghJbPtOKBw1rPwidt5H1/M7ja6/8X
 A+lHIKI8Mzb8dIjeAaoFNqRFk6xTbRUqikE2SOCMOx1wIW/vqs7cbgRGkYIy4SKTIC6sICs1zLc
 ZRI5LzNxsAUwgZEzNQrJFoaJsDEOQslC7ASZaOEbeSthFpz+ur8qxlGKxhhWAxnMgWK4BR3BuAH
 ZrIUEf7kqbqJnDFuYur2li3y8EavUbHGvIMu9b8sPtrigWzr8NWzXsCvRT5tFCjQPWAVbfzRz8p
 OiMval4q9M0RJSGH5x4AA868pSo4ufSDNTToAz4o9usbXGD16kYygaaNFiMYagDvjAnH/15kbBB
 dyJ93GwvnqBQs1loogA==
X-Proofpoint-GUID: cEIFahQn6wMfGUsW_aXUgeApdAqGBwaY
X-Authority-Analysis: v=2.4 cv=G6As1dk5 c=1 sm=1 tr=0 ts=6a0432ce cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=breqiNkwc08GHzlmXv4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236943

From: Robert Yang <liezhi.yang@windriver.com>

* V2:
  - Move 0001-fh_key_file.c-Fix-build-error-for-musl.patch into nfs-utils' commit.

* V1:
  - Initial version

// Robert

The following changes since commit 3724b93538d3acbec9f48d4c524b51d166071708:

  sbom-cve-check-update-nvd-native: Update source revision (2026-05-11 17:55:43 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/pu
  https://github.com/robertlinux/yocto/tree/rbt/pu

for you to fetch changes up to 19dc384322b778c446534c54666b60f0eb721827:

  strace: upgrade 6.19 -> 7.0 (2026-05-13 00:21:22 -0700)

----------------------------------------------------------------

Robert Yang (2):
  nfs-utils: 2.8.7 -> 2.9.1
  strace: upgrade 6.19 -> 7.0

 ..._key_file.c-Fix-build-error-for-musl.patch | 31 ++++++++++
 ...{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb} |  5 +-
 ...gnore-pwritev-pwrite64-tests-on-musl.patch | 62 +++++++++++++++++++
 ...toconf-macro-to-detect-largefile-sup.patch |  4 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 +-
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 .../strace/strace/skip-bpf.patch              | 25 +++++---
 .../strace/strace/skip-load.patch             |  2 +-
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_6.19.bb => strace_7.0.bb}  |  3 +-
 13 files changed, 125 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file.c-Fix-build-error-for-musl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb} (96%)
 create mode 100644 meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
 rename meta/recipes-devtools/strace/{strace_6.19.bb => strace_7.0.bb} (96%)

-- 
2.49.0


