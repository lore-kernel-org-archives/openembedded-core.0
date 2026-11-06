Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7336.1793976213937852288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hVLfrMx0;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5238; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zzx8ShXTbwGH7JNImzyN0xvuAYO48Ht0jZ0Kx7GjuL4=;
  b=hVLfrMx0Sv3p3/bdGg0+KSH7qMNwQpYuTKQLmefPKaTdFM9IwfZ9W7XV
   LpbwCnhYv7Err03aEt1zhFe/mgnzMOER5vn6QbQ5Yczrn+wBNhUCVci5N
   usEQUvLHdVTIaAbvornNvbbCsWc6/ZbhtbR7zOl1j6BOei7ByroElih+U
   BpaAWKQ8JSxFEIdmsSzrtJV6g398ygxFZm3z0t6BLM2iKFW44uOSgTX/P
   95Tn4yhWEAzAKOPSIHucT/VT2zSSDp7txwSiOXe1tmJ7WDkT8kofR5VZB
   FGWA1c9DEL6Pl3qYEHHfWzoZ5o5U0V9C200LD8aTk1mRPRpEnre9lullz
   A==;
X-CSE-ConnectionGUID: 5bf6AD2eTkKZcK355+uAzw==
X-CSE-MsgGUID: T3xsEiw0SFmwABNRz0pFAw==
X-IPAS-Result: =?us-ascii?q?A0BJAgAQ5u1q/5X/Ja1aHgEBCxIMggULgld1YENJA5Qng?=
 =?us-ascii?q?iEDniEUgWoPAQEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6A?=
 =?us-ascii?q?zcDEbw/gXkzgQGDKQE/AkNQ2EwQb4FoAQsUAYE4hUKIJF0YAYR9JxuBSUSBF?=
 =?us-ascii?q?YNpgQWBXAKBRoZgBIINgQ8SgVoejHoCgVGGeUiBHgNZLAFVEw0KCwcFgWgDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmP?=
 =?us-ascii?q?hsKLxgNSBEsNxUZBD5uB5I9gh8mOxIBHh5RARAbgVpSJKVSoRGEKowklToaM?=
 =?us-ascii?q?4VbpRYLmH2OCpU1gRyEaYFoPIFEDgczGggbFYMiCUoZD445g2uFE1HGCCYyA?=
 =?us-ascii?q?gkDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:iA90FKCqygf9KBVW/37iw5YqxClBgxIJ4kV8jS/XYbTApGwghGdWm
 zdLXDyEPqmLZmbzL9p/bNuypE4D65/Tz942OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEnv9gUmgaZ4Ak+cVFCkIVq
 KFbNRkfcUXW7w626OrTpuhEnM8vKozveYgYoHwllGufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY+BPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCOkFEqgOaxaoC9ltqieZ5FhWuZu
 Tr90WHmKzs8Ds7H0RSs7Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTUkOzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:cY1456uBmzP6Q7U6cEFCULu77skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:IR+fgmPjdn+exe5DBSNpqmc4QM0ZcV7vx1SLfhL7FE97V+jA
X-Talos-MUID: 9a23:cJPUxAo7f47SCVr/Ag4ezw05JNxF4rv2M24IjrwsnfOWbTReEijI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545386422"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id C958618000337
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 2AAC7CBF202; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 17/27] python3-git: fix CVE-2026-76218
Date: Fri,  6 Nov 2026 06:43:21 -0800
Message-Id: <20261106144331.3354811-18-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249678
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
 .../python/python3-git/CVE-2026-76218.patch   | 92 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch
new file mode 100644
index 0000000000..1a2bf8ca8e
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
2.53.0

