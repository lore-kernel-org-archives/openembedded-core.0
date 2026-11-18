Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.223.1795033983910274236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:33:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector2 header.b=NosSlbPD;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.200.44, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiIQTMx8NHoItzpz2SC0JeHHVBQm5iB71MfulJ0aDjCSTvpoA1gZVt166fMv+ksKRekuGp6spLvKvi1FpJNZdJly3I2TFZelvZtXztAZaipmCJVR+DnX9ryZlYQsD7dXPxBEw1JVu/VvQdcpuDcM2UtXw/BTVS/YG+W5/3uOycnn/nTvabeR0kwTojaX8tHNMgeui3ffJ/DB+CKjC02bsfbrn9jqjC1kS9GVQlxZW4y4qlrwTr63Wvfug6Dvi/PruUzA6d9aLcCOot/zMQkqb5jtfpc47hVRcPDb3phlJtIMVetIwZ9BdLqlFyNu1MydOHcH2cKfJEAvALVu03LF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUHLK1urYWOvoLOLeRg3Bnn0Q4G18H8Puy60cMWzRIk=;
 b=O1rfuynwPIdaDheANbaOmXl+tdE0IF2vJQ6WtmLTR8hrYXOxb5cEf1OpZlbciyZzKSl2GIhOZ9wL5xLeaWTouk1Q6vszGVB1EWRkfr8PKb5WhCPocHFL0rDCFOqNvESiZnx5C/8Fg4r8UgqWyHxIjjRCy635Kbs3rWIysH1wU6MgPsaSBAB3thJsYsaSDTKmOi+cYwyNQvcAJ+B3n7gglWHJOr1JElVmK0ylluD6JSWLcPfyEl1Zr2LtCwNPkcCDLdUjGceRwK0BulTD5O9hsz1XOhXafA73PdYLnjfh6afYcBvXLOIFit0pyt8MjkqCR0yw4XCw6d6RMH3XcKpQEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.39) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUHLK1urYWOvoLOLeRg3Bnn0Q4G18H8Puy60cMWzRIk=;
 b=NosSlbPDRG2hsLYOp6jFqkqAfYL4GtRZZTEYZ796dxmvUD2JuhsmgsGEDFqR1LBqeMp/7wx2YOETPhRJvxz/0l4IVYPJdz8o57PkkSw4OnuoQ4SqnzzeUuX8BMODh8y7FqZjStqwUyjl6YiPfFC825862oo2UD3ZeoeJ1xDI4aYbuAm1SF8LMzPtamh2A0zMqGf3GsSP9ass7dxWkUYkBRegcrct9Y452tBCTZ4LtfA9hrQHdcVpEZz4+TLqzTieaetch93+y90Sq47UfMO7K/ra/67kEy1DH8o5iMSd48WCV9uTde5pdWfrFcEsAnlHgGewhDKGKKtAsxV9Zc2tMg==
Received: from BN0PR04CA0110.namprd04.prod.outlook.com (2603:10b6:408:ec::25)
 by DS0PR12MB7704.namprd12.prod.outlook.com (2603:10b6:8:138::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:32:57 +0000
Received: from BN7PEPF000000A3.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::12) by BN0PR04CA0110.outlook.office365.com
 (2603:10b6:408:ec::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 18
 Nov 2026 20:32:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.25.218.39) smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.39; helo=wpcosapexchedg6.windmz.agilent.com; pr=C
Received: from wpcosapexchedg6.windmz.agilent.com (192.25.218.39) by
 BN7PEPF000000A3.mail.protection.outlook.com (10.167.248.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 20:32:56 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 18 Nov 2026 13:32:48 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2] image-artifact-names: fix default suffix detection
