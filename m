Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7336.1793976213937852288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fTtdy/JP;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5868; q=dns/txt;
  s=iport01; t=1793976213; x=1795185813;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fj+1KrJqVNrM7FeCeSyRT80Rx34BzGULroW802BoQAI=;
  b=fTtdy/JPVhxgEGooywkmw+Nt15Awfd4PwasNmnOnQkU055GnlGTCULNi
   Tzf1YmsllcyXW0i6bAlhoBfg4sC1f6d1FR2A/ySfWrfPMqfKXDBNWXa2Y
   8hN+tHDgFNpBD0lJNni8en2auCNgGSR2YKUILG/khbe2yV6zr2vJmM2mm
   /a1B0++81M9xht7mEKR0UrBYCw0761jVm827Kwd1syI7DxBHYzlilX3pV
   qc4dneq4wglJ2qLAyv8wRcFK2lLKTxyIZSwfNQkUo346Xjw+yisqt4JCV
   WKSgQb03HKdg1mb44Ioqp1PKcpAOitpmzVJjD8UcDfvSyPb7sag2PthKm
   A==;
X-CSE-ConnectionGUID: v+wLQFgXSSml1EzZpl4QWw==
X-CSE-MsgGUID: EqO+aqObQ9KXgOXXAsJwyw==
X-IPAS-Result: =?us-ascii?q?A0AaAAAQ5u1q/5X/Ja1aHAECAgEHARQBBAQBgX0HAQwBg?=
 =?us-ascii?q?lZ1YENJA4xvhziCIQOeIYF+DwEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECL?=
 =?us-ascii?q?ysjCBmDAgGCOgM3AxG8P4F5M4EBgmZDAT8CAkABUNhMEG+BaAELFAGBOAGFQ?=
 =?us-ascii?q?YgkXRgBRIQ5JxuBSUSEfoEFgVwCAoElhn8EgxwSgVqNGAKBUYZ5SIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoXiGBCIF2A?=
 =?us-ascii?q?oJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAIND?=
 =?us-ascii?q?HQ5EDAeJC8FHCY+GwovGA1IESw3FRkEPm4Hkj2CHyZNPSQtASsXL4FmTpJpA?=
 =?us-ascii?q?TmPZIIhgTWfXIQqjCSVOhozhVulFguYfY4KllGEaYFoPIFZMxoIGxWDIglKG?=
 =?us-ascii?q?Q+OKw4Lg2CFE1HGCCYyAgkDLwEBBwIHDgMLgWiEYYsfAiYHgU8BAQ?=
IronPort-Data: A9a23:TnlIUaLwb+Qwmv9QFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS3mcPz
 zNKWDjVOP6OY2ekL9B2PNvk/UgOvMDXnYVkTAId+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmYpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1wT14SBKMXyt1MBGUX2
 O4qMDRRVy+c0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAV7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEWojx5nYj/7DLovgf2hinTXeDxDo1XTrq0yi4TW5FEtjeO9boaMKrRmQ+14h2Hbr
 3vh9V2oISEVE+yv4CGn7WOz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:xkKXJq/YqOTuxA/q43duk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:c/AmXG8jvE0/8JjlRs2Vv1BXBeQcXHLt90zVJxaVG1RxTOGsdkDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AkP9HiwwiAkUjPXl0MIwoW3+izcmaqIm3LwMEiLI?=
 =?us-ascii?q?MgpinBSNXCwe0lxaoU5Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545386418"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 098B818000337
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id A184ACBF201; Fri,  6 Nov 2026 06:43:32 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 01/27] python3-git: fix CVE-2026-67326
Date: Fri,  6 Nov 2026 06:43:05 -0800
Message-Id: <20261106144331.3354811-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249663
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/54538428f79b0c91ba52cda5229856a6edf7ac06
[2] https://security-tracker.debian.org/tracker/CVE-2026-67326

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Cleaned whitespace in the Backport Changes note.
---
 .../python/python3-git/CVE-2026-67326.patch   | 107 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch
