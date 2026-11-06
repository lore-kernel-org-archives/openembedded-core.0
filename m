Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7340.1793976214807337239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gomBAxDh;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8441; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GCZHPRgxOw8bl5g2501jEX2Z508XfoDcsblqlQ2j6OI=;
  b=gomBAxDhs//Lcu30WeVdsgLTptxg2HdJMw9NRC/VJbF9wSDadjEqJyqI
   y9VBJs7chSI82QnmbeEM2YdyKY0C6g37fDQW3PBoECdCVRP0yJvFfTc6z
   pSaAn9NF3oedISGzaUaEMmrdQOlv4W5yVh92WCuETYjIZwMsD77OpnZuP
   HH2iFXXzYmpz48px8cNcWkgIFPVxdOvS91erONe40CpLc+DfUhza8KfZB
   vbP1mJNzNkfssSW84p9ti+0PkrpN6nUHr+kkc9OcmROnQI21d5AhlupTp
   IotLtGv5jwuPrrNU4SAVmYpy+VGWO574BcqjPo1fQ9iqPOui3YnmtjT03
   w==;
X-CSE-ConnectionGUID: EHijw0A1Q66BSZbm4qN80Q==
X-CSE-MsgGUID: cg65ra24QSe05j6KGO7Fnw==
X-IPAS-Result: =?us-ascii?q?A0BJAgCS5u1q/4//Ja1aglmCV3VgQ0kDlCeCIQOeIRSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDNwMRRrt/g?=
 =?us-ascii?q?XkzgQGDKQE/AkNQ2EwQb4FoAQsUAYE4hUKIJF0YAYR9JxuBSUSBFYNpgQWBX?=
 =?us-ascii?q?AKBJx8Bhl8Egg2BDxKBWoEDgiKJcwKBUYZ5SIEeA1ksAVUTDQoLBwWBaAM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+G?=
 =?us-ascii?q?wovGA1IESw3FRkEPm4Hkj2CHyY7CwcBPB8fEwEQG4F4BQENIQUKAgIRkxGSQ?=
 =?us-ascii?q?aERhCqMJJU6GjOFW6UWC5h9jgqWBE2EaYFoPIFDDwczGggbFTuCZwlKGQ9ej?=
 =?us-ascii?q?VuDa4UTUcYIJjICBgMDLwEBBwIHDgMLgWiQAAImB4FPAQE?=
IronPort-Data: A9a23:UNLGPKzza9BvY4kbdPB6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkUEn
 2EaDT2Da/+ONGH1ft8kaojn9htVuMCGxtBqSlZvpVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGwWPI8Hos8uOD8Q3
 8cqIjVRdzbT39vjldpXSsE07igiBNPgMIVavjRryivUSK54B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOHWjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeSxYIWOJ4XTLSlTtk2X+
 D/c9j6lOyoXbIGdlxmq1S2CgPCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:k1mi3a5R1i6BEdiDpwPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:9gGCaGODBhV2MO5DdQlm9lFMM5kcLCP390XaJhOhLzYxcejA
X-Talos-MUID: =?us-ascii?q?9a23=3A1BFVLw1fCixscnhmplJ/fcPRzDUj6KvwVVoEy8k?=
 =?us-ascii?q?/gMTcaC4uGBi60xqxXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544873511"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id CE2E318000385
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 31A6FCBF204; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 18/27] python3-git: fix CVE-2026-76217
Date: Fri,  6 Nov 2026 06:43:22 -0800
Message-Id: <20261106144331.3354811-19-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249677
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/f2550b65bf60ca087190981e2c7b6865e201f40c
[2] https://security-tracker.debian.org/tracker/CVE-2026-76217

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Removed the stale cherry-pick and Signed-off-by trailers and
  refreshed the embedded hunk context.
---
 .../python/python3-git/CVE-2026-76217.patch   | 179 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch
new file mode 100644
index 0000000000..f369c778b0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch
@@ -0,0 +1,179 @@
+From c99cba55c8ad6eff105ee61b15f7c683e7e4d878 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 4 Aug 2026 03:18:54 +0000
+Subject: [PATCH] Guard pathspec file inputs in high-level commands
+
+<!-- agent -->
+GHSA-hh9p-6wh2-4mfc reports that high-level rm and checkout wrappers
+forwarded pathspec file options without GitPython's unsafe-option policy.
+A regression showed that both commands surfaced multi-line pathspec data in
+Git errors, while reset consumed the same caller-selected file without a
+validation error. The audit also found that reset's positional commit could
+carry the option before its argument separator.
+
+Define one shared unsafe pathspec-file option list and apply it to
+IndexFile.remove, Head.checkout, and HEAD.reset before invoking Git. Check
+reset's positional commit as well as keyword options, retain the standard
+allow_unsafe_options escape hatch for trusted callers, and cover abbreviated
+long-option spellings.
+
+An audit against Git cf5497b14c5a24f10c13f7e0ee85cb95af13ea6a
+(v2.55.0.windows.3-16-gcf5497b14c) found pathspec-file support in add,
+checkout/restore, commit, reset, rm, and stash. GitPython has no arbitrary
+high-level option forwarding to the other commands, and git mv does not
+support this option.
+
+Validated with focused rejection and opt-in tests, 214 affected-module
+regressions, Ruff, basedpyright, and git diff --check.
+
+CVE: CVE-2026-76217
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/f2550b65bf60ca087190981e2c7b6865e201f40c]
+
+Backport Changes:
+- Omitted test/test_git.py, test/test_index.py, test/test_refs.py because the
+  current PyPI source archive does not include the test suite and the
+  python3-git recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit f2550b65bf60ca087190981e2c7b6865e201f40c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py        |  6 ++++++
+ git/index/base.py | 10 ++++++++++
+ git/refs/head.py  | 27 ++++++++++++++++++++++++++-
+ 3 files changed, 42 insertions(+), 1 deletion(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 63bbb3f7..20abd015 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -421,6 +421,12 @@ class Git(metaclass=_GitMeta):
+ 
+     re_unsafe_protocol = re.compile(r"(.+)::.+")
+ 
++    unsafe_git_pathspec_from_file_options = [
++        # Reads pathspecs from a caller-controlled file. Some commands include an
++        # unmatched pathspec in their error output, which can disclose the file.
++        "--pathspec-from-file",
++    ]
++
+     def __getstate__(self) -> Dict[str, Any]:
+         return slots_to_dict(self, exclude=self._excluded_)
+ 
+
+diff --git a/git/index/base.py b/git/index/base.py
+index fb1acb1a..f5932f2d 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -1011,6 +1011,7 @@ IndexFile.remove
+         self,
+         items: Sequence[Union[PathLike, Blob, BaseIndexEntry, "Submodule"]],
+         working_tree: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> List[str]:
+         R"""Remove the given items from the index and optionally from the working tree
+@@ -1041,6 +1042,10 @@ IndexFile.remove documentation
+             physically removing the respective file. This may fail if there are
+             uncommitted changes in it.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options such as ``--pathspec-from-file`` to be passed to
++            :manpage:`git-rm(1)`.
++
+         :param kwargs:
+             Additional keyword arguments to be passed to :manpage:`git-rm(1)`, such as
+             ``r`` to allow recursive removal.
+@@ -1052,6 +1057,11 @@ IndexFile.remove unsafe-option validation
+             This is interesting to know in case you have provided a directory or globs.
+             Paths are relative to the repository.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=Git.unsafe_git_pathspec_from_file_options,
++            )
+         args = []
+         if not working_tree:
+             args.append("--cached")
+
+diff --git a/git/refs/head.py b/git/refs/head.py
+index 7e6fc337..1b82fbd3 100644
+--- a/git/refs/head.py
++++ b/git/refs/head.py
+@@ -19,6 +19,7 @@ HEAD.reset import
+ 
+ from typing import Any, Sequence, TYPE_CHECKING, Union
+ 
++from git.cmd import Git
+ from git.types import Commit_ish, PathLike
+ 
+ if TYPE_CHECKING:
+@@ -66,6 +67,7 @@ HEAD.reset signature
+         index: bool = True,
+         working_tree: bool = False,
+         paths: Union[PathLike, Sequence[PathLike], None] = None,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "HEAD":
+         """Reset our HEAD to the given commit optionally synchronizing the index and
+@@ -88,12 +90,21 @@ HEAD.reset option validation and documentation
+             Single path or list of paths relative to the git root directory
+             that are to be reset. This allows to partially reset individual files.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options such as ``--pathspec-from-file`` to be passed to
++            :manpage:`git-reset(1)`.
++
+         :param kwargs:
+             Additional arguments passed to :manpage:`git-reset(1)`.
+ 
+         :return:
+             self
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([commit], kwargs),
++                unsafe_options=Git.unsafe_git_pathspec_from_file_options,
++            )
+         mode: Union[str, None]
+         mode = "--soft"
+         if index:
+@@ -238,7 +249,12 @@ Head.checkout signature
+         self.path = "%s/%s" % (self._common_path_default, new_path)
+         return self
+ 
+-    def checkout(self, force: bool = False, **kwargs: Any) -> Union["HEAD", "Head"]:
++    def checkout(
++        self,
++        force: bool = False,
++        allow_unsafe_options: bool = False,
++        **kwargs: Any,
++    ) -> Union["HEAD", "Head"]:
+         """Check out this head by setting the HEAD to this reference, by updating the
+         index to reflect the tree we point to and by updating the working tree to
+         reflect the latest index.
+@@ -250,6 +266,10 @@ Head.checkout documentation
+             If ``False``, :exc:`~git.exc.GitCommandError` will be raised in that
+             situation.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options such as ``--pathspec-from-file`` to be passed to
++            :manpage:`git-checkout(1)`.
++
+         :param kwargs:
+             Additional keyword arguments to be passed to git checkout, e.g.
+             ``b="new_branch"`` to create a new branch at the given spot.
+@@ -265,6 +285,11 @@ Head.checkout unsafe-option validation
+             the HEAD detached which is allowed and possible, but remains a special state
+             that some tools might not be able to handle.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=Git.unsafe_git_pathspec_from_file_options,
++            )
+         kwargs["f"] = force
+         if kwargs["f"] is False:
+             kwargs.pop("f")
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 173643a49b..4e5eec73f1 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -40,6 +40,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-76220.patch \
            file://CVE-2026-76219.patch \
            file://CVE-2026-76218.patch \
+           file://CVE-2026-76217.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

