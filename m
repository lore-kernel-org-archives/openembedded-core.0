Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.73])
 by mx.groups.io with SMTP id smtpd.web12.19150.1599568143617510099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 05:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oTbeohGE;
 spf=pass (domain: arm.com, ip: 40.107.4.73, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/xFGFare02cRv/I9Qlw+PW+H9Wf+rbb7ZWrYTILsm4=;
 b=oTbeohGEMBRKbQ2JEdNIuT7cmCRFtWz6k4ppmxqVHKnUjondMFHXTFOLZBwIliuvlTpWYeH6Dty0cTcFBPLIPso4nPfFNoSvsIlpLazhYiTG7BvpwJRtthuudVlyAaW5DhVNZw83KiFKuRRXuUyi+fooU1ik9FMA2A2ld+O8UBQ=
Received: from DB7PR03CA0073.eurprd03.prod.outlook.com (2603:10a6:10:72::14)
 by AM0PR08MB4580.eurprd08.prod.outlook.com (2603:10a6:208:10c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 12:28:59 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::9d) by DB7PR03CA0073.outlook.office365.com
 (2603:10a6:10:72::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Tue, 8 Sep 2020 12:28:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 12:28:59 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Tue, 08 Sep 2020 12:28:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06833ee5396303cb
X-CR-MTA-TID: 64aa7808
Received: from b78649414e1a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81D539AB-7102-4219-B3FA-943C716DDD1B.1;
	Tue, 08 Sep 2020 12:28:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b78649414e1a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Sep 2020 12:28:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVyulv5MFeXABeyiQHQjszRVgYv+7frcJz//XCczZK67Mq4HsClufWiR5aHS/Odn08HmGBfEJ8AHT8wtPb8i8ge2V//4wLb7kkSYfBPMBomAuVbgQVz6VNPuGdTZoO7T8mruMOWee5wqif5+OYBpyTeDaRZwWFJJ6YpjYKfEBPCFbasG1+HsKU8+kGMCX7Vp02Ce1Vu18CQu56IMOdyOJBgez6J2FbrEaX9ii/HVCmSx+WD0qd70oH41hQ6B5Uhwk+pBw27AVw5nLWVnzHZGtryqH1J9180Dbs1+n6UK2/gg7vVBUwEolykHWFH2iv8HZY5M8B1lkVpUC/JwEcKgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/xFGFare02cRv/I9Qlw+PW+H9Wf+rbb7ZWrYTILsm4=;
 b=BuWAADgiJa74jrpbKoASWGuJyfersgmGvchecChNd2JjJW5awb012bQtORcP35+gItLl6+5+d0ZSjBcYbqW3TH0gjvhabKwB0rRPMNr9gmuqbkzltD31e1tNLEWRGuurjfpmw6FYiDM3vOykm9aw0/AkThjz7oE3+ZuWgzaYSZWf2k5r/IDl0twlZNSJJR/nf+Vzz+G2FYmbtTmY22nu+cNYB++Z7YuUthv5Mu4JMJWm5fql6LekahPSsCsT5vu4GFvWVr1Wv8NKkqOH8T+A5SVs5ez6qSl6vahKbtMFgZW6sjHdyi7uHHSItVQweb92iah7SBHOxz3WZxSYzaZBYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/xFGFare02cRv/I9Qlw+PW+H9Wf+rbb7ZWrYTILsm4=;
 b=oTbeohGEMBRKbQ2JEdNIuT7cmCRFtWz6k4ppmxqVHKnUjondMFHXTFOLZBwIliuvlTpWYeH6Dty0cTcFBPLIPso4nPfFNoSvsIlpLazhYiTG7BvpwJRtthuudVlyAaW5DhVNZw83KiFKuRRXuUyi+fooU1ik9FMA2A2ld+O8UBQ=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB6PR0801MB1672.eurprd08.prod.outlook.com (2603:10a6:4:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Tue, 8 Sep
 2020 12:28:51 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%6]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 12:28:51 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] kernel-fitimage: generate openssl RSA keys for signing fitimage
Date: Tue,  8 Sep 2020 13:28:35 +0100
Message-Id: <20200908122835.38284-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0350.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::26) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LO2P265CA0350.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Tue, 8 Sep 2020 12:28:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a31dbb69-93a8-4f6d-1964-08d853f2c345
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1672:|AM0PR08MB4580:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB4580D0CCA20C48212EA6A1FB92290@AM0PR08MB4580.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rBSf8jomVQhWqoAQvhNIPsILntrNIA+oJIe7JH+fokX4/nWFhT2dwezY3sywTD9Arne0Xf+tryDtWehJse+jASH/AVZVt43fqvipRHIio9B//Bwo7lt049L9FfgwTasnQxigxJVs56VAYKXHrQTvO5AFf5oadPlCZcznl3qaO2OMzOQEQbsybGZyFzWCsgsEOtXtgAg/kG0ZXTWMpKFoNylsr34cRTDJa1i0Yb47xxdVSUInKoZf7YweNxDxbBsFoK4gZmASuG66YbaZewk7nwi41A2T88+i9DbzY4W5AfVHLLC7OC38IIOnFDQ/qHzm7HLXgp1tPgxWVcNIMxpdRw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(5660300002)(83380400001)(66946007)(7696005)(66556008)(26005)(1076003)(2906002)(66476007)(52116002)(16526019)(8936002)(478600001)(86362001)(6916009)(316002)(6486002)(8676002)(186003)(4326008)(44832011)(36756003)(6666004)(956004)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 lN92jQo/vKJYvsTLcnY0td8uiA0KAGpa/4fH6m9Fgsu4VH7tZSx0T+e/ZZcWE0e6p0o4zDPgmL9yUxBl9CPMaXRK6rGPSC1PV6TKjnCFHRmlMCLrzM4iEUBalHhQ3/g/Gu0NT55Wb+z+bjOnckOkiv18PRWcLrIZs19Qm6qRGFyxMNz+swhyBdv4Ibhaqmp9dtgYfd3rBDBypm1eMe2f8xvoB3ne1Z0kP2GvC3fBjawDiJeaV0E6X6boETT4rSjlxYC3ldhnYn914D8B937KTQ/yMivoMZGcMeGd99iE6nvYiLAYHkuavleRTcYjefNeNeEMybNEljje+L//mkHyMYNzbTZLEzpbowE5ZDTw1qJovtTin5f22S/CZUqI4U9aSUY6zBCk/X3LpxAlftpihISeNWdF5yZmEIONNkuVRh8fIdMICwx0Sy1+fqEuMGbuRB+2F4Ra9pLgH1M1e+JTzGGBq3gCmXsGzHS7cpZ0SDEFPTL/qNPDoTv30kwWvSJy2UbRs2DT7tm/3opFzTNItS/Q6XmudzvMLvR3trWAs2jU5oVjyLWsHt4VE4JIazkcgBryJozEXW0zQeoTtJ40CKqcFiS1DuHNrrUqvoN/2Fu8lWWsq7VqLiYcpMQWFpMskzJrxN4wo7HRp2piUBtUOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1672
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5159c47f-9a51-485f-490a-08d853f2be65
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sAKNN3UwQvecChnmd0eA2GtfGTcRa4zzW80V5cUxofj4dx2E7ipjMvucVnoyY4SyNNFjJBWnZMrGLVIuja4VPOC1uWenqGqMI2KvtTf6+HQdAR05Eu4u6z3pdznrO8BHeKAO8AcPxG/sAh3SLIYJM3TRjqJj/W/cowbZi3T9p6fhTqV+cC50J2R9r+KErWP3pv8v9A1jTFRYAVRetrrrrrTEN4X90j2CRT8bTYB6lVx/Q44WPXEMyBTw7+JYhdm/pKOJ2FwXmF2X/rkJplmGN/VlZM1nXNjI/vCmAoTcpxXbmE4Yq7AZD9jwO8NkDdHSdd4fv+8D3HjjO0eM2AGj6+iwifafpclkB330gCNa5thgqqi5bFpfgyfZXZvj6qTDL06hAt/032roMJZkHK7nUA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(70206006)(956004)(44832011)(83380400001)(8936002)(86362001)(5660300002)(36756003)(2906002)(6666004)(4326008)(47076004)(26005)(7696005)(82310400003)(1076003)(316002)(186003)(6916009)(16526019)(6486002)(70586007)(2616005)(478600001)(81166007)(8676002)(356005)(336012)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 12:28:59.6121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a31dbb69-93a8-4f6d-1964-08d853f2c345
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4580
Content-Type: text/plain

