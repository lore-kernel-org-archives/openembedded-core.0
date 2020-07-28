Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.42])
 by mx.groups.io with SMTP id smtpd.web12.3178.1595900221908609937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 18:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=hFQWkf+Z;
 spf=pass (domain: agilent.com, ip: 40.107.93.42, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPmV95RcfwCzWoVaSN2ENINhWFE/Syo0p2A78JAVS9OUx/u7qSXDhvM2JFC17VAgnf03oXFYvYlHqNbhdxIJBiT2lwEpM4ib6oXyQpsVaPCZ3b1wqh+Qm7138Jo7+bU9m6GauFBe+DeoSqfhnLRFGWWnru04WPtA4T4Rt8dspQh5UEBZXigQCbpoDzACuMvR36RdR/QPxPjsjgvVXt0IdZdl0BIKcsJNmLkSD4iVZ9IwSpvpGCsuF5rfNqna13+bhkYmrYvtkSAnw137woqYBXnB5uRy6bY7OgZZbIvwbzTcTqewnEXPwferCT+IIQk6nw5qLVNFxcqX8Ho/k8VMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pFvt6jZGDV8VE3oWG5611JytN4PHWz+ZpmO7QWV/lI=;
 b=fYoBJOXz3q5IrjY+pJCdh1wWBjDnajqnX+KeYrqkAucm0HLDj7jdVVyrRV66MZps9R/KicAxQ+dlylrY6hRRvZJFFZA2rPjooyYR7viPvdpYi72ejE6NFQcf0cO+PDJHX+2ygmpxol8dfDNSUvGzuBUQgP8maA9uaS7yPF6kknAbEaslEihSzyhq+siQiz1w2dtd9kxAyLcETKtU11za5I3yMNc02BwYZXM92YgruKEHA0j0x5gLv/ukCaj0yJ8ElGV1AqmpklEZFIRnM2gZ0FA8kKUevxsHGAicBEqoxZ29DxfeZnjYLAH/H6bDcQFhgJ4oS6GZ6gIblrg9k5xupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pFvt6jZGDV8VE3oWG5611JytN4PHWz+ZpmO7QWV/lI=;
 b=hFQWkf+ZZ8SsRKt4WwsalUpaK/MWnQeFhs8z0qF5WcZp/cJsfAEL+lLIThsvqcQ+c6qnkmkxTV65GH3HdBpCbI1mWZHXzsnSUplAHN9elHVh9Z4w2GnsrcP+Y6H0X+AWKUEPXRagOPdNUEY+wROwxlv82Fq9MiFWua+ePwCq1H6xZogfpDVBZDytsiELTbq4qYpHRwKj3OO2pyxYi8i1L2+Zg6yWisgm/38RMaZgB3ajF80f0Qu4wv3q560bC8bqvuYLoOCAgxZpJuYHntihA4VFKeQo4wT7TbTQcOZT2JjCBd5QelSfg1GrG0feCKMXRdI5ebuxI3AhkVXNKkxeUA==
Received: from MWHPR20CA0031.namprd20.prod.outlook.com (2603:10b6:300:ed::17)
 by SN6PR12MB2672.namprd12.prod.outlook.com (2603:10b6:805:6f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Tue, 28 Jul
 2020 01:37:00 +0000
Received: from MW2NAM12FT029.eop-nam12.prod.protection.outlook.com
 (2603:10b6:300:ed:cafe::a0) by MWHPR20CA0031.outlook.office365.com
 (2603:10b6:300:ed::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Tue, 28 Jul 2020 01:37:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.37) by
 MW2NAM12FT029.mail.protection.outlook.com (10.13.181.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.14 via Frontend Transport; Tue, 28 Jul 2020 01:36:59 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server id
 15.1.1261.35; Mon, 27 Jul 2020 19:36:46 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [meta-oe][PATCH 0/3] Log colorizer
Date: Mon, 27 Jul 2020 21:35:54 -0400
Message-ID: <20200728013557.111830-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg1.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c164c23c-eb0e-45ce-a16e-08d83296b8d0
X-MS-TrafficTypeDiagnostic: SN6PR12MB2672:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR12MB26727762EF8A7CD107F5A95B8B730@SN6PR12MB2672.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aDNMZtYDbDjafIiPbw/5PPfVsoKlH4OZCFbchA7NC5EyOufn6MWk2a2K0/hcWZ0FodN+OO6cKf9muuTa7V/FmTLo68K8SOqYRFQKZuGG+r3WtFml3boDTgO//YYjyTmb2HPd4CVrtBxYf62VjckSB5UqsMhh5tNVaxFCb2qwpWsPYVtfDWzlhCI+nlTrermmzl1DZoS185pw7BjPBNhFvuzJIL0IA840Np2rDelBHduCuorm1aaMtjWK4zQgqRgqVwXqiCGAf/QALzj2ojxYLvGLu5dC1iu1StgdgUp5NCxBTNOWgO04EhoMwTOfjGdp8FU/iYI5dGERZeoEu7cNcMm0s0XFsJy0RsrmXC7bKsLqwqzN9/nTONQ3HFZMCYMNWuSQwWuvighEkzXHE1qe9WAc301eso3VsjGrLuxDlvQ=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFTY:;SFS:(136003)(39860400002)(376002)(396003)(346002)(29502001)(46966005)(4744005)(316002)(1076003)(6666004)(70206006)(6916009)(36756003)(82740400003)(47076004)(5660300002)(7636003)(86362001)(26005)(4326008)(44832011)(186003)(478600001)(107886003)(356005)(956004)(82310400002)(336012)(426003)(8936002)(2906002)(8676002)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 01:36:59.8689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c164c23c-eb0e-45ce-a16e-08d83296b8d0
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT029.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2672
Content-Type: text/plain

This patch series turns on color compiler diagnostics. It is especially
useful when doing edit-compile-test development work with devtool.

It is based on one I've been using internally for about a
year now.

Limitation: Note that the *.nocolor and *.color logs will only contain the
 output of the task itself, not any prefuncs or postfuncs. This is
 because the color filtering is implemented using progress handlers,
 which don't see prefunc or postfunc output.

Chris Laplante (3):
  lib/oe/log_colorizer.py: add LogColorizerProxyProgressHandler
  base.bbclass: make oe.log_colorizer available in global context
  log-colorizer.bbclass: add new class

 meta/classes/base.bbclass          |  2 +-
 meta/classes/log-colorizer.bbclass | 49 +++++++++++++++++
 meta/lib/oe/log_colorizer.py       | 86 ++++++++++++++++++++++++++++++
 3 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/log-colorizer.bbclass
 create mode 100644 meta/lib/oe/log_colorizer.py

--
2.17.1

