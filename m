Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.42])
 by mx.groups.io with SMTP id smtpd.web10.6600.1599684701146139461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 13:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=T5BMBzpW;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.42, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhjLC464xgaWV3l6q5wAzhw0BzDCo08JV7kAhlGUTJXIjOmENjBEKEWOfsF2YGfda6IZuNJjw+wpP7wnLGPGk0+1hIdgTwV4j34SH05cVuCpj4I3EBOWiZ0rhWXo0vZpYISkZOMgF4+PybiIV3Zg+rWc50rBBnSA2ljJmA5Q/vfMCNrm63AssPJCTnTZ3OF9JbRBCpynQeDOUWNE6vgK9KachUMh34v2PZBDG4fc6f4ZnEXBUbuYMldXnlj8j8NEa3oMueUJ27maN0QtrhE58rgoNy3chJQKgWR96JTv9PZiACW1emYkilaDd/eZk5IMf8zx1Oz/PaGsQuAafLaJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KL+ObKgMbj8EOaiVsa21yB/WEdECnPib1I5DFA0De+Q=;
 b=dp1Xd3EF/4t4J0GyDEa3SQdt7653w7bDVdF9uKSdiPIOK4pCYD6GihQ2RmIhmmvE5l2mcqMzZ3H9ikE2lzS2D+jW3PAhM/Y8wHfoPi9ef+4kgojHEvjSoWaLIo3oXaTvDlxBO3YHeys6Fl/CnurAmNO3OpBb5xYpaa0K+A/2U8MO8T22HOjo3vWkM2O6nShDwIJJ07gspiW/byMpatcud8O6LKBAhQr5LOnExTFF/Tmfkml5pSUuJnl2pddqbzPJ9rmFw23DNRzu7syFdrtLvbbcSxqD66U2dXhmd4t/kaorCCdLv0CHXfjI2OYCveB10/Smk5rrqoA1EF36tKDR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KL+ObKgMbj8EOaiVsa21yB/WEdECnPib1I5DFA0De+Q=;
 b=T5BMBzpW/HehcYT5nLsUYtgz3MLf+L7TdkicWdhDGWN34BK5hPnVjpTGBwXRpqQWASbW1JnNr86jWR2YfwbZTYG36L/MtVea7iRS4TStDHv4pjI0r4LIMqOTPgLFqjdrbi+ks/MyXBHkrZ7P59Puff6cRCC535T3Us3/UyAowCpnXHHNXvBmNmixPk8LY0ZXlLMTvJmi/1EeW0gKPmcEc7ohhSm5c7nmGT6ic43E8Z+LU4uk3E35FcWLWhbNWER9hyNYYm3RMavGyG6afSIWJSYFdLVf58licbbBBZFhN2J8nf0WLcrrPDAWGYXP3B8lgHDQ6bXC4QQZTXnI9pVHuw==
Received: from BN6PR19CA0116.namprd19.prod.outlook.com (2603:10b6:404:a0::30)
 by CH2PR12MB4023.namprd12.prod.outlook.com (2603:10b6:610:14::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 20:51:40 +0000
Received: from BN8NAM12FT033.eop-nam12.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::93) by BN6PR19CA0116.outlook.office365.com
 (2603:10b6:404:a0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Wed, 9 Sep 2020 20:51:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.41) by
 BN8NAM12FT033.mail.protection.outlook.com (10.13.182.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Wed, 9 Sep 2020 20:51:39 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server id
 15.1.2044.4; Wed, 9 Sep 2020 14:51:28 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2 3/4] cve-update-db-native: use context manager for cve_f
Date: Wed, 9 Sep 2020 16:51:08 -0400
Message-ID: <20200909205109.120033-4-chris.laplante@agilent.com>
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
X-MS-Office365-Filtering-Correlation-Id: 14b03d07-e717-49c9-4fbf-08d8550226b0
X-MS-TrafficTypeDiagnostic: CH2PR12MB4023:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CH2PR12MB4023E52FE0A31EEB04B2B3C48B260@CH2PR12MB4023.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:217;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dLmXtOOGDJrDCUcYGaRMGMa79x7K2OI5LXXcyBB425z1F3eHWzEuU9u59zNV2t4OJ/rhoKF0oUGVbZXn8K0CsYerccxhLTxWXqGis57e61rBEPMU83JFNUzVMV9LLueXd0F4soyV+t2gxjA+5RUjkASqEeK6nKqS8ESAN82hePPxOL7iFDKrzBF0ApQJQW+1IrApEsCY6zrLw+HSNGnksrevsBgU9bRY9UN31+u2lW8Q1WRHRQgwbUsv5U95nqDVKJKtht/qWmXBb3xtva2RXGjHCRO3THI5IovIcnBGVztxmFhhCrW6iogpm0mA2/UnXzxoWbEBRT5cMSV/9/nEvmUPYFjPgAQiEuU2yYGHRW7UGZRrih6dd9yAtBhw/MlMeqFjEomjzHmkX0cYcJ27wGMINBOP0VipwdZvC58eKps=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(29502001)(46966005)(47076004)(426003)(5660300002)(7636003)(2616005)(956004)(8936002)(4326008)(6666004)(86362001)(1076003)(82740400003)(82310400003)(107886003)(316002)(36906005)(26005)(44832011)(2906002)(83380400001)(70206006)(186003)(478600001)(356005)(8676002)(15650500001)(36756003)(6916009)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 20:51:39.8950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b03d07-e717-49c9-4fbf-08d8550226b0
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN8NAM12FT033.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4023
Content-Type: text/plain

---
 meta/recipes-core/meta/cve-update-db-native.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index d22b66f6c7..328f6ab364 100644
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

