Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5D2CCF2C4
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:34 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15611.1792131564294051812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WUPbhfUS;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6697; q=dns/txt;
  s=iport01; t=1792131565; x=1793341165;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=VeEmC4iO4NTRIEMAzt+NrmS5wAEiz41cN0mSMubY+f8=;
  b=WUPbhfUSSDWHVx/O9n5BThom0ODUm0/PhfSMvo07hlooTFrXnE9WNGlv
   jf5Y4XE+NpDgp8GrKZtPqMqcLISgiGg3e64BTkXHVZqUdipMgq4Qti2mn
   j90QHM5zSCD3N+GOJzaSfLMck0dq+fuWzsi/hDgsiUJRsF4n3Hy9A8Pqd
   ew/aIZvEYRuGPyt0gImtVJbqbkp+7xAX3MPsxzVS86c4ZBkUDS2LFbv8M
   CzgCGjG1XACUl1DVqgBsTMvHZMsT9cLJ2J4mGQZOLchIy2YxTKi9GL8L9
   s+4ZMTFfHoPV9R2gozP0orfJUKps43JGfuYxWHKj3lzyyg2EFC9fWGM8N
   Q==;
X-CSE-ConnectionGUID: n8S5b9cKS1qk1cnG6lxBKg==
X-CSE-MsgGUID: 7Da825RsRVaqI5ZVWWmllg==
X-IPAS-Result: =?us-ascii?q?A0BIAgDpwNFq/5P/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx2gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYMZgWMnG4FJRIEVg2mBBYFcA?=
 =?us-ascii?q?gIYiAsEgxwSgVqBA4c2jQ5IgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QcbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUH?=
 =?us-ascii?q?oFyJk0xDD4TASuCUCcDkmiSP6EPhCiMIpU6GjOEBIFXkkCSVAuYfY4Klk+Ea?=
 =?us-ascii?q?YFoPIFZMxoIGxU7gmcJShkPjjmDa4UTUch2JzICCTIBAQcCBw4DC4FokAItg?=
 =?us-ascii?q?U8BAQ?=
IronPort-Data: A9a23:UoBlsam25WwC+lnkCe61hqvo5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMUD2FP/yIYmbzf9ElO9/n9kMF7MLdmtNlSlNupC9kEFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsvzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYtIwbt9UGptz
 qUBK2kGaD/dg/Kc473uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZT/7C7pm9AusrmjiaTRUpXqepLE85C7YywkZPL3FbYCPIoXVHJkJ9qqej
 j3q9jSjXysBDuKW0BvYwEyTuerLmSyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:iZCF86zjIe67Q8UxC4SfKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:CJCboWMqvh8CUO5DXnlcqURFEeMeK2TelXzWDBG8GUxKR+jA
