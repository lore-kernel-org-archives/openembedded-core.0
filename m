Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.498.1794156940690457184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 08:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Ise2k0uu;
 spf=pass (domain: axis.com, ip: 52.101.65.6, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2glnPoPPkwxO4XhB917BwXeRbJ67337X77PFom6YP9YRNG4eWlbzoWab/32jYO3putbQes/ygr8uBq+DTtbQM3cNp8GahKRmVEnqYx3E/dSxYCRTmFhEJh4O/RAdle4HWT7mEy/FXsjTP6MF8OHgfWY03QL6mdmRlig6adIX8RS8wcfc1/ttsuU/GPi+RplAuk409Ov4/PEwLVnaMjV7wdr4SlXxSRZrIk+j05fRQVctRBAvosLQFHCgGL2NuDk2BcQIFxBj49NJGUURWK9W9zzFpSWF9C0ille42Cj+0YqZOr4ASNthN98FOu/X3Su2uvA3RiuJigf4lX9kqSe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0SmWpoUutPAi1MiWQwEWLyY5z07kMNIVH5GEyMAnYM=;
 b=Dl0wyaKU4TbKF6F5kBX5rFw1ddKJT4brsfiX+O1mUQAKPUCwPZ2sMJJgDuKQa5h8pgU0cS4EhUTwEYSodwZD3xDs6oUQK7ABfMuMP+BsLBDEDwLoadkP9oPLD1zipZexCDmvDHv4CBKiC3RRbifGhkA8B1v4MbiRlhdl7+JhIuMkU5MGK+dtTflQqnGcI8qSoGsavVHcayng68x9Dt8OSpZWCUDizAPT/G9JmExT+iDz26hmV3dnJzOrilliCMnXVNbh1yMTLLhSLE8Y54cfrNwvsATsMxEnylxn39CLZt4IbIp6wy/ZYuVZ+sfWPYRpMWFocSQNJX0tR95krYg4IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0SmWpoUutPAi1MiWQwEWLyY5z07kMNIVH5GEyMAnYM=;
 b=Ise2k0uup4l+GkbpAtILvJW6+VVlzUaDY4SkOvTXHEwjanJYZFYAxY/0tj30k/cyHDfWkW5gS2BkhZ0AZkwdIGnRbztICPJp2uKwlnS8LYSR0Se4Mqf7EViLJor15Wkslwy+M8L5TLmGV/ej/GQXnP2mEHhAbRCOrQf3/EYpb+4=
Received: from PA7P264CA0125.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36e::7)
 by AS2PR02MB10002.eurprd02.prod.outlook.com (2603:10a6:20b:606::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sun, 8 Nov
 2026 16:55:35 +0000
Received: from MAD0EPF000008C6.eurprd05.prod.outlook.com
 (2603:10a6:102:36e:cafe::5f) by PA7P264CA0125.outlook.office365.com
 (2603:10a6:102:36e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Sun, 8
 Nov 2026 16:55:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008C6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 8 Nov 2026 16:55:35 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 8 Nov
 2026 17:55:34 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 8 Nov 2026 17:55:34 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id D95611BF6
	for <openembedded-core@lists.openembedded.org>; Sun,  8 Nov 2026 17:55:34 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id D338812AB56; Sun,  8 Nov 2026 17:55:34 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/3] libzip: Inherit lib_package to package the tools separately
Date: Sun, 8 Nov 2026 17:55:31 +0100
Message-ID: <20261108165532.648009-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108165532.648009-1-pkj@axis.com>
References: <20261108165532.648009-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: peter.kjellerstedt@axis.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C6:EE_|AS2PR02MB10002:EE_
X-MS-Office365-Filtering-Correlation-Id: 5138a052-06d7-4617-b36b-08df3db91bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|260925021911599003|260925021311599003|260925022911599003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261026121527099003|261102123227099003|12006099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: 5SpfJsyOEEUjyCI5XfPIgaqo7L3O0OIJi0r77xfvMDSYHQitgoJW67zEwtRWSVVIKXPxMvuImCxB6iD/DscnFBF8Qw3jdaSRSbkHqCZUxhIUmZ5n6Ul5D2sihiZx0nrMOErAndeIVXAKBtDny6SfNwmCtHSeMxE45l/hLvvYFTexmF0fuAXu/oJMRmi8eFDBoYLEfJzr0BsiuOhESZfAdqyUW73TeLz8WhDDNyoRVvjcmbfOHNM9I/a6u53GUmjZgNjl0fRF2Lm7KdAxgeLYY4lF0DVr17W59f7ys0pRhtVuE0hhFbxMNRQOukuea/5QIrPBVed1FCUWqrJlJIVMPBiUewBnEFx8m2YJ2PlikYYKMWORdxA/jdSVcvLY8YUPvIPBjHNVeWvPGbWld4u/I2WiyLVNXehvMRxEpRKibeL1k2e5L0G6nRhW43YHZvGRZ9XCP2BFLYBIuELAuTFk8+CtXkgSbNx0XKB9sP5dv3x+wqVhVCLgnh43Rr1o8cNRubTdEFzRjW+Hult+Xxpy3flfMm+zCR/jcbhVHhqG/656MfwFFYxAMar+N3EHgHlfeJOgXGJnx26UtfnwlR1HTgGC5nq9w6/5QJI60iB+cEQK72+sB7QYFLg3PyPawkBJSNNa6gukYp0j0l15PcKSzA==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(261102123227099003)(12006099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QFUY2ZI0Mt3CWF20pV62aXty4bXNdgQ6KuH/zJ7R20Hogqzi0NX9+GfsgsRoI/ubSjKHnzbVjF8Yc79C6nLPKyo+TEaYHYfqaTOEf2NuWbUgl5keKctA1TS7ynb7r9sVQ8S4oxuQ+auWEZOMmj4iQcFtWsH18rt1PA71qF3U/GUdj5VBpp/RNgSo4pLSdMuBu0RuuuXAikSuMivyVJZKwN91nY9/IPNHbBjm+HdX0bSBhiql9E4AuC84mC9MgZTp/+dmXBmIWbmdZhbPO1HscKO05fEU4ZAqty2simpYDdU3Gveoh+Uq0QFm0IsNKu+5ODXYJSmHic7/1PHAnEQc+3OV7il090dsG+x+z0QZh0U3HpAWUhgEEMyLRuz+3OfEF8l0X0mLnKVSKj0W7X3/zva6VFemk+BP/Iq5aewPfoRbTibdlyE8GErTzZ49+/fo
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 16:55:35.4177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5138a052-06d7-4617-b36b-08df3db91bd4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008C6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 16:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249760
Content-Type: text/plain; charset="utf-8"

This also means the tools are no longer installed by default.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: The libzip package no longer recommends libzip-bin.

 meta/recipes-extended/libzip/libzip_1.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libzip/libzip_1.12.1.bb b/meta/recipes-e=
xtended/libzip/libzip_1.12.1.bb
index bfa23b6d9b..0e80dbb00e 100644
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