new file mode 100644
index 0000000000..82fc987fcc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch
@@ -0,0 +1,107 @@
+From 89d7d33485f67d5f25777079797ae6d1a4538f86 Mon Sep 17 00:00:00 2001
+From: "GPT 5.5" <codex@openai.com>
+Date: Tue, 5 May 2026 21:34:42 +0800
+Subject: [PATCH] Validate config key section names before writing
+
+GitConfigParser already rejected CR, LF, and NUL in config values before
+writing, but section and option names could still reach configparser. Because
+GitPython writes section headers itself, a newline-bearing section name could
+split the output into additional headers.
+
+Reject CR, LF, and NUL in section and option names on write paths that create
+or set config keys: add_section(), set(), set_value(), add_value(), and
+rename_section() destinations. This matches Git config key validation behavior;
+Git source commit 94f057755b7941b321fd11fec1b2e3ca5313a4e0 reports invalid keys
+containing newlines from config.c, and local git 2.50.1 rejects newline-bearing
+config keys.
+
+Add a regression test covering unsafe section and option names while preserving
+safe writes.
+
+CVE: CVE-2026-67326
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/54538428f79b0c91ba52cda5229856a6edf7ac06]
+
+Backport Changes:
+- Omitted test/test_config.py because the current PyPI source
+  archive does not include the test suite and the python3-git
+  recipe does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 54538428f79b0c91ba52cda5229856a6edf7ac06)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/config.py | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/git/config.py b/git/config.py
+index 1595d51f..236de3a6 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -71,6 +71,9 @@ class MetaParserBuilder:
+ 
+ See: https://git-scm.com/docs/git-config#_conditional_includes
+ """
++UNSAFE_CONFIG_CHARS_RE = re.compile(r"[\r\n\x00]")
++"""Characters that cannot be safely written in config names or values."""
++
+ 
+ 
+ class MetaParserBuilder(abc.ABCMeta):  # noqa: B024
+@@ -759,6 +762,7 @@ GitConfigParser.add_section
+ 
+     def add_section(self, section: str) -> None:
+         """Assures added options will stay in order."""
++        self._assure_config_name_safe(section, "section")
+         return super().add_section(section)
+ 
+     @property
+@@ -865,9 +869,13 @@ GitConfigParser._value_to_string_safe
+ 
+     def _value_to_string_safe(self, value: Union[str, bytes, int, float, bool]) -> str:
+         value_str = self._value_to_string(value)
+-        if re.search(r"[\r\n\x00]", value_str):
++        if UNSAFE_CONFIG_CHARS_RE.search(value_str):
+             raise ValueError("Git config values must not contain CR, LF, or NUL")
+         return value_str
++    def _assure_config_name_safe(self, name: "cp._SectionName", label: str) -> None:
++        if isinstance(name, str) and UNSAFE_CONFIG_CHARS_RE.search(name):
++            raise ValueError("Git config %s names must not contain CR, LF, or NUL" % label)
++
+ 
+     @needs_values
+     @set_dirty_and_flush_changes
+@@ -877,6 +885,8 @@ GitConfigParser.set
+         option: str,
+         value: Union[str, bytes, int, float, bool, None] = None,
+     ) -> None:
++        self._assure_config_name_safe(section, "section")
++        self._assure_config_name_safe(option, "option")
+         if value is not None:
+             value = self._value_to_string_safe(value)
+         return super().set(section, option, value)
+@@ -901,6 +911,8 @@ GitConfigParser.set_value
+         :return:
+             This instance
+         """
++        self._assure_config_name_safe(section, "section")
++        self._assure_config_name_safe(option, "option")
+         value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+@@ -929,6 +941,8 @@ GitConfigParser.add_value
+         :return:
+             This instance
+         """
++        self._assure_config_name_safe(section, "section")
++        self._assure_config_name_safe(option, "option")
+         value_str = self._value_to_string_safe(value)
+         if not self.has_section(section):
+             self.add_section(section)
+@@ -949,6 +963,7 @@ GitConfigParser.rename_section
+         """
+         if not self.has_section(section):
+             raise ValueError("Source section '%s' doesn't exist" % section)
++        self._assure_config_name_safe(new_name, "section")
+         if self.has_section(new_name):
+             raise ValueError("Destination section '%s' already exists" % new_name)
+ 
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index ebb5e4b442..474206d4ed 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-44243_p2.patch \
            file://CVE-2026-44244_p1.patch \
            file://CVE-2026-44244_p2.patch \
+           file://CVE-2026-67326.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

