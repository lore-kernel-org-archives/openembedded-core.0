Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7337.1793976214149599703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=R9Y+PkW1;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7171; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dSSe1VBHmKiPBi/yFt4xxsEyCT2xDHF1UBNinPP5rVY=;
  b=R9Y+PkW1W6lXRvBv762JXcNKFsBsqgb8oxtNVdnDqeedk+ZX1FSpaBSQ
   XUpGWGfLAU7qg+Gss22TlS9KTVGJJ1K23bUbwWk2i0NXQ2e64ofqUXJD7
   WaRl+fAiLSLFjLtW1BzOrw71tQIBB/fipUODCCIzAQ9TVWKpLEcVRhe1v
   4blrYz5bpzv6bh2by3ahr38FxqkTeP2G0VebG8hp22dS26JTqx9LahyzI
   nxlx2p2FMN4iU0dZd1ukr7eXTwo8UCjNshmd6yPqE6Z/47iZlrehvUg8o
   2BeQp0aePetGtStgru3sUUQeEIxMcPEq6naYcDJO5R31C9sr/Ss6SpULC
   A==;
X-CSE-ConnectionGUID: APXNeR1ESCKynszTeL/CAA==
X-CSE-MsgGUID: MCM3AdIKRzepXtYXrovgbw==
X-IPAS-Result: =?us-ascii?q?A0BYAACS5u1q/5D/Ja1aHQEBAQEJARIBBQUBgX4GAQsBg?=
 =?us-ascii?q?lZ1YENJA5QngiEDi2WSPIF+DwEBAQ9EDQQBAYQ/RgKOHQImNgcOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECL?=
 =?us-ascii?q?yALIwgZgwIBgjoDNwMRvEWBeTOBAYMpAT8CQ1DYTA0Db4FoAQsUAYE4AYVBg?=
 =?us-ascii?q?wCFJF0YAUSEOScbgUlEhH6BBYEaQgEBgSeGfwSDHBKBWoEDjBUCgVGGeUiBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF4hg?=
 =?us-ascii?q?QiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFY?=
 =?us-ascii?q?QgCDQx0ORAwHiQvBRwmPhsKLxgNSBEsNxUZBD5uB5I9giAlTQEsEFEBCiGBV?=
 =?us-ascii?q?T6UCo9kgiGBNZ5rcYQqjCSPPoV8GjOqcQuYfY4KhAqRMi1ohGmBbwUwgUcLB?=
 =?us-ascii?q?zMaCBsVO4JnCUoZD445g2uBf4NlxggmMgIGAzIBAQcCBw4DC4FokAACJgeBT?=
 =?us-ascii?q?wEB?=
IronPort-Data: A9a23:S36Pm6hmC878UJAGHWkex4wFX161NxEKZh0ujC45NGQN5FlHY01je
 htvXGDQOP/YY2L8e94kbIzg8U0DusCEn4djTVM+qC00QiJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvre8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUxwtZRDFsX2
 MczCyELdQK/isbx65uSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgt/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeOJI3THZgOxy50o
 Erj1EGiKx07F+aNxCK17kOcnOjRkinkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:74jpoq1fNa40t1qV+ej1HAqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AZ2H6aGubRLih4/ZTywue9m706IsMSk37wU2JDnS?=
 =?us-ascii?q?TKndvU6+pRHvX04pNxp8=3D?=
X-Talos-MUID: 9a23:LGzYRwhlHz7ygfnWk5a6HcMpEexNuI2iKWM3g5gei9W1BTZ3JTiXk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="536910531"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 13F53180003C1
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id AF865CBF203; Fri,  6 Nov 2026 06:43:32 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 03/27] python3-git: Fix CVE-2026-67325
Date: Fri,  6 Nov 2026 06:43:07 -0800
Message-Id: <20261106144331.3354811-4-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249665
Content-Type: text/plain; charset="utf-8"

CVE-2026-67325 concerns bypasses using abbreviated long options.
Commit [1] introduces rejection of those abbreviations, and [2]
refines that check. The CVE description is in [3].

[1] https://github.com/gitpython-developers/GitPython/commit/2ab051697940144545a14d2f4a639c6409c3187f
[2] https://github.com/gitpython-developers/GitPython/commit/181e8ede7543dbbdcee92756cea260f675316c63
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-67325

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Kept p1's UnsafeOptionError raise in upstream's multi-line form.
- Formatted p2's exact-match UnsafeOptionError raise on one line to match
  upstream.
---
 .../python3-git/CVE-2026-67325_p1.patch       | 49 +++++++++++++++++
 .../python3-git/CVE-2026-67325_p2.patch       | 52 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  2 +
 3 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch
