Return-Path: <ckalluri@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770077.outbound.protection.outlook.com [40.107.77.77])
	by mail.openembedded.org (Postfix) with ESMTP id 99AA57FC93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 19:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=IPM/uKuWWL/eqRjI6nOtJboMhdG4CuzbgTcf7AeMGa319mrCG9z6DthYrMsynQZaFIxgLU9IZpTWgzpfi3cYLd2Ns4j/nJl2w2cwJhycWj4ymN71DO1PGQ4TJQQskPfnT0Y3MmvTtoIbAoOy+8dhqSz7mCog3qSV71jRODPO0h3k4cgjXHeUnVxpBmhLt4q3F3AGaUwYZ+XMGIRtRg9VuGLAJGljAYOLdfaoP7ce630YbgoWTQNxudUzEX8nC+xG7uWq4CWPbcyp+84FK1iPspTK22eSYz1taxK5eCSYJq9OAlG75j1V6adu/9e8kYgOq8T3cTqhEg2Hq/6qscg3LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Wm39uwr+LmaEKG6Qcx5r7iWPGOiY+ODK9lrRn8vJfDA=;
	b=N7nZz77vjoz/99ijg6g7LIQSACDy41loO/uRrGCLdwXWcw5+nm9ATqE851ci/XJN5SmXYvU142VCRPrmiohUqTsCXxEDTzisr3zqaX7dGazgZw8tN+9DgsCdzMWdVSNlLBXoQgeZ8JFHN2CiRxpR1PkAs1aCqB2yLWsIZAymWu7scSj01t0bA2779PZPVmfCH07WGdluwQirob/wSqf7YSbYNVXr5vIkzHLRrEpXR9ZUsGft0ziPiR4c4k+fu2aqslt46bPCM6d4g4WWO3vlr/PfNGCwezuCHcwxtU9sHIM2CiCwH1I+meEuSezvX754qrj7zMCT6u2NJEtRC4Cv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
	header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Wm39uwr+LmaEKG6Qcx5r7iWPGOiY+ODK9lrRn8vJfDA=;
	b=JtfvCh12VNXf7In3eas6KncgF7roJZ9VeKlFc373fy386BRhjH3QJ8mGz9G/Oo2bop2z51RJbfH2WAD5HIOmIkl4M/I5Cl485ITi/X2mrS5RprfrfCkoBmbop8XJjWVI6SByLrurPZ/Lh/G3Y2QIGuVReFT6OeHAiF4DrIukGAQ=
Received: from SN4PR0201CA0036.namprd02.prod.outlook.com
	(2603:10b6:803:2e::22) by BYAPR02MB5077.namprd02.prod.outlook.com
	(2603:10b6:a03:70::10) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21;
	Tue, 26 Nov 2019 19:43:43 +0000
Received: from SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by SN4PR0201CA0036.outlook.office365.com
	(2603:10b6:803:2e::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19 via
	Frontend Transport; Tue, 26 Nov 2019 19:43:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT060.mail.protection.outlook.com (10.152.72.192) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
	via Frontend Transport; Tue, 26 Nov 2019 19:43:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1iZgkQ-0000WG-JC
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Nov 2019 11:43:42 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1iZgkL-00075W-Fq
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Nov 2019 11:43:37 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1iZgkB-00071D-Iu; Tue, 26 Nov 2019 11:43:27 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 11:43:24 -0800
Message-Id: <1574797406-21583-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(189003)(199004)(8936002)(356004)(26005)(48376002)(50466002)(4744005)(6666004)(107886003)(4326008)(36756003)(51416003)(6916009)(36386004)(478600001)(106002)(426003)(14444005)(81156014)(81166006)(8676002)(316002)(50226002)(336012)(186003)(2616005)(2361001)(5660300002)(16586007)(9786002)(2906002)(305945005)(47776003)(70586007)(2351001)(70206006)(7696005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5077; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bed85fc-05c9-49ba-e118-08d772a8f1a7
X-MS-TrafficTypeDiagnostic: BYAPR02MB5077:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5077931BE56FA7D55BFCF9D2B0450@BYAPR02MB5077.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0233768B38
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oE8DeBwuPpS7Ly/zpk0jux1XdZe8anRejiiieVmuIa0So9DtOanrC2f3H23sHegXs5cye1hq3Ahfsrw3dq/kqeL5ivQikcnmyi33jbbdjzY+sxnHbmwkqy5itDUhimLnfrQFrJk10NHPEHcuzfoLROhb9eZdZ0ZSvwBuMMQEWgSTm2gfkS/Zq+rLx+MGSkmd185cp5uxcTZv8n3b1vX30sAPCPYHnOtqTFM5R5zORzCFvxHGvP/d0rLaTeH0XaKlxp90rQB62C/xUHg/D0COGA181BMTOgSh9SmmZmi9YyfEv82BUoeQKNb+MruGMubxzjpmS14B80D9RaKwyyCZ68y/EbC30peqDObn2eCcbod5mnCjS1vZ8N4NpAMtU3efh+3INC6a+TZMzGQe5u+yvd3c9unRCljffdhwoy7Mf4uHfwrlM6LEEB7gzpE9qj8D
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 19:43:42.9476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bed85fc-05c9-49ba-e118-08d772a8f1a7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5077
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH 0/2] Devtool reset --remove-work
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
X-List-Received-Date: Tue, 26 Nov 2019 19:43:44 -0000
Content-Type: text/plain

This patch series contains two patches:                                                                               
1.  update the devtool reset --remove-work user prints according to previous review comments.                         
2.  The second patch adds devtool oe-selftest for devtool reset --remove-work.                                        
    There are two test cases for devtool reset --remove-work:                                                         
    a. One that ensures when users runs devtool reset the source is not deleted by default.                           
    b. The second test case ensures devtool reset --remove-work command cleans the source directory  

Sai Hari Chandana Kalluri (2):
  reset --remove-work: Modify the remove-work print messages
  oeselftest: devtool reset --remove-work command

 meta/lib/oeqa/selftest/cases/devtool.py | 49 +++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py         |  8 ++++--
 2 files changed, 54 insertions(+), 3 deletions(-)

-- 
2.7.4


