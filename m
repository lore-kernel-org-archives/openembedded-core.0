Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7337.1793976214149599703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cAqyi3+D;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4385; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=RULGvOBQHJDQA6sR5MMmpN6lHG84BWVBm8fc19hPC9s=;
  b=cAqyi3+DjIJnKowvh0cgDtzS2cu7ZpmpuTNVk4lF6hlDQpX4lJK6UmfX
   PGN3SypAbS/SKHeWEAchmr7IBM+Rj4MzCm4ZQk9hZkHkhKCtBZBaEMFkD
   X9bwAU+fxPpsjV6au/UDlS4/AKGIWVlo1n4XyyhBUepTeA88apLVFl9XB
   3GlAYHfdnYr2s8DddKLd5//5cMoGJqaeYfeu8lIDY31AjBHmQSlg9KwUX
   4RPLAgrFlnERA0gtyn5OBcmrRDPJ/QNkWM9JMGIGL40Dk4WVHYlLhyvwg
   W1viuCgURNeSahnc+rfG3UvISgq9NEdZiASBHiIPGnrGIY+xPE6G4uqTw
   A==;
X-CSE-ConnectionGUID: sO6QQB3WQBm0SK84tLY4Bw==
X-CSE-MsgGUID: ekQC8M0sQ3iMizVdvwZ6JA==
X-IPAS-Result: =?us-ascii?q?A0BIAgCS5u1q/5H/Ja1aHgEBCxIMggULgld1YENJA5Qng?=
 =?us-ascii?q?iEDniGBfg8BAQEPRA0EAQGEP0YCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDN?=
 =?us-ascii?q?wMRvEWBeTOBAYMpAT8CQ1DYTBBvgWgBCxQBgTiFQogkXRgBhH0nG4FJRIEVg?=
 =?us-ascii?q?2mBBYFcAogmBIMcEoFaGI0AAoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQcbBgWBHYEegRKBB12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDE?=
 =?us-ascii?q?kckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0MdDkQMB4kLwUcJj4bCi8YD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeSPYJFTT1RAQohRoEaJScikxWQHoIhoRGEKowklToaM4Vbp?=
 =?us-ascii?q?RYLmH2OCpZRhGmBaDyBWTMaCBsVgyIJShkPji0MC4NghRNRxggmMgIJAy8BA?=
 =?us-ascii?q?QcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:qD7y66q7ABqkKV9MQMrP030OV+peBmJPZBIvgKrLsJaIsI4StFCzt
 garIBnTOvbeMTGme94gboiy8UxX7JXcm99nHgFt+Cw2EXgQ8uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E435ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0v1QX1h33
 6cnERoINiug176q5IPnYPY506zPLOGzVG8ekmtrwTecCbMtRorOBv2ao9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVfrSn8/w7pX7WyxFsluZqII84nPYy0p6172F3N/9J4fUFJwNwx3Dz
 o7A12n6OzpKEYSE8GGE13O+uOPRghGleqtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFm4HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:VdllRKvTuhqi1i/WIWmHv+2z7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:1y1zpG29P05iIX7xLn47AbxfAed7S0T3l0jpCUrgMkU5FKGxeAO65/Yx
X-Talos-MUID: 9a23:XWMGJQZodS1JlOBTujzVr2FHbNxRuKWLCVIznYsZiZemHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="536910533"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 694BE180005B3
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id D0533CBF234; Fri,  6 Nov 2026 06:43:32 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 06/27] python3-git: fix CVE-2026-69097
Date: Fri,  6 Nov 2026 06:43:10 -0800
Message-Id: <20261106144331.3354811-7-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249671
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/1ed1b924f4e2d2ee7bab296df77b978af21853f1
[2] https://security-tracker.debian.org/tracker/CVE-2026-69097

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Restored the longer upstream commit explanation and Sebastian Thiel
  co-author trailer, and corrected the abbreviated upstream/cherry-pick
  hash to the full commit hash. The source fix is unchanged.
---
 .../python/python3-git/CVE-2026-69097.patch   | 60 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch
new file mode 100644
index 0000000000..55b76ece40
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch
@@ -0,0 +1,60 @@
+From 1ed1b924f4e2d2ee7bab296df77b978af21853f1 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Mon, 20 Jul 2026 14:13:22 +0200
+Subject: [PATCH] fix: validate config section delimiters
+
+GHSA-3rp5-jjmw-4wv2 identified that configuration section names could alter the
+structure of serialized config despite the existing control-character checks.
+
+Reject unquoted closing section delimiters across all writer entry points
+while preserving valid delimiters inside quoted subsections and the
+existing option-name behavior. Add regression coverage for unsafe plain and
+quoted-subsection-shaped names as well as a valid quoted subsection.
+
+Git baseline: a23bace963d508bd96983cc637131392d3face18. Git config parsing
+treats an unquoted closing bracket as the end of a basic section header, while
+its extended form permits brackets inside a quoted subsection and requires a
+final bracket after the closing quote.
+
+CVE: CVE-2026-69097
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/1ed1b924f4e2d2ee7bab296df77b978af21853f1]
+
+Backport Changes:
+- Omitted test/test_config.py because the current PyPI
+  source archive does not include the test suite and
+  the python3-git recipe does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 1ed1b924f4e2d2ee7bab296df77b978af21853f1)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/config.py | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/git/config.py b/git/config.py
+index 236de3a6..21f6e8aa 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -875,6 +875,22 @@ GitConfigParser._assure_config_name_safe
+     def _assure_config_name_safe(self, name: "cp._SectionName", label: str) -> None:
+         if isinstance(name, str) and UNSAFE_CONFIG_CHARS_RE.search(name):
+             raise ValueError("Git config %s names must not contain CR, LF, or NUL" % label)
++        if label == "section" and isinstance(name, str):
++            in_quotes = False
++            escaped = False
++            for index, char in enumerate(name):
++                if escaped:
++                    escaped = False
++                elif in_quotes and char == "\\":
++                    escaped = True
++                elif char == '"':
++                    if not in_quotes and (index == 0 or name[index - 1] not in " \t"):
++                        raise ValueError("Git config quoted subsection names must begin after whitespace")
++                    in_quotes = not in_quotes
++                elif char == "]" and not in_quotes:
++                    raise ValueError("Git config section names must not contain an unquoted closing bracket")
++            if in_quotes:
++                raise ValueError("Git config section names must not contain an unterminated quote")
+ 
+ 
+     @needs_values
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index fafb9972ef..781ec512cc 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -27,6 +27,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-67325_p2.patch \
            file://CVE-2026-67324.patch \
            file://CVE-2026-67322.patch \
+           file://CVE-2026-69097.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

