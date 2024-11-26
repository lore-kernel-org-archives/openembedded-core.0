Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9269AD5A6FD
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 08:37:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.41441.1732610246281573252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 00:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=106096f7e7=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ7dekr004952
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 08:37:25 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618b02c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 08:37:25 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 26 Nov 2024 00:37:24 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 26 Nov 2024 00:37:24 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 0/1] libgcrypt: Fix building error with '-O2' in sysroot path
Date: Tue, 26 Nov 2024 00:37:22 -0800
Message-ID: <cover.1732610136.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cOThghGAl_CNAcwQ7drTm-1MZ0odLSac
X-Proofpoint-GUID: cOThghGAl_CNAcwQ7drTm-1MZ0odLSac
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=674588c5 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=KTvSIWFRb-Fv_sN29ZUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_07,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=769 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411260066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 08:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207842

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit c9d5a6c480c377399a7dc998f3755e42072e19a6:

  libxml-parser-perl: fix do_fetch error (2024-11-13 06:15:28 -0800)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/libgcrypt
  https://github.com/robertlinux/yocto/tree/rbt/libgcrypt

Robert Yang (1):
  libgcrypt: Fix building error with '-O2' in sysroot path

 ...ilding-error-with-O2-in-sysroot-path.patch | 64 +++++++++++++++++++
 ...ilding-error-with-O2-in-sysroot-path.patch | 39 -----------
 .../libgcrypt/libgcrypt_1.10.3.bb             |  2 +-
 3 files changed, 65 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
 delete mode 100644 meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch

-- 
2.44.1


