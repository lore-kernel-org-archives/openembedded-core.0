Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9914.1792508781409979427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 08:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Xv+Fg2VU;
 spf=pass (domain: axis.com, ip: 52.101.65.37, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWCJJ3428Izf0HBvZhUDD0moondYggpWOa6rn9Ys5kGbVsyTfInf1G5VbYjOgiM2thQoFuHxh8CBliOK+lMCEvU269O8aFD/b5y/BvG3xmAP258hf6HIauWMldbpCmzj2Bayh1JAnd58xiVQm0OkHNBed6ybM9+jn/nwfZiGoN/0tI1+SEfug8kNXqna7fgPtEJubPgGiqkWPoj76Fx1w4yqMqfDAh30YgoEGHQQHxLTHWTyxe6CnBh9pXDwnCnOBZrpah+uECxCfFNvJ5bR4u5/8nryOoHNhgB6HjkYh3QwQRY9ReksYoGKIJK1RIaH67ozhNsaDv6lTrd8StUjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9iKdAPedSwJu3EhTTjSemzol6j2Q0je1MRqGfesgIM=;
 b=rehTUND+Bsc22/CsXBEXDzBJBdeSlulYJ5P/6gwSmRp2DUEwyplDofdjJ8/YohbGTCMB9WMN47ppSd2WALSfY+jpYR2Y+DvygF+gN7yi3wEOitCQN78ipujxhumCpI2IQxziYWabrhEiS8fkVA3rbNv5PqMYEEddTAQcnqfKuJv3mcucAjYwSXXPTx638hrRbPD9hrl7Xs/HBYqBuJZ8DSN0y6qvE5+W+yU1qthSmx5zRP8GFuF83iTDhK2SnGPkZyvKmwx9MjzFwuyvGaa0xt8pBLr4eRg+59F+lKiijV3ODQhBTV3/gE388LrObgyAr8SPSxHNCGfEUq0LhbmdnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9iKdAPedSwJu3EhTTjSemzol6j2Q0je1MRqGfesgIM=;
 b=Xv+Fg2VUgQG0ELisSNWzVDPOCEUoBq62ceIr020oieJB5tgK2/ZLSEOso9Bp8mKvk5+d7JNbHFUN0ZD+8kFZZbx4PdJrsvaYvs499KXWU/LIH6IDuezjl6HXmPHmLvlsToXtckCT6GqzWFcTXIt5qDBP5AFCCWHxTGnl3CdScu4=
Received: from DUZPR01CA0321.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::15) by PA1PPFD3E722C3A.eurprd02.prod.outlook.com
 (2603:10a6:108:1::260) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 15:06:16 +0000
Received: from MAD0EPF000008B6.eurprd04.prod.outlook.com
 (2603:10a6:10:4ba:cafe::a2) by DUZPR01CA0321.outlook.office365.com
 (2603:10a6:10:4ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 15:06:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008B6.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 15:06:16 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 20 Oct
 2026 17:06:15 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 20 Oct
 2026 17:06:15 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 20 Oct 2026 17:06:15 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 53F5C29F9
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 17:06:15 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 4EC0112BCA2; Tue, 20 Oct 2026 17:06:15 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [blacksail][PATCH] stress-ng: Inherit pkgconfig
Date: Tue, 20 Oct 2026 17:06:09 +0200
Message-ID: <20261020150610.290979-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: peter.kjellerstedt@axis.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B6:EE_|PA1PPFD3E722C3A:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bb167c-f1e0-415f-7c23-08df2ebbb061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|261009223027099003|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: vpFwLIXOKx1dyoGvxStiAAr/JOtxQSRo1EK47tSKufpfzE0bBYUDoNNh/iHIC3wNozc31/E/HOTt6OgUSzMtZp5M8nHwYZgQWQhTZo+UugzfQPeqRyFbtdpl5QSN6OGxnmD2oaWuMK0ArPE5YlYGD7u9B0gWmxXy1Ym4FXN/EYwaZI0q+qx76wPUlqIDJJI/YJ1s51sz1aqA4Tnyt68UINKln6WqLnHqBeFghTJVplu8S2u1Womyd2y3nfTzyBgaq9BQamFZYk8TsdNAtimwyuZ99no9UlqAoFiEyMt23BmGDfvVmryg1eoE8Q+eTTPB2FJalz/OaQuqQXp3cJ6VQkF5p248vRYq+d4QVrXonAjnyShDkZEPIN59VQKcb+K/mc2BBi5t37BXgPC8vXTjXWp1uPgvwfbFrTXCuNggISEkvzELGLBAnGvlHn16BHleBJuRMKcnguOjgqSgWbBFjCfHwvvRJpEelynGXOHD331Y1M/4p2kXQt0aniPUw3YV+BoyQSyPqukqD8951dQA1vl0G9GgotMFsJ5qm85vf8ynY3vkGheyZzxXJ6FSdH6vDGTraA10t5pc0lAucYPUyCtc/iDEen/ueUtoEPKywplXQfoQT56ckvJCC3Ug2DIMmyZM0RrOg7aXf1w3r1VG5JZAKCOozIWHzwZGOPZpYCrSFU+pDt0RPpv0A79g2tILKipkIBx6FBJloF/fFVDong==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(261009223027099003)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8Koez0jGVvQ75d7djooV2RclPxNkW8ztWuronFwYeEuNGNuhldt1HGYfk/hzH2NCIBfpKEamqDTOz+9aq3YqT/Sv0wMpw+KKZg5ffh3MLiOPPXB43PQpqchYZ+489yGwGsS5c58+mR7lG3sEWW/9cLTWSBitEV5qMJBosO9aq5RpQbtv48oSV1nBg4tgxzgvycct64fWOJxYoM7gD5VLW8UPGGNtLQ2gW/wCvqk1kdI4Zd3Wqg5oL0U7IMxlRiFeQGWQM4d5GIgbnLRXCsmSJLlXuLmBxdqqmK1G5j7Oa5Q/2pL2g1SL8F5IwEadsLYm+6ySBTbGr2F28HAGwmNJizdsUSZejWzzltkIdLKUq9ztXWtBrpE3IUs1/0xeGjFv54B8C3qhxXNk5f5slT2vW9wJXRXpzMvIjqBAphSS+fJzHVGSjghWgGyOl3Opip8P
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 15:06:16.1978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bb167c-f1e0-415f-7c23-08df2ebbb061
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PPFD3E722C3A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 15:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248300
Content-Type: text/plain; charset="utf-8"

The use of pkg-config was introduced in version 0.21.04.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb b/meta/re=
cipes-extended/stress-ng/stress-ng_0.22.00.bb
index 5c68f81311..6ebd974151 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb
@@ -15,7 +15,7 @@ RPROVIDES:${PN} =3D "stress"
 RREPLACES:${PN} =3D "stress"
 RCONFLICTS:${PN} =3D "stress"
=20
-inherit bash-completion
+inherit bash-completion pkgconfig
=20
 EXTRA_OEMAKE =3D "VERBOSE=3D1"
=20
