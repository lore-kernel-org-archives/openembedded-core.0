Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.45])
 by mx.groups.io with SMTP id smtpd.web11.1868.1601395088212561749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 08:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=EqcerHBc;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.92.45, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LE49HAClH3NhzVd13ouML2u86WoJnakB4A1KAYB8HbnpEiuyg56jSfnlMMWy1TUpyCKjq3lVoi5h1k6ix+gLCUyARYuiYNYnMM3FhLgV6bOrQacLiUxdCd58V0mWBHwKX7IPAyny9pr2j3hC3jt9dLGkXQb1TMAFZwiD7hBIhYKuChIiHIp9q4Jgfc4Vb0qiUg3fMYp1uOUDV/xrp9lIJXCvzk2Aq3lGyvAy/46E+9isoL25k+oKvOBcZB46or/jIi04yCJeZbOZfseXp5xryyaocUy6SfQkE8yYfU3Icmp7tBdCHDJPJULF9WM+1kz+gASK6iquofFYrYKPFKJWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3QIkGruzd1eiGm2ku33xtsT+zn9JophHSVDaHXiXis=;
 b=JzDORMMEjOhemUCq28mBbDiS83BNwN38hH5otEg3eRKl0s/8FTP5tC0EebvwtLaXE14DYijwiwSF7Rgf0vIMji/4Xi71bZ5SyYuZijW0iFvKJuxZOCw/bZJShIzMRwfiUfvL9ec4KFPbniSR9dIAWetUTVfRCNM2I0xmsqpNHlxCTjbEGZdGZobMm8+XHqBwGTX/QbIW9ZEppkU39cEuy5r9ZZF+CMFGifL59+4TrvwbcmfU5ByrMYsdLXbtnMXIvkh5vboVa3BO874zbIHyvcSJIxQsVTarfXYI0+59CUwVOg7OqlIwhWx/8kDFvSS1v0BwJZL2y0lG3cFQs//Zbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3QIkGruzd1eiGm2ku33xtsT+zn9JophHSVDaHXiXis=;
 b=EqcerHBc57wdF/hWSGg2OYuIoslEYIcSarxD8jrL0Uk2MLPHV0BZYSsYskLpyHHNc2EXVzZjyFehbH5cw4EFy1qRw1WVPpTjGjRcCse/G1Hqj/BNm5n4IEPYam29/tJYl9sdvkv6VnSzEwnmnU5dfXsTmrj3NCwohScS3h/EPfOjHoQSzFxxj0bvSjT8W+rQui8klavJlBXdvUeGy/xECCutj90M8HnAK7pBGMyyarm4/o8y1WD/fzBpSGjerfXxKBSXxn3vOM5pSXhUycMpwGwxk39DqsomWETXhXdVLDxNX4ArJva3880q7MRD/PdgbfzbiPGDDAKOlPL9wpT8Qw==
Received: from DM6PR11CA0021.namprd11.prod.outlook.com (2603:10b6:5:190::34)
 by MN2PR12MB3709.namprd12.prod.outlook.com (2603:10b6:208:167::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Tue, 29 Sep
 2020 15:58:06 +0000
Received: from DM6NAM12FT013.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::3b) by DM6PR11CA0021.outlook.office365.com
 (2603:10b6:5:190::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend
 Transport; Tue, 29 Sep 2020 15:58:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.34) by
 DM6NAM12FT013.mail.protection.outlook.com (10.13.178.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.14 via Frontend Transport; Tue, 29 Sep 2020 15:58:06 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server id
 15.1.2044.4; Tue, 29 Sep 2020 09:57:53 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 2/2] cve-check: add CVE_CHECK_REPORT_PATCHED variable to suppress reporting of patched CVEs
