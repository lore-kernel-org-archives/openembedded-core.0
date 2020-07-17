Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.40])
 by mx.groups.io with SMTP id smtpd.web11.12284.1594995600339271549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=TJx3eoL8;
 spf=pass (domain: arm.com, ip: 40.107.3.40, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8qSh31czM7+YV+v4zEFyFoQCnjrN7t5FFK1Ju4KT1M=;
 b=TJx3eoL8IhUMvMdwi3G/9X8ab//sHs8BVbk1iEmYsDGeIk7zhcAegXO/QCjDLOQjShvqE8HOjyRICsQ7B3TNB5xVdG11ESdzjophr9S8+o2E2F8qkh0dsW/LXuhUsTUOd8y1eR8zHzDWPCIUOc4u4dBn5WxM4WBK6kpuP64+nRc=
Received: from DB6PR0202CA0001.eurprd02.prod.outlook.com (2603:10a6:4:29::11)
 by AM6PR08MB4037.eurprd08.prod.outlook.com (2603:10a6:20b:a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 17 Jul
 2020 14:19:58 +0000
Received: from DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::7f) by DB6PR0202CA0001.outlook.office365.com
 (2603:10a6:4:29::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Fri, 17 Jul 2020 14:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT047.mail.protection.outlook.com (10.152.21.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 14:19:57 +0000
Received: ("Tessian outbound 8f45de5545d6:v62"); Fri, 17 Jul 2020 14:19:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91099c565324c8b9
X-CR-MTA-TID: 64aa7808
Received: from 7715149bdd91.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3F47D08B-CF4D-4727-96A7-2DF167AFB650.1;
	Fri, 17 Jul 2020 14:19:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7715149bdd91.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 17 Jul 2020 14:19:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNFjkna4kvbp6F2+2bVLo2s2nwPPaqQOdZsTy/xfv27DRhT8OvnHIQ4wMZGMAzvd1+pl/dIMFLfpoXtGb1BaWVpSMPo/Brtd4yojXUBszhYthMxEcaBD5why2KQHWyOKKGA5VNSSjCIqymZ6lxJMwwZYZhdl5XjjYgaCHoKMiITMLaNl5aAKfs+/SL7kuQAhfKk5wOpnK0leg2hERhToWZILkHQAKirvoaLj7SJRK5WYW3YB239SVYzlKh7+5UOtiQBv/pcNJBzxjd/oNmFs6PkSQ2Xto5vaLAf3aUQ/1XthqOMmlKigkvhQw78OffrfMCqM/uJb1+EwmbFb3pTn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8qSh31czM7+YV+v4zEFyFoQCnjrN7t5FFK1Ju4KT1M=;
 b=I5CAJ6TgUYoqvWbbnaSuw+9Ra/LdLGP/kcve1CO44QH+mP7FDPAyQq9EqggM/3BdtrdT+0IA1s0F78U4RMjfxL+gCnqAoFJnlSAT3i2ahOo0WcXzj4lcBAFQJaEM/OXWY7l7fCNEW5xPwMCILjYjOuz4FpADMmkdiPvomXpLVtfTtSJzhNLw3hQUSnphz/hhauLVrgmyQ06cxfDnvhpui9ADkhBuF+jDZ2nlEsnDEKiSYLUI3h3R4Du0X3LIvKtKnKLPPzCa3HaI9s3p1rUnHlLXbIU41A6uNMnn8cpvi/OGJqkmw1CT3CP+wEjHpMp2/H3ZJ1F7T8tcRVG7irNXSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8qSh31czM7+YV+v4zEFyFoQCnjrN7t5FFK1Ju4KT1M=;
 b=TJx3eoL8IhUMvMdwi3G/9X8ab//sHs8BVbk1iEmYsDGeIk7zhcAegXO/QCjDLOQjShvqE8HOjyRICsQ7B3TNB5xVdG11ESdzjophr9S8+o2E2F8qkh0dsW/LXuhUsTUOd8y1eR8zHzDWPCIUOc4u4dBn5WxM4WBK6kpuP64+nRc=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB6PR0802MB2423.eurprd08.prod.outlook.com (2603:10a6:4:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 14:19:51 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::d0ff:7eaf:e6b9:d58]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::d0ff:7eaf:e6b9:d58%6]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 14:19:51 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] kernel-fitimage: build configuration for image tree when dtb is not present
Date: Fri, 17 Jul 2020 15:19:36 +0100
Message-Id: <20200717141936.9689-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0106.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::22) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.49) by LO2P265CA0106.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:c::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 14:19:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d9054651-3512-4816-3c27-08d82a5c7c0c
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2423:|AM6PR08MB4037:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4037558BE1B2908776E5FDFF927C0@AM6PR08MB4037.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MGVWMThTV/9aCF3RZmw84JVW4Df9zfOV7udHyA/F4SCEHRC+oMFxsvYCdzuWxgpTTFfN3vZXitXz+PqosKSBby69jw7lUJF1eGxLIfmBzAV7Qq6R3PFBvphpGCOieFC5f4/hcJ8DUxZMi5xVvtaQFbL+DjX7rqLKvq3ynJ7CWeEdq3wExDvUpMk0EbnzUgRIa3CkYyFLvJ6wDD7UrcCA0dzRMqO7oRC5cRVuZh/gMwxxHWB7LjJvWmM9vIKuwAdUex5Il62aDe5DHMjAHrRpQ7hi85IpMxtYP8IzoYeuB4W2yHOAYAEMx17pakt5WnuICQsOVIIdiSeA5p6sUfx9Qg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(1076003)(6486002)(478600001)(5660300002)(186003)(16526019)(36756003)(6916009)(6666004)(7696005)(52116002)(26005)(2616005)(2906002)(8676002)(4326008)(44832011)(83380400001)(66476007)(86362001)(8936002)(956004)(66556008)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 bJu9Yw6niqob8XmE3d9JliX9iCG2IJrhGr/m1x0+Gs9KRYr7czPB1pkU4ZgMNAOYQNKZ8f0Zn4Lw9FQUcJNYrpTKy5I+Y/ICtxc8E+hxbMFw2dmi2cexzEXZCDIgWRc700MJFZfXU4RbxDq2+1ffXqThosOyGQWfWk6MPTYtxVBZ4DJm/MgOpTYCVOeselARyshndwz/cXTyMasBZBiZ44zJ6KBh/5BLt3zGNF+huwA5He5Ddjn60j6H6OJ+yTWD8ueM55Xd6BOxaktEahmjxp3mz/2PhUTcQHboktAANSZ+Ni+JQiSNyWJOn6DVbjRv3C0W9p1K9y1pE/joWbIdJRq1y0pFKnduFDAam1MgbvZjrYyPfkfxPyIICroTZMP8ayoIiX5PBlWZyg/naZTArgrGuwiqiD+8RWfhO8nyZ3wUhv2eursmmqA88qPiPFzKw9azh60l4qqIxV7nTn06vznyt7SdUj2Wg8Cwl7O+rwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2423
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966005)(70206006)(2616005)(82740400003)(336012)(86362001)(356005)(83380400001)(70586007)(956004)(8676002)(4326008)(6666004)(16526019)(81166007)(6486002)(7696005)(316002)(5660300002)(6916009)(82310400002)(47076004)(186003)(26005)(8936002)(2906002)(1076003)(36756003)(44832011)(478600001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	39879287-6a89-476b-e61a-08d82a5c7824
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d1XBVWMBLpdCtYMw1f6e18tNJb3X8+WtwoOCCjDjuu7QjIyGvpUAx/BGyTEPB+NpYMWehtpFzlLSuceMX/RjYIZYnjD/xnXvrzXG3sm845zr0hNdDKJKfwHLZOKHhD7AWCMyfGnjR6gBOhqtjlNlxEtSqr7Zou8c/z5t2RgjAhqsX99Yfnd+qKcOLoxlvhTbOmlNjNq1B0whnphitgDeCNMHxlD+zT6QcrB5Soz8D1E87tIh29NtbYDYexG5nZkdYQ37Q4Tj+wWH1zcrSufKz3+wv0e0/AWTo3Ng7ycblpQm9yvu32Xx6FPTsK3zg8IfKbcg4oYNXM9lU8v0Vs1Jckf6OXGR0kem/m4YwMXkUh7r7RvItZPPJxIjH4GFNISJcUIlWivKZ0l2z6hYpEVnbA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 14:19:57.9399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9054651-3512-4816-3c27-08d82a5c7c0c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4037
Content-Type: text/plain

This patch adds support for adding default config node even
when dtb is not part of the FIT image. The conf options are
therefore changed to point to kernel ID rather than dtb
ID when dtb does not exist.

Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 meta/classes/kernel-fitimage.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 72b05ff8d1..6f4530fc3b 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -257,6 +257,7 @@ fitimage_emit_section_config() {
 	# Test if we have any DTBs at all
 	sep=""
 	conf_desc=""
+	conf_node="conf@"
 	kernel_line=""
 	fdt_line=""
 	ramdisk_line=""
@@ -287,12 +288,18 @@ fitimage_emit_section_config() {
 	fi
 
 	if [ "${6}" = "1" ]; then
-		default_line="default = \"conf@${3}\";"
+		if [ -n "${3}" ]; then
+			default_line="default = \"conf@${3}\";"
+			conf_node=$conf_node${3}
+		else
+			default_line="default = \"conf@${2}\";"
+			conf_node=$conf_node${2}
+		fi
 	fi
 
 	cat << EOF >> ${1}
                 ${default_line}
-                conf@${3} {
+                $conf_node {
 			description = "${6} ${conf_desc}";
 			${kernel_line}
 			${fdt_line}
@@ -445,6 +452,9 @@ fitimage_assemble() {
 			fi
 			i=`expr ${i} + 1`
 		done
+	else
+		defaultconfigcount=1
+		fitimage_emit_section_config ${1} "${kernelcount}" "" "${ramdiskcount}" "${setupcount}" "${defaultconfigcount}"
 	fi
 
 	fitimage_emit_section_maint ${1} sectend
-- 
2.17.1

