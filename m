Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FB3C41513
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 13:41:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27877.1697722857835826076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 06:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 848541007;
	Thu, 19 Oct 2023 06:41:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 09F553F5A1;
	Thu, 19 Oct 2023 06:40:56 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] patchtest: remove unused imports
Date: Thu, 19 Oct 2023 14:40:54 +0100
Message-Id: <20231019134054.2524949-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019134054.2524949-1-ross.burton@arm.com>
References: <20231019134054.2524949-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 13:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189460

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/patchtest/data.py                             | 1 -
 meta/lib/patchtest/repo.py                             | 1 -
 meta/lib/patchtest/tests/test_mbox_cve.py              | 1 -
 meta/lib/patchtest/tests/test_mbox_mailinglist.py      | 1 -
 meta/lib/patchtest/tests/test_metadata_src_uri.py      | 1 -
 meta/lib/patchtest/tests/test_patch_cve.py             | 1 -
 meta/lib/patchtest/tests/test_patch_upstream_status.py | 1 -
 meta/lib/patchtest/utils.py                            | 1 -
 scripts/patchtest                                      | 1 -
 scripts/patchtest-get-branch                           | 1 -
 10 files changed, 10 deletions(-)

diff --git a/meta/lib/patchtest/data.py b/meta/lib/patchtest/data.py
index 25a9a57dfb1..356259921da 100644
--- a/meta/lib/patchtest/data.py
+++ b/meta/lib/patchtest/data.py
@@ -16,7 +16,6 @@
 import os
 import argparse
 import collections
-import tempfile
 import logging
=20
 logger=3Dlogging.getLogger('patchtest')
diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
index 8a11af5fd66..d3788f466d3 100644
--- a/meta/lib/patchtest/repo.py
+++ b/meta/lib/patchtest/repo.py
@@ -11,7 +11,6 @@
 import os
 import utils
 import logging
-import json
 from patch import PatchTestPatch
=20
 logger =3D logging.getLogger('patchtest')
diff --git a/meta/lib/patchtest/tests/test_mbox_cve.py b/meta/lib/patchte=
st/tests/test_mbox_cve.py
index 31faeb5ef5a..29ab12cbb53 100644
--- a/meta/lib/patchtest/tests/test_mbox_cve.py
+++ b/meta/lib/patchtest/tests/test_mbox_cve.py
@@ -6,7 +6,6 @@
 #
=20
 import base
-import os
 import parse_cve_tags
 import pyparsing
=20
diff --git a/meta/lib/patchtest/tests/test_mbox_mailinglist.py b/meta/lib=
/patchtest/tests/test_mbox_mailinglist.py
index 0ffb6056c08..feff4360894 100644
--- a/meta/lib/patchtest/tests/test_mbox_mailinglist.py
+++ b/meta/lib/patchtest/tests/test_mbox_mailinglist.py
@@ -4,7 +4,6 @@
 #
 # SPDX-License-Identifier: GPL-2.0-only
=20
-import subprocess
 import collections
 import base
 import pyparsing
diff --git a/meta/lib/patchtest/tests/test_metadata_src_uri.py b/meta/lib=
/patchtest/tests/test_metadata_src_uri.py
index 01d8a451037..87a24ea937e 100644
--- a/meta/lib/patchtest/tests/test_metadata_src_uri.py
+++ b/meta/lib/patchtest/tests/test_metadata_src_uri.py
@@ -4,7 +4,6 @@
 #
 # SPDX-License-Identifier: GPL-2.0-only
=20
-import subprocess
 import base
 import os
 import pyparsing
diff --git a/meta/lib/patchtest/tests/test_patch_cve.py b/meta/lib/patcht=
est/tests/test_patch_cve.py
index c0c7e742ee1..c77848de458 100644
--- a/meta/lib/patchtest/tests/test_patch_cve.py
+++ b/meta/lib/patchtest/tests/test_patch_cve.py
@@ -6,7 +6,6 @@
 #
=20
 import base
-import os
 import pyparsing
=20
 class CVE(base.Base):
diff --git a/meta/lib/patchtest/tests/test_patch_upstream_status.py b/met=
a/lib/patchtest/tests/test_patch_upstream_status.py
index 957817ba8d9..a5b278304e6 100644
--- a/meta/lib/patchtest/tests/test_patch_upstream_status.py
+++ b/meta/lib/patchtest/tests/test_patch_upstream_status.py
@@ -7,7 +7,6 @@
 import base
 import parse_upstream_status
 import pyparsing
-import os
=20
 class PatchUpstreamStatus(base.Base):
=20
diff --git a/meta/lib/patchtest/utils.py b/meta/lib/patchtest/utils.py
index 8dcac30941e..a4a523b4e25 100644
--- a/meta/lib/patchtest/utils.py
+++ b/meta/lib/patchtest/utils.py
@@ -11,7 +11,6 @@
 import os
 import subprocess
 import logging
-import sys
 import re
 import mailbox
=20
diff --git a/scripts/patchtest b/scripts/patchtest
index c47b05b7d47..00c73610fcd 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -12,7 +12,6 @@
 import sys
 import os
 import unittest
-import fileinput
 import logging
 import traceback
 import json
diff --git a/scripts/patchtest-get-branch b/scripts/patchtest-get-branch
index 962f572b20c..b5fb2b0f04d 100755
--- a/scripts/patchtest-get-branch
+++ b/scripts/patchtest-get-branch
@@ -15,7 +15,6 @@ import mailbox
 import argparse
 import re
 import git
-import sys
=20
 re_prefix =3D re.compile("(\[.*\])", re.DOTALL)
=20
--=20
2.34.1


