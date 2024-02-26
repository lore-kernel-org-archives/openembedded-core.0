Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C376C54798
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 03:03:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12978.1708916620139932312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 19:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QQitMG+e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27867f534e=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41Q2fRNi026318
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 03:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=eGObO
	1fS+ALvsE+x6woC2gTz9NYdZ2RZnpUPJ+I9JtI=; b=QQitMG+etrSLOR65xI863
	WBFAtO4bL5b1pi004LrzWk0rdAvxExXmyU+iaZVLsQ99uPXHbY0DQ0yVSgYT6NRi
	rOJhTWYmH/lAaeuihJBIur0gCdtdUAfUlVIpxyNkQ20aKnNTIeKvrGAqa5SHebLt
	8lZlkIjsDV9+OLiGwGC+hxwu5N4nWnhGKiiEz81bs4x12ZFLzG1VM/IVwwO401EX
	+n0qoELhXt0Irtlmxaxmdn3WhdUF8+JSCFkRS/Ozkdz48Bx4RirXywB2qFnmNtOF
	scAdkrop4QA6xF+MpLjxhewVsL+NOuDsDCxYH+0GLFwIIoDTuRarJ8LGndmGVHKq
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf5nx1g31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 03:03:39 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 19:03:36 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] bind: Upgrade 9.18.19 -> 9.18.24
Date: Mon, 26 Feb 2024 03:03:21 +0000
Message-ID: <20240226030321.819031-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 9twB-gCLawZ8N3Dj88uf0WKjS8yuy8LL
X-Proofpoint-ORIG-GUID: 9twB-gCLawZ8N3Dj88uf0WKjS8yuy8LL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_01,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 03:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196177

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes security fixes for - CVE-2023-4408, CVE-2023-5517,
CVE-2023-5679, CVE-2023-50868 and CVE-2023-50387

Changelog:
=========
https://gitlab.isc.org/isc-projects/bind9/-/blob/v9.18.24/CHANGES

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../bind/{bind_9.18.19.bb => bind_9.18.24.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.19.bb => bind_9.18.24.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.19.bb b/meta/recipes-connectivity/bind/bind_9.18.24.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.19.bb
rename to meta/recipes-connectivity/bind/bind_9.18.24.bb
index a829cc566d..fbbebe89ad 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.19.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.24.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "115e09c05439bebade1d272eda08fa88eb3b60129edef690588c87a4d27612cc"
+SRC_URI[sha256sum] = "709d73023c9115ddad3bab65b6c8c79a590196d0d114f5d0ca2533dbd52ddf66"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.40.0


