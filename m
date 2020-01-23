Return-Path: <JAEWON@xilinx.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	by mail.openembedded.org (Postfix) with ESMTP id 8409D7FDB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 21:03:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=e6NtVHduHd1dRvU+gkK0Me5g3yngJtPZT6i04tUm2dV1lGRU6pPc7XvQFZasu4NGuts1sQFsKwQe9vkpAuKzTkI72jtxU0AXIPHs4igHGmOAgCpH4BGoRLEU26mwly5c+tfrX6r0MguqKKas+s/IzkcvxI+3E86SGBgwI25W5Ffk3Kvb1oCnqvZNbmBSnEh8Yp57fygWBV/iSna+YNd/gfxFs9jcejBrW7axE6Ow0lqhsJXWJp5Yehg7irCX2OGZLbq3LVNZkadt4ppeQmI1MVGDumKH0G5rnmKLe4IPQeWVREm7rHkplUfFzru6Y4G+jkeLH9GDD4pNC/XmnYgFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=EpspBXwRwzIPAHS3HflMvy8Pqdd3kCI9bVGYA0/kZIo=;
	b=emvwOoGGWylEv5Xb83WkInpqATXiB8EOFxpj9OU8+d12vam4xFkFehrOH2Y4YvNcuyfk1jgTDYwCFMvRv+I3xlC2R6IXO5PLeHWElU/cLCmQ+y4pCivOBDzsTeCcxcoyMse1Gn7s9wrVAETYQDNcacFLznD9lYivithi5AuFs0MFz5TgHGw1EDwfIcL64koQ8xDgKi8PJAYtBeLzg34dT7ZykeVJAOIRWfdAZxJCpphMk5R/1l4BtKlxm+XqZ/QOLfBgdkSngObqN5j+9XBvw+Me2jGAEuKluozM8kWJ+o3PwoLrCoDZB5oKXSuHYJ+nDnuVxpBocrfqzeeKeu+ghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
	header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=EpspBXwRwzIPAHS3HflMvy8Pqdd3kCI9bVGYA0/kZIo=;
	b=lOMRvV6Ohqo9wCKLjGAtzeInUx9SMASy8UyCFlCFLOGVCW0mbPGyOZUrDk9jAn8CGCdHR7InF/KYwVyl6TtgTTXSBU5k/xhDzm8ksHmykZ3PZhbga19vrF22bz6rqxQ50t6/CoLt4bqOPU/gQnlvVqtPQUSB8Y/w6fGhRZ7cVHU=
Received: from BYAPR02CA0063.namprd02.prod.outlook.com (2603:10b6:a03:54::40)
	by MN2PR02MB6414.namprd02.prod.outlook.com (2603:10b6:208:1b5::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.23;
	Thu, 23 Jan 2020 21:03:08 +0000
Received: from BL2NAM02FT025.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by BYAPR02CA0063.outlook.office365.com
	(2603:10b6:a03:54::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.17 via
	Frontend Transport; Thu, 23 Jan 2020 21:03:08 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT025.mail.protection.outlook.com (10.152.77.151) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2665.18
	via Frontend Transport; Thu, 23 Jan 2020 21:03:07 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1iujd4-0001cn-Td
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jan 2020 13:03:06 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1iujcz-0003r6-QF
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jan 2020 13:03:01 -0800
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iujcy-0003qr-TZ; Thu, 23 Jan 2020 13:03:00 -0800
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 13:02:59 -0800
Message-Id: <1579813379-1724-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(199004)(189003)(36756003)(426003)(478600001)(107886003)(4326008)(5660300002)(2906002)(26005)(2616005)(7696005)(316002)(9786002)(356004)(70586007)(186003)(336012)(44832011)(70206006)(8936002)(54906003)(6916009)(81156014)(81166006)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR02MB6414; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf6cc17b-f1ff-43fb-532f-08d7a047a58b
X-MS-TrafficTypeDiagnostic: MN2PR02MB6414:
X-Microsoft-Antispam-PRVS: <MN2PR02MB641465B7FDE8B5B8B2E699B9AF0F0@MN2PR02MB6414.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 029174C036
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3bCR+tOTfVHEny//fsJCrXiO5fs64cJjkEyGhXMMQBOvbOd0KVQeTA8ky03qNhdios0FQP3JoDbmKb1LsOh/lyGy7jMqsTwQJS3Lvk4vQCGAV5aWB3iEo+DGsD5FDCAUKry4pBobrEYhyMNvdJfqpQVln/0Xzear+i8tGWPE4MdInLHbCpSUKFytScte0FXdtKEgko/gnlAAesFi1PVc3U2SWYTmoeCHxBwQdim3uh/K0mcYEOvbw8V4K/n+IUrjvOStlbVtc3D5Yluwwq59zTRcietuVmo2y48YIUFi23gQrmOWwMhDQVSGLZpyozoq4Roc3icq4t8mE/cqM8WH60ChATXryVRi6afRs7iNLqPBXy4+pKrIeGBOZaFRLklSmqAAKSpNFP/SjsGmfES3oovYiqzWpV+tBzNZNPaBS+WkQFP86pws5VqdvFmzgz1s
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2020 21:03:07.4926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6cc17b-f1ff-43fb-532f-08d7a047a58b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6414
Subject: [PATCH] tune-cortexa72-cortexa53.inc: Adding missing TUNE_FEATURES
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
X-List-Received-Date: Thu, 23 Jan 2020 21:03:08 -0000
Content-Type: text/plain

Without the proper default tune in TUNE_FEATURES, certain variables
won't expand correctly. MACHINEOVERRIDES won't add cortexa72-cortexa53:
TUNE_CCARGS won't add -mtune=cortexa72.cortexa-53, generating the toolchain
incorrectly.
Adding missing 'cortexa72-cortexa53' to both
TUNE_FEATURES_tune-cortexa72-cortexa53 and
TUNE_FEATURES_tune-cortexa72-cortexa53-crypto

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
index 0d43531..f208b98 100644
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -14,8 +14,8 @@ TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -
 AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
 ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
 ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53"
-TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc}"
-TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crc-crypto}"
+TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa72-cortexa53"
+TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
 BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
-- 
2.7.4


