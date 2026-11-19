Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8012.1795062168222848626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VEr3ycFs;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7393; q=dns/txt;
  s=iport01; t=1795062170; x=1796271770;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=3AIoSRyBiw4ipezVLtI9JZa52/ezhEcOddnmibzwKE8=;
  b=VEr3ycFsxrWFKe1CRju0e2ci1mArEbU+WmBGJRg7jBVzfV+3VAFMK1IR
   S6IGOqf5JMkbq3Hz2DR3Cz3PFiFxyKxtAaUwpxdG76KGQ79y9U/uL7oNJ
   xZIrCjJozCNgG/ZOzbUo2yDUmeD1b4kLP+3MFMy00lKKsOpWMAS960w6M
   5LiYKN4M53z/oegLQrXMGQEQcYuV4+BAtp6aFd9ZsNcEgtsxHSDICMNov
   SQK6eqaVoFjKcn+semsNC1uaMMdBB7W0Ku+QACUKHq+elf2Lz7EiWxNvd
   QbMly84+2rG9MhBnwxAeQhqeyv58e8iv8CRHExttiPruQa5aPmv5nRBSW
   w==;
X-CSE-ConnectionGUID: hr6uls1lTO2Zzx2EKYXaPg==
X-CSE-MsgGUID: ts4i6JCMSbOLl0DxngQm9w==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/9JK/pBaglmCV3VgQ0kDlCeCIQOeKRSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjiACJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAhYZKyMIGYMCAYI6AzcDEbk1g?=
 =?us-ascii?q?XkzgQGDKQE/AkNQ2EwQb4FoAQsUAYE4hUKIJF0YAUSCVoFjJxuBSUSBFYNqg?=
 =?us-ascii?q?QWBXAKBGS0BWIYHBIMcEoFUgQIJjAwCgU+ICkiBHgNZLAFVEw0KCwcFgWgDN?=
 =?us-ascii?q?RIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomP?=
 =?us-ascii?q?hsKgQwnHx4bDgIOGA1IESw3FRkEPm4Hk1GCJSY7CwcBPFEBKwSBFAiBDCIsk?=
 =?us-ascii?q?meSQKERhCuMJJU6GjOEBIFXiz2HBpJUC5h9jgqWUYRqgWg8gVkzGggbFTuCZ?=
 =?us-ascii?q?wlKGQ+OOYNrhRNRxlomMgIJAy8BAQcCBw4DC4FokAAsgVIBAQ?=
IronPort-Data: A9a23:TOXRc68M/t8JVBPcMUXkDrUDyn+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 zQXWm6DP66CYWehKd9zPdu0oE5VvZSDmtNjT1c/qy9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtaztEs/nrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k2J9MF/v0uBV1pr
 84KOGogTSGzjtq5lefTpulE3qzPLeHiMZlavjRryivUSK53B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6ZO3WjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjem2bIqKI4TiqcN9gl3Ep
 zzk1EHCCDY+MISz2TyKy3f9mbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:VAKLxaug8jJ19b39Dl0jfmuo7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:E1pB1m/44075ATQJfKKVv04ORN0haSTZ8FCKEV2oU0tKeY2ccVDFrQ==
X-Talos-MUID: 9a23:GqIamgavmvx8eeBTqySwhW9AH+JT6YOKDBghgZMJgszVKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59348710"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:47 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 64DF01800010B
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:47 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 62A55CBEF72; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 16/27] python3-git: fix CVE-2026-76219
Date: Wed, 18 Nov 2026 20:22:31 -0800
Message-Id: <20261119042242.1640611-17-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250630
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/9b5dcaf85da5946dbf69dcd53f9edba08f760b32
[2] https://security-tracker.debian.org/tracker/CVE-2026-76219

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Removed the stale cherry-pick and Signed-off-by trailers and refreshed
  the embedded hunk context.
---
 .../python/python3-git/CVE-2026-76219.patch   | 153 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch
