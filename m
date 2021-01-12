Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.69])
 by mx.groups.io with SMTP id smtpd.web09.12080.1610470441882602580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=gFvty54M;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.237.69, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wo1uuMkOjdajhpupV5GHeMZpv2NS2Zoss4/tWI/DcPzjKRgiarBLvYRg2+w0R2Q5V0fJnOwnaCZChe2LoOQRm4oEyY3GOcK8H5fBnYWcZ7P1tWVBAiXv194NkWalURe+eOou0EvuhHsd+bmYH5ydpeux1ILUT+3dCOXQBKvqHLary0gjd5nine2dN4zNQd7JjLV8AuY2NVZokUG8c4zrwnUjz1qzcW+qtm52tr+mu6+xL/3dEpwHiIj0omdvQsnikkRK6D7a1jIWON+XP8hDnjBjoVYh87BU4glhvmueXBlzZY1grgFiaWpn/ffo515NlOAYrBoFhmvLGROxv56lFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pusTPtygZ/PIZOPwkeoMoXG1eJSPBMlNOk3pQkfLslU=;
 b=BtJlaCR9/meM0dPr7t+UOOQOaRQqoW/N2c5TGDf10yp5c/6kLZTCCGpX8f3Wa+p2crw/hACASId/1WTjnzBeOB6gnn5nPviFsNDVe4TRTSJkjIcHuWjyLU97NdQdqvFieXfRmQy/t0FxpgtnMCJAJ0icRVJD6zal2azom0n5mkgkPDa5uhedCc/9ZicNQwm02b/nlbUufCrcgxE0L1B9ITkvSq5g7U4oZGF5NoV99/upjOPYr7RR2BBMu8nj0kIrqPmFWGG4avqmRs2L6KL4DedPH0/15Dadg94iWOJymBoPTk+65PnfLDbwBZ7QHV0Hs1NK2zrX/c+tnh6TV/dhEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pusTPtygZ/PIZOPwkeoMoXG1eJSPBMlNOk3pQkfLslU=;
 b=gFvty54MbulLZmjzrGDp2wA3NO/vKySwaLvXbRHeItCvzhAcHtswFFoBc44CmYoFGGut+JZIh2k7JUH6ubnXc+lwO3P3bC1y24CnH/lAnn4yOTakLvHHUaN1w2VeuK8E7XDUzvYs+NzAy9c3JseGMksZOiZ3BQECfCTVsOIZRFfXnY6HqXtLz4a9iK5YDcDncX28xWVFo8c3iWt+dWsnUxbdf7UazKB0E9/xTTJC1jqpbLPMFoxeYHjrE8xfssdWI3CKYw1RNknd0whqF1zyy150qENZMhrvirJIN/3j+gyU5RJw3bk4WvJvxkxyG0nWE1/iqgcDGgjivo858b9dpg==
Received: from MWHPR1601CA0012.namprd16.prod.outlook.com
 (2603:10b6:300:da::22) by DM6PR12MB4561.namprd12.prod.outlook.com
 (2603:10b6:5:2ac::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 16:54:00 +0000
Received: from MW2NAM12FT028.eop-nam12.prod.protection.outlook.com
 (2603:10b6:300:da:cafe::53) by MWHPR1601CA0012.outlook.office365.com
 (2603:10b6:300:da::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 16:54:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.41) by
 MW2NAM12FT028.mail.protection.outlook.com (10.13.181.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Tue, 12 Jan 2021 16:53:59 +0000
Received: from laplante-lm-19.localdomain (10.255.85.221) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server id
 15.1.2044.4; Tue, 12 Jan 2021 09:53:49 -0700
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jean-marie.lemetayer@savoirfairelinux.com>, Chris Laplante
	<chris.laplante@agilent.com>
Subject: [RFC PATCH 0/1] Workaround for npm + multiconfig
Date: Tue, 12 Jan 2021 11:53:40 -0500
Message-ID: <20210112165341.3723-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg2.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 10.255.85.221 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b2b19ba-55d4-4ca5-580d-08d8b71aa88a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4561:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR12MB45617E8FF9B5FC1235FDB1DC8BAA0@DM6PR12MB4561.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GHJ+3yZazPci/rhmpRTaU5M7FWx6sdB6dOk5TKRm+qfeAe0T82aTsh0ARodNI4+Yj4gKVDJv5ME1TZErr8EpYQuzt9792my8RnGcvl2rNHxS+jYCCPNPVWDZMAcsf+HMjj16zRyCSR4kjgkdMsuCY2XZ6Bry8llwaEb8qmZWUd1s9vPIt1MBFixyoU+PL79v+B1kbTGNF5HrWpojWq0EkOXEgmxGb4IlXZcfrnXPgQS0S6uIBRX976AqMUdIredTWg8gOL0Zmty/XaSS2hp9/AMR3DurGLtjmEFrUdxZexOJao2R5OM5VUo145NDD3Kh4SHEjjUOZBFB2DFIcwwmzO6XO2rKb0xUiCX6rKbipcMjvZJ44oGQ61XFkPZHmi+spf5lsdAXM5APZE7e10mGGhAxwZ0SaUAIPkeuPaJeUmwDGroEehq2yjKFcNZtFuyWLPeIlVKPhp9EuhTyftyn1QIz+p8u/TTuJvB+PMpHAnugX4bVc4g72WO6MrRimHvGWZ7Oclhw011HlVsk/ch8/g==
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(29502001)(46966006)(356005)(336012)(2906002)(4744005)(82740400003)(107886003)(426003)(316002)(70206006)(86362001)(34020700004)(36756003)(4326008)(5660300002)(54906003)(7636003)(478600001)(1076003)(6666004)(82310400003)(47076005)(8676002)(83380400001)(2616005)(8936002)(186003)(26005)(6916009)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:53:59.5647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2b19ba-55d4-4ca5-580d-08d8b71aa88a
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT028.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4561
Content-Type: text/plain

From: Chris Laplante <chris.laplante@agilent.com>

I didn't have time to dig into the npmsw fetcher to understand exactly
why the conflicts happen, but this fixes things in the meantime.

Chris Laplante (1):
  classes/npm: utilize lockfile in do_fetch to avoid multiconfig
    problems

 meta/classes/npm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

--
2.17.1

