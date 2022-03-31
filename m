Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6603C4321E
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.658.1648751364862149994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90E89139F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27F913F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/23] oeqa/selftest: remove unused imports
Date: Thu, 31 Mar 2022 19:29:06 +0100
Message-Id: <20220331182915.22128-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163855

---
 meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py | 2 +-
 meta/lib/oeqa/selftest/cases/binutils.py            | 5 +----
 meta/lib/oeqa/selftest/cases/buildoptions.py        | 2 +-
 meta/lib/oeqa/selftest/cases/distrodata.py          | 3 ---
 meta/lib/oeqa/selftest/cases/eSDK.py                | 2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py            | 3 +--
 meta/lib/oeqa/selftest/cases/gcc.py                 | 2 +-
 meta/lib/oeqa/selftest/cases/glibc.py               | 2 +-
 meta/lib/oeqa/selftest/cases/layerappend.py         | 2 +-
 meta/lib/oeqa/selftest/cases/lic_checksum.py        | 1 -
 meta/lib/oeqa/selftest/cases/manifest.py            | 2 +-
 meta/lib/oeqa/selftest/cases/oescripts.py           | 2 +-
 meta/lib/oeqa/selftest/cases/package.py             | 1 -
 meta/lib/oeqa/selftest/cases/recipeutils.py         | 6 +-----
 meta/lib/oeqa/selftest/cases/reproducible.py        | 2 --
 meta/lib/oeqa/selftest/cases/selftest.py            | 1 -
 meta/lib/oeqa/selftest/cases/sstate.py              | 5 +----
 meta/lib/oeqa/selftest/cases/sstatetests.py         | 3 +--
 meta/lib/oeqa/selftest/cases/sysroot.py             | 2 +-
 meta/lib/oeqa/selftest/cases/tinfoil.py             | 1 -
 20 files changed, 14 insertions(+), 35 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py b/meta/l=
ib/oeqa/selftest/cases/_sstatetests_noauto.py
index 7ac03f0cec6..bff6e7740c5 100644
--- a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
@@ -6,7 +6,7 @@ import os
 import shutil
=20
 import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_la=
yer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.selftest.cases.sstate import SStateBase
=20
=20
diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/sel=
ftest/cases/binutils.py
index 821f52f5a88..3b0b44b3908 100644
--- a/meta/lib/oeqa/selftest/cases/binutils.py
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -1,12 +1,9 @@
 # SPDX-License-Identifier: MIT
 import os
-import sys
-import re
-import logging
 from oeqa.core.decorator import OETestTag
 from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
+from oeqa.utils.commands import bitbake, get_bb_vars
=20
 def parse_values(content):
     for i in content:
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa=
/selftest/cases/buildoptions.py
index 135e88e1f06..ad604d6ae26 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -9,7 +9,7 @@ import shutil
 import tempfile
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
 import oeqa.utils.ftools as ftools
=20
 class ImageOptionsTests(OESelftestTestCase):
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/s=
elftest/cases/distrodata.py
index 03f31e9fcbf..b80d091c1c6 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -3,9 +3,6 @@
 #
=20
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
-from oeqa.utils.decorators import testcase
-from oeqa.utils.ftools import write_file
=20
 import oe.recipeutils
