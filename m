Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4430.1795175801044498308
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 03:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ESlnNXLN;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6374; q=dns/txt;
  s=iport01; t=1795175801; x=1796385401;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QTVr5hzzsqPCjW0sKsJIP6qs/goBNrJEbOrEATVMTr4=;
  b=ESlnNXLN+CPdItoUdoIK6uTzsKs+A6CGUuXXDYX9Sic61qNwVOSYfvjZ
   7OacQx8wJ2XAjtGu19C1DwTBWwc+rKxjgcbSrK4eCCSlfd4aQ/Or7tIsB
   sr0TYDFIjquyBIFFkwDjnXOWzVn/dPovyMHowktVx9+9gnRw5elQyRwsB
   Qws/tVqqz5kW5Trp5dmxSAVJNJJltjBSuIVAdk+h6yunVTGDtmf97Jyme
   7lOzaWEOl9T4qwqUZ/3U4LdodNV/Xq6lXDBzwJ/UiHq20+L6lcXZey7JG
   HxkvzIaKQHgy/a+5QCfXxHEKQU5CSJ6/qoP9sjT8IBwC1e9hnnPz1lgVl
   g==;
X-CSE-ConnectionGUID: JdyiB1pATK+H0C7qwgj7xA==
X-CSE-MsgGUID: LbtutFzcTlSyg2llJeT9Xw==
X-IPAS-Result: =?us-ascii?q?A0BGAgDfNABr/85K/pBaglmCV3VhQkmVX2yeLIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/Ro4jAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBKgsBGAEtLAMBAlojIYMCAYJ0AgERuReBeTOBAYMpAYFU2?=
 =?us-ascii?q?zMBCxQBBYEzhUKIJF0YAYR9JxsbgXKBFYE7gi+BBYFcAogmBIIigQyBVIELj?=
 =?us-ascii?q?AwCgU+IJkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BE?=
 =?us-ascii?q?oEDXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGDRgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5NsgxgBATw+EwEHFBBQQTRbKB4UkyOSBIE1nRiCRAoog3mMJJU6G?=
 =?us-ascii?q?jOFW6UXC5h9jgqVaRhQhGqBaDyBWXAVgyIJShkPji4BAwcLg2CFZMh3IzUCC?=
 =?us-ascii?q?TIBAQcCBw4DC4FokAAsgVIBAQ?=
IronPort-Data: A9a23:Npwwyauw/ozSZjEaN8oAl40NCefnVAJfMUV32f8akzHdYApBsoF/q
 tZmKT+OOPzeZ2PyKYt0a9y+9kMEusSHydBkHQtvpHs1ECgWgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ8Eo21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw2OpmAEsX7
 dUkC3MtNjvcnv25wu2rY7w57igjBJGD0II3s3x6iDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgl/5JEWxI9EglH2aCVRslecv4I84nPYy0p6172F3N/9J43aGJ4Jwh7wS
 mTu227lHw00JtejzQGU/Siogs3CoXLLR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzBZCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:zlz0g6sHIkP8yK7FgNtmhIgv7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:tu0famy6quAKdFIpcpYEBgU2FtEkWCTF5UvzYG/gIjlwV7KXFk+5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AfzBEyA187tqp9bNZppv1dRdpkzUjx66yFVwjg54?=
 =?us-ascii?q?6v/KVOnZ0PxWQsGWHXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59853440"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 11:56:38 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 4A784180003BA;
	Fri, 20 Nov 2026 11:56:38 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id EFA69CC1634; Fri, 20 Nov 2026 03:56:36 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-Core][wrynose][PATCH] python3-pytest: Fix CVE-2025-71176
Date: Fri, 20 Nov 2026 03:56:28 -0800
Message-Id: <20261120115628.2245283-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 11:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250778
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix referenced in [2], using the commit
shown in [1].

[1] https://github.com/pytest-dev/pytest/commit/ddee02a578da30dd43aedc39c1c1f1aaadfcee95
[2] https://github.com/advisories/GHSA-6w46-j5rx-g56g

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python3-pytest/CVE-2025-71176.patch       | 127 ++++++++++++++++++
 .../python/python3-pytest_9.0.2.bb            |   2 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pytest/CVE-2025-71176.patch

