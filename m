Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675CFD5E391
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 03:07:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30168.1731208064713092567
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Nov 2024 19:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10446b0cf6=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AA30C06012513;
	Sat, 9 Nov 2024 19:07:43 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84prdk8-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 09 Nov 2024 19:07:43 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 9 Nov 2024 19:07:41 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sat, 9 Nov 2024 19:07:41 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <JPEWhacker@gmail.com>
Subject: [PATCH 3/3] oeqa/selftest: Add SPDX 3.0 include source cases for core_image_minimal build
Date: Sat, 9 Nov 2024 19:07:41 -0800
Message-ID: <20241110030741.4108407-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241110030741.4108407-1-hongxu.jia@windriver.com>
References: <20241110030741.4108407-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IrVMc6/g c=1 sm=1 tr=0 ts=6730237f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=X7M7THNEruu-k4-VEk8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9Fzfds3lXxXEB3_fVoN7mT7MEAtJ_Eui
X-Proofpoint-GUID: 9Fzfds3lXxXEB3_fVoN7mT7MEAtJ_Eui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-09_25,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411100026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 03:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206914

$ oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_include_source
2024-11-09 09:17:54,600 - oe-selftest - INFO - Adding layer libraries:
2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta/lib
2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta-yocto-bsp/lib
2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta-selftest/lib
2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/meta-openembedded/meta-oe/lib
2024-11-09 09:17:54,602 - oe-selftest - INFO - Checking base configuration is valid/parsable
2024-11-09 09:17:56,653 - oe-selftest - INFO - Adding: "include selftest.inc" in path-to/build_spdx3-st/conf/local.conf
2024-11-09 09:17:56,653 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2024-11-09 09:17:56,653 - oe-selftest - INFO - test_core_image_minimal_include_source (spdx.SPDX30Check.test_core_image_minimal_include_source)
2024-11-09 10:41:16,654 - oe-selftest - INFO - Keepalive message
2024-11-09 11:37:53,091 - oe-selftest - INFO -  ... ok
2024-11-09 11:55:18,638 - oe-selftest - INFO - ----------------------------------------------------------------------
2024-11-09 11:55:18,638 - oe-selftest - INFO - Ran 1 test in 9442.187s
2024-11-09 11:55:18,638 - oe-selftest - INFO - OK
2024-11-09 11:55:35,453 - oe-selftest - INFO - RESULTS:
2024-11-09 11:55:35,453 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check.test_core_image_minimal_include_source: PASSED (8396.65s)
2024-11-09 11:55:35,490 - oe-selftest - INFO - SUMMARY:
2024-11-09 11:55:35,490 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 9442.187s
2024-11-09 11:55:35,490 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

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


