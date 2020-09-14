Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.87])
 by mx.groups.io with SMTP id smtpd.web10.63294.1600097629303292946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 08:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=eXZ06cgD;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.223.87, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+J+/PG+EnqvRjq/E10KWxzdl9RPdx7BqhLitEUrJlIyh2XH9gMFHhr8dWyAvLdbN97M+VGHcvNEO+kMhfbCZYj+livdceJeCjZHmEqCXq+PXwPzLqEIwKAfybX+Ry7PO1BKrMB/4jzZK7jobfn+oA7lHyJRwP9taipMy9YLMwQ1OBYxVOAo08uZeR7goiNWCpWuMxgHxAyJ/jmez4yBTIToiFLBoYzRV8BBk40SLMalVUr0t6g9IG2Lqpj49cvucPZIAryZ2Sm9s7WQ/dKsxyIXqS13f5pCDEdSPzj89QKeO0Oz3Rmve5RTGSVNDn1DJdRzX0oPPFT1Rmr9TshhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cisOF8xjLUnZX5x6BAgckKU+PeHLpq/2DBa9lpEuLY=;
 b=dkdqtDVbGa8R8THOrRcH9xTgfLJrHOQOwY8hBIVuq8MyB2rFeamJZXbjXeWvtUhvhD34K7E7qqfYwDBhc5S8lGmac/Y/WC+Zam4Rnm0Tr+twVZFrufamtKfRAGuoWuLZPACo09Xwgs9C0T6zSKYKPDviOunbYvXJfdAeFPA0CuWx+6zAq1qLf3IT5i8oWNdJdrtn0ir9FYWgRkVoTiAB+TeuWz7614+It17/rrB761SPdIT6j4oMK5nE2Unt4wRKiSaQnX71iiShRF4EKhDDIUb4+D6D6Y4z8Pph5BgiuZsL1b9F80vkKGzyRtsR5ru5m9GYQEwxWJsYGFh0+8uupg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cisOF8xjLUnZX5x6BAgckKU+PeHLpq/2DBa9lpEuLY=;
 b=eXZ06cgDB84d07qUkfKCxnIXVDmsQk3eO3FRAzVTEjjYNIrwnL0nfZpR92uR+dukXLb3QWNaIK+APYeKRtytb5ytgX4OOQHHTPQjtxgp4eJ3sSOrO+W7bPgEInVQXbQqXn0VcsJRe11T6fscYhUfitE25ofK3pctHUKPQ8E708t8o6Pc0P75X1xYeWEUx7rpKzKKHUHxPwvUPThxXBhSCCW8DHZGx1HCBQQatXYP/ncHvYEhbo+8+9dxd8m8C/iYD6NLvBltlnukJ+PUclICFJ0/pfOQFYb8hvrS9eG1V23W09PdBj5FZKybn/iHqBxsAemKB/rs29/vhGTGuzyL7w==
Received: from DM6PR17CA0028.namprd17.prod.outlook.com (2603:10b6:5:1b3::41)
 by BYAPR12MB2742.namprd12.prod.outlook.com (2603:10b6:a03:6a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 15:33:48 +0000
Received: from DM6NAM12FT059.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::b2) by DM6PR17CA0028.outlook.office365.com
 (2603:10b6:5:1b3::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Mon, 14 Sep 2020 15:33:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.37) by
 DM6NAM12FT059.mail.protection.outlook.com (10.13.179.1) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Mon, 14 Sep 2020 15:33:47 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server id
 15.1.2044.4; Mon, 14 Sep 2020 09:33:39 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 1/3] cve-update-db-native: be less magical about checking whether the cve-check class is enabled
Date: Mon, 14 Sep 2020 11:33:18 -0400
Message-ID: <20200914153320.64383-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg1.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 126a0d5e-9584-4980-04a7-08d858c392dc
X-MS-TrafficTypeDiagnostic: BYAPR12MB2742:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR12MB2742CF114BD513B49A64FBCE8B230@BYAPR12MB2742.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nISHlP7Sf8kSTEDH4VL07+4Kp/bt7LOFYkwD17TNfFx8RzsN5A+3A51NS8IgqMQ03mcGPDemSvhUhVuhx0mQYySU9rK9Alm3Jf40i7xzXgi6cm0tu/SjT1X8Da4n7bCptGL4pnnx6VjfoAlhS+SDDMjAXqUg9siynH08QubntH0FT+MWlSsC4cSMo+/xRPow79XzHRZ1ACkiDN+wrJ0ecUZb1bH0zZIDq2dvZeJC89+MolTE/brZfpTuXikOKisN8pn22dVUHdmnB4YKXQtHNMxP/dIsNzq/hXgQkTDXTpKHBRkI4/sgeIqtIuHYUAqFduNslAvuRk8XOIfEM0E6EdiLx0FIBYdkijHz35WyZdUqDO7ot11egug31Cstdwig0IQEgDUwclVHHMdBqn6HhxlZitTK5A+EC3Cb27IP+4Y=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(29502001)(46966005)(6916009)(4326008)(82310400003)(47076004)(316002)(82740400003)(8676002)(186003)(336012)(6666004)(2906002)(36756003)(107886003)(26005)(86362001)(15650500001)(8936002)(70206006)(5660300002)(956004)(1076003)(478600001)(4744005)(356005)(83380400001)(426003)(7636003)(2616005)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 15:33:47.7575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 126a0d5e-9584-4980-04a7-08d858c392dc
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM6NAM12FT059.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2742
Content-Type: text/plain

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index e4e2451bfd..c2f713312f 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -13,8 +13,7 @@ deltask do_install
 deltask do_populate_sysroot
 
 python () {
-    cve_check_db_file = d.getVar("CVE_CHECK_DB_FILE")
-    if not cve_check_db_file:
+    if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
 
     if os.path.exists("%s-journal" % cve_check_db_file ):
-- 
2.17.1