new file mode 100644
index 0000000000..4c1f3195d9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch
@@ -0,0 +1,49 @@
+From 048f65847761514ebccf3cd8a889fef7a0068c07 Mon Sep 17 00:00:00 2001
+From: abhiprd2000 <8292aniarc@gmail.com>
+Date: Thu, 9 Jul 2026 21:22:50 +0530
+Subject: [PATCH] Reject abbreviated forms of unsafe git options
+
+CVE: CVE-2026-67325
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/2ab051697940144545a14d2f4a639c6409c3187f]
+
+Backport Changes:
+- Omitted test/test_clone.py because the current PyPI source
+  archive does not include the test suite and the python3-git
+  recipe does not run it.
+
+(cherry picked from commit 2ab051697940144545a14d2f4a639c6409c3187f)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 87866be2..f8fead70 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -739,13 +739,20 @@ Git.check_unsafe_options
+         arbitrary commands. These are blocked by default.
+         """
+         # Options can be of the form `foo`, `--foo`, `--foo bar`, or `--foo=bar`.
++        # Git accepts any unambiguous prefix of a long option, so an abbreviated
++        # spelling such as `--upl` for `--upload-pack` must be rejected too. An
++        # option is unsafe if its canonical name is a prefix of any blocked
++        # option's canonical name.
+         canonical_unsafe_options = {cls._canonicalize_option_name(option): option for option in unsafe_options}
+         for option in options:
+-            unsafe_option = canonical_unsafe_options.get(cls._canonicalize_option_name(option))
+-            if unsafe_option is not None:
+-                raise UnsafeOptionError(
+-                    f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
+-                )
++            candidate = cls._canonicalize_option_name(option)
++            if not candidate:
++                continue
++            for canonical, unsafe_option in canonical_unsafe_options.items():
++                if canonical.startswith(candidate):
++                    raise UnsafeOptionError(
++                        f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
++                    )
+ 
+     @classmethod
+     def _option_candidates(cls, args: Sequence[Any] = (), kwargs: Optional[Mapping[str, Any]] = None) -> List[str]:
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch
new file mode 100644
index 0000000000..65a914f0a0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch
@@ -0,0 +1,52 @@
+From 6de6760007664e5e9178b98e616d0b9edc959a53 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 12 Jul 2026 13:45:42 +0200
+Subject: [PATCH] Address review feedback about unsafe option abbreviations
+
+The prefix check could reject otherwise allowed one-letter short options when an unrelated blocked long option began with the same character. Keep exact matches for every spelling, but restrict prefix matching to explicit long options and multi-character kwargs.
+
+This addresses the review comment: single-letter short options and kwargs must not be treated as long-option abbreviations. It also adds coverage for abbreviated unsafe kwargs so both clone validation paths remain protected.
+
+CVE: CVE-2026-67325
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/181e8ede7543dbbdcee92756cea260f675316c63]
+
+Backport Changes:
+- Omitted test/test_clone.py, test/test_git.py because the current
+  PyPI source archive does not include the test suite and the
+  python3-git recipe does not run it.
+
+Reviewd-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 181e8ede7543dbbdcee92756cea260f675316c63)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index cd22aa83..3b97871e 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -742,14 +742,22 @@ Git.check_unsafe_options
+         # Git accepts any unambiguous prefix of a long option, so an abbreviated
+         # spelling such as `--upl` for `--upload-pack` must be rejected too. An
+         # option is unsafe if its canonical name is a prefix of any blocked
+-        # option's canonical name.
++        # option's canonical name. Only long options and multi-character kwargs
++        # can be abbreviations; single-character short options remain exact-match
++        # only.
+         canonical_unsafe_options = {cls._canonicalize_option_name(option): option for option in unsafe_options}
++        options_are_kwargs = all(not option.startswith("-") for option in options)
+         for option in options:
+             candidate = cls._canonicalize_option_name(option)
+             if not candidate:
+                 continue
++            unsafe_option = canonical_unsafe_options.get(candidate)
++            if unsafe_option is not None:
++                raise UnsafeOptionError(f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it.")
++            if not (option.startswith("--") or (options_are_kwargs and len(candidate) > 1)):
++                continue
+             for canonical, unsafe_option in canonical_unsafe_options.items():
+                 if canonical.startswith(candidate):
+                     raise UnsafeOptionError(
+                         f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
+                     )
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 72eb073196..76a21c670f 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -23,6 +23,8 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-44244_p2.patch \
            file://CVE-2026-67326.patch \
            file://CVE-2026-67323.patch \
+           file://CVE-2026-67325_p1.patch \
+           file://CVE-2026-67325_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

