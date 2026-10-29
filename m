Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7979.1793267163238662998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=YcDmC/7t;
 spf=pass (domain: ericsson.com, ip: 52.101.65.4, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzThhgHkhvkf7ms6v2lFaowcYP1Iuclz+3EDT40lS/L+2a4rub9W2emdiizKmEDxkFRlheozXlcjphpJrRjEmF8MwkvHc+gfoq37r7uAWpAaWcuR/0a0r/jshGtxXSBK3xfIMHy2RIeWCCvn56lbtvUpdTQGiZAoahdMxgQ+maK0u0HQM07wWnkvi0mDcksvD827fJavqdV4o0OWZ2xyG2D28DQ7ufWVwqdpjt+teAEIK4U36RfkFfzpe9nKVg7MpEIKhw3mgQdLJW6iCFa+fdmifrzJv4vFAypy9+QSuJsx3R1WdSrKLr1yBG832V+t56PN93I0+bsr1pwaG4Xzmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tM49EobpOs8d6Ds4h8DgRy9+9E1eSQqsFR+ESozrJX4=;
 b=sBlOtrVAidBy0fGPadi39+uPaxoB8cI3eRLc8myfbkDl5NEGm0RutAadxLNWcO7y/btNR+OuEr6FIAtnysCYZxKJvcpxxoy+h3LZpOuHJrMgJ59COju+eK8UkPRoUF1dWkaxL/UIulMxW3ygwKQOVzroGnj9GWugoVv8n5ssWXsKoatMwCpODTDXY3Nit392JibMc+0Qide7WqrvG/vihg7g5SwOGDnkgNfvIHiq+pMnfaBk1yzH2vZFfW7DlkUz9NCORM63VEiMFeL2nyrqXFYNoR5Ue04HsEr5JLlRI51DC5s84OdNWCRi6O5hShd1Vk0UkBQFuVNehiGHqAfjGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tM49EobpOs8d6Ds4h8DgRy9+9E1eSQqsFR+ESozrJX4=;
 b=YcDmC/7ttCN9M8QoJxs4PpkOTsBSzo+8DY2b7lzZBWE76UvneVSHNNsSTgdcyaZhxh+9yu5DdqJPni5/0LurmOuQq5enrowYEtPwkkmkfQ3tCLxJf4mII4Bm593XEDdK+dsm8TZ3FlBiei64WEz6pyo02lWDIrU8SKAgW/6YlOOy3ZJHqaCgHlPUhyTNR48p6+i/A3KRc0oBnmmDOrTxNz+WjBQFzvK0F6dQAL1yt7XlPE7EoG2yw0c46/BgNUrKYg8llfRI1u9TzezybySwHBwl+z6oSk092+cJJSZ8IqeUyUJS2jJAL+6W0vU06Hczktm5S7KMaH9YVoBR77FxLA==
Received: from AS4P251CA0021.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::11)
 by DU0PR07MB9241.eurprd07.prod.outlook.com (2603:10a6:10:42e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 09:45:59 +0000
Received: from AM2PEPF00070CF6.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::71) by AS4P251CA0021.outlook.office365.com
 (2603:10a6:20b:5d3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Thu, 29
 Oct 2026 09:45:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM2PEPF00070CF6.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 09:45:59 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 10:45:58 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id B2ED44024D32;
	Thu, 29 Oct 2026 10:45:26 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 84706707231C; Thu, 29 Oct 2026 10:45:26 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jaipaul.cheernam@est.tech>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2] maintainers.inc: add RECIPE_UPGRADE_CHANGELOG_SKIP
Date: Thu, 29 Oct 2026 10:45:18 +0100
Message-ID: <20261029094518.1621670-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF6:EE_|DU0PR07MB9241:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e93f871-abbf-4ac1-cdf9-08df35a16feb
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|10067099003|261022105027099003|261022075727099003|261021121427099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: lR/8gksXe/s/4mKSDkzFIDFcUj31cebeBVcBF5tHddz0POHOV+u9eERD2wlyk18d2zPumIUO+0xitwCZ+j9Mcy3OCFQkKqTtRMROjKX1W5My7DXXxRbAGE96lA3ZEWEPA1qsqHr9DZQkYZsKZYBdZ1u6gWOTzo7nLGZTKDM8rWZLhiJ9S7qsXZj86MFYaEQhfbZhzwVIIZftGMNydToMAIRcX80lqHf+YDcefUoE7PNUVQxspSatRxGZ7Vn1FtbSGyiy1LEF1CVUerOVqc5ZDXgX4x3q1Y3TJf6mqqXGIEX1egxUPZkZbR/q4TazC/U71wG1crSX6mZt3tZHZv7qQD9ZlIheDkc+nRGX7F9ladxhT9nGOeuWRqDxiLGi8rwcHS/C1KvGms1A8wr3CdWCMVLzIaR35rMY9ayNVI1AYrQ7+mkcGunh5rjH+0DVuY5YIVpOihB+eKFSsuE4yBduu7FpGMyTvg/tWd36KvWsYOyyBKbuj3aPEVidbXW/9FzdjFmBTQfyIaLM4JzZaBBkJwrZ3DxH7xDLiBfwyEuKkIkwnMYr4clXlcNmsBM0WYI+lMA33cWnoVpj8pSHmTMGqaF7EYSuYL6YOvd0IyqBivPcEDpKRNxFaeR8Tj8PcgiOep14rNtMm0ehPthelI6ld6lrXEotfUm41F5bY6CJBNgbGob2TKsn1m39i511c9AGaa2ia5sSVzPQjiyuAU/Kqw==
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(261022105027099003)(261022075727099003)(261021121427099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uOhlwOZHUmqb+JLSHHJ0DADew2w7z+jgRrDd9WnFut55CZ+u73x1P/I6JOArU4BDBJRKdidZsUG8v9BjxFCkQ2CEazcMrC6SKENHcmFIo44OdlZs1q0GlBiWOFIXkhvsR0c7LpyxPqIlmQhj3yz3K/r6/2WvmnFr8STb1ugvf6/Wq9mOo4XgWTu4lVyZu+E33VS9OiLt28j0j3M76xlkYSvvKOX/hF7mM6WumYyN99KWC7z31fg8173LDVAEswm8w7HAvmXluxx4PcETXD/aCvbKqoSOUa8VTQjPbizUqMIlhgzWVvaBFh2R/XhFoI1KY97laDbflNAN9XJeRMrdreIxH6/KxKEPhYSW3FQuQ4HgJI3NSAvzuFseEgpCGWsWZ+N7g7CrZbHyzElIFfhCw0v5KtjQzcFfUfhuhdDFWQzHbCovS9h5Z2K6alJl0lyq
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 09:45:59.3046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e93f871-abbf-4ac1-cdf9-08df35a16feb
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB9241
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 09:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248921
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
v2: change ??=3D into +=3D as received feedback
---
 meta/conf/distro/include/maintainers.inc | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 74db3e44e92..8193fbbf474 100644
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
+RECIPE_UPGRADE_CHANGELOG_SKIP +=3D "\
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
