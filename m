Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A7CC5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 17:10:43 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1402.1787159433344224866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 10:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DSaA19Jh;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7436; q=dns/txt;
  s=iport01; t=1787159433; x=1788369033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iUcttlWSW+cCGaFQyLb4Y2xDfVcncDHYm1IRdW5IE3w=;
  b=DSaA19JhzZDAQIoMLMuF/guiiSeF+aEHM/Y7eO166W7Hjnzxw44nc82s
   Sq47m14L/wQqfjzDRZYGSUVreGLKR/MaJ2KklKEdUIj4kr9+DaoNkLzyE
   Du8f26nzTxMIWMGBsDpGJET9S2yIgEliU1a/zj8WNaOfP/4C6dEJdjjqU
   gRvCZCUojirsuRxCv03N12CpeIfaX15DeQW+q02yeZEXgY6f+SmIjuJMP
   4vEgIz+rislODUJfs63CKBb7fEqjWhm6m3QsnxDtJ9Nv6Y53ik0Nea2tS
   cHixQLD2VtGSpfu+PQaj54nLGE790JGp9V8K+VbrPU5DcxCOFx74fLicO
   A==;
X-CSE-ConnectionGUID: BOmkjRs1QPWsMbRt5Mg50g==
X-CSE-MsgGUID: oFkHb/NwReOhhpSm1jzSAw==
X-IPAS-Result: =?us-ascii?q?A0BIAgD84oVq/4oQJK1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKNawImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgjoDNwMRxBqBeTOBA?=
 =?us-ascii?q?YMoAT8CQ1DYSxCCVQELFAGBOIU/iCJdGAGEfCcbG4FyhH6BBYFcAQGBJ4Z+B?=
 =?us-ascii?q?IIiehKBWm6Qe0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGBYEdg?=
 =?us-ascii?q?SiENyMZNnyBCV6BKyphARIXgQmCCgKCcIIGAgFJRQ4JDAsYDUgRLDcUGQQ+b?=
 =?us-ascii?q?geOSiCBfjsSDoEAAQohlT0mkj+hDwoog3aMIZU6GjOEBIFXkkCSUQuYfY4Kl?=
 =?us-ascii?q?lCEaYFoPIFHCwdwFYMiCUoZD44qDguDYIF/g2XGVScyAgkyAQEHAgcOAwuBa?=
 =?us-ascii?q?IRhix8CJgeBTwEB?=
IronPort-Data: A9a23:jSJAN6KTQfDkcbcGFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS1zxVz
 mQWDTzXOaqONzT0Kd1+OYXn8UsG6pbVx9UyGwMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uv9WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2clajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1EK0Q1P7cDo99PPnpr/
 8YEdRUCM0iM0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBVLAtQIvIROPB4towMDUY358VW62AI
 ZNHL2M0PHwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQhiuizb4ePI4XiqcN9mWibh
 miB2XvDDzYaNMSkzGOH4EmFmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXLIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:QOBakaC986eOmLvlHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80l6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:DRXK6WA9Z4phOpj6EwNA8U0WINt8S0Xi11LaGVPlLGk0ELLAHA==
X-Talos-MUID: 9a23:345LeQpKdLo5iqppn5AezzZMN+dipIKxMk0qkZUegMzdNz5LEijI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="828675211"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 17:10:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 225FA18002444;
	Wed, 19 Aug 2026 17:10:32 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id B1AC7CD02BA; Wed, 19 Aug 2026 10:10:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 4/4] python3-git: fix CVE-2026-44244
Date: Wed, 19 Aug 2026 10:10:25 -0700
Message-ID: <20260819171026.750280-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260819171026.750280-1-dkelaiya@cisco.com>
References: <20260819171026.750280-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 17:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243775

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream 3.1.49 backport for
CVE-2026-44244. The upstream fix merge is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commits are referenced in [3] and [4].

[1] https://github.com/gitpython-developers/GitPython/commit/b049a13105992f22376ad0c7ec945bf3bfb365ae
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-44244
[3] https://github.com/gitpython-developers/GitPython/commit/c417af469f9aa3da8dfef78f996c0fb8c5d1f4c2
[4] https://github.com/gitpython-developers/GitPython/commit/8e24503b42c1d63dd98e8b2e6a2f655bdd0821e3

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-git/CVE-2026-44244_p1.patch       | 104 ++++++++++++++++++
 .../python3-git/CVE-2026-44244_p2.patch       |  30 +++++
 .../python/python3-git_3.1.42.bb              |   2 +
 3 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
