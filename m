Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.450.1794156942851422367
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 08:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=KPvQ2XfL;
 spf=pass (domain: axis.com, ip: 52.101.66.13, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrrxgYMNNuaMt5/1SRQGozVMKu3exoqGeiC4Pe07zUMXMnszxQqh9NTODQJNp2PzaLk6voWygrwQivTsr1xOr7c2E64m0WM0Fp1G82bthZ8RKPuFA6G6yagkpHVbluF7cq0I5q32PMdEO9gdQHhVfi8trUHKm5VTGXVyVflAlOSnKe9XLBMNA3mYrIGIsf2Vvmf1NJLyx4svxkQsRkIh/YUakHCf/sK6vZHhMLRSYEUj6mZ/gr9hknc49UaRdUSWUKkzCtbkOKbxPjZNH4KHGPZIYDzvWHvCZbuARJwx7145dLG+H5rZbe8gmszPqISCUolTfweqmoowcO93VBKmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmSN49F2inIPfsJCEf6wvsY4UrioSSIU3gj4acvjXgg=;
 b=zAQK6OIAAGJnZvAVemsjzbUI9cLC+M5PGJDxx5X5SIUxwTQT8s7MsJdCbTvN3A0HCk8RD+DW7VSrvlRYUizUC7lLPUbSQUfXwqiwtbDvka8zg+oJPl2Rjcs9r6RyM9rqRcGG6SP4wH1hNvsMT86BpP8TAVXyWRk2RE2l6i3DZpbcN0lSPikh/ryCF7HxcVNKnO/g1LJIBgsSbtQ3OfvdHZrxUEJ9nlYZpzXVR2+VvDptmb8y4/0EDFGq6af3FOrqMB9Ck+s9wc7ZTcwSfAztmA9PyxFqquBUBAZrhjK94/p9rUWHcOxy7yRW40xsUUohw5EfiFm+hlDO188vaFuW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmSN49F2inIPfsJCEf6wvsY4UrioSSIU3gj4acvjXgg=;
 b=KPvQ2XfLHZmTvWljxEXnDjOaeiu5lDa58RHQgoHOeJzKVT9/rZMYn1yiwpxJBTOlJ68aCsol2fehZ0LiBrYyxa2mhHIVhNG5rOCcm1e3MAhcdxvxFVZWVa+rK9gJ/n6tKC2qxr9Arx9v0H3has7xQuzVXES/dSm9Hg5QtrAeylQ=
Received: from PA7P264CA0134.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36e::16)
 by PA4PR02MB8240.eurprd02.prod.outlook.com (2603:10a6:102:271::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Sun, 8 Nov
 2026 16:55:36 +0000
Received: from MAD0EPF000008C6.eurprd05.prod.outlook.com
 (2603:10a6:102:36e:cafe::1d) by PA7P264CA0134.outlook.office365.com
 (2603:10a6:102:36e::16) with Microsoft SMTP Server (version=TLS1_3,
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
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Sun, 8 Nov
 2026 17:55:35 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sun, 8 Nov
 2026 17:55:34 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 8 Nov 2026 17:55:34 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id DC8E31BF7
	for <openembedded-core@lists.openembedded.org>; Sun,  8 Nov 2026 17:55:34 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id D95AD12ABA0; Sun,  8 Nov 2026 17:55:34 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 3/3] libzip: Do not build the examples by default
Date: Sun, 8 Nov 2026 17:55:32 +0100
Message-ID: <20261108165532.648009-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108165532.648009-1-pkj@axis.com>
References: <20261108165532.648009-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: peter.kjellerstedt@axis.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C6:EE_|PA4PR02MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fdf4bb7-bf19-43ea-7a50-08df3db91c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|261021123027099003|260925021911599003|260925022911599003|260925021311599003|56012099006|11063799006|261026135527099003|261021121427099003|261009223027099003|261102123227099003|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Wm5R1eaXidyO1toAspACWJWIRBVtHHnZ7vmhsGoD9sB3RuPo2jDedlkMTLumGi3puOcQxlzEYL6UWusFUKxz0XKANfrMtyu3Ys0IOby3AELzQd6WHuZHNH83P8WfG9oHGEICeg8VU1a0vp06wSGJF/Sb2jwt0ECPb1wUZwouv5a4VWeFvvP5meclcDk0tKEOxwVE/z7kfBsdHaBGNbqfT4NwPvhnnbijptapv3RNHQY8kYfts5OTA4fgCQrADQgo9HrkvwYdD7VbJwgvTVBisEgrN8Kf/8jnFqCqrAv6ikzU+bt3LC/ZbTQ3gVuss5UQKvC2t43S8bm++WRcdBQG1dP/6z8ujgLp3aRV3/9qZrwNgKM+/3G3MirSaIXpKBSRItHPUF3xtQFnH5KBPTo80sdkigmIqrCDqVdvCSREiofQtulf9WCtoyANCeUKf7D/oTTdxEyuZDrV5sFJBVL5dXXO1YsbnDubvoHrCZWqJbaZdYuvIeouayli/bY3lAZhHkPC3Mi5/NKhbMzWKK1+KlO38GsnH38lnpsszaW2iwLqltwOpEVBAyp4LVn4Gv2N/Rq9EzbQu/mIMv9we7qHLJC5ZG6u3dHiht80nTIUwei5NwhZBodVwjjxAVFACUhRxA/I3sDW4J6PpeIz4d1Jq+bKdPXM+uXeOPxsZP4XeHr6NxmEAq/zt4L2VThZbrLQujbt5Krokz4FtvZb8wGIiQ==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(261021123027099003)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(11063799006)(261026135527099003)(261021121427099003)(261009223027099003)(261102123227099003)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: e59bHIdxnnMLXl0IfaDCPzPpyc1VVjFReTLaxDxvU/sMcgY6FmRMnQxtVxx1fatjguxyLo15Y+1y50JLnhi17gS57yBgMNYin3WQC742x/aTfAmU/CtFCc9noKWwX4QIGcv5rU8pjB3cKOORnQtPp8OuRhcfDZLKasnDwLUS/qJg7GIz98BJV+m5yMT4azh2v0t3UFQPjSKcJXJaR8BOJBEddC0NK78UmdKcampkGfL/VhnKaJ2koaPhNx/UKdxZ1addjUXQb2s81U5muFAN4TmTMDGqzuO7Lbtaj8ZUkOkAS1EtvGBvgtc/aw6zea2jiNODpZ49bEl7IlPK4aex/1G+VpVRlPmbkfQ8zmnzwNcK2cXEocZK/MHF38dkYAc51nes16qSeIneeAMpbbcHsSm5ae3+ABjyFzR/WoBNcdAc/r+04LWvmak765Uf/Uar
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 16:55:36.5692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdf4bb7-bf19-43ea-7a50-08df3db91c84
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008C6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB8240
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 16:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249762
Content-Type: text/plain; charset="utf-8"

It just wastes resources.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 meta/recipes-extended/libzip/libzip_1.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libzip/libzip_1.12.1.bb b/meta/recipes-e=
xtended/libzip/libzip_1.12.1.bb
index 0e80dbb00e..8bd01a1c0c 100644
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
