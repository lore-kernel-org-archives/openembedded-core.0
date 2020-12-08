Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web09.7230.1607427814620780293
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 03:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Vh45m8Mn;
 spf=pass (domain: arm.com, ip: 40.107.20.73, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRJRYYjZSSyAwlA6RzpfRP9Q3ST+I9j2wjonM+XSFZA=;
 b=Vh45m8MnuWrzAbBNeVbuNLtMxkH5mV4vXGzNR+pqnapUZqWJatjMHIEUit7q/oVi+3RUQSPhU+JevCDFRZTyOTrRE/thKJL946AG9ziGPQq3o4a4tciZdrKyp71aPtsDgwb/sHLidW8bguZdSc2la9LgmbDtPago4hJ/HdlOg7c=
Received: from DB6PR1001CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::32)
 by DB7PR08MB3274.eurprd08.prod.outlook.com (2603:10a6:5:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 8 Dec
 2020 11:43:30 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::5e) by DB6PR1001CA0046.outlook.office365.com
 (2603:10a6:4:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 11:43:30 +0000
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
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 11:43:30 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71"); Tue, 08 Dec 2020 11:43:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9af6c2eeec4be072
X-CR-MTA-TID: 64aa7808
Received: from a08341c37cb9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 24F8BEC1-D1C5-4EBE-9656-8E23E7ACB54B.1;
	Tue, 08 Dec 2020 11:43:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a08341c37cb9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Dec 2020 11:43:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVEw5t4X9N+TOT0negTidFlgKUz6yWF8s5l50pQueoxbRDP0krHPNhJGdQkmHfTHp/VlXxHeTMERLgztWjFKEHPEX9gxRZ7E1jjYAZ/XrZeKs0hqx39JPtnIj6wRveWV35L/9o793l/D3wIONzCBgtwkB79W5FG2B0q7Wp3x/5e5OL9+JCZnhGUWVAWBQ9DrF3VS8HhntBnVk3UZ6sZ37rKaobpatLQaSCIakVQPCHqOuyfuKsBPxsTVj2lIokL5K9rplBBuTte3rfOX3jUZ1rJ0AQ8YsrAnjW5TiWRLhc0wIZSGFQ+aUSrJiC8KMKFY09masXoIbXbUeLLzyorLMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRJRYYjZSSyAwlA6RzpfRP9Q3ST+I9j2wjonM+XSFZA=;
 b=gPbJnyuGXBim4726ytme7LsjMM8nylu99fD4sTyAFT079FSh6tylr9TyyY3aVcaoX9NIPYCDNq+/W12Bxstv5CvWqocCBuxgw79io9IM+8k34DmmWQTZBcjMmvC4/9AcpIzk8Iby3cOW/6ybD+WyslrtkBzRS/CX91KItAnMxb40O2TJ/RzkvmGk8aQuWNxG7vEEzMaOk+33ftWiw1YhMnbYIAfeSOxxRA9OZfy769KI4B1aZtLhcbDp0wNc/j64/LPJe0VZFmoRrSNqQBrlPWCVuTq4u4QKdJvchUWHl7bUdnEXl/zog/Jr0QnXmpsH/G0znetgX9Q5ogvUX1G2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRJRYYjZSSyAwlA6RzpfRP9Q3ST+I9j2wjonM+XSFZA=;
 b=Vh45m8MnuWrzAbBNeVbuNLtMxkH5mV4vXGzNR+pqnapUZqWJatjMHIEUit7q/oVi+3RUQSPhU+JevCDFRZTyOTrRE/thKJL946AG9ziGPQq3o4a4tciZdrKyp71aPtsDgwb/sHLidW8bguZdSc2la9LgmbDtPago4hJ/HdlOg7c=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB2003.eurprd08.prod.outlook.com (2603:10a6:203:4a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 11:43:02 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%5]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 11:43:01 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH v2] wic: Introduce empty plugin to create unformatted empty partitions
