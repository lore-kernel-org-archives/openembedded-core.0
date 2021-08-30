Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.78])
 by mx.groups.io with SMTP id smtpd.web10.114.1630338775852552679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 08:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=c1OQ4qqJ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.236.78, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuKJ2+LtNIguAPGoIRbiCl98R/4Di1PdZjKQI/QCiZRCNIRznn6RAVbrnlj2+K+wvdk+tprG2Kf0QUfflf7SdmiWTx3ZrXJQE9R34uq/9vgN78CgaOthrnzFqUKfK9akw2Y83RLo1dU8lzIMiNCKfVf4osSGVyqDimtKlHx/hXCgsLdF+YvQtsV3/XMIVsRrVi2YG9pE5eD/xFKMkgquA9NnS6OpOZlZy5xiTj03+8zmqdQCymfDDR8pX1gpNwziD40BYrYGnq5aYn0F+djr9BNcTu2GDFPm2K2KYVSU1xpx24KDs5i4bo+yyCHr4eV9XJET6ii29NRD+oO/9Hfkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngI2RPV8CPKqZzFWWW+JNfIi/QF/IdNqKoKOfXnl3nw=;
 b=Cbhlf8QjXtdsoKE6UzS+wx7oZDaXyHbW7JUxWUEzXTG+S9m+QRG2tHVe8/CFBuloDuXVH/M19Q9sjLtAaneYCK9ttNDsXqnM5hvDBvfU2blLXmZM7tKwGqIDNyEtFiJ+5awQYHcBeHh4bee2Z4YBLzj6o+U5lNp9d+vibzxI6/lVBIVXkGzB28WRP4dbnPmOQ3dZ88ImpigOQlBrKjpLSSXhVWrRQ6kbxuExGcmo/emsTZOShQw7KoOnbMPAve3+lPFAtMDHMnImkTRM5FqY+4wtP1mMsQKWaS58GLwrWbjYqMESNkh8vxe+uJhRFYy+qUxDfOmNI1Wi+rmWolCwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngI2RPV8CPKqZzFWWW+JNfIi/QF/IdNqKoKOfXnl3nw=;
 b=c1OQ4qqJMU4eiVzEsNYHmjbCD42saoLZerhJgAzL9NO+/sBQXc0j1NRUYUESZB94I4eAIYe8ajqf4yyAkH6HXXMgNz2/c8eHttCbCxi8s8O9DXjKEt8Q+QjXNg1XSdu9O/WbxdK+QDfN4IYubtLlirq4Tq/D+nocP19ihzQ1Itb0rh8mEsK6YlC+atTreIfgpCu2gNEtAvK+eu4Gs+pjmFtXSzM5l66NZsGqb5Az2C6Oxbzyv7pGfRRaLp+DTbqFYLk1k2kOe69CDOJTqBIw17wt24jzbKHnbjrOhiubT+D79akcVmQo9xQz+cKEd/uEDleVqonPSoGkmiKDBU8myw==
