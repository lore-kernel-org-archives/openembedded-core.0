Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E675C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 04:29:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5224.1749702539972418508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 21:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8258012de4=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C2YXlS001317
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 21:28:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq4525g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 21:28:58 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 11 Jun 2025 21:28:58 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 11 Jun 2025 21:28:56 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  1/1] python3-cryptography: fix IndentationError caused by CVE-2024-26130 fix
Date: Thu, 12 Jun 2025 09:58:55 +0530
Message-ID: <20250612042855.1377855-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=684a578a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=pwiSL_CrTg9_fvnJRv4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _n6KavzmZlOTh4di4vavxYqvxLh8WD3k
X-Proofpoint-ORIG-GUID: _n6KavzmZlOTh4di4vavxYqvxLh8WD3k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAzMiBTYWx0ZWRfX/KAL9RHeo2uA NpSpX9mW/fBZ4byzb49RlAWZ71Fn3L/kKK0cd8OrSgIrEvQL6jrzt1hmwCj2VNCqrXA4KSv1kFq zdbzC0vslFwHBF/gyPJKLStOnW1WGLCfIQfHVhCY6/4ncv6U4aTxr0g6PyVgVxlef5ApVTmELOr
 OPmxotfQcAsnNOI3oC6RZDsJY3bA6KFEoztp5XORRbCyG46CpY3zDlcaauPouJKsN5LEqO+IqXF YzabTHSN3X6O++XjxyYKohL60adT/RaQjAVzpxB4XicH64XynWXTY702MNhGNEV8LL0CXYWG4zC 17NQ0bwZBFXsC4/0a5ky3RVGB7WbvSb/o1II1gK4bZ1Ucnoh39FKTYBXFFdAz68Ri1nVwD4Nc1M
 /T74IpYpiw/6sgWBe9uPDHrVOzoNoUUKwF/6JPnpY6zFlu6HGdEUtJmnvp5xBL46b/AHP6lQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=587
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506120032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 04:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218475

From: Archana Polampalli <archana.polampalli@windriver.com>

fixes:

   File "/usr/lib/python3-cryptography/ptest/tests/hazmat/primitives/test_pkcs12.py", line 28
       @pytest.mark.supported(
   IndentationError: unexpected indent

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...st_pkcs12.py-correct-the-Indentation.patch | 60 +++++++++++++++++++
 .../python/python3-cryptography_36.0.2.bb     |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py-correct-the-Indentation.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py-correct-the-Indentation.patch b/meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py-correct-the-Indentation.patch
new file mode 100644
index 0000000000..09e540c887
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py-correct-the-Indentation.patch
@@ -0,0 +1,60 @@
+From b737b6609cd6394c895258e0ae9b341650747918 Mon Sep 17 00:00:00 2001
+From: Archana Polampalli <archana.polampalli@windriver.com>
+Date: Tue, 10 Jun 2025 11:52:53 +0530
+Subject: [PATCH] test_pkcs12.py: correct the Indentation
+
+Upstream-Status: Pending
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ tests/hazmat/primitives/test_pkcs12.py | 34 +++++++++++++-------------
+ 1 file changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/tests/hazmat/primitives/test_pkcs12.py b/tests/hazmat/primitives/test_pkcs12.py
+index 8af4c93..1084038 100644
+--- a/tests/hazmat/primitives/test_pkcs12.py
++++ b/tests/hazmat/primitives/test_pkcs12.py
+@@ -25,23 +25,23 @@ from ...doubles import DummyKeySerializationEncryption
+ from ...utils import load_vectors_from_file
+ 
+ 
+-   @pytest.mark.supported(
+-       only_if=lambda backend: backend._lib.Cryptography_HAS_PKCS12_SET_MAC,
+-       skip_message="Requires OpenSSL with PKCS12_set_mac",
+-   )
+-   def test_set_mac_key_certificate_mismatch(self, backend):
+-       cacert, _ = _load_ca(backend)
+-       key = ec.generate_private_key(ec.SECP256R1())
+-       encryption = (
+-           serialization.PrivateFormat.PKCS12.encryption_builder()
+-           .hmac_hash(hashes.SHA256())
+-           .build(b"password")
+-       )
+-
+-       with pytest.raises(ValueError):
+-           serialize_key_and_certificates(
+-               b"name", key, cacert, [], encryption
+-           )
++    @pytest.mark.supported(
++        only_if=lambda backend: backend._lib.Cryptography_HAS_PKCS12_SET_MAC,
++        skip_message="Requires OpenSSL with PKCS12_set_mac",
++    )
++    def test_set_mac_key_certificate_mismatch(self, backend):
++        cacert, _ = _load_ca(backend)
++        key = ec.generate_private_key(ec.SECP256R1())
++        encryption = (
++            serialization.PrivateFormat.PKCS12.encryption_builder()
++            .hmac_hash(hashes.SHA256())
++            .build(b"password")
++        )
++
++        with pytest.raises(ValueError):
++            serialize_key_and_certificates(
++                b"name", key, cacert, [], encryption
++            )
+ 
+ @pytest.mark.skip_fips(
+     reason="PKCS12 unsupported in FIPS mode. So much bad crypto in it."
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
index 83381f225c..173e47b463 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
@@ -20,6 +20,7 @@ SRC_URI += " \
     file://CVE-2023-23931.patch \
     file://CVE-2023-49083.patch \
     file://CVE-2024-26130.patch \
+    file://0001-test_pkcs12.py-correct-the-Indentation.patch \
 "
 
 inherit pypi python_setuptools3_rust
-- 
2.40.0


