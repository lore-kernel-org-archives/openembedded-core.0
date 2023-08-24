Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F36C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 09:07:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6789.1692868038540562591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 02:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WXeMT0Zr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76007d89c0=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37O6TmCB011332
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 02:07:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=EURxE
	CQwUU624wqb1rbcAO0IbReDGk5Ol3sTbllmtHk=; b=WXeMT0Zr/KfIGhs0WMzWQ
	GT7vumb7zT9kQyjqV9vBKJ+BHGynJll2zHDTXd15jpBM1N95yc6JACzVTZTyGPpi
	e3ELMiCcRIAZwRigBGV3bWOuTt7Wz9Zhp9v9Pq46G95pF/Mj3dpEBMsUiyXWR3Sj
	HERuvPWUk5JQDsc0I5p1Td2Z/TQ+OIhb7M83Vkc5icfmrIJOkwDCV8pDruip4nJ2
	ddTFrY/lPcrgNsOH1Oq71jAE0zBwi5ePPGcYpmEMFizyd24LklWZ8No1O8cT3ruy
	+Z0DBdwZz2m/uFVa3JmaOEhhXt1jPEcbK+jUCWNClBs9m6SV3pYIKBNkRJkqTWEw
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20dhmhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 02:07:18 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 02:07:17 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 02:07:16 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] init-manager-systemd.inc: update KERNEL_FEATURES
Date: Thu, 24 Aug 2023 17:07:14 +0800
Message-ID: <20230824090714.2911613-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: KuGeLS6o2cIvvz1ezQ4-PL2ToNJnxlsr
X-Proofpoint-GUID: KuGeLS6o2cIvvz1ezQ4-PL2ToNJnxlsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_06,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2308240073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 09:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186650

From: Kai Kang <kai.kang@windriver.com>

Append cfg/systemd.scc to init-manager-systemd.inc which enables kernel
config CONFIG_FHANDLE. The config is required by systemd >= 209 [1]:

  you have to enable CONFIG_FHANDLE in your kernel to use systemd >= 209
  successfully, otherwise udev won't find any devices.

[1]: https://lists.freedesktop.org/archives/systemd-devel/2014-February/017362.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/distro/include/init-manager-systemd.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 595d1f2644..8f45a87b50 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -5,3 +5,4 @@ VIRTUAL-RUNTIME_init_manager ??= "systemd"
 VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
 VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
 VIRTUAL-RUNTIME_dev_manager ??= "systemd"
+KERNEL_FEATURES:append = " cfg/systemd.scc"
-- 
2.34.1


