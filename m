Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0B7C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:38:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8510.1709105917812782965
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RuywT9wF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2788100bef=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S5UkRM022350
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=PMvEB
	y3HMsyay8fMQitlq9nkG6Kg5F9Qt1KZlcJzEbE=; b=RuywT9wFt5WMgjdxAJPBs
	1tCwMIHqDve0B51zsX1ybnsdfoswrnHdTZB451Mrdwy10TsXTCYIgt2Br0ws1NZE
	Gi4Lk2oBl8Gvg8UgT0YrMNcApoWTABVeBn18Qh4wkVvo1ietxYZ6R/OKuTbZFy6L
	07bvOpYg7T47NNz0FXzGNFodR1KFpWk+F8g3jB3NqUhp/L1XUhHSsE1Y67Vu1gmd
	LYeFaQjWNN1R3DjT8jr+pKWeEf2j1X3nSwCi2pLV73R4DszoDhMF7xXyMcHRLT0I
	+XprPPryz1GQPnzSExypfmFW2TtlBtlgduGPNNieKqPgSMe3/EOVstBjtlkoA9Qw
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e6c0ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:38:36 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 23:38:34 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] python3-cryptography{-vectors}: 42.0.2 -> 42.0.4
Date: Wed, 28 Feb 2024 07:38:18 +0000
Message-ID: <20240228073818.2520528-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: cyPjtRscxbRybRqEiJdPzUAE6GVFbB6S
X-Proofpoint-ORIG-GUID: cyPjtRscxbRybRqEiJdPzUAE6GVFbB6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_04,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=824 clxscore=1015
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402280057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196374

From: Soumya Sambu <soumya.sambu@windriver.com>

Changelog:
==========
42.0.4 - 2024-02-20
* Fixed a null-pointer-dereference and segfault that could occur
when creating a PKCS#12 bundle. Credit to Alexander-Programming for
reporting the issue. CVE-2024-26130
* Fixed ASN.1 encoding for PKCS7/SMIME signed messages. The fields
SMIMECapabilities and SignatureAlgorithmIdentifier should now be
correctly encoded according to the definitions in RFC 2633 RFC 3370.

42.0.3 - 2024-02-15
* Fixed an initialization issue that caused key loading failures for
some users.

https://cryptography.io/en/latest/changelog/#v42-0-4

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 ...vectors_42.0.2.bb => python3-cryptography-vectors_42.0.4.bb} | 2 +-
 ...n3-cryptography_42.0.2.bb => python3-cryptography_42.0.4.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_42.0.2.bb => python3-cryptography-vectors_42.0.4.bb} (91%)
 rename meta/recipes-devtools/python/{python3-cryptography_42.0.2.bb => python3-cryptography_42.0.4.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_42.0.4.bb
index 94fbc94c55..9500e890f3 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "adcdccf5d9ee661a9602ad21d2525f678ba07a6e768ce79835994e208bab0e16"
+SRC_URI[sha256sum] = "d6b707d238a5e2390c3dae7761b997b68c2b8c0723ed24fc13f832bcc8739945"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.4.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography_42.0.4.bb
index c21c4d1a03..e864d6ce4f 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433219dc8c93827c57eab6cf888"
+SRC_URI[sha256sum] = "831a4b37accef30cccd34fcb916a5d7b5be3cbbe27268a02832c3e450aea39cb"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
-- 
2.40.0


