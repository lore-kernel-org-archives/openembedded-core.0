Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8252.1795062169724906525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PioOl+/R;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=19416; q=dns/txt;
  s=iport01; t=1795062170; x=1796271770;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NptudWFT5+nUZ5sh8Ws56lhLyFtWuEUkBjN1BaqBSNc=;
  b=PioOl+/RGcynLuZUbikzkY2NES/8Sfkp4usox/OY8ZPd9QWtO1NKXaGy
   SfboZDcfl13jDmvKc9OUtyW1NPiU2X+wEjDK2iKvtRTWkEP8v/kLTyFga
   3Dr+fPOKzbKRM8rE+JQfCkwNKQPajY8IUnt2Tl/jsyC2OwMlqnsJqmh0O
   lpXqz33fh8lmsa0AVkcmVOej6lehJzDGeDUGsrWYaAumTputJMStLs4Yk
   4QM8/R2t7grEQdgqe6L1Wd47C7Li8UgQ0GvuwNDnGL8Ldu9ZXhuzHjP/K
   BvUGUsfMhOXkXU9WE1cHRzVxnBCSokJJ0Ch/uOjhu48sx9H7hc8uOmCem
   g==;
X-CSE-ConnectionGUID: 1pXvbdhMToKbDek1NbdMPg==
X-CSE-MsgGUID: l4zSBuNsQ2SidnpVPIEJNw==
X-IPAS-Result: =?us-ascii?q?A0BPAgDWd/5q/9JK/pBaglmCV3VgQ0kDhFSPU4IhA5FQg?=
 =?us-ascii?q?VSLBRSBag8BAQEPRA0EAQGEP0YCjiACJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDIwQLARgBPRwDAQIDAhEVAgIrHQEFC?=
 =?us-ascii?q?BkegmQBgjoDNwMRuTV6fzOBAYMpAT8CQ1DYTBBvgWgBCxQBgQouhUKDIAGFA?=
 =?us-ascii?q?10YAYR9JxuBSUSBFYE7gi+BBYFcAoEZLQRVgx2CagSDHBKBVIECjBUCgU+IC?=
 =?us-ascii?q?kiBAhwDWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BK?=
 =?us-ascii?q?yheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZ?=
 =?us-ascii?q?wsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CDhgNSBEsNxUZBD0BbgeTU?=
 =?us-ascii?q?YJLOwsHATwbNgErF3oHAwUtGBMFCwMIGQUMEQKTEQECB5I2oRGEK4wkhyeOE?=
 =?us-ascii?q?xozhASBV5JDklQLmH2OCpU1MAQLEE2EaoFoPEZ9DwczGggbFTuCZwlKGQ+OK?=
 =?us-ascii?q?wIMC4NghRNRxlomMgIJAy8BAQcCBw4DC4FokAEBJgeBTwEB?=
IronPort-Data: A9a23:zYtToqIvrlerMwhsFE+Rm5QlxSXFcZb7ZxGr2PjKsXjdYENS0WQHy
 2YeXTuBOqrYMWv8edp3bIvnoUMDu5SDmoQyGlQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmckajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN03FHEoN4EY39pwImti+
 P9BDjoBSyiM0rfeLLKTEoGAh+wqIdOuOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A2NHwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237klUgjei3boS9ltqiQZlHpWyFg
 Hn/pV/4DhcCCuS+5Bij7Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVncjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWYHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:UoYqXq5qLjUMd6gGCQPXwOrXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3A1U33omnlsBce3CAraE2UbB8XqlLXOSTF/GnaL0+?=
 =?us-ascii?q?dNWFKQpGYSga28q9Bq8U7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ay4zMiA0JBdiOOGjEnZHEY4VLpjUj5/i8M2oQt44?=
 =?us-ascii?q?/4fKFOSpoBQ+8oRaRXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="61958266"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:48 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 8A1D4180001F6
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:47 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id A0077CC8C95; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 24/27] python3-git: fix CVE-2026-87817
Date: Wed, 18 Nov 2026 20:22:39 -0800
Message-Id: <20261119042242.1640611-25-yurade@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250629
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/c7cf4d13b1ed0a2e70f2a1f3c6b4fc6c2652cf0b
[2] https://security-tracker.debian.org/tracker/CVE-2026-87817

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker and
  corrected the embedded From hash to the cited upstream commit. Added the
  missing re import. Updated alternates lookup to use self.odb.root_path();
  moved Cygwin and relative-path handling in find_submodule_git_dir() and
  return a path only when is_git_dir() validates it. Expanded Backport
  Changes to describe the GitPython 3.1.43 adaptations and omitted
  documentation/tests.
