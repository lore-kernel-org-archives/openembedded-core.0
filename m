Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.83])
 by mx.groups.io with SMTP id smtpd.web12.1866.1601395087361379149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 08:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=ZxIKJTB3;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.237.83, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVsL4pknUkPrYJMOX3LnVqIRhWSwf4wEpVDvxLSfLSpierNThZELcLsCm09EjtS7mERNArjOv7uBXQ937hv5WdcrXVCKGWu94p0EPPdf6fAECAVxXiHO0mNDeqgJ3FhVg/p0ofer1DWyoA94ROClj2rEGGoFq6ix4GxjlWlfhN8BqKTma+Gnowa7jpJ+p0Pm2uN/HpryL0l7Sbf4iwOz5O5mnJM4KdXCE1W8TNw5C0Jwx2wYTIhH8OD0D01DKpxpHBqxo9hcqRuP3r/B+xQ5vs+37fdsm1kvUo6w0VrSBPJ7wZ7xuWWL/Xr269khG78sdVCeN1b75I3HteTtDVkcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyBttsOz4mDQrz1ZzVlK+7dCxIFh11+z4c+T0JvXhKQ=;
 b=jdfH8f6zNbw5P089L7pDfLn1+EoaOl0EI/XMzTWm2JVc6+hy16lUvEXub6S4gSRyXC4O7eEuSvBGBXxWF+8Cy2qELbJtMfelOLtnNIOLtmuCqsxLfH1G+CmWm77vXl0IxXUf/ON5K2dv8/0NAFLx9/feen6iJTgqjXtfHJdk1PZBJ/+WjG21slseuvSZ/4FIhoE2F3m09S12KJwnn23YLQ9ig4qgQKimeoqu/WMHAMZ4RT87mbaAak3/NTbW6qRmeZKm5wo6z+o1OLK6I3RFEHLRgNa8EK3Nc9Ffiu/bRA6saqkNoZdukH0zcL0uCQIP8JWkNCLuytpGhNs63YGvAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyBttsOz4mDQrz1ZzVlK+7dCxIFh11+z4c+T0JvXhKQ=;
 b=ZxIKJTB3WWxBiLyW/o8PcZMTQL0nP7sxqxEbjN0FiZykd+UNFYN+ttwH502JhQhVIA93FbCN/x4sISItpuB96jKOtjPRClfz/ZxYRMzGgob+MqvSvCrBjyW/iXY+sunBYvNnw384yJT4HnRMVCo2fEUMtwVDEcqHX30/CO+BwxxLv+ik6vftc4lL2lNHztTURyBfjNXydqvRdNhViJgb0ESgveSk7CSwYG73u1JXESjmDx8+GVK4G0881NzX9n6vRV48ndSYhxM/De9wa0h4vZfo/TfAXD9h9QHRpbsVwPCd3TlxLU5Akdl1UgV4QNNq+eeo6BEkICcPKAQXtZX8Zw==
Received: from DM5PR13CA0022.namprd13.prod.outlook.com (2603:10b6:3:23::32) by
 BYAPR12MB2838.namprd12.prod.outlook.com (2603:10b6:a03:6f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.25; Tue, 29 Sep 2020 15:58:06 +0000
Received: from DM6NAM12FT043.eop-nam12.prod.protection.outlook.com
 (2603:10b6:3:23:cafe::3d) by DM5PR13CA0022.outlook.office365.com
 (2603:10b6:3:23::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.18 via Frontend
 Transport; Tue, 29 Sep 2020 15:58:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.34) by
 DM6NAM12FT043.mail.protection.outlook.com (10.13.179.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.14 via Frontend Transport; Tue, 29 Sep 2020 15:58:05 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server id
 15.1.2044.4; Tue, 29 Sep 2020 09:57:52 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 1/2] cve-check: introduce CVE_CHECK_RECIPE_FILE variable to allow changing of per-recipe check file
Date: Tue, 29 Sep 2020 11:57:45 -0400
Message-ID: <20200929155746.101021-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg3.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3acf97c9-0882-4ccb-b8ed-08d864907400
X-MS-TrafficTypeDiagnostic: BYAPR12MB2838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR12MB2838FAE503FA82E47609A37F8B320@BYAPR12MB2838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1GzGPLFvTjOTAOiDcGtgt1umS1g9jvUFkrL17SxxxyN7k726OHGVrUjKYxTIoytHH235pPGl0s/mC3Pr51uStSoohNzd566lpERql4kIoj0lYv6jz6JoaQ6pnPva8SBy9RaCLRhL2aE+Hen/JhdiwxWPjGDYt9z0USTrbTzE0hvYz0KCi3ydUyVvI1siErKA4Jqqy6c2Ibmw6vKrofiUYwGJ+E67R2zX5Vt7sowTML2Espa+ePYL3QxvApgAtjVGDR/JiVkOwCTZco5c2CVJ5mZQSU6DViV1BTe17G6YC5/qm7/FggLwA+HvpR/CMztwRTaYdbifmgG4z4GwTS8zzJWFOsRh+nj+6wMslIFPq7I/OyOzvaHa8fYk7OdonKfvKjrYmx2GH9qzWd16J3cirA+iM8sU8lU5nWwPbra2X6DHkMbgZdCqhJn1LKqI8NJAYFJJzbP7btWluaY2WtCEat/CEoNy+n4MvGCaLB4TIdY=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(29502001)(46966005)(83380400001)(86362001)(44832011)(356005)(7636003)(47076004)(82310400003)(70206006)(82740400003)(5660300002)(1076003)(6916009)(8676002)(107886003)(426003)(336012)(316002)(4326008)(2906002)(36906005)(26005)(186003)(36756003)(6666004)(956004)(2616005)(8936002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 15:58:05.6008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acf97c9-0882-4ccb-b8ed-08d864907400
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM6NAM12FT043.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2838
Content-Type: text/plain

The addition of this variable also makes it possible to change the
output suffix of the check files, e.g. in local.conf:

CVE_CHECK_MANIFEST_append = ".txt"
CVE_CHECK_RECIPE_FILE_append = ".txt"

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes/cve-check.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 02fef7c205..df28a93687 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -36,6 +36,7 @@ CVE_CHECK_SUMMARY_FILE_NAME ?= "cve-summary"
 CVE_CHECK_SUMMARY_FILE ?= "${CVE_CHECK_SUMMARY_DIR}/${CVE_CHECK_SUMMARY_FILE_NAME}"
 
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
+CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
 CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
@@ -118,7 +119,7 @@ python cve_check_write_rootfs_manifest () {
     import shutil
 
     if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-        deploy_file = os.path.join(d.getVar("CVE_CHECK_DIR"), d.getVar("PN"))
+        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
         if os.path.exists(deploy_file):
             bb.utils.remove(deploy_file)
 
@@ -355,9 +356,8 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
         f.write(write_string)
 
     if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-        cve_dir = d.getVar("CVE_CHECK_DIR")
-        bb.utils.mkdirhier(cve_dir)
-        deploy_file = os.path.join(cve_dir, d.getVar("PN"))
+        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
+        bb.utils.mkdirhier(os.path.dirname(deploy_file))
         with open(deploy_file, "w") as f:
             f.write(write_string)
 
-- 
2.17.1