new file mode 100644
index 0000000000..719e80b4e0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch
@@ -0,0 +1,153 @@
+From dbf247f0779367b555b55d54941ead00e999eee6 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sun, 2 Aug 2026 09:06:40 +0000
+Subject: [PATCH] Guard read-tree index output paths
+
+<!-- agent -->
+GHSA-4gmw-gg2m-w46p reports that caller-controlled treeish arguments could
+be parsed by git read-tree as --index-output and select an arbitrary output
+path. A regression test showed that from_tree reached Git instead of raising
+UnsafeOptionError; the same unchecked path was reachable through reset and
+both merge_tree treeish positions.
+
+Add the project-standard unsafe-option guard and explicit opt-out to
+from_tree, merge_tree, and reset. Check positional and keyword candidates so
+abbreviations and alternate forwarding forms are covered before read-tree
+runs.
+
+A broader audit found only two read-tree sinks in the codebase; both are now
+guarded, and reset delegates to the guarded from_tree path. The only remaining
+index-output use is GitPython's controlled temporary index. Git cf5497b14
+confirms read-tree parses this path-taking option before tree arguments.
+Focused index tests and Ruff checks pass.
+
+CVE: CVE-2026-76219
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/9b5dcaf85da5946dbf69dcd53f9edba08f760b32]
+
+Backport Changes:
+- Omitted test/test_index.py because the current PyPI source archive
+  does not include the test suite and the python3-git recipe does not
+  run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 9b5dcaf85da5946dbf69dcd53f9edba08f760b32)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/index/base.py | 40 +++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 37 insertions(+), 3 deletions(-)
+
+diff --git a/git/index/base.py b/git/index/base.py
+index e10bfd68..fb1acb1a 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -130,6 +130,7 @@ class IndexFile:
+     index directly before operating on it using the git command.
+     """
+     unsafe_git_checkout_index_options = ["--prefix"]
++    unsafe_git_read_tree_options = ["--index-output"]
+ 
+ 
+     __slots__ = ("repo", "version", "entries", "_extension_data", "_file_path")
+@@ -256,7 +257,12 @@ def merge_tree
+ 
+     @post_clear_cache
+     @default_index
+-    def merge_tree(self, rhs: Treeish, base: Union[None, Treeish] = None) -> "IndexFile":
++    def merge_tree(
++        self,
++        rhs: Treeish,
++        base: Union[None, Treeish] = None,
++        allow_unsafe_options: bool = False,
++    ) -> "IndexFile":
+         """Merge the given `rhs` treeish into the current index, possibly taking
+         a common base treeish into account.
+ 
+@@ -270,6 +276,9 @@ def merge_tree
+             Optional treeish reference pointing to the common base of `rhs` and this
+             index which equals lhs.
+ 
++        :param allow_unsafe_options:
++            Allow options that may write to arbitrary paths.
++
+         :return:
+             self (containing the merge and possibly unmerged entries in case of
+             conflicts)
+@@ -280,6 +289,12 @@ def merge_tree
+             yourself, you have to commit the changed index (or make a valid tree from
+             it) and retry with a three-way :meth:`index.from_tree <from_tree>` call.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([base, rhs]),
++                unsafe_options=self.unsafe_git_read_tree_options,
++            )
++
+         # -i : ignore working tree status
+         # --aggressive : handle more merge cases
+         # -m : do an actual merge
+@@ -324,7 +339,13 @@ def from_tree
+         return inst
+ 
+     @classmethod
+-    def from_tree(cls, repo: "Repo", *treeish: Treeish, **kwargs: Any) -> "IndexFile":
++    def from_tree(
++        cls,
++        repo: "Repo",
++        *treeish: Treeish,
++        allow_unsafe_options: bool = False,
++        **kwargs: Any,
++    ) -> "IndexFile":
+         R"""Merge the given treeish revisions into a new index which is returned.
+         The original index will remain unaltered.
+ 
+@@ -348,6 +369,9 @@ def from_tree
+         :param kwargs:
+             Additional arguments passed to :manpage:`git-read-tree(1)`.
+ 
++        :param allow_unsafe_options:
++            Allow options that may write to arbitrary paths.
++
+         :return:
+             New :class:`IndexFile` instance. It will point to a temporary index location
+             which does not exist anymore. If you intend to write such a merged Index,
+@@ -365,6 +389,12 @@ def from_tree
+         if len(treeish) == 0 or len(treeish) > 3:
+             raise ValueError("Please specify between 1 and 3 treeish, got %i" % len(treeish))
+ 
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates(treeish, kwargs),
++                unsafe_options=cls.unsafe_git_read_tree_options,
++            )
++
+         arg_list: List[Union[Treeish, str]] = []
+         # Ignore that the working tree and index possibly are out of date.
+         if len(treeish) > 1:
+@@ -1398,6 +1428,7 @@ def reset
+         working_tree: bool = False,
+         paths: Union[None, Iterable[PathLike]] = None,
+         head: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "IndexFile":
+         """Reset the index to reflect the tree at the given commit. This will not adjust
+@@ -1429,6 +1460,9 @@ def reset
+             The paths need to exist at the commit, otherwise an exception will be
+             raised.
+ 
++        :param allow_unsafe_options:
++            Allow options that may write to arbitrary paths.
++
+         :param kwargs:
+             Additional keyword arguments passed to :manpage:`git-reset(1)`.
+ 
+@@ -1445,7 +1479,7 @@ def reset
+         """
+         # What we actually want to do is to merge the tree into our existing index,
+         # which is what git-read-tree does.
+-        new_inst = type(self).from_tree(self.repo, commit)
++        new_inst = type(self).from_tree(self.repo, commit, allow_unsafe_options=allow_unsafe_options)
+         if not paths:
+             self.entries = new_inst.entries
+         else:
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 4a3d516244..df2eea60bc 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -38,6 +38,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73619_p2.patch \
            file://CVE-2026-76221.patch \
            file://CVE-2026-76220.patch \
+           file://CVE-2026-76219.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

