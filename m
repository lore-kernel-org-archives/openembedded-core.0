Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E34C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 17:10:43 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1401.1787159433159982433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 10:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=k1UC7W1r;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8370; q=dns/txt;
  s=iport01; t=1787159433; x=1788369033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uUnlJE8srBk0VgUm7JxfsiVRWs1FFcZx/Xi3JalLWNM=;
  b=k1UC7W1ryy5ZwszdbWfg5c8kQ6ftvpdOgjyifUMAcrhgZXK8adTum2ZD
   kRO7nNBXpQkn9LnFZO8bkLf3qdsCIcwl6uOzazypm1cEn05QfB1eKvUNB
   9eaXe0vZoEkrfAqk0QOTB8ymgxiu9iQFx9B/FZwtQol3hs2bDlhlkvOPl
   qfiRHcXQ1xkEzngwDHiXElrIsg6HhjpbWvpT6NrQR3bZfPLxlPvZh4TJA
   uS/vuJ0CEN+fvVfY6N9MQJIk5VTzXmWFwkD+QLseyiz0z+Ld3CkQcxRBv
   /aGHM74Z63FbdMpjaZsxy4OdUovMoNo6SUsowDBk+LwrQ+E9wRTMfSd96
   Q==;
X-CSE-ConnectionGUID: /JOGz9UfR/irLNfbusQhrg==
X-CSE-MsgGUID: njhUEpR5SrKTP5XfhTgwcQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgD84oVq/5AQJK1aglmCV3ReQ0kDlkcDnhuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjWsCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEcQagXkzgQGDK?=
 =?us-ascii?q?AE/AkNQ2zABCxQBgTiFP4giXRgBRIQ4JxsbgXKBFYNpgQWBXAEBgUyGWQSCI?=
 =?us-ascii?q?noSgVqBLZA8SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BK?=
 =?us-ascii?q?IQ3Ixk2fIEJXoErKmEBEheBCYIKAoJwggYCAUlFDgkMCxgNSBEsNxQZBD5uB?=
 =?us-ascii?q?45KIIF+LSABgQ0BCiGBTaQ0giGhDwoog3aMIZU6GjOqbAuYfY4KlTuBFYRpg?=
 =?us-ascii?q?Wg8gUcLB3AVO4JnCUoZD444g2uBf4NlxlUnMgIGAzIBAQcCBw4DC4FokX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:tl4/6a6iOul2ctFu9evmbQxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jFKWj3SMvaCYGrwfIokPovk/UgPv8KHmtcxT1c5/i83Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNuvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eeq8/1fQmPG90s
 v0CDBYDZA2YvuKsz+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0En1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FYIOJIoDVHZ0J9qqej
 mTE/1nUGitHD8a89QLYwnysuuDQlhquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjdCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1qt94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:qmmqXaN7XtvvW8BcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZq/z/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: 9a23:RWuJbmHMdzCM78EaqmIg1mk7CJEYfEeazW30BUGyFH1QSKeaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AFrDPZA8tqUWPca4O54V9hleQf8Fq45mDEHpQqo8?=
 =?us-ascii?q?lh/HZBSJwBziChw3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="814047004"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 17:10:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 106C1180001E6;
	Wed, 19 Aug 2026 17:10:32 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id A2D6ACCD9B2; Wed, 19 Aug 2026 10:10:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 2/4] python3-git: fix CVE-2026-42215
Date: Wed, 19 Aug 2026 10:10:23 -0700
Message-ID: <20260819171026.750280-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260819171026.750280-1-dkelaiya@cisco.com>
References: <20260819171026.750280-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 17:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243777

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream 3.1.47 backport for
CVE-2026-42215. The upstream fix merge is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commits are referenced in [3], [4], and [5].

[1] https://github.com/gitpython-developers/GitPython/commit/0f68db0710f9125762fca5dbc2328593537ae923
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-42215
[3] https://github.com/gitpython-developers/GitPython/commit/142195888e713542189533a52cdfc333f05c3af6
[4] https://github.com/gitpython-developers/GitPython/commit/9aed7cf8c20f69effcfcf7ebef09f312f73ab826
[5] https://github.com/gitpython-developers/GitPython/commit/43d92dec4683568d11495956dd556161f17c3ea8

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-git/CVE-2026-42215_p1.patch       | 61 +++++++++++++++++++
 .../python3-git/CVE-2026-42215_p2.patch       | 31 ++++++++++
 .../python3-git/CVE-2026-42215_p3.patch       | 47 ++++++++++++++
 .../python/python3-git_3.1.42.bb              |  3 +
 4 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p3.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
