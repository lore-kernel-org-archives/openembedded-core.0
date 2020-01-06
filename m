Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680066.outbound.protection.outlook.com [40.107.68.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6B20A7F8AA
	for <openembedded-core@openembedded.org>;
	Mon,  6 Jan 2020 10:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=i2gWw2dWUplrf0ObM/FlrJKiX8DiySQfjUgWvPVtVCvNWdzN/ho3K1ZsDeO7sSS38/VMIlh/8PzHN/dT6aaRNKk2iQG43OH7JK/mDGiG699ZOYyf2IqLjmS1XJW5yszhc9/p92XpgHy1wpBYutbS7Ld+vgVQSWnDPWQQhusNZ2VFI5x/85h7ijen0b8zU32GPdLsTOqXgd5BW8t4eksRDFJkNffReTdbfYCK+GgN3c19bN7nfUV0hnok8wm3En3ykwy70tM+wzR/ByuSJ4oJgJcqdOLpMWpi/i+AdrEI+6lgStCwhj2PB1+HHXBtu3lE1cJZ9Y1aWANgzvlhmqwI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OGe7iTGzjLKB8010uto4dKTL0O9lYb1aMkqUGEUWCzw=;
	b=JfNud1HU90tCCr5pCoo636o27RnqgSlg2mEoP6z4qnDCj01Nm3O4ugqsLjKn219c+f3eAUKd1XQMqgfWUCIcTEzyW0E1cweIGSPhibiwFueGAnNYNYWDzSbdZxP7TAwLCyDvbfkCGuWvUUjejySHX4NgPahcPwDuAEmv52y8xOC43XgaOeAIEMzqNX05DKtKH38sFFdvFi1u1cSzbv6nKJnDghIVFsEshIsDcfiMDNTJr5U4Tb5B84XGxNVY9kEMStvmFdWjdKzin0To9/mcJ2FunzOWv/YEmaexXWxpEOeKmQQXCR0pQSFufET/otWQpycXaB0Q/V7OpGd5fzgHhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=openembedded.org
	smtp.mailfrom=xilinx.com; 
	dmarc=bestguesspass action=none header.from=xilinx.com;
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OGe7iTGzjLKB8010uto4dKTL0O9lYb1aMkqUGEUWCzw=;
	b=HfmCTtxBPu6toF0zoRwnVcKam3oIkFoT3f0vvg5Jzst8ot8ZZdhJ9KDQGrIcwoWFh+G/qokYz7P7mDJzm8jDkTPsVc9PFGTyTw5VJzlRqZfZ2O4xOoMbN6aSYg3h9pUS5K1QY0sO4xT+m80Yi1CBVjGY4+vNbXfIj8wx24T6woQ=
Received: from BL0PR02CA0099.namprd02.prod.outlook.com (2603:10b6:208:51::40)
	by DM5PR0201MB3479.namprd02.prod.outlook.com (2603:10b6:4:78::35)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12;
	Mon, 6 Jan 2020 10:55:06 +0000
Received: from BL2NAM02FT031.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by BL0PR02CA0099.outlook.office365.com
	(2603:10b6:208:51::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via
	Frontend Transport; Mon, 6 Jan 2020 10:55:06 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; openembedded.org;
	dkim=none (message not signed)
	header.d=none;openembedded.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT031.mail.protection.outlook.com (10.152.77.173) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2602.11
	via Frontend Transport; Mon, 6 Jan 2020 10:55:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ioQ2L-00041Z-3f; Mon, 06 Jan 2020 02:55:05 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ioQ2G-0007j4-0r; Mon, 06 Jan 2020 02:55:00 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ioQ27-0007ij-Qb; Mon, 06 Jan 2020 02:54:51 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 02:54:50 -0800
Message-Id: <1578308090-3504-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(136003)(199004)(189003)(336012)(9786002)(426003)(316002)(4326008)(2616005)(70206006)(70586007)(6916009)(54906003)(8676002)(7696005)(81166006)(81156014)(356004)(15650500001)(2906002)(186003)(478600001)(5660300002)(8936002)(36756003)(26005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0201MB3479;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9747cf19-dbf3-4573-e5bb-08d79296e3b3
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3479:
X-Microsoft-Antispam-PRVS: <DM5PR0201MB3479F8A62CC90328AF0D0672B93C0@DM5PR0201MB3479.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-Forefront-PRVS: 0274272F87
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t2LUwglG6GNNg21qFMromUfS3kxbeKa/y1JeuRGxM5lXIpjSu9U/Xu3QsJtGCxvYGcf3Q6xHAOotCp4GCoUwlWxfwQ2CNYRHnDXJrI9c8SuvOIiL1JCU7+HqYI6FFr0CNXM5HKaRptmOLYm0zE5UfVuN0RKyOuohW3JIm45mabgtA4lZ9fxDMGgLfyb7PBJRKqdekt/mB4uGfpm9IyQCg6cUXmfrH8jDDkMXGFeg2JAF/Mh3iidtZG3PHN6Hm9rj8e71uKtp+7vuv25k/fBPiGf0rGinzxbok/11CLYap0KO6dDVB9+PLzjPc8/yXPSF2QI7dJdxHKUBENvX4a9qiyvMwGT2RL7LjPgnbn9gyKNmx+9auGsIhBiwqQKRACWxV5G7sYzQ08ZwsY3J9nJkzS9aV1NFiG488OWuuBiNw5k9/Wks47SZYX1/7RVU+mQ7
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2020 10:55:05.7380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9747cf19-dbf3-4573-e5bb-08d79296e3b3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3479
Subject: [zeus] feature-microblaze-versions.inc: Update MB to v11.0
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
X-List-Received-Date: Mon, 06 Jan 2020 10:55:06 -0000
Content-Type: text/plain

Update the Microblaze to v11.0

(From OE-Core rev: 0cd48fe0feb248c451841f6ad42777460ac81c7e)

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/microblaze/feature-microblaze-versions.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
index 955674f..3221e2a 100644
--- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
@@ -44,6 +44,7 @@ TUNEVALID[v9.4]  = "MicroBlaze version 9.4"
 TUNEVALID[v9.5]  = "MicroBlaze version 9.5"
 TUNEVALID[v9.6]  = "MicroBlaze version 9.6"
 TUNEVALID[v10.0] = "MicroBlaze version 10.0"
+TUNEVALID[v11.0] = "MicroBlaze version 11.0"
 
 # Version conflict matrix
 TUNECONFLICTS[v8.00] = ""
@@ -60,6 +61,7 @@ TUNECONFLICTS[v9.4]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3"
 TUNECONFLICTS[v9.5]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4"
 TUNECONFLICTS[v9.6]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5"
 TUNECONFLICTS[v10.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6"
+TUNECONFLICTS[v11.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6 v10.0"
 
 # Version flags
 TUNE_CCARGS += "-mcpu=${@microblaze_current_version(d, True)}"
-- 
2.7.4


