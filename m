Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8203.1793796415211451445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 04:46:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QuZp/Mx2;
 spf=pass (domain: axis.com, ip: 52.101.72.28, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFcHydDft/VXVviJaYwkqj/GaTYd2aj9E/ggdQPCR5Vf7mTWl1ot3YBzgTJPaMvXwz6YN0rhl56l8xLmfFY+AJVTtd+oNm989T31xE+AQci2DR662lQlaDtSTLqgELOnQ9DpyMmLuHiPqzR3CDLgkiQaxlW+WlQtp3ymhitAr6yZ9Eh0pLUYdxEMQBfyn4zCO8zAa99Ok2AiREswdspkbZwqn318O9C4SJnZ80UPQVuSqM41Y/TYEgTT2vRfomr16k/y5RAa1Ga0moZWigKmKNf4SURMaSoR8b70T4VslTOlLxCm50+/EbfOaLFLg+08eDdeyGW23UZhZZAzmw+kxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98t11d4ioYVj06gsvOQPzUQn+AHwTKsNzk6vTVyORg4=;
 b=MWs4f2OW3aI+MhN7scUEChWOUV7JklO/hNtPJnVrb7bcq3BPNTDKNUaOTxLRCHGxMDwqBmRBAGLBMCwym4Jzyi8US6zY9cEPoNu1gX0yxQ8OTTwr5TKP2KpEjjSxueoA3PaQn5BkN4/F7NO+TZvmDc85p6w/zpFXu/+m2PyatghouBfCSKXgZr3qESRS4yHjPh2FTcMmczXIM94DfAiM8ZipY6h5BI+4GIQLSe2wjqbLXpFtosAspDUkTnFJASjwHxdjycEvaWmLZBI9Ob7tFkcFNF/CvFaPbUzsLs5qGaSYD6mwJpcEJwjsh/99lF7tLfkM/LivIFwuxywVA8AfGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98t11d4ioYVj06gsvOQPzUQn+AHwTKsNzk6vTVyORg4=;
 b=QuZp/Mx2yudHyLiRSCOcxDetvYrRxCglg7r7wygcVqzZ3ycMRty2d2azaFuPGiD3Nr1ROCb2nrzPMNGGWnCh8CMIbhVed5jGlmLLZk8EC6fq/dEqzdJUQIWNiA42nHXRZr0UmgPZTHpWLzwOgydkuFWsGXijzM+cEYQPQxyBVo0=
Received: from MA3P292CA0006.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:2c::14)
 by AS4PR02MB8182.eurprd02.prod.outlook.com (2603:10a6:20b:4cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 12:46:49 +0000
Received: from MAD0EPF000008B2.eurprd04.prod.outlook.com
 (2603:10a6:250:2c:cafe::ae) by MA3P292CA0006.outlook.office365.com
 (2603:10a6:250:2c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 12:46:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008B2.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:46:49 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 4 Nov
 2026 13:46:48 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 4 Nov
 2026 13:46:48 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 4 Nov 2026 13:46:48 +0100
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 857461515
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 13:46:48 +0100 (CET)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 818935287280; Wed,  4 Nov 2026 13:46:48 +0100 (CET)
From: Christian Lindeberg <christian.lindeberg@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] go-mod-update-modules.bbclass: Fix no licenses
Date: Wed, 4 Nov 2026 13:46:40 +0100
Message-ID: <20261104124640.4050362-1-christian.lindeberg@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: Christian.Lindeberg@axis.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B2:EE_|AS4PR02MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e1e20e-4341-4523-173d-08df3a71b183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261028144727099003|261022105027099003|11063799006|56012099006|261009223027099003|261021121427099003|261102123227099003|261021123027099003|261022075727099003|261026121527099003|261026140227099003|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: ksLfB1LBtkVIoi1uK3yLevp1uHkH1NNYO3DILG86CjXiM43KwT85gpRE4HGz3enL4D+ykHS1U/+83LZ2I8iiRzDXb6iYOfcLTdlrkvp6JAHb8wCkSn5CDpKUuAvAuJ/MUWU/PHyaNIwYATvcQtGxKcnpvi5NIVXp8Q9KsBLnrQm4F0lGwpU1rBuIsHjnlTtv9iajwPhZIfm31Ii31iy3pXHkT4OhVviDJsKHBXeNSHf1UuhB+Cgmlbc9UXlmTBXQOY3SeZ50fpj2B2g11kcttk+CZ09MMIpKIOKdrQ1g+BFrqL3tuuRrpVLRdOzI0NHJuAj9NjoOkuxICWZPebMCU1vb9uKNo7v8rqpvmhju0lOzyJ3sfXAoQREb3U/DRpwUTy+kgUPO45rroJRh9UTDtO3gSXa4BActyUKgf5jup6uqXvsFLzXJ6KujXNlObwls7akgJphrLMXPzrzmqTzddP3xAZa+qHgel8bpr+p/AW8b+4MSww2TI7tpdeq/bSehCLipGfF6Y5z3Yxm+uX/1+7qJYnABiuKGeukd6xopHyQirND4SZF+hvqGUf0ZCm+N7U3r2fO3lSzNRLlYA0CFXR20fOVnfn5Rby9UkX022dzjCfQ9nWez/1S/mXMZwESFiX1LwH87pprXwYxNjDE8tsxr6eVOytjrlMK9hKCEQs8=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261028144727099003)(261022105027099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261102123227099003)(261021123027099003)(261022075727099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: llr9+Szueipr6hxdNgSrKL4ATbNcxbRQITBdwjGKhT0FzZEtyyPQUFw0YrnUzc00b6/W61NfooKXJ/ExqN6MCqX07yWFRudW7Cw8rSA4r9jqwMs1Hss8V94Fm1cnosGdwBM9KVpS2kCrzUG7EmGI1PTvTj7oY6VNkrK1v7f+d+QA6HbQf2EcvJcWgGF61+8kaKeyurtwntjoBeGhghIUhTKX2HipS76wK2YTmBpdAtUtmY/ea6EzrOhBdFS7uUhMHx1K+pReY+pOFfrum5yCssexhglBGe5zMOxSqqLsQtxPptlHDlBirJcxRVeyNbn6EHKe2tsPtnZ9l/K04/yMD7ctp+mCWwLImDJOlbAnWstVT4j1u1UNGtEtiKOaPrnJM1E/4qz3Znir5qaBQzIa6Vk5lVgJDQeCr6sBA5b3Drob3vDmn5YCoe0OuDprkOS+
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:46:49.2843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e1e20e-4341-4523-173d-08df3a71b183
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008B2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 12:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249375
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
index 435e7e30ff..fc618dd750 100644
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
+                f.write(oe.spdx_license.AndOp.NAME + ' ' +
+                        oe.spdx_license.AndOp.join(licenses).sort().to_str=
ing())
             f.write('"\n\n')
             f.write('LIC_FILES_CHKSUM +=3D "\\\n')
             for lic in sorted(lic_files_chksum, key=3Dfold_uri):
