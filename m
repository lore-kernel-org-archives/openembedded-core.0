Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.71])
 by mx.groups.io with SMTP id smtpd.web10.23455.1590958687742213897
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 13:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=qZqUNC1C;
 spf=pass (domain: outlook.com, ip: 40.92.16.71, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fb7kQ4EjkkmEBdVQaG3LDMv1RCGh/QVQiJkHKNd6Y/Qi41NcS/bSvrAOScV5+fIOka1hVDG/LcqaOu6isTk5bljwanAONjGfM5Ut0B4ngde69wa4eaY/YceXhMSVYprvFxI0OUlMnZIYJQ+q8yMsnqz2xBHdI7hHh/mB6fw5kdlNArWKVMvRCqA5ZUP1Mn7b7PG7qgI5yuaHvWAloLZc7uUkPC4Z5/QqfPR86GcLUbpe+FAD0jNgaIAF7pcGgzYn2Q4nhOIb/MthMAygkoLWP4mKH8gLBu89mAREJ7CyjXeuXcnRxkG52ofyU2lDa43uWOwPrcg4Jdxj+sTgsBq5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21jhKbhCLSz305hX67CjobjTPcFZV8zk/WeeCBELTxI=;
 b=a112Hkch2EsG0m4ARgkPWRbE8qM0bn62T7L2v9X9vv5Tn3F5vRpMYDCGKiXs/ERF+xsYeKjliskNeYS0f4aKH8DQ+FUKW+K6FWrPlXqqkPgoM//dJUOimV6hClqYehH/1d+K6SjUofRYpvlJwtCz3BH3RuRFWm0QUoqyR8gdzmYYE+gg/onDrNllTWQZumFWQHp1V2t4oE3fL3RWKNDhO1273VLndZj4y2zsKn3bOSDpSsRqJ11RAf0LPShBUA5czzdXmRv3i+dQlhnx2uhu6r4vUg0lMK8+9knl2jBpenGDO2//0azYDO6OqbUNc3f7FJBA0UQLzwjz46JWY2oq2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21jhKbhCLSz305hX67CjobjTPcFZV8zk/WeeCBELTxI=;
 b=qZqUNC1CZ1qzhjFYBW6RHf8zAoNLDzNbPZo1C685xpbpVZzseMj3O8Dda5up91dgGfCkXKcuGQtGSsDG9l66PLkXtegxEAFgHAdfoMHA4wd7MqQ9uS7vz9TcDRfrzeGPbuUwLAlOkEQCHLHQQyD8DkD8gotKUWPbeSKjelFFB2onGbMuEwwkI/SXScK/F9nXA//uM6fLaZ+nh+1+OUv0BDG1xqYWySlqtdfw2A3mBlDXKJg+L769QO5c6MOOjuL7u3TJPKDb9AbEOJkUgk8Dv1mw6LCG7S99nD9Lb+Gqsv0XeW+6mc2kbMFh47L3j0709er4/f3RtPPWDA3nN9Zm1A==
Received: from VI1EUR06FT046.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc37::4c) by
 VI1EUR06HT187.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc37::370)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sun, 31 May
 2020 20:58:05 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc37::41) by VI1EUR06FT046.mail.protection.outlook.com
 (2a01:111:e400:fc37::317) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sun, 31 May 2020 20:58:05 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:67E6D8D421C9C75A1453A92514853882758ADEA75BE7B5CB2807444C59A495C1;UpperCasedChecksum:EEEBB9922CA0AE11E17C5184D3C2BA65B64183C8C1474E73296C3B9D4425846C;SizeAsReceived:7487;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.024; Sun, 31 May 2020
 20:58:05 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] sysfsutils: rem leftover settings for libsysfs-dev
