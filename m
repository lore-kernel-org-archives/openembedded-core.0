Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.88])
 by mx.groups.io with SMTP id smtpd.web10.870.1627925213731252149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 10:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=HVyAyn2Z;
 spf=pass (domain: xilinx.com, ip: 40.107.237.88, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPI/JHa9GjnT4spMCQF7jbxO+KmM8dWEIZe6t+0D56WPLs5Mfi27cHZkNfjRyjab+SirCQuIVKtmvH+6ftPWQMXZSrhTokRyJzAcOqwLkNlKA5MOQKGluGKpipSMMahcXofzjv1X/2wcGl5Gtr7roRnMvEwh/ofCaDKD6XxZamOFXzBWAbFrZLZ2nlChCVluWcqQRgqAsoDjqO6tppNPE1f5tcnaPvLatCiQ7Zv6ufbL1u3ikmMTpaOfWiGmMBnvpoH+QMTTOvbv+4KELgI4KlP2zStrzBmDdQGlTFvpN5qQwxCe5t1ts3JUCO+UITjyZPHLpHok1wPZ5c3tOkMveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKd+/nEEb6Seh/ll0fRIIboiZIY06XhF63E7QqqDpAc=;
 b=LaNRI7bVRudTTUEe+B+QvEICtZFlT/Sk+D9RUyCnl5w0XQJw1F7Ph5cEd71GK1PUP9KfR03rJbFJSVL4ZyK85+F1hy53wESaCFw+8jUkztwz1LpxVFFTTN2YVV1m8Oay0nX44aF+70AQR14G0bXwiOU9rFdxpY4CcrW4bYJSlpC6ZTs8H/4GPZZzWAtl8hnzBNkx21Nem0s3YQ+Xr2akM84O4SeijX3K4K34eSv3oquacC1UnFqxn1n7x4Dwf4ZDptkT18pDhEiLnXWn3DMK5LYtEOlygYUxmEodrVFgCG2lXHP36K4u5aCTiPc7vsjAjL3sd5J8X6TM1I4kfFAwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKd+/nEEb6Seh/ll0fRIIboiZIY06XhF63E7QqqDpAc=;
 b=HVyAyn2ZcHzbve1PzdXdE7W9SSrK0ZVQcppUADc6uTgtTqM6x9tlJ73G917TYFjvvMvGBU7TbfliGiVwutH9E+5t9gEZ3Cx+/fZedIxUWp3k+fcm3x5O1ez2ZPBkCGgoX/4Oph5gVH5jPn6rhk3AYOQmRRtL9NtBDGKiNXG91uk=
Received: from BN9PR03CA0912.namprd03.prod.outlook.com (2603:10b6:408:107::17)
 by DM6PR02MB5836.namprd02.prod.outlook.com (2603:10b6:5:17b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Mon, 2 Aug
 2021 17:26:51 +0000
Received: from BN1NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::c8) by BN9PR03CA0912.outlook.office365.com
 (2603:10b6:408:107::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Mon, 2 Aug 2021 17:26:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT024.mail.protection.outlook.com (10.13.2.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 17:26:51 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 2 Aug 2021 10:26:49 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 2 Aug 2021 10:26:49 -0700
Return-Path: ckalluri@xilinx.com
Envelope-to: openembedded-core@lists.openembedded.org
Received: from [172.19.2.12] (port=60982 helo=xsjckalluri50.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1mAbiD-0007tp-PY; Mon, 02 Aug 2021 10:26:49 -0700
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [oe][meta-python][master][hardknott][PATCH v2] python3-humanfriendly: Add nativesdk to BBCLASSEXTEND
Date: Mon, 2 Aug 2021 10:26:48 -0700
Message-ID: <1627925208-18683-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b36319b1-ae32-4930-8697-08d955dab737
X-MS-TrafficTypeDiagnostic: DM6PR02MB5836:
X-Microsoft-Antispam-PRVS: 
	<DM6PR02MB583636958E48D71EE788964EB0EF9@DM6PR02MB5836.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QLwjKko5hQ8Vdb91TPV0lhZjaK+ifD0SElT0nvuquwoRhCIktJ2ab8YaeenQvSs1Wdl4AL+N+M4EC7VMOy4BOcdwINsdL5nRJ/Pfv9efmpyHgFX72b+x+5Wbut9mivmv23nheqSdDA4PW83ouEZVT5SHoTpcV7cLE/6k6JxAjoXCqQBXC9y2NyKRdAurKVLhQo0zS4mMvkBfh8aDMkd+LnIxdhkK3WJVqUe2lwKi6KLxKtE1y0vteerszh0F70SQxm1jrbCv/tlENKFhoDvIB9lpMReUJWslwptdLQn5/YGEf+PvGAz16fJ1Boy1EYLiesUzsm92cpOSz9R0aBzvA3QxskLj4Ovllg7csvgaescrY1IzEdxn66pw5CQvGaPcHQdhVX6lXks/T6MlCR/ngqOHpGI9AiRdlU4t5+3MZ2q5NfE89fS1arzulsFbgN+Py/KoABu6lxlPoGJGIckflOWlyvux0YjxHQrAaUJQTR8gpNT+EoY5E9+im3VYG8NpE59HJfOv7N86QMzp8nNwZb2y/s0vexfpnyYAvzsC6GmcTr0IDm1rR+0KEQjCKV37mDoLxa++T08GYgQKaXUzUVvkEP2rsWvZvK74RdXUwJi9Xtq66EtQ6WjvC5n0h+XrPpOpumBABjV8SSywnHh6qmjy1pZcM6JYitk2W7bE9erKN+dC504gOhLhXrR1yMD1rbD1IgsPMMB06zclPfOmvANR/5pEJHaCCSALmg33a+8=
X-Forefront-Antispam-Report: 
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(2616005)(82310400003)(6916009)(4744005)(36860700001)(4326008)(26005)(7636003)(7696005)(5660300002)(82740400003)(70586007)(83380400001)(8936002)(316002)(70206006)(8676002)(336012)(36906005)(426003)(47076005)(356005)(36756003)(9786002)(478600001)(107886003)(186003)(2906002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 17:26:51.3407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b36319b1-ae32-4930-8697-08d955dab737
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5836
Content-Type: text/plain

Add nativesdk to BBCLASSEXTEND to enable recipes that produce files intended
for host portion the SDK

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
changelog: 

Fix subject line layer information. Patch is for oe/meta-python layer and not oe-core
---
 meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
index 6be27f7..a6436af 100644
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
@@ -21,4 +21,4 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-stringold \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

