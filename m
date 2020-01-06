Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
	by mail.openembedded.org (Postfix) with ESMTP id E11AF7F941
	for <openembedded-core@openembedded.org>;
	Mon,  6 Jan 2020 10:57:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=eGM3uSQOeX9FUiS5vfSIXNzLWdtYwnHOrMb+VJuM7ZMV/G/8BcZH2x9SqBzYGoMnPKJIk+2ublsSRGXZBvysq894GLBtowtuCstuqAaxK3eZphUgyf2L9q1c1LC4AaUxWgch8Qu/3sYCVvjsQX07Z5K/vn13TgKErpbr5G1j7naE9LoFWfni3p4Sm5r+IAwrryxLCunZbITKguPHrlG+TDc1xxUqq2YXfCF6rzbCs95ZwuOcscnwXcF3d0CJvv74DDOvN/NoeHoZx4TmDfY7kW6Fkh+GitL1EgzOKgStNEBiry17FzToh0tITXVRm1KfNO9m9MpGFWveHAtp6mXIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=68OEj16HuvgwVMBsZCajfTo7qQElgR+3qCaSVsOm00Y=;
	b=aojaq3K91zRYhKoJmzc7BHZ16eVlOiUK/V182DX43mj1wzI74jN6W9LF3lfmROaH57MR0I6TNtkGBG7+qci/NA+Q2oBOotG1+TNvATgwDN07vvvmFaX4YajMqy62vdSKdL7Cy3jqjOENaM9K0Ry3qTBIP/y06cO0cOP5nmospbCL3sJVQn1eQ52rTz9jfD/i2UD/xvV69hBZIWt3A2kCRV+8YhHskbbEQG2zWBkXgv1UfV/HUxuZwf6j1cFDNUykU0BYGO5zjWqtL2EB5YWYSQuyOgpDnpMurANVuclmVt9TeXLkdZ/YM1ConSo/S8SUaGMH7KH3K3diWS02APqSSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=linuxfoundation.org
	smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
	header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=68OEj16HuvgwVMBsZCajfTo7qQElgR+3qCaSVsOm00Y=;
	b=Gwpe6Rlel1Mqz0JnSWNDklkNPRl2/HroETvj+qsPsNw8GIY85AIJwhRPpVzlqpY8C2PWJ+7AkK+jXMvj/+5b9SgVxRkkCetJp1RSK7J8Slekj+pMQs+TcJjX9m0C1FMZkh8qm7ZD6TB4FDPdf3L/NylBE+pBx0JcDO1U2LYrHkg=
Received: from MWHPR02CA0012.namprd02.prod.outlook.com (2603:10b6:300:4b::22)
	by DM6PR02MB6330.namprd02.prod.outlook.com (2603:10b6:5:1f9::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10;
	Mon, 6 Jan 2020 10:57:47 +0000
Received: from SN1NAM02FT036.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::207) by MWHPR02CA0012.outlook.office365.com
	(2603:10b6:300:4b::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via
	Frontend Transport; Mon, 6 Jan 2020 10:57:47 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; linuxfoundation.org;
	dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT036.mail.protection.outlook.com (10.152.72.149) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2602.11
	via Frontend Transport; Mon, 6 Jan 2020 10:57:46 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ioQ4w-00042I-8w; Mon, 06 Jan 2020 02:57:46 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ioQ4r-0008BM-5o; Mon, 06 Jan 2020 02:57:41 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	006AveeV026393; Mon, 6 Jan 2020 02:57:40 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ioQ4q-0008BI-B0; Mon, 06 Jan 2020 02:57:40 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 02:57:39 -0800
Message-Id: <1578308259-3821-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(189003)(199004)(478600001)(8676002)(2616005)(70206006)(356004)(336012)(70586007)(4326008)(26005)(186003)(426003)(19627235002)(54906003)(316002)(6916009)(7696005)(8936002)(2906002)(5660300002)(36756003)(81156014)(81166006)(9786002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB6330; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b9894b4-2b2d-4fa3-c162-08d792974393
X-MS-TrafficTypeDiagnostic: DM6PR02MB6330:
X-Microsoft-Antispam-PRVS: <DM6PR02MB63307FFC2B3A41B6838187F9B93C0@DM6PR02MB6330.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:302;
X-Forefront-PRVS: 0274272F87
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P6uKMW3dXDJ5Blxt3q4eBs3kF6UJpemEP6z1HLeagYt52SOD1d6CualMaW6plsyu66edte0vBJHcs/FVWap7gplmbZNpysuF56BDh0vPWVRO3BsaV1VlFikoXHY1bIcm3joWVt7nCkz0q/+FBVco8tJ2Cvm8o84G0oFNKk0Hn6xB1YTlQ5er0VG08/npLfqo/zImjBb9CiFvobJxa3DsfvQUgSPMgxmAZqeB9l4y/vS6aisB+99xh5IapzUBLR33uvmbXt2NdZF8UxzMaeWbRLyutJXwYqJMFkhkQ/YT6oti1WoJ39Xnj6yDok7fOkcgiUrXyXmIKY1p/4SpXcHLlOq1z4LtxmSoZOWUAdkp1lMz4e1rbS4nJudbM1MjLqmICPRDGGNQ4Rhw1G9PzejMA+6b12tEGtmHYSDIPON6yAXD83MarEL4oUjV93/OnK2X
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2020 10:57:46.6567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9894b4-2b2d-4fa3-c162-08d792974393
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6330
Subject: [zeus] tune-cortexa72-cortexa53: Add tunes
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
X-List-Received-Date: Mon, 06 Jan 2020 10:57:48 -0000
Content-Type: text/plain

From: Joshua Watt <jpewhacker@gmail.com>

Adds tunes for Cortex-A72 Cortex-A53 big.LITTLE SoCs (with and without
crypto extensions), e.g. Rockchip RK3399

(From OE-Core rev: 78a555b324c30b2970eaa046c5d86de7980e678a)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../machine/include/tune-cortexa72-cortexa53.inc   | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.inc

diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
new file mode 100644
index 0000000..0d43531
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -0,0 +1,23 @@
+DEFAULTTUNE ?= "cortexa72-cortexa53"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
+
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mtune=cortex-a72.cortex-a53", "", d)}"
+
+# cortexa72.cortexa53 implies crc support
+AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
+ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
+ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53"
+TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc}"
+TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crc-crypto}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
+BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
+BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
+
-- 
2.7.4


