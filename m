Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.88])
 by mx.groups.io with SMTP id smtpd.web10.11903.1610470448206612086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=SXqQa9dc;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.243.88, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhUHpdbDWSfNuA4p3FI7B0O9QiMds4delv+ZSV3SQ8v5Co4CmIfuD8hlNRwvw+5Pd3iMM2ehqmE56k5rGKQW9q/0UVXgIjJ/xNo0aB8NOQ2usbXCj1Kj+LPA6gh6v6k3EF4ayW+C+N4kMOANyFkkK/kCZ3l/6RJyewnKtL7IsQkKrx5M8n+Vh9+MQrH9Z9ilcfreL5/HCFyTTusOYyOCET61r2uUqLsooiAN1amDlk+b8tOixuJaBmNE6IRjCnMb9oOruqUWPoP3N4RKpznMXkp1lvSC9+ZaagEBcEaJWU5/vPVZXuuZb39eP26R0uvwIDgSE3/8SHuBRp4TUrSqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3uDGYFUsBP5IZoKGWhcwS6pa1vZS6znWcUVj7llI+Y=;
 b=MyKh38fuzvx786lm94oLGQPm+KZYteaLdSx8xGtU87MuJonFV5yWbWfq92A1qvYvF4KdZ2Y8EwypJ1PO6tPo7ti4faUN75W6ggj4uNNGYwUrcGycWre1eCn5Fwy4yNv9aKYU3Z2mobQOXpKu8sbrEAcJBOJzmH11y5N3HJYjHME95Vnr07AHs/FWXYmEF3/L9PVVM28y20ATdvVTcKonhxbcIf8762P+X3iz1ETWfPTqp4R5p/mSJuOmbkANhihky2DcyA0wlSW33lbp5v+lJMVsAe6cDWR9IRinDqzRCVWcDItxjMuQMU/hWtD/agAGe0A1/NCH3x3V47qL4VW1Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3uDGYFUsBP5IZoKGWhcwS6pa1vZS6znWcUVj7llI+Y=;
 b=SXqQa9dcZ0lT+Zk7sF9/6MGE8zxTwHYBQjBlBrvRxpVshKycH8WupKAK+rpqvWOrSECqePKGBr9uli8uyZCggZTLCZ1Xxc9+jxRk3tfUUbRG+P5BN4LoRBdj689ztm57Zh6jCkNBSV6pXDwolccmzs0Es5hmAbwrZ8XcPasrJVpPJ1Q7dGOGtGYPO2Ds2T2Plkv0D0501L85FB9z7vwci/MtXYN8P4Iyp6a9dGjNOOlke/Y4UDD2wcODunbJaLnbqApxX47wXeS7J8gIlyjXsH/rlh5Z5ScPxm4YMe+/ayzs1PJK7E2kJjo8EP9pGK9HhdtWzj6Y7K15IMnKdbyi3Q==
Received: from MW4PR04CA0374.namprd04.prod.outlook.com (2603:10b6:303:81::19)
 by BY5PR12MB3748.namprd12.prod.outlook.com (2603:10b6:a03:1ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 16:54:05 +0000
Received: from MW2NAM12FT033.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::e3) by MW4PR04CA0374.outlook.office365.com
 (2603:10b6:303:81::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 12 Jan 2021 16:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.41) by
 MW2NAM12FT033.mail.protection.outlook.com (10.13.181.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Tue, 12 Jan 2021 16:54:04 +0000
Received: from laplante-lm-19.localdomain (10.255.85.221) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server id
 15.1.2044.4; Tue, 12 Jan 2021 09:53:50 -0700
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jean-marie.lemetayer@savoirfairelinux.com>, Chris Laplante
	<chris.laplante@agilent.com>
Subject: [RFC PATCH 1/1] classes/npm: utilize lockfile in do_fetch to avoid multiconfig problems
Date: Tue, 12 Jan 2021 11:53:41 -0500
Message-ID: <20210112165341.3723-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112165341.3723-1-chris.laplante@agilent.com>
References: <20210112165341.3723-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg2.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 10.255.85.221 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52eac254-2e43-4be8-84f5-08d8b71aab72
X-MS-TrafficTypeDiagnostic: BY5PR12MB3748:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR12MB3748F35BA95D96DA0540920F8BAA0@BY5PR12MB3748.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vTRBS6b3Fa2vKqTVMnCeJ4AySDDrD6CZSVMPSUk9PRD97XZecIe1tWrnZJPBZoIZ6WoEDvOrXJMBiei/087oyLlEoSsQghudwp27B3JqZ52/kH82ZWKkFR+JwnTskK9eGbmxPHsENog10uMQccOjAn1tBsHwRHR25fyMM8HiiT54cAnszYhyJ5pSurCOYbuxz5waOBeRKJS1M1iXEdL7h04UzkrU2+JI6DXafCNyNIdUGTcpTXKqUT+DiRcvyPBppA0P3Y3G+XbW1uwCJCBrZlIvKBDiqQ1vKqfVH01JRScuKN/A8osdMQvHblPNniLfWdmVaLzlHiYyqA0YTF5Kp/tj53LlY91hG1cLe96rOmbDfCiW9mD39sqSmnx4SmvCwpYg0tVYQhIOrpl6l0yORAY6a7vP8iqGIArElmQw8TNx6Zfe3CrgwLwJFz6rpgVahgHLMg5i9+7Y+2iWYdsiAH62S9ZLmks6LlAQhQ5U9wg2S8N44c1kHWhCJDVuh8PCNTEHgoAwTzc3rgiW1vv1YQ==
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:cos.smtp.agilent.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(29502001)(46966006)(83380400001)(336012)(4744005)(47076005)(86362001)(5660300002)(7636003)(36756003)(2616005)(26005)(82310400003)(6666004)(426003)(70206006)(44832011)(34020700004)(1076003)(54906003)(8676002)(316002)(8936002)(478600001)(186003)(107886003)(4326008)(356005)(2906002)(82740400003)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:54:04.5077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52eac254-2e43-4be8-84f5-08d8b71aab72
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT033.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3748
Content-Type: text/plain

From: Chris Laplante <chris.laplante@agilent.com>

The npmsw fetcher doesn't play nice with multiconfig for some reason.
Concurrent do_fetch tasks for npm recipes can try to download modules at
the same time to ${DL_DIR}/npm2, resulting in races and failed
downloads.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes/npm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 068032a1e5..3e56765a2f 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -41,6 +41,8 @@ NPM_PACKAGE = "${WORKDIR}/npm-package"
 NPM_CACHE = "${WORKDIR}/npm-cache"
 NPM_BUILD = "${WORKDIR}/npm-build"
 
+do_fetch[lockfiles] += "${DL_DIR}/npm2_fetch.lock"
+
 def npm_global_configs(d):
     """Get the npm global configuration"""
     configs = []
-- 
2.17.1

