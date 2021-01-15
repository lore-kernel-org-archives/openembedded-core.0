Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.78])
 by mx.groups.io with SMTP id smtpd.web09.3629.1610726420178612102
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 08:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AXfERUHD;
 spf=pass (domain: arm.com, ip: 40.107.7.78, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NC1dd5eA/UYvWu4GL9rd4bTZ1Ecu6UfkGyYeng0Ijrw=;
 b=AXfERUHDDUV4kFRwTEpjrsLVJmx0nSFQ2fBAES9zPcvopg/k6aPltjAbkTu5fqztUQyJ6jvPdoMOW1Xf3+bv6IVN+4vs/INGOVORWZKzZCtK1Eo20UjMBfoe0sWfuMXFky15wL37CLSkN9X995/kH4wXm7UF9RFJo/mlW30/XTg=
Received: from DB8PR09CA0018.eurprd09.prod.outlook.com (2603:10a6:10:a0::31)
 by AM0PR08MB5140.eurprd08.prod.outlook.com (2603:10a6:208:162::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Fri, 15 Jan
 2021 16:00:08 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::c0) by DB8PR09CA0018.outlook.office365.com
 (2603:10a6:10:a0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Fri, 15 Jan 2021 16:00:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Fri, 15 Jan 2021 16:00:08 +0000
Received: ("Tessian outbound af289585f0f4:v71"); Fri, 15 Jan 2021 16:00:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 66147b6966f3bd44
X-CR-MTA-TID: 64aa7808
Received: from 49f50aa37002.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2BB84312-300C-4AA8-B584-3A466283DD9D.1;
	Fri, 15 Jan 2021 16:00:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 49f50aa37002.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 15 Jan 2021 16:00:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0fAQJkZDscspsDYcEZ4XJNroW+piMU9gYujLqeZuCpKjk3icoMDx44Ei/Tz4qxFoqlgwn/N7Hx1IuyWcs7RkrGmk5FhfSptT9C7mLfj4RK9FBr91RCsy6/YqmTng7cXzG8pm0t/ovY0WuY5ZMMDhT0J3BG6wHvIXjgqg4wDRi1xFCHmgPKeWTJUBgz+3h7pdfbGMYmhZLdnFwzreQYuCB7swkR8W/tjSP0XKFm9emyWNR2CxVDVSmIGOLkMx9x2Xmb5u/v/rjMQQUxQVkAptRCJ8+hHUOtGfmKUInbtPF2wh74dlhlQydkhdvv7YKTUBvNoghbUCXq+lZiQneXpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NC1dd5eA/UYvWu4GL9rd4bTZ1Ecu6UfkGyYeng0Ijrw=;
 b=LX2wU33IRYs+OYa8YuyQbwfrs7UblIzLstqw4HNKjZcHPzz1oe1y1fMFiH4qgMiUQATOYTzD7duJuieb6a3zN27cso4ZUKHqnMv0o21kbEHxjf0eIuwHRRPuOhNWj8gS/5EL+ThhbL/J2pwv/BlmPN3TZCFfaj+RSY7a/4iyqDojBa4meVM+zMZy82T6cGJO4Oz9Y2xYJiu/MYVb5d82YcrlSnIuod3tg8Z5e/Fjt6oRJnHb865afkL6rKFfyuVeuqt2DYtJSH3nJl0bbT2MbRGKcMsb/wKXhZOfXerQmnK5k9dztq6FDuZR3eYyBJod72Hr40QRNlcQk7RlqFqTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NC1dd5eA/UYvWu4GL9rd4bTZ1Ecu6UfkGyYeng0Ijrw=;
 b=AXfERUHDDUV4kFRwTEpjrsLVJmx0nSFQ2fBAES9zPcvopg/k6aPltjAbkTu5fqztUQyJ6jvPdoMOW1Xf3+bv6IVN+4vs/INGOVORWZKzZCtK1Eo20UjMBfoe0sWfuMXFky15wL37CLSkN9X995/kH4wXm7UF9RFJo/mlW30/XTg=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0802MB2498.eurprd08.prod.outlook.com (2603:10a6:203:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 15 Jan
 2021 16:00:00 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 16:00:00 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] staging: Introduce /sysroot-only to SYSROOT_DIRS
Date: Fri, 15 Jan 2021 15:59:51 +0000
Message-Id: <178308dd6334208c4604f3a14b95c0b1f8e71347.1610726301.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO4P123CA0032.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::19) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.53) by LO4P123CA0032.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Fri, 15 Jan 2021 15:59:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5877c863-be97-41ff-2f45-08d8b96ea1a9
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2498:|AM0PR08MB5140:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB5140E63800AB9BCC9465625192A70@AM0PR08MB5140.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RrgWiAzei96YV6P1BtXqVljwj8G3BthDEpXhrrg8YAZzY1axQbeKars7Wrhk9RRn7J4wzMyvXH1jtGP3nhufyHCCIV7UweGz1+lbxTHDITleQrwm9tTf4qwuphcfYVGVZ/iIS3QGvXgEpRpBA0Fq6h9tGv8lO+S6oXj4Ch5rznbhQOh38lmJLpUt8AGD1IIzmwmPgyDU1Gkj95Epv8ceSkiKa+OqHPHeh3gipW4lksESlWCOgDiKxzKNnP9+2vSA4qanhpMkA73Wpf+32qldRVDxnbTvhL5DOzpgxqwQefNiG5Q3vfnsyS+w6SHspMzln8aE5ziJRxuKyO9d37LuYxKh+rviLabEH2BNUmQnZ7seBaLtAlppTlTL+roKYk/KojSF58ma9IOFmQjBdvu5mA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39850400004)(136003)(66556008)(66476007)(478600001)(4326008)(66946007)(5660300002)(8676002)(7696005)(83380400001)(8936002)(186003)(16526019)(86362001)(52116002)(2906002)(6916009)(44832011)(316002)(2616005)(36756003)(26005)(6486002)(6666004)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?W5UzdAZR4jNlpgwWZWKUtzEyeSeTgeyr+6n6eozFLRalEckY3FPiATcjpkZ4?=
 =?us-ascii?Q?Bu1PBktD13QzvSWc720VETA0Ze3M/i7cCs0fjEIZDz/uJZPKOMGz5y935T2T?=
 =?us-ascii?Q?7l6x/RTuMrDZHknaSQ3f4bKEjAWfj1yAJPNPPXt8b0UaWteZaEaggILvIUQr?=
 =?us-ascii?Q?2vkpxinaLpJwAey6XLKKU4ZelAc9Xoy17BhZg/oQ0C0qU8aqgpDY8QRfoo3B?=
 =?us-ascii?Q?y5z/gO9+z3N1PVbpU8/gJgiaxw8hHFu+tP9K++BXEN1dligX844HN+4fQueC?=
 =?us-ascii?Q?NZ+escPgHba9qlVG1rI1e/z7FpxlD0sSOWG1W8u/WvSq0NhNv9nADO5jTUH6?=
 =?us-ascii?Q?UXQk3xiesPtUrsuJbEzXsVSyW89xvfxwFTb4HFx1HgQk6Ha/H7dUyt/HGiRy?=
 =?us-ascii?Q?PNEAEfGwxpLRuQJlK4H2EsLJ37HVTXEseLkGXYW99vgnCTIMuglLdXxveD+s?=
 =?us-ascii?Q?BY0DSBWC/lk58tO72bQrSY0GnTJSJz0HdkNO147G6O7beWwn0h4SXxQUVeTI?=
 =?us-ascii?Q?dvk421n6QciIchP51S3PxmIcUGmOQWKCBgrDpzc9rg7/9KICCnyzp/4W3mhR?=
 =?us-ascii?Q?YzQr/qcMHI0dj+HBF9ZXn7YZpXQaZG2BzLYd8S+Pnvo/x4lcyn+PPLLQT3T9?=
 =?us-ascii?Q?ujE49UCeqCeLklcnEoAoXJQqXtmmJlF2BnoAyo31V7KKttb36WytfFzZDu19?=
 =?us-ascii?Q?+LbffKrjdHPpGU0dFJccmEaY5ODvsLOGqE4EhbKYG2JIzq9wvBmbf5ojGF7J?=
 =?us-ascii?Q?8/iJatEmsZfKM7FkNePYTTI7M+arMIT92qNZUrFet1bsJa6HmoofHYkYVahI?=
 =?us-ascii?Q?p8/VyGAa2S2fcfKKd0nhfLBFmuSzxJXerJTuKktdhCEyGdaZSZOCgTVcC9zS?=
 =?us-ascii?Q?zo7TiTLlNQXxTXaiCWlvvD3Bv8Ozkjl0ghJx1UM7xr5VYWre/Nhjce1SCj/b?=
 =?us-ascii?Q?0z2bW1RqszC2sAIy5yzgazEzy2vHx8jlBeWlGgkFkWLApU2CAx2p/bRCE3Tr?=
 =?us-ascii?Q?+WT0?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2498
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	78095fb2-7c7e-48a3-efda-08d8b96e9c90
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oO5Q4rIYy7YRwUCPgyDV1mEfvueh7dx1s7zzlkBjsEB/Bq7s+wHooGteq5onmgHg3iPgIS/8f2wI1Nwkj14k06iXKfy69pvlSHXMWK54NnjYF/Gp+LZneq1MS6eDKVet/URzDfY52TNNLDNajRJPvrNkfAVIjzSZY+4ctnuyvJzkc4C2EZLUgCI/8z9Z6lg2Ts9NANPxIySQ5qrsSS9se8Ny5fDLTsjkY5S5krm89yuBQ4w/dngGNw5bq7iGMdImA6oJJdPDOCpb/hlHMJt4DU1d6rFKP5jznH7/yBd6kR5rbnCVeCJotUtIxCPBqCfP+LHzNCb0eQ3cVyr4ZIYgq481trYPctDUuH8qxs0cbrsq6RsJSJ+V7XYotgROxOT4xyR8UwNwojWONiSOGvTzY4OTnUNEckJrwPEyAXTnONH7WnRFpjuOFct8oOY4HM4xfaDDGNUqJyHlFbiCyXj1Zjq5nkr4f/SpURUVCpJfrE3R/xxOWkxMMO292aj6V/dD
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966006)(478600001)(83380400001)(86362001)(8936002)(5660300002)(4326008)(70206006)(81166007)(16526019)(2616005)(82740400003)(47076005)(356005)(26005)(6666004)(8676002)(316002)(6486002)(186003)(34020700004)(7696005)(2906002)(336012)(82310400003)(6916009)(956004)(44832011)(36756003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 16:00:08.2625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5877c863-be97-41ff-2f45-08d8b96ea1a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5140
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The '/sysroot-only' in SYSROOT_DIRS is to be used by recipes which
generate artifacts that are not included in the target filesystem.

Also, remove the ${D}/sysroot-only dir before copying D do PKGD to
generate the packages since it is not supposed to be included in
any package.

This will allow recipes to share non-target filesystem artifacts
without needing to use the DEPLOY_DIR and keep it tidy.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta/classes/package.bbclass | 6 ++++++
 meta/classes/staging.bbclass | 1 +
 2 files changed, 7 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 247bdc7bbf..a77d532b66 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -807,10 +807,16 @@ python package_do_split_locales() {

 python perform_packagecopy () {
     import subprocess
+    import shutil

     dest =3D d.getVar('D')
     dvar =3D d.getVar('PKGD')

+    # Remove ${D}/sysroot-only if present
+    sysroot_only =3D os.path.join(dest, 'sysroot-only')
+    if cpath.exists(sysroot_only) and cpath.isdir(sysroot_only):
+        shutil.rmtree(sysroot_only)
+
     # Start by package population by taking a copy of the installed
     # files to operate on
     # Preserve sparse files and hard links
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index f0a619b35b..12e0eab4f0 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -5,6 +5,7 @@ SYSROOT_DIRS =3D " \
     ${base_libdir} \
     ${nonarch_base_libdir} \
     ${datadir} \
+    /sysroot-only \
 "

 # These directories are also staged in the sysroot when they contain files=
 that
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
