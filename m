Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.70])
 by mx.groups.io with SMTP id smtpd.web10.2226.1599672929931918783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 10:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=enhhKSvD;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.75.70, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuZX3qIyjk2oSWsaOTd8AMTlWCr2Uvd96Qhvxwm72ozFwyoUfMlEvbKpt94yOCs9VQZIk1Vk9gxcgsndT31mSxofbge7iIKYNVtlmo7zA0IRvF/0erVgpV2QD1BTJfCziYi/fBTXLQ4sWhQ8X54ALZOeNFD6ethWHphIOWTXQbyfzHyoxwGNfVM9Ogl119bH+lWfv3WO4IEewcZHS+68+OHwuLuAL8DuhQF49EbWVepWl98CvsZSos852JCyaXBgx1MhjgzG5Vv9xc98B4ZxjRK84p5PwPXYjdN1M9nksUd3b7lbssZ2uo9Dw7dgt7GM3KcUXj//ZzapToTTpuPcPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5IubymdzZBXHnh9RmEaO1pg2NIwo2WLfubLCj/1jDo=;
 b=myVKhkDpG0mxgQ8v1yfvo5+eIf+DVjXKlmTXbaJ8d930fpt5WJYVFguKQjGDxgfN6HsbB650LcWo2jKe91VDIb4gOI5zFbwtzDv7S2RqVHUoj1Og+W6XTa4aVOq3MVDcELFOEbGh+eRwsufxMWKMoMWToZqzINuVby59NPKfVWGxa7bz1emXgo1ntOnn4Kyv6qu2uCo/s1nNOmNW331VNwEM0v4deJGLYHUxgZWND/wSC5qva1MTVrdcVD4emqLQ2PNQ2TZkjBpowQ60warRhh7XG6rLLqiQgqP+apLF3OPqCQeMjxS+hLrdSllTvLXw7uh8zwoccTvxbtKNxPm6BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5IubymdzZBXHnh9RmEaO1pg2NIwo2WLfubLCj/1jDo=;
 b=enhhKSvD1sEK4HuJt6wZ3Y9tp3XZ3zAQjXQvKMCowThvcZPKuwNTgRfDM+OMCKi+PZGHhgzi0kPTwTR2MiLFaV4eI0TYN00Vso1R5l4I+e8mfH9BN93BH4IMhR/5qoIHICaZdXMUl/KTU628kzZqFDNKLzgaya6WbIdC+sPHSAQi33Ndc8VePPh0Ef14Tw3rsfJ+YhSpVn/lU/xJ1Z9s+1D6YX2LOGDIvHNj8Ksadjh+1bVkhGFXOtpjaujoCm1fcLFvm5mkIrORlTIy30Neva2KsF55f06HZH2EPZWZFCHl/46dL6JABySeNAdL7rjlVKKzU0+DVI5fb43F0fgbaw==
Received: from BN1PR13CA0027.namprd13.prod.outlook.com (2603:10b6:408:e2::32)
 by BYAPR12MB3207.namprd12.prod.outlook.com (2603:10b6:a03:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 17:35:28 +0000
Received: from BN8NAM12FT058.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::d5) by BN1PR13CA0027.outlook.office365.com
 (2603:10b6:408:e2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.11 via Frontend
 Transport; Wed, 9 Sep 2020 17:35:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.41) by
 BN8NAM12FT058.mail.protection.outlook.com (10.13.182.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Wed, 9 Sep 2020 17:35:28 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server id
 15.1.2044.4; Wed, 9 Sep 2020 11:35:26 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 2/4] cve-check/cve-update-db-native: fix under multiconfig
Date: Wed, 9 Sep 2020 13:35:08 -0400
Message-ID: <20200909173510.114925-2-chris.laplante@agilent.com>
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
X-MS-Office365-Filtering-Correlation-Id: 78f4d97a-196f-4eb8-0589-08d854e6be1f
X-MS-TrafficTypeDiagnostic: BYAPR12MB3207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR12MB3207A62F1D478105E9EB40C08B260@BYAPR12MB3207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ql151xOA3ytEzT9BmQDkqhFT3zQ0RQlk4fP823JQ0ah90Vw4wYTxMTeeNSyFsPKY8YX8RC7eGC/17It//Y+BUt3tvnATGwPhtDYLqnl/hPFIvH80tVi3lS2vbDll0zV4TpcGXK8XztQvJLg9/Nw2hx76eR2l/q5LMA1nNe4SVDHXSOOQSb3vC7V71U1dWNC6I9XzCZjlXltCmypGhSYD0eqwZ30a+aeA8TNm6I877ZTvc8JFZ+MFgvaoBgGT5KmFo/69YbMEwsHE9vGRXLSv+l7hJYoE+7Wk/fcN6/9JnxktbSwf5T7ooLxWMnoV98vKMZLCig+ZZDQ3prRIMjBWMVgLW/yId/8TMCTaVBA3KFbPvDLqb/Tq9iVerHyja8Tdf8Ppt6+AlD58ynxFnPMwSel6II7+EPeZ/vvjgHQ5Yrs=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(29502001)(46966005)(426003)(70206006)(2616005)(956004)(8936002)(83380400001)(356005)(36906005)(44832011)(5660300002)(82740400003)(316002)(7636003)(47076004)(336012)(6666004)(15650500001)(6916009)(26005)(36756003)(2906002)(82310400003)(186003)(107886003)(1076003)(4326008)(8676002)(478600001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 17:35:28.0431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f4d97a-196f-4eb8-0589-08d854e6be1f
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN8NAM12FT058.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3207
Content-Type: text/plain

Previously CVE_CHECK_DB_FILE / CVE_CHECK_DB_DIR was the same across
multiconfigs which led to a race condition wherein multiple
cve-update-db-native:do_populate_cve_db tasks could attempt to write to
the same sqlite database. This led to the following task failure:

    Error executing a python function in exec_python_func() autogenerated:

    The stack trace of python calls that resulted in this exception/failure was:
    File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
         0001:
     *** 0002:do_populate_cve_db(d)
         0003:
    File: '/mnt/data/agent/work/74f119cccb44f133/yocto/sources/poky/meta/recipes-core/meta/cve-update-db-native.bb', lineno: 103, function: do_populate_cve_db
         0099:        if year == date.today().year:
         0100:            cve_f.write('CVE database update : %s\n\n' % date.today())
         0101:
         0102:    cve_f.close()
     *** 0103:    conn.commit()
         0104:    conn.close()
         0105:}
         0106:
         0107:def initialize_db(c):
    Exception: sqlite3.OperationalError: disk I/O error

The fix is to add a multiconfig-specific subdirectory to act as a layer of separation.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes/cve-check.bbclass                 | 2 +-
 meta/recipes-core/meta/cve-update-db-native.bb | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0889e7544a..485d147ef8 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -25,7 +25,7 @@
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
+CVE_CHECK_DB_DIR ?= "${DL_DIR}/${BB_CURRENT_MC}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 2221825bf8..57368caf73 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -52,8 +52,7 @@ python do_populate_cve_db() {
 
     cve_f = open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a')
 
-    if not os.path.isdir(db_dir):
-        os.mkdir(db_dir)
+    bb.utils.mkdirhier(db_dir)
 
     # Connect to database
     conn = sqlite3.connect(db_file)
-- 
2.17.1

