Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2673.1792484785293925076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 01:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=l1otWTBw;
 spf=pass (domain: ericsson.com, ip: 40.107.130.25, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovOYccjqGCNosI1YzZOVKbyhjf2HvzZXHXBBfazxmWr9157wBEJvF5CsW82u69zTDknpazL4KYGr+7gMtl/5nOa0wFVc59HNXtK0XGZoX5frRS6+DlFYFz7WkDa3iQB2r4qxUpiiEvX2zCdvwnzEY8E7j/IyfLnKzIHTw0tbmSGU3HsiatIia92TdIm9lghUmGYBn186jOsO7vTQFzQ46/cZYFHJdTtS1eH9gzbVv6Hsz1BmWZR1pkRnNBmz1ONxnejEHEc2XMmFlvPvvL7Xe/lsppvki9dTlPqzawfF0QP52xHoWyMzVw6zsOHPao4xSdyynNZ7r2pFgHXurhUBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4oqrz1xWml6D93eXB+VkQRNv/ttZ8kILL6sPAWTg/M=;
 b=R+6Ei09Wcn2/1cX9yAO4V7naBpgn/xutlkYKOQZYmKye+MQGhlXWQbRmH6QrztfpXjpwN3hY/CrELUSXRzUYdlphPIfrwuh2IxEjfwGtceAla7KSuy5nZgySlUnDjUH0wbJ+h0gMRNxN00YrpafyuKvdIE40H6rPYDUpArUb4NdMEfKAidhxsGPTkXGRM610l85L1BtY0IwT9p6WRzDo2wEjZdQ09lcuLVU+K0Gjt73/rjswWvgj8Dki28NMgslZGVM6z9Eaaq3bRSA0MkhF85jQIsOE77sI4u34TP/moEjECt4gJ0AB+N5uVl/dc0R8uFUayRNXzS2oWCde67NgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4oqrz1xWml6D93eXB+VkQRNv/ttZ8kILL6sPAWTg/M=;
 b=l1otWTBwLuYd+BF3Jj6fb+AdLBqmTQZ0G078KNScgsuvUuGNL4eWoEFzT21Uc4NSzWsOjQTpFVdtPZiHZ2jXKjO2LuOxZks7XgwgmBjJNELbbo2kLlH/VZBJ7/Pl7kqBtuHQqj6mvaJLAiINZFvpvEVlMLA9uTe3lvmgtOnfkK3OkjUBKJEZ571MHV/FsRczhJmRCB6Ne1P3L7AZ3lzVt8XzI0c+yhP9+G6E1H4PZFU8Yac4c3glFY/RpQ+88ij4qKIB7OhjN8mvY3ORVIhRbtPO8we3If0zEFIZMKF40IzxAPpuJrlDQPpmuZsH6ch6EvbSJ1QSmg7+znP0t/8odA==
Received: from CP7P275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:100:66::13)
 by GV2PR07MB9060.eurprd07.prod.outlook.com (2603:10a6:150:bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 08:26:19 +0000
Received: from MAD0EPF000008AC.eurprd04.prod.outlook.com
 (2603:1086:100:66:cafe::5) by CP7P275CA0039.outlook.office365.com
 (2603:1086:100:66::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 08:26:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MAD0EPF000008AC.mail.protection.outlook.com (10.167.241.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 08:26:16 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 20 Oct 2026 10:26:15 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 9AA964020B46;
	Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 7001F700396D; Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH 3/7] python3: upgrade 3.14.7 -> 3.14.8
Date: Tue, 20 Oct 2026 10:26:07 +0200
Message-ID: <20261020082611.3115623-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020082611.3115623-1-daniel.turull@ericsson.com>
References: <20261020082611.3115623-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AC:EE_|GV2PR07MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c4aff7-b9a9-406f-b56f-08df2e83cfa2
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 8Vjp6yUdlQjVXte28FzSTw9kQZcUmvioDYxjBv5eJKSJs4ialpt8FA8HDFKWoP/aD3XFkmgAB1OAKW58gZ8jFeExUw+gr+xZWgD8eP6No2TCP3UbFRyC96WP7oMszc24h3JlzIeLCNxA+Fl5PJA3Kduyk9YYOXG/lKmYwFjFa1wixFI9HVN+PTPfH+vIIigYEHPcrUZKSbc9fUwj7nGAut8+YTubKyKZ2Bb8YRS4N+P0OwwEWiU1M97RAe14FVJl5bQR6TEt84Zpb1KlXpIS/K4cuMeE0NvwKiyHv/nu8TEG/0qxo1WxdM8WnoIqqJafVvc/8Afdu2wAVsqlyGu4lir3QJAkIPxlvZ2RqMyJi5TuqZmbhf4jn1tFNpIJgTiUOR4260mdJRrgDwpsCF8p7BYjX2xyBBRstizXqYcCh7B6jnR+bzFPyuOxxOhpURrquwlOgAiZMD+TTS0bZQGfzfyhxS37dE+/OPzK9cDvjFCloJ4uKGXAX6cDOfI9AjhOnpYyenbi6T7Y8wrQDKvU1E0ZTSXX97RGooPaqgDC631bPUEjNzq7rGHYrjWAMPsVtrYkERC/YueWvvzmFZ+zwCg0kaBC//gGN4FSuFIh8Bw/bADRU7XeXHg4yYhe4THU2whyea6GScMJRRpztyhrOv63DoJ5v/NaZHNJOZOAngpX5g5qs1t82txhEurBtJNlOISakfS64DS+xcYF5bBQgg==
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yKa31VncassNEQfSyHlGj1ZzEdmoa1bSlIeZJ/3ZJTOVtjVl8RmLvnMJbG/0dGFK15YLXm5IsXG9znQH2FNGT5+taSMtrwxhWSsmhHmQdN+bP/cYhFAJGYQK8k4ciANXdM+oOUYIjwZlvHhzt7zdOGxZNmI5I01JyOVgLjiU61Hr+7JH3GS3kot6f4TIgrtsFKQd23/v+jwnCNlJczbVQAZOLSt45NGjyus9frD6eAd6k8Mb4q9pjTgirSmPmF48fSIfAxCF+xqT86mxjIMoLSv+8rKyWGPNKHV1c3QQIYrCY4DWiSYsHU9qVMINrRKBfe2TLHou8vwMhVHANWhjBxtPR56cJzIIdy+v3iizcdPrbxKW14/QyhY0chsaRwTVpc6Sg3UsNL6WLKXq2xaywktiwiYRRZmMRoQ03pHHaY50GqIk+xsK9rXsxRcxkTul
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:26:16.7735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c4aff7-b9a9-406f-b56f-08df2e83cfa2
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AC.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB9060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248249
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Security fixes in 3.14.8:
- CVE-2026-19445: crash in ssl when sni_callback switches SSLContext
  and the original context is no longer referenced
- CVE-2026-15806: scope HTTPPasswordMgr credentials to the URL scheme
  so HTTPS credentials aren't reused for a matching HTTP URL
- asyncio/ssl: validate server_hostname when check_hostname is set,
  for start_tls(), create_connection() and SSLContext.wrap_bio()
- zipfile: bound decompressed data per read for bzip2/LZMA/Zstandard
  members, matching the existing deflate limit
- tarfile: fix extraction filters creating directories outside the
  destination for names that leave and re-enter it
- Bundle libexpat 2.8.5

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../python/{python3_3.14.7.bb =3D> python3_3.14.8.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D> python3_3.14.8=
.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-=
devtools/python/python3_3.14.8.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.7.bb
rename to meta/recipes-devtools/python/python3_3.14.8.bb
index e73dc8d772..99152fcb2b 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.8.bb
@@ -40,7 +40,7 @@ SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-config=
u.patch \
            "
=20
-SRC_URI[sha256sum] =3D "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e25=
2c11a66be27f81"
+SRC_URI[sha256sum] =3D "c2215904f02b175596dc49351585104f4bc20341e1c47378b2=
6a2c274360ce73"
=20
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
