Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.48])
 by mx.groups.io with SMTP id smtpd.web10.63295.1600097630706411279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 08:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=b0SFbUPl;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.77.48, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igg64vwk0Ddg8dsihmTE7RDaVpi0n8Hr4SS+uYwOTFF15ovXoDFrnIQkYLsUygw2adCgYpvnnn0jinxPN+PhkP9pHldxOT60BnsJQQIo1TEgloRoK44p4iZPlxY/rZyg98EWMjffFNtK2l41Cjf0XtjFvhHwi1DF9q1CDHVXnu62KUBdhmMSmfCfnGlnfMw2YnM1fmj75QDupkeOtZsjgcKoeBO5R5/9Ha6EK9AIW7Hifh6x8t2PqOcFbxUASACTylwWCXANS9YUx2C07PNHme77qHhUf06kWdv0ESpRQAxpIhxpCF1tyIaM6EA5+NBOBL+xjvimlULLW4I7gUQwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvtXedcR4Kph7UCid7QMu+sGgdZkI2YplPeXO5W1E0Q=;
 b=VT0AUiuFl7ZLnwGvq/G2RCcKMxjtB4Qqbj9huipMRPomUTlVD6J5qnTJcNnks9ZtAAJKMmNctq+JFLHzz8lcwBP/w1J6RV00bWMfdC9D+0OTOW92C4zQRDTPE+Qkrqrq0MMJA/mfFGoyyp8LFrWs+8IEl0STeJqIQflHDzug1VDuTJ0B/hNeMjTVp2ZNlZnYv1cZ52btceaDfl9j/64xLQpyYAWjsKvoJvOI746PonpkOUIj5/VyGwTxP6mCXmfMiyF+9a/P40dsGnFWa4EaTVourBePPTkB0/yUPIw0Npp3igdT5ZEd1m0kmbaDwyBZjy5FQPY1t1GcP99Qx56Dlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvtXedcR4Kph7UCid7QMu+sGgdZkI2YplPeXO5W1E0Q=;
 b=b0SFbUPlQc5EQ8remnlGCo+VbkLBYJ4GqmRkjMyhV3HSk8CIXgQdV4Y6YvVkhUpOhHe+fhe6M+fNo+n8CawvbQUTbxEgXDkFWf1ZQ5/dDQgBeXBAOWgj+bySh8GvuqcQoi5kBMGeDExjfVGiV0+m2mmKAYQeBhgiWlJaZB/tg9B3Qu3D8qMqVqGAAmXj2QUfJe4wH8hS7mYo9brcK48jTN+9UZ80BszFerxcW+POqEMa8YdwdERlw0M1+2NoXurk7TzA3mroDP6UYTm9gnptDFcuspSQ1RDjMEKGjFPJSZv0alEM7HO+SjCu1eLA4ho0FUqXf11SVYBw80hg91OhOQ==
Received: from DM5PR18CA0093.namprd18.prod.outlook.com (2603:10b6:3:3::31) by
 BN8PR12MB3058.namprd12.prod.outlook.com (2603:10b6:408:66::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16; Mon, 14 Sep 2020 15:33:49 +0000
Received: from DM6NAM12FT055.eop-nam12.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::14) by DM5PR18CA0093.outlook.office365.com
 (2603:10b6:3:3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Mon, 14 Sep 2020 15:33:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.37) by
 DM6NAM12FT055.mail.protection.outlook.com (10.13.179.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Mon, 14 Sep 2020 15:33:49 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server id
 15.1.2044.4; Mon, 14 Sep 2020 09:33:39 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 2/3] cve-update-db-native: move -journal checking into do_fetch
Date: Mon, 14 Sep 2020 11:33:19 -0400
Message-ID: <20200914153320.64383-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914153320.64383-1-chris.laplante@agilent.com>
References: <20200914153320.64383-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg1.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0cbabc5-03b2-4f3b-e9c5-08d858c393a3
X-MS-TrafficTypeDiagnostic: BN8PR12MB3058:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN8PR12MB305805E27CBC07F94E01E1098B230@BN8PR12MB3058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0yoMTY3dQmq4sLUPlPNmBT5JAJZBO0HwZm0qiuztZi6KCPaVRut4LJE+2Up5FNOLjZj7jmCASFy9mxotfy2ksbkSCeonkunUZyOzLPBTsn1UPwXtr1DIpiIRMjSMdh6Tw9l1X8Hma7AeuQWENKsAtVCxVX4MqrRaewJgSS2c/BECmLmFwjHjljHxTzV/XsJ7GmVp0J9jsvK7Jp6tmnIYGSrcuHx31YnE6tmaKr8TWjJgepl5o2B9o7MiYlybyoVYTEkXbousp11TOSM1j1/3Q1m0nB4jetyEBGvZFQb7lMjETcKPa8DF7kWVriGKCWUcI8OiaK4LFLg03dF8ROel+cTIjG7EGU8l09fCjVTXdufefSonvYCIXCJu+Vfk+CKJ9dpAGeWEN1wg35naHWf+oUerUniAQkkgNAV3rBFGZNE=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(29502001)(46966005)(83380400001)(70206006)(186003)(7636003)(4326008)(356005)(82740400003)(47076004)(5660300002)(6666004)(316002)(107886003)(2616005)(6916009)(2906002)(336012)(86362001)(8676002)(36756003)(15650500001)(956004)(426003)(44832011)(8936002)(478600001)(26005)(82310400003)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 15:33:49.0625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0cbabc5-03b2-4f3b-e9c5-08d858c393a3
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM6NAM12FT055.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3058
Content-Type: text/plain

It was always questionable to do this in an anonymous function, but now
with multiconfig it is a critical mistake and leads to more strange
"Exception: sqlite3.OperationalError: disk I/O error" errors.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index c2f713312f..242fbc2f30 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -15,12 +15,6 @@ deltask do_populate_sysroot
 python () {
     if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
-
-    if os.path.exists("%s-journal" % cve_check_db_file ):
-        os.remove("%s-journal" % cve_check_db_file)
-
-        if os.path.exists(cve_check_db_file):
-            os.remove(cve_check_db_file)
 }
 
 python do_fetch() {
@@ -41,6 +35,14 @@ python do_fetch() {
     db_dir = os.path.dirname(db_file)
     json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
 
+    if os.path.exists("{0}-journal".format(db_file)):
+        # If a journal is present the last update might have been interrupted. In that case,
+        # just wipe any leftovers and force the DB to be recreated.
+        os.remove("{0}-journal".format(db_file))
+
+        if os.path.exists(db_file):
+            os.remove(db_file)
+
     # Don't refresh the database more than once an hour
     try:
         import time
-- 
2.17.1