Date: Sun, 31 May 2020 22:57:48 +0200
Message-ID: <AM7PR05MB688135CAE8F98FB0B7F5836EA88D0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR0701CA0008.eurprd07.prod.outlook.com
 (2603:10a6:203:51::18) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200531205748.1725-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.15.24) by AM5PR0701CA0008.eurprd07.prod.outlook.com (2603:10a6:203:51::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.8 via Frontend Transport; Sun, 31 May 2020 20:58:04 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200531205748.1725-1-kweihmann@outlook.com>
X-TMN: [GCXn6149uZMTSaP6rBGtWnTZaoDh9B1O]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 2d85f61a-10c5-4243-af24-08d805a5503d
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtxZDRLgFxEZNXonRi+PvJzlV08W4VR+FeRyrjyuWMUZdV1Fsgv0V9BuiDG14YoW4Y04oTLgTj/cbzPBeDY4zcQWK2pSqKIILVIsmZWS0iYpOYIpQRaQCIq4E434xZI35z51X0l/7urQZuK4Yt3a0/jbw8Sv0OQ1q3nG4StECam//LSYUn4P0oe2Zl3Lsg113WeakoUouUzhZePj4U48BheMCeAaff2i7oznwicJ392k1fPCw2mjmMZi9W4Tw4VAuaxiosyIBajsXtWfVXW3mMFeuZKAA0q01/VaVNRdQnHySERBHNoM9EOAJ1eekR62cnfYGeiP4AcuzkE4MxP3dzsh9tcPy1ft3d3Cyva2y3+7I1TI/qMLJbFCArlpZEAErKtbO4D2MxbHIhpzpEHD8/xnKTVlGPlPPSP8s+cqb2honF1BAXR3KjzRk98dhFTfd9+gaiEo7CGPQBbq3zxXD1N/pdUzzjnG9aySSApzMDXbZQlPJBhgou6RKkX1r+RBDnrbAtV+RwqEsKQkTNwI/4pHoN66lKp98RM83YO5kGSsetBjrPKVb0S7WIU3np66vQpRz0gdmgfXlyXWigkmnMgFFszzfD4yqaI4wmFByGg/I8vxi6pzwR7kbZTZ2BCYZ1t8EHxGV5uXfms9eFYqETkq/BQRZsfYkJD2EEaRVYPOYmWRLbT9xkxluzGrmpy4VJJ88xPLpq+GS/83vweMLgTORJannYBsnD6kSx33DKTieA==
X-MS-TrafficTypeDiagnostic: VI1EUR06HT187:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kMU4QxblpLgLwL6Lc8KIh3G3/8KkS64ghr5YaosB9rdi8jDIkScIuHAPqs8RffVAHBh5PdQUifuJutTzz/5BkbyBQ3TCvO8Zsg0LTlxJeN/N0DlTU5ItXh6zhIi1r8tcPznzn1/YExcbwhlWZOm488Q5BB+Of1I4w1SdVpoWwX30BTcY7g7ya1nELfZ/mf4yZUSlo1jDZNh1qqid26tOGA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	B9KQXMQa1Ebw1mOhxTE9Toy43yVLYyo9WHya4nq1jRRKZalNR69GdT/nhhcZUtY65yx3zzYRpc/kCFPEHL/PSj5uvnaEail3cIZbmfTwHaaI3+JWqqU2tZk+rfSCrrlhzu5rdDaxHCUpvQJ0ENL/qQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d85f61a-10c5-4243-af24-08d805a5503d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2020 20:58:04.9854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR06HT187
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

22af6a2595dbec98ce4a2e3b1324ad8d400390ad removed the PACKAGES
setting, but left the FILES-assignments of libsysfs-dev and -staticdev.
As these have no use anymore they can be safely removed

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipe=
s-core/sysfsutils/sysfsutils_2.1.0.bb
index f9f067dcad..34bf431f40 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -27,7 +27,5 @@ inherit autotools
=20
 PACKAGES =3D+ "libsysfs"
 FILES_libsysfs =3D "${libdir}/lib*${SOLIBS}"
-FILES_libsysfs-dev =3D "${libdir}/lib*${SOLIBSDEV} ${includedir}"
-FILES_libsysfs-staticdev =3D "${libdir}/lib*.a"
=20
 export libdir =3D "${base_libdir}"
--=20
2.20.1