X-Talos-MUID: 9a23:PmJesgaOfCoSo+BT6BPl1Gs/DtxS3a23KR0/r6o5vs2AOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="522017144"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 99DFC18000A50
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id F3DBCCC124F; Thu, 15 Oct 2026 23:19:22 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 09/27] python3-git: fix CVE-2026-73624
Date: Thu, 15 Oct 2026 23:19:04 -0700
Message-Id: <20261016061922.843414-10-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247981

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/1d51b891d7f236044a6aa17498ec682b63dad6e6
[2] https://www.cve.org/CVERecord?id=CVE-2026-73624

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73624.patch   | 135 ++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch
new file mode 100644
index 0000000000..b44e805f06
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch
@@ -0,0 +1,135 @@
+From fc5d625a6c45ac58a59dcf8fef246635080a1cbb Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 04:46:13 +0200
+Subject: [PATCH 17/38] fix: guard diff output options
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
+- Omit upstream regression test changes because the current
+  PyPI source archive does not include its test suite.
+- Use the Scarthgap IndexFile.Index spelling while carrying 
+  the upstream guard into the existing API.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 1d51b891d7f236044a6aa17498ec682b63dad6e6)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/diff.py       |   15 +++++++++++++--
+ git/index/base.py |   17 +++++++++++++++--
+ 2 files changed, 28 insertions(+), 4 deletions(-)
+
+diff --git a/git/diff.py b/git/diff.py
+index aba1a108..37ff2624 100644
+--- a/git/diff.py
++++ b/git/diff.py
+@@ -5,7 +5,7 @@
+ 
+ import re
+ 
+-from git.cmd import handle_process_output
++from git.cmd import Git, handle_process_output
+ from git.compat import defenc
+ from git.util import finalize_process, hex_to_bin
+ 
+@@ -109,6 +109,7 @@ class Diffable:
+         other: Union[Type["Index"], "Tree", "Commit", None, str, object] = Index,
+         paths: Union[PathLike, List[PathLike], Tuple[PathLike, ...], None] = None,
+         create_patch: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "DiffIndex":
+         """Create diffs between two items being trees, trees and index or an
+@@ -134,6 +135,10 @@ class Diffable:
+             applied makes the self to other. Patches are somewhat costly as blobs have
+             to be read and diffed.
+ 
++        :param allow_unsafe_options:
++            If ``True``, allow options such as ``--output`` that can write to arbitrary
++            filesystem paths.
++
+         :param kwargs:
+             Additional arguments passed to git-diff, such as ``R=True`` to swap both
+             sides of the diff.
+@@ -145,7 +150,13 @@ class Diffable:
+             :class:`~Diffable.Index`, or as :class:`~git.objects.tree.Tree` or
+             :class:`~git.objects.commit.Commit`, or a git command error will occur.
+         """
+-        args: List[Union[PathLike, Diffable, Type["Diffable.Index"], object]] = []
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([other], kwargs),
++                unsafe_options=self.repo.unsafe_git_revision_options,
++            )
++
++        args: List[Union[PathLike, Diffable]] = []
+         args.append("--abbrev=40")  # We need full shas.
+         args.append("--full-index")  # Get full index paths, not only filenames.
+ 
+diff --git a/git/index/base.py b/git/index/base.py
+index 9d1db4e3..c3d1771c 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -19,6 +19,7 @@ from git.compat import (
+     force_bytes,
+     defenc,
+ )
++from git.cmd import Git
+ from git.exc import GitCommandError, CheckoutError, GitError, InvalidGitRepositoryError
+ from git.objects import (
+     Blob,
+@@ -1411,6 +1412,7 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+         other: Union[Type["git_diff.Diffable.Index"], "Tree", "Commit", str, None] = git_diff.Diffable.Index,
+         paths: Union[PathLike, List[PathLike], Tuple[PathLike, ...], None] = None,
+         create_patch: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> git_diff.DiffIndex:
+         """Diff this index against the working copy or a Tree or Commit object.
+@@ -1422,6 +1424,11 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             Will only work with indices that represent the default git index as
+             they have not been initialized with a stream.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([other], kwargs),
++                unsafe_options=self.repo.unsafe_git_revision_options,
++            )
+ 
+         # Only run if we are the default repository index.
+         if self._file_path != self._index_path():
+@@ -1441,7 +1448,13 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             # Invert the existing R flag.
+             cur_val = kwargs.get("R", False)
+             kwargs["R"] = not cur_val
+-            return other.diff(self.Index, paths, create_patch, **kwargs)
++            return other.diff(
++                self.Index,
++                paths,
++                create_patch,
++                allow_unsafe_options=allow_unsafe_options,
++                **kwargs,
++            )
+         # END diff against other item handling
+ 
+         # If other is not None here, something is wrong.
+@@ -1449,4 +1462,4 @@ class IndexFile(LazyMixin, git_diff.Diffable, Serializable):
+             raise ValueError("other must be None, Diffable.Index, a Tree or Commit, was %r" % other)
+ 
+         # Diff against working copy - can be handled by superclass natively.
+-        return super().diff(other, paths, create_patch, **kwargs)
++        return super().diff(other, paths, create_patch, allow_unsafe_options=allow_unsafe_options, **kwargs)
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 959186eeee..734144dc31 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -30,6 +30,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-69097.patch \
             file://CVE-2026-73625.patch \
             file://CVE-2026-73623.patch \
+            file://CVE-2026-73624.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


