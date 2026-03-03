Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54B4E67A7D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:56:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12823.1772521011409026968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aLIDGakm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6236m3Nv3923275
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 06:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=iSHcqEqDPNNiEdQ/ZbieZ3q67R00wc0ie7cQ6EiN1CE=; b=aLIDGakmdJ04
	9sYvK1qU94QaCfMxysbJzOOCZfpR7crqc2lLZvHTAoxPi/fFS3rq3RfWNS/P4W5K
	OCgxuwzz/XqcccK1xvkSXCZgD2v5y1nBwH+HZ62cmGN3sSVW9Ub8kEtGCtu1LUGO
	jZ1gIrwwg7rqriZhRe9cuc/15YOM2dw4P4WjZsozi/rcBCUrTO/Aet9n2EOfdjRh
	Zzcc4xGCi3yC8vbELeTKKYjAgHc6PYSJJ5i5ththkzh94x9VOkPgpwpPik5+fRhb
	aXRePBoeBYGMaFxBv2S+Lw+AuKR29/IFaPKTZcSvwsRPtxtd5VzWRNnXap1XoXE2
	fSk3n20+5w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvkdfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:49 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:48 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 08/19] python3-cryptography{-vectors}: 46.0.4 -> 46.0.5
Date: Tue, 3 Mar 2026 14:56:29 +0800
Message-ID: <20260303065640.2541884-8-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4MVDTtMCv4RoqD0I-fvWiMBJRYAo2DXD
X-Proofpoint-ORIG-GUID: 4MVDTtMCv4RoqD0I-fvWiMBJRYAo2DXD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX9X3Crqw+q9aF
 m/NRoCeUPQfFBpIUpg/x+982EJ5FQ5rJk748J+BPzDoBtD39KSh7/Mw0CYR3Wx7w6npotcKzyvL
 ZSowHiqStioHpCAaVmyXD4+6WUZTc+WNmyO3kVAjYZXkJLTZKPFDGgfU9cQ/Su6NnFndULvC1hw
 sLh0uGWrVmqbPUINQ+VxNAyx/Fhnf/9chryUE7d+Kj4UEnyc4ik0HzqfdraxZmA2+DUfn5AzXRE
 66beYwgLfDYN7o2DSk8juwczPPPxdY8NCFQGeGcK6F8MYAF2q3/qqFImRTszgce4IwaPRj1yAr+
 DGkfkVFS98uZKDm4NzbtLWtbyJUMhUzCcXrZ9rw/pz70JPzuPIudgw1EMqjMbk6yT/P09TqQQlU
 /1hdKNWOf9x2O/Z1bMLREI2SSIr4keWYffzVfOV9FiFLpZeYRmqVXZ02wK80uG6aa9NUuTnEbHr
 qvZKD1EdJvKE01w9zAQ==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a68632 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=BmRmT93uAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=wcMQMrKKAAAA:8 a=LpNgXrTXAAAA:8 a=k-42gJp3AAAA:8 a=B_hWDmt6gZDQ7Ad6q5IA:9
 a=_-qcN2y09MP-2zy9:21 a=FdTzh2GWekK77mhwV6Dw:22 a=ruBZECXodCprBXHM8TkG:22
 a=LqOpv0_-CX5VL_7kjZO3:22 a=uCSXFHLys93vLW5PjgO_:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232246

46.0.5 - 2026-02-10 [1]

- An attacker could create a malicious public key that reveals portions of your
  private key when using certain uncommon elliptic curves (binary curves).
  This version now includes additional security checks to prevent this attack.
  This issue only affects binary elliptic curves, which are rarely used in
  real-world applications. Credit to XlabAI Team of Tencent Xuanwu Lab and Atuin
  Automated Vulnerability Discovery Engine for reporting the issue. CVE-2026-26007

- Support for SECT* binary elliptic curves is deprecated and will be removed in
  the next release.

[1] https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst#4605---2026-02-10

Backport 0001-bump-uv_build-to-0.10.0-14271.patch to fix compile failure
...
| ERROR Missing dependencies:
|       uv_build<0.10.0,>=0.7.19
| WARNING: exit code 1 from a shell command.
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-vectors.bb    |  6 +++--
 .../0001-bump-uv_build-to-0.10.0-14271.patch  | 27 +++++++++++++++++++
 ...ml-bump-uv_build-version-requirement.patch |  4 +--
 .../python/python3-cryptography.bb            |  2 +-
 ...toml-remove-benchmark-disable-option.patch |  4 +--
 6 files changed, 37 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 789ce89e53..4e4434bd66 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "46.0.4"
+PV = "46.0.5"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 1408b6b010..3ed3160072 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,8 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI += "file://0001-pyproject.toml-bump-uv_build-version-requirement.patch"
-SRC_URI[sha256sum] = "fb8e489f5688d9751fd9631d4be0a0df3275698e78d6d753c1b8cf3ce4127c78"
+SRC_URI += "file://0001-pyproject.toml-bump-uv_build-version-requirement.patch \
+            file://0001-bump-uv_build-to-0.10.0-14271.patch \
+"
+SRC_URI[sha256sum] = "ffbccee9455201c01b37c63d65d9f83b362d40c2bed9caac248ebbdfa4e4fc7c"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch
new file mode 100644
index 0000000000..9fa4d1cd47
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch
@@ -0,0 +1,27 @@
+From 1f6626557e4766ffa40874984f1e29197ed66eb8 Mon Sep 17 00:00:00 2001
+From: Ridai Govinda Pombo <beholderseye@vivaldi.net>
+Date: Tue, 3 Mar 2026 10:38:12 +0800
+Subject: [PATCH] bump uv_build to 0.10.0 (#14271)
+
+Co-authored-by: Ridai Govinda Pombo <beholders.eye@disroot.org>
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/14cfa5757461d5c228600fc0104ac0ef08ea15d9]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index f01d2c1..f7af712 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["uv_build>=0.7.19,<0.10.0"]
++requires = ["uv_build>=0.7.19,<0.11.0"]
+ build-backend = "uv_build"
+ 
+ [project]
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
index 23af7c200d..6faaf1051d 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
@@ -1,4 +1,4 @@
-From f2f6b2b391a34a10ad5d94f5c8c70c32a72a34a3 Mon Sep 17 00:00:00 2001
+From 6d4c14a2781fb02903fd4d59f638cf72ee370b8d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 20:20:13 +0100
 Subject: [PATCH] pyproject.toml: bump uv_build version requirement
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 9beed0d..0c421f3 100644
+index 2ed12a3..f01d2c1 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 036bfd2117..fc5cb50b02 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "bfd019f60f8abc2ed1b9be4ddc21cfef059c841d86d710bb69909a688cbb8f59"
+SRC_URI[sha256sum] = "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 866b7a058f..5c2e3c53ba 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 1fb7785f80037fa1258added61470d0c73fd3222 Mon Sep 17 00:00:00 2001
+From 6d6fbe77732ce3c4d2dcf3a5f75bb20ea352bf4a Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index b3d8c31..6593057 100644
+index 95ced11..75bfcbb 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -134,7 +134,7 @@ exclude = [
-- 
2.34.1


