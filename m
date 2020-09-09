Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.79])
 by mx.groups.io with SMTP id smtpd.web10.6598.1599684700592758838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 13:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=Zoy9LEM2;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.76.79, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbqRTd42r5RMQ0kDYWpDJZgXrUs+zKCYX3iqwt2veXsVwH3wA3em8mOcpTT+YjJG63kxffcxrb1Xz+64YNgt69wBpLPqMNpX4293rr9FAfoq3JmrhTgrRC3wJO7GqjrtTl4Mw321vy1boqAeH6E/9xREdzFt33XgAIqDpEr0DdN++mc0+IuBFdRDomJ/hZt9cUHWlKejtJ/KMoMzDmFZeTiwEgC4pSf+DRnR8+b4FlTK35t812cTn4KM9GCqwn172OAm+iOzCoWFayYcDbLzFI+5UO9t93Ycg6+7NEsKi9h8boFBFpbfLA9NdsFKBJuiTT+aZ8B6+PpiG9EoQ7P3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsil6wO2c39yWAG26fDqtg9WpgVNWiQ1Jy9hP8G+MNU=;
 b=KngKowBiCcgQb3jJ3LshTdPe1XsdnM/ffkMh5i1TCSCfNi+JlmlsfGNxq1PudxiDHqDinSOwEOqAkIBqPq35trHs3eF8xdtomEKzBx2ZDjQq+Q2jg1BylzK6CH3hIMQMAuaJlI1VRs1HtVZPQKUng+ubHcRKFU0m41yHrWv7hDpLIn+tDCJxdGr4OA4tva/wZAEI1OlXOXwaccQrQnm2AqcxozP+X+AacbsVkjSgtRARsGYJJMRKmp3GGysX+v4FL2xm4Pclxlg3LIPNv3bBrQ/abaWtfNIwz6xV5gbXGAzQmfQ7Cz6E4SVa3MEDhp+TYpM3v3YpTCR6bDYnpJYNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsil6wO2c39yWAG26fDqtg9WpgVNWiQ1Jy9hP8G+MNU=;
 b=Zoy9LEM2zwBOV1hhQRZNEVvmzH4zZ5gkXBObmr9JOJ5vudT+eWjQpRakm624B5MH4ApYHVWjkq7dgg7XSlNZF8ZIRH0MdP9Hpq1RFeBBKkjap+YiTgCioNDPopZ9FX6zIIKDrsERXUkfzajzSAJ8KcrvxqmwdzD2Je/9udt7bPPGnYL1Dzirv4VLfRe0/4lpaUA+gAGRG0AYHimbn0O8/eUmzvh/C1UWWinHtOwrPETeEAqxL/xWCBuFiiCC+yWIzVwU/3cNtT/GCdcYMwWbgkbE2Cb/rmHeyXTcgb+w6cqBdtH3LB1Ddtfvnm8E74Fl/5zKUq0cvvLE5K/N2Q3HrQ==
Received: from BN6PR13CA0026.namprd13.prod.outlook.com (2603:10b6:404:13e::12)
 by DM6PR12MB4315.namprd12.prod.outlook.com (2603:10b6:5:223::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 20:51:39 +0000
Received: from BN8NAM12FT039.eop-nam12.prod.protection.outlook.com
 (2603:10b6:404:13e:cafe::76) by BN6PR13CA0026.outlook.office365.com
 (2603:10b6:404:13e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.9 via Frontend
 Transport; Wed, 9 Sep 2020 20:51:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.41) by
 BN8NAM12FT039.mail.protection.outlook.com (10.13.182.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Wed, 9 Sep 2020 20:51:38 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server id
 15.1.2044.4; Wed, 9 Sep 2020 14:51:26 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2 0/4] cve-check fixes/enhancements
Date: Wed, 9 Sep 2020 16:51:05 -0400
Message-ID: <20200909205109.120033-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg2.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5892a66-f279-4180-b756-08d85502261a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4315:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR12MB4315C37E037B4B0C6FCAEC2C8B260@DM6PR12MB4315.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZGjFRiJNKLmUZybnCnU7bY07FlQCkW041siWBRfg5+1yAQlym7Mc+RhSNb/2gpP6I1XHxQrVYj7CoN0jefFJ+3eOVpCvBiBUYCSchQnr0AYcdQL5+kQB1mbOhz94F/wJ5+Zlpv+Wxgap8ne/fj2kbrRUNfVrbf3eUDWU8DHCoaVcncauYkOneP4AAQ5u1GpXxcajT3HCxkhgpT01qainJm5CVCxlnOE2dl/4CBojbOfSVMGhaY7X4cIVLkF0+UkaEOTk7KIXNhDK0HKoV3TxXbilONofGejmvwDuhSly68v9iXu/gvpKpfx+voY1lYp9E8CrzO0ZT0LOg72CuZ62Lno2cQudEcmUDG2anxFQptKtl5Ob1DqH2JfVCofqcqWHtAB4rhQ2HKuKqqKSGGXnj19bFgtsHcTtTilDdt0mqyA=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(29502001)(46966005)(70206006)(86362001)(82310400003)(336012)(186003)(107886003)(4744005)(2906002)(26005)(4326008)(44832011)(5660300002)(478600001)(6916009)(36756003)(47076004)(356005)(426003)(6666004)(1076003)(36906005)(7636003)(316002)(8676002)(956004)(8936002)(2616005)(83380400001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 20:51:38.8227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5892a66-f279-4180-b756-08d85502261a
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN8NAM12FT039.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4315
Content-Type: text/plain

v1: initial
v2: use lockfile in cve-update-db-native as suggested by Ross Burton

Chris Laplante (4):
  cve-update-db-native: add progress handler
  cve-check/cve-update-db-native: use lockfile to fix usage under
    multiconfig
  cve-update-db-native: use context manager for cve_f
  cve-check: avoid FileNotFoundError if no do_cve_check task has run

 meta/classes/cve-check.bbclass                | 14 +--
 .../recipes-core/meta/cve-update-db-native.bb | 96 ++++++++++---------
 2 files changed, 57 insertions(+), 53 deletions(-)

--
2.17.1

