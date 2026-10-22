Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.521.1792680267092061847
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 07:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=QEuS92rm;
 spf=pass (domain: ericsson.com, ip: 40.107.130.41, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fURqB8EZhxgBLuo30rwRaG9IkS5z7uK8l9aEwFPVxXdZ9NvbMEwHVBdy3uWtNdXEo10Zmm/J8RSjyxurUcd6zYHYjF5HBuU28wYMMmt7/R19WwiwWBnDXcNnW2+TUILL8PJuPnwacjDjDuWWceGPxL2EL2LeVsjXJgl7gOTXMx9PnWo4/LLUctacRPfrT34Gu6PdouHWfqoqgikhGGeee7NPfI9Cm9V1cWYAQmWjXmezAFvtEepzJ3WhU9fOmBkKE3YnpJMKv4cz+tmSr4TfTXrCJPCJ5VlrgsxgejA+XebIyWoH3zuJW8apwzMB3eZYZrfBOYI1gbQU0dWsrkBe9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ce4NfuYL4+SgGYN66BeSlkUmoM6TXHB2O4WpN3yPlEA=;
 b=VTOmVj26Uf6KC1EjeqbHl/5E1x54huk39JK2MipXH2jhYXO498YlkBvNvVXx4E3jIUSpVvz04ttl/kQ9eurmBY2trAeBxgz6vH9veoNq6kz5NCuG+y/gzpkMJIFg/MufS26wqYw1dGx8XMTBjQ3sTFgzuYDnz4X92AcDQiTJZmIggbGfIO3PCzCWVF9ANl1spFaaST8mmOAmCe4c58C1qAkhu9BDq0bvEF3ZhEfmdBaycm1u0xUTUI73+y8ys/83AbY1VtWJ86/buY0/LPJhme1QawZh4kQmGFoAINTgkDPClUDlNO2EvnJTp8D3FizEQMM0R/kDvf5ltlYFSsYxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ce4NfuYL4+SgGYN66BeSlkUmoM6TXHB2O4WpN3yPlEA=;
 b=QEuS92rmg7SK7gRWIIEOzOXgdwiXAPz4yjEf7R/jrjmVy9h1pLXGXQtGLiGLG2rcYv3vLZZj31wRTSlrU1D+T120Pk+K2N/EPyc0z8YPDYvi1fjoD7RibuNs5ygyu4ScVu7MCkX2L9JAfMQpWt6w2vxS3q057c+X//mlYcMIbBlk1WofHwWUEjbWqLcbwql/zVoKTL83Sj0/t3xUXhMbVEpgDYMEYMEpxzW6LlJGBwKnTmHX/P0U+/K5cqdyWCAH95xhg+LqoLXHAoH93sKkFj+a36jw3bqH61tSsLZIP1gmjVo8EvR1NCY+ka5rnQ94c2dCf3jp1NYlSEH9eEOqNQ==
Received: from PA7P264CA0383.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:399::19)
 by VI0PR07MB10152.eurprd07.prod.outlook.com (2603:10a6:800:25d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 14:44:19 +0000
Received: from MI3PEPF0000855E.eurprd05.prod.outlook.com
 (2603:10a6:102:399:cafe::74) by PA7P264CA0383.outlook.office365.com
 (2603:10a6:102:399::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 14:44:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MI3PEPF0000855E.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 14:44:19 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 22 Oct 2026 16:44:15 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 2E5174020B41;
	Thu, 22 Oct 2026 16:44:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 01E8F70722D7; Thu, 22 Oct 2026 16:44:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 2/2] maintainers.inc: add RECIPE_UPGRADE_CHANGELOG_SKIP
Date: Thu, 22 Oct 2026 16:44:13 +0200
Message-ID: <20261022144413.1690870-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022144413.1690870-1-daniel.turull@ericsson.com>
References: <20261022144413.1690870-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000855E:EE_|VI0PR07MB10152:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bcd85d9-5083-4b35-d36f-08df304af439
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|10067099003|6133799003|18002099003|22082099003|261021121427099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: UnyGHaZdR2HLW/t3+y+zbyFk4sfDzLcMBtIThEZsrNyjne+iAWhC04XWWvqcct6HpJj5JOhk7DWEmbl1ZF9S7tqCGRVSTgs4I/nhXXZtyQiN2RHqvPPY9f1nBPDjN1S91K/G4MwjQBITyL5+2fqQ+OscOsw0poza9yzEY4UwEcE9dKr+RE3dD4PbfSviz9b6Ff7BIuKrjVCRcuZQOv1OIQJ7YYAh++yh5Qnu7r2SX0U6A1sremhdPrB44G1DbdsTdIjpUAQa8Fh225XIHDBrk2NpxQbLwQoztXUWpswu8Ozwc9nMMiVjhakY9izXefSXr7xV2TDdR6FPKou+Vuf/7ccm5CwakCAuiD5cP1sFwqpUuGRfmRdIGBFBgQZx2I26LrCXRk5r633RQtp4B/rVxUXejK8KfqvL6KYw/OkIw0lDFaUanOPvK+eEpxnr9kk1hGf2ye9EeUjpugpqd0y22GZVHerAoD0r8fS4G61ncBjhIGYtOxSAziOMF0dU+aHxAIn22mwAAiOLiB3286XXjuelePlfwnU222A1J/h4Gncrs0DxB3qtIAmyriFsKr5efiR3rObjC4iezUyVC9QBH1J9tczK4RSnd2E3r7r6AAjxGhs8k0G3Z6ZoKj6d1oVKZvUxM16DRr9KNFct4cV1UDL4BK5vVq3lEkTbcNw6xFiQbyF/EAsgGTx1Uq/ejmu+DoiRlz010aKz9A3icf8N1w==
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(261021121427099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TgDUptX/EAtS1jwH2djAPgUVzD/YfQIhNgINdjsWhWU62kIwQqsZk11gbSkLwj8B2XxDjRI2CfAsaWIja8e4WPg0seVZxwQQ+oi76GIk4xEyT6vGxmqbBalqf0E/KDQbkecP/t6DkWTWJEmU9CF4aMFYRGfbxpo+CP0VhCy+cFovsCoI6MDO06YjpiSCpYmA1IQKIaSn40MvpQqLtR3awYl1Qj3JZaiSmNCsftSFuMMkyIQhxLYhj0odhzzl6hmgd07RQ+XWgWbZ+Vejz491fzDscKDqdsOnPuMMktTI94dAQkzvAK0bfQF6zi2T9XRB0FTP+zkj0jHNF6aSM5SeJygU6wzrU/iwIJAgBfGJKjdvFKkvj8wscpOtfOiyNxM9XyX7L5HlpnimFYHV3R0KarowrhFBM558QmVKMB2Jwr7o0rpZhiTzJVIP0dO+3cJv
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 14:44:19.2232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcd85d9-5083-4b35-d36f-08df304af439
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000855E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB10152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 14:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248448
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

List the recipes whose changelog, as extracted by 'devtool upgrade',
is badly formed for a commit message: whole release notes documents
(mesa, gstreamer, cmake, python3), raw git log dumps (u-boot, openssh,
acpica, freetype, vulkan-validation-layers, parted) or markup banners
(expat).

devtool upgrade reads this variable and sets "changelog_skip": true in
workspace/changelogs/<pn>.json for listed recipes.

Keeping the list here makes it visible and updatable alongside the
recipes, and customisable from other layers.

Assisted-by: kiro:claude-opus-5.5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/conf/distro/include/maintainers.inc | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 7fe1be9851e..5846b09bd02 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -951,3 +951,32 @@ RECIPE_MAINTAINER:pn-xz =3D "Denys Dmytriyenko <denis@=
denix.org>"
 RECIPE_MAINTAINER:pn-zip =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-zlib =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-zstd =3D "Unassigned <unassigned@yoctoproject.org>"
+
+# Recipes (BPN) whose changelog from 'devtool upgrade' is not suitable
+# for a commit message; devtool flags them in its changelog JSON metadata.
+RECIPE_UPGRADE_CHANGELOG_SKIP ??=3D "\
+    acpica \
+    cmake \
+    expat \
+    freetype \
+    gst-devtools \
+    gst-examples \
+    gstreamer1.0 \
+    gstreamer1.0-libav \
+    gstreamer1.0-plugins-bad \
+    gstreamer1.0-plugins-base \
+    gstreamer1.0-plugins-good \
+    gstreamer1.0-plugins-ugly \
+    gstreamer1.0-python \
+    gstreamer1.0-rtsp-server \
+    mesa \
+    mesa-gl \
+    mesa-libclc \
+    mesa-tools \
+    openssh \
+    parted \
+    python3 \
+    u-boot \
+    u-boot-tools \
+    vulkan-validation-layers \
+"
