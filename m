Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4870.1793780804505902243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 00:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ExSk5BIl;
 spf=pass (domain: axis.com, ip: 52.101.84.44, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTaySIJHAprKbflu3JIjDAWaOT/RV4f8/Lc5eEy6YWt6nNa2E5IWE3Vb9i7+4eQqGMVAr4ZuANUIx0jnzQK1ikUg0JjaSX/NFB7diheq6dbP3rAUL6VKQ4N7VJvWpIVAWajr9iWovmmPh9WL/qUxmhz7I3Wwk0d58W+6fX2oMFlgOQYRNuJ+60eWKubwu8Y6BTmdBAUAjcZBjmLTLkdTewOQ08vuJ8PrBvNW2OME83fYWQ3mdkiu1SP+4YuD+Lh9vL8tckRwwAoZFIwo5fPCApJ6bGiTtNB1sSrah8ZxWJjGMP8jFfBX0TQUecZICf9TFG+h2bEq9Q30ha0wA4Kzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tyr7ivlILMMWCa1fgs4bxXmRd34I8wlO+8vOdROyk/E=;
 b=nEuqdmpN63mLKtPEXEdA1AKBTYL9RJNR6w7qE719PT0dN27mrGKxBef6LOzvvwB8mvPxIy4h34BU8ylnCK2id8u1Dv54vtNWyrwFMlenOSo7eoHLMGMLL+rxPSVQuzgbIQnF+stDEIKHBs0lFasVycVwfWjREqHkOdUGIY+hKJ9n4ABf2uU1bv2JLmTslfIcYzRydRCRU+6AzBV6SF4d6ULROVO9MT5lkyE6mQC9ugT90wRnwVk5Ft1rsAqWNNQTWNZEx+U1FjM4GpFrWEeLRRJtDhlMUIJtGQwc93JaMEJolD04IoH+u7lHKbTHjf7nFMGjy0sl9USP+mfU3ntFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tyr7ivlILMMWCa1fgs4bxXmRd34I8wlO+8vOdROyk/E=;
 b=ExSk5BIlcFL5v/59Kf5NSnnmL3V8L87pu1NwDKUm8h2yQD+8Rey0Tg6rBGXQR29BFaj3Q9ciHnhLeu94k3VvK5UW7FJiH1YlSJLH0uXqyI9Xuip5u1o/vpZmYArOW3z1dx57VukT2eN3CreQOPbtDAQEn+8xaqolTzMwf5hSZ74=
Received: from PAZP264CA0173.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:236::16)
 by AS5PR02MB11294.eurprd02.prod.outlook.com (2603:10a6:20b:6c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 08:26:38 +0000
Received: from MI3PEPF00008552.eurprd05.prod.outlook.com
 (2603:10a6:102:236:cafe::d) by PAZP264CA0173.outlook.office365.com
 (2603:10a6:102:236::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 08:26:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF00008552.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 08:26:38 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 4 Nov
 2026 09:26:37 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 4 Nov 2026 09:26:37 +0100
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 98CDD232;
	Wed,  4 Nov 2026 09:26:37 +0100 (CET)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id 93E14845099; Wed,  4 Nov 2026 09:26:37 +0100 (CET)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [OE-core][PATCHv1] zip: set CVE product identifiers
Date: Wed, 4 Nov 2026 09:26:35 +0100
Message-ID: <20261104082635.2183419-1-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: Anton.Skorup@axis.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008552:EE_|AS5PR02MB11294:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4d0780-baa1-4b34-5894-08df3a4d5881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|10067099003|18002099003|56012099006|11063799006|261022075727099003|261102123227099003|261026121527099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: VL2fZCKL3QZ8K8XXJFJlNT+AlRzqTWhylZwP4eSuAlxTJjJqjJdju4CKrMymWixEzsY7Zt308LSQJL2KSReihGVy08f24Nmj6F6JlgYqdMs+hI4jWiyq/PrKB+FGJDBq7I6Wvvufbl6n/wM/RdlYjCTI7OP9dgvMvfsVi8vyw9u6POPrvEjBJ7BgVizbC4TTdYxagSUfBtEF1zDVesZdKR7t3d0Bye1Ehtyp5Cz41saDchu20fNR5a2fQBRB7l8Up5yInqaE/WJ2P4EYo5KsiE61sYje/s71I6ZY4I/WQCVTDArTZIhkel6dZHe59fR401Bp1VLH/LtE8xFWuGaeA6nQrrjuHcGTii+Z98n0GMTXswSf3ZXjYi9XCG1u2OQbbsLV0JTuuGAJeJ/JwAsF9M0avbpU5XgZKoTbP4oARml6r7SlwX9btCelUlk6TIxKE/kEwYyEC85pldgXwzT+6mQkPbBqugmUF32BkWKM9/w//Zk3pyRacYVxcqtWJux/19IXX/7/rrTN2nhANnf4ozZbb0z9EmEz+1kB1XjSlGdA9JfJWxwDTCLhOkt3xkqtbC5jRqf3cFCjfAj43DWGk3UMqIEkfWxR7NM10n38qGb3JJScsd+4gTPglBUXMVNPdxIY6u9lONwGe0KEFIOuMjMi+gfRKuQq7la0umLKznFDBfU9oMI2+jqGa+m2KiT2Lxxqvd/IkFOLp5RT61jhzQ==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(56012099006)(11063799006)(261022075727099003)(261102123227099003)(261026121527099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mrhH2sfEH2pStWx6OJvmCVqI8lq4TzR0K85aSQQ8UEa48wtkTyHCUU7dI9YBKPfkc/JYDKlSKpvrd0VjN2TIf6D61OAm1pqM4BgX9YYwetmJoU67XSaGfGTLbzcPUMV5zTOLx7NNVZ2TH0Re6MwtC+eWTSyLhUTwgDwFHs2kQgR22PYKG0fCGfxuNyd1oNaJE7Scfba/PDYydv7VYuLfOX6k4qgbp7x+tuvuJ+dmoX5C+ejKvYFpeV+dhENwrhiuZ9i0kMDv7ubWFhftwK5uh3ipdpXWZErvpYKbgXbBGgsM5GsBZqvENevv82wDwRXSRqzky6UtoCVKc9MQvthQ09wnDwaST7AFtwc+GK4w1E8nL6ZjGXFaUnMkCbN4nO8BsYCLMxFU8ITmW0TF14RvZwjkTU1WcZ+BAv2vALqxxUvKb/85r26McOBUi5KqD+xa
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 08:26:38.1014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4d0780-baa1-4b34-5894-08df3a4d5881
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008552.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR02MB11294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 08:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249346
Content-Type: text/plain; charset="utf-8"

From: Anton Skorup <anton@skorup.se>

Signed-Off-By: Anton Skorup <anton.skorup@axis.com>
---
 meta/recipes-extended/zip/zip_3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/z=
ip/zip_3.0.bb
index d1092551f7..0ae525bd4e 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -26,6 +26,7 @@ SRC_URI[sha256sum] =3D "f0e8bb1f9b7eb0b01285495a2699df3a4=
b766784c1765a8f1aeedf63c0
=20
 CVE_STATUS[CVE-2018-13410] =3D "disputed: Disputed and also Debian doesn't=
 consider a vulnerability"
 CVE_STATUS[CVE-2018-13684] =3D "cpe-incorrect: Not for zip but for smart c=
ontract implementation for it"
+CVE_PRODUCT =3D "info-zip_project:zip zip_project:zip"
=20
 # zip.inc sets CFLAGS, but what Makefile actually uses is
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
--=20
2.43.0

