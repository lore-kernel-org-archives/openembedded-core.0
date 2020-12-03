Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web12.11860.1607009783633638979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZYaPRd9a;
 spf=pass (domain: arm.com, ip: 40.107.21.61, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW9pGbsEmtE2hy8vI9Fz5fz6uXDvuz+p5MZc4pDiVSE=;
 b=ZYaPRd9aKvC6UVwdwFqRSBCuaJQI2j0HlXnKdpQpx1TCp6VS9xc6Iis+jZLcLyFxbMFzf5hD9438yK2z9q9hmq+WietrjUGI3PHD3oBE6SFML9Rf+hrOnAfC8Txdu76abKt1hbc6dizVI9Aw3xMICiosVYBnHLzp4h0rsf2XtpI=
Received: from AM6P195CA0036.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::49)
 by AM5PR0801MB1636.eurprd08.prod.outlook.com (2603:10a6:203:3a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 3 Dec
 2020 15:36:20 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::68) by AM6P195CA0036.outlook.office365.com
 (2603:10a6:209:81::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 15:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 15:36:20 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71"); Thu, 03 Dec 2020 15:36:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ec9e6012b2b60853
X-CR-MTA-TID: 64aa7808
Received: from aa173922fc1f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1BA6023B-4E1E-4CDA-9F47-6DB07FAC959E.1;
	Thu, 03 Dec 2020 15:35:56 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa173922fc1f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Dec 2020 15:35:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgTdMeGzaAVNl/irFIfBG7M4YggAZDXs0YY/rlffUk8CCXb3xqP4ckHVd+J/oB4PF74ZEwkBF0fDmYkXAMw4qUfUyViL3p2I6gido98FhUO9gNShQrWA1yjKVPL6exXA3xlTN3UPpFggqXtIi2sbsRyJCSHjM92ImbjVtHyJm9//yGNhcYl0ENVjeV1Ba4t3G3DC4gfZd6qHaaKFOQJilUu4MHKZdmdDQkTOrLQmwgpoB0hsTz/8hJfYW4D32YajwYMVhBKevBshXigWSsH9PloGKZVR8RVb71EOVhYPRUeIgHfwUDBd8HE/FM081tfGTCdJ0r70Oi7/VXH9/Dsw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW9pGbsEmtE2hy8vI9Fz5fz6uXDvuz+p5MZc4pDiVSE=;
 b=ZDCu8BUHGJMaSCOfnXiPqjn6qCBiEXrTZYYRTw+pcQQgwcpFkl9yKOnpC2PGKj2xfza1VurAflfk4YFKqR3NK72dubttPneEnnqA91HlUHL3IsB8UYxC1HQK+hgxnXU3qxzbK3dwBQabnGb77xRJ90Jd9Le0O7bnb6l56urQk5lQqYmVEWm+LgYG+V2VdW0K3QDCVpipGFF/tXwNWTLFU68dJrlBg7JZnQEtel0GhC6C+JKMhAACFa88rS91DW8sZe08ubreigkTrtWT/gqhc3ssIJDniThlMi8Lowy2ea1xDCUbVy2fi5/sp3cj9oVmiIXMH6FQmHhfOjjcy/inkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW9pGbsEmtE2hy8vI9Fz5fz6uXDvuz+p5MZc4pDiVSE=;
 b=ZYaPRd9aKvC6UVwdwFqRSBCuaJQI2j0HlXnKdpQpx1TCp6VS9xc6Iis+jZLcLyFxbMFzf5hD9438yK2z9q9hmq+WietrjUGI3PHD3oBE6SFML9Rf+hrOnAfC8Txdu76abKt1hbc6dizVI9Aw3xMICiosVYBnHLzp4h0rsf2XtpI=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4660.eurprd08.prod.outlook.com (2603:10a6:20b:c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Thu, 3 Dec
 2020 15:35:54 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3611.031; Thu, 3 Dec 2020
 15:35:54 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] wic: Introduce empty plugin to create unformatted empty partitions
Date: Thu,  3 Dec 2020 15:35:46 +0000
Message-Id: <cbb0c77415bba971194ff9c18577646d12a66250.1607009672.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LNXP265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::13) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LNXP265CA0025.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 15:35:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 60f8b5fe-f2a5-4ffc-aa9b-08d897a12ed9
X-MS-TrafficTypeDiagnostic: AM6PR08MB4660:|AM5PR0801MB1636:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB1636B1C724E954BF1A653FB092F20@AM5PR0801MB1636.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gIbW85YaxNETEN1WZcEcQiliA8SF593MAG2qrsnFTxb6GNCg9BvN+FaDN/+3efBwj0oifzKygWXOz9zaOvVdagozHBreOcCy48lF69s3e5YhpBeN/2S2iWUSZF61GlwU7QekkjHdkUMXpVowIl8GZzhHOSGMvmYLZYhnrivCgxa9J52DZWFeTmaFJ2BqZ9hBqmP1tFVk563gUJzVxZcG6MGUCr9Vd1lFR078B3P1we5xT2WtvIC2ZR5cbBn/IkUpS8VkZ4J7D72LQPfS99eRaSvtF3MzdUL5IDHxP0Nexn+ZLxBdnWlKeJgJeDG6V17cPIsTsd3oMR0FGUXDAJTAiA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(6916009)(478600001)(86362001)(5660300002)(4326008)(7696005)(52116002)(8676002)(2616005)(956004)(6486002)(8936002)(26005)(44832011)(16526019)(186003)(316002)(2906002)(36756003)(66476007)(66946007)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?/eVcOKjaWxzHEbCBn/29EMB7Oe5s5PbWYJyds8v8ZfbOWBt4Jc33Y0UkjldM?=
 =?us-ascii?Q?7A7Ti4gkrTOfcCtDAUMm7qiivJoFP70JD90qD9v3YqWxpfUNMfwkg5oGLQnV?=
 =?us-ascii?Q?c4WRHthpcNiPLzoQmabz4DbfKwg7KLjJs3Q+tTvXD53TIE9XfRZzZekIl46j?=
 =?us-ascii?Q?WT/wAXCDDnybPqYuSu3Z7XpJVH5rxHQ7wEx2Hw3xseVTEam2rsfMRiz59aEk?=
 =?us-ascii?Q?T907bDfoppXAwCKMD0r2Crt6Z8eVEuDvhsrdAhBqtqTzhOAfWmke+KgR7x/s?=
 =?us-ascii?Q?sO9DXb4tSrlo0Mjzv3U88mjBXzOnm5tibuyXFccxODdKWSndQkuVd9scwqeD?=
 =?us-ascii?Q?a+P7L30oWS6yT61+FPBWxrylbNuRjnyCqAdA2fdkyS3D5KOyG3w4wQG2maVF?=
 =?us-ascii?Q?Tnwd/7J7oBfs12ctTcN0IupYZalmVPZ7+7V1L6bCoyDkQzP+N/4JBhW21+v5?=
 =?us-ascii?Q?oIz6BxiMxpB0EPfRSbT+mVzGK52HhOqZ9pKlvbxBjVTeoMXlT+BwS1ozZffJ?=
 =?us-ascii?Q?yGi+F8EX/OkAk6n1Q9qUllR5eP5uCGQmHYMUwyzzjqz25ILvDPUGy0qJOShS?=
 =?us-ascii?Q?VW2lVttM8tHgj0Q1zjEOSx5D3Dbcw5NubJ5hYKiHqzs6XUGOIRIHsAGmeQaU?=
 =?us-ascii?Q?XF3PAzGJIwU51a22++1sE62vsCKtTwsiHufVMs1gZ9YN1hudVP43Kt/nkR/C?=
 =?us-ascii?Q?/QQFlL6CHhjXhsJxq8klxOce4w0PXOte4wT0+ON/XaeRKykXER5zwQm2UGu3?=
 =?us-ascii?Q?VWKyJbKVcM0pP1XXsBrj37oxmi7JgknNtHtC0cyjUkOugatsuSiDPXx/tn7J?=
 =?us-ascii?Q?mngC6szJMZAsWvwJmj/OqTnrNs14o+zcSkqtmHMZpfSeUDAts+gbHVy7U979?=
 =?us-ascii?Q?cN6iwm2nelXG/g/3sUhQfMf9IB2bcdXi2Gc3wUI61Ni5ofmmxcuue0AHssbY?=
 =?us-ascii?Q?CzzjcQ0LDSbDnZJ9dlfeDZfMAyfCGRtXyA5DdpP81MmrXanqDPkU1jBZZBNK?=
 =?us-ascii?Q?DBOv?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4660
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	13c6c8e1-74c2-4d72-c304-08d897a11f50
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q7JeGsia+JlNriZPOi87oKaG0Z3wGlRrsDTf6yCfwWiVuwSEf7ya7kBycPri9pDjZT/7xcDpSDwaTInwu9L8cd8PQNuNk3NpMLUtyDIdTrE+AUg7irjoOazAaWPl2JARyJ9B9kjWzK5GOweS5p01F/hMZ2KG4VxETjjVzPK15S8mkvrS2Y69cK4hV/PXzZ8SNadNgizilIT6JIouSbGrnbDkK86NKB1Hbv1j9lZJToGKdbj0jyYCu3kaSd7/wQIk4LRGb37wTcmaQ/McWmq6SAnPxVNI0McaohLZhdnJ/3G/+M/+FwHWs0+0Qeuv/8hvlAwwiyejJMTxGZfOcJI0YRWg88M7cg9VUjHu+enLJXtBAqWhWOhdLWs+sGAG9quJLO7vBdjqCDcv+rFuC2oE5g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(44832011)(7696005)(6666004)(2906002)(356005)(26005)(81166007)(336012)(2616005)(82740400003)(956004)(186003)(16526019)(47076004)(86362001)(70586007)(6916009)(82310400003)(4326008)(36756003)(36906005)(316002)(8936002)(5660300002)(6486002)(8676002)(70206006)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 15:36:20.3852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f8b5fe-f2a5-4ffc-aa9b-08d897a12ed9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1636
Content-Type: text/plain

The empty wic plugin is used to create unformatted empty partitions for wic
images.

To use it you must pass "empty" as argument for the "--source" parameter in
the wks file. For example:
    part foo --source empty --ondisk sda --size="1024" --align 1024

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 scripts/lib/wic/plugins/source/empty.py | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/empty.py

diff --git a/scripts/lib/wic/plugins/source/empty.py b/scripts/lib/wic/plugins/source/empty.py
new file mode 100644
index 0000000000..041617d648
--- /dev/null
+++ b/scripts/lib/wic/plugins/source/empty.py
@@ -0,0 +1,32 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+# The empty wic plugin is used to create unformatted empty partitions for wic
+# images.
+# To use it you must pass "empty" as argument for the "--source" parameter in
+# the wks file. For example:
+# part foo --source empty --ondisk sda --size="1024" --align 1024
+
+import logging
+
+from wic.pluginbase import SourcePlugin
+
+logger = logging.getLogger('wic')
+
+class EmptyPartitionPlugin(SourcePlugin):
+    """
+    Populate unformatted empty partition.
+    """
+
+    name = 'empty'
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        """
+        return
-- 
2.17.1

