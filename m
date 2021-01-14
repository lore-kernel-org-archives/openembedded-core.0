Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.75])
 by mx.groups.io with SMTP id smtpd.web08.5129.1610611610552684558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 00:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZakvcOEL;
 spf=pass (domain: arm.com, ip: 40.107.6.75, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8t3YqNTCAW437ZQneFoJrrlmzOUuQai2mP6NKeYN74E=;
 b=ZakvcOELQbqBI0O1bnqEkJ2oMoI4Dbpyn4A2aoGmqJDCO8U6lRvPavxzQ347YMnBfp7gyMQlUzuo/Z45UBg6SV67wZXiDyvW8sKalD3o/EYvl5jdWkDiF1MefozKqSjvCqihJg/R+3FeWNl8MqX+pN7ToK0Yn/1aDQ8a3OLD+d4=
Received: from DB8PR09CA0034.eurprd09.prod.outlook.com (2603:10a6:10:a0::47)
 by VI1PR08MB3566.eurprd08.prod.outlook.com (2603:10a6:803:81::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 08:06:46 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::1d) by DB8PR09CA0034.outlook.office365.com
 (2603:10a6:10:a0::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Thu, 14 Jan 2021 08:06:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 14 Jan 2021 08:06:45 +0000
Received: ("Tessian outbound 587c3d093005:v71"); Thu, 14 Jan 2021 08:06:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ad13e55d4ab99205
X-CR-MTA-TID: 64aa7808
Received: from 49dbb7de8984.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 626B33C3-5D56-4169-B0E5-61A44667A8B4.1;
	Thu, 14 Jan 2021 08:06:40 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 49dbb7de8984.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Jan 2021 08:06:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/PARcrWuNL/+9ULxjXnrx1Pl0Czo9JewM/GYcWLeG2iIu7y+GX6jIcyBCZvF5In9LvupOdbj4SNfbzIJKb7ZmHRytt4gK7KSfmaptXAx83YevHs3DLS73V6iEKBmj2dDTtw0P/gWBtskUR/pu/hq14mxBHHlQHDeZUPyKgPigbPRuwTpWHYjAqgAwSl7xn4c5XtPDbqpK0jE6uRaDwZ+vXPLJJyK8iEmksuAnAFib81i+C+qCz+iVhmgrJWsbEAYTwT8Q1kI4nDIAwHTlqdY18POaW+oRcNKOWkKdma+aixn3eeUdbnO/ErptcEsRF/s1Pm3lLVbhelibBhlnDcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8t3YqNTCAW437ZQneFoJrrlmzOUuQai2mP6NKeYN74E=;
 b=K5Jf5wHohVjH3r8FHW48/8xN4M9arLRYI/OV+mFiytMwUZH0Jo+HPymnJOD5AYL/YfRhrLJnp4sO+2pcEOtqBACLn8AA68vi1m4Sza679V/xhOOqeCylijydsa+17IEB2Jl9rKsiYWSvhMkO5idOhrSYAgt54vvBHrmieLu2+YLXGDXaQlqtoGPOlL0ZimYqJ/Xxnfkr35x/1HE3IuBjFac+cMzQgEOQLYRsxcPXdilIrQdAjlw1lzkJRC6sgB7ey9tBqoah3wbg3AJZARdaRpRiInMBtCYC/UIv56Bv92VjSa0pptB6ZAxWmdl9GoRy/0j6BSPzJrFDcbhTW6z9+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8t3YqNTCAW437ZQneFoJrrlmzOUuQai2mP6NKeYN74E=;
 b=ZakvcOELQbqBI0O1bnqEkJ2oMoI4Dbpyn4A2aoGmqJDCO8U6lRvPavxzQ347YMnBfp7gyMQlUzuo/Z45UBg6SV67wZXiDyvW8sKalD3o/EYvl5jdWkDiF1MefozKqSjvCqihJg/R+3FeWNl8MqX+pN7ToK0Yn/1aDQ8a3OLD+d4=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4803.eurprd08.prod.outlook.com (2603:10a6:20b:c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 08:06:39 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 08:06:39 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 2/2] u-boot: Use intermediate-deploy.bbclass to share artifacts
Date: Thu, 14 Jan 2021 08:06:27 +0000
Message-Id: <14224694ddb35566058a4f88e033a9da04485c56.1610611154.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
References: <830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LO4P123CA0360.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::23) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.51) by LO4P123CA0360.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18d::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 08:06:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d88ed055-6c75-428b-c9e8-08d8b8635629
X-MS-TrafficTypeDiagnostic: AM6PR08MB4803:|VI1PR08MB3566:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB35664EC3311F37ACC25D7C8792A80@VI1PR08MB3566.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2Cjj6y64Nn1/6omO0+mHuF51wbQczwjNBu6u6TsQPe0NRWU74BWCKmvvhw+NoWp0CBV5h8S5QzIyIS3ZBkCjhLHjtjnwdPfPv82CoQC0xlQ+n7m7FOD04rri6xmCc0Q/K3aCXS1eFRyAOUSvaPRQPDpJxeOPMNvPk4XUpJo2H94aL1hZ94CWbXxP67DhbhQv0riwQZTZzhaEco+O2SMNLo+ZGOjptV4r92SMpwh4M70RVRHQuc+aTdSUqQdnZzmxRvSFYh2RcaUiU1bHL96g/EiBkRGTdweiaDmEEsa6L3sJQ63NHGvcu0B/F/4HM4pxaj8vh03of7bX/Rja8srKqZBDMFVwJgBdcD+2T+2ekIQ9zErLwu+D1OCBxyJN+grQd8oo2flmyNMX+XHgicq8Pg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(39850400004)(346002)(2906002)(6486002)(83380400001)(6916009)(26005)(316002)(8676002)(86362001)(16526019)(4326008)(44832011)(66476007)(66556008)(6666004)(66946007)(36756003)(52116002)(8936002)(956004)(5660300002)(2616005)(186003)(7696005)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?M2Sfr0/elWevfdrBu/Jc8ZDatt6MWp8kRyAdM4qK0jwRBYlIuiDkoMCWzkS/?=
 =?us-ascii?Q?SPGvy33xDjInzURvEgctbOGVpMA7Kw6rDXiyq7O8QStrMhj8kXD8nnuzMEsG?=
 =?us-ascii?Q?F9gByDjPmeeA3d9bpwtxGFKxKx3edExCbg/lhfyURFWx85+RF3fWMGT/gd/t?=
 =?us-ascii?Q?0+Y6uvPHH0IQ2nMQRENafOrXUDzhfHZzN2YpsJBu+df56fTGy7hZlRXSEtOK?=
 =?us-ascii?Q?xlpcKuUTZaHf7XQNQYlGr7J+pyzcyFTyMOa2GJSpOhwjx/8rqKrJBfZ5XE4A?=
 =?us-ascii?Q?Q3yOarGsFcnnPN/frCW1ZATQFlKWB4chaCSaiXFi007oFDHaqH8UUYfY0UoQ?=
 =?us-ascii?Q?iNkx95vWeu61CD8IWIrB6oHzZXwDcUflEKjBTqM343mkttBLslnggzts6zOc?=
 =?us-ascii?Q?EVwOI5mkIy95ocJNkr+lZ6JqjrGUnsVE7W9vle0tuZm2Rkhidd4iAI3jQljG?=
 =?us-ascii?Q?c/KGpDz6CDZs4oxYOXrlMF7gD2efJN+Yz5s4qC3HcJPtDZcjROEl3SdN1zVr?=
 =?us-ascii?Q?JDGE38i4ZwgTLpsLc+xCKOMh/0etyZ1EQzrNGlTPqNe1lgsIBCOvOaGUzJxL?=
 =?us-ascii?Q?ky2noglLKLuSEki22CoA8Z4vm9Ef99X8YgBoHH2JR7XulvIVMsPkLWlfvdkp?=
 =?us-ascii?Q?4/2L2+Tos7ImH6ssyLsBZEn5eriO15i06Pkqy/+VY4/fzho3sdEwoZvdEOxW?=
 =?us-ascii?Q?cPWaMOQZ8OD6mJlmTBPV5Sz9QgdJmGGHm/g7lWBYPonExWoycuUKOIzNdEWH?=
 =?us-ascii?Q?bStcIZCduZlF3BPaPx7w8K6dXuwyS6lUklDx/2j2ec7wH4jXBeY4KU1GcJX+?=
 =?us-ascii?Q?Xb2NVIrzcBnZMsN0bRLvWe83jbD3eLoiW7CRhWCgFrzI7WC7vuRocpxBbpzm?=
 =?us-ascii?Q?iY0zWJ24GMTS14Vfm6o4n6LmTlIkvRxbwkjqYyS+K/Be/vH80aAZLiwgwMQN?=
 =?us-ascii?Q?6ZPFd4In79AP59EC4gWzt7fQRUdpTDBjzU1d/D4vAuq1+OLp9JY0TubmTtAz?=
 =?us-ascii?Q?MksU?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4803
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4fd44ae1-3687-46e8-a812-08d8b8635211
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	petynlJQRzQ3ajP2kFYQ091Rsz4RjvF7cHhwSS6/icMfQHqnfFlDEb7Ge+Ptf73CXUHSEHXyLNvKgMVUIeoISKJ4I/37iIySa/aDWT5ZxzUIcnMvasTybUTrSdNObDJkeZ3lQbYiEpPMu1xgUSztDkeMfLG8vDVkbQg4A/tpTRxwh9VTZLwVFETy21Qn7wBJgU8R7USqMTfb9jA1lAObwlf8cSrNqomYZoUvljq0DTX/sm6xU/jY8xMObhddWT7ieXnY3Z7tRZToeQm9Krl1iWa4qlIvQ3fmqGQVFXrBJBgf9ohrBLwMf4wufR4vdSU9oQU5iNdX5LRILfT8d2e58BRKgB9FWflJMW/lGyfzmhmnGwwuURWzNGuy6EeX3m/IO5U7GqA6lreK4xQcDBMJp7C0wKcV4qRyx14uT4qAjtkYBG6xY+IiA7wrZd7GVj24M4b//sS5qom0UsavcVpinkJrzetxNPQe1373jC/0mJNVbpeef9l3Ujb3VIhDN5wd
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(46966006)(7696005)(34020700004)(956004)(86362001)(478600001)(82310400003)(6666004)(16526019)(70586007)(2616005)(44832011)(186003)(81166007)(8676002)(26005)(36756003)(6486002)(356005)(70206006)(47076005)(82740400003)(83380400001)(2906002)(5660300002)(336012)(8936002)(4326008)(316002)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 08:06:45.9707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d88ed055-6c75-428b-c9e8-08d8b8635629
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3566
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

By inheriting the intermediate-deploy.bbclass the installed binaries in /bo=
ot
can be used by dependant recipes for post-processing via
DEPENDS and ${RECIPE_SYSROOT}/intermediate-deploy/boot/u-boot.bin instead o=
f
task[depends]=3D "u-boot:do_deploy" and ${DEPLOY_DIR_IMAGE}/u-boot.bin.

Change-Id: I0cf02eb0ff54b636f57c7ce752366d67164fa1e0
---
 meta/recipes-bsp/u-boot/u-boot.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 251178db33..15554387ce 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -7,6 +7,9 @@ DEPENDS +=3D "kern-tools-native"

 inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3n=
ative

+inherit intermediate-deploy
+INTERMEDIATE_DEPLOY_DIRS =3D "/boot"
+
 DEPENDS +=3D "swig-native"

 EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_PREFIX}g=
cc ${TOOLCHAIN_OPTIONS}" V=3D1'
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
