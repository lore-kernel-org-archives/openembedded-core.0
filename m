Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.68])
 by mx.groups.io with SMTP id smtpd.web10.114.1595265548516963010
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 10:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Bb4pvLYl;
 spf=pass (domain: arm.com, ip: 40.107.4.68, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4b/obL8IGEzInGIV70oNYFP6AAvLMcDmiI5LEnjSmQA=;
 b=Bb4pvLYlWKpkVnfxdKOxPMeYp0StbIbk5F9B2u1jjXM0OxV5Bp9mwhTe7mtXpJ1HWJoxOFqvhXkyyzWhotoaf4+VZzQs1ms/lOMKfqM/T/Lowuiy5Jn/K9DPGontBXjjsjOxdoz+Lof2+fTUqBNz3LsNHyiz5A5xp4KAmbSL/sw=
Received: from AM6P193CA0083.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::24)
 by DB8PR08MB5164.eurprd08.prod.outlook.com (2603:10a6:10:e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Mon, 20 Jul
 2020 17:19:05 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::b2) by AM6P193CA0083.outlook.office365.com
 (2603:10a6:209:88::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Mon, 20 Jul 2020 17:19:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Mon, 20 Jul 2020 17:19:05 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62"); Mon, 20 Jul 2020 17:19:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c311bab05c5620e3
X-CR-MTA-TID: 64aa7808
Received: from 12c071e01ac8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6D97A359-951F-4055-9ECE-EBBC2EB91DD5.1;
	Mon, 20 Jul 2020 17:18:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12c071e01ac8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Jul 2020 17:18:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIXDUPRqIPlCU4uWsUYX+6jJsoZp+Ppd3FH/s8zJlZDxFKoeML7Inuv1DZj/Qw8tNMk3N0IB+xn4Ip52CAynDwlcZ01vQBhOkSAnQRrMbaC4P/CpI9vx/GoptmLQqes3TlDF+qb3KEz6wKpSshuJ+yCq+COyfZYzQv6YWKIypWyVHguX3Xi4IGmS4AEC6ttQlEKqKAsizoiJ/qVJD7T8M+l4i4SsBYkzhVponVwNGdYUHaV7TvzMjy6FQmjcwoW4FSIKe/2dxuVghwgMECarkLrqWMvPSrx7vpTS4Phnp3Z8FGCbFef0wi/pa+MnozsVOhpKmicTuWDnVEXRbdrl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4b/obL8IGEzInGIV70oNYFP6AAvLMcDmiI5LEnjSmQA=;
 b=XMWabdMA6gawN44l/IvTJ3c+w4zdvjxU1ICy2NrN4IKR+TOTbco5Ep4cgH9Op12FbqHeomLfSfHEj7H48ckt2/iptJuAlPKPphMxlTJ5xpmDe9sUvRor/QLFZRRpcIEyNniXzezkK4jWOsXhH6zIEKmoCnHkUR+S+LULek+1B+2VCM65taTpgFXjlAr+zaN0o55i225JmsJR2jDwiEeO4x8nDxCi1L8NDqSYO31Y5JSPDKsdlBsTi3GMqwSMorykOxy3FrhQLwTrIXRBy0YZeE0Tu7LEixu6WTJs/NCgEVI0bxXXybQ4DbJoMDMPz6iJg11MG8U4jz5rjG19lQGH7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4b/obL8IGEzInGIV70oNYFP6AAvLMcDmiI5LEnjSmQA=;
 b=Bb4pvLYlWKpkVnfxdKOxPMeYp0StbIbk5F9B2u1jjXM0OxV5Bp9mwhTe7mtXpJ1HWJoxOFqvhXkyyzWhotoaf4+VZzQs1ms/lOMKfqM/T/Lowuiy5Jn/K9DPGontBXjjsjOxdoz+Lof2+fTUqBNz3LsNHyiz5A5xp4KAmbSL/sw=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB6PR08MB2773.eurprd08.prod.outlook.com (2603:10a6:6:20::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Mon, 20 Jul
 2020 17:18:58 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::d0ff:7eaf:e6b9:d58]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::d0ff:7eaf:e6b9:d58%6]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 17:18:58 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH v2] kernel-fitimage: build configuration for image tree when dtb is not present
Date: Mon, 20 Jul 2020 18:18:21 +0100
Message-Id: <20200720171821.39472-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P123CA0046.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::34)
 To DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.49) by LO2P123CA0046.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Mon, 20 Jul 2020 17:18:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d2a840d6-521f-4c6f-1347-08d82cd1016e