Received: from DM5PR15CA0041.namprd15.prod.outlook.com (2603:10b6:4:4b::27) by
 DM4PR12MB5247.namprd12.prod.outlook.com (2603:10b6:5:39b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20; Mon, 30 Aug 2021 15:52:54 +0000
Received: from DM6NAM12FT068.eop-nam12.prod.protection.outlook.com
 (2603:10b6:4:4b:cafe::98) by DM5PR15CA0041.outlook.office365.com
 (2603:10b6:4:4b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Mon, 30 Aug 2021 15:52:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.34) by
 DM6NAM12FT068.mail.protection.outlook.com (10.13.179.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.8 via Frontend Transport; Mon, 30 Aug 2021 15:52:54 +0000
Received: from laplante-lm-19.localdomain (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server id
 15.1.2308.8; Mon, 30 Aug 2021 09:52:50 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joshua Watt <JPEWhacker@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [hardknott][PATCH] bitbake: server: Fix early parsing errors preventing zombie bitbake
Date: Mon, 30 Aug 2021 11:52:33 -0400
Message-ID: <20210830155233.12816-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a33f955-24e3-4895-262f-08d96bce3ac3
X-MS-TrafficTypeDiagnostic: DM4PR12MB5247:
X-Microsoft-Antispam-PRVS: 
	<DM4PR12MB5247662DE9CCAA0FA2A3730A8BCB9@DM4PR12MB5247.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4d/CsQhRelnEWS7/cZznS7nzez+frUFO85xflPKmMIvDxYbqDUpL59yDd08HWuS+oiOLKydKgkJ/VZ/rFQ9CcLGvUY8c2kNXSBydxMazSfW6nADRkX4ag+thZNrmDSsXANVw3rD99Tuyjf0wMBIq55/YehFx3W4FtFyNjLxbttWhPRKi0skOzFDkZpIeTXSo87w3IvMuakaHFAiEasm5JHsCcLYItMzoG3FWQyGLAP3bNa4HsFDzSun8s1VmFDfPVpHoX89yd6hEB4pVhzthkWd8vzzNyKU96P8r5jzyjdHaluzEiAeSaAxgaMGgV8oiPvXf5h7UmAEBFaxBsAlKjvYMMJfYYFU8bAJekE6v7q01A/hKd5vrcDjSSba6H1RPKnvRMFIX2MSNGu6usyT9sC83nHS9hd/pBIzJjHn7z1/liGk+W9dKepLzNEb4YF7z3oqaJLWTyXRJCWMZhVPDEe3tzbdAaaE7KmkKEXlLKhLzJgN0E7qSXZqBGyy/YvsHGqnXqwM4+Smjlhf0j5Q4IJ+3XNjqSUDQvNH30uG0K+6Ph1pOgxENQIFdSCWH5oeFZ9foc5qD8u+/v+PSdK6lNHIG584MgeKALc/rOkLS34G/C/8WFuaX+sbNdv2OnNPmPA2uRMPMwLMVKMa5iQ+uS4+jQ3fZGm5M+UuSQCTgYOCLFY7AGJR8cIMnJMCr9HYhAyC5r3YY8Y6Qpr3pUyKVBtDfbYIqWmPe0NnsUFu/kU0=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(29502001)(36840700001)(46966006)(478600001)(336012)(8676002)(70206006)(4326008)(7636003)(426003)(36906005)(186003)(26005)(2906002)(54906003)(316002)(356005)(36756003)(6666004)(82740400003)(44832011)(6916009)(1076003)(82310400003)(2616005)(8936002)(956004)(86362001)(36860700001)(5660300002)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 15:52:54.1769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a33f955-24e3-4895-262f-08d96bce3ac3
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM6NAM12FT068.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5247
Content-Type: text/plain

From: Joshua Watt <JPEWhacker@gmail.com>

From: Chris Laplante <chris.laplante@agilent.com>

If the client process never sends cooker data, the server timeout will
be 0.0, not None. This will prevent the server from exiting, as it is
waiting for a new client. In particular, the client will disconnect with
a bad "INHERIT" line, such as:

    INHERIT += "this-class-does-not-exist"

Instead of checking explicitly for None, check for a false value, which
means either 0.0 or None.

(Bitbake rev: 7668057f8565655611de23d143432d1c05dae3ce)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 881005ec405f26b8f7f4b41505d69579e83b69c4)
---
 bitbake/lib/bb/server/process.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/server/process.py b/bitbake/lib/bb/server/process.py
index 155e8d131fea..a0955722e336 100644
--- a/bitbake/lib/bb/server/process.py
+++ b/bitbake/lib/bb/server/process.py
@@ -147,7 +147,7 @@ class ProcessServer():
                 conn = newconnections.pop(-1)
                 fds.append(conn)
                 self.controllersock = conn
-            elif self.timeout is None and not ready:
+            elif not self.timeout and not ready:
                 serverlog("No timeout, exiting.")
                 self.quit = True
 
-- 
2.17.1

