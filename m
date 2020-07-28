Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.80])
 by mx.groups.io with SMTP id smtpd.web10.3247.1595900226710244903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 18:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=BHxLbfID;
 spf=pass (domain: agilent.com, ip: 40.107.244.80, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4m2wOydm3VhRbbdce/YoA5E3HjzwxTQCzjAtZcuNZ0ZR2E2cb2PaQstgYjPTC/fzmX4tohj2+fy8ISulzKkrDpg1L3r3Mq5x0EWZycugPjwuOO2y8/aYt6hQKSf0wXtP0ABRHS5i1KQ6kknYpUKC3nhpFpFq7hdW0TMJazb7/90+Y2w3VtQm2kvFrM/9pdJ9y8XmoPWJzoCuf2IZE66TCaZgMLV+W0Mfed23DfjmerQfkDGzdWZOM8EkHaUdQDMIu8G6bzxrThuqqBijOp6zvBOTut5PsGtycDg4BhQ/zq/eJMVFGdHBKfidQ8MROc1UAiWo17HBEuASQtu6RCdSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7pDQpT+IxBUg76wGad5jKWaClCRNkAH5SWRihWpZak=;
 b=QaRvrNyiMgsMSkltHmM0ltNt7gxqQu6vSm30/0tMxjGp/0MdQppSg5xaoxSB7J43rDRuLQBTgXeUfbdQ0dNetRdVThWUQDZHNpFLQ5eVo9bzk+ztznSYdvNCxrljaq5ZOEMrCM9w5x5Cr8QQY/OnG6msIgSGcmfIKbVQT/V6uYA4jaoxWpWNJE4D4h/yE2k8aP+xEbCOBgPYw+nh3dShezrRa0MaJN8pwbz0nE38ky43gFEcuQmqjkbxEk/kIYG6E5ca5H96tGsnLsVNZcM5h74qdJokrwm1xppKDjNDvMxj2ueaMniBaueeO/71FBPsrag68TfuufL5Hb3L21fwSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7pDQpT+IxBUg76wGad5jKWaClCRNkAH5SWRihWpZak=;
 b=BHxLbfIDMffE74LMg+Kg/gLC4abNIG+r5Ia1w5d6+FIsLLNNmo08YW4Yb+aHjSRCtIfr4KdIw/peIb/YM8sw2CvpUrrx0lPXz9ihSR6HZfBnQOgGSNKUpVLzgTsOqI7yhpANkMYNNilcmg5LI50SS6bzDs+SilU0cneBx5KU9x22B8ZPEazd/rqDBZQFlwohnigWK3ilba1UFNdp73cti+48LwhoJcZVYH/G+0hG/+ZdrtdzwhH6CR7IcouYzW1pf12QketO92YUAxgrgVGGLee7aTjAvj/Hv68xhXYmyfwFWwFHx1RRPM5uD74hAg37ZNJAgL+iNrpmXq+ifeIh6w==
Received: from MWHPR08CA0051.namprd08.prod.outlook.com (2603:10b6:300:c0::25)
 by DM5PR12MB2565.namprd12.prod.outlook.com (2603:10b6:4:b8::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Tue, 28 Jul
 2020 01:37:05 +0000
Received: from MW2NAM12FT051.eop-nam12.prod.protection.outlook.com
 (2603:10b6:300:c0:cafe::a1) by MWHPR08CA0051.outlook.office365.com
 (2603:10b6:300:c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Tue, 28 Jul 2020 01:37:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.37) by
 MW2NAM12FT051.mail.protection.outlook.com (10.13.181.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.14 via Frontend Transport; Tue, 28 Jul 2020 01:37:05 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server id
 15.1.1261.35; Mon, 27 Jul 2020 19:36:51 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [meta-oe][PATCH 2/3] base.bbclass: make oe.log_colorizer available in global context
Date: Mon, 27 Jul 2020 21:35:56 -0400
Message-ID: <20200728013557.111830-3-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728013557.111830-1-chris.laplante@agilent.com>
References: <20200728013557.111830-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg1.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 153c6553-1bb5-4f6c-ed94-08d83296bc0f
X-MS-TrafficTypeDiagnostic: DM5PR12MB2565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR12MB2565D0A4ECB3166922ADF9118B730@DM5PR12MB2565.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4TvhCxFYSPmCqOj+SC1J1DMEncGZrAHWxl12vCGrzHSpTiYEDVnTrSgI1Ghj93Ol8ZMvWnG9+3zKKfFqwUyHqIiSd+cM2sVJqXMoOsN2H5BOP5Dhyxd+sZdVjRBjmRyZDrqtWNr21rHu0YzxpDbKW4Y1u9dHnQ5eyX4sjyXReYuxtD+/Fjz7bzKDzHp4CQjn9HbC6G7FT3RJPPCWuN68ay5JAO3NpPL8H8CSx60zXrlhghhf3m4qjbYp+DXxGAoOxh2LffRxBS6BYx0L5pN2hjspTN99IdDB3gnT9zaOgbYghMHv5ILVWSZnroNjIU+QPGbJ7o0to8nlzF7zV4boGHV7xhkGoZLu4EDAQfmV/74yTAOSMM/5ASfq2kYLYjFcebR1KJ0GuHRssbQSzgk9ux9Q2vu+Ni9X/x6q28OHvi4=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(396003)(39860400002)(29502001)(46966005)(83380400001)(8936002)(70206006)(86362001)(82310400002)(356005)(478600001)(2906002)(36756003)(1076003)(107886003)(956004)(316002)(4744005)(5660300002)(186003)(336012)(426003)(26005)(2616005)(82740400003)(8676002)(6916009)(4326008)(44832011)(47076004)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 01:37:05.3319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 153c6553-1bb5-4f6c-ed94-08d83296bc0f
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT051.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2565
Content-Type: text/plain

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4c681cc870..5a969b207a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -12,7 +12,7 @@ inherit logging

 OE_EXTRA_IMPORTS ?= ""

-OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license ${OE_EXTRA_IMPORTS}"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.log_colorizer ${OE_EXTRA_IMPORTS}"
 OE_IMPORTS[type] = "list"

 PACKAGECONFIG_CONFARGS ??= ""
--
2.17.1

