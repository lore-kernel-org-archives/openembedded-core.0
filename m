Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863A0CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:55 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15906.1792131584148701298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=djkLEyJa;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14932; q=dns/txt;
  s=iport01; t=1792131585; x=1793341185;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=V5816T6aW3rfX++7+pcj7i3htQmF+dPCapLJZRwk4vs=;
  b=djkLEyJazoMKDmGJYSYeAEXOZyN7+tQdEJeDGI+cUJNaevAlyybRFf2p
   4id9uDZe5iWnRntj11M7w05b78WaIYOGQOFYOrGpH8dB/sapmwrB3Av6q
   X3K23gzrCSmceRf9XwPpXZCn9nbtx/29lemzMKCyucD6VcQIDAgePyO67
   ZwtBZDmb9v7sXNRCH89+oWvuaizmYpvGLIKhtHVKE2f9ypzNK5xq2z6WF
   3NBpElFq9/0VtineWlYfx3zuWabXNnx00R9SOR7DU26m6FA4hgK4lYJSD
   a781iiDnsdiBJ+DYv6x2sfdVi0OwpL+L5VCZSdxEZiyclEQ9uarXRYniU
   g==;
X-CSE-ConnectionGUID: rRRRiPhfTYqJ6GqVVeefxA==
X-CSE-MsgGUID: CYXagMlxSWaM8/mUwS+uAQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgBfwdFq/5T/Ja1aHgE8DA4LgVmCV3VgQ0kDlCaCI?=
 =?us-ascii?q?QOeHIF+DwEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3A?=
 =?us-ascii?q?xG8c4F5M4EBgykBPwICQAFQ2EsQb4FoAQsUAYE4hUCII10YAUSCVYFjJxuBS?=
 =?us-ascii?q?USBFYNpgQWBMioCAhiBcoYZBIMcEoFagQOOSoV6SIEeA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCA?=
 =?us-ascii?q?AIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeSFB6CGAgzEj0kLQErBB5ZCj4lEBw0MpJnAgGSPaEPhCiMI?=
 =?us-ascii?q?pU6GjOFW6UUC5h9jgqWT4RpgWg8gVkzGggbFTuCZwlKGQ+OKw4Lg2CFE1HId?=
 =?us-ascii?q?icyAgYDMgEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:QDlGlaru0b4pFYPtKefXR+8kEx5eBmJPZBIvgKrLsJaIsI4StFCzt
 garIBnQO//YYmqkfNwnYN+xpk4GupCGy4JmTwtlrXo3FykapePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vxNO1tPz
 fwWFAEUTE6sntyIzb+1WsA506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WyxFsluZqII84nPYy0p6172F3N/9J4fUGZUIwx3Bz
 o7A10/IMhgVEdiP8gWM1yLrg9LQpmDmcbtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn288lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:xoGgQaOsqXrO+sBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3ABbJXaGm257e4VpbCzkSB3G0j4zjXOWfn9k3RG0+?=
 =?us-ascii?q?2NVdwauO6UGGu9a5qg+M7zg=3D=3D?=
X-Talos-MUID: 9a23:KPna4ggmBNfpbclPZai57MMpH/ZY6quLDFA2rpwj646BCDNLeCq0tWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536485531"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 3269418000140
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id CD1ECCC12A8; Thu, 15 Oct 2026 23:19:22 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 02/27] python3-git: Fix CVE-2026-67323
Date: Thu, 15 Oct 2026 23:18:57 -0700
Message-Id: <20261016061922.843414-3-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247995

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/701ce32fe5ba8cb622c0e0342a376a6beb47d738
[2] https://www.cve.org/CVERecord?id=CVE-2026-67323

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-67323.patch   | 346 ++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |   1 +
 2 files changed, 347 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch
