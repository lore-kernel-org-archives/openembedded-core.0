Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6064.1795033490398852606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:24:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector2 header.b=BAhItWxB;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 52.101.56.38, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZPzdXNR/v4HYiBQ8Qrw8YLcjtDKVqmAiGy/H9/GILdOkA2G1br/IKaGQMAXIOpoqA2SuA496uITwpb+t21QyBMDMpSSx5aKuS7Puaq7u6VUXi0JjIyXnODtA8R2GnKTCuThPPByTnch92Sc0QFlDcNlwEodCq25ur/YT/CUFFdEUZSuvvCp8KWKulmZHW59o8YbWbfU999olxg37DLFe4Kyb6gDSDCdgAIy+x38x0NpW69H1y+gwgMJ0Drk3un76WCKFbcDOQuM6vqhM8Db4MxIl0R88eeMpfjDtlHOGauL+2DcyXiBNQBqZbj+0tYc3bcAIqWXYhUCTuJ1LjmHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpssXf1QduT4mhJa18IF8dcXxODpBJ6uV1ZQ860qQEY=;
 b=K08bg0kLGZFJBM4V0wbm/DAlJbjnzVkZpvtjKm58tRze60IdxA/E15a4fB+o04r3QUYKI/7Y7w6ij2HxBycdmg2mJ5wgHT282r1kMq3SQoxtqP55J3g3o5E9eGad82KIVf1qctJ3h8i/ZPAUQRazWil/H4GQWxu+45286uht/zNKHoUwkhHIyc7n1ixIo2V/XjNc80xbHVZmt2YAGOsEyje/c3pZXYZAMJcf5DEXeABv1t9l53oJVAIMcPzFwliSwmf1oENKsCu7PYMYhkM1xuMI/IrGsVQmkHIM9ZfidNiCn9RWT6/Py76gdtxZJJ0Wj2E09rc0Wpp7dDvTM6gciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.39) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpssXf1QduT4mhJa18IF8dcXxODpBJ6uV1ZQ860qQEY=;
 b=BAhItWxB0iSDHY8maWAA4epmB+HTmU4nL0/C+6zBYRHjSnCL50ap4soY4n9m0eyYuvl6B8/fL5ygb8YRjPHxvYx8X23BWBKK0xz4ylU+Ly3LeYXb6pT6gkhV6T1PICkS14Xr3/k65moDgExUmX1bf7WqL/sr11xWxigUTUTCjsDRFMibnhepOY0DDJ5lbf8ZtOazyoMGSkousW/dhMqlkRN/GpbedacgaWFudzmWO0ZQaYoh4kAtJh8z/8l3m8iMQmiyCsFR9/H+DEzcuDMzXcd4OQI4i4AzEHZmKTXXZPUmE1UQbyUKX9o/MtRKnbEG4WDqDAO2g51qRWN8b4YcaQ==
Received: from SJ0PR05CA0137.namprd05.prod.outlook.com (2603:10b6:a03:33d::22)
 by IA0PR12MB8715.namprd12.prod.outlook.com (2603:10b6:208:487::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 20:24:35 +0000
Received: from CO1PEPF00018868.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::20) by SJ0PR05CA0137.outlook.office365.com
 (2603:10b6:a03:33d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.5 via Frontend Transport; Wed, 18
 Nov 2026 20:24:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.25.218.39) smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.39; helo=wpcosapexchedg6.windmz.agilent.com; pr=C
Received: from wpcosapexchedg6.windmz.agilent.com (192.25.218.39) by
 CO1PEPF00018868.mail.protection.outlook.com (10.167.249.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 20:24:32 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 18 Nov 2026 13:24:23 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH] image-artifact-names: fix default suffix detection
