Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881B1CCF2C5
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:18 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15275.1792129268839428503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=O2QRzpZ+;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4297; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nNkvEbyzDfDierYBn/jgGe1qC3XcEH43v5enD+yamEQ=;
  b=O2QRzpZ+VEfW94WE36lMQ44ABb9DWfeqZDbrMlAZN6qFe4xp+uwUseL9
   9wj7FLvi4Ghczd53ZEXlhpZyTDscxfFEFp+AbD0VASdg1lKcthr+sydHY
   bW03R2FqvLvaemjCVlmXIIfqA6GmKzX8ODdeDlZToQztxLwIfxus2n+nz
   EVoYQJYo7IXRU/0+oS6tD14lEcqKzTTmAPxTLctVg4VSLu7pS8Zv829ly
   bo14+AFx6KTePxZIakvNHkFyXVeS81nJlC+HQIwwgJz/CQjcSZ1h00R4T
   /IwhSy3NcY/foqVey7/nL4QqmnBUv3ETnDylB4yCVweFxJXE1nfjYzIlX
   Q==;
X-CSE-ConnectionGUID: /1Op3I45QJSuyuYSzdeMcg==
X-CSE-MsgGUID: c0ro5oE1TS2a05CVLvH0hw==
X-IPAS-Result: =?us-ascii?q?A0BIAgCGuNFq/5X/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx4gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBXAEBg?=
 =?us-ascii?q?SeGfgSCDYEPEoFagQOEC5A5SIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDE?=
 =?us-ascii?q?kcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSF?=
 =?us-ascii?q?B6BciZGBz1RARAbBIEBgTalZqEPhCiMIpU6GjOFW6UUC5h9jgqVZhxNhGmBa?=
 =?us-ascii?q?DyBRwsHMxoIGxU7gmcJShkPji4LC4NggX+DZWzICicyAgkyAQEHAgcOAwuBa?=
 =?us-ascii?q?JAAAiYHgU8BAQ?=
IronPort-Data: A9a23:p/L3qKySCyjin/5PCGJ6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkUOy
 msdXW3XMvfYZmP2f94lbIS3oBsH68PUzdYyQVdo+VhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJAZvGpVD27oqOEN16
 O0FGQsfYh2mjO3jldpXSsE07igiBNPgMIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cMnWjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeOzb4KEJIHWLSlTtk3Av
 GWb+EmgPipAPYTC4gSh7FL0hvCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRulzfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:jncVR6zS6K7Dm9pkVIQMKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:xDQjDmP64BA6OO5DH3BA7BU1Rp0cUEbA3WrhGF20BENiR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AOb4iDw7HqwG4JhfI1QrW1vLaxoxju76pVUcgyKk?=
 =?us-ascii?q?94cDcaAdOHym91DSoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536709654"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id F13D7180001D3
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:07 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 638E3CBEF6C; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 11/27] python3-git: fix CVE-2026-73621
Date: Thu, 15 Oct 2026 22:40:50 -0700
Message-Id: <20261016054106.210444-12-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247942

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/38553b6fddc7f6a667cdb45a6762343a08fc72b2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73621

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73621.patch   | 72 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch
new file mode 100644
index 0000000000..bb1050645e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch
@@ -0,0 +1,72 @@
+From 3186ded297a9818f887c3de47fc2f0aba6a8b298 Mon Sep 17 00:00:00 2001
+From: Sebastian Thiel <sebastian.thiel@icloud.com>
+Date: Sat, 25 Jul 2026 06:27:01 +0200
+Subject: [PATCH] fix: reject unsafe output options in Commit.count
+
+<!-- agent -->
+
+Commit.count forwards keyword arguments to git rev-list but did not apply the
+unsafe-option validation used by the sibling revision APIs.
+
+Validate forwarded options with the existing Git.check_unsafe_options helper
+and retain the explicit allow_unsafe_options escape hatch. This covers
+GHSA-p538-c434-8v24 without adding another option parser.
+
+Git baseline: git.git a23bace963 defines --output as a shared diff option
+consumed by setup_revisions; t/t6000-rev-list-misc.sh exercises that option
+with rev-list.
+
+CVE: CVE-2026-73621
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/38553b6fddc7f6a667cdb45a6762343a08fc72b2]
+
+Backport Changes:
+- Omitted test/test_commit.py because the current PyPI source 
+  archive does not include the test suite and the python3-git 
+  recipe does not run it.
+
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 38553b6fddc7f6a667cdb45a6762343a08fc72b2)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/commit.py | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/git/objects/commit.py b/git/objects/commit.py
+index cc85e7dd..549e12c7 100644
+--- a/git/objects/commit.py
++++ b/git/objects/commit.py
+@@ -269,13 +269,21 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
+         else:
+             return self.message.split(b"\n", 1)[0]
+ 
+-    def count(self, paths: Union[PathLike, Sequence[PathLike]] = "", **kwargs: Any) -> int:
++    def count(
++        self,
++        paths: Union[PathLike, Sequence[PathLike]] = "",
++        allow_unsafe_options: bool = False,
++        **kwargs: Any,
++    ) -> int:
+         """Count the number of commits reachable from this commit.
+ 
+         :param paths:
+             An optional path or a list of paths restricting the return value to commits
+             actually containing the paths.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options, like ``--output``.
++
+         :param kwargs:
+             Additional options to be passed to :manpage:`git-rev-list(1)`. They must not
+             alter the output style of the command, or parsing will yield incorrect
+@@ -284,6 +292,11 @@ class Commit(base.Object, TraversableIterableObj, Diffable, Serializable):
+         :return:
+             An int defining the number of reachable commits
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs), unsafe_options=self.unsafe_git_rev_options
++            )
++
+         # Yes, it makes a difference whether empty paths are given or not in our case as
+         # the empty paths version will ignore merge commits for some reason.
+         if paths:
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 6456031620..f712a0e699 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -32,6 +32,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73623.patch \
            file://CVE-2026-73624.patch \
            file://CVE-2026-73622.patch \
+           file://CVE-2026-73621.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


