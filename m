Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.45])
 by mx.groups.io with SMTP id smtpd.web10.2227.1599672930822366438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 10:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=NhA3FHrP;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.94.45, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdPYMhYZd+KWPbKktwLe1HjH9h5mnU/NPvcOwXY9K7azWA9yUi5hdeXXFCFD1gAKmCYxrfW+QP9wbNhD7plohBSvlxAfdJ0N1lfy0hUIVfR1n1ONVm09B/h/VAyuuMPVAB80UomBnMWEF4l884s1KJhd9FChI8qyavVtAqbEK08ui5t8gBYjmiqteEKZtzX/NcsqxGMKQBUkA2ayHHHl6fbynox4Dgdj1dipWoM1HtlPDs8XrwMSI0//GVFgCV2OhSx+FK3j6YvvWIK9Sqbck0bdesvqGPkj9MIlmg1CNd//NORMrbIWM0cd/wsKWmP6e4Zxuxq3yvEFJkgjjiG/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z69hRw58lJEHDUgTPe4d494FQgUDBnjOFNNb2QKEIZ4=;
 b=UHCOATewNgvUXzmS+P9aZ6LpRjWYvFt64CCFvSAz0kZDiUiJwO4ITUo5B79yfsSyyb28eMTEMh59T6h2j7ty+0kNMdrP901yHcYhbJJsc2oVs6x/7jkdFWvvmHD55TrU56H5Gphq4k6/elR1pjRiMXdW/8b8iLUtQX8AP471qAlhavrjW1GeMzfbjbTeg5/mw4CZtrb6oF3ZVT3n3loagIRsepc1dYOnWn7nHEqRMrAHXrjK7ToqPxAKDqGoliUbAzMctueVm0VgUdgUUCjvz8ze3Ez5o8nTnQE1tkCimzwHc3iVity/Lb7yEWrKAumRHX38TTLfrWZHzWUFdsp1rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z69hRw58lJEHDUgTPe4d494FQgUDBnjOFNNb2QKEIZ4=;
 b=NhA3FHrPLH2regxVRkl6tWavwmjWFRfiVTClA+BqCvz77o1GwH8w3nXpjeapmM3xhKYnOnY0aKUuzNb3nnSv+tAio/GQE/bqXjM5ZEPubZRlBLdNJ5BxBGRpEXIGhUqK7j8D+6jgFwqcUMEyRLLCHRCtHhJA1XH99wr2/FB0pzFq8UjoH+1lcaOH6Ah59oy79nqaGOfRpbo3TF4fg6SyMQkSZp6rvrx9NtNQDMvQPhpjw3LNkTCrWv2eGFq8AV8hQIcwioDtaoYHWoCiUAcd0IcW/s4a2ftiDQdhbIn2ElB+Qa4+r2O/fSobfgWprNI4XqY2jHU4AV0X11q+J9T5vw==
Received: from BN7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:20::20)
 by BN8PR12MB3347.namprd12.prod.outlook.com (2603:10b6:408:43::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 17:35:29 +0000
Received: from BN8NAM12FT010.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::b9) by BN7PR02CA0007.outlook.office365.com
 (2603:10b6:408:20::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Wed, 9 Sep 2020 17:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.41) by
 BN8NAM12FT010.mail.protection.outlook.com (10.13.182.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Wed, 9 Sep 2020 17:35:29 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server id
 15.1.2044.4; Wed, 9 Sep 2020 11:35:27 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 4/4] cve-check: avoid FileNotFoundError if no do_cve_check task has run
Date: Wed, 9 Sep 2020 13:35:10 -0400
Message-ID: <20200909173510.114925-4-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909173510.114925-1-chris.laplante@agilent.com>
References: <20200909173510.114925-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg2.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cce5b27b-d797-4784-587d-08d854e6bf12
X-MS-TrafficTypeDiagnostic: BN8PR12MB3347:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN8PR12MB3347384D1A398F40FEC345FA8B260@BN8PR12MB3347.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EA/7xv8BFLNH2w6tjio5gt5T7kEB44LQGnWUhSrigNlk6II+Bt+ZPYVkqyfqQhQANEaAJX8iCjYnbxhKcneCqDboQ1vo/m8WXZBshQy6Ecvw5l/q/llOn4GlX+K8z7Rf//PTxOi4vNrAohYRMnDnyECTXkLyzD2bq7fM9tI3+EeEBXDeQHM76xfv/ERhGkhbzkTOZ0huMvkyGeX7yjW88LYD1IZaZZdJPQzc9ETLomQKEcd1csCmwvYthF7relLqG0NSGv6RIg2aGm8x5pSkSvbSrOSO/U9kenMPkdpFEMQbGJuAt6V5fP/av8KXNf60sX0XorvoNYFbUMBDN/bnXnzBXNflLTxwAVv+oSDG9ARGdhyIIIJtL55axn9XEB0Xcvq+kbAkKGCrDS9oejWCdJfY8mutFLLiHt3lVFmEM10=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(29502001)(46966005)(107886003)(8676002)(4326008)(70206006)(1076003)(336012)(83380400001)(2906002)(426003)(82310400003)(5660300002)(7636003)(356005)(36906005)(6666004)(478600001)(186003)(316002)(82740400003)(86362001)(6916009)(47076004)(2616005)(956004)(26005)(44832011)(36756003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 17:35:29.6387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cce5b27b-d797-4784-587d-08d854e6bf12
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN8NAM12FT010.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3347
Content-Type: text/plain

For example, if you just run 'bitbake cve-update-db-native' in a clean
build system, |cve_tmp_file| won't exist yet.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes/cve-check.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 485d147ef8..9f272cd60c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -62,14 +62,15 @@ python cve_save_summary_handler () {
     timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
     cve_summary_file = os.path.join(cvelogpath, "%s-%s.txt" % (cve_summary_name, timestamp))
 
-    shutil.copyfile(cve_tmp_file, cve_summary_file)
+    if os.path.exists(cve_tmp_file):
+        shutil.copyfile(cve_tmp_file, cve_summary_file)
 
-    if cve_summary_file and os.path.exists(cve_summary_file):
-        cvefile_link = os.path.join(cvelogpath, cve_summary_name)
+        if cve_summary_file and os.path.exists(cve_summary_file):
+            cvefile_link = os.path.join(cvelogpath, cve_summary_name)
 
-        if os.path.exists(os.path.realpath(cvefile_link)):
-            os.remove(cvefile_link)
-        os.symlink(os.path.basename(cve_summary_file), cvefile_link)
+            if os.path.exists(os.path.realpath(cvefile_link)):
+                os.remove(cvefile_link)
+            os.symlink(os.path.basename(cve_summary_file), cvefile_link)
 }
 
 addhandler cve_save_summary_handler
-- 
2.17.1

