Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.41])
 by mx.groups.io with SMTP id smtpd.web11.6548.1599684700850429353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 13:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=RThxivHN;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.243.41, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PA2GXFkScxdS3y2DREDbdDCfv5N6eO9FKFrZZ7lUN+jaoo1V530WHoYNhYSzpfdhAShq03gwyA4NvHppYUYl636TwsEXwb6jE9HdEP2RJVlPw3uMxwdJXG2wHt6JXciNtRam47HTfDJHqmRMYyfbZyejMIXo8PYWFlpiqbOIttwRgSc8dnKQvTq3kqS7Wfjh4HJvjcC32rHViWGDz8SYFs+U8s4O1xLqydp/clLbxRZFLL1+HG+hsVxPZjraYfF/+H0BCuSzwIGhdMTc8MQd887KJSraL6KaqTP3AqzOKgNoL2bHWJdBU/ZJhV1qxSBBZuQDpZqZ+OVxSS/eCAQqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyEUiyjNe28mWK3jw4HlayDco6AQtegDp1oyNtcPzUU=;
 b=HOx01GtpyERWLXyj9eVUDMI+xwsluzDdbA536ufIW2bYfzRTmshoNkmU99kpxa6SMk0ZZd38tvN0yvVnwm6MvumYs8k57GqQGibFN6UU0zLulp30RcTpCWu4rT19Klqs1RkKLgJXP4OjeOKOKCq1+GqaCPT2pN8F2EUINcmH1hXgqVeMrnlj9hMtOSc5ugnqOI1Ts6lNm+h1QwaSl1TGD0OgBolZkwry+k1T1jzVZhnzTX5OyKYM4vtboJRAlGI8APSBbKH2V93yYY0JWMthpVQ26Moka9qw9dYog+UYuCxOYCQ7WdrMKowvXp8Wo3LzLDgK4fHoHXSFQj46Md1IeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyEUiyjNe28mWK3jw4HlayDco6AQtegDp1oyNtcPzUU=;
 b=RThxivHN7jVYh8R0VMblMxMV0dez68KC9b/N1ZxTFU4tp2lPwqERy0dQsqh2u24z9jhGz+AD529zJ8fOLC7KvU4NngFOOb/ENuCy7FuTuxK8tWrKxC0paF5LD4LOx4bJdpBzfwnSWf+2NTm0DLHxCNCmZDTwbx7AQiphT1eyNsaDaCOPMpl50uI82+4ui0WCcsF4bmm4Z3I3hhZcDYysk4T2ZARvp7nXOI7OnpVJ4Iq6p+U81UUG5vDTHzlPORn7Hux3TPhnTV9FQU/1Zb16TPDAK4sSwFxwL+gAt3uhJoBSOdRilbzhK4T5YsySL73Xnr6vyZYLwhu9dgPNDK/xqw==
Received: from BN6PR1401CA0005.namprd14.prod.outlook.com
 (2603:10b6:405:4b::15) by DM6PR12MB4513.namprd12.prod.outlook.com
 (2603:10b6:5:2ad::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 20:51:40 +0000
Received: from BN8NAM12FT064.eop-nam12.prod.protection.outlook.com
 (2603:10b6:405:4b:cafe::aa) by BN6PR1401CA0005.outlook.office365.com
 (2603:10b6:405:4b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Wed, 9 Sep 2020 20:51:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.41) by
 BN8NAM12FT064.mail.protection.outlook.com (10.13.182.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Wed, 9 Sep 2020 20:51:39 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server id
 15.1.2044.4; Wed, 9 Sep 2020 14:51:28 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2 4/4] cve-check: avoid FileNotFoundError if no do_cve_check task has run
Date: Wed, 9 Sep 2020 16:51:09 -0400
Message-ID: <20200909205109.120033-5-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909205109.120033-1-chris.laplante@agilent.com>
References: <20200909205109.120033-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg2.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5913c5f7-1ecf-4a7f-43d7-08d85502268b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4513:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR12MB4513E1AE36A3AFB4DE7182638B260@DM6PR12MB4513.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F/IKI3bKZ9b3RpPzc0auLjYVy4WEh3P+Iq+HVmfQt1OznTD1OJcGLDTvq2W9C2YOEBfjDDDWEmW1c658QtFE/DsGA9n5FVUQwAQ0laaW5oMVvOG4lIlAY2EwNtmnPezp16K9rwIhhKHj50fvahbx4lCxcdAxpw64l96QozUnrlSEHaxjOiZd2dp1WPwLywTCo7IzdAPygJQw40gYcnkjxVtZAqDSG7T83tzntbPkGGBRRcTT1XH6YELj+TjHc71wKTRP/JfBZJDdlx/BW+1gqimEI+5OrKFDypoJ95xSz0+aeC3leV2g0VUUiGgu+kGrNWAbcwJJnQx1zaclfP+9obMyKEYCb2RH7en+Zw0nJ5wStzxxUxmJrXHepPnY+OejOoZq1Cl/EMem4JDtuB9UWiLQgrFded3PjiolKI+QOuk=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(29502001)(46966005)(44832011)(426003)(336012)(2616005)(956004)(36756003)(86362001)(70206006)(6666004)(8676002)(6916009)(1076003)(8936002)(82740400003)(478600001)(47076004)(107886003)(7636003)(356005)(26005)(186003)(2906002)(36906005)(316002)(82310400003)(83380400001)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 20:51:39.6622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5913c5f7-1ecf-4a7f-43d7-08d85502268b
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN8NAM12FT064.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4513
Content-Type: text/plain

For example, if you just run 'bitbake cve-update-db-native' in a clean
build system, |cve_tmp_file| won't exist yet.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes/cve-check.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 35b7d0f298..17f64a8a9c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -63,14 +63,15 @@ python cve_save_summary_handler () {
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

