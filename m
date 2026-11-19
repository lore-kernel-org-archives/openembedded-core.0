Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8015.1795062171529858539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UqZsG38x;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5590; q=dns/txt;
  s=iport01; t=1795062171; x=1796271771;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iNvNUwV7Y1s/lGWe3SgkH7UkMILzhFpa6j3jfk/9pW8=;
  b=UqZsG38xa47XFsmZLyLCxW8Yp0ZL0eZIRr946l7hIkJ3X3x8aE2f7Lkq
   AmIjqZ/J/ArXonV6WoRTXMBW0sqJvt76mCy00kHbYq6PZG1JDmVVKZwIn
   REp2qZnfVh+Vr9jhm8MNEpoTDxXrjE8gKHr+EKcIrdFhM0KxDGA+fA9gG
   EWn5n/ge1IcsodMCnHtqbRmi+uqta7RcReOZMGvsWBmJ6gcZufgZ1Ar+Q
   ijjF/BTalhNcVLoDJ0ALwx3OVFAJzs0IH9ww+iS6RBtxUpeNa4Ko+pE8f
   h3z099PG5rJw+ion4BpOUh0BOU1MRC4XrW80VRCi4Pldc4khybK5y10sU
   g==;
X-CSE-ConnectionGUID: v0Zwb9NZTuu5MHKw3xEA/w==
X-CSE-MsgGUID: Y1yKXbzSTj2wW+UTdTMtjw==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/9FK/pBaHgEBCxIMggULgld1YENJA5Qng?=
 =?us-ascii?q?iEDkySLBYF+DwEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCO?=
 =?us-ascii?q?gM3AxG5NYF5M4EBgykBPwJDUNhMEG+BaAELFAGBOIVCiCRdGAFEglaBYycbg?=
 =?us-ascii?q?UlEgRWBF4JTgQWBXAKIJgSCDYEPEoFUgyKJdQKBT4gKSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJ?=
 =?us-ascii?q?C8FGiY+GwqBDCcfHhsOAg4YDUgRLDcVGQQ+bgeTUYJLTQGBDQErFzmBHQsMK?=
 =?us-ascii?q?A8TGJJ7CpI2oRGEK4wklToaM4QEgVeSQ5JUC5h9glmLMZZRhGqBaDyBWTMaC?=
 =?us-ascii?q?BsVgyIJShkPjjmDa4UTUWzFbiYyAgkDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:+6VtaqssKJ6fMmsQOM3+BWs6jOfnVBxfMUV32f8akzHdYApBsoF/q
 tZmKTjSOKrZY2v1fIp0YIi39RtS65DUytdmSQI6pH9hEyoagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvva+Es01BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw5L5FHmsf0
 84kNS1QSzCgmLmm7Zv8Vbw57igjBJGD0II3s3x6iDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgZ/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGISMK4HaH5sI9qqej
 lOf7kfJCAMhCN7F1gXGz06gusrTnzyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:uHUqRa/ucmzM0aUjPgpuk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:5uCB62CrQljS10D6Ezc/xlEeS+YXTmDAkVLwAFDjGUtAD6LAHA==
X-Talos-MUID: 9a23:ZSBzCwqSzBU+jAvIz4YezwA7JeRY6baVNEJXjqpFhvWICQlsOSjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="61958265"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:47 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id 85B6F18000592
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:47 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id B8160CC8CA0; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 27/27] python3-git: fix CVE-2026-100689
Date: Wed, 18 Nov 2026 20:22:42 -0800
Message-Id: <20261119042242.1640611-28-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250632
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/1ed0ebc2f2e74d979cdc367a4864a7731fdcc093
[2] https://security-tracker.debian.org/tracker/CVE-2026-100689

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Rewrote Backport Changes to explain that the GitPython 3.1.43
  adaptation normalizes root and candidate paths and enforces containment
  with commonpath.
---
Changes in v3:
- Restored the required trailing spaces.
---
 .../python/python3-git/CVE-2026-100689.patch  | 91 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch
new file mode 100644
index 0000000000..d55589ade7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch
@@ -0,0 +1,91 @@
+From 1ed0ebc2f2e74d979cdc367a4864a7731fdcc093 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 1 Sep 2026 11:33:19 +0200
+Subject: [PATCH] Reject submodule checkout paths outside the repository
+
+GHSA-59cr-6r3x-644w identifies that submodule update paths could reach
+filesystem operations without the containment check already used by add and
+move.
+
+Add a regression that proves update rejects a parent-directory checkout
+path before cloning, and override Submodule.abspath to apply the shared
+_to_relative_path guard for every filesystem consumer.
+
+Git baseline: git.git read-cache.c verify_path_internal() rejects invalid index
+paths, covered for parent traversal by t/t9300-fast-import.sh.
+
+CVE: CVE-2026-100689
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/1ed0ebc2f2e74d979cdc367a4864a7731fdcc093]
+
+Backport Changes:
+- Adapted _to_relative_path for 3.1.43: normalize root and candidate paths
+  and enforce containment with commonpath, replacing the old prefix check
+  that allowed relative .. traversal. This extra validation is not in the
+  upstream hunk, which adds the Submodule.abspath override.
+- Omitted doc/source/changes.rst because it only records the release note.
+- Omitted test/test_submodule.py because the PyPI source archive does not
+  include the test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 1ed0ebc2f2e74d979cdc367a4864a7731fdcc093)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 46 +++++++++++++++++++++++++++++------------
+ 1 file changed, 33 insertions(+), 13 deletions(-)
+
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -400,19 +400,39 @@
+             path = path[:-1]
+         # END handle trailing slash
+ 
+-        if osp.isabs(path) and parent_repo.working_tree_dir:
+-            working_tree_linux = to_native_path_linux(parent_repo.working_tree_dir)
+-            if not path.startswith(working_tree_linux):
+-                raise ValueError(
+-                    "Submodule checkout path '%s' needs to be within the parents repository at '%s'"
+-                    % (working_tree_linux, path)
+-                )
+-            path = path[len(working_tree_linux.rstrip("/")) + 1 :]
+-            if not path:
+-                raise ValueError("Absolute submodule path '%s' didn't yield a valid relative path" % path)
+-            # END verify converted relative path makes sense
+-        # END convert to a relative path
+-
++        root = parent_repo.working_tree_dir
++        if root:
++            drive, tail = osp.splitdrive(path)
++            separators = (os.sep,) if os.altsep is None else (os.sep, os.altsep)
++            if drive and not tail.startswith(separators):
++                raise ValueError("Drive-relative path %r is not supported" % path)
++
++            root_abs = osp.abspath(to_native_path_linux(root))
++            path_abs = osp.abspath(osp.join(root_abs, path))
++            try:
++                common_path = osp.commonpath([root_abs, path_abs])
++            except ValueError as e:
++                raise ValueError("Submodule checkout path %r is not in repository at %r" % (path, root_abs)) from e
++            if osp.normcase(common_path) != osp.normcase(root_abs):
++                raise ValueError("Submodule checkout path %r is not in repository at %r" % (path, root_abs))
++
++            path = to_native_path_linux(osp.relpath(path_abs, root_abs))
++
++        if not path or path == ".":
++            raise ValueError("Submodule checkout path must not be the repository root")
++
++        return path
++
++    @property
++    def abspath(self) -> PathLike:
++        root = self.repo.working_tree_dir
++        if root is None:
++            return super().abspath
++        path = root
++        for component in self._to_relative_path(self.repo, self.path).split("/"):
++            path = join_path_native(path, component)
++            if osp.islink(path):
++                raise ValueError("Submodule checkout path %r contains a symbolic link" % self.path)
+         return path
+ 
+     @classmethod
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 1c77341132..170fe989d9 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -52,6 +52,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-87818.patch \
            file://CVE-2026-87819_p1.patch \
            file://CVE-2026-87819_p2.patch \
+           file://CVE-2026-100689.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

