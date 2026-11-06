Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7336.1793976213937852288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bCV49v5w;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4548; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=RugXnkXrW4GLDEw+tyOzo6qNZRmVTArUrbvvcXyaY1s=;
  b=bCV49v5wJzFeTg4e6kjLQhSBTCwfd0CxYtTx4Vi3m2z9bJlsPFik3a0A
   lGk1OgpnZj+YxdYGosURbuiOCzGDuGj6Jqo1Q5lQdCG46cpafIaxq36/O
   XgwTfw+DYujNHq1TTMcrJkCa170i6J1pO1xt0hktbnVTqukuP6Tkpc7sW
   DL3/gJnubUCCOsL7EeC8sQtzJCOubW764SW85EQYVQefk9dSJ9jW1zfvO
   ajFmHFG6pNeroUQF+JwHmkUil4auxzWN5Z/Qe5v58Q6X/XRBd2L8VG+up
   L/0blMEruhtcpTX4J+SLEskZ67sW8kfXwAJQQlaohymMW5olEkcdjeKnF
   g==;
X-CSE-ConnectionGUID: swpN3f4WTCGLhidJRHOuVQ==
X-CSE-MsgGUID: eWL3oNtuS0C8MCyVIQGETw==
X-IPAS-Result: =?us-ascii?q?A0BLAgAQ5u1q/5D/Ja1aHgEBCxIMggULgld1YENJA4RUj?=
 =?us-ascii?q?1OCIQOeIYF+DwEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMjBAsBGAE9HAMBAgMCJgICKyMIG?=
 =?us-ascii?q?YMCAYI6AzcDEbw/en8zgQGCZkMBPwJDUNhMEG+BaAELFAGBCi6FQoMgAYUDX?=
 =?us-ascii?q?RgBhH0nG4FJRIEVg2mBBYFcAoU8gmoEgxwSgVoejHoCgVGGeUiBAhwDWSwBV?=
 =?us-ascii?q?RMNCgsHBYFoAzUSKhVuMh2BIz4XL1gbBgWBHYEegRKBB12BKyheIYEIgXYCg?=
 =?us-ascii?q?lGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0Md?=
 =?us-ascii?q?DkQMB4kLwUcJj4bCi8YDUgRLDcVGQQ9AW4Hkj2CRUwBHx5RAStGWoEMkzeQH?=
 =?us-ascii?q?oIhoRGEKowklToaM4VbpRYLmH2OCpZRhGmBaDyBWTMaCBsVgyIJShkPjjmDa?=
 =?us-ascii?q?4UTUcYIJjICCQMvAQEHAgcOAwuBaIRhiyEtgU8BAQ?=
IronPort-Data: A9a23:keOscaDcki1JrxVW/37iw5YqxClBgxIJ4kV8jS/XYbTApGxwgWMDz
 GJJUG3VafuMamakf9xyPIXno0oCuZbVzIUxOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2Op2Kho4YbIk0clTAWBC1
 8Y4Dy0zV0XW7w626OrTpuhEnM8vKozveYgYoHwllW6fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYzBPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCOkFEqgOaxaoO9ltqiSPpxxUG+u
 n/9p0+pJzoLCv2m5he57Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTVlezf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ12FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:LRpyWqvvtQ//gLG/ESnNon0W7skDVNV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVkqNk3I9ersBEDEewK+yXcX2/h1AV7dZmjbUQKTRekIh7cKgQeQeREWndQz6U
 4PScRD4aXLbWRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: 9a23:JxqhR24c4k4p3rsqjNss71EMPJsrLkLh51j0I060K1xJb6CrcArF
X-Talos-MUID: 9a23:b5NiSQQURSysVbUDRXThuxU5M+F0/p/2IxAouoQ4mvCrGBBvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545386421"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 83D151800048B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 18615CC1611; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 14/27] python3-git: fix CVE-2026-76221
Date: Fri,  6 Nov 2026 06:43:18 -0800
Message-Id: <20261106144331.3354811-15-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249672
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/a495ccd3b547ccd60b2187215823b72a9c0188bf
[2] https://security-tracker.debian.org/tracker/CVE-2026-76221

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Expanded the embedded commit rationale to describe unsafe option-name
  serialization and the validator’s coverage. Added Assisted-by and
  Co-authored-by trailers. The source validator remains the same;
  the embedded diff removes an extra blank line.
---
 .../python/python3-git/CVE-2026-76221.patch   | 59 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch
new file mode 100644
index 0000000000..80198bde6c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch
@@ -0,0 +1,59 @@
+From 46f9c03ed10d25146293003791476955f8b26a73 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sun, 2 Aug 2026 08:57:12 +0000
+Subject: [PATCH] Reject syntax-bearing git config option names
+
+<!-- agent -->
+GHSA-jm78-9fvv-mhgr reports that config option names containing Git
+syntax can be serialized as unintended directives. A regression test showed
+that set, set_value, and add_value accepted delimiter, comment, bracket, and
+whitespace characters in option names.
+
+Restrict written option names to GitPython's established safe character set of
+letters, digits, hyphens, underscores, and dots. This blocks characters that
+can change config syntax while preserving option names historically supported
+by the writer and SectionConstraint.
+
+A broader audit confirmed that every public option-creating config API and
+SectionConstraint delegate reaches this validator; no separate config writer
+sink was found. The behavior was checked against Git cf5497b14, and the full
+config test module plus dotted-option regression pass.
+
+CVE: CVE-2026-76221
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/a495ccd3b547ccd60b2187215823b72a9c0188bf]
+
+Backport Changes:
+- Omitted test/test_config.py because the current PyPI source
+  archive does not include the test suite and the python3-git
+  recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit a495ccd3b547ccd60b2187215823b72a9c0188bf)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/config.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/git/config.py b/git/config.py
+index cbfc7ebd..de1b9572 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -74,6 +74,8 @@ UNSAFE_CONFIG_CHARS_RE
+ UNSAFE_CONFIG_CHARS_RE = re.compile(r"[\r\n\x00]")
+ """Characters that cannot be safely written in config names or values."""
+ 
++VALID_CONFIG_OPTION_NAME_RE = re.compile(r"^[A-Za-z0-9_.-]+$")
++"""Pattern for option names that can be written without changing config syntax."""
+ 
+ 
+ class MetaParserBuilder(abc.ABCMeta):  # noqa: B024
+@@ -875,6 +877,8 @@ GitConfigParser._assure_config_name_safe
+     def _assure_config_name_safe(self, name: "cp._SectionName", label: str) -> None:
+         if isinstance(name, str) and UNSAFE_CONFIG_CHARS_RE.search(name):
+             raise ValueError("Git config %s names must not contain CR, LF, or NUL" % label)
++        if label == "option" and isinstance(name, str) and not VALID_CONFIG_OPTION_NAME_RE.fullmatch(name):
++            raise ValueError("Git config option names may contain only letters, digits, '-', '_', or '.'")
+         if label == "section" and isinstance(name, str):
+             in_quotes = False
+             escaped = False
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index f0ffb70df8..42d251a2df 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -36,6 +36,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73620.patch \
            file://CVE-2026-73619_p1.patch \
            file://CVE-2026-73619_p2.patch \
+           file://CVE-2026-76221.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