diff --git a/meta/recipes-devtools/python/python3-pytest/CVE-2025-71176.patch b/meta/recipes-devtools/python/python3-pytest/CVE-2025-71176.patch
new file mode 100644
index 0000000000..9caf85a9ee
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pytest/CVE-2025-71176.patch
@@ -0,0 +1,127 @@
+From 263b38a2172b4171be69ded95e5d46958ecf8766 Mon Sep 17 00:00:00 2001
+From: Ran Benita <ran@unusedvar.com>
+Date: Tue, 7 Apr 2026 17:43:09 +0300
+Subject: [PATCH] Merge pull request #14343 from bluetech/cve-2025-71176-simple
+
+tmpdir: fix insecure temporary directory vulnerability (CVE-2025-71176)
+(cherry picked from commit 95d8423bd24992deea5b9df32555fa1741679e2c)
+
+CVE: CVE-2025-71176
+Upstream-Status: Backport [https://github.com/pytest-dev/pytest/commit/ddee02a578da30dd43aedc39c1c1f1aaadfcee95]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ changelog/14343.bugfix.rst |  1 +
+ src/_pytest/tmpdir.py      | 26 ++++++++++++++++++++++++--
+ testing/test_tmpdir.py     | 31 +++++++++++++++++++++++++++++++
+ 3 files changed, 56 insertions(+), 2 deletions(-)
+ create mode 100644 changelog/14343.bugfix.rst
+
+diff --git a/changelog/14343.bugfix.rst b/changelog/14343.bugfix.rst
+new file mode 100644
+index 000000000..a52028d9f
+--- /dev/null
++++ b/changelog/14343.bugfix.rst
+@@ -0,0 +1 @@
++Fixed use of insecure temporary directory (CVE-2025-71176).
+diff --git a/src/_pytest/tmpdir.py b/src/_pytest/tmpdir.py
+index 855ad273e..66ca9f190 100644
+--- a/src/_pytest/tmpdir.py
++++ b/src/_pytest/tmpdir.py
+@@ -9,6 +9,7 @@ import os
+ from pathlib import Path
+ import re
+ from shutil import rmtree
++import stat
+ import tempfile
+ from typing import Any
+ from typing import final
+@@ -170,16 +171,37 @@ class TempPathFactory:
+             # Also, to keep things private, fixup any world-readable temp
+             # rootdir's permissions. Historically 0o755 was used, so we can't
+             # just error out on this, at least for a while.
++            # Don't follow symlinks, otherwise we're open to symlink-swapping
++            # TOCTOU vulnerability.
++            # This check makes us vulnerable to a DoS - a user can `mkdir
++            # /tmp/pytest-of-otheruser` and then `otheruser` will fail this
++            # check. For now we don't consider it a real problem. otheruser can
++            # change their TMPDIR or --basetemp, and maybe give the prankster a
++            # good scolding.
+             uid = get_user_id()
+             if uid is not None:
+-                rootdir_stat = rootdir.stat()
++                stat_follow_symlinks = (
++                    False if os.stat in os.supports_follow_symlinks else True
++                )
++                rootdir_stat = rootdir.stat(follow_symlinks=stat_follow_symlinks)
++                if stat.S_ISLNK(rootdir_stat.st_mode):
++                    raise OSError(
++                        f"The temporary directory {rootdir} is a symbolic link. "
++                        "Fix this and try again."
++                    )
+                 if rootdir_stat.st_uid != uid:
+                     raise OSError(
+                         f"The temporary directory {rootdir} is not owned by the current user. "
+                         "Fix this and try again."
+                     )
+                 if (rootdir_stat.st_mode & 0o077) != 0:
+-                    os.chmod(rootdir, rootdir_stat.st_mode & ~0o077)
++                    chmod_follow_symlinks = (
++                        False if os.chmod in os.supports_follow_symlinks else True
++                    )
++                    rootdir.chmod(
++                        rootdir_stat.st_mode & ~0o077,
++                        follow_symlinks=chmod_follow_symlinks,
++                    )
+             keep = self._retention_count
+             if self._retention_policy == "none":
+                 keep = 0
+diff --git a/testing/test_tmpdir.py b/testing/test_tmpdir.py
+index 363172110..789e80051 100644
+--- a/testing/test_tmpdir.py
++++ b/testing/test_tmpdir.py
+@@ -5,6 +5,7 @@ from collections.abc import Callable
+ import dataclasses
+ import os
+ from pathlib import Path
++import shutil
+ import stat
+ import sys
+ from typing import cast
+@@ -619,3 +620,33 @@ def test_tmp_path_factory_fixes_up_world_readable_permissions(
+ 
+     # After - fixed.
+     assert (basetemp.parent.stat().st_mode & 0o077) == 0
++
++
++@pytest.mark.skipif(
++    not hasattr(os, "getuid") or os.stat not in os.supports_follow_symlinks,
++    reason="checks unix permissions and symlinks",
++)
++def test_tmp_path_factory_doesnt_follow_symlinks(
++    tmp_path: Path, monkeypatch: MonkeyPatch
++) -> None:
++    """Verify that if a /tmp/pytest-of-foo directory is a symbolic link,
++    it is rejected (#13669, CVE-2025-71176)."""
++    attacker_controlled = tmp_path / "attacker_controlled"
++    attacker_controlled.mkdir()
++
++    # Use the test's tmp_path as the system temproot (/tmp).
++    monkeypatch.setenv("PYTEST_DEBUG_TEMPROOT", str(tmp_path))
++
++    # First just get the pytest-of-user path.
++    tmp_factory = TempPathFactory(None, 3, "all", lambda *args: None, _ispytest=True)
++    pytest_of_user = tmp_factory.getbasetemp().parent
++    # Just for safety in the test, before we nuke it.
++    assert "pytest-of-" in str(pytest_of_user)
++    shutil.rmtree(pytest_of_user)
++
++    pytest_of_user.symlink_to(attacker_controlled)
++
++    # This now tries to use the directory when it's a symlink.
++    tmp_factory = TempPathFactory(None, 3, "all", lambda *args: None, _ispytest=True)
++    with pytest.raises(OSError, match=r"temporary directory .* is a symbolic link"):
++        tmp_factory.getbasetemp()
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3-pytest_9.0.2.bb b/meta/recipes-devtools/python/python3-pytest_9.0.2.bb
index 007db2e732..031a63f3d4 100644
--- a/meta/recipes-devtools/python/python3-pytest_9.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.0.2.bb
@@ -5,6 +5,8 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
+SRC_URI += "file://CVE-2025-71176.patch"
+
 SRC_URI[sha256sum] = "75186651a92bd89611d1d9fc20f0b4345fd827c41ccd5c299a868a05d70edf11"
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.35.6

