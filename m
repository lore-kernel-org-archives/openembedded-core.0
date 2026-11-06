Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7336.1793976213937852288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QRXmpLHI;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3702; q=dns/txt;
  s=iport01; t=1793976215; x=1795185815;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gDp/I7DfWN8ZokS8D1eY8PlIfXX+L266MQxpAYOoCdI=;
  b=QRXmpLHI8oh/q2nbHZ1qNlEA11w027cyFVuyL6MCSRkECFLusLNUjAXz
   nrcTP/XFqT/sbjhPfwPdkxYmtxfVeh5X95HU4VrX8IJrHBX24C7UJm6b/
   HJmYoBR+wRumHkAn7dhCFUPXjtRqe/vQz3Iq/3teZKxbOYN7JSwzV02in
   8N0jcQViCSAkCYvQXCLGKjN886ntfsfcKoQGaa5/U8GoNdasmBinDrClq
   b/QMFVzK8VNMv9c7mXS2mYL6JBLjWRrJOjDFeIa+tBfVcF1PfE++OIKrm
   wEeR50TkEs+EsF1z0siVoyn+w49CdizEITKrZ94FFmX76r7X1T1ANTweQ
   w==;
X-CSE-ConnectionGUID: Id67lbqnQh2B51FQEjlFdw==
X-CSE-MsgGUID: ii3f/uL0RyuE4lWi1pwESw==
X-IPAS-Result: =?us-ascii?q?A0BJAgAQ5u1q/5L/Ja1aglmCV3VgQ0kDlCeCIQOeIYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG8P4F5M?=
 =?us-ascii?q?4EBgykBPwJDUNhMEG+BaAELFAGBOIVCiCRdGAGEfScbgUlEgRWDaYEFgVwCi?=
 =?us-ascii?q?CYEgxwSgVqNGAKBUYZ5SIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovGA1IESw3FRkEP?=
 =?us-ascii?q?m4Hkj2CHyY7EQE9UQErggMpTpJXklGhEYQqjCSVOhozhASBV5JCklQLmH2OC?=
 =?us-ascii?q?pZRhGmBaDyBRA4HMxoIGxWDIglKGQ+OOYNrhRNRxggmMgIJAy8BAQcCBw4DC?=
 =?us-ascii?q?4FokX4BAQ?=
IronPort-Data: A9a23:ijhrL6i7Yqa6HHdgBFLTL7qCX161NxEKZh0ujC45NGQN5FlHY01je
 htvC2jTPqzZMWD8eN90OYy+phgA75TTx4c3HQtvqy5hFyNjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvre8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU59rgoBWtX8
 8UYchpQNz66quCy7r6kH7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeJJ4faG5kPwi50o
 ErH/j/3RQw+bOaO1BfZ9k2t3/fQsBjkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:L0O6U6HlPHRPQ/H3pLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AkTlJdWpEy6/CD7kpcpItFBLmUeEpLCLZxm7WGk/?=
 =?us-ascii?q?iIzswZoS4S1u+9Lwxxg=3D=3D?=
X-Talos-MUID: 9a23:d+ZqhQVrsOkpjSrq/D7t3z8lKeMw2bWzJRwJrpRfo9apDjMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545386424"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:34 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id DB04A1800023E
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 62F5BCC8C85; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 25/27] python3-git: fix CVE-2026-87818
Date: Fri,  6 Nov 2026 06:43:29 -0800
Message-Id: <20261106144331.3354811-26-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249684
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/09f2cf383a992d1af697364569e9f384748c1bd8
[2] https://security-tracker.debian.org/tracker/CVE-2026-87818

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Added the omitted doc/source/changes.rst release-note change to
  Backport Changes.
---
 .../python/python3-git/CVE-2026-87818.patch   | 55 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch
new file mode 100644
index 0000000000..0e78580651
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch
@@ -0,0 +1,55 @@
+From 6b83f54db287f190ae29c89b36ba6aba01f7c8d6 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 17 Aug 2026 06:15:12 +0200
+Subject: [PATCH] fix: require opt-in for no-index diffs
+
+<!-- agent -->
+Treat --no-index as an unsafe diff option because it changes path operands
+from repository pathspecs to arbitrary filesystem paths. This addresses
+GHSA-whh4-5q6c-9v3x without exposing advisory reproduction details.
+
+CVE: CVE-2026-87818
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/09f2cf383a992d1af697364569e9f384748c1bd8]
+
+Backport Changes:
+- Omitted test/test_diff.py because the current PyPI source archive
+  does not include the test suite and the python3-git recipe does
+- Omitted doc/source/changes.rst file changes.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 09f2cf383a992d1af697364569e9f384748c1bd8)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/diff.py      | 4 ++--
+ git/repo/base.py | 2 ++
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/git/diff.py b/git/diff.py
+index 032dfb25..08bd4410 100644
+--- a/git/diff.py
++++ b/git/diff.py
+@@ -216,8 +216,8 @@ class Diffable:
+             to be read and diffed.
+
+         :param allow_unsafe_options:
+-            If ``True``, allow options such as ``--output`` and ``-O`` that can write to
+-            or read from arbitrary filesystem paths.
++            If ``True``, allow options such as ``--output``, ``--no-index``, and ``-O``
++            that can write to or read from arbitrary filesystem paths.
+
+         :param kwargs:
+             Additional arguments passed to :manpage:`git-diff(1)`, such as ``R=True`` to
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 7543e3cc..f2dca3c7 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -203,6 +203,8 @@ class Repo:
+     ]
+
+     unsafe_git_diff_options = unsafe_git_revision_options + [
++        # Treats path operands as arbitrary filesystem paths.
++        "--no-index",
+         # Reads caller-controlled order patterns from an arbitrary file.
+         "-O",
+         "--orderfile",
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 558846a950..efd17b45c4 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -49,6 +49,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-78676.patch \
            file://CVE-2026-78675.patch \
            file://CVE-2026-87817.patch \
+           file://CVE-2026-87818.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

