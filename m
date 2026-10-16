Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381AFCCF2C3
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:34 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15611.1792131564294051812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FLB6Xoqy;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4341; q=dns/txt;
  s=iport01; t=1792131565; x=1793341165;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Sl/pkL+VcBJDUZfsfOM27d3EqDYFYzuyly1e2f8aoco=;
  b=FLB6XoqyLfvhwlkRp3y/K0TLVKn8dYL4aRBDBAHxWG8hKyDVwEe9oPsF
   l3oSxBw2ALF9I9KiNKT1HZchWxgRNyLtvDW9YyWrO7WFBi9MjwJSv8Uqb
   dixtlZq5H/pCFkE39kCat5zzLnPEaNBQSFVVYfKgo9iULMrI9VYRTISz6
   SaFX2u4MdxEDFefhazdx1ZKzKkyeHuOiEi9qUzl9yUbUDoG1v45aFff0I
   eJ1F4pNDZQXLTRzpgDmmOu6z+rKMRFLNqDPjwFQTUVLj4aI9EMcRtAABh
   z4uXRlAZErfBBgo5ZjvZq1KDx3+XjUWKQkmVsMPjik2TQTth0Dsr2TaK3
   A==;
X-CSE-ConnectionGUID: 0kcxEX/rTpiWYg7kqFHymA==
X-CSE-MsgGUID: bPH9apEdQy20oTj+PzM7mw==
X-IPAS-Result: =?us-ascii?q?A0BIAgDpwNFq/5P/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx2gXkzg?=
 =?us-ascii?q?QGCZkMBPwICQAFQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBX?=
 =?us-ascii?q?AICGIgLBIMcEoFaHpUpSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmI?=
 =?us-ascii?q?ggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CG?=
 =?us-ascii?q?EwBHx4kLQErRlqUQ5AdgiGhD4QojCKVOhozhASBV5JAklQLmH2OCpZPhGmBa?=
 =?us-ascii?q?DyBWTMaCBsVgyIJShkPjjmDa4UTUch2JzICCTIBAQcCBw4DC4FokAItgU8BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:B6Xjl61fjovvnnATjvbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzxSz
 TYXCmrTOv2KM2v2f951a4rg9EIH75Lcy4NhSAtu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGVEI9LaAovfxLGWBxx
 PNHKykjTgGGrrfjqF67YrEEasULNsLnOsYb/3pn1zycVK5gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUifC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsiuK1aYWMJoLiqcN9lH649
 2ve0mjAE0tCM+CdigKX1y2pmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:LZz9xqhW95ntsvnpQl8dBkqeu3BQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AIFQp7mr03nQh9HA6jsV2bdDmUZgmeW3w/DDKH1e?=
 =?us-ascii?q?5NldmF76MZ3+B/Yoxxg=3D=3D?=
X-Talos-MUID: 9a23:wDBDAAo5Ya2+YwP0ysEezztaFJZh+4miMVFXyZI6uYq8JwkvPijI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="522017146"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id AA8F418000A75
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 1EB75CC1600; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 14/27] python3-git: fix CVE-2026-76221
Date: Thu, 15 Oct 2026 23:19:09 -0700
Message-Id: <20261016061922.843414-15-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247986

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/a495ccd3b547ccd60b2187215823b72a9c0188bf
[2] https://www.cve.org/CVERecord?id=CVE-2026-76221

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-76221.patch   | 61 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch
new file mode 100644
index 0000000000..ef6e591e7d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch
@@ -0,0 +1,61 @@
+From 46f9c03ed10d25146293003791476955f8b26a73 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sun, 2 Aug 2026 08:57:12 +0000
+Subject: [PATCH 22/38] Reject syntax-bearing git config option names
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
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit a495ccd3b547ccd60b2187215823b72a9c0188bf)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/config.py |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/git/config.py b/git/config.py
+index 3015bb73..ff88bd18 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -74,6 +74,9 @@ See: https://git-scm.com/docs/git-config#_conditional_includes
+ UNSAFE_CONFIG_CHARS_RE = re.compile(r"[\r\n\x00]")
+ """Characters that cannot be safely written in config names or values."""
+ 
++VALID_CONFIG_OPTION_NAME_RE = re.compile(r"^[A-Za-z0-9_.-]+$")
++"""Pattern for option names that can be written without changing config syntax."""
++
+ 
+ class MetaParserBuilder(abc.ABCMeta):  # noqa: B024
+     """Utility class wrapping base-class methods into decorators that assure read-only properties."""
+@@ -854,6 +857,8 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+     def _assure_config_name_safe(self, name: "cp._SectionName", label: str) -> None:
+         if isinstance(name, str) and UNSAFE_CONFIG_CHARS_RE.search(name):
+             raise ValueError("Git config %s names must not contain CR, LF, or NUL" % label)
++        if label == "option" and isinstance(name, str) and not VALID_CONFIG_OPTION_NAME_RE.fullmatch(name):
++            raise ValueError("Git config option names may contain only letters, digits, '-', '_', or '.'")
+         if label == "section" and isinstance(name, str):
+             in_quotes = False
+             escaped = False
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index c2fbc65db2..80cdc59f92 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -35,6 +35,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-73621.patch \
             file://CVE-2026-73620.patch \
             file://CVE-2026-73619.patch \
+            file://CVE-2026-76221.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


