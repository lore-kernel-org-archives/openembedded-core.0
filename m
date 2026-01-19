Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CC8CA5FEE
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 06:09:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29974.1768802968320519884
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jan 2026 22:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MAXunC9P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5479224d0e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J5ov4i534382;
	Mon, 19 Jan 2026 06:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=i7qFBi5rV
	CvV8dz566+XAFrJlOoQEdOUbM/8UT5Z+0I=; b=MAXunC9PcFDG/XlsKsnVA0J90
	3peos7ibKPywYuJNTE7+/z50qpKg4aKo7NKrw1vuy4KTGGZjoMBLv3oCLrWkx3lQ
	6Hkm/+khMSWF/Nosl5MXhEBp1r80168iYtMJtzzpGwKDI9O8mjtfGQfyjGx0XjAs
	V+0SLYi2t9ZoS7UIz4yp3Ih+1bP9QdGoFvW7M2BZYVN3VzUxHqT9mAo94hOlxDoq
	08Wp3RANzOUBFOP5HhOifdCilZeG7NjGrDMZQCgkUiM88wefNd5WQmXagcb7gAkD
	FB0wtRgT5PFK0dI97vuF4bLZ3VuR7K4fQvpq5877iS2E0Ppmzo5hfx0+xBTxw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymuhhf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 19 Jan 2026 06:09:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 18 Jan 2026 22:09:25 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 18 Jan 2026 22:09:25 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [PATCH v2 0/2] rpm: 4.20.1 -> 6.0.1
Date: Sun, 18 Jan 2026 22:09:23 -0800
Message-ID: <cover.1768802844.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696dca96 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=VdcA8oN4EYpfTQM4hTMA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HQJ9nPG9vBvJd4AJYcqZpwAaPqvBv-iE
X-Proofpoint-ORIG-GUID: HQJ9nPG9vBvJd4AJYcqZpwAaPqvBv-iE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA0OCBTYWx0ZWRfX2kE52TbuGQrR
 qC82t62gv3vWqWRaN8CyyNA966SQfnqXcQ/xQDHaeeQzj/VnXf98MnqhBp5qnA5fkv6lqTpuG1M
 8b6sXZAJ+Ay316vzh+A99JmGBhYGXFJX97JgemqHZvUG9LBaaLZggSdiHP/kxPxeBvOOH1qy6uJ
 iGQu//1E5dL6DI5R5tKRws7SicbdOKEswOGmFYhuIZAtpYa0Nv3306IYvKhWtVOKrkQCGgCIpA/
 8rnsMca3q9orrVRag3n5Nws7m51P7Tm/NFr46upHp7bSHCFyP5hGl7ArshESf1MMVCMLlxP7dlJ
 DEPLdh+MG7I7CFYu2WIMjOcc2hhmmJAp0xQe2k10drO6SAsnhguO5CM05e1tJjLrBrOaZUYmWd0
 96tX19cMKDuYtG3q+UDF/1v20c6zdRDeoyMTCuVoOWTRHgdGQTYtDoY2e1+UgixaaMdZAYphfJ7
 Dq2J9oTAPmR2bR1zR6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 06:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229589

From: Robert Yang <liezhi.yang@windriver.com>

* V2
  The V1 was incorrect, now update it really.

// Robert

The following changes since commit 983cb2171e53564bc9dd188136439f3e2ad9e188:

  scripts/oe-git-archive: Ensure new push parameter is specified (2026-01-16 11:59:55 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/rpm
  https://github.com/robertlinux/yocto/tree/rbt/rpm

for you to fetch changes up to c75310f8f8162bcca3c24dcaf9230cbbdec3f399:

  rpm: 4.20.1 -> 6.0.1 (2026-01-18 22:01:38 -0800)

----------------------------------------------------------------

Robert Yang (2):
  createrepo-c: Backport a patch to build with rpm 6.0.1
  rpm: 4.20.1 -> 6.0.1

 ...G_SHA1HEADER-instead-of-RPMTAG_HDRID.patch | 50 +++++++++++++++++++
 .../createrepo-c/createrepo-c_1.2.1.bb        |  1 +
 ...olor-setting-for-mips64_n32-binaries.patch | 21 ++++----
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch | 46 -----------------
 ...satisfiable-dependency-when-building.patch | 17 ++++---
 ...1-Do-not-read-config-files-from-HOME.patch | 17 ++++---
 ...-PATH-environment-variable-before-ru.patch | 15 +++---
 ...lling-execute-package-scriptlets-wit.patch | 11 ++--
 ...not-insert-payloadflags-into-.rpm-me.patch | 17 ++++---
 ....c-fix-file-conflicts-for-MIPS64-N32.patch | 17 ++++---
 ...kgverify_level-to-digest-as-RCPM-4.2.patch | 34 +++++++++++++
 .../0001-macros.in-Set-_rpmformat-to-4.patch  | 31 ++++++++++++
 ...ools-elfdeps.cc-Remove-format-module.patch | 37 ++++++++++++++
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 25 ++++++----
 ...avoid-using-GLOB_BRACE-if-undefined-.patch | 13 +++--
 ...ge-logging-level-around-scriptlets-t.patch | 13 ++---
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb}       | 13 +++--
 17 files changed, 257 insertions(+), 121 deletions(-)
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Use-RPMTAG_SHA1HEADER-instead-of-RPMTAG_HDRID.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_rpmformat-to-4.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb} (94%)

-- 
2.49.0


