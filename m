Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8009.1795062167036122572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HGK+Rxzf;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15600; q=dns/txt;
  s=iport01; t=1795062167; x=1796271767;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qXLTYXxQ0lXtKNJd3KShpFGmAfo20fCiDx9srY88f4g=;
  b=HGK+Rxzf5IMrA5KnhdHK8m2mahsU/K+geMstnAq/yQtLwBN9OyUKte1Q
   z20ZLKtUZesVkO/gTcvkP+HUc485VLnrdKePsRKipbzw0faoU7oeBEGTM
   UVKneYmvKXC6wSVDD2F3W+PsNJC2b3sZ4BgR5EXccF/XMNVzi7GVm3uH/
   Bp6j3kKAbWh4HD7fMRGTtCIsD0AOQyDkfLJSMt414rQZUQPqvNXcjMdgL
   quOyXQC2iUxq4o0wvbu6yKXn35+bWXKD4WsC6eNlBiJwtF9bw+J44BbtE
   M+WASPjTFu7IG8+uXGrWdPUIIaSwPRfXJeG4nIMNfZO2lEKmrPh+OmlQv
   A==;
X-CSE-ConnectionGUID: Yk0y8StTSsGFCi349IDO+A==
X-CSE-MsgGUID: E7Dj6ebBSPK7LGnRIy6GAQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/8xK/pBaglmCV3VgQ0kDlCeCIQOeKYEbA?=
 =?us-ascii?q?2APAQEBD0QNBAEBhD9GAo4gAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbk1g?=
 =?us-ascii?q?XkzgQGDKQE/AgJAAVDYTBBvgWgBCxQBgTiFQogkXRgBRIJWgWMnG4FJRIEVg?=
 =?us-ascii?q?2qBBYEyKgICggqGGgSDHBKBVIECjBUCgU+BRoZESIEeA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FG?=
 =?us-ascii?q?iY+GwqBDCcfHhsOAg4YDUgRLDcVGQQ+bgeTUYJLCDMSPSQtASsiWUgKGxAcG?=
 =?us-ascii?q?BwGLJJnA5AcgiGhEYQrjCSVOhozhVulFwuYfY4KllGEaoFoPIFZMxoIGxU7g?=
 =?us-ascii?q?mcJShkPjisOC4NghRNRxlomMgIGAwMvAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:FH3Vl6DFxRhLFxVW/2Piw5YqxClBgxIJ4kV8jS/XYbTApG4igTUEz
 mQbDGrXP66KZWvxL4x+O4uxo01QvpPdy99qOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb8i2YvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE8vY2HRENIbEj4clZKmAVq
 a05BBdOR0XW7w626OrTpuhEj8k5ac2uN4QFtzQ4lnfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWYHgBfoO3WjPn8GFYg3kOqAjXjkeDoeo1WQzUYyyzaKnVUoj+OyWDbTUvHVaccLk0yyn
 VrloEDWBCs7JYKw4APQpxpAgceKx0sXQrk6E6W18PNvilCfymEfTRYRT1aTpfiillX4XMpSL
 UER8CcioaU+skuxQbHAswaQqXOe+xpZUN1KHqhis0eGy7Hf5ECSAW1soiN9VeHKffQeHVQCv
 mJlVfuzbdCzmNV5kU6gy4o=
IronPort-HdrOrdr: A9a23:o53IlqGvgwFOYI3GpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AIe7q6WnNKRkVqi44Hjs4/iHACNzXOUzelGaAGFO?=
 =?us-ascii?q?EMn1GZpaUEgPB2Y9D0OM7zg=3D=3D?=
X-Talos-MUID: 9a23:xh2GBQkbZbLORttGi7nGdnpPa+tqvamkIns1ssoilM++FD0uFB6k2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="61911737"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:44 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 558FB180006CF
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:44 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id EAE03CBF202; Wed, 18 Nov 2026 20:22:42 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 02/27] python3-git: fix CVE-2026-67323
Date: Wed, 18 Nov 2026 20:22:17 -0800
Message-Id: <20261119042242.1640611-3-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250612
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/701ce32fe5ba8cb622c0e0342a376a6beb47d738
[2] https://security-tracker.debian.org/tracker/CVE-2026-67323

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Changed the ls_remote documentation to describe --upload-pack
  without --exec.
---
 .../python/python3-git/CVE-2026-67323.patch   | 356 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 357 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch
