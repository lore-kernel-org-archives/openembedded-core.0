Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8013.1795062169429342173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LBsnoPKl;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10646; q=dns/txt;
  s=iport01; t=1795062169; x=1796271769;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=14xDXoAGjNs59jlQDPwgpA1F9101kejNhZpQ4kSTzrA=;
  b=LBsnoPKli5A3IPpZRQ+3aGzGM4Rx0jb6yR8+85z7QhGOsk/iKSY5/wi6
   ko57dZ6A15OWyToJNl12n/Fp95kbS9CenWwlUF79pDwu3r6qDnZSxSKn7
   Eq4Hdv6NFldZaUMaA6NpEbhqqkG+OyE9iaU08NFj9mwNanGVPr0dxi+wx
   nMP0mK0k0XMukwZsasyWV2KruaoiZf9u510sWSJZr09zwOYWc6em/p/qG
   aYup0eehvwyxvkNp3D6OdVSEQj68apmCG/jt2kaSvfUOogwc7HC2MwD7i
   atAM51H5C8OgoAEQp6EGIdXhZpkcc8KTYMxEM7auG2iVzv07VHoCosRDH
   g==;
X-CSE-ConnectionGUID: eQOKj9XIS72HQoiba/mKlQ==
X-CSE-MsgGUID: Ew396BdNQ7uP9vAXYohXbw==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/9JK/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG5NYF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhMEG+BaAELFAGBOIVCiCRdGAFEglaBYycbgUlEgRWDaoEFg?=
 =?us-ascii?q?VwCiCYEgg2BDxKBVIECjBUCgU+BRoZESIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBD?=
 =?us-ascii?q?CcfHhsOAg4YDUgRLDcVGQQ+bgeTUYIlJgglDhItNisBKwSCKBwGLKUnn1OBP?=
 =?us-ascii?q?oQrjCSVOhozhASBV5JDklQLmH2OCpU8SE2EaoFoPIFZMxoIGxU7gmcJShkPj?=
 =?us-ascii?q?isOCxyDRIUTUcZaJjICBgMDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:ZNCIDKKSlXSsCXzmFE+Rm5QlxSXFcZb7ZxGr2PjKsXjdYENS0GEBy
 2sWW2mEPKmKYWqnf94kO9mxoxkC7JSGm4JhQQMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmckajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1jNWYVP9wo290oW0F38
 v0SIXcITRS60rfeLLKTEoGAh+wqIdOuOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A2NHwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237klUgieGybIS9ltqiaNoOzxiyq
 kT/oHnBUw8zBO2YyQqP7Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVncjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:5Q80FqnKUp9XTfxm0hDxR6d82UXpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3AryllyWk7xhL6L9rED17bC1WtuhXXOXDk61TScn+?=
 =?us-ascii?q?ZMjkzaISSSFWZv6ZHl/M7zg=3D=3D?=
X-Talos-MUID: 9a23:biZMVgW5t8iW5Rrq/BLz32A8HstO2vuzMBETuKU3vMm0PzMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="61911746"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:47 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 78B4A180001DA
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:47 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 81160CC8C85; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 20/27] python3-git: fix CVE-2026-78678 CVE-2026-78679
Date: Wed, 18 Nov 2026 20:22:35 -0800
Message-Id: <20261119042242.1640611-21-yurade@cisco.com>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250624
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2]
and [3], using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/1b0d2d9b91575f7db44ef4ff58ac37fc9335e5f6
[2] https://security-tracker.debian.org/tracker/CVE-2026-78678
[3] https://security-tracker.debian.org/tracker/CVE-2026-78679

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Added --exec to the ls_remote unsafe-option list. Converted the
  configurable clusterable-short-option string to a frozenset
  before membership checks, and updated the ls_remote documentation.
---
 .../CVE-2026-78678_CVE-2026-78679.patch       | 220 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 221 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch
new file mode 100644
index 0000000000..337efbe22f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch
@@ -0,0 +1,220 @@
+From 51216053bd6885b546be8e9ed2e8e1000e7ee5a3 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Wed, 5 Aug 2026 04:48:36 +0200
+Subject: [PATCH] Block file-reading Git options
+
+<!-- agent -->
+Reject file-reading options passed to blame, diff, and tag APIs. Inspect
+positional values after resolving aliases, recognize unsafe options
+behind command-specific short-flag clusters, and retain the explicit
+allow_unsafe_options escape hatch. This closes GHSA-5xxx-qhh7-9287 and
+GHSA-3wxw-xv34-2frg and covers the adjacent diff order-file sink.
+
+Regression tests cover long, short, and clustered options, incremental blame,
+tag path/reference positionals, the ref keyword alias, both diff entry points,
+and preservation of diff pickaxe behavior.
+
+Git baseline: cf5497b14c; git-blame, git-diff, and git-tag document the relevant file-input options.
+
+CVE: CVE-2026-78678 CVE-2026-78679
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/1b0d2d9b91575f7db44ef4ff58ac37fc9335e5f6]
+
+Backport Changes:
+- Omitted test/test_diff.py, test/test_refs.py, test/test_remote.py,
+  test/test_repo.py because the Wrynose PyPI source archive does not include
+  the test suite and the python3-git recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 1b0d2d9b91575f7db44ef4ff58ac37fc9335e5f6)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py        | 11 +++++++----
+ git/diff.py       |  7 ++++---
+ git/index/base.py |  3 ++-
+ git/refs/tag.py   | 10 ++++++----
+ git/repo/base.py  | 24 ++++++++++++++++++++----
+ 5 files changed, 39 insertions(+), 16 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 20abd015..b8ad449f 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -417,6 +417,7 @@ Git.unsafe_git_ls_remote_options
+     unsafe_git_ls_remote_options = [
+         # This option allows arbitrary command execution in git-ls-remote.
+         "--upload-pack",
++        "--exec",
+     ]
+ 
+     re_unsafe_protocol = re.compile(r"(.+)::.+")
+@@ -743,7 +744,9 @@ Git.check_unsafe_options signature
+         return dashify(option_tokens[0])
+ 
+     @classmethod
+-    def check_unsafe_options(cls, options: List[str], unsafe_options: List[str]) -> None:
++    def check_unsafe_options(
++        cls, options: List[str], unsafe_options: List[str], clusterable_short_options: str = "46flnqsv"
++    ) -> None:
+         """Raise :class:`~git.exc.UnsafeOptionError` for blocked option spellings.
+ 
+         In addition to exact matches, this rejects abbreviated long options accepted
+@@ -778,7 +781,7 @@ Git.check_unsafe_options clusterable short flags
+         # These value-less Git flags can be clustered before another short option
+         # (for example, ``-fuVALUE``). Stop at any other character because it may
+         # begin an attached value, as ``o`` does in the safe option ``-oupstream``.
+-        clusterable_short_options = frozenset("46flnqsv")
++        clusterable_short_options_set = frozenset(clusterable_short_options)
+         options_are_kwargs = all(not option.startswith("-") for option in options)
+         for option in options:
+             candidate = cls._canonicalize_option_name(option)
+@@ -795,7 +798,7 @@ Git.check_unsafe_options short-option parsing
+                         raise UnsafeOptionError(
+                             f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
+                         )
+-                    if option_char not in clusterable_short_options:
++                    if option_char not in clusterable_short_options_set:
+                         break
+             if not (option.startswith("--") or (options_are_kwargs and len(candidate) > 1)):
+                 continue
+@@ -1101,7 +1104,7 @@ Git.ls_remote documentation
+         """List references in a remote repository.
+ 
+         :param allow_unsafe_options:
+-            Allow unsafe options, like ``--upload-pack``.
++            Allow unsafe options, like ``--upload-pack`` or ``--exec``.
+         """
+         if not allow_unsafe_options:
+             candidate_options = self._option_candidates(args, kwargs)
+
+diff --git a/git/diff.py b/git/diff.py
+index 9a1f107b..032dfb25 100644
+--- a/git/diff.py
++++ b/git/diff.py
+@@ -216,8 +216,8 @@ Diffable.diff documentation
+             to be read and diffed.
+ 
+         :param allow_unsafe_options:
+-            If ``True``, allow options such as ``--output`` that can write to arbitrary
+-            filesystem paths.
++            If ``True``, allow options such as ``--output`` and ``-O`` that can write to
++            or read from arbitrary filesystem paths.
+ 
+         :param kwargs:
+             Additional arguments passed to :manpage:`git-diff(1)`, such as ``R=True`` to
+@@ -234,7 +234,8 @@ Diffable.diff unsafe-option validation
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+                 options=Git._option_candidates([other], kwargs),
+-                unsafe_options=self.repo.unsafe_git_revision_options,
++                unsafe_options=self.repo.unsafe_git_diff_options,
++                clusterable_short_options="46abceflmnpqrstuvwzBCDMNRW",
+             )
+ 
+         args: List[Union[PathLike, Diffable]] = []
+
+diff --git a/git/index/base.py b/git/index/base.py
+index f5932f2d..0ff15794 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -1550,7 +1550,8 @@ IndexFile.diff unsafe-option validation
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+                 options=Git._option_candidates([other], kwargs),
+-                unsafe_options=self.repo.unsafe_git_revision_options,
++                unsafe_options=self.repo.unsafe_git_diff_options,
++                clusterable_short_options="46abceflmnpqrstuvwzBCDMNRW",
+             )
+ 
+         # Only run if we are the default repository index.
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index b6fd7620..c91dd1f2 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -198,6 +198,19 @@ Repo unsafe-option lists
+     ]
+ 
+ 
++    unsafe_git_blame_options = unsafe_git_revision_options + [
++        # These options read from arbitrary files and expose their contents through blame output.
++        "--contents",
++        "-S",
++        "--ignore-revs-file",
++    ]
++
++    unsafe_git_diff_options = unsafe_git_revision_options + [
++        # Reads caller-controlled order patterns from an arbitrary file.
++        "-O",
++        "--orderfile",
++    ]
++
+     # Invariants
+     config_level: ConfigLevels_Tup = ("system", "user", "global", "repository")
+     """Represents the configuration level of a configuration file."""
+@@ -1102,7 +1115,7 @@ Repo.blame_incremental documentation and validation
+             :manpage:`git-rev-parse(1)` is a valid option.
+ 
+         :param allow_unsafe_options:
+-            Allow unsafe options in revision argument, like ``--output``.
++            Allow unsafe options in revision argument, like ``--output`` or ``--contents``.
+ 
+         :return:
+             Lazy iterator of :class:`BlameEntry` tuples, where the commit indicates the
+@@ -1115,7 +1128,9 @@ Repo.blame_incremental unsafe-option validation
+ 
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+-                options=Git._option_candidates([rev], kwargs), unsafe_options=self.unsafe_git_revision_options
++                options=Git._option_candidates([rev], kwargs),
++                unsafe_options=self.unsafe_git_blame_options,
++                clusterable_short_options="46bceflnpqstvw",
+             )
+         data: bytes = self.git.blame(rev, "--", file, p=True, incremental=True, stdout_as_string=False, **kwargs)
+         commits: Dict[bytes, Commit] = {}
+@@ -1205,7 +1220,7 @@ Repo.blame documentation
+             uncommitted changes. Otherwise, anything successfully parsed by
+             :manpage:`git-rev-parse(1)` is a valid option.
+         :param allow_unsafe_options:
+-            Allow unsafe options in revision argument, like ``--output``.
++            Allow unsafe options in revision argument, like ``--output`` or ``--contents``.
+ 
+ 
+         :return:
+@@ -1222,7 +1237,8 @@ Repo.blame unsafe-option validation
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+                 options=Git._option_candidates([rev, rev_opts_list], kwargs),
+-                unsafe_options=self.unsafe_git_revision_options,
++                unsafe_options=self.unsafe_git_blame_options,
++                clusterable_short_options="46bceflnpqstvw",
+             )
+         data: bytes = self.git.blame(rev, *rev_opts_list, "--", file, p=True, stdout_as_string=False, **kwargs)
+         commits: Dict[str, Commit] = {}
+
+diff --git a/git/refs/tag.py b/git/refs/tag.py
+index 07efa62f..d45fb7eb 100644
+--- a/git/refs/tag.py
++++ b/git/refs/tag.py
+@@ -134,15 +134,17 @@ TagReference.create unsafe-option validation
+         :return:
+             A new :class:`TagReference`.
+         """
++        legacy_ref = kwargs.pop("ref", None)
++        if legacy_ref:
++            reference = legacy_ref
++
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+-                options=Git._option_candidates([], kwargs),
++                options=Git._option_candidates([path, reference], kwargs),
+                 unsafe_options=cls.unsafe_git_tag_options,
++                clusterable_short_options="46adefilnqsv",
+             )
+ 
+-        if "ref" in kwargs and kwargs["ref"]:
+-            reference = kwargs["ref"]
+-
+         if "message" in kwargs and kwargs["message"]:
+             kwargs["m"] = kwargs["message"]
+             del kwargs["message"]
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index ef1c687c02..dc7694f593 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -44,6 +44,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-76222_p1.patch \
            file://CVE-2026-76222-regression.patch \
            file://CVE-2026-76222_p2.patch \
+           file://CVE-2026-78678_CVE-2026-78679.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

