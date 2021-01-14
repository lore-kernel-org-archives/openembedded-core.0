Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.64])
 by mx.groups.io with SMTP id smtpd.web12.5018.1610611588744448111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 00:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dJgHO9uz;
 spf=pass (domain: arm.com, ip: 40.107.20.64, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRh0jI1MO0MXOT586XM+uAZkNm6LX3dDY2WXLvBM53g=;
 b=dJgHO9uzoRJ0dYzafvuxqeBfclr25YBnpUNOD7NzxdT+gMMr8/qgbaB+cuTr8dAzKdnvwetPBUpFFYk7yf56KXBznNE2zqS96ZyfiObZerEyN+75cEPd7WEsx4mmLqS/UPRnDAQzrUu7d6+O3+cmfdmzmT/vceQNUs8aLKsc3C8=
Received: from AM6P194CA0087.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::28)
 by AM6PR08MB4628.eurprd08.prod.outlook.com (2603:10a6:20b:c6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 08:06:26 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::45) by AM6P194CA0087.outlook.office365.com
 (2603:10a6:209:8f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Thu, 14 Jan 2021 08:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 14 Jan 2021 08:06:25 +0000
Received: ("Tessian outbound 587c3d093005:v71"); Thu, 14 Jan 2021 08:06:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f42f8bbbacb3ff6
X-CR-MTA-TID: 64aa7808
Received: from 229a7f896a11.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 90880DE3-8F41-4FCC-9690-DB05883BECDC.1;
	Thu, 14 Jan 2021 08:06:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 229a7f896a11.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Jan 2021 08:06:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LT/5ZuRdUucozcx1BMr1ThTPeexANums+0TLekg8O4aL0avI4nzuTNm/8T/fSoo73lBm2aqYe8lt1nGvMAbVPfuMklymg52SyAslED/lMOdW5mHPvudJXAWRKtCW12Te/5/kEcTzlFe+gEITFJOlbb1W7mozgmxHIzPamJjchqlwA36nELEKODedId+0ugaRJlV4tA8TKmxyJreRfUqvCcngFu6QzE1fTdgnuDaldRHnB2PZVSqGGK3OrxxDkPAvT9iBJdI1zuPANJ/vQylpFDjIcoj+fDw6YAftPU4L+da8wfPk64hnbiDB9prohe1t19wDIjHatmittinugUuSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRh0jI1MO0MXOT586XM+uAZkNm6LX3dDY2WXLvBM53g=;
 b=gUyEl1M2Yx2vTuwk2PBh68Vs/vNjJO8GzUqnZVn6bcV0PKqQAWRDKZWPQ7kXV6gdwmwFe9UMTfGylHai2izTz0OnC8SMpJCbB8f+ErMspzOQMr8zmLw4LWRrCYc3gTVQrRwY6Bw6rmSGqQnFRhJ0xvpFaKahqTPe8b2ft+UrZDr5y7P5oBiCDZVXKLWC6nLRD2rLZKTdQt60XTF1wTiZUorVDAvqf3BPsiO3HfK8WKCUwf5m2ZNoy/feVon0V0hSlrss2+fwtqE8xV5jBayX1sHRS+wrIhp8wXVZzc6sNFLhaM2/REuNBpo0Tqgxpfbh9qc+Rca3Kx68P0uMI9c30w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRh0jI1MO0MXOT586XM+uAZkNm6LX3dDY2WXLvBM53g=;
 b=dJgHO9uzoRJ0dYzafvuxqeBfclr25YBnpUNOD7NzxdT+gMMr8/qgbaB+cuTr8dAzKdnvwetPBUpFFYk7yf56KXBznNE2zqS96ZyfiObZerEyN+75cEPd7WEsx4mmLqS/UPRnDAQzrUu7d6+O3+cmfdmzmT/vceQNUs8aLKsc3C8=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4803.eurprd08.prod.outlook.com (2603:10a6:20b:c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 08:06:17 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 08:06:17 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 1/2] classes: Introduce intermediate-deploy.bbclass
Date: Thu, 14 Jan 2021 08:06:05 +0000
Message-Id: <830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LNXP265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::23) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.51) by LNXP265CA0035.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 08:06:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cbe09348-9c40-47be-7c8d-08d8b86349f6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4803:|AM6PR08MB4628:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB46282E84E203C7DE1A03FFC592A80@AM6PR08MB4628.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dSHSKa7s7qCdvWarCjC0gnaxsCFUPEqqbqDKdTWRxZIUV+nJ2EDAHRHcb5wc8tHOU3gz6JOaezyOSFgt6WfE52gpxtkeif8VD1s4goEV7tTN/wVZrSWgqoD5c631eDoVEtKw4fdC+9Fm3n5u47WD+KLApugVMROcIRb/4ytrVkqklmR3mRUxiotxL+IPEdnGh7u/Bw3zZMP3hsql3TNK9kt8Q/OfR/HCGhBQpWHkSkEqEON/yekVW7PN2ZZQ8/o/+LmJDZ4u4VE8hd+Wu25cQr/PiXV3waQWYd0eB4Ifau6sax1t/cdWaqKWQ9oOCFE8SbEy6t1+pH+vm7NPdAoKhakkzLM6HYYluUrBev5W6uVUvj54oPRAC136fY9cw1wc
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(39850400004)(346002)(2906002)(6486002)(83380400001)(6916009)(26005)(316002)(8676002)(86362001)(16526019)(4326008)(44832011)(66476007)(66556008)(6666004)(66946007)(36756003)(52116002)(8936002)(956004)(5660300002)(2616005)(186003)(7696005)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?cxjUjNpBVe/9qbWbdyTyVn0soQMGZ/E6uu2yCh80El0jl7OBQNk/CWoWDTFT?=
 =?us-ascii?Q?UnUY5nhTKlyCBn8vBLjxV+DpS2Jy91zHCRRPtchAOclpivth7Ezt+z2eChc1?=
 =?us-ascii?Q?L1c1jIbDkXCM5LaZGmxdLmBPHKSYl6YUxpi4SMBU1dbFtjRCFoxb20IjlstP?=
 =?us-ascii?Q?bsDIyDLV6xaLQrT/SjjFVRFfPh+i0RlP7SC1l4Xskhgub20lFYl3+t3A2Xec?=
 =?us-ascii?Q?qn17RIzwmJOyvlHWFT//0kxbwYY+wkbgRqzuzY3Xe6oZdsiePqxvq/f93x6j?=
 =?us-ascii?Q?+teGsJLJeyeKMWE7jLgTN/GwfTbaNOtG2oKg7qVd7a7BnBQcHgRXGQrZ7uqS?=
 =?us-ascii?Q?acUGi6TF6r1i68/yoOGIcA0arIbOhW9PJowGtTHw7wtMCw0uYSbJS9ALv5uJ?=
 =?us-ascii?Q?f8EoOqHx+IKRDR8k3OAUHdIhLdc9l8AuSf3i7QttK7eyRn94+0zxZMMFPOT/?=
 =?us-ascii?Q?yukqAYzfNvsQ25u9/a/4J8NZYXmTOhPR6lBpQjkg0SzoFqTIJmGShk5/n7r0?=
 =?us-ascii?Q?AluV0kwEqy6z/1ZYSYBWJlD5f8DxesLE5SZeYjwpFvXYdhaKz0yDuYXJMdAi?=
 =?us-ascii?Q?sUJGhAjkJ8lbD9sWLhltbM0uMxFOy1xuhXLG8qboQ7vweF6NY/B8Mo81ioDi?=
 =?us-ascii?Q?SBhuV8uCSEeZwZCL4cDymPFUkOzQwQ4sl3+8SJ5FN06eZrG7b3wouDJhggA2?=
 =?us-ascii?Q?6rCUDawJxAVIbN71s3Rsxn8EGvxED8ELscI5kwBgTgy7eqRgi6BuMg6nNrSZ?=
 =?us-ascii?Q?tfJ8Yjp6WhLADGXuRoIzFbt/znOJnMPQXfRJJG5OLklCl1la0comi1mlnSA9?=
 =?us-ascii?Q?mTLSCJJJ7n8FHDIu+bfjkW7MuavisSJ9NmsQbDJymjfnulKe4aDrgKm1/PcP?=
 =?us-ascii?Q?mPvnyPCm+rUuZQ76hRLqvEzawDpZKOOO04MJSyXm4tyDzyMcIABT11cvDla/?=
 =?us-ascii?Q?dvCpOGkrDnsqMjOA9TmL2EBjQOdzKaYPIE9oB+tTVBR1ahXW9XNU97GRt78t?=
 =?us-ascii?Q?bT/h?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4803
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d8ca75f4-8e90-4ad9-dd13-08d8b8634573
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ca+Ryz7hw5azD5DAlO4cQZ86unkz19r4Y2AlwTW9K47IbUyKnIiZZdhoDVsFnUeN/TuwWu1dXAY0mnh+OmPCLgiNnS5Iv38ePaJfdoBKh1wEeofHcHRJ9gVi7YGoQdm5143Z6HL+l/BSRKtm5JBs9Ki01Z+L0NakG74HXjrE67VbFV4r9G5/UQmE42O8e4bn/45Va2ntzgFLPAK2R2c7Cop0vcQ9gF+ceYEX79N85xZSZUgFNdQQrgQAv8QONwVTuIOqeaMrrYYKrc47o4KhI4NdzPcAoIqSUsB7EhmSzXXP1y+I0wmWynRtuDC9CVD1SUlTCZH/Wdo/8otbwWNusLttsGy6XgNpUsamSwODStcUNsnwhT7AvmfEE897MsEnEoSPiXgL1iyFqSpIX/Ozz1DxxZeoEHBT8ApkFZtzvy7B8++bR44jlXvbt9Joi9pLfkKp3zwRfMC6YitwCWqb6xdFu3jmwWuc0GLhYmRGHMGRw0C51fcYue/lD6HzRaDb
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(46966006)(6486002)(7696005)(70586007)(2616005)(8676002)(83380400001)(86362001)(316002)(26005)(186003)(356005)(5660300002)(70206006)(8936002)(336012)(36756003)(6916009)(16526019)(44832011)(34020700004)(82310400003)(82740400003)(956004)(81166007)(47076005)(6666004)(478600001)(4326008)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 08:06:25.3709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe09348-9c40-47be-7c8d-08d8b86349f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4628
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The intermediate-deploy class is to be inherited by recipes that
install intermediate artifacts which are not present in the filesystem
to be further processed by other recipes.

