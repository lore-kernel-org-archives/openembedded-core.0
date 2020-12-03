Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.74])
 by mx.groups.io with SMTP id smtpd.web11.8737.1606994328097829520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 03:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=InWXec62;
 spf=pass (domain: arm.com, ip: 40.107.15.74, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZ4y2LM2Fm0RvpJEzOcRYbyDGj039eGSfQ1i7jCGvI0=;
 b=InWXec62OwtzXQiKBk3sYjefWP5OJniGBrf1Qwy0UH6IByZHq3JHubHIHIw0YamFVCOuhp1SBvTRNRfyqn1DZvYN/t51RdJrBRf3az34UwTdwfrTQFgLZO9/IFStKXATJuZw0XbWzNxG9O7aiLdirFE8FGLr8InMkjzw+Vbq9u8=
Received: from MR2P264CA0126.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:30::18)
 by DB6PR08MB2694.eurprd08.prod.outlook.com (2603:10a6:6:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Thu, 3 Dec
 2020 11:18:45 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:30:cafe::55) by MR2P264CA0126.outlook.office365.com
 (2603:10a6:500:30::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 3 Dec 2020 11:18:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 11:18:45 +0000
Received: ("Tessian outbound 8b6e0bb22f1c:v71"); Thu, 03 Dec 2020 11:18:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf1994098b908078
X-CR-MTA-TID: 64aa7808
Received: from 08f998ead67e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 685193A2-E4F4-4522-84C0-0164890B98B8.1;
	Thu, 03 Dec 2020 11:18:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 08f998ead67e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Dec 2020 11:18:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIr/7RsnJfcL6Y0qkow5GawRn4BLGpxiAcIad4Uah5h4PyzTpCewoCi515A2IGr7cxNHuo/EvMHKKXGewe7uGqDRNWvSvwOX01SzxJkb/lyVqeQlKyHjCjmbHa9ygl+9xvwpQ9QbVI7EXskG2jcL8LvG4ilkMfoE9dptLhLU5l2WEo3dg6u27Nv4jr87tDboKFAHqbYiCiSNx33Qd2YAae8B2fzDyKJ3Gu0MvHg4iBN4iUGkasQHcjuJbxO2suqzu2hoIbmLspTTcHhNwuNSa+F89GQyOJTdM8s6hsV+zBgj6f17b/veR44ippdCKDLLihGO8N7/tjpRrDhxuTdKrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZ4y2LM2Fm0RvpJEzOcRYbyDGj039eGSfQ1i7jCGvI0=;
 b=ShmomdbzlosrmFQkA1Cf9qyA839bYGgUp3qUHFblC6lmVb9DP1/d97glpl1uOUti8Hy/EOJZn7yekKFp91NaQLCxer7BLf9fYZmqwVoc+j5KpdcPE3aGMOXMms/ZmfOg2/uhBgl2JX598hLRl/3vFuAV1ulkuxRf7ytwI7cOhDfRNHbSbDbM74zUds3IETZo/hjKoKJXz2B7V3INAMs5uzV+eZhuhi3eFvqyImgEnnmYcuRJ0ujbjAL9AqFx7RyCQzk8o0ulh6SZJBU/vkwRFVwvhIayvLgyKJumzwrFDZs2oSUUR8kwSjwQ5FdjlnOowqVuzeNtIKxZVa0wlizkuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZ4y2LM2Fm0RvpJEzOcRYbyDGj039eGSfQ1i7jCGvI0=;
 b=InWXec62OwtzXQiKBk3sYjefWP5OJniGBrf1Qwy0UH6IByZHq3JHubHIHIw0YamFVCOuhp1SBvTRNRfyqn1DZvYN/t51RdJrBRf3az34UwTdwfrTQFgLZO9/IFStKXATJuZw0XbWzNxG9O7aiLdirFE8FGLr8InMkjzw+Vbq9u8=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4740.eurprd08.prod.outlook.com (2603:10a6:20b:ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 3 Dec
 2020 11:18:37 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3611.031; Thu, 3 Dec 2020
 11:18:37 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 2/2] initscripts: Change execution order between checkroot and modutils
Date: Thu,  3 Dec 2020 11:18:14 +0000
Message-Id: <bfbd77a5e13e81b526a45efa91e603d18519106c.1606993906.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <dbb99de9f97c0b24d5a8536704adcbfa3bd95140.1606993906.git.diego.sueiro@arm.com>
References: <dbb99de9f97c0b24d5a8536704adcbfa3bd95140.1606993906.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::18) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0126.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 11:18:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d8dcec04-1261-41d8-7c94-08d8977d32f8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4740:|DB6PR08MB2694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB269478E91C7AD68C2BA5A56492F20@DB6PR08MB2694.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7s8cq2UDWB8G9hlcuh+J/yj5Po6doqPbkx3Lzf7FbXHOYLn44iyqP8HBsPltqFfE0UoMjjOgTYT63r3YWkqJs59hIXYotoGBpnZGF7pecaUR864WfpqcDLnXQ8xjfl4gtjyKdMtZWMPXYvh7WIPJBRitIdg2JxDOjjJjq3FdTx7B1CdU+3JQ8yWHeA5w9tg1qKpTqAiNcD6yJA+RUg8QIejN+iOxLXWODQcoE7BijzgJrliIuZs3/WnWNKAMd1+AAppD0TowdtTfg7hpJHBW4CByU5AW9GNQquOjK/Hp9kvjjEr/7SOKLMNatvAUD0BbSkl5OUGefWisqGZCz6GwPA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(8936002)(7696005)(6666004)(8676002)(5660300002)(66476007)(66556008)(478600001)(66946007)(2906002)(2616005)(956004)(44832011)(52116002)(316002)(16526019)(186003)(86362001)(26005)(36756003)(6486002)(83380400001)(6916009)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?9D1KPbHtLDyyn599aT4P/fvMvV66pZiNNP6hpxw2K/5v1dbyUT0cmKatKn3/?=
 =?us-ascii?Q?glmxfW9MjLCnAaQS2FbGxyMUbAQCCe3tT25wI+HC9M443LQhzlZh+Eg7Ke0a?=
 =?us-ascii?Q?042S66V/cwtbvN/AVhwV12CxQ6Kn9lechu/MEiKqvscfXBs53yeyXAjN3no5?=
 =?us-ascii?Q?YjQJo/1AjwCudSGjYexUGxUZUagZpdopq1MHa4gKYg9gPpP9XZ5lON3od1Ua?=
 =?us-ascii?Q?v6OsDEBZOZn/8Uhf6uqcuVIGOgXbI8/DY/ytwTKOGTwsJLaKKORyDVZD0Nvj?=
 =?us-ascii?Q?pmefsoGFi/5G9espgdUdGvIgM3XEpE0GJq5xZIqbB0OPhpS28yaepEyXU765?=
 =?us-ascii?Q?GjWgwm04IPqvpUXX2F6Yf+qtGKDgX3bORycyBOXPrcmm62EMRk7KQqfwasTF?=
 =?us-ascii?Q?en/9bW5Ta/xtHh+/DxImXIjyamh5cGLyto36BALH9sOP14ZkIVz0bxDiFSWE?=
 =?us-ascii?Q?1QDcA2BTseQV4/tacUOkoez5rks2v79iHUauDMcCDnZdezYdpDHiZ65dESXZ?=
 =?us-ascii?Q?ETY0I9qV2jOzlkySdOV7402rHadsQzGPWxDBJ2jTGL1daJnIm/Rwov7oo4m3?=
 =?us-ascii?Q?RjaeL6roI5Wi//HWZiO6TTYJGyLx0aqQqVgPvjw2Ju3/AEJt+CJQ9b2fGF3G?=
 =?us-ascii?Q?veiCZN5/iatR+jQJOKqy2Y5PXkv59nH3y7W2afXyKY5yJ3uLm6uc7Wx/2xbm?=
 =?us-ascii?Q?3XA7IyZ1s1nkTuImTFTFqzRX/ZD1xEfufEPiF/T9f8B3ic5N39HKrg9aarsc?=
 =?us-ascii?Q?lcBHKcjqfR/hea4mPx1uqQWFwJ85ful9lXDXf7GiRj2dynUb+sqP7vgjCdUY?=
 =?us-ascii?Q?Bx6ZlOvNir9w+IjkAl9RHwvKGJzlxYuwNp31LIxodLkRafCM91OYal3xsuKm?=
 =?us-ascii?Q?DLJVioGpedUjM/HCog7feNjl2QuB67QRKXcV+JbbKDFVYQlkxGzqcrjiXk53?=
 =?us-ascii?Q?rOklSv8JXUVw32OphGUEGjLqiYi9ijvWLjE1Wof5ofxS6fxkwnK5wY6/Swfg?=
 =?us-ascii?Q?kUb5?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4740
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b6abc166-46fe-4ea3-f024-08d8977d2de3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	clQZgJdsqtm0Ofrid6NeSU4GzXaHGn/7xGwwa2m/YeEvLAEtfkEgw3vZ9+ITat91fAQ9mje3ZknWYWEQvGief+ZuP+9tY04QbHv8Md0Xv3r/xQ/XOSbdQ+qXyUnlQZ1+Nlckh5rhcfOJf1Lp98c+TRcIPqF2P3EAH2/+vV7s5+C3PCkk3xiYPEFY3GI3Ke2PeX7nOa4umm7wKfScmakB6shMb7f3b0sbVLxGxPrCSFHqDK2eCJHi2L2M90+p3g7m/0SdZ69F20r7GcOQbuQHjPOrtgp2ypoAi50A0qnA4vn1HF/lcWRus7116XG9MK/dZ3umxVe02mr00Q/IBibwWhZUaR+ecC7bYmShxBtJII3Ol9ZiVEFW855ECre/hTSEbKOZThD+yUCzLFcL8wCAsg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966005)(16526019)(186003)(7696005)(70586007)(83380400001)(82310400003)(81166007)(26005)(70206006)(356005)(478600001)(5660300002)(336012)(956004)(36756003)(86362001)(2616005)(47076004)(6486002)(82740400003)(316002)(6666004)(2906002)(6916009)(8936002)(4326008)(8676002)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 11:18:45.3467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dcec04-1261-41d8-7c94-08d8977d32f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2694
Content-Type: text/plain

