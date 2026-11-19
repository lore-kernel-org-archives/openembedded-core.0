Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8008.1795062166792664573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BxMNjM+w;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5301; q=dns/txt;
  s=iport01; t=1795062168; x=1796271768;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fLOTYzdsjXIuNccDaihCKHc9W0B5YR4DBrhSQnZ7CkI=;
  b=BxMNjM+wqp2me3AkkheAXuTTkVXLOXVp4ZRwX40WxmL1TZvCkdbDWHMI
   nNkIRBYVmJnca4WyYy/wXk4K5opcFEb/JB7YZioSKtPv5F1eJqVYD9O6V
   d4tzie1MKpn9DvHyZ9EIl53NfaTzG4U/4tzJwtXLl0szUnSqEggtnXjCD
   oXlIZDMhCTZW6CYmmSNPS1cJFbBHMEDjM7Xa254ukPFMjYQuKlT7ggbcc
   ZXQby0piV8hHQ8Dj48D4psfCirZ+UGg7Up3EX3mWNCRUfP+Ws8QsoRe7M
   ft1TdQPWzAY65sOwroaawYygedl442ugDolAvrACLHeccn8iURLvLHy8/
   A==;
X-CSE-ConnectionGUID: fPjKKbb5TIqd7A6r/VrWRw==
X-CSE-MsgGUID: PQXN47tIRXGTBeGTxehvkA==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/9VK/pBaglmCV3VgQ0kDlCeCIQOeKRSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjiACJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDNwMRuTWBe?=
 =?us-ascii?q?TOBAYMpAT8CQ1DYTBBvgWgBCxQBgTiFQogkXRgBhH0nG4FJRIEVg2qBBYFcA?=
 =?us-ascii?q?oFGhmAEgg2BDxKBVB6MeQKBT4gKSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfH?=
 =?us-ascii?q?hsOAg4YDUgRLDcVGQQ+bgeTUYIlJjsSAR4eUQEQG4FaKigkpVGhEYQrjCSVO?=
 =?us-ascii?q?hozhVulFwuYfY4KlTWBHIRqgWg8gUQOBzMaCBsVgyIJShkPjjmDa4UTUcZaJ?=
 =?us-ascii?q?jICCQMvAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:VNZRcq0bcBS6QMB/UPbD5Zlwkn2cJEfYwER7XKvMYLTBsI5bpzIDn
 2cbWmHVMv+Oa2Ghfd4kOoTgpkoOvMPSxoVlGQRr3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmctYjpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGAnk0Hq4S8LtLIHhCq
 tVGMnczdC+5mLfjqF67YrEEasULJcTxeYdasXZ6wHSAV7AtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NU+ojx5nYj/7DLovgf2hinTXeDxDo1XTrq0yi4TW5FEgieaxb4aJEjCMbf1srmDE+
 X7nxVTWPjsXG+CPxDqb8Vv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTUkOzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:a591P6BycE1tR/zlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:77dkU24d2dtz8n6Uptss+nYWOeMveCDh7W7cfGbmEyFXUoKvVgrF
X-Talos-MUID: 9a23:/Gv0eAs9CJZT5hgfbM2nvAhSEps3/4WUOG8xu5gph9mJNTJzEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59164744"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:47 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 681901800035D
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:47 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 6A17CCBEF7A; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 17/27] python3-git: fix CVE-2026-76218
Date: Wed, 18 Nov 2026 20:22:32 -0800
Message-Id: <20261119042242.1640611-18-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250619
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/d9ddb55bdc66ffe8c9932fe460e6b8c8211e47c7
[2] https://security-tracker.debian.org/tracker/CVE-2026-76218

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Removed the stale cherry-pick and Signed-off-by trailers and
  cleaned the Backport Changes formatting.
---
Changes in v3:
- Restored the required trailing spaces.
---
 .../python/python3-git/CVE-2026-76218.patch   | 92 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch
new file mode 100644
index 0000000000..eda065b34c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch
@@ -0,0 +1,92 @@
+From e9a64de6632678594079cf3e020cbaff44b31615 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 4 Aug 2026 02:48:01 +0000
+Subject: [PATCH] Guard unsafe git init options
+
+<!-- agent -->
+GHSA-9rj7-rf2p-w77r reports that Repo.init forwarded git-init
+options without applying GitPython's unsafe-option policy. A regression
+showed template and abbreviated option spellings reached Git without an
+UnsafeOptionError and could create the destination before validation.
+
+Add a git-init denylist for template installation and separate Git
+directory redirection, check keyword options before any path or directory
+mutation, and provide the standard explicit allow_unsafe_options escape
+hatch. This preserves trusted uses while rejecting untrusted forwarding by
+default.
+
+An audit against Git cf5497b14c5a24f10c13f7e0ee85cb95af13ea6a
+(v2.55.0.windows.3-16-gcf5497b14c) confirmed that init and clone are the
+built-in commands that consume repository template directories. Clone,
+clone_from, and submodule cloning already share the guarded clone helper;
+the similarly named commit option only reads a commit-message template.
+
+Validated with the focused init regression, the clone/init unsafe-option
+suite, 185 config/Git/index/clone tests, Ruff, and basedpyright.
+
+CVE: CVE-2026-76218
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/d9ddb55bdc66ffe8c9932fe460e6b8c8211e47c7]
+
+Backport Changes:
+- Omitted test/test_repo.py because the current PyPI source archive
+  does not include the test suite and the python3-git recipe does
+  not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit d9ddb55bdc66ffe8c9932fe460e6b8c8211e47c7)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 4b783586..fd6d660d 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -141,6 +141,14 @@ class Repo:
+     re_author_committer_start = re.compile(r"^(author|committer)")
+     re_tab_full_line = re.compile(r"^\t(.*)$")
+ 
++    unsafe_git_init_options = [
++        # Can install hooks that execute during later Git commands:
++        "--template",
++        # Redirects the repository metadata to a caller-controlled path:
++        "--separate-git-dir",
++    ]
++    """Options to :manpage:`git-init(1)` that permit unsafe code execution or I/O."""
++
+     unsafe_git_clone_options = [
+         # Executes arbitrary commands:
+         "--upload-pack",
+@@ -1345,6 +1353,7 @@ class Repo:
+         mkdir: bool = True,
+         odbt: Type[GitCmdObjectDB] = GitCmdObjectDB,
+         expand_vars: bool = True,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "Repo":
+         """Initialize a git repository at the given path if specified.
+@@ -1369,6 +1378,10 @@ class Repo:
+             information disclosure, allowing attackers to access the contents of
+             environment variables.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options to be used, such as ``--template`` and
++            ``--separate-git-dir``.
++
+         :param kwargs:
+             Keyword arguments serving as additional options to the
+             :manpage:`git-init(1)` command.
+@@ -1376,6 +1389,11 @@ class Repo:
+         :return:
+             :class:`Repo` (the newly created repo)
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=cls.unsafe_git_init_options,
++            )
+         if path:
+             path = expand_path(path, expand_vars)
+         if mkdir and path and not osp.exists(path):
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index df2eea60bc..173643a49b 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -39,6 +39,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-76221.patch \
            file://CVE-2026-76220.patch \
            file://CVE-2026-76219.patch \
+           file://CVE-2026-76218.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

