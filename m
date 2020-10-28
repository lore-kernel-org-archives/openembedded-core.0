Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.88])
 by mx.groups.io with SMTP id smtpd.web12.7174.1603883457367426113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 04:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5WNGWNYi;
 spf=pass (domain: arm.com, ip: 40.107.20.88, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjJb3EA3GluzwofJIw4zDZDkanoAat4g7zRp1X6LMbo=;
 b=5WNGWNYie1sxZUrhd+FSgClkvpRfv+uWhsH+RLDyxhbZC2buXfDtcHJHYdqnsga60b4DcWUJdNYFeugacNQWazi7Gk3OkHkpEp+am/5IXz2n+skVVtPgxxhmCx1sWDYuEpFWSjCuPKb+d7M9cHy7dkoJolF/dsEk2yPHOqwJfLA=
Received: from AM5PR0601CA0031.eurprd06.prod.outlook.com
 (2603:10a6:203:68::17) by VI1PR0801MB2013.eurprd08.prod.outlook.com
 (2603:10a6:800:8a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 28 Oct
 2020 11:10:54 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::ba) by AM5PR0601CA0031.outlook.office365.com
 (2603:10a6:203:68::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 28 Oct 2020 11:10:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 11:10:54 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64"); Wed, 28 Oct 2020 11:10:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7aa7f2dc6cb13b82
X-CR-MTA-TID: 64aa7808
Received: from 0d214f97d265.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DB54C39F-1BE4-4ACD-88C3-1C1D5590999B.1;
	Wed, 28 Oct 2020 11:10:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d214f97d265.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Oct 2020 11:10:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGnvG3uH3ATd9236rxZvA3M7DLkcM97AFCF4w/MQTovALWCL+GSOpwX+GVz7xj1IUVpRbYNWP+m6R+HsrxC2ylfyF08HuCa081krIq58koPNnW+KPtodf5mLj1DPMTfSk6jV7fa1a/0GnHH5T/PjGUDyBhb2q3aKTiuMW1TKUfWkcYNpAF66Axqfsu85PAbsshch9WRln8WTBbl9Qb8tQvloyPyiPVNZUd83wRqdVHN5WiOTThCmH74b9T7nB5/eD5JQqZgz3v3vIyn/4q49UdUOv3MAoFqQh9/mtjcRxmQj1NQjyYt0Ta8OERh6TWkakMShOO9o68LHESnUKA4C6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjJb3EA3GluzwofJIw4zDZDkanoAat4g7zRp1X6LMbo=;
 b=YyU/Fbe8JyXJ/ip1IAIDE62y2p0N1PlX7xhUUgx21liKlnc/zSyZZEXfsIkWJCWon9ZJZiugMi42wRZvdeaH/awQZyI/gGsJ9tdrjJYUg1rTpW6sKrEhpSksLMFaj6sLvM2YxCZJZhgHlYjqCHLamKJBzWsV/GlYVA8RzFPiyBiXDnchtrAs8NMjatcpD/6RB+hUytjtAWkyACpuH1ZLA8S4m5Vi3g1v7SrjT1b2aYyReBNpN+tdAr/6s4CQJyUg9A3xWY54qaI8+M6eSP2piNhyNmw+/q1B4PH5yaWrdwMP2NLdD951ekyFecIRShOyfe+Ku2qOXtbuqu1yd2lQdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjJb3EA3GluzwofJIw4zDZDkanoAat4g7zRp1X6LMbo=;
 b=5WNGWNYie1sxZUrhd+FSgClkvpRfv+uWhsH+RLDyxhbZC2buXfDtcHJHYdqnsga60b4DcWUJdNYFeugacNQWazi7Gk3OkHkpEp+am/5IXz2n+skVVtPgxxhmCx1sWDYuEpFWSjCuPKb+d7M9cHy7dkoJolF/dsEk2yPHOqwJfLA=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM0PR08MB3124.eurprd08.prod.outlook.com (2603:10a6:208:5e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Wed, 28 Oct
 2020 11:10:15 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::105e:371d:a567:a068]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::105e:371d:a567:a068%7]) with mapi id 15.20.3499.024; Wed, 28 Oct 2020
 11:10:15 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] grub: add grub-nativesdk
