Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.49])
 by mx.groups.io with SMTP id smtpd.web12.2132.1599672931226977826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 10:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=c/yRme7+;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.236.49, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIuw3KqNztyuP9PorUkumSTJgO6vt1CKxvRxQFLXCxdpvBKzm7L6YWMrPF3usveL6IztLPmHshAdzScH8o+8WcE5AHJdIkyq7Cxjkkivxxb/f1esaj30SN9i7bRSadb1a1VclPbBYesCs6qGL9SrVUz92AXbXQEkAJ5WcGV4h/5+elLrBdn/XFt7UNHfHUnE3IRP5pEoPD6aO4p5QQhOIZ2368pWoIOO1ooKC92d5zQm0XWh2a9Pvbt9bmWBDgBTOdvB3atHOHNrw9X5ZljZYgPeyHN2tydIO5YuVeDaVZwt0FcCH3y57l/N9NQ75B8mQrmsTnySqFMMKxM9s3sKlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2/fwr+bCLlDlTLc8Z0Y3PdMb9+mz2aCA3MpdNBpuZM=;
 b=QLNJCN1pZx7dm0UqrR3ieTXJmUzcOAIbabAdDCAie3/Z8g4pIeZVt8xGmICAWD8OQAfmtM+a2CqoBYIVTz06kVOlZ72q0S6WI7TbmWk9VD/E+gFsIEzKeYwjGuAZySN49MUR1xRIPDbS31IQ2vVuGZ3b/j3Olf6i/HFxLwdECpeHRlAB4xBi+7dqjYozwYtlluUdEhi0JDfyTO266MN/sRO6lmbS6WMW4t74PoAQNXlbVFPrJJv9U1wAaUcF5WWfdDjlKr02BIypRCzsuFz/EZI+iNQTmr6klgBoNV+Sem3F23ZcjJz+YStEqAGRfl4uy+Os6lQKxre2cGjciyXlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2/fwr+bCLlDlTLc8Z0Y3PdMb9+mz2aCA3MpdNBpuZM=;
 b=c/yRme7+cjwGjVekHQk1YQCzk2gOU3kB7MjiNOTBfOrtuU7e46uO7PqTJ4Og3io8xUV6gVPT5Dhp127Ll1Yw77ROmRr1Q7Q7m2rOCchEy/czDISCHEb2ILqSSZyx6d8Jrd/peJev49JRMxEhN4RihOYceMfa+A4S/1k8JLLRUVyv8BsDwGBB0xs74HnPmmCZYl6AfTW5SoWz6ztXacpKF7qhBQlt6BkbbgW6g9DCGZAy4qeG5AY+xz29DH/W3rZhQH3rplqW2tSrmB4RaXWrQ/SPhV3XPX2wZSJlic9CF56chaTWAbxo/ZeWL6ETJdi82SSy8F/P2Kse8oQb/6/omw==
Received: from BN7PR02CA0014.namprd02.prod.outlook.com (2603:10b6:408:20::27)
 by MN2PR12MB3838.namprd12.prod.outlook.com (2603:10b6:208:16c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 17:35:29 +0000
Received: from BN8NAM12FT010.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::76) by BN7PR02CA0014.outlook.office365.com
 (2603:10b6:408:20::27) with Microsoft SMTP Server (version=TLS1_2,
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
 15.1.2044.4; Wed, 9 Sep 2020 11:35:26 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 3/4] cve-update-db-native: use context manager for cve_f
Date: Wed, 9 Sep 2020 13:35:09 -0400
Message-ID: <20200909173510.114925-3-chris.laplante@agilent.com>
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
X-MS-Office365-Filtering-Correlation-Id: 73746f20-30b7-4fce-d2c5-08d854e6beca
X-MS-TrafficTypeDiagnostic: MN2PR12MB3838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MN2PR12MB3838265DF4A3D467D442E48D8B260@MN2PR12MB3838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:217;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cFod1d3ziiTMcoHgYhkI9+KygV042Zj213GaRhHDzZctV5Bjz+aUo89MVtxDvuDLPwwE25zLV80FGmNda5HwvYJC1lA4LBFK0GVBsYjNocVnqltQu4FU7qrKWtjt5EjzivgdypdV3Utz54FZdRiCX1PJO7n5IQoCMBpVGq44blVbQY5RATA2xX2AYwbmpk9SC6Ju4N3IlG/37+Nk2LvAA9+/yLDvPM++p/rdwPBF4s8elOltEbXbwS+yQBliRb56Zg3rFtXshUTHYkCT5b7vQRMTzvig4I701CUxuY51eP99Jh2ecvSG0tTymO593SJOKS16Pq4Gg4aQYo44xHYOn9bQ4ApnyxriEAxvOl00Ee9oQNeYjv9XaLcImHKlAVcGyoWgFJjsfQPlbpB74vNtSvOFOYCC8qhGlAvQo3wyI4M=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(29502001)(46966005)(426003)(4326008)(82310400003)(70206006)(36906005)(47076004)(82740400003)(316002)(8936002)(6666004)(36756003)(956004)(2906002)(2616005)(107886003)(6916009)(5660300002)(26005)(1076003)(8676002)(15650500001)(336012)(186003)(44832011)(356005)(86362001)(7636003)(83380400001)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 17:35:29.1770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73746f20-30b7-4fce-d2c5-08d854e6beca
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN8NAM12FT010.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3838
Content-Type: text/plain

---
 meta/recipes-core/meta/cve-update-db-native.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 57368caf73..f8f13af97c 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -50,8 +50,6 @@ python do_populate_cve_db() {
     except OSError:
         pass
 
-    cve_f = open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a')
-
     bb.utils.mkdirhier(db_dir)
 
     # Connect to database
@@ -60,7 +58,7 @@ python do_populate_cve_db() {
 
     initialize_db(c)
 
-    with bb.progress.ProgressHandler(d) as ph:
+    with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
         total_years = date.today().year + 1 - YEAR_START
         for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
             ph.update((float(i + 1) / total_years) * 100)
@@ -108,7 +106,6 @@ python do_populate_cve_db() {
             if year == date.today().year:
                 cve_f.write('CVE database update : %s\n\n' % date.today())
 
-        cve_f.close()
         conn.commit()
         conn.close()
 }
-- 
2.17.1

