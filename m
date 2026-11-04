Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7490.1793793278620088851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 03:54:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QOgH/gDX;
 spf=pass (domain: axis.com, ip: 52.101.66.0, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTOgxb+1HG4KWxnApdakYZxaA4pXqSuWmVblZv8RTdELwiI2zbjVLxO/TiHkjxVryJ9XdpzIXX2DwhMujoiTQW2VCmkw4jxFTzwOfSIcaMmaqCED9DHjExSyFcxF/9eJdu/Hdi804okqqv1y9m+NsSR+T4zyNsQ3gkvyPA/x2kUzeyodassoU6t1FPIwxAP22tC9q6FToG8tVBQ+XyGO/9nTGjZ+6xgOcN6vfLf+s5p1z2pSOZpU9lS6J9TI7z1ou3UNNoCM3ZPgUCxloaSUFGc38YT4RnqgbuhQ1ZSWK8nk279Y6BczV81UzToXKsEQRU8QlgIet1OW+6Wu6XtNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uR/K52Bwo40GSP8acoBfnkt1w4y1+HB03hh2xQVpH2c=;
 b=MHoojyKKASc+aasylTw3T6HTDoI7Yah+BBfVzLGJ6NwG+ibIAWN9KtptsQs/rklqnB1eHa0EnlY5+qND6ALTEaSSsoTFZRn2Bj10m1NJkQ7krUokxxnKoqsebVGm5SKSNENPD4V1VixLtaWm78GCJ0/KLdtGHd1T+p05f1K3dBSmIGoewpEtD8lEwhOeRekEMZO9PlMzT+98EKYqBcoNSdVvdbnM6EgZzItU5I5ijY0BtGCTfyJa0GkLu6XBuVhVNSXa96rexRH9oFcEy21LZz7Ra8PPVyrU7zunsd0fhBDOFbqwm4aqsKFoXuO+md/srUmi6pe5IV2kL5eqr7KzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uR/K52Bwo40GSP8acoBfnkt1w4y1+HB03hh2xQVpH2c=;
 b=QOgH/gDXPm1VHKadBIIXH1awHcnH10sAgB8yq2Sy56zP+kYqzlGsV6gp5bPjK4r4emlX01ByiMb/jW/9adMRJKuuzo/tp0JL3+Jwb5qJyqNkK48y2O/L3+zXk1JXHlWgKPyriPVUarGydCj3MVMczZF1ZVpTbZgKmZOcJ9JENBI=
Received: from PAZP264CA0125.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1ef::16)
 by GV1PR02MB10528.eurprd02.prod.outlook.com (2603:10a6:150:15e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 11:54:31 +0000
Received: from ZR1PEPF0000E6B2.eurprd05.prod.outlook.com
 (2603:10a6:102:1ef:cafe::85) by PAZP264CA0125.outlook.office365.com
 (2603:10a6:102:1ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 11:54:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 ZR1PEPF0000E6B2.mail.protection.outlook.com (10.167.241.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:54:30 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 4 Nov
 2026 12:54:30 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 4 Nov 2026 12:54:30 +0100
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 208111940
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 12:54:30 +0100 (CET)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 1C35A5287280; Wed,  4 Nov 2026 12:54:30 +0100 (CET)
From: Christian Lindeberg <christian.lindeberg@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] go-mod-update-modules.bbclass: Fix no licenses
Date: Wed, 4 Nov 2026 12:54:09 +0100
Message-ID: <20261104115409.3993303-1-christian.lindeberg@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: Christian.Lindeberg@axis.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B2:EE_|GV1PR02MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: 06787e9b-1703-4d97-3cec-08df3a6a62a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261022075727099003|261022105027099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: TdTxcNUTDc2jr60C2pFwLphOnAMIioT83W9auBcwJDDv9qnBI249XMRKOc3+X12bscBI+sQ2Ulldmp7J3659lF/CS/aNNSOYDqvOTWlP4PF5aK9qh5p26sodWZgqWjvrv1LBMvY+Xxrs9MTDw7mCf1vUJh8+Qrng0VjtJ9x6kx+24naDJhGqFBvg8VMBFVJNKgOjDne2Lirqxe/kSzOMRJIIUwR7Z5vo98MswciVyHqQ1pseB148Y9FgalRjfQT3Qk7HiafwiEVlvYmrJ+MTgzn68RiBsx/TmwDPgvlOnK86hEqVh7tx9PH6GB/k6NGoV9LCyPihkpFxvg32mn2/2zqlUQ8Nknw2RGanh9g4/bK5LF3keZ9kE0RsF7MsdNmTglzaMcRN+Dtj8ZA2ctRsXd6xeybzv51v0fhouSP0wE3UPJT5y+10BIWtxYbFoLcj6EE2P6wEndF/RaVUsGtfp1VAPJVQ221SRgp8o9j6oUdmmrTa/uh3rZeHJJKUH223P4lLRr3MFuVA+GvVZxQISiqXL676N9J7kpxzy3cXeX3Emt6jNZ8Ajbvi413uPrFNiGuzH/v2bK/s0FmhHfHy2/apenaDAsMYpZZ+sT50vf4jKEVNFxrGf6xvDC9G2yLgwXRl4PHszt7j6CwBOPyj9MjBPRNwzgnMb4k/PauB6G0=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261022105027099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: USX7FI6XFviJl+9NzlpTkLo7VHMtId1Xbuhz6kwzX8hTp869o3uYPLodms8w2mbVoGXPjDOOafpFp/XG4w/luZ6noPEEzICVpdk1Tq5citeroZNAYjudlFeWCbuHup6nUjao2ELxo9dcnE38WaGo2jlj7RbZfB7n8Fb0BHvaRw1Unqi30R99Wclmkbvrg6QVAd4JtdDKAgt6PZuNK+vU8cBfvB4oTXgubT9GixCB43Mr5e7BgOqp4LGnWg5HA77qsGGCKXiK5l4uzHSKKrvdF39YKdsJz2xx5IHdlZUTcTOyolpSgUvlEU/QmPwViWF5F02Qnnpm9qHQuYImoSO2fIMazSUxkK8NHi4hPPKjJd2IF7jVtBpX1utWx5v/1ZmOy9+kC9HrNI6BTel2kTLiVBJ9YnRvLltrxcmpUukT8Uc8uTv6C/8RRsB6VBB3xSuZ
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:54:30.5274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06787e9b-1703-4d97-3cec-08df3a6a62a4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10528
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 11:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249372
Content-Type: text/plain; charset="utf-8"

Fix the no licenses edge case where a trailing "AND" gives a LICENSE
value with an invalid format.
E.g. github.com/jstemmer/go-junit-report@v2.1.0 where only the tests
have external module dependencies.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 meta/classes-recipe/go-mod-update-modules.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/go-mod-update-modules.bbclass b/meta/class=
es-recipe/go-mod-update-modules.bbclass
index 435e7e30ff..4c88b92f5d 100644
--- a/meta/classes-recipe/go-mod-update-modules.bbclass
+++ b/meta/classes-recipe/go-mod-update-modules.bbclass
@@ -91,10 +91,10 @@ python do_update_modules() {
         licenses_filename =3D os.path.join(thisdir, f"{bpn}-licenses.inc")
         with open(licenses_filename, "w") as f:
             f.write(notice)
-            f.write('LICENSE +=3D "AND')
+            f.write('LICENSE +=3D "')
             if licenses:
-                f.write(' ')
-                f.write(oe.spdx_license.AndOp.join(licenses).sort().to_str=
ing())
+                f.write(oe.spdx_license.AndOp + ' ' +
+                        oe.spdx_license.AndOp.join(licenses).sort().to_str=
ing())
             f.write('"\n\n')
             f.write('LIC_FILES_CHKSUM +=3D "\\\n')
             for lic in sorted(lic_files_chksum, key=3Dfold_uri):