The INTERMEDIATE_DEPLOY_DIRS variable is a space separated list of dirnames
from ${D} which include the intermediate artifacts.

Change-Id: I314987587c1cf0e4cdb28fbf11463f1feb37504b
---
 meta/classes/intermediate-deploy.bbclass | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/classes/intermediate-deploy.bbclass

diff --git a/meta/classes/intermediate-deploy.bbclass b/meta/classes/interm=
ediate-deploy.bbclass
new file mode 100644
index 0000000000..4b53ffbf0f
--- /dev/null
+++ b/meta/classes/intermediate-deploy.bbclass
@@ -0,0 +1,25 @@
+# This class is to be inherited by recipes that install intermediate artif=
acts
+# which are not present in the filesystem to be further processed by other
+# recipes
+
+# Space separated list of dirnames from ${D}
+INTERMEDIATE_DEPLOY_DIRS ?=3D ""
+do_populate_sysroot[vardeps] +=3D "${INTERMEDIATE_DEPLOY_DIRS}"
+
+SYSROOT_PREPROCESS_FUNCS +=3D "copy_to_intermediate_deploy_sysroot"
+
+copy_to_intermediate_deploy_sysroot() {
+    if [ -n "${INTERMEDIATE_DEPLOY_DIRS}" ]; then
+        dest=3D"${SYSROOT_DESTDIR}/intermediate-deploy"
+        mkdir -p "$dest"
+
+        for dir in ${INTERMEDIATE_DEPLOY_DIRS}; do
+            dir=3D"${dir%/}"
+            dir=3D"${dir#/}"
+            src=3D"${D}/${dir}"
+            if [ -d "$src" ]; then
+                cp -a "$src" "$dest"
+            fi
+        done
+    fi
+}
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
