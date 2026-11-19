Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8016.1795062171745616482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dGIvtIgM;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4548; q=dns/txt;
  s=iport01; t=1795062171; x=1796271771;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lZl7wEfDLvTV5Km9LoHv5RFKkLcpUh2Cz8hDcMYhHPo=;
  b=dGIvtIgMaGx/0Uo+01r/0A/8oCJqFGA/EKI1s6Sm7NtuMXtRGfV5fsic
   JSbpcXi2EJKmNr9rFmvuSzlUWbaAnF4tuN616J8lG61f9eQT7vVGX+aSL
   1FktwdpohOFxzk1NXX2+dRElWZy1jCY56vePlyBVhc9vjfkS2oz/vGIwT
   4rfFB5eP6YuujTPArKwzTFwRl+nupGPm80SGYKWKSxnQHjeNtKIW3zp6x
   PC1MwKWfCDVzTcaeWhRTnBjQ0FBZUdeWOI4kSqMhZctFUkIx2pBw828pa
   sD0iqaTDoQKdx+q7AaFCRDvcmbh+UDfhfiFtHK7XC6wekfxfnS5xufluW
   A==;
X-CSE-ConnectionGUID: Tntni5NzRC21W9eF4L1hXQ==
X-CSE-MsgGUID: I2bnw1GMSAOk9mOfD3tarA==
X-IPAS-Result: =?us-ascii?q?A0BLAgAlef5q/8xK/pBaglmCV3VgQ0kDhFSPU4IhA54pg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD9GAo4gAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAyMECwEYAT0cAwECAwImAgIrIwgZgwIBgjoDN?=
 =?us-ascii?q?wMRuTR6fzOBAYJmQwE/AkNQ2EwQb4FoAQsUAYEKLoVCgyABhQNdGAGEfScbg?=
 =?us-ascii?q?UlEgRWDaoEFgVwChTyCagSDHBKBVB6MeQKBT4gKSIECHANZLAFVEw0KCwcFg?=
 =?us-ascii?q?WgDNRIqFW4yHYEjOxcvWBsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQ?=
 =?us-ascii?q?Q4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvB?=
 =?us-ascii?q?RomPhsKgQwnHx4bDgIOGA1IESw3FRkEPQFuB5NRgktMAR8eUQErRlqBDJM3k?=
 =?us-ascii?q?B2CIaERhCuMJJU6GjOFW6UXC5h9jgqWUYRqgWg8gVkzGggbFYMiCUoZD445g?=
 =?us-ascii?q?2uFE1HGWiYyAgkDLwEBBwIHDgMLgWiEYYshLYFPAQE?=
IronPort-Data: A9a23:+ppd1KzkLhYUZGL/KqJ6t+d9xyrEfRIJ4+MujC+fZmUNrF6WrkVRz
 GpMXzuGPqnfZmv9L9kka423ph4OvMSDzIVgSQJlr1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctazJMsMpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJH0wIYsZp8BlO0oUr
 MNJJR5RSkmDt9vjldpXSsE07igiBMDmJsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkycC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsgeOxboSOKrRmQ+10xEyeu
 Tvp2l/QJRJLMfuR5WGZ+2iF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvGS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH7dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:w3KmwaNngWwDc8BcTuOjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: 9a23:x9aec2/mSu8hc0fH7lyVv3ISBsYkL1vP9lyKenDpBEg1bOSVeWbFrQ==
X-Talos-MUID: 9a23:+r3RKAUIARXp+kbq/B62jjd9behN2I2JCxEItpsq4NWNLwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59346638"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:46 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 21B97180006CF
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:46 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 53487CBEF6F; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 14/27] python3-git: fix CVE-2026-76221
Date: Wed, 18 Nov 2026 20:22:29 -0800
Message-Id: <20261119042242.1640611-15-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250633
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
2.35.6

