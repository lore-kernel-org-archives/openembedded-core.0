Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.110])
 by mx.groups.io with SMTP id smtpd.web08.7309.1624626910369808196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 06:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=YhGGFo/b;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.21.110, mailfrom: massimo.toscanelli@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCPpKgpijcqt8oVYDTPyzc8sgcDOik3ei2Y9D2foF4Gc+atRJTTL6+tfqGf6rx0ig6xozD+0JBNu/uT6X/G7Us9pyUtZYQFPvsXkN8a5lxRpCki6c/zzg0i0MNnFEWrLYreAO6IMhcCEr2rnWfPaW0P4qpdNMbAN9QlZedH/vSwq2ob2RNeNo5e4A4B09aFLxnfwR56n8Hpkec5YUnmxEehsZRI1B4Ju1/XqSGKJOaubZC3b6b8jDFiN+i5ersciIbTx0PVcBuSray+R1ohzzsT81ODumguuHaNQkVII4Ohe96ARqSgmHrA4MyjUdLqv8h+5KIXMuOmTw+s8Di7d3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KECHF3BUKcylKhxqcCz3MFRxNMmmkxnqole2NvaMLXI=;
 b=CEuv+PAzhDyMEKigfbnA5yudiyiy1z5YhSX2qpb3Q1t5Sbw04zRa1t7xeX4nSLwtlVdZPWbDOi8Vdg7yFbc5UI+BUfY6NFntPvW0UwC4uiR74FG0aPU3PK9smIudWZ07Win7WxHelCf2nusYzW5ZLEh0Pqd0DdZgwpNNjK4tngFtwAn3u8+Qs9f21OteqzVOySioWOMyX2JBtsQyufElrsU/puGURbH/ut+3Wljq0gmnD3bRkwbE+0d02RA9kKfOECem9MfJ78NHbbp6V4rNjtsMRyJM0/08QMRPmAJvFtsVh4Mf51xvi9BWaHwTNLEJQgsjuDDCauAPOs75hM/74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=leica-geosystems.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KECHF3BUKcylKhxqcCz3MFRxNMmmkxnqole2NvaMLXI=;
 b=YhGGFo/b3PvwHLFW0HRGb97/Kie3pROqbpqzK7Yh34czHnemqzh+jRxZUegw/1WnY2p/Zc2QgFcYwnA2sc+iEpGsF46N9XEoSBmgHhdP39Ts/f0LazJqH9eE02DB8UEKmMHCK5CBIBY/x9AGzsYJ21OcQ6VHcNoZ1J2WA1B36+k=
