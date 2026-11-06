Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7342.1793976215095842948
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Actr8wPE;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11195; q=dns/txt;
  s=iport01; t=1793976215; x=1795185815;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xquEIogVOmpitSVMw61cq17I3vGK7K6Triis/UnlKVo=;
  b=Actr8wPE5ebC6SwqS0+Bz3utd0xjybSCft0zqLd+PrjRI5aI6XLq7Dji
   bC387JrXSVTfKpb3YzujSRTOf0L5XUdZGj1zdZMGXW4UoLFNAod4mYX6/
   HLBX0ucm4Lo1Jw0IhnrpTsyA0JzxqVwIDPS+RF3/8rbI18KbwFAJ1NtRd
   kPrfM6UPOhRQxdFwPQ7drwEm43lWwjNVrTVIVNL/fVte4HhJrkvWcvnGJ
   BIi3BvbqLtewjMcOeVHk0WsS+uVKju8zP7SSDR9a6XaByuq53dKV64MOE
   vsexUQXNG2Fu+/9AGgk49W56UNcbR8NfCV3/Gc69FTprGyT0VSmWJg0v3
   w==;
X-CSE-ConnectionGUID: 76UDMZvaS4mUd98msl5ejQ==
X-CSE-MsgGUID: P3JQkNFeRday6dP+NRu+KQ==
X-IPAS-Result: =?us-ascii?q?A0AaAACS5u1q/4//Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJA4xvhziCIQOaHIQFFIFqDwEBAQ9EDQQBAYQ/RgKOHQImN?=
 =?us-ascii?q?AkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnC?=
 =?us-ascii?q?wEYAT0cAwECLysjCBmDAgGCOgM3AxG8RYF5M4EBgykBPwJDUNhMEG+BaAELF?=
 =?us-ascii?q?AGBOAGFQYgkXRgBRIJWgWMnG4FJRIEVg2mBBYFcAoEnH4ZgBIMcEoFafoVCh?=
 =?us-ascii?q?lgCgVGGeUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BE?=
 =?us-ascii?q?oEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8C?=
 =?us-ascii?q?SY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmPhsKLxgNSBEsNxUZBD5uB5I9gkVNP?=
 =?us-ascii?q?RscBxMBByQXP4EnLyQWFJALglwBApAdgiGhEYQqjCSVOhozhASBV5JCklQLm?=
 =?us-ascii?q?H2KNINWlTU0GFCEaYFoPIFZMxoIGxWDIglKGQ+OOYNrhFBDUcYIJjICCQMvA?=
 =?us-ascii?q?QEHAgcOAwuBaJAAAiYHgU8BAQ?=
IronPort-Data: A9a23:6rTxHqsVMiQ7F3uQTAoZvhfZVufnVAFfMUV32f8akzHdYApBsoF/q
 tZmKWnUM6zeMDCmLYt0O9njoB4Hu8DSz9FiTlFv+XxmRSxBgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwpbhKLUR86
 /UjdDUwYkHTgvmynb+5c7w57igjBJGD0II3oHpsy3TdSP0hW52GG/uM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtMYH49tL/Aan3XYiBCoV6YjaE2+GPUigd21dABNfKIIYLbHJ0IxRjwS
 mTuxz/bOxI8GtGlxTOUrH6Uxcn1gGDYYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:hv0ve6CVwFLBgS3lHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:CDeq6GGy16eWoZC9qmI4qnM4P/I7e0aByUrcch+9EmI0Rb+sHAo=
X-Talos-MUID: 9a23:YwqxhQkomHmbjOJF85gOdnpab+VR4IKABXoBmIRYt/HHExZteBSk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="536910536"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:34 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id CED85180004B8
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 38595CBEF6F; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 19/27] python3-git: fix CVE-2026-76222
Date: Fri,  6 Nov 2026 06:43:23 -0800
Message-Id: <20261106144331.3354811-20-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249683
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [4],
[5] and [6] using the commit shown in [1], regression fix
in [2] and follow-up fix in [3].

