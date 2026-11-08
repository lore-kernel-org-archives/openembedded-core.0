Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.449.1794156941426519039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 08:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=qD8vQmtu;
 spf=pass (domain: axis.com, ip: 52.101.65.36, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWXfYMjzTmYFn/ImTTp0jZZUqrfrM23ns4zvrUrMyIdabSPEzPICKfTZUe1RBEg//fd/RF5it9TgXfJDlDIe4Aavhc3/JQffhg7YeOlvWrhXKx/Y234D8UjaCSWrv1x6InsIkWfigpxpvncDOYRQUMziNaOKSpiY7zQdJPFwEjYNL/yJ0D19g+Q38HR5m3TyPbJc9/RrfL3yCjnyYHXTylhFH4d6n/LaqYXqTrspAQF/vvdDc0Bj/NvGwlQSQBkYeqEaLdVSK7gZ7x4spL3BxruXS9SE+a/sJZiSDRhA7mNB72PKEbv3mHR6tdyxfxiUXOBWt6LWxl0g8dkt2C7yKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ILSybGRi1rgJA/Qu3DsXW0wjQ0XZIZxdR7P1oTd4mA=;
 b=yvuoToNAsomuYiq/7AKDaOsIS+zxP86Q9VPW6WvdYr0v9NDIscF6OZURGtvLJPNIj2cC5MyoQf4crFd9kr+FfVqOT+Xw2eKOBjpbSWUnwIP/KYM8UUHyNUgW//1XPncfdwu9urjfaXRuCXU6A2Vhpu2wYAvriEi6yxo0iEE9nYON1TZNEAh6+M1oV+5mTMBaIC83jtoxsC0/fJTGF97BScq44BAie6nCkF86oITDt9/wwOGXlpDCVbDHcfpIxMIBY5rkT2OgttXva/wAuo6pMttCdH/BnbnNyPW1MAO10482qJUvUu9SuxtqJLm20sqg2JQ6nc9pXRhmsiTs1iclqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ILSybGRi1rgJA/Qu3DsXW0wjQ0XZIZxdR7P1oTd4mA=;
 b=qD8vQmtuHJ3YjE0Drb4O6IBK2MkohhM80lhPlZ9eS3Twrm9Y03gGgS1U4u8r2SVvWFa3GWcH+Vqd3GuDukVzUilqzFZ9jZvbXbYIQxAbPI23u3GcdRpD72SmEeTxvUGgo5qcuBYt+cZsH7OxvXWSXa2Pu/EioXNcWJBRFkNpw8k=
Received: from PA7P264CA0125.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36e::7)
 by DB4PR02MB9358.eurprd02.prod.outlook.com (2603:10a6:10:3fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sun, 8 Nov
 2026 16:55:36 +0000
Received: from MAD0EPF000008C6.eurprd05.prod.outlook.com
 (2603:10a6:102:36e:cafe::15) by PA7P264CA0125.outlook.office365.com
 (2603:10a6:102:36e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Sun, 8
 Nov 2026 16:55:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008C6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 8 Nov 2026 16:55:36 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 8 Nov
 2026 17:55:34 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 8 Nov 2026 17:55:34 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id D7E531AA1
	for <openembedded-core@lists.openembedded.org>; Sun,  8 Nov 2026 17:55:34 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id CDDE912ABA0; Sun,  8 Nov 2026 17:55:34 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/3] libzip: Allow support for bzip2 to be disabled
Date: Sun, 8 Nov 2026 17:55:30 +0100
Message-ID: <20261108165532.648009-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: peter.kjellerstedt@axis.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C6:EE_|DB4PR02MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9b812e-c421-4f42-578b-08df3db91c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|260925021311599003|260925022911599003|260925021911599003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261026121527099003|261026135527099003|261102123227099003|10067099003|12006099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: iKIwR2jUJigqdRASJhX5wT2nuoevFFOMnqBLvWaa6WdO+u16aIIIfvmSgbMKOSenfUODxdt1mkTmAVHgGR2UBF2iS1GPm7AQj3GcqZu+3IBjxRnUUuyBebi6JYD4RLaLZeBWmtGI2WNEnbd4SU+bySC3LrRIRGX9iHHanEV/cyyV7lu4uAKJ2oS99QoIjxVYavu0jypuzlgRCgB561SpDvyZtKxOaWS1ZWLpM6tdLLPuCWB4cGzTmiWSYAMH152yHDb4AYfAAtPt8/2y290nKoRgvfRyYng1JIq+6m2es7kACOJflceswfk6X2NOL0M5/dLKapqfXC2PRWQiHePsKjt5umfVrqw6QdRZun7Af7/w6JUnSXNyrgOpOYKpU+ShqM4So/28n/ujU9VIr7PdHl3UmTUgl8hZJa3Q7IbLNYDr3txxxgqWmNCjyC4wIc0bWWW1kKid33QLTV1IH8IuyPpWm24LYMw5uVk3WZgJjl1+8Lg4FZ1Hqd7hEL7piH413yGBesnBhDsUlaboi4eFGx62Hi3b05+LmE/w0Ou9ytBLguLKa63I3RlkLURawgSHHHRTxzTP171WXH38Lg4FHcUhabOPAwgzNlnZkcTxjL0VvtDSnnFmFji40A4j/R0wFdYXq4dtueTfCTf6YoB4qA==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(261026135527099003)(261102123227099003)(10067099003)(12006099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: u6bm3Yyq9QN7IuKWPdxYjzNa8THHD9QO0UMUDA1geOoVThILsnvgkcIBzv47hpJFv/prgJyKpNYJZwiZ5pAbisc9gdqBluweBKmNR6QOtJE6C+unWOPu87Kp1q84bOASwG00HI64ZCur1ISltMLPrG5bZJgin45qcbyFanGQCUj7B6xbD/46bYd8d/IqhvZmIkWtt2L8DzGSqllByxWWVaixNNkP9a5A1C1L2lgVZ5j9c5Xf//r3Cg7yj69jj5H0pFII/XIWT1wkiwWetAEHxv4rENF6pUlC03zGZh5NMNSn1MLa1Ts/6keMLpNGGQ1FUJnhD8VtjREJML/EwLnqoC9pwoVtquxSwiKaQT6N/JRUo6CdYKLC982T2zSYuNvCXPF5NQhVC5zMsfABrAkjVyLmFNXWTw54p8v1TrdHyGHT7HoHMyTYpvXsAd6HjiRr
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 16:55:36.0248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9b812e-c421-4f42-578b-08df3db91c31
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008C6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 16:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249761
Content-Type: text/plain; charset="utf-8"

Enable it by default.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 meta/recipes-extended/libzip/libzip_1.12.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libzip/libzip_1.12.1.bb b/meta/recipes-e=
xtended/libzip/libzip_1.12.1.bb
index 95bac993f9..bfa23b6d9b 100644
--- a/meta/recipes-extended/libzip/libzip_1.12.1.bb
+++ b/meta/recipes-extended/libzip/libzip_1.12.1.bb
@@ -10,15 +10,16 @@ SECTION =3D "libs"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6fcea978dc627f41e0bada0de889ec=
4"
=20
-DEPENDS =3D "zlib bzip2"
+DEPENDS =3D "zlib"
=20
 SRC_URI =3D "https://libzip.org/download/libzip-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "c40062022a1963c80573d48f6070792297cecd7c6bffe3aefc=
ac0d8b9bee8913"
=20
 inherit cmake
=20
-PACKAGECONFIG ?=3D "ssl lzma tools examples"
+PACKAGECONFIG ?=3D "bzip2 ssl lzma tools examples"
=20
+PACKAGECONFIG[bzip2] =3D "-DENABLE_BZIP2=3DON,-DENABLE_BZIP2=3DOFF,bzip2"
 PACKAGECONFIG[ssl] =3D "-DENABLE_OPENSSL=3DON,-DENABLE_OPENSSL=3DOFF,opens=
sl"
 PACKAGECONFIG[gnutls] =3D "-DENABLE_GNUTLS=3DON,-DENABLE_GNUTLS=3DOFF,gnut=
ls nettle"
 PACKAGECONFIG[lzma] =3D "-DENABLE_LZMA=3DON,-DENABLE_LZMA=3DOFF,xz"
