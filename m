Return-Path: <chris.laplante@agilent.com>
X-Greylist: delayed 32406 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 08 Jun 2019 04:32:08 UTC
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730080.outbound.protection.outlook.com [40.107.73.80])
	by mail.openembedded.org (Postfix) with ESMTP id 120BD7E528
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 04:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XRM0ZNHvIShZoPiKfKWHdJDYrkchSZSwyq3DdRWuTok=;
	b=lNxNCsOFxxw5GjIv/5pTf+gmvBLcumoEE+rUu6tE076DjueBFsEol2TeRxHtmGsRk47c1XDXOMBoxcveWXSh+ujFyEbeLEmsGVM9f7bOeUGzrjwv+Wma+cLtkliYFuZGCuFr91MwShaQXRR7aH9rJXLVYSftPH2dxcEHXpHMj2w=
Received: from DM5PR12CA0066.namprd12.prod.outlook.com (2603:10b6:3:103::28)
	by BN6PR12MB1585.namprd12.prod.outlook.com (2603:10b6:405:9::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12;
	Fri, 7 Jun 2019 18:58:10 +0000
Received: from DM3NAM05FT027.eop-nam05.prod.protection.outlook.com
	(2a01:111:f400:7e51::208) by DM5PR12CA0066.outlook.office365.com
	(2603:10b6:3:103::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via
	Frontend Transport; Fri, 7 Jun 2019 18:58:10 +0000
Authentication-Results: spf=pass (sender IP is 192.25.218.38)
	smtp.mailfrom=agilent.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
	192.25.218.38 as permitted sender) receiver=protection.outlook.com;
	client-ip=192.25.218.38; helo=COS-US-IRON05.COS.AGILENT.COM;
Received: from COS-US-IRON05.COS.AGILENT.COM (192.25.218.38) by
	DM3NAM05FT027.mail.protection.outlook.com (10.152.98.138) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1987.5 via Frontend Transport; Fri, 7 Jun 2019 18:58:09 +0000
Received: from unknown (HELO localhost.localdomain) ([10.46.26.152])
	by COS-US-IRON05.COS.AGILENT.COM with ESMTP; 07 Jun 2019 12:58:05 -0600
From: Chris Laplante <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jun 2019 14:57:53 -0400
Message-ID: <1559933873-119485-2-git-send-email-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559933873-119485-1-git-send-email-chris.laplante@agilent.com>
References: <1559933873-119485-1-git-send-email-chris.laplante@agilent.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: =?us-ascii?Q?CIP:192.25.218.38; IPV:CAL; SCL:-1;
	CTRY:US; EFV:NLI; SFV:NSPM; SF?=
	=?us-ascii?Q?S:(10009020)(136003)(346002)(396003)(376002)(39860400002)(29?=
	=?us-ascii?Q?80300002)(199004)(189003)(29502001)(50466002)(45126002)(5660?=
	=?us-ascii?Q?300002)(6916009)(51416003)(107886003)(48376002)(8676002)(761?=
	=?us-ascii?Q?76011)(73956011)(4326008)(70206006)(36756003)(316002)(290600?=
	=?us-ascii?Q?2)(86362001)(47776003)(246002)(356004)(63266004)(76130400001?=
	=?us-ascii?Q?)(6666004)(476003)(486006)(8936002)(106002)(2616005)(446003)?=
	=?us-ascii?Q?(11346002)(126002)(426003)(305945005)(50226002)(4744005)(144?=
	=?us-ascii?Q?44005)(7636002)(16586007)(2351001)(26005)(336012)(186003)(77?=
	=?us-ascii?Q?096007)(26826003)(478600001)(44832011)(5001870100001);
	DIR:OU?=
	=?us-ascii?Q?T; SFP:1101; SCL:1; SRVR:BN6PR12MB1585;
	H:COS-US-IRON05.COS.AGIL?=
	=?us-ascii?Q?ENT.COM; FPR:; SPF:Pass; LANG:en;
	PTR:nospam.smtp.agilent.com,re?=
	=?us-ascii?Q?lay.sgp.smtp.agilent.com, relay.germany.smtp.agilent.com,
	bast?=
	=?us-ascii?Q?ion.and.smtp.agilent.com, bastion.ap.smtp.agilent.com,
	bastion?=
	=?us-ascii?Q?.britain.smtp.agilent.com, relay.am.smtp.agilent.com,
	bastion.?=
	=?us-ascii?Q?germany.smtp.agilent.com, bastion.am.smtp.agilent.com,
	britain?=
	=?us-ascii?Q?.smtp.agilent.com, scan.ap.smtp.agilent.com,
	relay.eu.smtp.agi?=
	=?us-ascii?Q?lent.com,cos.smtp.agilent.com,bastion.eu.smtp.agilent.com;
	A:?= =?us-ascii?Q?1;MX:1;?=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5614721d-c467-413e-752e-08d6eb7a1588
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
	SRVR:BN6PR12MB1585; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1585:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1585BEC6828D91A8010FE8AF8B100@BN6PR12MB1585.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0061C35778
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: N9M5/KrbQmWMyc8fdgMQNDw1V7hmCvbaPyKNA6i6nnuQF1EW49L6Qew+Y53dqvMZvniMbah5CIpA/MLjFx77O+P8jknoK6odl9oeZyN6z+WWdivhMnwoh5B2BzlaZfCLgHOkUpCDQjaMrLMx79hXPDQsjjJy1nHmR/ZQeM8eUIvwrDliDpFVEO8PZQZesm6Mj34au88h6AhdhKFh4VKMghFn8K0tI4iHxMzTO/ix23Qh2efjy9V8DhOwr79KycaDiDT4kg3DHbILkIw1YjFf4hJ7+UWKDeoYjOsnRs3DVOajazRHTWUwxX0XYzHDeBViZP42aSk4LowlJa8FW7mqXWWq5bioBhyfee0JRFNJBiXCyAqB/gEsJBRKEef9LOVTCZ3z95Yvs9bVLC1Xf040PclN0Ki12uNEfOGFF4gp9dI=
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2019 18:58:09.2740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5614721d-c467-413e-752e-08d6eb7a1588
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
	Ip=[192.25.218.38]; Helo=[COS-US-IRON05.COS.AGILENT.COM]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1585
Subject: [PATCH 1/1] base.bbclass: Add OE_EXTRA_IMPORTS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Jun 2019 04:32:12 -0000
Content-Type: text/plain

OE_IMPORTS is not intended to be touched by users, but there are cases
in which layers might want to make additional Python modules available
to Python functions. For example, Python modules defined in the layer
themselves (under meta-layer/lib).

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes/base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 25d5fff..90af8ba 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -10,7 +10,9 @@ inherit utility-tasks
 inherit metadata_scm
 inherit logging

-OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license"
+OE_EXTRA_IMPORTS ?= ""
+
+OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license ${OE_EXTRA_IMPORTS}"
 OE_IMPORTS[type] = "list"

 def oe_import(d):
--
2.7.4