[1] https://github.com/gitpython-developers/GitPython/commit/e4b8e7d026ca6abb4cf604f8e77093432ce23c06
[2] https://github.com/gitpython-developers/GitPython/commit/b324c831cbc02c82b99c18113b622d03539d23cd
[3] https://github.com/gitpython-developers/GitPython/commit/4299c990e1ca21896f9485277caf7bb0ae5b404c
[4] https://security-tracker.debian.org/tracker/CVE-2026-76222
[5] https://github.com/gitpython-developers/GitPython/pull/2202
[6] https://github.com/gitpython-developers/GitPython/pull/2205

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Added upstream pull-request references. Removed stale cherry-pick/sign-off
  trailers from the embedded p1 and p2 patches and cleaned patch formatting.
---
 .../CVE-2026-76222-regression.patch           |  39 ++++++
 .../python3-git/CVE-2026-76222_p1.patch       | 118 ++++++++++++++++++
 .../python3-git/CVE-2026-76222_p2.patch       |  45 +++++++
 .../python/python3-git_3.1.43.bb              |   3 +
 4 files changed, 205 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch
new file mode 100644
index 0000000000..5d416c03a8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch
@@ -0,0 +1,39 @@
+From b324c831cbc02c82b99c18113b622d03539d23cd Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 4 Aug 2026 11:07:02 +0200
+Subject: [PATCH] Initialize submodule repository before handled failures
+
+<!-- agent -->
+Direct recursive updates with keep_going could swallow an invalid-name
+validation error and then access mrepo before assignment. Reproduce that
+path and initialize mrepo before validation so recursion is safely skipped.
+
+Git baseline: submodule.c at 883a47ef6496c96a5d6132ed8c87fcd44ebf8d1a
+validates submodule paths before operating on them.
+
+CVE: CVE-2026-76222
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/b324c831cbc02c82b99c18113b622d03539d23cd]
+
+Backport Changes:
+- Omitted .basedpyright/baseline.json and test/test_submodule.py because the
+  current PyPI source archive does not include these development files, and the
+  python3-git recipe does not run the test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit b324c831cbc02c82b99c18113b622d03539d23cd)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index 658259cd..9b1eb0e0 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -743,4 +743,2 @@
+-        # To keep things plausible in dry-run mode.
+-        if dry_run:
+-            mrepo = None
++        mrepo = None
+         # END init mrepo
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch
new file mode 100644
index 0000000000..6c75489610
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch
@@ -0,0 +1,118 @@
+From 3f48614f5b02f67daf311a6681e6e5090a7f7dc3 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sat, 1 Aug 2026 04:47:40 +0200
+Subject: [PATCH] Validate submodule names before filesystem operations
+
+<!-- agent -->
+Submodule names read from .gitmodules can influence the separate Git directory
+path. Reject empty names, absolute or drive-qualified names, and parent
+components with either path separator.
+
+Validate before constructing module paths and before opening or mutating
+existing checkouts, so a repository initialized by an older vulnerable version
+cannot bypass the guard. Validate programmatic add and rename inputs before
+making changes as well.
+
+Advisory: GHSA-hmq2-w58f-27jc
+
+CVE: CVE-2026-76222
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/e4b8e7d026ca6abb4cf604f8e77093432ce23c06]
+
+Backport Changes:
+- Omitted test/test_submodule.py because the current PyPI source archive
+  does not include the test suite, and the python3-git recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit e4b8e7d026ca6abb4cf604f8e77093432ce23c06)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index 43e0ec9a..a4e0077c 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -6,6 +6,7 @@ __all__ = ["Submodule", "UpdateProgress"]
+ import gc
+ from io import BytesIO
+ import logging
++import ntpath
+ import os
+ import os.path as osp
+ import stat
+@@ -300,10 +301,21 @@ class Submodule(IndexObject, TraversableIterableObj):
+         parser.set_submodule(self)
+         return SectionConstraint(parser, sm_section(self.name))
+
++    @classmethod
++    def _validated_name(cls, name: str) -> str:
++        if (
++            not name
++            or name.startswith(("/", "\\"))
++            or ntpath.splitdrive(name)[0]
++            or ".." in name.replace("\\", "/").split("/")
++        ):
++            raise ValueError("Invalid submodule name %r" % name)
++        return name
++
+     @classmethod
+     def _module_abspath(cls, parent_repo: "Repo", path: PathLike, name: str) -> PathLike:
+         if cls._need_gitfile_submodules(parent_repo.git):
+-            return osp.join(parent_repo.git_dir, "modules", name)
++            return osp.join(parent_repo.git_dir, "modules", cls._validated_name(name))
+         if parent_repo.working_tree_dir:
+             return osp.join(parent_repo.working_tree_dir, path)
+         raise NotADirectoryError()
+@@ -516,6 +528,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise InvalidGitRepositoryError("Cannot add submodules to bare repositories")
+         # END handle bare repos
+
++        cls._validated_name(name)
+         path = cls._to_relative_path(repo, path)
+
+         # Ensure we never put backslashes into the URL, as might happen on Windows.
+@@ -733,6 +746,8 @@ class Submodule(IndexObject, TraversableIterableObj):
+         # END init mrepo
+
+         try:
++            self._validated_name(self.name)
++
+             # ENSURE REPO IS PRESENT AND UP-TO-DATE
+             #######################################
+             try:
+@@ -999,6 +1014,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise ValueError("You must specify to move at least the module or the configuration of the submodule")
+         # END handle input
+
++        self._validated_name(self.name)
+         module_checkout_path = self._to_relative_path(self.repo, module_path)
+
+         # VERIFY DESTINATION
+@@ -1139,6 +1155,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise ValueError("Need to specify to delete at least the module, or the configuration")
+         # END handle parameters
+
++        self._validated_name(self.name)
+         # Recursively remove children of this submodule.
+         nc = 0
+         for csm in self.children():
+@@ -1365,6 +1382,9 @@ class Submodule(IndexObject, TraversableIterableObj):
+         if self.name == new_name:
+             return self
+
++        self._validated_name(self.name)
++        self._validated_name(new_name)
++
+         # .git/config
+         with self.repo.config_writer() as pw:
+             # As we ourselves didn't write anything about submodules into the parent
+@@ -1412,6 +1432,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             If a repository was not available.
+             This could also mean that it was not yet initialized.
+         """
++        self._validated_name(self.name)
+         module_checkout_abspath = self.abspath
+         try:
+             repo = git.Repo(module_checkout_abspath)
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch
new file mode 100644
index 0000000000..1f21369acd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch
@@ -0,0 +1,45 @@
+From 4a0dfd9b336dd9332b347c3af8e8ec536017d863 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 4 Aug 2026 10:08:41 +0200
+Subject: [PATCH] Validate submodule names on every module path branch
+
+<!-- agent -->
+_module_abspath only validated names when Git used separate gitfile
+submodule directories, so legacy Git behavior could accept the same invalid
+name. Validate before selecting the Git-version-dependent path branch and
+cover the legacy branch explicitly.
+
+Git baseline: submodule.c at 883a47ef6496c96a5d6132ed8c87fcd44ebf8d1a
+validates submodule paths before filesystem operations.
+
+CVE: CVE-2026-76222
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/4299c990e1ca21896f9485277caf7bb0ae5b404c]
+
+Backport Changes:
+- Omitted test/test_submodule.py because the current PyPI source
+  archive does not include the test suite and the python3-git
+  recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 4299c990e1ca21896f9485277caf7bb0ae5b404c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index a4e0077c..d25df367 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -314,8 +314,9 @@ class Submodule(IndexObject, TraversableIterableObj):
+
+     @classmethod
+     def _module_abspath(cls, parent_repo: "Repo", path: PathLike, name: str) -> PathLike:
++        name = cls._validated_name(name)
+         if cls._need_gitfile_submodules(parent_repo.git):
+-            return osp.join(parent_repo.git_dir, "modules", cls._validated_name(name))
++            return osp.join(parent_repo.git_dir, "modules", name)
+         if parent_repo.working_tree_dir:
+             return osp.join(parent_repo.working_tree_dir, path)
+         raise NotADirectoryError()
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 4e5eec73f1..ef1c687c02 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -41,6 +41,9 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-76219.patch \
            file://CVE-2026-76218.patch \
            file://CVE-2026-76217.patch \
+           file://CVE-2026-76222_p1.patch \
+           file://CVE-2026-76222-regression.patch \
+           file://CVE-2026-76222_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