new file mode 100644
index 0000000000..1d1140b65a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch
@@ -0,0 +1,346 @@
+From be9e81b3ded21bb7e20d9d679cf3409002a7bc79 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 12 Jul 2026 15:06:42 +0200
+Subject: [PATCH 11/38] fix: Guard unsafe git command options
+ (GHSA-956x-8gvw-wg5v)
+
+Reject command options that can execute arbitrary helpers or write files when passed through archive, revision traversal, blame, clone, fetch, pull, push, and ls-remote APIs. Validate positional option tokens and transformed keyword options consistently, including Git-supported long-option abbreviations, attached short-option values, and falsey stringifiable remotes. Preserve explicit allow_unsafe_options and allow_unsafe_protocols escape hatches.
+
+Add regression coverage for each guarded API, option spelling and abbreviation forms, inert keyword values, mixed positional and keyword candidates, tuple blame options, stringifiable remotes, and unsafe commands that must not create marker files.
+
+CVE: CVE-2026-67323
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/701ce32fe5ba8cb622c0e0342a376a6beb47d738]
+
+Backport Changes:
+- Omit upstream regression test changes because the current 
+  PyPI source archive does not include its test suite.
+- Port the guards into the 3.1.42 method signatures where 
+  the upstream API had since changed.
+
+Reviewed-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 701ce32fe5ba8cb622c0e0342a376a6beb47d738)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py            |   22 +++++++++++-
+ git/objects/commit.py |   12 ++++++
+ git/remote.py         |   15 ++++++--
+ git/repo/base.py      |   93 +++++++++++++++++++++++++++++++++++++++++++------
+ 4 files changed, 126 insertions(+), 16 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 8e8cd0c5..81ea0b3c 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -316,6 +316,11 @@ class Git(LazyMixin):
+ 
+     re_unsafe_protocol = re.compile(r"(.+)::.+")
+ 
++    unsafe_git_ls_remote_options = [
++        # This option allows arbitrary command execution in git-ls-remote.
++        "--upload-pack",
++    ]
++
+     def __getstate__(self) -> Dict[str, Any]:
+         return slots_to_dict(self, exclude=self._excluded_)
+ 
+@@ -853,6 +858,21 @@ class Git(LazyMixin):
+         else:
+             super()._set_cache_(attr)
+         # END handle version info
++    def ls_remote(
++        self,
++        *args: Any,
++        allow_unsafe_options: bool = False,
++        **kwargs: Any,
++    ) -> Union[str, bytes, Tuple[int, Union[str, bytes], str], "Git.AutoInterrupt"]:
++        """List references in a remote repository.
++
++        :param allow_unsafe_options:
++            Allow unsafe options, like ``--upload-pack``.
++        """
++        if not allow_unsafe_options:
++            candidate_options = self._option_candidates(args, kwargs)
++            Git.check_unsafe_options(options=candidate_options, unsafe_options=self.unsafe_git_ls_remote_options)
++        return self._call_process("ls_remote", *args, **kwargs)
+ 
+     @property
+     def working_dir(self) -> Union[None, PathLike]:
+@@ -1295,7 +1315,7 @@ class Git(LazyMixin):
+         return args
+ 
+     @classmethod
+-    def _unpack_args(cls, arg_list: Sequence[str]) -> List[str]:
++    def _unpack_args(cls, arg_list: Sequence[Any]) -> List[str]:
+         outlist = []
+         if isinstance(arg_list, (list, tuple)):
+             for arg in arg_list:
+diff --git a/git/objects/commit.py b/git/objects/commit.py
+index caec1b6c..ae60d286 100644
+--- a/git/objects/commit.py
++++ b/git/objects/commit.py
+@@ -76,6 +76,12 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
+     default_encoding = "UTF-8"
+ 
+     # object configuration
++    # Options to :manpage:`git-rev-list(1)` that can overwrite files.
++    unsafe_git_rev_options = [
++        "--output",
++        "-o",
++    ]
++
+     type: Literal["commit"] = "commit"
+     __slots__ = (
+         "tree",
+@@ -269,6 +275,7 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
+         repo: "Repo",
+         rev: Union[str, "Commit", "SymbolicReference"],  # type: ignore
+         paths: Union[PathLike, Sequence[PathLike]] = "",
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> Iterator["Commit"]:
+         """Find all commits matching the given criteria.
+@@ -294,6 +301,11 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
+             raise ValueError("--pretty cannot be used as parsing expects single sha's only")
+         # END handle pretty
+ 
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([rev], kwargs), unsafe_options=cls.unsafe_git_rev_options
++            )
++
+         # Use -- in all cases, to prevent possibility of ambiguous arguments.
+         # See https://github.com/gitpython-developers/GitPython/issues/264.
+ 
+diff --git a/git/remote.py b/git/remote.py
+index 3ccac59d..25e076f3 100644
+--- a/git/remote.py
++++ b/git/remote.py
+@@ -1005,7 +1005,10 @@ class Remote(LazyMixin, IterableObj):
+                     Git.check_unsafe_protocols(ref)
+ 
+         if not allow_unsafe_options:
+-            Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=self.unsafe_git_fetch_options)
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=self.unsafe_git_fetch_options,
++            )
+ 
+         proc = self.repo.git.fetch(
+             "--", self, *args, as_process=True, with_stdout=False, universal_newlines=True, v=verbose, **kwargs
+@@ -1046,7 +1049,10 @@ class Remote(LazyMixin, IterableObj):
+                 Git.check_unsafe_protocols(ref)
+ 
+         if not allow_unsafe_options:
+-            Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=self.unsafe_git_pull_options)
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=self.unsafe_git_pull_options,
++            )
+ 
+         proc = self.repo.git.pull(
+             "--", self, refspec, with_stdout=False, as_process=True, universal_newlines=True, v=True, **kwargs
+@@ -1111,7 +1117,10 @@ class Remote(LazyMixin, IterableObj):
+                 Git.check_unsafe_protocols(ref)
+ 
+         if not allow_unsafe_options:
+-            Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=self.unsafe_git_push_options)
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=self.unsafe_git_push_options,
++            )
+ 
+         proc = self.repo.git.push(
+             "--",
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 92ace3a0..5b255997 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -152,6 +152,20 @@ class Repo:
+     https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---configltkeygtltvaluegt
+     """
+ 
++    unsafe_git_archive_options = [
++        # Allows arbitrary command execution through the remote git-upload-archive command.
++        "--exec",
++        # Writes output to a caller-controlled filesystem path.
++        "--output",
++        "-o",
++    ]
++
++    unsafe_git_revision_options = [
++        # This option allows output to be written to arbitrary files before revision parsing.
++        "--output",
++        "-o",
++    ]
++
+     # Invariants
+     config_level: ConfigLevels_Tup = ("system", "user", "global", "repository")
+     """Represents the configuration level of a configuration file."""
+@@ -690,6 +704,7 @@ class Repo:
+         self,
+         rev: Union[str, Commit, "SymbolicReference", None] = None,
+         paths: Union[PathLike, Sequence[PathLike]] = "",
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> Iterator[Commit]:
+         """A list of Commit objects representing the history of a given ref/commit.
+@@ -705,7 +720,11 @@ class Repo:
+         :param kwargs:
+             Arguments to be passed to git-rev-list - common ones are max_count and skip.
+ 
+-        :note: To receive only commits between two named revisions, use the
++        :param allow_unsafe_options:
++            Allow unsafe options in the revision argument, like ``--output``.
++
++        :note:
++            To receive only commits between two named revisions, use the
+             ``"revA...revB"`` revision specifier.
+ 
+         :return: ``git.Commit[]``
+@@ -713,7 +732,18 @@ class Repo:
+         if rev is None:
+             rev = self.head.commit
+ 
+-        return Commit.iter_items(self, rev, paths, **kwargs)
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([rev], kwargs), unsafe_options=self.unsafe_git_revision_options
++            )
++
++        return Commit.iter_items(
++            self,
++            rev,
++            paths,
++            allow_unsafe_options=allow_unsafe_options,
++            **kwargs,
++        )
+ 
+     def merge_base(self, *rev: TBD, **kwargs: Any) -> List[Union[Commit_ish, None]]:
+         """Find the closest common ancestor for the given revision (Commits, Tags, References, etc.).
+@@ -957,7 +987,9 @@ class Repo:
+         # reveal_type(self.head.reference)  # => Reference
+         return self.head.reference
+ 
+-    def blame_incremental(self, rev: str | HEAD, file: str, **kwargs: Any) -> Iterator["BlameEntry"]:
++    def blame_incremental(
++        self, rev: str | HEAD | None, file: str, allow_unsafe_options: bool = False, **kwargs: Any
++    ) -> Iterator["BlameEntry"]:
+         """Iterator for blame information for the given file at the given revision.
+ 
+         Unlike :meth:`blame`, this does not return the actual file's contents, only a
+@@ -965,13 +997,21 @@ class Repo:
+ 
+         :param rev: Revision specifier, see git-rev-parse for viable options.
+ 
+-        :return: Lazy iterator of :class:`BlameEntry` tuples, where the commit indicates
+-            the commit to blame for the line, and range indicates a span of line numbers
+-            in the resulting file.
++        :param allow_unsafe_options:
++            Allow unsafe options in revision argument, like ``--output``.
++
++        :return:
++            Lazy iterator of :class:`BlameEntry` tuples, where the commit indicates the
++            commit to blame for the line, and range indicates a span of line numbers in
++            the resulting file.
+ 
+         If you combine all line number ranges outputted by this command, you should get
+         a continuous range spanning all line numbers in the file.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([rev], kwargs), unsafe_options=self.unsafe_git_revision_options
++            )
+ 
+         data: bytes = self.git.blame(rev, "--", file, p=True, incremental=True, stdout_as_string=False, **kwargs)
+         commits: Dict[bytes, Commit] = {}
+@@ -1048,13 +1088,17 @@ class Repo:
+         rev: Union[str, HEAD],
+         file: str,
+         incremental: bool = False,
+-        rev_opts: Optional[List[str]] = None,
++        rev_opts: Optional[Sequence[str]] = None,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> List[List[Commit | List[str | bytes] | None]] | Iterator[BlameEntry] | None:
+         """The blame information for the given file at the given revision.
+ 
+         :param rev: Revision specifier, see git-rev-parse for viable options.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options in revision argument, like ``--output``.
++
+         :return:
+             list: [git.Commit, list: [<line>]]
+ 
+@@ -1063,9 +1107,14 @@ class Repo:
+             of appearance.
+         """
+         if incremental:
+-            return self.blame_incremental(rev, file, **kwargs)
+-        rev_opts = rev_opts or []
+-        data: bytes = self.git.blame(rev, *rev_opts, "--", file, p=True, stdout_as_string=False, **kwargs)
++            return self.blame_incremental(rev, file, allow_unsafe_options=allow_unsafe_options, **kwargs)
++        rev_opts_list = list(rev_opts or [])
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([rev, rev_opts_list], kwargs),
++                unsafe_options=self.unsafe_git_revision_options,
++            )
++        data: bytes = self.git.blame(rev, *rev_opts_list, "--", file, p=True, stdout_as_string=False, **kwargs)
+         commits: Dict[str, Commit] = {}
+         blames: List[List[Commit | List[str | bytes] | None]] = []
+ 
+@@ -1270,7 +1319,10 @@ class Repo:
+         if not allow_unsafe_protocols:
+             Git.check_unsafe_protocols(str(url))
+         if not allow_unsafe_options:
+-            Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=cls.unsafe_git_clone_options)
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=cls.unsafe_git_clone_options,
++            )
+         if not allow_unsafe_options and multi:
+             Git.check_unsafe_options(options=multi, unsafe_options=cls.unsafe_git_clone_options)
+ 
+@@ -1419,6 +1471,8 @@ class Repo:
+         ostream: Union[TextIO, BinaryIO],
+         treeish: Optional[str] = None,
+         prefix: Optional[str] = None,
++        allow_unsafe_options: bool = False,
++        allow_unsafe_protocols: bool = False,
+         **kwargs: Any,
+     ) -> Repo:
+         """Archive the tree at the given revision.
+@@ -1436,7 +1490,14 @@ class Repo:
+             * You may specify the special **path** keyword, which may either be a repository-relative
+               path to a directory or file to place into the archive, or a list or tuple of multiple paths.
+ 
+-        :raise GitCommandError: If something went wrong.
++        :param allow_unsafe_options:
++            Allow unsafe options, like ``--exec`` or ``--output``.
++
++        :param allow_unsafe_protocols:
++            Allow unsafe protocols to be used in ``remote``, like ``ext``.
++
++        :raise git.exc.GitCommandError:
++            If something went wrong.
+ 
+         :return: self
+         """
+@@ -1444,6 +1505,14 @@ class Repo:
+             treeish = self.head.commit
+         if prefix and "prefix" not in kwargs:
+             kwargs["prefix"] = prefix
++        remote = kwargs.get("remote")
++        if not allow_unsafe_protocols and remote is not None:
++            Git.check_unsafe_protocols(str(remote))
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=self.unsafe_git_archive_options,
++            )
+         kwargs["output_stream"] = ostream
+         path = kwargs.pop("path", [])
+         path = cast(Union[PathLike, List[PathLike], Tuple[PathLike, ...]], path)
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 1ba34dbf52..f3d2c9de80 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -22,6 +22,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-42215_p1.patch \
             file://CVE-2026-42215_p2.patch \
             file://CVE-2026-67326.patch \
+            file://CVE-2026-67323.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