new file mode 100644
index 0000000000..9d5f10c694
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
@@ -0,0 +1,61 @@
+From 341a49149a37762e12b10eb70605b54f4abfb54d Mon Sep 17 00:00:00 2001
+From: w <w@mac.lan>
+Date: Mon, 20 Apr 2026 23:29:50 -0400
+Subject: [PATCH] Block unsafe underscored git kwargs / Fix for
+ GHSA-rpm5-65cw-6hj4
+
+CVE: CVE-2026-42215
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/142195888e713542189533a52cdfc333f05c3af6]
+
+Backport Changes:
+- Omit regression tests because the Scarthgap PyPI source
+  archive does not include the upstream test suite.
+
+(cherry picked from commit 142195888e713542189533a52cdfc333f05c3af6)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/cmd.py | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index f58e6df5..874acb43 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -540,6 +540,12 @@ class Git(LazyMixin):
+                 f"The `{protocol}::` protocol looks suspicious, use `allow_unsafe_protocols=True` to allow it."
+             )
+ 
++    @classmethod
++    def _canonicalize_option_name(cls, option: str) -> str:
++        """Normalize an option or kwarg name for unsafe-option checks."""
++        option_name = option.lstrip("-").split("=", 1)[0].split(None, 1)[0]
++        return dashify(option_name)
++
+     @classmethod
+     def check_unsafe_options(cls, options: List[str], unsafe_options: List[str]) -> None:
+         """Check for unsafe options.
+@@ -547,15 +553,14 @@ class Git(LazyMixin):
+         Some options that are passed to `git <command>` can be used to execute
+         arbitrary commands, this are blocked by default.
+         """
+-        # Options can be of the form `foo` or `--foo bar` `--foo=bar`,
+-        # so we need to check if they start with "--foo" or if they are equal to "foo".
+-        bare_unsafe_options = [option.lstrip("-") for option in unsafe_options]
++        # Options can be of the form `foo`, `--foo`, `--foo bar`, or `--foo=bar`.
++        canonical_unsafe_options = {cls._canonicalize_option_name(option): option for option in unsafe_options}
+         for option in options:
+-            for unsafe_option, bare_option in zip(unsafe_options, bare_unsafe_options):
+-                if option.startswith(unsafe_option) or option == bare_option:
+-                    raise UnsafeOptionError(
+-                        f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
+-                    )
++            unsafe_option = canonical_unsafe_options.get(cls._canonicalize_option_name(option))
++            if unsafe_option is not None:
++                raise UnsafeOptionError(
++                    f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
++                )
+ 
+     class AutoInterrupt:
+         """Process wrapper that terminates the wrapped process on finalization.
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
new file mode 100644
index 0000000000..93a5964221
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
@@ -0,0 +1,31 @@
+From aff283771565fc5f5fb41d4f06fb9ad5a9926c18 Mon Sep 17 00:00:00 2001
+From: w <w@mac.lan>
+Date: Mon, 20 Apr 2026 23:43:59 -0400
+Subject: [PATCH] linter fix
+
+CVE: CVE-2026-42215
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/9aed7cf8c20f69effcfcf7ebef09f312f73ab826]
+
+(cherry picked from commit 9aed7cf8c20f69effcfcf7ebef09f312f73ab826)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/cmd.py | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 874acb43..69756216 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -558,9 +558,7 @@ class Git(LazyMixin):
+         for option in options:
+             unsafe_option = canonical_unsafe_options.get(cls._canonicalize_option_name(option))
+             if unsafe_option is not None:
+-                raise UnsafeOptionError(
+-                    f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
+-                )
++                raise UnsafeOptionError(f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it.")
+ 
+     class AutoInterrupt:
+         """Process wrapper that terminates the wrapped process on finalization.
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p3.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p3.patch
new file mode 100644
index 0000000000..cef3fe6b01
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p3.patch
@@ -0,0 +1,47 @@
+From 3385ff27397b58288d922838e8d2eae87d7534fd Mon Sep 17 00:00:00 2001
+From: w <w@mac.lan>
+Date: Tue, 21 Apr 2026 12:03:20 -0400
+Subject: [PATCH] git.cmd: harden unsafe option canonicalization and isolate
+ push test cases
+
+CVE: CVE-2026-42215
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/43d92dec4683568d11495956dd556161f17c3ea8]
+
+Backport Changes:
+- Omit regression test updates because the Scarthgap PyPI
+  source archive does not include the upstream test suite.
+
+(cherry picked from commit 43d92dec4683568d11495956dd556161f17c3ea8)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/cmd.py | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 69756216..73b4c052 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -542,9 +542,18 @@ class Git(LazyMixin):
+ 
+     @classmethod
+     def _canonicalize_option_name(cls, option: str) -> str:
+-        """Normalize an option or kwarg name for unsafe-option checks."""
+-        option_name = option.lstrip("-").split("=", 1)[0].split(None, 1)[0]
+-        return dashify(option_name)
++        """Return the option name used for unsafe-option checks.
++
++        Examples:
++            ``"--upload-pack=/tmp/helper"`` -> ``"upload-pack"``
++            ``"upload_pack"`` -> ``"upload-pack"``
++            ``"--config core.filemode=false"`` -> ``"config"``
++        """
++        option_name = option.lstrip("-").split("=", 1)[0]
++        option_tokens = option_name.split(None, 1)
++        if not option_tokens:
++            return ""
++        return dashify(option_tokens[0])
+ 
+     @classmethod
+     def check_unsafe_options(cls, options: List[str], unsafe_options: List[str]) -> None:
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index c294b23112..4102a2273a 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -13,6 +13,9 @@ PYPI_PACKAGE = "GitPython"
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://CVE-2026-42284.patch \
+           file://CVE-2026-42215_p1.patch \
+           file://CVE-2026-42215_p2.patch \
+           file://CVE-2026-42215_p3.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


