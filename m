Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.85])
 by mx.groups.io with SMTP id smtpd.web10.12363.1601462931946742644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 03:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hW6g+wUR;
 spf=pass (domain: arm.com, ip: 40.107.22.85, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKWIa4c9Qn6cBap8G5MPIYL+b6TaxrLn9PtVaV9LdDo=;
 b=hW6g+wURwA4bdyoPp4/j4n9gKmx1fgJQyUEnXxwVlmEnWIGE38DT8qfmA6cRrXBRZ70ROFbneBSZJcl+oTQvmfp9JQZNgMZlBNaXWFjpQjMGwlWNOJ1r3wCW9eW7yBkwsImwHT+yV1UnWplfPrrN1wO+TkX20ACXQ0/WHT5FzmE=
Received: from DB8PR06CA0046.eurprd06.prod.outlook.com (2603:10a6:10:120::20)
 by VI1PR08MB4029.eurprd08.prod.outlook.com (2603:10a6:803:ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Wed, 30 Sep
 2020 10:48:46 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::42) by DB8PR06CA0046.outlook.office365.com
 (2603:10a6:10:120::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Wed, 30 Sep 2020 10:48:46 +0000
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
 15.20.3433.34 via Frontend Transport; Wed, 30 Sep 2020 10:48:45 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Wed, 30 Sep 2020 10:48:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1f7a09a70f9a3d2
X-CR-MTA-TID: 64aa7808
Received: from 2853658ba50d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 786EAC05-9B9C-4E24-9230-BF666AF9291C.1;
	Wed, 30 Sep 2020 10:48:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2853658ba50d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Sep 2020 10:48:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y761tdNQNEKG97PWfSlTGrUFr3W0QQRiAnhwtgMJ1ZrG3MzGmt9UE+3l+AoAm08HmOuXjv19refmqXwR6pij/k/dlH4qyCSFdPEeZURTVa5TLFjc0AUHX6MbOq2YgBjJCRuSTY2LIdw4fOoBOKNs3AMFB9X3+qc3kIOe7ShD54Fvx08LgoH6uFGK/BotiA4hhx/XjSXavO6afr2q6wkSyoK9DRnK6YLcpBH+Yy2XmblGCN3n0uiwXiuBnzs9FYUsaIIiLoPJnzE0vs4kBmK1ZtwLWQI8mc9tZg7g7dfdYIeQMQTeguhezlONGYjqEdo8CA0RNkRAhWkRYbIuZcPIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKWIa4c9Qn6cBap8G5MPIYL+b6TaxrLn9PtVaV9LdDo=;
 b=QgZ4+ksgxeYT7+iTDP7h2sAY58+CDLL+AaknH3QPCk2P8Q1aOaZs+Ul38zt1QXeTI4Z6rqGK7ISYpLEXKvybv46RhA+xLGip4BVfIuSdPrn4a75Jy++Ph7lXmUeyC5dfcngEwQgSWdP/8WBNODHm5kk31HzfV7lHgFRFt33TDPP0qlt2tklx/eXtLcAAVk2b4gP+oErd8Cnce7UoGpQuoFUjfDuxxu9xZZE0pkEcalyXa6NEz1IkW4Mnb9m4SqZk67pt/N/WMDlITALwoaDtiG6JnP2GQ9uw84N7vbRfQgrj/naxM7O8edQdq5ockdfq9caro9AurnsKt1hyaW4meQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKWIa4c9Qn6cBap8G5MPIYL+b6TaxrLn9PtVaV9LdDo=;
 b=hW6g+wURwA4bdyoPp4/j4n9gKmx1fgJQyUEnXxwVlmEnWIGE38DT8qfmA6cRrXBRZ70ROFbneBSZJcl+oTQvmfp9JQZNgMZlBNaXWFjpQjMGwlWNOJ1r3wCW9eW7yBkwsImwHT+yV1UnWplfPrrN1wO+TkX20ACXQ0/WHT5FzmE=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com (2603:10a6:20b:de::11)
 by AM6PR08MB3064.eurprd08.prod.outlook.com (2603:10a6:209:48::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Wed, 30 Sep
 2020 10:48:09 +0000
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71]) by AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71%8]) with mapi id 15.20.3412.029; Wed, 30 Sep 2020
 10:48:09 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH v2] kernel-fitimage: generate openssl RSA keys for signing fitimage
