Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8251.1795062168147154355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ajsdoki5;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7149; q=dns/txt;
  s=iport01; t=1795062168; x=1796271768;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JwQ0izHmWjwbeENMQXmzNavqJHJkDHa8s6VFm5/R4eQ=;
  b=ajsdoki55obNyhm7+8j1fgdMLyvckpOXBCSdgdVJrq0WXJXbZ2X9MRg6
   KxH3+W3FjGz6TRVwQimNnMFEYCaGk2PUo8SZPYRYMuWxJmHi5XwwapSWp
   fasBg5GS60AVNyvbLTyY/8/1nm8hMwaxVZA7a+1JVXg4N9NBEmaN7ILI9
   t4pTqLIF+mmHAFlf38j8EK7vgenUmvqvI3cwfBcJ+e88SnRFSx0qSPATa
   ZW4wcPQ6EDiP4IRPXITg/Xp1MEUVo/bfMpG85sdvUE031l1xdjGk1lvjg
   SqZdwOmMBGvFKfdFZtQy68RtyQJZ4vUZvghCd0tZFlszrQ3gTYT0KknjV
   g==;
X-CSE-ConnectionGUID: /z3QqidsRrWvNz3/OnzIsA==
X-CSE-MsgGUID: qCJDshMvTVq7dzIG+VadNQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/81K/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG5NYF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhMEG+BaAELFAGBOIVCiCRdGAGDGoFjJxuBSUSBFYNqgQWBX?=
 =?us-ascii?q?AKIJgSDHBKBVIEChTqGWwKBT4gKSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfH?=
 =?us-ascii?q?hsOAg4YDUgRLDcVGQQ+bgeTUYIlJk0xDD4TASuCLCQnA5Jokj+hEYQrjCSVO?=
 =?us-ascii?q?hozhASBV5JDklQLmH2OCpZRhGqBaDyBWTMaCBsVO4JnCUoZD445g2uFE1HGW?=
 =?us-ascii?q?iYyAgkDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:a/Ws/6rzSTWF5JQU+/mXfSCKQV5eBmJSZBIvgKrLsJaIsI4StFCzt
 garIBnTPP6DZ2GhKN4ib4mx9kgEuMeHytRqHgM//ClmHyhE8+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8sj/zgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8UM355wehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0qFlWlhX9
 PADEioycDaR3KWRxqCaUcA506zPLOGzVG8eknht13TdSP0hW52GG/mM7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA9KYH49tL/Aan3XYiBCoV6YjaE2+GPUigd21dABNfKIK4HaHpwKxy50o
 Erf1EbVGRE/KuCh0GWJ4FODxdHGkQXCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjRCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:vKG/lax9VbIJTs6GnLLeKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:gzLxfWEEpoMDhp9LqmIg5hUtA8EpaUfH82n2MRT/LmB7aaa8HAo=
X-Talos-MUID: 9a23:9WNxjgi7G5o7RDb+iVNTRcMpLexKz7+uLV4xr4xZt9ulGm9OMju7tWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59583171"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:46 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id DB6ED180001C7
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:45 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 2CB32CBEFAB; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 09/27] python3-git: fix CVE-2026-73624
Date: Wed, 18 Nov 2026 20:22:24 -0800
Message-Id: <20261119042242.1640611-10-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250617
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
index 0000000000..adbc17644d
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
2.35.6