Date: Wed, 28 Oct 2020 16:40:02 +0530
Message-Id: <20201028111002.11129-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-ClientProxiedBy: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.22 via Frontend Transport; Wed, 28 Oct 2020 11:10:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8e981d90-66dd-41f9-2604-08d87b32236b
X-MS-TrafficTypeDiagnostic: AM0PR08MB3124:|VI1PR0801MB2013:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB2013BB36B6953ACB82F9FCD0FA170@VI1PR0801MB2013.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 K58P77TEAqny3rjbLLkCrcKz9/PnNRHmmJGLRlPbeB4VrSk38yrALn3aN2z9jgx5KLwaafEO3pZ4vDwcjEQSe7cd3i83I+GJbTTqoY2kfeKlQvrm8ltR7JzVeO+0mFT0Llk+HWcgrJ0B4lUsZPaPRO6PKw/L5F2EnzXH9D8to3a8vDdM+SDEGjysYL7hMvLkMiot3g+FRSWxtjzZ7l0dazxzEWiJ590mEvHnn/767NKkegErca6BcPXZIyd9OvOQH7eNLxT77et53I2/UIP/mh9LUUhkcmqYUOmqoOYCpQcSqrldqohUXUyJIuMDLkP2
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(316002)(8936002)(478600001)(6486002)(6666004)(5660300002)(36756003)(4744005)(86362001)(7696005)(66476007)(66946007)(2906002)(52116002)(66556008)(4326008)(26005)(8676002)(16526019)(1076003)(6916009)(186003)(956004)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 bW6TqoxRapvEdxQ8fln0001ghxKEFRr7jLrqDcIEgBbqmkCK7gOiPbVUC7nJvp101mEMoAFiqDSue9xR2Twmd24F76c8QMG7OBhAfeNaeiZ2hJiVBew1PYd9STbnvg05Uk6KPiM3/Jc/B7OMf+//YNcZNAUNOpGo+l1ykDHnAFqQhAO8AZgw2NLUo72HexJav+4Y3QDI+f7Rst5LcSY9aloxyn6f5nYXqf10N+SgUUJU76UPWELa9iq1O53Fflibuytos5XFxgC6qlJ7W7wXdCJRRUz/rksSF3WjIdZsWFzdmXyenqisDs4kjwYISA+wysBDCvbHweYQhkRMjGK/CrAjnPa64UYrwtflLYCiEfKaXKZLuOa1iHD1vS2QzU8mhR3ADEFgsLYjG4vAbyf8Ymfp8qg2W0H/4DIUUcRtW4QPlOizdJnpkexcmmltUrs/aC1/1jUUVxYcoT+pJ43Is6xdPIPFQ0XMhbYkYaXUR/Q6dfhhWU3Dti2FsvzRAhZQt6MRM7zAnWRBN5E5x1x4AzenjZmiQXTyhIbisOk/0s8evaitviZySAjr3lyXtGLW3wDx2dWZAyABMrSDk8PZQfOv6e+Z5d1jeBsAul2ZlM/M+joe1C7LqwiDhdmocXmcjK0qt/iBpUNkpyFih0WyQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3124
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9bf35914-8ae2-4fdf-69d8-08d87b320b26
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qIEBR2F/+PkH/LUKQyJHOg+B13Lmr9I2sPg2Gi3eZElV258UPAvkukBtk5MjMOdUAuzmD4HVIsuvd0FBMW8djJjJtgNwzYlwCCkYLmwVeDPHSj2UqmfKltmk0Tc8C88Z+J00m0frtrv2dmpLbkthmxHHCwVvWEmphg40Ih5PbfcxvKbqqJrjGmcWNqnzjNdcFNJh6Aqbtm3djSPDFvkZ2I9rKyxU10I4SNZai0cp9iZZX/G2Zmw/Gd5IAm9wbbiRPdegC4vEktb9Uf+CXdwKUXfnHPRskpD8VQFeT+WVy34tPs8EgAo36BCW/SKlCqI6mGpVDJd1dhQovRTRl0U8YHlvzo1YIQGTTyQNioqWkFIL5JkVYF7s+kQVNi8T5KBeiAOTc1m9KewUM4+a6u1ixA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966005)(6916009)(356005)(8936002)(956004)(2616005)(83380400001)(82310400003)(6486002)(26005)(7696005)(16526019)(186003)(1076003)(336012)(316002)(70206006)(86362001)(81166007)(36756003)(6666004)(4326008)(36906005)(70586007)(82740400003)(4744005)(2906002)(478600001)(5660300002)(8676002)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 11:10:54.4792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e981d90-66dd-41f9-2604-08d87b32236b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2013
Content-Type: text/plain

Add nativesdk support to make grub-mkimage tool part of Host tools
in the generated SDK.

The conf file should have "TOOLCHAIN_HOST_TASK_append = " nativesdk-grub"
for the grub-mkimage to show up.

Change-Id: I78d9965ea29ffa9e020574e0977c3c133c8ff9f3
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta/recipes-bsp/grub/grub_2.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub_2.04.bb b/meta/recipes-bsp/grub/grub_2.04.bb
index df607cae14..f2942b9e37 100644
--- a/meta/recipes-bsp/grub/grub_2.04.bb
+++ b/meta/recipes-bsp/grub/grub_2.04.bb
@@ -35,4 +35,4 @@ do_install_append () {
 INSANE_SKIP_${PN} = "arch"
 INSANE_SKIP_${PN}-dbg = "arch"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