Received: from AM6PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:20b:92::40)
 by DB7PR06MB4826.eurprd06.prod.outlook.com (2603:10a6:10:66::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 13:15:07 +0000
Received: from AM5EUR02FT054.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::c0) by AM6PR04CA0027.outlook.office365.com
 (2603:10a6:20b:92::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Fri, 25 Jun 2021 13:15:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; lists.openembedded.org; dkim=none
 (message not signed) header.d=none;lists.openembedded.org; dmarc=pass
 action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com;
Received: from hexagon.com (193.8.40.94) by
 AM5EUR02FT054.mail.protection.outlook.com (10.152.8.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:15:06 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.56]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 25 Jun 2021 15:15:06 +0200
From: massimo.toscanelli@leica-geosystems.com
To: openembedded-core@lists.openembedded.org
Cc: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
Subject: [meta-oe] sysbench: added volatile modifier to tmp variable
Date: Fri, 25 Jun 2021 13:14:47 +0000
Message-Id: <20210625131447.23897-1-massimo.toscanelli@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
Return-Path: massimo.toscanelli@leica-geosystems.com
X-OriginalArrivalTime: 25 Jun 2021 13:15:06.0259 (UTC) FILETIME=[1DA52E30:01D769C4]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: e3925f24-b0ab-4f33-a33f-08d937db406f
X-MS-TrafficTypeDiagnostic: DB7PR06MB4826:
X-Microsoft-Antispam-PRVS: 
	<DB7PR06MB4826DAB0A78E87979BD16983A0069@DB7PR06MB4826.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:257;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SUafYolFtgqZ+KCtM/2p6dfZPvkIBxhwh9yOpHfuovaRWTQTYaNGLqymGWQvtfhdQn2XITjZlYWUIa965Ij2E1UkgXWCUoAOOQfa54DU55qsgRUYQxwE2LU4FlUJk9IBnTXyUzilk/mgpaUGZ3T6P9srOCbC+j+hk6+WjY1H5omQ6de/4nDfe8jZWpv2WBIu4dXC/H32tg+Q1JQeK2eKcoFW2+X8UU3AL0fh0ur1PxRo7sGkT9rSdZ42bBW2gmxfQLW26QfzBRa8ijGAkXM4cf2xIIJT9pLVFkoPWWzzP/9KCCU0i6Mc0LpFM55YKbI1QQ3OCcs+3pVn8foznvMJeTCAqFi4y0/QyQWHlvFeZo0muMD+aT4rWWcvdSgDTeL7FWrbtAVVs19xEmrfb9hzLRuZ9TUJ6WOU6qfmxSYAu9ZxdSAL5/g1LHxWHSORxU0su7LZsVd/03rfhGlM/Seso1O2qpa/rnBeI7OAJvrJyH+SXF6u23er5C3SREwLAHyjPR9NmHPBLyx0j1zMOVPTc72K1jy5Zf/UdlvsvrZlze+Gu5yheyQZgMpQcMugpmKdFuzqALjX94t1qg1/ebFqhgdc6hGULUzV1PKFO2bSwtqD/KHRWv85+9Izpjr+Y5ly8uukP+Z+ef28RDESRy7McOOAhWxMQhYgXYg4ALDUcXyp8zZW3MmaNhweaUSrBQps85Ca8+liQCJezFq4Sdad8VRHUmFEytWLrExQuaIvU5xNhAY4sdWV7bGR7yojtmbShmSHpKjxX5UOUg9HyMxctQ==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(36840700001)(46966006)(2616005)(2906002)(82740400003)(356005)(1076003)(83380400001)(186003)(336012)(81166007)(26005)(70586007)(70206006)(316002)(478600001)(86362001)(8936002)(82310400003)(8676002)(107886003)(47076005)(6666004)(6916009)(36860700001)(36756003)(4326008)(5660300002);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:15:06.7709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3925f24-b0ab-4f33-a33f-08d937db406f
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT054.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB4826
Content-Type: text/plain

In sysbench version 0.4, the tmp variable used by the memory
test to execute requests is optimized by the compiler.
Caching mechanism reduces the direct accesses to the  memory
increasing the transfer speed.
This leads to false timing estimations that considerably affect
read and also random write operations.

In sysbench version 1, this issue is fixed adding the volatile
modifier to the tmp variable.
This prevents compiler optimizations forcing a direct access
to the memory.
The final result is a realistic transfer speed measurement.

Upstream-Status: Backport [https://github.com/akopytov/sysbench/commit/8753cb93be4c0b81a20b704ced91e7a422da52b1]

Signed-off-by: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
---
 ...modifier-to-tmp-variable-in-memory-t.patch | 38 +++++++++++++++++++
 .../sysbench/sysbench_0.4.12.bb               |  4 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/sysbench/files/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch

diff --git a/meta-oe/recipes-benchmark/sysbench/files/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch b/meta-oe/recipes-benchmark/sysbench/files/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch
new file mode 100644
index 000000000..f10b7148c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/sysbench/files/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch
@@ -0,0 +1,38 @@
+From 490043d3a8ea2554301cbf4ec9bebfcdbc525b11 Mon Sep 17 00:00:00 2001
+From: Vasily Tarasov <tarasov@vasily.name>
+Date: Fri, 10 Jun 2016 14:33:48 -0400
+Subject: [PATCH] Adding volatile modifier to tmp variable in memory test
+
+Issue explanation:
+
+./sysbench/sysbench --test=memory --num-threads=16 \
+		    --memory-block-size=268435456 \
+		    --memory-total-size=137438953472 \
+		    --memory-oper=read \
+		    --memory-access-mode=seq \
+		    --memory-scope=local run
+
+Without this commit the time to run the above command is 0.0004 seconds.
+With this commit the time is greater than 3 seconds.  Essentially,
+without the volatile modifier, the compiler optimizes read access so
+that no real access happens.
+
+(cherry picked from commit 8753cb93be4c0b81a20b704ced91e7a422da52b1)
+Signed-off-by: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
+---
+ sysbench/tests/memory/sb_memory.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysbench/tests/memory/sb_memory.c b/sysbench/tests/memory/sb_memory.c
+index 2e8998f..7d22bb9 100644
+--- a/sysbench/tests/memory/sb_memory.c
++++ b/sysbench/tests/memory/sb_memory.c
+@@ -244,7 +244,7 @@ sb_request_t memory_get_request(int tid)
+ int memory_execute_request(sb_request_t *sb_req, int thread_id)
+ {
+   sb_mem_request_t    *mem_req = &sb_req->u.mem_request;
+-  int                 tmp = 0;
++  volatile int        tmp = 0;
+   int                 idx; 
+   int                 *buf, *end;
+   log_msg_t           msg;
diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
index 708c71f4f..cec4d38d0 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
@@ -8,7 +8,9 @@ inherit autotools
 
 # The project has moved from Sourceforge to Launchpad, to Github. Use the source tarball from
 # Launchpad until the next release is available from Github.
-SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz"
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz \
+          file://0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch \
+"
 
 SRC_URI[md5sum] = "3a6d54fdd3fe002328e4458206392b9d"
 SRC_URI[sha256sum] = "83fa7464193e012c91254e595a89894d8e35b4a38324b52a5974777e3823ea9e"
-- 
2.17.1

