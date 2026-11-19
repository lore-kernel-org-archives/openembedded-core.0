Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8250.1795062166873332270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eF9V+exc;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4418; q=dns/txt;
  s=iport01; t=1795062170; x=1796271770;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dGa4fxfKIjurLVWjeOAT8c6zes9wT/QHj5wiK7k7/Pk=;
  b=eF9V+excmpsFLta18qTKdFyFznRgVSfWCTyArv8kyMep6abfE64E/Ar2
   SCA4/U0G7MTgqcxGUhuLUscTWOvIWhU/lyvwMAo6Iod63IO+SYDI2ENoJ
   hIY+EvAy3MZ/qcNxOqIKMp+qLrzHEBCiq+4Ud5ie51AOMgS9EkGOijJb2
   iuPvYdYRF2x42eCn/KVO9iQgx/sPl6aom5cG4L3lbkGXKgtCTsV6855aN
   lgFNbyCZZGQS0GBvECFnodIJqwYTH8HRgObUwngAqkt85yz2Fe2M3MEQR
   /4VnggxxWHbIqC7ljSI/zB0j28o4+9McEQawGJbFb81+QvWqRTG/Mfjr8
   w==;
X-CSE-ConnectionGUID: NAqf3dvFRGiR3gV/REEPQQ==
X-CSE-MsgGUID: RcNA0sJoSYiRhJ+d2bPACA==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/9FK/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG5NYF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhMEG+BaAELFAGBOIVCiCRdGAGEfScbgUlEgRWDaoEFgVwCi?=
 =?us-ascii?q?CYEgxwSgVSNFwKBT4gKSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHG?=
 =?us-ascii?q?wYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAg4YD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeTUYIlJjsRAT1RASuCAwEoTpJXTJIEgTWfXIQrjCSVOhozh?=
 =?us-ascii?q?ASBV5JDklQLmH2OCpZRhGqBaDyBRA4HMxoIGxWDIglKGQ+OOYNrhRNRxlomM?=
 =?us-ascii?q?gIJAy8BAQcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:awrpcaJs9Nb4mp/8FE+Rm5QlxSXFcZb7ZxGr2PjKsXjdYENShWMHn
 GpMDG/QMquINzPyLdxyOo2/8R8G6JeEzd83TAEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmckajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1IJVg4ZoEG1NxYAFsV+
 sJfEh0gVim60rfeLLKTEoGAh+wqIdOuOMYUvWttiGmJS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3PXwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237klUgjOS2bYe9ltqif85ztx6Dh
 GX9zmXDAjNZOIaV8ROu2yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVndjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWYHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:JO3z3aDHTByNlunlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:RJabRW11ZBgXNwuReVPNYbxfPOk8fCbR0lnqDE6CUmlXD4e4ZGepwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3Ar7fO1g5O90Qq2h6dUtKtyi2XxoxS6IKHUFsvlq4?=
 =?us-ascii?q?3uvOEF298YT2lpR+eF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="61944355"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:47 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id 7D3FE18000580
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:47 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id A8543CC8C96; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 25/27] python3-git: fix CVE-2026-87818
Date: Wed, 18 Nov 2026 20:22:40 -0800
Message-Id: <20261119042242.1640611-26-yurade@cisco.com>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250627
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

This patch follows patch CVE-2026-73624, which adds default unsafe-option
validation for Diffable.diff. It adds --no-index to the options rejected
by that guard unless unsafe options are explicitly allowed. The published
affected range names GitPython 3.1.59; this patch completes the guard in
the backport series and does not assert that unmodified 3.1.43 is in that
range.

[1] https://github.com/gitpython-developers/GitPython/commit/09f2cf383a992d1af697364569e9f384748c1bd8
[2] https://security-tracker.debian.org/tracker/CVE-2026-87818

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Added the omitted doc/source/changes.rst release-note change to
  Backport Changes.
---
Changes in v3:
- Added rationale explaining that this patch completes the unsafe-option
  guard in the 3.1.43 backport series; the published affected range names
  GitPython 3.1.59.
- Clarified that the recipe does not fetch test/test_diff.py separately.
- Restored the required trailing spaces.
---
 .../python/python3-git/CVE-2026-87818.patch   | 56 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch
new file mode 100644
index 0000000000..86c8dce834
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch
@@ -0,0 +1,56 @@
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
+  not fetch it separately.
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
2.35.6

