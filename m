Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2CEEEF314
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 07:39:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39376.1772696366039605394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 23:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hDGG1TUr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7524204bd7=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254wiYU268877
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 07:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=h/xGnI5k3glvg8rR+gnk
	nnzXVOj1HHm4o7I927RXVZk=; b=hDGG1TUrpZUv1g1k4lvMEjtpkf60tCWEnXTd
	J0UjuW6qz9/kTGWbeqwvWipxQ50MUlIDEK6kvRQjYjzXy1wgZbANi+nQbnms3PW2
	IHVXpPhNLAL4fMGQKC+jnx/3h4o5kk2dDn73mkyFBYSPTNAv7zGenSLylgCj3KFO
	b177TN85ns67CK8i1YRnQuBWINjaaLAQdT2feVSDChZtKm40Ncmu5+pHPDgJZiy4
	hOIaDnIitZJvvGqJ1bc8w96orGDIHZgJTc4YdMb9Od3edKZIBkpcSN3+4TE32by/
	exfIoJ+HVGF67jJfGZoHo//J1blL1SHkCwdnPgzqZKpTJlV3Pw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvp71s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 07:39:24 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 4 Mar 2026 23:39:23 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 4 Mar 2026 23:39:22 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-imagesize: upgrade 1.4.1 -> 2.0.0
Date: Thu, 5 Mar 2026 15:39:21 +0800
Message-ID: <20260305073921.205613-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vk2EXyv08YxrmJGYAgv1Wi1Fu-4lEBd_
X-Proofpoint-ORIG-GUID: vk2EXyv08YxrmJGYAgv1Wi1Fu-4lEBd_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2MCBTYWx0ZWRfX/Xf3iF5PtLyw
 mNtxZlEqxen+AZaEur5g1AclnpVlfQ2D12nBC06MSRRhu0/84ypS7xmuW6ZrOEX6ANbmC98rUAs
 kUNePXADaST2sbzszpW0bm2abM9kRI1rdhZorEV+PURr/z2UUUelMIS9ERENOWcOPdLJVhYLKtx
 NuU8XCVR+xkMctY+bY89RRxk2gXk5uinoDoig6z5Z59nLZd9+zLdw2k2mkhQhIMdOmIX2Hi+BMX
 5/Er8nc0MidGv5pT9CYmQAeV4vu9CHfDwGd965QdRDR70EiRyyJu6ECbS3eLHf9m7RlhRObtdag
 LwswaQpE4ZP04p3gbHAO4jPIGEgnQ5cw0IsUa8WFY4kXOEwhlrbNbuGGkHcLe3qR99RHLJrw6uD
 Presbf6r0dEs0s5kQf72/d4xPStcKODobv20cYBBX47YST2mD8WyrCdOljgAw+MoELSP9S83kVh
 U/7Z6hcaxiNm7zdHTHQ==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a9332c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8 a=x6u6C_fJAAAA:20 a=t7CeM3EgAAAA:8
 a=NIVzTtW_5VSYKE1occsA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 07:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232449

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changes:
https://github.com/shibukawa/imagesize_py/compare/1.4.1...2.0.0
https://github.com/shibukawa/imagesize_py/blob/master/README.rst

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../{python3-imagesize_1.4.1.bb => python3-imagesize_2.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-imagesize_1.4.1.bb => python3-imagesize_2.0.0.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb b/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-imagesize_1.4.1.bb
rename to meta/recipes-devtools/python/python3-imagesize_2.0.0.bb
index 7d37e2be24..7430130e5f 100644
--- a/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=0c128f0f7e8a02e1b83884c0b5a41cda"
 
-SRC_URI[sha256sum] = "69150444affb9cb0d5cc5a92b3676f0b2fb7cd9ae39e947a5e11a36b4497cd4a"
+SRC_URI[sha256sum] = "8e8358c4a05c304f1fccf7ff96f036e7243a189e9e42e90851993c558cfe9ee3"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