Date: Tue, 29 Sep 2020 11:57:46 -0400
Message-ID: <20200929155746.101021-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929155746.101021-1-chris.laplante@agilent.com>
References: <20200929155746.101021-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg3.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bff6f2e-419b-4b0d-001f-08d86490745d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3709:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MN2PR12MB3709789C586CB99F11270A2A8B320@MN2PR12MB3709.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bmyNzTOazo8HfIkL0LpJLxVWiKCV5IMl6GTbKK4Wxk9jlgKEMJDcA1LpsLLQ3w3WQELG0qibWIsF/+qxp3sQFsIdf/VFLJAhNsISW4kCGnyiv5qysnHpfpVZry3UNB17CTMyffkDpG3FTvoifnnoXJ+4M4gsfQAXAtcNVtTh7b4f6ZLvHc0XJrjttRLNDMs0SF9SDVIU0K501l53xPuhztYNc7V458OJ8EAbGJQub72pN61BLWWLmC5wN2/mBtFl3xSeZcH0nwn49CX6uM2DDUU8C0Cqk64GQbd42yaTmmLmiajxkkOTVwUY9Z29dquI2553jPtxm+Wr+SVZeMtVybBkRQ1Y2atkESxNexTJ5XarutuUF137BPJ7KVNlJ4ZS0G87AZM0RJ4fFOc0CvOK+awcoqIZD3p0NIalu1NRip7F3VGTSj2EyM30xAf/IuFm+VrohkqFwlbQtJRzXBPykT+86ceE2NJxJ6Sm88GGNg4=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(29502001)(46966005)(478600001)(5660300002)(4326008)(107886003)(426003)(336012)(956004)(2616005)(186003)(8676002)(8936002)(26005)(36906005)(2906002)(6916009)(86362001)(316002)(36756003)(70206006)(82310400003)(7636003)(356005)(44832011)(6666004)(83380400001)(47076004)(82740400003)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 15:58:06.2046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bff6f2e-419b-4b0d-001f-08d86490745d
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM6NAM12FT013.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3709
Content-Type: text/plain

Default behavior is not changed. To suppress patched CVEs, set:

        CVE_CHECK_REPORT_PATCHED = ""

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes/cve-check.bbclass | 38 ++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index df28a93687..25cefda92e 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -41,14 +41,16 @@ CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
+CVE_CHECK_REPORT_PATCHED ??= "1"
+
 # Whitelist for packages (PN)
 CVE_CHECK_PN_WHITELIST ?= ""
 
 # Whitelist for CVE. If a CVE is found, then it is considered patched.
 # The value is a string containing space separated CVE values:
-# 
+#
 # CVE_CHECK_WHITELIST = 'CVE-2014-2524 CVE-2018-1234'
-# 
+#
 CVE_CHECK_WHITELIST ?= ""
 
 python cve_save_summary_handler () {
@@ -332,12 +334,15 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     bb.utils.mkdirhier(os.path.dirname(cve_file))
 
     for cve in sorted(cve_data):
+        is_patched = cve in patched
+        if is_patched and (d.getVar("CVE_CHECK_REPORT_PATCHED") != "1"):
+            continue
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
         if cve in whitelisted:
             write_string += "CVE STATUS: Whitelisted\n"
-        elif cve in patched:
+        elif is_patched:
             write_string += "CVE STATUS: Patched\n"
         else:
             unpatched_cves.append(cve)
@@ -351,19 +356,20 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     if unpatched_cves:
         bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
 
-    with open(cve_file, "w") as f:
-        bb.note("Writing file %s with CVE information" % cve_file)
-        f.write(write_string)
-
-    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
-        bb.utils.mkdirhier(os.path.dirname(deploy_file))
-        with open(deploy_file, "w") as f:
+    if write_string:
+        with open(cve_file, "w") as f:
+            bb.note("Writing file %s with CVE information" % cve_file)
             f.write(write_string)
 
-    if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
-        cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
-        bb.utils.mkdirhier(cvelogpath)
+        if d.getVar("CVE_CHECK_COPY_FILES") == "1":
+            deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
+            bb.utils.mkdirhier(os.path.dirname(deploy_file))
+            with open(deploy_file, "w") as f:
+                f.write(write_string)
+
+        if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
+            cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+            bb.utils.mkdirhier(cvelogpath)
 
-        with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
-            f.write("%s" % write_string)
+            with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
+                f.write("%s" % write_string)
-- 
2.17.1

