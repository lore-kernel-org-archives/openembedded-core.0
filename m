Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13085.1793628434411285528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 06:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ZW7vhnr9;
 spf=pass (domain: axis.com, ip: 52.101.83.20, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fil1H5ozPAoEDId4TWDPTezCox2RK5KuvpnhElsGsnRy73liUcyZZYVNXUpp+tPYp45yqeUVLiUrj0cW0Jz9Ln3bhI97ukGGPDqC7fvMXQi7yjWCzOyppjxBzZ3iSC8Vb4+5SfrMPXKwTfW3UkjsVa7N/C68aF7LaKJTgFkDnm5rIZdH1XQZJ1H2sMrBPvzLD6Eaeku/2sxJCAC6dGKYqbV17sZ3QHlPpfd76q0KncuwipTzSDws4WbKUF5g4Bm1h2V59S57C//iPIt9oO1ffVMF+HQAapeZjE91zAdCti8xaTmIj/jEn3FaJKm5SCFx0pODO5/RbTKEQivTTc1uAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q34zhHawW5GLkh1AIEkrPwD04wbxPkXSzHJtgZLaFrw=;
 b=iPXawyWjYjSuuPXWfKoxpV2v2aT9WOcjWD6kpsNEDwxFjWtkk6UDjbchO82Atm2iliFMcZsrKedlxRP3HsOujrhAZlCHJWdG0DMMWZCZPiqgfnkPCiavyxQV/ZR7bNHP5zEAPoIeJYoHL/wHEtwglorJkgteRpkOvfZsQ3aWY4jXl2JWUrxaDmIuTNLPDpSpJgk8uAKSaA0KnfV8vTFI8wHHNrOyki5nxxWEdlKes9Q+4+5oj1CIJxn318ilSlktXDV7/Pn7is1LyN3yJM9LAJkOvWFmyiQjCysbh40gP+H9qNYA9i3hBJsb59IaIRvya7TPBT+ruqToiJuyyRROhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q34zhHawW5GLkh1AIEkrPwD04wbxPkXSzHJtgZLaFrw=;
 b=ZW7vhnr9e4Cc78G71fXykEJQKuZxq1VFjBh7s0mGfJRNkwTLylrFsYKqttzSihyAcLCvJJHEJ0YegxTaUOUF0E/9luaCrWG99c05XZaqDMB32/2MPZGTFXh8Nk2bZs6n6o2KYNueYTzIIPzAEK1sCFSFgrbNskShfhCZnAlnOcw=
Received: from VIYP296CA0009.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:29d::8)
 by DB4PR02MB8726.eurprd02.prod.outlook.com (2603:10a6:10:381::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:07:07 +0000
Received: from MI3PEPF00008487.eurprd02.prod.outlook.com
 (2603:10a6:800:29d:cafe::58) by VIYP296CA0009.outlook.office365.com
 (2603:10a6:800:29d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 14:07:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF00008487.mail.protection.outlook.com (10.167.240.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 14:07:06 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Mon, 2 Nov
 2026 15:07:04 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 2 Nov
 2026 15:07:04 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 2 Nov 2026 15:07:04 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 21F62456D
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Nov 2026 15:07:04 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 1EE3E12BB5E; Mon,  2 Nov 2026 15:07:04 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] libzip: Do not build the examples by default
Date: Mon, 2 Nov 2026 15:07:00 +0100
Message-ID: <20261102140700.2707257-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102140700.2707257-1-pkj@axis.com>
References: <20261102140700.2707257-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: peter.kjellerstedt@axis.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008487:EE_|DB4PR02MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 633b5e87-c335-4978-cf9f-08df38ea9414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|261026135527099003|261021121427099003|261021123027099003|261009223027099003|260925021311599003|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: 5ONijq3NbgpqgxLt9LRe9Ytblav4z71UGid9AP4Im3ZJ4lEbe9pbTRD8MypjezlRJcyYAARcPeUbomCZK2LhIKqmEBYdnRPwWz7hWH2E2m2wG5eDLt+zxK3lZqEUXI3SIHRaoQ0LOU8mr2XpzfGVidBDmziOMxKIHka5rrbmOxFOCNdd9W9Rzxw8olTykEVFROLws4xVPW/Vl/PMVxS+qAaL/LhjFYowGo+KvSGwLzioOdpWRVylipd2erGC/wIIPct0d8uo6tibUbNwta2HWD/ro7RParx6zqpDNg/3iNBNB4iZ9qxcXnLBVX/5F4pu+twGGCA0LURVafidPTgRE04CVw3zMBjkLtXje8x93jhtv2QlgkIClZRLibNzWN02gRJcUJFxidmxyU25MEB6GiENUIvmLUT0zM7YyYqGHaCMe4c9RjkcEaT3NXLh9G2o5smXZmu49rzzCJ8s3ilPzv8Md06UTCeNRdsgdu1r+mWQGQac43bQQFkmxDsWfjnqqHkYk2r74IeNCCY2klc3YGMYJfRLKRcUdU7D5RVUl6oXYzr/DFZnfB9yU5ET+rOcYeFDBnsOTTvjjZE/DGCKtHMDhZ/ZT/jj6CUpuSw4qHtF+92rj7uM5/dHLpHG/VCZ46q3rhjHsACATaa5ZorjhBzlkwth+xAs4TpcOKPJLCUS5pYDmWQ8ZAVsZJbEWWJuJ+Qqpje/ECQQGgEXxh6mjA==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261026135527099003)(261021121427099003)(261021123027099003)(261009223027099003)(260925021311599003)(260925022911599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zyEFro6rqwyZ7B2ycm4tMHV91ckFdlWGl2reP8YWZB9B99mSR72049AJ7ujrnaptGKenffoAzGamgNGFSzUunYQTlu2UljQXEs46DV8x7xWNdjir3dxf6H5eZnkryEzLrc2PF28wneyBGwgkHcvttna113THFZeTTDclth1sqXDrpe+UIMBlANVYF/fy2P9BhfIOvdpg5kDaNz+hmp1X99kgQ+VBFgD8/pmAhaGyEKpP9XqOpR5pkEt/aHIampXvsnJd8bfmGgc5ptzaeb8ekIZXykbAFFh1Hhl+D4jwEKq4FcCiEnuU9H981cC9wLDEivkpqySvNNq99/pDKdVpEswmMGphC9zdUlgHojEkRAYYJd3oAPiDNgsxH9Fk5dRf9lIM6c0z/RjvkeCQi6TyoeU+de2ok2QOIQax3jF+t6JBVvNCIVqXKA9Z4lkHUMV8
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:07:06.7145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 633b5e87-c335-4978-cf9f-08df38ea9414
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008487.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8726
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 14:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249210
Content-Type: text/plain; charset="utf-8"

It just wastes resources.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/libzip/libzip_1.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libzip/libzip_1.12.1.bb b/meta/recipes-e=
xtended/libzip/libzip_1.12.1.bb
index 900f65b531..2a045cc565 100644
--- a/meta/recipes-extended/libzip/libzip_1.12.1.bb
+++ b/meta/recipes-extended/libzip/libzip_1.12.1.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] =3D "c40062022a1963c80573d48f607079229=
7cecd7c6bffe3aefcac0d8b9b
=20
 inherit cmake lib_package
=20
-PACKAGECONFIG ?=3D "bzip2 ssl lzma tools examples"
+PACKAGECONFIG ?=3D "bzip2 ssl lzma tools"
=20
 PACKAGECONFIG[bzip2] =3D "-DENABLE_BZIP2=3DON,-DENABLE_BZIP2=3DOFF,bzip2"
 PACKAGECONFIG[ssl] =3D "-DENABLE_OPENSSL=3DON,-DENABLE_OPENSSL=3DOFF,opens=
sl"
