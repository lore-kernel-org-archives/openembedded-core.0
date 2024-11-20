Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FBED6E2BB
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 05:50:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7047.1732081839565899936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 21:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10542b79f7=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK5hTS7025002;
	Tue, 19 Nov 2024 21:50:38 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7utm6-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 19 Nov 2024 21:50:38 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 19 Nov 2024 21:50:36 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 19 Nov 2024 21:50:36 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <JPEWhacker@gmail.com>,
        <hongxu.jia@windriver.com>
Subject: [oe-core][PATCH 3/3] oeqa/selftest: Add SPDX 3.0 include source cases for core_image_minimal build
Date: Tue, 19 Nov 2024 21:50:36 -0800
Message-ID: <20241120055036.1002075-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241120055036.1002075-1-hongxu.jia@windriver.com>
References: <20241120055036.1002075-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Esz_JEpg5y-3QiUKu9DxcAhdDhDwtTUR
X-Proofpoint-GUID: Esz_JEpg5y-3QiUKu9DxcAhdDhDwtTUR
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=673d78ae cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=ERMP5XZOJf7aXE5KYooA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_02,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411200041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207414

$ oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_include_source
2024-11-20 03:29:24,850 - oe-selftest - INFO - Adding layer libraries:
2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta/lib
2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta-yocto-bsp/lib
2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta-selftest/lib
2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/meta-openembedded/meta-oe/lib
2024-11-20 03:29:24,868 - oe-selftest - INFO - Checking base configuration is valid/parsable
2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: "include selftest.inc" in path-to/build_spdx3-st/conf/local.conf
2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2024-11-20 03:29:27,317 - oe-selftest - INFO - test_core_image_minimal_include_source (spdx.SPDX30Check.test_core_image_minimal_include_source)
2024-11-20 04:52:47,318 - oe-selftest - INFO - Keepalive message
2024-11-20 05:14:08,115 - oe-selftest - INFO -  ... ok
2024-11-20 05:21:12,798 - oe-selftest - INFO - ----------------------------------------------------------------------
2024-11-20 05:21:12,798 - oe-selftest - INFO - Ran 1 test in 6706.271s
2024-11-20 05:21:12,798 - oe-selftest - INFO - OK
2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS:
2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check.test_core_image_minimal_include_source: PASSED (6280.82s)
2024-11-20 05:21:32,027 - oe-selftest - INFO - SUMMARY:
2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 6706.272s
2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 8384070219..c785f5445f 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -174,6 +174,20 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
         # Document should be fully linked
         self.check_objset_missing_ids(objset)
 
+    def test_core_image_minimal_include_source(self):
+        objset = self.check_recipe_spdx(
+            "core-image-minimal",
+            "{DEPLOY_DIR_IMAGE}/core-image-minimal-{MACHINE}.rootfs.spdx.json",
+            extraconf=textwrap.dedent(
+                """\
+                SPDX_INCLUDE_SOURCES = "1"
+                """
+            ),
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
+
     def test_core_image_minimal_sdk(self):
         objset = self.check_recipe_spdx(
             "core-image-minimal",
-- 
2.25.1


