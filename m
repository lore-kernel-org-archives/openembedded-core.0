Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8007.1795062166611018283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kg3Gb1aX;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7171; q=dns/txt;
  s=iport01; t=1795062166; x=1796271766;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Re+yS0slAdNYA7yAbuwMhTPHXUk+mETvg0uolDlAuKs=;
  b=kg3Gb1aX2ZxmFpsJdRE9zR2SCpKBsJkJjXGq7g/WzUoJWwC38WSvBecp
   BzurnJxMbFhetWB9tr9QnvKFiiQOyvIHZarWR1UQXWwsNhH5CPOVg2vGA
   DfgdYDQsMpsVcOQ9A/zamvGs9MyOONNqduoGfgz2BfZwF//lTLnuVeJFI
   aN2E9/R6TJmzUCB6Pq328YxhVDYUBlhaIFgJwWuT/hFamRlQar/2K6TC1
   gKVpO8RVPj88HDDdA+SozYEgvL03lmz4Io3nNXy4huri6/AbyOarziIko
   V4AuxQjUfuaPUm6wPdTxB1lEXkPcSSFtaUyErLFf+PUUBFVoBv9ircIgp
   g==;
X-CSE-ConnectionGUID: ro55pDDRRziqgCKtM/ofFA==
X-CSE-MsgGUID: wFi1jFTFSDuKRRV8Snh4LA==
X-IPAS-Result: =?us-ascii?q?A0BRAgDWd/5q/8xK/pBaglmCV3VgQ0kDlCeCIQOLZpJDg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD9GAo4gAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvIAsjCBmDAgGCOgM3AxG5N?=
 =?us-ascii?q?YF5M4EBgykBPwJDUNhMDQNvgWgBCxQBgTiFQoMAhSRdGAFEhDknG4FJRIR/g?=
 =?us-ascii?q?QWBGkIBAYEnhn8EgxwSgVSBAowVAoFPiApIgR4DWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTC?=
 =?us-ascii?q?SVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bC?=
 =?us-ascii?q?oEMJx8eGw4CDhgNSBEsNxUZBD5uB5NRgiYlTQEsEFEBCiGBVT6UCo9jgiGBN?=
 =?us-ascii?q?Z5rcYQrjCSPPoV8GjOqcguYfY4KhAqRMi1ohGqBaDyBRwsHMxoIGxU7gmcJS?=
 =?us-ascii?q?hkPjjmDa4F/g2XGWiYyAgYDMgEBBwIHDgMLgWiQAAImB4FPAQE?=
IronPort-Data: A9a23:Friu+aAvXLC7XxVW/2Piw5YqxClBgxIJ4kV8jS/XYbTApGsn3zwEy
 TYYXmjXP/nfYWX3fowgaI6w80wFvpOEmNJqOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb8i2YvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2fIzUVkaEbci6OduDkpt6
 dlfLz4jR0XW7w626OrTpuhEj8k5ac2uN4QFtzQ4lnfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWYHgBfoO3WjPn8GFYg3kOqAjXjkeDoeo1WQzUYyyzaJklctjuO0WDbTUsOkRJxXsHq2n
 U7b3F7DPEEhMtzD7RPQpxpAgceKx0sXQrk6E6W18PNvilCfymEfTRYRT1aTpfiillX4XMpSL
 UER8CcioaU+skuxQbHAswaQqXOe+xpZUN1KHqhis0eGy7Hf5ECSAW1soiN9VeHKffQeHVQCv
 mJlVfuwbdCzmNV5kU6gy4o=
IronPort-HdrOrdr: A9a23:PAeyw6ieBW3XNpoXY0GuuMfBzXBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:v8zGGWCXEaRMH5n6EzNgqRMMNuwfSG/c1Xj7AFOdTmFnZpTAHA==
X-Talos-MUID: 9a23:5TGSBQhPlovdBBGVm41z8sMpK+lpuqaANG42vYglgfO6ZRd2O2u5pWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="62634631"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:44 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 5B79B180006D7
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:44 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id F2AF8CBF203; Wed, 18 Nov 2026 20:22:42 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 03/27] python3-git: Fix CVE-2026-67325
Date: Wed, 18 Nov 2026 20:22:18 -0800
Message-Id: <20261119042242.1640611-4-yurade@cisco.com>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250609
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
2.35.6