new file mode 100644
index 0000000000..3901f6244b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch
@@ -0,0 +1,356 @@
+From 80bf84d6f24adcc181b78d71fa94544924a85b2c Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 12 Jul 2026 15:06:42 +0200
+Subject: [PATCH] fix: Guard unsafe git command options (GHSA-956x-8gvw-wg5v)
+
+Reject command options that can execute arbitrary helpers or write files when passed through archive, revision traversal, blame, clone, fetch, pull, push, and ls-remote APIs. Validate positional option tokens and transformed keyword options consistently, including Git-supported long-option abbreviations, attached short-option values, and falsey stringifiable remotes. Preserve explicit allow_unsafe_options and allow_unsafe_protocols escape hatches.
+
+Add regression coverage for each guarded API, option spelling and abbreviation forms, inert keyword values, mixed positional and keyword candidates, tuple blame options, stringifiable remotes, and unsafe commands that must not create marker files.
+
+CVE: CVE-2026-67323
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/701ce32fe5ba8cb622c0e0342a376a6beb47d738]
+
+Backport Changes:
+- Omitted test/test_clone.py, test/test_commit.py, test/test_git.py,
+  test/test_remote.py, test/test_repo.py because the current PyPI
+  source archive does not include the test suite and the python3-git
+  recipe does not run it.
+
+Reviewed-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 701ce32fe5ba8cb622c0e0342a376a6beb47d738)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py            | 37 +++++++++++++++++++++-
+ git/objects/commit.py | 12 +++++++
+ git/remote.py         | 15 ++++++--
+ git/repo/base.py      | 80 +++++++++++++++++++++++++++++++++++++++----
+ 4 files changed, 133 insertions(+), 11 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index bb8f93a8..87866be2 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -414,6 +414,11 @@ class Git:
+         "_version_info_token",
+     )
+ 
++    unsafe_git_ls_remote_options = [
++        # This option allows arbitrary command execution in git-ls-remote.
++        "--upload-pack",
++    ]
++
+     re_unsafe_protocol = re.compile(r"(.+)::.+")
+ 
+     def __getstate__(self) -> Dict[str, Any]:
+@@ -742,6 +747,20 @@ Git.check_unsafe_options
+                     f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
+                 )
+ 
++    @classmethod
++    def _option_candidates(cls, args: Sequence[Any] = (), kwargs: Optional[Mapping[str, Any]] = None) -> List[str]:
++        """Collect possible option spellings before command-line transformation."""
++        options = [
++            option for option in cls._unpack_args([arg for arg in args if arg is not None]) if option.startswith("-")
++        ]
++        if kwargs:
++            for key, value in kwargs.items():
++                values = value if isinstance(value, (list, tuple)) else (value,)
++                if any(value is True or (value is not False and value is not None) for value in values):
++                    key = str(key)
++                    options.append(f"-{key}" if len(key) == 1 else f"--{dashify(key)}")
++        return options
++
+     class AutoInterrupt:
+         """Process wrapper that terminates the wrapped process on finalization.
+ 
+@@ -999,6 +1019,22 @@ Git.__getattr__
+             return super().__getattribute__(name)
+         return lambda *args, **kwargs: self._call_process(name, *args, **kwargs)
+ 
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
++
+     def set_persistent_git_options(self, **kwargs: Any) -> None:
+         """Specify command line options to the git executable for subsequent
+         subcommand calls.
+@@ -1488,7 +1524,7 @@ Git._unpack_args
+         return args
+ 
+     @classmethod
+-    def _unpack_args(cls, arg_list: Sequence[str]) -> List[str]:
++    def _unpack_args(cls, arg_list: Sequence[Any]) -> List[str]:
+         outlist = []
+         if isinstance(arg_list, (list, tuple)):
+             for arg in arg_list:
+diff --git a/git/objects/commit.py b/git/objects/commit.py
+index d957c905..6e2ff759 100644
+--- a/git/objects/commit.py
++++ b/git/objects/commit.py
+@@ -85,6 +85,12 @@ class Commit:
+ 
+     # INVARIANTS
+     default_encoding = "UTF-8"
++    # Options to :manpage:`git-rev-list(1)` that can overwrite files.
++    unsafe_git_rev_options = [
++        "--output",
++        "-o",
++    ]
++
+ 
+     type: Literal["commit"] = "commit"
+ 
+@@ -302,6 +308,7 @@ Commit.iter_items
+         repo: "Repo",
+         rev: Union[str, "Commit", "SymbolicReference"],
+         paths: Union[PathLike, Sequence[PathLike]] = "",
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> Iterator["Commit"]:
+         R"""Find all commits matching the given criteria.
+@@ -329,6 +336,11 @@ Commit.iter_items
+         if "pretty" in kwargs:
+             raise ValueError("--pretty cannot be used as parsing expects single sha's only")
+         # END handle pretty
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([rev], kwargs), unsafe_options=cls.unsafe_git_rev_options
++            )
++
+ 
+         # Use -- in all cases, to prevent possibility of ambiguous arguments.
+         # See https://github.com/gitpython-developers/GitPython/issues/264.
+diff --git a/git/remote.py b/git/remote.py
+index f2ecd0f3..cafa1f84 100644
+--- a/git/remote.py
++++ b/git/remote.py
+@@ -1061,7 +1061,10 @@ Remote.fetch
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
+             "--", self, *args, as_process=True, with_stdout=False, universal_newlines=False, v=verbose, **kwargs
+@@ -1115,7 +1118,10 @@ Remote.pull
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
+             "--", self, refspec, with_stdout=False, as_process=True, universal_newlines=False, v=True, **kwargs
+@@ -1188,7 +1194,10 @@ Remote.push
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
+index 8059fceb..e9e7aa66 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -159,6 +159,20 @@ class Repo:
+     ``protocol.allow`` and ``core.gitProxy`` to execute arbitrary commands:
+     https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---configltkeygtltvaluegt
+     """
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
+ 
+     # Invariants
+     config_level: ConfigLevels_Tup = ("system", "user", "global", "repository")
+@@ -743,6 +757,7 @@ Repo.iter_commits
+         self,
+         rev: Union[str, Commit, "SymbolicReference", None] = None,
+         paths: Union[PathLike, Sequence[PathLike]] = "",
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> Iterator[Commit]:
+         """An iterator of :class:`~git.objects.commit.Commit` objects representing the
+@@ -759,6 +774,9 @@ Repo.iter_commits
+         :param kwargs:
+             Arguments to be passed to :manpage:`git-rev-list(1)`.
+             Common ones are ``max_count`` and ``skip``.
++        :param allow_unsafe_options:
++            Allow unsafe options in the revision argument, like ``--output``.
++
+ 
+         :note:
+             To receive only commits between two named revisions, use the
+@@ -770,7 +788,18 @@ Repo.iter_commits
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
+     def merge_base(self, *rev: TBD, **kwargs: Any) -> List[Commit]:
+         R"""Find the closest common ancestor for the given revision
+@@ -1035,7 +1064,9 @@ Repo.blame_incremental
+         # reveal_type(self.head.reference)  # => Reference
+         return self.head.reference
+ 
+-    def blame_incremental(self, rev: str | HEAD | None, file: str, **kwargs: Any) -> Iterator["BlameEntry"]:
++    def blame_incremental(
++        self, rev: str | HEAD | None, file: str, allow_unsafe_options: bool = False, **kwargs: Any
++    ) -> Iterator["BlameEntry"]:
+         """Iterator for blame information for the given file at the given revision.
+ 
+         Unlike :meth:`blame`, this does not return the actual file's contents, only a
+@@ -1046,6 +1077,9 @@ Repo.blame_incremental
+             uncommitted changes. Otherwise, anything successfully parsed by
+             :manpage:`git-rev-parse(1)` is a valid option.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options in revision argument, like ``--output``.
++
+         :return:
+             Lazy iterator of :class:`BlameEntry` tuples, where the commit indicates the
+             commit to blame for the line, and range indicates a span of line numbers in
+@@ -1055,6 +1089,10 @@ Repo.blame_incremental
+         a continuous range spanning all line numbers in the file.
+         """
+ 
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([rev], kwargs), unsafe_options=self.unsafe_git_revision_options
++            )
+         data: bytes = self.git.blame(rev, "--", file, p=True, incremental=True, stdout_as_string=False, **kwargs)
+         commits: Dict[bytes, Commit] = {}
+ 
+@@ -1132,7 +1170,8 @@ Repo.blame
+         rev: Union[str, HEAD, None],
+         file: str,
+         incremental: bool = False,
+-        rev_opts: Optional[List[str]] = None,
++        rev_opts: Optional[Sequence[str]] = None,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> List[List[Commit | List[str | bytes] | None]] | Iterator[BlameEntry] | None:
+         """The blame information for the given file at the given revision.
+@@ -1141,6 +1180,9 @@ Repo.blame
+             Revision specifier. If ``None``, the blame will include all the latest
+             uncommitted changes. Otherwise, anything successfully parsed by
+             :manpage:`git-rev-parse(1)` is a valid option.
++        :param allow_unsafe_options:
++            Allow unsafe options in revision argument, like ``--output``.
++
+ 
+         :return:
+             list: [git.Commit, list: [<line>]]
+@@ -1151,9 +1193,14 @@ Repo.blame
+             appearance.
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
+@@ -1364,7 +1411,10 @@ Repo.clone_from
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
+@@ -1539,6 +1589,8 @@ Repo.archive
+         ostream: Union[TextIO, BinaryIO],
+         treeish: Optional[str] = None,
+         prefix: Optional[str] = None,
++        allow_unsafe_options: bool = False,
++        allow_unsafe_protocols: bool = False,
+         **kwargs: Any,
+     ) -> Repo:
+         """Archive the tree at the given revision.
+@@ -1560,6 +1612,12 @@ Repo.archive
+             * You may specify the special ``path`` keyword, which may either be a
+               repository-relative path to a directory or file to place into the archive,
+               or a list or tuple of multiple paths.
++        :param allow_unsafe_options:
++            Allow unsafe options, like ``--exec`` or ``--output``.
++
++        :param allow_unsafe_protocols:
++            Allow unsafe protocols to be used in ``remote``, like ``ext``.
++
+ 
+         :raise git.exc.GitCommandError:
+             If something went wrong.
+@@ -1571,6 +1629,14 @@ Repo.archive
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
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 474206d4ed..72eb073196 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -22,6 +22,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-44244_p1.patch \
            file://CVE-2026-44244_p2.patch \
            file://CVE-2026-67326.patch \
+           file://CVE-2026-67323.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

