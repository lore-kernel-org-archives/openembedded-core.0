Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7520.1793976214416324349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=f/tf+UdJ;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4296; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mwDFEgrJAMK0etOX4nFm87CyxenRljnOMzz7FdZMEBw=;
  b=f/tf+UdJDlO8EmmSXmTWaQOc0xuTKq2NE2L5C57MIjWzd5ZcckkmJNO9
   pQ06ZIiwMf6KK8pecs8zREr5vVNxgj1OvIJr6MGCxeaZO7fMA7JbJJZzZ
   nfg9trFg320yUkogkoNyYzHFyyFTwDgYlA8NOZtpWoe1FLYWJELZ0ZvDH
   hkuSbFaEDqRjJYc/r62AO8re5WLAcDHBJD0vq3gz1lavcu179qXW/Bf54
   BOgYPtzYDzUL4W1T+wUi83aHikqgRP8Jq3zZMIYk96oPwoGvJ6dSY/Z3m
   HwPRl4n3uLbb68V/S96MG7FNSY7gc9vqoKJ6V9oohyAX1k8e+zC5bkMoO
   w==;
X-CSE-ConnectionGUID: NFN3cV9ORfOfjESb9ayiHQ==
X-CSE-MsgGUID: X2cWse9TR5We+h+OzNegfQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgAN5+1q/47/Ja1aglmCV3VgQ0kDlCeCIQOeIRSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDNwMRvE2Be?=
 =?us-ascii?q?TOBAYMpAT8CQ1DYTBBvgWgBCxQBgTiFQogkXRgBhH0nG4FJRIEVg2mBBYFcA?=
 =?us-ascii?q?oFGhmAEgxwSgVqBA4wVAoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQcbBgWBHYEegRKBB12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0MdDkQMB4kLwUcJj4bCi8YDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeSPYJFTQEeHlEBCiGBIIEMkzeSP6ERhCqMJJU6GjOqcQuYfY4Kl?=
 =?us-ascii?q?lGEaYFoPIFZMxoIGxU7gmcJShkPjjmDa4UTUcYIJjICBgMDLwEBBwIHDgMLg?=
 =?us-ascii?q?WiQAi2BTwEB?=
IronPort-Data: A9a23:FhnUBKiRW0+9EWYhqdqlbbG3X161NxEKZh0ujC45NGQN5FlHY01je
 htvWmiAOqnfMGH1L9EkbYrgp0MOu8fQyIA1QQI4/yBgFnhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvre8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU+1MAsCl8f0
 sYWDz4PQyuJ1uunwZKCH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg1/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeOIozWHJUFzi50o
 Er2pW/GGRxLCObC9jfG8jGLlMnCki3CDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBZCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:znFvtqwEKiwpW3j+0yV7KrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3ARyeVN2g/9swtQYov2JYOgZn2qTJuVFP7l3zucmi?=
 =?us-ascii?q?CB0FnSpCuQw6Z6aJEqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ARlD3zA3YzS+3GvP8lF61TvbvJzUj0/6lN1sAwKk?=
 =?us-ascii?q?85vaJdiwzHCW7gTu5e9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="530841888"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id CC61018000377
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 1E85CCBF201; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 15/27] python3-git: fix CVE-2026-76220
Date: Fri,  6 Nov 2026 06:43:19 -0800
Message-Id: <20261106144331.3354811-16-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249674
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/96a888f4d782cb2f80452148e48e60ce4af6d541
[2] https://security-tracker.debian.org/tracker/CVE-2026-76220

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Removed the stale cherry-pick and Signed-off-by trailers and refreshed
  the embedded hunk context.
---
 .../python/python3-git/CVE-2026-76220.patch   | 65 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch
new file mode 100644
index 0000000000..1a42e7cf04
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch
@@ -0,0 +1,65 @@
+From 8f29b889df8dff1c1227dafabac0f49306d45838 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sun, 2 Aug 2026 08:59:57 +0000
+Subject: [PATCH] Check joined short-option values before Git execution
+
+<!-- agent -->
+GHSA-wvpp-8hx9-p66j reports that unsafe-option checks omitted the value
+joined to a one-character option when split_single_char_options was false. A
+regression test reproduced the mismatch: GitPython checked only -n even though
+it emitted a joined -nVALUE token that Git parses as clustered short options.
+
+Collect the exact joined token for unsplit one-character keyword arguments so
+the existing clustered-short-option validation sees every option character.
+The split form and long-option behavior remain unchanged.
+
+A broader audit confirmed that all guarded keyword-forwarding APIs use
+_option_candidates, including clone, ls-remote, fetch, pull, push, archive,
+revision, diff, checkout-index, and tag paths. Git cf5497b14 confirms repeated
+short-option parsing within a joined token. Focused candidate and unsafe-option
+tests pass.
+
+CVE: CVE-2026-76220
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/96a888f4d782cb2f80452148e48e60ce4af6d541]
+
+Backport Changes:
+- Omitted test/test_git.py because the current PyPI source archive
+  does not include the test suite and the python3-git recipe does
+  not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 96a888f4d782cb2f80452148e48e60ce4af6d541)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 2ce27290..de68fa34 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -809,13 +809,21 @@ Git._option_candidates
+                 values = value if isinstance(value, (list, tuple)) else (value,)
+                 if any(value is True or (value is not False and value is not None) for value in values):
+                     key = str(key)
+-                    options.append(f"-{key}" if len(key) == 1 else f"--{dashify(key)}")
+-                    if len(key) == 1 and split_single_char_options:
++                    if len(key) != 1:
++                        options.append(f"--{dashify(key)}")
++                    elif split_single_char_options:
++                        options.append(f"-{key}")
+                         options.extend(
+                             str(value)
+                             for value in values
+                             if value is not True and value not in (False, None) and str(value).startswith("-")
+                         )
++                    else:
++                        options.extend(
++                            f"-{key}" if value is True else f"-{key}{value}"
++                            for value in values
++                            if value is True or (value is not False and value is not None)
++                        )
+         return options
+ 
+     class AutoInterrupt:
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 42d251a2df..4a3d516244 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73619_p1.patch \
            file://CVE-2026-73619_p2.patch \
            file://CVE-2026-76221.patch \
+           file://CVE-2026-76220.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

