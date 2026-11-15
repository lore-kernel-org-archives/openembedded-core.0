Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4333.1794732572394574999
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DFaaI0vC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso10229385e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732571; x=1795337371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f7iXH4nEv2ubLA4XSH/w3O/vGDyit425+b7EzLSXgWE=;
        b=DFaaI0vCV1x4bwApTVHNESdXI9AotNsUQXTX2+cJB4Sz7JYYPYpS91+beqEyeYSL4o
         NC1tMoD2xw41gTCscMlTLma1mzzET02/IiyXqkWTQ6r6LafI3hgukdP/Q8yG+Y2ulHpl
         7a48vp1G21ICUz2iY1ZQayVT1BjbV+kGjgrr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732571; x=1795337371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=f7iXH4nEv2ubLA4XSH/w3O/vGDyit425+b7EzLSXgWE=;
        b=1Kb3GuwNKQN/FBt+MEVOH3jKai32P+ETOqE0xzofiuOqbH+xf3dr9MkiPPakYAjdUF
         IrU+oSWjobyzVu+PB3uMExzx2Q3amsg+9KzHIIQxyd8xJWE0Y38pWGDwM8AtfBWU2nab
         XzOcUfo259cA4D/qywtcPeKQmJzuhdfU4au0/xetLLxhvg6XotcT6prW7jkGBScqW24F
         RS/+meBODIjpaC6+72/kb8WLerdSYJ+nwFjINc7H1uL6s3cm4KvMhsuU3amBWviq7DsM
         brraf4zVOgyOpnCJPg9rt04yRFvkz/s8EK+NpmY0Wy6tX83avwYOXkWRkHqONIn3wTmo
         sOzQ==
X-Gm-Message-State: APuU4Z/zvyQd+Kj5TF6INYGXfYHLRLPqn0nd7BV9GuWAi7czPwQt4uN8
	bXGWuLFFGMGtfy0v4bimoIHXfIyj7pa4uZJp4tFxubgd9EPLtnHLxbZo9EB6R/6do7k7q66RvUq
	GX50RrqU=
X-Gm-Gg: AYBFou21LGtaSGVlLfJ0KwV35NtTwwoFcACZvTLIDqCipZ23+dSijlM3v3ngdJkYOFR
	z5RCSIdRP/nrJOMW+P3C6/hjDyJLoKXellNuV5mHanKMLFFxoYCE1TpETsdAiPPh/xCmtce5e5s
	3djwXI78zKw0I7q6weF1LvTpUmLCMqjc/+QmHYp+b8Taec1adjoD7WrxX3nmcSY8M8OvF8xVa9C
	atgYYIACPRCsY4clZnDek5gWLqQQUhLD+R5zTVu0GdAYjgzuGWQSPkcxUV93UhBEZNus6AY7JDV
	LtxZ/QsOONDxaz8C26067pK62/WI+UDiEEOSno2Fj6E7DaQ+jG1bZI94im2ECaWXPAhDLfCn2Vu
	3TW4KnPBUmBky9Ek8TtAZ/+W/yjenf86aBqKzzjuox2JZm/ZJf01VdfyEQ5DWJD8fD8NizD21ag
	BR/nujDh8D0P3EcFNYf30xY86N1glqOtkLF9iQ3toQrH9gDXObAH5NJR5b0zalQXCX6tOL/H5ku
	Tunjg36D+KUi/ZYRmPWa2CQ3+ztLDX76r48sMh9CBlPE/dctD/NA033glSB5/xvSmiUShJ1fi5Y
	DHHWO5Y1aNcQG8KszKgjwXhfbVTqM4h61nUE56Zm0MewqjnqmFACZ23DRBmOoIuL1nl2ei3aq6F
	cmDs=
X-Received: by 2002:a05:600c:4f0e:b0:4bb:5f43:23bb with SMTP id 5b1f17b1804b1-4bb5f43261fmr109061995e9.33.1794732570501;
        Sun, 15 Nov 2026 00:49:30 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/41] oeqa: Remove unused imports
Date: Sun, 15 Nov 2026 08:48:29 +0000
Message-ID: <20261115084845.701136-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250257
Content-Type: text/plain; charset="utf-8"

Drop imports which nothing in the module uses.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/buildperf/base.py                | 1 -
 meta/lib/oeqa/core/loader.py                   | 1 -
 meta/lib/oeqa/core/target/qemu.py              | 4 ----
 meta/lib/oeqa/core/target/ssh.py               | 1 -
 meta/lib/oeqa/core/utils/concurrencytest.py    | 1 -
 meta/lib/oeqa/core/utils/path.py               | 1 -
 meta/lib/oeqa/core/utils/test.py               | 1 -
 meta/lib/oeqa/sdk/testsdk.py                   | 2 --
 meta/lib/oeqa/sdkext/testsdk.py                | 2 +-
 meta/lib/oeqa/selftest/cases/usergrouptests.py | 1 -
 meta/lib/oeqa/selftest/context.py              | 3 ---
 meta/lib/oeqa/utils/commands.py                | 1 -
 meta/lib/oeqa/utils/ftools.py                  | 2 --
 meta/lib/oeqa/utils/httpserver.py              | 2 +-
 meta/lib/oeqa/utils/nfs.py                     | 2 --
 meta/lib/oeqa/utils/postactions.py             | 2 --
 meta/lib/oeqa/utils/qemurunner.py              | 1 -
 17 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index dcdc053da85..6735e14fc8b 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -22,7 +22,6 @@ from xml.dom import minidom
 
 import oe.path
 from oeqa.utils.commands import CommandError, runCmd, get_bb_vars
