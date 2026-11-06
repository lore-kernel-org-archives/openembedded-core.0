Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7341.1793976215074198551
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=P+A+mWVb;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3646; q=dns/txt;
  s=iport01; t=1793976215; x=1795185815;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=wc+aJacDn7v/d6g/byeP3tis0hlb93WuDK5BApsqmM8=;
  b=P+A+mWVbWzLiRKXJIAAsXFkZASEOdwYP+fotULwQw8AzJ4NZYXIYkJ3+
   qOcUZ0guKr0smeLPdA0syJWtxWyUw4BnJ31w+39ic6jPQDaKUrUKEib9i
   3fFwDnFJbVi+v6MWt4tbgYPTLtKzVMuxeMK9xOsz7vdpGrsgp3SEeU3ws
   eilZ/GA51kHQHPdnOA+6E6lHYecQPCq3JDCu1dzNNfYVKxbKv6SmklEeS
   a9e9shrzZhLX5dAFEzBsQIYWie5+UZ9sAQotwo/B4EAgUvQQvAjA5S7b0
   kfLT6Ph5rgmlRS+2RnUZoEKS6Ifz3J2MtcoyDzdeEy0WweDAmpsR9oDfv
   A==;
X-CSE-ConnectionGUID: +/KarDdzSjWQSbPSwcyuSg==
X-CSE-MsgGUID: ImTJRSaHSZqViKv4efULdA==
X-IPAS-Result: =?us-ascii?q?A0BJAgAQ5u1q/4z/Ja1aglmCV3VgQ0kDlCeCIQOeIYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG8P4F5M?=
 =?us-ascii?q?4EBgykBPwJDUNhMEG+BaAELFAGBOIVCiCRdGAGEfScbgUlEgRWDaYEFgVwCg?=
 =?us-ascii?q?SeGfwSDHBKBWo0YAoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QcbBgWBHYEegRKBB12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZAsaBWEIAg0MdDkQMB4kLwUcJj4bCi8YDUgRLDcVG?=
 =?us-ascii?q?QQ+bgeSPYJFTT0cNQErBIENgRtOkmeSQaERhCqMJJU6GjOEBIFXkkKSVAuYf?=
 =?us-ascii?q?Y4KllGEaYFoPIFZMxoIGxWDIglKGQ+OOYNrhRNRxggmMgIJAy8BAQcCBw4DC?=
 =?us-ascii?q?4FokACBfgEB?=
IronPort-Data: A9a23:IbRS9qgSJNXRictiRqj8uKOoX161NxEKZh0ujC45NGQN5FlHY01je
 htvUTiBbvyNZDCgf98jPYji/U1U68PVmtBjGQJk/3gyEChjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvre8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVbvcV+G01C5
 8caFwk2ZCi4mOmn3Ym0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg9/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeJJ4faG5kPxS50o
 Ern+ljbOCoTFOet0ASE0Wzwi+HyuS/SDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:oRaqS6ujRto9G4yv6ThWwJS+7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:fc0C9G2WvYhDOeugTiGXnLxfWYcGe2fxwGXrIXCBMmxRc6KeWEKr9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3APRkDYQ1AYg1Zfy5MSpUnywG6DDUjwqGSKno2mLU?=
 =?us-ascii?q?9idC6NA9uZzqTsRC7a9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545386423"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:34 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id D81D9180001CD
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 53D53CBEF7D; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 23/27] python3-git: fix CVE-2026-78675
Date: Fri,  6 Nov 2026 06:43:27 -0800
Message-Id: <20261106144331.3354811-24-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249681
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/ef7568e3b317ce617eacda39b8b54dcdff8c3b5c
[2] https://security-tracker.debian.org/tracker/CVE-2026-78675

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
---
 .../python/python3-git/CVE-2026-78675.patch   | 47 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch
new file mode 100644
index 0000000000..0cef9a19b0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch
@@ -0,0 +1,47 @@
+From eaa63265a59f069bf13384481c48fa48a25ff087 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 10 Aug 2026 12:32:24 +0200
+Subject: [PATCH] fix: ignore includes in submodule configuration
+
+<!-- agent -->
+Submodule configuration is read from .gitmodules, whose contents may come
+from an untrusted repository. Its parser inherited merge_includes=True and
+could therefore open files named by include directives during ordinary
+submodule enumeration.
+
+Disable include merging at the SubmoduleConfigParser construction site. This
+matches Repo.config_writer() hardening from 41ecc6a4 and addresses
+GHSA-7833-fr7j-v32q without changing include behavior for trusted config
+parsers.
+
+The regression points .gitmodules at a non-config file and verifies the
+submodule entry remains readable without opening the included path.
+
+CVE: CVE-2026-78675
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/ef7568e3b317ce617eacda39b8b54dcdff8c3b5c]
+
+Backport Changes:
+- Omitted test/test_submodule.py because the current PyPI source archive
+  does not include the test suite and the python3-git recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit ef7568e3b317ce617eacda39b8b54dcdff8c3b5c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index 410f41e2..e37f8fa9 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -268,7 +268,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise ValueError("Cannot write blobs of 'historical' submodule configurations")
+         # END handle writes of historical submodules
+
+-        return SubmoduleConfigParser(fp_module, read_only=read_only)
++        return SubmoduleConfigParser(fp_module, read_only=read_only, merge_includes=False)
+
+     def _clear_cache(self) -> None:
+         """Clear the possibly changed values."""
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index badbf04415..0dd42e1f04 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -47,6 +47,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-78678_CVE-2026-78679.patch \
            file://CVE-2026-78677.patch \
            file://CVE-2026-78676.patch \
+           file://CVE-2026-78675.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

