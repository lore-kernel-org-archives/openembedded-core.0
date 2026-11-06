Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7337.1793976214149599703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Q3qGImZJ;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7149; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2viqve1DyQqAm+BV0EXn6wa5DWzG5h5bksIKXjFBrL0=;
  b=Q3qGImZJBwL6yOu2CKqmqzvHkRPacLSc7b02c46bJbbByZFUh/HkrFyV
   f97dwE88ngHZRtD9HD8yDk1v577DNIV7/sSCjcJrzKJDYH4uB5Dp1nUxk
   vwNodNbvSKgq1gY0uJYq6CIjDhXLKcVSU1CTJ0ls+mooF2TpvnqLnokX9
   M1mE5mRkdf/8Sb4V1gsaCP8iQGyvUaRrzrlIuL/ZHEF+6igxQXAVYbSg7
   Xwt3O6H2ahE91fYuSw/SeO6/AC6BOBp05dMpjtEk7NC1QZv+XqVsELQcN
   kgHh69e+ez0lUhuTihht4lDSF54RTjBy8H+AU/WEIUamrk5uX6BbEvu8r
   A==;
X-CSE-ConnectionGUID: tjZbPEjhTuO6Br4x4MXF6A==
X-CSE-MsgGUID: 8Vm/RIx1S12mCMOKcu9eSg==
X-IPAS-Result: =?us-ascii?q?A0BIAgCS5u1q/5D/Ja1aHgEBCxIMggULgld1YENJA5Qng?=
 =?us-ascii?q?iEDniGBfg8BAQEPRA0EAQGEP0YCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDN?=
 =?us-ascii?q?wMRvEWBeTOBAYMpAT8CQ1DYTBBvgWgBCxQBgTiFQogkXRgBgxqBYycbgUlEg?=
 =?us-ascii?q?RWDaYEFgVwCiCYEgxwSgVqBA4U9hlgCgVGGeUiBHgNZLAFVEw0KCwcFgWgDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmP?=
 =?us-ascii?q?hsKLxgNSBEsNxUZBD5uB5I9gh8mTTEMPhMBK4IsJCcDkmiSQKERhCqMJJU6G?=
 =?us-ascii?q?jOEBIFXkkKSVAuYfY4KllGEaYFoPIFZMxoIGxU7gmcJShkPjjmDa4UTUcYIJ?=
 =?us-ascii?q?jICCQMvAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:52iIHqOlLpjSgffvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUp01mYPm
 jEXCD3XOveJMWv9LYhzYY6/8RsE78WEyIRnQHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2Msawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+lsPksOEI8YxvtQX0tUq
 exEDQAjMDnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmGS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMHwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237kVcvgeG1bYGJEjCMbZVrmwGih
 3KfxD2jBzo/E/+U1GuIyX3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvWS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:qJUCaaGEZDPNBV7FpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:hwQjFW/eOWTkmkJFYc+Vv1IWKModX3/d8Gr3fWWiVXY1bY27F3bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ApdyqegxYRKr4rP42kl76OllmaquaqPSQDQc3sIV?=
 =?us-ascii?q?fgJDeMAdVHBSWkWW6eYByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="536910534"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 7328B180003EE
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id E9529CBEFAB; Fri,  6 Nov 2026 06:43:32 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 09/27] python3-git: fix CVE-2026-73624
Date: Fri,  6 Nov 2026 06:43:13 -0800
Message-Id: <20261106144331.3354811-10-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249676
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/1d51b891d7f236044a6aa17498ec682b63dad6e6
[2] https://security-tracker.debian.org/tracker/CVE-2026-73624

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Cleaned whitespace in the Backport Changes note.
---
 .../python/python3-git/CVE-2026-73624.patch   | 139 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch
new file mode 100644
index 0000000000..9db29de43d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch
@@ -0,0 +1,139 @@
+From 285d6227b9132ed6bab3cc28665e87b2285757ae Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 04:46:13 +0200
+Subject: [PATCH] fix: guard diff output options
+
+<!-- agent -->
+
+Reject unsafe diff options before revision parsing or Git invocation so
+callers cannot write command output to arbitrary filesystem paths.
+
+Cover commit and index diffs, including option-like revisions, and
+preserve an explicit allow_unsafe_options escape hatch.
+
+References GHSA-fjr4-x663-mwxc.
+Validated against Git baseline a23bace9.
+
+CVE: CVE-2026-73624
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/1d51b891d7f236044a6aa17498ec682b63dad6e6]
+
+Backport Changes:
+- Omitted test/test_diff.py because the current PyPI source archive
+  does not include the test suite and the python3-git recipe does
+  not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 1d51b891d7f236044a6aa17498ec682b63dad6e6)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/diff.py       | 14 ++++++++++++--
+ git/index/base.py | 18 ++++++++++++++++--
+ 2 files changed, 28 insertions(+), 4 deletions(-)
+
+diff --git a/git/diff.py b/git/diff.py
+index f89b12d9..9a1f107b 100644
+--- a/git/diff.py
++++ b/git/diff.py
+@@ -9,7 +9,7 @@ import enum
+ import re
+ import warnings
+
+-from git.cmd import handle_process_output
++from git.cmd import Git, handle_process_output
+ from git.compat import defenc
+ from git.objects.blob import Blob
+ from git.objects.util import mode_str_to_int
+@@ -34,7 +34,6 @@ from git.types import Literal, PathLike
+ if TYPE_CHECKING:
+     from subprocess import Popen
+
+-    from git.cmd import Git
+     from git.objects.base import IndexObject
+     from git.objects.commit import Commit
+     from git.objects.tree import Tree
+@@ -186,6 +185,7 @@ class Diffable:
+         other: Union[DiffConstants, "Tree", "Commit", str, None] = INDEX,
+         paths: Union[PathLike, List[PathLike], Tuple[PathLike, ...], None] = None,
+         create_patch: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "DiffIndex":
+         """Create diffs between two items being trees, trees and index or an index and
+@@ -215,6 +215,10 @@ class Diffable:
+             applied makes the self to other. Patches are somewhat costly as blobs have
+             to be read and diffed.
+
++        :param allow_unsafe_options:
++            If ``True``, allow options such as ``--output`` that can write to arbitrary
++            filesystem paths.
++
+         :param kwargs:
+             Additional arguments passed to :manpage:`git-diff(1)`, such as ``R=True`` to
+             swap both sides of the diff.
+@@ -227,6 +231,12 @@ class Diffable:
+             an instance of :class:`~git.objects.tree.Tree` or
+             :class:`~git.objects.commit.Commit`, or a git command error will occur.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([other], kwargs),
++                unsafe_options=self.repo.unsafe_git_revision_options,
++            )
++
+         args: List[Union[PathLike, Diffable]] = []
+         args.append("--abbrev=40")  # We need full shas.
+         args.append("--full-index")  # Get full index paths, not only filenames.
+diff --git a/git/index/base.py b/git/index/base.py
+index b8161ea5..dfe7e0dc 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -23,6 +23,7 @@ from gitdb.base import IStream
+ from gitdb.db import MemoryDB
+
+ from git.compat import defenc, force_bytes
++from git.cmd import Git
+ import git.diff as git_diff
+ from git.exc import CheckoutError, GitCommandError, GitError, InvalidGitRepositoryError
+ from git.objects import Blob, Commit, Object, Submodule, Tree
+@@ -1477,6 +1478,7 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         ] = git_diff.INDEX,
+         paths: Union[PathLike, List[PathLike], Tuple[PathLike, ...], None] = None,
+         create_patch: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> git_diff.DiffIndex:
+         """Diff this index against the working copy or a :class:`~git.objects.tree.Tree`
+@@ -1489,6 +1491,12 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             Will only work with indices that represent the default git index as they
+             have not been initialized with a stream.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([other], kwargs),
++                unsafe_options=self.repo.unsafe_git_revision_options,
++            )
++
+         # Only run if we are the default repository index.
+         if self._file_path != self._index_path():
+             raise AssertionError("Cannot call %r on indices that do not represent the default git index" % self.diff())
+@@ -1507,7 +1515,13 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             # Invert the existing R flag.
+             cur_val = kwargs.get("R", False)
+             kwargs["R"] = not cur_val
+-            return other.diff(self.INDEX, paths, create_patch, **kwargs)
++            return other.diff(
++                self.INDEX,
++                paths,
++                create_patch,
++                allow_unsafe_options=allow_unsafe_options,
++                **kwargs,
++            )
+         # END diff against other item handling
+
+         # If other is not None here, something is wrong.
+@@ -1515,4 +1529,4 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             raise ValueError("other must be None, Diffable.INDEX, a Tree or Commit, was %r" % other)
+
+         # Diff against working copy - can be handled by superclass natively.
+-        return super().diff(other, paths, create_patch, **kwargs)
++        return super().diff(other, paths, create_patch, allow_unsafe_options=allow_unsafe_options, **kwargs)
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index d996d4f9f5..847bdfeab2 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-69097.patch \
            file://CVE-2026-73625.patch \
            file://CVE-2026-73623.patch \
+           file://CVE-2026-73624.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

