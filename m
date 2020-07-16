Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web11.13891.1594900774962398443
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 04:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=U3ZJhlkc;
 spf=pass (domain: arm.com, ip: 40.107.8.48, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbSXvciR2J2DcPFZKySJrKxNFEifQXdtYKlUx+YClbU=;
 b=U3ZJhlkc/VtHfq5c5Q4MNkg0iWrjeJJEUYdZDkSDi3PqzYNWy690tMKZne8bDOaEE7U+UuwWyBte9+ctSATuRSOGVYMpEIspbIeTjUqfMjtn1KEVf8/1ZRPaZ8Ze5RksFw61f1uSp4WxuLg/x+404pPYjCwPIxh9//1tEMcnn60=
Received: from AM6P193CA0107.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::48)
 by AM6PR08MB4614.eurprd08.prod.outlook.com (2603:10a6:20b:85::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 16 Jul
 2020 11:59:31 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::65) by AM6P193CA0107.outlook.office365.com
 (2603:10a6:209:88::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Thu, 16 Jul 2020 11:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 11:59:30 +0000
Received: ("Tessian outbound 8f45de5545d6:v62"); Thu, 16 Jul 2020 11:59:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7405646bbe96a8f
X-CR-MTA-TID: 64aa7808
Received: from 5bf94dc1f931.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FAD2C3D0-7CEC-4EEB-8410-9DC1AFF7A02B.1;
	Thu, 16 Jul 2020 11:59:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5bf94dc1f931.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Jul 2020 11:59:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFab9L3w14KcJdZrXKfFX3LlLE44oZuVQTkoLAsMRC3ScqfN91rHZhZe2WlX+KdD2NpiYlq331m4mb0cG4nMnpjs6dKl+utQEUpfwElShjVUJXhm5s03Hfs1TAl6wnR5NBNgb7M4pkPb67kRk1WhQkxF7m8lpLp5zKGjr2LW6WA++6GGEgcdYO7EmQNevLfRQJjzUgVEtnstMGYpMfggbh/rxB6mUTpp6QO+zRUMTxgsG/VwMq3sqrocn0cDG2kZ3U461fd3xrD5Vu2AcfKOYr1Onfr9+ZX0a3oMcZYgearg/+BX8x2zObcjbyR7ZeHKAmWSOQLwGZRcH5HVfPMm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbSXvciR2J2DcPFZKySJrKxNFEifQXdtYKlUx+YClbU=;
 b=FtT3gB8/aUgCoYHuDMrRQoBJlGiSqAjip/vpW3263B84bqbwd7Iup+/gSGnJnom6WTp6pDYEu/JisYU2X25K4aG+8tafqthuz1zuEJzwSZ3AVJ5oBngQB7gGjD75ppq6y8G32xpZP5nHHyQys+bEC37Y33o9hMU41BsZuq7FVt4VZvvqd/8cpDFtArrnVnY84NJjia/rdrPzwZsohBvxS2V4kK3mGz6Ma+02dym+RMBUnPa8yMFnTybXpV5T7nYM41xFZiFb4iQTQ2ipTvomlmr7XKc6YMkf6h1Yv5btlF4CioNhjcsQen4v2xF16bgSY3y7iwYzEZkSqYAIdKRnAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbSXvciR2J2DcPFZKySJrKxNFEifQXdtYKlUx+YClbU=;
 b=U3ZJhlkc/VtHfq5c5Q4MNkg0iWrjeJJEUYdZDkSDi3PqzYNWy690tMKZne8bDOaEE7U+UuwWyBte9+ctSATuRSOGVYMpEIspbIeTjUqfMjtn1KEVf8/1ZRPaZ8Ze5RksFw61f1uSp4WxuLg/x+404pPYjCwPIxh9//1tEMcnn60=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DB6PR0801MB1974.eurprd08.prod.outlook.com (2603:10a6:4:72::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Thu, 16 Jul
 2020 11:59:23 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::e1ab:56e9:2119:8cc5]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::e1ab:56e9:2119:8cc5%5]) with mapi id 15.20.3195.019; Thu, 16 Jul 2020
 11:59:23 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH] qemu: fix for virtfs configuration error in qemu 5.0.0
