Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7518.1793976213994639424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BRssb84n;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7393; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+Jr7+GuhDU2R3K5erzGKWoKvCiForUPjbG++J2PneSY=;
  b=BRssb84nwLuaMpN3je3/no3RrSviN05gJbhwM3EFNsDcliAsHwQYlCV6
   AUt7QnGFWYCaJwD82S92GxLOPBrPJATOD72HIId9dAHyMltGzftLPB1CH
   nAGpRpcgaaQ83B2TzQbZ/QKKdXqCJkpIinU22336xwSvZXiarCMNrmVTL
   5K34o0Fs2Eq0F4cl6MwyEh8eEJFi9lX/34/m/JhkpkoYjQtKirKd7e2iq
   /tCCGjo8O2d5qtszBvlfWUwmkvI4p7IaMk35s9o1eYCfHI0yBN7XfTgAF
   5iVWvaWWA5HTi0oKxMx9stH2eGCWGZPUo5NtZ7mQ8ZBq/G2f+YjTGXMHr
   A==;
X-CSE-ConnectionGUID: G6C69vwTSxOZnUSZdGsoQA==
X-CSE-MsgGUID: FcG601fpQ3uaK+uJGYx6IA==
X-IPAS-Result: =?us-ascii?q?A0BJAgAQ5u1q/5X/Ja1aglmCV3VgQ0kDlCeCIQOeIRSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAhYZKyMIGYMCAYI6AzcDEbw/g?=
 =?us-ascii?q?XkzgQGDKQE/AkNQ2EwQb4FoAQsUAYE4hUKIJF0YAUSCVoFjJxuBSUSBFYNpg?=
 =?us-ascii?q?QWBXAKBGS0BWIYHBIMcEoFagQMJjAwCgVGGeUiBHgNZLAFVEw0KCwcFgWgDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmP?=
 =?us-ascii?q?hsKLxgNSBEsNxUZBD5uB5I9gh8mOwsHATxRASsEgRQIgQwiLJJnkkGhEYQqj?=
 =?us-ascii?q?CSVOhozhASBV4s9hwWSVAuYfY4KllGEaYFoPIFZMxoIGxU7gmcJShkPjjmDa?=
 =?us-ascii?q?4UTUcYIJjICCQMvAQEHAgcOAwuBaJAALIFSAQE?=
IronPort-Data: A9a23:Vkl9BKtKfgFFOuIE0QcAmOW1yOfnVAFfMUV32f8akzHdYApBsoF/q
 tZmKWqGbquMZzameYwibIyzpxsPv57czdQ3HVBp+H03QywXgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw1bhcXzBQ6
 sAjOBc/aC24te6Z27WCY7w57igjBJGD0II3oHpsy3TdSP0hW52GGv+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtGYH49tL/Aan3XYiBCoV6YjaE2+GPUigd21dABNfKIJoHTHJQOzxbwS
 mTu0W/WXElDOsSmkieM0TGxpMD+jX3acddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:vmCWxawrWjc0WTpD2aiAKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3ASEQtwWmjMW7/N9jpnmgMbMRAKQrXOVKD5ymBPVC?=
 =?us-ascii?q?EMnZOeruocm2c17hjquM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AkYyE8QwI0jJNTU9Fc4/eB8aW98maqIqlJx5VyJs?=
 =?us-ascii?q?egpKZPA8zJhWyvSTpY6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545119398"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id C951318000276
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 2469BCBF203; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 16/27] python3-git: fix CVE-2026-76219
Date: Fri,  6 Nov 2026 06:43:20 -0800
Message-Id: <20261106144331.3354811-17-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249675
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
2.53.0

