Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.44])
 by mx.groups.io with SMTP id smtpd.web11.9795.1602588805929361296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 04:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=55UbwKGe;
 spf=pass (domain: arm.com, ip: 40.107.15.44, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjSyFOl4FFhimMelUQK9Tdj1vqyFv+U1t/pt9cYAI3g=;
 b=55UbwKGeJCux+Pgu7YgveIIe8tE1qfvnOXRfkTGV6jSJ47mtRmXunTNdBadOoCL6kaUXZRI3P4AgX0QGNRTS4quL+Tjjgdz90SkhhajHJzU/MLodyGllwwaKvzIJULQnXtufL2BAKT0pskm/aAh6bBgT1v5rL6FwgIQvi7aewTo=
Received: from AM7PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:20b:110::29)
 by DBBPR08MB4553.eurprd08.prod.outlook.com (2603:10a6:10:d2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 11:33:21 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::ca) by AM7PR04CA0019.outlook.office365.com
 (2603:10a6:20b:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Tue, 13 Oct 2020 11:33:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 11:33:21 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Tue, 13 Oct 2020 11:33:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 263d667a57cd6761
X-CR-MTA-TID: 64aa7808
Received: from 9e748e22293e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0CED5883-636F-4712-8B99-AB476157FD22.1;
	Tue, 13 Oct 2020 11:32:43 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e748e22293e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Oct 2020 11:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTWY1hKyyv4pCQdMrQPd6m/g6c5R4DgKHLixjHX9Lu/qCkr9CoRTbbLT37hWiwHjWO1mYvm5doCbskMaj2JLvSLfXR1D9OkIO1mKHysHamEnepi7ddU8yagK/ixMJFirDqkrwp7ZnaUYovkBuI6cGhC0n29GlLLmueNPJBPKAaGDxXxqsW7rSjYiSVkrCMtnByL7z26anF6OmwwvIawwGnlMN6WEe38xUfpGnOZ5aGW75hEnLRqbNuTXLVmOfHJTQyopdUSdu4zffmi7mmvCbjM9VDtAmJ9gKQ9DUJNTK17DWRDoCluI+UKN0dDGH0XnSnCAoSCnPJ94M/M2SLboew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjSyFOl4FFhimMelUQK9Tdj1vqyFv+U1t/pt9cYAI3g=;
 b=W9fVbvTN1ovnfvuOXY1uxmDYNsjYR3C1vtqIo6TFz4BoFPVG+swff6til7IkcElnB18xnIM7NHWpu/SWJotdQdl95BCPU+yDLQym2mh3ZYwA9mo1vvoRgHrLqz3lTA7bvhrhlozMO/TMYqne8UJSTkmqkd+ofPQSX9eBUZF9JqJpoJQrgrVKbTwTvUFQAPOqixEPB1sWC0Jmq/K2FPFq39OudL5C8E0SYZm8Qcyy9jKFNStOoCtMGxsAHuZg/VI6DaSs++NWaWZcFb2k3cgKyYM32yCPuTCo5b0iE6N/7XulmwZwVzwYE79GqpRJkdEDG8g66fqVjfNgyv5sZJ0X4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjSyFOl4FFhimMelUQK9Tdj1vqyFv+U1t/pt9cYAI3g=;
 b=55UbwKGeJCux+Pgu7YgveIIe8tE1qfvnOXRfkTGV6jSJ47mtRmXunTNdBadOoCL6kaUXZRI3P4AgX0QGNRTS4quL+Tjjgdz90SkhhajHJzU/MLodyGllwwaKvzIJULQnXtufL2BAKT0pskm/aAh6bBgT1v5rL6FwgIQvi7aewTo=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DB7PR08MB3404.eurprd08.prod.outlook.com (2603:10a6:10:4c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 11:32:41 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32%5]) with mapi id 15.20.3455.031; Tue, 13 Oct 2020
 11:32:41 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: openembedded-core@lists.openembedded.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [meta-oe][PATCH 0/2] kernel-fitimage: adding support for Initramfs bundle and u-boot script
