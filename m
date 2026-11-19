Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8016.1795062171745616482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Oq04+onP;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5868; q=dns/txt;
  s=iport01; t=1795062173; x=1796271773;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/HyuV6glQavj7fkTyvMPbNmDqL2EuLJlmMGnhYtn1HY=;
  b=Oq04+onPVX6zisyiYSKx1ZC7CUKlXRY9MywUW3hkjX495B7yeNUEXP0j
   r0t8W+VpcD7MEs9Zn1AbzPvJ2/vZX+gRCQf/YJFfU0F7NshP/vJREv6cm
   TD+2tdMmjtlW3x5JhOzgHaHPeQ55GIQZgTyxEksGF3IBYC0meahcTecbV
   WFnT6z6GuFi+y/soQzNQS2K8ctrghz6UrEyZgxRAjzmeTdeFF9qG6aCz4
   ul+C9XJAkaJs+0nHvTRnG7mAzn6oQ7DPk52YeAQiaQjfnwJxijcLe8BVv
   Yo8eGM86JHBTqVdoLCUcg7ieK0EQ9L9tzNbXSZwKQi84NT28Ow3jySiQy
   w==;
X-CSE-ConnectionGUID: jLolQ4SgTEO08b5aKdi14Q==
X-CSE-MsgGUID: 2YXiAyz1Re+20Vzc4IO0XQ==
X-IPAS-Result: =?us-ascii?q?A0AaAAAlef5q/89K/pBaHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJA4xvhziCIQOeKYF+DwEBAQ9EDQQBAYQ/RgKOIAImNAkOA?=
 =?us-ascii?q?QIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYA?=
 =?us-ascii?q?T0cAwECLysjCBmDAgGCOgM3AxG5NIF5M4EBgmZDAT8CAkABUNhMEG+BaAELF?=
 =?us-ascii?q?AGBOAGFQYgkXRgBRIQ5JxuBSUSEf4EFgVwCAoElhn8EgxwSgVSNFwKBT4gKS?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoX?=
 =?us-ascii?q?iGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLG?=
 =?us-ascii?q?gVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAg4YDUgRLDcVGQQ+bgeTUYIlJ?=
 =?us-ascii?q?k09JC0BKxcvgWZOkmkBOY9jgiGBNZ9chCuMJJU6GjOFW6UXC5h9jgqWUYRqg?=
 =?us-ascii?q?Wg8gVkzGggbFYMiCUoZD44rDguDYIUTUcZaJjICCQMvAQEHAgcOAwuBaIRhi?=
 =?us-ascii?q?x8CJgeBTwEB?=
IronPort-Data: A9a23:qR+4iqknrgCVPepmA8Ix04vo5gzLJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLUWmPOfjcMGqmKop3Pdi3pkwBv5TcydA1HQBtqCFkRltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsvLb83uDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FY88/eJOXVpBy
 dE/cGAHMxmgi+PvnIvuH4GAhux7RCXqFIoSoDRkiDreF/tjGc6FSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUUQUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwYYGJJILRHK25mG7Cl
 1LH1nXrWysXd4bH9yiOrlOL3t/2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:ZQZP8qgVnoQaIkyriCs4Z3prznBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:SnjGZmwA32w3ADpc8CwVBgUWPschSyHmw0v9BBfoAztga7GUEAOprfY=
X-Talos-MUID: 9a23:WGi0EgT0x5d6xpoORXS2tQFjHdZ6up6jSxpVr4cN5+ijbRxJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59346631"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:44 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id 4F7F5180001F6
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:44 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id E38D1CBF201; Wed, 18 Nov 2026 20:22:42 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 01/27] python3-git: fix CVE-2026-67326
Date: Wed, 18 Nov 2026 20:22:16 -0800
Message-Id: <20261119042242.1640611-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250635
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
2.35.6