When '/' is first mounted as read-only, we want to have the checkroot.sh
initscript (which then remounts '/' as rw if allowed) running before the
modutils.sh.
This is because modutils.sh initscript might need to run depmod depending on
the status of the modules.dep file to update it and the '/' needs to be
writable.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb                | 2 +-
 .../recipes-kernel/modutils-initscripts/modutils-initscripts.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 32c527799e..5e994f2b7f 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -136,7 +136,7 @@ do_install () {
 	update-rc.d -r ${D} halt start 90 0 .
 	update-rc.d -r ${D} save-rtc.sh start 25 0 6 .
 	update-rc.d -r ${D} banner.sh start 02 S .
-	update-rc.d -r ${D} checkroot.sh start 06 S .
+	update-rc.d -r ${D} checkroot.sh start 05 S .
 	update-rc.d -r ${D} mountall.sh start 03 S .
 	update-rc.d -r ${D} hostname.sh start 39 S .
 	update-rc.d -r ${D} mountnfs.sh start 15 2 3 4 5 .
diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index 881b7db92e..97b4ddb88b 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -10,7 +10,7 @@ PR = "r7"
 S = "${WORKDIR}"
 
 INITSCRIPT_NAME = "modutils.sh"
-INITSCRIPT_PARAMS = "start 05 S ."
+INITSCRIPT_PARAMS = "start 06 S ."
 
 inherit update-rc.d
 
-- 
2.17.1