Date: Thu, 16 Jul 2020 13:58:58 +0200
Message-Id: <20200716115858.20927-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0455.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::35) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO2P265CA0455.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 11:59:23 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 017bb2d4-2016-4598-0af5-08d8297fb2ce
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1974:|AM6PR08MB4614:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4614B42E0BC43E9ECA508E7DFD7F0@AM6PR08MB4614.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bv+2SLnV5P5pTZzrnp0pW/UVgTyWt528x/vvE+4jqvV2q5bP/hNROT8r2IC6gQN44J2PoZdm0xlGNdfBauAWkb0jl1F1FdKU1k9unTRdoiwxvn5VCKT3RZhyGwgQ5LpeZCT7bc6231D10yWQ1xkGSeiF/2qOGUIsa0BhLSRr8ZAorCXRNouaY2W55XGZNcoLU4i13uXsQeTNPH+dvl5yqqftFN5CtgjeAngV7kcIgK7iksRkNdzPTKKRfhmk5HnPkjtm14gjbzsFuHAECJR8jAtpCcMG1gEBd2DzT+mfqRVhqWh+X5Xvwo7xP+dGL5VcEmukai2BQZQ3xV0K0a/e5Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(8676002)(36756003)(83380400001)(478600001)(2906002)(8936002)(6486002)(66946007)(316002)(86362001)(66556008)(66476007)(16526019)(5660300002)(2616005)(956004)(7696005)(52116002)(44832011)(6666004)(4326008)(186003)(26005)(6916009)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Uz8Rm2OUZ4JAOkGx8qEBLWC3p5TrEUXGB8ZaT5EhmgTmVs5eWldEyOlYRulfYQ7Hurbu3gXIPekDXkJxaW/VE5tkbrl6PfGtnfAkoDn7qv8H8r8lb/eX4C+zPTNoxg3ymeLQm5KkIrB0QDs+s+x3wV0WCqh5Uo4ONypqvm8UbfqpzhVSuwv8969ORL0ev4a9djJietwngER+kqYfQ2u4Ud460OfLO1OlQnImjQUnSOK1FiNyk61BMPOSMmwXIWDXjqLkBqe+rGtk6OZLfnzmdFtyCLBch6+55Vy0WE1x9XNn1Q3Py126VdRGCyugv3O4mINjBhJ+xxuE1+b1IR5gubFj8EEGOylCn+AyPT+9htFw4SYOcxQ7Z1YylJuJoBkg6hy7WYKzu+ErhZL8gxk0U9UT1hzR33kbZNbZlEm9MSs5Q84jHDPC1ancTnv0/tAA+2D6ob4OD5/prJ1JTJq9J0Jh1b48NUrNza/CwU7uq4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1974
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966005)(2616005)(2906002)(956004)(83380400001)(4326008)(8936002)(44832011)(70586007)(70206006)(5660300002)(6916009)(6486002)(336012)(1076003)(82310400002)(86362001)(6666004)(26005)(36756003)(81166007)(7696005)(16526019)(356005)(82740400003)(186003)(478600001)(316002)(36906005)(47076004)(8676002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f0d00e52-dd1a-4fbd-6a44-08d8297fae36
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TGsrI3c0I3S2YSaE9xyZgBj0jOabyvoMNVJurGr0VEse0fmvDaohrwmW+ukyCVelv36mNAqCNow63rwJOKyPC5mqwXBY+NSiRg2GLJUwEN3AJelwfJgszLcal4jmucPpSINn3ztMWaXPCO9CAcBik6IjGmQhF0SiS6w9G04L1AlJpdo9RcOf4nW5Vej6XiTUKTFbdslMLVHZhiAMjm9XvbeZyqBQrXpNIl/Eoea6V2o6JM9CLzvF7PsqqaidpYTc2EQkwXn4y92F3c272oU/Q3X9/Tx1NUBvdJ0trBEktof6CF19BgsT3mA+h/1Wxhc5WB/sFhiy5lzkqVoG8FmYoCfNaNF0yBYfsSJ7bL0ee0Cy6aSpr1XE0nG6uurXUw+FAw99dZbezwzLgM1RgFxbzw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 11:59:30.9208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 017bb2d4-2016-4598-0af5-08d8297fb2ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4614
Content-Type: text/plain

Add --enable-cap-ng as virtfs dependency in qemu configuration.
When using meta-virtualization layer, qemu requires virtfs,
but during do_configure stage below error message shows up:

  ERROR: VirtFS requires libcap-ng devel and libattr devel

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d41cc8f200..7333bc8453 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -140,7 +140,7 @@ PACKAGECONFIG_remove_darwin = "kvm virglrenderer glx gtk+"
 PACKAGECONFIG_remove_mingw32 = "kvm virglrenderer glx gtk+"
 
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl2"
-PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap-ng attr,"
+PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr --enable-cap-ng,--disable-virtfs,libcap-ng attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
 PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen-tools,xen-tools-libxenstore xen-tools-libxenctrl xen-tools-libxenguest"
-- 
2.17.1

