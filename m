Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13084.1793628431256015536
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 06:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=TzKmhY7R;
 spf=pass (domain: axis.com, ip: 40.107.130.14, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOFYn113aSmAmCZovPm0+U11N253Ust2r92BYAmVaaYK2M2O8mWLTxHLJIH/Pe1/SdwtaPoAkDIjDlTD6Q5PvbtlzuDkiAGn4PCuQM43jBHB86amo5hPpKZSP1DkkgyrvLJO0S1cDde8OX6c6B0q48Tdxbofsi16Ibwu+Ejmh6g6G4+YCuBJqCSFj5HCQOg348XF1f0hLXDx42y7HM5Ern8aRMUNXFWAIv8CQ7VeT7GX6g4M1ZHVoiR1wUvqUv86YNLYyiDrjDyvW/2VpHUwOnDmeCd5BHkqchGj9hIBzN/PAtZ9MR2Apxzyo/qzj8DCvT2JlTYdbh62Bl+agFNFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7l+T8d2hI33LjawCJdzgIXc642PvX7uPt0I55jaGWE=;
 b=noyiQM5CIgBleHAXKOah16FfBLvmKDfyEjeFSQiNErjZWZucRYzUicnm1vzlYmq+MKlCjgFktZes8iMux8VwQy8WxJHQ7ZkKKzVJLwXumNGglb5zAWfU+2+sb7wBfH6jgjYw0VBhKXzeCl6BoOEQnkjeJ1uCR6XE12wcC08mSXg3Yy6515AzEPg7OZbxMqvMYnBz68Uz0zDMmYyB2Uuo23bT18WQC6fcw0PYEigSoH/OfN2b32Ut/dUmy3IVAhGA7Mmkbni8uRlPGjgvDy/bQcrno/PkHIL4ESzgsXjy6V2T2D5Ufih6bxa7MWCnM42fbkXPpWgD5vwkr6zQziEmrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7l+T8d2hI33LjawCJdzgIXc642PvX7uPt0I55jaGWE=;
 b=TzKmhY7R6rrP0Pw59n2e/SdcfMVsAqpLJCT0TmmCY8dqU/sIR6RLG6D80IZpQ9szd+OAARlmLVGrqZATTO0e+VA5evqGKdEnxWZLP/IeBEOJ8aYJf71OpG+lXjnrgMW968QLPL1gybsAqygf+UNLYsKkoxac3O/aF9dH8ST6i8w=
Received: from VIYP296CA0006.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:29d::11)
 by GV2PR02MB168287.eurprd02.prod.outlook.com (2603:10a6:150:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:07:05 +0000
Received: from MI3PEPF00008487.eurprd02.prod.outlook.com
 (2603:10a6:800:29d:cafe::29) by VIYP296CA0006.outlook.office365.com
 (2603:10a6:800:29d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 14:07:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF00008487.mail.protection.outlook.com (10.167.240.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 14:07:04 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 2 Nov
 2026 15:07:04 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 2 Nov 2026 15:07:04 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 1F58B7A
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Nov 2026 15:07:04 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 1B611129837; Mon,  2 Nov 2026 15:07:04 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] libzip: Inherit lib_package to package the tools separately
Date: Mon, 2 Nov 2026 15:06:59 +0100
Message-ID: <20261102140700.2707257-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102140700.2707257-1-pkj@axis.com>
References: <20261102140700.2707257-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: peter.kjellerstedt@axis.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008487:EE_|GV2PR02MB168287:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2dd290-92e4-4b8c-9e7c-08df38ea92cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|6133799003|10067099003|18002099003|22082099003|12006099003|20052099010|56012099006|11063799006|261021123027099003|261021121427099003|261026121527099003|261009223027099003|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: zRGKXYMLBORJGKK3sr1f7q32VeMKEGgKGNOKmOEhNCG4vMfvEIPogiuh8P2Jdt5Ec7DdMWUNnxphPkg2jVxshEu11AOSNnfZVnC8A12Dd7WdnlM55NL1UG+ch17JUZzxN0IqsSrIWZYfViG0Z/AiPwSQXKSwpfQxy98Retyy9uP+g+VspK6p+oTir53JESBZse4LUKitiSaxITkFzGLGK7F3Ua2jVLAV2Q/j++m6ScYorBlxUHbIBbBjrxwvkVBY+ccPWtrRnp+l9/pWcMtRCWifqHkH6O8s33VfBWzuq5l3GHhJrxX/4DiXH4ffRqMNIu6ymCdI3Dr7/moxN0F+xfoZ3P8LH8G50oxYOo/JMLLrmYFgbUCzPy+mOYZ2VZdtQbB/1S7wOF1AuO/Qj6xgaRmTYtWZYg5q3VQ26Mt2MZjryzcBOQlC1XyiAcv/qYpY8heDAIbwlVloiE8eFyR7XDoFVdZFcOeK8ejhXMi2WWOFQPLQ19oOVypfqJlmKiXNnPv4OLXr3p2/BuF9HcLtNJxu1CWngqiNjcCG2MyVFIWDJuxhhQ0FNHUbqWHRC2P/YWy8ZiRKcVD4w26Xq/+0PmtjUgHQnj2Rcgf45c8i4Cghw0MnR76d+WCG9cHAr/JVATKFWEy9V+W3jVKZbc+Blw==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(12006099003)(20052099010)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261026121527099003)(261009223027099003)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: e3VwCLvPGnAwFua39kbc17DS8pYUJE1dYLvqt2QJdhEPVSoQjaSkDFPfEqYhr1uH0RkdUZ4f5azrlPizvYvQ2O9HflRKGAI6ZNM9JdQ0yvdsHYhoY0Iz5n1G52EWVIR9wzQ1y5upFnvWmQNCn9QmHv6Ba7gBHkgafCQriRlPt9Zz9NK4W7/wnF/3R9pt350r/f7a5EHvmfSzFYF4vlybbMyBlfp4uNHCr89YN26l1BwbzmFkgT7CncdD+XX7ZbZuuQ+TRLrqznBK2Y5RavmqS0LWuKYAQN27/ZQmNnUXBLezC9MrmmDD7EcxWSAmsCO0/5B1w69alwMNG4w+p2bbSh7Ldv84CiNh6fVZuNxwx7VHmZtbyDXhwzzrVGfWrTpN4jwMHGLO2SOARkganC0L+zUL1AnibpDJfmpQgT7dCblRfdYm/LtdrONbQ772IVdm
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:07:04.5587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2dd290-92e4-4b8c-9e7c-08df38ea92cb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008487.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB168287
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 14:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249208
Content-Type: text/plain; charset="utf-8"

Recommend them for backwards compatibility. This allows them to be
skipped using BAD_RECOMMENDATIONS.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/libzip/libzip_1.12.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libzip/libzip_1.12.1.bb b/meta/recipes-e=
xtended/libzip/libzip_1.12.1.bb
index bfa23b6d9b..900f65b531 100644
--- a/meta/recipes-extended/libzip/libzip_1.12.1.bb
+++ b/meta/recipes-extended/libzip/libzip_1.12.1.bb
@@ -15,7 +15,7 @@ DEPENDS =3D "zlib"
 SRC_URI =3D "https://libzip.org/download/libzip-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "c40062022a1963c80573d48f6070792297cecd7c6bffe3aefc=
ac0d8b9bee8913"
=20
-inherit cmake
+inherit cmake lib_package
=20
 PACKAGECONFIG ?=3D "bzip2 ssl lzma tools examples"
=20
@@ -28,4 +28,6 @@ PACKAGECONFIG[tools] =3D "-DBUILD_TOOLS=3DON,-DBUILD_TOOL=
S=3DOFF"
 PACKAGECONFIG[examples] =3D "-DBUILD_EXAMPLES=3DON,-DBUILD_EXAMPLES=3DOFF"
 PACKAGECONFIG[tests] =3D "-DBUILD_REGRESS=3DON,-DBUILD_REGRESS=3DOFF"
=20
+RRECOMMENDS:${PN} =3D "${PN}-bin"
+
 BBCLASSEXTEND =3D "native nativesdk"
