Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.62])
 by mx.groups.io with SMTP id smtpd.web10.3846.1585049596919824108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 04:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@criticaltechworks.onmicrosoft.com header.s=selector2-criticaltechworks-onmicrosoft-com header.b=Z0TAQlHq;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.6.62, mailfrom: luis.martins@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iI1vqyWb4OcCbtYx5JdvsqqMCSXQ6pT0HRlgp0IiBBq9w8EXUrddqsY0EIwpjBrUQfmaBarOzVT+nXPpko+Vpi3IyVtTWe4b7VS1elDNHFLdwSnN1aLP9P/ccaycltkivsMdZxGxETU+8USDqK2S6LnV1e2bRh4ojbMiuHv3t9POQ01UoNsWMFvjtQ3z5RbqJA725O/hSOlC0rif+JihbHWfBw4q/O9vbc2CXoiHpgp3MLSzmxJ4Lbyzo79eSJueUkUpE2FjjBS3Myjl3Q2OMOo43yuDrlAjMedHJ8y5+qWFr16kIs+V4/koJkizw9aEXawPibUDc1Blc1Z/giKD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GRaNwi1YgkPr843O9URQXLQdeyVJ1E7LmfMb7yoPjY=;
 b=mpXZOzhda5AQp0pZL9EFnCFkqmLY/TTfPl99w5vXaKicCDxUOBOy7KJ3qbtO37Jng874+gbOQaR3CWsQ7zHVB6+wRYqdKDIEqULsinW5mFZgtjRE4U1YcIrHdVSSu6mVeUxNvbkcJ07gMcp3+NxSSIef7AWkJk+NI1RUZ9RbB09DIHeghaoEF5UOKPIxQ7a6wmrzQuvENK5OWVxXsz3gllTYBb1cOZYxQpDucM/bccX3YJrZyiwqSwY5xMj4pPrV2yt5Y06U68Q4jXNzKts3IGVoI30VCb1IXSspQ4Fv4jJxeuRT9zpjDEYRJ/8TXqBspDdh7bKHxMxrmNdf5Jp3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticaltechworks.onmicrosoft.com;
 s=selector2-criticaltechworks-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GRaNwi1YgkPr843O9URQXLQdeyVJ1E7LmfMb7yoPjY=;
 b=Z0TAQlHqOXyD47n1Ssq83L1YEu8AsHF/5p6adiWSV9caC0fTBpnYosIWxjaOSxNIobttAq3WKgnKcdfa9fr230ZlNp/T7GsWAxyKJCGFtU60KDGOhNYRqobwQxhSQcO28I4aKzp0Ce1VHXbkL8CuDe0V5ombfDTFw7hkxyPlJ94=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luis.Martins@criticaltechworks.com; 
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM (52.134.109.21) by
 DB7P193MB0378.EURP193.PROD.OUTLOOK.COM (52.135.128.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Tue, 24 Mar 2020 11:33:15 +0000
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1]) by DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 11:33:15 +0000
From: luis.martins@criticaltechworks.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] improvements to buildstats scripts
Date: Tue, 24 Mar 2020 11:33:08 +0000
Message-ID: <20200324113313.39528-1-luis.martins@criticaltechworks.com>
X-Mailer: git-send-email 2.25.2
X-ClientProxiedBy: LNXP265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::23) To DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:5:1b::21)
Return-Path: luis.martins@criticaltechworks.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (213.205.68.220) by LNXP265CA0011.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend Transport; Tue, 24 Mar 2020 11:33:14 +0000
X-Mailer: git-send-email 2.25.2
X-Originating-IP: [213.205.68.220]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ce7b34e-227e-4fad-a564-08d7cfe7244a
X-MS-TrafficTypeDiagnostic: DB7P193MB0378:
X-Microsoft-Antispam-PRVS: 
	<DB7P193MB03781A23396D5E121195D2D185F10@DB7P193MB0378.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(478600001)(186003)(26005)(66476007)(81156014)(8676002)(81166006)(16526019)(69590400007)(8936002)(52116002)(44832011)(1076003)(2906002)(2616005)(6506007)(6666004)(956004)(4744005)(6486002)(36756003)(86362001)(316002)(66946007)(6916009)(66556008)(6512007)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P193MB0378;H:DB7P193MB0282.EURP193.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: criticaltechworks.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hn7Ad2vQSidHTKAluKw6M+znfhdrAw1dFiq0NNczX8Gg2WESuhAWElyNkgTqM7B4zsDpp6mzoNw70U+lTAGx0doFDVgOLLrt5bZ+qbLcA86d/ZQYK98VCSyWhaPRUHNqHSCtVvlWGg0EFpS/ZwQcq8cRkMO74+ODn5NmeanKl5p5Lfm1E1ZSDyqtND+rO2QJBvTi5PgjxetFbwiuJj5NvxVOv0PkMYk/vI+7gmimnoUhqrnAhkD1qjVB/pudUHGmebWoqTXe2vB2T766S2tTcjPhU0KaiJledQ6oLIhl/QQGGw5q8wIlY6In49NuX5zr5p83sdZX0V7yY2sILLrdvMBJy/yz040wwQi27SF5cTJZDq8q9+YHMyu65BVoeBzI2cMvo66wCKIt42JdUeXmC2I9+W4YwpQuPY7JbSdwzsfebuB7aL9CiZD+QmKwXWSeWOHVZaGMTQOSXYOuYH16ls9v8dw+mAgwZYq68scpi9LjztZNpz1nX/A1VyfElVTW
X-MS-Exchange-AntiSpam-MessageData: 
	gXkZNcokdzQrBEhqeKowo4Tj+VOa1KcE+0ENCWPWu80J3AJVVlnOVl+3wLRdTWBlsS6TcZNMc+T4O03KTyRAGU4GZZeIvfKSczV+y1AnwKte2DG/IUnngHdWb8/7axV7gW75kt+QPdfeqysuzp27PQ==
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce7b34e-227e-4fad-a564-08d7cfe7244a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 11:33:15.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yx416ldp+9IBBwNIjUR5eFMKygthLpj4TWackNmVIM8egKg1HTNptUCi14mSeFVmCOy+F9qo7mekkgsjBsadf2o9N7LXLUfjazbeaSRIWTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P193MB0378
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This patches add some new functionalities to the buildstats
scripts to allow easier debugging of the bitbake performance.
Some new features like accumulating the stats values allow
to compare the total amount of memory used by a single task
(main process + child processes) and other features allow
convenient analysis of task performance per recipe.

Luis Martins (5):
  buildstats-plot.sh: fix invoking buildstats.sh
  buildstats-plot.sh: filter by task
  buildstats*.sh: add accumulate parameter to scripts
  buildstats*.sh: add recipe parameter to scripts
  buildstats*.sh: fix spacing indentation in the files

 scripts/contrib/bb-perf/buildstats-plot.sh |  74 ++++++-----
 scripts/contrib/bb-perf/buildstats.sh      | 139 ++++++++++++---------
 2 files changed, 127 insertions(+), 86 deletions(-)

--=20
2.25.2

