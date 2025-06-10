Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63551C61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 11:17:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.84477.1749554233259821185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 04:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8256183154=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6vdP9004642;
	Tue, 10 Jun 2025 04:17:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm2ngy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 10 Jun 2025 04:17:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 10 Jun 2025 04:17:04 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 10 Jun 2025 04:17:04 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross.burton@arm.com>
Subject: [PATCH v2 0/2] automake: 1.17 -> 1.18
Date: Tue, 10 Jun 2025 04:17:01 -0700
Message-ID: <cover.1749554012.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DPcojFoS3Ubt1yP9dvNne_EISxk2QHlz
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=68481435 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=UyOD7EgohgrzzXCQyMgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NyBTYWx0ZWRfXyfy9cBcpuM60 WlH5j/YvX9JU2o4h9yoTR4ugBmCdmT7P8GyXguyA5V8EGnPUItKI5HmwxizyHTxvvKQmImKaypT AI/gwJt43TjDeA4AlGEm+ocIVS2N56Ahfd/fDGEaPV5Je6ot2fZIs9skY/Epw2aehBjw8s9szWf
 FNU95S5PjudD8aO8fIlnrgBvrL55LTpXwC5Lr9XhGUnmNY84SpbAVL5S0BWqezYyRLBY9yLRA5d f8eMK82qoZ0jF6YNfBzgDAJo3KzLNlUCOxoIdGZUrhURjw30Xp+m3l5tgtkpz93O7BFj9UAewzy 1PxGhVtcMK2XtQdywM6/Ef+Qb2vj/8Oh9zZDBrFetAW94BWNZBTd5o7CKrUoDIdooxq9FDjynDu
 91SawBhwYTr6D2Qsr0/VaKDDph5D6GxVOV+kMq+4US4Pc4aWQThGoUIHTkS23YhfWsoQyFU5
X-Proofpoint-ORIG-GUID: DPcojFoS3Ubt1yP9dvNne_EISxk2QHlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 11:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218342

From: Robert Yang <liezhi.yang@windriver.com>

* V2:
  - Drop 0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch as Ross
    suggested.
  - Take a pull request from github to fix libcheck's build error with automake
    1.18.

// Robert

The following changes since commit bf866a99d920331bc5c08c3dccc86f71b2d1b3bb:

  systemtap: put version in recipe filename (2025-06-09 17:43:20 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/automake
  https://github.com/robertlinux/yocto/tree/rbt/automake

Robert Yang (2):
  libcheck: Fix do_install error with automake 1.18
  automake: 1.17 -> 1.18

 ...report-error-when-the-path-of-Perl-c.patch | 34 -----------
 .../{automake_1.17.bb => automake_1.18.bb}    |  3 +-
 ...0001-Fix-texinfo-errors-and-warnings.patch | 60 +++++++++++++++++++
 .../libcheck/libcheck_0.15.2.bb               |  5 +-
 4 files changed, 65 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
 rename meta/recipes-devtools/automake/{automake_1.17.bb => automake_1.18.bb} (85%)
 create mode 100644 meta/recipes-support/libcheck/libcheck/0001-Fix-texinfo-errors-and-warnings.patch

-- 
2.49.0


