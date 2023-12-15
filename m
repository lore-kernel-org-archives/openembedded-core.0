Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB49C41535
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 13:47:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.62449.1702648048656939711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 05:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YN6QsVic;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07134bcac9=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BF9rmE5015843
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 05:47:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Iv+ZG
	rsVnjqQh3AYZh3+ysvmGIqTPadicvmKQI+qa6U=; b=YN6QsVicsSVzOU0iK3+DE
	e+90TmhJ7agNVNq6ey+7sFOtT2Qm01gKCWduXlDh0jgc+MKxYuT/iZRE+U4CukTN
	U1AfWkskH1J1hk8Ipk1YYIRC0fv/8sZP9Izkwd5EDuBDYCvyVl3Pi+Ph8otjdkSS
	HRnzFWliRsrgqycPhPIVaManpn8GxdIYN4AB6xnzq4HmRgu7Sx83hALK85hhx51/
	kht97wYRnbjvVNIta0pywIv05JimJabUU9TDBlcpOcm+5Vrv5en5AMgLxUg2pqDu
	/L1zSg/vjYg+15yWiAzF3qIXABgG0vsLIeJ0JBIiObRYLqiLoaheg4LU6RBBuNV3
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr7dhm7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 05:47:28 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 05:47:33 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 05:47:33 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] nfs-utils: Update Upstream-Status
Date: Fri, 15 Dec 2023 05:47:26 -0800
Message-ID: <cover.1702647994.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: rICDfveDS_YMqV7_nKBIgjTlPu5Gr0bI
X-Proofpoint-GUID: rICDfveDS_YMqV7_nKBIgjTlPu5Gr0bI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=791
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 13:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192432

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit ae642a4b038c6946e6c8aa9778bf09099d938a31:

  sstate: Fix dir ownership issues in SSTATE_DIR (2023-12-15 11:14:29 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/nfs-utils
  https://github.com/robertlinux/yocto/tree/rbt/nfs-utils

Robert Yang (1):
  nfs-utils: Update Upstream-Status

 .../0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.42.0


