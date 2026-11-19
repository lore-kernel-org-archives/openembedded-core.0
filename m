Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8014.1795062171378080670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OCtJGAhL;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11258; q=dns/txt;
  s=iport01; t=1795062171; x=1796271771;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hMs2hh1w+kBKY5CMoAJvKM3g0ULBkRRPXAot8lmIgAw=;
  b=OCtJGAhL4UHbTMmaaz6Ucg2LHemC7UTfCje4zdhIkPVg08zHHJylgbAq
   dNwvbOwhp/PepOV/M/O9zX9ciizKTmIxGqa6YFGnkPQ1Byx935UZqY1VC
   IbOkUDGurFQ2gE0NBKolaGvInE9vP/5ykwUJa58GDdUffoCmuKCqabFmN
   Boc7hls6MOVBkSvdarSIv/azwd+PEtsZB2Exuuut1+Rol6d3Hm2AwnzKa
   QTpvB4eJyste1AHjBPbhy3+1zmrt8yvG2AihD91f0XP8qCQOqaFj35t0O
   cyigBZE88dJaOk7lDJeGwW3k7eDhX6ZHBMDLkJNAgpdcVmz6bTnhD16hk
   Q==;
X-CSE-ConnectionGUID: 34ogi8ohS+KrvWHTYQiBGQ==
X-CSE-MsgGUID: W3Kq1GVtRQamLfrNo55mog==
X-IPAS-Result: =?us-ascii?q?A0AaAADWd/5q/89K/pBaHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJA4xvhziCIQOaJIQFFIFqDwEBAQ9EDQQBAYQ/RgKOIAImN?=
 =?us-ascii?q?AkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnC?=
 =?us-ascii?q?wEYAT0cAwECLysjCBmDAgGCOgM3AxG5NYF5M4EBgykBPwJDUNhMEG+BaAELF?=
 =?us-ascii?q?AGBOAGFQYgkXRgBRIJWgWMnG4FJRIEVg2qBBYFcAoEnH4ZgBIMcEoFUfYU/h?=
 =?us-ascii?q?lsCgU+ICkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BE?=
 =?us-ascii?q?oEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8C?=
 =?us-ascii?q?SY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIOGA1IESw3FRkEP?=
 =?us-ascii?q?m4Hk1GCS009GxwHEwEHJBc/gScHKCQWFJALglwBApAcgiGhEYQrjCSVOhozh?=
 =?us-ascii?q?ASBV5JDklQLmH2KNINWlTU0GFCEaoFoPIFZMxoIGxWDIglKGQ+OOYNrhFBDU?=
 =?us-ascii?q?cZaJjICCQMvAQEHAgcOAwuBaJAAAiYHgU8BAQ?=
IronPort-Data: A9a23:P/Jt9a2015l+fu63ZvbD5Zlwkn2cJEfYwER7XKvMYLTBsI5bp2ABy
 GYbXT+BMvzcNDHxLdFxb9+18kwCusDRz98xHQo+3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmctYjpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGVx0xMoxI/eZMQkJU6
 8M4FAE0bzqsvrfjqF67YrEEasULJcTxeYdasXZ6wHSBU7AtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEuojx5nYj/7DLovgf2hinTXeDxDo1XTrq0yi4TW5FEgieaxb4aIEjCMbfoOvV/Bi
 VzaxV3wBzUULvqYlGeA9X3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTVlOzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ12FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:ScShMa4Uajcu8ppnogPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:YW0ZhG9pak2tTNBNNPqVvxVIHc8kInrd9zTzOVGHKVpYcby/ZmbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AY7R/IA2qWj7hEbyCVHLy23pnQTUj3P+NERkir4k?=
 =?us-ascii?q?8gsCBESJqHTDA0TGwTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59164745"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:47 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id 72B05180004AA
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:47 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 798E0CC4D0E; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 19/27] python3-git: fix CVE-2026-76222
Date: Wed, 18 Nov 2026 20:22:34 -0800
Message-Id: <20261119042242.1640611-20-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250631
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
Changes in v3:
- Restored the required trailing spaces.
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
index 0000000000..5d54f38595
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
index 0000000000..7f89e9037e
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
2.35.6

