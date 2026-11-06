Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7521.1793976220823708730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=V9G8lNSj;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5527; q=dns/txt;
  s=iport01; t=1793976221; x=1795185821;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uFziTky3YxaeS8gD6qeKkBaBI0OnWoTOaXZmVb/QPTU=;
  b=V9G8lNSjDaMgQQuYTsKMzO1b/xPP4/dtA8UtR/9vXgDFkecxhrF1Swhk
   Dr9N7na7FT2t70XB0bN3Bzo5h/yXXX+zP1I9SpYTE7p7wHWR3M7hcpI9H
   Tb0HqfveVxYASaduZETxpo1kTJP44JLDnll8Ue5KJGdruui5XQlmRAJtg
   5rYA8RDojjJzerrYNPvMxPVog5nHpktb+2B1Pm+QRpmveMdodX71PHyt6
   YXAntqXsGvaS7N+P5PoiNVydM3YXp1Vbuz7yYacL8BksW2OhRG7yjtDF4
   52TIbYqYRjT9LJaS50ZbEegEW0MItJj8NONQZ6O/rzj4sUiwP4ohUaQtm
   A==;
X-CSE-ConnectionGUID: QcZ+ZcWzReq1+O+y4WS84Q==
X-CSE-MsgGUID: UkfQLt+tRFuxCJqv0tFbPQ==
X-IPAS-Result: =?us-ascii?q?A0AnAAAN5+1q/43/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJA4xvhziCIQOTIIsBgX4PAQEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDA?=
 =?us-ascii?q?QIvKyMIGYMCAYI6AzcDEbxNgXkzgQGDKQE/AkNQ2EwQb4FoAQsUAYE4AYVBi?=
 =?us-ascii?q?CRdGAFEglaBYycbgUlEgRWBF4JSgQWBXAKIJgSCDYEPEoFagyWJcwKBUYZ5S?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoX?=
 =?us-ascii?q?iGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLG?=
 =?us-ascii?q?gVhCAINDHQ5EDAeJC8FHCY+GwovGA1IESw3FRkEPm4Hkj2CRU0BgQ0BKxc5g?=
 =?us-ascii?q?R0LNA8TGJJ7CpI3oRGEKowklToaM4QEgVeSQpJUC5h9glmLMZZRhGmBaDyBW?=
 =?us-ascii?q?TMaCBsVgyIJShkPjjmDa4UTUWzFHCYyAgkDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:rpyYcK1cxMl41s93L/bD5YRwkn2cJEfYwER7XKvMYLTBsI5bp2FSm
 mYXDGDUP6yOZWHzfohwYYjnpBhX7MDXzdNrGgBo3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsbzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGNUoEfr8TxfRNDHgXt
 ttbOWwyVUDfvrfjqF67YrEEasULNsLnOsYb/3pn1zycVapgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiZC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsjOSxb4SJJ4PiqcN9o0WWn
 0bavHjDLAwKH/6G12KZ3HiUv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Mv0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXJIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:2Nmsuq+RyW8CRBfuY2huk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:1GfpsG1l14SdhYO1PHw5VLxfI8sXMU/W82XqLlbhSkEqWeGqcg/MwfYx
X-Talos-MUID: 9a23:1a6lbgaNgG6xIeBTijzivRV+d9tSzbm+I2IUj80alcO8DHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544476457"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:34 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id DE93F180005CA
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 71805CC8C93; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 27/27] python3-git: fix CVE-2026-100689
Date: Fri,  6 Nov 2026 06:43:31 -0800
Message-Id: <20261106144331.3354811-28-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249690
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
 .../python/python3-git/CVE-2026-100689.patch  | 91 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch
new file mode 100644
index 0000000000..807d97dcfc
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
2.53.0

