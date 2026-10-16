Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1648BCCF2CA
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:19 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15273.1792129268347065025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SYlHLfK8;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7720; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=CJknh03RFU5NgooZnGCtQT2mQMEwqaNGRPgyDrvNUic=;
  b=SYlHLfK8uEJF/CHP7wxQFlT8zSBa0R6ZeXVOSwEiOQ/fDK4J1ghCJYKN
   u8DaHL9Xcg+nokVO+Cqioz7CiHz4AhFFvfittA2ubgZc16WKozooleM+r
   bSQMC7O0QAnLMvH2YZ1rJPDr4EqdiaFSQsEeC6fN9BbwsZ03RnqlmZX8P
   ELmet8KeFOzoXGqKVNAQnAqJTvY2NVUmfth+xzr+SHCoLf28YrBze7TKt
   bJyQBiTIt7m8tkMXXB/Wfxk0xkScPUvy/exAH+kOvaGzY6WvwSUeAwW19
   meTdMgwZXNWYihZQp+Vy4TOwpkfjTw+YZiQ4VSlLTsNfGUiQOaxyV4xIb
   g==;
X-CSE-ConnectionGUID: fMbq92KdSl2FSZ6IvppuAQ==
X-CSE-MsgGUID: idEzQhGXQ8Wu10DgGs8SvQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgCGuNFq/5H/Ja1aglmCV3VgQ0mUKYIhA54cFIFqD?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECFhkrIwgZgwIBgjoDNwMRvHiBe?=
 =?us-ascii?q?TOBAYMpAT8CQ1DYSxBvgWgBCxQBgTiFQIgjXRgBRIJVgWMnG4FJRIEVg2mBB?=
 =?us-ascii?q?YFcAQGBGS5YhgYEgxwSgVqBA0qTekiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEP?=
 =?us-ascii?q?m4HkhQegXImOwsHATxRASsEgRQIgS4skmeSQKEPhCiMIpU6GjOEBIFXiz2HA?=
 =?us-ascii?q?5JUC5h9jgqWT4RpgWg8gUcLBzMaCBsVO4JnCUoZD445g2uBf4NlyHYnMgIJM?=
 =?us-ascii?q?gEBBwIHDgMLgWiQACyBUgEB?=
IronPort-Data: A9a23:9HCSIqi9rHv3hVONzCnQpJhTX161NxEKZh0ujC45NGQN5FlHY01je
 htvWWqHbv7bNzH1fIsgPNm29EIP6MeBz9NhQQZurH1hQ3ljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUW3+xuUDtt+
 cccch42XE6imfqu3ZuCH7wEasQLdKEHPasFsX1miDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgp/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeOJIXaH5QJzy50o
 ErH80nrOxE1BOXP9ifcql6jqfSfpj3CDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBUCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:Vhu1RqjCVFjFQ+cjM6wOsP24FHBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:QG87fGM0vk6Y9u5DVgxt7R9OOcwedifz90WOAlGgEXtAcejA
X-Talos-MUID: 9a23:q/BZsArsuFB3mnUsvIYezzBuGdVR44ueMRAyjMxel8arLnxLJQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536182949"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 4E6FE180001C5
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 7BE94CBEF7A; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 16/27] python3-git: fix CVE-2026-76219
Date: Thu, 15 Oct 2026 22:40:55 -0700
Message-Id: <20261016054106.210444-17-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247939

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/9b5dcaf85da5946dbf69dcd53f9edba08f760b32
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-76219

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-76219.patch   | 155 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch
new file mode 100644
index 0000000000..3c3f3d2930
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch
@@ -0,0 +1,155 @@
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
+(cherry picked from commit f46d9d3d6f21073d312ca8ef4523bdbf43655c0f)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/index/base.py | 40 +++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 37 insertions(+), 3 deletions(-)
+
+diff --git a/git/index/base.py b/git/index/base.py
+index 90d4c16f..a2955ec3 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -131,6 +131,7 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+     """
+ 
+     unsafe_git_checkout_index_options = ["--prefix"]
++    unsafe_git_read_tree_options = ["--index-output"]
+ 
+     __slots__ = ("repo", "version", "entries", "_extension_data", "_file_path")
+ 
+@@ -256,7 +257,12 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
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
+@@ -270,6 +276,9 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             Optional treeish reference pointing to the common base of `rhs` and this
+             index which equals lhs.
+ 
++        :param allow_unsafe_options:
++            Allow options that may write to arbitrary paths.
++
+         :return:
+             self (containing the merge and possibly unmerged entries in case of
+             conflicts)
+@@ -280,6 +289,12 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
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
+@@ -324,7 +339,13 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
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
+@@ -348,6 +369,9 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         :param kwargs:
+             Additional arguments passed to :manpage:`git-read-tree(1)`.
+ 
++        :param allow_unsafe_options:
++            Allow options that may write to arbitrary paths.
++
+         :return:
+             New :class:`IndexFile` instance. It will point to a temporary index location
+             which does not exist anymore. If you intend to write such a merged Index,
+@@ -365,6 +389,12 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
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
+@@ -1398,6 +1428,7 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         working_tree: bool = False,
+         paths: Union[None, Iterable[PathLike]] = None,
+         head: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "IndexFile":
+         """Reset the index to reflect the tree at the given commit. This will not adjust
+@@ -1429,6 +1460,9 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             The paths need to exist at the commit, otherwise an exception will be
+             raised.
+ 
++        :param allow_unsafe_options:
++            Allow options that may write to arbitrary paths.
++
+         :param kwargs:
+             Additional keyword arguments passed to :manpage:`git-reset(1)`.
+ 
+@@ -1445,7 +1479,7 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         """
+         # What we actually want to do is to merge the tree into our existing index,
+         # which is what git-read-tree does.
+-        new_inst = type(self).from_tree(self.repo, commit)
++        new_inst = type(self).from_tree(self.repo, commit, allow_unsafe_options=allow_unsafe_options)
+         if not paths:
+             self.entries = new_inst.entries
+         else:
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index aece60339a..6532a8d8fe 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73619.patch \
            file://CVE-2026-76221.patch \
            file://CVE-2026-76220.patch \
+           file://CVE-2026-76219.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


