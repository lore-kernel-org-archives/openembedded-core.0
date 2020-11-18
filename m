Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.71])
 by mx.groups.io with SMTP id smtpd.web11.31371.1605733070928839367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 12:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=LrtnuvMA;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.92.71, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuBdDdoapTTwhkTA9QB2qkf26FQEYZ7oErTsWIudVntsSwltEeO4RUTAUIYSd0b/WmfliOXUdLJ5iAk6JuyP4PCIEHE6GN7G2lX4cGLgWC4rk1i7yDS+x7kmlmjSsScUbBE9+pidghrR+yMX6hF8WuHHoAt/UVupQ3m+XyZXpRNLlETKG7w3FE/zcQ0NlNFPQI14zi1KfU4kvh5Qrd1ZWR8BqWZNuXoq125TDO9pXyThU/huVRkPShGF9qrbh1DaZ3yiPZXWxi2UayB+kX877OmyMO00O8kVoRkZiezCAnNSwGbrPb3xu7qHWVp6bTQq+turwAIMbrH5Iw8wrB4KfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOz1TrUudCr3YekscgUju+vkquJO5ppLBmRwnPAkD3A=;
 b=jZh6/41imXd/fbF7FppDcpR38p93KANisFcYtPPfA2egh3o2qFWK8w/KCBZRPJN38gdSz98lKlvWeSe6C/XqomguMKyp8DgZ3cfI80mkAlxX7lmuc2ITmelROf7iMzDa1J593tDscU2EkTGC1CFkGAh3HPWEuyWKf/09k7+kq+hvmbXmF/upp8XDY0R0S+pLKNO9aOYGTP2A9blwwwQGRWzR5K5iHeK1YGbPpLworiejuztXgEfLDc8tr6G+pCTuDEBr/Bvy68FAK7RNaIyFakQDikt9R/L+Xm6+cY0XrtveSqCMkIYQmBmO1jF7sflx20lm9e50Dd6FOM00kwMErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOz1TrUudCr3YekscgUju+vkquJO5ppLBmRwnPAkD3A=;
 b=LrtnuvMAri3Dek03JEr376JJLkXWJ+Z+AAyOm7YAs5enwgMy9IbPrP6gFFnTVIjea49x3TOSxSbNBtUgm99ZRyaZE6xxg+EqAxcYAmynrSMMsZkqpzj00KuIjMH8aOiEWJEbhrzPC2b1xkHo5ro7GSPrUKL8xlW5jZkbvkoK35vkDuJTK79+QraM7jspoiV1ffRU46w/fkihtyHlyF2q1er/iKLv1EKCPZ1aIa0E5X/sm1PFOXcfJaMLbsJ3sclZ/fn4RNdLWajky4R1+jmfSEAbjdpia2wlafrkv8n+1IhehqqYo+2ntisbSfAFbDd8Jv12/1q8FUZKrQ0pgBnbjQ==
Received: from DM6PR07CA0039.namprd07.prod.outlook.com (2603:10b6:5:74::16) by
 CY4PR12MB1384.namprd12.prod.outlook.com (2603:10b6:903:3d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25; Wed, 18 Nov 2020 20:57:49 +0000
Received: from DM6NAM12FT005.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::c7) by DM6PR07CA0039.outlook.office365.com
 (2603:10b6:5:74::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21 via Frontend
 Transport; Wed, 18 Nov 2020 20:57:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.34) by
 DM6NAM12FT005.mail.protection.outlook.com (10.13.178.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.12 via Frontend Transport; Wed, 18 Nov 2020 20:57:49 +0000
Received: from localhost.localdomain (10.255.84.72) by edgeappmail.agilent.com
 (192.25.218.34) with Microsoft SMTP Server id 15.1.2044.4; Wed, 18 Nov 2020
 13:57:46 -0700
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH] cases/bbtests.py: ensure PACKAGE_CLASSES is set to RPM for bbtests.BitbakeTests.test_force_task_1
Date: Wed, 18 Nov 2020 15:56:36 -0500
Message-ID: <20201118205636.126372-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg3.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 10.255.84.72 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32dff92e-9f8e-4944-e612-08d88c049bd0
X-MS-TrafficTypeDiagnostic: CY4PR12MB1384:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR12MB1384F95F6C32580DC241C8CE8BE10@CY4PR12MB1384.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GkQ1cjM5xk8zUYueJuYZGZiOaFBXVp9YyeauayVr7ZjxpNMZJO9Km04FJPBKY5cnQgy+sANu4/6O7fY/t+PVhUo2B8gl3zze6nKdcAIoClTECzl4tCZMG5pjErFVjCDXrSEnZkmXOkruqHtAg92a0JOxWxSwbEZq7jr7l5XT8TEdzzJoPMHbBzqnOezgX7Pcax9IAk4rcmJe5leopOnfkwScNvILj6A8v/ZXY5m3aaYm2c72A8io5GYki7Run0u/1LO7P6KNJHiM1VBJIYVfynVPe4CRhGVzrSUKYxaq2ZKWw+xueOJLxjWPtVrtAj6Ce4n462J/EUO5dLm0EQV2OsT3girh34eWlalq4Ay6v20EMR/sNrWrY/ojed+EYF0hR6bCdc9A70bGh+TF6y0mR+OOJKsfIoScp5tvtNULetY=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:cos.smtp.agilent.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(29502001)(46966005)(36756003)(7636003)(2616005)(86362001)(47076004)(82740400003)(336012)(8936002)(70206006)(356005)(6666004)(1076003)(82310400003)(4744005)(5660300002)(478600001)(2906002)(107886003)(36906005)(6916009)(26005)(426003)(8676002)(44832011)(316002)(4326008)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 20:57:49.3072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32dff92e-9f8e-4944-e612-08d88c049bd0
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM6NAM12FT005.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1384
Content-Type: text/plain

From: Chris Laplante <chris.laplante@agilent.com>

This is because the test expects to find "do_package_write_rpm" in the
bitbake output.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index dc423ec439..79390acc0d 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -89,6 +89,7 @@ class BitbakeTests(OESelftestTestCase):
         image_dir = bb_vars['D']
         pkgsplit_dir = bb_vars['PKGDEST']
         man_dir = bb_vars['mandir']
+        self.write_config("PACKAGE_CLASSES = \"package_rpm\"")
 
         bitbake('-c clean %s' % test_recipe)
         bitbake('-c package -f %s' % test_recipe)
-- 
2.17.1