---
 .../python/python3-git/CVE-2026-87817.patch   | 443 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 444 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch
new file mode 100644
index 0000000000..fc604ca44f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch
@@ -0,0 +1,443 @@
+From c7cf4d13b1ed0a2e70f2a1f3c6b4fc6c2652cf0b Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 25 Aug 2026 04:57:29 +0200
+Subject: [PATCH] fix: prefer `.git` during repository discovery
+
+<!-- agent -->
+GitPython considered worktree administration and bare-repository signatures
+before a worktree's real .git entry. Align discovery with Git so .git files
+and directories win, malformed .git files stop discovery, and candidate git
+directories validate HEAD plus commondir-backed object and ref storage. This
+addresses GHSA-239g-whfq-7xj9.
+
+Regression coverage compares ambiguous layouts with git rev-parse and rejects
+invalid HEAD/.git metadata.
+
+Git baseline: 15c6308cf7ad276b306aa5b3ababfbdebfb1a917; setup.c
+setup_git_directory_gently_1(), is_git_directory(), and validate_headref().
+
+Repository validation can use GIT_COMMON_DIR for refs and objects. Preserve the
+same value on Repo so later config, ref, and object access uses the directory
+that made discovery succeed.
+
+Capture GIT_COMMON_DIR before the first repository config read so bare-state
+detection uses the same metadata location as discovery. Resolve relative
+environment values immediately so later working-directory changes cannot
+retarget the Repo.
+
+Review feedback: relative GIT_COMMON_DIR left Git subprocesses resolving GIT_DIR
+and GIT_COMMON_DIR from a different working directory; malformed commondir data,
+empty GIT_OBJECT_DIRECTORY, and the linked-worktree signature were also handled
+inconsistently.
+
+Pin the repository environment to resolved paths, reject invalid
+metadata without consulting the process working directory, and
+restore HEAD-based linked-worktree detection. Keep the loose HEAD
+and dangling .git behavior because both match Git setup.c at baseline
+15c6308cf7ad276b306aa5b3ababfbdebfb1a917.
+
+Review feedback identified that chained or self-referential .git pointers
+recurse, filesystem-encoded metadata can fail text decoding, and a relative
+GIT_DIR is not retained for later Git commands.
+
+Parse one regular, size-bounded Gitfile exactly once, decode Gitfile and
+commondir paths with the filesystem codec, and retain the resolved GIT_DIR
+for subprocesses. This rejects cycles like Git instead of recursing and keeps
+commands stable after working-directory changes.
+
+Review feedback noted that a dangling commondir symlink was treated as absent,
+allowing local objects and refs to validate the repository.
+
+Distinguish a truly missing commondir from a dangling symlink. This follows
+Git's get_common_dir_noenv(), whose file_exists check uses lstat before
+attempting to read the entry.
+
+Python 3.9 on Windows raised UnicodeDecodeError while the repository-discovery
+regression test parsed invalid commondir bytes, causing the Python package test
+(windows, 3.9) check to fail.
+
+Treat UnicodeError like an unreadable metadata file in both commondir and
+gitfile parsing. Invalid bytes now make discovery reject the candidate
+repository, matching Git's behavior.
+
+Review feedback noted that GIT_OBJECT_DIRECTORY made discovery succeed without
+becoming the Repo ODB root, while a relative value could later be resolved from
+the Git wrapper's different working directory.
+
+Resolve the environment value against the construction directory, use it as the
+ODB root, and preserve the absolute value for later Git commands. The regression
+moves the only object store outside the git directory and verifies access
+through both GitDB and git cat-file after the original environment and current
+directory are restored.
+
+Review feedback identified four setup mismatches: non-missing .git stat failures
+could fall through to another repository, explicit GIT_DIR could be redirected
+through a nested .git entry, Gitfile reads were not bounded to the stat-reported
+size, and alternates ignored GIT_OBJECT_DIRECTORY.
+
+Match Git setup.c by bypassing discovery for an environment-selected GIT_DIR,
+stopping discovery when Gitfile stat fails for reasons other than a missing
+path, and reading exactly the previously observed Gitfile size. Resolve
+alternates below the active ODB root so custom object stores remain internally
+consistent.
+
+The commit review noted that treating every present GIT_DIR as explicit broke
+two documented cases: an empty GIT_DIR must fall back to current-directory
+discovery, while an empty Repo path must still use a nonempty GIT_DIR.
+
+CVE: CVE-2026-87817
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/c7cf4d13b1ed0a2e70f2a1f3c6b4fc6c2652cf0b]
+
+Backport Changes:
+- Omitted doc/source/changes.rst because its upstream hunk is a
+  release-note entry; the file is present in the recipe PyPI archive.
+- Adapted the repository-discovery and environment-handling changes to
+  GitPython 3.1.43’s Repo.__init__ implementation. This includes its
+  linked-worktree and .git discovery flow, resolving and preserving
+  GIT_DIR/GIT_COMMON_DIR, and using GIT_OBJECT_DIRECTORY as the object
+  database root. These version-specific changes account for the difference
+  in git/repo/base.py from upstream; the alternates accessor changes are
+  part of that adaptation.
+- Added the standard-library re import in git/repo/fun.py because the
+  upstream re.match() call relies on an import from an earlier commit that
+  is absent from GitPython 3.1.43.
+- Omitted test/test_repo.py because the current PyPI source archive
+  does not include the test suite and the python3-git recipe does
+  not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit c7cf4d13b1ed0a2e70f2a1f3c6b4fc6c2652cf0b)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py |  91 +++++++++++++++++++++++++++++++--------------
+ git/repo/fun.py  | 111 +++++++++++++++++++++++++++++++++++++-----------------
+ 2 files changed, 135 insertions(+), 67 deletions(-)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index e3b10459..a5532ae5 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -45,7 +45,6 @@ Repo imports
+ 
+ from .fun import (
+     find_submodule_git_dir,
+-    find_worktree_git_dir,
+     is_git_dir,
+     rev_parse,
+     touch,
+@@ -231,6 +230,10 @@ Repo.__init__ reftable note
+     ) -> None:
+         R"""Create a new :class:`Repo` instance.
+ 
++        .. note::
++            Repositories using reftable may be opened, but GitPython's direct reference
++            access does not support reftable.
++
+         :param path:
+             The path to either the root git directory or the bare git repo::
+ 
+@@ -265,7 +268,11 @@ Repo.__init__ environment paths
+             :class:`Repo`
+         """
+ 
+-        epath = path or os.getenv("GIT_DIR")
++        git_dir_env = os.getenv("GIT_DIR")
++        object_dir_env = os.getenv("GIT_OBJECT_DIRECTORY")
++        if object_dir_env is not None:
++            object_dir_env = osp.abspath(object_dir_env)
++        epath = path or git_dir_env
+         if not epath:
+             epath = os.getcwd()
+         if Git.is_cygwin():
+@@ -289,15 +296,47 @@ Repo.__init__ repository discovery
+                 raise NoSuchPathError(epath)
+ 
+         # Walk up the path to find the `.git` dir.
+-        curpath = epath
+-        git_dir = None
++        curpath = os.fspath(epath) if epath is not None else ""
++        git_dir: Optional[str] = None
++        explicit_git_dir = not path and bool(git_dir_env)
+         while curpath:
+             # ABOUT osp.NORMPATH
+             # It's important to normalize the paths, as submodules will otherwise
+             # initialize their repo instances with paths that depend on path-portions
+             # that will not exist after being removed. It's just cleaner.
++            if not explicit_git_dir:
++                dotgit = osp.join(curpath, ".git")
++                try:
++                    sm_gitpath = find_submodule_git_dir(dotgit)
++                except OSError:
++                    break
++                if sm_gitpath is not None:
++                    # Worktrees can use relative paths as of Git 2.48, so join to curpath.
++                    git_dir = osp.normpath(osp.join(curpath, os.fspath(sm_gitpath)))
++                    self._working_tree_dir = curpath
++                    break
++
++                # Like Git, do not fall back to a bare repository or parent directory when
++                # a non-directory .git entry exists but is not a valid gitfile.
++                if osp.exists(dotgit) and not osp.isdir(dotgit):
++                    break
+             if is_git_dir(curpath):
+                 git_dir = curpath
++                if osp.isfile(osp.join(curpath, "gitdir")) and osp.isfile(osp.join(curpath, "commondir")):
++                    if "GIT_WORK_TREE" in os.environ:
++                        self._working_tree_dir = os.getenv("GIT_WORK_TREE")
++                    else:
++                        # Linked worktree administrative directories store the path to
++                        # the worktree's .git file in gitdir (without a "gitdir: " prefix).
++                        with open(osp.join(git_dir, "gitdir")) as fp:
++                            worktree_gitfile = fp.read().strip()
++
++                        if not osp.isabs(worktree_gitfile):
++                            worktree_gitfile = osp.normpath(osp.join(git_dir, worktree_gitfile))
++
++                        self._working_tree_dir = osp.dirname(worktree_gitfile)
++                    break
++
+                 # from man git-config : core.worktree
+                 # Set the path to the root of the working tree. If GIT_COMMON_DIR
+                 # environment variable is set, core.worktree is ignored and not used for
+@@ -317,21 +356,7 @@ Repo.__init__ directory search
+                     self._working_tree_dir = os.getenv("GIT_WORK_TREE")
+                 break
+ 
+-            dotgit = osp.join(curpath, ".git")
+-            sm_gitpath = find_submodule_git_dir(dotgit)
+-            if sm_gitpath is not None:
+-                git_dir = osp.normpath(sm_gitpath)
+-
+-            sm_gitpath = find_submodule_git_dir(dotgit)
+-            if sm_gitpath is None:
+-                sm_gitpath = find_worktree_git_dir(dotgit)
+-
+-            if sm_gitpath is not None:
+-                git_dir = expand_path(sm_gitpath, expand_vars)
+-                self._working_tree_dir = curpath
+-                break
+-
+-            if not search_parent_directories:
++            if explicit_git_dir or not search_parent_directories:
+                 break
+             curpath, tail = osp.split(curpath)
+             if not tail:
+@@ -342,6 +367,16 @@ Repo.__init__ common directory
+             raise InvalidGitRepositoryError(epath)
+         self.git_dir = git_dir
+ 
++        common_dir_env = os.getenv("GIT_COMMON_DIR")
++        if common_dir_env is not None:
++            self._common_dir = osp.abspath(common_dir_env)
++        else:
++            try:
++                common_dir = os.fsdecode((Path(self.git_dir) / "commondir").read_bytes()).rstrip("\r\n")
++                self._common_dir = osp.join(self.git_dir, common_dir)
++            except OSError:
++                self._common_dir = ""
++
+         self._bare = False
+         try:
+             self._bare = self.config_reader("repository").getboolean("core", "bare")
+@@ -349,12 +384,6 @@ Repo.__init__ bare-state detection
+             # Let's not assume the option exists, although it should.
+             pass
+ 
+-        try:
+-            common_dir = (Path(self.git_dir) / "commondir").read_text().splitlines()[0].strip()
+-            self._common_dir = osp.join(self.git_dir, common_dir)
+-        except OSError:
+-            self._common_dir = ""
+-
+         # Adjust the working directory in case we are actually bare - we didn't know
+         # that in the first place.
+         if self._bare:
+@@ -363,9 +392,15 @@ Repo.__init__ Git environment and object database
+ 
+         self.working_dir: PathLike = self._working_tree_dir or self.common_dir
+         self.git = self.GitCommandWrapperType(self.working_dir)
++        if common_dir_env is not None:
++            self.git.update_environment(GIT_DIR=os.fspath(self.git_dir), GIT_COMMON_DIR=os.fspath(self.common_dir))
++        elif git_dir_env is not None:
++            self.git.update_environment(GIT_DIR=os.fspath(self.git_dir))
++        if object_dir_env is not None:
++            self.git.update_environment(GIT_OBJECT_DIRECTORY=object_dir_env)
+ 
+         # Special handling, in special times.
+-        rootpath = osp.join(self.common_dir, "objects")
++        rootpath = object_dir_env if object_dir_env is not None else osp.join(self.common_dir, "objects")
+         if issubclass(odbt, GitCmdObjectDB):
+             self.odb = odbt(rootpath, self.git)
+         else:
+@@ -952,7 +987,7 @@ Repo._get_alternates
+             List of strings being pathnames of alternates
+         """
+         if self.git_dir:
+-            alternates_path = osp.join(self.git_dir, "objects", "info", "alternates")
++            alternates_path = osp.join(self.odb.root_path(), "info", "alternates")
+ 
+         if osp.exists(alternates_path):
+             with open(alternates_path, "rb") as f:
+@@ -973,7 +1008,7 @@ Repo._set_alternates
+             The method does not check for the existence of the paths in `alts`, as the
+             caller is responsible.
+         """
+-        alternates_path = osp.join(self.common_dir, "objects", "info", "alternates")
++        alternates_path = osp.join(self.odb.root_path(), "info", "alternates")
+         if not alts:
+             if osp.isfile(alternates_path):
+                 os.remove(alternates_path)
+
+diff --git a/git/repo/fun.py b/git/repo/fun.py
+index e44d9c64..30c30ebb 100644
+--- a/git/repo/fun.py
++++ b/git/repo/fun.py
+@@ -20,5 +20,6 @@ standard-library imports
+ import os
+ import os.path as osp
++import re
+ from pathlib import Path
+ import stat
+ from string import digits
+@@ -57,22 +58,61 @@ is_git_dir repository validation
+ def is_git_dir(d: PathLike) -> bool:
+     """This is taken from the git setup.c:is_git_directory function.
+ 
++    .. note::
++        This function recognizes repositories using reftable through their
++        compatibility files, but GitPython's direct reference access does not support
++        reftable.
++
+     :raise git.exc.WorkTreeRepositoryUnsupported:
+         If it sees a worktree directory. It's quite hacky to do that here, but at least
+         clearly indicates that we don't support it. There is the unlikely danger to
+         throw if we see directories which just look like a worktree dir, but are none.
+     """
+     if osp.isdir(d):
+-        if (osp.isdir(osp.join(d, "objects")) or "GIT_OBJECT_DIRECTORY" in os.environ) and osp.isdir(
+-            osp.join(d, "refs")
+-        ):
+-            headref = osp.join(d, "HEAD")
+-            return osp.isfile(headref) or (osp.islink(headref) and os.readlink(headref).startswith("refs"))
+-        elif (
+-            osp.isfile(osp.join(d, "gitdir"))
+-            and osp.isfile(osp.join(d, "commondir"))
+-            and osp.isfile(osp.join(d, "gitfile"))
+-        ):
++        headref = osp.join(d, "HEAD")
++        if osp.islink(headref):
++            try:
++                valid_head = os.readlink(headref).startswith("refs/")
++            except OSError:
++                valid_head = False
++        else:
++            try:
++                with open(headref, "rb") as fp:
++                    head = fp.read(256)
++            except OSError:
++                valid_head = False
++            else:
++                valid_head = (head.startswith(b"ref:") and head[4:].lstrip().startswith(b"refs/")) or bool(
++                    re.match(rb"(?:[0-9A-Fa-f]{64}|[0-9A-Fa-f]{40})", head)
++                )
++
++        common_dir = os.getenv("GIT_COMMON_DIR")
++        if common_dir == "":
++            return False
++        if common_dir is None:
++            common_dir_file = Path(d) / "commondir"
++            try:
++                common_dir = os.fsdecode(common_dir_file.read_bytes()).rstrip("\r\n")
++            except FileNotFoundError:
++                if osp.lexists(common_dir_file):
++                    return False
++                common_dir = os.fspath(d)
++            except (OSError, UnicodeError):
++                return False
++            else:
++                if not common_dir:
++                    return False
++                try:
++                    common_dir = osp.realpath(osp.join(d, common_dir))
++                except (OSError, ValueError):
++                    return False
++
++        object_dir = os.getenv("GIT_OBJECT_DIRECTORY")
++        if object_dir is None:
++            object_dir = osp.join(common_dir, "objects")
++        if valid_head and osp.isdir(object_dir) and osp.isdir(osp.join(common_dir, "refs")):
++            return True
++        if osp.isfile(osp.join(d, "gitdir")) and osp.isfile(osp.join(d, "commondir")) and osp.isfile(headref):
+             raise WorkTreeRepositoryUnsupported(d)
+     return False
+ 
+@@ -81,19 +121,20 @@ find_worktree_git_dir bounded Gitfile parsing
+     """Search for a gitdir for this worktree."""
+     try:
+         statbuf = os.stat(dotgit)
+-    except OSError:
++    except (FileNotFoundError, NotADirectoryError):
+         return None
+-    if not stat.S_ISREG(statbuf.st_mode):
++    if not stat.S_ISREG(statbuf.st_mode) or statbuf.st_size > (1 << 20):
+         return None
+ 
+     try:
+-        lines = Path(dotgit).read_text().splitlines()
+-        for key, value in [line.strip().split(": ") for line in lines]:
+-            if key == "gitdir":
+-                return value
+-    except ValueError:
+-        pass
+-    return None
++        with open(dotgit, "rb") as fp:
++            content_bytes = fp.read(statbuf.st_size)
++        if len(content_bytes) != statbuf.st_size:
++            return None
++        content = os.fsdecode(content_bytes).rstrip("\r\n")
++    except (OSError, UnicodeError):
++        return None
++    return content[8:] if len(content) >= 9 and content.startswith("gitdir: ") else None
+ 
+ 
+ def find_submodule_git_dir(d: PathLike) -> Optional[PathLike]:
+@@ -101,26 +142,18 @@ find_submodule_git_dir validated Gitfile resolution
+     if is_git_dir(d):
+         return d
+ 
+-    try:
+-        with open(d) as fp:
+-            content = fp.read().rstrip()
+-    except IOError:
+-        # It's probably not a file.
+-        pass
+-    else:
+-        if content.startswith("gitdir: "):
+-            path = content[8:]
+-
+-            if Git.is_cygwin():
+-                # Cygwin creates submodules prefixed with `/cygdrive/...` suffixes.
+-                # Cygwin git understands Cygwin paths much better than Windows ones.
+-                # Also the Cygwin tests are assuming Cygwin paths.
+-                path = cygpath(path)
+-            if not osp.isabs(path):
+-                path = osp.normpath(osp.join(osp.dirname(d), path))
+-            return find_submodule_git_dir(path)
+-    # END handle exception
+-    return None
++    path = find_worktree_git_dir(d)
++    if path is None:
++        return None
++
++    if Git.is_cygwin():
++        # Cygwin creates submodules prefixed with `/cygdrive/...`.
++        # Cygwin git understands Cygwin paths much better than Windows ones.
++        # Also the Cygwin tests are assuming Cygwin paths.
++        path = cygpath(path)
++    if not osp.isabs(path):
++        path = osp.normpath(osp.join(osp.dirname(d), path))
++    return path if is_git_dir(path) else None
+ 
+ 
+ def short_to_long(odb: "GitCmdObjectDB", hexsha: str) -> Optional[bytes]:
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 0dd42e1f04..558846a950 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -48,6 +48,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-78677.patch \
            file://CVE-2026-78676.patch \
            file://CVE-2026-78675.patch \
+           file://CVE-2026-87817.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

