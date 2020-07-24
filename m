Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web11.767.1595571478316079778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 23:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MXLMeAWd;
 spf=pass (domain: arm.com, ip: 40.107.21.83, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7Gek3g0vQs12mX2zKO7mqH4OCbbTZ8RKbYAJsPa2TQ=;
 b=MXLMeAWdk2ve9sRO7I8qjdA879JMggS8SwXKVH0skxWxwxYwCBtIxa59jNYb0ZX0VGtSmxehzlLYHiTuOBovIiAz8Af7bSqbHDnboTSd4y/IwyP7ON4hC/qUCaF3zScWGeW54wlS6ZNTSLLoKmMFl1GX7dA8wXitCV5yqDCW88w=
Received: from AM5PR0101CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::23) by VI1PR0801MB1838.eurprd08.prod.outlook.com
 (2603:10a6:800:56::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Fri, 24 Jul
 2020 06:17:54 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::f6) by AM5PR0101CA0010.outlook.office365.com
 (2603:10a6:206:16::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Fri, 24 Jul 2020 06:17:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Fri, 24 Jul 2020 06:17:53 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62"); Fri, 24 Jul 2020 06:17:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 58d4c7c95b35e14f
X-CR-MTA-TID: 64aa7808
Received: from f8b58afe58c3.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FFC267C8-F5A9-4690-BAA0-7DCD2BF2DA1B.1;
	Fri, 24 Jul 2020 06:17:48 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f8b58afe58c3.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 24 Jul 2020 06:17:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LovIkq07QDQ0/DEfAzmAoijuwKZYUxPr2YvssqC1NkPetGuCWpGAA1dxgfsWZYk1Y/M2Av9h23nZIQHET+OBrVjweig9KPenU/PFT0KPe+/nMlJL2iK4J5v668UaJ57WfWnO11I6MPPAvmXxGDx686/4UjRc2euP9y5vqTqYT/4HmYnNcBoZPYCnvcf0XlqOq7C9E7HZC3DhoQwlHuL2LdJSGTyUAdwBZIwckRyEV4AYPuexIZRNJz7Q0oJHY2aiceYUxLmiBo1Gr8WyLnqzLTnlkaQMCJ4rrkg7JFhguPwKkh2vTWpjP+PltNAD3RKOyOk7Kt/R5Z9zBIRUnLZrQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7Gek3g0vQs12mX2zKO7mqH4OCbbTZ8RKbYAJsPa2TQ=;
 b=mAMWmxcSY/inQJ+U6KUzNCKffUrqkbt0uign1hJsSzjvJUK89yU6p4dg389wuqrXjn3zWQLFgt7RGdsZVCOJl4zendqxqmkSnVi8sX2Xw+RKnUaGs9aLnj3oCmhyLNVoC+rcEA3BJ/ZjQsxz/BvUswkT59lvt5nGEe9kQoatLBohxMdVlbadB2Ci63np2YA4t0rf1ORChuiRDdsaZNIaRPB5m0w5hdzPmxOqi5L9bYuhPY1oHYJCyIFapOvORA2ioz3tS/YigQQR2o9uL5DoDePpzcOZuAGggGtY2ygi50IpnY9OgO3nLMl9rDESm8jlanu84RQt1zZo594ZXaCcqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7Gek3g0vQs12mX2zKO7mqH4OCbbTZ8RKbYAJsPa2TQ=;
 b=MXLMeAWdk2ve9sRO7I8qjdA879JMggS8SwXKVH0skxWxwxYwCBtIxa59jNYb0ZX0VGtSmxehzlLYHiTuOBovIiAz8Af7bSqbHDnboTSd4y/IwyP7ON4hC/qUCaF3zScWGeW54wlS6ZNTSLLoKmMFl1GX7dA8wXitCV5yqDCW88w=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5307.eurprd08.prod.outlook.com (2603:10a6:10:114::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 06:17:45 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3216.024; Fri, 24 Jul 2020
 06:17:45 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] selftest: wic: IMAGE_BOOT_FILES test to run on bootimg-efi
Date: Fri, 24 Jul 2020 11:47:34 +0530
Message-Id: <20200724061734.11188-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::17) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO2P123CA0053.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Fri, 24 Jul 2020 06:17:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f7c7b41d-fcca-4752-e8b1-08d82f994cc7
X-MS-TrafficTypeDiagnostic: DB8PR08MB5307:|VI1PR0801MB1838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB1838165F0658919D98C5A625FA770@VI1PR0801MB1838.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:561;OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zYaeF1p0Vi/Zz/q7bKm3aa7pbvAOcmq6bKLL62xTlkrM3LgIhciF1ntX7+pV6aYOyuWKZovX1vJIeg/ejMCqJL72aYTytKy3MQO+UwmVycleqOlfqfvw3hrOW16arZqtE5jPTDWcI1ec6oKlMBzkHc/tems+1EX4oXnST/fyUVRyEOQUOY6lVwGz1fiFM4HrE4SBSEJGNzlFoPvIHvEH0SE5ESVbjceZfojNOodhx4MxaOx9FG5B/K8cH6THBUa+hRHTlGrmidDypiwJQiVHHtD+TjuvDHxoraBb1GG3l8BYPnmjmTyOq0SZrbTcYlDA+5UWX+tHhrtibPz2ju/lKQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(86362001)(66556008)(8936002)(26005)(6486002)(6916009)(66476007)(36756003)(186003)(4326008)(66946007)(16526019)(956004)(2616005)(8676002)(316002)(4744005)(52116002)(1076003)(2906002)(5660300002)(478600001)(83380400001)(7696005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 yQr1a+Abj1J1slWpz38rS8VcSIR4wv2Aaoeojtfz5+VgevUG3cfTGn+xNdGJ2VxrCWra68kY2KwjZTnv7qsKjBZaacKO9aq8tmRos9GKYDxO8gFhBvLPWYB162bcxtFE6W2aH+Pi5Fn9J25glGiaFhYWqoyHnB7yWFkNUaNWPYy13GxftmshE/OrMxGknjWxHsNPCZvBPrHeqEEpnpakBNXcrhwsX9gFJIbiugCYHOqzWvkGi9xAxdSv5GX32VdnUs1XwFhv54fRxMb5FzmNSXYXUnauU09NGRY0j6w4B92Yv63WhIiH3l3ArnYd0Pnv1OHASQ1LamN0hvLKhGUQLJ9+Raj/SanRgs1TLjUgbe4xZ1QK5wZ+PYoejY3gMm89YB65MfzISoN5vTy8/jOPUtOAtaXWV6Le2IzGCFNLIdZ/LxnddyBWqJPZ39JAaOo1ZUFOTd4W44fXZ1ar6R3NLJGkC/HmOOiqnMrba8nFIdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5307
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3a941b98-3fd9-4fd0-e3f7-08d82f9947c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WpestQExRr350eZCUSFGG8PW47u3j9anhDUN46oIumyb8xUvASNv1BJHfuEgD7UkibbHOAeb2c3RYbohithCFh0mqFrK4D5Cc3wDgGp+3n+9knd13sutnfz3qfwRwnpJgvT218e7dHaQ1GWU9r18O9qW7OirPVDiS5R1keHoTEoPepYRH/7PbX3ccsjVRDF3UMAyCwcpOiSqzDPeQoX7fwmzzQoKiOg2ThgGREuYEPtDoThmTv49NeJgGTqjPVqH1whL/RRIIkXkET70cf6mMbt3yreeViKeHv5QeqfeHPJBJG86TZkye7eFRaSE8QzYGbqOq9ty/6bsF7u/HyD8wjBviYAHONNxivvKqUFdGJLKSKn4VMP0NASGNuinkb18upwqrJPbDzRnecU30/5Osw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(46966005)(82740400003)(26005)(6916009)(5660300002)(81166007)(956004)(70206006)(4326008)(2616005)(36756003)(47076004)(70586007)(1076003)(478600001)(7696005)(336012)(82310400002)(86362001)(316002)(8936002)(36906005)(8676002)(83380400001)(6486002)(356005)(186003)(6666004)(16526019)(2906002)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 06:17:53.6487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c7b41d-fcca-4752-e8b1-08d82f994cc7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1838
Content-Type: text/plain

bootimg-efi is updated to install files listed in IMAGE_BOOT_FILES
into the boot partition. The test_mkefidisk in oeqa selftest is
updated to run IMAGE_BOOT_FILES test for bootimg-efi.

Change-Id: Id577e853fecc5fe58531c7afa33db3b1c00c8319
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 8b58285c32..41b15f6323 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -210,6 +210,8 @@ class Wic(WicTestCase):
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         cmd = "wic create mkefidisk -e core-image-minimal -o %s" % self.resultdir
+        kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
+        self.write_config('IMAGE_BOOT_FILES = "%s"\n' % kimgtype)
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "mkefidisk-*direct")))
 
-- 
2.17.1

