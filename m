Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98E9EE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 08:37:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.54025.1694421466874079739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 01:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LcA6hylU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=761878e5db=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B6U2Uu029615
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 01:37:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Xa1cj
	uAmkTCgGT+axEa5HoY8ZGlpfVxzs1f86fX244k=; b=LcA6hylUWyXHRoAN1H2Pu
	DU968ZFYaihGqSzp8beNHryyHYYszBJLOMujAiLFF/RJ/1l/okwkkKWkBbE8iHAI
	KWJJyZLLAdW+A3yFq6y111rWY0XcUhmIRMgOSUGmlvHj6947WA3m30Y2TAM8Hbvv
	wHjzVOmbUjX3NGIRw3wWrW1CbyggMziecTYmDqFmBfjYxoPuGi1cOjqM6Py98TZn
	9KndbfXiwii5ScmM+3RmJOk74vYMRvOiuAWK2cI6qiZSKhRJo5l68/liswSR3EjH
	ZE2OMDXYR91KFnEbrsgDFBjjh61fe1kJeYoqXDrzvLnAyyXw1vxuXV4qTEW8zabg
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t0m009a4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 01:37:46 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 11 Sep 2023 01:37:44 -0700
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 11 Sep 2023 01:37:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] libxcrypt-compat: Remove libcrypt.so to fix conflict with libcrypt
Date: Mon, 11 Sep 2023 01:37:44 -0700
Message-ID: <cover.1694421409.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7dM3z7y-ys2GmHT-iFdOg80FjSj7Y4z5
X-Proofpoint-ORIG-GUID: 7dM3z7y-ys2GmHT-iFdOg80FjSj7Y4z5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=716
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309110078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 08:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187484

The following changes since commit 03d37854b1dacbecd2c522821c59ef01d9bd305c:

  build-appliance-image: Update to master head revision (2023-09-10 09:03:42 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib rbt/crypt
  https://git.openembedded.org/openembedded-core-contrib/log/?h=rbt/crypt

Robert Yang (1):
  libxcrypt-compat: Remove libcrypt.so to fix conflict with libcrypt

 meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.39.0