Date: Tue, 13 Oct 2020 12:32:30 +0100
Message-Id: <20201013113232.29228-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0382.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::34) To DB7PR08MB3531.eurprd08.prod.outlook.com
 (2603:10a6:10:49::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO2P265CA0382.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27 via Frontend Transport; Tue, 13 Oct 2020 11:32:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 844b0d72-2afc-4ce5-e92d-08d86f6bca00
X-MS-TrafficTypeDiagnostic: DB7PR08MB3404:|DBBPR08MB4553:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB4553309FE2D91C58FBBA30AEFD040@DBBPR08MB4553.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cF/i4ljt+ViNzNiSWdmpJc/fO51G7aWrDluS8lcrqRq8PRoiT1IlM0ZSY87Xbr3cJm7SKIiHZc17aXelYVzxVQWuSimZl/qr5F30d46qoaqPnnh+kT0VqCNsZh/NrfLDX6Q8AvZo7H3ZjuaxaD7BbCcY6BO1EJVPVNXpucFC9fSdV3Ohfc4xXM80YTN1eYMo8iDUqjHz7gAACva0HTOG9jUc3BTXCyX/mHUE7a9hiBzPwMGWQ2kJU0X7mSVvOTJ3WZXMSIiVpaFBpycGLPlaLyFOzhJw8lwS9QFTwlY7roUeWmrtDcUqxddYzwJL50F/+nrm9R/EJTWZc4Ygrxp1TQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(86362001)(36756003)(5660300002)(186003)(4326008)(66946007)(66556008)(16526019)(8676002)(4744005)(8936002)(478600001)(66476007)(1076003)(2616005)(9686003)(956004)(26005)(7696005)(316002)(52116002)(6666004)(2906002)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 tFVB/j3vdAuEjve2xxRv0Toy/nKvWqBPuVn90e4xYdtcvfEDK59uKHhNbtpINmYXvhbvd3We6vyv0T4eo44wt79TvcTvBDI5tcvDZi2VAgbYcrZCWr4tCg7QuAICwb1mbDwJn5fZjm2xpZx1yF0WKXwO5anYYBm0anG2jHCgqdWzCRqgwA3MWC277VWCSBkGs1sTlqBUWzQcd2WAGTfcZwml6k3J2fm5kZtUtIk/97jwCiEXNHMAzGUIP94s3oGJ/MtEPWwF/Hl9mcEJpzB82SvsyzrNuD5yBWUMB4yINJemXAuzTfLbYIvE6pPIxHY8aSwX0q9xp/xJeaA6iF0AE150PgTUxSkDbt4bXr5YFYKRkbRs6eU/fdktf7ApMf7K+Ij0PYbqiJN0CnZhXHZJ7bZau3bfNRqXekfrbeZOPyAVV+DtPU1lGOrh4UD6cIIafyti3BkowwY19Ma1KBb3nwDlUZCo7VjnYM1W5QEOTBz5OxQEayFqJh3lvaEi/6oc7NDCM5b57RdXqTpj1Wf0ZA+4/gNef/f27kVsW18sBQb9mirOTt+JVDHFAfFsBNycKEOgv8WPK5mxB560eA72OnhZE95jlNIRD8Qm5qCSQcMbOWYCglHET5Q5vddQ8/SkCAW7vivrehKpnRIGlSEKLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3404
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3f151d3d-8352-48ae-1c55-08d86f6bb1d7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4rS46HVLVH2CNPEaHK2OH6ig/iXoIpEUynYshLL6aREFAAhonW5Sgwy6dt3uWYvKohY7A6znTLa6cM77vcE/LjDkWq6sEK2KFXGo4KHpp6qWZTwOeoiX3TuoRCCmzZ7gLHL8W/4/YJiepERudZrb2gbsUIQmjFwxnTfqYDC3nBIL47JShDh4H8YTYWpmsEEBtEO3DkBDjtXBqO0Jw7lwrlOFuEOsIjWlV6rOwldRs7tE6uf4CS0RDwpp4tk5Le6xMreMbY4blZbM5GDIU2QsHrOweC+k2GSoS7g/eLQ8fC6Y9E8Fw/P12wuWbwj9xlwkvuuBxHrhgWe44JDuznWBm5D25DzC1yGa4x4ZgoZvE8Lm0EUo2mV/Jepsw90tIhUn3HM9B4hvWbJ9BEP2kEE+/g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966005)(26005)(8936002)(36756003)(82310400003)(86362001)(36906005)(186003)(8676002)(6666004)(336012)(83380400001)(316002)(47076004)(82740400003)(1076003)(956004)(356005)(2616005)(5660300002)(70586007)(70206006)(6486002)(7696005)(4326008)(81166007)(4744005)(2906002)(478600001)(16526019)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 11:33:21.3576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 844b0d72-2afc-4ce5-e92d-08d86f6bca00
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4553
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This patchset adds Initramfs bundle support to the FIT image kernel class in
addition to u-boot boot script capability.

A third patch will be sent which adds the description of the new features in
the Yocto reference manual.

Abdellatif El Khlifi (2):
  kernel-fitimage: adding support for Initramfs bundle and u-boot script
  oeqa/selftest/imagefeatures: adding fitImage testcases for initramfs
    bundle and boot script

 meta/classes/kernel-fitimage.bbclass          | 148 ++++++++++--
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 215 ++++++++++++++++++
 2 files changed, 339 insertions(+), 24 deletions(-)

-- 
2.17.1

