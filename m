Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14129.1793088747742419127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 01:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gehealthcare.com header.s=selector1 header.b=fNEwgNRq;
 spf=pass (domain: gehealthcare.com, ip: 40.93.195.12, mailfrom: maxin.john@gehealthcare.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyK8v4+btuYpr75kF+399+4ZrbE452wpNpJJcMBadrZRwCZ3BJJ2mjxh69Jm8iibs9kyXYkzCPIFIoy1DvCgf50N+PDqZnR3dFYAXAHXvXP4bXVVYhRTO6n7VOzbdhqMNX72pFhI7l/5aqo9RnfTsf/ZgI9cLxmcDJdG6M1NBCiZqLIm300IX6j9IRbyFGFPx65q/HCh5/lMs2yQvGACMvjjuW3MlvO1t6Ui9AIU6jZpLukdoU55Q9iJn1sDe6Igxf7jfuSCW4xpw6Iv3BHLJcnjyTip3CGJtTmKWuKIAQUKcB46dn1GzbARWPvY/oU09nF40SggYUSOqRobNy2WPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPSzIKpMdlEB6/clgEoNYdgkDQXIwaeot1wyVTiQ/6I=;
 b=TQcen0oKQdMdGIoNQDGcM6nNqtuhdqMfmob85u/tI2yUn70zIXv0iMzgvKdEjRrLO8nLdgN516x0Wqpx7TxntIL0uFy+niDS/yNeRquYpgRKnvJacM45D8rgIT4lxJYNFIhwevd9ak6ssffB4UK2nCR7U8nn8IrxNH74KOkMkKGpTG6p5TE9Hhj7ywWb0VWYEjnyO/vv3aJYUuXpJFclpULMgSpZAmDRbTyqkWpEUMWuFUPr8zS1gNfFp6LzS9ueZkXXYuC6/s4FOkJ+3x2zacnJzO79IpeEJDqRaMBijBnF0taYtGO1we0nNVe55VT+ir+rlv2VNRQAK52YwE/5oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPSzIKpMdlEB6/clgEoNYdgkDQXIwaeot1wyVTiQ/6I=;
 b=fNEwgNRq4++gczssc3VwzG9FCWPM8km8vWHkG4KNTgPUGFVRAvRCCF3hiezEpUQRPCa9OlOWNnOw85v/tAwXg4aHCDSnbr4BiqI4M48Tz5vssMCdx7ogrQdW7+RCxRma/pZ8u0QSdjitS1VKblBgRhFvLNz1ICxswhkUUULbaen84i8bjcBZ0oL5BoG+fKz5cVTV9n+M9E/YulL2D5uVHyFUUADexCqoL/7GxJT99mTbn7PI/kP7ny0Q+klD6YaYFTdQT2a4KPFgzsGgFW+bT7ifMzmUabTPoZwKpjl9iy8Q8+sexcDN6Ki8Ev/1WiN6WYNLhVqEjyHnvMkll+IGgw==
Received: from BN9PR03CA0598.namprd03.prod.outlook.com (2603:10b6:408:10d::33)
 by MW4PR22MB3072.namprd22.prod.outlook.com (2603:10b6:303:16a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:12:24 +0000
Received: from BN3PEPF00022BDA.namprd03.prod.outlook.com
 (2603:10b6:408:10d:cafe::8d) by BN9PR03CA0598.outlook.office365.com
 (2603:10b6:408:10d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 08:12:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 165.85.157.49) smtp.mailfrom=gehealthcare.com; dkim=none (message not
 signed) header.d=none;dmarc=fail action=quarantine
 header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN3PEPF00022BDA.mail.protection.outlook.com (10.167.248.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 08:12:24 +0000
Received: from d4c77ab47744.fihel.lab.ge-healthcare.net (zoo12.fihel.lab.ge-healthcare.net [10.168.174.110])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id D032427607
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 10:12:21 +0200 (EET)
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] uki.bbclass: remove unused glob import
Date: Tue, 27 Oct 2026 10:12:19 +0200
Message-ID: <20261027081221.13-3-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20261027081221.13-1-maxin.john@gehealthcare.com>
References: <20261027081221.13-1-maxin.john@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: maxin.john@gehealthcare.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BDA:EE_|MW4PR22MB3072:EE_
X-MS-Office365-Filtering-Correlation-Id: 920df070-b93d-42a6-153c-08df3402085a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|261009223027099003|56012099006|261022105027099003|261021123027099003|10067099003|261026121527099003|22082099003|18002099003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info: Ke1ljHerLpgQcctEIBOOuKEe/8+ZhdIu2Szd+c8OrM7SA+X8W4qBFXClDNY7QeK8yXHJzuBpgAlxKCbWK1BNJRjQln49VuBr1xe+AnlYtY2mQ705VsybwPdwvoOzTpY/gY4cJKKgHiGYMdabKgYf/4fS/co5SXW7d5M1nnoNBysaDZgZisYW8qwO2mCVwJr2asakZ8U9v2SXpr8hwTEI95bBC/FuEl75DK0M0mwQ5cVXhkLmNaiUDTDYZmJhmJst10Fx8RaievoxZkHmsQZlMWItcVi6fKZbJClpd5KuFvk47hgKG7UoQgP0h6/HAkyFwLeJPG/E6kM1K70JKpArYfryonD7obUf9AsFAg8pVMiZYSS5MClxIjgTX04JrN/FNx3vYyPJc33FpHeqzS2VvvMURwPIrZ5YXChN0GClU8WiVwVtri7GKDKAwflq3RFjTixhkT+wdhJCsp4Bu1BPcsT7sqR1rB3wXwSfeIx4IOu8vq9JmElXiInUdU+i3AUMhcaoFQO66vd8+4byT5pRhQfVO7cF/lA20FX0LZvHKOhwxeKKpXv0syH33lgYzh3sBEIAOz1pP2PbKKWhpbtpCNrZASjzlueDBhMdZx1YCjgs+KIqQrM8wsUr7LBRIdwDcGfN12eteCS4VlZiK/mfmOn3be+PC6cuWPhguV+MHMSdxSor0sWx8Wt5lzZ84JZoVjEbJCR6OJt9A7XqcdP2vA==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(261009223027099003)(56012099006)(261022105027099003)(261021123027099003)(10067099003)(261026121527099003)(22082099003)(18002099003)(11063799006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dOGabZfT5iwcs9IthhapxSCnESukxW2XsI91M+HHD9uWkSzt4mDWbDv2g0u1mSRr9DTwcp9ZgjGZ3esvzq2Y7w3WZ7eIHKbJfAtR3r6+7dpSqcWP2KrVWTfePexlZshrPet/hQQbgOYWwYOAc+FYsA9TOzEp7BJSSqwQuWUZrp8HdvgoOocWQyWVUT49cLVGeGpY60YnZSuK1GSTRFPOtrEuPb0LpwQR4/CVimkWQOOEvQeTrjBibP9hPZXEhmuHumuAYL1HXM98yPo6KwnN5q43FSnJi4JYCKmIirkvOGb4XNUWbQJcKK/v0fGDvKnbJsazZ8CfMiCtfQEyFVc9KekyEF7RRwecMDeUMyLIoZyxLJGFUepGB20T1PC12qMjxDF9WsSG+141vegUbdfUYtwvQUC+6nr01hvEdUQV1R8jgC3uLYhZheC5u/2FzWtO
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:12:24.3061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 920df070-b93d-42a6-153c-08df3402085a
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BDA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR22MB3072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 08:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248715
Content-Type: text/plain; charset="utf-8"

glob is not used in do_uki.

Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 meta/classes-recipe/uki.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbcl=
ass
index cfb930e93d..39e1815644 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -107,7 +107,6 @@ python () {
=20
 # main task
 python do_uki() {
-    import glob
     import bb.process
=20
     # base ukify command, can be extended if needed
--=20
2.39.2

