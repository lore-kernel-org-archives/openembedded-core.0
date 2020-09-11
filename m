Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.77])
 by mx.groups.io with SMTP id smtpd.web11.5994.1599823835200451305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 04:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YRXVIWqq;
 spf=pass (domain: arm.com, ip: 40.107.22.77, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoCn7kNMuEUyyK9Ck452IGInOCvFADNtqq3U+k4UAiw=;
 b=YRXVIWqqgP+YSIlS4rN/ekmG+Oc3hoAURiVIRFzUnpn/KEVKmcDUjojM32b7jfHe6vp+10kqJTt5ESvEYZzYyp7EBT9huZQ+JUMFPpMX/aMXs+K0kw7cNg4FAHtnNrACgdtXnTrEF/X/DrP8odCDZcqpY9ntYiKavVXTxBXUYOs=
Received: from AM6P191CA0089.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::30)
 by AM6PR08MB3557.eurprd08.prod.outlook.com (2603:10a6:20b:4f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 11:30:32 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::a1) by AM6P191CA0089.outlook.office365.com
 (2603:10a6:209:8a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Fri, 11 Sep 2020 11:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 11:30:32 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Fri, 11 Sep 2020 11:30:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 206b3cbcbfc29fd9
X-CR-MTA-TID: 64aa7808
Received: from 4db6e8855b13.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81C82AEF-AA80-4AF9-B659-69A42C7408EB.1;
	Fri, 11 Sep 2020 11:30:32 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4db6e8855b13.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 11 Sep 2020 11:30:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJ7xYZ1G0y18LnB93ddrtCILn+McJXiRSmE78q3SnIPL4CRjHva+Pz5k3zDjoWK0Bs3dWNkt6J2yM2hUxdCMurL4U5db0ndoqcOw5vNEa+/Xu8p0ZtnhR1ADrZsygnHHaG8KVamACgqHWrmzBhS8iqDP3OFCwgllAXx+uWQyBZGtipBy+7u3CQWy8kcpLV/v2/9ea1ccLXkzgm5zm+Mja7fGR6w9vbIqWgQmMkZTeYQxXFiRJOZ5zCFJ0kRshveh+YctW/9DcwfIscXtlCrG2yJIjBB6VZZcQ4pxkOMnrBJlzJpvpO73AcEImWa4/U4E4vDMgfLMBhLOZadEFa6+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoCn7kNMuEUyyK9Ck452IGInOCvFADNtqq3U+k4UAiw=;
 b=G8bWo32MoUm8mN10crTAgfteP1ZVX+/s+hYsXXG60pN6RtHJrTAViQP+ExLU8BG/WUm7s8qYTnP6/6vCetto/x74+1+iH0igW4LApI/9blS/OwDHSf7EJSYsD+UQaZn4TJqYtsR1RdqztchSg6T/zNyD4qmsnFNhzV2JUmZl0mxXfvy06xrmbFlC+/zBgC8JigPdK6zR0+XXh44qOk2MkYEdu1TO6jhhJOTbXyBpyVp/vTuQEfG7quyBT+gpXT5dbVkNDtpB6ifw1sYyTzGRQqajJTSwswPX8t8oHEalCPBFIul+dB8TEtIrkM8MpGBCx2ITjrtx5gLTweNoHr154Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoCn7kNMuEUyyK9Ck452IGInOCvFADNtqq3U+k4UAiw=;
 b=YRXVIWqqgP+YSIlS4rN/ekmG+Oc3hoAURiVIRFzUnpn/KEVKmcDUjojM32b7jfHe6vp+10kqJTt5ESvEYZzYyp7EBT9huZQ+JUMFPpMX/aMXs+K0kw7cNg4FAHtnNrACgdtXnTrEF/X/DrP8odCDZcqpY9ntYiKavVXTxBXUYOs=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB2113.eurprd08.prod.outlook.com (2603:10a6:203:2f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Fri, 11 Sep
 2020 11:30:30 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3348.019; Fri, 11 Sep 2020
 11:30:30 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] license_image.bbclass: Fix symlink to the image license manifest dir creation
Date: Fri, 11 Sep 2020 12:30:27 +0100
Message-Id: <763948bccdf80658ca87a06bfdca42733a0e4cf1.1599823698.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LNXP265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::29) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LNXP265CA0089.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 11:30:29 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 353c4c74-bf86-4e4c-e708-08d8564617fd
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2113:|AM6PR08MB3557:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB355793D51208F35122C7E9C592240@AM6PR08MB3557.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TUWZaqKVDzOV5Pvg1Gv+iOlCvzwZYa5u3jc9A/JqFpQOVGRMJimx+g9VeKL7CZ1FTydNb5XleZJ851f2SZs3JULF3Ur2c44etUo6NS6KDu3F5OL9jikxO3gKnld5SwRkOgsNPLPNmOTb6ePfnCZXAmlE9z7zvXKN7aSLbaGyvvGVi4kEMbMfqd0RqsSPVTFOiBeFXJLfyKC+Z0LMB6m10mC67wUgYTU4OYSvTMp2JKi2lt0V4+b2LrNQq6f57bd/e2A7dEKiIUDH4WDbt1R68s1mjjOcUMSgCJZNx031DojkkC8c8FTDVXRh2Tpf7r1t8iaUDBQADWIcxfFKi2gsTQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(26005)(186003)(16526019)(7696005)(52116002)(5660300002)(478600001)(4326008)(86362001)(2906002)(6486002)(6916009)(36756003)(66556008)(66476007)(8676002)(66946007)(8936002)(956004)(44832011)(2616005)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 HrwKM+Vs9O1iFwZFBUxxaeO9G+IPZFxXTve1wFDbvEyWRHxQYTPehUTs+57h6/UyoWA2aKw2lxuDrwRgO/7oq8tdrSXwcgOZDyJjQ/UiySKp7Krx2BFasEGjjD1ej8960XtIqT5qU270au1C/dj2zVlqsCDB9HFhkZAAi0e654azrLVpsq9nq/BsRIWFhNxjNeV5LYmlVtDYf7Zv0axtB/zqH6HjkWgBCteQ6QfnZ6Rsiu/sXV/rPljCmW1afXnsasZxRq/u7mnjlzWZAhkcDG+WuY0NVZStYp/9fCpbXl14N5oH8738gWCL7HPzIho3hKjU+tFoio7htNVn4yHDji8rxPyRyf8K8czB8TZdkYnofzXtjyhGd+XKH//GPRKs7JJ451YSJKtrSjje2UlHT6Dxw81k5TA2fVry/JSZhR1jLUrMbvbOQzBw5SIm7NKnHY+4zVcAGILze198LLfDBxdsWXjGoRIAewfB8pbQ8EfCM5S85QSoaDJP1755DxaywSZJPEu1tU6kCsnfdYVqHpjT0QUuIkeaGlNLSrUlZ9DW+4M1mBnDaf7sjlpqG7HggLoOYxGSuuI0z7fMBSSwk251vnJcsFACT/NGL3dVvbwmJo9KKM9EnEZbZqQtXytjhkRKsVMEvbN+pdBiy3lqTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2113
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f4806e68-e94d-49f3-deae-08d8564616a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vNGaFuWkR1Z5SdZUqFvtd2xLPzdnmkUzdEwj4SLpltjL5SgDXOOhxOp/TCQi/H5+HsY3uvkPnPtH3G6CFPsILoqfOCgSrJ6nQLf20KKso2dhLuxCGlWYdTQSwW6yDLQakrsD7H4tJqbCgSM3d0E4oCgSeShsE/GDsO2y6e9eO93+d6C2vOObqmW+Bps5hUKB52qwUUKpPYjI64CAbJL2pau0D0Ae4o5pviJF0qxA6FAg/qV8E1cZ5K5Qs1tpawp9D4qxegGj/hFC+5D3iyniyV3gQODqy851UQoZlkFuxZuY/msnIIJCxrIZeUnx2rb7ugguDlDwPfUwfbJPg0IQXkOU7MFtFuHMXiFyzgbLJkQQxorduhGwN0aoii5eHsnSyfRYHvif2RmTxItHwykBqQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(16526019)(47076004)(70206006)(81166007)(356005)(336012)(36906005)(70586007)(6486002)(36756003)(8676002)(316002)(186003)(83380400001)(26005)(5660300002)(2906002)(8936002)(86362001)(956004)(478600001)(82310400003)(4326008)(6916009)(82740400003)(2616005)(44832011)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 11:30:32.2530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 353c4c74-bf86-4e4c-e708-08d8564617fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3557
Content-Type: text/plain

If IMAGE_LINK_NAME is empty don't try to create the symlink.

[YOCTO #14042]

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta/classes/license_image.bbclass | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 682d462..702e9f9 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -200,14 +200,16 @@ def license_deployed_manifest(d):
     image_license_manifest = os.path.join(lic_manifest_dir, 'image_license.manifest')
     write_license_files(d, image_license_manifest, man_dic, rootfs=False)
 
-    lic_manifest_symlink_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
-                                    d.getVar('IMAGE_LINK_NAME'))
-    # remove old symlink
-    if os.path.islink(lic_manifest_symlink_dir):
-        os.unlink(lic_manifest_symlink_dir)
-
-    # create the image dir symlink
-    os.symlink(lic_manifest_dir, lic_manifest_symlink_dir)
+    link_name = d.getVar('IMAGE_LINK_NAME')
+    if link_name:
+        lic_manifest_symlink_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                                    link_name)
+        # remove old symlink
+        if os.path.islink(lic_manifest_symlink_dir):
+            os.unlink(lic_manifest_symlink_dir)
+
+        # create the image dir symlink
+        os.symlink(lic_manifest_dir, lic_manifest_symlink_dir)
 
 def get_deployed_dependencies(d):
     """
-- 
2.7.4

