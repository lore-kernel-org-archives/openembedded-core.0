Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8016.1795062171745616482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RAnFC4KF;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4156; q=dns/txt;
  s=iport01; t=1795062172; x=1796271772;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9W9OivDcH1XphoO5vnbD1xrlEGMP+tzM9Ipb0bxpmZY=;
  b=RAnFC4KFmQLJP1x7JMNNZ1EqgoAW0tfBcjYEffrnwxJxPM040BdVNKCE
   Dpcr+mVq6CktwwvPjr2U3nIZ07XuQMj40Pti5LoXX7ixur2cdQ6rLGGy0
   O/bP/Os8w8oQwe4XZ2bI2ewg/e/1LTDiOSj3gh00GOSgDhN0x0ymQTYsg
   HsSrd6I2vVbpbHzcGV02cZncEbNhNn2SCkMLZIBuku7WuynxY889UpYzK
   jP19oKLdGE/I7eK2cNPgi19f+3zpWbbVkgl0AhuwadePlfVv8YQxaFjJ/
   RNtxpCw/awbAPXSnJl78czKokerhL8jt5WEWxMDyG0JfrQsmU7f/gYDG7
   A==;
X-CSE-ConnectionGUID: 4x+HDESVRkyGS8pKqzNiPA==
X-CSE-MsgGUID: +oRB+g+fS7C9t21lx3HEVg==
X-IPAS-Result: =?us-ascii?q?A0BIAgAlef5q/9JK/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMyARgBPRwDAQIvKyMIGYMCAYI6AzcDEbk0giyBA?=
 =?us-ascii?q?YMpAT8CQ1DYTBBvgWgBCxQBgTiFQogkXRgBhH0nG4FJRIR/gQWBMioCiCYEg?=
 =?us-ascii?q?xwSgVSNFwKBT4gKSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFg?=
 =?us-ascii?q?RyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAg4YDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeTUYJLOxI9UQErgUMKXyIYkn2QHYIhoRGEK4wkhyeOExozhVulF?=
 =?us-ascii?q?wuYfY4KlWUcUIRqgWg8gVkzGggbFYMiCUoZD445g2uFE1HGWiYyAgkDLwEBB?=
 =?us-ascii?q?wIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:AEsiKqJvIeu31O6VFE+Rm5QlxSXFcZb7ZxGr2PjKsXjdYENShTMCz
 TBMDW+POfiJZjSkKYp1Ydi+pB5UvZ+AmoVlQQAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmckajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0yHAIWEaAjxNx0EE51p
 eQ7MSIrbyiq0rfeLLKTEoGAh+wqIdOuOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A2NHwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237kV0qjOaza4W9ltqiBsJvtAWX5
 Wz9oE+oHktDMMzE6Re7/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVncjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWAHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:v4ytM6v3E2Lae/FoZGFWki3V7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:dLap0m5pPt2Z67VFHdssqF5XOuwISUPnz2b/GB+gKn97brytYArF
X-Talos-MUID: 9a23:RHXo6gU33z9M2xDq/HzrvhshO4Rm2PuFWVxXyJEW4OmpCyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59346637"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:46 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id ECC9B1800010B
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:45 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 348C5CBEFBF; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 10/27] python3-git: fix CVE-2026-73622
Date: Wed, 18 Nov 2026 20:22:25 -0800
Message-Id: <20261119042242.1640611-11-yurade@cisco.com>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250634
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/863417457a0633db7ea5aed4fd01e0b291a41162
[2] https://security-tracker.debian.org/tracker/CVE-2026-73622

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Cleaned whitespace in the Backport Changes note.
---
 .../python/python3-git/CVE-2026-73622.patch   | 60 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch
new file mode 100644
index 0000000000..74396243e2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch
@@ -0,0 +1,60 @@
+From 5043b75a697c0f9110d2014234831dd1bc568a60 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 15:42:44 +0200
+Subject: [PATCH] fix: prevent environment expansion in remote URLs
+
+Remote and submodule creation expanded environment-variable references in
+caller-supplied URLs before storing them in Git configuration. This could
+expose process environment values through a later network request or a tracked
+.gitmodules file.
+
+Preserve variables literally in the remaining untrusted URL callers while
+retaining Git.polish_url() expansion for intentional local-path normalization.
+Add regression tests covering remote configuration and submodule configuration.
+
+Git baseline: git remote add and git submodule add accept URL arguments
+literally; Git does not perform shell-style environment expansion on those
+arguments.
+
+CVE: CVE-2026-73622
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/863417457a0633db7ea5aed4fd01e0b291a41162]
+
+Backport Changes:
+- Omitted test/test_remote.py, test/test_submodule.py because the current
+  PyPI source archive does not include the test suite and the python3-git
+  recipe does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 863417457a0633db7ea5aed4fd01e0b291a41162)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 2 +-
+ git/remote.py                 | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index fa60bcda..43e0ec9a 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -601,7 +601,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+         # END verify url
+ 
+         ## See #525 for ensuring git URLs in config-files are valid under Windows.
+-        url = Git.polish_url(url)
++        url = Git.polish_url(url, expand_vars=False)
+ 
+         # It's important to add the URL to the parent config, to let `git submodule` know.
+         # Otherwise there is a '-' character in front of the submodule listing:
+diff --git a/git/remote.py b/git/remote.py
+index cafa1f84..dd892fdc 100644
+--- a/git/remote.py
++++ b/git/remote.py
+@@ -805,7 +805,7 @@ class Remote(LazyMixin, IterableObj):
+         """
+         scmd = "add"
+         kwargs["insert_kwargs_after"] = scmd
+-        url = Git.polish_url(url)
++        url = Git.polish_url(url, expand_vars=False)
+         if not allow_unsafe_protocols:
+             Git.check_unsafe_protocols(url)
+         repo.git.remote(scmd, "--", name, url, **kwargs)
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 847bdfeab2..6456031620 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -31,6 +31,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73625.patch \
            file://CVE-2026-73623.patch \
            file://CVE-2026-73624.patch \
+           file://CVE-2026-73622.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