The keys are only generated if they dont exist. The key
generation can be turned off by setting FIT_GENERATE_KEYS to "0".
The default key length for private keys is 2048 and the default
format for public key certificate is x.509.

Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 meta/classes/kernel-fitimage.bbclass | 44 ++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index fa4ea6feef..1fa8c8f05c 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -56,6 +56,22 @@ FIT_HASH_ALG ?= "sha256"
 # fitImage Signature Algo
 FIT_SIGN_ALG ?= "rsa2048"
 
+# Generate keys for signing fitImage
+FIT_GENERATE_KEYS ?= "${@bb.utils.contains('UBOOT_SIGN_ENABLE', '1', '1', '0', d)}"
+
+# Size of private key in number of bits
+FIT_SIGN_NUMBITS ?= "2048"
+
+# args to openssl genrsa (Default is just the public exponent)
+FIT_KEY_GENRSA_ARGS ?= "-F4"
+
+# args to openssl req (Default is -batch for non interactive mode and
+# -new for new certificate)
+FIT_KEY_REQ_ARGS ?= "-batch -new"
+
+# Standard format for public key certificate
+FIT_KEY_SIGN_PKCS ?= "-x509"
+
 #
 # Emit the fitImage ITS header
 #
@@ -522,6 +538,34 @@ do_assemble_fitimage_initramfs() {
 
 addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initramfs
 
+do_generate_rsa_keys() {
+	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
+		bbwarn "FIT_GENERATE_KEYS is set to 1 eventhough UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
+	fi
+
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
+
+		# Generate keys only if they don't already exist
+		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
+			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt]; then
+
+			# make directory if it does not already exist
+			mkdir -p "${UBOOT_SIGN_KEYDIR}"
+
+			echo "Generating RSA private key for signing fitImage"
+			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
+				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
+				"${FIT_SIGN_NUMBITS}"
+
+			echo "Generating certificate for signing fitImage"
+			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
+				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
+				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
+		fi
+	fi
+}
+
+addtask generate_rsa_keys before do_assemble_fitimage after do_compile
 
 kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy_append() {
-- 
2.17.1