X-MS-TrafficTypeDiagnostic: DB6PR08MB2773:|DB8PR08MB5164:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB516492D5C5A9BB06C7C2FE3B927B0@DB8PR08MB5164.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6htUKsZX0A9nYrsIox7ORMMwDLCI8WxWHENGVO1tN5VT8Egll2yAKn6fNKIYN+pYw6zsjl8r4KHWvJoU502+JlWcjVbWyWUOh7AZspxj27TSu4EIOvAXPedunFYSeEV4v1RmfAp81z6P3J/9WwcuOn0/hpzgLohVoPdRSIlok9RLda/Z82J/sHnN2234/MQNaDO323huR8kjkJ1wo4/aI54pxfoWQKco/gIgq6LXu4lNq3tHXIuMeRaSXiOrQYpl409lsvUK1DQVJNqBvR1+X96y3fH9f6yRAGHgY2+sAKvp8eJ5SVDdHg+efj825Bs1W2PKwRsgm5/0u0NkAOPeeQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(44832011)(8936002)(2906002)(83380400001)(5660300002)(316002)(956004)(2616005)(36756003)(6916009)(86362001)(186003)(7696005)(26005)(16526019)(6666004)(1076003)(52116002)(4326008)(8676002)(66556008)(66476007)(66946007)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 F+XUyi193rs3VgJ0eSVg1LDwgzTDRRqmT39BCucnB0E4B9qtzOhWUrIUn0ZvEnJlYXCIxOtAcy/3g9+Se1iL3gZkl5EUJY0+/VEhth75Ez8axQdpmBueppcsWswyc57rXyJiiESH7ukYO1OKGzuZmcuCgArfHhqujsoBzj4NIQeCAsaeY6SMdOZpRJmR+3f41/b61nh8LX6xqaDvbGxiagVnWgEg8kbM1DFObP5WnEd2wQ+x1BBl0LT6ZxMRLZ/f1ygBtv2fICEuy+sJ0sfyKjca8a8Wc/lJ9jIdbonbAT1VLP3JC3wNfeFPZMf/ReX2Ntb/6IDTzofVXOIeM5mI3ElfoKD/yDcnFVph1XuxeLzISwSOwe4GWhWzWvwW3ZRD4S6b0JS1eXSGCCDY4WOFBS2gDTmsbnkMJJcp7fqe/BY+zz1FWFtTFrZdUK/23P9TOB2la438cK18cLJNmmlDMGgOajcFxgsZcoMLopXAfXBFcPXg94sxsGFIKnRs+lz6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2773
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966005)(2616005)(956004)(478600001)(336012)(5660300002)(1076003)(83380400001)(316002)(4326008)(81166007)(7696005)(356005)(6666004)(36906005)(8676002)(36756003)(16526019)(44832011)(8936002)(2906002)(86362001)(82310400002)(6916009)(186003)(47076004)(82740400003)(26005)(6486002)(70206006)(70586007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0c50883b-ce2c-44a1-f214-08d82cd0fccb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tfrWZG1f2M+EJLe6YMRrBrTZLoBs/WcLhIlbSlj8K9NicC7qGrUv/RFK/4u4sQG6WoUQmGQQaNubGxzutKFKkcEujmwZnNn35puvtCyEo3fwuILEGdLPTWufQ/31gYU+Hovzabw2b86vUdzozUeXrlpNCS5K9XjMOjrGTLbvm795MhPe4y3T0BXrbsQOAN8eMFu6NgKCMi36CtJ/ovkE74cNglz5F2pngmbmAV01Qw7g2ERHytOdoMYng3kTd5dGRHdOHSXSet4fN/8Z5jKB0eS0MEuh94iyAPaNOo89tljK5UzAHEQRhO0JqCyJkZo/Gzgoo2UX4l0rs44WcvagTqQUeI89TntQnDvIbHcW4QLxQ5Iby/aSWZW0rHkykGYSHDWRVm2eBu53QxLAOklgng==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 17:19:05.6133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a840d6-521f-4c6f-1347-08d82cd1016e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5164
Content-Type: text/plain; charset=UTF-8

This patch adds support for adding configuration node even
when dtb is not part of the FIT image. The conf and default
node number are therefore changed to point to kernel ID rather
than dtb ID when dtb does not exist.

Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 meta/classes/kernel-fitimage.bbclass | 29 ++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 72b05ff8d1..fa4ea6feef 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -257,12 +257,21 @@ fitimage_emit_section_config() {
 	# Test if we have any DTBs at all
 	sep=""
 	conf_desc=""
+	conf_node="conf@"
 	kernel_line=""
 	fdt_line=""
 	ramdisk_line=""
 	setup_line=""
 	default_line=""
 
+	# conf node name is selected based on dtb ID if it is present,
+	# otherwise its selected based on kernel ID
+	if [ -n "${3}" ]; then
+		conf_node=$conf_node${3}
+	else
+		conf_node=$conf_node${2}
+	fi
+
 	if [ -n "${2}" ]; then
 		conf_desc="Linux kernel"
 		sep=", "
@@ -287,12 +296,18 @@ fitimage_emit_section_config() {
 	fi
 
 	if [ "${6}" = "1" ]; then
-		default_line="default = \"conf@${3}\";"
+		# default node is selected based on dtb ID if it is present,
+		# otherwise its selected based on kernel ID
+		if [ -n "${3}" ]; then
+			default_line="default = \"conf@${3}\";"
+		else
+			default_line="default = \"conf@${2}\";"
+		fi
 	fi
 
 	cat << EOF >> ${1}
                 ${default_line}
-                conf@${3} {
+                $conf_node {
 			description = "${6} ${conf_desc}";
 			${kernel_line}
 			${fdt_line}
@@ -434,6 +449,13 @@ fitimage_assemble() {
 	#
 	fitimage_emit_section_maint ${1} confstart
 
+	# kernel-fitimage.bbclass currently only supports a single kernel (no less or
+	# more) to be added to the FIT image along with 0 or more device trees and
+	# 0 or 1 ramdisk.
+	# If a device tree is to be part of the FIT image, then select
+	# the default configuration to be used is based on the dtbcount. If there is
+	# no dtb present than select the default configuation to be based on
+	# the kernelcount.
 	if [ -n "${DTBS}" ]; then
 		i=1
 		for DTB in ${DTBS}; do
@@ -445,6 +467,9 @@ fitimage_assemble() {
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