new file mode 100644
index 0000000000..92aa905622
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
@@ -0,0 +1,104 @@
+From 19e86eacc9471f2c3ef6f6a55dcaed40e5e139a0 Mon Sep 17 00:00:00 2001
+From: "GPT 5.5" <codex@openai.com>
+Date: Wed, 29 Apr 2026 05:47:57 +0800
+Subject: [PATCH] reject control chars in written values in configuration
+
+Reject CR, LF, and NUL in GitConfigParser values before writing them
+to git config files (which also is a deviation from Git which escapes them).
+
+GitConfigParser._write() serializes embedded newlines as indented
+continuation lines by replacing "\n" with "\n\t". Git itself skips
+leading whitespace before parsing config tokens, so an injected value
+such as:
+
+    foo
+    [core]
+    hooksPath=/tmp/hooks
+
+is written in a form where the indented "[core]" line is still parsed by
+Git as a real section header. This lets attacker-controlled input passed
+to config_writer().set_value() poison repository config, including
+core.hooksPath, and redirect hook execution for later Git operations.
+
+Fail closed instead of stripping or normalizing these characters. Silent
+normalization can hide unsanitized caller input, and GitPython does not
+currently round-trip Git-style escaped values such as "\n" as embedded
+newlines.
+
+Apply the validation to set_value(), add_value(), and the public set()
+path so callers cannot bypass the safer helper API. Add regression tests
+for the advisory payload and for CR, LF, NUL, and bytes values.
+
+This preserves existing read behavior for config files that already
+contain multiline values while preventing GitPython from writing new
+unsafe values.
+
+CVE: CVE-2026-44244
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/c417af469f9aa3da8dfef78f996c0fb8c5d1f4c2]
+
+Backport Changes:
+- Omit regression tests because the Scarthgap PyPI source
+  archive does not include the upstream test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit c417af469f9aa3da8dfef78f996c0fb8c5d1f4c2)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/config.py | 24 ++++++++++++++++++++++--
+ 1 file changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/git/config.py b/git/config.py
+index 85f75419..ce307110 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -841,6 +841,24 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+             return str(value)
+         return force_text(value)
+ 
++    def _value_to_string_safe(self, value: Union[str, bytes, int, float, bool]) -> str:
++        value_str = self._value_to_string(value)
++        if re.search(r"[\r\n\x00]", value_str):
++            raise ValueError("Git config values must not contain CR, LF, or NUL")
++        return value_str
++
++    @needs_values
++    @set_dirty_and_flush_changes
++    def set(
++        self,
++        section: str,
++        option: str,
++        value: Union[str, bytes, int, float, bool, None] = None,
++    ) -> None:
++        if value is not None:
++            value = self._value_to_string_safe(value)
++        return super().set(section, option, value)
++
+     @needs_values
+     @set_dirty_and_flush_changes
+     def set_value(self, section: str, option: str, value: Union[str, bytes, int, float, bool]) -> "GitConfigParser":
+@@ -855,9 +873,10 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+             a string.
+         :return: This instance
+         """
++        value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+-        self.set(section, option, self._value_to_string(value))
++        self.set(section, option, value_str)
+         return self
+ 
+     @needs_values
+@@ -875,9 +894,10 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+             to a string
+         :return: This instance
+         """
++        value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+-        self._sections[section].add(option, self._value_to_string(value))
++        self._sections[section].add(option, value_str)
+         return self
+ 
+     def rename_section(self, section: str, new_name: str) -> "GitConfigParser":
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch
new file mode 100644
index 0000000000..fcc3a87275
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch
@@ -0,0 +1,30 @@
+From cf273ba3958ad02afa361167a0d0f82e1f4b5f4d Mon Sep 17 00:00:00 2001
+From: "GPT 5.5" <codex@openai.com>
+Date: Wed, 29 Apr 2026 06:39:02 +0800
+Subject: [PATCH] avoid duplicate validation in set_value
+
+CVE: CVE-2026-44244
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/8e24503b42c1d63dd98e8b2e6a2f655bdd0821e3]
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 8e24503b42c1d63dd98e8b2e6a2f655bdd0821e3)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/config.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/git/config.py b/git/config.py
+index ce307110..7988f5d9 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -876,7 +876,7 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+         value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+-        self.set(section, option, value_str)
++        super().set(section, option, value_str)
+         return self
+ 
+     @needs_values
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index cbc1be8771..3b0f7f96e7 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -18,6 +18,8 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-42215_p3.patch \
            file://CVE-2026-44243_p1.patch \
            file://CVE-2026-44243_p2.patch \
+           file://CVE-2026-44244_p1.patch \
+           file://CVE-2026-44244_p2.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


