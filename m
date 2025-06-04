Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C3BC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 15:01:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18849.1749049255496624752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 08:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250162873=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5544EbJw018125
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 08:00:55 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rtpd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:00:55 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 08:00:54 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 08:00:54 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/3] Packages upgrade
Date: Wed, 4 Jun 2025 08:00:58 -0700
Message-ID: <cover.1749049204.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lpoB0jOpK8-OilKe7-c1qBIpdLiUORfO
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68405fa7 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=z1ycNTcxbIqRN_3s1-8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMyBTYWx0ZWRfX/0tvESl9WfPF CvN3Xnn0Lkii50U/AXKC2qF0pKZyEkShl3s+4Y46Cq1FMkwB5tClGGs4WeD7x4yDEy7RhDZaRnF qYObdl79py5hmtm3muKlcW0HmjzQfFlOHivacJ/TmQXafXAfoqjqlTCLU/KWYUABH25LIuwftJt
 b9J2SYI9wMaziE6XeubvsUI/XP8LVWEGgYAB509hSliENwvwRsDIzIn8t72U02w2ZahViIk+8eI PJ7sj7U2kjQrLz5HC0EnhP3EvQ7nPV5t/NLwrv5xQAOZrRJiaZ/rbx1ptfpZLTEJYaIEmg3OxUS UfV61Qo7GDG4H3+ScagoJCpIGKbvEkbV9aLRqVMh7o0ruKzTf5i31d9BWtvkiwOEcqbyZIkGiRY
 R8L90noXrQPprXgKbUwqqHNTklU4l3Unow3zvRhoG12hVj1FAUY3C3fOkOyvB4gSQOiFlszM
X-Proofpoint-ORIG-GUID: lpoB0jOpK8-OilKe7-c1qBIpdLiUORfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 15:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217952

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 2e817e6e4d53543766b935479b148a1950cc37c8:

  oeqa/maturin/guessing-game: Bump dependencies to avoid security warning (2025-06-04 08:08:28 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/upgrade
  https://github.com/robertlinux/yocto/tree/rbt/upgrade

Robert Yang (3):
  strace: 6.12 -> 6.15
  quilt: 0.68 -> 0.69
  nfs-utils: 2.8.2 -> 2.8.3

 ...0001-Fix-typecast-warning-with-clang.patch | 32 ---------------
 ...mon.c-fix-a-formatting-error-with-cl.patch | 40 -------------------
 ...{nfs-utils_2.8.2.bb => nfs-utils_2.8.3.bb} |  4 +-
 ...lt-native_0.68.bb => quilt-native_0.69.bb} |  0
 meta/recipes-devtools/quilt/quilt.inc         |  3 +-
 ...b-spec-filters-obs-usr-bin-sh-bin-sh.patch | 28 +++++++++++++
 .../quilt/{quilt_0.68.bb => quilt_0.69.bb}    |  0
 .../strace/strace/Makefile-ptest.patch        |  7 ++--
 .../strace/{strace_6.12.bb => strace_6.15.bb} |  4 +-
 9 files changed, 37 insertions(+), 81 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.2.bb => nfs-utils_2.8.3.bb} (96%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.68.bb => quilt-native_0.69.bb} (100%)
 create mode 100644 meta/recipes-devtools/quilt/quilt/0001-contrib-spec-filters-obs-usr-bin-sh-bin-sh.patch
 rename meta/recipes-devtools/quilt/{quilt_0.68.bb => quilt_0.69.bb} (100%)
 rename meta/recipes-devtools/strace/{strace_6.12.bb => strace_6.15.bb} (93%)

-- 
2.49.0