-from oeqa.utils.git import GitError, GitRepo
 
 # Get logger for this module
 log = logging.getLogger('build-perf')
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 719e2a8a4c3..90b9366754d 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -4,7 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
 
-import os
 import re
 import sys
 import unittest
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index e3e5ec874d5..2d541532f29 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -4,10 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
 
-import os
-import sys
-import signal
-import time
 import glob
 import subprocess
 from collections import defaultdict
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 03e99e68234..e860c478fe8 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -9,7 +9,6 @@ import time
 import select
 import logging
 import subprocess
-import codecs
 
 from . import OETarget
 
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 267dba7ba19..d495665e028 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -18,7 +18,6 @@ import os
 import sys
 import traceback
 import unittest
-import subprocess
 import testtools
 import threading
 import time
diff --git a/meta/lib/oeqa/core/utils/path.py b/meta/lib/oeqa/core/utils/path.py
index c086dcb0b04..288d38635fb 100644
--- a/meta/lib/oeqa/core/utils/path.py
+++ b/meta/lib/oeqa/core/utils/path.py
@@ -5,7 +5,6 @@
 #
 
 import os
-import sys
 
 def findFile(file_name, directory):
     """
diff --git a/meta/lib/oeqa/core/utils/test.py b/meta/lib/oeqa/core/utils/test.py
index 99b7b9e6a6c..b5062c59f90 100644
--- a/meta/lib/oeqa/core/utils/test.py
+++ b/meta/lib/oeqa/core/utils/test.py
@@ -4,7 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
 
-import os
 import inspect
 import unittest
 
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index ee25d682b95..8a6e46cd862 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -9,7 +9,6 @@ from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
 class TestSDKBase:
     @staticmethod
     def get_sdk_configuration(d, test_type):
-        import platform
         import oe.lsb
         from oeqa.utils.metadata import get_layers
         configuration = {'TEST_TYPE': test_type,
@@ -80,7 +79,6 @@ class TestSDK(TestSDKBase):
     def run(self, d):
 
         import os
-        import subprocess
         import json
         import logging
 
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index 40560fb47a4..16781644a41 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -14,7 +14,7 @@ class TestSDKExt(TestSDKBase):
         import logging
 
         from bb.utils import export_proxies
-        from oeqa.utils import avoid_paths_in_environ, make_logger_bitbake_compatible, subprocesstweak
+        from oeqa.utils import make_logger_bitbake_compatible, subprocesstweak
         from oeqa.sdkext.context import OESDKExtTestContext, OESDKExtTestContextExecutor
         from oeqa.utils import get_json_result_dir
 
diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oeqa/selftest/cases/usergrouptests.py
index 40e6e246068..2454fe880fe 100644
--- a/meta/lib/oeqa/selftest/cases/usergrouptests.py
+++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
@@ -7,7 +7,6 @@
 import os
 import shutil
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake
 from oeqa.utils.commands import bitbake, get_bb_var, get_test_layer
 
 class UserGroupTests(OESelftestTestCase):
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index eb38012eae3..1802454a0c0 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -6,12 +6,10 @@
 
 import os
 import time
-import glob
 import sys
 import importlib
 import subprocess
 import unittest
-from random import choice
 
 import oeqa
 import oe
@@ -373,7 +371,6 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         return json_result_dir
 
     def get_configuration(self, args):
-        import platform
         from oeqa.utils.metadata import metadata_from_bb
         metadata = metadata_from_bb()
         oeselftest_metadata = get_oeselftest_metadata(args)
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index f8d6a793550..cf2b7aa9418 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -16,7 +16,6 @@ import time
 import logging
 from oeqa.utils import CommandError
 from oeqa.utils import ftools
-import re
 import contextlib
 import errno
 # Export test doesn't require bb
diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
index 3a10ae79d45..7f44648cca4 100644
--- a/meta/lib/oeqa/utils/ftools.py
+++ b/meta/lib/oeqa/utils/ftools.py
@@ -4,8 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
 
-import os
-import re
 import errno
 
 def write_file(path, data):
diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index 9e61cd89d5a..cb43c00a29f 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -72,7 +72,7 @@ class HTTPService:
             self.logger.info("Stopped HTTPService on %s:%s" % (self.host, self.port))
 
 if __name__ == "__main__":
-    import sys, logging
+    import sys
 
     logger = logging.getLogger(__name__)
     logging.basicConfig(level=logging.DEBUG)
diff --git a/meta/lib/oeqa/utils/nfs.py b/meta/lib/oeqa/utils/nfs.py
index 903469bfeec..db95c6a06ee 100644
--- a/meta/lib/oeqa/utils/nfs.py
+++ b/meta/lib/oeqa/utils/nfs.py
@@ -4,10 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 import os
-import sys
 import tempfile
 import contextlib
-import socket
 from oeqa.utils.commands import bitbake, get_bb_var, Command
 from oeqa.utils.network import get_free_port
 
diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 2792c16bccf..892e9919454 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -8,10 +8,8 @@
 # dictionary as well as test context to any action to run.
 
 import datetime
-import io
 import os
 import stat
-import subprocess
 import tempfile
 from oeqa.utils import get_artefact_dir
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 0e27a977335..a0c8ab3575d 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -18,7 +18,6 @@ import select
 import errno
 import string
 import threading
-import codecs
 import tempfile
 from collections import defaultdict
 from contextlib import contextmanager
