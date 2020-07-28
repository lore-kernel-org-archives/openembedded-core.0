Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.50])
 by mx.groups.io with SMTP id smtpd.web11.3115.1595900228161238040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 18:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=B2ygdcqn;
 spf=pass (domain: agilent.com, ip: 40.107.75.50, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5NbwKjiEZIKLnjGo49Oa1VYxu0ePJW3XXhhlrYzdWVHuv/kWxh/iVhH5wCZOX1PPXrNLu3Yyx7AQXX0TqG6xH4jIH8oPQ0trC8RzvrKJr9S+Wsh+gr0xWT6ZkVrgOlCLGYM6kWDgMzwWtXzG8QYomqsu7s59A/qGYruA0OBFERkRLlXHnIu4SYqw/ICE95PVGKctsDtckIkeDHY20yZ4EKAg3tkoPlE5hCaHvbEKNZBkeKrJ7s1cWR21YPPE0OVSdidWTJr8CAFzejBLqcRvox+8c/pibRswwoTRe1dtdGTRZKG2uYJOezSOrDur8OH0ISlUuuVMtaHz2fVwPfreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTlcNonubLjbFgkQhxFn8U5x2doXXGR/TmMTO+OQZx0=;
 b=JlpjMgdYB9VgAufmH95+icCM/bdRk+cILWKbXHixkxNl84a4mOEBRnz2y4L6qs4A48qHwT39IBPbpPM9pNdGv+Owhm8B0lOHQJtWea51RyFTbd/2vOVsUxDXxapaUbSoHyiTALPqYmwrNCskD6GYrl78mWJQP9rsbzWmr3XCsN1N3Kwa2gjy620ELdUGhd8AY2SAYrcOxBSZO1al60VzQ7z979obA0KLNN+tDnfg/lGPkLaBemeFYn3Ywco4gu7IWJjeAn8JEq0y17eL91kOL2Gwf6KzWfdqpdmhALoTsSKquk2VcpktPl02B4OEE06RWpilkfpRYCDf+qVZzfJx6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTlcNonubLjbFgkQhxFn8U5x2doXXGR/TmMTO+OQZx0=;
 b=B2ygdcqnP1l6Rr+1wnGpM2n+hkT7tgOyneOuRgyFrg2IBvrJa5sAHjjxNH13bOFzF3pF7w2zVwE4zl0ZiUtOgWg6YZTItYIFDIX7ADBXo9jHdnlcAxGmvQHCZ6WfI9thzcpO78Bz0LQlF6pfx/SlPaFJpes2EptRBcfaZzXtlMlrtBAWV/Bo0vH1O/UODvUdPTORPLilk/E0n0cJmGtICydc3ukCZIfh79bHZWOHOs7jrVLFp0lQgXv779zMuXX4lbUEtjJUGfgzXJp9/dojY6O7J4N0ksLm/dr/HAQ6TtpvAz0nxbVyDtDzjMhVzzOkxw5vdIHnp+MfFcwNmYlVVg==
Received: from MWHPR08CA0060.namprd08.prod.outlook.com (2603:10b6:300:c0::34)
 by CY4PR12MB1512.namprd12.prod.outlook.com (2603:10b6:910:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Tue, 28 Jul
 2020 01:37:06 +0000
Received: from MW2NAM12FT051.eop-nam12.prod.protection.outlook.com
 (2603:10b6:300:c0:cafe::4b) by MWHPR08CA0060.outlook.office365.com
 (2603:10b6:300:c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Tue, 28 Jul 2020 01:37:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.37) by
 MW2NAM12FT051.mail.protection.outlook.com (10.13.181.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.14 via Frontend Transport; Tue, 28 Jul 2020 01:37:06 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server id
 15.1.1261.35; Mon, 27 Jul 2020 19:36:51 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [meta-oe][PATCH 3/3] log-colorizer.bbclass: add new class
Date: Mon, 27 Jul 2020 21:35:57 -0400
Message-ID: <20200728013557.111830-4-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728013557.111830-1-chris.laplante@agilent.com>
References: <20200728013557.111830-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg1.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc6076ca-2ba4-4eed-5a24-08d83296bc8e
X-MS-TrafficTypeDiagnostic: CY4PR12MB1512:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR12MB151259FAD7534EEF8074BF738B730@CY4PR12MB1512.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qtZBrJuZei/MXvg4mAOsODRASQRv2veXcy9Ny8UsP8qFEhfQPops4g+KpgBC13Q2zl/qrA6WU2R0k9OgW2VOg2/tMWnRHqy87AXgrl1iAd/RjXK8XgAJmYX794iWqUvXEQ/f9KKRUqPWWBRHqzxe5RuurmwiEm77nYrTYGmdvn3j7x6CJof6du1a7AfrViD26XM1RgEjSl13RM4Clr6ZoZxd+DW4eASMHguXsgBGLqe5O1PQm1tWaJAOOf5ogqM1DRYG4PT7yprYmbvbDmNA8ccMttJirEz/i1+cLMX1ZDjuvwnhT5h1k6duYBhs5G8EfdkgNO0jNyGORCNjBEzr0mUHMuSUKi+/jJJ/AwdAo2dlgxSjKDb4L1PCyN+uVbjHqJUO0X9UkDQZWs/tUHKPgYzaeFVAM1lLkddZ1kmUjbw=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFTY:;SFS:(136003)(376002)(396003)(346002)(39860400002)(29502001)(46966005)(82740400003)(44832011)(7636003)(316002)(36756003)(47076004)(4326008)(478600001)(426003)(1076003)(26005)(86362001)(107886003)(6916009)(2906002)(956004)(70206006)(82310400002)(8676002)(356005)(2616005)(186003)(336012)(8936002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 01:37:06.1644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6076ca-2ba4-4eed-5a24-08d83296bc8e
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT051.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1512
Content-Type: text/plain

This bbclass turns on compiler color diagnostics to make it easier to
visually interpret compiler errors and warnings. It can be used
per-recipe or globally (via INHERIT in local.conf).

You can set the LOG_COLORIZER_SUPPRESS_COLORIZED_OUTPUT variable to turn
off color output - this is intended for usage in a CI environment.

log.do_compile and log.do_configure task logs will contain the colorized
output. Non-colorized versions (log.do_<task>.nocolor) and explicitly
colorized versions (log.do_<task>.color) are created as well, regardless
of LOG_COLORIZER_SUPPRESS_COLORIZED_OUTPUT.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes/log-colorizer.bbclass | 49 ++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta/classes/log-colorizer.bbclass

diff --git a/meta/classes/log-colorizer.bbclass b/meta/classes/log-colorizer.bbclass
new file mode 100644
index 0000000000..4271957e28
--- /dev/null
+++ b/meta/classes/log-colorizer.bbclass
@@ -0,0 +1,49 @@
+# Copyright (C) 2020  Agilent Technologies, Inc.
+# Author: Chris Laplante <chris.laplante@agilent.com>
+#
+# Released under the MIT license (see COPYING.MIT)
+
+LOG_COLORIZER_SUPPRESS_COLORIZED_OUTPUT ?= ""
+LOG_COLORIZER_SUPPRESS_COLORIZED_OUTPUT[doc] = "If set, then console output from the colorized tasks will be stripped of ANSI escape codes."
+
+LOG_COLORIZER_TASKS ?= " \
+    configure \
+    compile \
+"
+
+BB_SIGNATURE_EXCLUDE_FLAGS += "originalprogress"
+
+CFLAGS += "-fdiagnostics-color"
+
+python log_colorizer_eventhandler() {
+    def is_task_enabled(task):
+        return task in (d.getVar("__BBTASKS") or []) and "noexec" not in d.getVarFlags(task)
+
+    for task in set((d.getVar("LOG_COLORIZER_TASKS") or "").split()):
+        if not task.startswith("do_"):
+            task = "do_{0}".format(task)
+
+        if not is_task_enabled(task):
+            continue
+
+        ph = d.getVarFlag(task, "progress")
+        if ph:
+            # Stash away the original progress handler
+            d.setVarFlag(task, "originalprogress", ph)
+
+        d.setVarFlag(task, "progress", "custom:oe.log_colorizer.LogColorizerProxyProgressHandler")
+}
+
+addhandler log_colorizer_eventhandler
+log_colorizer_eventhandler[eventmask] = " \
+    bb.event.RecipeTaskPreProcess \
+"
+
+python __anonymous() {
+    if bb.data.inherits_class("cmake", d):
+        # Inject environment variable to ensure CMake/Ninja gives colorized output
+        func = d.getVar("cmake_do_compile", False)
+        if "export CLICOLOR_FORCE=1" not in [line.strip() for line in func.split("\n")]:
+            func = "\texport CLICOLOR_FORCE=1\n" + func
+            d.setVar("cmake_do_compile", func)
+}
--
2.17.1

