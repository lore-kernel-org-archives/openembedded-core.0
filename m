Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF10D116E8
	for <webhook@archiver.kernel.org>; Sat, 26 Oct 2024 03:25:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4381.1729913124930974082
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 20:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=002900eeaf=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q3OaKL000751;
	Fri, 25 Oct 2024 20:25:23 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42c8240wrm-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 25 Oct 2024 20:25:23 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 20:25:20 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 20:25:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>
Subject: [oe-core][PATCH 6/6] Add SPDX 3.0 include source case for work-share
Date: Fri, 25 Oct 2024 20:25:19 -0700
Message-ID: <20241026032519.1968518-7-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241026032519.1968518-1-hongxu.jia@windriver.com>
References: <20241026032519.1968518-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=UrgxNPwB c=1 sm=1 tr=0 ts=671c6123 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=24AZYWMyAAAA:8 a=t7CeM3EgAAAA:8 a=2V6DY6BgAAAA:8 a=YKlqnSHKsa4dvJv7hPcA:9 a=bG88sKzkDEFeXWNnvthB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-ORIG-GUID: RJTnqqDQKNSa5F-9thGXL5R_t6xVrvxd
X-Proofpoint-GUID: RJTnqqDQKNSa5F-9thGXL5R_t6xVrvxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410260026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Oct 2024 03:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206384

Build gcc and check gcc-14.2.0/README in objset is available

$ oe-selftest -r spdx.SPDX30Check.test_gcc_include_source
...
2024-10-26 01:24:57,063 - oe-selftest - INFO - test_gcc_include_source (spdx.SPDX30Check.test_gcc_include_source)
2024-10-26 01:28:24,204 - oe-selftest - INFO - The spdxId of gcc-14.2.0/README in gcc.spdx.json is http://spdx.org/spdxdocs/gcc-f2eaeb0d-b54b-53ba-899a-8c36c21139bf/88d5068ffd41e5ea6b4e0dd390b23bf499bb2b6674a41e09eaf2a887eced16c8/sourcefile/42
2024-10-26 01:28:26,369 - oe-selftest - INFO -  ... ok
2024-10-26 01:28:33,315 - oe-selftest - INFO - ----------------------------------------------------------------------
2024-10-26 01:28:33,316 - oe-selftest - INFO - Ran 1 test in 216.457s
2024-10-26 01:28:33,316 - oe-selftest - INFO - OK
2024-10-26 01:28:45,254 - oe-selftest - INFO - RESULTS:
2024-10-26 01:28:45,254 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check.test_gcc_include_source: PASSED (209.31s)
2024-10-26 01:28:45,260 - oe-selftest - INFO - SUMMARY:
2024-10-26 01:28:45,260 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 216.457s
2024-10-26 01:28:45,260 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index be595babb3..8384070219 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -110,6 +110,7 @@ class SPDX3CheckBase(object):
                     "SDKMACHINE",
                     "SDK_DEPLOY",
                     "SPDX_VERSION",
+                    "SSTATE_PKGARCH",
                     "TOOLCHAIN_OUTPUTNAME",
                 ],
                 target_name,
@@ -136,6 +137,34 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
             "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/base-files.spdx.json",
         )
 
+
+    def test_gcc_include_source(self):
+        import oe.spdx30
+
+        objset = self.check_recipe_spdx(
+            "gcc",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/gcc.spdx.json",
+            extraconf=textwrap.dedent(
+                """\
+                SPDX_INCLUDE_SOURCES = "1"
+                """
+            ),
+        )
+
+        gcc_pv = get_bb_var("PV", "gcc")
+        filename = f'gcc-{gcc_pv}/README'
+        found = False
+        for software_file in objset.foreach_type(oe.spdx30.software_File):
+            if software_file.name == filename:
+                found = True
+                self.logger.info(f"The spdxId of {filename} in gcc.spdx.json is {software_file.spdxId}")
+                break
+
+        self.assertTrue(
+            found,
+            f"Not found source file {filename} in gcc.spdx.json\n"
+        )
+
     def test_core_image_minimal(self):
         objset = self.check_recipe_spdx(
             "core-image-minimal",
-- 
2.25.1


