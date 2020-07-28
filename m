Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.55])
 by mx.groups.io with SMTP id smtpd.web11.3114.1595900227554663816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 18:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=JZDBbPyW;
 spf=pass (domain: agilent.com, ip: 40.107.237.55, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpXKVJfNwM/NqoW/b6R08JuruU0ArTOd6B9DqwUo21TywBTc5UCYRkKAfkvcyaVCKlsE1krcKjKH+chqcoKY+InQXxH1z9OG756drWHYAEyDy9p22/l2GhnWPdg0D9Y14HvD1wMqXgkyy4M7VW+9XIjFMNOHOmlD/8A1BmR/t4OVMA3kmLk66VJNP1bJdr9nZcmUxAHzKwAnZELeYbpiFoXMMzuL3n21Kp53c7fhXxrTf6iN7DIMr7+Xq/iWcgRbO2rM9eaPtJXEOieMGitE9B40+ZvrSGWWfma7Q77qNxnHyWWn3xAlgP4jUTnwl0Vg07a6ztSIxnwokxfOyP/bcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFIgEyYu0AxLv+Mnn2TM2tDhg7VAkiOl136fq7YY19s=;
 b=CPC/caOqXvlYxJCrt0LAI8l1+V+BEmbqoe4G9Ow/g7quapJBvUJS9rrIk9Xpxrqn+ZefstvXB+euiRieQncAcvOtVSTYNB6M34j9McGLG7l0BZ/m3ELebbMMj/RdBl9rab5e1SnXQAIIDkeuL+EOEPzxyCyPtXHrNYdZDPK1hMxJA8B1tkWSCv7KybFW6SwNKOzzcGTSAyr3lFIhF0YT3IwOMsqFxDwQlQO6Yr873WYmR0nvU2Dod4gwbRZZyU0xvbeIlOEZt0fmrBC8l+7zyyo3oFzRXlyktcplLtMBw99dGtMdKdO5I2uUnHXJ9QjQufKyywRDmQdSMczekpA5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFIgEyYu0AxLv+Mnn2TM2tDhg7VAkiOl136fq7YY19s=;
 b=JZDBbPyWzgDMLUou2bR8MoWoMj2ENy9IK45tW6fCIxBIAU81g02JgLyVVcdlhY/9w2Vndr/PWSRDl0eJol5ffW2+lamS+lhEyvaEJDjulvWkddVSCjtpg+zSTrW6NypczJ0xBnYHx/LiBajT3TgNqgDpnHVsIT0Q9zW2zOpgBlUNF9M91+WGk9mytK9EEeH8+E5t/F62WdL/nmDINZlYbiGDsAv1Ji6jIeLSMCMJysidhc74K1Hfmu6OZazoTtu/D57yRu4GcIQZcoHG7z15HNmMiBGUTGA0/PEzRcT3wsELWcVeKMv6wElkTKStJwAHboVcQxTcUKIJ72NVr73Lwg==
Received: from MWHPR17CA0068.namprd17.prod.outlook.com (2603:10b6:300:93::30)
 by BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 01:37:05 +0000
Received: from MW2NAM12FT031.eop-nam12.prod.protection.outlook.com
 (2603:10b6:300:93:cafe::75) by MWHPR17CA0068.outlook.office365.com
 (2603:10b6:300:93::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Tue, 28 Jul 2020 01:37:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.37) by
 MW2NAM12FT031.mail.protection.outlook.com (10.13.181.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.14 via Frontend Transport; Tue, 28 Jul 2020 01:37:04 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server id
 15.1.1261.35; Mon, 27 Jul 2020 19:36:50 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [meta-oe][PATCH 1/3] lib/oe/log_colorizer.py: add LogColorizerProxyProgressHandler
Date: Mon, 27 Jul 2020 21:35:55 -0400
Message-ID: <20200728013557.111830-2-chris.laplante@agilent.com>
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
X-MS-Office365-Filtering-Correlation-Id: 868f9138-00bc-426f-26c9-08d83296bbbb
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR12MB317678CBBCA1B5A676BE671C8B730@BYAPR12MB3176.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mEjmQcgu6NMYEfV6ZyY97DNIhKFO7U3nnX/ujoOuW4+7y1AjmZduCADO/HMyWUHd2B9TRVXW0wo0ZyZvUpB5/KpOhCMhllaCD2+SLpxoh7mPJQ62ZwOtSH0Xl2XlAmw0/r34aNkG8ZZBfxxJ9Vkc6MTBegPKZXVqaKtQkEzjbYiWWxCgZAeDR5GVPqT3zpIfNtAA2GGkkaLgKe22r0QGWYdP/gPYfukcfCNVOI/tB0ON9SkcD495G3jixQ/+TTzJ6dKlXipYhrCK3lZguDvNhcx518WmDxFGfepJm8/W1sQVb18eTs3+2uFy6Dri/cHs86LJzJD4NjSubvT4vhr7PdZZiutUD1CSm0dhjvUxUtkZN5uXwCuegjxYwDAYIIb89D/6kqgOXC94mzV3QwVJaTG5XkOySlFbxfnESCI4sdjwBEozHllkje+c6IsK7t6Mo42nc5AKB+Zn2t2GZedxkPgWWxtSpQeDVvNe6aFHbZ2Yw3cfW1UlZB7oQQqm+VMIJ7IlLdDdOfwegWcAF7OxiSpO/jRVjmvolog69oW4GP0=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFTY:;SFS:(376002)(39860400002)(346002)(136003)(396003)(29502001)(46966005)(107886003)(956004)(86362001)(4326008)(6916009)(966005)(8936002)(82740400003)(36756003)(26005)(2906002)(2616005)(426003)(8676002)(336012)(186003)(47076004)(82310400002)(1076003)(356005)(44832011)(316002)(7636003)(70206006)(478600001)(5660300002)(213903007);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 01:37:04.7973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 868f9138-00bc-426f-26c9-08d83296bbbb
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT031.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3176
Content-Type: text/plain

This progress handler intercepts log output, stripping any ANSII color
escape codes. Then the stripped output is fed to the underlying progress
handler which will render the progress bar as usual.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/lib/oe/log_colorizer.py | 86 ++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 meta/lib/oe/log_colorizer.py

diff --git a/meta/lib/oe/log_colorizer.py b/meta/lib/oe/log_colorizer.py
new file mode 100644
index 0000000000..10021ef880
--- /dev/null
+++ b/meta/lib/oe/log_colorizer.py
@@ -0,0 +1,86 @@
+# Copyright (C) 2020  Agilent Technologies, Inc.
+# Author: Chris Laplante <chris.laplante@agilent.com>
+#
+# Released under the MIT license (see COPYING.MIT)
+
+from bb.progress import ProgressHandler
+from bb.build import create_progress_handler
+import contextlib
+import re
+import os.path
+
+# from https://stackoverflow.com/a/14693789/221061
+ansi_escape = re.compile(r'\x1B\[[0-?]*[ -/]*[@-~]')
+
+
+class LogColorizerProxyProgressHandler(ProgressHandler):
+    """
+    This is a proxy progress handler. It intercepts log output, stripping any
+    ANSII color escape codes. Then the stripped output is fed to the task's
+    original progress handler which will render the progress bar as usual.
+    """
+    def __init__(self, d, outfile=None, otherargs=None):
+        self._task = d.getVar("BB_RUNTASK")
+        self._color_log = None
+        self._nocolor_log = None
+        self._exit_stack = None
+        self._original_ph = None
+
+        self._suppress_color_output = not not d.getVar("LOG_COLORIZER_SUPPRESS_COLORIZED_OUTPUT")
+
+        self._tempdir = d.getVar("T")
+        logfmt = (d.getVar('BB_LOGFMT') or 'log.{task}.{pid}')
+        self._logbasename = logfmt.format(task=self._task, pid=os.getpid())
+
+        # Setup courtesy symlinks
+        for suffix in [".nocolor", ".color"]:
+            loglink = os.path.join(self._tempdir, 'log.{0}{1}'.format(self._task, suffix))
+            logfn = os.path.join(self._tempdir, self._logbasename + suffix)
+            if loglink:
+                bb.utils.remove(loglink)
+
+                try:
+                    os.symlink(self._logbasename + suffix, loglink)
+                except OSError:
+                    pass
+
+        super().__init__(d, outfile)
+
+    def __enter__(self):
+        with contextlib.ExitStack() as es:
+            self._color_log = es.enter_context(open(os.path.join(self._tempdir, self._logbasename) + ".color", "w"))
+            self._nocolor_log = es.enter_context(open(os.path.join(self._tempdir, self._logbasename) + ".nocolor", "w"))
+
+            # Reconstitute the original progress handler. We will feed stripped output to it so
+            # that the progress bar still shows up for the task.
+            original_ph = self._data.getVarFlag(self._task, "originalprogress")
+            if original_ph:
+                # We don't want task output showing up on the screen twice, so we'll just have
+                # the original progress handler write to /dev/null.
+                # Note the progress handler itself is responsible for closing the devnull handler.
+                devnull = open("/dev/null", "w")
+                self._original_ph = es.enter_context(create_progress_handler(self._task, original_ph, devnull, self._data))
+
+            self._exit_stack = es.pop_all()
+        super().__enter__()
+
+    def __exit__(self, *exc_info):
+        if self._exit_stack:
+            self._exit_stack.__exit__(*exc_info)
+        super().__exit__(*exc_info)
+
+    def write(self, string):
+        # Filter out ANSI escape sequences using the regular expression
+        filtered = ansi_escape.sub('', string)
+
+        if self._color_log:
+            self._color_log.write(string)
+
+        if self._nocolor_log:
+            self._nocolor_log.write(filtered)
+
+        if self._original_ph:
+            # Pass-through to the original progress handler so we get our progress bar
+            self._original_ph.write(filtered)
+
+        super().write(filtered if self._suppress_color_output else string)
--
2.17.1

