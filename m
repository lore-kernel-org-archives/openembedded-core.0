Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8008.1795062166792664573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YKmATiBp;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7017; q=dns/txt;
  s=iport01; t=1795062166; x=1796271766;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=t4SvhBnaMSj57Hp56get3m0R/OUafEUuiWKWT+dSkeM=;
  b=YKmATiBpVZpmrR4YbXZIbvtaE9ilisiPObQApfAXUMeox7EX6nV0N0oY
   iD6Poq759YnShBx9cJ5gLRSwUuVkscDcNm+E1zL5lbjju0fUU3YRVNMwe
   xxUBBBZqR+YQeXFyk4ZzTdKyvgsy2G7wsbhwb6U61gZhzlm2QPjRSvWDx
   qEjRNOK4D+gAryXsFP+uc6T4x7qF7JbndBfjiyB09GOWOqcGpu02S7wwN
   yDVIYrKe0AFSky9ArIC9OOp77kx6igkyD59vMGYgH10ekPf+b2mQ8ijKc
   mZrwmDp+AAyauB/ZvXGtL26WKt/Y2KfoWkstH6jQ3sRTvHLpZZvAhuoAe
   w==;
X-CSE-ConnectionGUID: FUTvugn4SBS65Vpk3haJng==
X-CSE-MsgGUID: Re6ws7aMQrOz8oDt9uh6jw==
X-IPAS-Result: =?us-ascii?q?A0BMAgDWd/5q/8tK/pBaglmCV3VgQ0kDhFSPU4IhA54pF?=
 =?us-ascii?q?IFqDwEBAQ9EDQQBAYQ/RgKOIAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMjBAsBGAE9HAMBAgMCJgICKyMIGYMCAYI6A?=
 =?us-ascii?q?zcDEbk1en8zgQGDKQE/AkNQ2EwQb4FoAQsUAYEKLoVCgyABhQNdGAFEhDknG?=
 =?us-ascii?q?4FJRIEVg2qBBYFcAQGBRoN2gmoEgxwSgVSBAowVAoFPgUaGREiBAhwDWSwBV?=
 =?us-ascii?q?RMNCgsHBYFoAzUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BKyheIYEIgXYCg?=
 =?us-ascii?q?lGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0Md?=
 =?us-ascii?q?DkQMB4kLwUaJj4bCoEMJx8eGw4CDhgNSBEsNxUZBD0BbgeTUYJLCDMSASwQU?=
 =?us-ascii?q?QEKIYIUGKV1n1OBPoQrjCSVOhozqnILmH2OCpU8gRWEaoFoPIFHCwczGggbF?=
 =?us-ascii?q?TuCZwlKGQ+OOYNrgX+DZcZaJjICBgMDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:AbRTfaIUO19mVEFDFE+Rm5QlxSXFcZb7ZxGr2PjKsXjdYENS3zRSm
 mFNCDvQOayNZTagL910Od639hgAuMPWm9ZrTwQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmckajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1AMX0oIIIept1dOj8Ty
 +QbczAETBaM0rfeLLKTEoGAh+wqIdOuOMYUvWttiGmDS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3N3wsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237kV0ojuSya4a9ltqif8gLgV3Hr
 0f/5UPrUhY2KI2CyWSH7Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVnXjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:193tt6GiorqyASJxpLqEyseALOsnbusQ8zAXPidKOHtom62j5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:a7KeOWHvFCGE2dFDqmJJyXIKB88jLkb39ymNHVe7UmZgaruaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3ARBAeVA/SG2+29l4Odt6GxoyQf/1lvbu1V0koqI8?=
 =?us-ascii?q?hqZmDGTAhJjfDjiviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59164734"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:44 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 56A211800015B
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:44 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 06372CBF204; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 04/27] python3-git: fix CVE-2026-67324
Date: Wed, 18 Nov 2026 20:22:19 -0800
Message-Id: <20261119042242.1640611-5-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250610
Content-Type: text/plain; charset="utf-8"

Upstream commit [1] adds joined-short-option parsing, including
clustered forms such as -fuVALUE, while preserving safe attached
values. This behavior matches CVE-2026-67324's description [2] and
the upstream advisory [3]. The commit also adjusts clone-option
handling to preserve long-option abbreviation checks.

This patch follows the earlier backport that adds default unsafe-option
validation. It closes the joined short-option bypass in that validation.
The published affected range names GitPython 3.1.50; this patch completes
the validation guard when the full series is applied to Wrynose’s 3.1.43
source, rather than asserting that unmodified 3.1.43 is in that range.