=20
diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftes=
t/cases/eSDK.py
index f7279b32300..3ea0f663575 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -8,7 +8,7 @@ import os
 import glob
 import time
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+from oeqa.utils.commands import runCmd, bitbake, get_bb_vars
=20
 class oeSDKExtSelfTest(OESelftestTestCase):
     """
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/sel=
ftest/cases/fitimage.py
index f6f6a8e7953..e6bfd1257ec 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -3,9 +3,8 @@
 #
=20
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 import os
-import json
 import re
=20
 class FitImageTests(OESelftestTestCase):
diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest=
/cases/gcc.py
index 3efe15228f0..9308724ce5e 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -3,7 +3,7 @@ import os
 from oeqa.core.decorator import OETestTag
 from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqem=
u, Command
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqem=
u
=20
 def parse_values(content):
     for i in content:
diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selfte=
st/cases/glibc.py
index 6f96281ea55..4c149ab7023 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -4,7 +4,7 @@ import contextlib
 from oeqa.core.decorator import OETestTag
 from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqem=
u, Command
+from oeqa.utils.commands import bitbake, get_bb_var, runqemu
 from oeqa.utils.nfs import unfs_server
=20
 def parse_values(content):
diff --git a/meta/lib/oeqa/selftest/cases/layerappend.py b/meta/lib/oeqa/=
selftest/cases/layerappend.py
index dadc7c5d28c..8fb1e6c5304 100644
--- a/meta/lib/oeqa/selftest/cases/layerappend.py
+++ b/meta/lib/oeqa/selftest/cases/layerappend.py
@@ -5,7 +5,7 @@
 import os
=20
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import bitbake, get_bb_var
 import oeqa.utils.ftools as ftools
=20
 class LayerAppendTests(OESelftestTestCase):
diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa=
/selftest/cases/lic_checksum.py
index 91021ac3350..f8681ed755b 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -7,7 +7,6 @@ import tempfile
=20
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
-from oeqa.utils import CommandError
=20
 class LicenseTests(OESelftestTestCase):
=20
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/sel=
ftest/cases/manifest.py
index 5d13f354685..0a04c13a856 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -5,7 +5,7 @@
 import os
=20
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake
+from oeqa.utils.commands import get_bb_var, bitbake
=20
 class ManifestEntry:
     '''A manifest item of a collection able to list missing packages'''
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/se=
lftest/cases/oescripts.py
index 91abf9654a5..b3261e512f5 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -8,7 +8,7 @@ import importlib
 import unittest
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
-from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, ge=
t_test_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils import CommandError
=20
 class BuildhistoryDiffTests(BuildhistoryBase):
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/self=
test/cases/package.py
index cebbb4f3f49..51d835259e4 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -4,7 +4,6 @@
=20
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var, runqem=
u
-import stat
 import subprocess, os
 import oe.path
 import re
diff --git a/meta/lib/oeqa/selftest/cases/recipeutils.py b/meta/lib/oeqa/=
selftest/cases/recipeutils.py
index f1dd63f65b4..74b2098ae8b 100644
--- a/meta/lib/oeqa/selftest/cases/recipeutils.py
+++ b/meta/lib/oeqa/selftest/cases/recipeutils.py
@@ -2,14 +2,10 @@
 # SPDX-License-Identifier: MIT
 #
=20
-import os
-import re
-import time
-import logging
 import bb.tinfoil
=20
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, get_test_layer
+from oeqa.utils.commands import get_test_layer
=20
=20
 def setUpModule():
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa=
/selftest/cases/reproducible.py
index 7caf8c3e7d5..5042c11d8eb 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -9,8 +9,6 @@ import bb.utils
 import functools
 import multiprocessing
 import textwrap
-import json
-import unittest
 import tempfile
 import shutil
 import stat
diff --git a/meta/lib/oeqa/selftest/cases/selftest.py b/meta/lib/oeqa/sel=
ftest/cases/selftest.py
index af080dcf034..7268e259395 100644
--- a/meta/lib/oeqa/selftest/cases/selftest.py
+++ b/meta/lib/oeqa/selftest/cases/selftest.py
@@ -3,7 +3,6 @@
 #
=20
 import importlib
-from oeqa.utils.commands import runCmd
 import oeqa.selftest
 from oeqa.selftest.case import OESelftestTestCase
=20
diff --git a/meta/lib/oeqa/selftest/cases/sstate.py b/meta/lib/oeqa/selft=
est/cases/sstate.py
index 80ce9e353c0..176766331ad 100644
--- a/meta/lib/oeqa/selftest/cases/sstate.py
+++ b/meta/lib/oeqa/selftest/cases/sstate.py
@@ -3,14 +3,11 @@
 #
=20
 import datetime
-import unittest
 import os
 import re
-import shutil
=20
-import oeqa.utils.ftools as ftools
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_test_l=
ayer
+from oeqa.utils.commands import get_bb_vars
=20
=20
 class SStateBase(OESelftestTestCase):
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/=
selftest/cases/sstatetests.py
index 3038b400215..4a32af902fb 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -8,8 +8,7 @@ import glob
 import subprocess
 import tempfile
=20
-from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_la=
yer, create_temp_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp=
_layer
 from oeqa.selftest.cases.sstate import SStateBase
 import oe
=20
diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/self=
test/cases/sysroot.py
index 79ab45235da..315d1a61c2c 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -5,7 +5,7 @@
 import uuid
=20
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import  bitbake
+from oeqa.utils.commands import bitbake
=20
 class SysrootTests(OESelftestTestCase):
     def test_sysroot_cleanup(self):
diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/self=
test/cases/tinfoil.py
index 6f26af23d54..c81d56d82b0 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -9,7 +9,6 @@ import logging
 import bb.tinfoil
=20
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd
=20
 class TinfoilTests(OESelftestTestCase):
     """ Basic tests for the tinfoil API """
--=20
2.25.1