Date: Wed, 30 Sep 2020 11:48:00 +0100
Message-Id: <20200930104800.27569-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::22) To AM7PR08MB5480.eurprd08.prod.outlook.com
 (2603:10a6:20b:de::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LNXP265CA0082.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend Transport; Wed, 30 Sep 2020 10:48:09 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07a06de5-3b2a-4b04-17a3-08d8652e67df
X-MS-TrafficTypeDiagnostic: AM6PR08MB3064:|VI1PR08MB4029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB40293F72F3949E4850AD5EFF92330@VI1PR08MB4029.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 i/wJYH8kMmzD3cqx/jjxOwODV6GLPjptAKBNtFmONrlO+nwHjrF5y8x4aUuMjQo8ItjOlp7RX4h0AGoywxiPkYZC+d1/B8X/9USQcjA6z4yA6w3DAOSMK9BCshr4y6hFLrj5zT6ZvPvppn81BCAm5IAPB1pgiz9TpiDUqu29krYcpd+PkQdS4OaXa59+07TOTH4MSu2/BnS5hCFPVv67oor+PXGAVM9OI42/nMc5NHgtZMR7I6t6e3k8lvVvbwmugXx3TlA0Yy6HrDgrKBuccf6gNopt6jOyYTwGccSZ9DapUgkvX1ZZo7djxa/ADmrHgcVZrONrG73vygNmd23tYdozfuk/jr447c94R6jzGRFZgv+RP44p0+ibcPGQGv1C
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5480.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(7696005)(316002)(36756003)(4326008)(186003)(6486002)(16526019)(6916009)(44832011)(66476007)(2616005)(66946007)(956004)(83380400001)(5660300002)(66556008)(8936002)(8676002)(478600001)(52116002)(2906002)(26005)(1076003)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 jvAQ4XVXJvyxhOMPUbuWlRDYSos4/PPhgYwk7zJSFEzPv8gdWNEa8WAmDByC+24X8+IM2n/qtn0PjrNGdFFBGd3yWSytiSslRZauF3uCNiit2DtxCkt3TlNhStZg3sAXnybBeCTVQWVXmmNQyuc0TDi4PG2sBZnHxWi3Mb7Y31nfoKR+bEHPyM0qgWxoF9ZgvpC0Ve59FQ8KUPaX/32at7/eRBGK2KYFz38NdVj8c0wvfPsQHE0bbhgTWObwoqkkM17NC4tA12jxphE+9B+cozeTwcBLSUzoWwvTzmPp+aIcf2uZtshcg/eAkJRZFnyivJB6wTmt28WSzs2+RFuaT8wYsZT1bLxuicW/4QiNHgxtTPKIlXf1se5B1bb5eHaQjvNNxX2e+pUr0+1Pm6Nv5RKFC3sFkoV/pvQRk54wdZROxMCz+8MpoYgMk2iZhibih1YsKwjLdgW0ya5hiw89JiegdE7vv/YOjSx822uFcxtCHDUSFy15OoMC+AV2kBf9gBSgBVbIO1T/SutKePUwa6hgS0qZ1TAy5UH6Rf/D7X5jLGd9jerL+UNFVtbKIQoc4OC69Or7j1VnlN6H+G1AV5/WyoQL7Z6K1qQnXAqPwmGvTxARljGRMX2PYvAFSgd9Ik11oWCKs2m1fLkcAshBdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3064
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	613fed59-67b7-4299-1f0f-08d8652e5222
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sEEZ7fCdQ67XNOBRmxmHwwhNXgqEPAyjDFfRA0mqxcvobqwDPd4e7PFi6RYX13KdQz5dxkPM5taa6wMtXbupoQ43iMfssJIy/vLCJPRz+Uqdh6GJ2VY6zxYIwUHB+X/j0gkbcYMs+RkthndOLc3nZWZfIWtw8buxRs2yEt91SjbF/0d1VpsrfWiJpYFxzgBBniI+ELGNIjslz6cloNKNf7mQhv5FOdYUqYogR1qLBgaeioy5inkL1knDMDT8JaK8A25WEsSJxI03bc1s/4YDcmapnBCksbjmfl0KwvjQb+jExLmEOTuD6KQ/R80X2wjaP3g6iNi4H7LoWDNeUu3O4+hDmD33aK3JgK+DTHXvtJaYpyHpVJjCjqO16VrLPJleRDkQTTH3+8jLfd3MhwEip5h4Gsz4evXMbcyy+QfFX8CZFdO9PbLGSxIAERNoxiMk
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966005)(7696005)(2906002)(316002)(36756003)(82740400003)(186003)(82310400003)(6486002)(16526019)(4326008)(336012)(6916009)(81166007)(2616005)(70586007)(83380400001)(5660300002)(70206006)(356005)(956004)(44832011)(47076004)(8936002)(8676002)(478600001)(26005)(1076003)(86362001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 10:48:45.8430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a06de5-3b2a-4b04-17a3-08d8652e67df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4029
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
index fa4ea6feef..bb2f3c4ccc 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -56,6 +56,22 @@ FIT_HASH_ALG ?= "sha256"
 # fitImage Signature Algo
 FIT_SIGN_ALG ?= "rsa2048"
 
+# Generate keys for signing fitImage
+FIT_GENERATE_KEYS ?= "0"
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

