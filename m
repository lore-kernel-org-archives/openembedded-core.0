Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web12.7280.1596033713543741091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 07:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GUO8bwaM;
 spf=pass (domain: arm.com, ip: 40.107.20.68, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcDerQBQomJcp4+8XXsEM+S+f1yokt8HteFUTPpqHKo=;
 b=GUO8bwaMebf0FnZKle8mAO6s5oox+WVlhf0engbY5bWRTZX+BXqL5jebu2PBDlZB3d+pdWJr8Eabs4c1rkzeBGzJH1vCRJmaTo2/RHTWJX2HgL6FPIcqc9u7c4Neh0o3SUO2rVBOYuK6GxnGNhPbsNLvCE/tY8lvtZM0WB9vb3Y=
Received: from AM7PR03CA0027.eurprd03.prod.outlook.com (2603:10a6:20b:130::37)
 by DB6PR08MB2887.eurprd08.prod.outlook.com (2603:10a6:6:1f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Wed, 29 Jul
 2020 14:41:51 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::32) by AM7PR03CA0027.outlook.office365.com
 (2603:10a6:20b:130::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Wed, 29 Jul 2020 14:41:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 14:41:50 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62"); Wed, 29 Jul 2020 14:41:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5c2971c7c2b48079
X-CR-MTA-TID: 64aa7808
Received: from 9289e5587e82.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A4FA533A-5F6B-4E75-8DBF-F0237A6E2C46.1;
	Wed, 29 Jul 2020 14:41:44 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9289e5587e82.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 29 Jul 2020 14:41:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TR/ipjGt1zzoDeT8Rp+zdXikL7I2RvMLaXYVXABlSFGWmoC67498QovP7bH3X+ObUhr4qyVWf/wkEFn9WKVmrtefaSBtAWtINrbC3dMHOkDoFJJ2Xlkrv2dDLE7GqogsvOS3HnbhWJ5A+BZRmTRuV48+1bJsoBzG78Wlb4JbXjpLaJzgxkaz2eYDVfqm/F4sGCZhjyaASJwKX87J1oZpIAQ8W9V90V/uOZwQzBo+ysVgL/kTfxnSbFrb1npFfubUGNZdzjW+JqppjYYBSbshR7zvGaiK0j85SjXvrLXCPvyV/Yc0akWdcGaihQXLYUzyXryYKLgCX4KMxQFLDPv2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcDerQBQomJcp4+8XXsEM+S+f1yokt8HteFUTPpqHKo=;
 b=Ii9psY3R3FV2mNI32gDXicEfANOtByom73d3mCg2ysj+Eo+PCTWtt9CFryu2lfALJz4atEyJv93VeQB0LKcmzE/TAwRYuztE0KWzqiCsf6edLXU8JXn15wDkSiNnZL0AWCmf6FbmSfFFKkt7hLJn/9okfhLJJHeGlyV98laLC0Y4NQZh2XySYz+78DHVUEZq8e92MtByRDhB+smRoC7s+gtcFVO8mQRb9r29bJfaV2rmTN+pn7GjjGvK6g3FhDSQgY3Dgpt2XZ9s8Z2eKv38F0ofgKp/PViS+PYLqOpOH8O/W4ZSn7GGOL9IMhoRxq0m5A3QDJg2HO9M0rVoMXU+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcDerQBQomJcp4+8XXsEM+S+f1yokt8HteFUTPpqHKo=;
 b=GUO8bwaMebf0FnZKle8mAO6s5oox+WVlhf0engbY5bWRTZX+BXqL5jebu2PBDlZB3d+pdWJr8Eabs4c1rkzeBGzJH1vCRJmaTo2/RHTWJX2HgL6FPIcqc9u7c4Neh0o3SUO2rVBOYuK6GxnGNhPbsNLvCE/tY8lvtZM0WB9vb3Y=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB8PR08MB5388.eurprd08.prod.outlook.com (2603:10a6:10:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Wed, 29 Jul
 2020 14:41:44 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3239.017; Wed, 29 Jul 2020
 14:41:44 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] oeqa/selftest/imagefeatures: Add testcase for fitImage
Date: Wed, 29 Jul 2020 15:41:18 +0100
Message-Id: <20200729144118.21411-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::30) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.52) by LNXP265CA0066.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25 via Frontend Transport; Wed, 29 Jul 2020 14:41:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 674fb695-7e74-4fc4-9be5-08d833cd87a7
X-MS-TrafficTypeDiagnostic: DB8PR08MB5388:|DB6PR08MB2887:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB2887372873C9E19D4260881292700@DB6PR08MB2887.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:324;OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SmOHnSQkL+u2GYoNjF3w69vyfwDgK3PUzFFgG40Ev9Lbd7mIog1pfwsaHzOBtOqsy8I2rSAJK/pRfLHevGx662Djbhk5cmw7qJXrROmjLeg/EvmQdvJUTVLMLxfgsn0ao+bBjti4EvNq7pzJysmPheoZKVgjYwakfNX3K9djfk5q7jQetuBBh3jYueAcN47YMoEGIeg6y42V4HUpEv/yyhqlElo8G2huHnshWk6BMXTm/hJHFuZRNWE3qyqssxZM2t5K17f0Aon02+nyv08rQ9IOIrJbXxErI4T7j+fDs/efnkBQRoNKxiwzvQT0I/loGQTCy2hbJJP9qPABxBEb5w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(6486002)(16526019)(478600001)(5660300002)(36756003)(1076003)(83380400001)(4326008)(2906002)(186003)(6666004)(8936002)(54906003)(7696005)(52116002)(44832011)(2616005)(86362001)(6916009)(956004)(66946007)(316002)(66556008)(66476007)(26005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 dP9AhhsD75dFel1jYmkMfUw5MpydIYQPete9SUlYJva7RfYsWoUWK2Xe5f45xmqtkW+Bb+8CIAYGDgNO/BVfvYRdAQlWTAQBXspnWUxVEUThNnMXD+30wV/Eodv5LovTa2tw9rM6m2VlGKz5K0C6H4YpZ/o2KWcrls5PDN9p2M5ZfGc07zz9/KxFd7fOG1eqSQdREtHGt1iK12H9cIUVJzSkQUngVLzq8UpYVeIm1HevtfbL10zJhUzAakYVwBTx3c1sBzKtGMTVs7Ciq8lnJ+cFynx1VsAvEQrNu0W70oP8KpPohKTqzxZ1CgfMvGHcjONw/D0+omToEOdmSxX7sxozV54rfhwvjVYLZHaOtUVXSflv+vc3b0WhZplkByrvwU+c88Gh5Gp+O1Y0R+mrIAP2G+SCPiYqCowIY7X7JQCg3cIs00OVdTuBQ/n+Jn8WvPnNI3G25BPwYv5+PTBZPOYuKQgADb5nYVLXWJhj1PseP8VmI6yeXEcLa4E0JOGl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5388
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bf2909a5-0ed2-4cd6-1408-08d833cd8386
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JqbYR662jIy9v/n7ROaqqam0qg1QcF/WL1hq6KRAUSI3e+saO63XJqfztTA2gJqdXRja0KfiKdaSgYsyVCAJuNmaULYOrtY9o7zD++6WV7BT0DloEN1wq+501jx8+3NSLMfgsS4PyRq1u/lBBfhHxIzgaCcBINpp6VIkGjPC3/8xo14wa2y+SZkX4lHD8JIDEt5KnANi11LzAN4Y5zjLv6SRoCeS/5Q3KqU44q+aFHPoC130kC4veFH++vhDpvAx+Vk8IbSm7zrBOA30Z5FjSf/TP6Ws3ByU6UtuxgMXREfTuTgXCIBA0UNJcyMKCCrh7M5pnqHD1dm0ioilrihQ1APK24KheS/PlpQsHMxNqQAruFSu18EK8IW+7714YllQs14ggwW53wrwKeSiNSf+nw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966005)(2906002)(186003)(36756003)(16526019)(26005)(336012)(44832011)(5660300002)(2616005)(7696005)(4326008)(6486002)(6666004)(70206006)(70586007)(1076003)(956004)(6916009)(83380400001)(478600001)(82310400002)(86362001)(356005)(8676002)(54906003)(82740400003)(81166007)(8936002)(36906005)(47076004)(107886003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 14:41:50.9557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 674fb695-7e74-4fc4-9be5-08d833cd87a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2887
Content-Type: text/plain

This testcase generates the Image Tree Source and
the corresponding fitImage containing a kernel and
a ramdisk. It then checks if the these files exist
and if the right fields are present in the right
order in the Image Tree Source.

Tested with: oe-selftest -r  imagefeatures.ImageFeatures.test_fit_image

Signed-off-by: Usama Arif <usama.arif@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index dea519e6df..f7a2533746 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -263,6 +263,80 @@ PNBLACKLIST[busybox] = "Don't build this"
 
         bitbake("--graphviz core-image-sato")
 
+    def test_fit_image(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are built
+                     and the Image Tree Source has the correct fields.
+        Expected:    1. fitImage and fitImage-its can be built
+                     2. The type, load address, entrypoint address and
+                     default values of kernel and ramdisk are as expected
+                     in the Image Tree Source. Not all the fields are tested,
+                     only the key fields that wont vary between different
+                     architectures.
+        Product:     oe-core
+        Author:      Usama Arif <usama.arif@arm.com>
+        """
+        config = """
+# Enable creation of fitImage
+KERNEL_IMAGETYPE = "Image"
+KERNEL_IMAGETYPES += " fitImage "
+KERNEL_CLASSES = " kernel-fitimage "
+
+# RAM disk variables including load address and entrypoint for kernel and RAM disk
+IMAGE_FSTYPES += "cpio.gz"
+INITRAMFS_IMAGE = "core-image-minimal"
+UBOOT_RD_LOADADDRESS = "0x88000000"
+UBOOT_RD_ENTRYPOINT = "0x88000000"
+UBOOT_LOADADDRESS = "0x80080000"
+UBOOT_ENTRYPOINT = "0x80080000"
+"""
+        self.write_config(config)
+
+        # fitImage is created as part of linux recipe
+        bitbake("virtual/kernel")
+
+        image_type = "core-image-minimal"
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        machine = get_bb_var('MACHINE')
+        fitimage_its_path = os.path.join(deploy_dir_image,
+            "fitImage-its-%s-%s-%s" % (image_type, machine, machine))
+        fitimage_path = os.path.join(deploy_dir_image,
+            "fitImage-%s-%s-%s" % (image_type, machine, machine))
+
+        self.assertTrue(os.path.exists(fitimage_its_path),
+            "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertTrue(os.path.exists(fitimage_path),
+            "%s FIT image doesn't exist" % (fitimage_path))
+
+        # Check that the type, load address, entrypoint address and default
+        # values for kernel and ramdisk in Image Tree Source are as expected.
+        # The order of fields in the below array is important. Not all the
+        # fields are tested, only the key fields that wont vary between
+        # different architectures.
+        its_field_check = ['type = "kernel";',
+            'load = <0x80080000>;',
+            'entry = <0x80080000>;',
+            'type = "ramdisk";',
+            'load = <0x88000000>;',
+            'entry = <0x88000000>;',
+            'default = "conf@1";',
+            'kernel = "kernel@1";',
+            'ramdisk = "ramdisk@1";'
+            ]
+
+        with open(fitimage_its_path) as its_file:
+            field_index = 0
+            for line in its_file:
+                if field_index == len(its_field_check):
+                    break
+                if its_field_check[field_index] in line:
+                    field_index +=1
+
+        if field_index != len(its_field_check): # if its equal, the test passed
+            self.assertTrue(field_index == len(its_field_check),
+                "Fields in Image Tree Source File %s did not match, error in finding %s"
+                % (fitimage_its_path, its_field_check[field_index]))
+
     def test_image_gen_debugfs(self):
         """
         Summary:     Check debugfs generation
-- 
2.17.1