Date: Wed, 18 Nov 2026 15:32:48 -0500
Message-ID: <20261118203248.1802145-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: chris.laplante@agilent.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A3:EE_|DS0PR12MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 277af1e0-7887-4d30-07ca-08df45b32108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|18002099003|17002099007|6133799003|3023799007|261009223027099003|260925022911599003|260925021911599003|261026140227099003|261022105027099003|260925021311599003|11063799006|56012099006|10067099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261022075727099003|261026121527099003|261022115727099003;
X-Microsoft-Antispam-Message-Info: QnDCy+bZWkbMe33iLvZBSm1OLQGE1wCDAGJ94GLgbp1Py4t7r+8J6NRVIkzMnGxud6J+9Js535bUOfczObgXfAY2jR9mfGXvue0GbqP03gqyPbQp8bTO2ZwbfurG+M84h9p+IfRBhfQdg3uLoo29fcjGmfQ/M4Ya+ZC5q/AOkL7IsIe284nBq0YIdjaluISnjrelLSSE21xQ1ZeEfGqt1HtuXbjtlA9q92YNF/QVbMV9qf4cinG9qqjoVus/XS15Kmc2vXNzkp6W3WAHixBX98kjzwo4tzR4kPvnYzhvQuepRiQQl1LdfAL8VC+G36fZC1bjkI7gwCQgFPGb+MFrwKqRcagfrvqa1IViEoitarKK0aa9+z+xG2veeXIe3zs/7P1065wB3w/kjFgn1Gi1pFiewAwvH2ZfzwvRcxAvRZgVJEEC5PbSwezt2oVkCF625Bj/d1puUH81W4PmhKFagILLOtaIAyutNZBrWN16UijjxcyntDkdgJhBC0ArQzQK0+GjvDcHBoqSVjDy9coK37Bis/0yDOG7yEIuFJnqgF8oZwqa8PRQOW+ZIBjgUK366kMkk0821eTe11CLET2NkbEaOW+OQYN9hJI+EofWCIb0SbZAKRPrHEPhfL8Ez3RAT//go6Y4AXL77Nc+nS0cmX/yUGD5G6gZPactVJrkj8mAaNsXbNVPmMdLW3tCDiCYD5kZKeiCLhjU5aC+Jjc5AQ==
X-Forefront-Antispam-Report: CIP:192.25.218.39;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:wpcosapexchedg6.windmz.agilent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(18002099003)(17002099007)(6133799003)(3023799007)(261009223027099003)(260925022911599003)(260925021911599003)(261026140227099003)(261022105027099003)(260925021311599003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022075727099003)(261026121527099003)(261022115727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mC9aMrpfc1dk3sxPiJUviG5TyHa1lXuDUWfienBDCqBAMIj+RHD+4EKJfyuDcBB52BOiz4OQhTsiudrNU8Ci/x4dbVz9OnMESk6mwe0W4gFleTLbQ4bz+WkUOs2JpcQUvgYWIe2FmfqiiJFn+0IuJj1ItijXtmVL076uuu1rrIDW/lHRLoaRzNw1ePRNjCmsBHD1+X9F9LdihAWBtdPwYUE1edVbtiYs1VspViPZXKnxEwzLhUlHREHTLUDIOp6UBb7hrJbqWzX1lDHaUQ0CR9qtMd+I2IGHGVx17tGKHLgkQSbqN+AYExR/rJSb4n04kWA6+GYb+/D16fZFqM/BmonFL6lgzF/+vAmyB8P8cU7OqhpOpY7Ih3+gfJovrqwp4V5y+pHlCGgIDoIVZDxcjuXGYk9Ci9XRmQx2IeUMd/9OeKAoSepW099WcNiOa/QA
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:32:56.4108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 277af1e0-7887-4d30-07ca-08df45b32108
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.39];Helo=[wpcosapexchedg6.windmz.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF000000A3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7704
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250582
Content-Type: text/plain; charset="utf-8"

From: Chris Laplante <chris.laplante@agilent.com>

Read IMAGE_VERSION_SUFFIX without expansion so deploy recipes use
SOURCE_DATE_EPOCH instead of the build timestamp.

AI-Generated: Uses GPT-6.1 Sol

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes-recipe/image-artifact-names.bbclass |  3 ++-
 meta/lib/oeqa/selftest/cases/bbtests.py          | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image-artifact-names.bbclass b/meta/classe=
s-recipe/image-artifact-names.bbclass
index bc76ff0e16..a360ae66da 100644
--- a/meta/classes-recipe/image-artifact-names.bbclass
+++ b/meta/classes-recipe/image-artifact-names.bbclass
@@ -34,7 +34,8 @@ IMAGE_MACHINE_SUFFIX ??=3D "-${MACHINE}"
 IMAGE_NAME_SUFFIX ??=3D ".rootfs"
=20
 python () {
-    if bb.data.inherits_class('deploy', d) and d.getVar("IMAGE_VERSION_SUF=
FIX") =3D=3D "-${DATETIME}":
+    # Compare before expansion to recognize the default DATETIME suffix.
+    if bb.data.inherits_class('deploy', d) and d.getVar("IMAGE_VERSION_SUF=
FIX", False) =3D=3D "-${DATETIME}":
         import datetime
         d.setVar("IMAGE_VERSION_SUFFIX", "-" + datetime.datetime.fromtimes=
tamp(int(d.getVar("SOURCE_DATE_EPOCH")), datetime.timezone.utc).strftime('%=
Y%m%d%H%M%S'))
         d.setVarFlag("IMAGE_VERSION_SUFFIX", "vardepvalue", "")
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selfte=
st/cases/bbtests.py
index 7e59136814..0c12cc98b9 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -130,6 +130,21 @@ class BitbakeTests(OESelftestTestCase):
         self.assertTrue('Task dependencies saved to \'task-depends.dot\'' =
in result.output, msg =3D "No task dependency \"task-depends.dot\" file was=
 generated for the given task target. bitbake output: %s" % result.output)
         self.assertIn(recipe, ftools.read_file(os.path.join(self.builddir,=
 'task-depends.dot')))
=20
+    def test_deploy_image_version_suffix_sde(self):
+        self.write_recipeinc('emptytest', '''
+inherit deploy image-artifact-names
+IMAGE_VERSION_SUFFIX =3D "-${DATETIME}"
+SOURCE_DATE_EPOCH =3D "1234567890"
+''')
+
+        # Commit 0e2fbdb32bae ("image-artifact-names: Use SOURCE_DATE_EPOC=
H when
+        # making reproducible builds for deploy") intended "-${DATETIME}" =
to use
+        # SOURCE_DATE_EPOCH for recipes inheriting deploy.
+        self.assertEqual(get_bb_var('IMAGE_VERSION_SUFFIX', 'emptytest'), =
'-20090213233130')
+
+        self.append_recipeinc('emptytest', 'IMAGE_VERSION_SUFFIX =3D "-cus=
tom"')
+        self.assertEqual(get_bb_var('IMAGE_VERSION_SUFFIX', 'emptytest'), =
'-custom')
+
     def test_image_manifest(self):
         bitbake('core-image-minimal')
         bb_vars =3D get_bb_vars(["DEPLOY_DIR_IMAGE", "IMAGE_LINK_NAME"], "=
core-image-minimal")
--=20
2.43.0

