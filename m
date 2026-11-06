Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7520.1793976214416324349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gqLs1ZPe;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10646; q=dns/txt;
  s=iport01; t=1793976215; x=1795185815;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bLR8C6l6fNGqDBPrw7wW0BX1zhBoI8M+U275u3SSFmU=;
  b=gqLs1ZPeZSun8WonfOQ186x36TcyMCrWHK1t1w4azACkfO2C70c4ayeS
   yXeUKQ3dxwvPdiSnjug9lqpd73NUl0wuwejHpux+c//h97DtNAikKRX1o
   +qZrGBNtUImr8/uaiXJV+ZWkFRFH7UsM9U5PmcL0Lj9CMLAjLjT4mXvDV
   6nkjzBJLf7uOmeRTPmfYdbDU1CtSbGqE3ya0rxVVhOeuUm6pUyJtF/Yvz
   ZMlZgA3ZMfH0Z7nS3T4T5eSZnLg0e7mxNd+5+GPZEEAG3b1xJAQFx0PxX
   idnx5lF2woVk0/iIEKtZqUC4bDriA2vOvWPsfG50wrHS1kHOwLcnxD9RS
   g==;
X-CSE-ConnectionGUID: ZSbaOiFsTxqgsQnTWWstbg==
X-CSE-MsgGUID: OOC55It9RSGQKp/sJcVJQA==
X-IPAS-Result: =?us-ascii?q?A0BJAgAN5+1q/5T/Ja1aH4I6gld1YENJA5QngiEDniGBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDNwMRvE2Be?=
 =?us-ascii?q?TOBAYMpAT8CQ1DYTBBvgWgBCxQBgTiFQogkXRgBRIJWgWMnG4FJRIEVg2mBB?=
 =?us-ascii?q?YFcAogmBIINgQ8SgVqBA4wVAoFRW4YeSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovG?=
 =?us-ascii?q?A1IESw3FRkEPm4Hkj2CHyYIJQ4SLTYrASsEgigcBiylKJ9TgT6EKowklToaM?=
 =?us-ascii?q?4QEgVeSQpJUC5h9jgqVPEhNhGmBaDyBWTMaCBsVO4JnCUoZD44rDgscg0SFE?=
 =?us-ascii?q?1HGCCYyAgYDAy8BAQcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:kySK96AF7R+SHBVW/37iw5YqxClBgxIJ4kV8jS/XYbTApDkggjZSn
 WBKWmuAM/bYamD2KNpwa42y/R4CsMDdnN9kOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE8c5kBWY3E5Yk6v94GlhIy
 cMnMywHYUXW7w626OrTpuhEnM8vKozveYgYoHwllGifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY/BPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCOl1QhjOG9YIu9ltqiYuJ+wxu5u
 jP8xEvAIQldL/6U9xi82yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTUk+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQz2FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:lPk0P6PD1fDYdMBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3Avb/bKWpp/oLSmMQvZlWa/rfmUfIeeHT6zVnLH1+?=
 =?us-ascii?q?hBn1QToGqdkSM8qwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ARpLqyw8R/2Z06AqUcj+3kDKQf+BPyPnzKVxcq64?=
 =?us-ascii?q?pguqccjdSMAm/tR3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="530841889"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:34 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id D358E180002C7
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 3F3ECCBEF71; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 20/27] python3-git: fix CVE-2026-78678 CVE-2026-78679
Date: Fri,  6 Nov 2026 06:43:24 -0800
Message-Id: <20261106144331.3354811-21-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249685
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
2.53.0

