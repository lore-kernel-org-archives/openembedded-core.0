Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0439EC04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 10:18:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.56864.1716200316365884410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 03:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EF031063
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:19:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B59CE3F766
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:18:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] oeqa/sdk: remove unused imports from test cases
Date: Mon, 20 May 2024 10:18:29 +0000
Message-Id: <20240520101833.1798907-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520101833.1798907-1-ross.burton@arm.com>
References: <20240520101833.1798907-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 10:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199564

Remove redundant imports.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/autotools.py | 1 -
 meta/lib/oeqa/sdk/cases/makefile.py  | 2 +-
 meta/lib/oeqa/sdk/cases/maturin.py   | 1 -
 meta/lib/oeqa/sdk/cases/python.py    | 2 +-
 meta/lib/oeqa/sdk/cases/rust.py      | 1 -
 5 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/autotools.py b/meta/lib/oeqa/sdk/cas=
es/autotools.py
index a711353791c..848e9392ec0 100644
--- a/meta/lib/oeqa/sdk/cases/autotools.py
+++ b/meta/lib/oeqa/sdk/cases/autotools.py
@@ -7,7 +7,6 @@
 import os
 import tempfile
 import subprocess
-import unittest
=20
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
diff --git a/meta/lib/oeqa/sdk/cases/makefile.py b/meta/lib/oeqa/sdk/case=
s/makefile.py
index c0b40f1f728..2ff54ce25ff 100644
--- a/meta/lib/oeqa/sdk/cases/makefile.py
+++ b/meta/lib/oeqa/sdk/cases/makefile.py
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-import os, tempfile, subprocess, unittest
+import os, tempfile, subprocess
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
diff --git a/meta/lib/oeqa/sdk/cases/maturin.py b/meta/lib/oeqa/sdk/cases=
/maturin.py
index ea10f568b27..20f6b553d0b 100644
--- a/meta/lib/oeqa/sdk/cases/maturin.py
+++ b/meta/lib/oeqa/sdk/cases/maturin.py
@@ -8,7 +8,6 @@ import os
 import shutil
 import unittest
=20
-from oeqa.core.utils.path import remove_safe
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
=20
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/=
python.py
index 5ea992b9f33..51284949f50 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-import subprocess, unittest
+import unittest
 from oeqa.sdk.case import OESDKTestCase
=20
 from oeqa.utils.subprocesstweak import errors_have_output
diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/ru=
st.py
index f5d437bb19d..a54245851b4 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -8,7 +8,6 @@ import os
 import shutil
 import unittest
=20
-from oeqa.core.utils.path import remove_safe
 from oeqa.sdk.case import OESDKTestCase
=20
 from oeqa.utils.subprocesstweak import errors_have_output
--=20
2.34.1


