Return-Path: <chris.laplante@agilent.com>
X-Greylist: delayed 25154 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 08 Jun 2019 10:33:05 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
	by mail.openembedded.org (Postfix) with ESMTP id 731827D69D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 10:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lIB0Al5FTUKe1HiJJV8QUjfgILyMwHYY4gmJqGo2uBk=;
	b=HCQfg/EPDwe1q8LBep5QniNUbxoNDefykKBiWaQWMlVabbBUbjMSc9B89Nny0uQv4qJ7Y1NhMWTyqv88/iiBj5B2MyVDGdazIYiXthQKlRUIfkPfDDPZCbaUq4ex3j1z+Kl7u2PaelRJgw/f82wI8gqNybkeutUlnFBvs2KIZbA=
Received: from DM5PR12CA0066.namprd12.prod.outlook.com (2603:10b6:3:103::28)
	by BY5PR12MB3923.namprd12.prod.outlook.com (2603:10b6:a03:1af::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12;
	Fri, 7 Jun 2019 18:58:08 +0000
Received: from DM3NAM05FT027.eop-nam05.prod.protection.outlook.com
	(2a01:111:f400:7e51::201) by DM5PR12CA0066.outlook.office365.com
	(2603:10b6:3:103::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via
	Frontend Transport; Fri, 7 Jun 2019 18:58:08 +0000
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
	15.20.1987.5 via Frontend Transport; Fri, 7 Jun 2019 18:58:07 +0000
Received: from unknown (HELO localhost.localdomain) ([10.46.26.152])
	by COS-US-IRON05.COS.AGILENT.COM with ESMTP; 07 Jun 2019 12:58:05 -0600
From: Chris Laplante <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jun 2019 14:57:52 -0400
Message-ID: <1559933873-119485-1-git-send-email-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.7.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: =?us-ascii?Q?CIP:192.25.218.38; IPV:CAL; SCL:-1;
	CTRY:US; EFV:NLI; SFV:NSPM; SF?=
	=?us-ascii?Q?S:(10009020)(376002)(396003)(346002)(39860400002)(136003)(29?=
	=?us-ascii?Q?80300002)(29502001)(189003)(199004)(305945005)(2616005)(8676?=
	=?us-ascii?Q?002)(476003)(486006)(36756003)(126002)(14444005)(77096007)(4?=
	=?us-ascii?Q?4832011)(336012)(7636002)(50466002)(16586007)(426003)(432600?=
	=?us-ascii?Q?8)(107886003)(186003)(48376002)(76130400001)(356004)(6666004?=
	=?us-ascii?Q?)(51416003)(316002)(26826003)(47776003)(478600001)(566030000?=
	=?us-ascii?Q?2)(45126002)(246002)(2351001)(63266004)(50226002)(70206006)(?=
	=?us-ascii?Q?8936002)(2906002)(73956011)(26005)(106002)(86362001)(4744005?=
	=?us-ascii?Q?)(6916009)(5001870100001); DIR:OUT; SFP:1101; SCL:1;
	SRVR:BY5PR1?=
	=?us-ascii?Q?2MB3923; H:COS-US-IRON05.COS.AGILENT.COM; FPR:; SPF:Pass;
	LANG:e?= =?us-ascii?Q?n;
	PTR:nospam.smtp.agilent.com,relay.sgp.smtp.agilent.com,rel?=
	=?us-ascii?Q?ay.germany.smtp.agilent.com, bastion.and.smtp.agilent.com,
	bas?=
	=?us-ascii?Q?tion.ap.smtp.agilent.com, bastion.britain.smtp.agilent.com,
	re?=
	=?us-ascii?Q?lay.am.smtp.agilent.com, bastion.germany.smtp.agilent.com,
	bas?=
	=?us-ascii?Q?tion.am.smtp.agilent.com, britain.smtp.agilent.com,
	scan.ap.sm?=
	=?us-ascii?Q?tp.agilent.com, relay.eu.smtp.agilent.com,
	cos.smtp.agilent.co?=
	=?us-ascii?Q?m,bastion.eu.smtp.agilent.com;MX:1;A:1;?=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a11b6cc8-1977-49f5-207f-08d6eb7a146a
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
	SRVR:BY5PR12MB3923; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3923:
X-Microsoft-Antispam-PRVS: <BY5PR12MB39233F319911E308485624178B100@BY5PR12MB3923.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0061C35778
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: U55soc3KP8w4FFJTipsc7+tHZL1ae7y1hIcUPtPn1uGIrkaB6N5cW0KO1SYLndIaQCw8hlV8HLoPJBvRoPsXxVMQhHQoqjeKNFG9WYZ3ed7JM5rVq9ZroD9ABIyowJ5A5Wgh+gdISzITtVCnTGJPePc2w025NNrgHGA7b6G25Xid+SRaitSmZLbg5nm5PhnzJ5vkWQ/KFxVixhUAIkROYO1JqlL0T5ERgWcWk4rvG9fz7+dYHCJs24RR7KJ91sET6nVDVZFmW8FfRM60bRa9VZMeDaInEke1ZUlY+wNeC0F3AutKcvRW/mfsoyhVum44fLbxRGiGYtlfM4XN/psUWU+SWsweUm1EpgKYl1OzhxYXt8SDEQWryv3Nx8TFTp9L4mlhrCY05rq+koSBkYsaSRILNP2oJZyJ8jRdw2lxw7A=
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2019 18:58:07.3595 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a11b6cc8-1977-49f5-207f-08d6eb7a146a
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
	Ip=[192.25.218.38]; Helo=[COS-US-IRON05.COS.AGILENT.COM]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3923
Subject: [PATCH 0/1] Adding OE_EXTRA_IMPORTS
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
X-List-Received-Date: Sat, 08 Jun 2019 10:33:06 -0000
Content-Type: text/plain

As explained in bitbake-devel, the motivation for adding this variable is so that layers have a way of using custom progress handlers. It will also be useful for any layer that wishes to make additional Python modules usable in Python functions.

Chris Laplante (1):
  base.bbclass: Add OE_EXTRA_IMPORTS

 meta/classes/base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--
2.7.4