Date: Wed, 18 Nov 2026 15:24:16 -0500
Message-ID: <20261118202416.1778512-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: chris.laplante@agilent.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018868:EE_|IA0PR12MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e3b6d8-9260-4221-ea04-08df45b1f4b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|17002099007|18002099003|6133799003|3023799007|261021123027099003|261022115727099003|56012099006|11063799006|261028144727099003|261022075727099003|261102123227099003|261021121427099003|261009223027099003|10067099003|261026121527099003|261026140227099003|261022105027099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: N/8R8rsBVGSg4JXdSUhHVS0oRpg5qgUxD19jk6k7bdfOKYEPuhfUlox6Oa4N+pyODUFtfuUuvLeUdtqFU2ozvWYIXAgnQ/xSzF8HPXp8QqFiUQqkMaF5ukfLHK4eDSmnmGfCX7kEXw8XJiZT9fj6ZsSms5yo74psOCYuRgdHPhtkkmZzTPkMmyyFg76DC97vWYm6Pz9I56Bl1Z1fxCszQsJILsxz+EdCyqA3rDlFfMokDCZSrRdcDObESxu/DPlhSQLCanX/ittMoE3ySuOe9EaoXdMRjmcJEF3vl/HSvyUgM7O7cGKOuAyO3T/nJmy8hYpaFb60FlqTu6Zho++r8vGyK88jYeArX5qmHXBvllyR5W+ziwNULknHFRJFGl7s0X6uSjurNRAjWJd+bcE8D9iY77LDcv/bdZXZn5xSEX7Fut7XGZYLkjLg6mE4eZqnVqctLG5C/YW2Ycx3j90hSf+Mv0o010geIYX493A2/ekbhuVW4EbbzGzSwPyzmdLr0gR56kLROfXQ4vP29Z8OAeUEPy9ZU2XUBrA6xpiFhLmFU14dHLEAFuvACDbiUnU49geFVFkFCrXVKY5Bsemj8ugNu1jxcy1hPLPfZBnXSZFn7dqaNFlDvtHR62rQNDZvkHzD6/+yvYHFshasbsgqbr4Vq6Sq/sCzlRUcEDBO44YyxpubLaqlRMbYQhrsiYCg9gbi8Yejk5PyyQyU3vZT+Q==
X-Forefront-Antispam-Report: CIP:192.25.218.39;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:wpcosapexchedg6.windmz.agilent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(17002099007)(18002099003)(6133799003)(3023799007)(261021123027099003)(261022115727099003)(56012099006)(11063799006)(261028144727099003)(261022075727099003)(261102123227099003)(261021121427099003)(261009223027099003)(10067099003)(261026121527099003)(261026140227099003)(261022105027099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9sOsXyoUEkPm6nYJIbzdoREmHFYf791oFQa8qn69gUTdYwi6A5wCouNidph9oPHh2Ej6nnjDv1HfNev7EMGl8C3T323KmnDEtjDyYmjs0q+FEfqetY8MdqpYw7J1LGuAeC433XeT+qFAH3e8qcM+6UOrKdcmJZeJdATDCcDKq16fZG6mSz+StL49NgZGchw25cWtengzZ51FV1hsn+lIINvlBHl+6Caalcs81T9fG8ipi2PeeGQOWGydZksHf/n6mwhb5nuakDOYwLbw7Xm7chtYtvj+EaoeKaZDgmtQhX8PRcuDbHKr/rxoP9b3miUSr+5rn/e43uizobNLTj4ACEUvnksuy4S1Qui3xeIq85c1pzlW/k/VUY5WoFU4Mn3SM37aAm7X4sT33FgczBzromECrm4fSESnRL9YzNGzGIUGwELe7d+88TOMFIgXdAQ0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:24:32.5816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e3b6d8-9260-4221-ea04-08df45b1f4b3
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.39];Helo=[wpcosapexchedg6.windmz.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00018868.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8715
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250580
Content-Type: text/plain; charset="utf-8"

From: Chris Laplante <chris.laplante@agilent.com>

Read IMAGE_VERSION_SUFFIX without expansion so deploy recipes use
SOURCE_DATE_EPOCH instead of the build timestamp.

AI-Generated: Uses GPT-6.1 Sol
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