[1] https://github.com/gitpython-developers/GitPython/commit/56806080c1348749b07daa4a2024ce47b3cad285
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-67324
[3] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-v396-v7q4-x2qj

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
-  Refreshed patch context and removed trailing whitespace.
---
Changes in v3:
- Added rationale explaining that this patch completes the joined
  short-option guard introduced earlier in the series for GitPython 3.1.43;
  the published affected range names GitPython 3.1.50.
---
 .../python/python3-git/CVE-2026-67324.patch   | 94 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch
new file mode 100644
index 0000000000..73722344c1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch
@@ -0,0 +1,94 @@
+From b09720b6f8311edac108392bd834e74918836c4f Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 12 Jul 2026 14:12:16 +0200
+Subject: [PATCH] fix: reject joined unsafe short options
+
+GitPython blocks options such as --upload-pack/-u and --config/-c
+because they can execute arbitrary commands unless unsafe options are
+explicitly allowed. Git also accepts a short option with its value
+joined to the same token, including after clusterable flags. Forms
+such as -uVALUE, -fuVALUE, -cVALUE, and -vcVALUE could therefore
+bypass an exact-token check.
+
+Parse single-dash option tokens sufficiently to recognize blocked
+short options while preserving safe attached values such as
+-oupstream. Also distinguish clone multi-option values from bare
+kwargs so positional values are not treated as long-option
+abbreviations.
+
+This completes the option-validation hardening for
+GHSA-2f96-g7mh-g2hx.
+
+CVE: CVE-2026-67324
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/56806080c1348749b07daa4a2024ce47b3cad285]
+
+Backport Changes:
+- Omitted test/test_clone.py, test/test_git.py, test/test_remote.py
+  because the current PyPI source archive does not include the test
+  suite and the python3-git recipe does not run it.
+
+Reviewed-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 56806080c1348749b07daa4a2024ce47b3cad285)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 40 ++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 36 insertions(+), 4 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 523029fc..75495dc1 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -734,8 +734,21 @@
+     @classmethod
+     def check_unsafe_options(cls, options: List[str], unsafe_options: List[str]) -> None:
+-        """Check for unsafe options.
+-
+-        Some options that are passed to ``git <command>`` can be used to execute
+-        arbitrary commands. These are blocked by default.
++        """Raise :class:`~git.exc.UnsafeOptionError` for blocked option spellings.
++
++        In addition to exact matches, this rejects abbreviated long options accepted
++        by Git (for example, ``--upl`` for ``--upload-pack``) and unsafe short options
++        whose values are joined to the same token, including after clusterable flags
++        (for example, ``-uVALUE`` and ``-fuVALUE``).
++
++        A list containing only bare names is treated as normalized keyword arguments,
++        so multi-character names such as ``upload_p`` are checked as long-option
++        abbreviations. If any item starts with ``-``, the list is treated as tokenized
++        command-line input: bare items can be option values and are not checked as
++        abbreviations. Thus ``["--origin", "upload"]`` is allowed. Single-dash options
++        use short-option parsing rather than broad prefix matching, preserving safe
++        attached values such as ``-oupstream`` and ``-bcurrent``.
++
++        Some options passed to ``git <command>`` can execute arbitrary commands and
++        are therefore blocked by default unless the caller explicitly allows them.
+         """
+         # Options can be of the form `foo`, `--foo`, `--foo bar`, or `--foo=bar`.
+@@ -747,4 +760,13 @@
+         # only.
+         canonical_unsafe_options = {cls._canonicalize_option_name(option): option for option in unsafe_options}
++        unsafe_short_options = {
++            canonical: option
++            for canonical, option in canonical_unsafe_options.items()
++            if option.startswith("-") and not option.startswith("--") and len(canonical) == 1
++        }
++        # These value-less Git flags can be clustered before another short option
++        # (for example, ``-fuVALUE``). Stop at any other character because it may
++        # begin an attached value, as ``o`` does in the safe option ``-oupstream``.
++        clusterable_short_options = frozenset("46flnqsv")
+         options_are_kwargs = all(not option.startswith("-") for option in options)
+         for option in options:
+@@ -757,3 +779,13 @@
+                 raise UnsafeOptionError(f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it.")
++            option_token = option.split("=", 1)[0].split(None, 1)[0]
++            if option_token.startswith("-") and not option_token.startswith("--"):
++                for option_char in option_token[1:]:
++                    unsafe_option = unsafe_short_options.get(option_char)
++                    if unsafe_option is not None:
++                        raise UnsafeOptionError(
++                            f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
++                        )
++                    if option_char not in clusterable_short_options:
++                        break
+             if not (option.startswith("--") or (options_are_kwargs and len(candidate) > 1)):
+                 continue
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 76a21c670f..ca2efce37e 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-67323.patch \
            file://CVE-2026-67325_p1.patch \
            file://CVE-2026-67325_p2.patch \
+           file://CVE-2026-67324.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

