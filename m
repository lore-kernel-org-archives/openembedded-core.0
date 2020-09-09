Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.47])
 by mx.groups.io with SMTP id smtpd.web10.6599.1599684701012154678
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 13:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=AWmmBzrJ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.236.47, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5mxbYFuLIjE9YaZ0qRHCvDQgVCb1lxqrnsjYb2O1dpne2IclHV+ZVEg0wyH6RGJLOz6aXpPoaNqcvXAA51tTpO+Grz3NbGe0CVoO+QBDzjQW2FkQv1WiorQJXwnQf2QPd6plPXXhwHVGUO5O02jGjFLL/wwYsv5J0LUqKGyrW0NPIgUBwgWbcr9IwH6VdILiLKUaCeHBX9xQqWMTdVEQ4rWEPf9PB8qL+WmkzsIvEKJoaXD0VXEFRlRditFn1h+5/eTq67J4e0WP6/oI8DqCiBWB0M0D8uV4EOJMp09vNg7eQnjJuPTM7kO2LwDTzgHJQrn3ThrOsYKL8zf62uj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rX9FOXQvhBEDTMyng5gHdDw7D/GfVDV4tlzcPJKXxM=;
 b=ZPf67CxbhFUheYsjd7OW6VXpsXv8E7gyd5KkJlCbOFi/WlTFRFzIQzMDLz3s+d/VFNFG+0Ml08sK/gr5pusVZkCMUm6gReiFAf1mzaNFqbIa4kN2aJduePd1JyGHQSHIZkeI4NmHmpfcZ0MqAOE7e3hXHENB18ZnfkiA8mQ7MAJMe30Hfkg2MfOXTTVS/3ugof2CLHloWzI9OcKjhfj23mSsNsOv97YsRnxyxs9EIi75y2S2o3WrwBFwSq9crVmGRc19nHKKxiDsNv/U2PHkqKpBpZFLLC9t3ZkONL6nO/0xnqNLtpLAS2RpmhUpNSzeT5dYl2bMPYf6WfYBFwuzew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rX9FOXQvhBEDTMyng5gHdDw7D/GfVDV4tlzcPJKXxM=;
 b=AWmmBzrJP/anAruMfC/64LCM1nympKXGvEvKWESvA3MipTKFH801w126GGkzd9KCtH7H++xaX8gurP9iSTCBzJgU6t+24mXP+Ihb9pstJ22nj9RvCT82DcuORJiKyAKnmvY5XzZzGuoX2QoINoTfLWyMF1Nin77Udha0M5ZjxqGBQt7Cd4xX8l+M6lOq/CfZZiXVXUdrzEVEQzsHnGPwxkrEAtAUPrlyFmaT0m+CjVYfd/JsdgZnGA5z41W7Whn+admE7nLBb4Qq+Q7y+nwYjTACXndM3Vz2IcznWl9PkaVCw8yRqcHdr4HHt4tyiOXrmI+y9bEt/ERyt++L8Hid7A==
Received: from BN6PR19CA0107.namprd19.prod.outlook.com (2603:10b6:404:a0::21)
 by BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 20:51:39 +0000
Received: from BN8NAM12FT052.eop-nam12.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::ea) by BN6PR19CA0107.outlook.office365.com
 (2603:10b6:404:a0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Wed, 9 Sep 2020 20:51:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.41) by
 BN8NAM12FT052.mail.protection.outlook.com (10.13.182.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Wed, 9 Sep 2020 20:51:38 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server id
 15.1.2044.4; Wed, 9 Sep 2020 14:51:27 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2 2/4] cve-check/cve-update-db-native: use lockfile to fix usage under multiconfig
Date: Wed, 9 Sep 2020 16:51:07 -0400
Message-ID: <20200909205109.120033-3-chris.laplante@agilent.com>
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
X-MS-Office365-Filtering-Correlation-Id: d70b28e8-525a-44d0-7792-08d855022600
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BL0PR12MB237035AE4634D24B8C35211A8B260@BL0PR12MB2370.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kW7yTRhcC0X2DprCnK4C887m3C4Bnfl/oYECm9qcJv+gny+1Hiv3tR2OdgVuSRdPB+95Sl5w3vZYI9vIFZvjYR5dvH+J3WGINqY36av1vApVRbv1A/bEbPx1z4InQ/V8AcuPrIWkuFRzUiN91RpxngzxppsQBMMnMnCezrrFq2Ow0AgY1qgPIsrTP2twoq4KieU3LYPs8VnqLr3plXbrbY/9mBLOVb9DDCycwdJ3yAZJnYdsOq/LLztE8l9rLecmcbxRECQD1aS1Md7R16vQYXbOUXsUx4Pb4SiDZIlnKVbgO7KD6AeA3cWNKEWZ+BEg2CZT0ZqtJurR5kCfeaKZKcmbtWNPFNx/Zdzk3LtZg6pp90X6d27s+23RWXWii7NxNFgCfB2fdIoMSFfH3OsijZOaQ7q1OOJSkcClRjIAHbQ=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(29502001)(46966005)(44832011)(15650500001)(4326008)(6666004)(956004)(2616005)(316002)(2906002)(83380400001)(36906005)(47076004)(82310400003)(82740400003)(7636003)(356005)(478600001)(70206006)(336012)(426003)(8936002)(6916009)(1076003)(5660300002)(36756003)(8676002)(26005)(186003)(107886003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 20:51:38.7416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d70b28e8-525a-44d0-7792-08d855022600
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN8NAM12FT052.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2370
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

Use a lockfile to ensure multiple tasks don't step over each other.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes/cve-check.bbclass                 | 1 +
 meta/recipes-core/meta/cve-update-db-native.bb | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0889e7544a..35b7d0f298 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -27,6 +27,7 @@ CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
+CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 2221825bf8..d22b66f6c7 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -52,8 +52,7 @@ python do_populate_cve_db() {
 
     cve_f = open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a')
 
-    if not os.path.isdir(db_dir):
-        os.mkdir(db_dir)
+    bb.utils.mkdirhier(db_dir)
 
     # Connect to database
     conn = sqlite3.connect(db_file)
@@ -114,6 +113,8 @@ python do_populate_cve_db() {
         conn.close()
 }
 
+do_populate_cve_db[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
+
 def initialize_db(c):
     c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
 
-- 
2.17.1