Date: Tue,  8 Dec 2020 11:42:52 +0000
Message-Id: <a47db4974657f4459997a409b4d6c830371796dd.1607427688.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0185.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::10) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0185.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a4::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 11:43:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 731c403c-ff1c-4fc4-fa21-08d89b6e7bf1
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2003:|DB7PR08MB3274:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3274F9850AB66DE8F9FDF97692CD0@DB7PR08MB3274.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /beFW8UKYGY6QaK5tUY67jkYySZkpRRgfHPyA4VNidI8F5kXhCjyT2LZuFFXssBBxDrcK+z3rGyAr37y5JnphnTrQICLkC+f23k0T6/gxqMc2azcI4pDmsQ1emPhRnQpHSJHGiT3Ju6zOGHQ/UciwfIYabsYZtmipwVVEH8wTYKcj00vEGG0uPEj0X5cPpOuL2tMcm5BfDwiyGqWfXaoQ94paxu43rvKwj+LMVqa6ooZZvUCVtG3X6eR1f2Lr9vwrR7N72ZCVDU5kY6CMoWj6Y1ELNPHgCflfiMBvPI3TgSwV3vk2bdgXksw60agFbs0aqy9m2txDXyArkBlmJqOA843TXDOWANEbwlDk0XFu8ABfCdDhsEOOVINpIpbSA3N
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(956004)(5660300002)(6666004)(26005)(2616005)(6486002)(4326008)(36756003)(7696005)(66946007)(6916009)(66476007)(34490700003)(2906002)(86362001)(66556008)(8676002)(508600001)(186003)(16526019)(52116002)(44832011)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?NsNBiFkDGojrepsmuhh6zV/bhybtbVpypkEaHl41s+L8Mrr2c7o5F1EB7oiv?=
 =?us-ascii?Q?hPUB2puoyaQPWkBvOVtAsjDsHhWbhUv8DM2OdPxWl4sWwPqb9y/DMeOgZL/i?=
 =?us-ascii?Q?+e0pvxKf5bTrADNl+kA9A1pwFOL3gDO9k/BOLHP/Yei5ABUkOL1gmu1Qclb+?=
 =?us-ascii?Q?THvIdgsJHfRXsuRQRNAHiE0E2g+IyqiaK7KWHEykPD1Mkx62LfOYDRWLd1hD?=
 =?us-ascii?Q?Id01+vBQV0dMzfmaJWx6uNyk9RUuf+5PTPDLtPSY7FZLqY+pIhDcAUkHz4go?=
 =?us-ascii?Q?IrAPrvmzzQyzwepLIGA4pWhQPUVqT22/gqddLu2t00wPod+jzS1K10p11GOC?=
 =?us-ascii?Q?XotMwfWqYBMiBbTVWtIcFJt3Ov6qmyy+5nzu4QMV4oajcM67fyVZAzh54ovU?=
 =?us-ascii?Q?YPQ9GTzs4ze95uNO9OMR1KiCiRzGF8Zet2JGXFj3OnUSJ2UU//rTu1mREqvH?=
 =?us-ascii?Q?o5AOdoB5vqvNuad3ZJL3rFNqRMrqVnCQFmYHIN/AaMA5i5HAO/2Q7h1Fpyt1?=
 =?us-ascii?Q?Z1+1/xFbxNreYvKvKiUKFyu2IstWwomJAczY645jm8bRejBBz69VQP9sUfwK?=
 =?us-ascii?Q?DK9NRJ9Z6ZxXmTrMmnAyN9fpHsvPaeJboprGAsBqDzfK9ENYQbRjKsg6srOh?=
 =?us-ascii?Q?vcprodxoyKYevhwQ530r5YnEpPA+UQCSTWAhK1xZaqY012HSM/CZnclTnZgp?=
 =?us-ascii?Q?eLbYIHl1KAPFqltTCSxUS/acdCtDT6OVz5+8DXK5TvdnVVKOoJhhrIgiNPZI?=
 =?us-ascii?Q?CPyygUmHVcsYf+UsF8xPhwvlwc8k7pgNXxU3X4F0wPFDL3dz8Ye9WwQ9hyfK?=
 =?us-ascii?Q?14lscwsmfwRzAgXrruoUSOHWUu7CSRB586S8FL6NTmjFM/KZTcufGLA8D9SI?=
 =?us-ascii?Q?NlQKgp190iPwFfa7XUh6BdfUSY1hFfonCf6beDDU6HEb64lkEBqeCUAC8YvU?=
 =?us-ascii?Q?hK3uOQdPRwaz6H980hVB+eZEBYiwK5V+MIvCB3B/ksP8b8RISZsfhU7YCNHp?=
 =?us-ascii?Q?bKdw?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2003
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7a22fbeb-09d9-4de7-0c20-08d89b6e6a98
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T8mcT8mUc5YaEEGAWLo1uLKydbYg1hloczp6Uw5dKuMiwXTHSRt8CMA8aag4BqnG3XfqU/ObH3yWC+b/5hDuo/2sE82wz3VH0Gwpz/ywagS35tXfJzIuvL7gihM3XorKHbphcx2JkxcmxKeUVTa7JI4Q1eriut1eKc4y/mhZYCuD3QgzEKI9NN/6dBO9i76MzRElWwZP9VLiY81aOwSjav+zvA+Hz1eXmiTv7TqjlnXJLmY3EPdMZ/3pSa7VIyxThzcYOCLDvui7V6wzw5nlV/d+Ao5eoNYoKxfOb4p1g/t7I4e8H3Afp/tryK8F5D1ddHbFqKZi7gkbl+vTz7hgUIJrUzFF0LhRGKuP1pd53SpB0n3fH2USH50ZDqPEYtgPkKu/K8JVaU0ZiZ6W6BPesg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(46966005)(36756003)(16526019)(6666004)(7696005)(186003)(81166007)(356005)(2906002)(336012)(4326008)(5660300002)(6486002)(2616005)(44832011)(8936002)(47076004)(956004)(86362001)(6916009)(26005)(70586007)(82310400003)(70206006)(508600001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 11:43:30.1008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 731c403c-ff1c-4fc4-fa21-08d89b6e7bf1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3274
Content-Type: text/plain

The empty wic plugin is used to create unformatted empty partitions for wic
images.

To use it you must pass "empty" as argument for the "--source" parameter in
the wks file. For example:
    part foo --source empty --ondisk sda --size="1024" --align 1024

Also adds a selftest for this plugin where the 'Fstype' column from 'wic
ls' should be empty for the second partition as listed in
test_empty_plugin.wks.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-selftest/wic/test_empty_plugin.wks |  4 ++++
 meta/lib/oeqa/selftest/cases/wic.py     | 20 ++++++++++++++++
 scripts/lib/wic/plugins/source/empty.py | 32 +++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 meta-selftest/wic/test_empty_plugin.wks
 create mode 100644 scripts/lib/wic/plugins/source/empty.py

diff --git a/meta-selftest/wic/test_empty_plugin.wks b/meta-selftest/wic/test_empty_plugin.wks
new file mode 100644
index 0000000000..4e91e04e19
--- /dev/null
+++ b/meta-selftest/wic/test_empty_plugin.wks
@@ -0,0 +1,4 @@
+# short-description: image for checking empty partition creation
+
+part / --source rootfs --fstype=ext4 --align 1024 --use-uuid
+part empty --source empty --ondisk sda --size 1024 --align 1024
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 714637ec1e..091f0ab47c 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -990,6 +990,26 @@ class Wic2(WicTestCase):
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
 
+    def test_empty_plugin(self):
+        """Test empty plugin"""
+        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_empty_plugin.wks"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal').status)
+        self.remove_config(config)
+
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'])
+        deploy_dir = bb_vars['DEPLOY_DIR_IMAGE']
+        machine = bb_vars['MACHINE']
+        image_path = os.path.join(deploy_dir, 'core-image-minimal-%s.wic' % machine)
+        self.assertEqual(True, os.path.exists(image_path))
+
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+
+        # Fstype column from 'wic ls' should be empty for the second partition
+        # as listed in test_empty_plugin.wks
+        result = runCmd("wic ls %s -n %s | awk -F ' ' '{print $1 \" \" $5}' | grep '^2' | wc -w" % (image_path, sysroot))
+        self.assertEqual('1', result.output)
+
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_biosplusefi_plugin_qemu(self):
         """Test biosplusefi plugin in qemu"""
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

