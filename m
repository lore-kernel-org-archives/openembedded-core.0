Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8008.1795062166792664573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BubyY3Aw;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4385; q=dns/txt;
  s=iport01; t=1795062167; x=1796271767;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=X1Ny9c46D5E0gsPp9hk/v89/D5O9BgRcBbI1c3c1sYs=;
  b=BubyY3AwrvDJzNJkbe0vWY39aL9l1mZvA43X3DD97Ml3hL0S7anpBcBx
   JSVs5j9CEEoYSjMXN7YVMbUi0AUDMlzaGbs1YHG5RIcmdyOxHxnyiX+QF
   WSNXHmRSItS8iVP+yCcerH1wijIjekE8vv90YnLSvxvPaqAsESckHxhVK
   zVgr+/wPU3ZrK3J9p2vOdOglS2M14PPDEmJj7wZxPEzB94nSIGJn57RWm
   c34ZG65Ss6uQO2h4EjogmdXMHrXYL1fRhZQ2igET6TYZ/aJaChmoPJKQi
   +Rt8P3Qu5K+9DVjy6xeKlfp5rk6/RkPtcU7eZS0uJSvvH+RkZPrSNx3Mk
   Q==;
X-CSE-ConnectionGUID: 6Fjv+r6yT+maTeX9kQgRuQ==
X-CSE-MsgGUID: T0izXQpFRxOXl1Sc9uTgjg==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/9BK/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG5NYF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhMEG+BaAELFAGBOIVCiCRdGAGEfScbgUlEgRWDaoEFgVwCi?=
 =?us-ascii?q?CYEgxwSgVQYjH8CgU+ICkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBB?=
 =?us-ascii?q?xsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIOG?=
 =?us-ascii?q?A1IESw3FRkEPm4Hk1GCS009UQEKIUaBGiUnIpMVkB2CIaERhCuMJJU6GjOFW?=
 =?us-ascii?q?6UXC5h9jgqWUYRqgWg8gVkzGggbFYMiCUoZD44tDAuDYIUTUcZaJjICCQMvA?=
 =?us-ascii?q?QEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:YxPb6KxUv+w55ie6G+t6t+d9xyrEfRIJ4+MujC+fZmUNrF6WrkVVm
 2pJXj+HOarfM2XwcttzYNvn/EJTvZTUnNdlQAc//FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctazJMsMpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJB8YP5Nb4LhmPSJL/
 MAVGGEOVx+5mtvjldpXSsE07igiBMDmJsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkyQC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsgeGzbIWOKrRmQ+1pxkeKl
 lve0V7pJSEebeeUmCe5/XCj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvWS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:9jt416FfnAE5hcYipLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:b8iCv27vy1AG2b0r1NssqmAWBIM/LGzhj3LZH0KIWGVQR4eIcArF
X-Talos-MUID: 9a23:JDJkoQkaja3xSHRkV5dKdnpebMZ60522JnodtqUC4vKPZDFMNDWS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59164738"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:46 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id C82081800027A
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:45 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 15D34CBF234; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 06/27] python3-git: fix CVE-2026-69097
Date: Wed, 18 Nov 2026 20:22:21 -0800
Message-Id: <20261119042242.1640611-7-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250613
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
2.35.6

