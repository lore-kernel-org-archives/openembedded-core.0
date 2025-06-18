Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432FFC71155
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 02:59:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37494.1750215589447668986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 19:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82648703cf=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I2v3Pj005276
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:59:48 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1m2gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:59:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 17 Jun 2025 19:59:46 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 17 Jun 2025 19:59:46 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH V2 00/11] libsoup/libsoup-2.4: fix CVEs 
Date: Wed, 18 Jun 2025 10:59:34 +0800
Message-ID: <20250618025945.2504711-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=68522ba4 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=d_2wpi1BJG2xA3R6wsQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: z5gIYQ4HS1KiHy_d5_95VbOYkW5AZD0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAyNCBTYWx0ZWRfXwoAcFJocquhg qiIqDjoGfer6rMR/LlQAUHHB8qB2Mb53c4ENNLVjervLBIGmIrCocz0bEahUHR2SNCgvfGr3ZmJ nD/cmCmEU/qIrUWkLh+Eu/BTcT/A7te8jBwQjYK6/OPFxFmESvexrpQmIrAeCZ54h589wDSbU/A
 eRrYZ/FxmspvXx8BxnND+F+o8RcwbTFgcXgPOdpdnng74F6QqyOdsM+XHZEj2qwUSUPuM7enT2E gkyxScAOf7NMk2sxUBzybdMDG/zPKRqQYuy3FMYBc/GFh1Uud7zEIwsuYxw/f92R7rsdsuiRk/R +AiotOqMcIirfdDN32HSDidI0HVfB+ki4rLSn1VJ8wOD+Gjvg8nUhvwO8o1TteGdbFu+p0Ofl38
 J8PMqG/iu1UepOICLK8gv9lf1kVaiD7jTO7kwtU7/BV5lcIrGTnE9dQGOGdWZqk0NIOsUsJv
X-Proofpoint-GUID: z5gIYQ4HS1KiHy_d5_95VbOYkW5AZD0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=464 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218956

From: Changqing Li <changqing.li@windriver.com>

Backport several CVE fixes from branch scarthgap, cherry picked from
poky-contrib: stable/scarthgap-nut,  and do some changes accordingly.

Ashish Sharma (1):
  libsoup: patch CVE-2025-4476

Changqing Li (8):
  libsoup: fix CVE-2025-32907
  libsoup: fix CVE-2025-32051
  libsoup: fix CVE-2025-46421
  libsoup: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-32907
  libsoup-2.4: fix CVE-2025-46421
  libsoup-2.4: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-4476

Hitendra Prajapati (2):
  libsoup: Fix CVE-2025-4969
  libsoup-2.4: Fix CVE-2025-4969

 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++++
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  76 +++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   5 +
 .../libsoup/libsoup/CVE-2025-32051-1.patch    |  29 +++
 .../libsoup/libsoup/CVE-2025-32051-2.patch    |  57 +++++
 .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 ++++++++++++++++++
 .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++++
 .../libsoup/libsoup/CVE-2025-4476.patch       |  38 ++++
 .../libsoup/libsoup/CVE-2025-46421.patch      | 139 ++++++++++++
 .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++++++
 .../libsoup/libsoup/CVE-2025-4969.patch       |  76 +++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   8 +
 15 files changed, 955 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch

-- 
2.34.1


